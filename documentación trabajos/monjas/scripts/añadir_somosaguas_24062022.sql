

insert into estancia (nemo, codigo_planta, modelo, imagen, escenas, ambientes, rutinas) VALUES
   ("Baño cortesia",4,2,"fotos/24ef54f3a3c656e84869427ff7800f2b478c2316.jpg",1,  1,1);

update luces set codigo_estancia = 18 where id=37;
update luces set codigo_estancia = 18 where id=38;


update luces set codigo_estancia = 14 where id=35;
update luces set codigo_estancia = 14 where id=36;

-- terraza sala tv
update luces set codigo_estancia = 72 where id=59;
update luces set codigo_estancia = 72 where id=60;

-- baño cortesia
update luces set codigo_estancia = 73 where id=61;
update luces set codigo_estancia = 73 where id=62;


update escenas set codigo_estancia = 25 where id = 52;
update escenas set codigo_estancia = 25 where id = 60;



-- cambiar pasillo cocina a pasillo entrada comedor
update relacion_escena_operacion set codigo_escena = 32 where codigo_escena = 69;
update relacion_escena_operacion set codigo_escena = 43 where codigo_escena = 78;

update escenas set codigo_estancia = 72 where id = 69;
update escenas set codigo_estancia = 72 where id = 78;

update relacion_escena_operacion set codigo_escena = 69 where codigo_escena = 34;
update relacion_escena_operacion set codigo_escena = 78 where codigo_escena = 45;

update relacion_escena_operacion set codigo_escena = 34 where id = 79;
update relacion_escena_operacion set codigo_escena = 45 where id = 104;


-- escenas -- sala terraza bar
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 18, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(37,187, 0,100,NULL),
(38,188, 0,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(89,187),
(89,188);

insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 18, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(37,189, 1,100,NULL),
(38,190, 1,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(90,189),
(90,190);

-- cambio luces de entrada a baño cortesia

insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 73, 0, 1, 0);

insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 73, 0, 1, 0);


update relacion_escena_operacion set codigo_escena = 91 where id = 82;
update relacion_escena_operacion set codigo_escena = 91 where id = 83;

update relacion_escena_operacion set codigo_escena = 92 where id = 107;
update relacion_escena_operacion set codigo_escena = 92 where id = 108;


DROP TRIGGER IF EXISTS trigger_luces;
DROP TRIGGER IF EXISTS trigger_iot;
DROP TRIGGER IF EXISTS trigger_clima;
DROP TRIGGER IF EXISTS trigger_estor;
DROP TRIGGER IF EXISTS trigger_persianas;

DROP TRIGGER IF EXISTS trigger_operacion;
DROP TRIGGER IF EXISTS trigger_escena;

DROP TRIGGER IF EXISTS trigger_ambiente;
DROP TRIGGER IF EXISTS trigger_rutina;
DROP TRIGGER IF EXISTS trigger_operacion_escena;
DROP TRIGGER IF EXISTS trigger_operacion_ambiente;
DROP TRIGGER IF EXISTS trigger_operacion_rutina;

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_luces
   AFTER UPDATE ON luces
   FOR EACH ROW
   BEGIN

   DECLARE done INT DEFAULT 0;
   DECLARE cod_ope INT;
   DECLARE v_cumple INT;

   DECLARE cursor_operacion CURSOR FOR SELECT b.codigo_operacion
   FROM operacion_luces as b
   WHERE b.codigo_luces = NEW.id;

   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

   OPEN cursor_operacion;

   read_loop: LOOP

   FETCH cursor_operacion INTO cod_ope;

   IF done THEN
   LEAVE read_loop;
   END IF;

   IF NEW.estado = 1 THEN
      SELECT count(id)
      INTO v_cumple
      FROM operacion_luces
      WHERE estado = NEW.estado AND intensidad = NEW.intensidad
      AND codigo_operacion = cod_ope;
   ELSE
      SELECT count(id)
      INTO v_cumple
      FROM operacion_luces
      WHERE estado = NEW.estado
      AND codigo_operacion = cod_ope;
   END IF;

   IF (v_cumple = 0) THEN
      UPDATE operacion SET estado = 0 WHERE id = cod_ope;
   ELSE
      UPDATE operacion SET estado = 1 WHERE id = cod_ope;
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

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_iot
   AFTER UPDATE ON iot
   FOR EACH ROW
   BEGIN

   DECLARE done INT DEFAULT 0;
   DECLARE cod_ope INT;
   DECLARE v_cumple INT;

   DECLARE cursor_operacion CURSOR FOR SELECT b.codigo_operacion
   FROM operacion_iot as b
   WHERE b.codigo_iot = NEW.id;

   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

   OPEN cursor_operacion;

   read_loop: LOOP

   FETCH cursor_operacion INTO cod_ope;

   IF done THEN
   LEAVE read_loop;
   END IF;

   SELECT count(id)
   INTO v_cumple
   FROM operacion_iot
   WHERE estado = NEW.estado
   AND codigo_operacion = cod_ope;

   IF (v_cumple = 0) THEN
      UPDATE operacion SET estado = 0 WHERE id = cod_ope;
   ELSE
      UPDATE operacion SET estado = 1 WHERE id = cod_ope;
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
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_clima
   AFTER UPDATE ON clima
   FOR EACH ROW
   BEGIN


   DECLARE done INT DEFAULT 0;
   DECLARE cod_ope INT;
   DECLARE v_cumple INT;

   DECLARE cursor_operacion CURSOR FOR SELECT b.codigo_operacion
   FROM operacion_clima as b
   WHERE b.codigo_clima = NEW.id;

   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

   OPEN cursor_operacion;

   read_loop: LOOP

   FETCH cursor_operacion INTO cod_ope;

   IF done THEN
   LEAVE read_loop;
   END IF;

   IF NEW.consigna IS NULL THEN
      SELECT count(id)
      INTO v_cumple
      FROM operacion_clima
      WHERE estado = NEW.estado AND consigna IS NULL
      AND codigo_operacion = cod_ope;
   ELSE
      SELECT count(id)
      INTO v_cumple
      FROM operacion_clima
      WHERE estado = NEW.estado
      AND codigo_operacion = cod_ope;
   END IF;

   IF (v_cumple = 0) THEN
      UPDATE operacion SET estado = 0 WHERE id = cod_ope;
   ELSE
      UPDATE operacion SET estado = 1 WHERE id = cod_ope;
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


/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_estor
   AFTER UPDATE ON estor
   FOR EACH ROW
   BEGIN


   DECLARE done INT DEFAULT 0;
   DECLARE cod_ope INT;
   DECLARE v_cumple INT;

   DECLARE cursor_operacion CURSOR FOR SELECT b.codigo_operacion
   FROM operacion_estores as b
   WHERE b.codigo_estor = NEW.id;

   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

   OPEN cursor_operacion;

   read_loop: LOOP

   FETCH cursor_operacion INTO cod_ope;

   IF done THEN
   LEAVE read_loop;
   END IF;

   SELECT count(id)
   INTO v_cumple
   FROM operacion_estores
   WHERE estado = NEW.estado AND consigna = NEW.consigna
   AND codigo_operacion = cod_ope;

   IF (v_cumple = 0) THEN
      UPDATE operacion SET estado = 0 WHERE id = cod_ope;
   ELSE
      UPDATE operacion SET estado = 1 WHERE id = cod_ope;
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

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_persianas
   AFTER UPDATE ON persianas
   FOR EACH ROW
   BEGIN


   DECLARE done INT DEFAULT 0;
   DECLARE cod_ope INT;
   DECLARE v_cumple INT;

   DECLARE cursor_operacion CURSOR FOR SELECT b.codigo_operacion
   FROM operacion_persianas as b
   WHERE b.codigo_persianas = NEW.id;

   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

   OPEN cursor_operacion;

   read_loop: LOOP

   FETCH cursor_operacion INTO cod_ope;

   IF done THEN
   LEAVE read_loop;
   END IF;

   SELECT count(id)
   INTO v_cumple
   FROM operacion_persianas
   WHERE estado = NEW.estado AND consigna = NEW.consigna
   AND codigo_operacion = cod_ope;

   IF (v_cumple = 0) THEN
      UPDATE operacion SET estado = 0 WHERE id = cod_ope;
   ELSE
      UPDATE operacion SET estado = 1 WHERE id = cod_ope;
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

   DECLARE done INT DEFAULT 0;
   DECLARE cod_escena INT;

   DECLARE cursor_escena CURSOR FOR SELECT codigo_escena
   FROM relacion_escena_operacion
   WHERE codigo_operacion = NEW.id;

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

      SELECT estado
      INTO v_estado_escena
      FROM escenas
      WHERE id=cod_escena;

      IF (v_hay_caso_1 = v_num_ope) AND v_estado_escena = 0 THEN
         UPDATE escenas SET estado = 1 WHERE id =cod_escena;
         SET @exec_var = sys_exec(CONCAT("curl -d scene_id=",cod_escena," POST http://localhost:1519/ddbb/activateScene"));
      ELSEIF (v_hay_caso_1 != v_num_ope) AND v_estado_escena = 1 THEN
         UPDATE escenas SET estado = 0 WHERE id =cod_escena;
         SET @exec_var = sys_exec(CONCAT("curl -d scene_id=",cod_escena," POST http://localhost:1519/ddbb/desactivateScene"));
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

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
