use somosaguas;


DROP TABLE IF EXISTS `cuadro`;
CREATE TABLE `cuadro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nemo` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `cuadro` VALUES (1,'C1 - Alumbrado Exterior');

DROP TABLE IF EXISTS `automaticos`;
CREATE TABLE `automaticos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nemo` varchar(140) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `fila` int(11) DEFAULT NULL,
  `nemofila` varchar(140) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `cuadro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cuadro` (`cuadro`),
  CONSTRAINT `automaticos_ibfk_1` FOREIGN KEY (`cuadro`) REFERENCES `cuadro` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `automaticos` VALUES (1,'Diferencial entrada',0,1,'Fila 1',1,1),(2,'Automatico entrada zona 1',1,1,'Fila 1',1,1),(3,'Automatico entrada zona 2',1,1,'Fila 1',1,1),(4,'Diferencial lago',0,1,'Fila 1',1,1),(5,'Automatico lago',1,1,'Fila 1',1,1),(6,'Diferencial pradera norte',0,1,'Fila 1',1,1),(7,'Automatico pradera norte Z1',1,1,'Fila 1',1,1),(8,'Automatico pradera norte Z2',1,1,'Fila 1',1,1),(9,NULL,-1,1,'Fila 1',1,1),(10,NULL,-1,1,'Fila 1',1,1),(11,NULL,-1,1,'Fila 1',1,1),(12,NULL,-1,1,'Fila 1',1,1),(13,NULL,-1,1,'Fila 1',1,1),(14,NULL,-1,1,'Fila 1',1,1),(15,NULL,-1,1,'Fila 1',1,1),(16,NULL,-1,1,'Fila 1',1,1),(17,'Diferencial  piscina exterior',0,2,'Fila 2',1,1),(18,'Automatico piscina exterior',1,2,'Fila 2',1,1),(19,'Diferencial Jacuzzi',0,2,'Fila 2',1,1),(20,'Automatico Jacuzzi',1,2,'Fila 2',1,1),(21,'Diferencial pradera sur',0,2,'Fila 2',1,1),(22,'Automatico pradera sur z1',1,2,'Fila 2',1,1),(23,'Automatico pradera sur z2',1,2,'Fila 2',1,1),(24,'Automatico pradera sur z3',1,2,'Fila 2',1,1),(25,'Automatico pradera sur z4',1,2,'Fila 2',1,1),(26,'Diferencial Lago sur',0,2,'Fila 2',1,1),(27,'Automatico Lago sur',1,2,'Fila 2',1,1),(28,NULL,-1,2,'Fila 2',1,1),(29,NULL,-1,2,'Fila 2',1,1);



DROP TABLE IF EXISTS `historico_post`;
DROP TABLE IF EXISTS `notificaciones`;
DROP TABLE IF EXISTS `post`;
DROP TABLE IF EXISTS `usuario_post`;


--
-- Table structure for table `historico_post`
--

CREATE TABLE `historico_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `tipotcaso` int(11) NOT NULL DEFAULT 0,
  `codigo_post` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_post` (`codigo_post`),
  CONSTRAINT `historico_post_ibfk_1` FOREIGN KEY (`codigo_post`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `notificaciones`
--

CREATE TABLE `notificaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `tipotcaso` int(11) NOT NULL,
  `codigo` int(11) NOT NULL,
  `estado` varchar(10) DEFAULT NULL,
  `emisor` int(11) NOT NULL,
  `receptor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emisor` (`emisor`),
  KEY `receptor` (`receptor`),
  CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`emisor`) REFERENCES `usuario_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notificaciones_ibfk_2` FOREIGN KEY (`receptor`) REFERENCES `usuario_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `post`
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `tipotcaso` int(11) DEFAULT NULL,
  `texto` varchar(140) DEFAULT NULL,
  `estado` int(11) NOT NULL,
  `activo` int(11) NOT NULL,
  `emisor` int(11) NOT NULL,
  `receptor` int(11) NOT NULL,
  `pertenencia` int(11) NOT NULL,
  `fechaanotacion` datetime DEFAULT NULL,
  `codigo_post` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `emisor` (`emisor`),
  KEY `receptor` (`receptor`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`emisor`) REFERENCES `usuario_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`receptor`) REFERENCES `usuario_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `usuario_post`
--

CREATE TABLE `usuario_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(20) DEFAULT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `nif` varchar(15) DEFAULT NULL,
  `tipo` int(11) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `clave` varchar(255) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `activo` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




DROP TABLE IF EXISTS `relacion_ot_ambiente`;
DROP TABLE IF EXISTS `relacion_ot_rutina`;
DROP TABLE IF EXISTS `relacion_ot_home`;

DROP TABLE IF EXISTS `relacion_ambiente_operacion`;
DROP TABLE IF EXISTS `relacion_rutina_operacion`;
DROP TABLE IF EXISTS `relacion_home_operacion`;

DROP TABLE IF EXISTS `relacion_ambiente_escena`;
DROP TABLE IF EXISTS `relacion_rutina_escena`;
DROP TABLE IF EXISTS `relacion_home_escena`;

DROP TABLE IF EXISTS `ambiente`;
DROP TABLE IF EXISTS `rutina`;
DROP TABLE IF EXISTS `home_estado`;


--
-- Table structure for table `ambiente`
--
CREATE TABLE `ambiente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(150) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `estado` int(11) NOT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `codigo_planta` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  KEY `codigo_planta` (`codigo_planta`),
  CONSTRAINT `ambiente_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ambiente_ibfk_2` FOREIGN KEY (`codigo_planta`) REFERENCES `planta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `relacion_ot_ambiente`
--
CREATE TABLE `relacion_ot_ambiente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_ot` int(11) NOT NULL,
  `codigo_ambiente` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_ot` (`codigo_ot`),
  KEY `codigo_ambiente` (`codigo_ambiente`),
  CONSTRAINT `rel_ot_amb_ibfk_1` FOREIGN KEY (`codigo_ot`) REFERENCES `ot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rel_ot_amb_ibfk_2` FOREIGN KEY (`codigo_ambiente`) REFERENCES `ambiente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `relacion_ambiente_operacion`
--
CREATE TABLE `relacion_ambiente_operacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_ambiente` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `tiempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_ambiente` (`codigo_ambiente`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `rel_amb_ope_ibfk_1` FOREIGN KEY (`codigo_ambiente`) REFERENCES `ambiente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rel_amb_ope_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `relacion_ambiente_escena`
--
CREATE TABLE `relacion_ambiente_escena` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_ambiente` int(11) NOT NULL,
  `codigo_escena` int(11) NOT NULL,
  `tiempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_ambiente` (`codigo_ambiente`),
  KEY `codigo_escena` (`codigo_escena`),
  CONSTRAINT `rel_amb_esc_ibfk_1` FOREIGN KEY (`codigo_ambiente`) REFERENCES `ambiente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rel_amb_esc_ibfk_2` FOREIGN KEY (`codigo_escena`) REFERENCES `escenas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `rutina`
--
CREATE TABLE `rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule` varchar(70) NOT NULL,
  `nemo` varchar(150) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `estado` int(11) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time DEFAULT NULL,
  `codigo_estancia` int(11) DEFAULT NULL,
  `codigo_planta` int(11) DEFAULT NULL,
  `notificacion` int(11) DEFAULT 0,
   PRIMARY KEY (`id`),
   KEY `codigo_estancia` (`codigo_estancia`),
   KEY `codigo_planta` (`codigo_planta`),
  CONSTRAINT `rutina_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rutina_ibfk_2` FOREIGN KEY (`codigo_planta`) REFERENCES `planta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `relacion_ot_rutina`
--
CREATE TABLE `relacion_ot_ambiente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_ot` int(11) NOT NULL,
  `codigo_rutina` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_ot` (`codigo_ot`),
  KEY `codigo_rutina` (`codigo_rutina`),
  CONSTRAINT `rel_ot_rut_ibfk_1` FOREIGN KEY (`codigo_ot`) REFERENCES `ot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rel_ot_rut_ibfk_2` FOREIGN KEY (`codigo_rutina`) REFERENCES `rutina` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `relacion_rutina_operacion`
--
CREATE TABLE `relacion_rutina_operacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_rutina` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `tiempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_rutina` (`codigo_rutina`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `rel_rut_ope_ibfk_1` FOREIGN KEY (`codigo_rutina`) REFERENCES `rutina` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rel_rut_ope_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `relacion_rutina_escena`
--
CREATE TABLE `relacion_rutina_escena` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_rutina` int(11) NOT NULL,
  `codigo_escena` int(11) NOT NULL,
  `tiempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_rutina` (`codigo_rutina`),
  KEY `codigo_escena` (`codigo_escena`),
  CONSTRAINT `rel_rut_esc_ibfk_1` FOREIGN KEY (`codigo_rutina`) REFERENCES `rutina` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rel_rut_esc_ibfk_2` FOREIGN KEY (`codigo_escena`) REFERENCES `escenas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `home`
--
CREATE TABLE `home_estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(150) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



--
-- Table structure for table `relacion_ot_home`
--
CREATE TABLE `relacion_ot_home` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_ot` int(11) NOT NULL,
  `codigo_home` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_ot` (`codigo_ot`),
  KEY `codigo_home` (`codigo_home`),
  CONSTRAINT `rel_ot_home_ibfk_1` FOREIGN KEY (`codigo_ot`) REFERENCES `ot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rel_ot_home_ibfk_2` FOREIGN KEY (`codigo_home`) REFERENCES `home_estado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `relacion_home_operacion`
--
CREATE TABLE `relacion_home_operacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_home` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `tiempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_home` (`codigo_home`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `rel_home_ope_ibfk_1` FOREIGN KEY (`codigo_home`) REFERENCES `home_estado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rel_home_ope_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `relacion_home_escena`
--
CREATE TABLE `relacion_home_escena` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_home` int(11) NOT NULL,
  `codigo_escena` int(11) NOT NULL,
  `tiempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_home` (`codigo_home`),
  KEY `codigo_escena` (`codigo_escena`),
  CONSTRAINT `rel_home_esc_ibfk_1` FOREIGN KEY (`codigo_home`) REFERENCES `home_estado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rel_home_esc_ibfk_2` FOREIGN KEY (`codigo_escena`) REFERENCES `escenas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

use sistema_rudy_v2;



DROP TABLE IF EXISTS `cuadro`;
CREATE TABLE `cuadro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nemo` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `automaticos`;
CREATE TABLE `automaticos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nemo` varchar(140) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `fila` int(11) DEFAULT NULL,
  `nemofila` varchar(140) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `cuadro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cuadro` (`cuadro`),
  CONSTRAINT `automaticos_ibfk_1` FOREIGN KEY (`cuadro`) REFERENCES `cuadro` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `historico_post`;
DROP TABLE IF EXISTS `notificaciones`;
DROP TABLE IF EXISTS `post`;
DROP TABLE IF EXISTS `usuario_post`;


--
-- Table structure for table `historico_post`
--

CREATE TABLE `historico_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `tipotcaso` int(11) NOT NULL DEFAULT 0,
  `codigo_post` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_post` (`codigo_post`),
  CONSTRAINT `historico_post_ibfk_1` FOREIGN KEY (`codigo_post`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `notificaciones`
--

CREATE TABLE `notificaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `tipotcaso` int(11) NOT NULL,
  `codigo` int(11) NOT NULL,
  `estado` varchar(10) DEFAULT NULL,
  `emisor` int(11) NOT NULL,
  `receptor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emisor` (`emisor`),
  KEY `receptor` (`receptor`),
  CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`emisor`) REFERENCES `usuario_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notificaciones_ibfk_2` FOREIGN KEY (`receptor`) REFERENCES `usuario_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `post`
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `tipotcaso` int(11) DEFAULT NULL,
  `texto` varchar(140) DEFAULT NULL,
  `estado` int(11) NOT NULL,
  `activo` int(11) NOT NULL,
  `emisor` int(11) NOT NULL,
  `receptor` int(11) NOT NULL,
  `pertenencia` int(11) NOT NULL,
  `fechaanotacion` datetime DEFAULT NULL,
  `codigo_post` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `emisor` (`emisor`),
  KEY `receptor` (`receptor`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`emisor`) REFERENCES `usuario_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`receptor`) REFERENCES `usuario_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `usuario_post`
--

CREATE TABLE `usuario_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(20) DEFAULT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `nif` varchar(15) DEFAULT NULL,
  `tipo` int(11) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `clave` varchar(255) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `activo` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ALTER TABLE ambiente ADD COLUMN codigo_planta int (11) DEFAULT NULL;
-- ALTER TABLE ambiente CHANGE COLUMN codigo_estancia codigo_estancia int (11) DEFAULT NULL;
-- ALTER TABLE ambiente ADD CONSTRAINT `ambiente_ibfk_2` FOREIGN KEY (`codigo_planta`) REFERENCES `planta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
-- -- ALTER TABLE ambiente RENAME ambiente_ibfk_2 TO codigo_planta;



DROP TABLE IF EXISTS `relacion_ot_ambiente`;
DROP TABLE IF EXISTS `relacion_ot_rutina`;
DROP TABLE IF EXISTS `relacion_ot_home`;

DROP TABLE IF EXISTS `relacion_ambiente_operacion`;
DROP TABLE IF EXISTS `relacion_rutina_operacion`;
DROP TABLE IF EXISTS `relacion_home_operacion`;

DROP TABLE IF EXISTS `relacion_ambiente_escena`;
DROP TABLE IF EXISTS `relacion_rutina_escena`;
DROP TABLE IF EXISTS `relacion_home_escena`;

DROP TABLE IF EXISTS `ambiente`;
DROP TABLE IF EXISTS `rutina`;
DROP TABLE IF EXISTS `home_estado`;


--
-- Table structure for table `ambiente`
--
CREATE TABLE `ambiente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(150) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `estado` int(11) NOT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `codigo_planta` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  KEY `codigo_planta` (`codigo_planta`),
  CONSTRAINT `ambiente_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ambiente_ibfk_2` FOREIGN KEY (`codigo_planta`) REFERENCES `planta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `relacion_ot_ambiente`
--
CREATE TABLE `relacion_ot_ambiente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_ot` int(11) NOT NULL,
  `codigo_ambiente` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_ot` (`codigo_ot`),
  KEY `codigo_ambiente` (`codigo_ambiente`),
  CONSTRAINT `rel_ot_amb_ibfk_1` FOREIGN KEY (`codigo_ot`) REFERENCES `ot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rel_ot_amb_ibfk_2` FOREIGN KEY (`codigo_ambiente`) REFERENCES `ambiente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `relacion_ambiente_operacion`
--
CREATE TABLE `relacion_ambiente_operacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_ambiente` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `tiempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_ambiente` (`codigo_ambiente`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `rel_amb_ope_ibfk_1` FOREIGN KEY (`codigo_ambiente`) REFERENCES `ambiente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rel_amb_ope_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `relacion_ambiente_escena`
--
CREATE TABLE `relacion_ambiente_escena` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_ambiente` int(11) NOT NULL,
  `codigo_escena` int(11) NOT NULL,
  `tiempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_ambiente` (`codigo_ambiente`),
  KEY `codigo_escena` (`codigo_escena`),
  CONSTRAINT `rel_amb_esc_ibfk_1` FOREIGN KEY (`codigo_ambiente`) REFERENCES `ambiente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rel_amb_esc_ibfk_2` FOREIGN KEY (`codigo_escena`) REFERENCES `escenas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `rutina`
--
CREATE TABLE `rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule` varchar(70) NOT NULL,
  `nemo` varchar(150) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `estado` int(11) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time DEFAULT NULL,
  `codigo_estancia` int(11) DEFAULT NULL,
  `codigo_planta` int(11) DEFAULT NULL,
  `notificacion` int(11) DEFAULT 0,
   PRIMARY KEY (`id`),
   KEY `codigo_estancia` (`codigo_estancia`),
   KEY `codigo_planta` (`codigo_planta`),
  CONSTRAINT `rutina_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rutina_ibfk_2` FOREIGN KEY (`codigo_planta`) REFERENCES `planta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `relacion_ot_rutina`
--
CREATE TABLE `relacion_ot_ambiente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_ot` int(11) NOT NULL,
  `codigo_rutina` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_ot` (`codigo_ot`),
  KEY `codigo_rutina` (`codigo_rutina`),
  CONSTRAINT `rel_ot_rut_ibfk_1` FOREIGN KEY (`codigo_ot`) REFERENCES `ot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rel_ot_rut_ibfk_2` FOREIGN KEY (`codigo_rutina`) REFERENCES `rutina` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `relacion_rutina_operacion`
--
CREATE TABLE `relacion_rutina_operacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_rutina` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `tiempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_rutina` (`codigo_rutina`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `rel_rut_ope_ibfk_1` FOREIGN KEY (`codigo_rutina`) REFERENCES `rutina` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rel_rut_ope_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `relacion_rutina_escena`
--
CREATE TABLE `relacion_rutina_escena` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_rutina` int(11) NOT NULL,
  `codigo_escena` int(11) NOT NULL,
  `tiempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_rutina` (`codigo_rutina`),
  KEY `codigo_escena` (`codigo_escena`),
  CONSTRAINT `rel_rut_esc_ibfk_1` FOREIGN KEY (`codigo_rutina`) REFERENCES `rutina` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rel_rut_esc_ibfk_2` FOREIGN KEY (`codigo_escena`) REFERENCES `escenas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `home`
--
CREATE TABLE `home_estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(150) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



--
-- Table structure for table `relacion_ot_home`
--
CREATE TABLE `relacion_ot_home` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_ot` int(11) NOT NULL,
  `codigo_home` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_ot` (`codigo_ot`),
  KEY `codigo_home` (`codigo_home`),
  CONSTRAINT `rel_ot_home_ibfk_1` FOREIGN KEY (`codigo_ot`) REFERENCES `ot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rel_ot_home_ibfk_2` FOREIGN KEY (`codigo_home`) REFERENCES `home_estado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `relacion_home_operacion`
--
CREATE TABLE `relacion_home_operacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_home` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `tiempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_home` (`codigo_home`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `rel_home_ope_ibfk_1` FOREIGN KEY (`codigo_home`) REFERENCES `home_estado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rel_home_ope_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `relacion_home_escena`
--
CREATE TABLE `relacion_home_escena` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_home` int(11) NOT NULL,
  `codigo_escena` int(11) NOT NULL,
  `tiempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_home` (`codigo_home`),
  KEY `codigo_escena` (`codigo_escena`),
  CONSTRAINT `rel_home_esc_ibfk_1` FOREIGN KEY (`codigo_home`) REFERENCES `home_estado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rel_home_esc_ibfk_2` FOREIGN KEY (`codigo_escena`) REFERENCES `escenas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


use sistema_pr_montecerrado;

ALTER TABLE escenas ADD column tipo int (11) DEFAULT NULL;

ALTER TABLE ambiente ADD COLUMN codigo_planta int (11) DEFAULT NULL;
ALTER TABLE ambiente CHANGE COLUMN codigo_estancia codigo_estancia int (11) DEFAULT NULL;
ALTER TABLE ambiente ADD CONSTRAINT `ambiente_ibfk_2` FOREIGN KEY (`codigo_planta`) REFERENCES `planta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE ambiente RENAME ambiente_ibfk_2 TO codigo_planta;



ALTER TABLE rutina ADD COLUMN codigo_planta int (11) DEFAULT NULL;
ALTER TABLE rutina CHANGE COLUMN codigo_estancia codigo_estancia int (11) DEFAULT NULL;
ALTER TABLE rutina ADD CONSTRAINT `rutina_ibfk_2` FOREIGN KEY (`codigo_planta`) REFERENCES `planta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE rutina RENAME rutina_ibfk_2 TO codigo_planta;

DROP TABLE IF EXISTS `cuadro`;
CREATE TABLE `cuadro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nemo` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `automaticos`;
CREATE TABLE `automaticos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nemo` varchar(140) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `fila` int(11) DEFAULT NULL,
  `nemofila` varchar(140) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `cuadro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cuadro` (`cuadro`),
  CONSTRAINT `automaticos_ibfk_1` FOREIGN KEY (`cuadro`) REFERENCES `cuadro` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

use sistema_montecerrado;

ALTER TABLE escenas ADD column tipo int (11) DEFAULT NULL;

ALTER TABLE ambiente ADD COLUMN codigo_planta int (11) DEFAULT NULL;
ALTER TABLE ambiente CHANGE COLUMN codigo_estancia codigo_estancia int (11) DEFAULT NULL;
ALTER TABLE ambiente ADD CONSTRAINT `ambiente_ibfk_2` FOREIGN KEY (`codigo_planta`) REFERENCES `planta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE ambiente RENAME ambiente_ibfk_2 TO codigo_planta;



ALTER TABLE rutina ADD COLUMN codigo_planta int (11) DEFAULT NULL;
ALTER TABLE rutina CHANGE COLUMN codigo_estancia codigo_estancia int (11) DEFAULT NULL;
ALTER TABLE rutina ADD CONSTRAINT `rutina_ibfk_2` FOREIGN KEY (`codigo_planta`) REFERENCES `planta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE rutina RENAME rutina_ibfk_2 TO codigo_planta;

DROP TABLE IF EXISTS `cuadro`;
CREATE TABLE `cuadro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nemo` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `automaticos`;
CREATE TABLE `automaticos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nemo` varchar(140) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `fila` int(11) DEFAULT NULL,
  `nemofila` varchar(140) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `cuadro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cuadro` (`cuadro`),
  CONSTRAINT `automaticos_ibfk_1` FOREIGN KEY (`cuadro`) REFERENCES `cuadro` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



use sistema_pr_somosaguas;

ALTER TABLE escenas ADD column tipo int (11) DEFAULT NULL;

ALTER TABLE ambiente ADD COLUMN codigo_planta int (11) DEFAULT NULL;
ALTER TABLE ambiente CHANGE COLUMN codigo_estancia codigo_estancia int (11) DEFAULT NULL;
ALTER TABLE ambiente ADD CONSTRAINT `ambiente_ibfk_2` FOREIGN KEY (`codigo_planta`) REFERENCES `planta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE ambiente RENAME ambiente_ibfk_2 TO codigo_planta;



ALTER TABLE rutina ADD COLUMN codigo_planta int (11) DEFAULT NULL;
ALTER TABLE rutina CHANGE COLUMN codigo_estancia codigo_estancia int (11) DEFAULT NULL;
ALTER TABLE rutina ADD CONSTRAINT `rutina_ibfk_2` FOREIGN KEY (`codigo_planta`) REFERENCES `planta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
-- ALTER TABLE rutina RENAME rutina_ibfk_2 TO codigo_planta;

DROP TABLE IF EXISTS `cuadro`;
CREATE TABLE `cuadro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nemo` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `automaticos`;
CREATE TABLE `automaticos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nemo` varchar(140) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `fila` int(11) DEFAULT NULL,
  `nemofila` varchar(140) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `cuadro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cuadro` (`cuadro`),
  CONSTRAINT `automaticos_ibfk_1` FOREIGN KEY (`cuadro`) REFERENCES `cuadro` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
