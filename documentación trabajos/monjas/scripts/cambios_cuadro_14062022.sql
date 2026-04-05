use sistema_pr_somosaguas;
ALTER TABLE luces add column temperatura int(11) default -1;
ALTER TABLE luces_previo_rutina add column temperatura int(11) default -1;

ALTER TABLE operacion_luces add column temperatura int(11) default -1;

ALTER TABLE relacion_luces add column codigo_tp_temp1 int (11) default -1;
ALTER TABLE relacion_luces add column codigo_tp_temp2 int (11) default -1;
ALTER TABLE relacion_luces add column codigo_tp_temp3 int (11) default -1;


use sistema_somosaguas;
ALTER TABLE luces add column temperatura int(11) default -1;
ALTER TABLE luces_previo_rutina add column temperatura int(11) default -1;

ALTER TABLE operacion_luces add column temperatura int(11) default -1;

ALTER TABLE relacion_luces add column codigo_tp_temp1 int (11) default -1;
ALTER TABLE relacion_luces add column codigo_tp_temp2 int (11) default -1;
ALTER TABLE relacion_luces add column codigo_tp_temp3 int (11) default -1;

use sistema_pr_montecerrado;
ALTER TABLE luces add column temperatura int(11) default -1;
ALTER TABLE luces_previo_rutina add column temperatura int(11) default -1;

ALTER TABLE operacion_luces add column temperatura int(11) default -1;

ALTER TABLE relacion_luces add column codigo_tp_temp1 int (11) default -1;
ALTER TABLE relacion_luces add column codigo_tp_temp2 int (11) default -1;
ALTER TABLE relacion_luces add column codigo_tp_temp3 int (11) default -1;

use sistema_montecerrado;
ALTER TABLE luces add column temperatura int(11) default -1;
ALTER TABLE luces_previo_rutina add column temperatura int(11) default -1;

ALTER TABLE operacion_luces add column temperatura int(11) default -1;

ALTER TABLE relacion_luces add column codigo_tp_temp1 int (11) default -1;
ALTER TABLE relacion_luces add column codigo_tp_temp2 int (11) default -1;
ALTER TABLE relacion_luces add column codigo_tp_temp3 int (11) default -1;

use sistema_rudy_v2;
ALTER TABLE luces add column temperatura int(11) default -1;
ALTER TABLE luces_previo_rutina add column temperatura int(11) default -1;

ALTER TABLE operacion_luces add column temperatura int(11) default -1;

ALTER TABLE relacion_luces add column codigo_tp_temp1 int (11) default -1;
ALTER TABLE relacion_luces add column codigo_tp_temp2 int (11) default -1;
ALTER TABLE relacion_luces add column codigo_tp_temp3 int (11) default -1;


use sistema_rudy_v2;

insert into relacion_consumos (nemo, rb_valor, codigo_tp_valor, tipo, subtipo) VALUES
('red',15,1,4,1),
('solar',13,135,4,1);




use sistema_pr_montecerrado;

DROP TABLE IF EXISTS `automaticos`;
DROP TABLE IF EXISTS `cuadro`;


CREATE TABLE `cuadro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_planta` int(11) DEFAULT NULL,
  `codigo_estancia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_planta` (`codigo_planta`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `cuadro_ibfk_1` FOREIGN KEY (`codigo_planta`) REFERENCES `planta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cuadro_ibfk_2` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `automaticos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nemo` varchar(140) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `fila` int(11) DEFAULT NULL,
  `nemofila` varchar(140) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `codigo_cuadro` int(11) DEFAULT NULL,
  `rb_e_estado` int(11) DEFAULT NULL,
  `codigo_tp_e_estado` int(11) DEFAULT NULL,
  `rb_s_estado` int(11) DEFAULT NULL,
  `codigo_tp_s_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_cuadro` (`codigo_cuadro`),
  CONSTRAINT `automaticos_ibfk_1` FOREIGN KEY (`codigo_cuadro`) REFERENCES `cuadro` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

use sistema_montecerrado;

DROP TABLE IF EXISTS `automaticos`;
DROP TABLE IF EXISTS `cuadro`;


CREATE TABLE `cuadro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_planta` int(11) DEFAULT NULL,
  `codigo_estancia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_planta` (`codigo_planta`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `cuadro_ibfk_1` FOREIGN KEY (`codigo_planta`) REFERENCES `planta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cuadro_ibfk_2` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `automaticos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nemo` varchar(140) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `fila` int(11) DEFAULT NULL,
  `nemofila` varchar(140) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `codigo_cuadro` int(11) DEFAULT NULL,
  `rb_e_estado` int(11) DEFAULT NULL,
  `codigo_tp_e_estado` int(11) DEFAULT NULL,
  `rb_s_estado` int(11) DEFAULT NULL,
  `codigo_tp_s_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_cuadro` (`codigo_cuadro`),
  CONSTRAINT `automaticos_ibfk_1` FOREIGN KEY (`codigo_cuadro`) REFERENCES `cuadro` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

use sistema_rudy_v2;

DROP TABLE IF EXISTS `automaticos`;
DROP TABLE IF EXISTS `cuadro`;


CREATE TABLE `cuadro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_planta` int(11) DEFAULT NULL,
  `codigo_estancia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_planta` (`codigo_planta`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `cuadro_ibfk_1` FOREIGN KEY (`codigo_planta`) REFERENCES `planta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cuadro_ibfk_2` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `automaticos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nemo` varchar(140) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `fila` int(11) DEFAULT NULL,
  `nemofila` varchar(140) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `codigo_cuadro` int(11) DEFAULT NULL,
  `rb_e_estado` int(11) DEFAULT NULL,
  `codigo_tp_e_estado` int(11) DEFAULT NULL,
  `rb_s_estado` int(11) DEFAULT NULL,
  `codigo_tp_s_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_cuadro` (`codigo_cuadro`),
  CONSTRAINT `automaticos_ibfk_1` FOREIGN KEY (`codigo_cuadro`) REFERENCES `cuadro` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

use sistema_somosaguas;

DROP TABLE IF EXISTS `automaticos`;
DROP TABLE IF EXISTS `cuadro`;


CREATE TABLE `cuadro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_planta` int(11) DEFAULT NULL,
  `codigo_estancia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_planta` (`codigo_planta`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `cuadro_ibfk_1` FOREIGN KEY (`codigo_planta`) REFERENCES `planta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cuadro_ibfk_2` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `cuadro` VALUES (1,'C1 - Alumbrado Exterior',NULL,NULL);

CREATE TABLE `automaticos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nemo` varchar(140) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `fila` int(11) DEFAULT NULL,
  `nemofila` varchar(140) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `codigo_cuadro` int(11) DEFAULT NULL,
  `rb_e_estado` int(11) DEFAULT NULL,
  `codigo_tp_e_estado` int(11) DEFAULT NULL,
  `rb_s_estado` int(11) DEFAULT NULL,
  `codigo_tp_s_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_cuadro` (`codigo_cuadro`),
  CONSTRAINT `automaticos_ibfk_1` FOREIGN KEY (`codigo_cuadro`) REFERENCES `cuadro` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

INSERT INTO `automaticos` VALUES (1,'Diferencial entrada',0,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(2,'Automatico entrada zona 1',1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(3,'Automatico entrada zona 2',1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(4,'Diferencial lago',0,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(5,'Automatico lago',1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(6,'Diferencial pradera norte',0,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(7,'Automatico pradera norte Z1',1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(8,'Automatico pradera norte Z2',1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(9,NULL,-1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(10,NULL,-1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(11,NULL,-1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(12,NULL,-1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(13,NULL,-1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(14,NULL,-1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(15,NULL,-1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(16,NULL,-1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(17,'Diferencial  piscina exterior',0,2,'Fila 2',1,1,NULL,NULL,NULL,NULL),(18,'Automatico piscina exterior',1,2,'Fila 2',1,1,NULL,NULL,NULL,NULL),(19,'Diferencial Jacuzzi',0,2,'Fila 2',1,1,NULL,NULL,NULL,NULL),(20,'Automatico Jacuzzi',1,2,'Fila 2',1,1,NULL,NULL,NULL,NULL),(21,'Diferencial pradera sur',0,2,'Fila 2',1,1,NULL,NULL,NULL,NULL),(22,'Automatico pradera sur z1',1,2,'Fila 2',1,1,NULL,NULL,NULL,NULL),(23,'Automatico pradera sur z2',1,2,'Fila 2',1,1,NULL,NULL,NULL,NULL),(24,'Automatico pradera sur z3',1,2,'Fila 2',1,1,NULL,NULL,NULL,NULL),(25,'Automatico pradera sur z4',1,2,'Fila 2',1,1,NULL,NULL,NULL,NULL),(26,'Diferencial Lago sur',0,2,'Fila 2',1,1,NULL,NULL,NULL,NULL),(27,'Automatico Lago sur',1,2,'Fila 2',1,1,NULL,NULL,NULL,NULL),(28,NULL,-1,2,'Fila 2',1,1,NULL,NULL,NULL,NULL),(29,NULL,-1,2,'Fila 2',1,1,NULL,NULL,NULL,NULL);



use sistema_pr_somosaguas;

DROP TABLE IF EXISTS `automaticos`;
DROP TABLE IF EXISTS `cuadro`;


CREATE TABLE `cuadro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_planta` int(11) DEFAULT NULL,
  `codigo_estancia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_planta` (`codigo_planta`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `cuadro_ibfk_1` FOREIGN KEY (`codigo_planta`) REFERENCES `planta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cuadro_ibfk_2` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `cuadro` VALUES (1,'C1 - Alumbrado Exterior',NULL,NULL);
-- INSERT INTO `cuadro` VALUES (2,'C2 - Monjas',4,47);

CREATE TABLE `automaticos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nemo` varchar(140) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `fila` int(11) DEFAULT NULL,
  `nemofila` varchar(140) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `codigo_cuadro` int(11) DEFAULT NULL,
  `rb_e_estado` int(11) DEFAULT NULL,
  `codigo_tp_e_estado` int(11) DEFAULT NULL,
  `rb_s_estado` int(11) DEFAULT NULL,
  `codigo_tp_s_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_cuadro` (`codigo_cuadro`),
  CONSTRAINT `automaticos_ibfk_1` FOREIGN KEY (`codigo_cuadro`) REFERENCES `cuadro` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

INSERT INTO `automaticos` VALUES (1,'Diferencial entrada',0,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),
(2,'Automatico entrada zona 1',1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),
(3,'Automatico entrada zona 2',1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),
(4,'Diferencial lago',0,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),
(5,'Automatico lago',1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),
(6,'Diferencial pradera norte',0,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(7,'Automatico pradera norte Z1',1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(8,'Automatico pradera norte Z2',1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(9,NULL,-1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(10,NULL,-1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(11,NULL,-1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(12,NULL,-1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(13,NULL,-1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(14,NULL,-1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(15,NULL,-1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(16,NULL,-1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),(17,'Diferencial  piscina exterior',0,2,'Fila 2',1,1,NULL,NULL,NULL,NULL),(18,'Automatico piscina exterior',1,2,'Fila 2',1,1,NULL,NULL,NULL,NULL),(19,'Diferencial Jacuzzi',0,2,'Fila 2',1,1,NULL,NULL,NULL,NULL),(20,'Automatico Jacuzzi',1,2,'Fila 2',1,1,NULL,NULL,NULL,NULL),(21,'Diferencial pradera sur',0,2,'Fila 2',1,1,NULL,NULL,NULL,NULL),(22,'Automatico pradera sur z1',1,2,'Fila 2',1,1,NULL,NULL,NULL,NULL),(23,'Automatico pradera sur z2',1,2,'Fila 2',1,1,NULL,NULL,NULL,NULL),(24,'Automatico pradera sur z3',1,2,'Fila 2',1,1,NULL,NULL,NULL,NULL),(25,'Automatico pradera sur z4',1,2,'Fila 2',1,1,NULL,NULL,NULL,NULL),(26,'Diferencial Lago sur',0,2,'Fila 2',1,1,NULL,NULL,NULL,NULL),(27,'Automatico Lago sur',1,2,'Fila 2',1,1,NULL,NULL,NULL,NULL),(28,NULL,-1,2,'Fila 2',1,1,NULL,NULL,NULL,NULL),(29,NULL,-1,2,'Fila 2',1,1,NULL,NULL,NULL,NULL);


-- INSERT INTO `automaticos` (nemo, tipo, fila,nemofila,estado,codigo_cuadro, rb_e_estado, codigo_tp_e_estado, rb_s_estado, codigo_tp_s_estado) VALUES
-- ('Automatico General',1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),
-- ('Automatico entrada zona 2',1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),
-- ('Diferencial lago',0,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),
-- ('Automatico lago',1,1,'Fila 1',1,1,NULL,NULL,NULL,NULL),
