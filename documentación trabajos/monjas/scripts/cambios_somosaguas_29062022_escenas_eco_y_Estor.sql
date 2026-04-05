-- vestibulo biblioteca
-- update estancia set escenas = 0, ambientes=0, rutinas = 0 where id = 47;
-- -- vestibulo servicio
-- update estancia set escenas = 0, ambientes=0, rutinas = 0 where id = 56;
-- -- vestibulo sala tv
-- update estancia set escenas = 0, ambientes=0, rutinas = 0 where id = 48;
-- -- sala tv
-- update estancia set escenas = 0, ambientes=1, rutinas = 1 where id = 46;
-- -- vestibulo  hab prin
-- update estancia set escenas = 0, ambientes=0, rutinas = 0 where id = 55;
-- update estancia set escenas = 1, ambientes=1, rutinas = 1 where id = 16;
-- -- comedor alejandro
-- update estancia set escenas = 0, ambientes=0, rutinas = 0 where id = 65;
-- -- vestibulo entrada
-- update estancia set escenas = 0, ambientes=0, rutinas = 0 where id = 49;
-- -- ropero
-- update estancia set escenas = 0, ambientes=0, rutinas = 0 where id = 51;
-- -- despensa
-- update estancia set escenas = 0, ambientes=0, rutinas = 0 where id = 50;
-- -- escalera servicio
-- update estancia set escenas = 0, ambientes=0, rutinas = 0 where id = 68;
-- -- juegos
-- update estancia set escenas = 0, ambientes=1, rutinas = 1 where id = 52;

-- update estancia set escenas = 1, ambientes=1, rutinas = 1 where id = 22;
-- update estancia set escenas = 1, ambientes=1, rutinas = 1 where id = 23;
-- update estancia set escenas = 1, ambientes=1, rutinas = 1 where id = 24;
-- update estancia set escenas = 1, ambientes=1, rutinas = 1 where id = 25;

-- update escenas set estado = 0 where id = 48;
-- update escenas set estado = 0 where id = 49;
-- update escenas set estado = 0 where id = 56;
-- update escenas set estado = 0 where id = 57;

-- update escenas set nemo = 'standard' where id = 57;

-- update operacion_luces set estado = 1 where codigo_operacion=134;
-- update operacion_luces set estado = 1 where codigo_operacion=135;
-- update operacion_luces set estado = 1 where codigo_operacion=136;
-- update operacion_luces set estado = 1 where codigo_operacion=137;
-- update operacion_luces set estado = 1 where codigo_operacion=138;

-- update escenas set tipo = 1 where nemo = 'standard';

-- insert into relacion_escena_operacion (id, codigo_escena,codigo_operacion) VALUES
-- (139,58,139),
-- (140,58,140),
-- (145,61,145),
-- (146,61,146);

update iniciarhilostrb set argumentos = '{"ip":"80.28.98.191","port":"53135","transmitter":"FFFF00","receptor":"0D2735","command":"0","time":"1"}' where id = 281;
update iniciarhilostrb set argumentos = '{"ip":"80.28.98.191","port":"53135","transmitter":"FFFF00","receptor":"0D2746","command":"0","time":"1"}' where id = 282;

update iniciarhilostrb set argumentos = REPLACE(argumentos,'0D2754','0D2735');
update iniciarhilostrb set argumentos = REPLACE(argumentos,'0D2755','0D2746');

update iniciarhilostrb set bornas = 1 where trb = 42;


update iniciarhilostrb set argumentos = replace(argumentos,'"time":"1"','"time":"10"') where trb =42;

update comando set receptor = '0D2735' where receptor = '0D2754';
update comando set receptor = '0D2746' where receptor = '0D2755';

update estor set nemo = 'Habitacion servicio 2 dcha' where id = 12;


-- biblioteca/bar
update escenas set eliminado = 1 where codigo_estancia = 47;
-- vestibulo servicio
update escenas set eliminado = 1 where codigo_estancia = 56;
-- vestibulo sala tv
update escenas set eliminado = 1 where codigo_estancia = 48;
-- sala tv
update escenas set eliminado = 1 where codigo_estancia = 46;
-- vestibulo  hab prin
update escenas set eliminado = 1 where codigo_estancia = 55;
-- comedor alejandro
update escenas set eliminado = 1 where codigo_estancia = 65;
-- vestibulo entrada
update escenas set eliminado = 1 where codigo_estancia = 49;
-- ropero
update escenas set eliminado = 1 where codigo_estancia = 51;
-- despensa
update escenas set eliminado = 1 where codigo_estancia = 50;
-- escalera servicio
update escenas set eliminado = 1 where codigo_estancia = 68;
-- juegos
update escenas set eliminado = 1 where codigo_estancia = 52;


alter table trb_rasp_dali_s change column valor valor varchar(15);
alter table relacion_luces drop column codigo_tp_temp1;
alter table relacion_luces drop column codigo_tp_temp2;
alter table relacion_luces drop column codigo_tp_temp3;
alter table relacion_luces drop column rb_temp;
alter table relacion_luces drop column codigo_tp_temp;
alter table relacion_luces drop column rb_int_temp;
alter table relacion_luces drop column codigo_tp_int_temp;

alter table relacion_luces add column rb_dali4 int(11) default -1;
alter table relacion_luces add column codigo_tp_temp int(11) default -1;
alter table relacion_luces add column rb_dali5 int(11) default -1;
alter table relacion_luces add column codigo_tp_int5 int(11) default -1;

-- escenas eco
-- habitacion 2
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(95,'eco',26,0,1,2,0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(1,191, 1,50,NULL),
(2,192, 1,50,NULL),
(3,193, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(95,191),
(95,192),
(95,193);

-- baño hab 2
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(96,'eco',27,0,1,2,0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(4,194, 1,50,NULL),
(5,195, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(96,194),
(96,195);

-- habitacion 3
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(97,'eco',28,0,1,2,0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(6,196, 1,50,NULL),
(7,197, 1,50,NULL),
(8,198, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(97,196),
(97,197),
(97,198);

-- baño hab 3
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(98,'eco',29,0,1,2,0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(9,199, 1,50,NULL),
(10,200, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(98,199),
(98,200);

-- habitacion 4
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(99,'eco',30,0,1,2,0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(11,201, 1,50,NULL),
(12,202, 1,50,NULL),
(13,203, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(99,201),
(99,202),
(99,203);

-- baño hab 4
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(100,'eco',31,0,1,2,0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(14,204, 1,50,NULL),
(15,205, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(100,204),
(100,205);

-- habitacion 5
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(101,'eco',32,0,1,2,0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(16,206, 1,50,NULL),
(17,207, 1,50,NULL),
(18,208, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(101,206),
(101,207),
(101,208);

-- baño hab3
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(102,'eco',33,0,1,2,0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(19,209, 1,50,NULL),
(20,210, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(102,209),
(102,210);

-- habitacion estudio
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(103,'eco',11,0,1,2,0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(21,211, 1,50,NULL),
(22,212, 1,50,NULL),
(23,213, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(103,211),
(103,212),
(103,213);

-- baño hab estudio
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(104,'eco',12,0,1,2,0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(24,214, 1,50,NULL),
(25,215, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(104,214),
(104,215);

-- habitacion inv
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(105,'eco',34,0,1,2,0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(26,216, 1,50,NULL),
(27,217, 1,50,NULL),
(28,218, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(105,216),
(105,217),
(105,218);



-- baño invitados
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(106,'eco',35,0,1,2,0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(29,219, 1,50,NULL),
(30,220, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(106,219),
(106,220);

-- biblioteca
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(107,'eco',21,0,1,2,0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(31,221, 1,50,NULL),
(32,222, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(107,221),
(107,222);


-- BAR
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(108,'eco',20,0,1,2,0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(34,223, 1,50,NULL),
(39,224, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(108,223),
(108,224);

-- SALA CINE
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(109,'eco',14,0,1,2,0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(35,225, 1,50,NULL),
(36,226, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(109,225),
(109,226);


-- TERRAZA SALA CINE
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(110,'eco',18,0,1,2,0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(37,227, 1,50,NULL),
(38,228, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(110,227),
(110,228);

-- HABITACION SERVICIO 2
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(111,'eco',38,0,1,2,0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(40,229, 1,50,NULL),
(41,230, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(111,229),
(111,230);

-- BAÑO SERVICIO 2
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(112,'eco',39,0,1,2,0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(42,231, 1,50,NULL),
(43,232, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(112,231),
(112,232);

-- HABITACION SERVICIO 1
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(113,'eco',36,0,1,2,0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(44,233, 1,50,NULL),
(45,234, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(113,233),
(113,234);


-- BAÑO SERVICIO1
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(114,'eco',37,0,1,2,0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(46,235, 1,50,NULL),
(47,236, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(114,235),
(114,236);

-- COCINA COMEDOR
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(115,'eco',44,0,1,2,0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(49,237, 1,50,NULL),
(50,238, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(115,237),
(115,238);

-- LAVANDERIA
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(116,'eco',43,0,1,2,0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(51,239, 1,50,NULL),
(52,240, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(116,239),
(116,240);


-- ENTRADA COMEDOR SALA TV
-- PASILLO
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(117,'eco',19,0,1,2,0);
insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0),
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(53,241, 1,50,NULL),
(54,242, 1,50,NULL),
(92,243, 1,50,NULL),
(93,244, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(117,241),
(117,242),
(117,243),
(117,244);

-- COMEDOR
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(118,'eco',13,0,1,2,0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(56,245, 1,50,NULL),
(57,246, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(118,245),
(118,246);

-- TERRAZA SALA TV
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(119,'eco',72,0,1,2,0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(59,247, 1,50,NULL),
(60,248, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(119,247),
(119,248);

-- BAÑO CORTESIA
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(120,'eco',73,0,1,2,0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(61,249, 1,50,NULL),
(62,250, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(120,249),
(120,250);

-- ENTRADA
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(121,'eco',16,0,1,2,0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(63,251, 1,50,NULL),
(64,252, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(121,251),
(121,252);

-- HABITACION ALEJANDRO
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(122,'eco',22,0,1,2,0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(66,253, 1,50,NULL),
(67,254, 1,50,NULL),
(68,255, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(122,253),
(122,254),
(122,255);

-- BAÑO ALEJANDRO
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(123,'eco',23,0,1,2,0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0),
(1, 0),
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(69,256, 1,50,NULL),
(70,257, 1,50,NULL),
(71,258, 1,50,NULL),
(72,259, 1,50,NULL),
(73,260, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(123,256),
(123,257),
(123,258),
(123,259),
(123,260);

-- VESTIDO ALEJANDRO
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(124,'eco',53,0,1,2,0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(74,261, 1,50,NULL),
(82,262, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(124,261),
(124,262);

-- HABITACION RACHEL
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(125,'eco',24,0,1,2,0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(75,263, 1,50,NULL),
(76,264, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(125,263),
(125,264);

-- BAÑO RACHEL
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(126,'eco',25,0,1,2,0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(77,265, 1,50,NULL),
(78,266, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(126,265),
(126,266);

-- VESTIDOR RACHEL
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(127,'eco',54,0,1,2,0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(79,267, 1,50,NULL),
(81,268, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(127,267),
(127,268);

-- TERRAZA RACHEL
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(128,'eco',71,0,1,2,0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(80,269, 1,50,NULL),
(83,270, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(128,269),
(128,270);

-- COCINA PPAL
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(129,'eco',15,0,1,2,0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(84,271, 1,50,NULL),
(85,272, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(129,271),
(129,272);

-- COCINA ALEJANDRO
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(130,'eco',17,0,1,2,0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(86,273, 1,50,NULL),
(87,274, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(130,273),
(130,274);



update iniciarhilostrb set argumentos= REPLACE(argumentos,'"id":"0"','"id":"1"') where argumentos like '%:"53141"%' and trb = 8;
update iniciarhilostrb set argumentos= REPLACE(argumentos,'"id":"0"','"id":"2"') where argumentos like '%:"53133"%' and trb = 8;
update iniciarhilostrb set argumentos= REPLACE(argumentos,'"id":"0"','"id":"3"') where argumentos like '%:"53134"%' and trb = 8;
update iniciarhilostrb set argumentos= REPLACE(argumentos,'"id":"0"','"id":"4"') where argumentos like '%:"53144"%' and trb = 8;
update iniciarhilostrb set argumentos= REPLACE(argumentos,'"id":"0"','"id":"5"') where argumentos like '%:"53149"%' and trb = 8;
update iniciarhilostrb set argumentos= REPLACE(argumentos,'"id":"0"','"id":"6"') where argumentos like '%:"53143"%' and trb = 8;
update iniciarhilostrb set argumentos= REPLACE(argumentos,'"id":"0"','"id":"7"') where argumentos like '%:"53142"%' and trb = 8;
update iniciarhilostrb set argumentos= REPLACE(argumentos,'"id":"0"','"id":"8"') where argumentos like '%:"53135"%' and trb = 8;
update iniciarhilostrb set argumentos= REPLACE(argumentos,'"id":"0"','"id":"9"') where argumentos like '%:"53131"%' and trb = 8;
update iniciarhilostrb set argumentos= REPLACE(argumentos,'"id":"0"','"id":"10"') where argumentos like '%:"53138"%' and trb = 8;
update iniciarhilostrb set argumentos= REPLACE(argumentos,'"id":"0"','"id":"11"') where argumentos like '%:"53139"%' and trb = 8;
update iniciarhilostrb set argumentos= REPLACE(argumentos,'"id":"0"','"id":"12"') where argumentos like '%:"53140"%' and trb = 8;
update iniciarhilostrb set argumentos= REPLACE(argumentos,'"id":"0"','"id":"13"') where argumentos like '%:"53130"%' and trb = 8;

update iniciarhilostrb set argumentos= REPLACE(argumentos,'"converter":"0"','"converter":"1"') where argumentos like '%:"53139"%' and trb = 8;
update iniciarhilostrb set argumentos= REPLACE(argumentos,'"converter":"0"','"converter":"2"') where argumentos like '%:"53140"%' and trb = 8;


update iniciarhilostrb ser argumentos =REPLACE(argumentos, '2800015929999159','2800015920000159');
update relacion_rb set idborna = '2800015920000159' where idborna = '2800015929999159';


-- estancias nuevas
update estancia set nemo ='Fuente interior Pt Baja' where id = 1;
update estancia set nemo ='Fuente entrada Principal' where id = 2;
update estancia set nemo ='Fuente terraza sala cine' where id = 3;
update estancia set nemo ='Terraza sala cine/bar' where id = 18;
update estancia set nemo ='Pasillo Habitaciones' where id = 19;

insert into estancia (nemo, codigo_planta, modelo, imagen, escenas, ambientes, rutinas) VALUES
   ("Lago Jardin",1,2,"fotos/24ef54f3a3c656e84869427ff7800f2b478c2316.jpg",0,0,0);

insert into estancia (nemo, codigo_planta, modelo, imagen, escenas, ambientes, rutinas) VALUES
   ("Pasillo Lavanderia",7,2,"fotos/24ef54f3a3c656e84869427ff7800f2b478c2316.jpg",0,0,0);
insert into estancia (nemo, codigo_planta, modelo, imagen, escenas, ambientes, rutinas) VALUES
   ("Despensa sotano",7,2,"fotos/24ef54f3a3c656e84869427ff7800f2b478c2316.jpg",0,0,0);
insert into estancia (nemo, codigo_planta, modelo, imagen, escenas, ambientes, rutinas) VALUES
   ("Vestibulo Gimnasio",7,2,"fotos/24ef54f3a3c656e84869427ff7800f2b478c2316.jpg",0,0,0);





-- th_consigna
-- insert into th_rasp_ds18b20 (codigo_tp,modulo,argumentos, inhibir) VALUES
-- biblioteca
update relacion_clima set codigo_variables = 15, rb_estado = 209, codigo_tp_estado = 13 where codigo_clima = 7;
-- sala cine
update relacion_clima set codigo_variables = 17, rb_estado = 104, codigo_tp_estado = 152 where codigo_clima = 8;
-- bar
update relacion_clima set codigo_variables = 19, rb_estado = 104, codigo_tp_estado = 151 where codigo_clima = 9;
-- hab servicio 1 pte valvula
-- hab servicio 2 pte valvula
-- cocina comedor pte valvula
-- sala tv
update relacion_clima set codigo_variables = 21, rb_estado = 211, codigo_tp_estado = 15 where codigo_clima = 13;
-- Hab alejandro
update relacion_clima set codigo_variables = 23, rb_estado = 205, codigo_tp_estado = 1 where codigo_clima = 14;
-- Baño alejandro
update relacion_clima set codigo_variables = 25, rb_estado = 205, codigo_tp_estado = 2 where codigo_clima = 15;
-- Vestidor alejandro
update relacion_clima set codigo_variables = 27, rb_estado = 205, codigo_tp_estado = 3 where codigo_clima = 16;
-- Hab Rachel
update relacion_clima set codigo_variables = 29, rb_estado = 205, codigo_tp_estado = 4 where codigo_clima = 17;
-- Baño Rachel
update relacion_clima set codigo_variables = 31, rb_estado = 205, codigo_tp_estado = 5 where codigo_clima = 18;
-- Vestidor Rachel
update relacion_clima set codigo_variables = 33, rb_estado = 205, codigo_tp_estado = 6 where codigo_clima = 19;
-- Cocina principal
update relacion_clima set codigo_variables = 35, rb_estado = 211, codigo_tp_estado = 18 where codigo_clima = 20;
-- Cocina Alejandro
update relacion_clima set codigo_variables = 37, rb_estado = 211, codigo_tp_estado = 17 where codigo_clima = 21;
-- Pasillo habitaciones
update relacion_clima set codigo_variables = , rb_estado = , codigo_tp_estado =  where codigo_clima = 22;
-- Sala Juegos
update relacion_clima set codigo_variables = , rb_estado = , codigo_tp_estado =  where codigo_clima = 23;





-- terminal_tpss bombilla suelo radiante
-- terminal_tpse estado suelo radiante
-- valves (valvula suelo radiante)
-- probes (la sonda)

-- sala tv ya estaba programado
-- biblioteca
insert into th_rasp_pulsador (codigo_tp, modulo,argumentos,inhibir) VALUES
(7, 7,'{"trb_tpss":"7","rb_tpss":"62","terminal_tpss":"3","trb_tpse":"0","rb_tpse":"61","terminal_tpse":"4","valves":[{"trb": "23","rb": "209","terminal": "0"}],"probes":[{"trb": "1","rb": "68","terminal": "0"}]}',1);
-- bar
insert into th_rasp_pulsador (codigo_tp, modulo,argumentos,inhibir) VALUES
(8, 7,'{"trb_tpss":"7","rb_tpss":"70","terminal_tpss":"5","trb_tpse":"0","rb_tpse":"69","terminal_tpse":"6","valves":[{"trb": "7","rb": "104","terminal": "5"}],"probes":[{"trb": "1","rb": "74","terminal": "0"}]}',1);

-- cocina ppal
insert into th_rasp_pulsador (codigo_tp, modulo,argumentos,inhibir) VALUES
(18, 7,'{"trb_tpss":"7","rb_tpss":"214","terminal_tpss":"5","trb_tpse":"0","rb_tpse":"69","terminal_tpse":"6","valves":[{"trb": "7","rb": "104","terminal": "5"}],"probes":[{"trb": "1","rb": "74","terminal": "0"}]}',1);

-- cocina alejandro
insert into th_rasp_pulsador (codigo_tp, modulo,argumentos,inhibir) VALUES
(19, 7,'{"trb_tpss":"7","rb_tpss":"214","terminal_tpss":"5","trb_tpse":"0","rb_tpse":"69","terminal_tpse":"6","valves":[{"trb": "7","rb": "104","terminal": "5"}],"probes":[{"trb": "1","rb": "74","terminal": "0"}]}',1);


-- hab alejandro
insert into th_rasp_pulsador (codigo_tp, modulo,argumentos,inhibir) VALUES
(12, 7,'{"trb_tpss":"23","rb_tpss":"205","terminal_tpss":"6","trb_tpse":"21","rb_tpse":"207","terminal_tpse":"6","valves":[{"trb": "23","rb": "205","terminal": "0"}],"probes":[{"trb": "1","rb": "174","terminal": "0"}]}',1);

-- baño alejandro
insert into th_rasp_pulsador (codigo_tp, modulo,argumentos,inhibir) VALUES
(13, 7,'{"trb_tpss":"23","rb_tpss":"205","terminal_tpss":"7","trb_tpse":"21","rb_tpse":"207","terminal_tpse":"7","valves":[{"trb": "23","rb": "205","terminal": "1"}],"probes":[{"trb": "1","rb": "175","terminal": "0"}]}',1);

-- vestidor alejandro
insert into th_rasp_pulsador (codigo_tp, modulo,argumentos,inhibir) VALUES
(14, 7,'{"trb_tpss":"23","rb_tpss":"206","terminal_tpss":"0","trb_tpse":"21","rb_tpse":"208","terminal_tpse":"0","valves":[{"trb": "23","rb": "205","terminal": "2"}],"probes":[{"trb": "1","rb": "176","terminal": "0"}]}',1);

-- hab rachel
insert into th_rasp_pulsador (codigo_tp, modulo,argumentos,inhibir) VALUES
(15, 7,'{"trb_tpss":"23","rb_tpss":"206","terminal_tpss":"1","trb_tpse":"21","rb_tpse":"208","terminal_tpse":"1","valves":[{"trb": "23","rb": "205","terminal": "3"}],"probes":[{"trb": "1","rb": "177","terminal": "0"}]}',1);

-- baño rachel
insert into th_rasp_pulsador (codigo_tp, modulo,argumentos,inhibir) VALUES
(16, 7,'{"trb_tpss":"23","rb_tpss":"206","terminal_tpss":"2","trb_tpse":"21","rb_tpse":"208","terminal_tpse":"2","valves":[{"trb": "23","rb": "205","terminal": "4"}],"probes":[{"trb": "1","rb": "178","terminal": "0"}]}',1);

-- vestidor rachel
insert into th_rasp_pulsador (codigo_tp, modulo,argumentos,inhibir) VALUES
(17, 7,'{"trb_tpss":"23","rb_tpss":"206","terminal_tpss":"3","trb_tpse":"21","rb_tpse":"208","terminal_tpse":"3","valves":[{"trb": "23","rb": "205","terminal": "5"}],"probes":[{"trb": "1","rb": "179","terminal": "0"}]}',1);




-- hasta aqui esta cargado en el script esta pendiente cargar las escenas de los estores




-- escenas estores

-- VESTIDOR ALEJANDRO
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(131,'subir todo',53,0,3,1,0);

insert into operacion (tipodomo, estado) VALUES
(3, 0),
(3, 0);

insert into operacion_estores (codigo_estor, codigo_operacion, estado, consigna) VALUES
(6,275, NULL,100),
(7,276, NULL,100);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(131,275),
(131,276);


-- HABITACION ESTUDIO
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(132,'subir todo',11,0,3,1,0);

insert into operacion (tipodomo, estado) VALUES
(3, 0),
(3, 0),
(3, 0);

insert into operacion_estores (codigo_estor, codigo_operacion, estado, consigna) VALUES
(8,277, NULL,100),
(9,278, NULL,100),
(10,279, NULL,100);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(132,277),
(132,278),
(132,279);


-- VESTIDOR ALEJANDRO
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(133,'bajar todo',53,0,3,0,0);

insert into operacion (tipodomo, estado) VALUES
(3, 0),
(3, 0);

insert into operacion_estores (codigo_estor, codigo_operacion, estado, consigna) VALUES
(6,280, NULL,0),
(7,281, NULL,0);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(133,280),
(133,281);


-- HABITACION ESTUDIO
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(134,'bajar todo',11,0,3,0,0);

insert into operacion (tipodomo, estado) VALUES
(3, 0),
(3, 0),
(3, 0);

insert into operacion_estores (codigo_estor, codigo_operacion, estado, consigna) VALUES
(8,282, NULL,0),
(9,283, NULL,0),
(10,284, NULL,0);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(134,282),
(134,283),
(134,284);


-- HABITACION SERVICIO2
insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(135,'subir todo',38,0,3,1,0);

insert into operacion (tipodomo, estado) VALUES
(3, 0),
(3, 0);

insert into operacion_estores (codigo_estor, codigo_operacion, estado, consigna) VALUES
(12,285, NULL,100),
(13,286, NULL,100);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(135,285),
(135,286);

insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
(136,'bajar todo',38,0,3,0,0);

insert into operacion (tipodomo, estado) VALUES
(3, 0),
(3, 0);

insert into operacion_estores (codigo_estor, codigo_operacion, estado, consigna) VALUES
(12,287, NULL,0),
(13,288, NULL,0);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(136,287),
(136,288);

-- -- ESCENAS PERSIANAS

-- -- BAÑO ALEJANDRO
-- insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
-- (135,'subir todo',23,0,5,1,0);

-- insert into operacion (tipodomo, estado) VALUES
-- (5, 0),
-- (5, 0);

-- insert into operacion_persianas (codigo_persianas, codigo_operacion, estado, consigna) VALUES
-- (1,285, 1,NULL),
-- (2,286, 1,NULL);

-- insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
-- (135,285),
-- (135,286);


-- -- HABITACION ALEJANDRO
-- insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
-- (136,'subir todo',22,0,5,1,0);

-- insert into operacion (tipodomo, estado) VALUES
-- (5, 0),
-- (5, 0),
-- (5, 0),
-- (5, 0);

-- insert into operacion_persianas (codigo_persianas, codigo_operacion, estado, consigna) VALUES
-- (3,287, 1,NULL),
-- (4,288, 1,NULL),
-- (5,289, 1,NULL),
-- (6,290, 1,NULL);

-- insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
-- (136,287),
-- (136,288),
-- (136,289),
-- (136,290);

-- -- HABITACION RACHEL
-- insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
-- (137,'subir todo',24,0,5,1,0);

-- insert into operacion (tipodomo, estado) VALUES
-- (5, 0),
-- (5, 0);

-- insert into operacion_persianas (codigo_persianas, codigo_operacion, estado, consigna) VALUES
-- (7,291, 1,NULL),
-- (8,292, 1,NULL);

-- insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
-- (137,291),
-- (137,292);


-- -- BAÑO ALEJANDRO
-- insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
-- (138,'bajar todo',23,0,5,0,0);

-- insert into operacion (tipodomo, estado) VALUES
-- (5, 0),
-- (5, 0);

-- insert into operacion_persianas (codigo_persianas, codigo_operacion, estado, consigna) VALUES
-- (1,293, 2,NULL),
-- (2,294, 2,NULL);

-- insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
-- (138,293),
-- (138,294);


-- -- HABITACION ALEJANDRO
-- insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
-- (139,'bajar todo',22,0,5,0,0);

-- insert into operacion (tipodomo, estado) VALUES
-- (5, 0),
-- (5, 0),
-- (5, 0),
-- (5, 0);

-- insert into operacion_persianas (codigo_persianas, codigo_operacion, estado, consigna) VALUES
-- (3,295, 0,NULL),
-- (4,296, 0,NULL),
-- (5,297, 0,NULL),
-- (6,298, 0,NULL);

-- insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
-- (139,295),
-- (139,296),
-- (139,297),
-- (139,298);

-- -- HABITACION RACHEL
-- insert into escenas (id,nemo, codigo_estancia, estado, tipodomo,tipo,eliminado) VALUES
-- (140,'bajar todo',24,0,5,0,0);

-- insert into operacion (tipodomo, estado) VALUES
-- (5, 0),
-- (5, 0);

-- insert into operacion_persianas (codigo_persianas, codigo_operacion, estado, consigna) VALUES
-- (7,299, 2,NULL),
-- (8,300, 2,NULL);

-- insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
-- (140,293),
-- (140,300);

