DROP TABLE IF EXISTS `relacion_luces`;
DROP TABLE IF EXISTS `escena_luces`;
DROP TABLE IF EXISTS `luces`;


--
-- Table structure for table `luces`
--
CREATE TABLE `luces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `intensidad` int(11) DEFAULT -1,
  `rgb` varchar(15) DEFAULT -1,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `luces_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `grupo_luces`
--
CREATE TABLE `grupo_luces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `relacion_grupo_luces`
--

CREATE TABLE `relacion_grupo_luces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_luces` int(11) NOT NULL,
  `codigo_grupo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_luces` (`codigo_luces`),
  KEY `codigo_grupo` (`codigo_grupo`),
  CONSTRAINT `relacion_grupo_luces_ibfk_1` FOREIGN KEY (`codigo_luces`) REFERENCES `luces` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relacion_grupo_luces_ibfk_2` FOREIGN KEY (`codigo_grupo`) REFERENCES `grupo_luces` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
-- Table structure for table `relacion_luces`
--
CREATE TABLE `relacion_luces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo_luces` int(11) NOT NULL,
  `rb_e_estado` int(11) NOT NULL,
  `codigo_tp_e_estado` int(11) NOT NULL,
  `rb_s_estado` int(11) NOT NULL,
  `codigo_tp_s_estado` int(11) NOT NULL,
  `rb_dali1` int(11) DEFAULT -1,
  `codigo_tp_int1` int(11) DEFAULT -1,
  `codigo_tp_rgb1` int(11) DEFAULT -1,
  `rb_dali2` int(11) DEFAULT -1,
  `codigo_tp_int2` int(11) DEFAULT -1,
  `codigo_tp_rgb2` int(11) DEFAULT -1,
  `rb_dali3` int(11) DEFAULT -1,
  `codigo_tp_int3` int(11) DEFAULT -1,
  `codigo_tp_rgb3` int(11) DEFAULT -1,
  PRIMARY KEY (`id`),
  KEY `codigo_luces` (`codigo_luces`),
  CONSTRAINT `relacion_luces_ibfk_1` FOREIGN KEY (`codigo_luces`) REFERENCES `luces` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
