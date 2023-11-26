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
-- Table structure for table `applicant`
--

DROP TABLE IF EXISTS `applicant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applicant` (
  `Email` varchar(100) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Country` varchar(50) NOT NULL,
  `FirstName` varchar(15) NOT NULL,
  `MiddleName` varchar(15) DEFAULT NULL,
  `LastName` varchar(15) NOT NULL,
  `Gender` char(1) NOT NULL,
  `Birthdate` date NOT NULL,
  `Nationality` varchar(30) NOT NULL,
  `PhoneNumber` varchar(15) NOT NULL,
  `EducationLevel` varchar(50) DEFAULT NULL,
  `YearsOfExperience` int NOT NULL,
  `GPA` float NOT NULL,
  PRIMARY KEY (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicant`
--

LOCK TABLES `applicant` WRITE;
/*!40000 ALTER TABLE `applicant` DISABLE KEYS */;
INSERT INTO `applicant` VALUES ('ahmed_khorshed@gmail.com','Giza','Egypt','Ahmed','Ehab','Khorshed','M','1995-11-17','Egyptian','01322354366','PhD',6,3.5),('aliamohsen@yahoo.com','Cairo','Egypt','Alia','Mohsen','Elsaeed','M','0204-11-17','Egyptian','01335678442','Bachelor\'s Degree',1,3.5),('hanakhaled@hotmail.com','Alexandria','Egypt','Hana','Khaled','Elsaadany','F','2004-05-12','Egyptian','01357788902','Bachelor\'s Degree',2,3.64),('karimabdelrahman@aucegypt.edu','Cairo','Egypt','Karim','Abdelrahman','Salem','M','2001-12-31','Egyptian','01289964522','Bachelor\'s Degree',1,3.32),('malaksalah@hotmail.com','Cairo','Egypt','Malak','Mahmoud','Salah','F','2005-11-17','Egyptian','01024546602','Bachelor\'s Degree',0,3.4),('mohamedragab@aucegypt.edu','Qalyub','Egypt','Mohamed','Ragab','Abbas','M','2002-01-15','Egyptian','01245589723','Bachelor\'s Degree',1,3.92),('mohamedshaaban@agmail.com','Cairo','Egypt','Mohamed','Hesham','Shaaban','M','1998-06-30','Egyptian','01201743106','Master\'s Degree',3,3.8),('omar_bahgat@aucegypt.edu','Cairo','Egypt','Omar','Ashraf','Bahgat','M','2003-11-17','Egyptian','01201998806','Bachelor\'s Degree',0,3.91),('youssefmansour@aucegypt.edu','Giza','Egypt','Youssef','Ahmed','Mansour','M','2003-04-04','Egyptian','01245788932','Bachelor\'s Degree',1,3.94),('zeinabahgat@aucegypt.edu','Cairo','Egypt','Zeina','Ashraf','Bahgat','F','2003-11-17','Egyptian','01201998807','Bachelor\'s Degree',0,3.93);
/*!40000 ALTER TABLE `applicant` ENABLE KEYS */;
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
