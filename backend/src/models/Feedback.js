const pool = require('../config/database');

class Feedback {
    // Create feedback
    static async create(data) {
        const result = await pool.query(
            `INSERT INTO feedbacks (
        client_id, subject, message, rating, category, source, public_quote
      ) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *`,
            [
                data.client_id,
                data.subject,
                data.message,
                data.rating,
                data.category,
                data.source || 'web',
                data.public_quote || false
            ]
        );

        return result.rows[0];
    }

    // Find feedback by ID
    static async findById(id) {
        const result = await pool.query(
            `SELECT f.*, 
              p.first_name || ' ' || p.last_name as client_name,
              u.email as client_email,
              p.first_name,
              p.last_name,
              p.phone,
              p.profile_image_url
       FROM feedbacks f
       JOIN users u ON f.client_id = u.id
       JOIN profiles p ON p.user_id = u.id
       WHERE f.id = $1`,
            [id]
        );

        return result.rows[0];
    }

    // Get feedbacks by client ID
    static async findByClientId(clientId) {
        const result = await pool.query(
            `SELECT f.*, 
              p.first_name || ' ' || p.last_name as client_name,
              p.first_name,
              p.last_name,
              p.phone,
              p.profile_image_url
       FROM feedbacks f
       JOIN profiles p ON f.client_id = p.user_id
       WHERE f.client_id = $1
       ORDER BY f.created_at DESC`,
            [clientId]
        );

        return result.rows;
    }

    // Get all feedbacks with pagination and filters
    static async findAll({ limit, offset, status, category, search, publicOnly }) {
        let query = `
      SELECT f.*, 
             p.first_name || ' ' || p.last_name as client_name,
             u.email as client_email,
             p.first_name,
             p.last_name,
             p.phone,
             p.profile_image_url
      FROM feedbacks f
      JOIN users u ON f.client_id = u.id
      JOIN profiles p ON p.user_id = u.id
      WHERE 1=1
    `;

        const values = [];
        let paramCount = 1;

        if (status) {
            query += ` AND f.status = $${paramCount}`;
            values.push(status);
            paramCount++;
        }

        if (category) {
            query += ` AND f.category = $${paramCount}`;
            values.push(category);
            paramCount++;
        }

        if (publicOnly) {
            query += ` AND f.public_quote = true`;
        }

        if (search) {
            query += ` AND (f.subject ILIKE $${paramCount} OR f.message ILIKE $${paramCount} OR p.first_name ILIKE $${paramCount} OR p.last_name ILIKE $${paramCount})`;
            values.push(`%${search}%`);
            paramCount++;
        }

        query += ` ORDER BY f.created_at DESC LIMIT $${paramCount} OFFSET $${paramCount + 1}`;
        values.push(limit, offset);

        const result = await pool.query(query, values);

        // Get total count
        let countQuery = 'SELECT COUNT(*) FROM feedbacks f JOIN users u ON f.client_id = u.id JOIN profiles p ON p.user_id = u.id WHERE 1=1';
        const countValues = [];
        let countParamCount = 1;

        if (status) {
            countQuery += ` AND f.status = $${countParamCount}`;
            countValues.push(status);
            countParamCount++;
        }

        if (category) {
            countQuery += ` AND f.category = $${countParamCount}`;
            countValues.push(category);
            countParamCount++;
        }

        if (publicOnly) {
            countQuery += ` AND f.public_quote = true`;
        }

        if (search) {
            countQuery += ` AND (f.subject ILIKE $${countParamCount} OR f.message ILIKE $${countParamCount} OR p.first_name ILIKE $${countParamCount} OR p.last_name ILIKE $${countParamCount})`;
            countValues.push(`%${search}%`);
        }

        const countResult = await pool.query(countQuery, countValues);
        const total = parseInt(countResult.rows[0].count);

        return {
            feedbacks: result.rows,
            total,
            page: Math.floor(offset / limit) + 1,
            pages: Math.ceil(total / limit)
        };
    }

    // Update feedback status
    static async updateStatus(id, status) {
        const result = await pool.query(
            `UPDATE feedbacks SET status = $1, is_responded = CASE WHEN $1 IN ('traite', 'urgent') THEN true ELSE is_responded END WHERE id = $2 RETURNING *`,
            [status, id]
        );

        return result.rows[0];
    }

    // Update feedback
    static async update(id, data) {
        const allowedFields = ['status', 'is_responded', 'public_quote'];
        const updates = [];
        const values = [];
        let paramCount = 1;

        allowedFields.forEach(field => {
            if (data[field] !== undefined) {
                updates.push(`${field} = $${paramCount}`);
                values.push(data[field]);
                paramCount++;
            }
        });

        if (updates.length === 0) return this.findById(id);

        values.push(id);
        const query = `UPDATE feedbacks SET ${updates.join(', ')} WHERE id = $${paramCount} RETURNING *`;
        const result = await pool.query(query, values);

        return result.rows[0];
    }

    // Get feedback statistics
    static async getStats() {
        const result = await pool.query(`
      SELECT 
        COUNT(*) as total,
        COUNT(CASE WHEN status = 'nouveau' THEN 1 END) as new,
        COUNT(CASE WHEN status = 'en_cours' THEN 1 END) as in_progress,
        COUNT(CASE WHEN status = 'traite' THEN 1 END) as resolved,
        COUNT(CASE WHEN status = 'urgent' THEN 1 END) as urgent,
        ROUND(AVG(rating), 2) as avg_rating,
        COUNT(CASE WHEN public_quote = true THEN 1 END) as public_quotes
      FROM feedbacks
    `);

        return result.rows[0];
    }

    // Get public feedbacks for landing page
    static async getPublicFeedbacks(limit = 10) {
        const result = await pool.query(
            `SELECT f.*, 
              p.first_name || ' ' || p.last_name as client_name,
              p.profile_image_url
       FROM feedbacks f
       JOIN profiles p ON f.client_id = p.user_id
       WHERE f.public_quote = true AND f.rating IS NOT NULL
       ORDER BY f.rating DESC, f.created_at DESC
       LIMIT $1`,
            [limit]
        );

        return result.rows;
    }
}

module.exports = Feedback;
