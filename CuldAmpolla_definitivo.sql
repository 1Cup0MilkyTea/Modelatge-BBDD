-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: localhost    Database: CuldAmpolla
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `Clientes`
--

DROP TABLE IF EXISTS `Clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clientes` (
  `idClientes` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Dirección` varchar(100) NOT NULL,
  `Teléfono` bigint NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Fecha_registro` date NOT NULL,
  `Recomendación` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idClientes`),
  UNIQUE KEY `idClientes_UNIQUE` (`idClientes`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clientes`
--

LOCK TABLES `Clientes` WRITE;
/*!40000 ALTER TABLE `Clientes` DISABLE KEYS */;
INSERT INTO `Clientes` VALUES (1,'Juan Rodríguez','Calle Asturias, 1, 1, A, Madrid, 08200, España',666336633,'jc@gmail.com','2020-01-01','Juan Riviera'),(2,'Mario Martínez','Calle Asturias, 2, 2, A, Madrid, 08200, España',666336634,'mm@gmail.com','2020-01-01',''),(3,'José García','Calle Asturias, 3, 3, A, Madrid, 08200, España',666336635,'jc@gmail.com','2020-01-01','Mario Martínez'),(4,'Mario Martínez','Calle Asturias, 4, 4, A, Madrid, 08200, España',666336636,'mm@gmail.com','2020-01-01','');
/*!40000 ALTER TABLE `Clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empleado`
--

DROP TABLE IF EXISTS `Empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empleado` (
  `idEmpleado` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idEmpleado`),
  UNIQUE KEY `idEmpleado_UNIQUE` (`idEmpleado`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empleado`
--

LOCK TABLES `Empleado` WRITE;
/*!40000 ALTER TABLE `Empleado` DISABLE KEYS */;
INSERT INTO `Empleado` VALUES (1,'Abel Azcona'),(2,'Bilel Elhoussin'),(3,'Carmen Caceres'),(4,'Diana Domínguez');
/*!40000 ALTER TABLE `Empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Gafas`
--

DROP TABLE IF EXISTS `Gafas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Gafas` (
  `idGafas` int NOT NULL AUTO_INCREMENT,
  ` Marca` varchar(45) NOT NULL,
  `Graduación_izquierda` decimal(4,2) NOT NULL,
  `Graduación_derecha` decimal(4,2) NOT NULL,
  `Montura_flotante` enum('sí','no') NOT NULL,
  `Montura_pasta` enum('sí','no') NOT NULL,
  `Montura_metálica` enum('sí','no') NOT NULL,
  `Color_montura` varchar(45) NOT NULL,
  `Color_izquierda` varchar(45) NOT NULL,
  `Color_derecha` varchar(45) NOT NULL,
  `Precio` decimal(6,2) NOT NULL,
  `Empleado_idEmpleado` int NOT NULL,
  `Marca_idMarca` int NOT NULL,
  PRIMARY KEY (`idGafas`),
  UNIQUE KEY `idGafas_UNIQUE` (`idGafas`),
  KEY `fk_Gafas_Empleado1_idx` (`Empleado_idEmpleado`),
  KEY `fk_Gafas_Marca1_idx` (`Marca_idMarca`),
  CONSTRAINT `fk_Gafas_Empleado1` FOREIGN KEY (`Empleado_idEmpleado`) REFERENCES `Empleado` (`idEmpleado`),
  CONSTRAINT `fk_Gafas_Marca1` FOREIGN KEY (`Marca_idMarca`) REFERENCES `Marca` (`idMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Gafas`
--

LOCK TABLES `Gafas` WRITE;
/*!40000 ALTER TABLE `Gafas` DISABLE KEYS */;
INSERT INTO `Gafas` VALUES (1,'Armonia',8.50,8.50,'sí','no','no','azul','azul','azul',300.00,1,1),(2,'Guezz',5.50,5.50,'no','sí','no','marrón','marrón','marrón',400.00,2,2),(3,'Raybon',3.50,3.50,'no','no','sí','verde','verde','verde',250.00,3,3),(4,'Carrero',6.50,6.50,'sí','no','no','rojo','rojo','rojo',600.00,4,4);
/*!40000 ALTER TABLE `Gafas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Marca`
--

DROP TABLE IF EXISTS `Marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Marca` (
  `idMarca` int NOT NULL AUTO_INCREMENT,
  `Proveedores_idProveedores` int NOT NULL,
  PRIMARY KEY (`idMarca`),
  UNIQUE KEY `idMarca_UNIQUE` (`idMarca`),
  KEY `fk_Marca_Proveedores1_idx` (`Proveedores_idProveedores`),
  CONSTRAINT `fk_Marca_Proveedores1` FOREIGN KEY (`Proveedores_idProveedores`) REFERENCES `Proveedores` (`idProveedores`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Marca`
--

LOCK TABLES `Marca` WRITE;
/*!40000 ALTER TABLE `Marca` DISABLE KEYS */;
INSERT INTO `Marca` VALUES (1,1),(2,2),(3,3),(4,4);
/*!40000 ALTER TABLE `Marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Proveedores`
--

DROP TABLE IF EXISTS `Proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Proveedores` (
  `idProveedores` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Dirección` varchar(100) NOT NULL,
  `Teléfono` bigint NOT NULL,
  `Fax` bigint NOT NULL,
  `NIF` varchar(45) NOT NULL,
  PRIMARY KEY (`idProveedores`),
  UNIQUE KEY `idProveedores_UNIQUE` (`idProveedores`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proveedores`
--

LOCK TABLES `Proveedores` WRITE;
/*!40000 ALTER TABLE `Proveedores` DISABLE KEYS */;
INSERT INTO `Proveedores` VALUES (1,'SUPERGAFAS','CAMINO DE ESPAÑA, 88, 1, A, 01436, ARTZINIEGA(ARABA/ÁLAVA), ESPAÑA',931247537,931247538,'W6583706D'),(2,'GAFASPORTODOS','CARRERA REAL, 57, 1, A, 26631, CIHURI(RIOJA, LA), ESPAÑA',970187022,970187023,'N4676708C'),(3,'GAFOTES','RONDA CATALUNYA, 26, 1, A, 48114, AMOREBIETA-ETXANO(BIZKAIA), ESPAÑA',953018244,953018245,'E57340473'),(4,'PASTAGAFAS','RONDA CATALUNYA, 26, 1, A, 48114, AMOREBIETA-ETXANO(BIZKAIA), ESPAÑA',953018244,953018245,'E57340473');
/*!40000 ALTER TABLE `Proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Venta`
--

DROP TABLE IF EXISTS `Venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Venta` (
  `Clientes_idClientes` int NOT NULL,
  `Gafas_idGafas` int NOT NULL,
  `Empleado_idEmpleado` int NOT NULL,
  PRIMARY KEY (`Clientes_idClientes`,`Gafas_idGafas`),
  KEY `fk_Clientes_has_Gafas_Gafas1_idx` (`Gafas_idGafas`),
  KEY `fk_Clientes_has_Gafas_Clientes1_idx` (`Clientes_idClientes`),
  KEY `fk_Venta_Empleado1_idx` (`Empleado_idEmpleado`),
  CONSTRAINT `fk_Clientes_has_Gafas_Clientes1` FOREIGN KEY (`Clientes_idClientes`) REFERENCES `Clientes` (`idClientes`),
  CONSTRAINT `fk_Clientes_has_Gafas_Gafas1` FOREIGN KEY (`Gafas_idGafas`) REFERENCES `Gafas` (`idGafas`),
  CONSTRAINT `fk_Venta_Empleado1` FOREIGN KEY (`Empleado_idEmpleado`) REFERENCES `Empleado` (`idEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Venta`
--

LOCK TABLES `Venta` WRITE;
/*!40000 ALTER TABLE `Venta` DISABLE KEYS */;
INSERT INTO `Venta` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4);
/*!40000 ALTER TABLE `Venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-01 18:58:37
