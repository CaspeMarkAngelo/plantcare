-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2025 at 12:46 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `plantcare`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `CommentID` int(11) NOT NULL,
  `PostID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `CommentText` text NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`CommentID`, `PostID`, `UserID`, `CommentText`, `CreatedAt`) VALUES
(5, 6, 12, 'Ingat kayo diyan! ^_^', '2025-01-07 12:41:42'),
(6, 7, 1, 'HAHAHA\r\n', '2025-01-08 07:22:19');

-- --------------------------------------------------------

--
-- Table structure for table `controldata`
--

CREATE TABLE `controldata` (
  `id` int(11) NOT NULL,
  `relay_state` enum('RELAY_ON','RELAY_OFF') NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `controldata`
--

INSERT INTO `controldata` (`id`, `relay_state`, `timestamp`) VALUES
(26, 'RELAY_OFF', '2024-09-25 15:08:08'),
(27, 'RELAY_ON', '2024-09-25 15:09:20'),
(28, 'RELAY_OFF', '2024-09-25 15:12:15'),
(29, 'RELAY_ON', '2024-09-25 15:13:15'),
(30, 'RELAY_OFF', '2024-09-25 15:52:13'),
(31, 'RELAY_ON', '2024-09-25 15:52:21'),
(32, 'RELAY_OFF', '2024-09-25 15:53:03'),
(33, 'RELAY_ON', '2024-09-25 15:57:00'),
(34, 'RELAY_OFF', '2024-09-25 16:00:02'),
(35, 'RELAY_ON', '2024-09-25 16:00:17'),
(36, 'RELAY_OFF', '2024-09-25 16:05:05'),
(37, 'RELAY_ON', '2024-09-25 16:05:18'),
(38, 'RELAY_OFF', '2024-09-25 16:05:57'),
(39, 'RELAY_ON', '2024-09-25 16:07:37'),
(40, 'RELAY_OFF', '2024-09-25 16:13:43'),
(41, 'RELAY_ON', '2024-09-25 16:13:48'),
(42, 'RELAY_OFF', '2024-09-25 16:20:56'),
(43, 'RELAY_ON', '2024-09-25 16:24:58'),
(44, 'RELAY_OFF', '2024-09-25 16:30:36'),
(45, 'RELAY_ON', '2024-09-25 16:53:07'),
(46, 'RELAY_OFF', '2024-09-26 11:39:31'),
(47, 'RELAY_ON', '2024-09-26 11:39:36'),
(48, 'RELAY_OFF', '2024-09-26 11:41:02'),
(49, 'RELAY_ON', '2024-09-26 11:41:08'),
(50, 'RELAY_OFF', '2024-09-26 11:43:33'),
(51, 'RELAY_ON', '2024-09-26 11:43:38'),
(52, 'RELAY_OFF', '2024-09-26 12:20:24'),
(53, 'RELAY_ON', '2024-09-26 12:20:35'),
(54, 'RELAY_OFF', '2024-09-26 12:20:42'),
(55, 'RELAY_ON', '2024-09-26 12:20:47'),
(56, 'RELAY_OFF', '2024-09-26 12:21:40'),
(57, 'RELAY_ON', '2024-09-26 12:33:42'),
(58, 'RELAY_OFF', '2024-09-26 12:33:48'),
(59, 'RELAY_ON', '2024-09-26 12:34:29'),
(60, 'RELAY_OFF', '2024-09-26 14:11:36'),
(61, 'RELAY_ON', '2024-09-26 14:12:12'),
(62, 'RELAY_OFF', '2024-09-26 14:14:06'),
(63, 'RELAY_ON', '2024-09-26 14:16:46'),
(64, 'RELAY_OFF', '2024-09-26 14:33:58'),
(65, 'RELAY_ON', '2024-09-26 14:34:03'),
(66, 'RELAY_OFF', '2024-09-26 14:34:05'),
(67, 'RELAY_ON', '2024-09-26 14:38:36'),
(68, 'RELAY_OFF', '2024-09-26 14:44:46'),
(69, 'RELAY_ON', '2024-09-26 14:45:49'),
(70, 'RELAY_OFF', '2024-09-26 14:45:52'),
(71, 'RELAY_ON', '2024-09-26 14:46:22'),
(72, 'RELAY_OFF', '2024-09-26 14:46:28'),
(73, 'RELAY_ON', '2024-09-26 14:46:30'),
(74, 'RELAY_OFF', '2024-09-26 14:46:32'),
(75, 'RELAY_ON', '2024-09-26 14:46:35'),
(76, 'RELAY_OFF', '2024-09-26 14:46:37'),
(77, 'RELAY_ON', '2024-09-26 14:48:48'),
(78, 'RELAY_OFF', '2024-09-26 14:48:56'),
(79, 'RELAY_ON', '2024-09-26 14:49:27'),
(80, 'RELAY_OFF', '2024-09-26 14:49:56'),
(81, 'RELAY_ON', '2024-09-26 14:50:01'),
(82, 'RELAY_OFF', '2024-09-26 14:50:26'),
(83, 'RELAY_ON', '2024-09-26 14:53:07'),
(84, 'RELAY_OFF', '2024-09-26 15:03:58'),
(85, 'RELAY_ON', '2024-09-26 15:04:09'),
(86, 'RELAY_OFF', '2024-09-26 15:06:05'),
(87, 'RELAY_ON', '2024-09-26 15:06:35'),
(88, 'RELAY_OFF', '2024-09-26 15:08:31'),
(89, 'RELAY_ON', '2024-09-26 15:08:51'),
(90, 'RELAY_OFF', '2024-09-26 15:09:16'),
(91, 'RELAY_ON', '2024-09-26 15:09:23'),
(92, 'RELAY_OFF', '2024-09-26 15:10:02'),
(93, 'RELAY_ON', '2024-09-26 15:10:16'),
(94, 'RELAY_OFF', '2024-09-26 15:10:22'),
(95, 'RELAY_ON', '2024-09-26 15:21:55'),
(96, 'RELAY_OFF', '2024-09-26 15:22:05'),
(97, 'RELAY_ON', '2024-11-02 01:38:55'),
(98, 'RELAY_OFF', '2024-11-02 01:41:57'),
(99, 'RELAY_ON', '2024-11-02 01:42:03'),
(100, 'RELAY_OFF', '2024-11-02 01:43:35'),
(123, 'RELAY_ON', '2024-11-02 12:03:46'),
(124, 'RELAY_OFF', '2024-11-02 12:03:52'),
(125, 'RELAY_ON', '2024-11-02 12:24:14'),
(126, 'RELAY_OFF', '2024-11-02 12:24:21'),
(127, 'RELAY_ON', '2024-11-02 12:24:56'),
(128, 'RELAY_OFF', '2024-11-02 12:25:05'),
(129, 'RELAY_ON', '2024-11-02 12:25:11'),
(130, 'RELAY_OFF', '2024-11-02 12:25:29'),
(131, 'RELAY_ON', '2024-11-02 12:25:36'),
(132, 'RELAY_OFF', '2024-11-02 12:25:43'),
(133, 'RELAY_ON', '2024-11-02 12:25:49'),
(134, 'RELAY_OFF', '2024-11-02 12:27:00'),
(135, 'RELAY_ON', '2024-11-02 12:27:15'),
(136, 'RELAY_OFF', '2024-11-02 12:27:21'),
(137, 'RELAY_ON', '2024-11-04 13:32:53'),
(138, 'RELAY_OFF', '2024-11-04 13:33:25'),
(139, 'RELAY_ON', '2024-11-04 13:33:52'),
(140, 'RELAY_OFF', '2024-11-16 05:15:25'),
(141, 'RELAY_ON', '2024-11-16 05:23:58'),
(142, 'RELAY_OFF', '2024-11-16 05:24:34'),
(143, 'RELAY_ON', '2024-11-23 06:29:33'),
(144, 'RELAY_OFF', '2024-11-23 06:30:15'),
(145, 'RELAY_ON', '2024-11-23 06:30:28'),
(146, 'RELAY_OFF', '2024-11-23 06:30:42'),
(147, 'RELAY_ON', '2024-11-23 06:32:00'),
(148, 'RELAY_OFF', '2024-11-24 06:26:13'),
(149, 'RELAY_ON', '2024-11-24 06:31:00'),
(150, 'RELAY_OFF', '2024-11-24 06:31:37'),
(151, 'RELAY_ON', '2024-11-25 09:39:27'),
(152, 'RELAY_OFF', '2024-11-25 09:40:00'),
(153, 'RELAY_ON', '2024-11-25 09:49:26'),
(154, 'RELAY_OFF', '2024-11-25 09:49:28'),
(155, 'RELAY_ON', '2024-11-25 09:59:00'),
(156, 'RELAY_OFF', '2024-11-25 10:36:21'),
(157, 'RELAY_ON', '2024-11-25 10:38:00'),
(158, 'RELAY_ON', '2024-11-25 10:43:00'),
(159, 'RELAY_OFF', '2024-11-25 10:44:28'),
(160, 'RELAY_ON', '2024-11-25 10:47:00'),
(161, 'RELAY_ON', '2024-11-25 13:22:00'),
(162, 'RELAY_OFF', '2024-11-25 13:23:53'),
(163, 'RELAY_ON', '2024-11-25 13:27:00'),
(164, 'RELAY_ON', '2024-11-25 13:49:00'),
(165, 'RELAY_OFF', '2024-11-25 17:10:05'),
(166, 'RELAY_ON', '2024-11-25 17:39:00'),
(167, 'RELAY_OFF', '2024-11-25 17:45:52'),
(168, 'RELAY_ON', '2024-11-25 17:46:02'),
(169, 'RELAY_OFF', '2024-11-25 17:50:07'),
(170, 'RELAY_ON', '2024-11-25 17:50:13'),
(171, 'RELAY_OFF', '2024-11-25 17:50:14'),
(172, 'RELAY_ON', '2024-11-25 17:51:31'),
(173, 'RELAY_OFF', '2024-11-25 17:52:52'),
(174, 'RELAY_ON', '2024-11-25 17:52:55'),
(175, 'RELAY_OFF', '2024-11-25 17:52:55'),
(176, 'RELAY_ON', '2024-11-25 17:52:55'),
(177, 'RELAY_OFF', '2024-11-25 17:52:56'),
(178, 'RELAY_ON', '2024-11-25 17:52:56'),
(179, 'RELAY_OFF', '2024-11-25 17:52:57'),
(180, 'RELAY_ON', '2024-11-25 17:57:44'),
(181, 'RELAY_OFF', '2024-11-25 17:57:48'),
(182, 'RELAY_ON', '2024-11-25 18:00:16'),
(183, 'RELAY_OFF', '2024-11-25 18:00:17'),
(184, 'RELAY_ON', '2024-11-25 18:00:18'),
(185, 'RELAY_OFF', '2024-11-25 18:00:18'),
(186, 'RELAY_ON', '2024-11-25 18:00:19'),
(187, 'RELAY_OFF', '2024-11-25 18:00:20'),
(188, 'RELAY_ON', '2024-11-25 18:00:21'),
(189, 'RELAY_OFF', '2024-11-25 18:00:21'),
(190, 'RELAY_ON', '2024-11-25 18:01:07'),
(191, 'RELAY_ON', '2024-11-25 18:09:00'),
(192, 'RELAY_ON', '2024-11-25 18:57:00'),
(193, 'RELAY_ON', '2024-11-25 18:58:00'),
(194, 'RELAY_ON', '2024-11-25 18:59:00'),
(195, 'RELAY_ON', '2024-11-25 19:00:00'),
(196, 'RELAY_ON', '2024-11-25 19:01:00'),
(197, 'RELAY_ON', '2024-11-25 19:02:00'),
(198, 'RELAY_ON', '2024-11-25 19:03:00'),
(199, 'RELAY_ON', '2024-11-25 19:04:00'),
(200, 'RELAY_ON', '2024-11-25 19:05:00'),
(201, 'RELAY_ON', '2024-11-25 19:06:00'),
(202, 'RELAY_ON', '2024-11-25 19:07:00'),
(203, 'RELAY_ON', '2024-11-25 19:08:00'),
(204, 'RELAY_ON', '2024-11-25 19:09:00'),
(205, 'RELAY_ON', '2024-11-25 19:12:00');

-- --------------------------------------------------------

--
-- Table structure for table `custom_schedules`
--

CREATE TABLE `custom_schedules` (
  `id` int(11) NOT NULL,
  `device_id` int(11) NOT NULL,
  `schedule_date` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `custom_schedules`
--

INSERT INTO `custom_schedules` (`id`, `device_id`, `schedule_date`, `created_at`) VALUES
(1, 16, '2024-12-24 12:30:00', '2024-12-24 04:26:04'),
(2, 16, '2024-12-24 12:30:00', '2024-12-24 04:26:04'),
(3, 16, '2024-12-24 12:30:00', '2024-12-24 04:31:39');

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` enum('on','off') NOT NULL DEFAULT 'off',
  `user_id` int(11) NOT NULL,
  `device_name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `userid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `device_config`
--

CREATE TABLE `device_config` (
  `id` int(11) NOT NULL,
  `device_name` varchar(50) NOT NULL,
  `moisture_level` int(11) DEFAULT NULL,
  `relay_state` enum('RELAY_ON','RELAY_OFF') NOT NULL DEFAULT 'RELAY_OFF',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `plantId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `device_config`
--

INSERT INTO `device_config` (`id`, `device_name`, `moisture_level`, `relay_state`, `updated_at`, `plantId`) VALUES
(26, 'device1', 26, 'RELAY_OFF', '2025-01-08 07:07:24', 8),
(27, 'potato', NULL, 'RELAY_OFF', '2025-01-08 07:11:50', 0),
(28, 'sayote', NULL, 'RELAY_OFF', '2025-01-08 07:13:25', 0);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `type` enum('post','comment') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `post_id`, `comment_id`, `type`) VALUES
(11, 1, 7, NULL, 'post'),
(4, 11, NULL, 2, 'comment'),
(1, 12, NULL, 2, 'comment'),
(10, 12, NULL, 5, 'comment'),
(3, 12, 1, NULL, 'post'),
(2, 12, 2, NULL, 'post'),
(5, 12, 3, NULL, 'post'),
(7, 12, 4, NULL, 'post'),
(6, 13, 3, NULL, 'post'),
(8, 13, 4, NULL, 'post'),
(9, 13, 6, NULL, 'post');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000001_create_cache_table', 1),
(2, '0001_01_01_000002_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `device_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `device_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `device_id`, `message`, `created_at`, `device_name`) VALUES
(8532, 26, 'Relay has been turned ON', '2025-01-07 16:48:40', NULL),
(8533, 26, 'Relay has been turned OFF', '2025-01-07 16:49:00', NULL),
(8534, 26, 'Relay has been turned OFF', '2025-01-07 17:23:02', NULL),
(8535, 26, 'Relay has been turned ON', '2025-01-07 17:23:05', NULL),
(8536, 26, 'Relay has been turned OFF', '2025-01-07 17:23:08', NULL),
(8537, 26, 'Relay has been turned OFF', '2025-01-07 17:36:00', 'device1'),
(8538, 26, 'Relay has been turned ON', '2025-01-07 17:36:03', 'device1'),
(8539, 26, 'Relay has been turned OFF', '2025-01-07 17:36:52', 'device1'),
(8540, 26, 'Relay has been turned OFF', '2025-01-08 06:38:57', 'device1'),
(8541, 26, 'Relay has been turned OFF', '2025-01-08 07:07:24', 'device1');

-- --------------------------------------------------------

--
-- Table structure for table `plants`
--

CREATE TABLE `plants` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `humidity` varchar(100) DEFAULT NULL,
  `water_schedule` varchar(100) DEFAULT NULL,
  `fertilizer` varchar(100) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `soil_moisture` int(11) DEFAULT NULL,
  `schedule_type` enum('daily','weekly','monthly') DEFAULT NULL,
  `interval_ms` int(11) DEFAULT NULL,
  `execution_count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plants`
--

INSERT INTO `plants` (`id`, `name`, `image_url`, `humidity`, `water_schedule`, `fertilizer`, `details`, `category`, `soil_moisture`, `schedule_type`, `interval_ms`, `execution_count`) VALUES
(1, 'Sigarilyas (Winged Bean)', 'assets/sigarilyas.png', 'Winged bean thrives best in humidity levels of 60% to 80%, promoting healthy vine growth.', 'Regularly 2-3 times a week (moderate).', 'Balance N-P-K every 4 to 6 weeks.', '(Sigarilyas) Scientific Name: Psophocarpus tetragonolobus. Sigarilyas, also known as winged bean, is a tropical legume valued for its nutrient-rich pods, leaves, and seeds. It is a versatile vegetable commonly used in Filipino cuisine and known for its high protein content.', 'summer', 26, 'weekly', 8, 3),
(2, 'Bitter Gourd ', 'assets/bitter-gourd2.png', 'Bitter gourd grows best in humidity levels of 60% to 80%, which supports flowering and fruit set.', 'Regularly 2-3 times a week(moderate)', 'Balance N-P-K Every 4 to 6 weeks', '(Ampalaya)\r\nScientific Name: Momordica charantia\r\nBitter gourd, also known as ampalaya, is a tropical vine commonly grown for its edible, bitter fruits. It is rich in vitamins and minerals and is often used in various culinary dishes', 'rainy', 30, 'weekly', 8, 3),
(3, 'Onion', 'assets/onions.png', 'Onion prefers lower humidity levels of 40% to 50%, reducing the risk of diseases.', 'Once a week, twice during dry periods.', 'High nitrogen fertilizer every 3 to 4 weeks.', '(Onion) Scientific Name: Allium cepa. Onion is a widely cultivated vegetable used for its pungent flavor and medicinal properties. It is a key ingredient in many dishes and is known for its antioxidant and antimicrobial benefits.', 'summer/rainy', 20, 'weekly', 0, 1),
(4, 'Carrot', 'assets/karot.png', 'Carrots grow best in humidity levels of 60% to 70%, supporting root development.', 'Provide consistent moisture, about 1 inch of water weekly.', 'Low nitrogen, high phosphorus and potassium every 3 to 4 weeks', '(Carrot) Scientific Name: Daucus carota. Carrot is a root vegetable known for its sweet taste and high beta-carotene content, which converts to vitamin A in the body. It is a staple in salads, soups, and various dishes.', 'summer/rainy', 0, NULL, NULL, NULL),
(5, 'Corn', 'assets/corn.png', 'Corn thrives in moderate humidity levels of 50% to 60%, aiding in pollination and ear development.', 'Deep watering, about 1.5 inches per week.', 'High nitrogen fertilizer every 4 to 6 weeks', '(Corn) Scientific Name: Zea mays. Corn is a cereal crop grown for its edible kernels, which are used for food, animal feed, and industrial products. It is a staple in many cuisines and can be eaten fresh or processed.', 'summer', 0, NULL, NULL, NULL),
(6, 'Wheat', 'assets/wheat.png', 'Grows well in moderate humidity levels of 40% to 60%.', 'Moderate watering, about 1 inch per week.', 'Apply nitrogen-rich fertilizer every 4 to 6 weeks', '(Wheat) Scientific Name: Triticum aestivum. Wheat is a cereal grain widely grown for its seeds, which are processed into flour for bread, pasta, and other foods. It is a staple crop globally due to its high nutritional value and versatility.', 'summer/rainy', 0, NULL, NULL, NULL),
(7, 'Arugula', 'assets/arugula.jpg', 'Prefers humidity levels of 50% to 70% for optimal leaf production.', 'Water regularly 2-3 times a week (moderate).', 'Apply balanced N-P-K every 3 to 4 weeks.', '(Arugula) Scientific Name: Eruca sativa. Arugula, also known as rocket or roquette, is a leafy green vegetable with a peppery flavor. It is often used in salads and as a garnish, valued for its vitamins and antioxidants.', 'rainy', 0, NULL, NULL, NULL),
(8, 'Basil', 'assets/basil.jpg', 'Basil thrives in humidity levels of 60% to 80%.', 'Water 2-3 times a week, keeping the soil slightly moist.', 'Use a balanced fertilizer every 4 weeks.', '(Basil) Scientific Name: Ocimum basilicum. Basil is a fragrant herb commonly used in cooking, especially in Italian and Southeast Asian cuisines. It is known for its medicinal properties and is rich in antioxidants and essential oils.', 'summer/rainy', 0, NULL, NULL, NULL),
(9, 'Beet', 'assets/beet.jpg', 'Beets prefer humidity levels of 60% to 70%.', 'Provide consistent moisture, about 1 inch per week.', 'Apply low nitrogen, high phosphorus, and potassium fertilizer every 3 to 4 weeks.', '(Beet) Scientific Name: Beta vulgaris. Beets are root vegetables known for their sweet, earthy flavor and high nutritional content, including fiber, folate, and antioxidants. Both the root and leaves are edible.', 'summer/rainy', 0, NULL, NULL, NULL),
(10, 'Bok Choy', 'assets/bokchoy.jpg', 'Bok choy prefers humidity levels of 60% to 70%, ensuring tender, crisp leaves.', 'Water 2-3 times a week (moderate).', 'Use a balanced fertilizer every 3 to 4 weeks.', '(Bok Choy) Scientific Name: Brassica rapa subsp. chinensis. Bok Choy, also known as Chinese cabbage, is a leafy vegetable popular in Asian cuisines. It is rich in vitamins A, C, and K and has a mild, slightly sweet flavor.', 'summer/rainy', 0, NULL, NULL, NULL),
(11, 'Broccoli', 'assets/broccoli.jpg', 'Grows best in humidity levels of 60% to 70%.', 'Water 1-2 inches per week, keeping the soil consistently moist.', 'Apply balanced N-P-K fertilizer every 3-4 weeks.', '(Broccoli) Scientific Name: Brassica oleracea var. italica. Broccoli is a nutrient-rich vegetable known for its edible green florets. It is a cool-season crop packed with vitamins, fiber, and antioxidants, often used in salads, soups, and stir-fries.', 'rainy', 0, NULL, NULL, NULL),
(12, 'Cabbage Napa', 'assets/cabbagenapa.jpg', 'Napa cabbage grows best in humidity levels of 70% to 80%, which supports its mild, tender leaves.', 'Water regularly 1-2 times a week, keeping soil moist but not soggy.', 'Use a balanced fertilizer every 4 weeks.', '(Cabbage Napa) Scientific Name: Brassica rapa subsp. pekinensis. Napa cabbage, also known as Chinese cabbage, has a mild, sweet taste and is commonly used in Asian dishes like stir-fries and kimchi.', 'rainy', 0, NULL, NULL, NULL),
(13, 'Cabbage', 'assets/cabbage.jpg', 'Grows well in humidity levels of 60% to 80%.', 'Water 1-2 inches per week, ensuring consistent moisture.', 'Apply balanced N-P-K fertilizer every 3-4 weeks.', '(Cabbage) Scientific Name: Brassica oleracea var. capitata. Cabbage is a leafy vegetable with dense heads, commonly used in salads, soups, and fermented dishes like sauerkraut. It is high in vitamins C and K.', 'summer/rainy', 0, NULL, NULL, NULL),
(14, 'Chard', 'assets/chard.jpg', 'Chard thrives in humidity levels of 60% to 70%, ensuring lush and vibrant leaves.', 'Water 1-2 times per week, keeping soil consistently moist', 'Apply balanced N-P-K fertilizer every 3-4 weeks.', '(Chard) Scientific Name: Beta vulgaris subsp. vulgaris. Chard, also known as Swiss chard, is a leafy green vegetable with colorful stems. It is rich in vitamins and minerals, often used in salads and sautés.', 'rainy', 0, NULL, NULL, NULL),
(15, 'Chayote', 'assets/chayote.jpg', 'Chayote grows best in humidity levels of 70% to 80%, which supports its vigorous vine growth.', 'Water regularly 2-3 times a week (moderate).', 'Use a balanced fertilizer every 4-6 weeks.', '(Chayote) Scientific Name: Sechium edule. Chayote, also known as vegetable pear, is a climbing plant grown for its edible fruit and shoots. It is a versatile ingredient in soups, stews, and stir-fries.', 'summer/rainy', 0, NULL, NULL, NULL),
(16, 'Chicory', 'assets/chicory.jpg', 'Chicory thrives in humidity levels of 50% to 70%, promoting healthy leaf and root development.\r\n', 'Water 1-2 times a week, keeping soil moderately moist.', 'Use a balanced fertilizer every 3-4 weeks.', '(Chicory) Scientific Name: Cichorium intybus. Chicory is a hardy perennial plant known for its leaves and roots, which are used as salad greens or a coffee substitute. It is valued for its bitter flavor and health benefits.', 'summer/rainy', 0, NULL, NULL, NULL),
(17, 'Coriander', 'assets/coriander.jpg', 'Coriander prefers humidity levels of 50% to 70%, which supports its aromatic leaves.', 'Water regularly 1-2 times a week (moderate).', 'Apply balanced N-P-K fertilizer every 3-4 weeks.', '(Coriander) Scientific Name: Coriandrum sativum. Coriander, also known as cilantro, is an herb with aromatic leaves and seeds commonly used in cooking. It is rich in antioxidants and essential oils.', 'summer/rainy', 0, NULL, NULL, NULL),
(18, 'Fennel', 'assets/fennel.jpg', 'Fennel grows best in humidity levels of 50% to 70%, which supports bulb development.', 'Water regularly 1 inch per week, ensuring consistent moisture.', 'Use a balanced fertilizer every 4-6 weeks.', '(Fennel) Scientific Name: Foeniculum vulgare. Fennel is a flowering plant with feathery leaves and a bulbous base, often used for its sweet, anise-like flavor. It is rich in fiber and antioxidants.', 'summer/rainy', 0, NULL, NULL, NULL),
(19, 'Fenugreek', 'assets/fenugreek.jpg', 'Fenugreek prefers humidity levels of 50% to 70%, promoting healthy leaf and seed growth.', 'Water 1-2 times a week (moderate).', 'Apply nitrogen-rich fertilizer every 3-4 weeks.', '(Fenugreek) Scientific Name: Trigonella foenum-graecum. Fenugreek is an herb used for its leaves and seeds, which have a slightly bitter, nutty flavor. It is often used in cooking and for its medicinal properties.', 'summer/rainy', 0, NULL, NULL, NULL),
(20, 'Kohlrabi', 'assets/kohlrabi.jpg', 'Kohlrabi thrives in humidity levels of 60% to 80%, aiding in the formation of its swollen stem.', 'Water 1-2 inches per week, keeping soil evenly moist.', 'Use a balanced fertilizer every 3-4 weeks.', '(Kohlrabi) Scientific Name: Brassica oleracea var. gongylodes. Kohlrabi, also known as German turnip, is a cool-season vegetable grown for its bulbous stem. It has a mild, sweet flavor and is used in salads and stir-fries.', 'summer/rainy', 0, NULL, NULL, NULL),
(21, 'Lettuce', 'assets/lettuce.jpg', 'Lettuce thrives in cool, moderate humidity of 60% to 70%. Excessive ', 'Water 1-2 times a week, keeping soil consistently moist.', 'Apply balanced N-P-K fertilizer every 3-4 weeks.', '(Lettuce) Scientific Name: Lactuca sativa. Lettuce is a leafy vegetable commonly used in salads and sandwiches. It comes in various types, such as romaine, iceberg, and loose-leaf, and is valued for its freshness and nutritional content.', 'summer/rainy', 0, NULL, NULL, NULL),
(22, 'Lime', 'assets/lime.jpg', 'Limes prefer moderate humidity levels around 50% to 60%. They do not tolerate excessive moisture in ', 'Water deeply once a week, allowing soil to dry slightly between waterings.', 'Use a citrus-specific fertilizer every 4-6 weeks.', '(Lime) Scientific Name: Citrus aurantiifolia. Lime trees produce small, green citrus fruits known for their tart flavor. Lime is widely used in beverages, cooking, and as a garnish.', 'summer', 0, NULL, NULL, NULL),
(23, 'Mint', 'assets/mint.jpg', 'Mint prefers a humidity range of 60% to 70%. It needs consistent moisture.', 'Water regularly 2-3 times a week, keeping the soil moist.', 'Use a balanced fertilizer every 3-4 weeks.', '(Mint) Scientific Name: Mentha spp.. Mint is a fast-growing herb with a refreshing aroma and flavor. It is used in drinks, desserts, and savory dishes and is known for its medicinal properties.', 'summer/rainy', 0, NULL, NULL, NULL),
(24, 'Mustard Greens', 'assets/mustardgreens.jpg', 'Mustard greens grow best in 60% to 70% humidity.', 'Water regularly to keep the soil moist but not waterlogged. Typically water 1-2 times a week.', 'Apply nitrogen-rich fertilizer every 3-4 weeks.', '(Mustard Greens) Scientific Name: Brassica juncea. Mustard greens are leafy vegetables with a peppery flavor, often used in salads, stir-fries, and soups. They are rich in vitamins and antioxidants.', 'summer/rainy', 0, NULL, NULL, NULL),
(25, 'Oregano', 'assets/oregano.jpg', 'Oregano prefers moderate humidity around 40% to 60%. Too much humidity can lead to mold and mildew.', 'Water 1-2 times a week, allowing the soil to dry between waterings.', 'Use a balanced fertilizer every 4-6 weeks.', '(Oregano) Scientific Name: Origanum vulgare. Oregano is a popular herb in Mediterranean cuisine, known for its robust flavor and aromatic leaves. It is also used for medicinal purposes.', 'summer', 0, NULL, NULL, NULL),
(26, 'Peas', 'assets/peas.png', 'Thrives in humidity levels of 50% to 70%.', 'Water 1-2 inches per week, keeping soil evenly moist.', 'Apply a balanced fertilizer at planting and side-dress with nitrogen as needed.', '(Peas) Scientific Name: Pisum sativum. Peas are a cool-season crop that produces edible pods or seeds. They are often used in soups, salads, and side dishes and are rich in protein and fiber.', 'summer/rainy', 0, NULL, NULL, NULL),
(27, 'Pineapple', 'assets/pineapple.png\r\n', 'Prefers high humidity levels of 70% to 80%.', 'Water once a week, keeping soil moist but not soggy.', 'Use a balanced fertilizer every 6-8 weeks.', '(Pineapple) Scientific Name: Ananas comosus. Pineapple is a tropical fruit known for its sweet, juicy flesh. It grows on a short-stemmed plant and is widely used in desserts, drinks, and savory dishes.', 'summer', 0, NULL, NULL, NULL),
(28, 'Pumpkin', 'assets/pumpkin.jpg\r\n', 'Grows well in humidity levels of 50% to 70%.', 'Water deeply once a week, ensuring consistent moisture.', 'Apply a balanced fertilizer every 4-6 weeks', '(Pumpkin) Scientific Name: Cucurbita pepo. Pumpkins are large, orange fruits commonly used for pies, soups, and decorations. They are rich in vitamins and antioxidants.', 'summer', 0, NULL, NULL, NULL),
(29, 'Radicchio', 'assets/rad.jpg', 'Prefers moderate humidity levels of 50% to 70%.', 'Water 1-2 times a week, keeping soil consistently moist', 'Use a balanced fertilizer every 3-4 weeks.', '(Radicchio) Scientific Name: Cichorium intybus var. foliosum. Radicchio is a leafy vegetable with a bitter taste and vibrant red leaves. It is often used in salads and Italian dishes.', 'summer/rainy', 0, NULL, NULL, NULL),
(30, 'Radish', 'assets/radish.jpg', 'Radishes grow best in moderate humidity, around 60% - 70%.', 'Water regularly 1-2 times a week, keeping soil moist but not waterlogged.', 'Apply a nitrogen-rich fertilizer at planting and once during growth.', '(Radish) Scientific Name: Raphanus sativus. Radishes are root vegetables known for their peppery flavor. They are commonly used in salads and as a garnish.', 'summer/rainy', 0, NULL, NULL, NULL),
(31, 'Salad Greens', 'assets/saladgreens.jpg', 'Salad greens such as arugula and kale prefer cool, moist air with humidity levels of 50% to 70%.', 'Water 1-2 times a week, ensuring soil remains moist but not soggy.', 'Apply a balanced N-P-K fertilizer every 3-4 weeks.', '(Salad Greens) Scientific Name: Lactuca sativa and others. Salad greens include a variety of leafy vegetables like lettuce, arugula, and kale. They are often used raw in salads and are a source of vitamins, minerals, and fiber.', 'summer/rainy', 0, NULL, NULL, NULL),
(32, 'Spinach', 'assets/spinach.jpg', 'Spinach thrives in moderate humidity, around 50% to 60%.', 'Water 1-2 times a week, ensuring consistent moisture in the soil.', 'Apply balanced N-P-K fertilizer every 4-6 weeks.', '(Spinach) Scientific Name: Spinacia oleracea. Spinach is a leafy green vegetable known for its high iron and vitamin content. It can be eaten raw in salads or cooked in a variety of dishes.', 'summer/rainy', 0, NULL, NULL, NULL),
(33, 'Summer Squash', 'assets/summersquash.jpg', 'Summer squash prefers moderate humidity, around 50% to 70%.', 'Water 1-2 times a week, ensuring soil stays moist but not overly saturated.', 'Use a balanced fertilizer every 4-6 weeks.', '(Summer Squash) Scientific Name: Cucurbita pepo. Summer squash includes varieties like zucchini and yellow squash. These vegetables are prized for their tender, edible skins and mild flavor, often used in stir-fries, casseroles, or grilled.', 'summer', 0, NULL, NULL, NULL),
(34, 'Sweet Basil', 'assets/sweetbasil.jpg', 'Sweet basil prefers moderate humidity of around 50% to 60%.', 'Water 1-2 times a week, keeping the soil moderately moist.', 'Apply a balanced fertilizer every 3-4 weeks.', '(Sweet Basil) Scientific Name: Ocimum basilicum. Sweet basil is an aromatic herb used in cooking, particularly in Mediterranean and Italian dishes. It has fragrant, soft leaves and is used fresh or dried.', 'summer', 0, NULL, NULL, NULL),
(35, 'Sweet Potato', 'assets/sweetpotato.jpg', 'Sweet potatoes prefer warm, humid conditions, ideally 60% to 70%.', 'Water 1-2 times a week, allowing the soil to dry slightly between waterings', 'Use a balanced fertilizer every 4-6 weeks.', '(Sweet Potato) Scientific Name: Ipomoea batatas. Sweet potato is a root vegetable with a sweet flavor, rich in vitamins and fiber. It is commonly baked, mashed, or used in pies and casseroles.', 'summer', 0, NULL, NULL, NULL),
(36, 'Taro', 'assets/taro.jpg', 'Taro grows best in high humidity, around 60 to 80%.', 'Water regularly, 2-3 times a week, keeping soil consistently moist.', 'Use a balanced fertilizer every 4-6 weeks.', '(Taro) Scientific Name: Colocasia esculenta. Taro is a root vegetable grown primarily for its edible corms, which have a starchy texture. It is commonly used in soups, stews, and desserts in tropical regions.', 'summer', 0, NULL, NULL, NULL),
(37, 'Tomato', 'assets/tomato.jpg\r\n', 'Tomatoes thrive in moderate humidity of 50% to 70%.', 'Water regularly, 1-2 times a week, allowing the soil to dry slightly between waterings.', 'Apply a balanced fertilizer every 3-4 weeks.', '(Tomato) Scientific Name: Solanum lycopersicum. Tomatoes are popular fruits that are used in a variety of culinary dishes. They are rich in vitamins, especially vitamin C, and are commonly eaten fresh, in sauces, or as toppings.', 'summer', 0, NULL, NULL, NULL),
(38, 'Zucchini\r\n', 'assets/zucchini.jpg', 'Zucchini grows best in moderate humidity around 50% to 70%.', 'Water deeply 1-2 times a week, keeping soil evenly moist.', 'Use a balanced fertilizer or compost every 4-6 weeks.', '(Zucchini) Scientific Name: Cucurbita pepo. Zucchini, a type of summer squash, is a versatile vegetable with a mild flavor. It can be eaten raw, grilled, or used in baking and stir-fries.', 'summer', 0, NULL, NULL, NULL),
(39, 'Bell Pepper', 'assets/bellpepper.jpg', 'Prefers moderate humidity levels of 50% to 60%.', 'Water 1-2 times a week, ensuring soil stays consistently moist.', 'Apply a balanced fertilizer every 4-6 weeks.', '(Bell Pepper) Scientific Name: Capsicum annuum. Bell peppers are sweet peppers that come in various colors such as red, yellow, and green. They are rich in vitamins A and C and are commonly used in salads, stir-fries, and as toppings.', 'summer', 0, NULL, NULL, NULL),
(40, 'Chili', 'assets/chili.jpg', 'Grows well in moderate humidity levels of 50% to 60%.', 'Water 1-2 times a week, ensuring soil is kept moist but not soggy.', 'Use a balanced fertilizer every 3-4 weeks.', '(Chili) Scientific Name: Capsicum spp.. Chili peppers are hot, spicy fruits commonly used in cooking to add heat to dishes. They are rich in capsaicin, which gives them their spicy flavor, and are often used fresh or dried in a variety of cuisines.', 'summer', 0, NULL, NULL, NULL),
(41, 'Chives', 'assets/chives.jpg', 'Grows well in moderate humidity levels of 50% to 60%.', 'Water 1-2 times a week, keeping the soil slightly moist.', 'Apply a balanced fertilizer every 3-4 weeks.', '(Chives) Scientific Name: Allium schoenoprasum. Chives are a type of herb with a mild onion flavor. They are often used as a garnish or in salads, soups, and other dishes.', 'summer', 0, NULL, NULL, NULL),
(42, 'Eggplant', 'assets/egg-plant.png', 'Prefers humidity levels of 60% to 70%.', 'Water 1-2 times a week, ensuring soil remains evenly moist.', 'Use a balanced fertilizer every 4-6 weeks.', '(Eggplant) Scientific Name: Solanum melongena. Eggplant, also known as aubergine, is a warm-season vegetable that grows in a variety of colors, primarily purple. It is commonly used in cooking, especially in Mediterranean and Asian dishes.', 'summer', 0, NULL, NULL, NULL),
(43, 'Garlic', 'assets/garlic.png', 'Grows best in moderate humidity levels of 50% to 60%.', 'Water 1-2 times a week, keeping the soil moist but not waterlogged.', 'Apply a balanced fertilizer every 4-6 weeks.', '(Garlic) Scientific Name: Allium sativum. Garlic is a popular herb used for its strong flavor and medicinal properties. It grows as bulbs, with each clove producing a new plant.', 'summer', 0, NULL, NULL, NULL),
(44, 'Ginger', 'assets/ginger.png', 'Prefers high humidity levels of 60% to 80%.', 'Water regularly 2-3 times a week, keeping soil moist.', 'Use a balanced fertilizer every 4-6 weeks.', '(Ginger) Scientific Name: Zingiber officinale. Ginger is a tropical plant grown for its rhizomes, which are used in cooking and for medicinal purposes. It thrives in warm, humid conditions.', 'summer', 0, NULL, NULL, NULL),
(45, 'Green Beans', 'assets/greenbeans.jpg', 'Green beans grow best in moderate humidity, around 50-70%.', 'Water regularly to maintain moist but well-drained soil. Typically, water once a week.', 'Apply a balanced fertilizer every 4-6 weeks.', '(Green Beans) Scientific Name: Phaseolus vulgaris. Green beans are a popular legume with tender, edible pods. They are rich in fiber and vitamins and can be eaten fresh, steamed, or stir-fried.', 'summer', 0, NULL, NULL, NULL),
(46, 'Moringa', 'assets/moringa.jpg', 'Moringa prefers a dry to moderate humidity environment, around 50-60%. It can tolerate low humidity ', 'Water 1-2 times a week, ensuring soil is moist but not waterlogged.', 'Moringa does not require much fertilizer but can benefit from occasional feeding with a low-nitrogen', '(Moringa) Scientific Name: Moringa oleifera. Moringa, also known as the drumstick tree, is a fast-growing tree with edible leaves, pods, and flowers. It is known for its high nutritional content, particularly in vitamins and antioxidants', 'summer', 0, NULL, NULL, NULL),
(47, 'Okra', 'assets/okra.jpg', 'Okra thrives in a warm, humid environment with humidity levels between 60-70%.', 'Water 1-2 times a week, keeping soil evenly moist.', 'Apply a balanced fertilizer every 4-6 weeks.', '(Okra) Scientific Name: Abelmoschus esculentus. Okra is a warm-season vegetable grown for its edible green pods, which are often used in soups, stews, and gumbo. It is rich in fiber and antioxidants.', 'summer', 0, NULL, NULL, NULL),
(48, 'Purslane', 'assets/purslane.jpg', 'Purslane thrives in a dry to moderate humidity environment, with humidity levels around 40-60%.', 'Water 1-2 times a week, allowing soil to dry between waterings.', 'Apply a balanced fertilizer every 4-6 weeks.', '(Purslane) Scientific Name: Portulaca oleracea. Purslane is a succulent plant that grows in hot, dry conditions. Its leaves are rich in omega-3 fatty acids and are often used in salads or as a garnish.', 'summer', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `PostID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Content` text NOT NULL,
  `ImageURL` varchar(255) DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`PostID`, `UserID`, `Content`, `ImageURL`, `CreatedAt`) VALUES
(4, 12, 'Grabe na yung init ngayon sira na palayan namin ', 'uploads/june17_feature_wallander_photo.jpg', '2025-01-07 12:37:00'),
(6, 13, 'Ingat sa Bagyong Korikong, lugi na naman kami neto', 'uploads/download (2).jpg', '2025-01-07 12:38:58'),
(7, 1, 'asdasdas', 'uploads/june17_feature_wallander_photo.jpg', '2025-01-07 18:26:19');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `id` int(11) NOT NULL,
  `device_id` int(11) NOT NULL,
  `schedule_type` enum('daily','weekly','monthly') NOT NULL,
  `frequency` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `next_execution` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` int(11) NOT NULL,
  `device_id` int(11) NOT NULL,
  `schedule_type` enum('daily','weekly','monthly') NOT NULL,
  `execution_count` int(11) NOT NULL COMMENT 'Number of times to execute the task',
  `interval_ms` int(11) NOT NULL COMMENT 'Interval in milliseconds between executions',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `next_execution` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `device_id`, `schedule_type`, `execution_count`, `interval_ms`, `created_at`, `updated_at`, `next_execution`) VALUES
(62, 26, 'daily', 1, 86400000, '2025-01-08 07:06:14', '2025-01-08 07:06:18', '2025-01-09 07:06:14');

-- --------------------------------------------------------

--
-- Table structure for table `sensordata`
--

CREATE TABLE `sensordata` (
  `id` int(11) NOT NULL,
  `temperature` float NOT NULL,
  `humidity` float NOT NULL,
  `soil_moisture` int(11) NOT NULL,
  `pir_state` tinyint(1) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `device_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sensordata`
--

INSERT INTO `sensordata` (`id`, `temperature`, `humidity`, `soil_moisture`, `pir_state`, `timestamp`, `device_name`) VALUES
(6989, 29.8, 70, 0, 1, '2024-11-26 20:59:32', 'potato'),
(6991, 29.8, 70, 8, 0, '2024-11-26 21:01:03', 'device1'),
(6992, 29.8, 70, 0, 1, '2024-11-26 21:01:09', 'potato'),
(6993, 29.8, 70, 63, 1, '2024-11-26 21:01:15', 'potato'),
(6994, 29.8, 70, 48, 1, '2024-11-26 21:01:21', 'potato'),
(6995, 29.8, 70, 0, 1, '2024-11-26 21:01:27', 'potato'),
(6996, 29.9, 70, 0, 1, '2024-11-26 21:12:39', 'potato'),
(6997, 29.8, 70, 0, 1, '2024-11-26 21:14:28', 'potato'),
(6998, 29.7, 70, 0, 1, '2024-11-26 21:20:00', 'potato'),
(6999, 29.8, 70, 0, 1, '2024-11-26 21:25:39', 'potato'),
(7000, 29.7, 70, 0, 1, '2024-11-26 21:26:33', 'potato'),
(7001, 29.8, 70, 0, 1, '2024-11-26 21:27:46', 'potato'),
(7002, 29.5, 71, 0, 1, '2024-11-26 21:54:31', 'potato'),
(7003, 29.6, 71, 0, 1, '2024-11-26 21:54:55', 'potato'),
(7004, 29.6, 71, 53, 1, '2024-11-26 21:55:01', 'potato'),
(7005, 29.6, 71, 0, 1, '2024-11-26 21:55:08', 'potato'),
(7006, 29.6, 71, 50, 1, '2024-11-26 21:55:20', 'potato'),
(7007, 29.6, 71, 2, 1, '2024-11-26 21:55:26', 'potato'),
(7008, 29.6, 71, 4, 1, '2024-11-26 21:55:32', 'potato'),
(7009, 29.6, 71, 6, 1, '2024-11-26 21:55:39', 'potato'),
(7010, 29.6, 71, 4, 1, '2024-11-26 21:55:45', 'potato'),
(7011, 29.6, 71, 3, 1, '2024-11-26 21:56:03', 'potato'),
(7012, 29.6, 71, 0, 1, '2024-11-26 21:56:09', 'potato'),
(7013, 29.5, 71, 0, 1, '2024-11-26 21:56:15', 'potato'),
(7014, 29.5, 71, 3, 1, '2024-11-26 21:56:22', 'potato'),
(7015, 29.5, 71, 0, 1, '2024-11-26 21:56:28', 'potato'),
(7016, 29.5, 71, 2, 1, '2024-11-26 21:56:40', 'potato'),
(7017, 29.5, 71, 4, 1, '2024-11-26 21:56:46', 'potato'),
(7018, 29.5, 71, 2, 1, '2024-11-26 21:56:53', 'potato'),
(7019, 29.5, 71, 3, 1, '2024-11-26 21:56:59', 'potato'),
(7020, 29.5, 71, 0, 1, '2024-11-26 21:57:05', 'potato'),
(7021, 29.5, 71, 4, 1, '2024-11-26 21:57:11', 'potato'),
(7022, 29.5, 71, 5, 1, '2024-11-26 21:57:18', 'potato'),
(7023, 29.4, 71, 3, 1, '2024-11-26 21:57:24', 'potato'),
(7024, 29.4, 71, 5, 1, '2024-11-26 21:57:42', 'potato'),
(7025, 29.4, 71, 2, 1, '2024-11-26 21:57:49', 'potato'),
(7026, 29.4, 72, 3, 1, '2024-11-26 21:57:55', 'potato'),
(7027, 29.4, 72, 2, 1, '2024-11-26 21:58:07', 'potato'),
(7028, 29.4, 72, 0, 1, '2024-11-26 21:58:14', 'potato'),
(7029, 29.4, 72, 8, 1, '2024-11-26 21:58:20', 'potato'),
(7030, 29.4, 72, 0, 1, '2024-11-26 21:58:26', 'potato'),
(7031, 29.4, 72, 2, 1, '2024-11-26 21:58:33', 'potato'),
(7032, 29.4, 72, 8, 1, '2024-11-26 21:58:39', 'potato'),
(7033, 29.4, 72, 2, 1, '2024-11-26 21:58:46', 'potato'),
(7034, 29.4, 72, 0, 1, '2024-11-26 21:58:58', 'potato'),
(7035, 29.4, 72, 7, 1, '2024-11-26 21:59:04', 'potato'),
(7036, 29.4, 72, 0, 1, '2024-11-26 21:59:10', 'potato'),
(7037, 29.4, 72, 2, 1, '2024-11-26 21:59:16', 'potato'),
(7038, 29.4, 72, 3, 1, '2024-11-26 21:59:23', 'potato'),
(7039, 29.4, 72, 0, 1, '2024-11-26 21:59:30', 'potato'),
(7040, 29.4, 72, 5, 1, '2024-11-26 21:59:36', 'potato'),
(7041, 29.4, 72, 2, 1, '2024-11-26 21:59:42', 'potato'),
(7042, 29.4, 72, 0, 1, '2024-11-26 21:59:48', 'potato'),
(7043, 29.4, 72, 2, 1, '2024-11-26 21:59:54', 'potato'),
(7044, 29.4, 72, 0, 1, '2024-11-26 22:00:01', 'potato'),
(7045, 29.4, 72, 2, 1, '2024-11-26 22:00:07', 'potato'),
(7046, 29.4, 72, 8, 1, '2024-11-26 22:00:20', 'potato'),
(7047, 29.4, 72, 2, 1, '2024-11-26 22:00:26', 'potato'),
(7048, 29.4, 72, 0, 1, '2024-11-26 22:00:32', 'potato'),
(7049, 29.4, 72, 2, 1, '2024-11-26 22:00:38', 'potato'),
(7050, 29.4, 72, 3, 1, '2024-11-26 22:00:45', 'potato'),
(7051, 29.4, 72, 2, 1, '2024-11-26 22:00:52', 'potato'),
(7052, 29.4, 72, 1, 1, '2024-11-26 22:01:10', 'potato'),
(7053, 29.4, 72, 0, 1, '2024-11-26 22:01:16', 'potato'),
(7054, 29.4, 72, 6, 1, '2024-11-26 22:01:22', 'potato'),
(7055, 29.4, 72, 21, 1, '2024-11-26 22:01:28', 'potato'),
(7056, 29.4, 72, 29, 1, '2024-11-26 22:01:35', 'potato'),
(7057, 29.4, 72, 28, 1, '2024-11-26 22:01:42', 'potato'),
(7058, 29.4, 72, 26, 1, '2024-11-26 22:01:48', 'potato'),
(7059, 29.4, 72, 25, 1, '2024-11-26 22:01:54', 'potato'),
(7060, 29.4, 72, 37, 1, '2024-11-26 22:02:00', 'potato'),
(7061, 29.4, 72, 34, 1, '2024-11-26 22:02:06', 'potato'),
(7062, 29.4, 72, 35, 1, '2024-11-26 22:02:12', 'potato'),
(7063, 29.4, 72, 34, 1, '2024-11-26 22:02:22', 'potato'),
(7064, 29.4, 72, 38, 1, '2024-11-26 22:02:28', 'potato'),
(7065, 29.4, 72, 37, 1, '2024-11-26 22:02:35', 'potato'),
(7066, 29.3, 72, 45, 1, '2024-11-26 22:02:41', 'potato'),
(7067, 29.3, 72, 38, 1, '2024-11-26 22:02:47', 'potato'),
(7068, 29.3, 72, 37, 1, '2024-11-26 22:02:53', 'potato'),
(7069, 29.3, 72, 43, 1, '2024-11-26 22:02:59', 'potato'),
(7070, 29.3, 72, 42, 1, '2024-11-26 22:03:06', 'potato'),
(7071, 29.3, 72, 41, 1, '2024-11-26 22:03:18', 'potato'),
(7072, 29.3, 72, 42, 1, '2024-11-26 22:03:24', 'potato'),
(7073, 29.3, 72, 43, 1, '2024-11-26 22:03:31', 'potato'),
(7074, 29.3, 72, 37, 1, '2024-11-26 22:03:37', 'potato'),
(7075, 29.3, 72, 43, 1, '2024-11-26 22:03:43', 'potato'),
(7076, 29.3, 72, 40, 1, '2024-11-26 22:03:50', 'potato'),
(7077, 29.3, 72, 43, 1, '2024-11-26 22:03:56', 'potato'),
(7078, 29.3, 72, 41, 1, '2024-11-26 22:04:03', 'potato'),
(7079, 29.3, 72, 45, 1, '2024-11-26 22:04:09', 'potato'),
(7080, 29.3, 72, 43, 1, '2024-11-26 22:04:15', 'potato'),
(7081, 29.3, 72, 40, 1, '2024-11-26 22:04:21', 'potato'),
(7082, 29.3, 72, 42, 1, '2024-11-26 22:04:27', 'potato'),
(7083, 29.3, 72, 0, 1, '2024-11-26 22:04:34', 'potato'),
(7084, 29.3, 72, 6, 1, '2024-11-26 22:04:40', 'potato'),
(7085, 29.3, 72, 39, 1, '2024-11-26 22:04:59', 'potato'),
(7086, 29.3, 72, 72, 1, '2024-11-26 22:05:05', 'potato'),
(7087, 29.3, 72, 0, 1, '2024-11-26 22:05:12', 'potato'),
(7088, 29.3, 72, 5, 1, '2024-11-26 22:05:18', 'potato'),
(7089, 29.3, 72, 7, 1, '2024-11-26 22:05:24', 'potato'),
(7090, 29.3, 72, 6, 1, '2024-11-26 22:05:31', 'potato'),
(7091, 29.3, 72, 5, 1, '2024-11-26 22:05:37', 'potato'),
(7092, 29.3, 72, 0, 1, '2024-11-26 22:05:43', 'potato'),
(7093, 29.3, 72, 63, 1, '2024-11-26 22:05:55', 'potato'),
(7094, 29.3, 72, 54, 1, '2024-11-26 22:06:02', 'potato'),
(7095, 29.3, 72, 3, 1, '2024-11-26 22:06:08', 'potato'),
(7096, 29.4, 72, 2, 1, '2024-11-26 22:06:14', 'potato'),
(7097, 29.4, 72, 1, 1, '2024-11-26 22:06:26', 'potato'),
(7098, 29.4, 72, 0, 1, '2024-11-26 22:06:38', 'potato'),
(7099, 29.4, 72, 1, 1, '2024-11-26 22:06:50', 'potato'),
(7100, 29.4, 72, 2, 1, '2024-11-26 22:06:57', 'potato'),
(7101, 29.5, 72, 0, 1, '2024-11-26 22:07:03', 'potato'),
(7102, 29.5, 72, 1, 1, '2024-11-26 22:07:22', 'potato'),
(7103, 29.5, 72, 22, 1, '2024-11-26 22:07:40', 'potato'),
(7104, 29.6, 72, 46, 1, '2024-11-26 22:07:47', 'potato'),
(7105, 29.6, 71, 48, 1, '2024-11-26 22:08:00', 'potato'),
(7106, 29.6, 71, 63, 1, '2024-11-26 22:08:06', 'potato'),
(7107, 29.6, 71, 65, 1, '2024-11-26 22:08:13', 'potato'),
(7108, 29.6, 71, 67, 1, '2024-11-26 22:08:19', 'potato'),
(7109, 29.6, 71, 64, 1, '2024-11-26 22:08:26', 'potato'),
(7110, 29.6, 71, 68, 1, '2024-11-26 22:08:32', 'potato'),
(7111, 29.6, 71, 65, 1, '2024-11-26 22:08:38', 'potato'),
(7112, 29.6, 71, 67, 1, '2024-11-26 22:08:45', 'potato'),
(7113, 29.7, 71, 67, 1, '2024-11-26 22:08:51', 'potato'),
(7114, 29.7, 71, 65, 1, '2024-11-26 22:08:57', 'potato'),
(7115, 29.7, 71, 67, 1, '2024-11-26 22:09:09', 'potato'),
(7116, 29.7, 71, 66, 1, '2024-11-26 22:09:16', 'potato'),
(7117, 29.7, 71, 62, 1, '2024-11-26 22:09:22', 'potato'),
(7118, 29.7, 71, 65, 1, '2024-11-26 22:09:28', 'potato'),
(7119, 29.7, 71, 66, 1, '2024-11-26 22:09:35', 'potato'),
(7120, 29.7, 71, 65, 1, '2024-11-26 22:09:47', 'potato'),
(7121, 29.7, 71, 62, 1, '2024-11-26 22:09:59', 'potato'),
(7122, 29.7, 71, 61, 1, '2024-11-26 22:10:05', 'potato'),
(7123, 29.7, 71, 63, 1, '2024-11-26 22:10:11', 'potato'),
(7124, 29.7, 71, 61, 1, '2024-11-26 22:10:24', 'potato'),
(7125, 29.7, 71, 68, 1, '2024-11-26 22:10:30', 'potato'),
(7126, 29.8, 71, 70, 1, '2024-11-26 22:10:37', 'potato'),
(7127, 29.8, 70, 69, 1, '2024-11-26 22:10:43', 'potato'),
(7128, 29.8, 70, 70, 1, '2024-11-26 22:10:49', 'potato'),
(7129, 29.8, 70, 69, 1, '2024-11-26 22:11:08', 'potato'),
(7130, 29.8, 70, 68, 1, '2024-11-26 22:11:20', 'potato'),
(7131, 29.8, 70, 70, 1, '2024-11-26 22:11:26', 'potato'),
(7132, 29.8, 70, 67, 1, '2024-11-26 22:11:33', 'potato'),
(7133, 29.7, 70, 69, 1, '2024-11-26 22:11:39', 'potato'),
(7134, 29.7, 70, 68, 1, '2024-11-26 22:11:52', 'potato'),
(7135, 29.7, 70, 69, 1, '2024-11-26 22:11:58', 'potato'),
(7136, 29.7, 70, 68, 1, '2024-11-26 22:12:34', 'potato'),
(7137, 29.6, 70, 69, 1, '2024-11-26 22:12:41', 'potato'),
(7138, 29.6, 70, 67, 1, '2024-11-26 22:12:53', 'potato'),
(7139, 29.6, 70, 68, 1, '2024-11-26 22:12:59', 'potato'),
(7140, 29.6, 70, 67, 1, '2024-11-26 22:13:06', 'potato'),
(7141, 29.6, 70, 68, 1, '2024-11-26 22:13:12', 'potato'),
(7142, 29.6, 71, 67, 1, '2024-11-26 22:13:24', 'potato'),
(7143, 29.6, 71, 68, 1, '2024-11-26 22:13:37', 'potato'),
(7144, 29.6, 71, 70, 1, '2024-11-26 22:13:43', 'potato'),
(7145, 29.5, 71, 69, 1, '2024-11-26 22:13:50', 'potato'),
(7146, 29.5, 71, 72, 1, '2024-11-26 22:14:08', 'potato'),
(7147, 29.5, 71, 71, 1, '2024-11-26 22:14:14', 'potato'),
(7148, 29.5, 71, 69, 1, '2024-11-26 22:14:27', 'potato'),
(7149, 29.5, 71, 70, 1, '2024-11-26 22:14:39', 'potato'),
(7150, 29.5, 71, 68, 1, '2024-11-26 22:14:57', 'potato'),
(7151, 29.5, 71, 67, 1, '2024-11-26 22:15:03', 'potato'),
(7152, 29.5, 71, 70, 1, '2024-11-26 22:15:09', 'potato'),
(7153, 29.5, 71, 68, 1, '2024-11-26 22:15:16', 'potato'),
(7154, 29.5, 71, 69, 1, '2024-11-26 22:15:22', 'potato'),
(7155, 29.5, 71, 71, 1, '2024-11-26 22:15:35', 'potato'),
(7156, 29.4, 71, 74, 1, '2024-11-26 22:15:47', 'potato'),
(7157, 29.4, 72, 71, 1, '2024-11-26 22:15:54', 'potato'),
(7158, 29.4, 72, 68, 1, '2024-11-26 22:16:00', 'potato'),
(7159, 29.4, 71, 68, 1, '2024-11-26 22:16:12', 'potato'),
(7160, 29.4, 71, 60, 1, '2024-11-26 22:16:18', 'potato'),
(7161, 29.4, 71, 63, 1, '2024-11-26 22:16:24', 'potato'),
(7162, 29.4, 72, 61, 1, '2024-11-26 22:16:31', 'potato'),
(7163, 29.4, 72, 45, 1, '2024-11-26 22:16:37', 'potato'),
(7164, 29.4, 72, 0, 1, '2024-11-26 22:16:43', 'potato'),
(7165, 29.4, 72, 1, 1, '2024-11-26 22:16:49', 'potato'),
(7166, 29.4, 72, 0, 1, '2024-11-26 22:16:56', 'potato'),
(7167, 29.4, 72, 2, 1, '2024-11-26 22:17:56', 'potato'),
(7168, 29.4, 72, 0, 1, '2024-11-26 22:18:03', 'potato'),
(7169, 29.4, 72, 1, 1, '2024-11-26 22:18:21', 'potato'),
(7170, 29.4, 72, 0, 1, '2024-11-26 22:18:27', 'potato'),
(7171, 29.4, 72, 2, 1, '2024-11-26 22:18:52', 'potato'),
(7172, 29.4, 72, 0, 1, '2024-11-26 22:18:58', 'potato'),
(7173, 29.5, 72, 0, 1, '2024-11-26 22:19:04', 'potato'),
(7174, 29.5, 71, 0, 1, '2024-11-26 22:20:11', 'potato'),
(7175, 29.5, 71, 1, 1, '2024-11-26 22:20:17', 'potato'),
(7176, 29.5, 71, 0, 1, '2024-11-26 22:20:23', 'potato'),
(7177, 29.5, 72, 0, 1, '2024-11-26 22:20:30', 'potato'),
(7178, 29.5, 71, 0, 1, '2024-11-26 22:21:00', 'potato'),
(7179, 29.5, 72, 0, 1, '2024-11-26 22:21:30', 'potato'),
(7180, 29.5, 71, 0, 1, '2024-11-26 22:22:31', 'potato'),
(7181, 29.5, 72, 0, 1, '2024-11-26 22:24:50', 'potato'),
(7182, 29.4, 72, 0, 1, '2024-11-26 22:25:44', 'potato'),
(7183, 29.5, 72, 0, 1, '2024-11-26 22:36:07', 'potato'),
(7184, 29.4, 72, 0, 1, '2024-11-26 22:37:26', 'potato'),
(7185, 29.5, 72, 0, 1, '2024-11-26 22:37:56', 'potato'),
(7186, 29.6, 72, 0, 1, '2024-11-26 22:39:09', 'potato'),
(7187, 29.6, 71, 0, 1, '2024-11-26 22:39:21', 'potato'),
(7188, 29.5, 71, 0, 1, '2024-11-26 22:42:05', 'potato'),
(7189, 29.6, 71, 0, 1, '2024-11-26 22:42:23', 'potato'),
(7190, 29.5, 71, 0, 1, '2024-11-26 22:49:08', 'potato'),
(7191, 29.5, 72, 0, 1, '2024-11-26 22:50:03', 'potato'),
(7192, 29.6, 72, 0, 1, '2024-11-26 22:50:15', 'potato'),
(7193, 29.6, 71, 0, 1, '2024-11-26 22:50:27', 'potato'),
(7194, 29.6, 72, 0, 1, '2024-11-26 22:51:16', 'potato'),
(7195, 29.7, 72, 0, 1, '2024-11-26 22:51:52', 'potato'),
(7196, 29.7, 71, 0, 1, '2024-11-26 22:52:17', 'potato'),
(7197, 29.8, 71, 0, 1, '2024-11-26 22:55:25', 'potato'),
(7198, 29.7, 71, 0, 1, '2024-11-26 22:55:31', 'potato'),
(7199, 29.8, 71, 0, 1, '2024-11-26 22:55:43', 'potato'),
(7200, 29.7, 71, 0, 1, '2024-11-26 22:56:38', 'potato'),
(7201, 29.6, 71, 0, 1, '2024-11-26 23:00:46', 'potato'),
(7202, 29.6, 72, 0, 1, '2024-11-26 23:01:59', 'potato'),
(7203, 29.6, 71, 0, 1, '2024-11-26 23:03:00', 'potato'),
(7204, 29.6, 72, 0, 1, '2024-11-26 23:04:30', 'potato'),
(7205, 29.5, 72, 0, 1, '2024-11-26 23:08:39', 'potato'),
(7206, 29.6, 72, 0, 1, '2024-11-26 23:12:04', 'potato'),
(7207, 29.7, 72, 0, 1, '2024-11-26 23:13:11', 'potato'),
(7208, 29.9, 71, 0, 1, '2024-11-26 23:32:36', 'potato'),
(7209, 29.9, 71, 39, 1, '2024-11-26 23:33:13', 'potato'),
(7210, 29.9, 71, 43, 1, '2024-11-26 23:33:19', 'potato'),
(7211, 29.9, 72, 37, 1, '2024-11-26 23:33:25', 'potato'),
(7212, 29.9, 72, 41, 1, '2024-11-26 23:33:31', 'potato'),
(7213, 29.8, 72, 40, 1, '2024-11-26 23:33:37', 'potato'),
(7214, 29.8, 72, 15, 1, '2024-11-26 23:33:47', 'potato'),
(7215, 29.8, 72, 14, 1, '2024-11-26 23:34:12', 'potato'),
(7216, 29.8, 72, 13, 1, '2024-11-26 23:34:19', 'potato'),
(7217, 29.8, 72, 12, 1, '2024-11-26 23:34:31', 'potato'),
(7218, 29.8, 72, 13, 1, '2024-11-26 23:35:21', 'potato'),
(7219, 29.8, 72, 12, 1, '2024-11-26 23:35:27', 'potato'),
(7220, 29.8, 73, 12, 1, '2024-11-26 23:36:10', 'potato'),
(7221, 29.7, 73, 11, 1, '2024-11-26 23:36:22', 'potato'),
(7222, 29.7, 73, 10, 1, '2024-11-26 23:37:05', 'potato'),
(7223, 29.7, 73, 9, 1, '2024-11-26 23:37:36', 'potato'),
(7224, 29.7, 73, 8, 1, '2024-11-26 23:38:42', 'potato'),
(7225, 29.7, 73, 9, 1, '2024-11-26 23:39:13', 'potato'),
(7226, 29.7, 73, 8, 1, '2024-11-26 23:39:19', 'potato'),
(7227, 29.7, 73, 7, 1, '2024-11-26 23:40:01', 'potato'),
(7228, 29.7, 73, 8, 1, '2024-11-26 23:40:07', 'potato'),
(7229, 29.7, 73, 7, 1, '2024-11-26 23:40:19', 'potato'),
(7230, 29.7, 73, 8, 1, '2024-11-26 23:40:43', 'potato'),
(7231, 29.7, 73, 7, 1, '2024-11-26 23:40:50', 'potato'),
(7232, 29.7, 73, 6, 1, '2024-11-26 23:42:02', 'potato'),
(7233, 29.7, 73, 7, 1, '2024-11-26 23:42:20', 'potato'),
(7234, 29.7, 73, 6, 1, '2024-11-26 23:42:38', 'potato'),
(7235, 29.7, 73, 5, 1, '2024-11-26 23:45:04', 'potato'),
(7236, 29.8, 73, 5, 1, '2024-11-26 23:45:10', 'potato'),
(7237, 29.8, 73, 4, 1, '2024-11-26 23:47:17', 'potato'),
(7238, 28.8, 68, 1, 1, '2024-11-27 01:49:21', 'potato'),
(7239, 28.8, 68, 0, 1, '2024-11-27 01:49:28', 'potato'),
(7240, 29.1, 67, 0, 1, '2024-11-27 02:24:03', 'potato'),
(7241, 29.1, 67, 42, 1, '2024-11-27 02:25:40', 'potato'),
(7242, 29.1, 67, 0, 1, '2024-11-27 02:25:49', 'potato'),
(7243, 29.1, 68, 0, 1, '2024-11-27 02:26:09', 'potato'),
(7244, 29.1, 68, 31, 1, '2024-11-27 02:26:19', 'potato'),
(7245, 29.1, 68, 28, 1, '2024-11-27 02:26:25', 'potato'),
(7246, 29.1, 68, 34, 1, '2024-11-27 02:26:31', 'potato'),
(7247, 29.1, 68, 33, 1, '2024-11-27 02:26:43', 'potato'),
(7248, 29.1, 68, 32, 1, '2024-11-27 02:26:52', 'potato'),
(7249, 29.1, 68, 31, 1, '2024-11-27 02:27:05', 'potato'),
(7250, 29.1, 68, 0, 1, '2024-11-27 02:27:11', 'potato'),
(7251, 29.2, 68, 0, 1, '2024-11-27 02:28:53', 'potato'),
(7252, 29.2, 67, 0, 1, '2024-11-27 02:32:10', 'potato'),
(7253, 29.2, 66, 0, 1, '2024-11-27 02:33:40', 'potato'),
(7254, 29.2, 65, 0, 1, '2024-11-27 02:34:34', 'potato'),
(7255, 29.2, 64, 0, 1, '2024-11-27 02:35:38', 'potato'),
(7256, 29.2, 65, 0, 1, '2024-11-27 02:37:30', 'potato'),
(7257, 29.3, 65, 0, 1, '2024-11-27 02:38:51', 'potato'),
(7258, 29.3, 65, 8, 1, '2024-11-27 02:40:37', 'potato'),
(7259, 29.3, 65, 37, 1, '2024-11-27 02:40:43', 'potato'),
(7260, 29.3, 65, 6, 1, '2024-11-27 02:40:50', 'potato'),
(7261, 29.3, 65, 0, 1, '2024-11-27 02:41:03', 'potato'),
(7262, 29.3, 66, 0, 1, '2024-11-27 02:41:10', 'potato'),
(7263, 29.4, 66, 0, 1, '2024-11-27 02:46:07', 'potato'),
(7264, 29.4, 67, 0, 1, '2024-11-27 02:46:14', 'potato'),
(7265, 29.5, 67, 0, 1, '2024-11-27 02:52:02', 'potato'),
(7266, 29.5, 66, 0, 1, '2024-11-27 02:55:02', 'potato'),
(7267, 29.6, 66, 0, 1, '2024-11-27 02:56:26', 'potato'),
(7268, 29.6, 67, 0, 1, '2024-11-27 02:56:35', 'potato'),
(7269, 29.6, 66, 0, 1, '2024-11-27 02:58:01', 'potato'),
(7270, 29.6, 65, 0, 1, '2024-11-27 03:02:09', 'potato'),
(7271, 29.6, 65, 41, 1, '2024-11-27 03:03:21', 'potato'),
(7272, 29.6, 65, 0, 1, '2024-11-27 03:03:27', 'potato'),
(7273, 29.7, 65, 0, 1, '2024-11-27 03:05:15', 'potato'),
(7274, 29.7, 66, 0, 1, '2024-11-27 03:06:31', 'potato'),
(7275, 29.7, 65, 0, 1, '2024-11-27 03:07:24', 'potato'),
(7276, 29.8, 64, 0, 1, '2024-11-27 03:10:06', 'potato'),
(7277, 29.8, 64, 32, 1, '2024-11-27 03:10:20', 'potato'),
(7278, 29.8, 64, 0, 1, '2024-11-27 03:10:27', 'potato'),
(7279, 29.8, 65, 0, 1, '2024-11-27 03:11:05', 'potato'),
(7280, 29.8, 66, 0, 1, '2024-11-27 03:11:24', 'potato'),
(7281, 29.8, 67, 0, 1, '2024-11-27 03:11:42', 'potato'),
(7282, 29.9, 67, 0, 1, '2024-11-27 03:12:37', 'potato'),
(7283, 30, 67, 0, 1, '2024-11-27 03:14:06', 'potato'),
(7284, 30, 66, 0, 1, '2024-11-27 03:14:45', 'potato'),
(7285, 30.1, 66, 0, 1, '2024-11-27 03:15:27', 'potato'),
(7286, 30.1, 65, 0, 1, '2024-11-27 03:16:39', 'potato'),
(7287, 30.2, 65, 0, 1, '2024-11-27 03:17:06', 'potato'),
(7288, 29, 62, 17, 1, '2024-11-27 03:21:31', 'potato'),
(7289, 28.9, 62, 17, 1, '2024-11-27 03:21:37', 'potato'),
(7290, 28.8, 62, 17, 1, '2024-11-27 03:21:43', 'potato'),
(7291, 28.6, 62, 17, 1, '2024-11-27 03:21:50', 'potato'),
(7292, 28.5, 62, 17, 1, '2024-11-27 03:22:03', 'potato'),
(7293, 28.4, 62, 17, 1, '2024-11-27 03:22:09', 'potato'),
(7294, 28.3, 63, 17, 1, '2024-11-27 03:22:24', 'potato'),
(7295, 28.2, 63, 15, 1, '2024-11-27 03:23:20', 'potato'),
(7296, 28.1, 63, 14, 1, '2024-11-27 03:23:38', 'potato'),
(7297, 27.6, 64, 22, 1, '2024-11-27 03:25:00', 'potato'),
(7298, 27.5, 64, 23, 1, '2024-11-27 03:25:17', 'potato'),
(7299, 27.4, 64, 23, 1, '2024-11-27 03:25:25', 'potato'),
(7300, 27.3, 64, 21, 1, '2024-11-27 03:25:34', 'potato'),
(7301, 27.2, 64, 22, 1, '2024-11-27 03:25:49', 'potato'),
(7302, 27.1, 65, 22, 1, '2024-11-27 03:25:55', 'potato'),
(7303, 27, 65, 23, 1, '2024-11-27 03:26:16', 'potato'),
(7304, 26.9, 65, 24, 1, '2024-11-27 03:26:46', 'potato'),
(7305, 26.9, 65, 23, 1, '2024-11-27 03:27:04', 'potato'),
(7306, 26.8, 65, 22, 1, '2024-11-27 03:27:22', 'potato'),
(7307, 26.8, 65, 23, 1, '2024-11-27 03:27:38', 'potato'),
(7308, 26.8, 65, 22, 1, '2024-11-27 03:27:44', 'potato'),
(7309, 26.7, 65, 22, 1, '2024-11-27 03:27:56', 'potato'),
(7310, 26.7, 65, 23, 1, '2024-11-27 03:28:09', 'potato'),
(7311, 26.7, 65, 22, 1, '2024-11-27 03:28:15', 'potato'),
(7312, 26.7, 65, 23, 1, '2024-11-27 03:28:21', 'potato'),
(7313, 26.6, 65, 23, 1, '2024-11-27 03:28:33', 'potato'),
(7314, 26.6, 65, 22, 1, '2024-11-27 03:28:42', 'potato'),
(7315, 26.6, 65, 23, 1, '2024-11-27 03:28:50', 'potato'),
(7316, 26.6, 65, 24, 1, '2024-11-27 03:29:18', 'potato'),
(7317, 26.5, 65, 0, 1, '2024-11-27 03:29:25', 'potato'),
(7318, 26.5, 66, 0, 1, '2024-11-27 03:30:04', 'potato'),
(7319, 26.4, 66, 0, 1, '2024-11-27 03:30:25', 'potato'),
(7320, 26.4, 65, 0, 1, '2024-11-27 03:31:11', 'potato'),
(7321, 26.3, 65, 0, 1, '2024-11-27 03:31:35', 'potato'),
(7322, 26.2, 65, 0, 1, '2024-11-27 03:32:38', 'potato'),
(7323, 26.1, 64, 0, 1, '2024-11-27 03:34:01', 'potato'),
(7324, 26, 64, 0, 1, '2024-11-27 03:35:08', 'potato'),
(7325, 25.9, 64, 0, 1, '2024-11-27 03:36:46', 'potato'),
(7326, 25.9, 63, 0, 1, '2024-11-27 03:37:28', 'potato'),
(7327, 25.8, 63, 0, 1, '2024-11-27 03:38:22', 'potato'),
(7328, 25.8, 62, 0, 1, '2024-11-27 03:38:37', 'potato'),
(7329, 25.8, 61, 25, 1, '2024-11-27 03:38:49', 'potato'),
(7330, 25.8, 60, 25, 1, '2024-11-27 03:38:55', 'potato'),
(7331, 25.8, 58, 24, 1, '2024-11-27 03:39:01', 'potato'),
(7332, 25.7, 57, 25, 1, '2024-11-27 03:39:07', 'potato'),
(7333, 25.7, 55, 24, 1, '2024-11-27 03:39:16', 'potato'),
(7334, 25.7, 53, 24, 1, '2024-11-27 03:39:22', 'potato'),
(7335, 25.6, 52, 24, 1, '2024-11-27 03:39:29', 'potato'),
(7336, 25.6, 51, 24, 1, '2024-11-27 03:39:44', 'potato'),
(7337, 25.6, 51, 23, 1, '2024-11-27 03:39:54', 'potato'),
(7338, 25.6, 50, 23, 1, '2024-11-27 03:40:26', 'potato'),
(7339, 25.6, 49, 23, 1, '2024-11-27 03:40:56', 'potato'),
(7340, 25.6, 47, 22, 1, '2024-11-27 03:42:09', 'potato'),
(7341, 25.5, 47, 20, 1, '2024-11-27 03:42:14', 'potato'),
(7342, 25.5, 47, 34, 1, '2024-11-27 03:42:24', 'potato'),
(7343, 25.5, 47, 56, 1, '2024-11-27 03:42:34', 'potato'),
(7344, 25.5, 46, 59, 1, '2024-11-27 03:42:45', 'potato'),
(7345, 25.5, 46, 55, 1, '2024-11-27 03:42:59', 'potato'),
(7346, 25.5, 46, 52, 1, '2024-11-27 03:43:08', 'potato'),
(7347, 25.5, 46, 51, 1, '2024-11-27 03:43:22', 'potato'),
(7348, 25.5, 46, 50, 1, '2024-11-27 03:43:33', 'potato'),
(7349, 25.4, 46, 48, 1, '2024-11-27 03:44:06', 'potato'),
(7350, 25.4, 45, 47, 1, '2024-11-27 03:45:01', 'potato'),
(7351, 25.4, 45, 57, 1, '2024-11-27 03:45:13', 'potato'),
(7352, 25.4, 45, 70, 1, '2024-11-27 03:45:22', 'potato'),
(7353, 24.9, 42, 53, 1, '2024-11-27 03:58:13', 'potato'),
(7354, 24.9, 42, 52, 1, '2024-11-27 03:58:19', 'potato'),
(7355, 24.9, 42, 50, 1, '2024-11-27 03:58:28', 'potato'),
(7356, 24.9, 42, 63, 1, '2024-11-27 03:58:39', 'potato'),
(7357, 24.9, 42, 54, 1, '2024-11-27 03:58:46', 'potato'),
(7358, 24.9, 42, 52, 1, '2024-11-27 03:58:55', 'potato'),
(7359, 24.9, 42, 50, 1, '2024-11-27 03:59:07', 'potato'),
(7360, 24.9, 43, 48, 1, '2024-11-27 03:59:14', 'potato'),
(7361, 24.9, 43, 47, 1, '2024-11-27 03:59:30', 'potato'),
(7362, 24.9, 43, 49, 1, '2024-11-27 03:59:45', 'potato'),
(7363, 24.9, 43, 48, 1, '2024-11-27 04:00:08', 'potato'),
(7364, 24.9, 42, 46, 1, '2024-11-27 04:01:03', 'potato'),
(7365, 25, 43, 46, 1, '2024-11-27 04:02:12', 'potato'),
(7366, 25, 42, 45, 1, '2024-11-27 04:02:54', 'potato'),
(7367, 25, 42, 44, 1, '2024-11-27 04:03:02', 'potato'),
(7368, 25, 41, 44, 1, '2024-11-27 04:03:25', 'potato'),
(7369, 25, 41, 43, 1, '2024-11-27 04:03:32', 'potato'),
(7370, 25, 42, 43, 1, '2024-11-27 04:04:14', 'potato'),
(7371, 25, 42, 45, 1, '2024-11-27 04:04:27', 'potato'),
(7372, 25, 42, 34, 1, '2024-11-27 04:04:39', 'potato'),
(7373, 25, 42, 63, 1, '2024-11-27 04:04:53', 'potato'),
(7374, 25, 42, 68, 1, '2024-11-27 04:05:03', 'potato'),
(7375, 25, 42, 60, 1, '2024-11-27 04:05:20', 'potato'),
(7376, 25, 42, 53, 1, '2024-11-27 04:05:30', 'potato'),
(7377, 25, 42, 52, 1, '2024-11-27 04:05:45', 'potato'),
(7378, 25, 42, 50, 1, '2024-11-27 04:05:47', 'potato'),
(7379, 25, 42, 51, 1, '2024-11-27 04:06:05', 'potato'),
(7380, 25, 41, 50, 1, '2024-11-27 04:06:22', 'potato'),
(7381, 25, 41, 49, 1, '2024-11-27 04:06:28', 'potato'),
(7382, 25, 41, 48, 1, '2024-11-27 04:07:06', 'potato'),
(7383, 25, 41, 49, 1, '2024-11-27 04:07:27', 'potato'),
(7384, 25, 41, 48, 1, '2024-11-27 04:07:36', 'potato'),
(7385, 24.9, 41, 48, 1, '2024-11-27 04:07:43', 'potato'),
(7386, 24.9, 41, 49, 1, '2024-11-27 04:10:10', 'potato'),
(7387, 25, 41, 48, 1, '2024-11-27 04:11:23', 'potato'),
(7388, 25, 41, 47, 1, '2024-11-27 04:11:48', 'potato'),
(7389, 25, 40, 47, 1, '2024-11-27 04:12:32', 'potato'),
(7390, 25, 40, 46, 1, '2024-11-27 04:13:07', 'potato'),
(7391, 25, 40, 45, 1, '2024-11-27 04:13:31', 'potato'),
(7392, 25.1, 40, 45, 1, '2024-11-27 04:13:48', 'potato'),
(7393, 25.1, 40, 46, 1, '2024-11-27 04:14:15', 'potato'),
(7394, 25.1, 40, 45, 1, '2024-11-27 04:14:23', 'potato'),
(7395, 25.1, 40, 46, 1, '2024-11-27 04:16:01', 'potato'),
(7396, 25.1, 40, 45, 1, '2024-11-27 04:16:18', 'potato'),
(7397, 25.1, 40, 46, 1, '2024-11-27 04:16:30', 'potato'),
(7398, 25.1, 40, 45, 1, '2024-11-27 04:16:39', 'potato'),
(7399, 25.1, 40, 46, 1, '2024-11-27 04:16:54', 'potato'),
(7400, 25.1, 40, 45, 1, '2024-11-27 04:17:04', 'potato'),
(7401, 25.1, 40, 46, 1, '2024-11-27 04:17:13', 'potato'),
(7402, 25.1, 40, 45, 1, '2024-11-27 04:17:46', 'potato'),
(7403, 25, 40, 46, 1, '2024-11-27 04:18:38', 'potato'),
(7404, 25, 40, 47, 1, '2024-11-27 04:18:48', 'potato'),
(7405, 25, 40, 46, 1, '2024-11-27 04:19:16', 'potato'),
(7406, 25, 40, 47, 1, '2024-11-27 04:19:24', 'potato'),
(7407, 25, 40, 46, 1, '2024-11-27 04:19:41', 'potato'),
(7408, 25, 40, 45, 1, '2024-11-27 04:19:45', 'potato'),
(7409, 25, 40, 46, 1, '2024-11-27 04:19:59', 'potato'),
(7410, 25, 40, 45, 1, '2024-11-27 04:20:11', 'potato'),
(7411, 25, 39, 45, 1, '2024-11-27 04:21:43', 'potato'),
(7412, 25, 39, 44, 1, '2024-11-27 04:22:11', 'potato'),
(7413, 24.9, 39, 44, 1, '2024-11-27 04:22:20', 'potato'),
(7414, 24.9, 39, 45, 1, '2024-11-27 04:22:29', 'potato'),
(7415, 24.9, 39, 70, 1, '2024-11-27 04:22:38', 'potato'),
(7416, 24.9, 39, 68, 1, '2024-11-27 04:22:44', 'potato'),
(7417, 24.9, 39, 64, 1, '2024-11-27 04:22:57', 'potato'),
(7418, 24.9, 39, 69, 1, '2024-11-27 04:23:06', 'potato'),
(7419, 24.9, 39, 1, 1, '2024-11-27 04:23:12', 'potato'),
(7420, 24.9, 39, 0, 1, '2024-11-27 04:23:42', 'potato'),
(7421, 24.9, 39, 62, 1, '2024-11-27 04:23:57', 'potato'),
(7422, 24.9, 39, 54, 1, '2024-11-27 04:24:09', 'potato'),
(7423, 24.9, 39, 48, 1, '2024-11-27 04:24:18', 'potato'),
(7424, 24.9, 39, 47, 1, '2024-11-27 04:24:41', 'potato'),
(7425, 24.9, 39, 46, 1, '2024-11-27 04:24:52', 'potato'),
(7426, 24.9, 39, 45, 1, '2024-11-27 04:25:18', 'potato'),
(7427, 24.8, 39, 45, 1, '2024-11-27 04:25:49', 'potato'),
(7428, 24.8, 39, 44, 1, '2024-11-27 04:25:58', 'potato'),
(7429, 24.8, 39, 45, 1, '2024-11-27 04:26:07', 'potato'),
(7430, 24.8, 39, 44, 1, '2024-11-27 04:26:28', 'potato'),
(7431, 24.8, 39, 56, 1, '2024-11-27 04:27:23', 'potato'),
(7432, 24.8, 39, 55, 1, '2024-11-27 04:27:24', 'potato'),
(7433, 24.8, 39, 47, 1, '2024-11-27 04:27:46', 'potato'),
(7434, 24.8, 39, 46, 1, '2024-11-27 04:28:23', 'potato'),
(7435, 24.8, 39, 48, 1, '2024-11-27 04:28:39', 'potato'),
(7436, 24.8, 39, 47, 1, '2024-11-27 04:28:48', 'potato'),
(7437, 24.8, 39, 46, 1, '2024-11-27 04:30:01', 'potato'),
(7438, 24.8, 39, 47, 1, '2024-11-27 04:30:11', 'potato'),
(7439, 24.8, 39, 46, 1, '2024-11-27 04:30:21', 'potato'),
(7440, 24.8, 39, 47, 1, '2024-11-27 04:30:27', 'potato'),
(7441, 24.8, 39, 46, 1, '2024-11-27 04:30:36', 'potato'),
(7442, 24.8, 39, 47, 1, '2024-11-27 04:30:46', 'potato'),
(7443, 24.8, 39, 46, 1, '2024-11-27 04:30:55', 'potato'),
(7444, 24.8, 39, 47, 1, '2024-11-27 04:31:01', 'potato'),
(7445, 24.8, 39, 46, 1, '2024-11-27 04:31:07', 'potato'),
(7446, 24.8, 39, 47, 1, '2024-11-27 04:31:15', 'potato'),
(7447, 24.8, 39, 46, 1, '2024-11-27 04:31:22', 'potato'),
(7448, 24.8, 38, 46, 1, '2024-11-27 04:31:56', 'potato'),
(7449, 24.8, 38, 47, 1, '2024-11-27 04:32:14', 'potato'),
(7450, 24.8, 38, 46, 1, '2024-11-27 04:32:26', 'potato'),
(7451, 24.7, 38, 46, 1, '2024-11-27 04:33:09', 'potato'),
(7452, 24.7, 38, 47, 1, '2024-11-27 04:33:15', 'potato'),
(7453, 24.7, 38, 45, 1, '2024-11-27 04:33:21', 'potato'),
(7454, 24.7, 38, 47, 1, '2024-11-27 04:33:34', 'potato'),
(7455, 24.7, 38, 54, 1, '2024-11-27 04:33:46', 'potato'),
(7456, 24.7, 38, 51, 1, '2024-11-27 04:33:52', 'potato'),
(7457, 24.7, 38, 50, 1, '2024-11-27 04:33:58', 'potato'),
(7458, 24.7, 38, 49, 1, '2024-11-27 04:34:07', 'potato'),
(7459, 24.7, 38, 48, 1, '2024-11-27 04:34:23', 'potato'),
(7460, 24.7, 38, 49, 1, '2024-11-27 04:34:29', 'potato'),
(7461, 24.7, 38, 48, 1, '2024-11-27 04:34:38', 'potato'),
(7462, 24.7, 38, 42, 1, '2024-11-27 04:35:27', 'potato'),
(7463, 24.7, 38, 45, 1, '2024-11-27 04:35:41', 'potato'),
(7464, 24.7, 38, 46, 1, '2024-11-27 04:36:01', 'potato'),
(7465, 24.7, 38, 45, 1, '2024-11-27 04:36:03', 'potato'),
(7466, 24.7, 38, 46, 1, '2024-11-27 04:38:31', 'potato'),
(7467, 24.7, 38, 47, 1, '2024-11-27 04:38:38', 'potato'),
(7468, 24.7, 38, 46, 1, '2024-11-27 04:38:56', 'potato'),
(7469, 24.7, 38, 47, 1, '2024-11-27 04:39:02', 'potato'),
(7470, 24.7, 38, 46, 1, '2024-11-27 04:39:13', 'potato'),
(7471, 24.6, 38, 46, 1, '2024-11-27 04:39:31', 'potato'),
(7472, 24.6, 38, 45, 1, '2024-11-27 04:42:48', 'potato'),
(7473, 24.6, 38, 46, 1, '2024-11-27 04:42:56', 'potato'),
(7474, 24.6, 38, 45, 1, '2024-11-27 04:43:55', 'potato'),
(7475, 24.6, 38, 46, 1, '2024-11-27 04:44:02', 'potato'),
(7476, 24.5, 38, 46, 1, '2024-11-27 04:44:59', 'potato'),
(7477, 24.5, 39, 46, 1, '2024-11-27 04:47:07', 'potato'),
(7478, 24.5, 39, 45, 1, '2024-11-27 04:48:12', 'potato'),
(7479, 24.5, 39, 46, 1, '2024-11-27 04:48:26', 'potato'),
(7480, 24.5, 38, 46, 1, '2024-11-27 04:48:51', 'potato'),
(7481, 24.5, 38, 45, 1, '2024-11-27 04:50:39', 'potato'),
(7482, 24.5, 38, 46, 1, '2024-11-27 04:51:49', 'potato'),
(7483, 24.5, 39, 46, 1, '2024-11-27 04:51:58', 'potato'),
(7484, 24.4, 39, 46, 1, '2024-11-27 04:55:05', 'potato'),
(7485, 24.4, 39, 41, 1, '2024-11-27 04:55:31', 'potato'),
(7486, 30.4, 82, 8, 1, '2024-12-03 15:36:48', 'potato'),
(7487, 30.4, 82, 6, 1, '2024-12-03 15:36:54', 'potato'),
(7488, 30.4, 82, 5, 1, '2024-12-03 15:37:07', 'potato'),
(7489, 30.4, 82, 0, 1, '2024-12-03 15:37:13', 'potato'),
(7490, 30.4, 82, 1, 1, '2024-12-03 15:37:37', 'potato'),
(7491, 30.4, 82, 0, 1, '2024-12-03 15:37:43', 'potato'),
(7492, 30.4, 81, 1, 1, '2024-12-03 15:37:49', 'potato'),
(7493, 30.4, 81, 3, 1, '2024-12-03 15:38:20', 'potato'),
(7494, 30.4, 81, 0, 1, '2024-12-03 15:38:26', 'potato'),
(7495, 30.4, 81, 2, 1, '2024-12-03 15:38:32', 'potato'),
(7496, 30.4, 81, 1, 1, '2024-12-03 15:38:38', 'potato'),
(7497, 30.4, 81, 3, 1, '2024-12-03 15:39:20', 'potato'),
(7498, 30.4, 81, 5, 1, '2024-12-03 15:39:27', 'potato'),
(7499, 30.4, 81, 3, 1, '2024-12-03 15:39:45', 'potato'),
(7500, 30.4, 81, 2, 1, '2024-12-03 15:40:03', 'potato'),
(7501, 30.4, 82, 2, 1, '2024-12-03 15:40:09', 'potato'),
(7502, 30.4, 82, 5, 1, '2024-12-03 15:41:10', 'potato'),
(7503, 0, 0, 0, 1, '2024-12-03 15:41:16', 'potato'),
(7504, 0, 0, 0, 1, '2024-12-03 15:41:22', 'potato'),
(7505, 30.4, 82, 0, 1, '2024-12-03 15:41:28', 'potato'),
(7506, 30.4, 82, 1, 1, '2024-12-03 15:41:40', 'potato'),
(7507, 30.4, 82, 0, 1, '2024-12-03 15:41:46', 'potato'),
(7508, 30.4, 82, 1, 1, '2024-12-03 15:42:05', 'potato'),
(7509, 30.4, 81, 0, 1, '2024-12-03 15:42:23', 'potato'),
(7510, 30.4, 81, 8, 1, '2024-12-03 15:43:03', 'potato'),
(7511, 30.4, 81, 1, 1, '2024-12-03 15:43:09', 'potato'),
(7512, 30.3, 81, 1, 1, '2024-12-03 15:43:51', 'potato'),
(7513, 30.3, 81, 0, 1, '2024-12-03 15:44:04', 'potato'),
(7514, 30.2, 81, 0, 1, '2024-12-03 15:44:28', 'potato'),
(7515, 30.2, 82, 0, 1, '2024-12-03 15:44:52', 'potato'),
(7516, 30.2, 82, 8, 1, '2024-12-03 15:45:23', 'potato'),
(7517, 30.2, 82, 1, 1, '2024-12-03 15:45:29', 'potato'),
(7518, 30.2, 82, 0, 1, '2024-12-03 15:45:35', 'potato'),
(7519, 30.2, 82, 1, 1, '2024-12-03 15:45:41', 'potato'),
(7520, 30.2, 82, 0, 1, '2024-12-03 15:45:47', 'potato'),
(7521, 0, 0, 0, 1, '2024-12-03 15:46:30', 'potato'),
(7522, 0, 0, 0, 1, '2024-12-03 15:46:36', 'potato'),
(7523, 0, 0, 0, 1, '2024-12-03 15:46:42', 'potato'),
(7524, 30.2, 82, 0, 1, '2024-12-03 15:46:48', 'potato'),
(7525, 30.3, 82, 0, 1, '2024-12-03 15:47:43', 'potato'),
(7526, 30.2, 82, 0, 1, '2024-12-03 15:49:01', 'potato'),
(7527, 30.2, 83, 0, 1, '2024-12-03 15:50:26', 'potato'),
(7528, 30.1, 83, 0, 1, '2024-12-03 15:52:09', 'potato'),
(7529, 30.2, 83, 0, 1, '2024-12-03 15:53:32', 'potato'),
(7530, 30.2, 82, 0, 1, '2024-12-03 15:54:48', 'potato'),
(7531, 30.2, 82, 71, 1, '2024-12-03 16:01:39', 'potato'),
(7532, 30.2, 82, 66, 1, '2024-12-03 16:01:45', 'potato'),
(7533, 30.2, 82, 64, 1, '2024-12-03 16:01:51', 'potato'),
(7534, 30.2, 82, 63, 1, '2024-12-03 16:01:57', 'potato'),
(7535, 30.2, 82, 62, 1, '2024-12-03 16:02:03', 'potato'),
(7536, 30.2, 82, 60, 1, '2024-12-03 16:02:09', 'potato'),
(7537, 30.2, 82, 58, 1, '2024-12-03 16:02:15', 'potato'),
(7538, 30.2, 82, 56, 1, '2024-12-03 16:02:28', 'potato'),
(7539, 30.2, 82, 55, 1, '2024-12-03 16:02:34', 'potato'),
(7540, 30.2, 82, 54, 1, '2024-12-03 16:02:40', 'potato'),
(7541, 30.2, 82, 52, 1, '2024-12-03 16:02:46', 'potato'),
(7542, 30.2, 82, 50, 1, '2024-12-03 16:02:52', 'potato'),
(7543, 30.2, 82, 48, 1, '2024-12-03 16:02:58', 'potato'),
(7544, 30.2, 82, 47, 1, '2024-12-03 16:03:04', 'potato'),
(7545, 30.2, 82, 48, 1, '2024-12-03 16:03:16', 'potato'),
(7546, 30.2, 82, 72, 1, '2024-12-03 16:03:22', 'potato'),
(7547, 30.2, 82, 67, 1, '2024-12-03 16:03:28', 'potato'),
(7548, 30.2, 82, 66, 1, '2024-12-03 16:03:35', 'potato'),
(7549, 30.2, 82, 65, 1, '2024-12-03 16:03:41', 'potato'),
(7550, 30.2, 82, 64, 1, '2024-12-03 16:03:47', 'potato'),
(7551, 30.2, 82, 63, 1, '2024-12-03 16:03:59', 'potato'),
(7552, 30.2, 82, 62, 1, '2024-12-03 16:04:05', 'potato'),
(7553, 30.2, 82, 61, 1, '2024-12-03 16:04:11', 'potato'),
(7554, 30.2, 82, 60, 1, '2024-12-03 16:04:17', 'potato'),
(7555, 30.2, 82, 58, 1, '2024-12-03 16:04:29', 'potato'),
(7556, 30.2, 82, 57, 1, '2024-12-03 16:04:41', 'potato'),
(7557, 30.2, 82, 56, 1, '2024-12-03 16:04:47', 'potato'),
(7558, 30.2, 82, 55, 1, '2024-12-03 16:04:53', 'potato'),
(7559, 30.2, 82, 54, 1, '2024-12-03 16:04:59', 'potato'),
(7560, 30.1, 82, 54, 1, '2024-12-03 16:05:06', 'potato'),
(7561, 30.1, 82, 53, 1, '2024-12-03 16:05:12', 'potato'),
(7562, 30.1, 82, 52, 1, '2024-12-03 16:05:24', 'potato'),
(7563, 30.1, 82, 51, 1, '2024-12-03 16:05:30', 'potato'),
(7564, 30.1, 82, 50, 1, '2024-12-03 16:06:00', 'potato'),
(7565, 30.1, 83, 50, 1, '2024-12-03 16:06:36', 'potato'),
(7566, 30.1, 83, 49, 1, '2024-12-03 16:06:49', 'potato'),
(7567, 30.1, 83, 50, 1, '2024-12-03 16:07:01', 'potato'),
(7568, 30.1, 83, 49, 1, '2024-12-03 16:07:07', 'potato'),
(7569, 30.1, 83, 50, 1, '2024-12-03 16:07:19', 'potato'),
(7570, 30.1, 83, 49, 1, '2024-12-03 16:07:25', 'potato'),
(7571, 30.1, 83, 48, 1, '2024-12-03 16:08:07', 'potato'),
(7572, 30.1, 83, 49, 1, '2024-12-03 16:08:32', 'potato'),
(7573, 30.1, 83, 48, 1, '2024-12-03 16:08:38', 'potato'),
(7574, 30.1, 83, 49, 1, '2024-12-03 16:08:44', 'potato'),
(7575, 30.2, 83, 48, 1, '2024-12-03 16:08:50', 'potato'),
(7576, 30.1, 83, 48, 1, '2024-12-03 16:08:56', 'potato'),
(7577, 30.2, 83, 48, 1, '2024-12-03 16:09:02', 'potato'),
(7578, 30.2, 82, 48, 1, '2024-12-03 16:09:56', 'potato'),
(7579, 30.2, 82, 49, 1, '2024-12-03 16:10:27', 'potato'),
(7580, 30.2, 82, 50, 1, '2024-12-03 16:10:33', 'potato'),
(7581, 30.2, 82, 49, 1, '2024-12-03 16:10:39', 'potato'),
(7582, 30.2, 82, 50, 1, '2024-12-03 16:10:57', 'potato'),
(7583, 30.2, 82, 49, 1, '2024-12-03 16:11:03', 'potato'),
(7584, 30.2, 82, 65, 1, '2024-12-03 16:11:15', 'potato'),
(7585, 30.2, 82, 62, 1, '2024-12-03 16:11:21', 'potato'),
(7586, 30.2, 82, 60, 1, '2024-12-03 16:11:27', 'potato'),
(7587, 30.2, 82, 56, 1, '2024-12-03 16:11:34', 'potato'),
(7588, 30.2, 82, 54, 1, '2024-12-03 16:11:40', 'potato'),
(7589, 30.2, 82, 53, 1, '2024-12-03 16:11:46', 'potato'),
(7590, 30.2, 82, 51, 1, '2024-12-03 16:11:52', 'potato'),
(7591, 30.2, 82, 50, 1, '2024-12-03 16:12:04', 'potato'),
(7592, 30.2, 82, 49, 1, '2024-12-03 16:12:28', 'potato'),
(7593, 30.2, 82, 62, 1, '2024-12-03 16:13:41', 'potato'),
(7594, 30.2, 82, 64, 1, '2024-12-03 16:13:47', 'potato'),
(7595, 30.2, 82, 60, 1, '2024-12-03 16:13:53', 'potato'),
(7596, 30.2, 82, 55, 1, '2024-12-03 16:13:59', 'potato'),
(7597, 30.2, 82, 52, 1, '2024-12-03 16:14:05', 'potato'),
(7598, 30.2, 82, 51, 1, '2024-12-03 16:14:11', 'potato'),
(7599, 30.2, 82, 50, 1, '2024-12-03 16:14:17', 'potato'),
(7600, 30.2, 82, 49, 1, '2024-12-03 16:14:29', 'potato'),
(7601, 30.2, 82, 62, 1, '2024-12-03 16:15:30', 'potato'),
(7602, 30.2, 82, 56, 1, '2024-12-03 16:15:42', 'potato'),
(7603, 30.2, 82, 52, 1, '2024-12-03 16:15:48', 'potato'),
(7604, 30.2, 82, 50, 1, '2024-12-03 16:15:54', 'potato'),
(7605, 30.2, 82, 49, 1, '2024-12-03 16:16:00', 'potato'),
(7606, 30.2, 82, 48, 1, '2024-12-03 16:16:31', 'potato'),
(7607, 30.2, 82, 69, 1, '2024-12-03 16:16:43', 'potato'),
(7608, 30.2, 82, 64, 1, '2024-12-03 16:16:49', 'potato'),
(7609, 30.2, 82, 62, 1, '2024-12-03 16:16:55', 'potato'),
(7610, 30.2, 82, 58, 1, '2024-12-03 16:17:01', 'potato'),
(7611, 30.2, 82, 54, 1, '2024-12-03 16:17:07', 'potato'),
(7612, 30.2, 82, 51, 1, '2024-12-03 16:17:13', 'potato'),
(7613, 30.2, 82, 50, 1, '2024-12-03 16:17:19', 'potato'),
(7614, 30.2, 82, 49, 1, '2024-12-03 16:17:25', 'potato'),
(7615, 30.2, 82, 48, 1, '2024-12-03 16:17:44', 'potato'),
(7616, 30.2, 82, 49, 1, '2024-12-03 16:18:08', 'potato'),
(7617, 30.2, 82, 48, 1, '2024-12-03 16:18:38', 'potato'),
(7618, 30.2, 82, 49, 1, '2024-12-03 16:19:02', 'potato'),
(7619, 30.2, 82, 48, 1, '2024-12-03 16:19:08', 'potato'),
(7620, 30.2, 82, 61, 1, '2024-12-03 16:19:27', 'potato'),
(7621, 30.2, 82, 64, 1, '2024-12-03 16:19:39', 'potato'),
(7622, 30.2, 82, 62, 1, '2024-12-03 16:19:45', 'potato'),
(7623, 30.2, 82, 0, 1, '2024-12-03 16:19:51', 'potato'),
(7624, 30.2, 82, 69, 1, '2024-12-03 16:20:03', 'potato'),
(7625, 30.2, 82, 1, 1, '2024-12-03 16:20:09', 'potato'),
(7626, 30.2, 82, 0, 1, '2024-12-03 16:20:27', 'potato'),
(7627, 30.1, 82, 0, 1, '2024-12-03 16:21:28', 'potato'),
(7628, 30.1, 83, 0, 1, '2024-12-03 16:22:22', 'potato'),
(7629, 30.2, 83, 0, 1, '2024-12-03 16:22:59', 'potato'),
(7630, 30.1, 83, 0, 1, '2024-12-03 16:23:05', 'potato'),
(7631, 30.1, 82, 0, 1, '2024-12-03 16:27:07', 'potato'),
(7632, 30.2, 82, 0, 1, '2024-12-03 16:28:07', 'potato'),
(7633, 30, 83, 0, 1, '2024-12-03 18:10:56', 'potato'),
(7634, 30, 83, 3, 1, '2024-12-03 18:11:39', 'potato'),
(7635, 30, 83, 65, 1, '2024-12-03 18:11:45', 'potato'),
(7636, 30, 83, 0, 1, '2024-12-03 18:11:51', 'potato'),
(7637, 30, 83, 2, 1, '2024-12-03 18:11:57', 'potato'),
(7638, 30, 83, 62, 1, '2024-12-03 18:12:03', 'potato'),
(7639, 30, 83, 34, 1, '2024-12-03 18:12:15', 'potato'),
(7640, 30, 83, 57, 1, '2024-12-03 18:12:21', 'potato'),
(7641, 30, 83, 50, 1, '2024-12-03 18:12:27', 'potato'),
(7642, 30, 83, 0, 1, '2024-12-03 18:12:33', 'potato'),
(7643, 30, 83, 64, 1, '2024-12-03 18:12:39', 'potato'),
(7644, 30, 83, 61, 1, '2024-12-03 18:12:46', 'potato'),
(7645, 30, 83, 59, 1, '2024-12-03 18:12:52', 'potato'),
(7646, 30, 83, 58, 1, '2024-12-03 18:12:58', 'potato'),
(7647, 30, 83, 63, 1, '2024-12-03 18:13:04', 'potato'),
(7648, 0, 0, 50, 1, '2024-12-03 18:13:10', 'potato'),
(7649, 30, 83, 56, 1, '2024-12-03 18:13:16', 'potato'),
(7650, 30, 83, 57, 1, '2024-12-03 18:13:22', 'potato'),
(7651, 30, 83, 56, 1, '2024-12-03 18:13:46', 'potato'),
(7652, 29.9, 83, 56, 1, '2024-12-03 18:13:52', 'potato'),
(7653, 29.9, 83, 18, 1, '2024-12-03 18:13:58', 'potato'),
(7654, 29.9, 83, 19, 1, '2024-12-03 18:14:05', 'potato'),
(7655, 29.9, 83, 18, 1, '2024-12-03 18:14:11', 'potato'),
(7656, 29.9, 83, 16, 1, '2024-12-03 18:14:17', 'potato'),
(7657, 29.9, 83, 18, 1, '2024-12-03 18:14:23', 'potato'),
(7658, 29.9, 83, 17, 1, '2024-12-03 18:14:35', 'potato'),
(7659, 29.9, 83, 16, 1, '2024-12-03 18:14:47', 'potato'),
(7660, 29.9, 83, 17, 1, '2024-12-03 18:15:05', 'potato'),
(7661, 29.9, 83, 16, 1, '2024-12-03 18:15:11', 'potato'),
(7662, 29.9, 83, 17, 1, '2024-12-03 18:15:17', 'potato'),
(7663, 29.9, 83, 14, 1, '2024-12-03 18:15:23', 'potato'),
(7664, 29.8, 83, 58, 1, '2024-12-03 18:15:30', 'potato'),
(7665, 29.8, 83, 16, 1, '2024-12-03 18:15:36', 'potato'),
(7666, 29.8, 83, 15, 1, '2024-12-03 18:15:48', 'potato'),
(7667, 29.8, 83, 14, 1, '2024-12-03 18:16:00', 'potato'),
(7668, 29.8, 83, 13, 1, '2024-12-03 18:16:06', 'potato'),
(7669, 29.8, 83, 12, 1, '2024-12-03 18:16:18', 'potato'),
(7670, 29.8, 83, 11, 1, '2024-12-03 18:16:24', 'potato'),
(7671, 29.9, 83, 10, 1, '2024-12-03 18:16:36', 'potato'),
(7672, 29.9, 83, 9, 1, '2024-12-03 18:16:54', 'potato'),
(7673, 29.9, 83, 8, 1, '2024-12-03 18:17:13', 'potato'),
(7674, 29.9, 83, 7, 1, '2024-12-03 18:17:31', 'potato'),
(7675, 29.9, 83, 6, 1, '2024-12-03 18:18:01', 'potato'),
(7676, 29.9, 83, 5, 1, '2024-12-03 18:18:50', 'potato'),
(7677, 30, 83, 5, 1, '2024-12-03 18:18:56', 'potato'),
(7678, 30, 83, 4, 1, '2024-12-03 18:19:44', 'potato'),
(7679, 30, 82, 4, 1, '2024-12-03 18:19:57', 'potato'),
(7680, 30, 82, 3, 1, '2024-12-03 18:20:45', 'potato'),
(7681, 29.9, 82, 3, 1, '2024-12-03 18:21:21', 'potato'),
(7682, 29.9, 83, 3, 1, '2024-12-03 18:21:27', 'potato'),
(7683, 29.9, 83, 2, 1, '2024-12-03 18:21:58', 'potato'),
(7684, 30, 83, 2, 1, '2024-12-03 18:23:28', 'potato'),
(7685, 30, 82, 2, 1, '2024-12-03 18:23:46', 'potato'),
(7686, 30, 82, 1, 1, '2024-12-03 18:23:59', 'potato'),
(7687, 30.1, 82, 1, 1, '2024-12-03 18:25:17', 'potato'),
(7688, 30.1, 82, 0, 1, '2024-12-03 18:26:48', 'potato'),
(7689, 30.1, 82, 1, 1, '2024-12-03 18:26:54', 'potato'),
(7690, 30.1, 82, 0, 1, '2024-12-03 18:27:06', 'potato'),
(7691, 30.2, 83, 0, 1, '2024-12-03 18:27:24', 'potato'),
(7692, 30.2, 82, 0, 1, '2024-12-03 18:27:43', 'potato'),
(7693, 30.1, 82, 0, 1, '2024-12-03 18:29:01', 'potato'),
(7694, 30.1, 82, 1, 1, '2024-12-03 18:29:19', 'potato'),
(7695, 30, 82, 0, 1, '2024-12-03 18:30:08', 'potato'),
(7696, 30, 82, 7, 1, '2024-12-03 18:30:14', 'potato'),
(7697, 30, 82, 3, 1, '2024-12-03 18:30:20', 'potato'),
(7698, 30, 82, 0, 1, '2024-12-03 18:30:26', 'potato'),
(7699, 29.9, 82, 0, 1, '2024-12-03 18:31:39', 'potato'),
(7700, 29.9, 83, 0, 1, '2024-12-03 18:31:57', 'potato'),
(7701, 29.8, 83, 0, 1, '2024-12-03 18:34:58', 'potato'),
(7702, 29.7, 83, 0, 1, '2024-12-03 18:39:30', 'potato'),
(7703, 29.8, 83, 0, 1, '2024-12-03 18:39:49', 'potato'),
(7704, 29.7, 83, 0, 1, '2024-12-03 18:40:13', 'potato'),
(7705, 29.7, 83, 8, 1, '2024-12-03 18:40:25', 'potato'),
(7706, 29.7, 83, 43, 1, '2024-12-03 18:40:31', 'potato'),
(7707, 29.8, 83, 45, 1, '2024-12-03 18:40:37', 'potato'),
(7708, 29.8, 83, 42, 1, '2024-12-03 18:40:43', 'potato'),
(7709, 29.8, 83, 40, 1, '2024-12-03 18:40:49', 'potato'),
(7710, 29.7, 83, 40, 1, '2024-12-03 18:40:55', 'potato'),
(7711, 29.7, 83, 37, 1, '2024-12-03 18:41:01', 'potato'),
(7712, 29.7, 83, 41, 1, '2024-12-03 18:41:07', 'potato'),
(7713, 29.7, 83, 36, 1, '2024-12-03 18:41:14', 'potato'),
(7714, 29.7, 83, 0, 1, '2024-12-03 18:41:20', 'potato'),
(7715, 29.7, 83, 46, 1, '2024-12-03 18:41:32', 'potato'),
(7716, 29.7, 83, 48, 1, '2024-12-03 18:41:38', 'potato'),
(7717, 29.7, 83, 46, 1, '2024-12-03 18:41:44', 'potato'),
(7718, 29.7, 83, 0, 1, '2024-12-03 18:41:50', 'potato'),
(7719, 29.7, 83, 8, 1, '2024-12-03 18:41:56', 'potato'),
(7720, 29.7, 83, 19, 1, '2024-12-03 18:42:02', 'potato'),
(7721, 29.7, 83, 52, 1, '2024-12-03 18:42:08', 'potato'),
(7722, 29.7, 83, 53, 1, '2024-12-03 18:42:20', 'potato'),
(7723, 29.7, 83, 50, 1, '2024-12-03 18:42:26', 'potato'),
(7724, 29.7, 83, 55, 1, '2024-12-03 18:42:32', 'potato'),
(7725, 29.7, 83, 50, 1, '2024-12-03 18:42:39', 'potato'),
(7726, 29.8, 83, 0, 1, '2024-12-03 18:42:51', 'potato'),
(7727, 29.8, 83, 8, 1, '2024-12-03 18:43:03', 'potato'),
(7728, 29.8, 83, 0, 1, '2024-12-03 18:43:09', 'potato'),
(7729, 29.7, 83, 2, 1, '2024-12-03 18:43:15', 'potato'),
(7730, 29.7, 83, 1, 1, '2024-12-03 18:43:21', 'potato'),
(7731, 29.7, 83, 67, 1, '2024-12-03 18:43:27', 'potato'),
(7732, 29.7, 83, 64, 1, '2024-12-03 18:43:33', 'potato'),
(7733, 29.7, 83, 63, 1, '2024-12-03 18:43:45', 'potato'),
(7734, 29.7, 83, 62, 1, '2024-12-03 18:43:51', 'potato'),
(7735, 29.8, 83, 61, 1, '2024-12-03 18:44:28', 'potato'),
(7736, 29.8, 83, 8, 1, '2024-12-03 18:44:40', 'potato'),
(7737, 29.8, 83, 10, 1, '2024-12-03 18:44:46', 'potato'),
(7738, 29.8, 83, 11, 1, '2024-12-03 18:44:58', 'potato'),
(7739, 29.8, 83, 2, 1, '2024-12-03 18:45:28', 'potato'),
(7740, 29.8, 83, 0, 1, '2024-12-03 18:45:34', 'potato'),
(7741, 29.8, 83, 73, 1, '2024-12-03 18:45:52', 'potato'),
(7742, 29.8, 83, 72, 1, '2024-12-03 18:45:59', 'potato'),
(7743, 29.8, 83, 71, 1, '2024-12-03 18:46:05', 'potato'),
(7744, 29.8, 83, 69, 1, '2024-12-03 18:46:11', 'potato'),
(7745, 29.8, 83, 68, 1, '2024-12-03 18:46:17', 'potato'),
(7746, 29.7, 83, 66, 1, '2024-12-03 18:46:23', 'potato'),
(7747, 29.7, 83, 64, 1, '2024-12-03 18:46:29', 'potato'),
(7748, 29.8, 83, 63, 1, '2024-12-03 18:46:35', 'potato'),
(7749, 29.8, 83, 62, 1, '2024-12-03 18:46:47', 'potato'),
(7750, 29.8, 83, 61, 1, '2024-12-03 18:47:05', 'potato'),
(7751, 29.8, 83, 60, 1, '2024-12-03 18:47:36', 'potato'),
(7752, 29.8, 83, 0, 1, '2024-12-03 18:47:42', 'potato'),
(7753, 29.8, 82, 0, 1, '2024-12-03 18:52:50', 'potato'),
(7754, 29.9, 82, 0, 1, '2024-12-03 18:52:56', 'potato'),
(7755, 30, 82, 0, 1, '2024-12-03 18:57:59', 'potato'),
(7756, 30, 81, 0, 1, '2024-12-03 19:00:54', 'potato'),
(7757, 29.9, 82, 0, 1, '2024-12-03 19:02:37', 'potato'),
(7758, 30, 82, 0, 1, '2024-12-03 19:12:06', 'potato'),
(7759, 29.9, 82, 0, 1, '2024-12-03 19:12:30', 'potato'),
(7760, 29.8, 82, 0, 1, '2024-12-03 19:13:42', 'potato'),
(7761, 29.9, 82, 0, 1, '2024-12-03 19:14:55', 'potato'),
(7762, 29.9, 81, 0, 1, '2024-12-03 19:16:02', 'potato'),
(7763, 29.9, 82, 0, 1, '2024-12-03 19:16:56', 'potato'),
(7764, 29.8, 82, 0, 1, '2024-12-03 19:19:39', 'potato'),
(7765, 29.9, 82, 0, 1, '2024-12-03 19:20:58', 'potato'),
(7766, 29.8, 82, 0, 1, '2024-12-03 19:27:37', 'potato'),
(7767, 29.9, 82, 0, 1, '2024-12-03 19:28:56', 'potato'),
(7768, 29.8, 82, 0, 1, '2024-12-03 19:30:21', 'potato'),
(7769, 29.9, 82, 0, 1, '2024-12-03 19:30:51', 'potato'),
(7770, 29.9, 82, 63, 1, '2024-12-03 19:32:58', 'potato'),
(7771, 29.9, 82, 61, 1, '2024-12-03 19:33:04', 'potato'),
(7772, 29.9, 82, 60, 1, '2024-12-03 19:33:10', 'potato'),
(7773, 29.9, 82, 58, 1, '2024-12-03 19:33:22', 'potato'),
(7774, 29.9, 82, 57, 1, '2024-12-03 19:33:41', 'potato'),
(7775, 29.9, 82, 56, 1, '2024-12-03 19:33:47', 'potato'),
(7776, 29.9, 82, 8, 1, '2024-12-03 19:34:11', 'potato'),
(7777, 29.9, 82, 0, 1, '2024-12-03 19:34:17', 'potato'),
(7778, 29.8, 82, 0, 1, '2024-12-03 19:35:11', 'potato'),
(7779, 29.8, 82, 64, 1, '2024-12-03 19:36:54', 'potato'),
(7780, 29.8, 82, 61, 1, '2024-12-03 19:37:00', 'potato'),
(7781, 29.8, 82, 57, 1, '2024-12-03 19:37:07', 'potato'),
(7782, 29.8, 82, 56, 1, '2024-12-03 19:37:13', 'potato'),
(7783, 29.8, 82, 55, 1, '2024-12-03 19:37:19', 'potato'),
(7784, 29.8, 82, 54, 1, '2024-12-03 19:37:25', 'potato'),
(7785, 29.8, 82, 53, 1, '2024-12-03 19:37:37', 'potato'),
(7786, 29.8, 82, 52, 1, '2024-12-03 19:37:55', 'potato'),
(7787, 29.8, 82, 51, 1, '2024-12-03 19:38:13', 'potato'),
(7788, 29.8, 82, 50, 1, '2024-12-03 19:38:50', 'potato'),
(7789, 29.8, 82, 51, 1, '2024-12-03 19:38:56', 'potato'),
(7790, 29.8, 82, 50, 1, '2024-12-03 19:39:02', 'potato'),
(7791, 29.8, 82, 49, 1, '2024-12-03 19:39:20', 'potato'),
(7792, 29.8, 82, 50, 1, '2024-12-03 19:39:38', 'potato'),
(7793, 29.8, 82, 49, 1, '2024-12-03 19:39:44', 'potato'),
(7794, 29.8, 82, 50, 1, '2024-12-03 19:40:21', 'potato'),
(7795, 29.8, 82, 49, 1, '2024-12-03 19:40:45', 'potato'),
(7796, 29.8, 82, 48, 1, '2024-12-03 19:40:57', 'potato'),
(7797, 29.8, 82, 49, 1, '2024-12-03 19:41:03', 'potato'),
(7798, 29.8, 82, 50, 1, '2024-12-03 19:41:15', 'potato'),
(7799, 29.8, 82, 48, 1, '2024-12-03 19:41:39', 'potato'),
(7800, 29.8, 82, 47, 1, '2024-12-03 19:41:52', 'potato'),
(7801, 29.8, 82, 46, 1, '2024-12-03 19:42:34', 'potato'),
(7802, 29.8, 82, 47, 1, '2024-12-03 19:42:46', 'potato'),
(7803, 29.8, 82, 46, 1, '2024-12-03 19:42:52', 'potato'),
(7804, 29.8, 82, 47, 1, '2024-12-03 19:43:05', 'potato'),
(7805, 29.8, 82, 46, 1, '2024-12-03 19:43:11', 'potato'),
(7806, 29.8, 82, 45, 1, '2024-12-03 19:43:23', 'potato'),
(7807, 29.8, 82, 46, 1, '2024-12-03 19:43:35', 'potato'),
(7808, 29.8, 82, 47, 1, '2024-12-03 19:43:53', 'potato'),
(7809, 29.8, 82, 46, 1, '2024-12-03 19:44:05', 'potato'),
(7810, 29.8, 82, 45, 1, '2024-12-03 19:44:11', 'potato'),
(7811, 29.8, 82, 46, 1, '2024-12-03 19:44:48', 'potato'),
(7812, 29.8, 82, 47, 1, '2024-12-03 19:44:54', 'potato'),
(7813, 29.8, 82, 46, 1, '2024-12-03 19:45:00', 'potato'),
(7814, 29.8, 82, 47, 1, '2024-12-03 19:45:06', 'potato'),
(7815, 29.8, 82, 46, 1, '2024-12-03 19:45:12', 'potato'),
(7816, 29.8, 82, 45, 1, '2024-12-03 19:45:30', 'potato'),
(7817, 29.8, 82, 44, 1, '2024-12-03 19:45:49', 'potato'),
(7818, 29.8, 82, 45, 1, '2024-12-03 19:45:55', 'potato'),
(7819, 29.8, 82, 44, 1, '2024-12-03 19:46:19', 'potato'),
(7820, 29.8, 82, 45, 1, '2024-12-03 19:46:31', 'potato'),
(7821, 29.8, 82, 46, 1, '2024-12-03 19:46:49', 'potato'),
(7822, 29.8, 82, 45, 1, '2024-12-03 19:46:55', 'potato'),
(7823, 29.8, 82, 0, 1, '2024-12-03 19:47:13', 'potato'),
(7824, 29.8, 82, 60, 1, '2024-12-03 19:47:20', 'potato'),
(7825, 29.8, 82, 59, 1, '2024-12-03 19:47:26', 'potato'),
(7826, 29.8, 82, 57, 1, '2024-12-03 19:47:38', 'potato'),
(7827, 29.8, 82, 55, 1, '2024-12-03 19:47:44', 'potato'),
(7828, 29.8, 82, 54, 1, '2024-12-03 19:47:50', 'potato'),
(7829, 29.8, 82, 53, 1, '2024-12-03 19:47:56', 'potato'),
(7830, 29.8, 82, 52, 1, '2024-12-03 19:48:02', 'potato'),
(7831, 29.8, 82, 51, 1, '2024-12-03 19:48:08', 'potato'),
(7832, 29.7, 82, 50, 1, '2024-12-03 19:48:14', 'potato'),
(7833, 29.7, 82, 49, 1, '2024-12-03 19:48:27', 'potato'),
(7834, 29.7, 82, 48, 1, '2024-12-03 19:48:33', 'potato'),
(7835, 29.7, 82, 47, 1, '2024-12-03 19:48:45', 'potato'),
(7836, 29.7, 82, 48, 1, '2024-12-03 19:49:03', 'potato'),
(7837, 29.8, 82, 48, 1, '2024-12-03 19:49:09', 'potato'),
(7838, 29.8, 82, 47, 1, '2024-12-03 19:49:21', 'potato'),
(7839, 29.8, 82, 46, 1, '2024-12-03 19:49:33', 'potato'),
(7840, 29.8, 82, 45, 1, '2024-12-03 19:49:52', 'potato'),
(7841, 29.8, 82, 46, 1, '2024-12-03 19:49:58', 'potato'),
(7842, 29.8, 82, 45, 1, '2024-12-03 19:50:04', 'potato'),
(7843, 29.8, 82, 46, 1, '2024-12-03 19:50:10', 'potato'),
(7844, 29.8, 82, 45, 1, '2024-12-03 19:50:16', 'potato'),
(7845, 29.8, 82, 46, 1, '2024-12-03 19:50:46', 'potato'),
(7846, 29.8, 82, 45, 1, '2024-12-03 19:51:04', 'potato'),
(7847, 29.8, 82, 44, 1, '2024-12-03 19:51:16', 'potato'),
(7848, 29.8, 82, 45, 1, '2024-12-03 19:51:22', 'potato'),
(7849, 29.8, 82, 44, 1, '2024-12-03 19:51:29', 'potato'),
(7850, 29.8, 82, 49, 1, '2024-12-03 19:51:53', 'potato'),
(7851, 29.8, 82, 64, 1, '2024-12-03 19:52:05', 'potato'),
(7852, 29.8, 82, 62, 1, '2024-12-03 19:52:11', 'potato'),
(7853, 29.8, 82, 58, 1, '2024-12-03 19:52:17', 'potato'),
(7854, 29.8, 82, 56, 1, '2024-12-03 19:52:23', 'potato'),
(7855, 29.8, 82, 54, 1, '2024-12-03 19:52:29', 'potato'),
(7856, 29.8, 82, 52, 1, '2024-12-03 19:52:35', 'potato'),
(7857, 29.8, 82, 51, 1, '2024-12-03 19:52:42', 'potato'),
(7858, 29.8, 82, 50, 1, '2024-12-03 19:52:48', 'potato'),
(7859, 29.8, 82, 6, 1, '2024-12-03 19:53:00', 'potato'),
(7860, 29.8, 82, 5, 1, '2024-12-03 19:53:12', 'potato'),
(7861, 29.8, 82, 4, 1, '2024-12-03 19:53:18', 'potato'),
(7862, 29.8, 82, 3, 1, '2024-12-03 19:53:30', 'potato'),
(7863, 29.8, 82, 2, 1, '2024-12-03 19:53:42', 'potato'),
(7864, 29.7, 82, 2, 1, '2024-12-03 19:54:25', 'potato'),
(7865, 29.7, 82, 1, 1, '2024-12-03 19:54:31', 'potato'),
(7866, 29.7, 82, 2, 1, '2024-12-03 19:54:49', 'potato'),
(7867, 29.7, 82, 8, 1, '2024-12-03 19:55:01', 'potato'),
(7868, 29.7, 82, 47, 1, '2024-12-03 19:55:07', 'potato'),
(7869, 29.7, 82, 49, 1, '2024-12-03 19:55:31', 'potato'),
(7870, 29.7, 82, 50, 1, '2024-12-03 19:55:37', 'potato'),
(7871, 29.7, 82, 51, 1, '2024-12-03 19:55:43', 'potato'),
(7872, 29.7, 82, 49, 1, '2024-12-03 19:55:56', 'potato'),
(7873, 29.7, 82, 50, 1, '2024-12-03 19:56:20', 'potato'),
(7874, 29.7, 82, 49, 1, '2024-12-03 19:56:26', 'potato'),
(7875, 29.7, 82, 47, 1, '2024-12-03 19:56:32', 'potato'),
(7876, 29.7, 82, 46, 1, '2024-12-03 19:56:44', 'potato'),
(7877, 29.7, 82, 48, 1, '2024-12-03 19:56:50', 'potato'),
(7878, 29.7, 82, 47, 1, '2024-12-03 19:56:56', 'potato'),
(7879, 29.8, 82, 43, 1, '2024-12-03 19:57:02', 'potato'),
(7880, 29.8, 82, 44, 1, '2024-12-03 19:57:15', 'potato'),
(7881, 29.8, 82, 41, 1, '2024-12-03 19:57:21', 'potato'),
(7882, 29.8, 82, 0, 1, '2024-12-03 19:57:27', 'potato'),
(7883, 29.8, 82, 3, 1, '2024-12-03 19:57:33', 'potato'),
(7884, 29.8, 82, 21, 1, '2024-12-03 19:57:39', 'potato'),
(7885, 29.8, 82, 20, 1, '2024-12-03 19:57:45', 'potato'),
(7886, 29.8, 82, 32, 1, '2024-12-03 19:57:51', 'potato'),
(7887, 29.8, 82, 31, 1, '2024-12-03 19:57:57', 'potato'),
(7888, 29.8, 82, 18, 1, '2024-12-03 19:58:03', 'potato');
INSERT INTO `sensordata` (`id`, `temperature`, `humidity`, `soil_moisture`, `pir_state`, `timestamp`, `device_name`) VALUES
(7889, 29.8, 82, 14, 1, '2024-12-03 19:58:09', 'potato'),
(7890, 29.8, 82, 0, 1, '2024-12-03 19:58:15', 'potato'),
(7891, 29.8, 82, 59, 1, '2024-12-03 19:58:46', 'potato'),
(7892, 29.8, 82, 61, 1, '2024-12-03 19:58:52', 'potato'),
(7893, 29.8, 82, 60, 1, '2024-12-03 19:58:58', 'potato'),
(7894, 29.8, 82, 5, 1, '2024-12-03 19:59:04', 'potato'),
(7895, 29.8, 82, 53, 1, '2024-12-03 19:59:16', 'potato'),
(7896, 29.7, 82, 52, 1, '2024-12-03 19:59:23', 'potato'),
(7897, 29.7, 82, 54, 1, '2024-12-03 19:59:29', 'potato'),
(7898, 29.7, 82, 52, 1, '2024-12-03 19:59:47', 'potato'),
(7899, 29.7, 82, 51, 1, '2024-12-03 20:00:11', 'potato'),
(7900, 29.7, 82, 50, 1, '2024-12-03 20:00:18', 'potato'),
(7901, 29.8, 82, 49, 1, '2024-12-03 20:00:36', 'potato'),
(7902, 29.8, 82, 48, 1, '2024-12-03 20:00:54', 'potato'),
(7903, 29.8, 82, 49, 1, '2024-12-03 20:01:00', 'potato'),
(7904, 29.8, 82, 48, 1, '2024-12-03 20:01:06', 'potato'),
(7905, 29.8, 82, 49, 1, '2024-12-03 20:01:18', 'potato'),
(7906, 29.8, 82, 48, 1, '2024-12-03 20:01:36', 'potato'),
(7907, 29.8, 82, 47, 1, '2024-12-03 20:01:48', 'potato'),
(7908, 29.8, 82, 46, 1, '2024-12-03 20:02:19', 'potato'),
(7909, 29.8, 82, 47, 1, '2024-12-03 20:02:31', 'potato'),
(7910, 29.8, 82, 46, 1, '2024-12-03 20:02:37', 'potato'),
(7911, 29.8, 82, 49, 1, '2024-12-03 20:02:43', 'potato'),
(7912, 29.8, 81, 48, 1, '2024-12-03 20:02:49', 'potato'),
(7913, 29.8, 81, 47, 1, '2024-12-03 20:02:55', 'potato'),
(7914, 29.8, 81, 48, 1, '2024-12-03 20:03:07', 'potato'),
(7915, 29.8, 82, 48, 1, '2024-12-03 20:03:20', 'potato'),
(7916, 29.8, 82, 47, 1, '2024-12-03 20:03:26', 'potato'),
(7917, 29.8, 81, 46, 1, '2024-12-03 20:03:38', 'potato'),
(7918, 29.8, 81, 45, 1, '2024-12-03 20:03:50', 'potato'),
(7919, 29.8, 82, 46, 1, '2024-12-03 20:04:14', 'potato'),
(7920, 29.8, 82, 47, 1, '2024-12-03 20:04:32', 'potato'),
(7921, 29.8, 82, 46, 1, '2024-12-03 20:04:44', 'potato'),
(7922, 29.8, 82, 45, 1, '2024-12-03 20:04:51', 'potato'),
(7923, 29.8, 82, 44, 1, '2024-12-03 20:05:09', 'potato'),
(7924, 29.8, 82, 45, 1, '2024-12-03 20:05:15', 'potato'),
(7925, 29.8, 82, 47, 1, '2024-12-03 20:05:51', 'potato'),
(7926, 29.8, 82, 48, 1, '2024-12-03 20:05:57', 'potato'),
(7927, 29.8, 82, 47, 1, '2024-12-03 20:06:03', 'potato'),
(7928, 29.8, 82, 49, 1, '2024-12-03 20:06:09', 'potato'),
(7929, 29.8, 82, 48, 1, '2024-12-03 20:06:21', 'potato'),
(7930, 29.8, 82, 50, 1, '2024-12-03 20:06:34', 'potato'),
(7931, 29.8, 82, 48, 1, '2024-12-03 20:06:40', 'potato'),
(7932, 29.8, 82, 47, 1, '2024-12-03 20:06:52', 'potato'),
(7933, 29.8, 82, 48, 1, '2024-12-03 20:07:10', 'potato'),
(7934, 29.8, 82, 47, 1, '2024-12-03 20:07:22', 'potato'),
(7935, 29.8, 82, 49, 1, '2024-12-03 20:07:40', 'potato'),
(7936, 29.8, 81, 49, 1, '2024-12-03 20:07:46', 'potato'),
(7937, 29.8, 81, 47, 1, '2024-12-03 20:07:53', 'potato'),
(7938, 29.8, 81, 46, 1, '2024-12-03 20:08:05', 'potato'),
(7939, 29.8, 81, 51, 1, '2024-12-03 20:08:17', 'potato'),
(7940, 29.8, 81, 50, 1, '2024-12-03 20:08:23', 'potato'),
(7941, 29.8, 81, 52, 1, '2024-12-03 20:08:29', 'potato'),
(7942, 29.8, 81, 50, 1, '2024-12-03 20:08:35', 'potato'),
(7943, 29.8, 81, 49, 1, '2024-12-03 20:08:41', 'potato'),
(7944, 29.8, 81, 0, 1, '2024-12-03 20:08:47', 'potato'),
(7945, 29.8, 82, 0, 1, '2024-12-03 20:08:59', 'potato'),
(7946, 29.7, 82, 0, 1, '2024-12-03 20:09:17', 'potato'),
(7947, 29.7, 82, 1, 1, '2024-12-03 20:09:30', 'potato'),
(7948, 29.7, 82, 4, 1, '2024-12-03 20:09:42', 'potato'),
(7949, 29.7, 82, 11, 1, '2024-12-03 20:09:48', 'potato'),
(7950, 29.7, 82, 9, 1, '2024-12-03 20:09:54', 'potato'),
(7951, 29.7, 82, 1, 1, '2024-12-03 20:10:00', 'potato'),
(7952, 29.7, 82, 2, 1, '2024-12-03 20:10:06', 'potato'),
(7953, 29.7, 82, 16, 1, '2024-12-03 20:10:13', 'potato'),
(7954, 29.7, 82, 11, 1, '2024-12-03 20:10:19', 'potato'),
(7955, 29.7, 82, 6, 1, '2024-12-03 20:10:25', 'potato'),
(7956, 29.7, 82, 10, 1, '2024-12-03 20:10:31', 'potato'),
(7957, 29.7, 82, 9, 1, '2024-12-03 20:10:37', 'potato'),
(7958, 29.7, 82, 1, 1, '2024-12-03 20:10:43', 'potato'),
(7959, 29.7, 82, 19, 1, '2024-12-03 20:11:25', 'potato'),
(7960, 29.7, 82, 22, 1, '2024-12-03 20:11:31', 'potato'),
(7961, 29.7, 82, 12, 1, '2024-12-03 20:11:38', 'potato'),
(7962, 29.7, 82, 19, 1, '2024-12-03 20:11:50', 'potato'),
(7963, 29.7, 82, 11, 1, '2024-12-03 20:11:56', 'potato'),
(7964, 29.7, 82, 3, 1, '2024-12-03 20:12:02', 'potato'),
(7965, 29.7, 82, 2, 1, '2024-12-03 20:12:26', 'potato'),
(7966, 29.7, 82, 1, 1, '2024-12-03 20:12:38', 'potato'),
(7967, 29.7, 82, 0, 1, '2024-12-03 20:12:44', 'potato'),
(7968, 29.7, 82, 1, 1, '2024-12-03 20:12:56', 'potato'),
(7969, 29.7, 82, 58, 1, '2024-12-03 20:14:25', 'potato'),
(7970, 29.7, 82, 57, 1, '2024-12-03 20:14:32', 'potato'),
(7971, 29.7, 81, 55, 1, '2024-12-03 20:14:38', 'potato'),
(7972, 29.8, 81, 54, 1, '2024-12-03 20:14:44', 'potato'),
(7973, 29.8, 81, 53, 1, '2024-12-03 20:15:02', 'potato'),
(7974, 29.8, 81, 10, 1, '2024-12-03 20:15:08', 'potato'),
(7975, 29.8, 81, 15, 1, '2024-12-03 20:15:14', 'potato'),
(7976, 29.7, 81, 16, 1, '2024-12-03 20:15:20', 'potato'),
(7977, 29.7, 81, 17, 1, '2024-12-03 20:15:44', 'potato'),
(7978, 29.7, 81, 69, 1, '2024-12-03 20:16:45', 'potato'),
(7979, 29.7, 81, 72, 1, '2024-12-03 20:16:51', 'potato'),
(7980, 29.7, 81, 74, 1, '2024-12-03 20:16:57', 'potato'),
(7981, 29.7, 81, 75, 1, '2024-12-03 20:17:03', 'potato'),
(7982, 29.8, 81, 76, 1, '2024-12-03 20:17:09', 'potato'),
(7983, 29.8, 81, 77, 1, '2024-12-03 20:17:33', 'potato'),
(7984, 29.8, 81, 78, 1, '2024-12-03 20:17:45', 'potato'),
(7985, 29.8, 81, 79, 1, '2024-12-03 20:18:16', 'potato'),
(7986, 29.8, 81, 80, 1, '2024-12-03 20:19:22', 'potato'),
(7987, 29.8, 81, 79, 1, '2024-12-03 20:19:53', 'potato'),
(7988, 29.7, 81, 79, 1, '2024-12-03 20:20:23', 'potato'),
(7989, 29.7, 81, 80, 1, '2024-12-03 20:20:53', 'potato'),
(7990, 29.7, 81, 79, 1, '2024-12-03 20:21:00', 'potato'),
(7991, 29.7, 81, 80, 1, '2024-12-03 20:21:12', 'potato'),
(7992, 29.8, 81, 80, 1, '2024-12-03 20:21:24', 'potato'),
(7993, 29.8, 81, 78, 1, '2024-12-03 20:21:30', 'potato'),
(7994, 29.8, 81, 79, 1, '2024-12-03 20:21:36', 'potato'),
(7995, 29.8, 81, 80, 1, '2024-12-03 20:21:42', 'potato'),
(7996, 29.8, 81, 79, 1, '2024-12-03 20:21:54', 'potato'),
(7997, 29.8, 81, 80, 1, '2024-12-03 20:22:00', 'potato'),
(7998, 29.8, 81, 79, 1, '2024-12-03 20:22:06', 'potato'),
(7999, 29.7, 81, 79, 1, '2024-12-03 20:22:24', 'potato'),
(8000, 29.7, 81, 80, 1, '2024-12-03 20:22:31', 'potato'),
(8001, 29.7, 81, 79, 1, '2024-12-03 20:22:37', 'potato'),
(8002, 29.7, 81, 80, 1, '2024-12-03 20:22:55', 'potato'),
(8003, 29.7, 82, 79, 1, '2024-12-03 20:23:01', 'potato'),
(8004, 29.7, 81, 79, 1, '2024-12-03 20:23:31', 'potato'),
(8005, 29.7, 81, 80, 1, '2024-12-03 20:23:55', 'potato'),
(8006, 29.7, 81, 79, 1, '2024-12-03 20:24:01', 'potato'),
(8007, 29.7, 81, 78, 1, '2024-12-03 20:24:08', 'potato'),
(8008, 29.7, 81, 77, 1, '2024-12-03 20:24:14', 'potato'),
(8009, 29.7, 81, 72, 1, '2024-12-03 20:24:20', 'potato'),
(8010, 29.8, 81, 60, 1, '2024-12-03 20:24:26', 'potato'),
(8011, 29.8, 81, 8, 1, '2024-12-03 20:24:32', 'potato'),
(8012, 29.8, 81, 7, 1, '2024-12-03 20:24:50', 'potato'),
(8013, 29.8, 81, 6, 1, '2024-12-03 20:24:56', 'potato'),
(8014, 29.7, 81, 5, 1, '2024-12-03 20:25:08', 'potato'),
(8015, 29.7, 81, 4, 1, '2024-12-03 20:25:20', 'potato'),
(8016, 29.7, 81, 3, 1, '2024-12-03 20:25:26', 'potato'),
(8017, 29.7, 81, 2, 1, '2024-12-03 20:25:45', 'potato'),
(8018, 29.7, 82, 2, 1, '2024-12-03 20:26:03', 'potato'),
(8019, 29.7, 81, 2, 1, '2024-12-03 20:26:27', 'potato'),
(8020, 29.7, 81, 3, 1, '2024-12-03 20:28:59', 'potato'),
(8021, 29.7, 81, 2, 1, '2024-12-03 20:29:05', 'potato'),
(8022, 29.8, 81, 2, 1, '2024-12-03 20:32:00', 'potato'),
(8023, 29.8, 82, 51, 1, '2024-12-03 20:33:10', 'potato'),
(8024, 29.8, 81, 51, 1, '2024-12-03 20:33:22', 'potato'),
(8025, 29.8, 81, 50, 1, '2024-12-03 20:33:34', 'potato'),
(8026, 29.8, 81, 49, 1, '2024-12-03 20:33:52', 'potato'),
(8027, 29.8, 82, 48, 1, '2024-12-03 20:34:10', 'potato'),
(8028, 29.8, 82, 47, 1, '2024-12-03 20:34:16', 'potato'),
(8029, 29.8, 82, 1, 1, '2024-12-03 20:34:35', 'potato'),
(8030, 29.6, 81, 0, 1, '2024-12-03 20:35:25', 'potato'),
(8031, 29.6, 81, 2, 1, '2024-12-03 20:36:03', 'potato'),
(8032, 29.6, 81, 20, 1, '2024-12-03 20:37:12', 'potato'),
(8033, 29.6, 81, 19, 1, '2024-12-03 20:37:18', 'potato'),
(8034, 29.6, 81, 18, 1, '2024-12-03 20:37:24', 'potato'),
(8035, 29.6, 82, 16, 1, '2024-12-03 20:38:21', 'potato'),
(8036, 29.6, 82, 11, 1, '2024-12-03 20:38:27', 'potato'),
(8037, 29.6, 82, 15, 1, '2024-12-03 20:38:33', 'potato'),
(8038, 29.6, 82, 14, 1, '2024-12-03 20:38:39', 'potato'),
(8039, 29.6, 82, 13, 1, '2024-12-03 20:38:51', 'potato'),
(8040, 29.6, 82, 12, 1, '2024-12-03 20:38:57', 'potato'),
(8041, 29.6, 82, 0, 1, '2024-12-03 20:39:16', 'potato'),
(8042, 29.6, 82, 19, 1, '2024-12-03 20:39:40', 'potato'),
(8043, 29.6, 82, 14, 1, '2024-12-03 20:39:46', 'potato'),
(8044, 29.6, 82, 13, 1, '2024-12-03 20:39:52', 'potato'),
(8045, 29.6, 82, 10, 1, '2024-12-03 20:39:58', 'potato'),
(8046, 29.6, 82, 9, 1, '2024-12-03 20:40:10', 'potato'),
(8047, 29.6, 82, 8, 1, '2024-12-03 20:40:16', 'potato'),
(8048, 29.6, 82, 7, 1, '2024-12-03 20:40:34', 'potato'),
(8049, 29.6, 82, 6, 1, '2024-12-03 20:40:47', 'potato'),
(8050, 29.6, 81, 6, 1, '2024-12-03 20:41:35', 'potato'),
(8051, 29.6, 81, 5, 1, '2024-12-03 20:41:47', 'potato'),
(8052, 29.6, 82, 5, 1, '2024-12-03 20:42:36', 'potato'),
(8053, 29.6, 81, 5, 1, '2024-12-03 20:42:48', 'potato'),
(8054, 29.6, 81, 4, 1, '2024-12-03 20:43:00', 'potato'),
(8055, 29.6, 82, 4, 1, '2024-12-03 20:43:18', 'potato'),
(8056, 29.5, 82, 4, 1, '2024-12-03 20:43:42', 'potato'),
(8057, 29.5, 82, 3, 1, '2024-12-03 20:44:13', 'potato'),
(8058, 29.5, 82, 4, 1, '2024-12-03 20:45:49', 'potato'),
(8059, 29.5, 82, 3, 1, '2024-12-03 20:45:55', 'potato'),
(8060, 29.5, 82, 2, 1, '2024-12-03 20:50:16', 'potato'),
(8061, 29.5, 82, 3, 1, '2024-12-03 20:50:28', 'potato'),
(8062, 29.5, 82, 2, 1, '2024-12-03 20:50:52', 'potato'),
(8063, 29.5, 81, 1, 1, '2024-12-03 20:55:04', 'potato'),
(8064, 29.5, 81, 0, 1, '2024-12-03 20:55:10', 'potato'),
(8065, 29.6, 81, 0, 1, '2024-12-03 20:59:09', 'potato'),
(8066, 26.6, 90, 0, 1, '2024-12-03 22:50:35', 'potato'),
(8067, 26.6, 91, 0, 1, '2024-12-03 22:50:41', 'potato'),
(8068, 26.5, 91, 0, 1, '2024-12-03 22:50:53', 'potato'),
(8069, 26.5, 92, 0, 1, '2024-12-03 22:50:59', 'potato'),
(8070, 26.5, 93, 0, 1, '2024-12-03 22:51:54', 'potato'),
(8071, 26.4, 93, 0, 1, '2024-12-03 22:52:06', 'potato'),
(8072, 26.3, 93, 0, 1, '2024-12-03 22:53:43', 'potato'),
(8073, 26.3, 94, 0, 1, '2024-12-03 22:53:50', 'potato'),
(8074, 27.8, 91, 0, 1, '2024-12-03 23:05:51', 'potato'),
(8075, 27.8, 90, 0, 1, '2024-12-03 23:06:10', 'potato'),
(8076, 27.7, 90, 0, 1, '2024-12-03 23:06:16', 'potato'),
(8077, 27.3, 76, 0, 1, '2024-12-03 23:07:11', 'potato'),
(8078, 27.3, 75, 0, 1, '2024-12-03 23:07:23', 'potato'),
(8079, 27.3, 74, 0, 1, '2024-12-03 23:07:36', 'potato'),
(8080, 27.3, 73, 0, 1, '2024-12-03 23:07:42', 'potato'),
(8081, 27.3, 72, 0, 1, '2024-12-03 23:07:48', 'potato'),
(8082, 27.3, 71, 0, 1, '2024-12-03 23:08:01', 'potato'),
(8083, 27.3, 70, 0, 1, '2024-12-03 23:08:07', 'potato'),
(8084, 27.2, 69, 0, 1, '2024-12-03 23:08:13', 'potato'),
(8085, 27.2, 68, 0, 1, '2024-12-03 23:08:25', 'potato'),
(8086, 27.2, 67, 0, 1, '2024-12-03 23:08:35', 'potato'),
(8087, 27.2, 66, 0, 1, '2024-12-03 23:08:41', 'potato'),
(8088, 27.1, 66, 0, 1, '2024-12-03 23:08:47', 'potato'),
(8089, 27.1, 65, 18, 1, '2024-12-03 23:09:00', 'potato'),
(8090, 27.1, 65, 17, 1, '2024-12-03 23:09:06', 'potato'),
(8091, 27, 65, 17, 1, '2024-12-03 23:09:18', 'potato'),
(8092, 27, 65, 16, 1, '2024-12-03 23:09:25', 'potato'),
(8093, 27, 65, 10, 1, '2024-12-03 23:09:37', 'potato'),
(8094, 27, 65, 8, 1, '2024-12-03 23:09:43', 'potato'),
(8095, 27, 64, 4, 1, '2024-12-03 23:09:49', 'potato'),
(8096, 26.8, 61, 18, 1, '2024-12-03 23:13:46', 'potato'),
(8097, 26.8, 61, 19, 1, '2024-12-03 23:13:52', 'potato'),
(8098, 26.8, 60, 18, 1, '2024-12-03 23:14:05', 'potato'),
(8099, 26.8, 60, 17, 1, '2024-12-03 23:14:23', 'potato'),
(8100, 26.8, 60, 18, 1, '2024-12-03 23:14:29', 'potato'),
(8101, 26.8, 60, 0, 1, '2024-12-03 23:14:35', 'potato'),
(8102, 26.8, 59, 0, 1, '2024-12-03 23:14:53', 'potato'),
(8103, 26.8, 59, 3, 1, '2024-12-03 23:15:11', 'potato'),
(8104, 26.8, 59, 20, 1, '2024-12-03 23:15:30', 'potato'),
(8105, 26.8, 59, 13, 1, '2024-12-03 23:15:37', 'potato'),
(8106, 26.8, 59, 10, 1, '2024-12-03 23:15:43', 'potato'),
(8107, 26.8, 59, 17, 1, '2024-12-03 23:15:55', 'potato'),
(8108, 26.8, 58, 17, 1, '2024-12-03 23:16:01', 'potato'),
(8109, 26.7, 58, 17, 1, '2024-12-03 23:16:13', 'potato'),
(8110, 26.7, 58, 16, 1, '2024-12-03 23:16:25', 'potato'),
(8111, 26.6, 58, 16, 1, '2024-12-03 23:17:08', 'potato'),
(8112, 26.5, 58, 15, 1, '2024-12-03 23:18:02', 'potato'),
(8113, 26.4, 58, 15, 1, '2024-12-03 23:18:45', 'potato'),
(8114, 26.4, 57, 15, 1, '2024-12-03 23:19:39', 'potato'),
(8115, 26.3, 57, 15, 1, '2024-12-03 23:19:45', 'potato'),
(8116, 26.3, 57, 14, 1, '2024-12-03 23:19:51', 'potato'),
(8117, 26.3, 57, 15, 1, '2024-12-03 23:20:22', 'potato'),
(8118, 26.3, 57, 0, 1, '2024-12-03 23:20:28', 'potato'),
(8119, 26.2, 57, 0, 1, '2024-12-03 23:20:58', 'potato'),
(8120, 26, 57, 19, 1, '2024-12-03 23:23:27', 'potato'),
(8121, 26, 57, 10, 1, '2024-12-03 23:23:46', 'potato'),
(8122, 26, 57, 19, 1, '2024-12-03 23:23:58', 'potato'),
(8123, 26, 56, 19, 1, '2024-12-03 23:24:10', 'potato'),
(8124, 25.9, 56, 20, 1, '2024-12-03 23:24:16', 'potato'),
(8125, 25.9, 56, 8, 1, '2024-12-03 23:24:23', 'potato'),
(8126, 25.9, 56, 10, 1, '2024-12-03 23:24:29', 'potato'),
(8127, 25.9, 56, 8, 1, '2024-12-03 23:24:35', 'potato'),
(8128, 25.9, 56, 9, 1, '2024-12-03 23:24:41', 'potato'),
(8129, 25.9, 56, 15, 1, '2024-12-03 23:24:47', 'potato'),
(8130, 25.9, 56, 6, 1, '2024-12-03 23:24:59', 'potato'),
(8131, 25.9, 56, 8, 1, '2024-12-03 23:25:29', 'potato'),
(8132, 25.9, 56, 6, 1, '2024-12-03 23:26:00', 'potato'),
(8133, 25.9, 56, 4, 1, '2024-12-03 23:26:06', 'potato'),
(8134, 25.9, 56, 0, 1, '2024-12-03 23:26:18', 'potato'),
(8135, 25.8, 56, 1, 1, '2024-12-03 23:26:30', 'potato'),
(8136, 25.8, 56, 0, 1, '2024-12-03 23:26:36', 'potato'),
(8137, 25.8, 56, 18, 1, '2024-12-03 23:27:39', 'potato'),
(8138, 25.8, 56, 20, 1, '2024-12-03 23:27:45', 'potato'),
(8139, 25.8, 55, 0, 1, '2024-12-03 23:28:10', 'potato'),
(8140, 25.8, 55, 1, 1, '2024-12-03 23:32:53', 'potato'),
(8141, 25.8, 55, 2, 1, '2024-12-03 23:33:06', 'potato'),
(8142, 25.8, 55, 0, 1, '2024-12-03 23:33:12', 'potato'),
(8143, 25.8, 55, 3, 1, '2024-12-03 23:33:24', 'potato'),
(8144, 25.8, 55, 0, 1, '2024-12-03 23:33:30', 'potato'),
(8145, 25.8, 54, 0, 1, '2024-12-03 23:34:14', 'potato'),
(8146, 25.8, 54, 2, 1, '2024-12-03 23:35:15', 'potato'),
(8147, 25.8, 54, 0, 1, '2024-12-03 23:35:52', 'potato'),
(8148, 25.8, 54, 2, 1, '2024-12-03 23:35:58', 'potato'),
(8149, 25.8, 54, 0, 1, '2024-12-03 23:36:05', 'potato'),
(8150, 25.8, 54, 6, 1, '2024-12-03 23:36:29', 'potato'),
(8151, 25.8, 53, 0, 1, '2024-12-03 23:38:07', 'potato'),
(8152, 25.8, 53, 18, 1, '2024-12-03 23:38:14', 'potato'),
(8153, 25.8, 53, 19, 1, '2024-12-03 23:38:26', 'potato'),
(8154, 25.8, 53, 9, 1, '2024-12-03 23:38:32', 'potato'),
(8155, 25.8, 53, 8, 1, '2024-12-03 23:38:38', 'potato'),
(8156, 25.8, 53, 5, 1, '2024-12-03 23:38:44', 'potato'),
(8157, 25.8, 53, 4, 1, '2024-12-03 23:38:50', 'potato'),
(8158, 25.8, 52, 4, 1, '2024-12-03 23:41:35', 'potato'),
(8159, 25.8, 52, 5, 1, '2024-12-03 23:41:47', 'potato'),
(8160, 25.8, 52, 4, 1, '2024-12-03 23:41:53', 'potato'),
(8161, 25.8, 52, 0, 1, '2024-12-03 23:42:35', 'potato'),
(8162, 25.7, 51, 0, 1, '2024-12-03 23:52:21', 'potato'),
(8163, 25.7, 51, 19, 1, '2024-12-03 23:53:10', 'potato'),
(8164, 25.7, 51, 0, 1, '2024-12-03 23:57:06', 'potato'),
(8165, 25.7, 52, 0, 1, '2024-12-04 00:02:05', 'potato'),
(8166, 29, 60, 0, 1, '2024-12-04 00:12:06', 'potato'),
(8167, 29.3, 83, 0, 1, '2024-12-04 00:18:17', 'potato'),
(8168, 29.4, 83, 0, 1, '2024-12-04 00:18:41', 'potato'),
(8169, 29.5, 83, 0, 1, '2024-12-04 00:19:54', 'potato'),
(8170, 29.5, 82, 20, 1, '2024-12-04 00:25:55', 'potato'),
(8171, 29.5, 82, 19, 1, '2024-12-04 00:26:01', 'potato'),
(8172, 29.5, 82, 69, 1, '2024-12-04 00:26:19', 'potato'),
(8173, 29.5, 82, 65, 1, '2024-12-04 00:26:26', 'potato'),
(8174, 29.5, 82, 61, 1, '2024-12-04 00:26:32', 'potato'),
(8175, 29.5, 82, 58, 1, '2024-12-04 00:26:38', 'potato'),
(8176, 29.5, 82, 56, 1, '2024-12-04 00:26:44', 'potato'),
(8177, 29.5, 82, 55, 1, '2024-12-04 00:26:50', 'potato'),
(8178, 29.5, 82, 54, 1, '2024-12-04 00:27:02', 'potato'),
(8179, 29.5, 82, 55, 1, '2024-12-04 00:27:50', 'potato'),
(8180, 29.5, 82, 54, 1, '2024-12-04 00:27:56', 'potato'),
(8181, 29.5, 82, 55, 1, '2024-12-04 00:28:02', 'potato'),
(8182, 29.5, 82, 54, 1, '2024-12-04 00:28:09', 'potato'),
(8183, 29.5, 82, 55, 1, '2024-12-04 00:28:27', 'potato'),
(8184, 29.5, 82, 56, 1, '2024-12-04 00:29:03', 'potato'),
(8185, 29.5, 82, 57, 1, '2024-12-04 00:30:04', 'potato'),
(8186, 29.5, 82, 56, 1, '2024-12-04 00:30:34', 'potato'),
(8187, 29.5, 82, 57, 1, '2024-12-04 00:30:46', 'potato'),
(8188, 29.5, 82, 56, 1, '2024-12-04 00:30:52', 'potato'),
(8189, 29.5, 82, 57, 1, '2024-12-04 00:31:16', 'potato'),
(8190, 29.5, 82, 56, 1, '2024-12-04 00:31:34', 'potato'),
(8191, 29.5, 82, 57, 1, '2024-12-04 00:31:41', 'potato'),
(8192, 29.5, 82, 56, 1, '2024-12-04 00:31:47', 'potato'),
(8193, 29.5, 82, 57, 1, '2024-12-04 00:31:53', 'potato'),
(8194, 29.5, 82, 58, 1, '2024-12-04 00:32:05', 'potato'),
(8195, 29.5, 82, 57, 1, '2024-12-04 00:32:11', 'potato'),
(8196, 29.5, 82, 58, 1, '2024-12-04 00:32:17', 'potato'),
(8197, 29.5, 82, 59, 1, '2024-12-04 00:32:23', 'potato'),
(8198, 29.5, 82, 0, 1, '2024-12-04 00:33:30', 'potato'),
(8199, 29.5, 82, 39, 1, '2024-12-04 00:33:36', 'potato'),
(8200, 29.5, 82, 38, 1, '2024-12-04 00:34:06', 'potato'),
(8201, 29.5, 82, 37, 1, '2024-12-04 00:35:31', 'potato'),
(8202, 29.5, 82, 36, 1, '2024-12-04 00:36:01', 'potato'),
(8203, 29.5, 82, 46, 1, '2024-12-04 00:36:07', 'potato'),
(8204, 29.5, 82, 50, 1, '2024-12-04 00:36:13', 'potato'),
(8205, 29.5, 82, 54, 1, '2024-12-04 00:36:19', 'potato'),
(8206, 29.5, 82, 58, 1, '2024-12-04 00:36:26', 'potato'),
(8207, 29.5, 82, 59, 1, '2024-12-04 00:36:32', 'potato'),
(8208, 29.5, 82, 58, 1, '2024-12-04 00:36:50', 'potato'),
(8209, 29.6, 82, 58, 1, '2024-12-04 00:37:02', 'potato'),
(8210, 29.6, 82, 59, 1, '2024-12-04 00:37:14', 'potato'),
(8211, 29.6, 82, 58, 1, '2024-12-04 00:37:20', 'potato'),
(8212, 29.6, 82, 59, 1, '2024-12-04 00:37:38', 'potato'),
(8213, 29.6, 82, 58, 1, '2024-12-04 00:37:44', 'potato'),
(8214, 29.6, 81, 58, 1, '2024-12-04 00:39:09', 'potato'),
(8215, 29.6, 82, 58, 1, '2024-12-04 00:40:16', 'potato'),
(8216, 29.6, 82, 57, 1, '2024-12-04 00:40:28', 'potato'),
(8217, 29.6, 82, 58, 1, '2024-12-04 00:41:22', 'potato'),
(8218, 29.6, 82, 57, 1, '2024-12-04 00:41:28', 'potato'),
(8219, 29.6, 82, 58, 1, '2024-12-04 00:41:35', 'potato'),
(8220, 29.6, 82, 57, 1, '2024-12-04 00:42:05', 'potato'),
(8221, 29.6, 82, 58, 1, '2024-12-04 00:42:29', 'potato'),
(8222, 29.6, 82, 57, 1, '2024-12-04 00:42:35', 'potato'),
(8223, 29.6, 82, 58, 1, '2024-12-04 00:42:41', 'potato'),
(8224, 29.6, 82, 57, 1, '2024-12-04 00:42:47', 'potato'),
(8225, 29.6, 82, 56, 1, '2024-12-04 00:44:42', 'potato'),
(8226, 29.6, 82, 57, 1, '2024-12-04 00:45:00', 'potato'),
(8227, 29.6, 82, 56, 1, '2024-12-04 00:45:06', 'potato'),
(8228, 29.6, 82, 57, 1, '2024-12-04 00:45:19', 'potato'),
(8229, 29.6, 82, 56, 1, '2024-12-04 00:45:25', 'potato'),
(8230, 29.6, 82, 57, 1, '2024-12-04 00:46:19', 'potato'),
(8231, 29.6, 82, 56, 1, '2024-12-04 00:46:25', 'potato'),
(8232, 29.6, 82, 57, 1, '2024-12-04 00:46:31', 'potato'),
(8233, 29.6, 82, 56, 1, '2024-12-04 00:46:44', 'potato'),
(8234, 29.6, 82, 55, 1, '2024-12-04 00:48:51', 'potato'),
(8235, 29.6, 82, 56, 1, '2024-12-04 00:49:39', 'potato'),
(8236, 29.6, 82, 55, 1, '2024-12-04 00:49:45', 'potato'),
(8237, 29.6, 82, 56, 1, '2024-12-04 00:49:51', 'potato'),
(8238, 29.6, 82, 55, 1, '2024-12-04 00:50:04', 'potato'),
(8239, 29.6, 83, 55, 1, '2024-12-04 00:50:10', 'potato'),
(8240, 29.6, 83, 56, 1, '2024-12-04 00:50:40', 'potato'),
(8241, 29.6, 83, 55, 1, '2024-12-04 00:50:46', 'potato'),
(8242, 29.6, 82, 55, 1, '2024-12-04 00:51:29', 'potato'),
(8243, 29.6, 82, 54, 1, '2024-12-04 00:52:59', 'potato'),
(8244, 29.6, 82, 55, 1, '2024-12-04 00:53:23', 'potato'),
(8245, 29.6, 82, 54, 1, '2024-12-04 00:54:12', 'potato'),
(8246, 29.6, 81, 54, 1, '2024-12-04 00:54:24', 'potato'),
(8247, 29.6, 81, 55, 1, '2024-12-04 00:54:30', 'potato'),
(8248, 29.6, 81, 53, 1, '2024-12-04 00:54:36', 'potato'),
(8249, 29.6, 81, 54, 1, '2024-12-04 00:54:42', 'potato'),
(8250, 29.6, 81, 53, 1, '2024-12-04 00:54:48', 'potato'),
(8251, 29.6, 81, 54, 1, '2024-12-04 00:54:54', 'potato'),
(8252, 29.6, 81, 55, 1, '2024-12-04 00:55:00', 'potato'),
(8253, 29.6, 81, 54, 1, '2024-12-04 00:55:06', 'potato'),
(8254, 29.6, 81, 53, 1, '2024-12-04 00:55:13', 'potato'),
(8255, 29.6, 81, 54, 1, '2024-12-04 00:55:19', 'potato'),
(8256, 29.6, 81, 53, 1, '2024-12-04 00:55:25', 'potato'),
(8257, 29.6, 81, 54, 1, '2024-12-04 00:55:31', 'potato'),
(8258, 29.6, 81, 53, 1, '2024-12-04 00:55:49', 'potato'),
(8259, 29.6, 81, 54, 1, '2024-12-04 00:55:55', 'potato'),
(8260, 29.6, 81, 55, 1, '2024-12-04 00:56:07', 'potato'),
(8261, 29.6, 81, 54, 1, '2024-12-04 00:56:13', 'potato'),
(8262, 29.6, 81, 53, 1, '2024-12-04 00:56:25', 'potato'),
(8263, 29.6, 81, 54, 1, '2024-12-04 00:56:44', 'potato'),
(8264, 29.6, 81, 55, 1, '2024-12-04 00:56:50', 'potato'),
(8265, 29.7, 81, 54, 1, '2024-12-04 00:56:56', 'potato'),
(8266, 29.7, 81, 53, 1, '2024-12-04 00:57:02', 'potato'),
(8267, 29.7, 81, 55, 1, '2024-12-04 00:57:14', 'potato'),
(8268, 29.7, 81, 52, 1, '2024-12-04 00:57:26', 'potato'),
(8269, 29.7, 81, 54, 1, '2024-12-04 00:57:32', 'potato'),
(8270, 29.7, 81, 53, 1, '2024-12-04 00:57:38', 'potato'),
(8271, 29.7, 81, 52, 1, '2024-12-04 00:57:44', 'potato'),
(8272, 29.7, 81, 54, 1, '2024-12-04 00:57:50', 'potato'),
(8273, 29.7, 81, 53, 1, '2024-12-04 00:58:03', 'potato'),
(8274, 29.7, 81, 54, 1, '2024-12-04 00:58:09', 'potato'),
(8275, 29.7, 81, 52, 1, '2024-12-04 00:58:15', 'potato'),
(8276, 29.7, 81, 54, 1, '2024-12-04 00:58:21', 'potato'),
(8277, 29.7, 81, 53, 1, '2024-12-04 00:58:33', 'potato'),
(8278, 29.7, 81, 55, 1, '2024-12-04 00:58:45', 'potato'),
(8279, 29.7, 81, 54, 1, '2024-12-04 00:58:57', 'potato'),
(8280, 29.7, 81, 53, 1, '2024-12-04 00:59:03', 'potato'),
(8281, 29.7, 81, 54, 1, '2024-12-04 00:59:21', 'potato'),
(8282, 29.7, 81, 53, 1, '2024-12-04 00:59:28', 'potato'),
(8283, 29.8, 81, 53, 1, '2024-12-04 00:59:46', 'potato'),
(8284, 29.8, 81, 52, 1, '2024-12-04 00:59:52', 'potato'),
(8285, 29.8, 81, 53, 1, '2024-12-04 00:59:58', 'potato'),
(8286, 29.8, 81, 52, 1, '2024-12-04 01:00:16', 'potato'),
(8287, 29.8, 81, 53, 1, '2024-12-04 01:00:28', 'potato'),
(8288, 29.8, 81, 52, 1, '2024-12-04 01:00:34', 'potato'),
(8289, 29.8, 81, 53, 1, '2024-12-04 01:00:41', 'potato'),
(8290, 29.8, 81, 52, 1, '2024-12-04 01:00:47', 'potato'),
(8291, 29.8, 81, 53, 1, '2024-12-04 01:00:53', 'potato'),
(8292, 29.8, 82, 53, 1, '2024-12-04 01:00:59', 'potato'),
(8293, 29.8, 82, 52, 1, '2024-12-04 01:01:11', 'potato'),
(8294, 29.8, 82, 53, 1, '2024-12-04 01:01:29', 'potato'),
(8295, 29.8, 82, 52, 1, '2024-12-04 01:01:35', 'potato'),
(8296, 29.8, 82, 53, 1, '2024-12-04 01:01:48', 'potato'),
(8297, 29.8, 82, 52, 1, '2024-12-04 01:01:54', 'potato'),
(8298, 29.8, 82, 53, 1, '2024-12-04 01:02:00', 'potato'),
(8299, 29.8, 82, 52, 1, '2024-12-04 01:02:12', 'potato'),
(8300, 29.8, 82, 53, 1, '2024-12-04 01:02:18', 'potato'),
(8301, 29.8, 82, 52, 1, '2024-12-04 01:02:30', 'potato'),
(8302, 29.8, 82, 53, 1, '2024-12-04 01:02:36', 'potato'),
(8303, 29.8, 82, 54, 1, '2024-12-04 01:02:42', 'potato'),
(8304, 29.8, 82, 53, 1, '2024-12-04 01:02:48', 'potato'),
(8305, 29.8, 82, 52, 1, '2024-12-04 01:02:55', 'potato'),
(8306, 29.8, 82, 53, 1, '2024-12-04 01:03:01', 'potato'),
(8307, 29.6, 78, 0, 1, '2024-12-04 01:43:23', 'potato'),
(8308, 29.7, 78, 0, 1, '2024-12-04 01:43:35', 'potato'),
(8309, 29.7, 79, 0, 1, '2024-12-04 01:43:41', 'potato'),
(8310, 29.7, 79, 52, 1, '2024-12-04 01:43:53', 'potato'),
(8311, 29.8, 79, 53, 1, '2024-12-04 01:43:59', 'potato'),
(8312, 29.8, 78, 39, 1, '2024-12-04 01:44:05', 'potato'),
(8313, 29.8, 78, 35, 1, '2024-12-04 01:44:11', 'potato'),
(8314, 29.9, 78, 35, 1, '2024-12-04 01:44:17', 'potato'),
(8315, 29.9, 78, 29, 1, '2024-12-04 01:44:23', 'potato'),
(8316, 29.9, 78, 34, 1, '2024-12-04 01:44:30', 'potato'),
(8317, 29.9, 78, 30, 1, '2024-12-04 01:44:36', 'potato'),
(8318, 29.9, 78, 33, 1, '2024-12-04 01:44:42', 'potato'),
(8319, 30, 78, 35, 1, '2024-12-04 01:44:49', 'potato'),
(8320, 30, 77, 33, 1, '2024-12-04 01:44:55', 'potato'),
(8321, 30, 77, 30, 1, '2024-12-04 01:45:01', 'potato'),
(8322, 30, 77, 34, 1, '2024-12-04 01:45:07', 'potato'),
(8323, 30.1, 75, 27, 1, '2024-12-04 01:47:47', 'potato'),
(8324, 30.1, 75, 32, 1, '2024-12-04 01:47:53', 'potato'),
(8325, 30.1, 75, 31, 1, '2024-12-04 01:47:59', 'potato'),
(8326, 30.3, 75, 3, 1, '2024-12-04 01:49:50', 'tomato'),
(8327, 30.3, 74, 3, 1, '2024-12-04 01:50:08', 'tomato'),
(8328, 30.3, 74, 2, 1, '2024-12-04 01:50:14', 'tomato'),
(8329, 30.3, 74, 3, 1, '2024-12-04 01:50:20', 'tomato'),
(8330, 30.4, 74, 2, 1, '2024-12-04 01:50:32', 'tomato'),
(8331, 30.3, 74, 3, 1, '2024-12-04 01:50:38', 'tomato'),
(8332, 30.4, 74, 3, 1, '2024-12-04 01:50:44', 'tomato'),
(8333, 30.5, 74, 4, 1, '2024-12-04 01:50:50', 'tomato'),
(8334, 29, 70, 0, 1, '2024-12-04 02:06:44', 'potato'),
(8335, 29, 70, 2, 1, '2024-12-04 02:06:56', 'potato'),
(8336, 29, 70, 5, 1, '2024-12-04 02:07:02', 'potato'),
(8337, 29, 70, 3, 1, '2024-12-04 02:07:08', 'potato'),
(8338, 29, 70, 0, 1, '2024-12-04 02:07:14', 'potato'),
(8339, 29, 70, 8, 1, '2024-12-04 02:07:51', 'potato'),
(8340, 29, 70, 1, 1, '2024-12-04 02:07:57', 'potato'),
(8341, 29, 70, 8, 1, '2024-12-04 02:08:09', 'potato'),
(8342, 29, 70, 3, 1, '2024-12-04 02:08:15', 'potato'),
(8343, 29, 71, 0, 1, '2024-12-04 02:08:33', 'potato'),
(8344, 29, 72, 62, 1, '2024-12-04 02:08:48', 'potato'),
(8345, 29, 72, 69, 1, '2024-12-04 02:08:55', 'potato'),
(8346, 29, 72, 67, 1, '2024-12-04 02:09:01', 'potato'),
(8347, 29, 73, 66, 1, '2024-12-04 02:09:07', 'potato'),
(8348, 29, 73, 65, 1, '2024-12-04 02:09:19', 'potato'),
(8349, 29, 73, 64, 1, '2024-12-04 02:09:32', 'potato'),
(8350, 29, 74, 64, 1, '2024-12-04 02:09:44', 'potato'),
(8351, 29, 74, 69, 1, '2024-12-04 02:09:50', 'potato'),
(8352, 29, 74, 68, 1, '2024-12-04 02:09:56', 'potato'),
(8353, 29, 74, 67, 1, '2024-12-04 02:10:08', 'potato'),
(8354, 28.9, 73, 67, 1, '2024-12-04 02:10:20', 'potato'),
(8355, 28.9, 73, 66, 1, '2024-12-04 02:10:57', 'potato'),
(8356, 28.9, 74, 66, 1, '2024-12-04 02:11:09', 'potato'),
(8357, 28.9, 74, 67, 1, '2024-12-04 02:11:22', 'potato'),
(8358, 28.9, 74, 66, 1, '2024-12-04 02:11:28', 'potato'),
(8359, 28.9, 74, 67, 1, '2024-12-04 02:11:58', 'potato'),
(8360, 28.9, 74, 0, 1, '2024-12-04 02:12:04', 'potato'),
(8361, 28.9, 74, 2, 1, '2024-12-04 02:12:10', 'potato'),
(8362, 28.9, 74, 1, 1, '2024-12-04 02:12:16', 'potato'),
(8363, 28.9, 74, 69, 1, '2024-12-04 02:12:23', 'potato'),
(8364, 28.9, 74, 74, 1, '2024-12-04 02:12:29', 'potato'),
(8365, 28.9, 74, 0, 1, '2024-12-04 02:12:35', 'potato'),
(8366, 28.9, 74, 68, 1, '2024-12-04 02:12:41', 'potato'),
(8367, 28.9, 74, 72, 1, '2024-12-04 02:12:53', 'potato'),
(8368, 28.9, 74, 0, 1, '2024-12-04 02:12:59', 'potato'),
(8369, 28.8, 74, 47, 1, '2024-12-04 02:13:11', 'potato'),
(8370, 28.8, 74, 58, 1, '2024-12-04 02:13:17', 'potato'),
(8371, 28.8, 73, 46, 1, '2024-12-04 02:13:24', 'potato'),
(8372, 28.8, 73, 0, 1, '2024-12-04 02:13:30', 'potato'),
(8373, 28.8, 73, 54, 1, '2024-12-04 02:13:36', 'potato'),
(8374, 28.8, 73, 53, 1, '2024-12-04 02:13:42', 'potato'),
(8375, 28.8, 73, 36, 1, '2024-12-04 02:13:48', 'potato'),
(8376, 28.8, 73, 34, 1, '2024-12-04 02:13:54', 'potato'),
(8377, 28.8, 73, 38, 1, '2024-12-04 02:14:00', 'potato'),
(8378, 28.8, 73, 37, 1, '2024-12-04 02:14:06', 'potato'),
(8379, 28.8, 73, 36, 1, '2024-12-04 02:14:12', 'potato'),
(8380, 28.8, 73, 35, 1, '2024-12-04 02:14:18', 'potato'),
(8381, 28.8, 73, 0, 1, '2024-12-04 02:14:24', 'potato'),
(8382, 28.8, 73, 53, 1, '2024-12-04 02:14:43', 'potato'),
(8383, 28.8, 73, 0, 1, '2024-12-04 02:14:49', 'potato'),
(8384, 28.8, 72, 49, 1, '2024-12-04 02:14:55', 'potato'),
(8385, 28.8, 72, 48, 1, '2024-12-04 02:15:01', 'potato'),
(8386, 28.8, 72, 47, 1, '2024-12-04 02:15:13', 'potato'),
(8387, 28.8, 72, 46, 1, '2024-12-04 02:15:19', 'potato'),
(8388, 28.8, 72, 53, 1, '2024-12-04 02:15:25', 'potato'),
(8389, 28.8, 72, 57, 1, '2024-12-04 02:15:31', 'potato'),
(8390, 28.8, 72, 56, 1, '2024-12-04 02:15:37', 'potato'),
(8391, 28.8, 72, 55, 1, '2024-12-04 02:15:43', 'potato'),
(8392, 28.8, 72, 54, 1, '2024-12-04 02:15:56', 'potato'),
(8393, 28.8, 72, 52, 1, '2024-12-04 02:16:02', 'potato'),
(8394, 28.8, 72, 51, 1, '2024-12-04 02:16:20', 'potato'),
(8395, 28.8, 73, 51, 1, '2024-12-04 02:16:35', 'potato'),
(8396, 28.8, 73, 50, 1, '2024-12-04 02:16:41', 'potato'),
(8397, 28.8, 73, 49, 1, '2024-12-04 02:17:11', 'potato'),
(8398, 28.8, 73, 50, 1, '2024-12-04 02:17:29', 'potato'),
(8399, 28.8, 72, 49, 1, '2024-12-04 02:17:35', 'potato'),
(8400, 28.8, 72, 48, 1, '2024-12-04 02:18:00', 'potato'),
(8401, 28.8, 72, 49, 1, '2024-12-04 02:18:06', 'potato'),
(8402, 28.8, 72, 48, 1, '2024-12-04 02:18:12', 'potato'),
(8403, 28.8, 73, 49, 1, '2024-12-04 02:18:30', 'potato'),
(8404, 28.8, 73, 48, 1, '2024-12-04 02:18:37', 'potato'),
(8405, 28.8, 72, 48, 1, '2024-12-04 02:18:49', 'potato'),
(8406, 28.8, 71, 48, 1, '2024-12-04 02:19:07', 'potato'),
(8407, 28.7, 71, 48, 1, '2024-12-04 02:19:13', 'potato'),
(8408, 28.7, 71, 49, 1, '2024-12-04 02:19:32', 'potato'),
(8409, 28.8, 71, 77, 1, '2024-12-04 02:19:38', 'potato'),
(8410, 28.8, 71, 75, 1, '2024-12-04 02:19:44', 'potato'),
(8411, 28.8, 72, 76, 1, '2024-12-04 02:19:56', 'potato'),
(8412, 28.8, 72, 75, 1, '2024-12-04 02:20:03', 'potato'),
(8413, 28.8, 72, 74, 1, '2024-12-04 02:20:15', 'potato'),
(8414, 28.8, 73, 73, 1, '2024-12-04 02:20:33', 'potato'),
(8415, 28.8, 73, 74, 1, '2024-12-04 02:20:39', 'potato'),
(8416, 28.8, 73, 73, 1, '2024-12-04 02:20:45', 'potato'),
(8417, 28.8, 72, 73, 1, '2024-12-04 02:21:03', 'potato'),
(8418, 28.8, 72, 72, 1, '2024-12-04 02:21:10', 'potato'),
(8419, 28.8, 73, 72, 1, '2024-12-04 02:21:22', 'potato'),
(8420, 28.8, 73, 71, 1, '2024-12-04 02:21:28', 'potato'),
(8421, 28.8, 73, 70, 1, '2024-12-04 02:21:40', 'potato'),
(8422, 28.8, 73, 69, 1, '2024-12-04 02:21:52', 'potato'),
(8423, 28.8, 73, 70, 1, '2024-12-04 02:21:58', 'potato'),
(8424, 28.8, 73, 69, 1, '2024-12-04 02:22:04', 'potato'),
(8425, 28.8, 73, 68, 1, '2024-12-04 02:22:17', 'potato'),
(8426, 28.8, 73, 67, 1, '2024-12-04 02:22:35', 'potato'),
(8427, 28.8, 73, 66, 1, '2024-12-04 02:22:59', 'potato'),
(8428, 28.8, 73, 65, 1, '2024-12-04 02:23:29', 'potato'),
(8429, 28.8, 73, 64, 1, '2024-12-04 02:23:54', 'potato'),
(8430, 28.8, 73, 63, 1, '2024-12-04 02:24:24', 'potato'),
(8431, 28.8, 73, 62, 1, '2024-12-04 02:25:07', 'potato'),
(8432, 28.8, 73, 63, 1, '2024-12-04 02:25:13', 'potato'),
(8433, 28.8, 73, 62, 1, '2024-12-04 02:25:19', 'potato'),
(8434, 28.8, 73, 61, 1, '2024-12-04 02:25:49', 'potato'),
(8435, 28.8, 73, 62, 1, '2024-12-04 02:26:07', 'potato'),
(8436, 28.8, 74, 61, 1, '2024-12-04 02:26:13', 'potato'),
(8437, 28.8, 74, 60, 1, '2024-12-04 02:26:32', 'potato'),
(8438, 28.8, 74, 59, 1, '2024-12-04 02:27:38', 'potato'),
(8439, 28.8, 74, 60, 1, '2024-12-04 02:27:57', 'potato'),
(8440, 28.8, 74, 59, 1, '2024-12-04 02:28:03', 'potato'),
(8441, 28.8, 74, 58, 1, '2024-12-04 02:28:33', 'potato'),
(8442, 28.8, 75, 58, 1, '2024-12-04 02:28:52', 'potato'),
(8443, 28.9, 75, 58, 1, '2024-12-04 02:30:07', 'potato'),
(8444, 28.9, 75, 57, 1, '2024-12-04 02:30:26', 'potato'),
(8445, 28.9, 76, 57, 1, '2024-12-04 02:31:26', 'potato'),
(8446, 28.9, 76, 56, 1, '2024-12-04 02:33:46', 'potato'),
(8447, 28.9, 77, 56, 1, '2024-12-04 02:33:52', 'potato'),
(8448, 28.9, 77, 57, 1, '2024-12-04 02:34:04', 'potato'),
(8449, 28.9, 77, 56, 1, '2024-12-04 02:34:10', 'potato'),
(8450, 28.9, 77, 57, 1, '2024-12-04 02:34:16', 'potato'),
(8451, 28.9, 77, 56, 1, '2024-12-04 02:34:22', 'potato'),
(8452, 28.9, 77, 57, 1, '2024-12-04 02:35:05', 'potato'),
(8453, 28.9, 77, 58, 1, '2024-12-04 02:35:30', 'potato'),
(8454, 28.9, 77, 57, 1, '2024-12-04 02:35:36', 'potato'),
(8455, 28.9, 78, 57, 1, '2024-12-04 02:36:36', 'potato'),
(8456, 28.9, 78, 56, 1, '2024-12-04 02:36:43', 'potato'),
(8457, 28.9, 78, 57, 1, '2024-12-04 02:37:07', 'potato'),
(8458, 28.9, 78, 56, 1, '2024-12-04 02:37:19', 'potato'),
(8459, 29, 78, 56, 1, '2024-12-04 02:38:07', 'potato'),
(8460, 29, 78, 55, 1, '2024-12-04 02:38:56', 'potato'),
(8461, 29, 78, 56, 1, '2024-12-04 02:39:08', 'potato'),
(8462, 29, 78, 55, 1, '2024-12-04 02:39:20', 'potato'),
(8463, 29, 78, 56, 1, '2024-12-04 02:39:45', 'potato'),
(8464, 29, 78, 55, 1, '2024-12-04 02:40:57', 'potato'),
(8465, 29, 78, 56, 1, '2024-12-04 02:41:16', 'potato'),
(8466, 29, 78, 55, 1, '2024-12-04 02:41:22', 'potato'),
(8467, 29, 78, 56, 1, '2024-12-04 02:41:34', 'potato'),
(8468, 29, 78, 55, 1, '2024-12-04 02:41:40', 'potato'),
(8469, 29, 78, 56, 1, '2024-12-04 02:42:10', 'potato'),
(8470, 29, 78, 55, 1, '2024-12-04 02:42:35', 'potato'),
(8471, 29, 78, 56, 1, '2024-12-04 02:42:41', 'potato'),
(8472, 29, 78, 55, 1, '2024-12-04 02:42:47', 'potato'),
(8473, 29, 78, 56, 1, '2024-12-04 02:42:59', 'potato'),
(8474, 29, 78, 55, 1, '2024-12-04 02:43:05', 'potato'),
(8475, 29, 78, 56, 1, '2024-12-04 02:44:13', 'potato'),
(8476, 29, 78, 55, 1, '2024-12-04 02:44:19', 'potato'),
(8477, 29, 78, 56, 1, '2024-12-04 02:44:43', 'potato'),
(8478, 29, 78, 55, 1, '2024-12-04 02:44:50', 'potato'),
(8479, 29, 78, 56, 1, '2024-12-04 02:45:02', 'potato'),
(8480, 29, 79, 55, 1, '2024-12-04 02:45:08', 'potato'),
(8481, 29, 79, 56, 1, '2024-12-04 02:46:39', 'potato'),
(8482, 29, 79, 55, 1, '2024-12-04 02:46:45', 'potato'),
(8483, 29, 79, 56, 1, '2024-12-04 02:48:40', 'potato'),
(8484, 29, 78, 55, 1, '2024-12-04 02:48:47', 'potato'),
(8485, 29, 78, 56, 1, '2024-12-04 02:50:00', 'potato'),
(8486, 29, 78, 55, 1, '2024-12-04 02:50:06', 'potato'),
(8487, 29, 78, 56, 1, '2024-12-04 02:50:15', 'potato'),
(8488, 29, 78, 55, 1, '2024-12-04 02:50:21', 'potato'),
(8489, 29, 78, 56, 1, '2024-12-04 02:50:52', 'potato'),
(8490, 29, 79, 56, 1, '2024-12-04 02:51:14', 'potato'),
(8491, 29, 79, 55, 1, '2024-12-04 02:51:57', 'potato'),
(8492, 29, 79, 56, 1, '2024-12-04 02:52:03', 'potato'),
(8493, 29, 79, 55, 1, '2024-12-04 02:52:16', 'potato'),
(8494, 29, 79, 56, 1, '2024-12-04 02:52:22', 'potato'),
(8495, 29, 79, 55, 1, '2024-12-04 02:54:30', 'potato'),
(8496, 29, 79, 56, 1, '2024-12-04 02:54:55', 'potato'),
(8497, 29, 79, 55, 1, '2024-12-04 02:55:07', 'potato'),
(8498, 29, 79, 56, 1, '2024-12-04 02:55:44', 'potato'),
(8499, 29, 79, 55, 1, '2024-12-04 02:55:50', 'potato'),
(8500, 28.9, 79, 55, 1, '2024-12-04 02:56:05', 'potato'),
(8501, 28.9, 78, 55, 1, '2024-12-04 02:56:17', 'potato'),
(8502, 28.9, 78, 56, 1, '2024-12-04 02:56:37', 'potato'),
(8503, 28.9, 78, 55, 1, '2024-12-04 02:57:01', 'potato'),
(8504, 28.9, 77, 56, 1, '2024-12-04 02:57:07', 'potato'),
(8505, 28.9, 77, 55, 1, '2024-12-04 02:57:14', 'potato'),
(8506, 28.9, 77, 56, 1, '2024-12-04 02:57:41', 'potato'),
(8507, 28.9, 77, 55, 1, '2024-12-04 02:58:21', 'potato'),
(8508, 28.9, 77, 56, 1, '2024-12-04 02:58:28', 'potato'),
(8509, 28.9, 77, 55, 1, '2024-12-04 02:58:34', 'potato'),
(8510, 28.9, 77, 56, 1, '2024-12-04 02:58:59', 'potato'),
(8511, 28.8, 78, 56, 1, '2024-12-04 03:01:26', 'potato'),
(8512, 28.8, 78, 0, 1, '2024-12-04 03:02:28', 'potato'),
(8513, 28.8, 78, 1, 1, '2024-12-04 03:03:04', 'potato'),
(8514, 28, 69, 5, 1, '2025-01-07 16:48:12', 'device1'),
(8515, 28.1, 69, 5, 1, '2025-01-07 16:48:18', 'device1'),
(8516, 28.1, 69, 4, 1, '2025-01-07 16:48:24', 'device1'),
(8517, 28.1, 69, 3, 1, '2025-01-07 16:48:48', 'device1'),
(8518, 28.1, 69, 2, 1, '2025-01-07 16:48:55', 'device1'),
(8519, 28.1, 69, 1, 1, '2025-01-07 16:49:01', 'device1'),
(8520, 28.1, 69, 0, 1, '2025-01-07 16:49:19', 'device1'),
(8521, 28.1, 69, 1, 1, '2025-01-07 16:50:01', 'device1'),
(8522, 28.1, 69, 0, 1, '2025-01-07 16:50:07', 'device1'),
(8523, 28.1, 69, 1, 1, '2025-01-07 16:50:19', 'device1'),
(8524, 28.1, 69, 13, 1, '2025-01-07 16:50:25', 'device1'),
(8525, 28.1, 69, 1, 1, '2025-01-07 16:50:32', 'device1'),
(8526, 28.1, 69, 3, 1, '2025-01-07 16:50:38', 'device1'),
(8527, 28.1, 69, 4, 1, '2025-01-07 16:51:08', 'device1'),
(8528, 28.1, 68, 4, 1, '2025-01-07 16:51:14', 'device1'),
(8529, 28.1, 68, 3, 1, '2025-01-07 16:51:20', 'device1'),
(8530, 28.2, 68, 4, 1, '2025-01-07 16:51:26', 'device1'),
(8531, 28.2, 68, 5, 1, '2025-01-07 16:51:56', 'device1'),
(8532, 28.2, 68, 4, 1, '2025-01-07 16:52:02', 'device1'),
(8533, 28.2, 68, 3, 1, '2025-01-07 16:52:21', 'device1'),
(8534, 28.2, 68, 4, 1, '2025-01-07 16:52:27', 'device1'),
(8535, 28.2, 68, 6, 1, '2025-01-07 16:52:33', 'device1'),
(8536, 28.2, 68, 5, 1, '2025-01-07 16:52:51', 'device1'),
(8537, 28.2, 68, 7, 1, '2025-01-07 16:52:57', 'device1'),
(8538, 28.2, 68, 8, 1, '2025-01-07 16:53:03', 'device1'),
(8539, 28.2, 68, 7, 1, '2025-01-07 16:53:15', 'device1'),
(8540, 28.2, 68, 6, 1, '2025-01-07 16:53:52', 'device1'),
(8541, 28.2, 68, 7, 1, '2025-01-07 16:54:10', 'device1'),
(8542, 28.2, 68, 6, 1, '2025-01-07 16:54:34', 'device1'),
(8543, 28.2, 68, 5, 1, '2025-01-07 16:55:16', 'device1'),
(8544, 28.2, 67, 5, 1, '2025-01-07 16:56:05', 'device1'),
(8545, 28.2, 67, 4, 1, '2025-01-07 16:56:11', 'device1'),
(8546, 28.2, 67, 3, 1, '2025-01-07 16:56:23', 'device1'),
(8547, 28.2, 67, 4, 1, '2025-01-07 16:56:29', 'device1'),
(8548, 28.2, 67, 3, 1, '2025-01-07 16:56:35', 'device1'),
(8549, 28.2, 67, 2, 1, '2025-01-07 16:59:24', 'device1'),
(8550, 28.2, 67, 3, 1, '2025-01-07 17:01:01', 'device1'),
(8551, 28.2, 67, 2, 1, '2025-01-07 17:01:07', 'device1'),
(8552, 28.2, 67, 3, 1, '2025-01-07 17:01:50', 'device1'),
(8553, 28.2, 67, 2, 1, '2025-01-07 17:01:56', 'device1'),
(8554, 28.2, 66, 2, 1, '2025-01-07 17:02:02', 'device1'),
(8555, 28.3, 66, 2, 1, '2025-01-07 17:02:44', 'device1'),
(8556, 28.3, 67, 3, 1, '2025-01-07 17:02:56', 'device1'),
(8557, 28.3, 67, 2, 1, '2025-01-07 17:03:02', 'device1'),
(8558, 28.3, 66, 2, 1, '2025-01-07 17:03:39', 'device1'),
(8559, 28.3, 66, 3, 1, '2025-01-07 17:04:15', 'device1'),
(8560, 28.2, 66, 2, 1, '2025-01-07 17:04:21', 'device1'),
(8561, 28.3, 66, 7, 1, '2025-01-07 17:05:10', 'device1'),
(8562, 28.2, 66, 7, 1, '2025-01-07 17:05:22', 'device1'),
(8563, 28.3, 66, 7, 1, '2025-01-07 17:05:34', 'device1'),
(8564, 28.3, 66, 8, 1, '2025-01-07 17:06:22', 'device1'),
(8565, 28.3, 66, 7, 1, '2025-01-07 17:06:28', 'device1'),
(8566, 28.3, 66, 8, 1, '2025-01-07 17:07:05', 'device1'),
(8567, 28.3, 66, 7, 1, '2025-01-07 17:07:11', 'device1'),
(8568, 28.3, 66, 8, 1, '2025-01-07 17:07:53', 'device1'),
(8569, 28.3, 66, 7, 1, '2025-01-07 17:07:59', 'device1'),
(8570, 28.2, 66, 7, 1, '2025-01-07 17:10:12', 'device1'),
(8571, 28.3, 66, 7, 1, '2025-01-07 17:10:49', 'device1'),
(8572, 28.3, 66, 8, 1, '2025-01-07 17:12:13', 'device1'),
(8573, 28.3, 66, 7, 1, '2025-01-07 17:12:56', 'device1'),
(8574, 28.2, 66, 7, 1, '2025-01-07 17:13:26', 'device1'),
(8575, 28.3, 66, 7, 1, '2025-01-07 17:13:32', 'device1'),
(8576, 28.2, 66, 7, 1, '2025-01-07 17:13:38', 'device1'),
(8577, 28.3, 66, 7, 1, '2025-01-07 17:13:50', 'device1'),
(8578, 28.3, 65, 8, 1, '2025-01-07 17:14:08', 'device1'),
(8579, 28.3, 65, 7, 1, '2025-01-07 17:14:14', 'device1'),
(8580, 28.3, 65, 8, 1, '2025-01-07 17:14:21', 'device1'),
(8581, 28.2, 65, 8, 1, '2025-01-07 17:15:09', 'device1'),
(8582, 28.3, 65, 8, 1, '2025-01-07 17:15:15', 'device1'),
(8583, 28.3, 66, 8, 1, '2025-01-07 17:15:21', 'device1'),
(8584, 28.2, 66, 8, 1, '2025-01-07 17:16:52', 'device1'),
(8585, 28.2, 66, 9, 1, '2025-01-07 17:17:04', 'device1'),
(8586, 28.2, 66, 8, 1, '2025-01-07 17:17:10', 'device1'),
(8587, 28.2, 66, 9, 1, '2025-01-07 17:17:52', 'device1'),
(8588, 28.2, 66, 8, 1, '2025-01-07 17:17:59', 'device1'),
(8589, 28.2, 66, 9, 1, '2025-01-07 17:18:35', 'device1'),
(8590, 28.2, 66, 8, 1, '2025-01-07 17:20:12', 'device1'),
(8591, 28.2, 65, 9, 1, '2025-01-07 17:20:18', 'device1'),
(8592, 28.2, 65, 8, 1, '2025-01-07 17:20:30', 'device1'),
(8593, 28.2, 65, 9, 1, '2025-01-07 17:20:36', 'device1'),
(8594, 28.3, 65, 9, 1, '2025-01-07 17:20:48', 'device1'),
(8595, 28.2, 65, 9, 1, '2025-01-07 17:21:00', 'device1'),
(8596, 28.2, 66, 9, 1, '2025-01-07 17:21:12', 'device1'),
(8597, 28.2, 65, 9, 1, '2025-01-07 17:22:37', 'device1'),
(8598, 28.2, 65, 10, 1, '2025-01-07 17:23:13', 'device1'),
(8599, 28.2, 65, 9, 1, '2025-01-07 17:23:56', 'device1'),
(8600, 28.2, 65, 10, 1, '2025-01-07 17:24:02', 'device1'),
(8601, 28.2, 65, 9, 1, '2025-01-07 17:24:26', 'device1'),
(8602, 28.2, 65, 10, 1, '2025-01-07 17:25:39', 'device1'),
(8603, 28.2, 65, 9, 1, '2025-01-07 17:25:45', 'device1'),
(8604, 28.2, 65, 10, 1, '2025-01-07 17:26:21', 'device1'),
(8605, 28.2, 65, 9, 1, '2025-01-07 17:26:27', 'device1'),
(8606, 28.2, 65, 8, 1, '2025-01-07 17:31:23', 'device1'),
(8607, 28.2, 65, 9, 1, '2025-01-07 17:35:07', 'device1'),
(8608, 28.2, 65, 8, 1, '2025-01-07 17:35:13', 'device1'),
(8609, 28.2, 66, 8, 1, '2025-01-07 17:35:38', 'device1'),
(8610, 28.2, 66, 7, 1, '2025-01-07 17:36:08', 'device1'),
(8611, 28.2, 66, 8, 1, '2025-01-07 17:36:32', 'device1'),
(8612, 28.2, 66, 7, 1, '2025-01-07 17:36:38', 'device1'),
(8613, 28.2, 65, 7, 1, '2025-01-07 17:37:14', 'device1'),
(8614, 28.2, 65, 11, 1, '2025-01-07 17:38:57', 'device1'),
(8615, 28.2, 65, 10, 1, '2025-01-07 17:39:28', 'device1'),
(8616, 28.2, 65, 11, 1, '2025-01-07 17:40:22', 'device1'),
(8617, 28.2, 65, 10, 1, '2025-01-07 17:40:28', 'device1'),
(8618, 28.2, 65, 9, 1, '2025-01-07 17:42:59', 'device1'),
(8619, 28.2, 65, 10, 1, '2025-01-07 17:43:42', 'device1'),
(8620, 28.2, 65, 9, 1, '2025-01-07 17:43:54', 'device1'),
(8621, 28.2, 65, 10, 1, '2025-01-07 17:44:06', 'device1'),
(8622, 28.2, 65, 9, 1, '2025-01-07 17:44:12', 'device1'),
(8623, 28.2, 65, 10, 1, '2025-01-07 17:44:54', 'device1'),
(8624, 28.2, 65, 9, 1, '2025-01-07 17:45:01', 'device1'),
(8625, 28.2, 66, 9, 1, '2025-01-07 17:53:35', 'device1'),
(8626, 28.1, 66, 9, 1, '2025-01-07 17:57:49', 'device1'),
(8627, 28.2, 66, 9, 1, '2025-01-07 17:58:13', 'device1'),
(8628, 28.1, 66, 9, 1, '2025-01-07 18:00:08', 'device1'),
(8629, 28.1, 65, 9, 1, '2025-01-07 18:04:34', 'device1'),
(8630, 28.1, 65, 10, 1, '2025-01-07 18:08:18', 'device1'),
(8631, 28.1, 65, 9, 1, '2025-01-07 18:22:49', 'device1'),
(8632, 28.1, 65, 10, 1, '2025-01-07 18:22:56', 'device1'),
(8633, 28.1, 65, 9, 1, '2025-01-07 18:23:14', 'device1'),
(8634, 28.1, 65, 10, 1, '2025-01-07 18:23:32', 'device1'),
(8635, 28.1, 65, 9, 1, '2025-01-07 18:23:38', 'device1'),
(8636, 28.1, 65, 10, 1, '2025-01-07 18:23:44', 'device1'),
(8637, 28.1, 65, 9, 1, '2025-01-07 18:23:56', 'device1'),
(8638, 28.1, 65, 10, 1, '2025-01-07 18:24:02', 'device1'),
(8639, 28.1, 65, 9, 1, '2025-01-07 18:24:14', 'device1'),
(8640, 28.1, 65, 10, 1, '2025-01-07 18:24:45', 'device1'),
(8641, 28.1, 65, 9, 1, '2025-01-07 18:24:51', 'device1'),
(8642, 28.1, 65, 10, 1, '2025-01-07 18:25:27', 'device1'),
(8643, 28.1, 65, 9, 1, '2025-01-07 18:25:39', 'device1'),
(8644, 28.1, 65, 10, 1, '2025-01-07 18:27:04', 'device1'),
(8645, 28.1, 65, 9, 1, '2025-01-07 18:27:10', 'device1'),
(8646, 28.1, 65, 10, 1, '2025-01-07 18:27:34', 'device1'),
(8647, 28.1, 65, 9, 1, '2025-01-07 18:27:40', 'device1'),
(8648, 28.1, 65, 10, 1, '2025-01-07 18:28:23', 'device1'),
(8649, 28.1, 65, 9, 1, '2025-01-07 18:28:29', 'device1'),
(8650, 28.1, 65, 10, 1, '2025-01-07 18:29:11', 'device1'),
(8651, 28.1, 65, 9, 1, '2025-01-07 18:29:17', 'device1'),
(8652, 28.1, 65, 10, 1, '2025-01-07 18:30:00', 'device1'),
(8653, 28.1, 65, 9, 1, '2025-01-07 18:30:06', 'device1'),
(8654, 28.1, 65, 10, 1, '2025-01-07 18:31:36', 'device1'),
(8655, 28.1, 65, 9, 1, '2025-01-07 18:31:43', 'device1'),
(8656, 28.1, 65, 10, 1, '2025-01-07 18:32:19', 'device1'),
(8657, 28.1, 65, 9, 1, '2025-01-07 18:32:25', 'device1'),
(8658, 28, 65, 9, 1, '2025-01-07 18:32:55', 'device1'),
(8659, 28.1, 65, 9, 1, '2025-01-07 18:33:19', 'device1'),
(8660, 28.1, 65, 16, 1, '2025-01-07 18:34:14', 'device1'),
(8661, 28.1, 65, 1, 1, '2025-01-07 18:34:20', 'device1'),
(8662, 28.1, 65, 4, 1, '2025-01-07 18:34:26', 'device1');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `task_name` varchar(255) NOT NULL,
  `period` enum('daily','weekly','monthly') NOT NULL,
  `next_run` datetime NOT NULL,
  `status` enum('active','inactive') DEFAULT 'inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `task_name`, `period`, `next_run`, `status`) VALUES
(1, 'watering', 'daily', '2024-12-03 02:04:53', 'inactive');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `sex` varchar(6) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `sex`, `username`, `password`) VALUES
(1, 'sample', 'sample', 'sample', 'Male', 'sample1', 'sample123'),
(2, 'sample', 'sample', 'sample', 'Male', 'hans123@gmail.com', 'sample123'),
(5, 'sample', 'sample', 'sample', 'Male', 'sample3@gmail.com', 'sample123');

-- --------------------------------------------------------

--
-- Table structure for table `watering_history`
--

CREATE TABLE `watering_history` (
  `id` int(11) NOT NULL,
  `watered_on` datetime NOT NULL,
  `status` enum('watered','not_watered') NOT NULL,
  `userid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `watering_history`
--

INSERT INTO `watering_history` (`id`, `watered_on`, `status`, `userid`) VALUES
(1, '2024-09-20 10:30:00', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `watering_schedule`
--

CREATE TABLE `watering_schedule` (
  `id` int(11) NOT NULL,
  `device_id` int(11) NOT NULL,
  `schedule_type` enum('daily','weekly','monthly') NOT NULL,
  `times_per_day` int(11) NOT NULL,
  `days_of_week` set('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday') DEFAULT NULL,
  `day_of_month` int(11) DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `next_watering` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `watering_time`
--

CREATE TABLE `watering_time` (
  `id` int(11) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `device_id` int(11) NOT NULL,
  `frequency` enum('daily','weekly','monthly') NOT NULL,
  `repeat_count` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `water_history`
--

CREATE TABLE `water_history` (
  `id` int(11) NOT NULL,
  `device_name` varchar(255) NOT NULL,
  `watered_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `message` text DEFAULT NULL,
  `userid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `water_history`
--

INSERT INTO `water_history` (`id`, `device_name`, `watered_on`, `message`, `userid`) VALUES
(1, 'potato', '2024-11-26 23:33:13', 'The plant has been watered for device potato.', NULL),
(2, 'potato', '2024-11-26 23:33:13', 'The plant has been watered for device potato.', NULL),
(3, 'potato', '2024-11-26 23:33:19', 'The plant has been watered for device potato.', NULL),
(4, 'potato', '2024-11-26 23:33:19', 'The plant has been watered for device potato.', NULL),
(5, 'potato', '2024-11-26 23:33:31', 'The plant has been watered for device potato.', NULL),
(6, 'potato', '2024-11-26 23:33:31', 'The plant has been watered for device potato.', NULL),
(7, 'potato', '2024-11-26 23:35:21', 'The plant has been watered for device potato.', NULL),
(8, 'potato', '2024-11-26 23:35:21', 'The plant has been watered for device potato.', NULL),
(9, 'potato', '2024-11-26 23:39:13', 'The plant has been watered for device potato.', NULL),
(10, 'potato', '2024-11-26 23:39:13', 'The plant has been watered for device potato.', NULL),
(11, 'potato', '2024-11-26 23:40:07', 'The plant has been watered for device potato.', NULL),
(12, 'potato', '2024-11-26 23:40:07', 'The plant has been watered for device potato.', NULL),
(13, 'potato', '2024-11-26 23:40:43', 'The plant has been watered for device potato.', NULL),
(14, 'potato', '2024-11-26 23:40:43', 'The plant has been watered for device potato.', NULL),
(15, 'potato', '2024-11-26 23:42:20', 'The plant has been watered for device potato.', NULL),
(16, 'potato', '2024-11-26 23:42:20', 'The plant has been watered for device potato.', NULL),
(17, 'potato', '2024-11-27 02:25:40', 'The plant has been watered for device potato.', NULL),
(18, 'potato', '2024-11-27 02:26:19', 'The plant has been watered for device potato.', NULL),
(19, 'potato', '2024-11-27 02:26:31', 'The plant has been watered for device potato.', NULL),
(20, 'potato', '2024-11-27 02:40:43', 'The plant has been watered for device potato.', NULL),
(21, 'potato', '2024-11-27 03:03:21', 'The plant has been watered for device potato.', NULL),
(22, 'potato', '2024-11-27 03:10:20', 'The plant has been watered for device potato.', NULL),
(23, 'potato', '2024-11-27 03:25:00', 'The plant has been watered for device potato.', NULL),
(24, 'potato', '2024-11-27 03:25:17', 'The plant has been watered for device potato.', NULL),
(25, 'potato', '2024-11-27 03:25:49', 'The plant has been watered for device potato.', NULL),
(26, 'potato', '2024-11-27 03:26:16', 'The plant has been watered for device potato.', NULL),
(27, 'potato', '2024-11-27 03:26:46', 'The plant has been watered for device potato.', NULL),
(28, 'potato', '2024-11-27 03:27:38', 'The plant has been watered for device potato.', NULL),
(29, 'potato', '2024-11-27 03:28:09', 'The plant has been watered for device potato.', NULL),
(30, 'potato', '2024-11-27 03:28:21', 'The plant has been watered for device potato.', NULL),
(31, 'potato', '2024-11-27 03:28:50', 'The plant has been watered for device potato.', NULL),
(32, 'potato', '2024-11-27 03:29:18', 'The plant has been watered for device potato.', NULL),
(33, 'potato', '2024-11-27 03:38:49', 'The plant has been watered for device potato.', NULL),
(34, 'potato', '2024-11-27 03:39:07', 'The plant has been watered for device potato.', NULL),
(35, 'potato', '2024-11-27 03:42:24', 'The plant has been watered for device potato.', NULL),
(36, 'potato', '2024-11-27 03:42:34', 'The plant has been watered for device potato.', NULL),
(37, 'potato', '2024-11-27 03:42:45', 'The plant has been watered for device potato.', NULL),
(38, 'potato', '2024-11-27 03:45:13', 'The plant has been watered for device potato.', NULL),
(39, 'potato', '2024-11-27 03:45:22', 'The plant has been watered for device potato.', NULL),
(40, 'potato', '2024-11-27 03:58:39', 'The plant has been watered for device potato.', NULL),
(41, 'potato', '2024-11-27 03:59:45', 'The plant has been watered for device potato.', NULL),
(42, 'potato', '2024-11-27 04:04:27', 'The plant has been watered for device potato.', NULL),
(43, 'potato', '2024-11-27 04:04:53', 'The plant has been watered for device potato.', NULL),
(44, 'potato', '2024-11-27 04:05:03', 'The plant has been watered for device potato.', NULL),
(45, 'potato', '2024-11-27 04:06:05', 'The plant has been watered for device potato.', NULL),
(46, 'potato', '2024-11-27 04:07:27', 'The plant has been watered for device potato.', NULL),
(47, 'potato', '2024-11-27 04:10:10', 'The plant has been watered for device potato.', NULL),
(48, 'potato', '2024-11-27 04:14:15', 'The plant has been watered for device potato.', NULL),
(49, 'potato', '2024-11-27 04:16:01', 'The plant has been watered for device potato.', NULL),
(50, 'potato', '2024-11-27 04:16:30', 'The plant has been watered for device potato.', NULL),
(51, 'potato', '2024-11-27 04:16:54', 'The plant has been watered for device potato.', NULL),
(52, 'potato', '2024-11-27 04:17:13', 'The plant has been watered for device potato.', NULL),
(53, 'potato', '2024-11-27 04:18:38', 'The plant has been watered for device potato.', NULL),
(54, 'potato', '2024-11-27 04:18:48', 'The plant has been watered for device potato.', NULL),
(55, 'potato', '2024-11-27 04:19:24', 'The plant has been watered for device potato.', NULL),
(56, 'potato', '2024-11-27 04:19:59', 'The plant has been watered for device potato.', NULL),
(57, 'potato', '2024-11-27 04:22:29', 'The plant has been watered for device potato.', NULL),
(58, 'potato', '2024-11-27 04:22:38', 'The plant has been watered for device potato.', NULL),
(59, 'potato', '2024-11-27 04:23:06', 'The plant has been watered for device potato.', NULL),
(60, 'potato', '2024-11-27 04:23:57', 'The plant has been watered for device potato.', NULL),
(61, 'potato', '2024-11-27 04:26:07', 'The plant has been watered for device potato.', NULL),
(62, 'potato', '2024-11-27 04:27:23', 'The plant has been watered for device potato.', NULL),
(63, 'potato', '2024-11-27 04:28:39', 'The plant has been watered for device potato.', NULL),
(64, 'potato', '2024-11-27 04:30:11', 'The plant has been watered for device potato.', NULL),
(65, 'potato', '2024-11-27 04:30:27', 'The plant has been watered for device potato.', NULL),
(66, 'potato', '2024-11-27 04:30:46', 'The plant has been watered for device potato.', NULL),
(67, 'potato', '2024-11-27 04:31:01', 'The plant has been watered for device potato.', NULL),
(68, 'potato', '2024-11-27 04:31:15', 'The plant has been watered for device potato.', NULL),
(69, 'potato', '2024-11-27 04:32:14', 'The plant has been watered for device potato.', NULL),
(70, 'potato', '2024-11-27 04:33:15', 'The plant has been watered for device potato.', NULL),
(71, 'potato', '2024-11-27 04:33:34', 'The plant has been watered for device potato.', NULL),
(72, 'potato', '2024-11-27 04:33:46', 'The plant has been watered for device potato.', NULL),
(73, 'potato', '2024-11-27 04:34:29', 'The plant has been watered for device potato.', NULL),
(74, 'potato', '2024-11-27 04:35:41', 'The plant has been watered for device potato.', NULL),
(75, 'potato', '2024-11-27 04:36:01', 'The plant has been watered for device potato.', NULL),
(76, 'potato', '2024-11-27 04:38:31', 'The plant has been watered for device potato.', NULL),
(77, 'potato', '2024-11-27 04:38:38', 'The plant has been watered for device potato.', NULL),
(78, 'potato', '2024-11-27 04:39:02', 'The plant has been watered for device potato.', NULL),
(79, 'potato', '2024-11-27 04:42:56', 'The plant has been watered for device potato.', NULL),
(80, 'potato', '2024-11-27 04:44:02', 'The plant has been watered for device potato.', NULL),
(81, 'potato', '2024-11-27 04:48:26', 'The plant has been watered for device potato.', NULL),
(82, 'potato', '2024-11-27 04:51:49', 'The plant has been watered for device potato.', NULL),
(83, 'potato', '2024-12-03 16:01:39', 'The plant has been watered for device potato.', NULL),
(84, 'potato', '2024-12-03 16:03:16', 'The plant has been watered for device potato.', NULL),
(85, 'potato', '2024-12-03 16:03:22', 'The plant has been watered for device potato.', NULL),
(86, 'potato', '2024-12-03 16:07:01', 'The plant has been watered for device potato.', NULL),
(87, 'potato', '2024-12-03 16:07:19', 'The plant has been watered for device potato.', NULL),
(88, 'potato', '2024-12-03 16:08:32', 'The plant has been watered for device potato.', NULL),
(89, 'potato', '2024-12-03 16:08:44', 'The plant has been watered for device potato.', NULL),
(90, 'potato', '2024-12-03 16:10:27', 'The plant has been watered for device potato.', NULL),
(91, 'potato', '2024-12-03 16:10:33', 'The plant has been watered for device potato.', NULL),
(92, 'potato', '2024-12-03 16:10:57', 'The plant has been watered for device potato.', NULL),
(93, 'potato', '2024-12-03 16:11:15', 'The plant has been watered for device potato.', NULL),
(94, 'potato', '2024-12-03 16:13:41', 'The plant has been watered for device potato.', NULL),
(95, 'potato', '2024-12-03 16:13:47', 'The plant has been watered for device potato.', NULL),
(96, 'potato', '2024-12-03 16:15:30', 'The plant has been watered for device potato.', NULL),
(97, 'potato', '2024-12-03 16:16:43', 'The plant has been watered for device potato.', NULL),
(98, 'potato', '2024-12-03 16:18:08', 'The plant has been watered for device potato.', NULL),
(99, 'potato', '2024-12-03 16:19:02', 'The plant has been watered for device potato.', NULL),
(100, 'potato', '2024-12-03 16:19:27', 'The plant has been watered for device potato.', NULL),
(101, 'potato', '2024-12-03 16:19:39', 'The plant has been watered for device potato.', NULL),
(102, 'potato', '2024-12-03 16:20:03', 'The plant has been watered for device potato.', NULL),
(103, 'potato', '2024-12-03 18:11:45', 'The plant has been watered for device potato.', NULL),
(104, 'potato', '2024-12-03 18:12:03', 'The plant has been watered for device potato.', NULL),
(105, 'potato', '2024-12-03 18:12:21', 'The plant has been watered for device potato.', NULL),
(106, 'potato', '2024-12-03 18:12:39', 'The plant has been watered for device potato.', NULL),
(107, 'potato', '2024-12-03 18:13:04', 'The plant has been watered for device potato.', NULL),
(108, 'potato', '2024-12-03 18:13:16', 'The plant has been watered for device potato.', NULL),
(109, 'potato', '2024-12-03 18:13:22', 'The plant has been watered for device potato.', NULL),
(110, 'potato', '2024-12-03 18:15:30', 'The plant has been watered for device potato.', NULL),
(111, 'potato', '2024-12-03 18:40:31', 'The plant has been watered for device potato.', NULL),
(112, 'potato', '2024-12-03 18:40:37', 'The plant has been watered for device potato.', NULL),
(113, 'potato', '2024-12-03 18:41:07', 'The plant has been watered for device potato.', NULL),
(114, 'potato', '2024-12-03 18:41:32', 'The plant has been watered for device potato.', NULL),
(115, 'potato', '2024-12-03 18:41:38', 'The plant has been watered for device potato.', NULL),
(116, 'potato', '2024-12-03 18:42:08', 'The plant has been watered for device potato.', NULL),
(117, 'potato', '2024-12-03 18:42:20', 'The plant has been watered for device potato.', NULL),
(118, 'potato', '2024-12-03 18:42:32', 'The plant has been watered for device potato.', NULL),
(119, 'potato', '2024-12-03 18:43:27', 'The plant has been watered for device potato.', NULL),
(120, 'potato', '2024-12-03 18:45:52', 'The plant has been watered for device potato.', NULL),
(121, 'potato', '2024-12-03 19:32:58', 'The plant has been watered for device potato.', NULL),
(122, 'potato', '2024-12-03 19:36:54', 'The plant has been watered for device potato.', NULL),
(123, 'potato', '2024-12-03 19:38:56', 'The plant has been watered for device potato.', NULL),
(124, 'potato', '2024-12-03 19:39:38', 'The plant has been watered for device potato.', NULL),
(125, 'potato', '2024-12-03 19:40:21', 'The plant has been watered for device potato.', NULL),
(126, 'potato', '2024-12-03 19:41:03', 'The plant has been watered for device potato.', NULL),
(127, 'potato', '2024-12-03 19:41:15', 'The plant has been watered for device potato.', NULL),
(128, 'potato', '2024-12-03 19:42:46', 'The plant has been watered for device potato.', NULL),
(129, 'potato', '2024-12-03 19:43:05', 'The plant has been watered for device potato.', NULL),
(130, 'potato', '2024-12-03 19:43:35', 'The plant has been watered for device potato.', NULL),
(131, 'potato', '2024-12-03 19:43:53', 'The plant has been watered for device potato.', NULL),
(132, 'potato', '2024-12-03 19:44:48', 'The plant has been watered for device potato.', NULL),
(133, 'potato', '2024-12-03 19:44:54', 'The plant has been watered for device potato.', NULL),
(134, 'potato', '2024-12-03 19:45:06', 'The plant has been watered for device potato.', NULL),
(135, 'potato', '2024-12-03 19:45:55', 'The plant has been watered for device potato.', NULL),
(136, 'potato', '2024-12-03 19:46:31', 'The plant has been watered for device potato.', NULL),
(137, 'potato', '2024-12-03 19:46:49', 'The plant has been watered for device potato.', NULL),
(138, 'potato', '2024-12-03 19:47:20', 'The plant has been watered for device potato.', NULL),
(139, 'potato', '2024-12-03 19:49:03', 'The plant has been watered for device potato.', NULL),
(140, 'potato', '2024-12-03 19:49:58', 'The plant has been watered for device potato.', NULL),
(141, 'potato', '2024-12-03 19:50:10', 'The plant has been watered for device potato.', NULL),
(142, 'potato', '2024-12-03 19:50:46', 'The plant has been watered for device potato.', NULL),
(143, 'potato', '2024-12-03 19:51:22', 'The plant has been watered for device potato.', NULL),
(144, 'potato', '2024-12-03 19:51:53', 'The plant has been watered for device potato.', NULL),
(145, 'potato', '2024-12-03 19:52:05', 'The plant has been watered for device potato.', NULL),
(146, 'potato', '2024-12-03 19:55:07', 'The plant has been watered for device potato.', NULL),
(147, 'potato', '2024-12-03 19:55:31', 'The plant has been watered for device potato.', NULL),
(148, 'potato', '2024-12-03 19:55:37', 'The plant has been watered for device potato.', NULL),
(149, 'potato', '2024-12-03 19:55:43', 'The plant has been watered for device potato.', NULL),
(150, 'potato', '2024-12-03 19:56:20', 'The plant has been watered for device potato.', NULL),
(151, 'potato', '2024-12-03 19:56:50', 'The plant has been watered for device potato.', NULL),
(152, 'potato', '2024-12-03 19:57:15', 'The plant has been watered for device potato.', NULL),
(153, 'potato', '2024-12-03 19:57:39', 'The plant has been watered for device potato.', NULL),
(154, 'potato', '2024-12-03 19:57:51', 'The plant has been watered for device potato.', NULL),
(155, 'potato', '2024-12-03 19:58:46', 'The plant has been watered for device potato.', NULL),
(156, 'potato', '2024-12-03 19:58:52', 'The plant has been watered for device potato.', NULL),
(157, 'potato', '2024-12-03 19:59:16', 'The plant has been watered for device potato.', NULL),
(158, 'potato', '2024-12-03 19:59:29', 'The plant has been watered for device potato.', NULL),
(159, 'potato', '2024-12-03 20:01:00', 'The plant has been watered for device potato.', NULL),
(160, 'potato', '2024-12-03 20:01:18', 'The plant has been watered for device potato.', NULL),
(161, 'potato', '2024-12-03 20:02:31', 'The plant has been watered for device potato.', NULL),
(162, 'potato', '2024-12-03 20:02:43', 'The plant has been watered for device potato.', NULL),
(163, 'potato', '2024-12-03 20:03:07', 'The plant has been watered for device potato.', NULL),
(164, 'potato', '2024-12-03 20:04:14', 'The plant has been watered for device potato.', NULL),
(165, 'potato', '2024-12-03 20:04:32', 'The plant has been watered for device potato.', NULL),
(166, 'potato', '2024-12-03 20:05:15', 'The plant has been watered for device potato.', NULL),
(167, 'potato', '2024-12-03 20:05:51', 'The plant has been watered for device potato.', NULL),
(168, 'potato', '2024-12-03 20:05:57', 'The plant has been watered for device potato.', NULL),
(169, 'potato', '2024-12-03 20:06:09', 'The plant has been watered for device potato.', NULL),
(170, 'potato', '2024-12-03 20:06:34', 'The plant has been watered for device potato.', NULL),
(171, 'potato', '2024-12-03 20:07:10', 'The plant has been watered for device potato.', NULL),
(172, 'potato', '2024-12-03 20:07:40', 'The plant has been watered for device potato.', NULL),
(173, 'potato', '2024-12-03 20:08:17', 'The plant has been watered for device potato.', NULL),
(174, 'potato', '2024-12-03 20:08:29', 'The plant has been watered for device potato.', NULL),
(175, 'potato', '2024-12-03 20:11:31', 'The plant has been watered for device potato.', NULL),
(176, 'potato', '2024-12-03 20:14:25', 'The plant has been watered for device potato.', NULL),
(177, 'potato', '2024-12-03 20:16:45', 'The plant has been watered for device potato.', NULL),
(178, 'potato', '2024-12-03 20:16:51', 'The plant has been watered for device potato.', NULL),
(179, 'potato', '2024-12-03 20:16:57', 'The plant has been watered for device potato.', NULL),
(180, 'potato', '2024-12-03 20:17:03', 'The plant has been watered for device potato.', NULL),
(181, 'potato', '2024-12-03 20:17:09', 'The plant has been watered for device potato.', NULL),
(182, 'potato', '2024-12-03 20:17:33', 'The plant has been watered for device potato.', NULL),
(183, 'potato', '2024-12-03 20:17:45', 'The plant has been watered for device potato.', NULL),
(184, 'potato', '2024-12-03 20:18:16', 'The plant has been watered for device potato.', NULL),
(185, 'potato', '2024-12-03 20:19:22', 'The plant has been watered for device potato.', NULL),
(186, 'potato', '2024-12-03 20:20:53', 'The plant has been watered for device potato.', NULL),
(187, 'potato', '2024-12-03 20:21:12', 'The plant has been watered for device potato.', NULL),
(188, 'potato', '2024-12-03 20:21:36', 'The plant has been watered for device potato.', NULL),
(189, 'potato', '2024-12-03 20:21:42', 'The plant has been watered for device potato.', NULL),
(190, 'potato', '2024-12-03 20:22:00', 'The plant has been watered for device potato.', NULL),
(191, 'potato', '2024-12-03 20:22:31', 'The plant has been watered for device potato.', NULL),
(192, 'potato', '2024-12-03 20:22:55', 'The plant has been watered for device potato.', NULL),
(193, 'potato', '2024-12-03 20:23:55', 'The plant has been watered for device potato.', NULL),
(194, 'potato', '2024-12-03 20:28:59', 'The plant has been watered for device potato.', NULL),
(195, 'potato', '2024-12-03 20:32:19', 'The plant has been watered for device potato.', NULL),
(196, 'potato', '2024-12-03 20:32:25', 'The plant has been watered for device potato.', NULL),
(197, 'potato', '2024-12-03 20:32:31', 'The plant has been watered for device potato.', NULL),
(198, 'potato', '2024-12-03 20:32:38', 'The plant has been watered for device potato.', NULL),
(199, 'potato', '2024-12-03 20:32:44', 'The plant has been watered for device potato.', NULL),
(200, 'potato', '2024-12-03 20:32:51', 'The plant has been watered for device potato.', NULL),
(201, 'potato', '2024-12-03 20:32:57', 'The plant has been watered for device potato.', NULL),
(202, 'potato', '2024-12-03 20:33:03', 'The plant has been watered for device potato.', NULL),
(203, 'potato', '2024-12-03 20:33:10', 'The plant has been watered for device potato.', NULL),
(204, 'potato', '2024-12-03 20:34:29', 'The plant has been watered for device potato.', NULL),
(205, 'potato', '2024-12-03 20:34:53', 'The plant has been watered for device potato.', NULL),
(206, 'potato', '2024-12-03 20:34:59', 'The plant has been watered for device potato.', NULL),
(207, 'potato', '2024-12-03 20:35:06', 'The plant has been watered for device potato.', NULL),
(208, 'potato', '2024-12-03 20:35:12', 'The plant has been watered for device potato.', NULL),
(209, 'potato', '2024-12-03 20:35:19', 'The plant has been watered for device potato.', NULL),
(210, 'potato', '2024-12-03 20:35:37', 'The plant has been watered for device potato.', NULL),
(211, 'potato', '2024-12-03 20:35:44', 'The plant has been watered for device potato.', NULL),
(212, 'potato', '2024-12-03 20:35:50', 'The plant has been watered for device potato.', NULL),
(213, 'potato', '2024-12-03 20:35:56', 'The plant has been watered for device potato.', NULL),
(214, 'potato', '2024-12-03 20:36:09', 'The plant has been watered for device potato.', NULL),
(215, 'potato', '2024-12-03 20:36:15', 'The plant has been watered for device potato.', NULL),
(216, 'potato', '2024-12-03 20:36:22', 'The plant has been watered for device potato.', NULL),
(217, 'potato', '2024-12-03 20:36:28', 'The plant has been watered for device potato.', NULL),
(218, 'potato', '2024-12-03 20:36:34', 'The plant has been watered for device potato.', NULL),
(219, 'potato', '2024-12-03 20:36:41', 'The plant has been watered for device potato.', NULL),
(220, 'potato', '2024-12-03 20:36:47', 'The plant has been watered for device potato.', NULL),
(221, 'potato', '2024-12-03 20:37:00', 'The plant has been watered for device potato.', NULL),
(222, 'potato', '2024-12-03 20:37:06', 'The plant has been watered for device potato.', NULL),
(223, 'potato', '2024-12-03 20:37:37', 'The plant has been watered for device potato.', NULL),
(224, 'potato', '2024-12-03 20:37:43', 'The plant has been watered for device potato.', NULL),
(225, 'potato', '2024-12-03 20:37:49', 'The plant has been watered for device potato.', NULL),
(226, 'potato', '2024-12-03 20:38:02', 'The plant has been watered for device potato.', NULL),
(227, 'potato', '2024-12-03 20:38:08', 'The plant has been watered for device potato.', NULL),
(228, 'potato', '2024-12-03 20:38:15', 'The plant has been watered for device potato.', NULL),
(229, 'potato', '2024-12-03 23:08:54', 'The plant has been watered for device potato.', NULL),
(230, 'potato', '2024-12-03 23:09:31', 'The plant has been watered for device potato.', NULL),
(231, 'potato', '2024-12-03 23:09:55', 'The plant has been watered for device potato.', NULL),
(232, 'potato', '2024-12-03 23:10:14', 'The plant has been watered for device potato.', NULL),
(233, 'potato', '2024-12-03 23:10:26', 'The plant has been watered for device potato.', NULL),
(234, 'potato', '2024-12-03 23:10:51', 'The plant has been watered for device potato.', NULL),
(235, 'potato', '2024-12-03 23:11:03', 'The plant has been watered for device potato.', NULL),
(236, 'potato', '2024-12-03 23:11:10', 'The plant has been watered for device potato.', NULL),
(237, 'potato', '2024-12-03 23:11:22', 'The plant has been watered for device potato.', NULL),
(238, 'potato', '2024-12-03 23:11:35', 'The plant has been watered for device potato.', NULL),
(239, 'potato', '2024-12-03 23:11:47', 'The plant has been watered for device potato.', NULL),
(240, 'potato', '2024-12-03 23:12:00', 'The plant has been watered for device potato.', NULL),
(241, 'potato', '2024-12-03 23:12:06', 'The plant has been watered for device potato.', NULL),
(242, 'potato', '2024-12-03 23:12:12', 'The plant has been watered for device potato.', NULL),
(243, 'potato', '2024-12-03 23:12:19', 'The plant has been watered for device potato.', NULL),
(244, 'potato', '2024-12-03 23:12:31', 'The plant has been watered for device potato.', NULL),
(245, 'potato', '2024-12-03 23:12:44', 'The plant has been watered for device potato.', NULL),
(246, 'potato', '2024-12-03 23:13:02', 'The plant has been watered for device potato.', NULL),
(247, 'potato', '2024-12-03 23:13:09', 'The plant has been watered for device potato.', NULL),
(248, 'potato', '2024-12-03 23:13:15', 'The plant has been watered for device potato.', NULL),
(249, 'potato', '2024-12-03 23:13:34', 'The plant has been watered for device potato.', NULL),
(250, 'potato', '2024-12-03 23:13:40', 'The plant has been watered for device potato.', NULL),
(251, 'potato', '2024-12-03 23:15:17', 'The plant has been watered for device potato.', NULL),
(252, 'potato', '2024-12-03 23:15:24', 'The plant has been watered for device potato.', NULL),
(253, 'potato', '2024-12-03 23:21:10', 'The plant has been watered for device potato.', NULL),
(254, 'potato', '2024-12-03 23:21:23', 'The plant has been watered for device potato.', NULL),
(255, 'potato', '2024-12-03 23:21:29', 'The plant has been watered for device potato.', NULL),
(256, 'potato', '2024-12-03 23:21:48', 'The plant has been watered for device potato.', NULL),
(257, 'potato', '2024-12-03 23:22:00', 'The plant has been watered for device potato.', NULL),
(258, 'potato', '2024-12-03 23:22:25', 'The plant has been watered for device potato.', NULL),
(259, 'potato', '2024-12-03 23:22:56', 'The plant has been watered for device potato.', NULL),
(260, 'potato', '2024-12-03 23:23:08', 'The plant has been watered for device potato.', NULL),
(261, 'potato', '2024-12-03 23:23:33', 'The plant has been watered for device potato.', NULL),
(262, 'potato', '2024-12-03 23:26:42', 'The plant has been watered for device potato.', NULL),
(263, 'potato', '2024-12-03 23:26:49', 'The plant has been watered for device potato.', NULL),
(264, 'potato', '2024-12-03 23:27:01', 'The plant has been watered for device potato.', NULL),
(265, 'potato', '2024-12-03 23:27:07', 'The plant has been watered for device potato.', NULL),
(266, 'potato', '2024-12-03 23:27:14', 'The plant has been watered for device potato.', NULL),
(267, 'potato', '2024-12-03 23:27:32', 'The plant has been watered for device potato.', NULL),
(268, 'potato', '2024-12-03 23:27:57', 'The plant has been watered for device potato.', NULL),
(269, 'potato', '2024-12-03 23:28:03', 'The plant has been watered for device potato.', NULL),
(270, 'potato', '2024-12-03 23:28:16', 'The plant has been watered for device potato.', NULL),
(271, 'potato', '2024-12-03 23:28:22', 'The plant has been watered for device potato.', NULL),
(272, 'potato', '2024-12-03 23:28:29', 'The plant has been watered for device potato.', NULL),
(273, 'potato', '2024-12-03 23:28:35', 'The plant has been watered for device potato.', NULL),
(274, 'potato', '2024-12-03 23:28:41', 'The plant has been watered for device potato.', NULL),
(275, 'potato', '2024-12-03 23:28:54', 'The plant has been watered for device potato.', NULL),
(276, 'potato', '2024-12-03 23:29:49', 'The plant has been watered for device potato.', NULL),
(277, 'potato', '2024-12-03 23:29:55', 'The plant has been watered for device potato.', NULL),
(278, 'potato', '2024-12-03 23:30:14', 'The plant has been watered for device potato.', NULL),
(279, 'potato', '2024-12-03 23:30:49', 'The plant has been watered for device potato.', NULL),
(280, 'potato', '2024-12-03 23:31:02', 'The plant has been watered for device potato.', NULL),
(281, 'potato', '2024-12-03 23:31:32', 'The plant has been watered for device potato.', NULL),
(282, 'potato', '2024-12-03 23:31:39', 'The plant has been watered for device potato.', NULL),
(283, 'potato', '2024-12-03 23:31:45', 'The plant has been watered for device potato.', NULL),
(284, 'potato', '2024-12-03 23:31:51', 'The plant has been watered for device potato.', NULL),
(285, 'potato', '2024-12-03 23:31:58', 'The plant has been watered for device potato.', NULL),
(286, 'potato', '2024-12-03 23:32:10', 'The plant has been watered for device potato.', NULL),
(287, 'potato', '2024-12-03 23:32:29', 'The plant has been watered for device potato.', NULL),
(288, 'potato', '2024-12-03 23:33:36', 'The plant has been watered for device potato.', NULL),
(289, 'potato', '2024-12-03 23:33:42', 'The plant has been watered for device potato.', NULL),
(290, 'potato', '2024-12-03 23:33:49', 'The plant has been watered for device potato.', NULL),
(291, 'potato', '2024-12-03 23:33:55', 'The plant has been watered for device potato.', NULL),
(292, 'potato', '2024-12-03 23:35:21', 'The plant has been watered for device potato.', NULL),
(293, 'potato', '2024-12-03 23:35:27', 'The plant has been watered for device potato.', NULL),
(294, 'potato', '2024-12-03 23:35:33', 'The plant has been watered for device potato.', NULL),
(295, 'potato', '2024-12-03 23:35:46', 'The plant has been watered for device potato.', NULL),
(296, 'potato', '2024-12-03 23:36:35', 'The plant has been watered for device potato.', NULL),
(297, 'potato', '2024-12-03 23:36:53', 'The plant has been watered for device potato.', NULL),
(298, 'potato', '2024-12-03 23:37:06', 'The plant has been watered for device potato.', NULL),
(299, 'potato', '2024-12-03 23:37:18', 'The plant has been watered for device potato.', NULL),
(300, 'potato', '2024-12-03 23:37:55', 'The plant has been watered for device potato.', NULL),
(301, 'potato', '2024-12-03 23:38:20', 'The plant has been watered for device potato.', NULL),
(302, 'potato', '2024-12-03 23:42:54', 'The plant has been watered for device potato.', NULL),
(303, 'potato', '2024-12-03 23:43:00', 'The plant has been watered for device potato.', NULL),
(304, 'potato', '2024-12-03 23:43:07', 'The plant has been watered for device potato.', NULL),
(305, 'potato', '2024-12-03 23:43:13', 'The plant has been watered for device potato.', NULL),
(306, 'potato', '2024-12-03 23:43:38', 'The plant has been watered for device potato.', NULL),
(307, 'potato', '2024-12-03 23:45:28', 'The plant has been watered for device potato.', NULL),
(308, 'potato', '2024-12-03 23:45:40', 'The plant has been watered for device potato.', NULL),
(309, 'potato', '2024-12-03 23:46:17', 'The plant has been watered for device potato.', NULL),
(310, 'potato', '2024-12-03 23:46:42', 'The plant has been watered for device potato.', NULL),
(311, 'potato', '2024-12-03 23:46:48', 'The plant has been watered for device potato.', NULL),
(312, 'potato', '2024-12-03 23:49:18', 'The plant has been watered for device potato.', NULL),
(313, 'potato', '2024-12-03 23:49:48', 'The plant has been watered for device potato.', NULL),
(314, 'potato', '2024-12-03 23:49:55', 'The plant has been watered for device potato.', NULL),
(315, 'potato', '2024-12-03 23:50:01', 'The plant has been watered for device potato.', NULL),
(316, 'potato', '2024-12-03 23:50:08', 'The plant has been watered for device potato.', NULL),
(317, 'potato', '2024-12-03 23:50:26', 'The plant has been watered for device potato.', NULL),
(318, 'potato', '2024-12-03 23:50:33', 'The plant has been watered for device potato.', NULL),
(319, 'potato', '2024-12-03 23:51:27', 'The plant has been watered for device potato.', NULL),
(320, 'potato', '2024-12-03 23:51:34', 'The plant has been watered for device potato.', NULL),
(321, 'potato', '2024-12-03 23:51:46', 'The plant has been watered for device potato.', NULL),
(322, 'potato', '2024-12-03 23:51:53', 'The plant has been watered for device potato.', NULL),
(323, 'potato', '2024-12-03 23:51:59', 'The plant has been watered for device potato.', NULL),
(324, 'potato', '2024-12-03 23:52:06', 'The plant has been watered for device potato.', NULL),
(325, 'potato', '2024-12-03 23:52:12', 'The plant has been watered for device potato.', NULL),
(326, 'potato', '2024-12-03 23:52:51', 'The plant has been watered for device potato.', NULL),
(327, 'potato', '2024-12-03 23:52:58', 'The plant has been watered for device potato.', NULL),
(328, 'potato', '2024-12-03 23:53:04', 'The plant has been watered for device potato.', NULL),
(329, 'potato', '2024-12-03 23:53:17', 'The plant has been watered for device potato.', NULL),
(330, 'potato', '2024-12-03 23:53:23', 'The plant has been watered for device potato.', NULL),
(331, 'potato', '2024-12-03 23:53:29', 'The plant has been watered for device potato.', NULL),
(332, 'potato', '2024-12-03 23:53:36', 'The plant has been watered for device potato.', NULL),
(333, 'potato', '2024-12-03 23:53:42', 'The plant has been watered for device potato.', NULL),
(334, 'potato', '2024-12-03 23:53:49', 'The plant has been watered for device potato.', NULL),
(335, 'potato', '2024-12-03 23:54:07', 'The plant has been watered for device potato.', NULL),
(336, 'potato', '2024-12-03 23:54:13', 'The plant has been watered for device potato.', NULL),
(337, 'potato', '2024-12-03 23:54:26', 'The plant has been watered for device potato.', NULL),
(338, 'potato', '2024-12-03 23:54:39', 'The plant has been watered for device potato.', NULL),
(339, 'potato', '2024-12-03 23:55:03', 'The plant has been watered for device potato.', NULL),
(340, 'potato', '2024-12-03 23:55:10', 'The plant has been watered for device potato.', NULL),
(341, 'potato', '2024-12-03 23:55:16', 'The plant has been watered for device potato.', NULL),
(342, 'potato', '2024-12-03 23:55:25', 'The plant has been watered for device potato.', NULL),
(343, 'potato', '2024-12-03 23:55:31', 'The plant has been watered for device potato.', NULL),
(344, 'potato', '2024-12-03 23:55:44', 'The plant has been watered for device potato.', NULL),
(345, 'potato', '2024-12-03 23:56:09', 'The plant has been watered for device potato.', NULL),
(346, 'potato', '2024-12-03 23:56:16', 'The plant has been watered for device potato.', NULL),
(347, 'potato', '2024-12-03 23:56:47', 'The plant has been watered for device potato.', NULL),
(348, 'potato', '2024-12-03 23:57:00', 'The plant has been watered for device potato.', NULL),
(349, 'potato', '2024-12-03 23:57:25', 'The plant has been watered for device potato.', NULL),
(350, 'potato', '2024-12-03 23:57:50', 'The plant has been watered for device potato.', NULL),
(351, 'potato', '2024-12-03 23:58:08', 'The plant has been watered for device potato.', NULL),
(352, 'potato', '2024-12-03 23:58:39', 'The plant has been watered for device potato.', NULL),
(353, 'potato', '2024-12-03 23:58:45', 'The plant has been watered for device potato.', NULL),
(354, 'potato', '2024-12-03 23:58:52', 'The plant has been watered for device potato.', NULL),
(355, 'potato', '2024-12-03 23:58:58', 'The plant has been watered for device potato.', NULL),
(356, 'potato', '2024-12-03 23:59:05', 'The plant has been watered for device potato.', NULL),
(357, 'potato', '2024-12-03 23:59:36', 'The plant has been watered for device potato.', NULL),
(358, 'potato', '2024-12-03 23:59:48', 'The plant has been watered for device potato.', NULL),
(359, 'potato', '2024-12-03 23:59:54', 'The plant has been watered for device potato.', NULL),
(360, 'potato', '2024-12-04 00:00:01', 'The plant has been watered for device potato.', NULL),
(361, 'potato', '2024-12-04 00:00:13', 'The plant has been watered for device potato.', NULL),
(362, 'potato', '2024-12-04 00:00:20', 'The plant has been watered for device potato.', NULL),
(363, 'potato', '2024-12-04 00:00:50', 'The plant has been watered for device potato.', NULL),
(364, 'potato', '2024-12-04 00:00:57', 'The plant has been watered for device potato.', NULL),
(365, 'potato', '2024-12-04 00:02:11', 'The plant has been watered for device potato.', NULL),
(366, 'potato', '2024-12-04 00:02:18', 'The plant has been watered for device potato.', NULL),
(367, 'potato', '2024-12-04 00:02:24', 'The plant has been watered for device potato.', NULL),
(368, 'potato', '2024-12-04 00:02:37', 'The plant has been watered for device potato.', NULL),
(369, 'potato', '2024-12-04 00:02:43', 'The plant has been watered for device potato.', NULL),
(370, 'potato', '2024-12-04 00:02:49', 'The plant has been watered for device potato.', NULL),
(371, 'potato', '2024-12-04 00:03:08', 'The plant has been watered for device potato.', NULL),
(372, 'potato', '2024-12-04 00:03:21', 'The plant has been watered for device potato.', NULL),
(373, 'potato', '2024-12-04 00:03:27', 'The plant has been watered for device potato.', NULL),
(374, 'potato', '2024-12-04 00:03:33', 'The plant has been watered for device potato.', NULL),
(375, 'potato', '2024-12-04 00:20:24', 'The plant has been watered for device potato.', NULL),
(376, 'potato', '2024-12-04 00:20:30', 'The plant has been watered for device potato.', NULL),
(377, 'potato', '2024-12-04 00:20:43', 'The plant has been watered for device potato.', NULL),
(378, 'potato', '2024-12-04 00:20:49', 'The plant has been watered for device potato.', NULL),
(379, 'potato', '2024-12-04 00:21:26', 'The plant has been watered for device potato.', NULL),
(380, 'potato', '2024-12-04 00:22:21', 'The plant has been watered for device potato.', NULL),
(381, 'potato', '2024-12-04 00:23:09', 'The plant has been watered for device potato.', NULL),
(382, 'potato', '2024-12-04 00:23:28', 'The plant has been watered for device potato.', NULL),
(383, 'potato', '2024-12-04 00:25:23', 'The plant has been watered for device potato.', NULL),
(384, 'potato', '2024-12-04 00:26:19', 'The plant has been watered for device potato.', NULL),
(385, 'potato', '2024-12-04 00:27:50', 'The plant has been watered for device potato.', NULL),
(386, 'potato', '2024-12-04 00:28:02', 'The plant has been watered for device potato.', NULL),
(387, 'potato', '2024-12-04 00:28:27', 'The plant has been watered for device potato.', NULL),
(388, 'potato', '2024-12-04 00:29:03', 'The plant has been watered for device potato.', NULL),
(389, 'potato', '2024-12-04 00:30:04', 'The plant has been watered for device potato.', NULL),
(390, 'potato', '2024-12-04 00:30:46', 'The plant has been watered for device potato.', NULL),
(391, 'potato', '2024-12-04 00:31:16', 'The plant has been watered for device potato.', NULL),
(392, 'potato', '2024-12-04 00:31:41', 'The plant has been watered for device potato.', NULL),
(393, 'potato', '2024-12-04 00:31:53', 'The plant has been watered for device potato.', NULL),
(394, 'potato', '2024-12-04 00:32:05', 'The plant has been watered for device potato.', NULL),
(395, 'potato', '2024-12-04 00:32:17', 'The plant has been watered for device potato.', NULL),
(396, 'potato', '2024-12-04 00:32:23', 'The plant has been watered for device potato.', NULL),
(397, 'potato', '2024-12-04 00:33:36', 'The plant has been watered for device potato.', NULL),
(398, 'potato', '2024-12-04 00:36:07', 'The plant has been watered for device potato.', NULL),
(399, 'potato', '2024-12-04 00:36:13', 'The plant has been watered for device potato.', NULL),
(400, 'potato', '2024-12-04 00:36:19', 'The plant has been watered for device potato.', NULL),
(401, 'potato', '2024-12-04 00:36:26', 'The plant has been watered for device potato.', NULL),
(402, 'potato', '2024-12-04 00:36:32', 'The plant has been watered for device potato.', NULL),
(403, 'potato', '2024-12-04 00:37:14', 'The plant has been watered for device potato.', NULL),
(404, 'potato', '2024-12-04 00:37:38', 'The plant has been watered for device potato.', NULL),
(405, 'potato', '2024-12-04 00:41:22', 'The plant has been watered for device potato.', NULL),
(406, 'potato', '2024-12-04 00:41:35', 'The plant has been watered for device potato.', NULL),
(407, 'potato', '2024-12-04 00:42:29', 'The plant has been watered for device potato.', NULL),
(408, 'potato', '2024-12-04 00:42:41', 'The plant has been watered for device potato.', NULL),
(409, 'potato', '2024-12-04 00:45:00', 'The plant has been watered for device potato.', NULL),
(410, 'potato', '2024-12-04 00:45:19', 'The plant has been watered for device potato.', NULL),
(411, 'potato', '2024-12-04 00:46:19', 'The plant has been watered for device potato.', NULL),
(412, 'potato', '2024-12-04 00:46:31', 'The plant has been watered for device potato.', NULL),
(413, 'potato', '2024-12-04 00:49:39', 'The plant has been watered for device potato.', NULL),
(414, 'potato', '2024-12-04 00:49:51', 'The plant has been watered for device potato.', NULL),
(415, 'potato', '2024-12-04 00:50:40', 'The plant has been watered for device potato.', NULL),
(416, 'potato', '2024-12-04 00:53:23', 'The plant has been watered for device potato.', NULL),
(417, 'potato', '2024-12-04 00:54:30', 'The plant has been watered for device potato.', NULL),
(418, 'potato', '2024-12-04 00:54:42', 'The plant has been watered for device potato.', NULL),
(419, 'potato', '2024-12-04 00:54:54', 'The plant has been watered for device potato.', NULL),
(420, 'potato', '2024-12-04 00:55:00', 'The plant has been watered for device potato.', NULL),
(421, 'potato', '2024-12-04 00:55:19', 'The plant has been watered for device potato.', NULL),
(422, 'potato', '2024-12-04 00:55:31', 'The plant has been watered for device potato.', NULL),
(423, 'potato', '2024-12-04 00:55:55', 'The plant has been watered for device potato.', NULL),
(424, 'potato', '2024-12-04 00:56:07', 'The plant has been watered for device potato.', NULL),
(425, 'potato', '2024-12-04 00:56:44', 'The plant has been watered for device potato.', NULL),
(426, 'potato', '2024-12-04 00:56:50', 'The plant has been watered for device potato.', NULL),
(427, 'potato', '2024-12-04 00:57:14', 'The plant has been watered for device potato.', NULL),
(428, 'potato', '2024-12-04 00:57:32', 'The plant has been watered for device potato.', NULL),
(429, 'potato', '2024-12-04 00:57:50', 'The plant has been watered for device potato.', NULL),
(430, 'potato', '2024-12-04 00:58:09', 'The plant has been watered for device potato.', NULL),
(431, 'potato', '2024-12-04 00:58:21', 'The plant has been watered for device potato.', NULL),
(432, 'potato', '2024-12-04 00:58:45', 'The plant has been watered for device potato.', NULL),
(433, 'potato', '2024-12-04 00:59:21', 'The plant has been watered for device potato.', NULL),
(434, 'potato', '2024-12-04 00:59:58', 'The plant has been watered for device potato.', NULL),
(435, 'potato', '2024-12-04 01:00:28', 'The plant has been watered for device potato.', NULL),
(436, 'potato', '2024-12-04 01:00:41', 'The plant has been watered for device potato.', NULL),
(437, 'potato', '2024-12-04 01:00:53', 'The plant has been watered for device potato.', NULL),
(438, 'potato', '2024-12-04 01:01:29', 'The plant has been watered for device potato.', NULL),
(439, 'potato', '2024-12-04 01:01:48', 'The plant has been watered for device potato.', NULL),
(440, 'potato', '2024-12-04 01:02:00', 'The plant has been watered for device potato.', NULL),
(441, 'potato', '2024-12-04 01:02:18', 'The plant has been watered for device potato.', NULL),
(442, 'potato', '2024-12-04 01:02:36', 'The plant has been watered for device potato.', NULL),
(443, 'potato', '2024-12-04 01:02:42', 'The plant has been watered for device potato.', NULL),
(444, 'potato', '2024-12-04 01:03:01', 'The plant has been watered for device potato.', NULL),
(445, 'potato', '2024-12-04 01:43:53', 'The plant has been watered for device potato.', NULL),
(446, 'potato', '2024-12-04 01:43:59', 'The plant has been watered for device potato.', NULL),
(447, 'potato', '2024-12-04 01:44:30', 'The plant has been watered for device potato.', NULL),
(448, 'potato', '2024-12-04 01:44:42', 'The plant has been watered for device potato.', NULL),
(449, 'potato', '2024-12-04 01:44:48', 'The plant has been watered for device potato.', NULL),
(450, 'potato', '2024-12-04 01:45:07', 'The plant has been watered for device potato.', NULL),
(451, 'potato', '2024-12-04 01:47:53', 'The plant has been watered for device potato.', NULL),
(452, 'potato', '2024-12-04 02:08:48', 'The plant has been watered for device potato.', NULL),
(453, 'potato', '2024-12-04 02:08:55', 'The plant has been watered for device potato.', NULL),
(454, 'potato', '2024-12-04 02:09:50', 'The plant has been watered for device potato.', NULL),
(455, 'potato', '2024-12-04 02:11:22', 'The plant has been watered for device potato.', NULL),
(456, 'potato', '2024-12-04 02:11:58', 'The plant has been watered for device potato.', NULL),
(457, 'potato', '2024-12-04 02:12:23', 'The plant has been watered for device potato.', NULL),
(458, 'potato', '2024-12-04 02:12:29', 'The plant has been watered for device potato.', NULL),
(459, 'potato', '2024-12-04 02:12:41', 'The plant has been watered for device potato.', NULL),
(460, 'potato', '2024-12-04 02:12:53', 'The plant has been watered for device potato.', NULL),
(461, 'potato', '2024-12-04 02:13:11', 'The plant has been watered for device potato.', NULL),
(462, 'potato', '2024-12-04 02:13:17', 'The plant has been watered for device potato.', NULL),
(463, 'potato', '2024-12-04 02:13:36', 'The plant has been watered for device potato.', NULL),
(464, 'potato', '2024-12-04 02:14:00', 'The plant has been watered for device potato.', NULL),
(465, 'potato', '2024-12-04 02:14:43', 'The plant has been watered for device potato.', NULL),
(466, 'potato', '2024-12-04 02:14:55', 'The plant has been watered for device potato.', NULL),
(467, 'potato', '2024-12-04 02:15:25', 'The plant has been watered for device potato.', NULL),
(468, 'potato', '2024-12-04 02:15:31', 'The plant has been watered for device potato.', NULL),
(469, 'potato', '2024-12-04 02:17:29', 'The plant has been watered for device potato.', NULL),
(470, 'potato', '2024-12-04 02:18:06', 'The plant has been watered for device potato.', NULL),
(471, 'potato', '2024-12-04 02:18:30', 'The plant has been watered for device potato.', NULL),
(472, 'potato', '2024-12-04 02:19:32', 'The plant has been watered for device potato.', NULL),
(473, 'potato', '2024-12-04 02:19:38', 'The plant has been watered for device potato.', NULL),
(474, 'potato', '2024-12-04 02:19:56', 'The plant has been watered for device potato.', NULL),
(475, 'potato', '2024-12-04 02:20:39', 'The plant has been watered for device potato.', NULL),
(476, 'potato', '2024-12-04 02:21:58', 'The plant has been watered for device potato.', NULL),
(477, 'potato', '2024-12-04 02:25:13', 'The plant has been watered for device potato.', NULL),
(478, 'potato', '2024-12-04 02:26:07', 'The plant has been watered for device potato.', NULL),
(479, 'potato', '2024-12-04 02:27:57', 'The plant has been watered for device potato.', NULL),
(480, 'potato', '2024-12-04 02:34:04', 'The plant has been watered for device potato.', NULL),
(481, 'potato', '2024-12-04 02:34:16', 'The plant has been watered for device potato.', NULL),
(482, 'potato', '2024-12-04 02:35:05', 'The plant has been watered for device potato.', NULL),
(483, 'potato', '2024-12-04 02:35:30', 'The plant has been watered for device potato.', NULL),
(484, 'potato', '2024-12-04 02:37:07', 'The plant has been watered for device potato.', NULL),
(485, 'potato', '2024-12-04 02:39:08', 'The plant has been watered for device potato.', NULL),
(486, 'potato', '2024-12-04 02:39:45', 'The plant has been watered for device potato.', NULL),
(487, 'potato', '2024-12-04 02:41:16', 'The plant has been watered for device potato.', NULL),
(488, 'potato', '2024-12-04 02:41:34', 'The plant has been watered for device potato.', NULL),
(489, 'potato', '2024-12-04 02:42:10', 'The plant has been watered for device potato.', NULL),
(490, 'potato', '2024-12-04 02:42:41', 'The plant has been watered for device potato.', NULL),
(491, 'potato', '2024-12-04 02:42:59', 'The plant has been watered for device potato.', NULL),
(492, 'potato', '2024-12-04 02:44:13', 'The plant has been watered for device potato.', NULL),
(493, 'potato', '2024-12-04 02:44:43', 'The plant has been watered for device potato.', NULL),
(494, 'potato', '2024-12-04 02:45:02', 'The plant has been watered for device potato.', NULL),
(495, 'potato', '2024-12-04 02:46:39', 'The plant has been watered for device potato.', NULL),
(496, 'potato', '2024-12-04 02:48:40', 'The plant has been watered for device potato.', NULL),
(497, 'potato', '2024-12-04 02:50:00', 'The plant has been watered for device potato.', NULL),
(498, 'potato', '2024-12-04 02:50:15', 'The plant has been watered for device potato.', NULL),
(499, 'potato', '2024-12-04 02:50:52', 'The plant has been watered for device potato.', NULL),
(500, 'potato', '2024-12-04 02:52:03', 'The plant has been watered for device potato.', NULL),
(501, 'potato', '2024-12-04 02:52:22', 'The plant has been watered for device potato.', NULL),
(502, 'potato', '2024-12-04 02:54:55', 'The plant has been watered for device potato.', NULL),
(503, 'potato', '2024-12-04 02:55:44', 'The plant has been watered for device potato.', NULL),
(504, 'potato', '2024-12-04 02:56:37', 'The plant has been watered for device potato.', NULL),
(505, 'potato', '2024-12-04 02:57:07', 'The plant has been watered for device potato.', NULL),
(506, 'potato', '2024-12-04 02:57:41', 'The plant has been watered for device potato.', NULL),
(507, 'potato', '2024-12-04 02:58:28', 'The plant has been watered for device potato.', NULL),
(508, 'potato', '2024-12-04 02:58:59', 'The plant has been watered for device potato.', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`CommentID`),
  ADD KEY `PostID` (`PostID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `controldata`
--
ALTER TABLE `controldata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_schedules`
--
ALTER TABLE `custom_schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `device_config`
--
ALTER TABLE `device_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_device_name_config` (`device_name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`post_id`,`comment_id`,`type`);

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
  ADD KEY `fk_device_id` (`device_id`);

--
-- Indexes for table `plants`
--
ALTER TABLE `plants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`PostID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `device_id` (`device_id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `device_id` (`device_id`);

--
-- Indexes for table `sensordata`
--
ALTER TABLE `sensordata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `watering_history`
--
ALTER TABLE `watering_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `watering_schedule`
--
ALTER TABLE `watering_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `device_id` (`device_id`);

--
-- Indexes for table `watering_time`
--
ALTER TABLE `watering_time`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_device` (`device_id`);

--
-- Indexes for table `water_history`
--
ALTER TABLE `water_history`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `CommentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `controldata`
--
ALTER TABLE `controldata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

--
-- AUTO_INCREMENT for table `custom_schedules`
--
ALTER TABLE `custom_schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `device_config`
--
ALTER TABLE `device_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8542;

--
-- AUTO_INCREMENT for table `plants`
--
ALTER TABLE `plants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `PostID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `sensordata`
--
ALTER TABLE `sensordata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8663;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `watering_history`
--
ALTER TABLE `watering_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `watering_schedule`
--
ALTER TABLE `watering_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `watering_time`
--
ALTER TABLE `watering_time`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `water_history`
--
ALTER TABLE `water_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=509;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `devices`
--
ALTER TABLE `devices`
  ADD CONSTRAINT `devices_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_device_id` FOREIGN KEY (`device_id`) REFERENCES `device_config` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `device_config` (`id`);

--
-- Constraints for table `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `device_config` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `watering_history`
--
ALTER TABLE `watering_history`
  ADD CONSTRAINT `watering_history_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `watering_schedule`
--
ALTER TABLE `watering_schedule`
  ADD CONSTRAINT `watering_schedule_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `device_config` (`id`);

--
-- Constraints for table `watering_time`
--
ALTER TABLE `watering_time`
  ADD CONSTRAINT `fk_device` FOREIGN KEY (`device_id`) REFERENCES `device_config` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
