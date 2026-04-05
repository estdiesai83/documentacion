DROP TRIGGER IF EXISTS trigger_trb_rasp_dali_s;


/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_trb_rasp_dali_s
   AFTER UPDATE ON trb_rasp_dali_s
   FOR EACH ROW
   BEGIN

   DECLARE v_rojo int;
   DECLARE v_verde int;
   DECLARE v_azul int;

   DECLARE v_tp_rojo int;
   DECLARE v_tp_verde int;
   DECLARE v_tp_azul int;
   DECLARE v_idluces int;

   IF NEW.borna = 1 THEN
      UPDATE luces SET intensidad = NEW.valor, fecha = now()
      WHERE id = (SELECT codigo_luces FROM relacion_luces WHERE rb_dali1 = NEW.codigo_rb AND codigo_tp_int1 = NEW.id);
   ELSEIF NEW.borna = 3 THEN
      SELECT codigo_luces, codigo_tp_rgb1, codigo_tp_rgb2, codigo_tp_rgb3
      INTO v_idluces, v_tp_rojo, v_tp_verde, v_tp_azul
      FROM relacion_luces WHERE (rb_dali1 = NEW.codigo_rb OR rb_dali2 = NEW.codigo_rb OR rb_dali3 = NEW.codigo_rb);

      SELECT IFNULL(valor,255)
         INTO v_rojo
         FROM trb_rasp_dali_s
         WHERE id = v_tp_rojo;

         SELECT IFNULL(valor,255)
         INTO v_verde
         FROM trb_rasp_dali_s
         WHERE id = v_tp_verde;

         SELECT IFNULL(valor,255)
         INTO v_azul
         FROM trb_rasp_dali_s
         WHERE id = v_tp_azul;

         UPDATE luces set rgb = CONCAT(v_rojo,"$",v_verde,"$",v_azul)
         WHERE id = v_idluces;
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
