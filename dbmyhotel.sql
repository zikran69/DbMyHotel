-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.28-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for dbmyhotel
CREATE DATABASE IF NOT EXISTS `dbmyhotel` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `dbmyhotel`;

-- Dumping structure for table dbmyhotel.t_customer
CREATE TABLE IF NOT EXISTS `t_customer` (
  `id_customer` int(11) NOT NULL AUTO_INCREMENT,
  `customer_nik` int(16) DEFAULT NULL,
  `customer_name` varchar(80) DEFAULT NULL,
  `customer_address` text DEFAULT NULL,
  `customer_email` varchar(80) DEFAULT NULL,
  `customer_tlp` varchar(20) DEFAULT NULL,
  `customer_create` datetime DEFAULT NULL,
  `total_visitor` int(3) DEFAULT NULL,
  `total_days` int(4) DEFAULT NULL,
  `customer_idfoto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dbmyhotel.t_customer: ~0 rows (approximately)

-- Dumping structure for table dbmyhotel.t_galerry
CREATE TABLE IF NOT EXISTS `t_galerry` (
  `id_gallery` int(11) NOT NULL AUTO_INCREMENT,
  `gallery_name` varchar(100) DEFAULT NULL,
  `gallery_image` varchar(100) DEFAULT NULL,
  `gallery_status` int(2) DEFAULT NULL,
  `gallery_create` datetime DEFAULT NULL,
  `gallery_update` datetime DEFAULT NULL,
  `gallery_message` text DEFAULT NULL,
  PRIMARY KEY (`id_gallery`),
  KEY `FK_t_galerry_t_status` (`gallery_status`),
  CONSTRAINT `FK_t_galerry_t_status` FOREIGN KEY (`gallery_status`) REFERENCES `t_status` (`id_status`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dbmyhotel.t_galerry: ~0 rows (approximately)

-- Dumping structure for table dbmyhotel.t_room
CREATE TABLE IF NOT EXISTS `t_room` (
  `id_room` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT 0,
  `floor_id` int(11) DEFAULT 0,
  `room_name` varchar(100) DEFAULT NULL,
  `room_number` int(11) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `message` text DEFAULT NULL,
  PRIMARY KEY (`id_room`),
  KEY `FK_t_room_t_room_category` (`category_id`),
  KEY `FK_t_room_t_room_floor` (`floor_id`),
  CONSTRAINT `FK_t_room_t_room_category` FOREIGN KEY (`category_id`) REFERENCES `t_room_category` (`id_category`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_t_room_t_room_floor` FOREIGN KEY (`floor_id`) REFERENCES `t_room_floor` (`id_floor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dbmyhotel.t_room: ~0 rows (approximately)

-- Dumping structure for table dbmyhotel.t_room_category
CREATE TABLE IF NOT EXISTS `t_room_category` (
  `id_category` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) DEFAULT NULL,
  `facility` text DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `category_create` datetime DEFAULT NULL,
  `catecory_update` datetime DEFAULT NULL,
  `message` text DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id_category`),
  KEY `FK_t_room_category_t_status` (`status`),
  CONSTRAINT `FK_t_room_category_t_status` FOREIGN KEY (`status`) REFERENCES `t_status` (`id_status`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dbmyhotel.t_room_category: ~0 rows (approximately)

-- Dumping structure for table dbmyhotel.t_room_floor
CREATE TABLE IF NOT EXISTS `t_room_floor` (
  `id_floor` int(11) NOT NULL AUTO_INCREMENT,
  `floor_name` varchar(100) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `floor_create` datetime DEFAULT NULL,
  `floor_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id_floor`),
  KEY `FK_t_room_floor_t_status` (`status`),
  CONSTRAINT `FK_t_room_floor_t_status` FOREIGN KEY (`status`) REFERENCES `t_status` (`id_status`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dbmyhotel.t_room_floor: ~0 rows (approximately)

-- Dumping structure for table dbmyhotel.t_slider
CREATE TABLE IF NOT EXISTS `t_slider` (
  `id_slide` int(11) NOT NULL AUTO_INCREMENT,
  `slide_name` varchar(100) DEFAULT NULL,
  `slide_image` varchar(100) DEFAULT NULL,
  `slide_message` text DEFAULT NULL,
  `slide_status` int(2) DEFAULT NULL,
  `slide_create` datetime DEFAULT NULL,
  `slide_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id_slide`),
  KEY `FK_t_slider_t_status` (`slide_status`),
  CONSTRAINT `FK_t_slider_t_status` FOREIGN KEY (`slide_status`) REFERENCES `t_status` (`id_status`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dbmyhotel.t_slider: ~0 rows (approximately)

-- Dumping structure for table dbmyhotel.t_status
CREATE TABLE IF NOT EXISTS `t_status` (
  `id_status` int(2) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dbmyhotel.t_status: ~0 rows (approximately)

-- Dumping structure for table dbmyhotel.t_testimony
CREATE TABLE IF NOT EXISTS `t_testimony` (
  `id_testimony` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `testimony_message` varchar(100) DEFAULT NULL,
  `testimony_create` datetime DEFAULT NULL,
  `testimony_update` datetime DEFAULT NULL,
  `testimony_stars` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_testimony`),
  KEY `FK_t_testimony_t_customer` (`customer_id`),
  CONSTRAINT `FK_t_testimony_t_customer` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id_customer`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dbmyhotel.t_testimony: ~0 rows (approximately)

-- Dumping structure for table dbmyhotel.t_transaction
CREATE TABLE IF NOT EXISTS `t_transaction` (
  `id_transaction` varchar(30) NOT NULL,
  `room_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `booking_date` datetime DEFAULT NULL,
  `cekin` datetime DEFAULT NULL,
  `cekout` datetime DEFAULT NULL,
  `total_price` int(11) DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `payment_status` int(2) DEFAULT NULL,
  `many_peopel` int(2) DEFAULT NULL,
  `massage` text DEFAULT NULL,
  PRIMARY KEY (`id_transaction`),
  KEY `FK_t_transaction_t_room` (`room_id`),
  KEY `FK_t_transaction_t_customer` (`customer_id`),
  KEY `FK_t_transaction_t_user` (`user_id`),
  CONSTRAINT `FK_t_transaction_t_customer` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id_customer`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_t_transaction_t_room` FOREIGN KEY (`room_id`) REFERENCES `t_room` (`id_room`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_t_transaction_t_user` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dbmyhotel.t_transaction: ~0 rows (approximately)

-- Dumping structure for table dbmyhotel.t_user
CREATE TABLE IF NOT EXISTS `t_user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(80) DEFAULT NULL,
  `user_email` varchar(80) DEFAULT NULL,
  `password` varchar(80) DEFAULT NULL,
  `user_nik` int(16) DEFAULT NULL,
  `user_tlp` int(20) DEFAULT NULL,
  `last_loginin` datetime DEFAULT NULL,
  `last_loginout` datetime DEFAULT NULL,
  `user_create` datetime DEFAULT NULL,
  `user_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dbmyhotel.t_user: ~0 rows (approximately)

-- Dumping structure for table dbmyhotel.t_user_log
CREATE TABLE IF NOT EXISTS `t_user_log` (
  `id_log` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `massage` text DEFAULT NULL,
  PRIMARY KEY (`id_log`),
  KEY `FK_t_user_log_t_user` (`user_id`),
  CONSTRAINT `FK_t_user_log_t_user` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dbmyhotel.t_user_log: ~0 rows (approximately)

-- Dumping structure for table dbmyhotel.t_visitors
CREATE TABLE IF NOT EXISTS `t_visitors` (
  `ip_address` int(11) NOT NULL AUTO_INCREMENT,
  `visitors_create` datetime DEFAULT NULL,
  `visitors_update` datetime DEFAULT NULL,
  `visitors_total` int(11) DEFAULT NULL,
  PRIMARY KEY (`ip_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dbmyhotel.t_visitors: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
