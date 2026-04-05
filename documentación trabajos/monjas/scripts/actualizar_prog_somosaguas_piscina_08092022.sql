

update luces set rgb = NULL where rgb = -1;


-- cambio grupo 0 a grupo 5 rb 488
update iniciarhilostrb set argumentos = '{"ip":"80.28.98.191","port":"53132","converter":"0","command":"69","id":"15"}' where id = 714;
update iniciarhilostrb set argumentos = '{"ip":"80.28.98.191","port":"53132","converter":"0","command":"69","id":"15"}' where id = 715;

-- cambio grupo 1 a grupo 6 rb 489
update iniciarhilostrb set argumentos = '{"ip":"80.28.98.191","port":"53132","converter":"0","command":"70","id":"15"}' where id = 716;
update iniciarhilostrb set argumentos = '{"ip":"80.28.98.191","port":"53132","converter":"0","command":"70","id":"15"}' where id = 717;

-- cambio grupo 2 a grupo 7 rb 490
update iniciarhilostrb set argumentos = '{"ip":"80.28.98.191","port":"53132","converter":"0","command":"71","id":"15"}' where id = 718;
update iniciarhilostrb set argumentos = '{"ip":"80.28.98.191","port":"53132","converter":"0","command":"71","id":"15"}' where id = 719;

-- cambio grupo 3 a grupo 7 rb 491
update iniciarhilostrb set argumentos = '{"ip":"80.28.98.191","port":"53132","converter":"0","command":"72","id":"15"}' where id = 720;

-- cambio grupo 4 a grupo 0 rb 492
update iniciarhilostrb set argumentos = '{"ip":"80.28.98.191","port":"53132","converter":"0","command":"64","id":"15"}' where id = 721;

update rb set numcomando = 69 where id = 488;
update rb set numcomando = 70 where id = 489;
update rb set numcomando = 71 where id = 490;
update rb set numcomando = 72 where id = 491;
update rb set numcomando = 64 where id = 492;

-- modificaciones en tabla luces
update luces set nemo = 'Led Espejo Baño 2', codigo_estancia = 59, rgb = NULL, temperatura = -1 where id = 116;

-- piscina interior
update luces set intensidad = 100, rgb = '255$255$255', temperatura = 0 where id = 110;
update luces set intensidad = 100, rgb = '255$255$255', temperatura = 0 where id = 111;

update relacion_luces set rb_e_estado = 314 , codigo_tp_e_estado = 169,rb_dali1=488,codigo_tp_int1=99,codigo_tp_rgb1=100,rb_dali2=489,codigo_tp_int2=101,codigo_tp_rgb2=102,rb_dali3=490,codigo_tp_int3=103,codigo_tp_rgb3=104,rb_dali4=491,codigo_tp_temp=105 where codigo_luces = 110;
update relacion_luces set rb_e_estado = 314 , codigo_tp_e_estado = 170,rb_dali1=506,codigo_tp_int1=111,codigo_tp_rgb1=112,rb_dali2=507,codigo_tp_int2=113,codigo_tp_rgb2=114,rb_dali3=508,codigo_tp_int3=115,codigo_tp_rgb3=116,rb_dali4=509,codigo_tp_temp=117 where codigo_luces = 111;


insert into th_rasp_dali_s (codigo_tp, modulo, argumentos, inhibir) VALUES
(99,4,'{"floor":"7","room":"41","zone":"110","type":"1","nemo":"0"}', 0),
(100,4,'{"floor":"7","room":"41","zone":"110","type":"2","nemo":"0"}', 0),
(101,4,'{"floor":"7","room":"41","zone":"110","type":"1","nemo":"0"}', 0),
(102,4,'{"floor":"7","room":"41","zone":"110","type":"2","nemo":"0"}', 0),
(103,4,'{"floor":"7","room":"41","zone":"110","type":"1","nemo":"0"}', 0),
(104,4,'{"floor":"7","room":"41","zone":"110","type":"2","nemo":"0"}', 0),
(105,4,'{"floor":"7","room":"41","zone":"110","type":"3","nemo":"0"}', 0),
(106,4,'{"floor":"7","room":"41","zone":"116","type":"1","nemo":"0"}', 0);


update th_rasp_dali_s set argumentos = '{"floor":"7","room":"41","zone":"116","type":"1","nemo":"0"}' where codigo_tp = 106;
insert into th_rasp_dali_s (codigo_tp, modulo, argumentos, inhibir) VALUES
(107,4,'{"floor":"7","room":"58","zone":"107","type":"1","nemo":"0"}', 0),
(108,4,'{"floor":"7","room":"58","zone":"108","type":"1","nemo":"0"}', 0),
(109,4,'{"floor":"7","room":"59","zone":"109","type":"1","nemo":"0"}', 0),
(110,4,'{"floor":"7","room":"59","zone":"110","type":"1","nemo":"0"}', 0),
(111,4,'{"floor":"7","room":"41","zone":"111","type":"1","nemo":"0"}', 0),
(112,4,'{"floor":"7","room":"41","zone":"111","type":"2","nemo":"0"}', 0),
(113,4,'{"floor":"7","room":"41","zone":"111","type":"1","nemo":"0"}', 0),
(114,4,'{"floor":"7","room":"41","zone":"111","type":"2","nemo":"0"}', 0),
(115,4,'{"floor":"7","room":"41","zone":"111","type":"1","nemo":"0"}', 0),
(116,4,'{"floor":"7","room":"41","zone":"111","type":"2","nemo":"0"}', 0),
(117,4,'{"floor":"7","room":"41","zone":"111","type":"3","nemo":"0"}', 0);

insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(169, 4,'{"floor":"7","room":"41","zone":"110","type":"0","nemo":"0"}',0);

insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(203, 4,'{"floor":"7","room":"41","zone":"110","type":"0","nemo":"0"}',0);

insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(199, 4,'{"floor":"7","room":"60","zone":"106","type":"0","nemo":"0"}',0);
insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(200, 4,'{"floor":"7","room":"58","zone":"107","type":"0","nemo":"0"}',0);
insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(201, 4,'{"floor":"7","room":"58","zone":"108","type":"0","nemo":"0"}',0);
insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(202, 4,'{"floor":"7","room":"59","zone":"109","type":"0","nemo":"0"}',0);

insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(204, 4,'{"floor":"7","room":"41","zone":"111","type":"0","nemo":"0"}',0);
insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(206, 4,'{"floor":"7","room":"59","zone":"116","type":"0","nemo":"0"}',0);

update th_rasp_dali_s set argumentos = '{"floor":"7","room":"59","zone":"116","type":"1","nemo":"0"}' where codigo_tp = 106;

update th_rasp_sd set argumentos = '{"floor":"7","room":"59","zone":"116","type":"0","nemo":"0"}',codigo_tp=186 where id=324;



-- baño 1
update luces set intensidad = 100 where id = 107;
update luces set intensidad = 100 where id = 108;

update relacion_luces set rb_e_estado = 314 , codigo_tp_e_estado = 200,rb_dali1=502,codigo_tp_int1=107 where codigo_luces = 107;
update relacion_luces set rb_e_estado = 314 , codigo_tp_e_estado = 201,rb_dali1=503,codigo_tp_int1=108 where codigo_luces = 108;

update operacion_luces set intensidad = 100 where id =293;
update operacion_luces set intensidad = 100 where id =294;

-- escenas standard
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 58, 0, 1, 2);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(107,313, 1,50,NULL),
(108,314, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(257,313),
(257,314);

insert into escenas (codigo_estancia, nemo, estado, tipodomo, tipo, eliminado) VALUES
(58,'eco',0,1,2,0);
insert into escenas (codigo_estancia, nemo, estado, tipodomo, tipo, eliminado) VALUES
(58,'romantic',0,1,2,0);
insert into escenas (codigo_estancia, nemo, estado, tipodomo, tipo, eliminado) VALUES
(58,'cine',0,1,2,0);


-- baño 2
update luces set intensidad = 100 where id = 109;
update luces set intensidad = 100 where id = 116;

update relacion_luces set rb_e_estado = 314 , codigo_tp_e_estado = 202,rb_dali1=504,codigo_tp_int1=109 where codigo_luces = 109;
update relacion_luces set rb_s_estado = 315, codigo_tp_s_estado =  186, rb_e_estado = 314 , codigo_tp_e_estado = 206,rb_dali1=505,codigo_tp_int1=110,rb_dali2=-1,codigo_tp_int2=-1,codigo_tp_rgb2=-1,rb_dali3=-1,codigo_tp_int3=-1,codigo_tp_rgb3=-1,rb_dali4=-1,codigo_tp_temp=-1,rb_dali5=-1,codigo_tp_int5=-1 where codigo_luces = 116;


insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 59, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(109,315, 0,100,NULL),
(116,316, 0,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(261,315),
(261,316);

insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('maxima', 59, 0, 1, 1);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(109,317, 1,100,NULL),
(116,318, 1,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(262,317),
(262,318);

insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 59, 0, 1, 2);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(109,319, 1,50,NULL),
(116,320, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(263,319),
(263,320);

insert into escenas (codigo_estancia, nemo, estado, tipodomo, tipo, eliminado) VALUES
(59,'eco',0,1,2,0);
insert into escenas (codigo_estancia, nemo, estado, tipodomo, tipo, eliminado) VALUES
(59,'romantic',0,1,2,0);
insert into escenas (codigo_estancia, nemo, estado, tipodomo, tipo, eliminado) VALUES
(59,'cine',0,1,2,0);



--  vestibulo

update relacion_luces set rb_e_estado = 314 , codigo_tp_e_estado = 199, rb_dali1=492,codigo_tp_int1=106 where codigo_luces = 106;


-- luces gimnasio
insert into th_rasp_ed (codigo_tp,modulo, argumentos, inhibir ) VALUES (229,4,'{"floor":"7","room":"40","zone":"105","type":"0","nemo":"0"}',0);

update operacion_luces set intensidad = 100 where id = 289;
update operacion_luces set intensidad = 100 where id = 290;

update luces set intensidad = 100 where id = 104;
update luces set intensidad = 100 where id = 105;


update relacion_luces set rb_e_estado =499 ,codigo_tp_e_estado =228,rb_dali1 = 522,codigo_tp_int1=119 where codigo_luces = 104;
update relacion_luces set rb_e_estado =499 ,codigo_tp_e_estado =229,rb_dali1 = 523,codigo_tp_int1=120 where codigo_luces = 105;

update th_rasp_dali_s set argumentos = '{"floor":"7","room":"40","zone":"104","type":"1","nemo":"0"}' where id = 119;

insert into th_rasp_dali_s (codigo_tp,modulo,argumentos,inhibir) values (120,4,'{"floor":"7","room":"40","zone":"105","type":"1","nemo":"0"}',0);

insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 40, 0, 1, 2);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(104,321, 1,50,NULL),
(105,322, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(267,321),
(267,322);

insert into escenas (codigo_estancia, nemo, estado, tipodomo, tipo, eliminado) VALUES
(40,'eco',0,1,2,0);
insert into escenas (codigo_estancia, nemo, estado, tipodomo, tipo, eliminado) VALUES
(40,'romantic',0,1,2,0);
insert into escenas (codigo_estancia, nemo, estado, tipodomo, tipo, eliminado) VALUES
(40,'cine',0,1,2,0);

-- piscina exterior
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 4, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(118,323, 0,100,NULL),
(119,324, 0,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(268,315),
(268,316);

insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('maxima', 59, 0, 1, 1);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(109,317, 1,100,NULL),
(116,318, 1,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(262,317),
(262,318);

insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 59, 0, 1, 2);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(109,319, 1,50,NULL),
(116,320, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(263,319),
(263,320);

insert into escenas (codigo_estancia, nemo, estado, tipodomo, tipo, eliminado) VALUES
(59,'eco',0,1,2,0);
insert into escenas (codigo_estancia, nemo, estado, tipodomo, tipo, eliminado) VALUES
(59,'romantic',0,1,2,0);
insert into escenas (codigo_estancia, nemo, estado, tipodomo, tipo, eliminado) VALUES
(59,'cine',0,1,2,0);


-- piscina interior


insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 41, 0, 1, 2);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(110,329, 1,50,NULL),
(111,330, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(277,329),
(277,330);

insert into escenas (codigo_estancia, nemo, estado, tipodomo, tipo, eliminado) VALUES
(41,'eco',0,1,2,0);
insert into escenas (codigo_estancia, nemo, estado, tipodomo, tipo, eliminado) VALUES
(41,'romantic',0,1,2,0);
insert into escenas (codigo_estancia, nemo, estado, tipodomo, tipo, eliminado) VALUES
(41,'cine',0,1,2,0);

update operacion_luces set intensidad = 100, rgb = '255$255$255', temperatura = 0 where id = 297;
update operacion_luces set intensidad = 100, rgb = '255$255$255', temperatura = 0 where id = 298;


update operacion_luces set intensidad = 50, rgb = '255$255$255', temperatura = 0 where id = 313;
update operacion_luces set intensidad = 50, rgb = '255$255$255', temperatura = 0 where id = 314;

-- +-----+---------------------+------------------------+-----------------+--------+------------+-------------+-------------+
-- | id  | fecha               | nemo                   | codigo_estancia | estado | intensidad | rgb         | temperatura |
-- +-----+---------------------+------------------------+-----------------+--------+------------+-------------+-------------+
-- | 110 | 2022-07-15 08:36:00 | Led perimetro techo    |              41 |      0 |         -1 | -1          |          -1 |
-- | 111 | 2022-07-15 08:36:00 | Led hamacas interiores |              41 |      0 |         -1 | -1          |          -1 |
-- | 116 | 2022-08-30 11:21:28 | piscina interior       |              41 |      0 |        100 | 255$255$255 |           0 |
-- +-----+---------------------+------------------------+-----------------+--------+------------+-------------+-------------+




-- +-----+------+-------------------------------------------------------------------------------+-----------+--------+---------+------+---------+
-- | id  | trb  | argumentos                                                                    | codigo_rb | bornas | inhibir | tipo | subtipo |
-- +-----+------+-------------------------------------------------------------------------------+-----------+--------+---------+------+---------+
-- | 714 |    8 | {"ip":"80.28.98.191","port":"53132","converter":"0","command":"64","id":"15"} |       488 | 1      |       0 |    1 |       0 |
-- | 715 |    8 | {"ip":"80.28.98.191","port":"53132","converter":"0","command":"64","id":"15"} |       488 | 3      |       0 |    1 |       0 |
-- | 716 |    8 | {"ip":"80.28.98.191","port":"53132","converter":"0","command":"65","id":"15"} |       489 | 1      |       0 |    1 |       0 |
-- | 717 |    8 | {"ip":"80.28.98.191","port":"53132","converter":"0","command":"65","id":"15"} |       489 | 3      |       0 |    1 |       0 |
-- | 718 |    8 | {"ip":"80.28.98.191","port":"53132","converter":"0","command":"66","id":"15"} |       490 | 1      |       0 |    1 |       0 |
-- | 719 |    8 | {"ip":"80.28.98.191","port":"53132","converter":"0","command":"66","id":"15"} |       490 | 3      |       0 |    1 |       0 |
-- | 720 |    8 | {"ip":"80.28.98.191","port":"53132","converter":"0","command":"67","id":"15"} |       491 | 4      |       0 |    1 |       0 |
-- | 721 |    8 | {"ip":"80.28.98.191","port":"53132","converter":"0","command":"68","id":"15"} |       492 | 1      |       0 |    1 |       0 |
-- +-----+------+-------------------------------------------------------------------------------+-----------+--------+---------+------+---------+
