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
-- Table structure for table `applicantskills`
--

DROP TABLE IF EXISTS `applicantskills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applicantskills` (
  `Email` varchar(100) NOT NULL,
  `Skills` varchar(50) NOT NULL,
  PRIMARY KEY (`Email`,`Skills`),
  CONSTRAINT `applicantskills_ibfk_1` FOREIGN KEY (`Email`) REFERENCES `applicant` (`Email`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicantskills`
--

LOCK TABLES `applicantskills` WRITE;
/*!40000 ALTER TABLE `applicantskills` DISABLE KEYS */;
INSERT INTO `applicantskills` VALUES ('ahmed_khorshed@gmail.com','Computer Vision'),('ahmed_khorshed@gmail.com','Image Processing'),('aliamohsen@yahoo.com','Data Analysis'),('aliamohsen@yahoo.com','Data Visualization'),('hanakhaled@hotmail.com','JavaScript'),('hanakhaled@hotmail.com','Software Development'),('karimabdelrahman@aucegypt.edu','Quality Assurance'),('malaksalah@hotmail.com','Data Entry'),('mohamedragab@aucegypt.edu','Data Visualization'),('mohamedragab@aucegypt.edu','Natural Language Processing'),('mohamedshaaban@agmail.com','Data Modeling'),('mohamedshaaban@agmail.com','Database Administration'),('mohamedshaaban@agmail.com','Database Management'),('mohamedshaaban@agmail.com','SQL'),('omar_bahgat@aucegypt.edu','Algorithms'),('omar_bahgat@aucegypt.edu','Machine Learning'),('omar_bahgat@aucegypt.edu','Python Programming'),('youssefmansour@aucegypt.edu','Artificial Intelligence'),('youssefmansour@aucegypt.edu','Neural Networks'),('zeinabahgat@aucegypt.edu','Data Analysis'),('zeinabahgat@aucegypt.edu','Research Methods'),('zeinabahgat@aucegypt.edu','Statistical Analysis');
/*!40000 ALTER TABLE `applicantskills` ENABLE KEYS */;
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
