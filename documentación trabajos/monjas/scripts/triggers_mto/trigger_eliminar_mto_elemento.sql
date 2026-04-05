DROP TRIGGER IF EXISTS trigger_eliminar_mto_elemento;


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
