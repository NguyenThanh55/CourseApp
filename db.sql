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
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add city',7,'add_city'),(26,'Can change city',7,'change_city'),(27,'Can delete city',7,'delete_city'),(28,'Can view city',7,'view_city'),(29,'Can add district',8,'add_district'),(30,'Can change district',8,'change_district'),(31,'Can delete district',8,'delete_district'),(32,'Can view district',8,'view_district'),(33,'Can add order',9,'add_order'),(34,'Can change order',9,'change_order'),(35,'Can delete order',9,'delete_order'),(36,'Can view order',9,'view_order'),(37,'Can add order voucher',10,'add_ordervoucher'),(38,'Can change order voucher',10,'change_ordervoucher'),(39,'Can delete order voucher',10,'delete_ordervoucher'),(40,'Can view order voucher',10,'view_ordervoucher'),(41,'Can add ward',11,'add_ward'),(42,'Can change ward',11,'change_ward'),(43,'Can delete ward',11,'delete_ward'),(44,'Can view ward',11,'view_ward'),(45,'Can add voucher',12,'add_voucher'),(46,'Can change voucher',12,'change_voucher'),(47,'Can delete voucher',12,'delete_voucher'),(48,'Can view voucher',12,'view_voucher'),(49,'Can add rating',13,'add_rating'),(50,'Can change rating',13,'change_rating'),(51,'Can delete rating',13,'delete_rating'),(52,'Can view rating',13,'view_rating'),(53,'Can add auction',14,'add_auction'),(54,'Can change auction',14,'change_auction'),(55,'Can delete auction',14,'delete_auction'),(56,'Can view auction',14,'view_auction'),(57,'Can add application',15,'add_application'),(58,'Can change application',15,'change_application'),(59,'Can delete application',15,'delete_application'),(60,'Can view application',15,'view_application'),(61,'Can add access token',16,'add_accesstoken'),(62,'Can change access token',16,'change_accesstoken'),(63,'Can delete access token',16,'delete_accesstoken'),(64,'Can view access token',16,'view_accesstoken'),(65,'Can add grant',17,'add_grant'),(66,'Can change grant',17,'change_grant'),(67,'Can delete grant',17,'delete_grant'),(68,'Can view grant',17,'view_grant'),(69,'Can add refresh token',18,'add_refreshtoken'),(70,'Can change refresh token',18,'change_refreshtoken'),(71,'Can delete refresh token',18,'delete_refreshtoken'),(72,'Can view refresh token',18,'view_refreshtoken'),(73,'Can add id token',19,'add_idtoken'),(74,'Can change id token',19,'change_idtoken'),(75,'Can delete id token',19,'delete_idtoken'),(76,'Can view id token',19,'view_idtoken'),(77,'Can add bill',20,'add_bill'),(78,'Can change bill',20,'change_bill'),(79,'Can delete bill',20,'delete_bill'),(80,'Can view bill',20,'view_bill'),(81,'Can add PayPal IPN',21,'add_paypalipn'),(82,'Can change PayPal IPN',21,'change_paypalipn'),(83,'Can delete PayPal IPN',21,'delete_paypalipn'),(84,'Can view PayPal IPN',21,'view_paypalipn');
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
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_htproject_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_htproject_user_id` FOREIGN KEY (`user_id`) REFERENCES `htproject_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(14,'htproject','auction'),(20,'htproject','bill'),(7,'htproject','city'),(8,'htproject','district'),(9,'htproject','order'),(10,'htproject','ordervoucher'),(13,'htproject','rating'),(6,'htproject','user'),(12,'htproject','voucher'),(11,'htproject','ward'),(21,'ipn','paypalipn'),(16,'oauth2_provider','accesstoken'),(15,'oauth2_provider','application'),(17,'oauth2_provider','grant'),(19,'oauth2_provider','idtoken'),(18,'oauth2_provider','refreshtoken'),(5,'sessions','session');
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
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-01-17 15:04:10.000854'),(2,'contenttypes','0002_remove_content_type_name','2024-01-17 15:04:10.095337'),(3,'auth','0001_initial','2024-01-17 15:04:10.530086'),(4,'auth','0002_alter_permission_name_max_length','2024-01-17 15:04:10.654830'),(5,'auth','0003_alter_user_email_max_length','2024-01-17 15:04:10.669796'),(6,'auth','0004_alter_user_username_opts','2024-01-17 15:04:10.683314'),(7,'auth','0005_alter_user_last_login_null','2024-01-17 15:04:10.694210'),(8,'auth','0006_require_contenttypes_0002','2024-01-17 15:04:10.698429'),(9,'auth','0007_alter_validators_add_error_messages','2024-01-17 15:04:10.712939'),(10,'auth','0008_alter_user_username_max_length','2024-01-17 15:04:10.721140'),(11,'auth','0009_alter_user_last_name_max_length','2024-01-17 15:04:10.732251'),(12,'auth','0010_alter_group_name_max_length','2024-01-17 15:04:10.752091'),(13,'auth','0011_update_proxy_permissions','2024-01-17 15:04:10.759910'),(14,'auth','0012_alter_user_first_name_max_length','2024-01-17 15:04:10.768447'),(15,'htproject','0001_initial','2024-01-17 15:04:13.131785'),(16,'admin','0001_initial','2024-01-17 15:04:13.406504'),(17,'admin','0002_logentry_remove_auto_add','2024-01-17 15:04:13.432159'),(18,'admin','0003_logentry_add_action_flag_choices','2024-01-17 15:04:13.461244'),(19,'oauth2_provider','0001_initial','2024-01-17 15:04:15.068807'),(20,'oauth2_provider','0002_auto_20190406_1805','2024-01-17 15:04:15.156954'),(21,'oauth2_provider','0003_auto_20201211_1314','2024-01-17 15:04:15.298711'),(22,'oauth2_provider','0004_auto_20200902_2022','2024-01-17 15:04:16.002767'),(23,'oauth2_provider','0005_auto_20211222_2352','2024-01-17 15:04:16.150041'),(24,'oauth2_provider','0006_alter_application_client_secret','2024-01-17 15:04:16.242209'),(25,'oauth2_provider','0007_application_post_logout_redirect_uris','2024-01-17 15:04:16.386705'),(26,'sessions','0001_initial','2024-01-17 15:04:16.517167'),(27,'htproject','0002_alter_user_phone','2024-01-17 15:13:08.739364'),(28,'htproject','0003_alter_user_phone','2024-01-17 15:21:37.002121'),(29,'htproject','0004_auction_status','2024-01-17 16:35:31.704161'),(30,'htproject','0005_remove_order_total_money_bill','2024-01-18 17:16:39.348280'),(31,'ipn','0001_initial','2024-01-27 11:19:05.532328'),(32,'ipn','0002_paypalipn_mp_id','2024-01-27 11:19:05.728799'),(33,'ipn','0003_auto_20141117_1647','2024-01-27 11:19:06.239079'),(34,'ipn','0004_auto_20150612_1826','2024-01-27 11:19:10.830384'),(35,'ipn','0005_auto_20151217_0948','2024-01-27 11:19:11.017449'),(36,'ipn','0006_auto_20160108_1112','2024-01-27 11:19:11.390131'),(37,'ipn','0007_auto_20160219_1135','2024-01-27 11:19:11.403370'),(38,'ipn','0008_auto_20181128_1032','2024-01-27 11:19:11.416761'),(39,'ipn','0009_alter_paypalipn_id','2024-01-27 11:20:55.545442'),(40,'htproject','0006_alter_user_identitycard','2024-01-31 02:22:46.454576'),(41,'htproject','0007_alter_user_avatar','2024-01-31 02:22:46.465769'),(42,'htproject','0008_alter_user_isapproved','2024-01-31 02:22:46.563018'),(43,'htproject','0009_alter_user_phone','2024-02-02 01:40:53.141108'),(44,'htproject','0010_alter_order_image','2024-02-26 07:05:32.282639'),(45,'htproject','0011_alter_order_shipper','2024-02-26 07:05:32.565471'),(46,'htproject','0012_alter_rating_order_alter_rating_user_and_more','2024-02-26 07:05:32.675638'),(47,'htproject','0013_alter_auction_status_alter_order_fromstreet_and_more','2024-02-26 07:05:32.812579'),(48,'htproject','0014_alter_order_shipper','2024-02-26 07:05:32.944063'),(49,'htproject','0015_alter_order_deliverydate','2024-02-26 07:05:33.053994'),(50,'htproject','0016_alter_auction_money','2024-02-26 07:05:33.108997'),(51,'htproject','0017_alter_ordervoucher_decreased_money','2024-02-26 07:05:33.153525'),(52,'htproject','0018_alter_rating_score','2024-02-26 07:05:33.212560');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `django_session` VALUES ('4th8047f7w2ffh78xbq37anfq92xffly','.eJxVjDsOwyAQBe9CHSHAfFOm9xnQsouDkwgkY1dR7h5bcpG0b2bem0XY1hK3npc4E7syyS6_WwJ85noAekC9N46trsuc-KHwk3Y-Nsqv2-n-HRToZa-dJo9KodN2yANpZ6wPFkUwCQ2hNcIlIoGThwCT37k2yiepncQwCGSfL9EDN1c:1rQWtz:O4rVAkfPR0t2NUzcQRM9oo-ZMVF-UGHmu0zQBnmp9Qs','2024-02-01 18:14:07.429108'),('q1ilr14974dysg89g8lcb56zxszumb65','.eJxVjDsOwyAQBe9CHSHAfFOm9xnQsouDkwgkY1dR7h5bcpG0b2bem0XY1hK3npc4E7syyS6_WwJ85noAekC9N46trsuc-KHwk3Y-Nsqv2-n-HRToZa-dJo9KodN2yANpZ6wPFkUwCQ2hNcIlIoGThwCT37k2yiepncQwCGSfL9EDN1c:1rbsF4:eiBWceHO9qia3xTELIVS7B0IVvS4_V-lCBRldXLzjXk','2024-03-04 01:14:46.730869'),('twxfn75e86160iszkuf2gyaw31j0zxmj','.eJxVjDsOwyAQBe9CHSHAfFOm9xnQsouDkwgkY1dR7h5bcpG0b2bem0XY1hK3npc4E7syyS6_WwJ85noAekC9N46trsuc-KHwk3Y-Nsqv2-n-HRToZa-dJo9KodN2yANpZ6wPFkUwCQ2hNcIlIoGThwCT37k2yiepncQwCGSfL9EDN1c:1rU7WP:BMOqk9-8vGJNGzEuZmoaey_WLVJgkFc4izbjnpMCTg4','2024-02-11 15:56:37.027131');
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
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `money` decimal(12,0) DEFAULT NULL,
  `order_id` bigint NOT NULL,
  `shipper_id` bigint NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `htproject_auction_order_id_8641bae2_fk_htproject_order_id` (`order_id`),
  KEY `htproject_auction_shipper_id_c9c024d8_fk_htproject_user_id` (`shipper_id`),
  CONSTRAINT `htproject_auction_order_id_8641bae2_fk_htproject_order_id` FOREIGN KEY (`order_id`) REFERENCES `htproject_order` (`id`),
  CONSTRAINT `htproject_auction_shipper_id_c9c024d8_fk_htproject_user_id` FOREIGN KEY (`shipper_id`) REFERENCES `htproject_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htproject_auction`
--

LOCK TABLES `htproject_auction` WRITE;
/*!40000 ALTER TABLE `htproject_auction` DISABLE KEYS */;
INSERT INTO `htproject_auction` VALUES (1,NULL,'2024-01-18',1,'Đấu giá của Táo','tôi muốn sip đơn hàng này',100,1,3,1),(2,NULL,NULL,1,'Đấu giá B','Tôi muốn vận chuyển đơn này',110,1,4,1),(3,NULL,NULL,1,'Đấu giá B','Tôi muốn vận chuyển đơn này',90,2,4,1),(4,NULL,NULL,1,'Đấu giá C','tôi muốn sip đơn hàng này',100,2,3,1),(5,NULL,NULL,1,'Đấu giá 123','Tôi muốn vận chuyển đơn này',90,6,4,0),(6,NULL,NULL,1,'Đấu giá 321','tôi muốn sip đơn hàng này',100,6,14,1),(7,'2024-02-19','2024-02-19',1,'Đấu giá của Anh Shipper','Tôi sẽ vận chuyển nhanh nhất',120000,9,14,1),(8,'2024-02-19','2024-02-19',1,'Đấu giá của Anh Shipper','Tôi sẽ vận chuyển cẩn thận',10000,10,14,1),(11,'2024-02-19','2024-02-21',1,'Test update','Test update',12000,11,14,1),(13,'2024-02-20','2024-02-20',1,'Đấu giá của Shipper Hoàng','Tôi sẽ giao cẩn thận',70000,8,14,1),(14,'2024-02-20','2024-02-20',1,'Đấu giá của Shipper Hoàng','Tôi sẽ giao nhanh',15000,5,14,1),(15,'2024-02-20','2024-02-20',1,'Đấu giá của Shipper Hoàng','Tôi sẽ giao an toàn',21000,4,14,1),(16,'2024-02-20','2024-02-20',1,'Đấu giá của Shipper Hoàng','Tôi sẽ giao tươi ngon',25000,3,14,1),(17,'2024-02-20','2024-02-20',1,'Đấu giá của Shipper Hoàng','Tôi sẽ giao nhanh',22000,2,14,1),(18,'2024-02-26','2024-02-26',1,'Đấu giá của Shipper Hoàng','Tôi muốn giao đơn hàng này',25000,12,14,0);
/*!40000 ALTER TABLE `htproject_auction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `htproject_bill`
--

DROP TABLE IF EXISTS `htproject_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `htproject_bill` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` date DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `total_money` decimal(10,3) NOT NULL,
  `order_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `htproject_bill_order_id_a17a2717_fk_htproject_order_id` (`order_id`),
  CONSTRAINT `htproject_bill_order_id_a17a2717_fk_htproject_order_id` FOREIGN KEY (`order_id`) REFERENCES `htproject_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htproject_bill`
--

LOCK TABLES `htproject_bill` WRITE;
/*!40000 ALTER TABLE `htproject_bill` DISABLE KEYS */;
INSERT INTO `htproject_bill` VALUES (1,NULL,NULL,1,123000.000,1),(2,NULL,NULL,1,125000.000,2),(3,'2024-01-27','2024-01-27',1,100000.000,2),(4,'2024-01-27','2024-01-27',1,100000.000,2),(5,'2024-01-27','2024-01-27',1,100000.000,2),(6,'2024-01-27','2024-01-27',1,100000.000,2),(7,'2024-01-27','2024-01-27',1,100000.000,2),(8,'2024-01-27','2024-01-27',1,100000.000,2);
/*!40000 ALTER TABLE `htproject_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `htproject_city`
--

DROP TABLE IF EXISTS `htproject_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `htproject_city` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htproject_city`
--

LOCK TABLES `htproject_city` WRITE;
/*!40000 ALTER TABLE `htproject_city` DISABLE KEYS */;
INSERT INTO `htproject_city` VALUES (1,'Hồ Chí Minh');
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deliveryDate` date NOT NULL,
  `fromStreet` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `toStreet` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htproject_order`
--

LOCK TABLES `htproject_order` WRITE;
/*!40000 ALTER TABLE `htproject_order` DISABLE KEYS */;
INSERT INTO `htproject_order` VALUES (1,NULL,'2024-01-18',1,'Hàng hóa','Thùng linh kiện điện tử','image/upload/v1706856103/mach-ban-dia-chi-ban-le-thung-carton-dong-goi-hang-hoa-tai-tphcm-1-removebg-preview_ku8bkm.png','2024-01-18','Nguyễn Kiệm A','Hai Bà Trưng','Completed',2,1,3,2),(2,NULL,'2024-01-18',1,'Hàng hóa','Giày bóng đá','image/upload/v1706856735/ng-nike-zoom-mercurial-superfly-9-km-academy-tf-do9347-400-xanh-vang-1_d634b24dead54f2dbbcf5f6e728c3f73_master-removebg-preview_tiqaes.png','2024-01-01','Nguyễn Văn Linh ','Nguyễn Đình Chiểu','Completed',2,1,14,2),(3,NULL,'2024-01-18',1,'Đồ ăn','Thức ăn, thức uống','image/upload/v1706856842/75182757038aa605c888d63487b5ef92-removebg-preview_cejnht.png','2024-01-18','Nguyễn Kiệm A','Hai Bà Trưng','Completed',10,1,14,2),(4,NULL,'2024-01-18',1,'Hàng hóa','Trái bóng','image/upload/v1706856941/8156ebdf0b30503cd8337989f83b5d80-removebg-preview_x8hal5.png','2024-01-01','Nguyễn Văn Linh ','Nguyễn Đình Chiểu','Completed',10,1,14,2),(5,NULL,'2024-01-18',1,'Đồ ăn','Thức ăn, thức uống','image/upload/v1706857045/436e29b6115798c439fdb9bd320fbbeb-removebg-preview_xpxrvs.png','2024-01-18','Nguyễn Kiệm A','Hai Bà Trưng','Completed',10,1,14,2),(6,NULL,'2024-01-18',1,'Cồng kềnh','Máy giặt','image/upload/v1706857161/washing-machine_kfj7yh.png','2024-01-01','Nguyễn Văn Linh ','Nguyễn Đình Chiểu','Completed',10,1,14,2),(7,NULL,'2024-01-18',1,'Đồ ăn','Thức ăn, thức uống','image/upload/v1706857116/bb9febb404708370c7f1e18183fa7ded-removebg-preview_vytpd3.png','2024-01-18','Nguyễn Kiệm A','Hai Bà Trưng','Completed',10,1,14,2),(8,NULL,'2024-01-18',1,'Hàng hóa','Laptop','image/upload/v1706857437/57b3121f215b9744985eddfd59241c45-removebg-preview_o1jfgq.png','2024-01-01','Nguyễn Văn Linh ','Nguyễn Đình Chiểu','Completed',10,1,14,2),(9,'2024-02-17','2024-02-21',1,'Đồ ăn','Bánh bao','image/upload/v1708134032/o3w9nh1smvfxi2v8hxcj.png','2024-02-17','Bạch Đằng B','Âu Dương Lân','Completed',10,299,14,94),(10,'2024-02-17','2024-02-21',1,'Đồ ăn','Bánh bon','image/upload/v1708135393/pp4j6kwu9cx9vjycwhle.jpg','2024-02-17','12 Lê Trùng Dương','32 Mai Dương','Completed',10,22,14,1),(11,'2024-02-17','2024-02-26',1,'Đồ ăn','Bánh bon 2','image/upload/v1708135660/hskklzmvfdksopmj1e7x.jpg','2024-02-17','12 Lê Trùng Dương','32 Mai Dương','Completed',10,22,14,1),(12,'2024-02-17','2024-02-17',1,'Đồ ăn','Bánh bon 3','image/upload/v1708135779/e0byotmvseya4fczx7zw.jpg','2024-02-17','12 Lê Trùng Dương','32 Mai Dương','New',10,22,NULL,1),(13,'2024-02-19','2024-02-19',1,'Đồ ăn','Lon pepsi','image/upload/v1708336326/ec3ne14orkcx8lxd4ist.jpg','2024-02-19','123 ALD','321 Lê Lợi','New',10,11,NULL,1);
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
  `decreased_money` decimal(12,0) DEFAULT NULL,
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
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` int NOT NULL,
  `order_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `htproject_rating_order_id_23d6d779_fk_htproject_order_id` (`order_id`),
  KEY `htproject_rating_user_id_ccbfb725_fk_htproject_user_id` (`user_id`),
  CONSTRAINT `htproject_rating_order_id_23d6d779_fk_htproject_order_id` FOREIGN KEY (`order_id`) REFERENCES `htproject_order` (`id`),
  CONSTRAINT `htproject_rating_user_id_ccbfb725_fk_htproject_user_id` FOREIGN KEY (`user_id`) REFERENCES `htproject_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htproject_rating`
--

LOCK TABLES `htproject_rating` WRITE;
/*!40000 ALTER TABLE `htproject_rating` DISABLE KEYS */;
INSERT INTO `htproject_rating` VALUES (1,NULL,'2024-01-18',1,'Vận chuyển rất nhanh',5,1,2),(2,NULL,NULL,1,'Vận chuyển hơi chậm so với dự kiến',4,2,5);
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
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identityCard` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isApproved` tinyint(1) DEFAULT NULL,
  `role` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htproject_user`
--

LOCK TABLES `htproject_user` WRITE;
/*!40000 ALTER TABLE `htproject_user` DISABLE KEYS */;
INSERT INTO `htproject_user` VALUES (1,'pbkdf2_sha256$600000$ytZXXSQOkPvzwAqI57Ia0g$+x3TYG17ChJFSupgwkZN+Cq3to5gt9wsKDWrgtYEWBs=','2024-02-19 01:14:46.725693',1,'Admin','','','admin@gmail.com',1,1,'2024-01-17 15:17:48.711695','image/upload/v1705226973/ryan9dyovzg88xhoz3ik.png','',1,'','0'),(2,'pbkdf2_sha256$600000$ytZXXSQOkPvzwAqI57Ia0g$+x3TYG17ChJFSupgwkZN+Cq3to5gt9wsKDWrgtYEWBs=','2024-01-30 08:47:17.666344',0,'Thanh','Thanh','Nguyen','2051052120thanh@ou.edu.vn',1,1,'2024-01-17 15:17:48.711695','image/upload/v1705226973/ryan9dyovzg88xhoz3ik.png','0987654321',1,'CUSTOMER','0988765421'),(3,'pbkdf2_sha256$600000$ytZXXSQOkPvzwAqI57Ia0g$+x3TYG17ChJFSupgwkZN+Cq3to5gt9wsKDWrgtYEWBs=',NULL,0,'Tao Nguyen','Tao','Nguyen','2051052120thanh@ou.edu.vn',1,1,'2024-01-17 15:17:48.711695','image/upload/v1705226973/ryan9dyovzg88xhoz3ik.png','0987654321',1,'SHIPPER','0988765321'),(4,'pbkdf2_sha256$600000$ytZXXSQOkPvzwAqI57Ia0g$+x3TYG17ChJFSupgwkZN+Cq3to5gt9wsKDWrgtYEWBs=',NULL,0,'Thanh Tran','Thanh','Tran','ntthanh505@gmail.com',1,1,'2024-01-17 15:17:48.711695','image/upload/v1705226973/ryan9dyovzg88xhoz3ik.png','0987654321',1,'SHIPPER','0934235321'),(5,'pbkdf2_sha256$600000$ytZXXSQOkPvzwAqI57Ia0g$+x3TYG17ChJFSupgwkZN+Cq3to5gt9wsKDWrgtYEWBs=',NULL,0,'Ngoc Anh','Ngoc Anh','Nguyen','2051052120thanh@ou.edu.vn',1,1,'2024-01-17 15:17:48.711695','image/upload/v1705226973/ryan9dyovzg88xhoz3ik.png','0987654321',1,'CUSTOMER','0988765421'),(6,'pbkdf2_sha256$600000$g7qTFCtwAbhF9BSm9yRNap$kBto6NHpZUBSR6kguKv2K63qwiQ5skE9V3U5tMmaoxI=',NULL,0,'minhhoang','Minh','Hoàng','vbmhoang.2808@gmail.com',0,1,'2024-01-30 09:48:52.910251','image/upload/v1706608137/p4hk0ggvpmxstxvytpov.jpg','056202010094',0,'CUSTOMER','0399987202'),(7,'pbkdf2_sha256$600000$tytaEOGPnDbEnM2uRSxxlF$GN0/KPgIxUF87DIo2v5G2VUwR6uyTsZrRpONktAuvuk=',NULL,0,'khachhang','Khách','Hàng','vbmhoang.2808@gmail.com',0,1,'2024-01-31 02:34:48.961284','image/upload/v1706668492/nzczlh4dytiv0lvwress.png',NULL,0,'CUSTOMER','0399987202'),(8,'pbkdf2_sha256$600000$g4MQlXDgDEEFyhwXOlMKvv$BaY3lljIP+54Zw+bWaGCfcS0JuHh3zPW6rVNCy+y3w4=',NULL,0,'shipper','Anh Ship','Bơ','vbmhoang.2808@gmail.com',0,1,'2024-01-31 02:35:46.846179','image/upload/v1706668549/ojrjtg7ovtpzp5ykm5o6.png','056202010094',0,'CUSTOMER','0399987202'),(9,'pbkdf2_sha256$600000$owkT4XGdu0FzzdsEeKlNYk$cC3A7G4U4PBkj1Bwv14Ywr5NnxhE6J4o932ctKMH0yk=',NULL,0,'shipper2','Anh Ship','Bơ','vbmhoang.2808@gmail.com',0,1,'2024-01-31 09:12:49.188604','image/upload/v1706692372/eq4jmvfa746adyyvya3g.png','056202010094',0,'CUSTOMER','0399987202'),(10,'pbkdf2_sha256$600000$QxqfSoUdHsExtvWjvGQYg6$gpl9VbVonXVPafVFGNtx6+6tD7mRUeyLM7+lSJ7estA=',NULL,0,'MinhHoang288','Võ','Hoàng','vbmhoang.2808@gmail.com',0,1,'2024-01-31 09:15:47.921283','image/upload/v1706692548/dv0rj5cjpwttra4ozis7.jpg','null',0,'CUSTOMER','0399987202'),(11,'pbkdf2_sha256$600000$gQZlqrRQXhkUaJOAOEMKCG$WhtEC1H6xeSCiJYD22DoMhM52MRBIEHcf3FgDt0wAAo=',NULL,0,'MinhHoang28','Võ','Hoàng','vbmhoang.2808@gmail.com',0,1,'2024-01-31 09:22:03.827219','image/upload/v1706692924/bl5vpjyhzvxaci8k6pwb.jpg','null',0,'CUSTOMER','0399987202'),(12,'pbkdf2_sha256$600000$CjPmjYfe8QopOJ8BDejLVn$RRE6jqzrZtBwqAjF73rdyslkzQq4BURPEwhuNSJIYyE=',NULL,0,'MinhHoang2','Võ','Hoàng','vbmhoang.2808@gmail.com',0,1,'2024-01-31 09:24:12.825853','image/upload/v1706693053/htvxaskz2itzsvlzaqie.jpg','null',0,'CUSTOMER','0399987202'),(13,'pbkdf2_sha256$600000$GNl90Z80stvpD05FRDCUxW$VuAwuRt+TMidUIo5LRHERhgu4v1AJ+1ZHs2TFPdFjO8=',NULL,0,'MinhHoang121','Võ','Hoàng','vbmhoang.2808@gmail.com',0,1,'2024-01-31 09:26:23.149123','image/upload/v1706693184/wjo113xkgrhlmiphvqcd.jpg','null',0,'CUSTOMER','0399987202'),(14,'pbkdf2_sha256$600000$EauGO89lKG6sDyjir7NAm5$fnDFjVrxIDpspiE0a6h4YBXyMEcpF7R7CSm6/cEreKo=',NULL,0,'AnhShipper','Shipper','Hoàng','vb@gmail.com',0,1,'2024-01-31 09:27:54.589559','image/upload/v1706693184/wjo113xkgrhlmiphvqcd.jpg','22255588800',1,'SHIPPER','0399987202');
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
  `title` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` decimal(10,2) NOT NULL,
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `htproject_ward` VALUES (1,'Bến Nghé',1),(2,'Bến Thành',1),(3,'Cầu Kho',1),(4,'Cầu Ông Lãnh',1),(5,'Cô Giang',1),(6,'Đa Kao',1),(7,'Nguyễn Cư Trinh',1),(8,'Nguyễn Thái Bình',1),(9,'Phạm Ngũ Lão',1),(10,'Tân Định',1),(11,'An Khánh',2),(12,'An Lợi Đông',2),(13,'An Phú',2),(14,'Bình An',2),(15,'Bình Khánh',2),(16,'Bình Trưng Đông',2),(17,'Bình Trưng Tây',2),(18,'Cát Lái',2),(19,'Thạnh Mỹ Lợi',2),(20,'Thảo Điền',2),(21,'Thủ Thiêm',2),(22,'Phường 01',3),(23,'Phường 02',3),(24,'Phường 03',3),(25,'Phường 04',3),(26,'Phường 05',3),(27,'Phường 06',3),(28,'Phường 07',3),(29,'Phường 08',3),(30,'Phường 09',3),(31,'Phường 10',3),(32,'Phường 11',3),(33,'Phường 12',3),(34,'Phường 13',3),(35,'Phường 14',3),(36,'Võ Thị Sáu',3),(37,'Phường 01',4),(38,'Phường 02',4),(39,'Phường 03',4),(40,'Phường 04',4),(41,'Phường 05',4),(42,'Phường 06',4),(43,'Phường 07',4),(44,'Phường 08',4),(45,'Phường 09',4),(46,'Phường 10',4),(47,'Phường 12',4),(48,'Phường 13',4),(49,'Phường 14',4),(50,'Phường 15',4),(51,'Phường 16',4),(52,'Phường 18',4),(53,'Phường 01',5),(54,'Phường 02',5),(55,'Phường 03',5),(56,'Phường 04',5),(57,'Phường 05',5),(58,'Phường 06',5),(59,'Phường 07',5),(60,'Phường 08',5),(61,'Phường 09',5),(62,'Phường 10',5),(63,'Phường 11',5),(64,'Phường 12',5),(65,'Phường 13',5),(66,'Phường 14',5),(67,'Phường 15',5),(68,'Phường 01',6),(69,'Phường 02',6),(70,'Phường 03',6),(71,'Phường 04',6),(72,'Phường 05',6),(73,'Phường 06',6),(74,'Phường 07',6),(75,'Phường 08',6),(76,'Phường 09',6),(77,'Phường 10',6),(78,'Phường 11',6),(79,'Phường 12',6),(80,'Phường 13',6),(81,'Phường 14',6),(82,'Bình Thuận',7),(83,'Phú Mỹ',7),(84,'Phú Thuận',7),(85,'Tân Hưng',7),(86,'Tân Kiểng',7),(87,'Tân Phong',7),(88,'Tân Phú',7),(89,'Tân Quy',7),(90,'Tân Thuận Đông',7),(91,'Tân Thuận Tây',7),(92,'Phường 01',8),(93,'Phường 02',8),(94,'Phường 03',8),(95,'Phường 04',8),(96,'Phường 05',8),(97,'Phường 06',8),(98,'Phường 07',8),(99,'Phường 08',8),(100,'Phường 09',8),(101,'Phường 10',8),(102,'Phường 11',8),(103,'Phường 12',8),(104,'Phường 13',8),(105,'Phường 14',8),(106,'Phường 15',8),(107,'Phường 16',8),(108,'Hiệp Phú',9),(109,'Long Bình',9),(110,'Long Phước',9),(111,'Long Thạnh Mỹ',9),(112,'Long Trường',9),(113,'Phú Hữu',9),(114,'Phước Bình',9),(115,'Phước Long A',9),(116,'Phước Long B',9),(117,'Tân Phú',9),(118,'Tăng Nhơn Phú A',9),(119,'Tăng Nhơn Phú B',9),(120,'Trường Thạnh',9),(121,'Phường 01',10),(122,'Phường 02',10),(123,'Phường 03',10),(124,'Phường 04',10),(125,'Phường 05',10),(126,'Phường 06',10),(127,'Phường 07',10),(128,'Phường 08',10),(129,'Phường 09',10),(130,'Phường 10',10),(131,'Phường 11',10),(132,'Phường 12',10),(133,'Phường 13',10),(134,'Phường 14',10),(135,'Phường 15',10),(136,'Phường 01',11),(137,'Phường 02',11),(138,'Phường 03',11),(139,'Phường 04',11),(140,'Phường 05',11),(141,'Phường 06',11),(142,'Phường 07',11),(143,'Phường 08',11),(144,'Phường 09',11),(145,'Phường 10',11),(146,'Phường 11',11),(147,'Phường 12',11),(148,'Phường 13',11),(149,'Phường 14',11),(150,'Phường 15',11),(151,'Phường 16',11),(152,'An Phú Đông',12),(153,'Đông Hưng Thuận',12),(154,'Hiệp Thành',12),(155,'Tân Chánh Hiệp',12),(156,'Tân Hưng Thuận',12),(157,'Tân Thới Hiệp',12),(158,'Tân Thới Nhất',12),(159,'Thạnh Lộc',12),(160,'Thạnh Xuân',12),(161,'Thới An',12),(162,'Trung Mỹ Tây',12),(163,'An Phú Tây',13),(164,'Bình Chánh',13),(165,'Bình Hưng',13),(166,'Bình Lợi',13),(167,'Đa Phước',13),(168,'Hưng Long',13),(169,'Lê Minh Xuân',13),(170,'Phạm Văn Hai',13),(171,'Phong Phú',13),(172,'Quy Đức',13),(173,'Tân Kiên',13),(174,'Tân Nhựt',13),(175,'Tân Quý Tây',13),(176,'Tân Túc',13),(177,'Vĩnh Lộc A',13),(178,'Vĩnh Lộc B',13),(179,'An Lạc',14),(180,'An Lạc A',14),(181,'Bình Hưng Hòa',14),(182,'Binh Hưng Hoà A',14),(183,'Binh Hưng Hoà B',14),(184,'Bình Trị Đông',14),(185,'Bình Trị Đông A',14),(186,'Bình Trị Đông B',14),(187,'Tân Tạo',14),(188,'Tân Tạo A',14),(189,'Phường 01',15),(190,'Phường 02',15),(191,'Phường 03',15),(192,'Phường 04',15),(193,'Phường 05',15),(194,'Phường 06',15),(195,'Phường 07',15),(196,'Phường 08',15),(197,'Phường 09',15),(198,'Phường 10',15),(199,'Phường 11',15),(200,'Phường 12',15),(201,'Phường 13',15),(202,'Phường 14',15),(203,'Phường 15',15),(204,'Phường 16',15),(205,'Phường 17',15),(206,'Phường 18',15),(207,'Phường 19',15),(208,'Phường 20',15),(209,'Phường 21',15),(210,'Phường 22',15),(211,'Phường 23',15),(212,'Phường 24',15),(213,'Phường 25',15),(214,'Phường 26',15),(215,'Phường 27',15),(216,'Phường 28',15),(217,'An Thới Đông',16),(218,'Bình Khánh',16),(219,'Cần Thạnh',16),(220,'Long Hòa',16),(221,'Lý Nhơn',16),(222,'Tam Thôn Hiệp',16),(223,'Thạnh An',16),(224,'An Nhơn Tây',17),(225,'An Phú',17),(226,'Bình Mỹ',17),(227,'Củ Chi',17),(228,'Hòa Phú',17),(229,'Nhuận Đức',17),(230,'Phạm Văn Cội',17),(231,'Phú Hòa Đông',17),(232,'Phú Mỹ Hưng',17),(233,'Phước Hiệp',17),(234,'Phước Thạnh',17),(235,'Phước Vĩnh An',17),(236,'Tân An Hội',17),(237,'Tân Phú Trung',17),(238,'Tân Thạnh Đông',17),(239,'Tân Thạnh Tây',17),(240,'Tân Thông Hội',17),(241,'Thái Mỹ',17),(242,'Trung An',17),(243,'Trung Lập Hạ',17),(244,'Trung Lập Thượng',17),(245,'Phường 01',18),(246,'Phường 02',18),(247,'Phường 03',18),(248,'Phường 04',18),(249,'Phường 05',18),(250,'Phường 06',18),(251,'Phường 07',18),(252,'Phường 08',18),(253,'Phường 09',18),(254,'Phường 10',18),(255,'Phường 11',18),(256,'Phường 12',18),(257,'Phường 13',18),(258,'Phường 14',18),(259,'Phường 15',18),(260,'Phường 16',18),(261,'Phường 17',18),(262,'Bà Điểm',19),(263,'Đông Thạnh',19),(264,'Hóc Môn',19),(265,'Nhị Bình',19),(266,'Tân Hiệp',19),(267,'Tân Thới Nhì',19),(268,'Tân Xuân',19),(269,'Thới Tam Thôn',19),(270,'Trung Chánh',19),(271,'Xuân Thới Đông',19),(272,'Xuân Thới Sơn',19),(273,'Xuân Thới Thượng',19),(274,'Hiệp Phước',20),(275,'Long Thới',20),(276,'Nhà Bè',20),(277,'Nhơn Đức',20),(278,'Phú Xuân',20),(279,'Phước Kiển',20),(280,'Phước Lộc',20),(281,'Phường 01',21),(282,'Phường 02',21),(283,'Phường 03',21),(284,'Phường 04',21),(285,'Phường 05',21),(286,'Phường 07',21),(287,'Phường 08',21),(288,'Phường 09',21),(289,'Phường 10',21),(290,'Phường 11',21),(291,'Phường 12',21),(292,'Phường 13',21),(293,'Phường 14',21),(294,'Phường 15',21),(295,'Phường 16',21),(296,'Phường 17',21),(297,'Phường 6',21),(298,'Phường 01',22),(299,'Phường 02',22),(300,'Phường 03',22),(301,'Phường 04',22),(302,'Phường 05',22),(303,'Phường 06',22),(304,'Phường 07',22),(305,'Phường 08',22),(306,'Phường 09',22),(307,'Phường 10',22),(308,'Phường 11',22),(309,'Phường 12',22),(310,'Phường 13',22),(311,'Phường 14',22),(312,'Phường 15',22),(313,'Hiệp Tân',23),(314,'HIEPTAN',23),(315,'Hoà Thạnh',23),(316,'Phú Thạnh',23),(317,'Phú Thọ Hoà',23),(318,'Phú Trung',23),(319,'Sơn Kỳ',23),(320,'Tân Quý',23),(321,'Tân Sơn Nhì',23),(322,'Tân Thành',23),(323,'TANTHANH',23),(324,'Tân Thới Hoà',23),(325,'TANTHOIHOA',23),(326,'Tây Thạnh',23),(327,'Bình Chiểu',24),(328,'Bình Thọ',24),(329,'Hiệp Bình Chánh',24),(330,'Hiệp Bình Phước',24),(331,'Linh Chiểu',24),(332,'Linh Đông',24),(333,'Linh Tây',24),(334,'Linh Trung',24),(335,'Linh Xuân',24),(336,'Tam Bình',24),(337,'Tam Phú',24),(338,'Tân Phú',24),(339,'Trường Thọ',24);
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
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_accesstoken` VALUES (1,'epdO6uUM4OhITBgHKazjUsV6wa7mZW','2024-01-18 04:17:48.071968','read write',1,1,'2024-01-17 18:17:48.074000','2024-01-17 18:17:48.074000',NULL,NULL),(2,'5LGyyw995zao60Hkvyw9OcqN9z18qC','2024-01-18 04:38:15.925475','read write',1,3,'2024-01-17 18:38:15.934955','2024-01-17 18:38:15.934955',NULL,NULL),(3,'qFeuVr5cpsUmEgEldeJSIgxGtKXiwy','2024-01-18 04:46:03.141188','read write',1,2,'2024-01-17 18:46:03.142220','2024-01-17 18:46:03.142220',NULL,NULL),(4,'2liOeWyvPDQxtqk6CJ0WLM7vSEqf1Z','2024-01-18 04:48:35.497824','read write',1,3,'2024-01-17 18:48:35.499190','2024-01-17 18:48:35.499190',NULL,NULL),(5,'oJrSzuvZZT5vIW49fub0krOwquCoNy','2024-01-18 04:51:13.347150','read write',1,3,'2024-01-17 18:51:13.348148','2024-01-17 18:51:13.348148',NULL,NULL),(6,'uvNjLijIdSg0vi2fgf6yNs1SoJAMeV','2024-01-18 04:51:28.570721','read write',1,3,'2024-01-17 18:51:28.570721','2024-01-17 18:51:28.570721',NULL,NULL),(7,'B5PZwFMKuM9E2EuDKQXZxaZ5YnEr8D','2024-01-18 05:14:38.107942','read write',1,2,'2024-01-17 19:14:38.107942','2024-01-17 19:14:38.107942',NULL,NULL),(8,'cWr5a4sKR72WF3DvUDr18QZzZRtqdT','2024-01-18 16:25:41.957026','read write',1,2,'2024-01-18 06:25:41.959989','2024-01-18 06:25:41.959989',NULL,NULL),(9,'au1prb98bdIEp1BLzEZJZvFcO148tY','2024-01-30 11:57:10.041501','read write',1,2,'2024-01-30 01:57:10.042504','2024-01-30 01:57:10.042504',NULL,NULL),(10,'SIoXOBTPY0Ub9ycVXhwRgvL75khWZD','2024-01-30 18:17:14.323521','read write',1,2,'2024-01-30 08:17:14.323521','2024-01-30 08:17:14.323521',NULL,NULL),(11,'VwP8jRGiWhrp2EdgmWxL8USP8nzSAE','2024-01-30 18:22:11.989641','read write',1,2,'2024-01-30 08:22:11.990596','2024-01-30 08:22:11.990596',NULL,NULL),(12,'Qu2Tdn12EACJROKVac87Lfay4bVsWy','2024-01-30 18:30:22.677706','read write',1,2,'2024-01-30 08:30:22.677706','2024-01-30 08:30:22.677706',NULL,NULL),(13,'2n3tnNQCVkc8HxX0UrGJOvMEkKmYcp','2024-01-30 18:36:32.708002','read write',1,2,'2024-01-30 08:36:32.708002','2024-01-30 08:36:32.708002',NULL,NULL),(14,'MGRgjkUAQlk3GfCRmcwYE7Hs6AvfyP','2024-01-30 18:44:24.420114','read write',1,2,'2024-01-30 08:44:24.421117','2024-01-30 08:44:24.421117',NULL,NULL),(15,'Rc1pPVxBsZ3mSiayNR9vTFhctRWvyO','2024-01-30 18:47:40.001519','read write',1,2,'2024-01-30 08:47:40.002522','2024-01-30 08:47:40.002522',NULL,NULL),(16,'qZNqZH2svmpYhbhnEGBarRtJnH6bXX','2024-01-30 19:08:03.933437','read write',1,2,'2024-01-30 09:08:03.933437','2024-01-30 09:08:03.933437',NULL,NULL),(17,'22siuppmwdauPLC9qVELqR7EIrOOLY','2024-01-30 19:17:14.814657','read write',1,2,'2024-01-30 09:17:14.814657','2024-01-30 09:17:14.814657',NULL,NULL),(18,'iSP1ffJaAJCgSwjAJMb0DlabDJvAsl','2024-01-30 19:23:50.424075','read write',1,2,'2024-01-30 09:23:50.424075','2024-01-30 09:23:50.424075',NULL,NULL),(19,'bJneeuOt0VgWlMAjvg2llYcczBslJt','2024-01-30 19:30:53.443361','read write',1,2,'2024-01-30 09:30:53.444400','2024-01-30 09:30:53.444400',NULL,NULL),(20,'AEyIG9JGa4DfXIfueZYebSQ3BjCTLP','2024-01-31 11:43:13.892736','read write',1,2,'2024-01-31 01:43:13.893738','2024-01-31 01:43:13.893738',NULL,NULL),(21,'bLcKoRtyXvELyooaua8Dp20CYbO1wp','2024-01-31 11:44:23.106309','read write',1,2,'2024-01-31 01:44:23.106309','2024-01-31 01:44:23.106309',NULL,NULL),(22,'HywV2BeFjpfkLAU3v9xi1Q6jRUBqeg','2024-01-31 11:44:52.327965','read write',1,2,'2024-01-31 01:44:52.327965','2024-01-31 01:44:52.327965',NULL,NULL),(23,'kzsNlzRzqBvKbCvzVnA5MRG6WhSNDy','2024-01-31 11:45:20.597221','read write',1,2,'2024-01-31 01:45:20.597221','2024-01-31 01:45:20.597221',NULL,NULL),(24,'NHAdgMs6SOEcAP63clK1gglB5SMFv5','2024-01-31 11:45:58.324487','read write',1,2,'2024-01-31 01:45:58.324487','2024-01-31 01:45:58.324487',NULL,NULL),(25,'g3rydhBisPXKonxHeq2FKgEKDWEhza','2024-01-31 11:46:15.950307','read write',1,2,'2024-01-31 01:46:15.950307','2024-01-31 01:46:15.950307',NULL,NULL),(26,'bQGPrgeQW1ii7njTXFDMGtdlw4r5IT','2024-01-31 11:48:08.299848','read write',1,2,'2024-01-31 01:48:08.300847','2024-01-31 01:48:08.300847',NULL,NULL),(27,'aaTZ5NwlkttUINvCJHzDNkqH9azkaE','2024-01-31 11:49:09.917509','read write',1,2,'2024-01-31 01:49:09.917509','2024-01-31 01:49:09.917509',NULL,NULL),(28,'jsDpEG0qOMXWPJHEKrziymHRyRAwTT','2024-01-31 11:50:02.426997','read write',1,2,'2024-01-31 01:50:02.426997','2024-01-31 01:50:02.426997',NULL,NULL),(29,'3g6VutnsnTMDwBm2hoc8UoGCB1AiiL','2024-01-31 11:52:47.201028','read write',1,2,'2024-01-31 01:52:47.201028','2024-01-31 01:52:47.201028',NULL,NULL),(30,'DSS5WxRdY6VjruxXkqZYzdV6nH6KnE','2024-01-31 11:53:43.035555','read write',1,2,'2024-01-31 01:53:43.035555','2024-01-31 01:53:43.035555',NULL,NULL),(31,'6S4eJKejLdxlVrSld6obbgVyie7gFU','2024-01-31 11:54:56.530718','read write',1,2,'2024-01-31 01:54:56.530718','2024-01-31 01:54:56.530718',NULL,NULL),(32,'9cXtoNBB1W9kSIIGfW2vHIc37oorA3','2024-01-31 11:55:25.842174','read write',1,2,'2024-01-31 01:55:25.843087','2024-01-31 01:55:25.843087',NULL,NULL),(33,'hnMD26kgGfUDNbTgMEjIk5NvidsXyD','2024-01-31 11:55:41.027026','read write',1,2,'2024-01-31 01:55:41.027026','2024-01-31 01:55:41.027026',NULL,NULL),(34,'ezyuqjGkursuWk305gV4esHhJ7DadW','2024-01-31 11:59:36.291344','read write',1,2,'2024-01-31 01:59:36.292357','2024-01-31 01:59:36.292357',NULL,NULL),(35,'TmQRHUL1Qw1E4EEirtuYZgHDou2xFl','2024-01-31 12:00:06.227870','read write',1,2,'2024-01-31 02:00:06.228870','2024-01-31 02:00:06.228870',NULL,NULL),(36,'lGBlDCtuOFKzFgZwRcnAv3lG6lT8bu','2024-01-31 12:05:13.373850','read write',1,2,'2024-01-31 02:05:13.374768','2024-01-31 02:05:13.374768',NULL,NULL),(37,'XCqfrXyxRTZTekUSOyFnfBEQPHs9m3','2024-01-31 12:08:48.601599','read write',1,2,'2024-01-31 02:08:48.601599','2024-01-31 02:08:48.602571',NULL,NULL),(38,'7oh9vbpC9Zucf5MPQfjYueeKw5gpBB','2024-01-31 12:09:04.243297','read write',1,2,'2024-01-31 02:09:04.244293','2024-01-31 02:09:04.244293',NULL,NULL),(39,'kgJ6ELdyhlis9OEjx7VjzY3QKqC1O5','2024-01-31 12:09:21.173224','read write',1,2,'2024-01-31 02:09:21.173224','2024-01-31 02:09:21.173224',NULL,NULL),(40,'rDRx5lXiUrSS7xCQkDaARd03WGQ8xR','2024-01-31 12:14:56.425627','read write',1,2,'2024-01-31 02:14:56.425627','2024-01-31 02:14:56.425627',NULL,NULL),(41,'8YY0brrnI7HrTF1gU4XlKuLqKNEEDG','2024-01-31 12:17:10.282310','read write',1,2,'2024-01-31 02:17:10.282310','2024-01-31 02:17:10.282310',NULL,NULL),(42,'dnDDfGVagnWZEXkAZl5VJzSUJgBYfD','2024-01-31 12:17:31.073664','read write',1,2,'2024-01-31 02:17:31.073664','2024-01-31 02:17:31.073664',NULL,NULL),(43,'XOC5MYGtcWf3J5Tbk1IMdWArtMZFhf','2024-01-31 12:19:05.574962','read write',1,2,'2024-01-31 02:19:05.574962','2024-01-31 02:19:05.574962',NULL,NULL),(44,'dlXTmmmO95SjDsyEb89FwYpXK4Zlug','2024-01-31 12:19:40.676797','read write',1,2,'2024-01-31 02:19:40.676797','2024-01-31 02:19:40.676797',NULL,NULL),(45,'iGXL6FkMAJTcHWCAgt8mvU3cTjQ3CE','2024-01-31 12:28:19.457663','read write',1,2,'2024-01-31 02:28:19.457663','2024-01-31 02:28:19.457663',NULL,NULL),(46,'deOm7vH31sObZ8fhjxBLfQB4GVQXVL','2024-01-31 16:22:31.628135','read write',1,2,'2024-01-31 06:22:31.628135','2024-01-31 06:22:31.628135',NULL,NULL),(47,'MBza6OfUYf4njkdIHsH8NJnnppXe50','2024-01-31 19:32:04.639810','read write',1,14,'2024-01-31 09:32:04.639810','2024-01-31 09:32:04.639810',NULL,NULL),(48,'tvb9bgfurdLCIGqy1Hqri3hpMeCq7t','2024-01-31 19:52:16.445878','read write',1,14,'2024-01-31 09:52:16.445878','2024-01-31 09:52:16.445878',NULL,NULL),(49,'7epxt0AY7omF0AVaxd3wAnt5qOS2w1','2024-01-31 19:54:11.451555','read write',1,10,'2024-01-31 09:54:11.451555','2024-01-31 09:54:11.451555',NULL,NULL),(50,'gcatcaRWmPMq5r2SbA32s3WDcWaj4H','2024-01-31 19:54:47.491119','read write',1,10,'2024-01-31 09:54:47.491119','2024-01-31 09:54:47.491119',NULL,NULL),(51,'7ZZ2nfwZhzhhom1o2tGfhi7bEw1J5r','2024-01-31 19:58:57.428261','read write',1,10,'2024-01-31 09:58:57.428261','2024-01-31 09:58:57.428261',NULL,NULL),(52,'GjBBRknFUZVZbfKaWuTQUuIg90TnrW','2024-01-31 19:59:34.521879','read write',1,10,'2024-01-31 09:59:34.521879','2024-01-31 09:59:34.521879',NULL,NULL),(53,'2dsfj1H1A2q1yXSjVcdnQYvJzMJHzv','2024-01-31 20:00:01.903506','read write',1,10,'2024-01-31 10:00:01.903506','2024-01-31 10:00:01.903506',NULL,NULL),(54,'0Nwxjb2E1WBG8VTgXm8X1u5QmZVZ5R','2024-01-31 20:03:29.821554','read write',1,10,'2024-01-31 10:03:29.821554','2024-01-31 10:03:29.821554',NULL,NULL),(55,'wfjnFWB7sIsoLUUFMBoTBHB4DXpkXW','2024-02-01 11:57:11.671326','read write',1,10,'2024-02-01 01:57:11.671326','2024-02-01 01:57:11.671326',NULL,NULL),(56,'sc1NLgB9IZe2TSHU2NQRMtwnEB3FWN','2024-02-01 12:19:17.140070','read write',1,10,'2024-02-01 02:19:17.141074','2024-02-01 02:19:17.141074',NULL,NULL),(57,'min7zfifGjTlRUflJhFelKmTX6FBhv','2024-02-01 12:20:35.673053','read write',1,10,'2024-02-01 02:20:35.673053','2024-02-01 02:20:35.673053',NULL,NULL),(58,'T9K3tYdbk1EsuTP8XCoaMEgSWbkC7r','2024-02-01 12:21:15.579148','read write',1,10,'2024-02-01 02:21:15.579148','2024-02-01 02:21:15.579148',NULL,NULL),(59,'EYU0PoDJ0rJLkCdeo4LDh1GyUqwzo1','2024-02-01 12:27:53.566188','read write',1,2,'2024-02-01 02:27:53.566188','2024-02-01 02:27:53.566188',NULL,NULL),(60,'CLFN6tMvcPISYz3G6zb2SWyPrSAqp4','2024-02-01 12:31:09.121149','read write',1,10,'2024-02-01 02:31:09.121149','2024-02-01 02:31:09.121149',NULL,NULL),(61,'IHWmtMCvdgMHhmPYICXDcT0Cl2fWfJ','2024-02-01 12:36:21.739983','read write',1,3,'2024-02-01 02:36:21.739983','2024-02-01 02:36:21.739983',NULL,NULL),(62,'RfIFFrdLtSZnRMJSWSwVAQfsB4NR3l','2024-02-01 12:48:06.271501','read write',1,2,'2024-02-01 02:48:06.271501','2024-02-01 02:48:06.271501',NULL,NULL),(63,'XjjAGuIqwftXPnyVcXbgGFxD6zQN0q','2024-02-02 11:46:00.233871','read write',1,2,'2024-02-02 01:46:00.233871','2024-02-02 01:46:00.233871',NULL,NULL),(64,'kM9jocKJtvidEQWUQrByUtYwc4IPxU','2024-02-02 12:00:06.653416','read write',1,14,'2024-02-02 02:00:06.654427','2024-02-02 02:00:06.654427',NULL,NULL),(65,'t2NT8BHaViTDkXJoIMDoCx4vdAPxiV','2024-02-02 12:05:20.749527','read write',1,14,'2024-02-02 02:05:20.749527','2024-02-02 02:05:20.749527',NULL,NULL),(66,'0z4McgmBDrST6iPoFsC7n82ULYBeLq','2024-02-02 12:30:43.617117','read write',1,10,'2024-02-02 02:30:43.618146','2024-02-02 02:30:43.618146',NULL,NULL),(67,'M82m6VRLiQHBfEkvlEt6aNCf7FSZ46','2024-02-02 13:07:17.117173','read write',1,10,'2024-02-02 03:07:17.118173','2024-02-02 03:07:17.118173',NULL,NULL),(68,'j0g6W6paaNlotwpvnbtdxkxQOCKtVM','2024-02-02 13:09:09.914262','read write',1,14,'2024-02-02 03:09:09.914262','2024-02-02 03:09:09.914262',NULL,NULL),(69,'pD4klqbFa0DVFLMF6wxSA2UmRI945k','2024-02-02 13:12:18.207526','read write',1,10,'2024-02-02 03:12:18.207526','2024-02-02 03:12:18.207526',NULL,NULL),(70,'oo20NyoLqxHkVLV1jsKfLiwpaVWJgM','2024-02-02 13:12:45.941794','read write',1,10,'2024-02-02 03:12:45.941794','2024-02-02 03:12:45.941794',NULL,NULL),(71,'MyLtqHUG6N5qGr0alKgnpeXXmOCVp3','2024-02-02 13:17:54.549231','read write',1,10,'2024-02-02 03:17:54.549231','2024-02-02 03:17:54.550241',NULL,NULL),(72,'5hzi7NDAiBmvHDGWVLMokPa6NszNia','2024-02-02 13:18:32.492524','read write',1,10,'2024-02-02 03:18:32.492524','2024-02-02 03:18:32.492524',NULL,NULL),(73,'htENLVtwtyslrCuYpbWx6CdmpQAEwZ','2024-02-02 13:18:54.257246','read write',1,10,'2024-02-02 03:18:54.257246','2024-02-02 03:18:54.257246',NULL,NULL),(74,'OyxxUykyPM2CbwLkYyQrSEFCF90KXy','2024-02-02 13:25:58.028454','read write',1,14,'2024-02-02 03:25:58.029544','2024-02-02 03:25:58.029544',NULL,NULL),(75,'cLioLXJDq8Bm0qropEfJTctVs9jZIp','2024-02-02 13:42:19.429504','read write',1,14,'2024-02-02 03:42:19.430539','2024-02-02 03:42:19.430539',NULL,NULL),(76,'H2cg89h1tzX68MfsZLfbuDtkyy36KN','2024-02-02 13:51:18.836525','read write',1,10,'2024-02-02 03:51:18.836525','2024-02-02 03:51:18.836525',NULL,NULL),(77,'9WkAO2MSjMejC002vSb0Ev246cvQSA','2024-02-02 13:53:18.202198','read write',1,10,'2024-02-02 03:53:18.202198','2024-02-02 03:53:18.202198',NULL,NULL),(78,'pokSWxoBIving6fJkp6lHIjaA6dQvQ','2024-02-02 13:55:39.643109','read write',1,2,'2024-02-02 03:55:39.643109','2024-02-02 03:55:39.643109',NULL,NULL),(79,'JiRISK9ZVURrKIsVvi5HOcfMzJffpS','2024-02-02 13:56:50.143712','read write',1,10,'2024-02-02 03:56:50.143712','2024-02-02 03:56:50.143712',NULL,NULL),(80,'jNriTEOKoVfQgmpjP8ohL5Wi5nRhCP','2024-02-02 14:15:46.481841','read write',1,10,'2024-02-02 04:15:46.481841','2024-02-02 04:15:46.481841',NULL,NULL),(81,'0xCHJf9DLDSWildORPxXSpiXj64ZLc','2024-02-02 14:22:38.238816','read write',1,6,'2024-02-02 04:22:38.238816','2024-02-02 04:22:38.238816',NULL,NULL),(82,'L0Py8NxZZqqQczHaJPdZAIOvczM6S1','2024-02-02 14:22:49.857532','read write',1,10,'2024-02-02 04:22:49.857532','2024-02-02 04:22:49.857532',NULL,NULL),(83,'ZxAhAs4le2cs9OSZiyNrOl4bP4duav','2024-02-02 14:32:08.552600','read write',1,10,'2024-02-02 04:32:08.552600','2024-02-02 04:32:08.552600',NULL,NULL),(84,'lwWmmcqrtYga9HKX5WF7ZIP94QJKFg','2024-02-02 14:34:58.298369','read write',1,10,'2024-02-02 04:34:58.298369','2024-02-02 04:34:58.298369',NULL,NULL),(85,'UMpKBTr5CT6ROvFmG7DmKqGNq7GNy1','2024-02-02 14:36:13.382716','read write',1,10,'2024-02-02 04:36:13.383693','2024-02-02 04:36:13.383693',NULL,NULL),(86,'rmACxOtVITXSLJXTbWQpWNUJkG3TDr','2024-02-02 16:29:24.116149','read write',1,10,'2024-02-02 06:29:24.117270','2024-02-02 06:29:24.117270',NULL,NULL),(87,'h8kTpbnoBiw1eiaMwjy8hbNdx86BH4','2024-02-02 17:24:14.788592','read write',1,10,'2024-02-02 07:24:14.788592','2024-02-02 07:24:14.788592',NULL,NULL),(88,'4djP657JywWd6G1k7WZZjc1ykcYikZ','2024-02-03 11:43:17.953246','read write',1,10,'2024-02-03 01:43:17.953246','2024-02-03 01:43:17.953246',NULL,NULL),(89,'jca605mUJOdfM2ng69C1NWsjP9YHFe','2024-02-03 12:30:11.031460','read write',1,14,'2024-02-03 02:30:11.031460','2024-02-03 02:30:11.031460',NULL,NULL),(90,'0vHpisbOQLKOv4RF3i59O7I2qlJOxc','2024-02-03 12:32:33.010830','read write',1,14,'2024-02-03 02:32:33.010830','2024-02-03 02:32:33.010830',NULL,NULL),(91,'BxB4IYgdzw6aw8BXGzhyDFRDGvhRgO','2024-02-03 12:48:31.668021','read write',1,10,'2024-02-03 02:48:31.668021','2024-02-03 02:48:31.668021',NULL,NULL),(92,'OXjCeFQ9TmNiJ8fk58RDFwhUmD1RSI','2024-02-03 12:51:24.466810','read write',1,10,'2024-02-03 02:51:24.466810','2024-02-03 02:51:24.466810',NULL,NULL),(93,'VsOVhQFJo3M0HiOoaWqfZp6hPZ2ROC','2024-02-03 13:25:42.597667','read write',1,10,'2024-02-03 03:25:42.597667','2024-02-03 03:25:42.597667',NULL,NULL),(94,'qyyeOZQXmBVafty8gi548e0TI3BNhA','2024-02-03 13:36:34.842907','read write',1,10,'2024-02-03 03:36:34.843907','2024-02-03 03:36:34.843907',NULL,NULL),(95,'9EgnfjCaHnmiJaE3PYUwMwRMDwvPYp','2024-02-03 13:51:42.017523','read write',1,10,'2024-02-03 03:51:42.017523','2024-02-03 03:51:42.017523',NULL,NULL),(96,'ugDxHystHr2dj5cn5hQpU9yz7x4yJc','2024-02-03 14:07:53.097325','read write',1,10,'2024-02-03 04:07:53.097325','2024-02-03 04:07:53.097325',NULL,NULL),(97,'SqMbex1qah1xWIn6Z4Cn1nmFg917rL','2024-02-03 14:18:18.740465','read write',1,10,'2024-02-03 04:18:18.740465','2024-02-03 04:18:18.740465',NULL,NULL),(98,'TtJg0KUrkGV0B80dQcyDk5J21CRh6e','2024-02-16 13:01:36.552407','read write',1,10,'2024-02-16 03:01:36.552407','2024-02-16 03:01:36.552407',NULL,NULL),(99,'GEhch9QWtrMVKv70E05qaDGSDcvutm','2024-02-16 14:16:37.192303','read write',1,10,'2024-02-16 04:16:37.195312','2024-02-16 04:16:37.195312',NULL,NULL),(100,'ieBepbxwiTJiIDnwoyVmxHGICcusGm','2024-02-16 14:20:44.632473','read write',1,10,'2024-02-16 04:20:44.633409','2024-02-16 04:20:44.633409',NULL,NULL),(101,'EJZ3lQoxpnKeOUS0SsBYM34syuboUd','2024-02-16 14:36:39.639284','read write',1,10,'2024-02-16 04:36:39.639284','2024-02-16 04:36:39.639284',NULL,NULL),(102,'AYoWHHXJEPuMIDhAtp1crMa1tUicGx','2024-02-16 14:45:49.084261','read write',1,10,'2024-02-16 04:45:49.084261','2024-02-16 04:45:49.084261',NULL,NULL),(103,'ikEN7Pbzt8cLoxpnCVUhgNkdHJD07e','2024-02-16 16:26:24.103722','read write',1,10,'2024-02-16 06:26:24.103722','2024-02-16 06:26:24.103722',NULL,NULL),(104,'PNPndU2DITOmxXqNp0ZauTHNx65qVa','2024-02-16 16:47:59.334292','read write',1,10,'2024-02-16 06:47:59.334292','2024-02-16 06:47:59.334292',NULL,NULL),(105,'CkPmZipVZOBZUTUEiZmSqeqGRjT78W','2024-02-16 17:29:57.803103','read write',1,10,'2024-02-16 07:29:57.803103','2024-02-16 07:29:57.803103',NULL,NULL),(106,'ysH2d5otMTeAIdetZbBehpT79h0hVN','2024-02-16 17:31:10.592592','read write',1,10,'2024-02-16 07:31:10.592592','2024-02-16 07:31:10.592592',NULL,NULL),(107,'AJcvtvLhYAvW8cAJf9MaIcj7JQijca','2024-02-16 17:35:44.626953','read write',1,10,'2024-02-16 07:35:44.626953','2024-02-16 07:35:44.626953',NULL,NULL),(108,'Jv9ohqCIJ4CFyAL6PakqPs4PbxQoDy','2024-02-16 17:36:37.276368','read write',1,10,'2024-02-16 07:36:37.277370','2024-02-16 07:36:37.277370',NULL,NULL),(109,'4IjsqnWbjO4NtlMzPu0COAyHk5s7mw','2024-02-16 17:41:28.051502','read write',1,10,'2024-02-16 07:41:28.051502','2024-02-16 07:41:28.051502',NULL,NULL),(110,'54VrpfkHSTMEUq0O5awFgd7XtEuqC2','2024-02-16 17:56:15.931775','read write',1,10,'2024-02-16 07:56:15.931775','2024-02-16 07:56:15.931775',NULL,NULL),(111,'0cUcBtRBBScD0mMbJTytHzKfir1NGu','2024-02-16 18:00:51.845026','read write',1,10,'2024-02-16 08:00:51.845026','2024-02-16 08:00:51.845026',NULL,NULL),(112,'4uMw8o4NpPLHERRFZrKGQAwyFNq37z','2024-02-16 18:03:18.362780','read write',1,10,'2024-02-16 08:03:18.362780','2024-02-16 08:03:18.362780',NULL,NULL),(113,'kE6USrbfOUPV97SZBh1mXb5kA3DfnK','2024-02-16 18:08:24.448455','read write',1,10,'2024-02-16 08:08:24.448455','2024-02-16 08:08:24.448455',NULL,NULL),(114,'OeloBlhxqSAUltbqxOIm3gnBjhcSkM','2024-02-16 18:12:16.000009','read write',1,10,'2024-02-16 08:12:16.000009','2024-02-16 08:12:16.000009',NULL,NULL),(115,'S0UrhfhlcIKSc5ZvDJN7FUR1bUMNBl','2024-02-16 18:18:36.887997','read write',1,10,'2024-02-16 08:18:36.887997','2024-02-16 08:18:36.887997',NULL,NULL),(116,'K21PwN0UBiShArstRSdJtVeJRBURC6','2024-02-16 18:28:22.159554','read write',1,10,'2024-02-16 08:28:22.159554','2024-02-16 08:28:22.159554',NULL,NULL),(117,'qori0Dc87Q1oMnRJeSqzsOETaNmZfs','2024-02-16 19:43:11.489315','read write',1,10,'2024-02-16 09:43:11.489315','2024-02-16 09:43:11.489315',NULL,NULL),(118,'3fOgcfgiihlVhttXQ2Jg6AyqQYlqdx','2024-02-16 19:49:48.923483','read write',1,10,'2024-02-16 09:49:48.924579','2024-02-16 09:49:48.924579',NULL,NULL),(119,'cpKVFKxEvEqueim7AgulZuqEXSqAXb','2024-02-17 11:38:10.315294','read write',1,10,'2024-02-17 01:38:10.315294','2024-02-17 01:38:10.315294',NULL,NULL),(120,'vCyrRARTtMdpQUvpYcARpj5mFXUvX0','2024-02-17 11:49:29.664788','read write',1,10,'2024-02-17 01:49:29.665399','2024-02-17 01:49:29.665399',NULL,NULL),(121,'hlZOED3snWEMAxGwhMgnhQHwf93IxW','2024-02-17 11:53:07.979704','read write',1,10,'2024-02-17 01:53:07.979704','2024-02-17 01:53:07.979704',NULL,NULL),(122,'XHCKkB2UaIASxrdvTrVo8CR8MJkGJv','2024-02-17 12:31:50.287618','read write',1,10,'2024-02-17 02:31:50.287618','2024-02-17 02:31:50.287618',NULL,NULL),(123,'NPUsWIFsM9Jj2iUIOLnIx8lenNb1e9','2024-02-17 12:34:00.811264','read write',1,10,'2024-02-17 02:34:00.811264','2024-02-17 02:34:00.811264',NULL,NULL),(124,'5b0Q0F3zxlMN4ebWQO4pMgqcTDrsqr','2024-02-17 12:39:34.530973','read write',1,10,'2024-02-17 02:39:34.530973','2024-02-17 02:39:34.530973',NULL,NULL),(125,'rntPsSnSFlCNhUXXfX0vZyIt06rkGV','2024-02-17 12:42:07.210391','read write',1,14,'2024-02-17 02:42:07.211344','2024-02-17 02:42:07.211344',NULL,NULL),(126,'h5TfYAYoGAoshcqBxFzmS8fjXPF5Ve','2024-02-17 12:42:36.018395','read write',1,14,'2024-02-17 02:42:36.018395','2024-02-17 02:42:36.018395',NULL,NULL),(127,'GvpiIx9R19oGzqa0BeEsuCLJ4y5dkl','2024-02-17 13:10:38.006557','read write',1,10,'2024-02-17 03:10:38.006557','2024-02-17 03:10:38.006557',NULL,NULL),(128,'3cpizPAjlpQdAlpTDn0ObgTM5b20I6','2024-02-17 13:21:18.986804','read write',1,14,'2024-02-17 03:21:18.986804','2024-02-17 03:21:18.986804',NULL,NULL),(129,'AtcNXcdZX4M78VKZQtSbkUMSRkfg5k','2024-02-17 13:39:29.549858','read write',1,14,'2024-02-17 03:39:29.549858','2024-02-17 03:39:29.549858',NULL,NULL),(130,'WZVn5WUCvclqXI34XupvgOuHJSCgKP','2024-02-19 16:10:45.433230','read write',1,10,'2024-02-19 06:10:45.434230','2024-02-19 06:10:45.434230',NULL,NULL),(131,'jXvaoFFfBbq2NXJGxySRkoY6nXrB4N','2024-02-19 16:13:34.363615','read write',1,14,'2024-02-19 06:13:34.363615','2024-02-19 06:13:34.363615',NULL,NULL),(132,'cQhvRKCfASXos0lOc3UniAhMPnyyjU','2024-02-19 16:48:22.004290','read write',1,14,'2024-02-19 06:48:22.004290','2024-02-19 06:48:22.004290',NULL,NULL),(133,'GD4poVZLTzj6WGflOlm767BHW63khP','2024-02-19 16:53:47.359958','read write',1,14,'2024-02-19 06:53:47.359958','2024-02-19 06:53:47.359958',NULL,NULL),(134,'eAv4NuyBG80Wc5MKRhRqqtzzfkGgvc','2024-02-19 17:05:44.848057','read write',1,14,'2024-02-19 07:05:44.848057','2024-02-19 07:05:44.848057',NULL,NULL),(135,'fpZjVUWaRopLkQ21Se7gsrbyWH03d3','2024-02-19 17:23:18.151484','read write',1,14,'2024-02-19 07:23:18.152490','2024-02-19 07:23:18.152490',NULL,NULL),(136,'deFaGju4Oh532LrTa9o384W0lxJWJm','2024-02-19 17:25:13.085420','read write',1,14,'2024-02-19 07:25:13.085420','2024-02-19 07:25:13.085420',NULL,NULL),(137,'M6K6XarJWTJs0PgyIboXnxir0QImC9','2024-02-19 17:26:19.080494','read write',1,14,'2024-02-19 07:26:19.080494','2024-02-19 07:26:19.080494',NULL,NULL),(138,'s48i5QL9S00aAV1nvLTck6I2iQFR7Z','2024-02-19 17:28:31.512253','read write',1,14,'2024-02-19 07:28:31.512253','2024-02-19 07:28:31.512253',NULL,NULL),(139,'TKYsYtK0kW0EFcs9m0om9mMrXRpHHW','2024-02-19 17:28:55.132547','read write',1,14,'2024-02-19 07:28:55.132547','2024-02-19 07:28:55.132547',NULL,NULL),(140,'NlE0mida0bZjxKqynFdDpjp66iwTxL','2024-02-19 17:39:15.730612','read write',1,14,'2024-02-19 07:39:15.730612','2024-02-19 07:39:15.730612',NULL,NULL),(141,'eJ56m37LbQl3sx69x08XydCF1thPP0','2024-02-19 17:54:19.908231','read write',1,14,'2024-02-19 07:54:19.908231','2024-02-19 07:54:19.908231',NULL,NULL),(142,'03mniZrsZzbVco60BvfED20jvsvRSd','2024-02-19 18:03:40.613518','read write',1,14,'2024-02-19 08:03:40.613518','2024-02-19 08:03:40.613518',NULL,NULL),(143,'XC6sfdLhOOyGJhoMaWfOEgb0yrZTag','2024-02-19 18:14:36.571744','read write',1,14,'2024-02-19 08:14:36.572701','2024-02-19 08:14:36.572701',NULL,NULL),(144,'d2TA76bgj1t0ZSF1cPep9QMmXL1l8Q','2024-02-19 18:58:07.878691','read write',1,14,'2024-02-19 08:58:07.878691','2024-02-19 08:58:07.878691',NULL,NULL),(145,'mBaBkUZzJpZ1qNvNXYdcBjgTLhYMLE','2024-02-19 19:18:56.791300','read write',1,14,'2024-02-19 09:18:56.791300','2024-02-19 09:18:56.791300',NULL,NULL),(146,'MnMp5qkIQq0qfEQwTebwW69huJEDjU','2024-02-19 19:22:36.835984','read write',1,14,'2024-02-19 09:22:36.835984','2024-02-19 09:22:36.835984',NULL,NULL),(147,'bC4JFzVnLPnCOUS4rJd6GKDhW0qmCR','2024-02-19 19:40:35.091203','read write',1,10,'2024-02-19 09:40:35.091203','2024-02-19 09:40:35.091203',NULL,NULL),(148,'4bcHh61QzuEFumrHAb6VYzEl7wBvdH','2024-02-19 19:42:34.157597','read write',1,10,'2024-02-19 09:42:34.158681','2024-02-19 09:42:34.158681',NULL,NULL),(149,'mE3D7Eyr5mD6mgpZdDCLJwW04wdYSf','2024-02-20 11:19:47.665327','read write',1,10,'2024-02-20 01:19:47.665327','2024-02-20 01:19:47.665327',NULL,NULL),(150,'rYvg8oqeIj1Nk0SW8kTE7tI59Lk07r','2024-02-20 11:23:02.055867','read write',1,14,'2024-02-20 01:23:02.055867','2024-02-20 01:23:02.055867',NULL,NULL),(151,'PSohTyPptX91Np8Ae9RWPs3UdfSRpQ','2024-02-20 14:09:23.068057','read write',1,14,'2024-02-20 04:09:23.069068','2024-02-20 04:09:23.069068',NULL,NULL),(152,'KpZELgc3qh1jNsjumJhBJd9B4FBKnW','2024-02-21 14:27:57.092692','read write',1,10,'2024-02-21 04:27:57.093702','2024-02-21 04:27:57.093702',NULL,NULL),(153,'4mCMmSHvqMuAI73Eo8QFtTXCUPLNz0','2024-02-21 17:38:25.199671','read write',1,14,'2024-02-21 07:38:25.200679','2024-02-21 07:38:25.200679',NULL,NULL),(154,'hGP761yHGeswjjHUAyc04yoZqrZxcV','2024-02-21 17:49:45.710574','read write',1,14,'2024-02-21 07:49:45.710574','2024-02-21 07:49:45.710574',NULL,NULL),(155,'MJ13cXaaf0GCgSTiYTtcdiFnf4tQwK','2024-02-21 17:50:22.325479','read write',1,14,'2024-02-21 07:50:22.325479','2024-02-21 07:50:22.325479',NULL,NULL),(156,'IH6TpF6mCU2kJJU7E5f20tHVO1jqik','2024-02-21 17:58:19.487486','read write',1,14,'2024-02-21 07:58:19.487486','2024-02-21 07:58:19.487486',NULL,NULL),(157,'PE3otokzKuStF8wmwckG6Mnx1cN9VO','2024-02-21 18:53:27.216227','read write',1,14,'2024-02-21 08:53:27.217229','2024-02-21 08:53:27.217229',NULL,NULL),(158,'xY7rou5VOZQNaEkiAxxWq59pKcjMGC','2024-02-21 19:13:05.707342','read write',1,14,'2024-02-21 09:13:05.708347','2024-02-21 09:13:05.708347',NULL,NULL),(159,'kqAgAaSfxYjXT0sdiLOjdflI2BliZt','2024-02-21 19:28:10.474178','read write',1,14,'2024-02-21 09:28:10.474178','2024-02-21 09:28:10.474178',NULL,NULL),(160,'47S37CopZtujKOTgwcUrqMV5YF4EfZ','2024-02-23 12:35:43.521106','read write',1,10,'2024-02-23 02:35:43.521106','2024-02-23 02:35:43.521106',NULL,NULL),(161,'Ep1NejoccAzpkTY7KMCJDnmvhyjoor','2024-02-23 13:41:15.806086','read write',1,10,'2024-02-23 03:41:15.814353','2024-02-23 03:41:15.814353',NULL,NULL),(162,'HlM9XDbn6fQN3cCgyhPPTYtYjNiCt1','2024-02-23 13:59:14.612569','read write',1,10,'2024-02-23 03:59:14.612569','2024-02-23 03:59:14.612569',NULL,NULL),(163,'Q9T6q8HCy2AJgPRzaWpiyimF8DW9aI','2024-02-26 17:07:16.615965','read write',1,14,'2024-02-26 07:07:16.616959','2024-02-26 07:07:16.616959',NULL,NULL),(164,'848J1IwqEQoGHamTCE7LtzV09nnimo','2024-02-26 17:13:37.132299','read write',1,10,'2024-02-26 07:13:37.132299','2024-02-26 07:13:37.132299',NULL,NULL),(165,'YigfPy7NUmvvkMff6jPPKRGmWuoQVr','2024-02-26 17:16:39.564788','read write',1,14,'2024-02-26 07:16:39.564788','2024-02-26 07:16:39.564788',NULL,NULL),(166,'6DHnwNydJkzw2SRIMlW3VlwrpEeTxy','2024-02-26 17:17:11.454823','read write',1,10,'2024-02-26 07:17:11.455740','2024-02-26 07:17:11.455740',NULL,NULL),(167,'mKJNVAf79qnSi5JcWHX0xJYFz2BEbW','2024-02-26 17:27:33.825806','read write',1,10,'2024-02-26 07:27:33.825806','2024-02-26 07:27:33.825806',NULL,NULL),(168,'ymXA3DgwqHLQhS069EwsFPN3SNuIjL','2024-02-26 17:34:05.481992','read write',1,10,'2024-02-26 07:34:05.481992','2024-02-26 07:34:05.481992',NULL,NULL),(169,'jSxNnc0ZwwxBn5ii5NpwV4ONN7RQ5l','2024-02-26 17:46:43.073349','read write',1,10,'2024-02-26 07:46:43.073349','2024-02-26 07:46:43.073349',NULL,NULL),(170,'xrlylonzm5jse1dpRaJlZbfU7ca8yC','2024-02-26 18:03:02.199088','read write',1,14,'2024-02-26 08:03:02.199088','2024-02-26 08:03:02.199088',NULL,NULL),(171,'FlQWleCKoiwRTwzov1cWwXrm0fIqcb','2024-02-26 18:04:37.542841','read write',1,10,'2024-02-26 08:04:37.542841','2024-02-26 08:04:37.542841',NULL,NULL),(172,'sMpOQjjyncT19qR3wPDAUkAsK9LlsY','2024-02-26 18:18:44.851805','read write',1,10,'2024-02-26 08:18:44.852807','2024-02-26 08:18:44.852807',NULL,NULL),(173,'R8clPGBpr0PxVamBLpqU0euIyPvWh9','2024-02-26 18:23:04.147207','read write',1,10,'2024-02-26 08:23:04.147207','2024-02-26 08:23:04.147207',NULL,NULL),(174,'FTBd9CBHJJam4ZUrQreRIeRK4X9jI7','2024-02-26 18:44:39.401616','read write',1,10,'2024-02-26 08:44:39.402707','2024-02-26 08:44:39.402707',NULL,NULL),(175,'qaeyKi9W31bJqKw2De4rrFXgjTjsvO','2024-02-26 18:47:38.992998','read write',1,10,'2024-02-26 08:47:38.993883','2024-02-26 08:47:38.993883',NULL,NULL),(176,'MzPXcwrq5gdPjrKrjUKTo8PNjSQD0z','2024-02-26 18:48:03.488151','read write',1,10,'2024-02-26 08:48:03.489199','2024-02-26 08:48:03.489199',NULL,NULL),(177,'3Lvn4xcnrO2KKtUP3YZ5b6G8B3nxSN','2024-02-26 18:50:08.692246','read write',1,10,'2024-02-26 08:50:08.692246','2024-02-26 08:50:08.692246',NULL,NULL),(178,'MgEfwK3c87zUcIovIpxwZjawvjgQ22','2024-02-26 18:51:53.574561','read write',1,10,'2024-02-26 08:51:53.575563','2024-02-26 08:51:53.575563',NULL,NULL),(179,'ukYZnEw4HOMfrSyNA1HuBkS37smPcI','2024-02-26 19:03:28.264597','read write',1,10,'2024-02-26 09:03:28.264597','2024-02-26 09:03:28.264597',NULL,NULL),(180,'DnpZZgsqw1TPkQG1FC8aECfTglCeJ5','2024-02-26 19:12:10.683757','read write',1,10,'2024-02-26 09:12:10.683757','2024-02-26 09:12:10.683757',NULL,NULL),(181,'oJvktDebXRJVzQLXP8ig6JhKoouTHi','2024-02-26 19:19:24.030678','read write',1,10,'2024-02-26 09:19:24.030678','2024-02-26 09:19:24.030678',NULL,NULL),(182,'Av6AKqx6IHhEcDsD1WSbRM7wUBEPBT','2024-02-26 19:45:53.732371','read write',1,10,'2024-02-26 09:45:53.732371','2024-02-26 09:45:53.732371',NULL,NULL);
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
  `client_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect_uris` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `authorization_grant_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `skip_authorization` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `algorithm` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_logout_redirect_uris` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (_utf8mb3''),
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
INSERT INTO `oauth2_provider_application` VALUES (1,'YAZKTBdtmg6Jwrz0npyrlGsxg4k2pgch0pjMkHQl','','confidential','password','pbkdf2_sha256$600000$Gp2usHZY46VMqFC92JcOYr$ZSgpvZrSzQGy+5W3zqYeIh+4hgAPxnNspr7yqMsZxFw=','HTExpress',1,0,'2024-01-17 18:17:25.643821','2024-01-17 18:17:25.645492','','');
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
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `redirect_uri` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `scope` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `code_challenge` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_challenge_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nonce` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `claims` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (_utf8mb3''),
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
  `jti` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_refreshtoken` VALUES (1,'hepQwUWRXopdQFiw0n4921y2Eay3ho',1,1,1,'2024-01-17 18:17:48.095001','2024-01-17 18:17:48.095001',NULL),(2,'Bp2mHQwVkCH29j5q2YH8gTHqJrUjdf',2,1,3,'2024-01-17 18:38:15.955341','2024-01-17 18:38:15.955341',NULL),(3,'H2PwIpqT3l669sRCMEg9Xzn2ijK49D',3,1,2,'2024-01-17 18:46:03.159584','2024-01-17 18:46:03.159584',NULL),(4,'11FTKgdG2ioNVMCOG8FFpZyxwnrkOp',4,1,3,'2024-01-17 18:48:35.514331','2024-01-17 18:48:35.514331',NULL),(5,'k1bQBHXVnvc6rAqDcTtPtJ3scnq04j',5,1,3,'2024-01-17 18:51:13.362692','2024-01-17 18:51:13.362692',NULL),(6,'Hnm0xdoCKWC91KcHai8I5yjItw5737',6,1,3,'2024-01-17 18:51:28.575845','2024-01-17 18:51:28.575845',NULL),(7,'l1jRRo9SQRS3LrVWOW5t1lKHyb0m2P',7,1,2,'2024-01-17 19:14:38.166344','2024-01-17 19:14:38.166344',NULL),(8,'FF2Y2cdpTKTLyDraOlPOTgyzxmTL6v',8,1,2,'2024-01-18 06:25:41.998270','2024-01-18 06:25:41.998270',NULL),(9,'mGhiyiBQZSaIC8xVzp4WftzXKsww15',9,1,2,'2024-01-30 01:57:10.044503','2024-01-30 01:57:10.044503',NULL),(10,'m86v2p99Pah3s1RmjttykZMf56n7Nc',10,1,2,'2024-01-30 08:17:14.341528','2024-01-30 08:17:14.341528',NULL),(11,'M4eEQ0hgp4iojV9oEwUk7cJlWa0C6o',11,1,2,'2024-01-30 08:22:12.004588','2024-01-30 08:22:12.004588',NULL),(12,'NeBfLtuaWkDsSSYs3G725suziJeLDh',12,1,2,'2024-01-30 08:30:22.691987','2024-01-30 08:30:22.691987',NULL),(13,'czjMr1qMBCRFrrbvJIQaO7BAKpSHdZ',13,1,2,'2024-01-30 08:36:32.711513','2024-01-30 08:36:32.711513',NULL),(14,'kST2iPUpvohT9HA8PG60Elmcac3xqW',14,1,2,'2024-01-30 08:44:24.433369','2024-01-30 08:44:24.433369',NULL),(15,'wcvDjlhBh5Mi4FapSD09aZ1o33tLxM',15,1,2,'2024-01-30 08:47:40.015706','2024-01-30 08:47:40.015706',NULL),(16,'lI7KXXHWAnWxeMcD4QAzTRG6qIYxdv',16,1,2,'2024-01-30 09:08:03.946806','2024-01-30 09:08:03.946806',NULL),(17,'b0h0NRhGmai7BsZO7r9c0YbnQTAKlb',17,1,2,'2024-01-30 09:17:14.828016','2024-01-30 09:17:14.828016',NULL),(18,'IC2ACfgMIO7Oi2CLgAHEhNQpPZekDp',18,1,2,'2024-01-30 09:23:50.437494','2024-01-30 09:23:50.437494',NULL),(19,'oyBvlmDp56NNP90S7eu8HbARWqFlh0',19,1,2,'2024-01-30 09:30:53.456362','2024-01-30 09:30:53.456362',NULL),(20,'o9vdtS76A9GXwCURz4XOJHQq2lwdHT',20,1,2,'2024-01-31 01:43:13.898767','2024-01-31 01:43:13.898767',NULL),(21,'ClKu0ibGWnpXxxXsgbXvHm76bxINml',21,1,2,'2024-01-31 01:44:23.110310','2024-01-31 01:44:23.110310',NULL),(22,'hbyE6d5HxhRYfUq98zIbGrCbixaWcW',22,1,2,'2024-01-31 01:44:52.328899','2024-01-31 01:44:52.329901',NULL),(23,'udVpNcH8k4TgVlq2buDX8KZR4wFG8r',23,1,2,'2024-01-31 01:45:20.599134','2024-01-31 01:45:20.599134',NULL),(24,'ragqP5uy3nedyqYBcQ44y5czq9SeNw',24,1,2,'2024-01-31 01:45:58.336661','2024-01-31 01:45:58.336661',NULL),(25,'yAcsAHK4o40BaG5LP6OgsyMSEkgKmH',25,1,2,'2024-01-31 01:46:15.951306','2024-01-31 01:46:15.951306',NULL),(26,'WOHnDtCSBEN3g8cu2iiKohsK6m0AUQ',26,1,2,'2024-01-31 01:48:08.313185','2024-01-31 01:48:08.313185',NULL),(27,'NCXdrmBlwzhOvcaHrAv6hoqkSngUJg',27,1,2,'2024-01-31 01:49:09.919507','2024-01-31 01:49:09.919507',NULL),(28,'Wzwvq00ajj1YqVMubSlhpCY0Eu6THQ',28,1,2,'2024-01-31 01:50:02.427997','2024-01-31 01:50:02.427997',NULL),(29,'p2qLuyjF5LeJV89Rj73EYpZ84y55sI',29,1,2,'2024-01-31 01:52:47.213132','2024-01-31 01:52:47.213132',NULL),(30,'N6pVF396S3xCQklB99qdHcd7iouXzj',30,1,2,'2024-01-31 01:53:43.037547','2024-01-31 01:53:43.037547',NULL),(31,'xkFNmUHuSgz0bkVdZptdDbTABu6GhM',31,1,2,'2024-01-31 01:54:56.532634','2024-01-31 01:54:56.532634',NULL),(32,'m5iYBWR5EJIUmdhCpnyOfRBgx2VPny',32,1,2,'2024-01-31 01:55:25.845100','2024-01-31 01:55:25.845100',NULL),(33,'kTo7Idz6BqDjFvISuuzwSutpbh0mXU',33,1,2,'2024-01-31 01:55:41.029027','2024-01-31 01:55:41.029027',NULL),(34,'RXHRQ8K0Ck25HFs1rzh6CMFJMrCrCR',34,1,2,'2024-01-31 01:59:36.293347','2024-01-31 01:59:36.293347',NULL),(35,'f33ERozdPKQCuE0nXKpWNbzUUyrKmW',35,1,2,'2024-01-31 02:00:06.229870','2024-01-31 02:00:06.229870',NULL),(36,'GtzfWv1ultVv8YiBHyf0StYQIuP4zI',36,1,2,'2024-01-31 02:05:13.376953','2024-01-31 02:05:13.376953',NULL),(37,'R9oDMl37huL18hHBhcfSo4YcfoeQaP',37,1,2,'2024-01-31 02:08:48.613871','2024-01-31 02:08:48.613871',NULL),(38,'1DF2dEBp0v5LhYjYEBoBOwWtudjhfV',38,1,2,'2024-01-31 02:09:04.256588','2024-01-31 02:09:04.256588',NULL),(39,'ssqAKYYX0wjXzy1YDDBBxhBlr7HKTJ',39,1,2,'2024-01-31 02:09:21.185638','2024-01-31 02:09:21.185638',NULL),(40,'qAKndMiznl0ueJ3bJeDOArOL7b0phV',40,1,2,'2024-01-31 02:14:56.426658','2024-01-31 02:14:56.426658',NULL),(41,'aH9yPG19SX3aglitA7lskbhrMs6Od1',41,1,2,'2024-01-31 02:17:10.294472','2024-01-31 02:17:10.294472',NULL),(42,'bEhAaaAyl83y1yf408tPjLhMuvdvTP',42,1,2,'2024-01-31 02:17:31.088701','2024-01-31 02:17:31.088701',NULL),(43,'Ui09R5krgOvepXcj5VwWxSFMbuXGc3',43,1,2,'2024-01-31 02:19:05.575961','2024-01-31 02:19:05.575961',NULL),(44,'tvDsgLdVIbTNBdsEQxnOKRXMMLUgiJ',44,1,2,'2024-01-31 02:19:40.689879','2024-01-31 02:19:40.689879',NULL),(45,'12dw2nlwwG3HpzH52rM8CcWhvL36MV',45,1,2,'2024-01-31 02:28:19.461663','2024-01-31 02:28:19.461663',NULL),(46,'mEnH0jDgwmIX0v2qADugXTZcX6AD0J',46,1,2,'2024-01-31 06:22:31.642244','2024-01-31 06:22:31.642244',NULL),(47,'coXYMVQhDZg3jqcOGw96wDE3rf0uYd',47,1,14,'2024-01-31 09:32:04.642861','2024-01-31 09:32:04.642861',NULL),(48,'Esc2h5VdEjvW4vCKHrMgvxLcEtzAS8',48,1,14,'2024-01-31 09:52:16.458952','2024-01-31 09:52:16.458952',NULL),(49,'UGBVQ6Ll0up68xBffzPjrckvlCLIuq',49,1,10,'2024-01-31 09:54:11.464153','2024-01-31 09:54:11.464153',NULL),(50,'YcOtTIp2UMrq8l5L7QB2kXXgFLQhrb',50,1,10,'2024-01-31 09:54:47.503542','2024-01-31 09:54:47.503542',NULL),(51,'DPoT5LIV0XC2cJSHYXt0NWg4YiVllk',51,1,10,'2024-01-31 09:58:57.440388','2024-01-31 09:58:57.440388',NULL),(52,'DDk1mDZPS2WVQm7aC7bhOU4I0LqZd4',52,1,10,'2024-01-31 09:59:34.533947','2024-01-31 09:59:34.533947',NULL),(53,'nV4WeovjFagSP6Ul885t8rbTt1pYfH',53,1,10,'2024-01-31 10:00:01.905039','2024-01-31 10:00:01.905039',NULL),(54,'xEdeojhmGjwjDpFLbUUrIrQmscbhFW',54,1,10,'2024-01-31 10:03:29.823610','2024-01-31 10:03:29.823610',NULL),(55,'UI8chvghpfMwGORIRufKciYTcyLbhr',55,1,10,'2024-02-01 01:57:11.685320','2024-02-01 01:57:11.685320',NULL),(56,'jBzdMNnX1mfhHnzmI3QlyzxbvxXev7',56,1,10,'2024-02-01 02:19:17.153687','2024-02-01 02:19:17.153687',NULL),(57,'VWepRgOTKpRE8Hgn6sPFdFjjls2aJ9',57,1,10,'2024-02-01 02:20:35.685132','2024-02-01 02:20:35.685132',NULL),(58,'Bm1gQ6AwD0wvM6WRLW47ydwAANah3P',58,1,10,'2024-02-01 02:21:15.580142','2024-02-01 02:21:15.580142',NULL),(59,'KMg730DaSMOngBQhd8Kcua4HSncs17',59,1,2,'2024-02-01 02:27:53.567206','2024-02-01 02:27:53.567206',NULL),(60,'hufDZRh8azxxEkDBDGr0gyPdl1b52u',60,1,10,'2024-02-01 02:31:09.123183','2024-02-01 02:31:09.123183',NULL),(61,'fJWviDIZTxLkL8Ecg3k3tO6SQUvlvP',61,1,3,'2024-02-01 02:36:21.751993','2024-02-01 02:36:21.751993',NULL),(62,'WHRu4JW0MnMX6b98hiDgRRMXROBGFw',62,1,2,'2024-02-01 02:48:06.283961','2024-02-01 02:48:06.283961',NULL),(63,'y4SmTyeV4pKJ8TS1O9cYeuvU6fV3L5',63,1,2,'2024-02-02 01:46:00.237871','2024-02-02 01:46:00.237871',NULL),(64,'UF7bvOO3bOZKOXt11hP61HpIBOHrrm',64,1,14,'2024-02-02 02:00:06.667888','2024-02-02 02:00:06.667888',NULL),(65,'TOFCaOZSVr6vfhogs646s9he95ubBB',65,1,14,'2024-02-02 02:05:20.750524','2024-02-02 02:05:20.750524',NULL),(66,'8GwLnkbiLemaf189sLET6UyreIpu4k',66,1,10,'2024-02-02 02:30:43.619028','2024-02-02 02:30:43.619028',NULL),(67,'UtUPfDc9rwRyIMwYvbZ8TLmo8nGeKc',67,1,10,'2024-02-02 03:07:17.120378','2024-02-02 03:07:17.120378',NULL),(68,'A9HRf92tgDQHYveTto1PCXpduFdvoI',68,1,14,'2024-02-02 03:09:09.916264','2024-02-02 03:09:09.916264',NULL),(69,'LiHgClmNFgc9Y3EPSJE1bZm3CKHHo5',69,1,10,'2024-02-02 03:12:18.209467','2024-02-02 03:12:18.209467',NULL),(70,'gfhbIxdUCwQ05LDDameNSm6G1dbnXy',70,1,10,'2024-02-02 03:12:45.954699','2024-02-02 03:12:45.954699',NULL),(71,'9n1OHrbX3asf5LUfhAxkIwuwOOZeck',71,1,10,'2024-02-02 03:17:54.562241','2024-02-02 03:17:54.562241',NULL),(72,'MgweJLuR8wrVr8hrlQ2qje3TQZ8Zvc',72,1,10,'2024-02-02 03:18:32.493519','2024-02-02 03:18:32.493519',NULL),(73,'WfvrUx9z4Gf74dM4OeaSnilNYyQ77P',73,1,10,'2024-02-02 03:18:54.260332','2024-02-02 03:18:54.260332',NULL),(74,'cMu4RtEi5cFp9UEHvoxrINfbVXoiuX',74,1,14,'2024-02-02 03:25:58.040682','2024-02-02 03:25:58.040682',NULL),(75,'TqNyUZZbBzWDuo5vFPvPfzqdM5ccxF',75,1,14,'2024-02-02 03:42:19.431517','2024-02-02 03:42:19.431517',NULL),(76,'hUQ1dq5Tk6iGHARk4xYMaXg7oEr6nV',76,1,10,'2024-02-02 03:51:18.848984','2024-02-02 03:51:18.848984',NULL),(77,'uubrrrO8SgyydAsXYXaO001lUgO8Z7',77,1,10,'2024-02-02 03:53:18.203201','2024-02-02 03:53:18.203201',NULL),(78,'YVkwLfJir1lne4kJ9SbNuowjLzyoTz',78,1,2,'2024-02-02 03:55:39.657114','2024-02-02 03:55:39.657114',NULL),(79,'0IUY4NHPwyVWs8XfYSQp2DUK3OEyZ8',79,1,10,'2024-02-02 03:56:50.144707','2024-02-02 03:56:50.144707',NULL),(80,'zU6cDTXItj3g0ETzbbM5FeRk4w23QO',80,1,10,'2024-02-02 04:15:46.495305','2024-02-02 04:15:46.495305',NULL),(81,'NVpDSgngo6UyjckLOW2znKg8Ys23X6',81,1,6,'2024-02-02 04:22:38.250876','2024-02-02 04:22:38.250876',NULL),(82,'aeWdus3LWeOQvpQzAV16oeoBmmsgWl',82,1,10,'2024-02-02 04:22:49.858613','2024-02-02 04:22:49.858613',NULL),(83,'cWvOQR1T8ngsnR04oHP6OjjGDRoXyD',83,1,10,'2024-02-02 04:32:08.564916','2024-02-02 04:32:08.564916',NULL),(84,'zknWeCyX6JZkHCuyg7PlmpKQGFH6SS',84,1,10,'2024-02-02 04:34:58.300369','2024-02-02 04:34:58.300369',NULL),(85,'rV3UP3bOEK5rkopTnk11oFqJ6iLGOv',85,1,10,'2024-02-02 04:36:13.395873','2024-02-02 04:36:13.395873',NULL),(86,'VhyHF68jXNqxg0Ll2bPFmkMRtX7xNR',86,1,10,'2024-02-02 06:29:24.147213','2024-02-02 06:29:24.147213',NULL),(87,'Ydnl8waxwPi6Tj6b6lRKNYDhhW4tpw',87,1,10,'2024-02-02 07:24:14.806665','2024-02-02 07:24:14.806665',NULL),(88,'idbf7i4OYVFLrMQxjyMtPWR1GCeucB',88,1,10,'2024-02-03 01:43:17.956346','2024-02-03 01:43:17.956346',NULL),(89,'px9KKXyu8nzM4DH0Cgmt1wQCxXKUpk',89,1,14,'2024-02-03 02:30:11.048722','2024-02-03 02:30:11.048722',NULL),(90,'RqvF2K8BThWUlaxTYaBKlyXxoQ7XZq',90,1,14,'2024-02-03 02:32:33.024350','2024-02-03 02:32:33.024350',NULL),(91,'kuUxjL83Hq8jVMxcK5wwGlfC4BRFrs',91,1,10,'2024-02-03 02:48:31.681962','2024-02-03 02:48:31.681962',NULL),(92,'tWZ2Gq1X2VRa7RHgCt8EGxPa4yJ68E',92,1,10,'2024-02-03 02:51:24.479833','2024-02-03 02:51:24.479833',NULL),(93,'w1muVhw2uNxxjsX48MMEwnuRhRkgnv',93,1,10,'2024-02-03 03:25:42.599181','2024-02-03 03:25:42.599181',NULL),(94,'rfONXXMkzA0spVqmmy7bBMEL4x36yj',94,1,10,'2024-02-03 03:36:34.856926','2024-02-03 03:36:34.856926',NULL),(95,'pw9erEOgwuMXBZW8H76VtMMOO5h3Xq',95,1,10,'2024-02-03 03:51:42.030077','2024-02-03 03:51:42.030077',NULL),(96,'8neZCOTjeRdYvqvweuszz2j0d0NbZS',96,1,10,'2024-02-03 04:07:53.105298','2024-02-03 04:07:53.105298',NULL),(97,'IzZcQbpzTlH3z7cdBRky1G1sLGUeOR',97,1,10,'2024-02-03 04:18:18.753373','2024-02-03 04:18:18.753373',NULL),(98,'ngrsM1iMC8vNqIH0fJmUNbQxrwlsk7',98,1,10,'2024-02-16 03:01:36.566466','2024-02-16 03:01:36.566466',NULL),(99,'ADwhohPrhvHuReHcd9p90NvtoXjtvp',99,1,10,'2024-02-16 04:16:37.201228','2024-02-16 04:16:37.201228',NULL),(100,'GYUuAGwq4N93jDTyhFWzhDQ0i4fwfo',100,1,10,'2024-02-16 04:20:44.635440','2024-02-16 04:20:44.635440',NULL),(101,'tIwdpAofCrrqaRAPtxr4q7XSRIBw92',101,1,10,'2024-02-16 04:36:39.641378','2024-02-16 04:36:39.641378',NULL),(102,'dA9BkHFTj2ymJFviBVGPJ2QHxN0o4x',102,1,10,'2024-02-16 04:45:49.085260','2024-02-16 04:45:49.085260',NULL),(103,'avBMJZ4wCfiBIeO63mPWAp7ATvJBo4',103,1,10,'2024-02-16 06:26:24.105634','2024-02-16 06:26:24.105634',NULL),(104,'0UdA50KEXRxHVvnDRIZkdhuhd9pHBo',104,1,10,'2024-02-16 06:47:59.348091','2024-02-16 06:47:59.348091',NULL),(105,'diJYIotznuKJuUbLsXeSNHcR7otcox',105,1,10,'2024-02-16 07:29:57.817017','2024-02-16 07:29:57.817017',NULL),(106,'gqNYC6TcdMyCmQ8LsG1ycO6ruKV6Qu',106,1,10,'2024-02-16 07:31:10.593584','2024-02-16 07:31:10.593584',NULL),(107,'1brTkxu3sY0yOxOTResqimKwWpJ2qH',107,1,10,'2024-02-16 07:35:44.638784','2024-02-16 07:35:44.638784',NULL),(108,'uUkjEIdE66pBpmYMwCVAkqKfrxX2S5',108,1,10,'2024-02-16 07:36:37.278371','2024-02-16 07:36:37.278371',NULL),(109,'yBIyzj38GNtfpUjYvzIBDPIgum8ytj',109,1,10,'2024-02-16 07:41:28.052502','2024-02-16 07:41:28.052502',NULL),(110,'iaJoq9eA2sD57Grf5RtDHXKIaSnfbC',110,1,10,'2024-02-16 07:56:15.944136','2024-02-16 07:56:15.944136',NULL),(111,'7GafJCFGXchHICTuMCRg5in5ehDiiP',111,1,10,'2024-02-16 08:00:51.857348','2024-02-16 08:00:51.858338',NULL),(112,'pc4l1EjqCKMWSb65VxgB9izBeAl4AI',112,1,10,'2024-02-16 08:03:18.374928','2024-02-16 08:03:18.374928',NULL),(113,'aJR71wEdxoyjKcQzbagNOeGhfWOgOS',113,1,10,'2024-02-16 08:08:24.460896','2024-02-16 08:08:24.460896',NULL),(114,'yvzGjw0fBGDIHxTY4MojiFWGjApE42',114,1,10,'2024-02-16 08:12:16.012107','2024-02-16 08:12:16.012107',NULL),(115,'kSCNAgH1lqZk9OKAiMdUgLEd47YBBZ',115,1,10,'2024-02-16 08:18:36.888999','2024-02-16 08:18:36.888999',NULL),(116,'RqMbY7O1bGyDb4oTeG11CZD8MWb4dC',116,1,10,'2024-02-16 08:28:22.160542','2024-02-16 08:28:22.161456',NULL),(117,'Mu21Kq70SOtevoH58cviPYxP0Dx5Fb',117,1,10,'2024-02-16 09:43:11.502919','2024-02-16 09:43:11.502919',NULL),(118,'dQ3ytTN65CwiWGoEsxdTY0vti6R2G9',118,1,10,'2024-02-16 09:49:48.937616','2024-02-16 09:49:48.937616',NULL),(119,'fVS91ntSvQdcofG8WK5P263D60D1pP',119,1,10,'2024-02-17 01:38:10.329372','2024-02-17 01:38:10.329372',NULL),(120,'StyYkW4w4AWngiefudXULxVqd5CFgt',120,1,10,'2024-02-17 01:49:29.667511','2024-02-17 01:49:29.667576',NULL),(121,'W8NbODEnHGuHIq0ECSSiquBvlhAxw1',121,1,10,'2024-02-17 01:53:07.991718','2024-02-17 01:53:07.991718',NULL),(122,'QkqDMGZaZZv9NDQ9CSMl43Y9MjQfiE',122,1,10,'2024-02-17 02:31:50.305171','2024-02-17 02:31:50.305171',NULL),(123,'SWd8nqKpd5uuqratpYhN4BCqu1HvHW',123,1,10,'2024-02-17 02:34:00.813450','2024-02-17 02:34:00.813450',NULL),(124,'EHB9Qt82D6HCZwQpRBpqEhGzRmqU4V',124,1,10,'2024-02-17 02:39:34.531975','2024-02-17 02:39:34.531975',NULL),(125,'9S7xKTcEhz2gfa88uNW0NH8ZsEOGx5',125,1,14,'2024-02-17 02:42:07.225105','2024-02-17 02:42:07.225105',NULL),(126,'6Y9qfyPOuNhEswy2qikPMdsmaHYiRm',126,1,14,'2024-02-17 02:42:36.031396','2024-02-17 02:42:36.031396',NULL),(127,'z55E1MfFTby2A3yxZ18BkwxreiHbUT',127,1,10,'2024-02-17 03:10:38.019836','2024-02-17 03:10:38.019836',NULL),(128,'tTc4mmh6BO8uGnk2GpbmRI8Qs5IF39',128,1,14,'2024-02-17 03:21:18.999881','2024-02-17 03:21:18.999881',NULL),(129,'xJFvjtLno6viwRpy6pBVpuyuA0564t',129,1,14,'2024-02-17 03:39:29.561808','2024-02-17 03:39:29.561808',NULL),(130,'13DcDIznh37yY4OocWnqrz4JZNSg0o',130,1,10,'2024-02-19 06:10:45.446205','2024-02-19 06:10:45.446205',NULL),(131,'cn0dayyPvZPcEPynjHRA5TLx8RGLyZ',131,1,14,'2024-02-19 06:13:34.366543','2024-02-19 06:13:34.366543',NULL),(132,'OQrq95v4ZRmLs19fReN2N3CaneJPhq',132,1,14,'2024-02-19 06:48:22.018717','2024-02-19 06:48:22.018717',NULL),(133,'5vCEs9kuLAKs9dYyg7oslIJcp2fGwp',133,1,14,'2024-02-19 06:53:47.373618','2024-02-19 06:53:47.373618',NULL),(134,'jXEciwfsW6k4Z79IrUqILAjf3oB0Id',134,1,14,'2024-02-19 07:05:44.848995','2024-02-19 07:05:44.848995',NULL),(135,'q4na2EdUEAWVJOwHoCWCNpOY0uzzvf',135,1,14,'2024-02-19 07:23:18.153846','2024-02-19 07:23:18.153846',NULL),(136,'QQOJHIYu6BNFeVDFIVptdV4A8uw0pm',136,1,14,'2024-02-19 07:25:13.091491','2024-02-19 07:25:13.091491',NULL),(137,'YV4gPtPLdQ6XiCZWm5M5jKaGzs5y7k',137,1,14,'2024-02-19 07:26:19.092557','2024-02-19 07:26:19.092557',NULL),(138,'5EVbnhDZ7YRACaU5ayo4yIsKOxtmwG',138,1,14,'2024-02-19 07:28:31.524769','2024-02-19 07:28:31.524769',NULL),(139,'HepPGF8Eu3TFWNeAUKoXRaWUGesJ8M',139,1,14,'2024-02-19 07:28:55.133469','2024-02-19 07:28:55.133469',NULL),(140,'l3ggxmHa8iUwIBnuzvdxPdmXCOukcT',140,1,14,'2024-02-19 07:39:15.733521','2024-02-19 07:39:15.733521',NULL),(141,'Rc3YxAqInE3JylsPqniJq6ey2bD1Y8',141,1,14,'2024-02-19 07:54:19.920479','2024-02-19 07:54:19.920479',NULL),(142,'GBrE8t4ujaK48oIWNK1aEpR0RRdOgS',142,1,14,'2024-02-19 08:03:40.615421','2024-02-19 08:03:40.615421',NULL),(143,'IVbamn6phZVpPLWwpYuourRUW8egS9',143,1,14,'2024-02-19 08:14:36.573660','2024-02-19 08:14:36.573660',NULL),(144,'AEYKiDH4dYHgOZ7W7XEXTisDGkr8Eg',144,1,14,'2024-02-19 08:58:07.880734','2024-02-19 08:58:07.880734',NULL),(145,'K3vII5IJupES88GjpHowrXoGxOLaE5',145,1,14,'2024-02-19 09:18:56.803891','2024-02-19 09:18:56.803891',NULL),(146,'X8tCsWkmlD7s2qFymIEAQQBIk8FH3h',146,1,14,'2024-02-19 09:22:36.838967','2024-02-19 09:22:36.838967',NULL),(147,'Wv7sBw5ZfFhIhVtkxhhId6r5lnArZR',147,1,10,'2024-02-19 09:40:35.101503','2024-02-19 09:40:35.101503',NULL),(148,'cmK8nuL4ZkdZ34RMn8d9seS6vrjdTi',148,1,10,'2024-02-19 09:42:34.159595','2024-02-19 09:42:34.159595',NULL),(149,'3BKzTSEszpG7SZjlot0fj9tr8S1AN5',149,1,10,'2024-02-20 01:19:47.668929','2024-02-20 01:19:47.668929',NULL),(150,'zgGnjJfmBktvqOUUkn4jujnKfJVtiD',150,1,14,'2024-02-20 01:23:02.069163','2024-02-20 01:23:02.069163',NULL),(151,'nbavfAhX7Ph1cWvqQykUZBmqyl0sNt',151,1,14,'2024-02-20 04:09:23.083496','2024-02-20 04:09:23.083496',NULL),(152,'MBselVO82riujgKJQx2fSAQhGZerHD',152,1,10,'2024-02-21 04:27:57.105036','2024-02-21 04:27:57.105036',NULL),(153,'3WcECLpSyv7QB4liL1R9AxlC2SRV3D',153,1,14,'2024-02-21 07:38:25.214671','2024-02-21 07:38:25.214671',NULL),(154,'ixQhhk9iKQ3OPV5ItRSg0gF9BIGU4a',154,1,14,'2024-02-21 07:49:45.723869','2024-02-21 07:49:45.723869',NULL),(155,'IV2PMqaupBR4x0NTYVCoyKhwNN6dM3',155,1,14,'2024-02-21 07:50:22.339854','2024-02-21 07:50:22.339854',NULL),(156,'Ej2BIsfP5nkSf52n6YCBRZbfiqVuNh',156,1,14,'2024-02-21 07:58:19.501281','2024-02-21 07:58:19.501281',NULL),(157,'leZMtIFi57N73pRAWB7iUNG8qWEmEe',157,1,14,'2024-02-21 08:53:27.231691','2024-02-21 08:53:27.231691',NULL),(158,'9b1JdjecAOOCooctjRiDZeCrvcZHsg',158,1,14,'2024-02-21 09:13:05.709443','2024-02-21 09:13:05.709443',NULL),(159,'9Kx7gaLTvtSL4EsQWpCGbGSXuF4VeK',159,1,14,'2024-02-21 09:28:10.486599','2024-02-21 09:28:10.486599',NULL),(160,'2qLJxorlC6wRW13wCOlmrjQOpnmlcy',160,1,10,'2024-02-23 02:35:43.552084','2024-02-23 02:35:43.552084',NULL),(161,'qgq3tsAuDIZr3EhM8peGU3zs8dY9Ys',161,1,10,'2024-02-23 03:41:15.833911','2024-02-23 03:41:15.833911',NULL),(162,'PWO3FoNozaJiDnBdGPhiPsh7JbOKmr',162,1,10,'2024-02-23 03:59:14.617585','2024-02-23 03:59:14.617585',NULL),(163,'steFWrnR1ab0I17QyEetgecPHNx6pN',163,1,14,'2024-02-26 07:07:16.631195','2024-02-26 07:07:16.631195',NULL),(164,'VHvs71t2mF52x9RzCiE69e6e70tJbR',164,1,10,'2024-02-26 07:13:37.134207','2024-02-26 07:13:37.134207',NULL),(165,'HOouosP4tA8Q4LQiBALm7OwUBSEIAW',165,1,14,'2024-02-26 07:16:39.565790','2024-02-26 07:16:39.565790',NULL),(166,'xmnmKIxlRkV522xU325yZGmvdscAJ4',166,1,10,'2024-02-26 07:17:11.456743','2024-02-26 07:17:11.456743',NULL),(167,'OtSfEocS0L8zzWk99FrfPB1hZItoEA',167,1,10,'2024-02-26 07:27:33.826810','2024-02-26 07:27:33.826810',NULL),(168,'0l9iCVvmiIj0RAfPFit1oSjlCNHKS0',168,1,10,'2024-02-26 07:34:05.484062','2024-02-26 07:34:05.484062',NULL),(169,'p7kVsUyj2mlZzAcRCn6FAxKEI8I6R5',169,1,10,'2024-02-26 07:46:43.074346','2024-02-26 07:46:43.074346',NULL),(170,'htQIKxTQOuTiemED3tzSlQ1fYPFNv4',170,1,14,'2024-02-26 08:03:02.201011','2024-02-26 08:03:02.201011',NULL),(171,'3B2a8g55SEAQh1sfZ0MOYyxhaTKqoK',171,1,10,'2024-02-26 08:04:37.543827','2024-02-26 08:04:37.543827',NULL),(172,'XdlqlrTYSJyXLPTsAW4tMD0hUhEXul',172,1,10,'2024-02-26 08:18:44.853808','2024-02-26 08:18:44.853808',NULL),(173,'1R8M8x5714vpMrFBTQaAEKNJ7kAtPY',173,1,10,'2024-02-26 08:23:04.148308','2024-02-26 08:23:04.148308',NULL),(174,'6nyKG7YRJ4SzsWcdiGcP7ixJrGQowo',174,1,10,'2024-02-26 08:44:39.404706','2024-02-26 08:44:39.404706',NULL),(175,'NSVrGXm2WRFUwec438nbV4Ta7JDdzt',175,1,10,'2024-02-26 08:47:38.994937','2024-02-26 08:47:38.994937',NULL),(176,'X0T36tLAtBdnvYszcf7BigWORCafSZ',176,1,10,'2024-02-26 08:48:03.490144','2024-02-26 08:48:03.490144',NULL),(177,'qLmuxlafTg4hEfaP2k4hXGx0YHYxbR',177,1,10,'2024-02-26 08:50:08.693251','2024-02-26 08:50:08.694257',NULL),(178,'vAlz3456vJbypsIh0P5lmFGSBoen5h',178,1,10,'2024-02-26 08:51:53.576565','2024-02-26 08:51:53.576565',NULL),(179,'JXoe8mZDPQckMlkpA5HE3HXnInwLJf',179,1,10,'2024-02-26 09:03:28.275682','2024-02-26 09:03:28.275682',NULL),(180,'OojROEPMSO2ASpMobXcenCkSvcD4Ok',180,1,10,'2024-02-26 09:12:10.695759','2024-02-26 09:12:10.695759',NULL),(181,'Jl4XbT07CCklFEsGVcXtwLNHwPmwLu',181,1,10,'2024-02-26 09:19:24.043729','2024-02-26 09:19:24.043729',NULL),(182,'594MOd4I9f4UoJs70axH9NOqyZLraw',182,1,10,'2024-02-26 09:45:53.745372','2024-02-26 09:45:53.745372',NULL);
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_ipn`
--

DROP TABLE IF EXISTS `paypal_ipn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paypal_ipn` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `business` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `charset` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notify_version` decimal(64,2) DEFAULT NULL,
  `parent_txn_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `receiver_email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `receiver_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `residence_country` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `test_ipn` tinyint(1) NOT NULL,
  `txn_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `txn_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `verify_sign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_country` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_city` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_country_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_state` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_street` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_zip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payer_business_name` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payer_email` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payer_id` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auth_amount` decimal(64,2) DEFAULT NULL,
  `auth_exp` varchar(28) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auth_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auth_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` decimal(64,16) DEFAULT NULL,
  `invoice` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_name` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_number` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mc_currency` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mc_fee` decimal(64,2) DEFAULT NULL,
  `mc_gross` decimal(64,2) DEFAULT NULL,
  `mc_handling` decimal(64,2) DEFAULT NULL,
  `mc_shipping` decimal(64,2) DEFAULT NULL,
  `memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_cart_items` int DEFAULT NULL,
  `option_name1` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_name2` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payer_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  `payment_gross` decimal(64,2) DEFAULT NULL,
  `payment_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pending_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `protection_eligibility` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int DEFAULT NULL,
  `reason_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remaining_settle` decimal(64,2) DEFAULT NULL,
  `settle_amount` decimal(64,2) DEFAULT NULL,
  `settle_currency` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping` decimal(64,2) DEFAULT NULL,
  `shipping_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax` decimal(64,2) DEFAULT NULL,
  `transaction_entity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auction_buyer_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auction_closing_date` datetime(6) DEFAULT NULL,
  `auction_multi_item` int DEFAULT NULL,
  `for_auction` decimal(64,2) DEFAULT NULL,
  `amount` decimal(64,2) DEFAULT NULL,
  `amount_per_cycle` decimal(64,2) DEFAULT NULL,
  `initial_payment_amount` decimal(64,2) DEFAULT NULL,
  `next_payment_date` datetime(6) DEFAULT NULL,
  `outstanding_balance` decimal(64,2) DEFAULT NULL,
  `payment_cycle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `period_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `recurring_payment_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rp_invoice_id` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_created` datetime(6) DEFAULT NULL,
  `amount1` decimal(64,2) DEFAULT NULL,
  `amount2` decimal(64,2) DEFAULT NULL,
  `amount3` decimal(64,2) DEFAULT NULL,
  `mc_amount1` decimal(64,2) DEFAULT NULL,
  `mc_amount2` decimal(64,2) DEFAULT NULL,
  `mc_amount3` decimal(64,2) DEFAULT NULL,
  `password` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `period1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `period2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `period3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reattempt` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `recur_times` int DEFAULT NULL,
  `recurring` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `retry_at` datetime(6) DEFAULT NULL,
  `subscr_date` datetime(6) DEFAULT NULL,
  `subscr_effective` datetime(6) DEFAULT NULL,
  `subscr_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `case_creation_date` datetime(6) DEFAULT NULL,
  `case_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `case_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `receipt_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `handling_amount` decimal(64,2) DEFAULT NULL,
  `transaction_subject` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ipaddress` char(39) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag` tinyint(1) NOT NULL,
  `flag_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `flag_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `query` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `from_view` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mp_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `option_selection1` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_selection2` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `paypal_ipn_txn_id_8fa22c44` (`txn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_ipn`
--

LOCK TABLES `paypal_ipn` WRITE;
/*!40000 ALTER TABLE `paypal_ipn` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_ipn` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-26 16:52:06
