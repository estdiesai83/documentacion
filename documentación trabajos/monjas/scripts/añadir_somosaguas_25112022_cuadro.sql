DROP TABLE IF EXISTS `automaticos`;
DROP TABLE IF EXISTS `cuadro`;


CREATE TABLE `cuadro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_planta` int(11) DEFAULT NULL,
  `codigo_grupo` int(11) DEFAULT NULL,
  `codigo_estancia` int(11) DEFAULT NULL,
  `filas` int(11) DEFAULT NULL,
  `columnas` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_planta` (`codigo_planta`),
  KEY `codigo_estancia` (`codigo_estancia`),
  KEY `codigo_grupo` (`codigo_grupo`),
  CONSTRAINT `cuadro_ibfk_1` FOREIGN KEY (`codigo_planta`) REFERENCES `planta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cuadro_ibfk_2` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cuadro_ibfk_3` FOREIGN KEY (`codigo_grupo`) REFERENCES `grupo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `cuadro` VALUES (1,'habitacion invitados',NULL,NULL,34,2,12);

CREATE TABLE `automaticos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nemo` varchar(140) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `fila` int(11) DEFAULT NULL,
  `descripcion` varchar(140) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `codigo_cuadro` int(11) DEFAULT NULL,
  `rb_e_estado` int(11) DEFAULT NULL,
  `codigo_tp_e_estado` int(11) DEFAULT NULL,
  `rb_s_estado` int(11) DEFAULT NULL,
  `codigo_tp_s_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_cuadro` (`codigo_cuadro`),
  CONSTRAINT `automaticos_ibfk_1` FOREIGN KEY (`codigo_cuadro`) REFERENCES `cuadro` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;



INSERT INTO `automaticos` VALUES (1,'Automatico General',4,2,'',0,1,46,81,NULL,NULL),(2,'Automatico Alumbrado',2,2,'',0,1,46,82,NULL,NULL),(3,'Automatico Usos Varios',2,2,'',0,1,46,83,NULL,NULL),(4,'Automatico Maniobra',2,2,'',0,1,46,84,NULL,NULL),(5,'',-1,2,'',NULL,1,NULL,NULL,NULL,NULL);

insert into th_rasp_ed (codigo_tp,modulo,argumentos,inhibir) VALUES
(81,4,'{"nemo":"8","floor":"6","room":"34","zone":"1"}',1),
(82,4,'{"nemo":"8","floor":"6","room":"34","zone":"2"}',1),
(83,4,'{"nemo":"8","floor":"6","room":"34","zone":"3"}',1),
(84,4,'{"nemo":"8","floor":"6","room":"34","zone":"4"}',1);


update trb_rasp_ed set domo = 9 where id = 81;
update trb_rasp_ed set domo = 9 where id = 82;
update trb_rasp_ed set domo = 9 where id = 83;
update trb_rasp_ed set domo = 9 where id = 84;
