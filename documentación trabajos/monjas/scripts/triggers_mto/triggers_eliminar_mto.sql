DROP TRIGGER IF EXISTS trigger_eliminar_mto_elemento;
DROP TRIGGER IF EXISTS trigger_eliminar_mto_sesion;
DROP TRIGGER IF EXISTS trigger_eliminar_mto_operacion;
DROP TRIGGER IF EXISTS trigger_eliminar_mto_ot;
DROP TRIGGER IF EXISTS trigger_eliminar_mto_programa;
DROP TRIGGER IF EXISTS trigger_eliminar_mto_modo;

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_eliminar_mto_elemento
   BEFORE DELETE ON mto_elemento_trb
   FOR EACH ROW
   BEGIN

   DECLARE done INT DEFAULT 0;
   DECLARE cod_ope INT;
   DECLARE num_operaciones INT;

   DECLARE cursor_operacion CURSOR FOR SELECT codigo_operacion, COUNT(codigo_operacion)
   FROM mto_relacion_operacion
   WHERE codigo_elemento = OLD.id group by codigo_operacion;
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

   OPEN cursor_operacion;

   read_loop: LOOP

   FETCH cursor_operacion INTO cod_ope, num_operaciones;

   IF done THEN
   LEAVE read_loop;
   END IF;

   IF cod_ope IS NOT NULL THEN
      IF num_operaciones = 1 THEN
         DELETE FROM mto_operacion WHERE id = cod_ope;
         -- DELETE FROM mto_relacion_operacion WHERE codigo_operacion = cod_ope;
      ELSEIF num_operaciones > 1 THEN
         DELETE FROM mto_relacion_operacion WHERE codigo_operacion = cod_ope;
      END IF;
   END IF;

   END LOOP;

   CLOSE cursor_operacion;

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

/*!50003 CREATE*/ /*!50003 TRIGGER trigger_eliminar_mto_modo
   BEFORE DELETE ON mto_modo
   FOR EACH ROW
   BEGIN

   -- Elimina caso en mto_relacion_ot_modo y y coge cada operacion
   -- pertenenciente al modo eliminado para eliminar dicha operacion
   DECLARE done INT DEFAULT 0;
   DECLARE cod_ope INT;

   DECLARE cursor_operacion CURSOR FOR SELECT codigo_operacion
   FROM mto_relacion_modo
   WHERE codigo_modo = OLD.id;
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

   OPEN cursor_operacion;

   read_loop: LOOP

   FETCH cursor_operacion INTO cod_ope;

   IF done THEN
      LEAVE read_loop;
   END IF;

   IF cod_ope IS NOT NULL THEN
      DELETE FROM mto_operacion WHERE id = cod_ope;
      -- DELETE FROM mto_relacion_modo WHERE codigo_operacion = cod_ope;
   END IF;

   END LOOP;

   CLOSE cursor_operacion;

   END */;;
DELIMITER ;


DROP TRIGGER IF EXISTS trigger_eliminar_mto_operacion;


/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_eliminar_mto_operacion
   BEFORE DELETE ON mto_operacion
   FOR EACH ROW
   BEGIN

   -- Coge los codigo_tarea de mto_relacion_tareaini
   -- para borrar los casos de tabla tarea donde id = codigo_tarea
   DECLARE cod_tarea_ini INT;
   DECLARE cod_tarea_fin INT;
   DECLARE num_ope int;
   DECLARE cod_modo int;

   SELECT codigo_tarea
   INTO cod_tarea_ini
   FROM mto_relacion_tareaini
   WHERE codigo_operacion = OLD.id;

   IF cod_tarea_ini IS NOT NULL THEN

      -- Coge los codigo_tarea de mto_relacion_tareafin
      -- para borrar los casos de tabla tarea donde id = codigo_tarea

      SELECT codigo_tarea
      INTO cod_tarea_fin
      FROM mto_relacion_tareafin WHERE codigo_operacion = OLD.id;

      DELETE FROM tarea WHERE id = cod_tarea_ini;

      IF cod_tarea_fin IS NOT NULL THEN
         DELETE FROM tarea WHERE id = cod_tarea_fin;
      END IF;
   END IF;


   -- Borra los casos de mto_relacion_tareaini y mto_relacion_tareadin
   DELETE FROM mto_relacion_tareaini WHERE codigo_operacion = OLD.id;
   DELETE FROM mto_relacion_tareafin WHERE codigo_operacion = OLD.id;


   -- Mira cuantos casos hay en mto_operacion con el codigo_sesion igual al
   -- de la operacion eliminada, si no hay ninguno eliminar sesion
   SELECT COUNT(codigo_sesion)
   INTO num_ope
   FROM mto_operacion WHERE codigo_sesion = OLD.codigo_sesion;

   IF num_ope = 0 THEN
      DELETE FROM mto_sesion WHERE id = OLD.codigo_sesion;
   END IF;

   -- Borra los casos de mto_relacion_tareaini y mto_relacion_tareafin
   DELETE FROM mto_relacion_tareaini WHERE codigo_operacion = OLD.id;
   DELETE FROM mto_relacion_tareafin WHERE codigo_operacion = OLD.id;

   -- Borra la relacion modo
   DELETE FROM mto_relacion_modo WHERE codigo_operacion = OLD.id;

   -- Borra la operacion en mto_operacion_historico
   DELETE FROM mto_operacion_historico WHERE codigo_operacion = OLD.id;

   -- Borra la operacion en mto_operacion_previsto
   DELETE FROM mto_operacion_previsto WHERE codigo_operacion = OLD.id;

   END */;;
DELIMITER ;

DROP TRIGGER IF EXISTS trigger_eliminar_mto_ot;


/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_eliminar_mto_ot
   BEFORE DELETE ON mto_ot
   FOR EACH ROW
   BEGIN

   -- borra los programas con excepto, con sus sesiones, operaciones
   DECLARE done_prog INT DEFAULT 0;
   DECLARE done_sesion_prog INT DEFAULT 0;

   DECLARE done_sesion_ot INT DEFAULT 0;

   DECLARE cod_prog INT;
   DECLARE cod_sesion_ot INT;
   DECLARE cod_sesion_prog INT;

   DECLARE cursor_ot_programa CURSOR FOR SELECT a.codigo_programa
   FROM mto_relacion_ot_programa AS a INNER JOIN mto_programa AS b
   ON a.codigo_programa=b.id WHERE b.excepto = 1 AND a.codigo_ot = OLD.id;
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done_prog = 1;

   OPEN cursor_ot_programa;

   prog_loop: LOOP

   FETCH cursor_ot_programa INTO cod_prog;

      IF done_prog THEN
      LEAVE prog_loop;
      END IF;

      IF cod_prog IS NOT NULL THEN
         BLOCK2: BEGIN
            DECLARE cursor_sesion CURSOR FOR SELECT codigo_sesion
            FROM mto_relacion_programa
            WHERE codigo_programa = cod_prog;
            DECLARE CONTINUE HANDLER FOR NOT FOUND SET done_sesion_prog = 1;

            OPEN cursor_sesion;

            session_loop: LOOP

            FETCH cursor_sesion INTO cod_sesion_prog;

               IF done_sesion_prog THEN
               LEAVE session_loop;
               END IF;

               DELETE FROM mto_sesion where id = cod_sesion_prog;

               -- DELETE FROM mto_relacion_programa WHERE codigo_sesion = cod_sesion_prog
               -- AND codigo_programa = cod_prog;

            END LOOP session_loop;

            CLOSE cursor_sesion;

            DELETE FROM mto_programa where id = cod_prog AND excepto = 1;

            -- DELETE FROM mto_relacion_ot_programa WHERE codigo_programa = cod_prog;
         END BLOCK2;
      END IF;

   END LOOP prog_loop;

   CLOSE cursor_ot_programa;

   BLOCK3: BEGIN

      DECLARE cursor_ot_sesion CURSOR FOR SELECT codigo_sesion
      FROM mto_relacion_ot_sesion
      WHERE codigo_ot = OLD.id;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done_sesion_ot = 1;

      OPEN cursor_ot_sesion;

      session_ot_loop: LOOP

      FETCH cursor_ot_sesion INTO cod_sesion_ot;

         IF done_sesion_ot THEN
         LEAVE session_ot_loop;
         END IF;

         IF cod_sesion_ot IS NOT NULL THEN
            DELETE FROM mto_sesion where id = cod_sesion_ot;

            -- DELETE FROM mto_relacion_ot_sesion WHERE codigo_ot = cod_sesion_ot;

         END IF;

      END LOOP session_ot_loop;

      CLOSE cursor_ot_sesion;

   END BLOCK3;

   END */;;
DELIMITER ;

DROP TRIGGER IF EXISTS trigger_eliminar_mto_programa;


/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_eliminar_mto_programa
   BEFORE DELETE ON mto_programa
   FOR EACH ROW
   BEGIN

   -- Elimina caso en mto_relacion_programa y coge sus sesiones
   DECLARE done INT DEFAULT 0;
   DECLARE cod_sesion INT;

   DECLARE cursor_sesion CURSOR FOR SELECT codigo_sesion
   FROM mto_relacion_programa
   WHERE codigo_programa = OLD.id;
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

   OPEN cursor_sesion;

   read_loop: LOOP

   FETCH cursor_sesion INTO cod_sesion;

   IF done THEN
      LEAVE read_loop;
   END IF;

   IF cod_sesion IS NOT NULL THEN
      DELETE FROM mto_sesion WHERE id = cod_sesion;
      DELETE FROM mto_relacion_programa WHERE codigo_sesion = cod_sesion;
   END IF;

   END LOOP;

   CLOSE cursor_sesion;

   END */;;
DELIMITER ;


DROP TRIGGER IF EXISTS trigger_eliminar_mto_sesion;


/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_eliminar_mto_sesion
   BEFORE DELETE ON mto_sesion
   FOR EACH ROW
   BEGIN

   -- Elimina caso en mto_operacion y coge sus operaciones
   DECLARE done INT DEFAULT 0;
   DECLARE cod_operacion INT;

   DECLARE cursor_operacion CURSOR FOR SELECT id
   FROM mto_operacion
   WHERE codigo_sesion = OLD.id;
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

   OPEN cursor_operacion;

   read_loop: LOOP

   FETCH cursor_operacion INTO cod_operacion;

   IF done THEN
      LEAVE read_loop;
   END IF;

   IF cod_operacion IS NOT NULL THEN
      DELETE FROM mto_operacion WHERE id = cod_operacion;
   END IF;

   END LOOP read_loop;

   CLOSE cursor_operacion;

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

