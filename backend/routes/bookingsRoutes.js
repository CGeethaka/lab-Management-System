const express = require('express');
const router = express.Router();
const { getAllBookings } = require('../controllers/bookingsController');

router.get('/', getAllBookings);

module.exports = router;
