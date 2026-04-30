const express = require('express');
const router = express.Router();
const { body, param, validationResult } = require('express-validator');
const validator = require('validator');
const Content = require('../models/Content');
const Event = require('../models/Event');
const { authenticate, authorize } = require('../middleware/auth');
const upload = require('../middleware/upload');
const { successResponse, errorResponse, getPagination } = require('../utils/helpers');
const fs = require('fs');
const path = require('path');

// @route   POST /api/content
// @desc    Create new content (blog post or event)
// @access  Private (Employee/Admin only)
router.post('/', authenticate, authorize('employee', 'admin'), upload.single('image'), [
    body('type').isIn(['blog', 'event']).withMessage('Type must be blog or event'),
    body('title').notEmpty().withMessage('Title is required'),
    body('content').notEmpty().withMessage('Content is required'),
    body('category').optional().notEmpty().withMessage('Category cannot be empty'),
    body('event_date').optional().isDate().withMessage('Invalid event date'),
    body('location').optional().notEmpty().withMessage('Location cannot be empty'),
    body('read_time').optional().notEmpty().withMessage('Read time cannot be empty')
], async (req, res) => {
    try {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json(errorResponse('Validation failed', 400, errors.array()));
        }

        const contentData = {
            ...req.body,
            author_id: req.user.id
        };

        // Add image URL if uploaded
        if (req.file) {
            contentData.image_url = `/uploads/${req.file.filename}`;
        }

        // If creating an event, store in events table via Event model
        if (contentData.type === 'event') {
            const ev = await Event.create(contentData);
            return res.status(201).json(successResponse(ev, 'Event created successfully'));
        }

        const content = await Content.create(contentData);
        res.status(201).json(successResponse(content, 'Content created successfully'));
    } catch (error) {
        console.error('Create content error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   GET /api/content/blog
// @desc    Get all blog posts
// @access  Public (published only) / Private (all for employees)
router.get('/blog', async (req, res) => {
    try {
        const { page, limit, status, category, search } = req.query;
        const { limit: limitNum, offset, page: pageNum } = getPagination(page, limit);

        // Public can only see published posts
        const publishedOnly = !req.user || req.user.role === 'client';

        const result = await Content.findBlogPosts({
            limit: limitNum,
            offset,
            status: publishedOnly ? undefined : status,
            category,
            search,
            publishedOnly
        });

        res.json(successResponse(result, 'Blog posts retrieved successfully', {
            pagination: {
                page: pageNum,
                limit: limitNum,
                total: result.total,
                pages: result.pages
            }
        }));
    } catch (error) {
        console.error('Get blog posts error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   GET /api/content/events
// @desc    Get all events
// @access  Public
router.get('/events', async (req, res) => {
    try {
        const { page, limit, status, upcomingOnly = true } = req.query;
        const { limit: limitNum, offset, page: pageNum } = getPagination(page, limit);

        const upcoming = upcomingOnly === 'true' || upcomingOnly === true;
        console.debug('Get events called with', { page, limit, status, upcomingOnly, limitNum, offset, pageNum, upcoming });

        const result = await Event.findAll({
            limit: limitNum,
            offset,
            status,
            upcomingOnly: upcoming
        });

        res.json(successResponse(result, 'Events retrieved successfully', {
            pagination: {
                page: pageNum,
                limit: limitNum,
                total: result.total,
                pages: result.pages
            }
        }));
    } catch (error) {
        console.error('Get events error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   GET /api/content/stats
// @desc    Get content statistics
// @access  Private (Employee/Admin only)
router.get('/stats/overview', authenticate, authorize('employee', 'admin'), async (req, res) => {
    try {
        const stats = await Content.getStats();
        res.json(successResponse(stats, 'Content statistics retrieved successfully'));
    } catch (error) {
        console.error('Get content stats error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   GET /api/content/:id
// @desc    Get content by ID
// @access  Public (published only) / Private (all)
router.get('/:id', [
    param('id').isUUID().withMessage('Invalid ID format')
], async (req, res) => {
    try {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            console.warn(`[Content API] Invalid ID format for GET: "${req.params.id}"`);
            return res.status(400).json(errorResponse('Invalid ID format: Expected a UUID', 400, errors.array()));
        }

        // Try to find the item in the content table first (for blogs)
        let content = await Content.findById(req.params.id);
        
        // If not found in content, check the events table
        if (!content) {
            content = await Event.findById(req.params.id);
        }

        if (!content) {
            return res.status(404).json(errorResponse('Content not found', 404));
        }

        // Check if content is published or user has access
        const isPrivileged = req.user && (req.user.role === 'employee' || req.user.role === 'admin');
        if (content.status !== 'publie' && !isPrivileged) {
            return res.status(403).json(errorResponse('Content not published', 403));
        }

        // Increment view count if it's a blog post
        if (content.type === 'blog' || !content.type) {
            await Content.incrementViews(req.params.id).catch(err => 
                console.warn('Could not increment views', err)
            );
        }

        res.json(successResponse(content, 'Content retrieved successfully'));
    } catch (error) {
        console.error('Get content error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   PUT /api/content/:id
// @desc    Update content
// @access  Private (Employee/Admin only)
router.put('/:id', authenticate, authorize('employee', 'admin'), upload.single('image'), [
    param('id').isUUID().withMessage('Invalid ID format'),
    body('title').optional().notEmpty().withMessage('Title cannot be empty'),
    body('content').optional().notEmpty().withMessage('Content cannot be empty'),
    body('category').optional().notEmpty().withMessage('Category cannot be empty'),
    body('event_date').optional().isDate().withMessage('Invalid event date'),
    body('location').optional().notEmpty().withMessage('Location cannot be empty'),
    body('read_time').optional().notEmpty().withMessage('Read time cannot be empty')
], async (req, res) => {
    try {
        const errors = validationResult(req);
            if (!errors.isEmpty()) {
                console.warn(`[Content API] Invalid ID format for PUT: "${req.params.id}"`);
                return res.status(400).json(errorResponse('Invalid ID format: Expected a UUID', 400, errors.array()));
            }

        const updateData = { ...req.body };

        if (req.file) {
            updateData.image_url = `/uploads/${req.file.filename}`;
        }

        // Attempt to update in the content table
        let content = await Content.update(req.params.id, updateData);
        
        // If not found in content, attempt to update in the events table
        if (!content) {
            content = await Event.update(req.params.id, updateData);
        }

        if (!content) {
            return res.status(404).json(errorResponse('Content not found', 404));
        }

        res.json(successResponse(content, 'Content updated successfully'));
    } catch (error) {
        console.error('Update content error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   DELETE /api/content/:id
// @desc    Delete content
// @access  Private (Employee/Admin only)
router.delete('/:id', authenticate, authorize('employee', 'admin'), [
    param('id').isUUID().withMessage('Invalid ID format')
], async (req, res) => {
    try {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            console.warn(`[Content API] Invalid ID format for DELETE: "${req.params.id}"`);
            return res.status(400).json(errorResponse('Invalid ID format: Expected a UUID', 400, errors.array()));
        }

        // 1. Chercher l'item dans les deux tables pour obtenir l'image_url
        let deletedItem = await Content.delete(req.params.id);
        
        if (!deletedItem) {
            deletedItem = await Event.delete(req.params.id);
        }

        if (!deletedItem) {
            return res.status(404).json(errorResponse('Content not found', 404));
        }

        // 2. Suppression physique du fichier si présent
        if (deletedItem.image_url) {
            // Construction du chemin : image_url est "/uploads/nom.jpg"
            // On part de la racine du backend (process.cwd())
            const filePath = path.join(process.cwd(), deletedItem.image_url.replace(/^\//, ''));
            
            fs.access(filePath, fs.constants.F_OK, (err) => {
                if (!err) {
                    fs.unlink(filePath, (unlinkErr) => {
                        if (unlinkErr) console.error(`Failed to delete file: ${filePath}`, unlinkErr);
                    });
                }
            });
        }

        res.json(successResponse(null, 'Content deleted successfully'));
    } catch (error) {
        console.error('Delete content error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

module.exports = router;