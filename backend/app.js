const express = require('express');
const cors = require('cors');
const app = express();

const equipmentRoutes = require('./routes/equipmentRoutes');
const labsRoutes = require('./routes/labsRoutes');
const bookingsRoutes = require('./routes/bookingsRoutes');
const usersRoutes = require('./routes/usersRoutes');
const authRoutes = require('./routes/authRoutes');

app.use(cors());
app.use(express.json());

app.use('/api/equipment', equipmentRoutes);
app.use('/api/labs', labsRoutes);
app.use('/api/bookings', bookingsRoutes);
app.use('/api/users', usersRoutes);
app.use('/api/auth', authRoutes);

app.listen(5000, () => {
  console.log('Server running on http://localhost:5000');
});





