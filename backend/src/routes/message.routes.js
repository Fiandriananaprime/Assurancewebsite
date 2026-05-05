const express = require('express');
const router = express.Router();
const { body, validationResult } = require('express-validator');
const Conversation = require('../models/Conversation');
const pool = require('../config/database');
const { authenticate } = require('../middleware/auth');
const upload = require('../middleware/upload');
const { successResponse, errorResponse, getPagination } = require('../utils/helpers');
const { generateAiReply, getClientName, getConversationHistory } = require('../utils/aiAssistant');

const touchConversation = async (conversationId) => {
    try {
        await pool.query(
            `UPDATE conversations SET updated_at = CURRENT_TIMESTAMP WHERE id = $1`,
            [conversationId]
        );
    } catch (error) {
        if (error.code !== '42703') {
            throw error;
        }
    }
};

// @route   POST /api/messages/upload
// @desc    Uploader une pièce jointe pour un message
// @access  Private
router.post('/upload', authenticate, upload.single('file'), async (req, res) => {
    try {
        if (!req.file) {
            return res.status(400).json(errorResponse('Aucun fichier reçu', 400));
        }
        const fileUrl = `/uploads/${req.file.filename}`;
        const fileType = req.file.mimetype;
        res.json(successResponse({ fileUrl, fileType }, 'Fichier uploadé avec succès'));
    } catch (error) {
        console.error('Message upload error:', error);
        res.status(500).json(errorResponse('Erreur serveur', 500));
    }
});

// @route   POST /api/messages/ai/draft
// @desc    Générer un brouillon de réponse IA pour une conversation client
// @access  Private (Employee/Admin only)
router.post('/ai/draft', authenticate, async (req, res) => {
    try {
        if (req.user.role === 'client') {
            return res.status(403).json(errorResponse('Interdit', 403));
        }

        const { conversationId, clientId, latestMessage } = req.body;
        if (!conversationId || !clientId) {
            return res.status(400).json(errorResponse('Conversation ou client manquant', 400));
        }

        const [clientName, conversationHistory] = await Promise.all([
            getClientName(clientId),
            getConversationHistory({ conversationId, clientId })
        ]);

        const reply = await generateAiReply({
            clientName,
            conversationHistory,
            latestMessage: latestMessage || conversationHistory.at(-1)?.content || ''
        });

        res.json(successResponse({ reply }, 'Brouillon IA généré'));
    } catch (error) {
        console.error('AI draft error:', error);
        res.status(error.statusCode || 500).json(errorResponse(error.message || 'Erreur IA', error.statusCode || 500));
    }
});

// @route   POST /api/messages/ai/verify
// @desc    Vérifier que la clé Gemini configurée répond
// @access  Private (Employee/Admin only)
router.post('/ai/verify', authenticate, async (req, res) => {
    try {
        if (req.user.role === 'client') {
            return res.status(403).json(errorResponse('Interdit', 403));
        }

        const reply = await generateAiReply({
            clientName: 'Test',
            conversationHistory: [],
            latestMessage: 'Réponds uniquement: OK'
        });

        res.json(successResponse({ ok: true, sample: reply }, 'Clé IA fonctionnelle'));
    } catch (error) {
        console.error('AI verify error:', error);
        res.status(error.statusCode || 500).json(errorResponse(error.message || 'Erreur IA', error.statusCode || 500));
    }
});

// @route   GET /api/messages/conversations
// @desc    Get user's conversations
// @access  Private
router.get('/conversations', authenticate, async (req, res) => {
    try {
        const conversations = await Conversation.findByUserId(req.user.id);
        res.json(successResponse(conversations, 'Conversations retrieved successfully'));
    } catch (error) {
        console.error('Get conversations error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   GET /api/messages/my-history
// @desc    Récupérer l'historique complet pour le client actuel
// @access  Private
router.get('/my-history', authenticate, async (req, res) => {
    try {
        const result = await pool.query(
            `SELECT m.*, p.first_name || ' ' || p.last_name as sender_name 
             FROM messages m
             LEFT JOIN profiles p ON m.sender_id = p.user_id
             WHERE m.sender_id = $1 
                OR m.conversation_id IN (SELECT id FROM conversations WHERE participant_one = $1 OR participant_two = $1)
             ORDER BY m.created_at ASC`,
            [req.user.id]
        );
        res.json(successResponse(result.rows, 'Historique récupéré'));
    } catch (error) {
        res.status(500).json(errorResponse('Erreur serveur', 500));
    }
});

// @route   GET /api/messages/history/:id
// @desc    Récupérer l'historique d'un client (pool) ou d'une conversation
// @access  Private (Employee)
router.get('/history/:id', authenticate, async (req, res) => {
    try {
        if (req.user.role === 'client') return res.status(403).json(errorResponse('Interdit', 403));

        const id = req.params.id;
        if (!id || id === 'null' || id === 'undefined') {
            return res.json(successResponse([], 'ID invalide, historique vide renvoyé'));
        }
        
        // Cherche soit par ID de conversation, soit par ID de client (si messages non assignés)
        const result = await pool.query(
            `SELECT m.*, p.first_name || ' ' || p.last_name as sender_name 
             FROM messages m
             LEFT JOIN profiles p ON m.sender_id = p.user_id
             WHERE m.conversation_id = $1 
                OR (m.conversation_id IS NULL AND m.sender_id = $1)
             ORDER BY m.created_at ASC`,
            [req.params.id]
        );
        res.json(successResponse(result.rows, 'Historique récupéré'));
    } catch (error) {
        res.status(500).json(errorResponse('Erreur serveur', 500));
    }
});

// @route   GET /api/messages/conversations/unread
// @desc    Get conversations with unread messages
// @access  Private
router.get('/conversations/unread', authenticate, async (req, res) => {
    try {
        const conversations = await Conversation.findWithUnread(req.user.id);
        res.json(successResponse(conversations, 'Unread conversations retrieved successfully'));
    } catch (error) {
        console.error('Get unread conversations error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   GET /api/messages/conversations/all
// @desc    Get all conversations for employee/admin
// @access  Private (Employee/Admin only)
router.get('/conversations/all', authenticate, async (req, res) => {
    try {
        if (req.user.role === 'client') {
            return res.status(403).json(errorResponse('Insufficient permissions', 403));
        }

        const { page, limit, search } = req.query;
        const { limit: limitNum, offset, page: pageNum } = getPagination(page, limit);

        const result = await Conversation.findAllForEmployee(req.user.id, {
            limit: limitNum,
            offset,
            search
        });

        res.json(successResponse(result, 'Conversations retrieved successfully', {
            pagination: {
                page: pageNum,
                limit: limitNum,
                total: result.total,
                pages: result.pages
            }
        }));
    } catch (error) {
        console.error('Get all conversations error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   POST /api/messages/conversations
// @desc    Create or get conversation with another user
// @access  Private
router.post('/conversations', authenticate, [
    body('participant_id').isUUID().withMessage('Invalid participant ID')
], async (req, res) => {
    try {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json(errorResponse('Validation failed', 400, errors.array()));
        }

        const { participant_id } = req.body;

        // Prevent self-conversation
        if (participant_id === req.user.id) {
            return res.status(400).json(errorResponse('Cannot create conversation with yourself', 400));
        }

        const conversation = await Conversation.createOrGet(req.user.id, participant_id);
        res.json(successResponse(conversation, 'Conversation created successfully'));
    } catch (error) {
        console.error('Create conversation error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   GET /api/messages/conversations/:id
// @desc    Get conversation by ID with messages
// @access  Private
router.get('/conversations/:id', authenticate, async (req, res) => {
    try {
        const conversation = await Conversation.findById(req.params.id);

        if (!conversation) {
            return res.status(404).json(errorResponse('Conversation not found', 404));
        }

        // Check if user is participant
        if (conversation.participant_one !== req.user.id && conversation.participant_two !== req.user.id) {
            return res.status(403).json(errorResponse('Insufficient permissions', 403));
        }

        // Get messages for this conversation
        const { page = 1, limit = 50 } = req.query;
        const { limit: limitNum, offset } = getPagination(page, limit);

        const messagesResult = await pool.query(
            `SELECT m.*, 
              p.first_name || ' ' || p.last_name as sender_name,
              p.profile_image_url as sender_image
       FROM messages m
       LEFT JOIN profiles p ON m.sender_id = p.user_id
       WHERE m.conversation_id = $1
       ORDER BY m.created_at DESC
       LIMIT $2 OFFSET $3`,
            [req.params.id, limitNum, offset]
        );

        // Mark messages as read
        await pool.query(
            `UPDATE messages SET is_read = true 
       WHERE conversation_id = $1 AND sender_id != $2 AND is_read = false`,
            [req.params.id, req.user.id]
        );

        res.json(successResponse({
            conversation,
            messages: messagesResult.rows.reverse() // Reverse to get chronological order
        }, 'Conversation retrieved successfully'));
    } catch (error) {
        console.error('Get conversation error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   DELETE /api/messages/conversations/:id
// @desc    Delete a conversation
// @access  Private
router.delete('/conversations/:id', authenticate, async (req, res) => {
    try {
        const conversation = await Conversation.findById(req.params.id);

        if (!conversation) {
            return res.status(404).json(errorResponse('Conversation not found', 404));
        }

        // Check if user is participant
        if (conversation.participant_one !== req.user.id && conversation.participant_two !== req.user.id) {
            return res.status(403).json(errorResponse('Insufficient permissions', 403));
        }

        await Conversation.delete(req.params.id);
        res.json(successResponse(null, 'Conversation deleted successfully'));
    } catch (error) {
        console.error('Delete conversation error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   POST /api/messages/send
// @desc    Send a message (REST API alternative to Socket.IO)
// @access  Private
router.post('/send', authenticate, [
    body('conversation_id').isUUID().withMessage('Invalid conversation ID'),
    body('content').notEmpty().withMessage('Message content is required')
], async (req, res) => {
    try {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json(errorResponse('Validation failed', 400, errors.array()));
        }

        const { conversation_id, content } = req.body;

        // Verify conversation exists and user is participant
        const conversation = await Conversation.findById(conversation_id);

        if (!conversation) {
            return res.status(404).json(errorResponse('Conversation not found', 404));
        }

        if (conversation.participant_one !== req.user.id && conversation.participant_two !== req.user.id) {
            return res.status(403).json(errorResponse('Insufficient permissions', 403));
        }

        // Save message
        const result = await pool.query(
            `INSERT INTO messages (conversation_id, sender_id, content, is_read) 
       VALUES ($1, $2, $3, false) 
       RETURNING *, 
       (SELECT first_name || ' ' || last_name FROM profiles WHERE user_id = $2) as sender_name`,
            [conversation_id, req.user.id, content]
        );

        const message = result.rows[0];

        await touchConversation(conversation_id);

        // Get recipient ID
        const recipientId = conversation.participant_one === req.user.id
            ? conversation.participant_two
            : conversation.participant_one;

        // Emit via Socket.IO if available
        try {
            const { getIO } = require('../config/socket');
            const io = getIO();
            io.to(`user_${recipientId}`).emit('receive_message', message);
        } catch (socketError) {
            // Socket.IO not initialized, continue anyway
            console.log('Socket.IO not available for real-time notification');
        }

        res.status(201).json(successResponse(message, 'Message sent successfully'));
    } catch (error) {
        console.error('Send message error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

// @route   PATCH /api/messages/:id/read
// @desc    Mark message as read
// @access  Private
router.patch('/messages/:id/read', authenticate, async (req, res) => {
    try {
        const result = await pool.query(
            `UPDATE messages SET is_read = true WHERE id = $1 RETURNING *`,
            [req.params.id]
        );

        if (result.rows.length === 0) {
            return res.status(404).json(errorResponse('Message not found', 404));
        }

        res.json(successResponse(result.rows[0], 'Message marked as read'));
    } catch (error) {
        console.error('Mark message as read error:', error);
        res.status(500).json(errorResponse('Server error', 500));
    }
});

module.exports = router;
