

-- escenas -- vestibulo alejandro
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 55, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(65,111, 0,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(47,111);


-- escenas -- habitacion alejandro
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 22, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(66,112, 0,100,NULL),
(67,113, 0,100,NULL),
(68,114, 0,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(48,112),
(48,113),
(48,114);


-- escenas -- baño alejandro
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 23, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0),
(1, 0),
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(69,115, 0,100,NULL),
(70,116, 0,100,NULL),
(71,117, 0,100,NULL),
(72,118, 0,100,NULL),
(73,119, 0,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(49,115),
(49,116),
(49,117),
(49,118),
(49,119);


-- escenas -- vestido alejandro
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 53, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(74,120, 0,100,NULL),
(82,121, 0,-1,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(50,120),
(50,121);

-- escenas -- hab rachel
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 24, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(75,122, 0,100,NULL),
(76,123, 0,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(51,122),
(51,123);


-- escenas -- baño rachel
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 24, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(77,124, 0,100,NULL),
(78,125, 0,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(52,124),
(52,125);


-- escenas -- vestido rachel
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 54, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(79,126, 0,100,NULL),
(81,127, 0,-1,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(53,126),
(53,127);

-- escenas -- terraza rachel
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 71, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(80,128, 0,100,NULL),
(83,129, 0,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(54,128),
(54,129);




-- STANDARD


-- escenas -- vestibulo alejandro
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 55, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(65,130, 0,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(55,130);


-- escenas -- habitacion alejandro
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 22, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(66,131, 0,100,NULL),
(67,132, 0,100,NULL),
(68,133, 0,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(56,131),
(56,132),
(56,133);


-- escenas -- baño alejandro
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 23, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0),
(1, 0),
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(69,134, 0,100,NULL),
(70,135, 0,100,NULL),
(71,136, 0,100,NULL),
(72,137, 0,100,NULL),
(73,138, 0,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(57,134),
(57,135),
(57,136),
(57,137),
(57,138);


-- escenas -- vestido alejandro
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 53, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(74,139, 1,100,NULL),
(82,140, 1,-1,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(58,139),
(82,140);

-- escenas -- hab rachel
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 24, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(75,141, 1,100,NULL),
(76,142, 1,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(59,141),
(59,142);


-- escenas -- baño rachel
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 24, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(77,143, 1,100,NULL),
(78,144, 1,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(60,143),
(60,144);


-- escenas -- vestido rachel
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 54, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(79,145, 1,100,NULL),
(81,146, 1,-1,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(61,145),
(81,146);

-- escenas -- terraza rachel
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 71, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(80,147, 1,100,NULL),
(83,148, 1,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(62,147),
(62,148);



-- COCINA

-- escenas -- cocina principal
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 15, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(84,149, 0,100,NULL),
(85,150, 0,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(63,149),
(63,150);

-- escenas -- cocina Alejandro
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 17, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(86,151, 0,100,NULL),
(87,152, 0,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(64,151),
(64,152);



-- escenas -- comedor cocina Alejandro
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 65, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(88,153, 0,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(65,153);



-- escenas -- vestibulo cocina/entrada
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 49, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(89,154, 0,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(66,154);


-- escenas -- ropero
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 51, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(90,155, 0,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(67,155);


-- escenas -- despensa
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 50, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(91,156, 0,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(68,156);


-- escenas -- pasillo habitaciones
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 19, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(92,157, 0,100,NULL),
(93,158, 0,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(69,157),
(69,158);



-- escenas -- escalera servicio
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 68, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(94,159, 0,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(70,159);


-- escenas -- zona juegos
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 52, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(95,160, 0,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(71,160);


-- STANDARD



-- escenas -- cocina principal
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 15, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(84,161, 1,100,NULL),
(85,162, 1,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(72,161),
(72,162);

-- escenas -- cocina Alejandro
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 17, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(86,163, 1,100,NULL),
(87,164, 1,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(73,163),
(73,164);



-- escenas -- comedor cocina Alejandro
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 65, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(88,165, 1,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(74,165);



-- escenas -- vestibulo cocina/entrada
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 49, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(89,166, 1,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(75,166);


-- escenas -- ropero
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 51, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(90,167, 1,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(76,167);


-- escenas -- despensa
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 50, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(91,168, 1,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(77,168);


-- escenas -- pasillo habitaciones
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 19, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(92,169, 1,100,NULL),
(93,170, 1,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(78,169),
(78,170);



-- escenas -- escalera servicio
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 68, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(94,171, 1,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(79,171);


-- escenas -- zona juegos
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 52, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(95,172, 1,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(80,172);



-- BIBLIOTECA BAR
-- escenas -- biblioteca
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 21, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(31,173, 0,100,NULL),
(32,174, 0,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(81,173),
(81,174);

-- escenas --vestibulo biblioteca
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 47, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(33,175, 0,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(82,175);


-- escenas -- bar
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 20, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(34,176, 0,100,NULL),
(39,177, 0,-1,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(83,176),
(83,177);


-- escenas -- sala cine bar
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 14, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(35,178, 0,100,NULL),
(36,179, 0,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(84,178),
(84,179);

-- STANDARD


-- BIBLIOTECA BAR
-- escenas -- biblioteca
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 21, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(31,180, 1,100,NULL),
(32,181, 1,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(85,180),
(85,181);

-- escenas --vestibulo biblioteca
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 47, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(33,182, 1,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(86,182);


-- escenas -- bar
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 20, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(34,183, 1,100,NULL),
(39,184, 1,-1,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(87,183),
(87,184);


-- escenas -- sala cine bar
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 14, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(35,185, 1,100,NULL),
(36,186, 1,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(88,185),
(88,186);
