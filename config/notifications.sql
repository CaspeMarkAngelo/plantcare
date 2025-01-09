-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2025 at 05:57 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

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
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `device_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `device_name` varchar(255) NOT NULL,
  `is_read` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `device_id`, `message`, `created_at`, `device_name`, `is_read`) VALUES
(1051, 26, 'Relay has been turned ON', '2025-01-09 12:35:53', 'device1', 0),
(1052, 26, 'Relay has been turned ON', '2025-01-09 12:35:53', 'device1', 0),
(1053, 26, 'Relay has been turned ON', '2025-01-09 12:35:53', 'device1', 0),
(1054, 26, 'Relay has been turned ON', '2025-01-09 12:35:54', 'device1', 0),
(1055, 26, 'Relay has been turned ON', '2025-01-09 12:35:54', 'device1', 0),
(1056, 26, 'Relay has been turned ON', '2025-01-09 12:35:54', 'device1', 0),
(1057, 26, 'Relay has been turned ON', '2025-01-09 12:35:54', 'device1', 0),
(1058, 26, 'Relay has been turned ON', '2025-01-09 12:35:54', 'device1', 0),
(1059, 26, 'Relay has been turned ON', '2025-01-09 12:35:54', 'device1', 0),
(1060, 26, 'Relay has been turned ON', '2025-01-09 12:35:54', 'device1', 0),
(1061, 26, 'Relay has been turned ON', '2025-01-09 12:35:55', 'device1', 0),
(1062, 26, 'Relay has been turned ON', '2025-01-09 12:35:55', 'device1', 0),
(1063, 26, 'Relay has been turned ON', '2025-01-09 12:35:55', 'device1', 0),
(1064, 26, 'Relay has been turned ON', '2025-01-09 12:35:55', 'device1', 0),
(1065, 26, 'Relay has been turned ON', '2025-01-09 12:35:55', 'device1', 0),
(1066, 26, 'Relay has been turned ON', '2025-01-09 12:35:55', 'device1', 0),
(1067, 26, 'Relay has been turned ON', '2025-01-09 12:35:56', 'device1', 0),
(1068, 26, 'Relay has been turned ON', '2025-01-09 12:35:56', 'device1', 0),
(1069, 26, 'Relay has been turned ON', '2025-01-09 12:35:56', 'device1', 0),
(1070, 26, 'Relay has been turned ON', '2025-01-09 12:35:56', 'device1', 0),
(1071, 26, 'Relay has been turned ON', '2025-01-09 12:35:56', 'device1', 0),
(1072, 26, 'Relay has been turned ON', '2025-01-09 12:35:56', 'device1', 0),
(1073, 26, 'Relay has been turned ON', '2025-01-09 12:35:56', 'device1', 0),
(1074, 26, 'Relay has been turned ON', '2025-01-09 12:35:57', 'device1', 0),
(1075, 26, 'Relay has been turned ON', '2025-01-09 12:35:57', 'device1', 0),
(1076, 26, 'Relay has been turned ON', '2025-01-09 12:35:57', 'device1', 0),
(1077, 26, 'Relay has been turned ON', '2025-01-09 12:35:57', 'device1', 0),
(1078, 26, 'Relay has been turned ON', '2025-01-09 12:35:57', 'device1', 0),
(1079, 26, 'Relay has been turned ON', '2025-01-09 12:35:57', 'device1', 0),
(1080, 26, 'Relay has been turned ON', '2025-01-09 12:35:57', 'device1', 0),
(1081, 26, 'Relay has been turned ON', '2025-01-09 12:35:57', 'device1', 0),
(1082, 26, 'Relay has been turned ON', '2025-01-09 12:35:58', 'device1', 0),
(1083, 26, 'Relay has been turned ON', '2025-01-09 12:35:58', 'device1', 0),
(1084, 26, 'Relay has been turned ON', '2025-01-09 12:35:58', 'device1', 0),
(1085, 26, 'Relay has been turned ON', '2025-01-09 12:35:58', 'device1', 0),
(1086, 26, 'Relay has been turned ON', '2025-01-09 12:35:58', 'device1', 0),
(1087, 26, 'Relay has been turned ON', '2025-01-09 12:35:58', 'device1', 0),
(1088, 26, 'Relay has been turned ON', '2025-01-09 12:35:58', 'device1', 0),
(1089, 26, 'Relay has been turned ON', '2025-01-09 12:35:59', 'device1', 0),
(1090, 26, 'Relay has been turned ON', '2025-01-09 12:35:59', 'device1', 0),
(1091, 26, 'Relay has been turned ON', '2025-01-09 12:35:59', 'device1', 0),
(1092, 26, 'Relay has been turned ON', '2025-01-09 12:35:59', 'device1', 0),
(1093, 26, 'Relay has been turned ON', '2025-01-09 12:35:59', 'device1', 0),
(1094, 26, 'Relay has been turned ON', '2025-01-09 12:35:59', 'device1', 0),
(1095, 26, 'Relay has been turned ON', '2025-01-09 12:35:59', 'device1', 0),
(1096, 26, 'Relay has been turned ON', '2025-01-09 12:36:00', 'device1', 0),
(1097, 26, 'Relay has been turned ON', '2025-01-09 12:36:00', 'device1', 0),
(1098, 26, 'Relay has been turned ON', '2025-01-09 12:36:00', 'device1', 0),
(1099, 26, 'Relay has been turned ON', '2025-01-09 12:36:00', 'device1', 0),
(1100, 26, 'Relay has been turned ON', '2025-01-09 12:36:00', 'device1', 0),
(1101, 26, 'Relay has been turned ON', '2025-01-09 12:36:00', 'device1', 0),
(1102, 26, 'Relay has been turned ON', '2025-01-09 12:36:00', 'device1', 0),
(1103, 26, 'Relay has been turned ON', '2025-01-09 12:36:01', 'device1', 0),
(1104, 26, 'Relay has been turned ON', '2025-01-09 12:36:01', 'device1', 0),
(1105, 26, 'Relay has been turned ON', '2025-01-09 12:36:01', 'device1', 0),
(1106, 26, 'Relay has been turned ON', '2025-01-09 12:36:01', 'device1', 0),
(1107, 26, 'Relay has been turned ON', '2025-01-09 12:36:01', 'device1', 0),
(1108, 26, 'Relay has been turned ON', '2025-01-09 12:36:01', 'device1', 0),
(1109, 26, 'Relay has been turned ON', '2025-01-09 12:36:01', 'device1', 0),
(1110, 26, 'Relay has been turned ON', '2025-01-09 12:36:01', 'device1', 0),
(1111, 26, 'Relay has been turned ON', '2025-01-09 12:36:02', 'device1', 0),
(1112, 26, 'Relay has been turned ON', '2025-01-09 12:36:02', 'device1', 0),
(1113, 26, 'Relay has been turned ON', '2025-01-09 12:36:02', 'device1', 0),
(1114, 26, 'Relay has been turned ON', '2025-01-09 12:36:02', 'device1', 0),
(1115, 26, 'Relay has been turned ON', '2025-01-09 12:36:02', 'device1', 0),
(1116, 26, 'Relay has been turned ON', '2025-01-09 12:36:02', 'device1', 0),
(1117, 26, 'Relay has been turned ON', '2025-01-09 12:36:03', 'device1', 0),
(1118, 26, 'Relay has been turned ON', '2025-01-09 12:36:03', 'device1', 0),
(1119, 26, 'Relay has been turned ON', '2025-01-09 12:36:03', 'device1', 0),
(1120, 26, 'Relay has been turned ON', '2025-01-09 12:36:03', 'device1', 0),
(1121, 26, 'Relay has been turned ON', '2025-01-09 12:36:04', 'device1', 0),
(1122, 26, 'Relay has been turned ON', '2025-01-09 12:36:05', 'device1', 0),
(1123, 26, 'Relay has been turned ON', '2025-01-09 12:36:06', 'device1', 0),
(1124, 26, 'Relay has been turned ON', '2025-01-09 12:36:07', 'device1', 0),
(1125, 26, 'Relay has been turned ON', '2025-01-09 12:36:08', 'device1', 0),
(1126, 26, 'Relay has been turned ON', '2025-01-09 12:36:09', 'device1', 0),
(1127, 26, 'Relay has been turned ON', '2025-01-09 12:36:10', 'device1', 0),
(1128, 26, 'Relay has been turned ON', '2025-01-09 12:36:11', 'device1', 0),
(1129, 26, 'Relay has been turned ON', '2025-01-09 12:36:12', 'device1', 0),
(1130, 26, 'Relay has been turned ON', '2025-01-09 12:36:13', 'device1', 0),
(1131, 26, 'Relay has been turned ON', '2025-01-09 12:36:13', 'device1', 0),
(1132, 26, 'Relay has been turned ON', '2025-01-09 12:36:13', 'device1', 0),
(1133, 26, 'Relay has been turned ON', '2025-01-09 12:36:14', 'device1', 0),
(1134, 26, 'Relay has been turned ON', '2025-01-09 12:36:15', 'device1', 0),
(1135, 26, 'Relay has been turned ON', '2025-01-09 12:36:15', 'device1', 0),
(1136, 26, 'Relay has been turned ON', '2025-01-09 12:36:15', 'device1', 0),
(1137, 26, 'Relay has been turned ON', '2025-01-09 12:36:16', 'device1', 0),
(1138, 26, 'Relay has been turned ON', '2025-01-09 12:36:16', 'device1', 0),
(1139, 26, 'Relay has been turned ON', '2025-01-09 12:36:17', 'device1', 0),
(1140, 26, 'Relay has been turned ON', '2025-01-09 12:36:18', 'device1', 0),
(1141, 26, 'Relay has been turned ON', '2025-01-09 12:36:18', 'device1', 0),
(1142, 26, 'Relay has been turned ON', '2025-01-09 12:36:19', 'device1', 0),
(1143, 26, 'Relay has been turned ON', '2025-01-09 12:36:19', 'device1', 0),
(1144, 26, 'Relay has been turned ON', '2025-01-09 12:36:19', 'device1', 0),
(1145, 26, 'Relay has been turned ON', '2025-01-09 12:36:19', 'device1', 0),
(1146, 26, 'Relay has been turned ON', '2025-01-09 12:36:19', 'device1', 0),
(1147, 26, 'Relay has been turned ON', '2025-01-09 12:36:19', 'device1', 0),
(1148, 26, 'Relay has been turned ON', '2025-01-09 12:36:19', 'device1', 0),
(1149, 26, 'Relay has been turned ON', '2025-01-09 12:36:20', 'device1', 0),
(1150, 26, 'Relay has been turned ON', '2025-01-09 12:36:20', 'device1', 0),
(1151, 26, 'Relay has been turned ON', '2025-01-09 12:36:20', 'device1', 0),
(1152, 26, 'Relay has been turned ON', '2025-01-09 12:36:20', 'device1', 0),
(1153, 26, 'Relay has been turned ON', '2025-01-09 12:36:20', 'device1', 0),
(1154, 26, 'Relay has been turned ON', '2025-01-09 12:36:20', 'device1', 0),
(1155, 26, 'Relay has been turned ON', '2025-01-09 12:36:20', 'device1', 0),
(1156, 26, 'Relay has been turned ON', '2025-01-09 12:36:21', 'device1', 0),
(1157, 26, 'Relay has been turned ON', '2025-01-09 12:36:21', 'device1', 0),
(1158, 26, 'Relay has been turned ON', '2025-01-09 12:36:21', 'device1', 0),
(1159, 26, 'Relay has been turned ON', '2025-01-09 12:36:21', 'device1', 0),
(1160, 26, 'Relay has been turned ON', '2025-01-09 12:36:21', 'device1', 0),
(1161, 26, 'Relay has been turned ON', '2025-01-09 12:39:41', 'device1', 0),
(1162, 26, 'Relay has been turned ON', '2025-01-09 12:39:41', 'device1', 0),
(1163, 26, 'Relay has been turned ON', '2025-01-09 12:39:41', 'device1', 0),
(1164, 26, 'Relay has been turned ON', '2025-01-09 12:39:41', 'device1', 0),
(1165, 26, 'Relay has been turned ON', '2025-01-09 12:39:42', 'device1', 0),
(1166, 26, 'Relay has been turned ON', '2025-01-09 12:39:42', 'device1', 0),
(1167, 26, 'Relay has been turned ON', '2025-01-09 12:39:42', 'device1', 0),
(1168, 26, 'Relay has been turned ON', '2025-01-09 12:39:42', 'device1', 0),
(1169, 26, 'Relay has been turned ON', '2025-01-09 12:39:42', 'device1', 0),
(1170, 26, 'Relay has been turned ON', '2025-01-09 12:39:42', 'device1', 0),
(1171, 26, 'Relay has been turned ON', '2025-01-09 12:39:42', 'device1', 0),
(1172, 26, 'Relay has been turned ON', '2025-01-09 12:39:43', 'device1', 0),
(1173, 26, 'Relay has been turned ON', '2025-01-09 12:39:43', 'device1', 0),
(1174, 26, 'Relay has been turned ON', '2025-01-09 12:39:43', 'device1', 0),
(1175, 26, 'Relay has been turned ON', '2025-01-09 12:39:43', 'device1', 0),
(1176, 26, 'Relay has been turned ON', '2025-01-09 12:39:43', 'device1', 0),
(1177, 26, 'Relay has been turned ON', '2025-01-09 12:39:43', 'device1', 0),
(1178, 26, 'Relay has been turned ON', '2025-01-09 12:39:43', 'device1', 0),
(1179, 26, 'Relay has been turned ON', '2025-01-09 12:39:44', 'device1', 0),
(1180, 26, 'Relay has been turned ON', '2025-01-09 12:39:44', 'device1', 0),
(1181, 26, 'Relay has been turned ON', '2025-01-09 12:39:44', 'device1', 0),
(1182, 26, 'Relay has been turned ON', '2025-01-09 12:39:44', 'device1', 0),
(1183, 26, 'Relay has been turned ON', '2025-01-09 12:39:44', 'device1', 0),
(1184, 26, 'Relay has been turned ON', '2025-01-09 12:39:44', 'device1', 0),
(1185, 26, 'Relay has been turned ON', '2025-01-09 12:39:44', 'device1', 0),
(1186, 26, 'Relay has been turned ON', '2025-01-09 12:39:45', 'device1', 0),
(1187, 26, 'Relay has been turned ON', '2025-01-09 12:39:45', 'device1', 0),
(1188, 26, 'Relay has been turned ON', '2025-01-09 12:39:45', 'device1', 0),
(1189, 26, 'Relay has been turned ON', '2025-01-09 12:39:45', 'device1', 0),
(1190, 26, 'Relay has been turned ON', '2025-01-09 12:39:45', 'device1', 0),
(1191, 26, 'Relay has been turned ON', '2025-01-09 12:39:45', 'device1', 0),
(1192, 26, 'Relay has been turned ON', '2025-01-09 12:39:45', 'device1', 0),
(1193, 26, 'Relay has been turned ON', '2025-01-09 12:39:46', 'device1', 0),
(1194, 26, 'Relay has been turned ON', '2025-01-09 12:39:46', 'device1', 0),
(1195, 26, 'Relay has been turned ON', '2025-01-09 12:39:46', 'device1', 0),
(1196, 26, 'Relay has been turned ON', '2025-01-09 12:39:46', 'device1', 0),
(1197, 26, 'Relay has been turned ON', '2025-01-09 12:39:46', 'device1', 0),
(1198, 26, 'Relay has been turned ON', '2025-01-09 12:39:46', 'device1', 0),
(1199, 26, 'Relay has been turned ON', '2025-01-09 12:39:46', 'device1', 0),
(1200, 26, 'Relay has been turned ON', '2025-01-09 12:39:47', 'device1', 0),
(1201, 26, 'Relay has been turned ON', '2025-01-09 12:39:48', 'device1', 0),
(1202, 26, 'Relay has been turned ON', '2025-01-09 12:39:49', 'device1', 0),
(1203, 26, 'Relay has been turned ON', '2025-01-09 12:39:50', 'device1', 0),
(1204, 26, 'Relay has been turned ON', '2025-01-09 12:39:50', 'device1', 0),
(1205, 26, 'Relay has been turned ON', '2025-01-09 12:39:50', 'device1', 0),
(1206, 26, 'Relay has been turned ON', '2025-01-09 12:39:50', 'device1', 0),
(1207, 26, 'Relay has been turned ON', '2025-01-09 12:39:51', 'device1', 0),
(1208, 26, 'Relay has been turned ON', '2025-01-09 12:39:51', 'device1', 0),
(1209, 26, 'Relay has been turned ON', '2025-01-09 12:39:51', 'device1', 0),
(1210, 26, 'Relay has been turned ON', '2025-01-09 12:39:51', 'device1', 0),
(1211, 26, 'Relay has been turned ON', '2025-01-09 12:39:52', 'device1', 0),
(1212, 26, 'Relay has been turned ON', '2025-01-09 12:39:53', 'device1', 0),
(1213, 26, 'Relay has been turned ON', '2025-01-09 12:39:54', 'device1', 0),
(1214, 26, 'Relay has been turned ON', '2025-01-09 12:39:55', 'device1', 0),
(1215, 26, 'Relay has been turned ON', '2025-01-09 12:39:55', 'device1', 0),
(1216, 26, 'Relay has been turned ON', '2025-01-09 12:39:55', 'device1', 0),
(1217, 26, 'Relay has been turned ON', '2025-01-09 12:39:55', 'device1', 0),
(1218, 26, 'Relay has been turned ON', '2025-01-09 12:39:56', 'device1', 0),
(1219, 26, 'Relay has been turned ON', '2025-01-09 12:39:56', 'device1', 0),
(1220, 26, 'Relay has been turned ON', '2025-01-09 12:39:56', 'device1', 0),
(1221, 26, 'Relay has been turned ON', '2025-01-09 12:39:56', 'device1', 0),
(1222, 26, 'Relay has been turned ON', '2025-01-09 12:39:56', 'device1', 0),
(1223, 26, 'Relay has been turned ON', '2025-01-09 12:39:56', 'device1', 0),
(1224, 26, 'Relay has been turned ON', '2025-01-09 12:39:56', 'device1', 0),
(1225, 26, 'Relay has been turned ON', '2025-01-09 12:39:57', 'device1', 0),
(1226, 26, 'Relay has been turned ON', '2025-01-09 12:39:57', 'device1', 0),
(1227, 26, 'Relay has been turned ON', '2025-01-09 12:39:57', 'device1', 0),
(1228, 26, 'Relay has been turned ON', '2025-01-09 12:39:57', 'device1', 0),
(1229, 26, 'Relay has been turned ON', '2025-01-09 12:39:57', 'device1', 0),
(1230, 26, 'Relay has been turned ON', '2025-01-09 12:39:57', 'device1', 0),
(1231, 26, 'Relay has been turned ON', '2025-01-09 12:39:58', 'device1', 0),
(1232, 26, 'Relay has been turned ON', '2025-01-09 12:39:59', 'device1', 0),
(1233, 26, 'Relay has been turned ON', '2025-01-09 12:40:00', 'device1', 0),
(1234, 26, 'Relay has been turned ON', '2025-01-09 12:40:01', 'device1', 0),
(1235, 26, 'Relay has been turned ON', '2025-01-09 12:40:01', 'device1', 0),
(1236, 26, 'Relay has been turned ON', '2025-01-09 12:40:02', 'device1', 0),
(1237, 26, 'Relay has been turned ON', '2025-01-09 12:40:02', 'device1', 0),
(1238, 26, 'Relay has been turned ON', '2025-01-09 12:40:02', 'device1', 0),
(1239, 26, 'Relay has been turned ON', '2025-01-09 12:40:03', 'device1', 0),
(1240, 26, 'Relay has been turned ON', '2025-01-09 12:40:03', 'device1', 0),
(1241, 26, 'Relay has been turned ON', '2025-01-09 12:40:03', 'device1', 0),
(1242, 26, 'Relay has been turned ON', '2025-01-09 12:40:03', 'device1', 0),
(1243, 26, 'Relay has been turned ON', '2025-01-09 12:40:04', 'device1', 0),
(1244, 26, 'Relay has been turned ON', '2025-01-09 12:40:05', 'device1', 0),
(1245, 26, 'Relay has been turned ON', '2025-01-09 12:40:06', 'device1', 0),
(1246, 26, 'Relay has been turned ON', '2025-01-09 12:40:07', 'device1', 0),
(1247, 26, 'Relay has been turned ON', '2025-01-09 12:40:08', 'device1', 0),
(1248, 26, 'Relay has been turned ON', '2025-01-09 12:40:09', 'device1', 0),
(1249, 26, 'Relay has been turned ON', '2025-01-09 12:40:10', 'device1', 0),
(1250, 26, 'Relay has been turned ON', '2025-01-09 12:40:11', 'device1', 0),
(1251, 26, 'Relay has been turned ON', '2025-01-09 12:40:12', 'device1', 0),
(1252, 26, 'Relay has been turned ON', '2025-01-09 12:40:13', 'device1', 0),
(1253, 26, 'Relay has been turned ON', '2025-01-09 12:40:14', 'device1', 0),
(1254, 26, 'Relay has been turned ON', '2025-01-09 12:40:15', 'device1', 0),
(1255, 26, 'Relay has been turned ON', '2025-01-09 12:40:16', 'device1', 0),
(1256, 26, 'Relay has been turned ON', '2025-01-09 12:40:17', 'device1', 0),
(1257, 26, 'Relay has been turned ON', '2025-01-09 12:40:18', 'device1', 0),
(1258, 26, 'Relay has been turned ON', '2025-01-09 12:40:19', 'device1', 0),
(1259, 26, 'Relay has been turned ON', '2025-01-09 12:40:20', 'device1', 0),
(1260, 26, 'Relay has been turned ON', '2025-01-09 12:40:20', 'device1', 0),
(1261, 26, 'Relay has been turned ON', '2025-01-09 12:40:20', 'device1', 0),
(1262, 26, 'Relay has been turned ON', '2025-01-09 12:40:21', 'device1', 0),
(1263, 26, 'Relay has been turned ON', '2025-01-09 12:40:21', 'device1', 0),
(1264, 26, 'Relay has been turned ON', '2025-01-09 12:40:21', 'device1', 0),
(1265, 26, 'Relay has been turned ON', '2025-01-09 12:40:21', 'device1', 0),
(1266, 26, 'Relay has been turned ON', '2025-01-09 12:40:21', 'device1', 0),
(1267, 26, 'Relay has been turned ON', '2025-01-09 12:40:21', 'device1', 0),
(1268, 26, 'Relay has been turned ON', '2025-01-09 12:40:21', 'device1', 0),
(1269, 26, 'Relay has been turned ON', '2025-01-09 12:40:22', 'device1', 0),
(1270, 26, 'Relay has been turned ON', '2025-01-09 12:40:22', 'device1', 0),
(1271, 26, 'Relay has been turned ON', '2025-01-09 12:40:22', 'device1', 0),
(1272, 26, 'Relay has been turned ON', '2025-01-09 12:40:22', 'device1', 0),
(1273, 26, 'Relay has been turned ON', '2025-01-09 12:40:22', 'device1', 0),
(1274, 26, 'Relay has been turned ON', '2025-01-09 12:40:22', 'device1', 0),
(1275, 26, 'Relay has been turned ON', '2025-01-09 12:40:22', 'device1', 0),
(1276, 26, 'Relay has been turned ON', '2025-01-09 12:40:23', 'device1', 0),
(1277, 26, 'Relay has been turned ON', '2025-01-09 12:40:23', 'device1', 0),
(1278, 26, 'Relay has been turned ON', '2025-01-09 12:40:23', 'device1', 0),
(1279, 26, 'Relay has been turned ON', '2025-01-09 12:40:23', 'device1', 0),
(1280, 26, 'Relay has been turned ON', '2025-01-09 12:40:23', 'device1', 0),
(1281, 26, 'Relay has been turned ON', '2025-01-09 12:40:23', 'device1', 0),
(1282, 26, 'Relay has been turned ON', '2025-01-09 12:40:23', 'device1', 0),
(1283, 26, 'Relay has been turned ON', '2025-01-09 12:40:24', 'device1', 0),
(1284, 26, 'Relay has been turned ON', '2025-01-09 12:40:24', 'device1', 0),
(1285, 26, 'Relay has been turned ON', '2025-01-09 12:40:24', 'device1', 0),
(1286, 26, 'Relay has been turned ON', '2025-01-09 12:50:58', 'device1', 0),
(1287, 26, 'Relay has been turned ON', '2025-01-09 12:50:59', 'device1', 0),
(1288, 26, 'Relay has been turned OFF', '2025-01-09 12:50:59', 'device1', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1289;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
