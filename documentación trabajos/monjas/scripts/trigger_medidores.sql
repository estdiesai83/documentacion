DROP TRIGGER IF EXISTS trigger_medidor_analizador_9;


/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;

/*!50003 CREATE*/ /*!50003 TRIGGER sistema_rudy_v2.trigger_medidor_analizador_9
   AFTER UPDATE ON sistema_rudy_v2.trb_analizador
   FOR EACH ROW
   BEGIN

   DECLARE v_valor text;
   DECLARE v_valor_factor text;
   DECLARE v_valor_patron text;

   DECLARE v_medicion_inicial_minuto DECIMAL(15,2);

   DECLARE v_medicion_inicial_hora DECIMAL(15,2);

   DECLARE v_medicion_inicial_dia DECIMAL(15,2);

   DECLARE v_medicion_inicial_mes DECIMAL(15,2);

   DECLARE v_medicion_inicial_anio DECIMAL(15,2);

   IF NEW.id = 9 THEN

   UPDATE sistema_rudy_v2.medidor_analizador_9 SET valor = NEW.valor, fecha = now(), fecha_fin = now(), resultado = NEW.valorTOKEN-OPEv_valor_factor
   WHERE tipotcaso = '0';


   SELECT medicion_inicial
   INTO v_medicion_inicial_anio
   FROM sistema_rudy_v2.medidor_analizador_9
   WHERE YEAR(fecha) = YEAR(NOW())
   AND tipotcaso = '1'
   ORDER BY fecha DESC LIMIT 1;

   IF v_medicion_inicial_anio IS NULL THEN
      INSERT IGNORE INTO sistema_rudy_v2.medidor_analizador_9
      (fecha, tipotcaso, medicion_inicial, medicion_final, medicion, fecha_inicio, fecha_fin, resultado)
      VALUES (now(), '1', NEW.valor, NEW.valor, '0', now(), now()),NEW.valorTOKEN-OPEv_valor_factor;
   ELSE
      UPDATE sistema_rudy_v2.medidor_analizador_9 SET fecha = now(),
      fecha_fin = now(), medicion_final = NEW.valor,
      medicion = NEW.valor - v_medicion_inicial_anio
      WHERE YEAR(fecha) = YEAR(NOW())
      AND tipotcaso = '1';
   END IF;

   SELECT medicion_inicial
   INTO v_medicion_inicial_mes
   FROM sistema_rudy_v2.medidor_analizador_9
   WHERE YEAR(fecha) = YEAR(NOW())
   AND MONTH(fecha) = MONTH(NOW())
   AND tipotcaso = '2'
   ORDER BY fecha DESC LIMIT 1;

   IF v_medicion_inicial_mes IS NULL THEN
      INSERT IGNORE INTO sistema_rudy_v2.medidor_analizador_9
      (fecha, tipotcaso, medicion_inicial, medicion_final, medicion, fecha_inicio, fecha_fin)
      VALUES (now(), '2',NEW.valor, NEW.valor, '0', now(), now());
   ELSE
      UPDATE sistema_rudy_v2.medidor_analizador_9 SET fecha = now(),
      fecha_fin = now(), medicion_final = NEW.valor,
      medicion = NEW.valor - v_medicion_inicial_mes
      WHERE YEAR(fecha) = YEAR(NOW())
      AND MONTH(fecha) = MONTH(NOW())
      AND tipotcaso = '2';
   END IF;


   SELECT medicion_inicial
   INTO v_medicion_inicial_dia
   FROM sistema_rudy_v2.medidor_analizador_9
   WHERE YEAR(fecha) = YEAR(NOW())
   AND MONTH(fecha) = MONTH(NOW())
   AND DAY(fecha) = DAY(NOW())
   AND tipotcaso = '3'
   ORDER BY fecha DESC LIMIT 1;

   IF v_medicion_inicial_dia IS NULL THEN
      INSERT IGNORE INTO sistema_rudy_v2.medidor_analizador_9
      (fecha, tipotcaso, medicion_inicial, medicion_final, medicion, fecha_inicio, fecha_fin)
      VALUES (now(), '3', NEW.valor, NEW.valor, '0', now(), now());
   ELSE
      UPDATE sistema_rudy_v2.medidor_analizador_9 SET fecha = now(),
      fecha_fin = now(), medicion_final = NEW.valor,
      medicion = NEW.valor - v_medicion_inicial_dia
      WHERE YEAR(fecha) = YEAR(NOW())
      AND MONTH(fecha) = MONTH(NOW())
      AND DAY(fecha) = DAY(NOW())
      AND tipotcaso = '3';
   END IF;

   SELECT medicion_inicial
   INTO v_medicion_inicial_hora
   FROM sistema_rudy_v2.medidor_analizador_9
   WHERE YEAR(fecha) = YEAR(NOW())
   AND MONTH(fecha) = MONTH(NOW())
   AND DAY(fecha) = DAY(NOW())
   AND HOUR(fecha) = HOUR(NOW())
   AND tipotcaso = '4'
   ORDER BY fecha DESC LIMIT 1;

   IF v_medicion_inicial_hora IS NULL THEN
      INSERT IGNORE INTO sistema_rudy_v2.medidor_analizador_9
      (fecha, tipotcaso, medicion_inicial, medicion_final, medicion, fecha_inicio, fecha_fin)
      VALUES (now(), '4', NEW.valor, NEW.valor, '0', now(), now());
   ELSE
      UPDATE sistema_rudy_v2.medidor_analizador_9 SET fecha = now(),
      fecha_fin = now(), medicion_final = NEW.valor,
      medicion = NEW.valor - v_medicion_inicial_hora
      WHERE YEAR(fecha) = YEAR(NOW())
      AND MONTH(fecha) = MONTH(NOW())
      AND DAY(fecha) = DAY(NOW())
      AND HOUR(fecha) = HOUR(NOW())
      AND tipotcaso = '4';
   END IF;


   SELECT medicion_inicial
   INTO v_medicion_inicial_minuto
   FROM sistema_rudy_v2.medidor_analizador_9
   WHERE YEAR(fecha) = YEAR(NOW())
   AND MONTH(fecha) = MONTH(NOW())
   AND DAY(fecha) = DAY(NOW())
   AND HOUR(fecha) = HOUR(NOW())
   AND MINUTE(fecha) = MINUTE(NOW())
   AND tipotcaso = '5'
   ORDER BY fecha DESC LIMIT 1;

   IF v_medicion_inicial_minuto IS NULL THEN
      INSERT IGNORE INTO sistema_rudy_v2.medidor_analizador_9
      (fecha, tipotcaso, medicion_inicial, medicion_final, medicion, fecha_inicio, fecha_fin)
      VALUES (now(), '5', NEW.valor, NEW.valor, '0', now(), now());
   ELSE
      UPDATE sistema_rudy_v2.medidor_analizador_9 SET fecha = now(),
      fecha_fin = now(), medicion_final = NEW.valor,
      medicion = NEW.valor - v_medicion_inicial_minuto
      WHERE YEAR(fecha) = YEAR(NOW())
      AND MONTH(fecha) = MONTH(NOW())
      AND DAY(fecha) = DAY(NOW())
      AND HOUR(fecha) = HOUR(NOW())
      AND MINUTE(fecha) = MINUTE(NOW())
      AND tipotcaso = '5';
   END IF;

   ELSE
      UPDATE sistema_rudy_v2.medidor_analizador_9 SET tipotcaso=7 LIMIT 1;
   END IF;

   END; */;;
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
