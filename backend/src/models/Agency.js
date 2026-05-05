const pool = require('../config/database');

class Agency {
  static async create(data) {
    const result = await pool.query(
      `INSERT INTO agencies (name, address, phone, lat, lng, image_url) VALUES ($1, $2, $3, $4, $5, $6) RETURNING *`,
      [data.name, data.address, data.phone, data.lat, data.lng, data.image_url || null]
    );
    return result.rows[0];
  }

  static async findAll() {
    const result = await pool.query(`SELECT * FROM agencies ORDER BY name`);
    return result.rows;
  }

  // Paginated finder: returns { rows, total }
  static async findPaginated(limit = 10, offset = 0) {
    const client = await pool.connect();
    try {
      const totalRes = await client.query('SELECT COUNT(*)::int as count FROM agencies');
      const total = totalRes.rows[0].count;
      const res = await client.query('SELECT * FROM agencies ORDER BY name LIMIT $1 OFFSET $2', [limit, offset]);
      return { rows: res.rows, total };
    } finally {
      client.release();
    }
  }

  static async bulkInsert(list) {
    const client = await pool.connect();
    try {
      await client.query('BEGIN');
      for (const a of list) {
        await client.query(
          `INSERT INTO agencies (name, address, phone, lat, lng, image_url) VALUES ($1,$2,$3,$4,$5,$6) ON CONFLICT DO NOTHING`,
          [a.name, a.address, a.phone, a.lat, a.lng, a.image_url || null]
        );
      }
      await client.query('COMMIT');
    } catch (err) {
      await client.query('ROLLBACK');
      throw err;
    } finally {
      client.release();
    }
  }
}

module.exports = Agency;
