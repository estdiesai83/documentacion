-- huevon
DROP TABLE IF EXISTS `comando`;
CREATE TABLE `comando` (
  `id` int(11) NOT NULL auto_increment,
  `fecha` timestamp DEFAULT CURRENT_TIMESTAMP,
  `tipodriver` varchar(30),
  `f1` varchar(30),
  `f2` varchar(30),
  `f3` varchar(30),
  `nemo` varchar(100),
  `ip` varchar(15),
  `puerto` varchar(20),
  `eco` int(11),
  `velocidad` int(11),
  `numcomando` int(11),
  `puertoserie` varchar(20),
   PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `rb`;
CREATE TABLE `rb` (
  `id` int(11) NOT NULL auto_increment,
  `fecha` timestamp DEFAULT CURRENT_TIMESTAMP,
  `codigo_comando` int(11),
  `tipotrb` int(11),
  `numerobornas` int(11),
  `numconversor` int(11),
  `numcomando` int(11),
  `mutex` int(11),
   PRIMARY KEY  (`id`),
   KEY `codigo_comando` (`codigo_comando`),
  CONSTRAINT `rb_ibfk_1` FOREIGN KEY (`codigo_comando`) REFERENCES `comando` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `relacion_rb`;
CREATE TABLE `relacion_rb` (
  `id` int(11) NOT NULL auto_increment,
  `fecha` timestamp DEFAULT CURRENT_TIMESTAMP,
  `codigo_rb` int(11),
  `subdriver` varchar(30),
  `numrb` int(11),
  `estado` varchar(20),
  `tiempo` int(11),
  `idborna` varchar(30) DEFAULT NULL,
  `relaciontpdesdehasta` varchar(20),
  `puertoescucha` int(11),
--   `tipotrb` varchar(100),
--   `tiporb` varchar(100),
--   `tiporegistrorb` varchar(100),
--   `limitesrb` varchar(20),
--   `calibracionrb` varchar(20),
--   `valordesderb` varchar(20),
--   `valorhastarb` varchar(20),
   PRIMARY KEY  (`id`),
   KEY `codigo_rb` (`codigo_rb`),
  CONSTRAINT `relacion_rb_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `tpse`;
CREATE TABLE `tpse` (
  `id` int(11) NOT NULL auto_increment,
  `fecha` timestamp DEFAULT CURRENT_TIMESTAMP,
  `codigo_rb` int(11),
  `codigo_relacion_rb` int(11),
  `numeroborna` int(11),
  `tipoborna` varchar(50),
  `nemoborna` varchar(100),
  `registro` varchar(20),
  `tiporegistro` varchar(20),
  `f1` varchar(30),
  `f2` varchar(30),
  `f3` varchar(30),
  `nemo` varchar(100),
   PRIMARY KEY  (`id`),
   KEY `codigo_rb` (`codigo_rb`),
   KEY `codigo_relacion_rb` (`codigo_relacion_rb`),
  CONSTRAINT `tpse_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tpse_ibfk_2` FOREIGN KEY (`codigo_relacion_rb`) REFERENCES `relacion_rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `tpss`;
CREATE TABLE `tpss` (
  `id` int(11) NOT NULL auto_increment,
  `fecha` timestamp DEFAULT CURRENT_TIMESTAMP,
  `codigo_rb` int(11),
  `codigo_relacion_rb` int(11),
  `subdriver` text,
  `numeroborna` int(11),
  `tipoborna` varchar(50),
  `nemoborna` varchar(100),
  `registro` varchar(20),
  `tiporegistro` varchar(20),
  `f1` varchar(30),
  `f2` varchar(30),
  `f3` varchar(30),
  `nemo` varchar(100),
  `seudoborna` varchar(20),
  `tiposalida` int(11),
  `codigo_variables` int(11),
--   `valortemporizadatpss` varchar(20),
   PRIMARY KEY  (`id`),
   KEY `codigo_rb` (`codigo_rb`),
   KEY `codigo_relacion_rb` (`codigo_relacion_rb`),
  CONSTRAINT `tpss_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tpss_ibfk_2` FOREIGN KEY (`codigo_relacion_rb`) REFERENCES `relacion_rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- sistema
DROP TABLE IF EXISTS `configuracionsoa`;
CREATE TABLE `configuracionsoa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `host` varchar(150),
  `usuario` varchar(150),
  `clave` varchar(150),
  `canal` varchar(150),
  `ippc` varchar(150),
  `bd` varchar(150),
  `rutasoa` varchar(150),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- ps
DROP TABLE IF EXISTS `variables`;
CREATE TABLE `variables` (
  `id` int(11) NOT NULL auto_increment,
  `fecha` timestamp DEFAULT CURRENT_TIMESTAMP,
  `nemo` varchar(50),
  `valor` varchar(20),
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `iniciarhilostrb`;
CREATE TABLE `iniciarhilostrb` (
  `id` int(11) NOT NULL auto_increment,
  `trb` int,
  `argumentos` JSON DEFAULT NULL,
  `codigo_rb` int,
  `bornas` varchar(250),
  `inhibir` int,
  `tipo` int,
  `subtipo` int,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `funcionalidadestp`;

CREATE TABLE IF NOT EXISTS `funcionalidadestp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `` int(11) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `bd` varchar(100) DEFAULT NULL,
  `tabla` varchar(100) DEFAULT NULL,
  `borna` int(11) DEFAULT NULL,
  `funcionalidad` varchar(100) DEFAULT NULL,
  `argumentos` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- karnaverde
DROP TABLE IF EXISTS `enviossms`;
CREATE TABLE `enviossms` (
  `id` int(11) NOT NULL auto_increment,
  `fecha` timestamp DEFAULT CURRENT_TIMESTAMP,
  `telefono` varchar(20),
  `texto` varchar(250),
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `envioscorreo`;
CREATE TABLE `envioscorreo` (
  `id` int(11) NOT NULL auto_increment,
  `fecha` timestamp DEFAULT CURRENT_TIMESTAMP,
  `correo` varchar(50),
  `asunto` varchar(250),
  `texto` text,
  `adjunto` varchar(250),
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `escenas`;
DROP TABLE IF EXISTS `estancia`;
DROP TABLE IF EXISTS `planta`;

--
-- Table structure for table `planta`
--
CREATE TABLE `planta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_ubicacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `estancia`
--
CREATE TABLE `estancia` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
   `nemo` varchar(140) DEFAULT NULL,
   `codigo_planta` int(11) NOT NULL,
   `modelo` int(11) DEFAULT NULL,
   `imagen` varchar(255) DEFAULT NULL,
   `escenas` int(11) DEFAULT 0,
   `ambientes` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_planta` (`codigo_planta`),
  CONSTRAINT `estancia_ibfk_1` FOREIGN KEY (`codigo_planta`) REFERENCES `planta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `escenas`
--

CREATE TABLE `escenas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `tipodomo` int(11) DEFAULT NULL,
--   `visible` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `escenas_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

