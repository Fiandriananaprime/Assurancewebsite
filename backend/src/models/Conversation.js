const pool = require('../config/database');

class Conversation {
    // Create or get conversation between two users
    static async createOrGet(participantOneId, participantTwoId, type = 'client') {
        // Check if conversation already exists
        const existing = await pool.query(
            `SELECT * FROM conversations 
       WHERE ((participant_one = $1 AND participant_two = $2) 
          OR (participant_one = $2 AND participant_two = $1))
       AND type = $3`,
            [participantOneId, participantTwoId, type]
        );

        if (existing.rows.length > 0) {
            return existing.rows[0];
        }

        // Create new conversation
        const result = await pool.query(
            `INSERT INTO conversations (participant_one, participant_two, type) 
       VALUES ($1, $2, $3) RETURNING *`,
            [participantOneId, participantTwoId, type]
        );

        return result.rows[0];
    }

    // Find conversation by ID
    static async findById(id) {
        const result = await pool.query(
            `SELECT c.*, 
              p1.first_name || ' ' || p1.last_name as participant_one_name,
              p1.profile_image_url as participant_one_image,
              p2.first_name || ' ' || p2.last_name as participant_two_name,
              p2.profile_image_url as participant_two_image
       FROM conversations c
       LEFT JOIN profiles p1 ON c.participant_one = p1.user_id
       LEFT JOIN profiles p2 ON c.participant_two = p2.user_id
       WHERE c.id = $1`,
            [id]
        );

        return result.rows[0];
    }

    // Get conversations for a user
    static async findByUserId(userId) {
        const result = await pool.query(
            `SELECT c.*, 
              CASE 
                WHEN c.participant_one = $1 THEN p2.first_name || ' ' || p2.last_name
                ELSE p1.first_name || ' ' || p1.last_name
              END as other_participant_name,
              CASE 
                WHEN c.participant_one = $1 THEN p2.profile_image_url
                ELSE p1.profile_image_url
              END as other_participant_image,
              (SELECT COUNT(*) FROM messages WHERE conversation_id = c.id AND sender_id != $1 AND is_read = false) as unread_count,
              (SELECT content FROM messages WHERE conversation_id = c.id ORDER BY created_at DESC LIMIT 1) as last_message,
              (SELECT created_at FROM messages WHERE conversation_id = c.id ORDER BY created_at DESC LIMIT 1) as last_message_at
       FROM conversations c
       LEFT JOIN profiles p1 ON c.participant_one = p1.user_id
       LEFT JOIN profiles p2 ON c.participant_two = p2.user_id
       WHERE c.participant_one = $1 OR c.participant_two = $1
       ORDER BY last_message_at DESC NULLS LAST`,
            [userId]
        );

        return result.rows;
    }

    // Get conversations with unread count
    static async findWithUnread(userId) {
        const result = await pool.query(
            `SELECT c.*, 
              CASE 
                WHEN c.participant_one = $1 THEN p2.first_name || ' ' || p2.last_name
                ELSE p1.first_name || ' ' || p1.last_name
              END as other_participant_name,
              CASE 
                WHEN c.participant_one = $1 THEN p2.profile_image_url
                ELSE p1.profile_image_url
              END as other_participant_image,
              (SELECT COUNT(*) FROM messages 
               WHERE conversation_id = c.id AND sender_id != $1 AND is_read = false) as unread_count
       FROM conversations c
       LEFT JOIN profiles p1 ON c.participant_one = p1.user_id
       LEFT JOIN profiles p2 ON c.participant_two = p2.user_id
       WHERE (c.participant_one = $1 OR c.participant_two = $1)
         AND (SELECT COUNT(*) FROM messages 
              WHERE conversation_id = c.id AND sender_id != $1 AND is_read = false) > 0
       ORDER BY unread_count DESC`,
            [userId]
        );

        return result.rows;
    }

    // Get all conversations for employees/admins
    static async findAllForEmployee(employeeId, { limit, offset, search }) {
        try {
            // Build parameter list dynamically to avoid hardcoded $n references
            const params = [employeeId];
            let paramIdx = 2; // next available param index for SQL

            // Build search clause with dynamic parameter index
            let dynamicSearchClause = '';
            if (search) {
                dynamicSearchClause = `AND (p1.first_name ILIKE $${paramIdx} OR p1.last_name ILIKE $${paramIdx} OR p2.first_name ILIKE $${paramIdx} OR p2.last_name ILIKE $${paramIdx} OR u1.email ILIKE $${paramIdx} OR u2.email ILIKE $${paramIdx})`;
                params.push(`%${search}%`);
                paramIdx++;
            }

            // Append limit and offset at the end
            params.push(limit, offset);

            const query = `
                WITH pool_clients AS (
                    SELECT DISTINCT ON (m.sender_id)
                        m.sender_id::text as id, 
                        NULL::uuid as participant_one, 
                        NULL::uuid as participant_two,
                        'client' as type, 
                        m.created_at, 
                        p.first_name || ' ' || p.last_name as other_participant_name,
                        p.profile_image_url as other_participant_image,
                        (SELECT COUNT(*)::int FROM messages WHERE sender_id = m.sender_id AND conversation_id IS NULL AND is_read = false) as unread_count,
                        m.content as last_message, 
                        m.created_at as last_message_at,
                        m.sender_id as "clientId", 
                        NULL::uuid as "assignedTo", 
                        NULL::text as "assignedToName"
                    FROM messages m
                    JOIN profiles p ON m.sender_id = p.user_id
                    WHERE m.conversation_id IS NULL
                    ORDER BY m.sender_id, m.created_at DESC
                ),
                real_convs AS (
                    SELECT 
                        c.id::text, c.participant_one, c.participant_two, c.type, c.created_at,
                        (CASE WHEN u1.id = $1 THEN (p2.first_name || ' ' || p2.last_name) ELSE (p1.first_name || ' ' || p1.last_name) END) as other_participant_name,
                        (CASE WHEN u1.id = $1 THEN p2.profile_image_url ELSE p1.profile_image_url END) as other_participant_image,
                        (SELECT COUNT(*) FROM messages WHERE conversation_id = c.id AND sender_id != $1 AND is_read = false)::int as unread_count,
                        (SELECT content FROM messages WHERE conversation_id = c.id ORDER BY created_at DESC LIMIT 1) as last_message,
                        (SELECT created_at FROM messages WHERE conversation_id = c.id ORDER BY created_at DESC LIMIT 1) as last_message_at,
                        (CASE WHEN u1.role = 'client' THEN c.participant_one WHEN u2.role = 'client' THEN c.participant_two ELSE NULL END) as "clientId",
                        (CASE WHEN c.type = 'client' THEN (CASE WHEN u1.role != 'client' THEN u1.id WHEN u2.role != 'client' THEN u2.id ELSE NULL END) ELSE NULL END) as "assignedTo",
                        (SELECT first_name || ' ' || last_name FROM profiles WHERE user_id = (CASE WHEN c.type = 'client' THEN (CASE WHEN u1.role != 'client' THEN u1.id WHEN u2.role != 'client' THEN u2.id ELSE NULL END) ELSE NULL END)) as "assignedToName"
                    FROM conversations c
                    JOIN users u1 ON c.participant_one = u1.id
                    JOIN users u2 ON c.participant_two = u2.id
                    JOIN profiles p1 ON c.participant_one = p1.user_id
                    JOIN profiles p2 ON c.participant_two = p2.user_id
                    WHERE (c.participant_one = $1 OR c.participant_two = $1 OR c.type = 'client')
                    ${dynamicSearchClause}
                )
                SELECT * FROM pool_clients UNION ALL SELECT * FROM real_convs
                ORDER BY last_message_at DESC NULLS LAST LIMIT $${paramIdx} OFFSET $${paramIdx + 1}
            `;

            const result = await pool.query(query, params);

            // Count query
            const countParams = [employeeId];
            let countParamIdx = 2;
            let countSearchClause = '';
            if (search) {
                countSearchClause = ` AND ((p1.first_name ILIKE $${countParamIdx}) OR (p1.last_name ILIKE $${countParamIdx}) OR (u1.email ILIKE $${countParamIdx}) OR (u2.email ILIKE $${countParamIdx}))`;
                countParams.push(`%${search}%`);
                countParamIdx++;
            }

            const countQuery = `
                SELECT COUNT(*) FROM conversations c
                JOIN users u1 ON c.participant_one = u1.id
                JOIN users u2 ON c.participant_two = u2.id
                WHERE (c.participant_one = $1 OR c.participant_two = $1 OR c.type = 'client')
                ${countSearchClause}
            `;

            const countResult = await pool.query(countQuery, countParams);
            const total = parseInt(countResult.rows[0].count || 0);

            return {
                conversations: result.rows,
                total,
                page: Math.floor(offset / limit) + 1,
                pages: Math.ceil(total / limit)
            };
        } catch (err) {
            console.error('findAllForEmployee SQL error:', err);
            throw err;
        }
    }

    // Delete conversation
    static async delete(id) {
        const result = await pool.query(
            'DELETE FROM conversations WHERE id = $1 RETURNING *',
            [id]
        );

        return result.rows[0];
    }
}

module.exports = Conversation;