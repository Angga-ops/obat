-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2020 at 05:37 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_obat`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_diagnosa_penyakit`
--

CREATE TABLE `tbl_diagnosa_penyakit` (
  `id_penyakit` int(10) NOT NULL,
  `id_pasien` int(10) DEFAULT NULL,
  `id_dokter` int(10) DEFAULT NULL,
  `nama_penyakit` varchar(30) DEFAULT NULL,
  `jenis_penyakit` varchar(10) DEFAULT NULL,
  `bagian_sakit` varchar(20) DEFAULT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_diagnosa_penyakit`
--

INSERT INTO `tbl_diagnosa_penyakit` (`id_penyakit`, `id_pasien`, `id_dokter`, `nama_penyakit`, `jenis_penyakit`, `bagian_sakit`, `keterangan`) VALUES
(2, 2, 4, 'A', 'B', 'C', 'D');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kredit`
--

CREATE TABLE `tbl_kredit` (
  `id_kredit` int(10) NOT NULL,
  `id_masuk` int(10) NOT NULL,
  `tanggal_bayar` date NOT NULL,
  `total` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_obat_keluar`
--

CREATE TABLE `tbl_obat_keluar` (
  `id_keluar` int(10) NOT NULL,
  `id_stok` int(10) DEFAULT NULL,
  `id_transaksi` int(10) DEFAULT NULL,
  `tanggal_keluar` date DEFAULT NULL,
  `jumlah_keluar` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_obat_keluar`
--

INSERT INTO `tbl_obat_keluar` (`id_keluar`, `id_stok`, `id_transaksi`, `tanggal_keluar`, `jumlah_keluar`) VALUES
(9, 3, 13, '2020-11-03', 4),
(11, 14, 15, '2020-11-08', 12);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_obat_masuk`
--

CREATE TABLE `tbl_obat_masuk` (
  `id_masuk` int(10) NOT NULL,
  `tanggal_masuk` date DEFAULT NULL,
  `nama_obat` varchar(30) DEFAULT NULL,
  `jenis_obat` enum('Bebas','Keras') DEFAULT NULL,
  `bentuk_obat` varchar(10) DEFAULT NULL,
  `harga_beli` int(8) DEFAULT NULL,
  `jumlah_masuk` int(8) DEFAULT NULL,
  `tanggal_exp` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_obat_masuk`
--

INSERT INTO `tbl_obat_masuk` (`id_masuk`, `tanggal_masuk`, `nama_obat`, `jenis_obat`, `bentuk_obat`, `harga_beli`, `jumlah_masuk`, `tanggal_exp`) VALUES
(5, '2020-11-03', 'Xapurrr', 'Bebas', 'Kapsul', 10000, 12, '2021-05-13'),
(7, '2020-11-06', 'Oskadon', 'Bebas', 'Pil', 15000, 30, '2022-11-06'),
(10, '2020-11-08', 'Bodrexcin', 'Bebas', 'Pil', 100000, 100, '2022-11-22');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pasien`
--

CREATE TABLE `tbl_pasien` (
  `id_pasien` int(11) NOT NULL,
  `nama_pasien` varchar(30) DEFAULT NULL,
  `tempat_lahir` varchar(15) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jk_pasien` char(1) DEFAULT NULL,
  `umur_pasien` int(3) DEFAULT NULL,
  `alamat_pasien` text DEFAULT NULL,
  `agama` varchar(10) DEFAULT NULL,
  `tlp_pasien` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pasien`
--

INSERT INTO `tbl_pasien` (`id_pasien`, `nama_pasien`, `tempat_lahir`, `tanggal_lahir`, `jk_pasien`, `umur_pasien`, `alamat_pasien`, `agama`, `tlp_pasien`) VALUES
(2, 'Pasien A', 'Bekasi', '2000-07-02', 'L', 19, 'Telaga Murni', 'Islam', '0812');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pembayaran`
--

CREATE TABLE `tbl_pembayaran` (
  `id_bayar` int(10) NOT NULL,
  `id_transaksi` int(10) DEFAULT NULL,
  `tanggal_bayar` date DEFAULT NULL,
  `total_bayar` int(8) DEFAULT NULL,
  `pasien_bayar` int(8) DEFAULT NULL,
  `kembalian` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_pembayaran`
--

INSERT INTO `tbl_pembayaran` (`id_bayar`, `id_transaksi`, `tanggal_bayar`, `total_bayar`, `pasien_bayar`, `kembalian`) VALUES
(4, 13, '2020-11-04', 12000, 20000, 8000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_resep`
--

CREATE TABLE `tbl_resep` (
  `id_resep` int(10) NOT NULL,
  `id_pasien` int(10) DEFAULT NULL,
  `id_dokter` int(10) DEFAULT NULL,
  `tanggal_resep` date DEFAULT NULL,
  `nama_obat` varchar(30) DEFAULT NULL,
  `jenis_obat` varchar(5) DEFAULT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_resep`
--

INSERT INTO `tbl_resep` (`id_resep`, `id_pasien`, `id_dokter`, `tanggal_resep`, `nama_obat`, `jenis_obat`, `keterangan`) VALUES
(2, 2, 4, '2020-07-20', 'A', 'B', 'C');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stok`
--

CREATE TABLE `tbl_stok` (
  `id_stok` int(10) NOT NULL,
  `id_masuk` int(10) DEFAULT NULL,
  `jumlah_obat` int(8) DEFAULT NULL,
  `harga_jual` int(8) DEFAULT NULL,
  `harga_satuan` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_stok`
--

INSERT INTO `tbl_stok` (`id_stok`, `id_masuk`, `jumlah_obat`, `harga_jual`, `harga_satuan`) VALUES
(3, 5, 6, 2000, 3000),
(14, 10, 88, 50000, 2000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `id_transaksi` int(10) NOT NULL,
  `id_pasien` int(10) DEFAULT NULL,
  `id_resep` int(10) DEFAULT NULL,
  `id_stok` int(10) DEFAULT NULL,
  `tanggal_transaksi` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_transaksi`
--

INSERT INTO `tbl_transaksi` (`id_transaksi`, `id_pasien`, `id_resep`, `id_stok`, `tanggal_transaksi`) VALUES
(13, 2, 2, 3, '2020-11-03'),
(15, 2, 2, 14, '2020-11-08');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` int(10) NOT NULL,
  `nama_lengkap` text DEFAULT NULL,
  `jk` enum('Laki-Laki','Perempuan') DEFAULT NULL,
  `tlp` varchar(16) DEFAULT NULL,
  `username` text DEFAULT NULL,
  `password` text DEFAULT NULL,
  `level` text DEFAULT NULL,
  `tgl_user` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `nama_lengkap`, `jk`, `tlp`, `username`, `password`, `level`, `tgl_user`) VALUES
(1, 'Daniel Septyadi', 'Laki-Laki', '0822123213', 'admin', 'admin', 'admin', '2020-04-20 08:20:00'),
(2, 'Fakhri', 'Laki-Laki', NULL, 'admin1', 'admin1', 'admin', '2020-07-03 23:04:23'),
(4, 'Dokter A', 'Perempuan', '08', '1', '1', 'dokter', '2020-07-03 08:00:00'),
(5, 'Administrasi', 'Perempuan', '081211', '2', '2', 'adm', '2020-07-03 22:49:41'),
(6, 'Apotik', 'Perempuan', '1', '3', '3', 'apotik', '2020-07-03 22:52:04'),
(9, 'Kasir', 'Laki-Laki', '1', '4', '4', 'kasir', '2020-07-03 23:04:23'),
(10, 'Nurlaela Khasannah', 'Perempuan', '89651589067', 'gudang', 'gudang', 'gudang', '2020-11-03 12:19:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_diagnosa_penyakit`
--
ALTER TABLE `tbl_diagnosa_penyakit`
  ADD PRIMARY KEY (`id_penyakit`),
  ADD KEY `id_pasien` (`id_pasien`);

--
-- Indexes for table `tbl_kredit`
--
ALTER TABLE `tbl_kredit`
  ADD PRIMARY KEY (`id_kredit`),
  ADD KEY `id_masuk` (`id_masuk`);

--
-- Indexes for table `tbl_obat_keluar`
--
ALTER TABLE `tbl_obat_keluar`
  ADD PRIMARY KEY (`id_keluar`),
  ADD KEY `id_stok` (`id_stok`),
  ADD KEY `id_transaksi` (`id_transaksi`);

--
-- Indexes for table `tbl_obat_masuk`
--
ALTER TABLE `tbl_obat_masuk`
  ADD PRIMARY KEY (`id_masuk`);

--
-- Indexes for table `tbl_pasien`
--
ALTER TABLE `tbl_pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indexes for table `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  ADD PRIMARY KEY (`id_bayar`),
  ADD KEY `id_transaksi` (`id_transaksi`);

--
-- Indexes for table `tbl_resep`
--
ALTER TABLE `tbl_resep`
  ADD PRIMARY KEY (`id_resep`),
  ADD KEY `id_pasien` (`id_pasien`);

--
-- Indexes for table `tbl_stok`
--
ALTER TABLE `tbl_stok`
  ADD PRIMARY KEY (`id_stok`),
  ADD KEY `id_masuk` (`id_masuk`);

--
-- Indexes for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_resep` (`id_resep`),
  ADD KEY `id_stok` (`id_stok`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_diagnosa_penyakit`
--
ALTER TABLE `tbl_diagnosa_penyakit`
  MODIFY `id_penyakit` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_kredit`
--
ALTER TABLE `tbl_kredit`
  MODIFY `id_kredit` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_obat_keluar`
--
ALTER TABLE `tbl_obat_keluar`
  MODIFY `id_keluar` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_obat_masuk`
--
ALTER TABLE `tbl_obat_masuk`
  MODIFY `id_masuk` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_pasien`
--
ALTER TABLE `tbl_pasien`
  MODIFY `id_pasien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  MODIFY `id_bayar` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_resep`
--
ALTER TABLE `tbl_resep`
  MODIFY `id_resep` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_stok`
--
ALTER TABLE `tbl_stok`
  MODIFY `id_stok` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  MODIFY `id_transaksi` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_diagnosa_penyakit`
--
ALTER TABLE `tbl_diagnosa_penyakit`
  ADD CONSTRAINT `tbl_diagnosa_penyakit_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `tbl_pasien` (`id_pasien`);

--
-- Constraints for table `tbl_kredit`
--
ALTER TABLE `tbl_kredit`
  ADD CONSTRAINT `tbl_kredit_ibfk_1` FOREIGN KEY (`id_masuk`) REFERENCES `tbl_obat_masuk` (`id_masuk`);

--
-- Constraints for table `tbl_obat_keluar`
--
ALTER TABLE `tbl_obat_keluar`
  ADD CONSTRAINT `tbl_obat_keluar_ibfk_1` FOREIGN KEY (`id_stok`) REFERENCES `tbl_stok` (`id_stok`),
  ADD CONSTRAINT `tbl_obat_keluar_ibfk_2` FOREIGN KEY (`id_transaksi`) REFERENCES `tbl_transaksi` (`id_transaksi`);

--
-- Constraints for table `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  ADD CONSTRAINT `tbl_pembayaran_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `tbl_transaksi` (`id_transaksi`);

--
-- Constraints for table `tbl_resep`
--
ALTER TABLE `tbl_resep`
  ADD CONSTRAINT `tbl_resep_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `tbl_pasien` (`id_pasien`);

--
-- Constraints for table `tbl_stok`
--
ALTER TABLE `tbl_stok`
  ADD CONSTRAINT `tbl_stok_ibfk_1` FOREIGN KEY (`id_masuk`) REFERENCES `tbl_obat_masuk` (`id_masuk`);

--
-- Constraints for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD CONSTRAINT `tbl_transaksi_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `tbl_pasien` (`id_pasien`),
  ADD CONSTRAINT `tbl_transaksi_ibfk_2` FOREIGN KEY (`id_resep`) REFERENCES `tbl_resep` (`id_resep`),
  ADD CONSTRAINT `tbl_transaksi_ibfk_3` FOREIGN KEY (`id_stok`) REFERENCES `tbl_stok` (`id_stok`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
