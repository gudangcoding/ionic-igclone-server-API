-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 14 Feb 2018 pada 14.08
-- Versi Server: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `appict`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `comment`
--

CREATE TABLE `comment` (
  `id_comment` int(10) NOT NULL,
  `id_post` int(10) NOT NULL,
  `id_member` int(10) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `comment`
--

INSERT INTO `comment` (`id_comment`, `id_post`, `id_member`, `comment`, `created_at`) VALUES
(15, 1, 2, 'Coba komentar dengan banyak baris apakah teks kepotong atau tidak.', '2018-01-27 00:18:45'),
(16, 1, 2, 'Komentar lagi ah', '2018-01-27 00:24:12'),
(17, 1, 2, 'bagus\n', '2018-01-27 00:24:23'),
(18, 1, 2, 'KOmentar ah', '2018-01-27 01:03:43'),
(19, 2, 2, 'Indonesia surganya dunia', '2018-01-27 15:44:14'),
(20, 2, 4, 'Setuju', '2018-01-27 15:46:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `follow`
--

CREATE TABLE `follow` (
  `id_follow` int(10) NOT NULL,
  `id_member` int(10) NOT NULL,
  `member_target` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `follow`
--

INSERT INTO `follow` (`id_follow`, `id_member`, `member_target`) VALUES
(107, 2, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `member`
--

CREATE TABLE `member` (
  `id_member` int(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `photo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `member`
--

INSERT INTO `member` (`id_member`, `email`, `username`, `password`, `name`, `photo`) VALUES
(2, 'daffa@gmail.com', 'daffa', '135a4e22cda0e0a68499e6d6e2a861aa', 'Daffa Shidqi', 'images/member/member_2018-02-14_19-58-14.jpg'),
(3, 'nabil@gmail.com', 'nabil', '070aa66550916626673f492bdbdb655f', 'Annisa Nabil', 'images/member/member.jpg'),
(4, 'latif@gmail.com', 'latif', 'c89109735fcd00291d5a9c9e44278747', 'Abdul Latif', 'images/member/member.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `notification`
--

CREATE TABLE `notification` (
  `id_notification` int(10) NOT NULL,
  `id_member` int(10) NOT NULL,
  `id_post` int(10) NOT NULL,
  `message` text NOT NULL,
  `member_target` int(10) NOT NULL,
  `new` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `notification`
--

INSERT INTO `notification` (`id_notification`, `id_member`, `id_post`, `message`, `member_target`, `new`, `created_at`) VALUES
(11, 2, 1, 'menyukai kiriman Anda', 3, 1, '2018-01-27 15:47:30'),
(12, 2, 1, 'menyukai kiriman Anda', 3, 1, '2018-01-27 15:47:47'),
(13, 3, 3, 'menyukai kiriman Anda', 2, 0, '2018-01-27 15:48:37'),
(14, 4, 0, 'mulai mengikuti anda', 2, 0, '2018-01-27 15:50:10'),
(15, 4, 2, 'menyukai kiriman Anda', 2, 0, '2018-01-27 15:50:35'),
(16, 4, 1, 'menyukai kiriman Anda', 2, 0, '2018-01-27 15:50:45'),
(17, 3, 1, 'menyukai kiriman Anda', 2, 0, '2018-01-27 15:50:48'),
(18, 2, 0, 'mulai mengikuti Anda', 3, 1, '2018-01-30 17:27:13'),
(62, 2, 0, 'mulai mengikuti Anda', 3, 1, '2018-02-08 17:50:02'),
(107, 2, 0, 'mulai mengikuti Anda', 3, 1, '2018-02-11 15:20:47'),
(108, 2, 0, 'mulai mengikuti Anda', 3, 1, '2018-02-11 15:25:21'),
(109, 2, 0, 'mulai mengikuti Anda', 3, 1, '2018-02-13 14:37:02'),
(110, 2, 0, 'mulai mengikuti Anda', 3, 1, '2018-02-13 15:16:49'),
(111, 2, 0, 'mulai mengikuti Anda', 3, 1, '2018-02-13 15:18:01'),
(112, 2, 0, 'mulai mengikuti Anda', 3, 1, '2018-02-13 15:19:56'),
(113, 2, 0, 'mulai mengikuti Anda', 3, 1, '2018-02-13 15:21:23'),
(114, 2, 0, 'mulai mengikuti Anda', 3, 1, '2018-02-14 02:08:53'),
(115, 2, 0, 'mulai mengikuti Anda', 3, 1, '2018-02-14 02:11:59'),
(116, 2, 0, 'mulai mengikuti Anda', 3, 1, '2018-02-14 02:12:05'),
(117, 2, 0, 'mulai mengikuti Anda', 3, 1, '2018-02-14 02:16:52'),
(118, 2, 0, 'mulai mengikuti Anda', 3, 1, '2018-02-14 02:18:05'),
(119, 2, 0, 'mulai mengikuti Anda', 3, 1, '2018-02-14 12:57:45'),
(120, 2, 0, 'mulai mengikuti Anda', 3, 1, '2018-02-14 13:07:05'),
(121, 2, 0, 'mulai mengikuti Anda', 3, 1, '2018-02-14 13:07:33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `post`
--

CREATE TABLE `post` (
  `id_post` int(10) NOT NULL,
  `id_member` int(10) NOT NULL,
  `image` varchar(100) NOT NULL,
  `post` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `post`
--

INSERT INTO `post` (`id_post`, `id_member`, `image`, `post`, `created_at`) VALUES
(1, 3, 'images/post/post_2018-01-26_08-33-02.jpg', 'Keindahan alam Indonesia', '2018-01-26 01:33:02'),
(2, 2, 'images/post/post_2018-01-27_09-23-20.jpg', 'Pantai yang indah', '2018-01-27 02:23:20'),
(3, 2, 'images/post/post_2018-02-25_11-34-09.jpg', 'So beautiful', '2018-02-25 04:34:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `post_like`
--

CREATE TABLE `post_like` (
  `id_like` int(10) NOT NULL,
  `id_member` int(10) NOT NULL,
  `id_post` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `post_like`
--

INSERT INTO `post_like` (`id_like`, `id_member`, `id_post`) VALUES
(17, 2, 3),
(19, 2, 2),
(21, 2, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id_comment`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`id_follow`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id_member`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id_notification`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id_post`);

--
-- Indexes for table `post_like`
--
ALTER TABLE `post_like`
  ADD PRIMARY KEY (`id_like`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id_comment` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `follow`
--
ALTER TABLE `follow`
  MODIFY `id_follow` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;
--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id_member` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id_notification` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id_post` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `post_like`
--
ALTER TABLE `post_like`
  MODIFY `id_like` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
