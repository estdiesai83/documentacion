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


   DELETE FROM mto_relacion_tareaini WHERE codigo_operacion = OLD.id;
   DELETE FROM mto_relacion_tareafin WHERE codigo_operacion = OLD.id;

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

   -- Borra la relacion modo
   DELETE FROM mto_relacion_modo WHERE codigo_operacion = OLD.id;

   -- Borra la operacion en mto_operacion_historico
   DELETE FROM mto_operacion_historico WHERE codigo_operacion = OLD.id;

   -- Borra la operacion en mto_operacion_previsto
   DELETE FROM mto_operacion_previsto WHERE codigo_operacion = OLD.id;

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
