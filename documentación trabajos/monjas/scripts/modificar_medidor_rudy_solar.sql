use sistema_rudy_v2;

RENAME TABLE medidor_smart_x100_139 TO medidor_smart_x100_135;

DROP TRIGGER IF EXISTS trigger_medidor_smart_x100_135;

DROP EVENT IF EXISTS `evento_anio_medidor_smart_x100_139`;
DROP EVENT IF EXISTS `evento_mes_medidor_smart_x100_139`;
DROP EVENT IF EXISTS `evento_dia_medidor_smart_x100_139`;
DROP EVENT IF EXISTS `evento_hora_medidor_smart_x100_139`;

DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER sistema_rudy_v2.trigger_medidor_smart_x100_135
   AFTER UPDATE ON sistema_rudy_v2.trb_smart_x100
   FOR EACH ROW
   BEGIN

   DECLARE v_valor text;
   DECLARE v_valor_factor text;
   DECLARE v_valor_patron text;

   DECLARE v_medicion_inicial_hora DECIMAL(15,2);

   DECLARE v_medicion_inicial_dia DECIMAL(15,2);

   DECLARE v_medicion_inicial_mes DECIMAL(15,2);

   DECLARE v_medicion_inicial_anio DECIMAL(15,2);

   IF NEW.id = 135 THEN


   SELECT valor
   INTO v_valor_factor
   FROM sistema_rudy_v2.medidor_smart_x100_135
   WHERE tipotcaso = '6';


   UPDATE sistema_rudy_v2.medidor_smart_x100_135 SET valor = NEW.valor, fecha = now(), fecha_fin = now(), resultado = NEW.valor*v_valor_factor
   WHERE tipotcaso = '0';



   SELECT medicion_inicial
   INTO v_medicion_inicial_anio
   FROM sistema_rudy_v2.medidor_smart_x100_135
   WHERE YEAR(fecha) = YEAR(NOW())
   AND tipotcaso = '1'
   ORDER BY fecha DESC LIMIT 1;

   IF v_medicion_inicial_anio IS NULL THEN
      INSERT IGNORE INTO sistema_rudy_v2.medidor_smart_x100_135
      (fecha, tipotcaso, medicion_inicial, medicion_final, medicion, fecha_inicio, fecha_fin, resultado)
      VALUES (now(), '1', NEW.valor, NEW.valor, '0', now(), now(), NEW.valor*v_valor_factor);
   ELSE
      UPDATE sistema_rudy_v2.medidor_smart_x100_135 SET fecha = now(),
      fecha_fin = now(), medicion_final = NEW.valor,
      medicion = NEW.valor - v_medicion_inicial_anio,
      resultado = (NEW.valor - v_medicion_inicial_anio)*v_valor_factor
      WHERE YEAR(fecha) = YEAR(NOW())
      AND tipotcaso = '1';
   END IF;



   SELECT medicion_inicial
   INTO v_medicion_inicial_mes
   FROM sistema_rudy_v2.medidor_smart_x100_135
   WHERE YEAR(fecha) = YEAR(NOW())
   AND MONTH(fecha) = MONTH(NOW())
   AND tipotcaso = '2'
   ORDER BY fecha DESC LIMIT 1;

   IF v_medicion_inicial_mes IS NULL THEN
      INSERT IGNORE INTO sistema_rudy_v2.medidor_smart_x100_135
      (fecha, tipotcaso, medicion_inicial, medicion_final, medicion, fecha_inicio, fecha_fin, resultado)
      VALUES (now(), '2', NEW.valor, NEW.valor, '0', now(), now(), NEW.valor*v_valor_factor);
   ELSE
      UPDATE sistema_rudy_v2.medidor_smart_x100_135 SET fecha = now(),
      fecha_fin = now(), medicion_final = NEW.valor,
      medicion = NEW.valor - v_medicion_inicial_mes,
      resultado = (NEW.valor - v_medicion_inicial_mes)*v_valor_factor
      WHERE YEAR(fecha) = YEAR(NOW())
      AND MONTH(fecha) = MONTH(NOW())
      AND tipotcaso = '2';
   END IF;



   SELECT medicion_inicial
   INTO v_medicion_inicial_dia
   FROM sistema_rudy_v2.medidor_smart_x100_135
   WHERE YEAR(fecha) = YEAR(NOW())
   AND MONTH(fecha) = MONTH(NOW())
   AND DAY(fecha) = DAY(NOW())
   AND tipotcaso = '3'
   ORDER BY fecha DESC LIMIT 1;

   IF v_medicion_inicial_dia IS NULL THEN
      INSERT IGNORE INTO sistema_rudy_v2.medidor_smart_x100_135
      (fecha, tipotcaso, medicion_inicial, medicion_final, medicion, fecha_inicio, fecha_fin, resultado)
      VALUES (now(), '3', NEW.valor, NEW.valor, '0', now(), now(), NEW.valor*v_valor_factor);
   ELSE
      UPDATE sistema_rudy_v2.medidor_smart_x100_135 SET fecha = now(),
      fecha_fin = now(), medicion_final = NEW.valor,
      medicion = NEW.valor - v_medicion_inicial_dia,
      resultado = (NEW.valor - v_medicion_inicial_dia)*v_valor_factor
      WHERE YEAR(fecha) = YEAR(NOW())
      AND MONTH(fecha) = MONTH(NOW())
      AND DAY(fecha) = DAY(NOW())
      AND tipotcaso = '3';
   END IF;



   SELECT medicion_inicial
   INTO v_medicion_inicial_hora
   FROM sistema_rudy_v2.medidor_smart_x100_135
   WHERE YEAR(fecha) = YEAR(NOW())
   AND MONTH(fecha) = MONTH(NOW())
   AND DAY(fecha) = DAY(NOW())
   AND HOUR(fecha) = HOUR(NOW())
   AND tipotcaso = '4'
   ORDER BY fecha DESC LIMIT 1;

   IF v_medicion_inicial_hora IS NULL THEN
      INSERT IGNORE INTO sistema_rudy_v2.medidor_smart_x100_135
      (fecha, tipotcaso, medicion_inicial, medicion_final, medicion, fecha_inicio, fecha_fin, resultado)
      VALUES (now(), '4', NEW.valor, NEW.valor, '0', now(), now(), NEW.valor*v_valor_factor);
   ELSE
      UPDATE sistema_rudy_v2.medidor_smart_x100_135 SET fecha = now(),
      fecha_fin = now(), medicion_final = NEW.valor,
      medicion = NEW.valor - v_medicion_inicial_hora,
      resultado = (NEW.valor - v_medicion_inicial_hora)*v_valor_factor
      WHERE YEAR(fecha) = YEAR(NOW())
      AND MONTH(fecha) = MONTH(NOW())
      AND DAY(fecha) = DAY(NOW())
      AND HOUR(fecha) = HOUR(NOW())
      AND tipotcaso = '4';
   END IF;

   ELSE
      UPDATE sistema_rudy_v2.medidor_smart_x100_135 SET tipotcaso=6 LIMIT 1;
   END IF;

   END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;



/*!50106 DROP EVENT IF EXISTS `evento_anio_medidor_smart_x100_135` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50106 EVENT `evento_anio_medidor_smart_x100_135` ON SCHEDULE EVERY 1 YEAR STARTS '2000-01-01 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
   DECLARE v_valores int;

   DECLARE v_medicion_final DECIMAL(15,2);

   SELECT COUNT(*)
   INTO v_valores
   FROM sistema_rudy_v2.medidor_smart_x100_135
   WHERE YEAR(fecha) = YEAR(now()) AND tipotcaso = '1';

   IF v_valores = 0 THEN
      SELECT medicion_final INTO v_medicion_final FROM sistema_rudy_v2.medidor_smart_x100_135 WHERE tipotcaso = 1 ORDER BY fecha DESC LIMIT 1;
      IF v_medicion_final IS NOT NULL THEN
         INSERT IGNORE INTO sistema_rudy_v2.medidor_smart_x100_135 (fecha, tipotcaso, medicion_inicial, medicion_final, medicion, fecha_inicio, fecha_fin, resultado) VALUES (now(), '1', v_medicion_final, v_medicion_final, '0',now(), now(), '0');
      END IF;
   END IF;

   END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `evento_anio_medidor_smart_x100_27` */;;
DELIMITER ;;



/*!50106 DROP EVENT IF EXISTS `evento_dia_medidor_smart_x100_135` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50106 EVENT `evento_dia_medidor_smart_x100_135` ON SCHEDULE EVERY 1 DAY STARTS '2000-01-01 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
   DECLARE v_valores int;

   DECLARE v_medicion_final DECIMAL(15,2);

   SELECT COUNT(*)
   INTO v_valores
   FROM sistema_rudy_v2.medidor_smart_x100_135
   WHERE YEAR(fecha) = YEAR(now()) AND MONTH(fecha) AND MONTH(now()) AND DAY(fecha) = DAY(now()) AND tipotcaso = '3';

   IF v_valores = 0 THEN
      SELECT medicion_final INTO v_medicion_final FROM sistema_rudy_v2.medidor_smart_x100_135 WHERE tipotcaso = 3 ORDER BY fecha DESC LIMIT 1;
      IF v_medicion_final IS NOT NULL THEN
         INSERT IGNORE INTO sistema_rudy_v2.medidor_smart_x100_135 (fecha, tipotcaso, medicion_inicial, medicion_final, medicion, fecha_inicio, fecha_fin, resultado) VALUES (now(), '3', v_medicion_final, v_medicion_final, '0', now(), now(), '0');
      END IF;
   END IF;

   END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `evento_dia_medidor_smart_x100_27` */;;
DELIMITER ;;


/*!50106 DROP EVENT IF EXISTS `evento_hora_medidor_smart_x100_135` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50106 EVENT `evento_hora_medidor_smart_x100_135` ON SCHEDULE EVERY 1 HOUR STARTS '2000-01-01 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
   DECLARE v_valores int;

   DECLARE v_medicion_final DECIMAL(15,2);

   SELECT COUNT(*)
   INTO v_valores
   FROM sistema_rudy_v2.medidor_smart_x100_135
   WHERE DATE(fecha) = DATE(now()) AND HOUR(fecha) = HOUR(now()) AND tipotcaso = '4';

   IF v_valores = 0 THEN
      SELECT medicion_final INTO v_medicion_final FROM sistema_rudy_v2.medidor_smart_x100_135 WHERE tipotcaso = 4 ORDER BY fecha DESC LIMIT 1;
      IF v_medicion_final IS NOT NULL THEN
         INSERT IGNORE INTO sistema_rudy_v2.medidor_smart_x100_135 (fecha, tipotcaso, medicion_inicial, medicion_final, medicion, fecha_inicio, fecha_fin, resultado) VALUES (now(), '4', v_medicion_final, v_medicion_final, '0', now(), now(),'0');
      END IF;
   END IF;

   END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `evento_hora_medidor_smart_x100_27` */;;
DELIMITER ;;

/*!50106 DROP EVENT IF EXISTS `evento_mes_medidor_smart_x100_135` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50106 EVENT `evento_mes_medidor_smart_x100_135` ON SCHEDULE EVERY 1 MONTH STARTS '2000-01-01 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
   DECLARE v_valores int;

   DECLARE v_medicion_final DECIMAL(15,2);

   SELECT COUNT(*)
   INTO v_valores
   FROM sistema_rudy_v2.medidor_smart_x100_135
   WHERE YEAR(fecha) = YEAR(now()) AND MONTH(fecha) = MONTH(now()) AND tipotcaso = '2';

   IF v_valores = 0 THEN
      SELECT medicion_final INTO v_medicion_final FROM sistema_rudy_v2.medidor_smart_x100_135 WHERE tipotcaso = 2 ORDER BY fecha DESC LIMIT 1;
      IF v_medicion_final IS NOT NULL THEN
         INSERT IGNORE INTO sistema_rudy_v2.medidor_smart_x100_135 (fecha, tipotcaso, medicion_inicial, medicion_final, medicion, fecha_inicio, fecha_fin, resultado) VALUES (now(), '2', v_medicion_final, v_medicion_final, '0',now(), now(), '0');
      END IF;
   END IF;

   END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `evento_mes_medidor_smart_x100_27` */;;
DELIMITER ;;
