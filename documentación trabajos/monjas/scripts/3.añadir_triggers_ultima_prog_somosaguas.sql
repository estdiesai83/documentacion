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


DROP TRIGGER IF EXISTS trigger_trb_ibercomp_sonda;


/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_trb_ibercomp_sonda
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

DROP TRIGGER IF EXISTS trigger_operacion_escena;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;

/*!50003 CREATE*/ /*!50003 TRIGGER trigger_operacion_escena
   AFTER UPDATE ON operacion
   FOR EACH ROW
   BEGIN

   DECLARE v_codigo_escena INT;
   DECLARE v_estado_escena INT;
   DECLARE v_hay_caso_1 INT;
   DECLARE v_num_ope INT;
   DECLARE v_cod_estancia INT;
   DECLARE v_escena_aux INT;

   DECLARE done INT DEFAULT 0;
   DECLARE cod_escena INT;

   DECLARE cursor_escena CURSOR FOR SELECT a.codigo_escena
   FROM relacion_escena_operacion as a
   INNER JOIN escenas as b
   ON b.id=a.codigo_escena
   WHERE a.codigo_operacion = NEW.id
   AND b.eliminado = 0;

   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

   OPEN cursor_escena;

   read_loop: LOOP

   FETCH cursor_escena INTO cod_escena;

   IF done THEN
   LEAVE read_loop;
   END IF;

   IF cod_escena IS NOT NULL THEN
      SELECT COUNT(a.codigo_operacion)
      INTO v_num_ope
      FROM relacion_escena_operacion as a
      WHERE a.codigo_escena=cod_escena;

      SELECT COUNT(a.codigo_operacion)
      INTO v_hay_caso_1
      FROM relacion_escena_operacion as a
      JOIN operacion as b
      ON a.codigo_operacion = b.id
      WHERE a.codigo_escena=cod_escena and b.estado = 1;

      SELECT estado, codigo_estancia
      INTO v_estado_escena,v_cod_estancia
      FROM escenas
      WHERE id = cod_escena;

      IF (v_hay_caso_1 = v_num_ope) THEN
         CASE
            WHEN v_estado_escena = 0 THEN
               SELECT id
               INTO v_escena_aux
               FROM escenas
               WHERE codigo_estancia = v_cod_estancia AND estado != 0;


               UPDATE escenas SET estado = 0 WHERE codigo_estancia = v_cod_estancia and estado != 0;

               UPDATE escenas SET estado = 1 WHERE id =cod_escena;
               SET @exec_var = sys_exec(CONCAT("curl -d scene_id=",cod_escena," POST http://localhost:1519/ddbb/activateScene"));

               SET @exec_var = sys_exec(CONCAT("curl -d scene_id=",v_escena_aux," POST http://localhost:1519/ddbb/desactivateScene"));

            WHEN v_estado_escena = 2 THEN

               UPDATE escenas SET estado = 1 WHERE id =cod_escena;
               SET @exec_var = sys_exec(CONCAT("curl -d scene_id=",cod_escena," POST http://localhost:1519/ddbb/activateScene"));
            ELSE
               BEGIN
               END;
         END CASE;
      ELSEIF (v_hay_caso_1 != v_num_ope) THEN
         CASE
            WHEN v_estado_escena = 1 THEN
               UPDATE escenas SET estado = 2 WHERE id =cod_escena;
               SET @exec_var = sys_exec(CONCAT("curl -d scene_id=",cod_escena," POST http://localhost:1519/ddbb/modifyScene"));
            ELSE
               BEGIN
               END;
         END CASE;
      END IF;
   END IF;

   END LOOP;

   CLOSE cursor_escena;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;


DROP TRIGGER IF EXISTS trigger_trb_somfy_50_e;

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;

/*!50003 CREATE*/ /*!50003 TRIGGER trigger_trb_somfy_50_e
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

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
