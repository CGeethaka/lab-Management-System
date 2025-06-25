const mysql = require('mysql2/promise');
require('dotenv').config();

(async () => {
  try {
    const connection = await mysql.createConnection({
      host: process.env.DB_HOST,
      user: process.env.DB_USER,
      password: process.env.DB_PASSWORD,
      database: process.env.DB_NAME
    });

    const [rows] = await connection.execute('SELECT * FROM equipment');
    console.log("✅ Equipment rows:", rows);
    await connection.end();
  } catch (err) {
    console.error('❌ Connection failed:', err); // Show full error object
  }
})();

