-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: tpiprode
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `partidos`
--

DROP TABLE IF EXISTS `partidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partidos` (
  `id` int NOT NULL,
  `Equipo1` varchar(100) DEFAULT NULL,
  `golesequipo1` varchar(100) DEFAULT NULL,
  `golesequipo2` int DEFAULT NULL,
  `equipo2` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partidos`
--

LOCK TABLES `partidos` WRITE;
/*!40000 ALTER TABLE `partidos` DISABLE KEYS */;
INSERT INTO `partidos` VALUES (1,'Argentina','1',2,'Arabia Saudita'),(2,'Mexico','0',0,'Polonia'),(3,'Argentina','2',0,'Mexico'),(4,'Polonia','2',0,'Arabia Saudita'),(5,'Polonia','0',2,'Argentina'),(6,'Arabia Saudita','1',2,'Mexico');
/*!40000 ALTER TABLE `partidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pronosticos`
--

DROP TABLE IF EXISTS `pronosticos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pronosticos` (
  `partido` int DEFAULT NULL,
  `Resultado` varchar(100) DEFAULT NULL,
  `participante` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pronosticos`
--

LOCK TABLES `pronosticos` WRITE;
/*!40000 ALTER TABLE `pronosticos` DISABLE KEYS */;
INSERT INTO `pronosticos` VALUES (1,'Argentina','Diego'),(2,'Polonia','Diego'),(3,'Argentina','Diego'),(4,'Polonia','Diego'),(5,'Argentina','Diego'),(6,'Mexico','Diego'),(1,'Arabia Saudita','Martin'),(2,'Mexico','Martin'),(3,'Argentina','Martin'),(4,'Polonia','Martin'),(5,'Argentina','Martin'),(6,'Mexico','Martin'),(1,'Empate','Javier'),(2,'Empate','Javier'),(3,'Argentina','Javier'),(4,'Empate','Javier'),(5,'Empate','Javier'),(6,'Arabia Saudita','Javier');
/*!40000 ALTER TABLE `pronosticos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'tpiprode'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-17 23:09:51
