-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: tms
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `tracelink`
--

DROP TABLE IF EXISTS `tracelink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tracelink` (
  `T1_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Description` text,
  `Current_Version_ID` int DEFAULT NULL,
  `Original_Version_ID` int DEFAULT NULL,
  `Current_Info_ID` int DEFAULT NULL,
  `Original_Info_ID` int DEFAULT NULL,
  PRIMARY KEY (`T1_ID`),
  KEY `Current_Version_ID` (`Current_Version_ID`),
  KEY `Original_Version_ID` (`Original_Version_ID`),
  KEY `Current_Info_ID` (`Current_Info_ID`),
  KEY `Original_Info_ID` (`Original_Info_ID`),
  CONSTRAINT `tracelink_ibfk_1` FOREIGN KEY (`Current_Version_ID`) REFERENCES `t1_version` (`T1_Version_ID`) ON DELETE SET NULL,
  CONSTRAINT `tracelink_ibfk_2` FOREIGN KEY (`Original_Version_ID`) REFERENCES `t1_version` (`T1_Version_ID`) ON DELETE SET NULL,
  CONSTRAINT `tracelink_ibfk_3` FOREIGN KEY (`Current_Info_ID`) REFERENCES `t1_info` (`T1_Info_ID`) ON DELETE SET NULL,
  CONSTRAINT `tracelink_ibfk_4` FOREIGN KEY (`Original_Info_ID`) REFERENCES `t1_info` (`T1_Info_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracelink`
--

LOCK TABLES `tracelink` WRITE;
/*!40000 ALTER TABLE `tracelink` DISABLE KEYS */;
/*!40000 ALTER TABLE `tracelink` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-06 10:28:26
