const { Pool } = require('pg');
require('dotenv').config();

const dbPassword = (() => {
    // coerce to string to avoid non-string types coming from env loaders
    const p = process.env.DB_PASSWORD;
    if (p === undefined || p === null) return '';
    try { return String(p); } catch (e) { return '' }
})();

if (!dbPassword) {
    console.warn('⚠️  Warning: DB_PASSWORD is empty. Check backend/.env or environment variables.');
}

const pool = new Pool({
    host: process.env.DB_HOST || 'localhost',
    port: process.env.DB_PORT || 5432,
    database: process.env.DB_NAME || 'assurance_mama',
    user: process.env.DB_USER || 'postgres',
    password: dbPassword,
    max: 20,
    idleTimeoutMillis: 30000,
    connectionTimeoutMillis: 2000,
});

// Test database connection
pool.on('connect', () => {
    console.log('✅ Database connected successfully');
});

pool.on('error', (err) => {
    console.error('❌ Unexpected database error:', err);
    process.exit(-1);
});

module.exports = pool;