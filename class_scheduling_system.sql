-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2019 at 05:35 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `class_scheduling_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `course_id` int(10) UNSIGNED NOT NULL,
  `class_date` date NOT NULL,
  `class_time` time NOT NULL,
  `instructor_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `class_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`course_id`, `class_date`, `class_time`, `instructor_id`, `class_id`) VALUES
(1, '2019-04-08', '16:30:00', 1, 1),
(3, '2019-04-09', '18:00:00', 5, 2),
(3, '2019-04-11', '18:00:00', 5, 3),
(4, '2019-04-08', '10:30:00', 2, 4),
(4, '2019-04-10', '14:30:00', 2, 5),
(4, '2019-04-12', '10:30:00', 2, 6),
(5, '2019-04-10', '09:00:00', 4, 7),
(5, '2019-04-10', '19:30:00', 3, 8),
(1, '2019-04-10', '18:00:00', 5, 9),
(2, '2019-04-08', '19:30:00', 6, 10),
(2, '2019-04-12', '19:30:00', 6, 11);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_name` varchar(30) NOT NULL,
  `course_length` varchar(30) DEFAULT NULL,
  `course_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_name`, `course_length`, `course_id`) VALUES
('Rocket Science', '45 min', 1),
('Quidditch', 'pop', 2),
('Ghost Hunting', '120 min', 3),
('Jazz 101', '45 min', 4),
('Fly Fishing', '30 min', 5);

-- --------------------------------------------------------

--
-- Table structure for table `instructors`
--

CREATE TABLE `instructors` (
  `name` varchar(60) NOT NULL,
  `instructor_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `instructors`
--

INSERT INTO `instructors` (`name`, `instructor_id`) VALUES
('TBD', 1),
('Peter P', 2),
('Tony S', 3),
('Clark K', 4),
('Steve R', 5),
('Bruce W', 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`class_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `instructors`
--
ALTER TABLE `instructors`
  ADD PRIMARY KEY (`instructor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `class_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `instructors`
--
ALTER TABLE `instructors`
  MODIFY `instructor_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
