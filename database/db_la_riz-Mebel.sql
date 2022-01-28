-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 16, 2022 at 08:31 PM
-- Server version: 8.0.26-0ubuntu0.20.04.2
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mebel`
--

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(200) NOT NULL,
  `description` varchar(500) NOT NULL,
  `stock` int NOT NULL,
  `image` varchar(255) NOT NULL,
  `type` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `description`, `stock`, `image`, `type`) VALUES
(5, 'Wing Chair Zebra', '2300000', 'Wingchair dengan bahan suede bermotif zebra menambah kesan unik', 10, 'e08cf76f6867b176438ae0bbbc32bfd2.jpeg', 1),
(6, 'Arm Chair', '2100000', 'arm chair dengan variasi kancing dibagian sandaran menambah kesan klasik. dengan bahan fabric cream', 10, '2753b9dc272d496c4dbf7133f4f7148c.jpeg', 1),
(7, 'Sofa Minimalis Stirre', '5400000', 'sofa stirre dengan variasi garis jajar genjang dibagian sandaran yang menambah kesan elegan. dengan bahan Suede dark grey', 10, 'cacafd8ee5b8bb353c3dbb20a1bbb4c9.jpeg', 3),
(8, 'Puff Slide', '750000', 'puff dengan variasi garis jajar genjang dibagian dudukan menambah kesan klasik serta fungsi penyimpanan dibagian dalam dengan bahan fabric dark grey', 10, '56a9f0e5867028579374eb2b7fbe1980.jpeg', 2),
(9, 'Dining Chair', '1700000', 'dining chair dengan variasi kancing dibagian sandaran menambah kesan elegan. dengan bahan fabric light grey', 10, '72a750fd772274029024cb9f6392984f.jpeg', 1),
(10, 'Sofa Minimalis L', '8000000', 'sofa dengan pemanis bantalan dibagian sandaran menambah kesan aestethic. dengan bahan fabric cream', 10, 'f25fa5527cb603a342fe1b40067cb20f.jpeg', 3),
(11, 'Arm Chair and Puff', '2800000', 'arm chair dengan variasi bantalan dibagian sandaran dan dudukan menambah kesan artistik. dengan bahan fabric light brown', 10, '1e8bc810131f951a5458e722c677154a.jpeg', 1),
(12, 'Arm Chair Queen', '2650000', 'arm chair dengan bentuk curve yang unik serta bantalan dibagian sandaran menambah kesan elegan. dengan bahan Suede navy blue', 10, '094efa3e82f7129e8dd60dafd8f7624b.jpeg', 1),
(13, 'Sofa Minimalis King', '5500000', 'sofa dengan tampilan dudukan yang bisa dilepas serta sandaran berbentuk square dengan kancing disetiap titik temunya menambah kesan klasik menggunakan fabric dark grey', 10, 'a414bfe65da00e7642a9ac7aa9fde8b0.jpeg', 3),
(14, 'Puff square', '500000', 'puff dengan bentuk kotak yang membawa kesan simple namun tetap elegan. dengan bahan fabric cream', 10, 'a6c8b9e52dad2e11a060ad74d1b6b285.jpeg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_type`
--

CREATE TABLE `product_type` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product_type`
--

INSERT INTO `product_type` (`id`, `name`) VALUES
(1, 'Chair'),
(2, 'Puff'),
(3, 'Sofa');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `qty` int NOT NULL,
  `date` date NOT NULL,
  `customer` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `product_id`, `qty`, `date`, `customer`) VALUES
(1, 10, 5, '2022-01-15', 'Budi'),
(2, 11, 3, '2022-01-13', 'Andi'),
(3, 5, 100, '2022-01-14', 'Hehe'),
(5, 11, 89, '2022-01-15', 'SIapa hayoo');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `product_type`
--
ALTER TABLE `product_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product_type`
--
ALTER TABLE `product_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`type`) REFERENCES `product_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
