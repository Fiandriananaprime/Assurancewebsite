const express = require('express');
const router = express.Router();
const { body, validationResult } = require('express-validator');
const Document = require('../models/Document');
const { authenticate, authorize } = require('../middleware/auth');
const upload = require('../middleware/upload');
const { successResponse, errorResponse } = require('../utils/helpers');

// @route   POST /api/documents
// @desc    Upload a document
// @access  Private
router.post('/', authenticate, upload.single('file'), [
    body('entity_type').isIn(['contract', 'incident', 'user']).withMessage('Invalid entity type'),
    body('entity_id').isUUID().withMessage('Invalid entity ID'),
    body('name').notEmpty().withMessage('Document name is required')
], async (req, res) => {
    try {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json(errorResponse('Validation failed', 400, errors.array()));
        }

        if (!req.file) {
            return res.status(400).json(errorResponse('No file uploaded', 400));
        }

        const documentData = {
            name: req.body.name,
            file_url: `/uploads/${req.file.filename}`,
            file_type: req.file.mimetype,
            file_size: req.file.size.toString(),
            entity_type: req.body.entity_type,
            entity_id: req.body.entity_id,
            uploaded_by: req.user.id
        };

        const document = await Document.create(documentData);
        res.status(201).json(successResponse(document, 'Document uploaded successfully'));
    } catch (error) {
        console.error('Upload document error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   GET /api/documents/entity/:entityType/:entityId
// @desc    Get documents for an entity
// @access  Private
router.get('/entity/:entityType/:entityId', authenticate, async (req, res) => {
    try {
        const { entityType, entityId } = req.params;

        // Verify authorization based on entity type
        if (entityType === 'contract' || entityType === 'incident') {
            const pool = require('../config/database');
            const table = entityType === 'contract' ? 'contracts' : 'incidents';

            const result = await pool.query(
                `SELECT client_id FROM ${table} WHERE id = $1`,
                [entityId]
            );

            if (result.rows.length === 0) {
                return res.status(404).json(errorResponse('Entity not found', 404));
            }

            const entity = result.rows[0];

            // Check if user has access
            if (req.user.role === 'client' && entity.client_id !== req.user.id) {
                return res.status(403).json(errorResponse('Insufficient permissions', 403));
            }
        }

        const documents = await Document.findByEntity(entityType, entityId);
        res.json(successResponse(documents, 'Documents retrieved successfully'));
    } catch (error) {
        console.error('Get documents error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   GET /api/documents/my-documents
// @desc    Get current user's uploaded documents
// @access  Private
router.get('/my-documents', authenticate, async (req, res) => {
    try {
        const documents = await Document.findByUploadedBy(req.user.id);
        res.json(successResponse(documents, 'Documents retrieved successfully'));
    } catch (error) {
        console.error('Get my documents error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   GET /api/documents/:id
// @desc    Get document by ID
// @access  Private
router.get('/:id', authenticate, async (req, res) => {
    try {
        const document = await Document.findById(req.params.id);

        if (!document) {
            return res.status(404).json(errorResponse('Document not found', 404));
        }

        // Check authorization
        if (req.user.role === 'client' && document.uploaded_by !== req.user.id) {
            return res.status(403).json(errorResponse('Insufficient permissions', 403));
        }

        res.json(successResponse(document, 'Document retrieved successfully'));
    } catch (error) {
        console.error('Get document error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   DELETE /api/documents/:id
// @desc    Delete a document
// @access  Private
router.delete('/:id', authenticate, async (req, res) => {
    try {
        const document = await Document.findById(req.params.id);

        if (!document) {
            return res.status(404).json(errorResponse('Document not found', 404));
        }

        // Check authorization (only uploader or admin/employee can delete)
        if (req.user.role === 'client' && document.uploaded_by !== req.user.id) {
            return res.status(403).json(errorResponse('Insufficient permissions', 403));
        }

        await Document.delete(req.params.id);
        res.json(successResponse(null, 'Document deleted successfully'));
    } catch (error) {
        console.error('Delete document error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

module.exports = router;