// src/components/BookingsList.js
import React, { useEffect, useState } from 'react';

function BookingsList() {
  const [bookings, setBookings] = useState([]);

  useEffect(() => {
    fetch(`${process.env.REACT_APP_API_URL}/bookings`)
      .then(res => res.json())
      .then(data => setBookings(data))
      .catch(err => console.error('Error:', err));
  }, []);

  return (
    <div className="p-4">
      <h2 className="text-3xl font-bold mb-4 text-blue-700">Bookings</h2>
      <div className="overflow-x-auto shadow rounded-lg">
        <table className="min-w-full bg-white border border-gray-200">
          <thead className="bg-blue-100">
            <tr>
              <th className="py-2 px-4 border">Booking ID</th>
              <th className="py-2 px-4 border">User ID</th>
              <th className="py-2 px-4 border">Lab ID</th>
              <th className="py-2 px-4 border">Equipment ID</th>
              <th className="py-2 px-4 border">Start</th>
              <th className="py-2 px-4 border">End</th>
              <th className="py-2 px-4 border">Purpose</th>
              <th className="py-2 px-4 border">Status</th>
            </tr>
          </thead>
          <tbody>
            {bookings.map(booking => (
              <tr key={booking.booking_id} className="hover:bg-gray-50">
                <td className="py-2 px-4 border">{booking.booking_id}</td>
                <td className="py-2 px-4 border">{booking.user_id}</td>
                <td className="py-2 px-4 border">{booking.lab_id}</td>
                <td className="py-2 px-4 border">{booking.equipment_id}</td>
                <td className="py-2 px-4 border">{new Date(booking.start_time).toLocaleString()}</td>
                <td className="py-2 px-4 border">{new Date(booking.end_time).toLocaleString()}</td>
                <td className="py-2 px-4 border">{booking.purpose}</td>
                <td className="py-2 px-4 border">{booking.status}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}

export default BookingsList;

