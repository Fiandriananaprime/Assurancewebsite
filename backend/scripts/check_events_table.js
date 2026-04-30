const pool = require('../src/config/database');

async function check() {
    try {
        const res = await pool.query('SELECT COUNT(*) FROM events');
        console.log('Events table exists. Row count:', res.rows[0].count);
    } catch (err) {
        console.error('Error checking events table:', err.message || err);
        process.exit(1);
    } finally {
        await pool.end();
    }
}

check();
