import React, { useState } from 'react';
import { BrowserRouter as Router, Routes, Route, Link, Navigate } from 'react-router-dom';

import EquipmentList from './components/EquipmentList';
import LabsList from './components/LabsList';
import BookingsList from './components/BookingsList';
import UsersList from './components/UsersList';
import Home from './components/Home';
import Login from './components/Login'; // ✅ import Login

function App() {
  const [user, setUser] = useState(() => {
    const saved = localStorage.getItem('token');
    return saved ? { role: 'user' } : null;
  });

  const ProtectedRoute = ({ children, role }) => {
    if (!user) return <Navigate to="/login" />;
    if (role && user.role !== role) return <Navigate to="/" />;
    return children;
  };

  return (
    <Router>
      <nav className="p-4 bg-gray-100 space-x-4">
        <Link to="/" className="text-blue-600 hover:underline">Home</Link>
        {user && (
          <>
            <Link to="/equipment" className="text-blue-600 hover:underline">Equipment</Link>
            <Link to="/labs" className="text-blue-600 hover:underline">Labs</Link>
            <Link to="/bookings" className="text-blue-600 hover:underline">Bookings</Link>
            {user.role === 'admin' && (
              <Link to="/users" className="text-blue-600 hover:underline">Users</Link>
            )}
          </>
        )}
        {!user ? (
          <Link to="/login" className="text-green-600 hover:underline">Login</Link>
        ) : (
          <button
            onClick={() => {
              localStorage.removeItem('token');
              setUser(null);
            }}
            className="text-red-600 hover:underline"
          >
            Logout
          </button>
        )}
      </nav>

      <div className="p-4">
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/login" element={<Login setUser={setUser} />} />
          <Route path="/equipment" element={
            <ProtectedRoute>
              <EquipmentList />
            </ProtectedRoute>
          } />
          <Route path="/labs" element={
            <ProtectedRoute>
              <LabsList />
            </ProtectedRoute>
          } />
          <Route path="/bookings" element={
            <ProtectedRoute>
              <BookingsList />
            </ProtectedRoute>
          } />
          <Route path="/users" element={
            <ProtectedRoute role="admin">
              <UsersList />
            </ProtectedRoute>
          } />
          <Route path="*" element={<p>Select a page from above</p>} />
        </Routes>
      </div>
    </Router>
  );
}

export default App;
