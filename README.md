# Lab Management System

A comprehensive web application designed to manage laboratories, equipment, users, and bookings efficiently. This project features a React frontend and a Node.js/Express backend, facilitating seamless lab resource management.

---

## Project Description

The Lab Management System streamlines the administration of laboratory resources, including equipment tracking, lab management, user authentication, and booking scheduling. It provides a user-friendly interface and robust backend APIs to support real-time data handling and secure user login.

---

## Key Features

- User Authentication and Authorization  
- Equipment Management with detailed status and purchase info  
- Lab Management for multiple laboratory locations  
- Booking System for reserving labs and equipment  
- Responsive and intuitive React-based UI  
- RESTful API backend with Express and MySQL  
- Password hashing and JWT-based authentication for security  

---

## Installation

1. **Clone the repository:**

```bash
git clone https://github.com/CGeethaka/lab-Management-System.git
cd lab-Management-System

## Database

The database schema is included in the `database/lab_management_schema.sql` file.  
You can import this into your MySQL/MariaDB server to set up the required tables.


## Install dependencies for backend and frontend

cd backend
npm install

cd ../frontend
npm install

## Configure environment variables

Create .env files in both backend and frontend folders.
Setup your API URLs, database credentials, and JWT secrets as required.

## Running the Application

Use the concurrently package to run backend and frontend together with one command from the root folder.

npm start

