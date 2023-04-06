-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 01, 2023 at 04:07 PM
-- Server version: 5.7.41
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `caky12_pro-dermabless`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `initial_balance` double DEFAULT NULL,
  `total_balance` double NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `is_default` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `account_no`, `name`, `initial_balance`, `total_balance`, `note`, `is_default`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '11111', 'Sales Account', 1000, 1000, 'this is first account', 1, 1, '2018-12-18 02:58:02', '2019-01-20 09:59:06'),
(3, '21211', 'Sa', NULL, 0, NULL, 0, 1, '2018-12-18 02:58:56', '2019-01-20 09:59:06');

-- --------------------------------------------------------

--
-- Table structure for table `adjustments`
--

CREATE TABLE `adjustments` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_qty` double NOT NULL,
  `item` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `employee_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `checkin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkout` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `billers`
--

CREATE TABLE `billers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vat_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `billers`
--

INSERT INTO `billers` (`id`, `name`, `image`, `company_name`, `vat_number`, `email`, `phone_number`, `address`, `city`, `state`, `postal_code`, `country`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Prueba', NULL, 'Dermabless', NULL, 'example@gmail.com', '3058754547', '5219w 24th way', 'Hialeah', NULL, NULL, NULL, 1, '2022-09-11 01:21:15', '2022-09-11 01:21:15');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `image`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Dermabless', NULL, 1, '2022-07-01 10:42:59', '2022-07-01 10:42:59'),
(2, 'Lotto', NULL, 1, '2022-07-01 15:38:50', '2022-07-01 15:38:50');

-- --------------------------------------------------------

--
-- Table structure for table `cash_registers`
--

CREATE TABLE `cash_registers` (
  `id` int(10) UNSIGNED NOT NULL,
  `cash_in_hand` double NOT NULL,
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_registers`
--

INSERT INTO `cash_registers` (`id`, `cash_in_hand`, `user_id`, `warehouse_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 150, 38, 1, 1, '2022-09-10 01:54:19', '2022-09-10 01:54:19'),
(2, 10, 38, 2, 1, '2022-09-10 01:54:27', '2022-09-10 01:54:27'),
(3, 150, 38, 3, 1, '2022-09-11 01:08:19', '2022-09-11 01:08:19'),
(4, 100, 38, 4, 1, '2022-09-14 15:28:07', '2022-09-14 15:28:07');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `parent_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Dermabless Individuals', NULL, NULL, 1, '2022-07-01 10:42:59', '2022-07-01 10:42:59'),
(2, 'Dermabless Profesionals', NULL, NULL, 1, '2022-07-01 10:51:55', '2022-07-01 10:51:55'),
(3, 'accessories', NULL, NULL, 0, '2022-07-01 15:38:50', '2022-07-01 15:48:33');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `minimum_amount` double DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `used` int(11) NOT NULL,
  `expired_date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `exchange_rate`, `created_at`, `updated_at`) VALUES
(1, 'US Dollar', 'USD', 1, '2020-11-01 00:22:58', '2020-11-01 00:34:55'),
(2, 'Euro', 'Euro', 0.85, '2020-11-01 01:29:12', '2020-11-10 23:15:34');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `points` double DEFAULT NULL,
  `deposit` double DEFAULT NULL,
  `expense` double DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_group_id`, `user_id`, `name`, `company_name`, `email`, `phone_number`, `tax_no`, `address`, `city`, `state`, `postal_code`, `country`, `points`, `deposit`, `expense`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Jose', NULL, 'example@gmail.com', '3058754547', NULL, '5219w 24th way', 'Hialeah', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-09-10 15:41:18', '2022-09-10 15:41:18');

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentage` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_groups`
--

INSERT INTO `customer_groups` (`id`, `name`, `percentage`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Dermabless Spa', '100', 1, '2022-06-14 20:15:04', '2022-06-14 20:15:04'),
(2, 'Dermabless Boutique', '100', 1, '2022-06-14 20:15:53', '2022-06-14 20:15:53'),
(3, 'Dermabless Academy', '100', 1, '2022-06-14 20:16:33', '2022-06-14 20:16:33');

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivered_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recieved_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` int(10) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applicable_for` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_list` longtext COLLATE utf8mb4_unicode_ci,
  `valid_from` date NOT NULL,
  `valid_till` date NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` double NOT NULL,
  `minimum_qty` double NOT NULL,
  `maximum_qty` double NOT NULL,
  `days` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount_plans`
--

CREATE TABLE `discount_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount_plan_customers`
--

CREATE TABLE `discount_plan_customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `discount_plan_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount_plan_discounts`
--

CREATE TABLE `discount_plan_discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `discount_id` int(11) NOT NULL,
  `discount_plan_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dso_alerts`
--

CREATE TABLE `dso_alerts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_info` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_of_products` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expense_category_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `amount` double NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `site_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_rtl` tinyint(1) DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_access` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `developed_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_position` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `site_title`, `site_logo`, `is_rtl`, `currency`, `staff_access`, `date_format`, `developed_by`, `invoice_format`, `state`, `theme`, `created_at`, `updated_at`, `currency_position`) VALUES
(1, 'Dermabless - Inventory', '20220612123108.png', 0, '1', 'own', 'd/m/Y', 'ProDev', 'standard', 1, 'default.css', '2018-07-06 06:13:11', '2022-06-15 04:45:06', 'prefix');

-- --------------------------------------------------------

--
-- Table structure for table `gift_cards`
--

CREATE TABLE `gift_cards` (
  `id` int(10) UNSIGNED NOT NULL,
  `card_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `expense` double NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gift_card_recharges`
--

CREATE TABLE `gift_card_recharges` (
  `id` int(10) UNSIGNED NOT NULL,
  `gift_card_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `is_approved` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hrm_settings`
--

CREATE TABLE `hrm_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `checkin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkout` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hrm_settings`
--

INSERT INTO `hrm_settings` (`id`, `checkin`, `checkout`, `created_at`, `updated_at`) VALUES
(1, '10:00am', '6:00pm', '2019-01-02 02:20:08', '2019-01-02 04:20:53');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `code`, `created_at`, `updated_at`) VALUES
(1, 'en', '2018-07-07 22:59:17', '2019-12-24 17:34:20');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `shelf` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `section` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `row` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slot` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `warehouse_id`, `shelf`, `section`, `row`, `slot`, `active`, `key`, `created_at`, `updated_at`) VALUES
(1, 1, '1', 'A', '1', '', 1, '1A1', '2022-07-20 17:43:50', '2022-07-20 17:45:51'),
(2, 1, '1', 'A', '2', '', 1, '1A2', '2022-07-20 17:43:50', '2022-07-20 17:45:51'),
(3, 1, '1', 'A', '3', '', 1, '1A3', '2022-07-20 17:43:50', '2022-07-20 17:45:51'),
(4, 1, '1', 'A', '4', '', 1, '1A4', '2022-07-20 17:43:50', '2022-07-20 17:45:51'),
(5, 1, '1', 'A', '5', '', 1, '1A5', '2022-07-20 17:43:50', '2022-07-20 17:45:51'),
(6, 1, '1', 'A', '6', '', 1, '1A6', '2022-07-20 17:43:50', '2022-07-20 17:45:51'),
(7, 1, '1', 'A', '7', '', 1, '1A7', '2022-07-20 17:43:50', '2022-07-20 17:45:51'),
(8, 1, '1', 'A', '8', '', 1, '1A8', '2022-07-20 17:43:50', '2022-07-20 17:45:51'),
(9, 1, '1', 'B', '1', '', 1, '1B1', '2022-07-20 17:43:50', '2022-07-20 17:45:51'),
(10, 1, '1', 'B', '2', '', 1, '1B2', '2022-07-20 17:43:50', '2022-07-20 17:45:51'),
(11, 1, '1', 'B', '3', '', 1, '1B3', '2022-07-20 17:43:50', '2022-07-20 17:45:51'),
(12, 1, '1', 'B', '4', '', 1, '1B4', '2022-07-20 17:43:50', '2022-07-20 17:45:51'),
(13, 1, '1', 'B', '5', '', 1, '1B5', '2022-07-20 17:43:50', '2022-07-20 17:45:51'),
(14, 1, '1', 'B', '6', '', 1, '1B6', '2022-07-20 17:43:50', '2022-07-20 17:45:51'),
(15, 1, '1', 'B', '7', '', 1, '1B7', '2022-07-20 17:43:50', '2022-07-20 17:45:51'),
(16, 1, '1', 'B', '8', NULL, 1, '1B8', '2022-07-20 17:43:50', '2022-07-20 17:44:04'),
(17, 1, '1', 'B', '43', '', 1, '1B43', '2022-07-20 17:45:51', '2022-07-20 17:45:51'),
(602, 1, '4', 'E', '7', '', 1, '4E7', '2022-08-27 05:20:49', '2022-08-27 05:39:59'),
(603, 1, '4', 'E', '8', '', 1, '4E8', '2022-08-27 05:20:49', '2022-08-27 05:39:59'),
(604, 1, '4', 'F', '1', '', 1, '4F1', '2022-08-27 05:20:49', '2022-08-27 05:39:59'),
(605, 1, '4', 'F', '2', '', 1, '4F2', '2022-08-27 05:20:49', '2022-08-27 05:39:59'),
(606, 1, '4', 'F', '3', '', 1, '4F3', '2022-08-27 05:20:49', '2022-08-27 05:39:59'),
(607, 1, '4', 'F', '4', '', 1, '4F4', '2022-08-27 05:20:49', '2022-08-27 05:39:59'),
(608, 1, '4', 'F', '5', '', 1, '4F5', '2022-08-27 05:20:49', '2022-08-27 05:39:59'),
(609, 1, '4', 'F', '6', '', 1, '4F6', '2022-08-27 05:20:49', '2022-08-27 05:39:59'),
(610, 1, '4', 'F', '7', '', 1, '4F7', '2022-08-27 05:20:49', '2022-08-27 05:39:59'),
(611, 1, '4', 'F', '8', '', 1, '4F8', '2022-08-27 05:20:49', '2022-08-27 05:39:59'),
(612, 1, '5', 'A', '1', '', 1, '5A1', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(613, 1, '5', 'A', '2', '', 1, '5A2', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(614, 1, '5', 'A', '3', '', 1, '5A3', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(615, 1, '5', 'A', '4', '', 1, '5A4', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(616, 1, '5', 'A', '5', '', 1, '5A5', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(617, 1, '5', 'A', '6', '', 1, '5A6', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(618, 1, '5', 'A', '7', '', 1, '5A7', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(619, 1, '5', 'A', '8', '', 1, '5A8', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(620, 1, '5', 'B', '1', '', 1, '5B1', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(621, 1, '5', 'B', '2', '', 1, '5B2', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(622, 1, '5', 'B', '3', '', 1, '5B3', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(623, 1, '5', 'B', '4', '', 1, '5B4', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(624, 1, '5', 'B', '5', '', 1, '5B5', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(625, 1, '5', 'B', '6', '', 1, '5B6', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(626, 1, '5', 'B', '7', '', 1, '5B7', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(627, 1, '5', 'B', '8', '', 1, '5B8', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(628, 1, '5', 'C', '1', '', 1, '5C1', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(629, 1, '5', 'C', '2', '', 1, '5C2', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(630, 1, '5', 'C', '3', '', 1, '5C3', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(631, 1, '5', 'C', '4', '', 1, '5C4', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(632, 1, '5', 'C', '5', '', 1, '5C5', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(633, 1, '5', 'C', '6', '', 1, '5C6', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(634, 1, '5', 'C', '7', '', 1, '5C7', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(635, 1, '5', 'C', '8', '', 1, '5C8', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(636, 1, '5', 'D', '1', '', 1, '5D1', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(637, 1, '5', 'D', '2', '', 1, '5D2', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(638, 1, '5', 'D', '3', '', 1, '5D3', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(639, 1, '5', 'D', '4', '', 1, '5D4', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(640, 1, '5', 'D', '5', '', 1, '5D5', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(641, 1, '5', 'D', '6', '', 1, '5D6', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(642, 1, '5', 'D', '7', '', 1, '5D7', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(643, 1, '5', 'D', '8', '', 1, '5D8', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(644, 1, '5', 'E', '1', '', 1, '5E1', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(645, 1, '5', 'E', '2', '', 1, '5E2', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(646, 1, '5', 'E', '3', '', 1, '5E3', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(647, 1, '5', 'E', '4', '', 1, '5E4', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(648, 1, '5', 'E', '5', '', 1, '5E5', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(649, 1, '5', 'E', '6', '', 1, '5E6', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(650, 1, '5', 'E', '7', '', 1, '5E7', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(651, 1, '5', 'E', '8', '', 1, '5E8', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(652, 1, '5', 'F', '1', '', 1, '5F1', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(653, 1, '5', 'F', '2', '', 1, '5F2', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(654, 1, '5', 'F', '3', '', 1, '5F3', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(655, 1, '5', 'F', '4', '', 1, '5F4', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(656, 1, '5', 'F', '5', '', 1, '5F5', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(657, 1, '5', 'F', '6', '', 1, '5F6', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(658, 1, '5', 'F', '7', '', 1, '5F7', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(659, 1, '5', 'F', '8', '', 1, '5F8', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(660, 1, '5', 'G', '1', '', 1, '5G1', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(661, 1, '5', 'G', '2', '', 1, '5G2', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(662, 1, '5', 'G', '3', '', 1, '5G3', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(663, 1, '5', 'G', '4', '', 1, '5G4', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(664, 1, '5', 'G', '5', '', 1, '5G5', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(665, 1, '5', 'G', '6', '', 1, '5G6', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(666, 1, '5', 'G', '7', '', 1, '5G7', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(667, 1, '5', 'G', '8', '', 1, '5G8', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(668, 1, '5', 'H', '1', '', 1, '5H1', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(669, 1, '5', 'H', '2', '', 1, '5H2', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(670, 1, '5', 'H', '3', '', 1, '5H3', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(671, 1, '5', 'H', '4', '', 1, '5H4', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(672, 1, '5', 'H', '5', '', 1, '5H5', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(673, 1, '5', 'H', '6', '', 1, '5H6', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(674, 1, '5', 'H', '7', '', 1, '5H7', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(675, 1, '5', 'H', '8', '', 1, '5H8', '2022-08-27 05:29:04', '2022-08-27 05:39:59'),
(676, 1, '6', 'A', '1', '', 1, '6A1', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(677, 1, '6', 'A', '2', '', 1, '6A2', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(678, 1, '6', 'A', '3', '', 1, '6A3', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(679, 1, '6', 'A', '4', '', 1, '6A4', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(680, 1, '6', 'A', '5', '', 1, '6A5', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(681, 1, '6', 'A', '6', '', 1, '6A6', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(682, 1, '6', 'A', '7', '', 1, '6A7', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(683, 1, '6', 'A', '8', '', 1, '6A8', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(684, 1, '6', 'A', '9', '', 1, '6A9', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(685, 1, '6', 'A', '10', '', 1, '6A10', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(686, 1, '6', 'A', '12', '', 1, '6A12', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(687, 1, '6', 'A', '13', '', 1, '6A13', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(688, 1, '6', 'A', '14', '', 1, '6A14', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(689, 1, '6', 'A', '15', '', 1, '6A15', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(690, 1, '6', 'A', '16', '', 1, '6A16', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(691, 1, '6', 'B', '1', '', 1, '6B1', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(692, 1, '6', 'B', '2', '', 1, '6B2', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(693, 1, '6', 'B', '3', '', 1, '6B3', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(694, 1, '6', 'B', '4', '', 1, '6B4', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(695, 1, '6', 'B', '5', '', 1, '6B5', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(696, 1, '6', 'B', '6', '', 1, '6B6', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(697, 1, '6', 'B', '7', '', 1, '6B7', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(698, 1, '6', 'B', '8', '', 1, '6B8', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(699, 1, '6', 'B', '9', '', 1, '6B9', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(700, 1, '6', 'B', '10', '', 1, '6B10', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(701, 1, '6', 'B', '12', '', 1, '6B12', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(702, 1, '6', 'B', '13', '', 1, '6B13', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(703, 1, '6', 'B', '14', '', 1, '6B14', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(704, 1, '6', 'B', '15', '', 1, '6B15', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(705, 1, '6', 'B', '16', '', 1, '6B16', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(706, 1, '6', 'C', '1', '', 1, '6C1', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(707, 1, '6', 'C', '2', '', 1, '6C2', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(708, 1, '6', 'C', '3', '', 1, '6C3', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(709, 1, '6', 'C', '4', '', 1, '6C4', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(710, 1, '6', 'C', '5', '', 1, '6C5', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(711, 1, '6', 'C', '6', '', 1, '6C6', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(712, 1, '6', 'C', '7', '', 1, '6C7', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(713, 1, '6', 'C', '8', '', 1, '6C8', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(714, 1, '6', 'C', '9', '', 1, '6C9', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(715, 1, '6', 'C', '10', '', 1, '6C10', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(716, 1, '6', 'C', '12', '', 1, '6C12', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(717, 1, '6', 'C', '13', '', 1, '6C13', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(718, 1, '6', 'C', '14', '', 1, '6C14', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(719, 1, '6', 'C', '15', '', 1, '6C15', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(720, 1, '6', 'C', '16', '', 1, '6C16', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(721, 1, '6', 'D', '1', '', 1, '6D1', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(722, 1, '6', 'D', '2', '', 1, '6D2', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(723, 1, '6', 'D', '3', '', 1, '6D3', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(724, 1, '6', 'D', '4', '', 1, '6D4', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(725, 1, '6', 'D', '5', '', 1, '6D5', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(726, 1, '6', 'D', '6', '', 1, '6D6', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(727, 1, '6', 'D', '7', '', 1, '6D7', '2022-08-27 05:37:35', '2022-08-27 05:39:59'),
(728, 1, '6', 'D', '8', '', 1, '6D8', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(729, 1, '6', 'D', '9', '', 1, '6D9', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(730, 1, '6', 'D', '10', '', 1, '6D10', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(731, 1, '6', 'D', '12', '', 1, '6D12', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(732, 1, '6', 'D', '13', '', 1, '6D13', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(733, 1, '6', 'D', '14', '', 1, '6D14', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(734, 1, '6', 'D', '15', '', 1, '6D15', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(735, 1, '6', 'D', '16', '', 1, '6D16', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(736, 1, '6', 'E', '1', '', 1, '6E1', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(737, 1, '6', 'E', '2', '', 1, '6E2', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(738, 1, '6', 'E', '3', '', 1, '6E3', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(739, 1, '6', 'E', '4', '', 1, '6E4', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(740, 1, '6', 'E', '5', '', 1, '6E5', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(741, 1, '6', 'E', '6', '', 1, '6E6', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(742, 1, '6', 'E', '7', '', 1, '6E7', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(743, 1, '6', 'E', '8', '', 1, '6E8', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(744, 1, '6', 'E', '9', '', 1, '6E9', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(745, 1, '6', 'E', '10', '', 1, '6E10', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(746, 1, '6', 'E', '11', '', 1, '6E11', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(747, 1, '6', 'E', '12', '', 1, '6E12', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(748, 1, '6', 'E', '13', '', 1, '6E13', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(749, 1, '6', 'E', '14', '', 1, '6E14', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(750, 1, '6', 'E', '15', '', 1, '6E15', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(751, 1, '6', 'E', '16', '', 1, '6E16', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(752, 1, '6', 'F', '1', '', 1, '6F1', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(753, 1, '6', 'F', '2', '', 1, '6F2', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(754, 1, '6', 'F', '3', '', 1, '6F3', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(755, 1, '6', 'F', '4', '', 1, '6F4', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(756, 1, '6', 'F', '5', '', 1, '6F5', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(757, 1, '6', 'F', '6', '', 1, '6F6', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(758, 1, '6', 'F', '7', '', 1, '6F7', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(759, 1, '6', 'F', '8', '', 1, '6F8', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(760, 1, '6', 'F', '9', '', 1, '6F9', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(761, 1, '6', 'F', '10', '', 1, '6F10', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(762, 1, '6', 'F', '11', '', 1, '6F11', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(763, 1, '6', 'F', '12', '', 1, '6F12', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(764, 1, '6', 'F', '13', '', 1, '6F13', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(765, 1, '6', 'F', '14', '', 1, '6F14', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(766, 1, '6', 'F', '15', '', 1, '6F15', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(767, 1, '6', 'F', '16', '', 1, '6F16', '2022-08-27 05:37:35', '2022-08-27 05:40:00'),
(768, 1, '6', 'H', '1', NULL, 1, '6H1', '2022-08-27 05:40:00', '2022-11-17 15:27:51'),
(769, 1, '6', 'H', '2', NULL, 1, '6H2', '2022-08-27 05:40:00', '2022-11-17 15:28:11'),
(770, 1, '6', 'H', '3', NULL, 1, '6H3', '2022-08-27 05:40:00', '2022-11-17 15:28:45'),
(771, 1, '6', 'H', '4', NULL, 1, '6H4', '2022-08-27 05:40:00', '2022-11-17 15:29:01'),
(772, 1, '6', 'H', '5', NULL, 1, '6H5', '2022-08-27 05:40:00', '2022-11-17 15:29:16'),
(773, 1, '6', 'H', '6', NULL, 1, '6H6', '2022-08-27 05:40:00', '2022-11-17 15:29:44');

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
(3, '2018_02_17_060412_create_categories_table', 1),
(4, '2018_02_20_035727_create_brands_table', 1),
(5, '2018_02_25_100635_create_suppliers_table', 1),
(6, '2018_02_27_101619_create_warehouse_table', 1),
(7, '2018_03_03_040448_create_units_table', 1),
(8, '2018_03_04_041317_create_taxes_table', 1),
(9, '2018_03_10_061915_create_customer_groups_table', 1),
(10, '2018_03_10_090534_create_customers_table', 1),
(11, '2018_03_11_095547_create_billers_table', 1),
(12, '2018_04_05_054401_create_products_table', 1),
(13, '2018_04_06_133606_create_purchases_table', 1),
(14, '2018_04_06_154600_create_product_purchases_table', 1),
(15, '2018_04_06_154915_create_product_warhouse_table', 1),
(16, '2018_04_10_085927_create_sales_table', 1),
(17, '2018_04_10_090133_create_product_sales_table', 1),
(18, '2018_04_10_090254_create_payments_table', 1),
(19, '2018_04_10_090341_create_payment_with_cheque_table', 1),
(20, '2018_04_10_090509_create_payment_with_credit_card_table', 1),
(21, '2018_04_13_121436_create_quotation_table', 1),
(22, '2018_04_13_122324_create_product_quotation_table', 1),
(23, '2018_04_14_121802_create_transfers_table', 1),
(24, '2018_04_14_121913_create_product_transfer_table', 1),
(25, '2018_05_13_082847_add_payment_id_and_change_sale_id_to_payments_table', 2),
(26, '2018_05_13_090906_change_customer_id_to_payment_with_credit_card_table', 3),
(27, '2018_05_20_054532_create_adjustments_table', 4),
(28, '2018_05_20_054859_create_product_adjustments_table', 4),
(29, '2018_05_21_163419_create_returns_table', 5),
(30, '2018_05_21_163443_create_product_returns_table', 5),
(31, '2018_06_02_050905_create_roles_table', 6),
(32, '2018_06_02_073430_add_columns_to_users_table', 7),
(33, '2018_06_03_053738_create_permission_tables', 8),
(36, '2018_06_21_063736_create_pos_setting_table', 9),
(37, '2018_06_21_094155_add_user_id_to_sales_table', 10),
(38, '2018_06_21_101529_add_user_id_to_purchases_table', 11),
(39, '2018_06_21_103512_add_user_id_to_transfers_table', 12),
(40, '2018_06_23_061058_add_user_id_to_quotations_table', 13),
(41, '2018_06_23_082427_add_is_deleted_to_users_table', 14),
(42, '2018_06_25_043308_change_email_to_users_table', 15),
(43, '2018_07_06_115449_create_general_settings_table', 16),
(44, '2018_07_08_043944_create_languages_table', 17),
(45, '2018_07_11_102144_add_user_id_to_returns_table', 18),
(46, '2018_07_11_102334_add_user_id_to_payments_table', 18),
(47, '2018_07_22_130541_add_digital_to_products_table', 19),
(49, '2018_07_24_154250_create_deliveries_table', 20),
(50, '2018_08_16_053336_create_expense_categories_table', 21),
(51, '2018_08_17_115415_create_expenses_table', 22),
(55, '2018_08_18_050418_create_gift_cards_table', 23),
(56, '2018_08_19_063119_create_payment_with_gift_card_table', 24),
(57, '2018_08_25_042333_create_gift_card_recharges_table', 25),
(58, '2018_08_25_101354_add_deposit_expense_to_customers_table', 26),
(59, '2018_08_26_043801_create_deposits_table', 27),
(60, '2018_09_02_044042_add_keybord_active_to_pos_setting_table', 28),
(61, '2018_09_09_092713_create_payment_with_paypal_table', 29),
(62, '2018_09_10_051254_add_currency_to_general_settings_table', 30),
(63, '2018_10_22_084118_add_biller_and_store_id_to_users_table', 31),
(65, '2018_10_26_034927_create_coupons_table', 32),
(66, '2018_10_27_090857_add_coupon_to_sales_table', 33),
(67, '2018_11_07_070155_add_currency_position_to_general_settings_table', 34),
(68, '2018_11_19_094650_add_combo_to_products_table', 35),
(69, '2018_12_09_043712_create_accounts_table', 36),
(70, '2018_12_17_112253_add_is_default_to_accounts_table', 37),
(71, '2018_12_19_103941_add_account_id_to_payments_table', 38),
(72, '2018_12_20_065900_add_account_id_to_expenses_table', 39),
(73, '2018_12_20_082753_add_account_id_to_returns_table', 40),
(74, '2018_12_26_064330_create_return_purchases_table', 41),
(75, '2018_12_26_144210_create_purchase_product_return_table', 42),
(76, '2018_12_26_144708_create_purchase_product_return_table', 43),
(77, '2018_12_27_110018_create_departments_table', 44),
(78, '2018_12_30_054844_create_employees_table', 45),
(79, '2018_12_31_125210_create_payrolls_table', 46),
(80, '2018_12_31_150446_add_department_id_to_employees_table', 47),
(81, '2019_01_01_062708_add_user_id_to_expenses_table', 48),
(82, '2019_01_02_075644_create_hrm_settings_table', 49),
(83, '2019_01_02_090334_create_attendances_table', 50),
(84, '2019_01_27_160956_add_three_columns_to_general_settings_table', 51),
(85, '2019_02_15_183303_create_stock_counts_table', 52),
(86, '2019_02_17_101604_add_is_adjusted_to_stock_counts_table', 53),
(87, '2019_04_13_101707_add_tax_no_to_customers_table', 54),
(89, '2019_10_14_111455_create_holidays_table', 55),
(90, '2019_11_13_145619_add_is_variant_to_products_table', 56),
(91, '2019_11_13_150206_create_product_variants_table', 57),
(92, '2019_11_13_153828_create_variants_table', 57),
(93, '2019_11_25_134041_add_qty_to_product_variants_table', 58),
(94, '2019_11_25_134922_add_variant_id_to_product_purchases_table', 58),
(95, '2019_11_25_145341_add_variant_id_to_product_warehouse_table', 58),
(96, '2019_11_29_182201_add_variant_id_to_product_sales_table', 59),
(97, '2019_12_04_121311_add_variant_id_to_product_quotation_table', 60),
(98, '2019_12_05_123802_add_variant_id_to_product_transfer_table', 61),
(100, '2019_12_08_114954_add_variant_id_to_product_returns_table', 62),
(101, '2019_12_08_203146_add_variant_id_to_purchase_product_return_table', 63),
(102, '2020_02_28_103340_create_money_transfers_table', 64),
(103, '2020_07_01_193151_add_image_to_categories_table', 65),
(105, '2020_09_26_130426_add_user_id_to_deliveries_table', 66),
(107, '2020_10_11_125457_create_cash_registers_table', 67),
(108, '2020_10_13_155019_add_cash_register_id_to_sales_table', 68),
(109, '2020_10_13_172624_add_cash_register_id_to_returns_table', 69),
(110, '2020_10_17_212338_add_cash_register_id_to_payments_table', 70),
(111, '2020_10_18_124200_add_cash_register_id_to_expenses_table', 71),
(112, '2020_10_21_121632_add_developed_by_to_general_settings_table', 72),
(113, '2019_08_19_000000_create_failed_jobs_table', 73),
(114, '2020_10_30_135557_create_notifications_table', 73),
(115, '2020_11_01_044954_create_currencies_table', 74),
(116, '2020_11_01_140736_add_price_to_product_warehouse_table', 75),
(117, '2020_11_02_050633_add_is_diff_price_to_products_table', 76),
(118, '2020_11_09_055222_add_user_id_to_customers_table', 77),
(119, '2020_11_17_054806_add_invoice_format_to_general_settings_table', 78),
(120, '2021_02_10_074859_add_variant_id_to_product_adjustments_table', 79),
(121, '2021_03_07_093606_create_product_batches_table', 80),
(122, '2021_03_07_093759_add_product_batch_id_to_product_warehouse_table', 80),
(123, '2021_03_07_093900_add_product_batch_id_to_product_purchases_table', 80),
(124, '2021_03_11_132603_add_product_batch_id_to_product_sales_table', 81),
(127, '2021_03_25_125421_add_is_batch_to_products_table', 82),
(128, '2021_05_19_120127_add_product_batch_id_to_product_returns_table', 82),
(130, '2021_05_22_105611_add_product_batch_id_to_purchase_product_return_table', 83),
(131, '2021_05_23_124848_add_product_batch_id_to_product_transfer_table', 84),
(132, '2021_05_26_153106_add_product_batch_id_to_product_quotation_table', 85),
(133, '2021_06_08_213007_create_reward_point_settings_table', 86),
(134, '2021_06_16_104155_add_points_to_customers_table', 87),
(135, '2021_06_17_101057_add_used_points_to_payments_table', 88),
(136, '2021_07_06_132716_add_variant_list_to_products_table', 89),
(137, '2021_09_27_161141_add_is_imei_to_products_table', 90),
(138, '2021_09_28_170052_add_imei_number_to_product_warehouse_table', 91),
(139, '2021_09_28_170126_add_imei_number_to_product_purchases_table', 91),
(140, '2021_10_03_170652_add_imei_number_to_product_sales_table', 92),
(141, '2021_10_10_145214_add_imei_number_to_product_returns_table', 93),
(142, '2021_10_11_104504_add_imei_number_to_product_transfer_table', 94),
(143, '2021_10_12_160107_add_imei_number_to_purchase_product_return_table', 95),
(144, '2021_10_12_205146_add_is_rtl_to_general_settings_table', 96),
(145, '2021_10_23_142451_add_is_approve_to_payments_table', 97),
(146, '2022_01_13_191242_create_discount_plans_table', 97),
(147, '2022_01_14_174318_create_discount_plan_customers_table', 97),
(148, '2022_01_14_202439_create_discounts_table', 98),
(149, '2022_01_16_153506_create_discount_plan_discounts_table', 98),
(150, '2022_02_05_174210_add_order_discount_type_and_value_to_sales_table', 99),
(154, '2022_05_26_195506_add_daily_sale_objective_to_products_table', 100),
(155, '2022_05_28_104209_create_dso_alerts_table', 100),
(156, '2022_06_01_112100_add_is_embeded_to_products_table', 100),
(157, '2022_06_14_130505_add_sale_id_to_returns_table', 100),
(158, '2022_07_14_211749_create_location_table', 101),
(159, '2022_01_14_174318_create_product_locations_table', 102),
(160, '2022_01_14_174318_create_sales_location_table', 102),
(161, '2022_06_14_130505_add_product_transfer_id_to_product_locations_table', 102),
(162, '2022_06_14_130505_add_product_transfer_id_to_sales_locations_table', 102),
(163, '2022_06_14_130505_change_product_purchase_id_to_nullable_table', 102),
(164, '2022_06_14_130505_change_product_sales_id_to_nullable_table', 102),
(165, '2022_06_01_112100_add_last_notified_to_products_table', 103);

-- --------------------------------------------------------

--
-- Table structure for table `money_transfers`
--

CREATE TABLE `money_transfers` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_account_id` int(11) NOT NULL,
  `to_account_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_reference` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `used_points` double DEFAULT NULL,
  `change` double NOT NULL,
  `paying_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_with_cheque`
--

CREATE TABLE `payment_with_cheque` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(11) NOT NULL,
  `cheque_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_with_credit_card`
--

CREATE TABLE `payment_with_credit_card` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer_stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_with_gift_card`
--

CREATE TABLE `payment_with_gift_card` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(11) NOT NULL,
  `gift_card_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_with_paypal`
--

CREATE TABLE `payment_with_paypal` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_id` int(11) NOT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payrolls`
--

CREATE TABLE `payrolls` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `paying_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(4, 'products-edit', 'web', '2018-06-03 01:00:09', '2018-06-03 01:00:09'),
(5, 'products-delete', 'web', '2018-06-03 22:54:22', '2018-06-03 22:54:22'),
(6, 'products-add', 'web', '2018-06-04 00:34:14', '2018-06-04 00:34:14'),
(7, 'products-index', 'web', '2018-06-04 03:34:27', '2018-06-04 03:34:27'),
(8, 'purchases-index', 'web', '2018-06-04 08:03:19', '2018-06-04 08:03:19'),
(9, 'purchases-add', 'web', '2018-06-04 08:12:25', '2018-06-04 08:12:25'),
(10, 'purchases-edit', 'web', '2018-06-04 09:47:36', '2018-06-04 09:47:36'),
(11, 'purchases-delete', 'web', '2018-06-04 09:47:36', '2018-06-04 09:47:36'),
(12, 'sales-index', 'web', '2018-06-04 10:49:08', '2018-06-04 10:49:08'),
(13, 'sales-add', 'web', '2018-06-04 10:49:52', '2018-06-04 10:49:52'),
(14, 'sales-edit', 'web', '2018-06-04 10:49:52', '2018-06-04 10:49:52'),
(15, 'sales-delete', 'web', '2018-06-04 10:49:53', '2018-06-04 10:49:53'),
(16, 'quotes-index', 'web', '2018-06-04 22:05:10', '2018-06-04 22:05:10'),
(17, 'quotes-add', 'web', '2018-06-04 22:05:10', '2018-06-04 22:05:10'),
(18, 'quotes-edit', 'web', '2018-06-04 22:05:10', '2018-06-04 22:05:10'),
(19, 'quotes-delete', 'web', '2018-06-04 22:05:10', '2018-06-04 22:05:10'),
(20, 'transfers-index', 'web', '2018-06-04 22:30:03', '2018-06-04 22:30:03'),
(21, 'transfers-add', 'web', '2018-06-04 22:30:03', '2018-06-04 22:30:03'),
(22, 'transfers-edit', 'web', '2018-06-04 22:30:03', '2018-06-04 22:30:03'),
(23, 'transfers-delete', 'web', '2018-06-04 22:30:03', '2018-06-04 22:30:03'),
(24, 'returns-index', 'web', '2018-06-04 22:50:24', '2018-06-04 22:50:24'),
(25, 'returns-add', 'web', '2018-06-04 22:50:24', '2018-06-04 22:50:24'),
(26, 'returns-edit', 'web', '2018-06-04 22:50:25', '2018-06-04 22:50:25'),
(27, 'returns-delete', 'web', '2018-06-04 22:50:25', '2018-06-04 22:50:25'),
(28, 'customers-index', 'web', '2018-06-04 23:15:54', '2018-06-04 23:15:54'),
(29, 'customers-add', 'web', '2018-06-04 23:15:55', '2018-06-04 23:15:55'),
(30, 'customers-edit', 'web', '2018-06-04 23:15:55', '2018-06-04 23:15:55'),
(31, 'customers-delete', 'web', '2018-06-04 23:15:55', '2018-06-04 23:15:55'),
(32, 'suppliers-index', 'web', '2018-06-04 23:40:12', '2018-06-04 23:40:12'),
(33, 'suppliers-add', 'web', '2018-06-04 23:40:12', '2018-06-04 23:40:12'),
(34, 'suppliers-edit', 'web', '2018-06-04 23:40:12', '2018-06-04 23:40:12'),
(35, 'suppliers-delete', 'web', '2018-06-04 23:40:12', '2018-06-04 23:40:12'),
(36, 'product-report', 'web', '2018-06-24 23:05:33', '2018-06-24 23:05:33'),
(37, 'purchase-report', 'web', '2018-06-24 23:24:56', '2018-06-24 23:24:56'),
(38, 'sale-report', 'web', '2018-06-24 23:33:13', '2018-06-24 23:33:13'),
(39, 'customer-report', 'web', '2018-06-24 23:36:51', '2018-06-24 23:36:51'),
(40, 'due-report', 'web', '2018-06-24 23:39:52', '2018-06-24 23:39:52'),
(41, 'users-index', 'web', '2018-06-25 00:00:10', '2018-06-25 00:00:10'),
(42, 'users-add', 'web', '2018-06-25 00:00:10', '2018-06-25 00:00:10'),
(43, 'users-edit', 'web', '2018-06-25 00:01:30', '2018-06-25 00:01:30'),
(44, 'users-delete', 'web', '2018-06-25 00:01:30', '2018-06-25 00:01:30'),
(45, 'profit-loss', 'web', '2018-07-14 21:50:05', '2018-07-14 21:50:05'),
(46, 'best-seller', 'web', '2018-07-14 22:01:38', '2018-07-14 22:01:38'),
(47, 'daily-sale', 'web', '2018-07-14 22:24:21', '2018-07-14 22:24:21'),
(48, 'monthly-sale', 'web', '2018-07-14 22:30:41', '2018-07-14 22:30:41'),
(49, 'daily-purchase', 'web', '2018-07-14 22:36:46', '2018-07-14 22:36:46'),
(50, 'monthly-purchase', 'web', '2018-07-14 22:48:17', '2018-07-14 22:48:17'),
(51, 'payment-report', 'web', '2018-07-14 23:10:41', '2018-07-14 23:10:41'),
(52, 'warehouse-stock-report', 'web', '2018-07-14 23:16:55', '2018-07-14 23:16:55'),
(53, 'product-qty-alert', 'web', '2018-07-14 23:33:21', '2018-07-14 23:33:21'),
(54, 'supplier-report', 'web', '2018-07-30 03:00:01', '2018-07-30 03:00:01'),
(55, 'expenses-index', 'web', '2018-09-05 01:07:10', '2018-09-05 01:07:10'),
(56, 'expenses-add', 'web', '2018-09-05 01:07:10', '2018-09-05 01:07:10'),
(57, 'expenses-edit', 'web', '2018-09-05 01:07:10', '2018-09-05 01:07:10'),
(58, 'expenses-delete', 'web', '2018-09-05 01:07:11', '2018-09-05 01:07:11'),
(59, 'general_setting', 'web', '2018-10-19 23:10:04', '2018-10-19 23:10:04'),
(60, 'mail_setting', 'web', '2018-10-19 23:10:04', '2018-10-19 23:10:04'),
(61, 'pos_setting', 'web', '2018-10-19 23:10:04', '2018-10-19 23:10:04'),
(62, 'hrm_setting', 'web', '2019-01-02 10:30:23', '2019-01-02 10:30:23'),
(63, 'purchase-return-index', 'web', '2019-01-02 21:45:14', '2019-01-02 21:45:14'),
(64, 'purchase-return-add', 'web', '2019-01-02 21:45:14', '2019-01-02 21:45:14'),
(65, 'purchase-return-edit', 'web', '2019-01-02 21:45:14', '2019-01-02 21:45:14'),
(66, 'purchase-return-delete', 'web', '2019-01-02 21:45:14', '2019-01-02 21:45:14'),
(67, 'account-index', 'web', '2019-01-02 22:06:13', '2019-01-02 22:06:13'),
(68, 'balance-sheet', 'web', '2019-01-02 22:06:14', '2019-01-02 22:06:14'),
(69, 'account-statement', 'web', '2019-01-02 22:06:14', '2019-01-02 22:06:14'),
(70, 'department', 'web', '2019-01-02 22:30:01', '2019-01-02 22:30:01'),
(71, 'attendance', 'web', '2019-01-02 22:30:01', '2019-01-02 22:30:01'),
(72, 'payroll', 'web', '2019-01-02 22:30:01', '2019-01-02 22:30:01'),
(73, 'employees-index', 'web', '2019-01-02 22:52:19', '2019-01-02 22:52:19'),
(74, 'employees-add', 'web', '2019-01-02 22:52:19', '2019-01-02 22:52:19'),
(75, 'employees-edit', 'web', '2019-01-02 22:52:19', '2019-01-02 22:52:19'),
(76, 'employees-delete', 'web', '2019-01-02 22:52:19', '2019-01-02 22:52:19'),
(77, 'user-report', 'web', '2019-01-16 06:48:18', '2019-01-16 06:48:18'),
(78, 'stock_count', 'web', '2019-02-17 10:32:01', '2019-02-17 10:32:01'),
(79, 'adjustment', 'web', '2019-02-17 10:32:02', '2019-02-17 10:32:02'),
(80, 'sms_setting', 'web', '2019-02-22 05:18:03', '2019-02-22 05:18:03'),
(81, 'create_sms', 'web', '2019-02-22 05:18:03', '2019-02-22 05:18:03'),
(82, 'print_barcode', 'web', '2019-03-07 05:02:19', '2019-03-07 05:02:19'),
(83, 'empty_database', 'web', '2019-03-07 05:02:19', '2019-03-07 05:02:19'),
(84, 'customer_group', 'web', '2019-03-07 05:37:15', '2019-03-07 05:37:15'),
(85, 'unit', 'web', '2019-03-07 05:37:15', '2019-03-07 05:37:15'),
(86, 'tax', 'web', '2019-03-07 05:37:15', '2019-03-07 05:37:15'),
(87, 'gift_card', 'web', '2019-03-07 06:29:38', '2019-03-07 06:29:38'),
(88, 'coupon', 'web', '2019-03-07 06:29:38', '2019-03-07 06:29:38'),
(89, 'holiday', 'web', '2019-10-19 08:57:15', '2019-10-19 08:57:15'),
(90, 'warehouse-report', 'web', '2019-10-22 06:00:23', '2019-10-22 06:00:23'),
(91, 'warehouse', 'web', '2020-02-26 06:47:32', '2020-02-26 06:47:32'),
(92, 'brand', 'web', '2020-02-26 06:59:59', '2020-02-26 06:59:59'),
(93, 'billers-index', 'web', '2020-02-26 07:11:15', '2020-02-26 07:11:15'),
(94, 'billers-add', 'web', '2020-02-26 07:11:15', '2020-02-26 07:11:15'),
(95, 'billers-edit', 'web', '2020-02-26 07:11:15', '2020-02-26 07:11:15'),
(96, 'billers-delete', 'web', '2020-02-26 07:11:15', '2020-02-26 07:11:15'),
(97, 'money-transfer', 'web', '2020-03-02 05:41:48', '2020-03-02 05:41:48'),
(98, 'category', 'web', '2020-07-13 12:13:16', '2020-07-13 12:13:16'),
(99, 'delivery', 'web', '2020-07-13 12:13:16', '2020-07-13 12:13:16'),
(100, 'send_notification', 'web', '2020-10-31 06:21:31', '2020-10-31 06:21:31'),
(101, 'today_sale', 'web', '2020-10-31 06:57:04', '2020-10-31 06:57:04'),
(102, 'today_profit', 'web', '2020-10-31 06:57:04', '2020-10-31 06:57:04'),
(103, 'currency', 'web', '2020-11-09 00:23:11', '2020-11-09 00:23:11'),
(104, 'backup_database', 'web', '2020-11-15 00:16:55', '2020-11-15 00:16:55'),
(105, 'reward_point_setting', 'web', '2021-06-27 04:34:42', '2021-06-27 04:34:42'),
(106, 'revenue_profit_summary', 'web', '2022-02-08 13:57:21', '2022-02-08 13:57:21'),
(107, 'cash_flow', 'web', '2022-02-08 13:57:22', '2022-02-08 13:57:22'),
(108, 'monthly_summary', 'web', '2022-02-08 13:57:22', '2022-02-08 13:57:22'),
(109, 'yearly_report', 'web', '2022-02-08 13:57:22', '2022-02-08 13:57:22'),
(110, 'discount_plan', 'web', '2022-02-16 09:12:26', '2022-02-16 09:12:26'),
(111, 'discount', 'web', '2022-02-16 09:12:38', '2022-02-16 09:12:38'),
(112, 'product-expiry-report', 'web', '2022-03-30 05:39:20', '2022-03-30 05:39:20');

-- --------------------------------------------------------

--
-- Table structure for table `pos_setting`
--

CREATE TABLE `pos_setting` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `product_number` int(11) NOT NULL,
  `keybord_active` tinyint(1) NOT NULL,
  `stripe_public_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_secret_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pos_setting`
--

INSERT INTO `pos_setting` (`id`, `customer_id`, `warehouse_id`, `biller_id`, `product_number`, `keybord_active`, `stripe_public_key`, `stripe_secret_key`, `created_at`, `updated_at`) VALUES
(1, 11, 2, 1, 4, 0, 'pk_test_ITN7KOYiIsHSCQ0UMRcgaYUB', 'sk_test_TtQQaawhEYRwa3mU9CzttrEy', '2018-09-02 03:17:04', '2020-04-17 13:59:54');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode_symbology` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `cost` double NOT NULL,
  `price` double NOT NULL,
  `qty` double DEFAULT NULL,
  `alert_quantity` double DEFAULT NULL,
  `daily_sale_objective` double DEFAULT NULL,
  `promotion` tinyint(4) DEFAULT NULL,
  `promotion_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starting_date` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_date` date DEFAULT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `tax_method` int(11) DEFAULT NULL,
  `image` longtext COLLATE utf8mb4_unicode_ci,
  `file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_notified` date DEFAULT NULL,
  `is_embeded` tinyint(1) DEFAULT NULL,
  `is_variant` tinyint(1) DEFAULT NULL,
  `is_batch` tinyint(1) DEFAULT NULL,
  `is_diffPrice` tinyint(1) DEFAULT NULL,
  `is_imei` tinyint(1) DEFAULT NULL,
  `featured` tinyint(4) DEFAULT NULL,
  `product_list` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant_list` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty_list` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_list` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_details` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `code`, `type`, `barcode_symbology`, `brand_id`, `category_id`, `unit_id`, `purchase_unit_id`, `sale_unit_id`, `cost`, `price`, `qty`, `alert_quantity`, `daily_sale_objective`, `promotion`, `promotion_price`, `starting_date`, `last_date`, `tax_id`, `tax_method`, `image`, `file`, `last_notified`, `is_embeded`, `is_variant`, `is_batch`, `is_diffPrice`, `is_imei`, `featured`, `product_list`, `variant_list`, `qty_list`, `price_list`, `product_details`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '360 Lifting Créme', '43452130', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(2, 'Acne Blemish', '52733102', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(3, 'Advanced Moisturizer', '69403761', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(4, 'Advanced Moisturizer Travel', '23021441', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(5, 'All In One Extreme', '91790102', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(6, 'All In One Replenishing', '18264954', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(7, 'Amour The Lips', '89199431', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(8, 'Anti-Redness K', '73401192', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(9, 'Beauty B Scrub', '70724286', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(10, 'Beauty B Scrub Travel', '93875286', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(11, 'Smooth Lines 15ml', '21567248', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(12, 'Smooth Lines 30ml', '42197905', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(13, 'C For Neck', '38697756', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(14, 'C-Lilac 15ml', '92198797', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(15, 'C-Lilac 30ml', '82796511', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(16, 'C-Lilac Travel', '64782110', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(17, 'C-Lilac Mom', '62129170', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(18, 'Clarifying Miracle', '77025313', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(19, 'Clarifying Miracle Pads', '42835803', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(20, 'Daily Toner Detox', '96998671', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(21, 'Daily Toner Detox Pads', '46072387', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(22, 'Eye Gel Benefits Advanced', '28192476', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(23, 'Fresh Mint Scrub', '61281598', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(24, 'Hawaiian Vita-C', '77593916', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(25, 'Hawaiian Vita-C Travel', '25734031', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(26, 'Hyaluronic DB', '65617278', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(27, 'Hydro Fancy', '63880201', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(28, 'Intensive Bright Créme', '96499126', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(29, 'Intensive Bright Créme Mom', '13019647', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(30, 'Lavender Air', '32101062', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(31, 'Lipid Rain 15ml', '83864961', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(32, 'Lipid Rain 30ml', '66587313', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(33, 'Luminosity Wash', '92890102', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(34, 'Luxury Body Renew', '47607290', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(35, 'Luxury Body Renew Travel', '80498119', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(36, 'Luxury Body Renew Mom', '39198805', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(37, 'Matifier Serum', '26965001', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(38, 'Miracle Blemish', '12256041', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(39, 'O2 DB Revitalizing', '22191017', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(40, 'Ocean Firming Renew', '56791856', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(41, 'Ocean Moisture Crème', '29324965', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(42, 'Papaya Pumpkin Detox', '64807612', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(43, 'Retin Miracle', '41492606', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(44, 'Satin Essence 15ml', '12013496', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(45, 'Satin Essence 30ml', '16485217', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(46, 'Satin Essence Travel', '85410796', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(47, 'Satin Essence Cleanser 180ml', '88669750', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(48, 'Satin Essence Cleanser 60ml', '37142851', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(49, 'Satin Essence Cleanser Travel', '18467530', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(50, 'Satin Essence Cleanser Mom', '98335061', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(51, 'Shiny Peel Moisturizer', '31389267', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(52, 'Sleeping Créme', '96178154', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(53, 'Strawberry Rose Mask', '13604296', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(54, 'Stream Créme', '12037254', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(55, 'Ultra Clarifier', '94619537', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(56, 'Velvet Gel 180ml', '94812331', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(57, 'Velvet Gel 60ml', '33406296', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(58, 'All In One Replenishing Cabina', '91328291', 'standard', 'C128', 1, 2, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(59, 'Fresh Mint Scrub Cabina', '16690924', 'standard', 'C128', 1, 2, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(60, 'Hawaiian Vita-C Cabina', '70213984', 'standard', 'C128', 1, 2, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(61, 'Lavender Air Cabina', '89223597', 'standard', 'C128', 1, 2, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(62, 'Luminosity Wash Cabina', '90336124', 'standard', 'C128', 1, 2, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(63, 'Matifier Serum Cabina', '22131516', 'standard', 'C128', 1, 2, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(64, 'O2 DB Revitalizing Cabina', '18409304', 'standard', 'C128', 1, 2, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(65, 'Papaya Pumpkin Detox Cabina', '61994122', 'standard', 'C128', 1, 2, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(66, 'Peel 35 Pro', '39389357', 'standard', 'C128', 1, 2, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(67, 'Peel 70 Pro', '10058915', 'standard', 'C128', 1, 2, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(68, 'Pineapple Papaya Peel', '98633911', 'standard', 'C128', 1, 2, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(69, 'Satin Essence Cleanser Cabina', '53921090', 'standard', 'C128', 1, 2, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(70, 'Strawberry Rose Mask Cabina', '16403549', 'standard', 'C128', 1, 2, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(71, 'Velvet Gel Cabina', '87621422', 'standard', 'C128', 1, 2, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-01 15:43:26', '2022-07-05 17:12:52'),
(72, 'Acne Control System', '40293317', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(73, 'Skin Brightening system', '12769893', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(74, 'La Shampoo', '73223112', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(75, 'Green Spoup', '91706838', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(76, 'Lovely Mom Kit', '18343590', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(77, 'Intensive Brighten Mom', '30334121', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(78, 'Age Reverse Travel Kit', '25871215', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(79, 'Age Reverse System Kit', '32078699', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(80, 'Magestic Glow Kit', '85294760', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(81, 'Agua Micellar Pads', '38216006', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(82, 'Makeup Vanille Gold', '43117652', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(83, 'Makeup Caramel Macaron', '75602509', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(84, 'Makeup Vintage Rose', '29059801', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(85, 'Makeup Candy passion', '29716679', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(86, 'Makup Wild  Apricot', '57900106', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(87, 'Collagen Eye Mask', '22050653', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(88, 'Eyebrow Gel Late Brown', '49293050', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(89, 'Eyebrow Gel Mocca Brown', '55278041', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(90, 'Agua Micellar', '29423389', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(91, 'Filler Orange', '18196083', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(92, 'Filler Red', '36709708', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(93, 'Serum hair / Perfum Hair', '73963621', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(94, 'Anesthetic Dermanumb 2', '60757264', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(95, 'Lash Lift', '83000327', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(96, 'Brows Lift (Laminated)', '29257548', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(97, 'Foam Eye Patches Dermabless', '49547530', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(98, 'Microaplicador Pink', '45132180', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(99, 'Wrap Microbleding', '95022944', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(100, 'Anestheic Ultra Duration', '83010927', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(101, 'Anestheic Charme', '16019340', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(102, 'Anestheic Blue Gel (Sustaine)', '68024013', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(103, 'Anestheic Tag#45', '49932216', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(104, 'Anestheic Zensa', '13125283', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(105, 'Anestheic Numb520', '87610932', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(106, 'MicroAguja MRF 49PIN (Dorado)', '19106222', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(107, 'Needle PHI 3R', '26570037', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(108, 'Needle PHI 1P', '71490194', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(109, 'Needle Microbladeing', '12187856', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(110, 'Needle Microbladeing 9 Double F', '12240435', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(111, 'Needle Microbladeing 5R', '37984259', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(112, 'Needle Microbladeing 3R', '17350806', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(113, 'Needle Microbladeing Academy', '28094626', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(114, 'Pigment Opm (14Black)', '47040123', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(115, 'Pigment Opm (4 Brown)', '68047570', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(116, 'Pigment Event Colors(Malina)', '23065673', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(117, 'Pigment Event Colors(Lulu Rose)', '78931062', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(118, 'Omp 14 Expresso', '99602780', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:52', '2022-07-05 17:12:52'),
(119, 'PHI Thinner', '53913687', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:53', '2022-07-05 17:12:53'),
(120, 'Mascara De Polvo(Green Tea)', '61203346', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:53', '2022-07-05 17:12:53'),
(121, 'Mascara De Polvo(Cool Ice)', '69721295', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:53', '2022-07-05 17:12:53'),
(122, 'Mascara De Polvo(Vitamin C)', '23132218', 'standard', 'C128', 1, 1, 1, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'zummXD2dvAtI.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '2022-07-05 17:12:53', '2022-07-05 17:12:53');

-- --------------------------------------------------------

--
-- Table structure for table `product_adjustments`
--

CREATE TABLE `product_adjustments` (
  `id` int(10) UNSIGNED NOT NULL,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `qty` double NOT NULL,
  `action` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_batches`
--

CREATE TABLE `product_batches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `batch_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_date` date NOT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_locations`
--

CREATE TABLE `product_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_purchase_id` int(10) UNSIGNED DEFAULT NULL,
  `product_transfer_id` int(11) DEFAULT NULL,
  `sales_location_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `date_out` datetime DEFAULT NULL,
  `before_location_id` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_purchases`
--

CREATE TABLE `product_purchases` (
  `id` int(10) UNSIGNED NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text COLLATE utf8mb4_unicode_ci,
  `qty` double NOT NULL,
  `recieved` double NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_quotation`
--

CREATE TABLE `product_quotation` (
  `id` int(10) UNSIGNED NOT NULL,
  `quotation_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `qty` double NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_returns`
--

CREATE TABLE `product_returns` (
  `id` int(10) UNSIGNED NOT NULL,
  `return_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text COLLATE utf8mb4_unicode_ci,
  `qty` double NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_sales`
--

CREATE TABLE `product_sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text COLLATE utf8mb4_unicode_ci,
  `qty` double NOT NULL,
  `sale_unit_id` int(11) NOT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_transfer`
--

CREATE TABLE `product_transfer` (
  `id` int(10) UNSIGNED NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text COLLATE utf8mb4_unicode_ci,
  `qty` double NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `item_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `additional_price` double DEFAULT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_warehouse`
--

CREATE TABLE `product_warehouse` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text COLLATE utf8mb4_unicode_ci,
  `warehouse_id` int(11) NOT NULL,
  `qty` double NOT NULL,
  `price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `paid_amount` double NOT NULL,
  `status` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_product_return`
--

CREATE TABLE `purchase_product_return` (
  `id` int(10) UNSIGNED NOT NULL,
  `return_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_batch_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `imei_number` text COLLATE utf8mb4_unicode_ci,
  `qty` double NOT NULL,
  `purchase_unit_id` int(11) NOT NULL,
  `net_unit_cost` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE `quotations` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `quotation_status` int(11) NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `returns`
--

CREATE TABLE `returns` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_note` text COLLATE utf8mb4_unicode_ci,
  `staff_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `return_purchases`
--

CREATE TABLE `return_purchases` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_note` text COLLATE utf8mb4_unicode_ci,
  `staff_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reward_point_settings`
--

CREATE TABLE `reward_point_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `per_point_amount` double NOT NULL,
  `minimum_amount` double NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reward_point_settings`
--

INSERT INTO `reward_point_settings` (`id`, `per_point_amount`, `minimum_amount`, `duration`, `type`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 300, 1000, 1, 'Year', 1, '2021-06-08 15:40:15', '2021-06-27 05:20:55');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `guard_name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin can access all data...', 'web', 1, '2018-06-01 23:46:44', '2018-06-02 23:13:05'),
(2, 'Owner', 'Staff of shop', 'web', 1, '2018-10-22 02:38:13', '2022-02-01 13:13:30'),
(4, 'staff', 'staff has specific acess...', 'web', 1, '2018-06-02 00:05:27', '2022-02-01 13:13:04'),
(5, 'Customer', NULL, 'web', 1, '2020-11-05 06:43:16', '2020-11-15 00:24:15');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(43, 2),
(44, 2),
(45, 2),
(46, 2),
(47, 2),
(48, 2),
(49, 2),
(50, 2),
(51, 2),
(52, 2),
(53, 2),
(54, 2),
(55, 2),
(56, 2),
(57, 2),
(58, 2),
(59, 2),
(60, 2),
(61, 2),
(62, 2),
(63, 2),
(64, 2),
(65, 2),
(66, 2),
(67, 2),
(68, 2),
(69, 2),
(70, 2),
(71, 2),
(72, 2),
(73, 2),
(74, 2),
(75, 2),
(76, 2),
(77, 2),
(78, 2),
(79, 2),
(80, 2),
(81, 2),
(82, 2),
(83, 2),
(84, 2),
(85, 2),
(86, 2),
(87, 2),
(88, 2),
(89, 2),
(90, 2),
(91, 2),
(92, 2),
(93, 2),
(94, 2),
(95, 2),
(96, 2),
(97, 2),
(98, 2),
(99, 2),
(100, 2),
(101, 2),
(102, 2),
(103, 2),
(104, 2),
(105, 2),
(4, 4),
(6, 4),
(7, 4),
(8, 4),
(9, 4),
(12, 4),
(13, 4),
(20, 4),
(21, 4),
(22, 4),
(24, 4),
(25, 4),
(28, 4),
(29, 4),
(55, 4),
(56, 4),
(57, 4),
(63, 4),
(64, 4);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `cash_register_id` int(11) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_price` double NOT NULL,
  `grand_total` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_discount_value` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `coupon_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `sale_status` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `sale_note` text COLLATE utf8mb4_unicode_ci,
  `staff_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_location`
--

CREATE TABLE `sales_location` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_sales_id` int(10) UNSIGNED DEFAULT NULL,
  `product_transfer_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_counts`
--

CREATE TABLE `stock_counts` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `category_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `initial_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `final_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `is_adjusted` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vat_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `from_warehouse_id` int(11) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `total_qty` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(10) UNSIGNED NOT NULL,
  `unit_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_unit` int(11) DEFAULT NULL,
  `operator` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operation_value` double DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `unit_code`, `unit_name`, `base_unit`, `operator`, `operation_value`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'pm', 'Piece', NULL, '*', 1, 1, '2022-07-01 15:39:59', '2022-07-05 17:12:22'),
(2, '18', 'Kit', 2, 'Kit', 1, 1, '2022-07-01 21:24:03', '2022-07-01 21:24:21');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `phone`, `company_name`, `role_id`, `biller_id`, `warehouse_id`, `is_active`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$10$DWAHTfjcvwCpOCXaJg11MOhsqns03uvlwiSUOQwkHL2YYrtrXPcL6', '4vACrV8l4zYOXyNKMj2FfwZDIxM8eBwBePnWa20xe6bD7o2JKGYIsgepRa8B', '12112', 'lioncoders', 1, NULL, NULL, 0, 1, '2018-06-02 03:24:15', '2022-06-15 04:44:13'),
(3, 'dhiman da', 'dhiman@gmail.com', '$2y$10$Fef6vu5E67nm11hX7V5a2u1ThNCQ6n9DRCvRF9TD7stk.Pmt2R6O.', '5ehQM6JIfiQfROgTbB5let0Z93vjLHS7rd9QD5RPNgOxli3xdo7fykU7vtTt', '212', 'lioncoders', 1, NULL, NULL, 0, 1, '2018-06-13 22:00:31', '2020-11-05 07:06:51'),
(6, 'test', 'test@gmail.com', '$2y$10$TDAeHcVqHyCmurki0wjLZeIl1SngKX3WLOhyTiCoZG3souQfqv.LS', 'KpW1gYYlOFacumklO2IcRfSsbC3KcWUZzOI37gqoqM388Xie6KdhaOHIFEYm', '1234', '212312', 4, NULL, NULL, 0, 1, '2018-06-23 03:05:33', '2018-06-23 03:13:45'),
(8, 'test', 'test@yahoo.com', '$2y$10$hlMigidZV0j2/IPkgE/xsOSb8WM2IRlsMv.1hg1NM7kfyd6bGX3hC', NULL, '31231', NULL, 4, NULL, NULL, 0, 1, '2018-06-24 22:35:49', '2018-07-02 01:07:39'),
(9, 'staff', 'anda@gmail.com', '$2y$10$kxDbnynB6mB1e1w3pmtbSOlSxy/WwbLPY5TJpMi0Opao5ezfuQjQm', 'Y6cOLyOXtSEMA7YydDwoMk3g4TwtKqmC0n3xJYmKZ93uMADZtTG6ZfXBYpNY', '3123', NULL, 4, 5, 1, 1, 0, '2018-07-02 01:08:08', '2018-10-23 21:41:13'),
(10, 'abul', 'abul@alpha.com', '$2y$10$5zgB2OOMyNBNVAd.QOQIju5a9fhNnTqPx5H6s4oFlXhNiF6kXEsPq', 'x7HlttI5bM0vSKViqATaowHFJkLS3PHwfvl7iJdFl5Z1SsyUgWCVbLSgAoi0', '1234', 'anda', 1, NULL, NULL, 0, 0, '2018-09-07 23:44:48', '2018-09-07 23:44:48'),
(11, 'teststaff', 'a@a.com', '$2y$10$5KNBIIhZzvvZEQEhkHaZGu.Q8bbQNfqYvYgL5N55B8Pb4P5P/b/Li', 'DkHDEcCA0QLfsKPkUK0ckL0CPM6dPiJytNa0k952gyTbeAyMthW3vi7IRitp', '111', 'aa', 4, 5, 1, 0, 1, '2018-10-22 02:47:56', '2018-10-23 02:10:56'),
(12, 'john', 'john@gmail.com', '$2y$10$P/pN2J/uyTYNzQy2kRqWwuSv7P2f6GE/ykBwtHdda7yci3XsfOKWe', 'O0f1WJBVjT5eKYl3Js5l1ixMMtoU6kqrH7hbHDx9I1UCcD9CmiSmCBzHbQZg', '10001', NULL, 4, 2, 2, 0, 1, '2018-12-30 00:48:37', '2019-03-06 04:59:49'),
(13, 'jjj', 'test@test.com', '$2y$10$/Qx3gHWYWUhlF1aPfzXaCeZA7fRzfSEyCIOnk/dcC4ejO8PsoaalG', NULL, '1213', NULL, 1, NULL, NULL, 0, 1, '2019-01-03 00:08:31', '2019-03-03 04:02:29'),
(19, 'shakalaka', 'shakalaka@gmail.com', '$2y$10$ketLWT0Ib/JXpo00eJlxoeSw.7leS8V1CUGInfbyOWT4F5.Xuo7S2', NULL, '1212', 'Digital image', 5, NULL, NULL, 1, 0, '2020-11-09 00:07:16', '2020-11-09 00:07:16'),
(21, 'modon', 'modon@gmail.com', '$2y$10$7VpoeGMkP8QCvL5zLwFW..6MYJ5MRumDLDoX.TTQtClS561rpFHY.', NULL, '2222', 'modon company', 5, NULL, NULL, 1, 0, '2020-11-13 07:12:08', '2020-11-13 07:12:08'),
(22, 'dhiman', 'dhiman@gmail.com', '$2y$10$3mPygsC6wwnDtw/Sg85IpuExtUhgaHx52Lwp7Rz0.FNfuFdfKVpRq', NULL, '+8801111111101', 'lioncoders', 5, NULL, NULL, 1, 0, '2020-11-15 06:14:58', '2020-11-15 06:14:58'),
(31, 'mbs', 'mbs@gmail.com', '$2y$10$6Ldm1rWEVSrlTmpjIXkeQO9KwWJz/j0FB4U.fY1oCFeax47rvttEK', NULL, '2121', NULL, 4, 1, 2, 0, 0, '2021-12-29 06:40:22', '2021-12-29 06:40:22'),
(36, 'caky', 'masamor29@gmail.com', '$2y$10$uol9lh6rxknqpJc7hXD5q.g6lMHC4AFin/jTfk7CVHqnVtRIBSFk2', NULL, '3059753428', 'dermabless', 1, NULL, NULL, 1, 0, '2022-06-15 04:43:21', '2022-06-15 04:43:21'),
(37, 'JoseGarcia', 'dermabless.inc@gmail.com', '$2y$10$cLVWUMiL8DHmQVYK8RECPOiZ2JgNQahFB/YHIOLKR4B6qfTxp9eOi', NULL, '3057810892', 'Dermabless Owner', 1, NULL, NULL, 1, 0, '2022-06-30 23:07:49', '2022-07-02 17:05:07');

-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `name`, `phone`, `email`, `address`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Main Warehouse', '305-781-0892', NULL, '112', 1, '2022-07-01 13:16:46', '2022-07-01 13:16:46'),
(2, 'Dermabless Spa Warehouse', '305-922-1460', NULL, '106', 1, '2022-07-01 13:18:04', '2022-07-01 13:18:38'),
(3, 'Academia', '305) 922-1460', NULL, '7801 Coral Way  Miami, FL 33155', 1, '2022-07-05 17:15:25', '2022-07-05 17:15:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adjustments`
--
ALTER TABLE `adjustments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billers`
--
ALTER TABLE `billers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount_plans`
--
ALTER TABLE `discount_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount_plan_customers`
--
ALTER TABLE `discount_plan_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount_plan_discounts`
--
ALTER TABLE `discount_plan_discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dso_alerts`
--
ALTER TABLE `dso_alerts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gift_cards`
--
ALTER TABLE `gift_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gift_card_recharges`
--
ALTER TABLE `gift_card_recharges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hrm_settings`
--
ALTER TABLE `hrm_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `money_transfers`
--
ALTER TABLE `money_transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_with_cheque`
--
ALTER TABLE `payment_with_cheque`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_with_credit_card`
--
ALTER TABLE `payment_with_credit_card`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_with_gift_card`
--
ALTER TABLE `payment_with_gift_card`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_with_paypal`
--
ALTER TABLE `payment_with_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payrolls`
--
ALTER TABLE `payrolls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_setting`
--
ALTER TABLE `pos_setting`
  ADD UNIQUE KEY `pos_setting_id_unique` (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_adjustments`
--
ALTER TABLE `product_adjustments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_batches`
--
ALTER TABLE `product_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_locations`
--
ALTER TABLE `product_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_purchases`
--
ALTER TABLE `product_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_quotation`
--
ALTER TABLE `product_quotation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_returns`
--
ALTER TABLE `product_returns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_sales`
--
ALTER TABLE `product_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_transfer`
--
ALTER TABLE `product_transfer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_warehouse`
--
ALTER TABLE `product_warehouse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_product_return`
--
ALTER TABLE `purchase_product_return`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `returns`
--
ALTER TABLE `returns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `return_purchases`
--
ALTER TABLE `return_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reward_point_settings`
--
ALTER TABLE `reward_point_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_location`
--
ALTER TABLE `sales_location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_counts`
--
ALTER TABLE `stock_counts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `adjustments`
--
ALTER TABLE `adjustments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `billers`
--
ALTER TABLE `billers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cash_registers`
--
ALTER TABLE `cash_registers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discount_plans`
--
ALTER TABLE `discount_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discount_plan_customers`
--
ALTER TABLE `discount_plan_customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discount_plan_discounts`
--
ALTER TABLE `discount_plan_discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dso_alerts`
--
ALTER TABLE `dso_alerts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gift_cards`
--
ALTER TABLE `gift_cards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gift_card_recharges`
--
ALTER TABLE `gift_card_recharges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hrm_settings`
--
ALTER TABLE `hrm_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=774;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT for table `money_transfers`
--
ALTER TABLE `money_transfers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_with_cheque`
--
ALTER TABLE `payment_with_cheque`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_with_credit_card`
--
ALTER TABLE `payment_with_credit_card`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_with_gift_card`
--
ALTER TABLE `payment_with_gift_card`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_with_paypal`
--
ALTER TABLE `payment_with_paypal`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payrolls`
--
ALTER TABLE `payrolls`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `product_adjustments`
--
ALTER TABLE `product_adjustments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_batches`
--
ALTER TABLE `product_batches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_locations`
--
ALTER TABLE `product_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_purchases`
--
ALTER TABLE `product_purchases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_quotation`
--
ALTER TABLE `product_quotation`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_returns`
--
ALTER TABLE `product_returns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_sales`
--
ALTER TABLE `product_sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_transfer`
--
ALTER TABLE `product_transfer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_warehouse`
--
ALTER TABLE `product_warehouse`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_product_return`
--
ALTER TABLE `purchase_product_return`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `returns`
--
ALTER TABLE `returns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `return_purchases`
--
ALTER TABLE `return_purchases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reward_point_settings`
--
ALTER TABLE `reward_point_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_location`
--
ALTER TABLE `sales_location`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_counts`
--
ALTER TABLE `stock_counts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
