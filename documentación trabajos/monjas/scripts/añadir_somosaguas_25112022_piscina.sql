
update comando set f3='sotano Z', nemo = 'Piscina Interior' where id = 53;


DROP TABLE IF EXISTS `relacion_piscina`;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `piscina` VALUES (1,'2022-11-25 11:28:20','Piscina Interior',41,31.9,8.04,0,744),(2,'2022-11-25 11:28:30','Piscina Exterior',6,27.9,7.6,0,665);


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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `relacion_piscina` VALUES (1,'2022-10-13 07:56:01',1,493,5,493,1,493,3,493,2),(2,'2022-11-23 12:09:21',2,531,10,531,6,531,8,531,7);

alter table piscina drop column nivel;
alter table piscina add column estado_luz int(11) default null;
alter table piscina add column estado_cobertor int(11) default null;
alter table piscina add column estado_depuracion int(11) default null;

alter table relacion_piscina drop column rb_nivel;
alter table relacion_piscina drop column codigo_tp_nivel;

alter table relacion_piscina add column rb_s_luz int(11) default -1;
alter table relacion_piscina add column codigo_tp_s_luz int(11) default -1;
alter table relacion_piscina add column rb_e_luz int(11) default -1;
alter table relacion_piscina add column codigo_tp_e_luz int(11) default -1;

alter table relacion_piscina add column rb_s_abrir_cobertor int(11) default -1;
alter table relacion_piscina add column codigo_tp_s_abrir_cobertor int(11) default -1;
alter table relacion_piscina add column rb_s_cerrar_cobertor int(11) default -1;
alter table relacion_piscina add column codigo_tp_s_cerrar_cobertor int(11) default -1;

alter table relacion_piscina add column rb_e_abrir_cobertor int(11) default -1;
alter table relacion_piscina add column codigo_tp_e_abrir_cobertor int(11) default -1;
alter table relacion_piscina add column rb_e_cerrar_cobertor int(11) default -1;
alter table relacion_piscina add column codigo_tp_e_cerrar_cobertor int(11) default -1;

alter table relacion_piscina add column rb_s_depuracion int(11) default -1;
alter table relacion_piscina add column codigo_tp_s_depuracion int(11) default -1;

alter table relacion_piscina add column rb_e_depuracion int(11) default -1;
alter table relacion_piscina add column codigo_tp_e_depuracion int(11) default -1;


DROP TRIGGER IF EXISTS trigger_trb_sugar_conv_e;

-- PISCINA EXTERIOR
update relacion_piscina set rb_s_depuracion = 500 where codigo_piscina = 2;
update relacion_piscina set codigo_tp_s_depuracion = 193 where codigo_piscina = 2;
update relacion_piscina set rb_e_depuracion = 499 where codigo_piscina = 2;
update relacion_piscina set codigo_tp_e_depuracion = 224 where codigo_piscina = 2;

update relacion_piscina set rb_s_abrir_cobertor = 500 where codigo_piscina = 2;
update relacion_piscina set codigo_tp_s_abrir_cobertor = 199 where codigo_piscina = 2;
update relacion_piscina set rb_s_cerrar_cobertor = 500 where codigo_piscina = 2;
update relacion_piscina set codigo_tp_s_cerrar_cobertor = 200 where codigo_piscina = 2;

update relacion_piscina set rb_e_abrir_cobertor = 499 where codigo_piscina = 2;
update relacion_piscina set codigo_tp_e_abrir_cobertor = 239 where codigo_piscina = 2;
update relacion_piscina set rb_e_cerrar_cobertor = 499 where codigo_piscina = 2;
update relacion_piscina set codigo_tp_e_cerrar_cobertor = 240 where codigo_piscina = 2;

-- socket
-- valor tipo*: 0 -> temperatura; 1-> estado_luz; 2-> redox; 3-> estado_cobertor; 4-> ph; 5-> estado depuracion
-- piscina interior
insert into th_sugar_conv_e (codigo_tp,modulo,argumentos,inhibir) VALUES
(1,4,'{"floor": "7", "room": "41", "zone": "1","type":"4" ,"nemo":"11"}',0),
insert into th_sugar_conv_e (codigo_tp,modulo,argumentos,inhibir) VALUES
(2,4,'{"floor": "7", "room": "41", "zone": "1","type":"2" ,"nemo":"11"}',0),
insert into th_sugar_conv_e (codigo_tp,modulo,argumentos,inhibir) VALUES
(5,4,'{"floor": "7", "room": "41", "zone": "1","type":"0" ,"nemo":"11"}',0),

-- piscina exterior
insert into th_sugar_conv_e (codigo_tp,modulo,argumentos,inhibir) VALUES
(6,4,'{"floor": "1", "room": "6", "zone": "2","type":"4" ,"nemo":"11"}',0),
insert into th_sugar_conv_e (codigo_tp,modulo,argumentos,inhibir) VALUES
(7,4,'{"floor": "1", "room": "6", "zone": "2","type":"2" ,"nemo":"11"}',0),
insert into th_sugar_conv_e (codigo_tp,modulo,argumentos,inhibir) VALUES
(10,4,'{"floor": "1", "room": "6", "zone": "2","type":"0" ,"nemo":"11"}',0),

insert into th_rasp_sd (codigo_tp,modulo,argumentos,inhibir) VALUES
(193,4,'{"floor": "1", "room": "6", "zone": "2","type":"5" ,"nemo":"11"}',0);

insert into th_rasp_ed (codigo_tp,modulo,argumentos,inhibir) VALUES
(224,4,'{"floor": "1", "room": "6", "zone": "2","type":"5" ,"nemo":"11"}',0),
(239,4,'{"id1":"239","id2":"240","floor": "1", "room": "6", "zone": "2","type":"3" ,"trb":"0","nemo":"11"}',0),
(240,4,'{"id1":"239","id2":"240","floor": "1", "room": "6", "zone": "2","type":"3" ,"trb":"0","nemo":"11"}',0);



/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_trb_sugar_conv_e
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
      WHEN NEW.domo = 8 THEN
         UPDATE piscina SET estado_depuracion = NEW.valor, fecha = now()
         WHERE id = (SELECT codigo_piscina FROM relacion_piscina WHERE rb_s_depuracion = NEW.codigo_rb AND codigo_tp_s_depuracion = NEW.id);

         UPDATE piscina SET estado_cobertor = NEW.valor, fecha = now()
         WHERE id = (SELECT codigo_piscina FROM relacion_piscina
         WHERE (rb_s_abrir_cobertor = NEW.codigo_rb AND codigo_tp_s_abrir_cobertor = NEW.id) OR
         (rb_s_cerrar_cobertor = NEW.codigo_rb AND codigo_tp_s_cerrar_cobertor = NEW.id));
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
         WHERE id = (SELECT codigo_clima FROM relacion_clima WHERE rb_fancoil = NEW.codigo_rb AND codigo_tp_fancoil = NEW.id);

         IF NEW.valor = 0 THEN
            UPDATE clima SET sleep_fancoil = 0, velocidad_fancoil = 0, fecha = now()
            WHERE id = (SELECT codigo_clima FROM relacion_clima WHERE rb_fancoil = NEW.codigo_rb AND codigo_tp_fancoil = NEW.id);
         END IF;
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

   DECLARE v_codigo_multimedia int;
   DECLARE v_codigo_acceso int;
   DECLARE v_tp_abierto int;
   DECLARE v_tp_cerrado int;
   DECLARE v_valor_abierto int;
   DECLARE v_valor_cerrado int;

   DECLARE v_codigo_clima int;
   DECLARE v_tp_vel1 int;
   DECLARE v_tp_vel2 int;
   DECLARE v_tp_vel3 int;
   DECLARE v_valor_vel1 int;
   DECLARE v_valor_vel2 int;
   DECLARE v_valor_vel3 int;

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
      WHEN NEW.domo = 8 THEN
         UPDATE piscina SET estado_depuracion = NEW.valor, fecha = now()
         WHERE id = (SELECT codigo_piscina FROM relacion_piscina WHERE rb_e_depuracion = NEW.codigo_rb AND codigo_tp_e_depuracion = NEW.id);

         SELECT codigo_piscina, codigo_tp_e_abrir, codigo_tp_e_cerrar
         INTO v_codigo_piscina, v_tp_abierto, v_tp_cerrado
         FROM relacion_piscina
         WHERE ((rb_e_abrir_cobertor = NEW.codigo_rb AND codigo_tp_e_abrir_cobertor = NEW.id) OR
         (rb_e_cerrar_cobertor = NEW.codigo_rb AND codigo_tp_e_cerrar_cobertor = NEW.id)) ;

         IF (v_tp_abierto = -1 AND v_tp_cerrado = -1) THEN
            UPDATE piscina SET estado_cobertor = NEW.valor, fecha = now()
            WHERE id = v_codigo_piscina;
         ELSE
            IF ( v_tp_abierto != -1 && v_tp_cerrado != -1) THEN
               SELECT valor
               INTO v_valor_abierto
               FROM trb_rasp_ed WHERE id = v_tp_abierto;

               SELECT valor
               INTO v_valor_cerrado
               FROM trb_rasp_ed WHERE id = v_tp_cerrado;

               IF (v_valor_abierto = 0 && v_valor_cerrado = 0) THEN
                  UPDATE piscina SET estado_cobertor = 2, fecha = now()
                  WHERE id = v_codigo_piscina;
               ELSEIF (v_valor_abierto = 1 && v_valor_cerrado = 0) THEN
                  UPDATE piscina SET estado_cobertor = 1, fecha = now()
                  WHERE id = v_codigo_piscina;
               ELSEIF (v_valor_abierto = 0 && v_valor_cerrado = 1) THEN
                  UPDATE piscina SET estado_cobertor = 0, fecha = now()
                  WHERE id = v_codigo_piscina;
               END IF;
            ELSE
               UPDATE piscina SET estado_cobertor = NEW.valor, fecha = now()
                  WHERE id = v_codigo_piscina;
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
      WHEN NEW.domo = 12 THEN
         -- UPDATE clima SET estado_fancoil = NEW.valor, fecha = now()
         -- WHERE id = (SELECT codigo_clima FROM relacion_clima WHERE rb_e_fancoil = NEW.codigo_rb AND codigo_tp_e_fancoil = NEW.id);

         SELECT codigo_clima, codigo_tp_e_vel1, codigo_tp_e_vel2,codigo_tp_e_vel3
         INTO v_codigo_clima, v_tp_vel1, v_tp_vel2, v_tp_vel3
         FROM relacion_clima
         WHERE ((rb_e_fancoil = NEW.codigo_rb AND codigo_tp_e_vel1 = NEW.id) OR
         (rb_e_fancoil = NEW.codigo_rb AND codigo_tp_e_vel2 = NEW.id) OR
         (rb_e_fancoil = NEW.codigo_rb AND codigo_tp_e_vel3 = NEW.id)) ;

         IF (v_tp_vel1 != -1 AND v_tp_vel2 != -1 AND v_tp_vel3 != -1) THEN
            SELECT valor
            INTO v_valor_vel1
            FROM trb_rasp_ed WHERE id = v_tp_vel1;

            SELECT valor
            INTO v_valor_vel2
            FROM trb_rasp_ed WHERE id = v_tp_vel2;

            SELECT valor
            INTO v_valor_vel3
            FROM trb_rasp_ed WHERE id = v_tp_vel3;

            IF (v_valor_vel1 = 0 && v_valor_vel2 = 0 && v_valor_vel3 = 0) THEN
               UPDATE clima SET velocidad_fancoil = 0, estado_fancoil = 0, sleep_fancoil = 0, fecha = now()
               WHERE id = v_codigo_clima;
            ELSEIF (v_valor_vel1 = 1 && v_valor_vel2 = 0 && v_valor_vel3 = 0) THEN
               UPDATE clima SET velocidad_fancoil = 1, estado_fancoil = 1, fecha = now()
               WHERE id = v_codigo_clima;
            ELSEIF (v_valor_vel1 = 0 && v_valor_vel2 = 1 && v_valor_vel3 = 0) THEN
               UPDATE clima SET velocidad_fancoil = 2, estado_fancoil = 1, fecha = now()
               WHERE id = v_codigo_clima;
            ELSEIF (v_valor_vel1 = 0 && v_valor_vel2 = 0 && v_valor_vel3 = 1) THEN
               UPDATE clima SET velocidad_fancoil = 3, estado_fancoil = 1, fecha = now()
               WHERE id = v_codigo_clima;
            END IF;
         END IF;
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
