const express = require('express');
const router = express.Router();
const { body, validationResult } = require('express-validator');
const Incident = require('../models/Incident');
const { authenticate, authorize } = require('../middleware/auth');
const { successResponse, errorResponse, getPagination } = require('../utils/helpers');
const { getIO } = require('../config/socket');

// @route   POST /api/incidents
// @desc    Create a new incident
// @access  Private
router.post('/', authenticate, [
  body('contract_id').isUUID().withMessage('Invalid contract ID'),
  body('title').notEmpty().withMessage('Title is required'),
  body('description').notEmpty().withMessage('Description is required'),
  body('date').isDate().withMessage('Invalid date'),
  body('type').isIn(['auto', 'habitation', 'sante', 'moto']).withMessage('Invalid incident type'),
  body('location').optional().notEmpty().withMessage('Location cannot be empty'),
  body('estimated_cost').optional().isFloat({ min: 0 }).withMessage('Estimated cost must be positive')
], async (req, res) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json(errorResponse('Validation failed', 400, errors.array()));
    }

    const incidentData = {
      ...req.body,
      client_id: req.user.id
    };

    const incident = await Incident.create(incidentData);
    // Emit notification to employees about the new incident
    try {
      const io = getIO();
      io.to('role_employee').emit('notification', {
        type: 'new_incident',
        incident: {
          id: incident.id,
          title: incident.title,
          contract_id: incident.contract_id,
          status: incident.status
        },
        client: { id: incident.client_id },
        createdAt: incident.created_at || new Date().toISOString()
      });
    } catch (err) {
      console.warn('Socket not initialized, skipping incident notification');
    }
    res.status(201).json(successResponse(incident, 'Incident created successfully'));
  } catch (error) {
    console.error('Create incident error:', error);
    res.status(500).json(errorResponse('Server error', 500));
  }
});

// @route   GET /api/incidents
// @desc    Get all incidents (with filters)
// @access  Private
router.get('/', authenticate, async (req, res) => {
  try {
    const { page, limit, status, severity, type, search, assignedToMe } = req.query;
    const { limit: limitNum, offset, page: pageNum } = getPagination(page, limit);

    // Clients can only see their own incidents
    const clientId = req.user.role === 'client' ? req.user.id : undefined;

    // Employees can optionally filter to incidents assigned to them.
    const assignedEmployeeId = (req.user.role === 'employee' && assignedToMe === 'true') ? req.user.id : undefined;

    const result = await Incident.findAll({
      limit: limitNum,
      offset,
      status,
      severity,
      type,
      clientId,
      assignedEmployeeId,
      search
    });

    res.json(successResponse(result, 'Incidents retrieved successfully', {
      pagination: {
        page: pageNum,
        limit: limitNum,
        total: result.total,
        pages: result.pages
      }
    }));
  } catch (error) {
    console.error('Get incidents error:', error);
    res.status(500).json(errorResponse('Server error', 500));
  }
});

// @route   GET /api/incidents/my-incidents
// @desc    Get current user's incidents
// @access  Private
router.get('/my-incidents', authenticate, async (req, res) => {
  try {
    const incidents = await Incident.findByClientId(req.user.id);
    res.json(successResponse(incidents, 'Incidents retrieved successfully'));
  } catch (error) {
    console.error('Get my incidents error:', error);
    res.status(500).json(errorResponse('Server error', 500));
  }
});

// @route   GET /api/incidents/stats/overview
// @desc    Get incident statistics
// @access  Private (Employee/Admin only)
router.get('/stats/overview', authenticate, authorize('employee', 'admin'), async (req, res) => {
  try {
    const stats = await Incident.getStats();
    res.json(successResponse(stats, 'Incident statistics retrieved successfully'));
  } catch (error) {
    console.error('Get incident stats error:', error);
    res.status(500).json(errorResponse('Server error', 500));
  }
});

// @route   GET /api/incidents/:id
// @desc    Get incident by ID
// @access  Private
router.get('/:id', authenticate, async (req, res) => {
  try {
    const incident = await Incident.findById(req.params.id);

    if (!incident) {
      return res.status(404).json(errorResponse('Incident not found', 404));
    }

    // Check authorization
    if (req.user.role === 'client' && incident.client_id !== req.user.id) {
      return res.status(403).json(errorResponse('Insufficient permissions', 403));
    }

    res.json(successResponse(incident, 'Incident retrieved successfully'));
  } catch (error) {
    console.error('Get incident error:', error);
    res.status(500).json(errorResponse('Server error', 500));
  }
});

// @route   PUT /api/incidents/:id
// @desc    Update an incident
// @access  Private
router.put('/:id', authenticate, [
  body('title').optional().notEmpty().withMessage('Title cannot be empty'),
  body('description').optional().notEmpty().withMessage('Description cannot be empty'),
  body('estimated_cost').optional().isFloat({ min: 0 }).withMessage('Estimated cost must be positive')
], async (req, res) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json(errorResponse('Validation failed', 400, errors.array()));
    }

    const incident = await Incident.findById(req.params.id);

    if (!incident) {
      return res.status(404).json(errorResponse('Incident not found', 404));
    }

    // Check authorization
    if (req.user.role === 'client' && incident.client_id !== req.user.id) {
      return res.status(403).json(errorResponse('Insufficient permissions', 403));
    }

    // Clients can only update certain fields
    const updateData = { ...req.body };
    if (req.user.role === 'client') {
      delete updateData.status;
      delete updateData.severity;
      delete updateData.assigned_employee_id;
    }

    const updatedIncident = await Incident.update(req.params.id, updateData);
    res.json(successResponse(updatedIncident, 'Incident updated successfully'));
  } catch (error) {
    console.error('Update incident error:', error);
    res.status(500).json(errorResponse('Server error', 500));
  }
});

// @route   PATCH /api/incidents/:id/status
// @desc    Update incident status
// @access  Private (Employee/Admin only)
router.patch('/:id/status', authenticate, authorize('employee', 'admin'), [
  body('status').isIn(['en_cours', 'traite', 'en_attente']).withMessage('Invalid status'),
  body('severity').optional().isIn(['leger', 'moyen', 'eleve']).withMessage('Invalid severity')
], async (req, res) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json(errorResponse('Validation failed', 400, errors.array()));
    }

    const incident = await Incident.update(req.params.id, req.body);

    if (!incident) {
      return res.status(404).json(errorResponse('Incident not found', 404));
    }

    res.json(successResponse(incident, 'Incident status updated successfully'));
  } catch (error) {
    console.error('Update incident status error:', error);
    res.status(500).json(errorResponse('Server error', 500));
  }
});

// @route   POST /api/incidents/:id/assign
// @desc    Assign incident to employee
// @access  Private (Admin only)
router.post('/:id/assign', authenticate, authorize('admin'), [
  body('employee_id').isUUID().withMessage('Invalid employee ID')
], async (req, res) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json(errorResponse('Validation failed', 400, errors.array()));
    }

    const incident = await Incident.assignToEmployee(req.params.id, req.body.employee_id);

    if (!incident) {
      return res.status(404).json(errorResponse('Incident not found', 404));
    }

    res.json(successResponse(incident, 'Incident assigned successfully'));
  } catch (error) {
    console.error('Assign incident error:', error);
    res.status(500).json(errorResponse('Server error', 500));
  }
});

// @route   DELETE /api/incidents/:id
// @desc    Delete an incident
// @access  Private (Employee/Admin only)
router.delete('/:id', authenticate, authorize('employee', 'admin'), async (req, res) => {
  try {
    const incident = await Incident.delete(req.params.id);

    if (!incident) {
      return res.status(404).json(errorResponse('Incident not found', 404));
    }

    res.json(successResponse(null, 'Incident deleted successfully'));
  } catch (error) {
    console.error('Delete incident error:', error);
    res.status(500).json(errorResponse('Server error', 500));
  }
});

module.exports = router;
