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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-02-09 03:52:12.090950','9','Thanh1234',1,'[{\"added\": {}}]',6,1),(2,'2024-02-13 15:07:47.777690','15','Ngoc',2,'[{\"changed\": {\"fields\": [\"avatar\"]}}]',6,1);
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
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-01-17 15:04:10.000854'),(2,'contenttypes','0002_remove_content_type_name','2024-01-17 15:04:10.095337'),(3,'auth','0001_initial','2024-01-17 15:04:10.530086'),(4,'auth','0002_alter_permission_name_max_length','2024-01-17 15:04:10.654830'),(5,'auth','0003_alter_user_email_max_length','2024-01-17 15:04:10.669796'),(6,'auth','0004_alter_user_username_opts','2024-01-17 15:04:10.683314'),(7,'auth','0005_alter_user_last_login_null','2024-01-17 15:04:10.694210'),(8,'auth','0006_require_contenttypes_0002','2024-01-17 15:04:10.698429'),(9,'auth','0007_alter_validators_add_error_messages','2024-01-17 15:04:10.712939'),(10,'auth','0008_alter_user_username_max_length','2024-01-17 15:04:10.721140'),(11,'auth','0009_alter_user_last_name_max_length','2024-01-17 15:04:10.732251'),(12,'auth','0010_alter_group_name_max_length','2024-01-17 15:04:10.752091'),(13,'auth','0011_update_proxy_permissions','2024-01-17 15:04:10.759910'),(14,'auth','0012_alter_user_first_name_max_length','2024-01-17 15:04:10.768447'),(15,'htproject','0001_initial','2024-01-17 15:04:13.131785'),(16,'admin','0001_initial','2024-01-17 15:04:13.406504'),(17,'admin','0002_logentry_remove_auto_add','2024-01-17 15:04:13.432159'),(18,'admin','0003_logentry_add_action_flag_choices','2024-01-17 15:04:13.461244'),(19,'oauth2_provider','0001_initial','2024-01-17 15:04:15.068807'),(20,'oauth2_provider','0002_auto_20190406_1805','2024-01-17 15:04:15.156954'),(21,'oauth2_provider','0003_auto_20201211_1314','2024-01-17 15:04:15.298711'),(22,'oauth2_provider','0004_auto_20200902_2022','2024-01-17 15:04:16.002767'),(23,'oauth2_provider','0005_auto_20211222_2352','2024-01-17 15:04:16.150041'),(24,'oauth2_provider','0006_alter_application_client_secret','2024-01-17 15:04:16.242209'),(25,'oauth2_provider','0007_application_post_logout_redirect_uris','2024-01-17 15:04:16.386705'),(26,'sessions','0001_initial','2024-01-17 15:04:16.517167'),(27,'htproject','0002_alter_user_phone','2024-01-17 15:13:08.739364'),(28,'htproject','0003_alter_user_phone','2024-01-17 15:21:37.002121'),(29,'htproject','0004_auction_status','2024-01-17 16:35:31.704161'),(30,'htproject','0005_remove_order_total_money_bill','2024-01-18 17:16:39.348280'),(31,'ipn','0001_initial','2024-01-27 11:19:05.532328'),(32,'ipn','0002_paypalipn_mp_id','2024-01-27 11:19:05.728799'),(33,'ipn','0003_auto_20141117_1647','2024-01-27 11:19:06.239079'),(34,'ipn','0004_auto_20150612_1826','2024-01-27 11:19:10.830384'),(35,'ipn','0005_auto_20151217_0948','2024-01-27 11:19:11.017449'),(36,'ipn','0006_auto_20160108_1112','2024-01-27 11:19:11.390131'),(37,'ipn','0007_auto_20160219_1135','2024-01-27 11:19:11.403370'),(38,'ipn','0008_auto_20181128_1032','2024-01-27 11:19:11.416761'),(39,'ipn','0009_alter_paypalipn_id','2024-01-27 11:20:55.545442'),(40,'htproject','0006_alter_user_identitycard','2024-01-30 17:28:28.586138'),(41,'htproject','0007_alter_user_avatar','2024-01-30 17:40:05.730675'),(42,'htproject','0008_alter_user_isapproved','2024-01-30 17:41:48.404084'),(43,'htproject','0009_alter_user_phone','2024-02-01 18:31:18.582098'),(44,'htproject','0010_alter_order_image','2024-02-02 17:47:53.312839'),(45,'htproject','0011_alter_order_shipper','2024-02-02 18:10:08.189192'),(46,'htproject','0012_alter_rating_order_alter_rating_user_and_more','2024-02-05 15:17:58.158345'),(47,'htproject','0013_alter_auction_status_alter_order_fromstreet_and_more','2024-02-08 03:03:47.965894'),(48,'htproject','0014_alter_order_shipper','2024-02-08 05:05:35.150020'),(49,'htproject','0015_alter_order_deliverydate','2024-02-08 06:49:03.236104'),(50,'htproject','0016_alter_order_deliverydate','2024-02-08 06:49:03.258832'),(51,'htproject','0016_alter_auction_money','2024-02-13 21:57:39.589725'),(52,'htproject','0017_alter_ordervoucher_decreased_money','2024-02-13 21:58:14.594968'),(53,'htproject','0018_alter_rating_score','2024-02-18 11:47:55.012492');
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
INSERT INTO `django_session` VALUES ('4th8047f7w2ffh78xbq37anfq92xffly','.eJxVjDsOwyAQBe9CHSHAfFOm9xnQsouDkwgkY1dR7h5bcpG0b2bem0XY1hK3npc4E7syyS6_WwJ85noAekC9N46trsuc-KHwk3Y-Nsqv2-n-HRToZa-dJo9KodN2yANpZ6wPFkUwCQ2hNcIlIoGThwCT37k2yiepncQwCGSfL9EDN1c:1rQWtz:O4rVAkfPR0t2NUzcQRM9oo-ZMVF-UGHmu0zQBnmp9Qs','2024-02-01 18:14:07.429108'),('6wni6n6qf0aq4mhd2klolh7k6hjdvh34','.eJxVjDsOwyAQBe9CHSHAfFOm9xnQsouDkwgkY1dR7h5bcpG0b2bem0XY1hK3npc4E7syyS6_WwJ85noAekC9N46trsuc-KHwk3Y-Nsqv2-n-HRToZa-dJo9KodN2yANpZ6wPFkUwCQ2hNcIlIoGThwCT37k2yiepncQwCGSfL9EDN1c:1rUpa7:BrN5uSTXrhWjfXXEUoCvL1_PXcW-57Io_Zb22bIHcRE','2024-02-13 14:59:23.428649'),('h243517eoltduz7rz122nrdscf4qm48b','.eJxVjDsOwyAQBe9CHSHAfFOm9xnQsouDkwgkY1dR7h5bcpG0b2bem0XY1hK3npc4E7syyS6_WwJ85noAekC9N46trsuc-KHwk3Y-Nsqv2-n-HRToZa-dJo9KodN2yANpZ6wPFkUwCQ2hNcIlIoGThwCT37k2yiepncQwCGSfL9EDN1c:1rcnp6:ui_NokzFvIBov5Ug46kdsuldJhxQGfurqekqxoyAaoQ','2024-03-06 14:43:48.250830'),('kgbdvqd877ih5opko742qx69d8kzg604','.eJxVjDsOwyAQBe9CHSHAfFOm9xnQsouDkwgkY1dR7h5bcpG0b2bem0XY1hK3npc4E7syyS6_WwJ85noAekC9N46trsuc-KHwk3Y-Nsqv2-n-HRToZa-dJo9KodN2yANpZ6wPFkUwCQ2hNcIlIoGThwCT37k2yiepncQwCGSfL9EDN1c:1rZPyX:91VALrbG-AbiQNh7HTqsSBzSbNO4whjTWsyZgYrAuYg','2024-02-26 06:39:33.632521'),('p370n4yfyb77sdm7iu16v335cpvbtkl8','.eJxVjDsOwyAQBe9CHSHAfFOm9xnQsouDkwgkY1dR7h5bcpG0b2bem0XY1hK3npc4E7syyS6_WwJ85noAekC9N46trsuc-KHwk3Y-Nsqv2-n-HRToZa-dJo9KodN2yANpZ6wPFkUwCQ2hNcIlIoGThwCT37k2yiepncQwCGSfL9EDN1c:1rZVTK:qKVdiLdaTDSpKjUL7ejP2sMCnR7nCpg-W3-K7Lo2OM0','2024-02-26 12:31:42.692918'),('twxfn75e86160iszkuf2gyaw31j0zxmj','.eJxVjDsOwyAQBe9CHSHAfFOm9xnQsouDkwgkY1dR7h5bcpG0b2bem0XY1hK3npc4E7syyS6_WwJ85noAekC9N46trsuc-KHwk3Y-Nsqv2-n-HRToZa-dJo9KodN2yANpZ6wPFkUwCQ2hNcIlIoGThwCT37k2yiepncQwCGSfL9EDN1c:1rU7WP:BMOqk9-8vGJNGzEuZmoaey_WLVJgkFc4izbjnpMCTg4','2024-02-11 15:56:37.027131'),('xf6m792g8ochlja898drn39aq4u8jzql','.eJxVjDsOwyAQBe9CHSHAfFOm9xnQsouDkwgkY1dR7h5bcpG0b2bem0XY1hK3npc4E7syyS6_WwJ85noAekC9N46trsuc-KHwk3Y-Nsqv2-n-HRToZa-dJo9KodN2yANpZ6wPFkUwCQ2hNcIlIoGThwCT37k2yiepncQwCGSfL9EDN1c:1rZRCN:ARewc6fck1_LW9Px-VwoiHT6VW7IwoZcixB3e1vJO_4','2024-02-26 07:57:55.107036');
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
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `money` decimal(12,0) DEFAULT NULL,
  `order_id` bigint NOT NULL,
  `shipper_id` bigint NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `htproject_auction_order_id_8641bae2_fk_htproject_order_id` (`order_id`),
  KEY `htproject_auction_shipper_id_c9c024d8_fk_htproject_user_id` (`shipper_id`),
  CONSTRAINT `htproject_auction_order_id_8641bae2_fk_htproject_order_id` FOREIGN KEY (`order_id`) REFERENCES `htproject_order` (`id`),
  CONSTRAINT `htproject_auction_shipper_id_c9c024d8_fk_htproject_user_id` FOREIGN KEY (`shipper_id`) REFERENCES `htproject_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htproject_auction`
--

LOCK TABLES `htproject_auction` WRITE;
/*!40000 ALTER TABLE `htproject_auction` DISABLE KEYS */;
INSERT INTO `htproject_auction` VALUES (1,NULL,'2024-01-18',1,'Đấu giá của Táo','tôi muốn sip đơn hàng này',100000,1,3,1),(2,NULL,NULL,1,'Đấu giá B','Tôi muốn vận chuyển đơn này',110000,1,4,1),(3,NULL,NULL,1,'Đấu giá B','Tôi muốn vận chuyển đơn này',90000,2,4,1),(4,NULL,NULL,1,'Đấu giá C','tôi muốn sip đơn hàng này',100000,2,3,1),(5,'2024-02-06','2024-02-06',1,'Đấu giá của D','ABC',125000,3,4,1),(6,'2024-02-06','2024-02-06',1,'Đấu giá của D','ABC',125000,5,3,1),(7,'2024-02-06','2024-02-06',1,'Đấu giá của D','ABC',100000,6,3,1),(8,'2024-02-06','2024-02-06',1,'Đấu giá của D','ABC',75000,7,14,1),(9,'2024-02-06','2024-02-06',1,'Đấu giá của D','ABC',50000,8,19,1),(10,'2024-02-06','2024-02-06',1,'Đấu giá của D','ABC',50000,9,19,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htproject_bill`
--

LOCK TABLES `htproject_bill` WRITE;
/*!40000 ALTER TABLE `htproject_bill` DISABLE KEYS */;
INSERT INTO `htproject_bill` VALUES (1,NULL,NULL,1,123000.000,1),(2,NULL,NULL,1,125000.000,2),(3,'2024-01-27','2024-01-27',1,100000.000,2),(4,'2024-01-27','2024-01-27',1,100000.000,2),(5,'2024-01-27','2024-01-27',1,100000.000,2),(6,'2024-01-27','2024-01-27',1,100000.000,2),(7,'2024-01-27','2024-01-27',1,100000.000,2),(8,'2024-01-27','2024-01-27',1,100000.000,2),(9,'2024-01-30','2024-01-30',1,100000.000,2);
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deliveryDate` date NOT NULL,
  `fromStreet` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `toStreet` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` bigint DEFAULT NULL,
  `fromWard_id` bigint DEFAULT NULL,
  `shipper_id` bigint DEFAULT NULL,
  `toWard_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `htproject_order_fromWard_id_3faa4781_fk_htproject_ward_id` (`fromWard_id`),
  KEY `htproject_order_toWard_id_0770e0fe_fk_htproject_ward_id` (`toWard_id`),
  KEY `htproject_order_customer_id_9cdebc13_fk_htproject_user_id` (`customer_id`),
  KEY `htproject_order_shipper_id_c6d80958_fk_htproject_user_id` (`shipper_id`),
  CONSTRAINT `htproject_order_customer_id_9cdebc13_fk_htproject_user_id` FOREIGN KEY (`customer_id`) REFERENCES `htproject_user` (`id`),
  CONSTRAINT `htproject_order_fromWard_id_3faa4781_fk_htproject_ward_id` FOREIGN KEY (`fromWard_id`) REFERENCES `htproject_ward` (`id`),
  CONSTRAINT `htproject_order_shipper_id_c6d80958_fk_htproject_user_id` FOREIGN KEY (`shipper_id`) REFERENCES `htproject_user` (`id`),
  CONSTRAINT `htproject_order_toWard_id_0770e0fe_fk_htproject_ward_id` FOREIGN KEY (`toWard_id`) REFERENCES `htproject_ward` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htproject_order`
--

LOCK TABLES `htproject_order` WRITE;
/*!40000 ALTER TABLE `htproject_order` DISABLE KEYS */;
INSERT INTO `htproject_order` VALUES (1,'2024-02-08','2024-02-22',1,'Vận chuyện hàng hóa','Thức ăn, thức uống','image/upload/v1705226973/ryan9dyovzg88xhoz3ik.png','2024-01-18','Nguyễn Kiệm A','Hai Bà Trưng','Completed',2,1,4,2),(2,'2024-02-08','2024-02-08',1,'Vận chuyện dụng cụ thể thao','Dụng cụ thể thao','image/upload/v1705226973/ryan9dyovzg88xhoz3ik.png','2024-01-01','Nguyễn Văn  Linh ','Nguyễn Đình Chiểu','Completed',2,1,4,2),(3,'2024-02-08','2024-02-08',1,'Vận chuyển dụng cụ tập thể dục thể thao','Rau củ','image/upload/v1705226973/ryan9dyovzg88xhoz3ik.png','2024-02-08','Trần Hưng Đạo','Điện Biên Phủ','Completed',2,1,4,2),(4,'2024-02-08','2024-02-08',1,'Vận chuyển hàng hóa','Áo quần','image/upload/https://res.cloudinary.com/dohcsyfoi/image/upload/v1705226973/ryan9dyovzg88xhoz3ik.png','2024-02-09','Nguyễn Ảnh Thủ','Quang Trung','Completed',2,2,1,3),(5,'2024-02-08','2024-02-08',1,'Vận chuyển hàng hóa 1','Áo quần','image/upload/https://res.cloudinary.com/dohcsyfoi/image/upload/v1705226973/ryan9dyovzg88xhoz3ik.png','2024-02-07','Nguyễn Ảnh Thủ','Quang Trung','Completed',2,2,3,3),(6,'2024-02-08','2024-02-08',1,'Vận chuyển hàng hóa','Áo ','image/upload/v1705226973/ryan9dyovzg88xhoz3ik.png','2024-02-07','Nguyễn Ảnh Thủ','Quang Trung','Completed',2,2,3,3),(7,'2024-02-08','2024-02-08',1,'Vận chuyển xe','AirBlade, Lead','image/upload/v1705226973/ryan9dyovzg88xhoz3ik.png','2024-02-08','Nguyễn Ảnh Thủ','Quang Trung','Completed',2,2,14,3),(8,'2024-02-09','2024-02-09',1,'Vận chuyển nhà','Bàn, ghế','image/upload/v1705226973/ryan9dyovzg88xhoz3ik.png','2024-02-08','Tô ký','Quang Trung','Pending',2,4,19,5),(9,'2024-02-09','2024-02-09',1,'Vận chuyển đơn hàng mới','Bàn, ghế',NULL,'2024-02-09','Quang Trung','To ky','Pending',5,2,19,5),(10,'2024-02-12','2024-02-12',1,'Vận chuyển dụng cụ nhà máy','Bàn, ghế','image/upload/v1707675357/ewpdml0vpzo3afuyfiaj.png','2024-01-01','Phan Huy Ích','Nguyễn Văn Qúa','New',2,2,NULL,3),(11,'2024-02-12','2024-02-12',1,'Vận chuyển dụng cụ nhà máy','Áo quần','image/upload/v1707675418/uamb3fmzpjlofqgysvv2.png','2024-01-01','Phan Huy Ích','Nguyễn Văn Qúa','New',2,2,NULL,3),(12,'2024-02-13','2024-02-13',1,'Vận chuyển dụng cụ nhà máy','Áo quần','image/upload/v1707777965/wuyouclhegkb15s5yjsw.png','2024-01-01','Phan Huy Ích','Nguyễn Văn Qúa','New',2,2,NULL,3),(13,'2024-02-17','2024-02-17',1,'Vận chuyển dụng cụ nhà máy','Áo quần','image/upload/v1708133510/lvbgiay4eyjf49pdye3l.png','2024-01-01','Phan Huy Ích','Nguyễn Văn Qúa','New',2,2,NULL,3),(14,'2024-02-17','2024-02-17',1,'Vận chuyển dụng cụ nhà máy','Áo quần','image/upload/v1708133990/q7vpndvv6hitvn6vae00.png','2024-01-01','Phan Huy Ích','Nguyễn Văn Qúa','New',6,2,NULL,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htproject_ordervoucher`
--

LOCK TABLES `htproject_ordervoucher` WRITE;
/*!40000 ALTER TABLE `htproject_ordervoucher` DISABLE KEYS */;
INSERT INTO `htproject_ordervoucher` VALUES (1,'2024-02-08','2024-02-08',1,18000,'2024-02-08',2,1),(2,'2024-02-22','2024-02-22',1,12000,'2024-02-22',1,1);
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
  `score` int NOT NULL,
  `order_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `htproject_rating_order_id_23d6d779_fk_htproject_order_id` (`order_id`),
  KEY `htproject_rating_user_id_ccbfb725_fk_htproject_user_id` (`user_id`),
  CONSTRAINT `htproject_rating_order_id_23d6d779_fk_htproject_order_id` FOREIGN KEY (`order_id`) REFERENCES `htproject_order` (`id`),
  CONSTRAINT `htproject_rating_user_id_ccbfb725_fk_htproject_user_id` FOREIGN KEY (`user_id`) REFERENCES `htproject_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htproject_rating`
--

LOCK TABLES `htproject_rating` WRITE;
/*!40000 ALTER TABLE `htproject_rating` DISABLE KEYS */;
INSERT INTO `htproject_rating` VALUES (1,'2024-02-02','2024-01-18',1,'Vận chuyển rất nhanh',5,1,2),(2,'2024-02-26','2024-02-26',1,'Vận chuyển hơi chậm so với dự kiến',4,2,5),(3,'2024-02-06','2024-02-06',1,'Rất nhanh',5,2,2),(4,'2024-02-02','2024-01-18',1,'Vận chuyển rất nhanh',5,2,2),(5,'2024-02-25','2024-02-26',1,'Vận chuyển hơi chậm so với dự kiến',4,2,5),(6,'2024-02-06','2024-02-06',1,'Rất nhanh',5,2,2);
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
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identityCard` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isApproved` tinyint(1) DEFAULT NULL,
  `role` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htproject_user`
--

LOCK TABLES `htproject_user` WRITE;
/*!40000 ALTER TABLE `htproject_user` DISABLE KEYS */;
INSERT INTO `htproject_user` VALUES (1,'pbkdf2_sha256$600000$ytZXXSQOkPvzwAqI57Ia0g$+x3TYG17ChJFSupgwkZN+Cq3to5gt9wsKDWrgtYEWBs=','2024-02-21 14:43:48.236809',1,'Admin','','','admin@gmail.com',1,1,'2024-01-17 15:17:48.711695','image/upload/v1705226973/ryan9dyovzg88xhoz3ik.png','',1,'','0'),(2,'pbkdf2_sha256$600000$ytZXXSQOkPvzwAqI57Ia0g$+x3TYG17ChJFSupgwkZN+Cq3to5gt9wsKDWrgtYEWBs=',NULL,0,'Thanh','Thanh','Nguyen','2051052120thanh@ou.edu.vn',1,1,'2024-01-17 15:17:48.711695','image/upload/v1705226973/ryan9dyovzg88xhoz3ik.png','0987654321',1,'CUSTOMER','988765421'),(3,'pbkdf2_sha256$600000$ytZXXSQOkPvzwAqI57Ia0g$+x3TYG17ChJFSupgwkZN+Cq3to5gt9wsKDWrgtYEWBs=',NULL,0,'Tao Nguyen','Tao','Nguyen','2051052120thanh@ou.edu.vn',1,1,'2024-01-17 15:17:48.711695','image/upload/v1705226973/ryan9dyovzg88xhoz3ik.png','0987654321',1,'SHIPPER','988765321'),(4,'pbkdf2_sha256$600000$ytZXXSQOkPvzwAqI57Ia0g$+x3TYG17ChJFSupgwkZN+Cq3to5gt9wsKDWrgtYEWBs=',NULL,0,'Thanh Tran','Thanh','Tran','ntthanh505@gmail.com',1,1,'2024-01-17 15:17:48.711695','image/upload/v1705226973/ryan9dyovzg88xhoz3ik.png','0987654321',1,'SHIPPER','934235321'),(5,'pbkdf2_sha256$600000$ytZXXSQOkPvzwAqI57Ia0g$+x3TYG17ChJFSupgwkZN+Cq3to5gt9wsKDWrgtYEWBs=',NULL,0,'Ngoc Anh','Ngoc Anh','Nguyen','2051052120thanh@ou.edu.vn',1,1,'2024-01-17 15:17:48.711695','image/upload/v1705226973/ryan9dyovzg88xhoz3ik.png','0987654321',1,'CUSTOMER','988765421'),(6,'pbkdf2_sha256$600000$LXKjkulEXRBZd0h7S1FPkh$NZxyTZhoYAeK8PehTLtO6gIsukZwoMQiCZpbv/Xas/g=',NULL,0,'ThanhNguyen','Nguyễn','Thanh','admin@ou.edu.vn',0,1,'2024-02-06 15:58:51.701081','image/upload/https://res.cloudinary.com/dohcsyfoi/image/upload/v1705226973/ryan9dyovzg88xhoz3ik.png','0938483355',1,'CUSTOMER','0335012432'),(7,'pbkdf2_sha256$600000$BomysaM6AXgLMIkHDEETXr$NHh1bXLNb8wbIHnxS6VOQbKT0U2TJRYw6IPWOrhyiJ4=',NULL,0,'ThanhDang','Dang','Thanh','a@ou.edu.vn',0,1,'2024-02-06 16:05:46.896546','image/upload/https://res.cloudinary.com/dohcsyfoi/image/upload/v1705226973/ryan9dyovzg88xhoz3ik.png','0938483355',1,'CUSTOMER','0335012432'),(8,'pbkdf2_sha256$600000$6ecVOTLhLt8EQs5JUQhzFq$w6PsSuPH3ikHAlNOdSnow5AnCDMVfcbCSLahWToDkjM=',NULL,0,'ThanhDang@','Dang','Thanh','a@ou.edu.vn',0,1,'2024-02-06 16:07:59.742962','image/upload/v1705226973/ryan9dyovzg88xhoz3ik.png','0938483355',1,'CUSTOMER','0335012432'),(9,'A@1234',NULL,0,'Thanh1234','Nguyễn','Thanh','admin@ou.edu.vn',0,1,'2024-02-09 03:50:58.000000',NULL,'012312434343',1,'CUSTOMER','0335012432'),(10,'pbkdf2_sha256$600000$45ZTWXgvUZFG90SL2kTX0e$oi62R0X2HwH0Zj0y9yL8Maswp9JQKTXV8gdJZJw0aok=',NULL,0,'Thanh123','Nguyen','Thanh','A@gmail.com',0,1,'2024-02-09 06:16:48.335450',NULL,'null',1,'CUSTOMER','0354678921'),(11,'pbkdf2_sha256$600000$rzoZVbawgR7w4ZTJe3ctVT$3dljccWqVxYrSUWGWx7ZqW7LYXTau6FK0vDsAOB9Yew=',NULL,0,'ThanhC','Thanh An','Pham Tran','a@gmail.com',0,1,'2024-02-11 17:43:48.913015','image/upload/v1707673431/optgpyqkozo1d0kcikyw.png','093243532',1,'CUSTOMER','0987654432'),(12,'pbkdf2_sha256$600000$rsVKZyk4PMgbbKEWOA1O4V$RxyK3YwTd7QPYPCyKU5j6iRcW7G4botZuaEco/hc69A=',NULL,0,'ThanhC1','Thanh An','Pham Tran','a@gmail.com',0,1,'2024-02-12 19:41:21.457265','image/upload/v1707766885/wrd3bxgdbmggeyzpv1as.png','093243532',1,'CUSTOMER','0987654432'),(13,'pbkdf2_sha256$600000$zlHwXMRM6ArCWs4tDo9iPT$MiygI9FeXePuN8/R8b4ZH1F0/SzKsSyod3TMe6gkNVs=',NULL,0,'ThanhC2','Thanh An','Pham Tran','a@gmail.com',0,1,'2024-02-12 21:23:49.087871','image/upload/v1707773033/ihkgrhtjv2hrvuyzhfyw.png','093243532',1,'CUSTOMER','0987654432'),(14,'pbkdf2_sha256$600000$basPy3VSsCMr8fW6Fz6zoJ$k0eLhng5/2SrusT3celt/csCdTVNai/U1bVDkR5O188=',NULL,0,'ThanhC3','Thanh An','Pham Tran','a@gmail.com',0,1,'2024-02-12 21:24:29.707586','image/upload/v1707773071/dnll6fvzt2ohipljsrg8.png','093243532',1,'SHIPPER','0987654432'),(15,'pbkdf2_sha256$600000$v29UTDl0AbaLcaVreZsV7Z$jGdC/D53fzg7AxIlrHqXEH/Wn8FWMc2dgpLl+WueYdM=',NULL,0,'Ngoc','Thanh Ngoc','Pham Nguyen','a@gmail.com',0,0,'2024-02-12 21:59:35.434601','image/upload/v1707836867/p06g944pgqfptw3fhfus.png','093243532',0,'SHIPPER','0987654432'),(16,'pbkdf2_sha256$600000$E3yRktcAodR4esuT8F97jR$qD4vB5XNyFd/cFZSf/xG/uthlcmP3Fswd0VaJlqJfPE=',NULL,0,'Hai','Thanh Ngoc','Pham Nguyen','a@gmail.com',0,1,'2024-02-14 11:51:25.670825','image/upload/v1707911488/xrkwbwhzvyi6rlmsgi1c.png','093243532',0,'SHIPPER','0987654432'),(17,'pbkdf2_sha256$600000$JIrW13PVQ23E4NrvV7jwwO$t2Ltl557ZogfKit/HtIubvOUvoBa24RVbNrYc8axX6Q=',NULL,0,'Hai1','Thanh Ngoc','Pham Nguyen','a@gmail.com',0,1,'2024-02-14 11:58:00.594509','image/upload/v1707911883/raslyh7equtehyhg38rq.png','093243532',1,'SHIPPER','0987654432'),(18,'pbkdf2_sha256$600000$E09plHLnxO7eFCokIdnQpQ$zrVwvRNo8ZFvSW8BxuRzF3CGfUZRaCvMysinFWTLlG4=',NULL,0,'HaiDoan','Doan','Hai','A@gmail.com',0,1,'2024-02-14 12:06:51.838875',NULL,'null',1,'CUSTOMER','0335013375'),(19,'pbkdf2_sha256$600000$Hs2lnBzXWxV3ymfPXgOW84$6IvglIU6Xyu7ZxcZi+LhfpB2245RhXrvU9ECSbuEWo0=',NULL,0,'NgocHai','Doan','Hai','A@gmail.com',0,1,'2024-02-14 12:09:37.328198','image/upload/v1707911488/xrkwbwhzvyi6rlmsgi1c.png','0312546789',1,'SHIPPER','0335013375'),(20,'pbkdf2_sha256$600000$2oWSIhgzOdZxbrJBNNFtiB$2Agb3LG/psjeH8nmIwExW2OsNDCcCjtzOLsgLePl7Wc=',NULL,0,'Test','Nguyen','Test','A@gmail.com',0,1,'2024-02-17 02:23:33.782203',NULL,'null',1,'CUSTOMER','0335012345');
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
  `discount` decimal(10,2) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htproject_voucher`
--

LOCK TABLES `htproject_voucher` WRITE;
/*!40000 ALTER TABLE `htproject_voucher` DISABLE KEYS */;
INSERT INTO `htproject_voucher` VALUES (1,'2024-02-07','2024-02-07',1,'Gỉam 20%',0.20,'2024-02-08','2024-03-10'),(2,'2024-02-08','2024-02-08',1,'Gỉam 50%',0.50,'2024-02-08','2024-03-10'),(3,'2024-02-07','2024-02-07',1,'Gỉam 10%',0.10,'2024-02-08','2024-05-05');
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
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_accesstoken` VALUES (1,'epdO6uUM4OhITBgHKazjUsV6wa7mZW','2024-01-18 04:17:48.071968','read write',1,1,'2024-01-17 18:17:48.074000','2024-01-17 18:17:48.074000',NULL,NULL),(2,'5LGyyw995zao60Hkvyw9OcqN9z18qC','2024-01-18 04:38:15.925475','read write',1,3,'2024-01-17 18:38:15.934955','2024-01-17 18:38:15.934955',NULL,NULL),(3,'qFeuVr5cpsUmEgEldeJSIgxGtKXiwy','2024-01-18 04:46:03.141188','read write',1,2,'2024-01-17 18:46:03.142220','2024-01-17 18:46:03.142220',NULL,NULL),(4,'2liOeWyvPDQxtqk6CJ0WLM7vSEqf1Z','2024-01-18 04:48:35.497824','read write',1,3,'2024-01-17 18:48:35.499190','2024-01-17 18:48:35.499190',NULL,NULL),(5,'oJrSzuvZZT5vIW49fub0krOwquCoNy','2024-01-18 04:51:13.347150','read write',1,3,'2024-01-17 18:51:13.348148','2024-01-17 18:51:13.348148',NULL,NULL),(6,'uvNjLijIdSg0vi2fgf6yNs1SoJAMeV','2024-01-18 04:51:28.570721','read write',1,3,'2024-01-17 18:51:28.570721','2024-01-17 18:51:28.570721',NULL,NULL),(7,'B5PZwFMKuM9E2EuDKQXZxaZ5YnEr8D','2024-01-18 05:14:38.107942','read write',1,2,'2024-01-17 19:14:38.107942','2024-01-17 19:14:38.107942',NULL,NULL),(8,'cWr5a4sKR72WF3DvUDr18QZzZRtqdT','2024-01-18 16:25:41.957026','read write',1,2,'2024-01-18 06:25:41.959989','2024-01-18 06:25:41.959989',NULL,NULL),(9,'N5ArlIwT2wpdgVBBhgOW0uRNZZE26e','2024-01-30 00:30:31.964652','read write',1,2,'2024-01-29 14:30:31.968813','2024-01-29 14:30:31.968813',NULL,NULL),(10,'b7BgZ8cQxs0J95M18Cunxd47MtQuYV','2024-01-30 00:36:45.739724','read write',1,2,'2024-01-29 14:36:45.739724','2024-01-29 14:36:45.739724',NULL,NULL),(11,'JZlFFOh0W9ZLhum0Go23sf2ZTSJUHe','2024-01-31 02:26:23.005475','read write',1,2,'2024-01-30 16:26:23.008460','2024-01-30 16:26:23.008460',NULL,NULL),(12,'64NI7ZF2QWeZ8OdaW28v56oRVhM63E','2024-01-31 02:27:15.700965','read write',1,2,'2024-01-30 16:27:15.704081','2024-01-30 16:27:15.705254',NULL,NULL),(13,'zpobgSczG4THg02ntwCjpUhpqONA3f','2024-01-31 02:58:54.447664','read write',1,2,'2024-01-30 16:58:54.476555','2024-01-30 16:58:54.476555',NULL,NULL),(14,'fRbUASmR92hsLyIeD1LPkdHkxWaLRQ','2024-01-31 03:01:38.377164','read write',1,2,'2024-01-30 17:01:38.430619','2024-01-30 17:01:38.430619',NULL,NULL),(15,'nLYD0Gn2QIFwg7e8VZGnuDbyhFXglM','2024-01-31 03:18:58.567388','read write',1,2,'2024-01-30 17:18:58.586369','2024-01-30 17:18:58.587373',NULL,NULL),(16,'fC3nuhdr7HhqgCcoqSfgjMf1SXkZfo','2024-01-31 03:21:23.296039','read write',1,2,'2024-01-30 17:21:23.311614','2024-01-30 17:21:23.311614',NULL,NULL),(17,'awKuCsYU36MfejNdSQzHLj8RW96mWO','2024-01-31 03:23:55.153585','read write',1,2,'2024-01-30 17:23:55.164817','2024-01-30 17:23:55.164817',NULL,NULL),(18,'De3H2rX4nV2NrvDz8JKMso3Cwlvk9H','2024-01-31 03:57:02.694505','read write',1,2,'2024-01-30 17:57:02.714764','2024-01-30 17:57:02.714764',NULL,NULL),(19,'1DhvJZ0jg6PtXODutkJTaRBMgqL0kr','2024-02-02 01:41:27.720265','read write',1,2,'2024-02-01 15:41:27.721267','2024-02-01 15:41:27.721267',NULL,NULL),(20,'jZcB5gBqB3RhUaQU1nkLaP1InjKfy8','2024-02-02 04:24:07.347200','read write',1,2,'2024-02-01 18:24:07.402663','2024-02-01 18:24:07.402663',NULL,NULL),(21,'EBb5yXwcjJ2fQFV3aK29LfFEzCLusk','2024-02-02 05:08:57.266337','read write',1,2,'2024-02-01 19:08:57.291910','2024-02-01 19:08:57.291910',NULL,NULL),(22,'dLrFTivP7Ny4cd5CwspRZ4IIVR8SxT','2024-02-02 05:09:59.750377','read write',1,2,'2024-02-01 19:09:59.763775','2024-02-01 19:09:59.763775',NULL,NULL),(23,'UZ2rA9DUHHk61vCWaqYHuQKod57FAq','2024-02-06 03:20:28.090352','read write',1,2,'2024-02-05 17:20:28.124455','2024-02-05 17:20:28.124455',NULL,NULL),(24,'Mbjtn4Y7poKQtDiKEY19hdNRz5IaDD','2024-02-06 03:28:37.920175','read write',1,4,'2024-02-05 17:28:37.950297','2024-02-05 17:28:37.951322',NULL,NULL),(25,'6R9k2oRWu47XQDq2DuAHrYXVGpaFIn','2024-02-06 04:16:34.753298','read write',1,4,'2024-02-05 18:16:34.753298','2024-02-05 18:16:34.753298',NULL,NULL),(26,'pjKwrChkTPeuE1nYkqzuyTK4UM5Gol','2024-02-06 04:32:12.968775','read write',1,2,'2024-02-05 18:32:12.968775','2024-02-05 18:32:12.968775',NULL,NULL),(27,'RwPbIzJKeLLCOz1Fytp7bJdo51oos0','2024-02-07 01:28:04.249811','read write',1,2,'2024-02-06 15:28:04.250813','2024-02-06 15:28:04.250813',NULL,NULL),(28,'FBs5rzx4oPaoo22P7MQgOTW85lxjQg','2024-02-08 15:19:24.752234','read write',1,2,'2024-02-08 05:19:24.752234','2024-02-08 05:19:24.752234',NULL,NULL),(29,'0Lf9hqJvzLfiWg21sYybfpaI50FiRT','2024-02-08 20:47:22.333249','read write',1,2,'2024-02-08 10:47:22.334256','2024-02-08 10:47:22.334256',NULL,NULL),(30,'QMrt8nE0zT0e4SVXHPzIhlywLQABxa','2024-02-08 21:03:15.291142','read write',1,2,'2024-02-08 11:03:15.311996','2024-02-08 11:03:15.311996',NULL,NULL),(31,'SctkhkzSAdcJquCJepmP0xDUbcSmDQ','2024-02-08 21:12:38.498876','read write',1,2,'2024-02-08 11:12:38.498876','2024-02-08 11:12:38.499882',NULL,NULL),(32,'FThkd7l2pkV3clWRxBcOh1wfnFapjY','2024-02-09 03:47:51.407656','read write',1,2,'2024-02-08 17:47:51.408778','2024-02-08 17:47:51.408778',NULL,NULL),(33,'62lsy5h1NesuiDzfdNyHC1KbHpix5z','2024-02-09 13:39:39.233712','read write',1,2,'2024-02-09 03:39:39.234320','2024-02-09 03:39:39.234320',NULL,NULL),(34,'y1omhxvtdqGWvvQvhrxSUwndz8tIVp','2024-02-09 16:21:12.664609','read write',1,2,'2024-02-09 06:21:12.668358','2024-02-09 06:21:12.668358',NULL,NULL),(35,'lY8yia6cslOK0A19lpRwPvSbkj0kfj','2024-02-12 00:49:57.913378','read write',1,2,'2024-02-11 14:49:57.955649','2024-02-11 14:49:57.955649',NULL,NULL),(36,'6LKqwpv5BR6F6JhPjUP2R5RnuKtz7k','2024-02-12 04:14:44.292854','read write',1,2,'2024-02-11 18:14:44.306480','2024-02-11 18:14:44.306480',NULL,NULL),(37,'LQhZunlX4XYtGOKuhWCsXP07JkNCwh','2024-02-13 05:54:25.711394','read write',1,2,'2024-02-12 19:54:25.712394','2024-02-12 19:54:25.712394',NULL,NULL),(38,'9ad8JPiNF1jFlG325yKjMGlrw2tJED','2024-02-13 08:44:50.188605','read write',1,3,'2024-02-12 22:44:50.189144','2024-02-12 22:44:50.189144',NULL,NULL),(39,'uQN61nekOrbdSOcuDqKWrREAhMqNAE','2024-02-13 08:45:52.198901','read write',1,2,'2024-02-12 22:45:52.198901','2024-02-12 22:45:52.198901',NULL,NULL),(40,'FTSIzg88kN1voASorSu4nUQuPlg7s6','2024-02-14 22:18:30.948624','read write',1,2,'2024-02-14 12:18:30.951618','2024-02-14 12:18:30.951618',NULL,NULL),(41,'j53YZ56WhZ70nrZMZWTp9HEJNrtRtq','2024-02-14 22:18:43.522034','read write',1,2,'2024-02-14 12:18:43.522034','2024-02-14 12:18:43.522034',NULL,NULL),(42,'wvrgjzpi6E4vPjc13XfPLariJr99QK','2024-02-14 22:19:01.995082','read write',1,2,'2024-02-14 12:19:01.995082','2024-02-14 12:19:01.995082',NULL,NULL),(43,'BdCGiecmfxPpmQV18BtDgxUeeQOkW9','2024-02-14 22:20:10.892989','read write',1,2,'2024-02-14 12:20:10.894032','2024-02-14 12:20:10.894032',NULL,NULL),(44,'4IXAOnvBNHtZarykGNJUBxjFh1Y1Jr','2024-02-14 22:21:19.981811','read write',1,2,'2024-02-14 12:21:19.982950','2024-02-14 12:21:19.982950',NULL,NULL),(45,'087WTYIBjuvTkPxVTn750HUJ9ilj8c','2024-02-14 22:22:10.385587','read write',1,2,'2024-02-14 12:22:10.385587','2024-02-14 12:22:10.385587',NULL,NULL),(46,'7xantU9ojUbNUY1MIHpLP6EDiL4a7R','2024-02-14 22:24:19.515352','read write',1,2,'2024-02-14 12:24:19.516351','2024-02-14 12:24:19.516351',NULL,NULL),(47,'ZZdweaxubnohQTWqdD2y2p52NJhziy','2024-02-14 22:24:44.530804','read write',1,2,'2024-02-14 12:24:44.530804','2024-02-14 12:24:44.530804',NULL,NULL),(48,'Pq59yNueCccxEu3cbai1gbKKqVJl76','2024-02-14 22:24:59.442357','read write',1,2,'2024-02-14 12:24:59.443354','2024-02-14 12:24:59.443354',NULL,NULL),(49,'hZt7ak9YhyjCD2uJgxQaCibeCdcio2','2024-02-14 22:35:16.784381','read write',1,2,'2024-02-14 12:35:16.784381','2024-02-14 12:35:16.784381',NULL,NULL),(50,'nLHzy1FboeoSdf6UsH73MRIDUrXmb3','2024-02-14 22:41:23.717408','read write',1,2,'2024-02-14 12:41:23.718416','2024-02-14 12:41:23.718416',NULL,NULL),(51,'WakFdpMi7U2LuumhgkIZtawvOksd24','2024-02-14 22:41:47.100088','read write',1,2,'2024-02-14 12:41:47.100088','2024-02-14 12:41:47.100088',NULL,NULL),(52,'xBDR0st7wesVj5ZPlTy5GwvnFr3qXw','2024-02-14 22:55:25.913943','read write',1,2,'2024-02-14 12:55:25.917925','2024-02-14 12:55:25.917925',NULL,NULL),(53,'7Qb95GXPUnLFIiV0rptcUITzFQruJ4','2024-02-14 22:56:25.161101','read write',1,2,'2024-02-14 12:56:25.161101','2024-02-14 12:56:25.161101',NULL,NULL),(54,'iQz1l4o7JomL842Xb15mKaR5YSrQef','2024-02-14 22:57:55.576283','read write',1,2,'2024-02-14 12:57:55.576283','2024-02-14 12:57:55.576283',NULL,NULL),(55,'KxeflZNocS4jghXkvn7JUTE3eweF8H','2024-02-14 22:59:54.404152','read write',1,2,'2024-02-14 12:59:54.404152','2024-02-14 12:59:54.405182',NULL,NULL),(56,'WI6RIaQTS4T4vhexV2nUapDG4fnaxm','2024-02-14 23:04:19.009819','read write',1,2,'2024-02-14 13:04:19.010854','2024-02-14 13:04:19.010854',NULL,NULL),(57,'YVcww4nP3xYPM1FN6bbeibW4o7mYHE','2024-02-14 23:09:10.321193','read write',1,3,'2024-02-14 13:09:10.322190','2024-02-14 13:09:10.322190',NULL,NULL),(58,'klRhh1LV7g8hhro6wShl4LRBdPBZyf','2024-02-14 23:11:16.522884','read write',1,3,'2024-02-14 13:11:16.522884','2024-02-14 13:11:16.523879',NULL,NULL),(59,'Z7eQbz1ZZcTGQOMhWFTECAHoItPItI','2024-02-17 11:31:26.390325','read write',1,2,'2024-02-17 01:31:26.391333','2024-02-17 01:31:26.391333',NULL,NULL),(60,'mYCkxxqwk9tXZ1KcmAPBb2IWqhSBqq','2024-02-17 12:23:46.068054','read write',1,20,'2024-02-17 02:23:46.070734','2024-02-17 02:23:46.070734',NULL,NULL),(61,'dzzAF5xct9WqA1vAI8H5gYtcFLwy62','2024-02-23 00:45:21.007772','read write',1,2,'2024-02-22 14:45:21.012788','2024-02-22 14:45:21.012788',NULL,NULL),(62,'QtqIBwyol7caNkx5j0cD2OTqAAGuR3','2024-02-23 00:45:37.984511','read write',1,2,'2024-02-22 14:45:37.989214','2024-02-22 14:45:37.989214',NULL,NULL),(63,'bBelnbdhTZ6MWM2M6Z85xdqxZeTYTI','2024-02-23 00:56:55.852939','read write',1,2,'2024-02-22 14:56:55.857548','2024-02-22 14:56:55.858100',NULL,NULL),(64,'zpq4iiUKG3LCnySyd10dSianIFJn4H','2024-02-25 23:17:14.582765','read write',1,2,'2024-02-25 13:17:14.598411','2024-02-25 13:17:14.598411',NULL,NULL),(65,'NPQD97vf0OXcnwkMiMOuL8YxugWZ3c','2024-02-25 23:18:51.101299','read write',1,2,'2024-02-25 13:18:51.109369','2024-02-25 13:18:51.109369',NULL,NULL),(66,'ZMCxQItWb57D1mEiON7zLJ5GR8dHFq','2024-02-26 00:16:57.882062','read write',1,2,'2024-02-25 14:16:57.899416','2024-02-25 14:16:57.899416',NULL,NULL),(67,'7JJcSfOZaSivWpdI4wqRmpbX7yCxHv','2024-02-26 00:17:59.317530','read write',1,2,'2024-02-25 14:17:59.318542','2024-02-25 14:17:59.318542',NULL,NULL),(68,'q5knTgwkrY8CcaJCUY3HzkgBA8B19C','2024-02-26 00:19:46.841727','read write',1,2,'2024-02-25 14:19:46.879409','2024-02-25 14:19:46.880385',NULL,NULL),(69,'6Mg3gyX3wbXdjBd1XoYMIxQ1pyYl77','2024-02-26 00:21:59.937679','read write',1,2,'2024-02-25 14:21:59.968099','2024-02-25 14:21:59.968099',NULL,NULL),(70,'5ngzWGHInYZuZKxXKP0fCwSK4WFi1E','2024-02-26 00:27:49.732957','read write',1,2,'2024-02-25 14:27:49.783303','2024-02-25 14:27:49.783303',NULL,NULL),(71,'JUTXDZ0rFDg6v8qPijNIpO5lryDzFk','2024-02-26 00:35:41.362030','read write',1,2,'2024-02-25 14:35:41.609818','2024-02-25 14:35:41.609818',NULL,NULL),(72,'QI7KXZ5lTc8ImHE644eSttURywTBgu','2024-02-26 00:38:10.672562','read write',1,2,'2024-02-25 14:38:10.714485','2024-02-25 14:38:10.714485',NULL,NULL),(73,'pekusAP3Jdi5L7n6JCtlicEcYzTfRR','2024-02-26 00:40:12.062665','read write',1,2,'2024-02-25 14:40:12.073300','2024-02-25 14:40:12.073300',NULL,NULL),(74,'8LbjtzvbmhMM2I9rte2AKk1V4w45bu','2024-02-26 00:43:34.549957','read write',1,2,'2024-02-25 14:43:34.556042','2024-02-25 14:43:34.556042',NULL,NULL),(75,'aZCeH3IHWTqkYX39rUOX4FMrUdfhlN','2024-02-26 00:45:02.433447','read write',1,2,'2024-02-25 14:45:02.442096','2024-02-25 14:45:02.442096',NULL,NULL),(76,'tKEgPJgr0aDccAVzyZUcAJim2aSxeP','2024-02-26 01:05:18.443867','read write',1,2,'2024-02-25 15:05:18.631111','2024-02-25 15:05:18.631111',NULL,NULL),(77,'wcqX86TOZxp197iRjAoHL8nQNvhyOP','2024-02-26 01:07:01.555968','read write',1,2,'2024-02-25 15:07:01.567893','2024-02-25 15:07:01.567893',NULL,NULL),(78,'Mtbv13eG8mFoJs5RnqTiAgqlglDNOj','2024-02-26 01:07:50.699692','read write',1,2,'2024-02-25 15:07:50.712903','2024-02-25 15:07:50.712903',NULL,NULL),(79,'LBPW9guKjg5dJSkJmvzquoqqETwmxi','2024-02-26 01:10:45.131846','read write',1,2,'2024-02-25 15:10:45.251886','2024-02-25 15:10:45.252898',NULL,NULL),(80,'3O1WZRvwWPCT8BZ3Ytm6hDFymoIpLH','2024-02-26 01:15:53.539655','read write',1,2,'2024-02-25 15:15:53.559377','2024-02-25 15:15:53.559377',NULL,NULL),(81,'RKi1g6uMUVWPLINZO6v1DsOnvsXPy5','2024-02-26 01:53:39.113075','read write',1,2,'2024-02-25 15:53:39.152718','2024-02-25 15:53:39.152718',NULL,NULL),(82,'xo3dRQo5Z8GVdx3hVa6ObmbKMwadNa','2024-02-26 23:59:34.255226','read write',1,2,'2024-02-26 13:59:34.268470','2024-02-26 13:59:34.268470',NULL,NULL),(83,'3RtDmDzvluJ2VkBmgOnnAaUDUX6Q86','2024-02-27 01:35:23.638179','read write',1,2,'2024-02-26 15:35:23.707780','2024-02-26 15:35:23.707780',NULL,NULL),(84,'opPzaZOxzlcPtBond7Uc7Xk4rJHZ7H','2024-02-27 01:44:01.208448','read write',1,2,'2024-02-26 15:44:01.223705','2024-02-26 15:44:01.223705',NULL,NULL),(85,'KWnb0WFG6rDENVkSDdwrPBumbY81ur','2024-02-27 03:17:13.653852','read write',1,2,'2024-02-26 17:17:13.668135','2024-02-26 17:17:13.668135',NULL,NULL),(86,'htBh39Hf1ofuvMm6wAptvFSXRUOETt','2024-02-27 03:20:49.474006','read write',1,2,'2024-02-26 17:20:49.488860','2024-02-26 17:20:49.488860',NULL,NULL),(87,'hUj5V1Ly6jlrGAO7fFKMARuU5SRbTt','2024-02-27 03:31:38.949369','read write',1,2,'2024-02-26 17:31:38.983732','2024-02-26 17:31:38.983732',NULL,NULL),(88,'JCSLv6t18hrRXaYqfzYXvIDDTcZvit','2024-02-28 01:34:32.994457','read write',1,2,'2024-02-27 15:34:33.045327','2024-02-27 15:34:33.045327',NULL,NULL),(89,'7jxyqVNUqwteG3J85gLZuonNVSdWdS','2024-02-28 01:39:50.807838','read write',1,2,'2024-02-27 15:39:50.833158','2024-02-27 15:39:50.833158',NULL,NULL),(90,'717BLOJCUWis3WX056LxPR1Pdo5wHg','2024-02-28 01:41:13.578102','read write',1,2,'2024-02-27 15:41:13.625351','2024-02-27 15:41:13.625351',NULL,NULL),(91,'5BIFfS6yIyRoIQRA8hLyz9eAjB6DUo','2024-02-28 01:56:36.084015','read write',1,2,'2024-02-27 15:56:36.111843','2024-02-27 15:56:36.111843',NULL,NULL),(92,'PJDEeDUutMLQYi35eZn1hG0H95Yz3k','2024-02-28 02:04:04.413595','read write',1,2,'2024-02-27 16:04:04.477652','2024-02-27 16:04:04.478625',NULL,NULL),(93,'MsB8IdtKYz3Xo7EB934XoXHVWQ4QdB','2024-02-28 02:30:29.753289','read write',1,2,'2024-02-27 16:30:29.780568','2024-02-27 16:30:29.781543',NULL,NULL),(94,'TYNZBZHEfMOUoynVFRSnyis6WUwPYg','2024-02-28 02:32:57.327310','read write',1,2,'2024-02-27 16:32:57.366302','2024-02-27 16:32:57.367312',NULL,NULL),(95,'XD5KJXNDifX7J4SAPMfOqsU0ThlwK9','2024-02-28 02:36:27.585816','read write',1,2,'2024-02-27 16:36:27.633386','2024-02-27 16:36:27.633386',NULL,NULL),(96,'Ya6m3bVtI5e4x5PWzuQH6L32z5xzds','2024-02-28 02:50:05.154956','read write',1,2,'2024-02-27 16:50:05.185217','2024-02-27 16:50:05.186598',NULL,NULL),(97,'cFNjXSAB9SaKTG3TUOuTCoKlcxBHBB','2024-02-28 02:55:53.487976','read write',1,2,'2024-02-27 16:55:53.543247','2024-02-27 16:55:53.544640',NULL,NULL),(98,'HPWLkm4RhKq9oyInVeCHBoOFiT5ewQ','2024-02-28 02:58:16.020046','read write',1,2,'2024-02-27 16:58:16.058958','2024-02-27 16:58:16.058958',NULL,NULL),(99,'JZpiUZsjj76AuTA9ml9dpQxbr86nsS','2024-02-28 03:00:09.843046','read write',1,2,'2024-02-27 17:00:09.855129','2024-02-27 17:00:09.855129',NULL,NULL),(100,'2TS5VSAdCRpkV7gM1oS8oNu0IkeBwf','2024-02-28 03:04:29.724845','read write',1,2,'2024-02-27 17:04:29.734271','2024-02-27 17:04:29.734271',NULL,NULL),(101,'4QocVA5YKP3ntHw1S8ndtCyRuZM1yY','2024-02-28 03:06:54.099055','read write',1,2,'2024-02-27 17:06:54.184001','2024-02-27 17:06:54.184001',NULL,NULL),(102,'QFUPjEG7hLP0iN4nSXtaXWQxK6jNvD','2024-02-28 03:17:46.706971','read write',1,2,'2024-02-27 17:17:46.719395','2024-02-27 17:17:46.719395',NULL,NULL),(103,'6ZvzWfsA1aufHf235ADQY75JuHP1YP','2024-02-28 03:18:27.033682','read write',1,2,'2024-02-27 17:18:27.044799','2024-02-27 17:18:27.044799',NULL,NULL),(104,'z2AZ4de4bIjysB0muGpV70TDkF4sfG','2024-02-28 03:23:12.158201','read write',1,2,'2024-02-27 17:23:12.175821','2024-02-27 17:23:12.175821',NULL,NULL),(105,'BQlPMhJ9VgO2g1Seox283N5Zs4TzKC','2024-02-28 03:23:43.245465','read write',1,2,'2024-02-27 17:23:43.252324','2024-02-27 17:23:43.252324',NULL,NULL),(106,'rGWfppGqjUwP6szecUbf4HKIwb3wEt','2024-02-28 03:32:48.170121','read write',1,2,'2024-02-27 17:32:48.177697','2024-02-27 17:32:48.177697',NULL,NULL),(107,'YbDT64Aahpsudi8ejWw7kPOkfGMc93','2024-02-28 03:34:03.287903','read write',1,2,'2024-02-27 17:34:03.291365','2024-02-27 17:34:03.291365',NULL,NULL),(108,'GLWNBFA4SnMcG8Tc3OVmYVttMNHu4k','2024-02-28 03:35:38.732296','read write',1,2,'2024-02-27 17:35:38.738159','2024-02-27 17:35:38.738159',NULL,NULL),(109,'dKoxqy7fptU5c7pBUjdXij7oteIevu','2024-02-28 03:36:35.325123','read write',1,2,'2024-02-27 17:36:35.341699','2024-02-27 17:36:35.341699',NULL,NULL),(110,'uNJpZYxXNTkKhxsYNcfVsp4CHE0lUs','2024-02-28 03:37:14.307012','read write',1,2,'2024-02-27 17:37:14.311414','2024-02-27 17:37:14.311414',NULL,NULL),(111,'hVlrpTUEjD5Xyk6T7VAZGH7T6EQVuj','2024-02-28 03:52:08.877372','read write',1,2,'2024-02-27 17:52:08.887262','2024-02-27 17:52:08.887262',NULL,NULL),(112,'hxJWvZXha0x0JaJOqGDYHQj5f7I2oC','2024-02-28 03:54:56.767520','read write',1,2,'2024-02-27 17:54:56.773127','2024-02-27 17:54:56.774134',NULL,NULL),(113,'GYIpl0OCWN6S9S3tAAVWtbxFqmpWg3','2024-02-28 03:56:45.374518','read write',1,2,'2024-02-27 17:56:45.386761','2024-02-27 17:56:45.386761',NULL,NULL),(114,'8MOy2xYDQAtTKZpV6SFyirKAoThsfc','2024-02-28 03:59:47.794249','read write',1,2,'2024-02-27 17:59:47.808308','2024-02-27 17:59:47.809317',NULL,NULL),(115,'0IKYcprz7WjwsdOPGK7CoHETvwyOa3','2024-02-28 04:01:14.133620','read write',1,2,'2024-02-27 18:01:14.163220','2024-02-27 18:01:14.163220',NULL,NULL),(116,'2NVCFS0omjmeDXZctk6jpD0mgxxhj4','2024-02-28 04:02:00.004881','read write',1,2,'2024-02-27 18:02:00.023316','2024-02-27 18:02:00.023316',NULL,NULL),(117,'Z61jskr2CAg3Ce1u4cFDxeO0HXUUNi','2024-02-28 04:02:55.928530','read write',1,2,'2024-02-27 18:02:55.934962','2024-02-27 18:02:55.934962',NULL,NULL),(118,'4gxpEyJH2HcTYZvGo5D9Q68KJRJnTE','2024-02-28 04:03:27.729427','read write',1,2,'2024-02-27 18:03:27.737299','2024-02-27 18:03:27.738369',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_refreshtoken` VALUES (1,'hepQwUWRXopdQFiw0n4921y2Eay3ho',1,1,1,'2024-01-17 18:17:48.095001','2024-01-17 18:17:48.095001',NULL),(2,'Bp2mHQwVkCH29j5q2YH8gTHqJrUjdf',2,1,3,'2024-01-17 18:38:15.955341','2024-01-17 18:38:15.955341',NULL),(3,'H2PwIpqT3l669sRCMEg9Xzn2ijK49D',3,1,2,'2024-01-17 18:46:03.159584','2024-01-17 18:46:03.159584',NULL),(4,'11FTKgdG2ioNVMCOG8FFpZyxwnrkOp',4,1,3,'2024-01-17 18:48:35.514331','2024-01-17 18:48:35.514331',NULL),(5,'k1bQBHXVnvc6rAqDcTtPtJ3scnq04j',5,1,3,'2024-01-17 18:51:13.362692','2024-01-17 18:51:13.362692',NULL),(6,'Hnm0xdoCKWC91KcHai8I5yjItw5737',6,1,3,'2024-01-17 18:51:28.575845','2024-01-17 18:51:28.575845',NULL),(7,'l1jRRo9SQRS3LrVWOW5t1lKHyb0m2P',7,1,2,'2024-01-17 19:14:38.166344','2024-01-17 19:14:38.166344',NULL),(8,'FF2Y2cdpTKTLyDraOlPOTgyzxmTL6v',8,1,2,'2024-01-18 06:25:41.998270','2024-01-18 06:25:41.998270',NULL),(9,'BSuj3V5C6ZOShgIbAc4OCsiLmR2Jty',9,1,2,'2024-01-29 14:30:32.080508','2024-01-29 14:30:32.080508',NULL),(10,'nFQOBosPw6XLceSD10fX4WQIKN4JQI',10,1,2,'2024-01-29 14:36:45.797676','2024-01-29 14:36:45.797676',NULL),(11,'WFWjrC54gQdFM3KNOpvDptw1F8RilJ',11,1,2,'2024-01-30 16:26:23.040855','2024-01-30 16:26:23.040855',NULL),(12,'YiCGFFF2lqnxBEunKMslMJJMya4CMg',12,1,2,'2024-01-30 16:27:15.718845','2024-01-30 16:27:15.718845',NULL),(13,'nCyqDcfaleclVc3RyKXrCSJiaYTZMm',13,1,2,'2024-01-30 16:58:54.555870','2024-01-30 16:58:54.555870',NULL),(14,'tjuAzvnEIS3B37YgrailGjWVp0yOaG',14,1,2,'2024-01-30 17:01:38.536286','2024-01-30 17:01:38.536286',NULL),(15,'HD3ro024hsmHZlQgofa4q4enpvnc4H',15,1,2,'2024-01-30 17:18:58.627012','2024-01-30 17:18:58.627012',NULL),(16,'485v5BbA5bUmOMXS3NKJLmSXo9LyT3',16,1,2,'2024-01-30 17:21:23.335869','2024-01-30 17:21:23.335869',NULL),(17,'BP2B1hztxSMf8wNJ6qHCU4Eqr849j9',17,1,2,'2024-01-30 17:23:55.179875','2024-01-30 17:23:55.181045',NULL),(18,'VJEwnjPq9LNeB23QDaI1zShPraneZh',18,1,2,'2024-01-30 17:57:02.791591','2024-01-30 17:57:02.791591',NULL),(19,'CiLEa54XDH3Z6EfQvsleacT7ZaLxuH',19,1,2,'2024-02-01 15:41:27.790976','2024-02-01 15:41:27.790976',NULL),(20,'lL42iFmu8fJSi67alQGsQYWMHY70Hr',20,1,2,'2024-02-01 18:24:07.504344','2024-02-01 18:24:07.504344',NULL),(21,'pncJeqhnom7qCIMznvKeR6bYraL6Ej',21,1,2,'2024-02-01 19:08:57.363335','2024-02-01 19:08:57.363335',NULL),(22,'i0kIXK3JZyjJNttmD69mNeVj1mV24j',22,1,2,'2024-02-01 19:09:59.787781','2024-02-01 19:09:59.787781',NULL),(23,'ZahLd70fLl5u1Isvgl4HaIqBIjqcYa',23,1,2,'2024-02-05 17:20:28.185547','2024-02-05 17:20:28.185547',NULL),(24,'Ams5Mvh76AChpcrB34sf0AYv2BmrKn',24,1,4,'2024-02-05 17:28:38.002374','2024-02-05 17:28:38.002374',NULL),(25,'iR1971iHjegom2RRvPYeGAc1SZZiB2',25,1,4,'2024-02-05 18:16:34.775665','2024-02-05 18:16:34.775665',NULL),(26,'bRTLdBDg4EzOxeZwZ1dumVtTEiQoxC',26,1,2,'2024-02-05 18:32:13.024908','2024-02-05 18:32:13.024908',NULL),(27,'hxwSw70G6716ejzlvx21Ndk3q5boLV',27,1,2,'2024-02-06 15:28:04.274433','2024-02-06 15:28:04.274433',NULL),(28,'FiCJz2O9Wce1LvxW5xNTadIkHpfv9N',28,1,2,'2024-02-08 05:19:24.824564','2024-02-08 05:19:24.824564',NULL),(29,'wpuPHh6aPjLjkcPUtb0Du53xYuR1dD',29,1,2,'2024-02-08 10:47:22.360679','2024-02-08 10:47:22.360679',NULL),(30,'g3syWGtVGXhNsDzuZhY4R40WML5SOA',30,1,2,'2024-02-08 11:03:15.335398','2024-02-08 11:03:15.335398',NULL),(31,'zquc5mAXSrBezWKHbcZGipeVhR00pe',31,1,2,'2024-02-08 11:12:38.512514','2024-02-08 11:12:38.512514',NULL),(32,'oN7YRm0Fl0EhO5AszCO3y6KzO376A6',32,1,2,'2024-02-08 17:47:51.439733','2024-02-08 17:47:51.439733',NULL),(33,'JxY3mAMsv5e2iTZP6f1pMUGn8CVxBl',33,1,2,'2024-02-09 03:39:39.334465','2024-02-09 03:39:39.334465',NULL),(34,'YBvOgPmtN2go7iImo0V3rb3O7ogz0k',34,1,2,'2024-02-09 06:21:12.678130','2024-02-09 06:21:12.678130',NULL),(35,'F4Cdkkl7Cr1LebIWjOLpH6eNitGtPi',35,1,2,'2024-02-11 14:49:58.049201','2024-02-11 14:49:58.049201',NULL),(36,'cr32ChrS4GbMJmyAjX6EvzYc0MJLBN',36,1,2,'2024-02-11 18:14:44.374450','2024-02-11 18:14:44.374450',NULL),(37,'Wjc5DX71wbF6JZr3m0O2CNEtDLGQMU',37,1,2,'2024-02-12 19:54:25.782123','2024-02-12 19:54:25.782123',NULL),(38,'wmede7a2E1pBl7h3QKpnWadtdBnTgE',38,1,3,'2024-02-12 22:44:50.205694','2024-02-12 22:44:50.205694',NULL),(39,'twEfEpuJ0pzRSRFlRKl3h9CXZHjTDV',39,1,2,'2024-02-12 22:45:52.210162','2024-02-12 22:45:52.210162',NULL),(40,'NHCFNPDIxpXB7RkvIUn2qLdmiCIspX',40,1,2,'2024-02-14 12:18:31.018316','2024-02-14 12:18:31.018316',NULL),(41,'KF6JHWu0W1SJTC4PwS69rJd94ARUim',41,1,2,'2024-02-14 12:18:43.574347','2024-02-14 12:18:43.574347',NULL),(42,'EDGp2OBB1rBKVAPXTyzzdHEJS5UsH9',42,1,2,'2024-02-14 12:19:02.000450','2024-02-14 12:19:02.000450',NULL),(43,'xqYhsJ4zfS4wYhydBxFaFkCWinoDx5',43,1,2,'2024-02-14 12:20:10.956133','2024-02-14 12:20:10.956133',NULL),(44,'5gL9PsHLbz6Zzkvfu6oyKFYfZ4hEVt',44,1,2,'2024-02-14 12:21:19.995042','2024-02-14 12:21:19.995042',NULL),(45,'IchvE9BGqnpsfxSjKvK0GeOpxvtYi5',45,1,2,'2024-02-14 12:22:10.442523','2024-02-14 12:22:10.442523',NULL),(46,'CL1H4AlKDhOL6UNqMhNcICjFXC9F31',46,1,2,'2024-02-14 12:24:19.573731','2024-02-14 12:24:19.573731',NULL),(47,'zbhjZD0X3rxOQaoXFQXRVoHz4R8HpO',47,1,2,'2024-02-14 12:24:44.572661','2024-02-14 12:24:44.572661',NULL),(48,'TQ7v9Uv9HKOuud6SGyZ8Ds1pWy8TZ8',48,1,2,'2024-02-14 12:24:59.500188','2024-02-14 12:24:59.500188',NULL),(49,'Ke1BHvgi5c7dZN30vWya2i5OEydgvx',49,1,2,'2024-02-14 12:35:16.873217','2024-02-14 12:35:16.873217',NULL),(50,'zZT2wJ1wCI6MNRQ0rzFjrHUSKbxX6y',50,1,2,'2024-02-14 12:41:23.778894','2024-02-14 12:41:23.778894',NULL),(51,'4sAPjbZdnw36nJNa8ucfKDvNuWwcng',51,1,2,'2024-02-14 12:41:47.165441','2024-02-14 12:41:47.165441',NULL),(52,'SOcvMqm8lxkyjvze0pq2OynhBswIGH',52,1,2,'2024-02-14 12:55:25.981688','2024-02-14 12:55:25.981688',NULL),(53,'AtNPTCmSfYoDvD90511WTTDdgkzLoJ',53,1,2,'2024-02-14 12:56:25.170127','2024-02-14 12:56:25.170127',NULL),(54,'gnIPOgvvUzo821fIH44HwYUJ9xIO68',54,1,2,'2024-02-14 12:57:55.638992','2024-02-14 12:57:55.638992',NULL),(55,'kJUVztCbCrAAkJHVDMfXCQzP8ttuVs',55,1,2,'2024-02-14 12:59:54.468214','2024-02-14 12:59:54.468214',NULL),(56,'uYXspmVdOtIe4d2IoOpMQc9crkLZJW',56,1,2,'2024-02-14 13:04:19.070032','2024-02-14 13:04:19.070032',NULL),(57,'TB4Xk1aKc5tgpSBQM56hN0eVBVRhtx',57,1,3,'2024-02-14 13:09:10.364668','2024-02-14 13:09:10.364668',NULL),(58,'msbtA99tpISlVcLdram2KZpyUs9fW8',58,1,3,'2024-02-14 13:11:16.575717','2024-02-14 13:11:16.575717',NULL),(59,'Zw6c2ygERruFDEsKkVjR6fDHx8Jw9y',59,1,2,'2024-02-17 01:31:26.446371','2024-02-17 01:31:26.446371',NULL),(60,'mFzAUxR8hnOnFqKzGk49C5jb87HAVP',60,1,20,'2024-02-17 02:23:46.084385','2024-02-17 02:23:46.084385',NULL),(61,'QA9xXibnhks6PqlnDqAWVpFir0FS3k',61,1,2,'2024-02-22 14:45:21.225699','2024-02-22 14:45:21.225699',NULL),(62,'cniksa8khtDCRC5AAxiXhL1dnQcXUU',62,1,2,'2024-02-22 14:45:38.015930','2024-02-22 14:45:38.016445',NULL),(63,'sY7JXboUdgV1mgTydX2Ommd4Rh16VE',63,1,2,'2024-02-22 14:56:55.914333','2024-02-22 14:56:55.914851',NULL),(64,'Vd1CS9IVYR1Vi14xn5cP6y2IP6s5cF',64,1,2,'2024-02-25 13:17:14.649554','2024-02-25 13:17:14.649554',NULL),(65,'4JVPFu2g26MsyolrFl7yTrOcL8hooo',65,1,2,'2024-02-25 13:18:51.132703','2024-02-25 13:18:51.132703',NULL),(66,'qIm0pJCT77UsLekvPiQLsMs8NAToNr',66,1,2,'2024-02-25 14:16:57.943270','2024-02-25 14:16:57.943270',NULL),(67,'7U4o0NMwZoPIhySBBUHZxZNaG5QI0M',67,1,2,'2024-02-25 14:17:59.326864','2024-02-25 14:17:59.326864',NULL),(68,'aEOdNkzhzfGeMlhVzGfeVZAnM3dNG8',68,1,2,'2024-02-25 14:19:46.991286','2024-02-25 14:19:46.991286',NULL),(69,'ndImqDpi1jaKAv3gl86MeTxXmoLfqN',69,1,2,'2024-02-25 14:22:00.076604','2024-02-25 14:22:00.076604',NULL),(70,'q4hd4d4ySJjUamJGg0sAAHnjyM8rye',70,1,2,'2024-02-25 14:27:49.893926','2024-02-25 14:27:49.893926',NULL),(71,'I3NvPVqqceAtMW4ie3EJx4o3EEw8LJ',71,1,2,'2024-02-25 14:35:41.742384','2024-02-25 14:35:41.742384',NULL),(72,'feEfZIxBGkokIfJGyODA7V4ZqqhQ3n',72,1,2,'2024-02-25 14:38:10.809555','2024-02-25 14:38:10.809555',NULL),(73,'TZAwLNmCLij9cf9EQHUPNxAwYsiDav',73,1,2,'2024-02-25 14:40:12.085506','2024-02-25 14:40:12.086795',NULL),(74,'KXsOmdRmvd6ocXNknGWSsIm2oG5pq4',74,1,2,'2024-02-25 14:43:34.592568','2024-02-25 14:43:34.592568',NULL),(75,'FyctBrgRGARLo8UDA0NK0YCfmy3cQp',75,1,2,'2024-02-25 14:45:02.488415','2024-02-25 14:45:02.488415',NULL),(76,'kGQZdlnUSjYeXVy1cvVkCEemkoV8Oa',76,1,2,'2024-02-25 15:05:18.779054','2024-02-25 15:05:18.780450',NULL),(77,'4Qavp1Dw9R8RlEHLGq6hNHlEKuPqUt',77,1,2,'2024-02-25 15:07:01.643591','2024-02-25 15:07:01.643591',NULL),(78,'QyGtIwJ1uAIGg5ECNHwNJr65LUTkvg',78,1,2,'2024-02-25 15:07:50.760585','2024-02-25 15:07:50.760585',NULL),(79,'JwLTCBR3T9ID9Q9n1xSuVGBAHbVNe2',79,1,2,'2024-02-25 15:10:45.355330','2024-02-25 15:10:45.355330',NULL),(80,'jDF3NSShNws0ZpFKe72wO1HlH5MfFi',80,1,2,'2024-02-25 15:15:53.659321','2024-02-25 15:15:53.659321',NULL),(81,'H77dnjKbUW8978gYiorz3HEJzwxqup',81,1,2,'2024-02-25 15:53:39.299490','2024-02-25 15:53:39.299490',NULL),(82,'oS4EfwEn0cYZCPbqgEEpYZkTVI2W2x',82,1,2,'2024-02-26 13:59:34.322656','2024-02-26 13:59:34.322656',NULL),(83,'POjmP7yQFPFPpzO97wyRll5wZYIg6o',83,1,2,'2024-02-26 15:35:23.819330','2024-02-26 15:35:23.819330',NULL),(84,'qQE8viI502DOTMkZTvKxTySEb04lTY',84,1,2,'2024-02-26 15:44:01.302322','2024-02-26 15:44:01.302322',NULL),(85,'2zbPS3OCHLgyZWTCtOXSxaebwAIa6p',85,1,2,'2024-02-26 17:17:13.733592','2024-02-26 17:17:13.733592',NULL),(86,'hy0FoEqLb3txyU6W0eb4ucGeCTZ7A1',86,1,2,'2024-02-26 17:20:49.540515','2024-02-26 17:20:49.540515',NULL),(87,'bURuk3FX369I7hATnDRAOy2N2qpz35',87,1,2,'2024-02-26 17:31:39.082375','2024-02-26 17:31:39.082375',NULL),(88,'EDtgyic7VX4lT13v1mSdTQOfXUXIo4',88,1,2,'2024-02-27 15:34:33.116738','2024-02-27 15:34:33.116738',NULL),(89,'Y4XgGruQJfEXfBcHr81D7yd3DEAlQ5',89,1,2,'2024-02-27 15:39:50.905663','2024-02-27 15:39:50.905663',NULL),(90,'ll5OeGsVj72PqZQolvqBHfeiMyKzl6',90,1,2,'2024-02-27 15:41:13.718577','2024-02-27 15:41:13.718577',NULL),(91,'bRK2Ou5Wl0nj8swt4aO7vRJGQ6d1AI',91,1,2,'2024-02-27 15:56:36.286170','2024-02-27 15:56:36.286170',NULL),(92,'m5yV9bSp2J0qPKuArKltvLhWUuEV07',92,1,2,'2024-02-27 16:04:04.578448','2024-02-27 16:04:04.578448',NULL),(93,'OzDAiHqtwx9qbfiG3EEL0sjSlD9BFG',93,1,2,'2024-02-27 16:30:29.853644','2024-02-27 16:30:29.853644',NULL),(94,'t5o9rOcXJlEEBscGL9c3fzz5Zx7IwV',94,1,2,'2024-02-27 16:32:57.478991','2024-02-27 16:32:57.478991',NULL),(95,'0mzbc3VLH1YIBorNJKwlbc03go6kkr',95,1,2,'2024-02-27 16:36:27.724249','2024-02-27 16:36:27.724249',NULL),(96,'uy0lczI11FXWRapUqUYgpbpuVn8iiy',96,1,2,'2024-02-27 16:50:05.273319','2024-02-27 16:50:05.273319',NULL),(97,'5UsUX33FtkWsbmg85eeBdZpGqIUokr',97,1,2,'2024-02-27 16:55:53.628135','2024-02-27 16:55:53.628135',NULL),(98,'39BudU74c9cstq3ejfDflSY34Mls28',98,1,2,'2024-02-27 16:58:16.105121','2024-02-27 16:58:16.105121',NULL),(99,'zK18oPpxmKGlrsKyTGhIw1p2l19DBe',99,1,2,'2024-02-27 17:00:09.888239','2024-02-27 17:00:09.888239',NULL),(100,'jc8ir6OWLq9xyFMfYyCzpRwfuORpCf',100,1,2,'2024-02-27 17:04:29.781593','2024-02-27 17:04:29.781593',NULL),(101,'EkWjfgepfzjAMGgsuJLvvJRsinLg72',101,1,2,'2024-02-27 17:06:54.393062','2024-02-27 17:06:54.394038',NULL),(102,'FVkuhoT2ZLXJH63YDtlyTz3qcQ03ZW',102,1,2,'2024-02-27 17:17:46.766975','2024-02-27 17:17:46.766975',NULL),(103,'SVZhycH4DEXCko5ve77trjHDNsjQuL',103,1,2,'2024-02-27 17:18:27.085999','2024-02-27 17:18:27.085999',NULL),(104,'Jq9ZkvBWGuD2KwYGPh1JIZ46uuQvHf',104,1,2,'2024-02-27 17:23:12.244390','2024-02-27 17:23:12.244390',NULL),(105,'TACOU5okplqmDhNp0JMN5bOcnLZTNk',105,1,2,'2024-02-27 17:23:43.269164','2024-02-27 17:23:43.269164',NULL),(106,'vVTHktng7vgZWaQ9XmRtjMnCeLeqQS',106,1,2,'2024-02-27 17:32:48.215498','2024-02-27 17:32:48.215498',NULL),(107,'3hba3bnOu8Phfu4N7Y7OrZV1QyzlAO',107,1,2,'2024-02-27 17:34:03.317020','2024-02-27 17:34:03.317020',NULL),(108,'gs0eZpD7Dp1vbiA62x4NiLvt1GObrC',108,1,2,'2024-02-27 17:35:38.765843','2024-02-27 17:35:38.765843',NULL),(109,'EOfjtq2FSOkYavnhJMbIIFqmyaXf7F',109,1,2,'2024-02-27 17:36:35.435110','2024-02-27 17:36:35.435110',NULL),(110,'CvAXa1mTOLlXhaB4gKrVy9H4PHHs3T',110,1,2,'2024-02-27 17:37:14.336442','2024-02-27 17:37:14.336442',NULL),(111,'s2V8UBYKUHvUqoKnqV4rMdY9djnVhn',111,1,2,'2024-02-27 17:52:08.938013','2024-02-27 17:52:08.938013',NULL),(112,'Q54eXl1cALjupu8HtNTgJrbBEODyKj',112,1,2,'2024-02-27 17:54:56.813060','2024-02-27 17:54:56.813060',NULL),(113,'Dsk5teRt3Sk7LmmzBQGeyQMGS3J7kt',113,1,2,'2024-02-27 17:56:45.442277','2024-02-27 17:56:45.442277',NULL),(114,'KH0VtNUKtBgnRPI0uhEfQIkNMIDP46',114,1,2,'2024-02-27 17:59:47.847897','2024-02-27 17:59:47.847897',NULL),(115,'gXrYMQDjlenfGGRITNkDGrOfD9u3hO',115,1,2,'2024-02-27 18:01:14.226426','2024-02-27 18:01:14.226426',NULL),(116,'QeX3T6WlDXyb59FoGZQtCmoa3I2xap',116,1,2,'2024-02-27 18:02:00.109482','2024-02-27 18:02:00.109482',NULL),(117,'BJvryJVkvjq4AcEM6OJHX7tAyUdKa2',117,1,2,'2024-02-27 18:02:55.966029','2024-02-27 18:02:55.966029',NULL),(118,'bECtKX0rw27VjEvAFRJ7KGmcl2gmXi',118,1,2,'2024-02-27 18:03:27.769637','2024-02-27 18:03:27.769637',NULL);
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
  `business` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `charset` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notify_version` decimal(64,2) DEFAULT NULL,
  `parent_txn_id` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receiver_email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receiver_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `residence_country` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `test_ipn` tinyint(1) NOT NULL,
  `txn_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `txn_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verify_sign` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_country` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_city` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_country_code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_state` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_street` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_zip` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payer_business_name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payer_email` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payer_id` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auth_amount` decimal(64,2) DEFAULT NULL,
  `auth_exp` varchar(28) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auth_id` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auth_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` decimal(64,16) DEFAULT NULL,
  `invoice` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_number` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mc_currency` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mc_fee` decimal(64,2) DEFAULT NULL,
  `mc_gross` decimal(64,2) DEFAULT NULL,
  `mc_handling` decimal(64,2) DEFAULT NULL,
  `mc_shipping` decimal(64,2) DEFAULT NULL,
  `memo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_cart_items` int DEFAULT NULL,
  `option_name1` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_name2` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payer_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  `payment_gross` decimal(64,2) DEFAULT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pending_reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `protection_eligibility` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int DEFAULT NULL,
  `reason_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remaining_settle` decimal(64,2) DEFAULT NULL,
  `settle_amount` decimal(64,2) DEFAULT NULL,
  `settle_currency` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping` decimal(64,2) DEFAULT NULL,
  `shipping_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax` decimal(64,2) DEFAULT NULL,
  `transaction_entity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auction_buyer_id` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auction_closing_date` datetime(6) DEFAULT NULL,
  `auction_multi_item` int DEFAULT NULL,
  `for_auction` decimal(64,2) DEFAULT NULL,
  `amount` decimal(64,2) DEFAULT NULL,
  `amount_per_cycle` decimal(64,2) DEFAULT NULL,
  `initial_payment_amount` decimal(64,2) DEFAULT NULL,
  `next_payment_date` datetime(6) DEFAULT NULL,
  `outstanding_balance` decimal(64,2) DEFAULT NULL,
  `payment_cycle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `period_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recurring_payment_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rp_invoice_id` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_created` datetime(6) DEFAULT NULL,
  `amount1` decimal(64,2) DEFAULT NULL,
  `amount2` decimal(64,2) DEFAULT NULL,
  `amount3` decimal(64,2) DEFAULT NULL,
  `mc_amount1` decimal(64,2) DEFAULT NULL,
  `mc_amount2` decimal(64,2) DEFAULT NULL,
  `mc_amount3` decimal(64,2) DEFAULT NULL,
  `password` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `period1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `period2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `period3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reattempt` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recur_times` int DEFAULT NULL,
  `recurring` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `retry_at` datetime(6) DEFAULT NULL,
  `subscr_date` datetime(6) DEFAULT NULL,
  `subscr_effective` datetime(6) DEFAULT NULL,
  `subscr_id` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `case_creation_date` datetime(6) DEFAULT NULL,
  `case_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `case_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receipt_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handling_amount` decimal(64,2) DEFAULT NULL,
  `transaction_subject` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ipaddress` char(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flag` tinyint(1) NOT NULL,
  `flag_code` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flag_info` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `query` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `response` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `from_view` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mp_id` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `option_selection1` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_selection2` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
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

-- Dump completed on 2024-02-28  1:05:16
