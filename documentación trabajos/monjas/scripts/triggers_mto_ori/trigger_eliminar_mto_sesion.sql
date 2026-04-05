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
   AFTER DELETE ON mto_sesion
   FOR EACH ROW
   BEGIN

   -- Elimina caso en mto_relacion_ot_sesion y Mira si hay mas ot con el codigo_ot
   -- pertenenciente a la sesion eliminada para eliminar dicha ot
   DECLARE cod_ot INT;
   DECLARE num_ot INT;
   DECLARE cod_prog INT;
   DECLARE num_prog INT;

   SELECT codigo_ot
   INTO cod_ot
   FROM mto_relacion_ot_sesion
   WHERE codigo_sesion = OLD.id;

   SELECT COUNT(codigo_ot)
   INTO num_ot
   FROM mto_relacion_ot_sesion
   WHERE codigo_ot = cod_ot;

   DELETE FROM mto_relacion_ot_sesion WHERE codigo_sesion = OLD.id;

   IF num_ot > 1 THEN
      DELETE FROM mto_ot WHERE id = cod_ot;
   END IF;

   -- Elimina caso en mto_relacion_programa y Mira si hay mas sesiones
   -- pertenenciente al programa de dicha sesion
   SELECT codigo_programa
   INTO cod_prog
   FROM mto_relacion_programa
   WHERE codigo_sesion = OLD.id;

   SELECT COUNT(codigo_programa)
   INTO num_prog
   FROM mto_relacion_programa
   WHERE codigo_programa = cod_prog;

   DELETE FROM mto_relacion_programa WHERE codigo_sesion = OLD.id;

   IF num_prog = 1 THEN
      DELETE FROM mto_programa WHERE id = cod_prog;
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
