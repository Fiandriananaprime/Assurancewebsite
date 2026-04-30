const pool = require('../config/database');

class Profile {
    // Create profile
    static async create(userId, data) {
        const {
            first_name,
            last_name,
            phone,
            address,
            birth_date,
            profile_image_url,
            notes
        } = data;

        const result = await pool.query(
            `INSERT INTO profiles (
        user_id, first_name, last_name, phone, address, birth_date, 
        profile_image_url, notes
      ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING *`,
            [userId, first_name, last_name, phone, address, birth_date, profile_image_url, notes]
        );

        return result.rows[0];
    }

    // Find profile by user ID
    static async findByUserId(userId) {
        const result = await pool.query(
            `SELECT p.*, u.email, u.role, u.created_at as user_created_at
       FROM profiles p
       JOIN users u ON p.user_id = u.id
       WHERE p.user_id = $1`,
            [userId]
        );

        return result.rows[0];
    }

    // Update profile
    static async update(userId, data) {
        const allowedFields = ['first_name', 'last_name', 'phone', 'address', 'birth_date', 'profile_image_url', 'loyalty_score', 'risk_level', 'notes', 'is_active'];
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

        if (updates.length === 0) return this.findByUserId(userId);

        values.push(userId);
        const query = `UPDATE profiles SET ${updates.join(', ')} WHERE user_id = $${paramCount} RETURNING *`;
        const result = await pool.query(query, values);

        return result.rows[0];
    }

    // Get all profiles with pagination
    static async findAll({ limit, offset, search, role }) {
        let query = `
      SELECT p.*, u.email, u.role, u.created_at as user_created_at
      FROM profiles p
      JOIN users u ON p.user_id = u.id
      WHERE p.is_active = true
    `;

        const values = [];
        let paramCount = 1;

        if (search) {
            query += ` AND (p.first_name ILIKE $${paramCount} OR p.last_name ILIKE $${paramCount} OR u.email ILIKE $${paramCount})`;
            values.push(`%${search}%`);
            paramCount++;
        }

        if (role) {
            query += ` AND u.role = $${paramCount}`;
            values.push(role);
            paramCount++;
        }

        query += ` ORDER BY p.join_date DESC LIMIT $${paramCount} OFFSET $${paramCount + 1}`;
        values.push(limit, offset);

        const result = await pool.query(query, values);

        // Get total count
        let countQuery = 'SELECT COUNT(*) FROM profiles p JOIN users u ON p.user_id = u.id WHERE p.is_active = true';
        const countValues = [];
        let countParamCount = 1;

        if (search) {
            countQuery += ` AND (p.first_name ILIKE $${countParamCount} OR p.last_name ILIKE $${countParamCount} OR u.email ILIKE $${countParamCount})`;
            countValues.push(`%${search}%`);
            countParamCount++;
        }

        if (role) {
            countQuery += ` AND u.role = $${countParamCount}`;
            countValues.push(role);
        }

        const countResult = await pool.query(countQuery, countValues);
        const total = parseInt(countResult.rows[0].count);

        return {
            profiles: result.rows,
            total,
            page: Math.floor(offset / limit) + 1,
            pages: Math.ceil(total / limit)
        };
    }

    // Get user statistics
    static async getUserStats(userId) {
        const result = await pool.query(
            `SELECT 
        (SELECT COUNT(*) FROM contracts WHERE client_id = $1) as total_contracts,
        (SELECT COUNT(*) FROM contracts WHERE client_id = $1 AND status = 'actif') as active_contracts,
        (SELECT COUNT(*) FROM incidents WHERE client_id = $1) as total_incidents,
        (SELECT COUNT(*) FROM quotes WHERE client_id = $1) as total_quotes
      `,
            [userId]
        );

        return result.rows[0];
    }
}

module.exports = Profile;