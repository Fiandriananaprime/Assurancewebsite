const path = require('path');
const Agency = require('../src/models/Agency');
const pool = require('../src/config/database');

(async function seed() {
  try {
    const jsonPath = path.resolve(__dirname, '..', '..', 'src', 'app', 'data', 'mama-agencies.json');
    const list = require(jsonPath);
    if (!Array.isArray(list)) throw new Error('Invalid agencies JSON');
    console.log('Seeding agencies:', list.length);
    await Agency.bulkInsert(list.map((a, idx) => ({
      name: a.name,
      address: a.address,
      phone: a.phone || null,
      lat: a.lat ?? null,
      lng: a.lng ?? null,
      image_url: a.image_url || `https://picsum.photos/seed/agency-${idx + 1}/400/300`
    })));
    console.log('Seeding agencies completed');
  } catch (err) {
    console.error('Seeding agencies failed', err.message || err);
    process.exitCode = 1;
  } finally {
    await pool.end();
  }
})();
