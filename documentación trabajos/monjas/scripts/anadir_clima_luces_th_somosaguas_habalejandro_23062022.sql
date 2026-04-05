use sistema_somosaguas;

-- th pulsador

   -- char * string = "{\"trb_tpss\":\"0\",\"rb_tpss\":\"1\",\"terminal_tpss\":\"10\",\"trb_tpse\":\"0\",\"rb_tpse\":\"1\",\"terminal_tpse\":\"10\",\"valves\":[{\"trb\": \"1\",\"rb\": \"1\",\"terminal\": \"10\"}, {\"trb\": \"1\",\"rb\": \"1\",\"terminal\": \"10\"}, {\"trb\": \"1\",\"rb\": \"1\",\"terminal\": \"10\"}],\"probes\":[{\"trb\": \"11\",\"rb\": \"21\",\"terminal\": \"12\"}, {\"trb\": \"21\",\"rb\": \"31\",\"terminal\": \"22\"}, {\"trb\": \"12\",\"rb\": \"12\",\"terminal\": \"0\"}]}";
   -- printf ( "JSON string: %s\n\n", string );

-- clima
insert into clima (nemo, codigo_estancia) VALUES
('Hab. Alejandro', 22),
('Baño Alejandro', 23),
('Vestidor Alejandro', 53),
('Hab. Rachel', 24),
('Baño Rachel', 25),
('Vestidor Rachel', 54);

insert into relacion_clima (codigo_clima, codigo_variables, rb_temp, codigo_tp_temp, rb_estado, codigo_tp_estado  ) VALUES
-- Habitacion Alejandro
(14, -1, 174, 14, -1, -1),
-- Baño Alejandro
(15, -1, 175, 15, -1, -1),
-- Vestidor Alejandro
(16, -1, 176, 16, -1, -1),
-- Hab. Rachel
(17, -1, 177, 17, -1, -1),
-- Baño Rachel
(18, -1, 178, 18, -1, -1),
-- Vestidor Rachel
(19, -1, 179, 19, -1, -1);


-- socket clima
insert into th_rasp_ds18b20 (codigo_tp, modulo, argumentos, inhibir) VALUES
(14,4,'{"floor":"5","room":"22","zone":"14","type":"0","nemo":"2"}',0),
(15,4,'{"floor":"5","room":"23","zone":"15","type":"0","nemo":"2"}',0),
(16,4,'{"floor":"5","room":"53","zone":"16","type":"0","nemo":"2"}',0),
(17,4,'{"floor":"5","room":"24","zone":"17","type":"0","nemo":"2"}',0),
(18,4,'{"floor":"5","room":"25","zone":"18","type":"0","nemo":"2"}',0),
(19,4,'{"floor":"5","room":"54","zone":"19","type":"0","nemo":"2"}',0);


-- luces
insert into luces (nemo, codigo_estancia) VALUES
-- Focos techo hab alejandro
('Focos techo vestibulo',55),
('Focos techo cabecero',22),
('Focos techo habitacion',22),
('Led Habitacion',22),
('Focos techo Baño',23),
('Focos techo inodoro',23),
('Focos techo espejo baño',23),
('Focos techo jacuzzi baño',23),
('Led jacuzzi baño',23),
('Led vestidor',53),
('Focos techo habitacion',24),
('Focos techo escritorio',24),
('Focos techo baño',25),
('Led espejo baño',25),
('Led vestidor',54),
('Focos techo terraza',71);


insert into relacion_luces (codigo_luces, rb_e_estado, codigo_tp_e_estado, rb_s_estado, codigo_tp_s_estado, rb_dali1, codigo_tp_int1) VALUES
-- focos techo vestibulo
(65,155,142,156,115,158,62),
(66,155,143,156,116,159,63),
(67,155,144,156,117,160,64),
(68,155,145,156,118,161,65),
(69,155,146,156,119,162,66),
(70,155,147,156,120,163,67),
(71,155,148,156,121,164,68),
(72,155,149,156,122,165,69),
(73,155,150,156,123,166,70),
(74,155,151,156,124,167,71),
(75,155,152,156,125,168,72),
(76,155,153,156,126,169,73),
(77,155,154,156,127,170,74),
(78,155,155,156,128,171,75),
(79,155,156,156,129,172,76),
(80,155,157,156,130,173,77);


-- tipo domo
-- clima
update trb_rasp_ds18b20 set domo = 2;

-- luces
update trb_rasp_ed set domo = 1 where id =142;
update trb_rasp_ed set domo = 1 where id =143;
update trb_rasp_ed set domo = 1 where id =144;

update trb_rasp_ed set domo = 1 where id =145;
update trb_rasp_ed set domo = 1 where id =146;
update trb_rasp_ed set domo = 1 where id =147;
update trb_rasp_ed set domo = 1 where id =148;
update trb_rasp_ed set domo = 1 where id =149;
update trb_rasp_ed set domo = 1 where id =150;
update trb_rasp_ed set domo = 1 where id =151;
update trb_rasp_ed set domo = 1 where id =152;
update trb_rasp_ed set domo = 1 where id =153;
update trb_rasp_ed set domo = 1 where id =154;
update trb_rasp_ed set domo = 1 where id =155;
update trb_rasp_ed set domo = 1 where id =156;
update trb_rasp_ed set domo = 1 where id =157;

update trb_rasp_sd set domo = 1 where id =115;
update trb_rasp_sd set domo = 1 where id =116;
update trb_rasp_sd set domo = 1 where id =117;

update trb_rasp_sd set domo = 1 where id =118;
update trb_rasp_sd set domo = 1 where id =119;
update trb_rasp_sd set domo = 1 where id =120;
update trb_rasp_sd set domo = 1 where id =121;
update trb_rasp_sd set domo = 1 where id =122;
update trb_rasp_sd set domo = 1 where id =123;
update trb_rasp_sd set domo = 1 where id =124;
update trb_rasp_sd set domo = 1 where id =125;
update trb_rasp_sd set domo = 1 where id =126;
update trb_rasp_sd set domo = 1 where id =127;
update trb_rasp_sd set domo = 1 where id =128;
update trb_rasp_sd set domo = 1 where id =129;
update trb_rasp_sd set domo = 1 where id =130;

update trb_rasp_dali_s set domo = 1;



-- socket luces
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(115,4,'{"floor":"5","room":"55","zone":"65","type":"0","nemo":"0"}',0),
(116,4,'{"floor":"5","room":"22","zone":"66","type":"0","nemo":"0"}',0),
(117,4,'{"floor":"5","room":"22","zone":"67","type":"0","nemo":"0"}',0),
(118,4,'{"floor":"5","room":"22","zone":"68","type":"0","nemo":"0"}',0),
(119,4,'{"floor":"5","room":"23","zone":"69","type":"0","nemo":"0"}',0),
(120,4,'{"floor":"5","room":"23","zone":"70","type":"0","nemo":"0"}',0),
(121,4,'{"floor":"5","room":"23","zone":"71","type":"0","nemo":"0"}',0),
(122,4,'{"floor":"5","room":"23","zone":"72","type":"0","nemo":"0"}',0),
(123,4,'{"floor":"5","room":"23","zone":"73","type":"0","nemo":"0"}',0),
(124,4,'{"floor":"5","room":"53","zone":"74","type":"0","nemo":"0"}',0),
(125,4,'{"floor":"5","room":"24","zone":"75","type":"0","nemo":"0"}',0),
(126,4,'{"floor":"5","room":"24","zone":"76","type":"0","nemo":"0"}',0),
(127,4,'{"floor":"5","room":"25","zone":"77","type":"0","nemo":"0"}',0),
(128,4,'{"floor":"5","room":"25","zone":"78","type":"0","nemo":"0"}',0),
(129,4,'{"floor":"5","room":"54","zone":"79","type":"0","nemo":"0"}',0),
(130,4,'{"floor":"5","room":"71","zone":"80","type":"0","nemo":"0"}',0);

-- socket luces
insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(142,4,'{"floor":"5","room":"55","zone":"65","type":"0","nemo":"0"}',0),
(143,4,'{"floor":"5","room":"22","zone":"66","type":"0","nemo":"0"}',0),
(144,4,'{"floor":"5","room":"22","zone":"67","type":"0","nemo":"0"}',0),
(145,4,'{"floor":"5","room":"22","zone":"68","type":"0","nemo":"0"}',0),
(146,4,'{"floor":"5","room":"23","zone":"69","type":"0","nemo":"0"}',0),
(147,4,'{"floor":"5","room":"23","zone":"70","type":"0","nemo":"0"}',0),
(148,4,'{"floor":"5","room":"23","zone":"71","type":"0","nemo":"0"}',0),
(149,4,'{"floor":"5","room":"23","zone":"72","type":"0","nemo":"0"}',0),
(150,4,'{"floor":"5","room":"23","zone":"73","type":"0","nemo":"0"}',0),
(151,4,'{"floor":"5","room":"53","zone":"74","type":"0","nemo":"0"}',0),
(152,4,'{"floor":"5","room":"24","zone":"75","type":"0","nemo":"0"}',0),
(153,4,'{"floor":"5","room":"24","zone":"76","type":"0","nemo":"0"}',0),
(154,4,'{"floor":"5","room":"25","zone":"77","type":"0","nemo":"0"}',0),
(155,4,'{"floor":"5","room":"25","zone":"78","type":"0","nemo":"0"}',0),
(156,4,'{"floor":"5","room":"54","zone":"79","type":"0","nemo":"0"}',0),
(157,4,'{"floor":"5","room":"71","zone":"80","type":"0","nemo":"0"}',0);


-- socket luces
insert into th_rasp_dali_s (codigo_tp, modulo, argumentos, inhibir) VALUES
(62,4,'{"floor":"5","room":"55","zone":"65","type":"1","nemo":"0"}',0),
(63,4,'{"floor":"5","room":"22","zone":"66","type":"1","nemo":"0"}',0),
(64,4,'{"floor":"5","room":"22","zone":"67","type":"1","nemo":"0"}',0),
(65,4,'{"floor":"5","room":"22","zone":"68","type":"1","nemo":"0"}',0),
(66,4,'{"floor":"5","room":"23","zone":"69","type":"1","nemo":"0"}',0),
(67,4,'{"floor":"5","room":"23","zone":"70","type":"1","nemo":"0"}',0),
(68,4,'{"floor":"5","room":"23","zone":"71","type":"1","nemo":"0"}',0),
(69,4,'{"floor":"5","room":"23","zone":"72","type":"1","nemo":"0"}',0),
(70,4,'{"floor":"5","room":"23","zone":"73","type":"1","nemo":"0"}',0),
(71,4,'{"floor":"5","room":"53","zone":"74","type":"1","nemo":"0"}',0),
(72,4,'{"floor":"5","room":"24","zone":"75","type":"1","nemo":"0"}',0),
(73,4,'{"floor":"5","room":"24","zone":"76","type":"1","nemo":"0"}',0),
(74,4,'{"floor":"5","room":"25","zone":"77","type":"1","nemo":"0"}',0),
(75,4,'{"floor":"5","room":"25","zone":"78","type":"1","nemo":"0"}',0),
(76,4,'{"floor":"5","room":"54","zone":"79","type":"1","nemo":"0"}',0),
(77,4,'{"floor":"5","room":"71","zone":"80","type":"1","nemo":"0"}',0);

