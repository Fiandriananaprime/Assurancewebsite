const pool = require('../config/database');

class Document {
    // Create document
    static async create(data) {
        const result = await pool.query(
            `INSERT INTO documents (
        name, file_url, file_type, file_size, entity_type, entity_id, uploaded_by
      ) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *`,
            [
                data.name,
                data.file_url,
                data.file_type,
                data.file_size,
                data.entity_type,
                data.entity_id,
                data.uploaded_by
            ]
        );

        return result.rows[0];
    }

    // Find document by ID
    static async findById(id) {
        const result = await pool.query(
            `SELECT d.*, 
              p.first_name || ' ' || p.last_name as uploaded_by_name
       FROM documents d
       LEFT JOIN profiles p ON d.uploaded_by = p.user_id
       WHERE d.id = $1`,
            [id]
        );

        return result.rows[0];
    }

    // Get documents by entity
    static async findByEntity(entityType, entityId) {
        const result = await pool.query(
            `SELECT d.*, 
              p.first_name || ' ' || p.last_name as uploaded_by_name
       FROM documents d
       LEFT JOIN profiles p ON d.uploaded_by = p.user_id
       WHERE d.entity_type = $1 AND d.entity_id = $2
       ORDER BY d.created_at DESC`,
            [entityType, entityId]
        );

        return result.rows;
    }

    // Get documents by uploaded by user
    static async findByUploadedBy(userId) {
        const result = await pool.query(
            `SELECT d.* FROM documents d
       WHERE d.uploaded_by = $1
       ORDER BY d.created_at DESC`,
            [userId]
        );

        return result.rows;
    }

    // Delete document
    static async delete(id) {
        const result = await pool.query(
            'DELETE FROM documents WHERE id = $1 RETURNING *',
            [id]
        );

        return result.rows[0];
    }
}

module.exports = Document;