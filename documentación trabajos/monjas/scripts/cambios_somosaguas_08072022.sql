
-- socket estores
insert into th_somfy_50_s (codigo_tp, modulo, argumentos, inhibir) VALUES
(2,4,'{"nemo" : "9", "floor": "4", "room": "34", "zone": "1","type":"1"}',0),
(4,4,'{"nemo" : "9", "floor": "4", "room": "32", "zone": "2","type":"1"}',0),
(6,4,'{"nemo" : "9", "floor": "4", "room": "28", "zone": "3","type":"1"}',0),
(8,4,'{"nemo" : "9", "floor": "4", "room": "30", "zone": "4","type":"1"}',0),
(10,4,'{"nemo" : "9", "floor": "4", "room": "26", "zone": "5","type":"1"}',0),
(12,4,'{"nemo" : "9", "floor": "4", "room": "53", "zone": "6","type":"1"}',0),
(14,4,'{"nemo" : "9", "floor": "4", "room": "53", "zone": "7","type":"1"}',0),
(16,4,'{"nemo" : "9", "floor": "4", "room": "11", "zone": "8","type":"1"}',0),
(18,4,'{"nemo" : "9", "floor": "4", "room": "11", "zone": "9","type":"1"}',0),
(20,4,'{"nemo" : "9", "floor": "4", "room": "11", "zone": "10","type":"1"}',0),
(22,4,'{"nemo" : "9", "floor": "4", "room": "36", "zone": "11","type":"1"}',0),
(24,4,'{"nemo" : "9", "floor": "4", "room": "38", "zone": "12","type":"1"}',0),
(26,4,'{"nemo" : "9", "floor": "4", "room": "38", "zone": "13","type":"1"}',0);

update iniciarhilostrb set argumentos = REPLACE(argumentos,'"ip":"192.168.1.130","port":"9000"','"ip":"80.28.98.191","port":"53050"') where argumentos like '%192.168%';


DROP TABLE IF EXISTS `relacion_multimedia`;
DROP TABLE IF EXISTS `multimedia`;
DROP TABLE IF EXISTS `multimedia_previo_rutina`;


--
-- Table structure for table `multimedia`
--
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `multimedia_previo_rutina`
--
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


--
-- Table structure for table `relacion_multimedia`
--
CREATE TABLE `relacion_multimedia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo_multimedia` int(11) NOT NULL,
  `rb_e_estado` int(11) NOT NULL,
  `codigo_tp_e_estado` int(11) NOT NULL,
  `rb_s_estado` int(11) NOT NULL,
  `codigo_tp_s_estado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_multimedia` (`codigo_multimedia`),
  CONSTRAINT `relacion_multimedia_ibfk_1` FOREIGN KEY (`codigo_multimedia`) REFERENCES `multimedia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


insert into multimedia (nemo,codigo_estancia,estado,tipo) values ('Apertura proyector cine',14,1,1);
insert into multimedia (nemo,codigo_estancia,estado,tipo) values ('Cierre proyector cine',14,0,0);
-- habitacion alejandro
insert into multimedia (nemo,codigo_estancia,estado,tipo) values ('Abrir tv techo',22,1,1);
insert into multimedia (nemo,codigo_estancia,estado,tipo) values ('Cerrar tv techo',22,0,0);

insert into relacion_multimedia (codigo_multimedia,rb_e_estado,codigo_tp_e_estado,rb_s_estado,codigo_tp_s_estado) VALUES
(1,69,187,70,155),
(2,69,188,70,156),
(3,180,180,181,153),
(4,180,181,181,154);

insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(155,4,'{"nemo" : "10", "floor": "4", "room": "14", "zone": "1","type":"1"}',0),
(156,4,'{"nemo" : "10", "floor": "4", "room": "14", "zone": "2","type":"1"}',0),
(153,4,'{"nemo" : "10", "floor": "5", "room": "22", "zone": "3","type":"1"}',0),
(154,4,'{"nemo" : "10", "floor": "5", "room": "22", "zone": "4","type":"1"}',0);


insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(187,4,'{"nemo" : "10", "floor": "4", "room": "14", "zone": "1","type":"1"}',0),
(188,4,'{"nemo" : "10", "floor": "4", "room": "14", "zone": "2","type":"1"}',0),
(180,4,'{"nemo" : "10", "floor": "5", "room": "22", "zone": "3","type":"1"}',0),
(181,4,'{"nemo" : "10", "floor": "5", "room": "22", "zone": "4","type":"1"}',0);


update trb_rasp_sd set domo = 10 WHERE id = 155;
update trb_rasp_sd set domo = 10 WHERE id = 156;
update trb_rasp_sd set domo = 10 WHERE id = 153;
update trb_rasp_sd set domo = 10 WHERE id = 154;


update trb_rasp_ed set domo = 10 WHERE id = 187;
update trb_rasp_ed set domo = 10 WHERE id = 188;
update trb_rasp_ed set domo = 10 WHERE id = 180;
update trb_rasp_ed set domo = 10 WHERE id = 181;


insert into rb (codigo_comando, tipotrb ,numerobornas ) VALUES (39,32,6);

update rb set tipotrb = 31 where id = 308;
update rb set tipotrb = 32 where id = 309;
update tpss set codigo_rb = 309 where codigo_rb = 308;


INSERT INTO tpse (fecha, codigo_rb, nemoborna, registro, tiporegistro, numeroborna) VALUES
(now(), 308, "On/off del inversor de la sub-matriz","8002","trb1",42),
(now(), 308, "Establecer la potencia activa del inversor de la submatriz","8003","trb1",43),
(now(), 308, "Establecer la relacion de la potencia activa del inversor de la submatriz","8005","trb1",44),
(now(), 308, "Establecer la potencia reactiva del inversor de la submatriz","8007","trb1",45),
(now(), 308, "Establecer la relacion de la potencia reactiva del inversor de la submatriz","8009","trb1",46),
(now(), 308, "Establecer el factor de potencia del inversor de la submatriz","8011","trb1",47);


update persianas set nemo = REPLACE(nemo,' Alejandro','');
update persianas set nemo = REPLACE(nemo,' Dcha',' Derecha');
update persianas set nemo = REPLACE(nemo,' Izqd',' Izquierda');
update persianas set nemo = 'Persiana Lateral' where id =5;


update luces set nemo = REPLACE(nemo,'salon','sala cine');

-- comedor
update estancia set escenas=1,ambientes=1,rutinas=1 where id = 14;
-- estaba cosido en comedor en una luz el socket de desconexion usos varios de bibliotea
update th_rasp_sd set codigo_tp = 72 where id = 262;
update trb_rasp_sd set domo =1 where id = 96;

-- sala cine
update relacion_clima set rb_temp = 73 where codigo_clima = 8;
update trb_rasp_sd set domo = 2 where id = 152;
update trb_rasp_ed set domo = 2 where id = 179;

-- cocina
update estancia set escenas=1,ambientes=1,rutinas=1 where id = 15;

-- cocina alejandro
update estancia set escenas=1,ambientes=1,rutinas=1 where id = 17;


-- terraza bar
update estancia set escenas=1,ambientes=1,rutinas=1 where id = 18;
-- estaba mal la estancia
update th_rasp_sd set argumentos = '{"floor":"4","room":"18","zone":"37","type":"0","nemo":"0"}' where id = 134;
update th_rasp_sd set argumentos = '{"floor":"4","room":"18","zone":"38","type":"0","nemo":"0"}' where id = 135;


-- biblioteca
-- estaba cambiado los id, estaban las tpse en las tpss y viceversa
update relacion_iot set  rb_e_estado = 61, codigo_tp_e_estado = 96, rb_s_estado = 62,codigo_tp_s_estado = 72 where id = 33;
update trb_rasp_sd set domo = 4 where id = 72;
update trb_rasp_ed set domo = 4 where id = 96;


-- bar
update trb_rasp_sd set domo = 2 where id = 151;
update trb_rasp_ed set domo = 2 where id = 178;




-- valvulas ibercomp
update trb_iber_8sd_conv set domo = 2 where id <=6;
update trb_iber_8sd_conv set domo = 2 where id >=13;

update trb_iber_8ed_conv set domo = 2 where id <=6;
update trb_iber_8ed_conv set domo = 2 where id =17;
update trb_iber_8ed_conv set domo = 2 where id =18;
update trb_iber_8ed_conv set domo = 2 where id =25;
update trb_iber_8ed_conv set domo = 2 where id =26;
update trb_iber_8ed_conv set domo = 2 where id =27;
update trb_iber_8ed_conv set domo = 2 where id =28;


-- terraza sala tv
update estancia set escenas=1,ambientes=1,rutinas=1 where id = 72;

-- habitacion rachel
update persianas set nemo = 'Persiana Izquierda' where id = 7;
update persianas set nemo = 'Persiana Derecha' where id = 8;


-- habitacion 2
update trb_rasp_sd set domo = 2 where id = 9;
update trb_rasp_sd set domo = 0 where id = 55;
update trb_rasp_ed set domo = 2 where id = 10;

-- habitacion 3
update trb_rasp_sd set domo = 2 where id = 18;
update trb_rasp_ed set domo = 2 where id = 24;

-- habitacion 4
update trb_rasp_sd set domo = 2 where id = 27;
update trb_rasp_ed set domo = 2 where id = 37;

-- habitacion 5
update trb_rasp_sd set domo = 2 where id = 36;
update trb_rasp_ed set domo = 2 where id = 52;


-- habitacion estudio
update trb_rasp_sd set domo = 2 where id = 45;
update trb_rasp_ed set domo = 2 where id = 66;



-- vestidor alejandro
update operacion_luces set intensidad = -1 where id = 262;

-- vestidor rachel
update operacion_luces set intensidad = -1 where id = 268;

-- terraza raquel
update estancia set escenas=1,ambientes=1,rutinas=1 where id = 71;





DROP TRIGGER IF EXISTS trigger_trb_rasp_ed;


/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_trb_rasp_ed
   AFTER UPDATE ON trb_rasp_ed
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
   ELSEIF NEW.domo = 9 THEN
      UPDATE automaticos SET estado = NEW.valor, fecha = now()
      WHERE rb_e_estado = NEW.codigo_rb AND codigo_tp_e_estado = NEW.id;
   ELSEIF NEW.domo = 10 THEN
      UPDATE multimedia SET estado = NEW.valor, fecha = now()
      WHERE id = (SELECT codigo_multimedia FROM relacion_multimedia WHERE rb_e_estado = NEW.codigo_rb AND codigo_tp_e_estado = NEW.id);
   END IF;

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


DROP TRIGGER IF EXISTS trigger_trb_rasp_sd;


/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_trb_rasp_sd
   AFTER UPDATE ON trb_rasp_sd
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
   ELSEIF NEW.domo = 10 THEN
      UPDATE multimedia SET estado = NEW.valor, fecha = now()
      WHERE id = (SELECT codigo_multimedia FROM relacion_multimedia WHERE rb_s_estado = NEW.codigo_rb AND codigo_tp_s_estado = NEW.id);
   END IF;

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

DROP TRIGGER IF EXISTS trigger_trb_iber_8sd_conv;


/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_trb_iber_8sd_conv
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

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;

DROP TRIGGER IF EXISTS trigger_trb_iber_8ed_conv;


/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_trb_iber_8ed_conv
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

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
