-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 05, 2017 at 06:06 AM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `club`
--

DROP TABLE IF EXISTS `club`;
CREATE TABLE IF NOT EXISTS `club` (
  `id` int(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `school_id` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `school_id` (`school_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `club`
--

INSERT INTO `club` (`id`, `name`, `school_id`) VALUES
(1, 'Rubin Soccer', 1),
(2, 'Rubin Baseball', 1),
(3, 'Rubin SoftBall', 1),
(4, 'Rubin Tennis', 1),
(5, 'Chelsey Football', 2),
(6, 'Chelsey Hockey', 2),
(7, 'Berkeley Squash', 3),
(8, 'Berkeley Swimming', 3),
(9, 'Berkeley Polo', 3),
(10, 'Stanford Tennis', 4),
(11, 'Stanford Poker', 4);

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
CREATE TABLE IF NOT EXISTS `history` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `user_id` int(5) NOT NULL,
  `search_type` varchar(50) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `params` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `user_id`, `search_type`, `timestamp`, `params`) VALUES
(5, 1, 'SearchClub', '2017-11-29 17:34:43', '{\"clubName\":\"Rubin Soccer\"}'),
(4, 1, 'SearchStudent', '2017-11-29 17:34:38', '{\"email\": \"jwalter@gmail.com\"}');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`, `id`, `name`) VALUES
('root', 'root', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
CREATE TABLE IF NOT EXISTS `school` (
  `id` int(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `school`
--

INSERT INTO `school` (`id`, `name`) VALUES
(1, 'Rubin Elementary'),
(2, 'Chelsey High'),
(3, 'Berkeley Middle'),
(4, 'Stanford School');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `id` int(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `school_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `name`, `email`, `school_id`) VALUES
(1, 'Joseph Walter', 'jwalter@gmail.com', 1),
(2, 'John Ken', 'jken@gmail.com', 1),
(3, 'Jeevan Bal', 'jbal@gmail.com', 1),
(4, 'Arun Bal', 'abal@gmail.com', 1),
(5, 'Shameer Roy', 'sroy@gmail.com', 1),
(6, 'Chico Johny', 'cjohny@gmail.com', 1),
(7, 'Drew Bart', 'dbart@gmail.com', 1),
(8, 'Ram Rahim', 'rrahim@gmail.com', 2),
(9, 'Joe Shaw', 'jshaw@gmail.com', 2),
(10, 'Vamsee Krishna', 'vkrishna@gmail.com', 2),
(11, 'Cho Wu', 'cwu@gmail.com', 2),
(12, 'Charley Baker', 'cbaker@gmail.com', 3),
(13, 'Vaishnavi', 'vaish@gmail.com', 3),
(14, 'Ram Patel', 'rpatel@gmail.com', 3),
(15, 'Mike Joe', 'mjoe@gmail.com', 3),
(16, 'Kim Jong', 'kjon@gmail.com', 4),
(17, 'Robert Chase', 'rchase@gmail.com', 4);

-- --------------------------------------------------------

--
-- Table structure for table `student_x_club`
--

DROP TABLE IF EXISTS `student_x_club`;
CREATE TABLE IF NOT EXISTS `student_x_club` (
  `id` int(5) NOT NULL,
  `student_id` int(5) NOT NULL,
  `club_id` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `club_id` (`club_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_x_club`
--

INSERT INTO `student_x_club` (`id`, `student_id`, `club_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 1),
(5, 2, 2),
(6, 3, 1),
(7, 4, 1),
(8, 5, 2),
(9, 6, 3),
(10, 6, 4),
(11, 7, 4),
(12, 8, 5),
(13, 9, 5),
(14, 10, 6),
(15, 11, 6),
(16, 12, 7),
(17, 13, 8),
(18, 14, 8),
(19, 15, 9),
(20, 16, 10),
(21, 17, 11);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `age` int(3) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `age`, `location`, `date`) VALUES
(1, 'Abhishek', 'Rattihalli', 'rhabhishek@gmail.com', 27, 'Charlotte', NULL),
(2, 'Abhishek', 'Rattihalli', 'rhabhishek@gmail.com', 27, 'Charlotte', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
