import React, { useEffect, useState } from 'react';

export default function EquipmentList() {
  const [equipment, setEquipment] = useState([]);

  useEffect(() => {
    fetch(`${process.env.REACT_APP_API_URL}/equipment`)
      .then(res => res.json())
      .then(data => setEquipment(data))
      .catch(err => console.error('Failed to fetch equipment:', err));
  }, []);

  return (
    <div className="p-4">
      <h2 className="text-3xl font-bold mb-4 text-blue-700">Equipment List</h2>
      <div className="overflow-x-auto shadow rounded-lg">
        <table className="min-w-full bg-white border border-gray-200">
          <thead className="bg-blue-100">
            <tr>
              <th className="py-2 px-4 border">ID</th>
              <th className="py-2 px-4 border">Name</th>
              <th className="py-2 px-4 border">Model</th>
              <th className="py-2 px-4 border">Status</th>
              <th className="py-2 px-4 border">Purchase Date</th>
            </tr>
          </thead>
          <tbody>
            {equipment.map(item => (
              <tr key={item.equipment_id} className="hover:bg-gray-50">
                <td className="py-2 px-4 border">{item.equipment_id}</td>
                <td className="py-2 px-4 border">{item.equipment_name}</td>
                <td className="py-2 px-4 border">{item.model_number}</td>
                <td className="py-2 px-4 border">{item.status}</td>
                <td className="py-2 px-4 border">{new Date(item.purchase_date).toLocaleDateString()}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}

