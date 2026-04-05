use sistema_rudy_v2;
DROP TABLE IF EXISTS `relacion_estores`;
DROP TABLE IF EXISTS `estor`;
DROP TABLE IF EXISTS `estor_previo_rutina`;

--
-- Table structure for table `estor`
--
CREATE TABLE `estor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `nivel` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `estor_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `estor_previo_rutina`
--
CREATE TABLE `estor_previo_rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `nivel` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `estor_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `relacion_estor`
--
CREATE TABLE `relacion_estor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo_estor` int(11) NOT NULL,
  `rb` int(11) NOT NULL,
  `codigo_tp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_estor` (`codigo_estor`),
  CONSTRAINT `relacion_estor_ibfk_1` FOREIGN KEY (`codigo_estor`) REFERENCES `estor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `relacion_persianas`;
DROP TABLE IF EXISTS `persianas`;
DROP TABLE IF EXISTS `persianas_previo_rutina`;

--
-- Table structure for table `persianas`
--
CREATE TABLE `persianas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  `nivel` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `persianas_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `persianas_previo_rutina`
--
CREATE TABLE `persianas_previo_rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  `nivel` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `persianas_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `relacion_persianas`
--
CREATE TABLE `relacion_persianas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo_persianas` int(11) NOT NULL,
  `rb` int(11) NOT NULL,
  `codigo_tp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_persianas` (`codigo_persianas`),
  CONSTRAINT `relacion_persianas_ibfk_1` FOREIGN KEY (`codigo_persianas`) REFERENCES `persianas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



--
-- Table structure for table `operacion_persianas`
--
CREATE TABLE `operacion_persianas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_persianas` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `nivel` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_persianas` (`codigo_persianas`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `ope_persianas_ibfk_1` FOREIGN KEY (`codigo_persianas`) REFERENCES `persianas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ope_persianas_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `operacion_iot`
--
CREATE TABLE `operacion_iot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_iot` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_iot` (`codigo_iot`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `ope_iot_ibfk_1` FOREIGN KEY (`codigo_iot`) REFERENCES `iot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ope_iot_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


ALTER TABLE operacion_estores change column consigna estado int default null;
