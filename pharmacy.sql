-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 02, 2024 at 06:07 PM
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
-- Database: `pharmacy`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_token`
--

CREATE TABLE `auth_token` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `selector` varchar(50) NOT NULL,
  `code_hash` varchar(255) NOT NULL,
  `expiry` datetime NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `auth_token`
--
DELIMITER $$
CREATE TRIGGER `auth_token_created` BEFORE INSERT ON `auth_token` FOR EACH ROW BEGIN
	SET NEW.created=NOW();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `auth_token_modified` BEFORE UPDATE ON `auth_token` FOR EACH ROW BEGIN
	SET NEW.modified=NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_support`
--

CREATE TABLE `customer_support` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `inquiry` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `modified` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_support`
--

INSERT INTO `customer_support` (`id`, `user_id`, `inquiry`, `title`, `created`, `modified`) VALUES
(11, 7, 'test', 'test', '2023-11-30 14:52:03', '2023-11-30 14:52:03'),
(12, 7, '', '', '2023-12-01 18:08:11', '2023-12-01 18:08:11');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `id` int(10) NOT NULL,
  `order_id` int(10) NOT NULL,
  `location` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `modified` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`id`, `order_id`, `location`, `created`, `modified`) VALUES
(1, 42, 'Kuala Lumpur.', '2023-12-06 19:33:27', '2023-12-06 19:34:20'),
(2, 42, 'Tanjung Malim, Perak.', '2023-12-06 19:34:11', '2023-12-06 19:34:11');

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` float NOT NULL COMMENT 'In RM',
  `unit` varchar(25) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `modified` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`id`, `name`, `price`, `unit`, `created`, `modified`) VALUES
(1, 'Paracetamol 500mg', 1.2, 'Packet', '2023-09-12 05:01:39', '2023-10-31 02:37:59'),
(2, 'Cetirizine 10mg', 5, 'Packet', '2023-09-12 05:36:49', '2023-10-31 02:37:52'),
(11, 'Loratadine 10mg', 3, 'Packet', '2023-10-31 03:17:02', '2023-10-31 03:17:02');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `customer_support_id` int(10) NOT NULL,
  `message` text NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `modified` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `user_id`, `customer_support_id`, `message`, `created`, `modified`) VALUES
(5, 7, 11, 'test', '2023-11-30 14:52:03', '2023-11-30 14:52:03'),
(6, 7, 11, 'test sahaja', '2023-11-30 15:43:56', '2023-11-30 15:43:56'),
(7, 7, 11, 'lagi message untuk kamu ya?', '2023-11-30 15:44:15', '2023-11-30 15:44:15'),
(8, 1, 11, 'test sahaja', '2023-11-30 15:51:27', '2023-11-30 15:51:27'),
(9, 7, 12, '', '2023-12-01 18:08:11', '2023-12-01 18:08:11');

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `id` int(10) NOT NULL,
  `medicine_id` int(10) NOT NULL,
  `quantity` tinyint(2) NOT NULL,
  `payment_total` float NOT NULL,
  `payment_status` tinyint(4) NOT NULL COMMENT 'Pending=0, Success=1, Waiting=2, Failed=3',
  `delivered` tinyint(1) NOT NULL COMMENT 'No=0, Yes=1',
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `modified` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy`
--

CREATE TABLE `pharmacy` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `modified` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pharmacy`
--

INSERT INTO `pharmacy` (`id`, `name`, `location`, `created`, `modified`) VALUES
(1, 'Klinik Lim', 'Kuala Lumpur', '2023-12-07 18:50:42', '2023-12-07 18:50:42');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `matric_number` varchar(20) NOT NULL,
  `picture` varchar(255) NOT NULL COMMENT 'Path=/assets/pictures/',
  `password` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `verified` tinyint(1) NOT NULL COMMENT 'No=0, Yes=1',
  `role` tinyint(1) NOT NULL COMMENT 'User=0, Admin=1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `fullname`, `phone`, `address`, `matric_number`, `picture`, `password`, `code`, `verified`, `role`, `created`, `modified`) VALUES
(1, 'admin', 'admin@gmail.com', 'Admin', '0123456789', 'Selangor', '1234', '', '$2y$10$0x0d0p/FnpuPIa7vuVc92OxCW4.y6e1/PkNcyOKGDnbRz5nvvb9gm', NULL, 1, 1, '2023-09-09 16:38:26', '2024-01-01 06:10:38'),
(7, 'user', 'user@gmail.com', '', '0123456789', 'Kedah', '', '', '$2y$10$EW5NLusgCRtfUJhzzf5diebtQXxH9dFPoEeH3kzDd7YXXnnNAag.O', NULL, 1, 0, '2023-10-31 01:51:06', '2024-01-01 06:10:34'),
(8, 'test', 'test@gmail.com', '', '0123456789', 'Kuala Lumpur', '1234', '', '$2y$10$q/UA9AHrzcug9IzDiH44FutLuZ5RbI6OfePwyclW4lW/9./iRZJJm', 'de4de1e190518b2f04ccfe8b455b268bdf8383b5c48ec1f54371d3d048e9972d', 1, 0, '2024-01-01 04:28:37', '2024-01-01 06:07:09');

--
-- Triggers `user`
--
DELIMITER $$
CREATE TRIGGER `user_created` BEFORE INSERT ON `user` FOR EACH ROW BEGIN
	SET NEW.created=NOW();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `user_modified` BEFORE UPDATE ON `user` FOR EACH ROW BEGIN
	SET NEW.modified=NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `_order`
--

CREATE TABLE `_order` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `medicine_id` int(10) NOT NULL,
  `quantity` int(4) NOT NULL,
  `payment_total` float NOT NULL,
  `bill_code` varchar(10) DEFAULT NULL,
  `payment_status` tinyint(1) DEFAULT 0 COMMENT 'Success=1, Failed=3',
  `delivered` tinyint(1) DEFAULT 0 COMMENT 'Pending=0, In-Progress=1, Completed=2',
  `review` text NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `modified` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `_order`
--

INSERT INTO `_order` (`id`, `user_id`, `medicine_id`, `quantity`, `payment_total`, `bill_code`, `payment_status`, `delivered`, `review`, `created`, `modified`) VALUES
(42, 7, 1, 20, 24, 'j9yjn3i6', 1, 0, 'test sahaja guys', '2023-11-30 18:43:31', '2023-12-06 19:10:17'),
(43, 7, 1, 1, 1.2, 'n1s44rkc', 1, 0, 'ok lar ni', '2023-11-30 18:55:25', '2023-12-06 18:40:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_token`
--
ALTER TABLE `auth_token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `customer_support`
--
ALTER TABLE `customer_support`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `customer_support_id` (`customer_support_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meal_id` (`medicine_id`);

--
-- Indexes for table `pharmacy`
--
ALTER TABLE `pharmacy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_order`
--
ALTER TABLE `_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medicine_id` (`medicine_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_token`
--
ALTER TABLE `auth_token`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_support`
--
ALTER TABLE `customer_support`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pharmacy`
--
ALTER TABLE `pharmacy`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `_order`
--
ALTER TABLE `_order`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_token`
--
ALTER TABLE `auth_token`
  ADD CONSTRAINT `auth_token_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `customer_support`
--
ALTER TABLE `customer_support`
  ADD CONSTRAINT `customer_support_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `_order` (`id`);

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`customer_support_id`) REFERENCES `customer_support` (`id`);

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`id`);

--
-- Constraints for table `_order`
--
ALTER TABLE `_order`
  ADD CONSTRAINT `_order_ibfk_1` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`id`),
  ADD CONSTRAINT `_order_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
