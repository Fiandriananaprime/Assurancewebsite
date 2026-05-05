const express = require('express');
const router = express.Router();
const Agency = require('../models/Agency');
const { successResponse, errorResponse } = require('../utils/helpers');
const { getPagination } = require('../utils/helpers');

// GET /api/agencies - public list
router.get('/', async (req, res) => {
  try {
    const { page, limit, all } = req.query;
    if (all === '1' || all === 'true') {
      const rows = await Agency.findAll();
      return res.json(successResponse(rows, 'All agencies retrieved', { meta: { total: rows.length } }));
    }

    const { limit: lim, offset, page: pg } = getPagination(page, limit);
    const { rows, total } = await Agency.findPaginated(lim, offset);
    res.json(successResponse(rows, 'Agencies retrieved', { meta: { total, page: pg, limit: lim } }));
  } catch (err) {
    console.error('Get agencies error', err);
    res.status(500).json(errorResponse('Server error', 500));
  }
});

module.exports = router;
