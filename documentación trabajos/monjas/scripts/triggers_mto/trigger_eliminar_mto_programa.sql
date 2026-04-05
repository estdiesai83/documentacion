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
