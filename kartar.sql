-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 01 Sep 2021 pada 17.29
-- Versi Server: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kartar`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `username_admin` varchar(20) NOT NULL,
  `password_admin` varchar(20) NOT NULL,
  `nama_admin` varchar(50) NOT NULL,
  `email_admin` varchar(50) NOT NULL,
  `alamat_admin` text NOT NULL,
  `telepon_admin` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`username_admin`, `password_admin`, `nama_admin`, `email_admin`, `alamat_admin`, `telepon_admin`) VALUES
('diahayu', '12345', 'Diah Ayu', 'diah12ayu@gmail.com', 'Ngelom Megare Gang Masjid', '089675123121'),
('indahmustika', '12345', 'Indah Mustika', 'indahrahayumustika@gmail.com', 'Ngelom Megare RT.01 RW. 01 Taman Sidoarjo', '081234621232');

-- --------------------------------------------------------

--
-- Struktur dari tabel `agenda`
--

CREATE TABLE `agenda` (
  `id_agenda` int(11) NOT NULL,
  `judul_agenda` varchar(100) NOT NULL,
  `waktu_agenda` date NOT NULL,
  `muatan_agenda` text NOT NULL,
  `gambar_agenda` varchar(200) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_created` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `agenda`
--

INSERT INTO `agenda` (`id_agenda`, `judul_agenda`, `waktu_agenda`, `muatan_agenda`, `gambar_agenda`, `date_created`, `user_created`) VALUES
(1, 'Agenda Parcel Cinta Anak Yatim ke 2', '2016-01-12', '', '', '2020-03-18 10:22:24', 'indahmustika'),
(2, 'Gerakan #BESAR Alias #BersihSardonoharjo', '2016-01-20', '', '', '2020-03-18 10:23:19', 'indahmustika'),
(3, 'Bal Balan Rutin', '2016-01-26', '', '', '2020-03-18 10:23:44', 'indahmustika'),
(5, 'Penggalangan Dana Corona', '2020-03-25', '', '', '2020-03-20 14:15:54', 'indahmustika');

-- --------------------------------------------------------

--
-- Struktur dari tabel `berita`
--

CREATE TABLE `berita` (
  `id_berita` int(11) NOT NULL,
  `judul_berita` varchar(100) NOT NULL,
  `muatan_berita` text NOT NULL,
  `gambar_berita` varchar(200) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_created` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `berita`
--

INSERT INTO `berita` (`id_berita`, `judul_berita`, `muatan_berita`, `gambar_berita`, `date_created`, `user_created`) VALUES
(1, 'Kunjungan Lapangan Karang Taruna Desa Sardonoharjo ', '<p>Senin (1/7/2019) Karang Taruna Dharma Satria Nusantara Desa Sardonoharjo kedatangan Tim Dari Dinas Sosial Daerah Istimewa Yogyakarta untuk melakukan penilaian lapangan.</p>\r\n', '1.jpg', '2020-03-21 09:37:24', 'indahmustika'),
(2, 'Karang Taruna Berprestasi Kabupaten Sleman 2019', '<p>Dinas Sosial Kabupaten Sleman menggelar seleksi pilar-pilar kesejahteraan sosial berprestasi tahun 2019. Berikut adalah daftar juaranya:Karang Taruna Berprestasi Kabupaten Sleman 2019</p>\r\n', '3.jpg', '2020-03-21 09:37:01', 'indahmustika'),
(3, 'Kegiatan Jambore Sungai III Yogyakarta', '<p>Divisi Lingkungan Hidup Karang Taruna Sardonoharjo turut serta dalam acara Jambore Sungai III DIY. Sungaiku MartabatkuAir kita muliakan, Sungai kita lestarikan</p>\r\n', '5.jpg', '2020-03-21 09:39:26', 'indahmustika'),
(4, 'Kunjungan Karangtaruna Kusuma Sakti Hargomulyo', '<p>Karangtaruna dharma satria nusantara desa srdonoharjo menerima kunjungan dari karangtaruna kusuma sakti hargomulyo kokap kulonprogo, rombongan karangtaruna yang diketuai oleh mas latif</p>\r\n', '4.jpg', '2020-03-21 09:36:37', 'indahmustika'),
(10, 'Sejuk Spesial Peduli Gempa Palu & Donggala', '<p>Hari ini 28 September 2018 Pukul 17.02 waktu setempat, gempa 7,4 SR mengguncang saudara kita di sana. Teriakan minta tolong, jeritan kesakitan, bangunan runtuh.</p>\r\n', '7.jpg', '2020-03-20 04:43:44', 'indahmustika');

-- --------------------------------------------------------

--
-- Struktur dari tabel `galeri`
--

CREATE TABLE `galeri` (
  `id_foto` int(11) NOT NULL,
  `judul_foto` varchar(100) NOT NULL,
  `file_foto` varchar(200) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_created` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `galeri`
--

INSERT INTO `galeri` (`id_foto`, `judul_foto`, `file_foto`, `date_created`, `user_created`) VALUES
(1, 'Lomba Balap Sarung Hari Kemerdekaan', 'galeri2.jpeg', '2020-03-18 00:00:00', 'indahmustika'),
(2, 'Lomba Tarik Tambang 17 Agustus', 'galeri4.jpeg', '2020-03-18 03:00:00', 'indahmustika'),
(3, 'Lomba Makan Kerupuk ', 'galeri1.jpg', '2020-03-21 13:36:54', 'indahmustika');

-- --------------------------------------------------------

--
-- Struktur dari tabel `organisasi`
--

CREATE TABLE `organisasi` (
  `id_organisasi` int(11) NOT NULL,
  `nama_organisasi` varchar(100) NOT NULL,
  `foto_organisasi` varchar(200) NOT NULL,
  `tentang_organisasi` text NOT NULL,
  `motto_organisasi` text NOT NULL,
  `sejarah_organisasi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `organisasi`
--

INSERT INTO `organisasi` (`id_organisasi`, `nama_organisasi`, `foto_organisasi`, `tentang_organisasi`, `motto_organisasi`, `sejarah_organisasi`) VALUES
(1, 'Karang Taruna Akar Bangkit', 'foto.jpg', '<p>Karang Taruna Akar Bangkit adalah organisasi sosial kemasyarakatan yang berada di Desa Karangbong Kecamatan Gedangan Kabupaten Sidoarjo.</p>\r\n', '<p>Bersatu Padu, Guyub Rukun, Seduluran Saklawase</p>\r\n', '<p>Karang Taruna Akar Bangkit diresmikan dan dilantik pada tanggal 21 Oktober 2016 berdasarkan Surat Keputusan (SK) oleh Kepala Desa Bapak Arief Agus Tjahjono, SE beserta perangkat desa Karangbong dan saksikan oleh BPD, LPMD, seluruh Ketua RW desa Karangbong, ANSOR, IPNU, IPPNU Ranting Karangbong, Ketua Karang Taruna Kecamatan Gedangan, seluruh Karang Taruna RW dan RT Desa Karangbong, para tokoh manyarakat.</p>\r\n');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengumuman`
--

CREATE TABLE `pengumuman` (
  `id_pengumuman` int(11) NOT NULL,
  `judul_pengumuman` varchar(100) NOT NULL,
  `muatan_pengumuman` text NOT NULL,
  `gambar_pengumuman` varchar(200) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_created` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengumuman`
--

INSERT INTO `pengumuman` (`id_pengumuman`, `judul_pengumuman`, `muatan_pengumuman`, `gambar_pengumuman`, `date_created`, `user_created`) VALUES
(1, 'Acara MABIT (Malam Bina Iman & Taqwa)', '', '', '2020-03-18 05:46:52', 'indahmustika'),
(2, 'Pemilihan Duta Museum DIY Tahun 2017', '', '', '2020-03-18 05:47:32', 'indahmustika'),
(4, 'Pendaftaran Lomba 17 Agustus 1945', '', '', '2020-03-21 01:20:10', 'indahmustika');

-- --------------------------------------------------------

--
-- Struktur dari tabel `struktural`
--

CREATE TABLE `struktural` (
  `id_jabatan` int(11) NOT NULL,
  `nama_jabatan` varchar(100) NOT NULL,
  `jenis_jabatan` varchar(100) NOT NULL,
  `periode_jabatan` varchar(100) NOT NULL,
  `nama_penjabat` varchar(100) NOT NULL,
  `foto_penjabat` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `struktural`
--

INSERT INTO `struktural` (`id_jabatan`, `nama_jabatan`, `jenis_jabatan`, `periode_jabatan`, `nama_penjabat`, `foto_penjabat`) VALUES
(1, 'Pembina', 'Inti', '2016-2021', 'Herman Sutanto', ''),
(2, 'Ketua', 'Inti', '2016-2021', 'Sindu Alfian Ridho Pradana', 'pengurus2.jpg'),
(3, 'Wakil Ketua', 'Inti', '2016-2021', 'Fahat Amirudin', ''),
(4, 'Sekretaris 1', 'Inti', '2016-2021', 'Devi Sagita Indah Puspitasari', 'pengurus3.jpg'),
(5, 'Sekretaris 2', 'Inti', '2016-2021', 'Naily Martin Faizatur Rahmah', ''),
(6, 'Bendahara 1', 'Inti', '2016-2021', 'Reka Ayu Pertiwi', 'pengurus4.jpg'),
(7, 'Bendahara 2', 'Inti', '2016-2021', 'Amelia Eka Dimawan', ''),
(8, 'Seksi Pendidikan & Pelatihan', 'Anggota', '2016-2021', 'Ahmad Nasrulloh', ''),
(9, 'Seksi Pendidikan & Pelatihan', 'Anggota', '2016-2021', 'Fikri Maulana', ''),
(10, 'Seksi Pendidikan & Pelatihan', 'Anggota', '2016-2021', 'Arif', ''),
(11, 'Seksi Pendidikan & Pelatihan', 'Anggota', '2016-2021', 'Siti Arofah', ''),
(12, 'Seksi Pendidikan & Pelatihan', 'Anggota', '2016-2021', 'Rafif', ''),
(13, 'Seksi Pendidikan & Pelatihan', 'Anggota', '2016-2021', 'Arif Feby', ''),
(14, 'Seksi Pendidikan & Pelatihan', 'Anggota', '2016-2021', 'Miftakh Zein Firdaus', ''),
(15, 'Seksi Pendidikan & Pelatihan', 'Anggota', '2016-2021', 'M.Indra', ''),
(16, 'Seksi Pendidikan & Pelatihan', 'Anggota', '2016-2021', 'Ena Laily', ''),
(17, 'Seksi Olahraga & Seni Budaya', 'Anggota', '2016-2021', 'Fani Fida Paramita', ''),
(18, 'Seksi Olahraga & Seni Budaya', 'Anggota', '2016-2021', 'Sailendra Sonya', ''),
(19, 'Seksi Olahraga & Seni Budaya', 'Anggota', '2016-2021', 'Aldi Jefri', ''),
(20, 'Seksi Olahraga & Seni Budaya', 'Anggota', '2016-2021', 'Ricky', ''),
(21, 'Seksi Olahraga & Seni Budaya', 'Anggota', '2016-2021', 'Firman', ''),
(22, 'Seksi Olahraga & Seni Budaya', 'Anggota', '2016-2021', 'Rizky', ''),
(23, 'Seksi Olahraga & Seni Budaya', 'Anggota', '2016-2021', 'Ade Irfan', ''),
(24, 'Seksi Olahraga & Seni Budaya', 'Anggota', '2016-2021', 'M.Hamzhah Nurochman', ''),
(25, 'Seksi Olahraga & Seni Budaya', 'Anggota', '2016-2021', 'Renaldi', ''),
(26, 'Seksi Lingkungan Hidup', 'Anggota', '2016-2020', 'Nurul Bisma', ''),
(27, 'Seksi Lingkungan Hidup', 'Anggota', '2016-2020', 'Agung P.S', ''),
(28, 'Seksi Lingkungan Hidup', 'Anggota', '2016-2020', 'Dhea Asri .M', ''),
(29, 'Seksi Lingkungan Hidup', 'Anggota', '2016-2020', 'Rico Saputra', ''),
(30, 'Seksi Lingkungan Hidup', 'Anggota', '2016-2020', 'Nova', ''),
(31, 'Seksi Lingkungan Hidup', 'Anggota', '2016-2020', 'Choirul Anam', ''),
(32, 'Seksi Lingkungan Hidup', 'Anggota', '2016-2020', 'M.Ali Muzaqy', ''),
(33, 'Seksi Lingkungan Hidup', 'Anggota', '2016-2020', 'Mas’ud', ''),
(34, 'Seksi Lingkungan Hidup', 'Anggota', '2016-2020', 'Miftakhul Ari Dwi Yanto', ''),
(35, 'Seksi Humas & Kemitraan', 'Anggota', '2016-2021', 'Angga Apriyanto', ''),
(36, 'Seksi Humas & Kemitraan ', 'Anggota', '2016-2021', 'Bagus', ''),
(37, 'Seksi Humas & Kemitraan ', 'Anggota', '2016-2021', 'Farhan', ''),
(38, 'Seksi Humas & Kemitraan ', 'Anggota', '2016-2021', 'Muammal Khamidi', ''),
(39, 'Seksi Humas & Kemitraan ', 'Anggota', '2016-2021', 'Fatchur', ''),
(40, 'Seksi Humas & Kemitraan ', 'Anggota', '2016-2021', 'Era Samsara', ''),
(41, 'Seksi Humas & Kemitraan ', 'Anggota', '2016-2021', 'Dicky Riandi', ''),
(42, 'Seksi Humas & Kemitraan ', 'Anggota', '2016-2021', 'Putri Kurnia', ''),
(43, 'Seksi Humas & Kemitraan ', 'Anggota', '2016-2021', 'Agus Nur Hamzah', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username_admin`);

--
-- Indexes for table `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`id_agenda`),
  ADD KEY `user_created` (`user_created`);

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id_berita`),
  ADD KEY `user_created` (`user_created`);

--
-- Indexes for table `galeri`
--
ALTER TABLE `galeri`
  ADD PRIMARY KEY (`id_foto`),
  ADD KEY `user_created` (`user_created`);

--
-- Indexes for table `organisasi`
--
ALTER TABLE `organisasi`
  ADD PRIMARY KEY (`id_organisasi`);

--
-- Indexes for table `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD PRIMARY KEY (`id_pengumuman`),
  ADD KEY `user_created` (`user_created`);

--
-- Indexes for table `struktural`
--
ALTER TABLE `struktural`
  ADD PRIMARY KEY (`id_jabatan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agenda`
--
ALTER TABLE `agenda`
  MODIFY `id_agenda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `id_berita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `galeri`
--
ALTER TABLE `galeri`
  MODIFY `id_foto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `organisasi`
--
ALTER TABLE `organisasi`
  MODIFY `id_organisasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pengumuman`
--
ALTER TABLE `pengumuman`
  MODIFY `id_pengumuman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `struktural`
--
ALTER TABLE `struktural`
  MODIFY `id_jabatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `agenda`
--
ALTER TABLE `agenda`
  ADD CONSTRAINT `agenda_ibfk_1` FOREIGN KEY (`user_created`) REFERENCES `admin` (`username_admin`);

--
-- Ketidakleluasaan untuk tabel `berita`
--
ALTER TABLE `berita`
  ADD CONSTRAINT `berita_ibfk_1` FOREIGN KEY (`user_created`) REFERENCES `admin` (`username_admin`);

--
-- Ketidakleluasaan untuk tabel `galeri`
--
ALTER TABLE `galeri`
  ADD CONSTRAINT `galeri_ibfk_1` FOREIGN KEY (`user_created`) REFERENCES `admin` (`username_admin`);

--
-- Ketidakleluasaan untuk tabel `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD CONSTRAINT `pengumuman_ibfk_1` FOREIGN KEY (`user_created`) REFERENCES `admin` (`username_admin`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
