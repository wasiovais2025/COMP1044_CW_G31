-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2026 at 03:31 PM
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
-- Database: `internship_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `assessments`
--

CREATE TABLE `assessments` (
  `assessment_id` int(11) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `tasks_marks` decimal(4,2) DEFAULT 0.00,
  `health_safety_marks` decimal(4,2) DEFAULT 0.00,
  `knowledge_marks` decimal(4,2) DEFAULT 0.00,
  `presentation_marks` decimal(4,2) DEFAULT 0.00,
  `clarity_marks` decimal(4,2) DEFAULT 0.00,
  `lifelong_learning_marks` decimal(4,2) DEFAULT 0.00,
  `project_management_marks` decimal(4,2) DEFAULT 0.00,
  `time_management_marks` decimal(4,2) DEFAULT 0.00,
  `total_score` decimal(5,2) DEFAULT 0.00,
  `comments` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assessments`
--

INSERT INTO `assessments` (`assessment_id`, `student_id`, `tasks_marks`, `health_safety_marks`, `knowledge_marks`, `presentation_marks`, `clarity_marks`, `lifelong_learning_marks`, `project_management_marks`, `time_management_marks`, `total_score`, `comments`) VALUES
(1, '20810528', 80.00, 90.00, 75.00, 92.00, 81.00, 95.00, 60.00, 72.00, 80.45, 'Wasi demonstrated an outstanding commitment to lifelong learning and produced an exceptionally well-written, professional report. His adherence to health and safety protocols was also highly commendable. However, his project and time management skills require further development, as he experienced some difficulty in organizing his workflow and meeting milestones efficiently. Focusing on structured task execution will greatly enhance his future performance'),
(2, '20811111', 65.00, 50.00, 60.00, 70.00, 65.00, 55.00, 76.00, 68.00, 64.35, 'Jane demonstrated solid project management skills and delivered a good written report. However, to improve her overall performance, she must strictly adhere to workplace health and safety protocols and show more initiative in lifelong learning activities'),
(3, '20801771', 80.00, 80.00, 60.00, 90.00, 70.00, 67.00, 97.00, 50.00, 74.60, 'Huda delivered a rockstar performance in project management and produced an exceptionally strong written report. While she handles daily tasks and safety requirements efficiently, there is a significant need to improve time management and better integrate theoretical knowledge into her practical workflow'),
(4, '20822222', 45.00, 40.00, 60.00, 90.00, 30.00, 42.00, 38.00, 78.00, 54.70, 'Ali produced a highly detailed written report and maintained reasonable time management. However, his practical execution was severely lacking. He struggled significantly with project management, daily tasks, and health and safety adherence, and must drastically improve his practical application and communication clarity moving forward.\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` varchar(20) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `programme` varchar(100) NOT NULL,
  `company_name` varchar(150) DEFAULT NULL,
  `assessor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `full_name`, `programme`, `company_name`, `assessor_id`) VALUES
('20801771', 'Huda Amin', 'Mechanical Engineering', 'Rockstar', 4),
('20810528', 'Wasi ur Rehman', 'Electrical Engineering', 'Tesla', 3),
('20811111', 'Jane Doe', 'Computer Science with Artificial Intelligence', 'Tech Solutions Sdn Bhd', 3),
('20822222', 'Ali bin Kamal', 'Software Engineering', 'DataCorp Malaysia', 4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('Admin','Assessor') NOT NULL,
  `full_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password_hash`, `role`, `full_name`) VALUES
(1, 'admin1', 'hashed_password_here', 'Admin', 'System Administrator'),
(2, 'admin', '$2y$10$ilwTJJ02xZoEDsBH8DNeA.2A2NpSkSkScLdlCUrBjpi7p7FtCFxNy', 'Admin', 'System Administrator'),
(3, 'ahmad_f', '$2y$10$TWTaWaBI.cPyw/3MmwLxweloeJqsYPaag5GT1yQ.oSSWVzNEC7F4y', 'Assessor', 'Dr. Ahmad Faris'),
(4, 'sarah_j', '$2y$10$/6jvGqC/ZYCr4yAjLZipx.dCikRyjCmiWGMY7lqnS/.y8LgQriC.q', 'Assessor', 'Dr. Sarah Jenkins');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assessments`
--
ALTER TABLE `assessments`
  ADD PRIMARY KEY (`assessment_id`),
  ADD UNIQUE KEY `student_id` (`student_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `assessor_id` (`assessor_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assessments`
--
ALTER TABLE `assessments`
  MODIFY `assessment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assessments`
--
ALTER TABLE `assessments`
  ADD CONSTRAINT `assessments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`assessor_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
