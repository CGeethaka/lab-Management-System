const express = require('express');
const router = express.Router();
const { getAllLabs } = require('../controllers/labsController');

router.get('/', getAllLabs);

module.exports = router;
