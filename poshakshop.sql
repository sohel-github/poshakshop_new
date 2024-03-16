-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 02, 2024 at 08:15 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `poshakshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

CREATE TABLE `addons` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unique_identifier` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activated` int(1) NOT NULL DEFAULT 1,
  `image` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `addons`
--

INSERT INTO `addons` (`id`, `name`, `unique_identifier`, `version`, `activated`, `image`, `created_at`, `updated_at`) VALUES
(1, 'refund', 'refund_request', '1.2', 1, 'refund_request.png', '2021-08-16 18:37:08', '2021-08-16 18:37:08'),
(2, 'OTP', 'otp_system', '1.5', 1, 'otp_system.jpg', '2021-08-16 18:37:40', '2021-09-05 17:04:17'),
(3, 'club_point', 'club_point', '1.3', 0, 'club_points.png', '2021-08-16 18:38:14', '2022-11-24 10:55:28'),
(4, 'affiliate', 'affiliate_system', '1.6', 1, 'affiliate_banner.jpg', '2021-08-16 19:24:01', '2021-10-07 06:36:28'),
(5, 'delivery_boy', 'delivery_boy', '1.1', 1, 'delivery_boy.png', '2021-09-08 10:12:59', '2021-09-09 06:10:01'),
(6, 'Point of Sale', 'pos_system', '1.5', 1, 'pos_banner.jpg', '2021-09-08 10:18:05', '2021-09-09 06:10:01');

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `division` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `district` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `area` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cost` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `set_default` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `address`, `country`, `division`, `district`, `area`, `cost`, `city`, `longitude`, `latitude`, `postal_code`, `phone`, `set_default`, `created_at`, `updated_at`) VALUES
(61, 130, 'sfgdsg', 'Bangladesh', '', '', '', '', 'Dhaka', NULL, NULL, '1212', '01874042227', 0, '2022-06-21 09:06:45', '2022-06-21 09:06:45'),
(65, 140, 'Ja - 82/1, Link Road', 'Bangladesh', '', '', '', '', 'Dhaka', NULL, NULL, '1212', '01717702480', 0, '2022-11-05 07:50:49', '2022-11-05 07:50:49'),
(66, 124, '125, Dinajpur Sadar', 'Bangladesh', 'Rangpur', 'Dinajpur', 'Dinajpur Sadar', '100', NULL, NULL, NULL, '1234', '+8801818222333', 0, '2023-01-31 13:05:50', '2023-01-31 13:05:50');

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_configs`
--

CREATE TABLE `affiliate_configs` (
  `id` int(11) NOT NULL,
  `type` varchar(1000) COLLATE utf32_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf32_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `affiliate_configs`
--

INSERT INTO `affiliate_configs` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'verification_form', '[{\"type\":\"text\",\"label\":\"Your name\"},{\"type\":\"text\",\"label\":\"Email\"},{\"type\":\"text\",\"label\":\"Full Address\"},{\"type\":\"text\",\"label\":\"Phone Number\"},{\"type\":\"text\",\"label\":\"How will you affiliate?\"}]', '2020-03-09 09:56:21', '2020-03-09 04:30:59'),
(2, 'validation_time', '7', '2021-09-10 17:19:43', '2021-09-10 17:19:43');

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_logs`
--

CREATE TABLE `affiliate_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `guest_id` int(11) DEFAULT NULL,
  `referred_by_user` int(11) NOT NULL,
  `amount` double(20,2) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `order_detail_id` bigint(20) DEFAULT NULL,
  `affiliate_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_options`
--

CREATE TABLE `affiliate_options` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `details` longtext COLLATE utf32_unicode_ci DEFAULT NULL,
  `percentage` double NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `affiliate_options`
--

INSERT INTO `affiliate_options` (`id`, `type`, `details`, `percentage`, `status`, `created_at`, `updated_at`) VALUES
(2, 'user_registration_first_purchase', '[]', 10, 1, '2020-03-03 05:08:37', '2021-09-10 17:19:57'),
(3, 'product_sharing', '{\"commission\":\"5\",\"commission_type\":\"amount\"}', 20, 1, '2020-03-08 01:55:03', '2021-09-10 17:18:52'),
(4, 'category_wise_affiliate', NULL, 0, 0, '2020-03-08 01:55:03', '2020-03-10 02:12:32');

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_payments`
--

CREATE TABLE `affiliate_payments` (
  `id` int(11) NOT NULL,
  `affiliate_user_id` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `affiliate_payments`
--

INSERT INTO `affiliate_payments` (`id`, `affiliate_user_id`, `amount`, `payment_method`, `payment_details`, `created_at`, `updated_at`) VALUES
(2, 1, 20.00, 'Paypal', NULL, '2020-03-10 02:04:30', '2020-03-10 02:04:30');

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_stats`
--

CREATE TABLE `affiliate_stats` (
  `id` int(11) NOT NULL,
  `affiliate_user_id` int(11) NOT NULL,
  `no_of_click` int(11) NOT NULL DEFAULT 0,
  `no_of_order_item` int(11) NOT NULL DEFAULT 0,
  `no_of_delivered` int(11) NOT NULL DEFAULT 0,
  `no_of_cancel` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_users`
--

CREATE TABLE `affiliate_users` (
  `id` int(11) NOT NULL,
  `paypal_email` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `bank_information` text COLLATE utf32_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `informations` text COLLATE utf32_unicode_ci DEFAULT NULL,
  `balance` double(10,2) NOT NULL DEFAULT 0.00,
  `status` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `affiliate_users`
--

INSERT INTO `affiliate_users` (`id`, `paypal_email`, `bank_information`, `user_id`, `informations`, `balance`, `status`, `created_at`, `updated_at`) VALUES
(1, 'demo@gmail.com', '123456', 8, '[{\"type\":\"text\",\"label\":\"Your name\",\"value\":\"Nostrum dicta sint l\"},{\"type\":\"text\",\"label\":\"Email\",\"value\":\"Aut perferendis null\"},{\"type\":\"text\",\"label\":\"Full Address\",\"value\":\"Voluptatem Sit dolo\"},{\"type\":\"text\",\"label\":\"Phone Number\",\"value\":\"Ut ad beatae occaeca\"},{\"type\":\"text\",\"label\":\"How will you affiliate?\",\"value\":\"Porro sint soluta u\"}]', 30.00, 1, '2020-03-09 05:35:07', '2020-03-10 02:04:30');

-- --------------------------------------------------------

--
-- Table structure for table `affiliate_withdraw_requests`
--

CREATE TABLE `affiliate_withdraw_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double(10,2) NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_settings`
--

CREATE TABLE `app_settings` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `currency_format` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_plus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `app_settings`
--

INSERT INTO `app_settings` (`id`, `name`, `logo`, `currency_id`, `currency_format`, `facebook`, `twitter`, `instagram`, `youtube`, `google_plus`, `created_at`, `updated_at`) VALUES
(1, 'Active eCommerce', 'uploads/logo/matggar.png', 1, 'symbol', 'https://facebook.com', 'https://twitter.com', 'https://instagram.com', 'https://youtube.com', 'https://google.com', '2019-08-04 16:39:15', '2019-08-04 16:39:18');

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cost` varchar(255) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `district_id`, `name`, `cost`, `created_at`, `updated_at`) VALUES
(2, 11, 'Gangachara', '120', '2023-01-28', '2023-01-28'),
(3, 4, 'Dinajpur Sadar', '100', '2023-01-28', '2023-01-28');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Size', '2022-10-29 07:32:47', '2022-10-29 07:32:47'),
(2, 'Color', '2022-10-29 07:32:57', '2022-10-29 07:32:57'),
(3, 'Size by Number', '2022-11-12 09:12:38', '2022-11-12 09:12:38');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_translations`
--

CREATE TABLE `attribute_translations` (
  `id` bigint(20) NOT NULL,
  `attribute_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `attribute_translations`
--

INSERT INTO `attribute_translations` (`id`, `attribute_id`, `name`, `lang`, `created_at`, `updated_at`) VALUES
(8, 1, 'Size', 'en', '2022-10-29 07:32:47', '2022-10-29 07:32:47'),
(9, 2, 'Color', 'en', '2022-10-29 07:32:57', '2022-10-29 07:32:57'),
(10, 3, 'Size by Number', 'en', '2022-11-12 09:12:38', '2022-11-12 09:12:38');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `attribute_value_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `color_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `attribute_values`
--

INSERT INTO `attribute_values` (`id`, `attribute_id`, `attribute_value_name`, `color_code`, `created_at`, `updated_at`) VALUES
(248, 1, 'S', NULL, '2022-10-29 07:33:41', '2022-10-29 07:33:41'),
(249, 1, 'M', NULL, '2022-10-29 07:33:49', '2022-10-29 07:33:49'),
(250, 1, 'L', NULL, '2022-10-29 07:34:08', '2022-10-29 07:34:08'),
(251, 1, 'XL', NULL, '2022-10-29 07:34:17', '2022-10-29 07:34:17'),
(252, 1, 'XXL', NULL, '2022-10-29 07:34:25', '2022-10-29 07:34:25'),
(253, 1, 'XXXL', NULL, '2022-10-29 07:34:35', '2022-10-29 07:34:35'),
(254, 2, 'Red', NULL, '2022-10-29 07:35:36', '2022-10-29 07:35:36'),
(255, 2, 'Green', NULL, '2022-10-29 07:35:45', '2022-10-29 07:35:45'),
(256, 2, 'Blue', NULL, '2022-10-29 07:35:55', '2022-10-29 07:35:55'),
(257, 2, 'Pink', NULL, '2022-10-29 07:36:04', '2022-10-29 07:36:04'),
(258, 2, 'Purple', NULL, '2022-10-29 07:36:15', '2022-10-29 07:36:15'),
(259, 2, 'Pink', NULL, '2022-10-29 07:36:25', '2022-10-29 07:36:25'),
(260, 2, 'Black', NULL, '2022-10-29 07:36:32', '2022-10-29 07:36:32'),
(261, 2, 'White', NULL, '2022-10-29 07:36:41', '2022-10-29 07:36:41'),
(262, 2, 'Orange', NULL, '2022-10-29 07:36:55', '2022-10-29 07:36:55'),
(263, 3, '20', NULL, '2022-11-12 09:12:57', '2022-11-12 09:12:57'),
(264, 3, '22', NULL, '2022-11-12 09:13:05', '2022-11-12 09:13:05'),
(265, 3, '24', NULL, '2022-11-12 09:13:13', '2022-11-12 09:13:13'),
(266, 3, '26', NULL, '2022-11-12 09:13:23', '2022-11-12 09:13:23'),
(267, 3, '28', NULL, '2022-11-12 09:13:33', '2022-11-12 09:13:33'),
(268, 3, '30', NULL, '2022-11-12 09:13:41', '2022-11-12 09:13:41');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 1,
  `published` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `banner` int(11) DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_img` int(11) DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `top` int(1) NOT NULL DEFAULT 0,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brand_translations`
--

CREATE TABLE `brand_translations` (
  `id` bigint(20) NOT NULL,
  `brand_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` int(11) NOT NULL,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `type`, `value`, `lang`, `created_at`, `updated_at`) VALUES
(1, 'home_default_currency', '27', NULL, '2018-10-16 01:35:52', '2021-08-16 11:37:38'),
(2, 'system_default_currency', '27', NULL, '2018-10-16 01:36:58', '2021-08-16 11:37:38'),
(3, 'currency_format', '1', NULL, '2018-10-17 03:01:59', '2018-10-17 03:01:59'),
(4, 'symbol_format', '1', NULL, '2018-10-17 03:01:59', '2019-01-20 02:10:55'),
(5, 'no_of_decimals', '2', NULL, '2018-10-17 03:01:59', '2020-03-04 00:57:16'),
(6, 'product_activation', '1', NULL, '2018-10-28 01:38:37', '2019-02-04 01:11:41'),
(7, 'vendor_system_activation', '0', NULL, '2018-10-28 07:44:16', '2022-11-05 08:15:01'),
(8, 'show_vendors', '1', NULL, '2018-10-28 07:44:47', '2019-02-04 01:11:13'),
(9, 'paypal_payment', '0', NULL, '2018-10-28 07:45:16', '2019-01-31 05:09:10'),
(10, 'stripe_payment', '0', NULL, '2018-10-28 07:45:47', '2018-11-14 01:51:51'),
(11, 'cash_payment', '1', NULL, '2018-10-28 07:46:05', '2019-01-24 03:40:18'),
(12, 'payumoney_payment', '0', NULL, '2018-10-28 07:46:27', '2019-03-05 05:41:36'),
(13, 'best_selling', '1', NULL, '2018-12-24 08:13:44', '2019-02-14 05:29:13'),
(14, 'paypal_sandbox', '0', NULL, '2019-01-16 12:44:18', '2019-01-16 12:44:18'),
(15, 'sslcommerz_sandbox', '1', NULL, '2019-01-16 12:44:18', '2019-03-14 00:07:26'),
(16, 'sslcommerz_payment', '0', NULL, '2019-01-24 09:39:07', '2022-06-21 09:08:15'),
(17, 'vendor_commission', '20', NULL, '2019-01-31 06:18:04', '2019-04-13 06:49:26'),
(18, 'verification_form', '[{\"type\":\"text\",\"label\":\"Your name\"},{\"type\":\"text\",\"label\":\"Shop name\"},{\"type\":\"text\",\"label\":\"Email\"},{\"type\":\"text\",\"label\":\"License No\"},{\"type\":\"text\",\"label\":\"Full Address\"},{\"type\":\"text\",\"label\":\"Phone Number\"},{\"type\":\"file\",\"label\":\"Tax Papers\"}]', NULL, '2019-02-03 11:36:58', '2019-02-16 06:14:42'),
(19, 'google_analytics', '1', NULL, '2019-02-06 12:22:35', '2021-09-09 10:47:42'),
(20, 'facebook_login', '0', NULL, '2019-02-07 12:51:59', '2022-11-25 10:51:29'),
(21, 'google_login', '0', NULL, '2019-02-07 12:52:10', '2022-11-25 10:51:31'),
(22, 'twitter_login', '0', NULL, '2019-02-07 12:52:20', '2022-11-15 17:03:33'),
(23, 'payumoney_payment', '1', NULL, '2019-03-05 11:38:17', '2019-03-05 11:38:17'),
(24, 'payumoney_sandbox', '1', NULL, '2019-03-05 11:38:17', '2019-03-05 05:39:18'),
(36, 'facebook_chat', '0', NULL, '2019-04-15 11:45:04', '2021-08-31 07:35:48'),
(37, 'email_verification', '0', NULL, '2019-04-30 07:30:07', '2019-04-30 07:30:07'),
(38, 'wallet_system', '0', NULL, '2019-05-19 08:05:44', '2022-04-17 08:52:37'),
(39, 'coupon_system', '0', NULL, '2019-06-11 09:46:18', '2022-04-17 08:52:42'),
(40, 'current_version', '5.0', NULL, '2019-06-11 09:46:18', '2019-06-11 09:46:18'),
(41, 'instamojo_payment', '0', NULL, '2019-07-06 09:58:03', '2019-07-06 09:58:03'),
(42, 'instamojo_sandbox', '1', NULL, '2019-07-06 09:58:43', '2019-07-06 09:58:43'),
(43, 'razorpay', '0', NULL, '2019-07-06 09:58:43', '2019-07-06 09:58:43'),
(44, 'paystack', '0', NULL, '2019-07-21 13:00:38', '2019-07-21 13:00:38'),
(45, 'pickup_point', '0', NULL, '2019-10-17 11:50:39', '2022-11-05 08:13:44'),
(46, 'maintenance_mode', '0', NULL, '2019-10-17 11:51:04', '2019-10-17 11:51:04'),
(47, 'voguepay', '0', NULL, '2019-10-17 11:51:24', '2019-10-17 11:51:24'),
(48, 'voguepay_sandbox', '0', NULL, '2019-10-17 11:51:38', '2019-10-17 11:51:38'),
(50, 'category_wise_commission', '0', NULL, '2020-01-21 07:22:47', '2021-11-16 05:43:29'),
(51, 'conversation_system', '0', NULL, '2020-01-21 07:23:21', '2022-11-05 08:14:20'),
(52, 'guest_checkout_active', '1', NULL, '2020-01-22 07:36:38', '2020-01-22 07:36:38'),
(53, 'facebook_pixel', '1', NULL, '2020-01-22 11:43:58', '2021-09-08 17:15:16'),
(55, 'classified_product', '0', NULL, '2020-05-13 13:01:05', '2021-11-16 05:42:33'),
(56, 'pos_activation_for_seller', '0', NULL, '2020-06-11 09:45:02', '2021-11-09 10:30:20'),
(57, 'shipping_type', 'area_wise_shipping', NULL, '2020-07-01 13:49:56', '2022-11-15 17:01:30'),
(58, 'flat_rate_shipping_cost', '50', NULL, '2020-07-01 13:49:56', '2021-09-28 11:02:04'),
(59, 'shipping_cost_admin', '0', NULL, '2020-07-01 13:49:56', '2020-07-01 13:49:56'),
(60, 'payhere_sandbox', '0', NULL, '2020-07-30 18:23:53', '2020-07-30 18:23:53'),
(61, 'payhere', '0', NULL, '2020-07-30 18:23:53', '2020-07-30 18:23:53'),
(62, 'google_recaptcha', '0', NULL, '2020-08-17 07:13:37', '2020-08-17 07:13:37'),
(63, 'ngenius', '0', NULL, '2020-09-22 10:58:21', '2020-09-22 10:58:21'),
(64, 'header_logo', '2377', NULL, '2020-11-16 07:26:36', '2022-10-25 06:14:09'),
(65, 'show_language_switcher', 'on', NULL, '2020-11-16 07:26:36', '2021-09-26 08:37:50'),
(66, 'show_currency_switcher', 'on', NULL, '2020-11-16 07:26:36', '2021-09-26 08:37:50'),
(67, 'header_stikcy', 'on', NULL, '2020-11-16 07:26:36', '2020-11-16 07:26:36'),
(68, 'footer_logo', '2377', NULL, '2020-11-16 07:26:36', '2022-10-25 06:25:35'),
(69, 'about_us_description', NULL, NULL, '2020-11-16 07:26:36', '2020-11-16 07:26:36'),
(70, 'contact_address', NULL, NULL, '2020-11-16 07:26:36', '2020-11-16 07:26:36'),
(71, 'contact_phone', '+ 88 01711663381 , +88 01554208456', NULL, '2020-11-16 07:26:36', '2022-10-25 06:26:31'),
(72, 'contact_email', 'info@poshakshop.com or poshakshop.com@gmail.com', NULL, '2020-11-16 07:26:36', '2022-10-25 06:28:05'),
(73, 'widget_one_labels', NULL, NULL, '2020-11-16 07:26:36', '2020-11-16 07:26:36'),
(74, 'widget_one_links', '[\"terms\",\"returnpolicy\",\"privacypolicy\",\"about-us\"]', NULL, '2020-11-16 07:26:36', '2022-10-25 06:55:49'),
(75, 'widget_one', NULL, NULL, '2020-11-16 07:26:36', '2020-11-16 07:26:36'),
(76, 'frontend_copyright_text', NULL, NULL, '2020-11-16 07:26:36', '2020-11-16 07:26:36'),
(77, 'show_social_links', 'on', NULL, '2020-11-16 07:26:36', '2021-08-18 08:23:22'),
(78, 'facebook_link', 'https://www.facebook.com/poshakshopcom/', NULL, '2020-11-16 07:26:36', '2022-10-25 06:25:03'),
(79, 'twitter_link', 'https://twitter.com/poshakshopcom', NULL, '2020-11-16 07:26:36', '2022-10-25 06:25:03'),
(80, 'instagram_link', 'https://www.instagram.com/poshakshopcom/', NULL, '2020-11-16 07:26:36', '2022-10-25 06:25:03'),
(81, 'youtube_link', 'https://www.youtube.com/channel/UCXa3M3sPVpb4ZFXUO_OyAIA', NULL, '2020-11-16 07:26:36', '2022-10-25 06:25:03'),
(82, 'linkedin_link', 'https://www.pinterest.com/poshakshopcom', NULL, '2020-11-16 07:26:36', '2022-10-25 06:25:03'),
(83, 'payment_method_images', '30,31,32,33', NULL, '2020-11-16 07:26:36', '2021-08-18 08:46:17'),
(84, 'home_slider_images', '[\"2378\",\"2380\",\"2379\",\"2379\"]', NULL, '2020-11-16 07:26:36', '2022-10-25 06:34:25'),
(85, 'home_slider_links', '[\"#\",\"#\",\"#\",\"#\"]', NULL, '2020-11-16 07:26:36', '2022-10-25 06:34:25'),
(86, 'home_banner1_images', '[null,null,null]', NULL, '2020-11-16 07:26:36', '2022-11-25 10:55:15'),
(87, 'home_banner1_links', '[\"#\",\"#\",\"#\"]', NULL, '2020-11-16 07:26:36', '2022-11-25 10:55:15'),
(88, 'home_banner2_images', '[\"2188\",\"2189\",\"2187\"]', NULL, '2020-11-16 07:26:36', '2021-10-17 09:01:45'),
(89, 'home_banner2_links', '[\"#\",\"#\",\"#\"]', NULL, '2020-11-16 07:26:36', '2021-10-17 09:01:45'),
(90, 'home_categories', '[\"296\",\"306\",\"310\",\"313\"]', NULL, '2020-11-16 07:26:36', '2022-10-29 13:59:26'),
(91, 'top10_categories', NULL, NULL, '2020-11-16 07:26:36', '2021-10-04 06:14:11'),
(92, 'top10_brands', NULL, NULL, '2020-11-16 07:26:36', '2021-10-04 06:14:11'),
(93, 'website_name', 'Poshakshop.com', NULL, '2020-11-16 07:26:36', '2022-10-25 06:31:41'),
(94, 'site_motto', 'Trusted Online Clothing Shop in Bangladesh', NULL, '2020-11-16 07:26:36', '2022-10-25 06:31:41'),
(95, 'site_icon', '2376', NULL, '2020-11-16 07:26:36', '2022-10-25 06:31:41'),
(96, 'base_color', '#006738', NULL, '2020-11-16 07:26:36', '2022-10-25 06:31:41'),
(97, 'base_hov_color', '#e12426', NULL, '2020-11-16 07:26:36', '2022-10-25 06:31:41'),
(98, 'meta_title', 'Poshakshop.com', NULL, '2020-11-16 07:26:36', '2022-10-25 06:32:17'),
(99, 'meta_description', 'Sale is Bangladesh\'s Fastest Growing online shop for Fashion, and Beauty, and many more!', NULL, '2020-11-16 07:26:36', '2022-10-25 06:32:17'),
(100, 'meta_keywords', 'Online shopping, Shopping, Best Online Shop, Online Shop,', NULL, '2020-11-16 07:26:36', '2021-08-16 18:18:03'),
(101, 'meta_image', '2377', NULL, '2020-11-16 07:26:36', '2022-10-25 06:32:17'),
(102, 'site_name', 'Poshakshop', NULL, '2020-11-16 07:26:36', '2022-10-25 06:52:36'),
(103, 'system_logo_white', '2377', NULL, '2020-11-16 07:26:36', '2022-10-25 06:52:36'),
(104, 'system_logo_black', '2377', NULL, '2020-11-16 07:26:36', '2022-10-25 06:52:36'),
(105, 'timezone', NULL, NULL, '2020-11-16 07:26:36', '2020-11-16 07:26:36'),
(106, 'admin_login_background', NULL, NULL, '2020-11-16 07:26:36', '2021-11-16 05:44:36'),
(107, 'iyzico_sandbox', '0', NULL, '2020-12-30 16:45:56', '2021-08-16 19:03:57'),
(108, 'iyzico', '0', NULL, '2020-12-30 16:45:56', '2021-08-16 17:43:37'),
(109, 'decimal_separator', '1', NULL, '2020-12-30 16:45:56', '2020-12-30 16:45:56'),
(110, 'nagad', '0', NULL, '2021-01-22 10:30:03', '2021-08-31 01:24:12'),
(111, 'bkash', '0', NULL, '2021-01-22 10:30:03', '2021-09-29 12:18:37'),
(112, 'bkash_sandbox', '0', NULL, '2021-01-22 10:30:03', '2021-09-29 12:19:09'),
(113, 'header_menu_labels', NULL, NULL, '2021-02-16 02:43:11', '2021-09-10 18:14:51'),
(114, 'header_menu_links', NULL, NULL, '2021-02-16 02:43:11', '2021-09-10 18:14:51'),
(115, 'proxypay', '0', NULL, '2021-06-20 11:25:42', '2021-08-16 17:43:33'),
(116, 'proxypay_sandbox', '1', NULL, '2021-06-20 11:25:42', '2021-06-20 11:25:42'),
(117, 'google_map', '0', NULL, '2021-07-27 15:49:39', '2021-07-27 15:49:39'),
(118, 'google_firebase', '0', NULL, '2021-07-27 15:49:39', '2021-11-10 10:52:21'),
(119, 'topbar_banner', '2238', NULL, '2021-08-16 17:46:19', '2021-10-17 11:41:54'),
(120, 'topbar_banner_link', '#', NULL, '2021-08-16 17:46:19', '2021-09-19 07:05:30'),
(121, 'contact_address', 'Plot: 34,HM Plaza,Sho-03,Uttara,Dhaka-1230,Bangladesh.', 'en', '2021-08-16 17:47:36', '2022-10-25 06:26:31'),
(122, 'about_us_description', 'POSHAKSHOP.COM is a Showroom based Online Clothing Shop in Bangladesh established to give you the best feeling to buy your desire products through Internet. We offer you various categories of quality products which you usually buy from a physical market place like specially Clothing.', 'en', '2021-08-16 17:49:48', '2022-10-25 06:25:35'),
(123, 'play_store_link', '#', NULL, '2021-08-16 17:49:48', '2021-08-16 17:49:48'),
(124, 'app_store_link', '#', NULL, '2021-08-16 17:49:48', '2021-09-19 07:14:55'),
(125, 'refund_request_time', '15', NULL, '2019-03-11 21:58:23', '2021-08-16 18:39:30'),
(126, 'club_point_convert_rate', '100', NULL, '2019-03-12 05:58:23', '2021-08-16 19:17:00'),
(127, 'frontend_copyright_text', '© 2023 Poshakshop.com. All Rights Reserved.', 'en', '2021-08-18 08:23:22', '2022-10-25 06:25:03'),
(128, 'product_approve_by_admin', '0', NULL, '2021-09-26 10:00:57', '2021-11-16 05:43:55'),
(129, 'product_manage_by_admin', '0', NULL, '2021-09-26 10:01:12', '2021-11-16 05:43:59'),
(130, 'walletmix', '0', NULL, '2021-09-28 12:14:48', '2022-11-05 08:13:22'),
(131, 'home_banner3_images', '[null,null,null]', NULL, '2021-10-17 09:02:34', '2022-11-25 10:56:43'),
(132, 'home_banner3_links', '[\"#\",\"#\",\"#\"]', NULL, '2021-10-17 09:02:34', '2022-11-25 10:56:43'),
(133, 'show_website_popup', NULL, NULL, '2021-10-17 11:27:01', '2021-10-17 11:31:06'),
(134, 'website_popup_content', '<h2 style=\"text-align: center;\"><span style=\"font-size: 2rem;\">Subscribe to Our Newsletter</span><br></h2><p style=\"text-align: center; \">Subscribe our newsletter for coupon, offer and exciting promotional discount..</p>', NULL, '2021-10-17 11:27:01', '2021-10-18 05:13:27'),
(135, 'show_subscribe_form', NULL, NULL, '2021-10-17 11:27:01', '2021-10-17 11:31:06'),
(136, 'cookies_agreement_text', '<p><b>Cookies &amp; Privacy</b><br>This website use cookies to ensure you get the best experience on our website.</p>', NULL, '2021-10-17 11:30:11', '2021-10-18 05:12:35'),
(137, 'show_cookies_agreement', NULL, NULL, '2021-10-17 11:30:11', '2022-10-25 06:32:29'),
(138, 'widget_one', 'Others', 'en', '2021-10-18 05:16:29', '2021-10-18 05:16:29'),
(139, 'widget_one_labels', '[\"Terms & conditions\",\"Return Policy\",\"Privacy Policy\",\"About us\"]', 'en', '2021-10-18 05:16:29', '2022-10-25 06:55:49'),
(140, 'delivery_boy_mail_notification', '1', NULL, '2021-11-10 07:26:44', '2021-11-10 07:26:44'),
(141, 'delivery_boy_otp_notification', '1', NULL, '2021-11-10 07:26:44', '2021-11-10 07:26:44'),
(142, 'home_slider_title', '[null,null,null,null]', NULL, '2021-11-22 07:38:10', '2022-10-25 06:34:25'),
(143, 'home_slider_desc', '[null,null,null,null]', NULL, '2021-11-22 07:38:10', '2022-10-25 06:34:25');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) UNSIGNED NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `temp_user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_id` int(11) NOT NULL DEFAULT 0,
  `product_id` int(11) DEFAULT NULL,
  `variation` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double(8,2) DEFAULT 0.00,
  `wmx_emi` int(11) DEFAULT NULL,
  `tax` double(8,2) DEFAULT 0.00,
  `shipping_cost` double(8,2) DEFAULT 0.00,
  `shipping_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pickup_point` int(11) DEFAULT NULL,
  `discount` double(10,2) NOT NULL DEFAULT 0.00,
  `product_referral_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `coupon_applied` tinyint(4) NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `attribute_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `owner_id`, `user_id`, `temp_user_id`, `address_id`, `product_id`, `variation`, `price`, `wmx_emi`, `tax`, `shipping_cost`, `shipping_type`, `pickup_point`, `discount`, `product_referral_code`, `coupon_code`, `coupon_applied`, `quantity`, `created_at`, `updated_at`, `attribute_id`) VALUES
(10, 9, NULL, '17915f637cad37cf79bc', 0, 669, '', 1450.00, NULL, 0.00, 0.00, '', NULL, 0.00, NULL, '', 0, 1, '2022-10-29 11:22:33', '2022-10-29 11:22:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `order_level` int(11) NOT NULL DEFAULT 0,
  `commision_rate` double(8,2) NOT NULL DEFAULT 0.00,
  `banner` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured` int(1) NOT NULL DEFAULT 0,
  `top` int(1) NOT NULL DEFAULT 0,
  `digital` int(1) NOT NULL DEFAULT 0,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `level`, `name`, `order_level`, `commision_rate`, `banner`, `icon`, `featured`, `top`, `digital`, `slug`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(296, 0, 0, 'Men', 0, 0.00, '2378', NULL, 0, 0, 0, 'men-qrp9i', 'Men\\\'s Zone', NULL, '2022-12-24 14:25:10', '2022-12-24 14:25:10'),
(297, 296, 1, 'Shirt', 0, 0.00, '2446', NULL, 1, 0, 0, 'shirt-fbuw8', NULL, NULL, '2022-11-12 11:50:24', '2022-11-12 11:50:24'),
(298, 296, 1, 'T-Shirt', 0, 0.00, NULL, NULL, 0, 0, 0, 'T-Shirt-SWC7s', NULL, NULL, '2022-10-25 06:59:38', '2022-10-25 06:59:38'),
(299, 296, 1, 'Polo T-Shirt', 0, 0.00, '2447', NULL, 1, 0, 0, 'polo-t-shirt-fjpse', NULL, NULL, '2022-11-12 11:55:37', '2022-11-12 11:55:37'),
(300, 296, 1, 'Panjabi', 0, 0.00, '2451', NULL, 1, 0, 0, 'panjabi-xjeic', NULL, NULL, '2022-11-12 12:10:37', '2022-11-12 12:10:37'),
(301, 296, 1, 'Fotua', 0, 0.00, NULL, NULL, 0, 0, 0, 'Fotua-3V08O', NULL, NULL, '2022-10-25 07:00:48', '2022-10-25 07:00:48'),
(302, 296, 1, 'Jeans Pant', 0, 0.00, '2455', NULL, 1, 0, 0, 'jeans-pant-rmedt', NULL, NULL, '2022-11-12 17:47:58', '2022-11-12 17:47:58'),
(303, 296, 1, 'Gabardine Pant', 0, 0.00, '2452', NULL, 1, 0, 0, 'gabardine-pant-teqlm', NULL, NULL, '2022-11-12 12:16:04', '2022-11-12 12:16:04'),
(304, 296, 1, 'Innerwear & Socks', 0, 0.00, NULL, NULL, 0, 0, 0, 'Innerwear--Socks-1Lsz3', NULL, NULL, '2022-10-25 07:02:16', '2022-10-25 07:02:16'),
(305, 296, 1, 'Accessories', 0, 0.00, NULL, NULL, 0, 0, 0, 'Accessories-8Oqrn', NULL, NULL, '2022-10-25 07:02:28', '2022-10-25 07:02:28'),
(306, 0, 0, 'Women', 0, 0.00, '2380', NULL, 0, 0, 0, 'women-4gygb', 'Women\\\'s World', NULL, '2022-12-24 14:25:40', '2022-12-24 14:25:40'),
(307, 306, 1, 'Unstitch Three-Piece', 0, 0.00, NULL, NULL, 0, 0, 0, 'Unstitch-Three-Piece-BMWZ7', NULL, NULL, '2022-10-25 07:06:30', '2022-10-25 07:06:30'),
(308, 306, 1, 'Saree', 0, 0.00, '2453', NULL, 1, 0, 0, 'saree-sevbj', NULL, NULL, '2022-11-12 12:17:31', '2022-11-12 12:17:31'),
(309, 306, 1, 'Three-Piece', 0, 0.00, '2454', NULL, 1, 0, 0, 'three-piece-vgnmu', NULL, NULL, '2022-11-12 12:21:10', '2022-11-12 12:21:10'),
(310, 0, 0, 'Kids', 0, 0.00, '2379', NULL, 0, 0, 0, 'kids-bmcai', 'Kid\\\'s Zone', NULL, '2022-12-24 14:26:09', '2022-12-24 14:26:09'),
(311, 310, 1, 'Girls Top', 0, 0.00, NULL, NULL, 0, 0, 0, 'Girls-Top-zVfXF', NULL, NULL, '2022-10-25 07:12:17', '2022-10-25 07:12:17'),
(312, 310, 1, 'Saree', 0, 0.00, NULL, NULL, 0, 0, 0, 'Saree-P91nN', NULL, NULL, '2022-11-12 17:45:33', '2022-11-12 17:45:33'),
(313, 0, 0, 'Fashion & Beauty', 0, 0.00, '2381', NULL, 0, 0, 0, 'fashion--beauty-zwmti', 'Fashion & Beauty Corner', NULL, '2022-12-24 14:26:50', '2022-12-24 14:26:50');

-- --------------------------------------------------------

--
-- Table structure for table `category_translations`
--

CREATE TABLE `category_translations` (
  `id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category_translations`
--

INSERT INTO `category_translations` (`id`, `category_id`, `name`, `lang`, `created_at`, `updated_at`) VALUES
(280, 280, 'Desktop', 'en', '2021-10-17 08:39:29', '2022-04-10 05:41:08'),
(281, 281, 'Networking', 'en', '2021-10-17 08:40:30', '2022-04-10 05:45:02'),
(282, 282, 'Security', 'en', '2021-10-17 08:41:08', '2022-04-10 05:44:38'),
(283, 283, 'Camera', 'en', '2021-10-17 08:42:43', '2022-04-10 05:44:18'),
(284, 284, 'Office Equipment', 'en', '2021-10-17 08:43:15', '2022-04-10 05:43:57'),
(285, 285, 'Tablet', 'en', '2021-10-17 08:43:40', '2022-04-10 05:43:15'),
(286, 286, 'UPS', 'en', '2021-10-17 08:45:24', '2022-04-10 05:42:49'),
(287, 287, 'Monitor', 'en', '2021-10-17 08:45:44', '2022-04-10 05:42:23'),
(288, 288, 'Component', 'en', '2021-10-17 08:47:08', '2022-04-10 05:41:54'),
(289, 289, 'Laptop', 'en', '2021-10-17 08:48:22', '2022-04-10 05:41:28'),
(290, 290, 'Accessories', 'en', '2021-10-17 08:48:43', '2022-04-10 05:45:38'),
(291, 291, 'Software', 'en', '2021-11-09 06:59:13', '2022-04-10 05:46:04'),
(292, 292, 'Server & Storage', 'en', '2022-04-10 05:48:32', '2022-04-10 05:48:32'),
(293, 293, 'Gaming', 'en', '2022-04-10 05:49:01', '2022-04-10 05:49:01'),
(294, 294, 'Gadget', 'en', '2022-04-11 08:15:48', '2022-04-11 08:15:48'),
(295, 295, 'Special PC', 'en', '2022-04-12 06:04:38', '2022-04-12 06:04:38'),
(296, 296, 'Men', 'en', '2022-10-25 06:58:48', '2022-10-25 06:58:48'),
(297, 297, 'Shirt', 'en', '2022-10-25 06:59:15', '2022-10-25 06:59:15'),
(298, 298, 'T-Shirt', 'en', '2022-10-25 06:59:38', '2022-10-25 06:59:38'),
(299, 299, 'Polo T-Shirt', 'en', '2022-10-25 07:00:02', '2022-10-25 07:00:02'),
(300, 300, 'Panjabi', 'en', '2022-10-25 07:00:29', '2022-10-25 07:00:29'),
(301, 301, 'Fotua', 'en', '2022-10-25 07:00:48', '2022-10-25 07:00:48'),
(302, 302, 'Jeans Pant', 'en', '2022-10-25 07:01:04', '2022-10-25 07:01:04'),
(303, 303, 'Gabardine Pant', 'en', '2022-10-25 07:01:47', '2022-10-25 07:01:47'),
(304, 304, 'Innerwear & Socks', 'en', '2022-10-25 07:02:16', '2022-10-25 07:02:16'),
(305, 305, 'Accessories', 'en', '2022-10-25 07:02:28', '2022-10-25 07:02:28'),
(306, 306, 'Women', 'en', '2022-10-25 07:05:52', '2022-10-25 07:05:52'),
(307, 307, 'Unstitch Three-Piece', 'en', '2022-10-25 07:06:30', '2022-10-25 07:06:30'),
(308, 308, 'Saree', 'en', '2022-10-25 07:06:49', '2022-10-25 07:06:49'),
(309, 309, 'Three-Piece', 'en', '2022-10-25 07:07:06', '2022-10-25 07:07:06'),
(310, 310, 'Kids', 'en', '2022-10-25 07:11:56', '2022-10-25 07:11:56'),
(311, 311, 'Girls Top', 'en', '2022-10-25 07:12:17', '2022-10-25 07:12:17'),
(312, 312, 'Saree', 'en', '2022-10-25 07:12:38', '2022-10-25 07:12:38'),
(313, 313, 'Fashion & Beauty', 'en', '2022-10-25 07:13:10', '2022-10-25 07:13:10');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cost` double(20,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `country_id`, `name`, `cost`, `created_at`, `updated_at`) VALUES
(1, 18, 'Narayanganj', 80.00, '2021-08-16 19:29:09', '2021-08-16 19:29:09'),
(2, 18, 'Kushtia', 100.00, '2021-08-16 19:29:43', '2021-08-16 19:29:43'),
(3, 18, 'Dhaka', 60.00, '2021-08-17 08:49:43', '2021-08-17 08:49:43'),
(4, 18, 'Keraniganj', 80.00, '2021-08-17 08:50:02', '2021-08-17 08:50:02'),
(5, 18, 'Savar', 80.00, '2021-08-17 08:50:21', '2021-08-17 08:50:21'),
(6, 18, 'Gazipur', 80.00, '2021-08-17 08:50:51', '2021-08-17 08:50:51'),
(7, 18, 'Faridpur', 100.00, '2021-08-17 08:51:20', '2021-08-17 08:51:20'),
(8, 18, 'Gopalganj', 100.00, '2021-08-17 08:51:38', '2021-08-17 08:51:38'),
(9, 18, 'Jamalpur', 100.00, '2021-08-17 08:51:55', '2021-08-17 08:51:55'),
(10, 18, 'Kishoreganj', 100.00, '2021-08-17 08:52:10', '2021-08-17 08:52:10'),
(11, 18, 'Madaripur', 100.00, '2021-08-17 08:52:41', '2021-08-17 08:52:41'),
(12, 18, 'Manikganj', 100.00, '2021-08-17 09:01:51', '2021-08-17 09:01:51'),
(13, 18, 'Munshiganj', 100.00, '2021-08-17 09:02:08', '2021-08-17 09:02:08'),
(14, 18, 'Mymensingh', 100.00, '2021-08-17 09:02:24', '2021-08-17 09:02:24'),
(15, 18, 'Norshingdi', 100.00, '2021-08-17 09:02:47', '2021-08-17 09:02:47'),
(16, 18, 'Netrokona', 100.00, '2021-08-17 09:03:00', '2021-08-17 09:03:00'),
(17, 18, 'Rajbari', 100.00, '2021-08-17 09:03:12', '2021-08-17 09:03:12'),
(18, 18, 'Shariatpur', 100.00, '2021-08-17 09:03:24', '2021-08-17 09:03:24'),
(19, 18, 'Sherpur', 100.00, '2021-08-17 09:03:36', '2021-08-17 09:03:36'),
(20, 18, 'Tangail', 100.00, '2021-08-17 09:03:49', '2021-08-17 09:03:49'),
(21, 18, 'Bagerhat', 100.00, '2021-08-17 09:04:02', '2021-08-17 09:04:02'),
(22, 18, 'Chuadanga', 100.00, '2021-08-17 09:04:14', '2021-08-17 09:04:14'),
(24, 18, 'Jhenaidah', 100.00, '2021-08-17 09:05:55', '2021-08-17 09:05:55'),
(25, 18, 'Khulna', 100.00, '2021-08-17 09:06:07', '2021-08-17 09:06:07'),
(26, 18, 'Kushtia', 100.00, '2021-08-17 09:06:19', '2021-08-17 09:06:19'),
(27, 18, 'Magura', 100.00, '2021-08-17 09:06:33', '2021-08-17 09:06:33'),
(28, 18, 'Meherpur', 100.00, '2021-08-17 09:06:44', '2021-08-17 09:06:44'),
(29, 18, 'Narail', 100.00, '2021-08-17 09:06:56', '2021-08-17 09:06:56'),
(30, 18, 'Satkhira', 100.00, '2021-08-17 09:07:08', '2021-08-17 09:07:08'),
(31, 18, 'Bogra', 100.00, '2021-08-17 09:07:19', '2021-08-17 09:07:19'),
(32, 18, 'Chapai Nawabganj', 100.00, '2021-08-17 09:07:33', '2021-08-17 09:07:33'),
(33, 18, 'Joypurhat', 100.00, '2021-08-17 09:07:47', '2021-08-17 09:07:47'),
(34, 18, 'Naogaon', 100.00, '2021-08-17 09:08:00', '2021-08-17 09:08:00'),
(35, 18, 'Natore', 100.00, '2021-08-17 09:08:12', '2021-08-17 09:08:12'),
(36, 18, 'Pabna', 100.00, '2021-08-17 09:08:24', '2021-08-17 09:08:24'),
(37, 18, 'Rajshahi', 100.00, '2021-08-17 09:08:36', '2021-08-17 09:08:36'),
(38, 18, 'Sirajganj', 100.00, '2021-08-17 09:08:48', '2021-08-17 09:08:48'),
(39, 18, 'Habiganj', 100.00, '2021-08-17 09:09:00', '2021-08-17 09:09:00'),
(40, 18, 'Moulvibazar', 100.00, '2021-08-17 09:09:13', '2021-08-17 09:09:13'),
(41, 18, 'Sunamganj', 100.00, '2021-08-17 09:09:34', '2021-08-17 09:09:34'),
(42, 18, 'Sylhet', 100.00, '2021-08-17 09:09:52', '2021-08-17 09:09:52'),
(43, 18, 'Barguna', 100.00, '2021-08-17 09:10:06', '2021-08-17 09:10:06'),
(44, 18, 'Barisal', 100.00, '2021-08-17 09:10:17', '2021-08-17 09:10:17'),
(45, 18, 'Bhola', 100.00, '2021-08-17 09:10:34', '2021-08-17 09:10:34'),
(46, 18, 'Jhalokathi', 100.00, '2021-08-17 09:10:45', '2021-08-17 09:10:45'),
(47, 18, 'Patuakhali', 100.00, '2021-08-17 09:10:57', '2021-08-17 09:10:57'),
(48, 18, 'Perojpur', 100.00, '2021-08-17 09:11:09', '2021-08-17 09:11:09'),
(49, 18, 'Bandarban', 100.00, '2021-08-17 09:11:22', '2021-08-17 09:11:22'),
(50, 18, 'Brahmanbaria', 100.00, '2021-08-17 09:11:34', '2021-08-17 09:11:34'),
(51, 18, 'Chandpur', 100.00, '2021-08-17 09:11:47', '2021-08-17 09:11:47'),
(52, 18, 'Chittagong', 100.00, '2021-08-17 09:12:00', '2021-08-17 09:12:00'),
(53, 18, 'Comilla', 100.00, '2021-08-17 09:12:19', '2021-08-17 09:12:19'),
(54, 18, 'Cox\'s Bazar', 100.00, '2021-08-17 09:12:40', '2021-08-17 09:12:40'),
(55, 18, 'Feni', 100.00, '2021-08-17 09:12:57', '2021-08-17 09:12:57'),
(56, 18, 'Khagrachari', 100.00, '2021-08-17 09:13:10', '2021-08-17 09:13:10'),
(57, 18, 'Laksmipur', 100.00, '2021-08-17 09:13:22', '2021-08-17 09:13:22'),
(58, 18, 'Noakhali', 100.00, '2021-08-17 09:13:37', '2021-08-17 09:13:37'),
(59, 18, 'Rangamati', 100.00, '2021-08-17 09:13:55', '2021-08-17 09:13:55'),
(60, 18, 'Dinajpur', 100.00, '2021-08-17 09:14:16', '2021-08-17 09:14:16'),
(61, 18, 'Gaibandha', 100.00, '2021-08-17 09:14:29', '2021-08-17 09:14:29'),
(62, 18, 'Kurigram', 100.00, '2021-08-17 09:14:50', '2021-08-17 09:14:50'),
(63, 18, 'Lalmonirhat', 100.00, '2021-08-17 09:15:04', '2021-08-17 09:15:04'),
(64, 18, 'Nilphamari', 100.00, '2021-08-17 09:15:16', '2021-08-17 09:15:16'),
(65, 18, 'Panchagarh', 100.00, '2021-08-17 09:15:28', '2021-08-17 09:15:28'),
(66, 18, 'Rangpur', 100.00, '2021-08-17 09:15:40', '2021-08-17 09:15:40'),
(67, 18, 'Thakurgaon', 100.00, '2021-08-17 09:15:57', '2021-08-17 09:15:57'),
(68, 18, 'Jessore', 100.00, '2021-09-05 02:17:42', '2021-09-05 02:17:42');

-- --------------------------------------------------------

--
-- Table structure for table `city_translations`
--

CREATE TABLE `city_translations` (
  `id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `club_points`
--

CREATE TABLE `club_points` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `points` double(18,2) NOT NULL,
  `order_id` int(11) NOT NULL,
  `convert_status` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `club_points`
--

INSERT INTO `club_points` (`id`, `user_id`, `points`, `order_id`, `convert_status`, `created_at`, `updated_at`) VALUES
(1, 10, 100.00, 1, 0, '2021-08-16 19:48:20', '2021-08-16 19:48:20'),
(2, 28, 0.00, 3, 0, '2021-08-21 15:39:50', '2021-08-21 15:39:50'),
(3, 32, 0.00, 4, 0, '2021-08-23 18:56:15', '2021-08-23 18:56:15'),
(4, 34, 0.00, 10, 0, '2021-08-31 01:24:53', '2021-08-31 01:24:53'),
(5, 15, 0.00, 12, 0, '2021-09-04 16:03:03', '2021-09-04 16:03:03');

-- --------------------------------------------------------

--
-- Table structure for table `club_point_details`
--

CREATE TABLE `club_point_details` (
  `id` int(11) NOT NULL,
  `club_point_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `point` double(8,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `club_point_details`
--

INSERT INTO `club_point_details` (`id`, `club_point_id`, `product_id`, `product_qty`, `point`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, 100.00, '2021-08-16 19:48:20', '2021-08-16 19:48:20'),
(2, 2, 168, 0, 0.00, '2021-08-21 15:39:50', '2021-08-21 15:39:50'),
(3, 3, 247, 0, 0.00, '2021-08-23 18:56:15', '2021-08-23 18:56:15'),
(4, 4, 433, 0, 0.00, '2021-08-31 01:24:53', '2021-08-31 01:24:53'),
(5, 5, 446, 0, 0.00, '2021-09-04 16:03:03', '2021-09-04 16:03:03'),
(6, 5, 446, 0, 0.00, '2021-09-04 16:03:03', '2021-09-04 16:03:03');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commission_histories`
--

CREATE TABLE `commission_histories` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_detail_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `admin_commission` double(25,2) NOT NULL,
  `seller_earning` double(25,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `commission_histories`
--

INSERT INTO `commission_histories` (`id`, `order_id`, `order_detail_id`, `seller_id`, `admin_commission`, `seller_earning`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 10, 220.00, 980.00, '2021-08-16 19:48:20', '2021-08-16 19:48:20'),
(2, 3, 3, 28, 196.00, 844.00, '2021-08-21 15:39:50', '2021-08-21 15:39:50'),
(3, 4, 4, 32, 230.00, 980.00, '2021-08-23 18:56:15', '2021-08-23 18:56:15'),
(4, 12, 12, 29, 150.00, 630.00, '2021-09-04 16:03:03', '2021-09-04 16:03:03'),
(5, 12, 13, 29, 150.00, 630.00, '2021-09-04 16:03:03', '2021-09-04 16:03:03');

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `title` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sender_viewed` int(1) NOT NULL DEFAULT 1,
  `receiver_viewed` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`id`, `sender_id`, `receiver_id`, `title`, `sender_viewed`, `receiver_viewed`, `created_at`, `updated_at`) VALUES
(1, 9, 13, 'Men Cotton T Shirt', 1, 0, '2021-08-18 18:38:48', '2021-08-18 18:38:48'),
(2, 9, 18, 'Blue Cross Flower Jamndani Saree', 1, 1, '2021-08-18 19:45:59', '2021-08-18 19:46:41'),
(3, 28, 28, 'Long Gown Kurti', 1, 1, '2021-08-23 05:51:33', '2021-08-23 05:52:07'),
(4, 34, 46, 'iPhone X 64 GB Used (MY SET Conditions 95% As New)', 1, 0, '2021-08-30 18:27:55', '2021-08-30 18:27:55'),
(5, 119, 16, 'Men\'s Joggers & T Shirt ( Combo )', 1, 0, '2021-09-13 05:28:08', '2021-09-13 05:28:08');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `code` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `code`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'AF', 'Afghanistan', 0, NULL, '2021-09-23 11:47:13'),
(2, 'AL', 'Albania', 0, NULL, '2021-08-16 19:05:53'),
(3, 'DZ', 'Algeria', 0, NULL, '2021-08-16 19:05:54'),
(4, 'DS', 'American Samoa', 0, NULL, '2021-08-16 19:05:56'),
(5, 'AD', 'Andorra', 0, NULL, '2021-08-16 19:05:57'),
(6, 'AO', 'Angola', 0, NULL, '2021-08-16 19:05:58'),
(7, 'AI', 'Anguilla', 0, NULL, '2021-08-16 19:06:01'),
(8, 'AQ', 'Antarctica', 0, NULL, '2021-08-16 19:06:09'),
(9, 'AG', 'Antigua and Barbuda', 0, NULL, '2021-08-16 19:06:07'),
(10, 'AR', 'Argentina', 0, NULL, '2021-08-16 19:06:12'),
(11, 'AM', 'Armenia', 0, NULL, '2021-08-16 19:06:16'),
(12, 'AW', 'Aruba', 0, NULL, '2021-08-16 19:06:17'),
(13, 'AU', 'Australia', 0, NULL, '2021-08-16 19:06:19'),
(14, 'AT', 'Austria', 0, NULL, '2021-08-16 19:06:20'),
(15, 'AZ', 'Azerbaijan', 0, NULL, '2021-08-16 19:06:21'),
(16, 'BS', 'Bahamas', 0, NULL, '2021-08-16 19:06:36'),
(17, 'BH', 'Bahrain', 0, NULL, '2021-08-16 19:06:38'),
(18, 'BD', 'Bangladesh', 1, NULL, NULL),
(19, 'BB', 'Barbados', 0, NULL, '2021-08-16 19:06:40'),
(20, 'BY', 'Belarus', 0, NULL, '2021-08-16 19:06:42'),
(21, 'BE', 'Belgium', 0, NULL, '2021-08-16 19:06:43'),
(22, 'BZ', 'Belize', 0, NULL, '2021-08-16 19:06:45'),
(23, 'BJ', 'Benin', 0, NULL, '2021-08-16 19:06:47'),
(24, 'BM', 'Bermuda', 0, NULL, '2021-08-16 19:06:49'),
(25, 'BT', 'Bhutan', 0, NULL, '2021-08-16 19:06:50'),
(26, 'BO', 'Bolivia', 0, NULL, '2021-08-16 19:06:51'),
(27, 'BA', 'Bosnia and Herzegovina', 0, NULL, '2021-08-16 19:06:52'),
(28, 'BW', 'Botswana', 0, NULL, '2021-08-16 19:06:56'),
(29, 'BV', 'Bouvet Island', 0, NULL, '2021-08-16 19:06:57'),
(30, 'BR', 'Brazil', 0, NULL, '2021-08-16 19:06:58'),
(31, 'IO', 'British Indian Ocean Territory', 0, NULL, '2021-08-16 19:07:06'),
(32, 'BN', 'Brunei Darussalam', 0, NULL, '2021-08-16 19:07:07'),
(33, 'BG', 'Bulgaria', 0, NULL, '2021-08-16 19:07:09'),
(34, 'BF', 'Burkina Faso', 0, NULL, '2021-08-16 19:07:10'),
(35, 'BI', 'Burundi', 0, NULL, '2021-08-16 19:07:11'),
(36, 'KH', 'Cambodia', 0, NULL, '2021-08-16 19:07:12'),
(37, 'CM', 'Cameroon', 0, NULL, '2021-08-16 19:07:13'),
(38, 'CA', 'Canada', 0, NULL, '2021-08-16 19:07:15'),
(39, 'CV', 'Cape Verde', 0, NULL, '2021-08-16 19:07:16'),
(40, 'KY', 'Cayman Islands', 0, NULL, '2021-08-16 19:07:17'),
(41, 'CF', 'Central African Republic', 0, NULL, '2021-08-16 19:07:19'),
(42, 'TD', 'Chad', 0, NULL, '2021-08-16 19:07:20'),
(43, 'CL', 'Chile', 0, NULL, '2021-08-16 19:07:21'),
(44, 'CN', 'China', 0, NULL, '2021-08-16 19:07:22'),
(45, 'CX', 'Christmas Island', 0, NULL, '2021-08-16 19:07:24'),
(46, 'CC', 'Cocos (Keeling) Islands', 0, NULL, '2021-08-16 19:07:31'),
(47, 'CO', 'Colombia', 0, NULL, '2021-08-16 19:07:32'),
(48, 'KM', 'Comoros', 0, NULL, '2021-08-16 19:07:33'),
(49, 'CG', 'Congo', 0, NULL, '2021-08-16 19:07:34'),
(50, 'CK', 'Cook Islands', 0, NULL, '2021-08-16 19:07:36'),
(51, 'CR', 'Costa Rica', 0, NULL, '2021-08-16 19:07:37'),
(52, 'HR', 'Croatia (Hrvatska)', 0, NULL, '2021-08-16 19:07:38'),
(53, 'CU', 'Cuba', 0, NULL, '2021-08-16 19:07:40'),
(54, 'CY', 'Cyprus', 0, NULL, '2021-08-16 19:07:41'),
(55, 'CZ', 'Czech Republic', 0, NULL, '2021-08-16 19:07:42'),
(56, 'DK', 'Denmark', 0, NULL, '2021-08-16 19:07:45'),
(57, 'DJ', 'Djibouti', 0, NULL, '2021-08-16 19:07:46'),
(58, 'DM', 'Dominica', 0, NULL, '2021-08-16 19:07:47'),
(59, 'DO', 'Dominican Republic', 0, NULL, '2021-08-16 19:07:48'),
(60, 'TP', 'East Timor', 0, NULL, '2021-08-16 19:07:49'),
(61, 'EC', 'Ecuador', 0, NULL, '2021-08-16 19:07:57'),
(62, 'EG', 'Egypt', 0, NULL, '2021-08-16 19:07:58'),
(63, 'SV', 'El Salvador', 0, NULL, '2021-08-16 19:08:00'),
(64, 'GQ', 'Equatorial Guinea', 0, NULL, '2021-08-16 19:08:01'),
(65, 'ER', 'Eritrea', 0, NULL, '2021-08-16 19:08:02'),
(66, 'EE', 'Estonia', 0, NULL, '2021-08-16 19:08:04'),
(67, 'ET', 'Ethiopia', 0, NULL, '2021-08-16 19:08:05'),
(68, 'FK', 'Falkland Islands (Malvinas)', 0, NULL, '2021-08-16 19:08:07'),
(69, 'FO', 'Faroe Islands', 0, NULL, '2021-08-16 19:08:08'),
(70, 'FJ', 'Fiji', 0, NULL, '2021-08-16 19:08:09'),
(71, 'FI', 'Finland', 0, NULL, '2021-08-16 19:08:12'),
(72, 'FR', 'France', 0, NULL, '2021-08-16 19:08:13'),
(73, 'FX', 'France, Metropolitan', 0, NULL, '2021-08-16 19:08:14'),
(74, 'GF', 'French Guiana', 0, NULL, '2021-08-16 19:08:17'),
(75, 'PF', 'French Polynesia', 0, NULL, '2021-08-16 19:08:18'),
(76, 'TF', 'French Southern Territories', 0, NULL, '2021-08-16 19:08:24'),
(77, 'GA', 'Gabon', 0, NULL, '2021-08-16 19:08:25'),
(78, 'GM', 'Gambia', 0, NULL, '2021-08-16 19:08:27'),
(79, 'GE', 'Georgia', 0, NULL, '2021-08-16 19:08:28'),
(80, 'DE', 'Germany', 0, NULL, '2021-08-16 19:08:29'),
(81, 'GH', 'Ghana', 0, NULL, '2021-08-16 19:08:30'),
(82, 'GI', 'Gibraltar', 0, NULL, '2021-08-16 19:08:31'),
(83, 'GK', 'Guernsey', 0, NULL, '2021-08-16 19:08:34'),
(84, 'GR', 'Greece', 0, NULL, '2021-08-16 19:08:35'),
(85, 'GL', 'Greenland', 0, NULL, '2021-08-16 19:08:36'),
(86, 'GD', 'Grenada', 0, NULL, '2021-08-16 19:08:38'),
(87, 'GP', 'Guadeloupe', 0, NULL, '2021-08-16 19:08:39'),
(88, 'GU', 'Guam', 0, NULL, '2021-08-16 19:08:40'),
(89, 'GT', 'Guatemala', 0, NULL, '2021-08-16 19:08:42'),
(90, 'GN', 'Guinea', 0, NULL, '2021-08-16 19:08:42'),
(91, 'GW', 'Guinea-Bissau', 0, NULL, '2021-08-16 19:08:49'),
(92, 'GY', 'Guyana', 0, NULL, '2021-08-16 19:08:50'),
(93, 'HT', 'Haiti', 0, NULL, '2021-08-16 19:08:52'),
(94, 'HM', 'Heard and Mc Donald Islands', 0, NULL, '2021-08-16 19:08:53'),
(95, 'HN', 'Honduras', 0, NULL, '2021-08-16 19:08:54'),
(96, 'HK', 'Hong Kong', 0, NULL, '2021-08-16 19:08:56'),
(97, 'HU', 'Hungary', 0, NULL, '2021-08-16 19:08:57'),
(98, 'IS', 'Iceland', 0, NULL, '2021-08-16 19:08:59'),
(99, 'IN', 'India', 0, NULL, '2021-08-16 19:09:00'),
(100, 'IM', 'Isle of Man', 0, NULL, '2021-08-16 19:09:03'),
(101, 'ID', 'Indonesia', 0, NULL, '2021-08-16 19:09:04'),
(102, 'IR', 'Iran (Islamic Republic of)', 0, NULL, '2021-08-16 19:09:05'),
(103, 'IQ', 'Iraq', 0, NULL, '2021-08-16 19:09:06'),
(104, 'IE', 'Ireland', 0, NULL, '2021-08-16 19:09:06'),
(105, 'IL', 'Israel', 0, NULL, '2021-08-16 19:09:10'),
(106, 'IT', 'Italy', 0, NULL, '2021-08-16 19:09:17'),
(107, 'CI', 'Ivory Coast', 0, NULL, '2021-08-16 19:09:18'),
(108, 'JE', 'Jersey', 0, NULL, '2021-08-16 19:09:20'),
(109, 'JM', 'Jamaica', 0, NULL, '2021-08-16 19:09:21'),
(110, 'JP', 'Japan', 0, NULL, '2021-08-16 19:09:22'),
(111, 'JO', 'Jordan', 0, NULL, '2021-08-16 19:09:24'),
(112, 'KZ', 'Kazakhstan', 0, NULL, '2021-08-16 19:09:25'),
(113, 'KE', 'Kenya', 0, NULL, '2021-08-16 19:09:26'),
(114, 'KI', 'Kiribati', 0, NULL, '2021-08-16 19:09:29'),
(115, 'KP', 'Korea, Democratic People\'s Republic of', 0, NULL, '2021-08-16 19:09:30'),
(116, 'KR', 'Korea, Republic of', 0, NULL, '2021-08-16 19:09:31'),
(117, 'XK', 'Kosovo', 0, NULL, '2021-08-16 19:09:32'),
(118, 'KW', 'Kuwait', 0, NULL, '2021-08-16 19:09:33'),
(119, 'KG', 'Kyrgyzstan', 0, NULL, '2021-08-16 19:09:36'),
(120, 'LA', 'Lao People\'s Democratic Republic', 0, NULL, '2021-08-16 19:09:37'),
(121, 'LV', 'Latvia', 0, NULL, '2021-08-16 19:09:44'),
(122, 'LB', 'Lebanon', 0, NULL, '2021-08-16 19:09:45'),
(123, 'LS', 'Lesotho', 0, NULL, '2021-08-16 19:09:46'),
(124, 'LR', 'Liberia', 0, NULL, '2021-08-16 19:09:47'),
(125, 'LY', 'Libyan Arab Jamahiriya', 0, NULL, '2021-08-16 19:09:48'),
(126, 'LI', 'Liechtenstein', 0, NULL, '2021-08-16 19:09:50'),
(127, 'LT', 'Lithuania', 0, NULL, '2021-08-16 19:09:51'),
(128, 'LU', 'Luxembourg', 0, NULL, '2021-08-16 19:10:23'),
(129, 'MO', 'Macau', 0, NULL, '2021-08-16 19:10:24'),
(130, 'MK', 'Macedonia', 0, NULL, '2021-08-16 19:10:25'),
(131, 'MG', 'Madagascar', 0, NULL, '2021-08-16 19:10:26'),
(132, 'MW', 'Malawi', 0, NULL, '2021-08-16 19:10:28'),
(133, 'MY', 'Malaysia', 0, NULL, '2021-08-16 19:10:28'),
(134, 'MV', 'Maldives', 0, NULL, '2021-08-16 19:10:29'),
(135, 'ML', 'Mali', 0, NULL, '2021-08-16 19:10:30'),
(136, 'MT', 'Malta', 0, NULL, '2021-08-16 19:10:41'),
(137, 'MH', 'Marshall Islands', 0, NULL, '2021-08-16 19:10:42'),
(138, 'MQ', 'Martinique', 0, NULL, '2021-08-16 19:10:43'),
(139, 'MR', 'Mauritania', 0, NULL, '2021-08-16 19:10:44'),
(140, 'MU', 'Mauritius', 0, NULL, '2021-08-16 19:10:45'),
(141, 'TY', 'Mayotte', 0, NULL, '2021-08-16 19:10:48'),
(142, 'MX', 'Mexico', 0, NULL, '2021-08-16 19:10:49'),
(143, 'FM', 'Micronesia, Federated States of', 0, NULL, '2021-08-16 19:10:50'),
(144, 'MD', 'Moldova, Republic of', 0, NULL, '2021-08-16 19:10:51'),
(145, 'MC', 'Monaco', 0, NULL, '2021-08-16 19:10:52'),
(146, 'MN', 'Mongolia', 0, NULL, '2021-08-16 19:10:55'),
(147, 'ME', 'Montenegro', 0, NULL, '2021-08-16 19:10:56'),
(148, 'MS', 'Montserrat', 0, NULL, '2021-08-16 19:10:57'),
(149, 'MA', 'Morocco', 0, NULL, '2021-08-16 19:10:58'),
(150, 'MZ', 'Mozambique', 0, NULL, '2021-08-16 19:10:59'),
(151, 'MM', 'Myanmar', 0, NULL, '2021-08-16 19:11:06'),
(152, 'NA', 'Namibia', 0, NULL, '2021-08-16 19:11:07'),
(153, 'NR', 'Nauru', 0, NULL, '2021-08-16 19:11:08'),
(154, 'NP', 'Nepal', 0, NULL, '2021-08-16 19:11:09'),
(155, 'NL', 'Netherlands', 0, NULL, '2021-08-16 19:11:12'),
(156, 'AN', 'Netherlands Antilles', 0, NULL, '2021-08-16 19:11:12'),
(157, 'NC', 'New Caledonia', 0, NULL, '2021-08-16 19:11:14'),
(158, 'NZ', 'New Zealand', 0, NULL, '2021-08-16 19:11:15'),
(159, 'NI', 'Nicaragua', 0, NULL, '2021-08-16 19:11:17'),
(160, 'NE', 'Niger', 0, NULL, '2021-08-16 19:11:18'),
(161, 'NG', 'Nigeria', 0, NULL, '2021-08-16 19:11:19'),
(162, 'NU', 'Niue', 0, NULL, '2021-08-16 19:11:20'),
(163, 'NF', 'Norfolk Island', 0, NULL, '2021-08-16 19:11:21'),
(164, 'MP', 'Northern Mariana Islands', 0, NULL, '2021-08-16 19:11:22'),
(165, 'NO', 'Norway', 0, NULL, '2021-08-16 19:11:23'),
(166, 'OM', 'Oman', 0, NULL, '2021-08-16 19:11:31'),
(167, 'PK', 'Pakistan', 0, NULL, '2021-08-16 19:11:32'),
(168, 'PW', 'Palau', 0, NULL, '2021-08-16 19:11:33'),
(169, 'PS', 'Palestine', 0, NULL, '2021-08-16 19:11:34'),
(170, 'PA', 'Panama', 0, NULL, '2021-08-16 19:11:35'),
(171, 'PG', 'Papua New Guinea', 0, NULL, '2021-08-16 19:11:39'),
(172, 'PY', 'Paraguay', 0, NULL, '2021-08-16 19:11:41'),
(173, 'PE', 'Peru', 0, NULL, '2021-08-16 19:11:43'),
(174, 'PH', 'Philippines', 0, NULL, '2021-08-16 19:11:44'),
(175, 'PN', 'Pitcairn', 0, NULL, '2021-08-16 19:11:45'),
(176, 'PL', 'Poland', 0, NULL, '2021-08-16 19:11:46'),
(177, 'PT', 'Portugal', 0, NULL, '2021-08-16 19:11:48'),
(178, 'PR', 'Puerto Rico', 0, NULL, '2021-08-16 19:11:51'),
(179, 'QA', 'Qatar', 0, NULL, '2021-08-16 19:11:52'),
(180, 'RE', 'Reunion', 0, NULL, '2021-08-16 19:11:53'),
(181, 'RO', 'Romania', 0, NULL, '2021-08-16 19:11:59'),
(182, 'RU', 'Russian Federation', 0, NULL, '2021-08-16 19:12:00'),
(183, 'RW', 'Rwanda', 0, NULL, '2021-08-16 19:12:01'),
(184, 'KN', 'Saint Kitts and Nevis', 0, NULL, '2021-08-16 19:12:02'),
(185, 'LC', 'Saint Lucia', 0, NULL, '2021-08-16 19:12:03'),
(186, 'VC', 'Saint Vincent and the Grenadines', 0, NULL, '2021-08-16 19:12:04'),
(187, 'WS', 'Samoa', 0, NULL, '2021-08-16 19:12:05'),
(188, 'SM', 'San Marino', 0, NULL, '2021-08-16 19:12:07'),
(189, 'ST', 'Sao Tome and Principe', 0, NULL, '2021-08-16 19:12:08'),
(190, 'SA', 'Saudi Arabia', 0, NULL, '2021-08-16 19:12:09'),
(191, 'SN', 'Senegal', 0, NULL, '2021-08-16 19:12:11'),
(192, 'RS', 'Serbia', 0, NULL, '2021-08-16 19:12:12'),
(193, 'SC', 'Seychelles', 0, NULL, '2021-08-16 19:12:13'),
(194, 'SL', 'Sierra Leone', 0, NULL, '2021-08-16 19:12:14'),
(195, 'SG', 'Singapore', 0, NULL, '2021-08-16 19:12:16'),
(196, 'SK', 'Slovakia', 0, NULL, '2021-08-16 19:12:24'),
(197, 'SI', 'Slovenia', 0, NULL, '2021-08-16 19:12:24'),
(198, 'SB', 'Solomon Islands', 0, NULL, '2021-08-16 19:12:26'),
(199, 'SO', 'Somalia', 0, NULL, '2021-08-16 19:12:27'),
(200, 'ZA', 'South Africa', 0, NULL, '2021-08-16 19:12:27'),
(201, 'GS', 'South Georgia South Sandwich Islands', 0, NULL, '2021-08-16 19:12:29'),
(202, 'SS', 'South Sudan', 0, NULL, '2021-08-16 19:12:30'),
(203, 'ES', 'Spain', 0, NULL, '2021-08-16 19:12:33'),
(204, 'LK', 'Sri Lanka', 0, NULL, '2021-08-16 19:12:34'),
(205, 'SH', 'St. Helena', 0, NULL, '2021-08-16 19:12:35'),
(206, 'PM', 'St. Pierre and Miquelon', 0, NULL, '2021-08-16 19:12:36'),
(207, 'SD', 'Sudan', 0, NULL, '2021-08-16 19:12:37'),
(208, 'SR', 'Suriname', 0, NULL, '2021-08-16 19:12:38'),
(209, 'SJ', 'Svalbard and Jan Mayen Islands', 0, NULL, '2021-08-16 19:12:39'),
(210, 'SZ', 'Swaziland', 0, NULL, '2021-08-16 19:12:41'),
(211, 'SE', 'Sweden', 0, NULL, '2021-08-16 19:12:48'),
(212, 'CH', 'Switzerland', 0, NULL, '2021-08-16 19:12:49'),
(213, 'SY', 'Syrian Arab Republic', 0, NULL, '2021-08-16 19:12:50'),
(214, 'TW', 'Taiwan', 0, NULL, '2021-08-16 19:12:51'),
(215, 'TJ', 'Tajikistan', 0, NULL, '2021-08-16 19:12:53'),
(216, 'TZ', 'Tanzania, United Republic of', 0, NULL, '2021-08-16 19:12:54'),
(217, 'TH', 'Thailand', 0, NULL, '2021-08-16 19:12:56'),
(218, 'TG', 'Togo', 0, NULL, '2021-08-16 19:12:58'),
(219, 'TK', 'Tokelau', 0, NULL, '2021-08-16 19:12:59'),
(220, 'TO', 'Tonga', 0, NULL, '2021-08-16 19:13:00'),
(221, 'TT', 'Trinidad and Tobago', 0, NULL, '2021-08-16 19:13:01'),
(222, 'TN', 'Tunisia', 0, NULL, '2021-08-16 19:13:02'),
(223, 'TR', 'Turkey', 0, NULL, '2021-08-16 19:13:05'),
(224, 'TM', 'Turkmenistan', 0, NULL, '2021-08-16 19:13:06'),
(225, 'TC', 'Turks and Caicos Islands', 0, NULL, '2021-08-16 19:13:07'),
(226, 'TV', 'Tuvalu', 0, NULL, '2021-08-16 19:13:12'),
(227, 'UG', 'Uganda', 0, NULL, '2021-08-16 19:13:13'),
(228, 'UA', 'Ukraine', 0, NULL, '2021-08-16 19:13:14'),
(229, 'AE', 'United Arab Emirates', 0, NULL, '2021-08-16 19:13:15'),
(230, 'GB', 'United Kingdom', 0, NULL, '2021-08-16 19:13:16'),
(231, 'US', 'United States', 0, NULL, '2021-08-16 19:13:17'),
(232, 'UM', 'United States minor outlying islands', 0, NULL, '2021-08-16 19:13:20'),
(233, 'UY', 'Uruguay', 0, NULL, '2021-08-16 19:13:21'),
(234, 'UZ', 'Uzbekistan', 0, NULL, '2021-08-16 19:13:22'),
(235, 'VU', 'Vanuatu', 0, NULL, '2021-08-16 19:13:23'),
(236, 'VA', 'Vatican City State', 0, NULL, '2021-08-16 19:13:24'),
(237, 'VE', 'Venezuela', 0, NULL, '2021-08-16 19:13:27'),
(238, 'VN', 'Vietnam', 0, NULL, '2021-08-16 19:13:27'),
(239, 'VG', 'Virgin Islands (British)', 0, NULL, '2021-08-16 19:13:29'),
(240, 'VI', 'Virgin Islands (U.S.)', 0, NULL, '2021-08-16 19:13:30'),
(241, 'WF', 'Wallis and Futuna Islands', 0, NULL, '2021-08-16 19:13:36'),
(242, 'EH', 'Western Sahara', 0, NULL, '2021-08-16 19:13:39'),
(243, 'YE', 'Yemen', 0, NULL, '2021-08-16 19:13:41'),
(244, 'ZR', 'Zaire', 0, NULL, '2021-08-16 19:13:44'),
(245, 'ZM', 'Zambia', 0, NULL, '2021-08-16 19:13:43'),
(246, 'ZW', 'Zimbabwe', 0, NULL, '2021-08-16 19:13:46');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `details` longtext COLLATE utf8_unicode_ci NOT NULL,
  `discount` double(20,2) NOT NULL,
  `discount_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` int(15) NOT NULL,
  `end_date` int(15) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_usages`
--

CREATE TABLE `coupon_usages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `coupon_usages`
--

INSERT INTO `coupon_usages` (`id`, `user_id`, `coupon_id`, `created_at`, `updated_at`) VALUES
(1, 57, 1, '2021-09-04 15:50:51', '2021-09-04 15:50:51'),
(2, 60, 1, '2021-09-05 02:24:48', '2021-09-05 02:24:48'),
(3, 63, 1, '2021-09-05 07:17:45', '2021-09-05 07:17:45'),
(4, 62, 1, '2021-09-05 07:21:27', '2021-09-05 07:21:27'),
(5, 65, 1, '2021-09-05 09:04:26', '2021-09-05 09:04:26'),
(6, 66, 1, '2021-09-05 13:26:49', '2021-09-05 13:26:49'),
(7, 70, 1, '2021-09-05 17:32:07', '2021-09-05 17:32:07'),
(8, 71, 1, '2021-09-05 17:36:45', '2021-09-05 17:36:45'),
(9, 80, 1, '2021-09-07 07:18:55', '2021-09-07 07:18:55'),
(10, 81, 1, '2021-09-07 12:02:37', '2021-09-07 12:02:37'),
(11, 83, 1, '2021-09-07 12:12:48', '2021-09-07 12:12:48'),
(12, 99, 1, '2021-09-09 12:18:44', '2021-09-09 12:18:44'),
(13, 119, 1, '2021-09-13 05:32:55', '2021-09-13 05:32:55');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `exchange_rate` double(10,5) NOT NULL,
  `status` int(10) NOT NULL DEFAULT 0,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `exchange_rate`, `status`, `code`, `created_at`, `updated_at`) VALUES
(1, 'U.S. Dollar', '$', 1.00000, 0, 'USD', '2018-10-09 11:35:08', '2022-06-19 04:46:24'),
(2, 'Australian Dollar', '$', 1.28000, 0, 'AUD', '2018-10-09 11:35:08', '2021-09-26 10:04:38'),
(5, 'Brazilian Real', 'R$', 3.25000, 0, 'BRL', '2018-10-09 11:35:08', '2021-09-26 10:04:39'),
(6, 'Canadian Dollar', '$', 1.27000, 0, 'CAD', '2018-10-09 11:35:08', '2021-09-26 10:04:40'),
(7, 'Czech Koruna', 'Kč', 20.65000, 0, 'CZK', '2018-10-09 11:35:08', '2021-09-26 10:04:40'),
(8, 'Danish Krone', 'kr', 6.05000, 0, 'DKK', '2018-10-09 11:35:08', '2021-09-26 10:04:41'),
(9, 'Euro', '€', 0.85000, 0, 'EUR', '2018-10-09 11:35:08', '2021-09-26 10:04:42'),
(10, 'Hong Kong Dollar', '$', 7.83000, 0, 'HKD', '2018-10-09 11:35:08', '2021-09-26 10:04:45'),
(11, 'Hungarian Forint', 'Ft', 255.24000, 0, 'HUF', '2018-10-09 11:35:08', '2021-09-26 10:04:46'),
(12, 'Israeli New Sheqel', '₪', 3.48000, 0, 'ILS', '2018-10-09 11:35:08', '2021-09-26 10:05:01'),
(13, 'Japanese Yen', '¥', 107.12000, 0, 'JPY', '2018-10-09 11:35:08', '2021-09-26 10:05:02'),
(14, 'Malaysian Ringgit', 'RM', 3.91000, 0, 'MYR', '2018-10-09 11:35:08', '2021-09-26 10:05:04'),
(15, 'Mexican Peso', '$', 18.72000, 0, 'MXN', '2018-10-09 11:35:08', '2021-09-26 10:05:04'),
(16, 'Norwegian Krone', 'kr', 7.83000, 0, 'NOK', '2018-10-09 11:35:08', '2021-09-26 10:05:05'),
(17, 'New Zealand Dollar', '$', 1.38000, 0, 'NZD', '2018-10-09 11:35:08', '2021-09-26 10:05:06'),
(18, 'Philippine Peso', '₱', 52.26000, 0, 'PHP', '2018-10-09 11:35:08', '2021-09-26 10:05:07'),
(19, 'Polish Zloty', 'zł', 3.39000, 0, 'PLN', '2018-10-09 11:35:08', '2021-09-26 10:05:08'),
(20, 'Pound Sterling', '£', 0.72000, 0, 'GBP', '2018-10-09 11:35:08', '2021-09-26 10:05:09'),
(21, 'Russian Ruble', 'руб', 55.93000, 0, 'RUB', '2018-10-09 11:35:08', '2021-09-26 10:05:09'),
(22, 'Singapore Dollar', '$', 1.32000, 0, 'SGD', '2018-10-09 11:35:08', '2021-09-26 10:05:24'),
(23, 'Swedish Krona', 'kr', 8.19000, 0, 'SEK', '2018-10-09 11:35:08', '2021-09-26 10:05:25'),
(24, 'Swiss Franc', 'CHF', 0.94000, 0, 'CHF', '2018-10-09 11:35:08', '2021-09-26 10:05:26'),
(26, 'Thai Baht', '฿', 31.39000, 0, 'THB', '2018-10-09 11:35:08', '2021-09-26 10:05:28'),
(27, 'Taka', '৳', 84.00000, 1, 'BDT', '2018-10-09 11:35:08', '2018-12-02 05:16:13'),
(28, 'Indian Rupee', 'Rs', 68.45000, 0, 'Rupee', '2019-07-07 10:33:46', '2021-09-26 10:04:31');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 124, '2021-09-28 11:41:07', '2021-09-28 11:41:07'),
(3, 125, '2021-11-10 10:21:39', '2021-11-10 10:21:39'),
(4, 126, '2022-02-17 08:59:52', '2022-02-17 08:59:52'),
(5, 127, '2022-02-17 09:08:20', '2022-02-17 09:08:20'),
(6, 128, '2022-02-17 09:52:52', '2022-02-17 09:52:52'),
(9, 132, '2022-10-25 08:42:12', '2022-10-25 08:42:12'),
(10, 133, '2022-10-27 19:05:42', '2022-10-27 19:05:42'),
(11, 134, '2022-10-29 06:37:57', '2022-10-29 06:37:57'),
(12, 135, '2022-10-29 06:41:16', '2022-10-29 06:41:16'),
(13, 136, '2022-10-29 06:44:03', '2022-10-29 06:44:03'),
(14, 137, '2022-10-29 06:45:31', '2022-10-29 06:45:31'),
(15, 138, '2022-10-29 06:59:11', '2022-10-29 06:59:11'),
(16, 139, '2022-10-29 07:00:35', '2022-10-29 07:00:35'),
(17, 140, '2022-11-05 07:33:24', '2022-11-05 07:33:24');

-- --------------------------------------------------------

--
-- Table structure for table `customer_packages`
--

CREATE TABLE `customer_packages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` double(20,2) DEFAULT NULL,
  `product_upload` int(11) DEFAULT NULL,
  `logo` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_package_payments`
--

CREATE TABLE `customer_package_payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `customer_package_id` int(11) NOT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_details` longtext COLLATE utf8_unicode_ci NOT NULL,
  `approval` int(1) NOT NULL,
  `offline_payment` int(1) NOT NULL COMMENT '1=offline payment\r\n2=online paymnet',
  `reciept` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_package_translations`
--

CREATE TABLE `customer_package_translations` (
  `id` bigint(20) NOT NULL,
  `customer_package_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_products`
--

CREATE TABLE `customer_products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 0,
  `added_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `subsubcategory_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `photos` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail_img` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conditon` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_provider` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_link` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` double(20,2) DEFAULT 0.00,
  `meta_title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_img` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pdf` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_product_translations`
--

CREATE TABLE `customer_product_translations` (
  `id` bigint(20) NOT NULL,
  `customer_product_id` bigint(20) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_boys`
--

CREATE TABLE `delivery_boys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_collection` double(25,2) NOT NULL DEFAULT 0.00,
  `total_earning` double(25,2) NOT NULL DEFAULT 0.00,
  `monthly_salary` double(25,2) DEFAULT NULL,
  `order_commission` double(25,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `delivery_boys`
--

INSERT INTO `delivery_boys` (`id`, `user_id`, `total_collection`, `total_earning`, `monthly_salary`, `order_commission`, `created_at`, `updated_at`) VALUES
(1, 86, 0.00, 0.00, NULL, NULL, '2021-09-08 10:15:03', '2021-09-08 10:15:03'),
(2, 87, 0.00, 0.00, NULL, NULL, '2021-09-08 10:23:18', '2021-09-08 10:23:18');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_histories`
--

CREATE TABLE `delivery_histories` (
  `id` int(11) NOT NULL,
  `delivery_boy_id` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `delivery_status` varchar(255) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `earning` double(25,2) NOT NULL DEFAULT 0.00,
  `collection` double(25,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `delivery_histories`
--

INSERT INTO `delivery_histories` (`id`, `delivery_boy_id`, `order_id`, `delivery_status`, `payment_type`, `earning`, `collection`, `created_at`, `updated_at`) VALUES
(1, 87, 39, 'pending', 'cash_on_delivery', 0.00, 0.00, '2021-09-08 10:23:47', '2021-09-08 10:23:47');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` int(11) NOT NULL,
  `division_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `division_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Dhaka South', '2023-01-28', '2023-01-28'),
(2, 1, 'Dhaka North', '2023-01-28', '2023-01-28'),
(3, 1, 'Gazipur', '2023-01-28', '2023-01-28'),
(4, 2, 'Dinajpur', '2023-01-28', '2023-01-28'),
(5, 2, 'Nilphamari', '2023-01-28', '2023-01-28'),
(6, 2, 'Gaibandha', '2023-01-28', '2023-01-28'),
(7, 2, 'Lalmonirhat', '2023-01-28', '2023-01-28'),
(8, 2, 'Thakurgaon', '2023-01-28', '2023-01-28'),
(9, 2, 'Kurigram', '2023-01-28', '2023-01-28'),
(10, 2, 'Panchagarh', '2023-01-28', '2023-01-28'),
(11, 2, 'Rangpur', '2023-01-28', '2023-01-28');

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

CREATE TABLE `divisions` (
  `id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `divisions`
--

INSERT INTO `divisions` (`id`, `country_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 18, 'Dhaka', '2023-01-28', '2023-01-28'),
(2, 18, 'Rangpur', '2023-01-28', '2023-01-28'),
(3, 18, 'Rajshahi', '2023-01-28', '2023-01-28'),
(4, 18, 'Chittagong', '2023-01-28', '2023-01-28'),
(5, 18, 'Barisal', '2023-01-28', '2023-01-28'),
(6, 18, 'Khulna', '2023-01-28', '2023-01-28'),
(7, 18, 'Mymensingh', '2023-01-28', '2023-01-28'),
(8, 18, 'Sylhet', '2023-01-28', '2023-01-28');

-- --------------------------------------------------------

--
-- Table structure for table `firebase_notifications`
--

CREATE TABLE `firebase_notifications` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `item_type` varchar(255) NOT NULL,
  `item_type_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `flash_deals`
--

CREATE TABLE `flash_deals` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` int(20) DEFAULT NULL,
  `end_date` int(20) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `featured` int(1) NOT NULL DEFAULT 0,
  `background_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banner` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `flash_deals`
--

INSERT INTO `flash_deals` (`id`, `title`, `start_date`, `end_date`, `status`, `featured`, `background_color`, `text_color`, `banner`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Flash Sale', 1667584800, 1669831140, 1, 1, '#FFA500', 'dark', NULL, 'flash-sale-v79zo', '2021-08-24 15:23:53', '2022-11-05 17:11:19'),
(2, 'Big Sale', 1631642400, 1632592740, 1, 0, '#ed9121', 'dark', NULL, 'big-sale-2n3bg', '2021-09-13 10:44:21', '2021-10-04 06:42:02');

-- --------------------------------------------------------

--
-- Table structure for table `flash_deal_products`
--

CREATE TABLE `flash_deal_products` (
  `id` int(11) NOT NULL,
  `flash_deal_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `discount` double(20,2) DEFAULT 0.00,
  `discount_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `flash_deal_products`
--

INSERT INTO `flash_deal_products` (`id`, `flash_deal_id`, `product_id`, `discount`, `discount_type`, `created_at`, `updated_at`) VALUES
(762, 2, 5, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(763, 2, 155, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(764, 2, 157, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(765, 2, 158, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(766, 2, 159, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(767, 2, 160, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(768, 2, 161, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(769, 2, 162, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(770, 2, 163, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(771, 2, 165, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(772, 2, 167, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(773, 2, 168, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(774, 2, 332, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(775, 2, 337, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(776, 2, 344, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(777, 2, 348, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(778, 2, 349, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(779, 2, 352, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(780, 2, 353, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(781, 2, 354, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(782, 2, 355, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(783, 2, 356, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(784, 2, 357, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(785, 2, 358, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(786, 2, 359, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(787, 2, 360, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(788, 2, 361, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(789, 2, 362, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(790, 2, 363, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(791, 2, 364, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(792, 2, 365, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(793, 2, 366, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(794, 2, 367, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(795, 2, 368, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(796, 2, 369, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(797, 2, 370, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(798, 2, 371, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(799, 2, 372, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(800, 2, 373, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(801, 2, 374, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(802, 2, 375, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(803, 2, 376, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(804, 2, 377, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(805, 2, 378, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(806, 2, 379, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(807, 2, 380, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(808, 2, 381, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(809, 2, 382, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(810, 2, 383, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(811, 2, 384, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(812, 2, 385, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(813, 2, 500, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(814, 2, 503, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(815, 2, 505, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(816, 2, 508, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(817, 2, 509, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(818, 2, 510, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(819, 2, 511, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(820, 2, 512, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(821, 2, 513, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(822, 2, 514, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(823, 2, 587, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(824, 2, 590, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(825, 2, 591, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(826, 2, 592, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(827, 2, 593, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(828, 2, 594, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(829, 2, 595, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(830, 2, 596, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(831, 2, 597, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(832, 2, 598, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(833, 2, 599, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(834, 2, 600, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(835, 2, 601, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(836, 2, 602, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(837, 2, 603, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(838, 2, 604, 0.00, NULL, '2021-09-23 12:28:53', '2021-09-23 12:28:53'),
(866, 1, 669, 0.00, NULL, '2022-11-05 17:11:19', '2022-11-05 17:11:19'),
(867, 1, 670, 0.00, NULL, '2022-11-05 17:11:19', '2022-11-05 17:11:19');

-- --------------------------------------------------------

--
-- Table structure for table `flash_deal_translations`
--

CREATE TABLE `flash_deal_translations` (
  `id` bigint(20) NOT NULL,
  `flash_deal_id` bigint(20) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `flash_deal_translations`
--

INSERT INTO `flash_deal_translations` (`id`, `flash_deal_id`, `title`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'Flash Sale', 'en', '2021-08-24 15:23:53', '2021-08-24 15:23:53'),
(2, 2, 'Big Sale', 'en', '2021-09-13 10:44:21', '2021-09-13 10:44:21');

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` int(11) NOT NULL,
  `frontend_color` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `footer_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_login_background` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_login_sidebar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `site_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instagram` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_plus` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `frontend_color`, `logo`, `footer_logo`, `admin_logo`, `admin_login_background`, `admin_login_sidebar`, `favicon`, `site_name`, `address`, `description`, `phone`, `email`, `facebook`, `instagram`, `twitter`, `youtube`, `google_plus`, `created_at`, `updated_at`) VALUES
(1, 'default', 'uploads/logo/pfdIuiMeXGkDAIpPEUrvUCbQrOHu484nbGfz77zB.png', NULL, 'uploads/admin_logo/wCgHrz0Q5QoL1yu4vdrNnQIr4uGuNL48CXfcxOuS.png', NULL, NULL, 'uploads/favicon/uHdGidSaRVzvPgDj6JFtntMqzJkwDk9659233jrb.png', 'Active Ecommerce CMS', 'Demo Address', 'Active eCommerce CMS is a Multi vendor system is such a platform to build a border less marketplace.', '1234567890', 'admin@example.com', 'https://www.facebook.com', 'https://www.instagram.com', 'https://www.twitter.com', 'https://www.youtube.com', 'https://www.googleplus.com', '2019-03-13 08:01:06', '2019-03-13 02:01:06');

-- --------------------------------------------------------

--
-- Table structure for table `home_categories`
--

CREATE TABLE `home_categories` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subsubcategories` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `home_categories`
--

INSERT INTO `home_categories` (`id`, `category_id`, `subsubcategories`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '[\"1\"]', 1, '2019-03-12 06:38:23', '2019-03-12 06:38:23'),
(2, 2, '[\"10\"]', 1, '2019-03-12 06:44:54', '2019-03-12 06:44:54');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `rtl` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `rtl`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 0, '2019-01-20 12:13:20', '2021-09-26 08:37:02');

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE `links` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `conversation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('00356a05-acac-43cd-ac70-a978465cde06', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":26,\"order_code\":\"20210905-21414236\",\"user_id\":15,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-08 16:33:47', '2021-09-05 13:41:42', '2021-09-08 16:33:47'),
('00838d4a-ad34-45a8-86dc-a2351f28c0ae', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":58,\"order_code\":\"20211004-11542557\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-10-04 05:54:25', '2021-10-04 09:49:09'),
('008fa1c4-56f7-45d0-8a03-fa511a349931', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":57,\"order_code\":\"20211003-16495579\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-10-03 10:49:55', '2021-10-04 09:49:09'),
('00a10d32-b4ad-46ce-af2d-4cb7aec9e880', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":14,\"order_code\":\"20210904-23505181\",\"user_id\":\"57\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', NULL, '2021-09-04 16:02:10', '2021-09-04 16:02:10'),
('00d1dc2c-5b6b-4fbd-aeed-884a42c2d484', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":23,\"order_code\":\"20210905-17010782\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"cancelled\"}', NULL, '2021-09-05 13:38:58', '2021-09-05 13:38:58'),
('01b7ed90-badd-4846-92da-79f909a22b2a', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":75,\"order_code\":\"20211004-17185173\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-10-04 11:18:51', '2022-12-23 11:04:18'),
('01e9a9cc-e067-4d22-9f30-b76be625c9be', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":10,\"order_code\":\"20230131-19063543\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', NULL, '2023-01-31 13:06:37', '2023-01-31 13:06:37'),
('02969e25-5321-4ecd-aace-581bca5e7a6c', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":57,\"order_code\":\"20210911-20543732\",\"user_id\":111,\"seller_id\":\"43\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-11 12:54:38', '2021-09-26 06:21:53'),
('02d9c484-f2a6-4472-981d-040dda28022c', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":44,\"order_code\":\"20210909-20002786\",\"user_id\":96,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-09 12:00:28', '2021-09-09 12:00:28'),
('04a5d3f0-9800-47b7-b586-6a2ad31a0eaa', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":27,\"order_code\":\"20210905-21534629\",\"user_id\":15,\"seller_id\":\"29\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-05 13:53:46', '2021-09-26 06:21:53'),
('0721f4f3-1d8f-4edc-86d1-e3ec9b8b1498', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":24,\"order_code\":\"20210929-13053113\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 07:05:31', '2021-10-04 09:49:09'),
('076fbb73-d178-4c47-944a-49c5e0068549', 'App\\Notifications\\OrderNotification', 'App\\User', 29, '{\"order_id\":7,\"order_code\":\"20210831-01312739\",\"user_id\":\"34\",\"seller_id\":\"29\",\"status\":\"confirmed\"}', NULL, '2021-08-30 17:34:44', '2021-08-30 17:34:44'),
('078d3ba6-48ef-45a1-a38c-0c24f64286c0', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":15,\"order_code\":\"20210905-01343946\",\"user_id\":58,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-04 17:34:40', '2021-09-26 06:21:53'),
('080e18b5-cd09-4add-b786-32fbe06c996d', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":55,\"order_code\":\"20210911-20502210\",\"user_id\":110,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-11 12:50:24', '2021-09-26 06:21:53'),
('0afb36ca-c099-401a-936f-fb0fedc3883f', 'App\\Notifications\\OrderNotification', 'App\\User', 10, '{\"order_id\":1,\"order_code\":\"20210817-03324491\",\"user_id\":\"10\",\"seller_id\":\"10\",\"status\":\"delivered\"}', NULL, '2021-08-16 19:48:23', '2021-08-16 19:48:23'),
('0b25172b-7e4c-439d-b578-8d58ad07989e', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":36,\"order_code\":\"20210929-16532171\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 10:53:21', '2021-10-04 09:49:09'),
('0b4d9d68-01e7-4a2c-8db0-c51584e3e8b9', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":81,\"order_code\":\"20211004-17344270\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-11-09 10:30:45', '2021-10-04 11:34:42', '2021-11-09 10:30:45'),
('0b81ccc1-9686-490a-baf8-98fb3b3dc937', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":33,\"order_code\":\"20210929-16420733\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 10:42:07', '2021-10-04 09:49:09'),
('0b90e6f8-0196-485f-b0c4-ab322bd10440', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":79,\"order_code\":\"20211004-17235984\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-11-09 10:30:45', '2021-10-04 11:23:59', '2021-11-09 10:30:45'),
('0d4a277e-d50c-4e30-a23c-91afb92bc0fa', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":3,\"order_code\":\"20210821-23370034\",\"user_id\":\"28\",\"seller_id\":\"28\",\"status\":\"confirmed\"}', '2021-09-26 06:21:53', '2021-08-21 15:39:22', '2021-09-26 06:21:53'),
('0eede972-fe82-4d5a-8952-3385a132ef93', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":17,\"order_code\":\"20210905-10244893\",\"user_id\":\"60\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', NULL, '2021-09-05 06:58:11', '2021-09-05 06:58:11'),
('0ff48ef3-f983-42c9-b9e0-b93db1cc8da3', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":39,\"order_code\":\"20210908-00280020\",\"user_id\":\"15\",\"seller_id\":\"29\",\"status\":\"on_the_way\"}', '2021-09-26 06:21:53', '2021-09-08 10:27:26', '2021-09-26 06:21:53'),
('103bce37-0bf9-4456-8c0f-377d51e01dfa', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":41,\"order_code\":\"20210909-19520737\",\"user_id\":15,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-09 11:52:09', '2021-09-09 11:52:09'),
('110af897-75d3-4e92-b5cb-58131a80295d', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":37,\"order_code\":\"20210929-16534186\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 10:53:41', '2021-10-04 09:49:09'),
('116d78c7-c6a8-48be-8e86-fefd18b82d17', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":37,\"order_code\":\"20210929-16534186\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-09-29 10:53:41', '2022-12-23 11:04:18'),
('12ca22eb-b860-4dda-8d01-0ddea759b80c', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":43,\"order_code\":\"20210929-16572260\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 10:57:22', '2021-10-04 09:49:09'),
('13384898-8b9c-405c-85d3-2550804a408d', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":59,\"order_code\":\"20210913-11315431\",\"user_id\":117,\"seller_id\":\"10\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-13 03:31:56', '2021-09-26 06:21:53'),
('13e779d2-6cf0-44e2-bff8-557c7e166250', 'App\\Notifications\\OrderNotification', 'App\\User', 29, '{\"order_id\":39,\"order_code\":\"20210908-00280020\",\"user_id\":\"15\",\"seller_id\":\"29\",\"status\":\"cancelled\"}', NULL, '2021-09-08 14:18:21', '2021-09-08 14:18:21'),
('14301d46-ce83-4112-a0b1-8190e7feb893', 'App\\Notifications\\OrderNotification', 'App\\User', 29, '{\"order_id\":39,\"order_code\":\"20210908-00280020\",\"user_id\":\"15\",\"seller_id\":\"29\",\"status\":\"on_the_way\"}', NULL, '2021-09-08 10:27:26', '2021-09-08 10:27:26'),
('146252c9-5778-41fc-89a2-b6bcb490c223', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":39,\"order_code\":\"20210908-00280020\",\"user_id\":\"15\",\"seller_id\":\"29\",\"status\":\"confirmed\"}', '2021-09-26 06:21:53', '2021-09-08 10:26:50', '2021-09-26 06:21:53'),
('1545aebe-426a-403b-84a6-7a577427c50c', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":19,\"order_code\":\"20210929-12540578\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 06:54:05', '2021-10-04 09:49:09'),
('159b41ab-d47f-460c-81da-33c9e0b647b2', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":58,\"order_code\":\"20210912-13281862\",\"user_id\":112,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-12 05:28:20', '2021-09-26 06:21:53'),
('15ac4eef-3244-4483-b869-a30cd689ca13', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":8,\"order_code\":\"20210831-01461684\",\"user_id\":10,\"seller_id\":\"10\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-08-30 17:46:17', '2021-09-26 06:21:53'),
('15b8d489-e113-4b5c-8783-0bf998cc9cae', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":5,\"order_code\":\"20210929-12395074\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:19', '2021-09-29 06:39:51', '2022-12-23 11:04:19'),
('15eea698-3440-41b1-9c20-4dde289679a8', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":78,\"order_code\":\"20211004-17222871\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-11-09 10:30:45', '2021-10-04 11:22:28', '2021-11-09 10:30:45'),
('1613530a-a337-47dc-ac00-02a4bf138fa4', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":4,\"order_code\":\"20210824-02553769\",\"user_id\":\"32\",\"seller_id\":\"32\",\"status\":\"delivered\"}', '2021-09-26 06:21:53', '2021-08-23 18:56:25', '2021-09-26 06:21:53'),
('16cd5208-e600-4d97-a2d3-1b5e6407ac66', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":82,\"order_code\":\"20211004-17354345\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-11-09 10:30:45', '2021-10-04 11:35:43', '2021-11-09 10:30:45'),
('17793bfb-956b-4ab4-b50b-6682062eeadf', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":49,\"order_code\":\"20210909-20184469\",\"user_id\":99,\"seller_id\":\"31\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-09 12:18:45', '2021-09-26 06:21:53'),
('178adfc2-656f-465e-bfbf-07afa18af08f', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":69,\"order_code\":\"20211004-17144256\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-11-09 10:30:45', '2021-10-04 11:14:42', '2021-11-09 10:30:45'),
('17b00a89-2815-4773-b3f2-31f05a1ee7b7', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":65,\"order_code\":\"20211004-17092168\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-11-09 10:30:45', '2021-10-04 11:09:21', '2021-11-09 10:30:45'),
('1806315b-3a35-454e-b0ae-cdfba5c8bfb7', 'App\\Notifications\\OrderNotification', 'App\\User', 29, '{\"order_id\":27,\"order_code\":\"20210905-21534629\",\"user_id\":\"15\",\"seller_id\":\"29\",\"status\":\"cancelled\"}', NULL, '2021-09-05 16:39:58', '2021-09-05 16:39:58'),
('19659b17-32bb-4f2a-b8dd-267ac85c0c43', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":10,\"order_code\":\"20210831-02222720\",\"user_id\":\"34\",\"seller_id\":\"46\",\"status\":\"paid\"}', '2021-09-26 06:21:53', '2021-08-31 01:24:53', '2021-09-26 06:21:53'),
('19ab22b5-02dc-478e-a2ac-b0b699086016', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":48,\"order_code\":\"20210909-20154162\",\"user_id\":98,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-09 12:15:42', '2021-09-09 12:15:42'),
('1b3366c7-eb1c-4150-80b3-e14a0fcbcdf3', 'App\\Notifications\\OrderNotification', 'App\\User', 65, '{\"order_id\":24,\"order_code\":\"20210905-17042690\",\"user_id\":65,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-05 09:04:26', '2021-09-05 09:04:26'),
('1c637eba-c5f8-498a-8d8a-0c020da0b035', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":1,\"order_code\":\"20210817-03324491\",\"user_id\":\"10\",\"seller_id\":\"10\",\"status\":\"on_delivery\"}', '2021-09-26 06:21:53', '2021-08-16 19:35:06', '2021-09-26 06:21:53'),
('1c6f9601-b0c9-4cec-8629-896ba07a7bb4', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":4,\"order_code\":\"20210824-02553769\",\"user_id\":\"32\",\"seller_id\":\"32\",\"status\":\"paid\"}', '2021-09-26 06:21:53', '2021-08-23 18:56:15', '2021-09-26 06:21:53'),
('1ccc696d-00a9-4447-95ed-54235900ef51', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":67,\"order_code\":\"20211004-17133230\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-10-04 11:13:32', '2022-12-23 11:04:18'),
('1cdad586-ee3d-4ff5-8d6f-1155c1211566', 'App\\Notifications\\OrderNotification', 'App\\User', 63, '{\"order_id\":21,\"order_code\":\"20210905-15174581\",\"user_id\":63,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-05 07:17:46', '2021-09-05 07:17:46'),
('1d4f2362-71c6-425c-b3f6-e8795981f260', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":34,\"order_code\":\"20210907-15255993\",\"user_id\":15,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-08 16:33:47', '2021-09-07 07:26:00', '2021-09-08 16:33:47'),
('1d8f874f-6f03-4ff9-9229-44478b2a616d', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":33,\"order_code\":\"20210907-15223233\",\"user_id\":15,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-07 07:22:33', '2021-09-26 06:21:53'),
('1db240f6-172f-46bc-94ca-af2f63c06eab', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":40,\"order_code\":\"20210929-16544710\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-09-29 10:54:48', '2022-12-23 11:04:18'),
('1dfbb6ad-be17-4e1b-a214-bb31ec72023a', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":22,\"order_code\":\"20210905-15212796\",\"user_id\":62,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-05 07:21:27', '2021-09-05 07:21:27'),
('1e857f6e-9f5c-4d9a-8cca-72c0153f5c47', 'App\\Notifications\\OrderNotification', 'App\\User', 40, '{\"order_id\":5,\"order_code\":\"20210827-00234864\",\"user_id\":40,\"seller_id\":\"28\",\"status\":\"placed\"}', NULL, '2021-08-26 16:23:49', '2021-08-26 16:23:49'),
('1f7080c3-1fc6-4fad-af65-8e7ddd885178', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":36,\"order_code\":\"20210907-20023744\",\"user_id\":81,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-07 12:02:39', '2021-09-07 12:02:39'),
('201bd08f-90d1-48ef-816a-c423e394c008', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":19,\"order_code\":\"20210905-15105178\",\"user_id\":\"62\",\"seller_id\":\"16\",\"status\":\"cancelled\"}', NULL, '2021-09-05 07:20:28', '2021-09-05 07:20:28'),
('2072310c-070b-4533-a3fa-048cd0ec7604', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":24,\"order_code\":\"20210905-17042690\",\"user_id\":\"65\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', '2021-09-26 06:21:53', '2021-09-05 09:05:15', '2021-09-26 06:21:53'),
('215b0af2-b9c0-47dc-bedf-f3eafd7b2c38', 'App\\Notifications\\OrderNotification', 'App\\User', 98, '{\"order_id\":48,\"order_code\":\"20210909-20154162\",\"user_id\":98,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-09 12:15:42', '2021-09-09 12:15:42'),
('2201a42f-2968-47fa-88a5-d8c0bf886fd5', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":32,\"order_code\":\"20210929-16364685\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-09-29 10:36:46', '2022-12-23 11:04:18'),
('225e4119-45cb-4682-8482-1a029d074459', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":72,\"order_code\":\"20211004-17173058\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-11-09 10:30:45', '2021-10-04 11:17:30', '2021-11-09 10:30:45'),
('22d41532-7435-4710-a21f-fb044dd85bd5', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":25,\"order_code\":\"20210905-21264914\",\"user_id\":\"66\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', '2021-09-26 06:21:53', '2021-09-05 13:39:27', '2021-09-26 06:21:53'),
('23641973-478e-4ac0-8f54-d5b0e68c1ef4', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":8,\"order_code\":\"20221105-13580272\",\"user_id\":140,\"seller_id\":9,\"status\":\"paid\"}', NULL, '2022-11-05 08:03:47', '2022-11-05 08:03:47'),
('23966e61-3436-4244-9f94-c1d9f2998734', 'App\\Notifications\\OrderNotification', 'App\\User', 43, '{\"order_id\":47,\"order_code\":\"20210909-20125550\",\"user_id\":97,\"seller_id\":\"43\",\"status\":\"placed\"}', NULL, '2021-09-09 12:12:56', '2021-09-09 12:12:56'),
('23a1c487-a2f2-4a5a-a423-5821b7412f8f', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":73,\"order_code\":\"20211004-17180025\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-10-04 11:18:00', '2022-12-23 11:04:18'),
('243ce7d7-8824-4059-81d4-2b683141e452', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":31,\"order_code\":\"20210929-16361878\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-09-29 10:36:18', '2022-12-23 11:04:18'),
('243f04ae-64f6-4b7c-97dd-513a135ddf09', 'App\\Notifications\\OrderNotification', 'App\\User', 97, '{\"order_id\":47,\"order_code\":\"20210909-20125550\",\"user_id\":97,\"seller_id\":\"43\",\"status\":\"placed\"}', NULL, '2021-09-09 12:12:56', '2021-09-09 12:12:56'),
('244afe88-e845-4ffa-ac99-4fa6d575a11b', 'App\\Notifications\\OrderNotification', 'App\\User', 33, '{\"order_id\":6,\"order_code\":\"20210828-00145997\",\"user_id\":34,\"seller_id\":\"33\",\"status\":\"placed\"}', NULL, '2021-08-27 16:14:59', '2021-08-27 16:14:59'),
('252e4454-ebed-4ca8-9da0-7bb069f92275', 'App\\Notifications\\OrderNotification', 'App\\User', 34, '{\"order_id\":7,\"order_code\":\"20210831-01312739\",\"user_id\":\"34\",\"seller_id\":\"29\",\"status\":\"confirmed\"}', '2021-08-30 17:35:04', '2021-08-30 17:34:57', '2021-08-30 17:35:04'),
('25ae10cb-aac9-49a5-a552-b1525725d44b', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":16,\"order_code\":\"20210905-01434297\",\"user_id\":15,\"seller_id\":\"18\",\"status\":\"placed\"}', '2021-09-08 16:33:47', '2021-09-04 17:43:43', '2021-09-08 16:33:47'),
('25b3a52f-11b7-43b7-9602-70fb62c543eb', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":27,\"order_code\":\"20210905-21534629\",\"user_id\":\"15\",\"seller_id\":\"29\",\"status\":\"cancelled\"}', '2021-09-26 06:21:53', '2021-09-05 16:39:58', '2021-09-26 06:21:53'),
('265be3c9-f384-4720-9538-0459512d3b41', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":17,\"order_code\":\"20210905-10244893\",\"user_id\":60,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-05 02:24:49', '2021-09-26 06:21:53'),
('27143f38-4201-451c-aaf5-cb6e3e18f076', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":68,\"order_code\":\"20211004-17135930\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-10-04 11:13:59', '2022-12-23 11:04:18'),
('273deb9a-e06c-485b-9c8d-cd9a570c759e', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":21,\"order_code\":\"20210905-15174581\",\"user_id\":63,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-05 07:17:46', '2021-09-05 07:17:46'),
('273e2739-5c9d-4065-a96e-6859be5a9065', 'App\\Notifications\\OrderNotification', 'App\\User', 66, '{\"order_id\":25,\"order_code\":\"20210905-21264914\",\"user_id\":66,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-05 13:26:50', '2021-09-05 13:26:50'),
('27abe0a8-18e9-4864-b856-b0c18b10ab25', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":24,\"order_code\":\"20210905-17042690\",\"user_id\":65,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-05 09:04:26', '2021-09-05 09:04:26'),
('29350641-150a-4544-9926-7c20b1e8924a', 'App\\Notifications\\OrderNotification', 'App\\User', 29, '{\"order_id\":11,\"order_code\":\"20210902-15351187\",\"user_id\":15,\"seller_id\":\"29\",\"status\":\"placed\"}', NULL, '2021-09-02 07:35:11', '2021-09-02 07:35:11'),
('2983bc19-4292-4672-ae2a-a7af1762cdd7', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":78,\"order_code\":\"20211004-17222871\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-10-04 11:22:28', '2022-12-23 11:04:18'),
('29d6fdd1-3c9c-4676-8d35-5c77548c068c', 'App\\Notifications\\OrderNotification', 'App\\User', 54, '{\"order_id\":13,\"order_code\":\"20210903-22521727\",\"user_id\":54,\"seller_id\":\"54\",\"status\":\"placed\"}', NULL, '2021-09-03 14:52:18', '2021-09-03 14:52:18'),
('29ee5ab1-edd7-4198-aac8-934b70497219', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":64,\"order_code\":\"20211004-17064155\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-10-04 11:06:41', '2022-12-23 11:04:18'),
('2a4cba12-6624-4546-a0c6-7ab9a5489db0', 'App\\Notifications\\OrderNotification', 'App\\User', 127, '{\"order_id\":1,\"order_code\":\"20220217-15130866\",\"user_id\":127,\"seller_id\":\"9\",\"status\":\"placed\"}', NULL, '2022-02-17 09:13:09', '2022-02-17 09:13:09'),
('2a56841c-29ce-47ff-b3bd-7aa6f09fc382', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":34,\"order_code\":\"20210929-16454863\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-09-29 10:45:49', '2022-12-23 11:04:18'),
('2b1762e5-1011-4ef4-9a54-3237bdaa2222', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":55,\"order_code\":\"20210911-20502210\",\"user_id\":110,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-11 12:50:24', '2021-09-11 12:50:24'),
('2b8c3704-c702-452d-97ca-c45f3ea9f60c', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":2,\"order_code\":\"20220621-15085431\",\"user_id\":130,\"seller_id\":\"9\",\"status\":\"placed\"}', NULL, '2022-06-21 09:08:55', '2022-06-21 09:08:55'),
('2c71d3a5-3739-45ec-8cc6-3fc9d0595ebd', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":7,\"order_code\":\"20210831-01312739\",\"user_id\":\"34\",\"seller_id\":\"29\",\"status\":\"confirmed\"}', '2021-09-26 06:21:53', '2021-08-30 17:34:44', '2021-09-26 06:21:53'),
('2cd0d41c-7878-41f6-816a-4689b2047638', 'App\\Notifications\\OrderNotification', 'App\\User', 29, '{\"order_id\":12,\"order_code\":\"20210902-16482681\",\"user_id\":15,\"seller_id\":\"29\",\"status\":\"placed\"}', NULL, '2021-09-02 08:48:26', '2021-09-02 08:48:26'),
('2cfaf6e0-58d0-4dc8-8edd-89bba0806d11', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":33,\"order_code\":\"20210907-15223233\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"on_the_way\"}', '2021-09-26 06:21:53', '2021-09-12 04:27:38', '2021-09-26 06:21:53'),
('2d38466c-16ad-4a29-bea0-df75a8e311eb', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":34,\"order_code\":\"20210907-15255993\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', '2021-09-08 16:33:47', '2021-09-07 07:31:53', '2021-09-08 16:33:47'),
('2d8e1047-10b5-49e8-a018-de1e859dc65a', 'App\\Notifications\\OrderNotification', 'App\\User', 28, '{\"order_id\":5,\"order_code\":\"20210827-00234864\",\"user_id\":40,\"seller_id\":\"28\",\"status\":\"placed\"}', NULL, '2021-08-26 16:23:49', '2021-08-26 16:23:49'),
('2da42d4f-af58-4be1-a04e-a08631878361', 'App\\Notifications\\OrderNotification', 'App\\User', 31, '{\"order_id\":49,\"order_code\":\"20210909-20184469\",\"user_id\":99,\"seller_id\":\"31\",\"status\":\"placed\"}', NULL, '2021-09-09 12:18:45', '2021-09-09 12:18:45'),
('2ddf7603-51dd-4fdd-9432-aef5cf3570b1', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":43,\"order_code\":\"20210929-16572260\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-09-29 10:57:22', '2022-12-23 11:04:18'),
('2e0d749c-6f8d-4887-a188-14508c0b1e4d', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":9,\"order_code\":\"20210831-02221552\",\"user_id\":34,\"seller_id\":\"46\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-08-30 18:22:16', '2021-09-26 06:21:53'),
('2e9ceb2c-fc95-4a26-b4f2-285f6b0af3ed', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":26,\"order_code\":\"20210905-21414236\",\"user_id\":15,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-05 13:41:42', '2021-09-26 06:21:53'),
('2eacc1cb-84f5-4e50-8938-cf9f5c96a7eb', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":56,\"order_code\":\"20211003-16493716\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-10-03 10:49:37', '2022-12-23 11:04:18'),
('2ee72a7b-dbcb-48c4-9ba2-b50104a1e574', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":72,\"order_code\":\"20211004-17173058\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-10-04 11:17:30', '2022-12-23 11:04:18'),
('2fa59485-a4a5-449c-84ac-89a706fa1e6e', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":22,\"order_code\":\"20210905-15212796\",\"user_id\":\"62\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', NULL, '2021-09-05 07:22:57', '2021-09-05 07:22:57'),
('2fc4a4ec-d404-4667-9018-43b047dd1ca5', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":19,\"order_code\":\"20210929-12540578\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:19', '2021-09-29 06:54:05', '2022-12-23 11:04:19'),
('306e7547-25f2-4153-994b-0041e3421935', 'App\\Notifications\\OrderNotification', 'App\\User', 10, '{\"order_id\":59,\"order_code\":\"20210913-11315431\",\"user_id\":117,\"seller_id\":\"10\",\"status\":\"placed\"}', NULL, '2021-09-13 03:31:56', '2021-09-13 03:31:56'),
('307b88f0-abfb-4ca1-9592-f1ed819a52b2', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":16,\"order_code\":\"20210929-12530790\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 06:53:07', '2021-10-04 09:49:09'),
('32141db2-ded5-4c4b-8ad7-6aaa42d01fac', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":62,\"order_code\":\"20211004-11564175\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-10-04 05:56:41', '2021-10-04 09:49:09'),
('3230f9ef-a6ee-4d1b-ad59-d59237bc50fe', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":33,\"order_code\":\"20210929-16420733\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-09-29 10:42:07', '2022-12-23 11:04:18'),
('33fb917f-a455-4b72-b014-72d51fe3b257', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":10,\"order_code\":\"20210831-02222720\",\"user_id\":34,\"seller_id\":\"46\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-08-30 18:22:27', '2021-09-26 06:21:53'),
('3434f1a1-314a-45ca-8ce1-d68d6ff96ad0', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":31,\"order_code\":\"20210907-15161895\",\"user_id\":79,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-07 07:16:20', '2021-09-07 07:16:20'),
('34558c1b-d694-4dc5-b63d-f46bd2ccd9fe', 'App\\Notifications\\OrderNotification', 'App\\User', 107, '{\"order_id\":53,\"order_code\":\"20210910-22224943\",\"user_id\":107,\"seller_id\":\"31\",\"status\":\"placed\"}', NULL, '2021-09-10 14:22:51', '2021-09-10 14:22:51'),
('354f4719-f1b0-43ca-9f71-72b0bfc522dd', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":77,\"order_code\":\"20211004-17201433\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-11-09 10:30:45', '2021-10-04 11:20:14', '2021-11-09 10:30:45'),
('35c92f5e-bc59-4887-83f2-d9905b3eac44', 'App\\Notifications\\OrderNotification', 'App\\User', 57, '{\"order_id\":14,\"order_code\":\"20210904-23505181\",\"user_id\":\"57\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', NULL, '2021-09-04 16:02:10', '2021-09-04 16:02:10'),
('364c521e-9f23-47b1-a421-399f4717c4f2', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":14,\"order_code\":\"20210904-23505181\",\"user_id\":57,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-04 15:50:51', '2021-09-04 15:50:51'),
('36e5296b-e60c-4209-a6ed-3866ba7daeb9', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":23,\"order_code\":\"20210905-17010782\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', NULL, '2021-09-05 09:04:55', '2021-09-05 09:04:55'),
('370270fa-4205-4561-8e00-647438dabf31', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":29,\"order_code\":\"20210929-15504055\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-09-29 09:50:40', '2022-12-23 11:04:18'),
('3746a7ce-3364-4daa-a3c7-d99b2469757b', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":41,\"order_code\":\"20210909-19520737\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', '2021-09-26 06:21:53', '2021-09-09 12:27:37', '2021-09-26 06:21:53'),
('375551be-8bb2-4eaa-8983-361b4c4f26d3', 'App\\Notifications\\OrderNotification', 'App\\User', 63, '{\"order_id\":20,\"order_code\":\"20210905-15153672\",\"user_id\":63,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-05 07:15:36', '2021-09-05 07:15:36'),
('38dea5d2-ebb3-47bc-9efe-eba4b8b75cf2', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":80,\"order_code\":\"20211004-17262612\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-10-04 11:26:26', '2022-12-23 11:04:18'),
('38f2a23e-828f-449e-8c20-3c948bfc60b6', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":21,\"order_code\":\"20210905-15174581\",\"user_id\":\"63\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', NULL, '2021-09-05 07:22:38', '2021-09-05 07:22:38'),
('38fec914-4a9e-446b-a57c-c7160d9815cd', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":10,\"order_code\":\"20210929-12491318\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:19', '2021-09-29 06:49:13', '2022-12-23 11:04:19'),
('3916f98e-dfc5-4fa4-87a1-92d8c2c34c13', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":8,\"order_code\":\"20221105-13580272\",\"user_id\":140,\"seller_id\":9,\"status\":\"on_the_way\"}', NULL, '2022-11-05 08:02:50', '2022-11-05 08:02:50'),
('39fe2906-5094-407f-ac28-bba1e350aff8', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":24,\"order_code\":\"20210905-17042690\",\"user_id\":65,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-05 09:04:26', '2021-09-26 06:21:53'),
('3a2fbcf8-7479-430f-8d75-58f20d2870e4', 'App\\Notifications\\OrderNotification', 'App\\User', 34, '{\"order_id\":10,\"order_code\":\"20210831-02222720\",\"user_id\":34,\"seller_id\":\"46\",\"status\":\"placed\"}', '2021-08-30 18:27:19', '2021-08-30 18:22:27', '2021-08-30 18:27:19'),
('3a705d04-06c6-471d-933e-9bcdf61026b1', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":41,\"order_code\":\"20210909-19520737\",\"user_id\":15,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-09 11:52:09', '2021-09-09 11:52:09'),
('3ac79ea5-54ce-4d15-ba6b-4c56fa090d99', 'App\\Notifications\\OrderNotification', 'App\\User', 96, '{\"order_id\":44,\"order_code\":\"20210909-20002786\",\"user_id\":96,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-09 12:00:28', '2021-09-09 12:00:28'),
('3b6f0257-d53b-49b2-ac2c-c4a3b01e3cde', 'App\\Notifications\\OrderNotification', 'App\\User', 29, '{\"order_id\":51,\"order_code\":\"20210909-23351142\",\"user_id\":54,\"seller_id\":\"29\",\"status\":\"placed\"}', NULL, '2021-09-09 15:35:12', '2021-09-09 15:35:12'),
('3c42e4ec-dc3f-4c19-b6f9-4dca5e801085', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":27,\"order_code\":\"20210929-13100826\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-09-29 07:10:08', '2022-12-23 11:04:18'),
('3c4c7601-5370-4653-83d1-d76c519aff99', 'App\\Notifications\\OrderNotification', 'App\\User', 66, '{\"order_id\":25,\"order_code\":\"20210905-21264914\",\"user_id\":\"66\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', NULL, '2021-09-05 13:39:27', '2021-09-05 13:39:27'),
('3debaa8f-12db-4863-afe2-0ee03d7a1a88', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":43,\"order_code\":\"20210909-19574771\",\"user_id\":95,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-09 11:57:49', '2021-09-26 06:21:53'),
('3e2529f4-fbd2-4033-8b0b-492c0d3d9176', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":33,\"order_code\":\"20210907-15223233\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', NULL, '2021-09-07 07:31:35', '2021-09-07 07:31:35'),
('3e454260-bd1f-41d8-9c65-a0a011b05a1f', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":24,\"order_code\":\"20210929-13053113\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-09-29 07:05:31', '2022-12-23 11:04:18'),
('3fcadd8c-602b-4165-8cd6-d2badd52422c', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":15,\"order_code\":\"20210905-01343946\",\"user_id\":\"58\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', NULL, '2021-09-04 17:35:26', '2021-09-04 17:35:26'),
('4024c7f4-544e-4ac1-8bca-87ca955fe23e', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":65,\"order_code\":\"20211004-17092168\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-10-04 11:09:21', '2022-12-23 11:04:18'),
('4067e9b4-bb7d-493a-89cd-bea07805d981', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":35,\"order_code\":\"20210907-15290611\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', '2021-09-08 16:33:47', '2021-09-07 07:32:12', '2021-09-08 16:33:47'),
('409ab2f0-f12e-48f9-94e1-3bfcc56ce7a4', 'App\\Notifications\\OrderNotification', 'App\\User', 34, '{\"order_id\":10,\"order_code\":\"20210831-02222720\",\"user_id\":\"34\",\"seller_id\":\"46\",\"status\":\"paid\"}', '2021-08-31 01:25:57', '2021-08-31 01:24:53', '2021-08-31 01:25:57'),
('413aeb7f-256c-448e-9635-af4c1c11b57b', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":63,\"order_code\":\"20211004-12584128\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-10-04 06:58:41', '2021-10-04 09:49:09'),
('428683f9-6fe6-48f8-9909-2bcac497f7c5', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":21,\"order_code\":\"20210929-12580915\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 06:58:09', '2021-10-04 09:49:09'),
('436093a4-af35-47ae-95e4-97b6b3066d8d', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":25,\"order_code\":\"20210905-21264914\",\"user_id\":\"66\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', NULL, '2021-09-05 13:39:27', '2021-09-05 13:39:27'),
('437c4e43-8878-44df-84a4-89cc0a892a55', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":45,\"order_code\":\"20210909-20052138\",\"user_id\":15,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-09 12:05:22', '2021-09-09 12:05:22'),
('439a5a8d-e8df-4d6e-88b1-27413b6fc783', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":45,\"order_code\":\"20210909-20052138\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', '2021-09-26 06:21:53', '2021-09-09 12:25:07', '2021-09-26 06:21:53'),
('44089be5-7d4b-4b7a-8db2-958bc350265f', 'App\\Notifications\\OrderNotification', 'App\\User', 60, '{\"order_id\":17,\"order_code\":\"20210905-10244893\",\"user_id\":60,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-05 02:24:49', '2021-09-05 02:24:49'),
('44ea9308-e6ac-4fb8-9b17-0efaf500edd0', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":1,\"order_code\":\"20210817-03324491\",\"user_id\":\"10\",\"seller_id\":\"10\",\"status\":\"delivered\"}', '2021-09-26 06:21:53', '2021-08-16 19:35:14', '2021-09-26 06:21:53'),
('45aaaf18-4f77-4039-bc0f-cb34e07626ba', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":18,\"order_code\":\"20210905-12474445\",\"user_id\":61,\"seller_id\":\"21\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-05 04:47:45', '2021-09-26 06:21:53'),
('47bff14e-d36f-499c-bf4b-d2a7e4dac3f3', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":60,\"order_code\":\"20211004-11554673\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-10-04 05:55:46', '2021-10-04 09:49:09'),
('47e82a4f-770a-4eab-bf56-186f55e0b286', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":51,\"order_code\":\"20210930-18250531\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-09-30 12:25:05', '2022-12-23 11:04:18'),
('48292240-0fe7-4cc9-b257-f148e553465a', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":11,\"order_code\":\"20240203-01140726\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', NULL, '2024-02-02 19:14:09', '2024-02-02 19:14:09'),
('48487144-7958-4026-85c3-ee6c76feb586', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":12,\"order_code\":\"20210902-16482681\",\"user_id\":\"15\",\"seller_id\":\"29\",\"status\":\"paid\"}', '2021-09-08 16:33:47', '2021-09-04 16:03:03', '2021-09-08 16:33:47'),
('48c645fd-6c5f-4f4c-acee-cc6497f0916a', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":41,\"order_code\":\"20210929-16563010\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-09-29 10:56:30', '2022-12-23 11:04:18'),
('492ec635-bfbe-4f5a-abe3-d89c96c5be72', 'App\\Notifications\\OrderNotification', 'App\\User', 65, '{\"order_id\":24,\"order_code\":\"20210905-17042690\",\"user_id\":\"65\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', NULL, '2021-09-05 09:05:15', '2021-09-05 09:05:15'),
('4942d8b0-5637-4ab7-9221-754c26ae15d6', 'App\\Notifications\\OrderNotification', 'App\\User', 58, '{\"order_id\":15,\"order_code\":\"20210905-01343946\",\"user_id\":\"58\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', NULL, '2021-09-04 17:35:26', '2021-09-04 17:35:26'),
('497ef74a-66ad-4481-8708-83393bb4d847', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":35,\"order_code\":\"20210907-15290611\",\"user_id\":15,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-07 07:29:08', '2021-09-26 06:21:53'),
('4a75f623-8749-4ba5-8605-77a19ac9be4f', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":28,\"order_code\":\"20210929-15495772\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 09:49:57', '2021-10-04 09:49:09'),
('4b27ffb3-376d-49fe-b803-2da50808302e', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":9,\"order_code\":\"20221223-21152789\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', NULL, '2022-12-23 15:15:32', '2022-12-23 15:15:32'),
('4ca51cff-6a18-48d8-9415-6d02a4017489', 'App\\Notifications\\OrderNotification', 'App\\User', 61, '{\"order_id\":18,\"order_code\":\"20210905-12474445\",\"user_id\":61,\"seller_id\":\"21\",\"status\":\"placed\"}', '2021-09-05 04:48:06', '2021-09-05 04:47:45', '2021-09-05 04:48:06'),
('4d3ac1f3-8876-4d72-89dc-f35d37610e8c', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":60,\"order_code\":\"20211004-11554673\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-10-04 05:55:46', '2022-12-23 11:04:18'),
('4da5f0c8-d137-4295-95e3-53c710ff39c8', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":56,\"order_code\":\"20210911-20540532\",\"user_id\":111,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-11 12:54:07', '2021-09-11 12:54:07'),
('4f118b3a-5b4a-46fe-b3e6-766310d15ac3', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":74,\"order_code\":\"20211004-17182685\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-11-09 10:30:45', '2021-10-04 11:18:26', '2021-11-09 10:30:45'),
('4fba73ac-3798-4e2c-8191-509c1e81f154', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":12,\"order_code\":\"20210902-16482681\",\"user_id\":\"15\",\"seller_id\":\"29\",\"status\":\"on_the_way\"}', '2021-09-08 16:33:47', '2021-09-03 18:25:23', '2021-09-08 16:33:47'),
('50d96754-0f7b-441b-a8ed-1e177acab44c', 'App\\Notifications\\OrderNotification', 'App\\User', 10, '{\"order_id\":8,\"order_code\":\"20210831-01461684\",\"user_id\":10,\"seller_id\":\"10\",\"status\":\"placed\"}', NULL, '2021-08-30 17:46:17', '2021-08-30 17:46:17'),
('515ebd8d-384c-4180-800e-c1214ad4df35', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":8,\"order_code\":\"20210929-12443486\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 06:44:34', '2021-10-04 09:49:09'),
('52373537-28bf-4fce-bced-fb78e0eb06ab', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":34,\"order_code\":\"20210907-15255993\",\"user_id\":15,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-07 07:26:00', '2021-09-07 07:26:00'),
('532c943c-e0df-4af6-975b-f392d06a3551', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":24,\"order_code\":\"20210905-17042690\",\"user_id\":\"65\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', NULL, '2021-09-05 09:05:15', '2021-09-05 09:05:15'),
('5373f491-4844-43b8-a77d-7452885f8ab6', 'App\\Notifications\\OrderNotification', 'App\\User', 10, '{\"order_id\":2,\"order_code\":\"20210819-01462969\",\"user_id\":15,\"seller_id\":\"10\",\"status\":\"placed\"}', NULL, '2021-08-18 17:46:30', '2021-08-18 17:46:30'),
('53fc48e3-7442-4d1b-8c1f-1525e8db6994', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":19,\"order_code\":\"20210905-15105178\",\"user_id\":\"62\",\"seller_id\":\"16\",\"status\":\"cancelled\"}', '2021-09-26 06:21:53', '2021-09-05 07:20:28', '2021-09-26 06:21:53'),
('561d0c6d-a083-4c54-bf56-8cca00a074f4', 'App\\Notifications\\OrderNotification', 'App\\User', 140, '{\"order_id\":8,\"order_code\":\"20221105-13580272\",\"user_id\":140,\"seller_id\":9,\"status\":\"on_the_way\"}', NULL, '2022-11-05 08:02:50', '2022-11-05 08:02:50'),
('57206e55-2725-4dcb-ad44-033c9a24fcb1', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":39,\"order_code\":\"20210908-00280020\",\"user_id\":\"15\",\"seller_id\":\"29\",\"status\":\"cancelled\"}', '2021-09-26 06:21:53', '2021-09-08 14:18:21', '2021-09-26 06:21:53'),
('593d478d-ebf4-4292-96b9-e6b99c3588e5', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":48,\"order_code\":\"20210929-17000862\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-09-29 11:00:08', '2022-12-23 11:04:18'),
('5af249ba-3e29-413c-afea-8ad1cb7a6a0f', 'App\\Notifications\\OrderNotification', 'App\\User', 111, '{\"order_id\":56,\"order_code\":\"20210911-20540532\",\"user_id\":111,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-11 12:54:07', '2021-09-11 12:54:07'),
('5b240d08-9d98-42a3-8c2a-6b56393de4ce', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":16,\"order_code\":\"20210905-01434297\",\"user_id\":\"15\",\"seller_id\":\"18\",\"status\":\"cancelled\"}', NULL, '2021-09-12 04:37:34', '2021-09-12 04:37:34'),
('5be2a1d7-6533-4275-8c52-d5617f0f2362', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":47,\"order_code\":\"20210929-16594432\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-09-29 10:59:44', '2022-12-23 11:04:18'),
('5c2509d1-4ffa-437f-a6e9-b75030cdf1f1', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":26,\"order_code\":\"20210905-21414236\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"cancelled\"}', '2021-09-26 06:21:53', '2021-09-05 16:39:33', '2021-09-26 06:21:53'),
('5c9b96bf-e59b-4a60-8144-45f99d42bf91', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":27,\"order_code\":\"20210929-13100826\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 07:10:08', '2021-10-04 09:49:09'),
('5d1bfc6b-ac2f-4da4-a4e4-450ae3d358fb', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":39,\"order_code\":\"20210908-00280020\",\"user_id\":\"15\",\"seller_id\":\"29\",\"status\":\"cancelled\"}', '2021-09-08 16:33:47', '2021-09-08 14:18:21', '2021-09-08 16:33:47'),
('5f0ca1a9-2f17-49f9-9a2d-492b338f2852', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":45,\"order_code\":\"20210909-20052138\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', NULL, '2021-09-09 12:25:07', '2021-09-09 12:25:07'),
('5f3c05f5-0ae4-4e7d-a9d7-1f1e6f0d2059', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":17,\"order_code\":\"20210905-10244893\",\"user_id\":\"60\",\"seller_id\":\"16\",\"status\":\"on_the_way\"}', NULL, '2021-09-12 04:55:57', '2021-09-12 04:55:57'),
('60299ab8-78ae-4d28-812f-1b07901c9b07', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":53,\"order_code\":\"20211003-16402429\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-10-03 10:40:24', '2021-10-04 09:49:09'),
('604f64d9-7177-49da-975f-5250b49059e4', 'App\\Notifications\\OrderNotification', 'App\\User', 34, '{\"order_id\":6,\"order_code\":\"20210828-00145997\",\"user_id\":34,\"seller_id\":\"33\",\"status\":\"placed\"}', '2021-08-27 16:37:37', '2021-08-27 16:14:59', '2021-08-27 16:37:37'),
('61dadc39-0da7-436f-af59-69dc436f1494', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":69,\"order_code\":\"20211004-17144256\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-10-04 11:14:42', '2022-12-23 11:04:18'),
('61e33b7c-99fd-41ea-8c47-f00d78eaba29', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":16,\"order_code\":\"20210929-12530790\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:19', '2021-09-29 06:53:07', '2022-12-23 11:04:19'),
('624fe9ae-dc7e-4f0b-b722-545bf4d43d34', 'App\\Notifications\\OrderNotification', 'App\\User', 60, '{\"order_id\":17,\"order_code\":\"20210905-10244893\",\"user_id\":\"60\",\"seller_id\":\"16\",\"status\":\"on_the_way\"}', NULL, '2021-09-12 04:55:57', '2021-09-12 04:55:57'),
('62519e75-4b31-4405-9809-f182dc5b0077', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":67,\"order_code\":\"20211004-17133230\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-11-09 10:30:45', '2021-10-04 11:13:32', '2021-11-09 10:30:45'),
('63806726-ff3f-488a-b995-8606116dc3f9', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":16,\"order_code\":\"20210905-01434297\",\"user_id\":\"15\",\"seller_id\":\"18\",\"status\":\"confirmed\"}', '2021-09-26 06:21:53', '2021-09-04 17:44:25', '2021-09-26 06:21:53'),
('63b27554-de74-44a0-89b5-24f76d042d9c', 'App\\Notifications\\OrderNotification', 'App\\User', 29, '{\"order_id\":7,\"order_code\":\"20210831-01312739\",\"user_id\":\"34\",\"seller_id\":\"29\",\"status\":\"confirmed\"}', NULL, '2021-08-30 17:34:57', '2021-08-30 17:34:57'),
('63ef18af-a27c-414e-8388-56125c74f32d', 'App\\Notifications\\OrderNotification', 'App\\User', 46, '{\"order_id\":9,\"order_code\":\"20210831-02221552\",\"user_id\":34,\"seller_id\":\"46\",\"status\":\"placed\"}', NULL, '2021-08-30 18:22:16', '2021-08-30 18:22:16'),
('64118667-52b3-462a-bbc3-4f330a431293', 'App\\Notifications\\OrderNotification', 'App\\User', 29, '{\"order_id\":12,\"order_code\":\"20210902-16482681\",\"user_id\":\"15\",\"seller_id\":\"29\",\"status\":\"confirmed\"}', NULL, '2021-09-02 08:49:49', '2021-09-02 08:49:49'),
('6499e6d3-0571-4476-a8ce-5725d34dfe41', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":46,\"order_code\":\"20210909-20103121\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', NULL, '2021-09-09 12:24:16', '2021-09-09 12:24:16'),
('64a7ee4d-e5a2-432d-ae49-848c8afdf84b', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":46,\"order_code\":\"20210909-20103121\",\"user_id\":15,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-09 12:10:33', '2021-09-09 12:10:33');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('6511b3c0-e436-49ab-8071-0653d453b90b', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":28,\"order_code\":\"20210929-15495772\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-09-29 09:49:57', '2022-12-23 11:04:18'),
('6545bc0f-7487-4d20-9d35-62963a3fa64c', 'App\\Notifications\\OrderNotification', 'App\\User', 28, '{\"order_id\":3,\"order_code\":\"20210821-23370034\",\"user_id\":28,\"seller_id\":\"28\",\"status\":\"placed\"}', NULL, '2021-08-21 15:37:01', '2021-08-21 15:37:01'),
('655cd6ea-0f20-438a-90d8-d2a3cf85eab9', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":76,\"order_code\":\"20211004-17192481\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-11-09 10:30:45', '2021-10-04 11:19:24', '2021-11-09 10:30:45'),
('66afb22d-6079-4868-a4cd-fd7dea910445', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":4,\"order_code\":\"20210929-12391465\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 06:39:14', '2021-10-04 09:49:09'),
('670ed7ae-75c8-42bb-845b-b9735da4dbb5', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":36,\"order_code\":\"20210907-20023744\",\"user_id\":81,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-07 12:02:39', '2021-09-26 06:21:53'),
('67125434-9783-4d08-a2d0-8c6cb07e9d20', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":18,\"order_code\":\"20210905-12474445\",\"user_id\":\"61\",\"seller_id\":\"21\",\"status\":\"confirmed\"}', '2021-09-26 06:21:53', '2021-09-05 06:58:51', '2021-09-26 06:21:53'),
('676174b1-e3fe-4c37-9952-533e7b30721c', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":45,\"order_code\":\"20210929-16583899\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 10:58:38', '2021-10-04 09:49:09'),
('6774da9d-7f59-41a0-b3d8-efa9f962232e', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":7,\"order_code\":\"20210831-01312739\",\"user_id\":\"34\",\"seller_id\":\"29\",\"status\":\"confirmed\"}', '2021-09-26 06:21:53', '2021-08-30 17:34:57', '2021-09-26 06:21:53'),
('67a67860-6805-4161-bf6c-4d30fee57c55', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":51,\"order_code\":\"20210909-23351142\",\"user_id\":54,\"seller_id\":\"29\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-09 15:35:12', '2021-09-26 06:21:53'),
('67b15081-c2f5-4997-9d39-2433bc0dec82', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":1,\"order_code\":\"20210817-03324491\",\"user_id\":\"10\",\"seller_id\":\"10\",\"status\":\"confirmed\"}', '2021-09-26 06:21:53', '2021-08-16 19:34:46', '2021-09-26 06:21:53'),
('6819d9b8-b814-4260-b4ba-aff8a9868c11', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":38,\"order_code\":\"20210907-20124836\",\"user_id\":83,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-07 12:12:50', '2021-09-26 06:21:53'),
('68948bd2-51af-4f84-84e6-f45bc02caaa9', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":18,\"order_code\":\"20210929-12535356\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:19', '2021-09-29 06:53:53', '2022-12-23 11:04:19'),
('68eca2e3-a86b-4a83-b1d1-fcdefc241da6', 'App\\Notifications\\OrderNotification', 'App\\User', 106, '{\"order_id\":52,\"order_code\":\"20210910-22192671\",\"user_id\":106,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-10 14:19:29', '2021-09-10 14:19:29'),
('69238652-8150-4db3-a23b-05cc41203190', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":21,\"order_code\":\"20210905-15174581\",\"user_id\":\"63\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', '2021-09-26 06:21:53', '2021-09-05 07:22:38', '2021-09-26 06:21:53'),
('69483f52-7dfa-44a2-894c-b2ee3592f78f', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":52,\"order_code\":\"20210910-22192671\",\"user_id\":106,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-10 14:19:29', '2021-09-26 06:21:53'),
('69dc12ec-59a4-4f01-b99c-9de3bb5f4518', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":3,\"order_code\":\"20210929-12390142\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:19', '2021-09-29 06:39:01', '2022-12-23 11:04:19'),
('6a077321-01e5-4fee-a3e0-cb63d2b5e929', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":39,\"order_code\":\"20210908-00280020\",\"user_id\":\"15\",\"seller_id\":\"29\",\"status\":\"picked_up\"}', '2021-09-08 16:33:47', '2021-09-08 10:27:11', '2021-09-08 16:33:47'),
('6a54d6b0-dde0-493c-b6ed-bb8d2c833d24', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":23,\"order_code\":\"20210905-17010782\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"cancelled\"}', '2021-09-26 06:21:53', '2021-09-05 13:38:58', '2021-09-26 06:21:53'),
('6aecb7e9-52a1-4342-821b-945958f5f0fc', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":46,\"order_code\":\"20210909-20103121\",\"user_id\":15,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-09 12:10:33', '2021-09-09 12:10:33'),
('6bf62b26-5cd4-4970-b55b-d9a574d8417d', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":16,\"order_code\":\"20210905-01434297\",\"user_id\":\"15\",\"seller_id\":\"18\",\"status\":\"cancelled\"}', '2021-09-26 06:21:53', '2021-09-12 04:37:34', '2021-09-26 06:21:53'),
('6d158a4f-4d72-4acf-b9a7-72ab38b7f42d', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":34,\"order_code\":\"20210907-15255993\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"on_the_way\"}', '2021-09-26 06:21:53', '2021-09-12 04:22:32', '2021-09-26 06:21:53'),
('6df876fd-f8eb-46cd-a409-0fdcacbdd974', 'App\\Notifications\\OrderNotification', 'App\\User', 29, '{\"order_id\":39,\"order_code\":\"20210908-00280020\",\"user_id\":\"15\",\"seller_id\":\"29\",\"status\":\"picked_up\"}', NULL, '2021-09-08 10:27:11', '2021-09-08 10:27:11'),
('6e9839eb-b5f1-4543-a983-89ce83644a68', 'App\\Notifications\\OrderNotification', 'App\\User', 18, '{\"order_id\":16,\"order_code\":\"20210905-01434297\",\"user_id\":\"15\",\"seller_id\":\"18\",\"status\":\"confirmed\"}', NULL, '2021-09-04 17:44:25', '2021-09-04 17:44:25'),
('6eb60cee-1859-4e52-8cc4-92a520bd4fef', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":6,\"order_code\":\"20210828-00145997\",\"user_id\":34,\"seller_id\":\"33\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-08-27 16:14:59', '2021-09-26 06:21:53'),
('6f414366-bc84-4b60-82ec-d404419a823e', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":17,\"order_code\":\"20210929-12533413\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:19', '2021-09-29 06:53:34', '2022-12-23 11:04:19'),
('6f5707c4-7294-4830-b0f0-9501522be4e5', 'App\\Notifications\\OrderNotification', 'App\\User', 34, '{\"order_id\":7,\"order_code\":\"20210831-01312739\",\"user_id\":\"34\",\"seller_id\":\"29\",\"status\":\"picked_up\"}', '2021-08-30 17:35:35', '2021-08-30 17:35:28', '2021-08-30 17:35:35'),
('706c4e9d-430c-48ed-996b-d788c38023b2', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":12,\"order_code\":\"20210902-16482681\",\"user_id\":\"15\",\"seller_id\":\"29\",\"status\":\"on_the_way\"}', '2021-09-26 06:21:53', '2021-09-03 18:25:23', '2021-09-26 06:21:53'),
('719dec13-ed74-462c-9539-c54660994176', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":12,\"order_code\":\"20210902-16482681\",\"user_id\":\"15\",\"seller_id\":\"29\",\"status\":\"delivered\"}', '2021-09-26 06:21:53', '2021-09-04 16:02:55', '2021-09-26 06:21:53'),
('71d48987-c4fc-4779-a569-f803a5a2964a', 'App\\Notifications\\OrderNotification', 'App\\User', 61, '{\"order_id\":18,\"order_code\":\"20210905-12474445\",\"user_id\":\"61\",\"seller_id\":\"21\",\"status\":\"confirmed\"}', '2021-09-05 19:11:08', '2021-09-05 06:58:51', '2021-09-05 19:11:08'),
('71e27905-bb25-4c40-9bc7-27cddee988d5', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":7,\"order_code\":\"20210831-01312739\",\"user_id\":\"34\",\"seller_id\":\"29\",\"status\":\"picked_up\"}', '2021-09-26 06:21:53', '2021-08-30 17:35:28', '2021-09-26 06:21:53'),
('735eba73-b5c7-4ca3-a9eb-d80bec66e34a', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":41,\"order_code\":\"20210929-16563010\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 10:56:30', '2021-10-04 09:49:09'),
('73cd8cd4-fb12-492c-b838-36c3a989730d', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":42,\"order_code\":\"20210929-16563912\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-09-29 10:56:39', '2022-12-23 11:04:18'),
('745c61c4-9d96-41b0-88ae-8c01f2e30429', 'App\\Notifications\\OrderNotification', 'App\\User', 29, '{\"order_id\":7,\"order_code\":\"20210831-01312739\",\"user_id\":34,\"seller_id\":\"29\",\"status\":\"placed\"}', NULL, '2021-08-30 17:31:27', '2021-08-30 17:31:27'),
('74f3ec36-9b8a-4109-9405-62008c078c4f', 'App\\Notifications\\OrderNotification', 'App\\User', 71, '{\"order_id\":30,\"order_code\":\"20210906-01364551\",\"user_id\":71,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-05 17:36:47', '2021-09-05 17:36:47'),
('74f6f9b8-5626-49c1-8ae6-316a653b9950', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":39,\"order_code\":\"20210908-00280020\",\"user_id\":\"15\",\"seller_id\":\"29\",\"status\":\"confirmed\"}', '2021-09-08 16:33:47', '2021-09-08 10:26:50', '2021-09-08 16:33:47'),
('756bbd91-b5d6-4fef-8e9f-0ba550f48610', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":42,\"order_code\":\"20210929-16563912\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 10:56:39', '2021-10-04 09:49:09'),
('77c88a99-fdf4-4c8d-a70d-a5ee352b3132', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":3,\"order_code\":\"20221029-17400817\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2022-10-29 11:40:13', '2022-12-23 11:04:18'),
('79092617-f307-4f26-a4dd-7a1943722f99', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":41,\"order_code\":\"20210909-19520737\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', NULL, '2021-09-09 12:27:37', '2021-09-09 12:27:37'),
('79624336-bce3-4deb-9b10-939cda8c005c', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":10,\"order_code\":\"20210831-02222720\",\"user_id\":\"34\",\"seller_id\":\"46\",\"status\":\"delivered\"}', '2021-09-26 06:21:53', '2021-08-31 01:24:51', '2021-09-26 06:21:53'),
('79809b01-68fc-4864-a628-e0182994fe0f', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":27,\"order_code\":\"20210905-21534629\",\"user_id\":\"15\",\"seller_id\":\"29\",\"status\":\"cancelled\"}', '2021-09-08 16:33:47', '2021-09-05 16:39:58', '2021-09-08 16:33:47'),
('7a742496-6b34-4d6c-9246-09c2fcdee4de', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":45,\"order_code\":\"20210909-20052138\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"on_the_way\"}', NULL, '2021-09-12 04:31:08', '2021-09-12 04:31:08'),
('7aa4d5ac-e47e-4a12-91ea-adde18652aed', 'App\\Notifications\\OrderNotification', 'App\\User', 140, '{\"order_id\":8,\"order_code\":\"20221105-13580272\",\"user_id\":140,\"seller_id\":9,\"status\":\"delivered\"}', NULL, '2022-11-05 08:05:19', '2022-11-05 08:05:19'),
('7d3c58c9-a375-4eaa-a9a5-0111b9108624', 'App\\Notifications\\OrderNotification', 'App\\User', 28, '{\"order_id\":3,\"order_code\":\"20210821-23370034\",\"user_id\":\"28\",\"seller_id\":\"28\",\"status\":\"paid\"}', NULL, '2021-08-21 15:39:50', '2021-08-21 15:39:50'),
('7d627bc2-98a5-4344-af76-742f175962cf', 'App\\Notifications\\OrderNotification', 'App\\User', 21, '{\"order_id\":18,\"order_code\":\"20210905-12474445\",\"user_id\":61,\"seller_id\":\"21\",\"status\":\"placed\"}', NULL, '2021-09-05 04:47:45', '2021-09-05 04:47:45'),
('7dd213ca-b38f-4c9c-a2d4-67bef048c245', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":50,\"order_code\":\"20210929-18035187\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 12:03:51', '2021-10-04 09:49:09'),
('7e1d7e07-b5a6-49e1-90bb-8a9dae684d43', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":20,\"order_code\":\"20210929-12575456\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:19', '2021-09-29 06:57:54', '2022-12-23 11:04:19'),
('7e34387b-5fdc-432d-b573-9d999d71c683', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":50,\"order_code\":\"20210909-20212478\",\"user_id\":100,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-09 12:21:29', '2021-09-09 12:21:29'),
('7e951ad0-0d87-4a48-8a29-c8cf31fe65c0', 'App\\Notifications\\OrderNotification', 'App\\User', 99, '{\"order_id\":49,\"order_code\":\"20210909-20184469\",\"user_id\":99,\"seller_id\":\"31\",\"status\":\"placed\"}', NULL, '2021-09-09 12:18:45', '2021-09-09 12:18:45'),
('7f028382-fdfa-4990-a2a8-d76db2b2503f', 'App\\Notifications\\OrderNotification', 'App\\User', 95, '{\"order_id\":43,\"order_code\":\"20210909-19574771\",\"user_id\":95,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-09 11:57:49', '2021-09-09 11:57:49'),
('7f3df375-4cf4-4197-92c0-ecc7b3164bed', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":63,\"order_code\":\"20211004-12584128\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-10-04 06:58:41', '2022-12-23 11:04:18'),
('7f770a22-e460-407d-ac76-5c9916d1c5d7', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":48,\"order_code\":\"20210909-20154162\",\"user_id\":98,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-09 12:15:42', '2021-09-26 06:21:53'),
('7f8bc5ef-11e5-4be8-85f4-300f70d55162', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":37,\"order_code\":\"20210907-20093288\",\"user_id\":82,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-07 12:09:34', '2021-09-07 12:09:34'),
('8010f9d1-356a-40f7-8cbd-fbd8da112964', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":38,\"order_code\":\"20210929-16540091\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 10:54:00', '2021-10-04 09:49:09'),
('80919df3-fc33-44b5-b370-213792fa4fe5', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":34,\"order_code\":\"20210907-15255993\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"on_the_way\"}', NULL, '2021-09-12 04:22:32', '2021-09-12 04:22:32'),
('8158910c-302b-46ed-aa53-6b4133f4bfaf', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":54,\"order_code\":\"20210911-20471091\",\"user_id\":109,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-11 12:47:12', '2021-09-11 12:47:12'),
('81633d2d-b21d-43a2-8c96-674d2f672b22', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":77,\"order_code\":\"20211004-17201433\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-10-04 11:20:14', '2022-12-23 11:04:18'),
('81f5b918-cbd3-4927-9a2a-d1abb3388aca', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":52,\"order_code\":\"20210910-22192671\",\"user_id\":106,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-10 14:19:29', '2021-09-10 14:19:29'),
('82019c8a-ce1a-4d78-a40a-c3580660c96f', 'App\\Notifications\\OrderNotification', 'App\\User', 83, '{\"order_id\":38,\"order_code\":\"20210907-20124836\",\"user_id\":83,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-07 12:12:50', '2021-09-07 12:12:50'),
('833a6715-7dc9-482e-b3d2-131103080908', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":16,\"order_code\":\"20210905-01434297\",\"user_id\":15,\"seller_id\":\"18\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-04 17:43:43', '2021-09-26 06:21:53'),
('8442a6b8-3ebb-4b8d-a96f-54a00335f352', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":30,\"order_code\":\"20210929-16351821\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 10:35:18', '2021-10-04 09:49:09'),
('84c3185e-545f-4d0d-8ae2-4102ead2c036', 'App\\Notifications\\OrderNotification', 'App\\User', 28, '{\"order_id\":3,\"order_code\":\"20210821-23370034\",\"user_id\":\"28\",\"seller_id\":\"28\",\"status\":\"confirmed\"}', NULL, '2021-08-21 15:39:22', '2021-08-21 15:39:22'),
('85864fa6-69e9-4b31-bdcb-2918e1c24e71', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":12,\"order_code\":\"20210902-16482681\",\"user_id\":\"15\",\"seller_id\":\"29\",\"status\":\"delivered\"}', '2021-09-08 16:33:47', '2021-09-04 16:02:55', '2021-09-08 16:33:47'),
('861a8300-c153-4d9b-b4b3-d853a382bf23', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":31,\"order_code\":\"20210907-15161895\",\"user_id\":79,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-07 07:16:20', '2021-09-26 06:21:53'),
('862b1af8-95e1-43fe-8228-b909189cae3b', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":3,\"order_code\":\"20210821-23370034\",\"user_id\":\"28\",\"seller_id\":\"28\",\"status\":\"on_delivery\"}', '2021-09-26 06:21:53', '2021-08-21 15:39:40', '2021-09-26 06:21:53'),
('870ece6a-383f-40bb-b71c-032ec10a8bc9', 'App\\Notifications\\OrderNotification', 'App\\User', 29, '{\"order_id\":39,\"order_code\":\"20210908-00280020\",\"user_id\":\"15\",\"seller_id\":\"29\",\"status\":\"confirmed\"}', NULL, '2021-09-08 10:26:50', '2021-09-08 10:26:50'),
('87ecba6e-be52-4eab-9e57-6f29940f9af6', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":16,\"order_code\":\"20210905-01434297\",\"user_id\":\"15\",\"seller_id\":\"18\",\"status\":\"confirmed\"}', '2021-09-08 16:33:47', '2021-09-04 17:44:25', '2021-09-08 16:33:47'),
('87f1eb5f-3697-41e8-b969-571794405a8a', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":20,\"order_code\":\"20210905-15153672\",\"user_id\":\"63\",\"seller_id\":\"16\",\"status\":\"cancelled\"}', NULL, '2021-09-05 07:16:44', '2021-09-05 07:16:44'),
('886f8a6b-ccb6-483e-b5a1-50ed11efe507', 'App\\Notifications\\OrderNotification', 'App\\User', 57, '{\"order_id\":14,\"order_code\":\"20210904-23505181\",\"user_id\":57,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-04 15:50:51', '2021-09-04 15:50:51'),
('887ca76d-ebe9-4522-ad19-dfbfd003363a', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":14,\"order_code\":\"20210904-23505181\",\"user_id\":\"57\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', '2021-09-26 06:21:53', '2021-09-04 16:02:10', '2021-09-26 06:21:53'),
('896bf079-4e56-40a9-bcce-e4d80b406a44', 'App\\Notifications\\OrderNotification', 'App\\User', 10, '{\"order_id\":1,\"order_code\":\"20210817-03324491\",\"user_id\":\"10\",\"seller_id\":\"10\",\"status\":\"paid\"}', NULL, '2021-08-16 19:48:20', '2021-08-16 19:48:20'),
('898ee18e-8efb-4e63-9687-18bef493fbbd', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":31,\"order_code\":\"20210929-16361878\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 10:36:18', '2021-10-04 09:49:09'),
('89fccb85-6971-41fd-bc2e-95fdb43ff8ad', 'App\\Notifications\\OrderNotification', 'App\\User', 32, '{\"order_id\":4,\"order_code\":\"20210824-02553769\",\"user_id\":32,\"seller_id\":\"32\",\"status\":\"placed\"}', '2021-08-23 18:59:59', '2021-08-23 18:55:38', '2021-08-23 18:59:59'),
('8a143dbb-88d4-403b-b68b-b710e363fd65', 'App\\Notifications\\OrderNotification', 'App\\User', 21, '{\"order_id\":18,\"order_code\":\"20210905-12474445\",\"user_id\":\"61\",\"seller_id\":\"21\",\"status\":\"confirmed\"}', NULL, '2021-09-05 06:58:51', '2021-09-05 06:58:51'),
('8a1d1e7b-6f6c-4d12-85cc-da39505f7411', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":56,\"order_code\":\"20210911-20540532\",\"user_id\":111,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-11 12:54:07', '2021-09-26 06:21:53'),
('8a2c461a-d25d-421c-aead-bfafd4942f15', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":1,\"order_code\":\"20220217-15130866\",\"user_id\":127,\"seller_id\":9,\"status\":\"paid\"}', NULL, '2022-02-20 06:06:42', '2022-02-20 06:06:42'),
('8a56205d-a52a-40ae-b520-d7cc69366799', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":23,\"order_code\":\"20210905-17010782\",\"user_id\":15,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-08 16:33:47', '2021-09-05 09:01:07', '2021-09-08 16:33:47'),
('8b02160a-005f-4cbc-a231-04bd41188746', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":17,\"order_code\":\"20210905-10244893\",\"user_id\":\"60\",\"seller_id\":\"16\",\"status\":\"on_the_way\"}', '2021-09-26 06:21:53', '2021-09-12 04:55:57', '2021-09-26 06:21:53'),
('8cdd0c5e-7ab8-4090-a402-bec4f573ef8e', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":47,\"order_code\":\"20210929-16594432\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 10:59:44', '2021-10-04 09:49:09'),
('8d3aa2cc-5f89-4cce-b689-712babe20448', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":32,\"order_code\":\"20210907-15185594\",\"user_id\":80,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-07 07:18:56', '2021-09-26 06:21:53'),
('8d7f760f-0e18-43cc-8a60-b0c3a158edd8', 'App\\Notifications\\OrderNotification', 'App\\User', 62, '{\"order_id\":22,\"order_code\":\"20210905-15212796\",\"user_id\":62,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-05 07:21:27', '2021-09-05 07:21:27'),
('8dc3e3ff-9143-42f6-9586-8a123683fe58', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":61,\"order_code\":\"20211004-11562041\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-10-04 05:56:20', '2022-12-23 11:04:18'),
('8e45e0ad-134b-4c08-bedc-05c9eefd9229', 'App\\Notifications\\OrderNotification', 'App\\User', 60, '{\"order_id\":17,\"order_code\":\"20210905-10244893\",\"user_id\":\"60\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', NULL, '2021-09-05 06:58:11', '2021-09-05 06:58:11'),
('8eb0fb32-8e1d-41ea-a030-9872b6dc9e85', 'App\\Notifications\\OrderNotification', 'App\\User', 70, '{\"order_id\":29,\"order_code\":\"20210906-01320770\",\"user_id\":70,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-05 17:32:08', '2021-09-05 17:32:08'),
('8f0a6800-0a36-4509-bb1c-69cf96d28590', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":20,\"order_code\":\"20210905-15153672\",\"user_id\":\"63\",\"seller_id\":\"16\",\"status\":\"cancelled\"}', '2021-09-26 06:21:53', '2021-09-05 07:16:44', '2021-09-26 06:21:53'),
('8f5080d6-7674-4b63-9d13-c353161771f0', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":7,\"order_code\":\"20210831-01312739\",\"user_id\":34,\"seller_id\":\"29\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-08-30 17:31:27', '2021-09-26 06:21:53'),
('8f8673c5-5262-4639-8dcd-4eae8ca636fc', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":46,\"order_code\":\"20210909-20103121\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', NULL, '2021-09-09 12:24:16', '2021-09-09 12:24:16'),
('8f86c730-b330-4165-bf62-8c8af5afa8df', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":42,\"order_code\":\"20210909-19545997\",\"user_id\":15,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-09 11:55:00', '2021-09-09 11:55:00'),
('8f87f8dc-bddb-410e-b67a-6b8dc7b1d4e5', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":35,\"order_code\":\"20210907-15290611\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"on_the_way\"}', NULL, '2021-09-12 04:50:14', '2021-09-12 04:50:14'),
('8f8ad797-6e8d-4103-b291-6b8958bbcb21', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":38,\"order_code\":\"20210907-20124836\",\"user_id\":83,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-07 12:12:50', '2021-09-07 12:12:50'),
('905fda48-3b54-4dfe-9376-4ca7357d343c', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":13,\"order_code\":\"20210903-22521727\",\"user_id\":54,\"seller_id\":\"54\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-03 14:52:18', '2021-09-26 06:21:53'),
('907a17ba-5a3b-4765-8392-605e66f74f49', 'App\\Notifications\\OrderNotification', 'App\\User', 18, '{\"order_id\":16,\"order_code\":\"20210905-01434297\",\"user_id\":15,\"seller_id\":\"18\",\"status\":\"placed\"}', NULL, '2021-09-04 17:43:43', '2021-09-04 17:43:43'),
('90c14ef1-efc6-4499-9746-ba04dd488777', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":15,\"order_code\":\"20210905-01343946\",\"user_id\":\"58\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', '2021-09-26 06:21:53', '2021-09-04 17:35:26', '2021-09-26 06:21:53'),
('914b8cf9-60cb-4de4-8a9b-67437cd9d27b', 'App\\Notifications\\OrderNotification', 'App\\User', 29, '{\"order_id\":27,\"order_code\":\"20210905-21534629\",\"user_id\":15,\"seller_id\":\"29\",\"status\":\"placed\"}', NULL, '2021-09-05 13:53:46', '2021-09-05 13:53:46'),
('91e04d61-3e1c-47a2-b660-0b90b5b0106e', 'App\\Notifications\\OrderNotification', 'App\\User', 46, '{\"order_id\":10,\"order_code\":\"20210831-02222720\",\"user_id\":\"34\",\"seller_id\":\"46\",\"status\":\"delivered\"}', NULL, '2021-08-31 01:24:51', '2021-08-31 01:24:51'),
('922d1fb8-4bc4-457c-bdca-33b17b37d021', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":17,\"order_code\":\"20210905-10244893\",\"user_id\":60,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-05 02:24:49', '2021-09-05 02:24:49'),
('92736b7d-f4ba-4e42-971c-941a1ee2baee', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":41,\"order_code\":\"20210909-19520737\",\"user_id\":15,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-09 11:52:09', '2021-09-26 06:21:53'),
('92eb9ab2-d415-4aed-a669-1ed699e09d19', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":30,\"order_code\":\"20210906-01364551\",\"user_id\":71,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-05 17:36:47', '2021-09-26 06:21:53'),
('930bd274-85b2-4e3f-bfc2-96f7af066b2a', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":20,\"order_code\":\"20210929-12575456\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 06:57:54', '2021-10-04 09:49:09'),
('93c00ede-e905-417e-8c5a-ef9c5c2e8a58', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":32,\"order_code\":\"20210907-15185594\",\"user_id\":80,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-07 07:18:56', '2021-09-07 07:18:56'),
('9475b2ee-97c8-49c0-810a-0d54576d3d23', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":45,\"order_code\":\"20210909-20052138\",\"user_id\":15,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-09 12:05:22', '2021-09-09 12:05:22'),
('95591db9-3cb0-4037-8026-ae4df15fa5a3', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":32,\"order_code\":\"20210929-16364685\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 10:36:46', '2021-10-04 09:49:09'),
('96157a9a-a5c4-48eb-ad1e-0ec8571f95e8', 'App\\Notifications\\OrderNotification', 'App\\User', 29, '{\"order_id\":12,\"order_code\":\"20210902-16482681\",\"user_id\":\"15\",\"seller_id\":\"29\",\"status\":\"delivered\"}', NULL, '2021-09-04 16:02:55', '2021-09-04 16:02:55'),
('9628f7c4-3022-4f8c-9cc1-a54d06ab2393', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":35,\"order_code\":\"20210907-15290611\",\"user_id\":15,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-07 07:29:08', '2021-09-07 07:29:08'),
('96a9a3c5-5699-4a0a-8cab-683c4651c432', 'App\\Notifications\\OrderNotification', 'App\\User', 28, '{\"order_id\":3,\"order_code\":\"20210821-23370034\",\"user_id\":\"28\",\"seller_id\":\"28\",\"status\":\"on_delivery\"}', NULL, '2021-08-21 15:39:40', '2021-08-21 15:39:40'),
('97257751-4a3b-4da9-9c40-ab7752e54e29', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":41,\"order_code\":\"20210909-19520737\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"on_the_way\"}', NULL, '2021-09-12 04:26:18', '2021-09-12 04:26:18'),
('981ceff5-7cdf-402b-8256-e923388c7ca0', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":71,\"order_code\":\"20211004-17154966\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-10-04 11:15:49', '2022-12-23 11:04:18'),
('9865b3fa-bc6b-4e51-b5a9-73d285a717e7', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":40,\"order_code\":\"20210929-16544710\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 10:54:48', '2021-10-04 09:49:09'),
('98da7383-617a-4b10-9c9d-d9521e8c6702', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":45,\"order_code\":\"20210909-20052138\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"on_the_way\"}', NULL, '2021-09-12 04:31:08', '2021-09-12 04:31:08'),
('98fc63e1-3de3-4e5f-b66c-db5c6fe5564a', 'App\\Notifications\\OrderNotification', 'App\\User', 111, '{\"order_id\":57,\"order_code\":\"20210911-20543732\",\"user_id\":111,\"seller_id\":\"43\",\"status\":\"placed\"}', NULL, '2021-09-11 12:54:38', '2021-09-11 12:54:38'),
('9908aabc-e207-4cea-8ff9-ed8bdf87c36f', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":35,\"order_code\":\"20210907-15290611\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"on_the_way\"}', NULL, '2021-09-12 04:50:14', '2021-09-12 04:50:14'),
('9972ddce-74c6-4dd1-bd06-0cabe1fd44e6', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":9,\"order_code\":\"20210929-12490449\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 06:49:05', '2021-10-04 09:49:09'),
('9a0e2fdd-3f0e-432c-93ff-a9ce5a7afe8b', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":1,\"order_code\":\"20210928-18262989\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-28 12:26:29', '2021-10-04 09:49:09'),
('9a459fe1-fb1e-4677-8aa7-3e18d458eb8c', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":33,\"order_code\":\"20210907-15223233\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"on_the_way\"}', NULL, '2021-09-12 04:27:38', '2021-09-12 04:27:38'),
('9a4a810e-4153-46b9-bb73-c9e50a0e2a97', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":62,\"order_code\":\"20211004-11564175\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-10-04 05:56:41', '2022-12-23 11:04:18'),
('9a9a470f-6889-47fd-b532-b7df18952ec0', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":41,\"order_code\":\"20210909-19520737\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"on_the_way\"}', '2021-09-26 06:21:53', '2021-09-12 04:26:18', '2021-09-26 06:21:53'),
('9b797087-1380-4a37-b86a-2038495c4470', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":41,\"order_code\":\"20210909-19520737\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"on_the_way\"}', NULL, '2021-09-12 04:26:18', '2021-09-12 04:26:18'),
('9bdd715d-71e4-4004-ac02-a582ba61d25d', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":1,\"order_code\":\"20210817-03324491\",\"user_id\":\"10\",\"seller_id\":\"10\",\"status\":\"delivered\"}', '2021-09-26 06:21:53', '2021-08-16 19:48:23', '2021-09-26 06:21:53'),
('9c1ed6dd-80eb-4f59-8b43-a14737be2532', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":39,\"order_code\":\"20210929-16543367\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-09-29 10:54:34', '2022-12-23 11:04:18'),
('9c883bc6-3d2e-4be0-981e-f9ebe91ae79a', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":7,\"order_code\":\"20210929-12433333\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:19', '2021-09-29 06:43:33', '2022-12-23 11:04:19'),
('9ccaf479-6973-4bc8-bb8b-518432cfe992', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":3,\"order_code\":\"20210821-23370034\",\"user_id\":\"28\",\"seller_id\":\"28\",\"status\":\"delivered\"}', '2021-09-26 06:21:53', '2021-08-21 15:39:59', '2021-09-26 06:21:53'),
('9e4dbbc8-82f9-491b-85f4-d8ed1a43d716', 'App\\Notifications\\OrderNotification', 'App\\User', 109, '{\"order_id\":54,\"order_code\":\"20210911-20471091\",\"user_id\":109,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-11 12:47:12', '2021-09-11 12:47:12'),
('9f41bdee-53e7-437b-971a-9162d19ed6c5', 'App\\Notifications\\OrderNotification', 'App\\User', 63, '{\"order_id\":21,\"order_code\":\"20210905-15174581\",\"user_id\":\"63\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', NULL, '2021-09-05 07:22:38', '2021-09-05 07:22:38'),
('9f5539e3-6e60-4dca-b5be-ee396c8c1088', 'App\\Notifications\\OrderNotification', 'App\\User', 79, '{\"order_id\":31,\"order_code\":\"20210907-15161895\",\"user_id\":79,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-07 07:16:20', '2021-09-07 07:16:20'),
('9fb3ed6d-5aa2-4fdb-8159-0cc64b8a25fd', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":2,\"order_code\":\"20210819-01462969\",\"user_id\":15,\"seller_id\":\"10\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-08-18 17:46:30', '2021-09-26 06:21:53'),
('a0119f97-8b86-4afa-bf53-936b3e00d25d', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":42,\"order_code\":\"20210909-19545997\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', NULL, '2021-09-09 12:26:58', '2021-09-09 12:26:58'),
('a0a5a3bc-5da7-4b0f-b162-92b12d1f9bda', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":7,\"order_code\":\"20210929-12433333\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 06:43:33', '2021-10-04 09:49:09'),
('a0ed1da8-c565-4bec-8db1-7faa5bb3884f', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":8,\"order_code\":\"20210929-12443486\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:19', '2021-09-29 06:44:34', '2022-12-23 11:04:19'),
('a1c63d33-42a4-4cb1-88de-77668bebbb1b', 'App\\Notifications\\OrderNotification', 'App\\User', 29, '{\"order_id\":12,\"order_code\":\"20210902-16482681\",\"user_id\":\"15\",\"seller_id\":\"29\",\"status\":\"on_the_way\"}', NULL, '2021-09-03 18:25:23', '2021-09-03 18:25:23'),
('a1dbab4c-088c-4de8-b68d-cdd0b11e2ce8', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":23,\"order_code\":\"20210905-17010782\",\"user_id\":15,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-05 09:01:07', '2021-09-05 09:01:07'),
('a3491e8f-b47e-45e8-9377-98bc4c345a62', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":1,\"order_code\":\"20210817-03324491\",\"user_id\":\"10\",\"seller_id\":\"10\",\"status\":\"paid\"}', '2021-09-26 06:21:53', '2021-08-16 19:48:20', '2021-09-26 06:21:53'),
('a34ad478-ce8a-4e82-9503-8a2f3085be15', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":28,\"order_code\":\"20210906-00464725\",\"user_id\":15,\"seller_id\":\"31\",\"status\":\"placed\"}', '2021-09-08 16:33:47', '2021-09-05 16:46:48', '2021-09-08 16:33:47'),
('a3be816e-9bbf-455f-bd1c-aa6afa677187', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":9,\"order_code\":\"20221223-21152789\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', NULL, '2022-12-23 15:15:32', '2022-12-23 15:15:32'),
('a3cc3a5a-df84-46c3-8247-fa9e386ea0fa', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":19,\"order_code\":\"20210905-15105178\",\"user_id\":62,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-05 07:10:52', '2021-09-26 06:21:53'),
('a3d11ed2-5ace-4bf9-a457-083490b2d11b', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":1,\"order_code\":\"20210817-03324491\",\"user_id\":\"10\",\"seller_id\":\"10\",\"status\":\"pending\"}', '2021-09-26 06:21:53', '2021-08-16 19:35:32', '2021-09-26 06:21:53'),
('a42b0e77-60a5-4536-9ba6-b7db6d4e5ab5', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":64,\"order_code\":\"20211004-17064155\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-11-09 10:30:45', '2021-10-04 11:06:41', '2021-11-09 10:30:45'),
('a510f07a-fa3b-4489-9d70-42d1fc9fc550', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":75,\"order_code\":\"20211004-17185173\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-11-09 10:30:45', '2021-10-04 11:18:51', '2021-11-09 10:30:45'),
('a55f8942-a660-448e-8eb2-5e451f7e1de5', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":12,\"order_code\":\"20210902-16482681\",\"user_id\":15,\"seller_id\":\"29\",\"status\":\"placed\"}', '2021-09-08 16:33:47', '2021-09-02 08:48:26', '2021-09-08 16:33:47'),
('a60d7d1d-64c9-4e49-8b86-f432817a7faf', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":6,\"order_code\":\"20210929-12425671\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 06:42:56', '2021-10-04 09:49:09'),
('a6596699-84c7-4245-8a65-41be69699a13', 'App\\Notifications\\OrderNotification', 'App\\User', 46, '{\"order_id\":10,\"order_code\":\"20210831-02222720\",\"user_id\":\"34\",\"seller_id\":\"46\",\"status\":\"paid\"}', NULL, '2021-08-31 01:24:53', '2021-08-31 01:24:53'),
('a6aa7f74-c060-45b5-b4ae-ca55ead28362', 'App\\Notifications\\OrderNotification', 'App\\User', 82, '{\"order_id\":37,\"order_code\":\"20210907-20093288\",\"user_id\":82,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-07 12:09:34', '2021-09-07 12:09:34'),
('a723e545-f1bf-475a-920f-09ffba20c7ac', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":25,\"order_code\":\"20210905-21264914\",\"user_id\":66,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-05 13:26:50', '2021-09-26 06:21:53'),
('a7928913-eb2d-4bd2-a8fb-814c6e1fe5cd', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":2,\"order_code\":\"20210929-12381167\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:19', '2021-09-29 06:38:11', '2022-12-23 11:04:19'),
('a83e654b-5543-409f-bdfd-746bb3809c70', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":1,\"order_code\":\"20220217-15130866\",\"user_id\":127,\"seller_id\":\"9\",\"status\":\"placed\"}', NULL, '2022-02-17 09:13:09', '2022-02-17 09:13:09'),
('a85fecba-0c7a-4a17-9ad6-700aaa485212', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":61,\"order_code\":\"20211004-11562041\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-10-04 05:56:20', '2021-10-04 09:49:09'),
('a99cd09e-1e49-49d8-8b26-529a815fba81', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":28,\"order_code\":\"20210906-00464725\",\"user_id\":15,\"seller_id\":\"31\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-05 16:46:48', '2021-09-26 06:21:53'),
('ab4e44c5-0be0-48f7-84a7-d5e2b3f498a6', 'App\\Notifications\\OrderNotification', 'App\\User', 10, '{\"order_id\":1,\"order_code\":\"20210817-03324491\",\"user_id\":\"10\",\"seller_id\":\"10\",\"status\":\"pending\"}', NULL, '2021-08-16 19:35:32', '2021-08-16 19:35:32'),
('ab9f1788-7b84-4029-9ccf-8922d691ecac', 'App\\Notifications\\OrderNotification', 'App\\User', 63, '{\"order_id\":20,\"order_code\":\"20210905-15153672\",\"user_id\":\"63\",\"seller_id\":\"16\",\"status\":\"cancelled\"}', NULL, '2021-09-05 07:16:44', '2021-09-05 07:16:44'),
('ac6df680-afe2-498b-9abb-31001782c326', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":26,\"order_code\":\"20210905-21414236\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"cancelled\"}', NULL, '2021-09-05 16:39:33', '2021-09-05 16:39:33'),
('ad11f4e8-267b-43a2-858d-eace56a4fd30', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":35,\"order_code\":\"20210929-16461333\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-09-29 10:46:13', '2022-12-23 11:04:18'),
('ad513be6-6862-4411-bb5c-828298c32eb1', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":23,\"order_code\":\"20210929-13045888\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-09-29 07:04:58', '2022-12-23 11:04:18'),
('ae15c0de-698a-4e0b-93da-1a66e2f9074d', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":68,\"order_code\":\"20211004-17135930\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-11-09 10:30:45', '2021-10-04 11:13:59', '2021-11-09 10:30:45'),
('aeca812c-f55c-4ac1-940e-4c12850a4967', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":40,\"order_code\":\"20210909-14141445\",\"user_id\":34,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-09 06:14:15', '2021-09-26 06:21:53'),
('af2aa10d-cb32-4de9-a3af-0291654e2dd1', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":2,\"order_code\":\"20210929-12381167\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 06:38:11', '2021-10-04 09:49:09'),
('af981020-6f10-42de-b2a9-1d1851053e36', 'App\\Notifications\\OrderNotification', 'App\\User', 28, '{\"order_id\":3,\"order_code\":\"20210821-23370034\",\"user_id\":\"28\",\"seller_id\":\"28\",\"status\":\"delivered\"}', NULL, '2021-08-21 15:39:59', '2021-08-21 15:39:59'),
('b002dc37-9b84-4cad-b2c0-dd27b577905a', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":3,\"order_code\":\"20210821-23370034\",\"user_id\":28,\"seller_id\":\"28\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-08-21 15:37:01', '2021-09-26 06:21:53'),
('b016d3ab-ae39-4c40-88af-37624537f202', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":45,\"order_code\":\"20210909-20052138\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', NULL, '2021-09-09 12:25:07', '2021-09-09 12:25:07'),
('b1425887-fa1b-4b07-9c78-45a3fdc9933d', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":8,\"order_code\":\"20221105-13580272\",\"user_id\":140,\"seller_id\":9,\"status\":\"delivered\"}', NULL, '2022-11-05 08:05:19', '2022-11-05 08:05:19'),
('b279e140-4166-434c-83e8-2a5c4830b807', 'App\\Notifications\\OrderNotification', 'App\\User', 34, '{\"order_id\":7,\"order_code\":\"20210831-01312739\",\"user_id\":34,\"seller_id\":\"29\",\"status\":\"placed\"}', '2021-08-30 17:31:39', '2021-08-30 17:31:27', '2021-08-30 17:31:39'),
('b2fbc3b1-33ad-4a13-8064-c1184d8d1cf3', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":70,\"order_code\":\"20211004-17150016\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-11-09 10:30:45', '2021-10-04 11:15:00', '2021-11-09 10:30:45'),
('b33fcf9f-5291-4e4c-b956-b9ce0dd0d617', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":3,\"order_code\":\"20210929-12390142\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 06:39:01', '2021-10-04 09:49:09'),
('b3430f9d-20fb-44b1-8d33-5c7585c115b5', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":76,\"order_code\":\"20211004-17192481\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-10-04 11:19:24', '2022-12-23 11:04:18'),
('b3aacbba-47e0-4f51-93b7-d33993b26fbd', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":71,\"order_code\":\"20211004-17154966\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-11-09 10:30:45', '2021-10-04 11:15:49', '2021-11-09 10:30:45'),
('b4535448-38c1-4502-8eb4-798d28ed0061', 'App\\Notifications\\OrderNotification', 'App\\User', 140, '{\"order_id\":8,\"order_code\":\"20221105-13580272\",\"user_id\":140,\"seller_id\":9,\"status\":\"paid\"}', NULL, '2022-11-05 08:03:47', '2022-11-05 08:03:47'),
('b47997c6-2f1e-4a1f-b47b-7208893c7b2e', 'App\\Notifications\\OrderNotification', 'App\\User', 80, '{\"order_id\":32,\"order_code\":\"20210907-15185594\",\"user_id\":80,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-07 07:18:56', '2021-09-07 07:18:56'),
('b5bbe004-dc39-41c7-8d7f-92a236038cd8', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":48,\"order_code\":\"20210929-17000862\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 11:00:08', '2021-10-04 09:49:09'),
('b6810a22-18d2-4522-9f37-0bf7244550aa', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":42,\"order_code\":\"20210909-19545997\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', '2021-09-26 06:21:53', '2021-09-09 12:26:58', '2021-09-26 06:21:53'),
('b6b62d72-bd68-437e-9378-2d3387724a10', 'App\\Notifications\\OrderNotification', 'App\\User', 62, '{\"order_id\":19,\"order_code\":\"20210905-15105178\",\"user_id\":62,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-05 07:10:52', '2021-09-05 07:10:52'),
('b6cc128f-8450-4538-92de-3af93e825e63', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":44,\"order_code\":\"20210909-20002786\",\"user_id\":96,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-09 12:00:28', '2021-09-26 06:21:53'),
('b6ff4720-d0c6-4344-bfe2-ffd58797ce27', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":33,\"order_code\":\"20210907-15223233\",\"user_id\":15,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-07 07:22:33', '2021-09-07 07:22:33'),
('b7a9c7ec-aa6f-4858-a630-cdd7c6b8932d', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":35,\"order_code\":\"20210907-15290611\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"on_the_way\"}', '2021-09-26 06:21:53', '2021-09-12 04:50:14', '2021-09-26 06:21:53'),
('b843b697-d8c5-44dc-9408-6d80a710f434', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":46,\"order_code\":\"20210909-20103121\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', '2021-09-26 06:21:53', '2021-09-09 12:24:16', '2021-09-26 06:21:53'),
('b89b647b-c65a-417c-8e0e-8b0b994bd970', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":23,\"order_code\":\"20210905-17010782\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', '2021-09-26 06:21:53', '2021-09-05 09:04:55', '2021-09-26 06:21:53'),
('b903c62b-4bdc-43ec-b151-b6ecd011483c', 'App\\Notifications\\OrderNotification', 'App\\User', 110, '{\"order_id\":55,\"order_code\":\"20210911-20502210\",\"user_id\":110,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-11 12:50:24', '2021-09-11 12:50:24'),
('b95836ef-e5bf-4a67-91d9-87e6b2593cc1', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":52,\"order_code\":\"20211003-15542448\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-10-03 09:54:24', '2021-10-04 09:49:09'),
('ba79fd22-3818-43d4-a73e-157ff6bce24a', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":46,\"order_code\":\"20210929-16592135\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 10:59:21', '2021-10-04 09:49:09'),
('bafa3602-bacb-45bc-b7d8-5cbaa930d972', 'App\\Notifications\\OrderNotification', 'App\\User', 54, '{\"order_id\":51,\"order_code\":\"20210909-23351142\",\"user_id\":54,\"seller_id\":\"29\",\"status\":\"placed\"}', NULL, '2021-09-09 15:35:12', '2021-09-09 15:35:12'),
('bb763ac3-2c55-45f1-b501-2f9fd7b6e675', 'App\\Notifications\\OrderNotification', 'App\\User', 100, '{\"order_id\":50,\"order_code\":\"20210909-20212478\",\"user_id\":100,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-09 12:21:29', '2021-09-09 12:21:29'),
('bc1db673-e2a5-4233-93a1-078f74c11a64', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":49,\"order_code\":\"20210929-17155838\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-09-29 11:15:59', '2022-12-23 11:04:18'),
('bc8c0259-5835-47aa-8534-423e762ae6d1', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":34,\"order_code\":\"20210907-15255993\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', NULL, '2021-09-07 07:31:53', '2021-09-07 07:31:53');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('bc8d96aa-ff7b-42b5-86f3-75f104784fb4', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":54,\"order_code\":\"20210911-20471091\",\"user_id\":109,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-11 12:47:11', '2021-09-26 06:21:53'),
('bcc1ec08-e4a1-4824-8976-760f22dfea3a', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":70,\"order_code\":\"20211004-17150016\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-10-04 11:15:00', '2022-12-23 11:04:18'),
('bd14a668-abf8-488e-aa88-0152968e43a3', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":42,\"order_code\":\"20210909-19545997\",\"user_id\":15,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-09 11:55:00', '2021-09-26 06:21:53'),
('bd6bd63a-0ad3-4d81-beda-bfef0d9f7aac', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":27,\"order_code\":\"20210905-21534629\",\"user_id\":15,\"seller_id\":\"29\",\"status\":\"placed\"}', '2021-09-08 16:33:47', '2021-09-05 13:53:46', '2021-09-08 16:33:47'),
('bd6f3521-2833-479e-9c40-312937cccd06', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":36,\"order_code\":\"20210929-16532171\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-09-29 10:53:21', '2022-12-23 11:04:18'),
('bdbca893-a59a-48c3-8aee-6af7e8ba7196', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":26,\"order_code\":\"20210905-21414236\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"cancelled\"}', '2021-09-08 16:33:47', '2021-09-05 16:39:33', '2021-09-08 16:33:47'),
('be38cf6d-a348-49bd-a221-0b0dba6ce24e', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":14,\"order_code\":\"20210904-23505181\",\"user_id\":57,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-04 15:50:51', '2021-09-26 06:21:53'),
('bef8e026-4f09-46dd-a1ec-bb24b3669c04', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":15,\"order_code\":\"20210929-12523147\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 06:52:32', '2021-10-04 09:49:09'),
('bf277f8f-5c62-4637-8335-90fa8400fe54', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":46,\"order_code\":\"20210909-20103121\",\"user_id\":15,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-09 12:10:33', '2021-09-26 06:21:53'),
('bf4cfdf4-0ccf-43d7-97d9-61f68dbcbfd7', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":39,\"order_code\":\"20210929-16543367\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 10:54:34', '2021-10-04 09:49:09'),
('c0547ea6-54ca-4fbf-b2c9-79908eb61434', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":21,\"order_code\":\"20210929-12580915\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-09-29 06:58:09', '2022-12-23 11:04:18'),
('c05b53d8-e075-4cd8-b744-1a70da601be6', 'App\\Notifications\\OrderNotification', 'App\\User', 10, '{\"order_id\":1,\"order_code\":\"20210817-03324491\",\"user_id\":\"10\",\"seller_id\":\"10\",\"status\":\"confirmed\"}', NULL, '2021-08-16 19:34:46', '2021-08-16 19:34:46'),
('c098e94b-68a5-4ae6-949d-66d3e464a02f', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":6,\"order_code\":\"20210929-12425671\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:19', '2021-09-29 06:42:56', '2022-12-23 11:04:19'),
('c122b2dd-cb2a-4c2a-87a2-12321e7f457f', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":22,\"order_code\":\"20210905-15212796\",\"user_id\":62,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-05 07:21:27', '2021-09-26 06:21:53'),
('c1ade494-d105-4fa7-89fd-3656181639f2', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":58,\"order_code\":\"20210912-13281862\",\"user_id\":112,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-12 05:28:20', '2021-09-12 05:28:20'),
('c251887d-8bc4-4568-9f8e-72120c9f4e09', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":12,\"order_code\":\"20210902-16482681\",\"user_id\":15,\"seller_id\":\"29\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-02 08:48:26', '2021-09-26 06:21:53'),
('c2916903-0b3d-43a4-aacb-8ea80bc5bb5d', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":49,\"order_code\":\"20210929-17155838\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 11:15:59', '2021-10-04 09:49:09'),
('c3b40a5d-8871-4c00-ae8b-3ff11d8536a0', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":35,\"order_code\":\"20210907-15290611\",\"user_id\":15,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-08 16:33:47', '2021-09-07 07:29:08', '2021-09-08 16:33:47'),
('c57cb55e-64a9-47a0-a1e7-015d8c360607', 'App\\Notifications\\OrderNotification', 'App\\User', 119, '{\"order_id\":60,\"order_code\":\"20210913-13325511\",\"user_id\":119,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-13 05:35:45', '2021-09-13 05:32:57', '2021-09-13 05:35:45'),
('c7794d85-2773-4ee7-b957-dda68a912b6c', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":66,\"order_code\":\"20211004-17121486\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-10-04 11:12:14', '2022-12-23 11:04:18'),
('c7eeb7af-c04c-4fa8-8533-f3375cabdce4', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":5,\"order_code\":\"20210827-00234864\",\"user_id\":40,\"seller_id\":\"28\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-08-26 16:23:49', '2021-09-26 06:21:53'),
('c8749ff8-4a71-4630-846a-fdd717d5ead9', 'App\\Notifications\\OrderNotification', 'App\\User', 46, '{\"order_id\":10,\"order_code\":\"20210831-02222720\",\"user_id\":34,\"seller_id\":\"46\",\"status\":\"placed\"}', NULL, '2021-08-30 18:22:27', '2021-08-30 18:22:27'),
('c8c06ac0-b9ad-49e2-b8a7-6d42e25cac9e', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":80,\"order_code\":\"20211004-17262612\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-11-09 10:30:45', '2021-10-04 11:26:26', '2021-11-09 10:30:45'),
('c9490a9f-f1b9-4d92-9536-a707d12f9fb2', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":41,\"order_code\":\"20210909-19520737\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', NULL, '2021-09-09 12:27:37', '2021-09-09 12:27:37'),
('c97313a0-dbe0-4f97-8225-aae9746d35f1', 'App\\Notifications\\OrderNotification', 'App\\User', 112, '{\"order_id\":58,\"order_code\":\"20210912-13281862\",\"user_id\":112,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-12 05:28:20', '2021-09-12 05:28:20'),
('cadb96a7-96a2-4239-bb2b-a23260db0128', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":34,\"order_code\":\"20210907-15255993\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', '2021-09-26 06:21:53', '2021-09-07 07:31:53', '2021-09-26 06:21:53'),
('cb62013c-4680-443d-8b9f-deb955e7b879', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":33,\"order_code\":\"20210907-15223233\",\"user_id\":15,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-08 16:33:47', '2021-09-07 07:22:33', '2021-09-08 16:33:47'),
('cc4c5dbe-d494-4287-9432-0ee3862d7137', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":59,\"order_code\":\"20211004-11550298\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-10-04 05:55:02', '2021-10-04 09:49:09'),
('cc7d6cc9-4f6e-408a-b3c5-906435c90a56', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":66,\"order_code\":\"20211004-17121486\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-11-09 10:30:45', '2021-10-04 11:12:14', '2021-11-09 10:30:45'),
('ccf89f24-ba9a-44c9-b97c-8cea3a4be0c0', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":23,\"order_code\":\"20210905-17010782\",\"user_id\":15,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-05 09:01:07', '2021-09-26 06:21:53'),
('cd05b572-df2a-4fa0-ba84-9be91a69bcbf', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":22,\"order_code\":\"20210905-15212796\",\"user_id\":\"62\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', '2021-09-26 06:21:53', '2021-09-05 07:22:57', '2021-09-26 06:21:53'),
('cd6d3a8a-160d-41e0-a77c-e2331c3fe525', 'App\\Notifications\\OrderNotification', 'App\\User', 31, '{\"order_id\":28,\"order_code\":\"20210906-00464725\",\"user_id\":15,\"seller_id\":\"31\",\"status\":\"placed\"}', NULL, '2021-09-05 16:46:48', '2021-09-05 16:46:48'),
('cdc1a400-4faf-48fa-a95e-a2a4989703ba', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":10,\"order_code\":\"20230131-19063543\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', NULL, '2023-01-31 13:06:37', '2023-01-31 13:06:37'),
('ce2552f1-1b29-4ec7-a0da-79f3c1d4b435', 'App\\Notifications\\OrderNotification', 'App\\User', 127, '{\"order_id\":1,\"order_code\":\"20220217-15130866\",\"user_id\":127,\"seller_id\":9,\"status\":\"delivered\"}', NULL, '2022-02-20 06:06:51', '2022-02-20 06:06:51'),
('cece3730-41a2-49d8-b8e9-b91ae2fa830e', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":1,\"order_code\":\"20210928-18262989\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:19', '2021-09-28 12:26:29', '2022-12-23 11:04:19'),
('cf13cbe5-7d12-4e63-a4b9-3cc4d238b9b5', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":35,\"order_code\":\"20210907-15290611\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', '2021-09-26 06:21:53', '2021-09-07 07:32:12', '2021-09-26 06:21:53'),
('cfae885a-6f51-4112-84cb-456c6257dba8', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":9,\"order_code\":\"20210929-12490449\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:19', '2021-09-29 06:49:05', '2022-12-23 11:04:19'),
('cfeee676-4de1-4710-9e4b-54b281f15575', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":45,\"order_code\":\"20210909-20052138\",\"user_id\":15,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-09 12:05:22', '2021-09-26 06:21:53'),
('d024265f-8085-4712-9d92-f358d1bdfd7a', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":58,\"order_code\":\"20211004-11542557\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-10-04 05:54:25', '2022-12-23 11:04:18'),
('d1056500-198b-4a7e-a130-8b9f01b7efd2', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":35,\"order_code\":\"20210907-15290611\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', NULL, '2021-09-07 07:32:12', '2021-09-07 07:32:12'),
('d124d1d2-2a93-4f5f-aea5-06bdd0129768', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":11,\"order_code\":\"20210902-15351187\",\"user_id\":15,\"seller_id\":\"29\",\"status\":\"placed\"}', '2021-09-08 16:33:47', '2021-09-02 07:35:11', '2021-09-08 16:33:47'),
('d1a2274d-425c-47c9-a99f-45759b62a274', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":10,\"order_code\":\"20210929-12491318\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 06:49:13', '2021-10-04 09:49:09'),
('d1f8a36e-c328-4513-9e42-0444e9690d24', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":53,\"order_code\":\"20211003-16402429\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-10-03 10:40:24', '2022-12-23 11:04:18'),
('d21cf649-ffb5-4f54-9014-7043f87f6119', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":29,\"order_code\":\"20210906-01320770\",\"user_id\":70,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-05 17:32:08', '2021-09-05 17:32:08'),
('d24dd6b5-3fb7-4f87-bb11-4d594a7e0d73', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":47,\"order_code\":\"20210909-20125550\",\"user_id\":97,\"seller_id\":\"43\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-09 12:12:56', '2021-09-26 06:21:53'),
('d36b754c-604c-407e-9791-d714061e7bfa', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":51,\"order_code\":\"20210930-18250531\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-30 12:25:05', '2021-10-04 09:49:09'),
('d3e75208-7c03-47d8-b707-44590b32dbd1', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":15,\"order_code\":\"20210929-12523147\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:19', '2021-09-29 06:52:32', '2022-12-23 11:04:19'),
('d3ef5ebd-0148-4840-94f9-ac9de5d9ff88', 'App\\Notifications\\OrderNotification', 'App\\User', 32, '{\"order_id\":4,\"order_code\":\"20210824-02553769\",\"user_id\":\"32\",\"seller_id\":\"32\",\"status\":\"paid\"}', '2021-08-23 18:59:59', '2021-08-23 18:56:15', '2021-08-23 18:59:59'),
('d3efe39a-c669-46d9-950f-456f40cd2876', 'App\\Notifications\\OrderNotification', 'App\\User', 117, '{\"order_id\":59,\"order_code\":\"20210913-11315431\",\"user_id\":117,\"seller_id\":\"10\",\"status\":\"placed\"}', NULL, '2021-09-13 03:31:56', '2021-09-13 03:31:56'),
('d423205a-64f0-404b-baa8-14dc8c9fce3b', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":39,\"order_code\":\"20210908-00280020\",\"user_id\":15,\"seller_id\":\"29\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-07 16:28:02', '2021-09-26 06:21:53'),
('d430ef49-fffa-4231-84f3-076b67f242b8', 'App\\Notifications\\OrderNotification', 'App\\User', 140, '{\"order_id\":8,\"order_code\":\"20221105-13580272\",\"user_id\":140,\"seller_id\":\"9\",\"status\":\"placed\"}', NULL, '2022-11-05 07:58:07', '2022-11-05 07:58:07'),
('d4a2984d-c0b1-4b07-9be7-a204ff725e0f', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":34,\"order_code\":\"20210907-15255993\",\"user_id\":15,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-07 07:26:00', '2021-09-26 06:21:53'),
('d4be5829-494b-4cbf-8bed-27324fa3a738', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":22,\"order_code\":\"20210929-13030860\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 07:03:08', '2021-10-04 09:49:09'),
('d53f1a92-a9b1-4206-aaea-e57dc15c1744', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":29,\"order_code\":\"20210929-15504055\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 09:50:40', '2021-10-04 09:49:09'),
('d576282d-e675-4781-8ac8-0568ed4501e7', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":12,\"order_code\":\"20210902-16482681\",\"user_id\":\"15\",\"seller_id\":\"29\",\"status\":\"confirmed\"}', '2021-09-08 16:33:47', '2021-09-02 08:49:49', '2021-09-08 16:33:47'),
('d5f00d4a-1d09-43f8-9f2f-8bfdae6b1a28', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":50,\"order_code\":\"20210929-18035187\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-09-29 12:03:51', '2022-12-23 11:04:18'),
('d7758dcf-114d-41ae-ae87-816a92e105dd', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":56,\"order_code\":\"20211003-16493716\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-10-03 10:49:37', '2021-10-04 09:49:09'),
('d784fce0-2a82-4f80-9239-a4ff9a6d0f0a', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":73,\"order_code\":\"20211004-17180025\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-11-09 10:30:45', '2021-10-04 11:18:00', '2021-11-09 10:30:45'),
('d8228f7a-d09d-4141-80ec-cb044e73be1a', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":22,\"order_code\":\"20210929-13030860\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-09-29 07:03:08', '2022-12-23 11:04:18'),
('d88d0ebe-8d58-4053-9fbc-873039de2d81', 'App\\Notifications\\OrderNotification', 'App\\User', 81, '{\"order_id\":36,\"order_code\":\"20210907-20023744\",\"user_id\":81,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-07 12:03:33', '2021-09-07 12:02:39', '2021-09-07 12:03:33'),
('d92f5521-f9a4-4fa2-ad60-a123844f771d', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":11,\"order_code\":\"20210902-15351187\",\"user_id\":15,\"seller_id\":\"29\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-02 07:35:11', '2021-09-26 06:21:53'),
('da04904b-0965-4a6c-a20d-5a8b5e4c8678', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":42,\"order_code\":\"20210909-19545997\",\"user_id\":15,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-09 11:55:00', '2021-09-09 11:55:00'),
('dab1a069-0543-4eee-ab75-5641c702e698', 'App\\Notifications\\OrderNotification', 'App\\User', 62, '{\"order_id\":22,\"order_code\":\"20210905-15212796\",\"user_id\":\"62\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', NULL, '2021-09-05 07:22:57', '2021-09-05 07:22:57'),
('db45cbe1-020b-4470-8ff8-7c3993cb2574', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":42,\"order_code\":\"20210909-19545997\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', NULL, '2021-09-09 12:26:58', '2021-09-09 12:26:58'),
('dc306c44-b5ea-4e89-859e-70c4a141984b', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":25,\"order_code\":\"20210905-21264914\",\"user_id\":66,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-05 13:26:50', '2021-09-05 13:26:50'),
('dd9df299-3477-4be4-90f9-6709acd901ca', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":1,\"order_code\":\"20210817-03324491\",\"user_id\":10,\"seller_id\":\"10\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-08-16 19:32:45', '2021-09-26 06:21:53'),
('df57b263-d808-4648-a116-d5c637536119', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":33,\"order_code\":\"20210907-15223233\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', '2021-09-26 06:21:53', '2021-09-07 07:31:35', '2021-09-26 06:21:53'),
('e015623e-2f59-4af9-814a-ac3f5bf1b4ce', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":45,\"order_code\":\"20210909-20052138\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"on_the_way\"}', '2021-09-26 06:21:53', '2021-09-12 04:31:08', '2021-09-26 06:21:53'),
('e05dbde5-4a74-423d-80fa-8bad9d9e9561', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":15,\"order_code\":\"20210905-01343946\",\"user_id\":58,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-04 17:34:40', '2021-09-04 17:34:40'),
('e06168b7-f852-4c65-8cab-329200528e01', 'App\\Notifications\\OrderNotification', 'App\\User', 10, '{\"order_id\":1,\"order_code\":\"20210817-03324491\",\"user_id\":10,\"seller_id\":\"10\",\"status\":\"placed\"}', NULL, '2021-08-16 19:32:45', '2021-08-16 19:32:45'),
('e151f9c7-fec6-489c-86e0-91c35d3c1f4f', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":11,\"order_code\":\"20240203-01140726\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', NULL, '2024-02-02 19:14:09', '2024-02-02 19:14:09'),
('e1635b1f-fa42-4fd1-bb04-719a5c4f8808', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":3,\"order_code\":\"20221029-17400817\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', NULL, '2022-10-29 11:40:13', '2022-10-29 11:40:13'),
('e1759b96-850e-4891-b296-4fcdd6167525', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":45,\"order_code\":\"20210929-16583899\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-09-29 10:58:38', '2022-12-23 11:04:18'),
('e203ab5a-69bc-41cc-a1ba-7be6afe58eed', 'App\\Notifications\\OrderNotification', 'App\\User', 34, '{\"order_id\":7,\"order_code\":\"20210831-01312739\",\"user_id\":\"34\",\"seller_id\":\"29\",\"status\":\"confirmed\"}', '2021-08-30 17:35:04', '2021-08-30 17:34:44', '2021-08-30 17:35:04'),
('e23df62d-c211-4b60-82b8-78b368013969', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":59,\"order_code\":\"20211004-11550298\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-10-04 05:55:02', '2022-12-23 11:04:18'),
('e2a11c34-b33b-48ca-8c39-11c0b4ff29a6', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":19,\"order_code\":\"20210905-15105178\",\"user_id\":62,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-05 07:10:52', '2021-09-05 07:10:52'),
('e2cea139-fea8-4c70-a919-4c65e8aab366', 'App\\Notifications\\OrderNotification', 'App\\User', 29, '{\"order_id\":7,\"order_code\":\"20210831-01312739\",\"user_id\":\"34\",\"seller_id\":\"29\",\"status\":\"picked_up\"}', NULL, '2021-08-30 17:35:28', '2021-08-30 17:35:28'),
('e3352bfa-dae6-468f-a815-c7a0fefbb0ca', 'App\\Notifications\\OrderNotification', 'App\\User', 29, '{\"order_id\":39,\"order_code\":\"20210908-00280020\",\"user_id\":15,\"seller_id\":\"29\",\"status\":\"placed\"}', NULL, '2021-09-07 16:28:02', '2021-09-07 16:28:02'),
('e3453eb1-8602-4630-88e1-40b30e2946df', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":5,\"order_code\":\"20210929-12395074\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 06:39:51', '2021-10-04 09:49:09'),
('e3b3b835-b3d4-48b8-ba93-abe9fa108342', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":46,\"order_code\":\"20210929-16592135\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-09-29 10:59:21', '2022-12-23 11:04:18'),
('e4332d4c-bf5e-4682-b816-435404277264', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":60,\"order_code\":\"20210913-13325511\",\"user_id\":119,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-13 05:32:57', '2021-09-13 05:32:57'),
('e47c500c-3bf9-46b3-964e-3357a1a222a5', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":8,\"order_code\":\"20221105-13580272\",\"user_id\":140,\"seller_id\":\"9\",\"status\":\"placed\"}', NULL, '2022-11-05 07:58:07', '2022-11-05 07:58:07'),
('e4f11182-1614-4237-885b-bbf2315057c3', 'App\\Notifications\\OrderNotification', 'App\\User', 31, '{\"order_id\":53,\"order_code\":\"20210910-22224943\",\"user_id\":107,\"seller_id\":\"31\",\"status\":\"placed\"}', NULL, '2021-09-10 14:22:51', '2021-09-10 14:22:51'),
('e4fb3471-67c7-40a7-9a26-e3675cce4c1e', 'App\\Notifications\\OrderNotification', 'App\\User', 58, '{\"order_id\":15,\"order_code\":\"20210905-01343946\",\"user_id\":58,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-04 17:34:40', '2021-09-04 17:34:40'),
('e52ceac8-2001-4f8b-adc5-09ef4d3e9265', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":17,\"order_code\":\"20210929-12533413\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 06:53:34', '2021-10-04 09:49:09'),
('e548f308-fe9d-4567-9e19-4c8b6f488d51', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":3,\"order_code\":\"20210821-23370034\",\"user_id\":\"28\",\"seller_id\":\"28\",\"status\":\"paid\"}', '2021-09-26 06:21:53', '2021-08-21 15:39:50', '2021-09-26 06:21:53'),
('e57f37be-b79e-4225-9bb1-2d51b0635702', 'App\\Notifications\\OrderNotification', 'App\\User', 127, '{\"order_id\":1,\"order_code\":\"20220217-15130866\",\"user_id\":127,\"seller_id\":9,\"status\":\"paid\"}', NULL, '2022-02-20 06:06:42', '2022-02-20 06:06:42'),
('e5d15de6-a8fd-4341-859e-de43dd1dd71b', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":37,\"order_code\":\"20210907-20093288\",\"user_id\":82,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-07 12:09:34', '2021-09-26 06:21:53'),
('e704623b-a619-46df-a63c-29cb9cca420c', 'App\\Notifications\\OrderNotification', 'App\\User', 62, '{\"order_id\":19,\"order_code\":\"20210905-15105178\",\"user_id\":\"62\",\"seller_id\":\"16\",\"status\":\"cancelled\"}', NULL, '2021-09-05 07:20:28', '2021-09-05 07:20:28'),
('e709a385-c265-4d4b-8adf-283a804f9d98', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":33,\"order_code\":\"20210907-15223233\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', '2021-09-08 16:33:47', '2021-09-07 07:31:35', '2021-09-08 16:33:47'),
('e73c9125-b103-4fa5-8a05-675486e1d6bd', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":82,\"order_code\":\"20211004-17354345\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-10-04 11:35:43', '2022-12-23 11:04:18'),
('e80568ff-248e-47c3-a3d2-5d8b35bc0ed1', 'App\\Notifications\\OrderNotification', 'App\\User', 32, '{\"order_id\":4,\"order_code\":\"20210824-02553769\",\"user_id\":\"32\",\"seller_id\":\"32\",\"status\":\"delivered\"}', '2021-08-23 18:59:59', '2021-08-23 18:56:25', '2021-08-23 18:59:59'),
('e833e83e-e88b-406f-8279-9a553c454692', 'App\\Notifications\\OrderNotification', 'App\\User', 43, '{\"order_id\":57,\"order_code\":\"20210911-20543732\",\"user_id\":111,\"seller_id\":\"43\",\"status\":\"placed\"}', NULL, '2021-09-11 12:54:38', '2021-09-11 12:54:38'),
('e9aa49a5-acae-4318-858d-2acb71bcd354', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":4,\"order_code\":\"20210929-12391465\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:19', '2021-09-29 06:39:14', '2022-12-23 11:04:19'),
('eb173f64-dae4-4d81-8ef3-fca60c259d41', 'App\\Notifications\\OrderNotification', 'App\\User', 130, '{\"order_id\":2,\"order_code\":\"20220621-15085431\",\"user_id\":130,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-06-21 09:38:51', '2022-06-21 09:08:55', '2022-06-21 09:38:51'),
('eb543ae3-3761-461d-9c41-4f9887bb6e91', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":79,\"order_code\":\"20211004-17235984\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-10-04 11:23:59', '2022-12-23 11:04:18'),
('eb5dda58-1873-431c-bc71-b912dfe7b034', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":50,\"order_code\":\"20210909-20212478\",\"user_id\":100,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-09 12:21:29', '2021-09-26 06:21:53'),
('eb73841a-6c9b-4838-a08a-d57f63cddc5f', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":26,\"order_code\":\"20210905-21414236\",\"user_id\":15,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-05 13:41:42', '2021-09-05 13:41:42'),
('ebad2be8-e2e3-4786-add2-6d7b5fa6f0fd', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":35,\"order_code\":\"20210929-16461333\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 10:46:13', '2021-10-04 09:49:09'),
('ebcc28c8-1e8b-4397-b117-c0dafce2748d', 'App\\Notifications\\OrderNotification', 'App\\User', 34, '{\"order_id\":10,\"order_code\":\"20210831-02222720\",\"user_id\":\"34\",\"seller_id\":\"46\",\"status\":\"delivered\"}', '2021-08-31 01:25:57', '2021-08-31 01:24:51', '2021-08-31 01:25:57'),
('ebe149ed-066a-40f7-89fc-58f0d8f460d5', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":12,\"order_code\":\"20210902-16482681\",\"user_id\":\"15\",\"seller_id\":\"29\",\"status\":\"confirmed\"}', '2021-09-26 06:21:53', '2021-09-02 08:49:49', '2021-09-26 06:21:53'),
('ecb3292b-4e85-4b97-bf51-93c349a65612', 'App\\Notifications\\OrderNotification', 'App\\User', 34, '{\"order_id\":9,\"order_code\":\"20210831-02221552\",\"user_id\":34,\"seller_id\":\"46\",\"status\":\"placed\"}', '2021-08-30 18:27:19', '2021-08-30 18:22:16', '2021-08-30 18:27:19'),
('ed210f3c-393f-4c4a-b684-5c530dd412e2', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":30,\"order_code\":\"20210906-01364551\",\"user_id\":71,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-05 17:36:47', '2021-09-05 17:36:47'),
('ed26738c-5e62-4444-be0e-a23d430a0abf', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":52,\"order_code\":\"20211003-15542448\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-10-03 09:54:24', '2022-12-23 11:04:18'),
('ed554b08-1c61-408f-a425-f366d3a9a726', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":74,\"order_code\":\"20211004-17182685\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-10-04 11:18:26', '2022-12-23 11:04:18'),
('edb96d83-d698-4633-ad62-701318841839', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":23,\"order_code\":\"20210905-17010782\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', '2021-09-08 16:33:47', '2021-09-05 09:04:55', '2021-09-08 16:33:47'),
('ede4e60f-a3b4-4a0c-b5ca-0a4d9db54261', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":39,\"order_code\":\"20210908-00280020\",\"user_id\":\"15\",\"seller_id\":\"29\",\"status\":\"on_the_way\"}', '2021-09-08 16:33:47', '2021-09-08 10:27:26', '2021-09-08 16:33:47'),
('edf53c8b-d55b-478c-a088-d52a2a23093e', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":33,\"order_code\":\"20210907-15223233\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"on_the_way\"}', NULL, '2021-09-12 04:27:38', '2021-09-12 04:27:38'),
('ee0ea94f-04a5-445e-8676-279285c1f3aa', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":23,\"order_code\":\"20210905-17010782\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"cancelled\"}', '2021-09-08 16:33:47', '2021-09-05 13:38:58', '2021-09-08 16:33:47'),
('ee380bd0-304a-4548-a562-8626d47f630f', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":57,\"order_code\":\"20211003-16495579\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-10-03 10:49:55', '2022-12-23 11:04:18'),
('ee599338-c7b7-45a2-8dd8-1a0a56af1806', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":20,\"order_code\":\"20210905-15153672\",\"user_id\":63,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-05 07:15:36', '2021-09-26 06:21:53'),
('ee76f262-2762-4630-9849-7dec09b31339', 'App\\Notifications\\OrderNotification', 'App\\User', 10, '{\"order_id\":1,\"order_code\":\"20210817-03324491\",\"user_id\":\"10\",\"seller_id\":\"10\",\"status\":\"delivered\"}', NULL, '2021-08-16 19:35:14', '2021-08-16 19:35:14'),
('eec8cda9-2e28-4276-b740-14b799e2d205', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":34,\"order_code\":\"20210907-15255993\",\"user_id\":\"15\",\"seller_id\":\"16\",\"status\":\"on_the_way\"}', NULL, '2021-09-12 04:22:32', '2021-09-12 04:22:32'),
('efa37cce-a84b-42f7-bc5e-99eaf93d8ea0', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":43,\"order_code\":\"20210909-19574771\",\"user_id\":95,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-09 11:57:49', '2021-09-09 11:57:49'),
('f12f2812-628e-410b-8ee3-6a685295bcdb', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":39,\"order_code\":\"20210908-00280020\",\"user_id\":15,\"seller_id\":\"29\",\"status\":\"placed\"}', '2021-09-08 16:33:47', '2021-09-07 16:28:02', '2021-09-08 16:33:47'),
('f1f37224-9c4b-473b-9c6f-ef1dc3b0aa3c', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":39,\"order_code\":\"20210908-00280020\",\"user_id\":\"15\",\"seller_id\":\"29\",\"status\":\"picked_up\"}', '2021-09-26 06:21:53', '2021-09-08 10:27:11', '2021-09-26 06:21:53'),
('f2a979d3-5193-4370-8ed0-d33abe9c2025', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":81,\"order_code\":\"20211004-17344270\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-10-04 11:34:42', '2022-12-23 11:04:18'),
('f30a6ce1-7cf3-4091-ae38-e32de815b494', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":4,\"order_code\":\"20210824-02553769\",\"user_id\":32,\"seller_id\":\"32\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-08-23 18:55:38', '2021-09-26 06:21:53'),
('f4331684-56b8-4743-a763-9c68a6a70f04', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":30,\"order_code\":\"20210929-16351821\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-09-29 10:35:18', '2022-12-23 11:04:18'),
('f4a4b466-1a40-447e-92a6-83ea23b3a23a', 'App\\Notifications\\OrderNotification', 'App\\User', 18, '{\"order_id\":16,\"order_code\":\"20210905-01434297\",\"user_id\":\"15\",\"seller_id\":\"18\",\"status\":\"cancelled\"}', NULL, '2021-09-12 04:37:34', '2021-09-12 04:37:34'),
('f4aa387b-5fbf-459c-a865-17aea4cd3a73', 'App\\Notifications\\OrderNotification', 'App\\User', 10, '{\"order_id\":1,\"order_code\":\"20210817-03324491\",\"user_id\":\"10\",\"seller_id\":\"10\",\"status\":\"on_delivery\"}', NULL, '2021-08-16 19:35:06', '2021-08-16 19:35:06'),
('f5005fd8-c0fc-4525-a515-e226a039c311', 'App\\Notifications\\OrderNotification', 'App\\User', 124, '{\"order_id\":38,\"order_code\":\"20210929-16540091\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2022-12-23 11:04:18', '2021-09-29 10:54:00', '2022-12-23 11:04:18'),
('f59e971b-ee6f-4264-820f-ce1d2c67238e', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":60,\"order_code\":\"20210913-13325511\",\"user_id\":119,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-13 05:32:57', '2021-09-26 06:21:53'),
('f5eb8acd-1869-4c6c-a2cf-39d48f592977', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":34,\"order_code\":\"20210929-16454863\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 10:45:49', '2021-10-04 09:49:09'),
('f6987b87-d180-4ce3-95b8-6a7bd9cffc5a', 'App\\Notifications\\OrderNotification', 'App\\User', 15, '{\"order_id\":2,\"order_code\":\"20210819-01462969\",\"user_id\":15,\"seller_id\":\"10\",\"status\":\"placed\"}', '2021-08-19 11:27:06', '2021-08-18 17:46:30', '2021-08-19 11:27:06'),
('f6e5722a-755e-42b3-9111-68d156f205cc', 'App\\Notifications\\OrderNotification', 'App\\User', 16, '{\"order_id\":20,\"order_code\":\"20210905-15153672\",\"user_id\":63,\"seller_id\":\"16\",\"status\":\"placed\"}', NULL, '2021-09-05 07:15:36', '2021-09-05 07:15:36'),
('f891ab8b-afe1-4ac3-a142-edcf66d03014', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":53,\"order_code\":\"20210910-22224943\",\"user_id\":107,\"seller_id\":\"31\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-10 14:22:51', '2021-09-26 06:21:53'),
('f89478b3-2f26-4a60-8c46-8adb26b184ae', 'App\\Notifications\\OrderNotification', 'App\\User', 34, '{\"order_id\":40,\"order_code\":\"20210909-14141445\",\"user_id\":34,\"seller_id\":\"9\",\"status\":\"placed\"}', NULL, '2021-09-09 06:14:15', '2021-09-09 06:14:15'),
('f94f15ee-8388-4bff-bbde-b273a243b46e', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":21,\"order_code\":\"20210905-15174581\",\"user_id\":63,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-05 07:17:46', '2021-09-26 06:21:53'),
('f9d9a12e-ada1-4cd5-9a03-f777a289e280', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":12,\"order_code\":\"20210902-16482681\",\"user_id\":\"15\",\"seller_id\":\"29\",\"status\":\"paid\"}', '2021-09-26 06:21:53', '2021-09-04 16:03:03', '2021-09-26 06:21:53'),
('fb3d54f9-fdbb-4624-90ec-322796aeb7c4', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":17,\"order_code\":\"20210905-10244893\",\"user_id\":\"60\",\"seller_id\":\"16\",\"status\":\"confirmed\"}', '2021-09-26 06:21:53', '2021-09-05 06:58:11', '2021-09-26 06:21:53'),
('fd2df4be-2814-4071-a4f2-9d3bb39a4b78', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":29,\"order_code\":\"20210906-01320770\",\"user_id\":70,\"seller_id\":\"16\",\"status\":\"placed\"}', '2021-09-26 06:21:53', '2021-09-05 17:32:08', '2021-09-26 06:21:53'),
('fd7a0878-bd46-4715-8152-ae6d11b07de0', 'App\\Notifications\\OrderNotification', 'App\\User', 29, '{\"order_id\":12,\"order_code\":\"20210902-16482681\",\"user_id\":\"15\",\"seller_id\":\"29\",\"status\":\"paid\"}', NULL, '2021-09-04 16:03:03', '2021-09-04 16:03:03'),
('fddd7839-1148-4463-8b39-956fc2cd5d5b', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":18,\"order_code\":\"20210929-12535356\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 06:53:53', '2021-10-04 09:49:09'),
('fedf6b77-2795-40af-b25a-333b12bcc738', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":1,\"order_code\":\"20220217-15130866\",\"user_id\":127,\"seller_id\":9,\"status\":\"delivered\"}', NULL, '2022-02-20 06:06:51', '2022-02-20 06:06:51'),
('ff554a4f-6027-4a74-9e27-71f512ab9973', 'App\\Notifications\\OrderNotification', 'App\\User', 9, '{\"order_id\":23,\"order_code\":\"20210929-13045888\",\"user_id\":124,\"seller_id\":\"9\",\"status\":\"placed\"}', '2021-10-04 09:49:09', '2021-09-29 07:04:58', '2021-10-04 09:49:09');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('125ce8289850f80d9fea100325bf892fbd0deba1f87dbfc2ab81fb43d57377ec24ed65f7dc560e46', 1, 1, 'Personal Access Token', '[]', 0, '2019-07-30 04:51:13', '2019-07-30 04:51:13', '2020-07-30 10:51:13'),
('293d2bb534220c070c4e90d25b5509965d23d3ddbc05b1e29fb4899ae09420ff112dbccab1c6f504', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 06:00:04', '2019-08-04 06:00:04', '2020-08-04 12:00:04'),
('5363e91c7892acdd6417aa9c7d4987d83568e229befbd75be64282dbe8a88147c6c705e06c1fb2bf', 1, 1, 'Personal Access Token', '[]', 0, '2019-07-13 06:44:28', '2019-07-13 06:44:28', '2020-07-13 12:44:28'),
('681b4a4099fac5e12517307b4027b54df94cbaf0cbf6b4bf496534c94f0ccd8a79dd6af9742d076b', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 07:23:06', '2019-08-04 07:23:06', '2020-08-04 13:23:06'),
('6d229e3559e568df086c706a1056f760abc1370abe74033c773490581a042442154afa1260c4b6f0', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 07:32:12', '2019-08-04 07:32:12', '2020-08-04 13:32:12'),
('6efc0f1fc3843027ea1ea7cd35acf9c74282f0271c31d45a164e7b27025a315d31022efe7bb94aaa', 1, 1, 'Personal Access Token', '[]', 0, '2019-08-08 02:35:26', '2019-08-08 02:35:26', '2020-08-08 08:35:26'),
('7745b763da15a06eaded371330072361b0524c41651cf48bf76fc1b521a475ece78703646e06d3b0', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 07:29:44', '2019-08-04 07:29:44', '2020-08-04 13:29:44'),
('815b625e239934be293cd34479b0f766bbc1da7cc10d464a2944ddce3a0142e943ae48be018ccbd0', 1, 1, 'Personal Access Token', '[]', 1, '2019-07-22 02:07:47', '2019-07-22 02:07:47', '2020-07-22 08:07:47'),
('8921a4c96a6d674ac002e216f98855c69de2568003f9b4136f6e66f4cb9545442fb3e37e91a27cad', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 06:05:05', '2019-08-04 06:05:05', '2020-08-04 12:05:05'),
('8d8b85720304e2f161a66564cec0ecd50d70e611cc0efbf04e409330086e6009f72a39ce2191f33a', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 06:44:35', '2019-08-04 06:44:35', '2020-08-04 12:44:35'),
('bcaaebdead4c0ef15f3ea6d196fd80749d309e6db8603b235e818cb626a5cea034ff2a55b66e3e1a', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 07:14:32', '2019-08-04 07:14:32', '2020-08-04 13:14:32'),
('c25417a5c728073ca8ba57058ded43d496a9d2619b434d2a004dd490a64478c08bc3e06ffc1be65d', 1, 1, 'Personal Access Token', '[]', 1, '2019-07-30 01:45:31', '2019-07-30 01:45:31', '2020-07-30 07:45:31'),
('c7423d85b2b5bdc5027cb283be57fa22f5943cae43f60b0ed27e6dd198e46f25e3501b3081ed0777', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-05 05:02:59', '2019-08-05 05:02:59', '2020-08-05 11:02:59'),
('e76f19dbd5c2c4060719fb1006ac56116fd86f7838b4bf74e2c0a0ac9696e724df1e517dbdb357f4', 1, 1, 'Personal Access Token', '[]', 1, '2019-07-15 02:53:40', '2019-07-15 02:53:40', '2020-07-15 08:53:40'),
('ed7c269dd6f9a97750a982f62e0de54749be6950e323cdfef892a1ec93f8ddbacf9fe26e6a42180e', 1, 1, 'Personal Access Token', '[]', 1, '2019-07-13 06:36:45', '2019-07-13 06:36:45', '2020-07-13 12:36:45'),
('f6d1475bc17a27e389000d3df4da5c5004ce7610158b0dd414226700c0f6db48914637b4c76e1948', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 07:22:01', '2019-08-04 07:22:01', '2020-08-04 13:22:01'),
('f85e4e444fc954430170c41779a4238f84cd6fed905f682795cd4d7b6a291ec5204a10ac0480eb30', 1, 1, 'Personal Access Token', '[]', 1, '2019-07-30 06:38:49', '2019-07-30 06:38:49', '2020-07-30 12:38:49'),
('f8bf983a42c543b99128296e4bc7c2d17a52b5b9ef69670c629b93a653c6a4af27be452e0c331f79', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 07:28:55', '2019-08-04 07:28:55', '2020-08-04 13:28:55');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'eR2y7WUuem28ugHKppFpmss7jPyOHZsMkQwBo1Jj', 'http://localhost', 1, 0, 0, '2019-07-13 06:17:34', '2019-07-13 06:17:34'),
(2, NULL, 'Laravel Password Grant Client', 'WLW2Ol0GozbaXEnx1NtXoweYPuKEbjWdviaUgw77', 'http://localhost', 0, 1, 0, '2019-07-13 06:17:34', '2019-07-13 06:17:34');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-07-13 06:17:34', '2019-07-13 06:17:34');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `guest_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `assign_delivery_boy` int(11) DEFAULT NULL,
  `shipping_address` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `delivery_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'pending',
  `payment_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'unpaid',
  `payment_details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `grand_total` double(20,2) DEFAULT NULL,
  `coupon_discount` double(20,2) NOT NULL DEFAULT 0.00,
  `code` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` int(20) NOT NULL,
  `viewed` int(1) NOT NULL DEFAULT 0,
  `delivery_viewed` int(1) NOT NULL DEFAULT 1,
  `cancel_request` tinyint(1) NOT NULL DEFAULT 0,
  `cancel_request_at` datetime DEFAULT NULL,
  `payment_status_viewed` int(1) DEFAULT 1,
  `commission_calculated` int(11) NOT NULL DEFAULT 0,
  `delivery_history_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `guest_id`, `seller_id`, `assign_delivery_boy`, `shipping_address`, `delivery_status`, `payment_type`, `payment_status`, `payment_details`, `grand_total`, `coupon_discount`, `code`, `date`, `viewed`, `delivery_viewed`, `cancel_request`, `cancel_request_at`, `payment_status_viewed`, `commission_calculated`, `delivery_history_date`, `created_at`, `updated_at`) VALUES
(4, 140, NULL, 9, NULL, '{\"id\":65,\"user_id\":140,\"address\":\"Ja - 82\\/1, Link Road\",\"country\":\"Bangladesh\",\"city\":\"Dhaka\",\"longitude\":null,\"latitude\":null,\"postal_code\":\"1212\",\"phone\":\"01717702480\",\"set_default\":0,\"created_at\":\"2022-11-05 13:50:49\",\"updated_at\":\"2022-11-05 13:50:49\",\"name\":\"Sohel\",\"email\":null}', 'pending', 'cash_on_delivery', 'unpaid', NULL, NULL, 0.00, '20221105-13511492', 1667634674, 0, 0, 0, NULL, 0, 0, '2022-11-05 07:51:14', '2022-11-05 07:51:14', '2022-11-05 07:51:14'),
(5, 140, NULL, 9, NULL, '{\"id\":65,\"user_id\":140,\"address\":\"Ja - 82\\/1, Link Road\",\"country\":\"Bangladesh\",\"city\":\"Dhaka\",\"longitude\":null,\"latitude\":null,\"postal_code\":\"1212\",\"phone\":\"01717702480\",\"set_default\":0,\"created_at\":\"2022-11-05 13:50:49\",\"updated_at\":\"2022-11-05 13:50:49\",\"name\":\"Sohel\",\"email\":null}', 'pending', 'cash_on_delivery', 'unpaid', NULL, NULL, 0.00, '20221105-13522998', 1667634749, 0, 0, 0, NULL, 0, 0, '2022-11-05 07:52:29', '2022-11-05 07:52:29', '2022-11-05 07:52:29'),
(6, 140, NULL, 9, NULL, '{\"id\":65,\"user_id\":140,\"address\":\"Ja - 82\\/1, Link Road\",\"country\":\"Bangladesh\",\"city\":\"Dhaka\",\"longitude\":null,\"latitude\":null,\"postal_code\":\"1212\",\"phone\":\"01717702480\",\"set_default\":0,\"created_at\":\"2022-11-05 13:50:49\",\"updated_at\":\"2022-11-05 13:50:49\",\"name\":\"Sohel\",\"email\":null}', 'pending', 'cash_on_delivery', 'unpaid', NULL, NULL, 0.00, '20221105-13534562', 1667634825, 0, 0, 0, NULL, 0, 0, '2022-11-05 07:53:45', '2022-11-05 07:53:45', '2022-11-05 07:53:45'),
(7, 140, NULL, 9, NULL, '{\"id\":65,\"user_id\":140,\"address\":\"Ja - 82\\/1, Link Road\",\"country\":\"Bangladesh\",\"city\":\"Dhaka\",\"longitude\":null,\"latitude\":null,\"postal_code\":\"1212\",\"phone\":\"01717702480\",\"set_default\":0,\"created_at\":\"2022-11-05 13:50:49\",\"updated_at\":\"2022-11-05 13:50:49\",\"name\":\"Sohel\",\"email\":null}', 'pending', 'cash_on_delivery', 'unpaid', NULL, NULL, 0.00, '20221105-13574893', 1667635068, 0, 0, 0, NULL, 0, 0, '2022-11-05 07:57:48', '2022-11-05 07:57:48', '2022-11-05 07:57:48'),
(8, 140, NULL, 9, NULL, '{\"id\":65,\"user_id\":140,\"address\":\"Ja - 82\\/1, Link Road\",\"country\":\"Bangladesh\",\"city\":\"Dhaka\",\"longitude\":null,\"latitude\":null,\"postal_code\":\"1212\",\"phone\":\"01717702480\",\"set_default\":0,\"created_at\":\"2022-11-05 13:50:49\",\"updated_at\":\"2022-11-05 13:50:49\",\"name\":\"Sohel\",\"email\":null}', 'delivered', 'cash_on_delivery', 'paid', NULL, 1200.00, 0.00, '20221105-13580272', 1667635082, 0, 1, 0, NULL, 1, 1, '2022-11-05 07:58:02', '2022-11-05 07:58:02', '2022-11-05 08:06:33'),
(10, 124, NULL, 9, NULL, '{\"id\":66,\"user_id\":124,\"address\":\"125, Dinajpur Sadar\",\"country\":\"Bangladesh\",\"division\":\"Rangpur\",\"district\":\"Dinajpur\",\"area\":\"Dinajpur Sadar\",\"cost\":\"100\",\"city\":null,\"longitude\":null,\"latitude\":null,\"postal_code\":\"1234\",\"phone\":\"+8801818222333\",\"set_default\":0,\"created_at\":\"2023-01-31 19:05:50\",\"updated_at\":\"2023-01-31 19:05:50\",\"name\":\"Sohel Wmx\",\"email\":\"sohel@walletmix.com\"}', 'pending', 'cash_on_delivery', 'unpaid', NULL, 1150.00, 0.00, '20230131-19063543', 1675170395, 0, 1, 0, NULL, 1, 0, '2023-01-31 13:06:35', '2023-01-31 13:06:35', '2023-01-31 13:07:41'),
(11, 124, NULL, 9, NULL, '{\"id\":66,\"user_id\":124,\"address\":\"125, Dinajpur Sadar\",\"country\":\"Bangladesh\",\"division\":\"Rangpur\",\"district\":\"Dinajpur\",\"area\":\"Dinajpur Sadar\",\"cost\":\"100\",\"city\":null,\"longitude\":null,\"latitude\":null,\"postal_code\":\"1234\",\"phone\":\"+8801818222333\",\"set_default\":0,\"created_at\":\"2023-01-31 19:05:50\",\"updated_at\":\"2023-01-31 19:05:50\",\"name\":\"Sohel Wmx\",\"email\":\"sohel@walletmix.com\"}', 'pending', 'cash_on_delivery', 'unpaid', NULL, 1150.00, 0.00, '20240203-01140726', 1706901247, 0, 0, 0, NULL, 0, 0, '2024-02-02 19:14:07', '2024-02-02 19:14:07', '2024-02-02 19:14:07');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `variation` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double(20,2) DEFAULT NULL,
  `tax` double(20,2) NOT NULL DEFAULT 0.00,
  `shipping_cost` double(20,2) NOT NULL DEFAULT 0.00,
  `quantity` int(11) DEFAULT NULL,
  `payment_status` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unpaid',
  `delivery_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'pending',
  `shipping_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pickup_point_id` int(11) DEFAULT NULL,
  `product_referral_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `attribute_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `seller_id`, `product_id`, `variation`, `price`, `tax`, `shipping_cost`, `quantity`, `payment_status`, `delivery_status`, `shipping_type`, `pickup_point_id`, `product_referral_code`, `created_at`, `updated_at`, `attribute_id`) VALUES
(4, 8, 9, 670, '252', 1150.00, 0.00, 50.00, 1, 'paid', 'delivered', 'home_delivery', NULL, NULL, '2022-11-05 07:58:02', '2022-11-05 08:05:15', '252'),
(6, 10, 9, 670, '250', 1150.00, 0.00, 0.00, 1, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2023-01-31 13:06:35', '2023-01-31 13:06:35', '250'),
(7, 11, 9, 670, '252', 1150.00, 0.00, 0.00, 1, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2024-02-02 19:14:07', '2024-02-02 19:14:07', '252');

-- --------------------------------------------------------

--
-- Table structure for table `otp_configurations`
--

CREATE TABLE `otp_configurations` (
  `id` int(11) NOT NULL,
  `type` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `otp_configurations`
--

INSERT INTO `otp_configurations` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'nexmo', '0', '2020-03-22 09:19:07', '2021-08-24 20:13:56'),
(2, 'otp_for_order', '1', '2020-03-22 09:19:07', '2022-10-25 09:43:22'),
(3, 'otp_for_delivery_status', '1', '2020-03-22 09:19:37', '2022-10-25 09:43:25'),
(4, 'otp_for_paid_status', '1', '2020-03-22 09:19:37', '2022-10-25 09:43:28'),
(5, 'twillo', '0', '2020-03-22 09:54:03', '2021-09-28 09:05:08'),
(6, 'ssl_wireless', '0', '2020-03-22 09:54:03', '2022-02-17 06:56:01'),
(7, 'fast2sms', '0', '2020-03-22 09:54:03', '2020-03-22 03:54:20'),
(8, 'mimo', '0', '2020-12-27 09:54:03', '2022-10-25 09:06:56'),
(9, 'esms', '1', '2022-02-17 08:46:51', '2022-10-25 09:07:00');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `type`, `title`, `slug`, `content`, `meta_title`, `meta_description`, `keywords`, `meta_image`, `created_at`, `updated_at`) VALUES
(1, 'home_page', 'Home Page', 'home', NULL, NULL, NULL, NULL, NULL, '2020-11-04 10:13:20', '2020-11-04 10:13:20'),
(2, 'seller_policy_page', 'Seller Policy Pages', 'sellerpolicy', NULL, NULL, NULL, NULL, NULL, '2020-11-04 10:14:41', '2020-11-04 12:19:30'),
(3, 'return_policy_page', 'Return Policy Page', 'returnpolicy', '<p><b>Returns &amp; Exchanges :\r\n</b></p><p>We know that sometimes you buy something that doesn’t work out the way you had hoped, and for that reason we did our best to make a return policy that is helpful for you. If you are not fully satisfied with the quality of the products you bought, simply bring it back with your receipt/invoice/purchase documents and we will gladly returns and exchange within a period of 24 Hours from the time of receiving the product .But Shipping costs are not refundable .\r\n</p><p><b>What qualifies as a return?\r\n</b></p><p>Any product would qualify as a return if it meets any of the following conditions:</p><ol><li>Wrong product, size or color</li><li>Damaged product</li><li>Product lost in shipment</li><li>Products with major quality defects</li></ol><p>\r\n</p><p><b>How do I return an item?</b><br></p><p>The original invoice slip and exchange form must be enclosed with all returns or exchanges. If you no longer have the return/exchange form please <a href=\"http://localhost/poshakshop/public/uploads/all/zjqa6uSaQYjQihLWqB0G2awsDE3ZFqceo3Li0eAw.pdf\" target=\"_blank\">click here to download the form.</a> Please be sure to print out the form, complete all required information and include it with your return items. We do not accept returns or exchanges without the original invoice slip. You can return your items through courier service to our Dhaka Office or our poshakshop.com outlets-01 at the following address:\r\n</p><p><b>Dhaka Office at the following address:</b></p><ul><li>Poshakshop.com Limited</li><li>House # 25, Road # 14 (First Floor),</li><li>Sector# 13, Uttara Model Town,</li><li>Dhaka ,Bangladesh.</li></ul><p>Alternatively you can bring your return items at any of our outlets at the following address:\r\n</p><p><b>Poshakshop.com (Outlet-01)</b></p><ul><li>Muktijuddha Hazari Market,</li><li>Hazrabari Pouroshova,</li><li>Melandaha, Jamalpur, Bangladesh<br></li></ul><p><b>Exchanging items online and at our outlets:\r\n</b></p><p>Fill out the Return and Exchange Form and indicate the item(s) that you would like to exchange. Pack your exchange securely in the original package and attach the invoice slip and exchange .</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p>', NULL, NULL, NULL, NULL, '2020-11-04 10:14:41', '2022-10-25 06:46:18'),
(4, 'support_policy_page', 'Support Policy Page', 'supportpolicy', NULL, NULL, NULL, NULL, NULL, '2020-11-04 10:14:59', '2020-11-04 10:14:59'),
(5, 'terms_conditions_page', 'Term Conditions Page', 'terms', 'The domain name www.poshakshop.com is owned by Poshakshop.com, whose registered office is at House# 56 , Road# 03 , Flat# A-1, Sector# 13, Uttara Model Town,Dhaka-1230,Bangladesh. Your use of this e-commerce portal and services and tools are governed by the following terms and conditions as applicable to the website. When you visit the website, you are subject to the policies that are applicable here.\r\n<br><br><div>\r\n</div><div>For the purpose of these terms and conditions, wherever the context so requires ‘You’ or ‘User’ or ‘Visitor’ will mean any natural or legal person who has agreed to become a member of the site by signing up. Poshakshop.com allows user to surf the website or making purchases without registering on the website. The term “we”, “us”, “our” will mean Poshakshop.com.\r\n<br><br></div><div>When you use Poshakshop.com, we collect and store your personal information which is provided by you from time to time. Our primary goal in doing so is to provide you a safe, efficient, and customized experience. This allows us to provide services and features that most likely meet your needs. If you choose to buy on the website, we collect information about your buying behavior.\r\n<br><br></div><div>If you choose to mail us or leave feedback, we will collect that information you provide to us. We retain this information as necessary to resolve disputes, provide customer support and troubleshoot problems as permitted by law. In our efforts to continually improve our product and service offerings, we collect and analyze demographic and profile data about our users’ activity on our website. Our website may link to other websites too. These links are provided for your convenience to provide further information. Poshakshop.com is not responsible for the practices, term of use or the content of those linked websites.\r\n<br><br></div><div>This website contains materials which are owned by us. These materials include, but are not limited to, the design, look, appearance, data, and graphics. Reproduction is prohibited other than in accordance with the copyright law. Unauthorized use of this site may give rise to a claim for damages. Products at this e-commerce portalare sold by respective sellers. All materials on this site are protected by copyrights, trademarks, and other intellectual property rights. Material on website is solely for personal and non-commercial use of users. Without the prior written consent of the owner, modification or use of the materials on any other website is violation of the law, and is prohibited.\r\n<br><br></div><div>We reserve the right to change, modify, add or remove portions of these terms and conditions at any time without any prior written notice. If we decide to change the terms and conditions, we will post those changes on this page so that you are always aware of what information we collect and how we use it.</div><div>\r\n</div><div>\r\n</div><div>\r\n</div><div>\r\n</div>', NULL, NULL, NULL, NULL, '2020-11-04 10:15:29', '2022-10-25 06:36:17'),
(6, 'privacy_policy_page', 'Privacy Policy Page', 'privacypolicy', 'This privacy policy sets out how Poshakshop.com uses and protects any information that you give here when you use this website. We view protection of your privacy as a very important principle. We are committed to ensuring your privacy here. Your information will only be used in accordance with this privacy statement whenever we ask you to provide any information by which you can be identified while using this website.\r\n<br><br><div>\r\n</div><div>You will be required to enter a valid phone number while signing up and placing an order on Poshakshop.com . By registering your phone number with us, you consent to be contacted by us via phone calls and/or SMS, in case of any order or delivery related updates. Poshakshop.com will not use your personal information to initiate any promotional phone call or SMS. We store and process your information in computers that are protected by physical as well as reasonable technological security measures.Poshakshop.com may change this privacy policy from time to time if needed by updating this page. Please check this page periodically to ensure that you are happy with our privacy policy.\r\n<br><br></div><div><b>Questions And Contact Information\r\n<br><br></b></div><div>If you would like to: access, correct, amend or delete any personal information we have about you, register a complaint, or simply want more information contact our Customer Service Agent at 01554208456 , 01711663381 or by mail at info@poshakshop.com.\r\n<br><br></div><div><b>Address:\r\n<br><br></b></div><div>House# 56 , Road# 03 , Flat# A-1, Sector# 13, Uttara Model Town, Dhaka-1230,Bangladesh.</div><div>\r\n</div><div>\r\n</div>', NULL, NULL, NULL, NULL, '2020-11-04 10:15:55', '2022-10-25 06:42:43'),
(7, 'custom_page', 'About us', 'about-us', '<p>POSHAKSHOP.COM is a Showroom based Online Clothing Shop in Bangladesh established to give you the best feeling to buy your desire products through Internet. We offer you various categories of quality products which you usually buy from a physical market place like specially Clothing.\r\n</p><p>Visit our website (www.poshakshop.com), we believe you will get your desire products here, chose and order by click or call, our team is ready to get your call and they will response you immediately. You desired product will be delivered to your expected location in Bangladesh within committed time.\r\n</p><p>Our aim is to provide you the “quality products in right price and right time” and build “POSHAKSHOP.COM as your most preferable online Shop”. We are committed to maintain latest trend and fashion in our products. You can order any cloth(Ready Made Garments) items from anywhere in the world, we will deliver your ordered products to your beloved one in Bangladesh. You can buy gift voucher for your beloved one, he/she can buy his/her desired product from POSHAKSHOP.COM with that voucher.\r\n</p><p>We hope we will be always with you, your complain or suggestion will be the best motivation for us to improve POSHAKSHOP.COM more and more.\r\n</p><p>You can call or send email or text to us; our hotline numbers are 01554-208456 &amp; 01711-663381 and our email is <a href=\"mailto:info@poshakshop.com\" target=\"_blank\">info@poshakshop.com</a> or <a href=\"mailto:poshakshop.com@gmail.com\" target=\"_blank\">poshakshop.com@gmail.com</a></p><p>\r\n</p><p>\r\n</p><p>\r\n</p>', NULL, NULL, NULL, NULL, '2022-10-25 06:48:06', '2022-10-25 06:48:06');

-- --------------------------------------------------------

--
-- Table structure for table `page_translations`
--

CREATE TABLE `page_translations` (
  `id` bigint(20) NOT NULL,
  `page_id` bigint(20) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `page_translations`
--

INSERT INTO `page_translations` (`id`, `page_id`, `title`, `content`, `lang`, `created_at`, `updated_at`) VALUES
(1, 5, 'Term Conditions Page', 'The domain name www.poshakshop.com is owned by Poshakshop.com, whose registered office is at House# 56 , Road# 03 , Flat# A-1, Sector# 13, Uttara Model Town,Dhaka-1230,Bangladesh. Your use of this e-commerce portal and services and tools are governed by the following terms and conditions as applicable to the website. When you visit the website, you are subject to the policies that are applicable here.\r\n<br><br><div>\r\n</div><div>For the purpose of these terms and conditions, wherever the context so requires ‘You’ or ‘User’ or ‘Visitor’ will mean any natural or legal person who has agreed to become a member of the site by signing up. Poshakshop.com allows user to surf the website or making purchases without registering on the website. The term “we”, “us”, “our” will mean Poshakshop.com.\r\n<br><br></div><div>When you use Poshakshop.com, we collect and store your personal information which is provided by you from time to time. Our primary goal in doing so is to provide you a safe, efficient, and customized experience. This allows us to provide services and features that most likely meet your needs. If you choose to buy on the website, we collect information about your buying behavior.\r\n<br><br></div><div>If you choose to mail us or leave feedback, we will collect that information you provide to us. We retain this information as necessary to resolve disputes, provide customer support and troubleshoot problems as permitted by law. In our efforts to continually improve our product and service offerings, we collect and analyze demographic and profile data about our users’ activity on our website. Our website may link to other websites too. These links are provided for your convenience to provide further information. Poshakshop.com is not responsible for the practices, term of use or the content of those linked websites.\r\n<br><br></div><div>This website contains materials which are owned by us. These materials include, but are not limited to, the design, look, appearance, data, and graphics. Reproduction is prohibited other than in accordance with the copyright law. Unauthorized use of this site may give rise to a claim for damages. Products at this e-commerce portalare sold by respective sellers. All materials on this site are protected by copyrights, trademarks, and other intellectual property rights. Material on website is solely for personal and non-commercial use of users. Without the prior written consent of the owner, modification or use of the materials on any other website is violation of the law, and is prohibited.\r\n<br><br></div><div>We reserve the right to change, modify, add or remove portions of these terms and conditions at any time without any prior written notice. If we decide to change the terms and conditions, we will post those changes on this page so that you are always aware of what information we collect and how we use it.</div><div>\r\n</div><div>\r\n</div><div>\r\n</div><div>\r\n</div>', 'en', '2021-08-19 17:38:41', '2022-10-25 06:36:17'),
(2, 6, 'Privacy Policy Page', 'This privacy policy sets out how Poshakshop.com uses and protects any information that you give here when you use this website. We view protection of your privacy as a very important principle. We are committed to ensuring your privacy here. Your information will only be used in accordance with this privacy statement whenever we ask you to provide any information by which you can be identified while using this website.\r\n<br><br><div>\r\n</div><div>You will be required to enter a valid phone number while signing up and placing an order on Poshakshop.com . By registering your phone number with us, you consent to be contacted by us via phone calls and/or SMS, in case of any order or delivery related updates. Poshakshop.com will not use your personal information to initiate any promotional phone call or SMS. We store and process your information in computers that are protected by physical as well as reasonable technological security measures.Poshakshop.com may change this privacy policy from time to time if needed by updating this page. Please check this page periodically to ensure that you are happy with our privacy policy.\r\n<br><br></div><div><b>Questions And Contact Information\r\n<br><br></b></div><div>If you would like to: access, correct, amend or delete any personal information we have about you, register a complaint, or simply want more information contact our Customer Service Agent at 01554208456 , 01711663381 or by mail at info@poshakshop.com.\r\n<br><br></div><div><b>Address:\r\n<br><br></b></div><div>House# 56 , Road# 03 , Flat# A-1, Sector# 13, Uttara Model Town, Dhaka-1230,Bangladesh.</div><div>\r\n</div><div>\r\n</div>', 'en', '2021-08-19 17:43:17', '2022-10-25 06:42:43'),
(3, 3, 'Return Policy Page', '<p><b>Returns &amp; Exchanges :\r\n</b></p><p>We know that sometimes you buy something that doesn’t work out the way you had hoped, and for that reason we did our best to make a return policy that is helpful for you. If you are not fully satisfied with the quality of the products you bought, simply bring it back with your receipt/invoice/purchase documents and we will gladly returns and exchange within a period of 24 Hours from the time of receiving the product .But Shipping costs are not refundable .\r\n</p><p><b>What qualifies as a return?\r\n</b></p><p>Any product would qualify as a return if it meets any of the following conditions:</p><ol><li>Wrong product, size or color</li><li>Damaged product</li><li>Product lost in shipment</li><li>Products with major quality defects</li></ol><p>\r\n</p><p><b>How do I return an item?</b><br></p><p>The original invoice slip and exchange form must be enclosed with all returns or exchanges. If you no longer have the return/exchange form please <a href=\"http://localhost/poshakshop/public/uploads/all/zjqa6uSaQYjQihLWqB0G2awsDE3ZFqceo3Li0eAw.pdf\" target=\"_blank\">click here to download the form.</a> Please be sure to print out the form, complete all required information and include it with your return items. We do not accept returns or exchanges without the original invoice slip. You can return your items through courier service to our Dhaka Office or our poshakshop.com outlets-01 at the following address:\r\n</p><p><b>Dhaka Office at the following address:</b></p><ul><li>Poshakshop.com Limited</li><li>House # 25, Road # 14 (First Floor),</li><li>Sector# 13, Uttara Model Town,</li><li>Dhaka ,Bangladesh.</li></ul><p>Alternatively you can bring your return items at any of our outlets at the following address:\r\n</p><p><b>Poshakshop.com (Outlet-01)</b></p><ul><li>Muktijuddha Hazari Market,</li><li>Hazrabari Pouroshova,</li><li>Melandaha, Jamalpur, Bangladesh<br></li></ul><p><b>Exchanging items online and at our outlets:\r\n</b></p><p>Fill out the Return and Exchange Form and indicate the item(s) that you would like to exchange. Pack your exchange securely in the original package and attach the invoice slip and exchange .</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p>', 'en', '2021-08-19 17:45:15', '2022-10-25 06:46:18'),
(4, 7, 'About us', '<p>POSHAKSHOP.COM is a Showroom based Online Clothing Shop in Bangladesh established to give you the best feeling to buy your desire products through Internet. We offer you various categories of quality products which you usually buy from a physical market place like specially Clothing.\r\n</p><p>Visit our website (www.poshakshop.com), we believe you will get your desire products here, chose and order by click or call, our team is ready to get your call and they will response you immediately. You desired product will be delivered to your expected location in Bangladesh within committed time.\r\n</p><p>Our aim is to provide you the “quality products in right price and right time” and build “POSHAKSHOP.COM as your most preferable online Shop”. We are committed to maintain latest trend and fashion in our products. You can order any cloth(Ready Made Garments) items from anywhere in the world, we will deliver your ordered products to your beloved one in Bangladesh. You can buy gift voucher for your beloved one, he/she can buy his/her desired product from POSHAKSHOP.COM with that voucher.\r\n</p><p>We hope we will be always with you, your complain or suggestion will be the best motivation for us to improve POSHAKSHOP.COM more and more.\r\n</p><p>You can call or send email or text to us; our hotline numbers are 01554-208456 &amp; 01711-663381 and our email is <a href=\"mailto:info@poshakshop.com\" target=\"_blank\">info@poshakshop.com</a> or <a href=\"mailto:poshakshop.com@gmail.com\" target=\"_blank\">poshakshop.com@gmail.com</a></p><p>\r\n</p><p>\r\n</p><p>\r\n</p>', 'en', '2022-10-25 06:48:06', '2022-10-25 06:48:06');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `amount` double(20,2) NOT NULL DEFAULT 0.00,
  `payment_details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `txn_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pickup_points`
--

CREATE TABLE `pickup_points` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `pick_up_status` int(1) DEFAULT NULL,
  `cash_on_pickup_status` int(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pickup_points`
--

INSERT INTO `pickup_points` (`id`, `staff_id`, `name`, `address`, `phone`, `pick_up_status`, `cash_on_pickup_status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Khilkhet', 'Khilkhet, Dhaka North Dhaka, 1216', '01717111222', 1, NULL, '2021-08-24 20:19:44', '2021-09-23 11:39:42');

-- --------------------------------------------------------

--
-- Table structure for table `pickup_point_translations`
--

CREATE TABLE `pickup_point_translations` (
  `id` bigint(20) NOT NULL,
  `pickup_point_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pickup_point_translations`
--

INSERT INTO `pickup_point_translations` (`id`, `pickup_point_id`, `name`, `address`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'Khilkhet', 'Khilkhet, Dhaka North Dhaka, 1216', 'en', '2021-08-24 20:19:44', '2021-09-23 11:39:42');

-- --------------------------------------------------------

--
-- Table structure for table `policies`
--

CREATE TABLE `policies` (
  `id` int(11) NOT NULL,
  `name` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `policies`
--

INSERT INTO `policies` (`id`, `name`, `content`, `created_at`, `updated_at`) VALUES
(1, 'support_policy', NULL, '2019-10-29 12:54:45', '2019-01-22 05:13:15'),
(2, 'return_policy', NULL, '2019-10-29 12:54:47', '2019-01-24 05:40:11'),
(4, 'seller_policy', NULL, '2019-10-29 12:54:49', '2019-02-04 17:50:15'),
(5, 'terms', NULL, '2019-10-29 12:54:51', '2019-10-28 18:00:00'),
(6, 'privacy_policy', NULL, '2019-10-29 12:54:54', '2019-10-28 18:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `added_by` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'admin',
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `photos` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail_img` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_provider` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_link` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tags` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` double(20,2) NOT NULL,
  `purchase_price` double(20,2) DEFAULT NULL,
  `variant_product` int(1) NOT NULL DEFAULT 0,
  `attributes` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '[]',
  `choice_options` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `colors` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `variations` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `todays_deal` int(11) NOT NULL DEFAULT 0,
  `published` int(11) NOT NULL DEFAULT 1,
  `approved` tinyint(1) NOT NULL DEFAULT 1,
  `stock_visibility_state` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'quantity',
  `cash_on_delivery` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = On, 0 = Off',
  `featured` int(11) NOT NULL DEFAULT 0,
  `seller_featured` int(11) NOT NULL DEFAULT 0,
  `current_stock` int(10) NOT NULL DEFAULT 0,
  `unit` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `min_qty` int(11) NOT NULL DEFAULT 1,
  `low_stock_quantity` int(11) DEFAULT NULL,
  `discount` double(20,2) DEFAULT NULL,
  `discount_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount_start_date` int(11) DEFAULT NULL,
  `discount_end_date` int(11) DEFAULT NULL,
  `tax` double(20,2) DEFAULT NULL,
  `tax_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'flat_rate',
  `shipping_cost` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_quantity_multiplied` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = Mutiplied with shipping cost',
  `est_shipping_days` int(11) DEFAULT NULL,
  `num_of_sale` int(11) NOT NULL DEFAULT 0,
  `meta_title` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pdf` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `earn_point` double(8,2) NOT NULL DEFAULT 0.00,
  `refundable` int(1) NOT NULL DEFAULT 0,
  `rating` double(8,2) NOT NULL DEFAULT 0.00,
  `barcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `digital` int(1) NOT NULL DEFAULT 0,
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `product_scope` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `warranty` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `emistatus` int(11) DEFAULT NULL,
  `three` int(11) DEFAULT NULL,
  `six` int(11) DEFAULT NULL,
  `nine` int(11) DEFAULT NULL,
  `twelve` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `added_by`, `user_id`, `category_id`, `brand_id`, `photos`, `thumbnail_img`, `video_provider`, `video_link`, `tags`, `description`, `unit_price`, `purchase_price`, `variant_product`, `attributes`, `choice_options`, `colors`, `variations`, `todays_deal`, `published`, `approved`, `stock_visibility_state`, `cash_on_delivery`, `featured`, `seller_featured`, `current_stock`, `unit`, `min_qty`, `low_stock_quantity`, `discount`, `discount_type`, `discount_start_date`, `discount_end_date`, `tax`, `tax_type`, `shipping_type`, `shipping_cost`, `is_quantity_multiplied`, `est_shipping_days`, `num_of_sale`, `meta_title`, `meta_description`, `meta_img`, `pdf`, `slug`, `earn_point`, `refundable`, `rating`, `barcode`, `digital`, `file_name`, `file_path`, `created_at`, `updated_at`, `product_scope`, `warranty`, `emistatus`, `three`, `six`, `nine`, `twelve`) VALUES
(669, 'Men Shirt', 'admin', 9, 297, NULL, '2383,2384,2385', '2383', 'youtube', NULL, 'mens shirt', '<p>Men Shirt(Premium Quality)\r\n</p><p>BRAND: BLUE DREAM\r\n</p><p># Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n</p><p># ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n</p><p># ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n</p><p># ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।</p><p>\r\n</p>', 1450.00, NULL, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"249\",\"250\",\"251\",\"252\"]}]', '[]', NULL, 0, 1, 1, 'quantity', 1, 1, 0, 0, '1', 1, 1, 10.00, 'percent', 1667584800, 1669831140, NULL, NULL, NULL, NULL, 0, NULL, 2, 'Men Shirt', 'Men Shirt(Premium Quality)\r\nBRAND: BLUE DREAM\r\n# Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n# ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n# ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n# ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।', '2383', NULL, 'men-shirt-cdxpe', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2022-10-29 07:52:07', '2022-12-23 15:15:27', 'local', '15 Days', NULL, 0, 0, 0, 0),
(670, 'Men Shirt', 'admin', 9, 297, NULL, '2389,2390,2388,2387', '2389', 'youtube', NULL, 'mens-shirt', '<p>Men Shirt\r\n</p><p>Brand : Blue Dream\r\n</p><p># Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n</p><p># ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n</p><p># ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n</p><p># ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।</p><p>\r\n</p>', 1150.00, NULL, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"249\",\"250\",\"251\",\"252\"]}]', '[]', NULL, 1, 1, 1, 'quantity', 1, 1, 0, 0, '1', 1, 1, 15.00, 'amount', 1667584800, 1669831140, NULL, NULL, NULL, NULL, 0, NULL, 3, 'Men Shirt', 'Men Shirt\r\nBrand : Blue Dream\r\n# Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n# ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n# ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n# ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।', '2389', NULL, 'men-shirt-shxtn', 0.00, 1, 5.00, NULL, 0, NULL, NULL, '2022-10-29 14:11:59', '2024-02-02 19:14:07', 'local', '15 Days', NULL, 0, 0, 0, 0),
(671, 'Men Shirt', 'admin', 9, 297, NULL, '2392,2391', '2392', 'youtube', NULL, 'mens-shirt', '<p>Men Shirt\r\n</p><p>Brand : Blue Dream\r\n</p><p># Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n</p><p># ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n</p><p># ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n</p><p># ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।</p><p>\r\n</p>', 1350.00, NULL, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"249\",\"250\",\"251\",\"252\"]}]', '[]', NULL, 1, 1, 1, 'quantity', 1, 1, 0, 0, '1', 1, 1, 0.00, 'amount', 1667584800, 1669831140, NULL, NULL, NULL, NULL, 0, NULL, 1, 'Men Shirt', 'Men Shirt\r\nBrand : Blue Dream\r\n# Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n# ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n# ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n# ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।', '2392', '2456', 'men-shirt', 0.00, 1, 5.00, '12345', 0, NULL, NULL, '2022-11-12 04:52:14', '2022-11-24 19:53:44', 'local', '15 Days', NULL, 0, 0, 0, 0),
(672, 'Men\'s Basic Shirt', 'admin', 9, 297, NULL, '2393', '2393', 'youtube', NULL, 'Men\'s Basic Shirt', '<p>Men\'s Basic Shirt</p><p>\r\n</p>', 1150.00, NULL, 1, '[\"1\",\"2\"]', '[{\"attribute_id\":\"1\",\"values\":[\"249\",\"250\",\"251\",\"252\"]},{\"attribute_id\":\"2\",\"values\":[\"254\",\"255\",\"256\",\"260\"]}]', '[]', NULL, 1, 1, 1, 'quantity', 1, 1, 0, 0, '1', 1, 1, 0.00, 'amount', 1667584800, 1669831140, NULL, NULL, NULL, NULL, 0, NULL, 1, 'Men\'s Basic Shirt', 'Men\'s Basic Shirt', '2393', NULL, 'men\'s basic shirt', 0.00, 1, 5.00, NULL, 0, NULL, NULL, '2022-11-12 04:58:37', '2022-11-12 11:42:12', 'local', '15 Days', NULL, 0, 0, 0, 0),
(673, 'Men Jacket', 'admin', 9, 297, NULL, '2394,2395', '2394', 'youtube', NULL, 'Men Jacket', '<p>Men Jacket\r\n</p><p>Brand: Blue Dream\r\n</p><p>Fabrication : 100% Cotton Heavy Jersey 200 gsm\r\n</p><p># Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n</p><p># ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n</p><p># ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n</p><p># ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।</p><p>\r\n</p><p>\r\n</p>', 795.00, NULL, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"249\",\"250\",\"251\"]}]', '[]', NULL, 1, 1, 1, 'quantity', 1, 1, 0, 0, '1', 1, 1, 0.00, 'amount', 1667584800, 1669831140, NULL, NULL, NULL, NULL, 0, NULL, 1, 'Men Jacket', 'Men Jacket', '2394', NULL, 'men-jacket', 0.00, 1, 5.00, NULL, 0, NULL, NULL, '2022-11-12 05:06:12', '2022-11-12 11:43:02', 'local', '15 Days', NULL, 0, 0, 0, 0),
(674, 'Men LS T-Shirt', 'admin', 9, 298, NULL, '2396', '2396', 'youtube', NULL, 'Men LS T-Shirt', '<p>Men LS T-Shirt\r\n</p><p>Brand: Blue Dream\r\n</p><p>Fabrication: 100% Cotton Baby French Terry 180-190 Gsm\r\n</p><p># Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n</p><p># ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n</p><p># ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n</p><p># ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।</p><p>\r\n</p><p>\r\n</p><p>\r\n</p>', 660.00, NULL, 1, '[\"1\"]', '[{\"attribute_id\":\"1\",\"values\":[\"249\",\"250\",\"251\"]}]', '[]', NULL, 1, 1, 1, 'quantity', 1, 1, 0, 0, '1', 1, 1, 0.00, 'amount', 1667584800, 1669831140, NULL, NULL, NULL, NULL, 0, NULL, 1, 'Men LS T-Shirt', 'Men LS T-Shirt', '2396', NULL, 'men-ls-t-shirt', 0.00, 1, 5.00, NULL, 0, NULL, NULL, '2022-11-12 05:12:05', '2022-11-12 11:43:21', 'local', '15 Days', NULL, 0, 0, 0, 0),
(675, 'সূতি থ্রি-পিস', 'admin', 9, 309, NULL, '2397,2398,2399,2400', '2397', 'youtube', NULL, 'সূতি থ্রি-পিস', '<p>ফেব্রিক : সূতি\r\n</p><p>কালার : ফিরোজা\r\n</p><p>হাতের কাপড় : থ্রি-পিসটির সাথে হাতের কাপড় দেওয়া আছে।\r\n</p><p>থ্রি-পিসটি লম্বায় : কামিজ ৯৬” ( ২.৫ গজ) | ওরনা ৮৮” ( ২.৫ গজ ) | সালওয়ার ৮২” ( ২.২৫ গজ) । পরিমাপ এ কম বেশি হতে পারে।\r\n</p><p>থ্রি-পিসটির আকর্ষণীয় দিক হচ্ছে কামিজ এবং ওরনা ম্যাচিং কালারে তৈরী করা হয়েছে। সূতি সুতা দিয়ে তৈরি করা হয়েছে ।\r\n</p><p>বি:দ্র:\r\n</p><p>১। ইমেজে পণ্যের রঙ দেখুন; আপনার কম্পিউটার/মোবাইলের রেজুলেশন ও লাইটিং এর জন্য ইমেজ ও প্রকৃত পণ্যের রঙ-এ সামান্য তারতম্য ঘটতে পারে।\r\n</p><p># Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n</p><p># ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n</p><p># ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n</p><p># ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।</p><p>\r\n</p><p>\r\n</p>', 800.00, NULL, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 'quantity', 1, 0, 0, 0, '1', 1, 1, 0.00, 'amount', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 'সূতি থ্রি-পিস', 'ফেব্রিক : সূতি\r\nকালার : ফিরোজা\r\nহাতের কাপড় : থ্রি-পিসটির সাথে হাতের কাপড় দেওয়া আছে।\r\nথ্রি-পিসটি লম্বায় : কামিজ ৯৬” ( ২.৫ গজ) | ওরনা ৮৮” ( ২.৫ গজ ) | সালওয়ার ৮২” ( ২.২৫ গজ) । পরিমাপ এ কম বেশি হতে পারে।\r\nথ্রি-পিসটির আকর্ষণীয় দিক হচ্ছে কামিজ এবং ওরনা ম্যাচিং কালারে তৈরী করা হয়েছে। সূতি সুতা দিয়ে তৈরি করা হয়েছে ।\r\nবি:দ্র:\r\n১। ইমেজে পণ্যের রঙ দেখুন; আপনার কম্পিউটার/মোবাইলের রেজুলেশন ও লাইটিং এর জন্য ইমেজ ও প্রকৃত পণ্যের রঙ-এ সামান্য তারতম্য ঘটতে পারে।\r\n# Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n# ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n# ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n# ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।\r\n\r\n', '2397', NULL, '---1wSIM', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2022-11-12 05:23:35', '2022-11-12 05:23:35', 'local', NULL, NULL, 0, 0, 0, 0),
(676, 'সূতি থ্রি-পিস', 'admin', 9, 309, NULL, '2404,2403,2402,2401', '2404', 'youtube', NULL, 'সূতি থ্রি-পিস', '<p>ফেব্রিক : সূতি\r\n</p><p>কালার : সবুজ\r\n</p><p>হাতের কাপড় : থ্রি-পিসটির সাথে হাতের কাপড় দেওয়া আছে।\r\n</p><p>থ্রি-পিসটি লম্বায় : কামিজ ৯৬” ( ২.৫ গজ) | ওরনা ৮৮” ( ২.৫ গজ ) | সালওয়ার ৮২” ( ২.২৫ গজ) । পরিমাপ এ কম বেশি হতে পারে।\r\n</p><p>থ্রি-পিসটির আকর্ষণীয় দিক হচ্ছে কামিজ এবং ওরনা ম্যাচিং কালারে তৈরী করা হয়েছে। সূতি সুতা দিয়ে তৈরি করা হয়েছে ।\r\n</p><p>বি:দ্র:\r\n</p><p>১। ইমেজে পণ্যের রঙ দেখুন; আপনার কম্পিউটার/মোবাইলের রেজুলেশন ও লাইটিং এর জন্য ইমেজ ও প্রকৃত পণ্যের রঙ-এ সামান্য তারতম্য ঘটতে পারে।\r\n</p><p># Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n</p><p># ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n</p><p># ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n</p><p># ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p>', 800.00, NULL, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 'quantity', 1, 0, 0, 0, '1', 1, 1, 0.00, 'amount', 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 0, 'সূতি থ্রি-পিস', 'ফেব্রিক : সূতি\r\nকালার : ফিরোজা\r\nহাতের কাপড় : থ্রি-পিসটির সাথে হাতের কাপড় দেওয়া আছে।\r\nথ্রি-পিসটি লম্বায় : কামিজ ৯৬” ( ২.৫ গজ) | ওরনা ৮৮” ( ২.৫ গজ ) | সালওয়ার ৮২” ( ২.২৫ গজ) । পরিমাপ এ কম বেশি হতে পারে।\r\nথ্রি-পিসটির আকর্ষণীয় দিক হচ্ছে কামিজ এবং ওরনা ম্যাচিং কালারে তৈরী করা হয়েছে। সূতি সুতা দিয়ে তৈরি করা হয়েছে ।\r\nবি:দ্র:\r\n১। ইমেজে পণ্যের রঙ দেখুন; আপনার কম্পিউটার/মোবাইলের রেজুলেশন ও লাইটিং এর জন্য ইমেজ ও প্রকৃত পণ্যের রঙ-এ সামান্য তারতম্য ঘটতে পারে।\r\n# Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n# ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n# ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n# ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।', '2404', NULL, '---l2u6ashai', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2022-11-12 05:25:47', '2022-11-12 05:27:27', 'local', '15 Days', NULL, 0, 0, 0, 0),
(677, 'সূতি থ্রি-পিস', 'admin', 9, 309, NULL, '2408,2405,2406,2407', '2408', 'youtube', NULL, 'সূতি থ্রি-পিস', '<p>ফেব্রিক : সূতি\r\n</p><p>কালার : কালো\r\n</p><p>হাতের কাপড় : থ্রি-পিসটির সাথে হাতের কাপড় দেওয়া আছে।\r\n</p><p>থ্রি-পিসটি লম্বায় : কামিজ ৯৬” ( ২.৫ গজ) | ওরনা ৮৮” ( ২.৫ গজ ) | সালওয়ার ৮২” ( ২.২৫ গজ) । পরিমাপ এ কম বেশি হতে পারে।\r\n</p><p>থ্রি-পিসটির আকর্ষণীয় দিক হচ্ছে কামিজ এবং ওরনা ম্যাচিং কালারে তৈরী করা হয়েছে। সূতি সুতা দিয়ে তৈরি করা হয়েছে ।\r\n</p><p>বি:দ্র:\r\n</p><p>১। ইমেজে পণ্যের রঙ দেখুন; আপনার কম্পিউটার/মোবাইলের রেজুলেশন ও লাইটিং এর জন্য ইমেজ ও প্রকৃত পণ্যের রঙ-এ সামান্য তারতম্য ঘটতে পারে।\r\n</p><p># Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n</p><p># ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n</p><p># ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n</p><p># ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p>', 800.00, NULL, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 'quantity', 1, 0, 0, 0, '1', 1, 1, 0.00, 'amount', 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 0, 'সূতি থ্রি-পিস', 'ফেব্রিক : সূতি\r\nকালার : কালো\r\nহাতের কাপড় : থ্রি-পিসটির সাথে হাতের কাপড় দেওয়া আছে।\r\nথ্রি-পিসটি লম্বায় : কামিজ ৯৬” ( ২.৫ গজ) | ওরনা ৮৮” ( ২.৫ গজ ) | সালওয়ার ৮২” ( ২.২৫ গজ) । পরিমাপ এ কম বেশি হতে পারে।\r\nথ্রি-পিসটির আকর্ষণীয় দিক হচ্ছে কামিজ এবং ওরনা ম্যাচিং কালারে তৈরী করা হয়েছে। সূতি সুতা দিয়ে তৈরি করা হয়েছে ।\r\n\r\nবি:দ্র:\r\n১। ইমেজে পণ্যের রঙ দেখুন; আপনার কম্পিউটার/মোবাইলের রেজুলেশন ও লাইটিং এর জন্য ইমেজ ও প্রকৃত পণ্যের রঙ-এ সামান্য তারতম্য ঘটতে পারে।\r\n\r\n# Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n# ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n# ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n# ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।', '2408', NULL, '---l2u6yz012cdscsd', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2022-11-12 05:47:03', '2022-11-12 05:49:01', 'local', '15 Days', NULL, 0, 0, 0, 0),
(678, 'সূতি থ্রি-পিস', 'admin', 9, 309, NULL, '2412,2411,2410,2409', '2412', 'youtube', NULL, 'সূতি থ্রি-পিস', '<p>ফেব্রিক : সূতি\r\n</p><p>কালার : গোলাপি\r\n</p><p>হাতের কাপড় : থ্রি-পিসটির সাথে হাতের কাপড় দেওয়া আছে।\r\n</p><p>থ্রি-পিসটি লম্বায় : কামিজ ৯৬” ( ২.৫ গজ) | ওরনা ৮৮” ( ২.৫ গজ ) | সালওয়ার ৮২” ( ২.২৫ গজ) । পরিমাপ এ কম বেশি হতে পারে।\r\n</p><p>থ্রি-পিসটির আকর্ষণীয় দিক হচ্ছে কামিজ এবং ওরনা ম্যাচিং কালারে তৈরী করা হয়েছে। সূতি সুতা দিয়ে তৈরি করা হয়েছে ।\r\n</p><p>বি:দ্র:\r\n</p><p>১। ইমেজে পণ্যের রঙ দেখুন; আপনার কম্পিউটার/মোবাইলের রেজুলেশন ও লাইটিং এর জন্য ইমেজ ও প্রকৃত পণ্যের রঙ-এ সামান্য তারতম্য ঘটতে পারে।\r\n</p><p># Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n</p><p># ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n</p><p># ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n</p><p># ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p>', 800.00, NULL, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 'quantity', 1, 0, 0, 0, '1', 1, 1, 0.00, 'amount', 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 0, 'সূতি থ্রি-পিস', 'ফেব্রিক : সূতি\r\nকালার : গোলাপি\r\nহাতের কাপড় : থ্রি-পিসটির সাথে হাতের কাপড় দেওয়া আছে।\r\nথ্রি-পিসটি লম্বায় : কামিজ ৯৬” ( ২.৫ গজ) | ওরনা ৮৮” ( ২.৫ গজ ) | সালওয়ার ৮২” ( ২.২৫ গজ) । পরিমাপ এ কম বেশি হতে পারে।\r\nথ্রি-পিসটির আকর্ষণীয় দিক হচ্ছে কামিজ এবং ওরনা ম্যাচিং কালারে তৈরী করা হয়েছে। সূতি সুতা দিয়ে তৈরি করা হয়েছে ।\r\n\r\nবি:দ্র:\r\n১। ইমেজে পণ্যের রঙ দেখুন; আপনার কম্পিউটার/মোবাইলের রেজুলেশন ও লাইটিং এর জন্য ইমেজ ও প্রকৃত পণ্যের রঙ-এ সামান্য তারতম্য ঘটতে পারে।\r\n\r\n# Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n# ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n# ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n# ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।', '2412', NULL, '---lydgd12c1ioya', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2022-11-12 05:50:24', '2022-11-12 05:52:04', 'local', '15 Days', NULL, 0, 0, 0, 0),
(679, 'সূতি থ্রি-পিস', 'admin', 9, 309, NULL, '2415,2416,2414,2413', '2415', 'youtube', NULL, 'সূতি থ্রি-পিস', '<p>ফেব্রিক : সূতি\r\n</p><p>কালার : খয়েরি\r\n</p><p>হাতের কাপড় : থ্রি-পিসটির সাথে হাতের কাপড় দেওয়া আছে।\r\n</p><p>থ্রি-পিসটি লম্বায় : কামিজ ৯৬” ( ২.৫ গজ) | ওরনা ৮৮” ( ২.৫ গজ ) | সালওয়ার ৮২” ( ২.২৫ গজ) । পরিমাপ এ কম বেশি হতে পারে।\r\n</p><p>থ্রি-পিসটির আকর্ষণীয় দিক হচ্ছে কামিজ এবং ওরনা ম্যাচিং কালারে তৈরী করা হয়েছে। সূতি সুতা দিয়ে তৈরি করা হয়েছে ।\r\n</p><p>বি:দ্র:\r\n</p><p>১। ইমেজে পণ্যের রঙ দেখুন; আপনার কম্পিউটার/মোবাইলের রেজুলেশন ও লাইটিং এর জন্য ইমেজ ও প্রকৃত পণ্যের রঙ-এ সামান্য তারতম্য ঘটতে পারে।\r\n</p><p># Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n</p><p># ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n</p><p># ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n</p><p># ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p>', 800.00, NULL, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 'quantity', 1, 0, 0, 0, '1', 1, 1, 0.00, 'amount', 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 0, 'সূতি থ্রি-পিস', 'ফেব্রিক : সূতি\r\nকালার : খয়েরি\r\nহাতের কাপড় : থ্রি-পিসটির সাথে হাতের কাপড় দেওয়া আছে।\r\nথ্রি-পিসটি লম্বায় : কামিজ ৯৬” ( ২.৫ গজ) | ওরনা ৮৮” ( ২.৫ গজ ) | সালওয়ার ৮২” ( ২.২৫ গজ) । পরিমাপ এ কম বেশি হতে পারে।\r\nথ্রি-পিসটির আকর্ষণীয় দিক হচ্ছে কামিজ এবং ওরনা ম্যাচিং কালারে তৈরী করা হয়েছে। সূতি সুতা দিয়ে তৈরি করা হয়েছে ।\r\n\r\nবি:দ্র:\r\n১। ইমেজে পণ্যের রঙ দেখুন; আপনার কম্পিউটার/মোবাইলের রেজুলেশন ও লাইটিং এর জন্য ইমেজ ও প্রকৃত পণ্যের রঙ-এ সামান্য তারতম্য ঘটতে পারে।\r\n\r\n# Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n# ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n# ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n# ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।', '2415', NULL, '---ltrfd2c3nkg2', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2022-11-12 05:54:15', '2022-11-12 05:56:05', 'local', '15 Days', NULL, 0, 0, 0, 0),
(680, 'সূতি থ্রি-পিস', 'admin', 9, 309, NULL, '2417,2418,2419,2420', '2417', 'youtube', NULL, 'সূতি থ্রি-পিস', '<p>ফেব্রিক : সূতি\r\n</p><p>কালার : কাচা হলুদ\r\n</p><p>হাতের কাপড় : থ্রি-পিসটির সাথে হাতের কাপড় দেওয়া আছে।\r\n</p><p>থ্রি-পিসটি লম্বায় : কামিজ ৯৬” ( ২.৫ গজ) | ওরনা ৮৮” ( ২.৫ গজ ) | সালওয়ার ৮২” ( ২.২৫ গজ) । পরিমাপ এ কম বেশি হতে পারে।\r\n</p><p>থ্রি-পিসটির আকর্ষণীয় দিক হচ্ছে কামিজ এবং ওরনা ম্যাচিং কালারে তৈরী করা হয়েছে। সূতি সুতা দিয়ে তৈরি করা হয়েছে ।\r\n</p><p>বি:দ্র:\r\n</p><p>১। ইমেজে পণ্যের রঙ দেখুন; আপনার কম্পিউটার/মোবাইলের রেজুলেশন ও লাইটিং এর জন্য ইমেজ ও প্রকৃত পণ্যের রঙ-এ সামান্য তারতম্য ঘটতে পারে।\r\n</p><p># Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n</p><p># ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n</p><p># ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n</p><p># ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p>', 800.00, NULL, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 'quantity', 1, 0, 0, 0, '1', 1, 1, 0.00, 'amount', 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 0, 'সূতি থ্রি-পিস', 'ফেব্রিক : সূতি\r\nকালার : কাচা হলুদ\r\nহাতের কাপড় : থ্রি-পিসটির সাথে হাতের কাপড় দেওয়া আছে।\r\nথ্রি-পিসটি লম্বায় : কামিজ ৯৬” ( ২.৫ গজ) | ওরনা ৮৮” ( ২.৫ গজ ) | সালওয়ার ৮২” ( ২.২৫ গজ) । পরিমাপ এ কম বেশি হতে পারে।\r\nথ্রি-পিসটির আকর্ষণীয় দিক হচ্ছে কামিজ এবং ওরনা ম্যাচিং কালারে তৈরী করা হয়েছে। সূতি সুতা দিয়ে তৈরি করা হয়েছে ।\r\n\r\nবি:দ্র:\r\n১। ইমেজে পণ্যের রঙ দেখুন; আপনার কম্পিউটার/মোবাইলের রেজুলেশন ও লাইটিং এর জন্য ইমেজ ও প্রকৃত পণ্যের রঙ-এ সামান্য তারতম্য ঘটতে পারে।\r\n\r\n# Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n# ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n# ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n# ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।', '2417', NULL, '---kehjfdkajhkas', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2022-11-12 05:57:51', '2022-11-12 05:59:36', 'local', '15 Days', NULL, 0, 0, 0, 0),
(681, 'Girls Top', 'admin', 9, 311, NULL, '2424,2425,2426', '2424', 'youtube', NULL, 'Girls Top', '<p>Girls Top\r\n</p><p>Made in China</p>', 650.00, NULL, 1, '[\"3\"]', '[{\"attribute_id\":\"3\",\"values\":[\"264\",\"266\"]}]', '[]', NULL, 0, 1, 1, 'quantity', 1, 0, 0, 0, '1', 1, 1, 0.00, 'amount', 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 0, 'Girls Top', 'Girls Top\r\nMade in China', '2424', NULL, 'girls-top-3e34', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2022-11-12 09:11:34', '2022-11-12 09:18:45', 'local', '15 Days', NULL, 0, 0, 0, 0),
(682, 'Girls Top', 'admin', 9, 311, NULL, '2423,2422,2421', '2423', 'youtube', NULL, 'Girls Top', '<p>Girls Top\r\n</p><p>Made in China</p>', 650.00, NULL, 1, '[\"3\"]', '[{\"attribute_id\":\"3\",\"values\":[\"264\",\"266\"]}]', '[]', NULL, 0, 1, 1, 'quantity', 1, 0, 0, 0, '1', 1, 1, 0.00, 'amount', 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 0, 'Girls Top', 'Girls Top\r\nMade in China', '2423', NULL, 'girls-toptdrug', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2022-11-12 09:20:49', '2022-11-12 09:22:03', 'local', '15 Days', NULL, 0, 0, 0, 0),
(683, 'Girls Top', 'admin', 9, 311, NULL, '2427,2428,2429', '2427', 'youtube', NULL, 'Girls Top', '<p>Girls Top\r\n</p><p>Made in China</p>', 650.00, NULL, 1, '[\"3\"]', '[{\"attribute_id\":\"3\",\"values\":[\"264\",\"266\"]}]', '[]', NULL, 0, 1, 1, 'quantity', 1, 0, 0, 0, '1', 1, 1, 0.00, 'amount', 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 0, 'Girls Top', 'Girls Top\r\nMade in China', '2427', NULL, 'girls-topgo0or', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2022-11-12 09:23:58', '2022-11-12 09:25:06', 'local', '15 Days', NULL, 0, 0, 0, 0),
(684, 'Girls Top', 'admin', 9, 311, NULL, '2431,2430', '2431', 'youtube', NULL, 'Girls Top', '<p>Girls Top\r\n</p><p>Made in China</p>', 650.00, NULL, 1, '[\"3\"]', '[{\"attribute_id\":\"3\",\"values\":[\"264\",\"266\"]}]', '[]', NULL, 0, 1, 1, 'quantity', 1, 0, 0, 0, '1', 1, 1, 0.00, 'amount', 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 0, 'Girls Top', 'Girls Top\r\nMade in China', '2431', NULL, 'girls-topwdxeg', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2022-11-12 09:26:34', '2022-11-12 09:27:43', 'local', '15 Days', NULL, 0, 0, 0, 0),
(686, 'ছোট বাচ্চাদের শাড়ি', 'admin', 9, 312, NULL, '2435,2434,2433,2432', '2435', 'youtube', NULL, 'ছোট বাচ্চাদের শাড়ি', '<p>ফেব্রিক : সূতি\r\n</p><p>কালার : হলুদ\r\n</p><p>ব্লাউজ পিস : শাড়িটির সাথে ব্লাউজ পিস নাই\r\n</p><p>শাড়িটি লম্বায় : ৯ হাত (১৫৩”) এবং বহর এ ২.৫ হাত (৩৮”)\r\n</p><p>বয়স : ৬-৭ বছর\r\n</p><p>ডিজাইন : আকর্ষণীয় সূতি ডিজাইন সূতি শাড়ি ।\r\n</p><p>শাড়িটির আকর্ষণীয় দিক হচ্ছে আচঁল, বডি এবং কুচি ম্যাচিং কালারে তৈরী করা হয়েছে। সূতি সুতা দিয়ে কাজ করা হয়েছে।\r\n</p><p>বি:দ্র:\r\n</p><p>১। ইমেজে পণ্যের রঙ দেখুন; আপনার কম্পিউটার/মোবাইলের রেজুলেশন ও লাইটিং এর জন্য ইমেজ ও প্রকৃত পণ্যের রঙ-এ সামান্য তারতম্য ঘটতে পারে।\r\n</p><p># Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n</p><p># ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n</p><p># ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n</p><p># ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।</p><p>\r\n</p><p>\r\n</p>', 550.00, NULL, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 'quantity', 1, 0, 0, 0, '1', 1, 1, 0.00, 'amount', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 'ছোট বাচ্চাদের শাড়ি', 'ফেব্রিক : সূতি\r\nকালার : হলুদ\r\nব্লাউজ পিস : শাড়িটির সাথে ব্লাউজ পিস নাই\r\nশাড়িটি লম্বায় : ৯ হাত (১৫৩”) এবং বহর এ ২.৫ হাত (৩৮”)\r\nবয়স : ৬-৭ বছর\r\nডিজাইন : আকর্ষণীয় সূতি ডিজাইন সূতি শাড়ি ।\r\nশাড়িটির আকর্ষণীয় দিক হচ্ছে আচঁল, বডি এবং কুচি ম্যাচিং কালারে তৈরী করা হয়েছে। সূতি সুতা দিয়ে কাজ করা হয়েছে।\r\nবি:দ্র:\r\n১। ইমেজে পণ্যের রঙ দেখুন; আপনার কম্পিউটার/মোবাইলের রেজুলেশন ও লাইটিং এর জন্য ইমেজ ও প্রকৃত পণ্যের রঙ-এ সামান্য তারতম্য ঘটতে পারে।\r\n# Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n# ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n# ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n# ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।\r\n\r\n', '2435', NULL, '---FGNLi', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2022-11-12 09:35:45', '2022-11-12 09:35:45', 'local', NULL, NULL, 0, 0, 0, 0),
(687, 'ছোট বাচ্চাদের শাড়ি', 'admin', 9, 312, NULL, '2436,2437,2438,2439', '2436', 'youtube', NULL, 'ছোট বাচ্চাদের শাড়ি', '<p>ফেব্রিক : সূতি\r\n</p><p>কালার : হলুদ\r\n</p><p>ব্লাউজ পিস : শাড়িটির সাথে ব্লাউজ পিস নাই\r\n</p><p>শাড়িটি লম্বায় : ৯ হাত (১৫৩”) এবং বহর এ ২.৫ হাত (৩৮”)\r\n</p><p>বয়স : ৬-৭ বছর\r\n</p><p>ডিজাইন : আকর্ষণীয় সূতি ডিজাইন সূতি শাড়ি ।\r\n</p><p>শাড়িটির আকর্ষণীয় দিক হচ্ছে আচঁল, বডি এবং কুচি ম্যাচিং কালারে তৈরী করা হয়েছে। সূতি সুতা দিয়ে কাজ করা হয়েছে।\r\n</p><p>বি:দ্র:\r\n</p><p>১। ইমেজে পণ্যের রঙ দেখুন; আপনার কম্পিউটার/মোবাইলের রেজুলেশন ও লাইটিং এর জন্য ইমেজ ও প্রকৃত পণ্যের রঙ-এ সামান্য তারতম্য ঘটতে পারে।\r\n</p><p># Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n</p><p># ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n</p><p># ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n</p><p># ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।</p><p>\r\n</p><p>\r\n</p>', 550.00, NULL, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 'quantity', 1, 0, 0, 0, '1', 1, 1, 0.00, 'amount', 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 0, 'ছোট বাচ্চাদের শাড়ি', 'ফেব্রিক : সূতি\r\nকালার : লাল\r\nব্লাউজ পিস : শাড়িটির সাথে ব্লাউজ পিস নাই\r\nশাড়িটি লম্বায় : ৯ হাত (১৫৩”) এবং বহর এ ২.৫ হাত (৩৮”)\r\nবয়স : ৬-৭ বছর\r\nডিজাইন : আকর্ষণীয় সূতি ডিজাইন সূতি শাড়ি ।\r\nশাড়িটির আকর্ষণীয় দিক হচ্ছে আচঁল, বডি এবং কুচি ম্যাচিং কালারে তৈরী করা হয়েছে। সূতি সুতা দিয়ে কাজ করা হয়েছে।\r\n\r\nবি:দ্র:\r\n১। ইমেজে পণ্যের রঙ দেখুন; আপনার কম্পিউটার/মোবাইলের রেজুলেশন ও লাইটিং এর জন্য ইমেজ ও প্রকৃত পণ্যের রঙ-এ সামান্য তারতম্য ঘটতে পারে।\r\n\r\n# Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n# ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n# ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n# ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।', '2436', NULL, '---owo5detv', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2022-11-12 09:36:46', '2022-11-12 09:38:32', 'local', '15 Days', NULL, 0, 0, 0, 0),
(688, 'Parachute Naturale Shampoo Damage Repair 340ml (80ml Shampoo Free)', 'admin', 9, 313, NULL, '2441,2440', '2440', 'youtube', NULL, 'Parachute Naturale Shampoo', '<p>Product details of Parachute Naturale Shampoo Damage Repair 340ml (80ml Shampoo Free)\r\n</p><p>-Product type: Shampoo\r\n</p><p>-Brand:Parachute Naturale\r\n</p><p>-Capacity:340ml\r\n</p><p>-Damage Repair\r\n</p><p>-Country of Origin:Bangladesh\r\n</p><p>-Shelf Life:24 Months\r\n</p><p># Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n</p><p># ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n</p><p># ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n</p><p># ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।</p><p>\r\n</p>', 340.00, NULL, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 'quantity', 1, 0, 0, 0, '1', 1, 1, 0.00, 'amount', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 'Parachute Naturale Shampoo Damage Repair 340ml (80ml Shampoo Free)', 'Product details of Parachute Naturale Shampoo Damage Repair 340ml (80ml Shampoo Free)\r\n-Product type: Shampoo\r\n-Brand:Parachute Naturale\r\n-Capacity:340ml\r\n-Damage Repair\r\n-Country of Origin:Bangladesh\r\n-Shelf Life:24 Months\r\n# Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n# ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n# ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n# ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।\r\n', '2440', NULL, 'Parachute-Naturale-Shampoo-Damage-Repair-340ml-80ml-Shampoo-Free-5GMds', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2022-11-12 09:47:45', '2022-11-12 09:47:45', 'local', NULL, NULL, 0, 0, 0, 0),
(689, 'Garnier Men OilClean Fairness Cream', 'admin', 9, 313, NULL, '2442', '2442', 'youtube', NULL, 'Garnier Men OilClean Fairness Cream', '<p>Product details of Men Oil Clear Oil Control Fairness Cream - 20g Get Garnier 75ml Shampoo Free\r\n</p><p>- Immediate visible fairness from first application while controlling sweat and oil at the skins surface\r\n</p><p>- Intensive fairness action gives a lasting fair look\r\n</p><p>- Peri-lite helps keep skin clean, sweat and oil-free\r\n</p><p>- Everyday life drains energy out of your skin\r\n</p><p>- Fuel your skin with natural energy\r\n</p><p>- Fresh and light formula adapted to men’s skin\r\n</p><p>- Proven efficacy</p><p>\r\n</p>', 135.00, NULL, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 'quantity', 1, 0, 0, 0, '1', 1, 1, 0.00, 'amount', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 'Garnier Men OilClean Fairness Cream', 'Product details of Men Oil Clear Oil Control Fairness Cream - 20g Get Garnier 75ml Shampoo Free\r\n- Immediate visible fairness from first application while controlling sweat and oil at the skins surface\r\n- Intensive fairness action gives a lasting fair look\r\n- Peri-lite helps keep skin clean, sweat and oil-free\r\n- Everyday life drains energy out of your skin\r\n- Fuel your skin with natural energy\r\n- Fresh and light formula adapted to men’s skin\r\n- Proven efficacy\r\n', '2442', NULL, 'Garnier-Men-OilClean-Fairness-Cream-zjmqP', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2022-11-12 09:49:54', '2022-11-12 09:49:54', 'local', NULL, NULL, 0, 0, 0, 0),
(690, 'Neckles with Earrings', 'admin', 9, 313, NULL, '2443', '2443', 'youtube', NULL, 'Neckles with Earrings', '<p>Crystal Neckles with Earrings\r\n</p><p>সম্পূর্ন নতুন আঙ্গিকে আর একেবারে ভিন্ন মাত্রায় এবং উন্নত মানের - ব্যাবহারের ওপর পাচ্ছেন ৬ মাসের গ্যারান্টি।\r\n</p><p># Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n</p><p># ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n</p><p># ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n</p><p># ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।</p><p>\r\n</p>', 1050.00, NULL, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 'quantity', 1, 0, 0, 0, '1', 1, 1, 0.00, 'amount', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 'Neckles with Earrings', 'Crystal Neckles with Earrings\r\nসম্পূর্ন নতুন আঙ্গিকে আর একেবারে ভিন্ন মাত্রায় এবং উন্নত মানের - ব্যাবহারের ওপর পাচ্ছেন ৬ মাসের গ্যারান্টি।\r\n# Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n# ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n# ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n# ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।\r\n', '2443', NULL, 'Neckles-with-Earrings-WS3Th', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2022-11-12 09:51:56', '2022-11-12 09:51:56', 'local', NULL, NULL, 0, 0, 0, 0),
(691, 'Neckles with Earrings', 'admin', 9, 313, NULL, '2444', '2444', 'youtube', NULL, 'Neckles with Earrings', '<p>সম্পূর্ন নতুন আঙ্গিকে আর একেবারে ভিন্ন মাত্রায় এবং উন্নত মানের - ব্যাবহারের ওপর পাচ্ছেন ৬ মাসের গ্যারান্টি।\r\n</p><p># Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n</p><p># ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n</p><p># ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n</p><p># ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।</p><p>\r\n</p><p>\r\n</p>', 950.00, NULL, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 'quantity', 1, 0, 0, 0, '1', 1, 1, 0.00, 'amount', 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 0, 'Neckles with Earrings', 'সম্পূর্ন নতুন আঙ্গিকে আর একেবারে ভিন্ন মাত্রায় এবং উন্নত মানের - ব্যাবহারের ওপর পাচ্ছেন ৬ মাসের গ্যারান্টি।\r\n\r\n# Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n# ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n# ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n# ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।', '2444', NULL, 'neckles-with-earrings-xbywp', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2022-11-12 09:52:45', '2022-11-12 09:54:37', 'local', '15 Days', NULL, 0, 0, 0, 0),
(692, 'Neckles with Earrings', 'admin', 9, 313, NULL, '2445', '2445', 'youtube', NULL, 'Neckles with Earrings', '<p>সম্পূর্ন নতুন আঙ্গিকে আর একেবারে ভিন্ন মাত্রায় এবং উন্নত মানের - ব্যাবহারের ওপর পাচ্ছেন ৬ মাসের গ্যারান্টি।\r\n</p><p># Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n</p><p># ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n</p><p># ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n</p><p># ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।</p><p>\r\n</p><p>\r\n</p><p>\r\n</p>', 750.00, NULL, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 'quantity', 1, 0, 0, 0, '1', 1, 1, 0.00, 'amount', 0, 0, NULL, NULL, NULL, NULL, 0, NULL, 0, 'Neckles with Earrings', 'সম্পূর্ন নতুন আঙ্গিকে আর একেবারে ভিন্ন মাত্রায় এবং উন্নত মানের - ব্যাবহারের ওপর পাচ্ছেন ৬ মাসের গ্যারান্টি।\r\n\r\n# Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n# ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n# ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n# ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।', '2445', NULL, 'neckles-with-earrings-noh3u', 0.00, 1, 0.00, NULL, 0, NULL, NULL, '2022-11-12 09:55:23', '2022-11-12 09:56:47', 'local', '15 Days', NULL, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sku` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double(20,2) NOT NULL DEFAULT 0.00,
  `qty` int(11) NOT NULL DEFAULT 0,
  `image` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_stocks`
--

INSERT INTO `product_stocks` (`id`, `product_id`, `variant`, `sku`, `price`, `qty`, `image`, `created_at`, `updated_at`) VALUES
(4699, 675, '', NULL, 800.00, 10, NULL, '2022-11-12 05:23:35', '2022-11-12 05:23:35'),
(4701, 676, '', NULL, 800.00, 10, NULL, '2022-11-12 05:27:27', '2022-11-12 05:27:27'),
(4703, 677, '', NULL, 800.00, 10, NULL, '2022-11-12 05:49:01', '2022-11-12 05:49:01'),
(4705, 678, '', NULL, 800.00, 10, NULL, '2022-11-12 05:52:04', '2022-11-12 05:52:04'),
(4707, 679, '', NULL, 800.00, 10, NULL, '2022-11-12 05:56:05', '2022-11-12 05:56:05'),
(4709, 680, '', NULL, 800.00, 10, NULL, '2022-11-12 05:59:36', '2022-11-12 05:59:36'),
(4714, 681, '264', '264', 650.00, 10, NULL, '2022-11-12 09:18:45', '2022-11-12 09:18:45'),
(4715, 681, '266', '266', 650.00, 10, NULL, '2022-11-12 09:18:45', '2022-11-12 09:18:45'),
(4718, 682, '264', '264', 650.00, 10, NULL, '2022-11-12 09:22:02', '2022-11-12 09:22:02'),
(4719, 682, '266', '266', 650.00, 10, NULL, '2022-11-12 09:22:03', '2022-11-12 09:22:03'),
(4722, 683, '264', '264', 650.00, 10, NULL, '2022-11-12 09:25:06', '2022-11-12 09:25:06'),
(4723, 683, '266', '266', 650.00, 10, NULL, '2022-11-12 09:25:06', '2022-11-12 09:25:06'),
(4726, 684, '264', '264', 650.00, 10, NULL, '2022-11-12 09:27:43', '2022-11-12 09:27:43'),
(4727, 684, '266', '266', 650.00, 10, NULL, '2022-11-12 09:27:43', '2022-11-12 09:27:43'),
(4730, 686, '', NULL, 550.00, 10, NULL, '2022-11-12 09:35:45', '2022-11-12 09:35:45'),
(4732, 687, '', NULL, 550.00, 10, NULL, '2022-11-12 09:38:32', '2022-11-12 09:38:32'),
(4733, 688, '', NULL, 340.00, 10, NULL, '2022-11-12 09:47:45', '2022-11-12 09:47:45'),
(4734, 689, '', NULL, 135.00, 10, NULL, '2022-11-12 09:49:54', '2022-11-12 09:49:54'),
(4735, 690, '', NULL, 1050.00, 10, NULL, '2022-11-12 09:51:56', '2022-11-12 09:51:56'),
(4737, 691, '', NULL, 950.00, 10, NULL, '2022-11-12 09:54:37', '2022-11-12 09:54:37'),
(4739, 692, '', NULL, 750.00, 10, NULL, '2022-11-12 09:56:47', '2022-11-12 09:56:47'),
(4740, 669, '249', NULL, 1450.00, 10, NULL, '2022-11-12 11:40:52', '2023-01-31 12:49:22'),
(4741, 669, '250', NULL, 1450.00, 10, NULL, '2022-11-12 11:40:52', '2022-11-12 11:40:52'),
(4742, 669, '251', NULL, 1450.00, 10, NULL, '2022-11-12 11:40:52', '2022-11-12 11:40:52'),
(4743, 669, '252', NULL, 1450.00, 10, NULL, '2022-11-12 11:40:52', '2022-11-12 11:40:52'),
(4744, 670, '249', NULL, 1150.00, 10, NULL, '2022-11-12 11:41:16', '2022-11-12 11:41:16'),
(4745, 670, '250', NULL, 1150.00, 9, NULL, '2022-11-12 11:41:16', '2023-01-31 13:06:35'),
(4746, 670, '251', NULL, 1150.00, 10, NULL, '2022-11-12 11:41:16', '2022-11-12 11:41:16'),
(4747, 670, '252', NULL, 1150.00, 8, NULL, '2022-11-12 11:41:16', '2024-02-02 19:14:07'),
(4752, 672, '249-254', '249-254', 1150.00, 10, NULL, '2022-11-12 11:42:11', '2022-11-12 11:42:11'),
(4753, 672, '249-255', '249-255', 1150.00, 10, NULL, '2022-11-12 11:42:11', '2022-11-12 11:42:11'),
(4754, 672, '249-256', '249-256', 1150.00, 10, NULL, '2022-11-12 11:42:11', '2022-11-12 11:42:11'),
(4755, 672, '249-260', '249-260', 1150.00, 10, NULL, '2022-11-12 11:42:11', '2022-11-12 11:42:11'),
(4756, 672, '250-254', '250-254', 1150.00, 10, NULL, '2022-11-12 11:42:11', '2022-11-12 11:42:11'),
(4757, 672, '250-255', '250-255', 1150.00, 10, NULL, '2022-11-12 11:42:12', '2022-11-12 11:42:12'),
(4758, 672, '250-256', '250-256', 1150.00, 10, NULL, '2022-11-12 11:42:12', '2022-11-12 11:42:12'),
(4759, 672, '250-260', '250-260', 1150.00, 10, NULL, '2022-11-12 11:42:12', '2022-11-12 11:42:12'),
(4760, 672, '251-254', '251-254', 1150.00, 10, NULL, '2022-11-12 11:42:12', '2022-11-12 11:42:12'),
(4761, 672, '251-255', '251-255', 1150.00, 10, NULL, '2022-11-12 11:42:12', '2022-11-12 11:42:12'),
(4762, 672, '251-256', '251-256', 1150.00, 10, NULL, '2022-11-12 11:42:12', '2022-11-12 11:42:12'),
(4763, 672, '251-260', '251-260', 1150.00, 10, NULL, '2022-11-12 11:42:12', '2022-11-12 11:42:12'),
(4764, 672, '252-254', '252-254', 1150.00, 10, NULL, '2022-11-12 11:42:12', '2022-11-12 11:42:12'),
(4765, 672, '252-255', '252-255', 1150.00, 10, NULL, '2022-11-12 11:42:12', '2022-11-12 11:42:12'),
(4766, 672, '252-256', '252-256', 1150.00, 10, NULL, '2022-11-12 11:42:12', '2022-11-12 11:42:12'),
(4767, 672, '252-260', '252-260', 1150.00, 10, NULL, '2022-11-12 11:42:12', '2022-11-12 11:42:12'),
(4768, 673, '249', '249', 795.00, 10, NULL, '2022-11-12 11:43:02', '2022-11-12 11:43:02'),
(4769, 673, '250', '250', 795.00, 10, NULL, '2022-11-12 11:43:02', '2022-11-12 11:43:02'),
(4770, 673, '251', '251', 795.00, 10, NULL, '2022-11-12 11:43:02', '2022-11-12 11:43:02'),
(4771, 674, '249', '249', 660.00, 10, NULL, '2022-11-12 11:43:21', '2022-11-12 11:43:21'),
(4772, 674, '250', '250', 660.00, 10, NULL, '2022-11-12 11:43:21', '2022-11-12 11:43:21'),
(4773, 674, '251', '251', 660.00, 10, NULL, '2022-11-12 11:43:21', '2022-11-12 11:43:21'),
(4790, 671, '249', NULL, 1350.00, 10, NULL, '2022-11-24 19:53:44', '2022-11-24 19:53:44'),
(4791, 671, '250', NULL, 1350.00, 10, NULL, '2022-11-24 19:53:44', '2022-11-24 19:53:44'),
(4792, 671, '251', NULL, 1350.00, 10, NULL, '2022-11-24 19:53:44', '2022-11-24 19:53:44'),
(4793, 671, '252', NULL, 1350.00, 9, NULL, '2022-11-24 19:53:44', '2022-11-24 19:53:44');

-- --------------------------------------------------------

--
-- Table structure for table `product_taxes`
--

CREATE TABLE `product_taxes` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `tax_id` int(11) NOT NULL,
  `tax` double(20,2) NOT NULL,
  `tax_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_translations`
--

CREATE TABLE `product_translations` (
  `id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_translations`
--

INSERT INTO `product_translations` (`id`, `product_id`, `name`, `unit`, `description`, `lang`, `created_at`, `updated_at`) VALUES
(665, 669, 'Men Shirt', '1', '<p>Men Shirt(Premium Quality)\r\n</p><p>BRAND: BLUE DREAM\r\n</p><p># Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n</p><p># ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n</p><p># ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n</p><p># ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।</p><p>\r\n</p>', 'en', '2022-10-29 07:52:07', '2022-10-29 07:52:07'),
(666, 670, 'Men Shirt', '1', '<p>Men Shirt\r\n</p><p>Brand : Blue Dream\r\n</p><p># Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n</p><p># ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n</p><p># ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n</p><p># ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।</p><p>\r\n</p>', 'en', '2022-10-29 14:11:59', '2022-10-29 14:11:59'),
(667, 671, 'Men Shirt', '1', '<p>Men Shirt\r\n</p><p>Brand : Blue Dream\r\n</p><p># Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n</p><p># ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n</p><p># ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n</p><p># ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।</p><p>\r\n</p>', 'en', '2022-11-12 04:55:31', '2022-11-12 04:55:31'),
(668, 672, 'Men\'s Basic Shirt', '1', '<p>Men\'s Basic Shirt</p><p>\r\n</p>', 'en', '2022-11-12 05:02:07', '2022-11-12 05:02:07'),
(669, 673, 'Men Jacket', '1', '<p>Men Jacket\r\n</p><p>Brand: Blue Dream\r\n</p><p>Fabrication : 100% Cotton Heavy Jersey 200 gsm\r\n</p><p># Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n</p><p># ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n</p><p># ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n</p><p># ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।</p><p>\r\n</p><p>\r\n</p>', 'en', '2022-11-12 05:09:34', '2022-11-12 05:09:34'),
(670, 674, 'Men LS T-Shirt', '1', '<p>Men LS T-Shirt\r\n</p><p>Brand: Blue Dream\r\n</p><p>Fabrication: 100% Cotton Baby French Terry 180-190 Gsm\r\n</p><p># Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n</p><p># ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n</p><p># ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n</p><p># ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।</p><p>\r\n</p><p>\r\n</p><p>\r\n</p>', 'en', '2022-11-12 05:14:43', '2022-11-12 05:14:43'),
(671, 675, 'সূতি থ্রি-পিস', '1', '<p>ফেব্রিক : সূতি\r\n</p><p>কালার : ফিরোজা\r\n</p><p>হাতের কাপড় : থ্রি-পিসটির সাথে হাতের কাপড় দেওয়া আছে।\r\n</p><p>থ্রি-পিসটি লম্বায় : কামিজ ৯৬” ( ২.৫ গজ) | ওরনা ৮৮” ( ২.৫ গজ ) | সালওয়ার ৮২” ( ২.২৫ গজ) । পরিমাপ এ কম বেশি হতে পারে।\r\n</p><p>থ্রি-পিসটির আকর্ষণীয় দিক হচ্ছে কামিজ এবং ওরনা ম্যাচিং কালারে তৈরী করা হয়েছে। সূতি সুতা দিয়ে তৈরি করা হয়েছে ।\r\n</p><p>বি:দ্র:\r\n</p><p>১। ইমেজে পণ্যের রঙ দেখুন; আপনার কম্পিউটার/মোবাইলের রেজুলেশন ও লাইটিং এর জন্য ইমেজ ও প্রকৃত পণ্যের রঙ-এ সামান্য তারতম্য ঘটতে পারে।\r\n</p><p># Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n</p><p># ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n</p><p># ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n</p><p># ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।</p><p>\r\n</p><p>\r\n</p>', 'en', '2022-11-12 05:23:35', '2022-11-12 05:23:35'),
(672, 676, 'সূতি থ্রি-পিস', '1', '<p>ফেব্রিক : সূতি\r\n</p><p>কালার : সবুজ\r\n</p><p>হাতের কাপড় : থ্রি-পিসটির সাথে হাতের কাপড় দেওয়া আছে।\r\n</p><p>থ্রি-পিসটি লম্বায় : কামিজ ৯৬” ( ২.৫ গজ) | ওরনা ৮৮” ( ২.৫ গজ ) | সালওয়ার ৮২” ( ২.২৫ গজ) । পরিমাপ এ কম বেশি হতে পারে।\r\n</p><p>থ্রি-পিসটির আকর্ষণীয় দিক হচ্ছে কামিজ এবং ওরনা ম্যাচিং কালারে তৈরী করা হয়েছে। সূতি সুতা দিয়ে তৈরি করা হয়েছে ।\r\n</p><p>বি:দ্র:\r\n</p><p>১। ইমেজে পণ্যের রঙ দেখুন; আপনার কম্পিউটার/মোবাইলের রেজুলেশন ও লাইটিং এর জন্য ইমেজ ও প্রকৃত পণ্যের রঙ-এ সামান্য তারতম্য ঘটতে পারে।\r\n</p><p># Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n</p><p># ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n</p><p># ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n</p><p># ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p>', 'en', '2022-11-12 05:27:27', '2022-11-12 05:27:27'),
(673, 677, 'সূতি থ্রি-পিস', '1', '<p>ফেব্রিক : সূতি\r\n</p><p>কালার : কালো\r\n</p><p>হাতের কাপড় : থ্রি-পিসটির সাথে হাতের কাপড় দেওয়া আছে।\r\n</p><p>থ্রি-পিসটি লম্বায় : কামিজ ৯৬” ( ২.৫ গজ) | ওরনা ৮৮” ( ২.৫ গজ ) | সালওয়ার ৮২” ( ২.২৫ গজ) । পরিমাপ এ কম বেশি হতে পারে।\r\n</p><p>থ্রি-পিসটির আকর্ষণীয় দিক হচ্ছে কামিজ এবং ওরনা ম্যাচিং কালারে তৈরী করা হয়েছে। সূতি সুতা দিয়ে তৈরি করা হয়েছে ।\r\n</p><p>বি:দ্র:\r\n</p><p>১। ইমেজে পণ্যের রঙ দেখুন; আপনার কম্পিউটার/মোবাইলের রেজুলেশন ও লাইটিং এর জন্য ইমেজ ও প্রকৃত পণ্যের রঙ-এ সামান্য তারতম্য ঘটতে পারে।\r\n</p><p># Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n</p><p># ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n</p><p># ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n</p><p># ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p>', 'en', '2022-11-12 05:49:01', '2022-11-12 05:49:01'),
(674, 678, 'সূতি থ্রি-পিস', '1', '<p>ফেব্রিক : সূতি\r\n</p><p>কালার : গোলাপি\r\n</p><p>হাতের কাপড় : থ্রি-পিসটির সাথে হাতের কাপড় দেওয়া আছে।\r\n</p><p>থ্রি-পিসটি লম্বায় : কামিজ ৯৬” ( ২.৫ গজ) | ওরনা ৮৮” ( ২.৫ গজ ) | সালওয়ার ৮২” ( ২.২৫ গজ) । পরিমাপ এ কম বেশি হতে পারে।\r\n</p><p>থ্রি-পিসটির আকর্ষণীয় দিক হচ্ছে কামিজ এবং ওরনা ম্যাচিং কালারে তৈরী করা হয়েছে। সূতি সুতা দিয়ে তৈরি করা হয়েছে ।\r\n</p><p>বি:দ্র:\r\n</p><p>১। ইমেজে পণ্যের রঙ দেখুন; আপনার কম্পিউটার/মোবাইলের রেজুলেশন ও লাইটিং এর জন্য ইমেজ ও প্রকৃত পণ্যের রঙ-এ সামান্য তারতম্য ঘটতে পারে।\r\n</p><p># Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n</p><p># ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n</p><p># ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n</p><p># ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p>', 'en', '2022-11-12 05:52:04', '2022-11-12 05:52:04'),
(675, 679, 'সূতি থ্রি-পিস', '1', '<p>ফেব্রিক : সূতি\r\n</p><p>কালার : খয়েরি\r\n</p><p>হাতের কাপড় : থ্রি-পিসটির সাথে হাতের কাপড় দেওয়া আছে।\r\n</p><p>থ্রি-পিসটি লম্বায় : কামিজ ৯৬” ( ২.৫ গজ) | ওরনা ৮৮” ( ২.৫ গজ ) | সালওয়ার ৮২” ( ২.২৫ গজ) । পরিমাপ এ কম বেশি হতে পারে।\r\n</p><p>থ্রি-পিসটির আকর্ষণীয় দিক হচ্ছে কামিজ এবং ওরনা ম্যাচিং কালারে তৈরী করা হয়েছে। সূতি সুতা দিয়ে তৈরি করা হয়েছে ।\r\n</p><p>বি:দ্র:\r\n</p><p>১। ইমেজে পণ্যের রঙ দেখুন; আপনার কম্পিউটার/মোবাইলের রেজুলেশন ও লাইটিং এর জন্য ইমেজ ও প্রকৃত পণ্যের রঙ-এ সামান্য তারতম্য ঘটতে পারে।\r\n</p><p># Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n</p><p># ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n</p><p># ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n</p><p># ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p>', 'en', '2022-11-12 05:56:05', '2022-11-12 05:56:05'),
(676, 680, 'সূতি থ্রি-পিস', '1', '<p>ফেব্রিক : সূতি\r\n</p><p>কালার : কাচা হলুদ\r\n</p><p>হাতের কাপড় : থ্রি-পিসটির সাথে হাতের কাপড় দেওয়া আছে।\r\n</p><p>থ্রি-পিসটি লম্বায় : কামিজ ৯৬” ( ২.৫ গজ) | ওরনা ৮৮” ( ২.৫ গজ ) | সালওয়ার ৮২” ( ২.২৫ গজ) । পরিমাপ এ কম বেশি হতে পারে।\r\n</p><p>থ্রি-পিসটির আকর্ষণীয় দিক হচ্ছে কামিজ এবং ওরনা ম্যাচিং কালারে তৈরী করা হয়েছে। সূতি সুতা দিয়ে তৈরি করা হয়েছে ।\r\n</p><p>বি:দ্র:\r\n</p><p>১। ইমেজে পণ্যের রঙ দেখুন; আপনার কম্পিউটার/মোবাইলের রেজুলেশন ও লাইটিং এর জন্য ইমেজ ও প্রকৃত পণ্যের রঙ-এ সামান্য তারতম্য ঘটতে পারে।\r\n</p><p># Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n</p><p># ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n</p><p># ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n</p><p># ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p><p>\r\n</p>', 'en', '2022-11-12 05:59:36', '2022-11-12 05:59:36'),
(677, 681, 'Girls Top', '1', '<p>Girls Top\r\n</p><p>Made in China</p>', 'en', '2022-11-12 09:11:34', '2022-11-12 09:11:34'),
(678, 682, 'Girls Top', '1', '<p>Girls Top\r\n</p><p>Made in China</p>', 'en', '2022-11-12 09:22:03', '2022-11-12 09:22:03'),
(679, 683, 'Girls Top', '1', '<p>Girls Top\r\n</p><p>Made in China</p>', 'en', '2022-11-12 09:25:06', '2022-11-12 09:25:06'),
(680, 684, 'Girls Top', '1', '<p>Girls Top\r\n</p><p>Made in China</p>', 'en', '2022-11-12 09:27:43', '2022-11-12 09:27:43'),
(681, 686, 'ছোট বাচ্চাদের শাড়ি', '1', '<p>ফেব্রিক : সূতি\r\n</p><p>কালার : হলুদ\r\n</p><p>ব্লাউজ পিস : শাড়িটির সাথে ব্লাউজ পিস নাই\r\n</p><p>শাড়িটি লম্বায় : ৯ হাত (১৫৩”) এবং বহর এ ২.৫ হাত (৩৮”)\r\n</p><p>বয়স : ৬-৭ বছর\r\n</p><p>ডিজাইন : আকর্ষণীয় সূতি ডিজাইন সূতি শাড়ি ।\r\n</p><p>শাড়িটির আকর্ষণীয় দিক হচ্ছে আচঁল, বডি এবং কুচি ম্যাচিং কালারে তৈরী করা হয়েছে। সূতি সুতা দিয়ে কাজ করা হয়েছে।\r\n</p><p>বি:দ্র:\r\n</p><p>১। ইমেজে পণ্যের রঙ দেখুন; আপনার কম্পিউটার/মোবাইলের রেজুলেশন ও লাইটিং এর জন্য ইমেজ ও প্রকৃত পণ্যের রঙ-এ সামান্য তারতম্য ঘটতে পারে।\r\n</p><p># Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n</p><p># ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n</p><p># ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n</p><p># ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।</p><p>\r\n</p><p>\r\n</p>', 'en', '2022-11-12 09:35:45', '2022-11-12 09:35:45'),
(682, 687, 'ছোট বাচ্চাদের শাড়ি', '1', '<p>ফেব্রিক : সূতি\r\n</p><p>কালার : হলুদ\r\n</p><p>ব্লাউজ পিস : শাড়িটির সাথে ব্লাউজ পিস নাই\r\n</p><p>শাড়িটি লম্বায় : ৯ হাত (১৫৩”) এবং বহর এ ২.৫ হাত (৩৮”)\r\n</p><p>বয়স : ৬-৭ বছর\r\n</p><p>ডিজাইন : আকর্ষণীয় সূতি ডিজাইন সূতি শাড়ি ।\r\n</p><p>শাড়িটির আকর্ষণীয় দিক হচ্ছে আচঁল, বডি এবং কুচি ম্যাচিং কালারে তৈরী করা হয়েছে। সূতি সুতা দিয়ে কাজ করা হয়েছে।\r\n</p><p>বি:দ্র:\r\n</p><p>১। ইমেজে পণ্যের রঙ দেখুন; আপনার কম্পিউটার/মোবাইলের রেজুলেশন ও লাইটিং এর জন্য ইমেজ ও প্রকৃত পণ্যের রঙ-এ সামান্য তারতম্য ঘটতে পারে।\r\n</p><p># Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n</p><p># ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n</p><p># ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n</p><p># ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।</p><p>\r\n</p><p>\r\n</p>', 'en', '2022-11-12 09:38:33', '2022-11-12 09:38:33'),
(683, 688, 'Parachute Naturale Shampoo Damage Repair 340ml (80ml Shampoo Free)', '1', '<p>Product details of Parachute Naturale Shampoo Damage Repair 340ml (80ml Shampoo Free)\r\n</p><p>-Product type: Shampoo\r\n</p><p>-Brand:Parachute Naturale\r\n</p><p>-Capacity:340ml\r\n</p><p>-Damage Repair\r\n</p><p>-Country of Origin:Bangladesh\r\n</p><p>-Shelf Life:24 Months\r\n</p><p># Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n</p><p># ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n</p><p># ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n</p><p># ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।</p><p>\r\n</p>', 'en', '2022-11-12 09:47:45', '2022-11-12 09:47:45'),
(684, 689, 'Garnier Men OilClean Fairness Cream', '1', '<p>Product details of Men Oil Clear Oil Control Fairness Cream - 20g Get Garnier 75ml Shampoo Free\r\n</p><p>- Immediate visible fairness from first application while controlling sweat and oil at the skins surface\r\n</p><p>- Intensive fairness action gives a lasting fair look\r\n</p><p>- Peri-lite helps keep skin clean, sweat and oil-free\r\n</p><p>- Everyday life drains energy out of your skin\r\n</p><p>- Fuel your skin with natural energy\r\n</p><p>- Fresh and light formula adapted to men’s skin\r\n</p><p>- Proven efficacy</p><p>\r\n</p>', 'en', '2022-11-12 09:49:54', '2022-11-12 09:49:54'),
(685, 690, 'Neckles with Earrings', '1', '<p>Crystal Neckles with Earrings\r\n</p><p>সম্পূর্ন নতুন আঙ্গিকে আর একেবারে ভিন্ন মাত্রায় এবং উন্নত মানের - ব্যাবহারের ওপর পাচ্ছেন ৬ মাসের গ্যারান্টি।\r\n</p><p># Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n</p><p># ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n</p><p># ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n</p><p># ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।</p><p>\r\n</p>', 'en', '2022-11-12 09:51:56', '2022-11-12 09:51:56'),
(686, 691, 'Neckles with Earrings', '1', '<p>সম্পূর্ন নতুন আঙ্গিকে আর একেবারে ভিন্ন মাত্রায় এবং উন্নত মানের - ব্যাবহারের ওপর পাচ্ছেন ৬ মাসের গ্যারান্টি।\r\n</p><p># Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n</p><p># ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n</p><p># ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n</p><p># ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।</p><p>\r\n</p><p>\r\n</p>', 'en', '2022-11-12 09:54:37', '2022-11-12 09:54:37'),
(687, 692, 'Neckles with Earrings', '1', '<p>সম্পূর্ন নতুন আঙ্গিকে আর একেবারে ভিন্ন মাত্রায় এবং উন্নত মানের - ব্যাবহারের ওপর পাচ্ছেন ৬ মাসের গ্যারান্টি।\r\n</p><p># Cash on Delivery Available only for Dhaka City- (পন্য বুঝে টাকা দিন)\r\n</p><p># ঢাকার ভিতরে : হোম ডেলিভারী (ডেলিভারি চার্জ ৪০ টাকা )\r\n</p><p># ঢাকার বাইরে: আমরা জননী, সুন্দরবন ,এস,এ পরিবহন,করোতোয়া কুরিয়ার এর মাধ্যমে ডেলিভারি করে থাকি (ডেলিভারি চার্জ ৭০ টাকা).\r\n</p><p># ফোনে অর্ডার করতে কিংবা যেকোনো জিজ্ঞাসায় কল করুন ০১৫৫৪২০৮৪৫৬ , ০১৭১১৬৬৩৩৮১ নাম্বারে অথবা ইনবক্স করুন।</p><p>\r\n</p><p>\r\n</p><p>\r\n</p>', 'en', '2022-11-12 09:56:47', '2022-11-12 09:56:47');

-- --------------------------------------------------------

--
-- Table structure for table `proxypay_payments`
--

CREATE TABLE `proxypay_payments` (
  `id` int(11) NOT NULL,
  `payment_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `reference_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double(25,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_requests`
--

CREATE TABLE `refund_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_detail_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `seller_approval` int(1) NOT NULL DEFAULT 0,
  `admin_approval` int(1) NOT NULL DEFAULT 0,
  `refund_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `reason` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_seen` int(11) NOT NULL,
  `refund_status` int(1) NOT NULL DEFAULT 0,
  `reject_reason` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `comment` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `viewed` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `product_id`, `user_id`, `rating`, `comment`, `status`, `viewed`, `created_at`, `updated_at`) VALUES
(1, 670, 140, 5, 'Nice Febric', 1, 0, '2022-11-05 08:18:10', '2022-11-05 08:18:10');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 'Manager', '[\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\"]', '2018-10-10 04:39:47', '2021-08-24 20:17:54'),
(2, 'Accountant', '[\"2\",\"3\"]', '2018-10-10 04:52:09', '2018-10-10 04:52:09'),
(3, 'Client', '[\"2\",\"3\",\"4\",\"6\",\"7\",\"8\",\"10\",\"12\",\"13\",\"22\",\"23\"]', '2022-10-18 10:19:55', '2022-10-18 10:19:55');

-- --------------------------------------------------------

--
-- Table structure for table `role_translations`
--

CREATE TABLE `role_translations` (
  `id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_translations`
--

INSERT INTO `role_translations` (`id`, `role_id`, `name`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'Manager', 'en', '2021-08-18 18:52:45', '2021-08-18 18:52:45'),
(2, 3, 'Client', 'en', '2022-10-18 10:19:55', '2022-10-18 10:19:55');

-- --------------------------------------------------------

--
-- Table structure for table `searches`
--

CREATE TABLE `searches` (
  `id` int(11) NOT NULL,
  `query` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `searches`
--

INSERT INTO `searches` (`id`, `query`, `count`, `created_at`, `updated_at`) VALUES
(3, 'laptop', 2, '2022-04-17 08:38:37', '2022-04-17 08:46:46');

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `verification_status` int(1) NOT NULL DEFAULT 0,
  `verification_info` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `cash_on_delivery_status` int(1) NOT NULL DEFAULT 0,
  `admin_to_pay` double(20,2) NOT NULL DEFAULT 0.00,
  `bank_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_acc_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_acc_no` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_routing_no` int(50) DEFAULT NULL,
  `bank_payment_status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller_withdraw_requests`
--

CREATE TABLE `seller_withdraw_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` double(20,2) DEFAULT NULL,
  `message` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `viewed` int(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seo_settings`
--

CREATE TABLE `seo_settings` (
  `id` int(11) NOT NULL,
  `keyword` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `revisit` int(11) NOT NULL,
  `sitemap_link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sliders` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `pick_up_point_id` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_cost` double(20,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(11) NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT 1,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_templates`
--

CREATE TABLE `sms_templates` (
  `id` int(11) NOT NULL,
  `identifier` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sms_body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `template_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sms_templates`
--

INSERT INTO `sms_templates` (`id`, `identifier`, `sms_body`, `template_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'phone_number_verification', 'Use OTP [[code]] as your login code for [[site_name]] This code is valid for 1 minute. Please do not share it with anyone.', NULL, 0, '2021-06-07 13:29:22', '2022-11-05 07:32:18'),
(2, 'password_reset', 'Your password reset code is [[code]].', NULL, 1, '2021-06-07 13:29:34', '2021-06-07 13:29:34'),
(3, 'order_placement', 'Your order has been placed and Order Code is [[order_code]]', NULL, 1, '2021-06-07 13:32:22', '2021-06-08 02:39:25'),
(4, 'delivery_status_change', 'Your delivery status has been updated to [[delivery_status]]  for Order code : [[order_code]]', NULL, 1, '2021-06-07 13:33:14', '2021-06-08 02:39:28'),
(5, 'payment_status_change', 'Your payment status has been updated to [[payment_status]] for Order code : [[order_code]]', NULL, 1, '2021-06-07 13:35:23', '2021-06-08 02:39:31'),
(6, 'assign_delivery_boy', 'You are assigned to deliver an order. Order code : [[order_code]]', NULL, 1, '2021-06-07 13:38:10', '2021-06-08 02:39:34');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 35, 1, '2021-08-24 20:16:59', '2021-08-24 20:16:59'),
(2, 131, 3, '2022-10-18 10:20:25', '2022-10-18 10:20:25');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(11) NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tax_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 = Inactive, 1 = Active',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `name`, `tax_status`, `created_at`, `updated_at`) VALUES
(3, 'Tax', 0, '2021-03-07 11:45:33', '2021-11-25 11:00:56'),
(5, 'Making Charges', 0, '2021-11-25 10:34:13', '2021-11-25 11:00:57');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `code` int(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `files` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `viewed` int(1) NOT NULL DEFAULT 0,
  `client_viewed` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_replies`
--

CREATE TABLE `ticket_replies` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reply` longtext COLLATE utf8_unicode_ci NOT NULL,
  `files` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(11) NOT NULL,
  `lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang_key` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang_value` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `lang`, `lang_key`, `lang_value`, `created_at`, `updated_at`) VALUES
(27141, 'en', 'All uploaded files', 'All uploaded files', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27142, 'en', 'Upload New File', 'Upload New File', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27143, 'en', 'All files', 'All files', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27144, 'en', 'Sort by newest', 'Sort by newest', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27145, 'en', 'Sort by oldest', 'Sort by oldest', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27146, 'en', 'Sort by smallest', 'Sort by smallest', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27147, 'en', 'Sort by largest', 'Sort by largest', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27148, 'en', 'Search your files', 'Search your files', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27149, 'en', 'Search', 'Search', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27150, 'en', 'Delete Confirmation', 'Delete Confirmation', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27151, 'en', 'Are you sure to delete this file?', 'Are you sure to delete this file?', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27152, 'en', 'Cancel', 'Cancel', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27153, 'en', 'Delete', 'Delete', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27154, 'en', 'File Info', 'File Info', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27155, 'en', 'Link copied to clipboard', 'Link copied to clipboard', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27156, 'en', 'Oops, unable to copy', 'Oops, unable to copy', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27157, 'en', 'Nothing selected', 'Nothing selected', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27158, 'en', 'Nothing found', 'Nothing found', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27159, 'en', 'Choose file', 'Choose file', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27160, 'en', 'File selected', 'File selected', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27161, 'en', 'Files selected', 'Files selected', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27162, 'en', 'Add more files', 'Add more files', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27163, 'en', 'Adding more files', 'Adding more files', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27164, 'en', 'Drop files here, paste or', 'Drop files here, paste or', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27165, 'en', 'Browse', 'Browse', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27166, 'en', 'Upload complete', 'Upload complete', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27167, 'en', 'Upload paused', 'Upload paused', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27168, 'en', 'Resume upload', 'Resume upload', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27169, 'en', 'Pause upload', 'Pause upload', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27170, 'en', 'Retry upload', 'Retry upload', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27171, 'en', 'Cancel upload', 'Cancel upload', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27172, 'en', 'Uploading', 'Uploading', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27173, 'en', 'Processing', 'Processing', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27174, 'en', 'Complete', 'Complete', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27175, 'en', 'File', 'File', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27176, 'en', 'Files', 'Files', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27177, 'en', 'Search in menu', 'Search in menu', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27178, 'en', 'Dashboard', 'Dashboard', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27179, 'en', 'POS System', 'POS System', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27180, 'en', 'POS Manager', 'POS Manager', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27181, 'en', 'POS Configuration', 'POS Configuration', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27182, 'en', 'Products', 'Products', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27183, 'en', 'Add New product', 'Add New product', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27184, 'en', 'All Products', 'All Products', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27185, 'en', 'In House Products', 'In House Products', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27186, 'en', 'Digital Products', 'Digital Products', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27187, 'en', 'Bulk Import', 'Bulk Import', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27188, 'en', 'Bulk Export', 'Bulk Export', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27189, 'en', 'Category', 'Category', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27190, 'en', 'Brand', 'Brand', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27191, 'en', 'Attribute', 'Attribute', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27192, 'en', 'Colors', 'Colors', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27193, 'en', 'Product Reviews', 'Product Reviews', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27194, 'en', 'Sales', 'Sales', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27195, 'en', 'All Orders', 'All Orders', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27196, 'en', 'Inhouse orders', 'Inhouse orders', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27197, 'en', 'Seller Orders', 'Seller Orders', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27198, 'en', 'Pick-up Point Order', 'Pick-up Point Order', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27199, 'en', 'Delivery Boy', 'Delivery Boy', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27200, 'en', 'All Delivery Boy', 'All Delivery Boy', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27201, 'en', 'Add Delivery Boy', 'Add Delivery Boy', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27202, 'en', 'Cancel Request', 'Cancel Request', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27203, 'en', 'Configuration', 'Configuration', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27204, 'en', 'Refunds', 'Refunds', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27205, 'en', 'Refund Requests', 'Refund Requests', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27206, 'en', 'Approved Refunds', 'Approved Refunds', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27207, 'en', 'rejected Refunds', 'rejected Refunds', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27208, 'en', 'Refund Configuration', 'Refund Configuration', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27209, 'en', 'Customers', 'Customers', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27210, 'en', 'Customer list', 'Customer list', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27211, 'en', 'Uploaded Files', 'Uploaded Files', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27212, 'en', 'Reports', 'Reports', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27213, 'en', 'In House Product Sale', 'In House Product Sale', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27214, 'en', 'Seller Products Sale', 'Seller Products Sale', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27215, 'en', 'Products Stock', 'Products Stock', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27216, 'en', 'Products wishlist', 'Products wishlist', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27217, 'en', 'User Searches', 'User Searches', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27218, 'en', 'Commission History', 'Commission History', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27219, 'en', 'Wallet Recharge History', 'Wallet Recharge History', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27220, 'en', 'Blog System', 'Blog System', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27221, 'en', 'All Posts', 'All Posts', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27222, 'en', 'Categories', 'Categories', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27223, 'en', 'Marketing', 'Marketing', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27224, 'en', 'Flash deals', 'Flash deals', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27225, 'en', 'Newsletters', 'Newsletters', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27226, 'en', 'Bulk SMS', 'Bulk SMS', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27227, 'en', 'Subscribers', 'Subscribers', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27228, 'en', 'Coupon', 'Coupon', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27229, 'en', 'Support', 'Support', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27230, 'en', 'Ticket', 'Ticket', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27231, 'en', 'Product Queries', 'Product Queries', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27232, 'en', 'Affiliate System', 'Affiliate System', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27233, 'en', 'Affiliate Registration Form', 'Affiliate Registration Form', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27234, 'en', 'Affiliate Configurations', 'Affiliate Configurations', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27235, 'en', 'Affiliate Users', 'Affiliate Users', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27236, 'en', 'Referral Users', 'Referral Users', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27237, 'en', 'Affiliate Withdraw Requests', 'Affiliate Withdraw Requests', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27238, 'en', 'Affiliate Logs', 'Affiliate Logs', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27239, 'en', 'Club Point System', 'Club Point System', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27240, 'en', 'Club Point Configurations', 'Club Point Configurations', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27241, 'en', 'Set Product Point', 'Set Product Point', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27242, 'en', 'User Points', 'User Points', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27243, 'en', 'OTP System', 'OTP System', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27244, 'en', 'OTP Configurations', 'OTP Configurations', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27245, 'en', 'SMS Templates', 'SMS Templates', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27246, 'en', 'Set OTP Credentials', 'Set OTP Credentials', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27247, 'en', 'Website Setup', 'Website Setup', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27248, 'en', 'Header', 'Header', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27249, 'en', 'Footer', 'Footer', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27250, 'en', 'Pages', 'Pages', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27251, 'en', 'Appearance', 'Appearance', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27252, 'en', 'Setup & Configurations', 'Setup & Configurations', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27253, 'en', 'General Settings', 'General Settings', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27254, 'en', 'Features activation', 'Features activation', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27255, 'en', 'Languages', 'Languages', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27256, 'en', 'Currency', 'Currency', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27257, 'en', 'Vat & TAX', 'Vat & TAX', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27258, 'en', 'Pickup point', 'Pickup point', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27259, 'en', 'SMTP Settings', 'SMTP Settings', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27260, 'en', 'Payment Methods', 'Payment Methods', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27261, 'en', 'File System & Cache Configuration', 'File System & Cache Configuration', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27262, 'en', 'Social media Logins', 'Social media Logins', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27263, 'en', 'Facebook', 'Facebook', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27264, 'en', 'Facebook Chat', 'Facebook Chat', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27265, 'en', 'Facebook Comment', 'Facebook Comment', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27266, 'en', 'Google', 'Google', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27267, 'en', 'Analytics Tools', 'Analytics Tools', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27268, 'en', 'Google reCAPTCHA', 'Google reCAPTCHA', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27269, 'en', 'Google Map', 'Google Map', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27270, 'en', 'Google Firebase', 'Google Firebase', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27271, 'en', 'Shipping', 'Shipping', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27272, 'en', 'Shipping Configuration', 'Shipping Configuration', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27273, 'en', 'Shipping Countries', 'Shipping Countries', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27274, 'en', 'Shipping Cities', 'Shipping Cities', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27275, 'en', 'Staffs', 'Staffs', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27276, 'en', 'All staffs', 'All staffs', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27277, 'en', 'Staff permissions', 'Staff permissions', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27278, 'en', 'System', 'System', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27279, 'en', 'Update', 'Update', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27280, 'en', 'Server status', 'Server status', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27281, 'en', 'Addon Manager', 'Addon Manager', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27282, 'en', 'Browse Website', 'Browse Website', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27283, 'en', 'POS', 'POS', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27284, 'en', 'Notifications', 'Notifications', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27285, 'en', 'Order code: ', 'Order code: ', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27286, 'en', 'has been Placed', 'has been Placed', '2021-10-17 06:49:10', '2021-10-17 06:49:10'),
(27287, 'en', 'View All Notifications', 'View All Notifications', '2021-10-17 06:49:11', '2021-10-17 06:49:11'),
(27288, 'en', 'Profile', 'Profile', '2021-10-17 06:49:11', '2021-10-17 06:49:11'),
(27289, 'en', 'Logout', 'Logout', '2021-10-17 06:49:11', '2021-10-17 06:49:11'),
(27290, 'en', 'Terms & conditions', 'Terms & conditions', '2021-10-17 06:49:22', '2021-10-17 06:49:22'),
(27291, 'en', 'Return Policy', 'Return Policy', '2021-10-17 06:49:22', '2021-10-17 06:49:22'),
(27292, 'en', 'Support Policy', 'Support Policy', '2021-10-17 06:49:22', '2021-10-17 06:49:22'),
(27293, 'en', 'Privacy Policy', 'Privacy Policy', '2021-10-17 06:49:22', '2021-10-17 06:49:22'),
(27294, 'en', 'Your Email Address', 'Your Email Address', '2021-10-17 06:49:22', '2021-10-17 06:49:22'),
(27295, 'en', 'Subscribe', 'Subscribe', '2021-10-17 06:49:22', '2021-10-17 06:49:22'),
(27296, 'en', 'Contact Info', 'Contact Info', '2021-10-17 06:49:22', '2021-10-17 06:49:22'),
(27297, 'en', 'Address', 'Address', '2021-10-17 06:49:22', '2021-10-17 06:49:22'),
(27298, 'en', 'Phone', 'Phone', '2021-10-17 06:49:22', '2021-10-17 06:49:22'),
(27299, 'en', 'Email', 'Email', '2021-10-17 06:49:22', '2021-10-17 06:49:22'),
(27300, 'en', 'My Account', 'My Account', '2021-10-17 06:49:22', '2021-10-17 06:49:22'),
(27301, 'en', 'Order History', 'Order History', '2021-10-17 06:49:22', '2021-10-17 06:49:22'),
(27302, 'en', 'My Wishlist', 'My Wishlist', '2021-10-17 06:49:22', '2021-10-17 06:49:22'),
(27303, 'en', 'Track Order', 'Track Order', '2021-10-17 06:49:22', '2021-10-17 06:49:22'),
(27304, 'en', 'Be an affiliate partner', 'Be an affiliate partner', '2021-10-17 06:49:22', '2021-10-17 06:49:22'),
(27305, 'en', 'Home', 'Home', '2021-10-17 06:49:22', '2021-10-17 06:49:22'),
(27306, 'en', 'Cart', 'Cart', '2021-10-17 06:49:22', '2021-10-17 06:49:22'),
(27307, 'en', 'Account', 'Account', '2021-10-17 06:49:22', '2021-10-17 06:49:22'),
(27308, 'en', 'Confirmation', 'Confirmation', '2021-10-17 06:49:22', '2021-10-17 06:49:22'),
(27309, 'en', 'Delete confirmation message', 'Delete confirmation message', '2021-10-17 06:49:22', '2021-10-17 06:49:22'),
(27310, 'en', 'Item has been removed from cart', 'Item has been removed from cart', '2021-10-17 06:49:22', '2021-10-17 06:49:22'),
(27311, 'en', 'Item has been added to compare list', 'Item has been added to compare list', '2021-10-17 06:49:22', '2021-10-17 06:49:22'),
(27312, 'en', 'Please login first', 'Please login first', '2021-10-17 06:49:22', '2021-10-17 06:49:22'),
(27313, 'en', 'Please choose all the options', 'Please choose all the options', '2021-10-17 06:49:22', '2021-10-17 06:49:22'),
(27314, 'en', 'Featured Products', 'Featured Products', '2021-10-17 06:49:23', '2021-10-17 06:49:23'),
(27315, 'en', 'Best Selling', 'Best Selling', '2021-10-17 06:49:23', '2021-10-17 06:49:23'),
(27316, 'en', 'Top 20', 'Top 20', '2021-10-17 06:49:23', '2021-10-17 06:49:23'),
(27317, 'en', 'All Customers', 'All Customers', '2021-10-17 06:49:52', '2021-10-17 06:49:52'),
(27318, 'en', 'Bulk Action', 'Bulk Action', '2021-10-17 06:49:52', '2021-10-17 06:49:52'),
(27319, 'en', 'Delete selection', 'Delete selection', '2021-10-17 06:49:52', '2021-10-17 06:49:52'),
(27320, 'en', 'Type email or name & Enter', 'Type email or name & Enter', '2021-10-17 06:49:52', '2021-10-17 06:49:52'),
(27321, 'en', 'Name', 'Name', '2021-10-17 06:49:52', '2021-10-17 06:49:52'),
(27322, 'en', 'Email Address', 'Email Address', '2021-10-17 06:49:52', '2021-10-17 06:49:52'),
(27323, 'en', 'Package', 'Package', '2021-10-17 06:49:52', '2021-10-17 06:49:52'),
(27324, 'en', 'Wallet Balance', 'Wallet Balance', '2021-10-17 06:49:52', '2021-10-17 06:49:52'),
(27325, 'en', 'Options', 'Options', '2021-10-17 06:49:52', '2021-10-17 06:49:52'),
(27326, 'en', 'Log in as this Customer', 'Log in as this Customer', '2021-10-17 06:49:52', '2021-10-17 06:49:52'),
(27327, 'en', 'Ban this Customer', 'Ban this Customer', '2021-10-17 06:49:52', '2021-10-17 06:49:52'),
(27328, 'en', 'Do you really want to ban this Customer?', 'Do you really want to ban this Customer?', '2021-10-17 06:49:52', '2021-10-17 06:49:52'),
(27329, 'en', 'Proceed!', 'Proceed!', '2021-10-17 06:49:52', '2021-10-17 06:49:52'),
(27330, 'en', 'Do you really want to unban this Customer?', 'Do you really want to unban this Customer?', '2021-10-17 06:49:52', '2021-10-17 06:49:52'),
(27331, 'en', 'Are you sure to delete this?', 'Are you sure to delete this?', '2021-10-17 06:49:52', '2021-10-17 06:49:52'),
(27332, 'en', 'Please Configure SMTP Setting to work all email sending functionality', 'Please Configure SMTP Setting to work all email sending functionality', '2021-10-17 06:49:58', '2021-10-17 06:49:58'),
(27333, 'en', 'Configure Now', 'Configure Now', '2021-10-17 06:49:58', '2021-10-17 06:49:58'),
(27334, 'en', 'Total', 'Total', '2021-10-17 06:49:58', '2021-10-17 06:49:58'),
(27335, 'en', 'Customer', 'Customer', '2021-10-17 06:49:58', '2021-10-17 06:49:58'),
(27336, 'en', 'Order', 'Order', '2021-10-17 06:49:58', '2021-10-17 06:49:58'),
(27337, 'en', 'Product category', 'Product category', '2021-10-17 06:49:58', '2021-10-17 06:49:58'),
(27338, 'en', 'Product brand', 'Product brand', '2021-10-17 06:49:58', '2021-10-17 06:49:58'),
(27339, 'en', 'Sellers', 'Sellers', '2021-10-17 06:49:58', '2021-10-17 06:49:58'),
(27340, 'en', 'Category wise product sale', 'Category wise product sale', '2021-10-17 06:49:58', '2021-10-17 06:49:58'),
(27341, 'en', 'Category wise product stock', 'Category wise product stock', '2021-10-17 06:49:58', '2021-10-17 06:49:58'),
(27342, 'en', 'Top 12 Products', 'Top 12 Products', '2021-10-17 06:49:58', '2021-10-17 06:49:58'),
(27343, 'en', 'Total published products', 'Total published products', '2021-10-17 06:49:58', '2021-10-17 06:49:58'),
(27344, 'en', 'Total sellers products', 'Total sellers products', '2021-10-17 06:49:58', '2021-10-17 06:49:58'),
(27345, 'en', 'Total admin products', 'Total admin products', '2021-10-17 06:49:58', '2021-10-17 06:49:58'),
(27346, 'en', 'Total sellers', 'Total sellers', '2021-10-17 06:49:58', '2021-10-17 06:49:58'),
(27347, 'en', 'Total approved sellers', 'Total approved sellers', '2021-10-17 06:49:58', '2021-10-17 06:49:58'),
(27348, 'en', 'Total pending sellers', 'Total pending sellers', '2021-10-17 06:49:58', '2021-10-17 06:49:58'),
(27349, 'en', 'Number of sale', 'Number of sale', '2021-10-17 06:49:58', '2021-10-17 06:49:58'),
(27350, 'en', 'Number of Stock', 'Number of Stock', '2021-10-17 06:49:58', '2021-10-17 06:49:58'),
(27351, 'en', 'All Product', 'All Product', '2021-10-17 06:51:35', '2021-10-17 06:51:35'),
(27352, 'en', 'All Sellers', 'All Sellers', '2021-10-17 06:51:35', '2021-10-17 06:51:35'),
(27353, 'en', 'Sort By', 'Sort By', '2021-10-17 06:51:35', '2021-10-17 06:51:35'),
(27354, 'en', 'Rating (High > Low)', 'Rating (High > Low)', '2021-10-17 06:51:35', '2021-10-17 06:51:35'),
(27355, 'en', 'Rating (Low > High)', 'Rating (Low > High)', '2021-10-17 06:51:35', '2021-10-17 06:51:35'),
(27356, 'en', 'Num of Sale (High > Low)', 'Num of Sale (High > Low)', '2021-10-17 06:51:35', '2021-10-17 06:51:35'),
(27357, 'en', 'Num of Sale (Low > High)', 'Num of Sale (Low > High)', '2021-10-17 06:51:35', '2021-10-17 06:51:35'),
(27358, 'en', 'Base Price (High > Low)', 'Base Price (High > Low)', '2021-10-17 06:51:35', '2021-10-17 06:51:35'),
(27359, 'en', 'Base Price (Low > High)', 'Base Price (Low > High)', '2021-10-17 06:51:35', '2021-10-17 06:51:35'),
(27360, 'en', 'Type & Enter', 'Type & Enter', '2021-10-17 06:51:35', '2021-10-17 06:51:35'),
(27361, 'en', 'Added By', 'Added By', '2021-10-17 06:51:35', '2021-10-17 06:51:35'),
(27362, 'en', 'Info', 'Info', '2021-10-17 06:51:35', '2021-10-17 06:51:35'),
(27363, 'en', 'Total Stock', 'Total Stock', '2021-10-17 06:51:35', '2021-10-17 06:51:35'),
(27364, 'en', 'Todays Deal', 'Todays Deal', '2021-10-17 06:51:35', '2021-10-17 06:51:35'),
(27365, 'en', 'Published', 'Published', '2021-10-17 06:51:35', '2021-10-17 06:51:35'),
(27366, 'en', 'Featured', 'Featured', '2021-10-17 06:51:35', '2021-10-17 06:51:35'),
(27367, 'en', 'Todays Deal updated successfully', 'Todays Deal updated successfully', '2021-10-17 06:51:35', '2021-10-17 06:51:35'),
(27368, 'en', 'Something went wrong', 'Something went wrong', '2021-10-17 06:51:35', '2021-10-17 06:51:35'),
(27369, 'en', 'Published products updated successfully', 'Published products updated successfully', '2021-10-17 06:51:35', '2021-10-17 06:51:35'),
(27370, 'en', 'Product approval update successfully', 'Product approval update successfully', '2021-10-17 06:51:35', '2021-10-17 06:51:35'),
(27371, 'en', 'Featured products updated successfully', 'Featured products updated successfully', '2021-10-17 06:51:35', '2021-10-17 06:51:35'),
(27372, 'en', 'All Attributes', 'All Attributes', '2021-10-17 06:51:37', '2021-10-17 06:51:37'),
(27373, 'en', 'Attributes', 'Attributes', '2021-10-17 06:51:37', '2021-10-17 06:51:37'),
(27374, 'en', 'Values', 'Values', '2021-10-17 06:51:37', '2021-10-17 06:51:37'),
(27375, 'en', 'Add New Attribute', 'Add New Attribute', '2021-10-17 06:51:37', '2021-10-17 06:51:37'),
(27376, 'en', 'Save', 'Save', '2021-10-17 06:51:37', '2021-10-17 06:51:37'),
(27377, 'en', 'All Colors', 'All Colors', '2021-10-17 06:51:40', '2021-10-17 06:51:40'),
(27378, 'en', 'Type color name & Enter', 'Type color name & Enter', '2021-10-17 06:51:40', '2021-10-17 06:51:40'),
(27379, 'en', 'Add New Color', 'Add New Color', '2021-10-17 06:51:40', '2021-10-17 06:51:40'),
(27380, 'en', 'Color Code', 'Color Code', '2021-10-17 06:51:40', '2021-10-17 06:51:40'),
(27381, 'en', 'Filter by Rating', 'Filter by Rating', '2021-10-17 06:51:50', '2021-10-17 06:51:50'),
(27382, 'en', 'Product', 'Product', '2021-10-17 06:51:50', '2021-10-17 06:51:50'),
(27383, 'en', 'Product Owner', 'Product Owner', '2021-10-17 06:51:50', '2021-10-17 06:51:50'),
(27384, 'en', 'Rating', 'Rating', '2021-10-17 06:51:50', '2021-10-17 06:51:50'),
(27385, 'en', 'Comment', 'Comment', '2021-10-17 06:51:50', '2021-10-17 06:51:50'),
(27386, 'en', 'Published reviews updated successfully', 'Published reviews updated successfully', '2021-10-17 06:51:50', '2021-10-17 06:51:50'),
(27387, 'en', 'See All', 'See All', '2021-10-17 06:53:13', '2021-10-17 06:53:13'),
(27388, 'en', 'Flash Sale', 'Flash Sale', '2021-10-17 06:53:13', '2021-10-17 06:53:13'),
(27389, 'en', 'View More', 'View More', '2021-10-17 06:53:13', '2021-10-17 06:53:13'),
(27390, 'en', 'I am shopping for...', 'I am shopping for...', '2021-10-17 06:55:49', '2021-10-17 06:55:49'),
(27391, 'en', 'Compare', 'Compare', '2021-10-17 06:55:49', '2021-10-17 06:55:49'),
(27392, 'en', 'Wishlist', 'Wishlist', '2021-10-17 06:55:49', '2021-10-17 06:55:49'),
(27393, 'en', 'Your Cart is empty', 'Your Cart is empty', '2021-10-17 06:55:49', '2021-10-17 06:55:49'),
(27394, 'en', 'LOGIN', 'LOGIN', '2021-10-17 08:37:08', '2021-10-17 08:37:08'),
(27395, 'en', 'REGISTRATION', 'REGISTRATION', '2021-10-17 08:37:08', '2021-10-17 08:37:08'),
(27396, 'en', 'Welcome to', 'Welcome to', '2021-10-17 08:37:52', '2021-10-17 08:37:52'),
(27397, 'en', 'Login to your account.', 'Login to your account.', '2021-10-17 08:37:52', '2021-10-17 08:37:52'),
(27398, 'en', 'Password', 'Password', '2021-10-17 08:37:52', '2021-10-17 08:37:52'),
(27399, 'en', 'Remember Me', 'Remember Me', '2021-10-17 08:37:52', '2021-10-17 08:37:52'),
(27400, 'en', 'All categories', 'All categories', '2021-10-17 08:38:16', '2021-10-17 08:38:16'),
(27401, 'en', 'Add New category', 'Add New category', '2021-10-17 08:38:16', '2021-10-17 08:38:16'),
(27402, 'en', 'Type name & Enter', 'Type name & Enter', '2021-10-17 08:38:16', '2021-10-17 08:38:16'),
(27403, 'en', 'Parent Category', 'Parent Category', '2021-10-17 08:38:16', '2021-10-17 08:38:16'),
(27404, 'en', 'Order Level', 'Order Level', '2021-10-17 08:38:16', '2021-10-17 08:38:16'),
(27405, 'en', 'Level', 'Level', '2021-10-17 08:38:16', '2021-10-17 08:38:16'),
(27406, 'en', 'Banner', 'Banner', '2021-10-17 08:38:16', '2021-10-17 08:38:16'),
(27407, 'en', 'Icon', 'Icon', '2021-10-17 08:38:16', '2021-10-17 08:38:16'),
(27408, 'en', 'Commission', 'Commission', '2021-10-17 08:38:16', '2021-10-17 08:38:16'),
(27409, 'en', 'Featured categories updated successfully', 'Featured categories updated successfully', '2021-10-17 08:38:16', '2021-10-17 08:38:16'),
(27410, 'en', 'Category Information', 'Category Information', '2021-10-17 08:39:00', '2021-10-17 08:39:00'),
(27411, 'en', 'No Parent', 'No Parent', '2021-10-17 08:39:00', '2021-10-17 08:39:00'),
(27412, 'en', 'Ordering Number', 'Ordering Number', '2021-10-17 08:39:00', '2021-10-17 08:39:00'),
(27413, 'en', 'Higher number has high priority', 'Higher number has high priority', '2021-10-17 08:39:00', '2021-10-17 08:39:00'),
(27414, 'en', 'Type', 'Type', '2021-10-17 08:39:00', '2021-10-17 08:39:00'),
(27415, 'en', 'Physical', 'Physical', '2021-10-17 08:39:00', '2021-10-17 08:39:00'),
(27416, 'en', 'Digital', 'Digital', '2021-10-17 08:39:00', '2021-10-17 08:39:00'),
(27417, 'en', '200x200', '200x200', '2021-10-17 08:39:00', '2021-10-17 08:39:00'),
(27418, 'en', '32x32', '32x32', '2021-10-17 08:39:00', '2021-10-17 08:39:00'),
(27419, 'en', 'Meta Title', 'Meta Title', '2021-10-17 08:39:00', '2021-10-17 08:39:00'),
(27420, 'en', 'Meta Description', 'Meta Description', '2021-10-17 08:39:00', '2021-10-17 08:39:00'),
(27421, 'en', 'Commission Rate', 'Commission Rate', '2021-10-17 08:39:00', '2021-10-17 08:39:00'),
(27422, 'en', 'Category has been inserted successfully', 'Category has been inserted successfully', '2021-10-17 08:39:29', '2021-10-17 08:39:29'),
(27423, 'en', 'Edit', 'Edit', '2021-10-17 08:39:30', '2021-10-17 08:39:30'),
(27424, 'en', 'Filters', 'Filters', '2021-10-17 08:49:13', '2021-10-17 08:49:13'),
(27425, 'en', 'Price range', 'Price range', '2021-10-17 08:49:13', '2021-10-17 08:49:13'),
(27426, 'en', 'Filter by color', 'Filter by color', '2021-10-17 08:49:13', '2021-10-17 08:49:13'),
(27427, 'en', 'Brands', 'Brands', '2021-10-17 08:49:13', '2021-10-17 08:49:13'),
(27428, 'en', 'All Brands', 'All Brands', '2021-10-17 08:49:13', '2021-10-17 08:49:13'),
(27429, 'en', 'Newest', 'Newest', '2021-10-17 08:49:13', '2021-10-17 08:49:13'),
(27430, 'en', 'Oldest', 'Oldest', '2021-10-17 08:49:13', '2021-10-17 08:49:13'),
(27431, 'en', 'Price low to high', 'Price low to high', '2021-10-17 08:49:13', '2021-10-17 08:49:13'),
(27432, 'en', 'Price high to low', 'Price high to low', '2021-10-17 08:49:13', '2021-10-17 08:49:13'),
(27433, 'en', 'General', 'General', '2021-10-17 08:50:52', '2021-10-17 08:50:52'),
(27434, 'en', 'Frontend Website Name', 'Frontend Website Name', '2021-10-17 08:50:52', '2021-10-17 08:50:52'),
(27435, 'en', 'Website Name', 'Website Name', '2021-10-17 08:50:52', '2021-10-17 08:50:52'),
(27436, 'en', 'Site Motto', 'Site Motto', '2021-10-17 08:50:52', '2021-10-17 08:50:52'),
(27437, 'en', 'Best eCommerce Website', 'Best eCommerce Website', '2021-10-17 08:50:52', '2021-10-17 08:50:52'),
(27438, 'en', 'Site Icon', 'Site Icon', '2021-10-17 08:50:52', '2021-10-17 08:50:52'),
(27439, 'en', 'Website favicon. 32x32 .png', 'Website favicon. 32x32 .png', '2021-10-17 08:50:52', '2021-10-17 08:50:52'),
(27440, 'en', 'Website Base Color', 'Website Base Color', '2021-10-17 08:50:52', '2021-10-17 08:50:52'),
(27441, 'en', 'Hex Color Code', 'Hex Color Code', '2021-10-17 08:50:52', '2021-10-17 08:50:52'),
(27442, 'en', 'Website Base Hover Color', 'Website Base Hover Color', '2021-10-17 08:50:52', '2021-10-17 08:50:52'),
(27443, 'en', 'Global SEO', 'Global SEO', '2021-10-17 08:50:52', '2021-10-17 08:50:52'),
(27444, 'en', 'Title', 'Title', '2021-10-17 08:50:52', '2021-10-17 08:50:52'),
(27445, 'en', 'Description', 'Description', '2021-10-17 08:50:53', '2021-10-17 08:50:53'),
(27446, 'en', 'Keywords', 'Keywords', '2021-10-17 08:50:53', '2021-10-17 08:50:53'),
(27447, 'en', 'Keyword, Keyword', 'Keyword, Keyword', '2021-10-17 08:50:53', '2021-10-17 08:50:53'),
(27448, 'en', 'Separate with coma', 'Separate with coma', '2021-10-17 08:50:53', '2021-10-17 08:50:53'),
(27449, 'en', 'Meta Image', 'Meta Image', '2021-10-17 08:50:53', '2021-10-17 08:50:53'),
(27450, 'en', 'Cookies Agreement', 'Cookies Agreement', '2021-10-17 08:50:53', '2021-10-17 08:50:53'),
(27451, 'en', 'Cookies Agreement Text', 'Cookies Agreement Text', '2021-10-17 08:50:53', '2021-10-17 08:50:53'),
(27452, 'en', 'Show Cookies Agreement?', 'Show Cookies Agreement?', '2021-10-17 08:50:53', '2021-10-17 08:50:53'),
(27453, 'en', 'Website Popup', 'Website Popup', '2021-10-17 08:50:53', '2021-10-17 08:50:53'),
(27454, 'en', 'Show website popup?', 'Show website popup?', '2021-10-17 08:50:53', '2021-10-17 08:50:53'),
(27455, 'en', 'Popup content', 'Popup content', '2021-10-17 08:50:53', '2021-10-17 08:50:53'),
(27456, 'en', 'Show Subscriber form?', 'Show Subscriber form?', '2021-10-17 08:50:53', '2021-10-17 08:50:53'),
(27457, 'en', 'Custom Script', 'Custom Script', '2021-10-17 08:50:53', '2021-10-17 08:50:53'),
(27458, 'en', 'Header custom script - before </head>', 'Header custom script - before </head>', '2021-10-17 08:50:53', '2021-10-17 08:50:53'),
(27459, 'en', 'Write script with <script> tag', 'Write script with <script> tag', '2021-10-17 08:50:53', '2021-10-17 08:50:53'),
(27460, 'en', 'Footer custom script - before </body>', 'Footer custom script - before </body>', '2021-10-17 08:50:53', '2021-10-17 08:50:53'),
(27461, 'en', 'Website Header', 'Website Header', '2021-10-17 08:51:03', '2021-10-17 08:51:03'),
(27462, 'en', 'Header Setting', 'Header Setting', '2021-10-17 08:51:03', '2021-10-17 08:51:03'),
(27463, 'en', 'Header Logo', 'Header Logo', '2021-10-17 08:51:03', '2021-10-17 08:51:03'),
(27464, 'en', 'Show Language Switcher?', 'Show Language Switcher?', '2021-10-17 08:51:03', '2021-10-17 08:51:03'),
(27465, 'en', 'Show Currency Switcher?', 'Show Currency Switcher?', '2021-10-17 08:51:03', '2021-10-17 08:51:03'),
(27466, 'en', 'Enable stikcy header?', 'Enable stikcy header?', '2021-10-17 08:51:03', '2021-10-17 08:51:03'),
(27467, 'en', 'Topbar Banner', 'Topbar Banner', '2021-10-17 08:51:03', '2021-10-17 08:51:03'),
(27468, 'en', 'Topbar Banner Link', 'Topbar Banner Link', '2021-10-17 08:51:03', '2021-10-17 08:51:03'),
(27469, 'en', 'Link with', 'Link with', '2021-10-17 08:51:03', '2021-10-17 08:51:03'),
(27470, 'en', 'or', 'or', '2021-10-17 08:51:03', '2021-10-17 08:51:03'),
(27471, 'en', 'Header Nav Menu', 'Header Nav Menu', '2021-10-17 08:51:03', '2021-10-17 08:51:03'),
(27472, 'en', 'Label', 'Label', '2021-10-17 08:51:03', '2021-10-17 08:51:03'),
(27473, 'en', 'Add New', 'Add New', '2021-10-17 08:51:03', '2021-10-17 08:51:03'),
(27474, 'en', 'System Name', 'System Name', '2021-10-17 08:51:37', '2021-10-17 08:51:37'),
(27475, 'en', 'System Logo - White', 'System Logo - White', '2021-10-17 08:51:37', '2021-10-17 08:51:37'),
(27476, 'en', 'Choose Files', 'Choose Files', '2021-10-17 08:51:37', '2021-10-17 08:51:37'),
(27477, 'en', 'Will be used in admin panel side menu', 'Will be used in admin panel side menu', '2021-10-17 08:51:37', '2021-10-17 08:51:37'),
(27478, 'en', 'System Logo - Black', 'System Logo - Black', '2021-10-17 08:51:37', '2021-10-17 08:51:37'),
(27479, 'en', 'Will be used in admin panel topbar in mobile + Admin login page', 'Will be used in admin panel topbar in mobile + Admin login page', '2021-10-17 08:51:37', '2021-10-17 08:51:37'),
(27480, 'en', 'System Timezone', 'System Timezone', '2021-10-17 08:51:37', '2021-10-17 08:51:37'),
(27481, 'en', 'Admin login page background', 'Admin login page background', '2021-10-17 08:51:37', '2021-10-17 08:51:37'),
(27482, 'en', 'Page Not Found!', 'Page Not Found!', '2021-10-17 08:54:54', '2021-10-17 08:54:54'),
(27483, 'en', 'The page you are looking for has not been found on our server.', 'The page you are looking for has not been found on our server.', '2021-10-17 08:54:54', '2021-10-17 08:54:54'),
(27484, 'en', 'Website Pages', 'Website Pages', '2021-10-17 08:55:14', '2021-10-17 08:55:14'),
(27485, 'en', 'All Pages', 'All Pages', '2021-10-17 08:55:14', '2021-10-17 08:55:14'),
(27486, 'en', 'Add New Page', 'Add New Page', '2021-10-17 08:55:14', '2021-10-17 08:55:14'),
(27487, 'en', 'URL', 'URL', '2021-10-17 08:55:14', '2021-10-17 08:55:14'),
(27488, 'en', 'Actions', 'Actions', '2021-10-17 08:55:14', '2021-10-17 08:55:14'),
(27489, 'en', 'Home Page', 'Home Page', '2021-10-17 08:55:14', '2021-10-17 08:55:14'),
(27490, 'en', 'Home Page Settings', 'Home Page Settings', '2021-10-17 08:55:19', '2021-10-17 08:55:19'),
(27491, 'en', 'Home Slider', 'Home Slider', '2021-10-17 08:55:19', '2021-10-17 08:55:19'),
(27492, 'en', 'We have limited banner height to maintain UI. We had to crop from both left & right side in view for different devices to make it responsive. Before designing banner keep these points in mind.', 'We have limited banner height to maintain UI. We had to crop from both left & right side in view for different devices to make it responsive. Before designing banner keep these points in mind.', '2021-10-17 08:55:19', '2021-10-17 08:55:19'),
(27493, 'en', 'Photos & Links', 'Photos & Links', '2021-10-17 08:55:19', '2021-10-17 08:55:19'),
(27494, 'en', 'Home Banner 1 (Max 3)', 'Home Banner 1 (Max 3)', '2021-10-17 08:55:19', '2021-10-17 08:55:19'),
(27495, 'en', 'Banner & Links', 'Banner & Links', '2021-10-17 08:55:19', '2021-10-17 08:55:19'),
(27496, 'en', 'Home Banner 2 (Max 3)', 'Home Banner 2 (Max 3)', '2021-10-17 08:55:19', '2021-10-17 08:55:19'),
(27497, 'en', 'Home Categories', 'Home Categories', '2021-10-17 08:55:19', '2021-10-17 08:55:19'),
(27498, 'en', 'Home Banner 3 (Max 3)', 'Home Banner 3 (Max 3)', '2021-10-17 08:55:19', '2021-10-17 08:55:19'),
(27499, 'en', 'Top 10', 'Top 10', '2021-10-17 08:55:19', '2021-10-17 08:55:19'),
(27500, 'en', 'Top Categories (Max 10)', 'Top Categories (Max 10)', '2021-10-17 08:55:19', '2021-10-17 08:55:19'),
(27501, 'en', 'Top Brands (Max 10)', 'Top Brands (Max 10)', '2021-10-17 08:55:20', '2021-10-17 08:55:20'),
(27502, 'en', 'Select File', 'Select File', '2021-10-17 08:55:41', '2021-10-17 08:55:41'),
(27503, 'en', 'Upload New', 'Upload New', '2021-10-17 08:55:41', '2021-10-17 08:55:41'),
(27504, 'en', 'Selected Only', 'Selected Only', '2021-10-17 08:55:41', '2021-10-17 08:55:41'),
(27505, 'en', 'No files found', 'No files found', '2021-10-17 08:55:41', '2021-10-17 08:55:41'),
(27506, 'en', '0 File selected', '0 File selected', '2021-10-17 08:55:41', '2021-10-17 08:55:41'),
(27507, 'en', 'Clear', 'Clear', '2021-10-17 08:55:41', '2021-10-17 08:55:41'),
(27508, 'en', 'Prev', 'Prev', '2021-10-17 08:55:41', '2021-10-17 08:55:41'),
(27509, 'en', 'Next', 'Next', '2021-10-17 08:55:41', '2021-10-17 08:55:41'),
(27510, 'en', 'Add Files', 'Add Files', '2021-10-17 08:55:41', '2021-10-17 08:55:41'),
(27511, 'en', 'Settings updated successfully', 'Settings updated successfully', '2021-10-17 08:56:19', '2021-10-17 08:56:19'),
(27512, 'en', 'Product Information', 'Product Information', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27513, 'en', 'Product Name', 'Product Name', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27514, 'en', 'Select Brand', 'Select Brand', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27515, 'en', 'Unit', 'Unit', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27516, 'en', 'Unit (e.g. KG, Pc etc)', 'Unit (e.g. KG, Pc etc)', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27517, 'en', 'Minimum Purchase Qty', 'Minimum Purchase Qty', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27518, 'en', 'Tags', 'Tags', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27519, 'en', 'Type and hit enter to add a tag', 'Type and hit enter to add a tag', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27520, 'en', 'This is used for search. Input those words by which cutomer can find this product.', 'This is used for search. Input those words by which cutomer can find this product.', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27521, 'en', 'Barcode', 'Barcode', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27522, 'en', 'Refundable', 'Refundable', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27523, 'en', 'Product Images', 'Product Images', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27524, 'en', 'Gallery Images', 'Gallery Images', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27525, 'en', 'These images are visible in product details page gallery. Use 600x600 sizes images.', 'These images are visible in product details page gallery. Use 600x600 sizes images.', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27526, 'en', 'Thumbnail Image', 'Thumbnail Image', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27527, 'en', 'This image is visible in all product box. Use 300x300 sizes image. Keep some blank space around main object of your image as we had to crop some edge in different devices to make it responsive.', 'This image is visible in all product box. Use 300x300 sizes image. Keep some blank space around main object of your image as we had to crop some edge in different devices to make it responsive.', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27528, 'en', 'Product Videos', 'Product Videos', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27529, 'en', 'Video Provider', 'Video Provider', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27530, 'en', 'Youtube', 'Youtube', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27531, 'en', 'Dailymotion', 'Dailymotion', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27532, 'en', 'Vimeo', 'Vimeo', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27533, 'en', 'Video Link', 'Video Link', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27534, 'en', 'Use proper link without extra parameter. Don\'t use short share link/embeded iframe code.', 'Use proper link without extra parameter. Don\'t use short share link/embeded iframe code.', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27535, 'en', 'Product Variation', 'Product Variation', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27536, 'en', 'Choose Attributes', 'Choose Attributes', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27537, 'en', 'Choose the attributes of this product and then input values of each attribute', 'Choose the attributes of this product and then input values of each attribute', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27538, 'en', 'Product price + stock', 'Product price + stock', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27539, 'en', 'Unit price', 'Unit price', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27540, 'en', 'Discount Date Range', 'Discount Date Range', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27541, 'en', 'Select Date', 'Select Date', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27542, 'en', 'Discount', 'Discount', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27543, 'en', 'Flat', 'Flat', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27544, 'en', 'Percent', 'Percent', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27545, 'en', 'Set Point', 'Set Point', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27546, 'en', '1', '1', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27547, 'en', 'Quantity', 'Quantity', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27548, 'en', 'SKU', 'SKU', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27549, 'en', 'Product Description', 'Product Description', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27550, 'en', 'Product Shipping Cost', 'Product Shipping Cost', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27551, 'en', 'PDF Specification', 'PDF Specification', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27552, 'en', 'SEO Meta Tags', 'SEO Meta Tags', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27553, 'en', 'Walletmix EMI', 'Walletmix EMI', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27554, 'en', 'Enable EMI', 'Enable EMI', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27555, 'en', 'Disable EMI', 'Disable EMI', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27556, 'en', 'Product wise shipping cost is disable. Shipping cost is configured from here', 'Product wise shipping cost is disable. Shipping cost is configured from here', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27557, 'en', 'Low Stock Quantity Warning', 'Low Stock Quantity Warning', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27558, 'en', 'Stock Visibility State', 'Stock Visibility State', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27559, 'en', 'Show Stock Quantity', 'Show Stock Quantity', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27560, 'en', 'Show Stock With Text Only', 'Show Stock With Text Only', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27561, 'en', 'Hide Stock', 'Hide Stock', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27562, 'en', 'Cash On Delivery', 'Cash On Delivery', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27563, 'en', 'Status', 'Status', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27564, 'en', 'Flash Deal', 'Flash Deal', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27565, 'en', 'Add To Flash', 'Add To Flash', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27566, 'en', 'Discount Type', 'Discount Type', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27567, 'en', 'Estimate Shipping Time', 'Estimate Shipping Time', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27568, 'en', 'Shipping Days', 'Shipping Days', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27569, 'en', 'Days', 'Days', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27570, 'en', 'Product Scope', 'Product Scope', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27571, 'en', 'Local', 'Local', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27572, 'en', 'Global', 'Global', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27573, 'en', 'Product Warranty', 'Product Warranty', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27574, 'en', 'Fifteen Days', 'Fifteen Days', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27575, 'en', 'Three Months', 'Three Months', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27576, 'en', 'Six Months', 'Six Months', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27577, 'en', 'One Year', 'One Year', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27578, 'en', 'Save As Draft', 'Save As Draft', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27579, 'en', 'Save & Unpublish', 'Save & Unpublish', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27580, 'en', 'Save & Publish', 'Save & Publish', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27581, 'en', 'Choice Title', 'Choice Title', '2021-10-17 09:08:57', '2021-10-17 09:08:57'),
(27582, 'en', 'Product has been inserted successfully', 'Product has been inserted successfully', '2021-10-17 09:13:26', '2021-10-17 09:13:26'),
(27583, 'en', 'Num of Sale', 'Num of Sale', '2021-10-17 09:13:27', '2021-10-17 09:13:27'),
(27584, 'en', 'times', 'times', '2021-10-17 09:13:27', '2021-10-17 09:13:27'),
(27585, 'en', 'Base Price', 'Base Price', '2021-10-17 09:13:27', '2021-10-17 09:13:27'),
(27586, 'en', 'View', 'View', '2021-10-17 09:13:27', '2021-10-17 09:13:27'),
(27587, 'en', 'Duplicate', 'Duplicate', '2021-10-17 09:13:27', '2021-10-17 09:13:27'),
(27588, 'en', 'Add to wishlist', 'Add to wishlist', '2021-10-17 09:13:41', '2021-10-17 09:13:41'),
(27589, 'en', 'Add to compare', 'Add to compare', '2021-10-17 09:13:41', '2021-10-17 09:13:41'),
(27590, 'en', 'Add to cart', 'Add to cart', '2021-10-17 09:13:41', '2021-10-17 09:13:41'),
(27591, 'en', 'Club Point', 'Club Point', '2021-10-17 09:13:41', '2021-10-17 09:13:41'),
(27592, 'en', 'Club Point', 'Club Point', '2021-10-17 09:13:41', '2021-10-17 09:13:41'),
(27593, 'en', 'reviews', 'reviews', '2021-10-17 09:13:48', '2021-10-17 09:13:48'),
(27594, 'en', 'Sold by', 'Sold by', '2021-10-17 09:13:48', '2021-10-17 09:13:48'),
(27595, 'en', 'Inhouse product', 'Inhouse product', '2021-10-17 09:13:48', '2021-10-17 09:13:48'),
(27596, 'en', 'Message Seller', 'Message Seller', '2021-10-17 09:13:48', '2021-10-17 09:13:48'),
(27597, 'en', 'Price', 'Price', '2021-10-17 09:13:48', '2021-10-17 09:13:48'),
(27598, 'en', 'available', 'available', '2021-10-17 09:13:48', '2021-10-17 09:13:48'),
(27599, 'en', 'Total Price', 'Total Price', '2021-10-17 09:13:48', '2021-10-17 09:13:48'),
(27600, 'en', 'Buy Now', 'Buy Now', '2021-10-17 09:13:48', '2021-10-17 09:13:48'),
(27601, 'en', 'Out of Stock', 'Out of Stock', '2021-10-17 09:13:48', '2021-10-17 09:13:48'),
(27602, 'en', 'Share', 'Share', '2021-10-17 09:13:48', '2021-10-17 09:13:48'),
(27603, 'en', 'Video', 'Video', '2021-10-17 09:13:48', '2021-10-17 09:13:48'),
(27604, 'en', 'Download', 'Download', '2021-10-17 09:13:48', '2021-10-17 09:13:48'),
(27605, 'en', 'There have been no reviews for this product yet.', 'There have been no reviews for this product yet.', '2021-10-17 09:13:48', '2021-10-17 09:13:48'),
(27606, 'en', 'Related products', 'Related products', '2021-10-17 09:13:48', '2021-10-17 09:13:48'),
(27607, 'en', 'customer reviews', 'customer reviews', '2021-10-17 09:13:48', '2021-10-17 09:13:48'),
(27608, 'en', 'Top Selling Products', 'Top Selling Products', '2021-10-17 09:13:48', '2021-10-17 09:13:48'),
(27609, 'en', 'Any query about this product', 'Any query about this product', '2021-10-17 09:13:48', '2021-10-17 09:13:48'),
(27610, 'en', 'Your Question', 'Your Question', '2021-10-17 09:13:48', '2021-10-17 09:13:48'),
(27611, 'en', 'Send', 'Send', '2021-10-17 09:13:48', '2021-10-17 09:13:48'),
(27612, 'en', 'Email Or Phone', 'Email Or Phone', '2021-10-17 09:13:48', '2021-10-17 09:13:48'),
(27613, 'en', 'Use country code before number', 'Use country code before number', '2021-10-17 09:13:48', '2021-10-17 09:13:48'),
(27614, 'en', 'Forgot password?', 'Forgot password?', '2021-10-17 09:13:48', '2021-10-17 09:13:48'),
(27615, 'en', 'Dont have an account?', 'Dont have an account?', '2021-10-17 09:13:48', '2021-10-17 09:13:48'),
(27616, 'en', 'Register Now', 'Register Now', '2021-10-17 09:13:48', '2021-10-17 09:13:48'),
(27617, 'en', 'Or Login With', 'Or Login With', '2021-10-17 09:13:48', '2021-10-17 09:13:48'),
(27618, 'en', 'Edit Product', 'Edit Product', '2021-10-17 09:14:08', '2021-10-17 09:14:08'),
(27619, 'en', 'Translatable', 'Translatable', '2021-10-17 09:14:08', '2021-10-17 09:14:08'),
(27620, 'en', 'Type to add a tag', 'Type to add a tag', '2021-10-17 09:14:08', '2021-10-17 09:14:08'),
(27621, 'en', 'Meta Images', 'Meta Images', '2021-10-17 09:14:08', '2021-10-17 09:14:08'),
(27622, 'en', 'Slug', 'Slug', '2021-10-17 09:14:08', '2021-10-17 09:14:08'),
(27623, 'en', 'Update Product', 'Update Product', '2021-10-17 09:14:08', '2021-10-17 09:14:08'),
(27624, 'en', 'Product has been updated successfully', 'Product has been updated successfully', '2021-10-17 09:14:32', '2021-10-17 09:14:32'),
(27625, 'en', 'Language changed to ', 'Language changed to ', '2021-10-17 09:19:50', '2021-10-17 09:19:50'),
(27626, 'en', 'Color has been inserted successfully', 'Color has been inserted successfully', '2021-10-17 09:35:04', '2021-10-17 09:35:04'),
(27627, 'en', 'Color Information', 'Color Information', '2021-10-17 09:36:38', '2021-10-17 09:36:38'),
(27628, 'en', 'Color has been updated successfully', 'Color has been updated successfully', '2021-10-17 09:36:41', '2021-10-17 09:36:41'),
(27629, 'en', 'Variant', 'Variant', '2021-10-17 09:40:59', '2021-10-17 09:40:59'),
(27630, 'en', 'Variant Price', 'Variant Price', '2021-10-17 09:40:59', '2021-10-17 09:40:59'),
(27631, 'en', 'Photo', 'Photo', '2021-10-17 09:40:59', '2021-10-17 09:40:59'),
(27632, 'en', 'Something went wrong!', 'Something went wrong!', '2021-10-17 09:42:56', '2021-10-17 09:42:56'),
(27633, 'en', 'Sorry for the inconvenience, but we\'re working on it.', 'Sorry for the inconvenience, but we\'re working on it.', '2021-10-17 09:42:56', '2021-10-17 09:42:56'),
(27634, 'en', 'Error code', 'Error code', '2021-10-17 09:42:56', '2021-10-17 09:42:56'),
(27635, 'en', 'Color', 'Color', '2021-10-17 09:44:00', '2021-10-17 09:44:00'),
(27636, 'en', 'Product has been deleted successfully', 'Product has been deleted successfully', '2021-10-17 09:46:12', '2021-10-17 09:46:12'),
(27637, 'en', 'All Flash Deals', 'All Flash Deals', '2021-10-17 11:19:07', '2021-10-17 11:19:07'),
(27638, 'en', 'Create New Flash Deal', 'Create New Flash Deal', '2021-10-17 11:19:07', '2021-10-17 11:19:07'),
(27639, 'en', 'Start Date', 'Start Date', '2021-10-17 11:19:07', '2021-10-17 11:19:07'),
(27640, 'en', 'End Date', 'End Date', '2021-10-17 11:19:07', '2021-10-17 11:19:07'),
(27641, 'en', 'Page Link', 'Page Link', '2021-10-17 11:19:07', '2021-10-17 11:19:07'),
(27642, 'en', 'Flash Deal Information', 'Flash Deal Information', '2021-10-17 11:19:13', '2021-10-17 11:19:13'),
(27643, 'en', 'Background Color', 'Background Color', '2021-10-17 11:19:13', '2021-10-17 11:19:13'),
(27644, 'en', '#0000ff', '#0000ff', '2021-10-17 11:19:13', '2021-10-17 11:19:13'),
(27645, 'en', 'Text Color', 'Text Color', '2021-10-17 11:19:13', '2021-10-17 11:19:13');
INSERT INTO `translations` (`id`, `lang`, `lang_key`, `lang_value`, `created_at`, `updated_at`) VALUES
(27646, 'en', 'White', 'White', '2021-10-17 11:19:13', '2021-10-17 11:19:13'),
(27647, 'en', 'Dark', 'Dark', '2021-10-17 11:19:13', '2021-10-17 11:19:13'),
(27648, 'en', 'Date', 'Date', '2021-10-17 11:19:13', '2021-10-17 11:19:13'),
(27649, 'en', 'Choose Products', 'Choose Products', '2021-10-17 11:19:13', '2021-10-17 11:19:13'),
(27650, 'en', 'If any product has discount or exists in another flash deal, the discount will be replaced by this discount & time limit.', 'If any product has discount or exists in another flash deal, the discount will be replaced by this discount & time limit.', '2021-10-17 11:19:13', '2021-10-17 11:19:13'),
(27651, 'en', 'Flash Deal has been updated successfully', 'Flash Deal has been updated successfully', '2021-10-17 11:20:23', '2021-10-17 11:20:23'),
(27652, 'en', 'Item added to your cart!', 'Item added to your cart!', '2021-10-17 11:26:01', '2021-10-17 11:26:01'),
(27653, 'en', 'Back to shopping', 'Back to shopping', '2021-10-17 11:26:01', '2021-10-17 11:26:01'),
(27654, 'en', 'Proceed to Checkout', 'Proceed to Checkout', '2021-10-17 11:26:01', '2021-10-17 11:26:01'),
(27655, 'en', 'Cart Items', 'Cart Items', '2021-10-17 11:26:01', '2021-10-17 11:26:01'),
(27656, 'en', 'Subtotal', 'Subtotal', '2021-10-17 11:26:01', '2021-10-17 11:26:01'),
(27657, 'en', 'View cart', 'View cart', '2021-10-17 11:26:01', '2021-10-17 11:26:01'),
(27658, 'en', 'Checkout', 'Checkout', '2021-10-17 11:26:01', '2021-10-17 11:26:01'),
(27659, 'en', '1. My Cart', '1. My Cart', '2021-10-17 11:26:04', '2021-10-17 11:26:04'),
(27660, 'en', '2. Shipping info', '2. Shipping info', '2021-10-17 11:26:04', '2021-10-17 11:26:04'),
(27661, 'en', '3. Delivery info', '3. Delivery info', '2021-10-17 11:26:04', '2021-10-17 11:26:04'),
(27662, 'en', '4. Payment', '4. Payment', '2021-10-17 11:26:04', '2021-10-17 11:26:04'),
(27663, 'en', '5. Confirmation', '5. Confirmation', '2021-10-17 11:26:04', '2021-10-17 11:26:04'),
(27664, 'en', 'Tax', 'Tax', '2021-10-17 11:26:04', '2021-10-17 11:26:04'),
(27665, 'en', 'Remove', 'Remove', '2021-10-17 11:26:04', '2021-10-17 11:26:04'),
(27666, 'en', 'Return to shop', 'Return to shop', '2021-10-17 11:26:04', '2021-10-17 11:26:04'),
(27667, 'en', 'Continue to Shipping', 'Continue to Shipping', '2021-10-17 11:26:04', '2021-10-17 11:26:04'),
(27668, 'en', 'Subscribe Now', 'Subscribe Now', '2021-10-17 11:27:15', '2021-10-17 11:27:15'),
(27669, 'en', 'Ok. I Understood', 'Ok. I Understood', '2021-10-17 11:30:28', '2021-10-17 11:30:28'),
(27670, 'en', 'HTTPS Activation', 'HTTPS Activation', '2021-10-17 11:31:50', '2021-10-17 11:31:50'),
(27671, 'en', 'Maintenance Mode Activation', 'Maintenance Mode Activation', '2021-10-17 11:31:50', '2021-10-17 11:31:50'),
(27672, 'en', 'Disable image optimization?', 'Disable image optimization?', '2021-10-17 11:31:50', '2021-10-17 11:31:50'),
(27673, 'en', 'Business Related', 'Business Related', '2021-10-17 11:31:50', '2021-10-17 11:31:50'),
(27674, 'en', 'Vendor System Activation', 'Vendor System Activation', '2021-10-17 11:31:50', '2021-10-17 11:31:50'),
(27675, 'en', 'Classified Product', 'Classified Product', '2021-10-17 11:31:50', '2021-10-17 11:31:50'),
(27676, 'en', 'Wallet System Activation', 'Wallet System Activation', '2021-10-17 11:31:50', '2021-10-17 11:31:50'),
(27677, 'en', 'Coupon System Activation', 'Coupon System Activation', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27678, 'en', 'Pickup Point Activation', 'Pickup Point Activation', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27679, 'en', 'Conversation Activation', 'Conversation Activation', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27680, 'en', 'Seller Product Manage By Admin', 'Seller Product Manage By Admin', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27681, 'en', 'After activate this option Cash On Delivery of Seller product will be managed by Admin', 'After activate this option Cash On Delivery of Seller product will be managed by Admin', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27682, 'en', 'Admin Approval On Seller Product', 'Admin Approval On Seller Product', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27683, 'en', 'After activate this option, Admin approval need to seller product', 'After activate this option, Admin approval need to seller product', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27684, 'en', 'Category-based Commission', 'Category-based Commission', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27685, 'en', 'After activate this option Seller commision will be disabled and You need to set commission on each category otherwise Admin will not get any commision', 'After activate this option Seller commision will be disabled and You need to set commission on each category otherwise Admin will not get any commision', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27686, 'en', 'Set Commisssion Now', 'Set Commisssion Now', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27687, 'en', 'Email Verification', 'Email Verification', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27688, 'en', 'Payment Related', 'Payment Related', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27689, 'en', 'Paypal Payment Activation', 'Paypal Payment Activation', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27690, 'en', 'You need to configure Paypal correctly to enable this feature', 'You need to configure Paypal correctly to enable this feature', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27691, 'en', 'Stripe Payment Activation', 'Stripe Payment Activation', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27692, 'en', 'SSlCommerz Activation', 'SSlCommerz Activation', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27693, 'en', 'Instamojo Payment Activation', 'Instamojo Payment Activation', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27694, 'en', 'You need to configure Instamojo Payment correctly to enable this feature', 'You need to configure Instamojo Payment correctly to enable this feature', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27695, 'en', 'Razor Pay Activation', 'Razor Pay Activation', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27696, 'en', 'You need to configure Razor correctly to enable this feature', 'You need to configure Razor correctly to enable this feature', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27697, 'en', 'PayStack Activation', 'PayStack Activation', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27698, 'en', 'You need to configure PayStack correctly to enable this feature', 'You need to configure PayStack correctly to enable this feature', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27699, 'en', 'VoguePay Activation', 'VoguePay Activation', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27700, 'en', 'You need to configure VoguePay correctly to enable this feature', 'You need to configure VoguePay correctly to enable this feature', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27701, 'en', 'Payhere Activation', 'Payhere Activation', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27702, 'en', 'Ngenius Activation', 'Ngenius Activation', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27703, 'en', 'You need to configure Ngenius correctly to enable this feature', 'You need to configure Ngenius correctly to enable this feature', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27704, 'en', 'Iyzico Activation', 'Iyzico Activation', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27705, 'en', 'You need to configure iyzico correctly to enable this feature', 'You need to configure iyzico correctly to enable this feature', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27706, 'en', 'Bkash Activation', 'Bkash Activation', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27707, 'en', 'You need to configure bkash correctly to enable this feature', 'You need to configure bkash correctly to enable this feature', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27708, 'en', 'Walletmix Activation', 'Walletmix Activation', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27709, 'en', 'Nagad Activation', 'Nagad Activation', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27710, 'en', 'You need to configure nagad correctly to enable this feature', 'You need to configure nagad correctly to enable this feature', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27711, 'en', 'Proxy Pay Activation', 'Proxy Pay Activation', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27712, 'en', 'You need to configure proxypay correctly to enable this feature', 'You need to configure proxypay correctly to enable this feature', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27713, 'en', 'Amarpay Activation', 'Amarpay Activation', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27714, 'en', 'You need to configure amarpay correctly to enable this feature', 'You need to configure amarpay correctly to enable this feature', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27715, 'en', 'Cash Payment Activation', 'Cash Payment Activation', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27716, 'en', 'Social Media Login', 'Social Media Login', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27717, 'en', 'Facebook login', 'Facebook login', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27718, 'en', 'You need to configure Facebook Client correctly to enable this feature', 'You need to configure Facebook Client correctly to enable this feature', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27719, 'en', 'Google login', 'Google login', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27720, 'en', 'You need to configure Google Client correctly to enable this feature', 'You need to configure Google Client correctly to enable this feature', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27721, 'en', 'Twitter login', 'Twitter login', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27722, 'en', 'You need to configure Twitter Client correctly to enable this feature', 'You need to configure Twitter Client correctly to enable this feature', '2021-10-17 11:31:51', '2021-10-17 11:31:51'),
(27723, 'en', 'New Password', 'New Password', '2021-10-17 11:38:45', '2021-10-17 11:38:45'),
(27724, 'en', 'Confirm Password', 'Confirm Password', '2021-10-17 11:38:45', '2021-10-17 11:38:45'),
(27725, 'en', 'Avatar', 'Avatar', '2021-10-17 11:38:45', '2021-10-17 11:38:45'),
(27726, 'en', 'Your Profile has been updated successfully!', 'Your Profile has been updated successfully!', '2021-10-17 11:40:20', '2021-10-17 11:40:20'),
(27727, 'en', 'Discount Price', 'Discount Price', '2021-10-17 12:21:00', '2021-10-17 12:21:00'),
(27728, 'en', 'Create an account.', 'Create an account.', '2021-10-17 12:21:19', '2021-10-17 12:21:19'),
(27729, 'en', 'Full Name', 'Full Name', '2021-10-17 12:21:19', '2021-10-17 12:21:19'),
(27730, 'en', 'Use Email Instead', 'Use Email Instead', '2021-10-17 12:21:19', '2021-10-17 12:21:19'),
(27731, 'en', 'By signing up you agree to our terms and conditions.', 'By signing up you agree to our terms and conditions.', '2021-10-17 12:21:19', '2021-10-17 12:21:19'),
(27732, 'en', 'Create Account', 'Create Account', '2021-10-17 12:21:19', '2021-10-17 12:21:19'),
(27733, 'en', 'Or Join With', 'Or Join With', '2021-10-17 12:21:19', '2021-10-17 12:21:19'),
(27734, 'en', 'Already have an account?', 'Already have an account?', '2021-10-17 12:21:19', '2021-10-17 12:21:19'),
(27735, 'en', 'Log In', 'Log In', '2021-10-17 12:21:19', '2021-10-17 12:21:19'),
(27736, 'en', 'Use Phone Instead', 'Use Phone Instead', '2021-10-17 12:21:19', '2021-10-17 12:21:19'),
(27737, 'en', 'Website Footer', 'Website Footer', '2021-10-17 12:22:16', '2021-10-17 12:22:16'),
(27738, 'en', 'Footer Widget', 'Footer Widget', '2021-10-17 12:22:16', '2021-10-17 12:22:16'),
(27739, 'en', 'About Widget', 'About Widget', '2021-10-17 12:22:16', '2021-10-17 12:22:16'),
(27740, 'en', 'Footer Logo', 'Footer Logo', '2021-10-17 12:22:16', '2021-10-17 12:22:16'),
(27741, 'en', 'About description', 'About description', '2021-10-17 12:22:16', '2021-10-17 12:22:16'),
(27742, 'en', 'Play Store Link', 'Play Store Link', '2021-10-17 12:22:16', '2021-10-17 12:22:16'),
(27743, 'en', 'App Store Link', 'App Store Link', '2021-10-17 12:22:16', '2021-10-17 12:22:16'),
(27744, 'en', 'Contact Info Widget', 'Contact Info Widget', '2021-10-17 12:22:16', '2021-10-17 12:22:16'),
(27745, 'en', 'Contact address', 'Contact address', '2021-10-17 12:22:16', '2021-10-17 12:22:16'),
(27746, 'en', 'Contact phone', 'Contact phone', '2021-10-17 12:22:16', '2021-10-17 12:22:16'),
(27747, 'en', 'Contact email', 'Contact email', '2021-10-17 12:22:16', '2021-10-17 12:22:16'),
(27748, 'en', 'Link Widget One', 'Link Widget One', '2021-10-17 12:22:16', '2021-10-17 12:22:16'),
(27749, 'en', 'Links', 'Links', '2021-10-17 12:22:16', '2021-10-17 12:22:16'),
(27750, 'en', 'Footer Bottom', 'Footer Bottom', '2021-10-17 12:22:16', '2021-10-17 12:22:16'),
(27751, 'en', 'Copyright Widget ', 'Copyright Widget ', '2021-10-17 12:22:16', '2021-10-17 12:22:16'),
(27752, 'en', 'Copyright Text', 'Copyright Text', '2021-10-17 12:22:16', '2021-10-17 12:22:16'),
(27753, 'en', 'Social Link Widget ', 'Social Link Widget ', '2021-10-17 12:22:16', '2021-10-17 12:22:16'),
(27754, 'en', 'Show Social Links?', 'Show Social Links?', '2021-10-17 12:22:16', '2021-10-17 12:22:16'),
(27755, 'en', 'Social Links', 'Social Links', '2021-10-17 12:22:16', '2021-10-17 12:22:16'),
(27756, 'en', 'Payment Methods Widget ', 'Payment Methods Widget ', '2021-10-17 12:22:16', '2021-10-17 12:22:16'),
(27757, 'en', 'Add New Staffs', 'Add New Staffs', '2021-10-18 05:06:47', '2021-10-18 05:06:47'),
(27758, 'en', 'Role', 'Role', '2021-10-18 05:06:47', '2021-10-18 05:06:47'),
(27759, 'en', 'All Role', 'All Role', '2021-10-18 05:07:00', '2021-10-18 05:07:00'),
(27760, 'en', 'Add New Role', 'Add New Role', '2021-10-18 05:07:00', '2021-10-18 05:07:00'),
(27761, 'en', 'Roles', 'Roles', '2021-10-18 05:07:00', '2021-10-18 05:07:00'),
(27762, 'en', 'Signin', 'Signin', '2021-10-18 05:59:48', '2021-10-18 05:59:48'),
(27763, 'en', 'Signup', 'Signup', '2021-10-18 05:59:48', '2021-10-18 05:59:48'),
(27764, 'en', 'Popular Suggestions', 'Popular Suggestions', '2021-10-18 06:06:58', '2021-10-18 06:06:58'),
(27765, 'en', 'Category Suggestions', 'Category Suggestions', '2021-10-18 06:06:58', '2021-10-18 06:06:58'),
(27766, 'en', 'Comparison', 'Comparison', '2021-10-18 06:38:43', '2021-10-18 06:38:43'),
(27767, 'en', 'Reset Compare List', 'Reset Compare List', '2021-10-18 06:38:43', '2021-10-18 06:38:43'),
(27768, 'en', 'Your comparison list is empty', 'Your comparison list is empty', '2021-10-18 06:38:43', '2021-10-18 06:38:43'),
(27769, 'en', 'Image', 'Image', '2021-10-18 08:21:34', '2021-10-18 08:21:34'),
(27770, 'en', 'Product Image', 'Product Image', '2021-10-18 08:21:34', '2021-10-18 08:21:34'),
(27771, 'en', 'Sub Sub Category', 'Sub Sub Category', '2021-10-18 08:21:34', '2021-10-18 08:21:34'),
(27772, 'en', 'Category has been updated successfully', 'Category has been updated successfully', '2021-10-18 08:35:53', '2021-10-18 08:35:53'),
(27773, 'en', 'Check Your Order Status', 'Check Your Order Status', '2021-10-18 10:59:41', '2021-10-18 10:59:41'),
(27774, 'en', 'Order Code', 'Order Code', '2021-10-18 10:59:41', '2021-10-18 10:59:41'),
(27775, 'en', 'S3 File System Credentials', 'S3 File System Credentials', '2021-10-18 11:00:51', '2021-10-18 11:00:51'),
(27776, 'en', 'AWS_ACCESS_KEY_ID', 'AWS_ACCESS_KEY_ID', '2021-10-18 11:00:51', '2021-10-18 11:00:51'),
(27777, 'en', 'AWS_SECRET_ACCESS_KEY', 'AWS_SECRET_ACCESS_KEY', '2021-10-18 11:00:51', '2021-10-18 11:00:51'),
(27778, 'en', 'AWS_DEFAULT_REGION', 'AWS_DEFAULT_REGION', '2021-10-18 11:00:51', '2021-10-18 11:00:51'),
(27779, 'en', 'AWS_BUCKET', 'AWS_BUCKET', '2021-10-18 11:00:51', '2021-10-18 11:00:51'),
(27780, 'en', 'AWS_URL', 'AWS_URL', '2021-10-18 11:00:51', '2021-10-18 11:00:51'),
(27781, 'en', 'S3 File System Activation', 'S3 File System Activation', '2021-10-18 11:00:51', '2021-10-18 11:00:51'),
(27782, 'en', 'Cache & Session Driver', 'Cache & Session Driver', '2021-10-18 11:00:51', '2021-10-18 11:00:51'),
(27783, 'en', 'CACHE_DRIVER', 'CACHE_DRIVER', '2021-10-18 11:00:51', '2021-10-18 11:00:51'),
(27784, 'en', 'redis', 'redis', '2021-10-18 11:00:51', '2021-10-18 11:00:51'),
(27785, 'en', 'SESSION_DRIVER', 'SESSION_DRIVER', '2021-10-18 11:00:51', '2021-10-18 11:00:51'),
(27786, 'en', 'Redis Configuration (If you use redis as any of the drivers)', 'Redis Configuration (If you use redis as any of the drivers)', '2021-10-18 11:00:51', '2021-10-18 11:00:51'),
(27787, 'en', 'REDIS_HOST', 'REDIS_HOST', '2021-10-18 11:00:51', '2021-10-18 11:00:51'),
(27788, 'en', 'REDIS_PASSWORD', 'REDIS_PASSWORD', '2021-10-18 11:00:51', '2021-10-18 11:00:51'),
(27789, 'en', 'REDIS_PORT', 'REDIS_PORT', '2021-10-18 11:00:51', '2021-10-18 11:00:51'),
(27790, 'en', 'Google Login Credential', 'Google Login Credential', '2021-10-18 11:01:02', '2021-10-18 11:01:02'),
(27791, 'en', 'Client ID', 'Client ID', '2021-10-18 11:01:02', '2021-10-18 11:01:02'),
(27792, 'en', 'Google Client ID', 'Google Client ID', '2021-10-18 11:01:02', '2021-10-18 11:01:02'),
(27793, 'en', 'Client Secret', 'Client Secret', '2021-10-18 11:01:02', '2021-10-18 11:01:02'),
(27794, 'en', 'Google Client Secret', 'Google Client Secret', '2021-10-18 11:01:02', '2021-10-18 11:01:02'),
(27795, 'en', 'Facebook Login Credential', 'Facebook Login Credential', '2021-10-18 11:01:02', '2021-10-18 11:01:02'),
(27796, 'en', 'App ID', 'App ID', '2021-10-18 11:01:02', '2021-10-18 11:01:02'),
(27797, 'en', 'Facebook Client ID', 'Facebook Client ID', '2021-10-18 11:01:02', '2021-10-18 11:01:02'),
(27798, 'en', 'App Secret', 'App Secret', '2021-10-18 11:01:02', '2021-10-18 11:01:02'),
(27799, 'en', 'Facebook Client Secret', 'Facebook Client Secret', '2021-10-18 11:01:02', '2021-10-18 11:01:02'),
(27800, 'en', 'Twitter Login Credential', 'Twitter Login Credential', '2021-10-18 11:01:02', '2021-10-18 11:01:02'),
(27801, 'en', 'Twitter Client ID', 'Twitter Client ID', '2021-10-18 11:01:02', '2021-10-18 11:01:02'),
(27802, 'en', 'Twitter Client Secret', 'Twitter Client Secret', '2021-10-18 11:01:02', '2021-10-18 11:01:02'),
(27803, 'en', 'Installed Addon', 'Installed Addon', '2021-10-18 11:26:08', '2021-10-18 11:26:08'),
(27804, 'en', 'Available Addon', 'Available Addon', '2021-10-18 11:26:08', '2021-10-18 11:26:08'),
(27805, 'en', 'Install/Update Addon', 'Install/Update Addon', '2021-10-18 11:26:08', '2021-10-18 11:26:08'),
(27806, 'en', 'Version', 'Version', '2021-10-18 11:26:08', '2021-10-18 11:26:08'),
(27807, 'en', 'Status updated successfully', 'Status updated successfully', '2021-10-18 11:26:08', '2021-10-18 11:26:08'),
(27808, 'en', 'Paypal Credential', 'Paypal Credential', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27809, 'en', 'Paypal Client Id', 'Paypal Client Id', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27810, 'en', 'Paypal Client Secret', 'Paypal Client Secret', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27811, 'en', 'Paypal Sandbox Mode', 'Paypal Sandbox Mode', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27812, 'en', 'Stripe Credential', 'Stripe Credential', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27813, 'en', 'Stripe Key', 'Stripe Key', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27814, 'en', 'Stripe Secret', 'Stripe Secret', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27815, 'en', 'Bkash Credential', 'Bkash Credential', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27816, 'en', 'BKASH CHECKOUT APP KEY', 'BKASH CHECKOUT APP KEY', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27817, 'en', 'BKASH CHECKOUT APP SECRET', 'BKASH CHECKOUT APP SECRET', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27818, 'en', 'BKASH CHECKOUT USER NAME', 'BKASH CHECKOUT USER NAME', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27819, 'en', 'BKASH CHECKOUT PASSWORD', 'BKASH CHECKOUT PASSWORD', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27820, 'en', 'Bkash Sandbox Mode', 'Bkash Sandbox Mode', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27821, 'en', 'Walletmix Credential', 'Walletmix Credential', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27822, 'en', 'WALLETMIX APP KEY', 'WALLETMIX APP KEY', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27823, 'en', 'WALLETMIX APP PASSWORD', 'WALLETMIX APP PASSWORD', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27824, 'en', 'WALLETMIX USER NAME', 'WALLETMIX USER NAME', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27825, 'en', 'WALLETMIX MERCHANT ID', 'WALLETMIX MERCHANT ID', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27826, 'en', 'WALLETMIX MERCHANT DOMAIN', 'WALLETMIX MERCHANT DOMAIN', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27827, 'en', 'Walletmix Enable', 'Walletmix Enable', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27828, 'en', 'Nagad Credential', 'Nagad Credential', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27829, 'en', 'NAGAD MODE', 'NAGAD MODE', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27830, 'en', 'NAGAD MERCHANT ID', 'NAGAD MERCHANT ID', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27831, 'en', 'NAGAD MERCHANT NUMBER', 'NAGAD MERCHANT NUMBER', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27832, 'en', 'NAGAD PG PUBLIC KEY', 'NAGAD PG PUBLIC KEY', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27833, 'en', 'NAGAD MERCHANT PRIVATE KEY', 'NAGAD MERCHANT PRIVATE KEY', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27834, 'en', 'Sslcommerz Credential', 'Sslcommerz Credential', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27835, 'en', 'Sslcz Store Id', 'Sslcz Store Id', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27836, 'en', 'Sslcz store password', 'Sslcz store password', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27837, 'en', 'Sslcommerz Sandbox Mode', 'Sslcommerz Sandbox Mode', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27838, 'en', 'Aamarpay Credential', 'Aamarpay Credential', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27839, 'en', 'Aamarpay Store Id', 'Aamarpay Store Id', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27840, 'en', 'Aamarpay signature key', 'Aamarpay signature key', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27841, 'en', 'Aamarpay Sandbox Mode', 'Aamarpay Sandbox Mode', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27842, 'en', 'Iyzico Credential', 'Iyzico Credential', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27843, 'en', 'IYZICO_API_KEY', 'IYZICO_API_KEY', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27844, 'en', 'IYZICO API KEY', 'IYZICO API KEY', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27845, 'en', 'IYZICO_SECRET_KEY', 'IYZICO_SECRET_KEY', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27846, 'en', 'IYZICO SECRET KEY', 'IYZICO SECRET KEY', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27847, 'en', 'IYZICO Sandbox Mode', 'IYZICO Sandbox Mode', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27848, 'en', 'Instamojo Credential', 'Instamojo Credential', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27849, 'en', 'API KEY', 'API KEY', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27850, 'en', 'IM API KEY', 'IM API KEY', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27851, 'en', 'AUTH TOKEN', 'AUTH TOKEN', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27852, 'en', 'IM AUTH TOKEN', 'IM AUTH TOKEN', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27853, 'en', 'Instamojo Sandbox Mode', 'Instamojo Sandbox Mode', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27854, 'en', 'PayStack Credential', 'PayStack Credential', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27855, 'en', 'PUBLIC KEY', 'PUBLIC KEY', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27856, 'en', 'SECRET KEY', 'SECRET KEY', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27857, 'en', 'MERCHANT EMAIL', 'MERCHANT EMAIL', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27858, 'en', 'PAYSTACK CURRENCY CODE', 'PAYSTACK CURRENCY CODE', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27859, 'en', 'Payhere Credential', 'Payhere Credential', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27860, 'en', 'PAYHERE MERCHANT ID', 'PAYHERE MERCHANT ID', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27861, 'en', 'PAYHERE SECRET', 'PAYHERE SECRET', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27862, 'en', 'PAYHERE CURRENCY', 'PAYHERE CURRENCY', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27863, 'en', 'Payhere Sandbox Mode', 'Payhere Sandbox Mode', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27864, 'en', 'Ngenius Credential', 'Ngenius Credential', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27865, 'en', 'NGENIUS OUTLET ID', 'NGENIUS OUTLET ID', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27866, 'en', 'NGENIUS API KEY', 'NGENIUS API KEY', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27867, 'en', 'NGENIUS CURRENCY', 'NGENIUS CURRENCY', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27868, 'en', 'ProxyPay Credential', 'ProxyPay Credential', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27869, 'en', 'PROXYPAY_TOKEN', 'PROXYPAY_TOKEN', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27870, 'en', 'PROXYPAY TOKEN', 'PROXYPAY TOKEN', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27871, 'en', 'PROXYPAY_ENTITY', 'PROXYPAY_ENTITY', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27872, 'en', 'PROXYPAY_END_TIME', 'PROXYPAY_END_TIME', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27873, 'en', 'Sandbox Mode', 'Sandbox Mode', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27874, 'en', 'VoguePay Credential', 'VoguePay Credential', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27875, 'en', 'MERCHANT ID', 'MERCHANT ID', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27876, 'en', 'RazorPay Credential', 'RazorPay Credential', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27877, 'en', 'RAZOR KEY', 'RAZOR KEY', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27878, 'en', 'RAZOR SECRET', 'RAZOR SECRET', '2021-10-19 09:32:09', '2021-10-19 09:32:09'),
(27879, 'en', 'Category has been deleted successfully', 'Category has been deleted successfully', '2021-11-04 11:51:41', '2021-11-04 11:51:41'),
(27880, 'en', 'Details Info', 'Details Info', '2021-11-09 06:05:14', '2021-11-09 06:05:14'),
(27881, 'en', 'Copy Link', 'Copy Link', '2021-11-09 06:05:14', '2021-11-09 06:05:14'),
(27882, 'en', 'Back to uploaded files', 'Back to uploaded files', '2021-11-09 06:05:22', '2021-11-09 06:05:22'),
(27883, 'en', 'Drag & drop your files', 'Drag & drop your files', '2021-11-09 06:05:22', '2021-11-09 06:05:22'),
(27884, 'en', 'Be a Seller', 'Be a Seller', '2021-11-09 06:54:05', '2021-11-09 06:54:05'),
(27885, 'en', 'Apply Now', 'Apply Now', '2021-11-09 06:54:05', '2021-11-09 06:54:05'),
(27886, 'en', 'Seller Products', 'Seller Products', '2021-11-09 06:58:45', '2021-11-09 06:58:45'),
(27887, 'en', 'All Seller', 'All Seller', '2021-11-09 06:58:45', '2021-11-09 06:58:45'),
(27888, 'en', 'Payouts', 'Payouts', '2021-11-09 06:58:45', '2021-11-09 06:58:45'),
(27889, 'en', 'Payout Requests', 'Payout Requests', '2021-11-09 06:58:45', '2021-11-09 06:58:45'),
(27890, 'en', 'Seller Commission', 'Seller Commission', '2021-11-09 06:58:45', '2021-11-09 06:58:45'),
(27891, 'en', 'Seller Verification Form', 'Seller Verification Form', '2021-11-09 06:58:45', '2021-11-09 06:58:45'),
(27892, 'en', 'POS Activation for Seller', 'POS Activation for Seller', '2021-11-09 10:27:48', '2021-11-09 10:27:48'),
(27893, 'en', 'Walk In Customer', 'Walk In Customer', '2021-11-09 10:27:56', '2021-11-09 10:27:56'),
(27894, 'en', 'QTY', 'QTY', '2021-11-09 10:27:56', '2021-11-09 10:27:56'),
(27895, 'en', 'Sub Total', 'Sub Total', '2021-11-09 10:27:56', '2021-11-09 10:27:56'),
(27896, 'en', 'Total Tax', 'Total Tax', '2021-11-09 10:27:56', '2021-11-09 10:27:56'),
(27897, 'en', 'Total Shipping', 'Total Shipping', '2021-11-09 10:27:56', '2021-11-09 10:27:56'),
(27898, 'en', 'Without Shipping Charge', 'Without Shipping Charge', '2021-11-09 10:27:56', '2021-11-09 10:27:56'),
(27899, 'en', 'With Shipping Charge', 'With Shipping Charge', '2021-11-09 10:27:56', '2021-11-09 10:27:56'),
(27900, 'en', 'Pay With Cash', 'Pay With Cash', '2021-11-09 10:27:56', '2021-11-09 10:27:56'),
(27901, 'en', 'Shipping Address', 'Shipping Address', '2021-11-09 10:27:56', '2021-11-09 10:27:56'),
(27902, 'en', 'Close', 'Close', '2021-11-09 10:27:56', '2021-11-09 10:27:56'),
(27903, 'en', 'Confirm', 'Confirm', '2021-11-09 10:27:56', '2021-11-09 10:27:56'),
(27904, 'en', 'Country', 'Country', '2021-11-09 10:27:56', '2021-11-09 10:27:56'),
(27905, 'en', 'Select country', 'Select country', '2021-11-09 10:27:56', '2021-11-09 10:27:56'),
(27906, 'en', 'City', 'City', '2021-11-09 10:27:56', '2021-11-09 10:27:56'),
(27907, 'en', 'Postal code', 'Postal code', '2021-11-09 10:27:56', '2021-11-09 10:27:56'),
(27908, 'en', 'Order Confirmation', 'Order Confirmation', '2021-11-09 10:27:56', '2021-11-09 10:27:56'),
(27909, 'en', 'Are you sure to confirm this order?', 'Are you sure to confirm this order?', '2021-11-09 10:27:56', '2021-11-09 10:27:56'),
(27910, 'en', 'Comfirm Order', 'Comfirm Order', '2021-11-09 10:27:56', '2021-11-09 10:27:56'),
(27911, 'en', 'Order Completed Successfully.', 'Order Completed Successfully.', '2021-11-09 10:27:56', '2021-11-09 10:27:56'),
(27912, 'en', 'Add New Address', 'Add New Address', '2021-11-09 10:28:11', '2021-11-09 10:28:11'),
(27913, 'en', 'All Notifications', 'All Notifications', '2021-11-09 10:30:45', '2021-11-09 10:30:45'),
(27914, 'en', ' has been Placed', ' has been Placed', '2021-11-09 10:30:45', '2021-11-09 10:30:45'),
(27915, 'en', 'No notification found', 'No notification found', '2021-11-09 10:31:04', '2021-11-09 10:31:04'),
(27916, 'en', 'Activate OTP', 'Activate OTP', '2021-11-09 10:34:14', '2021-11-09 10:34:14'),
(27917, 'en', 'Nexmo OTP', 'Nexmo OTP', '2021-11-09 10:34:14', '2021-11-09 10:34:14'),
(27918, 'en', 'Twillo OTP', 'Twillo OTP', '2021-11-09 10:34:14', '2021-11-09 10:34:14'),
(27919, 'en', 'SSL Wireless OTP', 'SSL Wireless OTP', '2021-11-09 10:34:14', '2021-11-09 10:34:14'),
(27920, 'en', 'Fast2SMS OTP', 'Fast2SMS OTP', '2021-11-09 10:34:14', '2021-11-09 10:34:14'),
(27921, 'en', 'MIMO OTP', 'MIMO OTP', '2021-11-09 10:34:14', '2021-11-09 10:34:14'),
(27922, 'en', 'OTP will be Used For', 'OTP will be Used For', '2021-11-09 10:34:14', '2021-11-09 10:34:14'),
(27923, 'en', 'Order Placement', 'Order Placement', '2021-11-09 10:34:14', '2021-11-09 10:34:14'),
(27924, 'en', 'Delivery Status Changing Time', 'Delivery Status Changing Time', '2021-11-09 10:34:14', '2021-11-09 10:34:14'),
(27925, 'en', 'Paid Status Changing Time', 'Paid Status Changing Time', '2021-11-09 10:34:14', '2021-11-09 10:34:14'),
(27926, 'en', 'Phone Number Verification', 'Phone Number Verification', '2021-11-09 10:34:21', '2021-11-09 10:34:21'),
(27927, 'en', 'Password Reset', 'Password Reset', '2021-11-09 10:34:22', '2021-11-09 10:34:22'),
(27928, 'en', 'Delivery Status Change', 'Delivery Status Change', '2021-11-09 10:34:22', '2021-11-09 10:34:22'),
(27929, 'en', 'Payment Status Change', 'Payment Status Change', '2021-11-09 10:34:22', '2021-11-09 10:34:22'),
(27930, 'en', 'Assign Delivery Boy', 'Assign Delivery Boy', '2021-11-09 10:34:22', '2021-11-09 10:34:22'),
(27931, 'en', 'SMS Body', 'SMS Body', '2021-11-09 10:34:22', '2021-11-09 10:34:22'),
(27932, 'en', 'Template ID', 'Template ID', '2021-11-09 10:34:22', '2021-11-09 10:34:22'),
(27933, 'en', 'Update Settings', 'Update Settings', '2021-11-09 10:34:22', '2021-11-09 10:34:22'),
(27934, 'en', 'Activation', 'Activation', '2021-11-09 10:34:22', '2021-11-09 10:34:22'),
(27935, 'en', 'Twillo Credential', 'Twillo Credential', '2021-11-09 10:34:26', '2021-11-09 10:34:26'),
(27936, 'en', 'TWILIO SID', 'TWILIO SID', '2021-11-09 10:34:26', '2021-11-09 10:34:26'),
(27937, 'en', 'TWILIO AUTH TOKEN', 'TWILIO AUTH TOKEN', '2021-11-09 10:34:26', '2021-11-09 10:34:26'),
(27938, 'en', 'TWILIO VERIFY SID', 'TWILIO VERIFY SID', '2021-11-09 10:34:26', '2021-11-09 10:34:26'),
(27939, 'en', 'VALID TWILLO NUMBER', 'VALID TWILLO NUMBER', '2021-11-09 10:34:26', '2021-11-09 10:34:26'),
(27940, 'en', 'Nexmo Credential', 'Nexmo Credential', '2021-11-09 10:34:26', '2021-11-09 10:34:26'),
(27941, 'en', 'NEXMO KEY', 'NEXMO KEY', '2021-11-09 10:34:26', '2021-11-09 10:34:26'),
(27942, 'en', 'NEXMO SECRET', 'NEXMO SECRET', '2021-11-09 10:34:26', '2021-11-09 10:34:26'),
(27943, 'en', 'SSL Wireless Credential', 'SSL Wireless Credential', '2021-11-09 10:34:26', '2021-11-09 10:34:26'),
(27944, 'en', 'SSL SMS API TOKEN', 'SSL SMS API TOKEN', '2021-11-09 10:34:26', '2021-11-09 10:34:26'),
(27945, 'en', 'SSL SMS SID', 'SSL SMS SID', '2021-11-09 10:34:26', '2021-11-09 10:34:26'),
(27946, 'en', 'SSL SMS URL', 'SSL SMS URL', '2021-11-09 10:34:26', '2021-11-09 10:34:26'),
(27947, 'en', 'Fast2SMS Credential', 'Fast2SMS Credential', '2021-11-09 10:34:26', '2021-11-09 10:34:26'),
(27948, 'en', 'AUTH KEY', 'AUTH KEY', '2021-11-09 10:34:26', '2021-11-09 10:34:26'),
(27949, 'en', 'ENTITY ID', 'ENTITY ID', '2021-11-09 10:34:26', '2021-11-09 10:34:26'),
(27950, 'en', 'ROUTE', 'ROUTE', '2021-11-09 10:34:26', '2021-11-09 10:34:26'),
(27951, 'en', 'DLT Manual', 'DLT Manual', '2021-11-09 10:34:26', '2021-11-09 10:34:26'),
(27952, 'en', 'Promotional Use', 'Promotional Use', '2021-11-09 10:34:26', '2021-11-09 10:34:26'),
(27953, 'en', 'Transactional Use', 'Transactional Use', '2021-11-09 10:34:26', '2021-11-09 10:34:26'),
(27954, 'en', 'LANGUAGE', 'LANGUAGE', '2021-11-09 10:34:26', '2021-11-09 10:34:26'),
(27955, 'en', 'SENDER ID', 'SENDER ID', '2021-11-09 10:34:26', '2021-11-09 10:34:26'),
(27956, 'en', 'MIMO Credential', 'MIMO Credential', '2021-11-09 10:34:26', '2021-11-09 10:34:26'),
(27957, 'en', 'MIMO_USERNAME', 'MIMO_USERNAME', '2021-11-09 10:34:26', '2021-11-09 10:34:26'),
(27958, 'en', 'MIMO_PASSWORD', 'MIMO_PASSWORD', '2021-11-09 10:34:26', '2021-11-09 10:34:26'),
(27959, 'en', 'MIMO_SENDER_ID', 'MIMO_SENDER_ID', '2021-11-09 10:34:26', '2021-11-09 10:34:26'),
(27960, 'en', 'Send Bulk SMS', 'Send Bulk SMS', '2021-11-09 10:36:13', '2021-11-09 10:36:13'),
(27961, 'en', 'Mobile Users', 'Mobile Users', '2021-11-09 10:36:13', '2021-11-09 10:36:13'),
(27962, 'en', 'SMS content', 'SMS content', '2021-11-09 10:36:13', '2021-11-09 10:36:13'),
(27963, 'en', 'Send Newsletter', 'Send Newsletter', '2021-11-09 10:36:40', '2021-11-09 10:36:40'),
(27964, 'en', 'Emails', 'Emails', '2021-11-09 10:36:40', '2021-11-09 10:36:40'),
(27965, 'en', 'Users', 'Users', '2021-11-09 10:36:40', '2021-11-09 10:36:40'),
(27966, 'en', 'Newsletter subject', 'Newsletter subject', '2021-11-09 10:36:40', '2021-11-09 10:36:40'),
(27967, 'en', 'Newsletter content', 'Newsletter content', '2021-11-09 10:36:40', '2021-11-09 10:36:40'),
(27968, 'en', 'All Subscribers', 'All Subscribers', '2021-11-09 10:37:06', '2021-11-09 10:37:06'),
(27969, 'en', 'All Coupons', 'All Coupons', '2021-11-09 10:37:11', '2021-11-09 10:37:11'),
(27970, 'en', 'Add New Coupon', 'Add New Coupon', '2021-11-09 10:37:12', '2021-11-09 10:37:12'),
(27971, 'en', 'Coupon Information', 'Coupon Information', '2021-11-09 10:37:12', '2021-11-09 10:37:12'),
(27972, 'en', 'Code', 'Code', '2021-11-09 10:37:12', '2021-11-09 10:37:12'),
(27973, 'en', 'Coupon Information Adding', 'Coupon Information Adding', '2021-11-09 10:37:26', '2021-11-09 10:37:26'),
(27974, 'en', 'Coupon Type', 'Coupon Type', '2021-11-09 10:37:26', '2021-11-09 10:37:26'),
(27975, 'en', 'Select One', 'Select One', '2021-11-09 10:37:26', '2021-11-09 10:37:26'),
(27976, 'en', 'For Products', 'For Products', '2021-11-09 10:37:26', '2021-11-09 10:37:26'),
(27977, 'en', 'For Total Orders', 'For Total Orders', '2021-11-09 10:37:26', '2021-11-09 10:37:26'),
(27978, 'en', 'Add Your Product Base Coupon', 'Add Your Product Base Coupon', '2021-11-09 10:37:32', '2021-11-09 10:37:32'),
(27979, 'en', 'Coupon code', 'Coupon code', '2021-11-09 10:37:32', '2021-11-09 10:37:32'),
(27980, 'en', 'Amount', 'Amount', '2021-11-09 10:37:32', '2021-11-09 10:37:32'),
(27981, 'en', 'Add Your Cart Base Coupon', 'Add Your Cart Base Coupon', '2021-11-09 10:38:03', '2021-11-09 10:38:03'),
(27982, 'en', 'Minimum Shopping', 'Minimum Shopping', '2021-11-09 10:38:03', '2021-11-09 10:38:03'),
(27983, 'en', 'Maximum Discount Amount', 'Maximum Discount Amount', '2021-11-09 10:38:03', '2021-11-09 10:38:03'),
(27984, 'en', 'Convert Point To Wallet', 'Convert Point To Wallet', '2021-11-10 04:57:35', '2021-11-10 04:57:35'),
(27985, 'en', 'Set Point For ', 'Set Point For ', '2021-11-10 04:57:35', '2021-11-10 04:57:35'),
(27986, 'en', 'Points', 'Points', '2021-11-10 04:57:35', '2021-11-10 04:57:35'),
(27987, 'en', 'Note: You need to activate wallet option first before using club point addon.', 'Note: You need to activate wallet option first before using club point addon.', '2021-11-10 04:57:35', '2021-11-10 04:57:35'),
(27988, 'en', 'Owner', 'Owner', '2021-11-10 04:57:50', '2021-11-10 04:57:50'),
(27989, 'en', 'Point', 'Point', '2021-11-10 04:57:50', '2021-11-10 04:57:50'),
(27990, 'en', 'Set Point for Product Within a Range', 'Set Point for Product Within a Range', '2021-11-10 04:57:50', '2021-11-10 04:57:50'),
(27991, 'en', 'Set any specific point for those products what are between Min-price and Max-price. Min-price should be less than Max-price', 'Set any specific point for those products what are between Min-price and Max-price. Min-price should be less than Max-price', '2021-11-10 04:57:50', '2021-11-10 04:57:50'),
(27992, 'en', 'Set Point for multiple products', 'Set Point for multiple products', '2021-11-10 04:57:50', '2021-11-10 04:57:50'),
(27993, 'en', 'Min Price', 'Min Price', '2021-11-10 04:57:50', '2021-11-10 04:57:50'),
(27994, 'en', 'Max Price', 'Max Price', '2021-11-10 04:57:50', '2021-11-10 04:57:50'),
(27995, 'en', 'Set Point for all Products', 'Set Point for all Products', '2021-11-10 04:57:50', '2021-11-10 04:57:50'),
(27996, 'en', 'Customer Name', 'Customer Name', '2021-11-10 04:58:11', '2021-11-10 04:58:11'),
(27997, 'en', 'Convert Status', 'Convert Status', '2021-11-10 04:58:11', '2021-11-10 04:58:11'),
(27998, 'en', 'Earned At', 'Earned At', '2021-11-10 04:58:11', '2021-11-10 04:58:11'),
(27999, 'en', 'Order not found', 'Order not found', '2021-11-10 04:58:11', '2021-11-10 04:58:11'),
(28000, 'en', 'User not found', 'User not found', '2021-11-10 04:58:11', '2021-11-10 04:58:11'),
(28001, 'en', 'Pending', 'Pending', '2021-11-10 04:58:11', '2021-11-10 04:58:11'),
(28002, 'en', 'Add New Digital Product', 'Add New Digital Product', '2021-11-10 06:48:25', '2021-11-10 06:48:25'),
(28003, 'en', 'Product File', 'Product File', '2021-11-10 06:48:29', '2021-11-10 06:48:29'),
(28004, 'en', 'Images', 'Images', '2021-11-10 06:48:29', '2021-11-10 06:48:29'),
(28005, 'en', 'Main Images', 'Main Images', '2021-11-10 06:48:29', '2021-11-10 06:48:29'),
(28006, 'en', 'Meta Tags', 'Meta Tags', '2021-11-10 06:48:29', '2021-11-10 06:48:29'),
(28007, 'en', 'Purchase price', 'Purchase price', '2021-11-10 06:48:29', '2021-11-10 06:48:29'),
(28008, 'en', 'Save Product', 'Save Product', '2021-11-10 06:48:29', '2021-11-10 06:48:29'),
(28009, 'en', 'Product Bulk Upload', 'Product Bulk Upload', '2021-11-10 06:51:00', '2021-11-10 06:51:00'),
(28010, 'en', 'Step 1', 'Step 1', '2021-11-10 06:51:00', '2021-11-10 06:51:00'),
(28011, 'en', 'Download the skeleton file and fill it with proper data', 'Download the skeleton file and fill it with proper data', '2021-11-10 06:51:00', '2021-11-10 06:51:00'),
(28012, 'en', 'You can download the example file to understand how the data must be filled', 'You can download the example file to understand how the data must be filled', '2021-11-10 06:51:00', '2021-11-10 06:51:00'),
(28013, 'en', 'Once you have downloaded and filled the skeleton file, upload it in the form below and submit', 'Once you have downloaded and filled the skeleton file, upload it in the form below and submit', '2021-11-10 06:51:00', '2021-11-10 06:51:00'),
(28014, 'en', 'After uploading products you need to edit them and set product\'s images and choices', 'After uploading products you need to edit them and set product\'s images and choices', '2021-11-10 06:51:00', '2021-11-10 06:51:00'),
(28015, 'en', 'Download CSV', 'Download CSV', '2021-11-10 06:51:00', '2021-11-10 06:51:00'),
(28016, 'en', 'Step 2', 'Step 2', '2021-11-10 06:51:00', '2021-11-10 06:51:00'),
(28017, 'en', 'Category and Brand should be in numerical id', 'Category and Brand should be in numerical id', '2021-11-10 06:51:00', '2021-11-10 06:51:00'),
(28018, 'en', 'You can download the pdf to get Category and Brand id', 'You can download the pdf to get Category and Brand id', '2021-11-10 06:51:00', '2021-11-10 06:51:00'),
(28019, 'en', 'Download Category', 'Download Category', '2021-11-10 06:51:00', '2021-11-10 06:51:00'),
(28020, 'en', 'Download Brand', 'Download Brand', '2021-11-10 06:51:00', '2021-11-10 06:51:00'),
(28021, 'en', 'Upload Product File', 'Upload Product File', '2021-11-10 06:51:00', '2021-11-10 06:51:00'),
(28022, 'en', 'Upload CSV', 'Upload CSV', '2021-11-10 06:51:01', '2021-11-10 06:51:01'),
(28023, 'en', 'Logo', 'Logo', '2021-11-10 06:51:18', '2021-11-10 06:51:18'),
(28024, 'en', 'Add New Brand', 'Add New Brand', '2021-11-10 06:51:18', '2021-11-10 06:51:18'),
(28025, 'en', '120x80', '120x80', '2021-11-10 06:51:18', '2021-11-10 06:51:18'),
(28026, 'en', 'Change Order Status', 'Change Order Status', '2021-11-10 06:51:33', '2021-11-10 06:51:33'),
(28027, 'en', 'Choose an order status', 'Choose an order status', '2021-11-10 06:51:33', '2021-11-10 06:51:33'),
(28028, 'en', 'Confirmed', 'Confirmed', '2021-11-10 06:51:33', '2021-11-10 06:51:33'),
(28029, 'en', 'Picked Up', 'Picked Up', '2021-11-10 06:51:33', '2021-11-10 06:51:33'),
(28030, 'en', 'On The Way', 'On The Way', '2021-11-10 06:51:33', '2021-11-10 06:51:33'),
(28031, 'en', 'Delivered', 'Delivered', '2021-11-10 06:51:33', '2021-11-10 06:51:33'),
(28032, 'en', 'Filter by date', 'Filter by date', '2021-11-10 06:51:33', '2021-11-10 06:51:33'),
(28033, 'en', 'Type Order code & hit Enter', 'Type Order code & hit Enter', '2021-11-10 06:51:33', '2021-11-10 06:51:33'),
(28034, 'en', 'Filter', 'Filter', '2021-11-10 06:51:33', '2021-11-10 06:51:33'),
(28035, 'en', 'Num. of Products', 'Num. of Products', '2021-11-10 06:51:33', '2021-11-10 06:51:33'),
(28036, 'en', 'Delivery Status', 'Delivery Status', '2021-11-10 06:51:33', '2021-11-10 06:51:33'),
(28037, 'en', 'Payment Status', 'Payment Status', '2021-11-10 06:51:33', '2021-11-10 06:51:33'),
(28038, 'en', 'Refund', 'Refund', '2021-11-10 06:51:33', '2021-11-10 06:51:33'),
(28039, 'en', 'Filter by Payment Status', 'Filter by Payment Status', '2021-11-10 06:51:41', '2021-11-10 06:51:41'),
(28040, 'en', 'Paid', 'Paid', '2021-11-10 06:51:41', '2021-11-10 06:51:41'),
(28041, 'en', 'Un-Paid', 'Un-Paid', '2021-11-10 06:51:41', '2021-11-10 06:51:41'),
(28042, 'en', 'Filter by Deliver Status', 'Filter by Deliver Status', '2021-11-10 06:51:41', '2021-11-10 06:51:41'),
(28043, 'en', 'On delivery', 'On delivery', '2021-11-10 06:51:41', '2021-11-10 06:51:41'),
(28044, 'en', 'Payment Method', 'Payment Method', '2021-11-10 06:51:41', '2021-11-10 06:51:41'),
(28045, 'en', 'Seller', 'Seller', '2021-11-10 07:18:05', '2021-11-10 07:18:05'),
(28046, 'en', 'Pickup Point Orders', 'Pickup Point Orders', '2021-11-10 07:19:46', '2021-11-10 07:19:46'),
(28047, 'en', 'All Delivery Boys', 'All Delivery Boys', '2021-11-10 07:21:41', '2021-11-10 07:21:41'),
(28048, 'en', 'Add New Delivery Boy', 'Add New Delivery Boy', '2021-11-10 07:21:41', '2021-11-10 07:21:41'),
(28049, 'en', 'Delivery Boys', 'Delivery Boys', '2021-11-10 07:21:41', '2021-11-10 07:21:41'),
(28050, 'en', 'Collection', 'Collection', '2021-11-10 07:21:41', '2021-11-10 07:21:41'),
(28051, 'en', 'Do you really want to ban this delivery_boy?', 'Do you really want to ban this delivery_boy?', '2021-11-10 07:21:41', '2021-11-10 07:21:41'),
(28052, 'en', 'Do you really want to unban this delivery_boy?', 'Do you really want to unban this delivery_boy?', '2021-11-10 07:21:41', '2021-11-10 07:21:41'),
(28053, 'en', 'Delivery Boy Information', 'Delivery Boy Information', '2021-11-10 07:21:45', '2021-11-10 07:21:45'),
(28054, 'en', 'Select City', 'Select City', '2021-11-10 07:21:45', '2021-11-10 07:21:45'),
(28055, 'en', 'All Cancel Request', 'All Cancel Request', '2021-11-10 07:21:56', '2021-11-10 07:21:56'),
(28056, 'en', 'Cancel Requests', 'Cancel Requests', '2021-11-10 07:21:56', '2021-11-10 07:21:56'),
(28057, 'en', 'Request By', 'Request By', '2021-11-10 07:21:56', '2021-11-10 07:21:56'),
(28058, 'en', 'Request At', 'Request At', '2021-11-10 07:21:56', '2021-11-10 07:21:56'),
(28059, 'en', 'Payment Configuration', 'Payment Configuration', '2021-11-10 07:22:00', '2021-11-10 07:22:00'),
(28060, 'en', 'Monthly Salary', 'Monthly Salary', '2021-11-10 07:22:00', '2021-11-10 07:22:00'),
(28061, 'en', 'Salary Amount', 'Salary Amount', '2021-11-10 07:22:00', '2021-11-10 07:22:00'),
(28062, 'en', 'Per Order Commission', 'Per Order Commission', '2021-11-10 07:22:00', '2021-11-10 07:22:00'),
(28063, 'en', 'Notification Configuration', 'Notification Configuration', '2021-11-10 07:22:00', '2021-11-10 07:22:00'),
(28064, 'en', 'Send Mail', 'Send Mail', '2021-11-10 07:22:00', '2021-11-10 07:22:00'),
(28065, 'en', 'Send OTP', 'Send OTP', '2021-11-10 07:22:00', '2021-11-10 07:22:00'),
(28066, 'en', 'Refund Request All', 'Refund Request All', '2021-11-10 07:29:26', '2021-11-10 07:29:26'),
(28067, 'en', 'Seller Name', 'Seller Name', '2021-11-10 07:29:26', '2021-11-10 07:29:26'),
(28068, 'en', 'Seller Approval', 'Seller Approval', '2021-11-10 07:29:26', '2021-11-10 07:29:26'),
(28069, 'en', 'Refund Status', 'Refund Status', '2021-11-10 07:29:26', '2021-11-10 07:29:26'),
(28070, 'en', 'Reject Refund Request !', 'Reject Refund Request !', '2021-11-10 07:29:26', '2021-11-10 07:29:26'),
(28071, 'en', 'Reject Reason', 'Reject Reason', '2021-11-10 07:29:26', '2021-11-10 07:29:26'),
(28072, 'en', 'Submit', 'Submit', '2021-11-10 07:29:26', '2021-11-10 07:29:26'),
(28073, 'en', 'Approval has been done successfully', 'Approval has been done successfully', '2021-11-10 07:29:26', '2021-11-10 07:29:26'),
(28074, 'en', 'Refund has been sent successfully', 'Refund has been sent successfully', '2021-11-10 07:29:26', '2021-11-10 07:29:26'),
(28075, 'en', 'Approved Request', 'Approved Request', '2021-11-10 07:29:30', '2021-11-10 07:29:30'),
(28076, 'en', 'Admin Approval', 'Admin Approval', '2021-11-10 07:29:30', '2021-11-10 07:29:30'),
(28077, 'en', 'Rejected Request', 'Rejected Request', '2021-11-10 07:29:34', '2021-11-10 07:29:34'),
(28078, 'en', 'Refund Request Reject Reason', 'Refund Request Reject Reason', '2021-11-10 07:29:34', '2021-11-10 07:29:34'),
(28079, 'en', 'Set Refund Time', 'Set Refund Time', '2021-11-10 07:29:36', '2021-11-10 07:29:36'),
(28080, 'en', 'Set Time for sending Refund Request', 'Set Time for sending Refund Request', '2021-11-10 07:29:36', '2021-11-10 07:29:36'),
(28081, 'en', 'Set Refund Sticker', 'Set Refund Sticker', '2021-11-10 07:29:36', '2021-11-10 07:29:36'),
(28082, 'en', 'Sticker', 'Sticker', '2021-11-10 07:29:36', '2021-11-10 07:29:36'),
(28083, 'en', 'Inhouse Product sale report', 'Inhouse Product sale report', '2021-11-10 07:30:51', '2021-11-10 07:30:51'),
(28084, 'en', 'Sort by Category', 'Sort by Category', '2021-11-10 07:30:51', '2021-11-10 07:30:51'),
(28085, 'en', 'Support Desk', 'Support Desk', '2021-11-10 07:35:09', '2021-11-10 07:35:09'),
(28086, 'en', 'Type ticket code & Enter', 'Type ticket code & Enter', '2021-11-10 07:35:09', '2021-11-10 07:35:09'),
(28087, 'en', 'Ticket ID', 'Ticket ID', '2021-11-10 07:35:09', '2021-11-10 07:35:09'),
(28088, 'en', 'Sending Date', 'Sending Date', '2021-11-10 07:35:09', '2021-11-10 07:35:09'),
(28089, 'en', 'Subject', 'Subject', '2021-11-10 07:35:09', '2021-11-10 07:35:09'),
(28090, 'en', 'User', 'User', '2021-11-10 07:35:09', '2021-11-10 07:35:09'),
(28091, 'en', 'Last reply', 'Last reply', '2021-11-10 07:35:09', '2021-11-10 07:35:09'),
(28092, 'en', 'Conversations', 'Conversations', '2021-11-10 07:35:13', '2021-11-10 07:35:13'),
(28093, 'en', 'Sender', 'Sender', '2021-11-10 07:35:13', '2021-11-10 07:35:13'),
(28094, 'en', 'Receiver', 'Receiver', '2021-11-10 07:35:13', '2021-11-10 07:35:13'),
(28095, 'en', 'New', 'New', '2021-11-10 07:35:13', '2021-11-10 07:35:13'),
(28096, 'en', 'Text Input', 'Text Input', '2021-11-10 07:35:31', '2021-11-10 07:35:31'),
(28097, 'en', 'Select', 'Select', '2021-11-10 07:35:31', '2021-11-10 07:35:31'),
(28098, 'en', 'Multiple Select', 'Multiple Select', '2021-11-10 07:35:31', '2021-11-10 07:35:31'),
(28099, 'en', 'Radio', 'Radio', '2021-11-10 07:35:31', '2021-11-10 07:35:31'),
(28100, 'en', 'Basic Affiliate', 'Basic Affiliate', '2021-11-10 07:35:41', '2021-11-10 07:35:41'),
(28101, 'en', 'User Registration & First Purchase', 'User Registration & First Purchase', '2021-11-10 07:35:41', '2021-11-10 07:35:41'),
(28102, 'en', 'Product Sharing Affiliate', 'Product Sharing Affiliate', '2021-11-10 07:35:41', '2021-11-10 07:35:41'),
(28103, 'en', 'Product Sharing and Purchasing', 'Product Sharing and Purchasing', '2021-11-10 07:35:41', '2021-11-10 07:35:41'),
(28104, 'en', 'Product Sharing Affiliate (Category Wise)', 'Product Sharing Affiliate (Category Wise)', '2021-11-10 07:35:41', '2021-11-10 07:35:41'),
(28105, 'en', 'N:B: You can not enable Single Product Sharing Affiliate and Category Wise Affiliate at a time.', 'N:B: You can not enable Single Product Sharing Affiliate and Category Wise Affiliate at a time.', '2021-11-10 07:35:41', '2021-11-10 07:35:41'),
(28106, 'en', 'Affiliate Link Validatin Time (Days)', 'Affiliate Link Validatin Time (Days)', '2021-11-10 07:35:41', '2021-11-10 07:35:41'),
(28107, 'en', 'Validation Time', 'Validation Time', '2021-11-10 07:35:41', '2021-11-10 07:35:41'),
(28108, 'en', 'Verification Info', 'Verification Info', '2021-11-10 07:37:58', '2021-11-10 07:37:58'),
(28109, 'en', 'Approval', 'Approval', '2021-11-10 07:37:58', '2021-11-10 07:37:58'),
(28110, 'en', 'Due Amount', 'Due Amount', '2021-11-10 07:37:58', '2021-11-10 07:37:58'),
(28111, 'en', 'Approved sellers updated successfully', 'Approved sellers updated successfully', '2021-11-10 07:37:58', '2021-11-10 07:37:58'),
(28112, 'en', 'Refferal Users', 'Refferal Users', '2021-11-10 07:38:06', '2021-11-10 07:38:06'),
(28113, 'en', 'Reffered By', 'Reffered By', '2021-11-10 07:38:06', '2021-11-10 07:38:06'),
(28114, 'en', 'Affiliate Withdraw Request', 'Affiliate Withdraw Request', '2021-11-10 07:38:09', '2021-11-10 07:38:09'),
(28115, 'en', 'Affiliate Withdraw Request Reject', 'Affiliate Withdraw Request Reject', '2021-11-10 07:38:09', '2021-11-10 07:38:09');
INSERT INTO `translations` (`id`, `lang`, `lang_key`, `lang_value`, `created_at`, `updated_at`) VALUES
(28116, 'en', 'Are you sure, You want to reject this?', 'Are you sure, You want to reject this?', '2021-11-10 07:38:09', '2021-11-10 07:38:09'),
(28117, 'en', 'Reject', 'Reject', '2021-11-10 07:38:09', '2021-11-10 07:38:09'),
(28118, 'en', 'Referred By', 'Referred By', '2021-11-10 07:38:13', '2021-11-10 07:38:13'),
(28119, 'en', 'Referral User', 'Referral User', '2021-11-10 07:38:13', '2021-11-10 07:38:13'),
(28120, 'en', 'Order Id', 'Order Id', '2021-11-10 07:38:14', '2021-11-10 07:38:14'),
(28121, 'en', 'Referral Type', 'Referral Type', '2021-11-10 07:38:14', '2021-11-10 07:38:14'),
(28122, 'en', 'Classified Products', 'Classified Products', '2021-11-10 07:39:55', '2021-11-10 07:39:55'),
(28123, 'en', 'Classified Packages', 'Classified Packages', '2021-11-10 07:39:55', '2021-11-10 07:39:55'),
(28124, 'en', 'Sendmail', 'Sendmail', '2021-11-10 08:46:59', '2021-11-10 08:46:59'),
(28125, 'en', 'SMTP', 'SMTP', '2021-11-10 08:46:59', '2021-11-10 08:46:59'),
(28126, 'en', 'Mailgun', 'Mailgun', '2021-11-10 08:46:59', '2021-11-10 08:46:59'),
(28127, 'en', 'MAIL HOST', 'MAIL HOST', '2021-11-10 08:46:59', '2021-11-10 08:46:59'),
(28128, 'en', 'MAIL PORT', 'MAIL PORT', '2021-11-10 08:46:59', '2021-11-10 08:46:59'),
(28129, 'en', 'MAIL USERNAME', 'MAIL USERNAME', '2021-11-10 08:46:59', '2021-11-10 08:46:59'),
(28130, 'en', 'MAIL PASSWORD', 'MAIL PASSWORD', '2021-11-10 08:46:59', '2021-11-10 08:46:59'),
(28131, 'en', 'MAIL ENCRYPTION', 'MAIL ENCRYPTION', '2021-11-10 08:46:59', '2021-11-10 08:46:59'),
(28132, 'en', 'MAIL FROM ADDRESS', 'MAIL FROM ADDRESS', '2021-11-10 08:46:59', '2021-11-10 08:46:59'),
(28133, 'en', 'MAIL FROM NAME', 'MAIL FROM NAME', '2021-11-10 08:46:59', '2021-11-10 08:46:59'),
(28134, 'en', 'MAILGUN DOMAIN', 'MAILGUN DOMAIN', '2021-11-10 08:46:59', '2021-11-10 08:46:59'),
(28135, 'en', 'MAILGUN SECRET', 'MAILGUN SECRET', '2021-11-10 08:46:59', '2021-11-10 08:46:59'),
(28136, 'en', 'Save Configuration', 'Save Configuration', '2021-11-10 08:46:59', '2021-11-10 08:46:59'),
(28137, 'en', 'Test SMTP configuration', 'Test SMTP configuration', '2021-11-10 08:46:59', '2021-11-10 08:46:59'),
(28138, 'en', 'Enter your email address', 'Enter your email address', '2021-11-10 08:46:59', '2021-11-10 08:46:59'),
(28139, 'en', 'Send test email', 'Send test email', '2021-11-10 08:46:59', '2021-11-10 08:46:59'),
(28140, 'en', 'Instruction', 'Instruction', '2021-11-10 08:46:59', '2021-11-10 08:46:59'),
(28141, 'en', 'Please be carefull when you are configuring SMTP. For incorrect configuration you will get error at the time of order place, new registration, sending newsletter.', 'Please be carefull when you are configuring SMTP. For incorrect configuration you will get error at the time of order place, new registration, sending newsletter.', '2021-11-10 08:46:59', '2021-11-10 08:46:59'),
(28142, 'en', 'For Non-SSL', 'For Non-SSL', '2021-11-10 08:46:59', '2021-11-10 08:46:59'),
(28143, 'en', 'Select sendmail for Mail Driver if you face any issue after configuring smtp as Mail Driver ', 'Select sendmail for Mail Driver if you face any issue after configuring smtp as Mail Driver ', '2021-11-10 08:46:59', '2021-11-10 08:46:59'),
(28144, 'en', 'Set Mail Host according to your server Mail Client Manual Settings', 'Set Mail Host according to your server Mail Client Manual Settings', '2021-11-10 08:46:59', '2021-11-10 08:46:59'),
(28145, 'en', 'Set Mail port as 587', 'Set Mail port as 587', '2021-11-10 08:46:59', '2021-11-10 08:46:59'),
(28146, 'en', 'Set Mail Encryption as ssl if you face issue with tls', 'Set Mail Encryption as ssl if you face issue with tls', '2021-11-10 08:46:59', '2021-11-10 08:46:59'),
(28147, 'en', 'For SSL', 'For SSL', '2021-11-10 08:46:59', '2021-11-10 08:46:59'),
(28148, 'en', 'Set Mail port as 465', 'Set Mail port as 465', '2021-11-10 08:46:59', '2021-11-10 08:46:59'),
(28149, 'en', 'Set Mail Encryption as ssl', 'Set Mail Encryption as ssl', '2021-11-10 08:46:59', '2021-11-10 08:46:59'),
(28150, 'en', 'Google Firebase Setting', 'Google Firebase Setting', '2021-11-10 10:10:34', '2021-11-10 10:10:34'),
(28151, 'en', 'FCM SERVER KEY', 'FCM SERVER KEY', '2021-11-10 10:10:34', '2021-11-10 10:10:34'),
(28152, 'en', 'Phone Verification', 'Phone Verification', '2021-11-10 10:21:39', '2021-11-10 10:21:39'),
(28153, 'en', 'Resend Code', 'Resend Code', '2021-11-10 10:21:39', '2021-11-10 10:21:39'),
(28154, 'en', 'Verify', 'Verify', '2021-11-10 10:21:39', '2021-11-10 10:21:39'),
(28155, 'en', 'My Panel', 'My Panel', '2021-11-10 10:21:39', '2021-11-10 10:21:39'),
(28156, 'en', 'Purchase History', 'Purchase History', '2021-11-10 10:21:40', '2021-11-10 10:21:40'),
(28157, 'en', 'Downloads', 'Downloads', '2021-11-10 10:21:40', '2021-11-10 10:21:40'),
(28158, 'en', 'Sent Refund Request', 'Sent Refund Request', '2021-11-10 10:21:40', '2021-11-10 10:21:40'),
(28159, 'en', 'My Wallet', 'My Wallet', '2021-11-10 10:21:40', '2021-11-10 10:21:40'),
(28160, 'en', 'Support Ticket', 'Support Ticket', '2021-11-10 10:21:40', '2021-11-10 10:21:40'),
(28161, 'en', 'Manage Profile', 'Manage Profile', '2021-11-10 10:21:40', '2021-11-10 10:21:40'),
(28162, 'en', 'Item has been added to wishlist', 'Item has been added to wishlist', '2021-11-10 10:21:40', '2021-11-10 10:21:40'),
(28163, 'en', 'Google Map Setting', 'Google Map Setting', '2021-11-10 10:52:27', '2021-11-10 10:52:27'),
(28164, 'en', 'Map API KEY', 'Map API KEY', '2021-11-10 10:52:28', '2021-11-10 10:52:28'),
(28165, 'en', 'Facebook Pixel Setting', 'Facebook Pixel Setting', '2021-11-10 10:52:41', '2021-11-10 10:52:41'),
(28166, 'en', 'Facebook Pixel', 'Facebook Pixel', '2021-11-10 10:52:41', '2021-11-10 10:52:41'),
(28167, 'en', 'Facebook Pixel ID', 'Facebook Pixel ID', '2021-11-10 10:52:41', '2021-11-10 10:52:41'),
(28168, 'en', 'Please be carefull when you are configuring Facebook pixel.', 'Please be carefull when you are configuring Facebook pixel.', '2021-11-10 10:52:41', '2021-11-10 10:52:41'),
(28169, 'en', 'Log in to Facebook and go to your Ads Manager account', 'Log in to Facebook and go to your Ads Manager account', '2021-11-10 10:52:41', '2021-11-10 10:52:41'),
(28170, 'en', 'Open the Navigation Bar and select Events Manager', 'Open the Navigation Bar and select Events Manager', '2021-11-10 10:52:41', '2021-11-10 10:52:41'),
(28171, 'en', 'Copy your Pixel ID from underneath your Site Name and paste the number into Facebook Pixel ID field', 'Copy your Pixel ID from underneath your Site Name and paste the number into Facebook Pixel ID field', '2021-11-10 10:52:41', '2021-11-10 10:52:41'),
(28172, 'en', 'Google Analytics Setting', 'Google Analytics Setting', '2021-11-10 10:52:41', '2021-11-10 10:52:41'),
(28173, 'en', 'Google Analytics', 'Google Analytics', '2021-11-10 10:52:41', '2021-11-10 10:52:41'),
(28174, 'en', 'Tracking ID', 'Tracking ID', '2021-11-10 10:52:41', '2021-11-10 10:52:41'),
(28175, 'en', 'Google reCAPTCHA Setting', 'Google reCAPTCHA Setting', '2021-11-10 10:53:03', '2021-11-10 10:53:03'),
(28176, 'en', 'Site KEY', 'Site KEY', '2021-11-10 10:53:03', '2021-11-10 10:53:03'),
(28177, 'en', 'All cities', 'All cities', '2021-11-10 10:53:18', '2021-11-10 10:53:18'),
(28178, 'en', 'Cities', 'Cities', '2021-11-10 10:53:18', '2021-11-10 10:53:18'),
(28179, 'en', 'Cost', 'Cost', '2021-11-10 10:53:18', '2021-11-10 10:53:18'),
(28180, 'en', 'Add New city', 'Add New city', '2021-11-10 10:53:18', '2021-11-10 10:53:18'),
(28181, 'en', 'Select Shipping Method', 'Select Shipping Method', '2021-11-23 05:43:22', '2021-11-23 05:43:22'),
(28182, 'en', 'Product Wise Shipping Cost', 'Product Wise Shipping Cost', '2021-11-23 05:43:22', '2021-11-23 05:43:22'),
(28183, 'en', 'Flat Rate Shipping Cost', 'Flat Rate Shipping Cost', '2021-11-23 05:43:22', '2021-11-23 05:43:22'),
(28184, 'en', 'Seller Wise Flat Shipping Cost', 'Seller Wise Flat Shipping Cost', '2021-11-23 05:43:22', '2021-11-23 05:43:22'),
(28185, 'en', 'Area Wise Flat Shipping Cost', 'Area Wise Flat Shipping Cost', '2021-11-23 05:43:22', '2021-11-23 05:43:22'),
(28186, 'en', 'Note', 'Note', '2021-11-23 05:43:22', '2021-11-23 05:43:22'),
(28187, 'en', 'Product Wise Shipping Cost calulation: Shipping cost is calculate by addition of each product shipping cost', 'Product Wise Shipping Cost calulation: Shipping cost is calculate by addition of each product shipping cost', '2021-11-23 05:43:22', '2021-11-23 05:43:22'),
(28188, 'en', 'Flat Rate Shipping Cost calulation: How many products a customer purchase, doesn\'t matter. Shipping cost is fixed', 'Flat Rate Shipping Cost calulation: How many products a customer purchase, doesn\'t matter. Shipping cost is fixed', '2021-11-23 05:43:22', '2021-11-23 05:43:22'),
(28189, 'en', 'Seller Wise Flat Shipping Cost calulation: Fixed rate for each seller. If customers purchase 2 product from two seller shipping cost is calculated by addition of each seller flat shipping cost', 'Seller Wise Flat Shipping Cost calulation: Fixed rate for each seller. If customers purchase 2 product from two seller shipping cost is calculated by addition of each seller flat shipping cost', '2021-11-23 05:43:22', '2021-11-23 05:43:22'),
(28190, 'en', 'Area Wise Flat Shipping Cost calulation: Fixed rate for each area. If customers purchase multiple products from one seller shipping cost is calculated by the customer shipping area. To configure area wise shipping cost go to ', 'Area Wise Flat Shipping Cost calulation: Fixed rate for each area. If customers purchase multiple products from one seller shipping cost is calculated by the customer shipping area. To configure area wise shipping cost go to ', '2021-11-23 05:43:22', '2021-11-23 05:43:22'),
(28191, 'en', 'Flat Rate Cost', 'Flat Rate Cost', '2021-11-23 05:43:22', '2021-11-23 05:43:22'),
(28192, 'en', '1. Flat rate shipping cost is applicable if Flat rate shipping is enabled.', '1. Flat rate shipping cost is applicable if Flat rate shipping is enabled.', '2021-11-23 05:43:22', '2021-11-23 05:43:22'),
(28193, 'en', 'Shipping Cost for Admin Products', 'Shipping Cost for Admin Products', '2021-11-23 05:43:22', '2021-11-23 05:43:22'),
(28194, 'en', '1. Shipping cost for admin is applicable if Seller wise shipping cost is enabled.', '1. Shipping cost for admin is applicable if Seller wise shipping cost is enabled.', '2021-11-23 05:43:22', '2021-11-23 05:43:22'),
(28195, 'en', 'Countries', 'Countries', '2021-11-23 05:43:28', '2021-11-23 05:43:28'),
(28196, 'en', 'Show/Hide', 'Show/Hide', '2021-11-23 05:43:28', '2021-11-23 05:43:28'),
(28197, 'en', 'Country status updated successfully', 'Country status updated successfully', '2021-11-23 05:43:28', '2021-11-23 05:43:28'),
(28198, 'en', 'All Taxes', 'All Taxes', '2021-11-25 05:38:24', '2021-11-25 05:38:24'),
(28199, 'en', 'Add New Tax', 'Add New Tax', '2021-11-25 05:38:24', '2021-11-25 05:38:24'),
(28200, 'en', 'Tax Type', 'Tax Type', '2021-11-25 05:38:24', '2021-11-25 05:38:24'),
(28201, 'en', 'Tax Name', 'Tax Name', '2021-11-25 05:38:24', '2021-11-25 05:38:24'),
(28202, 'en', 'Tax status updated successfully', 'Tax status updated successfully', '2021-11-25 05:38:24', '2021-11-25 05:38:24'),
(28203, 'en', 'Tax Information', 'Tax Information', '2021-11-25 05:40:07', '2021-11-25 05:40:07'),
(28204, 'en', 'update Tax Info', 'update Tax Info', '2021-11-25 05:40:07', '2021-11-25 05:40:07'),
(28205, 'en', 'Tax has been inserted successfully', 'Tax has been inserted successfully', '2021-11-25 05:40:19', '2021-11-25 05:40:19'),
(28206, 'en', 'Tax has been deleted successfully', 'Tax has been deleted successfully', '2021-11-25 05:52:24', '2021-11-25 05:52:24'),
(28207, 'en', 'Total Price sffsfsf', 'Total Price sffsfsf', '2021-11-25 10:38:52', '2021-11-25 10:38:52'),
(28208, 'en', 'eSMS', 'eSMS', '2022-02-17 07:07:00', '2022-02-17 07:07:00'),
(28209, 'en', 'ESMS_API_KEY', 'ESMS_API_KEY', '2022-02-17 07:07:00', '2022-02-17 07:07:00'),
(28210, 'en', 'ESMS_TYPE', 'ESMS_TYPE', '2022-02-17 07:07:00', '2022-02-17 07:07:00'),
(28211, 'en', 'ESMS_SENDER_ID', 'ESMS_SENDER_ID', '2022-02-17 07:07:00', '2022-02-17 07:07:00'),
(28212, 'en', 'eSMS OTP', 'eSMS OTP', '2022-02-17 08:46:46', '2022-02-17 08:46:46'),
(28213, 'en', 'Phone already exists.', 'Phone already exists.', '2022-02-17 08:59:18', '2022-02-17 08:59:18'),
(28214, 'en', 'in your cart', 'in your cart', '2022-02-17 09:11:30', '2022-02-17 09:11:30'),
(28215, 'en', 'Product(s)', 'Product(s)', '2022-02-17 09:11:30', '2022-02-17 09:11:30'),
(28216, 'en', 'in your wishlist', 'in your wishlist', '2022-02-17 09:11:30', '2022-02-17 09:11:30'),
(28217, 'en', 'you ordered', 'you ordered', '2022-02-17 09:11:31', '2022-02-17 09:11:31'),
(28218, 'en', 'Default Shipping Address', 'Default Shipping Address', '2022-02-17 09:11:31', '2022-02-17 09:11:31'),
(28219, 'en', 'Continue to Delivery Info', 'Continue to Delivery Info', '2022-02-17 09:11:53', '2022-02-17 09:11:53'),
(28220, 'en', 'New Address', 'New Address', '2022-02-17 09:11:53', '2022-02-17 09:11:53'),
(28221, 'en', 'Your Address', 'Your Address', '2022-02-17 09:11:53', '2022-02-17 09:11:53'),
(28222, 'en', 'Your Postal Code', 'Your Postal Code', '2022-02-17 09:11:53', '2022-02-17 09:11:53'),
(28223, 'en', '+880', '+880', '2022-02-17 09:11:53', '2022-02-17 09:11:53'),
(28224, 'en', 'Address Edit', 'Address Edit', '2022-02-17 09:11:53', '2022-02-17 09:11:53'),
(28225, 'en', 'Please add shipping address', 'Please add shipping address', '2022-02-17 09:11:57', '2022-02-17 09:11:57'),
(28226, 'en', 'Choose Delivery Type', 'Choose Delivery Type', '2022-02-17 09:12:51', '2022-02-17 09:12:51'),
(28227, 'en', 'Home Delivery', 'Home Delivery', '2022-02-17 09:12:51', '2022-02-17 09:12:51'),
(28228, 'en', 'Local Pickup', 'Local Pickup', '2022-02-17 09:12:51', '2022-02-17 09:12:51'),
(28229, 'en', 'Select your nearest pickup point', 'Select your nearest pickup point', '2022-02-17 09:12:51', '2022-02-17 09:12:51'),
(28230, 'en', 'Continue to Payment', 'Continue to Payment', '2022-02-17 09:12:51', '2022-02-17 09:12:51'),
(28231, 'en', 'Select a payment option', 'Select a payment option', '2022-02-17 09:12:56', '2022-02-17 09:12:56'),
(28232, 'en', 'sslcommerz', 'sslcommerz', '2022-02-17 09:12:57', '2022-02-17 09:12:57'),
(28233, 'en', 'Your wallet balance :', 'Your wallet balance :', '2022-02-17 09:12:57', '2022-02-17 09:12:57'),
(28234, 'en', 'Insufficient balance', 'Insufficient balance', '2022-02-17 09:12:57', '2022-02-17 09:12:57'),
(28235, 'en', 'I agree to the', 'I agree to the', '2022-02-17 09:12:57', '2022-02-17 09:12:57'),
(28236, 'en', 'terms and conditions', 'terms and conditions', '2022-02-17 09:12:57', '2022-02-17 09:12:57'),
(28237, 'en', 'Complete Order', 'Complete Order', '2022-02-17 09:12:57', '2022-02-17 09:12:57'),
(28238, 'en', 'Summary', 'Summary', '2022-02-17 09:12:57', '2022-02-17 09:12:57'),
(28239, 'en', 'Items', 'Items', '2022-02-17 09:12:57', '2022-02-17 09:12:57'),
(28240, 'en', 'Have coupon code? Enter here', 'Have coupon code? Enter here', '2022-02-17 09:12:57', '2022-02-17 09:12:57'),
(28241, 'en', 'Apply', 'Apply', '2022-02-17 09:12:57', '2022-02-17 09:12:57'),
(28242, 'en', 'You need to agree with our policies', 'You need to agree with our policies', '2022-02-17 09:12:57', '2022-02-17 09:12:57'),
(28243, 'en', 'Your order has been placed', 'Your order has been placed', '2022-02-17 09:13:08', '2022-02-17 09:13:08'),
(28244, 'en', 'Your order has been placed successfully', 'Your order has been placed successfully', '2022-02-17 09:13:09', '2022-02-17 09:13:09'),
(28245, 'en', 'Thank You for Your Order!', 'Thank You for Your Order!', '2022-02-17 09:13:09', '2022-02-17 09:13:09'),
(28246, 'en', 'A copy or your order summary has been sent to', 'A copy or your order summary has been sent to', '2022-02-17 09:13:09', '2022-02-17 09:13:09'),
(28247, 'en', 'Order Summary', 'Order Summary', '2022-02-17 09:13:09', '2022-02-17 09:13:09'),
(28248, 'en', 'Order date', 'Order date', '2022-02-17 09:13:09', '2022-02-17 09:13:09'),
(28249, 'en', 'Order status', 'Order status', '2022-02-17 09:13:09', '2022-02-17 09:13:09'),
(28250, 'en', 'Total order amount', 'Total order amount', '2022-02-17 09:13:09', '2022-02-17 09:13:09'),
(28251, 'en', 'Flat shipping rate', 'Flat shipping rate', '2022-02-17 09:13:09', '2022-02-17 09:13:09'),
(28252, 'en', 'Order Details', 'Order Details', '2022-02-17 09:13:09', '2022-02-17 09:13:09'),
(28253, 'en', 'Variation', 'Variation', '2022-02-17 09:13:09', '2022-02-17 09:13:09'),
(28254, 'en', 'Delivery Type', 'Delivery Type', '2022-02-17 09:13:09', '2022-02-17 09:13:09'),
(28255, 'en', 'Coupon Discount', 'Coupon Discount', '2022-02-17 09:13:10', '2022-02-17 09:13:10'),
(28256, 'en', 'Unpaid', 'Unpaid', '2022-02-17 09:14:25', '2022-02-17 09:14:25'),
(28257, 'en', 'Download Invoice', 'Download Invoice', '2022-02-17 09:14:25', '2022-02-17 09:14:25'),
(28258, 'en', 'No Refund', 'No Refund', '2022-02-20 06:06:18', '2022-02-20 06:06:18'),
(28259, 'en', 'Assign Deliver Boy', 'Assign Deliver Boy', '2022-02-20 06:06:32', '2022-02-20 06:06:32'),
(28260, 'en', 'Select Delivery Boy', 'Select Delivery Boy', '2022-02-20 06:06:32', '2022-02-20 06:06:32'),
(28261, 'en', 'Order #', 'Order #', '2022-02-20 06:06:32', '2022-02-20 06:06:32'),
(28262, 'en', 'Total amount', 'Total amount', '2022-02-20 06:06:32', '2022-02-20 06:06:32'),
(28263, 'en', 'N/A', 'N/A', '2022-02-20 06:06:32', '2022-02-20 06:06:32'),
(28264, 'en', 'Delivery boy has been assigned', 'Delivery boy has been assigned', '2022-02-20 06:06:33', '2022-02-20 06:06:33'),
(28265, 'en', 'Delivery status has been updated', 'Delivery status has been updated', '2022-02-20 06:06:33', '2022-02-20 06:06:33'),
(28266, 'en', 'Payment status has been updated', 'Payment status has been updated', '2022-02-20 06:06:33', '2022-02-20 06:06:33'),
(28267, 'en', 'has been Delivered', 'has been Delivered', '2022-02-20 06:07:10', '2022-02-20 06:07:10'),
(28268, 'en', 'has been Paid', 'has been Paid', '2022-02-20 06:07:10', '2022-02-20 06:07:10'),
(28269, 'en', 'Product quantity updated successfully', 'Product quantity updated successfully', '2022-04-06 08:13:06', '2022-04-06 08:13:06'),
(28270, 'en', 'Color has been deleted successfully', 'Color has been deleted successfully', '2022-04-10 05:38:14', '2022-04-10 05:38:14'),
(28271, 'en', 'Product has been duplicated successfully', 'Product has been duplicated successfully', '2022-04-11 09:11:19', '2022-04-11 09:11:19'),
(28272, 'en', 'File deleted successfully', 'File deleted successfully', '2022-04-12 09:41:40', '2022-04-12 09:41:40'),
(28273, 'en', 'Item has been renoved from wishlist', 'Item has been renoved from wishlist', '2022-04-12 09:58:25', '2022-04-12 09:58:25'),
(28274, 'en', 'Default Language', 'Default Language', '2022-06-19 04:46:07', '2022-06-19 04:46:07'),
(28275, 'en', 'Add New Language', 'Add New Language', '2022-06-19 04:46:07', '2022-06-19 04:46:07'),
(28276, 'en', 'RTL', 'RTL', '2022-06-19 04:46:07', '2022-06-19 04:46:07'),
(28277, 'en', 'Translation', 'Translation', '2022-06-19 04:46:07', '2022-06-19 04:46:07'),
(28278, 'en', 'Language has been deleted successfully', 'Language has been deleted successfully', '2022-06-19 04:46:11', '2022-06-19 04:46:11'),
(28279, 'en', 'System Default Currency', 'System Default Currency', '2022-06-19 04:46:21', '2022-06-19 04:46:21'),
(28280, 'en', 'Set Currency Formats', 'Set Currency Formats', '2022-06-19 04:46:21', '2022-06-19 04:46:21'),
(28281, 'en', 'Symbol Format', 'Symbol Format', '2022-06-19 04:46:21', '2022-06-19 04:46:21'),
(28282, 'en', 'Decimal Separator', 'Decimal Separator', '2022-06-19 04:46:21', '2022-06-19 04:46:21'),
(28283, 'en', 'No of decimals', 'No of decimals', '2022-06-19 04:46:21', '2022-06-19 04:46:21'),
(28284, 'en', 'All Currencies', 'All Currencies', '2022-06-19 04:46:21', '2022-06-19 04:46:21'),
(28285, 'en', 'Add New Currency', 'Add New Currency', '2022-06-19 04:46:21', '2022-06-19 04:46:21'),
(28286, 'en', 'Currency name', 'Currency name', '2022-06-19 04:46:21', '2022-06-19 04:46:21'),
(28287, 'en', 'Currency symbol', 'Currency symbol', '2022-06-19 04:46:21', '2022-06-19 04:46:21'),
(28288, 'en', 'Currency code', 'Currency code', '2022-06-19 04:46:21', '2022-06-19 04:46:21'),
(28289, 'en', 'Exchange rate', 'Exchange rate', '2022-06-19 04:46:21', '2022-06-19 04:46:21'),
(28290, 'en', 'Currency Status updated successfully', 'Currency Status updated successfully', '2022-06-19 04:46:21', '2022-06-19 04:46:21'),
(28291, 'en', 'Registration successfull.', 'Registration successfull.', '2022-06-21 09:06:24', '2022-06-21 09:06:24'),
(28292, 'en', 'Walletmix', 'Walletmix', '2022-06-21 09:08:48', '2022-06-21 09:08:48'),
(28293, 'en', 'Your Order: ', 'Your Order: ', '2022-06-21 09:38:52', '2022-06-21 09:38:52'),
(28294, 'en', 'Shipping method', 'Shipping method', '2022-06-21 09:39:08', '2022-06-21 09:39:08'),
(28295, 'en', 'Order Ammount', 'Order Ammount', '2022-06-21 09:39:08', '2022-06-21 09:39:08'),
(28296, 'en', 'Role Information', 'Role Information', '2022-10-18 10:19:08', '2022-10-18 10:19:08'),
(28297, 'en', 'Permissions', 'Permissions', '2022-10-18 10:19:08', '2022-10-18 10:19:08'),
(28298, 'en', 'Role has been inserted successfully', 'Role has been inserted successfully', '2022-10-18 10:19:55', '2022-10-18 10:19:55'),
(28299, 'en', 'Staff Information', 'Staff Information', '2022-10-18 10:20:03', '2022-10-18 10:20:03'),
(28300, 'en', 'Staff has been inserted successfully', 'Staff has been inserted successfully', '2022-10-18 10:20:25', '2022-10-18 10:20:25'),
(28301, 'en', 'Order has been deleted successfully', 'Order has been deleted successfully', '2022-10-25 06:07:16', '2022-10-25 06:07:16'),
(28302, 'en', 'Customer has been deleted successfully', 'Customer has been deleted successfully', '2022-10-25 06:08:12', '2022-10-25 06:08:12'),
(28303, 'en', 'Edit Page Information', 'Edit Page Information', '2022-10-25 06:35:41', '2022-10-25 06:35:41'),
(28304, 'en', 'Page Content', 'Page Content', '2022-10-25 06:35:41', '2022-10-25 06:35:41'),
(28305, 'en', 'Link', 'Link', '2022-10-25 06:35:41', '2022-10-25 06:35:41'),
(28306, 'en', 'Use character, number, hypen only', 'Use character, number, hypen only', '2022-10-25 06:35:41', '2022-10-25 06:35:41'),
(28307, 'en', 'Add Content', 'Add Content', '2022-10-25 06:35:41', '2022-10-25 06:35:41'),
(28308, 'en', 'Content..', 'Content..', '2022-10-25 06:35:41', '2022-10-25 06:35:41'),
(28309, 'en', 'Seo Fields', 'Seo Fields', '2022-10-25 06:35:41', '2022-10-25 06:35:41'),
(28310, 'en', 'Update Page', 'Update Page', '2022-10-25 06:35:41', '2022-10-25 06:35:41'),
(28311, 'en', 'Page has been updated successfully', 'Page has been updated successfully', '2022-10-25 06:36:17', '2022-10-25 06:36:17'),
(28312, 'en', 'Save Page', 'Save Page', '2022-10-25 06:46:31', '2022-10-25 06:46:31'),
(28313, 'en', 'New page has been created successfully', 'New page has been created successfully', '2022-10-25 06:48:06', '2022-10-25 06:48:06'),
(28314, 'en', 'MIM SMS OTP', 'MIM SMS OTP', '2022-10-25 08:49:43', '2022-10-25 08:49:43'),
(28315, 'en', 'MIM SMS', 'MIM SMS', '2022-10-25 08:58:03', '2022-10-25 08:58:03'),
(28316, 'en', 'MIM_API_KEY', 'MIM_API_KEY', '2022-10-25 08:58:03', '2022-10-25 08:58:03'),
(28317, 'en', 'MIM_TYPE', 'MIM_TYPE', '2022-10-25 08:58:03', '2022-10-25 08:58:03'),
(28318, 'en', 'MIM_SENDER_ID', 'MIM_SENDER_ID', '2022-10-25 08:58:03', '2022-10-25 08:58:03'),
(28319, 'en', 'ESMS_API_TOKEN', 'ESMS_API_TOKEN', '2022-10-27 18:24:45', '2022-10-27 18:24:45'),
(28320, 'en', 'Attribute has been inserted successfully', 'Attribute has been inserted successfully', '2022-10-29 07:32:47', '2022-10-29 07:32:47'),
(28321, 'en', 'Attribute values', 'Attribute values', '2022-10-29 07:32:48', '2022-10-29 07:32:48'),
(28322, 'en', 'Attribute Detail', 'Attribute Detail', '2022-10-29 07:33:05', '2022-10-29 07:33:05'),
(28323, 'en', 'Value', 'Value', '2022-10-29 07:33:05', '2022-10-29 07:33:05'),
(28324, 'en', 'Add New Attribute Value', 'Add New Attribute Value', '2022-10-29 07:33:05', '2022-10-29 07:33:05'),
(28325, 'en', 'Attribute Name', 'Attribute Name', '2022-10-29 07:33:05', '2022-10-29 07:33:05'),
(28326, 'en', 'Attribute Value', 'Attribute Value', '2022-10-29 07:33:05', '2022-10-29 07:33:05'),
(28327, 'en', 'Attribute value has been inserted successfully', 'Attribute value has been inserted successfully', '2022-10-29 07:33:41', '2022-10-29 07:33:41'),
(28328, 'en', 'Filter by', 'Filter by', '2022-10-29 07:52:40', '2022-10-29 07:52:40'),
(28329, 'en', 'Details', 'Details', '2022-10-29 10:18:04', '2022-10-29 10:18:04'),
(28330, 'en', 'Item has been added to cart', 'Item has been added to cart', '2022-10-29 10:18:05', '2022-10-29 10:18:05'),
(28331, 'en', 'INVOICE', 'INVOICE', '2022-10-29 11:45:23', '2022-10-29 11:45:23'),
(28332, 'en', 'Bill to', 'Bill to', '2022-10-29 11:45:23', '2022-10-29 11:45:23'),
(28333, 'en', 'Shipping Cost', 'Shipping Cost', '2022-10-29 11:45:23', '2022-10-29 11:45:23'),
(28334, 'en', 'Grand Total', 'Grand Total', '2022-10-29 11:45:23', '2022-10-29 11:45:23'),
(28335, 'en', 'Invalid email or password', 'Invalid email or password', '2022-10-29 17:22:24', '2022-10-29 17:22:24'),
(28336, 'en', 'Basic Info', 'Basic Info', '2022-10-29 17:22:52', '2022-10-29 17:22:52'),
(28337, 'en', 'Your Name', 'Your Name', '2022-10-29 17:22:52', '2022-10-29 17:22:52'),
(28338, 'en', 'Your Phone', 'Your Phone', '2022-10-29 17:22:52', '2022-10-29 17:22:52'),
(28339, 'en', 'Your Password', 'Your Password', '2022-10-29 17:22:52', '2022-10-29 17:22:52'),
(28340, 'en', 'Update Profile', 'Update Profile', '2022-10-29 17:22:52', '2022-10-29 17:22:52'),
(28341, 'en', 'Make This Default', 'Make This Default', '2022-10-29 17:22:52', '2022-10-29 17:22:52'),
(28342, 'en', 'Change your email', 'Change your email', '2022-10-29 17:22:52', '2022-10-29 17:22:52'),
(28343, 'en', 'Your Email', 'Your Email', '2022-10-29 17:22:52', '2022-10-29 17:22:52'),
(28344, 'en', 'Sending Email...', 'Sending Email...', '2022-10-29 17:22:52', '2022-10-29 17:22:52'),
(28345, 'en', 'Update Email', 'Update Email', '2022-10-29 17:22:52', '2022-10-29 17:22:52'),
(28346, 'en', 'Select your country', 'Select your country', '2022-10-29 17:22:52', '2022-10-29 17:22:52'),
(28347, 'en', 'Your phone number', 'Your phone number', '2022-10-29 17:22:52', '2022-10-29 17:22:52'),
(28348, 'en', 'SMS Template has been updated successfully', 'SMS Template has been updated successfully', '2022-11-05 07:32:18', '2022-11-05 07:32:18'),
(28349, 'en', 'Enter your email address to recover your password.', 'Enter your email address to recover your password.', '2022-11-05 07:36:17', '2022-11-05 07:36:17'),
(28350, 'en', 'Send Password Reset Link', 'Send Password Reset Link', '2022-11-05 07:36:17', '2022-11-05 07:36:17'),
(28351, 'en', 'Back to Login', 'Back to Login', '2022-11-05 07:36:17', '2022-11-05 07:36:17'),
(28352, 'en', 'No account exists with this phone number', 'No account exists with this phone number', '2022-11-05 07:36:37', '2022-11-05 07:36:37'),
(28353, 'en', 'Reset Password', 'Reset Password', '2022-11-05 07:37:37', '2022-11-05 07:37:37'),
(28354, 'en', 'Enter your phone, code and new password and confirm password.', 'Enter your phone, code and new password and confirm password.', '2022-11-05 07:37:37', '2022-11-05 07:37:37'),
(28355, 'en', 'has been On the way', 'has been On the way', '2022-11-05 08:03:37', '2022-11-05 08:03:37'),
(28356, 'en', 'Send Refund Request', 'Send Refund Request', '2022-11-05 08:06:39', '2022-11-05 08:06:39'),
(28357, 'en', 'Product Price', 'Product Price', '2022-11-05 08:06:40', '2022-11-05 08:06:40'),
(28358, 'en', 'Refund Reason', 'Refund Reason', '2022-11-05 08:06:40', '2022-11-05 08:06:40'),
(28359, 'en', 'Send Request', 'Send Request', '2022-11-05 08:06:40', '2022-11-05 08:06:40'),
(28360, 'en', 'Conversation is disabled at this moment', 'Conversation is disabled at this moment', '2022-11-05 08:14:33', '2022-11-05 08:14:33'),
(28361, 'en', 'Register your shop', 'Register your shop', '2022-11-05 08:14:52', '2022-11-05 08:14:52'),
(28362, 'en', 'Shop Name', 'Shop Name', '2022-11-05 08:14:52', '2022-11-05 08:14:52'),
(28363, 'en', 'Choose image', 'Choose image', '2022-11-05 08:14:52', '2022-11-05 08:14:52'),
(28364, 'en', 'Write a review', 'Write a review', '2022-11-05 08:17:28', '2022-11-05 08:17:28'),
(28365, 'en', 'Your review', 'Your review', '2022-11-05 08:17:28', '2022-11-05 08:17:28'),
(28366, 'en', 'Submit review', 'Submit review', '2022-11-05 08:17:28', '2022-11-05 08:17:28'),
(28367, 'en', 'Review has been submitted successfully', 'Review has been submitted successfully', '2022-11-05 08:18:11', '2022-11-05 08:18:11'),
(28368, 'en', 'Size Guide', 'Size Guide', '2022-11-24 15:43:31', '2022-11-24 15:43:31'),
(28369, 'en', 'Product Code', 'Product Code', '2022-11-24 19:58:11', '2022-11-24 19:58:11'),
(28370, 'en', 'New Arrival', 'New Arrival', '2022-12-08 18:25:51', '2022-12-08 18:25:51'),
(28371, 'en', 'Search here...', 'Search here...', '2022-12-17 07:11:52', '2022-12-17 07:11:52'),
(28372, 'en', 'Please choose all the options', 'Please choose all the options', '2022-12-17 09:15:17', '2022-12-17 09:15:17'),
(28373, 'en', 'Shipping Division', 'Shipping Division', '2023-01-28 09:34:50', '2023-01-28 09:34:50'),
(28374, 'en', 'Shipping District', 'Shipping District', '2023-01-28 09:34:50', '2023-01-28 09:34:50'),
(28375, 'en', 'Shipping Area', 'Shipping Area', '2023-01-28 09:34:50', '2023-01-28 09:34:50'),
(28376, 'en', 'All Division', 'All Division', '2023-01-28 09:46:31', '2023-01-28 09:46:31'),
(28377, 'en', 'Division', 'Division', '2023-01-28 09:46:31', '2023-01-28 09:46:31'),
(28378, 'en', 'Add New Division', 'Add New Division', '2023-01-28 09:46:31', '2023-01-28 09:46:31'),
(28379, 'en', 'All District', 'All District', '2023-01-28 09:51:23', '2023-01-28 09:51:23'),
(28380, 'en', 'District', 'District', '2023-01-28 09:51:23', '2023-01-28 09:51:23'),
(28381, 'en', 'Add New District', 'Add New District', '2023-01-28 09:51:23', '2023-01-28 09:51:23'),
(28382, 'en', 'All Areas', 'All Areas', '2023-01-28 09:51:34', '2023-01-28 09:51:34'),
(28383, 'en', 'Areas', 'Areas', '2023-01-28 09:51:34', '2023-01-28 09:51:34'),
(28384, 'en', 'Add New Area', 'Add New Area', '2023-01-28 09:51:35', '2023-01-28 09:51:35'),
(28385, 'en', 'Division has been inserted successfully', 'Division has been inserted successfully', '2023-01-28 15:52:50', '2023-01-28 15:52:50'),
(28386, 'en', 'Division has been updated successfully', 'Division has been updated successfully', '2023-01-28 15:57:07', '2023-01-28 15:57:07'),
(28387, 'en', 'District has been inserted successfully', 'District has been inserted successfully', '2023-01-28 16:01:33', '2023-01-28 16:01:33'),
(28388, 'en', 'District has been updated successfully', 'District has been updated successfully', '2023-01-28 16:04:13', '2023-01-28 16:04:13'),
(28389, 'en', 'Area has been inserted successfully', 'Area has been inserted successfully', '2023-01-28 16:26:12', '2023-01-28 16:26:12'),
(28390, 'en', 'Edit Area', 'Edit Area', '2023-01-28 16:27:56', '2023-01-28 16:27:56'),
(28391, 'en', 'Area has been updated successfully', 'Area has been updated successfully', '2023-01-30 16:03:13', '2023-01-30 16:03:13'),
(28392, 'en', 'Area has been deleted successfully', 'Area has been deleted successfully', '2023-01-31 12:39:29', '2023-01-31 12:39:29'),
(28393, 'en', 'Area', 'Area', '2023-01-31 12:50:01', '2023-01-31 12:50:01'),
(28394, 'en', 'Order Summary ssss', 'Order Summary ssss', '2023-02-18 04:47:54', '2023-02-18 04:47:54'),
(28395, 'en', 'Download Your Product', 'Download Your Product', '2023-02-18 04:57:28', '2023-02-18 04:57:28'),
(28396, 'en', 'Option', 'Option', '2023-02-18 04:57:28', '2023-02-18 04:57:28'),
(28397, 'en', 'Applied Refund Request', 'Applied Refund Request', '2023-02-18 04:57:33', '2023-02-18 04:57:33'),
(28398, 'en', 'Create a Ticket', 'Create a Ticket', '2023-02-18 04:57:44', '2023-02-18 04:57:44'),
(28399, 'en', 'Tickets', 'Tickets', '2023-02-18 04:57:44', '2023-02-18 04:57:44'),
(28400, 'en', 'Provide a detailed description', 'Provide a detailed description', '2023-02-18 04:57:44', '2023-02-18 04:57:44'),
(28401, 'en', 'Type your reply', 'Type your reply', '2023-02-18 04:57:44', '2023-02-18 04:57:44'),
(28402, 'en', 'Send Ticket', 'Send Ticket', '2023-02-18 04:57:44', '2023-02-18 04:57:44');

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE `uploads` (
  `id` int(11) NOT NULL,
  `file_original_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `extension` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `uploads`
--

INSERT INTO `uploads` (`id`, `file_original_name`, `file_name`, `user_id`, `file_size`, `extension`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2376, 'fev', 'uploads/all/duU6Oyo5RR2JSiLP7ebEz3BttM9gDbhHZuqPYRT2.png', 9, 2144, 'png', 'image', '2022-10-25 06:13:39', '2022-10-25 06:13:39', NULL),
(2377, 'logo', 'uploads/all/1drf8rniJhvppPtPbQAtGnNpjS3LL5N6OGOD8lHD.jpg', 9, 11919, 'jpg', 'image', '2022-10-25 06:13:39', '2022-10-25 06:13:39', NULL),
(2378, 'man_banner', 'uploads/all/Xn3qg9GLBmKu1pdYMq1cy3Hmxc6WmW3cRU3CA4xf.jpg', 9, 121833, 'jpg', 'image', '2022-10-25 06:13:40', '2022-10-25 06:13:40', NULL),
(2379, 'baby_banner', 'uploads/all/cNn8fzaF0Dkf9EtSZCCqPd8FRuXkD8GwmpYvIvco.jpg', 9, 121612, 'jpg', 'image', '2022-10-25 06:13:40', '2022-10-25 06:13:40', NULL),
(2380, 'woman_banner', 'uploads/all/X8yVI7AiQ6SZzbUvLSJgRFhP6JqT2jyWyfszRv2T.jpg', 9, 153987, 'png', 'image', '2022-10-25 06:13:40', '2022-10-25 06:13:40', NULL),
(2381, 'fashion_beauty_banner', 'uploads/all/id32hR6tPetx4U8K5QOekvaItnvM4rtzouvjiJaj.jpg', 9, 89931, 'jpg', 'image', '2022-10-25 06:13:40', '2022-10-25 06:13:40', NULL),
(2382, 'return-slip', 'uploads/all/zjqa6uSaQYjQihLWqB0G2awsDE3ZFqceo3Li0eAw.pdf', 9, 71293, 'pdf', 'document', '2022-10-25 06:44:22', '2022-10-25 06:44:22', NULL),
(2383, '1', 'uploads/all/s19FgGNsk0awZygyyfhRrqlrQSIErUI6hHoicCIG.jpg', 9, 64550, 'jpg', 'image', '2022-10-29 07:38:51', '2022-10-29 07:38:51', NULL),
(2384, '3', 'uploads/all/zu5jWsmpTUoH1VYFeB4Rm0PAvcOrvvRKPL94fujd.jpg', 9, 72983, 'jpg', 'image', '2022-10-29 07:38:51', '2022-10-29 07:38:51', NULL),
(2385, '2', 'uploads/all/EJqiOWRJItCFImOXBsdGIdIyBriIui1KMTKsremb.jpg', 9, 65159, 'jpg', 'image', '2022-10-29 07:38:51', '2022-10-29 07:38:51', NULL),
(2386, 'SIZE_CHART-BS-001_-_Cropped_To_Boarder', 'uploads/all/xoaW98ns1YOTBfT4gFKXH9IHudDkM1jQcbRCm5rk.jpg', 9, 57453, 'jpg', 'image', '2022-10-29 07:43:12', '2022-10-29 07:43:12', NULL),
(2387, '4_1', 'uploads/all/yhxVU4I3L3z6pxRuJ6ZCTlknksbMkgaoxr21FcuE.jpg', 9, 45714, 'jpg', 'image', '2022-10-29 14:08:13', '2022-10-29 14:08:13', NULL),
(2388, '3_1', 'uploads/all/lJqwe74fFNBO3WxHTv0j7FWSm4ggDFPMNBzoC1JY.jpg', 9, 85076, 'jpg', 'image', '2022-10-29 14:08:13', '2022-10-29 14:08:13', NULL),
(2389, '1_1', 'uploads/all/DmTFE5joHSOqSJ7u2zbyQ0kmGiX0xbSkFMllOJW6.jpg', 9, 61514, 'jpg', 'image', '2022-10-29 14:08:13', '2022-10-29 14:08:13', NULL),
(2390, '2_2', 'uploads/all/HN7B7SGnmjtFrEPzGJFq0HsXkU7wnTAU4pWYVjqP.jpg', 9, 92224, 'jpg', 'image', '2022-10-29 14:08:13', '2022-10-29 14:08:13', NULL),
(2391, '2_1', 'uploads/all/W8yjc8HmGdOftpXxDIS0CsfU5hdzrHSSSKoZ8YjY.jpg', 9, 57832, 'jpg', 'image', '2022-11-12 04:53:08', '2022-11-12 04:53:08', NULL),
(2392, '1', 'uploads/all/dhnLKoN5amq79OYL0HZOsYrvlobh23DjztfIUuZ6.jpg', 9, 58275, 'jpg', 'image', '2022-11-12 04:53:08', '2022-11-12 04:53:08', NULL),
(2393, 'mens-shirt-1_1', 'uploads/all/2zIQIt3JuBKgQGODbSg3ur5Jz8ZoaBJmhwMXw771.jpg', 9, 47813, 'jpeg', 'image', '2022-11-12 04:59:56', '2022-11-12 04:59:56', NULL),
(2394, '123217244_278157061545_4577', 'uploads/all/FUXuHuJuceUGXlMMfhBvufBZ4aAoPgyJMSk51oCK.jpg', 9, 39242, 'jpg', 'image', '2022-11-12 05:08:42', '2022-11-12 05:08:42', NULL),
(2395, '123271000_278157264878_4576', 'uploads/all/nWGeUywAZ8i5s6prpK42quXWCiFB1xSND5KnJBa4.jpg', 9, 36181, 'jpg', 'image', '2022-11-12 05:09:13', '2022-11-12 05:09:13', NULL),
(2396, '3', 'uploads/all/nulSndtcVI85OuMeEHCBDoNPInaH4kXs3XCcUdFp.jpg', 9, 32417, 'jpg', 'image', '2022-11-12 05:13:06', '2022-11-12 05:13:06', NULL),
(2397, '1-1586677139', 'uploads/all/hfQ9nI7NDPGnTg8DCXHOiKjjZr6SRRWFijg27Kvw.jpg', 9, 44021, 'jpg', 'image', '2022-11-12 05:22:17', '2022-11-12 05:22:17', NULL),
(2398, '3-1586676173', 'uploads/all/9hQBzvlfwIh153IlRJ95HPBfM2SS8GAe8pyVMCkw.jpg', 9, 38086, 'jpg', 'image', '2022-11-12 05:22:17', '2022-11-12 05:22:17', NULL),
(2399, '4-1586677103', 'uploads/all/rJohAqTGlth2tBpfWwz9kQKT4qkKS1tBN0GthOiW.jpg', 9, 37372, 'jpg', 'image', '2022-11-12 05:22:17', '2022-11-12 05:22:17', NULL),
(2400, '2-1586675326', 'uploads/all/nBEsvXIY6HknZXNCBvVo6O0oCZlUfl1VEoxd45yd.jpg', 9, 38117, 'jpg', 'image', '2022-11-12 05:22:17', '2022-11-12 05:22:17', NULL),
(2401, '2-1586676233', 'uploads/all/Oscl1nDQsMaReaAWVOH4qKj6Hp5EJECwLS65If4n.jpg', 9, 38157, 'jpg', 'image', '2022-11-12 05:26:30', '2022-11-12 05:26:30', NULL),
(2402, '4-1586675274', 'uploads/all/sjRaBNHGA96TocZYLzdhfJMQCYhR26ppKqUdGr2C.jpg', 9, 31200, 'jpg', 'image', '2022-11-12 05:26:30', '2022-11-12 05:26:30', NULL),
(2403, '1-1586676213', 'uploads/all/jrsFlA613shxyoi9jKfsnwfyGRF44plaecWA4lVR.jpg', 9, 49652, 'jpg', 'image', '2022-11-12 05:26:30', '2022-11-12 05:26:30', NULL),
(2404, '3-1586675346', 'uploads/all/mGXDUJPeSVmVh0KlYXDLPm8vfEyCplEZA7Xj70iK.jpg', 9, 39310, 'jpg', 'image', '2022-11-12 05:26:30', '2022-11-12 05:26:30', NULL),
(2405, '2-1586677120', 'uploads/all/99cSz94AQeQuOxBt0EOpF3hnBR56yXA9eXpYIvHG.jpg', 9, 38593, 'jpg', 'image', '2022-11-12 05:47:48', '2022-11-12 05:47:48', NULL),
(2406, '4-1586675254', 'uploads/all/eYryLuqWr3f42uynZTGfAxCdvGHZ5NJyRX7NQE6m.jpg', 9, 49207, 'jpg', 'image', '2022-11-12 05:47:48', '2022-11-12 05:47:48', NULL),
(2407, '3-1586676155', 'uploads/all/oCjjImUYGbKzhkwYJ01Pxt4vj2Ml2Knl3A1Z6ohG.jpg', 9, 35680, 'jpg', 'image', '2022-11-12 05:47:48', '2022-11-12 05:47:48', NULL),
(2408, '1-1586677110', 'uploads/all/9YUBhO0ILb2Qha8gaDlGrKvNW6ITIsd12oIbOi28.jpg', 9, 55543, 'jpg', 'image', '2022-11-12 05:47:49', '2022-11-12 05:47:49', NULL),
(2409, '2-1586730242', 'uploads/all/97GlKAQHS6ZNPIYuFtl4QOm1wb4brK8aRJH8NGkn.jpg', 9, 35084, 'jpg', 'image', '2022-11-12 05:51:05', '2022-11-12 05:51:05', NULL),
(2410, '3-1586722637', 'uploads/all/TaAuob0vTvD54BkYfd48vo9twxBD6nZwIVv2r26F.jpg', 9, 38348, 'jpg', 'image', '2022-11-12 05:51:05', '2022-11-12 05:51:05', NULL),
(2411, '4-1586675249', 'uploads/all/p5eBAkCmI82FzMijeD5PqRkaINRV39ND1UpypfbL.jpg', 9, 38441, 'jpg', 'image', '2022-11-12 05:51:05', '2022-11-12 05:51:05', NULL),
(2412, '1-1586722642', 'uploads/all/0bv7tyPFDGCCwPVMCxTHwQHFcTsxs8i23z6yYcTz.jpg', 9, 48005, 'jpg', 'image', '2022-11-12 05:51:05', '2022-11-12 05:51:05', NULL),
(2413, '3-1586676196', 'uploads/all/0BKAYJu65GASJjPaUUcWd7cNTRI4NnZWz2Hw6P6J.jpg', 9, 33281, 'jpg', 'image', '2022-11-12 05:55:07', '2022-11-12 05:55:07', NULL),
(2414, '4-1586676108', 'uploads/all/23uxUYdMydLBHOWxfMAfUD92uqZTpG9EikXBgcWI.jpg', 9, 35700, 'jpg', 'image', '2022-11-12 05:55:07', '2022-11-12 05:55:07', NULL),
(2415, '1-1586676191', 'uploads/all/AnFg9udlisyP62bekoEg8ES0c7mEVEsL6XvoeUbV.jpg', 9, 47951, 'jpg', 'image', '2022-11-12 05:55:07', '2022-11-12 05:55:07', NULL),
(2416, '2-1586677159', 'uploads/all/BHdWBgUQ8vAbwT1AIkHJelOo7650U2017OW9dEga.jpg', 9, 36532, 'jpg', 'image', '2022-11-12 05:55:07', '2022-11-12 05:55:07', NULL),
(2417, '1_4', 'uploads/all/Dgtvq9ya7dIyXi0WV8QxbRLhOBb0E6xgrccmBpgm.jpg', 9, 57497, 'jpg', 'image', '2022-11-12 05:58:42', '2022-11-12 05:58:42', NULL),
(2418, '2_5', 'uploads/all/PXlMdz5PPZR7goCX5N8q8VtH9xKqXeiv2WxA8lfG.jpg', 9, 37746, 'jpg', 'image', '2022-11-12 05:58:42', '2022-11-12 05:58:42', NULL),
(2419, '3_3', 'uploads/all/wepIRQQbbZhoMSlHcikp4tndMlcVcHJsIHkdNwiV.jpg', 9, 36302, 'jpg', 'image', '2022-11-12 05:58:42', '2022-11-12 05:58:42', NULL),
(2420, '4_2', 'uploads/all/n0IVkaUFFgzKMDtNXF2IuPfS0wBKhkHmgaOUZz9n.jpg', 9, 40498, 'jpg', 'image', '2022-11-12 05:58:42', '2022-11-12 05:58:42', NULL),
(2421, 'img_2693', 'uploads/all/BJyViazVyAOuk9l6HcKwUKgFacF9TSYFrP7UmbM5.jpg', 9, 86038, 'jpg', 'image', '2022-11-12 09:10:10', '2022-11-12 09:10:10', NULL),
(2422, 'img_2694', 'uploads/all/bAcrGtH9j5j0WoVtWF1pJAFUaj9SXU85WgdlXiVD.jpg', 9, 45085, 'jpg', 'image', '2022-11-12 09:10:10', '2022-11-12 09:10:10', NULL),
(2423, 'img_2692', 'uploads/all/CMiizlucajUtHMf2D6rrkXAJJyUvfGvIsN0T2Rph.jpg', 9, 58373, 'jpg', 'image', '2022-11-12 09:10:10', '2022-11-12 09:10:10', NULL),
(2424, 'img_2686', 'uploads/all/AMmFh7VTJxRifanZLcaETj0i6EElzWVU0pLMLniR.jpg', 9, 66448, 'jpg', 'image', '2022-11-12 09:17:41', '2022-11-12 09:17:41', NULL),
(2425, 'img_2687', 'uploads/all/k2jxXhTYZ2DnmhaLUD6uWm7y78ycOc44tzKiqGaG.jpg', 9, 80936, 'jpg', 'image', '2022-11-12 09:17:41', '2022-11-12 09:17:41', NULL),
(2426, 'img_2688', 'uploads/all/SIryQXVSmN0mNq6Vr2eda8IRRo4BcWq9HacXgDZY.jpg', 9, 64149, 'jpg', 'image', '2022-11-12 09:17:41', '2022-11-12 09:17:41', NULL),
(2427, 'img_2682', 'uploads/all/PF8vyySLV8bSST3Rjqvo7KyYChQfXyy667AKl0lq.jpg', 9, 61758, 'jpg', 'image', '2022-11-12 09:24:35', '2022-11-12 09:24:35', NULL),
(2428, 'img_2684', 'uploads/all/Tvr8K624meMsGrtnu3jfHjhU412bxB4LVTohP9xd.jpg', 9, 80212, 'jpg', 'image', '2022-11-12 09:24:35', '2022-11-12 09:24:35', NULL),
(2429, 'img_2685', 'uploads/all/HUCYKI3om6A067OSm4A2EzRlsN3DIs3eD5cXH5XC.jpg', 9, 67482, 'jpg', 'image', '2022-11-12 09:24:35', '2022-11-12 09:24:35', NULL),
(2430, 'img_2696', 'uploads/all/Cv3dENpJnE9QtqhndRxtYEgoL7rQpNQsCR5I8p2c.jpg', 9, 83850, 'jpg', 'image', '2022-11-12 09:27:11', '2022-11-12 09:27:11', NULL),
(2431, '2-real', 'uploads/all/rAQMmxWzaBHXcHB3ZV1FTi3iBJvfaLvkT5SJ7IzZ.jpg', 9, 62021, 'jpg', 'image', '2022-11-12 09:27:11', '2022-11-12 09:27:11', NULL),
(2432, '1323112113', 'uploads/all/pAxAOBk7Mxyfy3NXiyzWXunEWRUcSxAM9L4UW1X6.jpg', 9, 82117, 'jpg', 'image', '2022-11-12 09:30:21', '2022-11-12 09:30:21', NULL),
(2433, '1323105444', 'uploads/all/2n8kcr2sGXTOcg3Mq6bfLL0kgNOf0ikzc7vg7J5W.jpg', 9, 93952, 'jpg', 'image', '2022-11-12 09:30:21', '2022-11-12 09:30:21', NULL),
(2434, '1323112013', 'uploads/all/0RdONTSFZcHwX6qMcxcIxOpwAV6RRirF9dB2CnPV.jpg', 9, 114106, 'jpg', 'image', '2022-11-12 09:30:21', '2022-11-12 09:30:21', NULL),
(2435, '1323105381', 'uploads/all/m7ne0DMKyUYf7377psNlJv0uO3ZyZiXKxHdRLlEB.jpg', 9, 69120, 'jpg', 'image', '2022-11-12 09:30:21', '2022-11-12 09:30:21', NULL),
(2436, '1323105357', 'uploads/all/94xoqAkmd2rsaMYdhRlsmrmHo5JMU91zSILAoftv.jpg', 9, 59589, 'jpg', 'image', '2022-11-12 09:37:49', '2022-11-12 09:37:49', NULL),
(2437, '1323105543', 'uploads/all/6h0HCabYGql5iyCnEYdi2SRCpLOxYRhMXteLNqHj.jpg', 9, 106647, 'jpg', 'image', '2022-11-12 09:37:49', '2022-11-12 09:37:49', NULL),
(2438, '1323105515', 'uploads/all/fGDf16mXKzqwP7SlL6yUv1lAwmvAnTbcjHPIRDh1.jpg', 9, 71512, 'jpg', 'image', '2022-11-12 09:37:49', '2022-11-12 09:37:49', NULL),
(2439, '1323105636', 'uploads/all/Z8ic17NmwomXJjbQPjNKOWjXVlLXRcPtZfitLlN7.jpg', 9, 68655, 'jpg', 'image', '2022-11-12 09:37:49', '2022-11-12 09:37:49', NULL),
(2440, 'parachute_naturale_shampoo_damage_repair_340ml_80ml_shampoo_free_', 'uploads/all/6bS3GFn1AnPlxT37VgdCk2q4UE1XwFZJbaobX1ZJ.jpg', 9, 54692, 'jpg', 'image', '2022-11-12 09:46:57', '2022-11-12 09:46:57', NULL),
(2441, '80ml_shampoo_free', 'uploads/all/9deEuoF7Q2xELesUV5XZUlUXv7OBF64az0fjEno7.jpg', 9, 22264, 'jpg', 'image', '2022-11-12 09:46:57', '2022-11-12 09:46:57', NULL),
(2442, 'garnier_men_oilclean_fairness_cream', 'uploads/all/luDwBEpfKdKOK3MyRwGwhlbaoVIYHK5wViITuri6.jpg', 9, 64045, 'jpg', 'image', '2022-11-12 09:49:13', '2022-11-12 09:49:13', NULL),
(2443, 'ps-nl-003', 'uploads/all/c1XjJpVMm3hZ6MiB6zKUrTThwNnSKPt8NFuG5G3V.jpg', 9, 70078, 'jpg', 'image', '2022-11-12 09:51:10', '2022-11-12 09:51:10', NULL),
(2444, 'ps-nl-002', 'uploads/all/BO0G7zclKvvbVXMGGRUu7MaER9kn4eFWqgwLh4t6.jpg', 9, 56156, 'jpg', 'image', '2022-11-12 09:53:42', '2022-11-12 09:53:42', NULL),
(2445, 'ps-nl-001_4', 'uploads/all/OfbDcZEs7A8gXQmQmAzqOEVaklwCRPmA2WmqLrPf.jpg', 9, 48985, 'jpg', 'image', '2022-11-12 09:56:06', '2022-11-12 09:56:06', NULL),
(2446, 'abuzar-xheikh-nLDAbNlusuA-unsplash', 'uploads/all/CiOuirqZJQhdvdMTj9EeHBWbpx8hOCdEZu1W5DDT.jpg', 9, 88744, 'jpg', 'image', '2022-11-12 11:50:12', '2022-11-12 11:50:12', NULL),
(2447, 'scambia-CQgxaBhuzhA-unsplash', 'uploads/all/3QJFczxp4hff79LcO6Cg9zQQUeK2FJmQpCvCvUaY.jpg', 9, 64929, 'jpg', 'image', '2022-11-12 11:55:27', '2022-11-12 11:55:27', NULL),
(2448, 'muhammad-ali-2LTkVBl6ViM-unsplash', 'uploads/all/ZV0AVNKJUyNPoNuqfUJrY1mSw1d7iyNYHm3XiQhh.jpg', 9, 134636, 'jpg', 'image', '2022-11-12 11:59:51', '2022-11-12 12:09:28', '2022-11-12 12:09:28'),
(2449, 'muhammad-ali-2LTkVBl6ViM-unsplash', 'uploads/all/wlOupVnLCwKqgkfIy2sla0zXW5pJciMUkpdONsuF.png', 9, 744582, 'png', 'image', '2022-11-12 12:03:28', '2022-11-12 12:09:13', '2022-11-12 12:09:13'),
(2450, 'muhammad-ali-2LTkVBl6ViM-unsplash', 'uploads/all/pV5KkBTpDjjbBAurmuWo7XmscODPS07nTpQDWQa9.png', 9, 744582, 'png', 'image', '2022-11-12 12:06:33', '2022-11-12 12:08:57', '2022-11-12 12:08:57'),
(2451, 'New Project', 'uploads/all/QAQgVFKQw7759UPTqFlHpmecFZE8QM3SE3r4fHJi.png', 9, 745132, 'png', 'image', '2022-11-12 12:10:26', '2022-11-12 12:10:26', NULL),
(2452, 'New Project (1)', 'uploads/all/zf5rAK0ZumcjPSRNxWwyN6R8cOHPK9vmChMWbEql.png', 9, 465547, 'png', 'image', '2022-11-12 12:15:43', '2022-11-12 12:15:43', NULL),
(2453, 'bulbul-ahmed-xTrp1WOq2Do-unsplash', 'uploads/all/rdXts3zI3RufW4XbI0GSMXoo1Dw826Y7hl1WpUi6.jpg', 9, 89697, 'jpg', 'image', '2022-11-12 12:17:20', '2022-11-12 12:17:20', NULL),
(2454, 'New Project (2)', 'uploads/all/gugVHkiaqVYclveQK2UrcvJhfeNTsbJgsIluRvHU.png', 9, 870219, 'png', 'image', '2022-11-12 12:21:00', '2022-11-12 12:21:00', NULL),
(2455, 'mohamad-khosravi-d54wbtjedog-unsplash', 'uploads/all/cWCtbPXpNR5q1qvSwfNUz50vLegjP12b3ve5qeNr.jpg', 9, 97327, 'jpg', 'image', '2022-11-12 17:47:46', '2022-11-12 17:47:46', NULL),
(2456, 'SIZE_CHART-BS-001_-_Cropped_To_Boarder', 'uploads/all/WBOfsQSZQ1VHFhfyyGHWzYh30NkK2dbkrpgSINeK.jpg', 9, 57453, 'jpg', 'image', '2022-11-24 19:15:44', '2022-11-24 19:15:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `referred_by` int(11) DEFAULT NULL,
  `provider_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'customer',
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `verification_code` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `new_email_verificiation_code` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_original` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `balance` double(20,2) NOT NULL DEFAULT 0.00,
  `banned` tinyint(4) NOT NULL DEFAULT 0,
  `referral_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_package_id` int(11) DEFAULT NULL,
  `remaining_uploads` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `referred_by`, `provider_id`, `user_type`, `name`, `email`, `email_verified_at`, `verification_code`, `new_email_verificiation_code`, `password`, `remember_token`, `device_token`, `avatar`, `avatar_original`, `address`, `country`, `city`, `postal_code`, `phone`, `balance`, `banned`, `referral_code`, `customer_package_id`, `remaining_uploads`, `created_at`, `updated_at`) VALUES
(9, NULL, NULL, 'admin', 'admin', 'name@gmail.com', '2021-08-16 11:08:38', NULL, NULL, '$2y$10$Jn15kyUbtDb5NtvkEufoROeh8xPGB4Oyj7JVL8zLgZ9V1./ZCvpsC', 'n6UeOAFRsLkldUbsz1Y8dwgQPfSCj302xpkWbnPB92rRhEI3XfhnrClvquuQ', NULL, NULL, '2237', NULL, NULL, NULL, NULL, NULL, 0.00, 0, NULL, NULL, 0, '2021-08-16 11:37:38', '2021-10-17 11:40:20'),
(124, NULL, NULL, 'customer', 'Sohel Wmx', 'sohel@walletmix.com', '2021-09-28 11:09:07', NULL, NULL, '$2y$10$t5k9RGwhTUFJKjB.YbqT9O1KbpZsBiAFfxZ.xy1SxW7V/U.a1tbky', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01717111222', 0.00, 0, NULL, NULL, 0, '2021-09-28 11:41:07', '2021-09-29 12:09:12'),
(140, NULL, NULL, 'customer', 'Sohel', NULL, '2022-11-04 19:11:08', '805681', NULL, '$2y$10$YW9Vu8ZlvwbwNRmFG4qY/.wQiZkToMsrXlFQkG791UO40m7xUKkRS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '+8801717702480', 0.00, 0, NULL, NULL, 0, '2022-11-05 07:33:24', '2022-11-05 07:37:34');

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double(20,2) NOT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(3, 124, 667, '2022-04-12 09:58:43', '2022-04-12 09:58:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_configs`
--
ALTER TABLE `affiliate_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_logs`
--
ALTER TABLE `affiliate_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_options`
--
ALTER TABLE `affiliate_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_payments`
--
ALTER TABLE `affiliate_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_stats`
--
ALTER TABLE `affiliate_stats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_users`
--
ALTER TABLE `affiliate_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `affiliate_withdraw_requests`
--
ALTER TABLE `affiliate_withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_settings`
--
ALTER TABLE `app_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_translations`
--
ALTER TABLE `attribute_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brand_translations`
--
ALTER TABLE `brand_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slug` (`slug`);

--
-- Indexes for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city_translations`
--
ALTER TABLE `city_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `club_points`
--
ALTER TABLE `club_points`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `club_point_details`
--
ALTER TABLE `club_point_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commission_histories`
--
ALTER TABLE `commission_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
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
-- Indexes for table `customer_packages`
--
ALTER TABLE `customer_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_package_payments`
--
ALTER TABLE `customer_package_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_package_translations`
--
ALTER TABLE `customer_package_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_products`
--
ALTER TABLE `customer_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_product_translations`
--
ALTER TABLE `customer_product_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_boys`
--
ALTER TABLE `delivery_boys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `divisions`
--
ALTER TABLE `divisions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `firebase_notifications`
--
ALTER TABLE `firebase_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deals`
--
ALTER TABLE `flash_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deal_translations`
--
ALTER TABLE `flash_deal_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_categories`
--
ALTER TABLE `home_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `otp_configurations`
--
ALTER TABLE `otp_configurations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_translations`
--
ALTER TABLE `page_translations`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `pickup_points`
--
ALTER TABLE `pickup_points`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pickup_point_translations`
--
ALTER TABLE `pickup_point_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `policies`
--
ALTER TABLE `policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `tags` (`tags`(255));

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_taxes`
--
ALTER TABLE `product_taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_translations`
--
ALTER TABLE `product_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proxypay_payments`
--
ALTER TABLE `proxypay_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_requests`
--
ALTER TABLE `refund_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_translations`
--
ALTER TABLE `role_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `searches`
--
ALTER TABLE `searches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `seller_withdraw_requests`
--
ALTER TABLE `seller_withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seo_settings`
--
ALTER TABLE `seo_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_templates`
--
ALTER TABLE `sms_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addons`
--
ALTER TABLE `addons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `affiliate_configs`
--
ALTER TABLE `affiliate_configs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `affiliate_logs`
--
ALTER TABLE `affiliate_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `affiliate_options`
--
ALTER TABLE `affiliate_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `affiliate_payments`
--
ALTER TABLE `affiliate_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `affiliate_stats`
--
ALTER TABLE `affiliate_stats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `affiliate_users`
--
ALTER TABLE `affiliate_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `affiliate_withdraw_requests`
--
ALTER TABLE `affiliate_withdraw_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_settings`
--
ALTER TABLE `app_settings`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `attribute_translations`
--
ALTER TABLE `attribute_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=269;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brand_translations`
--
ALTER TABLE `brand_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=314;

--
-- AUTO_INCREMENT for table `category_translations`
--
ALTER TABLE `category_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=314;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `city_translations`
--
ALTER TABLE `city_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `club_points`
--
ALTER TABLE `club_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `club_point_details`
--
ALTER TABLE `club_point_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `commission_histories`
--
ALTER TABLE `commission_histories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `customer_packages`
--
ALTER TABLE `customer_packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_package_payments`
--
ALTER TABLE `customer_package_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_package_translations`
--
ALTER TABLE `customer_package_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_products`
--
ALTER TABLE `customer_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_product_translations`
--
ALTER TABLE `customer_product_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_boys`
--
ALTER TABLE `delivery_boys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `divisions`
--
ALTER TABLE `divisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `firebase_notifications`
--
ALTER TABLE `firebase_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_deals`
--
ALTER TABLE `flash_deals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=868;

--
-- AUTO_INCREMENT for table `flash_deal_translations`
--
ALTER TABLE `flash_deal_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `home_categories`
--
ALTER TABLE `home_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `otp_configurations`
--
ALTER TABLE `otp_configurations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `page_translations`
--
ALTER TABLE `page_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pickup_points`
--
ALTER TABLE `pickup_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pickup_point_translations`
--
ALTER TABLE `pickup_point_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `policies`
--
ALTER TABLE `policies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=693;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4794;

--
-- AUTO_INCREMENT for table `product_taxes`
--
ALTER TABLE `product_taxes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_translations`
--
ALTER TABLE `product_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=688;

--
-- AUTO_INCREMENT for table `proxypay_payments`
--
ALTER TABLE `proxypay_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_requests`
--
ALTER TABLE `refund_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `role_translations`
--
ALTER TABLE `role_translations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `searches`
--
ALTER TABLE `searches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller_withdraw_requests`
--
ALTER TABLE `seller_withdraw_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seo_settings`
--
ALTER TABLE `seo_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_templates`
--
ALTER TABLE `sms_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28403;

--
-- AUTO_INCREMENT for table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2457;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
