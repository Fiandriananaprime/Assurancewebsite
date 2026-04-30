const pool = require('../config/database');
const bcrypt = require('bcryptjs');

class User {
    // Create new user
    static async create(email, password, role = 'client') {
        const passwordHash = await bcrypt.hash(password, 12);

        const result = await pool.query(
            'INSERT INTO users (email, password_hash, role) VALUES ($1, $2, $3) RETURNING *',
            [email, passwordHash, role]
        );

        return result.rows[0];
    }

    // Find user by email
    static async findByEmail(email) {
        const result = await pool.query(
            'SELECT * FROM users WHERE email = $1',
            [email]
        );

        return result.rows[0];
    }

    // Find user by ID
    static async findById(id) {
        const result = await pool.query(
            'SELECT * FROM users WHERE id = $1',
            [id]
        );

        return result.rows[0];
    }

    static async findByIdWithProfile(id) {
        const result = await pool.query(
            `SELECT u.*,
                    p.first_name,
                    p.last_name,
                    p.phone,
                    p.address,
                    p.birth_date,
                    p.profile_image_url,
                    p.notes,
                    p.is_active,
                    p.loyalty_score,
                    p.risk_level
             FROM users u
             LEFT JOIN profiles p ON u.id = p.user_id
             WHERE u.id = $1`,
            [id]
        );

        return result.rows[0];
    }

    // Verify password
    static async verifyPassword(plainPassword, hashedPassword) {
        return await bcrypt.compare(plainPassword, hashedPassword);
    }

    // Update user
    static async update(id, data) {
        const allowedFields = ['email', 'role'];
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

        updates.push(`updated_at = CURRENT_TIMESTAMP`);
        values.push(id);

        const query = `UPDATE users SET ${updates.join(', ')} WHERE id = $${paramCount} RETURNING *`;
        const result = await pool.query(query, values);

        return result.rows[0];
    }

    // Delete user
    static async delete(id) {
        const result = await pool.query(
            'DELETE FROM users WHERE id = $1 RETURNING *',
            [id]
        );

        return result.rows[0];
    }

    // Get all users with pagination
    static async findAll({ limit, offset, role, search }) {
        let query = `
      SELECT u.*, 
             p.first_name, p.last_name, p.profile_image_url, p.is_active
      FROM users u
      LEFT JOIN profiles p ON u.id = p.user_id
      WHERE 1=1
    `;

        const values = [];
        let paramCount = 1;

        if (role) {
            query += ` AND u.role = $${paramCount}`;
            values.push(role);
            paramCount++;
        }

        if (search) {
            query += ` AND (u.email ILIKE $${paramCount} OR p.first_name ILIKE $${paramCount} OR p.last_name ILIKE $${paramCount})`;
            values.push(`%${search}%`);
            paramCount++;
        }

        query += ` ORDER BY u.created_at DESC LIMIT $${paramCount} OFFSET $${paramCount + 1}`;
        values.push(limit, offset);

        const result = await pool.query(query, values);

        // Get total count
        let countQuery = `
      SELECT COUNT(*)
      FROM users u
      LEFT JOIN profiles p ON u.id = p.user_id
      WHERE 1=1
    `;
        const countValues = [];
        let countParamCount = 1;

        if (role) {
            countQuery += ` AND u.role = $${countParamCount}`;
            countValues.push(role);
            countParamCount++;
        }

        if (search) {
            countQuery += ` AND (u.email ILIKE $${countParamCount} OR p.first_name ILIKE $${countParamCount} OR p.last_name ILIKE $${countParamCount})`;
            countValues.push(`%${search}%`);
        }

        const countResult = await pool.query(countQuery, countValues);
        const total = parseInt(countResult.rows[0].count);

        return {
            users: result.rows,
            total,
            page: Math.floor(offset / limit) + 1,
            pages: Math.ceil(total / limit)
        };
    }

    static async findAllWithProfile(options) {
        return this.findAll(options);
    }
}

module.exports = User;
