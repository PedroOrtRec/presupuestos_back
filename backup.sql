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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbgroups`
--

LOCK TABLES `dbgroups` WRITE;
/*!40000 ALTER TABLE `dbgroups` DISABLE KEYS */;
INSERT INTO `dbgroups` VALUES (1,'Cena de navidad','Por fin reunidos de nuevo','2023-02-14 23:38:27'),(3,'Viaje a Camboya','Intentad no pillar cocoroco','2023-02-27 18:58:33'),(4,'Cosas de casa','Los gastos del mes de Abril','2023-02-27 19:18:16'),(5,'Cumpleaños de Lola','En la casa de los abuelos','2023-02-27 19:21:26'),(6,'Cumpleaños sorpresa de Mariana','No vayáis a meter a Mariana','2023-02-27 19:27:01'),(7,'Despedida de soltera de Julia','En Marbella','2023-02-27 21:00:31'),(8,'Compra de la casa','gastos de notaría','2023-02-27 21:02:41'),(9,'Gastos de la comunidad','calle suspiro 22','2023-02-27 21:04:55'),(10,'Arreglar la calle privada','calle suspiro 22','2023-02-28 08:13:03'),(11,'Excursión','','2023-02-28 08:13:35'),(13,'Nuevo grupo','De prueba','2023-02-28 11:12:58'),(14,'Nuevo grupo','De prueba','2023-02-28 11:13:30'),(15,'Nuevo grupo',NULL,'2023-02-28 18:48:08'),(16,'Nuevo grupo',NULL,'2023-03-05 13:33:34'),(17,'Viaje a México','5/03/2023','2023-03-10 06:38:33'),(18,'Cumpleaños de Manuel','El viernes en casa de Marcos','2023-03-10 06:39:54'),(19,'Gastos de la casa','Calle Requejo 7','2023-03-10 06:45:49'),(20,'Cena del sabado','Fiesta en casa de Manuel','2023-03-10 07:10:41');
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
INSERT INTO `groups_has_users` VALUES (0,11,'viewer',0.00),(1,2,'admin',25.00),(1,3,'viewer',-20.00),(1,4,'viewer',-15.00),(1,10,'viewer',10.00),(2,6,'viewer',-5.00),(2,7,'viewer',5.00),(2,10,'admin',0.00),(3,10,'admin',NULL),(4,10,'admin',NULL),(5,10,'admin',0.00),(6,10,'admin',0.00),(7,10,'admin',0.00),(8,10,'admin',0.00),(9,10,'admin',0.00),(10,6,'viewer',0.00),(10,7,'viewer',0.00),(10,9,'viewer',0.00),(10,10,'admin',0.00),(10,11,'viewer',0.00),(11,10,'admin',0.00),(14,10,'admin',0.00),(14,11,'viewer',0.00),(15,6,'viewer',390.00),(15,7,'viewer',-10.00),(15,9,'viewer',-10.00),(15,10,'admin',-10.00),(16,10,'admin',0.00),(17,20,'viewer',38.00),(17,21,'viewer',24.00),(17,22,'viewer',-30.00),(17,23,'admin',-32.00),(18,14,'viewer',0.00),(18,15,'viewer',0.00),(18,16,'viewer',0.00),(18,23,'admin',0.00),(19,21,'viewer',8.00),(19,22,'viewer',-5.00),(19,23,'admin',-3.00),(20,15,'viewer',0.00),(20,24,'admin',0.00);
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
  `status` enum('checked','pending','accepted','declined') COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slices`
--

LOCK TABLES `slices` WRITE;
/*!40000 ALTER TABLE `slices` DISABLE KEYS */;
INSERT INTO `slices` VALUES (1,1,'langostinos',24.68),(2,1,'jamon',15.36),(3,2,'prueba desde workbench',100.00),(32,15,'Decimotercer Slice de Prueba',40.00),(33,1,'Pan',10.00),(34,1,'Filetes de pollo',10.00),(35,1,'Lechuga Fresca',5.00),(36,15,'Papas fritas',40.00),(37,15,'Decimotercer Slice de Prueba',40.00),(38,15,'Decimotercer Slice de Prueba',40.00),(39,15,'Decimotercer Slice de Prueba',40.00),(40,15,'Decimotercer Slice de Prueba',40.00),(41,15,'Decimotercer Slice de Prueba',40.00),(44,15,'Decimotercer Slice de Prueba',40.00),(45,15,'Decimotercer Slice de Prueba',40.00),(46,15,'Decimotercer Slice de Prueba',40.00),(48,17,'Barco por el río',80.00),(49,17,'Cena del sábado',44.00),(50,17,'taxi al hotel',12.00),(51,19,'Brócoli',6.00),(52,19,'Papel higiénico',8.00);
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
  PRIMARY KEY (`sliceId`,`userId`,`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slices_has_users`
--

LOCK TABLES `slices_has_users` WRITE;
/*!40000 ALTER TABLE `slices_has_users` DISABLE KEYS */;
INSERT INTO `slices_has_users` VALUES (1,2,'pay'),(1,3,'debt'),(2,4,'pay'),(2,5,'debt'),(2,6,'debt'),(9,6,'pay'),(9,7,'debt'),(9,9,'debt'),(9,10,'debt'),(10,6,'pay'),(10,7,'debt'),(10,9,'debt'),(10,10,'debt'),(12,6,'pay'),(12,7,'debt'),(12,9,'debt'),(12,10,'debt'),(13,6,'pay'),(13,7,'debt'),(13,9,'debt'),(13,10,'debt'),(14,6,'pay'),(14,7,'debt'),(14,9,'debt'),(14,10,'debt'),(21,6,'pay'),(21,7,'debt'),(21,9,'debt'),(21,10,'debt'),(22,6,'pay'),(22,7,'debt'),(22,9,'debt'),(22,10,'debt'),(23,6,'pay'),(23,7,'debt'),(23,9,'debt'),(23,10,'debt'),(24,6,'pay'),(24,7,'debt'),(24,9,'debt'),(24,10,'debt'),(25,6,'pay'),(25,7,'debt'),(25,9,'debt'),(25,10,'debt'),(26,6,'pay'),(26,7,'debt'),(26,9,'debt'),(26,10,'debt'),(27,6,'pay'),(27,7,'debt'),(27,9,'debt'),(27,10,'debt'),(28,6,'pay'),(28,7,'debt'),(28,9,'debt'),(28,10,'debt'),(29,6,'pay'),(29,7,'debt'),(29,9,'debt'),(29,10,'debt'),(30,6,'pay'),(30,7,'debt'),(30,9,'debt'),(30,10,'debt'),(31,6,'pay'),(31,7,'debt'),(31,9,'debt'),(31,10,'debt'),(32,6,'pay'),(32,7,'debt'),(32,9,'debt'),(32,10,'debt'),(33,2,'pay'),(33,2,'debt'),(33,3,'debt'),(33,4,'debt'),(33,10,'debt'),(34,2,'debt'),(34,3,'debt'),(34,4,'debt'),(34,10,'pay'),(34,10,'debt'),(35,2,'debt'),(35,3,'pay'),(36,6,'pay'),(36,6,'debt'),(36,7,'debt'),(36,9,'debt'),(36,10,'debt'),(37,6,'pay'),(37,6,'debt'),(37,7,'debt'),(37,9,'debt'),(37,10,'debt'),(38,6,'pay'),(38,6,'debt'),(38,7,'debt'),(38,9,'debt'),(38,10,'debt'),(39,6,'pay'),(39,6,'debt'),(39,7,'debt'),(39,9,'debt'),(39,10,'debt'),(40,6,'pay'),(40,6,'debt'),(40,7,'debt'),(40,9,'debt'),(40,10,'debt'),(41,6,'pay'),(41,6,'debt'),(41,7,'debt'),(41,9,'debt'),(41,10,'debt'),(42,6,'pay'),(42,6,'debt'),(42,7,'debt'),(42,9,'debt'),(42,10,'debt'),(43,6,'pay'),(43,6,'debt'),(43,7,'debt'),(43,9,'debt'),(43,10,'debt'),(44,6,'pay'),(44,6,'debt'),(44,7,'debt'),(44,9,'debt'),(44,10,'debt'),(45,6,'pay'),(45,6,'debt'),(45,7,'debt'),(45,9,'debt'),(45,10,'debt'),(46,6,'pay'),(46,6,'debt'),(46,7,'debt'),(46,9,'debt'),(46,10,'debt'),(47,6,'pay'),(47,6,'debt'),(47,7,'debt'),(47,9,'debt'),(47,10,'debt'),(48,20,'pay'),(48,20,'debt'),(48,21,'debt'),(48,22,'debt'),(48,23,'debt'),(49,20,'debt'),(49,21,'pay'),(49,22,'debt'),(50,22,'pay'),(50,23,'debt'),(51,22,'pay'),(51,22,'debt'),(51,23,'debt'),(52,21,'pay'),(52,22,'debt');
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
  `imagePath` varchar(255) DEFAULT NULL,
  `registreTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userId_UNIQUE` (`userId`),
  UNIQUE KEY `userEmail_UNIQUE` (`userEmail`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'Pedro','Molina','ped@mail.es','678676767',NULL,'2023-02-14 20:35:21','ireiu4'),(3,'Lucia','Vergara','luci99@outlook.com','655437812',NULL,'2023-02-14 23:35:50','burululu'),(4,'Marta','Naranjo','martammt@hotmail.es','644909122',NULL,'2023-02-14 23:35:50','cucume878'),(5,'Carlos','Sainz','charlywe@gmail.com','667212112',NULL,'2023-02-14 23:35:50','rarmel10'),(6,'Miguel','Noguera','miguelTorres@outlook.com','632908656',NULL,'2023-02-14 23:35:50','jilopq1'),(7,'Antonio','Bermúdez','ant@terra.es','670498919',NULL,'2023-02-16 22:51:36','787878'),(9,'Alfonso','Zambrano','alfzamb@terra.es','677565455',NULL,'2023-02-24 18:24:23','$2a$08$LtpdBVR.7JZDE6ipm84YIulOW6btVwjulaJl/fBnZHjbK1KtExXxy'),(10,'Marta','Moreno','marmor@terra.es','665781230','9ead22c4-59a6-45be-8118-fe335d973f2a.jpg','2023-02-25 15:53:36','$2a$08$BVgnLK53pqR4u8VifdGxsu2eBK79qymCkbj53BX87MaxW7l9TXUJW'),(11,'Juan','Fernández','juanfer@terra.es','677898989',NULL,'2023-03-05 11:28:40','$2a$08$/tvzgBipPv0mv0h5bEdHHusVUZKE.oQdvthDD.bAHhflZCGnNJMyC'),(12,'Manuel','Jiménez','manji@gmail.com','765549821',NULL,'2023-03-05 13:53:48','$2a$08$oWeyG26fq0rp1TkjG5w8F.W0BJbZQXBnLUnbLFJufbUAgSgWXET3q'),(13,'peter','petigrew','petpeter@gmail.com','689899091',NULL,'2023-03-05 21:16:45','$2a$08$YB87TOMj2jV6rF5KmLbCg.WPCgsZepJTBYUzzi0/oT0nRRRYyTQAS'),(14,'Anabel','Jiménez','anab@gmail.com','688127676','3ca13f30-4454-460d-894c-d25ef545fe44.jpg','2023-03-10 06:15:21','$2a$08$mIcAp3U6rzmWvC3ywGe9R.sOGxRuBef6NJVT9JX.lJmw/acP6NsjG'),(15,'Sonia','González','soni92@gmail.com','685434343','4d6d29a4-7c7e-46f6-a9db-1d0458147281.jpg','2023-03-10 06:17:05','$2a$08$P9lfuqpqJIEDgWkPK6j64uhlpxdPJtNySbRLaaMEvEYDvcbLdBfue'),(16,'Antonio','Gutiérrez','antoine@gmail.com','653219021','92376b08-0102-4847-a2be-37d4963c10b5.jpg','2023-03-10 06:18:22','$2a$08$bibEFsiS9pHrUcR9n9Dqi.qOmKRUMGGxLVD5ZzOdv8o7lZvKgV3dq'),(17,'Manuel','Simancas','manuele@gmail.com','688921350','1760349b-0403-4e08-9d5c-96f356e8e0a6.jpg','2023-03-10 06:19:09','$2a$08$UE2C5GtH1OazaSn5I95FlexUTu/.vXbiqO1YkcvGjqN2Fm5bahXFW'),(18,'Ana','Castilla','anxaesana@gmail.com','690909090','7eab2b1e-f1ae-4277-9117-f4559359abf3.jpg','2023-03-10 06:20:35','$2a$08$XAkjSv8Dem5xcxWMQ6/JM.MindppWuNZFGUqYv88rpJJncl6AFR/.'),(19,'María','Flores','mariflor@gmail.com','688565490','238d9882-4aa9-44bb-b723-cbda87dbbd50.jpg','2023-03-10 06:22:32','$2a$08$yWiXg.YetVjHmQ007KABVuihv2Zi.98Mqbj8TUwL9z.a2ooVx0Pny'),(20,'Belén','Moreno','belemor@gmail.com','688921314','d3b48117-cce8-45d7-bb34-333e027f6a23.jpg','2023-03-10 06:23:40','$2a$08$5XWzAMrfihCbYSlH6bDmFey4fdX49LL/TRkoRtre3lcR/VtBMlQU6'),(21,'Miguel','Ramírez','miguelramirez@gmail.com','647899077','a6f9da1a-9feb-464c-ba8a-003e140acbed.jpg','2023-03-10 06:25:30','$2a$08$WuUKWQosp2MhGJowZ8bgIuFMIWUkREj8AmJNqw/WbOo5pgBZrR2TW'),(22,'Dolores','Fernández','dolores92@gmail.com','651784567','eb2b7879-48a7-4f21-a1c6-94b8fa476370.jpg','2023-03-10 06:27:07','$2a$08$FygM0Pe/Xtn94ZiPJNnZYe8njag44NiMhZCSBshLhYgZrSdbC36fW'),(23,'Marcos','Rojas','marroj@gmail.com','688929213','ca19de0f-a42f-4c7f-81be-72cb9f9fecb8.jpg','2023-03-10 06:29:11','$2a$08$b6j2uUgp.//Vg5NN3cadkeUtmSbtfXldAQgHHsHOSTjZ.amypIiaS'),(24,'Manuel','Vargas','manuvarg@hotmail.com','678761441','8589f4ac-781d-4860-9d9c-c9cd74c46aa7.jpg','2023-03-10 06:54:00','$2a$08$/1zHcTp58qs.fJ3BNprJWe1Twj47YGR7p2FE9Y/.VYQReTIXKn6fS');
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

-- Dump completed on 2023-03-10 15:56:03
