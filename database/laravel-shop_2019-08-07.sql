# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 192.168.1.10 (MySQL 5.7.22-0ubuntu18.04.1)
# Database: laravel-shop
# Generation Time: 2019-08-07 14:21:36 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table admin_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_menu`;

CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_menu` WRITE;
/*!40000 ALTER TABLE `admin_menu` DISABLE KEYS */;

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`)
VALUES
	(1,0,1,'首页','fa-bar-chart','/',NULL,NULL,'2019-08-02 07:49:54'),
	(2,0,6,'系统管理','fa-tasks',NULL,NULL,NULL,'2019-08-07 09:50:04'),
	(3,2,7,'管理员','fa-users','auth/users',NULL,NULL,'2019-08-07 09:50:04'),
	(4,2,8,'角色','fa-user','auth/roles',NULL,NULL,'2019-08-07 09:50:04'),
	(5,2,9,'权限','fa-ban','auth/permissions',NULL,NULL,'2019-08-07 09:50:04'),
	(6,2,10,'菜单','fa-bars','auth/menu',NULL,NULL,'2019-08-07 09:50:04'),
	(7,2,11,'操作日志','fa-history','auth/logs',NULL,NULL,'2019-08-07 09:50:04'),
	(8,0,2,'用户管理','fa-users','/users',NULL,'2019-08-02 08:16:51','2019-08-02 08:17:44'),
	(9,0,3,'商品管理','fa-cubes','/products',NULL,'2019-08-05 01:37:05','2019-08-05 01:37:13'),
	(10,0,4,'订单管理','fa-rmb','/orders',NULL,'2019-08-06 09:47:58','2019-08-06 09:53:49'),
	(11,0,5,'优惠券管理','fa-tags','/coupon_codes',NULL,'2019-08-07 09:49:56','2019-08-07 09:50:04');

/*!40000 ALTER TABLE `admin_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_operation_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_operation_log`;

CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_operation_log` WRITE;
/*!40000 ALTER TABLE `admin_operation_log` DISABLE KEYS */;

INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`)
VALUES
	(1,1,'admin','GET','192.168.1.1','[]','2019-08-02 07:47:25','2019-08-02 07:47:25'),
	(2,1,'admin','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-02 07:47:31','2019-08-02 07:47:31'),
	(3,1,'admin','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-02 07:47:39','2019-08-02 07:47:39'),
	(4,1,'admin/auth/users','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-02 07:47:43','2019-08-02 07:47:43'),
	(5,1,'admin','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-02 07:47:59','2019-08-02 07:47:59'),
	(6,1,'admin/auth/menu','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-02 07:48:59','2019-08-02 07:48:59'),
	(7,1,'admin/auth/menu/1/edit','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-02 07:49:21','2019-08-02 07:49:21'),
	(8,1,'admin/auth/menu/1','PUT','192.168.1.1','{\"parent_id\":\"0\",\"title\":\"\\u9996\\u9875\",\"icon\":\"fa-bar-chart\",\"uri\":\"\\/\",\"roles\":[null],\"permission\":null,\"_token\":\"ojdIVxZMNIFuISOHklx7dT3NrK56yIaCxXdWSfiF\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laravel-shop.test\\/admin\\/auth\\/menu\"}','2019-08-02 07:49:54','2019-08-02 07:49:54'),
	(9,1,'admin/auth/menu','GET','192.168.1.1','[]','2019-08-02 07:49:55','2019-08-02 07:49:55'),
	(10,1,'admin/auth/menu/2/edit','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-02 07:50:15','2019-08-02 07:50:15'),
	(11,1,'admin/auth/menu/2','PUT','192.168.1.1','{\"parent_id\":\"0\",\"title\":\"\\u7cfb\\u7edf\\u7ba1\\u7406\",\"icon\":\"fa-tasks\",\"uri\":null,\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"ojdIVxZMNIFuISOHklx7dT3NrK56yIaCxXdWSfiF\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laravel-shop.test\\/admin\\/auth\\/menu\"}','2019-08-02 07:50:23','2019-08-02 07:50:23'),
	(12,1,'admin/auth/menu','GET','192.168.1.1','[]','2019-08-02 07:50:23','2019-08-02 07:50:23'),
	(13,1,'admin/auth/menu/3/edit','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-02 07:50:30','2019-08-02 07:50:30'),
	(14,1,'admin/auth/menu/3','PUT','192.168.1.1','{\"parent_id\":\"2\",\"title\":\"\\u7ba1\\u7406\\u5458\",\"icon\":\"fa-users\",\"uri\":\"auth\\/users\",\"roles\":[null],\"permission\":null,\"_token\":\"ojdIVxZMNIFuISOHklx7dT3NrK56yIaCxXdWSfiF\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laravel-shop.test\\/admin\\/auth\\/menu\"}','2019-08-02 07:50:37','2019-08-02 07:50:37'),
	(15,1,'admin/auth/menu','GET','192.168.1.1','[]','2019-08-02 07:50:37','2019-08-02 07:50:37'),
	(16,1,'admin/auth/menu/4/edit','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-02 07:50:46','2019-08-02 07:50:46'),
	(17,1,'admin/auth/menu/4','PUT','192.168.1.1','{\"parent_id\":\"2\",\"title\":\"\\u89d2\\u8272\",\"icon\":\"fa-user\",\"uri\":\"auth\\/roles\",\"roles\":[null],\"permission\":null,\"_token\":\"ojdIVxZMNIFuISOHklx7dT3NrK56yIaCxXdWSfiF\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laravel-shop.test\\/admin\\/auth\\/menu\"}','2019-08-02 07:50:52','2019-08-02 07:50:52'),
	(18,1,'admin/auth/menu','GET','192.168.1.1','[]','2019-08-02 07:50:52','2019-08-02 07:50:52'),
	(19,1,'admin/auth/menu/5/edit','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-02 07:50:55','2019-08-02 07:50:55'),
	(20,1,'admin/auth/menu/5','PUT','192.168.1.1','{\"parent_id\":\"2\",\"title\":\"\\u6743\\u9650\",\"icon\":\"fa-ban\",\"uri\":\"auth\\/permissions\",\"roles\":[null],\"permission\":null,\"_token\":\"ojdIVxZMNIFuISOHklx7dT3NrK56yIaCxXdWSfiF\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laravel-shop.test\\/admin\\/auth\\/menu\"}','2019-08-02 07:51:00','2019-08-02 07:51:00'),
	(21,1,'admin/auth/menu','GET','192.168.1.1','[]','2019-08-02 07:51:00','2019-08-02 07:51:00'),
	(22,1,'admin/auth/menu/6/edit','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-02 07:51:04','2019-08-02 07:51:04'),
	(23,1,'admin/auth/menu/6','PUT','192.168.1.1','{\"parent_id\":\"2\",\"title\":\"\\u83dc\\u5355\",\"icon\":\"fa-bars\",\"uri\":\"auth\\/menu\",\"roles\":[null],\"permission\":null,\"_token\":\"ojdIVxZMNIFuISOHklx7dT3NrK56yIaCxXdWSfiF\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laravel-shop.test\\/admin\\/auth\\/menu\"}','2019-08-02 07:51:20','2019-08-02 07:51:20'),
	(24,1,'admin/auth/menu','GET','192.168.1.1','[]','2019-08-02 07:51:20','2019-08-02 07:51:20'),
	(25,1,'admin/auth/menu/7/edit','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-02 07:51:25','2019-08-02 07:51:25'),
	(26,1,'admin/auth/menu/7','PUT','192.168.1.1','{\"parent_id\":\"2\",\"title\":\"\\u64cd\\u4f5c\\u65e5\\u5fd7\",\"icon\":\"fa-history\",\"uri\":\"auth\\/logs\",\"roles\":[null],\"permission\":null,\"_token\":\"ojdIVxZMNIFuISOHklx7dT3NrK56yIaCxXdWSfiF\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laravel-shop.test\\/admin\\/auth\\/menu\"}','2019-08-02 07:51:35','2019-08-02 07:51:35'),
	(27,1,'admin/auth/menu','GET','192.168.1.1','[]','2019-08-02 07:51:35','2019-08-02 07:51:35'),
	(28,1,'admin/auth/menu','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-02 08:15:19','2019-08-02 08:15:19'),
	(29,1,'admin/auth/permissions','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-02 08:15:46','2019-08-02 08:15:46'),
	(30,1,'admin/auth/menu','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-02 08:15:48','2019-08-02 08:15:48'),
	(31,1,'admin/auth/menu','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-02 08:15:51','2019-08-02 08:15:51'),
	(32,1,'admin/auth/menu','GET','192.168.1.1','[]','2019-08-02 08:16:02','2019-08-02 08:16:02'),
	(33,1,'admin','GET','192.168.1.1','[]','2019-08-02 08:16:07','2019-08-02 08:16:07'),
	(34,1,'admin','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-02 08:16:11','2019-08-02 08:16:11'),
	(35,1,'admin/auth/menu','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-02 08:16:15','2019-08-02 08:16:15'),
	(36,1,'admin/auth/menu','POST','192.168.1.1','{\"parent_id\":\"0\",\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-users\",\"uri\":\"\\/users\",\"roles\":[null],\"permission\":null,\"_token\":\"ojdIVxZMNIFuISOHklx7dT3NrK56yIaCxXdWSfiF\"}','2019-08-02 08:16:50','2019-08-02 08:16:50'),
	(37,1,'admin/auth/menu','GET','192.168.1.1','[]','2019-08-02 08:16:51','2019-08-02 08:16:51'),
	(38,1,'admin/auth/menu','POST','192.168.1.1','{\"parent_id\":\"0\",\"title\":null,\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"ojdIVxZMNIFuISOHklx7dT3NrK56yIaCxXdWSfiF\"}','2019-08-02 08:17:33','2019-08-02 08:17:33'),
	(39,1,'admin/auth/menu','GET','192.168.1.1','[]','2019-08-02 08:17:34','2019-08-02 08:17:34'),
	(40,1,'admin/auth/menu','POST','192.168.1.1','{\"_token\":\"ojdIVxZMNIFuISOHklx7dT3NrK56yIaCxXdWSfiF\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}','2019-08-02 08:17:44','2019-08-02 08:17:44'),
	(41,1,'admin/auth/menu','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-02 08:17:44','2019-08-02 08:17:44'),
	(42,1,'admin/auth/menu','GET','192.168.1.1','[]','2019-08-02 08:17:47','2019-08-02 08:17:47'),
	(43,1,'admin/users','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-02 08:18:15','2019-08-02 08:18:15'),
	(44,1,'admin/auth/permissions','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-02 08:25:15','2019-08-02 08:25:15'),
	(45,1,'admin/auth/permissions/create','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-02 08:25:19','2019-08-02 08:25:19'),
	(46,1,'admin/auth/permissions','POST','192.168.1.1','{\"slug\":\"users\",\"name\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"http_method\":[null],\"http_path\":\"\\/users*\",\"_token\":\"ojdIVxZMNIFuISOHklx7dT3NrK56yIaCxXdWSfiF\",\"_previous_\":\"http:\\/\\/laravel-shop.test\\/admin\\/auth\\/permissions\"}','2019-08-02 08:26:27','2019-08-02 08:26:27'),
	(47,1,'admin/auth/permissions','GET','192.168.1.1','[]','2019-08-02 08:26:28','2019-08-02 08:26:28'),
	(48,1,'admin/auth/roles','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-02 08:26:53','2019-08-02 08:26:53'),
	(49,1,'admin/auth/roles/create','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-02 08:26:56','2019-08-02 08:26:56'),
	(50,1,'admin/auth/roles','POST','192.168.1.1','{\"slug\":\"operation\",\"name\":\"\\u8fd0\\u8425\",\"permissions\":[\"2\",\"3\",\"4\",\"6\",null],\"_token\":\"ojdIVxZMNIFuISOHklx7dT3NrK56yIaCxXdWSfiF\",\"_previous_\":\"http:\\/\\/laravel-shop.test\\/admin\\/auth\\/roles\"}','2019-08-02 08:53:26','2019-08-02 08:53:26'),
	(51,1,'admin/auth/roles','GET','192.168.1.1','[]','2019-08-02 08:53:27','2019-08-02 08:53:27'),
	(52,1,'admin/auth/users','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-02 08:54:28','2019-08-02 08:54:28'),
	(53,1,'admin/auth/users/create','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-02 08:54:30','2019-08-02 08:54:30'),
	(54,1,'admin/auth/users','POST','192.168.1.1','{\"username\":\"operator\",\"name\":\"\\u8fd0\\u8425\",\"password\":\"12345678\",\"password_confirmation\":\"12345678\",\"roles\":[\"2\",null],\"permissions\":[null],\"_token\":\"ojdIVxZMNIFuISOHklx7dT3NrK56yIaCxXdWSfiF\",\"_previous_\":\"http:\\/\\/laravel-shop.test\\/admin\\/auth\\/users\"}','2019-08-02 08:55:55','2019-08-02 08:55:55'),
	(55,1,'admin/auth/users','GET','192.168.1.1','[]','2019-08-02 08:55:56','2019-08-02 08:55:56'),
	(56,1,'admin/auth/logout','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-02 08:56:27','2019-08-02 08:56:27'),
	(57,2,'admin','GET','192.168.1.1','[]','2019-08-02 08:56:39','2019-08-02 08:56:39'),
	(58,2,'admin/users','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-02 08:56:55','2019-08-02 08:56:55'),
	(59,2,'admin/users','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-05 01:35:51','2019-08-05 01:35:51'),
	(60,2,'admin/auth/logout','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-05 01:35:57','2019-08-05 01:35:57'),
	(61,1,'admin','GET','192.168.1.1','[]','2019-08-05 01:36:06','2019-08-05 01:36:06'),
	(62,1,'admin/auth/menu','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-05 01:36:11','2019-08-05 01:36:11'),
	(63,1,'admin/auth/menu','POST','192.168.1.1','{\"parent_id\":\"0\",\"title\":\"\\u5546\\u54c1\\u7ba1\\u7406\",\"icon\":\"fa-cubes\",\"uri\":\"\\/products\",\"roles\":[null],\"permission\":null,\"_token\":\"4poCE1PoSP0njQGV3x7YKeUUDaT0GsrEChVaCQdf\"}','2019-08-05 01:37:05','2019-08-05 01:37:05'),
	(64,1,'admin/auth/menu','GET','192.168.1.1','[]','2019-08-05 01:37:06','2019-08-05 01:37:06'),
	(65,1,'admin/auth/menu','POST','192.168.1.1','{\"_token\":\"4poCE1PoSP0njQGV3x7YKeUUDaT0GsrEChVaCQdf\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":9},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}','2019-08-05 01:37:13','2019-08-05 01:37:13'),
	(66,1,'admin/auth/menu','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-05 01:37:13','2019-08-05 01:37:13'),
	(67,1,'admin/auth/menu','GET','192.168.1.1','[]','2019-08-05 01:37:29','2019-08-05 01:37:29'),
	(68,1,'admin/products','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-05 01:37:36','2019-08-05 01:37:36'),
	(69,1,'admin/products/create','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-05 02:05:41','2019-08-05 02:05:41'),
	(70,1,'admin/products/create','GET','192.168.1.1','[]','2019-08-05 02:07:04','2019-08-05 02:07:04'),
	(71,1,'admin/products','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-05 02:07:15','2019-08-05 02:07:15'),
	(72,1,'admin/products','GET','192.168.1.1','[]','2019-08-05 02:07:18','2019-08-05 02:07:18'),
	(73,1,'admin/products/create','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-05 02:07:20','2019-08-05 02:07:20'),
	(74,1,'admin/products','POST','192.168.1.1','{\"title\":\"iPhone x\",\"description\":\"<p>\\u5168\\u7f51\\u9996\\u53d1\\uff0c\\u53ea\\u6b64\\u4e00\\u5bb6<\\/p>\",\"on_sale\":\"0\",\"skus\":{\"new_1\":{\"title\":\"\\u94f6\\u8272 64\",\"description\":null,\"price\":null,\"stock\":null,\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"title\":null,\"description\":null,\"price\":null,\"stock\":null,\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"4poCE1PoSP0njQGV3x7YKeUUDaT0GsrEChVaCQdf\",\"_previous_\":\"http:\\/\\/laravel-shop.test\\/admin\\/products\"}','2019-08-05 02:10:40','2019-08-05 02:10:40'),
	(75,1,'admin/products/create','GET','192.168.1.1','[]','2019-08-05 02:10:41','2019-08-05 02:10:41'),
	(76,1,'admin/products/create','GET','192.168.1.1','[]','2019-08-05 02:10:59','2019-08-05 02:10:59'),
	(77,1,'admin/products/create','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-05 02:11:05','2019-08-05 02:11:05'),
	(78,1,'admin/products','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-05 02:11:06','2019-08-05 02:11:06'),
	(79,1,'admin/products','GET','192.168.1.1','[]','2019-08-05 02:11:08','2019-08-05 02:11:08'),
	(80,1,'admin/products/create','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-05 02:11:11','2019-08-05 02:11:11'),
	(81,1,'admin/products','POST','192.168.1.1','{\"title\":\"iPhone x\",\"description\":\"<p>\\u5168\\u7f51\\u9996\\u53d1\\uff0c\\u53ea\\u6b64\\u4e00\\u5bb6<\\/p>\",\"on_sale\":\"0\",\"skus\":{\"new_1\":{\"title\":\"\\u94f6\\u8272 64G\",\"description\":\"iPhone x \\u94f6\\u8272 64G\",\"price\":\"8848\",\"stock\":\"100\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"title\":\"\\u7070\\u8272 256G\",\"description\":\"iPhone x \\u7070\\u8272 256G\",\"price\":\"8888\",\"stock\":\"100\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"4poCE1PoSP0njQGV3x7YKeUUDaT0GsrEChVaCQdf\",\"_previous_\":\"http:\\/\\/laravel-shop.test\\/admin\\/products\"}','2019-08-05 02:13:27','2019-08-05 02:13:27'),
	(82,1,'admin/products','GET','192.168.1.1','[]','2019-08-05 02:13:28','2019-08-05 02:13:28'),
	(83,1,'admin/products','GET','192.168.1.1','[]','2019-08-05 02:15:09','2019-08-05 02:15:09'),
	(84,1,'admin/products/1/edit','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-05 02:15:12','2019-08-05 02:15:12'),
	(85,1,'admin/products/1/edit','GET','192.168.1.1','[]','2019-08-05 02:18:33','2019-08-05 02:18:33'),
	(86,1,'admin/products/1','PUT','192.168.1.1','{\"title\":\"Apple\\/\\u82f9\\u679c iPhone x\",\"description\":\"<p>\\u5168\\u7f51\\u9996\\u53d1\\uff0c\\u53ea\\u6b64\\u4e00\\u5bb6<\\/p>\",\"on_sale\":\"0\",\"skus\":{\"1\":{\"title\":\"\\u94f6\\u8272 64G\",\"description\":\"iPhone x \\u94f6\\u8272 64G\",\"price\":\"8848.00\",\"stock\":\"100\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"title\":\"\\u7070\\u8272 256G \\u7279\\u4ef7\",\"description\":\"iPhone x \\u7070\\u8272 256G \\u8001\\u677f\\u75af\\u4e86\",\"price\":\"7888.00\",\"stock\":\"100\",\"id\":\"2\",\"_remove_\":\"0\"}},\"_token\":\"4poCE1PoSP0njQGV3x7YKeUUDaT0GsrEChVaCQdf\",\"_method\":\"PUT\"}','2019-08-05 02:20:14','2019-08-05 02:20:14'),
	(87,1,'admin/products','GET','192.168.1.1','[]','2019-08-05 02:20:14','2019-08-05 02:20:14'),
	(88,1,'admin/products/1/edit','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-05 02:33:51','2019-08-05 02:33:51'),
	(89,1,'admin/products/1','PUT','192.168.1.1','{\"title\":\"Apple\\/\\u82f9\\u679c iPhone x\",\"description\":\"<p>\\u5168\\u7f51\\u9996\\u53d1\\uff0c\\u53ea\\u6b64\\u4e00\\u5bb6<\\/p>\",\"on_sale\":\"1\",\"skus\":{\"1\":{\"title\":\"\\u94f6\\u8272 64G\",\"description\":\"iPhone x \\u94f6\\u8272 64G\",\"price\":\"8848.00\",\"stock\":\"100\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"title\":\"\\u7070\\u8272 256G \\u7279\\u4ef7\",\"description\":\"iPhone x \\u7070\\u8272 256G \\u8001\\u677f\\u75af\\u4e86\",\"price\":\"7888.00\",\"stock\":\"100\",\"id\":\"2\",\"_remove_\":\"0\"}},\"_token\":\"4poCE1PoSP0njQGV3x7YKeUUDaT0GsrEChVaCQdf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laravel-shop.test\\/admin\\/products\"}','2019-08-05 02:33:56','2019-08-05 02:33:56'),
	(90,1,'admin/products','GET','192.168.1.1','[]','2019-08-05 02:33:57','2019-08-05 02:33:57'),
	(91,1,'admin/products','GET','192.168.1.1','[]','2019-08-05 02:57:30','2019-08-05 02:57:30'),
	(92,1,'admin/products/1/edit','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-05 02:57:33','2019-08-05 02:57:33'),
	(93,1,'admin/products/1','PUT','192.168.1.1','{\"title\":\"Apple\\/\\u82f9\\u679c iPhone x\",\"description\":\"<p>\\u5168\\u7f51\\u9996\\u53d1\\uff0c\\u53ea\\u6b64\\u4e00\\u5bb6<\\/p>\",\"on_sale\":\"0\",\"skus\":{\"1\":{\"title\":\"\\u94f6\\u8272 64G\",\"description\":\"iPhone x \\u94f6\\u8272 64G\",\"price\":\"8848.00\",\"stock\":\"100\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"title\":\"\\u7070\\u8272 256G \\u7279\\u4ef7\",\"description\":\"iPhone x \\u7070\\u8272 256G \\u8001\\u677f\\u75af\\u4e86\",\"price\":\"7888.00\",\"stock\":\"100\",\"id\":\"2\",\"_remove_\":\"0\"}},\"_token\":\"4poCE1PoSP0njQGV3x7YKeUUDaT0GsrEChVaCQdf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laravel-shop.test\\/admin\\/products\"}','2019-08-05 02:57:38','2019-08-05 02:57:38'),
	(94,1,'admin/products','GET','192.168.1.1','[]','2019-08-05 02:57:39','2019-08-05 02:57:39'),
	(95,1,'admin/products','GET','192.168.1.1','[]','2019-08-05 09:48:24','2019-08-05 09:48:24'),
	(96,1,'admin/products/3/edit','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-05 09:48:28','2019-08-05 09:48:28'),
	(97,1,'admin/products/3','PUT','192.168.1.1','{\"title\":\"magni\",\"description\":\"<p>Velit eveniet excepturi ad commodi ut.<\\/p>\",\"on_sale\":\"0\",\"skus\":{\"6\":{\"title\":\"quo\",\"description\":\"Ipsum nisi exercitationem facere et.\",\"price\":\"4777.00\",\"stock\":\"43910\",\"id\":\"6\",\"_remove_\":\"0\"},\"7\":{\"title\":\"vel\",\"description\":\"Ullam recusandae necessitatibus ducimus.\",\"price\":\"909.00\",\"stock\":\"9251\",\"id\":\"7\",\"_remove_\":\"0\"},\"8\":{\"title\":\"voluptatem\",\"description\":\"Dolores veniam et tempore nam.\",\"price\":\"5588.00\",\"stock\":\"73725\",\"id\":\"8\",\"_remove_\":\"0\"}},\"_token\":\"6tHsXfSvBQhrnHcaCHHdzMMnkCHGmsUvayXW9l0m\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laravel-shop.test\\/admin\\/products\"}','2019-08-05 09:48:35','2019-08-05 09:48:35'),
	(98,1,'admin/products','GET','192.168.1.1','[]','2019-08-05 09:48:36','2019-08-05 09:48:36'),
	(99,1,'admin/products/2/edit','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-05 09:57:28','2019-08-05 09:57:28'),
	(100,1,'admin/products/2','PUT','192.168.1.1','{\"title\":\"fuga\",\"description\":\"<p>Sed minus unde error quos et rerum.<\\/p>\",\"on_sale\":\"0\",\"skus\":{\"3\":{\"title\":\"vitae\",\"description\":\"Rerum enim eum eos.\",\"price\":\"5868.00\",\"stock\":\"21336\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"title\":\"in\",\"description\":\"Beatae fugit id voluptatibus in est deleniti.\",\"price\":\"1589.00\",\"stock\":\"27874\",\"id\":\"4\",\"_remove_\":\"0\"},\"5\":{\"title\":\"a\",\"description\":\"Eos autem voluptate deleniti nobis.\",\"price\":\"7013.00\",\"stock\":\"85955\",\"id\":\"5\",\"_remove_\":\"0\"}},\"_token\":\"6tHsXfSvBQhrnHcaCHHdzMMnkCHGmsUvayXW9l0m\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laravel-shop.test\\/admin\\/products\"}','2019-08-05 09:57:33','2019-08-05 09:57:33'),
	(101,1,'admin/products','GET','192.168.1.1','[]','2019-08-05 09:57:34','2019-08-05 09:57:34'),
	(102,1,'admin/auth/menu','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-06 09:47:22','2019-08-06 09:47:22'),
	(103,1,'admin/auth/menu','POST','192.168.1.1','{\"parent_id\":\"0\",\"title\":\"\\u8ba2\\u5355\\u7ba1\\u7406\",\"icon\":\"fa-rmb\",\"uri\":\"\\/ordres\",\"roles\":[null],\"permission\":null,\"_token\":\"49Ni9Bge6gXGGQyYyYavcfrd63T2dyK7QzOq0i8F\"}','2019-08-06 09:47:57','2019-08-06 09:47:57'),
	(104,1,'admin/auth/menu','GET','192.168.1.1','[]','2019-08-06 09:47:58','2019-08-06 09:47:58'),
	(105,1,'admin/auth/menu','GET','192.168.1.1','[]','2019-08-06 09:48:16','2019-08-06 09:48:16'),
	(106,1,'admin/auth/menu','POST','192.168.1.1','{\"_token\":\"49Ni9Bge6gXGGQyYyYavcfrd63T2dyK7QzOq0i8F\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":9},{\\\"id\\\":10},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}','2019-08-06 09:48:22','2019-08-06 09:48:22'),
	(107,1,'admin/auth/menu','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-06 09:48:23','2019-08-06 09:48:23'),
	(108,1,'admin/auth/menu','GET','192.168.1.1','[]','2019-08-06 09:48:26','2019-08-06 09:48:26'),
	(109,1,'admin/auth/menu','GET','192.168.1.1','[]','2019-08-06 09:50:56','2019-08-06 09:50:56'),
	(110,1,'admin/auth/menu/10/edit','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-06 09:51:02','2019-08-06 09:51:02'),
	(111,1,'admin/auth/menu/10','PUT','192.168.1.1','{\"parent_id\":\"0\",\"title\":\"\\u8ba2\\u5355\\u7ba1\\u7406\",\"icon\":\"fa-rmb\",\"uri\":\"\\/ordres\",\"roles\":[null],\"permission\":null,\"_token\":\"49Ni9Bge6gXGGQyYyYavcfrd63T2dyK7QzOq0i8F\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laravel-shop.test\\/admin\\/auth\\/menu\"}','2019-08-06 09:51:21','2019-08-06 09:51:21'),
	(112,1,'admin/auth/menu','GET','192.168.1.1','[]','2019-08-06 09:51:21','2019-08-06 09:51:21'),
	(113,1,'admin/auth/menu','GET','192.168.1.1','[]','2019-08-06 09:51:40','2019-08-06 09:51:40'),
	(114,1,'admin/auth/menu/10/edit','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-06 09:52:26','2019-08-06 09:52:26'),
	(115,1,'admin/auth/menu/10','PUT','192.168.1.1','{\"parent_id\":\"0\",\"title\":\"\\u8ba2\\u5355\\u7ba1\\u7406\",\"icon\":\"fa-rmb\",\"uri\":\"\\/orders\",\"roles\":[null],\"permission\":null,\"_token\":\"49Ni9Bge6gXGGQyYyYavcfrd63T2dyK7QzOq0i8F\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laravel-shop.test\\/admin\\/auth\\/menu\"}','2019-08-06 09:53:48','2019-08-06 09:53:48'),
	(116,1,'admin/auth/menu','GET','192.168.1.1','[]','2019-08-06 09:53:49','2019-08-06 09:53:49'),
	(117,1,'admin/auth/menu','GET','192.168.1.1','[]','2019-08-06 09:53:52','2019-08-06 09:53:52'),
	(118,1,'admin/orders','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-06 09:53:55','2019-08-06 09:53:55'),
	(119,1,'admin/orders','GET','192.168.1.1','[]','2019-08-06 14:53:39','2019-08-06 14:53:39'),
	(120,1,'admin/orders/10','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-06 14:53:47','2019-08-06 14:53:47'),
	(121,1,'admin/orders/10/ship','POST','192.168.1.1','{\"_token\":\"LaemClp2Q4K1zFRBTAnvXUcm4Kwgy2DWcDpHd9Jb\",\"express_company\":null,\"express_no\":null}','2019-08-06 14:54:22','2019-08-06 14:54:22'),
	(122,1,'admin/orders/10','GET','192.168.1.1','[]','2019-08-06 14:54:23','2019-08-06 14:54:23'),
	(123,1,'admin/orders/10/ship','POST','192.168.1.1','{\"_token\":\"LaemClp2Q4K1zFRBTAnvXUcm4Kwgy2DWcDpHd9Jb\",\"express_company\":\"\\u987a\\u4e30\",\"express_no\":\"12345678\"}','2019-08-06 14:54:43','2019-08-06 14:54:43'),
	(124,1,'admin/orders/10','GET','192.168.1.1','[]','2019-08-06 14:54:44','2019-08-06 14:54:44'),
	(125,1,'admin','GET','192.168.1.1','[]','2019-08-07 07:27:34','2019-08-07 07:27:34'),
	(126,1,'admin/orders','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-07 07:27:41','2019-08-07 07:27:41'),
	(127,1,'admin/auth/setting','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-07 07:27:58','2019-08-07 07:27:58'),
	(128,1,'admin/auth/setting','PUT','192.168.1.1','{\"name\":\"Administrator\",\"password\":\"$2y$10$mq.r5rdNL0stDF\\/bmAuUmO0gTP0Aklp22qZkg2EASd2JynAv093YK\",\"password_confirmation\":\"$2y$10$mq.r5rdNL0stDF\\/bmAuUmO0gTP0Aklp22qZkg2EASd2JynAv093YK\",\"_token\":\"i26Oim338aH4IOLWX3LWQTBGe7keRzKSdPSSjcEf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laravel-shop.test\\/admin\\/orders\"}','2019-08-07 07:28:18','2019-08-07 07:28:18'),
	(129,1,'admin/auth/setting','GET','192.168.1.1','[]','2019-08-07 07:28:19','2019-08-07 07:28:19'),
	(130,1,'admin/auth/setting','GET','192.168.1.1','[]','2019-08-07 07:28:26','2019-08-07 07:28:26'),
	(131,1,'admin/orders','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-07 07:43:18','2019-08-07 07:43:18'),
	(132,1,'admin/orders/10','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-07 07:43:23','2019-08-07 07:43:23'),
	(133,1,'admin/orders/10/refund','POST','192.168.1.1','{\"agree\":false,\"reason\":\"\\u4e0d\\u60f3\\u9000\",\"_token\":\"i26Oim338aH4IOLWX3LWQTBGe7keRzKSdPSSjcEf\"}','2019-08-07 07:43:35','2019-08-07 07:43:35'),
	(134,1,'admin/orders/10','GET','192.168.1.1','[]','2019-08-07 07:43:37','2019-08-07 07:43:37'),
	(135,1,'admin/orders','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-07 07:43:52','2019-08-07 07:43:52'),
	(136,1,'admin/orders/10','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-07 07:44:16','2019-08-07 07:44:16'),
	(137,1,'admin/orders/10','GET','192.168.1.1','[]','2019-08-07 08:08:03','2019-08-07 08:08:03'),
	(138,1,'admin/orders/10/refund','POST','192.168.1.1','{\"agree\":true,\"_token\":\"i26Oim338aH4IOLWX3LWQTBGe7keRzKSdPSSjcEf\"}','2019-08-07 08:08:09','2019-08-07 08:08:09'),
	(139,1,'admin/orders/10','GET','192.168.1.1','[]','2019-08-07 08:08:20','2019-08-07 08:08:20'),
	(140,1,'admin/orders/10/refund','POST','192.168.1.1','{\"agree\":true,\"_token\":\"i26Oim338aH4IOLWX3LWQTBGe7keRzKSdPSSjcEf\"}','2019-08-07 08:08:33','2019-08-07 08:08:33'),
	(141,1,'admin/orders/10','GET','192.168.1.1','[]','2019-08-07 08:08:38','2019-08-07 08:08:38'),
	(142,1,'admin/orders/10','GET','192.168.1.1','[]','2019-08-07 08:11:49','2019-08-07 08:11:49'),
	(143,1,'admin/orders/10','GET','192.168.1.1','[]','2019-08-07 08:11:52','2019-08-07 08:11:52'),
	(144,1,'admin/orders/10','GET','192.168.1.1','[]','2019-08-07 08:11:54','2019-08-07 08:11:54'),
	(145,1,'admin/orders/10','GET','192.168.1.1','[]','2019-08-07 08:12:37','2019-08-07 08:12:37'),
	(146,1,'admin/orders','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-07 08:12:47','2019-08-07 08:12:47'),
	(147,1,'admin/orders','GET','192.168.1.1','[]','2019-08-07 08:12:50','2019-08-07 08:12:50'),
	(148,1,'admin/orders/10','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-07 08:12:52','2019-08-07 08:12:52'),
	(149,1,'admin/orders/10','GET','192.168.1.1','[]','2019-08-07 08:14:43','2019-08-07 08:14:43'),
	(150,1,'admin/orders/10','GET','192.168.1.1','[]','2019-08-07 08:14:47','2019-08-07 08:14:47'),
	(151,1,'admin/orders/10','GET','192.168.1.1','[]','2019-08-07 08:15:10','2019-08-07 08:15:10'),
	(152,1,'admin/orders/10','GET','192.168.1.1','[]','2019-08-07 08:15:12','2019-08-07 08:15:12'),
	(153,1,'admin/orders/10','GET','192.168.1.1','[]','2019-08-07 08:15:12','2019-08-07 08:15:12'),
	(154,1,'admin/orders/10','GET','192.168.1.1','[]','2019-08-07 08:15:25','2019-08-07 08:15:25'),
	(155,1,'admin/orders/10','GET','192.168.1.1','[]','2019-08-07 08:16:12','2019-08-07 08:16:12'),
	(156,1,'admin/orders/10','GET','192.168.1.1','[]','2019-08-07 08:18:42','2019-08-07 08:18:42'),
	(157,1,'admin/auth/menu','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-07 09:49:07','2019-08-07 09:49:07'),
	(158,1,'admin/auth/menu','POST','192.168.1.1','{\"parent_id\":\"0\",\"title\":\"\\u4f18\\u60e0\\u5238\\u7ba1\\u7406\",\"icon\":\"fa-tags\",\"uri\":\"\\/coupon_codes\",\"roles\":[null],\"permission\":null,\"_token\":\"i26Oim338aH4IOLWX3LWQTBGe7keRzKSdPSSjcEf\"}','2019-08-07 09:49:56','2019-08-07 09:49:56'),
	(159,1,'admin/auth/menu','GET','192.168.1.1','[]','2019-08-07 09:49:57','2019-08-07 09:49:57'),
	(160,1,'admin/auth/menu','POST','192.168.1.1','{\"_token\":\"i26Oim338aH4IOLWX3LWQTBGe7keRzKSdPSSjcEf\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":9},{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}','2019-08-07 09:50:04','2019-08-07 09:50:04'),
	(161,1,'admin/auth/menu','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-07 09:50:04','2019-08-07 09:50:04'),
	(162,1,'admin/auth/menu','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-07 09:50:07','2019-08-07 09:50:07'),
	(163,1,'admin/auth/menu','GET','192.168.1.1','[]','2019-08-07 09:50:12','2019-08-07 09:50:12'),
	(164,1,'admin/coupon_codes','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-07 09:50:25','2019-08-07 09:50:25'),
	(165,1,'admin/coupon_codes','GET','192.168.1.1','[]','2019-08-07 09:54:38','2019-08-07 09:54:38'),
	(166,1,'admin/coupon_codes','GET','192.168.1.1','[]','2019-08-07 09:56:18','2019-08-07 09:56:18'),
	(167,1,'admin/coupon_codes','GET','192.168.1.1','[]','2019-08-07 09:56:47','2019-08-07 09:56:47'),
	(168,1,'admin/coupon_codes','GET','192.168.1.1','[]','2019-08-07 09:56:49','2019-08-07 09:56:49'),
	(169,1,'admin/coupon_codes','GET','192.168.1.1','[]','2019-08-07 09:58:47','2019-08-07 09:58:47'),
	(170,1,'admin/coupon_codes','GET','192.168.1.1','[]','2019-08-07 09:59:40','2019-08-07 09:59:40'),
	(171,1,'admin/coupon_codes/create','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-07 10:05:25','2019-08-07 10:05:25'),
	(172,1,'admin/coupon_codes','POST','192.168.1.1','{\"name\":null,\"code\":null,\"type\":\"fixed\",\"value\":null,\"total\":null,\"min_amount\":null,\"not_before\":null,\"not_after\":null,\"enabled\":\"0\",\"_token\":\"i26Oim338aH4IOLWX3LWQTBGe7keRzKSdPSSjcEf\",\"_previous_\":\"http:\\/\\/laravel-shop.test\\/admin\\/coupon_codes\"}','2019-08-07 10:05:34','2019-08-07 10:05:34'),
	(173,1,'admin/coupon_codes/create','GET','192.168.1.1','[]','2019-08-07 10:05:35','2019-08-07 10:05:35'),
	(174,1,'admin/coupon_codes','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-07 10:05:54','2019-08-07 10:05:54'),
	(175,1,'admin/coupon_codes/create','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-07 10:06:00','2019-08-07 10:06:00'),
	(176,1,'admin/coupon_codes','POST','192.168.1.1','{\"name\":null,\"code\":\"E52QPIKISSZSPR6N\",\"type\":\"fixed\",\"value\":null,\"total\":null,\"min_amount\":null,\"not_before\":null,\"not_after\":null,\"enabled\":\"0\",\"_token\":\"i26Oim338aH4IOLWX3LWQTBGe7keRzKSdPSSjcEf\",\"_previous_\":\"http:\\/\\/laravel-shop.test\\/admin\\/coupon_codes\"}','2019-08-07 10:06:17','2019-08-07 10:06:17'),
	(177,1,'admin/coupon_codes/create','GET','192.168.1.1','[]','2019-08-07 10:06:17','2019-08-07 10:06:17'),
	(178,1,'admin/coupon_codes','POST','192.168.1.1','{\"name\":\"\\u5927\\u916c\\u5bbe\\u534a\\u4ef7\\u7279\\u60e0\",\"code\":\"hellolaravel\",\"type\":\"fixed\",\"value\":\"50\",\"total\":\"100\",\"min_amount\":\"100\",\"not_before\":null,\"not_after\":null,\"enabled\":\"0\",\"_token\":\"i26Oim338aH4IOLWX3LWQTBGe7keRzKSdPSSjcEf\"}','2019-08-07 10:07:10','2019-08-07 10:07:10'),
	(179,1,'admin/coupon_codes','GET','192.168.1.1','[]','2019-08-07 10:07:10','2019-08-07 10:07:10'),
	(180,1,'admin/coupon_codes/11/edit','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-07 10:07:56','2019-08-07 10:07:56'),
	(181,1,'admin/coupon_codes/11','PUT','192.168.1.1','{\"name\":\"\\u5927\\u916c\\u5bbe\\u534a\\u4ef7\\u7279\\u60e0\",\"code\":\"hellolaravel\",\"type\":\"fixed\",\"value\":\"50.00\",\"total\":\"100\",\"min_amount\":\"100.00\",\"not_before\":\"2019-08-07 00:00:00\",\"not_after\":\"2019-08-14 00:00:00\",\"enabled\":\"1\",\"_token\":\"i26Oim338aH4IOLWX3LWQTBGe7keRzKSdPSSjcEf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laravel-shop.test\\/admin\\/coupon_codes\"}','2019-08-07 10:08:43','2019-08-07 10:08:43'),
	(182,1,'admin/coupon_codes/11/edit','GET','192.168.1.1','[]','2019-08-07 10:08:43','2019-08-07 10:08:43'),
	(183,1,'admin/coupon_codes/11','PUT','192.168.1.1','{\"name\":\"\\u5927\\u916c\\u5bbe\\u534a\\u4ef7\\u7279\\u60e0\",\"code\":\"hellolaravel\",\"type\":\"fixed\",\"value\":\"50.00\",\"total\":\"100\",\"min_amount\":\"100.00\",\"not_before\":\"2019-08-07 00:00:00\",\"not_after\":\"2019-08-14 00:00:00\",\"enabled\":\"1\",\"_token\":\"i26Oim338aH4IOLWX3LWQTBGe7keRzKSdPSSjcEf\",\"_method\":\"PUT\"}','2019-08-07 10:09:55','2019-08-07 10:09:55'),
	(184,1,'admin/coupon_codes','GET','192.168.1.1','[]','2019-08-07 10:09:56','2019-08-07 10:09:56'),
	(185,1,'admin/coupon_codes/1','DELETE','192.168.1.1','{\"_method\":\"delete\",\"_token\":\"i26Oim338aH4IOLWX3LWQTBGe7keRzKSdPSSjcEf\"}','2019-08-07 10:10:39','2019-08-07 10:10:39'),
	(186,1,'admin/coupon_codes','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-07 10:10:40','2019-08-07 10:10:40'),
	(187,1,'admin/products','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-07 10:29:09','2019-08-07 10:29:09'),
	(188,1,'admin/products/1/edit','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-07 10:50:05','2019-08-07 10:50:05'),
	(189,1,'admin/products/1','PUT','192.168.1.1','{\"title\":\"Apple\\/\\u82f9\\u679c iPhone x\",\"description\":\"<p>\\u5168\\u7f51\\u9996\\u53d1\\uff0c\\u53ea\\u6b64\\u4e00\\u5bb6<\\/p>\",\"on_sale\":\"0\",\"skus\":{\"1\":{\"title\":\"\\u94f6\\u8272 64G\",\"description\":\"iPhone x \\u94f6\\u8272 64G\",\"price\":\"8848.00\",\"stock\":\"100\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"title\":\"\\u7070\\u8272 256G \\u7279\\u4ef7\",\"description\":\"iPhone x \\u7070\\u8272 256G \\u8001\\u677f\\u75af\\u4e86\",\"price\":\"1.00\",\"stock\":\"100\",\"id\":\"2\",\"_remove_\":\"0\"}},\"_token\":\"i26Oim338aH4IOLWX3LWQTBGe7keRzKSdPSSjcEf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laravel-shop.test\\/admin\\/products\"}','2019-08-07 10:50:17','2019-08-07 10:50:17'),
	(190,1,'admin/products','GET','192.168.1.1','[]','2019-08-07 10:50:17','2019-08-07 10:50:17'),
	(191,1,'admin/products/1/edit','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-07 10:50:20','2019-08-07 10:50:20'),
	(192,1,'admin/products/1','PUT','192.168.1.1','{\"title\":\"Apple\\/\\u82f9\\u679c iPhone x\",\"description\":\"<p>\\u5168\\u7f51\\u9996\\u53d1\\uff0c\\u53ea\\u6b64\\u4e00\\u5bb6<\\/p>\",\"on_sale\":\"1\",\"skus\":{\"1\":{\"title\":\"\\u94f6\\u8272 64G\",\"description\":\"iPhone x \\u94f6\\u8272 64G\",\"price\":\"8848.00\",\"stock\":\"100\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"title\":\"\\u7070\\u8272 256G \\u7279\\u4ef7\",\"description\":\"iPhone x \\u7070\\u8272 256G \\u8001\\u677f\\u75af\\u4e86\",\"price\":\"1.00\",\"stock\":\"100\",\"id\":\"2\",\"_remove_\":\"0\"}},\"_token\":\"i26Oim338aH4IOLWX3LWQTBGe7keRzKSdPSSjcEf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laravel-shop.test\\/admin\\/products\"}','2019-08-07 10:50:26','2019-08-07 10:50:26'),
	(193,1,'admin/products','GET','192.168.1.1','[]','2019-08-07 10:50:27','2019-08-07 10:50:27'),
	(194,1,'admin/products/1/edit','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-07 10:50:30','2019-08-07 10:50:30'),
	(195,1,'admin/products/1','PUT','192.168.1.1','{\"title\":\"Apple\\/\\u82f9\\u679c iPhone x\",\"description\":\"<p>\\u5168\\u7f51\\u9996\\u53d1\\uff0c\\u53ea\\u6b64\\u4e00\\u5bb6<\\/p>\",\"on_sale\":\"0\",\"skus\":{\"1\":{\"title\":\"\\u94f6\\u8272 64G\",\"description\":\"iPhone x \\u94f6\\u8272 64G\",\"price\":\"8848.00\",\"stock\":\"100\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"title\":\"\\u7070\\u8272 256G \\u7279\\u4ef7\",\"description\":\"iPhone x \\u7070\\u8272 256G \\u8001\\u677f\\u75af\\u4e86\",\"price\":\"1.00\",\"stock\":\"100\",\"id\":\"2\",\"_remove_\":\"0\"}},\"_token\":\"i26Oim338aH4IOLWX3LWQTBGe7keRzKSdPSSjcEf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laravel-shop.test\\/admin\\/products\"}','2019-08-07 10:50:39','2019-08-07 10:50:39'),
	(196,1,'admin/products','GET','192.168.1.1','[]','2019-08-07 10:50:39','2019-08-07 10:50:39'),
	(197,1,'admin/products/20/edit','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-07 10:50:43','2019-08-07 10:50:43'),
	(198,1,'admin/products/20','PUT','192.168.1.1','{\"title\":\"excepturi\",\"description\":\"<p>Consequatur velit harum aut ullam autem rerum quibusdam.<\\/p>\",\"on_sale\":\"1\",\"skus\":{\"57\":{\"title\":\"ipsa\",\"description\":\"Laborum voluptatem reprehenderit omnis ex maxime voluptatum.\",\"price\":\"9663.00\",\"stock\":\"55662\",\"id\":\"57\",\"_remove_\":\"0\"},\"58\":{\"title\":\"est\",\"description\":\"Laboriosam consequatur aliquid et quo praesentium est assumenda maxime.\",\"price\":\"1\",\"stock\":\"43575\",\"id\":\"58\",\"_remove_\":\"0\"},\"59\":{\"title\":\"quam\",\"description\":\"Vel sunt aut sit fugit.\",\"price\":\"393.00\",\"stock\":\"66611\",\"id\":\"59\",\"_remove_\":\"0\"}},\"_token\":\"i26Oim338aH4IOLWX3LWQTBGe7keRzKSdPSSjcEf\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laravel-shop.test\\/admin\\/products\"}','2019-08-07 10:50:51','2019-08-07 10:50:51'),
	(199,1,'admin/products','GET','192.168.1.1','[]','2019-08-07 10:50:52','2019-08-07 10:50:52'),
	(200,1,'admin/coupon_codes','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-07 10:51:32','2019-08-07 10:51:32'),
	(201,1,'admin','GET','192.168.1.1','[]','2019-08-07 11:02:31','2019-08-07 11:02:31'),
	(202,1,'admin/auth/roles','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-07 11:02:46','2019-08-07 11:02:46'),
	(203,1,'admin/auth/permissions','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-07 11:02:49','2019-08-07 11:02:49'),
	(204,1,'admin/auth/permissions/create','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-07 11:03:02','2019-08-07 11:03:02'),
	(205,1,'admin/auth/permissions','POST','192.168.1.1','{\"slug\":\"products\",\"name\":\"\\u5546\\u54c1\\u7ba1\\u7406\",\"http_method\":[null],\"http_path\":\"\\/products*\",\"_token\":\"CTYmxgIkbJbOY2AoJgLdeVWftxjdw3MtgLHtSSQB\",\"_previous_\":\"http:\\/\\/laravel-shop.test\\/admin\\/auth\\/permissions\"}','2019-08-07 11:03:34','2019-08-07 11:03:34'),
	(206,1,'admin/auth/permissions','GET','192.168.1.1','[]','2019-08-07 11:03:34','2019-08-07 11:03:34'),
	(207,1,'admin/auth/permissions/create','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-07 11:03:42','2019-08-07 11:03:42'),
	(208,1,'admin/auth/permissions','POST','192.168.1.1','{\"slug\":\"coupon_codes\",\"name\":\"\\u4f18\\u60e0\\u5238\\u7ba1\\u7406\",\"http_method\":[null],\"http_path\":\"\\/coupon_codes\",\"_token\":\"CTYmxgIkbJbOY2AoJgLdeVWftxjdw3MtgLHtSSQB\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/laravel-shop.test\\/admin\\/auth\\/permissions\"}','2019-08-07 11:04:10','2019-08-07 11:04:10'),
	(209,1,'admin/auth/permissions/create','GET','192.168.1.1','[]','2019-08-07 11:04:11','2019-08-07 11:04:11'),
	(210,1,'admin/auth/permissions','POST','192.168.1.1','{\"slug\":\"orders\",\"name\":\"\\u8ba2\\u5355\\u7ba1\\u7406\",\"http_method\":[null],\"http_path\":\"\\/orders*\",\"_token\":\"CTYmxgIkbJbOY2AoJgLdeVWftxjdw3MtgLHtSSQB\"}','2019-08-07 11:04:30','2019-08-07 11:04:30'),
	(211,1,'admin/auth/permissions','GET','192.168.1.1','[]','2019-08-07 11:04:32','2019-08-07 11:04:32'),
	(212,1,'admin/auth/roles','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-07 11:04:43','2019-08-07 11:04:43'),
	(213,1,'admin/auth/roles/2/edit','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-07 11:04:46','2019-08-07 11:04:46'),
	(214,1,'admin/auth/roles/2','PUT','192.168.1.1','{\"slug\":\"operation\",\"name\":\"\\u8fd0\\u8425\",\"permissions\":[\"2\",\"3\",\"4\",\"6\",\"7\",\"8\",\"9\",null],\"_token\":\"CTYmxgIkbJbOY2AoJgLdeVWftxjdw3MtgLHtSSQB\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/laravel-shop.test\\/admin\\/auth\\/roles\"}','2019-08-07 11:04:53','2019-08-07 11:04:53'),
	(215,1,'admin/auth/roles','GET','192.168.1.1','[]','2019-08-07 11:04:54','2019-08-07 11:04:54'),
	(216,1,'admin/auth/users','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-07 11:05:11','2019-08-07 11:05:11'),
	(217,1,'admin/auth/logout','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-07 11:05:20','2019-08-07 11:05:20'),
	(218,2,'admin','GET','192.168.1.1','[]','2019-08-07 11:05:31','2019-08-07 11:05:31'),
	(219,2,'admin/users','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-07 11:05:40','2019-08-07 11:05:40'),
	(220,2,'admin/products','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-07 11:05:43','2019-08-07 11:05:43'),
	(221,2,'admin/orders','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-07 11:05:48','2019-08-07 11:05:48'),
	(222,2,'admin/coupon_codes','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-07 11:05:50','2019-08-07 11:05:50'),
	(223,2,'admin/coupon_codes','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\",\"_export_\":\"selected:11,2,3,4,5,6,7,8,9,10\"}','2019-08-07 11:06:27','2019-08-07 11:06:27'),
	(224,2,'admin/coupon_codes','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-07 11:07:45','2019-08-07 11:07:45'),
	(225,2,'admin/coupon_codes','GET','192.168.1.1','{\"_columns_\":\"id,name,code,description,enabled,created_at\",\"_pjax\":\"#pjax-container\"}','2019-08-07 11:07:54','2019-08-07 11:07:54'),
	(226,2,'admin/coupon_codes','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\"}','2019-08-07 11:08:01','2019-08-07 11:08:01'),
	(227,2,'admin/coupon_codes','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\",\"id\":\"3\"}','2019-08-07 11:08:21','2019-08-07 11:08:21'),
	(228,2,'admin/coupon_codes','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\",\"id\":\"1\"}','2019-08-07 11:08:27','2019-08-07 11:08:27'),
	(229,2,'admin/coupon_codes','GET','192.168.1.1','{\"_pjax\":\"#pjax-container\",\"id\":null}','2019-08-07 11:08:33','2019-08-07 11:08:33');

/*!40000 ALTER TABLE `admin_operation_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_permissions`;

CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_permissions` WRITE;
/*!40000 ALTER TABLE `admin_permissions` DISABLE KEYS */;

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`)
VALUES
	(1,'All permission','*','','*',NULL,NULL),
	(2,'Dashboard','dashboard','GET','/',NULL,NULL),
	(3,'Login','auth.login','','/auth/login\r\n/auth/logout',NULL,NULL),
	(4,'User setting','auth.setting','GET,PUT','/auth/setting',NULL,NULL),
	(5,'Auth management','auth.management','','/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs',NULL,NULL),
	(6,'用户管理','users','','/users*','2019-08-02 08:26:28','2019-08-02 08:26:28'),
	(7,'商品管理','products','','/products*','2019-08-07 11:03:34','2019-08-07 11:03:34'),
	(8,'优惠券管理','coupon_codes','','/coupon_codes','2019-08-07 11:04:11','2019-08-07 11:04:11'),
	(9,'订单管理','orders','','/orders*','2019-08-07 11:04:31','2019-08-07 11:04:31');

/*!40000 ALTER TABLE `admin_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_role_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_role_menu`;

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_role_menu` WRITE;
/*!40000 ALTER TABLE `admin_role_menu` DISABLE KEYS */;

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`)
VALUES
	(1,2,NULL,NULL);

/*!40000 ALTER TABLE `admin_role_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_role_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_role_permissions`;

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_role_permissions` WRITE;
/*!40000 ALTER TABLE `admin_role_permissions` DISABLE KEYS */;

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`)
VALUES
	(1,1,NULL,NULL),
	(2,2,NULL,NULL),
	(2,3,NULL,NULL),
	(2,4,NULL,NULL),
	(2,6,NULL,NULL),
	(2,7,NULL,NULL),
	(2,8,NULL,NULL),
	(2,9,NULL,NULL);

/*!40000 ALTER TABLE `admin_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_role_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_role_users`;

CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_role_users` WRITE;
/*!40000 ALTER TABLE `admin_role_users` DISABLE KEYS */;

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`)
VALUES
	(1,1,NULL,NULL),
	(2,2,NULL,NULL);

/*!40000 ALTER TABLE `admin_role_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_roles`;

CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_roles` WRITE;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`)
VALUES
	(1,'Administrator','administrator','2019-08-02 07:38:31','2019-08-02 07:38:31'),
	(2,'运营','operation','2019-08-02 08:53:27','2019-08-02 08:53:27');

/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_user_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_user_permissions`;

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table admin_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_users`;

CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'admin','$2y$10$mq.r5rdNL0stDF/bmAuUmO0gTP0Aklp22qZkg2EASd2JynAv093YK','Administrator','images/jobs.png','RhI62Z9dViMXNctf2FQ3xj9gKtGkZtozwFcUsaK7Vxe07u45AsQNxz2ucf8X','2019-08-02 07:38:31','2019-08-07 07:28:19'),
	(2,'operator','$2y$10$37YjXC65aDenCsMLJWYVV.pTc5GDh5gwHtlCM9p1q0K33HuISM1qm','运营',NULL,'TulZ4vKUOoieQcO8HCvJ5o1CqWCzjqsAvVrng2T0QBpZS6HQGhm2svLe5qLj','2019-08-02 08:55:55','2019-08-02 08:55:55');

/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cart_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cart_items`;

CREATE TABLE `cart_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `product_sku_id` bigint(20) unsigned NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_items_user_id_foreign` (`user_id`),
  KEY `cart_items_product_sku_id_foreign` (`product_sku_id`),
  CONSTRAINT `cart_items_product_sku_id_foreign` FOREIGN KEY (`product_sku_id`) REFERENCES `product_skus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;

INSERT INTO `cart_items` (`id`, `user_id`, `product_sku_id`, `amount`)
VALUES
	(5,1,58,1);

/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table coupon_codes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `coupon_codes`;

CREATE TABLE `coupon_codes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `total` int(10) unsigned NOT NULL,
  `used` int(10) unsigned NOT NULL DEFAULT '0',
  `min_amount` decimal(10,2) NOT NULL,
  `not_before` datetime DEFAULT NULL,
  `not_after` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupon_codes_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `coupon_codes` WRITE;
/*!40000 ALTER TABLE `coupon_codes` DISABLE KEYS */;

INSERT INTO `coupon_codes` (`id`, `name`, `code`, `type`, `value`, `total`, `used`, `min_amount`, `not_before`, `not_after`, `enabled`, `created_at`, `updated_at`)
VALUES
	(2,'doloremque consequatur harum','JC3TQ8XUPABJZUEC','percent',5.00,1000,1,851.00,NULL,NULL,1,'2019-08-07 09:54:17','2019-08-07 10:51:55'),
	(3,'rerum similique repudiandae','G2CYPO5DRWKJVORV','percent',46.00,1000,0,0.00,NULL,NULL,1,'2019-08-07 09:54:17','2019-08-07 09:54:17'),
	(4,'qui quia et','AQQPFNHVDBCRVRIO','fixed',115.00,1000,0,115.01,NULL,NULL,1,'2019-08-07 09:54:17','2019-08-07 09:54:17'),
	(5,'nisi rerum dolore','7IXTC7CUTQTHA0ZZ','percent',48.00,1000,0,0.00,NULL,NULL,1,'2019-08-07 09:54:17','2019-08-07 09:54:17'),
	(6,'dolorem rerum ullam','JH4TB58FAJ8M1KG2','fixed',70.00,1000,0,70.01,NULL,NULL,1,'2019-08-07 09:54:17','2019-08-07 09:54:17'),
	(7,'molestias quasi quis','CWKOSFIXXCEV1B4L','percent',19.00,1000,0,376.00,NULL,NULL,1,'2019-08-07 09:54:17','2019-08-07 09:54:17'),
	(8,'molestiae consectetur est','ZTEOBJXNNE7GP9PZ','percent',13.00,1000,0,0.00,NULL,NULL,1,'2019-08-07 09:54:17','2019-08-07 09:54:17'),
	(9,'dolor nisi voluptatum','APEHUSBRQ90R1TV5','fixed',16.00,1000,0,16.01,NULL,NULL,1,'2019-08-07 09:54:17','2019-08-07 09:54:17'),
	(10,'esse suscipit aliquam','24MPMQRPQQEFZGHR','fixed',18.00,1000,0,18.01,NULL,NULL,1,'2019-08-07 09:54:17','2019-08-07 09:54:17'),
	(11,'大酬宾半价特惠','hellolaravel','fixed',50.00,100,1,100.00,'2019-08-07 00:00:00','2019-08-14 00:00:00',1,'2019-08-07 10:07:10','2019-08-07 10:42:42');

/*!40000 ALTER TABLE `coupon_codes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2019_08_02_054658_create_user_addresses_table',2),
	(4,'2016_01_04_173148_create_admin_tables',3),
	(5,'2019_08_02_092054_create_products_table',4),
	(6,'2019_08_02_092159_create_product_skus_table',4),
	(7,'2019_08_05_075437_create_user_favorite_products_table',5),
	(8,'2019_08_05_084719_create_cart_items_table',6),
	(9,'2019_08_05_101324_create_orders_table',7),
	(10,'2019_08_05_101428_create_order_items_table',7),
	(11,'2019_08_07_092433_create_coupon_codes_table',8),
	(12,'2019_08_07_093137_orders_add_code_id',8);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_items`;

CREATE TABLE `order_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `product_sku_id` bigint(20) unsigned NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `rating` int(10) unsigned DEFAULT NULL,
  `review` text COLLATE utf8mb4_unicode_ci,
  `reviewed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`),
  KEY `order_items_product_sku_id_foreign` (`product_sku_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_product_sku_id_foreign` FOREIGN KEY (`product_sku_id`) REFERENCES `product_skus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_sku_id`, `amount`, `price`, `rating`, `review`, `reviewed_at`, `created_at`, `updated_at`)
VALUES
	(1,6,4,10,1,1287.00,NULL,NULL,NULL,NULL,NULL),
	(2,7,15,43,1,3516.00,NULL,NULL,NULL,NULL,NULL),
	(3,8,6,16,1,6449.00,NULL,NULL,NULL,NULL,NULL),
	(4,9,4,10,1,1287.00,NULL,NULL,NULL,NULL,NULL),
	(5,10,16,46,1,1922.00,5,'你真帅',NULL,NULL,NULL),
	(6,11,7,18,1,6914.00,NULL,NULL,NULL,NULL,NULL),
	(7,12,8,23,1,2603.00,NULL,NULL,NULL,NULL,NULL),
	(8,13,4,10,1,1287.00,NULL,NULL,NULL,NULL,NULL),
	(9,13,20,58,1,1.00,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci,
  `paid_at` datetime DEFAULT NULL,
  `coupon_code_id` bigint(20) unsigned DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refund_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `refund_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `reviewed` tinyint(1) NOT NULL DEFAULT '0',
  `ship_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `ship_data` text COLLATE utf8mb4_unicode_ci,
  `extra` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_no_unique` (`no`),
  UNIQUE KEY `orders_refund_no_unique` (`refund_no`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_coupon_code_id_foreign` (`coupon_code_id`),
  CONSTRAINT `orders_coupon_code_id_foreign` FOREIGN KEY (`coupon_code_id`) REFERENCES `coupon_codes` (`id`) ON DELETE SET NULL,
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;

INSERT INTO `orders` (`id`, `no`, `user_id`, `address`, `total_amount`, `remark`, `paid_at`, `coupon_code_id`, `payment_method`, `payment_no`, `refund_status`, `refund_no`, `closed`, `reviewed`, `ship_status`, `ship_data`, `extra`, `created_at`, `updated_at`)
VALUES
	(6,'20190805151926675338',1,'{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c61\\u8857\\u9053\\u7b2c718\\u53f7\",\"zip\":65500,\"contact_name\":\"\\u90dd\\u5029\",\"contact_phone\":\"18568999505\"}',1287.00,NULL,NULL,NULL,NULL,NULL,'pending',NULL,0,0,'pending',NULL,NULL,'2019-08-05 15:19:26','2019-08-05 15:19:26'),
	(7,'20190805154332321656',1,'{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c61\\u8857\\u9053\\u7b2c718\\u53f7\",\"zip\":65500,\"contact_name\":\"\\u90dd\\u5029\",\"contact_phone\":\"18568999505\"}',3516.00,NULL,NULL,NULL,NULL,NULL,'pending',NULL,1,0,'pending',NULL,NULL,'2019-08-05 15:43:32','2019-08-05 15:44:04'),
	(8,'20190805162032566944',1,'{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c61\\u8857\\u9053\\u7b2c718\\u53f7\",\"zip\":65500,\"contact_name\":\"\\u90dd\\u5029\",\"contact_phone\":\"18568999505\"}',6449.00,NULL,NULL,NULL,NULL,NULL,'pending',NULL,1,0,'pending',NULL,NULL,'2019-08-05 16:20:33','2019-08-06 15:31:21'),
	(9,'20190805163412193744',1,'{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c61\\u8857\\u9053\\u7b2c718\\u53f7\",\"zip\":65500,\"contact_name\":\"\\u90dd\\u5029\",\"contact_phone\":\"18568999505\"}',1287.00,NULL,NULL,NULL,NULL,NULL,'pending',NULL,1,0,'pending',NULL,NULL,'2019-08-05 16:34:12','2019-08-06 15:31:21'),
	(10,'20190806144750678963',1,'{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c61\\u8857\\u9053\\u7b2c718\\u53f7\",\"zip\":65500,\"contact_name\":\"\\u90dd\\u5029\",\"contact_phone\":\"18568999505\"}',1922.00,NULL,'2019-08-06 14:51:15',NULL,'alipay','2019080622001428661000043792','success','01fe50c2a88e423ea65b73f321477434',0,1,'received','{\"express_company\":\"\\u987a\\u4e30\",\"express_no\":\"12345678\"}','{\"refund_reason\":\"\\u518d\\u6b21\\u9000\\u6b3e\"}','2019-08-06 14:47:50','2019-08-07 08:08:36'),
	(11,'20190807104207520890',1,'{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c61\\u8857\\u9053\\u7b2c718\\u53f7\",\"zip\":65500,\"contact_name\":\"\\u90dd\\u5029\",\"contact_phone\":\"18568999505\"}',6914.00,NULL,NULL,NULL,NULL,NULL,'pending',NULL,0,0,'pending',NULL,NULL,'2019-08-07 10:42:07','2019-08-07 10:42:07'),
	(12,'20190807104242078020',1,'{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c61\\u8857\\u9053\\u7b2c718\\u53f7\",\"zip\":65500,\"contact_name\":\"\\u90dd\\u5029\",\"contact_phone\":\"18568999505\"}',2553.00,NULL,NULL,11,NULL,NULL,'pending',NULL,0,0,'pending',NULL,NULL,'2019-08-07 10:42:42','2019-08-07 10:42:42'),
	(13,'20190807105155833146',1,'{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c61\\u8857\\u9053\\u7b2c718\\u53f7\",\"zip\":65500,\"contact_name\":\"\\u90dd\\u5029\",\"contact_phone\":\"18568999505\"}',1223.60,NULL,NULL,2,NULL,NULL,'pending',NULL,0,0,'pending',NULL,NULL,'2019-08-07 10:51:55','2019-08-07 10:51:55');

/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table product_skus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_skus`;

CREATE TABLE `product_skus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(10) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_skus_product_id_foreign` (`product_id`),
  CONSTRAINT `product_skus_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `product_skus` WRITE;
/*!40000 ALTER TABLE `product_skus` DISABLE KEYS */;

INSERT INTO `product_skus` (`id`, `title`, `description`, `price`, `stock`, `product_id`, `created_at`, `updated_at`)
VALUES
	(1,'银色 64G','iPhone x 银色 64G',8848.00,100,1,'2019-08-05 02:13:27','2019-08-05 02:13:27'),
	(2,'灰色 256G 特价','iPhone x 灰色 256G 老板疯了',1.00,100,1,'2019-08-05 02:13:27','2019-08-07 10:50:17'),
	(3,'vitae','Rerum enim eum eos.',5868.00,21336,2,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(4,'in','Beatae fugit id voluptatibus in est deleniti.',1589.00,27874,2,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(5,'a','Eos autem voluptate deleniti nobis.',7013.00,85955,2,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(6,'quo','Ipsum nisi exercitationem facere et.',4777.00,43910,3,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(7,'vel','Ullam recusandae necessitatibus ducimus.',909.00,9251,3,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(8,'voluptatem','Dolores veniam et tempore nam.',5588.00,73725,3,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(9,'sapiente','Et sed tempora quae harum quibusdam dolores.',4195.00,36873,4,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(10,'fuga','Illum dolores aperiam soluta voluptatem ducimus sit expedita.',1287.00,97933,4,'2019-08-05 02:56:50','2019-08-07 10:51:55'),
	(11,'sapiente','Mollitia odit provident laudantium labore modi.',2206.00,70481,4,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(12,'et','Eveniet neque quae eum ab quasi laboriosam corporis itaque.',6803.00,1767,5,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(13,'odio','Doloribus enim in magnam voluptas repudiandae enim.',1701.00,10529,5,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(14,'consequatur','Totam et tempora veniam et delectus.',743.00,610,5,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(15,'qui','Nesciunt minus nam aliquam fuga et.',5423.00,92715,6,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(16,'ut','Eligendi ea eaque incidunt eum deserunt sint aut.',6449.00,97755,6,'2019-08-05 02:56:50','2019-08-06 15:31:21'),
	(17,'voluptas','Deserunt perferendis quos ipsa ducimus qui reiciendis.',5100.00,76984,6,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(18,'ut','Quia magni quam quis autem voluptas eius eius.',6914.00,21328,7,'2019-08-05 02:56:50','2019-08-07 10:42:07'),
	(19,'recusandae','Ullam tempora rerum deleniti earum qui quis.',3669.00,21099,7,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(20,'dicta','Et animi ut quasi odio dolorem vitae.',5305.00,85597,7,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(21,'reprehenderit','Vero ut doloremque et rerum omnis enim repudiandae.',3379.00,17642,8,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(22,'fugit','Sint iure est quos sit assumenda quam perferendis.',5692.00,25748,8,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(23,'cupiditate','Aut neque est consequuntur et est.',2603.00,1655,8,'2019-08-05 02:56:50','2019-08-07 10:42:42'),
	(24,'a','Nesciunt voluptatem voluptatem distinctio unde quasi.',3425.00,92084,9,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(25,'aut','Est et est voluptatem officia in atque.',8388.00,26013,9,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(26,'nemo','Reiciendis omnis sed vel non dolorem.',3012.00,86508,9,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(27,'ipsam','Eius deserunt dolore at consequuntur labore.',9170.00,11034,10,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(28,'culpa','Consequatur qui sed sunt sit enim.',6264.00,58673,10,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(29,'rerum','Quia fuga quia laborum fugiat.',8992.00,82907,10,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(30,'incidunt','Fugiat enim temporibus in et.',5386.00,78359,11,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(31,'sed','Maiores nam consectetur rem et dolorem mollitia.',1139.00,81918,11,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(32,'minima','Rerum possimus ut nisi eum.',1937.00,70852,11,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(33,'qui','Qui doloribus velit aut quo et.',8279.00,15255,12,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(34,'libero','Placeat non neque corrupti et.',8785.00,1587,12,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(35,'quibusdam','Ab voluptate unde iste unde enim eveniet dolores.',8262.00,57073,12,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(36,'dolorem','Facilis adipisci a sed commodi repudiandae ad nostrum exercitationem.',5035.00,13158,13,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(37,'dolorem','Sint adipisci atque laudantium non.',9396.00,80502,13,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(38,'libero','Et fuga tenetur ea sint occaecati dignissimos iusto.',7595.00,51205,13,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(39,'magni','Neque voluptatem sit fugiat accusantium.',5667.00,66471,14,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(40,'debitis','Laboriosam veritatis reprehenderit voluptatem molestiae.',8166.00,29488,14,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(41,'facilis','Repudiandae numquam non distinctio eius voluptas delectus.',5939.00,64116,14,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(42,'inventore','Animi fugit repudiandae libero magni doloremque saepe dolorum fugit.',521.00,47899,15,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(43,'nemo','Atque architecto veniam tempora.',3516.00,67528,15,'2019-08-05 02:56:50','2019-08-05 15:44:04'),
	(44,'ducimus','Et doloribus et voluptatem tempora ipsa ea.',5519.00,29817,15,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(45,'incidunt','Sapiente temporibus numquam voluptatum asperiores et rerum.',8492.00,10893,16,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(46,'porro','Rem nisi amet molestias quidem odio.',1922.00,15157,16,'2019-08-05 02:56:50','2019-08-06 14:47:50'),
	(47,'explicabo','Libero et esse ut et.',2536.00,13721,16,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(48,'dolor','Aliquid reiciendis dolore sint nemo ad.',5249.00,50790,17,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(49,'veniam','Ipsa ab optio temporibus reiciendis.',3448.00,17513,17,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(50,'et','Placeat non beatae ipsa magnam quaerat qui dolor.',5024.00,19271,17,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(51,'voluptas','Quidem aliquam vero autem ut accusamus distinctio aspernatur.',6424.00,16169,18,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(52,'consequatur','Quaerat ullam aspernatur fugiat.',9289.00,84824,18,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(53,'eum','Debitis iure nisi dignissimos.',7511.00,36565,18,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(54,'officia','Aut debitis ea officiis facilis sed eum.',5055.00,55971,19,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(55,'adipisci','Dolores iure culpa laborum corporis aut ad dolorem.',2571.00,80133,19,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(56,'expedita','Provident fugit a tempora ullam rerum.',6458.00,24896,19,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(57,'ipsa','Laborum voluptatem reprehenderit omnis ex maxime voluptatum.',9663.00,55662,20,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(58,'est','Laboriosam consequatur aliquid et quo praesentium est assumenda maxime.',1.00,43574,20,'2019-08-05 02:56:50','2019-08-07 10:51:55'),
	(59,'quam','Vel sunt aut sit fugit.',393.00,66611,20,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(60,'consequatur','Sint pariatur aut quia nesciunt accusamus.',7390.00,58578,21,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(61,'exercitationem','Iure alias placeat omnis reiciendis consequuntur.',603.00,65776,21,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(62,'quibusdam','Voluptatibus quaerat nihil perspiciatis dignissimos.',8059.00,61194,21,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(63,'illo','Maxime impedit ullam porro incidunt qui aut quibusdam.',6339.00,81505,22,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(64,'itaque','Occaecati dolor iste voluptatem sit voluptas vero dolorem.',5999.00,38820,22,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(65,'ipsam','Quas vel vero est rerum occaecati.',3666.00,75126,22,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(66,'minima','Suscipit magni eum explicabo neque rerum sint iure.',1867.00,38451,23,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(67,'illum','Odio omnis mollitia deleniti quis nemo est et.',6590.00,95440,23,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(68,'est','Minima illo quia sed voluptatem et est dolor.',4355.00,81115,23,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(69,'quibusdam','Eaque laboriosam laudantium sapiente praesentium dolor illum.',2148.00,93869,24,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(70,'possimus','Cum harum rerum ut est.',9409.00,8347,24,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(71,'error','Consequatur nemo minima velit accusantium est et temporibus.',7033.00,57565,24,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(72,'consectetur','Quia aut quae cumque dolorem quo quis atque.',8865.00,99235,25,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(73,'cumque','Dolorem ut earum possimus accusamus sunt quo.',5014.00,36301,25,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(74,'unde','At quidem alias ut.',5689.00,87137,25,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(75,'dolorum','Pariatur et corrupti culpa eum consequatur nam.',1204.00,48668,26,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(76,'illum','Qui modi cupiditate rem odit nobis occaecati nulla.',8665.00,62540,26,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(77,'et','Labore aut rerum est hic.',2378.00,92955,26,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(78,'quia','Et nesciunt animi aut error ad rem.',3043.00,64992,27,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(79,'alias','Et officia nostrum voluptas molestiae.',7216.00,37883,27,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(80,'nihil','Maxime deleniti ut dolorem porro a fugit.',8084.00,30894,27,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(81,'distinctio','Accusamus ipsam dicta quis cupiditate eius culpa.',4319.00,91688,28,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(82,'doloremque','Architecto quo consequatur sequi iure quaerat.',3162.00,17016,28,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(83,'et','Tenetur accusamus nihil consequatur et nam.',7003.00,88081,28,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(84,'aspernatur','Natus autem neque ipsam in est ad veniam.',6918.00,78873,29,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(85,'quos','Eligendi quo eligendi et sit.',5821.00,28161,29,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(86,'facilis','Sed earum nostrum quia deleniti earum.',4166.00,31132,29,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(87,'libero','Quia omnis quia sit soluta nihil dicta adipisci.',9019.00,88473,30,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(88,'repellat','Iusto dolore quaerat maiores tenetur qui eum.',7838.00,295,30,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(89,'odit','Tempore dolor quaerat fuga nostrum quis.',719.00,89265,30,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(90,'nam','Odit eligendi dolore natus sint.',5260.00,48500,31,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(91,'temporibus','Quia quia beatae ut ex repellat quasi laudantium.',9842.00,96343,31,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(92,'aliquid','Voluptatem ut odit neque vel sunt inventore.',6625.00,28533,31,'2019-08-05 02:56:50','2019-08-05 02:56:50');

/*!40000 ALTER TABLE `product_skus` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `on_sale` tinyint(1) NOT NULL DEFAULT '1',
  `rating` double(8,2) NOT NULL DEFAULT '5.00',
  `sold_count` int(10) unsigned NOT NULL DEFAULT '0',
  `review_count` int(10) unsigned NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;

INSERT INTO `products` (`id`, `title`, `description`, `image`, `on_sale`, `rating`, `sold_count`, `review_count`, `price`, `created_at`, `updated_at`)
VALUES
	(1,'Apple/苹果 iPhone x','<p>全网首发，只此一家</p>','images/iphonex.jpeg',0,5.00,0,0,1.00,'2019-08-05 02:13:27','2019-08-07 10:50:39'),
	(2,'fuga','<p>Sed minus unde error quos et rerum.</p>','https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg',0,2.00,0,0,1589.00,'2019-08-05 02:56:49','2019-08-05 09:57:34'),
	(3,'magni','<p>Velit eveniet excepturi ad commodi ut.</p>','https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg',0,0.00,0,0,909.00,'2019-08-05 02:56:50','2019-08-05 09:48:36'),
	(4,'et','Ut rem dicta magnam iure nesciunt et.','https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg',1,1.00,0,0,1287.00,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(5,'nostrum','Vero error ipsa et.','https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg',1,2.00,0,0,743.00,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(6,'ut','Repudiandae aut dolores voluptatem qui.','https://cdn.learnku.com/uploads/images/201806/01/5320/pa7DrV43Mw.jpg',1,1.00,0,0,5100.00,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(7,'alias','Sit iusto vel aut id et aut sed sunt.','https://cdn.learnku.com/uploads/images/201806/01/5320/pa7DrV43Mw.jpg',1,5.00,0,0,3669.00,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(8,'voluptatem','Labore velit aliquam enim laborum sunt doloremque reiciendis mollitia.','https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg',1,2.00,0,0,2603.00,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(9,'et','Eius id accusamus est commodi inventore molestias.','https://cdn.learnku.com/uploads/images/201806/01/5320/pa7DrV43Mw.jpg',1,3.00,0,0,3012.00,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(10,'nihil','Similique natus tempora nobis minus.','https://cdn.learnku.com/uploads/images/201806/01/5320/pa7DrV43Mw.jpg',1,4.00,0,0,6264.00,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(11,'ex','Quia reprehenderit autem fugit sapiente.','https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg',1,2.00,0,0,1139.00,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(12,'nobis','Facilis sed repellendus deleniti laudantium ut voluptatem.','https://cdn.learnku.com/uploads/images/201806/01/5320/C0bVuKB2nt.jpg',1,4.00,0,0,8262.00,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(13,'et','Ea ut omnis molestiae enim natus et.','https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg',1,3.00,0,0,5035.00,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(14,'et','Sint voluptates totam quis eos.','https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg',1,5.00,0,0,5667.00,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(15,'libero','Nesciunt et est exercitationem sed vitae in.','https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg',1,0.00,0,0,521.00,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(16,'doloremque','Eum fugit facilis eius qui nesciunt labore commodi.','https://cdn.learnku.com/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg',1,5.00,1,1,1922.00,'2019-08-05 02:56:50','2019-08-06 15:32:45'),
	(17,'eum','Sapiente sed rem veritatis voluptatum accusamus aut.','https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg',1,0.00,0,0,3448.00,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(18,'excepturi','Rerum dolor ut sunt incidunt consectetur aut.','https://cdn.learnku.com/uploads/images/201806/01/5320/2JMRaFwRpo.jpg',1,2.00,0,0,6424.00,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(19,'perspiciatis','Quod quo eum velit ea nobis et.','https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg',1,1.00,0,0,2571.00,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(20,'excepturi','<p>Consequatur velit harum aut ullam autem rerum quibusdam.</p>','https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg',1,3.00,0,0,1.00,'2019-08-05 02:56:50','2019-08-07 10:50:51'),
	(21,'numquam','Eius porro quidem modi rerum ex veniam in.','https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg',1,3.00,0,0,603.00,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(22,'voluptatem','Quibusdam tempore sit atque quia.','https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg',1,3.00,0,0,3666.00,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(23,'et','Illum id animi rerum quo.','https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg',1,3.00,0,0,1867.00,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(24,'eum','Ex itaque ea aspernatur doloribus cum et ipsam nulla.','https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg',1,2.00,0,0,2148.00,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(25,'dolorem','Quo a suscipit veniam sint quis.','https://cdn.learnku.com/uploads/images/201806/01/5320/2JMRaFwRpo.jpg',1,4.00,0,0,5014.00,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(26,'officiis','Velit rerum impedit sequi qui pariatur totam qui.','https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg',1,0.00,0,0,1204.00,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(27,'repellat','Animi consequuntur id eaque incidunt mollitia.','https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg',1,1.00,0,0,3043.00,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(28,'repudiandae','Rerum et distinctio asperiores repellendus et rerum et.','https://cdn.learnku.com/uploads/images/201806/01/5320/pa7DrV43Mw.jpg',1,3.00,0,0,3162.00,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(29,'iste','Occaecati sequi sint molestias omnis minima.','https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg',1,4.00,0,0,4166.00,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(30,'rem','Incidunt voluptatem dolores et harum cupiditate.','https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg',1,4.00,0,0,719.00,'2019-08-05 02:56:50','2019-08-05 02:56:50'),
	(31,'voluptatibus','Quos voluptas dicta dolor minima suscipit ullam fuga unde.','https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg',1,4.00,0,0,5260.00,'2019-08-05 02:56:50','2019-08-05 02:56:50');

/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_addresses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_addresses`;

CREATE TABLE `user_addresses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` int(10) unsigned NOT NULL,
  `contact_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_used_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_addresses_user_id_foreign` (`user_id`),
  CONSTRAINT `user_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `user_addresses` WRITE;
/*!40000 ALTER TABLE `user_addresses` DISABLE KEYS */;

INSERT INTO `user_addresses` (`id`, `user_id`, `province`, `city`, `district`, `address`, `zip`, `contact_name`, `contact_phone`, `last_used_at`, `created_at`, `updated_at`)
VALUES
	(1,1,'河北省','石家庄市','长安区','第61街道第718号',65500,'郝倩','18568999505','2019-08-07 10:51:55','2019-08-02 06:06:00','2019-08-07 10:51:55'),
	(2,1,'江苏省','苏州市','相城区','第97街道第325号',573600,'席博','13734076318',NULL,'2019-08-02 06:06:00','2019-08-02 06:06:00');

/*!40000 ALTER TABLE `user_addresses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_favorite_products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_favorite_products`;

CREATE TABLE `user_favorite_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_favorite_products_user_id_foreign` (`user_id`),
  KEY `user_favorite_products_product_id_foreign` (`product_id`),
  CONSTRAINT `user_favorite_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_favorite_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `user_favorite_products` WRITE;
/*!40000 ALTER TABLE `user_favorite_products` DISABLE KEYS */;

INSERT INTO `user_favorite_products` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`)
VALUES
	(3,1,2,'2019-08-05 08:36:38','2019-08-05 08:36:38');

/*!40000 ALTER TABLE `user_favorite_products` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'laravel','laravel@shop.com','2019-08-02 05:42:58','$2y$10$RRTrIMR/1BWUag5NYnR0COZ3L2Bt/ArKlfbElwkeajqyQrKEe4na6','0lUyr7DGte8uKsYdF4gkU78iiQSgkuJrWBFmRh37Ls3mpAhypTdP5Pz5r331','2019-08-02 05:33:21','2019-08-02 05:42:58'),
	(2,'root','root@shop.com','2019-08-02 05:43:56','$2y$10$urdGcWG8nycBjjwo69s6seyxUExVC14.eJNSptdrqVf1T/ZCDnJC.',NULL,'2019-08-02 05:43:37','2019-08-02 05:43:56');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
