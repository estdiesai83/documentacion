use sistema_rudy_v2;

DROP TABLE `relacion_consumos`;

CREATE TABLE `relacion_consumos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `rb_valor` int(11) NOT NULL,
  `codigo_tp_valor` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `subtipo` int(11) NOT NULL,
  `formula` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `relacion_consumos` VALUES
-- general luz
(1, now(), 'general luz',19, 63,2,1,NULL),
-- tarta electrica
(2, now(), 'usos varios',1, 13,2,2,NULL),
(3, now(), 'clima',1, 13,2,2,NULL),
(4, now(), 'interior',4, 55,2,2,NULL),
(5, now(), 'exterior',5, 69,2,2,NULL),
(6, now(), 'coche',6, 83,2,2,NULL),
(7, now(), 'servicio',7, 97,2,2,NULL),
(8, now(), 'piscina',8, 13,2,2,NULL),
(9, now(), 'riego',9, 27,2,2,NULL),
(10, now(), 'cocina',10, 111,2,2,NULL),
(11, now(), 'cortacesped',11, 125,2,2,NULL),
(12, now(), 'fuente',12, 41,2,2,NULL),
(13, now(), 'acs',14, 55,2,2,NULL),

-- general agua
(14, now(), 'general agua',23, 3,1,1,NULL),
-- tarta agua
(15, now(), 'Tanque',23, 4,1,2,NULL),
(16, now(), 'Estanque',23, 3,1,2,NULL),
(17, now(), 'Lago Norte',23, 5,1,2,NULL),
(18, now(), 'Lago Sur',23, 1,1,2,NULL),
(19, now(), 'Piscina Exterior',30, 6,1,2,NULL),
(20, now(), 'Piscina Interior',30, 7,1,2,NULL),
(21, now(), 'Riego',30, 8,1,2,NULL),
(22, now(), 'Jacuzzi',23, 4,1,2,NULL),
(23, now(), 'General',23, 3,1,2,NULL),


-- eficiencia
(24, now(), 'readwatt',15, 1,3,1,NULL),
(25, now(), 'solar',14, 55,3,1,NULL);

