use sistema_somosaguas;

-- th pulsador

   -- char * string = "{\"trb_tpss\":\"0\",\"rb_tpss\":\"1\",\"terminal_tpss\":\"10\",\"trb_tpse\":\"0\",\"rb_tpse\":\"1\",\"terminal_tpse\":\"10\",\"valves\":[{\"trb\": \"1\",\"rb\": \"1\",\"terminal\": \"10\"}, {\"trb\": \"1\",\"rb\": \"1\",\"terminal\": \"10\"}, {\"trb\": \"1\",\"rb\": \"1\",\"terminal\": \"10\"}],\"probes\":[{\"trb\": \"11\",\"rb\": \"21\",\"terminal\": \"12\"}, {\"trb\": \"21\",\"rb\": \"31\",\"terminal\": \"22\"}, {\"trb\": \"12\",\"rb\": \"12\",\"terminal\": \"0\"}]}";
   -- printf ( "JSON string: %s\n\n", string );

-- clima
insert into clima (nemo, codigo_estancia) VALUES
('habitacion 2', 26),
('habitacion 3', 28),
('habitacion 4', 30),
('habitacion 5', 32),
('habitacion estudio', 11),
('habitacion invitados', 34);

insert into relacion_clima (codigo_clima, codigo_variables, rb_temp, codigo_tp_temp, rb_estado, codigo_tp_estado  ) VALUES
-- habitacion 2
(1, 3, 55, 1, 2, 9),
-- habitacion 3
(2, 5, 56, 2, 11, 18),
-- habitacion 4
(3, 7, 57, 3, 20, 27),
-- habitacion 5
(4, 9, 58, 4, 29, 36),
-- habitacion estudio
(5, 11, 59, 5, 38, 45),
-- habitacion invitados
(6, 13, 60, 6, 47, 54);


-- luces
insert into luces (nemo, codigo_estancia) VALUES
-- bliblioteca
('focos techo biblioteca',21),
('led techo biblioteca',21),
('distribuidor',21),
-- bar
('led bar',20),
('focos techo salon',20),
('led salon',20),
('focos techo exterior',20),
('led exterior',20),
('barra bar',20);



insert into relacion_luces (codigo_luces, rb_e_estado, codigo_tp_e_estado, rb_s_estado, codigo_tp_s_estado, rb_dali1, codigo_tp_int1) VALUES
-- biblioteca
(31,61,91,62,67,65,31),
(32,61,92,62,68,66,32),
(33,61,93,62,69,67,33),
-- bar
(34,69,97,70,73,75,34),
(35,69,98,70,74,76,35),
(36,69,99,70,75,77,36),
(37,69,100,70,76,78,37),
(38,69,101,70,77,79,38),
(39,69,103,70,80,-1,-1);


-- tipo domo
-- clima
update trb_rasp_ds18b20 set domo = 2 where id < 7;

-- luces
update trb_rasp_ed set domo = 1 where id =91;
update trb_rasp_ed set domo = 1 where id =92;
update trb_rasp_ed set domo = 1 where id =93;

update trb_rasp_ed set domo = 1 where id =97;
update trb_rasp_ed set domo = 1 where id =98;
update trb_rasp_ed set domo = 1 where id =99;
update trb_rasp_ed set domo = 1 where id =100;
update trb_rasp_ed set domo = 1 where id =101;
update trb_rasp_ed set domo = 1 where id =103;

update trb_rasp_sd set domo = 1 where id =67;
update trb_rasp_sd set domo = 1 where id =68;
update trb_rasp_sd set domo = 1 where id =69;

update trb_rasp_sd set domo = 1 where id =73;
update trb_rasp_sd set domo = 1 where id =74;
update trb_rasp_sd set domo = 1 where id =75;
update trb_rasp_sd set domo = 1 where id =76;
update trb_rasp_sd set domo = 1 where id =77;
update trb_rasp_sd set domo = 1 where id =80;

update trb_rasp_dali_s set domo = 1;


-- socket clima
insert into th_rasp_ds18b20 (codigo_tp, modulo, argumentos, inhibir) VALUES
(1,4,'{"floor":"5","room":"26","zone":"1","type":"0","nemo":"2"}',0),
(2,4,'{"floor":"5","room":"28","zone":"2","type":"0","nemo":"2"}',0),
(3,4,'{"floor":"5","room":"30","zone":"3","type":"0","nemo":"2"}',0),
(4,4,'{"floor":"5","room":"32","zone":"4","type":"0","nemo":"2"}',0),
(5,4,'{"floor":"3","room":"11","zone":"5","type":"0","nemo":"2"}',0),
(6,4,'{"floor":"6","room":"34","zone":"6","type":"0","nemo":"2"}',0);

-- socket luces
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
-- biblioteca
(67,4,'{"floor":"4","room":"21","zone":"31","type":"0","nemo":"0"}',0),
(68,4,'{"floor":"4","room":"21","zone":"32","type":"0","nemo":"0"}',0),
(69,4,'{"floor":"4","room":"21","zone":"33","type":"0","nemo":"0"}',0),
-- bar
(73,4,'{"floor":"4","room":"20","zone":"34","type":"0","nemo":"0"}',0),
(74,4,'{"floor":"4","room":"20","zone":"35","type":"0","nemo":"0"}',0),
(75,4,'{"floor":"4","room":"20","zone":"36","type":"0","nemo":"0"}',0),
(76,4,'{"floor":"4","room":"20","zone":"37","type":"0","nemo":"0"}',0),
(77,4,'{"floor":"4","room":"20","zone":"38","type":"0","nemo":"0"}',0),
(80,4,'{"floor":"4","room":"20","zone":"39","type":"0","nemo":"0"}',0);


insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
-- biblioteca
(91,4,'{"floor":"4","room":"21","zone":"31","type":"0","nemo":"0"}',0),
(92,4,'{"floor":"4","room":"21","zone":"32","type":"0","nemo":"0"}',0),
(93,4,'{"floor":"4","room":"21","zone":"33","type":"0","nemo":"0"}',0),
-- bar
(97,4,'{"floor":"4","room":"20","zone":"34","type":"0","nemo":"0"}',0),
(98,4,'{"floor":"4","room":"20","zone":"35","type":"0","nemo":"0"}',0),
(99,4,'{"floor":"4","room":"20","zone":"36","type":"0","nemo":"0"}',0),
(100,4,'{"floor":"4","room":"20","zone":"37","type":"0","nemo":"0"}',0),
(101,4,'{"floor":"4","room":"20","zone":"38","type":"0","nemo":"0"}',0),
(103,4,'{"floor":"4","room":"20","zone":"39","type":"0","nemo":"0"}',0);



insert into th_rasp_dali_s (codigo_tp, modulo, argumentos, inhibir) VALUES
-- habitacion 2
(1,4,'{"floor":"5","room":"26","zone":"31","type":"1","nemo":"0"}',0),
(2,4,'{"floor":"5","room":"26","zone":"32","type":"1","nemo":"0"}',0),
(3,4,'{"floor":"5","room":"26","zone":"33","type":"1","nemo":"0"}',0),
-- baño 2
(4,4,'{"floor":"5","room":"27","zone":"31","type":"1","nemo":"0"}',0),
(5,4,'{"floor":"5","room":"27","zone":"32","type":"1","nemo":"0"}',0),
-- habitacion 3
(5,4,'{"floor":"5","room":"28","zone":"31","type":"1","nemo":"0"}',0),
(7,4,'{"floor":"5","room":"28","zone":"32","type":"1","nemo":"0"}',0),
(8,4,'{"floor":"5","room":"28","zone":"33","type":"1","nemo":"0"}',0),
-- baño 3
(9,4,'{"floor":"5","room":"29","zone":"31","type":"1","nemo":"0"}',0),
(10,4,'{"floor":"5","room":"29","zone":"32","type":"1","nemo":"0"}',0),
-- habitacion 4
(11,4,'{"floor":"5","room":"30","zone":"31","type":"1","nemo":"0"}',0),
(12,4,'{"floor":"5","room":"30","zone":"32","type":"1","nemo":"0"}',0),
(13,4,'{"floor":"5","room":"30","zone":"33","type":"1","nemo":"0"}',0),
-- baño 4
(14,4,'{"floor":"5","room":"31","zone":"31","type":"1","nemo":"0"}',0),
(15,4,'{"floor":"5","room":"31","zone":"32","type":"1","nemo":"0"}',0),
-- habitacion 5
(16,4,'{"floor":"5","room":"32","zone":"31","type":"1","nemo":"0"}',0),
(17,4,'{"floor":"5","room":"32","zone":"32","type":"1","nemo":"0"}',0),
(18,4,'{"floor":"5","room":"32","zone":"33","type":"1","nemo":"0"}',0),
-- baño 5
(19,4,'{"floor":"5","room":"33","zone":"31","type":"1","nemo":"0"}',0),
(20,4,'{"floor":"5","room":"33","zone":"32","type":"1","nemo":"0"}',0),
-- habitacion estudio
(21,4,'{"floor":"3","room":"11","zone":"31","type":"1","nemo":"0"}',0),
(22,4,'{"floor":"3","room":"11","zone":"32","type":"1","nemo":"0"}',0),
(23,4,'{"floor":"3","room":"11","zone":"33","type":"1","nemo":"0"}',0),
-- baño estudio
(24,4,'{"floor":"3","room":"12","zone":"31","type":"1","nemo":"0"}',0),
(25,4,'{"floor":"3","room":"12","zone":"32","type":"1","nemo":"0"}',0),
-- habitacion invitados
(26,4,'{"floor":"6","room":"34","zone":"31","type":"1","nemo":"0"}',0),
(27,4,'{"floor":"6","room":"34","zone":"32","type":"1","nemo":"0"}',0),
(28,4,'{"floor":"6","room":"34","zone":"33","type":"1","nemo":"0"}',0),
-- baño invitados
(29,4,'{"floor":"6","room":"35","zone":"31","type":"1","nemo":"0"}',0),
(30,4,'{"floor":"6","room":"35","zone":"32","type":"1","nemo":"0"}',0),
-- biblioteca
(31,4,'{"floor":"4","room":"21","zone":"31","type":"1","nemo":"0"}',0),
(32,4,'{"floor":"4","room":"21","zone":"32","type":"1","nemo":"0"}',0),
(33,4,'{"floor":"4","room":"21","zone":"33","type":"1","nemo":"0"}',0),
-- bar
(34,4,'{"floor":"4","room":"20","zone":"34","type":"1","nemo":"0"}',0),
(35,4,'{"floor":"4","room":"20","zone":"35","type":"1","nemo":"0"}',0),
(36,4,'{"floor":"4","room":"20","zone":"36","type":"1","nemo":"0"}',0),
(37,4,'{"floor":"4","room":"20","zone":"37","type":"1","nemo":"0"}',0),
(38,4,'{"floor":"4","room":"20","zone":"38","type":"1","nemo":"0"}',0);


-- iot
-- enchufe suelo biblioteca
insert into iot (nemo, codigo_estancia) VALUES ('Enchufe suelo',21);

insert into relacion_iot (codigo_iot, rb_e_estado,codigo_tp_e_estado,rb_s_estado,codigo_tp_s_estado) VALUES
(19,61,95,62,71 );

-- socket iot

insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
-- biblioteca
(71,4,'{"floor":"4","room":"21","zone":"19","type":"0","nemo":"4"}',0);

insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
-- biblioteca
(95,4,'{"floor":"4","room":"21","zone":"19","type":"0","nemo":"4"}',0);

update trb_rasp_ed set domo = 4 where id = 95;
update trb_rasp_sd set domo = 4 where id = 71;
