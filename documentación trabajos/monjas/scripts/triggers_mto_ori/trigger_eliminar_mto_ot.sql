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
   AFTER DELETE ON mto_ot
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
