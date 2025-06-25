const express = require('express');
const router = express.Router();
const { getAllEquipment } = require('../controllers/equipmentController');

router.get('/', getAllEquipment);

module.exports = router;
