use sistema_montecerrado ;

alter table ot change column fecha_inicio fecha_inicio date not null;
alter table ot change column fecha_fin fecha_fin date DEFAULT null;

use sistema_pr_montecerrado ;

alter table ot change column fecha_inicio fecha_inicio date not null;
alter table ot change column fecha_fin fecha_fin date DEFAULT null;


use sistema_somosaguas ;

alter table ot change column fecha_inicio fecha_inicio date not null;
alter table ot change column fecha_fin fecha_fin date DEFAULT null;

use sistema_pr_somosaguas ;

alter table ot change column fecha_inicio fecha_inicio date not null;
alter table ot change column fecha_fin fecha_fin date DEFAULT null;

use sistema_rudy_v2 ;

alter table ot change column fecha_inicio fecha_inicio date not null;
alter table ot change column fecha_fin fecha_fin date DEFAULT null;


use sistema_pr_montecerrado;

ALTER TABLE `rutina` ADD COLUMN tipo_rutina int (11) DEFAULT 0;
ALTER TABLE `rutina` ADD COLUMN pertenencia int (11) DEFAULT NULL;


DROP TABLE `relacion_escena_operacion`;

--
-- Table structure for table `relacion_escena_operacion`
--
CREATE TABLE `relacion_escena_operacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_escena` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_escena` (`codigo_escena`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `rel_esc_ope_ibfk_1` FOREIGN KEY (`codigo_escena`) REFERENCES `escenas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `rel_esc_ope_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE `relacion_ambiente_operacion`;

CREATE TABLE `relacion_ambiente_operacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_ambiente` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `tiempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_ambiente` (`codigo_ambiente`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `rel_amb_ope_ibfk_1` FOREIGN KEY (`codigo_ambiente`) REFERENCES `ambiente` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `rel_amb_ope_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE `relacion_rutina_operacion`;

CREATE TABLE `relacion_rutina_operacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_rutina` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `tiempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_rutina` (`codigo_rutina`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `rel_rut_ope_ibfk_1` FOREIGN KEY (`codigo_rutina`) REFERENCES `rutina` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `rel_rut_ope_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE `tarea_rutina`;

CREATE TABLE `tarea_rutina` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `codigo_tarea` int(11) DEFAULT NULL,
   `codigo_rutina` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_tarea` (`codigo_tarea`),
  KEY `codigo_rutina` (`codigo_rutina`),
  CONSTRAINT `tarea_rut_ibfk_1` FOREIGN KEY (`codigo_tarea`) REFERENCES `tarea` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tarea_rut_ibfk_2` FOREIGN KEY (`codigo_rutina`) REFERENCES `rutina` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

use sistema_montecerrado;

ALTER TABLE `rutina` ADD COLUMN tipo_rutina int (11) DEFAULT 0;
ALTER TABLE `rutina` ADD COLUMN pertenencia int (11) DEFAULT NULL;

DROP TABLE `relacion_escena_operacion`;

--
-- Table structure for table `relacion_escena_operacion`
--
CREATE TABLE `relacion_escena_operacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_escena` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_escena` (`codigo_escena`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `rel_esc_ope_ibfk_1` FOREIGN KEY (`codigo_escena`) REFERENCES `escenas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `rel_esc_ope_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE `relacion_ambiente_operacion`;

CREATE TABLE `relacion_ambiente_operacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_ambiente` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `tiempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_ambiente` (`codigo_ambiente`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `rel_amb_ope_ibfk_1` FOREIGN KEY (`codigo_ambiente`) REFERENCES `ambiente` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `rel_amb_ope_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE `relacion_rutina_operacion`;

CREATE TABLE `relacion_rutina_operacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_rutina` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `tiempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_rutina` (`codigo_rutina`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `rel_rut_ope_ibfk_1` FOREIGN KEY (`codigo_rutina`) REFERENCES `rutina` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `rel_rut_ope_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE `tarea_rutina`;

CREATE TABLE `tarea_rutina` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `codigo_tarea` int(11) DEFAULT NULL,
   `codigo_rutina` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_tarea` (`codigo_tarea`),
  KEY `codigo_rutina` (`codigo_rutina`),
  CONSTRAINT `tarea_rut_ibfk_1` FOREIGN KEY (`codigo_tarea`) REFERENCES `tarea` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tarea_rut_ibfk_2` FOREIGN KEY (`codigo_rutina`) REFERENCES `rutina` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

use sistema_rudy_v2;

ALTER TABLE `rutina` ADD COLUMN tipo_rutina int (11) DEFAULT 0;
ALTER TABLE `rutina` ADD COLUMN pertenencia int (11) DEFAULT NULL;

DROP TABLE `relacion_escena_operacion`;

--
-- Table structure for table `relacion_escena_operacion`
--
CREATE TABLE `relacion_escena_operacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_escena` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_escena` (`codigo_escena`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `rel_esc_ope_ibfk_1` FOREIGN KEY (`codigo_escena`) REFERENCES `escenas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `rel_esc_ope_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE `relacion_ambiente_operacion`;

CREATE TABLE `relacion_ambiente_operacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_ambiente` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `tiempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_ambiente` (`codigo_ambiente`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `rel_amb_ope_ibfk_1` FOREIGN KEY (`codigo_ambiente`) REFERENCES `ambiente` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `rel_amb_ope_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE `relacion_rutina_operacion`;

CREATE TABLE `relacion_rutina_operacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_rutina` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `tiempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_rutina` (`codigo_rutina`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `rel_rut_ope_ibfk_1` FOREIGN KEY (`codigo_rutina`) REFERENCES `rutina` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `rel_rut_ope_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE `tarea_rutina`;

CREATE TABLE `tarea_rutina` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `codigo_tarea` int(11) DEFAULT NULL,
   `codigo_rutina` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_tarea` (`codigo_tarea`),
  KEY `codigo_rutina` (`codigo_rutina`),
  CONSTRAINT `tarea_rut_ibfk_1` FOREIGN KEY (`codigo_tarea`) REFERENCES `tarea` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tarea_rut_ibfk_2` FOREIGN KEY (`codigo_rutina`) REFERENCES `rutina` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

use sistema_pr_somosaguas;

ALTER TABLE `rutina` ADD COLUMN tipo_rutina int (11) DEFAULT 0;
ALTER TABLE `rutina` ADD COLUMN pertenencia int (11) DEFAULT NULL;

DROP TABLE `relacion_escena_operacion`;

--
-- Table structure for table `relacion_escena_operacion`
--
CREATE TABLE `relacion_escena_operacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_escena` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_escena` (`codigo_escena`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `rel_esc_ope_ibfk_1` FOREIGN KEY (`codigo_escena`) REFERENCES `escenas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `rel_esc_ope_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `relacion_escena_operacion` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,4),(5,2,5),(6,3,6),(7,3,7),(8,3,8),(9,4,9),(10,4,10),(11,5,11),(12,5,12),(13,5,13),(14,6,14),(15,6,15),(16,7,16),(17,7,17),(18,7,18),(19,8,19),(20,8,20),(21,9,21),(22,9,22),(23,9,23),(24,10,24),(25,10,25),(26,11,26),(27,11,27),(28,11,28),(29,12,29),(30,12,30),(31,13,31),(32,13,32),(33,13,33),(34,14,34),(35,14,35),(36,15,36),(37,15,37),(38,15,38),(39,16,39),(40,16,40),(41,17,41),(42,17,42),(43,17,43),(44,18,44),(45,18,45),(46,19,46),(47,19,47),(48,19,48),(49,20,49),(50,20,50),(51,21,51),(52,21,52),(53,21,53),(54,22,54),(55,22,55),(56,23,56),(57,23,57),(58,23,58),(59,24,59),(60,24,60);


DROP TABLE `relacion_ambiente_operacion`;

CREATE TABLE `relacion_ambiente_operacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_ambiente` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `tiempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_ambiente` (`codigo_ambiente`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `rel_amb_ope_ibfk_1` FOREIGN KEY (`codigo_ambiente`) REFERENCES `ambiente` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `rel_amb_ope_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE `relacion_rutina_operacion`;

CREATE TABLE `relacion_rutina_operacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_rutina` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `tiempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_rutina` (`codigo_rutina`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `rel_rut_ope_ibfk_1` FOREIGN KEY (`codigo_rutina`) REFERENCES `rutina` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `rel_rut_ope_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE `tarea_rutina`;

CREATE TABLE `tarea_rutina` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `codigo_tarea` int(11) DEFAULT NULL,
   `codigo_rutina` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_tarea` (`codigo_tarea`),
  KEY `codigo_rutina` (`codigo_rutina`),
  CONSTRAINT `tarea_rut_ibfk_1` FOREIGN KEY (`codigo_tarea`) REFERENCES `tarea` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tarea_rut_ibfk_2` FOREIGN KEY (`codigo_rutina`) REFERENCES `rutina` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

use sistema_somosaguas;

ALTER TABLE `rutina` ADD COLUMN tipo_rutina int (11) DEFAULT 0;
ALTER TABLE `rutina` ADD COLUMN pertenencia int (11) DEFAULT NULL;

DROP TABLE `relacion_escena_operacion`;

--
-- Table structure for table `relacion_escena_operacion`
--
CREATE TABLE `relacion_escena_operacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_escena` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_escena` (`codigo_escena`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `rel_esc_ope_ibfk_1` FOREIGN KEY (`codigo_escena`) REFERENCES `escenas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `rel_esc_ope_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `relacion_escena_operacion` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,4),(5,2,5),(6,3,6),(7,3,7),(8,3,8),(9,4,9),(10,4,10),(11,5,11),(12,5,12),(13,5,13),(14,6,14),(15,6,15),(16,7,16),(17,7,17),(18,7,18),(19,8,19),(20,8,20),(21,9,21),(22,9,22),(23,9,23),(24,10,24),(25,10,25),(26,11,26),(27,11,27),(28,11,28),(29,12,29),(30,12,30),(31,13,31),(32,13,32),(33,13,33),(34,14,34),(35,14,35),(36,15,36),(37,15,37),(38,15,38),(39,16,39),(40,16,40),(41,17,41),(42,17,42),(43,17,43),(44,18,44),(45,18,45),(46,19,46),(47,19,47),(48,19,48),(49,20,49),(50,20,50),(51,21,51),(52,21,52),(53,21,53),(54,22,54),(55,22,55),(56,23,56),(57,23,57),(58,23,58),(59,24,59),(60,24,60);


DROP TABLE `relacion_ambiente_operacion`;

CREATE TABLE `relacion_ambiente_operacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_ambiente` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `tiempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_ambiente` (`codigo_ambiente`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `rel_amb_ope_ibfk_1` FOREIGN KEY (`codigo_ambiente`) REFERENCES `ambiente` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `rel_amb_ope_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE `relacion_rutina_operacion`;

CREATE TABLE `relacion_rutina_operacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_rutina` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `tiempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_rutina` (`codigo_rutina`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `rel_rut_ope_ibfk_1` FOREIGN KEY (`codigo_rutina`) REFERENCES `rutina` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `rel_rut_ope_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE `tarea_rutina`;

CREATE TABLE `tarea_rutina` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `codigo_tarea` int(11) DEFAULT NULL,
   `codigo_rutina` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_tarea` (`codigo_tarea`),
  KEY `codigo_rutina` (`codigo_rutina`),
  CONSTRAINT `tarea_rut_ibfk_1` FOREIGN KEY (`codigo_tarea`) REFERENCES `tarea` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tarea_rut_ibfk_2` FOREIGN KEY (`codigo_rutina`) REFERENCES `rutina` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
