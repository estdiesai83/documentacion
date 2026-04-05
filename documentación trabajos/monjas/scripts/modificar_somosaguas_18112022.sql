
-- IBERCOMP CONVERSOR 1
alter table trb_iber_8sd_conv AUTO_INCREMENT=20;
alter table trb_iber_8ed_conv AUTO_INCREMENT=33;



-- PENDIENTE EN SOMOSAGUAS

update comando set tipodriver = 'Ibercomp8ed_modbus' where id = 44;
update comando set tipodriver = 'Ibercomp8ed_modbus' where id = 46;
update comando set tipodriver = 'Ibercomp8ed_modbus' where id = 48;
update comando set tipodriver = 'Ibercomp8ed_modbus' where id = 50;

update comando set tipodriver = 'Ibercomp8sd_modbus' where id = 43;
update comando set tipodriver = 'Ibercomp8sd_modbus' where id = 45;
update comando set tipodriver = 'Ibercomp8sd_modbus' where id = 47;
update comando set tipodriver = 'Ibercomp8sd_modbus' where id = 49;

update relacion_rb set subdriver = '8ED_modbus' where codigo_rb = 339;
update relacion_rb set subdriver = '8ED_modbus' where codigo_rb = 341;
update relacion_rb set subdriver = '8ED_modbus' where codigo_rb = 343;
update relacion_rb set subdriver = '8ED_modbus' where codigo_rb = 345;


-- eliminar en entrada comedor sala tv 2 las valvulas de sala tv y comedor por que
-- pasan a estar en ibercomp conversor 1 comando 7 para las salidas y
-- comando 8 para las entradas

update iniciarhilostrb set bornas = '2,3' where id = 196;
delete from iniciarhilostrb where id = 228;
delete from iniciarhilostrb where id = 229;

-- th consigna
update th_rasp_ds18b20 set argumentos = '{"cod_consigna":"39","cod_rango":"40","trb_tpss":"23","rb_tpss":"211","terminal_tpss":"1","trb_tpse":"21","rb_tpse":"212","terminal_tpse":"1","id_climate":"1"}' where id = '42';

-- th_pulsador
update th_rasp_pulsador set argumentos = '{"trb_tpss":"7","rb_tpss":"104","terminal_tpss":"3","trb_tpse":"0","rb_tpse":"103","terminal_tpse":"2","valves":[{"trb": "23","rb": "211","terminal": "0"}],"probes":[{"trb": "1","rb": "119","terminal": "0"}]}"' where id = 17;
update th_rasp_pulsador set argumentos = '{"trb_tpss":"7","rb_tpss":"104","terminal_tpss":"2","trb_tpse":"0","rb_tpse":"103","terminal_tpse":"3","valves":[{"trb": "23","rb": "211","terminal": "1"}],"probes":[{"trb": "1","rb": "310","terminal": "0"}]}' where id = 7;

update tpse set codigo_relacion_rb = NULL, tipoborna = NULL, f1 = NULL, f2 = NULL, f3= NULL, nemo = NULL where id = 193;
update tpse set codigo_relacion_rb = NULL, tipoborna = NULL, f1 = NULL, f2 = NULL, f3= NULL, nemo = NULL where id = 194;

update tpss set codigo_relacion_rb = NULL, subdriver = NULL, tipoborna = NULL, f1 = NULL, f2 = NULL, f3= NULL, nemo = NULL, seudoborna = NULL, tiposalida = NULL, codigo_variables = NULL where id = 417;
update tpss set codigo_relacion_rb = NULL, subdriver = NULL, tipoborna = NULL, f1 = NULL, f2 = NULL, f3= NULL, nemo = NULL, seudoborna = NULL, tiposalida = NULL, codigo_variables = NULL where id = 418;

delete from trb_rasp_sd where id = 110;
delete from trb_rasp_sd where id = 111;

delete from trb_rasp_ed where id = 135;
delete from trb_rasp_ed where id = 136;

-- cadena seguridad desconexion usos varios
insert into th_rasp_sd (codigo_tp, modulo,argumentos, inhibir ) VALUES (114,4, '{"trb":"0","rb":"103","terminal":"6"}',0);

-- sala tv
update relacion_clima set rb_valvula = 211, codigo_tp_valvula=15 where codigo_clima = 13;
-- comedor
update relacion_clima set rb_valvula = 211, codigo_tp_valvula=16 where codigo_clima = 23;



-- CLIMA COMEDOR SERVICIO
update th_iber_8sd_conv set id = 20 where id = 44;
update th_iber_8sd_conv set id = 21 where id = 45;
update th_iber_8sd_conv set id = 22 where id = 46;
update th_iber_8sd_conv set id = 23 where id = 47;
update th_iber_8sd_conv set id = 24 where id = 48;
update th_iber_8sd_conv set id = 25 where id = 49;

alter table th_iber_8sd_conv AUTO_INCREMENT=26;

alter table th_iber_8ed_conv AUTO_INCREMENT=11;

ALTER TABLE variables ADD column codigo_rb int(11) default null;
ALTER TABLE variables ADD CONSTRAINT `variables_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

insert into th_rasp_ds18b20 (codigo_tp,modulo,argumentos, inhibir) values
(12,6,'{"cod_consigna":"53","cod_rango":"54","trb_tpss":"23","rb_tpss":"526","terminal_tpss":"0","trb_tpse":"21","rb_tpse":"527","terminal_tpse":"0","id_climate":"1"}',0),
(10,6,'{"cod_consigna":"55","cod_rango":"56","trb_tpss":"23","rb_tpss":"526","terminal_tpss":"1","trb_tpse":"21","rb_tpse":"527","terminal_tpse":"1","id_climate":"1"}',0),
(11,6,'{"cod_consigna":"57","cod_rango":"58","trb_tpss":"23","rb_tpss":"526","terminal_tpss":"2","trb_tpse":"21","rb_tpse":"527","terminal_tpse":"2","id_climate":"1"}',0);

insert into variables (nemo,valor,tipo,codigo_rb) values
('consigna_comedor_servicio',22,1,85),
('rango_comedor_servicio',1,1,85),
('consigna_hab_servicio1',22,1,83),
('rango_hab_servicio1',1,1,83),
('consigna_hab_servicio2',22,1,84),
('rango_hab_servicio2',1,1,84);


-- ELIMINAR VALVULA DE RASP_SD Y RASP_ED PARA HABITACION ESTUDIO
DELETE from trb_rasp_sd where id = 45;
DELETE FROM trb_rasp_ed where id = 65;

update tpse set codigo_relacion_rb = NULL, tipoborna = NULL, f1 = NULL, f2 = NULL, f3= NULL, nemo = NULL where id = 74;

update tpss set codigo_relacion_rb = NULL, subdriver = NULL, tipoborna = NULL, f1 = NULL, f2 = NULL, f3= NULL, nemo = NULL, seudoborna = NULL, tiposalida = NULL, codigo_variables = NULL where id = 169;

update th_rasp_ds18b20 set argumentos = '{"cod_consigna":"11","cod_rango":"12","trb_tpss":"23","rb_tpss":"528","terminal_tpss":"2","trb_tpse":"21","rb_tpse":"529","terminal_tpse":"2","id_climate":"1"}' where id = 5;

delete from iniciarhilostrb where id = 90;

update relacion_clima set rb_valvula = 528, codigo_tp_valvula=25 where codigo_clima = 5;

update th_rasp_pulsador set argumentos ='{"trb_tpss":"7","rb_tpss":"38","terminal_tpss":"9","trb_tpse":"0","rb_tpse":"37","terminal_tpse":"10","valves":[{"trb": "23","rb": "528","terminal": "2"}],"probes":[{"trb": "1","rb": "59","terminal": "0"}]}' where id = 5;

-- cadena seguridad bombilla suelo radiante
insert into th_rasp_sd (codigo_tp, argumentos, modulo, inhibir) VALUES
(63,'{"trb":"0","rb":"37","terminal":"10"}',3,0);



update tpse set f3= 'alumbrado', nemo ='Alumbrado Focos techo Vestibulo H.Estudio' where id = 76;
update tpse set f3= 'alumbrado', nemo = 'Alumbrado escalera Caracol Oeste' where id = 77;

DELETE FROM trb_rasp_ed where id = 69;
DELETE FROM trb_rasp_ed where id = 70;

update tpse set codigo_relacion_rb = NULL, tipoborna = NULL, f1 = NULL, f2 = NULL, f3= NULL, nemo = NULL where id = 78;
update tpse set codigo_relacion_rb = NULL, tipoborna = NULL, f1 = NULL, f2 = NULL, f3= NULL, nemo = NULL where id = 79;
update iniciarhilostrb set bornas ='11,12' where id = 80;


-- SONDA ESTUDIO
update tpse set f3='suelo radiante' where id = 1382;
update tpse set nemo ='Estado del funcionamiento manual Pecera (Pulsador)  ' where id = 1383;
update tpse set nemo ='Estado del Piloto de accionamiento manual Pecera (Bombilla)' where id = 1384;



update tpse set codigo_relacion_rb = 351, tipoborna = 'analogica', f1 = '', f2 = '', f3= 'clima', nemo = 'Sonda estudio' where codigo_rb = 495;

insert into th_rasp_ds18b20 (codigo_tp,modulo,argumentos, inhibir) VALUES
(27,6,'{"cod_consigna":"59","cod_rango":"60","trb_tpss":"23","rb_tpss":"528","terminal_tpss":"0","trb_tpse":"21","rb_tpse":"529","terminal_tpse":"0","id_climate":"1"}',0);

update trb_rasp_ds18b20 set domo = 2 where codigo_tp = 27;

-- SONDA PECERA
insert into th_rasp_ds18b20 (codigo_tp,modulo,argumentos, inhibir) VALUES
(26,6,'{"cod_consigna":"61","cod_rango":"62","trb_tpss":"23","rb_tpss":"528","terminal_tpss":"1","trb_tpse":"21","rb_tpse":"529","terminal_tpse":"1","id_climate":"1"}',0);

update trb_rasp_ds18b20 set domo = 2 where codigo_tp = 26;

update tpse set codigo_relacion_rb = 195, tipoborna = 'digital', f1 = '', f2 = '', f3= 'suelo radiante', nemo = 'studio del Piloto de accionamiento manual Pecera (Bombilla)' where id = 1384;


insert into variables (nemo, valor, tipo, codigo_rb) values
('consigna_estudio',22,1,495),
('rango_estudio',1,1,495),
('consigna_pecera',22,1,325),
('rango_pecera',1,1,325);

insert into clima (nemo,codigo_estancia,estado, temperatura, consigna) values
('estudio',9,0,22,22),
('pecera',10,0,22,22);

insert into relacion_clima (codigo_clima,codigo_variables,rb_temp,codigo_tp_temp,rb_estado,codigo_tp_estado,rb_valvula,codigo_tp_valvula,rb_e_estado,codigo_tp_e_estado) values
(27,59,495,27,322,183,528,23,321,197),
(28,61,495,26,322,184,528,24,321,198);

insert into th_rasp_ds18b20 (codigo_tp,modulo,argumentos,inhibir) values
(27,4,'{"floor":"3","room":"9","zone":"27","type":"0","nemo":"2"}',0),
(26,4,'{"floor":"3","room":"10","zone":"28","type":"0","nemo":"2"}',0);


insert into th_rasp_ed (codigo_tp,modulo,argumentos,inhibir) values
(197,4,'{"floor":"3","room":"9","zone":"27","type":"4","nemo":"2"}', 0),
(198,4,'{"floor":"3","room":"10","zone":"28","type":"4","nemo":"2"}',0);


insert into th_rasp_sd () values
(183,3,'{"trb":"0","rb":"321","terminal":"7"}',0),
(184,3,'{"trb":"0","rb":"321","terminal":"9"}',0);


insert into th_rasp_pulsador (codigo_tp,modulo,argumentos,inhibir) values
(20,7,'{"trb_tpss":"7","rb_tpss":"322","terminal_tpss":"6","trb_tpse":"0","rb_tpse":"321","terminal_tpse":"7","valves":[{"trb": "23","rb": "528","terminal": "0"}],"probes":[{"trb": "1","rb": "495","terminal": "0"}]}',0);

insert into th_rasp_pulsador (codigo_tp,modulo,argumentos,inhibir) values
(21,7,'{"trb_tpss":"7","rb_tpss":"322","terminal_tpss":"7","trb_tpse":"0","rb_tpse":"321","terminal_tpse":"9","valves":[{"trb": "23","rb": "528","terminal": "1"}],"probes":[{"trb": "1","rb": "325","terminal": "0"}]}',0);


-- DEPURACION
update trb_rasp_sd set domo = 1 where id = 187;
update trb_rasp_ed set domo = 1 where id = 211;

insert into th_rasp_sd  (codigo_tp,modulo,argumentos,inhibir) values
(187,4,'{"floor":"7","room":"57","zone":"120","type":"0","nemo":"0"}',0);

insert into th_rasp_ed  (codigo_tp,modulo,argumentos,inhibir) values
(211,4,'{"floor":"7","room":"57","zone":"120","type":"0","nemo":"0"}',0);

insert into luces (nemo,codigo_estancia,estado,rgb) values
('depuracion',57,0,NULL);

insert into relacion_luces (codigo_luces, rb_e_estado, codigo_tp_e_estado,rb_s_estado,codigo_tp_s_estado) values
(120,496,211,497,187);

update set iniciarhilostrb set trb = 51 ,inhibir = 1 where codigo_rb = 519;

update rb set tipotrb =51 where id = 519;

update relacion_rb set subdriver = 'ibercomp_sonda' where codigo_rb = 519;

update comando set tipodriver = 'Ibercomp_sonda', nemo ='sonda ibecomp depuradora' where id = 56;

delete from trb_md02 where codigo_rb = 519;

--
-- Table structure for table `trb_ibercomp_sonda`
--

DROP TABLE IF EXISTS `trb_ibercomp_sonda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE  IF NOT EXISTS `trb_ibercomp_sonda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `borna` int(11) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `codigo_rb` int(11) DEFAULT NULL,
  `domo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trb_ibercomp_sonda`
--

LOCK TABLES `trb_ibercomp_sonda` WRITE;
/*!40000 ALTER TABLE `trb_ibercomp_sonda` DISABLE KEYS */;
INSERT INTO `trb_ibercomp_sonda` VALUES (1,'2022-09-08 16:31:59',0,NULL,519,0),(2,'2022-09-08 16:31:59',1,NULL,519,0);
/*!40000 ALTER TABLE `trb_ibercomp_sonda` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_trb_ibercomp_sonda
   AFTER UPDATE ON trb_ibercomp_sonda
   FOR EACH ROW
   BEGIN

   IF NEW.domo = 2 THEN
      CASE
         WHEN NEW.borna = 0 THEN
            UPDATE clima SET temperatura = NEW.valor, fecha = now()
            WHERE id = (SELECT codigo_clima FROM relacion_clima WHERE rb_temp = NEW.codigo_rb AND codigo_tp_temp = NEW.id);
         WHEN NEW.borna = 1 THEN
            UPDATE clima SET humedad = NEW.valor, fecha = now()
            WHERE id = (SELECT codigo_clima FROM relacion_clima WHERE rb_humedad = NEW.codigo_rb AND codigo_tp_humedad = NEW.id);
         ELSE
            BEGIN
            END;
      END CASE;
   END IF;

   END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `th_ibercomp_sonda`
--

DROP TABLE IF EXISTS `th_ibercomp_sonda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE  IF NOT EXISTS `th_ibercomp_sonda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_tp` int(11) DEFAULT NULL,
  `modulo` int(11) DEFAULT NULL,
  `fk` int(11) DEFAULT NULL,
  `argumentos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `inhibir` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `modulo` (`modulo`),
  KEY `codigo_tp` (`codigo_tp`),
  CONSTRAINT `_ibercomp_sonda_thfk_1` FOREIGN KEY (`codigo_tp`) REFERENCES `trb_ibercomp_sonda` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `th_ibercomp_sonda`
--

LOCK TABLES `th_ibercomp_sonda` WRITE;
/*!40000 ALTER TABLE `th_ibercomp_sonda` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_ibercomp_sonda` ENABLE KEYS */;
UNLOCK TABLES;

-- MODIFICAR ESTRUCTURAS TABLAS

ALTER TABLE tpse DROP CONSTRAINT `tpse_ibfk_1`;
ALTER TABLE tpse DROP CONSTRAINT `tpse_ibfk_2`;

ALTER TABLE tpss DROP CONSTRAINT `tpss_ibfk_1`;
ALTER TABLE tpss DROP CONSTRAINT `tpss_ibfk_2`;


ALTER TABLE iniciarhilostrb ADD CONSTRAINT `ini_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE trb_analizador ADD CONSTRAINT `trb_analizador_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_iber_8ed_conv ADD CONSTRAINT `trb_iber_8ed_conv_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_iber_8sd_conv ADD CONSTRAINT `trb_iber_8sd_conv_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_ibercomp_sonda ADD CONSTRAINT `trb_ibercomp_sonda_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_md02 ADD CONSTRAINT `trb_md02_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_rasp_dali_e ADD CONSTRAINT `trb_rasp_dali_e_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_rasp_dali_s ADD CONSTRAINT `trb_rasp_dali_s_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_rasp_ds18b20 ADD CONSTRAINT `trb_rasp_ds18b20_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_rasp_ed ADD CONSTRAINT `trb_rasp_ed_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_rasp_pulsador ADD CONSTRAINT `trb_rasp_pulsador_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_rasp_sa ADD CONSTRAINT `trb_rasp_sa_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_rasp_sd ADD CONSTRAINT `trb_rasp_sd_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_somfy_50_e ADD CONSTRAINT `trb_somfy_50_e_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_somfy_50_s ADD CONSTRAINT `trb_somfy_50_s_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_somfy_rts_e ADD CONSTRAINT `trb_somfy_rts_e_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_somfy_rts_s ADD CONSTRAINT `trb_somfy_rts_s_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_sugar_conv_e ADD CONSTRAINT `trb_sugar_conv_e_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_sugar_conv_s ADD CONSTRAINT `trb_sugar_conv_s_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_sungrow_e ADD CONSTRAINT `trb_sungrow_e_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_sungrow_s ADD CONSTRAINT `trb_sungrow_s_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_aerothermal_e ADD CONSTRAINT `trb_aerothermal_e_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_aerothermal_s ADD CONSTRAINT `trb_aerothermal_s_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE trb_iber_8ed_modbus ADD CONSTRAINT `trb_iber_8ed_modbus_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_iber_8sd_modbus ADD CONSTRAINT `trb_iber_8sd_modbus_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE luces change column rgb rgb varchar(15) default null;

alter table escenas add column codigo_planta int(11) DEFAULT NULL;
alter table escenas add column codigo_grupo int (11) DEFAULT NULL;
alter table escenas ADD CONSTRAINT `escenas_ibfk_2` FOREIGN KEY (`codigo_planta`) REFERENCES `planta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
alter table escenas ADD CONSTRAINT `escenas_ibfk_3` FOREIGN KEY (`codigo_grupo`) REFERENCES `grupo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

alter table tarea add column `hora_inicio` varchar(10) DEFAULT NULL;
alter table tarea add column `hora_fin` varchar(10) DEFAULT NULL;


update th_rasp_ds18b20 set fk=0 where modulo=6;

-- CORTINAS
DROP TABLE IF EXISTS `relacion_cortinas`;
DROP TABLE IF EXISTS `cortinas`;
DROP TABLE IF EXISTS `cortinas_previo_rutina`;

--
-- Table structure for table `cortinas`
--
CREATE TABLE `cortinas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  `tipo` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `cortinas_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `cortinas_previo_rutina`
--
CREATE TABLE `cortinas_previo_rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  `tipo` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `cortinas_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `relacion_cortinas`
--
CREATE TABLE `relacion_cortinas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo_cortinas` int(11) NOT NULL,
  `rb_s_abrir` int(11) DEFAULT -1,
  `codigo_tp_s_abrir` int(11) DEFAULT -1,
  `rb_s_cerrar` int(11) DEFAULT -1,
  `codigo_tp_s_cerrar` int(11) DEFAULT -1,
  `rb_e_abrir` int(11) DEFAULT -1,
  `codigo_tp_e_abrir` int(11) DEFAULT -1,
  `rb_e_cerrar` int(11) DEFAULT -1,
  `codigo_tp_e_cerrar` int(11) DEFAULT -1,
  PRIMARY KEY (`id`),
  KEY `codigo_cortinas` (`codigo_cortinas`),
  CONSTRAINT `relacion_cortinas_ibfk_1` FOREIGN KEY (`codigo_cortinas`) REFERENCES `cortinas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
