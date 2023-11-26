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
-- Table structure for table `jobpostskills`
--

DROP TABLE IF EXISTS `jobpostskills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobpostskills` (
  `PostTitle` varchar(100) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Skills` varchar(50) NOT NULL,
  PRIMARY KEY (`PostTitle`,`City`,`Name`,`Skills`),
  KEY `City` (`City`),
  KEY `Name` (`Name`),
  CONSTRAINT `jobpostskills_ibfk_1` FOREIGN KEY (`PostTitle`) REFERENCES `jobpost` (`PostTitle`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `jobpostskills_ibfk_2` FOREIGN KEY (`City`) REFERENCES `jobpost` (`City`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `jobpostskills_ibfk_3` FOREIGN KEY (`Name`) REFERENCES `jobpost` (`Name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobpostskills`
--

LOCK TABLES `jobpostskills` WRITE;
/*!40000 ALTER TABLE `jobpostskills` DISABLE KEYS */;
INSERT INTO `jobpostskills` VALUES ('Technical Support Specialist','Alexandria','Cepack','Computer Science\r'),('Technical Support Specialist','Alexandria','Cepack','Customer Service\r'),('Technical Support Specialist','Alexandria','Cepack','Information technology\r'),('Technical Support Specialist','Alexandria','Cepack','Technical Support\r'),('Software Architect','Assiut','Spatium Software','.Net\r'),('Software Architect','Assiut','Spatium Software','.Net Development\r'),('Software Architect','Assiut','Spatium Software','.Net Framework\r'),('Software Architect','Assiut','Spatium Software','ASP\r'),('Software Architect','Assiut','Spatium Software','ASP.Net\r'),('Software Architect','Assiut','Spatium Software','ASP.NET Core\r'),('Software Architect','Assiut','Spatium Software','ASP.net MVC\r'),('Software Architect','Assiut','Spatium Software','ASP.net MVC 5\r'),('Software Architect','Assiut','Spatium Software','ASP.NET Razor\r'),('Software Architect','Assiut','Spatium Software','ASP.Net Web API\r'),('Software Architect','Assiut','Spatium Software','ASP.NET Web Forms\r'),('Software Architect','Assiut','Spatium Software','Aspect-Oriented Programming\r'),('Software Architect','Assiut','Spatium Software','AWS\r'),('Software Architect','Assiut','Spatium Software','Computer Engineering\r'),('Software Architect','Assiut','Spatium Software','Computer Science\r'),('Software Architect','Assiut','Spatium Software','DDD\r'),('Software Architect','Assiut','Spatium Software','Domain Driven Design\r'),('Software Architect','Assiut','Spatium Software','EDD\r'),('Software Architect','Assiut','Spatium Software','Information Technology (IT)\r'),('Software Architect','Assiut','Spatium Software','Microservice Architecture\r'),('Software Architect','Assiut','Spatium Software','Microsoft .NET\r'),('Software Architect','Assiut','Spatium Software','Microsoft .Net Framework\r'),('Software Architect','Assiut','Spatium Software','Service-Oriented Architecture\r'),('Software Architect','Assiut','Spatium Software','Service-Oriented Architecture (SOA)\r'),('Software Architect','Assiut','Spatium Software','Software\r'),('Software Architect','Assiut','Spatium Software','Software Architect\r'),('Software Architect','Assiut','Spatium Software','Software Architecture\r'),('Software Architect','Assiut','Spatium Software','Software Development\r'),('Software Architect','Assiut','Spatium Software','Software Engineering\r'),('Full Stack wordpress Developer','Cairo','Osolutions','Angular\r'),('Full Stack wordpress Developer','Cairo','Osolutions','JavaScript\r'),('Full Stack wordpress Developer','Cairo','Osolutions','jQuery\r'),('Full Stack wordpress Developer','Cairo','Osolutions','Laravel PHP\r'),('Full Stack wordpress Developer','Cairo','Osolutions','PHP\r'),('Full Stack wordpress Developer','Cairo','Osolutions','Software Development\r'),('Full Stack wordpress Developer','Cairo','Osolutions','WordPress\r'),('Electrical Engineer','Dakahlia','AGA','Communication\r'),('Electrical Engineer','Dakahlia','AGA','Electrical Engineering\r'),('IT Specialist','Fayoum','Smart Glass Company','computer\r'),('IT Specialist','Fayoum','Smart Glass Company','Computer Systems\r'),('IT Specialist','Fayoum','Smart Glass Company','Information Technology (IT)\r'),('IT Specialist','Fayoum','Smart Glass Company','Networking\r'),('IT Specialist','Fayoum','Smart Glass Company','Repair\r'),('IT Specialist','Fayoum','Smart Glass Company','Technical Support\r'),('IT Technical Support Specialist - Tanta','Gharbia','Town Team','CCNA\r'),('IT Technical Support Specialist - Tanta','Gharbia','Town Team','Computer\r'),('IT Technical Support Specialist - Tanta','Gharbia','Town Team','Computer Science\r'),('IT Technical Support Specialist - Tanta','Gharbia','Town Team','Customer Support\r'),('IT Technical Support Specialist - Tanta','Gharbia','Town Team','Hardware\r'),('IT Technical Support Specialist - Tanta','Gharbia','Town Team','Information Technology (IT)\r'),('IT Technical Support Specialist - Tanta','Gharbia','Town Team','Installation\r'),('IT Technical Support Specialist - Tanta','Gharbia','Town Team','MCSA\r'),('IT Technical Support Specialist - Tanta','Gharbia','Town Team','Network\r'),('IT Technical Support Specialist - Tanta','Gharbia','Town Team','Network Administration\r'),('IT Technical Support Specialist - Tanta','Gharbia','Town Team','Technical Support\r'),('Senior Civil Engineer (Luxor)','Luxor','Elaraby Group','Civil\r'),('Senior Civil Engineer (Luxor)','Luxor','Elaraby Group','civil 3D\r'),('Senior Civil Engineer (Luxor)','Luxor','Elaraby Group','Civil Engineering\r'),('Senior Civil Engineer (Luxor)','Luxor','Elaraby Group','Construction\r'),('Senior Civil Engineer (Luxor)','Luxor','Elaraby Group','Engineering\r'),('Senior Civil Engineer (Luxor)','Luxor','Elaraby Group','Project\r'),('Senior Civil Engineer (Luxor)','Luxor','Elaraby Group','Project Management\r'),('Senior Civil Engineer (Menoufia)','Monufya','Elaraby Group','Civil\r'),('Senior Civil Engineer (Menoufia)','Monufya','Elaraby Group','civil 3D\r'),('Senior Civil Engineer (Menoufia)','Monufya','Elaraby Group','Civil Engineering\r'),('Senior Civil Engineer (Menoufia)','Monufya','Elaraby Group','Construction\r'),('Senior Civil Engineer (Menoufia)','Monufya','Elaraby Group','Engineering\r'),('Senior Civil Engineer (Menoufia)','Monufya','Elaraby Group','Project\r'),('Senior Civil Engineer (Menoufia)','Monufya','Elaraby Group','Project Management\r'),('Senior IT Specialist','Qalubia','Orient','Communication\r'),('Senior IT Specialist','Qalubia','Orient','computer\r'),('Senior IT Specialist','Qalubia','Orient','Computer Science\r'),('Senior IT Specialist','Qalubia','Orient','ERP\r'),('Senior IT Specialist','Qalubia','Orient','Firewall\r'),('Senior IT Specialist','Qalubia','Orient','Information Technology (IT)\r'),('Senior IT Specialist','Qalubia','Orient','IT\r'),('Senior IT Specialist','Qalubia','Orient','Software Development\r'),('Senior IT Specialist','Qalubia','Orient','Software Engineering\r'),('Senior IT Specialist','Qalubia','Orient','Technical Support\r'),('IT Senior system admin- nearby to 10th of Ramadan','Sharqia','El Banna Group Company','Cisco Firewall\r'),('IT Senior system admin- nearby to 10th of Ramadan','Sharqia','El Banna Group Company','ESXi\r'),('IT Senior system admin- nearby to 10th of Ramadan','Sharqia','El Banna Group Company','Firewall\r'),('IT Senior system admin- nearby to 10th of Ramadan','Sharqia','El Banna Group Company','Information Technology (IT)\r'),('IT Senior system admin- nearby to 10th of Ramadan','Sharqia','El Banna Group Company','Network Security\r'),('IT Senior system admin- nearby to 10th of Ramadan','Sharqia','El Banna Group Company','Social Networking Sites\r'),('IT Senior system admin- nearby to 10th of Ramadan','Sharqia','El Banna Group Company','Sophos UTM\r'),('IT Senior system admin- nearby to 10th of Ramadan','Sharqia','El Banna Group Company','System Admin\r'),('IT Senior system admin- nearby to 10th of Ramadan','Sharqia','El Banna Group Company','System Administration\r'),('IT Senior system admin- nearby to 10th of Ramadan','Sharqia','El Banna Group Company','Vmware\r'),('Cash Management Accountant Suez Egypt Posted on 10/22/2023','Suez','Cargoes','accountant\r'),('Cash Management Accountant Suez Egypt Posted on 10/22/2023','Suez','Cargoes','accountantsuez\r'),('Cash Management Accountant Suez Egypt Posted on 10/22/2023','Suez','Cargoes','accounting\r'),('Cash Management Accountant Suez Egypt Posted on 10/22/2023','Suez','Cargoes','qualification\r'),('Cash Management Accountant Suez Egypt Posted on 10/22/2023','Suez','Cargoes','requirements\r'),('ERP Sales Representative','Verified','Ultimate Academy','Communication skills\r'),('ERP Sales Representative','Verified','Ultimate Academy','CRM\r'),('ERP Sales Representative','Verified','Ultimate Academy','ERP\r'),('ERP Sales Representative','Verified','Ultimate Academy','Sales\r'),('ERP Sales Representative','Verified','Ultimate Academy','Sales Target\r'),('ERP Sales Representative','Verified','Ultimate Academy','Software\r'),('ERP Sales Representative','Verified','Ultimate Academy','Software Sales\r');
/*!40000 ALTER TABLE `jobpostskills` ENABLE KEYS */;
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
