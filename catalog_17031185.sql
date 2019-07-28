-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2019 at 08:09 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `catalog_17031185`
--

-- --------------------------------------------------------

--
-- Table structure for table `company_info`
--

CREATE TABLE `company_info` (
  `Comp_Name` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Street` varchar(50) NOT NULL,
  `Phone_No` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_info`
--

INSERT INTO `company_info` (`Comp_Name`, `City`, `Street`, `Phone_No`) VALUES
('iampk', 'Kathmandu', 'Putalisadak', '+977-9818901234');

-- --------------------------------------------------------

--
-- Table structure for table `company_service`
--

CREATE TABLE `company_service` (
  `Service_ID` varchar(20) NOT NULL,
  `Service_Name` varchar(50) NOT NULL,
  `Service_Desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company_service`
--

INSERT INTO `company_service` (`Service_ID`, `Service_Name`, `Service_Desc`) VALUES
('ser_1', 'Artificial Intelligence', 'In Nepal, India and USA iampk offers Artificial Intelligence service. Using Natural Language Processing (NLP), Speech Recognition and Machine Learning feature, we develop a range of Artificial Intelligence solutions that learn and think like humans. By minimizing your labor and infrastructure cost, our Artificial Intelligence solutions helps you to accelerate your business.'),
('ser_2', 'Blockchain Technology', 'We reached the best position by serving and presenting our abilities for our clients. Till the growth of our clients we always support and maintain long relationship with them. For the development of your business we hire Blockchain developers to build strong and secure Blockchain development.'),
('ser_3', 'Internet of Things', 'To automate electrical appliances/security devices or gadgets that are found in home, office, and other commercial settings, our IoT developers are there for you. The devices will take care of everything once you have the apps in place.');

-- --------------------------------------------------------

--
-- Table structure for table `emp_contact`
--

CREATE TABLE `emp_contact` (
  `Phone_No` varchar(20) NOT NULL,
  `Country` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Street` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_contact`
--

INSERT INTO `emp_contact` (`Phone_No`, `Country`, `City`, `Street`) VALUES
('+91-8693827649', 'India', 'Banglore', 'Brigade Road'),
('+977-9861208734', 'Nepal', 'Kathmandu', 'Putalisadak'),
('1-888-452-1505', 'USA', 'New York', 'Jones Street');

-- --------------------------------------------------------

--
-- Table structure for table `emp_info`
--

CREATE TABLE `emp_info` (
  `Emp_Info_Id` varchar(20) NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Middle_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_info`
--

INSERT INTO `emp_info` (`Emp_Info_Id`, `First_Name`, `Middle_Name`, `Last_Name`) VALUES
('emp_1', 'Hari', 'Om', 'Bhatia'),
('emp_2', 'Pujan', NULL, 'Shrestha'),
('emp_3', 'Robert', 'Downey', 'Evans');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company_service`
--
ALTER TABLE `company_service`
  ADD PRIMARY KEY (`Service_Name`);

--
-- Indexes for table `emp_contact`
--
ALTER TABLE `emp_contact`
  ADD PRIMARY KEY (`Phone_No`);

--
-- Indexes for table `emp_info`
--
ALTER TABLE `emp_info`
  ADD PRIMARY KEY (`Emp_Info_Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
