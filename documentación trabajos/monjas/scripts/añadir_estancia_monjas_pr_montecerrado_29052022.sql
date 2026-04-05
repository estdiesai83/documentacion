use sistema_pr_montecerrado;

insert into estancias (nemo, codigo_planta, modelo, imagen, esceneas, ambientes, rutinas) VALUES
   ("monjas",4,2,"fotos/24ef54f3a3c656e84869427ff7800f2b478c2316.jpg",1,  1,1);


alter table operacion_iot change column nivel estado int(11) NOT NULL;
alter table operacion_iot drop column consigna;

-- APAGAR TODOS MONJAS

-- habitacion monjas
UPDATE estancia set escenas = 1, ambientes =1, rutinas =1 where id = 22;

-- id, tipodomo, estado
-- luces monjas apagar todas
INSERT INTO operacion VALUES (1,1,1);
-- enchufes monjas apagar todas
INSERT INTO operacion VALUES (2,4,1);


-- luces monjas
-- id, codigo_luces, codigo_operacion, estado, intensidad, rgb
-- alumbrado_cabecero apagar todas
insert into operacion_luces VALUES (1, 26, 1, 0, -1, NULL);
-- alumbrado_armario apagar todas
insert into operacion_luces VALUES (2, 27, 1, 0, -1, NULL);
-- alumbrado_escritori apagar todas
insert into operacion_luces VALUES (3, 28, 1, 0, -1, NULL);


-- iot habitacion invitados
-- id, codigo_iot, codigo_operacion, estado
-- enchufe cabecero derecho
insert into operacion_iot VALUES (1, 16, 2, 0);
-- enchufe cabecero izquierdo
insert into operacion_iot VALUES (2, 17, 2, 0);
-- enchufe tv
insert into operacion_iot VALUES (3, 18, 2, 0);

-- ESCENAS
-- id, fecha, nemo, codigo_estancia, estado, tipodomo, tipo
-- luces habitacion invitados apagar todas
insert into escenas VALUES (1, now(),"apagar", 34, 1, 1, 0);
-- iot habitacion invitados apagar todas
insert into escenas VALUES (2, now(),"apagar", 34, 1, 4, 0);


-- ESCENA_LUCES
-- id, codigo_escena, codigo_operacion
-- luces habitacion invitados apagar todas
insert into escena_luces VALUES (1, 1,1);
-- ESCENA_IOT
-- id, codigo_escena, codigo_operacion
-- iot habitacion invitados apagar todas
insert into escena_iot VALUES (1, 2, 2);


-- APAGAR TODOS BAÑO HABITACION

-- baño invitados
UPDATE estancia set escenas = 1, ambientes =1, rutinas =1 where id = 35;

-- id, tipodomo, estado
-- luces habitacion invitados apagar todas
INSERT INTO operacion VALUES (3,1,1);

-- luces habitacion invitados
-- id, codigo_luces, estado, intensidad, rgb, codigo_operacion
-- alumbrado_cabecero apagar todas
insert into operacion_luces VALUES (4, 29, 3, 0, -1, NULL);
-- alumbrado_armario apagar todas
insert into operacion_luces VALUES (5, 30, 3, 0, -1, NULL);


-- ESCENAS
-- id, fecha, nemo, codigo_estancia, estado, tipodomo, tipo
-- luces habitacion invitados apagar todas
insert into escenas VALUES (3, now(), "apagar", 35, 1, 1, 0);

-- ESCENA_LUCES
-- id, codigo_escena, codigo_operacion
-- luces habitacion invitados apagar todas
insert into escena_luces VALUES (2, 3, 3);













-- STANDARD HABITACION

-- habitacion invitados
UPDATE estancia set escenas = 1, ambientes =1, rutinas =1 where id = 34;

-- id, tipodomo, estado
-- luces habitacion invitados apagar todas
INSERT INTO operacion VALUES (4,1,0);
-- enchufes habitacion invitados apagar todas
INSERT INTO operacion VALUES (5,4,0);


-- luces habitacion invitados
-- id, codigo_luces, estado, intensidad, rgb, codigo_operacion
-- alumbrado_cabecero apagar todas
insert into operacion_luces VALUES (6, 26, 4, 1, 100, NULL);
-- alumbrado_armario apagar todas
insert into operacion_luces VALUES (7, 27, 4, 1, 100, NULL);
-- alumbrado_escritori apagar todas
insert into operacion_luces VALUES (8, 28, 4, 1, 100, NULL);


-- iot habitacion invitados
-- id, codigo_iot, codigo_operacion, estado
-- enchufe cabecero derecho
insert into operacion_iot VALUES (4, 16, 5, 1);
-- enchufe cabecero izquierdo
insert into operacion_iot VALUES (5, 17, 5, 1);
-- enchufe tv
insert into operacion_iot VALUES (6, 18, 5, 1);

-- ESCENAS
-- id, fecha, nemo, codigo_estancia, estado, tipodomo, tipo
-- luces habitacion invitados apagar todas
insert into escenas VALUES (4, now(), "standard",34, 0, 1, 1);
-- iot habitacion invitados apagar todas
insert into escenas VALUES (5, now(), "standard",34, 0, 4, 1);


-- ESCENA_LUCES
-- id, codigo_escena, codigo_operacion
-- luces habitacion invitados apagar todas
insert into escena_luces VALUES (3, 4, 4);
-- ESCENA_IOT
-- id, codigo_escena, codigo_operacion
-- iot habitacion invitados apagar todas
insert into escena_iot VALUES (2, 5, 5);


-- APAGAR TODOS BAÑO HABITACION

-- baño invitados
UPDATE estancia set escenas = 1, ambientes =1, rutinas =1 where id = 35;

-- id, tipodomo, estado
-- luces habitacion invitados apagar todas
INSERT INTO operacion VALUES (6,1,0);

-- luces habitacion invitados
-- id, codigo_luces, estado, intensidad, rgb, codigo_operacion
-- alumbrado_cabecero apagar todas
insert into operacion_luces VALUES (9, 29, 6, 1, 100, NULL);
-- alumbrado_armario apagar todas
insert into operacion_luces VALUES (10, 30, 6, 1, 100, NULL);


-- ESCENAS
-- id, fecha, nemo, codigo_estancia, estado, tipodomo, tipo
-- luces habitacion invitados apagar todas
insert into escenas VALUES (6, now(),"standard", 35, 0, 1, 1);

-- ESCENA_LUCES
-- id, codigo_escena, codigo_operacion
-- luces habitacion invitados apagar todas
insert into escena_luces VALUES (4, 6, 6);



INSERT INTO `usuario_post` VALUES
(1,now(),'Cocina',NULL,NULL,NULL,0,NULL,NULL,NULL,0),
(2,now(),'Sotano',NULL,NULL,NULL,0,NULL,NULL,NULL,0);


DROP TABLE IF EXISTS `relacion_seguridad`;
DROP TABLE IF EXISTS `seguridad`;

CREATE TABLE `seguridad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `nemo` varchar(140) DEFAULT NULL,
  `valor` varchar(15) DEFAULT NULL,
  `estado` int(11) DEFAULT -1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `seguridad` VALUES
(1,now(),'Inundacion',NULL,0),
(2,now(),'Deteccion Gas',NULL,0),
(3,now(),'Deteccion de Incendio',NULL,0),
(4,now(),'Extintor',NULL,0),
(5,now(),'Frigorifico',NULL,0),
(6,now(),'Arcon','27.5',0);


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

INSERT INTO `relacion_seguridad` VALUES
(1,now(),1,-1,-1,1,2),
(2,now(),2,-1,-1,1,3),
(3,now(),3,-1,-1,1,4),
(4,now(),4,-1,-1,1,5),
(5,now(),5,-1,-1,7,27),
(6,now(),6,11,1,7,28);


use sistema_somosaguas;

alter table operacion_iot change column nivel estado int(11) NOT NULL;
alter table operacion_iot drop column consigna;


