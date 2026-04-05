use sistema_somosaguas;

-- escenas apagar todo
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
-- habitacion 2
('apagar', 26, 0, 1, 0),
-- baño 2
('apagar', 27, 0, 1, 0),
-- habitacion 3
('apagar', 28, 0, 1, 0),
-- baño 3
('apagar', 29, 0, 1, 0),
-- habitacion 4
('apagar', 30, 0, 1, 0),
-- baño 4
('apagar', 31, 0, 1, 0),
-- habitacion 5
('apagar', 32, 0, 1, 0),
-- baño 5
('apagar', 33, 0, 1, 0),
-- habitacion estudio
('apagar', 11, 0, 1, 0),
-- baño estudo
('apagar', 12, 0, 1, 0),
-- habitacion invitados
('apagar', 34, 0, 1, 0),
-- baño invitados
('apagar', 35, 0, 1, 0);


-- operaciones apagar
insert into operacion (tipodomo, estado) VALUES
-- habitacion 2
(1, 0),
(1, 0),
(1, 0),
-- baño 2
(1, 0),
(1, 0),
-- habitacion 3
(1, 0),
(1, 0),
(1, 0),
-- baño 3
(1, 0),
(1, 0),
-- habitacion 4
(1, 0),
(1, 0),
(1, 0),
-- baño 4
(1, 0),
(1, 0),
-- habitacion 5
(1, 0),
(1, 0),
(1, 0),
-- baño 5
(1, 0),
(1, 0),
-- habitacion estudio
(1, 0),
(1, 0),
(1, 0),
-- baño estudo
(1, 0),
(1, 0),
-- habitacion invitados
(1, 0),
(1, 0),
(1, 0),
-- baño invitados
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
-- habitacion 2
(1,1, 0,-1,NULL),
(2,2, 0,-1,NULL),
(3,3, 0,-1,NULL),
-- baño 2
(4,4, 0,-1,NULL),
(5,5, 0,-1,NULL),
-- habitacion 3
(6,6, 0,-1,NULL),
(7,7, 0,-1,NULL),
(8,8, 0,-1,NULL),
-- baño 3
(9,9, 0,-1,NULL),
(10,10, 0,-1,NULL),
-- habitacion 4
(11,11, 0,-1,NULL),
(12,12, 0,-1,NULL),
(13,13, 0,-1,NULL),
-- baño 4
(14,14, 0,-1,NULL),
(15,15, 0,-1,NULL),
-- habitacion 5
(16,16, 0,-1,NULL),
(17,17, 0,-1,NULL),
(18,18, 0,-1,NULL),
-- baño 5
(19,19, 0,-1,NULL),
(20,20, 0,-1,NULL),
-- habitacion estudio
(21,21, 0,-1,NULL),
(22,22, 0,-1,NULL),
(23,23, 0,-1,NULL),
-- baño estudio
(24,24, 0,-1,NULL),
(25,25, 0,-1,NULL),
-- habitacion invitados
(26,26, 0,-1,NULL),
(27,27, 0,-1,NULL),
(28,28, 0,-1,NULL),
-- baño invitados
(29,29, 0,-1,NULL),
(30,30, 0,-1,NULL);


insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
-- habitacion 2
(1,1),
(1,2),
(1,3),
-- baño 2
(2,4),
(2,5),
-- habitacion 3
(3,6),
(3,7),
(3,8),
-- baño 3
(4,9),
(4,10),
-- habitacion 4
(5,11),
(5,12),
(5,13),
-- baño 4
(6,14),
(6,15),
-- habitacion 5
(7,16),
(7,17),
(7,18),
-- baño 5
(8,19),
(8,20),
-- habitacion estudio
(9,21),
(9,22),
(9,23),
-- baño estudio
(10,24),
(10,25),
-- habitacion invitados
(11,26),
(11,27),
(11,28),
-- baño invitados
(12,29),
(12,30);


-- escenas standar
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
-- habitacion 2
('standard', 26, 1,1,1),
-- baño 2
('standard', 27, 1,1,1),
-- habitacion 3
('standard', 28, 1,1,1),
-- baño 3
('standard', 29, 1,1,1),
-- habitacion 4
('standard', 30, 1,1,1),
-- baño 4
('standard', 31, 1,1,1),
-- habitacion 5
('standard', 32, 1,1,1),
-- baño 5
('standard', 33, 1,1,1),
-- habitacion estudio
('standard', 11, 1,1,1),
-- baño estudo
('standard', 12, 1,1,1),
-- habitacion invitados
('standard', 34, 1,1,1),
-- baño invitados
('standard', 35, 1, 1, 1);

insert into operacion (tipodomo, estado) VALUES
-- habitacion 2
(1,1),
(1,1),
(1,1),
-- baño 2
(1,1),
(1,1),
-- habitacion 3
(1,1),
(1,1),
(1,1),
-- baño 3
(1,1),
(1,1),
-- habitacion 4
(1,1),
(1,1),
(1,1),
-- baño 4
(1,1),
(1,1),
-- habitacion 5
(1,1),
(1,1),
(1,1),
-- baño 5
(1,1),
(1,1),
-- habitacion estudio
(1,1),
(1,1),
(1,1),
-- baño estudo
(1,1),
(1,1),
-- habitacion invitados
(1,1),
(1,1),
(1,1),
-- baño invitados
(1,1),
(1,1);



insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
-- habitacion 2
(1,31, 1,100,NULL),
(2,32, 1,100,NULL),
(3,33, 1,100,NULL),
-- baño 2
(4,34, 1,100,NULL),
(5,35, 1,100,NULL),
-- habitacion 3
(6,36, 1,100,NULL),
(7,37, 1,100,NULL),
(8,38, 1,100,NULL),
-- baño 3
(9,39, 1,100,NULL),
(10,40, 1,100,NULL),
-- habitacion 4
(11,41, 1,100,NULL),
(12,42, 1,100,NULL),
(13,43, 1,100,NULL),
-- baño 4
(14,44, 1,100,NULL),
(15,45, 1,100,NULL),
-- habitacion 5
(16,46, 1,100,NULL),
(17,47, 1,100,NULL),
(18,48, 1,100,NULL),
-- baño 5
(19,49, 1,100,NULL),
(20,50, 1,100,NULL),
-- habitacion estudio
(21,51, 1,100,NULL),
(22,52, 1,100,NULL),
(23,53, 1,100,NULL),
-- baño estudio
(24,54, 1,100,NULL),
(25,55, 1,100,NULL),
-- habitacion invitados
(26,56, 1,100,NULL),
(27,57, 1,100,NULL),
(28,58, 1,100,NULL),
-- baño invitados
(29,59, 1,100,NULL),
(30,60, 1,100,NULL);


insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
-- habitacion 2
(13,31),
(13,32),
(13,33),
-- baño 2
(14,34),
(14,35),
-- habitacion 3
(15,36),
(15,37),
(15,38),
-- baño 3
(16,39),
(16,40),
-- habitacion 4
(17,41),
(17,42),
(17,43),
-- baño 4
(18,44),
(18,45),
-- habitacion 5
(19,46),
(19,47),
(19,48),
-- baño 5
(20,49),
(20,50),
-- habitacion estudio
(21,51),
(21,52),
(21,53),
-- baño estudio
(22,54),
(22,55),
-- habitacion invitados
(23,56),
(23,57),
(23,58),
-- baño invitados
(24,59),
(24,60);

alter table sistema_pr_montecerrado.relacion_escena_operacion drop column tiempo;
alter table sistema_montecerrado.relacion_escena_operacion drop column tiempo;
alter table sistema_rudy_v2.relacion_escena_operacion drop column tiempo;
