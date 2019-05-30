CREATE DATABASE  IF NOT EXISTS `achievements_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `achievements_db`;
-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: achievements_db
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `achievements`
--

DROP TABLE IF EXISTS `achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `achievements` (
  `id` varchar(36) NOT NULL,
  `displayname` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `icon` varchar(2048) DEFAULT NULL,
  `displayorder` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `gameid` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `gameid_idx` (`gameid`),
  CONSTRAINT `gameid` FOREIGN KEY (`gameid`) REFERENCES `games` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievements`
--

LOCK TABLES `achievements` WRITE;
/*!40000 ALTER TABLE `achievements` DISABLE KEYS */;
INSERT INTO `achievements` VALUES ('0851c01c-1ce2-4a77-b17f-61450337df19','DN3','Desc3','www.icon.com/icon3.jpg',1,'2019-03-21 22:02:18','2019-03-21 22:02:18','2b92d33d-4c1c-11e9-b8dc-c8600077a003'),('112bdccb-0f35-4dac-b617-9b6a14c8fbab','DN2','Desc2','www.icon.com/icon2.png',2,'2019-03-21 22:01:43','2019-03-21 22:08:52','2b92d33d-4c1c-11e9-b8dc-c8600077a003'),('122b7426-9b8c-497a-a087-a8320ec1b41f','DN7','Desc7','www.icon.com/icon7.jpg',3,'2019-03-21 22:05:02','2019-03-21 22:09:47','2b92d33d-4c1c-11e9-b8dc-c8600077a003'),('40f83274-360a-4448-a028-03457f207215','DN6','Desc6','www.icon.com/icon6.png',2147483647,'2019-03-21 22:04:36','2019-03-21 22:04:36','2b92d33d-4c1c-11e9-b8dc-c8600077a003'),('77de9fc0-159a-4533-bdde-cbde027e6507','DN8','Desc8','www.icon.com/icon8.png',3,'2019-03-21 22:05:31','2019-03-21 22:10:27','d67093e9-4c1b-11e9-b8dc-c8600077a003'),('85ab7782-dcf9-446b-b184-72265d2682a9','DN4','Desc4','www.icon.com/icon4.png',1,'2019-03-21 22:02:42','2019-03-21 22:02:42','d67093e9-4c1b-11e9-b8dc-c8600077a003'),('b396d10a-58b2-412d-a312-cab791ee7e15','DN5','Desc5','www.icon.com/icon5.jpeg',2147483647,'2019-03-21 22:03:26','2019-03-21 22:03:26','d67093e9-4c1b-11e9-b8dc-c8600077a003'),('bf0aca99-e7f3-4cc1-8ba3-f34382a7b68d','DN1','Desc1','www.icon.com/icon1.jpg',2,'2019-03-21 22:00:52','2019-03-21 22:07:54','d67093e9-4c1b-11e9-b8dc-c8600077a003');
/*!40000 ALTER TABLE `achievements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `games` (
  `id` varchar(36) NOT NULL,
  `displayname` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `displayname_UNIQUE` (`displayname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES ('d67093e9-4c1b-11e9-b8dc-c8600077a003','game0'),('2b92d33d-4c1c-11e9-b8dc-c8600077a003','game1'),('3334f284-4c1c-11e9-b8dc-c8600077a003','game2');
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'achievements_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-21 22:10:58
