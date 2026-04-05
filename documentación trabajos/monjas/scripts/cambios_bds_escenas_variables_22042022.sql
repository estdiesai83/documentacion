use sistema_pr_montecerrado;

DROP TABLE IF EXISTS `escena_luces`;
DROP TABLE IF EXISTS `escena_clima`;
DROP TABLE IF EXISTS `escena_estores`;
DROP TABLE IF EXISTS `escena_iot`;
DROP TABLE IF EXISTS `escena_persianas`;
DROP TABLE IF EXISTS `escena_piscina`;


DROP TABLE IF EXISTS `usuario_post`;
DROP TABLE IF EXISTS `historico_post`;
DROP TABLE IF EXISTS `notificaciones`;
DROP TABLE IF EXISTS `post`;


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
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`emisor`) REFERENCES `sistema_pruebas`.`rc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`receptor`) REFERENCES `sistema_pruebas`.`rc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`emisor`) REFERENCES `sistema_pruebas`.`rc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notificaciones_ibfk_2` FOREIGN KEY (`receptor`) REFERENCES `sistema_pruebas`.`rc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




ALTER TABLE variables ADD column tipo int(11) DEFAULT NULL;

update variables set tipo = 0 where nemo = "modoclima";
update variables set tipo = 1 where nemo LIKE "consigna%";
update variables set tipo = 1 where nemo LIKE "rango%";
update variables set tipo = 2 where nemo LIKE "salidalimitada";

update th_rasp_ds18b20 set argumentos = replace(argumentos, "}", ',"id_climate":"7"}') where modulo = 6;


--
-- Table structure for table `luces_previo_rutina`
--
CREATE TABLE `luces_previo_rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  `intensidad` int(11) DEFAULT -1,
  `rgb` varchar(15) DEFAULT -1,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `luces_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `iot_previo_rutina`
--
CREATE TABLE `iot_previo_rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `iot_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `estor_previo_rutina`
--
CREATE TABLE `estor_previo_rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `consigna` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `estor_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



--
-- Table structure for table `clima_previo_rutina`
--
CREATE TABLE `clima_previo_rutina` (
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
  CONSTRAINT `clima_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `persianas_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `relacion_escena_operacion`
--
CREATE TABLE `relacion_escena_operacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_escena` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `tiempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_escena` (`codigo_escena`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `rel_esc_ope_ibfk_1` FOREIGN KEY (`codigo_escena`) REFERENCES `escenas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rel_esc_ope_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

use sistema_montecerrado;

DROP TABLE IF EXISTS `escena_luces`;
DROP TABLE IF EXISTS `escena_clima`;
DROP TABLE IF EXISTS `escena_estores`;
DROP TABLE IF EXISTS `escena_iot`;
DROP TABLE IF EXISTS `escena_persianas`;
DROP TABLE IF EXISTS `escena_piscina`;

DROP TABLE IF EXISTS `usuario_post`;
DROP TABLE IF EXISTS `historico_post`;
DROP TABLE IF EXISTS `notificaciones`;
DROP TABLE IF EXISTS `post`;

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
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`emisor`) REFERENCES `sistema_pruebas`.`rc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`receptor`) REFERENCES `sistema_pruebas`.`rc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`emisor`) REFERENCES `sistema_pruebas`.`rc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notificaciones_ibfk_2` FOREIGN KEY (`receptor`) REFERENCES `sistema_pruebas`.`rc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


ALTER TABLE variables ADD column tipo int(11) DEFAULT NULL;

update variables set tipo = 0 where nemo = "modoclima";
update variables set tipo = 1 where nemo LIKE "consigna%";
update variables set tipo = 1 where nemo LIKE "rango%";
update variables set tipo = 2 where nemo LIKE "salidalimitada";

update th_rasp_ds18b20 set argumentos = replace(argumentos, "}", ',"id_climate":"7"}') where modulo = 6;


--
-- Table structure for table `luces_previo_rutina`
--
CREATE TABLE `luces_previo_rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  `intensidad` int(11) DEFAULT -1,
  `rgb` varchar(15) DEFAULT -1,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `luces_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `iot_previo_rutina`
--
CREATE TABLE `iot_previo_rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `iot_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `estor_previo_rutina`
--
CREATE TABLE `estor_previo_rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `consigna` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `estor_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



--
-- Table structure for table `clima_previo_rutina`
--
CREATE TABLE `clima_previo_rutina` (
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
  CONSTRAINT `clima_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `persianas_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `relacion_escena_operacion`
--
CREATE TABLE `relacion_escena_operacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_escena` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `tiempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_escena` (`codigo_escena`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `rel_esc_ope_ibfk_1` FOREIGN KEY (`codigo_escena`) REFERENCES `escenas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rel_esc_ope_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


use sistema_rudy_v2;

DROP TABLE IF EXISTS `escena_luces`;
DROP TABLE IF EXISTS `escena_clima`;
DROP TABLE IF EXISTS `escena_estores`;
DROP TABLE IF EXISTS `escena_iot`;
DROP TABLE IF EXISTS `escena_persianas`;
DROP TABLE IF EXISTS `escena_piscina`;

DROP TABLE IF EXISTS `usuario_post`;
DROP TABLE IF EXISTS `historico_post`;
DROP TABLE IF EXISTS `notificaciones`;
DROP TABLE IF EXISTS `post`;


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
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`emisor`) REFERENCES `sistema_pruebas`.`rc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`receptor`) REFERENCES `sistema_pruebas`.`rc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`emisor`) REFERENCES `sistema_pruebas`.`rc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notificaciones_ibfk_2` FOREIGN KEY (`receptor`) REFERENCES `sistema_pruebas`.`rc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE variables ADD column tipo int(11) DEFAULT NULL;

update variables set tipo = 0 where nemo = "modo clima";
update variables set tipo = 1 where nemo LIKE "consigna%";
update variables set tipo = 1 where nemo LIKE "rango%";
update variables set tipo = 2 where nemo LIKE "salidalimitada";


--
-- Table structure for table `luces_previo_rutina`
--
CREATE TABLE `luces_previo_rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  `intensidad` int(11) DEFAULT -1,
  `rgb` varchar(15) DEFAULT -1,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `luces_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `iot_previo_rutina`
--
CREATE TABLE `iot_previo_rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `iot_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `estor_previo_rutina`
--
CREATE TABLE `estor_previo_rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `consigna` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `estor_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `clima_previo_rutina`
--
CREATE TABLE `clima_previo_rutina` (
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
  CONSTRAINT `clima_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `persianas_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `relacion_escena_operacion`
--
CREATE TABLE `relacion_escena_operacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_escena` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `tiempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_escena` (`codigo_escena`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `rel_esc_ope_ibfk_1` FOREIGN KEY (`codigo_escena`) REFERENCES `escenas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rel_esc_ope_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


use sistema_pr_somosaguas;

DROP TABLE IF EXISTS `escena_luces`;
DROP TABLE IF EXISTS `escena_clima`;
DROP TABLE IF EXISTS `escena_estores`;
DROP TABLE IF EXISTS `escena_iot`;
DROP TABLE IF EXISTS `escena_persianas`;
DROP TABLE IF EXISTS `escena_piscina`;

DROP TABLE IF EXISTS `usuario_post`;
DROP TABLE IF EXISTS `historico_post`;
DROP TABLE IF EXISTS `notificaciones`;
DROP TABLE IF EXISTS `post`;


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
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`emisor`) REFERENCES `sistema_pruebas`.`rc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`receptor`) REFERENCES `sistema_pruebas`.`rc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`emisor`) REFERENCES `sistema_pruebas`.`rc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notificaciones_ibfk_2` FOREIGN KEY (`receptor`) REFERENCES `sistema_pruebas`.`rc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


ALTER TABLE variables ADD column tipo int(11) DEFAULT NULL;

update variables set tipo = 0 where nemo = "modo clima";
update variables set tipo = 1 where nemo LIKE "consigna%";
update variables set tipo = 1 where nemo LIKE "rango%";
update variables set tipo = 2 where nemo LIKE "salidalimitada";


--
-- Table structure for table `luces_previo_rutina`
--
CREATE TABLE `luces_previo_rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  `intensidad` int(11) DEFAULT -1,
  `rgb` varchar(15) DEFAULT -1,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `luces_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `iot_previo_rutina`
--
CREATE TABLE `iot_previo_rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `iot_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `estor_previo_rutina`
--
CREATE TABLE `estor_previo_rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `consigna` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `estor_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



--
-- Table structure for table `clima_previo_rutina`
--
CREATE TABLE `clima_previo_rutina` (
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
  CONSTRAINT `clima_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `persianas_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `relacion_escena_operacion`
--
CREATE TABLE `relacion_escena_operacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_escena` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `tiempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_escena` (`codigo_escena`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `rel_esc_ope_ibfk_1` FOREIGN KEY (`codigo_escena`) REFERENCES `escenas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rel_esc_ope_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


use sistema_somosaguas;

DROP TABLE IF EXISTS `escena_luces`;
DROP TABLE IF EXISTS `escena_clima`;
DROP TABLE IF EXISTS `escena_estores`;
DROP TABLE IF EXISTS `escena_iot`;
DROP TABLE IF EXISTS `escena_persianas`;
DROP TABLE IF EXISTS `escena_piscina`;

DROP TABLE IF EXISTS `usuario_post`;
DROP TABLE IF EXISTS `historico_post`;
DROP TABLE IF EXISTS `notificaciones`;
DROP TABLE IF EXISTS `post`;


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
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`emisor`) REFERENCES `sistema_pruebas`.`rc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`receptor`) REFERENCES `sistema_pruebas`.`rc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`emisor`) REFERENCES `sistema_pruebas`.`rc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notificaciones_ibfk_2` FOREIGN KEY (`receptor`) REFERENCES `sistema_pruebas`.`rc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


ALTER TABLE variables ADD column tipo int(11) DEFAULT NULL;

update variables set tipo = 0 where nemo = "modo clima";
update variables set tipo = 1 where nemo LIKE "consigna%";
update variables set tipo = 1 where nemo LIKE "rango%";
update variables set tipo = 2 where nemo LIKE "salidalimitada";


--
-- Table structure for table `luces_previo_rutina`
--
CREATE TABLE `luces_previo_rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  `intensidad` int(11) DEFAULT -1,
  `rgb` varchar(15) DEFAULT -1,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `luces_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `iot_previo_rutina`
--
CREATE TABLE `iot_previo_rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `iot_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `estor_previo_rutina`
--
CREATE TABLE `estor_previo_rutina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_estancia` int(11) NOT NULL,
  `consigna` int(11) NOT NULL,
  `estado` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `estor_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



--
-- Table structure for table `clima_previo_rutina`
--
CREATE TABLE `clima_previo_rutina` (
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
  CONSTRAINT `clima_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
  PRIMARY KEY (`id`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `persianas_prev_ibfk_1` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `relacion_escena_operacion`
--
CREATE TABLE `relacion_escena_operacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_escena` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `tiempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_escena` (`codigo_escena`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `rel_esc_ope_ibfk_1` FOREIGN KEY (`codigo_escena`) REFERENCES `escenas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rel_esc_ope_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
