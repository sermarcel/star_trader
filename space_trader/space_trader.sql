-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: space_trader
-- ------------------------------------------------------
-- Server version	5.7.17-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add user',2,'add_user'),(5,'Can change user',2,'change_user'),(6,'Can delete user',2,'delete_user'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add permission',4,'add_permission'),(11,'Can change permission',4,'change_permission'),(12,'Can delete permission',4,'delete_permission'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add player',7,'add_player'),(20,'Can change player',7,'change_player'),(21,'Can delete player',7,'delete_player'),(22,'Can add stage',8,'add_stage'),(23,'Can change stage',8,'change_stage'),(24,'Can delete stage',8,'delete_stage'),(25,'Can add product',9,'add_product'),(26,'Can change product',9,'change_product'),(27,'Can delete product',9,'delete_product'),(28,'Can add planet',10,'add_planet'),(29,'Can change planet',10,'change_planet'),(30,'Can delete planet',10,'delete_planet'),(31,'Can add ship',11,'add_ship'),(32,'Can change ship',11,'change_ship'),(33,'Can delete ship',11,'delete_ship'),(34,'Can add planet product',12,'add_planetproduct'),(35,'Can change planet product',12,'change_planetproduct'),(36,'Can delete planet product',12,'delete_planetproduct'),(37,'Can add ship product',13,'add_shipproduct'),(38,'Can change ship product',13,'change_shipproduct'),(39,'Can delete ship product',13,'delete_shipproduct'),(40,'Can add event effect',14,'add_eventeffect'),(41,'Can change event effect',14,'change_eventeffect'),(42,'Can delete event effect',14,'delete_eventeffect'),(43,'Can add event',15,'add_event'),(44,'Can change event',15,'change_event'),(45,'Can delete event',15,'delete_event');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$30000$QhmMzrjHy5f9$IJW+6d6APIWOrozftXqIyO8R9BAfoxwbHKHL1yjdT3M=','2017-02-05 10:48:42.304808',1,'sermarcel','','','marcin.brzescianski@gmail.com',1,1,'2017-01-20 19:07:27.814699');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-01-20 19:08:02.191548','1','Krypton',1,'[{\"added\": {}}]',10,1),(2,'2017-01-20 19:08:08.924436','2','Solaris',1,'[{\"added\": {}}]',10,1),(3,'2017-01-20 19:08:10.720266','1','Falcon',1,'[{\"added\": {}}]',11,1),(4,'2017-01-20 22:57:01.838394','1','Falcon',2,'[{\"changed\": {\"fields\": [\"planet\"]}}]',11,1),(5,'2017-01-20 23:12:22.335771','1','krewetki',1,'[{\"added\": {}}]',9,1),(6,'2017-01-20 23:12:40.430841','2','hamburgery',1,'[{\"added\": {}}]',9,1),(7,'2017-01-20 23:13:05.897331','3','salata',1,'[{\"added\": {}}]',9,1),(8,'2017-01-20 23:13:13.552871','4','koks',1,'[{\"added\": {}}]',9,1),(9,'2017-01-20 23:14:33.109553','1','Krypton krewetki 0',1,'[{\"added\": {}}]',12,1),(10,'2017-01-20 23:14:42.256111','2','Krypton hamburgery 5',1,'[{\"added\": {}}]',12,1),(11,'2017-01-20 23:14:53.450390','3','Krypton salata 5',1,'[{\"added\": {}}]',12,1),(12,'2017-01-20 23:21:24.165902','1','Falcon krewetki 10',1,'[{\"added\": {}}]',13,1),(13,'2017-01-20 23:21:42.815585','2','Falcon hamburgery 4',1,'[{\"added\": {}}]',13,1),(14,'2017-01-20 23:21:58.934236','3','Falcon salata 10',1,'[{\"added\": {}}]',13,1),(15,'2017-01-20 23:22:13.975642','4','Falcon koks 7',1,'[{\"added\": {}}]',13,1),(16,'2017-01-21 18:55:51.518071','4','Krypton krewetki 6',1,'[{\"added\": {}}]',12,1),(17,'2017-01-21 18:57:44.478717','1','Krypton koks 2',2,'[{\"changed\": {\"fields\": [\"product\", \"actual_price\"]}}]',12,1),(18,'2017-01-22 00:01:50.388179','1','Player cinek is on stage 1',1,'[{\"added\": {}}]',8,1),(19,'2017-01-22 00:02:00.503473','1','Player cinek is on stage 1',3,'',8,1),(20,'2017-01-22 00:02:11.410199','2','Player Adam is on stage 1',1,'[{\"added\": {}}]',8,1),(21,'2017-01-22 01:01:26.602609','11','Player kamisia is on stage 1',3,'',8,1),(22,'2017-01-22 01:01:26.643094','10','Player dfd is on stage 1',3,'',8,1),(23,'2017-01-22 01:01:26.693902','9','Player dfd is on stage 1',3,'',8,1),(24,'2017-01-22 01:01:26.718209','8','Player dfd is on stage 1',3,'',8,1),(25,'2017-01-22 01:01:26.745094','7','Player Adam is on stage 1',3,'',8,1),(26,'2017-01-22 01:01:26.770322','6','Player Adam is on stage 1',3,'',8,1),(27,'2017-01-22 01:01:26.803861','5','Player Adam is on stage 1',3,'',8,1),(28,'2017-01-22 01:01:26.837367','4','Player Adam is on stage 1',3,'',8,1),(29,'2017-01-22 01:01:26.862317','3','Player Adam is on stage 1',3,'',8,1),(30,'2017-01-22 01:01:26.887489','2','Player Adam is on stage 7',3,'',8,1),(31,'2017-01-22 01:01:44.723450','6','kamisia',3,'',7,1),(32,'2017-01-22 01:01:44.767020','5','dfd',3,'',7,1),(33,'2017-01-22 01:01:44.802161','4','dfd',3,'',7,1),(34,'2017-01-22 01:01:44.835618','3','Adam',3,'',7,1),(35,'2017-01-22 01:01:44.869420','2','cinek',3,'',7,1),(36,'2017-01-22 01:01:44.902802','1','kamisia',3,'',7,1),(37,'2017-01-22 10:23:34.328149','9','cinek',3,'',7,1),(38,'2017-01-23 20:34:35.998586','1','Falcon',2,'[{\"changed\": {\"fields\": [\"capacity\"]}}]',11,1),(39,'2017-01-24 11:53:54.489752','13','cinek',3,'',7,1),(40,'2017-01-24 11:53:54.550806','12','cinek',3,'',7,1),(41,'2017-01-24 11:53:54.575631','11','cinek',3,'',7,1),(42,'2017-01-24 11:53:54.609268','10','cinek',3,'',7,1),(43,'2017-01-24 11:53:54.634359','9','cinek',3,'',7,1),(44,'2017-01-24 11:53:54.685973','8','kamisia',3,'',7,1),(45,'2017-01-24 11:53:54.794870','7','cinek',3,'',7,1),(46,'2017-01-24 12:14:33.258312','2','hamburgery',2,'[{\"changed\": {\"fields\": [\"how_many_space\"]}}]',9,1),(47,'2017-01-25 09:40:00.672521','1','Pirates',1,'[{\"added\": {}}]',15,1),(48,'2017-01-25 09:45:44.436592','1','EventEffect object',1,'[{\"added\": {}}]',14,1),(49,'2017-01-25 16:42:29.804797','2','hamburgery',2,'[{\"changed\": {\"fields\": [\"how_many_space\"]}}]',9,1),(50,'2017-01-25 16:43:57.191471','16','janieczka',2,'[{\"changed\": {\"fields\": [\"money\"]}}]',7,1),(51,'2017-01-29 13:03:22.306310','2','Girl',1,'[{\"added\": {}}]',15,1),(52,'2017-02-02 21:48:57.142487','1','Pirates',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',15,1),(53,'2017-02-02 21:58:09.417806','1','Pirates',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',15,1),(54,'2017-02-02 22:02:28.878630','1','Pirates',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',15,1),(55,'2017-02-02 22:03:44.826063','1','Pirates',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',15,1),(56,'2017-02-02 22:05:00.182480','2','Girl',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',15,1),(57,'2017-02-03 21:38:48.984966','1','Girl',2,'[{\"changed\": {\"fields\": [\"event\", \"stage\"]}}]',14,1),(58,'2017-02-03 21:39:04.960652','2','Pirates',1,'[{\"added\": {}}]',14,1),(59,'2017-02-03 21:44:53.539687','2','Pirates',2,'[]',14,1),(60,'2017-02-03 21:45:08.867341','1','Girl',2,'[{\"changed\": {\"fields\": [\"quantity\"]}}]',14,1),(61,'2017-02-04 20:08:59.817308','2','Pirates',2,'[{\"changed\": {\"fields\": [\"money\"]}}]',14,1),(62,'2017-02-04 20:58:32.146149','2','Pirates',2,'[{\"changed\": {\"fields\": [\"stage\"]}}]',14,1),(63,'2017-02-04 20:58:53.559221','17','miki',2,'[{\"changed\": {\"fields\": [\"money\"]}}]',7,1),(64,'2017-02-05 10:49:03.428568','3','Pandora',1,'[{\"added\": {}}]',10,1),(65,'2017-02-05 10:49:10.221734','4','Genezis',1,'[{\"added\": {}}]',10,1),(66,'2017-02-05 19:59:56.988852','2','diamenty',2,'[{\"changed\": {\"fields\": [\"product_name\"]}}]',9,1),(67,'2017-02-05 20:00:03.626138','1','krewetki',2,'[]',9,1),(68,'2017-02-05 20:00:38.826002','3','ropa',2,'[{\"changed\": {\"fields\": [\"product_name\"]}}]',9,1),(69,'2017-02-05 20:02:01.301975','2','kocia karma',2,'[{\"changed\": {\"fields\": [\"product_name\"]}}]',9,1),(70,'2017-02-05 20:03:52.292103','3','baterie',2,'[{\"changed\": {\"fields\": [\"product_name\"]}}]',9,1),(71,'2017-02-05 20:04:21.251430','4','spirytus',2,'[{\"changed\": {\"fields\": [\"product_name\", \"how_many_space\"]}}]',9,1),(72,'2017-02-05 20:04:28.207836','2','kocia karma',2,'[{\"changed\": {\"fields\": [\"how_many_space\"]}}]',9,1),(73,'2017-02-05 20:04:32.329016','3','baterie',2,'[]',9,1),(74,'2017-02-05 20:08:26.696172','1','Falcon',2,'[{\"changed\": {\"fields\": [\"capacity\"]}}]',11,1),(75,'2017-02-05 20:08:53.907711','2','Statek matka',1,'[{\"added\": {}}]',11,1),(76,'2017-02-05 20:10:14.077105','3','Enterprise',1,'[{\"added\": {}}]',11,1),(77,'2017-02-05 20:10:35.187422','4','Nostromo',1,'[{\"added\": {}}]',11,1),(78,'2017-02-05 20:12:01.677036','17','miki',3,'',7,1),(79,'2017-02-05 20:12:01.738896','16','janieczka',3,'',7,1),(80,'2017-02-05 20:12:01.763932','15','sermarcel',3,'',7,1),(81,'2017-02-05 20:12:01.789311','14','cinek',3,'',7,1),(82,'2017-02-05 20:12:32.932839','3','Falcon baterie 5',2,'[{\"changed\": {\"fields\": [\"quantity\"]}}]',13,1),(83,'2017-02-05 20:12:42.900963','1','Falcon krewetki 2',2,'[{\"changed\": {\"fields\": [\"quantity\"]}}]',13,1),(84,'2017-02-05 20:12:48.585390','2','Falcon kocia karma 1',2,'[{\"changed\": {\"fields\": [\"quantity\"]}}]',13,1),(85,'2017-02-05 20:13:17.562718','5','Statek matka krewetki 2',1,'[{\"added\": {}}]',13,1),(86,'2017-02-05 20:13:30.700674','6','Statek matka kocia karma 1',1,'[{\"added\": {}}]',13,1),(87,'2017-02-05 20:13:52.988072','7','Statek matka baterie 2',1,'[{\"added\": {}}]',13,1),(88,'2017-02-05 20:14:26.270840','8','Statek matka spirytus 2',1,'[{\"added\": {}}]',13,1),(89,'2017-02-05 20:15:06.811518','9','Enterprise krewetki 1',1,'[{\"added\": {}}]',13,1),(90,'2017-02-05 20:15:19.085664','10','Enterprise kocia karma 2',1,'[{\"added\": {}}]',13,1),(91,'2017-02-05 20:15:38.047401','11','Enterprise baterie 0',1,'[{\"added\": {}}]',13,1),(92,'2017-02-05 20:15:50.491372','12','Enterprise spirytus 2',1,'[{\"added\": {}}]',13,1),(93,'2017-02-05 20:16:04.147113','13','Nostromo krewetki 2',1,'[{\"added\": {}}]',13,1),(94,'2017-02-05 20:16:14.108538','14','Nostromo kocia karma 1',1,'[{\"added\": {}}]',13,1),(95,'2017-02-05 20:16:36.751777','15','Nostromo baterie 2',1,'[{\"added\": {}}]',13,1),(96,'2017-02-05 20:16:47.300574','16','Nostromo spirytus 2',1,'[{\"added\": {}}]',13,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(4,'auth','permission'),(2,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(15,'st_app','event'),(14,'st_app','eventeffect'),(10,'st_app','planet'),(12,'st_app','planetproduct'),(7,'st_app','player'),(9,'st_app','product'),(11,'st_app','ship'),(13,'st_app','shipproduct'),(8,'st_app','stage');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-01-20 19:06:03.929441'),(2,'auth','0001_initial','2017-01-20 19:06:10.316750'),(3,'admin','0001_initial','2017-01-20 19:06:11.786103'),(4,'admin','0002_logentry_remove_auto_add','2017-01-20 19:06:11.913559'),(5,'contenttypes','0002_remove_content_type_name','2017-01-20 19:06:12.799604'),(6,'auth','0002_alter_permission_name_max_length','2017-01-20 19:06:12.950506'),(7,'auth','0003_alter_user_email_max_length','2017-01-20 19:06:13.118488'),(8,'auth','0004_alter_user_username_opts','2017-01-20 19:06:13.192234'),(9,'auth','0005_alter_user_last_login_null','2017-01-20 19:06:13.626065'),(10,'auth','0006_require_contenttypes_0002','2017-01-20 19:06:13.676957'),(11,'auth','0007_alter_validators_add_error_messages','2017-01-20 19:06:13.762507'),(12,'auth','0008_alter_user_username_max_length','2017-01-20 19:06:14.061308'),(13,'sessions','0001_initial','2017-01-20 19:06:14.558555'),(14,'st_app','0001_initial','2017-01-20 19:06:21.245009'),(15,'st_app','0002_auto_20170120_2215','2017-01-20 22:15:41.071376'),(16,'st_app','0003_event_eventeffect','2017-01-25 09:38:44.005501'),(17,'st_app','0004_eventeffect_quantity','2017-01-25 09:41:37.309149'),(18,'st_app','0005_auto_20170125_0945','2017-01-25 09:45:27.900931'),(19,'st_app','0006_auto_20170125_1648','2017-01-25 16:48:31.178924');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('08waqvov5o8ra4etyg3p88tn272ckfht','YTUwMDAyOTI5ODJmNzNiNmM1ODExNzM5NjkzZjhjNzg2YzMzNGYwZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzEyODgwZTkxMmVhZWI3NDkwNGIzMWE0ODg1ZDU2NzEzOTkxMzgwIn0=','2017-02-03 19:07:39.864328'),('988a6p8uqv13457r2ft6h81agw61w4qe','YTUwMDAyOTI5ODJmNzNiNmM1ODExNzM5NjkzZjhjNzg2YzMzNGYwZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMzEyODgwZTkxMmVhZWI3NDkwNGIzMWE0ODg1ZDU2NzEzOTkxMzgwIn0=','2017-02-04 18:54:59.442121'),('9g53gztmuibrvy1do19fn8iebq1n0ujt','ZTVlNWYxMTU1YjQ3MGU0YjExZDdiMjU2ZjA0NWZhMzMyNjZmY2MwNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjMxMjg4MGU5MTJlYWViNzQ5MDRiMzFhNDg4NWQ1NjcxMzk5MTM4MCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-02-19 10:48:42.408728'),('bs65syct92hk7nm51fr5dtoicoooetcx','NDhmMzQ3ZTIwNmFhZmUwMDEzYzNkOTNjNzVjY2VmYWYxNmE2OGExMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJmMzEyODgwZTkxMmVhZWI3NDkwNGIzMWE0ODg1ZDU2NzEzOTkxMzgwIn0=','2017-02-16 21:48:38.734354'),('m6eehy04c4glnt247ar4i665q39xvose','YWRmYmI1MTE0NzhjNjQ4OTAyMTU3MDFmODNmMDBiYzc0NGMzYTBiNTp7Il9hdXRoX3VzZXJfaGFzaCI6ImYzMTI4ODBlOTEyZWFlYjc0OTA0YjMxYTQ4ODVkNTY3MTM5OTEzODAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-02-05 00:00:30.182314'),('zt1dososyvnpmjix0i5ipe73eyebxftn','NDhmMzQ3ZTIwNmFhZmUwMDEzYzNkOTNjNzVjY2VmYWYxNmE2OGExMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJmMzEyODgwZTkxMmVhZWI3NDkwNGIzMWE0ODg1ZDU2NzEzOTkxMzgwIn0=','2017-02-06 20:33:35.899704');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_app_event`
--

DROP TABLE IF EXISTS `st_app_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_app_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `event_name` varchar(32) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_app_event`
--

LOCK TABLES `st_app_event` WRITE;
/*!40000 ALTER TABLE `st_app_event` DISABLE KEYS */;
INSERT INTO `st_app_event` VALUES (1,1,'Pirates','static/content/pirates.png','Atak piratow'),(2,2,'Girl','static/content/lady.png','You meet a girl');
/*!40000 ALTER TABLE `st_app_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_app_eventeffect`
--

DROP TABLE IF EXISTS `st_app_eventeffect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_app_eventeffect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stage` int(11) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `event_id` int(11) NOT NULL,
  `quantity` int(11),
  PRIMARY KEY (`id`),
  UNIQUE KEY `event_id` (`event_id`),
  CONSTRAINT `st_app_eventeffect_event_id_50bf5e18_fk_st_app_event_id` FOREIGN KEY (`event_id`) REFERENCES `st_app_event` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_app_eventeffect`
--

LOCK TABLES `st_app_eventeffect` WRITE;
/*!40000 ALTER TABLE `st_app_eventeffect` DISABLE KEYS */;
INSERT INTO `st_app_eventeffect` VALUES (1,1,NULL,2,NULL),(2,1,-50,1,-5);
/*!40000 ALTER TABLE `st_app_eventeffect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_app_eventeffect_product`
--

DROP TABLE IF EXISTS `st_app_eventeffect_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_app_eventeffect_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventeffect_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `st_app_eventeffect_product_eventeffect_id_05f84e1a_uniq` (`eventeffect_id`,`product_id`),
  KEY `st_app_eventeffect_prod_product_id_3fb09879_fk_st_app_product_id` (`product_id`),
  CONSTRAINT `st_app_eventeff_eventeffect_id_9005fd94_fk_st_app_eventeffect_id` FOREIGN KEY (`eventeffect_id`) REFERENCES `st_app_eventeffect` (`id`),
  CONSTRAINT `st_app_eventeffect_prod_product_id_3fb09879_fk_st_app_product_id` FOREIGN KEY (`product_id`) REFERENCES `st_app_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_app_eventeffect_product`
--

LOCK TABLES `st_app_eventeffect_product` WRITE;
/*!40000 ALTER TABLE `st_app_eventeffect_product` DISABLE KEYS */;
INSERT INTO `st_app_eventeffect_product` VALUES (2,2,1);
/*!40000 ALTER TABLE `st_app_eventeffect_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_app_planet`
--

DROP TABLE IF EXISTS `st_app_planet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_app_planet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `planet_name` varchar(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_app_planet`
--

LOCK TABLES `st_app_planet` WRITE;
/*!40000 ALTER TABLE `st_app_planet` DISABLE KEYS */;
INSERT INTO `st_app_planet` VALUES (1,'Krypton'),(2,'Solaris'),(3,'Pandora'),(4,'Genezis');
/*!40000 ALTER TABLE `st_app_planet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_app_planetproduct`
--

DROP TABLE IF EXISTS `st_app_planetproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_app_planetproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actual_price` int(11) DEFAULT NULL,
  `planet_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `st_app_planetproduct_planet_id_30edc789_fk_st_app_planet_id` (`planet_id`),
  KEY `st_app_planetproduct_9bea82de` (`product_id`),
  CONSTRAINT `st_app_planetproduct_planet_id_30edc789_fk_st_app_planet_id` FOREIGN KEY (`planet_id`) REFERENCES `st_app_planet` (`id`),
  CONSTRAINT `st_app_planetproduct_product_id_4acaffc2_fk_st_app_product_id` FOREIGN KEY (`product_id`) REFERENCES `st_app_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_app_planetproduct`
--

LOCK TABLES `st_app_planetproduct` WRITE;
/*!40000 ALTER TABLE `st_app_planetproduct` DISABLE KEYS */;
INSERT INTO `st_app_planetproduct` VALUES (1,50,1,4),(2,80,1,2),(3,32,1,3),(4,72,1,1),(5,29,2,1),(6,73,2,2),(7,98,2,3),(8,44,2,4),(9,39,3,1),(10,41,3,2),(11,75,3,3),(12,90,3,4),(13,3,4,1),(14,98,4,2),(15,73,4,3),(16,35,4,4);
/*!40000 ALTER TABLE `st_app_planetproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_app_player`
--

DROP TABLE IF EXISTS `st_app_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_app_player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nick` varchar(12) NOT NULL,
  `creation_date` datetime(6) NOT NULL,
  `money` int(11) NOT NULL,
  `ship_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `st_app_player_912b2948` (`ship_id`),
  CONSTRAINT `st_app_player_ship_id_3e2f77c1_fk_st_app_ship_id` FOREIGN KEY (`ship_id`) REFERENCES `st_app_ship` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_app_player`
--

LOCK TABLES `st_app_player` WRITE;
/*!40000 ALTER TABLE `st_app_player` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_app_player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_app_product`
--

DROP TABLE IF EXISTS `st_app_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_app_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(12) NOT NULL,
  `how_many_space` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_app_product`
--

LOCK TABLES `st_app_product` WRITE;
/*!40000 ALTER TABLE `st_app_product` DISABLE KEYS */;
INSERT INTO `st_app_product` VALUES (1,'krewetki',4),(2,'kocia karma',2),(3,'baterie',6),(4,'spirytus',9);
/*!40000 ALTER TABLE `st_app_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_app_ship`
--

DROP TABLE IF EXISTS `st_app_ship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_app_ship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ship_name` varchar(12) NOT NULL,
  `capacity` int(11) NOT NULL,
  `attack` int(11) NOT NULL,
  `defence` int(11) NOT NULL,
  `speed` int(11) NOT NULL,
  `planet_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `st_app_ship_planet_id_f17c4292_fk_st_app_planet_id` (`planet_id`),
  CONSTRAINT `st_app_ship_planet_id_f17c4292_fk_st_app_planet_id` FOREIGN KEY (`planet_id`) REFERENCES `st_app_planet` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_app_ship`
--

LOCK TABLES `st_app_ship` WRITE;
/*!40000 ALTER TABLE `st_app_ship` DISABLE KEYS */;
INSERT INTO `st_app_ship` VALUES (1,'Falcon',100,6,5,4,3),(2,'Statek matka',150,3,7,2,1),(3,'Enterprise',70,5,2,7,1),(4,'Nostromo',120,2,6,6,2);
/*!40000 ALTER TABLE `st_app_ship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_app_shipproduct`
--

DROP TABLE IF EXISTS `st_app_shipproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_app_shipproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `ship_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `st_app_shipproduct_product_id_369c983a_fk_st_app_product_id` (`product_id`),
  KEY `st_app_shipproduct_ship_id_9a21b089_fk_st_app_ship_id` (`ship_id`),
  CONSTRAINT `st_app_shipproduct_product_id_369c983a_fk_st_app_product_id` FOREIGN KEY (`product_id`) REFERENCES `st_app_product` (`id`),
  CONSTRAINT `st_app_shipproduct_ship_id_9a21b089_fk_st_app_ship_id` FOREIGN KEY (`ship_id`) REFERENCES `st_app_ship` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_app_shipproduct`
--

LOCK TABLES `st_app_shipproduct` WRITE;
/*!40000 ALTER TABLE `st_app_shipproduct` DISABLE KEYS */;
INSERT INTO `st_app_shipproduct` VALUES (1,2,1,1),(2,1,2,1),(3,5,3,1),(4,1,4,1),(5,2,1,2),(6,1,2,2),(7,2,3,2),(8,2,4,2),(9,1,1,3),(10,2,2,3),(11,0,3,3),(12,2,4,3),(13,2,1,4),(14,1,2,4),(15,2,3,4),(16,2,4,4);
/*!40000 ALTER TABLE `st_app_shipproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_app_stage`
--

DROP TABLE IF EXISTS `st_app_stage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_app_stage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stage_number` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `st_app_stage_player_id_cc8e7eaa_fk_st_app_player_id` (`player_id`),
  CONSTRAINT `st_app_stage_player_id_cc8e7eaa_fk_st_app_player_id` FOREIGN KEY (`player_id`) REFERENCES `st_app_player` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_app_stage`
--

LOCK TABLES `st_app_stage` WRITE;
/*!40000 ALTER TABLE `st_app_stage` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_app_stage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-05 21:18:27
