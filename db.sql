-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add city',7,'add_city'),(26,'Can change city',7,'change_city'),(27,'Can delete city',7,'delete_city'),(28,'Can view city',7,'view_city'),(29,'Can add district',8,'add_district'),(30,'Can change district',8,'change_district'),(31,'Can delete district',8,'delete_district'),(32,'Can view district',8,'view_district'),(33,'Can add order',9,'add_order'),(34,'Can change order',9,'change_order'),(35,'Can delete order',9,'delete_order'),(36,'Can view order',9,'view_order'),(37,'Can add order voucher',10,'add_ordervoucher'),(38,'Can change order voucher',10,'change_ordervoucher'),(39,'Can delete order voucher',10,'delete_ordervoucher'),(40,'Can view order voucher',10,'view_ordervoucher'),(41,'Can add ward',11,'add_ward'),(42,'Can change ward',11,'change_ward'),(43,'Can delete ward',11,'delete_ward'),(44,'Can view ward',11,'view_ward'),(45,'Can add voucher',12,'add_voucher'),(46,'Can change voucher',12,'change_voucher'),(47,'Can delete voucher',12,'delete_voucher'),(48,'Can view voucher',12,'view_voucher'),(49,'Can add rating',13,'add_rating'),(50,'Can change rating',13,'change_rating'),(51,'Can delete rating',13,'delete_rating'),(52,'Can view rating',13,'view_rating'),(53,'Can add auction',14,'add_auction'),(54,'Can change auction',14,'change_auction'),(55,'Can delete auction',14,'delete_auction'),(56,'Can view auction',14,'view_auction'),(57,'Can add application',15,'add_application'),(58,'Can change application',15,'change_application'),(59,'Can delete application',15,'delete_application'),(60,'Can view application',15,'view_application'),(61,'Can add access token',16,'add_accesstoken'),(62,'Can change access token',16,'change_accesstoken'),(63,'Can delete access token',16,'delete_accesstoken'),(64,'Can view access token',16,'view_accesstoken'),(65,'Can add grant',17,'add_grant'),(66,'Can change grant',17,'change_grant'),(67,'Can delete grant',17,'delete_grant'),(68,'Can view grant',17,'view_grant'),(69,'Can add refresh token',18,'add_refreshtoken'),(70,'Can change refresh token',18,'change_refreshtoken'),(71,'Can delete refresh token',18,'delete_refreshtoken'),(72,'Can view refresh token',18,'view_refreshtoken'),(73,'Can add id token',19,'add_idtoken'),(74,'Can change id token',19,'change_idtoken'),(75,'Can delete id token',19,'delete_idtoken'),(76,'Can view id token',19,'view_idtoken');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_htproject_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_htproject_user_id` FOREIGN KEY (`user_id`) REFERENCES `htproject_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-12-17 05:39:40.893943','325','Tân Thới Hòa',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',11,1),(2,'2023-12-17 05:40:08.584021','323','Tân Thành',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',11,1),(3,'2023-12-17 05:40:37.154429','324','Tân Thới Hoà',3,'',11,1),(4,'2023-12-17 05:40:45.394144','322','Tân Thành',3,'',11,1),(5,'2023-12-17 05:40:54.171621','314','HIEPTAN',3,'',11,1),(6,'2023-12-23 16:31:07.522739','4','Tân Thành',3,'',7,1),(7,'2023-12-23 16:31:12.427533','5','Thảo Điền',3,'',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(14,'htproject','auction'),(7,'htproject','city'),(8,'htproject','district'),(9,'htproject','order'),(10,'htproject','ordervoucher'),(13,'htproject','rating'),(6,'htproject','user'),(12,'htproject','voucher'),(11,'htproject','ward'),(16,'oauth2_provider','accesstoken'),(15,'oauth2_provider','application'),(17,'oauth2_provider','grant'),(19,'oauth2_provider','idtoken'),(18,'oauth2_provider','refreshtoken'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-12-17 05:37:24.001605'),(2,'contenttypes','0002_remove_content_type_name','2023-12-17 05:37:24.147088'),(3,'auth','0001_initial','2023-12-17 05:37:24.879265'),(4,'auth','0002_alter_permission_name_max_length','2023-12-17 05:37:24.970828'),(5,'auth','0003_alter_user_email_max_length','2023-12-17 05:37:24.982763'),(6,'auth','0004_alter_user_username_opts','2023-12-17 05:37:24.993730'),(7,'auth','0005_alter_user_last_login_null','2023-12-17 05:37:25.001708'),(8,'auth','0006_require_contenttypes_0002','2023-12-17 05:37:25.004700'),(9,'auth','0007_alter_validators_add_error_messages','2023-12-17 05:37:25.010684'),(10,'auth','0008_alter_user_username_max_length','2023-12-17 05:37:25.017728'),(11,'auth','0009_alter_user_last_name_max_length','2023-12-17 05:37:25.023715'),(12,'auth','0010_alter_group_name_max_length','2023-12-17 05:37:25.038377'),(13,'auth','0011_update_proxy_permissions','2023-12-17 05:37:25.045358'),(14,'auth','0012_alter_user_first_name_max_length','2023-12-17 05:37:25.052340'),(15,'htproject','0001_initial','2023-12-17 05:37:27.460321'),(16,'admin','0001_initial','2023-12-17 05:37:27.732148'),(17,'admin','0002_logentry_remove_auto_add','2023-12-17 05:37:27.753093'),(18,'admin','0003_logentry_add_action_flag_choices','2023-12-17 05:37:27.777217'),(19,'htproject','0002_alter_auction_content_alter_order_content_and_more','2023-12-17 05:37:28.058127'),(20,'htproject','0003_auction_title','2023-12-17 05:37:28.087678'),(21,'htproject','0004_alter_auction_title_alter_order_title','2023-12-17 05:37:28.262436'),(22,'oauth2_provider','0001_initial','2023-12-17 05:37:29.399659'),(23,'oauth2_provider','0002_auto_20190406_1805','2023-12-17 05:37:29.669959'),(24,'oauth2_provider','0003_auto_20201211_1314','2023-12-17 05:37:29.739131'),(25,'oauth2_provider','0004_auto_20200902_2022','2023-12-17 05:37:30.371190'),(26,'oauth2_provider','0005_auto_20211222_2352','2023-12-17 05:37:30.505069'),(27,'oauth2_provider','0006_alter_application_client_secret','2023-12-17 05:37:30.591319'),(28,'oauth2_provider','0007_application_post_logout_redirect_uris','2023-12-17 05:37:30.772493'),(29,'sessions','0001_initial','2023-12-17 05:37:30.804787');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('p6jzveyouwoj865me4ms8f08v55wp8wz','.eJxVjDsOwjAQBe_iGlne-BMvJT1nsNZrLwmgRIqTCnF3iJQC2jcz76USbeuQtlaXNBZ1VqBOv1smftRpB-VO023WPE_rMma9K_qgTV_nUp-Xw_07GKgN39rXECMQ9N4b6DByRgvRoatovAPkLAjWRhQS04sUieQZxDB3LgSr3h-0czcq:1rHnlW:eDZ27cn-TvQmc9kK5rqfIlmz0qECLWdEBlH2BqkL9rI','2024-01-08 16:25:18.848164'),('vke9842bywpgskf1wse9tke7i8mqwc08','.eJxVjDsOwjAQBe_iGlne-BMvJT1nsNZrLwmgRIqTCnF3iJQC2jcz76USbeuQtlaXNBZ1VqBOv1smftRpB-VO023WPE_rMma9K_qgTV_nUp-Xw_07GKgN39rXECMQ9N4b6DByRgvRoatovAPkLAjWRhQS04sUieQZxDB3LgSr3h-0czcq:1rHnB5:iTlvmVJGvcbqzglxXFFIlYjU-GmX4WP9X5D6uHhDZQU','2024-01-08 15:47:39.230321');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `htproject_auction`
--

DROP TABLE IF EXISTS `htproject_auction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `htproject_auction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` date DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` bigint NOT NULL,
  `shipper_id` bigint NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `htproject_auction_order_id_8641bae2_fk_htproject_order_id` (`order_id`),
  KEY `htproject_auction_shipper_id_c9c024d8_fk_htproject_user_id` (`shipper_id`),
  CONSTRAINT `htproject_auction_order_id_8641bae2_fk_htproject_order_id` FOREIGN KEY (`order_id`) REFERENCES `htproject_order` (`id`),
  CONSTRAINT `htproject_auction_shipper_id_c9c024d8_fk_htproject_user_id` FOREIGN KEY (`shipper_id`) REFERENCES `htproject_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htproject_auction`
--

LOCK TABLES `htproject_auction` WRITE;
/*!40000 ALTER TABLE `htproject_auction` DISABLE KEYS */;
/*!40000 ALTER TABLE `htproject_auction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `htproject_city`
--

DROP TABLE IF EXISTS `htproject_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `htproject_city` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htproject_city`
--

LOCK TABLES `htproject_city` WRITE;
/*!40000 ALTER TABLE `htproject_city` DISABLE KEYS */;
INSERT INTO `htproject_city` VALUES (1,'Thành phố Hồ Chí Minh'),(2,'Hà Nội'),(3,'Hải Phòng');
/*!40000 ALTER TABLE `htproject_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `htproject_district`
--

DROP TABLE IF EXISTS `htproject_district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `htproject_district` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `htproject_district_city_id_9e1b697c_fk_htproject_city_id` (`city_id`),
  CONSTRAINT `htproject_district_city_id_9e1b697c_fk_htproject_city_id` FOREIGN KEY (`city_id`) REFERENCES `htproject_city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htproject_district`
--

LOCK TABLES `htproject_district` WRITE;
/*!40000 ALTER TABLE `htproject_district` DISABLE KEYS */;
INSERT INTO `htproject_district` VALUES (1,'Quận 1',1),(2,'Quận 2',1),(3,'Quận 3',1),(4,'Quận 4',1),(5,'Quận 5',1),(6,'Quận 6',1),(7,'Quận 7',1),(8,'Quận 8',1),(9,'Quận 9',1),(10,'Quận 10',1),(11,'Quận 11',1),(12,'Quận 12',1),(13,'Bình Chánh',1),(14,'Bình Tân',1),(15,'Bình Thạnh',1),(16,'Cần Giờ',1),(17,'Củ Chi',1),(18,'Gò Vấp',1),(19,'Hóc Môn',1),(20,'Nhà Bè',1),(21,'Phú Nhuận',1),(22,'Tân Bình',1),(23,'Tân Phú',1),(24,'Thủ Đức',1);
/*!40000 ALTER TABLE `htproject_district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `htproject_order`
--

DROP TABLE IF EXISTS `htproject_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `htproject_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` date DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deliveryDate` date DEFAULT NULL,
  `fromStreet` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `toStreet` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` bigint DEFAULT NULL,
  `fromWard_id` bigint DEFAULT NULL,
  `shipper_id` bigint DEFAULT NULL,
  `toWard_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `htproject_order_fromWard_id_3faa4781_fk_htproject_ward_id` (`fromWard_id`),
  KEY `htproject_order_shipper_id_c6d80958_fk_htproject_user_id` (`shipper_id`),
  KEY `htproject_order_toWard_id_0770e0fe_fk_htproject_ward_id` (`toWard_id`),
  KEY `htproject_order_customer_id_9cdebc13_fk_htproject_user_id` (`customer_id`),
  CONSTRAINT `htproject_order_customer_id_9cdebc13_fk_htproject_user_id` FOREIGN KEY (`customer_id`) REFERENCES `htproject_user` (`id`),
  CONSTRAINT `htproject_order_fromWard_id_3faa4781_fk_htproject_ward_id` FOREIGN KEY (`fromWard_id`) REFERENCES `htproject_ward` (`id`),
  CONSTRAINT `htproject_order_shipper_id_c6d80958_fk_htproject_user_id` FOREIGN KEY (`shipper_id`) REFERENCES `htproject_user` (`id`),
  CONSTRAINT `htproject_order_toWard_id_0770e0fe_fk_htproject_ward_id` FOREIGN KEY (`toWard_id`) REFERENCES `htproject_ward` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htproject_order`
--

LOCK TABLES `htproject_order` WRITE;
/*!40000 ALTER TABLE `htproject_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `htproject_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `htproject_ordervoucher`
--

DROP TABLE IF EXISTS `htproject_ordervoucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `htproject_ordervoucher` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` date DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `useDate` date DEFAULT NULL,
  `order_id` bigint NOT NULL,
  `voucher_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `htproject_ordervouch_voucher_id_16099684_fk_htproject` (`voucher_id`),
  KEY `htproject_ordervoucher_order_id_b95f49ed_fk_htproject_order_id` (`order_id`),
  CONSTRAINT `htproject_ordervouch_voucher_id_16099684_fk_htproject` FOREIGN KEY (`voucher_id`) REFERENCES `htproject_voucher` (`id`),
  CONSTRAINT `htproject_ordervoucher_order_id_b95f49ed_fk_htproject_order_id` FOREIGN KEY (`order_id`) REFERENCES `htproject_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htproject_ordervoucher`
--

LOCK TABLES `htproject_ordervoucher` WRITE;
/*!40000 ALTER TABLE `htproject_ordervoucher` DISABLE KEYS */;
/*!40000 ALTER TABLE `htproject_ordervoucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `htproject_rating`
--

DROP TABLE IF EXISTS `htproject_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `htproject_rating` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` date DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `htproject_rating_order_id_23d6d779_fk_htproject_order_id` (`order_id`),
  KEY `htproject_rating_user_id_ccbfb725_fk_htproject_user_id` (`user_id`),
  CONSTRAINT `htproject_rating_order_id_23d6d779_fk_htproject_order_id` FOREIGN KEY (`order_id`) REFERENCES `htproject_order` (`id`),
  CONSTRAINT `htproject_rating_user_id_ccbfb725_fk_htproject_user_id` FOREIGN KEY (`user_id`) REFERENCES `htproject_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htproject_rating`
--

LOCK TABLES `htproject_rating` WRITE;
/*!40000 ALTER TABLE `htproject_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `htproject_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `htproject_user`
--

DROP TABLE IF EXISTS `htproject_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `htproject_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identityCard` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isApproved` tinyint(1) NOT NULL,
  `role` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htproject_user`
--

LOCK TABLES `htproject_user` WRITE;
/*!40000 ALTER TABLE `htproject_user` DISABLE KEYS */;
INSERT INTO `htproject_user` VALUES (1,'pbkdf2_sha256$600000$gh1dW0xqWBWlT9eoCjWRMv$oniyBkr3rQuP+gCH9a/dkJoFQifX/0HIliBavPog3H8=','2023-12-25 16:25:18.843853',1,'admin','','','abc@gmail.com',1,1,'2023-12-17 05:38:49.894544','','',0,'');
/*!40000 ALTER TABLE `htproject_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `htproject_user_groups`
--

DROP TABLE IF EXISTS `htproject_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `htproject_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `htproject_user_groups_user_id_group_id_061e31e6_uniq` (`user_id`,`group_id`),
  KEY `htproject_user_groups_group_id_8833a6f6_fk_auth_group_id` (`group_id`),
  CONSTRAINT `htproject_user_groups_group_id_8833a6f6_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `htproject_user_groups_user_id_8bc439b0_fk_htproject_user_id` FOREIGN KEY (`user_id`) REFERENCES `htproject_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htproject_user_groups`
--

LOCK TABLES `htproject_user_groups` WRITE;
/*!40000 ALTER TABLE `htproject_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `htproject_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `htproject_user_user_permissions`
--

DROP TABLE IF EXISTS `htproject_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `htproject_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `htproject_user_user_perm_user_id_permission_id_c908a7cf_uniq` (`user_id`,`permission_id`),
  KEY `htproject_user_user__permission_id_841b00a4_fk_auth_perm` (`permission_id`),
  CONSTRAINT `htproject_user_user__permission_id_841b00a4_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `htproject_user_user__user_id_2d8ee908_fk_htproject` FOREIGN KEY (`user_id`) REFERENCES `htproject_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htproject_user_user_permissions`
--

LOCK TABLES `htproject_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `htproject_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `htproject_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `htproject_voucher`
--

DROP TABLE IF EXISTS `htproject_voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `htproject_voucher` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` date DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htproject_voucher`
--

LOCK TABLES `htproject_voucher` WRITE;
/*!40000 ALTER TABLE `htproject_voucher` DISABLE KEYS */;
/*!40000 ALTER TABLE `htproject_voucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `htproject_ward`
--

DROP TABLE IF EXISTS `htproject_ward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `htproject_ward` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `htproject_ward_district_id_804199a6_fk_htproject_district_id` (`district_id`),
  CONSTRAINT `htproject_ward_district_id_804199a6_fk_htproject_district_id` FOREIGN KEY (`district_id`) REFERENCES `htproject_district` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=340 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htproject_ward`
--

LOCK TABLES `htproject_ward` WRITE;
/*!40000 ALTER TABLE `htproject_ward` DISABLE KEYS */;
INSERT INTO `htproject_ward` VALUES (1,'Bến Nghé',1),(2,'Bến Thành',1),(3,'Cầu Kho',1),(4,'Cầu Ông Lãnh',1),(5,'Cô Giang',1),(6,'Đa Kao',1),(7,'Nguyễn Cư Trinh',1),(8,'Nguyễn Thái Bình',1),(9,'Phạm Ngũ Lão',1),(10,'Tân Định',1),(11,'An Khánh',2),(12,'An Lợi Đông',2),(13,'An Phú',2),(14,'Bình An',2),(15,'Bình Khánh',2),(16,'Bình Trưng Đông',2),(17,'Bình Trưng Tây',2),(18,'Cát Lái',2),(19,'Thạnh Mỹ Lợi',2),(20,'Thảo Điền',2),(21,'Thủ Thiêm',2),(22,'Phường 01',3),(23,'Phường 02',3),(24,'Phường 03',3),(25,'Phường 04',3),(26,'Phường 05',3),(27,'Phường 06',3),(28,'Phường 07',3),(29,'Phường 08',3),(30,'Phường 09',3),(31,'Phường 10',3),(32,'Phường 11',3),(33,'Phường 12',3),(34,'Phường 13',3),(35,'Phường 14',3),(36,'Võ Thị Sáu',3),(37,'Phường 01',4),(38,'Phường 02',4),(39,'Phường 03',4),(40,'Phường 04',4),(41,'Phường 05',4),(42,'Phường 06',4),(43,'Phường 07',4),(44,'Phường 08',4),(45,'Phường 09',4),(46,'Phường 10',4),(47,'Phường 12',4),(48,'Phường 13',4),(49,'Phường 14',4),(50,'Phường 15',4),(51,'Phường 16',4),(52,'Phường 18',4),(53,'Phường 01',5),(54,'Phường 02',5),(55,'Phường 03',5),(56,'Phường 04',5),(57,'Phường 05',5),(58,'Phường 06',5),(59,'Phường 07',5),(60,'Phường 08',5),(61,'Phường 09',5),(62,'Phường 10',5),(63,'Phường 11',5),(64,'Phường 12',5),(65,'Phường 13',5),(66,'Phường 14',5),(67,'Phường 15',5),(68,'Phường 01',6),(69,'Phường 02',6),(70,'Phường 03',6),(71,'Phường 04',6),(72,'Phường 05',6),(73,'Phường 06',6),(74,'Phường 07',6),(75,'Phường 08',6),(76,'Phường 09',6),(77,'Phường 10',6),(78,'Phường 11',6),(79,'Phường 12',6),(80,'Phường 13',6),(81,'Phường 14',6),(82,'Bình Thuận',7),(83,'Phú Mỹ',7),(84,'Phú Thuận',7),(85,'Tân Hưng',7),(86,'Tân Kiểng',7),(87,'Tân Phong',7),(88,'Tân Phú',7),(89,'Tân Quy',7),(90,'Tân Thuận Đông',7),(91,'Tân Thuận Tây',7),(92,'Phường 01',8),(93,'Phường 02',8),(94,'Phường 03',8),(95,'Phường 04',8),(96,'Phường 05',8),(97,'Phường 06',8),(98,'Phường 07',8),(99,'Phường 08',8),(100,'Phường 09',8),(101,'Phường 10',8),(102,'Phường 11',8),(103,'Phường 12',8),(104,'Phường 13',8),(105,'Phường 14',8),(106,'Phường 15',8),(107,'Phường 16',8),(108,'Hiệp Phú',9),(109,'Long Bình',9),(110,'Long Phước',9),(111,'Long Thạnh Mỹ',9),(112,'Long Trường',9),(113,'Phú Hữu',9),(114,'Phước Bình',9),(115,'Phước Long A',9),(116,'Phước Long B',9),(117,'Tân Phú',9),(118,'Tăng Nhơn Phú A',9),(119,'Tăng Nhơn Phú B',9),(120,'Trường Thạnh',9),(121,'Phường 01',10),(122,'Phường 02',10),(123,'Phường 03',10),(124,'Phường 04',10),(125,'Phường 05',10),(126,'Phường 06',10),(127,'Phường 07',10),(128,'Phường 08',10),(129,'Phường 09',10),(130,'Phường 10',10),(131,'Phường 11',10),(132,'Phường 12',10),(133,'Phường 13',10),(134,'Phường 14',10),(135,'Phường 15',10),(136,'Phường 01',11),(137,'Phường 02',11),(138,'Phường 03',11),(139,'Phường 04',11),(140,'Phường 05',11),(141,'Phường 06',11),(142,'Phường 07',11),(143,'Phường 08',11),(144,'Phường 09',11),(145,'Phường 10',11),(146,'Phường 11',11),(147,'Phường 12',11),(148,'Phường 13',11),(149,'Phường 14',11),(150,'Phường 15',11),(151,'Phường 16',11),(152,'An Phú Đông',12),(153,'Đông Hưng Thuận',12),(154,'Hiệp Thành',12),(155,'Tân Chánh Hiệp',12),(156,'Tân Hưng Thuận',12),(157,'Tân Thới Hiệp',12),(158,'Tân Thới Nhất',12),(159,'Thạnh Lộc',12),(160,'Thạnh Xuân',12),(161,'Thới An',12),(162,'Trung Mỹ Tây',12),(163,'An Phú Tây',13),(164,'Bình Chánh',13),(165,'Bình Hưng',13),(166,'Bình Lợi',13),(167,'Đa Phước',13),(168,'Hưng Long',13),(169,'Lê Minh Xuân',13),(170,'Phạm Văn Hai',13),(171,'Phong Phú',13),(172,'Quy Đức',13),(173,'Tân Kiên',13),(174,'Tân Nhựt',13),(175,'Tân Quý Tây',13),(176,'Tân Túc',13),(177,'Vĩnh Lộc A',13),(178,'Vĩnh Lộc B',13),(179,'An Lạc',14),(180,'An Lạc A',14),(181,'Bình Hưng Hòa',14),(182,'Binh Hưng Hoà A',14),(183,'Binh Hưng Hoà B',14),(184,'Bình Trị Đông',14),(185,'Bình Trị Đông A',14),(186,'Bình Trị Đông B',14),(187,'Tân Tạo',14),(188,'Tân Tạo A',14),(189,'Phường 01',15),(190,'Phường 02',15),(191,'Phường 03',15),(192,'Phường 04',15),(193,'Phường 05',15),(194,'Phường 06',15),(195,'Phường 07',15),(196,'Phường 08',15),(197,'Phường 09',15),(198,'Phường 10',15),(199,'Phường 11',15),(200,'Phường 12',15),(201,'Phường 13',15),(202,'Phường 14',15),(203,'Phường 15',15),(204,'Phường 16',15),(205,'Phường 17',15),(206,'Phường 18',15),(207,'Phường 19',15),(208,'Phường 20',15),(209,'Phường 21',15),(210,'Phường 22',15),(211,'Phường 23',15),(212,'Phường 24',15),(213,'Phường 25',15),(214,'Phường 26',15),(215,'Phường 27',15),(216,'Phường 28',15),(217,'An Thới Đông',16),(218,'Bình Khánh',16),(219,'Cần Thạnh',16),(220,'Long Hòa',16),(221,'Lý Nhơn',16),(222,'Tam Thôn Hiệp',16),(223,'Thạnh An',16),(224,'An Nhơn Tây',17),(225,'An Phú',17),(226,'Bình Mỹ',17),(227,'Củ Chi',17),(228,'Hòa Phú',17),(229,'Nhuận Đức',17),(230,'Phạm Văn Cội',17),(231,'Phú Hòa Đông',17),(232,'Phú Mỹ Hưng',17),(233,'Phước Hiệp',17),(234,'Phước Thạnh',17),(235,'Phước Vĩnh An',17),(236,'Tân An Hội',17),(237,'Tân Phú Trung',17),(238,'Tân Thạnh Đông',17),(239,'Tân Thạnh Tây',17),(240,'Tân Thông Hội',17),(241,'Thái Mỹ',17),(242,'Trung An',17),(243,'Trung Lập Hạ',17),(244,'Trung Lập Thượng',17),(245,'Phường 01',18),(246,'Phường 02',18),(247,'Phường 03',18),(248,'Phường 04',18),(249,'Phường 05',18),(250,'Phường 06',18),(251,'Phường 07',18),(252,'Phường 08',18),(253,'Phường 09',18),(254,'Phường 10',18),(255,'Phường 11',18),(256,'Phường 12',18),(257,'Phường 13',18),(258,'Phường 14',18),(259,'Phường 15',18),(260,'Phường 16',18),(261,'Phường 17',18),(262,'Bà Điểm',19),(263,'Đông Thạnh',19),(264,'Hóc Môn',19),(265,'Nhị Bình',19),(266,'Tân Hiệp',19),(267,'Tân Thới Nhì',19),(268,'Tân Xuân',19),(269,'Thới Tam Thôn',19),(270,'Trung Chánh',19),(271,'Xuân Thới Đông',19),(272,'Xuân Thới Sơn',19),(273,'Xuân Thới Thượng',19),(274,'Hiệp Phước',20),(275,'Long Thới',20),(276,'Nhà Bè',20),(277,'Nhơn Đức',20),(278,'Phú Xuân',20),(279,'Phước Kiển',20),(280,'Phước Lộc',20),(281,'Phường 01',21),(282,'Phường 02',21),(283,'Phường 03',21),(284,'Phường 04',21),(285,'Phường 05',21),(286,'Phường 07',21),(287,'Phường 08',21),(288,'Phường 09',21),(289,'Phường 10',21),(290,'Phường 11',21),(291,'Phường 12',21),(292,'Phường 13',21),(293,'Phường 14',21),(294,'Phường 15',21),(295,'Phường 16',21),(296,'Phường 17',21),(297,'Phường 6',21),(298,'Phường 01',22),(299,'Phường 02',22),(300,'Phường 03',22),(301,'Phường 04',22),(302,'Phường 05',22),(303,'Phường 06',22),(304,'Phường 07',22),(305,'Phường 08',22),(306,'Phường 09',22),(307,'Phường 10',22),(308,'Phường 11',22),(309,'Phường 12',22),(310,'Phường 13',22),(311,'Phường 14',22),(312,'Phường 15',22),(313,'Hiệp Tân',23),(315,'Hoà Thạnh',23),(316,'Phú Thạnh',23),(317,'Phú Thọ Hoà',23),(318,'Phú Trung',23),(319,'Sơn Kỳ',23),(320,'Tân Quý',23),(321,'Tân Sơn Nhì',23),(323,'Tân Thành',23),(325,'Tân Thới Hòa',23),(326,'Tây Thạnh',23),(327,'Bình Chiểu',24),(328,'Bình Thọ',24),(329,'Hiệp Bình Chánh',24),(330,'Hiệp Bình Phước',24),(331,'Linh Chiểu',24),(332,'Linh Đông',24),(333,'Linh Tây',24),(334,'Linh Trung',24),(335,'Linh Xuân',24),(336,'Tam Bình',24),(337,'Tam Phú',24),(338,'Tân Phú',24),(339,'Trường Thọ',24);
/*!40000 ALTER TABLE `htproject_ward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_accesstoken`
--

DROP TABLE IF EXISTS `oauth2_provider_accesstoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_accesstoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `source_refresh_token_id` bigint DEFAULT NULL,
  `id_token_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  UNIQUE KEY `source_refresh_token_id` (`source_refresh_token_id`),
  UNIQUE KEY `id_token_id` (`id_token_id`),
  KEY `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_acce_user_id_6e4c9a65_fk_htproject` (`user_id`),
  CONSTRAINT `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_acce_id_token_id_85db651b_fk_oauth2_pr` FOREIGN KEY (`id_token_id`) REFERENCES `oauth2_provider_idtoken` (`id`),
  CONSTRAINT `oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr` FOREIGN KEY (`source_refresh_token_id`) REFERENCES `oauth2_provider_refreshtoken` (`id`),
  CONSTRAINT `oauth2_provider_acce_user_id_6e4c9a65_fk_htproject` FOREIGN KEY (`user_id`) REFERENCES `htproject_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_accesstoken` VALUES (1,'YVWWjLKp2bLZl1KSGXvLJTShy91IRz','2023-12-17 16:20:27.261556','read write',1,1,'2023-12-17 06:20:27.261556','2023-12-17 06:20:27.261556',NULL,NULL);
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_application`
--

DROP TABLE IF EXISTS `oauth2_provider_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_application` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect_uris` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authorization_grant_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `skip_authorization` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `algorithm` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_logout_redirect_uris` longtext COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (_utf8mb3''),
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`),
  KEY `oauth2_provider_appl_user_id_79829054_fk_htproject` (`user_id`),
  KEY `oauth2_provider_application_client_secret_53133678` (`client_secret`),
  CONSTRAINT `oauth2_provider_appl_user_id_79829054_fk_htproject` FOREIGN KEY (`user_id`) REFERENCES `htproject_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_application`
--

LOCK TABLES `oauth2_provider_application` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_application` DISABLE KEYS */;
INSERT INTO `oauth2_provider_application` VALUES (1,'zs81qvebBWJvDxIckWyPaF3daKW4K1777WrYqjJD','','confidential','password','pbkdf2_sha256$600000$wQY2XNPTZPton7A8uODy25$1nMFS6Y8QCUWQ1weqdIHQAK0SlAjStXcV8ufUYeJyMQ=','HTExpress',1,0,'2023-12-17 06:20:21.274850','2023-12-17 06:20:21.274850','','');
/*!40000 ALTER TABLE `oauth2_provider_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_grant`
--

DROP TABLE IF EXISTS `oauth2_provider_grant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_grant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `redirect_uri` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `scope` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `code_challenge` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_challenge_method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nonce` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `claims` longtext COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (_utf8mb3''),
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_grant_user_id_e8f62af8_fk_htproject_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_grant_user_id_e8f62af8_fk_htproject_user_id` FOREIGN KEY (`user_id`) REFERENCES `htproject_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_grant`
--

LOCK TABLES `oauth2_provider_grant` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_grant` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_grant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_idtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_idtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_idtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `jti` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jti` (`jti`),
  KEY `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_idtoken_user_id_dd512b59_fk_htproject_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_idtoken_user_id_dd512b59_fk_htproject_user_id` FOREIGN KEY (`user_id`) REFERENCES `htproject_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_idtoken`
--

LOCK TABLES `oauth2_provider_idtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_refreshtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_refreshtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_refreshtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` bigint DEFAULT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `revoked` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token_id` (`access_token_id`),
  UNIQUE KEY `oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq` (`token`,`revoked`),
  KEY `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_refr_user_id_da837fce_fk_htproject` (`user_id`),
  CONSTRAINT `oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_provider_accesstoken` (`id`),
  CONSTRAINT `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_refr_user_id_da837fce_fk_htproject` FOREIGN KEY (`user_id`) REFERENCES `htproject_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_refreshtoken` VALUES (1,'wI05tZgdwAKMYRVVhGRkn8PPTqcar3',1,1,1,'2023-12-17 06:20:27.303301','2023-12-17 06:20:27.303301',NULL);
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-25 23:41:32
