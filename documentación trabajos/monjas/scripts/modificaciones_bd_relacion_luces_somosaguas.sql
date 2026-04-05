use sistema_pr_somosaguas;

update relacion_luces set codigo_tp_s_estado = 10 where codigo_luces = 6;
update relacion_luces set codigo_tp_s_estado = 11 where codigo_luces = 7;
update relacion_luces set codigo_tp_s_estado = 12 where codigo_luces = 8;
update relacion_luces set codigo_tp_s_estado = 13 where codigo_luces = 9;
update relacion_luces set codigo_tp_s_estado = 14 where codigo_luces = 10;

-- insert into estancia (nemo,codigo_planta,modelo,imagen,escenas, ambientes, rutinas) VALUES
-- ('Salon TV',4,2,'fotos/4994942c5440cbf2c329d4f127d150ab7504d051.jpg',0,0,0);

update luces set intensidad = 100 where id !=39;


DROP TABLE `relacion_consumos`;

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

DROP TABLE IF EXISTS `adjuntos`;
DROP TABLE IF EXISTS `galeria`;
DROP TABLE IF EXISTS `documento`;


--
-- Table structure for table `adjuntos`
--
CREATE TABLE `adjuntos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `tipo` int(11) DEFAULT NULL,
  `ruta` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `galeria`
--
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

--
-- Table structure for table `documento`
--
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
) ENGINE=InnoDB DEFAULT CHARSET=latin ;


use sistema_somosaguas;

update relacion_luces set codigo_tp_s_estado = 10 where codigo_luces = 6;
update relacion_luces set codigo_tp_s_estado = 11 where codigo_luces = 7;
update relacion_luces set codigo_tp_s_estado = 12 where codigo_luces = 8;
update relacion_luces set codigo_tp_s_estado = 13 where codigo_luces = 9;
update relacion_luces set codigo_tp_s_estado = 14 where codigo_luces = 10;

insert into estancia (nemo,codigo_planta,modelo,imagen,escenas, ambientes, rutinas) VALUES
('Salon TV',4,2,'fotos/4994942c5440cbf2c329d4f127d150ab7504d051.jpg',0,0,0);

update luces set intensidad = 100 where id !=39;


DROP TABLE `relacion_consumos`;

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

DROP TABLE IF EXISTS `adjuntos`;
DROP TABLE IF EXISTS `galeria`;
DROP TABLE IF EXISTS `documento`;


--
-- Table structure for table `adjuntos`
--
CREATE TABLE `adjuntos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `tipo` int(11) DEFAULT NULL,
  `ruta` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `galeria`
--
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

--
-- Table structure for table `documento`
--
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

use sistema_pr_montecerrado;

DROP TABLE `relacion_consumos`;

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

DROP TABLE IF EXISTS `adjuntos`;
DROP TABLE IF EXISTS `galeria`;
DROP TABLE IF EXISTS `documento`;


--
-- Table structure for table `adjuntos`
--
CREATE TABLE `adjuntos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `tipo` int(11) DEFAULT NULL,
  `ruta` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `galeria`
--
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

--
-- Table structure for table `documento`
--
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
) ENGINE=InnoDB DEFAULT CHARSET=latin ;


use sistema_montecerrado;

DROP TABLE `relacion_consumos`;

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

DROP TABLE IF EXISTS `adjuntos`;
DROP TABLE IF EXISTS `galeria`;
DROP TABLE IF EXISTS `documento`;


--
-- Table structure for table `adjuntos`
--
CREATE TABLE `adjuntos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `tipo` int(11) DEFAULT NULL,
  `ruta` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `galeria`
--
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

--
-- Table structure for table `documento`
--
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
) ENGINE=InnoDB DEFAULT CHARSET=latin ;


use sistema_rudy_v2;

DROP TABLE IF EXISTS `adjuntos`;
DROP TABLE IF EXISTS `galeria`;
DROP TABLE IF EXISTS `documento`;


--
-- Table structure for table `adjuntos`
--
CREATE TABLE `adjuntos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `tipo` int(11) DEFAULT NULL,
  `ruta` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `galeria`
--
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

--
-- Table structure for table `documento`
--
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
) ENGINE=InnoDB DEFAULT CHARSET=latin ;




use sistema_pr_somosaguas;
DROP TRIGGER IF EXISTS trigger_luces;
DROP TRIGGER IF EXISTS trigger_iot;
DROP TRIGGER IF EXISTS trigger_clima;
DROP TRIGGER IF EXISTS trigger_estor;
DROP TRIGGER IF EXISTS trigger_persianas;


/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_luces
   AFTER UPDATE ON luces
   FOR EACH ROW
   BEGIN

   DECLARE v_codigo_operacion int;
   DECLARE done INT DEFAULT 0;
   DECLARE cod_ope INT;

   DECLARE cursor_operacion CURSOR FOR SELECT b.codigo_operacion
   FROM escenas as a
   INNER JOIN relacion_escena_operacion as b ON a.id = b.codigo_escena
   INNER JOIN operacion_luces as c ON b.codigo_operacion = c.codigo_operacion
   WHERE a.codigo_estancia = NEW.codigo_estancia AND c.codigo_luces = NEW.id;

   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

   OPEN cursor_operacion;

   read_loop: LOOP

   FETCH cursor_operacion INTO cod_ope;

   IF done THEN
   LEAVE read_loop;
   END IF;

   IF cod_ope IS NOT NULL THEN
      UPDATE operacion SET estado = 0 WHERE id = cod_ope;
   END IF;

   END LOOP;

   CLOSE cursor_operacion;

   UPDATE operacion SET estado = 1
   WHERE id = (SELECT codigo_operacion FROM operacion_luces
   WHERE estado=NEW.estado AND intensidad = NEW.intensidad
   AND codigo_luces = NEW.id);
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

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_iot
   AFTER UPDATE ON iot
   FOR EACH ROW
   BEGIN

   DECLARE v_codigo_operacion int;
   DECLARE done INT DEFAULT 0;
   DECLARE cod_ope INT;

   DECLARE cursor_operacion CURSOR FOR SELECT b.codigo_operacion
   FROM escenas as a
   INNER JOIN relacion_escena_operacion as b ON a.id = b.codigo_escena
   INNER JOIN operacion_iot as c ON b.codigo_operacion = c.codigo_operacion
   WHERE a.codigo_estancia = NEW.codigo_estancia AND c.codigo_iot = NEW.id;

   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

   OPEN cursor_operacion;

   read_loop: LOOP

   FETCH cursor_operacion INTO cod_ope;

   IF done THEN
   LEAVE read_loop;
   END IF;

   IF cod_ope IS NOT NULL THEN
      UPDATE operacion SET estado = 0 WHERE id = cod_ope;
   END IF;

   END LOOP;

   CLOSE cursor_operacion;

   UPDATE operacion SET estado = 1
   WHERE id = (SELECT codigo_operacion FROM operacion_iot
   WHERE estado=NEW.estado AND codigo_iot = NEW.id);
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
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_clima
   AFTER UPDATE ON clima
   FOR EACH ROW
   BEGIN

   DECLARE v_codigo_operacion int;
   DECLARE done INT DEFAULT 0;
   DECLARE cod_ope INT;

   DECLARE cursor_operacion CURSOR FOR SELECT b.codigo_operacion
   FROM escenas as a
   INNER JOIN relacion_escena_operacion as b ON a.id = b.codigo_escena
   INNER JOIN operacion_clima as c ON b.codigo_operacion = c.codigo_operacion
   WHERE a.codigo_estancia = NEW.codigo_estancia AND c.codigo_clima = NEW.id;

   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

   OPEN cursor_operacion;

   read_loop: LOOP

   FETCH cursor_operacion INTO cod_ope;

   IF done THEN
   LEAVE read_loop;
   END IF;

   IF cod_ope IS NOT NULL THEN
      UPDATE operacion SET estado = 0 WHERE id = cod_ope;
   END IF;

   END LOOP;

   CLOSE cursor_operacion;

   UPDATE operacion SET estado = 1
   WHERE id = (SELECT codigo_operacion FROM operacion_clima
   WHERE estado=NEW.estado AND consigna = NEW.consigna
   AND codigo_clima = NEW.id);
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


/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_estor
   AFTER UPDATE ON estor
   FOR EACH ROW
   BEGIN

   DECLARE v_codigo_operacion int;
   DECLARE done INT DEFAULT 0;
   DECLARE cod_ope INT;

   DECLARE cursor_operacion CURSOR FOR SELECT b.codigo_operacion
   FROM escenas as a
   INNER JOIN relacion_escena_operacion as b ON a.id = b.codigo_escena
   INNER JOIN operacion_estores as c ON b.codigo_operacion = c.codigo_operacion
   WHERE a.codigo_estancia = NEW.codigo_estancia AND c.codigo_estor = NEW.id;

   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

   OPEN cursor_operacion;

   read_loop: LOOP

   FETCH cursor_operacion INTO cod_ope;

   IF done THEN
   LEAVE read_loop;
   END IF;

   IF cod_ope IS NOT NULL THEN
      UPDATE operacion SET estado = 0 WHERE id = cod_ope;
   END IF;

   END LOOP;

   CLOSE cursor_operacion;

   UPDATE operacion SET estado = 1
   WHERE id = (SELECT codigo_operacion FROM operacion_estores
   WHERE estado=NEW.estado AND nivel = NEW.nivel
   AND codigo_estor = NEW.id);
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

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_persianas
   AFTER UPDATE ON persianas
   FOR EACH ROW
   BEGIN

   DECLARE v_codigo_operacion int;
   DECLARE done INT DEFAULT 0;
   DECLARE cod_ope INT;

   DECLARE cursor_operacion CURSOR FOR SELECT b.codigo_operacion
   FROM escenas as a
   INNER JOIN relacion_escena_operacion as b ON a.id = b.codigo_escena
   INNER JOIN operacion_persianas as c ON b.codigo_operacion = c.codigo_operacion
   WHERE a.codigo_estancia = NEW.codigo_estancia AND c.codigo_persianas = NEW.id;

   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

   OPEN cursor_operacion;

   read_loop: LOOP

   FETCH cursor_operacion INTO cod_ope;

   IF done THEN
   LEAVE read_loop;
   END IF;

   IF cod_ope IS NOT NULL THEN
      UPDATE operacion SET estado = 0 WHERE id = cod_ope;
   END IF;

   END LOOP;

   CLOSE cursor_operacion;

   UPDATE operacion SET estado = 1
   WHERE id = (SELECT codigo_operacion FROM operacion_persianas
   WHERE estado=NEW.estado AND nivel = NEW.nivel
   AND codigo_persianas = NEW.id);
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
