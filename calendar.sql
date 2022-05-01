CREATE DATABASE  IF NOT EXISTS `coneduco` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `coneduco`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: coneduco
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `calendars`
--

DROP TABLE IF EXISTS `calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendars` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idBimester` int NOT NULL,
  `idHolidaydatebyyear` int DEFAULT NULL,
  `idEventdatebyyearandbyinstution` int DEFAULT NULL,
  `idCreated` int NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idUpdated` int DEFAULT NULL,
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `idDeleted` int DEFAULT NULL,
  `deleted` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_users_id_fk_3_idx` (`idDeleted`),
  KEY `calendars_bimesters_id_fk` (`idBimester`),
  KEY `calendars_events_id_fk` (`idEventdatebyyearandbyinstution`),
  KEY `calendars_users_id_fk` (`idCreated`),
  KEY `calendars_users_id_fk_2` (`idUpdated`),
  KEY `calendars_holidays_id_fk_idx` (`idHolidaydatebyyear`),
  CONSTRAINT `calendars_bimesters_id_fk` FOREIGN KEY (`idBimester`) REFERENCES `bimesters` (`id`),
  CONSTRAINT `calendars_events_id_fk` FOREIGN KEY (`idEventdatebyyearandbyinstution`) REFERENCES `eventdatesbyyearandbyinstitution` (`id`),
  CONSTRAINT `calendars_holidays_id_fk` FOREIGN KEY (`idHolidaydatebyyear`) REFERENCES `holidaydatesbyyear` (`id`),
  CONSTRAINT `calendars_users_id_fk` FOREIGN KEY (`idCreated`) REFERENCES `users` (`id`),
  CONSTRAINT `calendars_users_id_fk_2` FOREIGN KEY (`idUpdated`) REFERENCES `users` (`id`),
  CONSTRAINT `calendars_users_id_fk_3` FOREIGN KEY (`idDeleted`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='calendario';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendars`
--

LOCK TABLES `calendars` WRITE;
/*!40000 ALTER TABLE `calendars` DISABLE KEYS */;
INSERT INTO `calendars` VALUES (1,1,1,NULL,1,'2022-04-29 17:15:35',NULL,'2022-04-29 17:15:35',NULL,NULL),(2,1,11,NULL,1,'2022-04-29 17:15:36',NULL,'2022-04-29 17:15:36',NULL,NULL),(3,1,12,NULL,1,'2022-04-29 17:15:37',NULL,'2022-04-29 17:15:37',NULL,NULL),(4,1,NULL,1,1,'2022-04-29 17:15:42',NULL,'2022-04-29 17:15:42',NULL,NULL);
/*!40000 ALTER TABLE `calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventdatesbyyearandbyinstitution`
--

DROP TABLE IF EXISTS `eventdatesbyyearandbyinstitution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventdatesbyyearandbyinstitution` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idInstitution` int NOT NULL,
  `idEvent` int NOT NULL,
  `idYear` int NOT NULL,
  `event` date NOT NULL,
  `idCreated` int NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idUpdated` int DEFAULT NULL,
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `idDeleted` int DEFAULT NULL,
  `deleted` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `events_users_id_fk` (`idCreated`),
  KEY `events_users_id_fk_2` (`idUpdated`),
  KEY `events_users_id_fk_3_idx` (`idDeleted`),
  KEY `events_institutions_id_fk_idx` (`idInstitution`),
  CONSTRAINT `events_institutions_id_fk` FOREIGN KEY (`idInstitution`) REFERENCES `institutions` (`id`),
  CONSTRAINT `events_users_id_fk` FOREIGN KEY (`idCreated`) REFERENCES `users` (`id`),
  CONSTRAINT `events_users_id_fk_2` FOREIGN KEY (`idUpdated`) REFERENCES `users` (`id`),
  CONSTRAINT `events_users_id_fk_3` FOREIGN KEY (`idDeleted`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='datas dos eventos por ano e por instituição';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventdatesbyyearandbyinstitution`
--

LOCK TABLES `eventdatesbyyearandbyinstitution` WRITE;
/*!40000 ALTER TABLE `eventdatesbyyearandbyinstitution` DISABLE KEYS */;
INSERT INTO `eventdatesbyyearandbyinstitution` VALUES (1,1,1,1,'2019-03-04',1,'2022-02-02 09:03:30',NULL,'2022-04-27 15:56:25',NULL,NULL);
/*!40000 ALTER TABLE `eventdatesbyyearandbyinstitution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='eventos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'Recesso');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holidaydatesbyyear`
--

DROP TABLE IF EXISTS `holidaydatesbyyear`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `holidaydatesbyyear` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idHoliday` int NOT NULL,
  `idYear` int NOT NULL,
  `holiday` date NOT NULL,
  `type` enum('Nacional','Estadual','Municipal','Escolar','Ponto Facutativo') NOT NULL,
  `local` varchar(100) DEFAULT NULL,
  `idCreated` int NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idUpdated` int DEFAULT NULL,
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `idDeleted` int DEFAULT NULL,
  `deleted` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `holidaydatebyyear_holiday_id_fk_idx` (`idHoliday`),
  KEY `holidaydatebyyear_years_id_fk_idx` (`idYear`),
  KEY `holidaydatesbyyear_users_id_fk_idx` (`idCreated`),
  KEY `holidaydatesbyyear_users_id_fk_2_idx` (`idUpdated`),
  KEY `holidaydatesbyyear_users_id_fk_3_idx` (`idDeleted`),
  CONSTRAINT `holidaydatebyyear_holiday_id_fk` FOREIGN KEY (`idHoliday`) REFERENCES `holidays` (`id`),
  CONSTRAINT `holidaydatebyyear_years_id_fk` FOREIGN KEY (`idYear`) REFERENCES `years` (`id`),
  CONSTRAINT `holidaydatesbyyear_users_id_fk` FOREIGN KEY (`idCreated`) REFERENCES `users` (`id`),
  CONSTRAINT `holidaydatesbyyear_users_id_fk_2` FOREIGN KEY (`idUpdated`) REFERENCES `users` (`id`),
  CONSTRAINT `holidaydatesbyyear_users_id_fk_3` FOREIGN KEY (`idDeleted`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COMMENT='datas dos feriados por ano';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidaydatesbyyear`
--

LOCK TABLES `holidaydatesbyyear` WRITE;
/*!40000 ALTER TABLE `holidaydatesbyyear` DISABLE KEYS */;
INSERT INTO `holidaydatesbyyear` VALUES (1,1,1,'2019-04-21','Nacional',NULL,1,'2022-04-19 05:51:22',NULL,NULL,NULL,NULL),(2,2,1,'2019-09-07','Nacional',NULL,1,'2022-04-19 05:51:22',NULL,NULL,NULL,NULL),(3,3,1,'2019-11-02','Nacional',NULL,1,'2022-04-19 05:51:22',NULL,NULL,NULL,NULL),(4,4,1,'2019-01-01','Nacional',NULL,1,'2022-04-19 05:51:22',NULL,NULL,NULL,NULL),(5,5,1,'2019-05-01','Nacional',NULL,1,'2022-04-19 05:51:22',NULL,NULL,NULL,NULL),(6,6,1,'2019-10-15','Nacional',NULL,1,'2022-04-19 05:51:22',NULL,NULL,NULL,NULL),(7,7,1,'2019-11-15','Nacional',NULL,1,'2022-04-19 05:51:22',NULL,NULL,NULL,NULL),(8,8,1,'2019-12-25','Nacional',NULL,1,'2022-04-19 05:51:22',NULL,NULL,NULL,NULL),(9,9,1,'2019-10-15','Escolar',NULL,1,'2022-04-19 05:51:22',NULL,NULL,NULL,NULL),(10,10,1,'2019-06-20','Nacional',NULL,1,'2022-04-19 05:51:22',NULL,NULL,NULL,NULL),(11,11,1,'2019-04-19','Nacional',NULL,1,'2022-04-19 05:51:22',NULL,NULL,NULL,NULL),(12,12,1,'2019-03-05','Ponto Facutativo',NULL,1,'2022-04-19 05:51:22',NULL,NULL,NULL,NULL),(13,13,1,'2019-01-20','Municipal','Rio de Janeiro',1,'2022-04-20 19:52:00',NULL,'2022-05-01 20:53:48',NULL,NULL);
/*!40000 ALTER TABLE `holidaydatesbyyear` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holidays`
--

DROP TABLE IF EXISTS `holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `holidays` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '0',
  `type` enum('Fixo','Movel') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COMMENT='feriados';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidays`
--

LOCK TABLES `holidays` WRITE;
/*!40000 ALTER TABLE `holidays` DISABLE KEYS */;
INSERT INTO `holidays` VALUES (1,'Tiradentes','Fixo'),(2,'Dia da Independência','Fixo'),(3,'Finados','Fixo'),(4,'Confraternização Universal','Fixo'),(5,'Dia do Trabalho','Fixo'),(6,'Nossa Senhora Aparecida','Fixo'),(7,'Proclamação da Republica','Fixo'),(8,'Natal','Fixo'),(9,'Dia do Professor','Fixo'),(10,'Corpus Christi','Movel'),(11,'Sexta-feira Santa','Movel'),(12,'carnaval','Movel'),(13,'São Sebastião','Fixo');
/*!40000 ALTER TABLE `holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institutions`
--

DROP TABLE IF EXISTS `institutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institutions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idAddress` int NOT NULL,
  `idMatrix` int DEFAULT NULL,
  `idStatus` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `unity` varchar(100) DEFAULT NULL,
  `number` int NOT NULL,
  `complement` varchar(80) DEFAULT NULL,
  `cnpj` varchar(20) NOT NULL,
  `responsible` varchar(50) NOT NULL,
  `photo` longtext NOT NULL,
  `amountofclassrooms` int NOT NULL,
  `enrollmentformat` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `institutions_address_id_fk` (`idAddress`),
  KEY `institutions_status_id_fk_idx` (`idStatus`),
  KEY `institutions_institutions_id_fk_idx` (`idMatrix`),
  CONSTRAINT `institutions_address_id_fk` FOREIGN KEY (`idAddress`) REFERENCES `addresses` (`id`),
  CONSTRAINT `institutions_institutions_id_fk` FOREIGN KEY (`idMatrix`) REFERENCES `institutions` (`id`),
  CONSTRAINT `institutions_status_id_fk` FOREIGN KEY (`idStatus`) REFERENCES `situations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='instituições';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institutions`
--

LOCK TABLES `institutions` WRITE;
/*!40000 ALTER TABLE `institutions` DISABLE KEYS */;
INSERT INTO `institutions` VALUES (1,1,NULL,1,'Virginia Patrick','Maria da Graça',171,'Aprt. 102','46.181.972/0001-20','Ubirajara','img/sem_instituicao.jpg',12,'dddddddd?');
/*!40000 ALTER TABLE `institutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `years`
--

DROP TABLE IF EXISTS `years`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `years` (
  `id` int NOT NULL AUTO_INCREMENT,
  `year` char(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='anos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `years`
--

LOCK TABLES `years` WRITE;
/*!40000 ALTER TABLE `years` DISABLE KEYS */;
INSERT INTO `years` VALUES (1,'2019'),(2,'2018');
/*!40000 ALTER TABLE `years` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'coneduco'
--

--
-- Dumping routines for database 'coneduco'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-01 20:16:14
