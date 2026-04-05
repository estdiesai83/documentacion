use sistema_montecerrado;
DROP TABLE IF EXISTS `relacion_bombas`;
DROP TABLE IF EXISTS `relacion_grupo_bombas`;
DROP TABLE IF EXISTS `grupo_bombas`;
DROP TABLE IF EXISTS `bombas`;
DROP TABLE IF EXISTS `bombas_previo_rutina`;


--
-- Table structure for table `bombas`
--
CREATE TABLE `bombas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `bombas_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `bombas_previo_rutina`
--
CREATE TABLE `bombas_previo_rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `bombas_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `relacion_bombas`
--
CREATE TABLE `relacion_bombas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo_bombas` int(11) NOT NULL,
  `rb_e_estado` int(11) NOT NULL,
  `codigo_tp_e_estado` int(11) NOT NULL,
  `rb_s_estado` int(11) NOT NULL,
  `codigo_tp_s_estado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_bombas` (`codigo_bombas`),
  CONSTRAINT `relacion_bombas_ibfk_1` FOREIGN KEY (`codigo_bombas`) REFERENCES `bombas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `grupo_bombas`
--
CREATE TABLE `grupo_bombas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `relacion_grupo_bombas`
--

CREATE TABLE `relacion_grupo_bombas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_bombas` int(11) NOT NULL,
  `codigo_grupo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_bombas` (`codigo_bombas`),
  KEY `codigo_grupo` (`codigo_grupo`),
  CONSTRAINT `relacion_grupo_bombas_ibfk_1` FOREIGN KEY (`codigo_bombas`) REFERENCES `bombas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relacion_grupo_bombas_ibfk_2` FOREIGN KEY (`codigo_grupo`) REFERENCES `grupo_bombas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




DROP TABLE IF EXISTS `relacion_multimedia`;
DROP TABLE IF EXISTS `multimedia`;
DROP TABLE IF EXISTS `multimedia_previo_rutina`;


--
-- Table structure for table `multimedia`
--
CREATE TABLE `multimedia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  `tipo` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `multimedia_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `multimedia_previo_rutina`
--
CREATE TABLE `multimedia_previo_rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  `tipo` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `multimedia_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `relacion_multimedia`
--
CREATE TABLE `relacion_multimedia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo_multimedia` int(11) NOT NULL,
  `rb_s_abrir` int(11) DEFAULT -1,
  `codigo_tp_s_abrir` int(11) DEFAULT -1,
  `rb_s_cerrar` int(11) DEFAULT -1,
  `codigo_tp_s_cerrar` int(11) DEFAULT -1,
  `rb_e_abrir` int(11) DEFAULT -1,
  `codigo_tp_e_abrir` int(11) DEFAULT -1,
  `rb_e_cerrar` int(11) DEFAULT -1,
  `codigo_tp_e_cerrar` int(11) DEFAULT -1,
  PRIMARY KEY (`id`),
  KEY `codigo_multimedia` (`codigo_multimedia`),
  CONSTRAINT `relacion_multimedia_ibfk_1` FOREIGN KEY (`codigo_multimedia`) REFERENCES `multimedia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



use sistema_pr_montecerrado;
DROP TABLE IF EXISTS `relacion_bombas`;
DROP TABLE IF EXISTS `relacion_grupo_bombas`;
DROP TABLE IF EXISTS `grupo_bombas`;
DROP TABLE IF EXISTS `bombas`;
DROP TABLE IF EXISTS `bombas_previo_rutina`;


--
-- Table structure for table `bombas`
--
CREATE TABLE `bombas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `bombas_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `bombas_previo_rutina`
--
CREATE TABLE `bombas_previo_rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `bombas_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `relacion_bombas`
--
CREATE TABLE `relacion_bombas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo_bombas` int(11) NOT NULL,
  `rb_e_estado` int(11) NOT NULL,
  `codigo_tp_e_estado` int(11) NOT NULL,
  `rb_s_estado` int(11) NOT NULL,
  `codigo_tp_s_estado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_bombas` (`codigo_bombas`),
  CONSTRAINT `relacion_bombas_ibfk_1` FOREIGN KEY (`codigo_bombas`) REFERENCES `bombas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `grupo_bombas`
--
CREATE TABLE `grupo_bombas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `relacion_grupo_bombas`
--

CREATE TABLE `relacion_grupo_bombas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_bombas` int(11) NOT NULL,
  `codigo_grupo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_bombas` (`codigo_bombas`),
  KEY `codigo_grupo` (`codigo_grupo`),
  CONSTRAINT `relacion_grupo_bombas_ibfk_1` FOREIGN KEY (`codigo_bombas`) REFERENCES `bombas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relacion_grupo_bombas_ibfk_2` FOREIGN KEY (`codigo_grupo`) REFERENCES `grupo_bombas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `relacion_multimedia`;
DROP TABLE IF EXISTS `multimedia`;
DROP TABLE IF EXISTS `multimedia_previo_rutina`;


--
-- Table structure for table `multimedia`
--
CREATE TABLE `multimedia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  `tipo` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `multimedia_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `multimedia_previo_rutina`
--
CREATE TABLE `multimedia_previo_rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  `tipo` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `multimedia_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `relacion_multimedia`
--
CREATE TABLE `relacion_multimedia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo_multimedia` int(11) NOT NULL,
  `rb_s_abrir` int(11) DEFAULT -1,
  `codigo_tp_s_abrir` int(11) DEFAULT -1,
  `rb_s_cerrar` int(11) DEFAULT -1,
  `codigo_tp_s_cerrar` int(11) DEFAULT -1,
  `rb_e_abrir` int(11) DEFAULT -1,
  `codigo_tp_e_abrir` int(11) DEFAULT -1,
  `rb_e_cerrar` int(11) DEFAULT -1,
  `codigo_tp_e_cerrar` int(11) DEFAULT -1,
  PRIMARY KEY (`id`),
  KEY `codigo_multimedia` (`codigo_multimedia`),
  CONSTRAINT `relacion_multimedia_ibfk_1` FOREIGN KEY (`codigo_multimedia`) REFERENCES `multimedia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

use sistema_rudy_v2;
DROP TABLE IF EXISTS `relacion_bombas`;
DROP TABLE IF EXISTS `relacion_grupo_bombas`;
DROP TABLE IF EXISTS `grupo_bombas`;
DROP TABLE IF EXISTS `bombas`;
DROP TABLE IF EXISTS `bombas_previo_rutina`;


--
-- Table structure for table `bombas`
--
CREATE TABLE `bombas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `bombas_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `bombas_previo_rutina`
--
CREATE TABLE `bombas_previo_rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `bombas_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `relacion_bombas`
--
CREATE TABLE `relacion_bombas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo_bombas` int(11) NOT NULL,
  `rb_e_estado` int(11) NOT NULL,
  `codigo_tp_e_estado` int(11) NOT NULL,
  `rb_s_estado` int(11) NOT NULL,
  `codigo_tp_s_estado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_bombas` (`codigo_bombas`),
  CONSTRAINT `relacion_bombas_ibfk_1` FOREIGN KEY (`codigo_bombas`) REFERENCES `bombas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `grupo_bombas`
--
CREATE TABLE `grupo_bombas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `relacion_grupo_bombas`
--

CREATE TABLE `relacion_grupo_bombas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_bombas` int(11) NOT NULL,
  `codigo_grupo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_bombas` (`codigo_bombas`),
  KEY `codigo_grupo` (`codigo_grupo`),
  CONSTRAINT `relacion_grupo_bombas_ibfk_1` FOREIGN KEY (`codigo_bombas`) REFERENCES `bombas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relacion_grupo_bombas_ibfk_2` FOREIGN KEY (`codigo_grupo`) REFERENCES `grupo_bombas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `relacion_multimedia`;
DROP TABLE IF EXISTS `multimedia`;
DROP TABLE IF EXISTS `multimedia_previo_rutina`;


--
-- Table structure for table `multimedia`
--
CREATE TABLE `multimedia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  `tipo` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `multimedia_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `multimedia_previo_rutina`
--
CREATE TABLE `multimedia_previo_rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  `tipo` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `multimedia_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `relacion_multimedia`
--
CREATE TABLE `relacion_multimedia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo_multimedia` int(11) NOT NULL,
  `rb_s_abrir` int(11) DEFAULT -1,
  `codigo_tp_s_abrir` int(11) DEFAULT -1,
  `rb_s_cerrar` int(11) DEFAULT -1,
  `codigo_tp_s_cerrar` int(11) DEFAULT -1,
  `rb_e_abrir` int(11) DEFAULT -1,
  `codigo_tp_e_abrir` int(11) DEFAULT -1,
  `rb_e_cerrar` int(11) DEFAULT -1,
  `codigo_tp_e_cerrar` int(11) DEFAULT -1,
  PRIMARY KEY (`id`),
  KEY `codigo_multimedia` (`codigo_multimedia`),
  CONSTRAINT `relacion_multimedia_ibfk_1` FOREIGN KEY (`codigo_multimedia`) REFERENCES `multimedia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


use sistema_somosaguas;

DROP TABLE IF EXISTS `relacion_bombas`;
DROP TABLE IF EXISTS `relacion_grupo_bombas`;
DROP TABLE IF EXISTS `grupo_bombas`;
DROP TABLE IF EXISTS `bombas`;
DROP TABLE IF EXISTS `bombas_previo_rutina`;


--
-- Table structure for table `bombas`
--
CREATE TABLE `bombas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `bombas_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `bombas_previo_rutina`
--
CREATE TABLE `bombas_previo_rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `bombas_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `relacion_bombas`
--
CREATE TABLE `relacion_bombas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo_bombas` int(11) NOT NULL,
  `rb_e_estado` int(11) NOT NULL,
  `codigo_tp_e_estado` int(11) NOT NULL,
  `rb_s_estado` int(11) NOT NULL,
  `codigo_tp_s_estado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_bombas` (`codigo_bombas`),
  CONSTRAINT `relacion_bombas_ibfk_1` FOREIGN KEY (`codigo_bombas`) REFERENCES `bombas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `grupo_bombas`
--
CREATE TABLE `grupo_bombas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `relacion_grupo_bombas`
--

CREATE TABLE `relacion_grupo_bombas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_bombas` int(11) NOT NULL,
  `codigo_grupo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_bombas` (`codigo_bombas`),
  KEY `codigo_grupo` (`codigo_grupo`),
  CONSTRAINT `relacion_grupo_bombas_ibfk_1` FOREIGN KEY (`codigo_bombas`) REFERENCES `bombas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relacion_grupo_bombas_ibfk_2` FOREIGN KEY (`codigo_grupo`) REFERENCES `grupo_bombas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `relacion_multimedia`;
DROP TABLE IF EXISTS `multimedia`;
DROP TABLE IF EXISTS `multimedia_previo_rutina`;


--
-- Table structure for table `multimedia`
--
CREATE TABLE `multimedia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  `tipo` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `multimedia_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `multimedia_previo_rutina`
--
CREATE TABLE `multimedia_previo_rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  `tipo` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `multimedia_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `relacion_multimedia`
--
CREATE TABLE `relacion_multimedia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo_multimedia` int(11) NOT NULL,
  `rb_s_abrir` int(11) DEFAULT -1,
  `codigo_tp_s_abrir` int(11) DEFAULT -1,
  `rb_s_cerrar` int(11) DEFAULT -1,
  `codigo_tp_s_cerrar` int(11) DEFAULT -1,
  `rb_e_abrir` int(11) DEFAULT -1,
  `codigo_tp_e_abrir` int(11) DEFAULT -1,
  `rb_e_cerrar` int(11) DEFAULT -1,
  `codigo_tp_e_cerrar` int(11) DEFAULT -1,
  PRIMARY KEY (`id`),
  KEY `codigo_multimedia` (`codigo_multimedia`),
  CONSTRAINT `relacion_multimedia_ibfk_1` FOREIGN KEY (`codigo_multimedia`) REFERENCES `multimedia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


use sistema_pr_somosaguas;

DROP TABLE IF EXISTS `relacion_bombas`;
DROP TABLE IF EXISTS `relacion_grupo_bombas`;
DROP TABLE IF EXISTS `grupo_bombas`;
DROP TABLE IF EXISTS `bombas`;
DROP TABLE IF EXISTS `bombas_previo_rutina`;


--
-- Table structure for table `bombas`
--
CREATE TABLE `bombas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `bombas_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `bombas_previo_rutina`
--
CREATE TABLE `bombas_previo_rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `bombas_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `relacion_bombas`
--
CREATE TABLE `relacion_bombas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo_bombas` int(11) NOT NULL,
  `rb_e_estado` int(11) NOT NULL,
  `codigo_tp_e_estado` int(11) NOT NULL,
  `rb_s_estado` int(11) NOT NULL,
  `codigo_tp_s_estado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_bombas` (`codigo_bombas`),
  CONSTRAINT `relacion_bombas_ibfk_1` FOREIGN KEY (`codigo_bombas`) REFERENCES `bombas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `grupo_bombas`
--
CREATE TABLE `grupo_bombas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `relacion_grupo_bombas`
--

CREATE TABLE `relacion_grupo_bombas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_bombas` int(11) NOT NULL,
  `codigo_grupo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_bombas` (`codigo_bombas`),
  KEY `codigo_grupo` (`codigo_grupo`),
  CONSTRAINT `relacion_grupo_bombas_ibfk_1` FOREIGN KEY (`codigo_bombas`) REFERENCES `bombas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relacion_grupo_bombas_ibfk_2` FOREIGN KEY (`codigo_grupo`) REFERENCES `grupo_bombas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `relacion_multimedia`;
DROP TABLE IF EXISTS `multimedia`;
DROP TABLE IF EXISTS `multimedia_previo_rutina`;


--
-- Table structure for table `multimedia`
--
CREATE TABLE `multimedia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  `tipo` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `multimedia_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `multimedia_previo_rutina`
--
CREATE TABLE `multimedia_previo_rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  `tipo` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `multimedia_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `relacion_multimedia`
--
CREATE TABLE `relacion_multimedia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo_multimedia` int(11) NOT NULL,
  `rb_s_abrir` int(11) DEFAULT -1,
  `codigo_tp_s_abrir` int(11) DEFAULT -1,
  `rb_s_cerrar` int(11) DEFAULT -1,
  `codigo_tp_s_cerrar` int(11) DEFAULT -1,
  `rb_e_abrir` int(11) DEFAULT -1,
  `codigo_tp_e_abrir` int(11) DEFAULT -1,
  `rb_e_cerrar` int(11) DEFAULT -1,
  `codigo_tp_e_cerrar` int(11) DEFAULT -1,
  PRIMARY KEY (`id`),
  KEY `codigo_multimedia` (`codigo_multimedia`),
  CONSTRAINT `relacion_multimedia_ibfk_1` FOREIGN KEY (`codigo_multimedia`) REFERENCES `multimedia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
