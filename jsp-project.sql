-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 09, 2022 at 05:09 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jsp-project`
--

-- --------------------------------------------------------

--
-- Table structure for table `available_course`
--

CREATE TABLE `available_course` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `course_duaration` varchar(100) DEFAULT NULL,
  `course_price` int(11) DEFAULT NULL,
  `course_discription` varchar(1000) NOT NULL,
  `offered_by` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `available_course`
--

INSERT INTO `available_course` (`course_id`, `course_name`, `course_duaration`, `course_price`, `course_discription`, `offered_by`) VALUES
(1, 'Artificial Intelligence ', '5 Month', 5000, 'In this course you will learn what Artificial Intelligence (AI) is, explore use cases and applications of AI, understand AI concepts and terms like machine learniDeepLearning.AIs expert-led educational experiences provide AI practitioners and non-technical professionals wit', 'Google'),
(2, 'Data Science', '11 month', 5000, 'Launch your career in data science. Gain foundational data science skills to prepare for a career or further advanced learning in data science.', 'Google'),
(3, 'Python', '2 Month', 4412, 'Master Python by building 100 projects in 100 days. Learn to build websites, games, apps, plus scraping and data science', 'Harvard university'),
(4, 'Ethical Hacking', '4 Month', 5777, 'Get started from scratch and become job ready penetration Tester. Be an Ethical Hacker and Hunt as a Bug Bounty Hunters', 'Cisco'),
(5, 'Networking', '1 month', 500, 'adawdadwd', ''),
(6, 'Cloud Computing', '5 month', 1333, 'bla blaa', ''),
(7, 'Helllo', 'awdawdawd', 1213, 'waadwad', 'awdawd'),
(8, 'Helllo122', 'awdawdawd', 1213, 'waadwad', 'awdawd');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `cid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `enrolled_course`
--

CREATE TABLE `enrolled_course` (
  `id` int(20) NOT NULL,
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `enrolled_date` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `enrolled_course`
--

INSERT INTO `enrolled_course` (`id`, `student_id`, `course_id`, `enrolled_date`) VALUES
(6, 2, 4, '2022-01-06'),
(7, 2, 1, '2022-01-06'),
(8, 2, 1, '2022-01-09'),
(9, 2, 1, '2022-01-09'),
(26, 2, 2, '2022-01-25');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `card_holder_name` varchar(100) NOT NULL,
  `card_no` int(100) NOT NULL,
  `card_edate` varchar(100) NOT NULL,
  `card_cvv` int(11) NOT NULL,
  `course_price` int(11) NOT NULL,
  `transaction_fee` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `student_id`, `card_holder_name`, `card_no`, `card_edate`, `card_cvv`, `course_price`, `transaction_fee`, `total`) VALUES
(1, 1, 'Dikshant Naik', 1213123, '', 313, 122, 2, 124),
(2, 2, 'John ', 13242323, '', 645, 500, 10, 510),
(3, 3, 'Elon Musk', 1321313, '', 485, 100, 2, 102),
(4, 2, 'awdawd', 123, 'awdwad', 213, 23123, 243123, 1231);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `studentid` int(11) DEFAULT NULL,
  `rating` float DEFAULT 0 CHECK (`rating` >= 0 and `rating` <= 10),
  `students_revive` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`id`, `course_id`, `studentid`, `rating`, `students_revive`) VALUES
(6, 5, NULL, NULL, 'awdwawdawdwa'),
(12, 1, 16, 0, 'Nice Course..'),
(13, 1, 16, 0, 'Informative Course..'),
(14, 1, 17, 0, 'I love it ..');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `studentid` int(50) NOT NULL,
  `username` varchar(100) NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `college_course` varchar(100) NOT NULL,
  `password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`studentid`, `username`, `student_name`, `college_course`, `password`) VALUES
(1, 'admin', 'admin', 'Computer Science', '922AE20FFC6C9D58B88EEAA2E34D1B0E2BBAF9F9E8EB34ACC899C2E01600FC90'),
(2, 'dik', 'Dikshant', 'Computer Science', 'D74FF0EE8DA3B9806B18C877DBF29BBDE50B5BD8E4DAD7A3A725000FEB82E8F1'),
(3, 'dikshant', 'Dikshant Naik', 'Mecanical', 'D74FF0EE8DA3B9806B18C877DBF29BBDE50B5BD8E4DAD7A3A725000FEB82E8F1'),
(14, 'dikshant2', 'Dikshant Naik', 'Computer Science', 'D74FF0EE8DA3B9806B18C877DBF29BBDE50B5BD8E4DAD7A3A725000FEB82E8F1'),
(16, 'dikshant23', 'Dikshant Naik', '1', 'D74FF0EE8DA3B9806B18C877DBF29BBDE50B5BD8E4DAD7A3A725000FEB82E8F1'),
(17, 'elon', 'Elon Musk', 'smhh', 'D74FF0EE8DA3B9806B18C877DBF29BBDE50B5BD8E4DAD7A3A725000FEB82E8F1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `available_course`
--
ALTER TABLE `available_course`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `sid` (`sid`);

--
-- Indexes for table `enrolled_course`
--
ALTER TABLE `enrolled_course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `studentid` (`studentid`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`studentid`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `available_course`
--
ALTER TABLE `available_course`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `enrolled_course`
--
ALTER TABLE `enrolled_course`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `studentid` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `available_course` (`course_id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `students` (`studentid`);

--
-- Constraints for table `enrolled_course`
--
ALTER TABLE `enrolled_course`
  ADD CONSTRAINT `enrolled_course_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`studentid`),
  ADD CONSTRAINT `enrolled_course_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `available_course` (`course_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`studentid`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`studentid`) REFERENCES `students` (`studentid`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `available_course` (`course_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
