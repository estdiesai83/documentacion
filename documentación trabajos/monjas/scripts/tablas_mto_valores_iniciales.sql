use sistema_pr_montecerrado;

--
-- Table structure for table `mto_accion_auto`
--
DROP TABLE IF EXISTS `mto_operacion_previsto`;
DROP TABLE IF EXISTS `mto_sesion_previsto`;
DROP TABLE IF EXISTS `mto_relacion_operacion`;
DROP TABLE IF EXISTS `mto_operacion_historico`;
DROP TABLE IF EXISTS `mto_sesion_historico`;
DROP TABLE IF EXISTS `mto_relacion_ot_programa`;
DROP TABLE IF EXISTS `mto_relacion_ot_sesion`;
DROP TABLE IF EXISTS `mto_relacion_tareaini`;
DROP TABLE IF EXISTS `mto_relacion_tareafin`;
DROP TABLE IF EXISTS `mto_relacion_modo`;
DROP TABLE IF EXISTS `mto_relacion_programa`;
DROP TABLE IF EXISTS `mto_relacion_sesion`;
DROP TABLE IF EXISTS `mto_tarea_bd`;
DROP TABLE IF EXISTS `mto_tarea_rpc`;
DROP TABLE IF EXISTS `mto_tarea`;

DROP TABLE IF EXISTS `mto_accion_auto`;
DROP TABLE IF EXISTS `mto_elemento_trb`;
DROP TABLE IF EXISTS `mto_operacion`;
DROP TABLE IF EXISTS `mto_modo`;
DROP TABLE IF EXISTS `mto_programa`;
DROP TABLE IF EXISTS `mto_sesion`;
DROP TABLE IF EXISTS `mto_ot`;


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
INSERT INTO `mto_accion_auto` VALUES (1,'accion 1',1,1);
/*!40000 ALTER TABLE `mto_accion_auto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mto_elemento_trb`
--

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
INSERT INTO `mto_elemento_trb` VALUES
(1,'RAMAL R1','7',5,0,1,1,2),
(2,'RAMAL R2','7',5,1,1,3,4),
(3,'RAMAL R3','7',5,2,1,5,6),
(4,'RAMAL R4','7',5,3,1,7,8),
(5,'RAMAL R5','7',5,12,1,9,10),
(6,'DEPURACION','7',5,10,2,11,12);
/*!40000 ALTER TABLE `mto_elemento_trb` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `mto_modo`
--

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
INSERT INTO `mto_modo` VALUES (1,'Standard',750,'#ffe353',1),(2,'Reducido',750,'#87e05c',1),(3,'Extendido',750,'#67b1e6',1);
/*!40000 ALTER TABLE `mto_modo` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `mto_sesion`
--

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
INSERT INTO `mto_sesion` VALUES (1,now(),'Sesion 1',750,'07:00:00',1,1,NULL,NULL),(2,now(),'Sesion 2',750,'20:00:00',1,1,NULL,NULL);
/*!40000 ALTER TABLE `mto_sesion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mto_operacion`
--


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
INSERT INTO `mto_operacion` VALUES
(1,'RAMAL R1',720,1,NULL),
(2,'RAMAL R2',730,1,NULL),
(3,'RAMAL R3',740,1,NULL),
(4,'RAMAL R4',750,1,NULL),
(5,'RAMAL R5',750,1,NULL),
(6,'RAMAL R1',720,1,NULL),
(7,'RAMAL R2',730,1,NULL),
(8,'RAMAL R3',740,1,NULL),
(9,'RAMAL R4',750,1,NULL),
(10,'RAMAL R5',750,1,NULL),
(11,'RAMAL R1',720,1,NULL),
(12,'RAMAL R2',730,1,NULL),
(13,'RAMAL R3',740,1,NULL),
(14,'RAMAL R4',750,1,NULL),
(15,'RAMAL R5',750,1,NULL),
(16,'RAMAL R1',720,1,1),
(17,'RAMAL R2',730,1,1),
(18,'RAMAL R3',740,1,1),
(19,'RAMAL R4',750,1,1),
(20,'RAMAL R5',750,1,1),
(21,'RAMAL R1',720,1,2),
(22,'RAMAL R2',730,1,2),
(23,'RAMAL R3',740,1,2),
(24,'RAMAL R4',750,1,2),
(25,'RAMAL R5',750,1,2);
/*!40000 ALTER TABLE `mto_operacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mto_ot`
--

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
INSERT INTO `mto_ot` VALUES
(1,now(),1),
(2,now() + INTERVAL 1 day,1),
(3,now() + INTERVAL 2 day,1),
(4,now() + INTERVAL 3 day,1),
(5,now() + INTERVAL 4 day,1),
(6,now() + INTERVAL 5 day,1),
(7,now() + INTERVAL 6 day,1);
/*!40000 ALTER TABLE `mto_ot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mto_programa`
--


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
INSERT INTO `mto_programa` VALUES (1,now(),'Programa 1',0,1,'#ffe353'),(2,now(),'Programa 2',0,1,'#87e05c');
/*!40000 ALTER TABLE `mto_programa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mto_relacion_modo`
--


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
INSERT INTO `mto_relacion_modo` VALUES
(1,1,1),
(2,2,1),
(3,3,1),
(4,4,1),
(5,5,1),
(6,6,2),
(7,7,2),
(8,8,2),
(9,9,2),
(10,10,2),
(11,11,3),
(12,12,3),
(13,13,3),
(14,14,3),
(15,15,3);
/*!40000 ALTER TABLE `mto_relacion_modo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mto_relacion_operacion`
--


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
INSERT INTO `mto_relacion_operacion` VALUES
(1,1,1,1),
(2,2,2,1),
(3,3,3,1),
(4,4,4,1),
(5,5,5,1),
(6,6,1,1),
(7,7,2,1),
(8,8,3,1),
(9,9,4,1),
(10,10,5,1),
(11,11,1,1),
(12,12,2,1),
(13,13,3,1),
(14,14,4,1),
(15,15,5,1),
(16,16,1,1),
(17,17,2,1),
(18,18,3,1),
(19,19,4,1),
(20,20,5,1),
(21,21,1,1),
(22,22,2,1),
(23,23,3,1),
(24,24,4,1),
(25,25,5,1);
/*!40000 ALTER TABLE `mto_relacion_operacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mto_relacion_ot_programa`
--


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
INSERT INTO `mto_relacion_ot_programa` VALUES
(1,1,1,1),
(2,2,1,1),
(3,3,1,1),
(4,4,1,1),
(5,5,1,1),
(6,6,1,1),
(7,7,1,1);
/*!40000 ALTER TABLE `mto_relacion_ot_programa` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `mto_relacion_ot_sesion`
--

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
INSERT INTO `mto_relacion_programa` VALUES (1,1,1),(2,2,2);
/*!40000 ALTER TABLE `mto_relacion_programa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mto_relacion_sesion`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
-- CREATE TABLE `mto_relacion_sesion` (
--   `id` int(11) NOT NULL AUTO_INCREMENT,
--   `codigo_operacion` int(11) DEFAULT NULL,
--   `codigo_sesion` int(11) DEFAULT NULL,
--   PRIMARY KEY (`id`),
--   KEY `codigo_operacion` (`codigo_operacion`),
--   KEY `codigo_sesion` (`codigo_sesion`),
--   CONSTRAINT `relsesion_ibfk_1` FOREIGN KEY (`codigo_operacion`) REFERENCES `mto_operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
--   CONSTRAINT `relsesion_ibfk_2` FOREIGN KEY (`codigo_sesion`) REFERENCES `mto_sesion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- /*!40101 SET character_set_client = @saved_cs_client */;

-- --
-- -- Dumping data for table `mto_relacion_sesion`
-- --

-- LOCK TABLES `mto_relacion_sesion` WRITE;
-- /*!40000 ALTER TABLE `mto_relacion_sesion` DISABLE KEYS */;
-- INSERT INTO `mto_relacion_sesion` VALUES
-- (1,16,1),
-- (2,17,1),
-- (3,18,1),
-- (4,19,1),
-- (5,20,1),
-- (6,21,2),
-- (7,22,2),
-- (8,23,2),
-- (9,24,2),
-- (10,25,2);
-- /*!40000 ALTER TABLE `mto_relacion_sesion` ENABLE KEYS */;
-- UNLOCK TABLES;



--
-- Table structure for table `mto_tarea`
--

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
INSERT INTO `mto_tarea` VALUES
(1,now(),0),
(2,now(),0),
(3,now(),0),
(4,now(),0),
(5,now(),0),
(6,now(),0),
(7,now(),0),
(8,now(),0),
(9,now(),0),
(10,now(),0),
(11,now(),0),
(12,now(),0);
/*!40000 ALTER TABLE `mto_tarea` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `mto_tarea_rpc`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mto_tarea_rpc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `argumentos` varchar(255) DEFAULT NULL,
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
INSERT INTO `mto_tarea_rpc` VALUES
(1,'{\"fk\":\"output_rpc\",\"trb\":\"7\",\"subtype\":\"0\",\"rb\":\"5\",\"terminal\":\"0\",\"value\":\"1\"}',1),
(2,'{\"fk\":\"output_rpc\",\"trb\":\"7\",\"subtype\":\"0\",\"rb\":\"5\",\"terminal\":\"0\",\"value\":\"0\"}',2),
(3,'{\"fk\":\"output_rpc\",\"trb\":\"7\",\"subtype\":\"0\",\"rb\":\"5\",\"terminal\":\"1\",\"value\":\"1\"}',3),
(4,'{\"fk\":\"output_rpc\",\"trb\":\"7\",\"subtype\":\"0\",\"rb\":\"5\",\"terminal\":\"1\",\"value\":\"0\"}',4),
(5,'{\"fk\":\"output_rpc\",\"trb\":\"7\",\"subtype\":\"0\",\"rb\":\"5\",\"terminal\":\"2\",\"value\":\"1\"}',5),
(6,'{\"fk\":\"output_rpc\",\"trb\":\"7\",\"subtype\":\"0\",\"rb\":\"5\",\"terminal\":\"2\",\"value\":\"0\"}',6),
(7,'{\"fk\":\"output_rpc\",\"trb\":\"7\",\"subtype\":\"0\",\"rb\":\"5\",\"terminal\":\"3\",\"value\":\"1\"}',7),
(8,'{\"fk\":\"output_rpc\",\"trb\":\"7\",\"subtype\":\"0\",\"rb\":\"5\",\"terminal\":\"3\",\"value\":\"0\"}',8),
(9,'{\"fk\":\"output_rpc\",\"trb\":\"7\",\"subtype\":\"0\",\"rb\":\"5\",\"terminal\":\"12\",\"value\":\"1\"}',9),
(10,'{\"fk\":\"output_rpc\",\"trb\":\"7\",\"subtype\":\"0\",\"rb\":\"5\",\"terminal\":\"12\",\"value\":\"0\"}',10),
(11,'{\"fk\":\"output_rpc\",\"trb\":\"7\",\"subtype\":\"0\",\"rb\":\"5\",\"terminal\":\"10\",\"value\":\"1\"}',11),
(12,'{\"fk\":\"output_rpc\",\"trb\":\"7\",\"subtype\":\"0\",\"rb\":\"5\",\"terminal\":\"10\",\"value\":\"0\"}',12);
/*!40000 ALTER TABLE `mto_tarea_rpc` ENABLE KEYS */;
UNLOCK TABLES;


CREATE TABLE `mto_tarea_bd` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `codigo_mtotarea` int(11) DEFAULT NULL,
   `tipo` int(11) DEFAULT NULL,
   `bd` varchar(70) DEFAULT NULL,
   `tabla` varchar(70) DEFAULT NULL,
   `tdatos` varchar(255) DEFAULT NULL,
   `valores` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_mtotarea` (`codigo_mtotarea`),
  CONSTRAINT `mto_tareabd_ibfk_1` FOREIGN KEY (`codigo_mtotarea`) REFERENCES `mto_tarea` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `mto_relacion_tareaini`
--

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
  CONSTRAINT `reltareaini_ibfk_2` FOREIGN KEY (`codigo_mtotareaini`) REFERENCES `mto_tarea` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reltareaini_ibfk_3` FOREIGN KEY (`codigo_tarea`) REFERENCES `tarea` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mto_relacion_tareaini`
--

LOCK TABLES `mto_relacion_tareaini` WRITE;
/*!40000 ALTER TABLE `mto_relacion_tareaini` DISABLE KEYS */;
INSERT INTO `mto_relacion_tareaini` VALUES
(1,1,1,NULL),
(2,2,3,NULL),
(3,3,5,NULL),
(4,4,7,NULL),
(5,5,9,NULL),
(6,6,1,NULL),
(7,7,3,NULL),
(8,8,5,NULL),
(9,9,7,NULL),
(10,10,9,NULL),
(11,11,1,NULL),
(12,12,3,NULL),
(13,13,5,NULL),
(14,14,7,NULL),
(15,15,9,NULL),
(16,16,1,NULL),
(17,17,3,NULL),
(18,18,5,NULL),
(19,19,7,NULL),
(20,20,9,NULL),
(21,21,1,NULL),
(22,22,3,NULL),
(23,23,5,NULL),
(24,24,7,NULL),
(25,25,9,NULL);
/*!40000 ALTER TABLE `mto_relacion_tareaini` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `mto_relacion_tareafin`
--

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
  CONSTRAINT `reltareafin_ibfk_2` FOREIGN KEY (`codigo_mtotareafin`) REFERENCES `mto_tarea` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reltareafin_ibfk_3` FOREIGN KEY (`codigo_tarea`) REFERENCES `tarea` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mto_relacion_tareafin`
--

LOCK TABLES `mto_relacion_tareafin` WRITE;
/*!40000 ALTER TABLE `mto_relacion_tareafin` DISABLE KEYS */;
INSERT INTO `mto_relacion_tareafin` VALUES
(1,1,2,NULL),
(2,2,4,NULL),
(3,3,6,NULL),
(4,4,8,NULL),
(5,5,10,NULL),
(6,6,2,NULL),
(7,7,4,NULL),
(8,8,6,NULL),
(9,9,8,NULL),
(10,10,10,NULL),
(11,11,2,NULL),
(12,12,4,NULL),
(13,13,6,NULL),
(14,14,8,NULL),
(15,15,10,NULL),
(16,16,2,NULL),
(17,17,4,NULL),
(18,18,6,NULL),
(19,19,8,NULL),
(20,20,10,NULL),
(21,21,2,NULL),
(22,22,4,NULL),
(23,23,6,NULL),
(24,24,8,NULL),
(25,25,10,NULL);
/*!40000 ALTER TABLE `mto_relacion_tareafin` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `mto_sesion_historico`
--


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
-- Table structure for table `mto_operacion_historico`
--


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
-- Table structure for table `mto_sesion_previsto`
--


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
-- Table structure for table `mto_operacion_previsto`
--


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

DROP TRIGGER IF EXISTS trigger_mto_sesion_previsto;


/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_mto_sesion_previsto
   AFTER INSERT ON mto_sesion_previsto
   FOR EACH ROW
   BEGIN

   INSERT INTO mto_operacion_previsto (codigo_sesion_previsto, tiempo,
      estado, nemo, codigo_operacion)
      ( SELECT NEW.id, tiempo, estado, nemo, id from mto_operacion WHERE
      codigo_sesion = NEW.codigo_sesion);


   END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;

DROP TRIGGER IF EXISTS trigger_mto_sesion_historico;


/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_mto_sesion_historico
   AFTER INSERT ON mto_sesion_historico
   FOR EACH ROW
   BEGIN

   INSERT INTO mto_operacion_historico (codigo_sesion_historico, tiempo,
      estado, nemo, codigo_operacion)
      ( SELECT NEW.id, tiempo, estado, nemo, id from mto_operacion WHERE
      codigo_sesion = NEW.codigo_sesion);


   END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
