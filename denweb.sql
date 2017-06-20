-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2017 at 06:39 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `denweb`
--

-- --------------------------------------------------------

--
-- Table structure for table `activations`
--

CREATE TABLE `activations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_15_105324_create_roles_table', 1),
(4, '2016_01_15_114412_create_role_user_table', 1),
(5, '2016_01_26_115212_create_permissions_table', 1),
(6, '2016_01_26_115523_create_permission_role_table', 1),
(7, '2016_02_09_132439_create_permission_user_table', 1),
(8, '2017_03_09_082449_create_social_logins_table', 1),
(9, '2017_03_09_082526_create_activations_table', 1),
(10, '2017_03_20_213554_create_themes_table', 1),
(11, '2017_03_21_042918_create_profiles_table', 1),
(12, '2017_04_24_121953_authmaster', 1),
(13, '2017_04_28_072350_create_retailers_table', 2),
(14, '2017_04_28_163420_create_payment_request_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`id`, `email`, `token`, `created_at`) VALUES
(1, 'pangdeny@gmail.com', '$2y$10$bMf4.npMme0N2hhmriYx9OyvC5AkVeGhDrGMc1J5Fhtyz1aj7tRte', '2017-04-25 07:01:53');

-- --------------------------------------------------------

--
-- Table structure for table `paymentrequest`
--

CREATE TABLE `paymentrequest` (
  `id` int(10) UNSIGNED NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requestdate` date NOT NULL,
  `payee` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `slug`, `description`, `model`, `created_at`, `updated_at`) VALUES
(1, 'Can View Users', 'view.users', 'Can view users', 'Permission', '2017-04-25 07:42:22', '2017-04-25 07:42:22'),
(2, 'Can Create Users', 'create.users', 'Can create new users', 'Permission', '2017-04-25 07:42:22', '2017-04-25 07:42:22'),
(3, 'Can Edit Users', 'edit.users', 'Can edit users', 'Permission', '2017-04-25 07:42:22', '2017-04-25 07:42:22'),
(4, 'Can Delete Users', 'delete.users', 'Can delete users', 'Permission', '2017-04-25 07:42:22', '2017-04-25 07:42:22');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2017-04-25 07:42:22', '2017-04-25 07:42:22'),
(2, 2, 1, '2017-04-25 07:42:22', '2017-04-25 07:42:22'),
(3, 3, 1, '2017-04-25 07:42:22', '2017-04-25 07:42:22'),
(4, 4, 1, '2017-04-25 07:42:22', '2017-04-25 07:42:22');

-- --------------------------------------------------------

--
-- Table structure for table `permission_user`
--

CREATE TABLE `permission_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `theme_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `twitter_username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `github_username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `theme_id`, `location`, `bio`, `twitter_username`, `github_username`, `avatar`, `avatar_status`, `created_at`, `updated_at`) VALUES
(1, 4, 1, NULL, NULL, NULL, NULL, NULL, 0, '2017-04-25 07:42:23', '2017-04-25 07:42:23'),
(2, 5, 1, NULL, NULL, NULL, NULL, NULL, 0, '2017-04-25 07:42:23', '2017-04-25 07:42:23'),
(3, 6, 1, NULL, 'Dennis is a Great Person whoom  we beleive\r\nHe has below qualities\r\nShamming', 'twitter.dennis', 'dennnis/cred', NULL, 0, NULL, '2017-04-25 08:26:00'),
(4, 7, 1, NULL, NULL, NULL, NULL, NULL, 0, '2017-04-25 08:41:41', '2017-04-25 08:41:41'),
(5, 8, 1, NULL, NULL, NULL, NULL, NULL, 0, '2017-04-25 23:50:17', '2017-04-25 23:50:17'),
(6, 9, 1, NULL, NULL, NULL, NULL, NULL, 0, '2017-04-26 03:05:59', '2017-04-26 03:05:59');

-- --------------------------------------------------------

--
-- Table structure for table `retailers`
--

CREATE TABLE `retailers` (
  `id` int(10) UNSIGNED NOT NULL,
  `retailerid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `retailshop` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ward` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `village` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `startdate` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `retailers`
--

INSERT INTO `retailers` (`id`, `retailerid`, `status`, `retailshop`, `phone`, `region`, `district`, `ward`, `village`, `latitude`, `longitude`, `startdate`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'R42', 'Active', 'Ustaadh Table', '111', 'Manyara', 'Babati Town', 'Babati', 'Babati Mjini', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'R43', 'Active', 'Chopa Booth', '112', 'Manyara', 'Babati Town', 'Babati', 'Babati Mjini', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'R44', 'Active', 'Mama Bryan Booth', '113', 'Manyara', 'Babati Town', 'Babati', 'Babati Mjini', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'R81', 'Active', 'Jambo Jipya Shop', '114', 'Manyara', 'Babati Town', 'Babati', 'Babati Mjini', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'R82', 'Active', 'Mwajuma Booth', '115', 'Manyara', 'Babati Town', 'Babati', 'Babati Mjini', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'R40', 'Active', 'Mama Noah Booth', '116', 'Manyara', 'Babati Town', 'Babati', 'Babati Mjini', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'R236', 'Active', 'Mzee Mohamed Shop', '117', 'Manyara', 'Babati Town', 'Babati', 'Mrara', '-4.20969', '35.75909', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'R234', 'Active', 'Mama Grace Shop', '118', 'Manyara', 'Babati Town', 'Babati', 'Mrara', '-4.20968', '35.75935', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'R47', 'Active', 'Yura Shop', '119', 'Manyara', 'Babati Town', 'Babati', 'Mrara', '4.20845', '35.77031', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'R3537', 'Active', 'Mama Happy Shop', '120', 'Manyara', 'Babati Town', 'Babati', 'Mrara', '4.20785', '35.76911', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'R237', 'Active', 'Mchagga Shop Mrara', '121', 'Manyara', 'Babati Town', 'Babati', 'Mrara', '-4.20969', '35.75909', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'R3348', 'Active', 'MEDA shop', '122', 'Manyara', 'Babati Town', 'Babati', 'Waan\'gwaray', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'R52', 'Active', 'Mapambano Shop', '123', 'Manyara', 'Babati Town', 'Babati', 'Majengo', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'R680', 'Active', 'Mama Getu shop', '124', 'Manyara', 'Babati Town', 'Babati', 'Majengo', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'R35', 'Active', 'Nade Shop', '125', 'Manyara', 'Babati Town', 'Babati', 'Majengo', '4.20588', '35.74901', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'R37', 'Active', 'Rehema Shop', '126', 'Manyara', 'Babati Town', 'Babati', 'Majengo', '4.20623', '35.74902', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'R46', 'Active', 'Mosi Shop', '127', 'Manyara', 'Babati Town', 'Babati', 'Mrara', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'R48', 'Active', 'Mama Yasin Shop', '128', 'Manyara', 'Babati Town', 'Babati', 'Mrara', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'R53', 'Active', 'Mohamed Shop', '129', 'Manyara', 'Babati Town', 'Babati', 'Majengo', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'R36', 'Active', 'Mama Juma Booth', '130', 'Manyara', 'Babati Town', 'Babati', 'Majengo', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 'R38', 'Active', 'Kindoroko Shop', '131', 'Manyara', 'Babati Town', 'Babati', 'Majengo', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 'R39', 'Active', 'Hassan Shop', '132', 'Manyara', 'Babati Town', 'Babati', 'Majengo', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 'R50', 'Active', 'Ustaadh Sadiki Shop', '133', 'Manyara', 'Babati Town', 'Babati', 'Majengo', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 'R51', 'Active', 'Baba Emma Shop', '134', 'Manyara', 'Babati Town', 'Babati', 'Majengo', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 'R7458', 'Active', 'Kileo shop', '135', 'Manyara', 'Babati Town', 'Babati', 'Babati Mjini', '-4.21098', '35.74996', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 'R7469', 'Active', 'Hakunaga shop', '136', 'Manyara', 'Babati Town', 'Babati', 'Babati Mjini', '4.21161', '35.750096', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 'R41', 'Active', 'Mama Baraka Shop', '137', 'Manyara', 'Babati Town', 'Babati', 'Babati Mjini', '4.21397', '35.7498', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 'R45', 'Inactive', 'Mwalimu shop', '138', 'Manyara', 'Babati Town', 'Babati', 'Babati Mjini', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 'R7474', 'Active', 'River side shop', '139', 'Manyara', 'Babati Town', 'Babati', 'Babati Mjini', '4.2157', '35.75134', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 'R7475', 'Active', 'Joshua shop', '140', 'Manyara', 'Babati Town', 'Babati', 'Hangon', '4.22355', '35.75433', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 'R186', 'Active', 'Philipo Shop', '141', 'Manyara', 'Babati Town', 'Bagara', 'Komoto', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 'R185', 'Active', 'Mama Editha Shop', '142', 'Manyara', 'Babati Town', 'Bagara', 'Komoto', '-4.21501', '35.71595', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 'R187', 'Active', 'Evans Shop', '143', 'Manyara', 'Babati Town', 'Bagara', 'Komoto', '4.21004', '35.71856', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 'R7468', 'Active', 'Lameck shop', '144', 'Manyara', 'Babati Town', 'Bagara', 'Mji mpya', '-4.20771', '35.74457', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 'R7467', 'Active', 'Sumawe shop', '145', 'Manyara', 'Babati Town', 'Bagara', 'Mji mpya', '4.20799', '35.74468', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 'R85', 'Active', 'Mchaga Shop', '146', 'Manyara', 'Babati Town', 'Bagara', 'Nakwa', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 'R84', 'Inactive', 'Sham Shop ', '147', 'Manyara', 'Babati Town', 'Bagara', 'Osyterbay', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 'R7445', 'Active', 'Mzalendo Oil Mill', '148', 'Manyara', 'Babati Town', 'Bagara', 'Osyterbay', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 'R179', 'Active', 'Mayko Shop', '149', 'Manyara', 'Babati Town', 'Bagara', 'Nyunguu', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 'R180', 'Active', 'No Limit Shop ', '150', 'Manyara', 'Babati Town', 'Bagara', 'Nyunguu', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 'R181', 'Active', 'Erick Shop', '151', 'Manyara', 'Babati Town', 'Bagara', 'Nyunguu', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 'R49', 'Active', 'Shaibu Shop', '152', 'Manyara', 'Babati Town', 'Bagara', 'Osyterbay', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 'R86', 'Active', 'Habye Shop ', '153', 'Manyara', 'Babati Town', 'Bagara', 'Osyterbay', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 'R184', 'Active', 'Savanna Shop', '154', 'Manyara', 'Babati Town', 'Bagara', 'Osyterbay', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 'R7481', 'Active', 'Mama shafii shop', '155', 'Manyara', 'Babati Town', 'Bagara', 'Nyunguu', '4.20877', '35.74468', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 'R3644', 'Active', 'Sarah Shop', '156', 'Manyara', 'Babati Town', 'Bagara', 'Nyunguu', '4.21072', '35.74784', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 'R238', 'Inactive', 'Masai Shop', '157', 'Manyara', 'Babati Town', 'Bagara', 'Nyunguu', '-4.20649', '35.74248', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 'R176', 'Active', 'Husna Shop', '158', 'Manyara', 'Babati Town', 'Bagara', 'Nyunguu', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 'R177', 'Active', 'Kavishe Shop Babati', '159', 'Manyara', 'Babati Town', 'Bagara', 'Nyunguu', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 'R178', 'Active', 'Msangi shop ', '160', 'Manyara', 'Babati Town', 'Bagara', 'Nyunguu', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 'R174', 'Active', 'Furaha Shop', '161', 'Manyara', 'Babati Town', 'Bagara', 'Nyunguu', '4.20632', '35.7415', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 'R7461', 'Active', 'Sonola Shop', '162', 'Manyara', 'Babati Town', 'Bagara', 'Nyunguu', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 'R7480', 'Active', 'Mmasi shop', '163', 'Manyara', 'Babati Town', 'Bagara', 'Nyunguu', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 'R182', 'Active', 'Sunday Shop', '164', 'Manyara', 'Babati Town', 'Bagara', 'Nyunguu', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 'R183', 'Active', 'Mchagga One shop', '165', 'Manyara', 'Babati Town', 'Bagara', 'Nyunguu', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 'R239', 'Active', 'Mama Jovita Shop', '166', 'Manyara', 'Babati Town', 'Bagara', 'Nyunguu', '-4.20651', '35.74242', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 'R87', 'Active', 'Mama Dick Shop ', '167', 'Manyara', 'Babati Town', 'Bagara', 'Nyunguu', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 'R88', 'Active', 'Naza shop ', '168', 'Manyara', 'Babati Town', 'Bagara', 'Nyunguu', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 'R90', 'Active', 'Massawe Shop', '169', 'Manyara', 'Babati Town', 'Bagara', 'Nyunguu', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 'R175', 'Active', 'Massawe Family Shop', '170', 'Manyara', 'Babati Town', 'Bagara', 'Nyunguu', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 'R89', 'Active', 'Mama Goodluck Shop', '171', 'Manyara', 'Babati Town', 'Bagara', 'Nyunguu', '4.20996', '35.74294', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 'R7456', 'Active', 'Nzagamba Shop', '172', 'Manyara', 'Babati Town', 'Bagara', 'Nyunguu', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 'R7477', 'Active', 'Daudi shop', '173', 'Manyara', 'Babati Town', 'Bagara', 'Nakwa', '4.2491', '35.7045', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 'R7471', 'Active', 'Elia shop', '174', 'Manyara', 'Babati Town', 'Bagara', 'Nakwa', '4.25395', '35.70785', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 'R7473', 'Active', 'Msofe Shop', '175', 'Manyara', 'Babati Town', 'Bagara', 'Negamsi', '4.21281', '35.74018', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 'R2296', 'Active', 'Mvumo Family shop', '176', 'Manyara', 'Babati Town', 'Bagara', 'Ngarenaro', '4.21486', '35.74085', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 'R54', 'Active', 'Mama Anwary Shop', '177', 'Manyara', 'Babati Town', 'Bagara', 'Nyunguu', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 'R80', 'Active', 'Mama Elias Shop', '178', 'Manyara', 'Babati Town', 'Bagara', 'Nyunguu', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 'R1658', 'Active', 'Ota shop', '179', 'Manyara', 'Hanang District', 'Balangdalalu', 'Balangdalalu', '4.63871', '35.27702', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 'R248', 'Active', 'Deo Shop', '180', 'Manyara', 'Babati District', 'Bashnet', 'Bashnet', '-4.22964', '35.42739', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 'R249', 'Active', 'Sumari Shop', '181', 'Manyara', 'Babati District', 'Bashnet', 'Bashnet', '-4.22982', '35.42729', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 'R253', 'Active', 'Mama Light Shop', '182', 'Manyara', 'Babati District', 'Bashnet', 'Bashnet', '-4.22989', '35.42702', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 'R260', 'Active', 'Tukula Shop', '183', 'Manyara', 'Babati District', 'Bashnet', 'Bashnet', '-4.22633', '35.4264', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 'R510', 'Active', 'Barehh shop', '184', 'Manyara', 'Babati District', 'Bashnet', 'Bashnet', '-4.22995', '35.42687', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 'R520', 'Active', 'Mama Kelvin shop', '185', 'Manyara', 'Babati District', 'Bashnet', 'Bashnet', '-4.22631', '35.42644', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 'R258', 'Active', 'Bura Shop', '186', 'Manyara', 'Babati District', 'Bashnet', 'Long', '-4.2311', '35.42824', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 'R259', 'Active', 'Seja Shop', '187', 'Manyara', 'Babati District', 'Bashnet', 'Long', '-4.22785', '35.42662', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 'R246', 'Active', 'Upendo Shop-Bashnet', '188', 'Manyara', 'Babati District', 'Bashnet', 'Long', '-4.22929', '35.4275', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 'R254', 'Active', 'Mwalimu Hamisi Shop', '189', 'Manyara', 'Babati District', 'Bashnet', 'Bashnet', '-4.23001', '35.422711', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 'R7462', 'Active', 'Sule shop', '190', 'Manyara', 'Babati District', 'Bashnet', 'Bashnet', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 'R247', 'Active', 'Lucian Shop', '191', 'Manyara', 'Babati District', 'Bashnet', 'Long', '-4.22915', '35.4275', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 'R255', 'Active', 'Mlimani Shop', '192', 'Manyara', 'Babati District', 'Bashnet', 'Long', '-4.23003', '35.42819', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 'R256', 'Active', 'Andrea Shop Bashnet', '193', 'Manyara', 'Babati District', 'Bashnet', 'Long', '-4.23044', '35.42806', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 'R257', 'Active', 'Safari Shop', '194', 'Manyara', 'Babati District', 'Bashnet', 'Long', '-4.23067', '35.42814', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 'R240', 'Active', 'Nicodem Shop', '195', 'Manyara', 'Hanang District', 'Bassotu', 'Bassotu', '-4.37266', '35.07338', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 'R241', 'Active', 'Reuben Shop', '196', 'Manyara', 'Hanang District', 'Bassotu', 'Bassotu', '-4.37299', '35.07337', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 'R245', 'Active', 'Amsi Shop', '197', 'Manyara', 'Hanang District', 'Bassotu', 'Bassotu', '-4.37231', '35.0699', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 'R242', 'Active', 'Ney Shop', '198', 'Manyara', 'Hanang District', 'Bassotu', 'Bassotu', '-4.37288', '35.07335', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 'R243', 'Active', 'Manyara Oil Supplies', '199', 'Manyara', 'Hanang District', 'Bassotu', 'Bassotu', '-4.37299', '35.07304', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 'R244', 'Active', 'Qamunga Shop', '200', 'Manyara', 'Hanang District', 'Bassotu', 'Bassotu', '-4.37289', '35.07233', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 'R567', 'Active', 'Ibra Shop', '201', 'Manyara', 'Hanang District', 'Bassotu', 'Galangala', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 'R7428', 'Active', 'Mama Rahel Shop', '202', 'Manyara', 'Hanang District', 'Bassotu', 'Galangala', '4.39846', '35.16545', '0001-01-01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 'R7530', 'Active', 'Mbuva Shop', '203', 'Manyara', 'Hanang District', 'Bassotu', 'Mulbadaw', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 'R1763', 'Active', 'Msami shop', '204', 'Manyara', 'Hanang District', 'Bassotu', 'Mulbadaw', '4.39856', '35.16664', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 'R7437', 'Active', 'faith Shop', '205', 'Manyara', 'Hanang District', 'Bassotu', 'Mulbadaw', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 'R196', 'Active', 'Amina Shop', '206', 'Manyara', 'Babati Town', 'Bonga', 'Bonga Mjini', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 'R197', 'Active', 'Mama Sajent Shop', '207', 'Manyara', 'Babati Town', 'Bonga', 'Bonga Mjini', '-4.34788', '35.7365', '0001-01-01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 'R210', 'Active', 'Muddy Shop', '208', 'Manyara', 'Babati Town', 'Bonga', 'Bonga Mjini', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 'R211', 'Active', 'Abdallah Shop Bonga', '209', 'Manyara', 'Babati Town', 'Bonga', 'Bonga Mjini', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 'R448', 'Active', 'California Shop', '210', 'Manyara', 'Babati Town', 'Bonga', 'Bonga Mjini', '-4.34904', '35.73832', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 'R22', 'Active', 'Saul Shop', '211', 'Shinyanga', 'Shinyanga Municipal', 'Chamaguha', 'Chamaguha', '-3.67441', '33.44488', '0001-01-01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 'R28', 'Active', 'Alphona Mini Supermarket', '212', 'Shinyanga', 'Shinyanga Municipal', 'Chamaguha', 'Chamaguha', '-3.66968', '33.43983', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 'R95', 'Active', 'Ombeni Shop', '213', 'Shinyanga', 'Shinyanga Municipal', 'Chamaguha', 'Chamaguha', '-3.67457', '33.44582', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 'R6879', 'Active', 'Babuu shop', '214', 'Shinyanga', 'Shinyanga Municipal', 'Chamaguha', 'Chamaguha', '-3.67457', '-33.44608', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 'R15', 'Active', 'Kipida shop', '215', 'Shinyanga', 'Shinyanga Municipal', 'Chamaguha', 'Chamaguha', '-3.67415', '33.44507', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 'R20', 'Active', 'Mwangaluka shop', '216', 'Shinyanga', 'Shinyanga Municipal', 'Chamaguha', 'Tanesco', '-3.67458', '33.44626', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 'R27', 'Active', 'Pambe Shop', '217', 'Shinyanga', 'Shinyanga Municipal', 'Chamaguha', 'Tanesco', '-3.67348', '33.44061', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 'R21', 'Active', 'Poul Shop', '218', 'Shinyanga', 'Shinyanga Municipal', 'Chamaguha', 'Tanesco', '-3.67381', '33.44152', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 'R58', 'Active', 'Kabelele shop', '219', 'Shinyanga', 'Shinyanga Municipal', 'Chibe', 'Old Shinyanga', '-3.5489', '33.45779', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 'R55', 'Active', 'Amos shop', '220', 'Shinyanga', 'Shinyanga Municipal', 'Chibe', 'Old Shinyanga', '-3.55921', '33.40808', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, 'R12', 'Active', 'Johanes shop', '221', 'Shinyanga', 'Shinyanga Municipal', 'Chibe', 'Old Shinyanga', '-3.55781', '33.40774', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, 'R72', 'Active', 'Huruma Shop', '222', 'Shinyanga', 'Shinyanga Municipal', 'Chibe', 'Old Shinyanga', '-3.55823', '3.40744', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, 'R1693', 'Active', 'Dismass Shop', '223', 'Shinyanga', 'Shinyanga Municipal', 'Chibe', 'Old Shinyanga', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, 'R7450', 'Inactive', 'Bruno Shop', '224', 'Manyara', 'Babati District', 'Dareda', 'Dareda Kati', 'None', 'None', '0001-01-01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, 'R7452', 'Active', 'Deemay Shop', '225', 'Manyara', 'Babati District', 'Dareda', 'Dareda Kati', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, 'R199', 'Active', 'Edmund Shop', '226', 'Manyara', 'Babati District', 'Dareda', 'Dareda Kati', '4.21778', '35.55393', '0001-01-01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, 'R7449', 'Active', 'Bura Siay Shop', '227', 'Manyara', 'Babati District', 'Dareda', 'Dareda Kati', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, 'R7455', 'Active', 'Philipo shop', '228', 'Manyara', 'Babati District', 'Dareda', 'Dareda Kati', '-4.24422', '-35.49318', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, 'R7451', 'Active', 'Brun Jovita Shop', '229', 'Manyara', 'Babati District', 'Dareda', 'Dareda Kati', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, 'R7470', 'Active', 'Yusuph Shop', '230', 'Manyara', 'Babati District', 'Dareda', 'Dareda Kati', '4.21813', '35.55346', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, 'R198', 'Active', 'Karim Shop', '231', 'Manyara', 'Babati District', 'Dareda', 'Dareda Kati', '4.24026', '35.49831', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, 'R7459', 'Active', 'Magdalena Shop', '232', 'Manyara', 'Babati District', 'Dareda', 'Dareda Kati', '4.2181', '35.55379', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, 'R7436', 'Active', 'sengati shop', '233', 'Shinyanga', 'Shinyanga District', 'Didia', 'Didia', '-3.82113', '-33.08279', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, 'R148', 'Active', 'Shaaban shop', '234', 'Shinyanga', 'Shinyanga District', 'Didia', 'Didia', '-3.82111', '33.08299', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, 'R147', 'Active', 'Kulwa shop', '235', 'Shinyanga', 'Shinyanga District', 'Didia', 'Didia', '-3.82199', '-33.08298', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, 'R139', 'Active', 'Meshack shop', '236', 'Shinyanga', 'Shinyanga District', 'Didia', 'Puni', '-3.88912', '32.01949', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, 'R669', 'Active', 'Mchungaji Shop Duru', '237', 'Manyara', 'Babati District', 'Duru', 'Duru', '-4.32175', '35.59475', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, 'R670', 'Active', 'Adi Shop', '238', 'Manyara', 'Babati District', 'Duru', 'Duru', '-4.32219', '35.59474', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, 'R671', 'Active', 'Ali Shop Duru', '239', 'Manyara', 'Babati District', 'Duru', 'Duru', '-4.32213', '35.59492', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, 'R2622', 'Active', 'Lazaro shop', '240', 'Manyara', 'Hanang District', 'Endasak', 'Endagaw', '4.21072', '35.53337', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, 'R284', 'Active', 'Jombi Shop', '241', 'Manyara', 'Hanang District', 'Endasak', 'Endasak', '-4.42052', '35.51413', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, 'R285', 'Active', 'Cassian Shop', '242', 'Manyara', 'Hanang District', 'Endasak', 'Endasak', '-4.42059', '35.5142', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, 'R286', 'Active', 'Marmo Shop', '243', 'Manyara', 'Hanang District', 'Endasak', 'Endasak', '-4.4211', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, 'R287', 'Active', 'Sindano Shop', '244', 'Manyara', 'Hanang District', 'Endasak', 'Endasak', '-4.42122', '35.5138', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, 'R283', 'Active', 'Seif Shop', '245', 'Manyara', 'Hanang District', 'Endasak', 'Endasak', '-4.42088', '35.51392', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, 'R288', 'Active', 'Ayoub Shop', '246', 'Manyara', 'Hanang District', 'Endasak', 'Endasak', '-4.42118', '35.51366', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, 'R3095', 'Active', 'Dullah Shop', '247', 'Manyara', 'Hanang District', 'Endasak', 'Endasak', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, 'R1805', 'Active', 'Danga shop', '248', 'Manyara', 'Hanang District', 'Endasak', 'Endasak', '-4.42123', '35.51343', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, 'R1804', 'Active', 'Chinga shop', '249', 'Manyara', 'Hanang District', 'Endasak', 'Endasak', '-4.42078', '35.5136', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, 'R289', 'Active', 'Abubakari Shop', '250', 'Manyara', 'Hanang District', 'Endasak', 'Endasak', '-4.42076', '35.51381', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, 'R194', 'Active', 'Mchaga Shop', '251', 'Manyara', 'Babati District', 'Gallapo', 'Gallapo', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, 'R195', 'Active', 'Samwel Shop', '252', 'Manyara', 'Babati District', 'Gallapo', 'Gallapo', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, 'R3368', 'Active', 'Mama Abdul Shop', '253', 'Manyara', 'Babati District', 'Gallapo', 'Gallapo', '4.28217', '35.8513', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, 'R2345', 'Active', 'Mlokole shop', '254', 'Manyara', 'Babati District', 'Gallapo', 'Gallapo', '4.28193', '35.85089', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, 'R2378', 'Inactive', 'Daniel shop Gallapo', '255', 'Manyara', 'Babati District', 'Gallapo', 'Gallapo', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, 'R4770', 'Active', 'Jamal shop', '256', 'Manyara', 'Babati District', 'Gallapo', 'Gallapo', '4.32679', '35.87352', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(147, 'R265', 'Active', 'Ebenezer Shop', '257', 'Manyara', 'Hanang District', 'Ganana', 'Ganana A', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(148, 'R266', 'Active', 'Sala na Kazi Shop', '258', 'Manyara', 'Hanang District', 'Ganana', 'Ganana A', 'None', 'None', '0001-01-01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, 'R1672', 'Active', 'Ufunguo shop', '259', 'Manyara', 'Hanang District', 'Ganana', 'Ganana A', '-4.52191', '35.38356', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, 'R3665', 'Active', 'Mama Mlavi Shop', '260', 'Manyara', 'Hanang District', 'Ganana', 'Ganana A', '-4.51465', '35.38231', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, 'R4172', 'Active', 'Mduma shop', '261', 'Manyara', 'Hanang District', 'Ganana', 'Ganana A', '-4.51969', '35.38167', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, 'R7476', 'Active', 'Dadama Store', '262', 'Manyara', 'Hanang District', 'Ganana', 'Ganana A', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, 'R5369', 'Active', 'Sengo shop', '263', 'Manyara', 'Hanang District', 'Ganana', 'Katesh A', '4.52079', '35.38058', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, 'R1700', 'Active', 'Mchaga shop Katesh', '264', 'Manyara', 'Hanang District', 'Ganana', 'Katesh A', '-4.52325', '35.38311', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, 'R281', 'Active', 'Hayuma Shop', '265', 'Manyara', 'Hanang District', 'Ganana', 'Ganana B', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, 'R1762', 'Active', 'Tausi shop', '266', 'Manyara', 'Hanang District', 'Ganana', 'Ganana B', '-4.52274', '35.38336', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, 'R7447', 'Active', 'Herman Shop', '267', 'Manyara', 'Hanang District', 'Ganana', 'Ganana B', '4.52183', '35.38294', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(158, 'R270', 'Active', 'Maelewano Shop', '268', 'Manyara', 'Hanang District', 'Ganana', 'Ganana C', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(159, 'R276', 'Active', 'Laizer Shop', '269', 'Manyara', 'Hanang District', 'Ganana', 'Ganana C', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(160, 'R277', 'Active', 'Mama Neema Shop', '270', 'Manyara', 'Hanang District', 'Ganana', 'Ganana C', '4.51978', '35.38167', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(161, 'R267', 'Active', 'Nelson Shop', '271', 'Manyara', 'Hanang District', 'Ganana', 'Ganana B', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(162, 'R268', 'Active', 'Mama Manka Shop', '272', 'Manyara', 'Hanang District', 'Ganana', 'Ganana B', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(163, 'R269', 'Active', 'Massawe Shop', '273', 'Manyara', 'Hanang District', 'Ganana', 'Ganana B', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(164, 'R272', 'Active', 'Jelim Trading', '274', 'Manyara', 'Hanang District', 'Ganana', 'Ganana B', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(165, 'R273', 'Active', 'Saroo Shop', '275', 'Manyara', 'Hanang District', 'Ganana', 'Ganana B', '-4.52145', '35.38068', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(166, 'R274', 'Active', 'Paulo Shop', '276', 'Manyara', 'Hanang District', 'Ganana', 'Ganana B', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(167, 'R4330', 'Active', 'Telaviv shop', '277', 'Manyara', 'Hanang District', 'Ganana', 'Ganana A', '-4.52107', '35.3813', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(168, 'R271', 'Active', 'Frank Shop', '278', 'Manyara', 'Hanang District', 'Ganana', 'Ganana A', '-4.52124', '35.37896', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(169, 'R538', 'Active', 'Urafiki shop', '279', 'Manyara', 'Hanang District', 'Ganana', 'Ganana A', '-4.52127', '35.38132', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(170, 'R1773', 'Active', 'Kaka shop', '280', 'Manyara', 'Hanang District', 'Ganana', 'Ganana A', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(171, 'R4648', 'Active', 'Muktar shop', '281', 'Manyara', 'Hanang District', 'Ganana', 'Ganana A', '-4.52141', '35.38252', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(172, 'R4519', 'Active', 'Ismail shop', '282', 'Manyara', 'Hanang District', 'Ganana', 'Ganana A', '-4.52172', '35.3827', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(173, 'R2617', 'Active', 'Kijiweni shop', '283', 'Manyara', 'Hanang District', 'Gidahababieg', 'Gidahababieg', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(174, 'R2618', 'Active', 'Adam Kimolo shop', '284', 'Manyara', 'Hanang District', 'Gidahababieg', 'Gidahababieg', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, 'R2619', 'Active', 'Bakari Juma shop', '285', 'Manyara', 'Hanang District', 'Gidahababieg', 'Gidahababieg', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(176, 'R2620', 'Active', 'Gidagorjo shop', '286', 'Manyara', 'Hanang District', 'Gidahababieg', 'Gidahababieg', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, 'R7483', 'Active', 'Nyerere Shop', '287', 'Manyara', 'Babati District', 'Gidas', 'Boay', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(178, 'R7457', 'Active', 'Ngoma Shop', '288', 'Manyara', 'Babati District', 'Gidas', 'Gidas', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(179, 'R7531', 'Active', 'Mchagaa Shop', '289', 'Manyara', 'Hanang District', 'Gisambalang', 'Gisambalang', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(180, 'R6855', 'Active', 'Lulu Shop', '290', 'Manyara', 'Hanang District', 'Gitting', 'Gitting', '4.40696', '35.45332', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(181, 'R4877', 'Active', 'Wilbroad shop', '291', 'Manyara', 'Hanang District', 'Gitting', 'Gitting', '4.40677', '35.45619', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(182, 'R4878', 'Active', 'Ae Shop', '292', 'Manyara', 'Hanang District', 'Gitting', 'Gocho', '4.40505', '35.45295', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(183, 'R3099', 'Active', 'Bassotugan shop', '293', 'Manyara', 'Hanang District', 'Hidet', 'Bassotughan', '4.49246', '35.50274', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(184, 'R3094', 'Active', 'Mchungaji Shop hidet', '294', 'Manyara', 'Hanang District', 'Hidet', 'Hidet', '4.48233', '35.52566', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(185, 'R650', 'Active', 'Manase shop', '295', 'Manyara', 'Hanang District', 'Hirbadaw', 'Hirbadaw', '-4.3521', '34.89188', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(186, 'R651', 'Active', 'Rama shop', '296', 'Manyara', 'Hanang District', 'Hirbadaw', 'Hirbadaw', '-4.35091', '34.89129', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(187, 'R652', 'Active', 'Dilanda shop', '297', 'Manyara', 'Hanang District', 'Hirbadaw', 'Hirbadaw', '-4.35012', '34.8904', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(188, 'R653', 'Active', 'Paschal shop', '298', 'Manyara', 'Hanang District', 'Hirbadaw', 'Hirbadaw', '-4.35255', '34.88944', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(189, 'R655', 'Active', 'Mkiti shop', '299', 'Manyara', 'Hanang District', 'Hirbadaw', 'Hirbadaw', '-4.35288', '34.89163', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(190, 'R7442', 'Active', 'Salum Shop', '300', 'Manyara', 'Hanang District', 'Hirbadaw', 'Hirbadaw', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(191, 'R30', 'Active', 'Peter Shop', '301', 'Shinyanga', 'Shinyanga Municipal', 'Ibadakuli', 'Ibadakuli', '-3.63838', '33.47997', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(192, 'R31', 'Active', 'Elias Shop', '302', 'Shinyanga', 'Shinyanga Municipal', 'Ibadakuli', 'Ibadakuli', '-3.63844', '33.47994', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(193, 'R3286', 'Active', 'Filbert shop', '303', 'Shinyanga', 'Shinyanga Municipal', 'Ibadakuli', 'Ibadakuli', '-3.66692', '-33.45791', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(194, 'R57', 'Active', 'Tungu shop', '304', 'Shinyanga', 'Shinyanga Municipal', 'Ibadakuli', 'Ibadakuli', '-3.62711', '33.49652', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(195, 'R29', 'Active', 'Kulwa Shop', '305', 'Shinyanga', 'Shinyanga Municipal', 'Ibadakuli', 'Ibadakuli', '-3.6385', '33.4799', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196, 'R6415', 'Active', 'Mihayo shop', '306', 'Shinyanga', 'Shinyanga District', 'Ilola', 'Ihalo', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(197, 'R6416', 'Active', 'Ng\'wandu shop', '307', 'Shinyanga', 'Shinyanga District', 'Ilola', 'Ihalo', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(198, 'R6413', 'Active', 'Mbaya shop', '308', 'Shinyanga', 'Shinyanga District', 'Ilola', 'Ihalo', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(199, 'R165', 'Active', 'Mihayo shop', '309', 'Shinyanga', 'Shinyanga District', 'Ilola', 'Ihalo', '-3.73836', '33.02626', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(200, 'R3996', 'Active', 'Masanja shop', '310', 'Shinyanga', 'Kahama', 'Isagehe', 'Bumbiti', 'None', 'None', '0001-01-01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(201, 'R97', 'Active', 'Senzani Shop', '311', 'Shinyanga', 'Kahama', 'Isagehe', 'Kagongwa', '-3.87361', '-32.76172', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(202, 'R79', 'Active', 'Jerusalem Shop', '312', 'Shinyanga', 'Kahama', 'Isagehe', 'Kagongwa', '3.7841', '32.76188', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(203, 'R7528', 'Active', 'Mboje shop', '313', 'Shinyanga', 'Kahama', 'Isagehe', 'Kagongwa', '-3.8741', '-32.76189', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(204, 'R7529', 'Active', 'Hamza shop', '314', 'Shinyanga', 'Kahama', 'Isagehe', 'Kagongwa', '-3.87416', '-32.76189', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(205, 'R76', 'Active', 'Pendo Shop', '315', 'Shinyanga', 'Kahama', 'Isagehe', 'Kagongwa', '3.8741', '33.76194', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(206, 'R7454', 'Active', 'Mabula shop', '316', 'Shinyanga', 'Kahama', 'Isagehe', 'Kagongwa', '-3.81427', '-32.76088', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(207, 'R4754', 'Active', 'Chambi shop', '317', 'Shinyanga', 'Kahama', 'Isagehe', 'Malenge', '-3.90569', '-32.77121', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(208, 'R3573', 'Active', 'Nkandi shop', '318', 'Shinyanga', 'Kahama', 'Isagehe', 'Mondo', '-3.85408', '-32.71213', '0001-01-01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(209, 'R3570', 'Active', 'Deus Shop', '319', 'Shinyanga', 'Kahama', 'Isagehe', 'Sangilwa', '-3.86344', '-32.72997', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(210, 'R3549', 'Active', 'Yahaya shop', '320', 'Shinyanga', 'Kahama', 'Isagehe', 'Kagongwa', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(211, 'R3544', 'Active', 'Mchungaji shop', '321', 'Shinyanga', 'Kahama', 'Isagehe', 'Kagongwa', '-3.874776', '-32.762228', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(212, 'R77', 'Active', 'Laines shop', '322', 'Shinyanga', 'Kahama', 'Isagehe', 'Kagongwa', '3.8741', '32.76202', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(213, 'R75', 'Active', 'Lucas shop', '323', 'Shinyanga', 'Kahama', 'Isagehe', 'Kagongwa', '3.8687', '33.76131', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(214, 'R78', 'Active', 'Malima Shop', '324', 'Shinyanga', 'Kahama', 'Isagehe', 'Kagongwa', '3.87407', '32.76191', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(215, 'R3548', 'Active', 'Nkinda shop', '325', 'Shinyanga', 'Kahama', 'Isagehe', 'Kagongwa', '-3.873551', '-32.76162', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(216, 'R7502', 'Active', 'Mama Mazoya shop', '326', 'Shinyanga', 'Kahama', 'Isaka', 'Isaka', '-3.90458', '-32.95305', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(217, 'R7504', 'Active', 'Sitta shop', '327', 'Shinyanga', 'Kahama', 'Isaka', 'Isaka', '-3.90458', '-32.95305', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(218, 'R7498', 'Active', 'Paula shop', '328', 'Shinyanga', 'Kahama', 'Isaka', 'Isaka', '-3.90511', '32.94364', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(219, 'R154', 'Active', 'Tangi shop', '329', 'Shinyanga', 'Shinyanga District', 'Iselemagazi', 'Iselemagazi', '-3.54147', '33.13706', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(220, 'R142', 'Active', 'Isaka Shop', '330', 'Shinyanga', 'Shinyanga District', 'Iselemagazi', 'Iselemagazi', '-3.56873', '33.23668', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(221, 'R143', 'Active', 'Simbila shop', '331', 'Shinyanga', 'Shinyanga District', 'Iselemagazi', 'Iselemagazi', '-3.54136', '33.13785', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(222, 'R141', 'Active', 'Pulima shop', '332', 'Shinyanga', 'Shinyanga District', 'Iselemagazi', 'Iselemagazi', '-3.54158', '33.13736', '0001-01-01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(223, 'R152', 'Active', 'Sayi shop', '333', 'Shinyanga', 'Shinyanga District', 'Iselemagazi', 'Nghomango', '-3.4396', '33.98981', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(224, 'R136', 'Active', 'Wamba shop', '334', 'Shinyanga', 'Shinyanga District', 'Itwangi', 'Itwangi', '-3.87616', '33.07319', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(225, 'R170', 'Active', 'Njange shop', '335', 'Shinyanga', 'Shinyanga District', 'Itwangi', 'Itwangi', '-3.87895', '33.07452', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(226, 'R138', 'Active', 'Sayi shop', '336', 'Shinyanga', 'Shinyanga District', 'Itwangi', 'Nyida', '-3.9207', '33.05243', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(227, 'R2729', 'Active', 'Kaeza shop', '337', 'Shinyanga', 'Shinyanga District', 'Itwangi', 'Nyida', 'None', 'None', '0001-01-01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(228, 'R137', 'Active', 'Nkumingi shop', '338', 'Shinyanga', 'Shinyanga District', 'Itwangi', 'Nyida', '-3.87496', '33.05303', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(229, 'R7495', 'Active', 'Loloo shop', '339', 'Shinyanga', 'Shinyanga District', 'Itwangi', 'Nyida', '-3.877536', '-33.05204', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(230, 'R2193', 'Active', 'Mama Madida shop', '340', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Igalilimi', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(231, 'R6813', 'Active', 'Lovia shop', '341', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Igalilimi', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(232, 'R2670', 'Active', 'Mwita shop', '342', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Igalilimi', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(233, 'R2189', 'Active', 'Huye shop', '343', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Igalilimi', '-3.82874', '-32.5973', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(234, 'R7444', 'Active', 'Bebete shop', '344', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Igalilimi', '-3.83466', '-32.59391', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(235, 'R5708', 'Active', 'Mangi shop', '345', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Igalilimi', '-3.83077', '-32.6005', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(236, 'R7517', 'Active', 'Lazaro shop', '346', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Shunu', '-3.82954', '-32.57531', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(237, 'R7497', 'Active', 'Vunjabei shop', '347', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Shunu', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(238, 'R7515', 'Active', 'Muha shop', '348', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Shunu', '-3.83027', '-32.57515', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(239, 'R7514', 'Active', 'Mathayo shop', '349', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Shunu', '-3.83039', '-32.59514', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(240, 'R219', 'Active', 'Mayenga shop', '350', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Nyasubi', '3.82793', '32.59728', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(241, 'R220', 'Active', 'Lugome shop', '351', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Nyasubi', '3.82807', '32.59737', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(242, 'R221', 'Active', 'Peter filipo shop', '352', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Nyasubi', '3.82855', '32.59734', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(243, 'R99', 'Active', 'Kipuga Shop', '353', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Nyasubi', '3.8383', '32.6151', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(244, 'R7516', 'Active', 'Ntemi shop', '354', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Shunu', '-3.83411', '-32.58063', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(245, 'R7521', 'Active', 'Moris shop', '355', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Shunu', '-3.83407', '-32.58041', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(246, 'R98', 'Active', 'Koplo shop', '356', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Nyasubi', '3.83399', '32.61104', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(247, 'R222', 'Active', 'Masanja shop', '357', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Nyasubi', '3.82854', '32.59734', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `retailers` (`id`, `retailerid`, `status`, `retailshop`, `phone`, `region`, `district`, `ward`, `village`, `latitude`, `longitude`, `startdate`, `created_at`, `updated_at`, `deleted_at`) VALUES
(248, 'R4579', 'Active', 'Love shop', '358', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Nyasubi', '-3.83353', '-32.61124', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(249, 'R108', 'Active', 'Kishiwa shop', '359', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Nyasubi', '3.83585', '32.6144', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(250, 'R217', 'Active', 'Mkambaku shop', '360', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Nyasubi', '3.82869', '32.59804', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(251, 'R218', 'Active', 'Obama shop', '361', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Nyasubi', '3.82809', '32.59736', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(252, 'R111', 'Active', 'Mnanka Shop', '362', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Nyasubi', '3.83592', '32.61448', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(253, 'R121', 'Active', 'Kehadi shop', '363', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Nyasubi', '3.83217', '32.59752', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(254, 'R114', 'Active', 'Huye shop', '364', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Nyasubi', '3.8288', '32.59729', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(255, 'R133', 'Active', 'Museven Shop', '365', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Nyasubi', '3.83272', '32.59875', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(256, 'R122', 'Active', 'Masaba shop', '366', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Nyasubi', '3.83367', '32.61377', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(257, 'R109', 'Active', 'Matondo shop', '367', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Nyasubi', '3.83584', '32.61482', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(258, 'R126', 'Active', 'Mathew shop', '368', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Nyahanga', '3.85379', '32.71171', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(259, 'R131', 'Active', 'Yahaya shop', '369', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Nyahanga', '3.83051', '32.58259', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(260, 'R106', 'Active', 'Samwel Shop', '370', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Nyahanga', '3.82902', '32.58417', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(261, 'R107', 'Active', 'Yohana Shop', '371', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Nyahanga', '3.82834', '32.58407', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(262, 'R100', 'Active', 'Mayenga shop', '372', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Nyasubi', '3.83986', '32.61522', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(263, 'R110', 'Active', 'Muha shop', '373', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Nyasubi', '3.83592', '32.61449', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(264, 'R7490', 'Active', 'Makwenu shop', '374', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Majengo', '-3.82102', '-32.60332', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(265, 'R135', 'Active', 'Katwiga shop', '375', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Majengo', '3.82198', '32.60744', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(266, 'R132', 'Active', 'Umoja shop', '376', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Majengo', '3.82076', '32.60211', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(267, 'R7486', 'Active', '4G Business', '377', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Majengo', '-3.82117', '-32.60369', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(268, 'R104', 'Active', 'Tucheavula Shop', '378', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Nyahanga', '3.82909', '32.58416', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(269, 'R105', 'Active', 'Tunza shop', '379', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Nyahanga', '3.83479', '33.59282', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(270, 'R6610', 'Active', 'Ntuzu shop', '380', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Majengo', '-3.82091', '-32.60539', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(271, 'R7488', 'Active', 'Six shop', '381', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Majengo', '-3.82107', '32.606', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(272, 'R3062', 'Active', 'Mtiti shop', '382', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Majengo', '-3.82066', '-32.60186', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(273, 'R2237', 'Active', 'George shop', '383', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Majengo', '-3.82865', '-32.59815', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(274, 'R7489', 'Active', 'Monica shop', '384', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Majengo', '-3.82116', '-32.60368', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(275, 'R7485', 'Active', 'Kantangaze shop', '385', 'Shinyanga', 'Kahama', 'Kahama Mjini', 'Majengo', '-3.82116', '-32.603694', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(276, 'R7438', 'Active', 'Kamala mini super market', '386', 'Shinyanga', 'Shinyanga Municipal', 'Kambarage', 'Jomu', '-3.66407', '-33.41903', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(277, 'R7439', 'Active', 'Magina shop', '387', 'Shinyanga', 'Shinyanga Municipal', 'Kambarage', 'Jomu', '-3.66409', '-33.41907', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(278, 'R71', 'Active', 'Kanyigo Shop', '388', 'Shinyanga', 'Shinyanga Municipal', 'Kambarage', 'Kambarage', '-3.66933', '33.41902', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(279, 'R7526', 'Active', 'Urasa Shop', '389', 'Shinyanga', 'Shinyanga Municipal', 'Kambarage', 'Kambarage', '3.66543', '33.4202', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(280, 'R7513', 'Active', 'Mama Robert Shop', '390', 'Shinyanga', 'Shinyanga Municipal', 'Kambarage', 'Kambarage', '3.66468', '33.42275', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(281, 'R6', 'Active', 'Karangai shop', '391', 'Shinyanga', 'Shinyanga Municipal', 'Kambarage', 'Kambarage', '-3.66093', '33.41949', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(282, 'R7506', 'Active', 'Ally Shop', '392', 'Shinyanga', 'Shinyanga Municipal', 'Kambarage', 'Lubaga', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(283, 'R7508', 'Active', 'Neema Shop', '393', 'Shinyanga', 'Shinyanga Municipal', 'Kambarage', 'Majengo', '3.65167', '33.41496', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(284, 'R69', 'Active', 'Eva shop', '394', 'Shinyanga', 'Shinyanga Municipal', 'Kambarage', 'Majengo', '-3.67032', '33.41918', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(285, 'R7507', 'Active', 'Masaki Shop', '395', 'Shinyanga', 'Shinyanga Municipal', 'Kambarage', 'Majengo', '3.65023', '33.41482', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(286, 'R70', 'Active', 'Kiziba shop', '396', 'Shinyanga', 'Shinyanga Municipal', 'Kambarage', 'Lubaga', '-3.66948', '33.41882', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(287, 'R7433', 'Active', 'Lubaga shop', '397', 'Shinyanga', 'Shinyanga Municipal', 'Kambarage', 'Lubaga', '-3.65593', '-33.41556', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(288, 'R7501', 'Active', 'kwa Gaston Shop', '398', 'Shinyanga', 'Shinyanga Municipal', 'Kambarage', 'Lubaga', '3.65642', '33.41204', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(289, 'R16', 'Active', 'Derick Shop', '399', 'Shinyanga', 'Shinyanga Municipal', 'Kambarage', 'Lubaga', '-3.63328', '33.41174', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(290, 'R7500', 'Active', 'Kwa Mama Caren Shop', '400', 'Shinyanga', 'Shinyanga Municipal', 'Kambarage', 'Lubaga', '3.648059', '33.4123', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(291, 'R7525', 'Active', 'Kwa mama Esta Shop', '401', 'Shinyanga', 'Shinyanga Municipal', 'Kambarage', 'Lubaga', '3.64713', '33.41283', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(292, 'R7511', 'Active', 'Rugaila Shop', '402', 'Shinyanga', 'Shinyanga Municipal', 'Kambarage', 'Kambarage', '3.66384', '33.41924', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(293, 'R7503', 'Active', 'Kwa Laurent', '403', 'Shinyanga', 'Shinyanga Municipal', 'Kambarage', 'Kambarage', '3.66459', '33.41412', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(294, 'R6720', 'Active', 'Safari shop', '404', 'Shinyanga', 'Shinyanga Municipal', 'Kambarage', 'Kambarage', '-3.6639', '-33.42188', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(295, 'R65', 'Active', 'Adriano shop', '405', 'Shinyanga', 'Shinyanga Municipal', 'Kambarage', 'Kambarage', '-3.66374', '33.42245', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(296, 'R7512', 'Active', 'London Shop', '406', 'Shinyanga', 'Shinyanga Municipal', 'Kambarage', 'Kambarage', '3.66383', '33.42189', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(297, 'R1695', 'Active', 'Babu Shop', '407', 'Shinyanga', 'Shinyanga Municipal', 'Kambarage', 'Kambarage', '-3.6624', '-32.41422', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(298, 'R264', 'Active', 'Mnyira Shop', '408', 'Manyara', 'Hanang District', 'Katesh', 'Katesh B', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(299, 'R642', 'Active', 'Wayda shop', '409', 'Manyara', 'Hanang District', 'Katesh', 'Katesh B', '-4.52085', '35.38236', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(300, 'R263', 'Active', 'Said Shop', '410', 'Manyara', 'Hanang District', 'Katesh', 'Katesh Stand', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(301, 'R275', 'Active', 'Manyara Shop', '411', 'Manyara', 'Hanang District', 'Katesh', 'Katesh Stand', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(302, 'R278', 'Active', 'Mama Pendo Shop', '412', 'Manyara', 'Hanang District', 'Katesh', 'Katesh Stand', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(303, 'R280', 'Active', 'Urassa Shop', '413', 'Manyara', 'Hanang District', 'Katesh', 'Katesh Stand', '-4.52477', '35.38473', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(304, 'R279', 'Active', 'Kavishe Shop Hanang', '414', 'Manyara', 'Hanang District', 'Katesh', 'Katesh Stand', '-4.52482', '35.38481', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(305, 'R7425', 'Active', 'Mama Rajabu Shop', '415', 'Manyara', 'Hanang District', 'Katesh', 'Katesh Stand', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(306, 'R7519', 'Active', 'Shija shop', '416', 'Shinyanga', 'Kahama', 'Kilago', 'Iyenze', '-3.815782', '-32.63437', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(307, 'R125', 'Active', 'Maziku shop', '417', 'Shinyanga', 'Kahama', 'Kilago', 'Kilago', '3.94386', '32.58675', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(308, 'R1746', 'Active', 'Bahebe shop', '418', 'Shinyanga', 'Kahama', 'Kilago', 'Kilago', '-3.98277', '-32.66643', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(309, 'R120', 'Active', 'Manoni Shop', '419', 'Shinyanga', 'Kahama', 'Kinaga', 'Kinaga', '3.67545', '32.6653', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(310, 'R1745', 'Active', 'Maganga shop', '420', 'Shinyanga', 'Kahama', 'Kinaga', 'Kinaga', '-3.9828', '-32.6661', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(311, 'R118', 'Active', 'Saidi Shop', '421', 'Shinyanga', 'Kahama', 'Kinaga', 'Kinaga', '3.74016', '32.6437', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(312, 'R117', 'Active', 'Machuma shop', '422', 'Shinyanga', 'Kahama', 'Kinaga', 'Nduku', '3.67567', '32.60554', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(313, 'R4185', 'Active', 'Daniel shop', '423', 'Shinyanga', 'Kahama', 'Kinaga', 'Nduku', '-3.74016', '-32.64373', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(314, 'R119', 'Active', 'Maduhu Shop', '424', 'Shinyanga', 'Kahama', 'Kinaga', 'Nduku', '3.67549', '32.6654', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(315, 'R116', 'Active', 'Ni kwa Neema na Rehema shop', '425', 'Shinyanga', 'Kahama', 'Kinaga', 'Nduku', '3.67675', '32.66561', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(316, 'R4186', 'Active', 'Malifedha shop', '426', 'Shinyanga', 'Kahama', 'Kinaga', 'Ubilimbi', '-3.71718', '-32.605261', '0001-01-01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(317, 'R223', 'Active', 'Adam shop', '427', 'Shinyanga', 'Kahama', 'Kinaga', 'Ubilimbi', '-3.73254', '-32.5937', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(318, 'R5814', 'Active', 'Maley shop', '428', 'Manyara', 'Babati District', 'Kiru', 'Kiru ndogo', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(319, 'R213', 'Active', 'Jere Shop', '429', 'Manyara', 'Babati District', 'Kiru', 'Kiru six', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(320, 'R214', 'Active', 'Steven Shop', '430', 'Manyara', 'Babati District', 'Kiru', 'Kiru six', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(321, 'R215', 'Active', 'Mathayo Shop', '431', 'Manyara', 'Babati District', 'Kiru', 'Kiru six', '-4.11137', '35.68314', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(322, 'R216', 'Active', 'Kesia Shop', '432', 'Manyara', 'Babati District', 'Kiru', 'Kiru six', '-4.11141', '35.68319', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(323, 'R229', 'Active', 'Lembris Shop', '433', 'Manyara', 'Babati District', 'Kiru', 'Kiru six', '-4.1109', '35.68288', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(324, 'R230', 'Active', 'John Shop', '434', 'Manyara', 'Babati District', 'Kiru', 'Kiru six', '-4.11135', '35.68176', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(325, 'R231', 'Active', 'Nyerere Shop', '435', 'Manyara', 'Babati District', 'Kiru', 'Kiru six', '-4.11188', '35.6817', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(326, 'R232', 'Active', 'Mwarabu Shop', '436', 'Manyara', 'Babati District', 'Kiru', 'Kiru six', '-4.1118', '35.68112', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(327, 'R233', 'Active', 'Mama Happy Shop', '437', 'Manyara', 'Babati District', 'Kiru', 'Kiru six', '-4.11184', '35.68109', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(328, 'R5815', 'Active', 'Warioba shop', '438', 'Manyara', 'Babati District', 'Kiru', 'Kiru six', '4.11172', '35.6808', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(329, 'R5816', 'Active', 'Njoolay shop', '439', 'Manyara', 'Babati District', 'Kiru', 'Kiru six', '4.11114', '35.68329', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(330, 'R7430', 'Active', 'Kiende shop', '440', 'Shinyanga', 'Shinyanga Municipal', 'Kitangili', 'Kitangili', '-3.68924', '-33.42706', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(331, 'R7431', 'Active', 'Mama D Shop', '441', 'Shinyanga', 'Shinyanga Municipal', 'Kitangili', 'Kitangili', '-3.65412', '-33.42538', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(332, 'R3335', 'Active', 'Muha shop', '442', 'Shinyanga', 'Shinyanga Municipal', 'Kitangili', 'Songambele', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(333, 'R3334', 'Active', 'Kasim shop', '443', 'Shinyanga', 'Shinyanga Municipal', 'Kitangili', 'Songambele', '-3.68494', '-33.42634', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(334, 'R2806', 'Active', 'Gajoma Shop', '444', 'Shinyanga', 'Shinyanga Municipal', 'Kizumbi', 'Bugayambelele', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(335, 'R3264', 'Active', 'Masawe shop', '445', 'Shinyanga', 'Shinyanga Municipal', 'Kizumbi', 'Nhelegani', '-3.72309', '-33.40471', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(336, 'R7505', 'Active', 'kwa japhet Shop', '446', 'Shinyanga', 'Shinyanga Municipal', 'Kizumbi', 'Nhelegani', '3.72736', '33.41611', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(337, 'R9', 'Active', 'Tughe Shop', '447', 'Shinyanga', 'Shinyanga Municipal', 'Kolandoto', 'Kolandoto', '-3.5983', '33.53338', '0001-01-01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(338, 'R32', 'Active', 'Ong\'wabole shop', '448', 'Shinyanga', 'Shinyanga Municipal', 'Kolandoto', 'Kolandoto', '-3.61791', '33.52004', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(339, 'R11', 'Active', 'Maganga shop', '449', 'Shinyanga', 'Shinyanga Municipal', 'Kolandoto', 'Kolandoto', '-3.60117', '33.53375', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(340, 'R13', 'Active', 'Tangawizi shop', '450', 'Shinyanga', 'Shinyanga Municipal', 'Kolandoto', 'Kolandoto', '-3.60117', '33.53375', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(341, 'R19', 'Active', 'Reesde Shop', '451', 'Shinyanga', 'Shinyanga Municipal', 'Kolandoto', 'Kolandoto', '-3.59807', '33.53345', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(342, 'R7423', 'Active', 'Elisifa Shop', '452', 'Manyara', 'Hanang District', 'Laghanga', 'Gawidu', '4.50094', '35.02476', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(343, 'R7422', 'Active', 'Eldaxtan Shop', '453', 'Manyara', 'Hanang District', 'Laghanga', 'Laghanga', '4.54095', '35.06839', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(344, 'R3085', 'Active', 'Samweli shop', '454', 'Shinyanga', 'Kahama', 'Lunguya', 'Lunguya', '-3.837', '-32.58446', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(345, 'R169', 'Active', 'Ntindogo Nziku shop', '455', 'Shinyanga', 'Shinyanga District', 'Lyabukande', 'Lyabukande', '-3.57104', '32.93152', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(346, 'R155', 'Active', 'Doto shop', '456', 'Shinyanga', 'Shinyanga District', 'Lyabukande', 'Lyabukande', '-3.56996', '33.93078', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(347, 'R156', 'Active', 'Robert shop', '457', 'Shinyanga', 'Shinyanga District', 'Lyabukande', 'Lyamidati', '-3.63476', '33.99056', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(348, 'R679', 'Active', 'Yuda shop', '458', 'Manyara', 'Babati District', 'Madunga', 'Utwari', '-4.13549', '35.44329', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(349, 'R192', 'Active', 'Mama Issa Shop', '459', 'Manyara', 'Babati District', 'Magugu', 'Magugu', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(350, 'R616', 'Active', 'Dumwala Shop', '460', 'Manyara', 'Babati District', 'Magugu', 'Matufa', '-4.03172', '35.77062', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(351, 'R193', 'Active', 'Polepole Booking Office', '461', 'Manyara', 'Babati District', 'Magugu', 'Magugu', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(352, 'R191', 'Active', 'Yusuph Shop', '462', 'Manyara', 'Babati District', 'Magugu', 'Magugu', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(353, 'R4590', 'Active', 'Mchili Shop', '463', 'Manyara', 'Babati District', 'Magugu', 'Magugu', '-3.9996', '35.77567', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(354, 'R4609', 'Active', 'Olangochee Shop', '464', 'Manyara', 'Babati District', 'Magugu', 'Magugu', '-3.99587', '35.78304', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(355, 'R5040', 'Active', 'Jeremiah shop', '465', 'Manyara', 'Babati District', 'Magugu', 'Magugu', '-3.99565', '35.783', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(356, 'R4600', 'Active', 'Ebenezer Shop Magugu', '466', 'Manyara', 'Babati District', 'Magugu', 'Magugu', '-3.99956', '35.78304', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(357, 'R5343', 'Active', 'Msasani shop', '467', 'Manyara', 'Babati Town', 'Maisaka', 'Maisaka A', '-4.19532', '35.75126', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(358, 'R83', 'Active', 'Kimonge Shop', '468', 'Manyara', 'Babati Town', 'Maisaka', 'Maisaka A', '-4.18633', '35.7516', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(359, 'R7472', 'Active', 'Mount Sinai Super Market', '469', 'Manyara', 'Babati Town', 'Maisaka', 'Maisaka Kati', '4.20963', '35.75011', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(360, 'R7463', 'Active', 'Mwasengwa shop', '470', 'Manyara', 'Babati Town', 'Maisaka', 'Maisaka Kati', '4.30233', '35.64909', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(361, 'R7466', 'Active', 'Star Shop', '471', 'Manyara', 'Babati Town', 'Maisaka', 'Maisaka Kati', '4.21128', '35.74997', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(362, 'R5821', 'Active', 'Charles shop', '472', 'Shinyanga', 'Kahama', 'Malunga', 'Busoka', '-3.80006', '-32.55273', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(363, 'R202', 'Active', 'Msukuma Shop', '473', 'Shinyanga', 'Kahama', 'Malunga', 'Malunga', '3.81774', '32.59734', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(364, 'R5587', 'Active', 'Buyemba shop', '474', 'Shinyanga', 'Kahama', 'Malunga', 'Malunga', '-3.81918', '-32.59459', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(365, 'R7443', 'Active', 'Samson Shop', '475', 'Shinyanga', 'Kahama', 'Malunga', 'Malunga', '-3.81891', '-32.59453', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(366, 'R7527', 'Active', 'Norman shop', '476', 'Shinyanga', 'Kahama', 'Malunga', 'Malunga', '-3.81835', '-32.59356', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(367, 'R5593', 'Active', 'Wansato shop', '477', 'Shinyanga', 'Kahama', 'Malunga', 'Malunga', '-3.81037', '-32.59496', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(368, 'R6861', 'Active', 'Endakiso Shop', '478', 'Manyara', 'Babati District', 'Mamire', 'Endakiso', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(369, 'R6859', 'Active', 'Ngware Shop', '479', 'Manyara', 'Babati District', 'Mamire', 'Endakiso', '4.20906', '35.88713', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(370, 'R190', 'Active', 'Alli Shop', '480', 'Manyara', 'Babati District', 'Mamire', 'Kwaraa', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(371, 'R188', 'Active', 'Adam Msukuma Shop', '481', 'Manyara', 'Babati District', 'Mamire', 'Mamire', '4.15971', '35.83918', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(372, 'R189', 'Active', 'Isuja Shop', '482', 'Manyara', 'Babati District', 'Mamire', 'Mwikantsi', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(373, 'R7479', 'Active', 'John Shop', '483', 'Manyara', 'Hanang District', 'Masakta', 'Masakta', '4.53948', '35.69516', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(374, 'R2621', 'Active', 'Fabiano shop', '484', 'Manyara', 'Hanang District', 'Masqaroda', 'Masqaroda', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(375, 'R2624', 'Active', 'Shamim shop', '485', 'Manyara', 'Hanang District', 'Masqaroda', 'Masqaroda', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(376, 'R6240', 'Active', 'Melania shop', '486', 'Manyara', 'Hanang District', 'Measkron', 'Mara', '-4.44014', '35.5014', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(377, 'R112', 'Active', 'Gogo shop', '487', 'Shinyanga', 'Kahama', 'Mhongolo', 'Mhongolo', '3.80243', '32.6043', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(378, 'R203', 'Active', 'Robert shop', '488', 'Shinyanga', 'Kahama', 'Mhongolo', 'Mhongolo', '3.80366', '32.60411', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(379, 'R204', 'Active', 'Saimon Shop', '489', 'Shinyanga', 'Kahama', 'Mhongolo', 'Mhongolo', '3.81051', '32.60255', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(380, 'R205', 'Active', 'Nkwabi shop', '490', 'Shinyanga', 'Kahama', 'Mhongolo', 'Mhongolo', '3.80399', '32.60407', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(381, 'R3', 'Active', 'Kayuki shop', '491', 'Shinyanga', 'Kahama', 'Mhongolo', 'Mhongolo', '3.84561', '32.59546', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(382, 'R113', 'Active', 'Moshi Shop', '492', 'Shinyanga', 'Kahama', 'Mhongolo', 'Mhongolo', '3.80441', '32.60404', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(383, 'R134', 'Active', 'Sayi shop', '493', 'Shinyanga', 'Kahama', 'Mhongolo', 'Mhongolo', '3.80458', '32.60418', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(384, 'R102', 'Active', 'Flamingo Shop', '494', 'Shinyanga', 'Kahama', 'Mhongolo', 'Mhongolo', '-3.84623', '-32.59342', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(385, 'R3080', 'Active', 'Hamiimu shop', '495', 'Shinyanga', 'Kahama', 'Mhongolo', 'Mhongolo', '-3.84157', '-32.58231', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(386, 'R7448', 'Active', 'Mnyamwezi shop', '496', 'Shinyanga', 'Kahama', 'Mhongolo', 'Mhongolo', '-3.804031', '32.6041', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(387, 'R93', 'Active', 'Tesha Shop', '497', 'Shinyanga', 'Shinyanga Municipal', 'Mjini', 'Buzuka', '-3.6694', '33.42218', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(388, 'R7509', 'Active', 'Kwa  Mama Devi', '498', 'Shinyanga', 'Shinyanga Municipal', 'Mjini', 'Buzuka', '3.6705', '33.42589', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(389, 'R5', 'Active', 'Shirima Shop', '499', 'Shinyanga', 'Shinyanga Municipal', 'Mjini', 'Kaunda', '-3.67035', '33.42528', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(390, 'R92', 'Active', 'Tesha Shop', '500', 'Shinyanga', 'Shinyanga Municipal', 'Mjini', 'Kaunda', '-3.66933', '33.42165', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(391, 'R2835', 'Active', 'Ntunaguzi shop', '501', 'Shinyanga', 'Shinyanga Municipal', 'Mjini', 'Kaunda', '-3.67072', '-33.422586', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(392, 'R2837', 'Active', 'Gerald shop', '502', 'Shinyanga', 'Shinyanga Municipal', 'Mjini', 'Kaunda', 'None', 'None', '0001-01-01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(393, 'R68', 'Active', 'Mwamba shop', '503', 'Shinyanga', 'Shinyanga Municipal', 'Mjini', 'Miti Mirefu', '-3.67103', '33.42605', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(394, 'R7510', 'Active', 'Bahame Shop', '504', 'Shinyanga', 'Shinyanga Municipal', 'Mjini', 'Kaunda', '3.67118', '33.42529', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(395, 'R94', 'Active', 'Ford Shop', '505', 'Shinyanga', 'Shinyanga Municipal', 'Mjini', 'Miti Mirefu', '-3.66896', '33.42247', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(396, 'R96', 'Active', 'TANNA shop', '506', 'Shinyanga', 'Shinyanga Municipal', 'Mjini', 'Miti Mirefu', '-3.66703', '-33.42696', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(397, 'R67', 'Active', 'Recho shop', '507', 'Shinyanga', 'Shinyanga Municipal', 'Mjini', 'Miti Mirefu', '-3.67087', '33.42604', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(398, 'R7523', 'Active', 'Vaileth Shop', '508', 'Shinyanga', 'Shinyanga Municipal', 'Mjini', 'Miti Mirefu', '3.66885', '33.42849', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(399, 'R5977', 'Active', 'Musa shop', '509', 'Shinyanga', 'Shinyanga Municipal', 'Mjini', 'Miti Mirefu', '-3.66781', '-33.42228', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(400, 'R2836', 'Active', 'Rahel shop', '510', 'Shinyanga', 'Shinyanga Municipal', 'Mjini', 'Kaunda', 'None', 'None', '0001-01-01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(401, 'R2838', 'Active', 'Bony shop', '511', 'Shinyanga', 'Shinyanga Municipal', 'Mjini', 'Kaunda', 'None', 'None', '0001-01-01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(402, 'R2834', 'Active', 'Ezdon shop', '512', 'Shinyanga', 'Shinyanga Municipal', 'Mjini', 'Kaunda', '-3.6707', '-33.42585', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(403, 'R3038', 'Active', 'Denis shop', '513', 'Shinyanga', 'Shinyanga Municipal', 'Mjini', 'Kaunda', '-3.67091', '-33.42558', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(404, 'R7518', 'Active', 'Kwa Mama Carol', '514', 'Shinyanga', 'Shinyanga Municipal', 'Mjini', 'Kaunda', '3.67076', '33.42601', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(405, 'R7524', 'Active', 'Yuster Shop', '515', 'Shinyanga', 'Shinyanga Municipal', 'Mjini', 'Kaunda', '3.67196', '33.42549', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(406, 'R3456', 'Active', 'Mika Shop', '516', 'Manyara', 'Hanang District', 'Mogitu', 'Jorodom', '4.49471', '35.4004', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(407, 'R7478', 'Active', 'Dani Shop', '517', 'Manyara', 'Hanang District', 'Mogitu', 'Mogitu', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(408, 'R250', 'Active', 'Test Shop', '518', 'Dar es Salaam', 'Kinondoni', 'Msasani', 'Masaki', 'None', 'None', '0001-01-01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(409, 'R282', 'Active', 'John Doe', '519', 'Dar es Salaam', 'Kinondoni', 'Msasani', 'Masaki', 'None', 'None', '0001-01-01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(410, 'R7465', 'Active', 'Kassimu Shop', '520', 'Manyara', 'Babati Town', 'Mutuka', 'Mutuka', '4.1599', '35.83138', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(411, 'R7487', 'Active', 'Kwa Tarmo Shop', '521', 'Manyara', 'Babati Town', 'Mutuka', 'Mutuka', '4.16283', '35.82609', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(412, 'R7369', 'Active', 'Njiku Shop', '522', 'Manyara', 'Babati District', 'Mwada', 'Mwada', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(413, 'R7426', 'Active', ' Adam Shop', '523', 'Manyara', 'Babati District', 'Mwada', 'Mwada', '3.90608', '35.81438', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(414, 'R7464', 'Active', 'Imma Shop', '524', 'Manyara', 'Babati District', 'Mwada', 'Mwada', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(415, 'R683', 'Active', 'Donald shop', '525', 'Shinyanga', 'Shinyanga District', 'Mwakitolyo', 'Mwasenge', '-3.82218', '-33.40958', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(416, 'R59', 'Active', 'Nhungo shop', '526', 'Shinyanga', 'Shinyanga Municipal', 'Mwamalili', 'Mwamalili', '-3.54901', '33.45815', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(417, 'R2989', 'Active', 'Peter shop', '527', 'Shinyanga', 'Shinyanga District', 'Mwantini', 'Shatimba', 'None', 'None', '0001-01-01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(418, 'R2988', 'Active', 'Kazmiri shop', '528', 'Shinyanga', 'Shinyanga District', 'Mwantini', 'Zumve', '-3.64452', '-33.19994', '0001-01-01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(419, 'R7453', 'Active', 'Petro shop', '529', 'Shinyanga', 'Shinyanga Municipal', 'Mwawaza', 'Mwawaza', '-3.69288', '-33.33358', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(420, 'R124', 'Active', 'Mary shop', '530', 'Shinyanga', 'Kahama', 'Mwendakulima', 'Mwendakulima', '3.84317', '33.68195', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(421, 'R5747', 'Active', 'Rafaeli Shop', '531', 'Shinyanga', 'Kahama', 'Mwendakulima', 'Mwendakulima', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(422, 'R127', 'Active', 'Doto shop', '532', 'Shinyanga', 'Kahama', 'Mwendakulima', 'Mwendakulima', '3.84313', '32.68173', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(423, 'R7499', 'Active', 'Rehema Shop', '533', 'Shinyanga', 'Kahama', 'Mwendakulima', 'Mwendakulima', '-3.84282', '-32.68351', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(424, 'R123', 'Active', 'Mbela shop', '534', 'Shinyanga', 'Kahama', 'Mwendakulima', 'Mwendakulima', '3.84313', '32.68175', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(425, 'R2455', 'Active', 'Tesha shop', '535', 'Manyara', 'Babati Town', 'Nangara', 'Mkuyuni B', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(426, 'R7429', 'Active', 'Kamata Shop', '536', 'Manyara', 'Hanang District', 'Nangwa', 'Dirma', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(427, 'R4854', 'Active', 'David Shop', '537', 'Manyara', 'Hanang District', 'Nangwa', 'Nangwa', '4.50129', '35.44022', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(428, 'R4848', 'Active', 'Odilia shop', '538', 'Manyara', 'Hanang District', 'Nangwa', 'Nangwa', '-4.50123', '35.44253', '0001-01-01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(429, 'R6833', 'Active', 'Tango shop', '539', 'Manyara', 'Hanang District', 'Nangwa', 'Nangwa', '4.50105', '35.44023', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(430, 'R7482', 'Active', 'Jonikomedi shop', '540', 'Manyara', 'Hanang District', 'Nangwa', 'Nangwa', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(431, 'R7440', 'Active', 'Chacha shop', '541', 'Shinyanga', 'Shinyanga Municipal', 'Ndala', 'Mwamala', '-3.66967', '-33.4193', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(432, 'R5406', 'Active', 'Fares Shop', '542', 'Shinyanga', 'Shinyanga Municipal', 'Ndala', 'Ndala', '-3.67737', '-33.41293', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(433, 'R34', 'Active', 'Mlingi shop', '543', 'Shinyanga', 'Shinyanga Municipal', 'Ndala', 'Ndala', '-3.67535', '33.41112', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(434, 'R5830', 'Active', 'Juma shop', '544', 'Shinyanga', 'Kahama', 'Ngogwa', 'Kahanga', '-3.81727', '-32.43349', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(435, 'R7424', 'Active', 'Machibya shop', '545', 'Shinyanga', 'Kahama', 'Ngogwa', 'Ngogwa', '-3.77909', '-32.48177', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(436, 'R5808', 'Active', 'Robert Shop', '546', 'Shinyanga', 'Kahama', 'Ngogwa', 'Ngogwa', '-3.77963', '-32.48148', '0001-01-01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(437, 'R56', 'Active', 'Mpenda shop', '547', 'Shinyanga', 'Shinyanga Municipal', 'Ngokolo', 'Mabambasi', '-3.6658', '33.43724', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(438, 'R3299', 'Active', 'Brian shop', '548', 'Shinyanga', 'Shinyanga Municipal', 'Ngokolo', 'Majengo Mapya', '-3.65592', '-33.42381', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(439, 'R8', 'Active', 'Alphonce shop', '549', 'Shinyanga', 'Shinyanga Municipal', 'Ngokolo', 'Majengo Mapya', '-3.66078', '33.43081', '0001-01-01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(440, 'R7522', 'Active', 'Kwa Judi shop', '550', 'Shinyanga', 'Shinyanga Municipal', 'Ngokolo', 'Majengo Mapya', '3.665162', '33.41442', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(441, 'R7520', 'Active', 'Chiku Shop', '551', 'Shinyanga', 'Shinyanga Municipal', 'Ngokolo', 'Majengo Mapya', '3.65166', '33.41509', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(442, 'R66', 'Active', 'Colletha shop', '552', 'Shinyanga', 'Shinyanga Municipal', 'Ngokolo', 'Majengo Mapya', '-3.65383', '33.42252', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(443, 'R4', 'Active', 'Aziza Shop', '553', 'Shinyanga', 'Shinyanga Municipal', 'Ngokolo', 'Ngokolo', '-3.65694', '33.42427', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(444, 'R23', 'Active', 'Costa Shop', '554', 'Shinyanga', 'Shinyanga Municipal', 'Ngokolo', 'Ngokolo', '-3.65814', '33.42477', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(445, 'R2360', 'Active', 'Naomi shop', '555', 'Shinyanga', 'Shinyanga Municipal', 'Ngokolo', 'Ngokolo', '-3.65838', '-33.42567', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(446, 'R24', 'Active', 'Magreth Shop', '556', 'Shinyanga', 'Shinyanga Municipal', 'Ngokolo', 'Ngokolo', '-3.65844', '33.42519', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(447, 'R7', 'Active', 'Swedi shop', '557', 'Shinyanga', 'Shinyanga Municipal', 'Ngokolo', 'Ngokolo', '-3.6611', '33.4239', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(448, 'R17', 'Active', 'Gervas Shop', '558', 'Shinyanga', 'Shinyanga Municipal', 'Ngokolo', 'Ngokolo', '-3.65802', '33.42451', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(449, 'R2807', 'Active', 'Mwanzo Mgumu shop', '559', 'Shinyanga', 'Shinyanga Municipal', 'Ngokolo', 'Ngokolo', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(450, 'R4678', 'Active', 'Eden shop', '560', 'Shinyanga', 'Shinyanga Municipal', 'Ngokolo', 'Ngokolo', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(451, 'R25', 'Active', 'Michael Yobegwa shop', '561', 'Shinyanga', 'Shinyanga Municipal', 'Ngokolo', 'Ngokolo', '-3.65814', '33.42477', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(452, 'R10', 'Active', 'Hai shop', '562', 'Shinyanga', 'Shinyanga Municipal', 'Ngokolo', 'Ngokolo', '-3.65803', '33.42437', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(453, 'R64', 'Active', 'Nasoro shop', '563', 'Shinyanga', 'Shinyanga Municipal', 'Ngokolo', 'Ngokolo', '-3.65693', '33.4244', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(454, 'R60', 'Active', 'Kikula Shop', '564', 'Shinyanga', 'Shinyanga Municipal', 'Ngokolo', 'Ngokolo', '-3.65627', '33.41948', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(455, 'R26', 'Active', 'Luchagula Shop', '565', 'Shinyanga', 'Shinyanga Municipal', 'Ngokolo', 'Ngokolo', '-3.65847', '33.42445', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(456, 'R14', 'Active', 'Janet shop', '566', 'Shinyanga', 'Shinyanga Municipal', 'Ngokolo', 'Ngokolo', '-3.65887', '33.42433', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(457, 'R18', 'Active', 'Reuben Shop', '567', 'Shinyanga', 'Shinyanga Municipal', 'Ngokolo', 'Majengo Mapya', '-3.65045', '33.41481', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(458, 'R7432', 'Active', 'Levania shop', '568', 'Shinyanga', 'Shinyanga Municipal', 'Ngokolo', 'Majengo Mapya', '-3.65607', '-33.42559', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(459, 'R62', 'Active', 'Enos shop', '569', 'Shinyanga', 'Shinyanga Municipal', 'Ngokolo', 'Ndembezi', '-3.65137', '33.43485', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(460, 'R33', 'Active', 'Matambo shop', '570', 'Shinyanga', 'Shinyanga Municipal', 'Ngokolo', 'Ndembezi', '-3.64413', '-33.43414', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(461, 'R61', 'Active', 'Pendo shop', '571', 'Shinyanga', 'Shinyanga Municipal', 'Ngokolo', 'Ndembezi', '-3.662223', '33.436968', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(462, 'R63', 'Active', 'Vicent Shop', '572', 'Shinyanga', 'Shinyanga Municipal', 'Ngokolo', 'Ndembezi', '-3.65538', '33.437', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(463, 'R5578', 'Active', 'Joshua shop', '573', 'Manyara', 'Babati District', 'Nkaiti', 'Kakoi', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(464, 'R615', 'Active', 'Lydia shop', '574', 'Manyara', 'Babati District', 'Nkaiti', 'Minjingu', '-3.70293', '35.9272', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(465, 'R614', 'Active', 'Onesmo shop', '575', 'Manyara', 'Babati District', 'Nkaiti', 'Minjingu', '-3.71132', '35.91812', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(466, 'R612', 'Active', 'Mchungaji shop', '576', 'Manyara', 'Babati District', 'Nkaiti', 'Olasiti', '-3.69521', '35.93747', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(467, 'R5576', 'Active', 'Tumbo shop', '577', 'Manyara', 'Babati District', 'Nkaiti', 'Olasiti', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(468, 'R5579', 'Active', 'Mamiro shop', '578', 'Manyara', 'Babati District', 'Nkaiti', 'Olasiti', '-3.69547', '35.93716', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(469, 'R613', 'Active', 'Baba Jane shop', '579', 'Manyara', 'Babati District', 'Nkaiti', 'Olasiti', '-3.69591', '35.93782', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(470, 'R6931', 'Active', 'Alex Shop', '580', 'Manyara', 'Babati District', 'Nkaiti', 'Olasiti', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(471, 'R5577', 'Active', 'Mchungaji shop Olasite', '581', 'Manyara', 'Babati District', 'Nkaiti', 'Olasiti', '-3.69592', '35.93659', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(472, 'R7263', 'Active', 'Rift Valley shop', '582', 'Manyara', 'Babati District', 'Nkaiti', 'Vilima Vitatu', '3.78388', '35.78388', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(473, 'R212', 'Active', 'Nzata Shop', '583', 'Manyara', 'Babati District', 'Nkaiti', 'Vilima Vitatu', '-3.78358', '35.86322', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(474, 'R7494', 'Active', 'Wambura shop', '584', 'Shinyanga', 'Kahama', 'Nyandekwa', 'Kakebe', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(475, 'R128', 'Active', 'Magesa shop', '585', 'Shinyanga', 'Kahama', 'Nyandekwa', 'Lowa', '3.90869', '32.50217', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(476, 'R129', 'Active', 'Mkuki shop', '586', 'Shinyanga', 'Kahama', 'Nyandekwa', 'Lowa', '3.895', '32.45942', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(477, 'R3078', 'Active', 'Mzuka shop', '587', 'Shinyanga', 'Kahama', 'Nyandekwa', 'Lowa', '-3.89526', '-32.45958', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(478, 'R3076', 'Active', 'Tores shop', '588', 'Shinyanga', 'Kahama', 'Nyandekwa', 'Nyandekwa', '-3.90841', '-32.50283', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(479, 'R7435', 'Active', 'Chiza shop', '589', 'Shinyanga', 'Kahama', 'Nyandekwa', 'Nyandekwa', '-3.9086', '-32.50206', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(480, 'R3077', 'Active', 'Baraka shop', '590', 'Shinyanga', 'Kahama', 'Nyandekwa', 'Nyandekwa', '-3.90875', '-32.50198', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(481, 'R7493', 'Active', 'Salu shop', '591', 'Shinyanga', 'Kahama', 'Nyandekwa', 'Nyandekwa', '-3.8552', '-32.56112', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(482, 'R7496', 'Active', 'New Tores shop', '592', 'Shinyanga', 'Kahama', 'Nyandekwa', 'Nyandekwa', '-3.90848', '-32.5029', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(483, 'R101', 'Active', 'Sebastian shop', '593', 'Shinyanga', 'Kahama', 'Nyihogo', 'Bukondamoyo', '3.8377', '32.59278', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(484, 'R103', 'Active', 'Manyama Shop', '594', 'Shinyanga', 'Kahama', 'Nyihogo', 'Nyihogo', '3.83454', '32.59415', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(485, 'R115', 'Active', 'Ester shop', '595', 'Shinyanga', 'Kahama', 'Nyihogo', 'Nyihogo', '3.8324', '32.59891', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(486, 'R2213', 'Active', 'Elizabeth shop', '596', 'Shinyanga', 'Kahama', 'Nyihogo', 'Nyihogo', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(487, 'R74', 'Active', 'Miriango shop', '597', 'Shinyanga', 'Kahama', 'Nyihogo', 'Nyihogo', '3.8415', '33.59581', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(488, 'R73', 'Active', 'Haruna shop', '598', 'Shinyanga', 'Kahama', 'Nyihogo', 'Nyihogo', '3.8478', '33.59955', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(489, 'R201', 'Active', 'Mkali shop', '599', 'Shinyanga', 'Kahama', 'Nyihogo', 'Nyihogo', '-3.83016', '-32.60558', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(490, 'R685', 'Active', 'Samambile shop', '600', 'Shinyanga', 'Shinyanga District', 'Pandagichiza', 'Pandagichiza', '-3', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `retailers` (`id`, `retailerid`, `status`, `retailshop`, `phone`, `region`, `district`, `ward`, `village`, `latitude`, `longitude`, `startdate`, `created_at`, `updated_at`, `deleted_at`) VALUES
(491, 'R1843', 'Active', 'Mahela shop', '601', 'Shinyanga', 'Shinyanga District', 'Pandagichiza', 'Shilabela', '-3.55492', '-33.29496', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(492, 'R4771', 'Active', 'Kimweri shop', '602', 'Manyara', 'Babati District', 'Qash', 'Qash', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(493, 'R2419', 'Active', 'Bura shop', '603', 'Manyara', 'Babati District', 'Riroda', 'Riroda', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(494, 'R7460', 'Active', 'Petro shop', '604', 'Manyara', 'Babati District', 'Riroda', 'Riroda', '-4.30283', '35.64909', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(495, 'R200', 'Active', 'Andrea Shop Riroda', '605', 'Manyara', 'Babati District', 'Riroda', 'Riroda', '-4.30271', '35.64941', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(496, 'R6620', 'Active', 'Mazuri shop', '606', 'Shinyanga', 'Shinyanga District', 'Salawe', 'Amani', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(497, 'R6897', 'Active', 'Misalaba shop', '607', 'Shinyanga', 'Shinyanga District', 'Salawe', 'Nzoza', '-3.34729', '-32.86497', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(498, 'R6626', 'Active', 'Pamela shop', '608', 'Shinyanga', 'Shinyanga District', 'Salawe', 'Songambele', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(499, 'R6622', 'Active', 'Emmanuel shop', '609', 'Shinyanga', 'Shinyanga District', 'Salawe', 'Songambele', 'None', 'None', '0001-01-01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(500, 'R173', 'Active', 'Seif shop', '610', 'Shinyanga', 'Shinyanga District', 'Samuye', 'Ibingo', '-3.80647', '33.299', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(501, 'R161', 'Active', 'Hamis shop', '611', 'Shinyanga', 'Shinyanga District', 'Samuye', 'Ibingo', '-3.80651', '33.33297', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(502, 'R164', 'Active', 'Kizito shop', '612', 'Shinyanga', 'Shinyanga District', 'Samuye', 'Ibingo', '-3.80608', '33.33269', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(503, 'R168', 'Active', 'John shop', '613', 'Shinyanga', 'Shinyanga District', 'Samuye', 'Isela', '-3.78854', '33.35301', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(504, 'R167', 'Active', 'Bepe shop', '614', 'Shinyanga', 'Shinyanga District', 'Samuye', 'Ishinabulandi', '3.76326', '33.37441', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(505, 'R159', 'Active', 'Bupile shop', '615', 'Shinyanga', 'Shinyanga District', 'Samuye', 'Ishinabulandi', '-3.76269', '33.37366', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(506, 'R684', 'Active', 'Makonomalonja shop', '616', 'Shinyanga', 'Shinyanga District', 'Samuye', 'Masengwa', '-3.822338', '-33.40968', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(507, 'R5355', 'Active', 'Ndalo Shop', '617', 'Shinyanga', 'Shinyanga District', 'Samuye', 'Masengwa', '-3.82158', '-33.40957', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(508, 'R7446', 'Active', 'Lutema  shop', '618', 'Shinyanga', 'Shinyanga District', 'Samuye', 'Masengwa', '-3.82272', '33.40972', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(509, 'R7270', 'Active', 'Musa Shop', '619', 'Shinyanga', 'Shinyanga District', 'Samuye', 'Masengwa', '-3.82256', '-33.40971', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(510, 'R606', 'Active', 'Mode Shop', '620', 'Manyara', 'Babati Town', 'Sigino', 'Sigino', '-4.20885', '35.68498', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(511, 'R1736', 'Active', 'Ibrahim shop', '621', 'Manyara', 'Babati Town', 'Sigino', 'Sigino', '4.20857', '35.68746', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(512, 'R592', 'Active', 'Zacharia Shop', '622', 'Manyara', 'Babati Town', 'Sigino', 'Singu', '-4.20447', '35.63508', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(513, 'R675', 'Active', 'Gegona shop', '623', 'Manyara', 'Hanang District', 'Simbay', 'Simbay', '-4.55651', '35.5629', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(514, 'R676', 'Active', 'Mefurda shop', '624', 'Manyara', 'Hanang District', 'Simbay', 'Simbay', '-4.56203', '35.55934', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(515, 'R678', 'Active', 'Hhando shop', '625', 'Manyara', 'Hanang District', 'Simbay', 'Simbay', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(516, 'R677', 'Active', 'Daudi shop', '626', 'Manyara', 'Hanang District', 'Simbay', 'Simbay', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(517, 'R7441', 'Active', 'Abdilahi', '627', 'Manyara', 'Hanang District', 'Simbay', 'Simbay', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(518, 'R2234', 'Active', 'Mriri shop', '628', 'Manyara', 'Babati Town', 'Singe', 'Gendi Barazani', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(519, 'R6950', 'Active', 'Riverside shop', '629', 'Manyara', 'Hanang District', 'Sirop', 'Sirop', '4.4948', '35.40121', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(520, 'R166', 'Active', 'Peter Shop', '630', 'Shinyanga', 'Shinyanga District', 'Solwa', 'Manheigana', '-3.44016', '33.98971', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(521, 'R144', 'Active', 'Tungu shop', '631', 'Shinyanga', 'Shinyanga District', 'Solwa', 'Manheigana', '-3.44016', '32.98964', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(522, 'R158', 'Active', 'Nestory shop', '632', 'Shinyanga', 'Shinyanga District', 'Solwa', 'Manheigana', '-3.4402', '32.98983', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(523, 'R160', 'Active', 'Shija Shop', '633', 'Shinyanga', 'Shinyanga District', 'Solwa', 'Manheigana', '-3.56798', '33.23573', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(524, 'R6348', 'Active', 'Lubinza shop', '634', 'Shinyanga', 'Shinyanga District', 'Solwa', 'Manheigana', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(525, 'R207', 'Active', 'Masolwa Shop', '635', 'Shinyanga', 'Shinyanga District', 'Solwa', 'Mwasekagi', '-3.41957', '32.93113', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(526, 'R206', 'Active', 'Manyanya shop', '636', 'Shinyanga', 'Shinyanga District', 'Solwa', 'Mwasekagi', '-3.41879', '32.93116', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(527, 'R140', 'Active', 'Savelina Shop', '637', 'Shinyanga', 'Shinyanga District', 'Solwa', 'Solwa', '-3.50525', '33.07618', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(528, 'R209', 'Active', 'Yona shop', '638', 'Shinyanga', 'Shinyanga District', 'Solwa', 'Solwa', '-3.40322', '32.89735', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(529, 'R208', 'Active', 'Sayi shop', '639', 'Shinyanga', 'Shinyanga District', 'Solwa', 'Solwa', '-3.40186', '32.89711', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(530, 'R1694', 'Active', 'Awadhi shop', '640', 'Shinyanga', 'Shinyanga District', 'Solwa', 'Solwa', 'None', 'None', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(531, 'R153', 'Active', 'Yahaya shop', '641', 'Shinyanga', 'Shinyanga District', 'Tinde', 'Nsalala', '-3.87708', '33.194', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(532, 'R151', 'Active', 'Mazuli shop', '642', 'Shinyanga', 'Shinyanga District', 'Tinde', 'Nsalala', '-3.95675', '33.14864', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(533, 'R150', 'Active', 'Shija Shop', '643', 'Shinyanga', 'Shinyanga District', 'Tinde', 'Nsalala', '-3.87665', '33.19418', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(534, 'R532', 'Active', 'Mfanga Shop', '644', 'Manyara', 'Babati District', 'Ufana', 'Ufana', '-4.24365', '35.36171', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(535, 'R5489', 'Active', 'Kulwa shop', '645', 'Shinyanga', 'Shinyanga District', 'Usanda', 'Manyada', '-3.86253', '-33.30876', '0001-01-01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(536, 'R5490', 'Active', 'Hosea Shop', '646', 'Shinyanga', 'Shinyanga District', 'Usanda', 'Manyada', '-3.86222', '-33.30807', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(537, 'R146', 'Active', 'Mashala shop', '647', 'Shinyanga', 'Shinyanga District', 'Usanda', 'Singita', '-3.83439', '33.27971', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(538, 'R149', 'Active', 'Seleman shop', '648', 'Shinyanga', 'Shinyanga District', 'Usanda', 'Singita', '-3.83514', '33.27943', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(539, 'R6719', 'Active', 'Salaganda shop', '649', 'Shinyanga', 'Shinyanga District', 'Usanda', 'Singita', '-3.83438', '-33.27973', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(540, 'R6575', 'Active', 'Baraka shop', '650', 'Shinyanga', 'Shinyanga District', 'Usanda', 'Singita', '-3.83506', '-33.27925', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(541, 'R145', 'Active', 'Emmanuel Shop', '651', 'Shinyanga', 'Shinyanga District', 'Usanda', 'Singita', '-3.835', '33.27923', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(542, 'R172', 'Active', 'Mary Butondo shop', '652', 'Shinyanga', 'Shinyanga District', 'Usanda', 'Singita', '-3.83491', '33.27919', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(543, 'R157', 'Active', 'Shija Shop', '653', 'Shinyanga', 'Shinyanga District', 'Usule', 'Bukene', '-3.70336', '33.1874', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(544, 'R162', 'Active', 'Nageme shop', '654', 'Shinyanga', 'Shinyanga District', 'Usule', 'Bukene', '-3.7029', '33.1877', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(545, 'R163', 'Active', 'Juma shop', '655', 'Shinyanga', 'Shinyanga District', 'Usule', 'Bukene', '-3.71169', '33.2647', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(546, 'R171', 'Active', 'Anthony shop', '656', 'Shinyanga', 'Shinyanga District', 'Usule', 'Bukene', '-3.70347', '33.18732', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(547, 'R5674', 'Active', 'Andrea shop', '657', 'Shinyanga', 'Kahama', 'Zongomela', 'Ilindi', '-3.87151', '-32.60907', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(548, 'R5658', 'Active', 'Mheziwa shop', '658', 'Shinyanga', 'Kahama', 'Zongomela', 'Seeke', '-3.83441', '-32.53651', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(549, 'R5668', 'Active', 'Mama Kaijage shop', '659', 'Shinyanga', 'Kahama', 'Zongomela', 'Seeke', '-3.87129', '-32.57178', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(550, 'R130', 'Active', 'Malugu shop', '660', 'Shinyanga', 'Kahama', 'Zongomela', 'Zongomela', '3.83863', '32.58689', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(551, 'R5663', 'Active', 'Maneno shop', '661', 'Shinyanga', 'Kahama', 'Zongomela', 'Zongomela', '-3.862443', '-32.54217', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(552, 'R7484', 'Active', 'Madaku shop', '662', 'Shinyanga', 'Kahama', 'Zongomela', 'Zongomela', '-3.8627', '-32.5417', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(553, 'R7491', 'Active', 'Lesa shop', '663', 'Shinyanga', 'Kahama', 'Zongomela', 'Zongomela', '-3.86177', '-32.54803', '0000-00-00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `description`, `level`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', 'Admin Role', 5, '2017-04-25 07:42:22', '2017-04-25 07:42:22'),
(2, 'User', 'user', 'User Role', 1, '2017-04-25 07:42:22', '2017-04-25 07:42:22'),
(3, 'Unverified', 'unverified', 'Unverified Role', 0, '2017-04-25 07:42:22', '2017-04-25 07:42:22');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 4, '2017-04-25 07:42:23', '2017-04-25 07:42:23'),
(2, 2, 5, '2017-04-25 07:42:23', '2017-04-25 07:42:23'),
(3, 3, 6, '2017-04-25 07:44:57', '2017-04-25 07:44:57'),
(4, 1, 7, '2017-04-25 08:41:41', '2017-04-25 08:41:41'),
(6, 1, 9, '2017-04-26 03:05:59', '2017-04-26 03:05:59'),
(9, 1, 8, '2017-04-26 03:10:26', '2017-04-26 03:10:26');

-- --------------------------------------------------------

--
-- Table structure for table `social_logins`
--

CREATE TABLE `social_logins` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `provider` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `social_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE `themes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `taggable_id` int(10) UNSIGNED NOT NULL,
  `taggable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `name`, `link`, `notes`, `status`, `taggable_id`, `taggable_type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Default', 'null', NULL, 1, 1, 'theme', '2017-04-25 07:42:22', '2017-04-25 07:42:22', NULL),
(2, 'Darkly', 'https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/darkly/bootstrap.min.css', NULL, 1, 2, 'theme', '2017-04-25 07:42:22', '2017-04-25 07:42:22', NULL),
(3, 'Cyborg', 'https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/cyborg/bootstrap.min.css', NULL, 1, 3, 'theme', '2017-04-25 07:42:22', '2017-04-25 07:42:22', NULL),
(4, 'Cosmo', 'https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/cosmo/bootstrap.min.css', NULL, 1, 4, 'theme', '2017-04-25 07:42:22', '2017-04-25 07:42:22', NULL),
(5, 'Cerulean', 'https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/cerulean/bootstrap.min.css', NULL, 1, 5, 'theme', '2017-04-25 07:42:22', '2017-04-25 07:42:22', NULL),
(6, 'Flatly', 'https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/flatly/bootstrap.min.css', NULL, 1, 6, 'theme', '2017-04-25 07:42:22', '2017-04-25 07:42:22', NULL),
(7, 'Journal', 'https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/journal/bootstrap.min.css', NULL, 1, 7, 'theme', '2017-04-25 07:42:22', '2017-04-25 07:42:22', NULL),
(8, 'Lumen', 'https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/lumen/bootstrap.min.css', NULL, 1, 8, 'theme', '2017-04-25 07:42:22', '2017-04-25 07:42:22', NULL),
(9, 'Paper', 'https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/paper/bootstrap.min.css', NULL, 1, 9, 'theme', '2017-04-25 07:42:22', '2017-04-25 07:42:22', NULL),
(10, 'Readable', 'https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/readable/bootstrap.min.css', NULL, 1, 10, 'theme', '2017-04-25 07:42:22', '2017-04-25 07:42:23', NULL),
(11, 'Sandstone', 'https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/sandstone/bootstrap.min.css', NULL, 1, 11, 'theme', '2017-04-25 07:42:22', '2017-04-25 07:42:23', NULL),
(12, 'Simplex', 'https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/simplex/bootstrap.min.css', NULL, 1, 12, 'theme', '2017-04-25 07:42:22', '2017-04-25 07:42:23', NULL),
(13, 'Slate', 'https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/slate/bootstrap.min.css', NULL, 1, 13, 'theme', '2017-04-25 07:42:22', '2017-04-25 07:42:23', NULL),
(14, 'Spacelab', 'https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/spacelab/bootstrap.min.css', NULL, 1, 14, 'theme', '2017-04-25 07:42:22', '2017-04-25 07:42:23', NULL),
(15, 'Superhero', 'https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/superhero/bootstrap.min.css', NULL, 1, 15, 'theme', '2017-04-25 07:42:22', '2017-04-25 07:42:23', NULL),
(16, 'United', 'https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/united/bootstrap.min.css', NULL, 1, 16, 'theme', '2017-04-25 07:42:22', '2017-04-25 07:42:23', NULL),
(17, 'Yeti', 'https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/yeti/bootstrap.min.css', NULL, 1, 17, 'theme', '2017-04-25 07:42:22', '2017-04-25 07:42:23', NULL),
(18, 'Bootstrap 4.0.0 Alpha', 'https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css', NULL, 1, 18, 'theme', '2017-04-25 07:42:22', '2017-04-25 07:42:23', NULL),
(19, 'Materialize', 'https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css', NULL, 1, 19, 'theme', '2017-04-25 07:42:22', '2017-04-25 07:42:23', NULL),
(20, 'Bootstrap Material Design 0.3.0', 'https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.3.0/css/material-fullpalette.min.css', NULL, 1, 20, 'theme', '2017-04-25 07:42:22', '2017-04-25 07:42:23', NULL),
(21, 'Bootstrap Material Design 0.5.10', 'https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.5.10/css/bootstrap-material-design.min.css', NULL, 1, 21, 'theme', '2017-04-25 07:42:22', '2017-04-25 07:42:23', NULL),
(22, 'Bootstrap Material Design 4.0.0', 'https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/4.0.0/bootstrap-material-design.min.css', NULL, 1, 22, 'theme', '2017-04-25 07:42:22', '2017-04-25 07:42:23', NULL),
(23, 'Bootstrap Material Design 4.0.2', 'https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/4.0.2/bootstrap-material-design.min.css', NULL, 1, 23, 'theme', '2017-04-25 07:42:22', '2017-04-25 07:42:23', NULL),
(24, 'mdbootstrap', 'https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.3.1/css/mdb.min.css', NULL, 1, 24, 'theme', '2017-04-25 07:42:22', '2017-04-25 07:42:23', NULL),
(25, 'bootflat', 'https://cdnjs.cloudflare.com/ajax/libs/bootflat/2.0.4/css/bootflat.min.css', NULL, 1, 25, 'theme', '2017-04-25 07:42:22', '2017-04-25 07:42:23', NULL),
(26, 'flat-ui', 'https://cdnjs.cloudflare.com/ajax/libs/flat-ui/2.3.0/css/flat-ui.min.css', NULL, 1, 26, 'theme', '2017-04-25 07:42:22', '2017-04-25 07:42:23', NULL),
(27, 'm8tro-bootstrap', 'https://cdnjs.cloudflare.com/ajax/libs/m8tro-bootstrap/3.3.7/m8tro.min.css', NULL, 1, 27, 'theme', '2017-04-25 07:42:22', '2017-04-25 07:42:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `signup_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signup_confirmation_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signup_sm_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `first_name`, `last_name`, `email`, `password`, `remember_token`, `activated`, `token`, `signup_ip_address`, `signup_confirmation_ip_address`, `signup_sm_ip_address`, `admin_ip_address`, `updated_ip_address`, `deleted_ip_address`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 'dreynolds', 'Bernard', 'Renner', 'admin@admin.com', '$2y$10$4Qr5DZ4PvoM0BSVX0HLMouZwsj2IpsbWdIV0wpZntp8jovKNWqy82', NULL, 1, 'td6QN4pLAZP5kmDyFw0uJ1JsIfnKL5DoqPFcuhTXIt6kFaOJunHJ7Q8ZK9dEp7ej', NULL, '145.133.79.252', NULL, '146.136.187.249', NULL, NULL, '2017-04-25 07:42:23', '2017-04-25 07:42:23', NULL),
(5, 'isabell35', 'Erwin', 'Nienow', 'user@user.com', '$2y$10$8KVC69RjdmzfM3Wpr2MeXeyjAtUTaUbyl6QE7bsvXVHP1iYZy9zCO', NULL, 1, 'TFC8M0NLUbuHc09ffg6CuQyXs11VRDwMoXM3tzBzGw7f2jFSOzc10KtOXTQgBqwC', '30.46.122.238', '229.247.141.173', NULL, NULL, NULL, NULL, '2017-04-25 07:42:23', '2017-04-25 07:42:23', NULL),
(6, 'Dennis', 'Materu', 'Christian', 'pangdeny@gmail.com', '$2y$10$4Qr5DZ4PvoM0BSVX0HLMouZwsj2IpsbWdIV0wpZntp8jovKNWqy82', 'Xqyn1jFvCRcz9Bo25tdx3EbOgTW5TjTINPYLJahYNfPXLr3EsUagTAmD8Uye', 1, 'qBOdPnntXhzcfTxRTq98da4t0gxanhR8KoJ4Q1549iaCmZay5Eji7zLzK8vLjFNh', '::1', NULL, NULL, NULL, '::1', NULL, '2017-04-25 07:44:57', '2017-04-25 08:11:38', NULL),
(7, 'Siah', 'Siah', 'Mater', 'siah@yahoo.com', '$2y$10$PJlJHq0OtthCutfMjGUmfeo/UZafe705gxqIcsWDrCEuFgGhfOeya', '1LZNGmMyXhtGnMXQnoUVEZNWKRn49bLvOsEcO1esdUwkGsfUE5hm4kdf1Jq7', 1, 'Y2NOBbAu5q5Spz1jsFhlaVogdzz9qyRG3ivgHyxMDTBrqTIhdTrwibvm6GjlOnEz', NULL, NULL, NULL, '::1', '::1', NULL, '2017-04-25 08:41:41', '2017-04-26 03:08:19', NULL),
(8, 'babyg', 'baby', 'Goodluck', 'babyg@gmail.com', '$2y$10$1lo.BNF9li6eN6fPWGRaWeYvZuAhywNAE6DXMD89ANvkdSe2bIGQe', 'YBdhR57wp1hkujBybf5YoSENFb8DkPQN30gdXiuEPoHEJGd760fjX2s8Cyit', 1, 'q0UKbKQYM3pRObP8InLQtku8EgpzZbz54iMeBzOJDgOIhKUOqNn6maJuf7oC59Y9', NULL, NULL, NULL, '::1', '::1', NULL, '2017-04-25 23:50:17', '2017-04-26 03:09:57', NULL),
(9, 'harvest', 'Harvest', 'Materu', 'harvest@gmail.com', '$2y$10$Ik0A4I1bkCaccyc.VLneheOfanAWmK3xThJxqLqwidpx58IVJHKW.', NULL, 1, 'PrWOQujy34LZTEDHFL6zkCAMM4h4c8QXgkyuqlHhDm9NDi2M5JZEJ4Wh3SqoMHCy', NULL, NULL, NULL, '::1', NULL, NULL, '2017-04-26 03:05:59', '2017-04-26 03:05:59', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activations`
--
ALTER TABLE `activations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activations_user_id_index` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `paymentrequest`
--
ALTER TABLE `paymentrequest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_slug_unique` (`slug`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_user_permission_id_index` (`permission_id`),
  ADD KEY `permission_user_user_id_index` (`user_id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profiles_theme_id_foreign` (`theme_id`),
  ADD KEY `profiles_user_id_index` (`user_id`);

--
-- Indexes for table `retailers`
--
ALTER TABLE `retailers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `retailers_retailerid_unique` (`retailerid`),
  ADD UNIQUE KEY `retailers_phone_unique` (`phone`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_role_id_index` (`role_id`),
  ADD KEY `role_user_user_id_index` (`user_id`);

--
-- Indexes for table `social_logins`
--
ALTER TABLE `social_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `social_logins_user_id_index` (`user_id`);

--
-- Indexes for table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `themes_name_unique` (`name`),
  ADD UNIQUE KEY `themes_link_unique` (`link`),
  ADD KEY `themes_taggable_id_taggable_type_index` (`taggable_id`,`taggable_type`),
  ADD KEY `themes_id_index` (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_name_unique` (`name`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activations`
--
ALTER TABLE `activations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `paymentrequest`
--
ALTER TABLE `paymentrequest`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `permission_user`
--
ALTER TABLE `permission_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `retailers`
--
ALTER TABLE `retailers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=554;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `social_logins`
--
ALTER TABLE `social_logins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `activations`
--
ALTER TABLE `activations`
  ADD CONSTRAINT `activations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_theme_id_foreign` FOREIGN KEY (`theme_id`) REFERENCES `themes` (`id`),
  ADD CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `social_logins`
--
ALTER TABLE `social_logins`
  ADD CONSTRAINT `social_logins_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
