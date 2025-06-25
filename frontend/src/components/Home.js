import React from 'react';

export default function Home() {
  return (
    <div className="min-h-screen bg-gradient-to-r from-blue-100 to-white flex flex-col items-center justify-center text-center">
      <h1 className="text-5xl font-bold text-blue-700 mb-6">Welcome to the Lab Management System</h1>
      <p className="text-lg text-gray-700 mb-6">Use the navigation above to manage labs, equipment, bookings, and users.</p>
    </div>
  );
}
