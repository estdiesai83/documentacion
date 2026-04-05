
ALTER table cuadro add column filas int(11) DEFAULT NULL;
ALTER table cuadro add column columnas int(11) DEFAULT NULL;


use sistema_pr_somosaguas;

DROP TABLE IF EXISTS `automaticos`;
DROP TABLE IF EXISTS `cuadro`;

CREATE TABLE `cuadro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nemo` varchar(140) DEFAULT NULL,
  `codigo_planta` int(11) DEFAULT NULL,
  `codigo_estancia` int(11) DEFAULT NULL,
  `filas` int(11) DEFAULT NULL,
  `columnas` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_planta` (`codigo_planta`),
  KEY `codigo_estancia` (`codigo_estancia`),
  CONSTRAINT `cuadro_ibfk_1` FOREIGN KEY (`codigo_planta`) REFERENCES `planta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cuadro_ibfk_2` FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `automaticos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nemo` varchar(140) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `fila` int(11) DEFAULT NULL,
  `nemofila` varchar(140) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `codigo_cuadro` int(11) DEFAULT NULL,
  `rb_e_estado` int(11) DEFAULT NULL,
  `codigo_tp_e_estado` int(11) DEFAULT NULL,
  `rb_s_estado` int(11) DEFAULT NULL,
  `codigo_tp_s_estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_cuadro` (`codigo_cuadro`),
  CONSTRAINT `automaticos_ibfk_1` FOREIGN KEY (`codigo_cuadro`) REFERENCES `cuadro` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


insert into cuadro (nemo,codigo_estancia,filas,columnas) VALUES ('habitacion invitados',34 ,2,12);

insert into automaticos (nemo, tipo, fila, nemofila, estado, codigo_cuadro, rb_e_estado, codigo_tp_e_estado) VALUES
('Estado Automatico General', 4,2,'Fila 2',0,1,46,81),
('Estado Automatico Alumbrado', 2,2,'Fila 2',0,1,46,82),
('Estado Automatico Usos Varios', 2,2,'Fila 2',0,1,46,83),
('Estado Automatico Maniobra', 2,2,'Fila 2',0,1,46,84),
('', -1,2,'',NULL,1,NULL,NULL);

update trb_rasp_ed set domo = 9  where id = 81;
update trb_rasp_ed set domo = 9  where id = 82;
update trb_rasp_ed set domo = 9  where id = 83;
update trb_rasp_ed set domo = 9  where id = 84;

-- {"nemo" : "8", "location_id": "id_ubicacion", "floor": "id_planta", "group": "id_grupo", "room": "id_estancia", "status": "valor" , "type": "valor tipo*","id": "id aut cuadro"}

-- tipo valor tipo*: 0 -> por planta; 1-> por estancia
-- insert into th_rasp_ed (modulo, argumentos, codigo_tp, inhibir ) VALUES
-- ("{nemo" : "8", "location_id": "id_ubicacion", "floor": "id_planta", "group": "id_grupo", "room": "id_estancia", "status": "valor" , "type": "valor tipo*","id": "id aut cuadro"})


