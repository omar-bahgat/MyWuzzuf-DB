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
-- Table structure for table `jobpostcategories`
--

DROP TABLE IF EXISTS `jobpostcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobpostcategories` (
  `PostTitle` varchar(100) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Categories` varchar(50) NOT NULL,
  PRIMARY KEY (`PostTitle`,`City`,`Name`,`Categories`),
  KEY `City` (`City`),
  KEY `Name` (`Name`),
  CONSTRAINT `jobpostcategories_ibfk_1` FOREIGN KEY (`PostTitle`) REFERENCES `jobpost` (`PostTitle`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `jobpostcategories_ibfk_2` FOREIGN KEY (`City`) REFERENCES `jobpost` (`City`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `jobpostcategories_ibfk_3` FOREIGN KEY (`Name`) REFERENCES `jobpost` (`Name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobpostcategories`
--

LOCK TABLES `jobpostcategories` WRITE;
/*!40000 ALTER TABLE `jobpostcategories` DISABLE KEYS */;
INSERT INTO `jobpostcategories` VALUES ('Technical Support Specialist','Alexandria','Cepack','Customer Service/Support\r'),('Technical Support Specialist','Alexandria','Cepack','IT/Software Development\r'),('Software Architect','Assiut','Spatium Software','Engineering - Telecom/Technology\r'),('Software Architect','Assiut','Spatium Software','IT/Software Development\r'),('Full Stack wordpress Developer','Cairo','Osolutions','Engineering - Telecom/Technology\r'),('Full Stack wordpress Developer','Cairo','Osolutions','IT/Software Development\r'),('Electrical Engineer','Dakahlia','AGA','Engineering - Mechanical/Electrical\r'),('Electrical Engineer','Dakahlia','AGA','Engineering - Other\r'),('IT Specialist','Fayoum','Smart Glass Company','IT/Software Development\r'),('IT Technical Support Specialist - Tanta','Gharbia','Town Team','Engineering - Telecom/Technology\r'),('IT Technical Support Specialist - Tanta','Gharbia','Town Team','Installation/Maintenance/Repair\r'),('IT Technical Support Specialist - Tanta','Gharbia','Town Team','IT/Software Development\r'),('Senior Civil Engineer (Luxor)','Luxor','Elaraby Group','Engineering - Construction/Civil/Architecture\r'),('Senior Civil Engineer (Menoufia)','Monufya','Elaraby Group','Engineering - Construction/Civil/Architecture\r'),('Senior IT Specialist','Qalubia','Orient','Engineering - Mechanical/Electrical\r'),('Senior IT Specialist','Qalubia','Orient','Installation/Maintenance/Repair\r'),('Senior IT Specialist','Qalubia','Orient','IT/Software Development\r'),('IT Senior system admin- nearby to 10th of Ramadan','Sharqia','El Banna Group Company','IT/Software Development\r'),('IT Senior system admin- nearby to 10th of Ramadan','Sharqia','El Banna Group Company','Operations/Management\r'),('IT Senior system admin- nearby to 10th of Ramadan','Sharqia','El Banna Group Company','Other\r'),('Cash Management Accountant Suez Egypt Posted on 10/22/2023','Suez','Cargoes','Engineering - Telecom/Technology\r'),('Cash Management Accountant Suez Egypt Posted on 10/22/2023','Suez','Cargoes','IT/Software Development\r'),('Cash Management Accountant Suez Egypt Posted on 10/22/2023','Suez','Cargoes','Purchasing/Procurement\r'),('ERP Sales Representative','Verified','Ultimate Academy','IT/Software Development\r'),('ERP Sales Representative','Verified','Ultimate Academy','Sales/Retail\r');
/*!40000 ALTER TABLE `jobpostcategories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-02  0:34:57
