const express = require('express');
const router = express.Router();

// expects a configured pg pool exported from ../db or ../database
const pool = require('../config/database');

// GET /api/meta/tarifs - return all tariff reference tables
router.get('/tarifs', async (req, res) => {
  try {
    const [puissance, age, km, cylindree, superficie, mobilier] = await Promise.all([
      pool.query('SELECT * FROM tarif_puissance_auto ORDER BY cv_fiscaux'),
      pool.query('SELECT * FROM tarif_age_conducteur ORDER BY age_min'),
      pool.query('SELECT * FROM tarif_kilometrage ORDER BY km_max'),
      pool.query('SELECT * FROM tarif_cylindree_moto ORDER BY cc_max'),
      pool.query('SELECT * FROM tarif_superficie_hab ORDER BY surface_max'),
      pool.query('SELECT * FROM tarif_valeur_mobilier ORDER BY valeur_max')
    ]);

    return res.json({
      puissance: puissance.rows,
      age: age.rows,
      kilometrage: km.rows,
      cylindree: cylindree.rows,
      superficie: superficie.rows,
      mobilier: mobilier.rows
    });
  } catch (err) {
    console.error('meta/tarifs error', err);
    res.status(500).json({ message: 'Failed to load tariffs' });
  }
});

// GET /api/meta/clients - return clients list (basic)
router.get('/clients', async (req, res) => {
  try {
    const result = await pool.query('SELECT id, nom_prenom, email, telephone, date_creation FROM clients ORDER BY id');
    res.json({ clients: result.rows });
  } catch (err) {
    console.error('meta/clients error', err);
    res.status(500).json({ message: 'Failed to load clients' });
  }
});

module.exports = router;
