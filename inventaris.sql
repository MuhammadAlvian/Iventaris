-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2023 at 12:46 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventaris`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `idbarang` int(11) NOT NULL,
  `merek_id` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `nama_barang` varchar(128) NOT NULL,
  `keterangan` varchar(256) NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`idbarang`, `merek_id`, `kategori_id`, `nama_barang`, `keterangan`, `stok`) VALUES
(5, 8, 4, 'Monitor', 'Lama', 7);

-- --------------------------------------------------------

--
-- Table structure for table `barang_keluar`
--

CREATE TABLE `barang_keluar` (
  `idbarang_keluar` int(11) NOT NULL,
  `barang_id` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `keterangan` varchar(256) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang_keluar`
--

INSERT INTO `barang_keluar` (`idbarang_keluar`, `barang_id`, `jumlah`, `keterangan`, `tanggal`) VALUES
(1, 1, 1, 'Rusak', '2020-11-26'),
(2, 5, 2, 'Wahyu', '2023-05-22'),
(3, 5, 1, 'Pinjam 1 Lagi', '2023-05-22');

--
-- Triggers `barang_keluar`
--
DELIMITER $$
CREATE TRIGGER `kurang_stok` AFTER INSERT ON `barang_keluar` FOR EACH ROW BEGIN
	UPDATE barang SET stok = stok - new.jumlah WHERE idbarang = new.barang_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `idbarang_masuk` int(11) NOT NULL,
  `barang_id` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `keterangan` varchar(256) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang_masuk`
--

INSERT INTO `barang_masuk` (`idbarang_masuk`, `barang_id`, `jumlah`, `keterangan`, `tanggal`) VALUES
(1, 4, 10, 'Beli Baru', '2020-11-24'),
(2, 1, 3, 'Beli baru', '2020-11-23'),
(3, 3, 2, 'Beli baru', '2020-11-24'),
(4, 2, 32, 'asfasfas', '2023-05-22'),
(5, 5, 10, 'Lama', '2023-05-22');

--
-- Triggers `barang_masuk`
--
DELIMITER $$
CREATE TRIGGER `tambah_stok` AFTER INSERT ON `barang_masuk` FOR EACH ROW BEGIN
	UPDATE barang SET stok = stok + new.jumlah WHERE idbarang = new.barang_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `idkategori` int(11) NOT NULL,
  `nama_kategori` varchar(128) NOT NULL,
  `keterangan` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`idkategori`, `nama_kategori`, `keterangan`) VALUES
(4, 'Elektronik', 'Baru');

-- --------------------------------------------------------

--
-- Table structure for table `merek`
--

CREATE TABLE `merek` (
  `idmerek` int(11) NOT NULL,
  `nama_merek` varchar(128) NOT NULL,
  `keterangan` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `merek`
--

INSERT INTO `merek` (`idmerek`, `nama_merek`, `keterangan`) VALUES
(8, 'ACER', 'Baru');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_users` int(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` enum('admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_users`, `nama`, `no_hp`, `username`, `password`, `level`) VALUES
(3, 'Administrator', '082248577297', 'admin', '$2y$10$E33mbIeZc665JZiGOIwCMunuLcI.YnlIzMvGoqgPWflEykvFGFTAK', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`idbarang`);

--
-- Indexes for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD PRIMARY KEY (`idbarang_keluar`);

--
-- Indexes for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`idbarang_masuk`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`idkategori`);

--
-- Indexes for table `merek`
--
ALTER TABLE `merek`
  ADD PRIMARY KEY (`idmerek`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_users`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `idbarang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  MODIFY `idbarang_keluar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  MODIFY `idbarang_masuk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `idkategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `merek`
--
ALTER TABLE `merek`
  MODIFY `idmerek` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_users` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
