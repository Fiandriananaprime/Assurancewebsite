const fs = require('fs');
const path = require('path');
const pool = require('../src/config/database');

async function runSqlFile(filePath) {
    try {
        const sql = fs.readFileSync(filePath, 'utf8');
        await pool.query(sql);
        console.log('✅ SQL executed successfully');
    } catch (err) {
        console.error('❌ Failed to execute SQL file:', err.message || err);
        process.exit(1);
    } finally {
        await pool.end();
    }
}

const sqlFile = process.argv[2] || path.join(__dirname, '..', 'sql', 'create_events_table.sql');
runSqlFile(sqlFile);
