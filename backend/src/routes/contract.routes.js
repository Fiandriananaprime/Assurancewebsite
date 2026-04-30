const express = require('express');
const router = express.Router();
const { body, validationResult } = require('express-validator');
const Contract = require('../models/Contract');
const Quote = require('../models/Quote');
const { authenticate, authorize } = require('../middleware/auth');
const { successResponse, errorResponse, getPagination } = require('../utils/helpers');
const { getIO } = require('../config/socket');

// @route   POST /api/contracts
// @desc    Create a new contract
// @access  Private (Employee/Admin only)
router.post('/', authenticate, authorize('employee', 'admin'), [
    body('type').isIn(['auto', 'habitation', 'sante', 'moto']).withMessage('Invalid contract type'),
    body('client_id').isUUID().withMessage('Invalid client ID'),
    body('start_date').isDate().withMessage('Invalid start date'),
    body('end_date').isDate().withMessage('Invalid end date'),
    body('annual_amount').isFloat({ min: 0 }).withMessage('Annual amount must be a positive number'),
    body('deductible').isFloat({ min: 0 }).withMessage('Deductible must be a positive number'),
    body('coverage').notEmpty().withMessage('Coverage is required')
], async (req, res) => {
    try {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json(errorResponse('Validation failed', 400, errors.array()));
        }

        const contract = await Contract.create(req.body);

        // Notify employees about new contract
        try {
            const io = getIO();
            // Notify employees about the new contract
            io.to('role_employee').emit('notification', {
                type: 'new_contract',
                contract: {
                    id: contract.id,
                    type: contract.type,
                    policy_number: contract.policy_number,
                    client_id: contract.client_id
                },
                createdAt: contract.created_at || new Date().toISOString()
            });

            // Also notify the specific client so their dashboard can refresh in real-time
            try {
                io.to(`user_${contract.client_id}`).emit('contract_created', {
                    contract: {
                        id: contract.id,
                        type: contract.type,
                        policy_number: contract.policy_number,
                        client_id: contract.client_id,
                        start_date: contract.start_date,
                        end_date: contract.end_date,
                        annual_amount: contract.annual_amount,
                        status: contract.status
                    },
                    createdAt: contract.created_at || new Date().toISOString()
                });
            } catch (e) {
                // best-effort notify client
                console.warn('Failed to emit contract_created to client room', e);
            }
        } catch (err) {
            console.warn('Socket not initialized, skipping contract notification');
        }
        res.status(201).json(successResponse(contract, 'Contract created successfully'));
    } catch (error) {
        console.error('Create contract error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   POST /api/contracts/from-quote
// @desc    Create a contract from an existing quote
// @access  Private
router.post('/from-quote', authenticate, [
    body('quote_id').isUUID().withMessage('Invalid quote ID'),
    body('start_date').isDate().withMessage('Invalid start date'),
    body('payment_method').optional().notEmpty().withMessage('Payment method cannot be empty')
], async (req, res) => {
    try {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json(errorResponse('Validation failed', 400, errors.array()));
        }

        const quote = await Quote.findById(req.body.quote_id);
        if (!quote) {
            return res.status(404).json(errorResponse('Quote not found', 404));
        }

        if (req.user.role === 'client' && quote.client_id !== req.user.id) {
            return res.status(403).json(errorResponse('Insufficient permissions', 403));
        }

        const startDate = new Date(req.body.start_date);
        const endDate = new Date(startDate);
        endDate.setFullYear(endDate.getFullYear() + 1);

        let coverage = quote.coverage_details;
        if (coverage && typeof coverage === 'object') {
            coverage = coverage.coverage || JSON.stringify(coverage);
        }
        if (!coverage) {
            coverage = 'standard';
        }

        const contract = await Contract.create({
            client_id: quote.client_id,
            quote_id: quote.id,
            type: quote.type,
            start_date: startDate.toISOString().slice(0, 10),
            end_date: endDate.toISOString().slice(0, 10),
            annual_amount: quote.amount,
            deductible: quote.deductible || 0,
            coverage,
            payment_method: req.body.payment_method || 'mensuel',
            vehicle_info: quote.vehicle_details || {},
            property_info: quote.property_details || {}
        });

        await Quote.updateStatus(quote.id, 'accepte');

        try {
            const io = getIO();
            // Notify employees about the new contract
            io.to('role_employee').emit('notification', {
                type: 'new_contract',
                contract: {
                    id: contract.id,
                    type: contract.type,
                    policy_number: contract.policy_number,
                    client_id: contract.client_id
                },
                createdAt: contract.created_at || new Date().toISOString()
            });

            // Also notify the client specifically
            try {
                io.to(`user_${contract.client_id}`).emit('contract_created', {
                    contract: {
                        id: contract.id,
                        type: contract.type,
                        policy_number: contract.policy_number,
                        client_id: contract.client_id,
                        start_date: contract.start_date,
                        end_date: contract.end_date,
                        annual_amount: contract.annual_amount,
                        status: contract.status
                    },
                    createdAt: contract.created_at || new Date().toISOString()
                });
            } catch (e) {
                console.warn('Failed to emit contract_created to client room', e);
            }
        } catch (err) {
            console.warn('Socket not initialized, skipping contract notification');
        }

        res.status(201).json(successResponse(contract, 'Contract created successfully from quote'));
    } catch (error) {
        console.error('Create contract from quote error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   GET /api/contracts
// @desc    Get all contracts (with filters)
// @access  Private
router.get('/', authenticate, async (req, res) => {
    try {
        const { page, limit, status, type, search } = req.query;
        const { limit: limitNum, offset, page: pageNum } = getPagination(page, limit);

        // Clients can only see their own contracts
        const clientId = req.user.role === 'client' ? req.user.id : undefined;

        const result = await Contract.findAll({
            limit: limitNum,
            offset,
            status,
            type,
            clientId,
            search
        });

        res.json(successResponse(result, 'Contracts retrieved successfully', {
            pagination: {
                page: pageNum,
                limit: limitNum,
                total: result.total,
                pages: result.pages
            }
        }));
    } catch (error) {
        console.error('Get contracts error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   GET /api/contracts/my-contracts
// @desc    Get current user's contracts
// @access  Private
router.get('/my-contracts', authenticate, async (req, res) => {
    try {
        const contracts = await Contract.findByClientId(req.user.id);
        res.json(successResponse(contracts, 'Contracts retrieved successfully'));
    } catch (error) {
        console.error('Get my contracts error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   GET /api/contracts/active
// @desc    Get current user's active contracts
// @access  Private
router.get('/active', authenticate, async (req, res) => {
    try {
        const contracts = await Contract.findActiveByClientId(req.user.id);
        res.json(successResponse(contracts, 'Active contracts retrieved successfully'));
    } catch (error) {
        console.error('Get active contracts error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   GET /api/contracts/stats
// @desc    Get contract statistics
// @access  Private (Employee/Admin only)
router.get('/stats/overview', authenticate, authorize('employee', 'admin'), async (req, res) => {
    try {
        const stats = await Contract.getStats();
        res.json(successResponse(stats, 'Contract statistics retrieved successfully'));
    } catch (error) {
        console.error('Get contract stats error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   GET /api/contracts/:id
// @desc    Get contract by ID
// @access  Private
router.get('/:id', authenticate, async (req, res) => {
    try {
        const contract = await Contract.findById(req.params.id);

        if (!contract) {
            return res.status(404).json(errorResponse('Contract not found', 404));
        }

        // Check authorization
        if (req.user.role === 'client' && contract.client_id !== req.user.id) {
            return res.status(403).json(errorResponse('Insufficient permissions', 403));
        }

        res.json(successResponse(contract, 'Contract retrieved successfully'));
    } catch (error) {
        console.error('Get contract error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   GET /api/contracts/policy/:policyNumber
// @desc    Get contract by policy number
// @access  Private
router.get('/policy/:policyNumber', authenticate, async (req, res) => {
    try {
        const contract = await Contract.findByPolicyNumber(req.params.policyNumber);

        if (!contract) {
            return res.status(404).json(errorResponse('Contract not found', 404));
        }

        // Check authorization
        if (req.user.role === 'client' && contract.client_id !== req.user.id) {
            return res.status(403).json(errorResponse('Insufficient permissions', 403));
        }

        res.json(successResponse(contract, 'Contract retrieved successfully'));
    } catch (error) {
        console.error('Get contract by policy error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   PUT /api/contracts/:id
// @desc    Update a contract
// @access  Private (Employee/Admin only)
router.put('/:id', authenticate, authorize('employee', 'admin'), [
    body('annual_amount').optional().isFloat({ min: 0 }).withMessage('Annual amount must be a positive number'),
    body('deductible').optional().isFloat({ min: 0 }).withMessage('Deductible must be a positive number')
], async (req, res) => {
    try {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json(errorResponse('Validation failed', 400, errors.array()));
        }

        const contract = await Contract.update(req.params.id, req.body);

        if (!contract) {
            return res.status(404).json(errorResponse('Contract not found', 404));
        }

        res.json(successResponse(contract, 'Contract updated successfully'));
    } catch (error) {
        console.error('Update contract error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   PATCH /api/contracts/:id/status
// @desc    Update contract status
// @access  Private (Employee/Admin only)
router.patch('/:id/status', authenticate, authorize('employee', 'admin'), [
    body('status').isIn(['actif', 'expire', 'en_attente', 'annule']).withMessage('Invalid status')
], async (req, res) => {
    try {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json(errorResponse('Validation failed', 400, errors.array()));
        }

        const contract = await Contract.updateStatus(req.params.id, req.body.status);

        if (!contract) {
            return res.status(404).json(errorResponse('Contract not found', 404));
        }

        res.json(successResponse(contract, 'Contract status updated successfully'));
    } catch (error) {
        console.error('Update contract status error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   POST /api/contracts/:id/renew
// @desc    Renew a contract
// @access  Private (Employee/Admin only)
router.post('/:id/renew', authenticate, authorize('employee', 'admin'), [
    body('new_end_date').isDate().withMessage('Invalid end date')
], async (req, res) => {
    try {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json(errorResponse('Validation failed', 400, errors.array()));
        }

        const newContract = await Contract.renew(req.params.id, req.body.new_end_date);
        res.status(201).json(successResponse(newContract, 'Contract renewed successfully'));
    } catch (error) {
        console.error('Renew contract error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   DELETE /api/contracts/:id
// @desc    Delete a contract
// @access  Private (Employee/Admin only)
router.delete('/:id', authenticate, authorize('employee', 'admin'), async (req, res) => {
    try {
        const contract = await Contract.delete(req.params.id);

        if (!contract) {
            return res.status(404).json(errorResponse('Contract not found', 404));
        }

        res.json(successResponse(null, 'Contract deleted successfully'));
    } catch (error) {
        console.error('Delete contract error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

module.exports = router;
