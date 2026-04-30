const pool = require('../config/database');

class Event {
    // Create event
    static async create(data) {
        const result = await pool.query(
            `INSERT INTO events (
          title, excerpt, content, author_id, category,
          image_url, status, event_date, location, read_time
        ) VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10) RETURNING *`,
            [
                data.title,
                data.excerpt,
                data.content,
                data.author_id,
                data.category,
                data.image_url,
                data.status || 'publie',
                data.event_date,
                data.location,
                data.read_time
            ]
        );

        return result.rows[0];
    }

    // Find event by ID
    static async findById(id) {
        const result = await pool.query(
            `SELECT e.*, p.first_name || ' ' || p.last_name as author_name, p.profile_image_url as author_image
       FROM events e
       LEFT JOIN profiles p ON p.user_id::text = e.author_id::text
       WHERE e.id = $1`,
            [id]
        );

        return result.rows[0];
    }

    // Get events with pagination and filters
    static async findAll({ limit, offset, status, upcomingOnly }) {
        let query = `
      SELECT e.*, 
          p.first_name || ' ' || p.last_name as author_name
      FROM events e
      LEFT JOIN profiles p ON p.user_id::text = e.author_id::text
      WHERE 1=1
    `;

        const values = [];
        let paramCount = 1;

        if (upcomingOnly) {
            query += ` AND e.event_date >= CURRENT_DATE`;
        }

        if (status) {
            query += ` AND e.status = $${paramCount}`;
            values.push(status);
            paramCount++;
        }

        query += ` ORDER BY e.event_date ASC LIMIT $${paramCount} OFFSET $${paramCount + 1}`;
        values.push(limit, offset);

        try {
            const result = await pool.query(query, values);

            // Get total count
            let countQuery = 'SELECT COUNT(*) FROM events e WHERE 1=1';
            const countValues = [];
            let countParamCount = 1;

            if (upcomingOnly) {
                countQuery += ` AND e.event_date >= CURRENT_DATE`;
            }

            if (status) {
                countQuery += ` AND e.status = $${countParamCount}`;
                countValues.push(status);
            }

            const countResult = await pool.query(countQuery, countValues);
            const total = parseInt(countResult.rows[0].count);

            return {
                events: result.rows,
                total,
                page: Math.floor(offset / limit) + 1,
                pages: Math.ceil(total / limit)
            };
        } catch (err) {
            console.error('Event.findAll SQL error', { query, values, err });
            throw err;
        }
    }

    // Update event
    static async update(id, data) {
        const allowedFields = ['title', 'excerpt', 'content', 'category', 'image_url', 'status', 'event_date', 'location', 'read_time'];
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

        const query = `UPDATE events SET ${updates.join(', ')} WHERE id = $${paramCount} RETURNING *`;
        const result = await pool.query(query, values);

        return result.rows[0];
    }

    // Delete event
    static async delete(id) {
        const result = await pool.query(
            'DELETE FROM events WHERE id = $1 RETURNING *',
            [id]
        );

        return result.rows[0];
    }
}

module.exports = Event;
