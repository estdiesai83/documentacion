use sistema_pruebas;

alter table ubicacion drop column codigoproyecto;

insert into `proyecto` values
(11,'Admin', 'Admin');

update proyecto set id = 8 where id = 11;

update teho set codigoproyecto = 8 where id =7 or id =8;

delete from teho where id = 13;

CREATE TABLE `relacion_proyecto_ubicacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_proyecto` int(11) NOT NULL,
  `codigo_ubicacion` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_proyecto` (`codigo_proyecto`),
  KEY `codigo_ubicacion` (`codigo_ubicacion`),
  CONSTRAINT `rel_proy_ubi_ibfk_1` FOREIGN KEY (`codigo_proyecto`) REFERENCES `proyecto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rel_proy_ubi_ibfk_2` FOREIGN KEY (`codigo_ubicacion`) REFERENCES `ubicacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


insert into `relacion_proyecto_ubicacion` values
-- hazard
(1,1,1),
-- mariano
(2,2,2),
(3,2,3),
-- oviedo
(4,3,4),
(5,3,5),
-- pruebas
(6,7,6),
(7,7,9),
(8,7,13),
(9,7,14),
-- alejandro
(10,10,11),
(11,10,12),
-- admin
(12,8,2),
(13,8,3),
(14,8,4),
(15,8,5),
(16,8,6),
(17,8,9),
(18,8,13),
(19,8,14);
