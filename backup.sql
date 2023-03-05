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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbgroups`
--

LOCK TABLES `dbgroups` WRITE;
/*!40000 ALTER TABLE `dbgroups` DISABLE KEYS */;
INSERT INTO `dbgroups` VALUES (1,'Cena de navidad','Por fin reunidos de nuevo','2023-02-14 23:38:27'),(2,'Viaje a Egipto','A pasarlo bien','2023-02-14 23:38:27'),(3,'Viaje a Camboya','Intentad no pillar cocoroco','2023-02-27 18:58:33'),(4,'Cosas de casa','Los gastos del mes de Abril','2023-02-27 19:18:16'),(5,'Cumpleaños de Lola','En la casa de los abuelos','2023-02-27 19:21:26'),(6,'Cumpleaños sorpresa de Mariana','No vayáis a meter a Mariana','2023-02-27 19:27:01'),(7,'Despedida de soltera de Julia','En Marbella','2023-02-27 21:00:31'),(8,'Compra de la casa','gastos de notaría','2023-02-27 21:02:41'),(9,'Gastos de la comunidad','calle suspiro 22','2023-02-27 21:04:55'),(10,'Arreglar la calle privada','calle suspiro 22','2023-02-28 08:13:03'),(11,'Excursión','','2023-02-28 08:13:35'),(12,'Nuevo grupo','De prueba','2023-02-28 11:10:24'),(13,'Nuevo grupo','De prueba','2023-02-28 11:12:58'),(14,'Nuevo grupo','De prueba','2023-02-28 11:13:30'),(15,'Nuevo grupo',NULL,'2023-02-28 18:48:08'),(16,'Nuevo grupo',NULL,'2023-03-05 13:33:34');
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
  PRIMARY KEY (`groupId`,`userId`),
  KEY `groupId_idx` (`groupId`),
  KEY `userId_idx` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_has_users`
--

LOCK TABLES `groups_has_users` WRITE;
/*!40000 ALTER TABLE `groups_has_users` DISABLE KEYS */;
INSERT INTO `groups_has_users` VALUES (0,11,'viewer',0.00),(1,2,'admin',12.32),(1,3,'viewer',-20.00),(1,4,'viewer',7.68),(1,10,'viewer',0.00),(2,6,'viewer',-5.00),(2,7,'viewer',5.00),(2,10,'admin',0.00),(3,10,'admin',NULL),(4,10,'admin',NULL),(5,10,'admin',0.00),(6,10,'admin',0.00),(7,10,'admin',0.00),(8,10,'admin',0.00),(9,10,'admin',0.00),(10,6,'viewer',0.00),(10,7,'viewer',0.00),(10,9,'viewer',0.00),(10,10,'admin',0.00),(10,11,'viewer',0.00),(11,10,'admin',0.00),(14,10,'admin',0.00),(14,11,'viewer',0.00),(15,6,'viewer',75.00),(15,7,'viewer',-25.00),(15,9,'viewer',-25.00),(15,10,'admin',-25.00),(16,10,'admin',0.00);
/*!40000 ALTER TABLE `groups_has_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invitations`
--

DROP TABLE IF EXISTS `invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invitations` (
  `invitationId` int NOT NULL AUTO_INCREMENT,
  `fromId` int NOT NULL,
  `toId` int NOT NULL,
  `groupId` int NOT NULL,
  `status` enum('checked','pending') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`invitationId`),
  UNIQUE KEY `invitationId_UNIQUE` (`invitationId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitations`
--

LOCK TABLES `invitations` WRITE;
/*!40000 ALTER TABLE `invitations` DISABLE KEYS */;
INSERT INTO `invitations` VALUES (1,10,9,14,'checked'),(2,10,11,14,'checked'),(3,10,11,14,'pending'),(4,10,11,14,'pending');
/*!40000 ALTER TABLE `invitations` ENABLE KEYS */;
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
  `description` varchar(150) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`sliceId`),
  UNIQUE KEY `paymentId_UNIQUE` (`sliceId`),
  KEY `groupId_idx` (`groupId`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slices`
--

LOCK TABLES `slices` WRITE;
/*!40000 ALTER TABLE `slices` DISABLE KEYS */;
INSERT INTO `slices` VALUES (1,1,'langostinos',24.68),(2,1,'jamon',15.36),(3,2,'prueba desde workbench',100.00),(21,15,'Primer Slice de Prueba',100.00),(22,15,'Primer Slice de Prueba',100.00),(23,15,'Primer Slice de Prueba',100.00),(24,15,'Primer Slice de Prueba',100.00),(25,15,'Primer Slice de Prueba',100.00),(26,15,'Primer Slice de Prueba',100.00),(27,15,'Primer Slice de Prueba',100.00);
/*!40000 ALTER TABLE `slices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slices_has_users`
--

DROP TABLE IF EXISTS `slices_has_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slices_has_users` (
  `sliceId` int NOT NULL,
  `userId` int NOT NULL,
  `action` enum('pay','debt') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`sliceId`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slices_has_users`
--

LOCK TABLES `slices_has_users` WRITE;
/*!40000 ALTER TABLE `slices_has_users` DISABLE KEYS */;
INSERT INTO `slices_has_users` VALUES (1,2,'pay'),(1,3,'debt'),(2,4,'pay'),(2,5,'debt'),(2,6,'debt'),(9,6,'pay'),(9,7,'debt'),(9,9,'debt'),(9,10,'debt'),(10,6,'pay'),(10,7,'debt'),(10,9,'debt'),(10,10,'debt'),(12,6,'pay'),(12,7,'debt'),(12,9,'debt'),(12,10,'debt'),(13,6,'pay'),(13,7,'debt'),(13,9,'debt'),(13,10,'debt'),(14,6,'pay'),(14,7,'debt'),(14,9,'debt'),(14,10,'debt'),(21,6,'pay'),(21,7,'debt'),(21,9,'debt'),(21,10,'debt'),(22,6,'pay'),(22,7,'debt'),(22,9,'debt'),(22,10,'debt'),(23,6,'pay'),(23,7,'debt'),(23,9,'debt'),(23,10,'debt'),(24,6,'pay'),(24,7,'debt'),(24,9,'debt'),(24,10,'debt'),(25,6,'pay'),(25,7,'debt'),(25,9,'debt'),(25,10,'debt'),(26,6,'pay'),(26,7,'debt'),(26,9,'debt'),(26,10,'debt'),(27,6,'pay'),(27,7,'debt'),(27,9,'debt'),(27,10,'debt');
/*!40000 ALTER TABLE `slices_has_users` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'Pedro','Molina','ped@mail.es','678676767','2023-02-14 20:35:21','ireiu4'),(3,'Lucia','Vergara','luci99@outlook.com','655437812','2023-02-14 23:35:50','burululu'),(4,'Marta','Naranjo','martammt@hotmail.es','644909122','2023-02-14 23:35:50','cucume878'),(5,'Carlos','Sainz','charlywe@gmail.com','667212112','2023-02-14 23:35:50','rarmel10'),(6,'Miguel','Noguera','miguelTorres@outlook.com','632908656','2023-02-14 23:35:50','jilopq1'),(7,'Antonio','Bermúdez','ant@terra.es','670498919','2023-02-16 22:51:36','787878'),(9,'Alfonso','Zambrano','alfzamb@terra.es','677565455','2023-02-24 18:24:23','$2a$08$LtpdBVR.7JZDE6ipm84YIulOW6btVwjulaJl/fBnZHjbK1KtExXxy'),(10,'Marta','Moreno','marmor@terra.es','665781230','2023-02-25 15:53:36','$2a$08$BVgnLK53pqR4u8VifdGxsu2eBK79qymCkbj53BX87MaxW7l9TXUJW'),(11,'Juan','Fernández','juanfer@terra.es','677898989','2023-03-05 11:28:40','$2a$08$/tvzgBipPv0mv0h5bEdHHusVUZKE.oQdvthDD.bAHhflZCGnNJMyC'),(12,'Manuel','Jiménez','manji@gmail.com','765549821','2023-03-05 13:53:48','$2a$08$oWeyG26fq0rp1TkjG5w8F.W0BJbZQXBnLUnbLFJufbUAgSgWXET3q');
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

-- Dump completed on 2023-03-05 14:58:10
