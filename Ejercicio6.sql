CREATE DATABASE  IF NOT EXISTS `ejercicio_6` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ejercicio_6`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: ejercicio_6
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `dni` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellidos` varchar(90) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `ficha_clientes_idficha` int NOT NULL,
  PRIMARY KEY (`dni`),
  KEY `fk_clientes_ficha_clientes_idx` (`ficha_clientes_idficha`),
  CONSTRAINT `fk_clientes_ficha_clientes` FOREIGN KEY (`ficha_clientes_idficha`) REFERENCES `ficha_clientes` (`idficha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Juan','García','Calle Mayor 1','123456789',1),(2,'Ana','Sánchez','Plaza del Sol 2','987654321',2),(3,'Pedro','Fernández','Avenida de la Libertad 3','555555555',3),(4,'María','González','Calle del Carmen 4','666666666',4),(5,'Luis','Martínez','Calle de la Fuente 5','777777777',5),(6,'Lucía','Ruiz','Calle Real 6','999999999',6),(7,'Pablo','Hernández','Calle del Pilar 7','111111111',7),(8,'Laura','Gómez','Calle Mayor 8','222222222',8),(9,'Carlos','Torres','Calle de la Paz 9','333333333',9),(10,'Isabel','Díaz','Calle de la Luna 10','444444444',10),(11,'Antonio','Jiménez','Calle de la Rosa 11','888888888',11),(12,'Sara','Vega','Calle del Sol 12','777777777',12),(13,'Manuel','Ortega','Calle de la Cruz 13','666666666',13),(14,'Elena','Morales','Calle del Mar 14','555555555',14),(15,'Mario','Santos','Calle de la Plaza 15','444444444',15);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coches`
--

DROP TABLE IF EXISTS `coches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coches` (
  `matricula` int NOT NULL,
  `modelo` varchar(255) NOT NULL,
  `marca` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `clientes_dni` int NOT NULL,
  PRIMARY KEY (`matricula`),
  KEY `fk_coches_clientes1_idx` (`clientes_dni`),
  CONSTRAINT `fk_coches_clientes1` FOREIGN KEY (`clientes_dni`) REFERENCES `clientes` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coches`
--

LOCK TABLES `coches` WRITE;
/*!40000 ALTER TABLE `coches` DISABLE KEYS */;
INSERT INTO `coches` VALUES (1231,'Civic','Honda','Rojo',1),(1234,'Mazda3','Mazda','Rojo',6),(1239,'Sorento','Kia','Rojo',11),(3450,'Accord','Honda','Blanco',9),(3455,'Cruze','Chevrolet','Negro',14),(3457,'Focus','Ford','Blanco',4),(5672,'Elantra','Hyundai','Plateado',12),(5673,'Corolla','Toyota','Azul',2),(5674,'Camry','Toyota','Plateado',7),(7891,'Cruze','Chevrolet','Negro',15),(7892,'3-Series','BMW','Azul',10),(7893,'C-Class','Mercedes-Benz','Gris',5),(9012,'Outlander','Mitsubishi','Gris',13),(9013,'Golf','Volkswagen','Negro',3),(9019,'A4','Audi','Negro',8);
/*!40000 ALTER TABLE `coches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coches_nuevos`
--

DROP TABLE IF EXISTS `coches_nuevos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coches_nuevos` (
  `n_unidades` varchar(45) DEFAULT NULL,
  `coches_matricula` int NOT NULL,
  KEY `cochesNuevos_coches_idx` (`coches_matricula`),
  CONSTRAINT `cochesNuevos_coches` FOREIGN KEY (`coches_matricula`) REFERENCES `coches` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coches_nuevos`
--

LOCK TABLES `coches_nuevos` WRITE;
/*!40000 ALTER TABLE `coches_nuevos` DISABLE KEYS */;
INSERT INTO `coches_nuevos` VALUES ('1',1231),('1',5673),('2',9013),('1',3457),('3',7893),('1',1234),('5',5674),('1',9019);
/*!40000 ALTER TABLE `coches_nuevos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coches_viejos`
--

DROP TABLE IF EXISTS `coches_viejos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coches_viejos` (
  `n_kilometros` varchar(45) NOT NULL,
  `coches_matriculas` int NOT NULL,
  KEY `cochesViejos_coches_idx` (`coches_matriculas`),
  CONSTRAINT `cochesViejos_coches` FOREIGN KEY (`coches_matriculas`) REFERENCES `coches` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coches_viejos`
--

LOCK TABLES `coches_viejos` WRITE;
/*!40000 ALTER TABLE `coches_viejos` DISABLE KEYS */;
INSERT INTO `coches_viejos` VALUES ('30000',3450),('25000',7892),('34000',1239),('25000',5672),('34000',9012),('34000',3455),('34000',7891);
/*!40000 ALTER TABLE `coches_viejos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficha_clientes`
--

DROP TABLE IF EXISTS `ficha_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ficha_clientes` (
  `idficha` int NOT NULL,
  `dni` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `direccion` varchar(90) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  PRIMARY KEY (`idficha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha_clientes`
--

LOCK TABLES `ficha_clientes` WRITE;
/*!40000 ALTER TABLE `ficha_clientes` DISABLE KEYS */;
INSERT INTO `ficha_clientes` VALUES (1,'1','Juan','García','Calle Mayor 1','123456789'),(2,'2','Ana','Sánchez','Plaza del Sol 2','987654321'),(3,'3','Pedro','Fernández','Avenida de la Libertad 3','555555555'),(4,'4','María','González','Calle del Carmen 4','666666666'),(5,'5','Luis','Martínez','Calle de la Fuente 5','777777777'),(6,'6','Lucía','Ruiz','Calle Real 6','999999999'),(7,'7','Pablo','Hernández','Calle del Pilar 7','111111111'),(8,'8','Laura','Gómez','Calle Mayor 8','222222222'),(9,'9','Carlos','Torres','Calle de la Paz 9','333333333'),(10,'10','Isabel','Díaz','Calle de la Luna 10','444444444'),(11,'11','Antonio','Jiménez','Calle de la Rosa 11','888888888'),(12,'12','Sara','Vega','Calle del Sol 12','777777777'),(13,'13','Manuel','Ortega','Calle de la Cruz 13','666666666'),(14,'14','Elena','Morales','Calle del Mar 14','555555555'),(15,'15','Mario','Santos','Calle de la Plaza 15','444444444');
/*!40000 ALTER TABLE `ficha_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mecanicos`
--

DROP TABLE IF EXISTS `mecanicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mecanicos` (
  `dni` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellidos` varchar(90) NOT NULL,
  `fecha_contratacion` date NOT NULL,
  `salario` bigint NOT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mecanicos`
--

LOCK TABLES `mecanicos` WRITE;
/*!40000 ALTER TABLE `mecanicos` DISABLE KEYS */;
INSERT INTO `mecanicos` VALUES (11,'Juan','Perez','2020-01-01',1500),(22,'Maria','Garcia','2019-06-15',1800),(33,'Pedro','Rodriguez','2021-03-01',1200),(44,'Laura','Fernandez','2018-09-30',2000),(55,'Luis','Gomez','2017-12-01',1700);
/*!40000 ALTER TABLE `mecanicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reparaciones`
--

DROP TABLE IF EXISTS `reparaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reparaciones` (
  `idreparacion` int NOT NULL,
  `fecha_reparacion` date NOT NULL,
  `nhoras_arreglo` time NOT NULL,
  `coches_matricula` int NOT NULL,
  `mecanicos_dni` int NOT NULL,
  PRIMARY KEY (`idreparacion`),
  KEY `fk_reparaciones_coches1_idx` (`coches_matricula`),
  KEY `fk_reparaciones_mecanicos1_idx` (`mecanicos_dni`),
  CONSTRAINT `fk_reparaciones_coches1` FOREIGN KEY (`coches_matricula`) REFERENCES `coches` (`matricula`),
  CONSTRAINT `fk_reparaciones_mecanicos1` FOREIGN KEY (`mecanicos_dni`) REFERENCES `mecanicos` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reparaciones`
--

LOCK TABLES `reparaciones` WRITE;
/*!40000 ALTER TABLE `reparaciones` DISABLE KEYS */;
INSERT INTO `reparaciones` VALUES (1,'2023-03-20','02:30:00',7891,11),(2,'2023-03-25','04:00:00',3455,22),(3,'2023-03-22','01:15:00',9012,33),(4,'2023-03-27','03:45:00',5672,44),(5,'2023-03-24','02:00:00',1239,55);
/*!40000 ALTER TABLE `reparaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ejercicio_6'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-11 14:55:39
