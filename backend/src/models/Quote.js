const pool = require('../config/database');
const { generateReference } = require('../utils/helpers');

class Quote {
    static normalizeRow(row) {
        if (!row) return row;

        let coverageDetails = row.coverage_details;
        if (typeof coverageDetails === 'string') {
            try {
                coverageDetails = JSON.parse(coverageDetails);
            } catch (_) {
                coverageDetails = row.coverage_details;
            }
        }

        return {
            ...row,
            coverage_details: coverageDetails
        };
    }

    // Create quote
    static async create(data) {
        const reference = generateReference('DEV');
        const coverageDetails = typeof data.coverage_details === 'string'
            ? data.coverage_details
            : JSON.stringify(data.coverage_details || {});

        const result = await pool.query(
            `INSERT INTO quotes (
        reference, client_id, type, status, amount, deductible, 
        coverage_details, validity_days, vehicle_details, property_details
      ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10) RETURNING *`,
            [
                reference,
                data.client_id,
                data.type,
                data.status || 'en_attente',
                data.amount,
                data.deductible,
                coverageDetails,
                data.validity_days || 30,
                JSON.stringify(data.vehicle_details || {}),
                JSON.stringify(data.property_details || {})
            ]
        );

        return this.normalizeRow(result.rows[0]);
    }

    // Find quote by ID
    static async findById(id) {
        const result = await pool.query(
            `SELECT q.*, 
              p.first_name || ' ' || p.last_name as client_name,
              u.email as client_email
       FROM quotes q
       JOIN users u ON q.client_id = u.id
       JOIN profiles p ON p.user_id = u.id
       WHERE q.id = $1`,
            [id]
        );

        return this.normalizeRow(result.rows[0]);
    }

    // Find quote by reference
    static async findByReference(reference) {
        const result = await pool.query(
            `SELECT q.*, 
              p.first_name || ' ' || p.last_name as client_name,
              u.email as client_email
       FROM quotes q
       JOIN users u ON q.client_id = u.id
       JOIN profiles p ON p.user_id = u.id
       WHERE q.reference = $1`,
            [reference]
        );

        return this.normalizeRow(result.rows[0]);
    }

    // Get quotes by client ID
    static async findByClientId(clientId) {
        const result = await pool.query(
            `SELECT q.*, 
              p.first_name || ' ' || p.last_name as client_name
       FROM quotes q
       JOIN profiles p ON q.client_id = p.user_id
       WHERE q.client_id = $1
       ORDER BY q.created_at DESC`,
            [clientId]
        );

        return result.rows.map((row) => this.normalizeRow(row));
    }

    // Get all quotes with pagination and filters
    static async findAll({ limit, offset, status, type, clientId, search }) {
        let query = `
      SELECT q.*, 
             p.first_name || ' ' || p.last_name as client_name,
             u.email as client_email
      FROM quotes q
      JOIN users u ON q.client_id = u.id
      JOIN profiles p ON p.user_id = u.id
      WHERE 1=1
    `;

        const values = [];
        let paramCount = 1;

        if (status) {
            query += ` AND q.status = $${paramCount}`;
            values.push(status);
            paramCount++;
        }

        if (type) {
            query += ` AND q.type = $${paramCount}`;
            values.push(type);
            paramCount++;
        }

        if (clientId) {
            query += ` AND q.client_id = $${paramCount}`;
            values.push(clientId);
            paramCount++;
        }

        if (search) {
            query += ` AND (q.reference ILIKE $${paramCount} OR p.first_name ILIKE $${paramCount} OR p.last_name ILIKE $${paramCount})`;
            values.push(`%${search}%`);
            paramCount++;
        }

        query += ` ORDER BY q.created_at DESC LIMIT $${paramCount} OFFSET $${paramCount + 1}`;
        values.push(limit, offset);

        const result = await pool.query(query, values);

        // Get total count
        let countQuery = 'SELECT COUNT(*) FROM quotes q JOIN users u ON q.client_id = u.id JOIN profiles p ON p.user_id = u.id WHERE 1=1';
        const countValues = [];
        let countParamCount = 1;

        if (status) {
            countQuery += ` AND q.status = $${countParamCount}`;
            countValues.push(status);
            countParamCount++;
        }

        if (type) {
            countQuery += ` AND q.type = $${countParamCount}`;
            countValues.push(type);
            countParamCount++;
        }

        if (clientId) {
            countQuery += ` AND q.client_id = $${countParamCount}`;
            countValues.push(clientId);
            countParamCount++;
        }

        if (search) {
            countQuery += ` AND (q.reference ILIKE $${countParamCount} OR p.first_name ILIKE $${countParamCount} OR p.last_name ILIKE $${countParamCount})`;
            countValues.push(`%${search}%`);
        }

        const countResult = await pool.query(countQuery, countValues);
        const total = parseInt(countResult.rows[0].count);

        return {
            quotes: result.rows.map((row) => this.normalizeRow(row)),
            total,
            page: Math.floor(offset / limit) + 1,
            pages: Math.ceil(total / limit)
        };
    }

    // Update quote status
    static async updateStatus(id, status) {
        const result = await pool.query(
            `UPDATE quotes SET status = $1, updated_at = CURRENT_TIMESTAMP WHERE id = $2 RETURNING *`,
            [status, id]
        );

        return result.rows[0];
    }

    // Update quote
    static async update(id, data) {
        const allowedFields = ['amount', 'deductible', 'coverage_details', 'validity_days', 'vehicle_details', 'property_details'];
        const updates = [];
        const values = [];
        let paramCount = 1;

        allowedFields.forEach(field => {
            if (data[field] !== undefined) {
                if (field === 'coverage_details' && typeof data[field] !== 'string') {
                    updates.push(`${field} = $${paramCount}`);
                    values.push(JSON.stringify(data[field]));
                } else if (['vehicle_details', 'property_details'].includes(field)) {
                    updates.push(`${field} = $${paramCount}::jsonb`);
                    values.push(data[field]);
                } else {
                    updates.push(`${field} = $${paramCount}`);
                    values.push(data[field]);
                }
                paramCount++;
            }
        });

        if (updates.length === 0) return this.findById(id);

        values.push(id);
        const query = `UPDATE quotes SET ${updates.join(', ')} WHERE id = $${paramCount} RETURNING *`;
        const result = await pool.query(query, values);

        return this.normalizeRow(result.rows[0]);
    }

    // Delete quote
    static async delete(id) {
        const result = await pool.query(
            'DELETE FROM quotes WHERE id = $1 RETURNING *',
            [id]
        );

        return result.rows[0];
    }
}

module.exports = Quote;
