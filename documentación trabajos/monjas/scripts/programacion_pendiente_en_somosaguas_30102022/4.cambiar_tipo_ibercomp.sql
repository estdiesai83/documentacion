--
-- Table structure for table `trb_iber_8ed_modbus`
--

DROP TABLE IF EXISTS `th_iber_8ed_modbus`;
DROP TABLE IF EXISTS `trb_iber_8ed_modbus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trb_iber_8ed_modbus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `borna` int(11) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  `codigo_rb` int(11) DEFAULT NULL,
  `domo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trb_iber_8ed_modbus`
--

LOCK TABLES `trb_iber_8ed_modbus` WRITE;
/*!40000 ALTER TABLE `trb_iber_8ed_modbus` DISABLE KEYS */;
INSERT INTO `trb_iber_8ed_modbus` VALUES
(1,'2022-08-18 09:08:40',0,NULL,339,11),
(2,'2022-08-18 09:08:40',1,NULL,339,0),
(3,'2022-08-18 09:08:40',2,NULL,339,0),
(4,'2022-08-18 09:08:40',3,NULL,339,1),
(5,'2022-08-18 09:08:40',4,NULL,339,0),
(6,'2022-08-18 09:08:42',5,NULL,339,0),
(7,'2022-08-18 09:08:44',6,NULL,339,0),
(8,'2022-08-18 09:08:44',7,NULL,339,0),
(9,'2022-08-18 09:34:42',0,NULL,341,11),
(10,'2022-08-18 09:34:42',1,NULL,341,0),
(11,'2022-08-18 09:34:42',2,NULL,341,0),
(12,'2022-08-18 09:34:44',3,NULL,341,1),
(13,'2022-08-18 09:34:44',4,NULL,341,0),
(14,'2022-08-18 09:34:44',5,NULL,341,0),
(15,'2022-08-18 09:34:44',6,NULL,341,0),
(16,'2022-08-18 09:34:44',7,NULL,341,0),
(17,'2022-08-18 10:10:01',0,NULL,343,11),
(18,'2022-08-18 10:10:02',1,NULL,343,0),
(19,'2022-08-18 10:10:02',2,NULL,343,0),
(20,'2022-08-18 10:10:02',3,NULL,343,1),
(21,'2022-08-18 10:10:02',4,NULL,343,0),
(22,'2022-08-18 10:10:02',5,NULL,343,0),
(23,'2022-08-18 10:10:04',6,NULL,343,0),
(24,'2022-08-18 10:10:05',7,NULL,343,0),
(25,'2022-08-18 10:20:26',0,NULL,345,11),
(26,'2022-08-18 10:20:26',1,NULL,345,11),
(27,'2022-08-18 10:20:26',2,NULL,345,0),
(28,'2022-08-18 10:20:26',3,NULL,345,0),
(29,'2022-08-18 10:20:26',4,NULL,345,1),
(30,'2022-08-18 10:20:27',5,NULL,345,0),
(31,'2022-08-18 10:20:27',6,NULL,345,0),
(32,'2022-08-18 10:20:27',7,NULL,345,0);
/*!40000 ALTER TABLE `trb_iber_8ed_modbus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `th_iber_8ed_modbus`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `th_iber_8ed_modbus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_tp` int(11) DEFAULT NULL,
  `modulo` int(11) DEFAULT NULL,
  `fk` int(11) DEFAULT NULL,
  `argumentos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `inhibir` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `modulo` (`modulo`),
  KEY `codigo_tp` (`codigo_tp`),
  CONSTRAINT `_iber_8ed_modbus_thfk_1` FOREIGN KEY (`codigo_tp`) REFERENCES `trb_iber_8ed_modbus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `th_iber_8ed_modbus`
--

LOCK TABLES `th_iber_8ed_modbus` WRITE;
/*!40000 ALTER TABLE `th_iber_8ed_modbus` DISABLE KEYS */;
INSERT INTO `th_iber_8ed_modbus` VALUES
(1,4,4,NULL,'{\"floor\":\"1\",\"room\":\"2\",\"lights_group\":\"2\",\"zone\":\"112\",\"type\":\"0\",\"nemo\":\"14\"}',0),
(2,12,4,NULL,'{\"floor\":\"1\",\"room\":\"1\",\"lights_group\":\"1\",\"zone\":\"113\",\"type\":\"0\",\"nemo\":\"14\"}',0),
(3,20,4,NULL,'{\"floor\":\"1\",\"room\":\"3\",\"lights_group\":\"3\",\"zone\":\"114\",\"type\":\"0\",\"nemo\":\"14\"}',0),
(4,29,4,NULL,'{\"floor\":\"1\",\"room\":\"74\",\"lights_group\":\"4\",\"zone\":\"115\",\"type\":\"0\",\"nemo\":\"14\"}',0),
(5,9,4,NULL,'{\"floor\":\"1\",\"room\":\"1\",\"pumps_group\":\"1\",\"zone\":\"1\",\"type\":\"0\",\"nemo\":\"15\"}',0),
(6,1,4,NULL,'{\"floor\":\"1\",\"room\":\"2\",\"pumps_group\":\"2\",\"zone\":\"2\",\"type\":\"0\",\"nemo\":\"15\"}',0),
(7,17,4,NULL,'{\"floor\":\"1\",\"room\":\"3\",\"pumps_group\":\"3\",\"zone\":\"3\",\"type\":\"0\",\"nemo\":\"15\"}',0),
(8,25,4,NULL,'{\"floor\":\"1\",\"room\":\"74\",\"pumps_group\":\"4\",\"zone\":\"4\",\"type\":\"0\",\"nemo\":\"15\"}',0),
(9,26,4,NULL,'{\"floor\":\"1\",\"room\":\"74\",\"pumps_group\":\"5\",\"zone\":\"5\",\"type\":\"0\",\"nemo\":\"15\"}',0);
/*!40000 ALTER TABLE `th_iber_8ed_modbus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trb_iber_8sd_modbus`
--
DROP TABLE IF EXISTS `th_iber_8sd_modbus`;
DROP TABLE IF EXISTS `trb_iber_8sd_modbus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trb_iber_8sd_modbus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `borna` int(11) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  `codigo_rb` int(11) DEFAULT NULL,
  `domo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trb_iber_8sd_modbus`
--

LOCK TABLES `trb_iber_8sd_modbus` WRITE;
/*!40000 ALTER TABLE `trb_iber_8sd_modbus` DISABLE KEYS */;
INSERT INTO `trb_iber_8sd_modbus` VALUES
(1,'2022-08-18 09:03:09',0,NULL,338,11),
(2,'2022-08-18 09:03:31',1,NULL,338,0),
(3,'2022-08-18 09:03:55',2,NULL,338,0),
(4,'2022-08-18 09:04:46',3,NULL,338,1),
(5,'2022-08-18 09:31:19',0,NULL,340,11),
(6,'2022-08-18 09:31:44',1,NULL,340,0),
(7,'2022-08-18 09:32:03',2,NULL,340,0),
(8,'2022-08-18 09:32:25',3,NULL,340,1),
(9,'2022-08-18 10:07:57',0,NULL,342,11),
(10,'2022-08-18 10:08:18',1,NULL,342,0),
(11,'2022-08-18 10:08:40',2,NULL,342,0),
(12,'2022-08-18 10:08:58',3,NULL,342,1),
(13,'2022-08-18 10:17:59',0,NULL,344,11),
(14,'2022-08-18 10:18:44',1,NULL,344,11),
(15,'2022-08-18 10:19:09',2,NULL,344,0),
(16,'2022-08-18 10:19:34',3,NULL,344,0),
(17,'2022-08-18 10:19:50',4,NULL,344,1);
/*!40000 ALTER TABLE `trb_iber_8sd_modbus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `th_iber_8sd_modbus`
--


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `th_iber_8sd_modbus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_tp` int(11) DEFAULT NULL,
  `modulo` int(11) DEFAULT NULL,
  `fk` int(11) DEFAULT NULL,
  `argumentos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `inhibir` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `modulo` (`modulo`),
  KEY `codigo_tp` (`codigo_tp`),
  CONSTRAINT `_iber_8sd_modbus_thfk_1` FOREIGN KEY (`codigo_tp`) REFERENCES `trb_iber_8sd_modbus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `th_iber_8sd_modbus`
--

LOCK TABLES `th_iber_8sd_modbus` WRITE;
/*!40000 ALTER TABLE `th_iber_8sd_modbus` DISABLE KEYS */;
INSERT INTO `th_iber_8sd_modbus` VALUES
(1,1,3,NULL,'{\"trb\":\"54\",\"rb\":\"339\",\"terminal\":\"0\"}',0),
(2,2,3,NULL,'{\"trb\":\"54\",\"rb\":\"339\",\"terminal\":\"1\"}',0),
(3,3,3,NULL,'{\"trb\":\"54\",\"rb\":\"339\",\"terminal\":\"2\"}',0),
(4,4,3,NULL,'{\"trb\":\"54\",\"rb\":\"339\",\"terminal\":\"3\"}',0),
(5,5,3,NULL,'{\"trb\":\"54\",\"rb\":\"341\",\"terminal\":\"0\"}',0),
(6,6,3,NULL,'{\"trb\":\"54\",\"rb\":\"341\",\"terminal\":\"1\"}',0),
(7,7,3,NULL,'{\"trb\":\"54\",\"rb\":\"341\",\"terminal\":\"2\"}',0),
(8,8,3,NULL,'{\"trb\":\"54\",\"rb\":\"341\",\"terminal\":\"3\"}',0),
(9,13,3,NULL,'{\"trb\":\"54\",\"rb\":\"345\",\"terminal\":\"0\"}',0),
(10,14,3,NULL,'{\"trb\":\"54\",\"rb\":\"345\",\"terminal\":\"1\"}',0),
(11,15,3,NULL,'{\"trb\":\"54\",\"rb\":\"345\",\"terminal\":\"2\"}',0),
(12,16,3,NULL,'{\"trb\":\"54\",\"rb\":\"345\",\"terminal\":\"3\"}',0),
(13,17,3,NULL,'{\"trb\":\"54\",\"rb\":\"345\",\"terminal\":\"4\"}',0),
(14,4,4,NULL,'{\"floor\":\"1\",\"room\":\"2\",\"lights_group\":\"2\",\"zone\":\"112\",\"type\":\"0\",\"nemo\":\"14\"}',0),
(15,8,4,NULL,'{\"floor\":\"1\",\"room\":\"1\",\"lights_group\":\"1\",\"zone\":\"113\",\"type\":\"0\",\"nemo\":\"14\"}',0),
(16,12,4,NULL,'{\"floor\":\"1\",\"room\":\"3\",\"lights_group\":\"3\",\"zone\":\"114\",\"type\":\"0\",\"nemo\":\"14\"}',0),
(17,17,4,NULL,'{\"floor\":\"1\",\"room\":\"74\",\"lights_group\":\"4\",\"zone\":\"115\",\"type\":\"0\",\"nemo\":\"14\"}',0),
(18,1,4,NULL,'{\"floor\":\"1\",\"room\":\"2\",\"pumps_group\":\"2\",\"zone\":\"1\",\"type\":\"0\",\"nemo\":\"15\"}',0),
(19,5,4,NULL,'{\"floor\":\"1\",\"room\":\"1\",\"pumps_group\":\"1\",\"zone\":\"2\",\"type\":\"0\",\"nemo\":\"15\"}',0),
(20,9,4,NULL,'{\"floor\":\"1\",\"room\":\"3\",\"pumps_group\":\"3\",\"zone\":\"3\",\"type\":\"0\",\"nemo\":\"15\"}',0),
(21,13,4,NULL,'{\"floor\":\"1\",\"room\":\"74\",\"pumps_group\":\"4\",\"zone\":\"4\",\"type\":\"0\",\"nemo\":\"15\"}',0),
(22,14,4,NULL,'{\"floor\":\"1\",\"room\":\"74\",\"pumps_group\":\"5\",\"zone\":\"5\",\"type\":\"0\",\"nemo\":\"15\"}',0),
(23,9,3,NULL,'{\"trb\":\"54\",\"rb\":\"343\",\"terminal\":\"0\"}',0),
(24,10,3,NULL,'{\"trb\":\"54\",\"rb\":\"343\",\"terminal\":\"1\"}',0),
(25,11,3,NULL,'{\"trb\":\"54\",\"rb\":\"343\",\"terminal\":\"2\"}',0),
(26,12,3,NULL,'{\"trb\":\"54\",\"rb\":\"343\",\"terminal\":\"3\"}',0);
/*!40000 ALTER TABLE `th_iber_8sd_modbus` ENABLE KEYS */;
UNLOCK TABLES;


-- 8ed modbus
update iniciarhilostrb set trb = 54 where codigo_rb = 339;
update iniciarhilostrb set trb = 54 where codigo_rb = 341;
update iniciarhilostrb set trb = 54 where codigo_rb = 343;
update iniciarhilostrb set trb = 54 where codigo_rb = 345;
-- 8sd modbus
update iniciarhilostrb set trb = 55 where codigo_rb = 338;
update iniciarhilostrb set trb = 55 where codigo_rb = 340;
update iniciarhilostrb set trb = 55 where codigo_rb = 342;
update iniciarhilostrb set trb = 55 where codigo_rb = 344;

update trb_iber_8ed_modbus set fecha = now();
update trb_iber_8sd_modbus set fecha = now();

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_trb_iber_8sd_modbus
   AFTER UPDATE ON trb_iber_8sd_modbus
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
         WHERE id = (SELECT codigo_multimedia FROM relacion_multimedia WHERE rb_s_estado = NEW.codigo_rb AND codigo_tp_s_estado = NEW.id);
      WHEN NEW.domo = 11 THEN
         UPDATE bombas SET estado = NEW.valor, fecha = now()
         WHERE id = (SELECT codigo_bombas FROM relacion_bombas WHERE rb_s_estado = NEW.codigo_rb AND codigo_tp_s_estado = NEW.id);
      WHEN NEW.domo = 12 THEN
         UPDATE clima SET estado_fancoil = NEW.valor, fecha = now()
         WHERE id = (SELECT codigo_clima FROM relacion_clima WHERE rb_fancoil = NEW.codigo_rb AND codigo_tp_fancoil = NEW.id);
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


/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_trb_iber_8ed_modbus
   AFTER UPDATE ON trb_iber_8ed_modbus
   FOR EACH ROW
   BEGIN


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
      WHERE id = (SELECT codigo_clima FROM relacion_clima WHERE rb_e_estado = NEW.codigo_rb AND codigo_tp_e_estado = NEW.id);
      WHEN NEW.domo = 4 THEN
         UPDATE iot SET estado = NEW.valor, fecha = now()
         WHERE id = (SELECT codigo_iot FROM relacion_iot WHERE rb_e_estado = NEW.codigo_rb AND codigo_tp_e_estado = NEW.id);
      WHEN NEW.domo = 5 THEN
         UPDATE seguridad SET estado = NEW.valor, fecha = now()
         WHERE id = (SELECT codigo_seguridad FROM relacion_seguridad WHERE rb_estado = NEW.codigo_rb AND codigo_tp_estado = NEW.id);
      WHEN NEW.domo = 6 THEN
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
         UPDATE multimedia SET estado = NEW.valor, fecha = now()
         WHERE id = (SELECT codigo_multimedia FROM relacion_multimedia WHERE rb_e_estado = NEW.codigo_rb AND codigo_tp_e_estado = NEW.id);
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



-- salidas
update rb set tipotrb = 55 where id = 338;
update rb set tipotrb = 55 where id = 340;
update rb set tipotrb = 55 where id = 342;
update rb set tipotrb = 55 where id = 344;


-- entradas
update rb set tipotrb = 54 where id = 339;
update rb set tipotrb = 54 where id = 341;
update rb set tipotrb = 54 where id = 343;
update rb set tipotrb = 54 where id = 345;




-- +--------------+-------------+--------------------+--------------------+
-- | codigo_luces | rb_s_estado | codigo_tp_s_estado | codigo_tp_e_estado |
-- +--------------+-------------+--------------------+--------------------+
-- |          112 |         338 |                 23 |                 36 |
-- |          113 |         340 |                 27 |                 44 |
-- |          114 |         342 |                 31 |                 52 |
-- |          115 |         344 |                 36 |                 61 |
-- +--------------+-------------+--------------------+--------------------+


update relacion_luces set codigo_tp_e_estado = 4, codigo_tp_s_estado = 4  where id = 112;
update relacion_luces set codigo_tp_e_estado = 12, codigo_tp_s_estado = 8 where id = 113;
update relacion_luces set codigo_tp_e_estado = 20, codigo_tp_s_estado = 12 where id = 114;
update relacion_luces set codigo_tp_e_estado = 29, codigo_tp_s_estado = 17 where id = 115;


-- +---------------+-------------+--------------------+--------------------+
-- | codigo_bombas | rb_s_estado | codigo_tp_s_estado | codigo_tp_e_estado |
-- +---------------+-------------+--------------------+--------------------+
-- |             1 |         340 |                 24 |                 41 |
-- |             2 |         338 |                 20 |                 33 |
-- |             3 |         342 |                 28 |                 49 |
-- |             4 |         344 |                 32 |                 57 |
-- |             5 |         344 |                 33 |                 58 |
-- +---------------+-------------+--------------------+--------------------+

update relacion_bombas set codigo_tp_e_estado = 9, codigo_tp_s_estado = 5 where id = 1;
update relacion_bombas set codigo_tp_e_estado = 1, codigo_tp_s_estado = 1 where id = 2;
update relacion_bombas set codigo_tp_e_estado = 17, codigo_tp_s_estado = 9 where id = 3;
update relacion_bombas set codigo_tp_e_estado = 25, codigo_tp_s_estado = 13 where id = 4;
update relacion_bombas set codigo_tp_e_estado = 26, codigo_tp_s_estado = 14 where id = 5;


-- volver al original

-- volver al original
-- salidas
update rb set tipotrb = 23 where id = 338;
update rb set tipotrb = 23 where id = 340;
update rb set tipotrb = 23 where id = 342;
update rb set tipotrb = 23 where id = 344;


-- entradas
update rb set tipotrb = 21 where id = 339;
update rb set tipotrb = 21 where id = 341;
update rb set tipotrb = 21 where id = 343;
update rb set tipotrb = 21 where id = 345;

update relacion_luces set codigo_tp_e_estado = 36, codigo_tp_s_estado = 23 where id = 112;
update relacion_luces set codigo_tp_e_estado = 44, codigo_tp_s_estado = 27 where id = 113;
update relacion_luces set codigo_tp_e_estado = 52, codigo_tp_s_estado = 31 where id = 114;
update relacion_luces set codigo_tp_e_estado = 61, codigo_tp_s_estado = 36 where id = 115;

update relacion_bombas set codigo_tp_e_estado = 41, codigo_tp_s_estado = 24 where id = 1;
update relacion_bombas set codigo_tp_e_estado = 33, codigo_tp_s_estado = 20 where id = 2;
update relacion_bombas set codigo_tp_e_estado = 49, codigo_tp_s_estado = 28 where id = 3;
update relacion_bombas set codigo_tp_e_estado = 57, codigo_tp_s_estado = 32 where id = 4;
update relacion_bombas set codigo_tp_e_estado = 58, codigo_tp_s_estado = 33 where id = 5;
