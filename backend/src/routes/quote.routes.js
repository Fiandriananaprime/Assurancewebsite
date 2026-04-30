const express = require('express');
const router = express.Router();
const { body, validationResult } = require('express-validator');
const Quote = require('../models/Quote');
const { authenticate, authorize } = require('../middleware/auth');
const { successResponse, errorResponse, getPagination } = require('../utils/helpers');

// @route   POST /api/quotes
// @desc    Create a new quote
// @access  Private
router.post('/', authenticate, [
    body('type').isIn(['auto', 'habitation', 'sante', 'moto']).withMessage('Invalid contract type'),
    body('amount').isFloat({ min: 0 }).withMessage('Amount must be a positive number'),
    body('deductible').optional().isFloat({ min: 0 }).withMessage('Deductible must be a positive number'),
    body('coverage_details').notEmpty().withMessage('Coverage details are required')
], async (req, res) => {
    try {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json(errorResponse('Validation failed', 400, errors.array()));
        }

        // Allow employees/admins to create quotes for a specified client_id.
        // Clients will have their own id set automatically.
        let clientId;
        if (req.user.role === 'client') {
            clientId = req.user.id;
        } else {
            // employee/admin can specify client_id in body
            clientId = req.body.client_id;
            if (!clientId) {
                return res.status(400).json(errorResponse('client_id is required when creating a quote as employee/admin', 400));
            }
        }

        const quoteData = {
            ...req.body,
            client_id: clientId
        };

        const quote = await Quote.create(quoteData);
        res.status(201).json(successResponse(quote, 'Quote created successfully'));
    } catch (error) {
        console.error('Create quote error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   GET /api/quotes
// @desc    Get all quotes (with filters)
// @access  Private
router.get('/', authenticate, async (req, res) => {
    try {
        const { page, limit, status, type, search } = req.query;
        const { limit: limitNum, offset, page: pageNum } = getPagination(page, limit);

        // Clients can only see their own quotes
        const clientId = req.user.role === 'client' ? req.user.id : undefined;

        const result = await Quote.findAll({
            limit: limitNum,
            offset,
            status,
            type,
            clientId,
            search
        });

        res.json(successResponse(result, 'Quotes retrieved successfully', {
            pagination: {
                page: pageNum,
                limit: limitNum,
                total: result.total,
                pages: result.pages
            }
        }));
    } catch (error) {
        console.error('Get quotes error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   GET /api/quotes/my-quotes
// @desc    Get current user's quotes
// @access  Private
router.get('/my-quotes', authenticate, async (req, res) => {
    try {
        const quotes = await Quote.findByClientId(req.user.id);
        res.json(successResponse(quotes, 'Quotes retrieved successfully'));
    } catch (error) {
        console.error('Get my quotes error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   GET /api/quotes/:id
// @desc    Get quote by ID
// @access  Private
router.get('/:id', authenticate, async (req, res) => {
    try {
        const quote = await Quote.findById(req.params.id);

        if (!quote) {
            return res.status(404).json(errorResponse('Quote not found', 404));
        }

        // Check authorization
        if (req.user.role === 'client' && quote.client_id !== req.user.id) {
            return res.status(403).json(errorResponse('Insufficient permissions', 403));
        }

        res.json(successResponse(quote, 'Quote retrieved successfully'));
    } catch (error) {
        console.error('Get quote error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   PUT /api/quotes/:id
// @desc    Update a quote
// @access  Private (Employee/Admin only for status changes)
router.put('/:id', authenticate, [
    body('amount').optional().isFloat({ min: 0 }).withMessage('Amount must be a positive number'),
    body('deductible').optional().isFloat({ min: 0 }).withMessage('Deductible must be a positive number')
], async (req, res) => {
    try {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json(errorResponse('Validation failed', 400, errors.array()));
        }

        const quote = await Quote.findById(req.params.id);

        if (!quote) {
            return res.status(404).json(errorResponse('Quote not found', 404));
        }

        // Check authorization
        if (req.user.role === 'client' && quote.client_id !== req.user.id) {
            return res.status(403).json(errorResponse('Insufficient permissions', 403));
        }

        // Only employees/admins can update certain fields
        const updateData = { ...req.body };
        if (req.user.role === 'client') {
            // Clients can only update vehicle/property details
            delete updateData.amount;
            delete updateData.deductible;
            delete updateData.coverage_details;
            delete updateData.status;
        }

        const updatedQuote = await Quote.update(req.params.id, updateData);
        res.json(successResponse(updatedQuote, 'Quote updated successfully'));
    } catch (error) {
        console.error('Update quote error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   PATCH /api/quotes/:id/status
// @desc    Update quote status
// @access  Private (Employee/Admin only)
router.patch('/:id/status', authenticate, authorize('employee', 'admin'), [
    body('status').isIn(['envoye', 'en_attente', 'accepte', 'refuse', 'expire']).withMessage('Invalid status')
], async (req, res) => {
    try {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json(errorResponse('Validation failed', 400, errors.array()));
        }

        const quote = await Quote.updateStatus(req.params.id, req.body.status);

        if (!quote) {
            return res.status(404).json(errorResponse('Quote not found', 404));
        }

        res.json(successResponse(quote, 'Quote status updated successfully'));
    } catch (error) {
        console.error('Update quote status error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   DELETE /api/quotes/:id
// @desc    Delete a quote
// @access  Private
router.delete('/:id', authenticate, async (req, res) => {
    try {
        const quote = await Quote.findById(req.params.id);

        if (!quote) {
            return res.status(404).json(errorResponse('Quote not found', 404));
        }

        // Check authorization
        if (req.user.role === 'client' && quote.client_id !== req.user.id) {
            return res.status(403).json(errorResponse('Insufficient permissions', 403));
        }

        await Quote.delete(req.params.id);
        res.json(successResponse(null, 'Quote deleted successfully'));
    } catch (error) {
        console.error('Delete quote error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

module.exports = router;