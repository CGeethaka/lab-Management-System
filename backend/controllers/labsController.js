const pool = require('../config/db');

const getAllLabs = async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM labs');
    res.json(rows);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

module.exports = { getAllLabs };
