/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 8.0.30 : Database - eduwork_crud_sq
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`eduwork_crud_sq` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `eduwork_crud_sq`;

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `price` int DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `image_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `status` tinyint(1) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `product` */

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int NOT NULL,
  `stock` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `image_url` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `products` */

insert  into `products`(`id`,`user_id`,`name`,`price`,`stock`,`status`,`image_url`,`createdAt`,`updatedAt`) values 
(1,1,'Laptop AXIO',2000000,40,1,'http://localhost:3000/upload/header.jpg','2024-02-23 16:15:48','2024-02-23 16:15:48'),
(2,3,'Laptop ASUS ROG',2000000,40,1,'http://localhost:3000/upload/header.jpg','2024-02-24 01:36:56','2024-02-24 01:44:59'),
(4,3,'Laptop ASUS',2000000,40,1,'http://localhost:3000/upload/header.jpg','2024-02-24 02:11:13','2024-02-24 02:11:13');

/*Table structure for table `tb_feedback` */

DROP TABLE IF EXISTS `tb_feedback`;

CREATE TABLE `tb_feedback` (
  `id_feedback` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_pengguna` int NOT NULL,
  `feedback` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_feedback`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_feedback` */

insert  into `tb_feedback`(`id_feedback`,`id_pengguna`,`feedback`,`status`,`created_at`,`updated_at`) values 
(1,3,'Kecepatan website perlu ditingkatkan',0,'2023-03-30 14:33:09','2023-03-12 15:07:42'),
(2,6,'Pelayanan rumah sakit X perlu ditingkatkan',1,'2023-03-30 14:33:38','2023-03-30 06:35:30');

/*Table structure for table `tb_forgot_password` */

DROP TABLE IF EXISTS `tb_forgot_password`;

CREATE TABLE `tb_forgot_password` (
  `id_forgot_password` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_forgot_password`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_forgot_password` */

insert  into `tb_forgot_password`(`id_forgot_password`,`id_user`,`password`,`status`,`email_verified_at`,`created_at`,`updated_at`) values 
(1,'6','$2y$10$zhV4AQsDoe3LW86WDV7ax.8cj45RMQLt.DRUDPp43MprQWLOkNzzC',1,NULL,'2023-02-25 01:32:37','2023-03-01 07:20:23'),
(2,'3','$2y$10$eakdLawf6jqa6pe0p08EnOp9Owfiygt7LS2WfujBWE3MPT5Gzht.6',1,NULL,'2023-03-30 06:42:56','2023-03-30 06:58:03');

/*Table structure for table `tb_jnskel` */

DROP TABLE IF EXISTS `tb_jnskel`;

CREATE TABLE `tb_jnskel` (
  `id_jnskel` bigint unsigned NOT NULL AUTO_INCREMENT,
  `jns_kelamin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_jnskel`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_jnskel` */

insert  into `tb_jnskel`(`id_jnskel`,`jns_kelamin`,`created_at`,`updated_at`) values 
(1,'Laki-Laki',NULL,NULL),
(2,'Perempuan',NULL,NULL);

/*Table structure for table `tb_kasus` */

DROP TABLE IF EXISTS `tb_kasus`;

CREATE TABLE `tb_kasus` (
  `id_kasus` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama_pelapor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_tlp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto_ktp_confirm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_pas` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gejala_pas` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat_pas` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` double NOT NULL,
  `long` double NOT NULL,
  `id_mitra` int NOT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_kasus`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_kasus` */

insert  into `tb_kasus`(`id_kasus`,`nama_pelapor`,`no_tlp`,`foto_ktp_confirm`,`nama_pas`,`gejala_pas`,`alamat_pas`,`lat`,`long`,`id_mitra`,`status`,`created_at`,`updated_at`) values 
(1,'Pelapor 1','081111111','1234567111.jpg','Pasien B','Panas','Tabanan',-8.79348446779802,-11.111,0,3,'2023-03-03 22:50:51','2023-03-30 07:14:07'),
(2,'Pelapor 1','081888888','KTPMITRA1.jpg','Pasien A','Panas','Badung',-8.793484467798041,115.1634919398138,4,4,'2023-03-03 22:50:51','2023-03-30 07:28:02');

/*Table structure for table `tb_kasus_ditangani` */

DROP TABLE IF EXISTS `tb_kasus_ditangani`;

CREATE TABLE `tb_kasus_ditangani` (
  `id_kasus_ditangani` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_pasien` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `id_mitra` int NOT NULL,
  `gejala_awal` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_kasus` int DEFAULT '0',
  `telp_kel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_kasus_ditangani`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_kasus_ditangani` */

insert  into `tb_kasus_ditangani`(`id_kasus_ditangani`,`id_pasien`,`id_mitra`,`gejala_awal`,`id_kasus`,`telp_kel`,`status`,`created_at`,`updated_at`) values 
(9,'1234567890',4,'Panas Tinggi',0,'088888888',1,'2023-03-30 07:05:26','2023-03-30 07:33:28'),
(10,'1234567891',4,'Panas',2,'081888888',0,'2023-03-30 07:28:02','2023-03-30 07:28:02');

/*Table structure for table `tb_mitra` */

DROP TABLE IF EXISTS `tb_mitra`;

CREATE TABLE `tb_mitra` (
  `id_mitra` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` double NOT NULL,
  `long` double NOT NULL,
  `kamar` int NOT NULL,
  `kamar_terisi` int NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telp_mitra` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_mitra`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_mitra` */

insert  into `tb_mitra`(`id_mitra`,`nama`,`alamat`,`lat`,`long`,`kamar`,`kamar_terisi`,`deskripsi`,`telp_mitra`,`status`,`created_at`,`updated_at`) values 
(4,'Rumah Sakit Universitas Udayana','Jl. Rumah Sakit Unud, Jimbaran, Kec. Kuta Sel., Kabupaten Badung, Bali, Indonesia',-8.790345441147721,115.17424289113106,100,1,'Merupakan rumah sakit unud','03618953670',1,'2023-03-04 14:29:06','2023-03-30 07:33:28'),
(6,'Kasih Ibu General Hospital Tabanan','Jalan Flamboyan No. 9, Kampung Kodok, Dauh Peken, Tabanan, Tabanan Regency, Bali 82111',-8.55296033855464,115.1378941229005,50,0,'Rumah sakit yang bertempat di Tabanan','03613003030',1,'2023-03-29 06:44:25','2023-03-29 10:12:43'),
(7,'Rumah Sakit Umum Tabanan','Jl. Pahlawan No.14, Delod Peken, Kec. Tabanan, Kabupaten Tabanan, Bali 82121',-8.538748623330655,115.13208742016498,100,0,'Rumah sakit umum daerah Tabanan, Bali','0361811027',0,'2023-03-29 06:54:11','2023-03-29 06:54:11'),
(8,'General Hospital Wisma Prashanti','Jl. Yeh Gangga I No.9, Gubug, Kec. Tabanan, Kabupaten Tabanan, Bali 82113',-8.541919848298852,115.11182128299798,75,0,'Rumah sakit daerah Tabanan','0361819601',0,'2023-03-29 06:56:43','2023-03-29 06:56:43'),
(9,'Rumah Sakit Umum Daerah Bali Mandara','Jl. Bypass Ngurah Rai No.548, Sanur Kauh, Denpasar Selatan, Kota Denpasar, Bali',-8.703498052116577,115.24880895067992,150,0,'Rumah Sakit Umum Daerah Bali','03614490566',0,'2023-03-29 07:07:58','2023-03-29 07:07:58');

/*Table structure for table `tb_pasien` */

DROP TABLE IF EXISTS `tb_pasien`;

CREATE TABLE `tb_pasien` (
  `id_pasien` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nik` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jns_kelamin` int NOT NULL,
  `tgl_lahir` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_pasien`),
  UNIQUE KEY `tb_pasien_nik_unique` (`nik`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_pasien` */

insert  into `tb_pasien`(`id_pasien`,`nama`,`nik`,`jns_kelamin`,`tgl_lahir`,`alamat`,`created_at`,`updated_at`) values 
(1,'Pasien 1','12345678',1,'2023-03-01','Tabanan1','2023-03-03 06:59:00','2023-03-05 13:27:23'),
(2,'A','123456789012',1,'2023-03-08','1','2023-03-05 13:26:46','2023-03-05 13:26:46'),
(3,'Pasien X','1234567890',1,'2000-03-17','Badung','2023-03-30 07:05:26','2023-03-30 07:05:26'),
(4,'Pasien A','1234567891',1,'2000-05-02','Badung','2023-03-30 07:28:02','2023-03-30 07:28:02');

/*Table structure for table `tb_penanganan` */

DROP TABLE IF EXISTS `tb_penanganan`;

CREATE TABLE `tb_penanganan` (
  `id_penanganan` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_kasus` int NOT NULL,
  `desk_penanganan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_penanganan`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_penanganan` */

insert  into `tb_penanganan`(`id_penanganan`,`id_kasus`,`desk_penanganan`,`created_at`,`updated_at`) values 
(3,2,'Batuk 1','2023-03-03 14:39:44','2023-03-03 14:39:51'),
(4,3,'Sudah Diberi Obat','2023-03-05 09:57:26','2023-03-05 09:57:26'),
(6,7,'132213123','2023-03-06 17:21:40','2023-03-06 17:21:40'),
(7,9,'Diberi obat panas','2023-03-30 07:29:26','2023-03-30 07:29:26'),
(8,9,'Obat Batuk','2023-03-30 07:32:51','2023-03-30 07:32:51');

/*Table structure for table `tb_role` */

DROP TABLE IF EXISTS `tb_role`;

CREATE TABLE `tb_role` (
  `id_role` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tb_role` */

insert  into `tb_role`(`id_role`,`role`,`created_at`,`updated_at`) values 
(0,'Super Admin',NULL,NULL),
(1,'Admin',NULL,NULL),
(2,'Mitra',NULL,NULL),
(3,'Klien',NULL,NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id_users` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_mitra` int DEFAULT NULL,
  `nik` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jns_kelamin` int NOT NULL,
  `tgl_lahir` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_tlp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fotoktp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `role` int NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_users`),
  UNIQUE KEY `users_nik_unique` (`nik`),
  UNIQUE KEY `users_no_tlp_unique` (`no_tlp`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id_users`,`nama_user`,`id_mitra`,`nik`,`jns_kelamin`,`tgl_lahir`,`alamat`,`no_tlp`,`email`,`password`,`fotoktp`,`status`,`role`,`email_verified_at`,`remember_token`,`created_at`,`updated_at`) values 
(1,'Agung',0,'123456789012',1,'2005-01-06','Tabanan, Bali','081234567890','anom.semara@gmail.com','$2y$10$/MGRB136IyGFaogqtpPSLOXjTBlwCRyLwIxGMf6OotUA6xlI.5./C','KTPSADMIN.jpg',1,1,NULL,'jUEmrWQFqQScViR7qYFJi8IyjZoChQfdyWwg7V0JyPKD1RPHrhjrgaLAxHil','2023-02-20 09:07:37','2023-03-29 06:12:14'),
(3,'Zaky',4,'12345678',1,'2001-03-30','Badung','1','mitra@gmail.com','$2y$10$eakdLawf6jqa6pe0p08EnOp9Owfiygt7LS2WfujBWE3MPT5Gzht.6','KTPMITRA1.jpg',1,2,NULL,NULL,'2023-03-04 08:34:50','2023-03-30 06:58:03'),
(6,'Pelapor 1',0,'12345679',1,'2007-03-01','Denpasar','081234567899','pasien1@gmail.com','$2y$10$3rciWibGlhEe3Zuw7EeqC.oda3QoM1iFZwNI0xDocF.4ZSvmimBwu','12345679.jpg',1,3,NULL,NULL,'2023-03-30 06:05:47','2023-03-30 06:50:26'),
(7,'Super Admin',0,'123456',1,'2008-12-28','Sistem','0812727272727','super@gmail.com','$2y$10$20lftE6zhY5N0Joq1nW/fenJaJMoXjJLAbE6SrcER4B3UwjEMNunu','123456.jpg',1,0,NULL,'kUeeLJNXTKO5H7GNjffzvz2Nptc1uZJ1FruE20nVkkWHWJaI3E0RFKKJ6HZW','2023-03-30 06:26:28','2023-03-30 06:26:28'),
(8,'Klien',NULL,'1234567111',1,'2019-12-30','1abuifaiuwdwda','1111111111111','klien2@gmail.com','$2y$10$cxNX4NK9NZTUBhc3lbKMvuy7iMaZLKiWjA9ghe491LSMSRX43rCey','1234567111.jpg',3,3,NULL,NULL,'2023-03-30 06:37:17','2023-03-30 06:37:28');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
