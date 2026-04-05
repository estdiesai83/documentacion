DROP TABLE IF EXISTS `operacion_luces`;
DROP TABLE IF EXISTS `operacion_clima`;
DROP TABLE IF EXISTS `operacion_estores`;
DROP TABLE IF EXISTS `operacion_iot`;

DROP TABLE IF EXISTS `escena_luces`;
DROP TABLE IF EXISTS `escena_clima`;
DROP TABLE IF EXISTS `escena_estores`;
DROP TABLE IF EXISTS `escena_iot`;

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

DROP TABLE IF EXISTS `operacion`;

DROP TABLE IF EXISTS `ot`;


--
-- Table structure for table `operacion`
--
CREATE TABLE `operacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipodomo` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `operacion_luces`
--
CREATE TABLE `operacion_luces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_luces` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `intensidad` int(11) DEFAULT -1,
  `rgb` varchar(15) DEFAULT -1,
  PRIMARY KEY (`id`),
  KEY `codigo_luces` (`codigo_luces`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `ope_luces_ibfk_1` FOREIGN KEY (`codigo_luces`) REFERENCES `luces` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ope_luces_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `operacion_clima`
--
CREATE TABLE `operacion_clima` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_clima` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `consigna` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_clima` (`codigo_clima`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `ope_clima_ibfk_1` FOREIGN KEY (`codigo_clima`) REFERENCES `clima` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ope_clima_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `operacion_estores`
--
CREATE TABLE `operacion_estores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_estor` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `nivel` int(11) NOT NULL,
  `consigna` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_estor` (`codigo_estor`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `ope_estores_ibfk_1` FOREIGN KEY (`codigo_estor`) REFERENCES `estor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ope_estores_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `operacion_iot`
--
CREATE TABLE `operacion_iot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_iot` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `nivel` int(11) NOT NULL,
  `consigna` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_iot` (`codigo_iot`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `ope_iot_ibfk_1` FOREIGN KEY (`codigo_iot`) REFERENCES `iot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ope_iot_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `escena_luces`
--
CREATE TABLE `escena_luces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_escena` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_escena` (`codigo_escena`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `escena_luces_ibfk_1` FOREIGN KEY (`codigo_escena`) REFERENCES `escenas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `escena_luces_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `escena_clima`
--
CREATE TABLE `escena_clima` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_escena` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_escena` (`codigo_escena`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `escena_clima_ibfk_1` FOREIGN KEY (`codigo_escena`) REFERENCES `escenas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `escena_clima_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `escena_estores`
--
CREATE TABLE `escena_estores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_escena` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_escena` (`codigo_escena`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `escena_estores_ibfk_1` FOREIGN KEY (`codigo_escena`) REFERENCES `escenas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `escena_estores_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `escena_iot`
--
CREATE TABLE `escena_iot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_escena` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_escena` (`codigo_escena`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `escena_iot_ibfk_1` FOREIGN KEY (`codigo_escena`) REFERENCES `escenas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `escena_iot_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `ot`
--
CREATE TABLE `ot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `ambiente_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
  `codigo_estancia` int(11) NOT NULL,
  `notificacion` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
   KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `rutina_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
