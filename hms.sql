-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2021 at 11:52 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hms`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `did` int(11) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Doctorname` varchar(50) NOT NULL,
  `Dept` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`did`, `Email`, `Doctorname`, `Dept`) VALUES
(1, 'jenish@gmail.com', 'Jenish', 'Cardiologists'),
(2, 'darshan@gmail.com', 'Darshan', 'Dermatologists'),
(3, 'dhirendra@gmail.com', 'Dhirendra', 'Anesthesiologists'),
(4, 'bhagwan@gmail', 'Bhagwan', 'Endocrinologists'),
(5, 'biniv@gmail.com', 'Biniv', 'Opthalmologists');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `pid` int(11) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Gender` varchar(50) NOT NULL,
  `Slot` varchar(50) NOT NULL,
  `Disease` varchar(50) NOT NULL,
  `Time` time NOT NULL,
  `Date` date NOT NULL,
  `Dept` varchar(50) NOT NULL,
  `Number` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`pid`, `email`, `name`, `gender`, `slot`, `disease`, `time`, `date`, `dept`, `number`) VALUES
(2, 'Krish@gmail.com', 'Krish Thapa', 'Male1', 'evening1', 'cold1', '21:20:00', '2020-02-02', 'Opthalmologists', '9874561110'),
(5, 'Hari@gmail.com', 'Hari Rai', 'Male', 'morning', 'fevr', '18:06:00', '2020-11-18', 'Cardiologists', '9874563210'),
(7, 'Maila@gmail.com', 'Maila Kami', 'Male', 'evening', 'cold', '22:18:00', '2020-11-05', 'Dermatologists', '9874563210'),
(8, 'Sadisha@gmail.com', 'Sadisha Bhandari', 'Female', 'evening', 'cold', '22:18:00', '2020-11-05', 'Dermatologists', '9874563210'),
(9, 'Thuley@gmail.com', 'Thuley Pokhrel', 'Male', 'morning', 'cold', '17:27:00', '2020-11-26', 'Anesthesiologists', '9874563210'),
(10, 'Asal@gmail.com', 'Asal Jadiya', 'Male', 'evening', 'fever', '16:25:00', '2020-12-09', 'Cardiologists', '9874589654'),
(15, 'Isha@gmail.com', 'Isha Karna', 'Female', 'morning', 'corona', '20:42:00', '2021-01-23', 'Anesthesiologists', '9874563210'),
(16, 'Kanxi@gmail.com', 'Kaxi Tamang', 'Female', 'evening', 'fever', '15:46:00', '2021-01-31', 'Endocrinologists', '9874587496'),
(17, 'Priya@gmail.com', 'Priya Dahal', 'Female', 'evening', 'fever', '15:48:00', '2021-01-23', 'Endocrinologists', '9874563210');

--
-- Triggers `patients`
--
DELIMITER $$
CREATE TRIGGER `PatientDelete` BEFORE DELETE ON `patients` FOR EACH ROW INSERT INTO trigr VALUES(null,OLD.pid,OLD.email,OLD.name,'PATIENT DELETED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `PatientUpdate` AFTER UPDATE ON `patients` FOR EACH ROW INSERT INTO trigr VALUES(null,NEW.pid,NEW.email,NEW.name,'PATIENT UPDATED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `patientinsertion` AFTER INSERT ON `patients` FOR EACH ROW INSERT INTO trigr VALUES(null,NEW.pid,NEW.email,NEW.name,'PATIENT INSERTED',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `name`, `email`) VALUES
(1, 'NIRAJAN', 'nirajan@gmail.com'),
(2, 'ALIZ', 'aliz@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `trigr`
--

CREATE TABLE `trigr` (
  `tid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Action` varchar(50) NOT NULL,
  `Timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trigr`
--

INSERT INTO `trigr` (`tid`, `pid`, `email`, `name`, `action`, `timestamp`) VALUES
(1, 12, 'hari@gmail.com', 'HARI', 'PATIENT INSERTED', '2020-12-02 16:35:10'),
(2, 11, 'anish@gmail.com', 'ANISH', 'PATIENT INSERTED', '2020-12-02 16:37:34'),
(3, 10, 'ram@gmail.com', 'RSM', 'PATIENT UPDATED', '2020-12-02 16:38:27'),
(4, 11, 'sita@gmail.com', 'SITA', 'PATIENT UPDATED', '2020-12-02 16:38:33'),
(5, 12, 'geeta@gmail.com', 'GEETA', 'PATIENT DELETED', '2020-12-02 16:40:40'),
(6, 11, 'maya@gmail.com', 'MAYA', 'PATIENT DELETED', '2020-12-02 16:41:10'),
(7, 13, 'roshan@gmail.com', 'ROSHAN', 'PATIENT INSERTED', '2020-12-02 16:50:21'),
(8, 13, 'gopal@gmail.com', 'GOPAL', 'PATIENT UPDATED', '2020-12-02 16:50:32'),
(9, 13, 'yojan@gmail.com', 'YOJAN', 'PATIENT DELETED', '2020-12-02 16:50:57'),
(10, 14, 'rabin@gmail.com', 'RABIN', 'PATIENT INSERTED', '2021-01-22 15:18:09'),
(11, 14, 'jenish@gmail.com', 'JENISH', 'PATIENT UPDATED', '2021-01-22 15:18:29'),
(12, 14, 'asal@gmail.com', 'ASAL', 'PATIENT DELETED', '2021-01-22 15:41:48'),
(13, 15, 'aman@gmail.com', 'AMAN', 'PATIENT INSERTED', '2021-01-22 15:43:02'),
(14, 15, 'adarsha@gmail.com', 'ADARSHA', 'PATIENT UPDATED', '2021-01-22 15:43:11');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Usertype` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `usertype`, `email`, `password`) VALUES
(13, 'DHIRENDRA', 'Doctor', 'dhirendra@gmail.com', '12345'),
(14, 'Aman', 'Patient', 'aman@gmail.com', '44444'),
(15, 'Isha', 'Patient', 'isha@gmail.com', '77777');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`did`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trigr`
--
ALTER TABLE `trigr`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `trigr`
--
ALTER TABLE `trigr`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
