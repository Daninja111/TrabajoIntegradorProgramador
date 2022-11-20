CREATE DATABASE  IF NOT EXISTS `bienesraices` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bienesraices`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: bienesraices
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `Id_Estado` int NOT NULL,
  `Nombre_Estado` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Id_Estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'DISPONIBLE'),(2,'NO DISPONIBLE');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operatoriacomercial`
--

DROP TABLE IF EXISTS `operatoriacomercial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operatoriacomercial` (
  `Id_OpComercial` int NOT NULL,
  `Nombre_OpComercial` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Id_OpComercial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operatoriacomercial`
--

LOCK TABLES `operatoriacomercial` WRITE;
/*!40000 ALTER TABLE `operatoriacomercial` DISABLE KEYS */;
INSERT INTO `operatoriacomercial` VALUES (1,'VENTA'),(2,'ALQUILER');
/*!40000 ALTER TABLE `operatoriacomercial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propiedad`
--

DROP TABLE IF EXISTS `propiedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propiedad` (
  `Id_Propiedad` int NOT NULL AUTO_INCREMENT,
  `idtipo` int DEFAULT NULL,
  `idestado` int DEFAULT NULL,
  `idopcomercial` int DEFAULT NULL,
  `idpropietario` int DEFAULT NULL,
  `Direccion` varchar(45) COLLATE utf8_bin NOT NULL,
  `Cant_Hab` int NOT NULL,
  `Cant_Banios` int NOT NULL,
  `Barrio` varchar(45) COLLATE utf8_bin NOT NULL,
  `Localidad` varchar(45) COLLATE utf8_bin NOT NULL,
  `Precio` int NOT NULL,
  PRIMARY KEY (`Id_Propiedad`),
  UNIQUE KEY `Id_Propiedad_UNIQUE` (`Id_Propiedad`),
  KEY `idestado_idx` (`idestado`),
  KEY `idtipo_idx` (`idtipo`),
  KEY `idop_idx` (`idopcomercial`),
  KEY `idpropieatario_idx` (`idpropietario`),
  CONSTRAINT `idestado` FOREIGN KEY (`idestado`) REFERENCES `estado` (`Id_Estado`),
  CONSTRAINT `idop` FOREIGN KEY (`idopcomercial`) REFERENCES `operatoriacomercial` (`Id_OpComercial`),
  CONSTRAINT `idpropieatario` FOREIGN KEY (`idpropietario`) REFERENCES `propietario` (`Id_Propietario`),
  CONSTRAINT `idtipo` FOREIGN KEY (`idtipo`) REFERENCES `tipo` (`Id_Tipo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedad`
--

LOCK TABLES `propiedad` WRITE;
/*!40000 ALTER TABLE `propiedad` DISABLE KEYS */;
INSERT INTO `propiedad` VALUES (1,1,1,2,1,'9 Marconi Road',3,2,'SAN VICENTE','CORDOBA',300),(2,3,2,1,5,'8842 Old Van Dyke Ave.',2,1,'LAS ROSAS','SANTA FE',45000),(3,2,1,2,3,'471 S. Cambridge Drive',0,1,'TIGRE','BUENOS AIRES',250),(4,5,1,2,6,'9 Military Dr.',1,1,'LUISINA','SAN LUIS',70000),(5,4,2,1,4,'8388 Pheasant Street',2,1,'CAYETANO','CHACO',260),(6,1,1,1,8,'221 Dogwood Dr.',4,2,'SAN VICENTE','CORDOBA',57000),(7,3,2,1,10,'911 Charles St.',3,2,'LAS ROSAS','SANTA FE',200),(8,2,1,2,17,'176 Henry Smith Ave.',2,1,'TIGRE','BUENOS AIRES',400),(9,5,1,2,19,'323 1st St.',0,1,'LUISINA','SAN LUIS',580),(10,4,2,1,2,'8127 Pawnee Lane',1,1,'CAYETANO','CHACO',80000),(11,1,1,1,7,'7813 Helen Ave.',2,1,'SAN VICENTE','CORDOBA',53000),(12,3,2,2,9,'353 Canterbury Dr.',4,2,'LAS ROSAS','SANTA FE',100000),(13,2,1,1,11,'61 Addison Dr.',1,1,'TIGRE','BUENOS AIRES',57000),(14,5,2,2,1,'810 West Mill St.',3,2,'LUISINA','SAN LUIS',200),(15,4,1,1,1,'51 Mayfair Court',2,1,'CAYETANO','CHACO',400),(16,1,2,2,5,'840 Oak Meadow Ave.',0,1,'SAN VICENTE','CORDOBA',580),(17,3,1,1,3,'257 Pheasant Drive',1,1,'LAS ROSAS','SANTA FE',80000),(18,2,2,2,6,'30 N. Park Avenue',3,2,'TIGRE','BUENOS AIRES',53000),(19,5,1,1,4,'850 School St.',2,1,'LUISINA','SAN LUIS',100000),(20,4,2,2,8,'59 Atlantic Ave.',0,1,'CAYETANO','CHACO',150);
/*!40000 ALTER TABLE `propiedad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propietario`
--

DROP TABLE IF EXISTS `propietario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propietario` (
  `Id_Propietario` int NOT NULL,
  `Nombre_Prop` varchar(45) COLLATE utf8_bin NOT NULL,
  `Direccion` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `Contacto` bigint NOT NULL,
  PRIMARY KEY (`Id_Propietario`),
  UNIQUE KEY `Contacto_UNIQUE` (`Contacto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propietario`
--

LOCK TABLES `propietario` WRITE;
/*!40000 ALTER TABLE `propietario` DISABLE KEYS */;
INSERT INTO `propietario` VALUES (1,'Leandra Anna Malo Alba','7943 S. Fifth Street',3511111111),(2,'Severo Granados Iglesia','77 Lyme Street',3511111112),(3,'Lucho Andreu Amat','9448 Fairfield St.',3511111113),(4,'Mat’as Mauricio Castillo Barrera','8143 College St.',3511111114),(5,'Mauricio Guijarro Castell—','9893 W. Vale Ave.',3511111115),(6,'Isaura Leyre AvilŽs Pelayo','8094 Albany Drive',3511111116),(7,'Soraya Morera-Lago','9001 Creek Street',3511111117),(8,'Victoriano Tapia-Cabanillas','57 Green Drive',3511111118),(9,'Nidia Saez Campoy','86 Surrey St.',3511111119),(10,'Te—fila Villanueva Molina','8728 Boston Street',3511111120),(11,'Trini de Alberdi','45 Heritage Ave.',3511111121),(12,'Dani Baena','9334 Hillside Street',3511111122),(13,'Angelina de Arregui','611 Academy Street',3511111123),(14,'Samuel de Carranza','7201 Mill Street',3511111124),(15,'Jacinta Montenegro GarcŽs','59 Ridgewood Ave.',3511111125),(16,'Lisandro Delgado Nadal','270 West Green Lake St.',3511111126),(17,'Samanta Manj—n Godoy','9481 S. Chestnut St.',3511111127),(18,'Albano Teodosio Ca–ete Rosa','7 N. Annadale Street',3511111128),(19,'Abel Villanueva','88 Pheasant Rd.',3511111129),(20,'Bienvenida Pulido C—zar','8 Galvin Street',3511111130);
/*!40000 ALTER TABLE `propietario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo` (
  `Id_Tipo` int NOT NULL,
  `Nombre_Tipo` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Id_Tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo`
--

LOCK TABLES `tipo` WRITE;
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
INSERT INTO `tipo` VALUES (1,'CASA'),(2,'DEPARTAMENTO'),(3,'OFICINA'),(4,'ESTACIONAMIENTO'),(5,'TERRENO');
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bienesraices'
--

--
-- Dumping routines for database 'bienesraices'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-19 22:41:21
