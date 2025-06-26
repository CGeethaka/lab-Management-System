-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2025 at 04:20 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lab_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `lab_id` int(11) DEFAULT NULL,
  `equipment_id` int(11) DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `purpose` text DEFAULT NULL,
  `status` enum('pending','approved','rejected','completed') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `user_id`, `lab_id`, `equipment_id`, `start_time`, `end_time`, `purpose`, `status`, `created_at`) VALUES
(1, 1, 1, NULL, '2023-12-01 09:00:00', '2023-12-01 11:00:00', 'Chemistry class', 'approved', '2025-06-23 09:42:34'),
(2, 2, 2, NULL, '2023-12-02 13:00:00', '2023-12-02 15:00:00', 'Physics experiment', 'pending', '2025-06-23 09:42:34');

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `equipment_id` int(11) NOT NULL,
  `lab_id` int(11) DEFAULT NULL,
  `equipment_name` varchar(100) NOT NULL,
  `model_number` varchar(50) DEFAULT NULL,
  `serial_number` varchar(50) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `status` enum('available','in_use','maintenance','out_of_service') DEFAULT 'available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`equipment_id`, `lab_id`, `equipment_name`, `model_number`, `serial_number`, `purchase_date`, `status`) VALUES
(1, 1, 'Microscope', 'MX-4000', 'MICRO123', '2022-01-15', 'available'),
(2, 1, 'Centrifuge', 'CF-2000', 'CENT456', '2021-11-20', 'available'),
(3, 1, 'Analytical Balance', 'AB-5000', 'BAL789', '2023-02-10', 'available'),
(4, 2, 'Oscilloscope', 'OSC-300', 'OSC101', '2022-05-20', 'in_use'),
(5, 2, 'Spectrometer', 'SPEC-900', 'SPEC202', '2023-01-15', 'maintenance'),
(6, 2, 'Function Generator', 'FG-200', 'FUNC303', '2021-09-12', 'available'),
(7, 3, 'PCR Machine', 'PCR-500', 'PCR404', '2022-09-05', 'available'),
(8, 3, 'Autoclave', 'AC-1000', 'AUTO505', '2021-07-15', 'out_of_service'),
(9, 3, 'Incubator', 'INC-200', 'INC606', '2023-03-22', 'available');

-- --------------------------------------------------------

--
-- Table structure for table `labs`
--

CREATE TABLE `labs` (
  `lab_id` int(11) NOT NULL,
  `lab_name` varchar(50) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `labs`
--

INSERT INTO `labs` (`lab_id`, `lab_name`, `location`, `capacity`, `description`) VALUES
(1, 'Chemistry Lab', 'Building A, Room 101', 20, 'General chemistry lab'),
(2, 'Physics Lab', 'Building B, Room 201', 15, 'Physics experiments lab'),
(3, 'Biology Lab', 'Building C, Room 301', 25, 'Microbiology lab');

-- --------------------------------------------------------

--
-- Table structure for table `maintenance`
--

CREATE TABLE `maintenance` (
  `maintenance_id` int(11) NOT NULL,
  `equipment_id` int(11) DEFAULT NULL,
  `reported_by` int(11) DEFAULT NULL,
  `issue_description` text NOT NULL,
  `status` enum('reported','in_progress','completed') DEFAULT 'reported',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `maintenance`
--

INSERT INTO `maintenance` (`maintenance_id`, `equipment_id`, `reported_by`, `issue_description`, `status`, `start_date`, `end_date`, `notes`) VALUES
(1, 1, 1, 'Lens calibration needed', 'in_progress', '2023-11-01', NULL, 'Waiting for calibration tools'),
(2, 2, 2, 'Motor replacement', 'completed', '2023-10-15', '2023-10-18', 'Full motor assembly replaced'),
(3, 3, 1, 'Software update required', 'reported', '2023-11-20', NULL, 'Contact vendor for update package'),
(4, 1, 2, 'Annual service', 'reported', '2023-12-01', NULL, 'Preventive maintenance');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` enum('admin','technician','faculty','student') NOT NULL,
  `department` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `full_name`, `email`, `role`, `department`, `created_at`) VALUES
(1, 'admin', 'admin123', 'System Administrator', 'admin@lab.edu', 'admin', 'Management', '2023-01-01 02:30:00'),
(2, 'jdoe', 'password123', 'John Doe', 'jdoe@lab.edu', 'technician', 'Chemistry', '2023-01-02 03:45:00'),
(3, 'msmith', 'xyz123\n', 'Mary Smith', 'msmith@lab.edu', 'faculty', 'Biology', '2023-01-03 05:00:00'),
(4, 'tjohnson', 'temp789', 'Tom Johnson', 'tjohnson@lab.edu', 'student', 'Physics', '2023-01-04 06:15:00'),
(5, 'slee', 'demo123', 'Sarah Lee', 'slee@lab.edu', 'student', 'Computer Science', '2023-01-05 07:50:00'),
(6, 'rwilliams', 'pass1234', 'Robert Williams', 'rwilliams@lab.edu', 'technician', 'Engineering', '2025-06-23 09:33:20'),
(7, 'kjohnson', 'test7890', 'Karen Johnson', 'kjohnson@lab.edu', 'faculty', 'Mathematics', '2025-06-23 09:33:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `lab_id` (`lab_id`),
  ADD KEY `equipment_id` (`equipment_id`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`equipment_id`),
  ADD UNIQUE KEY `serial_number` (`serial_number`),
  ADD KEY `lab_id` (`lab_id`);

--
-- Indexes for table `labs`
--
ALTER TABLE `labs`
  ADD PRIMARY KEY (`lab_id`);

--
-- Indexes for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD PRIMARY KEY (`maintenance_id`),
  ADD KEY `equipment_id` (`equipment_id`),
  ADD KEY `reported_by` (`reported_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `equipment`
--
ALTER TABLE `equipment`
  MODIFY `equipment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `labs`
--
ALTER TABLE `labs`
  MODIFY `lab_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `maintenance`
--
ALTER TABLE `maintenance`
  MODIFY `maintenance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`lab_id`) REFERENCES `labs` (`lab_id`),
  ADD CONSTRAINT `bookings_ibfk_3` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`equipment_id`);

--
-- Constraints for table `equipment`
--
ALTER TABLE `equipment`
  ADD CONSTRAINT `equipment_ibfk_1` FOREIGN KEY (`lab_id`) REFERENCES `labs` (`lab_id`);

--
-- Constraints for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD CONSTRAINT `maintenance_ibfk_1` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`equipment_id`),
  ADD CONSTRAINT `maintenance_ibfk_2` FOREIGN KEY (`reported_by`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
