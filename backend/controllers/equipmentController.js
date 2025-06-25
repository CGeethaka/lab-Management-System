const pool = require('../config/db');

const getAllEquipment = async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM equipment');
    res.json(rows);
  } catch (err) {
    console.error("Database error:", err); // logs to terminal
    res.status(500).json({ error: err.message || 'Something went wrong' });
  }
  
};

module.exports = { getAllEquipment };
