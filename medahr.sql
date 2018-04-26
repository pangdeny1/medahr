-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2018 at 09:47 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medahr`
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
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` int(191) NOT NULL,
  `bankname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bankaccount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banklocation` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `bankname`, `bankaccount`, `banklocation`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'CRDB', '', '', NULL, NULL, NULL),
(2, 'NBC BANK', '', '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` int(10) UNSIGNED NOT NULL,
  `branchname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branclocation` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `branchname`, `branclocation`, `created_at`, `updated_at`) VALUES
(1, 'Arusha', '', NULL, NULL),
(2, 'Mtwara', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `coycode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coyname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gstno` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `companynumber` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `regoffice1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `regoffice2` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `regoffice3` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `regoffice4` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `regoffice5` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `regoffice6` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fax` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currentdefault` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pytdiscountact` int(11) NOT NULL,
  `creditorsact` int(11) NOT NULL,
  `payrollact` int(11) NOT NULL,
  `grnact` int(11) NOT NULL,
  `exchangediffact` int(11) NOT NULL,
  `purchasesexchangediffact` int(11) NOT NULL,
  `retainedearnings` int(11) NOT NULL,
  `gillink_debtors` int(11) NOT NULL,
  `gillink_creditors` int(11) NOT NULL,
  `gillink_dstock` int(11) NOT NULL,
  `freightact` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `coycode`, `coyname`, `gstno`, `companynumber`, `regoffice1`, `regoffice2`, `regoffice3`, `regoffice4`, `regoffice5`, `regoffice6`, `telephone`, `fax`, `email`, `currentdefault`, `pytdiscountact`, `creditorsact`, `payrollact`, `grnact`, `exchangediffact`, `purchasesexchangediffact`, `retainedearnings`, `gillink_debtors`, `gillink_creditors`, `gillink_dstock`, `freightact`, `created_at`, `updated_at`) VALUES
(1, 'demo', 'demo', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cost_centers`
--

CREATE TABLE `cost_centers` (
  `id` int(10) UNSIGNED NOT NULL,
  `costcentername` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `costcenterdesc` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `countryname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `countryname`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Tanzania', NULL, NULL, NULL),
(2, 'Others', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `deliverynotes`
--

CREATE TABLE `deliverynotes` (
  `id` int(10) UNSIGNED NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `retailerid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `onelitre` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fivelitre` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tenlitre` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twentylitre` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `departmentname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departmentlocation` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `departmentname`, `departmentlocation`, `created_at`, `updated_at`) VALUES
(1, 'Accounts', '', NULL, NULL),
(2, 'Marketing', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` int(10) UNSIGNED NOT NULL,
  `districtname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `districtname`, `country_id`, `region_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Ilala', 1, 1, NULL, NULL, NULL),
(2, 'Kinondoni', 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employeestatutes`
--

CREATE TABLE `employeestatutes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employeestatutes`
--

INSERT INTO `employeestatutes` (`id`, `name`, `desc`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Active', '', NULL, NULL, NULL),
(2, 'In Active', '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employementstatus`
--

CREATE TABLE `employementstatus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employementstatus`
--

INSERT INTO `employementstatus` (`id`, `name`, `desc`, `created_at`, `updated_at`, `deleted_at`) VALUES
(10, 'Salary', '', NULL, NULL, NULL),
(20, 'Hourly', '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `endcontractreasons`
--

CREATE TABLE `endcontractreasons` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deasc` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `endcontractreasons`
--

INSERT INTO `endcontractreasons` (`id`, `name`, `deasc`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Resign ', '', NULL, NULL, NULL),
(2, 'Terminated', '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `genders`
--

CREATE TABLE `genders` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `genders`
--

INSERT INTO `genders` (`id`, `name`, `desc`, `created_at`, `updated_at`, `deleted_at`) VALUES
('1', 'FEMALE', '', NULL, NULL, NULL),
('2', 'MALE', '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobgroups`
--

CREATE TABLE `jobgroups` (
  `id` int(10) UNSIGNED NOT NULL,
  `jobgroupname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jobgroupdesc` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobgroups`
--

INSERT INTO `jobgroups` (`id`, `jobgroupname`, `jobgroupdesc`, `level`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Directors', 'Directorrs', '', NULL, NULL, NULL),
(2, 'Managers', 'Managers', '', NULL, NULL, NULL),
(3, 'Administrator', 'Admin', '', NULL, NULL, NULL),
(4, 'Officers', 'Officers', '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(10) UNSIGNED NOT NULL,
  `jobname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jobdesc` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jobgroup` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `jobname`, `jobdesc`, `jobgroup`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'IT System Manager Meda TZA', 'To manage All Issues regarding ITS for MEDA TZA', '', '2018-04-13 12:19:34', '2018-04-13 13:47:08', NULL),
(6, 'System Analyst', 'Will Analyse all the systems issues and report to different clients', '', '2018-04-14 03:51:30', '2018-04-14 03:51:30', NULL),
(7, 'Java Programmer', 'Program All the Required Systems', '', '2018-04-14 03:52:10', '2018-04-14 03:52:10', NULL),
(8, 'Accounts', 'Acccc', '2', '2018-04-14 03:57:07', '2018-04-14 06:14:39', NULL),
(9, 'Accounts', 'Accounts 1', '', '2018-04-14 03:57:18', '2018-04-14 03:57:18', NULL),
(10, 'Accounts 3', 'Accounts 3', '2', '2018-04-14 03:57:34', '2018-04-14 11:31:49', NULL),
(11, 'Admin two', 'Administrator one', '3', '2018-04-14 03:57:47', '2018-04-14 11:52:54', NULL),
(12, 'IT System Manager 3', 'onclick=\"return confirm(\'Are you sure you want to Delete overhead record\')\"', '', '2018-04-14 03:58:02', '2018-04-14 03:58:02', NULL),
(13, 'recofs', 'Refords ee', '', '2018-04-14 03:58:24', '2018-04-14 03:58:24', NULL),
(14, 'Job Desc', 'Desc', '', '2018-04-14 03:58:35', '2018-04-14 03:58:35', NULL),
(15, 'It Ted', 'Tecnj', '', '2018-04-14 03:59:17', '2018-04-14 03:59:17', NULL),
(16, 'Ricardo', 'Kaka', '1', '2018-04-14 03:59:29', '2018-04-14 11:29:35', NULL),
(17, 'blog dc', 'bloggg', '1', '2018-04-14 05:30:01', '2018-04-14 05:30:01', NULL),
(18, 'Mentoring Gairo', 'gairo', '2', '2018-04-14 05:30:18', '2018-04-14 07:21:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `maritalstatus`
--

CREATE TABLE `maritalstatus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `maritalstatus`
--

INSERT INTO `maritalstatus` (`id`, `name`, `desc`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Single', 'Married', NULL, NULL, NULL),
(2, 'Married', '', NULL, NULL, NULL);

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
(13, '2017_04_28_072350_create_retailers_table', 1),
(14, '2017_04_28_163420_create_payment_request_table', 1),
(15, '2017_04_29_112004_create_voucher_issuance', 1),
(16, '2017_04_29_115315_create_delivery_notes', 1),
(17, '2017_05_09_145345_create_table_redemption', 1),
(18, '2017_05_29_154703_create_employees_table', 1),
(19, '2017_05_30_153246_employee_table_renaming_title', 1),
(20, '2017_06_08_134914_create_country_table', 1),
(21, '2017_06_08_134939_create_region_table', 1),
(22, '2017_06_08_134950_create_district_table', 1),
(23, '2017_06_08_162707_create_gender_table', 1),
(24, '2017_06_08_162840_create_jobs_table', 1),
(25, '2017_06_08_162922_create_employee_status_table', 1),
(26, '2017_06_08_163022_create_employee_paytype_table', 1),
(27, '2017_06_08_163055_create_employee_endofcontract_reasons_table', 1),
(28, '2017_06_09_050437_create_employement_status_reasons_table', 1),
(29, '2017_06_09_050725_create_marital_status_reasons_table', 1),
(30, '2017_06_09_051117_create_pay_period_table', 1),
(31, '2017_06_09_112512_create_pension_table', 1),
(32, '2017_06_09_115145_create_depertment_table', 1),
(33, '2017_06_09_115202_create_costcenter_table', 1),
(34, '2018_04_14_071429_create_jobgroups_table', 2),
(35, '2018_04_14_080857_add_jobgroup_to_jobs', 3),
(36, '2018_04_15_105256_new_table', 4),
(37, '2018_04_15_121647_create_table_banks', 5),
(38, '2018_04_17_143314_create_social_security_schemes_table', 6),
(39, '2018_04_17_144321_create_h_d_m_fs_table', 6),
(40, '2018_04_17_144549_create_health_insuarances_table', 6),
(41, '2018_04_17_150341_create_tax_tables_table', 6),
(42, '2018_04_17_151154_create_departments_table', 6),
(43, '2018_04_17_151217_create_branches_table', 6),
(44, '2018_04_17_151313_create_companies_table', 6),
(45, '2018_04_17_154737_add_colums_to_employees_tables', 6),
(46, '2018_04_17_155756_create_cost_centers_table', 6),
(47, '2018_04_18_072313_create_yes_or_nos_table', 7),
(48, '2018_04_18_084146_update_table_health', 8),
(49, '2018_04_18_084446_update_table_hdmf', 8),
(50, '2018_04_23_095740_Add_company_name_field', 9),
(51, '2018_04_23_100510_create_prlemployementstatuses_table', 9);

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
-- Table structure for table `paytypes`
--

CREATE TABLE `paytypes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `paytypes`
--

INSERT INTO `paytypes` (`id`, `name`, `desc`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Salary', '', NULL, NULL, NULL),
(2, 'Hourly', '', NULL, NULL, NULL);

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
-- Table structure for table `prlemployeemaster`
--

CREATE TABLE `prlemployeemaster` (
  `employeeid` int(10) UNSIGNED NOT NULL,
  `employeecode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tittle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middlename` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone1comment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone2` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone2comment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email1comment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email2` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email2comment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `atmnumber` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bankid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ssnumber` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hdmfnumber` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hdmfcode` int(11) DEFAULT NULL,
  `isPension` int(11) NOT NULL,
  `pencode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isHdmf` int(11) NOT NULL,
  `isTaxed` int(11) NOT NULL,
  `isGratuity` int(11) NOT NULL,
  `isHeslb` int(11) NOT NULL,
  `phnumber` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `healthcode` int(11) DEFAULT NULL,
  `taxactnumber` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthdate` date NOT NULL,
  `hiredate` date NOT NULL,
  `terminatedate` date DEFAULT NULL,
  `probdate` date DEFAULT NULL,
  `retireddate` date DEFAULT NULL,
  `paytype` int(11) NOT NULL,
  `payperiodid` int(11) NOT NULL,
  `periodrate` decimal(12,2) DEFAULT NULL,
  `hourlyrate` decimal(12,2) DEFAULT NULL,
  `glactcode` int(11) NOT NULL,
  `marital` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taxstatusid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employmentid` int(11) NOT NULL,
  `active` int(11) DEFAULT NULL,
  `terminatereason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `suspfrom` date NOT NULL,
  `suspto` date NOT NULL,
  `companyid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branchid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deptid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jobgroupid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jobid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `costcenterid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employeepicture` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prlemployeemaster`
--

INSERT INTO `prlemployeemaster` (`employeeid`, `employeecode`, `tittle`, `lastname`, `firstname`, `middlename`, `address1`, `address2`, `city`, `state`, `zip`, `country`, `gender`, `phone1`, `phone1comment`, `phone2`, `phone2comment`, `email1`, `email1comment`, `email2`, `email2comment`, `atmnumber`, `bankid`, `ssnumber`, `hdmfnumber`, `hdmfcode`, `isPension`, `pencode`, `isHdmf`, `isTaxed`, `isGratuity`, `isHeslb`, `phnumber`, `healthcode`, `taxactnumber`, `birthdate`, `hiredate`, `terminatedate`, `probdate`, `retireddate`, `paytype`, `payperiodid`, `periodrate`, `hourlyrate`, `glactcode`, `marital`, `taxstatusid`, `employmentid`, `active`, `terminatereason`, `suspfrom`, `suspto`, `companyid`, `branchid`, `deptid`, `jobgroupid`, `jobid`, `costcenterid`, `position`, `employeepicture`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '', '', 'Materu', 'Dennis', 'M', NULL, '', '1', '1', NULL, '1', '2', NULL, NULL, '', '', 'pangdeny@yahoo.com', '', '', '', '888777777r5654', '2', '34232424', '343434343', NULL, 1, NULL, 1, 1, 0, 0, '34535345345fp', NULL, '', '0000-11-30', '2013-08-21', '0000-00-00', '0000-00-00', '0000-00-00', 1, 0, '32000000.00', '0.00', 0, '', '', 0, 1, '1', '0000-00-00', '0000-00-00', NULL, NULL, NULL, '', '7', NULL, '', '', NULL, '2018-04-18 08:41:34', NULL),
(2, 'w', 'MR', 'Mhatya', 'Jona', 'f', 'dddddd', '', '2', '2', NULL, '1', '2', NULL, '9999', '', '', 'pangdeny@gmail.com', '', '', '', 'rerer', '1', NULL, NULL, NULL, 1, NULL, 1, 1, 0, 0, NULL, NULL, '', '2018-09-04', '2017-01-01', '2030-01-01', '2017-01-01', '2030-01-01', 1, 10, '9200000.00', '0.00', 0, '', '', 1, 1, '1', '2000-01-01', '1970-01-01', NULL, NULL, NULL, '', '2', NULL, '', '', '2018-04-14 12:19:33', '2018-04-18 08:42:48', NULL),
(3, 'xx1', 'MR', 'Materu', 'Christian', 'Jonathan', 'P O BOX 2017', '1', '1', '1', '255', '1', '1', '0754977618', '0754977618 comment', '', '', 'employee@email.com', '', '', '', '01j2004003445', '1', 'NHIFNumber444', 'hdmfnumber0018', 0, 0, 'NSSF', 0, 0, 0, 0, 'NHIFNumber', 0, 'TIN_Number', '1959-04-21', '2000-04-01', '2028-04-19', '0000-00-00', '0000-00-00', 1, 1, '7500000.00', '12000.00', 0, '1', '', 1, 1, '1', '0000-00-00', '0000-00-00', 'TMS', '2', '1', '1', '2', '1', '1', 'image.jpg', '2018-04-14 21:00:00', '2018-04-17 11:25:21', NULL),
(4, 'xx1', 'MR', 'James Rodrig', 'Koteyi', 'Jamson', 'P O BOX 3010 KCMC Moshi', '1', '2', '2', '+255', '2', 'M', '0717990638', 'Am a personal with integrity', '', '', 'jamson@email.com', '', '', '', 'CRDB00177788999', 'NBC', 'NSSF01998922', 'hdmfnumber0018', 0, 0, 'NSSF', 0, 0, 0, 0, 'NHIFNumber', 0, 'TIN_Number', '1959-01-01', '2000-01-01', '2028-12-31', '2000-12-31', '0000-00-00', 2, 1, '9800000.00', '152300.00', 0, '1', '', 1, 2, '2', '0000-00-00', '0000-00-00', 'TMS', '2', '1', '1', '14', '1', '1', 'image.jpg', '2018-04-14 21:00:00', '2018-04-15 09:39:08', NULL),
(5, 'w', 'MR', 'Dennis', 'Bryton', 'C', 'P O BOX 3010 KCMC Moshi', '', NULL, NULL, '255', '1', '1', '0717990638', 'bryton sone of Dennis', '', '', 'bryton@dennis.com', '', '', '', '9777777', '1', 'bryton sone of Dennis', 'fgdrddffd', NULL, 1, '1', 1, 1, 0, 0, 'hghghgh', NULL, '', '2018-04-09', '2018-04-26', '2013-08-28', '2018-03-07', NULL, 1, 10, NULL, NULL, 0, '1', '', 1, 1, '1', '1900-01-01', '1900-01-01', '1', '1', '1', NULL, NULL, NULL, '', NULL, '2018-04-23 10:44:35', '2018-04-23 10:44:35', NULL),
(6, 'w', 'MR', 'Sembago', 'Fadhili', NULL, 'DSFSDFSDFSDF', '', '1', '1', '4444', '1', '1', '0754977618', NULL, '', '', 'pangdeny@gmail.com', '', '', '', '43dsfgsdfsd', '1', NULL, '23232', NULL, 1, '1', 1, 1, 0, 0, '232323', NULL, '', '2018-04-19', '2018-04-17', '2018-04-14', '2018-04-26', '2018-04-06', 1, 10, '42000000.00', NULL, 0, '1', '', 1, 1, '1', '1900-01-01', '1900-01-01', NULL, NULL, NULL, '1', '2', NULL, '', NULL, '2018-04-23 10:51:45', '2018-04-23 11:07:04', NULL),
(7, 'w', 'MR', 'Materu', 'Eline', 'C', '11', '', '1', '1', '32222', '2', '1', '23111', 'dfsdsssdfd', '', '', 'grap@gg.com', '', '', '', '434xxx', '1', 'dfsdsssdfd', 'qqq', NULL, 2, '2', 2, 2, 0, 0, 'q', NULL, '', '2018-04-03', '2018-07-27', '2013-08-07', '2018-06-19', '2028-01-25', 1, 10, '7800000.00', '3000.00', 0, '1', '', 1, 1, '1', '1900-01-01', '1900-01-01', NULL, NULL, NULL, '1', '2', NULL, '', NULL, '2018-04-23 11:00:29', '2018-04-23 11:06:49', NULL),
(8, 'w', 'MR', 'adk', 'sawe', 'M', NULL, '', NULL, NULL, NULL, NULL, '1', NULL, NULL, '', '', 'pangdeny@gmail.com', '', '', '', '1323', '1', NULL, NULL, NULL, 1, '1', 1, 1, 0, 0, NULL, NULL, '', '2018-03-31', '2018-04-04', NULL, NULL, NULL, 1, 10, '1233.00', '22111.00', 0, '1', '', 1, 1, '1', '1900-01-01', '1900-01-01', '1', '1', '1', '1', '2', NULL, '', NULL, '2018-04-23 11:06:26', '2018-04-23 11:06:26', NULL),
(9, 'w', 'MR', 'test', 'Meda', NULL, NULL, '', NULL, NULL, NULL, NULL, '1', NULL, 'ddd', '', '', 'ffff@ggg.com', '', '', '', NULL, '1', 'ddd', NULL, NULL, 1, '1', 1, 1, 0, 0, NULL, NULL, '', '2018-04-02', '2018-04-26', NULL, NULL, NULL, 1, 10, '45333000.00', NULL, 0, '1', '', 1, 1, '1', '1900-01-01', '1900-01-01', '1', '1', '1', '1', '2', NULL, '', NULL, '2018-04-23 11:20:32', '2018-04-23 11:20:32', NULL),
(10, 'w', 'MR', 'demo', 'test', 'h', NULL, '', NULL, NULL, NULL, NULL, '1', '0754977618', 'uuu', '', '', 'drrr@kk.ool', '', '', '', '43dsfgsdfsd', '1', 'uuu', NULL, NULL, 1, '1', 1, 1, 0, 0, NULL, NULL, '', '1973-08-22', '2015-07-14', NULL, NULL, NULL, 1, 10, '8900000.00', NULL, 0, '1', '', 1, 1, '1', '1900-01-01', '1900-01-01', '1', '1', '1', '1', '2', NULL, '', NULL, '2018-04-23 11:35:29', '2018-04-23 11:35:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `prlemploymentstatus`
--

CREATE TABLE `prlemploymentstatus` (
  `id` int(10) UNSIGNED NOT NULL,
  `employementdesc` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prlemploymentstatus`
--

INSERT INTO `prlemploymentstatus` (`id`, `employementdesc`, `created_at`, `updated_at`) VALUES
(1, 'Full Time', NULL, NULL),
(2, 'Part Time', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `prlhdmftable`
--

CREATE TABLE `prlhdmftable` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rangefrom` decimal(12,2) NOT NULL,
  `rangeto` decimal(12,2) NOT NULL,
  `dedtypeer` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employershare` decimal(12,2) NOT NULL,
  `dedtypeee` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employeeshare` decimal(12,2) NOT NULL,
  `total` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prlpayperiod`
--

CREATE TABLE `prlpayperiod` (
  `payperiodid` int(10) UNSIGNED NOT NULL,
  `payperioddesc` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numberofpayday` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prlphilhealth`
--

CREATE TABLE `prlphilhealth` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rangefrom` decimal(12,2) NOT NULL,
  `rangeto` decimal(12,2) NOT NULL,
  `salarycredit` decimal(12,2) NOT NULL,
  `employerph` decimal(12,2) NOT NULL,
  `employerec` decimal(12,2) NOT NULL,
  `employeeph` decimal(12,2) NOT NULL,
  `total` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prlphilhealth`
--

INSERT INTO `prlphilhealth` (`id`, `name`, `rangefrom`, `rangeto`, `salarycredit`, `employerph`, `employerec`, `employeeph`, `total`, `created_at`, `updated_at`) VALUES
(1, 'AAR', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `prlsstable`
--

CREATE TABLE `prlsstable` (
  `id` int(10) UNSIGNED NOT NULL,
  `bracket` int(11) NOT NULL,
  `rangefrom` decimal(12,2) NOT NULL,
  `rangeto` decimal(12,2) NOT NULL,
  `pcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `penname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employerss` decimal(12,2) NOT NULL,
  `employerec` decimal(12,2) NOT NULL,
  `employeess` decimal(12,2) NOT NULL,
  `total` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prlsstable`
--

INSERT INTO `prlsstable` (`id`, `bracket`, `rangefrom`, `rangeto`, `pcode`, `penname`, `employerss`, `employerec`, `employeess`, `total`, `created_at`, `updated_at`) VALUES
(1, 0, '0.00', '0.00', '', 'NSSSF', '0.00', '0.00', '0.00', '0.00', NULL, NULL),
(2, 0, '0.00', '0.00', '', 'PSSS', '0.00', '0.00', '0.00', '0.00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `prltaxtablerate`
--

CREATE TABLE `prltaxtablerate` (
  `id` int(10) UNSIGNED NOT NULL,
  `rangefrom` decimal(12,2) NOT NULL,
  `rangeto` decimal(12,2) NOT NULL,
  `fixtaxtableamount` decimal(12,2) NOT NULL,
  `fixtax` decimal(12,2) NOT NULL,
  `percentofexecessamount` double(12,2) NOT NULL,
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

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` int(10) UNSIGNED NOT NULL,
  `regionname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`id`, `regionname`, `country_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Dar', 0, NULL, NULL, NULL),
(2, 'Others', 0, NULL, NULL, NULL);

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
(1, 'Admin', 'admin', NULL, 1, NULL, NULL);

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
(2, 1, 1, '2018-04-13 05:34:08', '2018-04-13 05:34:08'),
(3, 1, 3, NULL, NULL),
(4, 1, 2, NULL, NULL);

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
(1, 'pangdeny', 'Dennis', 'Christian', 'pangdeny@gmail.com', '$2y$10$l.WU4Y5swdbVqIZFZp1/Zu07m5sZaX3bwWnVXeXeMJUj8Od04VaiC', 'vtKLsrI6BmZCZDFROC45a4oHXy3n6zOnh2tJ2qpEqXjRgDCmRVhJyCkaZu8S', 1, '5tluhYh0f6H41M67kFNOvJpe93ODtkTQP354V2CEmoh8MmMSXoYq8bFAkZrKQDzw', '::1', NULL, NULL, NULL, '::1', NULL, '2018-04-12 07:14:25', '2018-04-13 05:34:08', NULL),
(2, 'siah', 'Siah', 'Materu', 'siah@mail.com', '$2y$10$YmIixwGO3n3is9HmDjLYJu.WW05tb1Vp4ofZ019deNZmKdHzL5.m6', NULL, 1, 'tjNKgTUKzM3FvOCmuq3wQgmuFelfLscOewFLYQ9cmR9nf1xc8CKyKNgEpTi4lGAS', NULL, NULL, NULL, '::1', NULL, NULL, '2018-04-13 04:07:13', '2018-04-13 04:07:13', NULL),
(3, 'harvest', 'Harvest', 'Materu', 'harvest@google.com', '$2y$10$HA0UIzt/9Nk1F7dWhnrxtObtfRbzSXrXQZYa5idBmPsV8GYIAnixK', NULL, 1, 'PdsJIRHq8pZtRqy53Nkj4n0nu5TKXYR9OyR3pleLBtC2K1sg66trDQ8riLOnWqpA', NULL, NULL, NULL, '::1', NULL, NULL, '2018-04-13 05:47:17', '2018-04-13 05:47:17', NULL),
(4, 'magoe', 'iddy', 'magohe', 'magoe@google.com', '$2y$10$aoJA/lIpDkqqrHRLq.TelOhhKRfli3KaV2X9Lgn9BUaShlkr.gqJS', NULL, 1, 'LZzv1vRpTROZtY3svuskFzJvL4tcFXQXGtCZ2GBIYmKZfON2hVvkmsHGYZcSAd8z', NULL, NULL, NULL, '::1', NULL, NULL, '2018-04-13 05:59:44', '2018-04-13 05:59:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `voucherissuance`
--

CREATE TABLE `voucherissuance` (
  `id` int(10) UNSIGNED NOT NULL,
  `voucherid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issuancedate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issuerphone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `voucherredemption`
--

CREATE TABLE `voucherredemption` (
  `id` int(10) UNSIGNED NOT NULL,
  `voucherid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issuancedate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issuerphone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redemptiondate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redeemerphone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `retailerid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `retailername` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shopname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `region` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `oilbarcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `yes_or_nos`
--

CREATE TABLE `yes_or_nos` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `yes_or_nos`
--

INSERT INTO `yes_or_nos` (`id`, `code`, `name`, `created_at`, `updated_at`) VALUES
(1, 'YES', 'YES', NULL, NULL),
(2, 'NO', 'NO', NULL, NULL);

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
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cost_centers`
--
ALTER TABLE `cost_centers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliverynotes`
--
ALTER TABLE `deliverynotes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employeestatutes`
--
ALTER TABLE `employeestatutes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employementstatus`
--
ALTER TABLE `employementstatus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `endcontractreasons`
--
ALTER TABLE `endcontractreasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genders`
--
ALTER TABLE `genders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobgroups`
--
ALTER TABLE `jobgroups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maritalstatus`
--
ALTER TABLE `maritalstatus`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `paytypes`
--
ALTER TABLE `paytypes`
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
-- Indexes for table `prlemployeemaster`
--
ALTER TABLE `prlemployeemaster`
  ADD PRIMARY KEY (`employeeid`);

--
-- Indexes for table `prlemploymentstatus`
--
ALTER TABLE `prlemploymentstatus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prlhdmftable`
--
ALTER TABLE `prlhdmftable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prlpayperiod`
--
ALTER TABLE `prlpayperiod`
  ADD PRIMARY KEY (`payperiodid`);

--
-- Indexes for table `prlphilhealth`
--
ALTER TABLE `prlphilhealth`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prlsstable`
--
ALTER TABLE `prlsstable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prltaxtablerate`
--
ALTER TABLE `prltaxtablerate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profiles_theme_id_foreign` (`theme_id`),
  ADD KEY `profiles_user_id_index` (`user_id`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `voucherissuance`
--
ALTER TABLE `voucherissuance`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `voucherissuance_voucherid_unique` (`voucherid`),
  ADD UNIQUE KEY `voucherissuance_issuerphone_unique` (`issuerphone`);

--
-- Indexes for table `voucherredemption`
--
ALTER TABLE `voucherredemption`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `voucherredemption_voucherid_unique` (`voucherid`);

--
-- Indexes for table `yes_or_nos`
--
ALTER TABLE `yes_or_nos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activations`
--
ALTER TABLE `activations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cost_centers`
--
ALTER TABLE `cost_centers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `deliverynotes`
--
ALTER TABLE `deliverynotes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `employeestatutes`
--
ALTER TABLE `employeestatutes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `employementstatus`
--
ALTER TABLE `employementstatus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `endcontractreasons`
--
ALTER TABLE `endcontractreasons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `jobgroups`
--
ALTER TABLE `jobgroups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `maritalstatus`
--
ALTER TABLE `maritalstatus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `paymentrequest`
--
ALTER TABLE `paymentrequest`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `paytypes`
--
ALTER TABLE `paytypes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `permission_user`
--
ALTER TABLE `permission_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `prlemployeemaster`
--
ALTER TABLE `prlemployeemaster`
  MODIFY `employeeid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `prlemploymentstatus`
--
ALTER TABLE `prlemploymentstatus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `prlhdmftable`
--
ALTER TABLE `prlhdmftable`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `prlpayperiod`
--
ALTER TABLE `prlpayperiod`
  MODIFY `payperiodid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `prlphilhealth`
--
ALTER TABLE `prlphilhealth`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `prlsstable`
--
ALTER TABLE `prlsstable`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `prltaxtablerate`
--
ALTER TABLE `prltaxtablerate`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `retailers`
--
ALTER TABLE `retailers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `social_logins`
--
ALTER TABLE `social_logins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `voucherissuance`
--
ALTER TABLE `voucherissuance`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `voucherredemption`
--
ALTER TABLE `voucherredemption`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `yes_or_nos`
--
ALTER TABLE `yes_or_nos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
