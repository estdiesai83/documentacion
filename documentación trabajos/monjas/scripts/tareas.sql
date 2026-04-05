DROP TABLE IF EXISTS `historico_tarea`;
DROP TABLE IF EXISTS `tarea_email`;
DROP TABLE IF EXISTS `tarea_sms`;
DROP TABLE IF EXISTS `tarea_notificacion`;
DROP TABLE IF EXISTS `tarea_sql`;
DROP TABLE IF EXISTS `tarea_bd`;
DROP TABLE IF EXISTS `tarea_rpc`;
DROP TABLE IF EXISTS `tarea_rutina`;
DROP TABLE IF EXISTS `tarea`;

CREATE TABLE `tarea` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modo` int(11) DEFAULT NULL,
  `scheduled` varchar(70) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `codigodomo` int(11) DEFAULT NULL,
  `tipotarea` int(11) DEFAULT NULL,
  `submodo` int(11) DEFAULT NULL,
  `comentario` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tarea_rpc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `argumentos` varchar(255) DEFAULT NULL,
  `codigo_tarea` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_tarea` (`codigo_tarea`),
  CONSTRAINT `tarearpc_ibfk_1` FOREIGN KEY (`codigo_tarea`) REFERENCES `tarea` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tarea_bd` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `codigo_tarea` int(11) DEFAULT NULL,
   `tipo` int(11) DEFAULT NULL,
   `bd` varchar(70) DEFAULT NULL,
   `tabla` varchar(70) DEFAULT NULL,
   `tdatos` varchar(255) DEFAULT NULL,
   `valores` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_tarea` (`codigo_tarea`),
  CONSTRAINT `tareabd_ibfk_1` FOREIGN KEY (`codigo_tarea`) REFERENCES `tarea` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tarea_sql` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `codigo_tarea` int(11) DEFAULT NULL,
   `tipo` int(11) DEFAULT NULL,
   `sql` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_tarea` (`codigo_tarea`),
  CONSTRAINT `tareasql_ibfk_1` FOREIGN KEY (`codigo_tarea`) REFERENCES `tarea` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tarea_notificacion` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `codigo_tarea` int(11) DEFAULT NULL,
   `titulo` varchar(70) DEFAULT NULL,
   `texto` varchar(70) DEFAULT NULL,
   `destinos` varchar(255) DEFAULT NULL,
   `argumentos` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_tarea` (`codigo_tarea`),
  CONSTRAINT `tareanot_ibfk_1` FOREIGN KEY (`codigo_tarea`) REFERENCES `tarea` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tarea_sms` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `codigo_tarea` int(11) DEFAULT NULL,
   `texto` int(11) DEFAULT NULL,
   `destinos` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_tarea` (`codigo_tarea`),
  CONSTRAINT `tareasms_ibfk_1` FOREIGN KEY (`codigo_tarea`) REFERENCES `tarea` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tarea_email` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
   `codigo_tarea` int(11) DEFAULT NULL,
   `asunto` varchar(70) DEFAULT NULL,
   `texto` varchar(70) DEFAULT NULL,
   `destinos` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_tarea` (`codigo_tarea`),
  CONSTRAINT `tareaemail_ibfk_1` FOREIGN KEY (`codigo_tarea`) REFERENCES `tarea` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


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

CREATE TABLE `historico_tarea` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `codigo_tarea` int(11) DEFAULT NULL,
  `comentario` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_tarea` (`codigo_tarea`),
  CONSTRAINT `histtarea_ibfk_1` FOREIGN KEY (`codigo_tarea`) REFERENCES `tarea` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
