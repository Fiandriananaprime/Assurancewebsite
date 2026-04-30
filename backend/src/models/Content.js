const pool = require('../config/database');

class Content {
    // Create content (blog post or event)
    static async create(data) {
        const result = await pool.query(
            `INSERT INTO content (
        type, title, excerpt, content, author_id, category, 
        image_url, status, event_date, location, read_time
      ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11) RETURNING *`,
            [
                data.type || 'blog',
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

    // Find content by ID
    static async findById(id) {
        const result = await pool.query(
            `SELECT c.*, 
              p.first_name || ' ' || p.last_name as author_name,
              p.profile_image_url as author_image
       FROM content c
       LEFT JOIN profiles p ON c.author_id = p.user_id
       WHERE c.id = $1`,
            [id]
        );

        return result.rows[0];
    }

    // Get all blog posts with pagination and filters
    static async findBlogPosts({ limit, offset, status, category, search, publishedOnly }) {
        let query = `
      SELECT c.*, 
             p.first_name || ' ' || p.last_name as author_name,
             p.profile_image_url as author_image
      FROM content c
      LEFT JOIN profiles p ON c.author_id = p.user_id
      WHERE c.type = 'blog'
    `;

        const values = [];
        let paramCount = 1;

        if (publishedOnly) {
            query += ` AND c.status = 'publie'`;
        } else if (status) {
            query += ` AND c.status = $${paramCount}`;
            values.push(status);
            paramCount++;
        }

        if (category) {
            query += ` AND c.category = $${paramCount}`;
            values.push(category);
            paramCount++;
        }

        if (search) {
            query += ` AND (c.title ILIKE $${paramCount} OR c.excerpt ILIKE $${paramCount} OR c.content ILIKE $${paramCount})`;
            values.push(`%${search}%`);
            paramCount++;
        }

        query += ` ORDER BY c.created_at DESC LIMIT $${paramCount} OFFSET $${paramCount + 1}`;
        values.push(limit, offset);

        const result = await pool.query(query, values);

        // Get total count
        let countQuery = 'SELECT COUNT(*) FROM content c WHERE c.type = \'blog\'';
        const countValues = [];
        let countParamCount = 1;

        if (publishedOnly) {
            countQuery += ` AND c.status = 'publie'`;
        } else if (status) {
            countQuery += ` AND c.status = $${countParamCount}`;
            countValues.push(status);
            countParamCount++;
        }

        if (category) {
            countQuery += ` AND c.category = $${countParamCount}`;
            countValues.push(category);
            countParamCount++;
        }

        if (search) {
            countQuery += ` AND (c.title ILIKE $${countParamCount} OR c.excerpt ILIKE $${countParamCount} OR c.content ILIKE $${countParamCount})`;
            countValues.push(`%${search}%`);
        }

        const countResult = await pool.query(countQuery, countValues);
        const total = parseInt(countResult.rows[0].count);

        return {
            posts: result.rows,
            total,
            page: Math.floor(offset / limit) + 1,
            pages: Math.ceil(total / limit)
        };
    }

    // Get all events with pagination and filters
    static async findEvents({ limit, offset, status, upcomingOnly }) {
        let query = `
      SELECT c.*, 
             p.first_name || ' ' || p.last_name as author_name
      FROM content c
      LEFT JOIN profiles p ON c.author_id = p.user_id
      WHERE c.type = 'event'
    `;

        const values = [];
        let paramCount = 1;

        if (upcomingOnly) {
            query += ` AND c.event_date >= CURRENT_DATE`;
        }

        if (status) {
            query += ` AND c.status = $${paramCount}`;
            values.push(status);
            paramCount++;
        }

        query += ` ORDER BY c.event_date ASC LIMIT $${paramCount} OFFSET $${paramCount + 1}`;
        values.push(limit, offset);

        const result = await pool.query(query, values);

        // Get total count
        let countQuery = 'SELECT COUNT(*) FROM content c WHERE c.type = \'event\'';
        const countValues = [];
        let countParamCount = 1;

        if (upcomingOnly) {
            countQuery += ` AND c.event_date >= CURRENT_DATE`;
        }

        if (status) {
            countQuery += ` AND c.status = $${countParamCount}`;
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
    }

    // Update content
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

        const query = `UPDATE content SET ${updates.join(', ')} WHERE id = $${paramCount} RETURNING *`;
        const result = await pool.query(query, values);

        return result.rows[0];
    }

    // Increment view count
    static async incrementViews(id) {
        const result = await pool.query(
            `UPDATE content SET views_count = views_count + 1 WHERE id = $1 RETURNING *`,
            [id]
        );

        return result.rows[0];
    }

    // Delete content
    static async delete(id) {
        // Basic UUID format validation to avoid passing invalid values to Postgres UUID columns
        // Accept standard 36-char UUID format (8-4-4-4-12 hex chars)
        try {
            if (!id || !String(id).match(/^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$/)) {
                const err = new Error('Invalid UUID format');
                err.code = 'INVALID_UUID';
                throw err;
            }
        } catch (e) {
            throw e;
        }
        const result = await pool.query(
            'DELETE FROM content WHERE id = $1 RETURNING *',
            [id]
        );

        return result.rows[0];
    }

    // Get content statistics
    static async getStats() {
                const result = await pool.query(`
            SELECT 
                (SELECT COUNT(*) FROM content WHERE type = 'blog') as total_blogs,
                (SELECT COUNT(*) FROM events) as total_events,
                (SELECT COUNT(*) FROM content WHERE type = 'blog' AND status = 'publie') as published_blogs,
                (SELECT SUM(views_count) FROM content WHERE type = 'blog') as total_views
        `);

        return result.rows[0];
    }
}

module.exports = Content;