-- habitacion estudio
update relacion_luces set rb_e_estado = 37, codigo_tp_e_estado = 67, rb_dali1 = 317, codigo_tp_dali1 = 91 where codigo_luces = 96;

-- piscina exterior cobertor
update trb_rasp_sd set domo = 8 where id = 193;

update trb_rasp_ed set domo = 8 where id = 224;
update trb_rasp_ed set domo = 8 where id = 239;
update trb_rasp_ed set domo = 8 where id = 240;


-- cuadro habitacion invitados

update trb_rasp_ed set domo = 9 where id = 81;
update trb_rasp_ed set domo = 9 where id = 82;
update trb_rasp_ed set domo = 9 where id = 83;
update trb_rasp_ed set domo = 9 where id = 84;

-- activar th
update th_rasp_sd set inhibir = 0 where inhibir = 1;
update th_rasp_ed set inhibir = 0 where inhibir = 1;
update th_rasp_ds18b20 set inhibir = 0 where inhibir = 1;
update th_sugar_conv_e set inhibir = 0 where inhibir = 1;
-- +----+-----------+--------+------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+---------+
-- | id | codigo_tp | modulo | fk   | argumentos                                                                                                                                                      | inhibir |
-- +----+-----------+--------+------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+---------+
-- |  5 |         5 |      6 |    0 | {"cod_consigna":"11","cod_rango":"12","trb_tpss":"23","rb_tpss":"528","terminal_tpss":"2","trb_tpse":"21","rb_tpse":"529","terminal_tpse":"2","id_climate":"1"} |       1 |
-- | 11 |         5 |      4 | NULL | {"floor":"3","room":"11","zone":"5","type":"0","nemo":"2"}                                                                                                      |       1 |
-- | 51 |        27 |      6 |    0 | {"cod_consigna":"59","cod_rango":"60","trb_tpss":"23","rb_tpss":"528","terminal_tpss":"0","trb_tpse":"21","rb_tpse":"529","terminal_tpse":"0","id_climate":"1"} |       1 |
-- +----+-----------+--------+------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------+---------+



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
         UPDATE automaticos SET estado = NEW.valor
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
   DECLARE v_codigo_piscina int;
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

         SELECT codigo_piscina, codigo_tp_e_abrir_cobertor, codigo_tp_e_cerrar_cobertor
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
         UPDATE automaticos SET estado = NEW.valor
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

   DECLARE v_codigo_multimedia int;
   DECLARE v_codigo_piscina int;
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
      WHEN NEW.domo = 8 THEN
         UPDATE piscina SET estado_depuracion = NEW.valor, fecha = now()
         WHERE id = (SELECT codigo_piscina FROM relacion_piscina WHERE rb_e_depuracion = NEW.codigo_rb AND codigo_tp_e_depuracion = NEW.id);

         SELECT codigo_piscina, codigo_tp_e_abrir_cobertor, codigo_tp_e_cerrar_cobertor
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
               FROM trb_iber_8ed_conv WHERE id = v_tp_abierto;

               SELECT valor
               INTO v_valor_cerrado
               FROM trb_iber_8ed_conv WHERE id = v_tp_cerrado;

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
         UPDATE automaticos SET estado = NEW.valor
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
               FROM trb_iber_8ed_conv WHERE id = v_tp_abierto;

               SELECT valor
               INTO v_valor_cerrado
               FROM trb_iber_8ed_conv WHERE id = v_tp_cerrado;

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
            FROM trb_iber_8ed_conv WHERE id = v_tp_vel1;

            SELECT valor
            INTO v_valor_vel2
            FROM trb_iber_8ed_conv WHERE id = v_tp_vel2;

            SELECT valor
            INTO v_valor_vel3
            FROM trb_iber_8ed_conv WHERE id = v_tp_vel3;

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

DROP TRIGGER IF EXISTS trigger_trb_iber_8ed_modbus;


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

   DECLARE v_codigo_multimedia int;
   DECLARE v_codigo_piscina int;
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
               FROM trb_iber_8ed_modbus WHERE id = v_tp_abierto;

               SELECT valor
               INTO v_valor_cerrado
               FROM trb_iber_8ed_modbus WHERE id = v_tp_cerrado;

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

         SELECT codigo_piscina, codigo_tp_e_abrir_cobertor, codigo_tp_e_cerrar_cobertor
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
               FROM trb_iber_8ed_modbus WHERE id = v_tp_abierto;

               SELECT valor
               INTO v_valor_cerrado
               FROM trb_iber_8ed_modbus WHERE id = v_tp_cerrado;

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
         UPDATE automaticos SET estado = NEW.valor
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
               FROM trb_iber_8ed_modbus WHERE id = v_tp_abierto;

               SELECT valor
               INTO v_valor_cerrado
               FROM trb_iber_8ed_modbus WHERE id = v_tp_cerrado;

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
            FROM trb_iber_8ed_modbus WHERE id = v_tp_vel1;

            SELECT valor
            INTO v_valor_vel2
            FROM trb_iber_8ed_modbus WHERE id = v_tp_vel2;

            SELECT valor
            INTO v_valor_vel3
            FROM trb_iber_8ed_modbus WHERE id = v_tp_vel3;

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

         IF NEW.valor = 0 THEN
            UPDATE clima SET sleep_fancoil = 0, fecha = now()
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

DROP TRIGGER IF EXISTS trigger_trb_iber_8sd_modbus;


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

         IF NEW.valor = 0 THEN
            UPDATE clima SET sleep_fancoil = 0, fecha = now()
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

DROP TRIGGER IF EXISTS trigger_trb_md02;


/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_trb_md02
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

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;

DROP TRIGGER IF EXISTS trigger_trb_rasp_co2;


/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_trb_rasp_co2
   AFTER UPDATE ON trb_rasp_co2
   FOR EACH ROW
   BEGIN

   IF NEW.domo = 2 THEN
      CASE
         WHEN NEW.borna = 0 THEN
            UPDATE clima SET co2 = NEW.valor, fecha = now()
            WHERE id = (SELECT codigo_clima FROM relacion_clima WHERE rb_co2 = NEW.codigo_rb AND codigo_tp_co2 = NEW.id);
         WHEN NEW.borna = 1 THEN
            UPDATE clima SET temperatura = NEW.valor, fecha = now()
            WHERE id = (SELECT codigo_clima FROM relacion_clima WHERE rb_temp = NEW.codigo_rb AND codigo_tp_temp = NEW.id);
         WHEN NEW.borna = 2 THEN
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

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;

DROP TRIGGER IF EXISTS trigger_trb_rasp_dali_s;


/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_trb_rasp_dali_s
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

   CASE
      WHEN NEW.borna = 1 THEN
         UPDATE luces SET intensidad = NEW.valor, fecha = now()
         WHERE id = (SELECT codigo_luces FROM relacion_luces WHERE rb_dali1 = NEW.codigo_rb AND codigo_tp_int1 = NEW.id);

         UPDATE luces SET intensidad = NEW.valor, fecha = now()
         WHERE id = (SELECT codigo_luces FROM relacion_luces WHERE rb_dali5 = NEW.codigo_rb AND codigo_tp_int5 = NEW.id);
      WHEN NEW.borna = 3 THEN
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
         WHEN NEW.borna = 4 THEN
            UPDATE luces SET temperatura = NEW.valor, fecha = now()
            WHERE id = (SELECT codigo_luces FROM relacion_luces WHERE rb_dali4 = NEW.codigo_rb AND codigo_tp_temp = NEW.id);
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

DROP TRIGGER IF EXISTS trigger_trb_rasp_ds18b20;


/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_trb_rasp_ds18b20
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

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;

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

DROP TRIGGER IF EXISTS trigger_trb_somfy_50_s;


/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_trb_somfy_50_s
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

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;

DROP TRIGGER IF EXISTS trigger_trb_somfy_rts_e;


/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_trb_somfy_rts_e
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

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;

DROP TRIGGER IF EXISTS trigger_trb_somfy_rts_s;


/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_trb_somfy_rts_s
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

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;

DROP TRIGGER IF EXISTS trigger_luces;
DROP TRIGGER IF EXISTS trigger_iot;
DROP TRIGGER IF EXISTS trigger_clima;
DROP TRIGGER IF EXISTS trigger_estor;
DROP TRIGGER IF EXISTS trigger_persianas;
DROP TRIGGER IF EXISTS trigger_bombas;

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

   DECLARE done INT DEFAULT 0;
   DECLARE cod_ope INT;

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

   IF cod_ope IS NOT NULL THEN
      UPDATE operacion SET estado = 0 WHERE id = cod_ope;
   END IF;

   END LOOP;

   CLOSE cursor_operacion;

   IF NEW.estado = 1 THEN
      UPDATE operacion SET estado = 1
      WHERE id = (SELECT codigo_operacion FROM operacion_luces
      WHERE estado=NEW.estado AND intensidad = NEW.intensidad
      AND codigo_luces = NEW.id);
   ELSE
      UPDATE operacion SET estado = 1
      WHERE id = (SELECT codigo_operacion FROM operacion_luces
      WHERE estado=NEW.estado
      AND codigo_luces = NEW.id);
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

   DECLARE done INT DEFAULT 0;
   DECLARE cod_ope INT;

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


   DECLARE done INT DEFAULT 0;
   DECLARE cod_ope INT;

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

   IF cod_ope IS NOT NULL THEN
      UPDATE operacion SET estado = 0 WHERE id = cod_ope;
   END IF;

   END LOOP;

   CLOSE cursor_operacion;

   IF NEW.consigna IS NULL THEN
      UPDATE operacion SET estado = 1
      WHERE id = (SELECT codigo_operacion FROM operacion_clima
      WHERE estado=NEW.estado AND codigo_clima = NEW.id AND consigna IS NULL);
   ELSE
      UPDATE operacion SET estado = 1
      WHERE id = (SELECT codigo_operacion FROM operacion_clima
      WHERE estado=NEW.estado AND consigna = NEW.consigna
      AND codigo_clima = NEW.id);
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


   DECLARE done INT DEFAULT 0;
   DECLARE cod_ope INT;

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

   IF cod_ope IS NOT NULL THEN
      UPDATE operacion SET estado = 0 WHERE id = cod_ope;
   END IF;

   END LOOP;

   CLOSE cursor_operacion;

   UPDATE operacion SET estado = 1
   WHERE id = (SELECT codigo_operacion FROM operacion_estores
   WHERE estado=NEW.estado AND consigna = NEW.consigna
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


   DECLARE done INT DEFAULT 0;
   DECLARE cod_ope INT;

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

   IF cod_ope IS NOT NULL THEN
      UPDATE operacion SET estado = 0 WHERE id = cod_ope;
   END IF;

   END LOOP;

   CLOSE cursor_operacion;

   UPDATE operacion SET estado = 1
   WHERE id = (SELECT codigo_operacion FROM operacion_persianas
   WHERE estado=NEW.estado AND consigna = NEW.consigna
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


/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_bombas
   AFTER UPDATE ON bombas
   FOR EACH ROW
   BEGIN

   DECLARE done INT DEFAULT 0;
   DECLARE cod_ope INT;

   DECLARE cursor_operacion CURSOR FOR SELECT b.codigo_operacion
   FROM operacion_bombas as b
   WHERE b.codigo_bombas = NEW.id;

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
   WHERE id = (SELECT codigo_operacion FROM operacion_bombas
   WHERE estado=NEW.estado AND codigo_bombas = NEW.id);
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
               SET @exec_var = sys_exec(CONCAT("curl -d scene_id=",cod_escena," POST http://localhost:1517/ddbb/activateScene"));

               SET @exec_var = sys_exec(CONCAT("curl -d scene_id=",v_escena_aux," POST http://localhost:1517/ddbb/desactivateScene"));

            WHEN v_estado_escena = 2 THEN

               UPDATE escenas SET estado = 1 WHERE id =cod_escena;
               SET @exec_var = sys_exec(CONCAT("curl -d scene_id=",cod_escena," POST http://localhost:1517/ddbb/activateScene"));
            ELSE
               BEGIN
               END;
         END CASE;
      ELSEIF (v_hay_caso_1 != v_num_ope) THEN
         CASE
            WHEN v_estado_escena = 1 THEN
               UPDATE escenas SET estado = 2 WHERE id =cod_escena;
               SET @exec_var = sys_exec(CONCAT("curl -d scene_id=",cod_escena," POST http://localhost:1517/ddbb/modifyScene"));
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

