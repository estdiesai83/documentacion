
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
