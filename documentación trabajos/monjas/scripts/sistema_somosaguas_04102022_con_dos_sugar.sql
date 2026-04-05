-- MySQL dump 10.19  Distrib 10.3.34-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: sistema_somosaguas
-- ------------------------------------------------------
-- Server version	10.3.34-MariaDB-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accesos`
--

DROP TABLE IF EXISTS `accesos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accesos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `tipo` int(11) NOT NULL,
  `estado` int(11) DEFAULT -1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accesos`
--

LOCK TABLES `accesos` WRITE;
/*!40000 ALTER TABLE `accesos` DISABLE KEYS */;
/*!40000 ALTER TABLE `accesos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adjuntos`
--

DROP TABLE IF EXISTS `adjuntos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adjuntos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `tipo` int(11) DEFAULT NULL,
  `ruta` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adjuntos`
--

LOCK TABLES `adjuntos` WRITE;
/*!40000 ALTER TABLE `adjuntos` DISABLE KEYS */;
/*!40000 ALTER TABLE `adjuntos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ambiente`
--

DROP TABLE IF EXISTS `ambiente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ambiente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(150) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `estado` int(11) NOT NULL,
  `codigo_estancia` int(11) DEFAULT NULL,
  `codigo_planta` int(11) DEFAULT NULL,
  `eliminado` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  KEY `codigo_planta` (`codigo_planta`),
  CONSTRAINT `ambiente_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ambiente_ibfk_2` FOREIGN KEY (`codigo_planta`) REFERENCES `planta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ambiente`
--

LOCK TABLES `ambiente` WRITE;
/*!40000 ALTER TABLE `ambiente` DISABLE KEYS */;
/*!40000 ALTER TABLE `ambiente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automaticos`
--

DROP TABLE IF EXISTS `automaticos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automaticos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nemo` varchar(140) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `fila` int(11) DEFAULT NULL,
  `nemofila` varchar(140) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `codigo_cuadro` int(11) DEFAULT NULL,
  `rb_e_estado` int(11) DEFAULT NULL,
  `codigo_tp_e_estado` int(11) DEFAULT NULL,
  `rb_s_estado` int(11) DEFAULT NULL,
  `codigo_tp_s_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_cuadro` (`codigo_cuadro`),
  CONSTRAINT `automaticos_ibfk_1` FOREIGN KEY (`codigo_cuadro`) REFERENCES `cuadro` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automaticos`
--

LOCK TABLES `automaticos` WRITE;
/*!40000 ALTER TABLE `automaticos` DISABLE KEYS */;
INSERT INTO `automaticos` VALUES (1,'Diferencial entrada',0,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(2,'Automatico entrada zona 1',1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(3,'Automatico entrada zona 2',1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(4,'Diferencial lago',0,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(5,'Automatico lago',1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(6,'Diferencial pradera norte',0,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(7,'Automatico pradera norte Z1',1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(8,'Automatico pradera norte Z2',1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(9,NULL,-1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(10,NULL,-1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(11,NULL,-1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(12,NULL,-1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(13,NULL,-1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(14,NULL,-1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(15,NULL,-1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(16,NULL,-1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(17,'Diferencial  piscina exterior',0,2,'Fila 2',1,1,NULL,NULL,NULL,NULL),(18,'Automatico piscina exterior',1,2,'Fila 2',1,1,NULL,NULL,NULL,NULL),(19,'Diferencial Jacuzzi',0,2,'Fila 2',1,1,NULL,NULL,NULL,NULL),(20,'Automatico Jacuzzi',1,2,'Fila 2',1,1,NULL,NULL,NULL,NULL),(21,'Diferencial pradera sur',0,2,'Fila 2',1,1,NULL,NULL,NULL,NULL),(22,'Automatico pradera sur z1',1,2,'Fila 2',1,1,NULL,NULL,NULL,NULL),(23,'Automatico pradera sur z2',1,2,'Fila 2',1,1,NULL,NULL,NULL,NULL),(24,'Automatico pradera sur z3',1,2,'Fila 2',1,1,NULL,NULL,NULL,NULL),(25,'Automatico pradera sur z4',1,2,'Fila 2',1,1,NULL,NULL,NULL,NULL),(26,'Diferencial Lago sur',0,2,'Fila 2',1,1,NULL,NULL,NULL,NULL),(27,'Automatico Lago sur',1,2,'Fila 2',1,1,NULL,NULL,NULL,NULL),(28,NULL,-1,2,'Fila 2',1,1,NULL,NULL,NULL,NULL),(29,NULL,-1,2,'Fila 2',1,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `automaticos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bombas`
--

DROP TABLE IF EXISTS `bombas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bombas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `bombas_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bombas`
--

LOCK TABLES `bombas` WRITE;
/*!40000 ALTER TABLE `bombas` DISABLE KEYS */;
/*!40000 ALTER TABLE `bombas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bombas_previo_rutina`
--

DROP TABLE IF EXISTS `bombas_previo_rutina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bombas_previo_rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `bombas_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bombas_previo_rutina`
--

LOCK TABLES `bombas_previo_rutina` WRITE;
/*!40000 ALTER TABLE `bombas_previo_rutina` DISABLE KEYS */;
/*!40000 ALTER TABLE `bombas_previo_rutina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clima`
--

DROP TABLE IF EXISTS `clima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clima` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  `temperatura` float DEFAULT NULL,
  `consigna` float DEFAULT NULL,
  `humedad` float DEFAULT NULL,
  `co2` float DEFAULT NULL,
  `estado_fancoil` int(11) DEFAULT -1,
  `velocidad_fancoil` int(11) DEFAULT -1,
  `sleep_fancoil` int(11) DEFAULT -1,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `clima_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clima`
--

LOCK TABLES `clima` WRITE;
/*!40000 ALTER TABLE `clima` DISABLE KEYS */;
INSERT INTO `clima` VALUES (1,'2022-09-30 17:16:16','habitacion 2',26,0,23.19,21,NULL,NULL,-1,-1,-1),(2,'2022-10-03 07:35:02','habitacion 3',28,0,20.38,22,NULL,NULL,-1,-1,-1),(3,'2022-10-03 07:35:03','habitacion 4',30,1,21.62,22,NULL,NULL,-1,-1,-1),(4,'2022-10-03 07:35:01','habitacion 5',32,1,22.56,22,NULL,NULL,-1,-1,-1),(5,'2022-10-03 07:34:09','habitacion estudio',11,1,22.12,22,NULL,NULL,-1,-1,-1),(6,'2022-09-07 04:27:29','habitacion invitados',34,0,22.81,24,NULL,NULL,-1,-1,-1),(7,'2022-10-03 07:33:04','biblioteca',21,0,20.25,20,NULL,NULL,-1,-1,-1),(8,'2022-10-03 07:28:04','sala cine',14,0,21.5,24,NULL,NULL,-1,-1,-1),(9,'2022-10-03 07:32:03','bar',20,0,21.31,22,NULL,NULL,-1,-1,-1),(10,'2022-10-03 07:31:41','habitacion servicio 1',36,NULL,20.69,22,NULL,NULL,-1,-1,-1),(11,'2022-10-03 07:29:44','habitacion servicio 2',38,NULL,21.56,22,NULL,NULL,-1,-1,-1),(12,'2022-10-03 07:34:42','cocina comedor',44,NULL,20.44,22,NULL,NULL,-1,-1,-1),(13,'2022-10-03 07:32:04','sala tv',46,1,21.38,24,NULL,NULL,-1,-1,-1),(14,'2022-10-03 07:35:02','Hab. Alejandro',22,1,23,23,0,NULL,-1,-1,-1),(15,'2022-10-03 07:35:03','Baño Alejandro',23,1,21.69,22,NULL,NULL,-1,-1,-1),(16,'2022-10-03 07:32:03','Vestidor Alejandro',53,0,20.44,22,NULL,NULL,-1,-1,-1),(17,'2022-10-03 07:33:03','Hab. Rachel',24,0,22.88,22,NULL,NULL,-1,-1,-1),(18,'2022-10-03 07:33:03','Baño Rachel',25,0,22.38,22,NULL,NULL,-1,-1,-1),(19,'2022-10-03 07:35:02','Vestidor Rachel',54,0,23.19,22,NULL,NULL,-1,-1,-1),(20,'2022-10-03 07:34:04','Cocina Principal',15,1,24.5,21,NULL,NULL,-1,-1,-1),(21,'2022-10-03 07:35:04','Cocina Alejandro',17,1,23.75,21,NULL,NULL,-1,-1,-1),(22,'2022-10-03 07:35:03','Pasillo habitaciones',19,1,20.56,22,NULL,NULL,-1,-1,-1),(23,'2022-10-03 05:49:03','Comedor',13,1,22.12,18,NULL,NULL,-1,-1,-1);
/*!40000 ALTER TABLE `clima` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`fincahazard`@`localhost`*/ /*!50003 TRIGGER trigger_clima
   AFTER UPDATE ON clima
   FOR EACH ROW
   BEGIN


   DECLARE done INT DEFAULT 0;
   DECLARE cod_ope INT;
   DECLARE v_cumple INT;

   DECLARE cursor_operacion CURSOR FOR SELECT b.codigo_operacion
   FROM operacion_clima as b
   WHERE b.codigo_clima = NEW.id;

   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

   OPEN cursor_operacion;

   read_loop: LOOP

   FETCH cursor_operacion INTO cod_ope;

   IF done THEN
   LEAVE read_loop;
   END IF;

   IF NEW.consigna IS NULL THEN
      SELECT count(id)
      INTO v_cumple
      FROM operacion_clima
      WHERE estado = NEW.estado AND consigna IS NULL
      AND codigo_operacion = cod_ope;
   ELSE
      SELECT count(id)
      INTO v_cumple
      FROM operacion_clima
      WHERE estado = NEW.estado
      AND codigo_operacion = cod_ope;
   END IF;

   IF (v_cumple = 0) THEN
      UPDATE operacion SET estado = 0 WHERE id = cod_ope;
   ELSE
      UPDATE operacion SET estado = 1 WHERE id = cod_ope;
   END IF;

   END LOOP;

   CLOSE cursor_operacion;

   END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `clima_previo_rutina`
--

DROP TABLE IF EXISTS `clima_previo_rutina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clima_previo_rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  `temperatura` float DEFAULT NULL,
  `consigna` float DEFAULT NULL,
  `humedad` float DEFAULT NULL,
  `co2` float DEFAULT NULL,
  `estado_fancoil` int(11) DEFAULT -1,
  `velocidad_fancoil` int(11) DEFAULT -1,
  `sleep_fancoil` int(11) DEFAULT -1,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `clima_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clima_previo_rutina`
--

LOCK TABLES `clima_previo_rutina` WRITE;
/*!40000 ALTER TABLE `clima_previo_rutina` DISABLE KEYS */;
/*!40000 ALTER TABLE `clima_previo_rutina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comando`
--

DROP TABLE IF EXISTS `comando`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comando` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `tipodriver` varchar(30) DEFAULT NULL,
  `f1` varchar(30) DEFAULT NULL,
  `f2` varchar(30) DEFAULT NULL,
  `f3` varchar(30) DEFAULT NULL,
  `nemo` varchar(100) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `puerto` varchar(20) DEFAULT NULL,
  `eco` int(11) DEFAULT NULL,
  `velocidad` int(11) DEFAULT NULL,
  `numcomando` int(11) DEFAULT NULL,
  `puertoserie` varchar(20) DEFAULT NULL,
  `emisor` varchar(20) DEFAULT NULL,
  `receptor` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comando`
--

LOCK TABLES `comando` WRITE;
/*!40000 ALTER TABLE `comando` DISABLE KEYS */;
INSERT INTO `comando` VALUES (1,'2022-04-02 08:48:04','Raspberry','somosaguas','','baja H','habitacion 2','80.28.98.191','53137',NULL,NULL,NULL,NULL,NULL,NULL),(2,'2022-04-03 12:11:14','Raspberry','somosaguas','','baja H','habitacion 3','80.28.98.191','53141',NULL,NULL,NULL,NULL,NULL,NULL),(3,'2022-04-03 21:05:39','Raspberry','somosaguas','','baja H','habitacion 4','80.28.98.191','53133',NULL,NULL,NULL,NULL,NULL,NULL),(4,'2022-04-03 21:47:33','Raspberry','somosaguas','','baja H','habitacion 5','80.28.98.191','53134',NULL,NULL,NULL,NULL,NULL,NULL),(5,'2022-04-03 22:08:32','Raspberry','somosaguas','','primera','habitacion estudio','80.28.98.191','53144',NULL,NULL,NULL,NULL,NULL,NULL),(6,'2022-04-03 22:20:14','Raspberry','somosaguas','','sotano H','habitacion invitados','80.28.98.191','53149',NULL,NULL,NULL,NULL,NULL,NULL),(7,'2022-04-25 10:36:50','Raspberry','somosaguas','','baja Z','biblioteca','80.28.98.191','53143',NULL,NULL,NULL,NULL,NULL,NULL),(8,'2022-04-25 11:20:33','Raspberry','Somosaguas','','Baja Z','Bar','80.28.98.191','53142',NULL,NULL,NULL,NULL,NULL,NULL),(9,'2022-05-10 09:45:05','Raspberry','somosaguas','','sotano H','zona servicio','80.28.98.191','53135',NULL,NULL,NULL,NULL,NULL,NULL),(10,'2022-05-29 23:06:37','Raspberry','somosaguas','','sotano Z','Lavanderia','80.28.98.191','53131',NULL,NULL,NULL,NULL,NULL,NULL),(11,'2022-06-03 15:20:36','Raspberry','somosaguas','','baja Z','entrada comedor sala tv 1','80.28.98.191','53138',NULL,NULL,NULL,NULL,NULL,NULL),(12,'2022-06-03 15:23:25','Raspberry','somosaguas','','baja Z','entrada comedor sala tv 2','80.28.98.191','53154',NULL,NULL,NULL,NULL,NULL,NULL),(13,'2022-06-20 18:39:07','Somfy','somosaguas','','','persianas','80.28.98.191','53139',NULL,NULL,0,NULL,'FFFF00','05F0CB'),(14,'2022-06-20 19:14:34','Somfy','somosaguas','','sotano H','estor habitacion invitados','80.28.98.191','53139',NULL,NULL,0,NULL,'FFFF00','0D2157'),(15,'2022-06-20 19:15:33','Somfy','somosaguas','','baja H','estor habitacion 5','80.28.98.191','53134',NULL,NULL,0,NULL,'FFFF00','0CAD82'),(16,'2022-06-20 19:16:00','Somfy','somosaguas','','baja H','estor habitacion 3','80.28.98.191','53141',NULL,NULL,0,NULL,'FFFF00','0D2738'),(17,'2022-06-20 19:16:18','Somfy','somosaguas','','baja H','estor habitacion 4','80.28.98.191','53133',NULL,NULL,0,NULL,'FFFF00','0C7B28'),(18,'2022-06-20 19:16:34','Somfy','somosaguas','','baja H','estor habitacion 2','80.28.98.191','53137',NULL,NULL,0,NULL,'FFFF00','0CB0BE'),(19,'2022-06-20 19:16:59','Somfy','somosaguas','','baja H','estor vestidor alejandro derecha','80.28.98.191','53139',NULL,NULL,0,NULL,'FFFF00','0CB0D7'),(20,'2022-06-20 19:17:19','Somfy','somosaguas','','baja H','estor vestidor alejandro izquierda','80.28.98.191','53139',NULL,NULL,0,NULL,'FFFF00','0C6EF1'),(21,'2022-06-20 19:17:45','Somfy','somosaguas','','primera','estor habitacion estudio izquierda','80.28.98.191','53144',NULL,NULL,0,NULL,'FFFF00','0D273A'),(22,'2022-06-20 19:18:06','Somfy','somosaguas','','primera','estor habitacion estudio centro','80.28.98.191','53144',NULL,NULL,0,NULL,'FFFF00','0D2731'),(23,'2022-06-20 19:18:35','Somfy','somosaguas','','primera','estor habitacion estudio derecha','80.28.98.191','53144',NULL,NULL,0,NULL,'FFFF00','0D2753'),(24,'2022-06-22 22:39:27','Somfy','somosguas','','sotano H','estor habitacion servicio 1','80.28.98.191','53135',NULL,NULL,0,NULL,'FFFF00','0D2735'),(25,'2022-06-22 22:43:15','Somfy','somosguas','','sotano H','estor habitacion servicio 2 dcha','80.28.98.191','53135',NULL,NULL,0,NULL,'FFFF00','0D2746'),(26,'2022-06-22 22:56:15','Raspberry','somosaguas','','baja H','habitacion alejandro','80.28.98.191','53139',NULL,NULL,NULL,NULL,NULL,NULL),(27,'2022-06-22 23:45:56','Raspberry','somosaguas','','baja H','habitacion Rachel','80.28.98.191','53140',NULL,NULL,NULL,NULL,NULL,NULL),(28,'2022-06-23 01:17:17','Raspberry','somosaguas','','baja Z','cocina','80.28.98.191','53130',NULL,NULL,NULL,NULL,NULL,NULL),(29,'2022-07-02 14:00:15','Somfy','somosaguas','','sotano Z','estor habitacion servicio 2 izq','80.28.98.191','53135',NULL,NULL,0,NULL,'FFFF00','0D2732'),(30,'2022-07-05 18:02:21','Ibercomp8sdserie_conv','somosaguas','','baja H','armario suelo radiante 8','80.28.98.191','53050',NULL,NULL,1,NULL,NULL,NULL),(31,'2022-07-05 20:56:44','Ibercomp8sdserie_conv','somosaguas','','baja H','armario suelo radiante 8 2','80.28.98.191','53050',NULL,NULL,2,NULL,NULL,NULL),(32,'2022-07-05 21:31:27','Ibercomp8edserie_conv','somosaguas','','baja H','armario suelo radiante 8 ed','80.28.98.191','53050',NULL,NULL,3,NULL,NULL,NULL),(33,'2022-07-05 21:35:18','Ibercomp8edserie_conv','somosaguas','','baja H','armario suelo radiante 8 2 ed','80.28.98.191','53050',NULL,NULL,4,NULL,NULL,NULL),(34,'2022-07-05 21:46:31','Ibercomp8sdserie_conv','somosaguas','','baja Z','armario suelo radiante 5','80.28.98.191','53050',NULL,NULL,5,NULL,NULL,NULL),(35,'2022-07-05 21:49:52','Ibercomp8edserie_conv','somosaguas','','baja Z','armario suelo radiante 5 ed','80.28.98.191','53050',NULL,NULL,6,NULL,NULL,NULL),(36,'2022-07-05 22:06:26','Ibercomp8sdserie_conv','somosaguas','','baja Z','armario suelo radiante 4','80.28.98.191','53050',NULL,NULL,7,NULL,NULL,NULL),(37,'2022-07-05 22:09:10','Ibercomp8edserie_conv','somosaguas','','baja Z','armario suelo radiante 4 ed','80.28.98.191','53050',NULL,NULL,8,NULL,NULL,NULL),(38,'2022-07-07 16:49:44','Analizador','somosaguas','','','analizador','80.28.98.191','53101',NULL,NULL,1,NULL,NULL,NULL),(39,'2022-07-07 17:22:45','Sungrow','somosaguas','','','sungrow','80.28.98.191','53100',NULL,NULL,247,NULL,NULL,NULL),(40,'2022-07-12 00:53:50','Raspberry','somosaguas','','sotano Z','Gimnasio','80.28.98.191','53147',NULL,NULL,NULL,NULL,NULL,NULL),(41,'2022-07-12 00:55:12','Raspberry','somosaguas','','sotano Z','Piscina Interior','80.28.98.191','53132',NULL,NULL,NULL,NULL,NULL,NULL),(42,'2022-07-12 18:08:53','Raspberry','somosaguas','','pt primera','Estudio','80.28.98.191','53145',NULL,NULL,NULL,NULL,NULL,NULL),(43,'2022-08-18 08:04:10','Ibercomp8sdserie_conv','somosaguas','','Lagos','fuente entrada principal','80.28.98.191','53057',NULL,NULL,1,NULL,NULL,NULL),(44,'2022-08-18 08:04:42','Ibercomp8edserie_conv','somosaguas','','Lagos','fuente entrada principal ed','80.28.98.191','53057',NULL,NULL,2,NULL,NULL,NULL),(45,'2022-08-18 08:05:22','Ibercomp8sdserie_conv','somosaguas','','Lagos','fuente interior planta baja','80.28.98.191','53057',NULL,NULL,3,NULL,NULL,NULL),(46,'2022-08-18 08:05:27','Ibercomp8edserie_conv','somosaguas','','Lagos','fuente interior planta baja ed','80.28.98.191','53057',NULL,NULL,4,NULL,NULL,NULL),(47,'2022-08-18 08:22:17','Ibercomp8sdserie_conv','somosaguas','','Lagos','fuente terraza sala cine','80.28.98.191','53057',NULL,NULL,5,NULL,NULL,NULL),(48,'2022-08-18 08:22:26','Ibercomp8edserie_conv','somosaguas','','Lagos','fuente terraza sala cine ed','80.28.98.191','53057',NULL,NULL,6,NULL,NULL,NULL),(49,'2022-08-18 08:22:43','Ibercomp8sdserie_conv','somosaguas','','Lagos','lago jardin','80.28.98.191','53057',NULL,NULL,7,NULL,NULL,NULL),(50,'2022-08-18 08:22:50','Ibercomp8edserie_conv','somosaguas','','Lagos','lago jardin ed','80.28.98.191','53057',NULL,NULL,8,NULL,NULL,NULL),(51,'2022-08-25 11:46:59','Somfy','somosaguas','','baja Z','estor cocina','80.28.98.191','53130',NULL,NULL,0,NULL,'FFFF00','0D2741'),(52,'2022-08-30 08:54:08','Md02','somosaguas','','','sonda md02 1','80.28.98.191','53050',NULL,NULL,1,NULL,NULL,NULL),(53,'2022-08-30 23:47:51','Sugarvalley_conv','somosaguas','','','sugar 1','80.28.98.191','53056',NULL,NULL,1,NULL,NULL,NULL),(54,'2022-09-07 05:27:21','Raspberry','somosaguas','','sotano Z','depuracion piscina interior','80.28.98.191','53155',NULL,NULL,NULL,NULL,NULL,NULL),(55,'2022-09-07 05:37:22','Raspberry','somosaguas','','exterior','Piscina exterior','80.28.98.191','53148',NULL,NULL,NULL,NULL,NULL,NULL),(56,'2022-09-08 16:31:35','Ibercomp_sonda','somosaguas','','Sotano Z','sonda ibecomp depuradora','80.28.98.191','53155',NULL,NULL,1,NULL,NULL,NULL),(57,'2022-09-22 15:57:18','Somfy','somosaguas','','Baja H','Estor Baño alejandro','80.28.98.191','53139',NULL,NULL,0,NULL,'FFFF00','0CB0D9'),(58,'2022-10-04 08:46:14','Sugarvalley_conv','somosaguas','','','sugar 2','80.28.98.191','53061',NULL,NULL,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `comando` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuracionsoa`
--

DROP TABLE IF EXISTS `configuracionsoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuracionsoa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `host` varchar(150) DEFAULT NULL,
  `usuario` varchar(150) DEFAULT NULL,
  `clave` varchar(150) DEFAULT NULL,
  `canal` varchar(150) DEFAULT NULL,
  `ippc` varchar(150) DEFAULT NULL,
  `bd` varchar(150) DEFAULT NULL,
  `rutasoa` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracionsoa`
--

LOCK TABLES `configuracionsoa` WRITE;
/*!40000 ALTER TABLE `configuracionsoa` DISABLE KEYS */;
INSERT INTO `configuracionsoa` VALUES (1,'2022-04-02 08:46:23','localhost','fincahazard','Fin-1503','3306','192_168_1_130','sistema_somosaguas','/home/soa/sistema_somosaguas/');
/*!40000 ALTER TABLE `configuracionsoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuadro`
--

DROP TABLE IF EXISTS `cuadro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuadro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_planta` int(11) DEFAULT NULL,
  `codigo_estancia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_planta` (`codigo_planta`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `cuadro_ibfk_1` FOREIGN KEY (`codigo_planta`) REFERENCES `planta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cuadro_ibfk_2` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuadro`
--

LOCK TABLES `cuadro` WRITE;
/*!40000 ALTER TABLE `cuadro` DISABLE KEYS */;
INSERT INTO `cuadro` VALUES (1,'C1 - Alumbrado Exterior',NULL,NULL);
/*!40000 ALTER TABLE `cuadro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documento`
--

DROP TABLE IF EXISTS `documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NULL DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `nemo` varchar(45) NOT NULL,
  `padre` int(11) DEFAULT NULL,
  `codigo_adjunto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_documento_1_idx` (`codigo_adjunto`),
  CONSTRAINT `fk_documento_1` FOREIGN KEY (`codigo_adjunto`) REFERENCES `adjuntos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento`
--

LOCK TABLES `documento` WRITE;
/*!40000 ALTER TABLE `documento` DISABLE KEYS */;
/*!40000 ALTER TABLE `documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envioscorreo`
--

DROP TABLE IF EXISTS `envioscorreo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `envioscorreo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `correo` varchar(50) DEFAULT NULL,
  `asunto` varchar(250) DEFAULT NULL,
  `texto` text DEFAULT NULL,
  `adjunto` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envioscorreo`
--

LOCK TABLES `envioscorreo` WRITE;
/*!40000 ALTER TABLE `envioscorreo` DISABLE KEYS */;
/*!40000 ALTER TABLE `envioscorreo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enviossms`
--

DROP TABLE IF EXISTS `enviossms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enviossms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `telefono` varchar(20) DEFAULT NULL,
  `texto` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enviossms`
--

LOCK TABLES `enviossms` WRITE;
/*!40000 ALTER TABLE `enviossms` DISABLE KEYS */;
/*!40000 ALTER TABLE `enviossms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escenas`
--

DROP TABLE IF EXISTS `escenas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `escenas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `tipodomo` int(11) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `eliminado` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `escenas_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escenas`
--

LOCK TABLES `escenas` WRITE;
/*!40000 ALTER TABLE `escenas` DISABLE KEYS */;
INSERT INTO `escenas` VALUES (1,'2022-04-26 10:26:19','apagar',26,2,1,0,0),(2,'2022-04-26 10:26:19','apagar',27,1,1,0,0),(3,'2022-04-26 10:26:19','apagar',28,1,1,0,0),(4,'2022-04-26 10:26:19','apagar',29,1,1,0,0),(5,'2022-04-26 10:26:19','apagar',30,1,1,0,0),(6,'2022-04-26 10:26:19','apagar',31,1,1,0,0),(7,'2022-04-26 10:26:19','apagar',32,1,1,0,0),(8,'2022-04-26 10:26:19','apagar',33,1,1,0,0),(9,'2022-04-26 10:26:19','apagar',11,1,1,0,0),(10,'2022-04-26 10:26:19','apagar',12,1,1,0,0),(11,'2022-04-26 10:26:19','apagar',34,2,1,0,0),(12,'2022-04-26 10:26:19','apagar',35,1,1,0,0),(13,'2022-04-26 10:26:20','máxima',26,0,1,1,0),(14,'2022-04-26 10:26:20','máxima',27,0,1,1,0),(15,'2022-04-26 10:26:20','máxima',28,0,1,1,0),(16,'2022-04-26 10:26:20','máxima',29,0,1,1,0),(17,'2022-04-26 10:26:20','máxima',30,0,1,1,0),(18,'2022-04-26 10:26:20','máxima',31,0,1,1,0),(19,'2022-04-26 10:26:20','máxima',32,0,1,1,0),(20,'2022-04-26 10:26:20','máxima',33,0,1,1,0),(21,'2022-04-26 10:26:20','máxima',11,0,1,1,0),(22,'2022-04-26 10:26:20','máxima',12,0,1,1,0),(23,'2022-04-26 10:26:20','máxima',34,0,1,1,0),(24,'2022-04-26 10:26:20','máxima',35,0,1,1,0),(25,'2022-06-05 18:11:49','apagar',38,1,1,0,0),(26,'2022-06-05 18:11:50','apagar',39,0,1,0,0),(27,'2022-06-05 18:11:50','apagar',36,2,1,0,0),(28,'2022-06-05 18:11:52','apagar',37,2,1,0,0),(29,'2022-06-05 18:11:52','apagar',56,1,1,0,1),(30,'2022-06-05 18:11:53','apagar',44,0,1,0,0),(31,'2022-06-05 18:11:53','apagar',43,2,1,0,0),(32,'2022-06-05 18:11:54','apagar',19,2,1,0,0),(33,'2022-06-05 18:11:55','apagar',13,1,1,0,0),(34,'2022-06-05 18:11:55','apagar',46,1,1,0,1),(35,'2022-06-05 18:11:56','apagar',16,0,1,0,0),(36,'2022-06-05 18:11:57','máxima',38,0,1,1,0),(37,'2022-06-05 18:11:57','máxima',39,2,1,1,0),(38,'2022-06-05 18:11:58','máxima',36,0,1,1,0),(39,'2022-06-05 18:11:58','máxima',37,0,1,1,0),(40,'2022-06-05 18:11:58','máxima',56,0,1,1,1),(41,'2022-06-05 18:11:59','máxima',44,2,1,1,0),(42,'2022-06-05 18:12:00','máxima',43,0,1,1,0),(43,'2022-06-05 18:12:00','máxima',19,0,1,1,0),(44,'2022-06-05 18:12:01','máxima',13,0,1,1,0),(45,'2022-06-05 18:12:02','máxima',46,0,1,1,1),(46,'2022-06-05 18:12:02','máxima',16,2,1,1,0),(47,'2022-06-23 22:39:16','apagar',55,1,1,0,1),(48,'2022-06-23 22:39:17','apagar',22,1,1,0,0),(49,'2022-06-23 22:39:18','apagar',23,1,1,0,0),(50,'2022-06-23 22:39:18','apagar',53,1,1,0,0),(51,'2022-06-23 22:39:19','apagar',24,1,1,0,0),(52,'2022-06-23 22:39:19','apagar',25,1,1,0,0),(53,'2022-06-23 22:39:20','apagar',54,1,1,0,0),(54,'2022-06-23 22:39:21','apagar',71,1,1,0,0),(55,'2022-06-23 22:39:22','máxima',55,1,1,1,1),(56,'2022-06-23 22:39:22','máxima',22,0,1,1,0),(57,'2022-06-23 22:39:22','máxima',23,0,1,1,0),(58,'2022-06-23 22:39:23','máxima',53,0,1,1,0),(59,'2022-06-23 22:39:24','máxima',24,0,1,1,0),(60,'2022-06-23 22:39:24','máxima',25,0,1,1,0),(61,'2022-06-23 22:39:25','máxima',54,0,1,1,0),(62,'2022-06-23 22:39:25','máxima',71,0,1,1,0),(63,'2022-06-23 22:39:25','apagar',15,2,1,0,0),(64,'2022-06-23 22:39:26','apagar',17,1,1,0,0),(65,'2022-06-23 22:39:27','apagar',65,1,1,0,1),(66,'2022-06-23 22:39:27','apagar',49,1,1,0,1),(67,'2022-06-23 22:39:28','apagar',51,1,1,0,1),(68,'2022-06-23 22:39:28','apagar',50,1,1,0,1),(69,'2022-06-23 22:39:28','apagar',72,1,1,0,0),(70,'2022-06-23 22:39:29','apagar',68,1,1,0,1),(71,'2022-06-23 22:39:29','apagar',52,1,1,0,1),(72,'2022-06-23 22:39:30','máxima',15,0,1,1,0),(73,'2022-06-23 22:39:30','máxima',17,0,1,1,0),(74,'2022-06-23 22:39:31','máxima',65,0,1,1,1),(75,'2022-06-23 22:39:32','máxima',49,0,1,1,1),(76,'2022-06-23 22:39:32','máxima',51,0,1,1,1),(77,'2022-06-23 22:39:33','máxima',50,0,1,1,1),(78,'2022-06-23 22:39:33','máxima',72,0,1,1,0),(79,'2022-06-23 22:39:34','máxima',68,0,1,1,1),(80,'2022-06-23 22:39:34','máxima',52,0,1,1,1),(81,'2022-06-24 05:28:21','apagar',21,1,1,0,0),(82,'2022-06-24 05:28:21','apagar',47,1,1,0,1),(83,'2022-06-24 05:28:22','apagar',20,1,1,0,0),(84,'2022-06-24 05:28:22','apagar',14,1,1,0,0),(85,'2022-06-24 05:28:22','máxima',21,0,1,1,0),(86,'2022-06-24 05:28:23','máxima',47,0,1,1,1),(87,'2022-06-24 05:28:23','máxima',20,0,1,1,0),(88,'2022-06-24 05:28:24','máxima',14,0,1,1,0),(89,'2022-06-24 16:04:07','apagar',18,1,1,0,0),(90,'2022-06-24 16:04:07','máxima',18,0,1,1,0),(91,'2022-06-24 16:14:03','apagar',73,0,1,0,0),(92,'2022-06-24 16:14:03','máxima',73,1,1,1,0),(93,'2022-06-28 10:27:12','apagar',48,1,1,0,1),(94,'2022-06-28 10:27:12','máxima',48,0,1,1,1),(95,'2022-07-02 14:16:59','standard',26,0,1,2,0),(96,'2022-07-02 14:16:59','standard',27,0,1,2,0),(97,'2022-07-02 14:17:00','standard',28,0,1,2,0),(98,'2022-07-02 14:17:00','standard',29,0,1,2,0),(99,'2022-07-02 14:17:00','standard',30,0,1,2,0),(100,'2022-07-02 14:17:01','standard',31,0,1,2,0),(101,'2022-07-02 14:17:01','standard',32,0,1,2,0),(102,'2022-07-02 14:17:03','standard',33,0,1,2,0),(103,'2022-07-02 14:17:03','standard',11,0,1,2,0),(104,'2022-07-02 14:17:03','standard',12,0,1,2,0),(105,'2022-07-02 14:17:04','standard',34,0,1,2,0),(106,'2022-07-02 14:17:04','standard',35,0,1,2,0),(107,'2022-07-02 14:17:04','standard',21,0,1,2,0),(108,'2022-07-02 14:17:04','standard',20,0,1,2,0),(109,'2022-07-02 14:17:05','standard',14,0,1,2,0),(110,'2022-07-02 14:17:06','standard',18,0,1,2,0),(111,'2022-07-02 14:17:06','standard',38,0,1,2,0),(112,'2022-07-02 14:17:07','standard',39,0,1,2,0),(113,'2022-07-02 14:17:07','standard',36,0,1,2,0),(114,'2022-07-02 14:17:08','standard',37,0,1,2,0),(115,'2022-07-02 14:17:08','standard',44,0,1,2,0),(116,'2022-07-02 14:17:08','standard',43,0,1,2,0),(117,'2022-07-02 14:17:08','standard',19,0,1,2,0),(118,'2022-07-02 14:17:09','standard',13,0,1,2,0),(119,'2022-07-02 14:17:09','standard',72,0,1,2,0),(120,'2022-07-02 14:17:09','standard',73,0,1,2,0),(121,'2022-07-02 14:17:10','standard',16,0,1,2,0),(122,'2022-07-02 14:17:10','standard',22,0,1,2,0),(123,'2022-07-02 14:17:11','standard',23,0,1,2,0),(124,'2022-07-02 14:17:11','standard',53,0,1,2,0),(125,'2022-07-02 14:17:11','standard',24,0,1,2,0),(126,'2022-07-02 14:17:12','standard',25,0,1,2,0),(127,'2022-07-02 14:17:12','standard',54,0,1,2,0),(128,'2022-07-02 14:17:12','standard',71,0,1,2,0),(129,'2022-07-02 14:17:12','standard',15,0,1,2,0),(130,'2022-07-02 14:17:12','standard',17,0,1,2,0),(131,'2022-07-07 17:20:11','subir todo',53,0,3,1,0),(132,'2022-07-07 17:20:12','subir todo',11,0,3,1,0),(133,'2022-07-07 17:20:12','bajar todo',53,0,3,0,0),(134,'2022-07-07 17:20:12','bajar todo',11,0,3,0,0),(135,'2022-07-07 17:20:13','subir todo',38,0,3,1,0),(136,'2022-07-07 17:20:13','bajar todo',38,0,3,0,0),(137,'2022-07-12 11:04:07','eco',11,0,1,2,0),(138,'2022-07-12 11:04:07','eco',12,0,1,2,0),(139,'2022-09-07 15:52:23','eco',13,0,1,2,0),(140,'2022-07-12 11:04:07','eco',14,0,1,2,0),(141,'2022-09-19 11:00:00','eco',15,0,1,2,0),(142,'2022-09-19 11:35:13','eco',16,0,1,2,0),(143,'2022-09-19 11:06:16','eco',17,0,1,2,0),(144,'2022-07-12 11:04:07','eco',18,0,1,2,0),(145,'2022-07-12 11:04:07','eco',19,0,1,2,0),(146,'2022-07-12 11:04:07','eco',20,0,1,2,0),(147,'2022-07-12 11:04:07','eco',21,0,1,2,0),(148,'2022-09-16 10:58:04','eco',22,0,1,2,0),(149,'2022-07-12 11:04:07','eco',23,0,1,2,0),(150,'2022-07-12 11:04:07','eco',24,0,1,2,0),(151,'2022-07-12 11:04:07','eco',25,0,1,2,0),(152,'2022-07-12 11:04:07','eco',26,0,1,2,0),(153,'2022-07-12 11:04:07','eco',27,0,1,2,0),(154,'2022-07-12 11:04:07','eco',28,0,1,2,0),(155,'2022-07-12 11:04:07','eco',29,0,1,2,0),(156,'2022-07-12 11:04:07','eco',30,0,1,2,0),(157,'2022-07-12 11:04:07','eco',31,0,1,2,0),(158,'2022-07-12 11:04:07','eco',32,0,1,2,0),(159,'2022-07-12 11:04:07','eco',33,0,1,2,0),(160,'2022-07-12 11:04:07','eco',34,0,1,2,0),(161,'2022-07-12 11:04:07','eco',35,0,1,2,0),(162,'2022-07-12 11:04:07','eco',36,0,1,2,0),(163,'2022-07-12 11:04:07','eco',37,0,1,2,0),(164,'2022-07-12 11:04:07','eco',38,0,1,2,0),(165,'2022-07-12 11:04:07','eco',39,0,1,2,0),(166,'2022-07-12 11:04:07','eco',43,0,1,2,0),(167,'2022-09-07 15:22:47','eco',44,0,1,2,0),(168,'2022-07-12 11:04:07','eco',53,0,1,2,0),(169,'2022-07-12 11:04:07','eco',54,0,1,2,0),(170,'2022-07-12 11:04:07','eco',71,0,1,2,0),(171,'2022-07-12 11:04:07','eco',72,0,1,2,0),(172,'2022-09-19 11:51:53','eco',73,0,1,2,0),(173,'2022-07-12 11:04:08','romantic',11,0,1,2,0),(174,'2022-07-12 11:04:08','romantic',12,0,1,2,0),(175,'2022-07-12 11:04:08','romantic',13,0,1,2,0),(176,'2022-07-12 11:04:08','romantic',14,0,1,2,0),(177,'2022-07-12 11:04:08','romantic',15,0,1,2,0),(178,'2022-07-12 11:04:08','romantic',16,0,1,2,0),(179,'2022-07-12 11:04:08','romantic',17,0,1,2,0),(180,'2022-07-12 11:04:08','romantic',18,0,1,2,0),(181,'2022-07-12 11:04:08','romantic',19,0,1,2,0),(182,'2022-07-12 11:04:08','romantic',20,0,1,2,0),(183,'2022-07-12 11:04:08','romantic',21,0,1,2,0),(184,'2022-07-12 11:04:08','romantic',22,0,1,2,0),(185,'2022-07-12 11:04:08','romantic',23,0,1,2,0),(186,'2022-07-12 11:04:08','romantic',24,0,1,2,0),(187,'2022-07-12 11:04:08','romantic',25,0,1,2,0),(188,'2022-07-12 11:04:08','romantic',26,0,1,2,0),(189,'2022-07-12 11:04:08','romantic',27,0,1,2,0),(190,'2022-07-12 11:04:08','romantic',28,0,1,2,0),(191,'2022-07-12 11:04:08','romantic',29,0,1,2,0),(192,'2022-07-12 11:04:08','romantic',30,0,1,2,0),(193,'2022-07-12 11:04:08','romantic',31,0,1,2,0),(194,'2022-07-12 11:04:08','romantic',32,0,1,2,0),(195,'2022-07-12 11:04:08','romantic',33,0,1,2,0),(196,'2022-07-12 11:04:08','romantic',34,0,1,2,0),(197,'2022-07-12 11:04:08','romantic',35,0,1,2,0),(198,'2022-07-12 11:04:08','romantic',36,0,1,2,0),(199,'2022-07-12 11:04:08','romantic',37,0,1,2,0),(200,'2022-07-12 11:04:08','romantic',38,0,1,2,0),(201,'2022-07-12 11:04:08','romantic',39,0,1,2,0),(202,'2022-07-12 11:04:08','romantic',43,0,1,2,0),(203,'2022-07-12 11:04:08','romantic',44,0,1,2,0),(204,'2022-07-12 11:04:08','romantic',53,0,1,2,0),(205,'2022-07-12 11:04:08','romantic',54,0,1,2,0),(206,'2022-07-12 11:04:08','romantic',71,0,1,2,0),(207,'2022-07-12 11:04:08','romantic',72,0,1,2,0),(208,'2022-07-12 11:04:08','romantic',73,0,1,2,0),(209,'2022-07-12 11:04:08','cine',11,0,1,2,0),(210,'2022-07-12 11:04:08','cine',12,0,1,2,0),(211,'2022-07-12 11:04:08','cine',13,0,1,2,0),(212,'2022-07-12 11:04:08','cine',14,0,1,2,0),(213,'2022-07-12 11:04:08','cine',15,0,1,2,0),(214,'2022-07-12 11:04:08','cine',16,0,1,2,0),(215,'2022-07-12 11:04:08','cine',17,0,1,2,0),(216,'2022-07-12 11:04:08','cine',18,0,1,2,0),(217,'2022-07-12 11:04:08','cine',19,0,1,2,0),(218,'2022-07-12 11:04:08','cine',20,0,1,2,0),(219,'2022-07-12 11:04:08','cine',21,0,1,2,0),(220,'2022-07-12 11:04:08','cine',22,0,1,2,0),(221,'2022-07-12 11:04:08','cine',23,0,1,2,0),(222,'2022-07-12 11:04:08','cine',24,0,1,2,0),(223,'2022-07-12 11:04:08','cine',25,0,1,2,0),(224,'2022-07-12 11:04:08','cine',26,0,1,2,0),(225,'2022-07-12 11:04:08','cine',27,0,1,2,0),(226,'2022-07-12 11:04:08','cine',28,0,1,2,0),(227,'2022-07-12 11:04:08','cine',29,0,1,2,0),(228,'2022-07-12 11:04:08','cine',30,0,1,2,0),(229,'2022-07-12 11:04:08','cine',31,0,1,2,0),(230,'2022-07-12 11:04:08','cine',32,0,1,2,0),(231,'2022-07-12 11:04:08','cine',33,0,1,2,0),(232,'2022-07-12 11:04:08','cine',34,0,1,2,0),(233,'2022-07-12 11:04:08','cine',35,0,1,2,0),(234,'2022-07-12 11:04:08','cine',36,0,1,2,0),(235,'2022-07-12 11:04:08','cine',37,0,1,2,0),(236,'2022-07-12 11:04:08','cine',38,0,1,2,0),(237,'2022-07-12 11:04:08','cine',39,0,1,2,0),(238,'2022-07-12 11:04:08','cine',43,0,1,2,0),(239,'2022-07-12 11:04:08','cine',44,0,1,2,0),(240,'2022-07-12 11:04:08','cine',53,0,1,2,0),(241,'2022-07-12 11:04:08','cine',54,0,1,2,0),(242,'2022-07-12 11:04:08','cine',71,0,1,2,0),(243,'2022-07-12 11:04:08','cine',72,0,1,2,0),(244,'2022-07-12 11:04:08','cine',73,0,1,2,0),(245,'2022-07-15 06:35:55','apagar',9,1,1,0,0),(246,'2022-07-15 06:35:56','maxima',9,0,1,1,0),(247,'2022-07-15 06:35:56','standard',9,0,1,2,0),(248,'2022-07-15 06:35:57','eco',9,0,1,2,0),(249,'2022-07-15 06:35:57','romantic',9,0,1,2,0),(250,'2022-07-15 06:35:57','cine',9,0,1,2,0),(251,'2022-07-15 06:35:58','apagar',40,1,1,0,0),(252,'2022-07-15 06:35:58','maxima',40,0,1,1,0),(253,'2022-07-15 06:36:00','apagar',58,0,1,0,0),(254,'2022-07-15 06:36:01','maxima',58,1,1,1,0),(255,'2022-07-15 06:36:02','apagar',41,1,1,0,0),(256,'2022-07-15 06:36:02','maxima',41,0,1,1,0),(257,'2022-09-08 10:30:29','standard',58,0,1,2,0),(258,'2022-09-08 10:30:30','eco',58,0,1,2,0),(259,'2022-09-08 10:30:30','romantic',58,0,1,2,0),(260,'2022-09-08 10:30:31','cine',58,0,1,2,0),(261,'2022-09-08 10:34:06','apagar',59,0,1,0,0),(262,'2022-09-08 10:34:06','maxima',59,0,1,1,0),(263,'2022-09-08 10:34:06','standard',59,0,1,2,0),(264,'2022-09-08 10:34:06','eco',59,0,1,2,0),(265,'2022-09-08 10:34:07','romantic',59,0,1,2,0),(266,'2022-09-08 10:34:09','cine',59,0,1,2,0),(267,'2022-09-09 07:48:39','standard',40,0,1,2,0),(268,'2022-09-09 07:48:39','eco',40,0,1,2,0),(269,'2022-09-09 07:48:39','romantic',40,0,1,2,0),(270,'2022-09-09 07:48:39','cine',40,0,1,2,0),(271,'2022-09-09 08:15:45','apagar',4,1,1,0,0),(272,'2022-09-09 08:15:46','maxima',4,0,1,1,0),(273,'2022-09-09 08:15:46','standard',4,0,1,2,0),(274,'2022-09-09 08:15:48','eco',4,0,1,2,0),(275,'2022-09-09 08:15:48','romantic',4,0,1,2,0),(276,'2022-09-09 08:15:49','cine',4,0,1,2,0),(277,'2022-09-09 08:53:34','standard',41,0,1,2,0),(278,'2022-09-09 08:53:34','eco',41,0,1,2,0),(279,'2022-09-09 08:53:34','romantic',41,0,1,2,0),(280,'2022-09-09 08:53:35','cine',41,0,1,2,0);
/*!40000 ALTER TABLE `escenas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estancia`
--

DROP TABLE IF EXISTS `estancia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estancia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_planta` int(11) DEFAULT NULL,
  `modelo` int(11) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `escenas` int(11) DEFAULT 0,
  `ambientes` int(11) DEFAULT 0,
  `rutinas` int(11) DEFAULT 0,
  `orden` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_planta` (`codigo_planta`),
  CONSTRAINT `estancia_ibfk_1` FOREIGN KEY (`codigo_planta`) REFERENCES `planta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estancia`
--

LOCK TABLES `estancia` WRITE;
/*!40000 ALTER TABLE `estancia` DISABLE KEYS */;
INSERT INTO `estancia` VALUES (1,'2021-09-08 14:57:20','Fuente interior Pt Baja',1,7,NULL,0,0,0,1),(2,'2021-09-08 14:57:20','Fuente entrada Principal',1,7,NULL,0,0,0,2),(3,'2021-09-08 14:57:20','Fuente terraza sala cine',1,7,NULL,0,0,0,3),(4,'2021-09-08 14:57:20','Alumbrado Exterior',2,4,NULL,1,1,1,1),(5,'2021-09-08 14:57:20','Pista de Tenis',2,6,NULL,0,0,0,2),(6,'2021-09-08 14:57:20','Piscina Exterior',2,5,NULL,0,0,0,3),(7,'2021-09-08 14:57:20','Garita Vigilante',2,2,NULL,0,0,0,4),(8,'2021-09-08 14:57:20','Riego',2,3,NULL,0,0,0,5),(9,'2021-09-08 14:57:20','Estudio',3,2,NULL,1,1,1,3),(10,'2021-09-08 14:57:20','Cabina',3,2,NULL,0,0,0,4),(11,'2021-09-08 14:57:20','Habitación',3,2,NULL,1,1,1,1),(12,'2021-09-08 14:57:20','Baño Habitación',3,2,NULL,1,1,1,2),(13,'2021-09-08 14:57:20','Comedor',4,2,'fotos/comedor.jpg',1,1,1,2),(14,'2021-09-08 14:57:20','Sala cine',4,2,'fotos/salacine.jpg',1,1,1,9),(15,'2021-09-08 14:57:20','Cocina',4,2,'fotos/cocina.jpg',1,1,1,4),(16,'2021-09-08 14:57:20','Entrada Principal',4,2,'fotos/entrada.jpg',1,1,1,1),(17,'2021-09-08 14:57:20','Cocina Alejandro',4,2,'fotos/cocina_alejandro.jpg',1,1,1,5),(18,'2021-09-08 14:57:20','Terraza sala cine/bar',4,2,'fotos/terraza_salacinebar.jpg',1,1,1,10),(19,'2021-09-08 14:57:20','Pasillo Habitaciones Entrada',5,2,NULL,1,1,1,17),(20,'2021-09-08 14:57:20','Bar',4,2,'fotos/bar.jpg',1,1,1,8),(21,'2021-09-08 14:57:20','Biblioteca',4,2,'fotos/biblio.jpg',1,1,1,7),(22,'2021-09-08 14:57:20','Habitacion Alejandro',5,2,'fotos/habitacion_alejandro.jpg',1,1,1,1),(23,'2021-09-08 14:57:20','Baño Alejandro',5,2,'fotos/bano_alejandro.jpg',1,1,1,2),(24,'2021-09-08 14:57:20','Habitacion Rachel',5,2,'fotos/habitacion_rachel',1,1,1,4),(25,'2021-09-08 14:57:20','Baño Rachel',5,2,'fotos/bano_rachel.jpg',1,1,1,5),(26,'2021-09-08 14:57:20','Habitación 2',5,2,'fotos/habitacion_2.jpg',1,1,1,9),(27,'2021-09-08 14:57:20','Baño  2',5,2,'fotos/bano_hab2.jpg',1,1,1,10),(28,'2021-09-08 14:57:20','Habitación 3',5,2,'fotos/habitacion_3.jpg',1,1,1,11),(29,'2021-09-08 14:57:20','Baño 3',5,2,'fotos/bano_hab3.jpg',1,1,1,12),(30,'2021-09-08 14:57:20','Habitación 4',5,2,'fotos/habitacion_4.jpg',1,1,1,13),(31,'2021-09-08 14:57:20','Baño 4',5,2,'fotos/bano_hab4.jpg',1,1,1,14),(32,'2021-09-08 14:57:20','Habitación 5',5,2,'fotos/habitacion_5.jpg',1,1,1,15),(33,'2021-09-08 14:57:20','Baño 5',5,2,'fotos/bano_hab5.jpg',1,1,1,16),(34,'2021-09-08 14:57:20','Habitación Invitados ',6,2,NULL,1,1,1,1),(35,'2021-09-08 14:57:20','Baño Invitados ',6,2,NULL,1,1,1,2),(36,'2021-09-08 14:57:20','Habitación Servicio 1',6,2,NULL,1,1,1,3),(37,'2021-09-08 14:57:20','Baño Servicio 1',6,2,NULL,1,1,1,4),(38,'2021-09-08 14:57:20','Habitación Servicio 2',6,2,NULL,1,1,1,5),(39,'2021-09-08 14:57:20','Baño Servicio 2',6,2,NULL,1,1,1,6),(40,'2021-09-08 14:57:20','Gimnasio',7,2,NULL,1,1,1,3),(41,'2021-09-08 14:57:20','Piscina Interior',7,5,'',1,1,1,4),(42,'2021-09-08 14:57:20','Vinoteca',7,2,NULL,0,0,0,2),(43,'2021-09-08 14:57:20','Lavanderia',7,2,NULL,1,1,1,9),(44,'2021-09-08 14:57:20','Comedor Servicio',7,2,NULL,1,1,1,10),(45,'2021-09-08 14:57:20','Distribuidor Principal',7,2,NULL,1,1,1,11),(46,'2022-05-18 11:21:39','Sala tv',4,2,'fotos/sala_tv.jpg',0,1,1,12),(47,'2022-06-19 07:22:23','Vestibulo Bibl/Bar',4,2,'fotos/distribuidor_pril.jpg',0,0,0,11),(48,'2022-06-19 07:22:24','Vestibulo sala/tv/hab.',4,2,'fotos/vestibulo_biblio_bar.jpg',0,0,0,14),(49,'2022-06-19 07:22:24','Vestibulo coc./ent.',4,2,'fotos/vestibulo_cocina_entrada.jpg',0,0,0,6),(50,'2022-06-19 07:22:24','Despensa',4,2,'fotos/despensa.jpg',0,0,0,17),(51,'2022-06-19 07:22:24','Ropero',4,2,'fotos/ropero.jpg',0,0,0,18),(52,'2022-06-19 07:22:24','Sala juegos',4,2,'fotos/salajuegos.jpg',0,1,1,16),(53,'2022-06-19 07:22:24','Vestidor Alejandro',5,2,'fotos/vestidor_alejandro.jpg',1,1,1,3),(54,'2022-06-19 07:22:25','Vestidor Rachel',5,2,'fotos/vestidor_rachel.jpg',1,1,1,6),(55,'2022-06-19 07:22:25','Distribuidor Principal',5,2,'fotos/distribuidor_pril.jpg',0,0,0,8),(56,'2022-06-19 07:22:25','Vestibulo Ent./Serv.',6,2,NULL,0,0,0,7),(57,'2022-06-19 07:22:25','Sala Maq,/Pisc. Int.',7,2,NULL,1,1,1,7),(58,'2022-06-19 07:22:25','Baño 1 piscina interior',7,2,NULL,1,1,1,5),(59,'2022-06-19 07:22:25','Baño 2 piscina interior',7,2,NULL,1,1,1,6),(60,'2022-06-19 07:22:25','Vestibulo Pisc. Int.',7,2,NULL,1,1,1,8),(61,'2022-06-19 07:22:25','Sala juegos',7,2,NULL,1,1,1,1),(62,'2022-06-19 07:22:25','Garaje',7,2,NULL,0,0,0,12),(63,'2022-06-19 07:22:25','Cuarto instalaciones',7,2,NULL,0,0,0,13),(64,'2022-06-19 07:22:28','Cuarto clima',7,2,NULL,0,0,0,14),(65,'2022-06-19 08:13:38','Comedor cocina Alej.',4,2,NULL,0,0,0,3),(66,'2022-06-19 08:19:46','Baño turco',7,2,NULL,0,0,0,15),(67,'2022-06-19 08:20:55','Vestibulo H/E',3,2,NULL,1,1,1,5),(68,'2022-06-21 08:58:55','Escalera Servicio',8,2,NULL,0,0,0,1),(69,'2022-06-21 08:58:55','Escalera Caracol Este',8,2,NULL,0,0,0,2),(70,'2022-06-21 08:58:55','Escalera Caracol Oeste',8,2,NULL,0,0,0,3),(71,'2022-06-21 08:58:55','Terraza Hab. Raquel',5,2,NULL,1,1,1,7),(72,'2022-06-21 08:58:55','Terraza Sala Tv',4,2,NULL,1,1,1,13),(73,'2022-06-24 10:16:17','Baño cortesia',4,2,NULL,1,1,1,19),(74,'2022-07-06 11:00:29','Lago Jardin',1,7,NULL,0,0,0,4),(75,'2022-07-06 11:00:29','Pasillo Lavanderia',8,2,NULL,0,0,0,4),(76,'2022-07-06 11:00:29','Despensa sotano',8,2,NULL,0,0,0,5),(77,'2022-07-06 11:00:30','Vestibulo Gimnasio',8,2,NULL,0,0,0,6);
/*!40000 ALTER TABLE `estancia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estor`
--

DROP TABLE IF EXISTS `estor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `consigna` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `estor_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estor`
--

LOCK TABLES `estor` WRITE;
/*!40000 ALTER TABLE `estor` DISABLE KEYS */;
INSERT INTO `estor` VALUES (1,'2022-08-10 14:43:21','Hab invitados',34,46,NULL),(2,'2022-09-30 21:55:02','Hab. 5',32,100,NULL),(3,'2022-10-02 07:59:17','Hab. 4',30,0,NULL),(4,'2022-10-02 08:01:35','Hab. 3',28,0,NULL),(5,'2022-09-30 12:26:24','Hab. 2',26,0,NULL),(6,'2022-09-22 10:48:34','Vestidor Dcha',53,45,NULL),(7,'2022-09-22 10:48:54','Vestidor Izq',53,56,NULL),(8,'2022-09-30 12:38:18','Hab. estudio izq',11,96,NULL),(9,'2022-09-27 15:12:13','Hab. estudio centro',11,0,NULL),(10,'2022-09-27 15:11:41','Hab. estudio dcha',11,100,NULL),(11,'2022-10-02 18:09:06','Hab. servicio 1',36,100,NULL),(12,'2022-09-29 21:27:03','Hab. servicio 2 dcha',38,99,NULL),(13,'2022-09-29 21:27:06','Hab. servicio 2 izq',38,99,NULL),(14,'2022-09-30 14:35:53','cocina',15,100,NULL),(15,'2022-09-22 16:07:11','Jacuzzi',23,NULL,NULL);
/*!40000 ALTER TABLE `estor` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`fincahazard`@`localhost`*/ /*!50003 TRIGGER trigger_estor
   AFTER UPDATE ON estor
   FOR EACH ROW
   BEGIN


   DECLARE done INT DEFAULT 0;
   DECLARE cod_ope INT;
   DECLARE v_cumple INT;

   DECLARE cursor_operacion CURSOR FOR SELECT b.codigo_operacion
   FROM operacion_estores as b
   WHERE b.codigo_estor = NEW.id;

   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

   OPEN cursor_operacion;

   read_loop: LOOP

   FETCH cursor_operacion INTO cod_ope;

   IF done THEN
   LEAVE read_loop;
   END IF;

   SELECT count(id)
   INTO v_cumple
   FROM operacion_estores
   WHERE consigna = NEW.consigna
   
   AND codigo_operacion = cod_ope;

   IF (v_cumple = 0) THEN
      UPDATE operacion SET estado = 0 WHERE id = cod_ope;
   ELSE
      UPDATE operacion SET estado = 1 WHERE id = cod_ope;
   END IF;

   END LOOP;

   CLOSE cursor_operacion;
   END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `estor_previo_rutina`
--

DROP TABLE IF EXISTS `estor_previo_rutina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estor_previo_rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `consigna` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `estor_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estor_previo_rutina`
--

LOCK TABLES `estor_previo_rutina` WRITE;
/*!40000 ALTER TABLE `estor_previo_rutina` DISABLE KEYS */;
/*!40000 ALTER TABLE `estor_previo_rutina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galeria`
--

DROP TABLE IF EXISTS `galeria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `galeria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo_rc` int(11) DEFAULT NULL,
  `codigo_adjunto` int(11) NOT NULL,
  `orden` int(11) DEFAULT NULL,
  `nemo` varchar(100) DEFAULT '',
  `texto` text DEFAULT '',
  `filtro` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_adjunto` (`codigo_adjunto`),
  KEY `codigo_rc` (`codigo_rc`),
  CONSTRAINT `galeria_ibfk_1` FOREIGN KEY (`codigo_adjunto`) REFERENCES `adjuntos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `galeria_ibfk_2` FOREIGN KEY (`codigo_rc`) REFERENCES `sistema_pruebas`.`rc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galeria`
--

LOCK TABLES `galeria` WRITE;
/*!40000 ALTER TABLE `galeria` DISABLE KEYS */;
/*!40000 ALTER TABLE `galeria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo_accesos`
--

DROP TABLE IF EXISTS `grupo_accesos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo_accesos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_accesos`
--

LOCK TABLES `grupo_accesos` WRITE;
/*!40000 ALTER TABLE `grupo_accesos` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo_accesos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo_bombas`
--

DROP TABLE IF EXISTS `grupo_bombas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo_bombas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `modo` int(11) DEFAULT 0,
  `programacion` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_bombas`
--

LOCK TABLES `grupo_bombas` WRITE;
/*!40000 ALTER TABLE `grupo_bombas` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo_bombas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo_luces`
--

DROP TABLE IF EXISTS `grupo_luces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo_luces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `modo` int(11) DEFAULT 0,
  `programacion` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_luces`
--

LOCK TABLES `grupo_luces` WRITE;
/*!40000 ALTER TABLE `grupo_luces` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo_luces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_post`
--

DROP TABLE IF EXISTS `historico_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historico_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `tipotcaso` int(11) NOT NULL DEFAULT 0,
  `codigo_post` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_post` (`codigo_post`),
  CONSTRAINT `historico_post_ibfk_1` FOREIGN KEY (`codigo_post`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_post`
--

LOCK TABLES `historico_post` WRITE;
/*!40000 ALTER TABLE `historico_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `historico_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_tarea`
--

DROP TABLE IF EXISTS `historico_tarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historico_tarea` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `codigo_tarea` int(11) DEFAULT NULL,
  `comentario` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_tarea` (`codigo_tarea`),
  CONSTRAINT `histtarea_ibfk_1` FOREIGN KEY (`codigo_tarea`) REFERENCES `tarea` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_tarea`
--

LOCK TABLES `historico_tarea` WRITE;
/*!40000 ALTER TABLE `historico_tarea` DISABLE KEYS */;
/*!40000 ALTER TABLE `historico_tarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_estado`
--

DROP TABLE IF EXISTS `home_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `home_estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(150) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_estado`
--

LOCK TABLES `home_estado` WRITE;
/*!40000 ALTER TABLE `home_estado` DISABLE KEYS */;
/*!40000 ALTER TABLE `home_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iniciarhilostrb`
--

DROP TABLE IF EXISTS `iniciarhilostrb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iniciarhilostrb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trb` int(11) DEFAULT NULL,
  `argumentos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `codigo_rb` int(11) DEFAULT NULL,
  `bornas` text DEFAULT NULL,
  `inhibir` int(11) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `subtipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=768 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iniciarhilostrb`
--

LOCK TABLES `iniciarhilostrb` WRITE;
/*!40000 ALTER TABLE `iniciarhilostrb` DISABLE KEYS */;
INSERT INTO `iniciarhilostrb` VALUES (1,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53137\",\"time\":\"1\"}',1,'0,1,2,3,4',0,0,0),(2,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53137\",\"time\":\"1\"}',1,'5,6,7,15',0,0,0),(3,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53137\",\"time\":\"1\"}',1,'9,10',0,0,0),(4,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53137\",\"time\":\"1\"}',1,'11,12,13,14',0,0,0),(5,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53137\"}',2,'0',0,1,0),(6,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53137\"}',2,'1',0,1,0),(7,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53137\"}',2,'2',0,1,0),(8,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53137\"}',2,'3',0,1,0),(9,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53137\"}',2,'4',0,1,0),(10,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53137\"}',2,'5',0,1,0),(11,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53137\"}',2,'6',0,1,0),(12,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53137\"}',2,'7',0,1,0),(13,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53137\"}',2,'8',0,1,0),(14,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53137\",\"converter\":\"0\",\"command\":\"64\",\"id\":\"10\"}',4,'1',0,1,0),(15,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53137\",\"converter\":\"0\",\"command\":\"65\",\"id\":\"10\"}',5,'1',0,1,0),(16,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53137\",\"converter\":\"0\",\"command\":\"66\",\"id\":\"10\"}',6,'1',0,1,0),(17,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53137\",\"converter\":\"0\",\"command\":\"67\",\"id\":\"10\"}',7,'1',0,1,0),(18,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53137\",\"converter\":\"0\",\"command\":\"68\",\"id\":\"10\"}',8,'1',0,1,0),(19,2,'{\"ip\":\"80.28.98.191\",\"port\":\"53137\",\"time\":\"1\"}',9,'8',0,0,0),(20,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53141\",\"time\":\"1\"}',10,'0,1,2,3,4',0,0,0),(21,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53141\",\"time\":\"1\"}',10,'5,6,7,15',0,0,0),(22,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53141\",\"time\":\"1\"}',10,'9,10',0,0,0),(23,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53141\",\"time\":\"1\"}',10,'11,12,13,14',0,0,0),(24,2,'{\"ip\":\"80.28.98.191\",\"port\":\"53141\",\"time\":\"1\"}',13,'8',0,0,0),(25,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53141\"}',11,'0',0,1,0),(26,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53141\"}',11,'1',0,1,0),(27,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53141\"}',11,'2',0,1,0),(28,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53141\"}',11,'3',0,1,0),(29,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53141\"}',11,'4',0,1,0),(30,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53141\"}',11,'5',0,1,0),(31,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53141\"}',11,'6',0,1,0),(32,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53141\"}',11,'7',0,1,0),(33,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53141\"}',11,'8',0,1,0),(34,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53141\",\"converter\":\"0\",\"command\":\"64\",\"id\":\"11\"}',14,'1',0,1,0),(35,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53141\",\"converter\":\"0\",\"command\":\"65\",\"id\":\"11\"}',15,'1',0,1,0),(36,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53141\",\"converter\":\"0\",\"command\":\"66\",\"id\":\"11\"}',16,'1',0,1,0),(37,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53141\",\"converter\":\"0\",\"command\":\"67\",\"id\":\"11\"}',17,'1',0,1,0),(38,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53141\",\"converter\":\"0\",\"command\":\"68\",\"id\":\"11\"}',18,'1',0,1,0),(39,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53133\",\"time\":\"1\"}',19,'0,1,2,3,4',0,0,0),(40,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53133\",\"time\":\"1\"}',19,'5,6,7,15',0,0,0),(41,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53133\",\"time\":\"1\"}',19,'9,10',0,0,0),(42,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53133\",\"time\":\"1\"}',19,'11,12,13,14',0,0,0),(43,2,'{\"ip\":\"80.28.98.191\",\"port\":\"53133\",\"time\":\"1\"}',22,'8',0,0,0),(44,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53133\"}',20,'0',0,1,0),(45,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53133\"}',20,'1',0,1,0),(46,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53133\"}',20,'2',0,1,0),(47,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53133\"}',20,'3',0,1,0),(48,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53133\"}',20,'4',0,1,0),(49,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53133\"}',20,'5',0,1,0),(50,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53133\"}',20,'6',0,1,0),(51,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53133\"}',20,'7',0,1,0),(52,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53133\"}',20,'8',0,1,0),(53,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53133\",\"converter\":\"0\",\"command\":\"64\",\"id\":\"7\"}',23,'1',0,1,0),(54,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53133\",\"converter\":\"0\",\"command\":\"65\",\"id\":\"7\"}',24,'1',0,1,0),(55,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53133\",\"converter\":\"0\",\"command\":\"66\",\"id\":\"7\"}',25,'1',0,1,0),(56,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53133\",\"converter\":\"0\",\"command\":\"67\",\"id\":\"7\"}',26,'1',0,1,0),(57,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53133\",\"converter\":\"0\",\"command\":\"68\",\"id\":\"7\"}',27,'1',0,1,0),(58,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53134\",\"time\":\"1\"}',28,'0,1,2,3,4',0,0,0),(59,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53134\",\"time\":\"1\"}',28,'5,6,7,15',0,0,0),(60,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53134\",\"time\":\"1\"}',28,'9,10',0,0,0),(61,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53134\",\"time\":\"1\"}',28,'11,12,13,14',0,0,0),(62,2,'{\"ip\":\"80.28.98.191\",\"port\":\"53134\",\"time\":\"1\"}',31,'8',0,0,0),(63,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53134\"}',29,'0',0,1,0),(64,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53134\"}',29,'1',0,1,0),(65,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53134\"}',29,'2',0,1,0),(66,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53134\"}',29,'3',0,1,0),(67,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53134\"}',29,'4',0,1,0),(68,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53134\"}',29,'5',0,1,0),(69,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53134\"}',29,'6',0,1,0),(70,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53134\"}',29,'7',0,1,0),(71,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53134\"}',29,'8',0,1,0),(72,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53134\",\"converter\":\"0\",\"command\":\"64\",\"id\":\"8\"}',32,'1',0,1,0),(73,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53134\",\"converter\":\"0\",\"command\":\"65\",\"id\":\"8\"}',33,'1',0,1,0),(74,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53134\",\"converter\":\"0\",\"command\":\"66\",\"id\":\"8\"}',34,'1',0,1,0),(75,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53134\",\"converter\":\"0\",\"command\":\"67\",\"id\":\"8\"}',35,'1',0,1,0),(76,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53134\",\"converter\":\"0\",\"command\":\"68\",\"id\":\"8\"}',36,'1',0,1,0),(77,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"time\":\"1\"}',37,'0,1,2,3,4',0,0,0),(78,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"time\":\"1\"}',37,'5,6,7,15',0,0,0),(79,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"time\":\"1\"}',37,'10',0,0,0),(80,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"time\":\"1\"}',37,'11,12,13,14',0,0,0),(81,2,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"time\":\"1\"}',40,'8',0,0,0),(82,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\"}',38,'0',0,1,0),(83,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\"}',38,'1',0,1,0),(84,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\"}',38,'2',0,1,0),(85,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\"}',38,'3',0,1,0),(86,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\"}',38,'4',0,1,0),(87,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\"}',38,'5',0,1,0),(88,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\"}',38,'6',0,1,0),(89,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\"}',38,'7',0,1,0),(90,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\"}',38,'8',0,1,0),(91,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"converter\":\"0\",\"command\":\"64\",\"id\":\"13\"}',41,'1',0,1,0),(92,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"converter\":\"0\",\"command\":\"65\",\"id\":\"13\"}',42,'1',0,1,0),(93,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"converter\":\"0\",\"command\":\"66\",\"id\":\"13\"}',43,'1',0,1,0),(94,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"converter\":\"0\",\"command\":\"67\",\"id\":\"13\"}',44,'1',0,1,0),(95,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"converter\":\"0\",\"command\":\"68\",\"id\":\"13\"}',45,'1',0,1,0),(96,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53149\",\"time\":\"1\"}',46,'0,1,2,3,4',0,0,0),(97,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53149\",\"time\":\"1\"}',46,'5,6,7,15',0,0,0),(98,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53149\",\"time\":\"1\"}',46,'9,10',0,0,0),(99,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53149\",\"time\":\"1\"}',46,'11,12,13,14',0,0,0),(100,2,'{\"ip\":\"80.28.98.191\",\"port\":\"53149\",\"time\":\"1\"}',49,'8',0,0,0),(101,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53149\"}',47,'0',0,1,0),(102,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53149\"}',47,'1',0,1,0),(103,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53149\"}',47,'2',0,1,0),(104,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53149\"}',47,'3',0,1,0),(105,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53149\"}',47,'4',0,1,0),(106,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53149\"}',47,'5',0,1,0),(107,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53149\"}',47,'6',0,1,0),(108,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53149\"}',47,'7',0,1,0),(109,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53149\"}',47,'8',0,1,0),(110,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53149\",\"converter\":\"0\",\"command\":\"64\",\"id\":\"4\"}',50,'1',0,1,0),(111,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53149\",\"converter\":\"0\",\"command\":\"65\",\"id\":\"4\"}',51,'1',0,1,0),(112,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53149\",\"converter\":\"0\",\"command\":\"66\",\"id\":\"4\"}',52,'1',0,1,0),(113,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53149\",\"converter\":\"0\",\"command\":\"67\",\"id\":\"4\"}',53,'1',0,1,0),(114,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53149\",\"converter\":\"0\",\"command\":\"68\",\"id\":\"4\"}',54,'1',0,1,0),(115,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53137\"}',2,'9',0,1,0),(116,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53137\"}',2,'10',0,1,0),(117,1,'{\"ip\":\"80.28.98.191\",\"port\":\"53137\", \"time\":\"60\", \"terminal_id\":\"28940679a201034b\"}',55,'0',0,0,0),(118,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53141\"}',11,'9',0,1,0),(119,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53141\"}',11,'10',0,1,0),(120,1,'{\"ip\":\"80.28.98.191\",\"port\":\"53141\", \"time\":\"60\", \"terminal_id\":\"28a76879970103a7\"}',56,'0',0,0,0),(121,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53133\"}',20,'9',0,1,0),(122,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53133\"}',20,'10',0,1,0),(123,1,'{\"ip\":\"80.28.98.191\",\"port\":\"53133\", \"time\":\"60\", \"terminal_id\":\"2826e379a201032a\"}',57,'0',0,0,0),(124,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53134\"}',29,'9',0,1,0),(125,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53134\"}',29,'10',0,1,0),(126,1,'{\"ip\":\"80.28.98.191\",\"port\":\"53134\", \"time\":\"60\", \"terminal_id\":\"286c9779a20103e2\"}',58,'0',0,0,0),(127,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\"}',38,'9',0,1,0),(128,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\"}',38,'10',0,1,0),(129,1,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\", \"time\":\"60\", \"terminal_id\":\"28838479a20103dd\"}',59,'0',0,0,0),(130,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53149\"}',47,'9',0,1,0),(131,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53149\"}',47,'10',0,1,0),(132,1,'{\"ip\":\"80.28.98.191\",\"port\":\"53149\", \"time\":\"60\", \"terminal_id\":\"288aff79a2010356\"}',60,'0',0,0,0),(133,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53143\",\"time\":\"1\"}',61,'0,1,2',0,0,0),(134,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53143\",\"time\":\"1\"}',61,'4',0,0,0),(135,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53143\",\"time\":\"1\"}',61,'5,6',0,0,0),(136,2,'{\"ip\":\"80.28.98.191\",\"port\":\"53143\",\"time\":\"1\"}',64,'3',0,0,0),(137,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53143\"}',62,'0',0,1,0),(138,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53143\"}',62,'1',0,1,0),(139,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53143\"}',62,'2',0,1,0),(140,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53143\"}',62,'3',0,1,0),(141,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53143\"}',62,'4',0,1,0),(142,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53143\"}',62,'5',0,1,0),(143,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53143\",\"converter\":\"0\",\"command\":\"64\",\"id\":\"12\"}',65,'1',0,1,0),(144,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53143\",\"converter\":\"0\",\"command\":\"65\",\"id\":\"12\"}',66,'1',0,1,0),(145,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53143\",\"converter\":\"0\",\"command\":\"66\",\"id\":\"12\"}',67,'1',0,1,0),(146,1,'{\"ip\":\"80.28.98.191\",\"port\":\"53143\", \"time\":\"60\", \"terminal_id\":\"28b36a79a2010348\"}',68,'0',0,0,0),(147,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"time\":\"1\"}',69,'0,1,2,3,4',0,0,0),(148,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"time\":\"1\"}',69,'6,8',0,0,0),(149,2,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"time\":\"1\"}',72,'5,7',0,0,0),(150,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\"}',70,'0',0,1,0),(151,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\"}',70,'1',0,1,0),(152,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\"}',70,'2',0,1,0),(153,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\"}',70,'3',0,1,0),(154,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\"}',70,'4',0,1,0),(155,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\"}',70,'5',0,1,0),(156,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\"}',70,'6',0,1,0),(157,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\"}',70,'7',0,1,0),(158,1,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\", \"time\":\"60\", \"terminal_id\":\"28b87c79a2010350\"}',73,'0',0,0,0),(159,1,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\", \"time\":\"60\", \"terminal_id\":\"28227779a201035e\"}',74,'0',0,0,0),(160,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"converter\":\"0\",\"command\":\"64\",\"id\":\"3\"}',75,'1',0,1,0),(161,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"converter\":\"0\",\"command\":\"65\",\"id\":\"3\"}',76,'1',0,1,0),(162,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"converter\":\"0\",\"command\":\"66\",\"id\":\"3\"}',77,'1',0,1,0),(163,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"converter\":\"0\",\"command\":\"67\",\"id\":\"3\"}',78,'1',0,1,0),(164,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"converter\":\"0\",\"command\":\"68\",\"id\":\"3\"}',79,'1',0,1,0),(165,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\",\"time\":\"1\"}',80,'0,1,2,3,4,5,6,7,8,9,10',0,0,0),(166,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\"}',81,'0',0,1,0),(167,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\"}',81,'1',0,1,0),(168,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\"}',81,'2',0,1,0),(169,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\"}',81,'3',0,1,0),(170,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\"}',81,'4',0,1,0),(171,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\"}',81,'5',0,1,0),(172,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\"}',81,'6',0,1,0),(173,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\"}',81,'7',0,1,0),(174,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\"}',81,'8',0,1,0),(175,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\"}',81,'9',0,1,0),(176,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\"}',81,'10',0,1,0),(177,1,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\", \"time\":\"60\", \"terminal_id\":\"2800b179a2010338\"}',83,'0',0,0,0),(178,1,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\", \"time\":\"60\", \"terminal_id\":\"28a8b579a20103da\"}',84,'0',0,0,0),(179,1,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\", \"time\":\"60\", \"terminal_id\":\"28e18179a20103a2\"}',85,'0',0,0,0),(180,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\",\"converter\":\"0\",\"command\":\"64\",\"id\":\"9\"}',86,'1',0,1,0),(181,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\",\"converter\":\"0\",\"command\":\"65\",\"id\":\"9\"}',87,'1',0,1,0),(182,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\",\"converter\":\"0\",\"command\":\"66\",\"id\":\"9\"}',88,'1',0,1,0),(183,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\",\"converter\":\"0\",\"command\":\"67\",\"id\":\"9\"}',89,'1',0,1,0),(184,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\",\"converter\":\"0\",\"command\":\"68\",\"id\":\"9\"}',90,'1',0,1,0),(185,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\",\"converter\":\"0\",\"command\":\"69\",\"id\":\"9\"}',91,'1',0,1,0),(186,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\",\"converter\":\"0\",\"command\":\"70\",\"id\":\"9\"}',92,'1',0,1,0),(187,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\",\"converter\":\"0\",\"command\":\"71\",\"id\":\"9\"}',93,'1',0,1,0),(188,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\",\"converter\":\"0\",\"command\":\"72\",\"id\":\"9\"}',94,'1',0,1,0),(189,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53131\",\"time\":\"1\"}',95,'0,1',0,0,0),(190,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53131\"}',96,'0',0,1,0),(191,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53131\"}',96,'1',0,1,0),(192,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53131\",\"converter\":\"0\",\"command\":\"64\",\"id\":\"6\"}',98,'1',0,1,0),(193,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53131\",\"converter\":\"0\",\"command\":\"65\",\"id\":\"6\"}',99,'1',0,1,0),(194,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"time\":\"1\"}',100,'0,1,2,3,4,5,6,7,8,9,10,11',0,0,0),(195,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"time\":\"1\"}',100,'12,13,14,15',0,0,0),(196,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53154\",\"time\":\"1\"}',103,'2,3,4,5',0,0,0),(197,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53154\",\"time\":\"1\"}',103,'6,7,8,9,10',0,0,0),(198,2,'{\"ip\":\"80.28.98.191\",\"port\":\"53154\",\"time\":\"1\"}',106,'0,1',0,0,0),(199,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\"}',101,'0',0,1,0),(200,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\"}',101,'1',0,1,0),(201,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\"}',101,'2',0,1,0),(202,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\"}',101,'3',0,1,0),(203,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\"}',101,'4',0,1,0),(204,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\"}',101,'5',0,1,0),(205,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\"}',101,'6',0,1,0),(206,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\"}',101,'7',0,1,0),(207,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\"}',101,'8',0,1,0),(208,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\"}',101,'9',0,1,0),(209,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\"}',101,'10',0,1,0),(210,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\"}',101,'11',0,1,0),(211,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\"}',101,'12',0,1,0),(212,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\"}',101,'13',0,1,0),(213,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\"}',101,'14',0,1,0),(214,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\"}',101,'15',0,1,0),(215,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"64\",\"id\":\"0\"}',107,'1',0,1,0),(216,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"65\",\"id\":\"0\"}',108,'1',1,1,0),(217,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"66\",\"id\":\"0\"}',109,'1',0,1,0),(218,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"67\",\"id\":\"0\"}',110,'1',0,1,0),(219,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"68\",\"id\":\"0\"}',111,'1',0,1,0),(220,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"69\",\"id\":\"0\"}',112,'1',0,1,0),(221,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"70\",\"id\":\"0\"}',113,'1',0,1,0),(222,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"71\",\"id\":\"0\"}',114,'1',0,1,0),(223,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"72\",\"id\":\"0\"}',115,'1',0,1,0),(224,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"73\",\"id\":\"0\"}',116,'1',0,1,0),(225,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"74\",\"id\":\"0\"}',117,'1',0,1,0),(226,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"75\",\"id\":\"0\"}',118,'1',0,1,0),(227,1,'{\"ip\":\"80.28.98.191\",\"port\":\"53154\", \"time\":\"60\", \"terminal_id\":\"28268979a2010386\"}',119,'0',0,0,0),(228,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53154\"}',104,'0',0,1,0),(229,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53154\"}',104,'1',0,1,0),(230,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53154\"}',104,'2',0,1,0),(231,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53154\"}',104,'3',0,1,0),(232,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53154\"}',104,'4',0,1,0),(233,34,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"command\":\"0\",\"transmitter\":\"FFFF00\",\"receptor\":\"05F0CB\"}',122,'0',0,1,0),(234,34,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"command\":\"0\",\"transmitter\":\"FFFF00\",\"receptor\":\"05F0CB\"}',122,'1',0,1,0),(235,34,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"command\":\"1\",\"transmitter\":\"FFFF00\",\"receptor\":\"05F0CB\"}',123,'0',0,1,0),(236,34,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"command\":\"1\",\"transmitter\":\"FFFF00\",\"receptor\":\"05F0CB\"}',123,'1',0,1,0),(237,34,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"command\":\"2\",\"transmitter\":\"FFFF00\",\"receptor\":\"05F0CB\"}',124,'0',0,1,0),(238,34,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"command\":\"2\",\"transmitter\":\"FFFF00\",\"receptor\":\"05F0CB\"}',124,'1',0,1,0),(239,34,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"command\":\"3\",\"transmitter\":\"FFFF00\",\"receptor\":\"05F0CB\"}',125,'0',0,1,0),(240,34,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"command\":\"3\",\"transmitter\":\"FFFF00\",\"receptor\":\"05F0CB\"}',125,'1',0,1,0),(241,34,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"command\":\"4\",\"transmitter\":\"FFFF00\",\"receptor\":\"05F0CB\"}',126,'0',0,1,0),(242,34,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"command\":\"4\",\"transmitter\":\"FFFF00\",\"receptor\":\"05F0CB\"}',126,'1',0,1,0),(243,34,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"command\":\"5\",\"transmitter\":\"FFFF00\",\"receptor\":\"05F0CB\"}',127,'0',0,1,0),(244,34,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"command\":\"5\",\"transmitter\":\"FFFF00\",\"receptor\":\"05F0CB\"}',127,'1',0,1,0),(245,34,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"command\":\"6\",\"transmitter\":\"FFFF00\",\"receptor\":\"05F0CB\"}',128,'0',0,1,0),(246,34,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"command\":\"6\",\"transmitter\":\"FFFF00\",\"receptor\":\"05F0CB\"}',128,'1',0,1,0),(247,34,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"command\":\"7\",\"transmitter\":\"FFFF00\",\"receptor\":\"05F0CB\"}',129,'0',0,1,0),(248,34,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"command\":\"7\",\"transmitter\":\"FFFF00\",\"receptor\":\"05F0CB\"}',129,'1',0,1,0),(249,34,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"command\":\"8\",\"transmitter\":\"FFFF00\",\"receptor\":\"05F0CB\"}',130,'0',0,1,0),(250,34,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"command\":\"8\",\"transmitter\":\"FFFF00\",\"receptor\":\"05F0CB\"}',130,'1',0,1,0),(251,42,'{\"ip\":\"80.28.98.191\",\"port\":\"53149\",\"transmitter\":\"FFFF00\",\"receptor\":\"0D2157\",\"command\":\"0\",\"time\":\"10\"}',131,'1',0,0,0),(252,42,'{\"ip\":\"80.28.98.191\",\"port\":\"53134\",\"transmitter\":\"FFFF00\",\"receptor\":\"0CAD82\",\"command\":\"0\",\"time\":\"10\"}',133,'1',0,0,0),(253,42,'{\"ip\":\"80.28.98.191\",\"port\":\"53141\",\"transmitter\":\"FFFF00\",\"receptor\":\"0D2738\",\"command\":\"0\",\"time\":\"10\"}',135,'1',0,0,0),(254,42,'{\"ip\":\"80.28.98.191\",\"port\":\"53133\",\"transmitter\":\"FFFF00\",\"receptor\":\"0C7B28\",\"command\":\"0\",\"time\":\"10\"}',137,'1',0,0,0),(255,42,'{\"ip\":\"80.28.98.191\",\"port\":\"53137\",\"transmitter\":\"FFFF00\",\"receptor\":\"0CB0BE\",\"command\":\"0\",\"time\":\"10\"}',139,'1',0,0,0),(256,42,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"transmitter\":\"FFFF00\",\"receptor\":\"0CB0D7\",\"command\":\"0\",\"time\":\"10\"}',141,'1',0,0,0),(257,42,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"transmitter\":\"FFFF00\",\"receptor\":\"0C6EF1\",\"command\":\"0\",\"time\":\"10\"}',143,'1',0,0,0),(258,42,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"transmitter\":\"FFFF00\",\"receptor\":\"0D273A\",\"command\":\"0\",\"time\":\"10\"}',145,'1',0,0,0),(259,42,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"transmitter\":\"FFFF00\",\"receptor\":\"0D2731\",\"command\":\"0\",\"time\":\"10\"}',147,'1',0,0,0),(260,42,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"transmitter\":\"FFFF00\",\"receptor\":\"0D2753\",\"command\":\"0\",\"time\":\"10\"}',149,'1',0,0,0),(261,43,'{\"ip\":\"80.28.98.191\",\"port\":\"53149\",\"transmitter\":\"FFFF00\",\"receptor\":\"0D2157\",\"command\":\"0\"}',132,'0',0,1,0),(262,43,'{\"ip\":\"80.28.98.191\",\"port\":\"53149\",\"transmitter\":\"FFFF00\",\"receptor\":\"0D2157\",\"command\":\"0\"}',132,'1',0,1,0),(263,43,'{\"ip\":\"80.28.98.191\",\"port\":\"53134\",\"transmitter\":\"FFFF00\",\"receptor\":\"0CAD82\",\"command\":\"0\"}',134,'0',0,1,0),(264,43,'{\"ip\":\"80.28.98.191\",\"port\":\"53134\",\"transmitter\":\"FFFF00\",\"receptor\":\"0CAD82\",\"command\":\"0\"}',134,'1',0,1,0),(265,43,'{\"ip\":\"80.28.98.191\",\"port\":\"53141\",\"transmitter\":\"FFFF00\",\"receptor\":\"0D2738\",\"command\":\"0\"}',136,'0',0,1,0),(266,43,'{\"ip\":\"80.28.98.191\",\"port\":\"53141\",\"transmitter\":\"FFFF00\",\"receptor\":\"0D2738\",\"command\":\"0\"}',136,'1',0,1,0),(267,43,'{\"ip\":\"80.28.98.191\",\"port\":\"53133\",\"transmitter\":\"FFFF00\",\"receptor\":\"0C7B28\",\"command\":\"0\"}',138,'0',0,1,0),(268,43,'{\"ip\":\"80.28.98.191\",\"port\":\"53133\",\"transmitter\":\"FFFF00\",\"receptor\":\"0C7B28\",\"command\":\"0\"}',138,'1',0,1,0),(269,43,'{\"ip\":\"80.28.98.191\",\"port\":\"53137\",\"transmitter\":\"FFFF00\",\"receptor\":\"0CB0BE\",\"command\":\"0\"}',140,'0',0,1,0),(270,43,'{\"ip\":\"80.28.98.191\",\"port\":\"53137\",\"transmitter\":\"FFFF00\",\"receptor\":\"0CB0BE\",\"command\":\"0\"}',140,'1',0,1,0),(271,43,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"transmitter\":\"FFFF00\",\"receptor\":\"0CB0D7\",\"command\":\"0\"}',142,'0',0,1,0),(272,43,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"transmitter\":\"FFFF00\",\"receptor\":\"0CB0D7\",\"command\":\"0\"}',142,'1',0,1,0),(273,43,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"transmitter\":\"FFFF00\",\"receptor\":\"0C6EF1\",\"command\":\"0\"}',144,'0',0,1,0),(274,43,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"transmitter\":\"FFFF00\",\"receptor\":\"0C6EF1\",\"command\":\"0\"}',144,'1',0,1,0),(275,43,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"transmitter\":\"FFFF00\",\"receptor\":\"0D273A\",\"command\":\"0\"}',146,'0',0,1,0),(276,43,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"transmitter\":\"FFFF00\",\"receptor\":\"0D273A\",\"command\":\"0\"}',146,'1',0,1,0),(277,43,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"transmitter\":\"FFFF00\",\"receptor\":\"0D2731\",\"command\":\"0\"}',148,'0',0,1,0),(278,43,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"transmitter\":\"FFFF00\",\"receptor\":\"0D2731\",\"command\":\"0\"}',148,'1',0,1,0),(279,43,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"transmitter\":\"FFFF00\",\"receptor\":\"0D2753\",\"command\":\"0\"}',150,'0',0,1,0),(280,43,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"transmitter\":\"FFFF00\",\"receptor\":\"0D2753\",\"command\":\"0\"}',150,'1',0,1,0),(281,42,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\",\"transmitter\":\"FFFF00\",\"receptor\":\"0D2735\",\"command\":\"0\",\"time\":\"10\"}',151,'1',0,0,0),(282,42,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\",\"transmitter\":\"FFFF00\",\"receptor\":\"0D2746\",\"command\":\"0\",\"time\":\"10\"}',153,'1',0,0,0),(283,43,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\",\"transmitter\":\"FFFF00\",\"receptor\":\"0D2735\",\"command\":\"0\"}',152,'0',0,1,0),(284,43,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\",\"transmitter\":\"FFFF00\",\"receptor\":\"0D2735\",\"command\":\"0\"}',152,'1',0,1,0),(285,43,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\",\"transmitter\":\"FFFF00\",\"receptor\":\"0D2746\",\"command\":\"0\"}',154,'0',0,1,0),(286,43,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\",\"transmitter\":\"FFFF00\",\"receptor\":\"0D2746\",\"command\":\"0\"}',154,'1',0,1,0),(287,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"time\":\"1\"}',155,'0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15',0,0,0),(288,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\"}',156,'0',0,1,0),(289,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\"}',156,'1',0,1,0),(290,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\"}',156,'2',0,1,0),(291,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\"}',156,'3',0,1,0),(292,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\"}',156,'4',0,1,0),(293,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\"}',156,'5',0,1,0),(294,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\"}',156,'6',0,1,0),(295,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\"}',156,'7',0,1,0),(296,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\"}',156,'8',0,1,0),(297,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\"}',156,'9',0,1,0),(298,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\"}',156,'10',0,1,0),(299,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\"}',156,'11',0,1,0),(300,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\"}',156,'12',0,1,0),(301,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\"}',156,'13',0,1,0),(302,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\"}',156,'14',0,1,0),(303,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\"}',156,'15',0,1,0),(304,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"converter\":\"0\",\"command\":\"64\",\"id\":\"1\"}',158,'1',0,1,0),(305,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"converter\":\"0\",\"command\":\"65\",\"id\":\"1\"}',159,'1',0,1,0),(306,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"converter\":\"0\",\"command\":\"66\",\"id\":\"1\"}',160,'1',0,1,0),(307,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"converter\":\"0\",\"command\":\"67\",\"id\":\"1\"}',161,'1',0,1,0),(308,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"converter\":\"0\",\"command\":\"68\",\"id\":\"1\"}',162,'1',0,1,0),(309,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"converter\":\"0\",\"command\":\"69\",\"id\":\"1\"}',163,'1',0,1,0),(310,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"converter\":\"0\",\"command\":\"70\",\"id\":\"1\"}',164,'1',0,1,0),(311,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"converter\":\"0\",\"command\":\"71\",\"id\":\"1\"}',165,'1',0,1,0),(312,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"converter\":\"0\",\"command\":\"72\",\"id\":\"1\"}',166,'1',0,1,0),(313,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"converter\":\"0\",\"command\":\"73\",\"id\":\"1\"}',167,'1',0,1,0),(314,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"converter\":\"0\",\"command\":\"74\",\"id\":\"1\"}',168,'1',0,1,0),(315,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"converter\":\"0\",\"command\":\"75\",\"id\":\"1\"}',169,'1',0,1,0),(316,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"converter\":\"0\",\"command\":\"76\",\"id\":\"1\"}',170,'1',0,1,0),(317,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"converter\":\"0\",\"command\":\"77\",\"id\":\"1\"}',171,'1',0,1,0),(318,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"converter\":\"0\",\"command\":\"78\",\"id\":\"1\"}',172,'1',0,1,0),(319,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"converter\":\"0\",\"command\":\"79\",\"id\":\"1\"}',173,'1',0,1,0),(320,1,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\", \"time\":\"60\", \"terminal_id\":\"2847b279a2010386\"}',174,'0',0,0,0),(321,1,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\", \"time\":\"60\", \"terminal_id\":\"28527079a2010397\"}',175,'0',0,0,0),(322,1,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\", \"time\":\"60\", \"terminal_id\":\"28075979a2010300\"}',176,'0',0,0,0),(323,1,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\", \"time\":\"60\", \"terminal_id\":\"287d6979a201038a\"}',177,'0',0,0,0),(324,1,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\", \"time\":\"60\", \"terminal_id\":\"28d96879a20103c7\"}',178,'0',0,0,0),(325,1,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\", \"time\":\"60\", \"terminal_id\":\"2890f379a20103e3\"}',179,'0',0,0,0),(326,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53140\",\"time\":\"1\"}',180,'8,9,10,11,12',0,0,0),(327,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53140\",\"time\":\"1\"}',180,'13,14,15',0,0,0),(328,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53140\"}',181,'8',0,1,0),(329,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53140\"}',181,'9',0,1,0),(330,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53140\"}',181,'10',0,1,0),(331,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53140\"}',181,'11',0,1,0),(332,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53140\"}',181,'12',0,1,0),(333,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53140\"}',181,'13',0,1,0),(334,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53140\"}',181,'14',0,1,0),(335,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53140\"}',181,'15',0,1,0),(336,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53140\",\"converter\":\"0\",\"command\":\"64\",\"id\":\"2\"}',183,'1',0,1,0),(337,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"time\":\"1\"}',184,'0,1,2,3,4,5,6,7,8,9,10,11',0,0,0),(338,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\"}',185,'0',0,1,0),(339,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\"}',185,'1',0,1,0),(340,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\"}',185,'2',0,1,0),(341,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\"}',185,'3',0,1,0),(342,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\"}',185,'4',0,1,0),(343,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\"}',185,'5',0,1,0),(344,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\"}',185,'6',0,1,0),(345,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\"}',185,'7',0,1,0),(346,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\"}',185,'8',0,1,0),(347,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\"}',185,'9',0,1,0),(348,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\"}',185,'10',0,1,0),(349,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\"}',185,'11',0,1,0),(350,1,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\", \"time\":\"60\", \"terminal_id\":\"28abd679a20103dc\"}',187,'0',0,0,0),(351,1,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\", \"time\":\"60\", \"terminal_id\":\"28317079a201030d\"}',188,'0',0,0,0),(352,1,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\", \"time\":\"60\", \"terminal_id\":\"287b8079a2010311\"}',189,'0',0,0,0),(353,1,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\", \"time\":\"60\", \"terminal_id\":\"28d3c679a2010399\"}',190,'0',0,0,0),(354,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"64\",\"id\":\"5\"}',191,'1',0,1,0),(355,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"65\",\"id\":\"5\"}',192,'1',0,1,0),(356,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"66\",\"id\":\"5\"}',193,'1',0,1,0),(357,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"67\",\"id\":\"5\"}',194,'1',0,1,0),(358,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"68\",\"id\":\"5\"}',195,'1',0,1,0),(359,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"69\",\"id\":\"5\"}',196,'1',0,1,0),(360,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"70\",\"id\":\"5\"}',197,'1',0,1,0),(361,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"71\",\"id\":\"5\"}',198,'1',0,1,0),(362,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"72\",\"id\":\"5\"}',199,'1',0,1,0),(363,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"73\",\"id\":\"5\"}',200,'1',0,1,0),(364,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"74\",\"id\":\"5\"}',201,'1',0,1,0),(365,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"75\",\"id\":\"5\"}',202,'1',0,1,0),(366,42,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\",\"transmitter\":\"FFFF00\",\"receptor\":\"0D2732\",\"command\":\"0\",\"time\":\"10\"}',203,'1',0,0,0),(367,43,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\",\"transmitter\":\"FFFF00\",\"receptor\":\"0D2732\",\"command\":\"0\"}',204,'0',0,1,0),(368,43,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\",\"transmitter\":\"FFFF00\",\"receptor\":\"0D2732\",\"command\":\"0\"}',204,'1',0,1,0),(369,23,'{\"command\":\"1\",\"ip\":\"80.28.98.191\",\"port\":\"53050\"}',205,'0',0,1,0),(370,23,'{\"command\":\"1\",\"ip\":\"80.28.98.191\",\"port\":\"53050\"}',205,'1',0,1,0),(371,23,'{\"command\":\"1\",\"ip\":\"80.28.98.191\",\"port\":\"53050\"}',205,'2',0,1,0),(372,23,'{\"command\":\"1\",\"ip\":\"80.28.98.191\",\"port\":\"53050\"}',205,'3',0,1,0),(373,23,'{\"command\":\"1\",\"ip\":\"80.28.98.191\",\"port\":\"53050\"}',205,'4',0,1,0),(374,23,'{\"command\":\"1\",\"ip\":\"80.28.98.191\",\"port\":\"53050\"}',205,'5',0,1,0),(375,23,'{\"command\":\"1\",\"ip\":\"80.28.98.191\",\"port\":\"53050\"}',205,'6',0,1,0),(376,23,'{\"command\":\"1\",\"ip\":\"80.28.98.191\",\"port\":\"53050\"}',205,'7',0,1,0),(377,23,'{\"command\":\"2\",\"ip\":\"80.28.98.191\",\"port\":\"53050\"}',206,'0',0,1,0),(378,23,'{\"command\":\"2\",\"ip\":\"80.28.98.191\",\"port\":\"53050\"}',206,'1',0,1,0),(379,23,'{\"command\":\"2\",\"ip\":\"80.28.98.191\",\"port\":\"53050\"}',206,'2',0,1,0),(380,23,'{\"command\":\"2\",\"ip\":\"80.28.98.191\",\"port\":\"53050\"}',206,'3',0,1,0),(381,21,'{\"command\":\"3\",\"ip\":\"80.28.98.191\",\"port\":\"53050\",\"time\":\"1\"}',207,'0,1,2,3,4,5,6,7',0,0,0),(382,21,'{\"command\":\"4\",\"ip\":\"80.28.98.191\",\"port\":\"53050\",\"time\":\"1\"}',208,'0,1,2,3,4,5,6,7',0,0,0),(383,23,'{\"command\":\"5\",\"ip\":\"80.28.98.191\",\"port\":\"53050\"}',209,'0',0,1,0),(384,23,'{\"command\":\"5\",\"ip\":\"80.28.98.191\",\"port\":\"53050\"}',209,'1',0,1,0),(385,21,'{\"command\":\"6\",\"ip\":\"80.28.98.191\",\"port\":\"53050\",\"time\":\"1\"}',210,'0,1,2,3,4,5,6,7',0,0,0),(386,23,'{\"command\":\"7\",\"ip\":\"80.28.98.191\",\"port\":\"53050\"}',211,'0',0,1,0),(387,23,'{\"command\":\"7\",\"ip\":\"80.28.98.191\",\"port\":\"53050\"}',211,'1',0,1,0),(388,23,'{\"command\":\"7\",\"ip\":\"80.28.98.191\",\"port\":\"53050\"}',211,'2',0,1,0),(389,23,'{\"command\":\"7\",\"ip\":\"80.28.98.191\",\"port\":\"53050\"}',211,'3',0,1,0),(390,21,'{\"command\":\"8\",\"ip\":\"80.28.98.191\",\"port\":\"53050\",\"time\":\"1\"}',212,'0,1,2,3,4,5,6,7',0,0,0),(391,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53154\"}',104,'5',0,1,0),(392,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53154\"}',104,'6',0,1,0),(393,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53154\",\"time\":\"1\"}',103,'11,12',0,0,0),(394,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53140\",\"pseudoterminal\":\"0\",\"variables_code\":\"43\"}',181,'0',0,1,1),(395,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53140\",\"pseudoterminal\":\"0\",\"variables_code\":\"44\"} }',181,'1',0,1,1),(396,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53140\",\"time\":\"1\"}',180,'0,1',0,0,0),(397,2,'{\"ip\":\"80.28.98.191\",\"port\":\"53140\",\"time\":\"1\"}',213,'2,3,4,5,6,7',0,0,0),(398,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53143\",\"time\":\"1\"}',61,'7,8,9,10,11',0,0,0),(399,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"time\":\"1\"}',69,'9,10',0,0,0),(400,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"pseudoterminal\":\"0\",\"variables_code\":\"45\"}',70,'8',0,1,1),(401,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"pseudoterminal\":\"0\",\"variables_code\":\"46\"} }',70,'9',0,1,1),(402,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\"}',185,'12',0,1,0),(403,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\"}',185,'13',0,1,0),(404,2,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"time\":\"1\"}',214,'12,13',0,0,0),(405,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"time\":\"1\"}',184,'14,15',0,0,0),(406,1,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\", \"time\":\"60\", \"terminal_id\":\"28e1899a2f210152\"}',215,'0',0,0,0),(407,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"converter\":\"0\",\"command\":\"0\",\"time\":\"10\",\"id\":\"1\"}',216,'3',0,0,0),(408,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"converter\":\"0\",\"command\":\"1\",\"time\":\"10\",\"id\":\"1\"}',217,'3',0,0,0),(409,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"converter\":\"0\",\"command\":\"2\",\"time\":\"10\",\"id\":\"1\"}',218,'3',0,0,0),(410,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"converter\":\"0\",\"command\":\"3\",\"time\":\"10\",\"id\":\"1\"}',219,'3',0,0,0),(411,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"converter\":\"0\",\"command\":\"4\",\"time\":\"10\",\"id\":\"1\"}',220,'3',0,0,0),(412,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"converter\":\"0\",\"command\":\"5\",\"time\":\"10\",\"id\":\"1\"}',221,'3',0,0,0),(413,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"converter\":\"0\",\"command\":\"6\",\"time\":\"10\",\"id\":\"1\"}',222,'3',0,0,0),(414,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"converter\":\"0\",\"command\":\"7\",\"time\":\"10\",\"id\":\"1\"}',223,'3',0,0,0),(415,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"converter\":\"0\",\"command\":\"8\",\"time\":\"10\",\"id\":\"1\"}',224,'3',0,0,0),(416,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"converter\":\"0\",\"command\":\"9\",\"time\":\"10\",\"id\":\"1\"}',225,'3',0,0,0),(417,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"converter\":\"0\",\"command\":\"10\",\"time\":\"10\",\"id\":\"1\"}',226,'3',0,0,0),(418,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"converter\":\"0\",\"command\":\"11\",\"time\":\"10\",\"id\":\"1\"}',227,'3',0,0,0),(419,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"converter\":\"0\",\"command\":\"12\",\"time\":\"10\",\"id\":\"1\"}',228,'3',0,0,0),(420,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"converter\":\"0\",\"command\":\"13\",\"time\":\"10\",\"id\":\"1\"}',229,'3',0,0,0),(421,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"converter\":\"0\",\"command\":\"14\",\"time\":\"10\",\"id\":\"1\"}',230,'3',0,0,0),(422,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"converter\":\"0\",\"command\":\"15\",\"time\":\"10\",\"id\":\"1\"}',231,'3',0,0,0),(423,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53140\",\"converter\":\"0\",\"command\":\"0\",\"time\":\"10\",\"id\":\"2\"}',232,'3',0,0,0),(424,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"25\",\"time\":\"300\",\"id\":\"0\"}',233,'3',0,0,0),(425,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"11\",\"time\":\"300\",\"id\":\"0\"}',234,'3',0,0,0),(426,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"10\",\"time\":\"300\",\"id\":\"0\"}',235,'3',0,0,0),(427,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"7\",\"time\":\"300\",\"id\":\"0\"}',236,'3',0,0,0),(428,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"0\",\"time\":\"300\",\"id\":\"0\"}',237,'3',0,0,0),(429,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"1\",\"time\":\"300\",\"id\":\"0\"}',238,'3',0,0,0),(430,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"2\",\"time\":\"300\",\"id\":\"0\"}',239,'3',0,0,0),(431,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"18\",\"time\":\"300\",\"id\":\"0\"}',240,'3',0,0,0),(432,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"13\",\"time\":\"300\",\"id\":\"0\"}',241,'3',0,0,0),(433,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"16\",\"time\":\"300\",\"id\":\"0\"}',242,'3',0,0,0),(434,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"4\",\"time\":\"300\",\"id\":\"0\"}',243,'3',0,0,0),(435,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"12\",\"time\":\"300\",\"id\":\"0\"}',244,'3',0,0,0),(436,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"converter\":\"0\",\"command\":\"16\",\"time\":\"300\",\"id\":\"3\"}',245,'3',0,0,0),(437,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"converter\":\"0\",\"command\":\"5\",\"time\":\"300\",\"id\":\"3\"}',246,'3',0,0,0),(438,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"converter\":\"0\",\"command\":\"27\",\"time\":\"300\",\"id\":\"3\"}',247,'3',0,0,0),(439,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"converter\":\"0\",\"command\":\"1\",\"time\":\"300\",\"id\":\"3\"}',248,'3',0,0,0),(440,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"converter\":\"0\",\"command\":\"29\",\"time\":\"300\",\"id\":\"3\"}',249,'3',0,0,0),(441,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"8\",\"time\":\"300\",\"id\":\"5\"}',250,'3',0,0,0),(442,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"12\",\"time\":\"300\",\"id\":\"5\"}',251,'3',0,0,0),(443,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"6\",\"time\":\"300\",\"id\":\"5\"}',252,'3',0,0,0),(444,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"15\",\"time\":\"300\",\"id\":\"5\"}',253,'3',0,0,0),(445,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"1\",\"time\":\"300\",\"id\":\"5\"}',254,'3',0,0,0),(446,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"10\",\"time\":\"300\",\"id\":\"5\"}',255,'3',0,0,0),(447,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"0\",\"time\":\"300\",\"id\":\"5\"}',256,'3',0,0,0),(448,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"20\",\"time\":\"300\",\"id\":\"5\"}',257,'3',0,0,0),(449,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"3\",\"time\":\"300\",\"id\":\"5\"}',258,'3',0,0,0),(450,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"2\",\"time\":\"300\",\"id\":\"5\"}',259,'3',0,0,0),(451,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"10\",\"time\":\"10\",\"id\":\"5\"}',260,'3',0,0,0),(452,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"11\",\"time\":\"10\",\"id\":\"5\"}',261,'3',0,0,0),(453,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53143\",\"converter\":\"0\",\"command\":\"2\",\"time\":\"300\",\"id\":\"12\"}',262,'3',0,0,0),(454,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53143\",\"converter\":\"0\",\"command\":\"7\",\"time\":\"300\",\"id\":\"12\"}',263,'3',0,0,0),(455,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53143\",\"converter\":\"0\",\"command\":\"0\",\"time\":\"300\",\"id\":\"12\"}',264,'3',0,0,0),(456,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53137\",\"converter\":\"0\",\"command\":\"0\",\"time\":\"10\",\"id\":\"10\"}',265,'3',1,0,0),(457,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53137\",\"converter\":\"0\",\"command\":\"1\",\"time\":\"10\",\"id\":\"10\"}',266,'3',1,0,0),(458,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53137\",\"converter\":\"0\",\"command\":\"2\",\"time\":\"10\",\"id\":\"10\"}',267,'3',1,0,0),(459,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53137\",\"converter\":\"0\",\"command\":\"3\",\"time\":\"10\",\"id\":\"10\"}',268,'3',1,0,0),(460,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53137\",\"converter\":\"0\",\"command\":\"4\",\"time\":\"10\",\"id\":\"10\"}',269,'3',1,0,0),(461,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53141\",\"converter\":\"0\",\"command\":\"0\",\"time\":\"10\",\"id\":\"11\"}',270,'3',1,0,0),(462,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53141\",\"converter\":\"0\",\"command\":\"1\",\"time\":\"10\",\"id\":\"11\"}',271,'3',1,0,0),(463,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53141\",\"converter\":\"0\",\"command\":\"2\",\"time\":\"10\",\"id\":\"11\"}',272,'3',1,0,0),(464,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53141\",\"converter\":\"0\",\"command\":\"3\",\"time\":\"10\",\"id\":\"11\"}',273,'3',1,0,0),(465,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53141\",\"converter\":\"0\",\"command\":\"4\",\"time\":\"10\",\"id\":\"11\"}',274,'3',1,0,0),(466,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53133\",\"converter\":\"0\",\"command\":\"0\",\"time\":\"10\",\"id\":\"7\"}',275,'3',1,0,0),(467,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53133\",\"converter\":\"0\",\"command\":\"1\",\"time\":\"10\",\"id\":\"7\"}',276,'3',1,0,0),(468,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53133\",\"converter\":\"0\",\"command\":\"2\",\"time\":\"10\",\"id\":\"7\"}',277,'3',1,0,0),(469,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53133\",\"converter\":\"0\",\"command\":\"3\",\"time\":\"10\",\"id\":\"7\"}',278,'3',1,0,0),(470,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53133\",\"converter\":\"0\",\"command\":\"4\",\"time\":\"10\",\"id\":\"7\"}',279,'3',1,0,0),(471,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53134\",\"converter\":\"0\",\"command\":\"0\",\"time\":\"10\",\"id\":\"8\"}',280,'3',1,0,0),(472,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53134\",\"converter\":\"0\",\"command\":\"1\",\"time\":\"10\",\"id\":\"8\"}',281,'3',1,0,0),(473,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53134\",\"converter\":\"0\",\"command\":\"2\",\"time\":\"10\",\"id\":\"8\"}',282,'3',1,0,0),(474,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53134\",\"converter\":\"0\",\"command\":\"3\",\"time\":\"10\",\"id\":\"8\"}',283,'3',1,0,0),(475,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53134\",\"converter\":\"0\",\"command\":\"4\",\"time\":\"10\",\"id\":\"8\"}',284,'3',1,0,0),(476,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"converter\":\"0\",\"command\":\"0\",\"time\":\"300\",\"id\":\"13\"}',285,'3',0,0,0),(477,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"converter\":\"0\",\"command\":\"5\",\"time\":\"300\",\"id\":\"13\"}',286,'3',0,0,0),(478,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"converter\":\"0\",\"command\":\"6\",\"time\":\"300\",\"id\":\"13\"}',287,'3',0,0,0),(479,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"converter\":\"0\",\"command\":\"3\",\"time\":\"300\",\"id\":\"13\"}',288,'3',0,0,0),(480,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"converter\":\"0\",\"command\":\"15\",\"time\":\"300\",\"id\":\"13\"}',289,'3',0,0,0),(481,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53149\",\"converter\":\"0\",\"command\":\"0\",\"time\":\"10\",\"id\":\"4\"}',290,'3',0,0,0),(482,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53149\",\"converter\":\"0\",\"command\":\"1\",\"time\":\"10\",\"id\":\"4\"}',291,'3',0,0,0),(483,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53149\",\"converter\":\"0\",\"command\":\"2\",\"time\":\"10\",\"id\":\"4\"}',292,'3',0,0,0),(484,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53149\",\"converter\":\"0\",\"command\":\"3\",\"time\":\"10\",\"id\":\"4\"}',293,'3',0,0,0),(485,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53149\",\"converter\":\"0\",\"command\":\"4\",\"time\":\"10\",\"id\":\"4\"}',294,'3',0,0,0),(486,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\",\"converter\":\"0\",\"command\":\"0\",\"time\":\"10\",\"id\":\"9\"}',295,'3',0,0,0),(487,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\",\"converter\":\"0\",\"command\":\"1\",\"time\":\"10\",\"id\":\"9\"}',296,'3',0,0,0),(488,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\",\"converter\":\"0\",\"command\":\"2\",\"time\":\"10\",\"id\":\"9\"}',297,'3',0,0,0),(489,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\",\"converter\":\"0\",\"command\":\"3\",\"time\":\"10\",\"id\":\"9\"}',298,'3',0,0,0),(490,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\",\"converter\":\"0\",\"command\":\"4\",\"time\":\"10\",\"id\":\"9\"}',299,'3',0,0,0),(491,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\",\"converter\":\"0\",\"command\":\"5\",\"time\":\"10\",\"id\":\"9\"}',300,'3',0,0,0),(492,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\",\"converter\":\"0\",\"command\":\"6\",\"time\":\"10\",\"id\":\"9\"}',301,'3',0,0,0),(493,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\",\"converter\":\"0\",\"command\":\"7\",\"time\":\"10\",\"id\":\"9\"}',302,'3',0,0,0),(494,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53135\",\"converter\":\"0\",\"command\":\"8\",\"time\":\"10\",\"id\":\"9\"}',303,'3',0,0,0),(495,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53131\",\"converter\":\"0\",\"command\":\"3\",\"time\":\"300\",\"id\":\"6\"}',304,'3',0,0,0),(496,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53131\",\"converter\":\"0\",\"command\":\"0\",\"time\":\"300\",\"id\":\"6\"}',305,'3',0,0,0),(497,16,'{\"ip\":\"80.28.98.191\",\"port\":\"53101\",\"command\":\"1\",\"time\":\"60\"}',306,'0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58',1,0,0),(498,16,'{\"ip\":\"80.28.98.191\",\"port\":\"53101\",\"command\":\"1\",\"time\":\"60\"}',306,'459,460,461,462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478',1,0,0),(499,31,'{\"ip\":\"80.28.98.191\",\"port\":\"53100\",\"command\":\"247\",\"time\":\"30\"}',307,'0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41',1,0,0),(500,31,'{\"ip\":\"80.28.98.191\",\"port\":\"53100\",\"command\":\"247\",\"time\":\"30\"}',307,'42,43,44,45,46,47',1,0,0),(501,23,'{\"command\":\"5\",\"ip\":\"80.28.98.191\",\"port\":\"53050\"}',209,'2',0,1,0),(502,1,'{\"ip\":\"80.28.98.191\",\"port\":\"53154\", \"time\":\"60\", \"terminal_id\":\"28ead1972f21019c\"}',310,'0',0,0,0),(503,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53147\"}',312,'0',0,1,0),(504,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53147\"}',312,'1',0,1,0),(505,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53147\"}',312,'2',0,1,0),(506,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53147\"}',312,'3',0,1,0),(507,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53147\"}',312,'4',0,1,0),(508,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53147\"}',312,'5',0,1,0),(509,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\"}',315,'0',0,1,0),(510,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\"}',315,'1',0,1,0),(511,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\"}',315,'2',0,1,0),(512,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\"}',315,'3',0,1,0),(513,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\"}',315,'4',0,1,0),(514,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\"}',315,'5',0,1,0),(515,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\"}',315,'6',0,1,0),(516,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\"}',315,'7',0,1,0),(517,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\"}',315,'8',0,1,0),(518,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\"}',315,'9',0,1,0),(519,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\"}',38,'11',0,1,0),(520,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\"}',38,'12',0,1,0),(521,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"converter\":\"0\",\"command\":\"69\",\"id\":\"13\"}',317,'1',0,1,0),(522,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"converter\":\"0\",\"command\":\"70\",\"id\":\"13\"}',318,'1',0,1,0),(523,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"converter\":\"0\",\"command\":\"5\",\"time\":\"10\",\"id\":\"13\"}',319,'3',0,0,0),(524,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"converter\":\"0\",\"command\":\"6\",\"time\":\"10\",\"id\":\"13\"}',320,'3',0,0,0),(525,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\"}',322,'0',0,1,0),(526,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\"}',322,'1',0,1,0),(527,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\"}',322,'2',0,1,0),(528,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\"}',322,'3',0,1,0),(529,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\"}',322,'4',0,1,0),(530,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\"}',322,'5',0,1,0),(531,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\"}',322,'6',0,1,0),(532,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\"}',322,'7',0,1,0),(533,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\",\"time\":\"1\"}',321,'0,1,2,3,4,5',0,0,0),(534,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\",\"time\":\"1\"}',321,'7,9',0,0,0),(535,2,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\",\"time\":\"1\"}',324,'6,8',0,0,0),(536,1,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\", \"time\":\"60\", \"terminal_id\":\"2876d16d2f21013a\"}',325,'0',0,0,0),(537,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\",\"converter\":\"0\",\"command\":\"64\",\"id\":\"14\"}',326,'1',0,1,0),(538,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\",\"converter\":\"0\",\"command\":\"65\",\"id\":\"14\"}',327,'1',0,1,0),(539,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\",\"converter\":\"0\",\"command\":\"66\",\"id\":\"14\"}',328,'1',0,1,0),(540,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\",\"converter\":\"0\",\"command\":\"67\",\"id\":\"14\"}',329,'1',0,1,0),(541,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\",\"converter\":\"0\",\"command\":\"68\",\"id\":\"14\"}',330,'1',0,1,0),(542,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\",\"converter\":\"0\",\"command\":\"69\",\"id\":\"14\"}',331,'1',0,1,0),(543,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\",\"converter\":\"0\",\"command\":\"0\",\"time\":\"300\",\"id\":\"14\"}',332,'3',1,0,0),(544,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\",\"converter\":\"0\",\"command\":\"14\",\"time\":\"300\",\"id\":\"14\"}',333,'3',1,0,0),(545,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\",\"converter\":\"0\",\"command\":\"2\",\"time\":\"300\",\"id\":\"14\"}',334,'3',1,0,0),(546,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\",\"converter\":\"0\",\"command\":\"5\",\"time\":\"300\",\"id\":\"14\"}',335,'3',1,0,0),(547,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\",\"converter\":\"0\",\"command\":\"20\",\"time\":\"300\",\"id\":\"14\"}',336,'3',1,0,0),(548,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\",\"converter\":\"0\",\"command\":\"5\",\"time\":\"10\",\"id\":\"14\"}',337,'3',1,0,0),(549,23,'{\"command\":\"1\",\"ip\":\"80.28.98.191\",\"port\":\"53057\"}',338,'0',0,1,0),(550,23,'{\"command\":\"1\",\"ip\":\"80.28.98.191\",\"port\":\"53057\"}',338,'1',0,1,0),(551,23,'{\"command\":\"1\",\"ip\":\"80.28.98.191\",\"port\":\"53057\"}',338,'2',0,1,0),(552,23,'{\"command\":\"1\",\"ip\":\"80.28.98.191\",\"port\":\"53057\"}',338,'3',0,1,0),(553,21,'{\"command\":\"2\",\"ip\":\"80.28.98.191\",\"port\":\"53057\",\"time\":\"1\"}',339,'0,1,2,3,4,5,6,7',0,0,0),(554,23,'{\"command\":\"3\",\"ip\":\"80.28.98.191\",\"port\":\"53057\"}',340,'0',0,1,0),(555,23,'{\"command\":\"3\",\"ip\":\"80.28.98.191\",\"port\":\"53057\"}',340,'1',0,1,0),(556,23,'{\"command\":\"3\",\"ip\":\"80.28.98.191\",\"port\":\"53057\"}',340,'2',0,1,0),(557,23,'{\"command\":\"3\",\"ip\":\"80.28.98.191\",\"port\":\"53057\"}',340,'3',0,1,0),(558,21,'{\"command\":\"4\",\"ip\":\"80.28.98.191\",\"port\":\"53057\",\"time\":\"1\"}',341,'0,1,2,3,4,5,6,7',0,0,0),(559,23,'{\"command\":\"5\",\"ip\":\"80.28.98.191\",\"port\":\"53057\"}',342,'0',0,1,0),(560,23,'{\"command\":\"5\",\"ip\":\"80.28.98.191\",\"port\":\"53057\"}',342,'1',0,1,0),(561,23,'{\"command\":\"5\",\"ip\":\"80.28.98.191\",\"port\":\"53057\"}',342,'2',0,1,0),(562,23,'{\"command\":\"5\",\"ip\":\"80.28.98.191\",\"port\":\"53057\"}',342,'3',0,1,0),(563,21,'{\"command\":\"6\",\"ip\":\"80.28.98.191\",\"port\":\"53057\",\"time\":\"1\"}',343,'0,1,2,3,4,5,6,7',0,0,0),(564,23,'{\"command\":\"7\",\"ip\":\"80.28.98.191\",\"port\":\"53057\"}',344,'0',0,1,0),(565,23,'{\"command\":\"7\",\"ip\":\"80.28.98.191\",\"port\":\"53057\"}',344,'1',0,1,0),(566,23,'{\"command\":\"7\",\"ip\":\"80.28.98.191\",\"port\":\"53057\"}',344,'2',0,1,0),(567,23,'{\"command\":\"7\",\"ip\":\"80.28.98.191\",\"port\":\"53057\"}',344,'3',0,1,0),(568,23,'{\"command\":\"7\",\"ip\":\"80.28.98.191\",\"port\":\"53057\"}',344,'4',0,1,0),(569,21,'{\"command\":\"8\",\"ip\":\"80.28.98.191\",\"port\":\"53057\",\"time\":\"1\"}',345,'0,1,2,3,4,5,6,7',0,0,0),(570,42,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"transmitter\":\"FFFF00\",\"receptor\":\"0D2741\",\"command\":\"0\",\"time\":\"10\"}',346,'1',0,0,0),(571,43,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"command\":\"0\",\"transmitter\":\"FFFF00\",\"receptor\":\"0D2741\"}',347,'0',0,1,0),(572,43,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"command\":\"0\",\"transmitter\":\"FFFF00\",\"receptor\":\"0D2741\"}',347,'1',0,1,0),(573,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"17\",\"time\":\"300\",\"id\":\"0\"}',348,'3',0,0,0),(574,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"15\",\"time\":\"300\",\"id\":\"0\"}',349,'3',0,0,0),(575,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"20\",\"time\":\"300\",\"id\":\"0\"}',350,'3',0,0,0),(576,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"27\",\"time\":\"300\",\"id\":\"0\"}',351,'3',0,0,0),(577,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"24\",\"time\":\"300\",\"id\":\"0\"}',352,'3',0,0,0),(578,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"5\",\"time\":\"300\",\"id\":\"0\"}',353,'3',0,0,0),(579,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"8\",\"time\":\"300\",\"id\":\"0\"}',354,'3',0,0,0),(580,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"29\",\"time\":\"300\",\"id\":\"0\"}',355,'3',0,0,0),(581,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"6\",\"time\":\"300\",\"id\":\"0\"}',356,'3',0,0,0),(582,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"9\",\"time\":\"300\",\"id\":\"0\"}',357,'3',0,0,0),(583,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"21\",\"time\":\"300\",\"id\":\"0\"}',358,'3',0,0,0),(584,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"3\",\"time\":\"300\",\"id\":\"0\"}',359,'3',0,0,0),(585,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"28\",\"time\":\"300\",\"id\":\"0\"}',360,'3',0,0,0),(586,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"14\",\"time\":\"300\",\"id\":\"0\"}',361,'3',0,0,0),(587,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"19\",\"time\":\"300\",\"id\":\"0\"}',362,'3',0,0,0),(588,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"22\",\"time\":\"300\",\"id\":\"0\"}',363,'3',0,0,0),(589,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"23\",\"time\":\"300\",\"id\":\"0\"}',364,'3',0,0,0),(590,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"30\",\"time\":\"300\",\"id\":\"0\"}',365,'3',0,0,0),(591,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53138\",\"converter\":\"0\",\"command\":\"26\",\"time\":\"300\",\"id\":\"0\"}',366,'3',0,0,0),(592,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53143\",\"converter\":\"0\",\"command\":\"3\",\"time\":\"300\",\"id\":\"12\"}',367,'3',0,0,0),(593,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53143\",\"converter\":\"0\",\"command\":\"4\",\"time\":\"300\",\"id\":\"12\"}',368,'3',0,0,0),(594,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53143\",\"converter\":\"0\",\"command\":\"6\",\"time\":\"300\",\"id\":\"12\"}',369,'3',0,0,0),(595,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53143\",\"converter\":\"0\",\"command\":\"1\",\"time\":\"300\",\"id\":\"12\"}',370,'3',0,0,0),(596,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53143\",\"converter\":\"0\",\"command\":\"5\",\"time\":\"300\",\"id\":\"12\"}',371,'3',0,0,0),(597,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"converter\":\"0\",\"command\":\"6\",\"time\":\"300\",\"id\":\"3\"}',372,'3',0,0,0),(598,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"converter\":\"0\",\"command\":\"9\",\"time\":\"300\",\"id\":\"3\"}',373,'3',0,0,0),(599,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"converter\":\"0\",\"command\":\"10\",\"time\":\"300\",\"id\":\"3\"}',374,'3',0,0,0),(600,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"converter\":\"0\",\"command\":\"13\",\"time\":\"300\",\"id\":\"3\"}',375,'3',0,0,0),(601,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"converter\":\"0\",\"command\":\"14\",\"time\":\"300\",\"id\":\"3\"}',376,'3',0,0,0),(602,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"converter\":\"0\",\"command\":\"17\",\"time\":\"300\",\"id\":\"3\"}',377,'3',0,0,0),(603,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"converter\":\"0\",\"command\":\"18\",\"time\":\"300\",\"id\":\"3\"}',378,'3',0,0,0),(604,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"converter\":\"0\",\"command\":\"19\",\"time\":\"300\",\"id\":\"3\"}',379,'3',0,0,0),(605,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"converter\":\"0\",\"command\":\"20\",\"time\":\"300\",\"id\":\"3\"}',380,'3',0,0,0),(606,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"converter\":\"0\",\"command\":\"28\",\"time\":\"300\",\"id\":\"3\"}',381,'3',0,0,0),(607,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"converter\":\"0\",\"command\":\"2\",\"time\":\"300\",\"id\":\"3\"}',382,'3',0,0,0),(608,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"converter\":\"0\",\"command\":\"3\",\"time\":\"300\",\"id\":\"3\"}',383,'3',0,0,0),(609,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"converter\":\"0\",\"command\":\"4\",\"time\":\"300\",\"id\":\"3\"}',384,'3',0,0,0),(610,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"converter\":\"0\",\"command\":\"7\",\"time\":\"300\",\"id\":\"3\"}',385,'3',0,0,0),(611,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"converter\":\"0\",\"command\":\"8\",\"time\":\"300\",\"id\":\"3\"}',386,'3',0,0,0),(612,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"converter\":\"0\",\"command\":\"11\",\"time\":\"300\",\"id\":\"3\"}',387,'3',0,0,0),(613,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"converter\":\"0\",\"command\":\"12\",\"time\":\"300\",\"id\":\"3\"}',388,'3',0,0,0),(614,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"converter\":\"0\",\"command\":\"15\",\"time\":\"300\",\"id\":\"3\"}',389,'3',0,0,0),(615,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"converter\":\"0\",\"command\":\"21\",\"time\":\"300\",\"id\":\"3\"}',390,'3',0,0,0),(616,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"converter\":\"0\",\"command\":\"22\",\"time\":\"300\",\"id\":\"3\"}',391,'3',0,0,0),(617,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"converter\":\"0\",\"command\":\"24\",\"time\":\"300\",\"id\":\"3\"}',392,'3',0,0,0),(618,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"converter\":\"0\",\"command\":\"25\",\"time\":\"300\",\"id\":\"3\"}',393,'3',0,0,0),(619,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"converter\":\"0\",\"command\":\"26\",\"time\":\"300\",\"id\":\"3\"}',394,'3',0,0,0),(620,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53142\",\"converter\":\"0\",\"command\":\"23\",\"time\":\"300\",\"id\":\"3\"}',395,'3',0,0,0),(621,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\",\"converter\":\"0\",\"command\":\"1\",\"time\":\"300\",\"id\":\"14\"}',396,'3',0,0,0),(622,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\",\"converter\":\"0\",\"command\":\"4\",\"time\":\"300\",\"id\":\"14\"}',397,'3',0,0,0),(623,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\",\"converter\":\"0\",\"command\":\"11\",\"time\":\"300\",\"id\":\"14\"}',398,'3',0,0,0),(624,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\",\"converter\":\"0\",\"command\":\"12\",\"time\":\"300\",\"id\":\"14\"}',399,'3',0,0,0),(625,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\",\"converter\":\"0\",\"command\":\"13\",\"time\":\"300\",\"id\":\"14\"}',400,'3',0,0,0),(626,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\",\"converter\":\"0\",\"command\":\"16\",\"time\":\"300\",\"id\":\"14\"}',401,'3',0,0,0),(627,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\",\"converter\":\"0\",\"command\":\"27\",\"time\":\"300\",\"id\":\"14\"}',402,'3',0,0,0),(628,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\",\"converter\":\"0\",\"command\":\"15\",\"time\":\"300\",\"id\":\"14\"}',403,'3',0,0,0),(629,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\",\"converter\":\"0\",\"command\":\"6\",\"time\":\"300\",\"id\":\"14\"}',404,'3',0,0,0),(630,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\",\"converter\":\"0\",\"command\":\"8\",\"time\":\"300\",\"id\":\"14\"}',405,'3',0,0,0),(631,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\",\"converter\":\"0\",\"command\":\"10\",\"time\":\"300\",\"id\":\"14\"}',406,'3',0,0,0),(632,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\",\"converter\":\"0\",\"command\":\"18\",\"time\":\"300\",\"id\":\"14\"}',407,'3',0,0,0),(633,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\",\"converter\":\"0\",\"command\":\"21\",\"time\":\"300\",\"id\":\"14\"}',408,'3',0,0,0),(634,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\",\"converter\":\"0\",\"command\":\"22\",\"time\":\"300\",\"id\":\"14\"}',409,'3',0,0,0),(635,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\",\"converter\":\"0\",\"command\":\"23\",\"time\":\"300\",\"id\":\"14\"}',410,'3',0,0,0),(636,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\",\"converter\":\"0\",\"command\":\"24\",\"time\":\"300\",\"id\":\"14\"}',411,'3',0,0,0),(637,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\",\"converter\":\"0\",\"command\":\"25\",\"time\":\"300\",\"id\":\"14\"}',412,'3',0,0,0),(638,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\",\"converter\":\"0\",\"command\":\"26\",\"time\":\"300\",\"id\":\"14\"}',413,'3',0,0,0),(639,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\",\"converter\":\"0\",\"command\":\"3\",\"time\":\"300\",\"id\":\"14\"}',414,'3',0,0,0),(640,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\",\"converter\":\"0\",\"command\":\"7\",\"time\":\"300\",\"id\":\"14\"}',415,'3',0,0,0),(641,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\",\"converter\":\"0\",\"command\":\"9\",\"time\":\"300\",\"id\":\"14\"}',416,'3',0,0,0),(642,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\",\"converter\":\"0\",\"command\":\"17\",\"time\":\"300\",\"id\":\"14\"}',417,'3',0,0,0),(643,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\",\"converter\":\"0\",\"command\":\"19\",\"time\":\"300\",\"id\":\"14\"}',418,'3',0,0,0),(644,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53131\",\"converter\":\"0\",\"command\":\"6\",\"time\":\"300\",\"id\":\"6\"}',419,'3',0,0,0),(645,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53131\",\"converter\":\"0\",\"command\":\"7\",\"time\":\"300\",\"id\":\"6\"}',420,'3',0,0,0),(646,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53131\",\"converter\":\"0\",\"command\":\"1\",\"time\":\"300\",\"id\":\"6\"}',421,'3',0,0,0),(647,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53131\",\"converter\":\"0\",\"command\":\"2\",\"time\":\"300\",\"id\":\"6\"}',422,'3',0,0,0),(648,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53131\",\"converter\":\"0\",\"command\":\"4\",\"time\":\"300\",\"id\":\"6\"}',423,'3',0,0,0),(649,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53131\",\"converter\":\"0\",\"command\":\"5\",\"time\":\"300\",\"id\":\"6\"}',424,'3',0,0,0),(650,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53131\",\"converter\":\"0\",\"command\":\"8\",\"time\":\"300\",\"id\":\"6\"}',425,'3',0,0,0),(651,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"13\",\"time\":\"300\",\"id\":\"5\"}',426,'3',0,0,0),(652,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"17\",\"time\":\"300\",\"id\":\"5\"}',427,'3',0,0,0),(653,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"21\",\"time\":\"300\",\"id\":\"5\"}',428,'3',0,0,0),(654,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"24\",\"time\":\"300\",\"id\":\"5\"}',429,'3',0,0,0),(655,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"37\",\"time\":\"300\",\"id\":\"5\"}',430,'3',0,0,0),(656,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"41\",\"time\":\"300\",\"id\":\"5\"}',431,'3',0,0,0),(657,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"11\",\"time\":\"300\",\"id\":\"5\"}',261,'3',0,0,0),(658,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"18\",\"time\":\"300\",\"id\":\"5\"}',432,'3',0,0,0),(659,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"4\",\"time\":\"300\",\"id\":\"5\"}',433,'3',0,0,0),(660,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"7\",\"time\":\"300\",\"id\":\"5\"}',434,'3',0,0,0),(661,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"26\",\"time\":\"300\",\"id\":\"5\"}',435,'3',0,0,0),(662,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"30\",\"time\":\"300\",\"id\":\"5\"}',436,'3',0,0,0),(663,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"32\",\"time\":\"300\",\"id\":\"5\"}',437,'3',0,0,0),(664,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"40\",\"time\":\"300\",\"id\":\"5\"}',438,'3',0,0,0),(665,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"5\",\"time\":\"300\",\"id\":\"5\"}',439,'3',0,0,0),(666,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"36\",\"time\":\"300\",\"id\":\"5\"}',440,'3',0,0,0),(667,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"19\",\"time\":\"300\",\"id\":\"5\"}',441,'3',0,0,0),(668,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"25\",\"time\":\"300\",\"id\":\"5\"}',442,'3',0,0,0),(669,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"27\",\"time\":\"300\",\"id\":\"5\"}',443,'3',0,0,0),(670,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"28\",\"time\":\"300\",\"id\":\"5\"}',444,'3',0,0,0),(671,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"29\",\"time\":\"300\",\"id\":\"5\"}',445,'3',0,0,0),(672,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"35\",\"time\":\"300\",\"id\":\"5\"}',446,'3',0,0,0),(673,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"39\",\"time\":\"300\",\"id\":\"5\"}',447,'3',0,0,0),(674,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"38\",\"time\":\"300\",\"id\":\"5\"}',448,'3',0,0,0),(675,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"9\",\"time\":\"300\",\"id\":\"5\"}',449,'3',0,0,0),(676,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"14\",\"time\":\"300\",\"id\":\"5\"}',450,'3',0,0,0),(677,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"16\",\"time\":\"300\",\"id\":\"5\"}',451,'3',0,0,0),(678,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"22\",\"time\":\"300\",\"id\":\"5\"}',452,'3',0,0,0),(679,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"23\",\"time\":\"300\",\"id\":\"5\"}',453,'3',0,0,0),(680,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"31\",\"time\":\"300\",\"id\":\"5\"}',454,'3',0,0,0),(681,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"33\",\"time\":\"300\",\"id\":\"5\"}',455,'3',0,0,0),(682,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53130\",\"converter\":\"0\",\"command\":\"34\",\"time\":\"300\",\"id\":\"5\"}',456,'3',0,0,0),(683,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"converter\":\"0\",\"command\":\"10\",\"time\":\"300\",\"id\":\"13\"}',457,'3',0,0,0),(684,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"converter\":\"0\",\"command\":\"7\",\"time\":\"300\",\"id\":\"13\"}',458,'3',0,0,0),(685,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"converter\":\"0\",\"command\":\"14\",\"time\":\"300\",\"id\":\"13\"}',459,'3',0,0,0),(686,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"converter\":\"0\",\"command\":\"9\",\"time\":\"300\",\"id\":\"13\"}',460,'3',0,0,0),(687,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"converter\":\"0\",\"command\":\"12\",\"time\":\"300\",\"id\":\"13\"}',461,'3',0,0,0),(688,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"converter\":\"0\",\"command\":\"17\",\"time\":\"300\",\"id\":\"13\"}',462,'3',0,0,0),(689,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"converter\":\"0\",\"command\":\"16\",\"time\":\"300\",\"id\":\"13\"}',463,'3',0,0,0),(690,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"converter\":\"0\",\"command\":\"2\",\"time\":\"300\",\"id\":\"13\"}',464,'3',0,0,0),(691,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"converter\":\"0\",\"command\":\"4\",\"time\":\"300\",\"id\":\"13\"}',465,'3',0,0,0),(692,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"converter\":\"0\",\"command\":\"8\",\"time\":\"300\",\"id\":\"13\"}',466,'3',0,0,0),(693,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"converter\":\"0\",\"command\":\"11\",\"time\":\"300\",\"id\":\"13\"}',467,'3',0,0,0),(694,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"converter\":\"0\",\"command\":\"18\",\"time\":\"300\",\"id\":\"13\"}',468,'3',0,0,0),(695,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53144\",\"converter\":\"0\",\"command\":\"19\",\"time\":\"300\",\"id\":\"13\"}',469,'3',0,0,0),(696,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\",\"converter\":\"0\",\"command\":\"0\",\"time\":\"300\",\"id\":\"15\"}',470,'3',0,0,0),(697,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\",\"converter\":\"0\",\"command\":\"2\",\"time\":\"300\",\"id\":\"15\"}',471,'3',0,0,0),(698,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\",\"converter\":\"0\",\"command\":\"5\",\"time\":\"300\",\"id\":\"15\"}',472,'3',0,0,0),(699,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\",\"converter\":\"0\",\"command\":\"7\",\"time\":\"300\",\"id\":\"15\"}',473,'3',0,0,0),(700,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\",\"converter\":\"0\",\"command\":\"8\",\"time\":\"300\",\"id\":\"15\"}',474,'3',0,0,0),(701,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\",\"converter\":\"0\",\"command\":\"10\",\"time\":\"300\",\"id\":\"15\"}',475,'3',0,0,0),(702,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\",\"converter\":\"0\",\"command\":\"11\",\"time\":\"300\",\"id\":\"15\"}',476,'3',0,0,0),(703,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\",\"converter\":\"0\",\"command\":\"13\",\"time\":\"300\",\"id\":\"15\"}',477,'3',0,0,0),(704,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\",\"converter\":\"0\",\"command\":\"14\",\"time\":\"300\",\"id\":\"15\"}',478,'3',0,0,0),(705,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\",\"converter\":\"0\",\"command\":\"1\",\"time\":\"300\",\"id\":\"15\"}',479,'3',0,0,0),(706,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\",\"converter\":\"0\",\"command\":\"3\",\"time\":\"300\",\"id\":\"15\"}',480,'3',0,0,0),(707,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\",\"converter\":\"0\",\"command\":\"9\",\"time\":\"300\",\"id\":\"15\"}',481,'3',0,0,0),(708,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\",\"converter\":\"0\",\"command\":\"4\",\"time\":\"300\",\"id\":\"15\"}',482,'3',0,0,0),(709,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\",\"converter\":\"0\",\"command\":\"6\",\"time\":\"300\",\"id\":\"15\"}',483,'3',0,0,0),(710,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\",\"converter\":\"0\",\"command\":\"12\",\"time\":\"300\",\"id\":\"15\"}',484,'3',0,0,0),(711,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\",\"converter\":\"0\",\"command\":\"16\",\"time\":\"300\",\"id\":\"15\"}',485,'3',0,0,0),(712,3,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\",\"converter\":\"0\",\"command\":\"15\",\"time\":\"300\",\"id\":\"15\"}',486,'3',0,0,0),(713,50,'{\"ip\":\"80.28.98.191\",\"port\":\"53050\",\"command\":\"1\",\"time\":\"60\"}',487,'0,1',0,0,0),(714,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\",\"converter\":\"0\",\"command\":\"69\",\"id\":\"15\"}',488,'1',0,1,0),(715,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\",\"converter\":\"0\",\"command\":\"69\",\"id\":\"15\"}',488,'3',0,1,0),(716,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\",\"converter\":\"0\",\"command\":\"70\",\"id\":\"15\"}',489,'1',0,1,0),(717,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\",\"converter\":\"0\",\"command\":\"70\",\"id\":\"15\"}',489,'3',0,1,0),(718,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\",\"converter\":\"0\",\"command\":\"71\",\"id\":\"15\"}',490,'1',0,1,0),(719,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\",\"converter\":\"0\",\"command\":\"71\",\"id\":\"15\"}',490,'3',0,1,0),(720,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\",\"converter\":\"0\",\"command\":\"72\",\"id\":\"15\"}',491,'4',0,1,0),(721,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\",\"converter\":\"0\",\"command\":\"64\",\"id\":\"15\"}',492,'1',0,1,0),(722,52,'{\"ip\":\"80.28.98.191\",\"port\":\"53056\",\"command\":\"1\",\"type\":\"3\",\"time\":\"5\"}',493,'2,3,4,5,6',0,0,0),(723,1,'{\"ip\":\"80.28.98.191\",\"port\":\"53145\", \"time\":\"60\", \"terminal_id\":\"28be14524121d6f4\"}',495,'0',0,0,0),(724,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\"}',315,'10',0,1,0),(725,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\"}',315,'11',0,1,0),(726,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\",\"time\":\"1\"}',314,'0,1,2,3,4,5,10,11',0,0,0),(727,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\",\"time\":\"1\"}',314,'6,7,8,9',0,0,0),(728,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53155\",\"time\":\"1\"}',496,'0,1,2,3,4,5,6,7,8',0,0,0),(729,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53155\"}',497,'0',0,1,0),(730,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53155\"}',497,'1',0,1,0),(731,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53148\",\"time\":\"1\"}',499,'0,1,2,3,4,5,6,7',0,0,0),(732,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53148\"}',500,'0',0,1,0),(733,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53148\"}',500,'1',0,1,0),(734,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53148\"}',500,'2',0,1,0),(735,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53148\"}',500,'3',0,1,0),(736,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53148\"}',500,'4',0,1,0),(737,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\",\"converter\":\"0\",\"command\":\"65\",\"id\":\"15\"}',502,'1',0,1,0),(738,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\",\"converter\":\"0\",\"command\":\"66\",\"id\":\"15\"}',503,'1',0,1,0),(739,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\",\"converter\":\"0\",\"command\":\"67\",\"id\":\"15\"}',504,'1',0,1,0),(740,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\",\"converter\":\"0\",\"command\":\"68\",\"id\":\"15\"}',505,'1',0,1,0),(741,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\",\"converter\":\"0\",\"command\":\"73\",\"id\":\"15\"}',506,'1',0,1,0),(742,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\",\"converter\":\"0\",\"command\":\"73\",\"id\":\"15\"}',506,'3',0,1,0),(743,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\",\"converter\":\"0\",\"command\":\"74\",\"id\":\"15\"}',507,'1',0,1,0),(744,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\",\"converter\":\"0\",\"command\":\"74\",\"id\":\"15\"}',507,'3',0,1,0),(745,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\",\"converter\":\"0\",\"command\":\"75\",\"id\":\"15\"}',508,'1',0,1,0),(746,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\",\"converter\":\"0\",\"command\":\"75\",\"id\":\"15\"}',508,'3',0,1,0),(747,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\",\"converter\":\"0\",\"command\":\"76\",\"id\":\"15\"}',509,'4',0,1,0),(748,1,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\", \"time\":\"60\", \"terminal_id\":\"28b614e8412106df\"}',510,'0',0,0,0),(749,1,'{\"ip\":\"80.28.98.191\",\"port\":\"53132\", \"time\":\"60\", \"terminal_id\":\"28487ed041210646\"}',511,'0',0,0,0),(750,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53148\",\"converter\":\"0\",\"command\":\"64\",\"id\":\"16\"}',512,'1',0,1,0),(751,1,'{\"ip\":\"80.28.98.191\",\"port\":\"53148\", \"time\":\"60\", \"terminal_id\":\"2894bb2040210994\"}',513,'0',0,0,0),(752,1,'{\"ip\":\"80.28.98.191\",\"port\":\"53148\", \"time\":\"60\", \"terminal_id\":\"287efd5540210a01\"}',514,'0',0,0,0),(753,1,'{\"ip\":\"80.28.98.191\",\"port\":\"53155\", \"time\":\"60\", \"terminal_id\":\"289eb1b4412106e3\"}',515,'0',0,0,0),(754,1,'{\"ip\":\"80.28.98.191\",\"port\":\"53155\", \"time\":\"60\", \"terminal_id\":\"28d2553f41210638\"}',516,'0',0,0,0),(755,1,'{\"ip\":\"80.28.98.191\",\"port\":\"53155\", \"time\":\"60\", \"terminal_id\":\"28e9f22a42210649\"}',517,'0',0,0,0),(756,1,'{\"ip\":\"80.28.98.191\",\"port\":\"53155\", \"time\":\"60\", \"terminal_id\":\"2817e72e4121066c\"}',518,'0',0,0,0),(757,51,'{\"command\":\"1\",\"ip\":\"80.28.98.191\",\"port\":\"53155\",\"time\":\"300\"}',519,'0,1',0,0,0),(758,7,'{\"ip\":\"80.28.98.191\",\"port\":\"53147\"}',312,'6',0,1,0),(759,0,'{\"ip\":\"80.28.98.191\",\"port\":\"53147\",\"time\":\"1\"}',311,'0,1,2,3,4,5,6',0,0,0),(760,1,'{\"ip\":\"80.28.98.191\",\"port\":\"53147\", \"time\":\"120\", \"terminal_id\":\"289dea05422106a5\"}',520,'0',0,0,0),(761,1,'{\"ip\":\"80.28.98.191\",\"port\":\"53147\", \"time\":\"120\", \"terminal_id\":\"281f53fb4121061d\"}',521,'0',0,0,0),(762,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53147\",\"converter\":\"0\",\"command\":\"64\",\"id\":\"16\"}',522,'1',0,1,0),(763,8,'{\"ip\":\"80.28.98.191\",\"port\":\"53147\",\"converter\":\"0\",\"command\":\"65\",\"id\":\"16\"}',523,'1',0,1,0),(764,42,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"transmitter\":\"FFFF00\",\"receptor\":\"0CB0D9\",\"command\":\"0\",\"time\":\"10\"}',524,'1',0,0,0),(765,43,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"command\":\"0\",\"transmitter\":\"FFFF00\",\"receptor\":\"0CB0D9\"}',525,'0',0,1,0),(766,43,'{\"ip\":\"80.28.98.191\",\"port\":\"53139\",\"command\":\"0\",\"transmitter\":\"FFFF00\",\"receptor\":\"0CB0D9\"}',525,'1',0,1,0),(767,52,'{\"ip\":\"80.28.98.191\",\"port\":\"53061\",\"command\":\"1\",\"type\":\"3\",\"time\":\"10\"}',526,'2,3,4,5,6',0,0,0);
/*!40000 ALTER TABLE `iniciarhilostrb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iot`
--

DROP TABLE IF EXISTS `iot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `iot_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iot`
--

LOCK TABLES `iot` WRITE;
/*!40000 ALTER TABLE `iot` DISABLE KEYS */;
INSERT INTO `iot` VALUES (1,'2022-09-26 08:48:39','Enchufe cabecero derecho',26,1),(2,'2022-09-26 08:48:39','Enchufe cabecero izquierdo',26,1),(3,'2022-09-26 08:48:39','Enchufe TV',26,1),(4,'2022-09-19 20:47:14','Enchufe cabecero derecho',28,1),(5,'2022-09-19 20:47:15','Enchufe cabecero izquierdo',28,1),(6,'2022-09-19 20:47:15','Enchufe TV',28,1),(7,'2022-09-22 14:46:58','Enchufe cabecero derecho',30,1),(8,'2022-09-22 14:46:58','Enchufe cabecero izquierdo',30,1),(9,'2022-09-22 14:47:02','Enchufe TV',30,0),(10,'2022-07-17 17:09:17','Enchufe cabecero derecho',32,1),(11,'2022-07-17 17:09:22','Enchufe cabecero izquierdo',32,1),(12,'2022-07-17 17:09:12','Enchufe TV',32,1),(13,'2022-09-27 11:01:01','Enchufe cabecero derecho',11,1),(14,'2022-09-27 11:01:03','Enchufe cabecero izquierdo',11,1),(15,'2022-09-27 11:01:33','Enchufe TV',11,1),(16,'2022-09-13 17:31:04','Enchufe cabecero derecho',34,0),(17,'2022-09-13 17:31:18','Enchufe cabecero izquierdo',34,0),(18,'2022-09-13 17:31:18','Enchufe TV',34,0),(19,'2022-09-22 06:40:40','Enchufe suelo',21,1),(20,'2022-09-23 09:52:31','Enchufe tv sala tv',46,1),(21,'2022-09-23 09:52:31','Enchufe pared sala tv',46,1),(22,'2022-09-13 17:27:39','Enchufe comedor',13,0),(23,'2022-09-13 17:28:31','Enchufe pasillo derecho',19,0),(24,'2022-09-23 16:12:39','Enchufe TV',22,1),(25,'2022-09-23 16:12:39','Enchufe cabecero izquierdo',24,1),(26,'2022-09-23 16:12:39','Enchufe cabecero derecho',24,1),(27,'2022-09-23 16:12:39','Enchufe cabecero izquierdo',22,1),(28,'2022-09-23 16:12:39','Enchufe cabecero derecho',22,1),(29,'2022-09-07 16:38:19','Usos Varios',26,0),(30,'2022-06-26 23:38:27','Usos Varios',28,0),(31,'2022-09-22 14:47:02','Usos Varios',30,0),(32,'2022-07-17 17:09:24','Usos Varios',32,1),(33,'2022-09-22 04:04:40','Usos Varios',21,0),(34,'2022-09-13 17:31:04','Usos Varios',34,0),(35,'2022-09-27 11:01:15','Usos Varios',11,0),(36,'2022-09-08 14:26:17','enchufe zona hamacas',41,0),(37,'2022-09-09 07:54:45','Enchufe tv',40,0);
/*!40000 ALTER TABLE `iot` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`fincahazard`@`localhost`*/ /*!50003 TRIGGER trigger_iot
   AFTER UPDATE ON iot
   FOR EACH ROW
   BEGIN

   DECLARE done INT DEFAULT 0;
   DECLARE cod_ope INT;
   DECLARE v_cumple INT;

   DECLARE cursor_operacion CURSOR FOR SELECT b.codigo_operacion
   FROM operacion_iot as b
   WHERE b.codigo_iot = NEW.id;

   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

   OPEN cursor_operacion;

   read_loop: LOOP

   FETCH cursor_operacion INTO cod_ope;

   IF done THEN
   LEAVE read_loop;
   END IF;

   SELECT count(id)
   INTO v_cumple
   FROM operacion_iot
   WHERE estado = NEW.estado
   AND codigo_operacion = cod_ope;

   IF (v_cumple = 0) THEN
      UPDATE operacion SET estado = 0 WHERE id = cod_ope;
   ELSE
      UPDATE operacion SET estado = 1 WHERE id = cod_ope;
   END IF;

   END LOOP;

   CLOSE cursor_operacion;
   END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `iot_previo_rutina`
--

DROP TABLE IF EXISTS `iot_previo_rutina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iot_previo_rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `iot_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iot_previo_rutina`
--

LOCK TABLES `iot_previo_rutina` WRITE;
/*!40000 ALTER TABLE `iot_previo_rutina` DISABLE KEYS */;
/*!40000 ALTER TABLE `iot_previo_rutina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `luces`
--

DROP TABLE IF EXISTS `luces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `luces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  `intensidad` int(11) DEFAULT -1,
  `rgb` varchar(15) DEFAULT '-1',
  `temperatura` int(11) DEFAULT -1,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `luces_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `luces`
--

LOCK TABLES `luces` WRITE;
/*!40000 ALTER TABLE `luces` DISABLE KEYS */;
INSERT INTO `luces` VALUES (1,'2022-09-30 17:19:20','cabecero',26,0,100,NULL,-1),(2,'2022-09-30 17:19:21','armario',26,1,100,NULL,-1),(3,'2022-09-28 18:05:55','escritorio',26,0,100,NULL,-1),(4,'2022-09-30 17:04:36','techo baño',27,0,100,NULL,-1),(5,'2022-09-29 20:09:59','espejo baño',27,0,11,NULL,-1),(6,'2022-10-02 19:37:38','cabecero',28,0,100,NULL,-1),(7,'2022-10-02 19:34:33','armario',28,0,100,NULL,-1),(8,'2022-10-02 13:57:49','escritorio',28,0,100,NULL,-1),(9,'2022-10-02 19:00:08','techo baño',29,0,100,NULL,-1),(10,'2022-10-02 19:00:06','espejo baño',29,0,100,NULL,-1),(11,'2022-10-02 19:35:18','cabecero',30,0,100,NULL,-1),(12,'2022-10-02 19:34:30','armario',30,0,100,NULL,-1),(13,'2022-09-22 14:49:49','escritorio',30,0,100,NULL,-1),(14,'2022-10-02 18:02:01','techo baño',31,0,100,NULL,-1),(15,'2022-09-26 13:19:03','espejo baño',31,0,100,NULL,-1),(16,'2022-10-01 19:50:08','cabecero',32,0,100,NULL,-1),(17,'2022-10-01 20:10:18','armario',32,0,100,NULL,-1),(18,'2022-09-26 07:08:54','escritorio',32,0,100,NULL,-1),(19,'2022-10-01 20:10:21','techo baño',33,0,100,NULL,-1),(20,'2022-10-01 06:14:59','espejo baño',33,0,100,NULL,-1),(21,'2022-09-27 16:35:58','cabecero',11,0,100,NULL,-1),(22,'2022-09-27 16:35:58','armario',11,0,100,NULL,-1),(23,'2022-09-27 16:36:05','escritorio',11,0,100,NULL,-1),(24,'2022-09-30 16:20:33','techo baño',12,0,100,NULL,-1),(25,'2022-09-27 16:34:12','espejo baño',12,0,100,NULL,-1),(26,'2022-09-07 15:31:28','cabecero',34,0,50,NULL,-1),(27,'2022-09-07 15:33:39','armario',34,1,50,NULL,-1),(28,'2022-09-07 15:35:50','escritorio',34,0,50,NULL,-1),(29,'2022-09-07 15:38:01','techo baño',35,0,50,NULL,-1),(30,'2022-09-07 15:40:12','espejo baño',35,0,50,NULL,-1),(31,'2022-09-28 15:15:22','focos techo biblioteca',21,0,100,NULL,-1),(32,'2022-09-28 15:15:23','led techo biblioteca',21,0,100,NULL,-1),(33,'2022-09-30 22:08:02','focos techo distribuidor',47,0,0,NULL,-1),(34,'2022-10-01 19:12:46','led bar',20,0,100,NULL,-1),(35,'2022-10-01 22:24:15','focos techo sala cine',14,0,100,NULL,-1),(36,'2022-10-01 22:24:16','led sala cine',14,0,100,NULL,-1),(37,'2022-10-01 18:21:51','focos techo exterior',18,0,50,NULL,-1),(38,'2022-10-01 18:21:50','led exterior',18,0,50,NULL,-1),(39,'2022-09-21 14:41:43','barra bar',20,0,-1,NULL,-1),(40,'2022-10-03 06:56:34','techo armario',38,0,34,NULL,-1),(41,'2022-09-29 17:34:09','techo cabecero',38,0,60,NULL,-1),(42,'2022-10-03 07:05:15','techo baño',39,0,100,NULL,-1),(43,'2022-10-03 06:55:34','espejo baño',39,1,-1,NULL,-1),(44,'2022-10-03 05:30:09','techo armario',36,1,100,NULL,-1),(45,'2022-09-29 11:48:20','techo cabecero',36,0,100,NULL,-1),(46,'2022-10-03 07:29:18','techo baño',37,1,100,NULL,-1),(47,'2022-09-28 22:30:54','espejo baño',37,0,-1,NULL,-1),(48,'2022-10-03 05:36:41','techo vestibulo',56,1,100,NULL,-1),(49,'2022-09-30 18:41:39','techo cocina/comedor',44,0,100,NULL,-1),(50,'2022-09-15 10:04:15','exterior escaleras servicio',44,1,100,NULL,-1),(51,'2022-10-03 07:02:05','pasillo lavanderia',43,1,100,NULL,-1),(52,'2022-09-15 10:05:09','lavanderia',43,0,100,NULL,-1),(53,'2022-09-30 17:07:25','led perimetro pasillo',13,0,96,NULL,-1),(54,'2022-09-30 17:07:29','focos techo pasillo sala tv',13,0,100,NULL,-1),(55,'2022-10-01 08:55:12','focos techo vestibulo sala tv',48,0,91,NULL,-1),(56,'2022-10-02 18:25:08','focos techo centro comedor',13,0,-1,NULL,-1),(57,'2022-09-28 16:24:49','focos techo laterales comedor',13,0,100,NULL,-1),(58,'2022-10-01 18:20:39','focos techo sala tv',46,0,100,NULL,-1),(59,'2022-10-01 23:03:52','focos terraza sala tv',72,0,0,NULL,-1),(60,'2022-10-01 18:22:11','led terraza sala tv',72,0,0,NULL,-1),(61,'2022-10-03 07:09:31','focos techo baño cortesia',73,1,100,NULL,-1),(62,'2022-10-03 07:09:32','espejo techo baño cortesia',73,1,100,NULL,-1),(63,'2022-09-30 17:37:09','led perimetro exterior',16,1,100,NULL,-1),(64,'2022-09-30 17:37:10','led entrada principal',16,0,100,NULL,-1),(65,'2022-10-01 00:56:26','Focos techo vestibulo',55,0,79,NULL,-1),(66,'2022-09-29 20:42:53','Focos techo cabecero',22,0,50,NULL,-1),(67,'2022-09-29 20:42:59','Focos techo habitacion',22,0,50,NULL,-1),(68,'2022-09-29 20:42:54','Led Habitacion',22,0,50,NULL,-1),(69,'2022-09-30 13:02:01','Focos techo Baño',23,0,100,NULL,-1),(70,'2022-09-30 09:18:02','Focos techo inodoro',23,0,100,NULL,-1),(71,'2022-10-03 00:27:58','Focos techo espejo baño',23,0,100,NULL,-1),(72,'2022-09-24 14:37:12','Focos techo jacuzzi baño',23,0,100,NULL,-1),(73,'2022-09-24 14:37:11','Led jacuzzi baño',23,0,100,NULL,-1),(74,'2022-10-02 21:46:50','Led vestidor',53,0,100,NULL,-1),(75,'2022-09-30 23:45:30','Focos techo habitacion',24,0,100,NULL,-1),(76,'2022-09-29 21:04:09','Focos techo escritorio',24,0,100,NULL,-1),(77,'2022-10-02 20:01:29','Focos techo baño',25,0,100,NULL,-1),(78,'2022-10-02 13:54:06','Led espejo baño',25,0,100,NULL,-1),(79,'2022-10-02 13:59:16','Led vestidor',54,0,100,NULL,-1),(80,'2022-09-27 21:15:05','Focos techo terraza',71,0,100,NULL,-1),(81,'2022-10-02 21:22:31','Led Armarios',54,0,-1,NULL,-1),(82,'2022-10-02 21:26:53','Led Armarios',53,0,-1,NULL,-1),(83,'2022-09-27 21:15:06','Led Terraza',71,0,100,NULL,-1),(84,'2022-10-01 19:56:40','Focos techo cocina',15,0,80,NULL,-1),(85,'2022-10-03 05:37:51','led techo cocina',15,1,100,NULL,-1),(86,'2022-10-01 22:29:34','Led techo cocina',17,0,60,NULL,-1),(87,'2022-10-02 20:27:30','Focos techo armario frigorifico',17,0,80,NULL,-1),(88,'2022-10-02 09:05:22','Focos techo comedor cocina Alejandro',65,0,100,NULL,-1),(89,'2022-10-02 20:16:08','Focos techo vestibulo coc./ent.',49,0,0,NULL,-1),(90,'2022-10-03 05:48:37','Focos techo ropero',51,0,100,NULL,-1),(91,'2022-10-02 20:16:10','Focos techo despensa',50,0,100,NULL,-1),(92,'2022-10-02 20:02:11','Focos techo puertas pasillo habitaciones',19,0,100,NULL,-1),(93,'2022-10-03 05:54:57','Focos techo pasillo habitaciones',19,1,100,NULL,-1),(94,'2022-10-03 05:37:33','Focos escalera servicio ',68,1,9,NULL,-1),(95,'2022-09-19 11:16:35','Focos techo zona juegos',52,0,61,NULL,-1),(96,'2022-09-27 16:33:24','focos techo',67,1,100,NULL,-1),(97,'2022-09-27 16:32:48','alumbrado',70,0,100,NULL,-1),(98,'2022-10-03 07:23:50','Led estudio',9,0,100,NULL,-1),(99,'2022-10-03 07:23:51','Led chimenea',9,0,100,NULL,-1),(100,'2022-10-03 07:23:50','Focos techo estudio',9,0,100,NULL,-1),(101,'2022-10-03 07:23:50','Focos techo chimenea',9,0,100,NULL,-1),(102,'2022-10-03 07:23:51','Focos techo',10,0,100,NULL,-1),(103,'2022-10-03 07:23:51','Focos techo',69,0,100,NULL,-1),(104,'2022-07-15 06:35:58','Focos techo',40,0,100,NULL,-1),(105,'2022-07-15 06:35:58','Led techo',40,0,100,NULL,-1),(106,'2022-07-15 06:36:00','Focos techo Vestibulo',60,0,100,NULL,-1),(107,'2022-07-20 09:41:07','Focos techo Baño 1 ',58,1,100,NULL,-1),(108,'2022-07-20 09:42:09','Led Espejo Baño 1',58,1,100,NULL,-1),(109,'2022-07-15 06:36:00','Focos techo Baño 2',59,0,100,NULL,-1),(110,'2022-07-15 06:36:00','Led perimetro techo ',41,0,100,'255$255$255',0),(111,'2022-07-15 06:36:00','Led hamacas interiores',41,0,100,'255$255$255',0),(112,'2022-08-18 10:42:40','Alumbrado',2,0,-1,NULL,-1),(113,'2022-08-18 10:47:09','Alumbrado',1,0,-1,NULL,-1),(114,'2022-08-18 10:50:56','Alumbrado',3,0,-1,NULL,-1),(115,'2022-08-18 10:57:35','Alumbrado',74,0,-1,NULL,-1),(116,'2022-08-30 09:21:28','Led Espejo Baño 2',59,0,100,NULL,-1),(117,'2022-09-08 15:12:57','Alumbrado',6,0,-1,NULL,-1),(118,'2022-09-08 15:30:27','Led bañador',4,0,100,NULL,-1),(119,'2022-09-08 15:56:04','Led escaleras piscina',4,0,-1,NULL,-1);
/*!40000 ALTER TABLE `luces` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`fincahazard`@`localhost`*/ /*!50003 TRIGGER trigger_luces
   AFTER UPDATE ON luces
   FOR EACH ROW
   BEGIN

   DECLARE done INT DEFAULT 0;
   DECLARE cod_ope INT;
   DECLARE v_cumple INT;

   DECLARE cursor_operacion CURSOR FOR SELECT b.codigo_operacion
   FROM operacion_luces as b
   WHERE b.codigo_luces = NEW.id;

   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

   OPEN cursor_operacion;

   read_loop: LOOP

   FETCH cursor_operacion INTO cod_ope;

   IF done THEN
   LEAVE read_loop;
   END IF;

   IF NEW.estado = 1 THEN
      SELECT count(id)
      INTO v_cumple
      FROM operacion_luces
      WHERE estado = NEW.estado AND intensidad = NEW.intensidad
      AND codigo_operacion = cod_ope;
   ELSE
      SELECT count(id)
      INTO v_cumple
      FROM operacion_luces
      WHERE estado = NEW.estado
      AND codigo_operacion = cod_ope;
   END IF;

   IF (v_cumple = 0) THEN
      UPDATE operacion SET estado = 0 WHERE id = cod_ope;
   ELSE
      UPDATE operacion SET estado = 1 WHERE id = cod_ope;
   END IF;

   END LOOP;

   CLOSE cursor_operacion;
   END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `luces_previo_rutina`
--

DROP TABLE IF EXISTS `luces_previo_rutina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `luces_previo_rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  `intensidad` int(11) DEFAULT -1,
  `rgb` varchar(15) DEFAULT '-1',
  `temperatura` int(11) DEFAULT -1,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `luces_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `luces_previo_rutina`
--

LOCK TABLES `luces_previo_rutina` WRITE;
/*!40000 ALTER TABLE `luces_previo_rutina` DISABLE KEYS */;
/*!40000 ALTER TABLE `luces_previo_rutina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mto_accion_auto`
--

DROP TABLE IF EXISTS `mto_accion_auto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mto_accion_auto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nemo` varchar(100) DEFAULT NULL,
  `cod_fk` int(11) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mto_accion_auto`
--

LOCK TABLES `mto_accion_auto` WRITE;
/*!40000 ALTER TABLE `mto_accion_auto` DISABLE KEYS */;
/*!40000 ALTER TABLE `mto_accion_auto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mto_elemento_trb`
--

DROP TABLE IF EXISTS `mto_elemento_trb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mto_elemento_trb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nemo` varchar(100) DEFAULT NULL,
  `trb` varchar(30) DEFAULT NULL,
  `cod_rb` int(11) DEFAULT NULL,
  `borna` int(11) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `cod_tareaini` int(11) DEFAULT NULL,
  `cod_tareafin` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mto_elemento_trb`
--

LOCK TABLES `mto_elemento_trb` WRITE;
/*!40000 ALTER TABLE `mto_elemento_trb` DISABLE KEYS */;
/*!40000 ALTER TABLE `mto_elemento_trb` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`fincahazard`@`localhost`*/ /*!50003 TRIGGER trigger_eliminar_mto_elemento
   BEFORE DELETE ON mto_elemento_trb
   FOR EACH ROW
   BEGIN

   DECLARE done INT DEFAULT 0;
   DECLARE cod_ope INT;
   DECLARE num_operaciones INT;

   DECLARE cursor_operacion CURSOR FOR SELECT codigo_operacion, COUNT(codigo_operacion)
   FROM mto_relacion_operacion
   WHERE codigo_elemento = OLD.id group by codigo_operacion;
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

   OPEN cursor_operacion;

   read_loop: LOOP

   FETCH cursor_operacion INTO cod_ope, num_operaciones;

   IF done THEN
   LEAVE read_loop;
   END IF;

   IF cod_ope IS NOT NULL THEN
      IF num_operaciones = 1 THEN
         DELETE FROM mto_operacion WHERE id = cod_ope;
         
      ELSEIF num_operaciones > 1 THEN
         DELETE FROM mto_relacion_operacion WHERE codigo_operacion = cod_ope;
      END IF;
   END IF;

   END LOOP;

   CLOSE cursor_operacion;

   END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mto_modo`
--

DROP TABLE IF EXISTS `mto_modo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mto_modo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nemo` varchar(100) DEFAULT NULL,
  `tiempo` int(11) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mto_modo`
--

LOCK TABLES `mto_modo` WRITE;
/*!40000 ALTER TABLE `mto_modo` DISABLE KEYS */;
/*!40000 ALTER TABLE `mto_modo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`fincahazard`@`localhost`*/ /*!50003 TRIGGER trigger_eliminar_mto_modo
   BEFORE DELETE ON mto_modo
   FOR EACH ROW
   BEGIN

   
   
   DECLARE done INT DEFAULT 0;
   DECLARE cod_ope INT;

   DECLARE cursor_operacion CURSOR FOR SELECT codigo_operacion
   FROM mto_relacion_modo
   WHERE codigo_modo = OLD.id;
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

   OPEN cursor_operacion;

   read_loop: LOOP

   FETCH cursor_operacion INTO cod_ope;

   IF done THEN
      LEAVE read_loop;
   END IF;

   IF cod_ope IS NOT NULL THEN
      DELETE FROM mto_operacion WHERE id = cod_ope;
      
   END IF;

   END LOOP;

   CLOSE cursor_operacion;

   END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mto_operacion`
--

DROP TABLE IF EXISTS `mto_operacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mto_operacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nemo` varchar(100) DEFAULT NULL,
  `tiempo` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `codigo_sesion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_sesion` (`codigo_sesion`),
  CONSTRAINT `reloperacion_ibfk_1` FOREIGN KEY (`codigo_sesion`) REFERENCES `mto_sesion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mto_operacion`
--

LOCK TABLES `mto_operacion` WRITE;
/*!40000 ALTER TABLE `mto_operacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `mto_operacion` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`fincahazard`@`localhost`*/ /*!50003 TRIGGER trigger_eliminar_mto_operacion
   BEFORE DELETE ON mto_operacion
   FOR EACH ROW
   BEGIN

   
   
   DECLARE cod_tarea_ini INT;
   DECLARE cod_tarea_fin INT;
   DECLARE num_ope int;
   DECLARE cod_modo int;

   SELECT codigo_tarea
   INTO cod_tarea_ini
   FROM mto_relacion_tareaini
   WHERE codigo_operacion = OLD.id;

   IF cod_tarea_ini IS NOT NULL THEN

      
      

      SELECT codigo_tarea
      INTO cod_tarea_fin
      FROM mto_relacion_tareafin WHERE codigo_operacion = OLD.id;

      DELETE FROM tarea WHERE id = cod_tarea_ini;

      IF cod_tarea_fin IS NOT NULL THEN
         DELETE FROM tarea WHERE id = cod_tarea_fin;
      END IF;
   END IF;


   
   DELETE FROM mto_relacion_tareaini WHERE codigo_operacion = OLD.id;
   DELETE FROM mto_relacion_tareafin WHERE codigo_operacion = OLD.id;


   
   
   SELECT COUNT(codigo_sesion)
   INTO num_ope
   FROM mto_operacion WHERE codigo_sesion = OLD.codigo_sesion;

   IF num_ope = 0 THEN
      DELETE FROM mto_sesion WHERE id = OLD.codigo_sesion;
   END IF;

   
   DELETE FROM mto_relacion_tareaini WHERE codigo_operacion = OLD.id;
   DELETE FROM mto_relacion_tareafin WHERE codigo_operacion = OLD.id;

   
   DELETE FROM mto_relacion_modo WHERE codigo_operacion = OLD.id;

   
   DELETE FROM mto_operacion_historico WHERE codigo_operacion = OLD.id;

   
   DELETE FROM mto_operacion_previsto WHERE codigo_operacion = OLD.id;

   END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mto_operacion_historico`
--

DROP TABLE IF EXISTS `mto_operacion_historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mto_operacion_historico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tiempo` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `nemo` varchar(100) DEFAULT NULL,
  `codigo_sesion_historico` int(11) DEFAULT NULL,
  `codigo_operacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_sesion_historico` (`codigo_sesion_historico`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `histoperacion_ibfk_1` FOREIGN KEY (`codigo_sesion_historico`) REFERENCES `mto_sesion_historico` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `histoperacion_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `mto_operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mto_operacion_historico`
--

LOCK TABLES `mto_operacion_historico` WRITE;
/*!40000 ALTER TABLE `mto_operacion_historico` DISABLE KEYS */;
/*!40000 ALTER TABLE `mto_operacion_historico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mto_operacion_previsto`
--

DROP TABLE IF EXISTS `mto_operacion_previsto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mto_operacion_previsto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_sesion_previsto` int(11) DEFAULT NULL,
  `codigo_operacion` int(11) DEFAULT NULL,
  `tiempo` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `nemo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_sesion_previsto` (`codigo_sesion_previsto`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `opeprev_ibfk_1` FOREIGN KEY (`codigo_sesion_previsto`) REFERENCES `mto_sesion_previsto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `opeprev_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `mto_operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mto_operacion_previsto`
--

LOCK TABLES `mto_operacion_previsto` WRITE;
/*!40000 ALTER TABLE `mto_operacion_previsto` DISABLE KEYS */;
/*!40000 ALTER TABLE `mto_operacion_previsto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mto_ot`
--

DROP TABLE IF EXISTS `mto_ot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mto_ot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dia` datetime DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mto_ot`
--

LOCK TABLES `mto_ot` WRITE;
/*!40000 ALTER TABLE `mto_ot` DISABLE KEYS */;
/*!40000 ALTER TABLE `mto_ot` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`fincahazard`@`localhost`*/ /*!50003 TRIGGER trigger_eliminar_mto_ot
   BEFORE DELETE ON mto_ot
   FOR EACH ROW
   BEGIN

   
   DECLARE done_prog INT DEFAULT 0;
   DECLARE done_sesion_prog INT DEFAULT 0;

   DECLARE done_sesion_ot INT DEFAULT 0;

   DECLARE cod_prog INT;
   DECLARE cod_sesion_ot INT;
   DECLARE cod_sesion_prog INT;

   DECLARE cursor_ot_programa CURSOR FOR SELECT a.codigo_programa
   FROM mto_relacion_ot_programa AS a INNER JOIN mto_programa AS b
   ON a.codigo_programa=b.id WHERE b.excepto = 1 AND a.codigo_ot = OLD.id;
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done_prog = 1;

   OPEN cursor_ot_programa;

   prog_loop: LOOP

   FETCH cursor_ot_programa INTO cod_prog;

      IF done_prog THEN
      LEAVE prog_loop;
      END IF;

      IF cod_prog IS NOT NULL THEN
         BLOCK2: BEGIN
            DECLARE cursor_sesion CURSOR FOR SELECT codigo_sesion
            FROM mto_relacion_programa
            WHERE codigo_programa = cod_prog;
            DECLARE CONTINUE HANDLER FOR NOT FOUND SET done_sesion_prog = 1;

            OPEN cursor_sesion;

            session_loop: LOOP

            FETCH cursor_sesion INTO cod_sesion_prog;

               IF done_sesion_prog THEN
               LEAVE session_loop;
               END IF;

               DELETE FROM mto_sesion where id = cod_sesion_prog;

               
               

            END LOOP session_loop;

            CLOSE cursor_sesion;

            DELETE FROM mto_programa where id = cod_prog AND excepto = 1;

            
         END BLOCK2;
      END IF;

   END LOOP prog_loop;

   CLOSE cursor_ot_programa;

   BLOCK3: BEGIN

      DECLARE cursor_ot_sesion CURSOR FOR SELECT codigo_sesion
      FROM mto_relacion_ot_sesion
      WHERE codigo_ot = OLD.id;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done_sesion_ot = 1;

      OPEN cursor_ot_sesion;

      session_ot_loop: LOOP

      FETCH cursor_ot_sesion INTO cod_sesion_ot;

         IF done_sesion_ot THEN
         LEAVE session_ot_loop;
         END IF;

         IF cod_sesion_ot IS NOT NULL THEN
            DELETE FROM mto_sesion where id = cod_sesion_ot;

            

         END IF;

      END LOOP session_ot_loop;

      CLOSE cursor_ot_sesion;

   END BLOCK3;

   END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mto_programa`
--

DROP TABLE IF EXISTS `mto_programa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mto_programa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(100) DEFAULT NULL,
  `excepto` int(11) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mto_programa`
--

LOCK TABLES `mto_programa` WRITE;
/*!40000 ALTER TABLE `mto_programa` DISABLE KEYS */;
/*!40000 ALTER TABLE `mto_programa` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`fincahazard`@`localhost`*/ /*!50003 TRIGGER trigger_eliminar_mto_programa
   BEFORE DELETE ON mto_programa
   FOR EACH ROW
   BEGIN

   
   DECLARE done INT DEFAULT 0;
   DECLARE cod_sesion INT;

   DECLARE cursor_sesion CURSOR FOR SELECT codigo_sesion
   FROM mto_relacion_programa
   WHERE codigo_programa = OLD.id;
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

   OPEN cursor_sesion;

   read_loop: LOOP

   FETCH cursor_sesion INTO cod_sesion;

   IF done THEN
      LEAVE read_loop;
   END IF;

   IF cod_sesion IS NOT NULL THEN
      DELETE FROM mto_sesion WHERE id = cod_sesion;
      DELETE FROM mto_relacion_programa WHERE codigo_sesion = cod_sesion;
   END IF;

   END LOOP;

   CLOSE cursor_sesion;

   END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mto_relacion_modo`
--

DROP TABLE IF EXISTS `mto_relacion_modo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mto_relacion_modo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_operacion` int(11) DEFAULT NULL,
  `codigo_modo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_operacion` (`codigo_operacion`),
  KEY `codigo_modo` (`codigo_modo`),
  CONSTRAINT `relmodo_ibfk_1` FOREIGN KEY (`codigo_operacion`) REFERENCES `mto_operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relmodo_ibfk_2` FOREIGN KEY (`codigo_modo`) REFERENCES `mto_modo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mto_relacion_modo`
--

LOCK TABLES `mto_relacion_modo` WRITE;
/*!40000 ALTER TABLE `mto_relacion_modo` DISABLE KEYS */;
/*!40000 ALTER TABLE `mto_relacion_modo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mto_relacion_operacion`
--

DROP TABLE IF EXISTS `mto_relacion_operacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mto_relacion_operacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_operacion` int(11) DEFAULT NULL,
  `codigo_elemento` int(11) DEFAULT NULL,
  `codigo_accion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_operacion` (`codigo_operacion`),
  KEY `codigo_elemento` (`codigo_elemento`),
  KEY `codigo_accion` (`codigo_accion`),
  CONSTRAINT `relope_ibfk_1` FOREIGN KEY (`codigo_operacion`) REFERENCES `mto_operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relope_ibfk_2` FOREIGN KEY (`codigo_elemento`) REFERENCES `mto_elemento_trb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relope_ibfk_3` FOREIGN KEY (`codigo_accion`) REFERENCES `mto_accion_auto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mto_relacion_operacion`
--

LOCK TABLES `mto_relacion_operacion` WRITE;
/*!40000 ALTER TABLE `mto_relacion_operacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `mto_relacion_operacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mto_relacion_ot_programa`
--

DROP TABLE IF EXISTS `mto_relacion_ot_programa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mto_relacion_ot_programa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_ot` int(11) DEFAULT NULL,
  `codigo_programa` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_ot` (`codigo_ot`),
  KEY `codigo_programa` (`codigo_programa`),
  CONSTRAINT `relotproc_ibfk_1` FOREIGN KEY (`codigo_ot`) REFERENCES `mto_ot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relotproc_ibfk_2` FOREIGN KEY (`codigo_programa`) REFERENCES `mto_programa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mto_relacion_ot_programa`
--

LOCK TABLES `mto_relacion_ot_programa` WRITE;
/*!40000 ALTER TABLE `mto_relacion_ot_programa` DISABLE KEYS */;
/*!40000 ALTER TABLE `mto_relacion_ot_programa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mto_relacion_ot_sesion`
--

DROP TABLE IF EXISTS `mto_relacion_ot_sesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mto_relacion_ot_sesion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_ot` int(11) DEFAULT NULL,
  `codigo_sesion` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_ot` (`codigo_ot`),
  KEY `codigo_sesion` (`codigo_sesion`),
  CONSTRAINT `relotsesion_ibfk_1` FOREIGN KEY (`codigo_ot`) REFERENCES `mto_ot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relotsesion_ibfk_2` FOREIGN KEY (`codigo_sesion`) REFERENCES `mto_sesion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mto_relacion_ot_sesion`
--

LOCK TABLES `mto_relacion_ot_sesion` WRITE;
/*!40000 ALTER TABLE `mto_relacion_ot_sesion` DISABLE KEYS */;
/*!40000 ALTER TABLE `mto_relacion_ot_sesion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mto_relacion_programa`
--

DROP TABLE IF EXISTS `mto_relacion_programa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mto_relacion_programa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_sesion` int(11) DEFAULT NULL,
  `codigo_programa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_sesion` (`codigo_sesion`),
  KEY `codigo_programa` (`codigo_programa`),
  CONSTRAINT `relproc_ibfk_1` FOREIGN KEY (`codigo_sesion`) REFERENCES `mto_sesion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relproc_ibfk_2` FOREIGN KEY (`codigo_programa`) REFERENCES `mto_programa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mto_relacion_programa`
--

LOCK TABLES `mto_relacion_programa` WRITE;
/*!40000 ALTER TABLE `mto_relacion_programa` DISABLE KEYS */;
/*!40000 ALTER TABLE `mto_relacion_programa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mto_relacion_tareafin`
--

DROP TABLE IF EXISTS `mto_relacion_tareafin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mto_relacion_tareafin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_operacion` int(11) DEFAULT NULL,
  `codigo_mtotareafin` int(11) DEFAULT NULL,
  `codigo_tarea` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_operacion` (`codigo_operacion`),
  KEY `codigo_mtotareafin` (`codigo_mtotareafin`),
  KEY `codigo_tarea` (`codigo_tarea`),
  CONSTRAINT `reltareafin_ibfk_1` FOREIGN KEY (`codigo_operacion`) REFERENCES `mto_operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reltareafin_ibfk_2` FOREIGN KEY (`codigo_mtotareafin`) REFERENCES `mto_tarea` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mto_relacion_tareafin`
--

LOCK TABLES `mto_relacion_tareafin` WRITE;
/*!40000 ALTER TABLE `mto_relacion_tareafin` DISABLE KEYS */;
/*!40000 ALTER TABLE `mto_relacion_tareafin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mto_relacion_tareaini`
--

DROP TABLE IF EXISTS `mto_relacion_tareaini`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mto_relacion_tareaini` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_operacion` int(11) DEFAULT NULL,
  `codigo_mtotareaini` int(11) DEFAULT NULL,
  `codigo_tarea` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_operacion` (`codigo_operacion`),
  KEY `codigo_mtotareaini` (`codigo_mtotareaini`),
  KEY `codigo_tarea` (`codigo_tarea`),
  CONSTRAINT `reltareaini_ibfk_1` FOREIGN KEY (`codigo_operacion`) REFERENCES `mto_operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reltareaini_ibfk_2` FOREIGN KEY (`codigo_mtotareaini`) REFERENCES `mto_tarea` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mto_relacion_tareaini`
--

LOCK TABLES `mto_relacion_tareaini` WRITE;
/*!40000 ALTER TABLE `mto_relacion_tareaini` DISABLE KEYS */;
/*!40000 ALTER TABLE `mto_relacion_tareaini` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mto_sesion`
--

DROP TABLE IF EXISTS `mto_sesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mto_sesion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(100) DEFAULT NULL,
  `tiempo` int(11) DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `modo` int(11) DEFAULT NULL,
  `hora_pausa` time DEFAULT NULL,
  `tiempo_pausa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mto_sesion`
--

LOCK TABLES `mto_sesion` WRITE;
/*!40000 ALTER TABLE `mto_sesion` DISABLE KEYS */;
/*!40000 ALTER TABLE `mto_sesion` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`fincahazard`@`localhost`*/ /*!50003 TRIGGER trigger_eliminar_mto_sesion
   BEFORE DELETE ON mto_sesion
   FOR EACH ROW
   BEGIN

   
   DECLARE done INT DEFAULT 0;
   DECLARE cod_operacion INT;

   DECLARE cursor_operacion CURSOR FOR SELECT id
   FROM mto_operacion
   WHERE codigo_sesion = OLD.id;
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

   OPEN cursor_operacion;

   read_loop: LOOP

   FETCH cursor_operacion INTO cod_operacion;

   IF done THEN
      LEAVE read_loop;
   END IF;

   IF cod_operacion IS NOT NULL THEN
      DELETE FROM mto_operacion WHERE id = cod_operacion;
   END IF;

   END LOOP read_loop;

   CLOSE cursor_operacion;

   END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mto_sesion_historico`
--

DROP TABLE IF EXISTS `mto_sesion_historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mto_sesion_historico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_sesion` int(11) DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL,
  `accion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_sesion` (`codigo_sesion`),
  CONSTRAINT `histsesion_ibfk_1` FOREIGN KEY (`codigo_sesion`) REFERENCES `mto_sesion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mto_sesion_historico`
--

LOCK TABLES `mto_sesion_historico` WRITE;
/*!40000 ALTER TABLE `mto_sesion_historico` DISABLE KEYS */;
/*!40000 ALTER TABLE `mto_sesion_historico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mto_sesion_previsto`
--

DROP TABLE IF EXISTS `mto_sesion_previsto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mto_sesion_previsto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_sesion` int(11) DEFAULT NULL,
  `tiempo` int(11) DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_sesion` (`codigo_sesion`),
  CONSTRAINT `sesionprev_ibfk_1` FOREIGN KEY (`codigo_sesion`) REFERENCES `mto_sesion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mto_sesion_previsto`
--

LOCK TABLES `mto_sesion_previsto` WRITE;
/*!40000 ALTER TABLE `mto_sesion_previsto` DISABLE KEYS */;
/*!40000 ALTER TABLE `mto_sesion_previsto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mto_tarea`
--

DROP TABLE IF EXISTS `mto_tarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mto_tarea` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mto_tarea`
--

LOCK TABLES `mto_tarea` WRITE;
/*!40000 ALTER TABLE `mto_tarea` DISABLE KEYS */;
/*!40000 ALTER TABLE `mto_tarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mto_tarea_rpc`
--

DROP TABLE IF EXISTS `mto_tarea_rpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mto_tarea_rpc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `argumentos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `codigo_mtotarea` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_mtotarea` (`codigo_mtotarea`),
  CONSTRAINT `mto_tarea_rpc_ibfk_1` FOREIGN KEY (`codigo_mtotarea`) REFERENCES `mto_tarea` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mto_tarea_rpc`
--

LOCK TABLES `mto_tarea_rpc` WRITE;
/*!40000 ALTER TABLE `mto_tarea_rpc` DISABLE KEYS */;
/*!40000 ALTER TABLE `mto_tarea_rpc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multimedia`
--

DROP TABLE IF EXISTS `multimedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multimedia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  `tipo` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `multimedia_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multimedia`
--

LOCK TABLES `multimedia` WRITE;
/*!40000 ALTER TABLE `multimedia` DISABLE KEYS */;
INSERT INTO `multimedia` VALUES (1,'2022-09-22 08:52:54','tv techo',22,2,2),(2,'2022-09-05 18:11:57','proyector cine',14,NULL,2);
/*!40000 ALTER TABLE `multimedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multimedia_previo_rutina`
--

DROP TABLE IF EXISTS `multimedia_previo_rutina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multimedia_previo_rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  `tipo` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `multimedia_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multimedia_previo_rutina`
--

LOCK TABLES `multimedia_previo_rutina` WRITE;
/*!40000 ALTER TABLE `multimedia_previo_rutina` DISABLE KEYS */;
/*!40000 ALTER TABLE `multimedia_previo_rutina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificaciones`
--

DROP TABLE IF EXISTS `notificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notificaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `tipotcaso` int(11) NOT NULL,
  `codigo` int(11) NOT NULL,
  `estado` varchar(10) DEFAULT NULL,
  `emisor` int(11) NOT NULL,
  `receptor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emisor` (`emisor`),
  KEY `receptor` (`receptor`),
  CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`emisor`) REFERENCES `sistema_pruebas`.`usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notificaciones_ibfk_2` FOREIGN KEY (`receptor`) REFERENCES `sistema_pruebas`.`rc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciones`
--

LOCK TABLES `notificaciones` WRITE;
/*!40000 ALTER TABLE `notificaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operacion`
--

DROP TABLE IF EXISTS `operacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipodomo` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=348 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operacion`
--

LOCK TABLES `operacion` WRITE;
/*!40000 ALTER TABLE `operacion` DISABLE KEYS */;
INSERT INTO `operacion` VALUES (1,1,1),(2,1,0),(3,1,1),(4,1,1),(5,1,1),(6,1,1),(7,1,1),(8,1,1),(9,1,1),(10,1,1),(11,1,1),(12,1,1),(13,1,1),(14,1,1),(15,1,1),(16,1,1),(17,1,1),(18,1,1),(19,1,1),(20,1,1),(21,1,1),(22,1,1),(23,1,1),(24,1,1),(25,1,1),(26,1,1),(27,1,0),(28,1,1),(29,1,1),(30,1,1),(31,1,0),(32,1,1),(33,1,0),(34,1,0),(35,1,0),(36,1,0),(37,1,0),(38,1,0),(39,1,0),(40,1,0),(41,1,0),(42,1,0),(43,1,0),(44,1,0),(45,1,0),(46,1,0),(47,1,0),(48,1,0),(49,1,0),(50,1,0),(51,1,0),(52,1,0),(53,1,0),(54,1,0),(55,1,0),(56,1,0),(57,1,0),(58,1,0),(59,1,0),(60,1,0),(61,1,1),(62,1,1),(63,1,1),(64,1,0),(65,1,0),(66,1,1),(67,1,0),(68,1,1),(69,1,0),(70,1,1),(71,1,0),(72,1,0),(73,1,1),(74,1,1),(75,1,1),(76,1,1),(77,1,1),(78,1,1),(79,1,1),(80,1,1),(81,1,1),(82,1,0),(83,1,0),(84,1,0),(85,1,1),(86,1,0),(87,1,0),(88,1,0),(89,1,1),(90,1,1),(91,1,0),(92,1,1),(93,1,0),(94,1,1),(95,1,0),(96,1,1),(97,1,1),(98,1,0),(99,1,0),(100,1,0),(101,1,0),(102,1,0),(103,1,0),(104,1,0),(105,1,0),(106,1,0),(107,1,1),(108,1,1),(109,1,1),(110,1,0),(111,1,1),(112,1,1),(113,1,1),(114,1,1),(115,1,1),(116,1,1),(117,1,1),(118,1,1),(119,1,1),(120,1,1),(121,1,1),(122,1,1),(123,1,1),(124,1,1),(125,1,1),(126,1,1),(127,1,1),(128,1,1),(129,1,1),(130,1,1),(131,1,0),(132,1,0),(133,1,0),(134,1,0),(135,1,0),(136,1,0),(137,1,0),(138,1,0),(139,1,0),(140,1,0),(141,1,0),(142,1,0),(143,1,0),(144,1,0),(145,1,0),(146,1,0),(147,1,0),(148,1,0),(149,1,1),(150,1,0),(151,1,1),(152,1,1),(153,1,1),(154,1,1),(155,1,1),(156,1,1),(157,1,1),(158,1,0),(159,1,0),(160,1,1),(161,1,0),(162,1,1),(163,1,0),(164,1,0),(165,1,0),(166,1,0),(167,1,0),(168,1,0),(169,1,0),(170,1,1),(171,1,0),(172,1,0),(173,1,1),(174,1,1),(175,1,1),(176,1,1),(177,1,1),(178,1,1),(179,1,1),(180,1,0),(181,1,0),(182,1,0),(183,1,0),(184,1,0),(185,1,0),(186,1,0),(187,1,1),(188,1,1),(189,1,0),(190,1,0),(191,1,0),(192,1,0),(193,1,0),(194,1,0),(195,1,0),(196,1,0),(197,1,0),(198,1,0),(199,1,0),(200,1,0),(201,1,0),(202,1,0),(203,1,0),(204,1,0),(205,1,0),(206,1,0),(207,1,0),(208,1,0),(209,1,0),(210,1,0),(211,1,0),(212,1,0),(213,1,0),(214,1,0),(215,1,0),(216,1,0),(217,1,1),(218,1,0),(219,1,0),(220,1,0),(221,1,0),(222,1,0),(223,1,0),(224,1,0),(225,1,0),(226,1,0),(227,1,0),(228,1,0),(229,1,0),(230,1,0),(231,1,0),(232,1,0),(233,1,0),(234,1,0),(235,1,0),(236,1,0),(237,1,0),(238,1,0),(239,1,0),(240,1,0),(241,1,0),(242,1,0),(243,1,0),(244,1,0),(245,1,0),(246,1,0),(247,1,0),(248,1,0),(249,1,0),(250,1,0),(251,1,0),(252,1,0),(253,1,0),(254,1,0),(255,1,0),(256,1,0),(257,1,0),(258,1,0),(259,1,0),(260,1,0),(261,1,0),(262,1,0),(263,1,0),(264,1,0),(265,1,0),(266,1,0),(267,1,0),(268,1,0),(269,1,0),(270,1,0),(271,1,0),(272,1,0),(273,1,0),(274,1,0),(275,3,0),(276,3,0),(277,3,0),(278,3,0),(279,3,1),(280,3,0),(281,3,0),(282,3,0),(283,3,1),(284,3,0),(285,3,0),(286,3,0),(287,3,0),(288,3,0),(289,1,1),(290,1,1),(291,1,1),(292,1,1),(293,1,0),(294,1,0),(295,1,0),(296,1,0),(297,1,0),(298,1,0),(299,1,0),(300,1,0),(301,1,1),(302,1,1),(303,1,0),(304,1,0),(305,1,0),(306,1,0),(307,1,1),(308,1,1),(309,1,1),(310,1,1),(311,1,0),(312,1,0),(313,1,0),(314,1,0),(315,1,1),(316,1,1),(317,1,0),(318,1,0),(319,1,0),(320,1,0),(321,1,0),(322,1,0),(323,1,1),(324,1,1),(325,1,0),(326,1,0),(327,1,0),(328,1,0),(329,1,0),(330,1,0),(331,1,0),(332,1,0),(333,1,0),(334,1,0),(335,1,0),(336,1,0),(337,1,0),(338,1,0),(339,1,0),(340,1,0),(341,1,0),(342,1,0),(343,1,0),(344,1,0),(345,1,0),(346,1,0),(347,1,0);
/*!40000 ALTER TABLE `operacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operacion_clima`
--

DROP TABLE IF EXISTS `operacion_clima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operacion_clima` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_clima` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `consigna` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_clima` (`codigo_clima`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `ope_clima_ibfk_1` FOREIGN KEY (`codigo_clima`) REFERENCES `clima` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ope_clima_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operacion_clima`
--

LOCK TABLES `operacion_clima` WRITE;
/*!40000 ALTER TABLE `operacion_clima` DISABLE KEYS */;
/*!40000 ALTER TABLE `operacion_clima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operacion_estores`
--

DROP TABLE IF EXISTS `operacion_estores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operacion_estores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_estor` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `consigna` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_estor` (`codigo_estor`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `ope_estores_ibfk_1` FOREIGN KEY (`codigo_estor`) REFERENCES `estor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ope_estores_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operacion_estores`
--

LOCK TABLES `operacion_estores` WRITE;
/*!40000 ALTER TABLE `operacion_estores` DISABLE KEYS */;
INSERT INTO `operacion_estores` VALUES (1,6,275,100,NULL),(2,7,276,100,NULL),(3,8,277,100,NULL),(4,9,278,100,NULL),(5,10,279,100,NULL),(6,6,280,0,NULL),(7,7,281,0,NULL),(8,8,282,0,NULL),(9,9,283,0,NULL),(10,10,284,0,NULL),(11,12,285,100,NULL),(12,13,286,100,NULL),(13,12,287,0,NULL),(14,13,288,0,NULL);
/*!40000 ALTER TABLE `operacion_estores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operacion_iot`
--

DROP TABLE IF EXISTS `operacion_iot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operacion_iot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_iot` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_iot` (`codigo_iot`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `ope_iot_ibfk_1` FOREIGN KEY (`codigo_iot`) REFERENCES `iot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ope_iot_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operacion_iot`
--

LOCK TABLES `operacion_iot` WRITE;
/*!40000 ALTER TABLE `operacion_iot` DISABLE KEYS */;
/*!40000 ALTER TABLE `operacion_iot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operacion_luces`
--

DROP TABLE IF EXISTS `operacion_luces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operacion_luces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_luces` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `intensidad` int(11) DEFAULT -1,
  `rgb` varchar(15) DEFAULT '-1',
  `temperatura` int(11) DEFAULT -1,
  PRIMARY KEY (`id`),
  KEY `codigo_luces` (`codigo_luces`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `ope_luces_ibfk_1` FOREIGN KEY (`codigo_luces`) REFERENCES `luces` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ope_luces_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=334 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operacion_luces`
--

LOCK TABLES `operacion_luces` WRITE;
/*!40000 ALTER TABLE `operacion_luces` DISABLE KEYS */;
INSERT INTO `operacion_luces` VALUES (1,1,1,0,100,NULL,-1),(2,2,2,0,100,NULL,-1),(3,3,3,0,100,NULL,-1),(4,4,4,0,100,NULL,-1),(5,5,5,0,100,NULL,-1),(6,6,6,0,100,NULL,-1),(7,7,7,0,100,NULL,-1),(8,8,8,0,100,NULL,-1),(9,9,9,0,100,NULL,-1),(10,10,10,0,100,NULL,-1),(11,11,11,0,100,NULL,-1),(12,12,12,0,100,NULL,-1),(13,13,13,0,100,NULL,-1),(14,14,14,0,100,NULL,-1),(15,15,15,0,100,NULL,-1),(16,16,16,0,100,NULL,-1),(17,17,17,0,100,NULL,-1),(18,18,18,0,100,NULL,-1),(19,19,19,0,100,NULL,-1),(20,20,20,0,100,NULL,-1),(21,21,21,0,100,NULL,-1),(22,22,22,0,100,NULL,-1),(23,23,23,0,100,NULL,-1),(24,24,24,0,100,NULL,-1),(25,25,25,0,100,NULL,-1),(26,26,26,0,100,NULL,-1),(27,27,27,0,100,NULL,-1),(28,28,28,0,100,NULL,-1),(29,29,29,0,100,NULL,-1),(30,30,30,0,100,NULL,-1),(31,1,31,1,100,NULL,-1),(32,2,32,1,100,NULL,-1),(33,3,33,1,100,NULL,-1),(34,4,34,1,100,NULL,-1),(35,5,35,1,100,NULL,-1),(36,6,36,1,100,NULL,-1),(37,7,37,1,100,NULL,-1),(38,8,38,1,100,NULL,-1),(39,9,39,1,100,NULL,-1),(40,10,40,1,100,NULL,-1),(41,11,41,1,100,NULL,-1),(42,12,42,1,100,NULL,-1),(43,13,43,1,100,NULL,-1),(44,14,44,1,100,NULL,-1),(45,15,45,1,100,NULL,-1),(46,16,46,1,100,NULL,-1),(47,17,47,1,100,NULL,-1),(48,18,48,1,100,NULL,-1),(49,19,49,1,100,NULL,-1),(50,20,50,1,100,NULL,-1),(51,21,51,1,100,NULL,-1),(52,22,52,1,100,NULL,-1),(53,23,53,1,100,NULL,-1),(54,24,54,1,100,NULL,-1),(55,25,55,1,100,NULL,-1),(56,26,56,1,100,NULL,-1),(57,27,57,1,100,NULL,-1),(58,28,58,1,100,NULL,-1),(59,29,59,1,100,NULL,-1),(60,30,60,1,100,NULL,-1),(61,40,61,0,100,NULL,-1),(62,41,62,0,100,NULL,-1),(63,42,63,0,100,NULL,-1),(64,43,64,0,-1,NULL,-1),(65,44,65,0,100,NULL,-1),(66,45,66,0,100,NULL,-1),(67,46,67,0,100,NULL,-1),(68,47,68,0,-1,NULL,-1),(69,48,69,0,100,NULL,-1),(70,49,70,0,100,NULL,-1),(71,50,71,0,100,NULL,-1),(72,51,72,0,100,NULL,-1),(73,52,73,0,100,NULL,-1),(74,53,74,0,100,NULL,-1),(75,54,75,0,100,NULL,-1),(76,55,76,0,100,NULL,-1),(77,56,77,0,100,NULL,-1),(78,57,78,0,100,NULL,-1),(79,58,79,0,100,NULL,-1),(80,59,80,0,100,NULL,-1),(81,60,81,0,100,NULL,-1),(82,61,82,0,100,NULL,-1),(83,62,83,0,100,NULL,-1),(84,63,84,0,100,NULL,-1),(85,64,85,0,100,NULL,-1),(86,40,86,1,100,NULL,-1),(87,41,87,1,100,NULL,-1),(88,42,88,1,100,NULL,-1),(89,43,89,1,-1,NULL,-1),(90,44,90,1,100,NULL,-1),(91,45,91,1,100,NULL,-1),(92,46,92,1,100,NULL,-1),(93,47,93,1,-1,NULL,-1),(94,48,94,1,100,NULL,-1),(95,49,95,1,100,NULL,-1),(96,50,96,1,100,NULL,-1),(97,51,97,1,100,NULL,-1),(98,52,98,1,100,NULL,-1),(99,53,99,1,100,NULL,-1),(100,54,100,1,100,NULL,-1),(101,55,101,1,100,NULL,-1),(102,56,102,1,-1,NULL,-1),(103,57,103,1,100,NULL,-1),(104,58,104,1,100,NULL,-1),(105,59,105,1,100,NULL,-1),(106,60,106,1,100,NULL,-1),(107,61,107,1,100,NULL,-1),(108,62,108,1,100,NULL,-1),(109,63,109,1,100,NULL,-1),(110,64,110,1,100,NULL,-1),(111,65,111,0,100,NULL,-1),(112,66,112,0,100,NULL,-1),(113,67,113,0,100,NULL,-1),(114,68,114,0,100,NULL,-1),(115,69,115,0,100,NULL,-1),(116,70,116,0,100,NULL,-1),(117,71,117,0,100,NULL,-1),(118,72,118,0,100,NULL,-1),(119,73,119,0,100,NULL,-1),(120,74,120,0,100,NULL,-1),(121,82,121,0,-1,NULL,-1),(122,75,122,0,100,NULL,-1),(123,76,123,0,100,NULL,-1),(124,77,124,0,100,NULL,-1),(125,78,125,0,100,NULL,-1),(126,79,126,0,100,NULL,-1),(127,81,127,0,-1,NULL,-1),(128,80,128,0,100,NULL,-1),(129,83,129,0,100,NULL,-1),(130,65,130,0,100,NULL,-1),(131,66,131,1,100,NULL,-1),(132,67,132,1,100,NULL,-1),(133,68,133,1,100,NULL,-1),(134,69,134,1,100,NULL,-1),(135,70,135,1,100,NULL,-1),(136,71,136,1,100,NULL,-1),(137,72,137,1,100,NULL,-1),(138,73,138,1,100,NULL,-1),(139,74,139,1,100,NULL,-1),(140,82,140,1,-1,NULL,-1),(141,75,141,1,100,NULL,-1),(142,76,142,1,100,NULL,-1),(143,77,143,1,100,NULL,-1),(144,78,144,1,100,NULL,-1),(145,79,145,1,100,NULL,-1),(146,81,146,1,-1,NULL,-1),(147,80,147,1,100,NULL,-1),(148,83,148,1,100,NULL,-1),(149,84,149,0,100,NULL,-1),(150,85,150,0,100,NULL,-1),(151,86,151,0,100,NULL,-1),(152,87,152,0,100,NULL,-1),(153,88,153,0,100,NULL,-1),(154,89,154,0,100,NULL,-1),(155,90,155,0,100,NULL,-1),(156,91,156,0,100,NULL,-1),(157,92,157,0,100,NULL,-1),(158,93,158,0,100,NULL,-1),(159,94,159,0,100,NULL,-1),(160,95,160,0,100,NULL,-1),(161,84,161,1,100,NULL,-1),(162,85,162,1,100,NULL,-1),(163,86,163,1,100,NULL,-1),(164,87,164,1,100,NULL,-1),(165,88,165,1,100,NULL,-1),(166,89,166,1,100,NULL,-1),(167,90,167,1,100,NULL,-1),(168,91,168,1,100,NULL,-1),(169,92,169,1,100,NULL,-1),(170,93,170,1,100,NULL,-1),(171,94,171,1,100,NULL,-1),(172,95,172,1,100,NULL,-1),(173,31,173,0,100,NULL,-1),(174,32,174,0,100,NULL,-1),(175,33,175,0,100,NULL,-1),(176,34,176,0,100,NULL,-1),(177,39,177,0,-1,NULL,-1),(178,35,178,0,100,NULL,-1),(179,36,179,0,100,NULL,-1),(180,31,180,1,100,NULL,-1),(181,32,181,1,100,NULL,-1),(182,33,182,1,100,NULL,-1),(183,34,183,1,100,NULL,-1),(184,39,184,1,-1,NULL,-1),(185,35,185,1,100,NULL,-1),(186,36,186,1,100,NULL,-1),(187,37,187,0,100,NULL,-1),(188,38,188,0,100,NULL,-1),(189,37,189,1,100,NULL,-1),(190,38,190,1,100,NULL,-1),(191,1,191,1,50,NULL,-1),(192,2,192,1,50,NULL,-1),(193,3,193,1,50,NULL,-1),(194,4,194,1,50,NULL,-1),(195,5,195,1,50,NULL,-1),(196,6,196,1,50,NULL,-1),(197,7,197,1,50,NULL,-1),(198,8,198,1,50,NULL,-1),(199,9,199,1,50,NULL,-1),(200,10,200,1,50,NULL,-1),(201,11,201,1,50,NULL,-1),(202,12,202,1,50,NULL,-1),(203,13,203,1,50,NULL,-1),(204,14,204,1,50,NULL,-1),(205,15,205,1,50,NULL,-1),(206,16,206,1,50,NULL,-1),(207,17,207,1,50,NULL,-1),(208,18,208,1,50,NULL,-1),(209,19,209,1,50,NULL,-1),(210,20,210,1,50,NULL,-1),(211,21,211,1,50,NULL,-1),(212,22,212,1,50,NULL,-1),(213,23,213,1,50,NULL,-1),(214,24,214,1,50,NULL,-1),(215,25,215,1,50,NULL,-1),(216,26,216,1,50,NULL,-1),(217,27,217,1,50,NULL,-1),(218,28,218,1,50,NULL,-1),(219,29,219,1,50,NULL,-1),(220,30,220,1,50,NULL,-1),(221,31,221,1,50,NULL,-1),(222,32,222,1,50,NULL,-1),(223,34,223,1,50,NULL,-1),(224,39,224,1,-1,NULL,-1),(225,35,225,1,50,NULL,-1),(226,36,226,1,50,NULL,-1),(227,37,227,1,50,NULL,-1),(228,38,228,1,50,NULL,-1),(229,40,229,1,50,NULL,-1),(230,41,230,1,50,NULL,-1),(231,42,231,1,50,NULL,-1),(232,43,232,1,50,NULL,-1),(233,44,233,1,50,NULL,-1),(234,45,234,1,50,NULL,-1),(235,46,235,1,50,NULL,-1),(236,47,236,1,50,NULL,-1),(237,49,237,1,50,NULL,-1),(238,50,238,1,50,NULL,-1),(239,51,239,1,50,NULL,-1),(240,52,240,1,50,NULL,-1),(241,53,241,1,50,NULL,-1),(242,54,242,1,50,NULL,-1),(243,92,243,1,50,NULL,-1),(244,93,244,1,50,NULL,-1),(245,56,245,1,-1,NULL,-1),(246,57,246,1,50,NULL,-1),(247,59,247,1,50,NULL,-1),(248,60,248,1,50,NULL,-1),(249,61,249,1,50,NULL,-1),(250,62,250,1,50,NULL,-1),(251,63,251,1,50,NULL,-1),(252,64,252,1,50,NULL,-1),(253,66,253,1,50,NULL,-1),(254,67,254,1,50,NULL,-1),(255,68,255,1,50,NULL,-1),(256,69,256,1,50,NULL,-1),(257,70,257,1,50,NULL,-1),(258,71,258,1,50,NULL,-1),(259,72,259,1,50,NULL,-1),(260,73,260,1,50,NULL,-1),(261,74,261,1,50,NULL,-1),(262,82,262,1,-1,NULL,-1),(263,75,263,1,50,NULL,-1),(264,76,264,1,50,NULL,-1),(265,77,265,1,50,NULL,-1),(266,78,266,1,50,NULL,-1),(267,79,267,1,50,NULL,-1),(268,81,268,1,-1,NULL,-1),(269,80,269,1,50,NULL,-1),(270,83,270,1,50,NULL,-1),(271,84,271,1,50,NULL,-1),(272,85,272,1,50,NULL,-1),(273,86,273,1,50,NULL,-1),(274,87,274,1,50,NULL,-1),(275,98,289,0,100,NULL,-1),(276,99,290,0,100,NULL,-1),(277,100,291,0,100,NULL,-1),(278,101,292,0,100,NULL,-1),(279,98,293,1,100,NULL,-1),(280,99,294,1,100,NULL,-1),(281,100,295,1,100,NULL,-1),(282,101,296,1,100,NULL,-1),(283,98,297,1,50,NULL,-1),(284,99,298,1,50,NULL,-1),(285,100,299,1,50,NULL,-1),(286,101,300,1,50,NULL,-1),(287,104,301,0,100,NULL,-1),(288,105,302,0,100,NULL,-1),(289,104,303,1,100,NULL,-1),(290,105,304,1,100,NULL,-1),(291,107,305,0,100,NULL,-1),(292,108,306,0,100,NULL,-1),(293,107,307,1,100,NULL,-1),(294,108,308,1,100,NULL,-1),(295,110,309,0,100,NULL,-1),(296,111,310,0,100,NULL,-1),(297,110,311,1,100,'255$255$255',0),(298,111,312,1,100,'255$255$255',0),(299,107,313,1,50,NULL,-1),(300,108,314,1,50,NULL,-1),(301,109,315,0,100,NULL,-1),(302,116,316,0,100,NULL,-1),(303,109,317,1,100,NULL,-1),(304,116,318,1,100,NULL,-1),(305,109,319,1,50,NULL,-1),(306,116,320,1,50,NULL,-1),(307,104,321,1,50,NULL,-1),(308,105,322,1,50,NULL,-1),(309,118,323,0,100,NULL,-1),(310,119,324,0,-1,NULL,-1),(311,118,325,1,100,NULL,-1),(312,119,326,1,-1,NULL,-1),(313,118,327,1,50,NULL,-1),(314,119,328,1,-1,NULL,-1),(315,110,329,1,50,'255$255$255',0),(316,111,330,1,50,'255$255$255',0),(317,49,331,1,12,NULL,-1),(318,50,332,1,10,NULL,-1),(319,53,333,1,20,NULL,-1),(320,54,334,1,20,NULL,-1),(321,56,335,1,-1,NULL,-1),(322,57,336,1,20,NULL,-1),(323,66,337,1,25,NULL,-1),(324,67,338,1,25,NULL,-1),(325,68,339,1,25,NULL,-1),(326,84,340,1,60,NULL,-1),(327,85,341,1,80,NULL,-1),(328,86,342,1,60,NULL,-1),(329,87,343,1,80,NULL,-1),(330,63,344,1,70,NULL,-1),(331,64,345,1,49,NULL,-1),(332,61,346,1,49,NULL,-1),(333,62,347,1,24,NULL,-1);
/*!40000 ALTER TABLE `operacion_luces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operacion_persianas`
--

DROP TABLE IF EXISTS `operacion_persianas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operacion_persianas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_persianas` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `consigna` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_persianas` (`codigo_persianas`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `ope_persianas_ibfk_1` FOREIGN KEY (`codigo_persianas`) REFERENCES `persianas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ope_persianas_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operacion_persianas`
--

LOCK TABLES `operacion_persianas` WRITE;
/*!40000 ALTER TABLE `operacion_persianas` DISABLE KEYS */;
/*!40000 ALTER TABLE `operacion_persianas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ot`
--

DROP TABLE IF EXISTS `ot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ot`
--

LOCK TABLES `ot` WRITE;
/*!40000 ALTER TABLE `ot` DISABLE KEYS */;
/*!40000 ALTER TABLE `ot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persianas`
--

DROP TABLE IF EXISTS `persianas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persianas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT NULL,
  `consigna` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `persianas_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persianas`
--

LOCK TABLES `persianas` WRITE;
/*!40000 ALTER TABLE `persianas` DISABLE KEYS */;
INSERT INTO `persianas` VALUES (1,'2022-09-22 11:51:56','Ducha',23,2,0),(2,'2022-09-22 12:05:50','Inodoro',23,3,1),(3,'2022-09-22 11:57:59','Persiana Derecha',22,3,1),(4,'2022-09-22 11:58:03','Persiana Izquierda',22,3,1),(5,'2022-09-22 11:58:07','Persiana Lateral',22,3,1),(6,'2022-09-22 11:58:19','Vestibulo baño',22,3,1),(7,'2022-06-28 16:43:59','Persiana Izquierda',24,1,1),(8,'2022-06-28 16:44:05','Persiana Derecha',24,1,0),(9,'2022-06-28 16:44:24','Baño hab Rachel',25,1,1);
/*!40000 ALTER TABLE `persianas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`fincahazard`@`localhost`*/ /*!50003 TRIGGER trigger_persianas
   AFTER UPDATE ON persianas
   FOR EACH ROW
   BEGIN


   DECLARE done INT DEFAULT 0;
   DECLARE cod_ope INT;
   DECLARE v_cumple INT;

   DECLARE cursor_operacion CURSOR FOR SELECT b.codigo_operacion
   FROM operacion_persianas as b
   WHERE b.codigo_persianas = NEW.id;

   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

   OPEN cursor_operacion;

   read_loop: LOOP

   FETCH cursor_operacion INTO cod_ope;

   IF done THEN
   LEAVE read_loop;
   END IF;

   SELECT count(id)
   INTO v_cumple
   FROM operacion_persianas
   WHERE estado = NEW.estado AND consigna = NEW.consigna
   AND codigo_operacion = cod_ope;

   IF (v_cumple = 0) THEN
      UPDATE operacion SET estado = 0 WHERE id = cod_ope;
   ELSE
      UPDATE operacion SET estado = 1 WHERE id = cod_ope;
   END IF;

   END LOOP;

   CLOSE cursor_operacion;

   END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `persianas_previo_rutina`
--

DROP TABLE IF EXISTS `persianas_previo_rutina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persianas_previo_rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  `consigna` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `persianas_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persianas_previo_rutina`
--

LOCK TABLES `persianas_previo_rutina` WRITE;
/*!40000 ALTER TABLE `persianas_previo_rutina` DISABLE KEYS */;
/*!40000 ALTER TABLE `persianas_previo_rutina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piscina`
--

DROP TABLE IF EXISTS `piscina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piscina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `temperatura` float DEFAULT NULL,
  `ph` float DEFAULT NULL,
  `nivel` float DEFAULT NULL,
  `redox` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `piscina_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piscina`
--

LOCK TABLES `piscina` WRITE;
/*!40000 ALTER TABLE `piscina` DISABLE KEYS */;
/*!40000 ALTER TABLE `piscina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planta`
--

DROP TABLE IF EXISTS `planta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_ubicacion` int(11) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planta`
--

LOCK TABLES `planta` WRITE;
/*!40000 ALTER TABLE `planta` DISABLE KEYS */;
INSERT INTO `planta` VALUES (1,'2021-09-08 14:57:20','Lagos',11,7),(2,'2021-09-08 14:57:20','Exterior',11,8),(3,'2021-09-08 14:57:20','Planta 1',11,5),(4,'2021-09-08 14:57:20','Pt. Baja Z',11,1),(5,'2021-09-08 14:57:20','Pt. Baja H',11,2),(6,'2022-03-18 11:37:20','Sotano H',11,3),(7,'2022-03-18 11:37:20','Sotano Z',11,4),(8,'2022-03-21 09:57:20','Z. Comunes',11,6);
/*!40000 ALTER TABLE `planta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `tipotcaso` int(11) DEFAULT NULL,
  `texto` varchar(140) DEFAULT NULL,
  `estado` int(11) NOT NULL,
  `activo` int(11) NOT NULL,
  `emisor` int(11) NOT NULL,
  `receptor` int(11) NOT NULL,
  `pertenencia` int(11) NOT NULL,
  `fechaanotacion` datetime DEFAULT NULL,
  `codigo_post` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `emisor` (`emisor`),
  KEY `receptor` (`receptor`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`emisor`) REFERENCES `sistema_pruebas`.`usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`receptor`) REFERENCES `sistema_pruebas`.`rc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'2022-08-31 13:46:12',0,'ssss',4,0,20,7,1,'2022-08-17 00:20:00',NULL);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rb`
--

DROP TABLE IF EXISTS `rb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo_comando` int(11) DEFAULT NULL,
  `tipotrb` int(11) DEFAULT NULL,
  `numerobornas` int(11) DEFAULT NULL,
  `numconversor` int(11) DEFAULT NULL,
  `numcomando` int(11) DEFAULT NULL,
  `mutex` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_comando` (`codigo_comando`),
  CONSTRAINT `rb_ibfk_1` FOREIGN KEY (`codigo_comando`) REFERENCES `comando` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=528 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rb`
--

LOCK TABLES `rb` WRITE;
/*!40000 ALTER TABLE `rb` DISABLE KEYS */;
INSERT INTO `rb` VALUES (1,'2022-04-02 08:48:04',1,0,16,NULL,NULL,2),(2,'2022-04-02 08:48:06',1,7,16,NULL,NULL,NULL),(3,'2022-04-02 08:48:09',1,9,4,NULL,NULL,NULL),(4,'2022-04-02 12:57:12',1,8,4,0,64,10),(5,'2022-04-02 12:58:36',1,8,4,0,65,10),(6,'2022-04-02 12:58:59',1,8,4,0,66,10),(7,'2022-04-02 12:59:26',1,8,4,0,67,10),(8,'2022-04-02 12:59:48',1,8,4,0,68,10),(9,'2022-04-03 12:09:47',1,2,16,NULL,NULL,NULL),(10,'2022-04-03 12:11:14',2,0,16,NULL,NULL,NULL),(11,'2022-04-03 12:11:15',2,7,16,NULL,NULL,NULL),(12,'2022-04-03 12:11:16',2,9,4,NULL,NULL,NULL),(13,'2022-04-03 12:12:02',2,2,16,NULL,NULL,NULL),(14,'2022-04-03 12:32:21',2,8,4,0,64,11),(15,'2022-04-03 12:32:43',2,8,4,0,65,11),(16,'2022-04-03 12:33:01',2,8,4,0,66,11),(17,'2022-04-03 12:33:21',2,8,4,0,67,11),(18,'2022-04-03 12:33:44',2,8,4,0,68,11),(19,'2022-04-03 21:05:39',3,0,16,NULL,NULL,NULL),(20,'2022-04-03 21:05:40',3,7,16,NULL,NULL,NULL),(21,'2022-04-03 21:05:43',3,9,4,NULL,NULL,NULL),(22,'2022-04-03 21:07:16',3,2,16,NULL,NULL,NULL),(23,'2022-04-03 21:15:19',3,8,4,0,64,7),(24,'2022-04-03 21:15:43',3,8,4,0,65,7),(25,'2022-04-03 21:16:39',3,8,4,0,66,7),(26,'2022-04-03 21:17:14',3,8,4,0,67,7),(27,'2022-04-03 21:17:35',3,8,4,0,68,7),(28,'2022-04-03 21:47:33',4,0,16,NULL,NULL,NULL),(29,'2022-04-03 21:47:34',4,7,16,NULL,NULL,NULL),(30,'2022-04-03 21:47:37',4,9,4,NULL,NULL,NULL),(31,'2022-04-03 21:48:24',4,2,16,NULL,NULL,NULL),(32,'2022-04-03 21:59:11',4,8,4,0,64,8),(33,'2022-04-03 22:00:09',4,8,4,0,65,8),(34,'2022-04-03 22:00:18',4,8,4,0,66,8),(35,'2022-04-03 22:05:46',4,8,4,0,67,8),(36,'2022-04-03 22:06:29',4,8,4,0,68,8),(37,'2022-04-03 22:08:32',5,0,16,NULL,NULL,NULL),(38,'2022-04-03 22:08:33',5,7,16,NULL,NULL,NULL),(39,'2022-04-03 22:08:35',5,9,4,NULL,NULL,NULL),(40,'2022-04-03 22:09:14',5,2,16,NULL,NULL,NULL),(41,'2022-04-03 22:16:21',5,8,4,0,64,13),(42,'2022-04-03 22:16:42',5,8,4,0,65,13),(43,'2022-04-03 22:17:05',5,8,4,0,66,13),(44,'2022-04-03 22:17:42',5,8,4,0,67,13),(45,'2022-04-03 22:18:08',5,8,4,0,68,13),(46,'2022-04-03 22:20:14',6,0,16,NULL,NULL,NULL),(47,'2022-04-03 22:20:16',6,7,16,NULL,NULL,NULL),(48,'2022-04-03 22:20:17',6,9,4,NULL,NULL,NULL),(49,'2022-04-03 22:22:01',6,2,16,NULL,NULL,NULL),(50,'2022-04-03 22:29:15',6,8,4,0,64,4),(51,'2022-04-03 22:29:42',6,8,4,0,65,4),(52,'2022-04-03 22:30:02',6,8,4,0,66,4),(53,'2022-04-03 22:30:20',6,8,4,0,67,4),(54,'2022-04-03 22:30:39',6,8,4,0,68,4),(55,'2022-04-25 08:25:14',1,1,1,NULL,NULL,NULL),(56,'2022-04-25 09:07:53',2,1,1,NULL,NULL,NULL),(57,'2022-04-25 09:33:42',3,1,1,NULL,NULL,NULL),(58,'2022-04-25 10:00:51',4,1,1,NULL,NULL,NULL),(59,'2022-04-25 10:14:19',5,1,1,NULL,NULL,NULL),(60,'2022-04-25 10:27:29',6,1,1,NULL,NULL,NULL),(61,'2022-04-25 10:36:50',7,0,16,NULL,NULL,NULL),(62,'2022-04-25 10:36:52',7,7,16,NULL,NULL,NULL),(63,'2022-04-25 10:36:55',7,9,4,NULL,NULL,NULL),(64,'2022-04-25 10:46:24',7,2,16,NULL,NULL,NULL),(65,'2022-04-25 10:55:32',7,8,4,0,64,12),(66,'2022-04-25 10:57:30',7,8,4,0,65,12),(67,'2022-04-25 10:58:44',7,8,4,0,66,12),(68,'2022-04-25 11:06:10',7,1,1,NULL,NULL,NULL),(69,'2022-04-25 11:20:33',8,0,16,NULL,NULL,NULL),(70,'2022-04-25 11:20:35',8,7,16,NULL,NULL,NULL),(71,'2022-04-25 11:20:38',8,9,4,NULL,NULL,NULL),(72,'2022-04-25 11:21:50',8,2,16,NULL,NULL,NULL),(73,'2022-04-26 08:27:34',8,1,1,NULL,NULL,NULL),(74,'2022-04-26 08:27:44',8,1,1,NULL,NULL,NULL),(75,'2022-04-26 08:29:36',8,8,4,0,64,3),(76,'2022-04-26 08:30:07',8,8,4,0,65,3),(77,'2022-04-26 08:30:29',8,8,4,0,66,3),(78,'2022-04-26 08:30:55',8,8,4,0,67,3),(79,'2022-04-26 08:31:17',8,8,4,0,68,3),(80,'2022-05-10 09:45:06',9,0,16,NULL,NULL,NULL),(81,'2022-05-10 09:45:23',9,7,16,NULL,NULL,NULL),(82,'2022-05-10 09:45:33',9,9,4,NULL,NULL,NULL),(83,'2022-05-10 10:09:44',9,1,1,NULL,NULL,NULL),(84,'2022-05-10 10:10:21',9,1,1,NULL,NULL,NULL),(85,'2022-05-10 10:10:29',9,1,1,NULL,NULL,NULL),(86,'2022-05-10 10:14:44',9,8,4,0,64,9),(87,'2022-05-10 10:15:19',9,8,4,0,65,9),(88,'2022-05-10 10:15:51',9,8,4,0,66,9),(89,'2022-05-10 10:16:19',9,8,4,0,67,9),(90,'2022-05-10 10:19:55',9,8,4,0,68,9),(91,'2022-05-10 10:20:21',9,8,4,0,69,9),(92,'2022-05-10 10:20:49',9,8,4,0,70,9),(93,'2022-05-10 10:21:59',9,8,4,0,71,9),(94,'2022-05-10 10:23:06',9,8,4,0,72,9),(95,'2022-05-29 23:06:37',10,0,16,NULL,NULL,NULL),(96,'2022-05-29 23:06:40',10,7,16,NULL,NULL,NULL),(97,'2022-05-29 23:06:42',10,9,4,NULL,NULL,NULL),(98,'2022-05-29 23:12:31',10,8,4,0,64,6),(99,'2022-05-29 23:13:13',10,8,4,0,65,6),(100,'2022-06-03 15:20:36',11,0,16,NULL,NULL,NULL),(101,'2022-06-03 15:20:38',11,7,16,NULL,NULL,NULL),(102,'2022-06-03 15:20:40',11,9,4,NULL,NULL,NULL),(103,'2022-06-03 15:23:25',12,0,16,NULL,NULL,NULL),(104,'2022-06-03 15:23:26',12,7,16,NULL,NULL,NULL),(105,'2022-06-03 15:23:28',12,9,4,NULL,NULL,NULL),(106,'2022-06-03 15:27:40',12,2,16,NULL,NULL,NULL),(107,'2022-06-04 17:52:22',11,8,4,0,64,0),(108,'2022-06-04 17:53:10',11,8,4,0,65,0),(109,'2022-06-04 17:59:03',11,8,4,0,66,0),(110,'2022-06-04 17:59:32',11,8,4,0,67,0),(111,'2022-06-04 18:02:24',11,8,4,0,68,0),(112,'2022-06-04 18:09:08',11,8,4,0,69,0),(113,'2022-06-04 18:10:58',11,8,4,0,70,0),(114,'2022-06-04 18:11:41',11,8,4,0,71,0),(115,'2022-06-04 18:12:35',11,8,4,0,72,0),(116,'2022-06-04 18:13:42',11,8,4,0,73,0),(117,'2022-06-04 18:14:28',11,8,4,0,74,0),(118,'2022-06-04 18:15:07',11,8,4,0,75,0),(119,'2022-06-04 18:28:19',12,1,1,NULL,NULL,NULL),(120,'2022-06-20 18:39:07',13,33,2,NULL,NULL,NULL),(121,'2022-06-20 18:39:11',13,34,2,NULL,NULL,NULL),(122,'2022-06-20 18:40:17',13,34,2,NULL,0,NULL),(123,'2022-06-20 18:43:24',13,34,2,NULL,1,NULL),(124,'2022-06-20 18:45:04',13,34,2,NULL,2,NULL),(125,'2022-06-20 18:45:47',13,34,2,NULL,3,NULL),(126,'2022-06-20 18:46:51',13,34,2,NULL,4,NULL),(127,'2022-06-20 18:47:32',13,34,2,NULL,5,NULL),(128,'2022-06-20 18:50:12',13,34,2,NULL,6,NULL),(129,'2022-06-20 18:51:05',13,34,2,NULL,7,NULL),(130,'2022-06-20 18:51:50',13,34,2,NULL,8,NULL),(131,'2022-06-20 19:14:34',14,42,2,NULL,NULL,NULL),(132,'2022-06-20 19:14:35',14,43,2,NULL,NULL,NULL),(133,'2022-06-20 19:15:33',15,42,2,NULL,NULL,NULL),(134,'2022-06-20 19:15:34',15,43,2,NULL,NULL,NULL),(135,'2022-06-20 19:16:00',16,42,2,NULL,NULL,NULL),(136,'2022-06-20 19:16:00',16,43,2,NULL,NULL,NULL),(137,'2022-06-20 19:16:18',17,42,2,NULL,NULL,NULL),(138,'2022-06-20 19:16:18',17,43,2,NULL,NULL,NULL),(139,'2022-06-20 19:16:34',18,42,2,NULL,NULL,NULL),(140,'2022-06-20 19:16:35',18,43,2,NULL,NULL,NULL),(141,'2022-06-20 19:16:59',19,42,2,NULL,NULL,NULL),(142,'2022-06-20 19:17:00',19,43,2,NULL,NULL,NULL),(143,'2022-06-20 19:17:19',20,42,2,NULL,NULL,NULL),(144,'2022-06-20 19:17:20',20,43,2,NULL,NULL,NULL),(145,'2022-06-20 19:17:45',21,42,2,NULL,NULL,NULL),(146,'2022-06-20 19:17:46',21,43,2,NULL,NULL,NULL),(147,'2022-06-20 19:18:06',22,42,2,NULL,NULL,NULL),(148,'2022-06-20 19:18:06',22,43,2,NULL,NULL,NULL),(149,'2022-06-20 19:18:35',23,42,2,NULL,NULL,NULL),(150,'2022-06-20 19:18:35',23,43,2,NULL,NULL,NULL),(151,'2022-06-22 22:39:27',24,42,2,NULL,NULL,NULL),(152,'2022-06-22 22:39:27',24,43,2,NULL,NULL,NULL),(153,'2022-06-22 22:43:15',25,42,2,NULL,NULL,NULL),(154,'2022-06-22 22:43:15',25,43,2,NULL,NULL,NULL),(155,'2022-06-22 22:56:15',26,0,16,NULL,NULL,NULL),(156,'2022-06-22 22:56:16',26,7,16,NULL,NULL,NULL),(157,'2022-06-22 22:56:17',26,9,4,NULL,NULL,NULL),(158,'2022-06-22 23:13:12',26,8,4,0,64,1),(159,'2022-06-22 23:13:50',26,8,4,0,65,1),(160,'2022-06-22 23:14:22',26,8,4,0,66,1),(161,'2022-06-22 23:14:49',26,8,4,0,67,1),(162,'2022-06-22 23:15:17',26,8,4,0,68,1),(163,'2022-06-22 23:15:46',26,8,4,0,69,1),(164,'2022-06-22 23:16:15',26,8,4,0,70,1),(165,'2022-06-22 23:16:39',26,8,4,0,71,1),(166,'2022-06-22 23:17:59',26,8,4,0,72,1),(167,'2022-06-22 23:18:28',26,8,4,0,73,1),(168,'2022-06-22 23:18:57',26,8,4,0,74,1),(169,'2022-06-22 23:19:21',26,8,4,0,75,1),(170,'2022-06-22 23:19:47',26,8,4,0,76,1),(171,'2022-06-22 23:20:13',26,8,4,0,77,1),(172,'2022-06-22 23:20:36',26,8,4,0,78,1),(173,'2022-06-22 23:21:00',26,8,4,0,79,1),(174,'2022-06-22 23:25:10',26,1,1,NULL,NULL,NULL),(175,'2022-06-22 23:25:20',26,1,1,NULL,NULL,NULL),(176,'2022-06-22 23:25:28',26,1,1,NULL,NULL,NULL),(177,'2022-06-22 23:25:34',26,1,1,NULL,NULL,NULL),(178,'2022-06-22 23:25:46',26,1,1,NULL,NULL,NULL),(179,'2022-06-22 23:25:54',26,1,1,NULL,NULL,NULL),(180,'2022-06-22 23:45:56',27,0,16,NULL,NULL,NULL),(181,'2022-06-22 23:45:59',27,7,16,NULL,NULL,NULL),(182,'2022-06-22 23:46:00',27,9,4,NULL,NULL,NULL),(183,'2022-06-22 23:59:23',27,8,4,0,64,0),(184,'2022-06-23 01:17:17',28,0,16,NULL,NULL,NULL),(185,'2022-06-23 01:17:18',28,7,16,NULL,NULL,NULL),(186,'2022-06-23 01:17:19',28,9,4,NULL,NULL,NULL),(187,'2022-06-23 01:27:09',28,1,1,NULL,NULL,NULL),(188,'2022-06-23 01:27:24',28,1,1,NULL,NULL,NULL),(189,'2022-06-23 01:27:45',28,1,1,NULL,NULL,NULL),(190,'2022-06-23 01:28:00',28,1,1,NULL,NULL,NULL),(191,'2022-06-23 01:31:24',28,8,4,0,64,5),(192,'2022-06-23 01:32:31',28,8,4,0,65,5),(193,'2022-06-23 01:32:56',28,8,4,0,66,5),(194,'2022-06-23 01:33:35',28,8,4,0,67,5),(195,'2022-06-23 01:34:24',28,8,4,0,68,5),(196,'2022-06-23 01:34:57',28,8,4,0,69,5),(197,'2022-06-23 01:35:26',28,8,4,0,70,5),(198,'2022-06-23 01:35:57',28,8,4,0,71,5),(199,'2022-06-23 01:36:24',28,8,4,0,72,5),(200,'2022-06-23 01:36:54',28,8,4,0,73,5),(201,'2022-06-23 01:37:24',28,8,4,0,74,5),(202,'2022-06-23 01:38:21',28,8,4,0,75,5),(203,'2022-07-02 14:00:16',29,42,2,NULL,NULL,NULL),(204,'2022-07-02 14:00:29',29,43,2,NULL,NULL,NULL),(205,'2022-07-05 18:02:21',30,23,8,NULL,NULL,NULL),(206,'2022-07-05 20:56:44',31,23,8,NULL,NULL,NULL),(207,'2022-07-05 21:31:27',32,21,8,NULL,NULL,NULL),(208,'2022-07-05 21:35:18',33,21,8,NULL,NULL,NULL),(209,'2022-07-05 21:46:31',34,23,8,NULL,NULL,NULL),(210,'2022-07-05 21:49:52',35,21,8,NULL,NULL,NULL),(211,'2022-07-05 22:06:26',36,23,8,NULL,NULL,NULL),(212,'2022-07-05 22:09:10',37,21,8,NULL,NULL,NULL),(213,'2022-07-05 22:26:54',27,2,16,NULL,NULL,NULL),(214,'2022-07-05 23:38:07',28,2,16,NULL,NULL,NULL),(215,'2022-07-06 00:20:14',28,1,1,NULL,NULL,NULL),(216,'2022-07-06 22:39:36',26,3,4,0,0,1),(217,'2022-07-06 22:39:45',26,3,4,0,1,1),(218,'2022-07-06 22:39:50',26,3,4,0,2,1),(219,'2022-07-06 22:39:55',26,3,4,0,3,1),(220,'2022-07-06 22:40:00',26,3,4,0,4,1),(221,'2022-07-06 22:40:05',26,3,4,0,5,1),(222,'2022-07-06 22:40:10',26,3,4,0,6,1),(223,'2022-07-06 22:40:14',26,3,4,0,7,1),(224,'2022-07-06 22:40:17',26,3,4,0,8,1),(225,'2022-07-06 22:40:21',26,3,4,0,9,1),(226,'2022-07-06 22:40:24',26,3,4,0,10,1),(227,'2022-07-06 22:40:28',26,3,4,0,11,1),(228,'2022-07-06 22:40:34',26,3,4,0,12,1),(229,'2022-07-06 22:40:38',26,3,4,0,13,1),(230,'2022-07-06 22:41:06',26,3,4,0,14,1),(231,'2022-07-06 22:41:10',26,3,4,0,15,1),(232,'2022-07-06 23:07:54',27,3,4,0,0,1),(233,'2022-07-06 23:13:19',11,3,4,0,25,0),(234,'2022-07-06 23:13:23',11,3,4,0,11,0),(235,'2022-07-06 23:13:27',11,3,4,0,10,0),(236,'2022-07-06 23:13:32',11,3,4,0,7,0),(237,'2022-07-06 23:13:35',11,3,4,0,0,0),(238,'2022-07-06 23:13:39',11,3,4,0,1,0),(239,'2022-07-06 23:13:42',11,3,4,0,2,0),(240,'2022-07-06 23:13:45',11,3,4,0,18,0),(241,'2022-07-06 23:13:49',11,3,4,0,13,0),(242,'2022-07-06 23:13:53',11,3,4,0,16,0),(243,'2022-07-06 23:13:56',11,3,4,0,4,0),(244,'2022-07-06 23:14:05',11,3,4,0,12,0),(245,'2022-07-07 09:16:22',8,3,4,0,16,3),(246,'2022-07-07 09:16:28',8,3,4,0,5,3),(247,'2022-07-07 09:16:31',8,3,4,0,27,3),(248,'2022-07-07 09:16:34',8,3,4,0,1,3),(249,'2022-07-07 09:16:37',8,3,4,0,29,3),(250,'2022-07-07 16:07:51',28,3,4,0,8,5),(251,'2022-07-07 16:07:55',28,3,4,0,12,5),(252,'2022-07-07 16:07:57',28,3,4,0,6,5),(253,'2022-07-07 16:08:00',28,3,4,0,15,5),(254,'2022-07-07 16:08:04',28,3,4,0,1,5),(255,'2022-07-07 16:08:07',28,3,4,0,10,5),(256,'2022-07-07 16:08:11',28,3,4,0,0,5),(257,'2022-07-07 16:08:15',28,3,4,0,20,5),(258,'2022-07-07 16:08:18',28,3,4,0,3,5),(259,'2022-07-07 16:08:21',28,3,4,0,2,5),(260,'2022-07-07 16:08:25',28,3,4,0,10,5),(261,'2022-07-07 16:08:28',28,3,4,0,11,5),(262,'2022-07-07 16:11:42',7,3,4,0,2,12),(263,'2022-07-07 16:11:54',7,3,4,0,7,12),(264,'2022-07-07 16:11:58',7,3,4,0,0,12),(265,'2022-07-07 16:17:17',1,3,4,0,0,10),(266,'2022-07-07 16:17:20',1,3,4,0,1,10),(267,'2022-07-07 16:17:23',1,3,4,0,2,10),(268,'2022-07-07 16:17:28',1,3,4,0,3,10),(269,'2022-07-07 16:17:31',1,3,4,0,4,10),(270,'2022-07-07 16:23:30',2,3,4,0,0,11),(271,'2022-07-07 16:23:34',2,3,4,0,1,11),(272,'2022-07-07 16:23:37',2,3,4,0,2,11),(273,'2022-07-07 16:23:41',2,3,4,0,3,11),(274,'2022-07-07 16:23:45',2,3,4,0,4,11),(275,'2022-07-07 16:24:00',3,3,4,0,0,7),(276,'2022-07-07 16:24:12',3,3,4,0,1,7),(277,'2022-07-07 16:24:15',3,3,4,0,2,7),(278,'2022-07-07 16:24:21',3,3,4,0,3,7),(279,'2022-07-07 16:24:24',3,3,4,0,4,7),(280,'2022-07-07 16:24:32',4,3,4,0,0,8),(281,'2022-07-07 16:24:35',4,3,4,0,1,8),(282,'2022-07-07 16:24:39',4,3,4,0,2,8),(283,'2022-07-07 16:24:43',4,3,4,0,3,8),(284,'2022-07-07 16:24:46',4,3,4,0,4,8),(285,'2022-07-07 16:25:09',5,3,4,0,0,13),(286,'2022-07-07 16:25:12',5,3,4,0,5,13),(287,'2022-07-07 16:25:18',5,3,4,0,6,13),(288,'2022-07-07 16:25:21',5,3,4,0,3,13),(289,'2022-07-07 16:25:23',5,3,4,0,15,13),(290,'2022-07-07 16:26:04',6,3,4,0,0,4),(291,'2022-07-07 16:26:06',6,3,4,0,1,4),(292,'2022-07-07 16:26:09',6,3,4,0,2,4),(293,'2022-07-07 16:26:12',6,3,4,0,3,4),(294,'2022-07-07 16:26:15',6,3,4,0,4,4),(295,'2022-07-07 16:26:47',9,3,4,0,0,9),(296,'2022-07-07 16:26:50',9,3,4,0,1,9),(297,'2022-07-07 16:26:53',9,3,4,0,2,9),(298,'2022-07-07 16:26:56',9,3,4,0,3,9),(299,'2022-07-07 16:26:59',9,3,4,0,4,9),(300,'2022-07-07 16:27:03',9,3,4,0,5,9),(301,'2022-07-07 16:27:06',9,3,4,0,6,9),(302,'2022-07-07 16:27:11',9,3,4,0,7,9),(303,'2022-07-07 16:27:15',9,3,4,0,8,9),(304,'2022-07-07 16:27:40',10,3,4,0,3,6),(305,'2022-07-07 16:27:46',10,3,4,0,0,6),(306,'2022-07-07 16:49:45',38,16,479,NULL,NULL,NULL),(307,'2022-07-07 17:22:45',39,31,42,NULL,NULL,NULL),(308,'2022-07-07 17:22:52',39,31,6,NULL,NULL,NULL),(309,'2022-07-10 13:25:43',39,32,6,NULL,NULL,NULL),(310,'2022-07-11 21:31:13',12,1,1,NULL,NULL,NULL),(311,'2022-07-12 00:53:50',40,0,16,NULL,NULL,NULL),(312,'2022-07-12 00:53:52',40,7,16,NULL,NULL,NULL),(313,'2022-07-12 00:53:55',40,9,4,NULL,NULL,NULL),(314,'2022-07-12 00:55:12',41,0,16,NULL,NULL,NULL),(315,'2022-07-12 00:55:13',41,7,16,NULL,NULL,NULL),(316,'2022-07-12 00:55:14',41,9,4,NULL,NULL,NULL),(317,'2022-07-12 14:37:19',5,8,4,0,69,13),(318,'2022-07-12 15:01:20',5,8,4,0,70,13),(319,'2022-07-12 15:02:33',5,3,4,0,5,13),(320,'2022-07-12 15:02:39',5,3,4,0,6,13),(321,'2022-07-12 18:08:53',42,0,16,NULL,NULL,NULL),(322,'2022-07-12 18:08:57',42,7,16,NULL,NULL,NULL),(323,'2022-07-12 18:09:01',42,9,4,NULL,NULL,NULL),(324,'2022-07-13 04:15:53',42,2,16,NULL,NULL,NULL),(325,'2022-07-13 04:27:32',42,1,1,NULL,NULL,NULL),(326,'2022-07-13 04:33:45',42,8,4,0,64,14),(327,'2022-07-13 04:34:20',42,8,4,0,65,14),(328,'2022-07-13 04:34:46',42,8,4,0,66,14),(329,'2022-07-13 04:35:19',42,8,4,0,67,14),(330,'2022-07-13 04:35:46',42,8,4,0,68,14),(331,'2022-07-13 04:36:21',42,8,4,0,69,14),(332,'2022-07-13 04:39:50',42,3,4,0,0,14),(333,'2022-07-13 04:39:54',42,3,4,0,14,14),(334,'2022-07-13 04:40:04',42,3,4,0,2,14),(335,'2022-07-13 04:40:14',42,3,4,0,5,14),(336,'2022-07-13 04:40:18',42,3,4,0,20,14),(337,'2022-07-13 04:40:22',42,3,4,0,5,14),(338,'2022-08-18 08:04:11',43,23,8,NULL,NULL,NULL),(339,'2022-08-18 08:04:42',44,21,8,NULL,NULL,NULL),(340,'2022-08-18 08:05:22',45,23,8,NULL,NULL,NULL),(341,'2022-08-18 08:05:27',46,21,8,NULL,NULL,NULL),(342,'2022-08-18 08:22:17',47,23,8,NULL,NULL,NULL),(343,'2022-08-18 08:22:26',48,21,8,NULL,NULL,NULL),(344,'2022-08-18 08:22:43',49,23,8,NULL,NULL,NULL),(345,'2022-08-18 08:22:50',50,21,8,NULL,NULL,NULL),(346,'2022-08-25 11:46:59',51,42,2,NULL,NULL,NULL),(347,'2022-08-25 11:46:59',51,43,2,NULL,NULL,NULL),(348,'2022-08-29 17:54:07',11,3,4,0,17,0),(349,'2022-08-29 18:04:33',11,3,4,0,15,0),(350,'2022-08-29 18:06:09',11,3,4,0,20,0),(351,'2022-08-29 18:06:18',11,3,4,0,27,0),(352,'2022-08-29 18:06:25',11,3,4,0,24,0),(353,'2022-08-29 18:09:27',11,3,4,0,5,0),(354,'2022-08-29 18:09:42',11,3,4,0,8,0),(355,'2022-08-29 18:09:52',11,3,4,0,29,0),(356,'2022-08-29 18:10:03',11,3,4,0,6,0),(357,'2022-08-29 18:10:13',11,3,4,0,9,0),(358,'2022-08-29 18:10:24',11,3,4,0,21,0),(359,'2022-08-29 18:12:57',11,3,4,0,3,0),(360,'2022-08-29 18:13:14',11,3,4,0,28,0),(361,'2022-08-29 18:13:23',11,3,4,0,14,0),(362,'2022-08-29 18:14:13',11,3,4,0,19,0),(363,'2022-08-29 18:14:26',11,3,4,0,22,0),(364,'2022-08-29 18:14:31',11,3,4,0,23,0),(365,'2022-08-29 18:14:36',11,3,4,0,30,0),(366,'2022-08-29 18:14:43',11,3,4,0,26,0),(367,'2022-08-29 18:24:55',7,3,4,0,3,12),(368,'2022-08-29 18:25:19',7,3,4,0,4,12),(369,'2022-08-29 18:25:26',7,3,4,0,6,12),(370,'2022-08-29 18:25:33',7,3,4,0,1,12),(371,'2022-08-29 18:25:37',7,3,4,0,5,12),(372,'2022-08-29 18:37:42',8,3,4,0,6,3),(373,'2022-08-29 18:37:48',8,3,4,0,9,3),(374,'2022-08-29 18:37:55',8,3,4,0,10,3),(375,'2022-08-29 18:38:05',8,3,4,0,13,3),(376,'2022-08-29 18:38:09',8,3,4,0,14,3),(377,'2022-08-29 18:38:13',8,3,4,0,17,3),(378,'2022-08-29 18:38:18',8,3,4,0,18,3),(379,'2022-08-29 18:38:23',8,3,4,0,19,3),(380,'2022-08-29 18:38:29',8,3,4,0,20,3),(381,'2022-08-29 18:38:37',8,3,4,0,28,3),(382,'2022-08-29 18:39:22',8,3,4,0,2,3),(383,'2022-08-29 18:39:27',8,3,4,0,3,3),(384,'2022-08-29 18:39:31',8,3,4,0,4,3),(385,'2022-08-29 18:39:35',8,3,4,0,7,3),(386,'2022-08-29 18:39:39',8,3,4,0,8,3),(387,'2022-08-29 18:39:43',8,3,4,0,11,3),(388,'2022-08-29 18:39:48',8,3,4,0,12,3),(389,'2022-08-29 18:39:53',8,3,4,0,15,3),(390,'2022-08-29 18:39:59',8,3,4,0,21,3),(391,'2022-08-29 18:40:04',8,3,4,0,22,3),(392,'2022-08-29 18:40:10',8,3,4,0,24,3),(393,'2022-08-29 18:40:15',8,3,4,0,25,3),(394,'2022-08-29 18:40:20',8,3,4,0,26,3),(395,'2022-08-29 18:40:27',8,3,4,0,23,3),(396,'2022-08-29 18:55:31',42,3,4,0,1,14),(397,'2022-08-29 18:55:37',42,3,4,0,4,14),(398,'2022-08-29 18:55:41',42,3,4,0,11,14),(399,'2022-08-29 18:55:45',42,3,4,0,12,14),(400,'2022-08-29 18:55:49',42,3,4,0,13,14),(401,'2022-08-29 18:55:53',42,3,4,0,16,14),(402,'2022-08-29 18:55:58',42,3,4,0,27,14),(403,'2022-08-29 18:56:04',42,3,4,0,15,14),(404,'2022-08-29 18:56:11',42,3,4,0,6,14),(405,'2022-08-29 18:56:16',42,3,4,0,8,14),(406,'2022-08-29 18:56:27',42,3,4,0,10,14),(407,'2022-08-29 18:56:32',42,3,4,0,18,14),(408,'2022-08-29 18:56:41',42,3,4,0,21,14),(409,'2022-08-29 18:56:45',42,3,4,0,22,14),(410,'2022-08-29 18:56:50',42,3,4,0,23,14),(411,'2022-08-29 18:56:55',42,3,4,0,24,14),(412,'2022-08-29 18:57:01',42,3,4,0,25,14),(413,'2022-08-29 18:57:06',42,3,4,0,26,14),(414,'2022-08-29 18:57:12',42,3,4,0,3,14),(415,'2022-08-29 18:57:18',42,3,4,0,7,14),(416,'2022-08-29 18:57:22',42,3,4,0,9,14),(417,'2022-08-29 18:57:28',42,3,4,0,17,14),(418,'2022-08-29 18:57:34',42,3,4,0,19,14),(419,'2022-08-30 07:30:01',10,3,4,0,6,6),(420,'2022-08-30 07:30:06',10,3,4,0,7,6),(421,'2022-08-30 07:30:11',10,3,4,0,1,6),(422,'2022-08-30 07:30:17',10,3,4,0,2,6),(423,'2022-08-30 07:30:21',10,3,4,0,4,6),(424,'2022-08-30 07:30:26',10,3,4,0,5,6),(425,'2022-08-30 07:30:31',10,3,4,0,8,6),(426,'2022-08-30 07:55:47',28,3,4,0,13,5),(427,'2022-08-30 07:55:53',28,3,4,0,17,5),(428,'2022-08-30 07:55:58',28,3,4,0,21,5),(429,'2022-08-30 07:56:04',28,3,4,0,24,5),(430,'2022-08-30 07:56:12',28,3,4,0,37,5),(431,'2022-08-30 07:56:17',28,3,4,0,41,5),(432,'2022-08-30 07:56:31',28,3,4,0,18,5),(433,'2022-08-30 07:56:37',28,3,4,0,4,5),(434,'2022-08-30 07:56:45',28,3,4,0,7,5),(435,'2022-08-30 07:56:51',28,3,4,0,26,5),(436,'2022-08-30 07:56:57',28,3,4,0,30,5),(437,'2022-08-30 07:57:01',28,3,4,0,32,5),(438,'2022-08-30 07:57:08',28,3,4,0,40,5),(439,'2022-08-30 07:57:15',28,3,4,0,5,5),(440,'2022-08-30 07:57:23',28,3,4,0,36,5),(441,'2022-08-30 07:57:29',28,3,4,0,19,5),(442,'2022-08-30 07:57:34',28,3,4,0,25,5),(443,'2022-08-30 07:57:39',28,3,4,0,27,5),(444,'2022-08-30 07:57:43',28,3,4,0,28,5),(445,'2022-08-30 07:57:48',28,3,4,0,29,5),(446,'2022-08-30 07:57:55',28,3,4,0,35,5),(447,'2022-08-30 07:58:02',28,3,4,0,39,5),(448,'2022-08-30 07:58:06',28,3,4,0,38,5),(449,'2022-08-30 07:58:14',28,3,4,0,9,5),(450,'2022-08-30 07:58:20',28,3,4,0,14,5),(451,'2022-08-30 07:58:25',28,3,4,0,16,5),(452,'2022-08-30 07:58:30',28,3,4,0,22,5),(453,'2022-08-30 07:58:34',28,3,4,0,23,5),(454,'2022-08-30 07:58:41',28,3,4,0,31,5),(455,'2022-08-30 07:58:49',28,3,4,0,33,5),(456,'2022-08-30 07:58:55',28,3,4,0,34,5),(457,'2022-08-30 08:36:31',5,3,4,0,10,13),(458,'2022-08-30 08:36:38',5,3,4,0,7,13),(459,'2022-08-30 08:36:44',5,3,4,0,14,13),(460,'2022-08-30 08:36:50',5,3,4,0,9,13),(461,'2022-08-30 08:36:54',5,3,4,0,12,13),(462,'2022-08-30 08:36:59',5,3,4,0,17,13),(463,'2022-08-30 08:37:04',5,3,4,0,16,13),(464,'2022-08-30 08:37:08',5,3,4,0,2,13),(465,'2022-08-30 08:37:12',5,3,4,0,4,13),(466,'2022-08-30 08:37:17',5,3,4,0,8,13),(467,'2022-08-30 08:37:22',5,3,4,0,11,13),(468,'2022-08-30 08:37:27',5,3,4,0,18,13),(469,'2022-08-30 08:37:34',5,3,4,0,19,13),(470,'2022-08-30 08:44:29',41,3,4,0,0,15),(471,'2022-08-30 08:44:33',41,3,4,0,2,15),(472,'2022-08-30 08:44:37',41,3,4,0,5,15),(473,'2022-08-30 08:44:41',41,3,4,0,7,15),(474,'2022-08-30 08:44:45',41,3,4,0,8,15),(475,'2022-08-30 08:44:50',41,3,4,0,10,15),(476,'2022-08-30 08:44:54',41,3,4,0,11,15),(477,'2022-08-30 08:44:58',41,3,4,0,13,15),(478,'2022-08-30 08:45:04',41,3,4,0,14,15),(479,'2022-08-30 08:45:09',41,3,4,0,1,15),(480,'2022-08-30 08:45:14',41,3,4,0,3,15),(481,'2022-08-30 08:45:18',41,3,4,0,9,15),(482,'2022-08-30 08:45:24',41,3,4,0,4,15),(483,'2022-08-30 08:45:28',41,3,4,0,6,15),(484,'2022-08-30 08:45:32',41,3,4,0,12,15),(485,'2022-08-30 08:50:38',41,3,4,0,16,15),(486,'2022-08-30 08:50:42',41,3,4,0,15,15),(487,'2022-08-30 08:54:08',52,50,2,NULL,NULL,NULL),(488,'2022-08-30 08:58:03',41,8,4,0,69,15),(489,'2022-08-30 08:59:23',41,8,4,0,70,15),(490,'2022-08-30 09:00:22',41,8,4,0,71,15),(491,'2022-08-30 09:01:26',41,8,4,0,72,15),(492,'2022-08-30 09:02:00',41,8,4,0,64,15),(493,'2022-08-30 23:47:51',53,52,59,NULL,NULL,NULL),(494,'2022-08-30 23:47:55',53,53,6,NULL,NULL,NULL),(495,'2022-09-07 05:07:27',42,1,1,NULL,NULL,NULL),(496,'2022-09-07 05:27:21',54,0,16,NULL,NULL,NULL),(497,'2022-09-07 05:27:23',54,7,16,NULL,NULL,NULL),(498,'2022-09-07 05:27:24',54,9,4,NULL,NULL,NULL),(499,'2022-09-07 05:37:22',55,0,16,NULL,NULL,NULL),(500,'2022-09-07 05:37:23',55,7,16,NULL,NULL,NULL),(501,'2022-09-07 05:37:25',55,9,4,NULL,NULL,NULL),(502,'2022-09-08 10:08:09',41,8,4,0,65,15),(503,'2022-09-08 10:11:32',41,8,4,0,66,15),(504,'2022-09-08 10:12:12',41,8,4,0,67,15),(505,'2022-09-08 10:12:45',41,8,4,0,68,15),(506,'2022-09-08 10:41:01',41,8,4,0,73,15),(507,'2022-09-08 11:53:30',41,8,4,0,74,15),(508,'2022-09-08 12:05:39',41,8,4,0,75,15),(509,'2022-09-08 12:07:06',41,8,4,0,76,15),(510,'2022-09-08 14:51:51',41,1,1,NULL,NULL,NULL),(511,'2022-09-08 14:52:11',41,1,1,NULL,NULL,NULL),(512,'2022-09-08 15:06:10',55,8,4,0,64,16),(513,'2022-09-08 15:08:55',55,1,1,NULL,NULL,NULL),(514,'2022-09-08 15:09:02',55,1,1,NULL,NULL,NULL),(515,'2022-09-08 16:25:33',54,1,1,NULL,NULL,NULL),(516,'2022-09-08 16:25:40',54,1,1,NULL,NULL,NULL),(517,'2022-09-08 16:25:47',54,1,1,NULL,NULL,NULL),(518,'2022-09-08 16:25:54',54,1,1,NULL,NULL,NULL),(519,'2022-09-08 16:31:35',56,51,2,NULL,NULL,NULL),(520,'2022-09-08 17:20:17',40,1,1,NULL,NULL,NULL),(521,'2022-09-08 17:20:25',40,1,1,NULL,NULL,NULL),(522,'2022-09-08 17:27:05',40,8,4,0,64,16),(523,'2022-09-08 17:27:35',40,8,4,0,65,16),(524,'2022-09-22 15:57:18',57,42,2,NULL,NULL,NULL),(525,'2022-09-22 15:57:19',57,43,2,NULL,NULL,NULL),(526,'2022-10-04 08:46:14',58,52,59,NULL,NULL,NULL),(527,'2022-10-04 08:46:18',58,53,6,NULL,NULL,NULL);
/*!40000 ALTER TABLE `rb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacion_accesos`
--

DROP TABLE IF EXISTS `relacion_accesos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relacion_accesos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo_accesos` int(11) NOT NULL,
  `rb_s_abrir` int(11) DEFAULT -1,
  `codigo_tp_s_abrir` int(11) DEFAULT -1,
  `rb_s_cerrar` int(11) DEFAULT -1,
  `codigo_tp_s_cerrar` int(11) DEFAULT -1,
  `rb_e_abrir` int(11) DEFAULT -1,
  `codigo_tp_e_abrir` int(11) DEFAULT -1,
  `rb_e_cerrar` int(11) DEFAULT -1,
  `codigo_tp_e_cerrar` int(11) DEFAULT -1,
  PRIMARY KEY (`id`),
  KEY `codigo_accesos` (`codigo_accesos`),
  CONSTRAINT `relacion_accesos_ibfk_1` FOREIGN KEY (`codigo_accesos`) REFERENCES `accesos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacion_accesos`
--

LOCK TABLES `relacion_accesos` WRITE;
/*!40000 ALTER TABLE `relacion_accesos` DISABLE KEYS */;
/*!40000 ALTER TABLE `relacion_accesos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacion_ambiente_escena`
--

DROP TABLE IF EXISTS `relacion_ambiente_escena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relacion_ambiente_escena` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_ambiente` int(11) NOT NULL,
  `codigo_escena` int(11) NOT NULL,
  `tiempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_ambiente` (`codigo_ambiente`),
  KEY `codigo_escena` (`codigo_escena`),
  CONSTRAINT `rel_amb_esc_ibfk_1` FOREIGN KEY (`codigo_ambiente`) REFERENCES `ambiente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rel_amb_esc_ibfk_2` FOREIGN KEY (`codigo_escena`) REFERENCES `escenas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacion_ambiente_escena`
--

LOCK TABLES `relacion_ambiente_escena` WRITE;
/*!40000 ALTER TABLE `relacion_ambiente_escena` DISABLE KEYS */;
/*!40000 ALTER TABLE `relacion_ambiente_escena` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacion_ambiente_operacion`
--

DROP TABLE IF EXISTS `relacion_ambiente_operacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relacion_ambiente_operacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_ambiente` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `tiempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_ambiente` (`codigo_ambiente`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `rel_amb_ope_ibfk_1` FOREIGN KEY (`codigo_ambiente`) REFERENCES `ambiente` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `rel_amb_ope_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacion_ambiente_operacion`
--

LOCK TABLES `relacion_ambiente_operacion` WRITE;
/*!40000 ALTER TABLE `relacion_ambiente_operacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `relacion_ambiente_operacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacion_bombas`
--

DROP TABLE IF EXISTS `relacion_bombas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relacion_bombas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo_bombas` int(11) NOT NULL,
  `rb_e_estado` int(11) NOT NULL,
  `codigo_tp_e_estado` int(11) NOT NULL,
  `rb_s_estado` int(11) NOT NULL,
  `codigo_tp_s_estado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_bombas` (`codigo_bombas`),
  CONSTRAINT `relacion_bombas_ibfk_1` FOREIGN KEY (`codigo_bombas`) REFERENCES `bombas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacion_bombas`
--

LOCK TABLES `relacion_bombas` WRITE;
/*!40000 ALTER TABLE `relacion_bombas` DISABLE KEYS */;
/*!40000 ALTER TABLE `relacion_bombas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacion_clima`
--

DROP TABLE IF EXISTS `relacion_clima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relacion_clima` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo_clima` int(11) NOT NULL,
  `codigo_variables` int(11) NOT NULL,
  `rb_temp` int(11) NOT NULL,
  `codigo_tp_temp` int(11) NOT NULL,
  `rb_humedad` int(11) DEFAULT -1,
  `codigo_tp_humedad` int(11) DEFAULT -1,
  `rb_co2` int(11) DEFAULT -1,
  `codigo_tp_co2` int(11) DEFAULT -1,
  `rb_estado` int(11) DEFAULT -1,
  `codigo_tp_estado` int(11) DEFAULT -1,
  `rb_valvula` int(11) DEFAULT -1,
  `codigo_tp_valvula` int(11) DEFAULT -1,
  `rb_fancoil` int(11) DEFAULT -1,
  `codigo_tp_fancoil` int(11) DEFAULT -1,
  `codigo_tp_vel1` int(11) DEFAULT -1,
  `codigo_tp_vel2` int(11) DEFAULT -1,
  `codigo_tp_vel3` int(11) DEFAULT -1,
  `codigo_sleep` int(11) DEFAULT -1,
  PRIMARY KEY (`id`),
  KEY `codigo_clima` (`codigo_clima`),
  CONSTRAINT `relacion_clima_ibfk_1` FOREIGN KEY (`codigo_clima`) REFERENCES `clima` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacion_clima`
--

LOCK TABLES `relacion_clima` WRITE;
/*!40000 ALTER TABLE `relacion_clima` DISABLE KEYS */;
INSERT INTO `relacion_clima` VALUES (1,'2022-04-26 06:50:56',1,3,55,1,-1,-1,-1,-1,2,55,2,9,-1,-1,-1,-1,-1,-1),(2,'2022-04-26 06:50:56',2,5,56,2,-1,-1,-1,-1,11,57,11,18,-1,-1,-1,-1,-1,-1),(3,'2022-04-26 06:50:56',3,7,57,3,-1,-1,-1,-1,20,59,20,27,-1,-1,-1,-1,-1,-1),(4,'2022-04-26 06:50:56',4,9,58,4,-1,-1,-1,-1,29,61,29,36,-1,-1,-1,-1,-1,-1),(5,'2022-04-26 06:50:56',5,11,59,5,-1,-1,-1,-1,38,63,-1,-1,-1,-1,-1,-1,-1,-1),(6,'2022-04-26 06:50:56',6,13,60,6,-1,-1,-1,-1,47,65,47,54,-1,-1,-1,-1,-1,-1),(7,'2022-06-05 16:12:03',7,15,68,7,-1,-1,-1,-1,62,70,209,13,-1,-1,-1,-1,-1,-1),(8,'2022-06-05 16:12:04',8,17,73,8,-1,-1,-1,-1,70,79,104,152,-1,-1,-1,-1,-1,-1),(9,'2022-06-05 16:12:04',9,19,74,9,-1,-1,-1,-1,70,78,104,151,-1,-1,-1,-1,-1,-1),(10,'2022-06-05 16:12:05',10,-1,83,10,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(11,'2022-06-05 16:12:05',11,-1,84,11,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(12,'2022-06-05 16:12:06',12,-1,85,12,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(13,'2022-06-05 16:12:06',13,21,119,13,-1,-1,-1,-1,104,113,104,111,-1,-1,-1,-1,-1,-1),(14,'2022-06-23 20:38:40',14,23,174,14,487,2,-1,-1,205,7,205,1,-1,-1,-1,-1,-1,-1),(15,'2022-06-23 20:38:40',15,25,175,15,-1,-1,-1,-1,205,8,205,2,-1,-1,-1,-1,-1,-1),(16,'2022-06-23 20:38:40',16,27,176,16,-1,-1,-1,-1,206,9,205,3,-1,-1,-1,-1,-1,-1),(17,'2022-06-23 20:38:40',17,29,177,17,-1,-1,-1,-1,206,10,205,4,-1,-1,-1,-1,-1,-1),(18,'2022-06-23 20:38:40',18,31,178,18,-1,-1,-1,-1,206,11,205,5,-1,-1,-1,-1,-1,-1),(19,'2022-06-23 20:38:40',19,33,179,19,-1,-1,-1,-1,206,12,205,6,-1,-1,-1,-1,-1,-1),(20,'2022-06-30 07:35:54',20,35,187,20,-1,-1,-1,-1,185,158,211,18,-1,-1,-1,-1,-1,-1),(21,'2022-06-30 07:35:54',21,37,188,21,-1,-1,-1,-1,185,157,211,17,-1,-1,-1,-1,-1,-1),(22,'2022-06-30 07:35:54',22,-1,189,22,-1,-1,-1,-1,-1,-1,209,15,-1,-1,-1,-1,-1,-1),(24,'2022-07-11 22:27:14',23,39,310,25,-1,-1,-1,-1,104,110,104,110,-1,-1,-1,-1,-1,-1);
/*!40000 ALTER TABLE `relacion_clima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacion_consumos`
--

DROP TABLE IF EXISTS `relacion_consumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relacion_consumos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `rb_valor` int(11) NOT NULL,
  `codigo_tp_valor` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `subtipo` int(11) NOT NULL,
  `formula` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacion_consumos`
--

LOCK TABLES `relacion_consumos` WRITE;
/*!40000 ALTER TABLE `relacion_consumos` DISABLE KEYS */;
/*!40000 ALTER TABLE `relacion_consumos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacion_escena_operacion`
--

DROP TABLE IF EXISTS `relacion_escena_operacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relacion_escena_operacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_escena` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_escena` (`codigo_escena`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `rel_esc_ope_ibfk_1` FOREIGN KEY (`codigo_escena`) REFERENCES `escenas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `rel_esc_ope_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=348 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacion_escena_operacion`
--

LOCK TABLES `relacion_escena_operacion` WRITE;
/*!40000 ALTER TABLE `relacion_escena_operacion` DISABLE KEYS */;
INSERT INTO `relacion_escena_operacion` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,4),(5,2,5),(6,3,6),(7,3,7),(8,3,8),(9,4,9),(10,4,10),(11,5,11),(12,5,12),(13,5,13),(14,6,14),(15,6,15),(16,7,16),(17,7,17),(18,7,18),(19,8,19),(20,8,20),(21,9,21),(22,9,22),(23,9,23),(24,10,24),(25,10,25),(26,11,26),(27,11,27),(28,11,28),(29,12,29),(30,12,30),(31,13,31),(32,13,32),(33,13,33),(34,14,34),(35,14,35),(36,15,36),(37,15,37),(38,15,38),(39,16,39),(40,16,40),(41,17,41),(42,17,42),(43,17,43),(44,18,44),(45,18,45),(46,19,46),(47,19,47),(48,19,48),(49,20,49),(50,20,50),(51,21,51),(52,21,52),(53,21,53),(54,22,54),(55,22,55),(56,23,56),(57,23,57),(58,23,58),(59,24,59),(60,24,60),(61,25,61),(62,25,62),(63,26,63),(64,26,64),(65,27,65),(66,27,66),(67,28,67),(68,28,68),(69,29,69),(70,30,70),(71,30,71),(72,31,72),(73,31,73),(74,33,74),(75,33,75),(76,93,76),(77,33,77),(78,33,78),(79,34,79),(80,69,80),(81,69,81),(82,91,82),(83,91,83),(84,35,84),(85,35,85),(86,36,86),(87,36,87),(88,37,88),(89,37,89),(90,38,90),(91,38,91),(92,39,92),(93,39,93),(94,40,94),(95,41,95),(96,41,96),(97,42,97),(98,42,98),(99,44,99),(100,44,100),(101,94,101),(102,44,102),(103,44,103),(104,45,104),(105,78,105),(106,78,106),(107,92,107),(108,92,108),(109,46,109),(110,46,110),(111,47,111),(112,48,112),(113,48,113),(114,48,114),(115,49,115),(116,49,116),(117,49,117),(118,49,118),(119,49,119),(120,50,120),(121,50,121),(122,51,122),(123,51,123),(124,52,124),(125,52,125),(126,53,126),(127,53,127),(128,54,128),(129,54,129),(130,55,130),(131,56,131),(132,56,132),(133,56,133),(134,57,134),(135,57,135),(136,57,136),(137,57,137),(138,57,138),(139,58,139),(140,58,140),(141,59,141),(142,59,142),(143,60,143),(144,60,144),(145,61,145),(146,61,146),(147,62,147),(148,62,148),(149,63,149),(150,63,150),(151,64,151),(152,64,152),(153,65,153),(154,66,154),(155,67,155),(156,68,156),(157,32,157),(158,32,158),(159,70,159),(160,71,160),(161,72,161),(162,72,162),(163,73,163),(164,73,164),(165,74,165),(166,75,166),(167,76,167),(168,77,168),(169,43,169),(170,43,170),(171,79,171),(172,80,172),(173,81,173),(174,81,174),(175,82,175),(176,83,176),(177,83,177),(178,84,178),(179,84,179),(180,85,180),(181,85,181),(182,86,182),(183,87,183),(184,87,184),(185,88,185),(186,88,186),(187,89,187),(188,89,188),(189,90,189),(190,90,190),(191,95,191),(192,95,192),(193,95,193),(194,96,194),(195,96,195),(196,97,196),(197,97,197),(198,97,198),(199,98,199),(200,98,200),(201,99,201),(202,99,202),(203,99,203),(204,100,204),(205,100,205),(206,101,206),(207,101,207),(208,101,208),(209,102,209),(210,102,210),(211,103,211),(212,103,212),(213,103,213),(214,104,214),(215,104,215),(216,105,216),(217,105,217),(218,105,218),(219,106,219),(220,106,220),(221,107,221),(222,107,222),(223,108,223),(224,108,224),(225,109,225),(226,109,226),(227,110,227),(228,110,228),(229,111,229),(230,111,230),(231,112,231),(232,112,232),(233,113,233),(234,113,234),(235,114,235),(236,114,236),(237,115,237),(238,115,238),(239,116,239),(240,116,240),(241,118,241),(242,118,242),(243,117,243),(244,117,244),(245,118,102),(246,118,246),(247,119,247),(248,119,248),(249,120,249),(250,120,250),(251,121,251),(252,121,252),(253,122,253),(254,122,254),(255,122,255),(256,123,256),(257,123,257),(258,123,258),(259,123,259),(260,123,260),(261,124,261),(262,124,262),(263,125,263),(264,125,264),(265,126,265),(266,126,266),(267,127,267),(268,127,268),(269,128,269),(270,128,270),(271,129,271),(272,129,272),(273,130,273),(274,130,274),(275,131,275),(276,131,276),(277,132,277),(278,132,278),(279,132,279),(280,133,280),(281,133,281),(282,134,282),(283,134,283),(284,134,284),(285,135,285),(286,135,286),(287,136,287),(288,136,288),(289,245,289),(290,245,290),(291,245,291),(292,245,292),(293,246,293),(294,246,294),(295,246,295),(296,246,296),(297,247,297),(298,247,298),(299,247,299),(300,247,300),(301,251,301),(302,251,302),(303,252,303),(304,252,304),(305,253,305),(306,253,306),(307,254,307),(308,254,308),(309,255,309),(310,255,310),(311,256,311),(312,256,312),(313,257,313),(314,257,314),(315,261,315),(316,261,316),(317,262,317),(318,262,318),(319,263,319),(320,263,320),(321,267,321),(322,267,322),(323,271,323),(324,271,324),(325,272,325),(326,272,326),(327,273,327),(328,273,328),(329,277,329),(330,277,330),(331,167,331),(332,167,332),(333,139,333),(334,139,334),(335,139,335),(336,139,336),(337,148,337),(338,148,338),(339,148,339),(340,141,340),(341,141,341),(342,143,342),(343,143,343),(344,142,344),(345,142,345),(346,172,346),(347,172,347);
/*!40000 ALTER TABLE `relacion_escena_operacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacion_estor`
--

DROP TABLE IF EXISTS `relacion_estor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relacion_estor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo_estor` int(11) NOT NULL,
  `rb` int(11) NOT NULL,
  `codigo_tp_estado` int(11) DEFAULT NULL,
  `codigo_tp_consigna` int(11) DEFAULT NULL,
  `rb_e` int(11) DEFAULT -1,
  `codigo_tp_e_estado` int(11) DEFAULT -1,
  `codigo_tp_e_consigna` int(11) DEFAULT -1,
  PRIMARY KEY (`id`),
  KEY `codigo_estor` (`codigo_estor`),
  CONSTRAINT `relacion_estor_ibfk_1` FOREIGN KEY (`codigo_estor`) REFERENCES `estor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacion_estor`
--

LOCK TABLES `relacion_estor` WRITE;
/*!40000 ALTER TABLE `relacion_estor` DISABLE KEYS */;
INSERT INTO `relacion_estor` VALUES (1,'2022-06-20 20:52:40',1,132,1,2,131,-1,2),(2,'2022-06-20 20:52:48',2,134,3,4,133,-1,4),(3,'2022-06-20 20:52:57',4,136,5,6,135,-1,6),(4,'2022-06-20 20:53:06',3,138,7,8,137,-1,8),(5,'2022-06-20 20:53:13',5,140,9,10,139,-1,10),(6,'2022-06-20 20:53:18',6,142,11,12,141,-1,12),(7,'2022-06-20 20:53:26',7,144,13,14,143,-1,14),(8,'2022-06-20 20:53:32',8,146,15,16,145,-1,16),(9,'2022-06-20 20:53:38',9,148,17,18,147,-1,18),(10,'2022-06-20 20:53:44',10,150,19,20,149,-1,20),(11,'2022-06-22 22:54:02',11,152,21,22,151,-1,22),(12,'2022-06-22 22:54:13',12,154,23,24,153,-1,24),(13,'2022-07-02 14:10:46',13,204,25,26,203,-1,25),(14,'2022-08-29 11:39:23',14,347,27,28,346,-1,26),(15,'2022-09-22 16:07:10',15,525,29,30,524,-1,27);
/*!40000 ALTER TABLE `relacion_estor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacion_grupo_accesos`
--

DROP TABLE IF EXISTS `relacion_grupo_accesos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relacion_grupo_accesos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_accesos` int(11) NOT NULL,
  `codigo_grupo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_accesos` (`codigo_accesos`),
  KEY `codigo_grupo` (`codigo_grupo`),
  CONSTRAINT `relacion_grupo_accesos_ibfk_1` FOREIGN KEY (`codigo_accesos`) REFERENCES `accesos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relacion_grupo_accesos_ibfk_2` FOREIGN KEY (`codigo_grupo`) REFERENCES `grupo_accesos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacion_grupo_accesos`
--

LOCK TABLES `relacion_grupo_accesos` WRITE;
/*!40000 ALTER TABLE `relacion_grupo_accesos` DISABLE KEYS */;
/*!40000 ALTER TABLE `relacion_grupo_accesos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacion_grupo_bombas`
--

DROP TABLE IF EXISTS `relacion_grupo_bombas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relacion_grupo_bombas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_bombas` int(11) NOT NULL,
  `codigo_grupo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_bombas` (`codigo_bombas`),
  KEY `codigo_grupo` (`codigo_grupo`),
  CONSTRAINT `relacion_grupo_bombas_ibfk_1` FOREIGN KEY (`codigo_bombas`) REFERENCES `bombas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relacion_grupo_bombas_ibfk_2` FOREIGN KEY (`codigo_grupo`) REFERENCES `grupo_bombas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacion_grupo_bombas`
--

LOCK TABLES `relacion_grupo_bombas` WRITE;
/*!40000 ALTER TABLE `relacion_grupo_bombas` DISABLE KEYS */;
/*!40000 ALTER TABLE `relacion_grupo_bombas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacion_grupo_luces`
--

DROP TABLE IF EXISTS `relacion_grupo_luces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relacion_grupo_luces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_luces` int(11) NOT NULL,
  `codigo_grupo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_luces` (`codigo_luces`),
  KEY `codigo_grupo` (`codigo_grupo`),
  CONSTRAINT `relacion_grupo_luces_ibfk_1` FOREIGN KEY (`codigo_luces`) REFERENCES `luces` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relacion_grupo_luces_ibfk_2` FOREIGN KEY (`codigo_grupo`) REFERENCES `grupo_luces` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacion_grupo_luces`
--

LOCK TABLES `relacion_grupo_luces` WRITE;
/*!40000 ALTER TABLE `relacion_grupo_luces` DISABLE KEYS */;
/*!40000 ALTER TABLE `relacion_grupo_luces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacion_home_escena`
--

DROP TABLE IF EXISTS `relacion_home_escena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relacion_home_escena` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_home` int(11) NOT NULL,
  `codigo_escena` int(11) NOT NULL,
  `tiempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_home` (`codigo_home`),
  KEY `codigo_escena` (`codigo_escena`),
  CONSTRAINT `rel_home_esc_ibfk_1` FOREIGN KEY (`codigo_home`) REFERENCES `home_estado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rel_home_esc_ibfk_2` FOREIGN KEY (`codigo_escena`) REFERENCES `escenas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacion_home_escena`
--

LOCK TABLES `relacion_home_escena` WRITE;
/*!40000 ALTER TABLE `relacion_home_escena` DISABLE KEYS */;
/*!40000 ALTER TABLE `relacion_home_escena` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacion_home_operacion`
--

DROP TABLE IF EXISTS `relacion_home_operacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relacion_home_operacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_home` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `tiempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_home` (`codigo_home`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `rel_home_ope_ibfk_1` FOREIGN KEY (`codigo_home`) REFERENCES `home_estado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rel_home_ope_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacion_home_operacion`
--

LOCK TABLES `relacion_home_operacion` WRITE;
/*!40000 ALTER TABLE `relacion_home_operacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `relacion_home_operacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacion_iot`
--

DROP TABLE IF EXISTS `relacion_iot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relacion_iot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo_iot` int(11) NOT NULL,
  `rb_e_estado` int(11) NOT NULL,
  `codigo_tp_e_estado` int(11) NOT NULL,
  `rb_s_estado` int(11) NOT NULL,
  `codigo_tp_s_estado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_iot` (`codigo_iot`),
  CONSTRAINT `relacion_iot_ibfk_1` FOREIGN KEY (`codigo_iot`) REFERENCES `iot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacion_iot`
--

LOCK TABLES `relacion_iot` WRITE;
/*!40000 ALTER TABLE `relacion_iot` DISABLE KEYS */;
INSERT INTO `relacion_iot` VALUES (1,'2022-04-04 10:02:56',1,1,6,2,6),(2,'2022-04-04 10:02:56',2,1,7,2,7),(3,'2022-04-04 10:02:56',3,1,8,2,8),(4,'2022-04-04 10:02:56',4,10,20,11,15),(5,'2022-04-04 10:02:56',5,10,21,11,16),(6,'2022-04-04 10:02:56',6,10,22,11,17),(7,'2022-04-04 10:02:56',7,19,34,20,24),(8,'2022-04-04 10:02:56',8,19,35,20,25),(9,'2022-04-04 10:02:56',9,19,36,20,26),(10,'2022-04-04 10:02:56',10,28,48,29,33),(11,'2022-04-04 10:02:56',11,28,49,29,34),(12,'2022-04-04 10:02:56',12,28,50,29,35),(13,'2022-04-04 10:02:56',13,37,62,38,42),(14,'2022-04-04 10:02:56',14,37,63,38,43),(15,'2022-04-04 10:02:56',15,37,64,38,44),(16,'2022-04-04 10:02:56',16,46,76,47,51),(17,'2022-04-04 10:02:56',17,46,77,47,52),(18,'2022-04-04 10:02:56',18,46,78,47,53),(19,'2022-04-26 09:51:26',19,61,95,62,71),(20,'2022-06-05 18:12:06',20,100,129,101,106),(21,'2022-06-05 18:12:06',21,100,130,101,107),(22,'2022-06-05 18:12:09',22,100,131,101,108),(23,'2022-06-05 18:12:09',23,100,132,101,109),(24,'2022-06-23 22:38:56',24,180,158,181,131),(25,'2022-06-23 22:38:56',25,180,159,181,132),(26,'2022-06-23 22:38:56',26,180,160,181,133),(27,'2022-06-23 22:38:56',27,180,161,181,134),(28,'2022-06-23 22:38:56',28,180,162,181,135),(29,'2022-06-26 23:38:25',29,1,85,2,56),(30,'2022-06-26 23:38:25',30,10,86,11,58),(31,'2022-06-26 23:38:25',31,19,87,20,60),(32,'2022-06-26 23:38:25',32,28,88,29,62),(33,'2022-06-26 23:38:25',33,61,96,62,72),(34,'2022-06-26 23:38:25',34,46,90,47,66),(35,'2022-06-26 23:38:25',35,37,89,38,64),(36,'2022-09-08 14:26:17',36,314,205,315,185),(37,'2022-09-09 07:54:45',37,311,234,312,194);
/*!40000 ALTER TABLE `relacion_iot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacion_luces`
--

DROP TABLE IF EXISTS `relacion_luces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relacion_luces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo_luces` int(11) NOT NULL,
  `rb_e_estado` int(11) NOT NULL,
  `codigo_tp_e_estado` int(11) NOT NULL,
  `rb_s_estado` int(11) NOT NULL,
  `codigo_tp_s_estado` int(11) NOT NULL,
  `rb_dali1` int(11) DEFAULT -1,
  `codigo_tp_int1` int(11) DEFAULT -1,
  `codigo_tp_rgb1` int(11) DEFAULT -1,
  `rb_dali2` int(11) DEFAULT -1,
  `codigo_tp_int2` int(11) DEFAULT -1,
  `codigo_tp_rgb2` int(11) DEFAULT -1,
  `rb_dali3` int(11) DEFAULT -1,
  `codigo_tp_int3` int(11) DEFAULT -1,
  `codigo_tp_rgb3` int(11) DEFAULT -1,
  `rb_dali4` int(11) DEFAULT -1,
  `codigo_tp_temp` int(11) DEFAULT -1,
  `rb_dali5` int(11) DEFAULT -1,
  `codigo_tp_int5` int(11) DEFAULT -1,
  PRIMARY KEY (`id`),
  KEY `codigo_luces` (`codigo_luces`),
  CONSTRAINT `relacion_luces_ibfk_1` FOREIGN KEY (`codigo_luces`) REFERENCES `luces` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacion_luces`
--

LOCK TABLES `relacion_luces` WRITE;
/*!40000 ALTER TABLE `relacion_luces` DISABLE KEYS */;
INSERT INTO `relacion_luces` VALUES (1,'2022-04-04 09:50:37',1,1,1,2,1,4,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(2,'2022-04-04 09:50:37',2,1,2,2,2,5,2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(3,'2022-04-04 09:50:37',3,1,3,2,3,6,3,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(4,'2022-04-04 09:50:37',4,1,4,2,4,7,4,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(5,'2022-04-04 09:50:37',5,1,5,2,5,8,5,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(6,'2022-04-04 09:50:37',6,10,15,11,10,14,6,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(7,'2022-04-04 09:50:37',7,10,16,11,11,15,7,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(8,'2022-04-04 09:50:37',8,10,17,11,12,16,8,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(9,'2022-04-04 09:50:37',9,10,18,11,13,17,9,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(10,'2022-04-04 09:50:37',10,10,19,11,14,18,10,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(11,'2022-04-04 09:50:37',11,19,29,20,19,23,11,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(12,'2022-04-04 09:50:37',12,19,30,20,20,24,12,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(13,'2022-04-04 09:50:37',13,19,31,20,21,25,13,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(14,'2022-04-04 09:50:37',14,19,32,20,22,26,14,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(15,'2022-04-04 09:50:37',15,19,33,20,23,27,15,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(16,'2022-04-04 09:50:37',16,28,43,29,28,32,16,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(17,'2022-04-04 09:50:37',17,28,44,29,29,33,17,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(18,'2022-04-04 09:50:37',18,28,45,29,30,34,18,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(19,'2022-04-04 09:50:37',19,28,46,29,31,35,19,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(20,'2022-04-04 09:50:37',20,28,47,29,32,36,20,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(21,'2022-04-04 09:50:37',21,37,57,38,37,41,21,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(22,'2022-04-04 09:50:37',22,37,58,38,38,42,22,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(23,'2022-04-04 09:50:37',23,37,59,38,39,43,23,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(24,'2022-04-04 09:50:37',24,37,60,38,40,44,24,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(25,'2022-04-04 09:50:37',25,37,61,38,41,45,25,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(26,'2022-04-04 09:50:37',26,46,71,47,46,50,26,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(27,'2022-04-04 09:50:37',27,46,72,47,47,51,27,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(28,'2022-04-04 09:50:37',28,46,73,47,48,52,28,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(29,'2022-04-04 09:50:37',29,46,74,47,49,53,29,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(30,'2022-04-04 09:50:37',30,46,75,47,50,54,30,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(31,'2022-04-26 09:16:49',31,61,91,62,67,65,31,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(32,'2022-04-26 09:16:49',32,61,92,62,68,66,32,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(33,'2022-04-26 09:16:49',33,61,93,62,69,67,33,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(34,'2022-04-26 09:16:49',34,69,97,70,73,75,34,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(35,'2022-04-26 09:16:49',35,69,98,70,74,76,35,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(36,'2022-04-26 09:16:49',36,69,99,70,75,77,36,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(37,'2022-04-26 09:16:49',37,69,100,70,76,78,37,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(38,'2022-04-26 09:16:49',38,69,101,70,77,79,38,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(39,'2022-04-26 09:16:49',39,-1,-1,70,80,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(40,'2022-06-05 18:11:33',40,80,104,81,81,86,39,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(41,'2022-06-05 18:11:33',41,80,105,81,82,87,40,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(42,'2022-06-05 18:11:33',42,80,106,81,83,88,41,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(43,'2022-06-05 18:11:33',43,80,107,81,84,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(44,'2022-06-05 18:11:34',44,80,108,81,85,89,42,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(45,'2022-06-05 18:11:34',45,80,109,81,86,90,43,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(46,'2022-06-05 18:11:34',46,80,110,81,87,91,44,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(47,'2022-06-05 18:11:34',47,80,111,81,88,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(48,'2022-06-05 18:11:35',48,80,112,81,89,92,45,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(49,'2022-06-05 18:11:35',49,80,113,81,90,93,46,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(50,'2022-06-05 18:11:35',50,80,114,81,91,94,47,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(51,'2022-06-05 18:11:35',51,95,115,96,92,98,48,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(52,'2022-06-05 18:11:35',52,95,116,96,93,99,49,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(53,'2022-06-05 18:11:36',53,100,117,101,94,107,50,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(54,'2022-06-05 18:11:36',54,100,120,101,97,110,53,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(55,'2022-06-05 18:11:36',55,100,121,101,98,111,54,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(56,'2022-06-05 18:11:36',56,100,118,101,95,108,51,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(57,'2022-06-05 18:11:36',57,100,119,101,96,109,52,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(58,'2022-06-05 18:11:37',58,100,122,101,99,112,55,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(59,'2022-06-05 18:11:37',59,100,123,101,100,113,56,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(60,'2022-06-05 18:11:37',60,100,124,101,101,114,57,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(61,'2022-06-05 18:11:38',61,100,125,101,102,115,58,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(62,'2022-06-05 18:11:38',62,100,126,101,103,116,59,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(63,'2022-06-05 18:11:38',63,100,127,101,104,117,60,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(64,'2022-06-05 18:11:38',64,100,128,101,105,118,61,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(65,'2022-06-23 22:38:41',65,155,142,156,115,158,62,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(66,'2022-06-23 22:38:41',66,155,143,156,116,159,63,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(67,'2022-06-23 22:38:41',67,155,144,156,117,160,64,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(68,'2022-06-23 22:38:41',68,155,145,156,118,161,65,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(69,'2022-06-23 22:38:41',69,155,146,156,119,162,66,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(70,'2022-06-23 22:38:41',70,155,147,156,120,163,67,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(71,'2022-06-23 22:38:41',71,155,148,156,121,164,68,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(72,'2022-06-23 22:38:41',72,155,149,156,122,165,69,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(73,'2022-06-23 22:38:41',73,155,150,156,123,166,70,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(74,'2022-06-23 22:38:41',74,155,151,156,124,167,71,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(75,'2022-06-23 22:38:41',75,155,152,156,125,168,72,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(76,'2022-06-23 22:38:41',76,155,153,156,126,169,73,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(77,'2022-06-23 22:38:41',77,155,154,156,127,170,74,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(78,'2022-06-23 22:38:41',78,155,155,156,128,171,75,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(79,'2022-06-23 22:38:41',79,155,156,156,129,172,76,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(80,'2022-06-23 22:38:41',80,155,157,156,130,173,77,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(81,'2022-06-23 22:38:54',81,180,164,181,136,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(82,'2022-06-23 22:38:54',82,180,163,181,137,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(83,'2022-06-23 22:38:54',83,180,165,181,138,183,78,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(84,'2022-06-23 22:39:03',84,184,166,185,139,191,79,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(85,'2022-06-23 22:39:03',85,184,167,185,140,192,80,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(86,'2022-06-23 22:39:03',86,184,168,185,141,193,81,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(87,'2022-06-23 22:39:03',87,184,169,185,142,194,82,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(88,'2022-06-23 22:39:03',88,184,170,185,143,195,83,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(89,'2022-06-23 22:39:03',89,184,171,185,144,196,84,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(90,'2022-06-23 22:39:03',90,184,172,185,145,197,85,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(91,'2022-06-23 22:39:03',91,184,173,185,146,198,86,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(92,'2022-06-23 22:39:03',92,184,174,185,147,199,87,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(93,'2022-06-23 22:39:03',93,184,175,185,148,200,88,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(94,'2022-06-23 22:39:03',94,184,176,185,149,201,89,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(95,'2022-06-23 22:39:03',95,184,177,185,150,202,90,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(96,'2022-07-15 06:35:53',96,-1,-1,38,175,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(97,'2022-07-15 06:35:53',97,-1,-1,38,176,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(98,'2022-07-15 06:35:54',98,321,191,322,177,326,93,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(99,'2022-07-15 06:35:54',99,321,192,322,178,327,94,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(100,'2022-07-15 06:35:54',100,321,193,322,179,328,95,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(101,'2022-07-15 06:35:54',101,321,194,322,180,329,96,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(102,'2022-07-15 06:35:54',102,321,195,322,181,330,97,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(103,'2022-07-15 06:35:54',103,321,196,322,182,331,98,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(104,'2022-07-15 06:35:57',104,499,228,312,159,522,119,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(105,'2022-07-15 06:35:57',105,499,229,312,160,523,120,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(106,'2022-07-15 06:36:00',106,314,199,315,165,492,106,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(107,'2022-07-15 06:36:00',107,314,200,315,166,502,107,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(108,'2022-07-15 06:36:00',108,314,201,315,167,503,108,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(109,'2022-07-15 06:36:00',109,314,202,315,168,504,109,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(110,'2022-07-15 06:36:00',110,314,169,315,169,488,99,100,489,101,102,490,103,104,491,105,-1,-1),(111,'2022-07-15 06:36:00',111,314,170,315,170,506,111,112,507,113,114,508,115,116,509,117,-1,-1),(112,'2022-08-18 10:42:40',112,339,36,338,23,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(113,'2022-08-18 10:47:08',113,341,44,340,27,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(114,'2022-08-18 10:50:56',114,343,52,342,31,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(115,'2022-08-18 10:57:34',115,345,61,344,36,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(116,'2022-08-30 09:22:14',116,314,206,315,186,505,110,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(117,'2022-09-08 15:12:57',117,499,220,500,189,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(118,'2022-09-08 15:30:26',118,499,221,500,190,512,118,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1),(119,'2022-09-08 15:56:04',119,499,223,500,192,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1);
/*!40000 ALTER TABLE `relacion_luces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacion_multimedia`
--

DROP TABLE IF EXISTS `relacion_multimedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relacion_multimedia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo_multimedia` int(11) NOT NULL,
  `rb_s_abrir` int(11) DEFAULT -1,
  `codigo_tp_s_abrir` int(11) DEFAULT -1,
  `rb_s_cerrar` int(11) DEFAULT -1,
  `codigo_tp_s_cerrar` int(11) DEFAULT -1,
  `rb_e_abrir` int(11) DEFAULT -1,
  `codigo_tp_e_abrir` int(11) DEFAULT -1,
  `rb_e_cerrar` int(11) DEFAULT -1,
  `codigo_tp_e_cerrar` int(11) DEFAULT -1,
  PRIMARY KEY (`id`),
  KEY `codigo_multimedia` (`codigo_multimedia`),
  CONSTRAINT `relacion_multimedia_ibfk_1` FOREIGN KEY (`codigo_multimedia`) REFERENCES `multimedia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacion_multimedia`
--

LOCK TABLES `relacion_multimedia` WRITE;
/*!40000 ALTER TABLE `relacion_multimedia` DISABLE KEYS */;
INSERT INTO `relacion_multimedia` VALUES (1,'2022-08-30 09:24:18',1,181,153,181,154,180,180,180,181),(2,'2022-08-30 09:24:18',2,70,155,70,156,69,187,69,188);
/*!40000 ALTER TABLE `relacion_multimedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacion_ot_ambiente`
--

DROP TABLE IF EXISTS `relacion_ot_ambiente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relacion_ot_ambiente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_ot` int(11) NOT NULL,
  `codigo_ambiente` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_ot` (`codigo_ot`),
  KEY `codigo_ambiente` (`codigo_ambiente`),
  CONSTRAINT `rel_ot_amb_ibfk_1` FOREIGN KEY (`codigo_ot`) REFERENCES `ot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rel_ot_amb_ibfk_2` FOREIGN KEY (`codigo_ambiente`) REFERENCES `ambiente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacion_ot_ambiente`
--

LOCK TABLES `relacion_ot_ambiente` WRITE;
/*!40000 ALTER TABLE `relacion_ot_ambiente` DISABLE KEYS */;
/*!40000 ALTER TABLE `relacion_ot_ambiente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacion_ot_home`
--

DROP TABLE IF EXISTS `relacion_ot_home`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relacion_ot_home` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_ot` int(11) NOT NULL,
  `codigo_home` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_ot` (`codigo_ot`),
  KEY `codigo_home` (`codigo_home`),
  CONSTRAINT `rel_ot_home_ibfk_1` FOREIGN KEY (`codigo_ot`) REFERENCES `ot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rel_ot_home_ibfk_2` FOREIGN KEY (`codigo_home`) REFERENCES `home_estado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacion_ot_home`
--

LOCK TABLES `relacion_ot_home` WRITE;
/*!40000 ALTER TABLE `relacion_ot_home` DISABLE KEYS */;
/*!40000 ALTER TABLE `relacion_ot_home` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacion_ot_rutina`
--

DROP TABLE IF EXISTS `relacion_ot_rutina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relacion_ot_rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_ot` int(11) NOT NULL,
  `codigo_rutina` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_ot` (`codigo_ot`),
  KEY `codigo_rutina` (`codigo_rutina`),
  CONSTRAINT `rel_ot_rut_ibfk_1` FOREIGN KEY (`codigo_ot`) REFERENCES `ot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rel_ot_rut_ibfk_2` FOREIGN KEY (`codigo_rutina`) REFERENCES `rutina` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacion_ot_rutina`
--

LOCK TABLES `relacion_ot_rutina` WRITE;
/*!40000 ALTER TABLE `relacion_ot_rutina` DISABLE KEYS */;
/*!40000 ALTER TABLE `relacion_ot_rutina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacion_persianas`
--

DROP TABLE IF EXISTS `relacion_persianas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relacion_persianas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo_persianas` int(11) NOT NULL,
  `rb` int(11) NOT NULL,
  `codigo_tp_estado` int(11) DEFAULT NULL,
  `codigo_tp_consigna` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_persianas` (`codigo_persianas`),
  CONSTRAINT `relacion_persianas_ibfk_1` FOREIGN KEY (`codigo_persianas`) REFERENCES `persianas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacion_persianas`
--

LOCK TABLES `relacion_persianas` WRITE;
/*!40000 ALTER TABLE `relacion_persianas` DISABLE KEYS */;
INSERT INTO `relacion_persianas` VALUES (1,'2022-06-20 20:56:26',1,122,1,2),(2,'2022-06-20 20:56:32',2,123,3,4),(3,'2022-06-20 20:56:37',3,124,5,6),(4,'2022-06-20 20:56:42',4,125,7,8),(5,'2022-06-20 20:56:48',5,126,9,10),(6,'2022-06-20 20:56:54',6,127,11,12),(7,'2022-06-20 20:57:00',7,128,13,14),(8,'2022-06-20 20:57:06',8,129,15,16),(9,'2022-06-20 20:57:13',9,130,17,18);
/*!40000 ALTER TABLE `relacion_persianas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacion_piscina`
--

DROP TABLE IF EXISTS `relacion_piscina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relacion_piscina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo_piscina` int(11) NOT NULL,
  `rb_temp` int(11) NOT NULL,
  `codigo_tp_temp` int(11) NOT NULL,
  `rb_ph` int(11) DEFAULT -1,
  `codigo_tp_ph` int(11) DEFAULT -1,
  `rb_nivel` int(11) DEFAULT -1,
  `codigo_tp_nivel` int(11) DEFAULT -1,
  `rb_redox` int(11) DEFAULT -1,
  `codigo_tp_redox` int(11) DEFAULT -1,
  PRIMARY KEY (`id`),
  KEY `codigo_piscina` (`codigo_piscina`),
  CONSTRAINT `relacion_piscina_ibfk_1` FOREIGN KEY (`codigo_piscina`) REFERENCES `piscina` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacion_piscina`
--

LOCK TABLES `relacion_piscina` WRITE;
/*!40000 ALTER TABLE `relacion_piscina` DISABLE KEYS */;
/*!40000 ALTER TABLE `relacion_piscina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacion_rb`
--

DROP TABLE IF EXISTS `relacion_rb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relacion_rb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo_rb` int(11) DEFAULT NULL,
  `subdriver` varchar(30) DEFAULT NULL,
  `numrb` int(11) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `tiempo` int(11) DEFAULT NULL,
  `idborna` varchar(30) DEFAULT NULL,
  `relaciontpdesdehasta` varchar(20) DEFAULT NULL,
  `puertoescucha` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_rb` (`codigo_rb`),
  CONSTRAINT `relacion_rb_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=370 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacion_rb`
--

LOCK TABLES `relacion_rb` WRITE;
/*!40000 ALTER TABLE `relacion_rb` DISABLE KEYS */;
INSERT INTO `relacion_rb` VALUES (1,'2022-04-02 08:48:28',1,'ED',1,'1',1,NULL,NULL,NULL),(2,'2022-04-02 08:48:34',1,'ED',2,'1',1,NULL,NULL,NULL),(3,'2022-04-02 08:48:39',1,'ED',3,'1',1,NULL,NULL,NULL),(4,'2022-04-02 08:48:43',1,'ED',4,'1',1,NULL,NULL,NULL),(5,'2022-04-03 12:09:47',9,'Pulsador',1,'1',1,NULL,NULL,NULL),(6,'2022-04-03 12:11:36',10,'ED',1,'1',1,NULL,NULL,NULL),(7,'2022-04-03 12:11:42',10,'ED',2,'1',1,NULL,NULL,NULL),(8,'2022-04-03 12:11:46',10,'ED',3,'1',1,NULL,NULL,NULL),(9,'2022-04-03 12:11:50',10,'ED',4,'1',1,NULL,NULL,NULL),(10,'2022-04-03 12:12:02',13,'Pulsador',1,'1',1,NULL,NULL,NULL),(11,'2022-04-03 21:06:51',19,'ED',1,'1',1,NULL,NULL,NULL),(12,'2022-04-03 21:06:57',19,'ED',2,'1',1,NULL,NULL,NULL),(13,'2022-04-03 21:07:00',19,'ED',3,'1',1,NULL,NULL,NULL),(14,'2022-04-03 21:07:05',19,'ED',4,'1',1,NULL,NULL,NULL),(15,'2022-04-03 21:07:16',22,'Pulsador',1,'1',1,NULL,NULL,NULL),(16,'2022-04-03 21:47:59',28,'ED',1,'1',1,NULL,NULL,NULL),(17,'2022-04-03 21:48:03',28,'ED',2,'1',1,NULL,NULL,NULL),(18,'2022-04-03 21:48:10',28,'ED',3,'1',1,NULL,NULL,NULL),(19,'2022-04-03 21:48:15',28,'ED',4,'1',1,NULL,NULL,NULL),(20,'2022-04-03 21:48:24',31,'Pulsador',1,'1',1,NULL,NULL,NULL),(21,'2022-04-03 22:08:49',37,'ED',1,'1',1,NULL,NULL,NULL),(22,'2022-04-03 22:08:54',37,'ED',2,'1',1,NULL,NULL,NULL),(23,'2022-04-03 22:08:59',37,'ED',3,'1',1,NULL,NULL,NULL),(24,'2022-04-03 22:09:03',37,'ED',4,'1',1,NULL,NULL,NULL),(25,'2022-04-03 22:09:14',40,'Pulsador',1,'1',1,NULL,NULL,NULL),(26,'2022-04-03 22:21:35',46,'ED',1,'1',1,NULL,NULL,NULL),(27,'2022-04-03 22:21:40',46,'ED',2,'1',1,NULL,NULL,NULL),(28,'2022-04-03 22:21:44',46,'ED',3,'1',1,NULL,NULL,NULL),(29,'2022-04-03 22:21:51',46,'ED',4,'1',1,NULL,NULL,NULL),(30,'2022-04-03 22:22:01',49,'Pulsador',1,'1',1,NULL,NULL,NULL),(31,'2022-04-25 08:25:14',55,'DS18B20',1,'1',30,'28940679a201034b',NULL,NULL),(32,'2022-04-25 09:07:53',56,'DS18B20',1,'1',30,'28a76879970103a7',NULL,NULL),(33,'2022-04-25 09:33:42',57,'DS18B20',1,'1',30,'2826e379a201032a',NULL,NULL),(34,'2022-04-25 10:00:51',58,'DS18B20',1,'1',30,'286c9779a20103e2',NULL,NULL),(35,'2022-04-25 10:14:19',59,'DS18B20',1,'1',30,'28838479a20103dd',NULL,NULL),(36,'2022-04-25 10:27:29',60,'DS18B20',1,'1',30,'288aff79a2010356',NULL,NULL),(37,'2022-04-25 10:46:02',61,'ED',1,'1',1,NULL,NULL,NULL),(38,'2022-04-25 10:46:08',61,'ED',2,'1',1,NULL,NULL,NULL),(39,'2022-04-25 10:46:12',61,'ED',3,'1',1,NULL,NULL,NULL),(40,'2022-04-25 10:46:24',64,'Pulsador',1,'1',1,NULL,NULL,NULL),(41,'2022-04-25 11:06:11',68,'DS18B20',1,'1',30,'28b36a79a2010348',NULL,NULL),(42,'2022-04-25 11:21:23',69,'ED',1,'1',1,NULL,NULL,NULL),(43,'2022-04-25 11:21:30',69,'ED',2,'1',1,NULL,NULL,NULL),(44,'2022-04-25 11:21:50',72,'Pulsador',1,'1',1,NULL,NULL,NULL),(45,'2022-04-26 08:27:34',73,'DS18B20',1,'1',30,'28b87c79a2010350',NULL,NULL),(46,'2022-04-26 08:27:44',74,'DS18B20',1,'1',30,'28227779a201035e',NULL,NULL),(47,'2022-05-10 09:46:16',80,'ED',1,'1',1,NULL,NULL,NULL),(48,'2022-05-10 10:09:44',83,'DS18B20',1,'1',30,'2800b179a2010338',NULL,NULL),(49,'2022-05-10 10:10:21',84,'DS18B20',1,'1',30,'28a8b579a20103da',NULL,NULL),(50,'2022-05-10 10:10:29',85,'DS18B20',1,'1',30,'28e18179a20103a2',NULL,NULL),(51,'2022-05-29 23:07:58',95,'ED',1,'1',1,NULL,NULL,NULL),(52,'2022-06-03 15:24:02',100,'ED',1,'1',1,NULL,NULL,NULL),(53,'2022-06-03 15:24:10',100,'ED',2,'1',1,NULL,NULL,NULL),(54,'2022-06-03 15:27:05',103,'ED',1,'1',1,NULL,NULL,NULL),(55,'2022-06-03 15:27:24',103,'ED',2,'1',1,NULL,NULL,NULL),(56,'2022-06-03 15:27:40',106,'Pulsador',1,'1',1,NULL,NULL,NULL),(57,'2022-06-04 18:28:20',119,'DS18B20',1,'1',30,'28268979a2010386',NULL,NULL),(58,'2022-06-20 19:19:31',131,'Somfy',1,'1',1,NULL,NULL,NULL),(59,'2022-06-20 19:19:38',133,'Somfy',1,'1',1,NULL,NULL,NULL),(60,'2022-06-20 19:19:46',135,'Somfy',1,'1',1,NULL,NULL,NULL),(61,'2022-06-20 19:20:56',137,'Somfy',1,'1',1,NULL,NULL,NULL),(62,'2022-06-20 19:21:02',139,'Somfy',1,'1',1,NULL,NULL,NULL),(63,'2022-06-20 19:21:09',141,'Somfy',1,'1',1,NULL,NULL,NULL),(64,'2022-06-20 19:22:46',143,'Somfy',1,'1',1,NULL,NULL,NULL),(65,'2022-06-20 19:22:54',145,'Somfy',1,'1',1,NULL,NULL,NULL),(66,'2022-06-20 19:23:26',147,'Somfy',1,'1',1,NULL,NULL,NULL),(67,'2022-06-20 19:23:35',149,'Somfy',1,'1',1,NULL,NULL,NULL),(68,'2022-06-22 22:39:49',151,'Somfy',1,'1',1,NULL,NULL,NULL),(69,'2022-06-22 22:43:52',153,'Somfy',1,'1',1,NULL,NULL,NULL),(70,'2022-06-22 22:57:17',155,'ED',1,'1',1,NULL,NULL,NULL),(71,'2022-06-22 23:25:10',174,'DS18B20',1,'1',60,'2847b279a2010386',NULL,NULL),(72,'2022-06-22 23:25:20',175,'DS18B20',1,'1',60,'28527079a2010397',NULL,NULL),(73,'2022-06-22 23:25:28',176,'DS18B20',1,'1',60,'28075979a2010300',NULL,NULL),(74,'2022-06-22 23:25:34',177,'DS18B20',1,'1',60,'28706979a201038a',NULL,NULL),(75,'2022-06-22 23:25:46',178,'DS18B20',1,'1',60,'28096879a20103c7',NULL,NULL),(76,'2022-06-22 23:25:54',179,'DS18B20',1,'1',60,'2890f379a20103e3',NULL,NULL),(77,'2022-06-22 23:46:56',180,'ED',1,'1',1,NULL,NULL,NULL),(78,'2022-06-22 23:47:04',180,'ED',2,'1',1,NULL,NULL,NULL),(79,'2022-06-23 01:18:28',184,'ED',1,'1',1,NULL,NULL,NULL),(80,'2022-06-23 01:27:10',187,'DS18B20',1,'1',60,'28abd679a20103dc',NULL,NULL),(81,'2022-06-23 01:27:25',188,'DS18B20',1,'1',60,'28317079a201030d',NULL,NULL),(82,'2022-06-23 01:27:45',189,'DS18B20',1,'1',60,'287b8079a2010311',NULL,NULL),(83,'2022-06-23 01:28:01',190,'DS18B20',1,'1',60,'28d3c679a2010399',NULL,NULL),(84,'2022-07-02 14:00:52',203,'Somfy',1,'1',10,NULL,NULL,NULL),(85,'2022-07-05 21:32:11',207,'8EDserie_conv',1,'1',1,NULL,NULL,NULL),(86,'2022-07-05 21:35:33',208,'8EDserie_conv',1,'1',1,NULL,NULL,NULL),(87,'2022-07-05 21:50:08',210,'8EDserie_conv',1,'1',1,NULL,NULL,NULL),(88,'2022-07-05 22:09:23',212,'8EDserie_conv',1,'1',1,NULL,NULL,NULL),(89,'2022-07-05 22:16:16',103,'ED',3,'1',1,NULL,NULL,NULL),(90,'2022-07-05 22:26:37',180,'ED',3,'1',1,NULL,NULL,NULL),(91,'2022-07-05 22:26:54',213,'Pulsador',1,'1',1,NULL,NULL,NULL),(92,'2022-07-05 22:34:28',61,'ED',4,'1',1,NULL,NULL,NULL),(93,'2022-07-05 22:37:45',69,'ED',3,'1',1,NULL,NULL,NULL),(94,'2022-07-05 23:38:08',214,'Pulsador',1,'1',1,NULL,NULL,NULL),(95,'2022-07-05 23:38:23',184,'ED',2,'1',1,NULL,NULL,NULL),(96,'2022-07-06 00:20:14',215,'DS18B20',1,'1',60,'28ead1972f21019c',NULL,NULL),(97,'2022-07-06 22:39:38',216,'Dali',1,'1',5,NULL,NULL,NULL),(98,'2022-07-06 22:39:45',217,'Dali',1,'1',5,NULL,NULL,NULL),(99,'2022-07-06 22:39:50',218,'Dali',1,'1',5,NULL,NULL,NULL),(100,'2022-07-06 22:39:55',219,'Dali',1,'1',5,NULL,NULL,NULL),(101,'2022-07-06 22:40:00',220,'Dali',1,'1',5,NULL,NULL,NULL),(102,'2022-07-06 22:40:05',221,'Dali',1,'1',5,NULL,NULL,NULL),(103,'2022-07-06 22:40:11',222,'Dali',1,'1',5,NULL,NULL,NULL),(104,'2022-07-06 22:40:14',223,'Dali',1,'1',5,NULL,NULL,NULL),(105,'2022-07-06 22:40:18',224,'Dali',1,'1',5,NULL,NULL,NULL),(106,'2022-07-06 22:40:21',225,'Dali',1,'1',5,NULL,NULL,NULL),(107,'2022-07-06 22:40:24',226,'Dali',1,'1',5,NULL,NULL,NULL),(108,'2022-07-06 22:40:28',227,'Dali',1,'1',5,NULL,NULL,NULL),(109,'2022-07-06 22:40:34',228,'Dali',1,'1',5,NULL,NULL,NULL),(110,'2022-07-06 22:40:39',229,'Dali',1,'1',5,NULL,NULL,NULL),(111,'2022-07-06 22:41:07',230,'Dali',1,'1',5,NULL,NULL,NULL),(112,'2022-07-06 22:41:10',231,'Dali',1,'1',5,NULL,NULL,NULL),(113,'2022-07-06 23:07:54',232,'Dali',1,'1',5,NULL,NULL,NULL),(114,'2022-07-06 23:13:20',233,'Dali',1,'1',5,NULL,NULL,NULL),(115,'2022-07-06 23:13:23',234,'Dali',1,'1',5,NULL,NULL,NULL),(116,'2022-07-06 23:13:27',235,'Dali',1,'1',5,NULL,NULL,NULL),(117,'2022-07-06 23:13:32',236,'Dali',1,'1',5,NULL,NULL,NULL),(118,'2022-07-06 23:13:35',237,'Dali',1,'1',5,NULL,NULL,NULL),(119,'2022-07-06 23:13:39',238,'Dali',1,'1',5,NULL,NULL,NULL),(120,'2022-07-06 23:13:42',239,'Dali',1,'1',5,NULL,NULL,NULL),(121,'2022-07-06 23:13:46',240,'Dali',1,'1',5,NULL,NULL,NULL),(122,'2022-07-06 23:13:50',241,'Dali',1,'1',5,NULL,NULL,NULL),(123,'2022-07-06 23:13:53',242,'Dali',1,'1',5,NULL,NULL,NULL),(124,'2022-07-06 23:13:57',243,'Dali',1,'1',5,NULL,NULL,NULL),(125,'2022-07-06 23:14:05',244,'Dali',1,'1',5,NULL,NULL,NULL),(126,'2022-07-07 09:16:22',245,'Dali',1,'1',10,NULL,NULL,NULL),(127,'2022-07-07 09:16:28',246,'Dali',1,'1',10,NULL,NULL,NULL),(128,'2022-07-07 09:16:31',247,'Dali',1,'1',10,NULL,NULL,NULL),(129,'2022-07-07 09:16:34',248,'Dali',1,'1',10,NULL,NULL,NULL),(130,'2022-07-07 09:16:37',249,'Dali',1,'1',10,NULL,NULL,NULL),(131,'2022-07-07 16:07:51',250,'Dali',1,'1',10,NULL,NULL,NULL),(132,'2022-07-07 16:07:55',251,'Dali',1,'1',10,NULL,NULL,NULL),(133,'2022-07-07 16:07:58',252,'Dali',1,'1',10,NULL,NULL,NULL),(134,'2022-07-07 16:08:01',253,'Dali',1,'1',10,NULL,NULL,NULL),(135,'2022-07-07 16:08:04',254,'Dali',1,'1',10,NULL,NULL,NULL),(136,'2022-07-07 16:08:08',255,'Dali',1,'1',10,NULL,NULL,NULL),(137,'2022-07-07 16:08:12',256,'Dali',1,'1',10,NULL,NULL,NULL),(138,'2022-07-07 16:08:15',257,'Dali',1,'1',10,NULL,NULL,NULL),(139,'2022-07-07 16:08:19',258,'Dali',1,'1',10,NULL,NULL,NULL),(140,'2022-07-07 16:08:22',259,'Dali',1,'1',10,NULL,NULL,NULL),(141,'2022-07-07 16:08:25',260,'Dali',1,'1',10,NULL,NULL,NULL),(142,'2022-07-07 16:08:29',261,'Dali',1,'1',10,NULL,NULL,NULL),(143,'2022-07-07 16:11:42',262,'Dali',1,'1',10,NULL,NULL,NULL),(144,'2022-07-07 16:11:54',263,'Dali',1,'1',10,NULL,NULL,NULL),(145,'2022-07-07 16:11:58',264,'Dali',1,'1',10,NULL,NULL,NULL),(146,'2022-07-07 16:17:17',265,'Dali',1,'1',10,NULL,NULL,NULL),(147,'2022-07-07 16:17:21',266,'Dali',1,'1',10,NULL,NULL,NULL),(148,'2022-07-07 16:17:24',267,'Dali',1,'1',10,NULL,NULL,NULL),(149,'2022-07-07 16:17:29',268,'Dali',1,'1',10,NULL,NULL,NULL),(150,'2022-07-07 16:17:32',269,'Dali',1,'1',10,NULL,NULL,NULL),(151,'2022-07-07 16:23:30',270,'Dali',1,'1',10,NULL,NULL,NULL),(152,'2022-07-07 16:23:35',271,'Dali',1,'1',10,NULL,NULL,NULL),(153,'2022-07-07 16:23:38',272,'Dali',1,'1',10,NULL,NULL,NULL),(154,'2022-07-07 16:23:42',273,'Dali',1,'1',10,NULL,NULL,NULL),(155,'2022-07-07 16:23:45',274,'Dali',1,'1',10,NULL,NULL,NULL),(156,'2022-07-07 16:24:00',275,'Dali',1,'1',10,NULL,NULL,NULL),(157,'2022-07-07 16:24:12',276,'Dali',1,'1',10,NULL,NULL,NULL),(158,'2022-07-07 16:24:15',277,'Dali',1,'1',10,NULL,NULL,NULL),(159,'2022-07-07 16:24:21',278,'Dali',1,'1',10,NULL,NULL,NULL),(160,'2022-07-07 16:24:24',279,'Dali',1,'1',10,NULL,NULL,NULL),(161,'2022-07-07 16:24:33',280,'Dali',1,'1',10,NULL,NULL,NULL),(162,'2022-07-07 16:24:36',281,'Dali',1,'1',10,NULL,NULL,NULL),(163,'2022-07-07 16:24:39',282,'Dali',1,'1',10,NULL,NULL,NULL),(164,'2022-07-07 16:24:44',283,'Dali',1,'1',10,NULL,NULL,NULL),(165,'2022-07-07 16:24:46',284,'Dali',1,'1',10,NULL,NULL,NULL),(166,'2022-07-07 16:25:09',285,'Dali',1,'1',10,NULL,NULL,NULL),(167,'2022-07-07 16:25:12',286,'Dali',1,'1',10,NULL,NULL,NULL),(168,'2022-07-07 16:25:18',287,'Dali',1,'1',10,NULL,NULL,NULL),(169,'2022-07-07 16:25:21',288,'Dali',1,'1',10,NULL,NULL,NULL),(170,'2022-07-07 16:25:24',289,'Dali',1,'1',10,NULL,NULL,NULL),(171,'2022-07-07 16:26:04',290,'Dali',1,'1',10,NULL,NULL,NULL),(172,'2022-07-07 16:26:07',291,'Dali',1,'1',10,NULL,NULL,NULL),(173,'2022-07-07 16:26:10',292,'Dali',1,'1',10,NULL,NULL,NULL),(174,'2022-07-07 16:26:13',293,'Dali',1,'1',10,NULL,NULL,NULL),(175,'2022-07-07 16:26:15',294,'Dali',1,'1',10,NULL,NULL,NULL),(176,'2022-07-07 16:26:48',295,'Dali',1,'1',10,NULL,NULL,NULL),(177,'2022-07-07 16:26:50',296,'Dali',1,'1',10,NULL,NULL,NULL),(178,'2022-07-07 16:26:53',297,'Dali',1,'1',10,NULL,NULL,NULL),(179,'2022-07-07 16:26:57',298,'Dali',1,'1',10,NULL,NULL,NULL),(180,'2022-07-07 16:27:00',299,'Dali',1,'1',10,NULL,NULL,NULL),(181,'2022-07-07 16:27:04',300,'Dali',1,'1',10,NULL,NULL,NULL),(182,'2022-07-07 16:27:07',301,'Dali',1,'1',10,NULL,NULL,NULL),(183,'2022-07-07 16:27:11',302,'Dali',1,'1',10,NULL,NULL,NULL),(184,'2022-07-07 16:27:15',303,'Dali',1,'1',10,NULL,NULL,NULL),(185,'2022-07-07 16:27:42',304,'Dali',1,'1',10,NULL,NULL,NULL),(186,'2022-07-07 16:27:46',305,'Dali',1,'1',10,NULL,NULL,NULL),(187,'2022-07-07 16:51:40',306,'Circutor',1,'1',60,NULL,NULL,NULL),(188,'2022-07-07 16:53:47',306,'Circutor',2,'1',60,NULL,NULL,NULL),(189,'2022-07-07 17:24:39',307,'Sungrow',1,'1',30,NULL,NULL,NULL),(190,'2022-07-11 15:13:08',307,'Sungrow',2,'1',30,NULL,NULL,NULL),(191,'2022-07-11 21:31:13',310,'DS18B20',1,'1',60,'28e1899a2f21019c',NULL,NULL),(192,'2022-07-12 15:02:33',319,'Dali',1,'1',10,NULL,NULL,NULL),(193,'2022-07-12 15:02:40',320,'Dali',1,'1',10,NULL,NULL,NULL),(194,'2022-07-13 04:15:25',321,'ED',1,'1',1,NULL,NULL,NULL),(195,'2022-07-13 04:15:39',321,'ED',2,'1',1,NULL,NULL,NULL),(196,'2022-07-13 04:15:53',324,'Pulsador',1,'1',1,NULL,NULL,NULL),(197,'2022-07-13 04:27:32',325,'DS18B20',1,'1',60,'2876d16d2f21013a',NULL,NULL),(198,'2022-07-13 04:39:50',332,'Dali',1,'1',10,NULL,NULL,NULL),(199,'2022-07-13 04:39:55',333,'Dali',1,'1',10,NULL,NULL,NULL),(200,'2022-07-13 04:40:05',334,'Dali',1,'1',10,NULL,NULL,NULL),(201,'2022-07-13 04:40:14',335,'Dali',1,'1',10,NULL,NULL,NULL),(202,'2022-07-13 04:40:18',336,'Dali',1,'1',10,NULL,NULL,NULL),(203,'2022-07-13 04:40:22',337,'Dali',1,'1',10,NULL,NULL,NULL),(204,'2022-08-18 09:08:40',339,'8EDserie_conv',1,'1',1,NULL,NULL,NULL),(205,'2022-08-18 09:34:42',341,'8EDserie_conv',1,'1',1,NULL,NULL,NULL),(206,'2022-08-18 10:10:01',343,'8EDserie_conv',1,'1',1,NULL,NULL,NULL),(207,'2022-08-18 10:20:26',345,'8EDserie_conv',1,'1',1,NULL,NULL,NULL),(208,'2022-08-29 11:22:45',346,'Somfy',1,'1',10,NULL,NULL,NULL),(209,'2022-08-29 17:54:36',348,'Dali',1,'1',300,NULL,NULL,NULL),(210,'2022-08-29 18:04:33',349,'Dali',1,'1',300,NULL,NULL,NULL),(211,'2022-08-29 18:06:10',350,'Dali',1,'1',300,NULL,NULL,NULL),(212,'2022-08-29 18:06:19',351,'Dali',1,'1',300,NULL,NULL,NULL),(213,'2022-08-29 18:06:26',352,'Dali',1,'1',300,NULL,NULL,NULL),(214,'2022-08-29 18:09:31',353,'Dali',1,'1',300,NULL,NULL,NULL),(215,'2022-08-29 18:09:46',354,'Dali',1,'1',300,NULL,NULL,NULL),(216,'2022-08-29 18:09:55',355,'Dali',1,'1',300,NULL,NULL,NULL),(217,'2022-08-29 18:10:05',356,'Dali',1,'1',300,NULL,NULL,NULL),(218,'2022-08-29 18:10:16',357,'Dali',1,'1',300,NULL,NULL,NULL),(219,'2022-08-29 18:10:26',358,'Dali',1,'1',300,NULL,NULL,NULL),(220,'2022-08-29 18:12:57',359,'Dali',1,'1',300,NULL,NULL,NULL),(221,'2022-08-29 18:13:15',360,'Dali',1,'1',300,NULL,NULL,NULL),(222,'2022-08-29 18:13:23',361,'Dali',1,'1',300,NULL,NULL,NULL),(223,'2022-08-29 18:14:14',362,'Dali',1,'1',300,NULL,NULL,NULL),(224,'2022-08-29 18:14:27',363,'Dali',1,'1',300,NULL,NULL,NULL),(225,'2022-08-29 18:14:31',364,'Dali',1,'1',300,NULL,NULL,NULL),(226,'2022-08-29 18:14:37',365,'Dali',1,'1',300,NULL,NULL,NULL),(227,'2022-08-29 18:14:43',366,'Dali',1,'1',300,NULL,NULL,NULL),(228,'2022-08-29 18:24:55',367,'Dali',1,'1',300,NULL,NULL,NULL),(229,'2022-08-29 18:25:20',368,'Dali',1,'1',300,NULL,NULL,NULL),(230,'2022-08-29 18:25:26',369,'Dali',1,'1',300,NULL,NULL,NULL),(231,'2022-08-29 18:25:33',370,'Dali',1,'1',300,NULL,NULL,NULL),(232,'2022-08-29 18:25:37',371,'Dali',1,'1',300,NULL,NULL,NULL),(233,'2022-08-29 18:37:43',372,'Dali',1,'1',300,NULL,NULL,NULL),(234,'2022-08-29 18:37:49',373,'Dali',1,'1',300,NULL,NULL,NULL),(235,'2022-08-29 18:38:00',374,'Dali',1,'1',300,NULL,NULL,NULL),(236,'2022-08-29 18:38:06',375,'Dali',1,'1',300,NULL,NULL,NULL),(237,'2022-08-29 18:38:10',376,'Dali',1,'1',300,NULL,NULL,NULL),(238,'2022-08-29 18:38:14',377,'Dali',1,'1',300,NULL,NULL,NULL),(239,'2022-08-29 18:38:19',378,'Dali',1,'1',300,NULL,NULL,NULL),(240,'2022-08-29 18:38:24',379,'Dali',1,'1',300,NULL,NULL,NULL),(241,'2022-08-29 18:38:30',380,'Dali',1,'1',300,NULL,NULL,NULL),(242,'2022-08-29 18:38:37',381,'Dali',1,'1',300,NULL,NULL,NULL),(243,'2022-08-29 18:39:23',382,'Dali',1,'1',300,NULL,NULL,NULL),(244,'2022-08-29 18:39:27',383,'Dali',1,'1',300,NULL,NULL,NULL),(245,'2022-08-29 18:39:31',384,'Dali',1,'1',300,NULL,NULL,NULL),(246,'2022-08-29 18:39:35',385,'Dali',1,'1',300,NULL,NULL,NULL),(247,'2022-08-29 18:39:39',386,'Dali',1,'1',300,NULL,NULL,NULL),(248,'2022-08-29 18:39:44',387,'Dali',1,'1',300,NULL,NULL,NULL),(249,'2022-08-29 18:39:49',388,'Dali',1,'1',300,NULL,NULL,NULL),(250,'2022-08-29 18:39:53',389,'Dali',1,'1',300,NULL,NULL,NULL),(251,'2022-08-29 18:39:59',390,'Dali',1,'1',300,NULL,NULL,NULL),(252,'2022-08-29 18:40:05',391,'Dali',1,'1',300,NULL,NULL,NULL),(253,'2022-08-29 18:40:10',392,'Dali',1,'1',300,NULL,NULL,NULL),(254,'2022-08-29 18:40:15',393,'Dali',1,'1',300,NULL,NULL,NULL),(255,'2022-08-29 18:40:21',394,'Dali',1,'1',300,NULL,NULL,NULL),(256,'2022-08-29 18:40:27',395,'Dali',1,'1',300,NULL,NULL,NULL),(257,'2022-08-29 18:55:31',396,'Dali',1,'1',300,NULL,NULL,NULL),(258,'2022-08-29 18:55:37',397,'Dali',1,'1',300,NULL,NULL,NULL),(259,'2022-08-29 18:55:41',398,'Dali',1,'1',300,NULL,NULL,NULL),(260,'2022-08-29 18:55:45',399,'Dali',1,'1',300,NULL,NULL,NULL),(261,'2022-08-29 18:55:49',400,'Dali',1,'1',300,NULL,NULL,NULL),(262,'2022-08-29 18:55:54',401,'Dali',1,'1',300,NULL,NULL,NULL),(263,'2022-08-29 18:55:59',402,'Dali',1,'1',300,NULL,NULL,NULL),(264,'2022-08-29 18:56:05',403,'Dali',1,'1',300,NULL,NULL,NULL),(265,'2022-08-29 18:56:11',404,'Dali',1,'1',300,NULL,NULL,NULL),(266,'2022-08-29 18:56:16',405,'Dali',1,'1',300,NULL,NULL,NULL),(267,'2022-08-29 18:56:27',406,'Dali',1,'1',300,NULL,NULL,NULL),(268,'2022-08-29 18:56:32',407,'Dali',1,'1',300,NULL,NULL,NULL),(269,'2022-08-29 18:56:41',408,'Dali',1,'1',300,NULL,NULL,NULL),(270,'2022-08-29 18:56:45',409,'Dali',1,'1',300,NULL,NULL,NULL),(271,'2022-08-29 18:56:51',410,'Dali',1,'1',300,NULL,NULL,NULL),(272,'2022-08-29 18:56:56',411,'Dali',1,'1',300,NULL,NULL,NULL),(273,'2022-08-29 18:57:01',412,'Dali',1,'1',300,NULL,NULL,NULL),(274,'2022-08-29 18:57:07',413,'Dali',1,'1',300,NULL,NULL,NULL),(275,'2022-08-29 18:57:12',414,'Dali',1,'1',300,NULL,NULL,NULL),(276,'2022-08-29 18:57:18',415,'Dali',1,'1',300,NULL,NULL,NULL),(277,'2022-08-29 18:57:22',416,'Dali',1,'1',300,NULL,NULL,NULL),(278,'2022-08-29 18:57:28',417,'Dali',1,'1',300,NULL,NULL,NULL),(279,'2022-08-29 18:57:34',418,'Dali',1,'1',300,NULL,NULL,NULL),(280,'2022-08-30 07:30:01',419,'Dali',1,'1',300,NULL,NULL,NULL),(281,'2022-08-30 07:30:06',420,'Dali',1,'1',300,NULL,NULL,NULL),(282,'2022-08-30 07:30:11',421,'Dali',1,'1',300,NULL,NULL,NULL),(283,'2022-08-30 07:30:17',422,'Dali',1,'1',300,NULL,NULL,NULL),(284,'2022-08-30 07:30:22',423,'Dali',1,'1',300,NULL,NULL,NULL),(285,'2022-08-30 07:30:27',424,'Dali',1,'1',300,NULL,NULL,NULL),(286,'2022-08-30 07:30:32',425,'Dali',1,'1',300,NULL,NULL,NULL),(287,'2022-08-30 07:55:47',426,'Dali',1,'1',300,NULL,NULL,NULL),(288,'2022-08-30 07:55:53',427,'Dali',1,'1',300,NULL,NULL,NULL),(289,'2022-08-30 07:55:58',428,'Dali',1,'1',300,NULL,NULL,NULL),(290,'2022-08-30 07:56:04',429,'Dali',1,'1',300,NULL,NULL,NULL),(291,'2022-08-30 07:56:12',430,'Dali',1,'1',300,NULL,NULL,NULL),(292,'2022-08-30 07:56:17',431,'Dali',1,'1',300,NULL,NULL,NULL),(293,'2022-08-30 07:56:27',261,'Dali',2,'1',300,NULL,NULL,NULL),(294,'2022-08-30 07:56:31',432,'Dali',1,'1',300,NULL,NULL,NULL),(295,'2022-08-30 07:56:37',433,'Dali',1,'1',300,NULL,NULL,NULL),(296,'2022-08-30 07:56:45',434,'Dali',1,'1',300,NULL,NULL,NULL),(297,'2022-08-30 07:56:52',435,'Dali',1,'1',300,NULL,NULL,NULL),(298,'2022-08-30 07:56:57',436,'Dali',1,'1',300,NULL,NULL,NULL),(299,'2022-08-30 07:57:02',437,'Dali',1,'1',300,NULL,NULL,NULL),(300,'2022-08-30 07:57:08',438,'Dali',1,'1',300,NULL,NULL,NULL),(301,'2022-08-30 07:57:16',439,'Dali',1,'1',300,NULL,NULL,NULL),(302,'2022-08-30 07:57:24',440,'Dali',1,'1',300,NULL,NULL,NULL),(303,'2022-08-30 07:57:30',441,'Dali',1,'1',300,NULL,NULL,NULL),(304,'2022-08-30 07:57:35',442,'Dali',1,'1',300,NULL,NULL,NULL),(305,'2022-08-30 07:57:39',443,'Dali',1,'1',300,NULL,NULL,NULL),(306,'2022-08-30 07:57:43',444,'Dali',1,'1',300,NULL,NULL,NULL),(307,'2022-08-30 07:57:48',445,'Dali',1,'1',300,NULL,NULL,NULL),(308,'2022-08-30 07:57:56',446,'Dali',1,'1',300,NULL,NULL,NULL),(309,'2022-08-30 07:58:02',447,'Dali',1,'1',300,NULL,NULL,NULL),(310,'2022-08-30 07:58:06',448,'Dali',1,'1',300,NULL,NULL,NULL),(311,'2022-08-30 07:58:15',449,'Dali',1,'1',300,NULL,NULL,NULL),(312,'2022-08-30 07:58:21',450,'Dali',1,'1',300,NULL,NULL,NULL),(313,'2022-08-30 07:58:25',451,'Dali',1,'1',300,NULL,NULL,NULL),(314,'2022-08-30 07:58:31',452,'Dali',1,'1',300,NULL,NULL,NULL),(315,'2022-08-30 07:58:34',453,'Dali',1,'1',300,NULL,NULL,NULL),(316,'2022-08-30 07:58:41',454,'Dali',1,'1',300,NULL,NULL,NULL),(317,'2022-08-30 07:58:50',455,'Dali',1,'1',300,NULL,NULL,NULL),(318,'2022-08-30 07:58:55',456,'Dali',1,'1',300,NULL,NULL,NULL),(319,'2022-08-30 08:36:31',457,'Dali',1,'1',300,NULL,NULL,NULL),(320,'2022-08-30 08:36:39',458,'Dali',1,'1',300,NULL,NULL,NULL),(321,'2022-08-30 08:36:45',459,'Dali',1,'1',300,NULL,NULL,NULL),(322,'2022-08-30 08:36:51',460,'Dali',1,'1',300,NULL,NULL,NULL),(323,'2022-08-30 08:36:55',461,'Dali',1,'1',300,NULL,NULL,NULL),(324,'2022-08-30 08:37:00',462,'Dali',1,'1',300,NULL,NULL,NULL),(325,'2022-08-30 08:37:04',463,'Dali',1,'1',300,NULL,NULL,NULL),(326,'2022-08-30 08:37:08',464,'Dali',1,'1',300,NULL,NULL,NULL),(327,'2022-08-30 08:37:12',465,'Dali',1,'1',300,NULL,NULL,NULL),(328,'2022-08-30 08:37:17',466,'Dali',1,'1',300,NULL,NULL,NULL),(329,'2022-08-30 08:37:22',467,'Dali',1,'1',300,NULL,NULL,NULL),(330,'2022-08-30 08:37:27',468,'Dali',1,'1',300,NULL,NULL,NULL),(331,'2022-08-30 08:37:34',469,'Dali',1,'1',300,NULL,NULL,NULL),(332,'2022-08-30 08:44:30',470,'Dali',1,'1',300,NULL,NULL,NULL),(333,'2022-08-30 08:44:33',471,'Dali',1,'1',300,NULL,NULL,NULL),(334,'2022-08-30 08:44:37',472,'Dali',1,'1',300,NULL,NULL,NULL),(335,'2022-08-30 08:44:41',473,'Dali',1,'1',300,NULL,NULL,NULL),(336,'2022-08-30 08:44:46',474,'Dali',1,'1',300,NULL,NULL,NULL),(337,'2022-08-30 08:44:50',475,'Dali',1,'1',300,NULL,NULL,NULL),(338,'2022-08-30 08:44:54',476,'Dali',1,'1',300,NULL,NULL,NULL),(339,'2022-08-30 08:44:58',477,'Dali',1,'1',300,NULL,NULL,NULL),(340,'2022-08-30 08:45:04',478,'Dali',1,'1',300,NULL,NULL,NULL),(341,'2022-08-30 08:45:09',479,'Dali',1,'1',300,NULL,NULL,NULL),(342,'2022-08-30 08:45:15',480,'Dali',1,'1',300,NULL,NULL,NULL),(343,'2022-08-30 08:45:18',481,'Dali',1,'1',300,NULL,NULL,NULL),(344,'2022-08-30 08:45:25',482,'Dali',1,'1',300,NULL,NULL,NULL),(345,'2022-08-30 08:45:28',483,'Dali',1,'1',300,NULL,NULL,NULL),(346,'2022-08-30 08:45:33',484,'Dali',1,'1',300,NULL,NULL,NULL),(347,'2022-08-30 08:50:38',485,'Dali',1,'1',300,NULL,NULL,NULL),(348,'2022-08-30 08:50:42',486,'Dali',1,'1',300,NULL,NULL,NULL),(349,'2022-08-30 08:54:31',487,'Md02',1,'1',60,NULL,NULL,NULL),(350,'2022-08-30 23:48:21',493,'Sugarvalley',1,'1',5,NULL,NULL,NULL),(351,'2022-09-07 05:07:28',495,'DS18B20',1,'1',60,'28be14524121d6f4',NULL,NULL),(352,'2022-09-07 05:09:24',314,'ED',1,'1',1,NULL,NULL,NULL),(353,'2022-09-07 05:09:41',314,'ED',2,'1',1,NULL,NULL,NULL),(354,'2022-09-07 05:29:24',496,'ED',1,'1',1,NULL,NULL,NULL),(355,'2022-09-07 05:38:50',499,'ED',1,'1',1,NULL,NULL,NULL),(356,'2022-09-08 14:51:51',510,'DS18B20',1,'1',60,'28b614e8412106df',NULL,NULL),(357,'2022-09-08 14:52:11',511,'DS18B20',1,'1',60,'28487ed041210646',NULL,NULL),(358,'2022-09-08 15:08:55',513,'DS18B20',1,'1',60,'2894bb2040210994',NULL,NULL),(359,'2022-09-08 15:09:03',514,'DS18B20',1,'1',60,'287efd5540210a01',NULL,NULL),(360,'2022-09-08 16:25:33',515,'DS18B20',1,'1',60,'289eb1b4412106e3',NULL,NULL),(361,'2022-09-08 16:25:41',516,'DS18B20',1,'1',60,'28d2553f41210638',NULL,NULL),(362,'2022-09-08 16:25:47',517,'DS18B20',1,'1',60,'28e9f22a42210649',NULL,NULL),(363,'2022-09-08 16:25:54',518,'DS18B20',1,'1',60,'2817e72e4121066c',NULL,NULL),(364,'2022-09-08 16:31:59',519,'ibercomp_sonda',1,'1',300,NULL,NULL,NULL),(365,'2022-09-08 16:43:11',311,'ED',1,'1',1,NULL,NULL,NULL),(366,'2022-09-08 17:20:17',520,'DS18B20',1,'1',120,'289dea05422106a5',NULL,NULL),(367,'2022-09-08 17:20:25',521,'DS18B20',1,'1',120,'281f53fb4121061d',NULL,NULL),(368,'2022-09-22 15:57:44',524,'Somfy',1,'1',10,NULL,NULL,NULL),(369,'2022-10-04 08:46:35',526,'Sugarvalley',1,'1',10,NULL,NULL,NULL);
/*!40000 ALTER TABLE `relacion_rb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacion_rutina_escena`
--

DROP TABLE IF EXISTS `relacion_rutina_escena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relacion_rutina_escena` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_rutina` int(11) NOT NULL,
  `codigo_escena` int(11) NOT NULL,
  `tiempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_rutina` (`codigo_rutina`),
  KEY `codigo_escena` (`codigo_escena`),
  CONSTRAINT `rel_rut_esc_ibfk_1` FOREIGN KEY (`codigo_rutina`) REFERENCES `rutina` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rel_rut_esc_ibfk_2` FOREIGN KEY (`codigo_escena`) REFERENCES `escenas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacion_rutina_escena`
--

LOCK TABLES `relacion_rutina_escena` WRITE;
/*!40000 ALTER TABLE `relacion_rutina_escena` DISABLE KEYS */;
/*!40000 ALTER TABLE `relacion_rutina_escena` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacion_rutina_operacion`
--

DROP TABLE IF EXISTS `relacion_rutina_operacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relacion_rutina_operacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_rutina` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `tiempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_rutina` (`codigo_rutina`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `rel_rut_ope_ibfk_1` FOREIGN KEY (`codigo_rutina`) REFERENCES `rutina` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `rel_rut_ope_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacion_rutina_operacion`
--

LOCK TABLES `relacion_rutina_operacion` WRITE;
/*!40000 ALTER TABLE `relacion_rutina_operacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `relacion_rutina_operacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacion_seguridad`
--

DROP TABLE IF EXISTS `relacion_seguridad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relacion_seguridad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo_seguridad` int(11) NOT NULL,
  `rb_valor` int(11) NOT NULL,
  `codigo_tp_valor` int(11) NOT NULL,
  `rb_estado` int(11) NOT NULL,
  `codigo_tp_estado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_seguridad` (`codigo_seguridad`),
  CONSTRAINT `relacion_seguridad_ibfk_1` FOREIGN KEY (`codigo_seguridad`) REFERENCES `seguridad` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacion_seguridad`
--

LOCK TABLES `relacion_seguridad` WRITE;
/*!40000 ALTER TABLE `relacion_seguridad` DISABLE KEYS */;
/*!40000 ALTER TABLE `relacion_seguridad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rutina`
--

DROP TABLE IF EXISTS `rutina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule` varchar(70) NOT NULL,
  `nemo` varchar(150) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `estado` int(11) NOT NULL,
  `hora_inicio` varchar(11) NOT NULL,
  `hora_fin` varchar(11) DEFAULT NULL,
  `codigo_estancia` int(11) DEFAULT NULL,
  `codigo_planta` int(11) DEFAULT NULL,
  `notificacion` int(11) DEFAULT 0,
  `tipo_inicio` int(11) NOT NULL,
  `tipo_fin` int(11) DEFAULT NULL,
  `tipo_rutina` int(11) DEFAULT 0,
  `pertenencia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  KEY `codigo_planta` (`codigo_planta`),
  CONSTRAINT `rutina_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rutina_ibfk_2` FOREIGN KEY (`codigo_planta`) REFERENCES `planta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rutina`
--

LOCK TABLES `rutina` WRITE;
/*!40000 ALTER TABLE `rutina` DISABLE KEYS */;
/*!40000 ALTER TABLE `rutina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seguridad`
--

DROP TABLE IF EXISTS `seguridad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seguridad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `valor` varchar(15) DEFAULT NULL,
  `estado` int(11) DEFAULT -1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguridad`
--

LOCK TABLES `seguridad` WRITE;
/*!40000 ALTER TABLE `seguridad` DISABLE KEYS */;
/*!40000 ALTER TABLE `seguridad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarea`
--

DROP TABLE IF EXISTS `tarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarea` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `modo` int(11) DEFAULT NULL,
  `scheduled` varchar(70) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `codigodomo` int(11) DEFAULT NULL,
  `tipotarea` int(11) DEFAULT NULL,
  `submodo` int(11) DEFAULT NULL,
  `comentario` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarea`
--

LOCK TABLES `tarea` WRITE;
/*!40000 ALTER TABLE `tarea` DISABLE KEYS */;
INSERT INTO `tarea` VALUES (1,'2022-08-16 22:20:00',0,'2022,7,17,00,20,0,0',1,1,NULL,NULL,NULL,'Envio Post');
/*!40000 ALTER TABLE `tarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarea_bd`
--

DROP TABLE IF EXISTS `tarea_bd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarea_bd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_tarea` int(11) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `bd` varchar(70) DEFAULT NULL,
  `tabla` varchar(70) DEFAULT NULL,
  `tdatos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `valores` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `condicion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_tarea` (`codigo_tarea`),
  CONSTRAINT `tareabd_ibfk_1` FOREIGN KEY (`codigo_tarea`) REFERENCES `tarea` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarea_bd`
--

LOCK TABLES `tarea_bd` WRITE;
/*!40000 ALTER TABLE `tarea_bd` DISABLE KEYS */;
INSERT INTO `tarea_bd` VALUES (1,1,2,'sistema_somosaguas','post','[\"estado\"]',NULL,'id=2'),(2,1,1,'sistema_somosaguas','historico_post','[\"estado\",\"tipotcaso\",\"codigo_post\"]',NULL,NULL);
/*!40000 ALTER TABLE `tarea_bd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarea_email`
--

DROP TABLE IF EXISTS `tarea_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarea_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_tarea` int(11) DEFAULT NULL,
  `asunto` varchar(70) DEFAULT NULL,
  `texto` varchar(70) DEFAULT NULL,
  `destinos` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_tarea` (`codigo_tarea`),
  CONSTRAINT `tareaemail_ibfk_1` FOREIGN KEY (`codigo_tarea`) REFERENCES `tarea` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarea_email`
--

LOCK TABLES `tarea_email` WRITE;
/*!40000 ALTER TABLE `tarea_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarea_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarea_notificacion`
--

DROP TABLE IF EXISTS `tarea_notificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarea_notificacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_tarea` int(11) DEFAULT NULL,
  `titulo` varchar(70) DEFAULT NULL,
  `texto` varchar(70) DEFAULT NULL,
  `destinos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `argumentos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_tarea` (`codigo_tarea`),
  CONSTRAINT `tareanot_ibfk_1` FOREIGN KEY (`codigo_tarea`) REFERENCES `tarea` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarea_notificacion`
--

LOCK TABLES `tarea_notificacion` WRITE;
/*!40000 ALTER TABLE `tarea_notificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarea_notificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarea_rpc`
--

DROP TABLE IF EXISTS `tarea_rpc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarea_rpc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `argumentos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `codigo_tarea` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_tarea` (`codigo_tarea`),
  CONSTRAINT `tarearpc_ibfk_1` FOREIGN KEY (`codigo_tarea`) REFERENCES `tarea` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarea_rpc`
--

LOCK TABLES `tarea_rpc` WRITE;
/*!40000 ALTER TABLE `tarea_rpc` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarea_rpc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarea_rutina`
--

DROP TABLE IF EXISTS `tarea_rutina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarea_rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_tarea` int(11) DEFAULT NULL,
  `codigo_rutina` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_tarea` (`codigo_tarea`),
  KEY `codigo_rutina` (`codigo_rutina`),
  CONSTRAINT `tarea_rut_ibfk_1` FOREIGN KEY (`codigo_tarea`) REFERENCES `tarea` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tarea_rut_ibfk_2` FOREIGN KEY (`codigo_rutina`) REFERENCES `rutina` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarea_rutina`
--

LOCK TABLES `tarea_rutina` WRITE;
/*!40000 ALTER TABLE `tarea_rutina` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarea_rutina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarea_sms`
--

DROP TABLE IF EXISTS `tarea_sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarea_sms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_tarea` int(11) DEFAULT NULL,
  `texto` int(11) DEFAULT NULL,
  `destinos` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_tarea` (`codigo_tarea`),
  CONSTRAINT `tareasms_ibfk_1` FOREIGN KEY (`codigo_tarea`) REFERENCES `tarea` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarea_sms`
--

LOCK TABLES `tarea_sms` WRITE;
/*!40000 ALTER TABLE `tarea_sms` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarea_sms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarea_sql`
--

DROP TABLE IF EXISTS `tarea_sql`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarea_sql` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_tarea` int(11) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `sql` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_tarea` (`codigo_tarea`),
  CONSTRAINT `tareasql_ibfk_1` FOREIGN KEY (`codigo_tarea`) REFERENCES `tarea` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarea_sql`
--

LOCK TABLES `tarea_sql` WRITE;
/*!40000 ALTER TABLE `tarea_sql` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarea_sql` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `th_analizador`
--

DROP TABLE IF EXISTS `th_analizador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `th_analizador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_tp` int(11) DEFAULT NULL,
  `modulo` int(11) DEFAULT NULL,
  `fk` int(11) DEFAULT NULL,
  `argumentos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `inhibir` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `modulo` (`modulo`),
  KEY `codigo_tp` (`codigo_tp`),
  CONSTRAINT `_analizador_thfk_1` FOREIGN KEY (`codigo_tp`) REFERENCES `trb_analizador` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `th_analizador`
--

LOCK TABLES `th_analizador` WRITE;
/*!40000 ALTER TABLE `th_analizador` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_analizador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `th_iber_8ed_conv`
--

DROP TABLE IF EXISTS `th_iber_8ed_conv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `th_iber_8ed_conv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_tp` int(11) DEFAULT NULL,
  `modulo` int(11) DEFAULT NULL,
  `fk` int(11) DEFAULT NULL,
  `argumentos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `inhibir` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `modulo` (`modulo`),
  KEY `codigo_tp` (`codigo_tp`),
  CONSTRAINT `_iber_8ed_conv_thfk_1` FOREIGN KEY (`codigo_tp`) REFERENCES `trb_iber_8ed_conv` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `th_iber_8ed_conv`
--

LOCK TABLES `th_iber_8ed_conv` WRITE;
/*!40000 ALTER TABLE `th_iber_8ed_conv` DISABLE KEYS */;
INSERT INTO `th_iber_8ed_conv` VALUES (1,36,4,NULL,'{\"floor\":\"1\",\"room\":\"2\",\"zone\":\"112\",\"type\":\"0\",\"nemo\":\"0\"}',0),(2,44,4,NULL,'{\"floor\":\"1\",\"room\":\"1\",\"zone\":\"113\",\"type\":\"0\",\"nemo\":\"0\"}',0),(3,52,4,NULL,'{\"floor\":\"1\",\"room\":\"3\",\"zone\":\"114\",\"type\":\"0\",\"nemo\":\"0\"}',0),(4,61,4,NULL,'{\"floor\":\"1\",\"room\":\"74\",\"zone\":\"115\",\"type\":\"0\",\"nemo\":\"0\"}',0),(5,7,4,NULL,'{\"floor\":\"5\",\"room\":\"22\",\"zone\":\"14\",\"type\":\"4\",\"nemo\":\"2\"}',0),(6,8,4,NULL,'{\"floor\":\"5\",\"room\":\"23\",\"zone\":\"15\",\"type\":\"4\",\"nemo\":\"2\"}',0),(7,9,4,NULL,'{\"floor\":\"5\",\"room\":\"53\",\"zone\":\"16\",\"type\":\"4\",\"nemo\":\"2\"}',0),(8,10,4,NULL,'{\"floor\":\"5\",\"room\":\"24\",\"zone\":\"17\",\"type\":\"4\",\"nemo\":\"2\"}',0),(9,11,4,NULL,'{\"floor\":\"5\",\"room\":\"25\",\"zone\":\"18\",\"type\":\"4\",\"nemo\":\"2\"}',0),(10,13,4,NULL,'{\"floor\":\"5\",\"room\":\"54\",\"zone\":\"19\",\"type\":\"4\",\"nemo\":\"2\"}',0);
/*!40000 ALTER TABLE `th_iber_8ed_conv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `th_iber_8sd_conv`
--

DROP TABLE IF EXISTS `th_iber_8sd_conv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `th_iber_8sd_conv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_tp` int(11) DEFAULT NULL,
  `modulo` int(11) DEFAULT NULL,
  `fk` int(11) DEFAULT NULL,
  `argumentos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `inhibir` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `modulo` (`modulo`),
  KEY `codigo_tp` (`codigo_tp`),
  CONSTRAINT `_iber_8sd_conv_thfk_1` FOREIGN KEY (`codigo_tp`) REFERENCES `trb_iber_8sd_conv` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `th_iber_8sd_conv`
--

LOCK TABLES `th_iber_8sd_conv` WRITE;
/*!40000 ALTER TABLE `th_iber_8sd_conv` DISABLE KEYS */;
INSERT INTO `th_iber_8sd_conv` VALUES (1,1,3,NULL,'{\"trb\":\"21\",\"rb\":\"207\",\"terminal\":\"0\"}',0),(2,2,3,NULL,'{\"trb\":\"21\",\"rb\":\"207\",\"terminal\":\"1\"}',0),(3,3,3,NULL,'{\"trb\":\"21\",\"rb\":\"207\",\"terminal\":\"2\"}',0),(4,4,3,NULL,'{\"trb\":\"21\",\"rb\":\"207\",\"terminal\":\"3\"}',0),(5,5,3,NULL,'{\"trb\":\"21\",\"rb\":\"207\",\"terminal\":\"4\"}',0),(6,6,3,NULL,'{\"trb\":\"21\",\"rb\":\"207\",\"terminal\":\"5\"}',0),(7,7,3,NULL,'{\"trb\":\"21\",\"rb\":\"207\",\"terminal\":\"6\"}',0),(8,8,3,NULL,'{\"trb\":\"21\",\"rb\":\"207\",\"terminal\":\"7\"}',0),(9,9,3,NULL,'{\"trb\":\"21\",\"rb\":\"208\",\"terminal\":\"0\"}',0),(10,10,3,NULL,'{\"trb\":\"21\",\"rb\":\"208\",\"terminal\":\"1\"}',0),(11,11,3,NULL,'{\"trb\":\"21\",\"rb\":\"208\",\"terminal\":\"2\"}',0),(12,12,3,NULL,'{\"trb\":\"21\",\"rb\":\"208\",\"terminal\":\"3\"}',0),(13,13,3,NULL,'{\"trb\":\"21\",\"rb\":\"210\",\"terminal\":\"0\"}',0),(14,14,3,NULL,'{\"trb\":\"21\",\"rb\":\"210\",\"terminal\":\"1\"}',0),(15,15,3,NULL,'{\"trb\":\"21\",\"rb\":\"212\",\"terminal\":\"0\"}',0),(16,16,3,NULL,'{\"trb\":\"21\",\"rb\":\"212\",\"terminal\":\"1\"}',0),(17,17,3,NULL,'{\"trb\":\"21\",\"rb\":\"212\",\"terminal\":\"2\"}',0),(18,18,3,NULL,'{\"trb\":\"21\",\"rb\":\"212\",\"terminal\":\"3\"}',0),(19,19,3,NULL,'{\"trb\":\"21\",\"rb\":\"210\",\"terminal\":\"2\"}',0),(20,20,3,NULL,'{\"trb\":\"21\",\"rb\":\"339\",\"terminal\":\"0\"}',0),(21,21,3,NULL,'{\"trb\":\"21\",\"rb\":\"339\",\"terminal\":\"1\"}',0),(22,22,3,NULL,'{\"trb\":\"21\",\"rb\":\"339\",\"terminal\":\"2\"}',0),(23,23,3,NULL,'{\"trb\":\"21\",\"rb\":\"339\",\"terminal\":\"3\"}',0),(26,24,3,NULL,'{\"trb\":\"21\",\"rb\":\"341\",\"terminal\":\"0\"}',0),(27,25,3,NULL,'{\"trb\":\"21\",\"rb\":\"341\",\"terminal\":\"1\"}',0),(28,26,3,NULL,'{\"trb\":\"21\",\"rb\":\"341\",\"terminal\":\"2\"}',0),(29,27,3,NULL,'{\"trb\":\"21\",\"rb\":\"341\",\"terminal\":\"3\"}',0),(30,32,3,NULL,'{\"trb\":\"21\",\"rb\":\"345\",\"terminal\":\"0\"}',0),(31,33,3,NULL,'{\"trb\":\"21\",\"rb\":\"345\",\"terminal\":\"1\"}',0),(32,34,3,NULL,'{\"trb\":\"21\",\"rb\":\"345\",\"terminal\":\"2\"}',0),(33,35,3,NULL,'{\"trb\":\"21\",\"rb\":\"345\",\"terminal\":\"3\"}',0),(34,36,3,NULL,'{\"trb\":\"21\",\"rb\":\"345\",\"terminal\":\"4\"}',0),(35,23,4,NULL,'{\"floor\":\"1\",\"room\":\"2\",\"zone\":\"112\",\"type\":\"0\",\"nemo\":\"0\"}',0),(36,27,4,NULL,'{\"floor\":\"1\",\"room\":\"1\",\"zone\":\"113\",\"type\":\"0\",\"nemo\":\"0\"}',0),(37,31,4,NULL,'{\"floor\":\"1\",\"room\":\"3\",\"zone\":\"114\",\"type\":\"0\",\"nemo\":\"0\"}',0),(38,36,4,NULL,'{\"floor\":\"1\",\"room\":\"74\",\"zone\":\"115\",\"type\":\"0\",\"nemo\":\"0\"}',0);
/*!40000 ALTER TABLE `th_iber_8sd_conv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `th_ibercomp_sonda`
--

DROP TABLE IF EXISTS `th_ibercomp_sonda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `th_ibercomp_sonda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_tp` int(11) DEFAULT NULL,
  `modulo` int(11) DEFAULT NULL,
  `fk` int(11) DEFAULT NULL,
  `argumentos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `inhibir` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `modulo` (`modulo`),
  KEY `codigo_tp` (`codigo_tp`),
  CONSTRAINT `_ibercomp_sonda_thfk_1` FOREIGN KEY (`codigo_tp`) REFERENCES `trb_ibercomp_sonda` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `th_ibercomp_sonda`
--

LOCK TABLES `th_ibercomp_sonda` WRITE;
/*!40000 ALTER TABLE `th_ibercomp_sonda` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_ibercomp_sonda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `th_md02`
--

DROP TABLE IF EXISTS `th_md02`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `th_md02` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_tp` int(11) DEFAULT NULL,
  `modulo` int(11) DEFAULT NULL,
  `fk` int(11) DEFAULT NULL,
  `argumentos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `inhibir` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `modulo` (`modulo`),
  KEY `codigo_tp` (`codigo_tp`),
  CONSTRAINT `_md02_thfk_1` FOREIGN KEY (`codigo_tp`) REFERENCES `trb_md02` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `th_md02`
--

LOCK TABLES `th_md02` WRITE;
/*!40000 ALTER TABLE `th_md02` DISABLE KEYS */;
INSERT INTO `th_md02` VALUES (1,2,4,NULL,'{\"floor\":\"5\",\"room\":\"22\",\"zone\":\"14\",\"type\":\"2\",\"nemo\":\"2\"}',0);
/*!40000 ALTER TABLE `th_md02` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `th_rasp_dali_e`
--

DROP TABLE IF EXISTS `th_rasp_dali_e`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `th_rasp_dali_e` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_tp` int(11) DEFAULT NULL,
  `modulo` int(11) DEFAULT NULL,
  `fk` int(11) DEFAULT NULL,
  `argumentos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `inhibir` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `modulo` (`modulo`),
  KEY `codigo_tp` (`codigo_tp`),
  CONSTRAINT `_rasp_dali_e_thfk_1` FOREIGN KEY (`codigo_tp`) REFERENCES `trb_rasp_dali_e` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `th_rasp_dali_e`
--

LOCK TABLES `th_rasp_dali_e` WRITE;
/*!40000 ALTER TABLE `th_rasp_dali_e` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_rasp_dali_e` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `th_rasp_dali_s`
--

DROP TABLE IF EXISTS `th_rasp_dali_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `th_rasp_dali_s` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_tp` int(11) DEFAULT NULL,
  `modulo` int(11) DEFAULT NULL,
  `fk` int(11) DEFAULT NULL,
  `argumentos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `inhibir` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `modulo` (`modulo`),
  KEY `codigo_tp` (`codigo_tp`),
  CONSTRAINT `_rasp_dali_s_thfk_1` FOREIGN KEY (`codigo_tp`) REFERENCES `trb_rasp_dali_s` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `th_rasp_dali_s`
--

LOCK TABLES `th_rasp_dali_s` WRITE;
/*!40000 ALTER TABLE `th_rasp_dali_s` DISABLE KEYS */;
INSERT INTO `th_rasp_dali_s` VALUES (1,1,4,NULL,'{\"floor\":\"5\",\"room\":\"26\",\"zone\":\"1\",\"type\":\"1\",\"nemo\":\"0\"}',0),(2,2,4,NULL,'{\"floor\":\"5\",\"room\":\"26\",\"zone\":\"2\",\"type\":\"1\",\"nemo\":\"0\"}',0),(3,3,4,NULL,'{\"floor\":\"5\",\"room\":\"26\",\"zone\":\"3\",\"type\":\"1\",\"nemo\":\"0\"}',0),(4,4,4,NULL,'{\"floor\":\"5\",\"room\":\"27\",\"zone\":\"4\",\"type\":\"1\",\"nemo\":\"0\"}',0),(5,5,4,NULL,'{\"floor\":\"5\",\"room\":\"27\",\"zone\":\"5\",\"type\":\"1\",\"nemo\":\"0\"}',0),(6,6,4,NULL,'{\"floor\":\"5\",\"room\":\"28\",\"zone\":\"6\",\"type\":\"1\",\"nemo\":\"0\"}',0),(7,7,4,NULL,'{\"floor\":\"5\",\"room\":\"28\",\"zone\":\"7\",\"type\":\"1\",\"nemo\":\"0\"}',0),(8,8,4,NULL,'{\"floor\":\"5\",\"room\":\"28\",\"zone\":\"8\",\"type\":\"1\",\"nemo\":\"0\"}',0),(9,9,4,NULL,'{\"floor\":\"5\",\"room\":\"29\",\"zone\":\"9\",\"type\":\"1\",\"nemo\":\"0\"}',0),(10,10,4,NULL,'{\"floor\":\"5\",\"room\":\"29\",\"zone\":\"10\",\"type\":\"1\",\"nemo\":\"0\"}',0),(11,11,4,NULL,'{\"floor\":\"5\",\"room\":\"30\",\"zone\":\"11\",\"type\":\"1\",\"nemo\":\"0\"}',0),(12,12,4,NULL,'{\"floor\":\"5\",\"room\":\"30\",\"zone\":\"12\",\"type\":\"1\",\"nemo\":\"0\"}',0),(13,13,4,NULL,'{\"floor\":\"5\",\"room\":\"30\",\"zone\":\"13\",\"type\":\"1\",\"nemo\":\"0\"}',0),(14,14,4,NULL,'{\"floor\":\"5\",\"room\":\"31\",\"zone\":\"14\",\"type\":\"1\",\"nemo\":\"0\"}',0),(15,15,4,NULL,'{\"floor\":\"5\",\"room\":\"31\",\"zone\":\"15\",\"type\":\"1\",\"nemo\":\"0\"}',0),(16,16,4,NULL,'{\"floor\":\"5\",\"room\":\"32\",\"zone\":\"16\",\"type\":\"1\",\"nemo\":\"0\"}',0),(17,17,4,NULL,'{\"floor\":\"5\",\"room\":\"32\",\"zone\":\"17\",\"type\":\"1\",\"nemo\":\"0\"}',0),(18,18,4,NULL,'{\"floor\":\"5\",\"room\":\"32\",\"zone\":\"18\",\"type\":\"1\",\"nemo\":\"0\"}',0),(19,19,4,NULL,'{\"floor\":\"5\",\"room\":\"33\",\"zone\":\"19\",\"type\":\"1\",\"nemo\":\"0\"}',0),(20,20,4,NULL,'{\"floor\":\"5\",\"room\":\"33\",\"zone\":\"20\",\"type\":\"1\",\"nemo\":\"0\"}',0),(21,21,4,NULL,'{\"floor\":\"3\",\"room\":\"11\",\"zone\":\"21\",\"type\":\"1\",\"nemo\":\"0\"}',0),(22,22,4,NULL,'{\"floor\":\"3\",\"room\":\"11\",\"zone\":\"22\",\"type\":\"1\",\"nemo\":\"0\"}',0),(23,23,4,NULL,'{\"floor\":\"3\",\"room\":\"11\",\"zone\":\"23\",\"type\":\"1\",\"nemo\":\"0\"}',0),(24,24,4,NULL,'{\"floor\":\"3\",\"room\":\"12\",\"zone\":\"24\",\"type\":\"1\",\"nemo\":\"0\"}',0),(25,25,4,NULL,'{\"floor\":\"3\",\"room\":\"12\",\"zone\":\"25\",\"type\":\"1\",\"nemo\":\"0\"}',0),(26,26,4,NULL,'{\"floor\":\"6\",\"room\":\"34\",\"zone\":\"26\",\"type\":\"1\",\"nemo\":\"0\"}',0),(27,27,4,NULL,'{\"floor\":\"6\",\"room\":\"34\",\"zone\":\"27\",\"type\":\"1\",\"nemo\":\"0\"}',0),(28,28,4,NULL,'{\"floor\":\"6\",\"room\":\"34\",\"zone\":\"28\",\"type\":\"1\",\"nemo\":\"0\"}',0),(29,29,4,NULL,'{\"floor\":\"6\",\"room\":\"35\",\"zone\":\"29\",\"type\":\"1\",\"nemo\":\"0\"}',0),(30,30,4,NULL,'{\"floor\":\"6\",\"room\":\"35\",\"zone\":\"30\",\"type\":\"1\",\"nemo\":\"0\"}',0),(31,31,4,NULL,'{\"floor\":\"4\",\"room\":\"21\",\"zone\":\"31\",\"type\":\"1\",\"nemo\":\"0\"}',0),(32,32,4,NULL,'{\"floor\":\"4\",\"room\":\"21\",\"zone\":\"32\",\"type\":\"1\",\"nemo\":\"0\"}',0),(33,33,4,NULL,'{\"floor\":\"4\",\"room\":\"47\",\"zone\":\"33\",\"type\":\"1\",\"nemo\":\"0\"}',0),(34,34,4,NULL,'{\"floor\":\"4\",\"room\":\"20\",\"zone\":\"34\",\"type\":\"1\",\"nemo\":\"0\"}',0),(35,35,4,NULL,'{\"floor\":\"4\",\"room\":\"14\",\"zone\":\"35\",\"type\":\"1\",\"nemo\":\"0\"}',0),(36,36,4,NULL,'{\"floor\":\"4\",\"room\":\"14\",\"zone\":\"36\",\"type\":\"1\",\"nemo\":\"0\"}',0),(37,37,4,NULL,'{\"floor\":\"4\",\"room\":\"18\",\"zone\":\"37\",\"type\":\"1\",\"nemo\":\"0\"}',0),(38,38,4,NULL,'{\"floor\":\"4\",\"room\":\"18\",\"zone\":\"38\",\"type\":\"1\",\"nemo\":\"0\"}',0),(39,39,4,NULL,'{\"floor\":\"6\",\"room\":\"38\",\"zone\":\"40\",\"type\":\"1\",\"nemo\":\"0\"}',0),(40,40,4,NULL,'{\"floor\":\"6\",\"room\":\"38\",\"zone\":\"41\",\"type\":\"1\",\"nemo\":\"0\"}',0),(41,41,4,NULL,'{\"floor\":\"6\",\"room\":\"39\",\"zone\":\"42\",\"type\":\"1\",\"nemo\":\"0\"}',0),(42,42,4,NULL,'{\"floor\":\"6\",\"room\":\"36\",\"zone\":\"44\",\"type\":\"1\",\"nemo\":\"0\"}',0),(43,43,4,NULL,'{\"floor\":\"6\",\"room\":\"36\",\"zone\":\"45\",\"type\":\"1\",\"nemo\":\"0\"}',0),(44,44,4,NULL,'{\"floor\":\"6\",\"room\":\"37\",\"zone\":\"46\",\"type\":\"1\",\"nemo\":\"0\"}',0),(45,45,4,NULL,'{\"floor\":\"7\",\"room\":\"45\",\"zone\":\"48\",\"type\":\"1\",\"nemo\":\"0\"}',0),(46,46,4,NULL,'{\"floor\":\"7\",\"room\":\"44\",\"zone\":\"49\",\"type\":\"1\",\"nemo\":\"0\"}',0),(47,47,4,NULL,'{\"floor\":\"7\",\"room\":\"44\",\"zone\":\"50\",\"type\":\"1\",\"nemo\":\"0\"}',0),(48,48,4,NULL,'{\"floor\":\"7\",\"room\":\"43\",\"zone\":\"51\",\"type\":\"1\",\"nemo\":\"0\"}',0),(49,49,4,NULL,'{\"floor\":\"7\",\"room\":\"43\",\"zone\":\"52\",\"type\":\"1\",\"nemo\":\"0\"}',0),(50,50,4,NULL,'{\"floor\":\"4\",\"room\":\"13\",\"zone\":\"53\",\"type\":\"1\",\"nemo\":\"0\"}',0),(51,53,4,NULL,'{\"floor\":\"4\",\"room\":\"13\",\"zone\":\"54\",\"type\":\"1\",\"nemo\":\"0\"}',0),(52,54,4,NULL,'{\"floor\":\"4\",\"room\":\"48\",\"zone\":\"55\",\"type\":\"1\",\"nemo\":\"0\"}',0),(53,51,4,NULL,'{\"floor\":\"4\",\"room\":\"13\",\"zone\":\"56\",\"type\":\"1\",\"nemo\":\"0\"}',0),(54,52,4,NULL,'{\"floor\":\"4\",\"room\":\"13\",\"zone\":\"57\",\"type\":\"1\",\"nemo\":\"0\"}',0),(55,55,4,NULL,'{\"floor\":\"4\",\"room\":\"46\",\"zone\":\"58\",\"type\":\"1\",\"nemo\":\"0\"}',0),(56,56,4,NULL,'{\"floor\":\"4\",\"room\":\"72\",\"zone\":\"59\",\"type\":\"1\",\"nemo\":\"0\"}',0),(57,57,4,NULL,'{\"floor\":\"4\",\"room\":\"72\",\"zone\":\"60\",\"type\":\"1\",\"nemo\":\"0\"}',0),(58,58,4,NULL,'{\"floor\":\"4\",\"room\":\"73\",\"zone\":\"61\",\"type\":\"1\",\"nemo\":\"0\"}',0),(59,59,4,NULL,'{\"floor\":\"4\",\"room\":\"73\",\"zone\":\"62\",\"type\":\"1\",\"nemo\":\"0\"}',0),(60,60,4,NULL,'{\"floor\":\"4\",\"room\":\"16\",\"zone\":\"63\",\"type\":\"1\",\"nemo\":\"0\"}',0),(61,61,4,NULL,'{\"floor\":\"4\",\"room\":\"16\",\"zone\":\"64\",\"type\":\"1\",\"nemo\":\"0\"}',0),(62,62,4,NULL,'{\"floor\":\"5\",\"room\":\"55\",\"zone\":\"65\",\"type\":\"1\",\"nemo\":\"0\"}',0),(63,63,4,NULL,'{\"floor\":\"5\",\"room\":\"22\",\"zone\":\"66\",\"type\":\"1\",\"nemo\":\"0\"}',0),(64,64,4,NULL,'{\"floor\":\"5\",\"room\":\"22\",\"zone\":\"67\",\"type\":\"1\",\"nemo\":\"0\"}',0),(65,65,4,NULL,'{\"floor\":\"5\",\"room\":\"22\",\"zone\":\"68\",\"type\":\"1\",\"nemo\":\"0\"}',0),(66,66,4,NULL,'{\"floor\":\"5\",\"room\":\"23\",\"zone\":\"69\",\"type\":\"1\",\"nemo\":\"0\"}',0),(67,67,4,NULL,'{\"floor\":\"5\",\"room\":\"23\",\"zone\":\"70\",\"type\":\"1\",\"nemo\":\"0\"}',0),(68,68,4,NULL,'{\"floor\":\"5\",\"room\":\"23\",\"zone\":\"71\",\"type\":\"1\",\"nemo\":\"0\"}',0),(69,69,4,NULL,'{\"floor\":\"5\",\"room\":\"23\",\"zone\":\"72\",\"type\":\"1\",\"nemo\":\"0\"}',0),(70,70,4,NULL,'{\"floor\":\"5\",\"room\":\"23\",\"zone\":\"73\",\"type\":\"1\",\"nemo\":\"0\"}',0),(71,71,4,NULL,'{\"floor\":\"5\",\"room\":\"53\",\"zone\":\"74\",\"type\":\"1\",\"nemo\":\"0\"}',0),(72,72,4,NULL,'{\"floor\":\"5\",\"room\":\"24\",\"zone\":\"75\",\"type\":\"1\",\"nemo\":\"0\"}',0),(73,73,4,NULL,'{\"floor\":\"5\",\"room\":\"24\",\"zone\":\"76\",\"type\":\"1\",\"nemo\":\"0\"}',0),(74,74,4,NULL,'{\"floor\":\"5\",\"room\":\"25\",\"zone\":\"77\",\"type\":\"1\",\"nemo\":\"0\"}',0),(75,75,4,NULL,'{\"floor\":\"5\",\"room\":\"25\",\"zone\":\"78\",\"type\":\"1\",\"nemo\":\"0\"}',0),(76,76,4,NULL,'{\"floor\":\"5\",\"room\":\"54\",\"zone\":\"79\",\"type\":\"1\",\"nemo\":\"0\"}',0),(77,77,4,NULL,'{\"floor\":\"5\",\"room\":\"71\",\"zone\":\"80\",\"type\":\"1\",\"nemo\":\"0\"}',0),(78,78,4,NULL,'{\"floor\":\"5\",\"room\":\"71\",\"zone\":\"83\",\"type\":\"1\",\"nemo\":\"0\"}',0),(79,79,4,NULL,'{\"floor\":\"4\",\"room\":\"15\",\"zone\":\"84\",\"type\":\"1\",\"nemo\":\"0\"}',0),(80,80,4,NULL,'{\"floor\":\"4\",\"room\":\"15\",\"zone\":\"85\",\"type\":\"1\",\"nemo\":\"0\"}',0),(81,81,4,NULL,'{\"floor\":\"4\",\"room\":\"17\",\"zone\":\"86\",\"type\":\"1\",\"nemo\":\"0\"}',0),(82,82,4,NULL,'{\"floor\":\"4\",\"room\":\"17\",\"zone\":\"87\",\"type\":\"1\",\"nemo\":\"0\"}',0),(83,83,4,NULL,'{\"floor\":\"4\",\"room\":\"65\",\"zone\":\"88\",\"type\":\"1\",\"nemo\":\"0\"}',0),(84,84,4,NULL,'{\"floor\":\"4\",\"room\":\"49\",\"zone\":\"89\",\"type\":\"1\",\"nemo\":\"0\"}',0),(85,85,4,NULL,'{\"floor\":\"4\",\"room\":\"51\",\"zone\":\"90\",\"type\":\"1\",\"nemo\":\"0\"}',0),(86,86,4,NULL,'{\"floor\":\"4\",\"room\":\"50\",\"zone\":\"91\",\"type\":\"1\",\"nemo\":\"0\"}',0),(87,87,4,NULL,'{\"floor\":\"4\",\"room\":\"19\",\"zone\":\"92\",\"type\":\"1\",\"nemo\":\"0\"}',0),(88,88,4,NULL,'{\"floor\":\"4\",\"room\":\"19\",\"zone\":\"93\",\"type\":\"1\",\"nemo\":\"0\"}',0),(89,89,4,NULL,'{\"floor\":\"4\",\"room\":\"68\",\"zone\":\"94\",\"type\":\"1\",\"nemo\":\"0\"}',0),(90,90,4,NULL,'{\"floor\":\"4\",\"room\":\"52\",\"zone\":\"95\",\"type\":\"1\",\"nemo\":\"0\"}',0),(91,91,4,NULL,'{\"floor\":\"3\",\"room\":\"67\",\"zone\":\"96\",\"type\":\"1\",\"nemo\":\"0\"}',0),(92,92,4,NULL,'{\"floor\":\"8\",\"room\":\"70\",\"zone\":\"97\",\"type\":\"1\",\"nemo\":\"0\"}',0),(93,93,4,NULL,'{\"floor\":\"3\",\"room\":\"9\",\"zone\":\"98\",\"type\":\"1\",\"nemo\":\"0\"}',0),(94,94,4,NULL,'{\"floor\":\"3\",\"room\":\"9\",\"zone\":\"99\",\"type\":\"1\",\"nemo\":\"0\"}',0),(95,95,4,NULL,'{\"floor\":\"3\",\"room\":\"9\",\"zone\":\"100\",\"type\":\"1\",\"nemo\":\"0\"}',0),(96,96,4,NULL,'{\"floor\":\"3\",\"room\":\"9\",\"zone\":\"101\",\"type\":\"1\",\"nemo\":\"0\"}',0),(97,97,4,NULL,'{\"floor\":\"3\",\"room\":\"10\",\"zone\":\"102\",\"type\":\"1\",\"nemo\":\"0\"}',0),(98,98,4,NULL,'{\"floor\":\"8\",\"room\":\"69\",\"zone\":\"103\",\"type\":\"1\",\"nemo\":\"0\"}',0),(99,99,4,NULL,'{\"floor\":\"7\",\"room\":\"41\",\"zone\":\"110\",\"type\":\"1\",\"nemo\":\"0\"}',0),(100,100,4,NULL,'{\"floor\":\"7\",\"room\":\"41\",\"zone\":\"110\",\"type\":\"2\",\"nemo\":\"0\"}',0),(101,101,4,NULL,'{\"floor\":\"7\",\"room\":\"41\",\"zone\":\"110\",\"type\":\"1\",\"nemo\":\"0\"}',0),(102,102,4,NULL,'{\"floor\":\"7\",\"room\":\"41\",\"zone\":\"110\",\"type\":\"2\",\"nemo\":\"0\"}',0),(103,103,4,NULL,'{\"floor\":\"7\",\"room\":\"41\",\"zone\":\"110\",\"type\":\"1\",\"nemo\":\"0\"}',0),(104,104,4,NULL,'{\"floor\":\"7\",\"room\":\"41\",\"zone\":\"110\",\"type\":\"2\",\"nemo\":\"0\"}',0),(105,105,4,NULL,'{\"floor\":\"7\",\"room\":\"41\",\"zone\":\"110\",\"type\":\"3\",\"nemo\":\"0\"}',0),(106,106,4,NULL,'{\"floor\":\"7\",\"room\":\"60\",\"zone\":\"106\",\"type\":\"1\",\"nemo\":\"0\"}',0),(107,107,4,NULL,'{\"floor\":\"7\",\"room\":\"58\",\"zone\":\"107\",\"type\":\"1\",\"nemo\":\"0\"}',0),(108,108,4,NULL,'{\"floor\":\"7\",\"room\":\"58\",\"zone\":\"108\",\"type\":\"1\",\"nemo\":\"0\"}',0),(109,109,4,NULL,'{\"floor\":\"7\",\"room\":\"59\",\"zone\":\"109\",\"type\":\"1\",\"nemo\":\"0\"}',0),(110,110,4,NULL,'{\"floor\":\"7\",\"room\":\"59\",\"zone\":\"116\",\"type\":\"1\",\"nemo\":\"0\"}',0),(111,111,4,NULL,'{\"floor\":\"7\",\"room\":\"41\",\"zone\":\"111\",\"type\":\"1\",\"nemo\":\"0\"}',0),(112,112,4,NULL,'{\"floor\":\"7\",\"room\":\"41\",\"zone\":\"111\",\"type\":\"2\",\"nemo\":\"0\"}',0),(113,113,4,NULL,'{\"floor\":\"7\",\"room\":\"41\",\"zone\":\"111\",\"type\":\"1\",\"nemo\":\"0\"}',0),(114,114,4,NULL,'{\"floor\":\"7\",\"room\":\"41\",\"zone\":\"111\",\"type\":\"2\",\"nemo\":\"0\"}',0),(115,115,4,NULL,'{\"floor\":\"7\",\"room\":\"41\",\"zone\":\"111\",\"type\":\"1\",\"nemo\":\"0\"}',0),(116,116,4,NULL,'{\"floor\":\"7\",\"room\":\"41\",\"zone\":\"111\",\"type\":\"2\",\"nemo\":\"0\"}',0),(117,117,4,NULL,'{\"floor\":\"7\",\"room\":\"41\",\"zone\":\"111\",\"type\":\"3\",\"nemo\":\"0\"}',0),(118,118,4,NULL,'{\"floor\":\"2\",\"room\":\"4\",\"zone\":\"118\",\"type\":\"1\",\"nemo\":\"0\"}',0),(119,119,4,NULL,'{\"floor\":\"7\",\"room\":\"40\",\"zone\":\"104\",\"type\":\"1\",\"nemo\":\"0\"}',0),(120,120,4,NULL,'{\"floor\":\"7\",\"room\":\"40\",\"zone\":\"105\",\"type\":\"1\",\"nemo\":\"0\"}',0);
/*!40000 ALTER TABLE `th_rasp_dali_s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `th_rasp_ds18b20`
--

DROP TABLE IF EXISTS `th_rasp_ds18b20`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `th_rasp_ds18b20` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_tp` int(11) DEFAULT NULL,
  `modulo` int(11) DEFAULT NULL,
  `fk` int(11) DEFAULT NULL,
  `argumentos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `inhibir` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `modulo` (`modulo`),
  KEY `codigo_tp` (`codigo_tp`),
  CONSTRAINT `_rasp_ds18b20_thfk_1` FOREIGN KEY (`codigo_tp`) REFERENCES `trb_rasp_ds18b20` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `th_rasp_ds18b20`
--

LOCK TABLES `th_rasp_ds18b20` WRITE;
/*!40000 ALTER TABLE `th_rasp_ds18b20` DISABLE KEYS */;
INSERT INTO `th_rasp_ds18b20` VALUES (1,1,6,0,'{\"cod_consigna\":\"3\",\"cod_rango\":\"4\",\"trb_tpss\":\"7\",\"rb_tpss\":\"2\",\"terminal_tpss\":\"8\",\"trb_tpse\":\"0\",\"rb_tpse\":\"1\",\"terminal_tpse\":\"9\",\"id_climate\":\"1\"}',0),(2,2,6,0,'{\"cod_consigna\":\"5\",\"cod_rango\":\"6\",\"trb_tpss\":\"7\",\"rb_tpss\":\"11\",\"terminal_tpss\":\"8\",\"trb_tpse\":\"0\",\"rb_tpse\":\"10\",\"terminal_tpse\":\"9\",\"id_climate\":\"1\"}',1),(3,3,6,0,'{\"cod_consigna\":\"7\",\"cod_rango\":\"8\",\"trb_tpss\":\"7\",\"rb_tpss\":\"20\",\"terminal_tpss\":\"8\",\"trb_tpse\":\"0\",\"rb_tpse\":\"19\",\"terminal_tpse\":\"9\",\"id_climate\":\"1\"}',0),(4,4,6,0,'{\"cod_consigna\":\"9\",\"cod_rango\":\"10\",\"trb_tpss\":\"7\",\"rb_tpss\":\"29\",\"terminal_tpss\":\"8\",\"trb_tpse\":\"0\",\"rb_tpse\":\"28\",\"terminal_tpse\":\"9\",\"id_climate\":\"1\"}',1),(5,5,6,0,'{\"cod_consigna\":\"11\",\"cod_rango\":\"12\",\"trb_tpss\":\"7\",\"rb_tpss\":\"38\",\"terminal_tpss\":\"8\",\"trb_tpse\":\"0\",\"rb_tpse\":\"37\",\"terminal_tpse\":\"9\",\"id_climate\":\"1\"}',0),(6,6,6,0,'{\"cod_consigna\":\"13\",\"cod_rango\":\"14\",\"trb_tpss\":\"7\",\"rb_tpss\":\"47\",\"terminal_tpss\":\"8\",\"trb_tpse\":\"0\",\"rb_tpse\":\"46\",\"terminal_tpse\":\"9\",\"id_climate\":\"1\"}',1),(7,1,4,NULL,'{\"floor\":\"5\",\"room\":\"26\",\"zone\":\"1\",\"type\":\"0\",\"nemo\":\"2\"}',0),(8,2,4,NULL,'{\"floor\":\"5\",\"room\":\"28\",\"zone\":\"2\",\"type\":\"0\",\"nemo\":\"2\"}',0),(9,3,4,NULL,'{\"floor\":\"5\",\"room\":\"30\",\"zone\":\"3\",\"type\":\"0\",\"nemo\":\"2\"}',0),(10,4,4,NULL,'{\"floor\":\"5\",\"room\":\"32\",\"zone\":\"4\",\"type\":\"0\",\"nemo\":\"2\"}',0),(11,5,4,NULL,'{\"floor\":\"3\",\"room\":\"11\",\"zone\":\"5\",\"type\":\"0\",\"nemo\":\"2\"}',1),(12,6,4,NULL,'{\"floor\":\"6\",\"room\":\"34\",\"zone\":\"6\",\"type\":\"0\",\"nemo\":\"2\"}',0),(13,7,4,NULL,'{\"floor\":\"4\",\"room\":\"21\",\"zone\":\"7\",\"type\":\"0\",\"nemo\":\"2\"}',0),(14,8,4,NULL,'{\"floor\":\"4\",\"room\":\"14\",\"zone\":\"8\",\"type\":\"0\",\"nemo\":\"2\"}',0),(15,9,4,NULL,'{\"floor\":\"4\",\"room\":\"20\",\"zone\":\"9\",\"type\":\"0\",\"nemo\":\"2\"}',0),(16,10,4,NULL,'{\"floor\":\"7\",\"room\":\"36\",\"zone\":\"10\",\"type\":\"0\",\"nemo\":\"2\"}',0),(17,11,4,NULL,'{\"floor\":\"7\",\"room\":\"38\",\"zone\":\"11\",\"type\":\"0\",\"nemo\":\"2\"}',0),(18,12,4,NULL,'{\"floor\":\"7\",\"room\":\"44\",\"zone\":\"12\",\"type\":\"0\",\"nemo\":\"2\"}',0),(19,13,4,NULL,'{\"floor\":\"4\",\"room\":\"46\",\"zone\":\"13\",\"type\":\"0\",\"nemo\":\"2\"}',0),(20,14,4,NULL,'{\"floor\":\"5\",\"room\":\"22\",\"zone\":\"14\",\"type\":\"0\",\"nemo\":\"2\"}',0),(21,15,4,NULL,'{\"floor\":\"5\",\"room\":\"23\",\"zone\":\"15\",\"type\":\"0\",\"nemo\":\"2\"}',0),(22,16,4,NULL,'{\"floor\":\"5\",\"room\":\"53\",\"zone\":\"16\",\"type\":\"0\",\"nemo\":\"2\"}',0),(23,17,4,NULL,'{\"floor\":\"5\",\"room\":\"24\",\"zone\":\"17\",\"type\":\"0\",\"nemo\":\"2\"}',0),(24,18,4,NULL,'{\"floor\":\"5\",\"room\":\"25\",\"zone\":\"18\",\"type\":\"0\",\"nemo\":\"2\"}',0),(25,19,4,NULL,'{\"floor\":\"5\",\"room\":\"54\",\"zone\":\"19\",\"type\":\"0\",\"nemo\":\"2\"}',0),(26,20,4,NULL,'{\"floor\":\"4\",\"room\":\"15\",\"zone\":\"20\",\"type\":\"0\",\"nemo\":\"2\"}',0),(27,21,4,NULL,'{\"floor\":\"4\",\"room\":\"17\",\"zone\":\"21\",\"type\":\"0\",\"nemo\":\"2\"}',0),(28,22,4,NULL,'{\"floor\":\"4\",\"room\":\"19\",\"zone\":\"22\",\"type\":\"0\",\"nemo\":\"2\"}',0),(29,25,4,NULL,'{\"floor\":\"4\",\"room\":\"13\",\"zone\":\"23\",\"type\":\"0\",\"nemo\":\"2\"}',0),(30,7,6,0,'{\"cod_consigna\":\"15\",\"cod_rango\":\"16\",\"trb_tpss\":\"23\",\"rb_tpss\":\"209\",\"terminal_tpss\":\"0\",\"trb_tpse\":\"21\",\"rb_tpse\":\"210\",\"terminal_tpse\":\"0\",\"id_climate\":\"1\"}',1),(31,8,6,0,'{\"cod_consigna\":\"17\",\"cod_rango\":\"18\",\"trb_tpss\":\"7\",\"rb_tpss\":\"104\",\"terminal_tpss\":\"6\",\"trb_tpse\":\"0\",\"rb_tpse\":\"103\",\"terminal_tpse\":\"12\",\"id_climate\":\"1\"}',1),(32,9,6,0,'{\"cod_consigna\":\"19\",\"cod_rango\":\"20\",\"trb_tpss\":\"7\",\"rb_tpss\":\"104\",\"terminal_tpss\":\"5\",\"trb_tpse\":\"0\",\"rb_tpse\":\"103\",\"terminal_tpse\":\"11\",\"id_climate\":\"1\"}',0),(33,13,6,0,'{\"cod_consigna\":\"21\",\"cod_rango\":\"22\",\"trb_tpss\":\"23\",\"rb_tpss\":\"211\",\"terminal_tpss\":\"0\",\"trb_tpse\":\"21\",\"rb_tpse\":\"212\",\"terminal_tpse\":\"0\",\"id_climate\":\"1\"}',0),(34,14,6,0,'{\"cod_consigna\":\"23\",\"cod_rango\":\"24\",\"trb_tpss\":\"23\",\"rb_tpss\":\"205\",\"terminal_tpss\":\"0\",\"trb_tpse\":\"21\",\"rb_tpse\":\"207\",\"terminal_tpse\":\"0\",\"id_climate\":\"1\"}',0),(35,15,6,0,'{\"cod_consigna\":\"25\",\"cod_rango\":\"26\",\"trb_tpss\":\"23\",\"rb_tpss\":\"205\",\"terminal_tpss\":\"1\",\"trb_tpse\":\"21\",\"rb_tpse\":\"207\",\"terminal_tpse\":\"1\",\"id_climate\":\"1\"}',0),(36,16,6,0,'{\"cod_consigna\":\"27\",\"cod_rango\":\"28\",\"trb_tpss\":\"23\",\"rb_tpss\":\"205\",\"terminal_tpss\":\"2\",\"trb_tpse\":\"21\",\"rb_tpse\":\"207\",\"terminal_tpse\":\"2\",\"id_climate\":\"1\"}',0),(37,17,6,0,'{\"cod_consigna\":\"29\",\"cod_rango\":\"30\",\"trb_tpss\":\"23\",\"rb_tpss\":\"205\",\"terminal_tpss\":\"3\",\"trb_tpse\":\"21\",\"rb_tpse\":\"207\",\"terminal_tpse\":\"3\",\"id_climate\":\"1\"}',0),(38,18,6,0,'{\"cod_consigna\":\"31\",\"cod_rango\":\"32\",\"trb_tpss\":\"23\",\"rb_tpss\":\"205\",\"terminal_tpss\":\"4\",\"trb_tpse\":\"21\",\"rb_tpse\":\"207\",\"terminal_tpse\":\"4\",\"id_climate\":\"1\"}',0),(39,19,6,0,'{\"cod_consigna\":\"33\",\"cod_rango\":\"34\",\"trb_tpss\":\"23\",\"rb_tpss\":\"205\",\"terminal_tpss\":\"5\",\"trb_tpse\":\"21\",\"rb_tpse\":\"207\",\"terminal_tpse\":\"5\",\"id_climate\":\"1\"}',0),(40,20,6,0,'{\"cod_consigna\":\"35\",\"cod_rango\":\"36\",\"trb_tpss\":\"23\",\"rb_tpss\":\"211\",\"terminal_tpss\":\"3\",\"trb_tpse\":\"21\",\"rb_tpse\":\"212\",\"terminal_tpse\":\"3\",\"id_climate\":\"1\"}',0),(41,21,6,0,'{\"cod_consigna\":\"37\",\"cod_rango\":\"38\",\"trb_tpss\":\"23\",\"rb_tpss\":\"211\",\"terminal_tpss\":\"2\",\"trb_tpse\":\"21\",\"rb_tpse\":\"212\",\"terminal_tpse\":\"2\",\"id_climate\":\"1\"}',1),(42,25,6,0,'{\"cod_consigna\":\"39\",\"cod_rango\":\"40\",\"trb_tpss\":\"7\",\"rb_tpss\":\"104\",\"terminal_tpss\":\"0\",\"trb_tpse\":\"0\",\"rb_tpse\":\"103\",\"terminal_tpse\":\"5\",\"id_climate\":\"1\"}',0),(43,22,6,NULL,'{\"cod_consigna\":\"41\",\"cod_rango\":\"42\",\"trb_tpss\":\"23\",\"rb_tpss\":\"209\",\"terminal_tpss\":\"2\",\"trb_tpse\":\"21\",\"rb_tpse\":\"210\",\"terminal_tpse\":\"2\",\"id_climate\":\"1\"}',0),(44,36,6,0,'{\"cod_consigna\":\"47\",\"cod_rango\":\"48\",\"trb_tpss\":\"7\",\"rb_tpss\":\"312\",\"terminal_tpss\":\"2\",\"trb_tpse\":\"0\",\"rb_tpse\":\"311\",\"terminal_tpse\":\"2\",\"id_climate\":\"1\"}',0),(45,28,6,0,'{\"cod_consigna\":\"49\",\"cod_rango\":\"50\",\"trb_tpss\":\"7\",\"rb_tpss\":\"315\",\"terminal_tpss\":\"6\",\"trb_tpse\":\"0\",\"rb_tpse\":\"314\",\"terminal_tpse\":\"6\",\"id_climate\":\"1\"}',0),(46,36,4,NULL,'{\"floor\":\"7\",\"room\":\"40\",\"zone\":\"25\",\"type\":\"0\",\"nemo\":\"2\"}',0),(47,28,4,NULL,'{\"floor\":\"7\",\"room\":\"41\",\"zone\":\"26\",\"type\":\"0\",\"nemo\":\"2\"}',0);
/*!40000 ALTER TABLE `th_rasp_ds18b20` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `th_rasp_ed`
--

DROP TABLE IF EXISTS `th_rasp_ed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `th_rasp_ed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_tp` int(11) DEFAULT NULL,
  `modulo` int(11) DEFAULT NULL,
  `fk` int(11) DEFAULT NULL,
  `argumentos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `inhibir` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `modulo` (`modulo`),
  KEY `codigo_tp` (`codigo_tp`),
  CONSTRAINT `_rasp_ed_thfk_1` FOREIGN KEY (`codigo_tp`) REFERENCES `trb_rasp_ed` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `th_rasp_ed`
--

LOCK TABLES `th_rasp_ed` WRITE;
/*!40000 ALTER TABLE `th_rasp_ed` DISABLE KEYS */;
INSERT INTO `th_rasp_ed` VALUES (1,1,4,NULL,'{\"floor\":\"5\",\"room\":\"26\",\"zone\":\"1\",\"type\":\"0\",\"nemo\":\"0\"}',0),(2,2,4,NULL,'{\"floor\":\"5\",\"room\":\"26\",\"zone\":\"2\",\"type\":\"0\",\"nemo\":\"0\"}',0),(3,3,4,NULL,'{\"floor\":\"5\",\"room\":\"26\",\"zone\":\"3\",\"type\":\"0\",\"nemo\":\"0\"}',0),(4,4,4,NULL,'{\"floor\":\"5\",\"room\":\"27\",\"zone\":\"4\",\"type\":\"0\",\"nemo\":\"0\"}',0),(5,5,4,NULL,'{\"floor\":\"5\",\"room\":\"27\",\"zone\":\"5\",\"type\":\"0\",\"nemo\":\"0\"}',0),(6,15,4,NULL,'{\"floor\":\"5\",\"room\":\"28\",\"zone\":\"6\",\"type\":\"0\",\"nemo\":\"0\"}',0),(7,16,4,NULL,'{\"floor\":\"5\",\"room\":\"28\",\"zone\":\"7\",\"type\":\"0\",\"nemo\":\"0\"}',0),(8,17,4,NULL,'{\"floor\":\"5\",\"room\":\"28\",\"zone\":\"8\",\"type\":\"0\",\"nemo\":\"0\"}',0),(9,18,4,NULL,'{\"floor\":\"5\",\"room\":\"29\",\"zone\":\"9\",\"type\":\"0\",\"nemo\":\"0\"}',0),(10,19,4,NULL,'{\"floor\":\"5\",\"room\":\"29\",\"zone\":\"10\",\"type\":\"0\",\"nemo\":\"0\"}',0),(11,29,4,NULL,'{\"floor\":\"5\",\"room\":\"30\",\"zone\":\"11\",\"type\":\"0\",\"nemo\":\"0\"}',0),(12,30,4,NULL,'{\"floor\":\"5\",\"room\":\"30\",\"zone\":\"12\",\"type\":\"0\",\"nemo\":\"0\"}',0),(13,31,4,NULL,'{\"floor\":\"5\",\"room\":\"30\",\"zone\":\"13\",\"type\":\"0\",\"nemo\":\"0\"}',0),(14,32,4,NULL,'{\"floor\":\"5\",\"room\":\"31\",\"zone\":\"14\",\"type\":\"0\",\"nemo\":\"0\"}',0),(15,33,4,NULL,'{\"floor\":\"5\",\"room\":\"31\",\"zone\":\"15\",\"type\":\"0\",\"nemo\":\"0\"}',0),(16,43,4,NULL,'{\"floor\":\"5\",\"room\":\"32\",\"zone\":\"16\",\"type\":\"0\",\"nemo\":\"0\"}',0),(17,44,4,NULL,'{\"floor\":\"5\",\"room\":\"32\",\"zone\":\"17\",\"type\":\"0\",\"nemo\":\"0\"}',0),(18,45,4,NULL,'{\"floor\":\"5\",\"room\":\"32\",\"zone\":\"18\",\"type\":\"0\",\"nemo\":\"0\"}',0),(19,46,4,NULL,'{\"floor\":\"5\",\"room\":\"33\",\"zone\":\"19\",\"type\":\"0\",\"nemo\":\"0\"}',0),(20,47,4,NULL,'{\"floor\":\"5\",\"room\":\"33\",\"zone\":\"20\",\"type\":\"0\",\"nemo\":\"0\"}',0),(21,57,4,NULL,'{\"floor\":\"3\",\"room\":\"11\",\"zone\":\"21\",\"type\":\"0\",\"nemo\":\"0\"}',0),(22,58,4,NULL,'{\"floor\":\"3\",\"room\":\"11\",\"zone\":\"22\",\"type\":\"0\",\"nemo\":\"0\"}',0),(23,59,4,NULL,'{\"floor\":\"3\",\"room\":\"11\",\"zone\":\"23\",\"type\":\"0\",\"nemo\":\"0\"}',0),(24,60,4,NULL,'{\"floor\":\"3\",\"room\":\"12\",\"zone\":\"24\",\"type\":\"0\",\"nemo\":\"0\"}',0),(25,61,4,NULL,'{\"floor\":\"3\",\"room\":\"12\",\"zone\":\"25\",\"type\":\"0\",\"nemo\":\"0\"}',0),(26,71,4,NULL,'{\"floor\":\"6\",\"room\":\"34\",\"zone\":\"26\",\"type\":\"0\",\"nemo\":\"0\"}',0),(27,72,4,NULL,'{\"floor\":\"6\",\"room\":\"34\",\"zone\":\"27\",\"type\":\"0\",\"nemo\":\"0\"}',0),(28,73,4,NULL,'{\"floor\":\"6\",\"room\":\"34\",\"zone\":\"28\",\"type\":\"0\",\"nemo\":\"0\"}',0),(29,74,4,NULL,'{\"floor\":\"6\",\"room\":\"35\",\"zone\":\"29\",\"type\":\"0\",\"nemo\":\"0\"}',0),(30,75,4,NULL,'{\"floor\":\"6\",\"room\":\"35\",\"zone\":\"30\",\"type\":\"0\",\"nemo\":\"0\"}',0),(31,6,4,NULL,'{\"floor\":\"5\",\"room\":\"26\",\"zone\":\"1\",\"type\":\"0\",\"nemo\":\"4\"}',0),(32,7,4,NULL,'{\"floor\":\"5\",\"room\":\"26\",\"zone\":\"2\",\"type\":\"0\",\"nemo\":\"4\"}',0),(33,8,4,NULL,'{\"floor\":\"5\",\"room\":\"26\",\"zone\":\"3\",\"type\":\"0\",\"nemo\":\"4\"}',0),(34,20,4,NULL,'{\"floor\":\"5\",\"room\":\"28\",\"zone\":\"4\",\"type\":\"0\",\"nemo\":\"4\"}',0),(35,21,4,NULL,'{\"floor\":\"5\",\"room\":\"28\",\"zone\":\"5\",\"type\":\"0\",\"nemo\":\"4\"}',0),(36,22,4,NULL,'{\"floor\":\"5\",\"room\":\"28\",\"zone\":\"6\",\"type\":\"0\",\"nemo\":\"4\"}',0),(37,34,4,NULL,'{\"floor\":\"5\",\"room\":\"30\",\"zone\":\"7\",\"type\":\"0\",\"nemo\":\"4\"}',0),(38,35,4,NULL,'{\"floor\":\"5\",\"room\":\"30\",\"zone\":\"8\",\"type\":\"0\",\"nemo\":\"4\"}',0),(39,36,4,NULL,'{\"floor\":\"5\",\"room\":\"30\",\"zone\":\"9\",\"type\":\"0\",\"nemo\":\"4\"}',0),(40,48,4,NULL,'{\"floor\":\"5\",\"room\":\"32\",\"zone\":\"10\",\"type\":\"0\",\"nemo\":\"4\"}',0),(41,49,4,NULL,'{\"floor\":\"5\",\"room\":\"32\",\"zone\":\"11\",\"type\":\"0\",\"nemo\":\"4\"}',0),(42,50,4,NULL,'{\"floor\":\"5\",\"room\":\"32\",\"zone\":\"12\",\"type\":\"0\",\"nemo\":\"4\"}',0),(43,62,4,NULL,'{\"floor\":\"3\",\"room\":\"11\",\"zone\":\"13\",\"type\":\"0\",\"nemo\":\"4\"}',0),(44,63,4,NULL,'{\"floor\":\"3\",\"room\":\"11\",\"zone\":\"14\",\"type\":\"0\",\"nemo\":\"4\"}',0),(45,64,4,NULL,'{\"floor\":\"3\",\"room\":\"11\",\"zone\":\"15\",\"type\":\"0\",\"nemo\":\"4\"}',0),(46,76,4,NULL,'{\"floor\":\"6\",\"room\":\"34\",\"zone\":\"16\",\"type\":\"0\",\"nemo\":\"4\"}',0),(47,77,4,NULL,'{\"floor\":\"6\",\"room\":\"34\",\"zone\":\"17\",\"type\":\"0\",\"nemo\":\"4\"}',0),(48,78,4,NULL,'{\"floor\":\"6\",\"room\":\"34\",\"zone\":\"18\",\"type\":\"0\",\"nemo\":\"4\"}',0),(49,91,4,NULL,'{\"floor\":\"4\",\"room\":\"21\",\"zone\":\"31\",\"type\":\"0\",\"nemo\":\"0\"}',0),(50,92,4,NULL,'{\"floor\":\"4\",\"room\":\"21\",\"zone\":\"32\",\"type\":\"0\",\"nemo\":\"0\"}',0),(51,93,4,NULL,'{\"floor\":\"4\",\"room\":\"47\",\"zone\":\"33\",\"type\":\"0\",\"nemo\":\"0\"}',0),(52,97,4,NULL,'{\"floor\":\"4\",\"room\":\"20\",\"zone\":\"34\",\"type\":\"0\",\"nemo\":\"0\"}',0),(53,98,4,NULL,'{\"floor\":\"4\",\"room\":\"14\",\"zone\":\"35\",\"type\":\"0\",\"nemo\":\"0\"}',0),(54,99,4,NULL,'{\"floor\":\"4\",\"room\":\"14\",\"zone\":\"36\",\"type\":\"0\",\"nemo\":\"0\"}',0),(55,100,4,NULL,'{\"floor\":\"4\",\"room\":\"20\",\"zone\":\"37\",\"type\":\"0\",\"nemo\":\"0\"}',0),(56,101,4,NULL,'{\"floor\":\"4\",\"room\":\"20\",\"zone\":\"38\",\"type\":\"0\",\"nemo\":\"0\"}',0),(57,103,4,NULL,'{\"floor\":\"4\",\"room\":\"20\",\"zone\":\"39\",\"type\":\"0\",\"nemo\":\"0\"}',1),(58,95,4,NULL,'{\"floor\":\"4\",\"room\":\"21\",\"zone\":\"19\",\"type\":\"0\",\"nemo\":\"4\"}',0),(59,104,4,NULL,'{\"floor\":\"6\",\"room\":\"38\",\"zone\":\"40\",\"type\":\"0\",\"nemo\":\"0\"}',0),(60,105,4,NULL,'{\"floor\":\"6\",\"room\":\"38\",\"zone\":\"41\",\"type\":\"0\",\"nemo\":\"0\"}',0),(61,106,4,NULL,'{\"floor\":\"6\",\"room\":\"39\",\"zone\":\"42\",\"type\":\"0\",\"nemo\":\"0\"}',0),(62,107,4,NULL,'{\"floor\":\"6\",\"room\":\"39\",\"zone\":\"43\",\"type\":\"0\",\"nemo\":\"0\"}',0),(63,108,4,NULL,'{\"floor\":\"6\",\"room\":\"36\",\"zone\":\"44\",\"type\":\"0\",\"nemo\":\"0\"}',0),(64,109,4,NULL,'{\"floor\":\"6\",\"room\":\"36\",\"zone\":\"45\",\"type\":\"0\",\"nemo\":\"0\"}',0),(65,110,4,NULL,'{\"floor\":\"6\",\"room\":\"37\",\"zone\":\"46\",\"type\":\"0\",\"nemo\":\"0\"}',0),(66,111,4,NULL,'{\"floor\":\"6\",\"room\":\"37\",\"zone\":\"47\",\"type\":\"0\",\"nemo\":\"0\"}',0),(67,112,4,NULL,'{\"floor\":\"6\",\"room\":\"56\",\"zone\":\"48\",\"type\":\"0\",\"nemo\":\"0\"}',0),(68,113,4,NULL,'{\"floor\":\"7\",\"room\":\"44\",\"zone\":\"49\",\"type\":\"0\",\"nemo\":\"0\"}',0),(69,114,4,NULL,'{\"floor\":\"7\",\"room\":\"44\",\"zone\":\"50\",\"type\":\"0\",\"nemo\":\"0\"}',0),(70,115,4,NULL,'{\"floor\":\"7\",\"room\":\"43\",\"zone\":\"51\",\"type\":\"0\",\"nemo\":\"0\"}',0),(71,116,4,NULL,'{\"floor\":\"7\",\"room\":\"43\",\"zone\":\"52\",\"type\":\"0\",\"nemo\":\"0\"}',0),(72,117,4,NULL,'{\"floor\":\"4\",\"room\":\"13\",\"zone\":\"53\",\"type\":\"0\",\"nemo\":\"0\"}',0),(73,120,4,NULL,'{\"floor\":\"4\",\"room\":\"13\",\"zone\":\"54\",\"type\":\"0\",\"nemo\":\"0\"}',0),(74,121,4,NULL,'{\"floor\":\"4\",\"room\":\"48\",\"zone\":\"55\",\"type\":\"0\",\"nemo\":\"0\"}',0),(75,118,4,NULL,'{\"floor\":\"4\",\"room\":\"13\",\"zone\":\"56\",\"type\":\"0\",\"nemo\":\"0\"}',0),(76,119,4,NULL,'{\"floor\":\"4\",\"room\":\"13\",\"zone\":\"57\",\"type\":\"0\",\"nemo\":\"0\"}',0),(77,122,4,NULL,'{\"floor\":\"4\",\"room\":\"46\",\"zone\":\"58\",\"type\":\"0\",\"nemo\":\"0\"}',0),(78,123,4,NULL,'{\"floor\":\"4\",\"room\":\"72\",\"zone\":\"59\",\"type\":\"0\",\"nemo\":\"0\"}',0),(79,124,4,NULL,'{\"floor\":\"4\",\"room\":\"72\",\"zone\":\"60\",\"type\":\"0\",\"nemo\":\"0\"}',0),(80,125,4,NULL,'{\"floor\":\"4\",\"room\":\"73\",\"zone\":\"61\",\"type\":\"0\",\"nemo\":\"0\"}',0),(81,126,4,NULL,'{\"floor\":\"4\",\"room\":\"73\",\"zone\":\"62\",\"type\":\"0\",\"nemo\":\"0\"}',0),(82,127,4,NULL,'{\"floor\":\"4\",\"room\":\"16\",\"zone\":\"63\",\"type\":\"0\",\"nemo\":\"0\"}',0),(83,128,4,NULL,'{\"floor\":\"4\",\"room\":\"16\",\"zone\":\"64\",\"type\":\"0\",\"nemo\":\"0\"}',0),(84,129,4,NULL,'{\"floor\":\"4\",\"room\":\"46\",\"zone\":\"20\",\"type\":\"0\",\"nemo\":\"4\"}',0),(85,130,4,NULL,'{\"floor\":\"4\",\"room\":\"46\",\"zone\":\"21\",\"type\":\"0\",\"nemo\":\"4\"}',0),(86,131,4,NULL,'{\"floor\":\"4\",\"room\":\"13\",\"zone\":\"22\",\"type\":\"0\",\"nemo\":\"4\"}',0),(87,132,4,NULL,'{\"floor\":\"5\",\"room\":\"19\",\"zone\":\"23\",\"type\":\"0\",\"nemo\":\"4\"}',0),(88,142,4,NULL,'{\"floor\":\"5\",\"room\":\"55\",\"zone\":\"65\",\"type\":\"0\",\"nemo\":\"0\"}',0),(89,143,4,NULL,'{\"floor\":\"5\",\"room\":\"22\",\"zone\":\"66\",\"type\":\"0\",\"nemo\":\"0\"}',0),(90,144,4,NULL,'{\"floor\":\"5\",\"room\":\"22\",\"zone\":\"67\",\"type\":\"0\",\"nemo\":\"0\"}',0),(91,145,4,NULL,'{\"floor\":\"5\",\"room\":\"22\",\"zone\":\"68\",\"type\":\"0\",\"nemo\":\"0\"}',0),(92,146,4,NULL,'{\"floor\":\"5\",\"room\":\"23\",\"zone\":\"69\",\"type\":\"0\",\"nemo\":\"0\"}',0),(93,147,4,NULL,'{\"floor\":\"5\",\"room\":\"23\",\"zone\":\"70\",\"type\":\"0\",\"nemo\":\"0\"}',0),(94,148,4,NULL,'{\"floor\":\"5\",\"room\":\"23\",\"zone\":\"71\",\"type\":\"0\",\"nemo\":\"0\"}',0),(95,149,4,NULL,'{\"floor\":\"5\",\"room\":\"23\",\"zone\":\"72\",\"type\":\"0\",\"nemo\":\"0\"}',0),(96,150,4,NULL,'{\"floor\":\"5\",\"room\":\"23\",\"zone\":\"73\",\"type\":\"0\",\"nemo\":\"0\"}',0),(97,151,4,NULL,'{\"floor\":\"5\",\"room\":\"53\",\"zone\":\"74\",\"type\":\"0\",\"nemo\":\"0\"}',0),(98,152,4,NULL,'{\"floor\":\"5\",\"room\":\"24\",\"zone\":\"75\",\"type\":\"0\",\"nemo\":\"0\"}',0),(99,153,4,NULL,'{\"floor\":\"5\",\"room\":\"24\",\"zone\":\"76\",\"type\":\"0\",\"nemo\":\"0\"}',0),(100,154,4,NULL,'{\"floor\":\"5\",\"room\":\"25\",\"zone\":\"77\",\"type\":\"0\",\"nemo\":\"0\"}',0),(101,155,4,NULL,'{\"floor\":\"5\",\"room\":\"25\",\"zone\":\"78\",\"type\":\"0\",\"nemo\":\"0\"}',0),(102,156,4,NULL,'{\"floor\":\"5\",\"room\":\"54\",\"zone\":\"79\",\"type\":\"0\",\"nemo\":\"0\"}',0),(103,157,4,NULL,'{\"floor\":\"5\",\"room\":\"71\",\"zone\":\"80\",\"type\":\"0\",\"nemo\":\"0\"}',0),(104,164,4,NULL,'{\"floor\":\"5\",\"room\":\"54\",\"zone\":\"81\",\"type\":\"0\",\"nemo\":\"0\"}',0),(105,163,4,NULL,'{\"floor\":\"5\",\"room\":\"53\",\"zone\":\"82\",\"type\":\"0\",\"nemo\":\"0\"}',0),(106,165,4,NULL,'{\"floor\":\"5\",\"room\":\"71\",\"zone\":\"83\",\"type\":\"0\",\"nemo\":\"0\"}',0),(107,158,4,NULL,'{\"floor\":\"5\",\"room\":\"22\",\"zone\":\"24\",\"type\":\"0\",\"nemo\":\"4\"}',0),(108,159,4,NULL,'{\"floor\":\"5\",\"room\":\"24\",\"zone\":\"25\",\"type\":\"0\",\"nemo\":\"4\"}',0),(109,160,4,NULL,'{\"floor\":\"5\",\"room\":\"24\",\"zone\":\"26\",\"type\":\"0\",\"nemo\":\"4\"}',0),(110,161,4,NULL,'{\"floor\":\"5\",\"room\":\"22\",\"zone\":\"27\",\"type\":\"0\",\"nemo\":\"4\"}',0),(111,162,4,NULL,'{\"floor\":\"5\",\"room\":\"22\",\"zone\":\"28\",\"type\":\"0\",\"nemo\":\"4\"}',0),(112,166,4,NULL,'{\"floor\":\"4\",\"room\":\"15\",\"zone\":\"84\",\"type\":\"0\",\"nemo\":\"0\"}',0),(113,167,4,NULL,'{\"floor\":\"4\",\"room\":\"15\",\"zone\":\"85\",\"type\":\"0\",\"nemo\":\"0\"}',0),(114,168,4,NULL,'{\"floor\":\"4\",\"room\":\"17\",\"zone\":\"86\",\"type\":\"0\",\"nemo\":\"0\"}',0),(115,169,4,NULL,'{\"floor\":\"4\",\"room\":\"17\",\"zone\":\"87\",\"type\":\"0\",\"nemo\":\"0\"}',0),(116,170,4,NULL,'{\"floor\":\"4\",\"room\":\"65\",\"zone\":\"88\",\"type\":\"0\",\"nemo\":\"0\"}',0),(117,171,4,NULL,'{\"floor\":\"4\",\"room\":\"49\",\"zone\":\"89\",\"type\":\"0\",\"nemo\":\"0\"}',0),(118,172,4,NULL,'{\"floor\":\"4\",\"room\":\"51\",\"zone\":\"90\",\"type\":\"0\",\"nemo\":\"0\"}',0),(119,173,4,NULL,'{\"floor\":\"4\",\"room\":\"50\",\"zone\":\"91\",\"type\":\"0\",\"nemo\":\"0\"}',0),(120,174,4,NULL,'{\"floor\":\"4\",\"room\":\"19\",\"zone\":\"92\",\"type\":\"0\",\"nemo\":\"0\"}',0),(121,175,4,NULL,'{\"floor\":\"4\",\"room\":\"19\",\"zone\":\"93\",\"type\":\"0\",\"nemo\":\"0\"}',0),(122,176,4,NULL,'{\"floor\":\"4\",\"room\":\"68\",\"zone\":\"94\",\"type\":\"0\",\"nemo\":\"0\"}',0),(123,177,4,NULL,'{\"floor\":\"4\",\"room\":\"52\",\"zone\":\"95\",\"type\":\"0\",\"nemo\":\"0\"}',0),(124,85,4,NULL,'{\"floor\":\"5\",\"room\":\"26\",\"zone\":\"29\",\"type\":\"0\",\"nemo\":\"4\"}',0),(125,86,4,NULL,'{\"floor\":\"5\",\"room\":\"28\",\"zone\":\"30\",\"type\":\"0\",\"nemo\":\"4\"}',0),(126,87,4,NULL,'{\"floor\":\"5\",\"room\":\"30\",\"zone\":\"31\",\"type\":\"0\",\"nemo\":\"4\"}',0),(127,88,4,NULL,'{\"floor\":\"5\",\"room\":\"32\",\"zone\":\"32\",\"type\":\"0\",\"nemo\":\"4\"}',0),(128,96,4,NULL,'{\"floor\":\"4\",\"room\":\"21\",\"zone\":\"33\",\"type\":\"0\",\"nemo\":\"4\"}',0),(129,90,4,NULL,'{\"floor\":\"6\",\"room\":\"34\",\"zone\":\"34\",\"type\":\"0\",\"nemo\":\"4\"}',0),(130,89,4,NULL,'{\"floor\":\"3\",\"room\":\"11\",\"zone\":\"35\",\"type\":\"0\",\"nemo\":\"4\"}',0),(131,187,4,NULL,'{\"id1\":\"8\",\"id2\":\"187\",\"id3\":\"188\", \"floor\": \"5\", \"room\": \"22\", \"zone\": \"2\",\"type\":\"0\" ,\"trb\":\"0\",\"nemo\":\"10\"}',0),(132,188,4,NULL,'{\"id1\":\"8\",\"id2\":\"187\",\"id3\":\"188\", \"floor\": \"5\", \"room\": \"22\", \"zone\": \"2\",\"type\":\"0\" ,\"trb\":\"0\",\"nemo\":\"10\"}',0),(133,180,4,NULL,'{\"id1\":\"0\",\"id2\":\"180\",\"id3\":\"181\", \"floor\": \"4\", \"room\": \"14\", \"zone\": \"1\",\"type\":\"1\" ,\"trb\":\"0\",\"nemo\":\"10\"}',0),(134,181,4,NULL,'{\"id1\":\"0\",\"id2\":\"180\",\"id3\":\"181\", \"floor\": \"4\", \"room\": \"14\", \"zone\": \"1\",\"type\":\"1\" ,\"trb\":\"0\",\"nemo\":\"10\"}',0),(135,191,4,NULL,'{\"floor\":\"3\",\"room\":\"9\",\"zone\":\"98\",\"type\":\"0\",\"nemo\":\"0\"}',0),(136,192,4,NULL,'{\"floor\":\"3\",\"room\":\"9\",\"zone\":\"99\",\"type\":\"0\",\"nemo\":\"0\"}',0),(137,193,4,NULL,'{\"floor\":\"3\",\"room\":\"9\",\"zone\":\"100\",\"type\":\"0\",\"nemo\":\"0\"}',0),(138,194,4,NULL,'{\"floor\":\"3\",\"room\":\"9\",\"zone\":\"101\",\"type\":\"0\",\"nemo\":\"0\"}',0),(139,195,4,NULL,'{\"floor\":\"3\",\"room\":\"10\",\"zone\":\"102\",\"type\":\"0\",\"nemo\":\"0\"}',0),(140,196,4,NULL,'{\"floor\":\"8\",\"room\":\"69\",\"zone\":\"103\",\"type\":\"0\",\"nemo\":\"0\"}',0),(141,10,4,NULL,'{\"floor\":\"5\",\"room\":\"26\",\"zone\":\"1\",\"type\":\"4\",\"nemo\":\"2\"}',0),(142,24,4,NULL,'{\"floor\":\"5\",\"room\":\"28\",\"zone\":\"2\",\"type\":\"4\",\"nemo\":\"2\"}',0),(143,38,4,NULL,'{\"floor\":\"5\",\"room\":\"30\",\"zone\":\"3\",\"type\":\"4\",\"nemo\":\"2\"}',0),(144,52,4,NULL,'{\"floor\":\"5\",\"room\":\"32\",\"zone\":\"4\",\"type\":\"4\",\"nemo\":\"2\"}',0),(145,102,4,NULL,'{\"floor\":\"4\",\"room\":\"20\",\"zone\":\"9\",\"type\":\"4\",\"nemo\":\"2\"}',0),(146,103,4,NULL,'{\"floor\":\"4\",\"room\":\"14\",\"zone\":\"8\",\"type\":\"4\",\"nemo\":\"2\"}',0),(147,94,4,NULL,'{\"floor\":\"4\",\"room\":\"21\",\"zone\":\"7\",\"type\":\"4\",\"nemo\":\"2\"}',0),(148,190,4,NULL,'{\"floor\":\"4\",\"room\":\"15\",\"zone\":\"20\",\"type\":\"4\",\"nemo\":\"2\"}',0),(149,189,4,NULL,'{\"floor\":\"4\",\"room\":\"17\",\"zone\":\"21\",\"type\":\"4\",\"nemo\":\"2\"}',0),(150,133,4,NULL,'{\"floor\":\"4\",\"room\":\"46\",\"zone\":\"13\",\"type\":\"4\",\"nemo\":\"2\"}',0),(151,134,4,NULL,'{\"floor\":\"4\",\"room\":\"13\",\"zone\":\"23\",\"type\":\"4\",\"nemo\":\"2\"}',0),(152,66,4,NULL,'{\"floor\":\"3\",\"room\":\"11\",\"zone\":\"5\",\"type\":\"4\",\"nemo\":\"2\"}',0),(153,80,4,NULL,'{\"floor\":\"6\",\"room\":\"34\",\"zone\":\"6\",\"type\":\"4\",\"nemo\":\"2\"}',0),(156,203,4,NULL,'{\"floor\":\"7\",\"room\":\"41\",\"zone\":\"110\",\"type\":\"0\",\"nemo\":\"0\"}',0),(157,199,4,NULL,'{\"floor\":\"7\",\"room\":\"60\",\"zone\":\"106\",\"type\":\"0\",\"nemo\":\"0\"}',0),(158,200,4,NULL,'{\"floor\":\"7\",\"room\":\"58\",\"zone\":\"107\",\"type\":\"0\",\"nemo\":\"0\"}',0),(159,201,4,NULL,'{\"floor\":\"7\",\"room\":\"58\",\"zone\":\"108\",\"type\":\"0\",\"nemo\":\"0\"}',0),(160,202,4,NULL,'{\"floor\":\"7\",\"room\":\"59\",\"zone\":\"109\",\"type\":\"0\",\"nemo\":\"0\"}',0),(161,204,4,NULL,'{\"floor\":\"7\",\"room\":\"41\",\"zone\":\"111\",\"type\":\"0\",\"nemo\":\"0\"}',0),(162,206,4,NULL,'{\"floor\":\"7\",\"room\":\"59\",\"zone\":\"116\",\"type\":\"0\",\"nemo\":\"0\"}',0),(163,205,4,NULL,'{\"floor\":\"7\",\"room\":\"41\",\"zone\":\"36\",\"type\":\"0\",\"nemo\":\"4\"}',0),(164,220,4,NULL,'{\"floor\":\"2\",\"room\":\"6\",\"zone\":\"117\",\"type\":\"0\",\"nemo\":\"0\"}',0),(165,221,4,NULL,'{\"floor\":\"2\",\"room\":\"4\",\"zone\":\"118\",\"type\":\"0\",\"nemo\":\"0\"}',0),(166,223,4,NULL,'{\"floor\":\"2\",\"room\":\"4\",\"zone\":\"119\",\"type\":\"0\",\"nemo\":\"0\"}',0),(167,228,4,NULL,'{\"floor\":\"7\",\"room\":\"40\",\"zone\":\"104\",\"type\":\"0\",\"nemo\":\"0\"}',0),(168,229,4,NULL,'{\"floor\":\"7\",\"room\":\"40\",\"zone\":\"105\",\"type\":\"0\",\"nemo\":\"0\"}',0),(169,234,4,NULL,'{\"floor\":\"7\",\"room\":\"40\",\"zone\":\"37\",\"type\":\"0\",\"nemo\":\"4\"}',0);
/*!40000 ALTER TABLE `th_rasp_ed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `th_rasp_pulsador`
--

DROP TABLE IF EXISTS `th_rasp_pulsador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `th_rasp_pulsador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_tp` int(11) DEFAULT NULL,
  `modulo` int(11) DEFAULT NULL,
  `fk` int(11) DEFAULT NULL,
  `argumentos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `inhibir` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `modulo` (`modulo`),
  KEY `codigo_tp` (`codigo_tp`),
  CONSTRAINT `_rasp_pulsador_thfk_1` FOREIGN KEY (`codigo_tp`) REFERENCES `trb_rasp_pulsador` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `th_rasp_pulsador`
--

LOCK TABLES `th_rasp_pulsador` WRITE;
/*!40000 ALTER TABLE `th_rasp_pulsador` DISABLE KEYS */;
INSERT INTO `th_rasp_pulsador` VALUES (1,1,7,NULL,'{\"trb_tpss\":\"7\",\"rb_tpss\":\"2\",\"terminal_tpss\":\"9\",\"trb_tpse\":\"0\",\"rb_tpse\":\"1\",\"terminal_tpse\":\"10\",\"valves\":[{\"trb\": \"7\",\"rb\": \"2\",\"terminal\": \"8\"}],\"probes\":[{\"trb\": \"1\",\"rb\": \"55\",\"terminal\": \"0\"}]}',0),(2,2,7,NULL,'{\"trb_tpss\":\"7\",\"rb_tpss\":\"11\",\"terminal_tpss\":\"9\",\"trb_tpse\":\"0\",\"rb_tpse\":\"10\",\"terminal_tpse\":\"10\",\"valves\":[{\"trb\": \"7\",\"rb\": \"11\",\"terminal\": \"8\"}],\"probes\":[{\"trb\": \"1\",\"rb\": \"56\",\"terminal\": \"0\"}]}',0),(3,3,7,NULL,'{\"trb_tpss\":\"7\",\"rb_tpss\":\"20\",\"terminal_tpss\":\"9\",\"trb_tpse\":\"0\",\"rb_tpse\":\"19\",\"terminal_tpse\":\"10\",\"valves\":[{\"trb\": \"7\",\"rb\": \"20\",\"terminal\": \"8\"}],\"probes\":[{\"trb\": \"1\",\"rb\": \"57\",\"terminal\": \"0\"}]}',0),(4,4,7,NULL,'{\"trb_tpss\":\"7\",\"rb_tpss\":\"29\",\"terminal_tpss\":\"9\",\"trb_tpse\":\"0\",\"rb_tpse\":\"28\",\"terminal_tpse\":\"10\",\"valves\":[{\"trb\": \"7\",\"rb\": \"29\",\"terminal\": \"8\"}],\"probes\":[{\"trb\": \"1\",\"rb\": \"58\",\"terminal\": \"0\"}]}',0),(5,5,7,NULL,'{\"trb_tpss\":\"7\",\"rb_tpss\":\"38\",\"terminal_tpss\":\"9\",\"trb_tpse\":\"0\",\"rb_tpse\":\"37\",\"terminal_tpse\":\"10\",\"valves\":[{\"trb\": \"7\",\"rb\": \"38\",\"terminal\": \"8\"}],\"probes\":[{\"trb\": \"1\",\"rb\": \"59\",\"terminal\": \"0\"}]}',0),(6,6,7,NULL,'{\"trb_tpss\":\"7\",\"rb_tpss\":\"47\",\"terminal_tpss\":\"9\",\"trb_tpse\":\"0\",\"rb_tpse\":\"46\",\"terminal_tpse\":\"10\",\"valves\":[{\"trb\": \"7\",\"rb\": \"47\",\"terminal\": \"8\"}],\"probes\":[{\"trb\": \"1\",\"rb\": \"60\",\"terminal\": \"0\"}]}',0),(7,11,7,NULL,'{\"trb_tpss\":\"7\",\"rb_tpss\":\"104\",\"terminal_tpss\":\"2\",\"trb_tpse\":\"0\",\"rb_tpse\":\"103\",\"terminal_tpse\":\"3\",\"valves\":[{\"trb\": \"7\",\"rb\": \"104\",\"terminal\": \"0\"}],\"probes\":[{\"trb\": \"1\",\"rb\": \"310\",\"terminal\": \"0\"}]}',0),(8,12,7,NULL,'{\"trb_tpss\":\"23\",\"rb_tpss\":\"205\",\"terminal_tpss\":\"6\",\"trb_tpse\":\"21\",\"rb_tpse\":\"207\",\"terminal_tpse\":\"6\",\"valves\":[{\"trb\": \"23\",\"rb\": \"205\",\"terminal\": \"0\"}],\"probes\":[{\"trb\": \"1\",\"rb\": \"174\",\"terminal\": \"0\"}]}',0),(9,13,7,NULL,'{\"trb_tpss\":\"23\",\"rb_tpss\":\"205\",\"terminal_tpss\":\"7\",\"trb_tpse\":\"21\",\"rb_tpse\":\"207\",\"terminal_tpse\":\"7\",\"valves\":[{\"trb\": \"23\",\"rb\": \"205\",\"terminal\": \"1\"}],\"probes\":[{\"trb\": \"1\",\"rb\": \"175\",\"terminal\": \"0\"}]}',0),(10,14,7,NULL,'{\"trb_tpss\":\"23\",\"rb_tpss\":\"206\",\"terminal_tpss\":\"0\",\"trb_tpse\":\"21\",\"rb_tpse\":\"208\",\"terminal_tpse\":\"0\",\"valves\":[{\"trb\": \"23\",\"rb\": \"205\",\"terminal\": \"2\"}],\"probes\":[{\"trb\": \"1\",\"rb\": \"176\",\"terminal\": \"0\"}]}',0),(11,15,7,NULL,'{\"trb_tpss\":\"23\",\"rb_tpss\":\"206\",\"terminal_tpss\":\"1\",\"trb_tpse\":\"21\",\"rb_tpse\":\"208\",\"terminal_tpse\":\"1\",\"valves\":[{\"trb\": \"23\",\"rb\": \"205\",\"terminal\": \"3\"}],\"probes\":[{\"trb\": \"1\",\"rb\": \"177\",\"terminal\": \"0\"}]}',0),(12,16,7,NULL,'{\"trb_tpss\":\"23\",\"rb_tpss\":\"206\",\"terminal_tpss\":\"2\",\"trb_tpse\":\"21\",\"rb_tpse\":\"208\",\"terminal_tpse\":\"2\",\"valves\":[{\"trb\": \"23\",\"rb\": \"205\",\"terminal\": \"4\"}],\"probes\":[{\"trb\": \"1\",\"rb\": \"178\",\"terminal\": \"0\"}]}',0),(13,17,7,NULL,'{\"trb_tpss\":\"23\",\"rb_tpss\":\"206\",\"terminal_tpss\":\"3\",\"trb_tpse\":\"21\",\"rb_tpse\":\"208\",\"terminal_tpse\":\"3\",\"valves\":[{\"trb\": \"23\",\"rb\": \"205\",\"terminal\": \"5\"}],\"probes\":[{\"trb\": \"1\",\"rb\": \"179\",\"terminal\": \"0\"}]}',0),(14,7,7,NULL,'{\"trb_tpss\":\"7\",\"rb_tpss\":\"62\",\"terminal_tpss\":\"3\",\"trb_tpse\":\"0\",\"rb_tpse\":\"61\",\"terminal_tpse\":\"4\",\"valves\":[{\"trb\": \"23\",\"rb\": \"209\",\"terminal\": \"0\"}],\"probes\":[{\"trb\": \"1\",\"rb\": \"68\",\"terminal\": \"0\"}]}',0),(15,8,7,NULL,'{\"trb_tpss\":\"7\",\"rb_tpss\":\"70\",\"terminal_tpss\":\"5\",\"trb_tpse\":\"0\",\"rb_tpse\":\"69\",\"terminal_tpse\":\"6\",\"valves\":[{\"trb\": \"7\",\"rb\": \"104\",\"terminal\": \"5\"}],\"probes\":[{\"trb\": \"1\",\"rb\": \"74\",\"terminal\": \"0\"}]}',0),(16,9,7,NULL,'{\"trb_tpss\":\"7\",\"rb_tpss\":\"70\",\"terminal_tpss\":\"6\",\"trb_tpse\":\"0\",\"rb_tpse\":\"69\",\"terminal_tpse\":\"8\",\"valves\":[{\"trb\": \"7\",\"rb\": \"104\",\"terminal\": \"6\"}],\"probes\":[{\"trb\": \"1\",\"rb\": \"73\",\"terminal\": \"0\"}]}\"',0),(17,10,7,NULL,'{\"trb_tpss\":\"7\",\"rb_tpss\":\"104\",\"terminal_tpss\":\"3\",\"trb_tpse\":\"0\",\"rb_tpse\":\"103\",\"terminal_tpse\":\"2\",\"valves\":[{\"trb\": \"7\",\"rb\": \"104\",\"terminal\": \"1\"}],\"probes\":[{\"trb\": \"1\",\"rb\": \"119\",\"terminal\": \"0\"}]}\"',0),(18,18,7,NULL,'{\"trb_tpss\":\"7\",\"rb_tpss\":\"185\",\"terminal_tpss\":\"12\",\"trb_tpse\":\"0\",\"rb_tpse\":\"184\",\"terminal_tpse\":\"14\",\"valves\":[{\"trb\": \"23\",\"rb\": \"211\",\"terminal\": \"2\"}],\"probes\":[{\"trb\": \"1\",\"rb\": \"188\",\"terminal\": \"0\"}]}\"',0),(19,19,7,NULL,'{\"trb_tpss\":\"7\",\"rb_tpss\":\"185\",\"terminal_tpss\":\"13\",\"trb_tpse\":\"0\",\"rb_tpse\":\"184\",\"terminal_tpse\":\"15\",\"valves\":[{\"trb\": \"23\",\"rb\": \"211\",\"terminal\": \"3\"}],\"probes\":[{\"trb\": \"1\",\"rb\": \"187\",\"terminal\": \"0\"}]}\"',0);
/*!40000 ALTER TABLE `th_rasp_pulsador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `th_rasp_sa`
--

DROP TABLE IF EXISTS `th_rasp_sa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `th_rasp_sa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_tp` int(11) DEFAULT NULL,
  `modulo` int(11) DEFAULT NULL,
  `fk` int(11) DEFAULT NULL,
  `argumentos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `inhibir` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `modulo` (`modulo`),
  KEY `codigo_tp` (`codigo_tp`),
  CONSTRAINT `_rasp_sa_thfk_1` FOREIGN KEY (`codigo_tp`) REFERENCES `trb_rasp_sa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `th_rasp_sa`
--

LOCK TABLES `th_rasp_sa` WRITE;
/*!40000 ALTER TABLE `th_rasp_sa` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_rasp_sa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `th_rasp_sd`
--

DROP TABLE IF EXISTS `th_rasp_sd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `th_rasp_sd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_tp` int(11) DEFAULT NULL,
  `modulo` int(11) DEFAULT NULL,
  `fk` int(11) DEFAULT NULL,
  `argumentos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `inhibir` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `modulo` (`modulo`),
  KEY `codigo_tp` (`codigo_tp`),
  CONSTRAINT `_rasp_sd_thfk_1` FOREIGN KEY (`codigo_tp`) REFERENCES `trb_rasp_sd` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=345 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `th_rasp_sd`
--

LOCK TABLES `th_rasp_sd` WRITE;
/*!40000 ALTER TABLE `th_rasp_sd` DISABLE KEYS */;
INSERT INTO `th_rasp_sd` VALUES (1,1,3,NULL,'{\"trb\":\"0\",\"rb\":\"1\",\"terminal\":\"0\"}',1),(2,2,3,NULL,'{\"trb\":\"0\",\"rb\":\"1\",\"terminal\":\"1\"}',1),(3,3,3,NULL,'{\"trb\":\"0\",\"rb\":\"1\",\"terminal\":\"2\"}',1),(4,4,3,NULL,'{\"trb\":\"0\",\"rb\":\"1\",\"terminal\":\"3\"}',1),(5,5,3,NULL,'{\"trb\":\"0\",\"rb\":\"1\",\"terminal\":\"4\"}',1),(6,6,3,NULL,'{\"trb\":\"0\",\"rb\":\"1\",\"terminal\":\"5\"}',1),(7,7,3,NULL,'{\"trb\":\"0\",\"rb\":\"1\",\"terminal\":\"6\"}',1),(8,8,3,NULL,'{\"trb\":\"0\",\"rb\":\"1\",\"terminal\":\"7\"}',1),(9,9,3,NULL,'{\"trb\":\"0\",\"rb\":\"1\",\"terminal\":\"9\"}',1),(10,10,3,NULL,'{\"trb\":\"0\",\"rb\":\"10\",\"terminal\":\"0\"}',1),(11,11,3,NULL,'{\"trb\":\"0\",\"rb\":\"10\",\"terminal\":\"1\"}',1),(12,12,3,NULL,'{\"trb\":\"0\",\"rb\":\"10\",\"terminal\":\"2\"}',1),(13,13,3,NULL,'{\"trb\":\"0\",\"rb\":\"10\",\"terminal\":\"3\"}',1),(14,14,3,NULL,'{\"trb\":\"0\",\"rb\":\"10\",\"terminal\":\"4\"}',1),(15,15,3,NULL,'{\"trb\":\"0\",\"rb\":\"10\",\"terminal\":\"5\"}',1),(16,16,3,NULL,'{\"trb\":\"0\",\"rb\":\"10\",\"terminal\":\"6\"}',1),(17,17,3,NULL,'{\"trb\":\"0\",\"rb\":\"10\",\"terminal\":\"7\"}',1),(18,18,3,NULL,'{\"trb\":\"0\",\"rb\":\"10\",\"terminal\":\"9\"}',1),(19,19,3,NULL,'{\"trb\":\"0\",\"rb\":\"19\",\"terminal\":\"0\"}',1),(20,20,3,NULL,'{\"trb\":\"0\",\"rb\":\"19\",\"terminal\":\"1\"}',1),(21,21,3,NULL,'{\"trb\":\"0\",\"rb\":\"19\",\"terminal\":\"2\"}',1),(22,22,3,NULL,'{\"trb\":\"0\",\"rb\":\"19\",\"terminal\":\"3\"}',1),(23,23,3,NULL,'{\"trb\":\"0\",\"rb\":\"19\",\"terminal\":\"4\"}',1),(24,24,3,NULL,'{\"trb\":\"0\",\"rb\":\"19\",\"terminal\":\"5\"}',1),(25,25,3,NULL,'{\"trb\":\"0\",\"rb\":\"19\",\"terminal\":\"6\"}',1),(26,26,3,NULL,'{\"trb\":\"0\",\"rb\":\"19\",\"terminal\":\"7\"}',1),(27,27,3,NULL,'{\"trb\":\"0\",\"rb\":\"19\",\"terminal\":\"9\"}',1),(28,28,3,NULL,'{\"trb\":\"0\",\"rb\":\"28\",\"terminal\":\"0\"}',1),(29,29,3,NULL,'{\"trb\":\"0\",\"rb\":\"28\",\"terminal\":\"1\"}',1),(30,30,3,NULL,'{\"trb\":\"0\",\"rb\":\"28\",\"terminal\":\"2\"}',1),(31,31,3,NULL,'{\"trb\":\"0\",\"rb\":\"28\",\"terminal\":\"3\"}',1),(32,32,3,NULL,'{\"trb\":\"0\",\"rb\":\"28\",\"terminal\":\"4\"}',1),(33,33,3,NULL,'{\"trb\":\"0\",\"rb\":\"28\",\"terminal\":\"5\"}',1),(34,34,3,NULL,'{\"trb\":\"0\",\"rb\":\"28\",\"terminal\":\"6\"}',1),(35,35,3,NULL,'{\"trb\":\"0\",\"rb\":\"28\",\"terminal\":\"7\"}',1),(36,36,3,NULL,'{\"trb\":\"0\",\"rb\":\"28\",\"terminal\":\"9\"}',1),(37,37,3,NULL,'{\"trb\":\"0\",\"rb\":\"37\",\"terminal\":\"0\"}',1),(38,38,3,NULL,'{\"trb\":\"0\",\"rb\":\"37\",\"terminal\":\"1\"}',1),(39,39,3,NULL,'{\"trb\":\"0\",\"rb\":\"37\",\"terminal\":\"2\"}',1),(40,40,3,NULL,'{\"trb\":\"0\",\"rb\":\"37\",\"terminal\":\"3\"}',1),(41,41,3,NULL,'{\"trb\":\"0\",\"rb\":\"37\",\"terminal\":\"4\"}',1),(42,42,3,NULL,'{\"trb\":\"0\",\"rb\":\"37\",\"terminal\":\"5\"}',1),(43,43,3,NULL,'{\"trb\":\"0\",\"rb\":\"37\",\"terminal\":\"6\"}',1),(44,44,3,NULL,'{\"trb\":\"0\",\"rb\":\"37\",\"terminal\":\"7\"}',1),(46,46,3,NULL,'{\"trb\":\"0\",\"rb\":\"46\",\"terminal\":\"0\"}',1),(47,47,3,NULL,'{\"trb\":\"0\",\"rb\":\"46\",\"terminal\":\"1\"}',1),(48,48,3,NULL,'{\"trb\":\"0\",\"rb\":\"46\",\"terminal\":\"2\"}',1),(49,49,3,NULL,'{\"trb\":\"0\",\"rb\":\"46\",\"terminal\":\"3\"}',1),(50,50,3,NULL,'{\"trb\":\"0\",\"rb\":\"46\",\"terminal\":\"4\"}',1),(51,51,3,NULL,'{\"trb\":\"0\",\"rb\":\"46\",\"terminal\":\"5\"}',1),(52,52,3,NULL,'{\"trb\":\"0\",\"rb\":\"46\",\"terminal\":\"6\"}',1),(53,53,3,NULL,'{\"trb\":\"0\",\"rb\":\"46\",\"terminal\":\"7\"}',1),(54,54,3,NULL,'{\"trb\":\"0\",\"rb\":\"46\",\"terminal\":\"9\"}',1),(55,1,4,NULL,'{\"floor\":\"5\",\"room\":\"26\",\"zone\":\"1\",\"type\":\"0\",\"nemo\":\"0\"}',0),(56,2,4,NULL,'{\"floor\":\"5\",\"room\":\"26\",\"zone\":\"2\",\"type\":\"0\",\"nemo\":\"0\"}',0),(57,3,4,NULL,'{\"floor\":\"5\",\"room\":\"26\",\"zone\":\"3\",\"type\":\"0\",\"nemo\":\"0\"}',0),(58,4,4,NULL,'{\"floor\":\"5\",\"room\":\"27\",\"zone\":\"4\",\"type\":\"0\",\"nemo\":\"0\"}',0),(59,5,4,NULL,'{\"floor\":\"5\",\"room\":\"27\",\"zone\":\"5\",\"type\":\"0\",\"nemo\":\"0\"}',0),(60,10,4,NULL,'{\"floor\":\"5\",\"room\":\"28\",\"zone\":\"6\",\"type\":\"0\",\"nemo\":\"0\"}',0),(61,11,4,NULL,'{\"floor\":\"5\",\"room\":\"28\",\"zone\":\"7\",\"type\":\"0\",\"nemo\":\"0\"}',0),(62,12,4,NULL,'{\"floor\":\"5\",\"room\":\"28\",\"zone\":\"8\",\"type\":\"0\",\"nemo\":\"0\"}',0),(63,13,4,NULL,'{\"floor\":\"5\",\"room\":\"29\",\"zone\":\"9\",\"type\":\"0\",\"nemo\":\"0\"}',0),(64,14,4,NULL,'{\"floor\":\"5\",\"room\":\"29\",\"zone\":\"10\",\"type\":\"0\",\"nemo\":\"0\"}',0),(65,19,4,NULL,'{\"floor\":\"5\",\"room\":\"30\",\"zone\":\"11\",\"type\":\"0\",\"nemo\":\"0\"}',0),(66,20,4,NULL,'{\"floor\":\"5\",\"room\":\"30\",\"zone\":\"12\",\"type\":\"0\",\"nemo\":\"0\"}',0),(67,21,4,NULL,'{\"floor\":\"5\",\"room\":\"30\",\"zone\":\"13\",\"type\":\"0\",\"nemo\":\"0\"}',0),(68,22,4,NULL,'{\"floor\":\"5\",\"room\":\"31\",\"zone\":\"14\",\"type\":\"0\",\"nemo\":\"0\"}',0),(69,23,4,NULL,'{\"floor\":\"5\",\"room\":\"31\",\"zone\":\"15\",\"type\":\"0\",\"nemo\":\"0\"}',0),(70,28,4,NULL,'{\"floor\":\"5\",\"room\":\"32\",\"zone\":\"16\",\"type\":\"0\",\"nemo\":\"0\"}',0),(71,29,4,NULL,'{\"floor\":\"5\",\"room\":\"32\",\"zone\":\"17\",\"type\":\"0\",\"nemo\":\"0\"}',0),(72,30,4,NULL,'{\"floor\":\"5\",\"room\":\"32\",\"zone\":\"18\",\"type\":\"0\",\"nemo\":\"0\"}',0),(73,31,4,NULL,'{\"floor\":\"5\",\"room\":\"33\",\"zone\":\"19\",\"type\":\"0\",\"nemo\":\"0\"}',0),(74,32,4,NULL,'{\"floor\":\"5\",\"room\":\"33\",\"zone\":\"20\",\"type\":\"0\",\"nemo\":\"0\"}',0),(75,37,4,NULL,'{\"floor\":\"3\",\"room\":\"11\",\"zone\":\"21\",\"type\":\"0\",\"nemo\":\"0\"}',0),(76,38,4,NULL,'{\"floor\":\"3\",\"room\":\"11\",\"zone\":\"22\",\"type\":\"0\",\"nemo\":\"0\"}',0),(77,39,4,NULL,'{\"floor\":\"3\",\"room\":\"11\",\"zone\":\"23\",\"type\":\"0\",\"nemo\":\"0\"}',0),(78,40,4,NULL,'{\"floor\":\"3\",\"room\":\"12\",\"zone\":\"24\",\"type\":\"0\",\"nemo\":\"0\"}',0),(79,41,4,NULL,'{\"floor\":\"3\",\"room\":\"12\",\"zone\":\"25\",\"type\":\"0\",\"nemo\":\"0\"}',0),(80,46,4,NULL,'{\"floor\":\"6\",\"room\":\"34\",\"zone\":\"26\",\"type\":\"0\",\"nemo\":\"0\"}',0),(81,47,4,NULL,'{\"floor\":\"6\",\"room\":\"34\",\"zone\":\"27\",\"type\":\"0\",\"nemo\":\"0\"}',0),(82,48,4,NULL,'{\"floor\":\"6\",\"room\":\"34\",\"zone\":\"28\",\"type\":\"0\",\"nemo\":\"0\"}',0),(83,49,4,NULL,'{\"floor\":\"6\",\"room\":\"35\",\"zone\":\"29\",\"type\":\"0\",\"nemo\":\"0\"}',0),(84,50,4,NULL,'{\"floor\":\"6\",\"room\":\"35\",\"zone\":\"30\",\"type\":\"0\",\"nemo\":\"0\"}',0),(85,6,4,NULL,'{\"floor\":\"5\",\"room\":\"26\",\"zone\":\"1\",\"type\":\"0\",\"nemo\":\"4\"}',0),(86,7,4,NULL,'{\"floor\":\"5\",\"room\":\"26\",\"zone\":\"2\",\"type\":\"0\",\"nemo\":\"4\"}',0),(87,8,4,NULL,'{\"floor\":\"5\",\"room\":\"26\",\"zone\":\"3\",\"type\":\"0\",\"nemo\":\"4\"}',0),(88,15,4,NULL,'{\"floor\":\"5\",\"room\":\"28\",\"zone\":\"4\",\"type\":\"0\",\"nemo\":\"4\"}',0),(89,16,4,NULL,'{\"floor\":\"5\",\"room\":\"28\",\"zone\":\"5\",\"type\":\"0\",\"nemo\":\"4\"}',0),(90,17,4,NULL,'{\"floor\":\"5\",\"room\":\"28\",\"zone\":\"6\",\"type\":\"0\",\"nemo\":\"4\"}',0),(91,24,4,NULL,'{\"floor\":\"5\",\"room\":\"30\",\"zone\":\"7\",\"type\":\"0\",\"nemo\":\"4\"}',0),(92,25,4,NULL,'{\"floor\":\"5\",\"room\":\"30\",\"zone\":\"8\",\"type\":\"0\",\"nemo\":\"4\"}',0),(93,26,4,NULL,'{\"floor\":\"5\",\"room\":\"30\",\"zone\":\"9\",\"type\":\"0\",\"nemo\":\"4\"}',0),(94,33,4,NULL,'{\"floor\":\"5\",\"room\":\"32\",\"zone\":\"10\",\"type\":\"0\",\"nemo\":\"4\"}',0),(95,34,4,NULL,'{\"floor\":\"5\",\"room\":\"32\",\"zone\":\"11\",\"type\":\"0\",\"nemo\":\"4\"}',0),(96,35,4,NULL,'{\"floor\":\"5\",\"room\":\"32\",\"zone\":\"12\",\"type\":\"0\",\"nemo\":\"4\"}',0),(97,42,4,NULL,'{\"floor\":\"3\",\"room\":\"11\",\"zone\":\"13\",\"type\":\"0\",\"nemo\":\"4\"}',0),(98,43,4,NULL,'{\"floor\":\"3\",\"room\":\"11\",\"zone\":\"14\",\"type\":\"0\",\"nemo\":\"4\"}',0),(99,44,4,NULL,'{\"floor\":\"3\",\"room\":\"11\",\"zone\":\"15\",\"type\":\"0\",\"nemo\":\"4\"}',0),(100,51,4,NULL,'{\"floor\":\"6\",\"room\":\"34\",\"zone\":\"16\",\"type\":\"0\",\"nemo\":\"4\"}',0),(101,52,4,NULL,'{\"floor\":\"6\",\"room\":\"34\",\"zone\":\"17\",\"type\":\"0\",\"nemo\":\"4\"}',0),(102,53,4,NULL,'{\"floor\":\"6\",\"room\":\"34\",\"zone\":\"18\",\"type\":\"0\",\"nemo\":\"4\"}',0),(103,55,3,NULL,'{\"trb\":\"0\",\"rb\":\"1\",\"terminal\":\"10\"}',1),(104,56,3,NULL,'{\"trb\":\"0\",\"rb\":\"1\",\"terminal\":\"15\"}',1),(105,57,3,NULL,'{\"trb\":\"0\",\"rb\":\"10\",\"terminal\":\"10\"}',1),(106,58,3,NULL,'{\"trb\":\"0\",\"rb\":\"10\",\"terminal\":\"15\"}',1),(107,59,3,NULL,'{\"trb\":\"0\",\"rb\":\"19\",\"terminal\":\"10\"}',1),(108,60,3,NULL,'{\"trb\":\"0\",\"rb\":\"19\",\"terminal\":\"15\"}',1),(109,61,3,NULL,'{\"trb\":\"0\",\"rb\":\"28\",\"terminal\":\"10\"}',1),(110,62,3,NULL,'{\"trb\":\"0\",\"rb\":\"28\",\"terminal\":\"15\"}',1),(111,45,3,NULL,'{\"trb\":\"0\",\"rb\":\"37\",\"terminal\":\"10\"}',1),(112,64,3,NULL,'{\"trb\":\"0\",\"rb\":\"37\",\"terminal\":\"15\"}',1),(113,65,3,NULL,'{\"trb\":\"0\",\"rb\":\"46\",\"terminal\":\"10\"}',1),(114,66,3,NULL,'{\"trb\":\"0\",\"rb\":\"46\",\"terminal\":\"15\"}',1),(115,67,3,NULL,'{\"trb\":\"0\",\"rb\":\"61\",\"terminal\":\"0\"}',1),(116,68,3,NULL,'{\"trb\":\"0\",\"rb\":\"61\",\"terminal\":\"1\"}',1),(117,69,3,NULL,'{\"trb\":\"0\",\"rb\":\"61\",\"terminal\":\"2\"}',1),(118,70,3,NULL,'{\"trb\":\"0\",\"rb\":\"61\",\"terminal\":\"4\"}',1),(119,71,3,NULL,'{\"trb\":\"0\",\"rb\":\"61\",\"terminal\":\"5\"}',1),(120,72,3,NULL,'{\"trb\":\"0\",\"rb\":\"61\",\"terminal\":\"6\"}',1),(121,73,3,NULL,'{\"trb\":\"0\",\"rb\":\"69\",\"terminal\":\"0\"}',1),(122,74,3,NULL,'{\"trb\":\"0\",\"rb\":\"69\",\"terminal\":\"1\"}',1),(123,75,3,NULL,'{\"trb\":\"0\",\"rb\":\"69\",\"terminal\":\"2\"}',1),(124,76,3,NULL,'{\"trb\":\"0\",\"rb\":\"69\",\"terminal\":\"3\"}',1),(125,77,3,NULL,'{\"trb\":\"0\",\"rb\":\"69\",\"terminal\":\"4\"}',1),(126,78,3,NULL,'{\"trb\":\"0\",\"rb\":\"69\",\"terminal\":\"6\"}',1),(127,79,3,NULL,'{\"trb\":\"0\",\"rb\":\"69\",\"terminal\":\"8\"}',1),(128,67,4,NULL,'{\"floor\":\"4\",\"room\":\"21\",\"zone\":\"31\",\"type\":\"0\",\"nemo\":\"0\"}',0),(129,68,4,NULL,'{\"floor\":\"4\",\"room\":\"21\",\"zone\":\"32\",\"type\":\"0\",\"nemo\":\"0\"}',0),(130,69,4,NULL,'{\"floor\":\"4\",\"room\":\"47\",\"zone\":\"33\",\"type\":\"0\",\"nemo\":\"0\"}',0),(131,73,4,NULL,'{\"floor\":\"4\",\"room\":\"20\",\"zone\":\"34\",\"type\":\"0\",\"nemo\":\"0\"}',0),(132,74,4,NULL,'{\"floor\":\"4\",\"room\":\"14\",\"zone\":\"35\",\"type\":\"0\",\"nemo\":\"0\"}',0),(133,75,4,NULL,'{\"floor\":\"4\",\"room\":\"14\",\"zone\":\"36\",\"type\":\"0\",\"nemo\":\"0\"}',0),(134,76,4,NULL,'{\"floor\":\"4\",\"room\":\"18\",\"zone\":\"37\",\"type\":\"0\",\"nemo\":\"0\"}',0),(135,77,4,NULL,'{\"floor\":\"4\",\"room\":\"18\",\"zone\":\"38\",\"type\":\"0\",\"nemo\":\"0\"}',0),(136,80,4,NULL,'{\"floor\":\"4\",\"room\":\"20\",\"zone\":\"39\",\"type\":\"0\",\"nemo\":\"0\"}',0),(137,71,4,NULL,'{\"floor\":\"4\",\"room\":\"21\",\"zone\":\"19\",\"type\":\"0\",\"nemo\":\"4\"}',0),(138,92,3,NULL,'{\"trb\":\"0\",\"rb\":\"95\",\"terminal\":\"0\"}',1),(139,93,3,NULL,'{\"trb\":\"0\",\"rb\":\"95\",\"terminal\":\"1\"}',1),(140,94,3,NULL,'{\"trb\":\"0\",\"rb\":\"100\",\"terminal\":\"0\"}',1),(141,95,3,NULL,'{\"trb\":\"0\",\"rb\":\"100\",\"terminal\":\"1\"}',1),(142,96,3,NULL,'{\"trb\":\"0\",\"rb\":\"100\",\"terminal\":\"2\"}',1),(143,98,3,NULL,'{\"trb\":\"0\",\"rb\":\"100\",\"terminal\":\"4\"}',1),(144,97,3,NULL,'{\"trb\":\"0\",\"rb\":\"100\",\"terminal\":\"3\"}',1),(145,99,3,NULL,'{\"trb\":\"0\",\"rb\":\"100\",\"terminal\":\"5\"}',1),(146,100,3,NULL,'{\"trb\":\"0\",\"rb\":\"100\",\"terminal\":\"6\"}',1),(147,101,3,NULL,'{\"trb\":\"0\",\"rb\":\"100\",\"terminal\":\"7\"}',1),(148,102,3,NULL,'{\"trb\":\"0\",\"rb\":\"100\",\"terminal\":\"8\"}',1),(149,103,3,NULL,'{\"trb\":\"0\",\"rb\":\"100\",\"terminal\":\"9\"}',1),(150,104,3,NULL,'{\"trb\":\"0\",\"rb\":\"100\",\"terminal\":\"10\"}',1),(151,105,3,NULL,'{\"trb\":\"0\",\"rb\":\"100\",\"terminal\":\"11\"}',1),(152,106,3,NULL,'{\"trb\":\"0\",\"rb\":\"100\",\"terminal\":\"12\"}',1),(153,107,3,NULL,'{\"trb\":\"0\",\"rb\":\"100\",\"terminal\":\"13\"}',1),(154,108,3,NULL,'{\"trb\":\"0\",\"rb\":\"100\",\"terminal\":\"14\"}',1),(155,109,3,NULL,'{\"trb\":\"0\",\"rb\":\"100\",\"terminal\":\"15\"}',1),(156,81,4,NULL,'{\"floor\":\"6\",\"room\":\"38\",\"zone\":\"40\",\"type\":\"0\",\"nemo\":\"0\"}',0),(157,82,4,NULL,'{\"floor\":\"6\",\"room\":\"38\",\"zone\":\"41\",\"type\":\"0\",\"nemo\":\"0\"}',0),(158,83,4,NULL,'{\"floor\":\"6\",\"room\":\"39\",\"zone\":\"42\",\"type\":\"0\",\"nemo\":\"0\"}',0),(159,84,4,NULL,'{\"floor\":\"6\",\"room\":\"39\",\"zone\":\"43\",\"type\":\"0\",\"nemo\":\"0\"}',0),(160,85,4,NULL,'{\"floor\":\"6\",\"room\":\"36\",\"zone\":\"44\",\"type\":\"0\",\"nemo\":\"0\"}',0),(161,86,4,NULL,'{\"floor\":\"6\",\"room\":\"36\",\"zone\":\"45\",\"type\":\"0\",\"nemo\":\"0\"}',0),(162,87,4,NULL,'{\"floor\":\"6\",\"room\":\"37\",\"zone\":\"46\",\"type\":\"0\",\"nemo\":\"0\"}',0),(163,88,4,NULL,'{\"floor\":\"6\",\"room\":\"37\",\"zone\":\"47\",\"type\":\"0\",\"nemo\":\"0\"}',0),(164,89,4,NULL,'{\"floor\":\"6\",\"room\":\"56\",\"zone\":\"48\",\"type\":\"0\",\"nemo\":\"0\"}',0),(165,90,4,NULL,'{\"floor\":\"7\",\"room\":\"44\",\"zone\":\"49\",\"type\":\"0\",\"nemo\":\"0\"}',0),(166,91,4,NULL,'{\"floor\":\"7\",\"room\":\"44\",\"zone\":\"50\",\"type\":\"0\",\"nemo\":\"0\"}',0),(167,92,4,NULL,'{\"floor\":\"7\",\"room\":\"43\",\"zone\":\"51\",\"type\":\"0\",\"nemo\":\"0\"}',0),(168,93,4,NULL,'{\"floor\":\"7\",\"room\":\"43\",\"zone\":\"52\",\"type\":\"0\",\"nemo\":\"0\"}',0),(169,94,4,NULL,'{\"floor\":\"4\",\"room\":\"13\",\"zone\":\"53\",\"type\":\"0\",\"nemo\":\"0\"}',0),(170,97,4,NULL,'{\"floor\":\"4\",\"room\":\"13\",\"zone\":\"54\",\"type\":\"0\",\"nemo\":\"0\"}',0),(171,98,4,NULL,'{\"floor\":\"4\",\"room\":\"48\",\"zone\":\"55\",\"type\":\"0\",\"nemo\":\"0\"}',0),(172,95,4,NULL,'{\"floor\":\"4\",\"room\":\"13\",\"zone\":\"56\",\"type\":\"0\",\"nemo\":\"0\"}',0),(173,96,4,NULL,'{\"floor\":\"4\",\"room\":\"13\",\"zone\":\"57\",\"type\":\"0\",\"nemo\":\"0\"}',0),(174,99,4,NULL,'{\"floor\":\"4\",\"room\":\"46\",\"zone\":\"58\",\"type\":\"0\",\"nemo\":\"0\"}',0),(175,100,4,NULL,'{\"floor\":\"4\",\"room\":\"72\",\"zone\":\"59\",\"type\":\"0\",\"nemo\":\"0\"}',0),(176,101,4,NULL,'{\"floor\":\"4\",\"room\":\"72\",\"zone\":\"60\",\"type\":\"0\",\"nemo\":\"0\"}',0),(177,102,4,NULL,'{\"floor\":\"4\",\"room\":\"73\",\"zone\":\"61\",\"type\":\"0\",\"nemo\":\"0\"}',0),(178,103,4,NULL,'{\"floor\":\"4\",\"room\":\"73\",\"zone\":\"62\",\"type\":\"0\",\"nemo\":\"0\"}',0),(179,104,4,NULL,'{\"floor\":\"4\",\"room\":\"16\",\"zone\":\"63\",\"type\":\"0\",\"nemo\":\"0\"}',0),(180,105,4,NULL,'{\"floor\":\"4\",\"room\":\"16\",\"zone\":\"64\",\"type\":\"0\",\"nemo\":\"0\"}',0),(181,106,4,NULL,'{\"floor\":\"4\",\"room\":\"46\",\"zone\":\"20\",\"type\":\"0\",\"nemo\":\"4\"}',0),(182,107,4,NULL,'{\"floor\":\"4\",\"room\":\"46\",\"zone\":\"21\",\"type\":\"0\",\"nemo\":\"4\"}',0),(183,108,4,NULL,'{\"floor\":\"4\",\"room\":\"13\",\"zone\":\"22\",\"type\":\"0\",\"nemo\":\"4\"}',0),(184,109,4,NULL,'{\"floor\":\"5\",\"room\":\"19\",\"zone\":\"23\",\"type\":\"0\",\"nemo\":\"4\"}',0),(185,115,3,NULL,'{\"trb\":\"0\",\"rb\":\"155\",\"terminal\":\"0\"}',1),(186,116,3,NULL,'{\"trb\":\"0\",\"rb\":\"155\",\"terminal\":\"1\"}',1),(187,117,3,NULL,'{\"trb\":\"0\",\"rb\":\"155\",\"terminal\":\"2\"}',1),(188,118,3,NULL,'{\"trb\":\"0\",\"rb\":\"155\",\"terminal\":\"3\"}',1),(189,119,3,NULL,'{\"trb\":\"0\",\"rb\":\"155\",\"terminal\":\"4\"}',1),(190,120,3,NULL,'{\"trb\":\"0\",\"rb\":\"155\",\"terminal\":\"5\"}',1),(191,121,3,NULL,'{\"trb\":\"0\",\"rb\":\"155\",\"terminal\":\"6\"}',1),(192,122,3,NULL,'{\"trb\":\"0\",\"rb\":\"155\",\"terminal\":\"7\"}',1),(193,123,3,NULL,'{\"trb\":\"0\",\"rb\":\"155\",\"terminal\":\"8\"}',1),(194,124,3,NULL,'{\"trb\":\"0\",\"rb\":\"155\",\"terminal\":\"9\"}',1),(195,125,3,NULL,'{\"trb\":\"0\",\"rb\":\"155\",\"terminal\":\"10\"}',1),(196,126,3,NULL,'{\"trb\":\"0\",\"rb\":\"155\",\"terminal\":\"11\"}',1),(197,127,3,NULL,'{\"trb\":\"0\",\"rb\":\"155\",\"terminal\":\"12\"}',1),(198,128,3,NULL,'{\"trb\":\"0\",\"rb\":\"155\",\"terminal\":\"13\"}',1),(199,129,3,NULL,'{\"trb\":\"0\",\"rb\":\"155\",\"terminal\":\"14\"}',1),(200,130,3,NULL,'{\"trb\":\"0\",\"rb\":\"155\",\"terminal\":\"15\"}',1),(201,131,3,NULL,'{\"trb\":\"0\",\"rb\":\"180\",\"terminal\":\"8\"}',1),(202,132,3,NULL,'{\"trb\":\"0\",\"rb\":\"180\",\"terminal\":\"9\"} ',1),(203,133,3,NULL,'{\"trb\":\"0\",\"rb\":\"180\",\"terminal\":\"10\"} ',1),(204,134,3,NULL,'{\"trb\":\"0\",\"rb\":\"180\",\"terminal\":\"11\"} ',1),(205,135,3,NULL,'{\"trb\":\"0\",\"rb\":\"180\",\"terminal\":\"12\"} ',1),(206,136,3,NULL,'{\"trb\":\"0\",\"rb\":\"180\",\"terminal\":\"13\"} ',1),(207,137,3,NULL,'{\"trb\":\"0\",\"rb\":\"180\",\"terminal\":\"14\"} ',1),(208,138,3,NULL,'{\"trb\":\"0\",\"rb\":\"180\",\"terminal\":\"15\"} ',1),(209,139,3,NULL,'{\"trb\":\"0\",\"rb\":\"184\",\"terminal\":\"0\"}',1),(210,140,3,NULL,'{\"trb\":\"0\",\"rb\":\"184\",\"terminal\":\"1\"}',1),(211,141,3,NULL,'{\"trb\":\"0\",\"rb\":\"184\",\"terminal\":\"2\"}',1),(212,142,3,NULL,'{\"trb\":\"0\",\"rb\":\"184\",\"terminal\":\"3\"}',1),(213,143,3,NULL,'{\"trb\":\"0\",\"rb\":\"184\",\"terminal\":\"4\"}',1),(214,144,3,NULL,'{\"trb\":\"0\",\"rb\":\"184\",\"terminal\":\"5\"}',1),(215,145,3,NULL,'{\"trb\":\"0\",\"rb\":\"184\",\"terminal\":\"6\"}',1),(216,146,3,NULL,'{\"trb\":\"0\",\"rb\":\"184\",\"terminal\":\"7\"}',1),(217,147,3,NULL,'{\"trb\":\"0\",\"rb\":\"184\",\"terminal\":\"8\"}',1),(218,148,3,NULL,'{\"trb\":\"0\",\"rb\":\"184\",\"terminal\":\"9\"}',1),(220,149,3,NULL,'{\"trb\":\"0\",\"rb\":\"184\",\"terminal\":\"10\"}',1),(221,150,3,NULL,'{\"trb\":\"0\",\"rb\":\"184\",\"terminal\":\"11\"}',1),(222,115,4,NULL,'{\"floor\":\"5\",\"room\":\"55\",\"zone\":\"65\",\"type\":\"0\",\"nemo\":\"0\"}',0),(223,116,4,NULL,'{\"floor\":\"5\",\"room\":\"22\",\"zone\":\"66\",\"type\":\"0\",\"nemo\":\"0\"}',0),(224,117,4,NULL,'{\"floor\":\"5\",\"room\":\"22\",\"zone\":\"67\",\"type\":\"0\",\"nemo\":\"0\"}',0),(225,118,4,NULL,'{\"floor\":\"5\",\"room\":\"22\",\"zone\":\"68\",\"type\":\"0\",\"nemo\":\"0\"}',0),(226,119,4,NULL,'{\"floor\":\"5\",\"room\":\"23\",\"zone\":\"69\",\"type\":\"0\",\"nemo\":\"0\"}',0),(227,120,4,NULL,'{\"floor\":\"5\",\"room\":\"23\",\"zone\":\"70\",\"type\":\"0\",\"nemo\":\"0\"}',0),(228,121,4,NULL,'{\"floor\":\"5\",\"room\":\"23\",\"zone\":\"71\",\"type\":\"0\",\"nemo\":\"0\"}',0),(229,122,4,NULL,'{\"floor\":\"5\",\"room\":\"23\",\"zone\":\"72\",\"type\":\"0\",\"nemo\":\"0\"}',0),(230,123,4,NULL,'{\"floor\":\"5\",\"room\":\"23\",\"zone\":\"73\",\"type\":\"0\",\"nemo\":\"0\"}',0),(231,124,4,NULL,'{\"floor\":\"5\",\"room\":\"53\",\"zone\":\"74\",\"type\":\"0\",\"nemo\":\"0\"}',0),(232,125,4,NULL,'{\"floor\":\"5\",\"room\":\"24\",\"zone\":\"75\",\"type\":\"0\",\"nemo\":\"0\"}',0),(233,126,4,NULL,'{\"floor\":\"5\",\"room\":\"24\",\"zone\":\"76\",\"type\":\"0\",\"nemo\":\"0\"}',0),(234,127,4,NULL,'{\"floor\":\"5\",\"room\":\"25\",\"zone\":\"77\",\"type\":\"0\",\"nemo\":\"0\"}',0),(235,128,4,NULL,'{\"floor\":\"5\",\"room\":\"25\",\"zone\":\"78\",\"type\":\"0\",\"nemo\":\"0\"}',0),(236,129,4,NULL,'{\"floor\":\"5\",\"room\":\"54\",\"zone\":\"79\",\"type\":\"0\",\"nemo\":\"0\"}',0),(237,130,4,NULL,'{\"floor\":\"5\",\"room\":\"71\",\"zone\":\"80\",\"type\":\"0\",\"nemo\":\"0\"}',0),(238,136,4,NULL,'{\"floor\":\"5\",\"room\":\"54\",\"zone\":\"81\",\"type\":\"0\",\"nemo\":\"0\"}',0),(239,137,4,NULL,'{\"floor\":\"5\",\"room\":\"53\",\"zone\":\"82\",\"type\":\"0\",\"nemo\":\"0\"}',0),(240,138,4,NULL,'{\"floor\":\"5\",\"room\":\"71\",\"zone\":\"83\",\"type\":\"0\",\"nemo\":\"0\"}',0),(241,131,4,NULL,'{\"floor\":\"5\",\"room\":\"22\",\"zone\":\"24\",\"type\":\"0\",\"nemo\":\"4\"}',0),(242,132,4,NULL,'{\"floor\":\"5\",\"room\":\"24\",\"zone\":\"25\",\"type\":\"0\",\"nemo\":\"4\"}',0),(243,133,4,NULL,'{\"floor\":\"5\",\"room\":\"24\",\"zone\":\"26\",\"type\":\"0\",\"nemo\":\"4\"}',0),(244,134,4,NULL,'{\"floor\":\"5\",\"room\":\"22\",\"zone\":\"27\",\"type\":\"0\",\"nemo\":\"4\"}',0),(245,135,4,NULL,'{\"floor\":\"5\",\"room\":\"22\",\"zone\":\"28\",\"type\":\"0\",\"nemo\":\"4\"}',0),(246,139,4,NULL,'{\"floor\":\"4\",\"room\":\"15\",\"zone\":\"84\",\"type\":\"0\",\"nemo\":\"0\"}',0),(247,140,4,NULL,'{\"floor\":\"4\",\"room\":\"15\",\"zone\":\"85\",\"type\":\"0\",\"nemo\":\"0\"}',0),(248,141,4,NULL,'{\"floor\":\"4\",\"room\":\"17\",\"zone\":\"86\",\"type\":\"0\",\"nemo\":\"0\"}',0),(249,142,4,NULL,'{\"floor\":\"4\",\"room\":\"17\",\"zone\":\"87\",\"type\":\"0\",\"nemo\":\"0\"}',0),(250,143,4,NULL,'{\"floor\":\"4\",\"room\":\"65\",\"zone\":\"88\",\"type\":\"0\",\"nemo\":\"0\"}',0),(251,144,4,NULL,'{\"floor\":\"4\",\"room\":\"49\",\"zone\":\"89\",\"type\":\"0\",\"nemo\":\"0\"}',0),(252,145,4,NULL,'{\"floor\":\"4\",\"room\":\"51\",\"zone\":\"90\",\"type\":\"0\",\"nemo\":\"0\"}',0),(253,146,4,NULL,'{\"floor\":\"4\",\"room\":\"50\",\"zone\":\"91\",\"type\":\"0\",\"nemo\":\"0\"}',0),(254,147,4,NULL,'{\"floor\":\"4\",\"room\":\"19\",\"zone\":\"92\",\"type\":\"0\",\"nemo\":\"0\"}',0),(255,148,4,NULL,'{\"floor\":\"4\",\"room\":\"19\",\"zone\":\"93\",\"type\":\"0\",\"nemo\":\"0\"}',0),(256,149,4,NULL,'{\"floor\":\"4\",\"room\":\"68\",\"zone\":\"94\",\"type\":\"0\",\"nemo\":\"0\"}',0),(257,150,4,NULL,'{\"floor\":\"4\",\"room\":\"52\",\"zone\":\"95\",\"type\":\"0\",\"nemo\":\"0\"}',0),(258,56,4,NULL,'{\"floor\":\"5\",\"room\":\"26\",\"zone\":\"29\",\"type\":\"0\",\"nemo\":\"4\"}',0),(259,58,4,NULL,'{\"floor\":\"5\",\"room\":\"28\",\"zone\":\"30\",\"type\":\"0\",\"nemo\":\"4\"}',0),(260,60,4,NULL,'{\"floor\":\"5\",\"room\":\"30\",\"zone\":\"31\",\"type\":\"0\",\"nemo\":\"4\"}',0),(261,62,4,NULL,'{\"floor\":\"5\",\"room\":\"32\",\"zone\":\"32\",\"type\":\"0\",\"nemo\":\"4\"}',0),(262,72,4,NULL,'{\"floor\":\"4\",\"room\":\"21\",\"zone\":\"33\",\"type\":\"0\",\"nemo\":\"4\"}',0),(263,66,4,NULL,'{\"floor\":\"6\",\"room\":\"34\",\"zone\":\"34\",\"type\":\"0\",\"nemo\":\"4\"}',0),(264,64,4,NULL,'{\"floor\":\"3\",\"room\":\"11\",\"zone\":\"35\",\"type\":\"0\",\"nemo\":\"4\"}',0),(265,81,3,NULL,'{\"trb\":\"0\",\"rb\":\"80\",\"terminal\":\"0\"}',1),(266,82,3,NULL,'{\"trb\":\"0\",\"rb\":\"80\",\"terminal\":\"1\"}',1),(267,83,3,NULL,'{\"trb\":\"0\",\"rb\":\"80\",\"terminal\":\"2\"}',1),(268,84,3,NULL,'{\"trb\":\"0\",\"rb\":\"80\",\"terminal\":\"3\"}',1),(269,85,3,NULL,'{\"trb\":\"0\",\"rb\":\"80\",\"terminal\":\"4\"}',1),(270,81,3,NULL,'{\"trb\":\"0\",\"rb\":\"80\",\"terminal\":\"5\"}',1),(271,87,3,NULL,'{\"trb\":\"0\",\"rb\":\"80\",\"terminal\":\"6\"}',1),(272,88,3,NULL,'{\"trb\":\"0\",\"rb\":\"80\",\"terminal\":\"7\"}',1),(273,89,3,NULL,'{\"trb\":\"0\",\"rb\":\"80\",\"terminal\":\"8\"}',1),(274,90,3,NULL,'{\"trb\":\"0\",\"rb\":\"80\",\"terminal\":\"9\"}',1),(275,91,3,NULL,'{\"trb\":\"0\",\"rb\":\"80\",\"terminal\":\"10\"}',1),(276,155,4,NULL,'{\"nemo\" : \"10\", \"floor\": \"4\", \"room\": \"14\", \"zone\": \"1\",\"type\":\"1\"}',1),(277,156,4,NULL,'{\"nemo\" : \"10\", \"floor\": \"4\", \"room\": \"14\", \"zone\": \"2\",\"type\":\"1\"}',1),(278,153,4,NULL,'{\"nemo\" : \"10\", \"floor\": \"5\", \"room\": \"22\", \"zone\": \"3\",\"type\":\"1\"}',1),(279,154,4,NULL,'{\"nemo\" : \"10\", \"floor\": \"5\", \"room\": \"22\", \"zone\": \"4\",\"type\":\"1\"}',1),(280,177,3,NULL,'{\"trb\":\"0\",\"rb\":\"321\",\"terminal\":\"0\"}',1),(281,178,3,NULL,'{\"trb\":\"0\",\"rb\":\"321\",\"terminal\":\"1\"}',1),(282,179,3,NULL,'{\"trb\":\"0\",\"rb\":\"321\",\"terminal\":\"2\"}',1),(283,180,3,NULL,'{\"trb\":\"0\",\"rb\":\"321\",\"terminal\":\"3\"}',1),(284,181,3,NULL,'{\"trb\":\"0\",\"rb\":\"321\",\"terminal\":\"4\"}',1),(285,182,3,NULL,'{\"trb\":\"0\",\"rb\":\"321\",\"terminal\":\"5\"}',1),(286,175,4,NULL,'{\"floor\":\"3\",\"room\":\"67\",\"zone\":\"96\",\"type\":\"0\",\"nemo\":\"0\"}',0),(287,176,4,NULL,'{\"floor\":\"8\",\"room\":\"70\",\"zone\":\"97\",\"type\":\"0\",\"nemo\":\"0\"}',0),(288,177,4,NULL,'{\"floor\":\"3\",\"room\":\"9\",\"zone\":\"98\",\"type\":\"0\",\"nemo\":\"0\"}',0),(289,178,4,NULL,'{\"floor\":\"3\",\"room\":\"9\",\"zone\":\"99\",\"type\":\"0\",\"nemo\":\"0\"}',0),(290,179,4,NULL,'{\"floor\":\"3\",\"room\":\"9\",\"zone\":\"100\",\"type\":\"0\",\"nemo\":\"0\"}',0),(291,180,4,NULL,'{\"floor\":\"3\",\"room\":\"9\",\"zone\":\"101\",\"type\":\"0\",\"nemo\":\"0\"}',0),(292,181,4,NULL,'{\"floor\":\"3\",\"room\":\"10\",\"zone\":\"102\",\"type\":\"0\",\"nemo\":\"0\"}',0),(293,182,4,NULL,'{\"floor\":\"8\",\"room\":\"69\",\"zone\":\"103\",\"type\":\"0\",\"nemo\":\"0\"}',0),(294,159,4,NULL,'{\"floor\":\"7\",\"room\":\"40\",\"zone\":\"104\",\"type\":\"0\",\"nemo\":\"0\"}',0),(295,160,4,NULL,'{\"floor\":\"7\",\"room\":\"40\",\"zone\":\"105\",\"type\":\"0\",\"nemo\":\"0\"}',0),(296,165,4,NULL,'{\"floor\":\"7\",\"room\":\"60\",\"zone\":\"106\",\"type\":\"0\",\"nemo\":\"0\"}',0),(297,166,4,NULL,'{\"floor\":\"7\",\"room\":\"58\",\"zone\":\"107\",\"type\":\"0\",\"nemo\":\"0\"}',0),(298,167,4,NULL,'{\"floor\":\"7\",\"room\":\"58\",\"zone\":\"108\",\"type\":\"0\",\"nemo\":\"0\"}',0),(299,168,4,NULL,'{\"floor\":\"7\",\"room\":\"59\",\"zone\":\"109\",\"type\":\"0\",\"nemo\":\"0\"}',0),(300,169,4,NULL,'{\"floor\":\"7\",\"room\":\"41\",\"zone\":\"110\",\"type\":\"0\",\"nemo\":\"0\"}',0),(301,170,4,NULL,'{\"floor\":\"7\",\"room\":\"41\",\"zone\":\"111\",\"type\":\"0\",\"nemo\":\"0\"}',0),(302,157,3,NULL,'{\"trb\":\"0\",\"rb\":\"184\",\"terminal\":\"14\"}',1),(303,158,3,NULL,'{\"trb\":\"0\",\"rb\":\"184\",\"terminal\":\"15\"}',1),(304,110,3,NULL,'{\"trb\":\"0\",\"rb\":\"103\",\"terminal\":\"5\"}',1),(305,111,3,NULL,'{\"trb\":\"0\",\"rb\":\"103\",\"terminal\":\"4\"}',1),(306,112,3,NULL,'{\"trb\":\"0\",\"rb\":\"103\",\"terminal\":\"3\"}',1),(307,113,3,NULL,'{\"trb\":\"0\",\"rb\":\"103\",\"terminal\":\"2\"}',1),(308,151,3,NULL,'{\"trb\":\"0\",\"rb\":\"103\",\"terminal\":\"11\"}',1),(309,152,3,NULL,'{\"trb\":\"0\",\"rb\":\"103\",\"terminal\":\"12\"}',1),(312,167,3,NULL,'{\"trb\":\"0\",\"rb\":\"314\",\"terminal\":\"2\"}',1),(313,168,3,NULL,'{\"trb\":\"0\",\"rb\":\"314\",\"terminal\":\"3\"}',1),(314,169,3,NULL,'{\"trb\":\"0\",\"rb\":\"314\",\"terminal\":\"4\"}',1),(315,170,3,NULL,'{\"trb\":\"0\",\"rb\":\"314\",\"terminal\":\"5\"}',1),(316,171,3,NULL,'{\"trb\":\"0\",\"rb\":\"314\",\"terminal\":\"6\"}',1),(317,172,3,NULL,'{\"trb\":\"0\",\"rb\":\"314\",\"terminal\":\"7\"}',1),(318,173,3,NULL,'{\"trb\":\"0\",\"rb\":\"314\",\"terminal\":\"8\"}',1),(319,174,3,NULL,'{\"trb\":\"0\",\"rb\":\"314\",\"terminal\":\"9\"}',1),(320,185,3,NULL,'{\"trb\":\"0\",\"rb\":\"314\",\"terminal\":\"10\"}',1),(321,186,3,NULL,'{\"trb\":\"0\",\"rb\":\"314\",\"terminal\":\"11\"}',1),(322,187,3,NULL,'{\"trb\":\"0\",\"rb\":\"496\",\"terminal\":\"0\"}',1),(323,189,3,NULL,'{\"trb\":\"0\",\"rb\":\"499\",\"terminal\":\"0\"}',1),(324,186,4,NULL,'{\"floor\":\"7\",\"room\":\"59\",\"zone\":\"116\",\"type\":\"0\",\"nemo\":\"0\"}',0),(325,165,3,NULL,'{\"trb\":\"0\",\"rb\":\"314\",\"terminal\":\"0\"}',1),(326,166,3,NULL,'{\"trb\":\"0\",\"rb\":\"314\",\"terminal\":\"1\"}',1),(327,185,4,NULL,'{\"floor\":\"7\",\"room\":\"41\",\"zone\":\"36\",\"type\":\"0\",\"nemo\":\"4\"}',0),(328,190,3,NULL,'{\"trb\":\"0\",\"rb\":\"499\",\"terminal\":\"1\"}',1),(329,192,3,NULL,'{\"trb\":\"0\",\"rb\":\"499\",\"terminal\":\"3\"}',1),(330,189,4,NULL,'{\"floor\":\"2\",\"room\":\"6\",\"zone\":\"117\",\"type\":\"0\",\"nemo\":\"0\"}',0),(331,190,4,NULL,'{\"floor\":\"2\",\"room\":\"4\",\"zone\":\"118\",\"type\":\"0\",\"nemo\":\"0\"}',0),(332,192,4,NULL,'{\"floor\":\"2\",\"room\":\"4\",\"zone\":\"119\",\"type\":\"0\",\"nemo\":\"0\"}',0),(334,159,3,NULL,'{\"trb\":\"0\",\"rb\":\"311\",\"terminal\":\"0\"}',1),(335,160,3,NULL,'{\"trb\":\"0\",\"rb\":\"311\",\"terminal\":\"1\"}',1),(336,161,3,NULL,'{\"trb\":\"0\",\"rb\":\"311\",\"terminal\":\"2\"}',1),(337,162,3,NULL,'{\"trb\":\"0\",\"rb\":\"311\",\"terminal\":\"3\"}',1),(338,163,3,NULL,'{\"trb\":\"0\",\"rb\":\"311\",\"terminal\":\"4\"}',1),(339,164,3,NULL,'{\"trb\":\"0\",\"rb\":\"311\",\"terminal\":\"5\"}',1),(340,194,3,NULL,'{\"trb\":\"0\",\"rb\":\"311\",\"terminal\":\"6\"}',1),(342,194,4,NULL,'{\"floor\":\"7\",\"room\":\"40\",\"zone\":\"37\",\"type\":\"0\",\"nemo\":\"4\"}',0),(343,161,4,NULL,'{\"floor\":\"7\",\"room\":\"40\",\"zone\":\"25\",\"type\":\"0\",\"nemo\":\"13\"}',0),(344,171,4,NULL,'{\"floor\":\"7\",\"room\":\"41\",\"zone\":\"26\",\"type\":\"0\",\"nemo\":\"13\"}',0);
/*!40000 ALTER TABLE `th_rasp_sd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `th_somfy_50_e`
--

DROP TABLE IF EXISTS `th_somfy_50_e`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `th_somfy_50_e` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_tp` int(11) DEFAULT NULL,
  `modulo` int(11) DEFAULT NULL,
  `fk` int(11) DEFAULT NULL,
  `argumentos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `inhibir` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `modulo` (`modulo`),
  KEY `codigo_tp` (`codigo_tp`),
  CONSTRAINT `_somfy_50_e_thfk_1` FOREIGN KEY (`codigo_tp`) REFERENCES `trb_somfy_50_e` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `th_somfy_50_e`
--

LOCK TABLES `th_somfy_50_e` WRITE;
/*!40000 ALTER TABLE `th_somfy_50_e` DISABLE KEYS */;
INSERT INTO `th_somfy_50_e` VALUES (14,2,4,NULL,'{\"nemo\" : \"9\", \"floor\": \"6\", \"room\": \"34\", \"zone\": \"1\",\"type\":\"1\"}',0),(15,4,4,NULL,'{\"nemo\" : \"9\", \"floor\": \"5\", \"room\": \"32\", \"zone\": \"2\",\"type\":\"1\"}',0),(16,6,4,NULL,'{\"nemo\" : \"9\", \"floor\": \"5\", \"room\": \"28\", \"zone\": \"3\",\"type\":\"1\"}',0),(17,8,4,NULL,'{\"nemo\" : \"9\", \"floor\": \"5\", \"room\": \"30\", \"zone\": \"4\",\"type\":\"1\"}',0),(18,10,4,NULL,'{\"nemo\" : \"9\", \"floor\": \"5\", \"room\": \"26\", \"zone\": \"5\",\"type\":\"1\"}',0),(19,12,4,NULL,'{\"nemo\" : \"9\", \"floor\": \"5\", \"room\": \"53\", \"zone\": \"6\",\"type\":\"1\"}',0),(20,14,4,NULL,'{\"nemo\" : \"9\", \"floor\": \"5\", \"room\": \"53\", \"zone\": \"7\",\"type\":\"1\"}',0),(21,16,4,NULL,'{\"nemo\" : \"9\", \"floor\": \"3\", \"room\": \"11\", \"zone\": \"8\",\"type\":\"1\"}',0),(22,18,4,NULL,'{\"nemo\" : \"9\", \"floor\": \"3\", \"room\": \"11\", \"zone\": \"9\",\"type\":\"1\"}',0),(23,20,4,NULL,'{\"nemo\" : \"9\", \"floor\": \"3\", \"room\": \"11\", \"zone\": \"10\",\"type\":\"1\"}',0),(24,22,4,NULL,'{\"nemo\" : \"9\", \"floor\": \"6\", \"room\": \"36\", \"zone\": \"11\",\"type\":\"1\"}',0),(25,24,4,NULL,'{\"nemo\" : \"9\", \"floor\": \"6\", \"room\": \"38\", \"zone\": \"12\",\"type\":\"1\"}',0),(26,25,4,NULL,'{\"nemo\" : \"9\", \"floor\": \"6\", \"room\": \"38\", \"zone\": \"13\",\"type\":\"1\"}',0),(27,26,4,NULL,'{\"floor\":\"4\",\"room\":\"15\",\"zone\":\"14\",\"type\":\"1\",\"nemo\":\"9\"}',0),(28,27,4,NULL,'{\"floor\":\"5\",\"room\":\"23\",\"zone\":\"15\",\"type\":\"1\",\"nemo\":\"9\"}',0);
/*!40000 ALTER TABLE `th_somfy_50_e` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `th_somfy_50_s`
--

DROP TABLE IF EXISTS `th_somfy_50_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `th_somfy_50_s` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_tp` int(11) DEFAULT NULL,
  `modulo` int(11) DEFAULT NULL,
  `fk` int(11) DEFAULT NULL,
  `argumentos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `inhibir` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `modulo` (`modulo`),
  KEY `codigo_tp` (`codigo_tp`),
  CONSTRAINT `_somfy_50_s_thfk_1` FOREIGN KEY (`codigo_tp`) REFERENCES `trb_somfy_50_s` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `th_somfy_50_s`
--

LOCK TABLES `th_somfy_50_s` WRITE;
/*!40000 ALTER TABLE `th_somfy_50_s` DISABLE KEYS */;
INSERT INTO `th_somfy_50_s` VALUES (1,2,4,NULL,'{\"nemo\" : \"9\", \"floor\": \"6\", \"room\": \"34\", \"zone\": \"1\",\"type\":\"1\"}',0),(2,4,4,NULL,'{\"nemo\" : \"9\", \"floor\": \"5\", \"room\": \"32\", \"zone\": \"2\",\"type\":\"1\"}',0),(3,6,4,NULL,'{\"nemo\" : \"9\", \"floor\": \"5\", \"room\": \"28\", \"zone\": \"3\",\"type\":\"1\"}',0),(4,8,4,NULL,'{\"nemo\" : \"9\", \"floor\": \"5\", \"room\": \"30\", \"zone\": \"4\",\"type\":\"1\"}',0),(5,10,4,NULL,'{\"nemo\" : \"9\", \"floor\": \"5\", \"room\": \"26\", \"zone\": \"5\",\"type\":\"1\"}',0),(6,12,4,NULL,'{\"nemo\" : \"9\", \"floor\": \"5\", \"room\": \"53\", \"zone\": \"6\",\"type\":\"1\"}',0),(7,14,4,NULL,'{\"nemo\" : \"9\", \"floor\": \"5\", \"room\": \"53\", \"zone\": \"7\",\"type\":\"1\"}',0),(8,16,4,NULL,'{\"nemo\" : \"9\", \"floor\": \"3\", \"room\": \"11\", \"zone\": \"8\",\"type\":\"1\"}',0),(9,18,4,NULL,'{\"nemo\" : \"9\", \"floor\": \"3\", \"room\": \"11\", \"zone\": \"9\",\"type\":\"1\"}',0),(10,20,4,NULL,'{\"nemo\" : \"9\", \"floor\": \"3\", \"room\": \"11\", \"zone\": \"10\",\"type\":\"1\"}',0),(11,22,4,NULL,'{\"nemo\" : \"9\", \"floor\": \"6\", \"room\": \"36\", \"zone\": \"11\",\"type\":\"1\"}',0),(12,24,4,NULL,'{\"nemo\" : \"9\", \"floor\": \"6\", \"room\": \"38\", \"zone\": \"12\",\"type\":\"1\"}',0),(13,26,4,NULL,'{\"nemo\" : \"9\", \"floor\": \"6\", \"room\": \"38\", \"zone\": \"13\",\"type\":\"1\"}',0),(14,27,4,NULL,'{\"floor\":\"4\",\"room\":\"15\",\"zone\":\"14\",\"type\":\"0\",\"nemo\":\"9\"}',0),(15,28,4,NULL,'{\"floor\":\"4\",\"room\":\"15\",\"zone\":\"14\",\"type\":\"1\",\"nemo\":\"9\"}',0),(16,29,4,NULL,'{\"floor\":\"5\",\"room\":\"23\",\"zone\":\"15\",\"type\":\"0\",\"nemo\":\"9\"}',0),(17,30,4,NULL,'{\"floor\":\"5\",\"room\":\"23\",\"zone\":\"15\",\"type\":\"1\",\"nemo\":\"9\"}',0);
/*!40000 ALTER TABLE `th_somfy_50_s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `th_somfy_rts_e`
--

DROP TABLE IF EXISTS `th_somfy_rts_e`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `th_somfy_rts_e` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_tp` int(11) DEFAULT NULL,
  `modulo` int(11) DEFAULT NULL,
  `fk` int(11) DEFAULT NULL,
  `argumentos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `inhibir` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `modulo` (`modulo`),
  KEY `codigo_tp` (`codigo_tp`),
  CONSTRAINT `_somfy_rts_e_thfk_1` FOREIGN KEY (`codigo_tp`) REFERENCES `trb_somfy_rts_e` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `th_somfy_rts_e`
--

LOCK TABLES `th_somfy_rts_e` WRITE;
/*!40000 ALTER TABLE `th_somfy_rts_e` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_somfy_rts_e` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `th_somfy_rts_s`
--

DROP TABLE IF EXISTS `th_somfy_rts_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `th_somfy_rts_s` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_tp` int(11) DEFAULT NULL,
  `modulo` int(11) DEFAULT NULL,
  `fk` int(11) DEFAULT NULL,
  `argumentos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `inhibir` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `modulo` (`modulo`),
  KEY `codigo_tp` (`codigo_tp`),
  CONSTRAINT `_somfy_rts_s_thfk_1` FOREIGN KEY (`codigo_tp`) REFERENCES `trb_somfy_rts_s` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `th_somfy_rts_s`
--

LOCK TABLES `th_somfy_rts_s` WRITE;
/*!40000 ALTER TABLE `th_somfy_rts_s` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_somfy_rts_s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `th_sugar_conv_e`
--

DROP TABLE IF EXISTS `th_sugar_conv_e`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `th_sugar_conv_e` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_tp` int(11) DEFAULT NULL,
  `modulo` int(11) DEFAULT NULL,
  `fk` int(11) DEFAULT NULL,
  `argumentos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `inhibir` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `modulo` (`modulo`),
  KEY `codigo_tp` (`codigo_tp`),
  CONSTRAINT `_sugar_conv_e_thfk_1` FOREIGN KEY (`codigo_tp`) REFERENCES `trb_sugar_conv_e` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `th_sugar_conv_e`
--

LOCK TABLES `th_sugar_conv_e` WRITE;
/*!40000 ALTER TABLE `th_sugar_conv_e` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_sugar_conv_e` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `th_sugar_conv_s`
--

DROP TABLE IF EXISTS `th_sugar_conv_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `th_sugar_conv_s` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_tp` int(11) DEFAULT NULL,
  `modulo` int(11) DEFAULT NULL,
  `fk` int(11) DEFAULT NULL,
  `argumentos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `inhibir` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `modulo` (`modulo`),
  KEY `codigo_tp` (`codigo_tp`),
  CONSTRAINT `_sugar_conv_s_thfk_1` FOREIGN KEY (`codigo_tp`) REFERENCES `trb_sugar_conv_s` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `th_sugar_conv_s`
--

LOCK TABLES `th_sugar_conv_s` WRITE;
/*!40000 ALTER TABLE `th_sugar_conv_s` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_sugar_conv_s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `th_sungrow_e`
--

DROP TABLE IF EXISTS `th_sungrow_e`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `th_sungrow_e` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_tp` int(11) DEFAULT NULL,
  `modulo` int(11) DEFAULT NULL,
  `fk` int(11) DEFAULT NULL,
  `argumentos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `inhibir` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `modulo` (`modulo`),
  KEY `codigo_tp` (`codigo_tp`),
  CONSTRAINT `_sungrow_e_thfk_1` FOREIGN KEY (`codigo_tp`) REFERENCES `trb_sungrow_e` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `th_sungrow_e`
--

LOCK TABLES `th_sungrow_e` WRITE;
/*!40000 ALTER TABLE `th_sungrow_e` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_sungrow_e` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `th_sungrow_s`
--

DROP TABLE IF EXISTS `th_sungrow_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `th_sungrow_s` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_tp` int(11) DEFAULT NULL,
  `modulo` int(11) DEFAULT NULL,
  `fk` int(11) DEFAULT NULL,
  `argumentos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `inhibir` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `modulo` (`modulo`),
  KEY `codigo_tp` (`codigo_tp`),
  CONSTRAINT `_sungrow_s_thfk_1` FOREIGN KEY (`codigo_tp`) REFERENCES `trb_sungrow_s` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `th_sungrow_s`
--

LOCK TABLES `th_sungrow_s` WRITE;
/*!40000 ALTER TABLE `th_sungrow_s` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_sungrow_s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tpse`
--

DROP TABLE IF EXISTS `tpse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tpse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo_rb` int(11) DEFAULT NULL,
  `codigo_relacion_rb` int(11) DEFAULT NULL,
  `numeroborna` int(11) DEFAULT NULL,
  `tipoborna` varchar(50) DEFAULT NULL,
  `nemoborna` varchar(100) DEFAULT NULL,
  `registro` varchar(20) DEFAULT NULL,
  `tiporegistro` varchar(20) DEFAULT NULL,
  `f1` varchar(30) DEFAULT NULL,
  `f2` varchar(30) DEFAULT NULL,
  `f3` varchar(30) DEFAULT NULL,
  `nemo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_rb` (`codigo_rb`),
  KEY `codigo_relacion_rb` (`codigo_relacion_rb`),
  CONSTRAINT `tpse_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tpse_ibfk_2` FOREIGN KEY (`codigo_relacion_rb`) REFERENCES `relacion_rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2318 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tpse`
--

LOCK TABLES `tpse` WRITE;
/*!40000 ALTER TABLE `tpse` DISABLE KEYS */;
INSERT INTO `tpse` VALUES (1,'2022-04-02 08:50:35',1,1,0,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado cabecero'),(2,'2022-04-02 08:50:44',1,1,1,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado armario'),(3,'2022-04-02 08:50:55',1,1,2,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado escritorio'),(4,'2022-04-02 08:51:04',1,1,3,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado techo baño'),(5,'2022-04-02 08:51:16',1,1,4,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado espejo baño'),(6,'2022-04-02 08:51:41',1,2,5,'digital',NULL,NULL,NULL,'','','Iot','Enchufe cabecero derecho'),(7,'2022-04-02 08:51:53',1,2,6,'digital',NULL,NULL,NULL,'','','Iot','Enchufe cabecero izquierdo'),(8,'2022-04-02 08:52:03',1,2,7,'digital',NULL,NULL,NULL,'','','Iot','Enchufe TV'),(9,'2022-04-03 12:27:50',9,5,8,'digital',NULL,NULL,NULL,'','','Suelo radiante','Pulsador suelo radiante'),(10,'2022-04-02 08:49:22',1,3,9,'digital',NULL,NULL,NULL,'','','Suelo radiante','Valvula suelo radiante'),(11,'2022-04-02 08:52:33',1,3,10,'digital',NULL,NULL,NULL,'','','Suelo radiante','Estado suelo radiante'),(12,'2022-04-02 08:53:01',1,4,11,'digital',NULL,NULL,NULL,'','','Cuadro electrico','Automatico general'),(13,'2022-04-02 08:53:12',1,4,12,'digital',NULL,NULL,NULL,'','','Cuadro electrico','Alumbrado'),(14,'2022-04-02 08:53:27',1,4,13,'digital',NULL,NULL,NULL,'','','Cuadro electrico','Usos varios'),(15,'2022-04-02 08:53:40',1,4,14,'digital',NULL,NULL,NULL,'','','Cuadro electrico','Maniobra'),(16,'2022-04-25 08:20:08',1,2,15,'digital',NULL,NULL,NULL,'','','Cuadro electrico','Estado usos varios'),(17,'2022-04-03 12:24:02',10,6,0,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado cabecero'),(18,'2022-04-03 12:24:23',10,6,1,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado armario'),(19,'2022-04-03 12:24:32',10,6,2,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado escritorio'),(20,'2022-04-03 12:24:43',10,6,3,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado techo baño'),(21,'2022-04-03 12:24:57',10,6,4,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado espejo baño'),(22,'2022-04-03 12:25:26',10,7,5,'digital',NULL,NULL,NULL,'','','Iot','Enchufe cabecero derecho'),(23,'2022-04-03 12:25:37',10,7,6,'digital',NULL,NULL,NULL,'','','Iot','Enchufe cabecero izquierdo'),(24,'2022-04-03 12:25:47',10,7,7,'digital',NULL,NULL,NULL,'','','Iot','Enchufe TV'),(25,'2022-04-03 12:28:04',13,10,8,'digital',NULL,NULL,NULL,'','','Suelo radiante','Pulsador suelo radiante'),(26,'2022-04-03 12:26:14',10,8,9,'digital',NULL,NULL,NULL,'','','Suelo Radiante','Valvula suelo radiante'),(27,'2022-04-03 12:26:27',10,8,10,'digital',NULL,NULL,NULL,'','','Suelo Radiante','Estado suelo radiante'),(28,'2022-04-03 12:26:49',10,9,11,'digital',NULL,NULL,NULL,'','','Cuadro electrico','Automatico general'),(29,'2022-04-03 12:26:57',10,9,12,'digital',NULL,NULL,NULL,'','','Cuadro electrico','Alumbrado'),(30,'2022-04-03 12:27:06',10,9,13,'digital',NULL,NULL,NULL,'','','Cuadro electrico','Usos Varios'),(31,'2022-04-03 12:27:16',10,9,14,'digital',NULL,NULL,NULL,'','','Cuadro electrico','Maniobra'),(32,'2022-04-25 09:04:10',10,7,15,'digital',NULL,NULL,NULL,'','','Cuadro electrico','Estado usos varios'),(33,'2022-04-03 21:07:55',19,11,0,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado cabecero'),(34,'2022-04-03 21:08:05',19,11,1,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado armario'),(35,'2022-04-03 21:08:15',19,11,2,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado escritorio'),(36,'2022-04-03 21:08:25',19,11,3,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado techo baño'),(37,'2022-04-03 21:08:35',19,11,4,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado espejo baño'),(38,'2022-04-03 21:08:53',19,12,5,'digital',NULL,NULL,NULL,'','','Iot','Enchufe cabecero derecho'),(39,'2022-04-03 21:09:04',19,12,6,'digital',NULL,NULL,NULL,'','','Iot','Enchufe cabecero izquierdo'),(40,'2022-04-03 21:09:11',19,12,7,'digital',NULL,NULL,NULL,'','','Iot','Enchufe TV'),(41,'2022-04-03 21:11:13',22,15,8,'digital',NULL,NULL,NULL,'','','Suelo radiante','Pulsador suelo radiante'),(42,'2022-04-03 21:09:35',19,13,9,'digital',NULL,NULL,NULL,'','','Suelo radiante','Valvula suelo radiante'),(43,'2022-04-03 21:09:48',19,13,10,'digital',NULL,NULL,NULL,'','','Suelo radiante','Estado suelo radiante'),(44,'2022-04-03 21:10:10',19,14,11,'digital',NULL,NULL,NULL,'','','Cuadro electrico','Automatico general'),(45,'2022-04-03 21:10:18',19,14,12,'digital',NULL,NULL,NULL,'','','Cuadro electrico','Alumbrado'),(46,'2022-04-03 21:10:28',19,14,13,'digital',NULL,NULL,NULL,'','','Cuadro electrico','Usos varios'),(47,'2022-04-03 21:10:36',19,14,14,'digital',NULL,NULL,NULL,'','','Cuadro electrico','Maniobra'),(48,'2022-04-25 09:33:11',19,12,15,'digital',NULL,NULL,NULL,'','','Cuadro electrico','Estado usos varios'),(49,'2022-04-03 21:48:55',28,16,0,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado cabecero'),(50,'2022-04-03 21:49:02',28,16,1,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado armario'),(51,'2022-04-03 21:49:16',28,16,2,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado escritorio'),(52,'2022-04-03 21:49:25',28,16,3,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado techo baño'),(53,'2022-04-03 21:49:35',28,16,4,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado espejo baño'),(54,'2022-04-03 21:49:53',28,17,5,'digital',NULL,NULL,NULL,'','','Iot','Enchufe cabecero derecho'),(55,'2022-04-03 21:50:05',28,17,6,'digital',NULL,NULL,NULL,'','','Iot','Enchufe cabecero izquierdo'),(56,'2022-04-03 21:50:15',28,17,7,'digital',NULL,NULL,NULL,'','','Iot','Enchufe TV'),(57,'2022-04-03 21:51:58',31,20,8,'digital',NULL,NULL,NULL,'','','Suelo radiante','Pulsador suelo radiante'),(58,'2022-04-03 21:50:33',28,18,9,'digital',NULL,NULL,NULL,'','','Suelo radiante','Valvula suelo radiante'),(59,'2022-04-03 21:50:44',28,18,10,'digital',NULL,NULL,NULL,'','','Suelo radiante','Estado suelo radiante'),(60,'2022-04-03 21:51:02',28,19,11,'digital',NULL,NULL,NULL,'','','Cuadro electrico','Automatico general'),(61,'2022-04-03 21:51:10',28,19,12,'digital',NULL,NULL,NULL,'','','Cuadro electrico','Alumbrado'),(62,'2022-04-03 21:51:19',28,19,13,'digital',NULL,NULL,NULL,'','','Cuadro electrico','Usos varios'),(63,'2022-04-03 21:51:28',28,19,14,'digital',NULL,NULL,NULL,'','','Cuadro electrico','Maniobra'),(64,'2022-04-25 10:00:09',28,17,15,'digital',NULL,NULL,NULL,'','','Cuadro electrico','Estado usos varios'),(65,'2022-04-03 22:09:46',37,21,0,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado cabecero'),(66,'2022-04-03 22:09:54',37,21,1,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado armario'),(67,'2022-04-03 22:10:05',37,21,2,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado escritorio'),(68,'2022-04-03 22:10:13',37,21,3,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado techo baño'),(69,'2022-04-03 22:10:25',37,21,4,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado espejo baño'),(70,'2022-04-03 22:10:42',37,22,5,'digital',NULL,NULL,NULL,'','','Iot','Enchufe cabecero derecho'),(71,'2022-04-03 22:10:53',37,22,6,'digital',NULL,NULL,NULL,'','','Iot','Enchufe cabecero izquierdo'),(72,'2022-04-03 22:11:01',37,22,7,'digital',NULL,NULL,NULL,'','','Iot','Enchufe TV'),(73,'2022-04-03 22:12:47',40,25,8,'digital',NULL,NULL,NULL,'','','Suelo radiante','Pulsado suelo radiante'),(74,'2022-04-03 22:11:21',37,23,9,'digital',NULL,NULL,NULL,'','','Suelo radiante','Valvula suelo radiante'),(75,'2022-04-03 22:11:31',37,23,10,'digital',NULL,NULL,NULL,'','','Suelo radiante','Estado suelo radiante'),(76,'2022-04-03 22:11:52',37,24,11,'digital',NULL,NULL,NULL,'','','Cuadro electrico','Automatico general'),(77,'2022-04-03 22:12:00',37,24,12,'digital',NULL,NULL,NULL,'','','Cuadro electrico','Alumbrado'),(78,'2022-04-03 22:12:08',37,24,13,'digital',NULL,NULL,NULL,'','','Cuadro electrico','Usos varios'),(79,'2022-04-03 22:12:17',37,24,14,'digital',NULL,NULL,NULL,'','','Cuadro electrico','Maniobra'),(80,'2022-04-25 10:13:50',37,22,15,'digital',NULL,NULL,NULL,'','','Cuadro electrico','Estado usos varios'),(81,'2022-04-03 22:22:42',46,26,0,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado cabecero'),(82,'2022-04-03 22:22:49',46,26,1,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado armario'),(83,'2022-04-03 22:23:01',46,26,2,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado escritorio'),(84,'2022-04-03 22:23:10',46,26,3,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado techo baño'),(85,'2022-04-03 22:23:19',46,26,4,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado espejo baño'),(86,'2022-04-03 22:23:37',46,27,5,'digital',NULL,NULL,NULL,'','','Iot','Enchufe cabecero derecho'),(87,'2022-04-03 22:23:48',46,27,6,'digital',NULL,NULL,NULL,'','','Iot','Enchufe cabecero izquierdo'),(88,'2022-04-03 22:23:55',46,27,7,'digital',NULL,NULL,NULL,'','','Iot','Enchufe TV'),(89,'2022-04-03 22:25:46',49,30,8,'digital',NULL,NULL,NULL,'','','Suelo radiante','Pulsador suelo radiante'),(90,'2022-04-03 22:24:19',46,28,9,'digital',NULL,NULL,NULL,'','','Suelo radiante','Valvula suelo radiante'),(91,'2022-04-03 22:24:31',46,28,10,'digital',NULL,NULL,NULL,'','','Suelo radiante','Estado suelo radiante'),(92,'2022-04-03 22:24:52',46,29,11,'digital',NULL,NULL,NULL,'','','Cuadro electrico','Automatico general'),(93,'2022-04-03 22:25:01',46,29,12,'digital',NULL,NULL,NULL,'','','Cuadro electrico','Alumbrado'),(94,'2022-04-03 22:25:11',46,29,13,'digital',NULL,NULL,NULL,'','','Cuadro electrico','Usos varios'),(95,'2022-04-03 22:25:19',46,29,14,'digital',NULL,NULL,NULL,'','','Cuadro electrico','Maniobra'),(96,'2022-04-25 10:26:41',46,27,15,'digital',NULL,NULL,NULL,'','','Cuadro electrico','Estado usos varios'),(97,'2022-04-25 08:31:35',55,31,0,'analogica',NULL,NULL,NULL,'','','Clima','Sonda temperatura habitacion 2'),(98,'2022-04-25 09:08:28',56,32,0,'analogica',NULL,NULL,NULL,'','','clima','sonda temperatura habitacion 3'),(99,'2022-04-25 09:34:18',57,33,0,'analogica',NULL,NULL,NULL,'','','Clima','Sonda temperatura habitacion 4'),(100,'2022-04-25 10:01:34',58,34,0,'analogica',NULL,NULL,NULL,'','','clima','Sonda temperatura habitacion 5'),(101,'2022-04-25 10:15:08',59,35,0,'analogica',NULL,NULL,NULL,'','','Clima','Sonda temperatura habitacion estudio'),(102,'2022-04-25 10:28:04',60,36,0,'analogica',NULL,NULL,NULL,'','','Clima','Sonda temperatura habitacion invitados'),(103,'2022-04-25 10:47:25',61,37,0,'digital',NULL,NULL,NULL,'','','Alumbrado','Estado focos techo biblioteca'),(104,'2022-04-25 10:47:38',61,37,1,'digital',NULL,NULL,NULL,'','','Alumbrado','Estado Led techo biblioteca'),(105,'2022-04-25 10:47:50',61,37,2,'digital',NULL,NULL,NULL,'','','Alumbrado','Estado focos techo distribuidor'),(106,'2022-04-25 10:49:06',64,40,3,'digital',NULL,NULL,NULL,'','','Clima','Pulsador suelo radiante'),(107,'2022-04-25 10:48:10',61,38,4,'digital',NULL,NULL,NULL,'','','Clima','Estado bombilla suelo radiante'),(108,'2022-04-25 10:48:27',61,39,5,'digital',NULL,NULL,NULL,'','','Iot','Estado enchufe suelo'),(109,'2022-04-25 10:48:37',61,39,6,'digital',NULL,NULL,NULL,'','','Cuadro electrico','Estado usos varios'),(110,'2022-07-05 22:34:57',61,92,7,'digital',NULL,NULL,NULL,'','','cuadro electrico','Estado Automatico General'),(111,'2022-07-05 22:35:07',61,92,8,'digital',NULL,NULL,NULL,'','','cuadro electrico','Estado Diferencial general'),(112,'2022-07-05 22:35:17',61,92,9,'digital',NULL,NULL,NULL,'','','cuadro electrico','Estado Automatico usos varios'),(113,'2022-07-05 22:35:26',61,92,10,'digital',NULL,NULL,NULL,'','','cuadro electrico','Estado Automatico alumbrado'),(114,'2022-07-05 22:35:35',61,92,11,'digital',NULL,NULL,NULL,'','','cuadro electrico','Estado automatico maniobra'),(115,'2022-04-25 10:36:52',61,NULL,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(116,'2022-04-25 10:36:52',61,NULL,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(117,'2022-04-25 10:36:52',61,NULL,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(118,'2022-04-25 10:36:52',61,NULL,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(119,'2022-04-25 11:07:35',68,41,0,'analogica',NULL,NULL,NULL,'','','Clima','Sonda temperatura biblioteca'),(120,'2022-04-25 11:32:22',69,42,0,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado led bar'),(121,'2022-04-25 11:32:33',69,42,1,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado focos techo salon'),(122,'2022-04-25 11:32:40',69,42,2,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado led salon'),(123,'2022-04-25 11:32:51',69,42,3,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado focos techo exterior'),(124,'2022-04-25 11:32:59',69,42,4,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado led exterior'),(125,'2022-04-25 11:34:05',72,44,5,'digital',NULL,NULL,NULL,'','','Clima','Pulsador bar suelo radiante'),(126,'2022-04-25 11:33:22',69,43,6,'digital',NULL,NULL,NULL,'','','Clima','Bombilla suelo radiante bar'),(127,'2022-04-25 11:34:16',72,44,7,'digital',NULL,NULL,NULL,'','','Clima','Pulsador salon suelo radiante'),(128,'2022-04-25 11:33:34',69,43,8,'digital',NULL,NULL,NULL,'','','Clima','Bombilla suelo radiante salon'),(129,'2022-07-05 22:44:26',69,93,9,'digital',NULL,NULL,NULL,'','','multimedia','Estado abierto Proyector cine '),(130,'2022-07-05 22:44:42',69,93,10,'digital',NULL,NULL,NULL,'','','multimedia','Estado cerrado Proyector cine'),(131,'2022-04-25 11:20:34',69,NULL,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(132,'2022-04-25 11:20:34',69,NULL,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(133,'2022-04-25 11:20:34',69,NULL,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(134,'2022-04-25 11:20:34',69,NULL,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(135,'2022-04-25 11:20:34',69,NULL,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(136,'2022-04-26 08:28:13',73,45,0,'analogica',NULL,NULL,NULL,'','','Clima','Sonda temperatura salon'),(137,'2022-04-26 08:28:24',74,46,0,'analogica',NULL,NULL,NULL,'','','Clima','Sonda temperatura bar'),(138,'2022-05-10 09:48:23',80,47,0,'digital',NULL,NULL,NULL,'','','Alumbrado','Estado focos techo armario hab 2'),(139,'2022-05-10 09:48:40',80,47,1,'digital',NULL,NULL,NULL,'','','Alumbrado','Estado focos techo cabecero hab 2'),(140,'2022-05-10 09:49:01',80,47,2,'digital',NULL,NULL,NULL,'','','Alumbrado','Estado focos techo baño hab 2'),(141,'2022-05-10 09:50:34',80,47,3,'digital',NULL,NULL,NULL,'','','Alumbrado','Estado espejo baño hab 2'),(142,'2022-05-10 09:51:15',80,47,4,'digital',NULL,NULL,NULL,'','','Alumbrado','Estado focos techo armario hab 1'),(143,'2022-05-10 09:54:28',80,47,5,'digital',NULL,NULL,NULL,'','','Alumbrado','Estado focos techo cabecero hab 1'),(144,'2022-05-10 09:54:57',80,47,6,'digital',NULL,NULL,NULL,'','','Alumbrado','Estado focos techo baño hab 1'),(145,'2022-05-10 09:55:18',80,47,7,'digital',NULL,NULL,NULL,'','','Alumbrado','Estado espejo baño hab 1'),(146,'2022-05-10 09:55:58',80,47,8,'digital',NULL,NULL,NULL,'','','Alumbrado','Estado focos techo vestibulo servicio'),(147,'2022-05-10 09:56:13',80,47,9,'digital',NULL,NULL,NULL,'','','Alumbrado','Estado focos techo cocina comedor'),(148,'2022-05-10 09:56:30',80,47,10,'digital',NULL,NULL,NULL,'','','Alumbrado','Estado alumbrado exterior escaleras servicio'),(149,'2022-05-10 09:45:22',80,NULL,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(150,'2022-05-10 09:45:22',80,NULL,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(151,'2022-05-10 09:45:22',80,NULL,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(152,'2022-05-10 09:45:23',80,NULL,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(153,'2022-05-10 09:45:23',80,NULL,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(154,'2022-05-10 10:11:03',83,48,0,'analogica',NULL,NULL,NULL,'','','Clima','sonda habitacion 1'),(155,'2022-05-10 10:11:08',84,49,0,'analogica',NULL,NULL,NULL,'','','Clima','sonda habitacion 2'),(156,'2022-05-10 10:11:21',85,50,0,'analogica',NULL,NULL,NULL,'','','Clima','sonda cocina comedor '),(157,'2022-05-29 23:08:29',95,51,0,'digital',NULL,NULL,NULL,'','','alumbrado','Estado alumbrado pasillo lavanderia'),(158,'2022-05-29 23:08:42',95,51,1,'digital',NULL,NULL,NULL,'','','alumbrado','Estado alumbrado lavanderia'),(159,'2022-05-29 23:06:37',95,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(160,'2022-05-29 23:06:37',95,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(161,'2022-05-29 23:06:37',95,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(162,'2022-05-29 23:06:37',95,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(163,'2022-05-29 23:06:37',95,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(164,'2022-05-29 23:06:37',95,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(165,'2022-05-29 23:06:37',95,NULL,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(166,'2022-05-29 23:06:37',95,NULL,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(167,'2022-05-29 23:06:37',95,NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(168,'2022-05-29 23:06:37',95,NULL,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(169,'2022-05-29 23:06:38',95,NULL,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(170,'2022-05-29 23:06:38',95,NULL,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(171,'2022-05-29 23:06:39',95,NULL,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(172,'2022-05-29 23:06:40',95,NULL,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(173,'2022-06-03 15:29:09',100,52,0,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado led perimetro pasillo'),(174,'2022-06-03 15:29:33',100,52,1,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado focos techo centro comedor'),(175,'2022-06-03 15:29:51',100,52,2,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado focos techo laterales comedor'),(176,'2022-06-03 15:30:39',100,52,3,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado focos techo pasillo sala TV'),(177,'2022-06-03 15:30:55',100,52,4,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado focos techo pasillo habitaciones'),(178,'2022-06-03 15:31:10',100,52,5,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado focos techo sala TV'),(179,'2022-06-03 15:37:00',100,52,6,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado focos terraza sala TV '),(180,'2022-06-04 17:26:32',100,52,7,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado led terraza sala TV'),(181,'2022-06-04 17:32:06',100,52,8,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado focos techo baño cortesia'),(182,'2022-06-04 17:32:33',100,52,9,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado espejo techo baño cortesia'),(183,'2022-06-04 17:32:52',100,52,10,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado led perimetro exterior entrada principal'),(184,'2022-06-04 17:33:09',100,52,11,'digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado led entrada principal'),(185,'2022-06-04 17:33:54',100,53,12,'digital',NULL,NULL,NULL,'','','iot','Enchufe tv sala tv'),(186,'2022-06-04 17:34:44',100,53,13,'digital',NULL,NULL,NULL,'','','iot','Enchufe pared sala tv'),(187,'2022-06-04 17:35:24',100,53,14,'digital',NULL,NULL,NULL,'','','iot','Enchufe comedor'),(188,'2022-06-04 17:35:49',100,53,15,'digital',NULL,NULL,NULL,'','','iot','Enchufe pasillo derecho'),(189,'2022-06-04 18:25:48',106,56,0,'digital',NULL,NULL,NULL,'','','Suelo radiante','Pulsador suelo radiante sala tv'),(190,'2022-06-04 18:26:02',106,56,1,'digital',NULL,NULL,NULL,'','','Suelo radiante','Pulsador suelo radiante comedor'),(191,'2022-06-04 18:16:36',103,54,2,'digital',NULL,NULL,NULL,'','','Suelo radiante','Estado suelo radiante sala tv'),(192,'2022-06-04 18:21:19',103,54,3,'digital',NULL,NULL,NULL,'','','Suelo radiante','Estado suelo radiante comedor'),(193,'2022-06-04 18:21:38',103,54,4,'digital',NULL,NULL,NULL,'','','Suelo radiante','Estado valvula suelo radiante sala tv'),(194,'2022-06-04 18:22:02',103,54,5,'digital',NULL,NULL,NULL,'','','Suelo radiante','Estado valvula suelo radiante comedor'),(195,'2022-06-04 18:22:31',103,55,6,'digital',NULL,NULL,NULL,'','','Cuadro electrico','Estado usos varios'),(196,'2022-06-04 18:22:46',103,55,7,'digital',NULL,NULL,NULL,'','','Cuadro electrico','Estado automatico general'),(197,'2022-06-04 18:23:07',103,55,8,'digital',NULL,NULL,NULL,'','','Cuadro electrico','Estado automatico alumbrado'),(198,'2022-06-04 18:23:23',103,55,9,'digital',NULL,NULL,NULL,'','','Cuadro electrico','Estado automatico usos varios 1'),(199,'2022-06-04 18:23:40',103,55,10,'digital',NULL,NULL,NULL,'','','Cuadro electrico','Estado automático usos varios 2'),(200,'2022-07-05 22:17:35',103,89,11,'digital',NULL,NULL,NULL,'','','Clima','Estado valvula suelo radiante bar'),(201,'2022-07-05 22:17:50',103,89,12,'digital',NULL,NULL,NULL,'','','Clima','Estado valvula suelo radiante sala cine'),(202,'2022-06-03 15:23:26',103,NULL,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(203,'2022-06-03 15:23:26',103,NULL,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(204,'2022-06-03 15:23:26',103,NULL,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(205,'2022-06-04 18:29:01',119,57,0,'analogica',NULL,NULL,NULL,'','','Clima','Temperatura sala tv'),(206,'2022-06-20 18:39:08',120,NULL,0,NULL,'Valor control posicion','0',NULL,NULL,NULL,NULL,NULL),(207,'2022-06-20 18:39:08',120,NULL,1,NULL,'Valor DIM oscuridad','0',NULL,NULL,NULL,NULL,NULL),(208,'2022-06-20 18:39:09',120,NULL,0,NULL,'Valor control posicion','1',NULL,NULL,NULL,NULL,NULL),(209,'2022-06-20 18:39:09',120,NULL,1,NULL,'Valor DIM oscuridad','1',NULL,NULL,NULL,NULL,NULL),(210,'2022-06-20 18:39:09',120,NULL,0,NULL,'Valor control posicion','2',NULL,NULL,NULL,NULL,NULL),(211,'2022-06-20 18:39:09',120,NULL,1,NULL,'Valor DIM oscuridad','2',NULL,NULL,NULL,NULL,NULL),(212,'2022-06-20 18:39:09',120,NULL,0,NULL,'Valor control posicion','3',NULL,NULL,NULL,NULL,NULL),(213,'2022-06-20 18:39:09',120,NULL,1,NULL,'Valor DIM oscuridad','3',NULL,NULL,NULL,NULL,NULL),(214,'2022-06-20 18:39:09',120,NULL,0,NULL,'Valor control posicion','4',NULL,NULL,NULL,NULL,NULL),(215,'2022-06-20 18:39:09',120,NULL,1,NULL,'Valor DIM oscuridad','4',NULL,NULL,NULL,NULL,NULL),(216,'2022-06-20 18:39:09',120,NULL,0,NULL,'Valor control posicion','5',NULL,NULL,NULL,NULL,NULL),(217,'2022-06-20 18:39:09',120,NULL,1,NULL,'Valor DIM oscuridad','5',NULL,NULL,NULL,NULL,NULL),(218,'2022-06-20 18:39:09',120,NULL,0,NULL,'Valor control posicion','6',NULL,NULL,NULL,NULL,NULL),(219,'2022-06-20 18:39:09',120,NULL,1,NULL,'Valor DIM oscuridad','6',NULL,NULL,NULL,NULL,NULL),(220,'2022-06-20 18:39:09',120,NULL,0,NULL,'Valor control posicion','7',NULL,NULL,NULL,NULL,NULL),(221,'2022-06-20 18:39:09',120,NULL,1,NULL,'Valor DIM oscuridad','7',NULL,NULL,NULL,NULL,NULL),(222,'2022-06-20 18:39:10',120,NULL,0,NULL,'Valor control posicion','8',NULL,NULL,NULL,NULL,NULL),(223,'2022-06-20 18:39:10',120,NULL,1,NULL,'Valor DIM oscuridad','8',NULL,NULL,NULL,NULL,NULL),(224,'2022-06-20 18:39:10',120,NULL,0,NULL,'Valor control posicion','9',NULL,NULL,NULL,NULL,NULL),(225,'2022-06-20 18:39:10',120,NULL,1,NULL,'Valor DIM oscuridad','9',NULL,NULL,NULL,NULL,NULL),(226,'2022-06-20 18:39:10',120,NULL,0,NULL,'Valor control posicion','10',NULL,NULL,NULL,NULL,NULL),(227,'2022-06-20 18:39:10',120,NULL,1,NULL,'Valor DIM oscuridad','10',NULL,NULL,NULL,NULL,NULL),(228,'2022-06-20 18:39:10',120,NULL,0,NULL,'Valor control posicion','11',NULL,NULL,NULL,NULL,NULL),(229,'2022-06-20 18:39:10',120,NULL,1,NULL,'Valor DIM oscuridad','11',NULL,NULL,NULL,NULL,NULL),(230,'2022-06-20 18:39:10',120,NULL,0,NULL,'Valor control posicion','12',NULL,NULL,NULL,NULL,NULL),(231,'2022-06-20 18:39:11',120,NULL,1,NULL,'Valor DIM oscuridad','12',NULL,NULL,NULL,NULL,NULL),(232,'2022-06-20 18:39:11',120,NULL,0,NULL,'Valor control posicion','13',NULL,NULL,NULL,NULL,NULL),(233,'2022-06-20 18:39:11',120,NULL,1,NULL,'Valor DIM oscuridad','13',NULL,NULL,NULL,NULL,NULL),(234,'2022-06-20 18:39:11',120,NULL,0,NULL,'Valor control posicion','14',NULL,NULL,NULL,NULL,NULL),(235,'2022-06-20 18:39:11',120,NULL,1,NULL,'Valor DIM oscuridad','14',NULL,NULL,NULL,NULL,NULL),(236,'2022-06-20 18:39:11',120,NULL,0,NULL,'Valor control posicion','15',NULL,NULL,NULL,NULL,NULL),(237,'2022-06-20 18:39:11',120,NULL,1,NULL,'Valor DIM oscuridad','15',NULL,NULL,NULL,NULL,NULL),(238,'2022-07-02 14:34:34',131,58,0,'analogica','Valor control posicion',NULL,NULL,'','','','posicion'),(239,'2022-07-02 14:34:41',131,58,1,'analogica','Nivel',NULL,NULL,'','','','nivel'),(240,'2022-07-02 14:34:54',133,59,0,'analogica','Valor control posicion',NULL,NULL,'','','','posicion'),(241,'2022-07-02 14:35:01',133,59,1,'analogica','Nivel',NULL,NULL,'','','','nivel'),(242,'2022-07-02 14:35:16',135,60,0,'analogica','Valor control posicion',NULL,NULL,'','','','posicion'),(243,'2022-07-02 14:35:26',135,60,1,'analogica','Nivel',NULL,NULL,'','','','nivel'),(244,'2022-07-02 14:35:37',137,61,0,'analogica','Valor control posicion',NULL,NULL,'','','','posicion'),(245,'2022-07-02 14:35:48',137,61,1,'analogica','Nivel',NULL,NULL,'','','','nivel'),(246,'2022-07-02 14:36:00',139,62,0,'analogica','Valor control posicion',NULL,NULL,'','','','posicion'),(247,'2022-07-02 14:36:09',139,62,1,'analogica','Nivel',NULL,NULL,'','','','nivel'),(248,'2022-07-02 14:36:41',141,63,0,'analogica','Valor control posicion',NULL,NULL,'','','','posicion'),(249,'2022-07-02 14:36:48',141,63,1,'analogica','Nivel',NULL,NULL,'','','','nivel'),(250,'2022-07-02 14:36:59',143,64,0,'analogica','Valor control posicion',NULL,NULL,'','','','posicion'),(251,'2022-07-02 14:37:07',143,64,1,'analogica','Nivel',NULL,NULL,'','','','nivel'),(252,'2022-07-02 14:37:18',145,65,0,'analogica','Valor control posicion',NULL,NULL,'','','','posicion'),(253,'2022-07-02 14:37:25',145,65,1,'analogica','Nivel',NULL,NULL,'','','','nivel'),(254,'2022-07-02 14:37:38',147,66,0,'analogica','Valor control posicion',NULL,NULL,'','','','posicion'),(255,'2022-07-02 14:37:44',147,66,1,'analogica','Nivel',NULL,NULL,'','','','nivel'),(256,'2022-07-02 14:37:55',149,67,0,'analogica','Valor control posicion',NULL,NULL,'','','','posicion'),(257,'2022-07-02 14:38:02',149,67,1,'analogica','Nivel',NULL,NULL,'','','','nivel'),(258,'2022-07-02 14:38:14',151,68,0,'analogica','Valor control posicion',NULL,NULL,'','','','posicion'),(259,'2022-07-02 14:38:21',151,68,1,'analogica','Nivel',NULL,NULL,'','','','nivel'),(260,'2022-07-02 14:38:33',153,69,0,'analogica','Valor control posicion',NULL,NULL,'','','','posicion'),(261,'2022-07-02 14:38:40',153,69,1,'analogica','Nivel',NULL,NULL,'','','','nivel'),(262,'2022-06-22 23:00:21',155,70,0,'digital',NULL,NULL,NULL,'','','Alumbrado','Estado Focos techo Vestibulo'),(263,'2022-06-22 23:00:29',155,70,1,'digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo cabecero Hab. Alejandro'),(264,'2022-06-22 23:00:38',155,70,2,'digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo Hab. Alejandro'),(265,'2022-06-22 23:00:48',155,70,3,'digital',NULL,NULL,NULL,'','','Alumbrado','Led Hab. Alejandro'),(266,'2022-06-22 23:00:56',155,70,4,'digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo Baño Alejandro'),(267,'2022-06-22 23:01:08',155,70,5,'digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo inodoro Baño Alejandro'),(268,'2022-06-22 23:01:17',155,70,6,'digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo espejo Baño Alejandro'),(269,'2022-06-22 23:01:26',155,70,7,'digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo jacuzzi Baño Alejando'),(270,'2022-06-22 23:01:35',155,70,8,'digital',NULL,NULL,NULL,'','','Alumbrado','Led jacuzzi Baño Alejandro'),(271,'2022-06-22 23:01:45',155,70,9,'digital',NULL,NULL,NULL,'','','Alumbrado','Led vestidor Alejandro'),(272,'2022-06-22 23:01:56',155,70,10,'digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo Habitacion Rachel'),(273,'2022-06-22 23:02:06',155,70,11,'digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo escritorio Hab. Rachel'),(274,'2022-06-22 23:02:18',155,70,12,'digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo baño Hab. Rachel'),(275,'2022-06-22 23:02:27',155,70,13,'digital',NULL,NULL,NULL,'','','Alumbrado','Led espejo baño Hab. Rachel'),(276,'2022-06-22 23:02:36',155,70,14,'digital',NULL,NULL,NULL,'','','Alumbrado','Led vestidor H.Rachel'),(277,'2022-06-22 23:02:46',155,70,15,'digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo terraza Hab. Rachel'),(278,'2022-06-22 23:31:03',174,71,0,'analogica',NULL,NULL,NULL,'','','Clima','Hab. Alejandro'),(279,'2022-06-22 23:31:14',175,72,0,'analogica',NULL,NULL,NULL,'','','Clima','Baño Alejandro'),(280,'2022-06-22 23:31:23',176,73,0,'analogica',NULL,NULL,NULL,'','','Clima','Vestidor Alejandro'),(281,'2022-06-22 23:31:33',177,74,0,'analogica',NULL,NULL,NULL,'','','Clima','Hab. Rachel'),(282,'2022-06-22 23:31:42',178,75,0,'analogica',NULL,NULL,NULL,'','','Clima','Baño Rachel'),(283,'2022-06-22 23:31:50',179,76,0,'analogica',NULL,NULL,NULL,'','','Clima','Vestidor Rachel'),(284,'2022-07-05 22:28:31',180,90,0,'digital',NULL,NULL,NULL,'','','multimedia','Estado Abrir tv techo'),(285,'2022-07-05 22:28:42',180,90,1,'digital',NULL,NULL,NULL,'','','multimedia','Estado Cerrar tv techo'),(286,'2022-07-05 22:29:05',213,91,2,'digital',NULL,NULL,NULL,'','','clima','Estado del funcionamiento manual hab Alejandro'),(287,'2022-07-05 22:29:14',213,91,3,'digital',NULL,NULL,NULL,'','','clima','Estado del funcionamiento manual baño Alejandro'),(288,'2022-07-05 22:29:25',213,91,4,'digital',NULL,NULL,NULL,'','','clima','Estado del funcionamiento manual vestidor Alejandro'),(289,'2022-07-05 22:29:43',213,91,5,'digital',NULL,NULL,NULL,'','','clima','Estado del funcionamiento manual hab Rachel'),(290,'2022-07-05 22:30:08',213,91,6,'digital',NULL,NULL,NULL,'','','clima','Estado del funcionamiento manual baño Rache'),(291,'2022-07-05 22:30:22',213,91,7,'digital',NULL,NULL,NULL,'','','clima','Estado del funcionamiento manual vestidor Rachel'),(292,'2022-06-22 23:49:07',180,77,8,'digital',NULL,NULL,NULL,'','','iot','Estado Enchufe TV Hab. Alejandro'),(293,'2022-06-22 23:49:17',180,77,9,'digital',NULL,NULL,NULL,'','','iot','Estado Enchufe cabecero Izq. Hab. Rachel'),(294,'2022-06-22 23:49:27',180,77,10,'digital',NULL,NULL,NULL,'','','iot','Estado Enchufe cabecero Derecho Hab. Rachel'),(295,'2022-06-22 23:49:36',180,77,11,'digital',NULL,NULL,NULL,'','','iot','Estado Enchufe cabecero Izq. Hab. Alejandro'),(296,'2022-06-22 23:49:47',180,77,12,'digital',NULL,NULL,NULL,'','','iot','Enchufe cabecero Derecha Hab. Alejandro'),(297,'2022-06-22 23:50:06',180,78,13,'digital',NULL,NULL,NULL,'','','Alumbrado','Led Armarios vestidor Rachel'),(298,'2022-06-22 23:50:16',180,78,14,'digital',NULL,NULL,NULL,'','','Alumbrado','Led Armarios vestidor Alejandro'),(299,'2022-06-22 23:50:27',180,78,15,'digital',NULL,NULL,NULL,'','','Alumbrado','Led Terraza Hab. Rachel'),(300,'2022-06-23 01:19:18',184,79,0,'digital',NULL,NULL,NULL,'','','Alumbrado','Estado Focos techo cocina Principal'),(301,'2022-06-23 01:19:29',184,79,1,'digital',NULL,NULL,NULL,'','','Alumbrado','Estado Led techo cocina Principal'),(302,'2022-06-23 01:19:38',184,79,2,'digital',NULL,NULL,NULL,'','','Alumbrado','Estado Led techo cocina Alejandro'),(303,'2022-06-23 01:19:49',184,79,3,'digital',NULL,NULL,NULL,'','','Alumbrado','Estado Focos techo Armario Frigorifico cocina Alejandro'),(304,'2022-06-23 01:19:59',184,79,4,'digital',NULL,NULL,NULL,'','','Alumbrado','Estado Focos techo comedor cocina Alejandro'),(305,'2022-06-23 01:20:11',184,79,5,'digital',NULL,NULL,NULL,'','','Alumbrado','Estado focos techo Vestibulo entre cocina y entrada'),(306,'2022-06-23 01:20:22',184,79,6,'digital',NULL,NULL,NULL,'','','Alumbrado','Estado focos techo Ropero'),(307,'2022-06-23 01:20:32',184,79,7,'digital',NULL,NULL,NULL,'','','Alumbrado','Estado focos techo Despensa'),(308,'2022-06-23 01:20:43',184,79,8,'digital',NULL,NULL,NULL,'','','Alumbrado','Estado focos techo puertas Pasillo Hab.'),(309,'2022-06-23 01:20:54',184,79,9,'digital',NULL,NULL,NULL,'','','Alumbrado','Estado focos techo pasillo Hab.'),(310,'2022-06-23 01:21:04',184,79,10,'digital',NULL,NULL,NULL,'','','Alumbrado','Estado focos Escalera servicio'),(311,'2022-06-23 01:21:14',184,79,11,'digital',NULL,NULL,NULL,'','','Alumbrado','Estado focos techo zona juegos'),(312,'2022-07-05 23:38:49',214,94,12,'digital',NULL,NULL,NULL,'','','clima','Estado del funcionamiento manual cocina alejandro'),(313,'2022-07-05 23:39:03',214,94,13,'digital',NULL,NULL,NULL,'','','clima','Estado del funcionamiento manual cocina principal'),(314,'2022-07-05 23:39:28',184,95,14,'digital',NULL,NULL,NULL,'','','clima','Estado del piloto de accionamiento manual Cocina alejandro (Bombilla)'),(315,'2022-07-05 23:39:38',184,95,15,'digital',NULL,NULL,NULL,'','','clima','Estado del piloto de accionamiento manual Cocina principal (Bombilla)'),(316,'2022-06-23 01:29:01',187,80,0,'analogica',NULL,NULL,NULL,'','','Clima','Cocina Principal'),(317,'2022-06-23 01:29:19',188,81,0,'analogica',NULL,NULL,NULL,'','','Clima','Cocina Alejandro'),(318,'2022-06-23 01:29:33',189,82,0,'analogica',NULL,NULL,NULL,'','','Clima','Pasillo Habitaciones'),(319,'2022-06-23 01:29:43',190,83,0,'analogica',NULL,NULL,NULL,'','','Clima','Sala juegos'),(320,'2022-07-02 14:00:24',203,NULL,0,NULL,'Valor control posicion',NULL,NULL,NULL,NULL,NULL,NULL),(321,'2022-07-02 14:39:12',203,84,1,'analogica','Nivel',NULL,NULL,'','','','nivel'),(322,'2022-07-05 21:32:36',207,85,0,'digital',NULL,NULL,NULL,'','','Clima','Estado valvula suelo rad hab Alejandro'),(323,'2022-07-05 21:32:49',207,85,1,'digital',NULL,NULL,NULL,'','','Clima','Estado valvula suelo rad baño Alejandro'),(324,'2022-07-05 21:33:07',207,85,2,'digital',NULL,NULL,NULL,'','','Clima','Estado valvula suelo rad vestidor Alejandro'),(325,'2022-07-05 21:33:18',207,85,3,'digital',NULL,NULL,NULL,'','','Clima','Estado valvula suelo rad hab Rachel'),(326,'2022-07-05 21:33:30',207,85,4,'digital',NULL,NULL,NULL,'','','Clima','Estado valvula suelo rad baño Rachel'),(327,'2022-07-05 21:33:39',207,85,5,'digital',NULL,NULL,NULL,'','','Clima','Estado valvula suelo rad vestidor Rachel'),(328,'2022-07-05 21:33:48',207,85,6,'digital',NULL,NULL,NULL,'','','Clima','Estado del piloto de accionamiento manual hab Alejandro (bombilla)'),(329,'2022-07-05 21:34:00',207,85,7,'digital',NULL,NULL,NULL,'','','Clima','Estado del piloto de accionamiento manual baño Alejandro (bombilla)'),(330,'2022-07-05 21:36:10',208,86,0,'digital',NULL,NULL,NULL,'','','Clima','Estado del piloto de accionamiento manual vestidor Alejandro (bombilla)'),(331,'2022-07-05 21:36:20',208,86,1,'digital',NULL,NULL,NULL,'','','Clima','Estado del piloto de accionamiento manual hab Raquel (bombilla)'),(332,'2022-07-05 21:36:31',208,86,2,'digital',NULL,NULL,NULL,'','','Clima','Estado del piloto de accionamiento manual baño Raquel (bombilla)'),(333,'2022-07-05 21:36:39',208,86,3,'digital',NULL,NULL,NULL,'','','Clima','Estado del piloto de accionamiento manual vestidor Raquel (bombilla)'),(334,'2022-07-05 21:35:18',208,86,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(335,'2022-07-05 21:35:18',208,86,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(336,'2022-07-05 21:35:18',208,86,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(337,'2022-07-05 21:35:18',208,86,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(338,'2022-07-05 21:50:42',210,87,0,'digital',NULL,NULL,NULL,'','','Clima','Estado valvula suelo rad biblioteca'),(339,'2022-07-05 21:50:53',210,87,1,'digital',NULL,NULL,NULL,'','','Clima','Estado valvula suelo rad entrada / comedor'),(340,'2022-07-11 15:32:20',210,87,2,'digital',NULL,NULL,NULL,'','','Clima','Estado valvula suelo rad pasillo habitaciones'),(341,'2022-07-05 21:49:52',210,87,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(342,'2022-07-05 21:49:52',210,87,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(343,'2022-07-05 21:49:53',210,87,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(344,'2022-07-05 21:49:53',210,87,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(345,'2022-07-05 21:49:53',210,87,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(346,'2022-07-06 17:09:21',212,88,0,'digital',NULL,NULL,NULL,'','','clima','Estado valvula suelo rad sala tv'),(347,'2022-07-06 17:09:30',212,88,1,'digital',NULL,NULL,NULL,'','','clima','Estado valvula suelo rad entrada / comedor'),(348,'2022-07-06 17:09:41',212,88,2,'digital',NULL,NULL,NULL,'','','clima','Estado valvula suelo rad cocina alejandro'),(349,'2022-07-06 17:09:49',212,88,3,'digital',NULL,NULL,NULL,'','','clima','Estado valvula suelo rad cocina principal'),(350,'2022-07-05 22:09:10',212,88,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(351,'2022-07-05 22:09:10',212,88,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(352,'2022-07-05 22:09:10',212,88,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(353,'2022-07-05 22:09:10',212,88,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(354,'2022-07-06 00:20:45',215,96,0,'analogica',NULL,NULL,NULL,'','','clima','camara frigorifica'),(355,'2022-07-06 22:39:38',216,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(356,'2022-07-06 22:39:38',216,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(357,'2022-07-06 22:39:38',216,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(358,'2022-07-06 22:50:09',216,97,3,'analogica','Integridad',NULL,NULL,'','','alumbrado','Focos techo vestibulo'),(359,'2022-07-06 22:39:38',216,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(360,'2022-07-06 22:39:45',217,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(361,'2022-07-06 22:39:45',217,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(362,'2022-07-06 22:39:45',217,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(363,'2022-07-06 22:50:23',217,98,3,'analogica','Integridad',NULL,NULL,'','','alumbrado','Integridad Focos techo cabecero Hab. Alejandro'),(364,'2022-07-06 22:39:45',217,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(365,'2022-07-06 22:39:50',218,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(366,'2022-07-06 22:39:50',218,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(367,'2022-07-06 22:39:50',218,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(368,'2022-07-06 22:50:47',218,99,3,'analogica','Integridad',NULL,NULL,'','','alumbrado','Integridad Focos techo Hab. Alejandro'),(369,'2022-07-06 22:39:50',218,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(370,'2022-07-06 22:39:55',219,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(371,'2022-07-06 22:39:55',219,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(372,'2022-07-06 22:39:55',219,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(373,'2022-07-06 22:51:04',219,100,3,'analogica','Integridad',NULL,NULL,'','','alumbrado','Integridad Led Hab. Alejandro'),(374,'2022-07-06 22:39:55',219,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(375,'2022-07-06 22:40:00',220,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(376,'2022-07-06 22:40:00',220,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(377,'2022-07-06 22:40:00',220,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(378,'2022-07-06 22:51:18',220,101,3,'analogica','Integridad',NULL,NULL,'','','alumbrado','Integridad Focos techo Baño Hab Alejandro'),(379,'2022-07-06 22:40:00',220,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(380,'2022-07-06 22:40:05',221,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(381,'2022-07-06 22:40:05',221,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(382,'2022-07-06 22:40:05',221,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(383,'2022-07-06 22:51:49',221,102,3,'analogica','Integridad',NULL,NULL,'','','alumbrado','Integridad Focos techo inodoro Baño Alejandro'),(384,'2022-07-06 22:40:05',221,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(385,'2022-07-06 22:40:10',222,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(386,'2022-07-06 22:40:10',222,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(387,'2022-07-06 22:40:10',222,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(388,'2022-07-06 22:52:03',222,103,3,'analogica','Integridad',NULL,NULL,'','','alumbrado','Integridad Focos espejo Baño Alejandro'),(389,'2022-07-06 22:40:11',222,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(390,'2022-07-06 22:40:14',223,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(391,'2022-07-06 22:40:14',223,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(392,'2022-07-06 22:40:14',223,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(393,'2022-07-06 22:52:20',223,104,3,'analogica','Integridad',NULL,NULL,'','','alumbrado','Integridad Focos techo jacuzzi Baño Alejandro'),(394,'2022-07-06 22:40:14',223,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(395,'2022-07-06 22:40:17',224,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(396,'2022-07-06 22:40:17',224,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(397,'2022-07-06 22:40:17',224,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(398,'2022-07-06 22:52:40',224,105,3,'analogica','Integridad',NULL,NULL,'','','alumbrado','Integridad Led Jacuzzi Baño Alejandro'),(399,'2022-07-06 22:40:18',224,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(400,'2022-07-06 22:40:21',225,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(401,'2022-07-06 22:40:21',225,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(402,'2022-07-06 22:40:21',225,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(403,'2022-07-06 22:52:55',225,106,3,'analogica','Integridad',NULL,NULL,'','','alumbrado','Integridad Led vestidor Alejandro'),(404,'2022-07-06 22:40:21',225,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(405,'2022-07-06 22:40:24',226,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(406,'2022-07-06 22:40:24',226,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(407,'2022-07-06 22:40:24',226,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(408,'2022-07-06 22:53:08',226,107,3,'analogica','Integridad',NULL,NULL,'','','alumbrado','Integridad Focos techo Hab. Rachel'),(409,'2022-07-06 22:40:24',226,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(410,'2022-07-06 22:40:28',227,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(411,'2022-07-06 22:40:28',227,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(412,'2022-07-06 22:40:28',227,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(413,'2022-07-06 22:53:24',227,108,3,'analogica','Integridad',NULL,NULL,'','','alumbrado','Integridad Focos techo escritorio Hab Rachel'),(414,'2022-07-06 22:40:28',227,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(415,'2022-07-06 22:40:34',228,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(416,'2022-07-06 22:40:34',228,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(417,'2022-07-06 22:40:34',228,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(418,'2022-07-06 22:53:38',228,109,3,'analogica','Integridad',NULL,NULL,'','','alumbrado','Integridad Focos techo baño Hab. Rachel'),(419,'2022-07-06 22:40:34',228,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(420,'2022-07-06 22:40:38',229,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(421,'2022-07-06 22:40:38',229,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(422,'2022-07-06 22:40:38',229,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(423,'2022-07-06 22:53:52',229,110,3,'analogica','Integridad',NULL,NULL,'','','alumbrado','Integridad Led espejo baño Hab. Rachel'),(424,'2022-07-06 22:40:39',229,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(425,'2022-07-06 22:41:07',230,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(426,'2022-07-06 22:41:07',230,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(427,'2022-07-06 22:41:07',230,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(428,'2022-07-06 23:02:06',230,111,3,'analogica','Integridad',NULL,NULL,'','','alumbrado','Integridad Led vestidor Hab. Rachel'),(429,'2022-07-06 22:41:07',230,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(430,'2022-07-06 22:41:10',231,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(431,'2022-07-06 22:41:10',231,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(432,'2022-07-06 22:41:10',231,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(433,'2022-07-06 23:02:43',231,112,3,'analogica','Integridad',NULL,NULL,'','','alumbrado','Focos terraza Hab Rachel'),(434,'2022-07-06 22:41:10',231,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(435,'2022-07-06 23:07:54',232,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(436,'2022-07-06 23:07:54',232,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(437,'2022-07-06 23:07:54',232,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(438,'2022-07-06 23:08:45',232,113,3,'analogica','Integridad',NULL,NULL,'','','Alumbrado','Integridad Led Terraza Habitacion Rachel'),(439,'2022-07-06 23:07:54',232,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(440,'2022-07-06 23:13:19',233,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(441,'2022-07-06 23:13:20',233,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(442,'2022-07-06 23:13:20',233,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(443,'2022-07-06 23:21:15',233,114,3,'analogica','Integridad',NULL,NULL,'','','Alumbrado','Integridad Alumbrado Led Perimetro pasillo'),(444,'2022-07-06 23:13:20',233,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(445,'2022-07-06 23:13:23',234,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(446,'2022-07-06 23:13:23',234,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(447,'2022-07-06 23:13:23',234,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(448,'2022-07-06 23:21:42',234,115,3,'analogica','Integridad',NULL,NULL,'','','Alumbrado','Integridad Alumbrado Focos techo centro comedor'),(449,'2022-07-06 23:13:23',234,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(450,'2022-07-06 23:13:27',235,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(451,'2022-07-06 23:13:27',235,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(452,'2022-07-06 23:13:27',235,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(453,'2022-07-06 23:22:04',235,116,3,'analogica','Integridad',NULL,NULL,'','','Alumbrado','Integridad Alumbrado Focos techo laterales comedor'),(454,'2022-07-06 23:13:27',235,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(455,'2022-07-06 23:13:32',236,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(456,'2022-07-06 23:13:32',236,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(457,'2022-07-06 23:13:32',236,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(458,'2022-07-06 23:22:21',236,117,3,'analogica','Integridad',NULL,NULL,'','','Alumbrado','Integridad Alumbrado Focos techo pasillo sala TV'),(459,'2022-07-06 23:13:32',236,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(460,'2022-07-06 23:13:35',237,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(461,'2022-07-06 23:13:35',237,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(462,'2022-07-06 23:13:35',237,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(463,'2022-07-06 23:22:37',237,118,3,'analogica','Integridad',NULL,NULL,'','','Alumbrado','Integridad Alumbrado Focos techo vestibulo sala tv**'),(464,'2022-07-06 23:13:35',237,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(465,'2022-07-06 23:13:39',238,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(466,'2022-07-06 23:13:39',238,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(467,'2022-07-06 23:13:39',238,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(468,'2022-07-06 23:22:58',238,119,3,'analogica','Integridad',NULL,NULL,'','','Alumbrado','Integridad Alumbrado Focos techo sala tv'),(469,'2022-07-06 23:13:39',238,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(470,'2022-07-06 23:13:42',239,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(471,'2022-07-06 23:13:42',239,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(472,'2022-07-06 23:13:42',239,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(473,'2022-07-06 23:23:18',239,120,3,'analogica','Integridad',NULL,NULL,'','','Alumbrado','Integridad Alumbrado Focos terraza sala TV'),(474,'2022-07-06 23:13:42',239,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(475,'2022-07-06 23:13:45',240,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(476,'2022-07-06 23:13:46',240,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(477,'2022-07-06 23:13:46',240,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(478,'2022-07-06 23:23:39',240,121,3,'analogica','Integridad',NULL,NULL,'','','Alumbrado','Integridad Alumbrado Led terraza sala TV'),(479,'2022-07-06 23:13:46',240,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(480,'2022-07-06 23:13:49',241,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(481,'2022-07-06 23:13:49',241,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(482,'2022-07-06 23:13:49',241,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(483,'2022-07-06 23:24:36',241,122,3,'analogica','Integridad',NULL,NULL,'','','Alumbrado','Integridad Alumbrado Focos techo baño cortesia'),(484,'2022-07-06 23:13:49',241,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(485,'2022-07-06 23:13:53',242,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(486,'2022-07-06 23:13:53',242,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(487,'2022-07-06 23:13:53',242,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(488,'2022-07-06 23:24:57',242,123,3,'analogica','Integridad',NULL,NULL,'','','Alumbrado','Integridad Alumbrado espejo baño cortesia'),(489,'2022-07-06 23:13:53',242,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(490,'2022-07-06 23:13:56',243,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(491,'2022-07-06 23:13:57',243,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(492,'2022-07-06 23:13:57',243,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(493,'2022-07-06 23:25:16',243,124,3,'analogica','Integridad',NULL,NULL,'','','Alumbrado','Integridad Alumbrado Led perimetro exterior entrada principal'),(494,'2022-07-06 23:13:57',243,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(495,'2022-07-06 23:14:05',244,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(496,'2022-07-06 23:14:05',244,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(497,'2022-07-06 23:14:05',244,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(498,'2022-07-06 23:25:39',244,125,3,'analogica','Integridad',NULL,NULL,'','','Alumbrado','Integridad Alumbrado Led entrada principal'),(499,'2022-07-06 23:14:05',244,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(500,'2022-07-07 09:16:22',245,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(501,'2022-07-07 09:16:22',245,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(502,'2022-07-07 09:16:22',245,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(503,'2022-07-07 09:16:22',245,126,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(504,'2022-07-07 09:16:22',245,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(505,'2022-07-07 09:16:28',246,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(506,'2022-07-07 09:16:28',246,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(507,'2022-07-07 09:16:28',246,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(508,'2022-07-07 09:16:28',246,127,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(509,'2022-07-07 09:16:28',246,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(510,'2022-07-07 09:16:31',247,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(511,'2022-07-07 09:16:31',247,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(512,'2022-07-07 09:16:31',247,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(513,'2022-07-07 09:16:31',247,128,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(514,'2022-07-07 09:16:31',247,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(515,'2022-07-07 09:16:34',248,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(516,'2022-07-07 09:16:34',248,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(517,'2022-07-07 09:16:34',248,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(518,'2022-07-07 09:16:34',248,129,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(519,'2022-07-07 09:16:34',248,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(520,'2022-07-07 09:16:37',249,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(521,'2022-07-07 09:16:37',249,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(522,'2022-07-07 09:16:37',249,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(523,'2022-07-07 09:16:37',249,130,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(524,'2022-07-07 09:16:37',249,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(525,'2022-07-07 16:07:51',250,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(526,'2022-07-07 16:07:51',250,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(527,'2022-07-07 16:07:51',250,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(528,'2022-07-07 16:07:51',250,131,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(529,'2022-07-07 16:07:51',250,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(530,'2022-07-07 16:07:55',251,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(531,'2022-07-07 16:07:55',251,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(532,'2022-07-07 16:07:55',251,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(533,'2022-07-07 16:07:55',251,132,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(534,'2022-07-07 16:07:55',251,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(535,'2022-07-07 16:07:58',252,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(536,'2022-07-07 16:07:58',252,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(537,'2022-07-07 16:07:58',252,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(538,'2022-07-07 16:07:58',252,133,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(539,'2022-07-07 16:07:58',252,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(540,'2022-07-07 16:08:00',253,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(541,'2022-07-07 16:08:01',253,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(542,'2022-07-07 16:08:01',253,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(543,'2022-07-07 16:08:01',253,134,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(544,'2022-07-07 16:08:01',253,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(545,'2022-07-07 16:08:04',254,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(546,'2022-07-07 16:08:04',254,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(547,'2022-07-07 16:08:04',254,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(548,'2022-07-07 16:08:04',254,135,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(549,'2022-07-07 16:08:04',254,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(550,'2022-07-07 16:08:07',255,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(551,'2022-07-07 16:08:07',255,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(552,'2022-07-07 16:08:08',255,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(553,'2022-07-07 16:08:08',255,136,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(554,'2022-07-07 16:08:08',255,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(555,'2022-07-07 16:08:11',256,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(556,'2022-07-07 16:08:12',256,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(557,'2022-07-07 16:08:12',256,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(558,'2022-07-07 16:08:12',256,137,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(559,'2022-07-07 16:08:12',256,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(560,'2022-07-07 16:08:15',257,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(561,'2022-07-07 16:08:15',257,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(562,'2022-07-07 16:08:15',257,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(563,'2022-07-07 16:08:15',257,138,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(564,'2022-07-07 16:08:15',257,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(565,'2022-07-07 16:08:18',258,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(566,'2022-07-07 16:08:18',258,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(567,'2022-07-07 16:08:18',258,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(568,'2022-07-07 16:08:18',258,139,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(569,'2022-07-07 16:08:18',258,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(570,'2022-07-07 16:08:21',259,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(571,'2022-07-07 16:08:21',259,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(572,'2022-07-07 16:08:21',259,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(573,'2022-07-07 16:08:21',259,140,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(574,'2022-07-07 16:08:22',259,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(575,'2022-07-07 16:08:25',260,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(576,'2022-07-07 16:08:25',260,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(577,'2022-07-07 16:08:25',260,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(578,'2022-07-07 16:08:25',260,141,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(579,'2022-07-07 16:08:25',260,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(580,'2022-07-07 16:08:28',261,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(581,'2022-07-07 16:08:28',261,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(582,'2022-07-07 16:08:28',261,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(583,'2022-07-07 16:08:29',261,293,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(584,'2022-07-07 16:08:29',261,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(585,'2022-07-07 16:11:42',262,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(586,'2022-07-07 16:11:42',262,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(587,'2022-07-07 16:11:42',262,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(588,'2022-07-07 16:11:42',262,143,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(589,'2022-07-07 16:11:42',262,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(590,'2022-07-07 16:11:54',263,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(591,'2022-07-07 16:11:54',263,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(592,'2022-07-07 16:11:54',263,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(593,'2022-07-07 16:11:54',263,144,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(594,'2022-07-07 16:11:54',263,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(595,'2022-07-07 16:11:58',264,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(596,'2022-07-07 16:11:58',264,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(597,'2022-07-07 16:11:58',264,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(598,'2022-07-07 16:11:58',264,145,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(599,'2022-07-07 16:11:58',264,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(600,'2022-07-07 16:17:17',265,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(601,'2022-07-07 16:17:17',265,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(602,'2022-07-07 16:17:17',265,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(603,'2022-07-07 16:17:17',265,146,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(604,'2022-07-07 16:17:17',265,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(605,'2022-07-07 16:17:20',266,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(606,'2022-07-07 16:17:20',266,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(607,'2022-07-07 16:17:21',266,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(608,'2022-07-07 16:17:21',266,147,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(609,'2022-07-07 16:17:21',266,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(610,'2022-07-07 16:17:23',267,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(611,'2022-07-07 16:17:23',267,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(612,'2022-07-07 16:17:24',267,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(613,'2022-07-07 16:17:24',267,148,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(614,'2022-07-07 16:17:24',267,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(615,'2022-07-07 16:17:28',268,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(616,'2022-07-07 16:17:28',268,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(617,'2022-07-07 16:17:28',268,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(618,'2022-07-07 16:17:28',268,149,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(619,'2022-07-07 16:17:28',268,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(620,'2022-07-07 16:17:31',269,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(621,'2022-07-07 16:17:32',269,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(622,'2022-07-07 16:17:32',269,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(623,'2022-07-07 16:17:32',269,150,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(624,'2022-07-07 16:17:32',269,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(625,'2022-07-07 16:23:30',270,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(626,'2022-07-07 16:23:30',270,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(627,'2022-07-07 16:23:30',270,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(628,'2022-07-07 16:23:30',270,151,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(629,'2022-07-07 16:23:30',270,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(630,'2022-07-07 16:23:35',271,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(631,'2022-07-07 16:23:35',271,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(632,'2022-07-07 16:23:35',271,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(633,'2022-07-07 16:23:35',271,152,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(634,'2022-07-07 16:23:35',271,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(635,'2022-07-07 16:23:37',272,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(636,'2022-07-07 16:23:37',272,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(637,'2022-07-07 16:23:38',272,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(638,'2022-07-07 16:23:38',272,153,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(639,'2022-07-07 16:23:38',272,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(640,'2022-07-07 16:23:42',273,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(641,'2022-07-07 16:23:42',273,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(642,'2022-07-07 16:23:42',273,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(643,'2022-07-07 16:23:42',273,154,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(644,'2022-07-07 16:23:42',273,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(645,'2022-07-07 16:23:45',274,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(646,'2022-07-07 16:23:45',274,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(647,'2022-07-07 16:23:45',274,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(648,'2022-07-07 16:23:45',274,155,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(649,'2022-07-07 16:23:45',274,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(650,'2022-07-07 16:24:00',275,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(651,'2022-07-07 16:24:00',275,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(652,'2022-07-07 16:24:00',275,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(653,'2022-07-07 16:24:00',275,156,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(654,'2022-07-07 16:24:00',275,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(655,'2022-07-07 16:24:12',276,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(656,'2022-07-07 16:24:12',276,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(657,'2022-07-07 16:24:12',276,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(658,'2022-07-07 16:24:12',276,157,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(659,'2022-07-07 16:24:12',276,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(660,'2022-07-07 16:24:15',277,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(661,'2022-07-07 16:24:15',277,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(662,'2022-07-07 16:24:15',277,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(663,'2022-07-07 16:24:15',277,158,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(664,'2022-07-07 16:24:15',277,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(665,'2022-07-07 16:24:21',278,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(666,'2022-07-07 16:24:21',278,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(667,'2022-07-07 16:24:21',278,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(668,'2022-07-07 16:24:21',278,159,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(669,'2022-07-07 16:24:21',278,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(670,'2022-07-07 16:24:24',279,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(671,'2022-07-07 16:24:24',279,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(672,'2022-07-07 16:24:24',279,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(673,'2022-07-07 16:24:24',279,160,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(674,'2022-07-07 16:24:24',279,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(675,'2022-07-07 16:24:32',280,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(676,'2022-07-07 16:24:32',280,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(677,'2022-07-07 16:24:32',280,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(678,'2022-07-07 16:24:32',280,161,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(679,'2022-07-07 16:24:33',280,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(680,'2022-07-07 16:24:35',281,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(681,'2022-07-07 16:24:35',281,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(682,'2022-07-07 16:24:35',281,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(683,'2022-07-07 16:24:35',281,162,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(684,'2022-07-07 16:24:35',281,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(685,'2022-07-07 16:24:39',282,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(686,'2022-07-07 16:24:39',282,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(687,'2022-07-07 16:24:39',282,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(688,'2022-07-07 16:24:39',282,163,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(689,'2022-07-07 16:24:39',282,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(690,'2022-07-07 16:24:43',283,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(691,'2022-07-07 16:24:43',283,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(692,'2022-07-07 16:24:44',283,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(693,'2022-07-07 16:24:44',283,164,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(694,'2022-07-07 16:24:44',283,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(695,'2022-07-07 16:24:46',284,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(696,'2022-07-07 16:24:46',284,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(697,'2022-07-07 16:24:46',284,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(698,'2022-07-07 16:24:46',284,165,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(699,'2022-07-07 16:24:46',284,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(700,'2022-07-07 16:25:09',285,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(701,'2022-07-07 16:25:09',285,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(702,'2022-07-07 16:25:09',285,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(703,'2022-07-12 18:06:04',285,166,3,'digital','Integridad',NULL,NULL,'','','','alumbrado cabecero'),(704,'2022-07-07 16:25:09',285,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(705,'2022-07-07 16:25:12',286,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(706,'2022-07-07 16:25:12',286,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(707,'2022-07-07 16:25:12',286,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(708,'2022-07-12 18:06:13',286,167,3,'digital','Integridad',NULL,NULL,'','','','alumbrado armario'),(709,'2022-07-07 16:25:12',286,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(710,'2022-07-07 16:25:18',287,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(711,'2022-07-07 16:25:18',287,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(712,'2022-07-07 16:25:18',287,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(713,'2022-07-12 18:06:25',287,168,3,'digital','Integridad',NULL,NULL,'','','','alumbrado cabecero'),(714,'2022-07-07 16:25:18',287,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(715,'2022-07-07 16:25:21',288,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(716,'2022-07-07 16:25:21',288,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(717,'2022-07-07 16:25:21',288,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(718,'2022-07-12 18:06:34',288,169,3,'digital','Integridad',NULL,NULL,'','','','alumbrado baño'),(719,'2022-07-07 16:25:21',288,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(720,'2022-07-07 16:25:23',289,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(721,'2022-07-07 16:25:24',289,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(722,'2022-07-07 16:25:24',289,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(723,'2022-07-12 18:06:44',289,170,3,'digital','Integridad',NULL,NULL,'','','','alumbrado espejo baño'),(724,'2022-07-07 16:25:24',289,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(725,'2022-07-07 16:26:04',290,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(726,'2022-07-07 16:26:04',290,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(727,'2022-07-07 16:26:04',290,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(728,'2022-07-07 16:26:04',290,171,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(729,'2022-07-07 16:26:04',290,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(730,'2022-07-07 16:26:06',291,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(731,'2022-07-07 16:26:06',291,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(732,'2022-07-07 16:26:07',291,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(733,'2022-07-07 16:26:07',291,172,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(734,'2022-07-07 16:26:07',291,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(735,'2022-07-07 16:26:10',292,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(736,'2022-07-07 16:26:10',292,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(737,'2022-07-07 16:26:10',292,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(738,'2022-07-07 16:26:10',292,173,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(739,'2022-07-07 16:26:10',292,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(740,'2022-07-07 16:26:12',293,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(741,'2022-07-07 16:26:12',293,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(742,'2022-07-07 16:26:12',293,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(743,'2022-07-07 16:26:12',293,174,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(744,'2022-07-07 16:26:12',293,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(745,'2022-07-07 16:26:15',294,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(746,'2022-07-07 16:26:15',294,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(747,'2022-07-07 16:26:15',294,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(748,'2022-07-07 16:26:15',294,175,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(749,'2022-07-07 16:26:15',294,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(750,'2022-07-07 16:26:47',295,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(751,'2022-07-07 16:26:47',295,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(752,'2022-07-07 16:26:47',295,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(753,'2022-07-07 16:26:47',295,176,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(754,'2022-07-07 16:26:48',295,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(755,'2022-07-07 16:26:50',296,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(756,'2022-07-07 16:26:50',296,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(757,'2022-07-07 16:26:50',296,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(758,'2022-07-07 16:26:50',296,177,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(759,'2022-07-07 16:26:50',296,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(760,'2022-07-07 16:26:53',297,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(761,'2022-07-07 16:26:53',297,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(762,'2022-07-07 16:26:53',297,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(763,'2022-07-07 16:26:53',297,178,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(764,'2022-07-07 16:26:53',297,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(765,'2022-07-07 16:26:56',298,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(766,'2022-07-07 16:26:56',298,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(767,'2022-07-07 16:26:57',298,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(768,'2022-07-07 16:26:57',298,179,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(769,'2022-07-07 16:26:57',298,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(770,'2022-07-07 16:26:59',299,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(771,'2022-07-07 16:26:59',299,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(772,'2022-07-07 16:26:59',299,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(773,'2022-07-07 16:26:59',299,180,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(774,'2022-07-07 16:26:59',299,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(775,'2022-07-07 16:27:03',300,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(776,'2022-07-07 16:27:03',300,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(777,'2022-07-07 16:27:03',300,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(778,'2022-07-07 16:27:03',300,181,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(779,'2022-07-07 16:27:03',300,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(780,'2022-07-07 16:27:07',301,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(781,'2022-07-07 16:27:07',301,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(782,'2022-07-07 16:27:07',301,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(783,'2022-07-07 16:27:07',301,182,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(784,'2022-07-07 16:27:07',301,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(785,'2022-07-07 16:27:11',302,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(786,'2022-07-07 16:27:11',302,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(787,'2022-07-07 16:27:11',302,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(788,'2022-07-07 16:27:11',302,183,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(789,'2022-07-07 16:27:11',302,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(790,'2022-07-07 16:27:15',303,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(791,'2022-07-07 16:27:15',303,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(792,'2022-07-07 16:27:15',303,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(793,'2022-07-07 16:27:15',303,184,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(794,'2022-07-07 16:27:15',303,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(795,'2022-07-07 16:27:40',304,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(796,'2022-07-07 16:27:40',304,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(797,'2022-07-07 16:27:41',304,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(798,'2022-07-07 16:27:41',304,185,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(799,'2022-07-07 16:27:42',304,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(800,'2022-07-07 16:27:46',305,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(801,'2022-07-07 16:27:46',305,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(802,'2022-07-07 16:27:46',305,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(803,'2022-07-07 16:27:46',305,186,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(804,'2022-07-07 16:27:46',305,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(805,'2022-07-07 16:56:35',306,187,0,'analogica','Tension fase L1',NULL,NULL,'','','','Tension fase L1'),(806,'2022-07-07 16:56:44',306,187,1,'analogica','Corriente L1',NULL,NULL,'','','','Corriente L1'),(807,'2022-07-07 16:56:56',306,187,2,'analogica','Potencia Activa L1',NULL,NULL,'','','','Potencia Activa L1'),(808,'2022-07-07 16:57:05',306,187,3,'analogica','Potencia Reactiva Inductiva L1',NULL,NULL,'','','','Potencia Reactiva Inductiva L1'),(809,'2022-07-07 16:57:15',306,187,4,'analogica','Potencia Reactiva Capacitiva L1',NULL,NULL,'','','','Potencia Reactiva Capacitiva L1'),(810,'2022-07-07 16:49:48',306,187,5,NULL,'Potencia Aparente L1',NULL,NULL,NULL,NULL,NULL,NULL),(811,'2022-07-07 16:49:48',306,187,6,NULL,'Factor de potencia L1',NULL,NULL,NULL,NULL,NULL,NULL),(812,'2022-07-07 16:49:48',306,187,7,NULL,'Cos L1',NULL,NULL,NULL,NULL,NULL,NULL),(813,'2022-07-07 16:57:33',306,187,8,'analogica','Tension fase L2',NULL,NULL,'','','','Tension fase L2'),(814,'2022-07-07 16:57:48',306,187,9,'analogica','Corriente L2',NULL,NULL,'','','','Corriente L2'),(815,'2022-07-07 16:49:48',306,187,10,NULL,'Potencia Activa L2',NULL,NULL,NULL,NULL,NULL,NULL),(816,'2022-07-07 16:49:48',306,187,11,NULL,'Potencia Reactiva Inductiva L2',NULL,NULL,NULL,NULL,NULL,NULL),(817,'2022-07-07 16:49:48',306,187,12,NULL,'Potencia Reactiva Capacitiva L2',NULL,NULL,NULL,NULL,NULL,NULL),(818,'2022-07-07 16:49:48',306,187,13,NULL,'Potencia Aparente L2',NULL,NULL,NULL,NULL,NULL,NULL),(819,'2022-07-07 16:49:49',306,187,14,NULL,'Factor de potencia L2',NULL,NULL,NULL,NULL,NULL,NULL),(820,'2022-07-07 16:49:49',306,187,15,NULL,'Cos L2',NULL,NULL,NULL,NULL,NULL,NULL),(821,'2022-07-07 16:58:01',306,187,16,'analogica','Tension fase L3',NULL,NULL,'','','','Tension fase L3'),(822,'2022-07-07 16:58:10',306,187,17,'analogica','Corriente L3',NULL,NULL,'','','','Corriente L3'),(823,'2022-07-07 16:58:25',306,187,18,'analogica','Potencia Activa L3',NULL,NULL,'','','','Potencia Activa L3'),(824,'2022-07-07 16:49:49',306,187,19,NULL,'Potencia Reactiva Inductiva L3',NULL,NULL,NULL,NULL,NULL,NULL),(825,'2022-07-07 16:49:49',306,187,20,NULL,'Potencia Reactiva Capacitiva L3',NULL,NULL,NULL,NULL,NULL,NULL),(826,'2022-07-07 16:49:49',306,187,21,NULL,'Potencia Aparente L3',NULL,NULL,NULL,NULL,NULL,NULL),(827,'2022-07-07 16:49:49',306,187,22,NULL,'Factor de potencia L3',NULL,NULL,NULL,NULL,NULL,NULL),(828,'2022-07-07 16:49:49',306,187,23,NULL,'Cos L3',NULL,NULL,NULL,NULL,NULL,NULL),(829,'2022-07-07 16:49:49',306,187,24,NULL,'Tension de Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(830,'2022-07-07 16:49:49',306,187,25,NULL,'Corriente de Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(831,'2022-07-07 16:49:50',306,187,26,NULL,'Frecuencia L1',NULL,NULL,NULL,NULL,NULL,NULL),(832,'2022-07-07 16:49:51',306,187,27,NULL,'Tension L1-L2',NULL,NULL,NULL,NULL,NULL,NULL),(833,'2022-07-07 16:49:51',306,187,28,NULL,'Tension L2-L3',NULL,NULL,NULL,NULL,NULL,NULL),(834,'2022-07-07 16:49:51',306,187,29,NULL,'Tension L3-L1',NULL,NULL,NULL,NULL,NULL,NULL),(835,'2022-07-07 16:58:58',306,187,30,'analogica','Tension linea III',NULL,NULL,'','','','Tension linea III'),(836,'2022-07-07 16:58:47',306,187,31,'analogica','Tension fase trifasica',NULL,NULL,'','','','Tension fase trifasica'),(837,'2022-07-07 16:49:51',306,187,32,NULL,'Corriente trifasica',NULL,NULL,NULL,NULL,NULL,NULL),(838,'2022-07-07 17:03:19',306,187,33,'analogica','Potencia activa trifasica',NULL,NULL,'','','','Potencia activa trifasica'),(839,'2022-07-07 16:59:14',306,187,34,'analogica','Potecia inductiva trifasica',NULL,NULL,'','','','Potecia inductiva trifasica'),(840,'2022-07-07 16:59:30',306,187,35,'analogica','Potencia capacitiva trifasica',NULL,NULL,'','','','Potencia capacitiva trifasica'),(841,'2022-07-07 16:59:41',306,187,36,'analogica','Potencia aparente trifasica',NULL,NULL,'','','','Potencia aparente trifasica'),(842,'2022-07-07 16:59:54',306,187,37,'analogica','Fase de potencia trifasica',NULL,NULL,'','','','Potencia aparente trifasica'),(843,'2022-07-07 17:00:42',306,187,38,'analogica','Cos trifasico',NULL,NULL,'','','','Cos trifasico'),(844,'2022-07-07 17:00:54',306,187,39,'analogica','% THD tension L1',NULL,NULL,'','','','% THD tension L1'),(845,'2022-07-07 17:01:05',306,187,40,'analogica','% THD tension L2',NULL,NULL,'','','','% THD tension L2'),(846,'2022-07-07 17:01:17',306,187,41,'analogica','% THD tension L3',NULL,NULL,'','','','% THD tension L3'),(847,'2022-07-07 17:01:28',306,187,42,'analogica','% THD tension Vn',NULL,NULL,'','','','% THD tension Vn'),(848,'2022-07-07 17:01:39',306,187,43,'analogica','% THD corriente L1',NULL,NULL,'','','','% THD corriente L1'),(849,'2022-07-07 17:01:51',306,187,44,'analogica','% THD corriente L2',NULL,NULL,'','','','% THD corriente L2'),(850,'2022-07-07 17:02:08',306,187,45,'analogica','% THD corriente L3',NULL,NULL,'','','','% THD corriente L3'),(851,'2022-07-07 17:02:22',306,187,46,'analogica','% THD corriente Ln',NULL,NULL,'','','','% THD corriente Ln'),(852,'2022-07-07 16:49:55',306,187,47,NULL,'Potencia Reactiva L1',NULL,NULL,NULL,NULL,NULL,NULL),(853,'2022-07-07 16:49:55',306,187,48,NULL,'Potencia Reactiva L2',NULL,NULL,NULL,NULL,NULL,NULL),(854,'2022-07-07 16:49:55',306,187,49,NULL,'Potencia Reactiva L3',NULL,NULL,NULL,NULL,NULL,NULL),(855,'2022-07-07 16:49:55',306,187,50,NULL,'Potencia Reactiva trifasica',NULL,NULL,NULL,NULL,NULL,NULL),(856,'2022-07-07 16:49:55',306,187,51,NULL,'Potencia Reactiva consumida L1',NULL,NULL,NULL,NULL,NULL,NULL),(857,'2022-07-07 16:49:55',306,187,52,NULL,'Potencia Reactiva consumida L2',NULL,NULL,NULL,NULL,NULL,NULL),(858,'2022-07-07 16:49:55',306,187,53,NULL,'Potencia Reactiva consumida L3',NULL,NULL,NULL,NULL,NULL,NULL),(859,'2022-07-07 16:49:55',306,187,54,NULL,'Potencia Reactiva consumida trifasica',NULL,NULL,NULL,NULL,NULL,NULL),(860,'2022-07-07 16:49:56',306,187,55,NULL,'Potencia Reactiva generada L1',NULL,NULL,NULL,NULL,NULL,NULL),(861,'2022-07-07 16:49:56',306,187,56,NULL,'Potencia Reactiva generada L2',NULL,NULL,NULL,NULL,NULL,NULL),(862,'2022-07-07 16:49:56',306,187,57,NULL,'Potencia Reactiva generada L3',NULL,NULL,NULL,NULL,NULL,NULL),(863,'2022-07-07 16:49:56',306,187,58,NULL,'Potencia Reactiva generada trifasica',NULL,NULL,NULL,NULL,NULL,NULL),(864,'2022-07-07 16:49:56',306,NULL,59,NULL,'Armonico Fundamental Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(865,'2022-07-07 16:49:56',306,NULL,60,NULL,'2º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(866,'2022-07-07 16:49:56',306,NULL,61,NULL,'3º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(867,'2022-07-07 16:49:56',306,NULL,62,NULL,'4º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(868,'2022-07-07 16:49:56',306,NULL,63,NULL,'5º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(869,'2022-07-07 16:49:56',306,NULL,64,NULL,'6º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(870,'2022-07-07 16:49:56',306,NULL,65,NULL,'7º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(871,'2022-07-07 16:49:56',306,NULL,66,NULL,'8º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(872,'2022-07-07 16:49:56',306,NULL,67,NULL,'9º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(873,'2022-07-07 16:49:57',306,NULL,68,NULL,'10º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(874,'2022-07-07 16:49:57',306,NULL,69,NULL,'11º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(875,'2022-07-07 16:49:57',306,NULL,70,NULL,'12º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(876,'2022-07-07 16:49:57',306,NULL,71,NULL,'13º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(877,'2022-07-07 16:49:57',306,NULL,72,NULL,'14º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(878,'2022-07-07 16:49:57',306,NULL,73,NULL,'15º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(879,'2022-07-07 16:49:57',306,NULL,74,NULL,'16º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(880,'2022-07-07 16:49:57',306,NULL,75,NULL,'17º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(881,'2022-07-07 16:49:57',306,NULL,76,NULL,'18º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(882,'2022-07-07 16:49:57',306,NULL,77,NULL,'19º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(883,'2022-07-07 16:49:57',306,NULL,78,NULL,'20º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(884,'2022-07-07 16:49:57',306,NULL,79,NULL,'21º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(885,'2022-07-07 16:49:57',306,NULL,80,NULL,'22º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(886,'2022-07-07 16:49:57',306,NULL,81,NULL,'23º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(887,'2022-07-07 16:49:57',306,NULL,82,NULL,'24º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(888,'2022-07-07 16:49:57',306,NULL,83,NULL,'25º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(889,'2022-07-07 16:49:57',306,NULL,84,NULL,'26º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(890,'2022-07-07 16:49:57',306,NULL,85,NULL,'27º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(891,'2022-07-07 16:49:58',306,NULL,86,NULL,'28º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(892,'2022-07-07 16:49:58',306,NULL,87,NULL,'29º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(893,'2022-07-07 16:49:58',306,NULL,88,NULL,'30º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(894,'2022-07-07 16:49:58',306,NULL,89,NULL,'31º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(895,'2022-07-07 16:49:58',306,NULL,90,NULL,'32º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(896,'2022-07-07 16:49:58',306,NULL,91,NULL,'33º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(897,'2022-07-07 16:49:58',306,NULL,92,NULL,'34º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(898,'2022-07-07 16:49:58',306,NULL,93,NULL,'35º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(899,'2022-07-07 16:49:58',306,NULL,94,NULL,'36º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(900,'2022-07-07 16:49:58',306,NULL,95,NULL,'37º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(901,'2022-07-07 16:49:58',306,NULL,96,NULL,'38º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(902,'2022-07-07 16:49:58',306,NULL,97,NULL,'39º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(903,'2022-07-07 16:49:58',306,NULL,98,NULL,'40º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(904,'2022-07-07 16:49:58',306,NULL,99,NULL,'41º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(905,'2022-07-07 16:49:58',306,NULL,100,NULL,'42º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(906,'2022-07-07 16:49:58',306,NULL,101,NULL,'43º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(907,'2022-07-07 16:49:58',306,NULL,102,NULL,'44º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(908,'2022-07-07 16:49:59',306,NULL,103,NULL,'45º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(909,'2022-07-07 16:49:59',306,NULL,104,NULL,'46º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(910,'2022-07-07 16:49:59',306,NULL,105,NULL,'47º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(911,'2022-07-07 16:49:59',306,NULL,106,NULL,'48º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(912,'2022-07-07 16:49:59',306,NULL,107,NULL,'49º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(913,'2022-07-07 16:49:59',306,NULL,108,NULL,'50º Armonico Tension L1',NULL,NULL,NULL,NULL,NULL,NULL),(914,'2022-07-07 16:49:59',306,NULL,109,NULL,'Armonico Fundamental Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(915,'2022-07-07 16:49:59',306,NULL,110,NULL,'2º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(916,'2022-07-07 16:49:59',306,NULL,111,NULL,'3º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(917,'2022-07-07 16:49:59',306,NULL,112,NULL,'4º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(918,'2022-07-07 16:49:59',306,NULL,113,NULL,'5º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(919,'2022-07-07 16:49:59',306,NULL,114,NULL,'6º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(920,'2022-07-07 16:49:59',306,NULL,115,NULL,'7º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(921,'2022-07-07 16:50:01',306,NULL,116,NULL,'8º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(922,'2022-07-07 16:50:01',306,NULL,117,NULL,'9º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(923,'2022-07-07 16:50:01',306,NULL,118,NULL,'10º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(924,'2022-07-07 16:50:01',306,NULL,119,NULL,'11º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(925,'2022-07-07 16:50:01',306,NULL,120,NULL,'12º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(926,'2022-07-07 16:50:01',306,NULL,121,NULL,'13º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(927,'2022-07-07 16:50:01',306,NULL,122,NULL,'14º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(928,'2022-07-07 16:50:01',306,NULL,123,NULL,'15º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(929,'2022-07-07 16:50:01',306,NULL,124,NULL,'16º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(930,'2022-07-07 16:50:02',306,NULL,125,NULL,'17º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(931,'2022-07-07 16:50:02',306,NULL,126,NULL,'18º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(932,'2022-07-07 16:50:02',306,NULL,127,NULL,'19º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(933,'2022-07-07 16:50:02',306,NULL,128,NULL,'20º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(934,'2022-07-07 16:50:02',306,NULL,129,NULL,'21º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(935,'2022-07-07 16:50:02',306,NULL,130,NULL,'22º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(936,'2022-07-07 16:50:02',306,NULL,131,NULL,'23º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(937,'2022-07-07 16:50:02',306,NULL,132,NULL,'24º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(938,'2022-07-07 16:50:02',306,NULL,133,NULL,'25º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(939,'2022-07-07 16:50:02',306,NULL,134,NULL,'26º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(940,'2022-07-07 16:50:02',306,NULL,135,NULL,'27º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(941,'2022-07-07 16:50:02',306,NULL,136,NULL,'28º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(942,'2022-07-07 16:50:02',306,NULL,137,NULL,'29º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(943,'2022-07-07 16:50:02',306,NULL,138,NULL,'30º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(944,'2022-07-07 16:50:02',306,NULL,139,NULL,'31º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(945,'2022-07-07 16:50:02',306,NULL,140,NULL,'32º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(946,'2022-07-07 16:50:02',306,NULL,141,NULL,'33º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(947,'2022-07-07 16:50:03',306,NULL,142,NULL,'34º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(948,'2022-07-07 16:50:03',306,NULL,143,NULL,'35º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(949,'2022-07-07 16:50:03',306,NULL,144,NULL,'36º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(950,'2022-07-07 16:50:03',306,NULL,145,NULL,'37º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(951,'2022-07-07 16:50:03',306,NULL,146,NULL,'38º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(952,'2022-07-07 16:50:03',306,NULL,147,NULL,'39º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(953,'2022-07-07 16:50:03',306,NULL,148,NULL,'40º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(954,'2022-07-07 16:50:03',306,NULL,149,NULL,'41º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(955,'2022-07-07 16:50:03',306,NULL,150,NULL,'42º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(956,'2022-07-07 16:50:03',306,NULL,151,NULL,'43º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(957,'2022-07-07 16:50:03',306,NULL,152,NULL,'44º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(958,'2022-07-07 16:50:03',306,NULL,153,NULL,'45º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(959,'2022-07-07 16:50:03',306,NULL,154,NULL,'46º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(960,'2022-07-07 16:50:04',306,NULL,155,NULL,'47º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(961,'2022-07-07 16:50:04',306,NULL,156,NULL,'48º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(962,'2022-07-07 16:50:04',306,NULL,157,NULL,'49º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(963,'2022-07-07 16:50:04',306,NULL,158,NULL,'50º Armonico Tension L2',NULL,NULL,NULL,NULL,NULL,NULL),(964,'2022-07-07 16:50:04',306,NULL,159,NULL,'Armonico Fundamental Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(965,'2022-07-07 16:50:04',306,NULL,160,NULL,'2º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(966,'2022-07-07 16:50:04',306,NULL,161,NULL,'3º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(967,'2022-07-07 16:50:04',306,NULL,162,NULL,'4º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(968,'2022-07-07 16:50:04',306,NULL,163,NULL,'5º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(969,'2022-07-07 16:50:04',306,NULL,164,NULL,'6º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(970,'2022-07-07 16:50:04',306,NULL,165,NULL,'7º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(971,'2022-07-07 16:50:04',306,NULL,166,NULL,'8º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(972,'2022-07-07 16:50:04',306,NULL,167,NULL,'9º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(973,'2022-07-07 16:50:04',306,NULL,168,NULL,'10º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(974,'2022-07-07 16:50:04',306,NULL,169,NULL,'11º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(975,'2022-07-07 16:50:04',306,NULL,170,NULL,'12º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(976,'2022-07-07 16:50:05',306,NULL,171,NULL,'13º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(977,'2022-07-07 16:50:05',306,NULL,172,NULL,'14º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(978,'2022-07-07 16:50:05',306,NULL,173,NULL,'15º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(979,'2022-07-07 16:50:05',306,NULL,174,NULL,'16º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(980,'2022-07-07 16:50:05',306,NULL,175,NULL,'17º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(981,'2022-07-07 16:50:05',306,NULL,176,NULL,'18º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(982,'2022-07-07 16:50:05',306,NULL,177,NULL,'19º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(983,'2022-07-07 16:50:06',306,NULL,178,NULL,'20º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(984,'2022-07-07 16:50:06',306,NULL,179,NULL,'21º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(985,'2022-07-07 16:50:06',306,NULL,180,NULL,'22º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(986,'2022-07-07 16:50:06',306,NULL,181,NULL,'23º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(987,'2022-07-07 16:50:06',306,NULL,182,NULL,'24º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(988,'2022-07-07 16:50:06',306,NULL,183,NULL,'25º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(989,'2022-07-07 16:50:06',306,NULL,184,NULL,'26º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(990,'2022-07-07 16:50:06',306,NULL,185,NULL,'27º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(991,'2022-07-07 16:50:06',306,NULL,186,NULL,'28º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(992,'2022-07-07 16:50:06',306,NULL,187,NULL,'29º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(993,'2022-07-07 16:50:06',306,NULL,188,NULL,'30º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(994,'2022-07-07 16:50:06',306,NULL,189,NULL,'31º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(995,'2022-07-07 16:50:06',306,NULL,190,NULL,'32º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(996,'2022-07-07 16:50:06',306,NULL,191,NULL,'33º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(997,'2022-07-07 16:50:07',306,NULL,192,NULL,'34º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(998,'2022-07-07 16:50:07',306,NULL,193,NULL,'35º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(999,'2022-07-07 16:50:07',306,NULL,194,NULL,'36º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(1000,'2022-07-07 16:50:07',306,NULL,195,NULL,'37º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(1001,'2022-07-07 16:50:07',306,NULL,196,NULL,'38º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(1002,'2022-07-07 16:50:07',306,NULL,197,NULL,'39º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(1003,'2022-07-07 16:50:07',306,NULL,198,NULL,'40º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(1004,'2022-07-07 16:50:07',306,NULL,199,NULL,'41º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(1005,'2022-07-07 16:50:07',306,NULL,200,NULL,'42º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(1006,'2022-07-07 16:50:07',306,NULL,201,NULL,'43º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(1007,'2022-07-07 16:50:07',306,NULL,202,NULL,'44º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(1008,'2022-07-07 16:50:07',306,NULL,203,NULL,'45º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(1009,'2022-07-07 16:50:07',306,NULL,204,NULL,'46º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(1010,'2022-07-07 16:50:07',306,NULL,205,NULL,'47º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(1011,'2022-07-07 16:50:07',306,NULL,206,NULL,'48º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(1012,'2022-07-07 16:50:07',306,NULL,207,NULL,'49º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(1013,'2022-07-07 16:50:08',306,NULL,208,NULL,'50º Armonico Tension L3',NULL,NULL,NULL,NULL,NULL,NULL),(1014,'2022-07-07 16:50:08',306,NULL,209,NULL,'Armonico Fundamental Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1015,'2022-07-07 16:50:08',306,NULL,210,NULL,'2º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1016,'2022-07-07 16:50:08',306,NULL,211,NULL,'3º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1017,'2022-07-07 16:50:08',306,NULL,212,NULL,'4º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1018,'2022-07-07 16:50:08',306,NULL,213,NULL,'5º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1019,'2022-07-07 16:50:08',306,NULL,214,NULL,'6º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1020,'2022-07-07 16:50:08',306,NULL,215,NULL,'7º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1021,'2022-07-07 16:50:08',306,NULL,216,NULL,'8º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1022,'2022-07-07 16:50:08',306,NULL,217,NULL,'9º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1023,'2022-07-07 16:50:08',306,NULL,218,NULL,'10º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1024,'2022-07-07 16:50:08',306,NULL,219,NULL,'11º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1025,'2022-07-07 16:50:08',306,NULL,220,NULL,'12º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1026,'2022-07-07 16:50:08',306,NULL,221,NULL,'13º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1027,'2022-07-07 16:50:08',306,NULL,222,NULL,'14º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1028,'2022-07-07 16:50:08',306,NULL,223,NULL,'15º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1029,'2022-07-07 16:50:09',306,NULL,224,NULL,'16º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1030,'2022-07-07 16:50:09',306,NULL,225,NULL,'17º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1031,'2022-07-07 16:50:09',306,NULL,226,NULL,'18º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1032,'2022-07-07 16:50:09',306,NULL,227,NULL,'19º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1033,'2022-07-07 16:50:09',306,NULL,228,NULL,'20º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1034,'2022-07-07 16:50:09',306,NULL,229,NULL,'21º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1035,'2022-07-07 16:50:09',306,NULL,230,NULL,'22º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1036,'2022-07-07 16:50:09',306,NULL,231,NULL,'23º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1037,'2022-07-07 16:50:09',306,NULL,232,NULL,'24º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1038,'2022-07-07 16:50:09',306,NULL,233,NULL,'25º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1039,'2022-07-07 16:50:09',306,NULL,234,NULL,'26º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1040,'2022-07-07 16:50:09',306,NULL,235,NULL,'27º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1041,'2022-07-07 16:50:09',306,NULL,236,NULL,'28º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1042,'2022-07-07 16:50:09',306,NULL,237,NULL,'29º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1043,'2022-07-07 16:50:09',306,NULL,238,NULL,'30º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1044,'2022-07-07 16:50:09',306,NULL,239,NULL,'31º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1045,'2022-07-07 16:50:09',306,NULL,240,NULL,'32º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1046,'2022-07-07 16:50:09',306,NULL,241,NULL,'33º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1047,'2022-07-07 16:50:10',306,NULL,242,NULL,'34º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1048,'2022-07-07 16:50:10',306,NULL,243,NULL,'35º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1049,'2022-07-07 16:50:10',306,NULL,244,NULL,'36º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1050,'2022-07-07 16:50:10',306,NULL,245,NULL,'37º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1051,'2022-07-07 16:50:10',306,NULL,246,NULL,'38º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1052,'2022-07-07 16:50:10',306,NULL,247,NULL,'39º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1053,'2022-07-07 16:50:10',306,NULL,248,NULL,'40º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1054,'2022-07-07 16:50:10',306,NULL,249,NULL,'41º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1055,'2022-07-07 16:50:10',306,NULL,250,NULL,'42º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1056,'2022-07-07 16:50:10',306,NULL,251,NULL,'43º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1057,'2022-07-07 16:50:10',306,NULL,252,NULL,'44º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1058,'2022-07-07 16:50:10',306,NULL,253,NULL,'45º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1059,'2022-07-07 16:50:10',306,NULL,254,NULL,'46º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1060,'2022-07-07 16:50:11',306,NULL,255,NULL,'47º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1061,'2022-07-07 16:50:11',306,NULL,256,NULL,'48º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1062,'2022-07-07 16:50:11',306,NULL,257,NULL,'49º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1063,'2022-07-07 16:50:11',306,NULL,258,NULL,'50º Armonico Tension Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1064,'2022-07-07 16:50:11',306,NULL,259,NULL,'Armonico Fundamental Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1065,'2022-07-07 16:50:11',306,NULL,260,NULL,'2º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1066,'2022-07-07 16:50:11',306,NULL,261,NULL,'3º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1067,'2022-07-07 16:50:11',306,NULL,262,NULL,'4º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1068,'2022-07-07 16:50:11',306,NULL,263,NULL,'5º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1069,'2022-07-07 16:50:11',306,NULL,264,NULL,'6º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1070,'2022-07-07 16:50:11',306,NULL,265,NULL,'7º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1071,'2022-07-07 16:50:11',306,NULL,266,NULL,'8º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1072,'2022-07-07 16:50:11',306,NULL,267,NULL,'9º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1073,'2022-07-07 16:50:11',306,NULL,268,NULL,'10º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1074,'2022-07-07 16:50:11',306,NULL,269,NULL,'11º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1075,'2022-07-07 16:50:11',306,NULL,270,NULL,'12º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1076,'2022-07-07 16:50:11',306,NULL,271,NULL,'13º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1077,'2022-07-07 16:50:11',306,NULL,272,NULL,'14º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1078,'2022-07-07 16:50:12',306,NULL,273,NULL,'15º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1079,'2022-07-07 16:50:12',306,NULL,274,NULL,'16º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1080,'2022-07-07 16:50:12',306,NULL,275,NULL,'17º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1081,'2022-07-07 16:50:12',306,NULL,276,NULL,'18º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1082,'2022-07-07 16:50:12',306,NULL,277,NULL,'19º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1083,'2022-07-07 16:50:12',306,NULL,278,NULL,'20º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1084,'2022-07-07 16:50:12',306,NULL,279,NULL,'21º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1085,'2022-07-07 16:50:12',306,NULL,280,NULL,'22º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1086,'2022-07-07 16:50:12',306,NULL,281,NULL,'23º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1087,'2022-07-07 16:50:12',306,NULL,282,NULL,'24º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1088,'2022-07-07 16:50:12',306,NULL,283,NULL,'25º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1089,'2022-07-07 16:50:12',306,NULL,284,NULL,'26º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1090,'2022-07-07 16:50:12',306,NULL,285,NULL,'27º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1091,'2022-07-07 16:50:13',306,NULL,286,NULL,'28º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1092,'2022-07-07 16:50:13',306,NULL,287,NULL,'29º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1093,'2022-07-07 16:50:13',306,NULL,288,NULL,'30º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1094,'2022-07-07 16:50:13',306,NULL,289,NULL,'31º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1095,'2022-07-07 16:50:13',306,NULL,290,NULL,'32º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1096,'2022-07-07 16:50:13',306,NULL,291,NULL,'33º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1097,'2022-07-07 16:50:13',306,NULL,292,NULL,'34º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1098,'2022-07-07 16:50:13',306,NULL,293,NULL,'35º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1099,'2022-07-07 16:50:13',306,NULL,294,NULL,'36º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1100,'2022-07-07 16:50:13',306,NULL,295,NULL,'37º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1101,'2022-07-07 16:50:13',306,NULL,296,NULL,'38º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1102,'2022-07-07 16:50:13',306,NULL,297,NULL,'39º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1103,'2022-07-07 16:50:13',306,NULL,298,NULL,'40º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1104,'2022-07-07 16:50:13',306,NULL,299,NULL,'41º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1105,'2022-07-07 16:50:13',306,NULL,300,NULL,'42º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1106,'2022-07-07 16:50:13',306,NULL,301,NULL,'43º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1107,'2022-07-07 16:50:13',306,NULL,302,NULL,'44º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1108,'2022-07-07 16:50:13',306,NULL,303,NULL,'45º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1109,'2022-07-07 16:50:13',306,NULL,304,NULL,'46º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1110,'2022-07-07 16:50:14',306,NULL,305,NULL,'47º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1111,'2022-07-07 16:50:14',306,NULL,306,NULL,'48º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1112,'2022-07-07 16:50:14',306,NULL,307,NULL,'49º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1113,'2022-07-07 16:50:14',306,NULL,308,NULL,'50º Armonico Corriente L1',NULL,NULL,NULL,NULL,NULL,NULL),(1114,'2022-07-07 16:50:14',306,NULL,309,NULL,'Armonico Fundamental Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1115,'2022-07-07 16:50:14',306,NULL,310,NULL,'2º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1116,'2022-07-07 16:50:14',306,NULL,311,NULL,'3º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1117,'2022-07-07 16:50:14',306,NULL,312,NULL,'4º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1118,'2022-07-07 16:50:14',306,NULL,313,NULL,'5º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1119,'2022-07-07 16:50:14',306,NULL,314,NULL,'6º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1120,'2022-07-07 16:50:14',306,NULL,315,NULL,'7º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1121,'2022-07-07 16:50:14',306,NULL,316,NULL,'8º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1122,'2022-07-07 16:50:14',306,NULL,317,NULL,'9º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1123,'2022-07-07 16:50:14',306,NULL,318,NULL,'10º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1124,'2022-07-07 16:50:14',306,NULL,319,NULL,'11º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1125,'2022-07-07 16:50:15',306,NULL,320,NULL,'12º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1126,'2022-07-07 16:50:15',306,NULL,321,NULL,'13º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1127,'2022-07-07 16:50:15',306,NULL,322,NULL,'14º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1128,'2022-07-07 16:50:15',306,NULL,323,NULL,'15º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1129,'2022-07-07 16:50:15',306,NULL,324,NULL,'16º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1130,'2022-07-07 16:50:15',306,NULL,325,NULL,'17º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1131,'2022-07-07 16:50:15',306,NULL,326,NULL,'18º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1132,'2022-07-07 16:50:15',306,NULL,327,NULL,'19º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1133,'2022-07-07 16:50:15',306,NULL,328,NULL,'20º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1134,'2022-07-07 16:50:15',306,NULL,329,NULL,'21º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1135,'2022-07-07 16:50:15',306,NULL,330,NULL,'22º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1136,'2022-07-07 16:50:15',306,NULL,331,NULL,'23º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1137,'2022-07-07 16:50:15',306,NULL,332,NULL,'24º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1138,'2022-07-07 16:50:15',306,NULL,333,NULL,'25º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1139,'2022-07-07 16:50:15',306,NULL,334,NULL,'26º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1140,'2022-07-07 16:50:15',306,NULL,335,NULL,'27º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1141,'2022-07-07 16:50:16',306,NULL,336,NULL,'28º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1142,'2022-07-07 16:50:16',306,NULL,337,NULL,'29º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1143,'2022-07-07 16:50:16',306,NULL,338,NULL,'30º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1144,'2022-07-07 16:50:16',306,NULL,339,NULL,'31º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1145,'2022-07-07 16:50:16',306,NULL,340,NULL,'32º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1146,'2022-07-07 16:50:16',306,NULL,341,NULL,'33º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1147,'2022-07-07 16:50:16',306,NULL,342,NULL,'34º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1148,'2022-07-07 16:50:16',306,NULL,343,NULL,'35º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1149,'2022-07-07 16:50:16',306,NULL,344,NULL,'36º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1150,'2022-07-07 16:50:16',306,NULL,345,NULL,'37º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1151,'2022-07-07 16:50:16',306,NULL,346,NULL,'38º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1152,'2022-07-07 16:50:16',306,NULL,347,NULL,'39º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1153,'2022-07-07 16:50:16',306,NULL,348,NULL,'40º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1154,'2022-07-07 16:50:16',306,NULL,349,NULL,'41º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1155,'2022-07-07 16:50:16',306,NULL,350,NULL,'42º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1156,'2022-07-07 16:50:16',306,NULL,351,NULL,'43º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1157,'2022-07-07 16:50:16',306,NULL,352,NULL,'44º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1158,'2022-07-07 16:50:16',306,NULL,353,NULL,'45º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1159,'2022-07-07 16:50:16',306,NULL,354,NULL,'46º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1160,'2022-07-07 16:50:16',306,NULL,355,NULL,'47º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1161,'2022-07-07 16:50:16',306,NULL,356,NULL,'48º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1162,'2022-07-07 16:50:17',306,NULL,357,NULL,'49º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1163,'2022-07-07 16:50:17',306,NULL,358,NULL,'50º Armonico Corriente L2',NULL,NULL,NULL,NULL,NULL,NULL),(1164,'2022-07-07 16:50:17',306,NULL,359,NULL,'Armonico Fundamental Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1165,'2022-07-07 16:50:17',306,NULL,360,NULL,'2º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1166,'2022-07-07 16:50:17',306,NULL,361,NULL,'3º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1167,'2022-07-07 16:50:17',306,NULL,362,NULL,'4º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1168,'2022-07-07 16:50:17',306,NULL,363,NULL,'5º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1169,'2022-07-07 16:50:17',306,NULL,364,NULL,'6º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1170,'2022-07-07 16:50:17',306,NULL,365,NULL,'7º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1171,'2022-07-07 16:50:17',306,NULL,366,NULL,'8º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1172,'2022-07-07 16:50:17',306,NULL,367,NULL,'9º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1173,'2022-07-07 16:50:17',306,NULL,368,NULL,'10º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1174,'2022-07-07 16:50:17',306,NULL,369,NULL,'11º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1175,'2022-07-07 16:50:17',306,NULL,370,NULL,'12º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1176,'2022-07-07 16:50:17',306,NULL,371,NULL,'13º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1177,'2022-07-07 16:50:17',306,NULL,372,NULL,'14º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1178,'2022-07-07 16:50:17',306,NULL,373,NULL,'15º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1179,'2022-07-07 16:50:17',306,NULL,374,NULL,'16º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1180,'2022-07-07 16:50:17',306,NULL,375,NULL,'17º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1181,'2022-07-07 16:50:17',306,NULL,376,NULL,'18º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1182,'2022-07-07 16:50:18',306,NULL,377,NULL,'19º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1183,'2022-07-07 16:50:18',306,NULL,378,NULL,'20º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1184,'2022-07-07 16:50:18',306,NULL,379,NULL,'21º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1185,'2022-07-07 16:50:18',306,NULL,380,NULL,'22º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1186,'2022-07-07 16:50:18',306,NULL,381,NULL,'23º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1187,'2022-07-07 16:50:18',306,NULL,382,NULL,'24º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1188,'2022-07-07 16:50:18',306,NULL,383,NULL,'25º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1189,'2022-07-07 16:50:18',306,NULL,384,NULL,'26º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1190,'2022-07-07 16:50:18',306,NULL,385,NULL,'27º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1191,'2022-07-07 16:50:18',306,NULL,386,NULL,'28º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1192,'2022-07-07 16:50:18',306,NULL,387,NULL,'29º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1193,'2022-07-07 16:50:18',306,NULL,388,NULL,'30º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1194,'2022-07-07 16:50:18',306,NULL,389,NULL,'31º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1195,'2022-07-07 16:50:18',306,NULL,390,NULL,'32º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1196,'2022-07-07 16:50:18',306,NULL,391,NULL,'33º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1197,'2022-07-07 16:50:18',306,NULL,392,NULL,'34º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1198,'2022-07-07 16:50:18',306,NULL,393,NULL,'35º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1199,'2022-07-07 16:50:19',306,NULL,394,NULL,'36º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1200,'2022-07-07 16:50:19',306,NULL,395,NULL,'37º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1201,'2022-07-07 16:50:19',306,NULL,396,NULL,'38º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1202,'2022-07-07 16:50:19',306,NULL,397,NULL,'39º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1203,'2022-07-07 16:50:19',306,NULL,398,NULL,'40º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1204,'2022-07-07 16:50:19',306,NULL,399,NULL,'41º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1205,'2022-07-07 16:50:19',306,NULL,400,NULL,'42º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1206,'2022-07-07 16:50:19',306,NULL,401,NULL,'43º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1207,'2022-07-07 16:50:19',306,NULL,402,NULL,'44º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1208,'2022-07-07 16:50:19',306,NULL,403,NULL,'45º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1209,'2022-07-07 16:50:19',306,NULL,404,NULL,'46º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1210,'2022-07-07 16:50:19',306,NULL,405,NULL,'47º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1211,'2022-07-07 16:50:19',306,NULL,406,NULL,'48º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1212,'2022-07-07 16:50:19',306,NULL,407,NULL,'49º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1213,'2022-07-07 16:50:19',306,NULL,408,NULL,'50º Armonico Corriente L3',NULL,NULL,NULL,NULL,NULL,NULL),(1214,'2022-07-07 16:50:19',306,NULL,409,NULL,'Armonico Fundamental Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1215,'2022-07-07 16:50:19',306,NULL,410,NULL,'2º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1216,'2022-07-07 16:50:19',306,NULL,411,NULL,'3º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1217,'2022-07-07 16:50:20',306,NULL,412,NULL,'4º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1218,'2022-07-07 16:50:20',306,NULL,413,NULL,'5º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1219,'2022-07-07 16:50:20',306,NULL,414,NULL,'6º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1220,'2022-07-07 16:50:20',306,NULL,415,NULL,'7º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1221,'2022-07-07 16:50:20',306,NULL,416,NULL,'8º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1222,'2022-07-07 16:50:20',306,NULL,417,NULL,'9º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1223,'2022-07-07 16:50:20',306,NULL,418,NULL,'10º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1224,'2022-07-07 16:50:20',306,NULL,419,NULL,'11º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1225,'2022-07-07 16:50:20',306,NULL,420,NULL,'12º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1226,'2022-07-07 16:50:20',306,NULL,421,NULL,'13º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1227,'2022-07-07 16:50:20',306,NULL,422,NULL,'14º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1228,'2022-07-07 16:50:20',306,NULL,423,NULL,'15º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1229,'2022-07-07 16:50:20',306,NULL,424,NULL,'16º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1230,'2022-07-07 16:50:20',306,NULL,425,NULL,'17º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1231,'2022-07-07 16:50:20',306,NULL,426,NULL,'18º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1232,'2022-07-07 16:50:20',306,NULL,427,NULL,'19º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1233,'2022-07-07 16:50:20',306,NULL,428,NULL,'20º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1234,'2022-07-07 16:50:20',306,NULL,429,NULL,'21º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1235,'2022-07-07 16:50:21',306,NULL,430,NULL,'22º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1236,'2022-07-07 16:50:21',306,NULL,431,NULL,'23º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1237,'2022-07-07 16:50:21',306,NULL,432,NULL,'24º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1238,'2022-07-07 16:50:21',306,NULL,433,NULL,'25º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1239,'2022-07-07 16:50:21',306,NULL,434,NULL,'26º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1240,'2022-07-07 16:50:21',306,NULL,435,NULL,'27º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1241,'2022-07-07 16:50:21',306,NULL,436,NULL,'28º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1242,'2022-07-07 16:50:21',306,NULL,437,NULL,'29º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1243,'2022-07-07 16:50:21',306,NULL,438,NULL,'30º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1244,'2022-07-07 16:50:21',306,NULL,439,NULL,'31º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1245,'2022-07-07 16:50:21',306,NULL,440,NULL,'32º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1246,'2022-07-07 16:50:21',306,NULL,441,NULL,'33º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1247,'2022-07-07 16:50:21',306,NULL,442,NULL,'34º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1248,'2022-07-07 16:50:21',306,NULL,443,NULL,'35º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1249,'2022-07-07 16:50:21',306,NULL,444,NULL,'36º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1250,'2022-07-07 16:50:21',306,NULL,445,NULL,'37º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1251,'2022-07-07 16:50:21',306,NULL,446,NULL,'38º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1252,'2022-07-07 16:50:21',306,NULL,447,NULL,'39º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1253,'2022-07-07 16:50:22',306,NULL,448,NULL,'40º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1254,'2022-07-07 16:50:22',306,NULL,449,NULL,'41º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1255,'2022-07-07 16:50:22',306,NULL,450,NULL,'42º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1256,'2022-07-07 16:50:22',306,NULL,451,NULL,'43º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1257,'2022-07-07 16:50:22',306,NULL,452,NULL,'44º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1258,'2022-07-07 16:50:22',306,NULL,453,NULL,'45º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1259,'2022-07-07 16:50:22',306,NULL,454,NULL,'46º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1260,'2022-07-07 16:50:22',306,NULL,455,NULL,'47º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1261,'2022-07-07 16:50:22',306,NULL,456,NULL,'48º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1262,'2022-07-07 16:50:22',306,NULL,457,NULL,'49º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1263,'2022-07-07 16:50:22',306,NULL,458,NULL,'50º Armonico Corriente Neutro',NULL,NULL,NULL,NULL,NULL,NULL),(1264,'2022-07-07 17:03:49',306,188,459,'analogica','Energia activa consumida L1',NULL,NULL,'','','','Energia activa consumida L1'),(1265,'2022-07-07 16:50:22',306,188,460,NULL,'Energia activa consumida L2',NULL,NULL,NULL,NULL,NULL,NULL),(1266,'2022-07-07 16:50:22',306,188,461,NULL,'Energia activa consumida L3',NULL,NULL,NULL,NULL,NULL,NULL),(1267,'2022-07-07 16:50:22',306,188,462,NULL,'Energia activa consumida LIII',NULL,NULL,NULL,NULL,NULL,NULL),(1268,'2022-07-07 16:50:22',306,188,463,NULL,'Energia reactiva inductiva consumida L1',NULL,NULL,NULL,NULL,NULL,NULL),(1269,'2022-07-07 16:50:22',306,188,464,NULL,'Energia reactiva inductiva consumida L2',NULL,NULL,NULL,NULL,NULL,NULL),(1270,'2022-07-07 16:50:23',306,188,465,NULL,'Energia reactiva inductiva consumida L3',NULL,NULL,NULL,NULL,NULL,NULL),(1271,'2022-07-07 16:50:23',306,188,466,NULL,'Energia reactiva inductiva consumida LIII',NULL,NULL,NULL,NULL,NULL,NULL),(1272,'2022-07-07 16:50:23',306,188,467,NULL,'Energia reactiva capacitiva consumida L1',NULL,NULL,NULL,NULL,NULL,NULL),(1273,'2022-07-07 16:50:23',306,188,468,NULL,'Energia reactiva capacitiva consumida L2',NULL,NULL,NULL,NULL,NULL,NULL),(1274,'2022-07-07 16:50:23',306,188,469,NULL,'Energia reactiva capacitiva consumida L3',NULL,NULL,NULL,NULL,NULL,NULL),(1275,'2022-07-07 16:50:23',306,188,470,NULL,'Energia reactiva capacitiva consumida LIII',NULL,NULL,NULL,NULL,NULL,NULL),(1276,'2022-07-07 16:50:23',306,188,471,NULL,'Energia reactiva consumida L1',NULL,NULL,NULL,NULL,NULL,NULL),(1277,'2022-07-07 16:50:23',306,188,472,NULL,'Energia reactiva consumida L2',NULL,NULL,NULL,NULL,NULL,NULL),(1278,'2022-07-07 16:50:23',306,188,473,NULL,'Energia reactiva consumida L3',NULL,NULL,NULL,NULL,NULL,NULL),(1279,'2022-07-07 16:50:23',306,188,474,NULL,'Energia reactiva consumida LIII',NULL,NULL,NULL,NULL,NULL,NULL),(1280,'2022-07-07 16:50:23',306,188,475,NULL,'Energia aparente consumida L1',NULL,NULL,NULL,NULL,NULL,NULL),(1281,'2022-07-07 16:50:23',306,188,476,NULL,'Energia aparente consumida L2',NULL,NULL,NULL,NULL,NULL,NULL),(1282,'2022-07-07 16:50:23',306,188,477,NULL,'Energia aparente consumida L3',NULL,NULL,NULL,NULL,NULL,NULL),(1283,'2022-07-07 16:50:23',306,188,478,NULL,'Energia aparente consumida LIII',NULL,NULL,NULL,NULL,NULL,NULL),(1284,'2022-07-07 17:22:46',307,189,0,NULL,'Codigo de tipo de dispositivo','8000','trb1',NULL,NULL,NULL,NULL),(1285,'2022-07-07 17:22:46',307,189,1,NULL,'Numero protocolo','8001','trb1',NULL,NULL,NULL,NULL),(1286,'2022-07-07 17:22:47',307,189,2,NULL,'Version del protocolo de comunicacion','8003','trb1',NULL,NULL,NULL,NULL),(1287,'2022-07-07 17:22:47',307,189,3,NULL,'Total dispositivos conectados','8005','trb1',NULL,NULL,NULL,NULL),(1288,'2022-07-07 17:22:47',307,189,4,NULL,'Total dispositivos defectuosos','8006','trb1',NULL,NULL,NULL,NULL),(1289,'2022-07-07 17:22:47',307,189,5,NULL,'Reserved','8015','trb1',NULL,NULL,NULL,NULL),(1290,'2022-07-07 17:22:47',307,189,6,NULL,'Reserved','8017','trb1',NULL,NULL,NULL,NULL),(1291,'2022-07-07 17:22:47',307,189,7,NULL,'Estado de entrada digital','8021','trb1',NULL,NULL,NULL,NULL),(1292,'2022-07-07 17:22:47',307,189,8,NULL,'Reserved','8023','trb1',NULL,NULL,NULL,NULL),(1293,'2022-07-07 17:22:47',307,189,9,NULL,'Reserved','8025','trb1',NULL,NULL,NULL,NULL),(1294,'2022-07-07 17:22:47',307,189,10,NULL,'ADC1 voltaje','8029','trb1',NULL,NULL,NULL,NULL),(1295,'2022-07-07 17:22:47',307,189,11,NULL,'ADC1 corriente','8030','trb1',NULL,NULL,NULL,NULL),(1296,'2022-07-07 17:22:47',307,189,12,NULL,'ADC2 voltaje','8031','trb1',NULL,NULL,NULL,NULL),(1297,'2022-07-07 17:22:48',307,189,13,NULL,'ADC2 corriente','8032','trb1',NULL,NULL,NULL,NULL),(1298,'2022-07-07 17:22:48',307,189,14,NULL,'ADC3 voltaje','8033','trb1',NULL,NULL,NULL,NULL),(1299,'2022-07-07 17:22:48',307,189,15,NULL,'ADC4 voltaje','8034','trb1',NULL,NULL,NULL,NULL),(1300,'2022-07-07 17:22:49',307,189,16,NULL,'ADC3 corriente','8035','trb1',NULL,NULL,NULL,NULL),(1301,'2022-07-07 17:22:49',307,189,17,NULL,'ADC4 corriente','8036','trb1',NULL,NULL,NULL,NULL),(1302,'2022-07-07 17:22:49',307,189,18,NULL,'Reserved','8037','trb1',NULL,NULL,NULL,NULL),(1303,'2022-07-07 17:22:49',307,189,19,NULL,'Máx. potencia activa nominal total','8058','trb1',NULL,NULL,NULL,NULL),(1304,'2022-07-07 17:22:49',307,189,20,NULL,'Min. potencia activa nominal total','8059','trb1',NULL,NULL,NULL,NULL),(1305,'2022-07-07 17:22:49',307,189,21,NULL,'Máx. potencia reactiva nominal total','8060','trb1',NULL,NULL,NULL,NULL),(1306,'2022-07-07 17:22:49',307,189,22,NULL,'Min. potencia reactiva nominal total','8061','trb1',NULL,NULL,NULL,NULL),(1307,'2022-07-07 17:22:49',307,189,23,NULL,'Potencia activa total preestablecida del inversor','8066','trb1',NULL,NULL,NULL,NULL),(1308,'2022-07-07 17:22:49',307,189,24,NULL,'Potencia reactiva total preestablecida del inversor','8067','trb1',NULL,NULL,NULL,NULL),(1309,'2022-07-07 17:22:50',307,189,25,NULL,'Estado On/Off del registrador','8068','trb1',NULL,NULL,NULL,NULL),(1310,'2022-07-07 17:22:50',307,189,26,NULL,'Estado de desbloqueo del registrador','8069','trb1',NULL,NULL,NULL,NULL),(1311,'2022-07-07 17:22:50',307,189,27,NULL,'Potencia activa total','8070','trb1',NULL,NULL,NULL,NULL),(1312,'2022-07-07 17:22:50',307,189,28,NULL,'Rendimiento diario','8074','trb1',NULL,NULL,NULL,NULL),(1313,'2022-07-07 17:22:50',307,189,29,NULL,'Potencia reactiva total','8076','trb1',NULL,NULL,NULL,NULL),(1314,'2022-07-07 17:22:50',307,189,30,NULL,'Rendimiento total','8080','trb1',NULL,NULL,NULL,NULL),(1315,'2022-07-07 17:22:50',307,189,31,NULL,'Min. energia activa regulable','8084','trb1',NULL,NULL,NULL,NULL),(1316,'2022-07-07 17:22:50',307,189,32,NULL,'Max. energia activa regulable','8086','trb1',NULL,NULL,NULL,NULL),(1317,'2022-07-07 17:22:50',307,189,33,NULL,'Min. energia reactiva regulable','8088','trb1',NULL,NULL,NULL,NULL),(1318,'2022-07-07 17:22:50',307,189,34,NULL,'Max. energia reactiva regulable','8090','trb1',NULL,NULL,NULL,NULL),(1319,'2022-07-07 17:22:51',307,189,35,NULL,'Potencia activa nominal','8092','trb1',NULL,NULL,NULL,NULL),(1320,'2022-07-07 17:22:51',307,189,36,NULL,'Potencia reactiva nominal','8094','trb1',NULL,NULL,NULL,NULL),(1321,'2022-07-07 17:22:52',307,189,37,NULL,'Dispositivos conectados a la red','8096','trb1',NULL,NULL,NULL,NULL),(1322,'2022-07-07 17:22:52',307,189,38,NULL,'Dispositivos fuera de red','8097','trb1',NULL,NULL,NULL,NULL),(1323,'2022-07-07 17:22:52',307,189,39,NULL,'Rendimiento mensual de la matriz','8098','trb1',NULL,NULL,NULL,NULL),(1324,'2022-07-07 17:22:52',307,189,40,NULL,'Rendimiento anual de la matriz','8102','trb1',NULL,NULL,NULL,NULL),(1325,'2022-07-07 17:22:52',307,189,41,NULL,'Potencia aparente de la matriz','8106','trb1',NULL,NULL,NULL,NULL),(1326,'2022-07-10 13:58:52',308,NULL,42,NULL,'On/off del inversor de la sub-matriz','8002','trb1',NULL,NULL,NULL,NULL),(1327,'2022-07-10 13:58:52',308,NULL,43,NULL,'Establecer la potencia activa del inversor de la submatriz','8003','trb1',NULL,NULL,NULL,NULL),(1328,'2022-07-10 13:58:52',308,NULL,44,NULL,'Establecer la relacion de la potencia activa del inversor de la submatriz','8005','trb1',NULL,NULL,NULL,NULL),(1329,'2022-07-10 13:58:52',308,NULL,45,NULL,'Establecer la potencia reactiva del inversor de la submatriz','8007','trb1',NULL,NULL,NULL,NULL),(1330,'2022-07-10 13:58:52',308,NULL,46,NULL,'Establecer la relacion de la potencia reactiva del inversor de la submatriz','8009','trb1',NULL,NULL,NULL,NULL),(1331,'2022-07-10 13:58:52',308,NULL,47,NULL,'Establecer el factor de potencia del inversor de la submatriz','8011','trb1',NULL,NULL,NULL,NULL),(1332,'2022-07-11 21:31:45',310,191,0,'analogica',NULL,NULL,NULL,'','','Clima','sonda temperatura comedor'),(1333,'2022-09-08 17:11:37',311,365,0,'digital',NULL,NULL,NULL,'','','alumbrado','Estado Focos techo Gimnasio'),(1334,'2022-09-08 17:11:46',311,365,1,'digital',NULL,NULL,NULL,'','','alumbrado','Estado Led techo Gimnasio'),(1335,'2022-09-08 17:12:25',311,365,2,'digital',NULL,NULL,NULL,'','','clima','Estado Valvula 3 vias Fancoil'),(1336,'2022-09-08 17:12:47',311,365,3,'digital',NULL,NULL,NULL,'','','clima','Estado Velocidad I Fancoil'),(1337,'2022-09-08 17:12:55',311,365,4,'digital',NULL,NULL,NULL,'','','clima','Estado Velocidad II Fancoil'),(1338,'2022-09-08 17:13:02',311,365,5,'digital',NULL,NULL,NULL,'','','clima','Estado Velocidad III Fancoil'),(1339,'2022-09-08 17:13:15',311,365,6,'digital',NULL,NULL,NULL,'','','iot','Estado Enchufe TV Gimansio'),(1340,'2022-07-12 00:53:50',311,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1341,'2022-07-12 00:53:51',311,NULL,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1342,'2022-07-12 00:53:51',311,NULL,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1343,'2022-07-12 00:53:51',311,NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1344,'2022-07-12 00:53:51',311,NULL,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1345,'2022-07-12 00:53:52',311,NULL,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1346,'2022-07-12 00:53:52',311,NULL,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1347,'2022-07-12 00:53:52',311,NULL,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1348,'2022-07-12 00:53:52',311,NULL,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1349,'2022-09-07 05:10:55',314,352,0,'digital',NULL,NULL,NULL,'','','alumbrado','Estado Focos techo Vestibulo Piscina Interior'),(1350,'2022-09-07 05:11:06',314,352,1,'digital',NULL,NULL,NULL,'','','alumbrado','Estado Focos techo Baño 1 Piscina Interior'),(1351,'2022-09-07 05:11:17',314,352,2,'digital',NULL,NULL,NULL,'','','alumbrado','Estado Led Espejo Baño 1 Piscina Interior'),(1352,'2022-09-07 05:11:31',314,352,3,'digital',NULL,NULL,NULL,'','','alumbrado','Estado Focos techo Baño 2 Piscina Interior'),(1353,'2022-09-07 05:12:04',314,352,4,'digital',NULL,NULL,NULL,'','','alumbrado','Estado Led perimetro techo Piscina Interior'),(1354,'2022-09-07 05:12:17',314,352,5,'digital',NULL,NULL,NULL,'','','alumbrado','Estado Led hamacas interiores Piscina interior'),(1355,'2022-09-07 05:13:07',314,353,6,'digital',NULL,NULL,NULL,'','','clima','Estado Valvula 3 vias Fancoil'),(1356,'2022-09-07 05:13:18',314,353,7,'digital',NULL,NULL,NULL,'','','clima','Estado Velocidad I Fancoil'),(1357,'2022-09-07 05:13:28',314,353,8,'digital',NULL,NULL,NULL,'','','clima','Estado Velocidad II Fancoil'),(1358,'2022-09-07 05:13:40',314,353,9,'digital',NULL,NULL,NULL,'','','clima','Estado Velocidad III Fancoil'),(1359,'2022-09-07 05:12:48',314,352,10,'digital',NULL,NULL,NULL,'','','iot','Estado Enchufe zona hamacas'),(1360,'2022-09-07 05:12:30',314,352,11,'digital',NULL,NULL,NULL,'','','alumbrado','Estado Led espejo baño2 piscina interior'),(1361,'2022-07-12 00:55:13',314,NULL,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1362,'2022-07-12 00:55:13',314,NULL,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1363,'2022-07-12 00:55:13',314,NULL,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1364,'2022-07-12 00:55:13',314,NULL,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1365,'2022-07-12 15:02:33',319,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1366,'2022-07-12 15:02:33',319,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1367,'2022-07-12 15:02:33',319,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1368,'2022-07-12 18:07:02',319,192,3,'digital','Integridad',NULL,NULL,'','','','alumbrado focos techo vstibulo h estudio'),(1369,'2022-07-12 15:02:33',319,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1370,'2022-07-12 15:02:39',320,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1371,'2022-07-12 15:02:39',320,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1372,'2022-07-12 15:02:39',320,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1373,'2022-07-12 18:07:15',320,193,3,'digital','Integridad',NULL,NULL,'','','','Alumbrado escalera caracol oeste'),(1374,'2022-07-12 15:02:40',320,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1375,'2022-07-13 04:17:11',321,194,0,'digital',NULL,NULL,NULL,'','','Alumbrado','Led Estudio'),(1376,'2022-07-13 04:17:28',321,194,1,'digital',NULL,NULL,NULL,'','','Alumbrado','Led Chimenea estudio'),(1377,'2022-07-13 04:17:36',321,194,2,'digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo Estudio'),(1378,'2022-07-13 04:17:47',321,194,3,'digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo Chimenea estudio'),(1379,'2022-07-13 04:17:58',321,194,4,'digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo Sala Pecera'),(1380,'2022-07-13 04:18:08',321,194,5,'digital',NULL,NULL,NULL,'','','Alumbrado','Focos Escalera caracol este'),(1381,'2022-07-13 04:25:04',324,196,6,'digital',NULL,NULL,NULL,'','','Clima','Estado del funcionamiento manual estudio (Pulsador)'),(1382,'2022-07-13 04:19:02',321,195,7,'digital',NULL,NULL,NULL,'','','Alumbrado','Estado del Piloto de accionamiento manual Estudio (Bombilla)'),(1383,'2022-07-13 04:25:29',324,196,8,'digital',NULL,NULL,NULL,'','','Clima','Estudio del Piloto de accionamiento manual Pecera (Pulsador)'),(1384,'2022-07-12 18:08:53',321,195,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1385,'2022-07-12 18:08:53',321,NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1386,'2022-07-12 18:08:53',321,NULL,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1387,'2022-07-12 18:08:54',321,NULL,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1388,'2022-07-12 18:08:55',321,NULL,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1389,'2022-07-12 18:08:56',321,NULL,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1390,'2022-07-12 18:08:56',321,NULL,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1391,'2022-07-13 04:28:20',325,197,0,'analogica',NULL,NULL,NULL,'','','Clima','Sonda pecera'),(1392,'2022-07-13 04:39:50',332,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1393,'2022-07-13 04:39:50',332,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1394,'2022-07-13 04:39:50',332,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1395,'2022-07-13 04:41:51',332,198,3,'digital','Integridad',NULL,NULL,'','','Alumbrado','Led Estudio'),(1396,'2022-07-13 04:39:50',332,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1397,'2022-07-13 04:39:54',333,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1398,'2022-07-13 04:39:54',333,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1399,'2022-07-13 04:39:54',333,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1400,'2022-07-13 04:42:06',333,199,3,'digital','Integridad',NULL,NULL,'','','Alumbrado','Led Chimenea Estudio'),(1401,'2022-07-13 04:39:55',333,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1402,'2022-07-13 04:40:04',334,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1403,'2022-07-13 04:40:04',334,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1404,'2022-07-13 04:40:04',334,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1405,'2022-07-13 04:42:14',334,200,3,'digital','Integridad',NULL,NULL,'','','Alumbrado','Focos techo estudio'),(1406,'2022-07-13 04:40:05',334,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1407,'2022-07-13 04:40:14',335,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1408,'2022-07-13 04:40:14',335,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1409,'2022-07-13 04:40:14',335,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1410,'2022-07-13 04:42:26',335,201,3,'digital','Integridad',NULL,NULL,'','','Alumbrado','Focos techo chimenea estudio'),(1411,'2022-07-13 04:40:14',335,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1412,'2022-07-13 04:40:18',336,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1413,'2022-07-13 04:40:18',336,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1414,'2022-07-13 04:40:18',336,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1415,'2022-07-13 04:42:34',336,202,3,'digital','Integridad',NULL,NULL,'','','Alumbrado','Focos techo sala pecera'),(1416,'2022-07-13 04:40:18',336,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1417,'2022-07-13 04:40:22',337,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1418,'2022-07-13 04:40:22',337,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1419,'2022-07-13 04:40:22',337,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1420,'2022-07-13 04:42:43',337,203,3,'digital','Integridad',NULL,NULL,'','','Alumbrado','Focos techo escalera caracol este'),(1421,'2022-07-13 04:40:22',337,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1422,'2022-08-18 09:09:32',339,204,0,'digital',NULL,NULL,NULL,'','','bomba','estado bomba fuente entrada principal'),(1423,'2022-08-18 09:09:45',339,204,1,'digital',NULL,NULL,NULL,'','','bomba','estado bomba depuracion fuente entrada principal'),(1424,'2022-08-18 09:09:59',339,204,2,'digital',NULL,NULL,NULL,'','','bomba','estado bomba algicida fuente entrada principal'),(1425,'2022-08-18 09:10:30',339,204,3,'digital',NULL,NULL,NULL,'','','alumbrado','estado alumbrado fuente entrada principal'),(1426,'2022-08-18 09:10:55',339,204,4,'digital',NULL,NULL,NULL,'','','bomba','estado nivel recambio fuente entrada principal'),(1427,'2022-08-18 08:04:44',339,204,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1428,'2022-08-18 08:04:45',339,204,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1429,'2022-08-18 08:04:45',339,204,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1430,'2022-08-18 09:35:27',341,205,0,'digital',NULL,NULL,NULL,'','','bomba','estado bomba fuente interior planta baja'),(1431,'2022-08-18 09:35:40',341,205,1,'digital',NULL,NULL,NULL,'','','bomba','estado bomba depuración fuente interior planta baja'),(1432,'2022-08-18 09:35:55',341,205,2,'digital',NULL,NULL,NULL,'','','bomba','estado bomba algicida fuente interior planta baja'),(1433,'2022-08-18 09:36:12',341,205,3,'digital',NULL,NULL,NULL,'','','alumbrado','estado alumbrado fuente interior planta baja'),(1434,'2022-08-18 09:40:57',341,205,4,'digital',NULL,NULL,NULL,'','','bomba','estado nivel algicida fuente interior planta baja'),(1435,'2022-08-18 08:05:27',341,205,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1436,'2022-08-18 08:05:27',341,205,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1437,'2022-08-18 08:05:27',341,205,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1438,'2022-08-18 10:10:57',343,206,0,'digital',NULL,NULL,NULL,'','','bomba','estado bomba fuente terraza sala cine'),(1439,'2022-08-18 10:11:10',343,206,1,'digital',NULL,NULL,NULL,'','','bomba','estado bomba depuracion bomba fuente terraza sala cine'),(1440,'2022-08-18 10:11:32',343,206,2,'digital',NULL,NULL,NULL,'','','bomba','estado bomba algicida bomba fuente terraza sala cine'),(1441,'2022-08-18 10:11:47',343,206,3,'digital',NULL,NULL,NULL,'','','alumbrado','estado alumbrado bomba fuente terraza sala cine'),(1442,'2022-08-18 10:12:18',343,206,4,'digital',NULL,NULL,NULL,'','','bomba','estado nivel recambio algicida bomba fuente terraza sala cine'),(1443,'2022-08-18 08:22:27',343,206,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1444,'2022-08-18 08:22:27',343,206,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1445,'2022-08-18 08:22:27',343,206,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1446,'2022-08-18 10:21:16',345,207,0,'digital',NULL,NULL,NULL,'','','bomba','estado bomba chorros lago jardin'),(1447,'2022-08-18 10:21:26',345,207,1,'digital',NULL,NULL,NULL,'','','bomba','estado bomba cascada lago jardin'),(1448,'2022-08-18 10:21:38',345,207,2,'digital',NULL,NULL,NULL,'','','bomba','estado bomba depuracion lago jardin'),(1449,'2022-08-18 10:21:50',345,207,3,'digital',NULL,NULL,NULL,'','','bomba','estado bomba algicida lago jardin'),(1450,'2022-08-18 10:22:08',345,207,4,'digital',NULL,NULL,NULL,'','','alumbrado','estado alumbrado lago jardin'),(1451,'2022-08-18 10:22:24',345,207,5,'digital',NULL,NULL,NULL,'','','estado nivel recambio algicida','estado alumbrado lago jardin'),(1452,'2022-08-18 08:22:50',345,207,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1453,'2022-08-18 08:22:50',345,207,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1454,'2022-08-25 11:46:59',346,NULL,0,NULL,'Valor control posicion',NULL,NULL,NULL,NULL,NULL,NULL),(1455,'2022-08-29 11:23:40',346,208,1,'analogica','Nivel',NULL,NULL,'','','','nivel'),(1456,'2022-08-29 17:54:13',348,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1457,'2022-08-29 17:54:17',348,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1458,'2022-08-29 17:54:19',348,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1459,'2022-08-29 17:54:20',348,209,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1460,'2022-08-29 17:54:25',348,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1461,'2022-08-29 18:04:33',349,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1462,'2022-08-29 18:04:33',349,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1463,'2022-08-29 18:04:33',349,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1464,'2022-08-29 18:04:33',349,210,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1465,'2022-08-29 18:04:33',349,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1466,'2022-08-29 18:06:09',350,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1467,'2022-08-29 18:06:09',350,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1468,'2022-08-29 18:06:09',350,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1469,'2022-08-29 18:06:10',350,211,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1470,'2022-08-29 18:06:10',350,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1471,'2022-08-29 18:06:19',351,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1472,'2022-08-29 18:06:19',351,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1473,'2022-08-29 18:06:19',351,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1474,'2022-08-29 18:06:19',351,212,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1475,'2022-08-29 18:06:19',351,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1476,'2022-08-29 18:06:25',352,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1477,'2022-08-29 18:06:25',352,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1478,'2022-08-29 18:06:25',352,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1479,'2022-08-29 18:06:25',352,213,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1480,'2022-08-29 18:06:25',352,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1481,'2022-08-29 18:09:28',353,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1482,'2022-08-29 18:09:29',353,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1483,'2022-08-29 18:09:29',353,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1484,'2022-08-29 18:09:30',353,214,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1485,'2022-08-29 18:09:31',353,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1486,'2022-08-29 18:09:43',354,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1487,'2022-08-29 18:09:43',354,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1488,'2022-08-29 18:09:44',354,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1489,'2022-08-29 18:09:44',354,215,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1490,'2022-08-29 18:09:45',354,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1491,'2022-08-29 18:09:52',355,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1492,'2022-08-29 18:09:52',355,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1493,'2022-08-29 18:09:53',355,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1494,'2022-08-29 18:09:54',355,216,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1495,'2022-08-29 18:09:54',355,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1496,'2022-08-29 18:10:04',356,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1497,'2022-08-29 18:10:04',356,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1498,'2022-08-29 18:10:05',356,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1499,'2022-08-29 18:10:05',356,217,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1500,'2022-08-29 18:10:05',356,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1501,'2022-08-29 18:10:15',357,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1502,'2022-08-29 18:10:15',357,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1503,'2022-08-29 18:10:15',357,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1504,'2022-08-29 18:10:16',357,218,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1505,'2022-08-29 18:10:16',357,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1506,'2022-08-29 18:10:24',358,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1507,'2022-08-29 18:10:24',358,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1508,'2022-08-29 18:10:25',358,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1509,'2022-08-29 18:10:25',358,219,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1510,'2022-08-29 18:10:25',358,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1511,'2022-08-29 18:12:57',359,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1512,'2022-08-29 18:12:57',359,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1513,'2022-08-29 18:12:57',359,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1514,'2022-08-29 18:12:57',359,220,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1515,'2022-08-29 18:12:57',359,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1516,'2022-08-29 18:13:14',360,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1517,'2022-08-29 18:13:14',360,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1518,'2022-08-29 18:13:14',360,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1519,'2022-08-29 18:13:14',360,221,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1520,'2022-08-29 18:13:15',360,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1521,'2022-08-29 18:13:23',361,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1522,'2022-08-29 18:13:23',361,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1523,'2022-08-29 18:13:23',361,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1524,'2022-08-29 18:13:23',361,222,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1525,'2022-08-29 18:13:23',361,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1526,'2022-08-29 18:14:13',362,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1527,'2022-08-29 18:14:13',362,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1528,'2022-08-29 18:14:13',362,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1529,'2022-08-29 18:14:14',362,223,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1530,'2022-08-29 18:14:14',362,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1531,'2022-08-29 18:14:26',363,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1532,'2022-08-29 18:14:26',363,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1533,'2022-08-29 18:14:26',363,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1534,'2022-08-29 18:14:26',363,224,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1535,'2022-08-29 18:14:27',363,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1536,'2022-08-29 18:14:31',364,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1537,'2022-08-29 18:14:31',364,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1538,'2022-08-29 18:14:31',364,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1539,'2022-08-29 18:14:31',364,225,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1540,'2022-08-29 18:14:31',364,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1541,'2022-08-29 18:14:36',365,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1542,'2022-08-29 18:14:36',365,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1543,'2022-08-29 18:14:36',365,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1544,'2022-08-29 18:14:36',365,226,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1545,'2022-08-29 18:14:37',365,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1546,'2022-08-29 18:14:43',366,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1547,'2022-08-29 18:14:43',366,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1548,'2022-08-29 18:14:43',366,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1549,'2022-08-29 18:14:43',366,227,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1550,'2022-08-29 18:14:43',366,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1551,'2022-08-29 18:24:55',367,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1552,'2022-08-29 18:24:55',367,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1553,'2022-08-29 18:24:55',367,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1554,'2022-08-29 18:24:55',367,228,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1555,'2022-08-29 18:24:55',367,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1556,'2022-08-29 18:25:19',368,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1557,'2022-08-29 18:25:19',368,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1558,'2022-08-29 18:25:19',368,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1559,'2022-08-29 18:25:19',368,229,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1560,'2022-08-29 18:25:20',368,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1561,'2022-08-29 18:25:26',369,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1562,'2022-08-29 18:25:26',369,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1563,'2022-08-29 18:25:26',369,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1564,'2022-08-29 18:25:26',369,230,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1565,'2022-08-29 18:25:26',369,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1566,'2022-08-29 18:25:33',370,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1567,'2022-08-29 18:25:33',370,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1568,'2022-08-29 18:25:33',370,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1569,'2022-08-29 18:25:33',370,231,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1570,'2022-08-29 18:25:33',370,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1571,'2022-08-29 18:25:37',371,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1572,'2022-08-29 18:25:37',371,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1573,'2022-08-29 18:25:37',371,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1574,'2022-08-29 18:25:37',371,232,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1575,'2022-08-29 18:25:37',371,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1576,'2022-08-29 18:37:42',372,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1577,'2022-08-29 18:37:42',372,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1578,'2022-08-29 18:37:43',372,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1579,'2022-08-29 18:37:43',372,233,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1580,'2022-08-29 18:37:43',372,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1581,'2022-08-29 18:37:48',373,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1582,'2022-08-29 18:37:48',373,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1583,'2022-08-29 18:37:48',373,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1584,'2022-08-29 18:37:49',373,234,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1585,'2022-08-29 18:37:49',373,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1586,'2022-08-29 18:37:55',374,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1587,'2022-08-29 18:37:55',374,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1588,'2022-08-29 18:37:56',374,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1589,'2022-08-29 18:37:56',374,235,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1590,'2022-08-29 18:37:58',374,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1591,'2022-08-29 18:38:05',375,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1592,'2022-08-29 18:38:05',375,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1593,'2022-08-29 18:38:05',375,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1594,'2022-08-29 18:38:06',375,236,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1595,'2022-08-29 18:38:06',375,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1596,'2022-08-29 18:38:09',376,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1597,'2022-08-29 18:38:09',376,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1598,'2022-08-29 18:38:09',376,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1599,'2022-08-29 18:38:09',376,237,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1600,'2022-08-29 18:38:10',376,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1601,'2022-08-29 18:38:13',377,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1602,'2022-08-29 18:38:13',377,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1603,'2022-08-29 18:38:13',377,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1604,'2022-08-29 18:38:13',377,238,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1605,'2022-08-29 18:38:13',377,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1606,'2022-08-29 18:38:18',378,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1607,'2022-08-29 18:38:18',378,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1608,'2022-08-29 18:38:19',378,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1609,'2022-08-29 18:38:19',378,239,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1610,'2022-08-29 18:38:19',378,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1611,'2022-08-29 18:38:23',379,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1612,'2022-08-29 18:38:24',379,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1613,'2022-08-29 18:38:24',379,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1614,'2022-08-29 18:38:24',379,240,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1615,'2022-08-29 18:38:24',379,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1616,'2022-08-29 18:38:29',380,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1617,'2022-08-29 18:38:29',380,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1618,'2022-08-29 18:38:29',380,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1619,'2022-08-29 18:38:29',380,241,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1620,'2022-08-29 18:38:29',380,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1621,'2022-08-29 18:38:37',381,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1622,'2022-08-29 18:38:37',381,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1623,'2022-08-29 18:38:37',381,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1624,'2022-08-29 18:38:37',381,242,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1625,'2022-08-29 18:38:37',381,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1626,'2022-08-29 18:39:22',382,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1627,'2022-08-29 18:39:23',382,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1628,'2022-08-29 18:39:23',382,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1629,'2022-08-29 18:39:23',382,243,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1630,'2022-08-29 18:39:23',382,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1631,'2022-08-29 18:39:27',383,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1632,'2022-08-29 18:39:27',383,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1633,'2022-08-29 18:39:27',383,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1634,'2022-08-29 18:39:27',383,244,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1635,'2022-08-29 18:39:27',383,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1636,'2022-08-29 18:39:31',384,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1637,'2022-08-29 18:39:31',384,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1638,'2022-08-29 18:39:31',384,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1639,'2022-08-29 18:39:31',384,245,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1640,'2022-08-29 18:39:31',384,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1641,'2022-08-29 18:39:35',385,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1642,'2022-08-29 18:39:35',385,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1643,'2022-08-29 18:39:35',385,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1644,'2022-08-29 18:39:35',385,246,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1645,'2022-08-29 18:39:35',385,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1646,'2022-08-29 18:39:39',386,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1647,'2022-08-29 18:39:39',386,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1648,'2022-08-29 18:39:39',386,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1649,'2022-08-29 18:39:39',386,247,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1650,'2022-08-29 18:39:39',386,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1651,'2022-08-29 18:39:43',387,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1652,'2022-08-29 18:39:43',387,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1653,'2022-08-29 18:39:44',387,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1654,'2022-08-29 18:39:44',387,248,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1655,'2022-08-29 18:39:44',387,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1656,'2022-08-29 18:39:48',388,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1657,'2022-08-29 18:39:48',388,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1658,'2022-08-29 18:39:48',388,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1659,'2022-08-29 18:39:48',388,249,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1660,'2022-08-29 18:39:48',388,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1661,'2022-08-29 18:39:53',389,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1662,'2022-08-29 18:39:53',389,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1663,'2022-08-29 18:39:53',389,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1664,'2022-08-29 18:39:53',389,250,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1665,'2022-08-29 18:39:53',389,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1666,'2022-08-29 18:39:59',390,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1667,'2022-08-29 18:39:59',390,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1668,'2022-08-29 18:39:59',390,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1669,'2022-08-29 18:39:59',390,251,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1670,'2022-08-29 18:39:59',390,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1671,'2022-08-29 18:40:04',391,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1672,'2022-08-29 18:40:05',391,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1673,'2022-08-29 18:40:05',391,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1674,'2022-08-29 18:40:05',391,252,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1675,'2022-08-29 18:40:05',391,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1676,'2022-08-29 18:40:10',392,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1677,'2022-08-29 18:40:10',392,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1678,'2022-08-29 18:40:10',392,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1679,'2022-08-29 18:40:10',392,253,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1680,'2022-08-29 18:40:10',392,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1681,'2022-08-29 18:40:15',393,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1682,'2022-08-29 18:40:15',393,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1683,'2022-08-29 18:40:15',393,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1684,'2022-08-29 18:40:15',393,254,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1685,'2022-08-29 18:40:15',393,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1686,'2022-08-29 18:40:21',394,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1687,'2022-08-29 18:40:21',394,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1688,'2022-08-29 18:40:21',394,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1689,'2022-08-29 18:40:21',394,255,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1690,'2022-08-29 18:40:21',394,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1691,'2022-08-29 18:40:27',395,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1692,'2022-08-29 18:40:27',395,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1693,'2022-08-29 18:40:27',395,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1694,'2022-08-29 18:40:27',395,256,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1695,'2022-08-29 18:40:27',395,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1696,'2022-08-29 18:55:31',396,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1697,'2022-08-29 18:55:31',396,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1698,'2022-08-29 18:55:31',396,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1699,'2022-08-29 18:55:31',396,257,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1700,'2022-08-29 18:55:31',396,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1701,'2022-08-29 18:55:37',397,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1702,'2022-08-29 18:55:37',397,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1703,'2022-08-29 18:55:37',397,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1704,'2022-08-29 18:55:37',397,258,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1705,'2022-08-29 18:55:37',397,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1706,'2022-08-29 18:55:41',398,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1707,'2022-08-29 18:55:41',398,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1708,'2022-08-29 18:55:41',398,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1709,'2022-08-29 18:55:41',398,259,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1710,'2022-08-29 18:55:41',398,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1711,'2022-08-29 18:55:45',399,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1712,'2022-08-29 18:55:45',399,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1713,'2022-08-29 18:55:45',399,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1714,'2022-08-29 18:55:45',399,260,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1715,'2022-08-29 18:55:45',399,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1716,'2022-08-29 18:55:49',400,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1717,'2022-08-29 18:55:49',400,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1718,'2022-08-29 18:55:49',400,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1719,'2022-08-29 18:55:49',400,261,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1720,'2022-08-29 18:55:49',400,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1721,'2022-08-29 18:55:53',401,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1722,'2022-08-29 18:55:54',401,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1723,'2022-08-29 18:55:54',401,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1724,'2022-08-29 18:55:54',401,262,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1725,'2022-08-29 18:55:54',401,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1726,'2022-08-29 18:55:58',402,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1727,'2022-08-29 18:55:58',402,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1728,'2022-08-29 18:55:58',402,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1729,'2022-08-29 18:55:58',402,263,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1730,'2022-08-29 18:55:58',402,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1731,'2022-08-29 18:56:04',403,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1732,'2022-08-29 18:56:04',403,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1733,'2022-08-29 18:56:04',403,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1734,'2022-08-29 18:56:05',403,264,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1735,'2022-08-29 18:56:05',403,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1736,'2022-08-29 18:56:11',404,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1737,'2022-08-29 18:56:11',404,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1738,'2022-08-29 18:56:11',404,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1739,'2022-08-29 18:56:11',404,265,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1740,'2022-08-29 18:56:11',404,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1741,'2022-08-29 18:56:16',405,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1742,'2022-08-29 18:56:16',405,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1743,'2022-08-29 18:56:16',405,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1744,'2022-08-29 18:56:16',405,266,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1745,'2022-08-29 18:56:16',405,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1746,'2022-08-29 18:56:27',406,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1747,'2022-08-29 18:56:27',406,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1748,'2022-08-29 18:56:27',406,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1749,'2022-08-29 18:56:27',406,267,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1750,'2022-08-29 18:56:27',406,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1751,'2022-08-29 18:56:32',407,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1752,'2022-08-29 18:56:32',407,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1753,'2022-08-29 18:56:32',407,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1754,'2022-08-29 18:56:32',407,268,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1755,'2022-08-29 18:56:32',407,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1756,'2022-08-29 18:56:41',408,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1757,'2022-08-29 18:56:41',408,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1758,'2022-08-29 18:56:41',408,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1759,'2022-08-29 18:56:41',408,269,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1760,'2022-08-29 18:56:41',408,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1761,'2022-08-29 18:56:45',409,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1762,'2022-08-29 18:56:45',409,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1763,'2022-08-29 18:56:45',409,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1764,'2022-08-29 18:56:45',409,270,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1765,'2022-08-29 18:56:45',409,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1766,'2022-08-29 18:56:50',410,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1767,'2022-08-29 18:56:50',410,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1768,'2022-08-29 18:56:50',410,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1769,'2022-08-29 18:56:51',410,271,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1770,'2022-08-29 18:56:51',410,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1771,'2022-08-29 18:56:55',411,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1772,'2022-08-29 18:56:55',411,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1773,'2022-08-29 18:56:55',411,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1774,'2022-08-29 18:56:55',411,272,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1775,'2022-08-29 18:56:55',411,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1776,'2022-08-29 18:57:01',412,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1777,'2022-08-29 18:57:01',412,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1778,'2022-08-29 18:57:01',412,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1779,'2022-08-29 18:57:01',412,273,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1780,'2022-08-29 18:57:01',412,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1781,'2022-08-29 18:57:06',413,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1782,'2022-08-29 18:57:06',413,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1783,'2022-08-29 18:57:07',413,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1784,'2022-08-29 18:57:07',413,274,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1785,'2022-08-29 18:57:07',413,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1786,'2022-08-29 18:57:12',414,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1787,'2022-08-29 18:57:12',414,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1788,'2022-08-29 18:57:12',414,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1789,'2022-08-29 18:57:12',414,275,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1790,'2022-08-29 18:57:12',414,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1791,'2022-08-29 18:57:18',415,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1792,'2022-08-29 18:57:18',415,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1793,'2022-08-29 18:57:18',415,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1794,'2022-08-29 18:57:18',415,276,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1795,'2022-08-29 18:57:18',415,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1796,'2022-08-29 18:57:22',416,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1797,'2022-08-29 18:57:22',416,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1798,'2022-08-29 18:57:22',416,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1799,'2022-08-29 18:57:22',416,277,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1800,'2022-08-29 18:57:22',416,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1801,'2022-08-29 18:57:28',417,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1802,'2022-08-29 18:57:28',417,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1803,'2022-08-29 18:57:28',417,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1804,'2022-08-29 18:57:28',417,278,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1805,'2022-08-29 18:57:28',417,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1806,'2022-08-29 18:57:34',418,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1807,'2022-08-29 18:57:34',418,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1808,'2022-08-29 18:57:34',418,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1809,'2022-08-29 18:57:34',418,279,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1810,'2022-08-29 18:57:34',418,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1811,'2022-08-30 07:30:01',419,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1812,'2022-08-30 07:30:01',419,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1813,'2022-08-30 07:30:01',419,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1814,'2022-08-30 07:30:01',419,280,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1815,'2022-08-30 07:30:01',419,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1816,'2022-08-30 07:30:06',420,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1817,'2022-08-30 07:30:06',420,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1818,'2022-08-30 07:30:06',420,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1819,'2022-08-30 07:30:06',420,281,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1820,'2022-08-30 07:30:06',420,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1821,'2022-08-30 07:30:11',421,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1822,'2022-08-30 07:30:11',421,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1823,'2022-08-30 07:30:11',421,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1824,'2022-08-30 07:30:11',421,282,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1825,'2022-08-30 07:30:11',421,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1826,'2022-08-30 07:30:17',422,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1827,'2022-08-30 07:30:17',422,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1828,'2022-08-30 07:30:17',422,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1829,'2022-08-30 07:30:17',422,283,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1830,'2022-08-30 07:30:17',422,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1831,'2022-08-30 07:30:22',423,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1832,'2022-08-30 07:30:22',423,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1833,'2022-08-30 07:30:22',423,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1834,'2022-08-30 07:30:22',423,284,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1835,'2022-08-30 07:30:22',423,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1836,'2022-08-30 07:30:26',424,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1837,'2022-08-30 07:30:26',424,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1838,'2022-08-30 07:30:26',424,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1839,'2022-08-30 07:30:26',424,285,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1840,'2022-08-30 07:30:27',424,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1841,'2022-08-30 07:30:31',425,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1842,'2022-08-30 07:30:31',425,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1843,'2022-08-30 07:30:32',425,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1844,'2022-08-30 07:30:32',425,286,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1845,'2022-08-30 07:30:32',425,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1846,'2022-08-30 07:55:47',426,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1847,'2022-08-30 07:55:47',426,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1848,'2022-08-30 07:55:47',426,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1849,'2022-08-30 07:55:47',426,287,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1850,'2022-08-30 07:55:47',426,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1851,'2022-08-30 07:55:53',427,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1852,'2022-08-30 07:55:53',427,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1853,'2022-08-30 07:55:53',427,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1854,'2022-08-30 07:55:53',427,288,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1855,'2022-08-30 07:55:53',427,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1856,'2022-08-30 07:55:58',428,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1857,'2022-08-30 07:55:58',428,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1858,'2022-08-30 07:55:58',428,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1859,'2022-08-30 07:55:58',428,289,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1860,'2022-08-30 07:55:58',428,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1861,'2022-08-30 07:56:04',429,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1862,'2022-08-30 07:56:04',429,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1863,'2022-08-30 07:56:04',429,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1864,'2022-08-30 07:56:04',429,290,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1865,'2022-08-30 07:56:04',429,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1866,'2022-08-30 07:56:12',430,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1867,'2022-08-30 07:56:12',430,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1868,'2022-08-30 07:56:12',430,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1869,'2022-08-30 07:56:12',430,291,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1870,'2022-08-30 07:56:12',430,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1871,'2022-08-30 07:56:17',431,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1872,'2022-08-30 07:56:17',431,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1873,'2022-08-30 07:56:17',431,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1874,'2022-08-30 07:56:17',431,292,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1875,'2022-08-30 07:56:17',431,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1876,'2022-08-30 07:56:31',432,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1877,'2022-08-30 07:56:31',432,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1878,'2022-08-30 07:56:31',432,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1879,'2022-08-30 07:56:31',432,294,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1880,'2022-08-30 07:56:31',432,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1881,'2022-08-30 07:56:37',433,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1882,'2022-08-30 07:56:37',433,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1883,'2022-08-30 07:56:37',433,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1884,'2022-08-30 07:56:37',433,295,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1885,'2022-08-30 07:56:37',433,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1886,'2022-08-30 07:56:45',434,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1887,'2022-08-30 07:56:45',434,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1888,'2022-08-30 07:56:45',434,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1889,'2022-08-30 07:56:45',434,296,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1890,'2022-08-30 07:56:45',434,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1891,'2022-08-30 07:56:51',435,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1892,'2022-08-30 07:56:52',435,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1893,'2022-08-30 07:56:52',435,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1894,'2022-08-30 07:56:52',435,297,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1895,'2022-08-30 07:56:52',435,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1896,'2022-08-30 07:56:57',436,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1897,'2022-08-30 07:56:57',436,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1898,'2022-08-30 07:56:57',436,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1899,'2022-08-30 07:56:57',436,298,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1900,'2022-08-30 07:56:57',436,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1901,'2022-08-30 07:57:02',437,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1902,'2022-08-30 07:57:02',437,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1903,'2022-08-30 07:57:02',437,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1904,'2022-08-30 07:57:02',437,299,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1905,'2022-08-30 07:57:02',437,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1906,'2022-08-30 07:57:08',438,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1907,'2022-08-30 07:57:08',438,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1908,'2022-08-30 07:57:08',438,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1909,'2022-08-30 07:57:08',438,300,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1910,'2022-08-30 07:57:08',438,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1911,'2022-08-30 07:57:15',439,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1912,'2022-08-30 07:57:16',439,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1913,'2022-08-30 07:57:16',439,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1914,'2022-08-30 07:57:16',439,301,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1915,'2022-08-30 07:57:16',439,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1916,'2022-08-30 07:57:23',440,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1917,'2022-08-30 07:57:23',440,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1918,'2022-08-30 07:57:23',440,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1919,'2022-08-30 07:57:23',440,302,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1920,'2022-08-30 07:57:24',440,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1921,'2022-08-30 07:57:29',441,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1922,'2022-08-30 07:57:29',441,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1923,'2022-08-30 07:57:29',441,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1924,'2022-08-30 07:57:30',441,303,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1925,'2022-08-30 07:57:30',441,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1926,'2022-08-30 07:57:35',442,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1927,'2022-08-30 07:57:35',442,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1928,'2022-08-30 07:57:35',442,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1929,'2022-08-30 07:57:35',442,304,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1930,'2022-08-30 07:57:35',442,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1931,'2022-08-30 07:57:39',443,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1932,'2022-08-30 07:57:39',443,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1933,'2022-08-30 07:57:39',443,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1934,'2022-08-30 07:57:39',443,305,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1935,'2022-08-30 07:57:39',443,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1936,'2022-08-30 07:57:43',444,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1937,'2022-08-30 07:57:43',444,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1938,'2022-08-30 07:57:43',444,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1939,'2022-08-30 07:57:43',444,306,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1940,'2022-08-30 07:57:43',444,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1941,'2022-08-30 07:57:48',445,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1942,'2022-08-30 07:57:48',445,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1943,'2022-08-30 07:57:48',445,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1944,'2022-08-30 07:57:48',445,307,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1945,'2022-08-30 07:57:48',445,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1946,'2022-08-30 07:57:55',446,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1947,'2022-08-30 07:57:55',446,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1948,'2022-08-30 07:57:56',446,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1949,'2022-08-30 07:57:56',446,308,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1950,'2022-08-30 07:57:56',446,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1951,'2022-08-30 07:58:02',447,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1952,'2022-08-30 07:58:02',447,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1953,'2022-08-30 07:58:02',447,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1954,'2022-08-30 07:58:02',447,309,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1955,'2022-08-30 07:58:02',447,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1956,'2022-08-30 07:58:06',448,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1957,'2022-08-30 07:58:06',448,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1958,'2022-08-30 07:58:06',448,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1959,'2022-08-30 07:58:06',448,310,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1960,'2022-08-30 07:58:06',448,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1961,'2022-08-30 07:58:14',449,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1962,'2022-08-30 07:58:14',449,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1963,'2022-08-30 07:58:14',449,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1964,'2022-08-30 07:58:14',449,311,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1965,'2022-08-30 07:58:15',449,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1966,'2022-08-30 07:58:20',450,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1967,'2022-08-30 07:58:20',450,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1968,'2022-08-30 07:58:20',450,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1969,'2022-08-30 07:58:21',450,312,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1970,'2022-08-30 07:58:21',450,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1971,'2022-08-30 07:58:25',451,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1972,'2022-08-30 07:58:25',451,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1973,'2022-08-30 07:58:25',451,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1974,'2022-08-30 07:58:25',451,313,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1975,'2022-08-30 07:58:25',451,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1976,'2022-08-30 07:58:30',452,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1977,'2022-08-30 07:58:30',452,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1978,'2022-08-30 07:58:30',452,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1979,'2022-08-30 07:58:30',452,314,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1980,'2022-08-30 07:58:30',452,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1981,'2022-08-30 07:58:34',453,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1982,'2022-08-30 07:58:34',453,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1983,'2022-08-30 07:58:34',453,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1984,'2022-08-30 07:58:34',453,315,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1985,'2022-08-30 07:58:34',453,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1986,'2022-08-30 07:58:41',454,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1987,'2022-08-30 07:58:41',454,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1988,'2022-08-30 07:58:41',454,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1989,'2022-08-30 07:58:41',454,316,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1990,'2022-08-30 07:58:41',454,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1991,'2022-08-30 07:58:49',455,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1992,'2022-08-30 07:58:49',455,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1993,'2022-08-30 07:58:49',455,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1994,'2022-08-30 07:58:49',455,317,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(1995,'2022-08-30 07:58:49',455,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(1996,'2022-08-30 07:58:55',456,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(1997,'2022-08-30 07:58:55',456,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(1998,'2022-08-30 07:58:55',456,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(1999,'2022-08-30 07:58:55',456,318,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(2000,'2022-08-30 07:58:55',456,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(2001,'2022-08-30 08:36:31',457,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(2002,'2022-08-30 08:36:31',457,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(2003,'2022-08-30 08:36:31',457,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(2004,'2022-08-30 08:36:31',457,319,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(2005,'2022-08-30 08:36:31',457,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(2006,'2022-08-30 08:36:38',458,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(2007,'2022-08-30 08:36:38',458,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(2008,'2022-08-30 08:36:38',458,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(2009,'2022-08-30 08:36:38',458,320,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(2010,'2022-08-30 08:36:39',458,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(2011,'2022-08-30 08:36:44',459,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(2012,'2022-08-30 08:36:44',459,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(2013,'2022-08-30 08:36:44',459,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(2014,'2022-08-30 08:36:45',459,321,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(2015,'2022-08-30 08:36:45',459,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(2016,'2022-08-30 08:36:51',460,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(2017,'2022-08-30 08:36:51',460,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(2018,'2022-08-30 08:36:51',460,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(2019,'2022-08-30 08:36:51',460,322,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(2020,'2022-08-30 08:36:51',460,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(2021,'2022-08-30 08:36:55',461,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(2022,'2022-08-30 08:36:55',461,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(2023,'2022-08-30 08:36:55',461,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(2024,'2022-08-30 08:36:55',461,323,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(2025,'2022-08-30 08:36:55',461,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(2026,'2022-08-30 08:36:59',462,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(2027,'2022-08-30 08:36:59',462,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(2028,'2022-08-30 08:36:59',462,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(2029,'2022-08-30 08:36:59',462,324,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(2030,'2022-08-30 08:37:00',462,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(2031,'2022-08-30 08:37:04',463,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(2032,'2022-08-30 08:37:04',463,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(2033,'2022-08-30 08:37:04',463,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(2034,'2022-08-30 08:37:04',463,325,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(2035,'2022-08-30 08:37:04',463,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(2036,'2022-08-30 08:37:08',464,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(2037,'2022-08-30 08:37:08',464,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(2038,'2022-08-30 08:37:08',464,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(2039,'2022-08-30 08:37:08',464,326,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(2040,'2022-08-30 08:37:08',464,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(2041,'2022-08-30 08:37:12',465,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(2042,'2022-08-30 08:37:12',465,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(2043,'2022-08-30 08:37:12',465,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(2044,'2022-08-30 08:37:12',465,327,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(2045,'2022-08-30 08:37:12',465,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(2046,'2022-08-30 08:37:17',466,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(2047,'2022-08-30 08:37:17',466,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(2048,'2022-08-30 08:37:17',466,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(2049,'2022-08-30 08:37:17',466,328,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(2050,'2022-08-30 08:37:17',466,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(2051,'2022-08-30 08:37:22',467,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(2052,'2022-08-30 08:37:22',467,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(2053,'2022-08-30 08:37:22',467,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(2054,'2022-08-30 08:37:22',467,329,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(2055,'2022-08-30 08:37:22',467,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(2056,'2022-08-30 08:37:27',468,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(2057,'2022-08-30 08:37:27',468,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(2058,'2022-08-30 08:37:27',468,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(2059,'2022-08-30 08:37:27',468,330,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(2060,'2022-08-30 08:37:27',468,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(2061,'2022-08-30 08:37:34',469,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(2062,'2022-08-30 08:37:34',469,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(2063,'2022-08-30 08:37:34',469,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(2064,'2022-08-30 08:37:34',469,331,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(2065,'2022-08-30 08:37:34',469,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(2066,'2022-08-30 08:44:29',470,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(2067,'2022-08-30 08:44:29',470,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(2068,'2022-08-30 08:44:30',470,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(2069,'2022-08-30 08:44:30',470,332,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(2070,'2022-08-30 08:44:30',470,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(2071,'2022-08-30 08:44:33',471,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(2072,'2022-08-30 08:44:33',471,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(2073,'2022-08-30 08:44:33',471,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(2074,'2022-08-30 08:44:33',471,333,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(2075,'2022-08-30 08:44:33',471,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(2076,'2022-08-30 08:44:37',472,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(2077,'2022-08-30 08:44:37',472,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(2078,'2022-08-30 08:44:37',472,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(2079,'2022-08-30 08:44:37',472,334,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(2080,'2022-08-30 08:44:37',472,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(2081,'2022-08-30 08:44:41',473,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(2082,'2022-08-30 08:44:41',473,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(2083,'2022-08-30 08:44:41',473,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(2084,'2022-08-30 08:44:41',473,335,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(2085,'2022-08-30 08:44:41',473,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(2086,'2022-08-30 08:44:45',474,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(2087,'2022-08-30 08:44:46',474,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(2088,'2022-08-30 08:44:46',474,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(2089,'2022-08-30 08:44:46',474,336,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(2090,'2022-08-30 08:44:46',474,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(2091,'2022-08-30 08:44:50',475,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(2092,'2022-08-30 08:44:50',475,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(2093,'2022-08-30 08:44:50',475,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(2094,'2022-08-30 08:44:50',475,337,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(2095,'2022-08-30 08:44:50',475,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(2096,'2022-08-30 08:44:54',476,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(2097,'2022-08-30 08:44:54',476,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(2098,'2022-08-30 08:44:54',476,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(2099,'2022-08-30 08:44:54',476,338,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(2100,'2022-08-30 08:44:54',476,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(2101,'2022-08-30 08:44:58',477,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(2102,'2022-08-30 08:44:58',477,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(2103,'2022-08-30 08:44:58',477,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(2104,'2022-08-30 08:44:58',477,339,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(2105,'2022-08-30 08:44:58',477,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(2106,'2022-08-30 08:45:04',478,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(2107,'2022-08-30 08:45:04',478,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(2108,'2022-08-30 08:45:04',478,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(2109,'2022-08-30 08:45:04',478,340,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(2110,'2022-08-30 08:45:04',478,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(2111,'2022-08-30 08:45:09',479,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(2112,'2022-08-30 08:45:09',479,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(2113,'2022-08-30 08:45:09',479,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(2114,'2022-08-30 08:45:09',479,341,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(2115,'2022-08-30 08:45:09',479,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(2116,'2022-08-30 08:45:14',480,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(2117,'2022-08-30 08:45:14',480,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(2118,'2022-08-30 08:45:14',480,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(2119,'2022-08-30 08:45:14',480,342,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(2120,'2022-08-30 08:45:14',480,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(2121,'2022-08-30 08:45:18',481,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(2122,'2022-08-30 08:45:18',481,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(2123,'2022-08-30 08:45:18',481,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(2124,'2022-08-30 08:45:18',481,343,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(2125,'2022-08-30 08:45:18',481,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(2126,'2022-08-30 08:45:24',482,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(2127,'2022-08-30 08:45:24',482,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(2128,'2022-08-30 08:45:24',482,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(2129,'2022-08-30 08:45:25',482,344,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(2130,'2022-08-30 08:45:25',482,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(2131,'2022-08-30 08:45:28',483,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(2132,'2022-08-30 08:45:28',483,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(2133,'2022-08-30 08:45:28',483,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(2134,'2022-08-30 08:45:28',483,345,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(2135,'2022-08-30 08:45:28',483,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(2136,'2022-08-30 08:45:32',484,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(2137,'2022-08-30 08:45:32',484,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(2138,'2022-08-30 08:45:32',484,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(2139,'2022-08-30 08:45:32',484,346,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(2140,'2022-08-30 08:45:33',484,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(2141,'2022-08-30 08:50:38',485,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(2142,'2022-08-30 08:50:38',485,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(2143,'2022-08-30 08:50:38',485,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(2144,'2022-08-30 08:50:38',485,347,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(2145,'2022-08-30 08:50:38',485,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(2146,'2022-08-30 08:50:42',486,NULL,0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL),(2147,'2022-08-30 08:50:42',486,NULL,1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL),(2148,'2022-08-30 08:50:42',486,NULL,2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL),(2149,'2022-08-30 08:50:42',486,348,3,NULL,'Integridad',NULL,NULL,NULL,NULL,NULL,NULL),(2150,'2022-08-30 08:50:42',486,NULL,4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL),(2151,'2022-08-30 08:55:02',487,349,0,'analogica','Temperatura',NULL,'trb1','','','clima','tem hab alejandro'),(2152,'2022-08-30 08:55:17',487,349,1,'analogica','Humedad',NULL,'trb1','','','clima','humedad hab alejandro'),(2153,'2022-08-30 23:47:51',493,NULL,0,NULL,'Corriente de ionizacion','0','1',NULL,NULL,NULL,NULL),(2154,'2022-08-30 23:47:51',493,NULL,1,NULL,'Corriente de hidrolisis','1','2',NULL,NULL,NULL,NULL),(2155,'2022-08-30 23:49:16',493,350,2,'analogica','Nivel de PH','2','3','','','piscina','nivel ph'),(2156,'2022-08-30 23:49:25',493,350,3,'analogica','Nivel de Redox','3','3','','','piscina','nivel redox'),(2157,'2022-08-30 23:49:33',493,350,4,'analogica','Nivel de cloro','4','3','','','piscina','nivel cloro'),(2158,'2022-08-30 23:49:44',493,350,5,'analogica','Nivel de conductividad','5','3','','','piscina','nivel conductividad'),(2159,'2022-08-30 23:49:54',493,350,6,'analogica','Temperatura del agua','6','3','','','piscina','temperatura agua'),(2160,'2022-08-30 23:47:52',493,NULL,7,NULL,'ph Alarma','7','4',NULL,NULL,NULL,NULL),(2161,'2022-08-30 23:47:52',493,NULL,8,NULL,'Estado del control del chip de pH','7','4',NULL,NULL,NULL,NULL),(2162,'2022-08-30 23:47:52',493,NULL,9,NULL,'Relé de bomba de bajo pH activado','7','4',NULL,NULL,NULL,NULL),(2163,'2022-08-30 23:47:52',493,NULL,10,NULL,'Relé de bomba de alto pH activado','7','4',NULL,NULL,NULL,NULL),(2164,'2022-08-30 23:47:52',493,NULL,11,NULL,'Módulo de control de pH activo y bombas de control','7','4',NULL,NULL,NULL,NULL),(2165,'2022-08-30 23:47:52',493,NULL,12,NULL,'Módulo de medida de pH activo y de medida','7','4',NULL,NULL,NULL,NULL),(2166,'2022-08-30 23:47:52',493,NULL,13,NULL,'Medición del módulo de pH detectado','7','4',NULL,NULL,NULL,NULL),(2167,'2022-08-30 23:47:52',493,NULL,14,NULL,'Relé de la bomba Rx activada','8','5',NULL,NULL,NULL,NULL),(2168,'2022-08-30 23:47:53',493,NULL,15,NULL,'Redox-modulo activo y controlando la bomba','8','5',NULL,NULL,NULL,NULL),(2169,'2022-08-30 23:47:53',493,NULL,16,NULL,'Medición de módulo redox activo','8','5',NULL,NULL,NULL,NULL),(2170,'2022-08-30 23:47:53',493,NULL,17,NULL,'Medición del módulo redox detectado por el sistema','8','5',NULL,NULL,NULL,NULL),(2171,'2022-08-30 23:47:53',493,NULL,18,NULL,'Sensor de flujo de la sonda de cloro','9','6',NULL,NULL,NULL,NULL),(2172,'2022-08-30 23:47:53',493,NULL,19,NULL,'Relé de la bomba de cloro encendida','9','6',NULL,NULL,NULL,NULL),(2173,'2022-08-30 23:47:53',493,NULL,20,NULL,'Módulo de cloro activo y control de la bomba','9','6',NULL,NULL,NULL,NULL),(2174,'2022-08-30 23:47:53',493,NULL,21,NULL,'Medición de cloro-módulo activo','9','6',NULL,NULL,NULL,NULL),(2175,'2022-08-30 23:47:53',493,NULL,22,NULL,'Medición del módulo de cloro detectado por el sistema','9','6',NULL,NULL,NULL,NULL),(2176,'2022-08-30 23:47:53',493,NULL,23,NULL,'Relé de la bomba de conductividad encendida','10','7',NULL,NULL,NULL,NULL),(2177,'2022-08-30 23:47:53',493,NULL,24,NULL,'Conductividad del módulo activo y control de la bomba','10','7',NULL,NULL,NULL,NULL),(2178,'2022-08-30 23:47:53',493,NULL,25,NULL,'Medición de conductividad-módulo activo','10','7',NULL,NULL,NULL,NULL),(2179,'2022-08-30 23:47:53',493,NULL,26,NULL,'Medición del módulo de conductividad detectado por el sistema','10','7',NULL,NULL,NULL,NULL),(2180,'2022-08-30 23:47:53',493,NULL,27,NULL,'En el objetivo: el sistema alcanzó el punto de ajuste','11','8',NULL,NULL,NULL,NULL),(2181,'2022-08-30 23:47:53',493,NULL,28,NULL,'Bajo - La ionización no puede alcanzar el punto de ajuste','11','8',NULL,NULL,NULL,NULL),(2182,'2022-08-30 23:47:53',493,NULL,29,NULL,'Elec - Reservado','11','8',NULL,NULL,NULL,NULL),(2183,'2022-08-30 23:47:53',493,NULL,30,NULL,'Pr off - Tiempo excedido programado','11','8',NULL,NULL,NULL,NULL),(2184,'2022-08-30 23:47:53',493,NULL,31,NULL,'Ion Pol off - Tiempo muerto','11','8',NULL,NULL,NULL,NULL),(2185,'2022-08-30 23:47:53',493,NULL,32,NULL,'Ion Pol 1 - Ionización trabajando (Pol 1)','11','8',NULL,NULL,NULL,NULL),(2186,'2022-08-30 23:47:53',493,NULL,33,NULL,'Ion Pol 2 - Ionización trabajando (Pol 2)','11','8',NULL,NULL,NULL,NULL),(2187,'2022-08-30 23:47:53',493,NULL,34,NULL,'En el objetivo: el sistema alcanzó el punto de ajuste','12','9',NULL,NULL,NULL,NULL),(2188,'2022-08-30 23:47:53',493,NULL,35,NULL,'Bajo - La hidrólisis no puede alcanzar el punto de ajuste','12','9',NULL,NULL,NULL,NULL),(2189,'2022-08-30 23:47:54',493,NULL,36,NULL,'Elec - Reservado','12','9',NULL,NULL,NULL,NULL),(2190,'2022-08-30 23:47:54',493,NULL,37,NULL,'Flujo - Indicador de flujo en la cámara de hidrólisis (FL1)','12','9',NULL,NULL,NULL,NULL),(2191,'2022-08-30 23:47:54',493,NULL,38,NULL,'Cubierta - Entrada de cubierta activada','12','9',NULL,NULL,NULL,NULL),(2192,'2022-08-30 23:47:54',493,NULL,39,NULL,'Activo - Módulo de hidrólisis activo (hidroEnable)','12','9',NULL,NULL,NULL,NULL),(2193,'2022-08-30 23:47:54',493,NULL,40,NULL,'Control - Módulo de hidrólisis trabajando con regulación','12','9',NULL,NULL,NULL,NULL),(2194,'2022-08-30 23:47:54',493,NULL,41,NULL,'Activación Redox - Hidrólisis activada por la Redox-módulo (rx_hen)','12','9',NULL,NULL,NULL,NULL),(2195,'2022-08-30 23:47:54',493,NULL,42,NULL,'Choque hidroeléctrico habilitado - Refuerzo de cloro activado','12','9',NULL,NULL,NULL,NULL),(2196,'2022-08-30 23:47:55',493,NULL,43,NULL,'FL2 - Detector de flujo de la sonda de cloro, si está presente','12','9',NULL,NULL,NULL,NULL),(2197,'2022-08-30 23:47:55',493,NULL,44,NULL,'Cl enable - Activación de la hidrólisis por el Cloro-módulo (cl_hen)','12','9',NULL,NULL,NULL,NULL),(2198,'2022-08-30 23:47:55',493,NULL,45,NULL,'Sin uso','12','9',NULL,NULL,NULL,NULL),(2199,'2022-08-30 23:47:55',493,NULL,46,NULL,'Ion Pol off - Tiempo muerto (Ionización)','12','9',NULL,NULL,NULL,NULL),(2200,'2022-08-30 23:47:55',493,NULL,47,NULL,'Ion Pol 1 - Ionización trabajando (Pol 1)','12','9',NULL,NULL,NULL,NULL),(2201,'2022-08-30 23:47:55',493,NULL,48,NULL,'Ion Pol 2 - Ionización trabajando (Pol 2)','12','9',NULL,NULL,NULL,NULL),(2202,'2022-08-30 23:47:55',493,NULL,49,NULL,'Sin uso','12','9',NULL,NULL,NULL,NULL),(2203,'2022-08-30 23:47:55',493,NULL,50,NULL,'Relé de estado 1','13','10',NULL,NULL,NULL,NULL),(2204,'2022-08-30 23:47:55',493,NULL,51,NULL,'Relé de estado 2','13','10',NULL,NULL,NULL,NULL),(2205,'2022-08-30 23:47:55',493,NULL,52,NULL,'Relé de estado 3','13','10',NULL,NULL,NULL,NULL),(2206,'2022-08-30 23:47:55',493,NULL,53,NULL,'Relé de estado 4','13','10',NULL,NULL,NULL,NULL),(2207,'2022-08-30 23:47:55',493,NULL,54,NULL,'Relé de estado 5','13','10',NULL,NULL,NULL,NULL),(2208,'2022-08-30 23:47:55',493,NULL,55,NULL,'Relé de estado 6','13','10',NULL,NULL,NULL,NULL),(2209,'2022-08-30 23:47:55',493,NULL,56,NULL,'Relé de estado 7','13','10',NULL,NULL,NULL,NULL),(2210,'2022-08-30 23:47:55',493,NULL,57,NULL,'Valor Maximo produccion ionizacion','14','11',NULL,NULL,NULL,NULL),(2211,'2022-08-30 23:47:55',493,NULL,58,NULL,'Valor Minimo produccion ionizacion','15','12',NULL,NULL,NULL,NULL),(2212,'2022-09-07 05:07:27',495,351,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2213,'2022-09-07 05:30:24',496,354,0,'digital',NULL,NULL,NULL,'','','alumbrado','Estado alumbrado sala depuracion'),(2214,'2022-09-07 05:30:53',496,354,1,'digital',NULL,NULL,NULL,'','','bombas','Estado cascada piscina interior'),(2215,'2022-09-07 05:31:28',496,354,2,'digital',NULL,NULL,NULL,'','','bombas','Estado bomba achique'),(2216,'2022-09-07 05:32:03',496,354,3,'digital',NULL,NULL,NULL,'','','bombas','Estado sonda inundación cuarto depuracion'),(2217,'2022-09-07 05:32:19',496,354,4,'digital',NULL,NULL,NULL,'','','bombas','Estado sonda inundacion cuarto bomba cascada'),(2218,'2022-09-07 05:32:29',496,354,5,'digital',NULL,NULL,NULL,'','','bombas','Estado bomba depuracion'),(2219,'2022-09-07 05:32:46',496,354,6,'digital',NULL,NULL,NULL,'','','bombas','Estado nivel rebose aljibe'),(2220,'2022-09-07 05:32:55',496,354,7,'digital',NULL,NULL,NULL,'','','bombas','Estado nivel maximo aljibe'),(2221,'2022-09-07 05:33:05',496,354,8,'digital',NULL,NULL,NULL,'','','bombas','Estado nivel mínimo aljibe'),(2222,'2022-09-07 05:27:22',496,NULL,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2223,'2022-09-07 05:27:22',496,NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2224,'2022-09-07 05:27:23',496,NULL,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2225,'2022-09-07 05:27:23',496,NULL,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2226,'2022-09-07 05:27:23',496,NULL,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2227,'2022-09-07 05:27:23',496,NULL,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2228,'2022-09-07 05:27:23',496,NULL,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2229,'2022-09-07 05:40:48',499,355,0,'digital',NULL,NULL,NULL,'','','alumbrado','Estado Alumbrado Piscina Exterior'),(2230,'2022-09-07 05:40:58',499,355,1,'digital',NULL,NULL,NULL,'','','alumbrado','Estado Led Bañador Pared Piscina/Jardin'),(2231,'2022-09-07 05:41:32',499,355,2,'digital',NULL,NULL,NULL,'','','clima','Estado calentamiento piscina exterior'),(2232,'2022-09-07 05:41:14',499,355,3,'digital',NULL,NULL,NULL,'','','alumbrado','Estado led escaleras piscina/jardin'),(2233,'2022-09-07 05:41:50',499,355,4,'digital',NULL,NULL,NULL,'','','bombas','Estado bomba depuracion'),(2234,'2022-09-07 05:41:59',499,355,5,'digital',NULL,NULL,NULL,'','','bombas','Estado nivel rebose aljibe'),(2235,'2022-09-07 05:42:10',499,355,6,'digital',NULL,NULL,NULL,'','','bombas','Estado nivel maximo aljibe'),(2236,'2022-09-07 05:42:20',499,355,7,'digital',NULL,NULL,NULL,'','','bombas','Estado nivel minimo aljibe'),(2237,'2022-09-07 05:37:23',499,NULL,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2238,'2022-09-07 05:37:23',499,NULL,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2239,'2022-09-07 05:37:23',499,NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2240,'2022-09-07 05:37:23',499,NULL,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2241,'2022-09-07 05:37:23',499,NULL,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2242,'2022-09-07 05:37:23',499,NULL,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2243,'2022-09-07 05:37:23',499,NULL,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2244,'2022-09-07 05:37:23',499,NULL,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2245,'2022-09-08 15:00:04',510,356,0,'analogica',NULL,NULL,NULL,'','','clima','Sonda retorno fancoil'),(2246,'2022-09-08 15:00:18',511,357,0,'analogica',NULL,NULL,NULL,'','','clima','Sonda impulsion fancoil'),(2247,'2022-09-08 15:09:35',513,358,0,'analogica',NULL,NULL,NULL,'','','clima','Temperatura retorno agua piscina'),(2248,'2022-09-08 15:09:43',514,359,0,'analogica',NULL,NULL,NULL,'','','clima','Temperatura impulsion agua piscina'),(2249,'2022-09-08 16:26:26',515,360,0,'analogica',NULL,NULL,NULL,'','','clima','Temp entrada intercambiador piscina cirtuito primario'),(2250,'2022-09-08 16:26:34',516,361,0,'analogica',NULL,NULL,NULL,'','','clima','Temp salida intercambiador piscina circuito primario'),(2251,'2022-09-08 16:26:45',517,362,0,'analogica',NULL,NULL,NULL,'','','clima','Temp entrada intercambiador piscina cirtuito secundario'),(2252,'2022-09-08 16:26:54',518,363,0,'analogica',NULL,NULL,NULL,'','','clima','Temp salida intercambiador piscina cirtuito secundario'),(2253,'2022-09-08 16:32:33',519,364,0,'analogica','Temperatura',NULL,'trb1','','','clima','tempuratura sala depuracion'),(2254,'2022-09-08 16:32:55',519,364,1,'analogica','Humedad',NULL,'trb1','','','clima','humedad sala depuracion'),(2255,'2022-09-08 17:25:18',520,366,0,'analogica',NULL,NULL,NULL,'','','clima','sonda retorno fancoil'),(2256,'2022-09-08 17:25:36',521,367,0,'analogica',NULL,NULL,NULL,'','','clima','sonda impulsion fancoil'),(2257,'2022-09-22 15:57:19',524,NULL,0,NULL,'Valor control posicion',NULL,NULL,NULL,NULL,NULL,NULL),(2258,'2022-09-22 15:58:37',524,368,1,'analogica','Nivel',NULL,NULL,'','','estor','nivel estor baño alejandro'),(2259,'2022-10-04 08:46:15',526,NULL,0,NULL,'Corriente de ionizacion','0','1',NULL,NULL,NULL,NULL),(2260,'2022-10-04 08:46:15',526,NULL,1,NULL,'Corriente de hidrolisis','1','2',NULL,NULL,NULL,NULL),(2261,'2022-10-04 08:47:12',526,369,2,'analogica','Nivel de PH','2','3','','','','nivel de ph'),(2262,'2022-10-04 08:47:20',526,369,3,'analogica','Nivel de Redox','3','3','','','','nivel de redox'),(2263,'2022-10-04 08:47:28',526,369,4,'analogica','Nivel de cloro','4','3','','','','nivel de cloro'),(2264,'2022-10-04 08:47:38',526,369,5,'analogica','Nivel de conductividad','5','3','','','','nivel de conductividad'),(2265,'2022-10-04 08:47:47',526,369,6,'analogica','Temperatura del agua','6','3','','','','temperatura del agua'),(2266,'2022-10-04 08:46:15',526,NULL,7,NULL,'ph Alarma','7','4',NULL,NULL,NULL,NULL),(2267,'2022-10-04 08:46:15',526,NULL,8,NULL,'Estado del control del chip de pH','7','4',NULL,NULL,NULL,NULL),(2268,'2022-10-04 08:46:15',526,NULL,9,NULL,'Relé de bomba de bajo pH activado','7','4',NULL,NULL,NULL,NULL),(2269,'2022-10-04 08:46:15',526,NULL,10,NULL,'Relé de bomba de alto pH activado','7','4',NULL,NULL,NULL,NULL),(2270,'2022-10-04 08:46:15',526,NULL,11,NULL,'Módulo de control de pH activo y bombas de control','7','4',NULL,NULL,NULL,NULL),(2271,'2022-10-04 08:46:15',526,NULL,12,NULL,'Módulo de medida de pH activo y de medida','7','4',NULL,NULL,NULL,NULL),(2272,'2022-10-04 08:46:15',526,NULL,13,NULL,'Medición del módulo de pH detectado','7','4',NULL,NULL,NULL,NULL),(2273,'2022-10-04 08:46:15',526,NULL,14,NULL,'Relé de la bomba Rx activada','8','5',NULL,NULL,NULL,NULL),(2274,'2022-10-04 08:46:16',526,NULL,15,NULL,'Redox-modulo activo y controlando la bomba','8','5',NULL,NULL,NULL,NULL),(2275,'2022-10-04 08:46:16',526,NULL,16,NULL,'Medición de módulo redox activo','8','5',NULL,NULL,NULL,NULL),(2276,'2022-10-04 08:46:16',526,NULL,17,NULL,'Medición del módulo redox detectado por el sistema','8','5',NULL,NULL,NULL,NULL),(2277,'2022-10-04 08:46:16',526,NULL,18,NULL,'Sensor de flujo de la sonda de cloro','9','6',NULL,NULL,NULL,NULL),(2278,'2022-10-04 08:46:16',526,NULL,19,NULL,'Relé de la bomba de cloro encendida','9','6',NULL,NULL,NULL,NULL),(2279,'2022-10-04 08:46:16',526,NULL,20,NULL,'Módulo de cloro activo y control de la bomba','9','6',NULL,NULL,NULL,NULL),(2280,'2022-10-04 08:46:16',526,NULL,21,NULL,'Medición de cloro-módulo activo','9','6',NULL,NULL,NULL,NULL),(2281,'2022-10-04 08:46:16',526,NULL,22,NULL,'Medición del módulo de cloro detectado por el sistema','9','6',NULL,NULL,NULL,NULL),(2282,'2022-10-04 08:46:16',526,NULL,23,NULL,'Relé de la bomba de conductividad encendida','10','7',NULL,NULL,NULL,NULL),(2283,'2022-10-04 08:46:16',526,NULL,24,NULL,'Conductividad del módulo activo y control de la bomba','10','7',NULL,NULL,NULL,NULL),(2284,'2022-10-04 08:46:16',526,NULL,25,NULL,'Medición de conductividad-módulo activo','10','7',NULL,NULL,NULL,NULL),(2285,'2022-10-04 08:46:16',526,NULL,26,NULL,'Medición del módulo de conductividad detectado por el sistema','10','7',NULL,NULL,NULL,NULL),(2286,'2022-10-04 08:46:16',526,NULL,27,NULL,'En el objetivo: el sistema alcanzó el punto de ajuste','11','8',NULL,NULL,NULL,NULL),(2287,'2022-10-04 08:46:16',526,NULL,28,NULL,'Bajo - La ionización no puede alcanzar el punto de ajuste','11','8',NULL,NULL,NULL,NULL),(2288,'2022-10-04 08:46:16',526,NULL,29,NULL,'Elec - Reservado','11','8',NULL,NULL,NULL,NULL),(2289,'2022-10-04 08:46:16',526,NULL,30,NULL,'Pr off - Tiempo excedido programado','11','8',NULL,NULL,NULL,NULL),(2290,'2022-10-04 08:46:16',526,NULL,31,NULL,'Ion Pol off - Tiempo muerto','11','8',NULL,NULL,NULL,NULL),(2291,'2022-10-04 08:46:17',526,NULL,32,NULL,'Ion Pol 1 - Ionización trabajando (Pol 1)','11','8',NULL,NULL,NULL,NULL),(2292,'2022-10-04 08:46:17',526,NULL,33,NULL,'Ion Pol 2 - Ionización trabajando (Pol 2)','11','8',NULL,NULL,NULL,NULL),(2293,'2022-10-04 08:46:17',526,NULL,34,NULL,'En el objetivo: el sistema alcanzó el punto de ajuste','12','9',NULL,NULL,NULL,NULL),(2294,'2022-10-04 08:46:17',526,NULL,35,NULL,'Bajo - La hidrólisis no puede alcanzar el punto de ajuste','12','9',NULL,NULL,NULL,NULL),(2295,'2022-10-04 08:46:17',526,NULL,36,NULL,'Elec - Reservado','12','9',NULL,NULL,NULL,NULL),(2296,'2022-10-04 08:46:17',526,NULL,37,NULL,'Flujo - Indicador de flujo en la cámara de hidrólisis (FL1)','12','9',NULL,NULL,NULL,NULL),(2297,'2022-10-04 08:46:17',526,NULL,38,NULL,'Cubierta - Entrada de cubierta activada','12','9',NULL,NULL,NULL,NULL),(2298,'2022-10-04 08:46:17',526,NULL,39,NULL,'Activo - Módulo de hidrólisis activo (hidroEnable)','12','9',NULL,NULL,NULL,NULL),(2299,'2022-10-04 08:46:17',526,NULL,40,NULL,'Control - Módulo de hidrólisis trabajando con regulación','12','9',NULL,NULL,NULL,NULL),(2300,'2022-10-04 08:46:17',526,NULL,41,NULL,'Activación Redox - Hidrólisis activada por la Redox-módulo (rx_hen)','12','9',NULL,NULL,NULL,NULL),(2301,'2022-10-04 08:46:17',526,NULL,42,NULL,'Choque hidroeléctrico habilitado - Refuerzo de cloro activado','12','9',NULL,NULL,NULL,NULL),(2302,'2022-10-04 08:46:17',526,NULL,43,NULL,'FL2 - Detector de flujo de la sonda de cloro, si está presente','12','9',NULL,NULL,NULL,NULL),(2303,'2022-10-04 08:46:17',526,NULL,44,NULL,'Cl enable - Activación de la hidrólisis por el Cloro-módulo (cl_hen)','12','9',NULL,NULL,NULL,NULL),(2304,'2022-10-04 08:46:17',526,NULL,45,NULL,'Sin uso','12','9',NULL,NULL,NULL,NULL),(2305,'2022-10-04 08:46:17',526,NULL,46,NULL,'Ion Pol off - Tiempo muerto (Ionización)','12','9',NULL,NULL,NULL,NULL),(2306,'2022-10-04 08:46:17',526,NULL,47,NULL,'Ion Pol 1 - Ionización trabajando (Pol 1)','12','9',NULL,NULL,NULL,NULL),(2307,'2022-10-04 08:46:17',526,NULL,48,NULL,'Ion Pol 2 - Ionización trabajando (Pol 2)','12','9',NULL,NULL,NULL,NULL),(2308,'2022-10-04 08:46:17',526,NULL,49,NULL,'Sin uso','12','9',NULL,NULL,NULL,NULL),(2309,'2022-10-04 08:46:17',526,NULL,50,NULL,'Relé de estado 1','13','10',NULL,NULL,NULL,NULL),(2310,'2022-10-04 08:46:17',526,NULL,51,NULL,'Relé de estado 2','13','10',NULL,NULL,NULL,NULL),(2311,'2022-10-04 08:46:18',526,NULL,52,NULL,'Relé de estado 3','13','10',NULL,NULL,NULL,NULL),(2312,'2022-10-04 08:46:18',526,NULL,53,NULL,'Relé de estado 4','13','10',NULL,NULL,NULL,NULL),(2313,'2022-10-04 08:46:18',526,NULL,54,NULL,'Relé de estado 5','13','10',NULL,NULL,NULL,NULL),(2314,'2022-10-04 08:46:18',526,NULL,55,NULL,'Relé de estado 6','13','10',NULL,NULL,NULL,NULL),(2315,'2022-10-04 08:46:18',526,NULL,56,NULL,'Relé de estado 7','13','10',NULL,NULL,NULL,NULL),(2316,'2022-10-04 08:46:18',526,NULL,57,NULL,'Valor Maximo produccion ionizacion','14','11',NULL,NULL,NULL,NULL),(2317,'2022-10-04 08:46:18',526,NULL,58,NULL,'Valor Minimo produccion ionizacion','15','12',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tpse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tpss`
--

DROP TABLE IF EXISTS `tpss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tpss` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo_rb` int(11) DEFAULT NULL,
  `codigo_relacion_rb` int(11) DEFAULT NULL,
  `subdriver` text DEFAULT NULL,
  `numeroborna` int(11) DEFAULT NULL,
  `tipoborna` varchar(50) DEFAULT NULL,
  `nemoborna` varchar(100) DEFAULT NULL,
  `registro` varchar(20) DEFAULT NULL,
  `tiporegistro` varchar(20) DEFAULT NULL,
  `f1` varchar(30) DEFAULT NULL,
  `f2` varchar(30) DEFAULT NULL,
  `f3` varchar(30) DEFAULT NULL,
  `nemo` varchar(100) DEFAULT NULL,
  `seudoborna` varchar(20) DEFAULT NULL,
  `tiposalida` int(11) DEFAULT NULL,
  `codigo_variables` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_rb` (`codigo_rb`),
  KEY `codigo_relacion_rb` (`codigo_relacion_rb`),
  CONSTRAINT `tpss_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tpss_ibfk_2` FOREIGN KEY (`codigo_relacion_rb`) REFERENCES `relacion_rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1024 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tpss`
--

LOCK TABLES `tpss` WRITE;
/*!40000 ALTER TABLE `tpss` DISABLE KEYS */;
INSERT INTO `tpss` VALUES (1,'2022-04-02 08:48:08',2,NULL,'SD',0,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado cabecero','0',0,0),(2,'2022-04-02 08:48:08',2,NULL,'SD',1,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado armario','0',0,0),(3,'2022-04-02 08:48:08',2,NULL,'SD',2,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado escritorio','0',0,0),(4,'2022-04-02 08:48:08',2,NULL,'SD',3,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado techo baño','0',0,0),(5,'2022-04-02 08:48:08',2,NULL,'SD',4,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado espejo baño','0',0,0),(6,'2022-04-02 08:48:09',2,NULL,'SD',5,'Digital',NULL,NULL,NULL,'','','Iot','Enchufe cabecero derecho','0',0,0),(7,'2022-04-02 08:48:09',2,NULL,'SD',6,'Digital',NULL,NULL,NULL,'','','Iot','Enchufe cabecero izquierdo','0',0,0),(8,'2022-04-02 08:48:09',2,NULL,'SD',7,'Digital',NULL,NULL,NULL,'','','Iot','Enchufe TV','0',0,0),(9,'2022-04-02 08:48:09',2,NULL,'SD',8,'Digital',NULL,NULL,NULL,'','','Suelo radiante','Valvula suelo radiante','0',0,0),(10,'2022-04-02 08:48:09',2,NULL,'SD',9,'Digital',NULL,NULL,NULL,'','','Suelo radiante','Bombilla suelo radiante','0',0,0),(11,'2022-04-02 08:48:09',2,NULL,'SD',10,'Digital',NULL,NULL,NULL,'','','Cuadro electrico','Desconexion usos varios','0',0,0),(12,'2022-04-02 08:48:09',2,NULL,NULL,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'2022-04-02 08:48:09',2,NULL,NULL,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'2022-04-02 08:48:09',2,NULL,NULL,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'2022-04-02 08:48:09',2,NULL,NULL,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'2022-04-02 08:48:09',2,NULL,NULL,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'2022-04-02 08:48:10',3,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'2022-04-02 08:48:10',3,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'2022-04-02 08:48:10',3,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'2022-04-02 08:48:10',3,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'2022-04-02 12:57:14',4,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'2022-04-02 12:57:14',4,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado cabecero','0',0,0),(23,'2022-04-02 12:57:14',4,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'2022-04-02 12:57:14',4,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,'2022-04-02 12:58:36',5,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,'2022-04-02 12:58:36',5,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado armario','0',0,0),(27,'2022-04-02 12:58:36',5,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,'2022-04-02 12:58:36',5,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,'2022-04-02 12:59:00',6,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,'2022-04-02 12:59:00',6,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado escritorio','0',0,0),(31,'2022-04-02 12:59:00',6,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,'2022-04-02 12:59:00',6,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,'2022-04-02 12:59:26',7,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,'2022-04-02 12:59:26',7,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado baño','0',0,0),(35,'2022-04-02 12:59:26',7,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,'2022-04-02 12:59:26',7,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,'2022-04-02 12:59:48',8,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,'2022-04-02 12:59:48',8,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado espejo baño','0',0,0),(39,'2022-04-02 12:59:48',8,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,'2022-04-02 12:59:48',8,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,'2022-04-03 12:11:15',11,NULL,'SD',0,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado cabecero','0',0,0),(42,'2022-04-03 12:11:15',11,NULL,'SD',1,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado armario','0',0,0),(43,'2022-04-03 12:11:15',11,NULL,'SD',2,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado escritorio','0',0,0),(44,'2022-04-03 12:11:15',11,NULL,'SD',3,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado techo baño','0',0,0),(45,'2022-04-03 12:11:15',11,NULL,'SD',4,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado espejo bajo','0',0,0),(46,'2022-04-03 12:11:15',11,NULL,'SD',5,'Digital',NULL,NULL,NULL,'','','Iot','Enchufe cabecero derecho','0',0,0),(47,'2022-04-03 12:11:15',11,NULL,'SD',6,'Digital',NULL,NULL,NULL,'','','Iot','Enchufe cabecero izquierdo','0',0,0),(48,'2022-04-03 12:11:15',11,NULL,'SD',7,'Digital',NULL,NULL,NULL,'','','Iot','Enchufe TV','0',0,0),(49,'2022-04-03 12:11:16',11,NULL,'SD',8,'Digital',NULL,NULL,NULL,'','','Suelo radiante','Valvula suelo radiante','0',0,0),(50,'2022-04-03 12:11:16',11,NULL,'SD',9,'Digital',NULL,NULL,NULL,'','','Suelo Radiante','Bombilla suelo radiante','0',0,0),(51,'2022-04-03 12:11:16',11,NULL,'SD',10,'Digital',NULL,NULL,NULL,'','','Cuadro electrico','Desconexion usos varios','0',0,0),(52,'2022-04-03 12:11:16',11,NULL,NULL,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,'2022-04-03 12:11:16',11,NULL,NULL,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,'2022-04-03 12:11:16',11,NULL,NULL,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,'2022-04-03 12:11:16',11,NULL,NULL,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,'2022-04-03 12:11:16',11,NULL,NULL,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(57,'2022-04-03 12:11:16',12,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(58,'2022-04-03 12:11:16',12,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(59,'2022-04-03 12:11:16',12,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(60,'2022-04-03 12:11:16',12,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(61,'2022-04-03 12:32:21',14,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(62,'2022-04-03 12:32:21',14,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado cabecero','0',0,0),(63,'2022-04-03 12:32:21',14,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(64,'2022-04-03 12:32:21',14,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(65,'2022-04-03 12:32:44',15,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(66,'2022-04-03 12:32:44',15,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado armario','0',0,0),(67,'2022-04-03 12:32:44',15,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(68,'2022-04-03 12:32:44',15,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(69,'2022-04-03 12:33:01',16,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(70,'2022-04-03 12:33:01',16,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado escritorio','0',0,0),(71,'2022-04-03 12:33:01',16,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(72,'2022-04-03 12:33:02',16,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(73,'2022-04-03 12:33:22',17,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(74,'2022-04-03 12:33:22',17,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado baño','0',0,0),(75,'2022-04-03 12:33:22',17,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(76,'2022-04-03 12:33:22',17,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(77,'2022-04-03 12:33:44',18,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(78,'2022-04-03 12:33:44',18,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado espejo baño','0',0,0),(79,'2022-04-03 12:33:44',18,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(80,'2022-04-03 12:33:44',18,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(81,'2022-04-03 21:05:41',20,NULL,'SD',0,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado cabecero','0',0,0),(82,'2022-04-03 21:05:41',20,NULL,'SD',1,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado armario','0',0,0),(83,'2022-04-03 21:05:41',20,NULL,'SD',2,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado escritorio','0',0,0),(84,'2022-04-03 21:05:41',20,NULL,'SD',3,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado techo baño','0',0,0),(85,'2022-04-03 21:05:41',20,NULL,'SD',4,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado espejo baño','0',0,0),(86,'2022-04-03 21:05:41',20,NULL,'SD',5,'Digital',NULL,NULL,NULL,'','','Iot','Enchufe cabecero derecho ','0',0,0),(87,'2022-04-03 21:05:41',20,NULL,'SD',6,'Digital',NULL,NULL,NULL,'','','Iot','Enchufe cabecero izquierdo','0',0,0),(88,'2022-04-03 21:05:41',20,NULL,'SD',7,'Digital',NULL,NULL,NULL,'','','Iot','Enchufe TV','0',0,0),(89,'2022-04-03 21:05:41',20,NULL,'SD',8,'Digital',NULL,NULL,NULL,'','','Suelo radiante','Valvula suelo radiante','0',0,0),(90,'2022-04-03 21:05:41',20,NULL,'SD',9,'Digital',NULL,NULL,NULL,'','','Suelo Radiante','Bombilla suelo radiante','0',0,0),(91,'2022-04-03 21:05:41',20,NULL,'SD',10,'Digital',NULL,NULL,NULL,'','','Cuadro electrico','Desconexion usos varios','0',0,0),(92,'2022-04-03 21:05:41',20,NULL,NULL,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(93,'2022-04-03 21:05:42',20,NULL,NULL,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(94,'2022-04-03 21:05:42',20,NULL,NULL,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(95,'2022-04-03 21:05:42',20,NULL,NULL,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(96,'2022-04-03 21:05:43',20,NULL,NULL,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(97,'2022-04-03 21:05:43',21,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(98,'2022-04-03 21:05:43',21,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(99,'2022-04-03 21:05:43',21,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(100,'2022-04-03 21:05:43',21,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(101,'2022-04-03 21:15:19',23,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(102,'2022-04-03 21:15:19',23,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado cabecero','0',0,0),(103,'2022-04-03 21:15:19',23,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(104,'2022-04-03 21:15:19',23,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(105,'2022-04-03 21:15:43',24,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(106,'2022-04-03 21:15:43',24,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado armario','0',0,0),(107,'2022-04-03 21:15:43',24,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(108,'2022-04-03 21:15:43',24,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(109,'2022-04-03 21:16:39',25,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(110,'2022-04-03 21:16:39',25,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado escritorio','0',0,0),(111,'2022-04-03 21:16:39',25,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(112,'2022-04-03 21:16:40',25,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(113,'2022-04-03 21:17:15',26,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(114,'2022-04-03 21:17:15',26,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado baño','0',0,0),(115,'2022-04-03 21:17:15',26,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(116,'2022-04-03 21:17:15',26,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(117,'2022-04-03 21:17:35',27,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(118,'2022-04-03 21:17:35',27,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado espejo baño','0',0,0),(119,'2022-04-03 21:17:35',27,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(120,'2022-04-03 21:17:35',27,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(121,'2022-04-03 21:47:35',29,NULL,'SD',0,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado cabecero','0',0,0),(122,'2022-04-03 21:47:35',29,NULL,'SD',1,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado armario','0',0,0),(123,'2022-04-03 21:47:35',29,NULL,'SD',2,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado escritorio','0',0,0),(124,'2022-04-03 21:47:35',29,NULL,'SD',3,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado techo baño','0',0,0),(125,'2022-04-03 21:47:35',29,NULL,'SD',4,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado espejo baño','0',0,0),(126,'2022-04-03 21:47:35',29,NULL,'SD',5,'Digital',NULL,NULL,NULL,'','','Iot','Enchufe cabecero derecho','0',0,0),(127,'2022-04-03 21:47:35',29,NULL,'SD',6,'Digital',NULL,NULL,NULL,'','','Iot','Enchufe cabecero izquierdo','0',0,0),(128,'2022-04-03 21:47:35',29,NULL,'SD',7,'Digital',NULL,NULL,NULL,'','','Iot','Enchufe TV','0',0,0),(129,'2022-04-03 21:47:35',29,NULL,'SD',8,'Digital',NULL,NULL,NULL,'','','Suelo radiante','Valvula suelo radiante','0',0,0),(130,'2022-04-03 21:47:35',29,NULL,'SD',9,'Digital',NULL,NULL,NULL,'','','Suelo radiante','Bombilla suelo radiante','0',0,0),(131,'2022-04-03 21:47:35',29,NULL,'SD',10,'Digital',NULL,NULL,NULL,'','','Cuadro electrico','Desconexion usos varios','0',0,0),(132,'2022-04-03 21:47:35',29,NULL,NULL,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(133,'2022-04-03 21:47:35',29,NULL,NULL,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(134,'2022-04-03 21:47:35',29,NULL,NULL,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(135,'2022-04-03 21:47:35',29,NULL,NULL,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(136,'2022-04-03 21:47:37',29,NULL,NULL,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(137,'2022-04-03 21:47:37',30,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(138,'2022-04-03 21:47:37',30,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(139,'2022-04-03 21:47:37',30,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(140,'2022-04-03 21:47:37',30,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(141,'2022-04-03 21:59:11',32,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(142,'2022-04-03 21:59:11',32,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado cabecero','0',0,0),(143,'2022-04-03 21:59:11',32,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(144,'2022-04-03 21:59:11',32,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(145,'2022-04-03 22:00:15',33,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(146,'2022-04-03 22:00:15',33,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado armario','0',0,0),(147,'2022-04-03 22:00:16',33,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(148,'2022-04-03 22:00:18',33,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(149,'2022-04-03 22:00:19',34,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(150,'2022-04-03 22:00:19',34,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado escritorio','0',0,0),(151,'2022-04-03 22:00:20',34,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(152,'2022-04-03 22:00:20',34,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(153,'2022-04-03 22:05:46',35,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(154,'2022-04-03 22:05:47',35,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Añumbrado','Alumbrado baño','0',0,0),(155,'2022-04-03 22:05:47',35,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(156,'2022-04-03 22:05:47',35,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(157,'2022-04-03 22:06:29',36,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(158,'2022-04-03 22:06:29',36,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado espejo baño','0',0,0),(159,'2022-04-03 22:06:29',36,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(160,'2022-04-03 22:06:29',36,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(161,'2022-04-03 22:08:34',38,NULL,'SD',0,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado cabecero','0',0,0),(162,'2022-04-03 22:08:34',38,NULL,'SD',1,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado armario','0',0,0),(163,'2022-04-03 22:08:34',38,NULL,'SD',2,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado escritorio','0',0,0),(164,'2022-04-03 22:08:34',38,NULL,'SD',3,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado techo baño','0',0,0),(165,'2022-04-03 22:08:34',38,NULL,'SD',4,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado espejo baño','0',0,0),(166,'2022-04-03 22:08:34',38,NULL,'SD',5,'Digital',NULL,NULL,NULL,'','','Iot','Enchufe cabecero derecho','0',0,0),(167,'2022-04-03 22:08:34',38,NULL,'SD',6,'Digital',NULL,NULL,NULL,'','','Iot','Enchufe cabecero izquierdo','0',0,0),(168,'2022-04-03 22:08:34',38,NULL,'SD',7,'Digital',NULL,NULL,NULL,'','','Iot','Enchufe TV','0',0,0),(169,'2022-04-03 22:08:34',38,NULL,'SD',8,'Digital',NULL,NULL,NULL,'','','Suelo radiante','Valvula suelo radiante','0',0,0),(170,'2022-04-03 22:08:34',38,NULL,'SD',9,'Digital',NULL,NULL,NULL,'','','Suelo radiante','Bombilla suelo radiante','0',0,0),(171,'2022-04-03 22:08:34',38,NULL,'SD',10,'Digital',NULL,NULL,NULL,'','','Cuadro electrico','Desconexion usos varios','0',0,0),(172,'2022-04-03 22:08:34',38,NULL,'SD',11,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado Focos techo Vestibulo H.Estudio','0',0,0),(173,'2022-04-03 22:08:34',38,NULL,'SD',12,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado escalera Caracol Oeste','0',0,0),(174,'2022-04-03 22:08:34',38,NULL,NULL,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(175,'2022-04-03 22:08:35',38,NULL,NULL,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(176,'2022-04-03 22:08:35',38,NULL,NULL,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(177,'2022-04-03 22:08:35',39,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(178,'2022-04-03 22:08:35',39,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(179,'2022-04-03 22:08:35',39,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(180,'2022-04-03 22:08:35',39,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(181,'2022-04-03 22:16:22',41,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(182,'2022-04-03 22:16:22',41,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado cabecero','0',0,0),(183,'2022-04-03 22:16:22',41,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(184,'2022-04-03 22:16:22',41,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(185,'2022-04-03 22:16:42',42,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(186,'2022-04-03 22:16:42',42,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado armario','0',0,0),(187,'2022-04-03 22:16:42',42,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(188,'2022-04-03 22:16:42',42,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(189,'2022-04-03 22:17:05',43,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(190,'2022-04-03 22:17:05',43,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado escritorio','0',0,0),(191,'2022-04-03 22:17:05',43,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(192,'2022-04-03 22:17:05',43,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(193,'2022-04-03 22:17:42',44,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(194,'2022-04-03 22:17:42',44,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado baño','0',0,0),(195,'2022-04-03 22:17:42',44,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(196,'2022-04-03 22:17:42',44,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(197,'2022-04-03 22:18:08',45,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(198,'2022-04-03 22:18:08',45,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado espejo baño','0',0,0),(199,'2022-04-03 22:18:08',45,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(200,'2022-04-03 22:18:09',45,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(201,'2022-04-03 22:20:16',47,NULL,'SD',0,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado cabecero','0',0,0),(202,'2022-04-03 22:20:16',47,NULL,'SD',1,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado armario','0',0,0),(203,'2022-04-03 22:20:16',47,NULL,'SD',2,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado escritorio','0',0,0),(204,'2022-04-03 22:20:16',47,NULL,'SD',3,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado techo baño','0',0,0),(205,'2022-04-03 22:20:16',47,NULL,'SD',4,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado espejo baño','0',0,0),(206,'2022-04-03 22:20:16',47,NULL,'SD',5,'Digital',NULL,NULL,NULL,'','','Iot','Enchufe cabecero derecho','0',0,0),(207,'2022-04-03 22:20:16',47,NULL,'SD',6,'Digital',NULL,NULL,NULL,'','','Iot','Enchufe cabecero izquierdo','0',0,0),(208,'2022-04-03 22:20:16',47,NULL,'SD',7,'Digital',NULL,NULL,NULL,'','','Iot','Enchufe TV','0',0,0),(209,'2022-04-03 22:20:16',47,NULL,'SD',8,'Digital',NULL,NULL,NULL,'','','Suelo radiante','Valvula suelo radiante','0',0,0),(210,'2022-04-03 22:20:16',47,NULL,'SD',9,'Digital',NULL,NULL,NULL,'','','Suelo radiante','Bombilla suelo radiante','0',0,0),(211,'2022-04-03 22:20:16',47,NULL,'SD',10,'Digital',NULL,NULL,NULL,'','','Cuadro electrico','Desconexion usos varios','0',0,0),(212,'2022-04-03 22:20:16',47,NULL,NULL,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(213,'2022-04-03 22:20:16',47,NULL,NULL,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(214,'2022-04-03 22:20:16',47,NULL,NULL,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(215,'2022-04-03 22:20:16',47,NULL,NULL,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(216,'2022-04-03 22:20:16',47,NULL,NULL,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(217,'2022-04-03 22:20:17',48,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(218,'2022-04-03 22:20:17',48,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(219,'2022-04-03 22:20:17',48,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(220,'2022-04-03 22:20:17',48,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(221,'2022-04-03 22:29:16',50,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(222,'2022-04-03 22:29:16',50,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado cabecero','0',0,0),(223,'2022-04-03 22:29:16',50,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(224,'2022-04-03 22:29:16',50,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(225,'2022-04-03 22:29:42',51,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(226,'2022-04-03 22:29:42',51,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado armario','0',0,0),(227,'2022-04-03 22:29:42',51,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(228,'2022-04-03 22:29:42',51,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(229,'2022-04-03 22:30:02',52,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(230,'2022-04-03 22:30:02',52,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado escritorio','0',0,0),(231,'2022-04-03 22:30:02',52,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(232,'2022-04-03 22:30:02',52,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(233,'2022-04-03 22:30:20',53,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(234,'2022-04-03 22:30:20',53,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado baño','0',0,0),(235,'2022-04-03 22:30:20',53,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(236,'2022-04-03 22:30:20',53,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(237,'2022-04-03 22:30:39',54,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(238,'2022-04-03 22:30:39',54,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado espejo baño','0',0,0),(239,'2022-04-03 22:30:39',54,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(240,'2022-04-03 22:30:39',54,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(241,'2022-04-25 10:36:53',62,NULL,'SD',0,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado focos techo biblioteca','0',0,0),(242,'2022-04-25 10:36:53',62,NULL,'SD',1,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado led techo biblioteca','0',0,0),(243,'2022-04-25 10:36:53',62,NULL,'SD',2,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado focos techo distribuidor','0',0,0),(244,'2022-04-25 10:36:53',62,NULL,'SD',3,'Digital',NULL,NULL,NULL,'','','Clima','Bombilla suelo radiante','0',0,0),(245,'2022-04-25 10:36:53',62,NULL,'SD',4,'Digital',NULL,NULL,NULL,'','','Iot','Enchufe suelo','0',0,0),(246,'2022-04-25 10:36:53',62,NULL,'SD',5,'Digital',NULL,NULL,NULL,'','','Cuadro electrico','Desconexion usos varios','0',0,0),(247,'2022-04-25 10:36:53',62,NULL,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(248,'2022-04-25 10:36:53',62,NULL,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(249,'2022-04-25 10:36:53',62,NULL,NULL,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(250,'2022-04-25 10:36:53',62,NULL,NULL,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(251,'2022-04-25 10:36:53',62,NULL,NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(252,'2022-04-25 10:36:53',62,NULL,NULL,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(253,'2022-04-25 10:36:54',62,NULL,NULL,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(254,'2022-04-25 10:36:54',62,NULL,NULL,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(255,'2022-04-25 10:36:55',62,NULL,NULL,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(256,'2022-04-25 10:36:55',62,NULL,NULL,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(257,'2022-04-25 10:36:55',63,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(258,'2022-04-25 10:36:55',63,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(259,'2022-04-25 10:36:55',63,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(260,'2022-04-25 10:36:55',63,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(261,'2022-04-25 10:55:32',65,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(262,'2022-04-25 10:55:32',65,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado focos techo biblioteca','0',0,0),(263,'2022-04-25 10:55:33',65,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(264,'2022-04-25 10:55:33',65,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(265,'2022-04-25 10:57:30',66,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(266,'2022-04-25 10:57:30',66,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado led focos techo biblioteca','0',0,0),(267,'2022-04-25 10:57:30',66,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(268,'2022-04-25 10:57:30',66,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(269,'2022-04-25 10:58:45',67,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(270,'2022-04-25 10:58:45',67,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado focos techo distribuidor','0',0,0),(271,'2022-04-25 10:58:45',67,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(272,'2022-04-25 10:58:45',67,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(273,'2022-04-25 11:20:35',70,NULL,'SD',0,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado led bar','0',0,0),(274,'2022-04-25 11:20:35',70,NULL,'SD',1,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado focos techo salon','0',0,0),(275,'2022-04-25 11:20:35',70,NULL,'SD',2,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado led salon','0',0,0),(276,'2022-04-25 11:20:35',70,NULL,'SD',3,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado focos techo exterior','0',0,0),(277,'2022-04-25 11:20:35',70,NULL,'SD',4,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado led exterior','0',0,0),(278,'2022-04-25 11:20:35',70,NULL,'SD',5,'Digital',NULL,NULL,NULL,'','','Suelo radiante','Bombilla suelo radiante bar','0',0,0),(279,'2022-04-25 11:20:36',70,NULL,'SD',6,'Digital',NULL,NULL,NULL,'','','Suelo radiante','Bombilla suelo radiante salon','0',0,0),(280,'2022-04-25 11:20:36',70,NULL,'SD',7,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado barra bar','0',0,0),(281,'2022-04-25 11:20:36',70,NULL,'SD',8,'Digital',NULL,NULL,NULL,'','','mulimedia','Apertura proyector cine','0',0,0),(282,'2022-04-25 11:20:36',70,NULL,'SD',9,'Digital',NULL,NULL,NULL,'','','multimedia','Cierre proyector ','0',0,0),(283,'2022-04-25 11:20:38',70,NULL,NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(284,'2022-04-25 11:20:38',70,NULL,NULL,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(285,'2022-04-25 11:20:38',70,NULL,NULL,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(286,'2022-04-25 11:20:38',70,NULL,NULL,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(287,'2022-04-25 11:20:38',70,NULL,NULL,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(288,'2022-04-25 11:20:38',70,NULL,NULL,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(289,'2022-04-25 11:20:38',71,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(290,'2022-04-25 11:20:38',71,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(291,'2022-04-25 11:20:38',71,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(292,'2022-04-25 11:20:38',71,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(293,'2022-04-26 08:29:36',75,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(294,'2022-04-26 08:29:36',75,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado led bar','0',0,0),(295,'2022-04-26 08:29:36',75,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(296,'2022-04-26 08:29:36',75,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(297,'2022-04-26 08:30:08',76,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(298,'2022-04-26 08:30:08',76,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado focos techo salon','0',0,0),(299,'2022-04-26 08:30:08',76,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(300,'2022-04-26 08:30:08',76,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(301,'2022-04-26 08:30:29',77,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(302,'2022-04-26 08:30:29',77,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado led salon','0',0,0),(303,'2022-04-26 08:30:29',77,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(304,'2022-04-26 08:30:29',77,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(305,'2022-04-26 08:30:56',78,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(306,'2022-04-26 08:30:56',78,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado focos techo exterior salon','0',0,0),(307,'2022-04-26 08:30:56',78,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(308,'2022-04-26 08:30:56',78,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(309,'2022-04-26 08:31:17',79,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(310,'2022-04-26 08:31:17',79,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado led exterior zona salon','0',0,0),(311,'2022-04-26 08:31:17',79,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(312,'2022-04-26 08:31:17',79,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(313,'2022-05-10 09:45:24',81,NULL,'SD',0,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado focos techo armario hab 2','0',0,0),(314,'2022-05-10 09:45:25',81,NULL,'SD',1,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado focos techo cabecero hab 2','0',0,0),(315,'2022-05-10 09:45:26',81,NULL,'SD',2,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado focos techo baño hab 2','0',0,0),(316,'2022-05-10 09:45:26',81,NULL,'SD',3,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado espejo baño hab 2','0',0,0),(317,'2022-05-10 09:45:27',81,NULL,'SD',4,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado focos techo armario hab 1','0',0,0),(318,'2022-05-10 09:45:27',81,NULL,'SD',5,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado focos techo cabecero hab 1','0',0,0),(319,'2022-05-10 09:45:27',81,NULL,'SD',6,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado focos techo baño hab 1','0',0,0),(320,'2022-05-10 09:45:27',81,NULL,'SD',7,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado espejo baño hab 1','0',0,0),(321,'2022-05-10 09:45:29',81,NULL,'SD',8,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado focos techo vestibulo servicio','0',0,0),(322,'2022-05-10 09:45:29',81,NULL,'SD',9,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado focos techo cocina comedor','0',0,0),(323,'2022-05-10 09:45:29',81,NULL,'SD',10,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado exterior escaleras servicio','0',0,0),(324,'2022-05-10 09:45:30',81,NULL,NULL,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(325,'2022-05-10 09:45:31',81,NULL,NULL,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(326,'2022-05-10 09:45:31',81,NULL,NULL,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(327,'2022-05-10 09:45:32',81,NULL,NULL,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(328,'2022-05-10 09:45:32',81,NULL,NULL,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(329,'2022-05-10 09:45:36',82,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(330,'2022-05-10 09:45:38',82,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(331,'2022-05-10 09:45:39',82,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(332,'2022-05-10 09:45:40',82,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(333,'2022-05-10 10:14:44',86,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(334,'2022-05-10 10:14:44',86,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado focos techo armario hab 2','0',0,0),(335,'2022-05-10 10:14:45',86,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(336,'2022-05-10 10:14:45',86,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(337,'2022-05-10 10:15:19',87,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(338,'2022-05-10 10:15:19',87,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado focos techo cabecero hab 2','0',0,0),(339,'2022-05-10 10:15:19',87,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(340,'2022-05-10 10:15:19',87,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(341,'2022-05-10 10:15:51',88,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(342,'2022-05-10 10:15:51',88,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado focos techo baño hab 2','0',0,0),(343,'2022-05-10 10:15:52',88,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(344,'2022-05-10 10:15:52',88,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(345,'2022-05-10 10:16:19',89,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(346,'2022-05-10 10:16:19',89,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado focos techo armario hab 1','0',0,0),(347,'2022-05-10 10:16:19',89,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(348,'2022-05-10 10:16:19',89,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(349,'2022-05-10 10:19:55',90,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(350,'2022-05-10 10:19:55',90,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado focos techo cabecero hab 1','0',0,0),(351,'2022-05-10 10:19:55',90,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(352,'2022-05-10 10:19:55',90,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(353,'2022-05-10 10:20:21',91,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(354,'2022-05-10 10:20:22',91,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado focos techo baño hab 1','0',0,0),(355,'2022-05-10 10:20:22',91,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(356,'2022-05-10 10:20:22',91,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(357,'2022-05-10 10:20:49',92,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(358,'2022-05-10 10:20:49',92,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado focos techo vestibulo servicio','0',0,0),(359,'2022-05-10 10:20:49',92,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(360,'2022-05-10 10:20:49',92,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(361,'2022-05-10 10:21:59',93,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(362,'2022-05-10 10:21:59',93,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado focos techo cocina comedor','0',0,0),(363,'2022-05-10 10:21:59',93,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(364,'2022-05-10 10:21:59',93,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(365,'2022-05-10 10:23:06',94,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(366,'2022-05-10 10:23:06',94,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado exterior escaleras servicio','0',0,0),(367,'2022-05-10 10:23:06',94,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(368,'2022-05-10 10:23:06',94,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(369,'2022-05-29 23:06:40',96,NULL,'SD',0,'Digital',NULL,NULL,NULL,'','','alumbrado','Alumbrado pasillo lavanderia','0',0,0),(370,'2022-05-29 23:06:40',96,NULL,'SD',1,'Digital',NULL,NULL,NULL,'','','alumbrado','Alumbrado lavanderia','0',0,0),(371,'2022-05-29 23:06:40',96,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(372,'2022-05-29 23:06:40',96,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(373,'2022-05-29 23:06:40',96,NULL,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(374,'2022-05-29 23:06:40',96,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(375,'2022-05-29 23:06:40',96,NULL,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(376,'2022-05-29 23:06:40',96,NULL,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(377,'2022-05-29 23:06:40',96,NULL,NULL,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(378,'2022-05-29 23:06:40',96,NULL,NULL,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(379,'2022-05-29 23:06:40',96,NULL,NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(380,'2022-05-29 23:06:41',96,NULL,NULL,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(381,'2022-05-29 23:06:41',96,NULL,NULL,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(382,'2022-05-29 23:06:41',96,NULL,NULL,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(383,'2022-05-29 23:06:41',96,NULL,NULL,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(384,'2022-05-29 23:06:42',96,NULL,NULL,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(385,'2022-05-29 23:06:42',97,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(386,'2022-05-29 23:06:42',97,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(387,'2022-05-29 23:06:42',97,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(388,'2022-05-29 23:06:42',97,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(389,'2022-05-29 23:12:31',98,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(390,'2022-05-29 23:12:32',98,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','alumbrado','Alumbrado Pasillo Lavanderia','0',0,0),(391,'2022-05-29 23:12:32',98,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(392,'2022-05-29 23:12:32',98,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(393,'2022-05-29 23:13:13',99,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(394,'2022-05-29 23:13:13',99,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','alumbrado','Alumbrado Lavanderia','0',0,0),(395,'2022-05-29 23:13:13',99,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(396,'2022-05-29 23:13:13',99,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(397,'2022-06-03 15:20:38',101,NULL,'SD',0,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado led perimetro pasillo','0',0,0),(398,'2022-06-03 15:20:38',101,NULL,'SD',1,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado focos techo centro comedor','0',0,0),(399,'2022-06-03 15:20:39',101,NULL,'SD',2,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado focos techo laterales comedor','0',0,0),(400,'2022-06-03 15:20:39',101,NULL,'SD',3,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado focos techo pasillo sala tv','0',0,0),(401,'2022-06-03 15:20:39',101,NULL,'SD',4,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado focos techo pasillo habitaciones','0',0,0),(402,'2022-06-03 15:20:39',101,NULL,'SD',5,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado focos trecho sala tv','0',0,0),(403,'2022-06-03 15:20:39',101,NULL,'SD',6,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado focos terraza sala tv','0',0,0),(404,'2022-06-03 15:20:39',101,NULL,'SD',7,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado led terraza sala tv','0',0,0),(405,'2022-06-03 15:20:39',101,NULL,'SD',8,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado focos techo baño cortesia','0',0,0),(406,'2022-06-03 15:20:39',101,NULL,'SD',9,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado espejo techo baño cortesia','0',0,0),(407,'2022-06-03 15:20:40',101,NULL,'SD',10,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado led perimetro exterior entrada principal','0',0,0),(408,'2022-06-03 15:20:40',101,NULL,'SD',11,'Digital',NULL,NULL,NULL,'','','Alumbrado','Alumbrado led entrada principal','0',0,0),(409,'2022-06-03 15:20:40',101,NULL,'SD',12,'Digital',NULL,NULL,NULL,'','','iot','Enchufe tv sala tv','0',0,0),(410,'2022-06-03 15:20:40',101,NULL,'SD',13,'Digital',NULL,NULL,NULL,'','','iot','Enchufe pared sala tv','0',0,0),(411,'2022-06-03 15:20:40',101,NULL,'SD',14,'Digital',NULL,NULL,NULL,'','','iot','Enchufe comedor','0',0,0),(412,'2022-06-03 15:20:40',101,NULL,'SD',15,'Digital',NULL,NULL,NULL,'','','iot','Enchufe pasillo derecho','0',0,0),(413,'2022-06-03 15:20:40',102,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(414,'2022-06-03 15:20:41',102,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(415,'2022-06-03 15:20:41',102,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(416,'2022-06-03 15:20:41',102,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(417,'2022-06-03 15:23:26',104,NULL,'SD',0,'Digital',NULL,NULL,NULL,'','','Suelo radiante','Valvula suelo radiante comedor','0',0,0),(418,'2022-06-03 15:23:27',104,NULL,'SD',1,'Digital',NULL,NULL,NULL,'','','Suelo radiante','Valvula suelo radiante sala tv','0',0,0),(419,'2022-06-03 15:23:27',104,NULL,'SD',2,'Digital',NULL,NULL,NULL,'','','Suelo radiante','Bombilla suelo radiante comedor','0',0,0),(420,'2022-06-03 15:23:27',104,NULL,'SD',3,'Digital',NULL,NULL,NULL,'','','Suelo radiante','Bombilla suelo radiante sala tv','0',0,0),(421,'2022-06-03 15:23:27',104,NULL,'SD',4,'Digital',NULL,NULL,NULL,'','','Cuadro electrico','Desconexion usos varios','0',0,0),(422,'2022-06-03 15:23:27',104,NULL,'SD',5,'Digital',NULL,NULL,NULL,'','','Clima','Valvula suelo Radiante bar','0',0,0),(423,'2022-06-03 15:23:27',104,NULL,'SD',6,'Digital',NULL,NULL,NULL,'','','Clima','Valvula suelo Radiante sala cine','0',0,0),(424,'2022-06-03 15:23:27',104,NULL,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(425,'2022-06-03 15:23:27',104,NULL,NULL,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(426,'2022-06-03 15:23:27',104,NULL,NULL,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(427,'2022-06-03 15:23:27',104,NULL,NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(428,'2022-06-03 15:23:27',104,NULL,NULL,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(429,'2022-06-03 15:23:27',104,NULL,NULL,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(430,'2022-06-03 15:23:27',104,NULL,NULL,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(431,'2022-06-03 15:23:27',104,NULL,NULL,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(432,'2022-06-03 15:23:28',104,NULL,NULL,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(433,'2022-06-03 15:23:28',105,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(434,'2022-06-03 15:23:28',105,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(435,'2022-06-03 15:23:28',105,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(436,'2022-06-03 15:23:28',105,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(437,'2022-06-04 17:52:22',107,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(438,'2022-06-04 17:52:22',107,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado led perimetro pasillo','0',0,0),(439,'2022-06-04 17:52:22',107,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(440,'2022-06-04 17:52:22',107,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(441,'2022-06-04 17:53:10',108,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(442,'2022-06-04 17:53:10',108,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado focos techo centro comedor','0',0,0),(443,'2022-06-04 17:53:10',108,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(444,'2022-06-04 17:53:10',108,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(445,'2022-06-04 17:59:03',109,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(446,'2022-06-04 17:59:04',109,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado focos techo laterales comedor','0',0,0),(447,'2022-06-04 17:59:04',109,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(448,'2022-06-04 17:59:04',109,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(449,'2022-06-04 17:59:32',110,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(450,'2022-06-04 17:59:32',110,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado focos techo pasillo sala tv','0',0,0),(451,'2022-06-04 17:59:32',110,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(452,'2022-06-04 17:59:32',110,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(453,'2022-06-04 18:02:24',111,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(454,'2022-06-04 18:02:24',111,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado  focos techo pasillo habitaciones','0',0,0),(455,'2022-06-04 18:02:24',111,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(456,'2022-06-04 18:02:24',111,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(457,'2022-06-04 18:09:09',112,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(458,'2022-06-04 18:09:09',112,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado focos techo sala tv','0',0,0),(459,'2022-06-04 18:09:09',112,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(460,'2022-06-04 18:09:09',112,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(461,'2022-06-04 18:10:59',113,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(462,'2022-06-04 18:10:59',113,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado focos terraza sala tv','0',0,0),(463,'2022-06-04 18:10:59',113,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(464,'2022-06-04 18:10:59',113,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(465,'2022-06-04 18:11:41',114,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(466,'2022-06-04 18:11:41',114,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado led terraza sala tv','0',0,0),(467,'2022-06-04 18:11:41',114,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(468,'2022-06-04 18:11:41',114,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(469,'2022-06-04 18:12:35',115,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(470,'2022-06-04 18:12:35',115,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado focos techo baño cortesia','0',0,0),(471,'2022-06-04 18:12:36',115,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(472,'2022-06-04 18:12:36',115,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(473,'2022-06-04 18:13:43',116,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(474,'2022-06-04 18:13:43',116,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado espejo baño cortesia','0',0,0),(475,'2022-06-04 18:13:43',116,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(476,'2022-06-04 18:13:43',116,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(477,'2022-06-04 18:14:28',117,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(478,'2022-06-04 18:14:28',117,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado led perimetro exterior entrada principal','0',0,0),(479,'2022-06-04 18:14:28',117,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(480,'2022-06-04 18:14:28',117,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(481,'2022-06-04 18:15:07',118,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(482,'2022-06-04 18:15:07',118,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado led entrada principal','0',0,0),(483,'2022-06-04 18:15:07',118,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(484,'2022-06-04 18:15:07',118,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(485,'2022-06-20 18:40:17',122,NULL,'Rts',0,'Analógica','Control Posicion',NULL,NULL,'','','posicion','Ducha Alejandro Hab Principal','0',0,0),(486,'2022-06-20 18:40:17',122,NULL,'Rts',1,'Analógica','Dim oscuridad',NULL,NULL,'','','oscuridad','Ducha Alejandro Hab Principal','0',0,0),(487,'2022-06-20 18:43:24',123,NULL,'Rts',0,'Analógica','Control Posicion',NULL,NULL,'','','posicion','Inodoro Alejandro Hab principal','0',0,0),(488,'2022-06-20 18:43:25',123,NULL,'Rts',1,'Analógica','Dim oscuridad',NULL,NULL,'','','oscuridad','Inodoro Alejandro Hab Principal','0',0,0),(489,'2022-06-20 18:45:05',124,NULL,'Rts',0,'Analógica','Control Posicion',NULL,NULL,'','','posicion','Persiana derecha Hab Prin','0',0,0),(490,'2022-06-20 18:45:05',124,NULL,'Rts',1,'Analógica','Dim oscuridad',NULL,NULL,'','','oscuridad','Persiana derecha hab principal','0',0,0),(491,'2022-06-20 18:45:47',125,NULL,'Rts',0,'Analógica','Control Posicion',NULL,NULL,'','','posicion','Persiana izquierda hab principal','0',0,0),(492,'2022-06-20 18:45:47',125,NULL,'Rts',1,'Analógica','Dim oscuridad',NULL,NULL,'','','oscuridad','Persiana izquierda hab principal','0',0,0),(493,'2022-06-20 18:46:51',126,NULL,'Rts',0,'Analógica','Control Posicion',NULL,NULL,'','','posicion','Lateral habitacion principal','0',0,0),(494,'2022-06-20 18:46:51',126,NULL,'Rts',1,'Analógica','Dim oscuridad',NULL,NULL,'','','oscuridad','Lateral habitacion principal','0',0,0),(495,'2022-06-20 18:47:32',127,NULL,'Rts',0,'Analógica','Control Posicion',NULL,NULL,'','','posicion','Vestibulo baño hab principal','0',0,0),(496,'2022-06-20 18:47:32',127,NULL,'Rts',1,'Analógica','Dim oscuridad',NULL,NULL,'','','oscuridad','Vestibulo baño habitacion principal','0',0,0),(497,'2022-06-20 18:50:12',128,NULL,'Rts',0,'Analógica','Control Posicion',NULL,NULL,'','','posicion','izquierda habitacion Rachel','0',0,0),(498,'2022-06-20 18:50:12',128,NULL,'Rts',1,'Analógica','Dim oscuridad',NULL,NULL,'','','oscuridad','izquierda habitacion Rachel','0',0,0),(499,'2022-06-20 18:51:05',129,NULL,'Rts',0,'Analógica','Control Posicion',NULL,NULL,'','','posicion','derecha habitacion Rachel','0',0,0),(500,'2022-06-20 18:51:05',129,NULL,'Rts',1,'Analógica','Dim oscuridad',NULL,NULL,'','','oscuridad','derecha habitacion Rachel','0',0,0),(501,'2022-06-20 18:51:50',130,NULL,'Rts',0,'Analógica','Control Posicion',NULL,NULL,'','','posicion','baño habitacion Rachel','0',0,0),(502,'2022-06-20 18:51:50',130,NULL,'Rts',1,'Analógica','Dim oscuridad',NULL,NULL,'','','oscuridad','baño habitacion Rachel','0',0,0),(503,'2022-06-20 19:14:38',132,NULL,'Somfy',0,'Analógica','Valor control posicion',NULL,NULL,'','','posicion','Habitation InvItados Sotano','0',0,0),(504,'2022-06-20 19:14:38',132,NULL,'Somfy',1,'Analógica','Nivel',NULL,NULL,'','','nivel','Habitation InvItados Sotano','0',0,0),(505,'2022-06-20 19:15:34',134,NULL,'Somfy',0,'Analógica','Valor control posicion',NULL,NULL,'','','posicion','Planta baja habitación 5','0',0,0),(506,'2022-06-20 19:15:34',134,NULL,'Somfy',1,'Analógica','Nivel',NULL,NULL,'','','nivel','Planta baja habitación 5','0',0,0),(507,'2022-06-20 19:16:00',136,NULL,'Somfy',0,'Analógica','Valor control posicion',NULL,NULL,'','','posicion','habitacion 3','0',0,0),(508,'2022-06-20 19:16:00',136,NULL,'Somfy',1,'Analógica','Nivel',NULL,NULL,'','','nivel','habitacion 3','0',0,0),(509,'2022-06-20 19:16:18',138,NULL,'Somfy',0,'Analógica','Valor control posicion',NULL,NULL,'','','posicion','posicion habitacion 4','0',0,0),(510,'2022-06-20 19:16:18',138,NULL,'Somfy',1,'Analógica','Nivel',NULL,NULL,'','','nivel','nivel habitacion 4','0',0,0),(511,'2022-06-20 19:16:35',140,NULL,'Somfy',0,'Analógica','Valor control posicion',NULL,NULL,'','','posicion','posicion habitacion 2','0',0,0),(512,'2022-06-20 19:16:35',140,NULL,'Somfy',1,'Analógica','Nivel',NULL,NULL,'','','nivel','nivel habitacion 2','0',0,0),(513,'2022-06-20 19:17:00',142,NULL,'Somfy',0,'Analógica','Valor control posicion',NULL,NULL,'','','posicion','posicion Vestidor Alejandro derecha','0',0,0),(514,'2022-06-20 19:17:00',142,NULL,'Somfy',1,'Analógica','Nivel',NULL,NULL,'','','nivel','nivel Vestidor Alejandro derecha','0',0,0),(515,'2022-06-20 19:17:20',144,NULL,'Somfy',0,'Analógica','Valor control posicion',NULL,NULL,'','','posicion','posicion Vestidor Alejandro izquierda','0',0,0),(516,'2022-06-20 19:17:20',144,NULL,'Somfy',1,'Analógica','Nivel',NULL,NULL,'','','nivel','nivel Vestidor Alejandro izquierda','0',0,0),(517,'2022-06-20 19:17:46',146,NULL,'Somfy',0,'Analógica','Valor control posicion',NULL,NULL,'','','posicion','posicion habitacion estudio izquieda','0',0,0),(518,'2022-06-20 19:17:46',146,NULL,'Somfy',1,'Analógica','Nivel',NULL,NULL,'','','nivel','nivel habitacion estudio izquieda','0',0,0),(519,'2022-06-20 19:18:06',148,NULL,'Somfy',0,'Analógica','Valor control posicion',NULL,NULL,'','','posicion','posicion habitacion estudio centro','0',0,0),(520,'2022-06-20 19:18:06',148,NULL,'Somfy',1,'Analógica','Nivel',NULL,NULL,'','','nivel','nivel habitacion estudio centro','0',0,0),(521,'2022-06-20 19:18:35',150,NULL,'Somfy',0,'Analógica','Valor control posicion',NULL,NULL,'','','posicion','posicion habitacion estudio derecha','0',0,0),(522,'2022-06-20 19:18:35',150,NULL,'Somfy',1,'Analógica','Nivel',NULL,NULL,'','','nivel','nivel habitacion estudio derecha','0',0,0),(523,'2022-06-22 22:39:27',152,NULL,'Somfy',0,'Analógica','Valor control posicion',NULL,NULL,'','','posciion','posicion habitacion servicio 1','0',0,0),(524,'2022-06-22 22:39:27',152,NULL,'Somfy',1,'Analógica','Nivel',NULL,NULL,'','','nivel','nivel habitacion servicio 1','0',0,0),(525,'2022-06-22 22:43:15',154,NULL,'Somfy',0,'Analógica','Valor control posicion',NULL,NULL,'','','posicion','posicion habitacion servicio 2','0',0,0),(526,'2022-06-22 22:43:15',154,NULL,'Somfy',1,'Analógica','Nivel',NULL,NULL,'','','nivel','nivel habitacion servicio 2','0',0,0),(527,'2022-06-22 22:56:17',156,NULL,'SD',0,'Digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo vestibulo','0',0,0),(528,'2022-06-22 22:56:17',156,NULL,'SD',1,'Digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo cabecero Hab. Alejandro','0',0,0),(529,'2022-06-22 22:56:17',156,NULL,'SD',2,'Digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo Hab. Alejandro','0',0,0),(530,'2022-06-22 22:56:17',156,NULL,'SD',3,'Digital',NULL,NULL,NULL,'','','Alumbrado','Led Hab. Alejandro','0',0,0),(531,'2022-06-22 22:56:17',156,NULL,'SD',4,'Digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo Baño Alejandro','0',0,0),(532,'2022-06-22 22:56:17',156,NULL,'SD',5,'Digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo inodoro Baño Alejandro','0',0,0),(533,'2022-06-22 22:56:17',156,NULL,'SD',6,'Digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo espejo Baño Alejandro','0',0,0),(534,'2022-06-22 22:56:17',156,NULL,'SD',7,'Digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo jacuzzi Baño Alejando','0',0,0),(535,'2022-06-22 22:56:17',156,NULL,'SD',8,'Digital',NULL,NULL,NULL,'','','Alumbrado','Led jacuzzi Baño Alejandro','0',0,0),(536,'2022-06-22 22:56:17',156,NULL,'SD',9,'Digital',NULL,NULL,NULL,'','','Alumbrado','Led vestidor Alejandro','0',0,0),(537,'2022-06-22 22:56:17',156,NULL,'SD',10,'Digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo Habitacion Rachel','0',0,0),(538,'2022-06-22 22:56:17',156,NULL,'SD',11,'Digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo escritorio Hab. Rachel','0',0,0),(539,'2022-06-22 22:56:17',156,NULL,'SD',12,'Digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo baño Hab. Rachel','0',0,0),(540,'2022-06-22 22:56:17',156,NULL,'SD',13,'Digital',NULL,NULL,NULL,'','','Alumbrado','Led espejo baño Hab. Rachel','0',0,0),(541,'2022-06-22 22:56:17',156,NULL,'SD',14,'Digital',NULL,NULL,NULL,'','','Alumbrado','Led vestidor H.Rachel','0',0,0),(542,'2022-06-22 22:56:17',156,NULL,'SD',15,'Digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo terraza Hab. Rachel','0',0,0),(543,'2022-06-22 22:56:17',157,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(544,'2022-06-22 22:56:17',157,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(545,'2022-06-22 22:56:17',157,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(546,'2022-06-22 22:56:18',157,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(547,'2022-06-22 23:13:12',158,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(548,'2022-06-22 23:13:12',158,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Focos techo vestibulo','0',0,0),(549,'2022-06-22 23:13:12',158,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(550,'2022-06-22 23:13:12',158,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(551,'2022-06-22 23:13:51',159,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(552,'2022-06-22 23:13:51',159,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Focos techo cabecero Hab. Alejandro','0',0,0),(553,'2022-06-22 23:13:51',159,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(554,'2022-06-22 23:13:51',159,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(555,'2022-06-22 23:14:23',160,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(556,'2022-06-22 23:14:23',160,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Focos techo Hab. Alejandro','0',0,0),(557,'2022-06-22 23:14:23',160,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(558,'2022-06-22 23:14:23',160,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(559,'2022-06-22 23:14:49',161,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(560,'2022-06-22 23:14:49',161,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Led Hab. Alejandro','0',0,0),(561,'2022-06-22 23:14:49',161,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(562,'2022-06-22 23:14:49',161,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(563,'2022-06-22 23:15:18',162,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(564,'2022-06-22 23:15:18',162,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Focos techo Baño Hab Alejandro','0',0,0),(565,'2022-06-22 23:15:18',162,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(566,'2022-06-22 23:15:18',162,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(567,'2022-06-22 23:15:47',163,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(568,'2022-06-22 23:15:47',163,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Focos techo inodoro Baño Alejandro','0',0,0),(569,'2022-06-22 23:15:47',163,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(570,'2022-06-22 23:15:47',163,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(571,'2022-06-22 23:16:15',164,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(572,'2022-06-22 23:16:15',164,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Focos espejo Baño Alejandro','0',0,0),(573,'2022-06-22 23:16:15',164,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(574,'2022-06-22 23:16:15',164,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(575,'2022-06-22 23:16:39',165,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(576,'2022-06-22 23:16:39',165,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Focos techo jacuzzi Baño Alejandro','0',0,0),(577,'2022-06-22 23:16:39',165,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(578,'2022-06-22 23:16:39',165,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(579,'2022-06-22 23:17:59',166,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(580,'2022-06-22 23:17:59',166,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Led Jacuzzi Baño Alejandro','0',0,0),(581,'2022-06-22 23:17:59',166,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(582,'2022-06-22 23:17:59',166,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(583,'2022-06-22 23:18:28',167,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(584,'2022-06-22 23:18:29',167,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Led vestidor Alejandro','0',0,0),(585,'2022-06-22 23:18:29',167,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(586,'2022-06-22 23:18:29',167,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(587,'2022-06-22 23:18:57',168,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(588,'2022-06-22 23:18:57',168,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Focos techo Hab. Rachel','0',0,0),(589,'2022-06-22 23:18:57',168,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(590,'2022-06-22 23:18:57',168,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(591,'2022-06-22 23:19:22',169,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(592,'2022-06-22 23:19:22',169,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Focos techo escritorio Hab Rachel','0',0,0),(593,'2022-06-22 23:19:22',169,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(594,'2022-06-22 23:19:22',169,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(595,'2022-06-22 23:19:47',170,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(596,'2022-06-22 23:19:47',170,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Focos techo baño Hab. Rachel','0',0,0),(597,'2022-06-22 23:19:47',170,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(598,'2022-06-22 23:19:47',170,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(599,'2022-06-22 23:20:13',171,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(600,'2022-06-22 23:20:13',171,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Led espejo baño  Hab. Rachel','0',0,0),(601,'2022-06-22 23:20:13',171,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(602,'2022-06-22 23:20:13',171,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(603,'2022-06-22 23:20:37',172,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(604,'2022-06-22 23:20:37',172,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Led vestidor Hab. Rachel','0',0,0),(605,'2022-06-22 23:20:37',172,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(606,'2022-06-22 23:20:37',172,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(607,'2022-06-22 23:21:01',173,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(608,'2022-06-22 23:21:01',173,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Focos terraza Hab Rachel','0',0,0),(609,'2022-06-22 23:21:01',173,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(610,'2022-06-22 23:21:01',173,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(611,'2022-06-22 23:45:59',181,NULL,'SD',0,'Digital',NULL,NULL,NULL,'','','multimedia','Abrir tv techo','0',0,0),(612,'2022-06-22 23:45:59',181,NULL,'SD',1,'Digital',NULL,NULL,NULL,'','','multimedia','Cerrar tv techo','0',0,0),(613,'2022-06-22 23:45:59',181,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(614,'2022-06-22 23:45:59',181,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(615,'2022-06-22 23:45:59',181,NULL,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(616,'2022-06-22 23:45:59',181,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(617,'2022-06-22 23:45:59',181,NULL,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(618,'2022-06-22 23:45:59',181,NULL,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(619,'2022-06-22 23:45:59',181,NULL,'SD',8,'Digital',NULL,NULL,NULL,'','','iot','Enchufe TV Hab. Alejandro','0',0,0),(620,'2022-06-22 23:45:59',181,NULL,'SD',9,'Digital',NULL,NULL,NULL,'','','iot','Enchufe cabecero Izq. Hab. Rachel','0',0,0),(621,'2022-06-22 23:45:59',181,NULL,'SD',10,'Digital',NULL,NULL,NULL,'','','iot','Enchufe cabecero Derecho Hab. Rachel','0',0,0),(622,'2022-06-22 23:45:59',181,NULL,'SD',11,'Digital',NULL,NULL,NULL,'','','iot','Enchufe cabecero Izq. Hab. Alejandro','0',0,0),(623,'2022-06-22 23:45:59',181,NULL,'SD',12,'Digital',NULL,NULL,NULL,'','','iot','Enchufe cabecero Derecha Hab. Alejandro','0',0,0),(624,'2022-06-22 23:46:00',181,NULL,'SD',13,'Digital',NULL,NULL,NULL,'','','Alumbrado','Led Armarios vestidor Rachel','0',0,0),(625,'2022-06-22 23:46:00',181,NULL,'SD',14,'Digital',NULL,NULL,NULL,'','','Alumbrado','Led Armarios vestidor Alejandro','0',0,0),(626,'2022-06-22 23:46:00',181,NULL,'SD',15,'Digital',NULL,NULL,NULL,'','','Alumbrado','Led Terraza Hab. Rachel','0',0,0),(627,'2022-06-22 23:46:00',182,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(628,'2022-06-22 23:46:00',182,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(629,'2022-06-22 23:46:00',182,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(630,'2022-06-22 23:46:01',182,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(639,'2022-06-22 23:59:24',183,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(640,'2022-06-22 23:59:24',183,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado',' Led Terraza Habitacion Rachel','0',0,0),(641,'2022-06-22 23:59:24',183,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(642,'2022-06-22 23:59:24',183,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(643,'2022-06-23 01:17:18',185,NULL,'SD',0,'Digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo cocina Principal','0',0,0),(644,'2022-06-23 01:17:18',185,NULL,'SD',1,'Digital',NULL,NULL,NULL,'','','Alumbrado','Led techo cocina Principal','0',0,0),(645,'2022-06-23 01:17:18',185,NULL,'SD',2,'Digital',NULL,NULL,NULL,'','','Alumbrado','Led Techo cocina Alejandro','0',0,0),(646,'2022-06-23 01:17:18',185,NULL,'SD',3,'Digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo armario frigorifico cocina Alejandro','0',0,0),(647,'2022-06-23 01:17:18',185,NULL,'SD',4,'Digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo comedor cocina Alejandro','0',0,0),(648,'2022-06-23 01:17:19',185,NULL,'SD',5,'Digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo vestibulo entrada cocina y entrada Alejandro','0',0,0),(649,'2022-06-23 01:17:19',185,NULL,'SD',6,'Digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo Ropero','0',0,0),(650,'2022-06-23 01:17:19',185,NULL,'SD',7,'Digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo Despensa','0',0,0),(651,'2022-06-23 01:17:19',185,NULL,'SD',8,'Digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo Puertas Pasillo Habitaciones','0',0,0),(652,'2022-06-23 01:17:19',185,NULL,'SD',9,'Digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo pasillo Habitaciones','0',0,0),(653,'2022-06-23 01:17:19',185,NULL,'SD',10,'Digital',NULL,NULL,NULL,'','','Alumbrado','Focos escalera servicio','0',0,0),(654,'2022-06-23 01:17:19',185,NULL,'SD',11,'Digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo zona juegos','0',0,0),(655,'2022-06-23 01:17:19',185,NULL,'SD',12,'Digital',NULL,NULL,NULL,'','','clima','Accionamiento del piloto manual cocina alejandro','0',0,0),(656,'2022-06-23 01:17:19',185,NULL,'SD',13,'Digital',NULL,NULL,NULL,'','','clima','Accionamiento del piloto manual cocina principal','0',0,0),(657,'2022-06-23 01:17:19',185,NULL,NULL,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(658,'2022-06-23 01:17:19',185,NULL,NULL,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(659,'2022-06-23 01:17:19',186,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(660,'2022-06-23 01:17:20',186,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(661,'2022-06-23 01:17:20',186,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(662,'2022-06-23 01:17:20',186,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(663,'2022-06-23 01:31:24',191,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(664,'2022-06-23 01:31:24',191,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Focos techo cocina Principal','0',0,0),(665,'2022-06-23 01:31:24',191,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(666,'2022-06-23 01:31:24',191,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(667,'2022-06-23 01:32:32',192,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(668,'2022-06-23 01:32:32',192,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Led techo cocina Principal','0',0,0),(669,'2022-06-23 01:32:32',192,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(670,'2022-06-23 01:32:32',192,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(671,'2022-06-23 01:32:56',193,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(672,'2022-06-23 01:32:56',193,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Led techo cocina Alejandro','0',0,0),(673,'2022-06-23 01:32:56',193,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(674,'2022-06-23 01:32:56',193,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(675,'2022-06-23 01:33:36',194,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(676,'2022-06-23 01:33:36',194,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Focos techo armario frigorifico cocina Alejandro','0',0,0),(677,'2022-06-23 01:33:36',194,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(678,'2022-06-23 01:33:36',194,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(679,'2022-06-23 01:34:24',195,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(680,'2022-06-23 01:34:24',195,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Focos techo comedor cocina Alejandro','0',0,0),(681,'2022-06-23 01:34:24',195,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(682,'2022-06-23 01:34:24',195,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(683,'2022-06-23 01:34:57',196,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(684,'2022-06-23 01:34:57',196,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Focos techo Vestibulo entrada cocina y entrada','0',0,0),(685,'2022-06-23 01:34:57',196,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(686,'2022-06-23 01:34:58',196,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(687,'2022-06-23 01:35:26',197,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(688,'2022-06-23 01:35:27',197,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Focos techo ropero','0',0,0),(689,'2022-06-23 01:35:27',197,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(690,'2022-06-23 01:35:27',197,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(691,'2022-06-23 01:35:57',198,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(692,'2022-06-23 01:35:57',198,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Focos techo Despensa','0',0,0),(693,'2022-06-23 01:35:57',198,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(694,'2022-06-23 01:35:57',198,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(695,'2022-06-23 01:36:24',199,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(696,'2022-06-23 01:36:24',199,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Focos techo Puertas pasillo Habitaciones','0',0,0),(697,'2022-06-23 01:36:24',199,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(698,'2022-06-23 01:36:24',199,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(699,'2022-06-23 01:36:54',200,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(700,'2022-06-23 01:36:54',200,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Focos techo Pasillo habitaciones','0',0,0),(701,'2022-06-23 01:36:54',200,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(702,'2022-06-23 01:36:54',200,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(703,'2022-06-23 01:37:24',201,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(704,'2022-06-23 01:37:24',201,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Focos escalera Servicio','0',0,0),(705,'2022-06-23 01:37:24',201,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(706,'2022-06-23 01:37:24',201,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(707,'2022-06-23 01:38:21',202,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(708,'2022-06-23 01:38:21',202,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Focos techo zona juegos','0',0,0),(709,'2022-06-23 01:38:21',202,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(710,'2022-06-23 01:38:21',202,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(711,'2022-07-02 14:00:31',204,NULL,'Somfy',0,'Analógica','Valor control posicion',NULL,NULL,'','','','posicion estor hab servicio 2 izq','0',0,0),(712,'2022-07-02 14:00:32',204,NULL,'Somfy',1,'Analógica','Nivel',NULL,NULL,'','','','nivel estor hab servicio2 izq','0',0,0),(713,'2022-07-05 18:02:22',205,NULL,'Ibercomp',0,'Digital',NULL,NULL,NULL,'','','Clima','Valvula suelo radiante Hab Alejandro','0',0,0),(714,'2022-07-05 18:02:22',205,NULL,'Ibercomp',1,'Digital',NULL,NULL,NULL,'','','Clima','Valvula suelo radiante baño Alejandro','0',0,0),(715,'2022-07-05 18:02:22',205,NULL,'Ibercomp',2,'Digital',NULL,NULL,NULL,'','','Clima','Valvula suelo radiante vestidor alejandro','0',0,0),(716,'2022-07-05 18:02:22',205,NULL,'Ibercomp',3,'Digital',NULL,NULL,NULL,'','','Clima','Valvula suelo radiante Hab Rachel','0',0,0),(717,'2022-07-05 18:02:22',205,NULL,'Ibercomp',4,'Digital',NULL,NULL,NULL,'','','Clima','Valvula suelo radiante Baño Rachel','0',0,0),(718,'2022-07-05 18:02:22',205,NULL,'Ibercomp',5,'Digital',NULL,NULL,NULL,'','','Clima','Valvula suelo radiante vestidor Rachel','0',0,0),(719,'2022-07-05 18:02:22',205,NULL,'Ibercomp',6,'Digital',NULL,NULL,NULL,'','','Clima','Accionamiento del piloto manual Hab Alejandro (Bombilla)','0',0,0),(720,'2022-07-05 18:02:22',205,NULL,'Ibercomp',7,'Digital',NULL,NULL,NULL,'','','Clima','Accionamiento del piloto manual Baño Alejandro (Bombilla)','0',0,0),(721,'2022-07-05 20:56:44',206,NULL,'Ibercomp',0,'Digital',NULL,NULL,NULL,'','','Clima','Accionamiento del piloto manual Vestidor Alejandro (Bombilla)','0',0,0),(722,'2022-07-05 20:56:44',206,NULL,'Ibercomp',1,'Digital',NULL,NULL,NULL,'','','Clima','Accionamiento del piloto manual hab Rachel (Bombilla)','0',0,0),(723,'2022-07-05 20:56:44',206,NULL,'Ibercomp',2,'Digital',NULL,NULL,NULL,'','','Clima','Accionamiento del piloto manual baño Rachel (Bombilla)','0',0,0),(724,'2022-07-05 20:56:44',206,NULL,'Ibercomp',3,'Digital',NULL,NULL,NULL,'','','Clima','Accionamiento del piloto manual vestidor Rachel (Bombilla)','0',0,0),(725,'2022-07-05 20:56:44',206,NULL,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(726,'2022-07-05 20:56:44',206,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(727,'2022-07-05 20:56:44',206,NULL,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(728,'2022-07-05 20:56:44',206,NULL,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(729,'2022-07-05 21:46:31',209,NULL,'Ibercomp',0,'Digital',NULL,NULL,NULL,'','','Clima','Valvula suelo radiante biblioteca','0',0,0),(730,'2022-07-05 21:46:31',209,NULL,'Ibercomp',1,'Digital',NULL,NULL,NULL,'','','Clima','Valvula suelo radiante entrada ppal / comedor','0',0,0),(731,'2022-07-05 21:46:31',209,NULL,'Ibercomp',2,'Digital',NULL,NULL,NULL,'','','Clima','Valvula suelo rad pasillo habitaciones','0',0,0),(732,'2022-07-05 21:46:32',209,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(733,'2022-07-05 21:46:32',209,NULL,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(734,'2022-07-05 21:46:32',209,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(735,'2022-07-05 21:46:32',209,NULL,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(736,'2022-07-05 21:46:32',209,NULL,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(737,'2022-07-05 22:06:26',211,NULL,'Ibercomp',0,'Digital',NULL,NULL,NULL,'','','Clima','Valvula suelo radiante sala tv','0',0,0),(738,'2022-07-05 22:06:26',211,NULL,'Ibercomp',1,'Digital',NULL,NULL,NULL,'','','Clima','Valvula suelo radiante entrada / comedor','0',0,0),(739,'2022-07-05 22:06:26',211,NULL,'Ibercomp',2,'Digital',NULL,NULL,NULL,'','','Clima','Valvula suelo radiante cocina alejandro','0',0,0),(740,'2022-07-05 22:06:26',211,NULL,'Ibercomp',3,'Digital',NULL,NULL,NULL,'','','Clima','Valvula suelo radiante cocina principal','0',0,0),(741,'2022-07-05 22:06:26',211,NULL,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(742,'2022-07-05 22:06:26',211,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(743,'2022-07-05 22:06:26',211,NULL,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(744,'2022-07-05 22:06:26',211,NULL,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(745,'2022-07-07 17:22:54',309,NULL,NULL,0,NULL,'On/off del inversor de la sub-matriz','8002','trb1',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(746,'2022-07-07 17:22:54',309,NULL,NULL,1,NULL,'Establecer la potencia activa del inversor de la submatriz','8003','trb1',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(747,'2022-07-07 17:22:54',309,NULL,NULL,2,NULL,'Establecer la relacion de la potencia activa del inversor de la submatriz','8005','trb1',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(748,'2022-07-07 17:22:54',309,NULL,NULL,3,NULL,'Establecer la potencia reactiva del inversor de la submatriz','8007','trb1',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(749,'2022-07-07 17:22:54',309,NULL,NULL,4,NULL,'Establecer la relacion de la potencia reactiva del inversor de la submatriz','8009','trb1',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(750,'2022-07-07 17:22:54',309,NULL,NULL,5,NULL,'Establecer el factor de potencia del inversor de la submatriz','8011','trb1',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(751,'2022-07-12 00:53:52',312,NULL,'SD',0,'Digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo Gimnasio','0',0,0),(752,'2022-07-12 00:53:52',312,NULL,'SD',1,'Digital',NULL,NULL,NULL,'','','Alumbrado','Led techo Gimnasio','0',0,0),(753,'2022-07-12 00:53:52',312,NULL,'SD',2,'Digital',NULL,NULL,NULL,'','','Fancoil','Valvula 3 vias Fancoil','0',0,0),(754,'2022-07-12 00:53:52',312,NULL,'SD',3,'Digital',NULL,NULL,NULL,'','','Fancoil','Velocidad I Fancoil','0',0,0),(755,'2022-07-12 00:53:52',312,NULL,'SD',4,'Digital',NULL,NULL,NULL,'','','Fancoil','Velocidad II Fancoil','0',0,0),(756,'2022-07-12 00:53:52',312,NULL,'SD',5,'Digital',NULL,NULL,NULL,'','','Fancoil','Velocidad III Fancoil','0',0,0),(757,'2022-07-12 00:53:52',312,NULL,'SD',6,'Digital',NULL,NULL,NULL,'','','iot','Enchufe tv Gimnasio','0',0,0),(758,'2022-07-12 00:53:53',312,NULL,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(759,'2022-07-12 00:53:53',312,NULL,NULL,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(760,'2022-07-12 00:53:53',312,NULL,NULL,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(761,'2022-07-12 00:53:54',312,NULL,NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(762,'2022-07-12 00:53:54',312,NULL,NULL,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(763,'2022-07-12 00:53:54',312,NULL,NULL,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(764,'2022-07-12 00:53:54',312,NULL,NULL,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(765,'2022-07-12 00:53:55',312,NULL,NULL,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(766,'2022-07-12 00:53:55',312,NULL,NULL,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(767,'2022-07-12 00:53:55',313,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(768,'2022-07-12 00:53:55',313,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(769,'2022-07-12 00:53:55',313,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(770,'2022-07-12 00:53:55',313,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(771,'2022-07-12 00:55:13',315,NULL,'SD',0,'Digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo Vestibulo Piscina Interior','0',0,0),(772,'2022-07-12 00:55:13',315,NULL,'SD',1,'Digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo Baño 1 Piscina Interior','0',0,0),(773,'2022-07-12 00:55:13',315,NULL,'SD',2,'Digital',NULL,NULL,NULL,'','','Alumbrado','Led Espejo Baño 1 Piscina Interior','0',0,0),(774,'2022-07-12 00:55:13',315,NULL,'SD',3,'Digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo Baño 2 Piscina Interior','0',0,0),(775,'2022-07-12 00:55:13',315,NULL,'SD',4,'Digital',NULL,NULL,NULL,'','','Alumbrado','Led perimetro techo Piscina Interior','0',0,0),(776,'2022-07-12 00:55:14',315,NULL,'SD',5,'Digital',NULL,NULL,NULL,'','','Alumbrado','Led hamacas interiores Piscina interior','0',0,0),(777,'2022-07-12 00:55:14',315,NULL,'SD',6,'Digital',NULL,NULL,NULL,'','','Fancoil','Valvula 3 vias Fancoil','0',0,0),(778,'2022-07-12 00:55:14',315,NULL,'SD',7,'Digital',NULL,NULL,NULL,'','','Fancoil','Velocidad I Fancoil','0',0,0),(779,'2022-07-12 00:55:14',315,NULL,'SD',8,'Digital',NULL,NULL,NULL,'','','Fancoil','Velocidad II Fancoil','0',0,0),(780,'2022-07-12 00:55:14',315,NULL,'SD',9,'Digital',NULL,NULL,NULL,'','','Fancoil','Velocidad III Fancoil','0',0,0),(781,'2022-07-12 00:55:14',315,NULL,'SD',10,'Digital',NULL,NULL,NULL,'','','iot','Enchufe zona hamacas','0',0,0),(782,'2022-07-12 00:55:14',315,NULL,'SD',11,'Digital',NULL,NULL,NULL,'','','alumbrado','Led espejo baño2 piscina interior','0',0,0),(783,'2022-07-12 00:55:14',315,NULL,NULL,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(784,'2022-07-12 00:55:14',315,NULL,NULL,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(785,'2022-07-12 00:55:14',315,NULL,NULL,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(786,'2022-07-12 00:55:14',315,NULL,NULL,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(787,'2022-07-12 00:55:14',316,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(788,'2022-07-12 00:55:14',316,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(789,'2022-07-12 00:55:15',316,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(790,'2022-07-12 00:55:15',316,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(791,'2022-07-12 14:37:19',317,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(792,'2022-07-12 14:37:19',317,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado focos techo vestibulo H estudio','0',0,0),(793,'2022-07-12 14:37:19',317,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(794,'2022-07-12 14:37:19',317,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(795,'2022-07-12 14:37:19',317,NULL,'Dali',4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(796,'2022-07-12 15:01:20',318,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(797,'2022-07-12 15:01:20',318,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Alumbrado Escalera caracol oeste','0',0,0),(798,'2022-07-12 15:01:20',318,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(799,'2022-07-12 15:01:20',318,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(800,'2022-07-12 15:01:20',318,NULL,'Dali',4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(801,'2022-07-12 18:08:57',322,NULL,'SD',0,'Digital',NULL,NULL,NULL,'','','Alumbrado','Led Estudio','0',0,0),(802,'2022-07-12 18:08:57',322,NULL,'SD',1,'Digital',NULL,NULL,NULL,'','','Alumbrado','Led Chimenea estudio','0',0,0),(803,'2022-07-12 18:08:57',322,NULL,'SD',2,'Digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo Estudio','0',0,0),(804,'2022-07-12 18:08:57',322,NULL,'SD',3,'Digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo Chimenea estudio','0',0,0),(805,'2022-07-12 18:08:57',322,NULL,'SD',4,'Digital',NULL,NULL,NULL,'','','Alumbrado','Focos techo Sala Pecera','0',0,0),(806,'2022-07-12 18:08:57',322,NULL,'SD',5,'Digital',NULL,NULL,NULL,'','','Alumbrado','Focos Escalera caracol este','0',0,0),(807,'2022-07-12 18:08:57',322,NULL,'SD',6,'Digital',NULL,NULL,NULL,'','','Clima','Piloto del accionamiento Manual Estudio','0',0,0),(808,'2022-07-12 18:08:57',322,NULL,'SD',7,'Digital',NULL,NULL,NULL,'','','Clima','Piloto del accionamiento manual Pecera','0',0,0),(809,'2022-07-12 18:08:57',322,NULL,NULL,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(810,'2022-07-12 18:08:57',322,NULL,NULL,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(811,'2022-07-12 18:08:57',322,NULL,NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(812,'2022-07-12 18:08:57',322,NULL,NULL,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(813,'2022-07-12 18:08:59',322,NULL,NULL,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(814,'2022-07-12 18:09:00',322,NULL,NULL,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(815,'2022-07-12 18:09:01',322,NULL,NULL,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(816,'2022-07-12 18:09:01',322,NULL,NULL,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(817,'2022-07-12 18:09:01',323,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(818,'2022-07-12 18:09:01',323,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(819,'2022-07-12 18:09:01',323,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(820,'2022-07-12 18:09:01',323,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(826,'2022-07-13 04:33:46',326,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(827,'2022-07-13 04:33:46',326,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Led Estudio','0',0,0),(828,'2022-07-13 04:33:46',326,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(829,'2022-07-13 04:33:46',326,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(830,'2022-07-13 04:33:46',326,NULL,'Dali',4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(831,'2022-07-13 04:34:21',327,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(832,'2022-07-13 04:34:21',327,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Led Chimenea Estudio','0',0,0),(833,'2022-07-13 04:34:21',327,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(834,'2022-07-13 04:34:21',327,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(835,'2022-07-13 04:34:21',327,NULL,'Dali',4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(836,'2022-07-13 04:34:46',328,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(837,'2022-07-13 04:34:46',328,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Focos techo estudio','0',0,0),(838,'2022-07-13 04:34:46',328,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(839,'2022-07-13 04:34:46',328,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(840,'2022-07-13 04:34:47',328,NULL,'Dali',4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(841,'2022-07-13 04:35:20',329,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(842,'2022-07-13 04:35:20',329,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Focos techo chimenea estudio','0',0,0),(843,'2022-07-13 04:35:20',329,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(844,'2022-07-13 04:35:20',329,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(845,'2022-07-13 04:35:20',329,NULL,'Dali',4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(846,'2022-07-13 04:35:47',330,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(847,'2022-07-13 04:35:47',330,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Focos techo sala pecera','0',0,0),(848,'2022-07-13 04:35:47',330,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(849,'2022-07-13 04:35:47',330,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(850,'2022-07-13 04:35:47',330,NULL,'Dali',4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(851,'2022-07-13 04:36:22',331,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(852,'2022-07-13 04:36:22',331,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','Alumbrado','Focos techo escalera caracol este','0',0,0),(853,'2022-07-13 04:36:22',331,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(854,'2022-07-13 04:36:22',331,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(855,'2022-07-13 04:36:22',331,NULL,'Dali',4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(856,'2022-08-18 08:04:12',338,NULL,'Ibercomp',0,'Digital',NULL,NULL,NULL,'','','bomba','m/p bomba fuente entrada principal','0',0,0),(857,'2022-08-18 08:04:13',338,NULL,'Ibercomp',1,'Digital',NULL,NULL,NULL,'','','bomba','m/p bomba depuracion fuente entrada principal','0',0,0),(858,'2022-08-18 08:04:13',338,NULL,'Ibercomp',2,'Digital',NULL,NULL,NULL,'','','bomba','m/p bomba algicida fuente entrada principal','0',0,0),(859,'2022-08-18 08:04:13',338,NULL,'Ibercomp',3,'Digital',NULL,NULL,NULL,'','','alumbrado','m/p alumbrado fuente entrada principal','0',0,0),(860,'2022-08-18 08:04:13',338,NULL,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(861,'2022-08-18 08:04:14',338,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(862,'2022-08-18 08:04:15',338,NULL,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(863,'2022-08-18 08:04:15',338,NULL,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(864,'2022-08-18 08:05:22',340,NULL,'Ibercomp',0,'Digital',NULL,NULL,NULL,'','','bomba','m/p bomba fuente interior planta baja','0',0,0),(865,'2022-08-18 08:05:22',340,NULL,'Ibercomp',1,'Digital',NULL,NULL,NULL,'','','bomba','m/p bomba depuración fuente interior planta baja','0',0,0),(866,'2022-08-18 08:05:22',340,NULL,'Ibercomp',2,'Digital',NULL,NULL,NULL,'','','bomba','m/p bomba algicida fuente interior planta baja','0',0,0),(867,'2022-08-18 08:05:22',340,NULL,'Ibercomp',3,'Digital',NULL,NULL,NULL,'','','alumbrado','m/p alumbrado fuente interior planta baja','0',0,0),(868,'2022-08-18 08:05:22',340,NULL,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(869,'2022-08-18 08:05:22',340,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(870,'2022-08-18 08:05:22',340,NULL,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(871,'2022-08-18 08:05:22',340,NULL,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(872,'2022-08-18 08:22:17',342,NULL,'Ibercomp',0,'Digital',NULL,NULL,NULL,'','','bomba','m/p bomba fuente terraza sala cine','0',0,0),(873,'2022-08-18 08:22:17',342,NULL,'Ibercomp',1,'Digital',NULL,NULL,NULL,'','','bomba','m/p bomba depueracion fuente terraza sala cine','0',0,0),(874,'2022-08-18 08:22:17',342,NULL,'Ibercomp',2,'Digital',NULL,NULL,NULL,'','','bomba','m/p bomba algicida fuente terraza sala cine','0',0,0),(875,'2022-08-18 08:22:17',342,NULL,'Ibercomp',3,'Digital',NULL,NULL,NULL,'','','alumbrado','m/p alumbrado fuente terraza sala cine','0',0,0),(876,'2022-08-18 08:22:17',342,NULL,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(877,'2022-08-18 08:22:17',342,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(878,'2022-08-18 08:22:17',342,NULL,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(879,'2022-08-18 08:22:18',342,NULL,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(880,'2022-08-18 08:22:43',344,NULL,'Ibercomp',0,'Digital',NULL,NULL,NULL,'','','bomba','m/p bomba chorros lago jardin','0',0,0),(881,'2022-08-18 08:22:43',344,NULL,'Ibercomp',1,'Digital',NULL,NULL,NULL,'','','bomba','m/p bomba cascada lago jardin','0',0,0),(882,'2022-08-18 08:22:43',344,NULL,'Ibercomp',2,'Digital',NULL,NULL,NULL,'','','bomba','m/p bomba depuracion lago jardin','0',0,0),(883,'2022-08-18 08:22:43',344,NULL,'Ibercomp',3,'Digital',NULL,NULL,NULL,'','','bomba','m/p bomba algicida lago jardin','0',0,0),(884,'2022-08-18 08:22:43',344,NULL,'Ibercomp',4,'Digital',NULL,NULL,NULL,'','','alumbrado','m/p alumbrado lago jardin','0',0,0),(885,'2022-08-18 08:22:43',344,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(886,'2022-08-18 08:22:43',344,NULL,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(887,'2022-08-18 08:22:43',344,NULL,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(888,'2022-08-25 11:46:59',347,NULL,'Somfy',0,'Analógica','Valor control posicion',NULL,NULL,'','','','posicion estor cocina','0',0,0),(889,'2022-08-25 11:46:59',347,NULL,'Somfy',1,'Analógica','Nivel',NULL,NULL,'','','','nivel estor cocina','0',0,0),(890,'2022-08-30 08:58:05',488,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(891,'2022-08-30 08:58:05',488,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','','int rojo','0',0,0),(892,'2022-08-30 08:58:05',488,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(893,'2022-08-30 08:58:05',488,NULL,'Dali',3,'Analógica','Intensidad Completo',NULL,NULL,'','','alumbrado','rojo alumbrado RGB+W','0',0,0),(894,'2022-08-30 08:58:05',488,NULL,'Dali',4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(895,'2022-08-30 08:59:23',489,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(896,'2022-08-30 08:59:23',489,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','alumbrado','int azul  alumbrado RGB+W','0',0,0),(897,'2022-08-30 08:59:23',489,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(898,'2022-08-30 08:59:23',489,NULL,'Dali',3,'Analógica','Intensidad Completo',NULL,NULL,'','','alumbrado','azul  alumbrado RGB+W','0',0,0),(899,'2022-08-30 08:59:23',489,NULL,'Dali',4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(900,'2022-08-30 09:00:22',490,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(901,'2022-08-30 09:00:22',490,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','alumbrado','int verde  alumbrado RGB+W','0',0,0),(902,'2022-08-30 09:00:22',490,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(903,'2022-08-30 09:00:23',490,NULL,'Dali',3,'Analógica','Intensidad Completo',NULL,NULL,'','','alumbrado','verde alumbrado RGB+W','0',0,0),(904,'2022-08-30 09:00:23',490,NULL,'Dali',4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(905,'2022-08-30 09:01:27',491,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(906,'2022-08-30 09:01:27',491,NULL,'Dali',1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(907,'2022-08-30 09:01:27',491,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(908,'2022-08-30 09:01:27',491,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(909,'2022-08-30 09:01:27',491,NULL,'Dali',4,'Analógica','RGB+W',NULL,NULL,'','','alumbrado','temperatura  alumbrado RGB+W','0',0,0),(910,'2022-08-30 09:02:01',492,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(911,'2022-08-30 09:02:01',492,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','alumbrado','intensidad focos techo vestibulo','0',0,0),(912,'2022-08-30 09:02:01',492,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(913,'2022-08-30 09:02:01',492,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(914,'2022-08-30 09:02:01',492,NULL,'Dali',4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(915,'2022-08-30 23:47:57',494,NULL,NULL,0,NULL,'Nivel de produccion de ionizacion',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(916,'2022-08-30 23:47:57',494,NULL,NULL,1,NULL,'Cantidad de tiempo en minutos de ionizacion',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(917,'2022-08-30 23:47:58',494,NULL,NULL,2,NULL,'Nivel de produccion de hidrolisis',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(918,'2022-08-30 23:47:59',494,NULL,NULL,3,NULL,'Limite superior del sistema regulacion de ph',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(919,'2022-08-30 23:47:59',494,NULL,NULL,4,NULL,'Limite inferior del sistema regulacion de ph',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(920,'2022-08-30 23:48:00',494,NULL,NULL,5,NULL,'Punto de ajuste sistema regulacion redox',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(921,'2022-09-07 05:27:23',497,NULL,'SD',0,'Digital',NULL,NULL,NULL,'','','alumbrado','Alumbrado sala depuracion','0',0,0),(922,'2022-09-07 05:27:23',497,NULL,'SD',1,'Digital',NULL,NULL,NULL,'','','bombas','Maniobra  bomba cascada','0',0,0),(923,'2022-09-07 05:27:23',497,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(924,'2022-09-07 05:27:23',497,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(925,'2022-09-07 05:27:23',497,NULL,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(926,'2022-09-07 05:27:24',497,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(927,'2022-09-07 05:27:24',497,NULL,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(928,'2022-09-07 05:27:24',497,NULL,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(929,'2022-09-07 05:27:24',497,NULL,NULL,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(930,'2022-09-07 05:27:24',497,NULL,NULL,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(931,'2022-09-07 05:27:24',497,NULL,NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(932,'2022-09-07 05:27:24',497,NULL,NULL,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(933,'2022-09-07 05:27:24',497,NULL,NULL,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(934,'2022-09-07 05:27:24',497,NULL,NULL,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(935,'2022-09-07 05:27:24',497,NULL,NULL,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(936,'2022-09-07 05:27:24',497,NULL,NULL,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(937,'2022-09-07 05:27:24',498,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(938,'2022-09-07 05:27:24',498,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(939,'2022-09-07 05:27:24',498,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(940,'2022-09-07 05:27:25',498,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(941,'2022-09-07 05:37:23',500,NULL,'SD',0,'Digital',NULL,NULL,NULL,'','','alumbrado','Alumbrado Piscina Exterior','0',0,0),(942,'2022-09-07 05:37:24',500,NULL,'SD',1,'Digital',NULL,NULL,NULL,'','','alumbrado','Led Bañador Pared Piscina/Jardin','0',0,0),(943,'2022-09-07 05:37:24',500,NULL,'SD',2,'Digital',NULL,NULL,NULL,'','','clima','Maniobra calentamiento piscina exterior','0',0,0),(944,'2022-09-07 05:37:24',500,NULL,'SD',3,'Digital',NULL,NULL,NULL,'','','alumbrado','Led escaleras piscina jardin','0',0,0),(945,'2022-09-07 05:37:24',500,NULL,'SD',4,'Digital',NULL,NULL,NULL,'','','bombas','Maniobra bomba depuracion','0',0,0),(946,'2022-09-07 05:37:24',500,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(947,'2022-09-07 05:37:24',500,NULL,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(948,'2022-09-07 05:37:24',500,NULL,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(949,'2022-09-07 05:37:24',500,NULL,NULL,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(950,'2022-09-07 05:37:24',500,NULL,NULL,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(951,'2022-09-07 05:37:24',500,NULL,NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(952,'2022-09-07 05:37:24',500,NULL,NULL,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(953,'2022-09-07 05:37:24',500,NULL,NULL,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(954,'2022-09-07 05:37:24',500,NULL,NULL,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(955,'2022-09-07 05:37:25',500,NULL,NULL,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(956,'2022-09-07 05:37:25',500,NULL,NULL,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(957,'2022-09-07 05:37:25',501,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(958,'2022-09-07 05:37:25',501,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(959,'2022-09-07 05:37:25',501,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(960,'2022-09-07 05:37:25',501,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(961,'2022-09-08 10:08:10',502,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(962,'2022-09-08 10:08:10',502,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','alumbrado','intensidad focos techo baño1','0',0,0),(963,'2022-09-08 10:08:10',502,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(964,'2022-09-08 10:08:10',502,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(965,'2022-09-08 10:08:10',502,NULL,'Dali',4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(966,'2022-09-08 10:11:33',503,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(967,'2022-09-08 10:11:33',503,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','alumbrado','intensidad led espejo baño1','0',0,0),(968,'2022-09-08 10:11:33',503,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(969,'2022-09-08 10:11:33',503,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(970,'2022-09-08 10:11:33',503,NULL,'Dali',4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(971,'2022-09-08 10:12:12',504,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(972,'2022-09-08 10:12:12',504,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','alumbrado','intensidad focos techo baño 2','0',0,0),(973,'2022-09-08 10:12:12',504,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(974,'2022-09-08 10:12:12',504,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(975,'2022-09-08 10:12:12',504,NULL,'Dali',4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(976,'2022-09-08 10:12:46',505,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(977,'2022-09-08 10:12:46',505,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','alumbrado','intensidad led espejo baño2','0',0,0),(978,'2022-09-08 10:12:46',505,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(979,'2022-09-08 10:12:46',505,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(980,'2022-09-08 10:12:46',505,NULL,'Dali',4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(981,'2022-09-08 10:41:01',506,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(982,'2022-09-08 10:41:01',506,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','alumbrado','intensidad rojo  led hamacas','0',0,0),(983,'2022-09-08 10:41:01',506,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(984,'2022-09-08 10:41:01',506,NULL,'Dali',3,'Analógica','Intensidad Completo',NULL,NULL,'','','alumbrado','rojo led hamacas','0',0,0),(985,'2022-09-08 10:41:01',506,NULL,'Dali',4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(986,'2022-09-08 11:53:30',507,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(987,'2022-09-08 11:53:30',507,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','alumbrado','int verde hamacas','0',0,0),(988,'2022-09-08 11:53:31',507,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(989,'2022-09-08 11:53:31',507,NULL,'Dali',3,'Analógica','Intensidad Completo',NULL,NULL,'','','alumbrado','verde hamacas','0',0,0),(990,'2022-09-08 11:53:31',507,NULL,'Dali',4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(991,'2022-09-08 12:05:40',508,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(992,'2022-09-08 12:05:40',508,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','alumbrado','int azul hamacas','0',0,0),(993,'2022-09-08 12:05:40',508,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(994,'2022-09-08 12:05:40',508,NULL,'Dali',3,'Analógica','Intensidad Completo',NULL,NULL,'','','alumbrado','azul hamacas','0',0,0),(995,'2022-09-08 12:05:40',508,NULL,'Dali',4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(996,'2022-09-08 12:07:07',509,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(997,'2022-09-08 12:07:07',509,NULL,'Dali',1,NULL,'Intensidad',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(998,'2022-09-08 12:07:07',509,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(999,'2022-09-08 12:07:07',509,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1000,'2022-09-08 12:07:07',509,NULL,'Dali',4,'Analógica','RGB+W',NULL,NULL,'','','alumbrado','temperatura color hamacas','0',0,0),(1001,'2022-09-08 15:06:10',512,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1002,'2022-09-08 15:06:10',512,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','alumbrado','int led bañador piscina pared','0',0,0),(1003,'2022-09-08 15:06:10',512,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1004,'2022-09-08 15:06:10',512,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1005,'2022-09-08 15:06:10',512,NULL,'Dali',4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1006,'2022-09-08 17:27:05',522,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1007,'2022-09-08 17:27:05',522,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','alumbrado','intensidad focos techo gimnasio','0',0,0),(1008,'2022-09-08 17:27:05',522,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1009,'2022-09-08 17:27:06',522,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1010,'2022-09-08 17:27:06',522,NULL,'Dali',4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1011,'2022-09-08 17:27:35',523,NULL,'Dali',0,NULL,'Estado',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1012,'2022-09-08 17:27:35',523,NULL,'Dali',1,'Analógica','Intensidad',NULL,NULL,'','','alumbrado','intensidad led techo gimnasiio','0',0,0),(1013,'2022-09-08 17:27:35',523,NULL,'Dali',2,NULL,'RGB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1014,'2022-09-08 17:27:35',523,NULL,'Dali',3,NULL,'Intensidad Completo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1015,'2022-09-08 17:27:35',523,NULL,'Dali',4,NULL,'RGB+W',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1016,'2022-09-22 15:57:19',525,NULL,'Somfy',0,'Analógica','Valor control posicion',NULL,NULL,'','','','posicion estor baño alejandro','0',0,0),(1017,'2022-09-22 15:57:19',525,NULL,'Somfy',1,'Analógica','Nivel',NULL,NULL,'','','','nivel estor baño alejandro','0',0,0),(1018,'2022-10-04 08:46:18',527,NULL,NULL,0,NULL,'Nivel de produccion de ionizacion',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1019,'2022-10-04 08:46:18',527,NULL,NULL,1,NULL,'Cantidad de tiempo en minutos de ionizacion',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1020,'2022-10-04 08:46:18',527,NULL,NULL,2,NULL,'Nivel de produccion de hidrolisis',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1021,'2022-10-04 08:46:18',527,NULL,NULL,3,NULL,'Limite superior del sistema regulacion de ph',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1022,'2022-10-04 08:46:18',527,NULL,NULL,4,NULL,'Limite inferior del sistema regulacion de ph',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1023,'2022-10-04 08:46:18',527,NULL,NULL,5,NULL,'Punto de ajuste sistema regulacion redox',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tpss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trb_analizador`
--

DROP TABLE IF EXISTS `trb_analizador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trb_analizador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `borna` int(11) DEFAULT NULL,
  `valor` varchar(10) DEFAULT NULL,
  `codigo_rb` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trb_analizador`
--

LOCK TABLES `trb_analizador` WRITE;
/*!40000 ALTER TABLE `trb_analizador` DISABLE KEYS */;
INSERT INTO `trb_analizador` VALUES (1,'2022-07-07 16:51:40',0,NULL,306),(2,'2022-07-07 16:51:40',1,NULL,306),(3,'2022-07-07 16:51:41',2,NULL,306),(4,'2022-07-07 16:51:41',3,NULL,306),(5,'2022-07-07 16:51:41',4,NULL,306),(6,'2022-07-07 16:51:41',5,NULL,306),(7,'2022-07-07 16:51:41',6,NULL,306),(8,'2022-07-07 16:51:41',7,NULL,306),(9,'2022-07-07 16:51:41',8,NULL,306),(10,'2022-07-07 16:51:44',9,NULL,306),(11,'2022-07-07 16:51:44',10,NULL,306),(12,'2022-07-07 16:51:44',11,NULL,306),(13,'2022-07-07 16:51:44',12,NULL,306),(14,'2022-07-07 16:51:44',13,NULL,306),(15,'2022-07-07 16:51:44',14,NULL,306),(16,'2022-07-07 16:51:45',15,NULL,306),(17,'2022-07-07 16:51:45',16,NULL,306),(18,'2022-07-07 16:51:45',17,NULL,306),(19,'2022-07-07 16:51:45',18,NULL,306),(20,'2022-07-07 16:51:45',19,NULL,306),(21,'2022-07-07 16:51:45',20,NULL,306),(22,'2022-07-07 16:51:45',21,NULL,306),(23,'2022-07-07 16:51:45',22,NULL,306),(24,'2022-07-07 16:51:45',23,NULL,306),(25,'2022-07-07 16:51:45',24,NULL,306),(26,'2022-07-07 16:51:46',25,NULL,306),(27,'2022-07-07 16:51:46',26,NULL,306),(28,'2022-07-07 16:51:46',27,NULL,306),(29,'2022-07-07 16:51:46',28,NULL,306),(30,'2022-07-07 16:51:46',29,NULL,306),(31,'2022-07-07 16:51:46',30,NULL,306),(32,'2022-07-07 16:51:47',31,NULL,306),(33,'2022-07-07 16:51:47',32,NULL,306),(34,'2022-07-07 16:51:47',33,NULL,306),(35,'2022-07-07 16:51:47',34,NULL,306),(36,'2022-07-07 16:51:47',35,NULL,306),(37,'2022-07-07 16:51:47',36,NULL,306),(38,'2022-07-07 16:51:47',37,NULL,306),(39,'2022-07-07 16:51:47',38,NULL,306),(40,'2022-07-07 16:51:48',39,NULL,306),(41,'2022-07-07 16:51:48',40,NULL,306),(42,'2022-07-07 16:51:48',41,NULL,306),(43,'2022-07-07 16:51:48',42,NULL,306),(44,'2022-07-07 16:51:48',43,NULL,306),(45,'2022-07-07 16:51:48',44,NULL,306),(46,'2022-07-07 16:51:48',45,NULL,306),(47,'2022-07-07 16:51:48',46,NULL,306),(48,'2022-07-07 16:51:49',47,NULL,306),(49,'2022-07-07 16:51:49',48,NULL,306),(50,'2022-07-07 16:51:49',49,NULL,306),(51,'2022-07-07 16:51:49',50,NULL,306),(52,'2022-07-07 16:51:49',51,NULL,306),(53,'2022-07-07 16:51:49',52,NULL,306),(54,'2022-07-07 16:51:49',53,NULL,306),(55,'2022-07-07 16:51:50',54,NULL,306),(56,'2022-07-07 16:51:50',55,NULL,306),(57,'2022-07-07 16:51:50',56,NULL,306),(58,'2022-07-07 16:51:50',57,NULL,306),(59,'2022-07-07 16:51:50',58,NULL,306),(60,'2022-07-07 16:53:47',459,NULL,306),(61,'2022-07-07 16:53:47',460,NULL,306),(62,'2022-07-07 16:53:48',461,NULL,306),(63,'2022-07-07 16:53:48',462,NULL,306),(64,'2022-07-07 16:53:48',463,NULL,306),(65,'2022-07-07 16:53:49',464,NULL,306),(66,'2022-07-07 16:53:49',465,NULL,306),(67,'2022-07-07 16:53:49',466,NULL,306),(68,'2022-07-07 16:53:49',467,NULL,306),(69,'2022-07-07 16:53:49',468,NULL,306),(70,'2022-07-07 16:53:49',469,NULL,306),(71,'2022-07-07 16:53:49',470,NULL,306),(72,'2022-07-07 16:53:51',471,NULL,306),(73,'2022-07-07 16:53:51',472,NULL,306),(74,'2022-07-07 16:53:51',473,NULL,306),(75,'2022-07-07 16:53:51',474,NULL,306),(76,'2022-07-07 16:53:51',475,NULL,306),(77,'2022-07-07 16:53:51',476,NULL,306),(78,'2022-07-07 16:53:51',477,NULL,306),(79,'2022-07-07 16:53:51',478,NULL,306);
/*!40000 ALTER TABLE `trb_analizador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trb_iber_8ed_conv`
--

DROP TABLE IF EXISTS `trb_iber_8ed_conv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trb_iber_8ed_conv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `borna` int(11) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  `codigo_rb` int(11) DEFAULT NULL,
  `domo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trb_iber_8ed_conv`
--

LOCK TABLES `trb_iber_8ed_conv` WRITE;
/*!40000 ALTER TABLE `trb_iber_8ed_conv` DISABLE KEYS */;
INSERT INTO `trb_iber_8ed_conv` VALUES (1,'2022-07-05 21:32:11',0,NULL,207,0),(2,'2022-07-05 21:32:11',1,NULL,207,0),(3,'2022-07-05 21:32:11',2,NULL,207,0),(4,'2022-07-05 21:32:11',3,NULL,207,0),(5,'2022-07-05 21:32:11',4,NULL,207,0),(6,'2022-07-05 21:32:12',5,NULL,207,0),(7,'2022-07-05 21:32:12',6,NULL,207,2),(8,'2022-07-05 21:32:12',7,NULL,207,2),(9,'2022-07-05 21:35:33',0,NULL,208,2),(10,'2022-07-05 21:35:33',1,NULL,208,2),(11,'2022-07-05 21:35:33',2,NULL,208,2),(12,'2022-07-05 21:35:33',3,NULL,208,2),(13,'2022-07-05 21:35:33',4,NULL,208,0),(14,'2022-07-05 21:35:33',5,NULL,208,0),(15,'2022-07-05 21:35:34',6,NULL,208,0),(16,'2022-07-05 21:35:34',7,NULL,208,0),(17,'2022-09-26 09:27:06',0,0,210,2),(18,'2022-09-21 16:37:48',1,0,210,2),(19,'2022-09-25 18:35:21',2,0,210,0),(20,'2022-09-21 16:37:48',3,0,210,0),(21,'2022-09-21 16:37:48',4,0,210,0),(22,'2022-09-21 16:37:49',5,0,210,0),(23,'2022-09-21 16:37:48',6,0,210,0),(24,'2022-09-21 16:37:48',7,0,210,0),(25,'2022-09-23 19:07:34',0,0,212,2),(26,'2022-09-19 16:31:56',1,0,212,2),(27,'2022-10-03 07:32:16',2,0,212,2),(28,'2022-10-03 07:29:17',3,0,212,2),(29,'2022-09-19 16:31:56',4,0,212,0),(30,'2022-09-19 16:31:57',5,0,212,0),(31,'2022-09-19 16:31:56',6,0,212,0),(32,'2022-09-19 16:31:57',7,0,212,0),(33,'2022-08-18 09:08:40',0,NULL,339,0),(34,'2022-08-18 09:08:40',1,NULL,339,0),(35,'2022-08-18 09:08:40',2,NULL,339,0),(36,'2022-08-18 09:08:40',3,NULL,339,1),(37,'2022-08-18 09:08:40',4,NULL,339,0),(38,'2022-08-18 09:08:42',5,NULL,339,0),(39,'2022-08-18 09:08:44',6,NULL,339,0),(40,'2022-08-18 09:08:44',7,NULL,339,0),(41,'2022-08-18 09:34:42',0,NULL,341,0),(42,'2022-08-18 09:34:42',1,NULL,341,0),(43,'2022-08-18 09:34:42',2,NULL,341,0),(44,'2022-08-18 09:34:44',3,NULL,341,1),(45,'2022-08-18 09:34:44',4,NULL,341,0),(46,'2022-08-18 09:34:44',5,NULL,341,0),(47,'2022-08-18 09:34:44',6,NULL,341,0),(48,'2022-08-18 09:34:44',7,NULL,341,0),(49,'2022-08-18 10:10:01',0,NULL,343,0),(50,'2022-08-18 10:10:02',1,NULL,343,0),(51,'2022-08-18 10:10:02',2,NULL,343,0),(52,'2022-08-18 10:10:02',3,NULL,343,1),(53,'2022-08-18 10:10:02',4,NULL,343,0),(54,'2022-08-18 10:10:02',5,NULL,343,0),(55,'2022-08-18 10:10:04',6,NULL,343,0),(56,'2022-08-18 10:10:05',7,NULL,343,0),(57,'2022-08-18 10:20:26',0,NULL,345,0),(58,'2022-08-18 10:20:26',1,NULL,345,0),(59,'2022-08-18 10:20:26',2,NULL,345,0),(60,'2022-08-18 10:20:26',3,NULL,345,0),(61,'2022-08-18 10:20:26',4,NULL,345,1),(62,'2022-08-18 10:20:27',5,NULL,345,0),(63,'2022-08-18 10:20:27',6,NULL,345,0),(64,'2022-08-18 10:20:27',7,NULL,345,0);
/*!40000 ALTER TABLE `trb_iber_8ed_conv` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`fincahazard`@`localhost`*/ /*!50003 TRIGGER trigger_trb_iber_8ed_conv
   AFTER UPDATE ON trb_iber_8ed_conv
   FOR EACH ROW
   BEGIN


   DECLARE v_codigo_acceso int;
   DECLARE v_tp_abierto int;
   DECLARE v_tp_cerrado int;
   DECLARE v_valor_abierto int;
   DECLARE v_valor_cerrado int;

   IF NEW.domo = 1 THEN
      UPDATE luces SET estado = NEW.valor, fecha = now()
      WHERE id = (SELECT codigo_luces FROM relacion_luces WHERE rb_e_estado = NEW.codigo_rb AND codigo_tp_e_estado = NEW.id);
   ELSEIF NEW.domo = 2 THEN
      UPDATE clima SET estado = NEW.valor, fecha = now()
      WHERE id = (SELECT codigo_clima FROM relacion_clima WHERE rb_estado = NEW.codigo_rb AND codigo_tp_estado = NEW.id);
   ELSEIF NEW.domo = 4 THEN
      UPDATE iot SET estado = NEW.valor, fecha = now()
      WHERE id = (SELECT codigo_iot FROM relacion_iot WHERE rb_e_estado = NEW.codigo_rb AND codigo_tp_e_estado = NEW.id);
   ELSEIF NEW.domo = 5 THEN
      UPDATE seguridad SET estado = NEW.valor, fecha = now()
      WHERE id = (SELECT codigo_seguridad FROM relacion_seguridad WHERE rb_estado = NEW.codigo_rb AND codigo_tp_estado = NEW.id);
   ELSEIF NEW.domo = 6 THEN
      SELECT codigo_accesos, codigo_tp_abierto, codigo_tp_cerrado
      INTO v_codigo_acceso, v_tp_abierto, v_tp_cerrado
      FROM relacion_accesos
      WHERE ((rb_e_abrir = NEW.codigo_rb AND codigo_tp_e_abrir = NEW.id) OR
      (rb_e_cerrar = NEW.codigo_rb AND codigo_tp_e_cerrar = NEW.id)) ;

      IF (v_tp_abierto = -1 AND v_tp_cerrado = -1) THEN
         UPDATE accesos SET estado = NEW.valor, fecha = now()
         WHERE id = v_codigo_acceso;
      ELSE
         IF ( v_tp_abierto != -1 && v_tp_cerrado != -1) THEN
            SELECT valor
            INTO v_valor_abierto
            FROM trb_iber_8ed_conv WHERE id = v_tp_abierto;

            SELECT valor
            INTO v_valor_cerrado
            FROM trb_iber_8ed_conv WHERE id = v_tp_cerrado;

            IF (v_valor_abierto = 0 && v_valor_cerrado = 0) THEN
               UPDATE accesos SET estado = 2, fecha = now()
               WHERE id = v_codigo_acceso;
            ELSEIF (v_valor_abierto = 1 && v_valor_cerrado = 0) THEN
               UPDATE accesos SET estado = 1, fecha = now()
               WHERE id = v_codigo_acceso;
            ELSEIF (v_valor_abierto = 0 && v_valor_cerrado = 1) THEN
               UPDATE accesos SET estado = 0, fecha = now()
               WHERE id = v_codigo_acceso;
            END IF;
         ELSE
            UPDATE accesos SET estado = NEW.valor, fecha = now()
               WHERE id = v_codigo_acceso;
         END IF;
      END IF;
   ELSEIF NEW.domo = 9 THEN
      UPDATE automaticos SET estado = NEW.valor, fecha = now()
      WHERE rb_e_estado = NEW.codigo_rb AND codigo_tp_e_estado = NEW.id;
   END IF;

   END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `trb_iber_8sd_conv`
--

DROP TABLE IF EXISTS `trb_iber_8sd_conv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trb_iber_8sd_conv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `borna` int(11) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  `codigo_rb` int(11) DEFAULT NULL,
  `domo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trb_iber_8sd_conv`
--

LOCK TABLES `trb_iber_8sd_conv` WRITE;
/*!40000 ALTER TABLE `trb_iber_8sd_conv` DISABLE KEYS */;
INSERT INTO `trb_iber_8sd_conv` VALUES (1,'2022-07-15 08:34:20',0,1,205,0),(2,'2022-07-15 08:16:52',1,1,205,0),(3,'2022-07-05 20:52:10',2,NULL,205,0),(4,'2022-07-05 20:52:32',3,NULL,205,0),(5,'2022-07-05 20:52:54',4,NULL,205,0),(6,'2022-07-05 20:53:29',5,NULL,205,0),(7,'2022-10-02 15:31:54',6,1,205,2),(8,'2022-10-02 15:35:15',7,1,205,2),(9,'2022-07-05 21:28:30',0,NULL,206,2),(10,'2022-07-05 21:29:20',1,NULL,206,2),(11,'2022-07-05 21:29:42',2,NULL,206,2),(12,'2022-07-05 21:30:00',3,NULL,206,2),(13,'2022-09-26 09:28:37',0,0,209,0),(14,'2022-07-05 21:47:22',1,NULL,209,0),(15,'2022-09-23 19:07:31',0,1,211,0),(16,'2022-07-05 22:07:11',1,NULL,211,0),(17,'2022-10-03 07:32:13',2,1,211,0),(18,'2022-10-03 07:29:14',3,1,211,0),(19,'2022-09-25 18:35:18',2,1,209,0),(20,'2022-08-18 09:03:09',0,NULL,338,0),(21,'2022-08-18 09:03:31',1,NULL,338,0),(22,'2022-08-18 09:03:55',2,NULL,338,0),(23,'2022-08-18 09:04:46',3,NULL,338,1),(24,'2022-08-18 09:31:19',0,NULL,340,0),(25,'2022-08-18 09:31:44',1,NULL,340,0),(26,'2022-08-18 09:32:03',2,NULL,340,0),(27,'2022-08-18 09:32:25',3,NULL,340,1),(28,'2022-08-18 10:07:57',0,NULL,342,0),(29,'2022-08-18 10:08:18',1,NULL,342,0),(30,'2022-08-18 10:08:40',2,NULL,342,0),(31,'2022-08-18 10:08:58',3,NULL,342,1),(32,'2022-08-18 10:17:59',0,NULL,344,0),(33,'2022-08-18 10:18:44',1,NULL,344,0),(34,'2022-08-18 10:19:09',2,NULL,344,0),(35,'2022-08-18 10:19:34',3,NULL,344,0),(36,'2022-08-18 10:19:50',4,NULL,344,1);
/*!40000 ALTER TABLE `trb_iber_8sd_conv` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`fincahazard`@`localhost`*/ /*!50003 TRIGGER trigger_trb_iber_8sd_conv
   AFTER UPDATE ON trb_iber_8sd_conv
   FOR EACH ROW
   BEGIN

   IF NEW.domo = 1 THEN
      UPDATE luces SET estado = NEW.valor, fecha = now()
      WHERE id = (SELECT codigo_luces FROM relacion_luces WHERE rb_s_estado = NEW.codigo_rb AND codigo_tp_s_estado = NEW.id);
   ELSEIF NEW.domo = 2 THEN
      UPDATE clima SET estado = NEW.valor, fecha = now()
      WHERE id = (SELECT codigo_clima FROM relacion_clima WHERE rb_estado = NEW.codigo_rb AND codigo_tp_estado = NEW.id);
   ELSEIF NEW.domo = 4 THEN
      UPDATE iot SET estado = NEW.valor, fecha = now()
      WHERE id = (SELECT codigo_iot FROM relacion_iot WHERE rb_s_estado = NEW.codigo_rb AND codigo_tp_s_estado = NEW.id);
   ELSEIF NEW.domo = 6 THEN
      UPDATE accesos SET estado = NEW.valor, fecha = now()
      WHERE id = (SELECT codigo_accesos FROM relacion_accesos
      WHERE (rb_s_abrir = NEW.codigo_rb AND codigo_tp_s_abrir = NEW.id) OR
      (rb_s_cerrar = NEW.codigo_rb AND codigo_tp_s_cerrar = NEW.id));
   ELSEIF NEW.domo = 9 THEN
      UPDATE automaticos SET estado = NEW.valor, fecha = now()
      WHERE rb_s_estado = NEW.codigo_rb AND codigo_tp_s_estado = NEW.id;
   END IF;

   END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `trb_ibercomp_sonda`
--

DROP TABLE IF EXISTS `trb_ibercomp_sonda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trb_ibercomp_sonda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `borna` int(11) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `codigo_rb` int(11) DEFAULT NULL,
  `domo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trb_ibercomp_sonda`
--

LOCK TABLES `trb_ibercomp_sonda` WRITE;
/*!40000 ALTER TABLE `trb_ibercomp_sonda` DISABLE KEYS */;
INSERT INTO `trb_ibercomp_sonda` VALUES (1,'2022-09-08 16:31:59',0,NULL,519,0),(2,'2022-09-08 16:31:59',1,NULL,519,0);
/*!40000 ALTER TABLE `trb_ibercomp_sonda` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`fincahazard`@`%`*/ /*!50003 TRIGGER trigger_trb_ibercomp_sonda
   AFTER UPDATE ON trb_ibercomp_sonda
   FOR EACH ROW
   BEGIN

   IF NEW.domo = 2 THEN
      CASE
         WHEN NEW.borna = 0 THEN
            UPDATE clima SET temperatura = NEW.valor, fecha = now()
            WHERE id = (SELECT codigo_clima FROM relacion_clima WHERE rb_temp = NEW.codigo_rb AND codigo_tp_temp = NEW.id);
         WHEN NEW.borna = 1 THEN
            UPDATE clima SET humedad = NEW.valor, fecha = now()
            WHERE id = (SELECT codigo_clima FROM relacion_clima WHERE rb_humedad = NEW.codigo_rb AND codigo_tp_humedad = NEW.id);
         ELSE
            BEGIN
            END;
      END CASE;
   END IF;

   END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `trb_md02`
--

DROP TABLE IF EXISTS `trb_md02`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trb_md02` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `borna` int(11) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `codigo_rb` int(11) DEFAULT NULL,
  `domo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trb_md02`
--

LOCK TABLES `trb_md02` WRITE;
/*!40000 ALTER TABLE `trb_md02` DISABLE KEYS */;
INSERT INTO `trb_md02` VALUES (1,'2022-09-19 16:26:38',0,0,487,0),(2,'2022-09-19 16:26:37',1,0,487,2);
/*!40000 ALTER TABLE `trb_md02` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`fincahazard`@`localhost`*/ /*!50003 TRIGGER trigger_trb_md02
   AFTER UPDATE ON trb_md02
   FOR EACH ROW
   BEGIN

   IF NEW.domo = 2 THEN
      CASE
         WHEN NEW.borna = 0 THEN
            UPDATE clima SET temperatura = NEW.valor, fecha = now()
            WHERE id = (SELECT codigo_clima FROM relacion_clima WHERE rb_temp = NEW.codigo_rb AND codigo_tp_temp = NEW.id);
         WHEN NEW.borna = 1 THEN
            UPDATE clima SET humedad = NEW.valor, fecha = now()
            WHERE id = (SELECT codigo_clima FROM relacion_clima WHERE rb_humedad = NEW.codigo_rb AND codigo_tp_humedad = NEW.id);
         ELSE
            BEGIN
            END;
      END CASE;
   END IF;

   END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `trb_rasp_dali_e`
--

DROP TABLE IF EXISTS `trb_rasp_dali_e`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trb_rasp_dali_e` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `borna` int(11) DEFAULT NULL,
  `valor` varchar(15) DEFAULT NULL,
  `codigo_rb` int(11) DEFAULT NULL,
  `domo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trb_rasp_dali_e`
--

LOCK TABLES `trb_rasp_dali_e` WRITE;
/*!40000 ALTER TABLE `trb_rasp_dali_e` DISABLE KEYS */;
INSERT INTO `trb_rasp_dali_e` VALUES (1,'2022-09-30 14:53:58',3,'0',216,0),(2,'2022-10-02 02:45:27',3,'0',217,0),(3,'2022-10-02 23:10:41',3,'0',218,0),(4,'2022-10-02 02:50:42',3,'0',219,0),(5,'2022-10-02 11:03:09',3,'0',220,0),(6,'2022-10-03 01:52:49',3,'0',221,0),(7,'2022-10-03 07:24:20',3,'0',222,0),(8,'2022-10-03 01:52:39',3,'0',223,0),(9,'2022-10-02 11:09:03',3,'0',224,0),(10,'2022-10-02 19:24:22',3,'0',225,0),(11,'2022-10-02 18:39:43',3,'0',226,0),(12,'2022-10-02 18:09:12',3,'0',227,0),(13,'2022-10-01 20:13:00',3,'0',228,0),(14,'2022-10-03 07:11:23',3,'0',229,0),(15,'2022-10-01 20:18:14',3,'0',230,0),(16,'2022-10-01 13:40:59',3,'0',231,0),(17,'2022-09-23 13:22:39',3,'0',232,0),(18,'2022-09-14 03:17:08',3,'0',233,0),(19,'2022-09-16 05:03:17',3,'0',234,0),(20,'2022-09-17 03:48:50',3,'0',235,0),(21,'2022-09-15 22:43:09',3,'0',236,0),(22,'2022-09-11 21:35:55',3,'0',237,0),(23,'2022-08-31 19:28:47',3,'0',238,0),(24,'2022-09-16 07:08:21',3,'0',239,0),(25,'2022-09-16 03:33:17',3,'0',240,0),(26,'2022-09-14 20:57:35',3,'0',241,0),(27,'2022-09-15 22:43:10',3,'0',242,0),(28,'2022-09-13 13:46:52',3,'0',243,0),(29,'2022-09-14 01:32:08',3,'0',244,0),(30,'2022-07-07 09:16:22',3,NULL,245,0),(31,'2022-07-07 09:16:28',3,NULL,246,0),(32,'2022-07-07 09:16:31',3,NULL,247,0),(33,'2022-07-07 09:16:34',3,NULL,248,0),(34,'2022-07-07 09:16:37',3,NULL,249,0),(35,'2022-09-23 18:27:13',3,'0',250,0),(36,'2022-09-10 12:38:57',3,'0',251,0),(37,'2022-10-03 05:14:17',3,'1',252,0),(38,'2022-09-22 07:19:11',3,'0',253,0),(39,'2022-09-11 00:14:41',3,'0',254,0),(40,'2022-09-10 20:04:34',3,'0',255,0),(41,'2022-09-20 13:50:08',3,'0',256,0),(42,'2022-09-29 23:58:50',3,'0',257,0),(43,'2022-09-15 00:15:35',3,'0',258,0),(44,'2022-09-29 06:47:21',3,'0',259,0),(45,'2022-10-03 05:28:19',3,'0',260,0),(46,'2022-09-29 20:18:11',3,'0',261,0),(47,'2022-07-13 16:22:16',3,'1',262,0),(48,'2022-09-26 15:10:36',3,'1',263,0),(49,'2022-09-28 01:03:32',3,'1',264,0),(50,'2022-07-07 16:17:17',3,NULL,265,0),(51,'2022-07-07 16:17:21',3,NULL,266,0),(52,'2022-07-07 16:17:24',3,NULL,267,0),(53,'2022-07-07 16:17:29',3,NULL,268,0),(54,'2022-07-07 16:17:32',3,NULL,269,0),(55,'2022-07-07 16:23:31',3,NULL,270,0),(56,'2022-07-07 16:23:35',3,NULL,271,0),(57,'2022-07-07 16:23:38',3,NULL,272,0),(58,'2022-07-07 16:23:42',3,NULL,273,0),(59,'2022-07-07 16:23:45',3,NULL,274,0),(60,'2022-07-07 16:24:00',3,NULL,275,0),(61,'2022-07-07 16:24:12',3,NULL,276,0),(62,'2022-07-07 16:24:15',3,NULL,277,0),(63,'2022-07-07 16:24:21',3,NULL,278,0),(64,'2022-07-07 16:24:25',3,NULL,279,0),(65,'2022-07-07 16:24:33',3,NULL,280,0),(66,'2022-07-07 16:24:36',3,NULL,281,0),(67,'2022-07-07 16:24:39',3,NULL,282,0),(68,'2022-07-07 16:24:44',3,NULL,283,0),(69,'2022-07-07 16:24:47',3,NULL,284,0),(70,'2022-09-27 14:53:21',3,'0',285,0),(71,'2022-09-28 11:43:17',3,'0',286,0),(72,'2022-09-28 01:10:48',3,'0',287,0),(73,'2022-10-02 18:27:58',3,'1',288,0),(74,'2022-09-28 00:35:50',3,'0',289,0),(75,'2022-07-11 12:31:06',3,'0',290,0),(76,'2022-07-11 12:32:48',3,'1',291,0),(77,'2022-07-11 12:33:28',3,'1',292,0),(78,'2022-07-11 12:34:06',3,'0',293,0),(79,'2022-07-11 12:30:45',3,'0',294,0),(80,'2022-10-02 03:26:41',3,'0',295,0),(81,'2022-10-03 00:30:55',3,'0',296,0),(82,'2022-10-01 06:48:29',3,'0',297,0),(83,'2022-10-02 04:40:07',3,'0',298,0),(84,'2022-10-02 15:50:14',3,'0',299,0),(85,'2022-09-29 22:57:03',3,'0',300,0),(86,'2022-09-29 11:07:52',3,'0',301,0),(87,'2022-10-01 00:44:21',3,'0',302,0),(88,'2022-09-30 04:30:47',3,'0',303,0),(89,'2022-09-16 05:53:19',3,'0',304,0),(90,'2022-09-15 16:08:00',3,'0',305,0),(91,'2022-10-02 13:32:46',3,'0',319,0),(92,'2022-09-27 16:46:24',3,'0',320,0),(93,'2022-07-13 04:39:50',3,NULL,332,0),(94,'2022-07-13 04:39:55',3,NULL,333,0),(95,'2022-07-13 04:40:05',3,NULL,334,0),(96,'2022-07-13 04:40:15',3,NULL,335,0),(97,'2022-07-13 04:40:18',3,NULL,336,0),(98,'2022-07-13 04:40:22',3,NULL,337,0),(99,'2022-09-16 19:28:40',3,'0',348,0),(100,'2022-09-16 07:53:24',3,'0',349,0),(101,'2022-09-16 20:28:41',3,'0',350,0),(102,'2022-09-07 20:18:42',3,'0',351,0),(103,'2022-09-17 11:59:04',3,'0',352,0),(104,'2022-09-16 08:13:25',3,'0',353,0),(105,'2022-09-14 03:07:12',3,'0',354,0),(106,'2022-09-16 04:53:21',3,'0',355,0),(107,'2022-09-01 09:14:10',3,'0',356,0),(108,'2022-09-17 00:53:49',3,'0',357,0),(109,'2022-09-17 05:38:56',3,'0',358,0),(110,'2022-09-13 18:12:00',3,'0',359,0),(111,'2022-09-16 06:58:25',3,'0',360,0),(112,'2022-09-17 07:23:59',3,'0',361,0),(113,'2022-09-16 13:38:34',3,'0',362,0),(114,'2022-09-17 00:53:50',3,'0',363,0),(115,'2022-09-16 00:08:16',3,'0',364,0),(116,'2022-09-17 09:29:03',3,'0',365,0),(117,'2022-09-17 07:54:01',3,'0',366,0),(118,'2022-09-26 16:50:39',3,'1',367,0),(119,'2022-09-25 01:29:45',3,'1',368,0),(120,'2022-09-25 04:04:49',3,'0',369,0),(121,'2022-09-22 14:38:23',3,'1',370,0),(122,'2022-09-26 10:30:31',3,'1',371,0),(123,'2022-08-29 18:37:43',3,NULL,372,0),(124,'2022-08-29 18:37:50',3,NULL,373,0),(125,'2022-08-29 18:38:01',3,NULL,374,0),(126,'2022-08-29 18:38:06',3,NULL,375,0),(127,'2022-08-29 18:38:10',3,NULL,376,0),(128,'2022-08-29 18:38:14',3,NULL,377,0),(129,'2022-08-29 18:38:19',3,NULL,378,0),(130,'2022-08-29 18:38:24',3,NULL,379,0),(131,'2022-08-29 18:38:30',3,NULL,380,0),(132,'2022-08-29 18:38:38',3,NULL,381,0),(133,'2022-08-29 18:39:23',3,NULL,382,0),(134,'2022-08-29 18:39:27',3,NULL,383,0),(135,'2022-08-29 18:39:31',3,NULL,384,0),(136,'2022-08-29 18:39:35',3,NULL,385,0),(137,'2022-08-29 18:39:39',3,NULL,386,0),(138,'2022-08-29 18:39:44',3,NULL,387,0),(139,'2022-08-29 18:39:49',3,NULL,388,0),(140,'2022-08-29 18:39:53',3,NULL,389,0),(141,'2022-08-29 18:39:59',3,NULL,390,0),(142,'2022-08-29 18:40:05',3,NULL,391,0),(143,'2022-08-29 18:40:10',3,NULL,392,0),(144,'2022-08-29 18:40:16',3,NULL,393,0),(145,'2022-08-29 18:40:21',3,NULL,394,0),(146,'2022-08-29 18:40:27',3,NULL,395,0),(147,'2022-09-29 10:04:16',3,'1',396,0),(148,'2022-10-01 23:30:40',3,'1',397,0),(149,'2022-09-28 04:58:38',3,'1',398,0),(150,'2022-09-28 04:13:37',3,'1',399,0),(151,'2022-09-27 14:09:27',3,'1',400,0),(152,'2022-08-29 18:55:54',3,NULL,401,0),(153,'2022-09-28 06:43:41',3,'1',402,0),(154,'2022-10-01 10:55:24',3,'1',403,0),(155,'2022-10-01 20:45:37',3,'0',404,0),(156,'2022-09-28 01:23:33',3,'1',405,0),(157,'2022-08-29 18:56:27',3,NULL,406,0),(158,'2022-10-03 02:11:18',3,'1',407,0),(159,'2022-09-30 04:54:43',3,'1',408,0),(160,'2022-09-30 13:39:55',3,'1',409,0),(161,'2022-09-27 12:44:21',3,'0',410,0),(162,'2022-08-29 18:56:56',3,NULL,411,0),(163,'2022-09-30 06:19:47',3,'0',412,0),(164,'2022-08-29 18:57:07',3,NULL,413,0),(165,'2022-10-01 17:30:35',3,'1',414,0),(166,'2022-08-29 18:57:18',3,NULL,415,0),(167,'2022-09-30 05:49:46',3,'1',416,0),(168,'2022-10-03 01:16:17',3,'0',417,0),(169,'2022-10-01 02:45:15',3,'1',418,0),(170,'2022-09-15 12:07:54',3,'0',419,0),(171,'2022-09-16 07:43:23',3,'0',420,0),(172,'2022-09-16 02:53:16',3,'0',421,0),(173,'2022-09-15 14:07:58',3,'0',422,0),(174,'2022-09-15 23:28:11',3,'0',423,0),(175,'2022-09-16 05:18:19',3,'0',424,0),(176,'2022-09-16 06:18:22',3,'0',425,0),(177,'2022-09-01 11:59:45',3,'0',426,0),(178,'2022-09-30 03:59:23',3,'0',427,0),(179,'2022-09-01 10:00:06',3,'0',428,0),(180,'2022-09-01 18:45:57',3,'0',429,0),(181,'2022-09-22 13:05:07',3,'0',430,0),(182,'2022-09-16 05:27:23',3,'0',431,0),(183,'2022-09-29 20:18:11',3,'0',261,0),(184,'2022-09-14 04:19:28',3,'0',432,0),(185,'2022-09-26 04:33:43',3,'0',433,0),(186,'2022-09-01 21:41:08',3,'0',434,0),(187,'2022-09-29 02:42:24',3,'0',435,0),(188,'2022-09-04 23:25:46',3,'0',436,0),(189,'2022-09-26 03:19:10',3,'0',437,0),(190,'2022-09-16 01:22:14',3,'0',438,0),(191,'2022-09-22 06:19:29',3,'0',439,0),(192,'2022-09-26 16:15:29',3,'0',440,0),(193,'2022-09-24 11:16:44',3,'0',441,0),(194,'2022-09-30 02:29:43',3,'0',442,0),(195,'2022-09-01 16:00:11',3,'0',443,0),(196,'2022-09-26 19:37:29',3,'0',444,0),(197,'2022-09-21 10:51:03',3,'0',445,0),(198,'2022-09-15 07:15:33',3,'0',446,0),(199,'2022-09-23 15:21:41',3,'0',447,0),(200,'2022-09-27 06:09:52',3,'0',448,0),(201,'2022-09-16 15:32:31',3,'0',449,0),(202,'2022-09-21 00:45:32',3,'0',450,0),(203,'2022-09-28 16:06:30',3,'0',451,0),(204,'2022-09-26 20:40:09',3,'0',452,0),(205,'2022-09-23 13:41:32',3,'0',453,0),(206,'2022-09-01 14:14:01',3,'0',454,0),(207,'2022-09-26 10:38:38',3,'0',455,0),(208,'2022-09-27 00:45:34',3,'0',456,0),(209,'2022-09-27 16:08:41',3,'0',457,0),(210,'2022-09-27 14:35:19',3,'0',458,0),(211,'2022-09-27 22:00:16',3,'0',459,0),(212,'2022-09-27 14:58:26',3,'0',460,0),(213,'2022-09-27 19:59:40',3,'0',461,0),(214,'2022-09-27 14:10:22',3,'0',462,0),(215,'2022-09-27 12:40:02',3,'0',463,0),(216,'2022-09-27 16:08:42',3,'0',464,0),(217,'2022-09-27 16:59:03',3,'0',465,0),(218,'2022-09-27 20:35:14',3,'0',466,0),(219,'2022-09-27 15:03:31',3,'0',467,0),(220,'2022-09-28 12:49:38',3,'0',468,0),(221,'2022-09-29 05:28:22',3,'0',469,0),(222,'2022-10-02 09:50:57',3,'0',470,0),(223,'2022-10-02 08:45:56',3,'0',471,0),(224,'2022-10-02 09:20:57',3,'0',472,0),(225,'2022-10-02 09:55:58',3,'0',473,0),(226,'2022-10-02 08:50:57',3,'0',474,0),(227,'2022-10-02 09:30:55',3,'0',475,0),(228,'2022-10-02 10:05:56',3,'0',476,0),(229,'2022-10-02 09:00:55',3,'0',477,0),(230,'2022-10-02 09:35:56',3,'0',478,0),(231,'2022-10-02 10:10:57',3,'0',479,0),(232,'2022-10-02 09:05:55',3,'0',480,0),(233,'2022-10-02 10:15:57',3,'0',481,0),(234,'2022-10-02 09:40:56',3,'0',482,0),(235,'2022-10-02 09:10:56',3,'0',483,0),(236,'2022-10-02 09:45:57',3,'0',484,0),(237,'2022-10-02 10:20:58',3,'0',485,0),(238,'2022-10-02 09:15:57',3,'0',486,0);
/*!40000 ALTER TABLE `trb_rasp_dali_e` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trb_rasp_dali_s`
--

DROP TABLE IF EXISTS `trb_rasp_dali_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trb_rasp_dali_s` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `borna` int(11) DEFAULT NULL,
  `valor` varchar(15) DEFAULT NULL,
  `codigo_rb` int(11) DEFAULT NULL,
  `domo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trb_rasp_dali_s`
--

LOCK TABLES `trb_rasp_dali_s` WRITE;
/*!40000 ALTER TABLE `trb_rasp_dali_s` DISABLE KEYS */;
INSERT INTO `trb_rasp_dali_s` VALUES (1,'2022-09-23 10:30:50',1,'100',4,1),(2,'2022-09-23 10:30:50',1,'100',5,1),(3,'2022-09-23 10:30:50',1,'100',6,1),(4,'2022-09-15 12:02:43',1,'100',7,1),(5,'2022-09-15 12:02:32',1,'11',8,1),(6,'2022-09-22 07:31:26',1,'100',14,1),(7,'2022-09-22 07:31:26',1,'100',15,1),(8,'2022-09-22 07:31:27',1,'100',16,1),(9,'2022-04-03 12:33:22',1,NULL,17,1),(10,'2022-04-03 12:33:44',1,NULL,18,1),(11,'2022-09-23 09:30:32',1,'100',23,1),(12,'2022-09-23 09:30:36',1,'100',24,1),(13,'2022-09-22 14:29:23',1,'100',25,1),(14,'2022-09-15 14:00:38',1,'100',26,1),(15,'2022-09-15 14:00:40',1,'100',27,1),(16,'2022-09-05 16:00:52',1,'100',32,1),(17,'2022-09-05 16:00:52',1,'100',33,1),(18,'2022-09-05 16:00:52',1,'100',34,1),(19,'2022-09-16 17:06:28',1,'100',35,1),(20,'2022-09-16 17:06:33',1,'100',36,1),(21,'2022-09-27 16:34:40',1,'100',41,1),(22,'2022-09-27 16:34:41',1,'100',42,1),(23,'2022-09-27 16:34:41',1,'100',43,1),(24,'2022-09-27 16:39:41',1,'100',44,1),(25,'2022-09-27 16:34:08',1,'100',45,1),(26,'2022-09-07 15:31:28',1,'50',50,1),(27,'2022-09-07 15:33:39',1,'50',51,1),(28,'2022-09-07 15:35:50',1,'50',52,1),(29,'2022-09-07 15:38:01',1,'50',53,1),(30,'2022-09-07 15:40:12',1,'50',54,1),(31,'2022-09-22 07:06:39',1,'100',65,1),(32,'2022-09-22 07:06:31',1,'100',66,1),(33,'2022-09-15 15:28:15',1,'0',67,1),(34,'2022-09-22 06:44:09',1,'100',75,1),(35,'2022-09-15 15:27:51',1,'100',76,1),(36,'2022-09-15 15:28:00',1,'100',77,1),(37,'2022-09-19 12:28:29',1,'50',78,1),(38,'2022-09-19 12:28:30',1,'50',79,1),(39,'2022-09-29 11:01:16',1,'34',86,1),(40,'2022-09-29 11:03:30',1,'60',87,1),(41,'2022-09-15 10:08:53',1,'100',88,1),(42,'2022-09-15 10:06:20',1,'100',89,1),(43,'2022-09-15 10:06:35',1,'100',90,1),(44,'2022-09-27 13:42:38',1,'100',91,1),(45,'2022-09-27 13:38:44',1,'100',92,1),(46,'2022-09-15 10:09:49',1,'100',93,1),(47,'2022-09-15 10:04:15',1,'100',94,1),(48,'2022-09-15 10:04:29',1,'100',98,1),(49,'2022-09-15 10:05:07',1,'100',99,1),(50,'2022-09-30 17:07:24',1,'96',107,1),(51,'2022-07-15 10:06:10',1,'100',108,1),(52,'2022-09-21 14:30:51',1,'100',109,1),(53,'2022-09-30 17:07:26',1,'100',110,1),(54,'2022-09-01 15:52:27',1,'91',111,1),(55,'2022-09-15 15:28:36',1,'100',112,1),(56,'2022-07-16 18:46:19',1,'0',113,1),(57,'2022-07-16 18:46:19',1,'0',114,1),(58,'2022-09-19 11:53:58',1,'100',115,1),(59,'2022-09-19 11:53:59',1,'100',116,1),(60,'2022-09-21 13:44:40',1,'100',117,1),(61,'2022-09-21 13:44:52',1,'100',118,1),(62,'2022-09-23 09:42:50',1,'79',158,1),(63,'2022-09-23 10:13:42',1,'50',159,1),(64,'2022-09-22 11:57:48',1,'50',160,1),(65,'2022-09-22 11:57:49',1,'50',161,1),(66,'2022-09-15 14:29:57',1,'100',162,1),(67,'2022-09-15 14:29:58',1,'100',163,1),(68,'2022-09-15 14:29:58',1,'100',164,1),(69,'2022-09-15 14:29:58',1,'100',165,1),(70,'2022-09-15 14:29:58',1,'100',166,1),(71,'2022-09-23 10:13:56',1,'100',167,1),(72,'2022-09-23 13:30:26',1,'100',168,1),(73,'2022-09-23 13:30:26',1,'100',169,1),(74,'2022-09-23 16:34:41',1,'100',170,1),(75,'2022-09-23 16:34:37',1,'100',171,1),(76,'2022-09-23 10:14:44',1,'100',172,1),(77,'2022-09-23 17:38:49',1,'100',173,1),(78,'2022-09-23 17:38:51',1,'100',183,1),(79,'2022-09-19 11:16:02',1,'80',191,1),(80,'2022-09-19 11:16:09',1,'100',192,1),(81,'2022-09-19 11:19:50',1,'60',193,1),(82,'2022-09-19 11:19:50',1,'80',194,1),(83,'2022-09-19 12:22:05',1,'100',195,1),(84,'2022-09-01 15:51:02',1,'0',196,1),(85,'2022-09-19 11:33:38',1,'100',197,1),(86,'2022-09-19 11:33:17',1,'100',198,1),(87,'2022-09-15 12:18:08',1,'100',199,1),(88,'2022-09-15 12:18:08',1,'100',200,1),(89,'2022-07-16 18:49:47',1,'9',201,1),(90,'2022-09-19 11:16:34',1,'61',202,1),(91,'2022-07-12 14:37:20',1,NULL,317,1),(92,'2022-07-12 15:01:20',1,NULL,318,1),(93,'2022-09-27 14:52:55',1,'100',326,1),(94,'2022-09-27 14:52:55',1,'100',327,1),(95,'2022-09-27 14:52:55',1,'100',328,1),(96,'2022-09-27 14:52:55',1,'100',329,1),(97,'2022-09-27 15:05:20',1,'100',330,1),(98,'2022-09-27 16:32:25',1,'100',331,1),(99,'2022-08-30 08:58:05',1,NULL,488,0),(100,'2022-08-30 08:58:57',3,NULL,488,0),(101,'2022-08-30 08:59:23',1,NULL,489,0),(102,'2022-08-30 08:59:46',3,NULL,489,0),(103,'2022-08-30 09:00:23',1,NULL,490,0),(104,'2022-08-30 09:00:47',3,NULL,490,0),(105,'2022-08-30 09:01:27',4,NULL,491,0),(106,'2022-08-30 09:02:01',1,NULL,492,0),(107,'2022-09-08 10:08:10',1,NULL,502,0),(108,'2022-09-08 10:11:33',1,NULL,503,0),(109,'2022-09-08 10:12:12',1,NULL,504,0),(110,'2022-09-08 10:12:46',1,NULL,505,0),(111,'2022-09-08 10:41:01',1,NULL,506,0),(112,'2022-09-08 10:41:28',3,NULL,506,0),(113,'2022-09-08 11:53:31',1,NULL,507,0),(114,'2022-09-08 12:05:08',3,NULL,507,0),(115,'2022-09-08 12:05:40',1,NULL,508,0),(116,'2022-09-08 12:06:19',3,NULL,508,0),(117,'2022-09-08 12:07:07',4,NULL,509,0),(118,'2022-09-08 15:30:27',1,NULL,512,1),(119,'2022-09-08 17:27:06',1,NULL,522,0),(120,'2022-09-08 17:27:35',1,NULL,523,0);
/*!40000 ALTER TABLE `trb_rasp_dali_s` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`fincahazard`@`localhost`*/ /*!50003 TRIGGER trigger_trb_rasp_dali_s
   AFTER UPDATE ON trb_rasp_dali_s
   FOR EACH ROW
   BEGIN

   DECLARE v_rojo int;
   DECLARE v_verde int;
   DECLARE v_azul int;

   DECLARE v_tp_rojo int;
   DECLARE v_tp_verde int;
   DECLARE v_tp_azul int;
   DECLARE v_idluces int;

   IF NEW.borna = 1 THEN
      UPDATE luces SET intensidad = NEW.valor, fecha = now()
      WHERE id = (SELECT codigo_luces FROM relacion_luces WHERE rb_dali1 = NEW.codigo_rb AND codigo_tp_int1 = NEW.id);
   ELSEIF NEW.borna = 3 THEN
      SELECT codigo_luces, codigo_tp_rgb1, codigo_tp_rgb2, codigo_tp_rgb3
      INTO v_idluces, v_tp_rojo, v_tp_verde, v_tp_azul
      FROM relacion_luces WHERE (rb_dali1 = NEW.codigo_rb OR rb_dali2 = NEW.codigo_rb OR rb_dali3 = NEW.codigo_rb);

      SELECT IFNULL(valor,255)
         INTO v_rojo
         FROM trb_rasp_dali_s
         WHERE id = v_tp_rojo;

         SELECT IFNULL(valor,255)
         INTO v_verde
         FROM trb_rasp_dali_s
         WHERE id = v_tp_verde;

         SELECT IFNULL(valor,255)
         INTO v_azul
         FROM trb_rasp_dali_s
         WHERE id = v_tp_azul;

         UPDATE luces set rgb = CONCAT(v_rojo,"$",v_verde,"$",v_azul)
         WHERE id = v_idluces;
   END IF;

   END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `trb_rasp_ds18b20`
--

DROP TABLE IF EXISTS `trb_rasp_ds18b20`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trb_rasp_ds18b20` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `borna` int(11) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `codigo_rb` int(11) DEFAULT NULL,
  `domo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trb_rasp_ds18b20`
--

LOCK TABLES `trb_rasp_ds18b20` WRITE;
/*!40000 ALTER TABLE `trb_rasp_ds18b20` DISABLE KEYS */;
INSERT INTO `trb_rasp_ds18b20` VALUES (1,'2022-09-30 17:16:16',0,23.19,55,2),(2,'2022-10-03 07:35:02',0,20.38,56,2),(3,'2022-10-03 07:35:03',0,21.62,57,2),(4,'2022-10-03 07:35:01',0,22.56,58,2),(5,'2022-10-03 07:34:09',0,22.12,59,2),(6,'2022-09-07 04:27:29',0,22.81,60,2),(7,'2022-10-03 07:33:04',0,20.25,68,2),(8,'2022-10-03 07:28:04',0,21.5,73,2),(9,'2022-10-03 07:32:03',0,21.31,74,2),(10,'2022-10-03 07:31:41',0,20.69,83,2),(11,'2022-10-03 07:29:44',0,21.56,84,2),(12,'2022-10-03 07:34:42',0,20.44,85,2),(13,'2022-10-03 07:32:04',0,21.38,119,2),(14,'2022-10-03 07:35:02',0,23,174,2),(15,'2022-10-03 07:35:03',0,21.69,175,2),(16,'2022-10-03 07:32:03',0,20.44,176,2),(17,'2022-10-03 07:33:03',0,22.88,177,2),(18,'2022-10-03 07:33:03',0,22.38,178,2),(19,'2022-10-03 07:35:02',0,23.19,179,2),(20,'2022-10-03 07:34:04',0,24.5,187,2),(21,'2022-10-03 07:35:04',0,23.75,188,2),(22,'2022-10-03 07:35:03',0,20.56,189,2),(23,'2022-09-05 09:37:29',0,NULL,190,0),(24,'2022-10-03 07:35:04',0,22.44,215,0),(25,'2022-10-03 05:49:03',0,22.12,310,2),(26,'2022-07-13 04:27:32',0,NULL,325,0),(27,'2022-09-07 05:07:28',0,NULL,495,0),(28,'2022-09-08 14:51:51',0,NULL,510,0),(29,'2022-09-08 14:52:11',0,NULL,511,0),(30,'2022-09-08 15:08:55',0,NULL,513,0),(31,'2022-09-08 15:09:03',0,NULL,514,0),(32,'2022-09-08 16:25:34',0,NULL,515,0),(33,'2022-09-08 16:25:41',0,NULL,516,0),(34,'2022-09-08 16:25:47',0,NULL,517,0),(35,'2022-09-08 16:25:55',0,NULL,518,0),(36,'2022-09-08 17:20:17',0,NULL,520,0),(37,'2022-09-08 17:20:25',0,NULL,521,0);
/*!40000 ALTER TABLE `trb_rasp_ds18b20` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`fincahazard`@`localhost`*/ /*!50003 TRIGGER trigger_trb_rasp_ds18b20
   AFTER UPDATE ON trb_rasp_ds18b20
   FOR EACH ROW
   BEGIN

   IF NEW.domo = 2 THEN
      UPDATE clima SET temperatura = NEW.valor, fecha = now()
      WHERE id = (SELECT codigo_clima FROM relacion_clima WHERE rb_temp = NEW.codigo_rb AND codigo_tp_temp = NEW.id);
   ELSEIF NEW.domo = 5 THEN
      UPDATE seguridad SET valor = CAST(NEW.valor AS CHAR), fecha = now()
      WHERE id = (SELECT codigo_seguridad FROM relacion_seguridad WHERE rb_valor = NEW.codigo_rb AND codigo_tp_valor = NEW.id);
   END IF;

   END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `trb_rasp_ed`
--

DROP TABLE IF EXISTS `trb_rasp_ed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trb_rasp_ed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `borna` int(11) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  `codigo_rb` int(11) DEFAULT NULL,
  `domo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trb_rasp_ed`
--

LOCK TABLES `trb_rasp_ed` WRITE;
/*!40000 ALTER TABLE `trb_rasp_ed` DISABLE KEYS */;
INSERT INTO `trb_rasp_ed` VALUES (1,'2022-09-30 17:19:20',0,0,1,1),(2,'2022-09-30 17:19:21',1,1,1,1),(3,'2022-09-28 18:05:55',2,0,1,1),(4,'2022-09-30 17:04:36',3,0,1,1),(5,'2022-09-29 20:09:59',4,0,1,1),(6,'2022-09-26 08:48:39',5,1,1,4),(7,'2022-09-26 08:48:39',6,1,1,4),(8,'2022-09-26 08:48:39',7,1,1,4),(9,'2022-09-23 07:13:25',9,0,1,0),(10,'2022-09-23 10:28:46',10,0,1,2),(11,'2022-07-24 13:26:22',11,0,1,0),(12,'2022-07-24 13:26:22',12,0,1,0),(13,'2022-08-06 17:57:15',13,0,1,0),(14,'2022-07-24 12:43:51',14,0,1,0),(15,'2022-10-02 19:37:38',0,0,10,1),(16,'2022-10-02 19:34:33',1,0,10,1),(17,'2022-10-02 13:57:49',2,0,10,1),(18,'2022-10-02 19:00:08',3,0,10,1),(19,'2022-10-02 19:00:06',4,0,10,1),(20,'2022-09-19 20:47:14',5,1,10,4),(21,'2022-09-19 20:47:15',6,1,10,4),(22,'2022-09-19 20:47:15',7,1,10,4),(23,'2022-09-30 20:05:17',9,0,10,0),(24,'2022-09-30 20:09:20',10,0,10,2),(25,'2022-07-16 11:55:36',11,0,10,0),(26,'2022-07-16 14:09:01',12,0,10,0),(27,'2022-07-16 14:09:01',13,0,10,0),(28,'2022-07-16 13:50:31',14,0,10,0),(29,'2022-10-02 19:35:18',0,0,19,1),(30,'2022-10-02 19:34:30',1,0,19,1),(31,'2022-09-22 14:49:49',2,0,19,1),(32,'2022-10-02 18:02:01',3,0,19,1),(33,'2022-09-26 13:19:03',4,0,19,1),(34,'2022-09-22 14:46:52',5,1,19,4),(35,'2022-09-22 14:46:49',6,1,19,4),(36,'2022-09-22 14:47:02',7,0,19,4),(37,'2022-09-25 07:09:53',9,0,19,0),(38,'2022-09-22 14:48:13',10,1,19,2),(39,'2022-06-18 11:16:47',11,0,19,0),(40,'2022-06-18 11:16:47',12,0,19,0),(41,'2022-06-18 11:16:47',13,0,19,0),(42,'2022-06-18 11:16:47',14,0,19,0),(43,'2022-10-01 19:50:08',0,0,28,1),(44,'2022-10-01 20:10:18',1,0,28,1),(45,'2022-09-26 07:08:54',2,0,28,1),(46,'2022-10-01 20:10:21',3,0,28,1),(47,'2022-10-01 06:14:59',4,0,28,1),(48,'2022-08-04 15:04:35',5,1,28,4),(49,'2022-08-04 15:04:35',6,1,28,4),(50,'2022-08-04 15:04:35',7,1,28,4),(51,'2022-09-30 23:54:20',9,0,28,0),(52,'2022-09-22 14:11:38',10,1,28,2),(53,'2022-07-16 14:44:11',11,0,28,0),(54,'2022-07-16 14:44:11',12,0,28,0),(55,'2022-07-16 15:01:53',13,0,28,0),(56,'2022-07-16 15:01:54',14,0,28,0),(57,'2022-09-27 16:35:58',0,0,37,1),(58,'2022-09-27 16:35:58',1,0,37,1),(59,'2022-09-27 16:36:05',2,0,37,1),(60,'2022-09-30 16:20:33',3,0,37,1),(61,'2022-09-27 16:34:12',4,0,37,1),(62,'2022-09-27 11:01:01',5,1,37,4),(63,'2022-09-27 11:01:03',6,1,37,4),(64,'2022-09-27 11:01:33',7,1,37,4),(65,'2022-07-07 18:00:38',9,0,37,0),(66,'2022-09-27 16:34:52',10,1,37,2),(67,'2022-09-27 16:36:30',11,0,37,0),(68,'2022-09-29 10:46:45',12,0,37,0),(69,'2022-06-18 11:16:47',13,0,37,0),(70,'2022-06-18 11:16:47',14,0,37,0),(71,'2022-09-07 15:31:17',0,0,46,1),(72,'2022-09-07 15:31:18',1,0,46,4),(73,'2022-09-07 15:31:17',2,0,46,1),(74,'2022-09-07 15:31:20',3,0,46,1),(75,'2022-09-07 15:31:20',4,0,46,1),(76,'2022-09-13 17:31:04',5,0,46,4),(77,'2022-09-13 17:31:18',6,0,46,4),(78,'2022-09-13 17:31:18',7,0,46,4),(79,'2022-09-01 14:13:19',9,0,46,0),(80,'2022-07-19 08:13:58',10,0,46,2),(81,'2022-07-11 09:23:52',11,0,46,0),(82,'2022-07-11 09:23:52',12,0,46,0),(83,'2022-07-11 09:23:52',13,0,46,0),(84,'2022-07-11 09:23:52',14,0,46,0),(85,'2022-09-07 16:38:19',15,0,1,4),(86,'2022-07-16 14:20:30',15,0,10,4),(87,'2022-09-22 14:47:02',15,0,19,4),(88,'2022-07-17 17:09:27',15,0,28,4),(89,'2022-09-27 11:01:15',15,0,37,4),(90,'2022-09-13 17:31:04',15,0,46,4),(91,'2022-09-28 15:15:22',0,0,61,1),(92,'2022-09-28 15:15:23',1,0,61,1),(93,'2022-09-30 22:08:02',2,0,61,1),(94,'2022-09-26 09:27:26',4,0,61,2),(95,'2022-09-22 06:40:40',5,1,61,4),(96,'2022-09-22 04:04:40',6,0,61,4),(97,'2022-10-01 19:12:46',0,0,69,1),(98,'2022-10-01 22:24:15',1,0,69,1),(99,'2022-10-01 22:24:16',2,0,69,1),(100,'2022-10-01 18:21:51',3,0,69,1),(101,'2022-10-01 18:21:50',4,0,69,1),(102,'2022-09-08 21:04:28',6,0,69,2),(103,'2022-09-27 12:13:36',8,0,69,2),(104,'2022-10-03 06:56:34',0,0,80,1),(105,'2022-09-29 17:34:09',1,0,80,1),(106,'2022-10-03 07:05:15',2,0,80,1),(107,'2022-10-03 06:55:34',3,1,80,1),(108,'2022-10-03 05:30:09',4,1,80,1),(109,'2022-09-29 11:48:20',5,0,80,1),(110,'2022-10-03 07:29:18',6,1,80,1),(111,'2022-09-28 22:30:54',7,0,80,1),(112,'2022-10-03 05:36:41',8,1,80,1),(113,'2022-09-30 18:41:39',9,0,80,1),(114,'2022-09-15 10:04:15',10,1,80,1),(115,'2022-10-03 07:02:05',0,1,95,1),(116,'2022-09-15 10:05:09',1,0,95,1),(117,'2022-09-30 17:07:25',0,0,100,1),(118,'2022-10-02 18:25:08',1,0,100,1),(119,'2022-09-28 16:24:49',2,0,100,1),(120,'2022-09-30 17:07:29',3,0,100,1),(121,'2022-10-01 08:55:12',4,0,100,1),(122,'2022-10-01 18:20:39',5,0,100,1),(123,'2022-10-01 23:03:52',6,0,100,1),(124,'2022-10-01 18:22:11',7,0,100,1),(125,'2022-10-03 07:09:31',8,1,100,1),(126,'2022-10-03 07:09:32',9,1,100,1),(127,'2022-09-30 17:37:09',10,1,100,1),(128,'2022-09-30 17:37:10',11,0,100,1),(129,'2022-09-23 09:52:31',12,1,100,4),(130,'2022-09-23 09:52:31',13,1,100,4),(131,'2022-09-13 17:27:39',14,0,100,4),(132,'2022-09-13 17:28:31',15,0,100,4),(133,'2022-10-03 04:42:11',2,1,103,2),(134,'2022-10-03 04:42:11',3,1,103,2),(135,'2022-09-24 10:35:23',4,0,103,0),(136,'2022-10-03 05:49:06',5,0,103,0),(137,'2022-09-23 22:15:47',6,0,103,0),(138,'2022-09-23 22:15:48',7,0,103,0),(139,'2022-10-03 06:33:12',8,0,103,0),(140,'2022-10-03 06:33:12',9,0,103,0),(141,'2022-10-03 06:33:13',10,0,103,0),(142,'2022-10-01 00:56:26',0,0,155,1),(143,'2022-09-29 20:42:53',1,0,155,1),(144,'2022-09-29 20:42:59',2,0,155,1),(145,'2022-09-29 20:42:54',3,0,155,1),(146,'2022-09-30 13:02:01',4,0,155,1),(147,'2022-09-30 09:18:02',5,0,155,1),(148,'2022-10-03 00:27:58',6,0,155,1),(149,'2022-09-24 14:37:12',7,0,155,1),(150,'2022-09-24 14:37:11',8,0,155,1),(151,'2022-10-02 21:46:50',9,0,155,1),(152,'2022-09-30 23:45:30',10,0,155,1),(153,'2022-09-29 21:04:09',11,0,155,1),(154,'2022-10-02 20:01:29',12,0,155,1),(155,'2022-10-02 13:54:06',13,0,155,1),(156,'2022-10-02 13:59:16',14,0,155,1),(157,'2022-09-27 21:15:05',15,0,155,1),(158,'2022-09-23 16:12:39',8,1,180,4),(159,'2022-09-23 16:12:39',9,1,180,4),(160,'2022-09-23 16:12:39',10,1,180,4),(161,'2022-09-23 16:12:39',11,1,180,4),(162,'2022-09-23 16:12:39',12,1,180,4),(163,'2022-10-02 21:26:53',13,0,180,1),(164,'2022-10-02 21:22:31',14,0,180,1),(165,'2022-09-27 21:15:06',15,0,180,1),(166,'2022-10-01 19:56:40',0,0,184,1),(167,'2022-10-03 05:37:51',1,1,184,1),(168,'2022-10-01 22:29:34',2,0,184,1),(169,'2022-10-02 20:27:30',3,0,184,1),(170,'2022-10-02 09:05:22',4,0,184,1),(171,'2022-10-02 20:16:08',5,0,184,1),(172,'2022-10-03 05:48:37',6,0,184,1),(173,'2022-10-02 20:16:10',7,0,184,1),(174,'2022-10-02 20:02:11',8,0,184,1),(175,'2022-10-03 05:54:57',9,1,184,1),(176,'2022-10-03 05:37:33',10,1,184,1),(177,'2022-09-19 11:16:35',11,0,184,1),(178,'2022-10-03 06:33:12',11,0,103,0),(179,'2022-10-03 06:33:12',12,0,103,0),(180,'2022-09-22 08:52:54',0,0,180,10),(181,'2022-09-22 08:52:54',1,0,180,10),(182,'2022-09-22 06:39:15',7,0,61,0),(183,'2022-09-22 06:11:35',8,0,61,0),(184,'2022-09-22 06:11:35',9,0,61,0),(185,'2022-09-22 06:46:35',10,0,61,0),(186,'2022-09-22 06:39:39',11,0,61,0),(187,'2022-09-05 08:15:25',9,0,69,10),(188,'2022-09-05 06:37:56',10,0,69,10),(189,'2022-09-13 17:07:14',14,1,184,2),(190,'2022-09-03 19:08:26',15,1,184,2),(191,'2022-10-03 07:23:50',0,0,321,1),(192,'2022-10-03 07:23:51',1,0,321,1),(193,'2022-10-03 07:23:50',2,0,321,1),(194,'2022-10-03 07:23:50',3,0,321,1),(195,'2022-10-03 07:23:51',4,0,321,1),(196,'2022-10-03 07:23:51',5,0,321,1),(197,'2022-10-03 05:58:06',7,0,321,2),(198,'2022-10-03 03:02:26',9,0,321,2),(199,'2022-09-07 05:09:24',0,NULL,314,0),(200,'2022-09-07 05:09:24',1,NULL,314,0),(201,'2022-09-07 05:09:25',2,NULL,314,0),(202,'2022-09-07 05:09:25',3,NULL,314,0),(203,'2022-09-07 05:09:25',4,NULL,314,0),(204,'2022-09-07 05:09:25',5,NULL,314,0),(205,'2022-09-08 14:26:17',10,NULL,314,4),(206,'2022-09-07 05:09:25',11,NULL,314,0),(207,'2022-09-07 05:09:42',6,NULL,314,0),(208,'2022-09-07 05:09:42',7,NULL,314,0),(209,'2022-09-07 05:09:42',8,NULL,314,0),(210,'2022-09-07 05:09:42',9,NULL,314,0),(211,'2022-09-07 05:29:24',0,NULL,496,0),(212,'2022-09-07 05:29:24',1,NULL,496,0),(213,'2022-09-07 05:29:24',2,NULL,496,0),(214,'2022-09-07 05:29:24',3,NULL,496,0),(215,'2022-09-07 05:29:24',4,NULL,496,0),(216,'2022-09-07 05:29:25',5,NULL,496,0),(217,'2022-09-07 05:29:25',6,NULL,496,0),(218,'2022-09-07 05:29:25',7,NULL,496,0),(219,'2022-09-07 05:29:25',8,NULL,496,0),(220,'2022-09-08 15:12:57',0,NULL,499,1),(221,'2022-09-08 15:30:26',1,NULL,499,1),(222,'2022-09-07 05:38:51',2,NULL,499,0),(223,'2022-09-08 15:56:04',3,NULL,499,1),(224,'2022-09-07 05:38:51',4,NULL,499,0),(225,'2022-09-07 05:38:51',5,NULL,499,0),(226,'2022-09-07 05:38:51',6,NULL,499,0),(227,'2022-09-07 05:38:51',7,NULL,499,0),(228,'2022-09-08 17:29:14',0,NULL,311,1),(229,'2022-09-08 16:43:11',1,NULL,311,1),(230,'2022-09-08 16:43:11',2,NULL,311,0),(231,'2022-09-08 16:43:11',3,NULL,311,0),(232,'2022-09-08 16:43:12',4,NULL,311,0),(233,'2022-09-08 16:43:12',5,NULL,311,0),(234,'2022-09-09 07:54:45',6,NULL,311,4);
/*!40000 ALTER TABLE `trb_rasp_ed` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`fincahazard`@`localhost`*/ /*!50003 TRIGGER trigger_trb_rasp_ed
   AFTER UPDATE ON trb_rasp_ed
   FOR EACH ROW
   BEGIN

   DECLARE v_codigo_multimedia int;
   DECLARE v_codigo_acceso int;
   DECLARE v_tp_abierto int;
   DECLARE v_tp_cerrado int;
   DECLARE v_valor_abierto int;
   DECLARE v_valor_cerrado int;

   CASE
      WHEN NEW.domo = 1 THEN
         UPDATE luces SET estado = NEW.valor, fecha = now()
         WHERE id = (SELECT codigo_luces FROM relacion_luces WHERE rb_e_estado = NEW.codigo_rb AND codigo_tp_e_estado = NEW.id);
      WHEN NEW.domo = 2 THEN
         UPDATE clima SET estado = NEW.valor, fecha = now()
      WHERE id = (SELECT codigo_clima FROM relacion_clima WHERE rb_estado = NEW.codigo_rb AND codigo_tp_estado = NEW.id);
      WHEN NEW.domo = 4 THEN
         UPDATE iot SET estado = NEW.valor, fecha = now()
         WHERE id = (SELECT codigo_iot FROM relacion_iot WHERE rb_e_estado = NEW.codigo_rb AND codigo_tp_e_estado = NEW.id);
      WHEN NEW.domo = 5 THEN
         UPDATE seguridad SET estado = NEW.valor, fecha = now()
         WHERE id = (SELECT codigo_seguridad FROM relacion_seguridad WHERE rb_estado = NEW.codigo_rb AND codigo_tp_estado = NEW.id);
      WHEN NEW.domo = 6 THEN
         SELECT codigo_accesos, codigo_tp_e_abrir, codigo_tp_e_cerrar
         INTO v_codigo_acceso, v_tp_abierto, v_tp_cerrado
         FROM relacion_accesos
         WHERE ((rb_e_abrir = NEW.codigo_rb AND codigo_tp_e_abrir = NEW.id) OR
         (rb_e_cerrar = NEW.codigo_rb AND codigo_tp_e_cerrar = NEW.id)) ;

         IF (v_tp_abierto = -1 AND v_tp_cerrado = -1) THEN
            UPDATE accesos SET estado = NEW.valor, fecha = now()
            WHERE id = v_codigo_acceso;
         ELSE
            IF ( v_tp_abierto != -1 && v_tp_cerrado != -1) THEN
               SELECT valor
               INTO v_valor_abierto
               FROM trb_rasp_ed WHERE id = v_tp_abierto;

               SELECT valor
               INTO v_valor_cerrado
               FROM trb_rasp_ed WHERE id = v_tp_cerrado;

               IF (v_valor_abierto = 0 && v_valor_cerrado = 0) THEN
                  UPDATE accesos SET estado = 2, fecha = now()
                  WHERE id = v_codigo_acceso;
               ELSEIF (v_valor_abierto = 1 && v_valor_cerrado = 0) THEN
                  UPDATE accesos SET estado = 1, fecha = now()
                  WHERE id = v_codigo_acceso;
               ELSEIF (v_valor_abierto = 0 && v_valor_cerrado = 1) THEN
                  UPDATE accesos SET estado = 0, fecha = now()
                  WHERE id = v_codigo_acceso;
               END IF;
            ELSE
               UPDATE accesos SET estado = NEW.valor, fecha = now()
                  WHERE id = v_codigo_acceso;
            END IF;
         END IF;
      WHEN NEW.domo = 9 THEN
         UPDATE automaticos SET estado = NEW.valor, fecha = now()
         WHERE rb_e_estado = NEW.codigo_rb AND codigo_tp_e_estado = NEW.id;
      WHEN NEW.domo = 10 THEN
         SELECT codigo_multimedia, codigo_tp_e_abrir, codigo_tp_e_cerrar
         INTO v_codigo_multimedia, v_tp_abierto, v_tp_cerrado
         FROM relacion_multimedia
         WHERE ((rb_e_abrir = NEW.codigo_rb AND codigo_tp_e_abrir = NEW.id) OR
         (rb_e_cerrar = NEW.codigo_rb AND codigo_tp_e_cerrar = NEW.id)) ;

         IF (v_tp_abierto = -1 AND v_tp_cerrado = -1) THEN
            UPDATE multimedia SET estado = NEW.valor, fecha = now()
            WHERE id = v_codigo_multimedia;
         ELSE
            IF ( v_tp_abierto != -1 && v_tp_cerrado != -1) THEN
               SELECT valor
               INTO v_valor_abierto
               FROM trb_rasp_ed WHERE id = v_tp_abierto;

               SELECT valor
               INTO v_valor_cerrado
               FROM trb_rasp_ed WHERE id = v_tp_cerrado;

               IF (v_valor_abierto = 0 && v_valor_cerrado = 0) THEN
                  UPDATE multimedia SET estado = 2, fecha = now()
                  WHERE id = v_codigo_multimedia;
               ELSEIF (v_valor_abierto = 1 && v_valor_cerrado = 0) THEN
                  UPDATE multimedia SET estado = 1, fecha = now()
                  WHERE id = v_codigo_multimedia;
               ELSEIF (v_valor_abierto = 0 && v_valor_cerrado = 1) THEN
                  UPDATE multimedia SET estado = 0, fecha = now()
                  WHERE id = v_codigo_multimedia;
               END IF;
            ELSE
               UPDATE multimedia SET estado = NEW.valor, fecha = now()
                  WHERE id = v_codigo_multimedia;
            END IF;
         END IF;
      WHEN NEW.domo = 11 THEN
         UPDATE bombas SET estado = NEW.valor, fecha = now()
         WHERE id = (SELECT codigo_bombas FROM relacion_bombas WHERE rb_e_estado = NEW.codigo_rb AND codigo_tp_e_estado = NEW.id);
      ELSE
         BEGIN
         END;
   END CASE;
   END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `trb_rasp_pulsador`
--

DROP TABLE IF EXISTS `trb_rasp_pulsador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trb_rasp_pulsador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `borna` int(11) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  `codigo_rb` int(11) DEFAULT NULL,
  `domo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trb_rasp_pulsador`
--

LOCK TABLES `trb_rasp_pulsador` WRITE;
/*!40000 ALTER TABLE `trb_rasp_pulsador` DISABLE KEYS */;
INSERT INTO `trb_rasp_pulsador` VALUES (1,'2022-09-23 07:13:24',8,1,9,0),(2,'2022-09-30 20:09:18',8,1,13,0),(3,'2022-09-22 14:48:11',8,1,22,0),(4,'2022-09-15 12:10:35',8,1,31,0),(5,'2022-09-27 15:10:07',8,1,40,0),(6,'2022-07-11 09:23:53',8,1,49,0),(7,'2022-09-26 09:27:25',3,1,64,0),(8,'2022-09-08 21:04:27',5,1,72,0),(9,'2022-09-27 12:13:35',7,1,72,0),(10,'2022-09-24 10:35:19',0,1,106,0),(11,'2022-09-24 10:35:19',1,1,106,0),(12,'2022-09-23 16:29:51',2,1,213,0),(13,'2022-09-23 16:29:51',3,1,213,0),(14,'2022-09-23 16:29:51',4,1,213,0),(15,'2022-09-29 13:12:13',5,1,213,0),(16,'2022-09-23 16:29:51',6,1,213,0),(17,'2022-09-23 16:29:52',7,1,213,0),(18,'2022-09-06 07:37:10',12,1,214,0),(19,'2022-09-03 19:08:26',13,1,214,0),(20,'2022-10-03 07:35:09',6,1,324,0),(21,'2022-10-03 07:33:35',8,1,324,0);
/*!40000 ALTER TABLE `trb_rasp_pulsador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trb_rasp_sa`
--

DROP TABLE IF EXISTS `trb_rasp_sa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trb_rasp_sa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `borna` int(11) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `codigo_rb` int(11) DEFAULT NULL,
  `domo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trb_rasp_sa`
--

LOCK TABLES `trb_rasp_sa` WRITE;
/*!40000 ALTER TABLE `trb_rasp_sa` DISABLE KEYS */;
/*!40000 ALTER TABLE `trb_rasp_sa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trb_rasp_sd`
--

DROP TABLE IF EXISTS `trb_rasp_sd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trb_rasp_sd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `borna` int(11) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  `codigo_rb` int(11) DEFAULT NULL,
  `domo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trb_rasp_sd`
--

LOCK TABLES `trb_rasp_sd` WRITE;
/*!40000 ALTER TABLE `trb_rasp_sd` DISABLE KEYS */;
INSERT INTO `trb_rasp_sd` VALUES (1,'2022-09-23 10:31:08',0,0,2,1),(2,'2022-09-23 10:31:08',1,0,2,1),(3,'2022-09-23 10:31:08',2,0,2,1),(4,'2022-09-15 12:02:47',3,0,2,1),(5,'2022-09-15 12:02:34',4,0,2,1),(6,'2022-09-15 11:18:48',5,1,2,4),(7,'2022-09-07 16:35:10',6,1,2,4),(8,'2022-09-07 16:35:15',7,1,2,4),(9,'2022-09-23 10:28:46',8,0,2,0),(10,'2022-09-22 07:31:25',0,1,11,1),(11,'2022-09-22 07:31:26',1,1,11,1),(12,'2022-09-22 07:34:16',2,0,11,1),(13,'2022-07-20 09:42:01',3,1,11,1),(14,'2022-07-20 09:40:57',4,1,11,1),(15,'2022-07-17 16:48:32',5,1,11,4),(16,'2022-07-17 16:48:31',6,1,11,4),(17,'2022-07-17 16:48:31',7,1,11,4),(18,'2022-09-30 20:09:19',8,0,11,0),(19,'2022-09-23 09:30:32',0,0,20,1),(20,'2022-09-23 09:30:38',1,0,20,1),(21,'2022-09-22 14:29:23',2,1,20,1),(22,'2022-09-15 14:00:38',3,1,20,1),(23,'2022-09-15 14:00:39',4,1,20,1),(24,'2022-09-22 14:46:58',5,1,20,4),(25,'2022-09-22 14:46:58',6,1,20,4),(26,'2022-09-22 14:46:59',7,1,20,4),(27,'2022-09-25 07:09:53',8,0,20,0),(28,'2022-09-05 15:58:08',0,1,29,1),(29,'2022-09-05 15:58:35',1,1,29,1),(30,'2022-09-05 15:59:01',2,1,29,1),(31,'2022-09-16 17:06:37',3,0,29,1),(32,'2022-09-16 17:06:35',4,0,29,1),(33,'2022-07-17 17:09:17',5,1,29,4),(34,'2022-07-17 17:09:22',6,1,29,4),(35,'2022-07-17 17:09:12',7,1,29,4),(36,'2022-09-30 23:54:20',8,0,29,0),(37,'2022-09-27 16:34:40',0,1,38,1),(38,'2022-09-27 16:34:40',1,1,38,1),(39,'2022-09-27 16:34:40',2,1,38,1),(40,'2022-09-27 16:39:20',3,1,38,1),(41,'2022-09-27 16:34:11',4,0,38,1),(42,'2022-09-27 11:01:01',5,1,38,4),(43,'2022-09-27 11:01:03',6,1,38,4),(44,'2022-09-27 11:01:32',7,1,38,4),(45,'2022-10-02 20:49:01',8,1,38,0),(46,'2022-09-07 15:31:14',0,1,47,1),(47,'2022-09-07 15:31:14',1,1,47,1),(48,'2022-09-07 15:31:14',2,1,47,1),(49,'2022-09-07 15:31:16',3,1,47,1),(50,'2022-09-07 15:31:16',4,1,47,1),(51,'2022-09-13 17:31:00',5,1,47,4),(52,'2022-09-13 17:31:14',6,1,47,4),(53,'2022-09-13 17:31:15',7,1,47,4),(54,'2022-07-19 08:14:26',8,0,47,0),(55,'2022-09-23 10:28:46',9,0,2,2),(56,'2022-09-07 16:38:15',10,1,2,4),(57,'2022-09-30 20:09:18',9,0,11,2),(58,'2022-04-25 09:00:47',10,NULL,11,4),(59,'2022-09-22 14:48:12',9,1,20,2),(60,'2022-09-22 14:46:59',10,1,20,4),(61,'2022-09-15 12:10:35',9,1,29,2),(62,'2022-07-17 17:09:24',10,1,29,4),(63,'2022-09-27 16:34:51',9,1,38,2),(64,'2022-09-27 11:01:14',10,0,38,4),(65,'2022-07-19 08:14:26',9,0,47,2),(66,'2022-09-13 17:31:01',10,1,47,4),(67,'2022-09-22 07:05:14',0,1,62,1),(68,'2022-09-22 07:05:19',1,1,62,1),(69,'2022-09-15 15:28:17',2,0,62,1),(70,'2022-09-26 09:27:25',3,0,62,2),(71,'2022-09-13 17:27:16',4,1,62,4),(72,'2022-09-13 17:27:17',5,1,62,4),(73,'2022-09-22 06:44:01',0,1,70,1),(74,'2022-09-15 15:27:54',1,0,70,1),(75,'2022-09-15 15:28:04',2,0,70,1),(76,'2022-09-19 12:28:31',3,0,70,1),(77,'2022-09-19 12:28:32',4,0,70,1),(78,'2022-09-08 21:04:27',5,0,70,2),(79,'2022-09-27 12:13:35',6,0,70,2),(80,'2022-09-21 14:41:43',7,0,70,1),(81,'2022-09-29 11:01:11',0,1,81,1),(82,'2022-09-29 11:03:30',1,1,81,1),(83,'2022-09-15 10:08:50',2,1,81,1),(84,'2022-09-07 15:29:08',3,1,81,1),(85,'2022-09-15 10:06:44',4,0,81,1),(86,'2022-09-15 10:06:46',5,0,81,1),(87,'2022-09-27 13:42:41',6,0,81,1),(88,'2022-09-27 13:42:45',7,0,81,1),(89,'2022-09-27 13:38:38',8,1,81,1),(90,'2022-09-15 10:09:49',9,1,81,1),(91,'2022-09-15 10:04:14',10,1,81,1),(92,'2022-09-15 10:04:28',0,1,96,1),(93,'2022-09-15 10:05:06',1,1,96,1),(94,'2022-09-30 17:07:25',0,0,101,1),(95,'2022-09-30 17:07:38',1,0,101,1),(96,'2022-09-21 14:30:50',2,1,101,1),(97,'2022-09-30 17:07:29',3,0,101,1),(98,'2022-09-06 07:14:15',4,0,101,1),(99,'2022-09-15 15:28:38',5,0,101,1),(100,'2022-09-06 07:14:15',6,0,101,1),(101,'2022-09-06 07:14:16',7,0,101,1),(102,'2022-09-19 11:53:59',8,0,101,1),(103,'2022-09-19 11:54:00',9,0,101,1),(104,'2022-09-21 13:44:46',10,0,101,1),(105,'2022-09-21 13:44:56',11,0,101,1),(106,'2022-07-20 15:07:36',12,1,101,4),(107,'2022-07-20 15:07:37',13,1,101,4),(108,'2022-09-13 17:27:36',14,1,101,4),(109,'2022-09-13 17:28:27',15,1,101,4),(110,'2022-10-03 05:49:03',0,1,104,0),(111,'2022-09-24 10:35:19',1,1,104,0),(112,'2022-09-24 10:35:19',2,1,104,2),(113,'2022-09-24 10:35:19',3,1,104,2),(114,'2022-06-04 18:33:55',4,NULL,104,0),(115,'2022-09-23 09:32:29',0,1,156,1),(116,'2022-09-23 10:13:42',1,0,156,1),(117,'2022-09-23 10:13:45',2,0,156,1),(118,'2022-09-23 10:13:46',3,0,156,1),(119,'2022-09-15 14:30:02',4,0,156,1),(120,'2022-09-15 14:30:02',5,0,156,1),(121,'2022-09-15 14:30:02',6,0,156,1),(122,'2022-09-15 14:30:02',7,0,156,1),(123,'2022-09-15 14:30:02',8,0,156,0),(124,'2022-09-23 10:13:55',9,1,156,2),(125,'2022-09-23 13:30:26',10,1,156,1),(126,'2022-09-23 13:30:26',11,1,156,1),(127,'2022-09-23 16:34:41',12,1,156,1),(128,'2022-09-23 16:34:39',13,0,156,1),(129,'2022-09-23 10:14:44',14,1,156,1),(130,'2022-09-23 17:38:42',15,1,156,1),(131,'2022-07-17 16:47:07',8,1,181,0),(132,'2022-07-17 16:47:47',9,1,181,2),(133,'2022-07-17 16:47:48',10,1,181,4),(134,'2022-07-17 16:47:08',11,1,181,4),(135,'2022-07-17 16:47:08',12,1,181,4),(136,'2022-09-23 12:01:33',13,1,181,1),(137,'2022-09-23 10:13:57',14,1,181,1),(138,'2022-09-23 17:38:43',15,1,181,1),(139,'2022-09-19 11:15:42',0,1,185,1),(140,'2022-09-19 11:15:42',1,1,185,1),(141,'2022-09-19 11:19:49',2,1,185,1),(142,'2022-09-19 11:19:49',3,1,185,1),(143,'2022-09-19 12:22:08',4,0,185,1),(144,'2022-09-16 11:14:07',5,0,185,1),(145,'2022-09-19 11:33:38',6,1,185,1),(146,'2022-09-19 11:33:14',7,1,185,1),(147,'2022-09-15 12:18:11',8,0,185,1),(148,'2022-09-15 12:18:13',9,0,185,1),(149,'2022-07-20 09:41:40',10,1,185,1),(150,'2022-09-19 11:16:31',11,1,185,1),(151,'2022-09-08 21:04:28',5,0,104,0),(152,'2022-09-27 12:13:36',6,0,104,0),(153,'2022-07-17 16:46:44',0,0,181,10),(154,'2022-07-17 16:46:44',1,0,181,10),(155,'2022-07-05 22:38:42',8,NULL,70,10),(156,'2022-07-05 22:39:51',9,NULL,70,10),(157,'2022-09-13 17:07:12',12,1,185,2),(158,'2022-09-03 19:08:26',13,1,185,2),(159,'2022-07-12 00:57:18',0,NULL,312,1),(160,'2022-07-12 00:57:43',1,NULL,312,1),(161,'2022-07-12 00:58:06',2,NULL,312,0),(162,'2022-07-12 00:58:27',3,NULL,312,0),(163,'2022-07-12 00:58:52',4,NULL,312,0),(164,'2022-07-12 00:59:10',5,NULL,312,0),(165,'2022-07-12 01:03:35',0,NULL,315,1),(166,'2022-07-20 09:41:07',1,1,315,1),(167,'2022-07-20 09:42:09',2,1,315,1),(168,'2022-07-12 01:04:50',3,NULL,315,1),(169,'2022-07-12 01:05:11',4,NULL,315,1),(170,'2022-07-12 01:05:31',5,NULL,315,1),(171,'2022-07-12 01:05:52',6,NULL,315,0),(172,'2022-07-12 01:06:14',7,NULL,315,0),(173,'2022-07-12 01:06:33',8,NULL,315,0),(174,'2022-07-12 01:06:56',9,NULL,315,2),(175,'2022-09-27 16:33:24',11,1,38,1),(176,'2022-09-27 16:32:48',12,0,38,1),(177,'2022-09-27 14:52:54',0,1,322,1),(178,'2022-09-27 14:52:54',1,1,322,1),(179,'2022-09-27 14:52:54',2,1,322,1),(180,'2022-09-27 14:52:54',3,1,322,1),(181,'2022-09-27 15:05:12',4,1,322,1),(182,'2022-09-27 16:32:25',5,1,322,1),(183,'2022-07-12 18:13:09',6,NULL,322,0),(184,'2022-07-12 18:13:27',7,NULL,322,0),(185,'2022-09-08 14:26:17',10,NULL,315,4),(186,'2022-09-07 05:08:54',11,NULL,315,0),(187,'2022-09-07 05:34:40',0,NULL,497,0),(188,'2022-09-07 05:35:07',1,NULL,497,0),(189,'2022-09-08 15:12:57',0,NULL,500,1),(190,'2022-09-08 15:30:26',1,NULL,500,1),(191,'2022-09-07 05:45:00',2,NULL,500,0),(192,'2022-09-08 15:56:04',3,NULL,500,1),(193,'2022-09-07 05:45:39',4,NULL,500,0),(194,'2022-09-09 07:54:45',6,NULL,312,4);
/*!40000 ALTER TABLE `trb_rasp_sd` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`fincahazard`@`localhost`*/ /*!50003 TRIGGER trigger_trb_rasp_sd
   AFTER UPDATE ON trb_rasp_sd
   FOR EACH ROW
   BEGIN

   CASE
      WHEN NEW.domo = 1 THEN
         UPDATE luces SET estado = NEW.valor, fecha = now()
         WHERE id = (SELECT codigo_luces FROM relacion_luces WHERE rb_s_estado = NEW.codigo_rb AND codigo_tp_s_estado = NEW.id);
      WHEN NEW.domo = 2 THEN
         UPDATE clima SET estado = NEW.valor, fecha = now()
         WHERE id = (SELECT codigo_clima FROM relacion_clima WHERE rb_estado = NEW.codigo_rb AND codigo_tp_estado = NEW.id);
      WHEN NEW.domo = 4 THEN
         UPDATE iot SET estado = NEW.valor, fecha = now()
         WHERE id = (SELECT codigo_iot FROM relacion_iot WHERE rb_s_estado = NEW.codigo_rb AND codigo_tp_s_estado = NEW.id);
      WHEN NEW.domo = 6 THEN
         UPDATE accesos SET estado = NEW.valor, fecha = now()
         WHERE id = (SELECT codigo_accesos FROM relacion_accesos
         WHERE (rb_s_abrir = NEW.codigo_rb AND codigo_tp_s_abrir = NEW.id) OR
         (rb_s_cerrar = NEW.codigo_rb AND codigo_tp_s_cerrar = NEW.id));
      WHEN NEW.domo = 9 THEN
         UPDATE automaticos SET estado = NEW.valor, fecha = now()
         WHERE rb_s_estado = NEW.codigo_rb AND codigo_tp_s_estado = NEW.id;
      WHEN NEW.domo = 10 THEN
         UPDATE multimedia SET estado = NEW.valor, fecha = now()
         WHERE id = (SELECT codigo_multimedia FROM relacion_multimedia
         WHERE (rb_s_abrir = NEW.codigo_rb AND codigo_tp_s_abrir = NEW.id) OR
         (rb_s_cerrar = NEW.codigo_rb AND codigo_tp_s_cerrar = NEW.id));
      WHEN NEW.domo = 11 THEN
         UPDATE bombas SET estado = NEW.valor, fecha = now()
         WHERE id = (SELECT codigo_bombas FROM relacion_bombas WHERE rb_s_estado = NEW.codigo_rb AND codigo_tp_s_estado = NEW.id);
      WHEN NEW.domo = 12 THEN
         UPDATE clima SET estado_fancoil = NEW.valor, fecha = now()
         WHERE id = (SELECT codigo_clima FROM relacion_clima WHERE rb_estado_fancoil = NEW.codigo_rb AND codigo_tp_fancoil = NEW.id);
      ELSE
         BEGIN
         END;
   END CASE;

   END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `trb_somfy_50_e`
--

DROP TABLE IF EXISTS `trb_somfy_50_e`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trb_somfy_50_e` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `borna` int(11) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `codigo_rb` int(11) DEFAULT NULL,
  `domo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trb_somfy_50_e`
--

LOCK TABLES `trb_somfy_50_e` WRITE;
/*!40000 ALTER TABLE `trb_somfy_50_e` DISABLE KEYS */;
INSERT INTO `trb_somfy_50_e` VALUES (1,'2022-06-20 19:19:31',0,NULL,131,5),(2,'2022-09-01 14:33:49',1,100,131,5),(3,'2022-06-20 19:19:38',0,NULL,133,5),(4,'2022-09-30 21:55:02',1,100,133,5),(5,'2022-06-20 19:19:46',0,NULL,135,5),(6,'2022-10-02 08:01:35',1,0,135,5),(7,'2022-06-20 19:20:56',0,NULL,137,5),(8,'2022-10-02 07:59:17',1,0,137,5),(9,'2022-06-20 19:21:03',0,NULL,139,5),(10,'2022-09-30 12:26:24',1,0,139,5),(11,'2022-06-20 19:21:09',0,NULL,141,5),(12,'2022-09-24 11:00:56',1,0,141,5),(13,'2022-06-20 19:22:46',0,NULL,143,5),(14,'2022-09-24 11:01:54',1,0,143,5),(15,'2022-06-20 19:22:55',0,NULL,145,5),(16,'2022-09-30 12:38:18',1,96,145,5),(17,'2022-06-20 19:23:26',0,NULL,147,5),(18,'2022-09-27 15:12:55',1,0,147,5),(19,'2022-06-20 19:23:35',0,NULL,149,5),(20,'2022-09-27 15:12:15',1,99,149,5),(21,'2022-06-22 22:39:49',0,NULL,151,5),(22,'2022-10-02 18:09:06',1,100,151,5),(23,'2022-06-22 22:43:53',0,NULL,153,5),(24,'2022-09-29 21:27:03',1,99,153,5),(25,'2022-09-29 21:27:06',1,99,203,5),(26,'2022-09-30 14:35:53',1,100,346,5),(27,'2022-09-22 15:57:44',1,NULL,524,5);
/*!40000 ALTER TABLE `trb_somfy_50_e` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`fincahazard`@`localhost`*/ /*!50003 TRIGGER trigger_trb_somfy_50_e
   AFTER UPDATE ON trb_somfy_50_e
   FOR EACH ROW
   BEGIN

   IF NEW.domo = 5 THEN
      IF NEW.borna = 0 THEN
         UPDATE estor SET estado = NEW.valor, fecha = now()
         WHERE id = (SELECT codigo_estor FROM relacion_estor WHERE rb_e = NEW.codigo_rb AND codigo_tp_e_estado = NEW.id);
      ELSE
         UPDATE estor SET consigna = NEW.valor, fecha = now()
         WHERE id = (SELECT codigo_estor FROM relacion_estor WHERE rb_e = NEW.codigo_rb AND codigo_tp_e_consigna = NEW.id);
      END IF;
   END IF;

   END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `trb_somfy_50_s`
--

DROP TABLE IF EXISTS `trb_somfy_50_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trb_somfy_50_s` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `borna` int(11) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `codigo_rb` int(11) DEFAULT NULL,
  `domo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trb_somfy_50_s`
--

LOCK TABLES `trb_somfy_50_s` WRITE;
/*!40000 ALTER TABLE `trb_somfy_50_s` DISABLE KEYS */;
INSERT INTO `trb_somfy_50_s` VALUES (1,'2022-06-20 19:29:56',0,NULL,132,5),(2,'2022-08-10 14:43:21',1,46,132,5),(3,'2022-06-20 19:41:36',0,NULL,134,5),(4,'2022-09-07 16:42:57',1,0,134,5),(5,'2022-06-20 19:42:25',0,NULL,136,5),(6,'2022-09-05 12:00:17',1,75,136,5),(7,'2022-06-20 19:43:15',0,NULL,138,5),(8,'2022-09-22 07:39:48',1,0,138,5),(9,'2022-06-20 19:43:50',0,NULL,140,5),(10,'2022-09-30 12:25:08',1,0,140,5),(11,'2022-06-20 19:44:40',0,NULL,142,5),(12,'2022-09-22 10:48:34',1,45,142,5),(13,'2022-06-20 19:45:22',0,NULL,144,5),(14,'2022-09-22 10:48:54',1,56,144,5),(15,'2022-06-20 19:46:07',0,NULL,146,5),(16,'2022-09-27 14:39:02',1,100,146,5),(17,'2022-06-20 19:46:41',0,NULL,148,5),(18,'2022-09-27 15:12:13',1,0,148,5),(19,'2022-06-20 19:47:18',0,NULL,150,5),(20,'2022-09-27 15:11:41',1,100,150,5),(21,'2022-06-22 22:46:23',0,NULL,152,5),(22,'2022-09-29 11:05:42',1,100,152,5),(23,'2022-06-22 22:47:29',0,NULL,154,5),(24,'2022-09-29 11:00:49',1,77,154,5),(25,'2022-07-02 14:02:30',0,NULL,204,5),(26,'2022-09-29 11:00:55',1,37,204,5),(27,'2022-08-29 11:39:23',0,NULL,347,5),(28,'2022-09-19 12:55:42',1,100,347,5),(29,'2022-09-22 16:07:11',0,NULL,525,5),(30,'2022-09-22 16:07:11',1,NULL,525,5);
/*!40000 ALTER TABLE `trb_somfy_50_s` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`fincahazard`@`localhost`*/ /*!50003 TRIGGER trigger_trb_somfy_50_s
   AFTER UPDATE ON trb_somfy_50_s
   FOR EACH ROW
   BEGIN

   IF NEW.domo = 5 THEN
      IF NEW.borna = 0 THEN
         UPDATE estor SET estado = NEW.valor, fecha = now()
         WHERE id = (SELECT codigo_estor FROM relacion_estor WHERE rb = NEW.codigo_rb AND codigo_tp_estado = NEW.id);
      ELSE
         UPDATE estor SET consigna = NEW.valor, fecha = now()
         WHERE id = (SELECT codigo_estor FROM relacion_estor WHERE rb = NEW.codigo_rb AND codigo_tp_consigna = NEW.id);
      END IF;
   END IF;

   END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `trb_somfy_rts_e`
--

DROP TABLE IF EXISTS `trb_somfy_rts_e`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trb_somfy_rts_e` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `borna` int(11) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `codigo_rb` int(11) DEFAULT NULL,
  `domo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trb_somfy_rts_e`
--

LOCK TABLES `trb_somfy_rts_e` WRITE;
/*!40000 ALTER TABLE `trb_somfy_rts_e` DISABLE KEYS */;
/*!40000 ALTER TABLE `trb_somfy_rts_e` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`fincahazard`@`localhost`*/ /*!50003 TRIGGER trigger_trb_somfy_rts_e
   AFTER UPDATE ON trb_somfy_rts_e
   FOR EACH ROW
   BEGIN

   IF NEW.domo = 7 THEN
      IF NEW.borna = 0 THEN
         UPDATE persianas SET estado = NEW.valor, fecha = now()
         WHERE id = (SELECT codigo_persianas FROM relacion_persianas WHERE rb = NEW.codigo_rb AND codigo_tp_estado = NEW.id);
      ELSE
         UPDATE persianas SET consigna = NEW.valor, fecha = now()
         WHERE id = (SELECT codigo_persianas FROM relacion_persianas WHERE rb = NEW.codigo_rb AND codigo_tp_consigna = NEW.id);
      END IF;
   END IF;

   END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `trb_somfy_rts_s`
--

DROP TABLE IF EXISTS `trb_somfy_rts_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trb_somfy_rts_s` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `borna` int(11) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `codigo_rb` int(11) DEFAULT NULL,
  `domo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trb_somfy_rts_s`
--

LOCK TABLES `trb_somfy_rts_s` WRITE;
/*!40000 ALTER TABLE `trb_somfy_rts_s` DISABLE KEYS */;
INSERT INTO `trb_somfy_rts_s` VALUES (1,'2022-09-22 11:51:56',0,2,122,7),(2,'2022-09-22 11:51:44',1,0,122,7),(3,'2022-09-22 12:05:50',0,3,123,7),(4,'2022-06-20 18:43:48',1,NULL,123,7),(5,'2022-09-22 11:57:59',0,3,124,7),(6,'2022-09-22 11:54:07',1,1,124,7),(7,'2022-09-22 11:58:03',0,3,125,7),(8,'2022-09-22 11:54:08',1,1,125,7),(9,'2022-09-22 11:58:07',0,3,126,7),(10,'2022-09-22 11:54:10',1,1,126,7),(11,'2022-09-22 11:58:19',0,3,127,7),(12,'2022-09-22 11:54:11',1,1,127,7),(13,'2022-06-28 16:43:59',0,1,128,7),(14,'2022-06-28 16:31:35',1,1,128,7),(15,'2022-06-28 16:44:05',0,1,129,7),(16,'2022-06-28 16:32:27',1,0,129,7),(17,'2022-06-28 16:44:24',0,1,130,7),(18,'2022-06-20 18:52:07',1,NULL,130,7);
/*!40000 ALTER TABLE `trb_somfy_rts_s` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`fincahazard`@`localhost`*/ /*!50003 TRIGGER trigger_trb_somfy_rts_s
   AFTER UPDATE ON trb_somfy_rts_s
   FOR EACH ROW
   BEGIN

   IF NEW.domo = 7 THEN
      IF NEW.borna = 0 THEN
         UPDATE persianas SET estado = NEW.valor, fecha = now()
         WHERE id = (SELECT codigo_persianas FROM relacion_persianas WHERE rb = NEW.codigo_rb AND codigo_tp_estado = NEW.id);
      ELSE
         UPDATE persianas SET consigna = NEW.valor, fecha = now()
         WHERE id = (SELECT codigo_persianas FROM relacion_persianas WHERE rb = NEW.codigo_rb AND codigo_tp_consigna = NEW.id);
      END IF;
   END IF;

   END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `trb_sugar_conv_e`
--

DROP TABLE IF EXISTS `trb_sugar_conv_e`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trb_sugar_conv_e` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `borna` int(11) DEFAULT NULL,
  `valor` varchar(15) DEFAULT NULL,
  `codigo_rb` int(11) DEFAULT NULL,
  `domo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trb_sugar_conv_e`
--

LOCK TABLES `trb_sugar_conv_e` WRITE;
/*!40000 ALTER TABLE `trb_sugar_conv_e` DISABLE KEYS */;
INSERT INTO `trb_sugar_conv_e` VALUES (1,'2022-08-30 23:48:21',2,NULL,493,0),(2,'2022-08-30 23:48:22',3,NULL,493,0),(3,'2022-08-30 23:48:22',4,NULL,493,0),(4,'2022-08-30 23:48:22',5,NULL,493,0),(5,'2022-08-30 23:48:22',6,NULL,493,0),(6,'2022-10-04 08:46:35',2,NULL,526,0),(7,'2022-10-04 08:46:35',3,NULL,526,0),(8,'2022-10-04 08:46:36',4,NULL,526,0),(9,'2022-10-04 08:46:37',5,NULL,526,0),(10,'2022-10-04 08:46:37',6,NULL,526,0);
/*!40000 ALTER TABLE `trb_sugar_conv_e` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`fincahazard`@`%`*/ /*!50003 TRIGGER trigger_trb_sugar_conv_e
   AFTER UPDATE ON trb_sugar_conv_e
   FOR EACH ROW
   BEGIN

   IF NEW.domo = 8 THEN
      CASE
         WHEN NEW.borna = 2 THEN
            UPDATE piscina SET ph = NEW.valor, fecha = now()
            WHERE id = (SELECT codigo_piscina FROM relacion_piscina WHERE rb_ph = NEW.codigo_rb AND codigo_tp_ph = NEW.id);
         WHEN NEW.borna = 3 THEN
            UPDATE piscina SET redox = NEW.valor, fecha = now()
            WHERE id = (SELECT codigo_piscina FROM relacion_piscina WHERE rb_redox = NEW.codigo_rb AND codigo_tp_redox = NEW.id);
         WHEN NEW.borna = 4 THEN
            UPDATE piscina SET nivel = NEW.valor, fecha = now()
            WHERE id = (SELECT codigo_piscina FROM relacion_piscina WHERE rb_nivel = NEW.codigo_rb AND codigo_tp_nivel = NEW.id);
         WHEN NEW.borna = 6 THEN
            UPDATE piscina SET temperatura = NEW.valor, fecha = now()
            WHERE id = (SELECT codigo_piscina FROM relacion_piscina WHERE rb_temp = NEW.codigo_rb AND codigo_tp_temp = NEW.id);
         ELSE
            BEGIN
            END;
      END CASE;
   END IF;

   END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `trb_sugar_conv_s`
--

DROP TABLE IF EXISTS `trb_sugar_conv_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trb_sugar_conv_s` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `borna` int(11) DEFAULT NULL,
  `valor` varchar(15) DEFAULT NULL,
  `codigo_rb` int(11) DEFAULT NULL,
  `domo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trb_sugar_conv_s`
--

LOCK TABLES `trb_sugar_conv_s` WRITE;
/*!40000 ALTER TABLE `trb_sugar_conv_s` DISABLE KEYS */;
/*!40000 ALTER TABLE `trb_sugar_conv_s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trb_sungrow_e`
--

DROP TABLE IF EXISTS `trb_sungrow_e`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trb_sungrow_e` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `borna` int(11) DEFAULT NULL,
  `valor` varchar(10) DEFAULT NULL,
  `codigo_rb` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trb_sungrow_e`
--

LOCK TABLES `trb_sungrow_e` WRITE;
/*!40000 ALTER TABLE `trb_sungrow_e` DISABLE KEYS */;
INSERT INTO `trb_sungrow_e` VALUES (1,'2022-07-07 17:24:40',0,NULL,307),(2,'2022-07-07 17:24:40',1,NULL,307),(3,'2022-07-07 17:24:40',2,NULL,307),(4,'2022-07-07 17:24:40',3,NULL,307),(5,'2022-07-07 17:24:40',4,NULL,307),(6,'2022-07-07 17:24:40',5,NULL,307),(7,'2022-07-07 17:24:42',6,NULL,307),(8,'2022-07-07 17:24:44',7,NULL,307),(9,'2022-07-07 17:24:44',8,NULL,307),(10,'2022-07-07 17:24:44',9,NULL,307),(11,'2022-07-07 17:24:44',10,NULL,307),(12,'2022-07-07 17:24:44',11,NULL,307),(13,'2022-07-07 17:24:44',12,NULL,307),(14,'2022-07-07 17:24:44',13,NULL,307),(15,'2022-07-07 17:24:44',14,NULL,307),(16,'2022-07-07 17:24:45',15,NULL,307),(17,'2022-07-07 17:24:46',16,NULL,307),(18,'2022-07-07 17:24:47',17,NULL,307),(19,'2022-07-07 17:24:47',18,NULL,307),(20,'2022-07-07 17:24:47',19,NULL,307),(21,'2022-07-07 17:24:47',20,NULL,307),(22,'2022-07-07 17:24:47',21,NULL,307),(23,'2022-07-07 17:24:48',22,NULL,307),(24,'2022-07-07 17:24:48',23,NULL,307),(25,'2022-07-07 17:24:48',24,NULL,307),(26,'2022-07-07 17:24:49',25,NULL,307),(27,'2022-07-07 17:24:49',26,NULL,307),(28,'2022-07-07 17:24:49',27,NULL,307),(29,'2022-07-07 17:24:49',28,NULL,307),(30,'2022-07-07 17:24:49',29,NULL,307),(31,'2022-07-07 17:24:49',30,NULL,307),(32,'2022-07-07 17:24:49',31,NULL,307),(33,'2022-07-07 17:24:49',32,NULL,307),(34,'2022-07-07 17:24:50',33,NULL,307),(35,'2022-07-07 17:24:50',34,NULL,307),(36,'2022-07-07 17:24:50',35,NULL,307),(37,'2022-07-07 17:24:50',36,NULL,307),(38,'2022-07-07 17:24:50',37,NULL,307),(39,'2022-07-07 17:24:50',38,NULL,307),(40,'2022-07-07 17:24:51',39,NULL,307),(41,'2022-07-07 17:24:51',40,NULL,307),(42,'2022-07-07 17:24:51',41,NULL,307),(43,'2022-07-11 15:13:08',42,NULL,307),(44,'2022-07-11 15:13:08',43,NULL,307),(45,'2022-07-11 15:13:08',44,NULL,307),(46,'2022-07-11 15:13:08',45,NULL,307),(47,'2022-07-11 15:13:08',46,NULL,307),(48,'2022-07-11 15:13:08',47,NULL,307);
/*!40000 ALTER TABLE `trb_sungrow_e` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trb_sungrow_s`
--

DROP TABLE IF EXISTS `trb_sungrow_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trb_sungrow_s` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `borna` int(11) DEFAULT NULL,
  `valor` varchar(10) DEFAULT NULL,
  `codigo_rb` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trb_sungrow_s`
--

LOCK TABLES `trb_sungrow_s` WRITE;
/*!40000 ALTER TABLE `trb_sungrow_s` DISABLE KEYS */;
/*!40000 ALTER TABLE `trb_sungrow_s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variables`
--

DROP TABLE IF EXISTS `variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(50) DEFAULT NULL,
  `valor` varchar(20) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variables`
--

LOCK TABLES `variables` WRITE;
/*!40000 ALTER TABLE `variables` DISABLE KEYS */;
INSERT INTO `variables` VALUES (1,'2022-04-22 10:16:44','Ala Norte','1',0),(2,'2022-04-22 10:16:44','Ala Sur','1',0),(3,'2022-04-25 04:37:14','consigna_temp_habitacion2','21',1),(4,'2022-04-25 04:37:14','rango_temp_habitacion2','1',1),(5,'2022-04-25 07:10:10','consigna_temp_habitacion3','22',1),(6,'2022-04-25 07:10:11','rango_temp_habitacion3','1',1),(7,'2022-04-25 09:49:32','consigna_temp_habitacion4','22',1),(8,'2022-04-25 09:49:32','rango_temp_habitacion4','1',1),(9,'2022-04-25 10:05:10','consigna_temp_habitacion5','22',1),(10,'2022-04-25 10:05:10','rango_temp_habitacion5','1',1),(11,'2022-04-25 10:19:14','consigna_temp_habitacion_estudio','22',1),(12,'2022-04-25 10:19:14','rango_temp_habitacion_estudio','1',1),(13,'2022-04-25 10:31:49','consigna_temp_habitacion_invitados','24',1),(14,'2022-04-25 10:31:49','rango_temp_habitacion_invitados','1',1),(15,'2022-07-06 08:27:29','consigna_sonda_biblioteca','20',1),(16,'2022-07-06 08:27:29','rango_sonda_biblioteca','1',1),(17,'2022-07-06 11:16:01','consigna_temp_sala_cine','24',1),(18,'2022-07-06 11:16:01','rango_temp_sala_cine','1',1),(19,'2022-07-06 11:38:06','consigna_temp_bar','22',1),(20,'2022-07-06 11:38:06','rango_temp_bar','1',1),(21,'2022-07-06 17:23:52','consigna_temp_sala_tv','24',1),(22,'2022-07-06 17:23:52','rango_temp_sala_tv','1',1),(23,'2022-07-06 21:25:29','consigna_temp_hab_alejandro','23',1),(24,'2022-07-06 21:25:30','rango_temp_hab_alejandro','1',1),(25,'2022-07-06 21:26:27','consigna_temp_bano_alejandro','22',1),(26,'2022-07-06 21:26:27','rango_temp_bano_alejandro','1',1),(27,'2022-07-06 21:27:32','consigna_temp_vest_alejandro','22',1),(28,'2022-07-06 21:27:33','rango_temp_vest_alejandro','1',1),(29,'2022-07-06 22:35:47','consigna_temp_hab_rachel','22',1),(30,'2022-07-06 22:35:47','rango_temp_hab_rachel','1',1),(31,'2022-07-06 22:37:13','consigna_temp_bano_rachel','22',1),(32,'2022-07-06 22:37:13','rango_temp_bano_rachel','1',1),(33,'2022-07-06 22:38:31','consigna_temp_vest_rachel','22',1),(34,'2022-07-06 22:38:31','rango_temp_vest_rachel','1',1),(35,'2022-07-07 09:03:31','consigna_temp_cocina_ppal','21',1),(36,'2022-07-07 09:03:31','rango_temp_cocina_ppal','1',1),(37,'2022-07-07 09:08:09','consigna_temp_cocina_alejandro','21',1),(38,'2022-07-07 09:08:09','rango_temp_cocina_alejandro','1',1),(39,'2022-07-11 22:26:22','consigna_temp_comedor','18',1),(40,'2022-07-11 22:26:22','rango_temp_comedor','1',1),(41,'2022-07-14 09:57:43','consigna_temp_pas_hab','22',1),(42,'2022-07-14 09:57:43','rango_temp_pas_hab','1',1),(43,'2022-08-30 09:24:19','salidalimitada','15000',2),(44,'2022-08-30 09:24:19','salidalimitada','15000',2),(45,'2022-08-30 09:24:19','salidalimitada','15000',2),(46,'2022-08-30 09:24:19','salidalimitada','15000',2);
/*!40000 ALTER TABLE `variables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sistema_somosaguas'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `evento_mto_anual` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`fincahazard`@`localhost`*/ /*!50106 EVENT `evento_mto_anual` ON SCHEDULE EVERY 1 YEAR STARTS '2000-01-01 00:00:35' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN

   
   INSERT INTO mto_ot (dia, tipo)
   (SELECT concat(YEAR(now()),'-',MONTH(dia),'-',DAY(dia),' ', TIME(dia)) as dia, tipo
   FROM mto_ot
   WHERE YEAR(dia) = YEAR(now())- INTERVAL 1 YEAR);

   
   INSERT INTO mto_relacion_ot_programa (codigo_ot, codigo_programa, estado)
   (SELECT codigo_ot, codigo_programa, estado FROM mto_relacion_ot_programa as a
   INNER JOIN mto_ot as b ON b.id = a.codigo_ot
   WHERE YEAR(b.dia) = YEAR(now())- INTERVAL 1 YEAR);

   

   
   
   BLOCK2: BEGIN
      DECLARE done_prog INT DEFAULT 0;
      DECLARE cod_ot INT;
      DECLARE cod_prog_exce INT;
      DECLARE cod_prog INT;

      DECLARE cursor_ot_programa CURSOR FOR SELECT a.codigo_ot,a.codigo_programa
      FROM mto_relacion_ot_programa as a
      INNER JOIN mto_ot as b ON b.id = a.codigo_ot
      INNER JOIN mto_programa as c ON a.codigo_programa = c.id AND c.excepto = 1
      WHERE YEAR(b.dia) = YEAR(now());

      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done_prog = 1;

      OPEN cursor_ot_programa;

      ot_prog_loop: LOOP

      FETCH cursor_ot_programa INTO cod_ot, cod_prog_exce;

      IF done_prog THEN
      LEAVE ot_prog_loop;
      END IF;

      IF cod_prog_exce IS NOT NULL THEN
         SELECT id
         INTO cod_prog
         FROM mto_programa WHERE nemo = (SELECT nemo from mto_programa where id = cod_prog_exce) and excepto = 0;

         UPDATE mto_relacion_ot_programa SET codigo_programa = cod_prog
         WHERE codigo_ot = cod_ot;
      END IF;

      END LOOP;

      CLOSE cursor_ot_programa;
   END BLOCK2;
END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-04 10:49:11
