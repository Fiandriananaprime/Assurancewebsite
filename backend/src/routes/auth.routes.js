const express = require('express');
const router = express.Router();
const jwt = require('jsonwebtoken');
const { body, validationResult } = require('express-validator');
const User = require('../models/User');
const Profile = require('../models/Profile');
const { authenticate } = require('../middleware/auth');
const { successResponse, errorResponse } = require('../utils/helpers');
const { getIO } = require('../config/socket');

// Generate JWT tokens
const generateTokens = (user) => {
    const accessToken = jwt.sign(
        { id: user.id, email: user.email, role: user.role },
        process.env.JWT_SECRET,
        { expiresIn: process.env.JWT_EXPIRES_IN || '7d' }
    );

    const refreshToken = jwt.sign(
        { id: user.id },
        process.env.JWT_REFRESH_SECRET,
        { expiresIn: process.env.JWT_REFRESH_EXPIRES_IN || '30d' }
    );

    return { accessToken, refreshToken };
};

// @route   POST /api/auth/register
// @desc    Register a new user (client)
// @access  Public
router.post('/register', [
    body('email').isEmail().withMessage('Please provide a valid email'),
    body('password').isLength({ min: 6 }).withMessage('Password must be at least 6 characters'),
    body('first_name').notEmpty().withMessage('First name is required'),
    body('last_name').notEmpty().withMessage('Last name is required')
], async (req, res) => {
    try {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json(errorResponse('Validation failed', 400, errors.array()));
        }

        const { email, password, first_name, last_name, phone, address, birth_date } = req.body;

        // Check if user already exists
        const existingUser = await User.findByEmail(email);
        if (existingUser) {
            return res.status(400).json(errorResponse('User already exists with this email', 400));
        }

        const role = email.trim().toLowerCase().endsWith('@assurance.com') ? 'employee' : 'client';
        // Create user
        const user = await User.create(email, password, role);

        // Create profile
        await Profile.create(user.id, {
            first_name,
            last_name,
            phone,
            address,
            birth_date
        });

        // Generate tokens
        const { accessToken, refreshToken } = generateTokens(user);

        // Notify employees about new client registration
        try {
            const io = getIO();
            io.to('role_employee').emit('notification', {
                type: 'new_registration',
                user: { id: user.id, email: user.email, first_name, last_name },
                createdAt: new Date().toISOString()
            });
        } catch (err) {
            // Socket may not be initialized in some environments (tests/dev)
            console.warn('Socket not initialized, skipping registration notification');
        }
        res.status(201).json(successResponse({
            user: {
                id: user.id,
                email: user.email,
                role: user.role
            },
            profile: {
                first_name,
                last_name
            }, // profile_image_url is not returned here, but will be fetched by /me
            // The frontend will update the profileImage from /me or from the settings page
            accessToken,
            refreshToken
        }, 'User registered successfully'));
    } catch (error) {
        console.error('Registration error:', error);
        res.status(500).json(errorResponse('Server error during registration', 500));
    }
});

// @route   POST /api/auth/login
// @desc    Login user
// @access  Public
router.post('/login', [
    body('email').isEmail().withMessage('Please provide a valid email'),
    body('password').notEmpty().withMessage('Password is required')
], async (req, res) => {
    try {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json(errorResponse('Validation failed', 400, errors.array()));
        }

        const { email, password } = req.body;

        // Find user
        const user = await User.findByEmail(email);
        if (!user) {
            return res.status(401).json(errorResponse('Invalid credentials', 401));
        }

        // Verify password
        const isMatch = await User.verifyPassword(password, user.password_hash);
        if (!isMatch) {
            return res.status(401).json(errorResponse('Invalid credentials', 401));
        }

        // Generate tokens
        const { accessToken, refreshToken } = generateTokens(user);

        // Get profile
        const profile = await Profile.findByUserId(user.id);

        // Merge user and profile data for convenience
        const authUser = {
            ...user,
            ...profile
        };
        res.json(successResponse({ // Changed to return merged user and profile
            user: {
                id: user.id,
                email: user.email,
                role: user.role
            },
            profile,
            accessToken,
            refreshToken,
            // Add profile image and name for frontend convenience
            profileImage: profile?.profile_image_url,
            name: profile ? `${profile.first_name} ${profile.last_name}` : user.email
        }, 'Login successful'));
    } catch (error) {
        console.error('Login error:', error);
        res.status(500).json(errorResponse('Server error during login', 500));
    }
});

// @route   POST /api/auth/refresh
// @desc    Refresh access token
// @access  Public
router.post('/refresh', async (req, res) => {
    try {
        const { refreshToken } = req.body;

        if (!refreshToken) {
            return res.status(401).json(errorResponse('Refresh token required', 401));
        }

        const decoded = jwt.verify(refreshToken, process.env.JWT_REFRESH_SECRET);
        const user = await User.findByEmail(decoded.email);

        if (!user) {
            return res.status(401).json(errorResponse('Invalid refresh token', 401));
        }

        const { accessToken, refreshToken: newRefreshToken } = generateTokens(user);

        res.json(successResponse({
            accessToken,
            refreshToken: newRefreshToken
        }, 'Token refreshed successfully'));
    } catch (error) {
        res.status(401).json(errorResponse('Invalid refresh token', 401));
    }
});

// @route   GET /api/auth/me
// @desc    Get current user
// @access  Private
router.get('/me', authenticate, async (req, res) => {
    try {
        const user = await User.findById(req.user.id);
        const profile = await Profile.findByUserId(req.user.id);

        // Merge user and profile data for convenience
        const authUser = {
            ...user,
            ...profile
        };
        res.json(successResponse({ // Changed to return merged user and profile
            user,
            profile
        }, 'User data retrieved successfully'));
    } catch (error) {
        console.error('Get user error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   PUT /api/auth/password
// @desc    Change password
// @access  Private
router.put('/password', authenticate, [
    body('currentPassword').notEmpty().withMessage('Current password is required'),
    body('newPassword').isLength({ min: 6 }).withMessage('New password must be at least 6 characters')
], async (req, res) => {
    try {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json(errorResponse('Validation failed', 400, errors.array()));
        }

        const { currentPassword, newPassword } = req.body;
        const user = await User.findById(req.user.id);

        // Verify current password
        const isMatch = await User.verifyPassword(currentPassword, user.password_hash);
        if (!isMatch) {
            return res.status(400).json(errorResponse('Current password is incorrect', 400));
        }

        // Update password
        await User.update(req.user.id, {
            password_hash: await require('bcryptjs').hash(newPassword, 12)
        });

        res.json(successResponse(null, 'Password updated successfully'));
    } catch (error) {
        console.error('Change password error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

module.exports = router;