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
-- Table structure for table `modification`
--

DROP TABLE IF EXISTS `modification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modification` (
  `Mod_ID` int NOT NULL AUTO_INCREMENT,
  `ModifiedBy` int DEFAULT NULL,
  `Supervisor` int DEFAULT NULL,
  `ModificationTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `Reason` text,
  PRIMARY KEY (`Mod_ID`),
  KEY `ModifiedBy` (`ModifiedBy`),
  KEY `Supervisor` (`Supervisor`),
  CONSTRAINT `modification_ibfk_1` FOREIGN KEY (`ModifiedBy`) REFERENCES `user` (`User_ID`) ON DELETE SET NULL,
  CONSTRAINT `modification_ibfk_2` FOREIGN KEY (`Supervisor`) REFERENCES `user` (`User_ID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modification`
--

LOCK TABLES `modification` WRITE;
/*!40000 ALTER TABLE `modification` DISABLE KEYS */;
INSERT INTO `modification` VALUES (1,1,2,'2025-05-26 06:31:21','Corrected typo in REQ-001'),(2,1,NULL,'2025-05-26 07:06:58','Initial import of Login Module'),(3,2,1,'2025-05-26 07:06:58','Add OAuth2 support to Login Module'),(4,2,NULL,'2025-05-26 07:06:58','Add requirement R1 – users must log in'),(5,2,1,'2025-05-26 07:06:58','Establish traceability between R1 and Login Module');
/*!40000 ALTER TABLE `modification` ENABLE KEYS */;
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
