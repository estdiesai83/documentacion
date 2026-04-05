SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `relacion_seguridad`;
DROP TABLE IF EXISTS `seguridad`;


--
-- Table structure for table `seguridad`
--
CREATE TABLE `seguridad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `valor` varchar(15) DEFAULT NULL,
  `estado` int(11) DEFAULT -1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- INSERT INTO `seguridad` VALUES
-- (1, now(), 'Inundacion',NULL, 0),
-- (2, now(), 'Deteccion Gas',NULL, 0),
-- (3, now(), 'Deteccion de Incendio',NULL, 0),
-- (4, now(), 'Extintor',NULL, 0),
-- (5, now(), 'Frigorifico',NULL, 0),
-- (6, now(), 'Arcon','18.5', 0);


--
-- Table structure for table `relacion_seguridad`
--
CREATE TABLE `relacion_seguridad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo_seguridad` int(11) NOT NULL,
  `rb_valor` int(11) NOT NULL,
  `codigo_tp_valor` int(11) NOT NULL,
  `rb_estado` int(11) NOT NULL,
  `codigo_tp_estado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_seguridad` (`codigo_seguridad`),
  CONSTRAINT `relacion_seguridad_ibfk_1` FOREIGN KEY (`codigo_seguridad`) REFERENCES `seguridad` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- INSERT INTO `relacion_seguridad` VALUES
-- -- Inundacion
-- (1, now(), 1, -1,-1,1,2),
-- -- Deteccion de gas
-- (2, now(), 2, -1,-1,1,3),
-- -- Deteccion de Incendio
-- (3, now(), 3, -1,-1,1,4),
-- -- Extintor
-- (4, now(), 4, -1,-1,1,5),
-- -- Frigorifico
-- (5, now(), 5, -1,-1,7,27),
-- -- Arcon
-- (6, now(), 6, 11,1,7,28);


DROP TABLE IF EXISTS `relacion_accesos`;
DROP TABLE IF EXISTS `accesos`;


--
-- Table structure for table `accesos`
--
CREATE TABLE `accesos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `tipo` int(11) NOT NULL,
  `estado` int(11) DEFAULT -1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- INSERT INTO `accesos` VALUES
-- (1, now(), 'Puerta',0,0),
-- (2, now(), 'Puerton',1,0),
-- (3, now(), 'Garaje Derecha',2,0),
-- (4, now(), 'Garaje Izquierda',2,0);

--
-- Table structure for table `relacion_accesos`
--

CREATE TABLE `relacion_accesos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `codigo_accesos` int(11) NOT NULL,
  `rb_s_abrir` int(11) DEFAULT -1,
  `codigo_tp_s_abrir` int(11) DEFAULT -1,
  `rb_s_cerrar` int(11) DEFAULT -1,
  `codigo_tp_s_cerrar` int(11) DEFAULT -1,
  `rb_e_abrir` int(11) DEFAULT -1,
  `codigo_tp_e_abrir` int(11) DEFAULT -1,
  `rb_e_cerrar` int(11) DEFAULT -1,
  `codigo_tp_e_cerrar` int(11) DEFAULT -1,
  PRIMARY KEY (`id`),
  KEY `codigo_accesos` (`codigo_accesos`),
  CONSTRAINT `relacion_accesos_ibfk_1` FOREIGN KEY (`codigo_accesos`) REFERENCES `accesos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- INSERT INTO `relacion_accesos` VALUES
-- -- Puerta
-- (1, now(), 1,5,6,-1,-1, -1,-1,-1,-1),
-- -- Porton
-- (2, now(), 2,5,7,-1,-1,4,10,4,11),
-- -- Garaje Derecha
-- (3, now(), 3,5,8,5,9,4,12,4,13),
-- -- Garaje Derecha
-- (4, now(), 4,5,10,5,11,4,14,4,15);

-- Actualizar tdato domo para que los trigger escriban en la tabla seguridad o
-- accesos segun corresponda
-- seguridad
-- UPDATE trb_rasp_ed set domo = 5 where id >= 2 AND id <= 5;
-- UPDATE trb_rasp_ed set domo = 5 where id = 27;
-- UPDATE trb_rasp_ed set domo = 5 where id = 28;
-- UPDATE trb_rasp_ds18b20 set domo = 5 where id =1;

-- -- accesos
-- UPDATE trb_rasp_sd set domo = 6 where id >= 6 AND id <= 11;
-- UPDATE trb_rasp_ed set domo = 6 where id >= 10 AND id <= 15;


RENAME TABLE usuario TO usuario_post;

SET FOREIGN_KEY_CHECKS=1;
