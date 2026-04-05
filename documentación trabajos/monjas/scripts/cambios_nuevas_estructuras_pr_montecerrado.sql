SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `operacion_luces`;
DROP TABLE IF EXISTS `operacion_clima`;
DROP TABLE IF EXISTS `operacion_iot`;
DROP TABLE IF EXISTS `operacion_estores`;
DROP TABLE IF EXISTS `escenas_ambiente`;
DROP TABLE IF EXISTS `escenas_luces`;
DROP TABLE IF EXISTS `escenas_iot`;
DROP TABLE IF EXISTS `escenas_clima`;
DROP TABLE IF EXISTS `escenas_estores`;
DROP TABLE IF EXISTS `escenas_estor`;

DROP TABLE IF EXISTS `relacion_ot_ambiente`;
DROP TABLE IF EXISTS `relacion_ot_rutina`;
DROP TABLE IF EXISTS `relacion_ot_home`;

DROP TABLE IF EXISTS `relacion_ambiente_operacion`;
DROP TABLE IF EXISTS `relacion_rutina_operacion`;
DROP TABLE IF EXISTS `relacion_home_operacion`;

DROP TABLE IF EXISTS `relacion_ambiente_escena`;
DROP TABLE IF EXISTS `relacion_rutina_escena`;
DROP TABLE IF EXISTS `relacion_home_escena`;

DROP TABLE IF EXISTS `operacion`;
DROP TABLE IF EXISTS `rutina`;
DROP TABLE IF EXISTS `home_estado`;

DROP TABLE IF EXISTS `clima`;

RENAME TABLE `ambiente` TO `clima`;
RENAME TABLE `relacionrb` TO `relacion_rb`;
RENAME TABLE `relacionambiente` TO `relacion_clima`;
RENAME TABLE `relacionluces` TO `relacion_luces`;
RENAME TABLE `relaciongrupoluces` TO `relacion_grupo_luces`;
RENAME TABLE `relacionestor` TO `relacion_estor`;
RENAME TABLE `relacionmodoescena` TO `relacion_modo_escena`;
RENAME TABLE `grupoluces` TO `grupo_luces`;
RENAME TABLE `historicopost` TO `historico_post`;


ALTER TABLE `tarea_bd` CHANGE COLUMN `codigotarea` `codigo_tarea` int(11) DEFAULT NULL;
ALTER TABLE `tarea_email` CHANGE COLUMN `codigotarea` `codigo_tarea` int(11) DEFAULT NULL;
ALTER TABLE `tarea_notificacion` CHANGE COLUMN `codigotarea` `codigo_tarea` int(11) DEFAULT NULL;
ALTER TABLE `tarea_rpc` CHANGE COLUMN `codigotarea` `codigo_tarea` int(11) DEFAULT NULL;
ALTER TABLE `tarea_sms` CHANGE COLUMN `codigotarea` `codigo_tarea` int(11) DEFAULT NULL;
ALTER TABLE `tarea_sql` CHANGE COLUMN `codigotarea` `codigo_tarea` int(11) DEFAULT NULL;

ALTER TABLE `historico_post` CHANGE COLUMN `codigopost` `codigo_post` int(11) DEFAULT NULL;
ALTER TABLE `post` CHANGE COLUMN `codigopost` `codigo_post` int(11) DEFAULT NULL;

ALTER TABLE `planta` CHANGE COLUMN `codigoubicacion` `codigo_ubicacion` int(11) DEFAULT NULL;

ALTER TABLE `galeria` CHANGE COLUMN `codigoadjunto` `codigo_adjunto` int(11) DEFAULT NULL;

ALTER TABLE `relacion_rb` CHANGE COLUMN `codigorb` `codigo_rb` int(11) DEFAULT NULL;

ALTER TABLE `rb` CHANGE COLUMN `codigocomando` `codigo_comando` int(11) DEFAULT NULL;

ALTER TABLE `iniciarhilostrb` CHANGE COLUMN `codigorb` `codigo_rb` int(11) DEFAULT NULL;

ALTER TABLE `tpse` CHANGE COLUMN `codigorb` `codigo_rb` int(11) DEFAULT NULL;
ALTER TABLE `tpse` CHANGE COLUMN `codigorelacionrb` `codigo_relacion_rb` int(11) DEFAULT NULL;

ALTER TABLE `tpss` CHANGE COLUMN `codigorb` `codigo_rb` int(11) DEFAULT NULL;
ALTER TABLE `tpss` CHANGE COLUMN `codigorelacionrb` `codigo_relacion_rb` int(11) DEFAULT NULL;
ALTER TABLE `tpss` CHANGE COLUMN `codigovariables` `codigo_variables` int(11) DEFAULT NULL;

ALTER TABLE `relacion_clima` CHANGE COLUMN `codigoambiente` `codigo_clima` int(11) DEFAULT NULL;
ALTER TABLE `relacion_clima` CHANGE COLUMN `codigovariables` `codigo_variables` int(11) DEFAULT NULL;
ALTER TABLE `relacion_clima` CHANGE COLUMN `codigotp_temp` `codigo_tp_temp` int(11) DEFAULT NULL;
ALTER TABLE `relacion_clima` CHANGE COLUMN `codigotp_humedad` `codigo_tp_humedad` int(11) DEFAULT -1;
ALTER TABLE `relacion_clima` CHANGE COLUMN `codigotp_co2` `codigo_tp_co2` int(11) DEFAULT -1;
ALTER TABLE `relacion_clima` CHANGE COLUMN `codigotp_estado` `codigo_tp_estado` int(11) DEFAULT -1;

ALTER TABLE `relacion_luces` CHANGE COLUMN `codigoluces` `codigo_luces` int(11) DEFAULT NULL;
ALTER TABLE `relacion_luces` CHANGE COLUMN `codigotp_e_estado` `codigo_tp_e_estado` int(11) DEFAULT NULL;
ALTER TABLE `relacion_luces` CHANGE COLUMN `codigotp_s_estado` `codigo_tp_s_estado` int(11) DEFAULT NULL;
ALTER TABLE `relacion_luces` CHANGE COLUMN `codigotp_int1` `codigo_tp_int1` int(11) DEFAULT -1;
ALTER TABLE `relacion_luces` CHANGE COLUMN `codigotp_rgb1` `codigo_tp_rgb1` int(11) DEFAULT -1;
ALTER TABLE `relacion_luces` CHANGE COLUMN `codigotp_int2` `codigo_tp_int2` int(11) DEFAULT -1;
ALTER TABLE `relacion_luces` CHANGE COLUMN `codigotp_rgb2` `codigo_tp_rgb2` int(11) DEFAULT -1;
ALTER TABLE `relacion_luces` CHANGE COLUMN `codigotp_int3` `codigo_tp_int3` int(11) DEFAULT -1;
ALTER TABLE `relacion_luces` CHANGE COLUMN `codigotp_rgb3` `codigo_tp_rgb3` int(11) DEFAULT -1;


ALTER TABLE `relacion_estor` CHANGE COLUMN `codigoestor` `codigo_estor` int(11) DEFAULT NULL;
ALTER TABLE `relacion_estor` CHANGE COLUMN `codigotp` `codigo_tp` int(11) DEFAULT NULL;

ALTER TABLE `relacion_grupo_luces` CHANGE COLUMN `codigoluces` `codigo_luces` int(11) DEFAULT NULL;
ALTER TABLE `relacion_grupo_luces` CHANGE COLUMN `codigogrupo` `codigo_grupo` int(11) DEFAULT NULL;

ALTER TABLE `relacion_iot` CHANGE COLUMN `codigotp_e_estado` `codigo_tp_e_estado` int(11) DEFAULT NULL;
ALTER TABLE `relacion_iot` CHANGE COLUMN `codigotp_s_estado` `codigo_tp_s_estado` int(11) DEFAULT NULL;

ALTER TABLE `relacion_modo_escena` CHANGE COLUMN `codigoescenas` `codigo_escena` int(11) DEFAULT NULL;
ALTER TABLE `relacion_modo_escena` CHANGE COLUMN `codigomodo` `codigo_modo` int(11) DEFAULT NULL;

ALTER TABLE `escenas` CHANGE COLUMN `codigoestancia` `codigo_estancia` int(11) DEFAULT NULL;

ALTER TABLE `estancia` CHANGE COLUMN `codigoplanta` `codigo_planta` int(11) DEFAULT NULL;

ALTER TABLE `clima` CHANGE COLUMN `codigoestancia` `codigo_estancia` int(11) DEFAULT NULL;

ALTER TABLE `luces` CHANGE COLUMN `codigoestancia` `codigo_estancia` int(11) DEFAULT NULL;

ALTER TABLE `estor` CHANGE COLUMN `codigoestancia` `codigo_estancia` int(11) DEFAULT NULL;

ALTER TABLE `iot` CHANGE COLUMN `codigoestancia` `codigo_estancia` int(11) DEFAULT NULL;

ALTER TABLE `trb_rasp_ed` CHANGE COLUMN `codigorb` `codigo_rb` int(11) DEFAULT NULL;
ALTER TABLE `trb_rasp_sd` CHANGE COLUMN `codigorb` `codigo_rb` int(11) DEFAULT NULL;
ALTER TABLE `trb_rasp_dali_s` CHANGE COLUMN `codigorb` `codigo_rb` int(11) DEFAULT NULL;
ALTER TABLE `trb_rasp_ds18b20` CHANGE COLUMN `codigorb` `codigo_rb` int(11) DEFAULT NULL;
ALTER TABLE `trb_rasp_ea` CHANGE COLUMN `codigorb` `codigo_rb` int(11) DEFAULT NULL;
ALTER TABLE `trb_rasp_sa` CHANGE COLUMN `codigorb` `codigo_rb` int(11) DEFAULT NULL;
ALTER TABLE `trb_rasp_pulsos` CHANGE COLUMN `codigorb` `codigo_rb` int(11) DEFAULT NULL;


ALTER TABLE `th_rasp_ed` CHANGE COLUMN `codigotp` `codigo_tp` int(11) DEFAULT NULL;
ALTER TABLE `th_rasp_sd` CHANGE COLUMN `codigotp` `codigo_tp` int(11) DEFAULT NULL;
ALTER TABLE `th_rasp_dali_s` CHANGE COLUMN `codigotp` `codigo_tp` int(11) DEFAULT NULL;
ALTER TABLE `th_rasp_ds18b20` CHANGE COLUMN `codigotp` `codigo_tp` int(11) DEFAULT NULL;
ALTER TABLE `th_rasp_ea` CHANGE COLUMN `codigotp` `codigo_tp` int(11) DEFAULT NULL;
ALTER TABLE `th_rasp_sa` CHANGE COLUMN `codigotp` `codigo_tp` int(11) DEFAULT NULL;
ALTER TABLE `th_rasp_pulsos` CHANGE COLUMN `codigotp` `codigo_tp` int(11) DEFAULT NULL;

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
  `intensidad` int(11) NOT NULL,
  `rgb` varchar(8) DEFAULT NULL,
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
  `estado` int(11) NOT NULL,
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
  `fecha_fin` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `ambiente`
--
CREATE TABLE `ambiente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(150) NOT NULL,
  `color` varchar(8) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`)
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
  `tiempo` int(11) NOT NULL,
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
  `tiempo` int(11) NOT NULL,
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
  `color` varchar(8) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `relacion_ot_rutina`
--
CREATE TABLE `relacion_ot_rutina` (
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
  `tiempo` int(11) NOT NULL,
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
  `tiempo` int(11) NOT NULL,
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
  `color` varchar(8) NOT NULL,
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
  `tiempo` int(11) NOT NULL,
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
  `tiempo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_home` (`codigo_home`),
  KEY `codigo_escena` (`codigo_escena`),
  CONSTRAINT `rel_home_esc_ibfk_1` FOREIGN KEY (`codigo_home`) REFERENCES `home_estado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rel_home_esc_ibfk_2` FOREIGN KEY (`codigo_escena`) REFERENCES `escenas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS=1;
