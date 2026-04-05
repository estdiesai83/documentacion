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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `cuadro` VALUES (1,'C1 - Alumbrado Exterior',NULL,NULL);

CREATE TABLE `automaticos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nemo` varchar(140) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `fila` int(11) DEFAULT NULL,
  `nemofila` varchar(140) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `cuadro` int(11) DEFAULT NULL,
  `rb_e_estado` int(11) DEFAULT NULL,
  `codigo_tp_e_estado` int(11) DEFAULT NULL,
  `rb_s_estado` int(11) DEFAULT NULL,
  `codigo_tp_s_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cuadro` (`cuadro`),
  CONSTRAINT `automaticos_ibfk_1` FOREIGN KEY (`cuadro`) REFERENCES `cuadro` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `automaticos`(id,nemo,tipo,fila,nemofila,estado,cuadro) VALUES (1,'Diferencial entrada',0,1,'Fila 1',1,1),(2,'Automatico entrada zona 1',1,1,'Fila 1',1,1),(3,'Automatico entrada zona 2',1,1,'Fila 1',1,1),(4,'Diferencial lago',0,1,'Fila 1',1,1),(5,'Automatico lago',1,1,'Fila 1',1,1),(6,'Diferencial pradera norte',0,1,'Fila 1',1,1),(7,'Automatico pradera norte Z1',1,1,'Fila 1',1,1),(8,'Automatico pradera norte Z2',1,1,'Fila 1',1,1),(9,NULL,-1,1,'Fila 1',1,1),(10,NULL,-1,1,'Fila 1',1,1),(11,NULL,-1,1,'Fila 1',1,1),(12,NULL,-1,1,'Fila 1',1,1),(13,NULL,-1,1,'Fila 1',1,1),(14,NULL,-1,1,'Fila 1',1,1),(15,NULL,-1,1,'Fila 1',1,1),(16,NULL,-1,1,'Fila 1',1,1),(17,'Diferencial  piscina exterior',0,2,'Fila 2',1,1),(18,'Automatico piscina exterior',1,2,'Fila 2',1,1),(19,'Diferencial Jacuzzi',0,2,'Fila 2',1,1),(20,'Automatico Jacuzzi',1,2,'Fila 2',1,1),(21,'Diferencial pradera sur',0,2,'Fila 2',1,1),(22,'Automatico pradera sur z1',1,2,'Fila 2',1,1),(23,'Automatico pradera sur z2',1,2,'Fila 2',1,1),(24,'Automatico pradera sur z3',1,2,'Fila 2',1,1),(25,'Automatico pradera sur z4',1,2,'Fila 2',1,1),(26,'Diferencial Lago sur',0,2,'Fila 2',1,1),(27,'Automatico Lago sur',1,2,'Fila 2',1,1),(28,NULL,-1,2,'Fila 2',1,1),(29,NULL,-1,2,'Fila 2',1,1);


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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `cuadro` VALUES (1,'C1 - Alumbrado Exterior',NULL,NULL);

CREATE TABLE `automaticos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nemo` varchar(140) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `fila` int(11) DEFAULT NULL,
  `nemofila` varchar(140) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `cuadro` int(11) DEFAULT NULL,
  `rb_e_estado` int(11) DEFAULT NULL,
  `codigo_tp_e_estado` int(11) DEFAULT NULL,
  `rb_s_estado` int(11) DEFAULT NULL,
  `codigo_tp_s_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cuadro` (`cuadro`),
  CONSTRAINT `automaticos_ibfk_1` FOREIGN KEY (`cuadro`) REFERENCES `cuadro` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `automaticos`(id,nemo,tipo,fila,nemofila,estado,cuadro) VALUES (1,'Diferencial entrada',0,1,'Fila 1',1,1),(2,'Automatico entrada zona 1',1,1,'Fila 1',1,1),(3,'Automatico entrada zona 2',1,1,'Fila 1',1,1),(4,'Diferencial lago',0,1,'Fila 1',1,1),(5,'Automatico lago',1,1,'Fila 1',1,1),(6,'Diferencial pradera norte',0,1,'Fila 1',1,1),(7,'Automatico pradera norte Z1',1,1,'Fila 1',1,1),(8,'Automatico pradera norte Z2',1,1,'Fila 1',1,1),(9,NULL,-1,1,'Fila 1',1,1),(10,NULL,-1,1,'Fila 1',1,1),(11,NULL,-1,1,'Fila 1',1,1),(12,NULL,-1,1,'Fila 1',1,1),(13,NULL,-1,1,'Fila 1',1,1),(14,NULL,-1,1,'Fila 1',1,1),(15,NULL,-1,1,'Fila 1',1,1),(16,NULL,-1,1,'Fila 1',1,1),(17,'Diferencial  piscina exterior',0,2,'Fila 2',1,1),(18,'Automatico piscina exterior',1,2,'Fila 2',1,1),(19,'Diferencial Jacuzzi',0,2,'Fila 2',1,1),(20,'Automatico Jacuzzi',1,2,'Fila 2',1,1),(21,'Diferencial pradera sur',0,2,'Fila 2',1,1),(22,'Automatico pradera sur z1',1,2,'Fila 2',1,1),(23,'Automatico pradera sur z2',1,2,'Fila 2',1,1),(24,'Automatico pradera sur z3',1,2,'Fila 2',1,1),(25,'Automatico pradera sur z4',1,2,'Fila 2',1,1),(26,'Diferencial Lago sur',0,2,'Fila 2',1,1),(27,'Automatico Lago sur',1,2,'Fila 2',1,1),(28,NULL,-1,2,'Fila 2',1,1),(29,NULL,-1,2,'Fila 2',1,1);



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
  `cuadro` int(11) DEFAULT NULL,
  `rb_e_estado` int(11) DEFAULT NULL,
  `codigo_tp_e_estado` int(11) DEFAULT NULL,
  `rb_s_estado` int(11) DEFAULT NULL,
  `codigo_tp_s_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cuadro` (`cuadro`),
  CONSTRAINT `automaticos_ibfk_1` FOREIGN KEY (`cuadro`) REFERENCES `cuadro` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
  `cuadro` int(11) DEFAULT NULL,
  `rb_e_estado` int(11) DEFAULT NULL,
  `codigo_tp_e_estado` int(11) DEFAULT NULL,
  `rb_s_estado` int(11) DEFAULT NULL,
  `codigo_tp_s_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cuadro` (`cuadro`),
  CONSTRAINT `automaticos_ibfk_1` FOREIGN KEY (`cuadro`) REFERENCES `cuadro` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
  `cuadro` int(11) DEFAULT NULL,
  `rb_e_estado` int(11) DEFAULT NULL,
  `codigo_tp_e_estado` int(11) DEFAULT NULL,
  `rb_s_estado` int(11) DEFAULT NULL,
  `codigo_tp_s_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cuadro` (`cuadro`),
  CONSTRAINT `automaticos_ibfk_1` FOREIGN KEY (`cuadro`) REFERENCES `cuadro` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
