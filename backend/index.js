const express = require('express');
const cors = require('cors');
const equipmentRoutes = require('./routes/equipment'); // ✅ adjust paths if needed
const labsRoutes = require('./routes/labs');
const bookingsRoutes = require('./routes/bookings');
const usersRoutes = require('./routes/users');
const authRoutes = require('./routes/auth'); // if you have login

const app = express();
const port = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());

// Routes
app.use('/api/equipment', equipmentRoutes);
app.use('/api/labs', labsRoutes);
app.use('/api/bookings', bookingsRoutes);
app.use('/api/users', usersRoutes);
app.use('/api/auth', authRoutes); // for login

// Root test route
app.get('/', (req, res) => {
  res.send('API is working!');
});

// Start server
app.listen(port, () => {
  console.log(`✅ Server running on http://localhost:${port}`);
});
