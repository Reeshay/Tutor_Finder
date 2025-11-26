-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 07, 2023 at 12:49 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `main_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `fullname` varchar(250) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `applied_post`
--

CREATE TABLE `applied_post` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `post_by` int(11) NOT NULL,
  `applied_by` int(11) NOT NULL,
  `applied_to` int(11) NOT NULL,
  `applied_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `student_ck` varchar(3) NOT NULL DEFAULT 'no',
  `tutor_ck` varchar(3) NOT NULL DEFAULT 'no',
  `tutor_cf` tinyint(4) NOT NULL DEFAULT 0,
  `tution_cf` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `postby_id` int(11) NOT NULL,
  `subject` text NOT NULL,
  `class` text NOT NULL,
  `medium` varchar(20) NOT NULL,
  `salary` varchar(50) NOT NULL,
  `location` text NOT NULL,
  `p_university` text NOT NULL,
  `post_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deadline` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `postby_id`, `subject`, `class`, `medium`, `salary`, `location`, `p_university`, `post_time`, `deadline`) VALUES
(12, 15, 'Programming Fundamental', 'University Level', 'English', '10000-15000', 'Gulshan-e-Iqbal, Karachi', 'UIT University', '2023-08-01 09:46:41', '2027-01-09'),
(13, 15, 'English, Computer Science', 'Four-Five', 'English', '2000-5000', 'Nazimabad, Karachi', 'NED University', '2023-08-01 09:49:22', '2027-06-08'),
(14, 11, 'Computer Science, Physics', 'Eight', 'Urdu', '5000-10000', 'Federal B Area, Karachi', 'FAST University', '2023-08-01 09:53:56', '2027-09-05'),
(15, 15, 'Chemistry, Biology', 'One-Three', 'English', '10000-15000', 'Malir, Karachi', 'Bahria University', '2023-08-02 16:07:41', '2027-08-14'),
(16, 17, 'Physics, Chemistry', 'Four-Five', 'Urdu', '5000-10000', 'Liaquatabad, Karachi', 'Iqra University', '2023-08-02 16:11:32', '2027-09-09');

-- --------------------------------------------------------

--
-- Table structure for table `tutor`
--

CREATE TABLE `tutor` (
  `id` int(11) NOT NULL,
  `t_id` int(11) NOT NULL,
  `inst_name` varchar(150) NOT NULL,
  `prefer_sub` text NOT NULL,
  `class` text NOT NULL,
  `medium` text NOT NULL,
  `prefer_location` text NOT NULL,
  `salary` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `fullname` varchar(150) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `email` varchar(40) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(200) NOT NULL DEFAULT '',
  `pass` varchar(50) NOT NULL,
  `confirmcode` varchar(7) NOT NULL,
  `activation` varchar(3) NOT NULL DEFAULT '',
  `type` varchar(10) NOT NULL,
  `user_pic` text DEFAULT NULL,
  `last_logout` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `online` varchar(5) NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `fullname`, `gender`, `email`, `phone`, `address`, `pass`, `confirmcode`, `activation`, `type`, `user_pic`, `last_logout`, `online`) VALUES
(11, 'Student 1', 'male', 'student1@gmail.com', '12345678', 'Karachi', 'cd73502828457d15655bbd7a63fb0bc8', '991941', '', 'student', NULL, '2023-08-01 09:54:15', 'no'),
(12, 'Student 2', 'male', 'student2@gmail.com', '123456789', 'Karachi', 'cd73502828457d15655bbd7a63fb0bc8', '468709', '', 'teacher', NULL, '2023-08-01 09:07:05', 'no'),
(13, 'Student 3', 'female', 'student3@gmail.com', '123456789', 'Nazimabad, Karachi', 'cd73502828457d15655bbd7a63fb0bc8', '394719', '', 'teacher', NULL, '2023-08-06 22:40:53', 'no'),
(14, 'Student 4', 'male', 'student4@gmail.com', '12345678', 'Karachi', 'cd73502828457d15655bbd7a63fb0bc8', '882094', '', 'teacher', NULL, '2023-08-06 22:15:58', 'yes'),
(15, 'Student 5', 'male', 'student5@gmail.com', '123456789', 'Karachi', 'cd73502828457d15655bbd7a63fb0bc8', '193371', '', 'student', NULL, '2023-08-02 16:08:14', 'no'),
(17, 'Student Female', 'female', 'studentfemale@gmail.com', '1234567890', 'Karachi', 'cd73502828457d15655bbd7a63fb0bc8', '429335', '', 'student', NULL, '2023-08-02 16:12:22', 'no');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `applied_post`
--
ALTER TABLE `applied_post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tutor`
--
ALTER TABLE `tutor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `applied_post`
--
ALTER TABLE `applied_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tutor`
--
ALTER TABLE `tutor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;