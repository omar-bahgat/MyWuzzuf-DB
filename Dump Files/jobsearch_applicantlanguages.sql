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
-- Table structure for table `applicantlanguages`
--

DROP TABLE IF EXISTS `applicantlanguages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applicantlanguages` (
  `Email` varchar(50) NOT NULL,
  `Languages` varchar(50) NOT NULL,
  PRIMARY KEY (`Email`,`Languages`),
  CONSTRAINT `applicantlanguages_ibfk_1` FOREIGN KEY (`Email`) REFERENCES `applicant` (`Email`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicantlanguages`
--

LOCK TABLES `applicantlanguages` WRITE;
/*!40000 ALTER TABLE `applicantlanguages` DISABLE KEYS */;
INSERT INTO `applicantlanguages` VALUES ('ahmed_khorshed@gmail.com','Arabic'),('ahmed_khorshed@gmail.com','English'),('aliamohsen@yahoo.com','Arabic'),('aliamohsen@yahoo.com','English'),('hanakhaled@hotmail.com','Arabic'),('hanakhaled@hotmail.com','English'),('hanakhaled@hotmail.com','French'),('karimabdelrahman@aucegypt.edu','Arabic'),('karimabdelrahman@aucegypt.edu','English'),('malaksalah@hotmail.com','Arabic'),('malaksalah@hotmail.com','English'),('mohamedragab@aucegypt.edu','Arabic'),('mohamedragab@aucegypt.edu','English'),('mohamedshaaban@agmail.com','Arabic'),('mohamedshaaban@agmail.com','English'),('omar_bahgat@aucegypt.edu','Arabic'),('omar_bahgat@aucegypt.edu','English'),('omar_bahgat@aucegypt.edu','German'),('youssefmansour@aucegypt.edu','Arabic'),('youssefmansour@aucegypt.edu','English'),('zeinabahgat@aucegypt.edu','Arabic'),('zeinabahgat@aucegypt.edu','English');
/*!40000 ALTER TABLE `applicantlanguages` ENABLE KEYS */;
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
