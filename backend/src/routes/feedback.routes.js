const express = require('express');
const router = express.Router();
const { body, validationResult } = require('express-validator');
const Feedback = require('../models/Feedback');
const { authenticate, authorize } = require('../middleware/auth');
const { successResponse, errorResponse, getPagination } = require('../utils/helpers');

// @route   POST /api/feedbacks
// @desc    Create a new feedback
// @access  Private
router.post('/', authenticate, [
    body('subject').notEmpty().withMessage('Subject is required'),
    body('message').notEmpty().withMessage('Message is required'),
    body('rating').optional().isInt({ min: 0, max: 5 }).withMessage('Rating must be between 0 and 5'),
    body('category').optional().notEmpty().withMessage('Category cannot be empty'),
    body('public_quote').optional().isBoolean().withMessage('Public quote must be boolean')
], async (req, res) => {
    try {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json(errorResponse('Validation failed', 400, errors.array()));
        }

        const feedbackData = {
            ...req.body,
            client_id: req.user.id
        };

        const feedback = await Feedback.create(feedbackData);
        res.status(201).json(successResponse(feedback, 'Feedback submitted successfully'));
    } catch (error) {
        console.error('Create feedback error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   GET /api/feedbacks
// @desc    Get all feedbacks (with filters)
// @access  Private
router.get('/', authenticate, async (req, res) => {
    try {
        const { page, limit, status, category, search, clientId: requestedClientId } = req.query;
        const { limit: limitNum, offset, page: pageNum } = getPagination(page, limit);

        let clientId;
        if (req.user.role === 'client') {
            clientId = req.user.id;
        } else if (requestedClientId) {
            clientId = requestedClientId;
        }

        const result = await Feedback.findAll({
            limit: limitNum,
            offset,
            status,
            category,
            search,
            clientId
        });

        res.json(successResponse(result, 'Feedbacks retrieved successfully', {
            pagination: {
                page: pageNum,
                limit: limitNum,
                total: result.total,
                pages: result.pages
            }
        }));
    } catch (error) {
        console.error('Get feedbacks error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   GET /api/feedbacks/my-feedbacks
// @desc    Get current user's feedbacks
// @access  Private
router.get('/my-feedbacks', authenticate, async (req, res) => {
    try {
        const feedbacks = await Feedback.findByClientId(req.user.id);
        res.json(successResponse(feedbacks, 'Feedbacks retrieved successfully'));
    } catch (error) {
        console.error('Get my feedbacks error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   GET /api/feedbacks/public
// @desc    Get public feedbacks for landing page
// @access  Public
router.get('/public/landing', async (req, res) => {
    try {
        const { limit = 10 } = req.query;
        const feedbacks = await Feedback.getPublicFeedbacks(parseInt(limit));
        res.json(successResponse(feedbacks, 'Public feedbacks retrieved successfully'));
    } catch (error) {
        console.error('Get public feedbacks error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   GET /api/feedbacks/stats/overview
// @desc    Get feedback statistics
// @access  Private (Employee/Admin only)
router.get('/stats/overview', authenticate, authorize('employee', 'admin'), async (req, res) => {
    try {
        const stats = await Feedback.getStats();
        res.json(successResponse(stats, 'Feedback statistics retrieved successfully'));
    } catch (error) {
        console.error('Get feedback stats error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   GET /api/feedbacks/:id
// @desc    Get feedback by ID
// @access  Private
router.get('/:id', authenticate, async (req, res) => {
    try {
        const feedback = await Feedback.findById(req.params.id);

        if (!feedback) {
            return res.status(404).json(errorResponse('Feedback not found', 404));
        }

        // Check authorization
        if (req.user.role === 'client' && feedback.client_id !== req.user.id) {
            return res.status(403).json(errorResponse('Insufficient permissions', 403));
        }

        res.json(successResponse(feedback, 'Feedback retrieved successfully'));
    } catch (error) {
        console.error('Get feedback error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   PUT /api/feedbacks/:id
// @desc    Update a feedback
// @access  Private (Employee/Admin only for status changes)
router.put('/:id', authenticate, async (req, res) => {
    try {
        const feedback = await Feedback.findById(req.params.id);

        if (!feedback) {
            return res.status(404).json(errorResponse('Feedback not found', 404));
        }

        // Check authorization
        if (req.user.role === 'client' && feedback.client_id !== req.user.id) {
            return res.status(403).json(errorResponse('Insufficient permissions', 403));
        }

        // Only employees/admins can update status
        const updateData = { ...req.body };
        if (req.user.role === 'client') {
            delete updateData.status;
            delete updateData.is_responded;
        }

        const updatedFeedback = await Feedback.update(req.params.id, updateData);
        res.json(successResponse(updatedFeedback, 'Feedback updated successfully'));
    } catch (error) {
        console.error('Update feedback error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   PATCH /api/feedbacks/:id/status
// @desc    Update feedback status
// @access  Private (Employee/Admin only)
router.patch('/:id/status', authenticate, authorize('employee', 'admin'), [
    body('status').isIn(['nouveau', 'en_cours', 'traite', 'urgent']).withMessage('Invalid status')
], async (req, res) => {
    try {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json(errorResponse('Validation failed', 400, errors.array()));
        }

        const feedback = await Feedback.updateStatus(req.params.id, req.body.status);

        if (!feedback) {
            return res.status(404).json(errorResponse('Feedback not found', 404));
        }

        res.json(successResponse(feedback, 'Feedback status updated successfully'));
    } catch (error) {
        console.error('Update feedback status error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   DELETE /api/feedbacks/:id
// @desc    Delete a feedback
// @access  Private (Employee/Admin only)
router.delete('/:id', authenticate, authorize('employee', 'admin'), async (req, res) => {
    try {
        const feedback = await Feedback.delete(req.params.id);

        if (!feedback) {
            return res.status(404).json(errorResponse('Feedback not found', 404));
        }

        res.json(successResponse(null, 'Feedback deleted successfully'));
    } catch (error) {
        console.error('Delete feedback error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

module.exports = router;
