-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: smartroof
-- ------------------------------------------------------
-- Server version	5.6.29

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
-- Table structure for table `boolean`
--

DROP TABLE IF EXISTS `boolean`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boolean` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boolean`
--

LOCK TABLES `boolean` WRITE;
/*!40000 ALTER TABLE `boolean` DISABLE KEYS */;
INSERT INTO `boolean` VALUES (1,0,'Disabled'),(2,1,'Enabled');
/*!40000 ALTER TABLE `boolean` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `panels`
--

DROP TABLE IF EXISTS `panels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `panels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `panel_name` varchar(45) NOT NULL,
  `installed_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `x_points` varchar(45) NOT NULL,
  `y_points` varchar(45) NOT NULL,
  `sensor` int(11) DEFAULT NULL,
  `heat` bit(1) NOT NULL DEFAULT b'0',
  `rain` bit(1) NOT NULL DEFAULT b'0',
  `wind` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `panel_name_UNIQUE` (`panel_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panels`
--

LOCK TABLES `panels` WRITE;
/*!40000 ALTER TABLE `panels` DISABLE KEYS */;
INSERT INTO `panels` VALUES (1,'panel name','2016-04-23 23:36:28','1,1','1,4',NULL,'','','');
/*!40000 ALTER TABLE `panels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensors`
--

DROP TABLE IF EXISTS `sensors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensors` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `sensor_name` varchar(30) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `x` int(10) unsigned NOT NULL,
  `y` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sensor_name_UNIQUE` (`sensor_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensors`
--

LOCK TABLES `sensors` WRITE;
/*!40000 ALTER TABLE `sensors` DISABLE KEYS */;
/*!40000 ALTER TABLE `sensors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `idsettings` int(11) NOT NULL AUTO_INCREMENT,
  `settingscol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idsettings`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiles`
--

DROP TABLE IF EXISTS `tiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `x` int(10) unsigned NOT NULL,
  `y` int(10) unsigned NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiles`
--

LOCK TABLES `tiles` WRITE;
/*!40000 ALTER TABLE `tiles` DISABLE KEYS */;
INSERT INTO `tiles` VALUES (1,1,1,'name');
/*!40000 ALTER TABLE `tiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utci`
--

DROP TABLE IF EXISTS `utci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utci` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recorded_time` datetime NOT NULL,
  `sun` float NOT NULL,
  `smartroof` float NOT NULL,
  `ambient` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=317 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utci`
--

LOCK TABLES `utci` WRITE;
/*!40000 ALTER TABLE `utci` DISABLE KEYS */;
INSERT INTO `utci` VALUES (1,'2016-08-13 23:00:00',15.93,15.93,18.6),(2,'2016-08-26 11:00:00',20.9,18.79,21),(3,'2016-08-14 00:00:00',15.01,15.01,17.5),(4,'2016-08-14 01:00:00',13.81,13.81,16.7),(5,'2016-08-14 02:00:00',13.94,13.94,16.8),(6,'2016-08-14 03:00:00',13.89,13.89,16.5),(7,'2016-08-14 04:00:00',13.19,13.19,15.7),(8,'2016-08-14 05:00:00',12.65,12.65,15.2),(9,'2016-08-14 06:00:00',11.95,11.94,14.5),(10,'2016-08-14 07:00:00',11.85,11.36,13.9),(11,'2016-08-14 08:00:00',16.37,14.38,16.3),(12,'2016-08-14 09:00:00',21.18,17.58,19.3),(13,'2016-08-14 10:00:00',25.31,20.14,22.3),(14,'2016-08-14 11:00:00',28.64,22.19,25.1),(15,'2016-08-14 12:00:00',31.37,23.98,27.1),(16,'2016-08-13 23:00:00',15.93,15.93,18.6),(17,'2016-08-14 00:00:00',15.01,15.01,17.5),(18,'2016-08-14 01:00:00',13.81,13.81,16.7),(19,'2016-08-14 02:00:00',13.94,13.94,16.8),(20,'2016-08-14 03:00:00',13.89,13.89,16.5),(21,'2016-08-14 04:00:00',13.19,13.19,15.7),(22,'2016-08-14 05:00:00',12.65,12.65,15.2),(23,'2016-08-14 06:00:00',11.95,11.94,14.5),(24,'2016-08-14 07:00:00',11.85,11.36,13.9),(25,'2016-08-14 08:00:00',16.37,14.38,16.3),(26,'2016-08-14 09:00:00',21.18,17.58,19.3),(27,'2016-08-14 10:00:00',25.31,20.14,22.3),(28,'2016-08-14 11:00:00',28.64,22.19,25.1),(29,'2016-08-14 12:00:00',31.37,23.98,27.1),(30,'2016-08-14 13:00:00',33.21,25.28,28.9),(31,'2016-08-14 14:00:00',33.59,25.79,30),(32,'2016-08-14 15:00:00',32.47,25.33,29.7),(33,'2016-08-14 16:00:00',31.14,25.01,29.6),(34,'2016-08-14 17:00:00',28.79,23.97,28.9),(35,'2016-08-14 18:00:00',25.68,22.36,27.6),(36,'2016-08-14 19:00:00',23.78,21.73,27),(37,'2016-08-14 20:00:00',22.64,21.49,26),(38,'2016-08-14 21:00:00',21,20.4,24),(39,'2016-08-14 22:00:00',20,19.55,23),(40,'2016-08-14 23:00:00',19.36,19.07,22),(41,'2016-08-15 00:00:00',17.78,17.73,20.4),(42,'2016-08-15 01:00:00',16.98,16.98,19.9),(43,'2016-08-15 02:00:00',17.01,17.01,19.3),(44,'2016-08-15 03:00:00',16.88,16.88,19),(45,'2016-08-15 04:00:00',16.07,16.07,18.6),(46,'2016-08-15 05:00:00',15.51,15.51,18.1),(47,'2016-08-15 06:00:00',15.23,15.22,17.8),(48,'2016-08-15 07:00:00',15.67,15.22,17.5),(49,'2016-08-15 08:00:00',17.87,15.99,18.3),(50,'2016-08-15 09:00:00',22.96,19.34,21.9),(51,'2016-08-15 10:00:00',26.83,21.54,25.2),(52,'2016-08-15 11:00:00',30.31,23.71,28),(53,'2016-08-15 12:00:00',33.45,25.9,30.1),(54,'2016-08-15 13:00:00',35.63,27.57,31.7),(55,'2016-08-15 14:00:00',36.53,28.5,32.8),(56,'2016-08-15 15:00:00',36.36,28.86,33.3),(57,'2016-08-15 16:00:00',35.43,29,33.2),(58,'2016-08-15 17:00:00',33.88,28.52,32.5),(59,'2016-08-15 18:00:00',30.94,26.81,31.4),(60,'2016-08-15 19:00:00',27.5,24.78,29.6),(61,'2016-08-15 20:00:00',25.36,23.98,27.5),(62,'2016-08-15 21:00:00',22.95,22.22,25),(63,'2016-08-15 22:00:00',20.97,20.54,23),(64,'2016-08-15 23:00:00',19.75,19.55,21.4),(65,'2016-08-16 00:00:00',19.42,19.34,20.6),(66,'2016-08-16 01:00:00',19.47,19.47,20),(67,'2016-08-16 02:00:00',19.09,19.09,19.3),(68,'2016-08-16 03:00:00',18.21,18.21,18.3),(69,'2016-08-16 04:00:00',17.24,17.24,17.3),(70,'2016-08-16 05:00:00',16.68,16.68,16.9),(71,'2016-08-16 06:00:00',16.05,16.04,17),(72,'2016-08-16 07:00:00',16.02,15.75,17.3),(73,'2016-08-16 08:00:00',18.8,17.72,19.3),(74,'2016-08-16 09:00:00',20.43,18.54,19.8),(75,'2016-08-16 10:00:00',20.7,18.18,18.6),(76,'2016-08-16 11:00:00',21.26,18.53,18.6),(77,'2016-08-16 12:00:00',21.13,18.57,18.8),(78,'2016-08-16 13:00:00',20.35,18.25,18.7),(79,'2016-08-16 14:00:00',23.77,19.53,19.6),(80,'2016-08-16 15:00:00',26.95,21.57,21.4),(81,'2016-08-16 16:00:00',28.16,22.63,22.6),(82,'2016-08-16 17:00:00',26.84,22.83,23.5),(83,'2016-08-16 18:00:00',25.57,23.1,24.1),(84,'2016-08-16 19:00:00',22.97,21.86,23.1),(85,'2016-08-16 20:00:00',20.63,20.29,21.6),(86,'2016-08-16 21:00:00',19.1,19.02,20.6),(87,'2016-08-16 22:00:00',16.89,16.89,19.3),(88,'2016-08-16 23:00:00',15.89,15.89,18.3),(89,'2016-08-17 00:00:00',15.81,15.81,17.5),(90,'2016-08-17 01:00:00',15.14,15.14,16.5),(91,'2016-08-17 02:00:00',14.3,14.3,15.5),(92,'2016-08-17 03:00:00',13.89,13.89,15),(93,'2016-08-17 04:00:00',14.02,14.02,15),(94,'2016-08-17 05:00:00',13.78,13.78,14.5),(95,'2016-08-17 06:00:00',13.62,13.62,14.5),(96,'2016-08-17 07:00:00',13.59,13.38,14.7),(97,'2016-08-17 08:00:00',14.92,14,14.9),(98,'2016-08-17 09:00:00',16.88,15.06,15.6),(99,'2016-08-17 10:00:00',18.49,15.85,16.4),(100,'2016-08-17 11:00:00',23.56,19.02,19.4),(101,'2016-08-17 12:00:00',28.11,21.92,22.9),(102,'2016-08-17 13:00:00',31.04,23.72,25.2),(103,'2016-08-17 14:00:00',31.65,24.72,27),(104,'2016-08-17 15:00:00',29.93,23.89,27.3),(105,'2016-08-17 16:00:00',27.24,22.56,26.9),(106,'2016-08-17 17:00:00',24.98,21.47,25.7),(107,'2016-08-17 18:00:00',21.28,19.13,23.6),(108,'2016-08-17 19:00:00',19.22,18.23,22.1),(109,'2016-08-17 20:00:00',18.77,18.52,20.7),(110,'2016-08-17 21:00:00',17.9,17.9,19.5),(111,'2016-08-17 22:00:00',17.45,17.45,18.8),(112,'2016-08-17 23:00:00',16.66,16.66,17.9),(113,'2016-08-18 00:00:00',16.46,16.46,17.5),(114,'2016-08-18 01:00:00',14.87,14.87,16.3),(115,'2016-08-18 02:00:00',13.39,13.39,15),(116,'2016-08-18 03:00:00',13.78,13.78,15),(117,'2016-08-18 04:00:00',13.43,13.43,14.9),(118,'2016-08-18 05:00:00',13.08,13.08,14.4),(119,'2016-08-18 06:00:00',12.59,12.59,13.8),(120,'2016-08-18 07:00:00',13.81,13.42,14.7),(121,'2016-08-18 08:00:00',17.26,15.42,16.8),(122,'2016-08-18 09:00:00',20.8,17.21,18.7),(123,'2016-08-18 10:00:00',24.72,19.51,20.9),(124,'2016-08-18 11:00:00',28.51,21.92,23.3),(125,'2016-08-18 12:00:00',31.45,24.02,25.2),(126,'2016-08-18 13:00:00',33.42,25.61,26.8),(127,'2016-08-18 14:00:00',34.13,26.25,27.7),(128,'2016-08-18 15:00:00',33.94,26.45,28.3),(129,'2016-08-18 16:00:00',32.94,26.28,28.5),(130,'2016-08-18 17:00:00',30.02,24.7,27.1),(131,'2016-08-18 18:00:00',26,22.3,26),(132,'2016-08-18 19:00:00',22.82,20.76,24.8),(133,'2016-08-18 20:00:00',20.17,19.62,22.4),(134,'2016-08-18 21:00:00',17.74,17.74,19.9),(135,'2016-08-18 22:00:00',16.82,16.82,18.9),(136,'2016-08-18 23:00:00',16.39,16.39,18.4),(137,'2016-08-19 00:00:00',15.78,15.78,18),(138,'2016-08-19 01:00:00',15.22,15.22,17.9),(139,'2016-08-19 02:00:00',14.39,14.39,16.8),(140,'2016-08-19 03:00:00',13.62,13.62,16),(141,'2016-08-19 04:00:00',12.45,12.45,15.3),(142,'2016-08-19 05:00:00',11.87,11.87,14.8),(143,'2016-08-19 06:00:00',12.59,12.59,15),(144,'2016-08-19 07:00:00',13.65,13.28,15.1),(145,'2016-08-19 08:00:00',16.84,15.04,16.8),(146,'2016-08-19 09:00:00',21.75,18.3,19.7),(147,'2016-08-19 10:00:00',26.97,21.76,22.8),(148,'2016-08-19 11:00:00',31.09,24.79,25.9),(149,'2016-08-19 12:00:00',33.63,26.9,28.4),(150,'2016-08-19 13:00:00',34.08,27.56,29.7),(151,'2016-08-19 14:00:00',34.2,27.84,30.5),(152,'2016-08-19 15:00:00',34.21,28.33,31.2),(153,'2016-08-19 16:00:00',32.8,27.77,30.9),(154,'2016-08-19 17:00:00',31.99,27.41,30.5),(155,'2016-08-19 18:00:00',31.02,27.33,30.3),(156,'2016-08-19 19:00:00',27.07,24.87,27.8),(157,'2016-08-19 20:00:00',23.93,22.97,25.8),(158,'2016-08-19 21:00:00',22.23,21.68,24.1),(159,'2016-08-19 22:00:00',20.71,20.46,22),(160,'2016-08-19 23:00:00',19.89,19.77,21),(161,'2016-08-10 00:00:00',19.67,19.61,20.5),(162,'2016-08-10 01:00:00',19.19,19.19,19.7),(163,'2016-08-10 02:00:00',17.32,17.32,18.2),(164,'2016-08-10 03:00:00',16.44,16.44,17.5),(165,'2016-08-10 04:00:00',17.33,17.33,17.9),(166,'2016-08-10 05:00:00',16.89,16.89,17.4),(167,'2016-08-10 06:00:00',15.96,15.96,16.5),(168,'2016-08-10 07:00:00',15.83,15.61,16.1),(169,'2016-08-10 08:00:00',18.37,17.05,17.6),(170,'2016-08-10 09:00:00',22.21,19.39,19.8),(171,'2016-08-10 10:00:00',27.48,22.84,23.9),(172,'2016-08-10 11:00:00',32.02,26.23,28),(173,'2016-08-10 12:00:00',33.24,26.81,28.8),(174,'2016-08-10 13:00:00',34.19,27.63,29.5),(175,'2016-08-10 14:00:00',36.49,29.13,31.3),(176,'2016-08-10 15:00:00',37.77,30.15,33.2),(177,'2016-08-10 16:00:00',37.27,30.21,33.4),(178,'2016-08-10 17:00:00',35.72,29.87,32.9),(179,'2016-08-10 18:00:00',32.66,28.36,31.5),(180,'2016-08-10 19:00:00',28.88,26.22,29.7),(181,'2016-08-10 20:00:00',25.34,24.06,27.4),(182,'2016-08-10 21:00:00',23.5,22.71,25.5),(183,'2016-08-10 22:00:00',22.45,21.83,24.4),(184,'2016-08-10 23:00:00',20.85,20.44,22.9),(185,'2016-08-21 00:00:00',19.4,19.27,21),(186,'2016-08-21 01:00:00',18.81,18.81,19.6),(187,'2016-08-21 02:00:00',18.87,18.87,19.9),(188,'2016-08-21 03:00:00',17.89,17.89,19.5),(189,'2016-08-21 04:00:00',16.95,16.95,18.6),(190,'2016-08-21 05:00:00',15.97,15.97,18.1),(191,'2016-08-21 06:00:00',15.39,15.39,17.5),(192,'2016-08-21 07:00:00',15.96,15.64,17.5),(193,'2016-08-21 08:00:00',20.27,18.52,20.3),(194,'2016-08-21 09:00:00',24.3,20.64,22.7),(195,'2016-08-21 10:00:00',28.07,22.76,25.1),(196,'2016-08-21 11:00:00',31.88,25.25,27.6),(197,'2016-08-21 12:00:00',35.18,27.58,29.7),(198,'2016-08-21 13:00:00',37.7,29.54,31.5),(199,'2016-08-21 14:00:00',38.49,30.3,32.1),(200,'2016-08-21 15:00:00',38.3,30.57,32.3),(201,'2016-08-21 16:00:00',37.42,30.52,32.5),(202,'2016-08-21 17:00:00',36.04,30.34,32.5),(203,'2016-08-21 18:00:00',33.18,28.99,31.5),(204,'2016-08-21 19:00:00',29.01,26.47,29.5),(205,'2016-08-21 20:00:00',25.51,24.27,27.3),(206,'2016-08-21 21:00:00',23.95,23.21,25.5),(207,'2016-08-21 22:00:00',22.5,21.97,23.9),(208,'2016-08-21 23:00:00',21.16,20.73,23),(209,'2016-08-22 00:00:00',20.52,20.16,22.5),(210,'2016-08-22 01:00:00',20.45,20.15,22.1),(211,'2016-08-22 02:00:00',19.86,19.65,21.5),(212,'2016-08-22 03:00:00',18.82,18.75,20.5),(213,'2016-08-22 04:00:00',17.94,17.94,19.5),(214,'2016-08-22 05:00:00',17.02,17.02,18.8),(215,'2016-08-22 06:00:00',16.01,16.01,18.2),(216,'2016-08-22 07:00:00',15.6,15.41,17.9),(217,'2016-08-22 08:00:00',18.07,16.6,18.8),(218,'2016-08-22 09:00:00',22.21,18.86,20.7),(219,'2016-08-22 10:00:00',25.96,20.84,22.5),(220,'2016-08-22 11:00:00',29.36,23,24.5),(221,'2016-08-22 12:00:00',32.19,25.12,26.6),(222,'2016-08-22 13:00:00',34.03,26.81,28.4),(223,'2016-08-22 14:00:00',34.48,27.15,28.9),(224,'2016-08-22 15:00:00',34.26,27.24,29.1),(225,'2016-08-22 16:00:00',33.52,27.24,29.4),(226,'2016-08-22 17:00:00',30.01,25.04,27.5),(227,'2016-08-22 18:00:00',26.75,23.3,25.9),(228,'2016-08-22 19:00:00',23.39,21.53,24.7),(229,'2016-08-22 20:00:00',20.03,19.42,23),(230,'2016-08-22 21:00:00',17.4,17.26,21),(231,'2016-08-22 22:00:00',15.56,15.56,19.2),(232,'2016-08-22 23:00:00',14.35,14.35,18.3),(233,'2016-08-23 00:00:00',13.02,13.02,17.5),(234,'2016-08-23 01:00:00',12.73,12.73,16.1),(235,'2016-08-23 02:00:00',12.93,12.93,15.1),(236,'2016-08-23 03:00:00',12.96,12.96,14.5),(237,'2016-08-23 04:00:00',12.11,12.11,13.4),(238,'2016-08-23 05:00:00',11.05,11.05,12.2),(239,'2016-08-23 06:00:00',11.11,11.11,12.4),(240,'2016-08-23 07:00:00',12.08,11.77,13.2),(241,'2016-08-23 08:00:00',15.95,14.15,15),(242,'2016-08-23 09:00:00',20.91,17.37,17.7),(243,'2016-08-23 10:00:00',25.18,20.17,20.1),(244,'2016-08-23 11:00:00',29.03,22.71,22.9),(245,'2016-08-23 12:00:00',31.68,24.55,25.2),(246,'2016-08-23 13:00:00',32.69,25.19,25.9),(247,'2016-08-23 14:00:00',33.27,25.74,27.1),(248,'2016-08-23 15:00:00',32.51,25.4,27.7),(249,'2016-08-23 16:00:00',31.1,24.82,27.3),(250,'2016-08-23 17:00:00',29.04,23.96,26.7),(251,'2016-08-23 18:00:00',26.67,23.13,26),(252,'2016-08-23 19:00:00',23.81,21.96,24.7),(253,'2016-08-23 20:00:00',20.98,20.44,22.9),(254,'2016-08-23 21:00:00',19.2,19.07,21),(255,'2016-08-23 22:00:00',17.63,17.63,19.9),(256,'2016-08-23 23:00:00',15.96,15.96,19.5),(257,'2016-08-24 00:00:00',14.76,14.76,18.5),(258,'2016-08-24 01:00:00',14.24,14.24,17.2),(259,'2016-08-24 02:00:00',13.18,13.18,15.6),(260,'2016-08-24 03:00:00',11.77,11.77,14.5),(261,'2016-08-24 04:00:00',10.98,10.98,13.5),(262,'2016-08-24 05:00:00',10.42,10.42,12.5),(263,'2016-08-24 06:00:00',9.608,9.608,11.8),(264,'2016-08-24 07:00:00',10.47,10.28,12.3),(265,'2016-08-24 08:00:00',14.68,13.25,14.9),(266,'2016-08-24 09:00:00',19.81,16.57,18),(267,'2016-08-24 10:00:00',24.87,19.83,21.2),(268,'2016-08-24 11:00:00',28.73,22.29,24.1),(269,'2016-08-24 12:00:00',31.12,23.77,25.8),(270,'2016-08-24 13:00:00',33.23,25.41,27.6),(271,'2016-08-24 14:00:00',34.74,26.9,29.5),(272,'2016-08-24 15:00:00',34.3,26.99,29.7),(273,'2016-08-24 16:00:00',32.73,26.42,29.5),(274,'2016-08-24 17:00:00',30.75,25.56,28.9),(275,'2016-08-24 18:00:00',28.03,24.32,27.8),(276,'2016-08-24 19:00:00',24.72,22.57,26.8),(277,'2016-08-24 20:00:00',20.9,20.09,24.4),(278,'2016-08-24 21:00:00',19.22,18.86,22.5),(279,'2016-08-24 22:00:00',18.23,18.01,21.5),(280,'2016-08-24 23:00:00',17.26,17.17,20.6),(281,'2016-08-25 00:00:00',15.91,15.91,19.1),(282,'2016-08-25 01:00:00',14.03,14.03,16.9),(283,'2016-08-25 02:00:00',12.9,12.9,15.4),(284,'2016-08-25 03:00:00',11.94,11.94,14.5),(285,'2016-08-25 04:00:00',11.2,11.2,13.8),(286,'2016-08-25 05:00:00',11,11,13.4),(287,'2016-08-25 06:00:00',9.475,9.475,12.9),(288,'2016-08-25 07:00:00',8.646,8.522,13.1),(289,'2016-08-25 08:00:00',11.69,10.78,14.4),(290,'2016-08-25 09:00:00',15.35,13.29,16.2),(291,'2016-08-25 10:00:00',19.32,16.06,18.3),(292,'2016-08-25 11:00:00',22.63,18.88,20.9),(293,'2016-08-25 12:00:00',23.83,19.83,22.6),(294,'2016-08-25 13:00:00',23.83,20.02,22.8),(295,'2016-08-25 14:00:00',24.35,21,23.1),(296,'2016-08-25 15:00:00',24.05,21.36,23.5),(297,'2016-08-25 16:00:00',21.86,20.02,22.8),(298,'2016-08-25 17:00:00',21.17,19.44,22),(299,'2016-08-25 18:00:00',20.77,19.43,21.6),(300,'2016-08-25 19:00:00',19.53,18.8,21.4),(301,'2016-08-25 20:00:00',17.91,17.85,20),(302,'2016-08-25 21:00:00',18.39,18.39,19),(303,'2016-08-25 22:00:00',18.52,18.52,18.7),(304,'2016-08-25 23:00:00',17.04,17.04,18.2),(305,'2016-08-26 00:00:00',16.64,16.64,18),(306,'2016-08-26 01:00:00',16.89,16.89,17.8),(307,'2016-08-26 02:00:00',16.39,16.39,17.3),(308,'2016-08-26 03:00:00',16.16,16.16,17),(309,'2016-08-26 04:00:00',16.03,16.03,17.1),(310,'2016-08-26 05:00:00',15.8,15.8,17.1),(311,'2016-08-26 06:00:00',15.47,15.47,17),(312,'2016-08-26 07:00:00',15.51,15.45,17.2),(313,'2016-08-26 08:00:00',16.61,16.22,18),(314,'2016-08-26 09:00:00',17.86,17.05,19),(315,'2016-08-26 10:00:00',18.9,17.69,19.7),(316,'2016-08-26 11:00:00',20.9,18.79,21);
/*!40000 ALTER TABLE `utci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weather`
--

DROP TABLE IF EXISTS `weather`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weather` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data` varchar(4000) NOT NULL,
  `recorded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather`
--

LOCK TABLES `weather` WRITE;
/*!40000 ALTER TABLE `weather` DISABLE KEYS */;
INSERT INTO `weather` VALUES (1,'\"','2016-04-23 22:54:55'),(2,'\"','2016-04-23 23:08:12'),(3,'\"','2016-04-23 23:09:33'),(4,'\"','2016-04-23 23:10:00'),(5,'\n{\n  \"response\": {\n  \"version\":\"0.1\",\n  \"termsofService\":\"http://www.wunderground.com/weather/api/d/terms.html\",\n  \"features\": {\n  \"conditions\": 1\n  }\n	}\n  ,	\"current_observation\": {\n		\"image\": {\n		\"url\":\"http://icons.wxug.com/graphics/wu2/logo_130x80.png\",\n		\"title\":\"Weather Underground\",\n		\"link\":\"http://www.wunderground.com\"\n		},\n		\"display_location\": {\n		\"full\":\"Linate, Italy\",\n		\"city\":\"Linate\",\n		\"state\":\"\",\n		\"state_name\":\"Italy\",\n		\"country\":\"IY\",\n		\"country_iso3166\":\"IT\",\n		\"zip\":\"00000\",\n		\"magic\":\"6\",\n		\"wmo\":\"16080\",\n		\"latitude\":\"45.465454\",\n		\"longitude\":\"9.186516\",\n		\"elevation\":\"107.00000000\"\n		},\n		\"observation_location\": {\n		\"full\":\"Via dei Mercanti, Milano, \",\n		\"city\":\"Via dei Mercanti, Milano\",\n		\"state\":\"\",\n		\"country\":\"\",\n		\"country_iso3166\":\"IT\",\n		\"latitude\":\"45.465454\",\n		\"longitude\":\"9.186516\",\n		\"elevation\":\"423 ft\"\n		},\n		\"estimated\": {\n		},\n		\"station_id\":\"IMILANO61\",\n		\"observation_time\":\"Last Updated on April 23, 9:06 PM CEST\",\n		\"observation_time_rfc822\":\"Sat, 23 Apr 2016 21:06:34 +0200\",\n		\"observation_epoch\":\"1461438394\",\n		\"local_time_rfc822\":\"Sat, 23 Apr 2016 21:13:58 +0200\",\n		\"local_epoch\":\"1461438838\",\n		\"local_tz_short\":\"CEST\",\n		\"local_tz_long\":\"Europe/Rome\",\n		\"local_tz_offset\":\"+0200\",\n		\"weather\":\"Clear\",\n		\"temperature_string\":\"65.7 F (18.7 C)\",\n		\"temp_f\":65.7,\n		\"temp_c\":18.7,\n		\"relative_humidity\":\"73%\",\n		\"wind_string\":\"Calm\",\n		\"wind_dir\":\"North\",\n		\"wind_degrees\":-9999,\n		\"wind_mph\":-9999.0,\n		\"wind_gust_mph\":0,\n		\"wind_kph\":0,\n		\"wind_gust_kph\":0,\n		\"pressure_mb\":\"1002\",\n		\"pressure_in\":\"29.59\",\n		\"pressure_trend\":\"+\",\n		\"dewpoint_string\":\"56.9 F (13.8 C)\",\n		\"dewpoint_f\":56.9,\n		\"dewpoint_c\":13.8,\n		\"heat_index_string\":\"NA\",\n		\"heat_index_f\":\"NA\",\n		\"heat_index_c\":\"NA\",\n		\"windchill_string\":\"NA\",\n		\"windchill_f\":\"NA\",\n		\"windchill_c\":\"NA\",\n		\"feelslike_string\":\"65.7 F (18.7 C)\",\n		\"feelslike_f\":\"65.7\",\n		\"feelslike_c\":\"18.7\",\n		\"visibility_mi\":\"N/A\",\n		\"visibility_km\":\"N/A\",\n		\"solarradiation\":\"--\",\n		\"UV\":\"-1\",\"precip_1hr_string\":\"-999.00 in (-2537.5 mm)\",\n		\"precip_1hr_in\":\"-999.00\",\n		\"precip_1hr_metric\":\"--\",\n		\"precip_today_string\":\"-999.00 in (-25375 mm)\",\n		\"precip_today_in\":\"-999.00\",\n		\"precip_today_metric\":\"--\",\n		\"icon\":\"clear\",\n		\"icon_url\":\"http://icons.wxug.com/i/c/k/nt_clear.gif\",\n		\"forecast_url\":\"http://www.wunderground.com/global/stations/16080.html\",\n		\"history_url\":\"http://www.wunderground.com/weatherstation/WXDailyHistory.asp?ID=IMILANO61\",\n		\"ob_url\":\"http://www.wunderground.com/cgi-bin/findweather/getForecast?query=45.465454,9.186516\",\n		\"nowcast\":\"\"\n	}\n}\n','2016-04-23 23:13:58'),(6,'\n{\n  \"response\": {\n  \"version\":\"0.1\",\n  \"termsofService\":\"http://www.wunderground.com/weather/api/d/terms.html\",\n  \"features\": {\n  \"conditions\": 1\n  }\n	}\n  ,	\"current_observation\": {\n		\"image\": {\n		\"url\":\"http://icons.wxug.com/graphics/wu2/logo_130x80.png\",\n		\"title\":\"Weather Underground\",\n		\"link\":\"http://www.wunderground.com\"\n		},\n		\"display_location\": {\n		\"full\":\"Linate, Italy\",\n		\"city\":\"Linate\",\n		\"state\":\"\",\n		\"state_name\":\"Italy\",\n		\"country\":\"IY\",\n		\"country_iso3166\":\"IT\",\n		\"zip\":\"00000\",\n		\"magic\":\"6\",\n		\"wmo\":\"16080\",\n		\"latitude\":\"45.465454\",\n		\"longitude\":\"9.186516\",\n		\"elevation\":\"107.00000000\"\n		},\n		\"observation_location\": {\n		\"full\":\"Via dei Mercanti, Milano, \",\n		\"city\":\"Via dei Mercanti, Milano\",\n		\"state\":\"\",\n		\"country\":\"\",\n		\"country_iso3166\":\"IT\",\n		\"latitude\":\"45.465454\",\n		\"longitude\":\"9.186516\",\n		\"elevation\":\"423 ft\"\n		},\n		\"estimated\": {\n		},\n		\"station_id\":\"IMILANO61\",\n		\"observation_time\":\"Last Updated on April 23, 9:40 PM CEST\",\n		\"observation_time_rfc822\":\"Sat, 23 Apr 2016 21:40:54 +0200\",\n		\"observation_epoch\":\"1461440454\",\n		\"local_time_rfc822\":\"Sat, 23 Apr 2016 21:43:26 +0200\",\n		\"local_epoch\":\"1461440606\",\n		\"local_tz_short\":\"CEST\",\n		\"local_tz_long\":\"Europe/Rome\",\n		\"local_tz_offset\":\"+0200\",\n		\"weather\":\"Scattered Clouds\",\n		\"temperature_string\":\"65.8 F (18.8 C)\",\n		\"temp_f\":65.8,\n		\"temp_c\":18.8,\n		\"relative_humidity\":\"72%\",\n		\"wind_string\":\"Calm\",\n		\"wind_dir\":\"North\",\n		\"wind_degrees\":-9999,\n		\"wind_mph\":-9999.0,\n		\"wind_gust_mph\":0,\n		\"wind_kph\":0,\n		\"wind_gust_kph\":0,\n		\"pressure_mb\":\"1002\",\n		\"pressure_in\":\"29.59\",\n		\"pressure_trend\":\"0\",\n		\"dewpoint_string\":\"56.7 F (13.7 C)\",\n		\"dewpoint_f\":56.7,\n		\"dewpoint_c\":13.7,\n		\"heat_index_string\":\"NA\",\n		\"heat_index_f\":\"NA\",\n		\"heat_index_c\":\"NA\",\n		\"windchill_string\":\"NA\",\n		\"windchill_f\":\"NA\",\n		\"windchill_c\":\"NA\",\n		\"feelslike_string\":\"65.8 F (18.8 C)\",\n		\"feelslike_f\":\"65.8\",\n		\"feelslike_c\":\"18.8\",\n		\"visibility_mi\":\"6.2\",\n		\"visibility_km\":\"10.0\",\n		\"solarradiation\":\"--\",\n		\"UV\":\"0\",\"precip_1hr_string\":\"-999.00 in (-2537.5 mm)\",\n		\"precip_1hr_in\":\"-999.00\",\n		\"precip_1hr_metric\":\"--\",\n		\"precip_today_string\":\"-999.00 in (-25375 mm)\",\n		\"precip_today_in\":\"-999.00\",\n		\"precip_today_metric\":\"--\",\n		\"icon\":\"partlycloudy\",\n		\"icon_url\":\"http://icons.wxug.com/i/c/k/nt_partlycloudy.gif\",\n		\"forecast_url\":\"http://www.wunderground.com/global/stations/16080.html\",\n		\"history_url\":\"http://www.wunderground.com/weatherstation/WXDailyHistory.asp?ID=IMILANO61\",\n		\"ob_url\":\"http://www.wunderground.com/cgi-bin/findweather/getForecast?query=45.465454,9.186516\",\n		\"nowcast\":\"\"\n	}\n}\n','2016-04-23 23:43:26');
/*!40000 ALTER TABLE `weather` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-23 21:42:42
