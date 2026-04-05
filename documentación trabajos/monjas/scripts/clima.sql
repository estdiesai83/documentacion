DROP TABLE IF EXISTS `relacion_clima`;
DROP TABLE IF EXISTS `escena_clima`;
DROP TABLE IF EXISTS `clima`;

--
-- Table structure for table `clima`
--
CREATE TABLE `clima` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  `temperatura` float DEFAULT NULL,
  `consigna` float DEFAULT NULL,
  `humedad` float DEFAULT NULL,
  `co2` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `clima_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `escena_clima`
--

CREATE TABLE `escena_clima` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_escena` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_escena` (`codigo_escena`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `escena_clima_ibfk_1` FOREIGN KEY (`codigo_escena`) REFERENCES `escenas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `escena_clima_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `relacion_clima`
--
CREATE TABLE `relacion_clima` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo_clima` int(11) NOT NULL,
  `codigo_variables` int(11) NOT NULL,
  `rb_temp` int(11) NOT NULL,
  `codigo_tp_temp` int(11) NOT NULL,
  `rb_humedad` int(11) DEFAULT -1,
  `codigo_tp_humedad` int(11) DEFAULT -1,
  `rb_co2` int(11) DEFAULT -1,
  `codigo_tp_co2` int(11) DEFAULT -1,
  `rb_estado` int(11) DEFAULT -1,
  `codigo_tp_estado` int(11) DEFAULT -1,
  PRIMARY KEY (`id`),
  KEY `codigo_clima` (`codigo_clima`),
  CONSTRAINT `relacion_clima_ibfk_1` FOREIGN KEY (`codigo_clima`) REFERENCES `clima` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
