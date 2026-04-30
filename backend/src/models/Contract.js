const pool = require('../config/database');
const { generatePolicyNumber } = require('../utils/helpers');

class Contract {
    // Create contract
    static async create(data) {
        const policyNumber = generatePolicyNumber(data.type);

        const result = await pool.query(
            `INSERT INTO contracts (
        policy_number, client_id, quote_id, type, status, 
        start_date, end_date, annual_amount, deductible, coverage,
        payment_method, vehicle_info, property_info
      ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13) RETURNING *`,
            [
                policyNumber,
                data.client_id,
                data.quote_id,
                data.type,
                data.status || 'actif',
                data.start_date,
                data.end_date,
                data.annual_amount,
                data.deductible,
                data.coverage,
                data.payment_method || 'mensuel',
                JSON.stringify(data.vehicle_info || {}),
                JSON.stringify(data.property_info || {})
            ]
        );

        return result.rows[0];
    }

    // Find contract by ID
    static async findById(id) {
        const result = await pool.query(
            `SELECT c.*, 
              p.first_name || ' ' || p.last_name as client_name,
              u.email as client_email
       FROM contracts c
       JOIN users u ON c.client_id = u.id
       JOIN profiles p ON p.user_id = u.id
       WHERE c.id = $1`,
            [id]
        );

        return result.rows[0];
    }

    // Find contract by policy number
    static async findByPolicyNumber(policyNumber) {
        const result = await pool.query(
            `SELECT c.*, 
              p.first_name || ' ' || p.last_name as client_name,
              u.email as client_email
       FROM contracts c
       JOIN users u ON c.client_id = u.id
       JOIN profiles p ON p.user_id = u.id
       WHERE c.policy_number = $1`,
            [policyNumber]
        );

        return result.rows[0];
    }

    // Get contracts by client ID
    static async findByClientId(clientId) {
        const result = await pool.query(
            `SELECT c.*, 
              p.first_name || ' ' || p.last_name as client_name
       FROM contracts c
       JOIN profiles p ON c.client_id = p.user_id
       WHERE c.client_id = $1
       ORDER BY c.start_date DESC`,
            [clientId]
        );

        return result.rows;
    }

    // Get active contracts for a client
    static async findActiveByClientId(clientId) {
        const result = await pool.query(
            `SELECT c.* FROM contracts c
       WHERE c.client_id = $1 AND c.status = 'actif'
       ORDER BY c.end_date ASC`,
            [clientId]
        );

        return result.rows;
    }

    // Get all contracts with pagination and filters
    static async findAll({ limit, offset, status, type, clientId, search }) {
        let query = `
      SELECT c.*, 
             p.first_name || ' ' || p.last_name as client_name,
             u.email as client_email
      FROM contracts c
      JOIN users u ON c.client_id = u.id
      JOIN profiles p ON p.user_id = u.id
      WHERE 1=1
    `;

        const values = [];
        let paramCount = 1;

        if (status) {
            query += ` AND c.status = $${paramCount}`;
            values.push(status);
            paramCount++;
        }

        if (type) {
            query += ` AND c.type = $${paramCount}`;
            values.push(type);
            paramCount++;
        }

        if (clientId) {
            query += ` AND c.client_id = $${paramCount}`;
            values.push(clientId);
            paramCount++;
        }

        if (search) {
            query += ` AND (c.policy_number ILIKE $${paramCount} OR p.first_name ILIKE $${paramCount} OR p.last_name ILIKE $${paramCount})`;
            values.push(`%${search}%`);
            paramCount++;
        }

        query += ` ORDER BY c.created_at DESC LIMIT $${paramCount} OFFSET $${paramCount + 1}`;
        values.push(limit, offset);

        const result = await pool.query(query, values);

        // Get total count
        let countQuery = 'SELECT COUNT(*) FROM contracts c JOIN users u ON c.client_id = u.id JOIN profiles p ON p.user_id = u.id WHERE 1=1';
        const countValues = [];
        let countParamCount = 1;

        if (status) {
            countQuery += ` AND c.status = $${countParamCount}`;
            countValues.push(status);
            countParamCount++;
        }

        if (type) {
            countQuery += ` AND c.type = $${countParamCount}`;
            countValues.push(type);
            countParamCount++;
        }

        if (clientId) {
            countQuery += ` AND c.client_id = $${countParamCount}`;
            countValues.push(clientId);
            countParamCount++;
        }

        if (search) {
            countQuery += ` AND (c.policy_number ILIKE $${countParamCount} OR p.first_name ILIKE $${countParamCount} OR p.last_name ILIKE $${countParamCount})`;
            countValues.push(`%${search}%`);
        }

        const countResult = await pool.query(countQuery, countValues);
        const total = parseInt(countResult.rows[0].count);

        return {
            contracts: result.rows,
            total,
            page: Math.floor(offset / limit) + 1,
            pages: Math.ceil(total / limit)
        };
    }

    // Update contract status
    static async updateStatus(id, status) {
        const result = await pool.query(
            `UPDATE contracts SET status = $1 WHERE id = $2 RETURNING *`,
            [status, id]
        );

        return result.rows[0];
    }

    // Update contract
    static async update(id, data) {
        const allowedFields = ['annual_amount', 'deductible', 'coverage', 'payment_method', 'vehicle_info', 'property_info'];
        const updates = [];
        const values = [];
        let paramCount = 1;

        allowedFields.forEach(field => {
            if (data[field] !== undefined) {
                if (['vehicle_info', 'property_info'].includes(field)) {
                    updates.push(`${field} = $${paramCount}::jsonb`);
                } else {
                    updates.push(`${field} = $${paramCount}`);
                }
                values.push(data[field]);
                paramCount++;
            }
        });

        if (updates.length === 0) return this.findById(id);

        values.push(id);
        const query = `UPDATE contracts SET ${updates.join(', ')} WHERE id = $${paramCount} RETURNING *`;
        const result = await pool.query(query, values);

        return result.rows[0];
    }

    // Renew contract
    static async renew(oldContractId, newEndDate) {
        const oldContract = await this.findById(oldContractId);
        if (!oldContract) throw new Error('Contract not found');

        const newContractData = {
            ...oldContract,
            quote_id: null, // New contract not from quote
            start_date: oldContract.end_date,
            end_date: newEndDate,
            status: 'actif'
        };

        delete newContractData.id;
        delete newContractData.policy_number;
        delete newContractData.created_at;

        // Update old contract status
        await this.updateStatus(oldContractId, 'expire');

        // Create new contract
        return await this.create(newContractData);
    }

    // Delete contract
    static async delete(id) {
        const result = await pool.query(
            'DELETE FROM contracts WHERE id = $1 RETURNING *',
            [id]
        );

        return result.rows[0];
    }

    // Get contract statistics
    static async getStats() {
        const result = await pool.query(`
      SELECT 
        COUNT(*) as total,
        COUNT(CASE WHEN status = 'actif' THEN 1 END) as active,
        COUNT(CASE WHEN status = 'expire' THEN 1 END) as expired,
        COUNT(CASE WHEN status = 'en_attente' THEN 1 END) as pending,
        COUNT(CASE WHEN status = 'annule' THEN 1 END) as cancelled,
        SUM(CASE WHEN status = 'actif' THEN annual_amount ELSE 0 END) as total_revenue
      FROM contracts
    `);

        return result.rows[0];
    }
}

module.exports = Contract;