DROP TABLE IF EXISTS `relacion_iot`;
DROP TABLE IF EXISTS `escena_iot`;
DROP TABLE IF EXISTS `iot`;


--
-- Table structure for table `iot`
--
CREATE TABLE `iot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `iot_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
-- Table structure for table `relacion_iot`
--
CREATE TABLE `relacion_iot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo_iot` int(11) NOT NULL,
  `rb_e_estado` int(11) NOT NULL,
  `codigo_tp_e_estado` int(11) NOT NULL,
  `rb_s_estado` int(11) NOT NULL,
  `codigo_tp_s_estado` int(11) NOT NULL
  PRIMARY KEY (`id`),
  KEY `codigo_iot` (`codigo_iot`),
  CONSTRAINT `relacion_iot_ibfk_1` FOREIGN KEY (`codigo_iot`) REFERENCES `iot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
