-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 22, 2023 at 09:53 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_12_20_105254_create_stores_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
CREATE TABLE IF NOT EXISTS `stores` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` decimal(10,7) NOT NULL,
  `longitude` decimal(10,7) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `title`, `address`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(1, 'Laxmi Medical Store', '3H87+V6Q, Viyashwadi Road, Akhbar Nagar, Nava Vadaj, Ahmedabad', '23.0672084', '72.5630953', '2023-12-22 04:21:55', '2023-12-22 04:21:55'),
(2, 'Computer Shopper', 'opposite Mirambica School, C-2, Prem Kunj Society, Naranpura, Naranpura, opposite Mirambica School, Ahmedabad', '23.0575372', '72.5530171', '2023-12-22 04:21:55', '2023-12-22 04:21:55'),
(3, 'Happy Home Furniture', '37, Happy Home Shopping Centre, Shastrinagar, Ankur, Road, Ranna Park, Naranpura, Ahmedabad', '23.0645966', '72.5493864', '2023-12-22 04:21:55', '2023-12-22 04:21:55'),
(4, 'Heena RO System', '3G9V+94V, Nr Ghatlodia Post Office,, opp. Nutan School, Ahmedabad', '23.0684885', '72.5428095', '2023-12-22 04:21:55', '2023-12-22 04:21:55'),
(5, 'Hocco Eatery', '12,13,14, Marutinandan Complex, KK Nagar Road, Char Rasta, Ghatlodiya, Ahmedabad', '23.0721130', '72.5513880', '2023-12-22 04:21:55', '2023-12-22 04:23:44'),
(6, 'Asian Paint Shop', 'Adishwar Apartment, Gaurav Path, ISRO Colony, Shastrinagar, Nirnay Nagar, Ahmedabad', '23.0624352', '72.5521578', '2023-12-22 04:21:55', '2023-12-22 04:21:55'),
(7, 'The Brown Box', 'near HPCL Petrol Pump, 40, Kanal Tenaments, near HPCL Petrol Pump, KK Nagar Road, Chandlodiya, Ahmedabad', '23.0763314', '72.5531228', '2023-12-22 04:21:55', '2023-12-22 04:21:55'),
(8, 'PEARL GOLD PALACE', 'F-10, Shubham Complex,, K K NAGAR, Ghatlodia, Ahmedabad', '23.0716760', '72.5484538', '2023-12-22 04:21:55', '2023-12-22 04:23:44'),
(9, 'Shree Vishwakarma Enterprise', 'Silver Star Complex Commercial Mall, Chandlodiya Road, Chandlodiya, Ahmedabad', '23.0826896', '72.5468405', '2023-12-22 04:21:55', '2023-12-22 04:21:55'),
(10, 'Kandarp Consultancy', 'India', '23.0675950', '72.5564920', '2023-12-22 04:21:55', '2023-12-22 04:23:44'),
(11, 'Sales India', 'opp. Auda Garden, Near HP-Petrol Pump, opp. Auda Garden, KK Nagar Road, Ghatlodiya, Ahmedabad', '23.0741437', '72.5553849', '2023-12-22 04:21:55', '2023-12-22 04:21:55'),
(12, 'Vishal Traders', '38-Manju Shree Society, Ranna Park, Ahmedabad', '23.0674740', '72.5449280', '2023-12-22 04:21:55', '2023-12-22 04:23:44'),
(13, 'Patel Motors', '29, Sharddhadeep Complex, Near Gathiya Rath, Gaurav Path, Shashtrinagar, Naranpura, Ahmedabad', '23.0627076', '72.5506718', '2023-12-22 04:21:55', '2023-12-22 04:21:55'),
(14, 'Kobawala Containers', 'D-504, Arjun Greens, Near valkeshwar Flat, K. K. Nagar, Rannapark, Ghatlodia, Ahmedabad', '23.0760860', '72.5515384', '2023-12-22 04:21:55', '2023-12-22 04:23:44'),
(15, 'Krishna Care', '69/818, Mangalmurti Appartment, Opp. Naranpura Telephone Exchange, Naranpura, Ahmedabad', '23.0602243', '72.5474864', '2023-12-22 04:21:55', '2023-12-22 04:21:55'),
(16, 'Amul Milk Parlour', '273, Madhusudan Ojha Road, Gujarat Housing Board, Vijaynagar, Naranpura, Ahmedabad', '23.0635281', '72.5559167', '2023-12-22 04:21:55', '2023-12-22 04:21:55'),
(17, 'Shanti Refrigeration', '65, Shastrinagar Shopping Centre, Nr. Pragatinagar Garden, Naranpura, Ahmedabad', '23.0646090', '72.5535920', '2023-12-22 04:21:55', '2023-12-22 04:23:44'),
(18, 'Authentic Projector India', 'W1, Madhavbagh,, Nirnaynagar, Chandlodia Road, Ahmedabad', '23.0804172', '72.5504088', '2023-12-22 04:21:55', '2023-12-22 04:21:55'),
(19, 'Zaveri Jewellers', 'opposite Utkarsh Vidyalaya, Sector-7, Nirnai Nagar, Nirnai Nagar, opposite Utkarsh Vidyalaya, Ahmedabad', '23.0690550', '72.5530171', '2023-12-22 04:21:55', '2023-12-22 04:23:44'),
(20, 'Amul Dairy Store', '3HF4+F4J, KK Nagar Road, Madhuvrund Society, Chandlodiya, Ahmedabad', '23.0737133', '72.5552505', '2023-12-22 04:21:55', '2023-12-22 04:21:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
