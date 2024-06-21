/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.4.2-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Sistema_Expediente
-- ------------------------------------------------------
-- Server version	11.4.2-MariaDB-ubu2404

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `Aseguradoras`
--

DROP TABLE IF EXISTS `Aseguradoras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Aseguradoras` (
  `aseguradora_id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`aseguradora_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Aseguradoras`
--

LOCK TABLES `Aseguradoras` WRITE;
/*!40000 ALTER TABLE `Aseguradoras` DISABLE KEYS */;
INSERT INTO `Aseguradoras` VALUES
(1,'ASSA'),
(2,'ANCON'),
(3,'INTEROCEANICA'),
(4,'PARTICULAR');
/*!40000 ALTER TABLE `Aseguradoras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Estados`
--

DROP TABLE IF EXISTS `Estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Estados` (
  `estado_id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`estado_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Estados`
--

LOCK TABLES `Estados` WRITE;
/*!40000 ALTER TABLE `Estados` DISABLE KEYS */;
/*!40000 ALTER TABLE `Estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Expedientes`
--

DROP TABLE IF EXISTS `Expedientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Expedientes` (
  `expediente_id` int(11) NOT NULL,
  `id_expediente` int(11) DEFAULT NULL,
  `conductor` varchar(50) DEFAULT NULL,
  `aseguradora_id` int(11) DEFAULT NULL,
  `numero_caso` varchar(20) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `juzgado_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`expediente_id`),
  KEY `aseguradora_id` (`aseguradora_id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `juzgado_id` (`juzgado_id`),
  KEY `estado` (`estado`),
  CONSTRAINT `Expedientes_ibfk_1` FOREIGN KEY (`aseguradora_id`) REFERENCES `Aseguradoras` (`aseguradora_id`),
  CONSTRAINT `Expedientes_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `Usuarios` (`usuario_id`),
  CONSTRAINT `Expedientes_ibfk_3` FOREIGN KEY (`juzgado_id`) REFERENCES `Juzgados` (`juzgado_id`),
  CONSTRAINT `Expedientes_ibfk_4` FOREIGN KEY (`estado`) REFERENCES `Estados` (`estado_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Expedientes`
--

LOCK TABLES `Expedientes` WRITE;
/*!40000 ALTER TABLE `Expedientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Expedientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Juzgados`
--

DROP TABLE IF EXISTS `Juzgados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Juzgados` (
  `juzgado_id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `ubicacion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`juzgado_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Juzgados`
--

LOCK TABLES `Juzgados` WRITE;
/*!40000 ALTER TABLE `Juzgados` DISABLE KEYS */;
INSERT INTO `Juzgados` VALUES
(1,'JUZGADO 5TO (PEDREGAL)','Calle 423'),
(2,'JUZGADO 4TO (PEDREGAL)','Calle 156'),
(3,'JUZGADO 5TO (PEDREGAL)','Calle 789'),
(4,'JUZGADO 1RO (PEDREGAL)','Calle 111'),
(5,'JUZGADO 3RO (PEDREGAL)','Calle 13'),
(6,'ALCALDIA DE PANAMA','Calle 1334'),
(7,'CHITRE','Calle 890');
/*!40000 ALTER TABLE `Juzgados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reportes`
--

DROP TABLE IF EXISTS `Reportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reportes` (
  `reporte_id` int(11) NOT NULL,
  `expediente_id` int(11) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`reporte_id`),
  KEY `expediente_id` (`expediente_id`),
  CONSTRAINT `Reportes_ibfk_1` FOREIGN KEY (`expediente_id`) REFERENCES `Expedientes` (`expediente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reportes`
--

LOCK TABLES `Reportes` WRITE;
/*!40000 ALTER TABLE `Reportes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Reportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuarios`
--

DROP TABLE IF EXISTS `Usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuarios` (
  `usuario_id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `nombre_usuario` varchar(50) DEFAULT NULL,
  `contraseña` varchar(50) DEFAULT NULL,
  `rol` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuarios`
--

LOCK TABLES `Usuarios` WRITE;
/*!40000 ALTER TABLE `Usuarios` DISABLE KEYS */;
INSERT INTO `Usuarios` VALUES
(1,'ANTHONY TREJOS','anthonytrejos','password111','Administrador'),
(2,'LUIS MOLINA','luismolina','password222','Asistente'),
(3,'KATHERINE KENT','katherinekent','password333','Juez'),
(4,'MARTIN ALVARADO','martinalvarado','password012','Asistente'),
(5,'JOEL ARAUZ RODRIGUEZ','joelarauz','password445','Juez'),
(6,'MICHELLE VEGA','michellevega','password789','Asistente'),
(7,'CANDICE HENRY','candicehenry','password777','Juez');
/*!40000 ALTER TABLE `Usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2024-06-20 18:59:00
