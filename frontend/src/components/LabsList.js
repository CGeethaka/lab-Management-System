import React, { useEffect, useState } from 'react';

function LabsList() {
  const [labs, setLabs] = useState([]);

  useEffect(() => {
    fetch(`${process.env.REACT_APP_API_URL}/labs`)
      .then(res => res.json())
      .then(data => setLabs(data))
      .catch(err => console.error('Error:', err));
  }, []);

  return (
    <div className="p-4">
      <h2 className="text-3xl font-bold mb-4 text-blue-700">Labs</h2>
      <div className="overflow-x-auto shadow rounded-lg">
        <table className="min-w-full bg-white border border-gray-200">
          <thead className="bg-blue-100">
            <tr>
              <th className="py-2 px-4 border">Lab ID</th>
              <th className="py-2 px-4 border">Lab Name</th>
              <th className="py-2 px-4 border">Location</th>
              <th className="py-2 px-4 border">Capacity</th>
              <th className="py-2 px-4 border">Description</th>
            </tr>
          </thead>
          <tbody>
            {labs.map(lab => (
              <tr key={lab.lab_id} className="hover:bg-gray-50">
                <td className="py-2 px-4 border">{lab.lab_id}</td>
                <td className="py-2 px-4 border">{lab.lab_name}</td>
                <td className="py-2 px-4 border">{lab.location}</td>
                <td className="py-2 px-4 border">{lab.capacity}</td>
                <td className="py-2 px-4 border">{lab.description}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}

export default LabsList;



