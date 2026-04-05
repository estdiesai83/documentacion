
insert into th_somfy_50_e (codigo_tp, modulo, argumentos, inhibir) VALUES
(2,4,'{"nemo" : "9", "floor": "4", "room": "34", "zone": "1","type":"1"}',1),
(4,4,'{"nemo" : "9", "floor": "4", "room": "32", "zone": "2","type":"1"}',1),
(6,4,'{"nemo" : "9", "floor": "4", "room": "28", "zone": "3","type":"1"}',1),
(8,4,'{"nemo" : "9", "floor": "4", "room": "30", "zone": "4","type":"1"}',1),
(10,4,'{"nemo" : "9", "floor": "4", "room": "26", "zone": "5","type":"1"}',1),
(12,4,'{"nemo" : "9", "floor": "4", "room": "53", "zone": "6","type":"1"}',1),
(14,4,'{"nemo" : "9", "floor": "4", "room": "53", "zone": "7","type":"1"}',1),
(16,4,'{"nemo" : "9", "floor": "4", "room": "11", "zone": "8","type":"1"}',1),
(18,4,'{"nemo" : "9", "floor": "4", "room": "11", "zone": "9","type":"1"}',1),
(20,4,'{"nemo" : "9", "floor": "4", "room": "11", "zone": "10","type":"1"}',1),
(22,4,'{"nemo" : "9", "floor": "4", "room": "36", "zone": "11","type":"1"}',1),
(24,4,'{"nemo" : "9", "floor": "4", "room": "38", "zone": "12","type":"1"}',1),
(25,4,'{"nemo" : "9", "floor": "4", "room": "38", "zone": "13","type":"1"}',1);



update estancia set codigo_planta = 8 where id >=75;

-- eliminar sonda juegos
DELETE clima where id = 23;

-- Desactivar planta 1 y sotano
update iniciarhilostrb set inhibir = 1 where argumentos like '%"53131"%';
update iniciarhilostrb set inhibir = 1 where argumentos like '%"53132"%';
update iniciarhilostrb set inhibir = 1 where argumentos like '%"53135"%';
update iniciarhilostrb set inhibir = 1 where argumentos like '%"53136"%';
update iniciarhilostrb set inhibir = 1 where argumentos like '%"53144"%';
update iniciarhilostrb set inhibir = 1 where argumentos like '%"53145"%';
update iniciarhilostrb set inhibir = 1 where argumentos like '%"53146"%';
update iniciarhilostrb set inhibir = 1 where argumentos like '%"53147"%';
update iniciarhilostrb set inhibir = 1 where argumentos like '%"53148"%';
update iniciarhilostrb set inhibir = 1 where argumentos like '%"53149"%';

update iniciarhilostrb set inhibir = 1 where argumentos like '%"53150"%';
update iniciarhilostrb set inhibir = 1 where argumentos like '%"53151"%';
update iniciarhilostrb set inhibir = 1 where argumentos like '%"53152"%';
update iniciarhilostrb set inhibir = 1 where argumentos like '%"53153"%';


-- activar planta baja

update iniciarhilostrb set inhibir = 0 where argumentos like '%"53130"%';
update iniciarhilostrb set inhibir = 0 where argumentos like '%"53133"%';
update iniciarhilostrb set inhibir = 0 where argumentos like '%"53134"%';
update iniciarhilostrb set inhibir = 0 where argumentos like '%"53137"%';
update iniciarhilostrb set inhibir = 0 where argumentos like '%"53138"%';
update iniciarhilostrb set inhibir = 0 where argumentos like '%"53139"%';

update iniciarhilostrb set inhibir = 0 where argumentos like '%"53140"%';
update iniciarhilostrb set inhibir = 0 where argumentos like '%"53141"%';
update iniciarhilostrb set inhibir = 0 where argumentos like '%"53142"%';
update iniciarhilostrb set inhibir = 0 where argumentos like '%"53143"%';
update iniciarhilostrb set inhibir = 0 where argumentos like '%"53154"%';


-- desactivar dalis de las placas que no sean
-- 9 -> 53138
-- 10 -> 53139
-- 11 -> 53140
-- 13 -> 53142
update iniciarhilostrb set inhibir = 1 where argumentos like '%"53130"%' and trb = 3;
update iniciarhilostrb set inhibir = 1 where argumentos like '%"53133"%' and trb = 3;
update iniciarhilostrb set inhibir = 1 where argumentos like '%"53134"%' and trb = 3;
update iniciarhilostrb set inhibir = 1 where argumentos like '%"53137"%' and trb = 3;
update iniciarhilostrb set inhibir = 1 where argumentos like '%"53141"%' and trb = 3;
update iniciarhilostrb set inhibir = 1 where argumentos like '%"53143"%' and trb = 3;
update iniciarhilostrb set inhibir = 1 where argumentos like '%"53154"%' and trb = 3;


update iniciarhilostrb set inhibir = 1 where argumentos like '%"53130"%' and trb = 8;
update iniciarhilostrb set inhibir = 1 where argumentos like '%"53133"%' and trb = 8;
update iniciarhilostrb set inhibir = 1 where argumentos like '%"53134"%' and trb = 8;
update iniciarhilostrb set inhibir = 1 where argumentos like '%"53137"%' and trb = 8;
update iniciarhilostrb set inhibir = 1 where argumentos like '%"53141"%' and trb = 8;
update iniciarhilostrb set inhibir = 1 where argumentos like '%"53143"%' and trb = 8;
update iniciarhilostrb set inhibir = 1 where argumentos like '%"53154"%' and trb = 8;


-- desactivar sonda juegos
update iniciarhilostrb set inhibir = 1 where codigo_rb =190;

update iniciarhilostrb set inhibir = 1 where trb =31;


-- cambios sala tv
update th_rasp_ds18b20 set argumentos = '{"cod_consigna":"21","cod_rango":"22","trb_tpss":"7","rb_tpss":"104","terminal_tpss":"1","trb_tpse":"0","rb_tpse":"103","terminal_tpse":"4","id_climate":"1"}' where id = 13;
update relacion_clima set rb_estado = 104, codigo_tp_estado = 111 where codigo_clima = 13;

-- sonda comedor
insert into clima (nemo, codigo_estancia,consigna) VALUES
('Comedor', 13, 22);

update clima set id = 23 where id = 24;


insert into relacion_clima (codigo_clima, codigo_variables, rb_temp, codigo_tp_temp, rb_estado, codigo_tp_estado  ) VALUES
-- Cocina principal
(23, 39, 310, 23, 104, 110);


-- socket clima
update th_rasp_ds18b20 set codigo_tp = 25, argumentos = '{"floor":"4","room":"13","zone":"25","type":"0","nemo":"2"}' where codigo_tp = 23;


-- imagenes
update estancia set imagen = 'fotos/' where id = 1;
update estancia set imagen = 'fotos/' where id = 2;
update estancia set imagen = 'fotos/' where id = 3;
update estancia set imagen = 'fotos/' where id = 4;
update estancia set imagen = 'fotos/' where id = 5;
update estancia set imagen = 'fotos/' where id = 6;
update estancia set imagen = 'fotos/' where id = 7;
update estancia set imagen = 'fotos/' where id = 8;
update estancia set imagen = 'fotos/' where id = 9;
update estancia set imagen = 'fotos/' where id = 10;
 1 | Fuente interior Pt Baja  |
|  2 | Fuente entrada Principal |
|  3 | Fuente terraza sala cine |
|  4 | Alumbrado Exterior       |
|  5 | Pista de Tenis           |
|  6 | Piscina Exterior         |
|  7 | Garita Vigilante         |
|  8 | Riego                    |
|  9 | Estudio                  |
| 10 | Cabina                   |


update estancia set imagen = 'fotos/' where id = 11;
update estancia set imagen = 'fotos/' where id = 12;
update estancia set imagen = 'fotos/comedor.jpg' where id = 13;
update estancia set imagen = 'fotos/salacine.jpg' where id = 14;
update estancia set imagen = 'fotos/cocina.jpg' where id = 15;
update estancia set imagen = 'fotos/entrada.jpg' where id = 16;
update estancia set imagen = 'fotos/cocina_alejandro.jpg' where id = 17;
update estancia set imagen = 'fotos/terraza_salacinebar.jpg' where id = 18;
update estancia set imagen = 'fotos/' where id = 19;
update estancia set imagen = 'fotos/bar.jpg' where id = 20;


| 11 | Habitación               |
| 12 | Baño Habitación          |
| 19 | Pasillo Habitaciones     |


update estancia set imagen = 'fotos/biblio.jpg' where id = 21;
update estancia set imagen = 'fotos/habitacion_alejandro.jpg' where id = 22;
update estancia set imagen = 'fotos/bano_alejandro.jpg' where id = 23;
update estancia set imagen = 'fotos/habitacion_rachel' where id = 24;
update estancia set imagen = 'fotos/bano_rachel.jpg' where id = 25;
update estancia set imagen = 'fotos/habitacion_2.jpg' where id = 26;
update estancia set imagen = 'fotos/bano_hab2.jpg' where id = 27;
update estancia set imagen = 'fotos/habitacion_3.jpg' where id = 28;
update estancia set imagen = 'fotos/bano_hab3.jpg' where id = 29;
update estancia set imagen = 'fotos/habitacion_4.jpg' where id = 30;
update estancia set imagen = 'fotos/bano_hab4.jpg' where id = 31;
update estancia set imagen = 'fotos/habitacion_5.jpg' where id = 32;
update estancia set imagen = 'fotos/bano_hab5.jpg' where id = 33;
update estancia set imagen = 'fotos/' where id = 34;
update estancia set imagen = 'fotos/' where id = 35;
update estancia set imagen = 'fotos/' where id = 36;
update estancia set imagen = 'fotos/' where id = 37;
update estancia set imagen = 'fotos/' where id = 38;
update estancia set imagen = 'fotos/' where id = 39;
update estancia set imagen = 'fotos/' where id = 40;

| 34 | Habitación Invitados     |
| 35 | Baño Invitados           |
| 36 | Habitación Servicio 1    |
| 37 | Baño Servicio 1          |
| 38 | Habitación Servicio 2    |
| 39 | Baño Servicio 2          |
| 40 | Gimnasio                 |


update estancia set imagen = 'fotos/' where id = 41;
update estancia set imagen = 'fotos/' where id = 42;
update estancia set imagen = 'fotos/' where id = 43;
update estancia set imagen = 'fotos/' where id = 44;
update estancia set imagen = 'fotos/' where id = 45;
update estancia set imagen = 'fotos/sala_tv.jpg' where id = 46;
update estancia set imagen = 'fotos/distribuidor_pril.png' where id = 47;
update estancia set imagen = 'fotos/vestibulo_biblio_bar.jpg' where id = 48;
update estancia set imagen = 'fotos/vestibulo_cocina_entrada.jpg' where id = 49;
update estancia set imagen = 'fotos/despensa.jpg' where id = 50;

| 41 | Piscina Interior         |
| 42 | Vinoteca                 |
| 43 | Lavanderia               |vestibulo_biblio_bar.jpg
| 44 | Comedor Servicio         |

update estancia set imagen = 'fotos/ropero.png' where id = 51;
update estancia set imagen = 'fotos/salajuegos.png' where id = 52;
update estancia set imagen = 'fotos/vestidor_alejandro.jpg' where id = 53;
update estancia set imagen = 'fotos/vestidor_rachel.jpg' where id = 54;
update estancia set imagen = 'fotos/distribuidor_pril.png' where id = 55;
update estancia set imagen = 'fotos/' where id = 56;
update estancia set imagen = 'fotos/' where id = 57;
update estancia set imagen = 'fotos/' where id = 58;
update estancia set imagen = 'fotos/' where id = 59;
update estancia set imagen = 'fotos/' where id = 60;

| 55 | Distribuidor Principal   |
| 56 | Vestibulo Ent./Serv.     |
| 57 | Sala Maq,/Pisc. Int.     |
| 58 | Baño 1 piscina interior  |
| 59 | Baño 2 piscina interior  |
| 60 | Vestibulo Pisc. Int.     |


update estancia set imagen = 'fotos/' where id = 61;
update estancia set imagen = 'fotos/' where id = 62;
update estancia set imagen = 'fotos/' where id = 63;
update estancia set imagen = 'fotos/' where id = 64;
update estancia set imagen = 'fotos/' where id = 65;
update estancia set imagen = 'fotos/' where id = 66;
update estancia set imagen = 'fotos/' where id = 67;
update estancia set imagen = 'fotos/' where id = 68;
update estancia set imagen = 'fotos/' where id = 69;
update estancia set imagen = 'fotos/' where id = 70;

| 61 | Sala juegos              |
| 62 | Garaje                   |
| 63 | Cuarto instalaciones     |
| 64 | Cuarto clima             |
| 65 | Comedor cocina Alej.     |
| 66 | Baño turco               |
| 67 | Vestibulo H/E            |
| 68 | Escalera Servicio        |
| 69 | Escalera Caracol Este    |
| 70 | Escalera Caracol Oeste   |

update estancia set imagen = 'fotos/' where id = 71;
update estancia set imagen = 'fotos/' where id = 72;
update estancia set imagen = 'fotos/' where id = 73;
update estancia set imagen = 'fotos/' where id = 74;
update estancia set imagen = 'fotos/' where id = 75;
update estancia set imagen = 'fotos/' where id = 76;
update estancia set imagen = 'fotos/' where id = 77;
| 71 | Terraza Hab. Raquel      |
| 72 | Terraza Sala Tv          |
| 73 | Baño cortesia            |
| 74 | Lago Jardin              |
| 75 | Pasillo Lavanderia       |
| 76 | Despensa sotano          |
| 77 | Vestibulo Gimnasio


-- AÑADIR PULSADOR
-- terminal_tpss bombilla suelo radiante
-- terminal_tpse estado suelo radiante
-- valves (valvula suelo radiante)
-- probes (la sonda)
-- sala cine
update th_rasp_pulsador set codigo_tp = 9 where codigo_tp = 8;

-- pulsador bar
insert into th_rasp_pulsador (codigo_tp, modulo,argumentos,inhibir) VALUES
(8, 7,'{"trb_tpss":"7","rb_tpss":"70","terminal_tpss":"6","trb_tpse":"0","rb_tpse":"69","terminal_tpse":"8","valves":[{"trb": "7","rb": "104","terminal": "6"}],"probes":[{"trb": "1","rb": "73","terminal": "0"}]}"',0);

-- sala tv
insert into th_rasp_pulsador (codigo_tp, modulo,argumentos,inhibir) VALUES
(10, 7,'{"trb_tpss":"7","rb_tpss":"104","terminal_tpss":"3","trb_tpse":"0","rb_tpse":"103","terminal_tpse":"2","valves":[{"trb": "7","rb": "104","terminal": "1"}],"probes":[{"trb": "1","rb": "119","terminal": "0"}]}"',0);

-- cocina alejandro
insert into th_rasp_pulsador (codigo_tp, modulo,argumentos,inhibir) VALUES
(18, 7,'{"trb_tpss":"7","rb_tpss":"185","terminal_tpss":"12","trb_tpse":"0","rb_tpse":"184","terminal_tpse":"14","valves":[{"trb": "23","rb": "211","terminal": "2"}],"probes":[{"trb": "1","rb": "188","terminal": "0"}]}"',0);

-- cocina principal
insert into th_rasp_pulsador (codigo_tp, modulo,argumentos,inhibir) VALUES
(19, 7,'{"trb_tpss":"7","rb_tpss":"185","terminal_tpss":"13","trb_tpse":"0","rb_tpse":"184","terminal_tpse":"15","valves":[{"trb": "23","rb": "211","terminal": "3"}],"probes":[{"trb": "1","rb": "187","terminal": "0"}]}"',0);

-- comedor
update th_rasp_pulsador set argumentos = '{"trb_tpss":"7","rb_tpss":"104","terminal_tpss":"2","trb_tpse":"0","rb_tpse":"103","terminal_tpse":"3","valves":[{"trb": "7","rb": "104","terminal": "0"}],"probes":[{"trb": "1","rb": "310","terminal": "0"}]}' where codigo_tp = 11;

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
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_operacion_escena
   AFTER UPDATE ON operacion
   FOR EACH ROW
   BEGIN

   DECLARE v_codigo_escena INT;
   DECLARE v_estado_escena INT;
   DECLARE v_hay_caso_1 INT;
   DECLARE v_num_ope INT;
   DECLARE v_cod_estancia INT;
   DECLARE v_escena_aux INT;

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

      SELECT estado, codigo_estancia
      INTO v_estado_escena,v_cod_estancia
      FROM escenas
      WHERE id = cod_escena;

      IF (v_hay_caso_1 = v_num_ope) THEN
         CASE
            WHEN v_estado_escena = 0 THEN
               SELECT id
               INTO v_escena_aux
               FROM escenas
               WHERE codigo_estancia = v_cod_estancia AND estado != 0;

               SET @exec_var = sys_exec(CONCAT("curl -d scene_id=",v_escena_aux," POST http://localhost:1519/ddbb/desactivateScene"));

               UPDATE escenas SET estado = 0 WHERE codigo_estancia = v_cod_estancia;

               UPDATE escenas SET estado = 1 WHERE id =cod_escena;
               SET @exec_var = sys_exec(CONCAT("curl -d scene_id=",cod_escena," POST http://localhost:1519/ddbb/activateScene"));

            WHEN v_estado_escena = 2 THEN
               UPDATE escenas SET estado = 0 WHERE codigo_estancia = v_cod_estancia;

               UPDATE escenas SET estado = 1 WHERE id =cod_escena;
               SET @exec_var = sys_exec(CONCAT("curl -d scene_id=",cod_escena," POST http://localhost:1519/ddbb/activateScene"));
            ELSE
               BEGIN
               END;
         END CASE;
      ELSEIF (v_hay_caso_1 != v_num_ope) THEN
         CASE
            -- WHEN v_estado_escena = 0 THEN
            --    SET @exec_var = sys_exec(CONCAT("curl -d scene_id=",cod_escena," POST http://localhost:1519/ddbb/desactivateScene"));
            --    UPDATE escenas SET estado = 0 WHERE codigo_estancia = v_cod_estancia;
            WHEN v_estado_escena = 1 THEN
               UPDATE escenas SET estado = 2 WHERE id =cod_escena;
               SET @exec_var = sys_exec(CONCAT("curl -d scene_id=",cod_escena," POST http://localhost:1519/ddbb/modifyScene"));
            -- WHEN v_estado_escena = 2 THEN
            --    UPDATE escenas SET estado = 0 WHERE codigo_estancia = v_cod_estancia;
            ELSE
               BEGIN
               END;
         END CASE;
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
