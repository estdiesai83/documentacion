insert into variables (nemo, valor, tipo) VALUES
('consigna_temp_gimnasio',22,1),
('rango_temp_gimnasio',1,1),
('consigna_temp_piscina_int',22,1),
('rango_temp_piscina_int',1,1),
('Gimnasio',10,3),
('Piscina interior',10,3);


insert into clima VALUES  (25,'2022-09-15 09:51:45','Gimnasio',40,0,22,22,0,NULL,0,0,0),(26,'2022-09-16 09:00:31','Piscina interior',41,0,22,22,0,NULL,1,0,0);
insert into relacion_clima VALUES (25,'2022-09-15 09:52:53',25,-1,520,36,-1,-1,-1,-1,-1,-1,-1,-1,312,161,162,163,164,51),(26,'2022-09-15 09:55:05',26,-1,510,28,-1,-1,-1,-1,-1,-1,-1,-1,315,171,172,173,174,52);


update trb_iber_8sd_conv set domo = 11 where id = 20;
update trb_iber_8sd_conv set domo = 11 where id = 24;
update trb_iber_8sd_conv set domo = 11 where id = 28;
update trb_iber_8sd_conv set domo = 11 where id = 32;
update trb_iber_8sd_conv set domo = 11 where id = 33;


update trb_iber_8ed_conv set domo = 11 where id = 33;
update trb_iber_8ed_conv set domo = 11 where id = 41;
update trb_iber_8ed_conv set domo = 11 where id = 49;
update trb_iber_8ed_conv set domo = 11 where id = 57;
update trb_iber_8ed_conv set domo = 11 where id = 58;


insert into th_iber_8sd_conv (codigo_tp, modulo, argumentos, inhibir ) VALUES
(20,4,'{"floor":"1","room":"1","zone":"1","nemo":"12"}',0),
(24,4,'{"floor":"1","room":"2","zone":"2","nemo":"12"}',0),
(28,4,'{"floor":"1","room":"3","zone":"3","nemo":"12"}',0),
(32,4,'{"floor":"1","room":"74","zone":"4","nemo":"12"}',0),
(33,4,'{"floor":"1","room":"74","zone":"5","nemo":"12"}',0);


insert into th_iber_8ed_conv (codigo_tp, modulo, argumentos, inhibir ) VALUES
(41,4,'{"floor":"1","room":"1","zone":"1","nemo":"12"}',0),
(33,4,'{"floor":"1","room":"2","zone":"2","nemo":"12"}',0),
(49,4,'{"floor":"1","room":"3","zone":"3","nemo":"12"}',0),
(57,4,'{"floor":"1","room":"74","zone":"4","nemo":"12"}',0),
(58,4,'{"floor":"1","room":"74","zone":"5","nemo":"12"}',0);


--
-- Table structure for table `bombas`
--
DROP TABLE IF EXISTS `operacion_bombas`;
DROP TABLE IF EXISTS `relacion_bombas`;
DROP TABLE IF EXISTS `relacion_grupo_bombas`;
DROP TABLE IF EXISTS `grupo_bombas`;
DROP TABLE IF EXISTS `bombas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bombas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `bombas_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bombas`
--

LOCK TABLES `bombas` WRITE;
/*!40000 ALTER TABLE `bombas` DISABLE KEYS */;
INSERT INTO `bombas` VALUES (1,'2022-09-15 09:56:51','Bomba Fuente',1,0),(2,'2022-09-15 09:57:48','Bomba Fuente',2,0),(3,'2022-09-15 09:59:00','Bomba Fuente',3,0),(4,'2022-09-15 10:00:07','Bomba chorros',74,0),(5,'2022-09-15 10:00:53','Bomba cascada',74,0);
/*!40000 ALTER TABLE `bombas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacion_bombas`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relacion_bombas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo_bombas` int(11) NOT NULL,
  `rb_e_estado` int(11) NOT NULL,
  `codigo_tp_e_estado` int(11) NOT NULL,
  `rb_s_estado` int(11) NOT NULL,
  `codigo_tp_s_estado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_bombas` (`codigo_bombas`),
  CONSTRAINT `relacion_bombas_ibfk_1` FOREIGN KEY (`codigo_bombas`) REFERENCES `bombas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacion_bombas`
--

LOCK TABLES `relacion_bombas` WRITE;
/*!40000 ALTER TABLE `relacion_bombas` DISABLE KEYS */;
INSERT INTO `relacion_bombas` VALUES (1,'2022-09-15 09:56:52',1,341,41,340,24),(2,'2022-09-15 09:57:48',2,339,33,338,20),(3,'2022-09-15 09:59:00',3,343,49,342,28),(4,'2022-09-15 10:00:07',4,345,57,344,32),(5,'2022-09-15 10:00:53',5,345,58,344,33);
/*!40000 ALTER TABLE `relacion_bombas` ENABLE KEYS */;
UNLOCK TABLES;




CREATE TABLE `operacion_bombas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_bombas` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_bombas` (`codigo_bombas`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `ope_bombas_ibfk_1` FOREIGN KEY (`codigo_bombas`) REFERENCES `bombas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ope_bombas_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `grupo_bombas`
--
CREATE TABLE `grupo_bombas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `relacion_grupo_bombas`
--

CREATE TABLE `relacion_grupo_bombas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_bombas` int(11) NOT NULL,
  `codigo_grupo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_bombas` (`codigo_bombas`),
  KEY `codigo_grupo` (`codigo_grupo`),
  CONSTRAINT `relacion_grupo_bombas_ibfk_1` FOREIGN KEY (`codigo_bombas`) REFERENCES `bombas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relacion_grupo_bombas_ibfk_2` FOREIGN KEY (`codigo_grupo`) REFERENCES `grupo_bombas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `grupo_luces`
--

DROP TABLE IF EXISTS `relacion_grupo_luces`;
DROP TABLE IF EXISTS `grupo_luces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo_luces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_luces`
--

LOCK TABLES `grupo_luces` WRITE;
/*!40000 ALTER TABLE `grupo_luces` DISABLE KEYS */;
INSERT INTO `grupo_luces` VALUES (1,'2022-09-19 09:20:37','fuente interior'),(2,'2022-09-19 09:20:51','fuente entrada'),(3,'2022-09-19 09:21:08','fuente terraza'),(4,'2022-09-19 09:21:57','lago jardin');
/*!40000 ALTER TABLE `grupo_luces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacion_grupo_luces`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relacion_grupo_luces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_luces` int(11) NOT NULL,
  `codigo_grupo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_luces` (`codigo_luces`),
  KEY `codigo_grupo` (`codigo_grupo`),
  CONSTRAINT `relacion_grupo_luces_ibfk_1` FOREIGN KEY (`codigo_luces`) REFERENCES `luces` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relacion_grupo_luces_ibfk_2` FOREIGN KEY (`codigo_grupo`) REFERENCES `grupo_luces` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacion_grupo_luces`
--

LOCK TABLES `relacion_grupo_luces` WRITE;
/*!40000 ALTER TABLE `relacion_grupo_luces` DISABLE KEYS */;
INSERT INTO `relacion_grupo_luces` VALUES (1,113,1),(2,112,2),(3,114,3),(4,115,4);
/*!40000 ALTER TABLE `relacion_grupo_luces` ENABLE KEYS */;
UNLOCK TABLES;

delete from tarea;
delete from tarea_bd;

alter table tarea AUTO_INCREMENT=1;
alter table tarea_bd AUTO_INCREMENT=1;
-- LUCES
-- fuente interior
insert into tarea (modo,scheduled,tipo,estado,codigodomo,tipotarea,submodo,comentario) VALUES (
'1', '0 00 20 * * 0,1,2,3,4,5,6',0,1,1,3,4,'Encendido luces fuente interior');
insert into tarea (modo,scheduled,tipo,estado,codigodomo,tipotarea,submodo,comentario) VALUES (
'1', '0 00 00 * * 0,1,2,3,4,5,6',0,1,1,3,5,'Apagado luces fuente interior');

insert into tarea_rpc (argumentos, codigo_tarea) VALUES
('{"fk":"output_rpc","trb":"23","subtype":"0","rb":"340","terminal":"3","value":"1"}',1);
insert into tarea_rpc (argumentos, codigo_tarea) VALUES
('{"fk":"output_rpc","trb":"23","subtype":"0","rb":"340","terminal":"3","value":"0"}',2);

-- fuente entrada
insert into tarea (modo,scheduled,tipo,estado,codigodomo,tipotarea,submodo,comentario) VALUES (
'1', '0 00 20 * * 0,1,2,3,4,5,6',0,1,2,3,4,'Encendido luces fuente entrada');
insert into tarea (modo,scheduled,tipo,estado,codigodomo,tipotarea,submodo,comentario) VALUES (
'1', '0 00 00 * * 0,1,2,3,4,5,6',0,1,2,3,5,'Apagado luces fuente entrada');

insert into tarea_rpc (argumentos, codigo_tarea) VALUES
('{"fk":"output_rpc","trb":"23","subtype":"0","rb":"338","terminal":"3","value":"1"}',3);
insert into tarea_rpc (argumentos, codigo_tarea) VALUES
('{"fk":"output_rpc","trb":"23","subtype":"0","rb":"338","terminal":"3","value":"0"}',4);

-- fuente terraza
insert into tarea (modo,scheduled,tipo,estado,codigodomo,tipotarea,submodo,comentario) VALUES (
'1', '0 00 20 * * 0,1,2,3,4,5,6',0,1,3,3,4,'Encendido luces fuente terraza');
insert into tarea (modo,scheduled,tipo,estado,codigodomo,tipotarea,submodo,comentario) VALUES (
'1', '0 00 00 * * 0,1,2,3,4,5,6',0,1,3,3,5,'Apagado luces fuente terraza');

insert into tarea_rpc (argumentos, codigo_tarea) VALUES
('{"fk":"output_rpc","trb":"23","subtype":"0","rb":"342","terminal":"3","value":"1"}',5);
insert into tarea_rpc (argumentos, codigo_tarea) VALUES
('{"fk":"output_rpc","trb":"23","subtype":"0","rb":"342","terminal":"3","value":"0"}',6);

-- lago jardin
insert into tarea (modo,scheduled,tipo,estado,codigodomo,tipotarea,submodo,comentario) VALUES (
'1', '0 00 20 * * 0,1,2,3,4,5,6',0,1,4,3,4,'Encendido luces lago');
insert into tarea (modo,scheduled,tipo,estado,codigodomo,tipotarea,submodo,comentario) VALUES (
'1', '0 00 00 * * 0,1,2,3,4,5,6',0,1,4,3,5,'Apagado luces lago');

insert into tarea_rpc (argumentos, codigo_tarea) VALUES
('{"fk":"output_rpc","trb":"23","subtype":"0","rb":"344","terminal":"4","value":"1"}',7);
insert into tarea_rpc (argumentos, codigo_tarea) VALUES
('{"fk":"output_rpc","trb":"23","subtype":"0","rb":"344","terminal":"4","value":"0"}',8);


-- BOMBAS
INSERT INTO `grupo_bombas` VALUES (1,'2022-09-19 10:12:22','bomba fuente'),(2,'2022-09-19 10:12:33','bomba entrada'),(3,'2022-09-19 10:12:49','bomba terraza'),(4,'2022-09-19 10:13:02','bombas lagos');
INSERT INTO `relacion_grupo_bombas` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,4);

-- fuente interior
insert into tarea (modo,scheduled,tipo,estado,codigodomo,tipotarea,submodo,comentario) VALUES (
'1', '0 00 20 * * 0,1,2,3,4,5,6',0,1,1,7,4,'Encendido bombas fuente interior');
insert into tarea (modo,scheduled,tipo,estado,codigodomo,tipotarea,submodo,comentario) VALUES (
'1', '0 00 00 * * 0,1,2,3,4,5,6',0,1,1,7,5,'Apagado bombas fuente interior');

insert into tarea_rpc (argumentos, codigo_tarea) VALUES
('{"fk":"output_rpc","trb":"23","subtype":"0","rb":"340","terminal":"0","value":"1"}',9);
insert into tarea_rpc (argumentos, codigo_tarea) VALUES
('{"fk":"output_rpc","trb":"23","subtype":"0","rb":"340","terminal":"0","value":"0"}',10);

-- fuente entrada
insert into tarea (modo,scheduled,tipo,estado,codigodomo,tipotarea,submodo,comentario) VALUES (
'1', '0 00 20 * * 0,1,2,3,4,5,6',0,1,2,7,4,'Encendido bombas fuente entrada');
insert into tarea (modo,scheduled,tipo,estado,codigodomo,tipotarea,submodo,comentario) VALUES (
'1', '0 00 00 * * 0,1,2,3,4,5,6',0,1,2,7,5,'Apagado bombas fuente entrada');

insert into tarea_rpc (argumentos, codigo_tarea) VALUES
('{"fk":"output_rpc","trb":"23","subtype":"0","rb":"338","terminal":"0","value":"1"}',11);
insert into tarea_rpc (argumentos, codigo_tarea) VALUES
('{"fk":"output_rpc","trb":"23","subtype":"0","rb":"338","terminal":"0","value":"0"}',12);

-- fuente terraza
insert into tarea (modo,scheduled,tipo,estado,codigodomo,tipotarea,submodo,comentario) VALUES (
'1', '0 00 20 * * 0,1,2,3,4,5,6',0,1,3,7,4,'Encendido bombas fuente terraza');
insert into tarea (modo,scheduled,tipo,estado,codigodomo,tipotarea,submodo,comentario) VALUES (
'1', '0 00 00 * * 0,1,2,3,4,5,6',0,1,3,7,5,'Apagado bombas fuente terraza');

insert into tarea_rpc (argumentos, codigo_tarea) VALUES
('{"fk":"output_rpc","trb":"23","subtype":"0","rb":"342","terminal":"0","value":"1"}',13);
insert into tarea_rpc (argumentos, codigo_tarea) VALUES
('{"fk":"output_rpc","trb":"23","subtype":"0","rb":"342","terminal":"0","value":"0"}',14);

-- lago jardin
insert into tarea (modo,scheduled,tipo,estado,codigodomo,tipotarea,submodo,comentario) VALUES (
'1', '0 00 20 * * 0,1,2,3,4,5,6',0,1,4,7,4,'Encendido bombas lago');
insert into tarea (modo,scheduled,tipo,estado,codigodomo,tipotarea,submodo,comentario) VALUES (
'1', '0 00 00 * * 0,1,2,3,4,5,6',0,1,4,7,5,'Apagado bombas lago');

insert into tarea_rpc (argumentos, codigo_tarea) VALUES
('{"fk":"output_rpc","trb":"23","subtype":"0","rb":"344","terminal":"0","value":"1"}',15);
insert into tarea_rpc (argumentos, codigo_tarea) VALUES
('{"fk":"output_rpc","trb":"23","subtype":"0","rb":"344","terminal":"0","value":"1"}',15);
insert into tarea_rpc (argumentos, codigo_tarea) VALUES
('{"fk":"output_rpc","trb":"23","subtype":"0","rb":"344","terminal":"1","value":"0"}',16);
insert into tarea_rpc (argumentos, codigo_tarea) VALUES
('{"fk":"output_rpc","trb":"23","subtype":"0","rb":"344","terminal":"1","value":"0"}',16);


alter table grupo_bombas add column modo int(11) default 0;
alter table grupo_bombas add column programacion int(11) default 0;

alter table grupo_luces add column modo int(11) default 0;
alter table grupo_luces add column programacion int(11) default 0;

update grupo_luces set modo = 0, programacion = 0;
update grupo_bombas set modo = 0, programacion = 0;

update tareas set estado = 0;


--  original th_iber_8ed_conv
-- |  1 |        36 |      4 | NULL | {"floor":"1","room":"2","zone":"112","type":"0","nemo":"0"}  |       0 |
-- |  2 |        44 |      4 | NULL | {"floor":"1","room":"1","zone":"113","type":"0","nemo":"0"}  |       0 |
-- |  3 |        52 |      4 | NULL | {"floor":"1","room":"3","zone":"114","type":"0","nemo":"0"}  |       0 |
-- |  4 |        61 |      4 | NULL | {"floor":"1","room":"74","zone":"115","type":"0","nemo":"0"} |       0 |

-- | 11 |        41 |      4 | NULL | {"floor":"1","room":"1","zone":"1","nemo":"12"}              |       0 |
-- | 12 |        33 |      4 | NULL | {"floor":"1","room":"2","zone":"2","nemo":"12"}              |       0 |
-- | 13 |        49 |      4 | NULL | {"floor":"1","room":"3","zone":"3","nemo":"12"}              |       0 |
-- | 14 |        57 |      4 | NULL | {"floor":"1","room":"74","zone":"4","nemo":"12"}             |       0 |
-- | 15 |        58 |      4 | NULL | {"floor":"1","room":"74","zone":"5","nemo":"12"}             |       0

update th_iber_8ed_conv set argumentos = '{"floor":"1","room":"2","group":"1","zone":"112","type":"0","nemo":"14"}' where id = 1;
update th_iber_8ed_conv set argumentos = '{"floor":"1","room":"1","group":"2","zone":"113","type":"0","nemo":"14"}' where id = 2;
update th_iber_8ed_conv set argumentos = '{"floor":"1","room":"3","group":"3","zone":"114","type":"0","nemo":"14"}' where id = 3;
update th_iber_8ed_conv set argumentos = '{"floor":"1","room":"74","group":"4","zone":"115","type":"0","nemo":"14"}' where id = 4;

update th_iber_8ed_conv set argumentos = '{"floor":"1","room":"1","group":"1","zone":"1","type":"0","nemo":"15"}' where id = 11;
update th_iber_8ed_conv set argumentos = '{"floor":"1","room":"2","group":"2","zone":"2","type":"0","nemo":"15"}' where id = 12;
update th_iber_8ed_conv set argumentos = '{"floor":"1","room":"3","group":"3","zone":"3","type":"0","nemo":"15"}' where id = 13;
update th_iber_8ed_conv set argumentos = '{"floor":"1","room":"74","group":"4","zone":"4","type":"0","nemo":"15"}' where id = 14;
update th_iber_8ed_conv set argumentos = '{"floor":"1","room":"74","group":"5","zone":"5","type":"0","nemo":"15"}' where id = 15;

-- original th_iber_8sd_conv

-- | 35 |        23 |      4 | NULL | {"floor":"1","room":"2","zone":"112","type":"0","nemo":"0"}  |       0 |
-- | 36 |        27 |      4 | NULL | {"floor":"1","room":"1","zone":"113","type":"0","nemo":"0"}  |       0 |
-- | 37 |        31 |      4 | NULL | {"floor":"1","room":"3","zone":"114","type":"0","nemo":"0"}  |       0 |
-- | 38 |        36 |      4 | NULL | {"floor":"1","room":"74","zone":"115","type":"0","nemo":"0"} |       0 |

-- | 39 |        24 |      4 | NULL | {"floor":"1","room":"1","zone":"1","nemo":"12"}              |       0 |
-- | 40 |        20 |      4 | NULL | {"floor":"1","room":"2","zone":"2","nemo":"12"}              |       0 |
-- | 41 |        28 |      4 | NULL | {"floor":"1","room":"3","zone":"3","nemo":"12"}              |       0 |
-- | 42 |        32 |      4 | NULL | {"floor":"1","room":"74","zone":"4","nemo":"12"}             |       0 |
-- | 43 |        33 |      4 | NULL | {"floor":"1","room":"74","zone":"5","nemo":"12"}


update th_iber_8sd_conv set argumentos = '{"floor":"1","room":"2","group":"1","zone":"112","type":"0","nemo":"14"}' where id = 35;
update th_iber_8sd_conv set argumentos = '{"floor":"1","room":"1","group":"2","zone":"113","type":"0","nemo":"14"}' where id = 36;
update th_iber_8sd_conv set argumentos = '{"floor":"1","room":"3","group":"3","zone":"114","type":"0","nemo":"14"}' where id = 37;
update th_iber_8sd_conv set argumentos = '{"floor":"1","room":"74","group":"4","zone":"115","type":"0","nemo":"14"}' where id = 38;

update th_iber_8sd_conv set argumentos = '{"floor":"1","room":"1","group":"1","zone":"1","type":"0","nemo":"15"}' where id = 39;
update th_iber_8sd_conv set argumentos = '{"floor":"1","room":"2","group":"2","zone":"2","type":"0","nemo":"15"}' where id = 40;
update th_iber_8sd_conv set argumentos = '{"floor":"1","room":"3","group":"3","zone":"3","type":"0","nemo":"15"}' where id = 41;
update th_iber_8sd_conv set argumentos = '{"floor":"1","room":"74","group":"4","zone":"4","type":"0","nemo":"15"}' where id = 42;
update th_iber_8sd_conv set argumentos = '{"floor":"1","room":"74","group":"5","zone":"5","type":"0","nemo":"15"}' where id = 43;


update grupo_bombas set nemo = 'bomba chorros' where id = 4;

insert grupo_bombas (nemo) VALUES ('bomba cascada');

update relacion_grupo_bombas set codigo_grupo = 5 where id = 5;



insert into tarea (modo,scheduled,tipo,estado,codigodomo,tipotarea,submodo,comentario) VALUES (
'1', '0 00 20 * * 0,1,2,3,4,5,6',0,1,5,7,4,'Encendido bombas lago');
insert into tarea (modo,scheduled,tipo,estado,codigodomo,tipotarea,submodo,comentario) VALUES (
'1', '0 00 00 * * 0,1,2,3,4,5,6',0,1,5,7,5,'Apagado bombas lago');


update tarea_rpc set codigo_tarea = 16,argumentos = '{"fk":"output_rpc","trb":"23","subtype":"0","rb":"344","terminal":"0","value":"0"}' where id =16;
update tarea_rpc set codigo_tarea = 17,argumentos = '{"fk":"output_rpc","trb":"23","subtype":"0","rb":"344","terminal":"1","value":"1"}' where id =17;
update tarea_rpc set codigo_tarea = 18,argumentos = '{"fk":"output_rpc","trb":"23","subtype":"0","rb":"344","terminal":"1","value":"0"}' where id =18;

update clima set sleep_fancoil = 0 where id = 25;
update clima set sleep_fancoil = 0 where id = 26;

update relacion_clima set codigo_variables = 47 where codigo_clima = 25;
update relacion_clima set codigo_variables = 49 where codigo_clima = 26;

