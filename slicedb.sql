-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: slicedb
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `dbgroups`
--

DROP TABLE IF EXISTS `dbgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbgroups` (
  `groupId` int NOT NULL AUTO_INCREMENT,
  `groupTitle` varchar(45) NOT NULL,
  `groupDescription` varchar(255) DEFAULT NULL,
  `creationTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`groupId`),
  UNIQUE KEY `groupId_UNIQUE` (`groupId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbgroups`
--

LOCK TABLES `dbgroups` WRITE;
/*!40000 ALTER TABLE `dbgroups` DISABLE KEYS */;
INSERT INTO `dbgroups` VALUES (1,'Cena de navidad','Por fin reunidos de nuevo','2023-02-14 23:38:27'),(2,'Viaje a Egipto','A pasarlo bien','2023-02-14 23:38:27');
/*!40000 ALTER TABLE `dbgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_has_users`
--

DROP TABLE IF EXISTS `groups_has_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups_has_users` (
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `userRol` enum('admin','viewer') NOT NULL,
  `debtAmount` decimal(10,2) DEFAULT NULL,
  KEY `groupId_idx` (`groupId`),
  KEY `userId_idx` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_has_users`
--

LOCK TABLES `groups_has_users` WRITE;
/*!40000 ALTER TABLE `groups_has_users` DISABLE KEYS */;
INSERT INTO `groups_has_users` VALUES (1,2,'admin',12.32),(1,3,'viewer',-20.00),(1,4,'viewer',7.68),(2,5,'admin',0.00),(2,6,'viewer',-5.00),(2,7,'viewer',5.00);
/*!40000 ALTER TABLE `groups_has_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slices`
--

DROP TABLE IF EXISTS `slices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slices` (
  `sliceId` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `description` varchar(150) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`sliceId`),
  UNIQUE KEY `paymentId_UNIQUE` (`sliceId`),
  KEY `groupId_idx` (`groupId`),
  KEY `userId_idx` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slices`
--

LOCK TABLES `slices` WRITE;
/*!40000 ALTER TABLE `slices` DISABLE KEYS */;
INSERT INTO `slices` VALUES (1,1,2,'langostinos',24.68),(2,1,4,'jamon',15.36);
/*!40000 ALTER TABLE `slices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(30) NOT NULL,
  `userSurname` varchar(55) NOT NULL,
  `userEmail` varchar(45) NOT NULL,
  `userPhone` varchar(45) NOT NULL,
  `registreTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userId_UNIQUE` (`userId`),
  UNIQUE KEY `userEmail_UNIQUE` (`userEmail`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'Pedro','Molina','ped@mail.es','678676767','2023-02-14 20:35:21','ireiu4'),(3,'Lucia','Vergara','luci99@outlook.com','655437812','2023-02-14 23:35:50','burululu'),(4,'Marta','Naranjo','martammt@hotmail.es','644909122','2023-02-14 23:35:50','cucume878'),(5,'Carlos','Sainz','charlywe@gmail.com','667212112','2023-02-14 23:35:50','rarmel10'),(6,'Miguel','Noguera','miguelTorres@outlook.com','632908656','2023-02-14 23:35:50','jilopq1'),(7,'Antonio','Bermúdez','ant@terra.es','670498919','2023-02-16 22:51:36','787878');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-23 18:39:41
