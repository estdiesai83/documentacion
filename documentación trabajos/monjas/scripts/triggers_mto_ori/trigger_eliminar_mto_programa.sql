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
   AFTER DELETE ON mto_programa
   FOR EACH ROW
   BEGIN

   -- Elimina caso en mto_relacion_ot_programa y Mira si hay mas ot con el codigo_ot
   -- pertenenciente al programa eliminada para eliminar dicha ot
   DECLARE done INT DEFAULT 0;
   DECLARE cod_ot INT;

   DECLARE cursor_ot CURSOR FOR SELECT codigo_ot
   FROM mto_relacion_ot_programa
   WHERE codigo_programa = OLD.id;
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

   OPEN cursor_ot;

   read_loop: LOOP

   FETCH cursor_ot INTO cod_ot;

   IF done THEN
      LEAVE read_loop;
   END IF;

   IF cod_ot IS NOT NULL THEN
      DELETE FROM mto_ot WHERE id = cod_ot;
      DELETE FROM mto_relacion_ot_programa WHERE codigo_programa = OLD.id;
   END IF;

   END LOOP;

   CLOSE cursor_ot;

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
