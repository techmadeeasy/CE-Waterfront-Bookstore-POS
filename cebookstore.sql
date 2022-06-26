-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 26, 2022 at 02:14 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cebookstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `adjusted_products`
--

DROP TABLE IF EXISTS `adjusted_products`;
CREATE TABLE IF NOT EXISTS `adjusted_products` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `adjustment_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adjusted_products_adjustment_id_foreign` (`adjustment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adjustments`
--

DROP TABLE IF EXISTS `adjustments`;
CREATE TABLE IF NOT EXISTS `adjustments` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `reference` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_code` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `category_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_category_code_unique` (`category_code`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_code`, `category_name`, `created_at`, `updated_at`) VALUES
(1, 'MB2022', 'Ministry Books', '2022-06-12 18:11:53', '2022-06-12 18:11:53'),
(2, 'DEVO2022', 'Daily Devotionals', '2022-06-12 18:12:32', '2022-06-12 18:12:32'),
(3, 'PCDL2022', 'PCDL', '2022-06-12 18:13:22', '2022-06-12 18:13:22'),
(4, 'BBL', 'Bibles', '2022-06-15 23:41:29', '2022-06-15 23:41:29');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
CREATE TABLE IF NOT EXISTS `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `thousand_separator` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `decimal_separator` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `exchange_rate` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `currency_name`, `code`, `symbol`, `thousand_separator`, `decimal_separator`, `exchange_rate`, `created_at`, `updated_at`) VALUES
(1, 'US Dollar', 'USD', '$', ',', '.', NULL, '2022-06-12 14:51:59', '2022-06-12 14:51:59'),
(2, 'South African Rand', 'ZAR', 'R', ',', '.', NULL, '2022-06-12 18:45:50', '2022-06-12 18:45:50');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `customer_email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `customer_phone` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_name`, `customer_email`, `customer_phone`, `city`, `country`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Venancio Gomani', 'info@venanciogomani.net', '0810292775', 'Lights Cell Group 2', 'Ushering', 'Rondebosch, Cape Town', '2022-06-12 19:36:50', '2022-06-23 01:31:22'),
(2, 'Jolando Njati', 'jolanjati@gmail.com', '0817551301', 'Mimshack Agape Care Group', 'Bookshop, Foundation School', 'Rosebank, Cape Town', '2022-06-12 19:37:45', '2022-06-23 01:30:44'),
(3, 'Precious Ndaudzwa Sis', 'pndaudzwa@gmail.com', '0738229677', 'Mount Zion Thornton', 'Welcome Team', 'Thornton, Cape Town', '2022-06-15 20:36:55', '2022-06-23 01:29:44'),
(4, 'Bulelwa Nodoba Sis', 'test@test.com', '0648278790', 'Haven of love', 'Nil', 'Nil', '2022-06-15 22:31:51', '2022-06-23 01:28:54'),
(5, 'Tinashe Machona Bro', 'test@test.com', '0740339464', 'Parklands Care Group', 'Foundation School', 'Parklands, Cape Town', '2022-06-15 22:35:07', '2022-06-23 01:27:37'),
(6, 'Nomzamo Cabane Sis', 'test@test.com', '0835343344', 'Nil', 'Counsellors', 'Nil', '2022-06-15 22:37:51', '2022-06-23 01:26:49'),
(7, 'Moses Mwewa Bro', 'test@test.com', '0000000000', 'Nil', 'Nil', 'Nil', '2022-06-15 22:40:44', '2022-06-23 01:26:09'),
(8, 'Given Dube Bro', 'test@test.com', '0722546922', 'Mimshack Cell Group', 'Media OBM, CECY', 'Rosebank, Cape Town', '2022-06-15 22:42:22', '2022-06-23 01:25:44'),
(9, 'Dorah Khonje Sis', 'test@test.com', '0783224305', 'Mimshack Cell Group', 'Counsellors OBM', 'Rosebank, Cape Town', '2022-06-15 22:43:06', '2022-06-23 01:24:47'),
(10, 'Gladys Lazaro Sis', 'test@test.com', '0000000000', 'Nil', 'Nil', 'Nil', '2022-06-15 22:43:56', '2022-06-23 01:23:52'),
(11, 'Sphokazi Poswa Sis', 'test@test.com', '0000000000', 'Shekinah Cell', 'Nil', 'Nil', '2022-06-15 22:52:34', '2022-06-23 01:23:20'),
(12, 'Stefano Alfonso Bro', 'test@test.com', '0846562493', 'Clouds of Love', 'Nil', 'Rosebank, Cape Town', '2022-06-15 22:54:20', '2022-06-23 01:22:58'),
(13, 'Bondice Mukombozi Bro', 'test@test.com', '0000000000', 'Nil', 'Media', 'Nil', '2022-06-15 23:19:18', '2022-06-23 01:22:31'),
(14, 'Noleen Kanjanda Sis', 'test@test.com', '0678777581', 'Nil', 'Media', 'Brooklyn', '2022-06-15 23:20:08', '2022-06-23 01:22:14'),
(15, 'Tim Horn Bro', 'test@test.com', '0000000000', 'Nil', 'Nil', 'Sea Point, Cape Town', '2022-06-15 23:38:53', '2022-06-23 01:19:32'),
(16, 'Anthony Abraham Bro', 'test@cect.co.za', '0717419141', 'Nil', 'Nil', 'Nil', '2022-06-19 13:38:13', '2022-06-23 01:18:50'),
(17, 'Nomonde Payi Sis', 'test@cect.co.za', '0711997680', 'nil', 'nil', 'nil', '2022-06-19 13:40:57', '2022-06-23 01:18:25'),
(18, 'Tapera Mashandudze Bro', 'test@cect.co.za', '00000000000', 'Zion Cell Leiden', 'Foundation School', 'nil', '2022-06-19 13:46:24', '2022-06-23 01:18:09'),
(19, 'Mike Kanjala Bro', 'test@ctc', '0000000000', 'Kenilworth cell', 'nil', 'nil', '2022-06-19 13:51:38', '2022-06-23 01:14:56'),
(20, 'Josephine Munemo Sis', 'test@cect.co.za', '0000000000', 'nil', 'Welcome Team', 'Cape Town', '2022-06-19 14:02:16', '2022-06-23 01:14:36'),
(21, 'Tafara Chifamba Bro', 'test@test.com', '0738456067', 'Kenilworth Cell Group', 'Security', 'Nil', '2022-06-23 01:41:35', '2022-06-23 01:41:35'),
(22, 'Jane Brown Sis', 'test@test.com', '0837223340', 'Nil', 'Welcome Team', 'Nil', '2022-06-23 01:43:41', '2022-06-23 01:43:41'),
(23, 'Luyanda Matiwane Bro', 'test@test.com', '0632334278', 'Nil', 'Bookshop', 'Nil', '2022-06-23 01:44:19', '2022-06-23 01:44:19'),
(24, 'Lynnete Mauchaza Sis', 'test@test.com', '0621759020', 'Revelation of Love', 'Nil', 'Nil', '2022-06-23 01:44:52', '2022-06-23 01:44:52'),
(25, 'Sabelo Moyo Bro', 'test@test.com', '0672333850', 'Nil', 'Choir', 'Nil', '2022-06-23 01:45:37', '2022-06-23 01:45:37'),
(26, 'Jeffrey Sikenjana Bro', 'test@test.com', '0727697564', 'Mount Zion Cell Group', 'Nil', 'Nil', '2022-06-23 01:46:41', '2022-06-23 01:46:41'),
(27, 'Ndamu Savhase Bro', 'test@test.com', '0735364240', 'Epignosis Online Cell', 'Ushering', 'Nil', '2022-06-23 01:47:26', '2022-06-23 01:47:26'),
(28, 'Jowaine Floris Sis', 'test@test.com', '0605274286', 'Nil', 'Nil', 'Nil', '2022-06-23 01:48:16', '2022-06-23 01:48:16'),
(29, 'Maureen Ituket Sis', 'test@test.com', '0823016118', 'Mimshack Agape Care Group', 'Follow-up and Data Management OBM/ CEYC Ushering', 'Mowbray, Cape Town', '2022-06-23 01:49:49', '2022-06-23 01:49:49'),
(30, 'Ruvimbo Charakupa Sis', 'test@test.com', '0606611729', 'Mimshack Cell', 'Media OBM, CECY', 'Observatory, Cape Town', '2022-06-23 01:50:49', '2022-06-23 01:50:49'),
(31, 'Vuthlarhi Shirindza Sis', 'test@test.com', '0792202408', 'Eklektos Cell Group', 'Nil', 'Rondebosch, Cape Town', '2022-06-23 01:52:20', '2022-06-23 01:52:20'),
(32, 'Edmund Adams Bro', 'test@test.com', '0000000000', 'Mount Zion Cell Group', 'Nil', 'Nil', '2022-06-23 01:54:24', '2022-06-23 01:54:24'),
(33, 'Boma Mercy Simpsons Sis', 'test@test.com', '0849596247', 'Mimshack Cell Group', 'Counsellors', 'Newlands, Cape Town', '2022-06-23 01:55:09', '2022-06-23 01:55:09'),
(34, 'Michelle Collis', 'michellecollis@gmail.com', '0810292775', 'Nil', 'Nil', 'Rondebosch', '2022-06-25 20:36:47', '2022-06-25 20:36:47'),
(35, 'Donald Makombe', 'donaldmakombe@gmail.com', '0810292775', 'Mimshack', 'Staff', 'Rosebank', '2022-06-26 00:55:52', '2022-06-26 00:55:52'),
(36, 'Annie Nyirenda', 'test@cect.co.za', '0748107595', 'Nil', 'Nil', 'Cape Town', '2022-06-26 11:46:37', '2022-06-26 11:46:37'),
(37, 'Veractous Gurijena', 'test@cect.co.za', '0744362009', 'Nil', 'Nil', 'Cape Town', '2022-06-26 11:51:09', '2022-06-26 11:51:09'),
(38, 'Marlou Mawande Sis', 'test@cect.co.za', '0815818427', 'Nil', 'Nil', 'Cape Town', '2022-06-26 11:53:40', '2022-06-26 11:53:40'),
(39, 'Tapiwa Pasi', 'test@cect.co.za', '0789697247', 'Kenilworth', 'Nil', 'Kenilworth', '2022-06-26 11:55:58', '2022-06-26 11:55:58'),
(40, 'Thabo Mcengwa Bro', 'test@cect.co.za', '0790408816', 'Wynberg Cell', 'Nil', 'Cape Town', '2022-06-26 11:57:35', '2022-06-26 11:57:35'),
(41, 'Mandlenksoi Benayo', 'test@cect.co.za', '0732928472', 'Nil', 'Nil', 'Cape Town', '2022-06-26 11:59:30', '2022-06-26 11:59:30'),
(42, 'Emilia Choga', 'test@cect.co.za', '0627447221', 'Majestic Life', 'Nile', 'Cape Town', '2022-06-26 12:01:09', '2022-06-26 12:01:09'),
(43, 'Philemon Mvoya', 'test@cect.co.za', '000000000', 'Nil', 'Nil', 'Cape Town', '2022-06-26 12:07:09', '2022-06-26 12:07:09'),
(44, 'Jean Irakoze', 'test@cect.co.za', '0677216825', 'Nil', 'Nil', 'Cape Town', '2022-06-26 12:08:08', '2022-06-26 12:08:08'),
(45, 'Petronella Synders', 'test@cect.co.za', '0000000000', 'Nil', 'Nil', 'Cape Town', '2022-06-26 12:10:01', '2022-06-26 12:10:01'),
(46, 'Lennex Rugara', 'test@cect.co.za', '0000000000', 'Nil', 'Nil', 'Cape Town', '2022-06-26 13:48:17', '2022-06-26 13:48:17'),
(47, 'Anne', 'test@cect.co.za', '0671710100', 'Shining Light', 'Nil', 'Nil', '2022-06-26 13:50:21', '2022-06-26 13:50:21'),
(48, 'Kiyang Jibraeel', 'test@cect.co.za', '0725092223', 'Nil', 'Nil', 'Cape Town', '2022-06-26 13:51:39', '2022-06-26 13:51:39'),
(49, 'Kiyang Jibraeel', 'test@cect.co.za', '0725092223', 'Nil', 'Nil', 'Cape Town', '2022-06-26 13:51:40', '2022-06-26 13:51:40'),
(50, 'Shepherd Kavala', 'test@cect.co.za', '0719657710', 'Nil', 'Media', 'Cape Town', '2022-06-26 13:56:24', '2022-06-26 13:56:24'),
(51, 'No Name', 'test@cect.co.za', '0000000000', 'Nil', 'Staff', 'Cape Town', '2022-06-26 13:59:15', '2022-06-26 13:59:15'),
(52, 'Gladys', 'test@cect.co.za', '0000000000', 'Nil', 'Nil', 'Cape Town', '2022-06-26 14:02:34', '2022-06-26 14:02:34'),
(53, 'Monde Sindi', 'test@cect.co.za', '0847593186', 'Nil', 'Nil', 'Cape Town', '2022-06-26 14:05:47', '2022-06-26 14:05:47'),
(54, 'Zukiswa Maqendwana', 'test@cect.co.za', '076692491', 'Nil', 'Nil', 'Cape Town', '2022-06-26 14:10:02', '2022-06-26 14:10:02'),
(55, 'Joshua Umeokoli', 'test@cect.co.za', '0718798485', 'Nil', 'Nil', 'Cape Town', '2022-06-26 14:13:02', '2022-06-26 14:13:02'),
(56, 'Maggie Saidi', 'test@cect.co.za', '0734105186', 'Dunamis Sea Point', 'Nil', 'Cape Town', '2022-06-26 14:19:53', '2022-06-26 14:19:53'),
(57, 'Joyce Gondwe', 'test@cect.co.za', '0844496067', 'Nil', 'Nil', 'Cape Town', '2022-06-26 14:32:42', '2022-06-26 14:32:42'),
(58, 'Josephine Saros', 'test@cect.co.za', '0678628515', 'Nil', 'Nil', 'Cape Town', '2022-06-26 14:36:57', '2022-06-26 14:36:57'),
(59, 'Pamela Human', 'test@cect.co.za', '0714588037', 'Nil', 'Nil', 'Cape Town', '2022-06-26 14:39:39', '2022-06-26 14:39:39'),
(60, 'Tinyiko Baloyi', 'test@cect.co.za', '06800278408', 'Mount Zion', 'Media', 'Cape Town', '2022-06-26 14:41:18', '2022-06-26 14:41:18'),
(61, 'Percy Lisole', 'test@cect.co.za', '0795697292', 'Word Alive', 'Teens and Youth Ministry', 'Parow', '2022-06-26 14:50:57', '2022-06-26 14:50:57'),
(62, 'Sisipho Bottoman', 'test@cect.co.za', '0815479317', 'Nil', 'Ushering', 'Cape Town', '2022-06-26 15:17:10', '2022-06-26 15:17:10'),
(63, 'Nicky Edeh', 'test@cect.co.za', '0769860646', 'Nil', 'Nil', 'Cape Town', '2022-06-26 15:18:49', '2022-06-26 15:18:49'),
(64, 'Precious Magondi', 'test@cect.co.za', '0672995396', 'Nil', 'Nil', 'Cape Town', '2022-06-26 15:22:43', '2022-06-26 15:22:43'),
(65, 'Judith Benard', 'judiebee2000@gmail.com', '0736621841', 'Mimshack', 'Foundation School', 'Cape Town', '2022-06-26 15:23:41', '2022-06-26 15:23:41'),
(66, 'Joy Titus', 'test@cect.co.za', '0791078094', 'Characity Youth', 'Teen and Youth Ministry', 'Observatory', '2022-06-26 15:29:52', '2022-06-26 15:29:52'),
(67, 'Ntombi Gumede', 'test@cect.co.za', '0822196400', 'Nil', 'Nil', 'Cape Town', '2022-06-26 15:32:54', '2022-06-26 15:32:54'),
(68, 'Zanele Ndlovi', 'test@cect.co.za', '0796191909', 'Nil', 'Nil', 'Cape Town', '2022-06-26 15:40:57', '2022-06-26 15:40:57'),
(69, 'Mackion Mlele', 'test@cect.co.za', '0000000000', 'Nil', 'Nil', 'Cape Town', '2022-06-26 15:41:39', '2022-06-26 15:41:39'),
(70, 'Mariam Emetuche', 'test@cect.co.za', '0670168403', 'Nil', 'Nil', 'Cape Town', '2022-06-26 16:20:26', '2022-06-26 16:20:26'),
(71, 'Samantha Machona', 'test@cect.co.za', '0625945470', 'Photizo', 'Nil', 'Cape Town', '2022-06-26 16:31:30', '2022-06-26 16:31:30'),
(72, 'Thaba Mowo', 'test@cect.co.za', '07861644416', 'Nil', 'Nil', 'Cape Town', '2022-06-26 16:32:32', '2022-06-26 16:32:32'),
(73, 'Clarisse Tshikuna', 'test@cect.co.za', '0849762326', 'Nil', 'Nil', 'Cape Town', '2022-06-26 16:34:08', '2022-06-26 16:34:08'),
(74, 'Thulile Mngxekeza', 'test@cect.co.za', '0659002450', 'Nil', 'Nil', 'Cape Town', '2022-06-26 16:50:53', '2022-06-26 16:50:53'),
(75, 'Malibongwe Tshikina', 'test@cect.co.za', '0676179361', 'Nil', 'Nil', 'Cape Town', '2022-06-26 16:52:31', '2022-06-26 16:55:18'),
(76, 'Teresca Bowman', 'test@cect.co.za', '0000000000', 'Mount Zion', 'Nil', 'Cape Town', '2022-06-26 16:57:16', '2022-06-26 16:57:16'),
(77, 'Camillo Musungina', 'test@cect.co.za', '0742942274', 'Nil', 'Nil', 'Cape Town', '2022-06-26 16:59:06', '2022-06-26 16:59:06'),
(78, 'Grace Mutero', 'test@cect.co.za', '0738073732', 'Nil', 'Nil', 'Cape Town', '2022-06-26 17:00:26', '2022-06-26 17:00:26'),
(79, 'Linda Ndlovu', 'test@cect.co.za', '0731989118', 'Nil', 'Nil', 'Cape Town', '2022-06-26 17:02:27', '2022-06-26 17:02:27'),
(80, 'Sinako Mayekiso', 'test@cect.co.za', '0769132361', 'Majestic Life', 'Nil', 'Cape Town', '2022-06-26 17:04:53', '2022-06-26 17:04:53'),
(81, 'Robert Manyenganava', 'test@cect.co.za', '0000000000', 'Maitland Viewing Center', 'Nil', 'Cape Town', '2022-06-26 17:08:30', '2022-06-26 17:08:30'),
(82, 'Ntosh Bengu', 'test@cect.co.za', '0000000000', 'Nil', 'Counsellors', 'Cape Town', '2022-06-26 17:11:09', '2022-06-26 17:11:09'),
(83, 'Caroline Steemkamp', 'test@cect.co.za', '0000000000', 'Nil', 'Counsellors', 'Cape Town', '2022-06-26 17:12:57', '2022-06-26 17:12:57'),
(84, 'Patricia Foni', 'test@cect.co.za', '0000000000', 'Nil', 'Counsellors', 'Cape Town', '2022-06-26 17:14:43', '2022-06-26 17:14:43'),
(85, 'Festus', 'test@cect.co.za', '0000000000', 'Nil', 'Counsellors', 'Cape Town', '2022-06-26 17:15:42', '2022-06-26 17:15:42'),
(86, 'Nocawe', 'test@cect.co.za', '0000000000', 'Nil', 'Counsellors', 'Cape Town', '2022-06-26 17:16:41', '2022-06-26 17:16:41');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
CREATE TABLE IF NOT EXISTS `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `details` text COLLATE utf8_unicode_ci,
  `amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expenses_category_id_foreign` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

DROP TABLE IF EXISTS `expense_categories`;
CREATE TABLE IF NOT EXISTS `expense_categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `category_description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `model_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `collection_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `mime_type` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `disk` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `conversions_disk` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `generated_conversions` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_uuid_unique` (`uuid`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_07_14_145038_create_categories_table', 1),
(5, '2021_07_14_145047_create_products_table', 1),
(6, '2021_07_15_211319_create_media_table', 1),
(7, '2021_07_16_010005_create_uploads_table', 1),
(8, '2021_07_16_220524_create_permission_tables', 1),
(9, '2021_07_22_003941_create_adjustments_table', 1),
(10, '2021_07_22_004043_create_adjusted_products_table', 1),
(11, '2021_07_28_192608_create_expense_categories_table', 1),
(12, '2021_07_28_192616_create_expenses_table', 1),
(13, '2021_07_29_165419_create_customers_table', 1),
(14, '2021_07_29_165440_create_suppliers_table', 1),
(15, '2021_07_31_015923_create_currencies_table', 1),
(16, '2021_07_31_140531_create_settings_table', 1),
(17, '2021_07_31_201003_create_sales_table', 1),
(18, '2021_07_31_212446_create_sale_details_table', 1),
(19, '2021_08_07_192203_create_sale_payments_table', 1),
(20, '2021_08_08_021108_create_purchases_table', 1),
(21, '2021_08_08_021131_create_purchase_payments_table', 1),
(22, '2021_08_08_021713_create_purchase_details_table', 1),
(23, '2021_08_08_175345_create_sale_returns_table', 1),
(24, '2021_08_08_175358_create_sale_return_details_table', 1),
(25, '2021_08_08_175406_create_sale_return_payments_table', 1),
(26, '2021_08_08_222603_create_purchase_returns_table', 1),
(27, '2021_08_08_222612_create_purchase_return_details_table', 1),
(28, '2021_08_08_222646_create_purchase_return_payments_table', 1),
(29, '2021_08_16_015031_create_quotations_table', 1),
(30, '2021_08_16_155013_create_quotation_details_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 2),
(1, 'App\\Models\\User', 4),
(2, 'App\\Models\\User', 1),
(5, 'App\\Models\\User', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8_unicode_ci NOT NULL,
  `guard_name` varchar(125) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'edit_own_profile', 'web', '2022-06-12 14:51:57', '2022-06-12 14:51:57'),
(2, 'access_user_management', 'web', '2022-06-12 14:51:57', '2022-06-12 14:51:57'),
(3, 'show_total_stats', 'web', '2022-06-12 14:51:57', '2022-06-12 14:51:57'),
(4, 'show_month_overview', 'web', '2022-06-12 14:51:57', '2022-06-12 14:51:57'),
(5, 'show_weekly_sales_purchases', 'web', '2022-06-12 14:51:57', '2022-06-12 14:51:57'),
(6, 'show_monthly_cashflow', 'web', '2022-06-12 14:51:57', '2022-06-12 14:51:57'),
(7, 'show_notifications', 'web', '2022-06-12 14:51:57', '2022-06-12 14:51:57'),
(8, 'access_products', 'web', '2022-06-12 14:51:57', '2022-06-12 14:51:57'),
(9, 'create_products', 'web', '2022-06-12 14:51:57', '2022-06-12 14:51:57'),
(10, 'show_products', 'web', '2022-06-12 14:51:57', '2022-06-12 14:51:57'),
(11, 'edit_products', 'web', '2022-06-12 14:51:57', '2022-06-12 14:51:57'),
(12, 'delete_products', 'web', '2022-06-12 14:51:57', '2022-06-12 14:51:57'),
(13, 'access_product_categories', 'web', '2022-06-12 14:51:57', '2022-06-12 14:51:57'),
(14, 'print_barcodes', 'web', '2022-06-12 14:51:57', '2022-06-12 14:51:57'),
(15, 'access_adjustments', 'web', '2022-06-12 14:51:57', '2022-06-12 14:51:57'),
(16, 'create_adjustments', 'web', '2022-06-12 14:51:57', '2022-06-12 14:51:57'),
(17, 'show_adjustments', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(18, 'edit_adjustments', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(19, 'delete_adjustments', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(20, 'access_quotations', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(21, 'create_quotations', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(22, 'show_quotations', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(23, 'edit_quotations', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(24, 'delete_quotations', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(25, 'create_quotation_sales', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(26, 'send_quotation_mails', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(27, 'access_expenses', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(28, 'create_expenses', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(29, 'edit_expenses', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(30, 'delete_expenses', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(31, 'access_expense_categories', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(32, 'access_customers', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(33, 'create_customers', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(34, 'show_customers', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(35, 'edit_customers', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(36, 'delete_customers', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(37, 'access_suppliers', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(38, 'create_suppliers', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(39, 'show_suppliers', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(40, 'edit_suppliers', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(41, 'delete_suppliers', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(42, 'access_sales', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(43, 'create_sales', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(44, 'show_sales', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(45, 'edit_sales', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(46, 'delete_sales', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(47, 'create_pos_sales', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(48, 'access_sale_payments', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(49, 'access_sale_returns', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(50, 'create_sale_returns', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(51, 'show_sale_returns', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(52, 'edit_sale_returns', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(53, 'delete_sale_returns', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(54, 'access_sale_return_payments', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(55, 'access_purchases', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(56, 'create_purchases', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(57, 'show_purchases', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(58, 'edit_purchases', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(59, 'delete_purchases', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(60, 'access_purchase_payments', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(61, 'access_purchase_returns', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(62, 'create_purchase_returns', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(63, 'show_purchase_returns', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(64, 'edit_purchase_returns', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(65, 'delete_purchase_returns', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(66, 'access_purchase_return_payments', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(67, 'access_reports', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(68, 'access_currencies', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(69, 'create_currencies', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(70, 'edit_currencies', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(71, 'delete_currencies', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(72, 'access_settings', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `product_code` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_barcode_symbology` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_cost` int(11) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_unit` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_stock_alert` int(11) NOT NULL,
  `product_order_tax` int(11) DEFAULT NULL,
  `product_tax_type` tinyint(4) DEFAULT NULL,
  `product_note` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_product_code_unique` (`product_code`),
  KEY `products_category_id_foreign` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `product_name`, `product_code`, `product_barcode_symbology`, `product_quantity`, `product_cost`, `product_price`, `product_unit`, `product_stock_alert`, `product_order_tax`, `product_tax_type`, `product_note`, `created_at`, `updated_at`) VALUES
(1, 2, 'Rhapsody of Realities, June 2022', 'ROR062022', 'C128', 262, 1500, 2000, '10', 100, NULL, NULL, NULL, '2022-06-12 18:38:00', '2022-06-26 11:51:34'),
(2, 1, 'Join this Chariot', 'JTC', 'C128', 200, 5000, 6000, '50', 20, NULL, NULL, NULL, '2022-06-12 18:39:11', '2022-06-12 18:39:11'),
(3, 2, 'Rhapsody of Realities For Early Reader, June 2022', 'ER062022', 'C128', 500, 1500, 2000, '10', 50, NULL, NULL, NULL, '2022-06-15 22:47:13', '2022-06-15 22:47:13'),
(4, 2, 'Rhapsody of Realities For Kids, Vol 121', 'KROR121', 'C128', 300, 1500, 2000, '10', 30, NULL, NULL, NULL, '2022-06-15 22:48:40', '2022-06-15 22:48:40'),
(5, 2, 'Rhapsody of Realities Teevo, June 2022', 'Teevo062022', 'C128', 678, 1500, 2000, '10', 70, NULL, NULL, NULL, '2022-06-15 22:51:18', '2022-06-15 23:35:54'),
(6, 3, 'Espees 5', 'PCDLESPZ5', 'C128', 10000, 1600, 1600, '10', 10, NULL, NULL, NULL, '2022-06-15 23:01:42', '2022-06-15 23:01:42'),
(7, 3, 'Espees 10', 'PCDLESPZ10', 'C128', 100000, 3200, 3200, '10', 100, NULL, NULL, NULL, '2022-06-15 23:02:42', '2022-06-15 23:02:42'),
(8, 3, 'Espees 25', 'PCDLESPZ25', 'C128', 100000, 8000, 8000, '10', 10, NULL, NULL, NULL, '2022-06-15 23:03:23', '2022-06-15 23:03:23'),
(9, 3, 'Espees 50', 'PCDLESPZ50', 'C128', 99999, 15900, 15900, '10', 10, NULL, NULL, NULL, '2022-06-15 23:04:04', '2022-06-15 23:41:08'),
(10, 3, 'Espees 100', 'PCDLESPZ100', 'C128', 100000, 31800, 31800, '10', 10, NULL, NULL, NULL, '2022-06-15 23:04:57', '2022-06-15 23:04:57'),
(11, 4, 'Rhapsody Of Realities Bibles', 'RORBBL', 'C128', 100, 20000, 25000, '10', 10, NULL, NULL, NULL, '2022-06-15 23:42:45', '2022-06-15 23:44:14'),
(12, 1, 'How to Make Your Faith Work', 'H2MYFW2022', 'C128', 196, 8000, 9000, '10', 20, NULL, NULL, NULL, '2022-06-19 14:18:37', '2022-06-26 16:33:21'),
(13, 2, 'Rhapsody of Realities, July 2022', 'ROR072022', 'C128', 1799, 1800, 2000, '10', 50, NULL, NULL, NULL, '2022-06-22 20:42:28', '2022-06-26 18:01:45'),
(14, 1, 'Recreating your World', 'RYW001', 'C128', 99, 5500, 6000, '10', 10, NULL, NULL, NULL, '2022-06-23 02:29:49', '2022-06-23 02:40:28'),
(15, 2, 'Rhapsody of Realities Teevo, July 2022', 'Teevo072022', 'C128', 563, 1800, 2000, '10', 60, NULL, NULL, NULL, '2022-06-26 12:05:10', '2022-06-26 16:58:05'),
(16, 1, 'The Seven Spirits of God', '7SOF', 'C128', 197, 8500, 9000, '10', 20, NULL, NULL, NULL, '2022-06-26 14:08:53', '2022-06-26 16:34:44');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
CREATE TABLE IF NOT EXISTS `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `reference` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `supplier_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `tax_percentage` int(11) NOT NULL DEFAULT '0',
  `tax_amount` int(11) NOT NULL DEFAULT '0',
  `discount_percentage` int(11) NOT NULL DEFAULT '0',
  `discount_amount` int(11) NOT NULL DEFAULT '0',
  `shipping_amount` int(11) NOT NULL DEFAULT '0',
  `total_amount` int(11) NOT NULL,
  `paid_amount` int(11) NOT NULL,
  `due_amount` int(11) NOT NULL,
  `status` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `payment_status` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `payment_method` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchases_supplier_id_foreign` (`supplier_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_details`
--

DROP TABLE IF EXISTS `purchase_details`;
CREATE TABLE IF NOT EXISTS `purchase_details` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `product_code` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `product_discount_amount` int(11) NOT NULL,
  `product_discount_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'fixed',
  `product_tax_amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_details_purchase_id_foreign` (`purchase_id`),
  KEY `purchase_details_product_id_foreign` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_payments`
--

DROP TABLE IF EXISTS `purchase_payments`;
CREATE TABLE IF NOT EXISTS `purchase_payments` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `payment_method` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_payments_purchase_id_foreign` (`purchase_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_returns`
--

DROP TABLE IF EXISTS `purchase_returns`;
CREATE TABLE IF NOT EXISTS `purchase_returns` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `reference` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `supplier_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `tax_percentage` int(11) NOT NULL DEFAULT '0',
  `tax_amount` int(11) NOT NULL DEFAULT '0',
  `discount_percentage` int(11) NOT NULL DEFAULT '0',
  `discount_amount` int(11) NOT NULL DEFAULT '0',
  `shipping_amount` int(11) NOT NULL DEFAULT '0',
  `total_amount` int(11) NOT NULL,
  `paid_amount` int(11) NOT NULL,
  `due_amount` int(11) NOT NULL,
  `status` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `payment_status` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `payment_method` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_returns_supplier_id_foreign` (`supplier_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_return_details`
--

DROP TABLE IF EXISTS `purchase_return_details`;
CREATE TABLE IF NOT EXISTS `purchase_return_details` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `purchase_return_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `product_code` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `product_discount_amount` int(11) NOT NULL,
  `product_discount_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'fixed',
  `product_tax_amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_return_details_purchase_return_id_foreign` (`purchase_return_id`),
  KEY `purchase_return_details_product_id_foreign` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_return_payments`
--

DROP TABLE IF EXISTS `purchase_return_payments`;
CREATE TABLE IF NOT EXISTS `purchase_return_payments` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `purchase_return_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `payment_method` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_return_payments_purchase_return_id_foreign` (`purchase_return_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

DROP TABLE IF EXISTS `quotations`;
CREATE TABLE IF NOT EXISTS `quotations` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `reference` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `tax_percentage` int(11) NOT NULL DEFAULT '0',
  `tax_amount` int(11) NOT NULL DEFAULT '0',
  `discount_percentage` int(11) NOT NULL DEFAULT '0',
  `discount_amount` int(11) NOT NULL DEFAULT '0',
  `shipping_amount` int(11) NOT NULL DEFAULT '0',
  `total_amount` int(11) NOT NULL,
  `status` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quotations_customer_id_foreign` (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_details`
--

DROP TABLE IF EXISTS `quotation_details`;
CREATE TABLE IF NOT EXISTS `quotation_details` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `quotation_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `product_code` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `product_discount_amount` int(11) NOT NULL,
  `product_discount_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'fixed',
  `product_tax_amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quotation_details_quotation_id_foreign` (`quotation_id`),
  KEY `quotation_details_product_id_foreign` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8_unicode_ci NOT NULL,
  `guard_name` varchar(125) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2022-06-12 14:51:58', '2022-06-12 14:51:58'),
(2, 'Super Admin', 'web', '2022-06-12 14:51:59', '2022-06-12 14:51:59'),
(3, 'Sales Representative', 'web', '2022-06-12 19:18:16', '2022-06-12 19:18:16'),
(4, 'Sales Analyst', 'web', '2022-06-12 19:21:03', '2022-06-12 19:21:03'),
(5, 'Editor', 'web', '2022-06-12 19:25:35', '2022-06-12 19:25:35');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 3),
(1, 4),
(1, 5),
(2, 5),
(3, 1),
(3, 3),
(3, 4),
(3, 5),
(4, 1),
(4, 3),
(4, 4),
(4, 5),
(5, 1),
(5, 3),
(5, 4),
(5, 5),
(6, 1),
(6, 4),
(6, 5),
(7, 1),
(7, 4),
(7, 5),
(8, 1),
(8, 3),
(8, 5),
(9, 1),
(9, 5),
(10, 1),
(10, 3),
(10, 5),
(11, 1),
(11, 5),
(12, 1),
(13, 1),
(13, 3),
(13, 5),
(14, 1),
(14, 3),
(14, 5),
(15, 1),
(15, 5),
(16, 1),
(16, 5),
(17, 1),
(17, 5),
(18, 1),
(18, 5),
(19, 1),
(20, 1),
(20, 3),
(20, 5),
(21, 1),
(21, 3),
(21, 5),
(22, 1),
(22, 3),
(22, 5),
(23, 1),
(23, 3),
(23, 5),
(24, 1),
(25, 1),
(25, 3),
(25, 5),
(26, 1),
(26, 3),
(26, 5),
(27, 1),
(27, 5),
(28, 1),
(28, 5),
(29, 1),
(29, 5),
(30, 1),
(30, 5),
(31, 1),
(31, 5),
(32, 1),
(32, 3),
(32, 5),
(33, 1),
(33, 3),
(33, 5),
(34, 1),
(34, 3),
(34, 5),
(35, 1),
(35, 3),
(35, 5),
(36, 1),
(36, 5),
(37, 1),
(37, 4),
(37, 5),
(38, 1),
(38, 5),
(39, 1),
(39, 3),
(39, 4),
(39, 5),
(40, 1),
(40, 5),
(41, 1),
(42, 1),
(42, 3),
(42, 4),
(42, 5),
(43, 1),
(43, 3),
(43, 4),
(43, 5),
(44, 1),
(45, 1),
(45, 3),
(45, 4),
(45, 5),
(46, 1),
(47, 1),
(47, 3),
(47, 5),
(48, 1),
(48, 3),
(48, 4),
(48, 5),
(49, 1),
(49, 3),
(49, 4),
(49, 5),
(50, 1),
(50, 4),
(50, 5),
(51, 1),
(51, 3),
(51, 4),
(51, 5),
(52, 1),
(52, 4),
(52, 5),
(53, 1),
(54, 1),
(54, 3),
(54, 4),
(54, 5),
(55, 1),
(55, 4),
(55, 5),
(56, 1),
(56, 4),
(56, 5),
(57, 1),
(57, 4),
(57, 5),
(58, 1),
(58, 4),
(58, 5),
(59, 1),
(60, 1),
(60, 4),
(60, 5),
(61, 1),
(61, 4),
(61, 5),
(62, 1),
(62, 4),
(62, 5),
(63, 1),
(63, 4),
(63, 5),
(64, 1),
(64, 4),
(64, 5),
(65, 1),
(66, 1),
(66, 4),
(66, 5),
(67, 1),
(67, 3),
(67, 4),
(67, 5),
(68, 1),
(68, 5),
(69, 1),
(69, 5),
(70, 1),
(70, 5),
(71, 1),
(72, 1),
(72, 5);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
CREATE TABLE IF NOT EXISTS `sales` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `reference` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `tax_percentage` int(11) NOT NULL DEFAULT '0',
  `tax_amount` int(11) NOT NULL DEFAULT '0',
  `discount_percentage` int(11) NOT NULL DEFAULT '0',
  `discount_amount` int(11) NOT NULL DEFAULT '0',
  `shipping_amount` int(11) NOT NULL DEFAULT '0',
  `total_amount` int(11) NOT NULL,
  `paid_amount` int(11) NOT NULL,
  `due_amount` int(11) NOT NULL,
  `status` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `payment_status` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `payment_method` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_customer_id_foreign` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `date`, `reference`, `customer_id`, `customer_name`, `tax_percentage`, `tax_amount`, `discount_percentage`, `discount_amount`, `shipping_amount`, `total_amount`, `paid_amount`, `due_amount`, `status`, `payment_status`, `payment_method`, `note`, `created_at`, `updated_at`) VALUES
(1, '2022-06-15', 'SL-00001', 3, 'Precious Ndaudzwa', 0, 0, 0, 0, 0, 2000, 2000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-15 20:42:46', '2022-06-15 20:42:46'),
(2, '2022-06-16', 'SL-00002', 4, 'Sis Bulelwa Nodoba', 0, 0, 0, 0, 0, 6000, 6000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-15 22:32:36', '2022-06-15 22:32:36'),
(3, '2022-06-16', 'SL-00003', 10, 'Gladys Lazaro', 0, 0, 0, 0, 0, 380000, 380000, 0, 'Pending', 'Paid', 'Other', 'To Pay', '2022-06-15 23:08:03', '2022-06-15 23:08:50'),
(4, '2022-06-16', 'SL-00004', 2, 'Jolando Njati', 0, 0, 0, 0, 0, 20000, 20000, 0, 'Completed', 'Paid', 'Credit Card', NULL, '2022-06-15 23:10:57', '2022-06-15 23:10:57'),
(5, '2022-06-16', 'SL-00005', 13, 'Bro Bondice Mukombozi', 0, 0, 0, 0, 0, 4000, 4000, 0, 'Completed', 'Paid', 'Cash', 'Bought in partnership with Sis Noleen Kanjanda', '2022-06-15 23:21:25', '2022-06-15 23:21:25'),
(6, '2022-06-16', 'SL-00006', 9, 'Dorah', 0, 0, 0, 0, 0, 2000, 2000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-15 23:22:13', '2022-06-15 23:22:13'),
(7, '2022-06-16', 'SL-00007', 8, 'Given Dube', 0, 0, 0, 0, 0, 20000, 20000, 0, 'Completed', 'Paid', 'Bank Transfer', NULL, '2022-06-15 23:22:57', '2022-06-15 23:22:57'),
(8, '2022-06-16', 'SL-00008', 7, 'Bro Moses Mwewa', 0, 0, 0, 0, 0, 320000, 320000, 0, 'Completed', 'Paid', 'Credit Card', '50 ROR for Prison Ministry', '2022-06-15 23:24:08', '2022-06-15 23:24:08'),
(9, '2022-06-16', 'SL-00009', 6, 'Sis Nomzamo Cabane', 0, 0, 0, 0, 0, 24000, 24000, 0, 'Completed', 'Paid', 'Credit Card', NULL, '2022-06-15 23:25:08', '2022-06-15 23:25:08'),
(10, '2022-06-16', 'SL-00010', 12, 'Bro Stefano Alfonso', 0, 0, 0, 0, 0, 20000, 20000, 0, 'Completed', 'Paid', 'Cash', 'For J16', '2022-06-15 23:35:54', '2022-06-15 23:35:54'),
(11, '2022-06-16', 'SL-00011', 11, 'Sis Sphokazi Poswa', 0, 0, 0, 0, 0, 19900, 19900, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-15 23:41:08', '2022-06-15 23:41:08'),
(12, '2022-06-16', 'SL-00012', 11, 'Sis Sphokazi Poswa', 0, 0, 0, 0, 0, 125000, 125000, 0, 'Pending', 'Paid', 'Credit Card', 'Paid in advance', '2022-06-15 23:43:52', '2022-06-15 23:44:14'),
(13, '2022-06-16', 'SL-00013', 15, 'Bro Tim Horn', 0, 0, 0, 0, 0, 200000, 200000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-15 23:44:52', '2022-06-15 23:44:52'),
(14, '2022-06-19', 'SL-00014', 16, 'Bro Anthony Abraham', 0, 0, 0, 0, 0, 20000, 20000, 0, 'Completed', 'Paid', 'Credit Card', NULL, '2022-06-19 13:38:52', '2022-06-19 13:38:52'),
(15, '2022-06-19', 'SL-00015', 17, 'sis Nomonde Payi', 0, 0, 0, 0, 0, 4000, 4000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-19 13:41:43', '2022-06-19 13:41:43'),
(16, '2022-06-19', 'SL-00016', 18, 'Bro Tapera Mashandudze', 0, 0, 0, 0, 0, 20000, 20000, 0, 'Completed', 'Paid', 'Credit Card', NULL, '2022-06-19 13:47:13', '2022-06-19 13:47:13'),
(17, '2022-06-19', 'SL-00017', 19, 'Bro Mike Kanjala', 0, 0, 0, 0, 0, 8000, 8000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-19 13:52:35', '2022-06-19 13:52:35'),
(18, '2022-06-19', 'SL-00018', 20, 'Sis Josephine Munemo', 0, 0, 0, 0, 0, 32000, 32000, 0, 'Completed', 'Paid', 'Cash', 'Prison Ministry Partnership', '2022-06-19 14:02:58', '2022-06-19 14:02:58'),
(19, '2022-06-19', 'SL-00019', 9, 'Sis Dorah Khonje', 0, 0, 0, 0, 0, 28000, 28000, 0, 'Completed', 'Paid', 'Credit Card', NULL, '2022-06-19 14:19:35', '2022-06-19 14:19:35'),
(20, '2022-06-23', 'SL-00020', 21, 'Tafara Chifamba Bro', 0, 0, 0, 0, 0, 20000, 20000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-23 01:57:38', '2022-06-23 01:57:38'),
(21, '2022-06-23', 'SL-00021', 22, 'Jane Brown Sis', 0, 0, 0, 0, 0, 2000, 2000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-23 01:59:09', '2022-06-23 01:59:09'),
(22, '2022-06-23', 'SL-00022', 23, 'Luyanda Matiwane Bro', 0, 0, 0, 0, 0, 11000, 11000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-23 02:01:23', '2022-06-23 02:01:23'),
(23, '2022-06-23', 'SL-00023', 24, 'Lynnete Mauchaza Sis', 0, 0, 0, 0, 0, 10000, 10000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-23 02:02:03', '2022-06-23 02:02:03'),
(24, '2022-06-23', 'SL-00024', 25, 'Sabelo Moyo Bro', 0, 0, 0, 0, 0, 16000, 16000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-23 02:19:34', '2022-06-23 02:19:34'),
(25, '2022-06-23', 'SL-00025', 26, 'Jeffrey Sikenjana Bro', 0, 0, 0, 0, 0, 4000, 4000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-23 02:20:13', '2022-06-23 02:20:13'),
(26, '2022-06-23', 'SL-00026', 27, 'Ndamu Savhase Bro', 0, 0, 0, 0, 0, 2000, 2000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-23 02:23:53', '2022-06-23 02:23:53'),
(27, '2022-06-23', 'SL-00027', 29, 'Maureen Ituket Sis', 0, 0, 0, 0, 0, 2000, 2000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-23 02:25:30', '2022-06-23 02:25:30'),
(28, '2022-06-23', 'SL-00028', 30, 'Ruvimbo Charakupa Sis', 0, 0, 0, 0, 0, 6000, 6000, 0, 'Completed', 'Paid', 'Credit Card', NULL, '2022-06-23 02:28:50', '2022-06-23 02:28:50'),
(29, '2022-06-23', 'SL-00029', 31, 'Vuthlarhi Shirindza Sis', 0, 0, 0, 0, 0, 16000, 16000, 0, 'Completed', 'Paid', 'Bank Transfer', NULL, '2022-06-23 02:39:56', '2022-06-23 02:39:56'),
(30, '2022-06-23', 'SL-00030', 28, 'Jowaine Floris Sis', 0, 0, 0, 0, 0, 10000, 10000, 0, 'Completed', 'Paid', 'Credit Card', NULL, '2022-06-23 02:40:28', '2022-06-23 02:40:28'),
(32, '2022-06-23', 'SL-00031', 32, 'Edmund Adams Bro', 0, 0, 0, 0, 0, 1000000, 1000000, 0, 'Completed', 'Paid', 'Bank Transfer', NULL, '2022-06-23 02:44:32', '2022-06-23 02:44:32'),
(33, '2022-06-23', 'SL-00033', 33, 'Boma Mercy Simpsons Sis', 0, 0, 0, 0, 0, 20000, 20000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-23 02:45:05', '2022-06-23 02:45:05'),
(34, '2022-06-26', 'SL-00034', 36, 'Annie Nyirenda', 0, 0, 0, 0, 0, 2000, 2000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-26 11:47:20', '2022-06-26 11:47:20'),
(35, '2022-06-26', 'SL-00035', 37, 'Veractous Gurijena', 0, 0, 0, 0, 0, 2000, 2000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-26 11:51:34', '2022-06-26 11:51:34'),
(36, '2022-06-26', 'SL-00036', 38, 'Marlou Mawande Sis', 0, 0, 0, 0, 0, 100000, 100000, 0, 'Completed', 'Paid', 'Credit Card', NULL, '2022-06-26 11:55:00', '2022-06-26 11:55:00'),
(37, '2022-06-26', 'SL-00037', 39, 'Tapiwa Pasi', 0, 0, 0, 0, 0, 2000, 2000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-26 11:56:31', '2022-06-26 11:56:31'),
(38, '2022-06-26', 'SL-00038', 40, 'Thabo Mcengwa Bro', 0, 0, 0, 0, 0, 2000, 2000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-26 11:58:11', '2022-06-26 11:58:11'),
(39, '2022-06-26', 'SL-00039', 41, 'Mandlenksoi Benayo', 0, 0, 0, 0, 0, 2000, 2000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-26 12:00:11', '2022-06-26 12:00:11'),
(40, '2022-06-26', 'SL-00040', 42, 'Emilia Choga', 0, 0, 0, 0, 0, 2000, 2000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-26 12:01:36', '2022-06-26 12:01:36'),
(41, '2022-06-26', 'SL-00041', 12, 'Stefano Alfonso Bro', 0, 0, 0, 0, 0, 30000, 30000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-26 12:06:14', '2022-06-26 12:06:14'),
(42, '2022-06-26', 'SL-00042', 43, 'Philemon Mvoya', 0, 0, 0, 0, 0, 2000, 2000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-26 12:07:30', '2022-06-26 12:07:30'),
(43, '2022-06-26', 'SL-00043', 44, 'Jean Irakoze', 0, 0, 0, 0, 0, 10000, 10000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-26 12:08:40', '2022-06-26 12:08:40'),
(44, '2022-06-26', 'SL-00044', 45, 'Petronella Synders', 0, 0, 0, 0, 0, 20000, 20000, 0, 'Completed', 'Paid', 'Credit Card', NULL, '2022-06-26 12:10:31', '2022-06-26 12:10:31'),
(45, '2022-06-26', 'SL-00045', 46, 'Lennex Rugara', 0, 0, 0, 0, 0, 2000, 2000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-26 13:49:06', '2022-06-26 13:49:06'),
(46, '2022-06-26', 'SL-00046', 47, 'Anne', 0, 0, 0, 0, 0, 4000, 4000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-26 13:52:18', '2022-06-26 13:52:18'),
(47, '2022-06-26', 'SL-00047', 48, 'Kiyang Jibraeel', 0, 0, 0, 0, 0, 6000, 6000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-26 13:54:42', '2022-06-26 13:54:42'),
(48, '2022-06-26', 'SL-00048', 50, 'Shepherd Kavala', 0, 0, 0, 0, 0, 2000, 2000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-26 13:57:18', '2022-06-26 13:57:18'),
(49, '2022-06-26', 'SL-00049', 52, 'Gladys', 0, 0, 0, 0, 0, 2000, 2000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-26 14:03:03', '2022-06-26 14:03:03'),
(50, '2022-06-26', 'SL-00050', 54, 'Zukiswa Maqendwana', 0, 0, 0, 0, 0, 4000, 4000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-26 14:10:27', '2022-06-26 14:10:27'),
(51, '2022-06-26', 'SL-00051', 53, 'Monde Sindi', 0, 0, 0, 0, 0, 8000, 8000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-26 14:11:05', '2022-06-26 14:11:05'),
(52, '2022-06-26', 'SL-00052', 55, 'Joshua Umeokoli', 0, 0, 0, 0, 0, 6000, 6000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-26 14:13:32', '2022-06-26 14:13:32'),
(53, '2022-06-26', 'SL-00053', 10, 'Gladys Lazaro Sis', 0, 0, 0, 0, 0, 300000, 300000, 0, 'Pending', 'Paid', 'Cheque', 'To Pay (Receivable)', '2022-06-26 14:15:04', '2022-06-26 14:15:32'),
(54, '2022-06-26', 'SL-00054', 56, 'Maggie Saidi', 0, 0, 0, 0, 0, 4000, 4000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-26 14:20:27', '2022-06-26 14:20:27'),
(55, '2022-06-26', 'SL-00055', 57, 'Joyce Gondwe', 0, 0, 0, 0, 0, 11000, 11000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-26 14:33:36', '2022-06-26 14:33:36'),
(57, '2022-06-26', 'SL-00056', 58, 'Josephine Saros', 0, 0, 0, 0, 0, 4000, 4000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-26 14:37:27', '2022-06-26 14:37:27'),
(58, '2022-06-26', 'SL-00058', 59, 'Pamela Human', 0, 0, 0, 0, 0, 20000, 20000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-26 14:40:09', '2022-06-26 14:40:09'),
(59, '2022-06-26', 'SL-00059', 60, 'Tinyiko Baloyi', 0, 0, 0, 0, 0, 10000, 10000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-26 14:41:46', '2022-06-26 14:41:46'),
(60, '2022-06-26', 'SL-00060', 62, 'Sisipho Bottoman', 0, 0, 0, 0, 0, 2000, 2000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-26 15:17:42', '2022-06-26 15:17:42'),
(61, '2022-06-26', 'SL-00061', 63, 'Nicky Edeh', 0, 0, 0, 0, 0, 24000, 24000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-26 15:20:00', '2022-06-26 15:20:00'),
(62, '2022-06-26', 'SL-00062', 65, 'Judith Benard', 0, 0, 0, 0, 0, 30000, 30000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-26 15:26:53', '2022-06-26 15:26:53'),
(63, '2022-06-26', 'SL-00063', 64, 'Precious Magondi', 0, 0, 0, 0, 0, 22000, 22000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-26 15:27:52', '2022-06-26 15:27:52'),
(64, '2022-06-26', 'SL-00064', 66, 'Joy Titus', 0, 0, 0, 0, 0, 12000, 12000, 0, 'Completed', 'Paid', 'Bank Transfer', NULL, '2022-06-26 15:31:00', '2022-06-26 15:31:00'),
(65, '2022-06-26', 'SL-00065', 67, 'Ntombi Gumede', 0, 0, 0, 0, 0, 24000, 24000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-26 15:33:59', '2022-06-26 15:33:59'),
(66, '2022-06-26', 'SL-00066', 70, 'Mariam Emetuche', 0, 0, 0, 0, 0, 11000, 11000, 0, 'Completed', 'Paid', 'Credit Card', NULL, '2022-06-26 16:22:33', '2022-06-26 16:22:33'),
(67, '2022-06-26', 'SL-00067', 5, 'Tinashe Machona Bro', 0, 0, 0, 0, 0, 40000, 40000, 0, 'Completed', 'Paid', 'Credit Card', NULL, '2022-06-26 16:30:39', '2022-06-26 16:30:39'),
(68, '2022-06-26', 'SL-00068', 72, 'Thaba Mowo', 0, 0, 0, 0, 0, 19000, 19000, 0, 'Completed', 'Paid', 'Credit Card', NULL, '2022-06-26 16:33:21', '2022-06-26 16:33:21'),
(69, '2022-06-26', 'SL-00069', 73, 'Clarisse Tshikuna', 0, 0, 0, 0, 0, 29000, 29000, 0, 'Completed', 'Paid', 'Credit Card', NULL, '2022-06-26 16:34:44', '2022-06-26 16:34:44'),
(70, '2022-06-26', 'SL-00070', 74, 'Thulile Mngxekeza', 0, 0, 0, 0, 0, 30000, 30000, 0, 'Completed', 'Paid', 'Credit Card', NULL, '2022-06-26 16:51:50', '2022-06-26 16:51:50'),
(71, '2022-06-26', 'SL-00071', 75, 'Malibongwe Bowman', 0, 0, 0, 0, 0, 12000, 12000, 0, 'Completed', 'Paid', 'Credit Card', NULL, '2022-06-26 16:54:40', '2022-06-26 16:54:40'),
(72, '2022-06-26', 'SL-00072', 76, 'Teresca Bowman', 0, 0, 0, 0, 0, 10000, 10000, 0, 'Completed', 'Paid', 'Credit Card', NULL, '2022-06-26 16:58:05', '2022-06-26 16:58:05'),
(73, '2022-06-26', 'SL-00073', 77, 'Camillo Musungina', 0, 0, 0, 0, 0, 8000, 8000, 0, 'Completed', 'Paid', 'Credit Card', NULL, '2022-06-26 16:59:36', '2022-06-26 16:59:36'),
(74, '2022-06-26', 'SL-00074', 78, 'Grace Mutero', 0, 0, 0, 0, 0, 12000, 12000, 0, 'Completed', 'Paid', 'Credit Card', NULL, '2022-06-26 17:01:38', '2022-06-26 17:01:38'),
(75, '2022-06-26', 'SL-00075', 79, 'Linda Ndlovu', 0, 0, 0, 0, 0, 10000, 10000, 0, 'Completed', 'Paid', 'Credit Card', NULL, '2022-06-26 17:03:05', '2022-06-26 17:03:05'),
(76, '2022-06-26', 'SL-00076', 80, 'Sinako Mayekiso', 0, 0, 0, 0, 0, 20000, 20000, 0, 'Completed', 'Paid', 'Credit Card', NULL, '2022-06-26 17:05:36', '2022-06-26 17:05:36'),
(77, '2022-06-26', 'SL-00077', 81, 'Robert Manyenganava', 0, 0, 0, 0, 0, 100000, 100000, 0, 'Pending', 'Paid', 'Cheque', 'To Pay (Receivable)', '2022-06-26 17:09:55', '2022-06-26 17:10:20'),
(78, '2022-06-26', 'SL-00078', 82, 'Ntosh Bengu', 0, 0, 0, 0, 0, 10000, 10000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-26 17:12:07', '2022-06-26 17:12:07'),
(79, '2022-06-26', 'SL-00079', 83, 'Caroline Steemkamp', 0, 0, 0, 0, 0, 20000, 20000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-26 17:13:57', '2022-06-26 17:13:57'),
(80, '2022-06-26', 'SL-00080', 84, 'Patricia Foni', 0, 0, 0, 0, 0, 10000, 10000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-26 17:15:13', '2022-06-26 17:15:13'),
(81, '2022-06-26', 'SL-00081', 85, 'Festus', 0, 0, 0, 0, 0, 10000, 10000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-26 17:16:07', '2022-06-26 17:16:07'),
(82, '2022-06-26', 'SL-00082', 86, 'Nocawe', 0, 0, 0, 0, 0, 10000, 10000, 0, 'Completed', 'Paid', 'Cash', NULL, '2022-06-26 17:17:08', '2022-06-26 17:17:08'),
(83, '2022-06-26', 'SL-00083', 59, 'Pamela Human', 0, 0, 0, 0, 0, 200000, 200000, 0, 'Completed', 'Paid', 'Credit Card', NULL, '2022-06-26 18:01:45', '2022-06-26 18:01:45');

-- --------------------------------------------------------

--
-- Table structure for table `sale_details`
--

DROP TABLE IF EXISTS `sale_details`;
CREATE TABLE IF NOT EXISTS `sale_details` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sale_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `product_code` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `product_discount_amount` int(11) NOT NULL,
  `product_discount_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'fixed',
  `product_tax_amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_details_sale_id_foreign` (`sale_id`),
  KEY `sale_details_product_id_foreign` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sale_details`
--

INSERT INTO `sale_details` (`id`, `sale_id`, `product_id`, `product_name`, `product_code`, `quantity`, `price`, `unit_price`, `sub_total`, `product_discount_amount`, `product_discount_type`, `product_tax_amount`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Rhapsody of Realities, June 2022', 'ROR062022', 1, 2000, 2000, 2000, 0, 'fixed', 0, '2022-06-15 20:42:46', '2022-06-15 20:42:46'),
(2, 2, 1, 'Rhapsody of Realities, June 2022', 'ROR062022', 3, 2000, 2000, 6000, 0, 'fixed', 0, '2022-06-15 22:32:36', '2022-06-15 22:32:36'),
(6, 3, 5, 'Rhapsody of Realities Teevo, June 2022', 'Teevo062022', 22, 2000, 2000, 44000, 0, 'fixed', 0, '2022-06-15 23:08:50', '2022-06-15 23:08:50'),
(5, 3, 1, 'Rhapsody of Realities, June 2022', 'ROR062022', 168, 2000, 2000, 336000, 0, 'fixed', 0, '2022-06-15 23:08:50', '2022-06-15 23:08:50'),
(7, 4, 1, 'Rhapsody of Realities, June 2022', 'ROR062022', 10, 2000, 2000, 20000, 0, 'fixed', 0, '2022-06-15 23:10:57', '2022-06-15 23:10:57'),
(8, 5, 1, 'Rhapsody of Realities, June 2022', 'ROR062022', 2, 2000, 2000, 4000, 0, 'fixed', 0, '2022-06-15 23:21:25', '2022-06-15 23:21:25'),
(9, 6, 1, 'Rhapsody of Realities, June 2022', 'ROR062022', 1, 2000, 2000, 2000, 0, 'fixed', 0, '2022-06-15 23:22:13', '2022-06-15 23:22:13'),
(10, 7, 1, 'Rhapsody of Realities, June 2022', 'ROR062022', 10, 2000, 2000, 20000, 0, 'fixed', 0, '2022-06-15 23:22:57', '2022-06-15 23:22:57'),
(11, 8, 1, 'Rhapsody of Realities, June 2022', 'ROR062022', 160, 2000, 2000, 320000, 0, 'fixed', 0, '2022-06-15 23:24:08', '2022-06-15 23:24:08'),
(12, 9, 5, 'Rhapsody of Realities Teevo, June 2022', 'Teevo062022', 12, 2000, 2000, 24000, 0, 'fixed', 0, '2022-06-15 23:25:08', '2022-06-15 23:25:08'),
(13, 10, 5, 'Rhapsody of Realities Teevo, June 2022', 'Teevo062022', 10, 2000, 2000, 20000, 0, 'fixed', 0, '2022-06-15 23:35:54', '2022-06-15 23:35:54'),
(14, 11, 1, 'Rhapsody of Realities, June 2022', 'ROR062022', 2, 2000, 2000, 4000, 0, 'fixed', 0, '2022-06-15 23:41:08', '2022-06-15 23:41:08'),
(15, 11, 9, 'Espees 50', 'PCDLESPZ50', 1, 15900, 15900, 15900, 0, 'fixed', 0, '2022-06-15 23:41:08', '2022-06-15 23:41:08'),
(17, 12, 11, 'Rhapsody Of Realities Bibles', 'RORBBL', 5, 25000, 25000, 125000, 0, 'fixed', 0, '2022-06-15 23:44:14', '2022-06-15 23:44:14'),
(18, 13, 1, 'Rhapsody of Realities, June 2022', 'ROR062022', 100, 2000, 2000, 200000, 0, 'fixed', 0, '2022-06-15 23:44:52', '2022-06-15 23:44:52'),
(19, 14, 1, 'Rhapsody of Realities, June 2022', 'ROR062022', 10, 2000, 2000, 20000, 0, 'fixed', 0, '2022-06-19 13:38:52', '2022-06-19 13:38:52'),
(20, 15, 1, 'Rhapsody of Realities, June 2022', 'ROR062022', 2, 2000, 2000, 4000, 0, 'fixed', 0, '2022-06-19 13:41:43', '2022-06-19 13:41:43'),
(21, 16, 1, 'Rhapsody of Realities, June 2022', 'ROR062022', 10, 2000, 2000, 20000, 0, 'fixed', 0, '2022-06-19 13:47:13', '2022-06-19 13:47:13'),
(22, 17, 1, 'Rhapsody of Realities, June 2022', 'ROR062022', 4, 2000, 2000, 8000, 0, 'fixed', 0, '2022-06-19 13:52:35', '2022-06-19 13:52:35'),
(23, 18, 1, 'Rhapsody of Realities, June 2022', 'ROR062022', 16, 2000, 2000, 32000, 0, 'fixed', 0, '2022-06-19 14:02:58', '2022-06-19 14:02:58'),
(24, 19, 1, 'Rhapsody of Realities, June 2022', 'ROR062022', 5, 2000, 2000, 10000, 0, 'fixed', 0, '2022-06-19 14:19:35', '2022-06-19 14:19:35'),
(25, 19, 12, 'How to Make Your Faith Work', 'H2MYFW2022', 2, 9000, 9000, 18000, 0, 'fixed', 0, '2022-06-19 14:19:35', '2022-06-19 14:19:35'),
(26, 20, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 10, 2000, 2000, 20000, 0, 'fixed', 0, '2022-06-23 01:57:38', '2022-06-23 01:57:38'),
(27, 21, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 1, 2000, 2000, 2000, 0, 'fixed', 0, '2022-06-23 01:59:09', '2022-06-23 01:59:09'),
(28, 22, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 1, 2000, 2000, 2000, 0, 'fixed', 0, '2022-06-23 02:01:23', '2022-06-23 02:01:23'),
(29, 22, 12, 'How to Make Your Faith Work', 'H2MYFW2022', 1, 9000, 9000, 9000, 0, 'fixed', 0, '2022-06-23 02:01:23', '2022-06-23 02:01:23'),
(30, 23, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 5, 2000, 2000, 10000, 0, 'fixed', 0, '2022-06-23 02:02:03', '2022-06-23 02:02:03'),
(31, 24, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 8, 2000, 2000, 16000, 0, 'fixed', 0, '2022-06-23 02:19:34', '2022-06-23 02:19:34'),
(32, 25, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 2, 2000, 2000, 4000, 0, 'fixed', 0, '2022-06-23 02:20:13', '2022-06-23 02:20:13'),
(33, 26, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 1, 2000, 2000, 2000, 0, 'fixed', 0, '2022-06-23 02:23:53', '2022-06-23 02:23:53'),
(34, 27, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 1, 2000, 2000, 2000, 0, 'fixed', 0, '2022-06-23 02:25:30', '2022-06-23 02:25:30'),
(35, 28, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 3, 2000, 2000, 6000, 0, 'fixed', 0, '2022-06-23 02:28:50', '2022-06-23 02:28:50'),
(36, 29, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 8, 2000, 2000, 16000, 0, 'fixed', 0, '2022-06-23 02:39:56', '2022-06-23 02:39:56'),
(37, 30, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 2, 2000, 2000, 4000, 0, 'fixed', 0, '2022-06-23 02:40:28', '2022-06-23 02:40:28'),
(38, 30, 14, 'Recreating your World', 'RYW001', 1, 6000, 6000, 6000, 0, 'fixed', 0, '2022-06-23 02:40:28', '2022-06-23 02:40:28'),
(39, 31, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 500, 2000, 2000, 1000000, 0, 'fixed', 0, '2022-06-23 02:41:15', '2022-06-23 02:41:15'),
(40, 32, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 500, 2000, 2000, 1000000, 0, 'fixed', 0, '2022-06-23 02:44:32', '2022-06-23 02:44:32'),
(41, 33, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 10, 2000, 2000, 20000, 0, 'fixed', 0, '2022-06-23 02:45:05', '2022-06-23 02:45:05'),
(42, 34, 1, 'Rhapsody of Realities, June 2022', 'ROR062022', 1, 2000, 2000, 2000, 0, 'fixed', 0, '2022-06-26 11:47:20', '2022-06-26 11:47:20'),
(43, 35, 1, 'Rhapsody of Realities, June 2022', 'ROR062022', 1, 2000, 2000, 2000, 0, 'fixed', 0, '2022-06-26 11:51:34', '2022-06-26 11:51:34'),
(44, 36, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 50, 2000, 2000, 100000, 0, 'fixed', 0, '2022-06-26 11:55:00', '2022-06-26 11:55:00'),
(45, 37, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 1, 2000, 2000, 2000, 0, 'fixed', 0, '2022-06-26 11:56:31', '2022-06-26 11:56:31'),
(46, 38, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 1, 2000, 2000, 2000, 0, 'fixed', 0, '2022-06-26 11:58:11', '2022-06-26 11:58:11'),
(47, 39, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 1, 2000, 2000, 2000, 0, 'fixed', 0, '2022-06-26 12:00:11', '2022-06-26 12:00:11'),
(48, 40, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 1, 2000, 2000, 2000, 0, 'fixed', 0, '2022-06-26 12:01:36', '2022-06-26 12:01:36'),
(49, 41, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 10, 2000, 2000, 20000, 0, 'fixed', 0, '2022-06-26 12:06:14', '2022-06-26 12:06:14'),
(50, 41, 15, 'Rhapsody of Realities Teevo, July 2022', 'Teevo072022', 5, 2000, 2000, 10000, 0, 'fixed', 0, '2022-06-26 12:06:14', '2022-06-26 12:06:14'),
(51, 42, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 1, 2000, 2000, 2000, 0, 'fixed', 0, '2022-06-26 12:07:30', '2022-06-26 12:07:30'),
(52, 43, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 5, 2000, 2000, 10000, 0, 'fixed', 0, '2022-06-26 12:08:40', '2022-06-26 12:08:40'),
(53, 44, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 10, 2000, 2000, 20000, 0, 'fixed', 0, '2022-06-26 12:10:31', '2022-06-26 12:10:31'),
(54, 45, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 1, 2000, 2000, 2000, 0, 'fixed', 0, '2022-06-26 13:49:06', '2022-06-26 13:49:06'),
(55, 46, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 2, 2000, 2000, 4000, 0, 'fixed', 0, '2022-06-26 13:52:18', '2022-06-26 13:52:18'),
(56, 47, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 3, 2000, 2000, 6000, 0, 'fixed', 0, '2022-06-26 13:54:42', '2022-06-26 13:54:42'),
(57, 48, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 1, 2000, 2000, 2000, 0, 'fixed', 0, '2022-06-26 13:57:18', '2022-06-26 13:57:18'),
(58, 49, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 1, 2000, 2000, 2000, 0, 'fixed', 0, '2022-06-26 14:03:03', '2022-06-26 14:03:03'),
(59, 50, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 2, 2000, 2000, 4000, 0, 'fixed', 0, '2022-06-26 14:10:27', '2022-06-26 14:10:27'),
(60, 51, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 4, 2000, 2000, 8000, 0, 'fixed', 0, '2022-06-26 14:11:05', '2022-06-26 14:11:05'),
(61, 52, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 3, 2000, 2000, 6000, 0, 'fixed', 0, '2022-06-26 14:13:32', '2022-06-26 14:13:32'),
(65, 53, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 50, 2000, 2000, 100000, 0, 'fixed', 0, '2022-06-26 14:15:32', '2022-06-26 14:15:32'),
(64, 53, 15, 'Rhapsody of Realities Teevo, July 2022', 'Teevo072022', 100, 2000, 2000, 200000, 0, 'fixed', 0, '2022-06-26 14:15:32', '2022-06-26 14:15:32'),
(66, 54, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 1, 2000, 2000, 2000, 0, 'fixed', 0, '2022-06-26 14:20:27', '2022-06-26 14:20:27'),
(67, 54, 15, 'Rhapsody of Realities Teevo, July 2022', 'Teevo072022', 1, 2000, 2000, 2000, 0, 'fixed', 0, '2022-06-26 14:20:27', '2022-06-26 14:20:27'),
(68, 55, 16, 'The Seven Spirits of God', '7SOF', 1, 9000, 9000, 9000, 0, 'fixed', 0, '2022-06-26 14:33:36', '2022-06-26 14:33:36'),
(69, 55, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 1, 2000, 2000, 2000, 0, 'fixed', 0, '2022-06-26 14:33:36', '2022-06-26 14:33:36'),
(70, 57, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 2, 2000, 2000, 4000, 0, 'fixed', 0, '2022-06-26 14:37:27', '2022-06-26 14:37:27'),
(71, 58, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 10, 2000, 2000, 20000, 0, 'fixed', 0, '2022-06-26 14:40:09', '2022-06-26 14:40:09'),
(72, 59, 15, 'Rhapsody of Realities Teevo, July 2022', 'Teevo072022', 5, 2000, 2000, 10000, 0, 'fixed', 0, '2022-06-26 14:41:46', '2022-06-26 14:41:46'),
(73, 60, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 1, 2000, 2000, 2000, 0, 'fixed', 0, '2022-06-26 15:17:42', '2022-06-26 15:17:42'),
(74, 61, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 10, 2000, 2000, 20000, 0, 'fixed', 0, '2022-06-26 15:20:00', '2022-06-26 15:20:00'),
(75, 61, 15, 'Rhapsody of Realities Teevo, July 2022', 'Teevo072022', 2, 2000, 2000, 4000, 0, 'fixed', 0, '2022-06-26 15:20:00', '2022-06-26 15:20:00'),
(76, 62, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 15, 2000, 2000, 30000, 0, 'fixed', 0, '2022-06-26 15:26:53', '2022-06-26 15:26:53'),
(77, 63, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 11, 2000, 2000, 22000, 0, 'fixed', 0, '2022-06-26 15:27:52', '2022-06-26 15:27:52'),
(78, 64, 15, 'Rhapsody of Realities Teevo, July 2022', 'Teevo072022', 6, 2000, 2000, 12000, 0, 'fixed', 0, '2022-06-26 15:31:00', '2022-06-26 15:31:00'),
(79, 65, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 2, 2000, 2000, 4000, 0, 'fixed', 0, '2022-06-26 15:33:59', '2022-06-26 15:33:59'),
(80, 65, 15, 'Rhapsody of Realities Teevo, July 2022', 'Teevo072022', 10, 2000, 2000, 20000, 0, 'fixed', 0, '2022-06-26 15:33:59', '2022-06-26 15:33:59'),
(81, 66, 16, 'The Seven Spirits of God', '7SOF', 1, 9000, 9000, 9000, 0, 'fixed', 0, '2022-06-26 16:22:33', '2022-06-26 16:22:33'),
(82, 66, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 1, 2000, 2000, 2000, 0, 'fixed', 0, '2022-06-26 16:22:33', '2022-06-26 16:22:33'),
(83, 67, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 20, 2000, 2000, 40000, 0, 'fixed', 0, '2022-06-26 16:30:39', '2022-06-26 16:30:39'),
(84, 68, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 5, 2000, 2000, 10000, 0, 'fixed', 0, '2022-06-26 16:33:21', '2022-06-26 16:33:21'),
(85, 68, 12, 'How to Make Your Faith Work', 'H2MYFW2022', 1, 9000, 9000, 9000, 0, 'fixed', 0, '2022-06-26 16:33:21', '2022-06-26 16:33:21'),
(86, 69, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 10, 2000, 2000, 20000, 0, 'fixed', 0, '2022-06-26 16:34:44', '2022-06-26 16:34:44'),
(87, 69, 16, 'The Seven Spirits of God', '7SOF', 1, 9000, 9000, 9000, 0, 'fixed', 0, '2022-06-26 16:34:44', '2022-06-26 16:34:44'),
(88, 70, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 10, 2000, 2000, 20000, 0, 'fixed', 0, '2022-06-26 16:51:50', '2022-06-26 16:51:50'),
(89, 70, 15, 'Rhapsody of Realities Teevo, July 2022', 'Teevo072022', 5, 2000, 2000, 10000, 0, 'fixed', 0, '2022-06-26 16:51:50', '2022-06-26 16:51:50'),
(90, 71, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 5, 2000, 2000, 10000, 0, 'fixed', 0, '2022-06-26 16:54:40', '2022-06-26 16:54:40'),
(91, 71, 15, 'Rhapsody of Realities Teevo, July 2022', 'Teevo072022', 1, 2000, 2000, 2000, 0, 'fixed', 0, '2022-06-26 16:54:40', '2022-06-26 16:54:40'),
(92, 72, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 3, 2000, 2000, 6000, 0, 'fixed', 0, '2022-06-26 16:58:05', '2022-06-26 16:58:05'),
(93, 72, 15, 'Rhapsody of Realities Teevo, July 2022', 'Teevo072022', 2, 2000, 2000, 4000, 0, 'fixed', 0, '2022-06-26 16:58:05', '2022-06-26 16:58:05'),
(94, 73, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 4, 2000, 2000, 8000, 0, 'fixed', 0, '2022-06-26 16:59:36', '2022-06-26 16:59:36'),
(95, 74, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 6, 2000, 2000, 12000, 0, 'fixed', 0, '2022-06-26 17:01:38', '2022-06-26 17:01:38'),
(96, 75, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 5, 2000, 2000, 10000, 0, 'fixed', 0, '2022-06-26 17:03:05', '2022-06-26 17:03:05'),
(97, 76, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 10, 2000, 2000, 20000, 0, 'fixed', 0, '2022-06-26 17:05:36', '2022-06-26 17:05:36'),
(99, 77, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 50, 2000, 2000, 100000, 0, 'fixed', 0, '2022-06-26 17:10:20', '2022-06-26 17:10:20'),
(100, 78, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 5, 2000, 2000, 10000, 0, 'fixed', 0, '2022-06-26 17:12:07', '2022-06-26 17:12:07'),
(101, 79, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 10, 2000, 2000, 20000, 0, 'fixed', 0, '2022-06-26 17:13:57', '2022-06-26 17:13:57'),
(102, 80, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 5, 2000, 2000, 10000, 0, 'fixed', 0, '2022-06-26 17:15:13', '2022-06-26 17:15:13'),
(103, 81, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 5, 2000, 2000, 10000, 0, 'fixed', 0, '2022-06-26 17:16:07', '2022-06-26 17:16:07'),
(104, 82, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 5, 2000, 2000, 10000, 0, 'fixed', 0, '2022-06-26 17:17:08', '2022-06-26 17:17:08'),
(105, 83, 13, 'Rhapsody of Realities, July 2022', 'ROR072022', 100, 2000, 2000, 200000, 0, 'fixed', 0, '2022-06-26 18:01:45', '2022-06-26 18:01:45');

-- --------------------------------------------------------

--
-- Table structure for table `sale_payments`
--

DROP TABLE IF EXISTS `sale_payments`;
CREATE TABLE IF NOT EXISTS `sale_payments` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sale_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `payment_method` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_payments_sale_id_foreign` (`sale_id`)
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sale_payments`
--

INSERT INTO `sale_payments` (`id`, `sale_id`, `amount`, `date`, `reference`, `payment_method`, `note`, `created_at`, `updated_at`) VALUES
(1, 1, 2000, '2022-06-15', 'INV/SL-00001', 'Cash', NULL, '2022-06-15 20:42:46', '2022-06-15 20:42:46'),
(2, 2, 6000, '2022-06-16', 'INV/SL-00002', 'Cash', NULL, '2022-06-15 22:32:36', '2022-06-15 22:32:36'),
(3, 3, 380000, '2022-06-16', 'INV/SL-00003', 'Other', NULL, '2022-06-15 23:08:03', '2022-06-15 23:08:03'),
(4, 4, 20000, '2022-06-16', 'INV/SL-00004', 'Credit Card', NULL, '2022-06-15 23:10:57', '2022-06-15 23:10:57'),
(5, 5, 4000, '2022-06-16', 'INV/SL-00005', 'Cash', NULL, '2022-06-15 23:21:25', '2022-06-15 23:21:25'),
(6, 6, 2000, '2022-06-16', 'INV/SL-00006', 'Cash', NULL, '2022-06-15 23:22:13', '2022-06-15 23:22:13'),
(7, 7, 20000, '2022-06-16', 'INV/SL-00007', 'Bank Transfer', NULL, '2022-06-15 23:22:57', '2022-06-15 23:22:57'),
(8, 8, 320000, '2022-06-16', 'INV/SL-00008', 'Credit Card', NULL, '2022-06-15 23:24:08', '2022-06-15 23:24:08'),
(9, 9, 24000, '2022-06-16', 'INV/SL-00009', 'Credit Card', NULL, '2022-06-15 23:25:08', '2022-06-15 23:25:08'),
(10, 10, 20000, '2022-06-16', 'INV/SL-00010', 'Cash', NULL, '2022-06-15 23:35:54', '2022-06-15 23:35:54'),
(11, 11, 19900, '2022-06-16', 'INV/SL-00011', 'Cash', NULL, '2022-06-15 23:41:08', '2022-06-15 23:41:08'),
(12, 12, 125000, '2022-06-16', 'INV/SL-00012', 'Credit Card', NULL, '2022-06-15 23:43:52', '2022-06-15 23:43:52'),
(13, 13, 200000, '2022-06-16', 'INV/SL-00013', 'Cash', NULL, '2022-06-15 23:44:52', '2022-06-15 23:44:52'),
(14, 14, 20000, '2022-06-19', 'INV/SL-00014', 'Credit Card', NULL, '2022-06-19 13:38:52', '2022-06-19 13:38:52'),
(15, 15, 4000, '2022-06-19', 'INV/SL-00015', 'Cash', NULL, '2022-06-19 13:41:44', '2022-06-19 13:41:44'),
(16, 16, 20000, '2022-06-19', 'INV/SL-00016', 'Credit Card', NULL, '2022-06-19 13:47:13', '2022-06-19 13:47:13'),
(17, 17, 8000, '2022-06-19', 'INV/SL-00017', 'Cash', NULL, '2022-06-19 13:52:35', '2022-06-19 13:52:35'),
(18, 18, 32000, '2022-06-19', 'INV/SL-00018', 'Cash', NULL, '2022-06-19 14:02:58', '2022-06-19 14:02:58'),
(19, 19, 28000, '2022-06-19', 'INV/SL-00019', 'Credit Card', NULL, '2022-06-19 14:19:35', '2022-06-19 14:19:35'),
(20, 20, 20000, '2022-06-23', 'INV/SL-00020', 'Cash', NULL, '2022-06-23 01:57:38', '2022-06-23 01:57:38'),
(21, 21, 2000, '2022-06-23', 'INV/SL-00021', 'Cash', NULL, '2022-06-23 01:59:09', '2022-06-23 01:59:09'),
(22, 22, 11000, '2022-06-23', 'INV/SL-00022', 'Cash', NULL, '2022-06-23 02:01:23', '2022-06-23 02:01:23'),
(23, 23, 10000, '2022-06-23', 'INV/SL-00023', 'Cash', NULL, '2022-06-23 02:02:03', '2022-06-23 02:02:03'),
(24, 24, 16000, '2022-06-23', 'INV/SL-00024', 'Cash', NULL, '2022-06-23 02:19:34', '2022-06-23 02:19:34'),
(25, 25, 4000, '2022-06-23', 'INV/SL-00025', 'Cash', NULL, '2022-06-23 02:20:13', '2022-06-23 02:20:13'),
(26, 26, 2000, '2022-06-23', 'INV/SL-00026', 'Cash', NULL, '2022-06-23 02:23:53', '2022-06-23 02:23:53'),
(27, 27, 2000, '2022-06-23', 'INV/SL-00027', 'Cash', NULL, '2022-06-23 02:25:30', '2022-06-23 02:25:30'),
(28, 28, 6000, '2022-06-23', 'INV/SL-00028', 'Credit Card', NULL, '2022-06-23 02:28:50', '2022-06-23 02:28:50'),
(29, 29, 16000, '2022-06-23', 'INV/SL-00029', 'Bank Transfer', NULL, '2022-06-23 02:39:56', '2022-06-23 02:39:56'),
(30, 30, 10000, '2022-06-23', 'INV/SL-00030', 'Credit Card', NULL, '2022-06-23 02:40:28', '2022-06-23 02:40:28'),
(31, 31, 1000000, '2022-06-23', 'INV/SL-00031', 'Cash', NULL, '2022-06-23 02:41:15', '2022-06-23 02:41:15'),
(32, 32, 1000000, '2022-06-23', 'INV/SL-00031', 'Bank Transfer', NULL, '2022-06-23 02:44:32', '2022-06-23 02:44:32'),
(33, 33, 20000, '2022-06-23', 'INV/SL-00033', 'Cash', NULL, '2022-06-23 02:45:05', '2022-06-23 02:45:05'),
(34, 34, 2000, '2022-06-26', 'INV/SL-00034', 'Cash', NULL, '2022-06-26 11:47:20', '2022-06-26 11:47:20'),
(35, 35, 2000, '2022-06-26', 'INV/SL-00035', 'Cash', NULL, '2022-06-26 11:51:34', '2022-06-26 11:51:34'),
(36, 36, 100000, '2022-06-26', 'INV/SL-00036', 'Credit Card', NULL, '2022-06-26 11:55:00', '2022-06-26 11:55:00'),
(37, 37, 2000, '2022-06-26', 'INV/SL-00037', 'Cash', NULL, '2022-06-26 11:56:31', '2022-06-26 11:56:31'),
(38, 38, 2000, '2022-06-26', 'INV/SL-00038', 'Cash', NULL, '2022-06-26 11:58:11', '2022-06-26 11:58:11'),
(39, 39, 2000, '2022-06-26', 'INV/SL-00039', 'Cash', NULL, '2022-06-26 12:00:11', '2022-06-26 12:00:11'),
(40, 40, 2000, '2022-06-26', 'INV/SL-00040', 'Cash', NULL, '2022-06-26 12:01:36', '2022-06-26 12:01:36'),
(41, 41, 30000, '2022-06-26', 'INV/SL-00041', 'Cash', NULL, '2022-06-26 12:06:14', '2022-06-26 12:06:14'),
(42, 42, 2000, '2022-06-26', 'INV/SL-00042', 'Cash', NULL, '2022-06-26 12:07:30', '2022-06-26 12:07:30'),
(43, 43, 10000, '2022-06-26', 'INV/SL-00043', 'Cash', NULL, '2022-06-26 12:08:40', '2022-06-26 12:08:40'),
(44, 44, 20000, '2022-06-26', 'INV/SL-00044', 'Credit Card', NULL, '2022-06-26 12:10:31', '2022-06-26 12:10:31'),
(45, 45, 2000, '2022-06-26', 'INV/SL-00045', 'Cash', NULL, '2022-06-26 13:49:06', '2022-06-26 13:49:06'),
(46, 46, 4000, '2022-06-26', 'INV/SL-00046', 'Cash', NULL, '2022-06-26 13:52:18', '2022-06-26 13:52:18'),
(47, 47, 6000, '2022-06-26', 'INV/SL-00047', 'Cash', NULL, '2022-06-26 13:54:42', '2022-06-26 13:54:42'),
(48, 48, 2000, '2022-06-26', 'INV/SL-00048', 'Cash', NULL, '2022-06-26 13:57:18', '2022-06-26 13:57:18'),
(49, 49, 2000, '2022-06-26', 'INV/SL-00049', 'Cash', NULL, '2022-06-26 14:03:03', '2022-06-26 14:03:03'),
(50, 50, 4000, '2022-06-26', 'INV/SL-00050', 'Cash', NULL, '2022-06-26 14:10:27', '2022-06-26 14:10:27'),
(51, 51, 8000, '2022-06-26', 'INV/SL-00051', 'Cash', NULL, '2022-06-26 14:11:05', '2022-06-26 14:11:05'),
(52, 52, 6000, '2022-06-26', 'INV/SL-00052', 'Cash', NULL, '2022-06-26 14:13:32', '2022-06-26 14:13:32'),
(53, 53, 300000, '2022-06-26', 'INV/SL-00053', 'Cheque', NULL, '2022-06-26 14:15:04', '2022-06-26 14:15:04'),
(54, 54, 4000, '2022-06-26', 'INV/SL-00054', 'Cash', NULL, '2022-06-26 14:20:27', '2022-06-26 14:20:27'),
(55, 55, 11000, '2022-06-26', 'INV/SL-00055', 'Cash', NULL, '2022-06-26 14:33:36', '2022-06-26 14:33:36'),
(56, 56, 11000, '2022-06-26', 'INV/SL-00056', 'Cash', NULL, '2022-06-26 14:34:48', '2022-06-26 14:34:48'),
(57, 57, 4000, '2022-06-26', 'INV/SL-00056', 'Cash', NULL, '2022-06-26 14:37:27', '2022-06-26 14:37:27'),
(58, 58, 20000, '2022-06-26', 'INV/SL-00058', 'Cash', NULL, '2022-06-26 14:40:09', '2022-06-26 14:40:09'),
(59, 59, 10000, '2022-06-26', 'INV/SL-00059', 'Cash', NULL, '2022-06-26 14:41:46', '2022-06-26 14:41:46'),
(60, 60, 2000, '2022-06-26', 'INV/SL-00060', 'Cash', NULL, '2022-06-26 15:17:42', '2022-06-26 15:17:42'),
(61, 61, 24000, '2022-06-26', 'INV/SL-00061', 'Cash', NULL, '2022-06-26 15:20:00', '2022-06-26 15:20:00'),
(62, 62, 30000, '2022-06-26', 'INV/SL-00062', 'Cash', NULL, '2022-06-26 15:26:53', '2022-06-26 15:26:53'),
(63, 63, 22000, '2022-06-26', 'INV/SL-00063', 'Cash', NULL, '2022-06-26 15:27:52', '2022-06-26 15:27:52'),
(64, 64, 12000, '2022-06-26', 'INV/SL-00064', 'Bank Transfer', NULL, '2022-06-26 15:31:00', '2022-06-26 15:31:00'),
(65, 65, 24000, '2022-06-26', 'INV/SL-00065', 'Cash', NULL, '2022-06-26 15:33:59', '2022-06-26 15:33:59'),
(66, 66, 11000, '2022-06-26', 'INV/SL-00066', 'Credit Card', NULL, '2022-06-26 16:22:33', '2022-06-26 16:22:33'),
(67, 67, 40000, '2022-06-26', 'INV/SL-00067', 'Credit Card', NULL, '2022-06-26 16:30:39', '2022-06-26 16:30:39'),
(68, 68, 19000, '2022-06-26', 'INV/SL-00068', 'Credit Card', NULL, '2022-06-26 16:33:21', '2022-06-26 16:33:21'),
(69, 69, 29000, '2022-06-26', 'INV/SL-00069', 'Credit Card', NULL, '2022-06-26 16:34:44', '2022-06-26 16:34:44'),
(70, 70, 30000, '2022-06-26', 'INV/SL-00070', 'Credit Card', NULL, '2022-06-26 16:51:50', '2022-06-26 16:51:50'),
(71, 71, 12000, '2022-06-26', 'INV/SL-00071', 'Credit Card', NULL, '2022-06-26 16:54:40', '2022-06-26 16:54:40'),
(72, 72, 10000, '2022-06-26', 'INV/SL-00072', 'Credit Card', NULL, '2022-06-26 16:58:05', '2022-06-26 16:58:05'),
(73, 73, 8000, '2022-06-26', 'INV/SL-00073', 'Credit Card', NULL, '2022-06-26 16:59:36', '2022-06-26 16:59:36'),
(74, 74, 12000, '2022-06-26', 'INV/SL-00074', 'Credit Card', NULL, '2022-06-26 17:01:38', '2022-06-26 17:01:38'),
(75, 75, 10000, '2022-06-26', 'INV/SL-00075', 'Credit Card', NULL, '2022-06-26 17:03:05', '2022-06-26 17:03:05'),
(76, 76, 20000, '2022-06-26', 'INV/SL-00076', 'Credit Card', NULL, '2022-06-26 17:05:36', '2022-06-26 17:05:36'),
(77, 77, 100000, '2022-06-26', 'INV/SL-00077', 'Cheque', NULL, '2022-06-26 17:09:55', '2022-06-26 17:09:55'),
(78, 78, 10000, '2022-06-26', 'INV/SL-00078', 'Cash', NULL, '2022-06-26 17:12:07', '2022-06-26 17:12:07'),
(79, 79, 20000, '2022-06-26', 'INV/SL-00079', 'Cash', NULL, '2022-06-26 17:13:57', '2022-06-26 17:13:57'),
(80, 80, 10000, '2022-06-26', 'INV/SL-00080', 'Cash', NULL, '2022-06-26 17:15:13', '2022-06-26 17:15:13'),
(81, 81, 10000, '2022-06-26', 'INV/SL-00081', 'Cash', NULL, '2022-06-26 17:16:07', '2022-06-26 17:16:07'),
(82, 82, 10000, '2022-06-26', 'INV/SL-00082', 'Cash', NULL, '2022-06-26 17:17:08', '2022-06-26 17:17:08'),
(83, 83, 200000, '2022-06-26', 'INV/SL-00083', 'Credit Card', NULL, '2022-06-26 18:01:45', '2022-06-26 18:01:45');

-- --------------------------------------------------------

--
-- Table structure for table `sale_returns`
--

DROP TABLE IF EXISTS `sale_returns`;
CREATE TABLE IF NOT EXISTS `sale_returns` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `reference` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `tax_percentage` int(11) NOT NULL DEFAULT '0',
  `tax_amount` int(11) NOT NULL DEFAULT '0',
  `discount_percentage` int(11) NOT NULL DEFAULT '0',
  `discount_amount` int(11) NOT NULL DEFAULT '0',
  `shipping_amount` int(11) NOT NULL DEFAULT '0',
  `total_amount` int(11) NOT NULL,
  `paid_amount` int(11) NOT NULL,
  `due_amount` int(11) NOT NULL,
  `status` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `payment_status` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `payment_method` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_returns_customer_id_foreign` (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sale_return_details`
--

DROP TABLE IF EXISTS `sale_return_details`;
CREATE TABLE IF NOT EXISTS `sale_return_details` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sale_return_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `product_code` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `product_discount_amount` int(11) NOT NULL,
  `product_discount_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'fixed',
  `product_tax_amount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_return_details_sale_return_id_foreign` (`sale_return_id`),
  KEY `sale_return_details_product_id_foreign` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sale_return_payments`
--

DROP TABLE IF EXISTS `sale_return_payments`;
CREATE TABLE IF NOT EXISTS `sale_return_payments` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sale_return_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `payment_method` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_return_payments_sale_return_id_foreign` (`sale_return_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `company_email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `company_phone` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `site_logo` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_currency_id` int(11) NOT NULL,
  `default_currency_position` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `notification_email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `footer_text` text COLLATE utf8_unicode_ci NOT NULL,
  `company_address` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `company_name`, `company_email`, `company_phone`, `site_logo`, `default_currency_id`, `default_currency_position`, `notification_email`, `footer_text`, `company_address`, `created_at`, `updated_at`) VALUES
(1, 'CECT Books POS', 'info@cect.co.za', '0810292775', NULL, 2, 'prefix', 'info@venanciogomani.net', 'Christ Embassy Waterfront POS © 2022 || Developed by <strong><a target=\"_blank\" href=\"https://venanciogomani.net\">Venancio Gomani</a></strong>', '3 Dock Rd, Waterfront, Cape Town', '2022-06-12 14:51:59', '2022-06-12 18:46:21');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE IF NOT EXISTS `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_phone` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

DROP TABLE IF EXISTS `uploads`;
CREATE TABLE IF NOT EXISTS `uploads` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `folder` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `uploads`
--

INSERT INTO `uploads` (`id`, `folder`, `filename`, `created_at`, `updated_at`) VALUES
(1, '62a60685b1768-1655047813', '1655047813.jpg', '2022-06-12 19:30:15', '2022-06-12 19:30:15'),
(2, '62a606c9efa90-1655047881', '1655047881.jpg', '2022-06-12 19:31:22', '2022-06-12 19:31:22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `is_active`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin@test.com', NULL, '$2y$10$WdsT/FY65UY3xelG5LnDm.qwBZS2oc4ZtShQP2auTIPZhqma7zO.C', 1, NULL, '2022-06-12 14:51:59', '2022-06-12 14:51:59'),
(2, 'Venancio Gomani', 'info@venanciogomani.net', NULL, '$2y$10$lSwZy6jw/2j2t/dhRMkyB.wNUyVPhobHYBSWJDHta1sN2E6ISB2mG', 1, NULL, '2022-06-12 18:47:49', '2022-06-12 18:47:49'),
(3, 'Jolando Njati', 'jolanjati@gmail.com', NULL, '$2y$10$J/jMp4RaGPA6Ptobm5vUt.x99cIntIngh5Mr1W6c124HT2PpuGwBG', 1, NULL, '2022-06-12 19:30:20', '2022-06-12 19:30:20'),
(4, 'Sister Alice', 'sis.alice@cect.co.za', NULL, '$2y$10$tBrmXHqFEwrKjFMArnHG8erICVBmbiH6dHSRW4XwLKDaTdEtF0iaW', 1, NULL, '2022-06-12 19:32:00', '2022-06-12 19:32:00');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
