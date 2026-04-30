const pool = require('../config/database');
const { generateReference } = require('../utils/helpers');

class Incident {
    // Create incident
    static async create(data) {
        const reference = generateReference('INC');

        const result = await pool.query(
            `INSERT INTO incidents (
        reference, contract_id, client_id, title, description, 
        date, time, location, type, severity, status, 
        estimated_cost, assigned_employee_id
      ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13) 
      RETURNING *`,
            [
                reference,
                data.contract_id,
                data.client_id,
                data.title,
                data.description,
                data.date,
                data.time,
                data.location,
                data.type,
                data.severity || 'moyen',
                data.status || 'en_cours',
                data.estimated_cost,
                data.assigned_employee_id
            ]
        );

        return result.rows[0];
    }

    // Find incident by ID
    static async findById(id) {
        const result = await pool.query(
            `SELECT i.*, 
              c.policy_number,
              p.first_name || ' ' || p.last_name as client_name,
              u.email as client_email,
              ep.first_name || ' ' || ep.last_name as assigned_employee_name
       FROM incidents i
       JOIN contracts c ON i.contract_id = c.id
       JOIN users u ON c.client_id = u.id
       JOIN profiles p ON p.user_id = u.id
       LEFT JOIN profiles ep ON i.assigned_employee_id = ep.user_id
       WHERE i.id = $1`,
            [id]
        );

        return result.rows[0];
    }

    // Find incident by reference
    static async findByReference(reference) {
        const result = await pool.query(
            `SELECT i.*, 
              c.policy_number,
              p.first_name || ' ' || p.last_name as client_name,
              u.email as client_email
       FROM incidents i
       JOIN contracts c ON i.contract_id = c.id
       JOIN users u ON c.client_id = u.id
       JOIN profiles p ON p.user_id = u.id
       WHERE i.reference = $1`,
            [reference]
        );

        return result.rows[0];
    }

    // Get incidents by client ID
    static async findByClientId(clientId) {
        const result = await pool.query(
            `SELECT i.*, 
              c.policy_number,
              p.first_name || ' ' || p.last_name as client_name
       FROM incidents i
       JOIN contracts c ON i.contract_id = c.id
       JOIN profiles p ON c.client_id = p.user_id
       WHERE c.client_id = $1
       ORDER BY i.created_at DESC`,
            [clientId]
        );

        return result.rows;
    }

    // Get incidents by contract ID
    static async findByContractId(contractId) {
        const result = await pool.query(
            `SELECT i.*, 
              p.first_name || ' ' || p.last_name as client_name
       FROM incidents i
       JOIN contracts c ON i.contract_id = c.id
       JOIN profiles p ON c.client_id = p.user_id
       WHERE i.contract_id = $1
       ORDER BY i.date DESC`,
            [contractId]
        );

        return result.rows;
    }

    // Get all incidents with pagination and filters
    static async findAll({ limit, offset, status, severity, type, clientId, assignedEmployeeId, search }) {
        let query = `
      SELECT i.*, 
             c.policy_number,
             p.first_name || ' ' || p.last_name as client_name,
             u.email as client_email,
             ep.first_name || ' ' || ep.last_name as assigned_employee_name
      FROM incidents i
      JOIN contracts c ON i.contract_id = c.id
      JOIN users u ON c.client_id = u.id
      JOIN profiles p ON p.user_id = u.id
      LEFT JOIN profiles ep ON i.assigned_employee_id = ep.user_id
      WHERE 1=1
    `;

        const values = [];
        let paramCount = 1;

        if (status) {
            query += ` AND i.status = $${paramCount}`;
            values.push(status);
            paramCount++;
        }

        if (severity) {
            query += ` AND i.severity = $${paramCount}`;
            values.push(severity);
            paramCount++;
        }

        if (type) {
            query += ` AND i.type = $${paramCount}`;
            values.push(type);
            paramCount++;
        }

        if (clientId) {
            query += ` AND c.client_id = $${paramCount}`;
            values.push(clientId);
            paramCount++;
        }

        if (assignedEmployeeId) {
            query += ` AND i.assigned_employee_id = $${paramCount}`;
            values.push(assignedEmployeeId);
            paramCount++;
        }

        if (search) {
            query += ` AND (i.reference ILIKE $${paramCount} OR i.title ILIKE $${paramCount} OR p.first_name ILIKE $${paramCount} OR p.last_name ILIKE $${paramCount})`;
            values.push(`%${search}%`);
            paramCount++;
        }

        query += ` ORDER BY i.created_at DESC LIMIT $${paramCount} OFFSET $${paramCount + 1}`;
        values.push(limit, offset);

        const result = await pool.query(query, values);

        // Get total count
        let countQuery = 'SELECT COUNT(*) FROM incidents i JOIN contracts c ON i.contract_id = c.id JOIN profiles p ON c.client_id = p.user_id WHERE 1=1';
        const countValues = [];
        let countParamCount = 1;

        if (status) {
            countQuery += ` AND i.status = $${countParamCount}`;
            countValues.push(status);
            countParamCount++;
        }

        if (severity) {
            countQuery += ` AND i.severity = $${countParamCount}`;
            countValues.push(severity);
            countParamCount++;
        }

        if (type) {
            countQuery += ` AND i.type = $${countParamCount}`;
            countValues.push(type);
            countParamCount++;
        }

        if (clientId) {
            countQuery += ` AND c.client_id = $${countParamCount}`;
            countValues.push(clientId);
            countParamCount++;
        }

        if (assignedEmployeeId) {
            countQuery += ` AND i.assigned_employee_id = $${countParamCount}`;
            countValues.push(assignedEmployeeId);
            countParamCount++;
        }

        if (search) {
            countQuery += ` AND (i.reference ILIKE $${countParamCount} OR i.title ILIKE $${countParamCount} OR p.first_name ILIKE $${countParamCount} OR p.last_name ILIKE $${countParamCount})`;
            countValues.push(`%${search}%`);
        }

        const countResult = await pool.query(countQuery, countValues);
        const total = parseInt(countResult.rows[0].count);

        return {
            incidents: result.rows,
            total,
            page: Math.floor(offset / limit) + 1,
            pages: Math.ceil(total / limit)
        };
    }

    // Update incident
    static async update(id, data) {
        const allowedFields = ['status', 'severity', 'estimated_cost', 'assigned_employee_id', 'description'];
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

        const query = `UPDATE incidents SET ${updates.join(', ')} WHERE id = $${paramCount} RETURNING *`;
        const result = await pool.query(query, values);

        return result.rows[0];
    }

    // Assign incident to employee
    static async assignToEmployee(id, employeeId) {
        const result = await pool.query(
            `UPDATE incidents 
       SET assigned_employee_id = $1, status = 'en_cours', updated_at = CURRENT_TIMESTAMP 
       WHERE id = $2 
       RETURNING *`,
            [employeeId, id]
        );

        return result.rows[0];
    }

    // Get incident statistics
    static async getStats() {
        const result = await pool.query(`
      SELECT 
        COUNT(*) as total,
        COUNT(CASE WHEN status = 'en_cours' THEN 1 END) as in_progress,
        COUNT(CASE WHEN status = 'traite' THEN 1 END) as resolved,
        COUNT(CASE WHEN status = 'en_attente' THEN 1 END) as pending,
        COUNT(CASE WHEN severity = 'leger' THEN 1 END) as light,
        COUNT(CASE WHEN severity = 'moyen' THEN 1 END) as medium,
        COUNT(CASE WHEN severity = 'eleve' THEN 1 END) as severe,
        COALESCE(SUM(estimated_cost), 0) as total_estimated_cost
      FROM incidents
    `);

        return result.rows[0];
    }
}

module.exports = Incident;