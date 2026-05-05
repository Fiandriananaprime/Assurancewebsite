const socketIo = require('socket.io');
const jwt = require('jsonwebtoken');
const pool = require('./database');
const {
    generateAiReply,
    getClientName,
    getConversationHistory,
    insertAiMessage
} = require('../utils/aiAssistant');

let io;
const aiDelegations = new Map();

const makeAiKey = (conversationId, clientId) => String(conversationId || clientId || '');
const makeAiClientKey = (clientId) => `client_${clientId}`;

const sendDelegatedAiReply = async ({ conversationId, clientId, employeeId, latestMessage }) => {
    const [clientName, conversationHistory] = await Promise.all([
        getClientName(clientId),
        getConversationHistory({ conversationId, clientId })
    ]);

    const reply = await generateAiReply({
        clientName,
        conversationHistory,
        latestMessage
    });

    const message = await insertAiMessage({
        conversationId,
        senderId: employeeId,
        content: reply
    });

    io.to(`user_${clientId}`).emit('receive_message', message);
    io.to(`user_${employeeId}`).emit('message_sent', message);
    return message;
};

const touchConversation = async (conversationId) => {
    if (!conversationId || conversationId === 'support-general') return;

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

const rememberAiDelegation = async ({ conversationId, clientId, employeeId, enabled }) => {
    const delegation = {
        conversationId,
        clientId,
        employeeId
    };

    aiDelegations.set(makeAiKey(conversationId, clientId), delegation);
    aiDelegations.set(makeAiClientKey(clientId), delegation);

    try {
        await pool.query(
            `INSERT INTO message_ai_delegations (conversation_id, client_id, employee_id, enabled)
             VALUES ($1, $2, $3, $4)
             ON CONFLICT (conversation_id)
             DO UPDATE SET employee_id = EXCLUDED.employee_id, client_id = EXCLUDED.client_id, enabled = EXCLUDED.enabled, updated_at = CURRENT_TIMESTAMP`,
            [conversationId, clientId, employeeId, enabled]
        );
    } catch (error) {
        if (error.code !== '42P01') {
            throw error;
        }
    }

    if (!enabled) {
        aiDelegations.delete(makeAiKey(conversationId, clientId));
        aiDelegations.delete(makeAiClientKey(clientId));
    }
};

const findAiDelegation = async ({ conversationId, clientId }) => {
    const memoryDelegation = aiDelegations.get(makeAiKey(conversationId, clientId)) || aiDelegations.get(makeAiClientKey(clientId));
    if (memoryDelegation) return memoryDelegation;

    try {
        const result = await pool.query(
            `SELECT conversation_id, client_id, employee_id
             FROM message_ai_delegations
             WHERE enabled = true AND (conversation_id = $1 OR client_id = $2)
             ORDER BY updated_at DESC
             LIMIT 1`,
            [conversationId || null, clientId || null]
        );

        if (result.rows.length === 0) return null;

        const row = result.rows[0];
        const delegation = {
            conversationId: row.conversation_id,
            clientId: row.client_id,
            employeeId: row.employee_id
        };
        aiDelegations.set(makeAiKey(delegation.conversationId, delegation.clientId), delegation);
        aiDelegations.set(makeAiClientKey(delegation.clientId), delegation);
        return delegation;
    } catch (error) {
        if (error.code === '42P01') {
            return null;
        }
        throw error;
    }
};

const initializeSocket = (server) => {
    const allowedOrigin = process.env.SOCKET_CORS_ORIGIN || process.env.FRONTEND_URL || 'http://localhost:5173';
    const devAllowed = process.env.NODE_ENV !== 'production';

    io = socketIo(server, {
        cors: {
            origin: devAllowed ? [allowedOrigin, 'http://localhost:5174', 'http://127.0.0.1:5173', 'http://127.0.0.1:5174'] : allowedOrigin,
            methods: ['GET', 'POST'],
            credentials: true
        }
    });

    // Middleware for authentication - verify JWT and ensure user exists in DB
    io.use(async (socket, next) => {
        try {
            const token = socket.handshake?.auth?.token;
            console.debug('Socket auth attempt from', socket.handshake?.address || socket.handshake?.headers?.origin || 'unknown origin');
            if (token) console.debug('Socket provided token length:', token.length);

            if (!token) {
                return next(new Error('Authentication error: No token provided'));
            }

            // Verify token
            let decoded;
            try {
                decoded = jwt.verify(token, process.env.JWT_SECRET);
            } catch (err) {
                console.error('❌ Socket auth - token verification failed:', err.message);
                return next(new Error('Authentication error: Invalid token'));
            }

            // Verify user exists in DB
            const User = require('../models/User'); // Vérifiez que ce fichier existe bien dans src/models/User.js
            let userRecord = null;
            if (decoded.id) {
                userRecord = await User.findById(decoded.id);
            } else if (decoded.email) {
                userRecord = await User.findByEmail(decoded.email);
            }

            if (!userRecord) {
                console.warn('Socket auth - user not found for token payload:', decoded);
                return next(new Error('Authentication error: User not found'));
            }

            // Attach minimal user info to socket
            socket.user = {
                id: userRecord.id || decoded.id,
                email: userRecord.email || decoded.email,
                role: userRecord.role || decoded.role,
                first_name: userRecord.first_name || decoded.first_name || '',
                last_name: userRecord.last_name || decoded.last_name || ''
            };

            next();
        } catch (err) {
            console.error('Socket auth middleware error:', err);
            return next(new Error('Authentication error'));
        }
    });

    io.on('connection', (socket) => {
        console.log(`✅ User connected: ${socket.user.email} (${socket.id})`);

        // Store user socket ID for direct messaging
        socket.join(`user_${socket.user.id}`);

        // Join role-based room
        socket.join(`role_${socket.user.role}`);

        // Gérer la prise en charge d'un client par un employé
        socket.on('claim_conversation', async (data) => {
            const { clientId } = data;
            if (socket.user.role !== 'employee') return;

            try {
                // Vérifier si une conversation existe déjà pour éviter les doublons
                const checkRes = await pool.query(
                    `SELECT id FROM conversations WHERE (participant_one = $1 AND participant_two = $2) 
                     OR (participant_one = $2 AND participant_two = $1)`,
                    [clientId, socket.user.id]
                );

                let conversation;
                if (checkRes.rows.length > 0) {
                    conversation = checkRes.rows[0];
                } else {
                    const Conversation = require('../models/Conversation');
                    conversation = await Conversation.createOrGet(clientId, socket.user.id);
                    
                    // Mapper les anciens messages du pool vers cette nouvelle conversation
                    await pool.query(
                        `UPDATE messages SET conversation_id = $1 
                         WHERE (sender_id = $2 AND conversation_id IS NULL)`,
                        [conversation.id, clientId]
                    );
                }

                const clientRes = await pool.query(
                    `SELECT first_name || ' ' || last_name as name, profile_image_url as image 
                     FROM profiles WHERE user_id = $1`, [clientId]
                );
                const clientInfo = clientRes.rows[0];

                // 1. Confirmer à l'employé qui a cliqué
                socket.emit('conversation_claimed_success', {
                    ...conversation,
                    clientId: clientId,
                    name: clientInfo?.name,
                    image: clientInfo?.image
                });

                // 2. Notifier TOUS les employés (y compris celui qui a cliqué pour uniformiser)
                io.to('role_employee').emit('remove_client_from_pool', { clientId, assignedTo: socket.user.id, assignedToName: `${socket.user.first_name} ${socket.user.last_name}` });

                // 3. Notifier le CLIENT concerné pour qu'il sache qui lui répond
                io.to(`user_${clientId}`).emit('remove_client_from_pool', { clientId, assignedTo: socket.user.id, assignedToName: `${socket.user.first_name} ${socket.user.last_name}` });
            } catch (error) {
                console.error('Error claiming conversation:', error);
            }
        });

        socket.on('toggle_ai_delegation', async (data) => {
            if (socket.user.role !== 'employee') return;

            let { conversationId, clientId, enabled } = data || {};
            if (!clientId) {
                socket.emit('ai_delegation_error', { message: 'Client manquant pour la délégation IA.' });
                return;
            }

            try {
                let targetConvId = conversationId;

                if (!targetConvId || targetConvId === 'support-general' || String(targetConvId) === String(clientId)) {
                    const checkRes = await pool.query(
                        `SELECT id FROM conversations WHERE (participant_one = $1 AND participant_two = $2)
                         OR (participant_one = $2 AND participant_two = $1)`,
                        [clientId, socket.user.id]
                    );

                    if (checkRes.rows.length > 0) {
                        targetConvId = checkRes.rows[0].id;
                    } else {
                        const convResult = await pool.query(
                            `INSERT INTO conversations (participant_one, participant_two, type)
                             VALUES ($1, $2, 'client')
                             RETURNING id`,
                            [clientId, socket.user.id]
                        );
                        targetConvId = convResult.rows[0].id;
                    }

                    await pool.query(
                        `UPDATE messages SET conversation_id = $1
                         WHERE sender_id = $2 AND conversation_id IS NULL`,
                        [targetConvId, clientId]
                    );

                    const clientRes = await pool.query(
                        `SELECT first_name || ' ' || last_name as name, profile_image_url as image
                         FROM profiles WHERE user_id = $1`,
                        [clientId]
                    );
                    const clientInfo = clientRes.rows[0];

                    socket.emit('conversation_claimed_success', {
                        id: targetConvId,
                        clientId,
                        assignedTo: socket.user.id,
                        name: clientInfo?.name,
                        image: clientInfo?.image
                    });

                    io.to('role_employee').emit('remove_client_from_pool', {
                        clientId,
                        assignedTo: socket.user.id,
                        assignedToName: `${socket.user.first_name} ${socket.user.last_name}`
                    });

                    io.to(`user_${clientId}`).emit('remove_client_from_pool', {
                        clientId,
                        assignedTo: socket.user.id,
                        assignedToName: `${socket.user.first_name} ${socket.user.last_name}`,
                        conversationId: targetConvId
                    });
                }

                await rememberAiDelegation({
                    conversationId: targetConvId,
                    clientId,
                    employeeId: socket.user.id,
                    enabled: Boolean(enabled)
                });

                socket.emit('ai_delegation_updated', {
                    conversationId: targetConvId,
                    clientId,
                    enabled: Boolean(enabled)
                });
            } catch (error) {
                console.error('Error toggling AI delegation:', error);
                socket.emit('ai_delegation_error', { message: error.message || 'Impossible de déléguer à l’IA.' });
            }
        });

        socket.on('get_ai_delegation_status', async (data) => {
            if (socket.user.role !== 'employee') return;

            const { conversationId, clientId } = data || {};
            try {
                const delegation = await findAiDelegation({ conversationId, clientId });
                socket.emit('ai_delegation_updated', {
                    conversationId,
                    clientId,
                    enabled: Boolean(delegation)
                });
            } catch (error) {
                console.error('Error getting AI delegation status:', error);
            }
        });

        // Handle sending messages
        socket.on('send_message', async (data) => {
            let { recipientId, content, conversationId, fileUrl, fileType, replyTo } = data;
            if (conversationId === "null" || conversationId === "undefined") conversationId = null;
            if (recipientId === "null" || recipientId === "undefined") recipientId = null;

            try {
                // Save message to database
                let targetConvId = conversationId;

                // Sécurité : Si le client écrit sans ID de conversation, on cherche s'il en a une active
                if (socket.user.role === 'client' && (targetConvId === "support-general" || !targetConvId)) {
                    const existing = await pool.query(
                        `SELECT id, CASE WHEN participant_one = $1 THEN participant_two ELSE participant_one END as assigned_to
                         FROM conversations 
                         WHERE (participant_one = $1 OR participant_two = $1) AND type = 'client'
                         LIMIT 1`,
                        [socket.user.id]
                    );
                    
                    if (existing.rows.length > 0) {
                        targetConvId = existing.rows[0].id;
                        recipientId = existing.rows[0].assigned_to;
                    }
                }

                // Si un employé répond à un message général
                if (socket.user.role === 'employee' && (conversationId === "support-general" || String(data.clientId) === String(conversationId))) {
                    // On récupère l'ID du client à partir des données (il faut que le client envoie son ID au début)
                    const clientId = data.clientId; 

                    // On crée ou récupère une conversation privée
                    const existingConv = await pool.query(
                        `SELECT id FROM conversations
                         WHERE (participant_one = $1 AND participant_two = $2)
                            OR (participant_one = $2 AND participant_two = $1)
                         LIMIT 1`,
                        [clientId, socket.user.id]
                    );

                    if (existingConv.rows.length > 0) {
                        targetConvId = existingConv.rows[0].id;
                        await touchConversation(targetConvId);
                    } else {
                        const convResult = await pool.query(
                            `INSERT INTO conversations (participant_one, participant_two, type)
                             VALUES ($1, $2, 'client')
                             RETURNING id`,
                            [clientId, socket.user.id]
                        );
                        targetConvId = convResult.rows[0].id;
                    }

                    // On notifie tous les employés que cette conversation est "prise"
                    io.to('role_employee').emit('conversation_claimed', {
                        oldId: String(clientId),
                        newId: targetConvId,
                        assignedTo: socket.user.id,
                        assignedToName: `${socket.user.first_name} ${socket.user.last_name}`,
                        clientId: clientId
                    });

                    // On notifie aussi le client de l'assignation
                    io.to(`user_${clientId}`).emit('remove_client_from_pool', {
                        clientId: clientId,
                        assignedTo: socket.user.id,
                        assignedToName: `${socket.user.first_name} ${socket.user.last_name}`,
                        conversationId: targetConvId
                    });
                }

                // Détermination du destinataire pour l'employé
                if (socket.user.role === 'employee' && !recipientId) {
                    recipientId = data.clientId || targetConvId;
                }

                // Sécurité : si targetConvId n'est pas un UUID de conversation valide (ex: "support-general"), 
                // on met NULL pour la base de données
                const isFloating = targetConvId === "support-general" || !targetConvId || targetConvId === "null";
                const dbConvId = isFloating ? null : targetConvId;

                let result;
                try {
                    // Try inserting with file columns (preferred)
                    const query = `
                        INSERT INTO messages (conversation_id, sender_id, content, is_read, file_url, file_type, reply_to) 
                        VALUES ($1, $2, $3, false, $4, $5, $6) 
                        RETURNING *, 
                        (SELECT profile_image_url FROM profiles WHERE user_id = $2) as sender_image,
                        (SELECT first_name || ' ' || last_name FROM profiles WHERE user_id = $2) as sender_name,
                        (SELECT role FROM users WHERE id = $2) as sender_role,
                        (SELECT content FROM messages WHERE id = $6) as reply_to_content,
                        (SELECT p2.first_name FROM profiles p2 JOIN messages m2 ON p2.user_id = m2.sender_id WHERE m2.id = $6) as reply_to_name
                    `;
                    result = await pool.query(query, [
                        dbConvId, 
                        socket.user.id, 
                        content, 
                        fileUrl || null, 
                        fileType || null, 
                        replyTo || null
                    ]);
                } catch (errInsert) {
                    // If the error comes from missing columns (older DB), retry without file columns
                    const msg = String(errInsert.message || '').toLowerCase();
                    if (msg.includes('column "file_url"') || msg.includes('column "file_type"') || msg.includes('undefined column')) {
                        try {
                            result = await pool.query(
                                `INSERT INTO messages (conversation_id, sender_id, content, is_read, reply_to) 
                                 VALUES ($1, $2, $3, false, $4) 
                                 RETURNING *, 
                                 (SELECT profile_image_url FROM profiles WHERE user_id = $2) as sender_image,
                                 (SELECT first_name || ' ' || last_name FROM profiles WHERE user_id = $2) as sender_name,
                                 (SELECT role FROM users WHERE id = $2) as sender_role`,
                                [dbConvId, socket.user.id, content, replyTo || null]
                            );
                        } catch (err2) {
                            console.error('Retry insert without file columns failed:', err2);
                            throw err2;
                        }
                    } else {
                        // some other error; rethrow
                        throw errInsert;
                    }
                }

                const message = result.rows[0];
                
                // Standardisation de l'ID de conversation pour le filtrage Frontend
                // Pour le pool, on utilise l'ID du client. Pour le privé, on utilise l'UUID.
                if (dbConvId) {
                    message.conversationId = String(dbConvId);
                } else {
                    message.conversationId = socket.user.role === 'client' ? String(socket.user.id) : String(recipientId);
                }

                // Emit to recipient
                if (recipientId) {
                    io.to(`user_${recipientId}`).emit('receive_message', message);
                } else if (socket.user.role === 'client') {
                    // Route message to all employees if no specific recipient
                    io.to('role_employee').emit('receive_message', message);
                }

                // Emit back to sender
                socket.emit('message_sent', message);

                if (socket.user.role === 'client' && dbConvId) {
                    const delegation = await findAiDelegation({
                        conversationId: dbConvId,
                        clientId: socket.user.id
                    });
                    if (delegation) {
                        sendDelegatedAiReply({
                            conversationId: dbConvId,
                            clientId: socket.user.id,
                            employeeId: delegation.employeeId,
                            latestMessage: content
                        }).catch((aiError) => {
                            console.error('AI delegated reply failed:', aiError);
                            io.to(`user_${delegation.employeeId}`).emit('ai_delegation_error', {
                                conversationId: dbConvId,
                                clientId: socket.user.id,
                                message: aiError.message || 'La réponse IA a échoué.'
                            });
                        });
                    }
                }

                await touchConversation(targetConvId);

            } catch (error) {
                console.error('Error sending message:', error);
                socket.emit('error', { message: 'Failed to send message' });
            }
        });

        // Handle typing indicators
        socket.on('typing', (data) => {
            const { conversationId, isTyping } = data;
            socket.to(`conversation_${conversationId}`).emit('user_typing', {
                userId: socket.user.id,
                isTyping,
                userName: `${socket.user.first_name} ${socket.user.last_name}`
            });
        });

        // Handle marking messages as read
        socket.on('mark_read', async (data) => {
            let { conversationId, clientId } = data;
            if (conversationId === "null" || conversationId === "undefined") conversationId = null;
            if (clientId === "null" || clientId === "undefined") clientId = null;

            try {
                await pool.query(
                    `UPDATE messages SET is_read = true
                     WHERE (conversation_id = $1 OR (conversation_id IS NULL AND sender_id = $3))
                     AND sender_id != $2`,
                    [conversationId, socket.user.id, clientId]
                );

                // Optionnel : notifier l'autre partie que les messages sont lus
                if (data.clientId) {
                    io.to(`user_${data.clientId}`).emit('messages_marked_read', { conversationId });
                }
            } catch (error) {
                console.error('Error marking messages as read:', error);
            }
        });

        // Handle disconnection
        socket.on('disconnect', () => {
            console.log(`❌ User disconnected: ${socket.user.email}`);
        });

        // Reaction to a message: payload { messageId, emoji }
        socket.on('react_message', async (data) => {
            const { messageId, emoji } = data;
            try {
                // Upsert reaction (reactions is JSONB array of { userId, emoji })
                await pool.query(
                    `UPDATE messages SET reactions = (
                        CASE WHEN reactions IS NULL THEN $2::jsonb ELSE reactions || $2::jsonb END
                     ) WHERE id = $1 RETURNING *`,
                    [messageId, JSON.stringify([{ userId: socket.user.id, emoji }])]
                );
                
                const res = await pool.query(`
                    SELECT m.*, 
                    (SELECT first_name || ' ' || last_name FROM profiles WHERE user_id = m.sender_id) as sender_name
                    FROM messages m WHERE m.id = $1
                `, [messageId]);
                const msg = res.rows[0];
                io.emit('message_reacted', msg);
            } catch (err) {
                console.error('Error reacting to message:', err);
            }
        });

        // Delete message for everyone (admin/author) - payload { messageId }
        socket.on('delete_message', async (data) => {
            const { messageId } = data;
            try {
                await pool.query(`UPDATE messages SET deleted = true WHERE id = $1`, [messageId]);
                const res = await pool.query(`SELECT * FROM messages WHERE id = $1`, [messageId]);
                io.emit('message_deleted', res.rows[0]);
            } catch (err) {
                console.error('Error deleting message:', err);
            }
        });

        // Remove message for a single user (retirer pour vous) - payload { messageId }
        socket.on('remove_message_for_user', async (data) => {
            const { messageId } = data;
            try {
                // push user id into removed_for array if not present
                await pool.query(
                    `UPDATE messages SET removed_for = (
                        CASE WHEN removed_for IS NULL THEN $2::jsonb ELSE (removed_for || $2::jsonb) END
                     ) WHERE id = $1`,
                    [messageId, JSON.stringify([socket.user.id])]
                );
                // notify the requester that it's removed locally
                socket.emit('message_removed_for_you', { messageId });
            } catch (err) {
                console.error('Error removing message for user:', err);
            }
        });
    });

    return io;
};

const getIO = () => {
    if (!io) {
        throw new Error('Socket.io not initialized');
    }
    return io;
};

module.exports = { initializeSocket, getIO };
