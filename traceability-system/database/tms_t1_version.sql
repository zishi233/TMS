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
-- Table structure for table `t1_version`
--

DROP TABLE IF EXISTS `t1_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t1_version` (
  `T1_Version_ID` int NOT NULL AUTO_INCREMENT,
  `TraceLink_ID` int NOT NULL,
  `Owner` int DEFAULT NULL,
  `Description` text,
  `Attachment` blob,
  `Mod_ID` int DEFAULT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`T1_Version_ID`),
  KEY `TraceLink_ID` (`TraceLink_ID`),
  KEY `Owner` (`Owner`),
  KEY `Mod_ID` (`Mod_ID`),
  CONSTRAINT `t1_version_ibfk_1` FOREIGN KEY (`TraceLink_ID`) REFERENCES `tracelink` (`T1_ID`) ON DELETE CASCADE,
  CONSTRAINT `t1_version_ibfk_2` FOREIGN KEY (`Owner`) REFERENCES `user` (`User_ID`) ON DELETE SET NULL,
  CONSTRAINT `t1_version_ibfk_3` FOREIGN KEY (`Mod_ID`) REFERENCES `modification` (`Mod_ID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t1_version`
--

LOCK TABLES `t1_version` WRITE;
/*!40000 ALTER TABLE `t1_version` DISABLE KEYS */;
INSERT INTO `t1_version` VALUES (1,1,1,'Initial link version',NULL,NULL,NULL),(2,2,1,'Initial link version',NULL,NULL,NULL),(3,3,2,'v1 – initial link',NULL,5,NULL);
/*!40000 ALTER TABLE `t1_version` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-06 10:28:25
