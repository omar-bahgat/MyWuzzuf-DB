CREATE DATABASE  IF NOT EXISTS `jobsearch` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `jobsearch`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: jobsearch
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
-- Table structure for table `applicantappliesjob`
--

DROP TABLE IF EXISTS `applicantappliesjob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applicantappliesjob` (
  `Email` varchar(100) NOT NULL,
  `PostTitle` varchar(100) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `ApplicationDate` varchar(10) DEFAULT NULL,
  `CoverLetter` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`Email`,`PostTitle`,`City`,`Name`),
  KEY `PostTitle` (`PostTitle`),
  KEY `City` (`City`),
  KEY `Name` (`Name`),
  CONSTRAINT `applicantappliesjob_ibfk_1` FOREIGN KEY (`Email`) REFERENCES `applicant` (`Email`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `applicantappliesjob_ibfk_2` FOREIGN KEY (`PostTitle`) REFERENCES `jobpost` (`PostTitle`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `applicantappliesjob_ibfk_3` FOREIGN KEY (`City`) REFERENCES `jobpost` (`City`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `applicantappliesjob_ibfk_4` FOREIGN KEY (`Name`) REFERENCES `jobpost` (`Name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicantappliesjob`
--

LOCK TABLES `applicantappliesjob` WRITE;
/*!40000 ALTER TABLE `applicantappliesjob` DISABLE KEYS */;
INSERT INTO `applicantappliesjob` VALUES ('omar_bahgat@aucegypt.edu','Electrical Engineer','Dakahlia','AGA','2022-17-11','Sample Cover Letter');
/*!40000 ALTER TABLE `applicantappliesjob` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-02  0:34:56
