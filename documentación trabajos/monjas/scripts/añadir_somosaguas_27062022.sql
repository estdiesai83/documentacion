update th_rasp_sd set inhibir = 1;
update th_rasp_ed set inhibir = 1;
update th_rasp_pulsador set inhibir = 1;
update th_rasp_ds18b20 set inhibir = 1;

update sistema_somosaguas.th_rasp_sd set inhibir = 1;
update sistema_somosaguas.th_rasp_ed set inhibir = 1;
update sistema_somosaguas.th_rasp_pulsador set inhibir = 1;
update sistema_somosaguas.th_rasp_ds18b20 set inhibir = 1;


DROP TRIGGER IF EXISTS trigger_trb_somfy_50_s;

update sistema_pr_somosaguas.iniciarhilostrb set argumentos = REPLACE(argumentos,'"time":"30"','"time":"60"');
update sistema_somosaguas.iniciarhilostrb set argumentos = REPLACE(argumentos,'"time":"30"','"time":"60"');

update sistema_pr_somosaguas.iniciarhilostrb set argumentos = REPLACE(argumentos,'""time"','"time"');
update sistema_somosaguas.iniciarhilostrb set argumentos = REPLACE(argumentos,'""time"','"time"');


update iniciarhilostrb set inhibir = 1 where trb = 42;
update sistema_somosaguas.iniciarhilostrb set inhibir = 1 where trb = 42;

-- sockets lavanderia
update th_rasp_ed set codigo_tp = 115 where id = 70;
update th_rasp_ed set codigo_tp = 116 where id = 71;



-- escenas -- vestibulo sala tv
insert into sistema_somosaguas.escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 48, 0, 1, 0);

update sistema_somosaguas.relacion_escena_operacion set codigo_escena = 93 where codigo_operacion=76;

insert into sistema_somosaguas.escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 48, 0, 1, 0);

update sistema_somosaguas.relacion_escena_operacion set codigo_escena = 94 where codigo_operacion=101;

update sistema_somosaguas.luces set nemo = "focos techo vestibulo sala tv",codigo_estancia = 48 where id = 55;


update sistema_somosaguas.th_rasp_sd set argumentos = '{"floor":"4","room":"48","zone":"55","type":"0","nemo":"0"}' where id = 171;
update sistema_somosaguas.th_rasp_ed set argumentos = '{"floor":"4","room":"48","zone":"55","type":"0","nemo":"0"}' where id = 74;


-- socket zona servicio
update th_rasp_ed set codigo_tp = 104 where id =59;
update th_rasp_ed set codigo_tp = 105 where id =60;
update th_rasp_ed set codigo_tp = 106 where id =61;
update th_rasp_ed set codigo_tp = 107 where id =62;
update th_rasp_ed set codigo_tp = 108 where id =63;
update th_rasp_ed set codigo_tp = 109 where id =64;
update th_rasp_ed set codigo_tp = 110 where id =65;
update th_rasp_ed set codigo_tp = 111 where id =66;

insert into th_rasp_sd (codigo_tp,modulo,argumentos,inhibir ) VALUES
(81,3,'{"trb":"0","rb":"80","terminal":"0"}',1),
(82,3,'{"trb":"0","rb":"80","terminal":"1"}',1),
(83,3,'{"trb":"0","rb":"80","terminal":"2"}',1),
(84,3,'{"trb":"0","rb":"80","terminal":"3"}',1),
(85,3,'{"trb":"0","rb":"80","terminal":"4"}',1),
(81,3,'{"trb":"0","rb":"80","terminal":"5"}',1),
(87,3,'{"trb":"0","rb":"80","terminal":"6"}',1),
(88,3,'{"trb":"0","rb":"80","terminal":"7"}',1),
(89,3,'{"trb":"0","rb":"80","terminal":"8"}',1),
(90,3,'{"trb":"0","rb":"80","terminal":"9"}',1),
(91,3,'{"trb":"0","rb":"80","terminal":"10"}',1);

update escenas set codigo_estancia = 56  where codigo_estancia = 45;


/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_trb_somfy_50_s
   AFTER UPDATE ON trb_somfy_50_s
   FOR EACH ROW
   BEGIN

   IF NEW.domo = 5 THEN
      IF NEW.borna = 0 THEN
         UPDATE estor SET estado = NEW.valor, fecha = now()
         WHERE id = (SELECT codigo_estor FROM relacion_estor WHERE rb = NEW.codigo_rb AND codigo_tp_estado = NEW.id);
      ELSE
         UPDATE estor SET consigna = NEW.valor, fecha = now()
         WHERE id = (SELECT codigo_estor FROM relacion_estor WHERE rb = NEW.codigo_rb AND codigo_tp_consigna = NEW.id);
      END IF;
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



DROP TRIGGER IF EXISTS trigger_trb_somfy_50_e;


/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_trb_somfy_50_e
   AFTER UPDATE ON trb_somfy_50_e
   FOR EACH ROW
   BEGIN

   IF NEW.domo = 5 THEN
      IF NEW.borna = 0 THEN
         UPDATE estor SET estado = NEW.valor, fecha = now()
         WHERE id = (SELECT codigo_estor FROM relacion_estor WHERE rb = NEW.codigo_rb AND codigo_tp_estado = NEW.id);
      ELSE
         UPDATE estor SET consigna = NEW.valor, fecha = now()
         WHERE id = (SELECT codigo_estor FROM relacion_estor WHERE rb = NEW.codigo_rb AND codigo_tp_consigna = NEW.id);
      END IF;
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


DROP TRIGGER IF EXISTS trigger_trb_somfy_rts_e;


/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_trb_somfy_rts_e
   AFTER UPDATE ON trb_somfy_rts_e
   FOR EACH ROW
   BEGIN

   IF NEW.domo = 7 THEN
      IF NEW.borna = 0 THEN
         UPDATE persianas SET estado = NEW.valor, fecha = now()
         WHERE id = (SELECT codigo_persianas FROM relacion_persianas WHERE rb = NEW.codigo_rb AND codigo_tp_estado = NEW.id);
      ELSE
         UPDATE persianas SET consigna = NEW.valor, fecha = now()
         WHERE id = (SELECT codigo_persianas FROM relacion_persianas WHERE rb = NEW.codigo_rb AND codigo_tp_consigna = NEW.id);
      END IF;
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

DROP TRIGGER IF EXISTS trigger_trb_somfy_rts_s;


/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_trb_somfy_rts_s
   AFTER UPDATE ON trb_somfy_rts_s
   FOR EACH ROW
   BEGIN

   IF NEW.domo = 7 THEN
      IF NEW.borna = 0 THEN
         UPDATE persianas SET estado = NEW.valor, fecha = now()
         WHERE id = (SELECT codigo_persianas FROM relacion_persianas WHERE rb = NEW.codigo_rb AND codigo_tp_estado = NEW.id);
      ELSE
         UPDATE persianas SET consigna = NEW.valor, fecha = now()
         WHERE id = (SELECT codigo_persianas FROM relacion_persianas WHERE rb = NEW.codigo_rb AND codigo_tp_consigna = NEW.id);
      END IF;
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
