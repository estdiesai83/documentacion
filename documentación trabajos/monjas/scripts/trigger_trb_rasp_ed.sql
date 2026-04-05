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
