const express = require('express');
const router = express.Router();
const { body, validationResult } = require('express-validator');
const User = require('../models/User');
const Profile = require('../models/Profile');
const { authenticate, authorize } = require('../middleware/auth');
const upload = require('../middleware/upload');
const { successResponse, errorResponse, getPagination } = require('../utils/helpers');

// @route   GET /api/users
// @desc    Get all users (Admin only)
// @access  Private/Admin/Employee
router.get('/', authenticate, authorize('admin', 'employee'), async (req, res) => {
    try {
        const { page, limit, role, search } = req.query;
        const { limit: limitNum, offset, page: pageNum } = getPagination(page, limit);

        const result = await User.findAllWithProfile({
            limit: limitNum,
            offset,
            role,
            search
        });

        res.json(successResponse(result, 'Users retrieved successfully', {
            pagination: {
                page: pageNum,
                limit: limitNum,
                total: result.total,
                pages: result.pages
            }
        }));
    } catch (error) {
        console.error('Get users error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   GET /api/users/profile
// @desc    Get current user profile
// @access  Private
router.get('/profile', authenticate, async (req, res) => {
    try {
        const profile = await Profile.findByUserId(req.user.id);

        if (!profile) {
            return res.status(404).json(errorResponse('Profile not found', 404));
        }

        res.json(successResponse(profile, 'Profile retrieved successfully'));
    } catch (error) {
        console.error('Get profile error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   PUT /api/users/profile
// @desc    Update current user profile
// @access  Private
router.put('/profile', authenticate, upload.single('profile_image'), [
    body('first_name').optional().notEmpty().withMessage('First name cannot be empty'),
    body('last_name').optional().notEmpty().withMessage('Last name cannot be empty'),
    body('phone').optional().matches(/^\+?[\d\s-()]+$/).withMessage('Invalid phone number')
], async (req, res) => {
    try {
        const errors = validationResult(req);
        if (!errors.isEmpty()) return res.status(400).json(errorResponse('Validation failed', 400, errors.array()));

        const updateData = { ...req.body };

        // Handle profile_image_url if provided (for default avatars)
        if (req.body.profile_image_url) {
            updateData.profile_image_url = req.body.profile_image_url;
        }
        // Add profile image URL if uploaded
        if (req.file) {
            updateData.profile_image_url = `/uploads/${req.file.filename}`;
        }

        const profile = await Profile.update(req.user.id, updateData);

        res.json(successResponse(profile, 'Profile updated successfully'));
    } catch (error) {
        console.error('Update profile error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   GET /api/users/stats
// @desc    Get current user statistics
// @access  Private
router.get('/stats', authenticate, async (req, res) => {
    try {
        const stats = await Profile.getUserStats(req.user.id);
        res.json(successResponse(stats, 'User stats retrieved successfully'));
    } catch (error) {
        console.error('Get stats error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   GET /api/users/:id
// @desc    Get user by ID
// @access  Private/Admin/Employee
router.get('/:id', authenticate, authorize('admin', 'employee'), async (req, res) => {
    try {
        const user = await User.findByIdWithProfile(req.params.id); // Modified to fetch profile data
        const profile = await Profile.findByUserId(req.params.id);

        if (!user || !profile) {
            return res.status(404).json(errorResponse('User not found', 404));
        }

        res.json(successResponse({ user, profile }, 'User retrieved successfully'));
    } catch (error) {
        console.error('Get user error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   PUT /api/users/:id
// @desc    Update user by ID (Admin only)
// @access  Private/Admin
router.put('/:id', authenticate, authorize('admin'), [
    body('email').optional().isEmail().withMessage('Invalid email'),
    body('role').optional().isIn(['client', 'employee', 'admin']).withMessage('Invalid role')
], async (req, res) => {
    try {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json(errorResponse('Validation failed', 400, errors.array()));
        }

        const user = await User.update(req.params.id, req.body);

        if (!user) {
            return res.status(404).json(errorResponse('User not found', 404));
        }

        res.json(successResponse(user, 'User updated successfully'));
    } catch (error) {
        console.error('Update user error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   DELETE /api/users/:id
// @desc    Delete user by ID (Admin only)
// @access  Private/Admin
router.delete('/:id', authenticate, authorize('admin'), async (req, res) => {
    try {
        // Prevent self-deletion
        if (req.params.id === req.user.id) {
            return res.status(400).json(errorResponse('Cannot delete your own account', 400));
        }

        const user = await User.delete(req.params.id);

        if (!user) {
            return res.status(404).json(errorResponse('User not found', 404));
        }

        res.json(successResponse(null, 'User deleted successfully'));
    } catch (error) {
        console.error('Delete user error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   GET /api/users/:id/contracts
// @desc    Get user's contracts
// @access  Private
router.get('/:id/contracts', authenticate, async (req, res) => {
    try {
        // Check authorization
        if (req.params.id !== req.user.id && req.user.role !== 'admin' && req.user.role !== 'employee') {
            return res.status(403).json(errorResponse('Insufficient permissions', 403));
        }

        const Contract = require('../models/Contract');
        const contracts = await Contract.findByClientId(req.params.id);

        res.json(successResponse(contracts, 'Contracts retrieved successfully'));
    } catch (error) {
        console.error('Get contracts error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   GET /api/users/:id/incidents
// @desc    Get user's incidents
// @access  Private
router.get('/:id/incidents', authenticate, async (req, res) => {
    try {
        // Check authorization
        if (req.params.id !== req.user.id && req.user.role !== 'admin' && req.user.role !== 'employee') {
            return res.status(403).json(errorResponse('Insufficient permissions', 403));
        }

        const Incident = require('../models/Incident');
        const incidents = await Incident.findByClientId(req.params.id);

        res.json(successResponse(incidents, 'Incidents retrieved successfully'));
    } catch (error) {
        console.error('Get incidents error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

module.exports = router;
