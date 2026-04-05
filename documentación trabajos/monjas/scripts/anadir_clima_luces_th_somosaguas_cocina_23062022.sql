use sistema_somosaguas;

-- th pulsador

   -- char * string = "{\"trb_tpss\":\"0\",\"rb_tpss\":\"1\",\"terminal_tpss\":\"10\",\"trb_tpse\":\"0\",\"rb_tpse\":\"1\",\"terminal_tpse\":\"10\",\"valves\":[{\"trb\": \"1\",\"rb\": \"1\",\"terminal\": \"10\"}, {\"trb\": \"1\",\"rb\": \"1\",\"terminal\": \"10\"}, {\"trb\": \"1\",\"rb\": \"1\",\"terminal\": \"10\"}],\"probes\":[{\"trb\": \"11\",\"rb\": \"21\",\"terminal\": \"12\"}, {\"trb\": \"21\",\"rb\": \"31\",\"terminal\": \"22\"}, {\"trb\": \"12\",\"rb\": \"12\",\"terminal\": \"0\"}]}";
   -- printf ( "JSON string: %s\n\n", string );

-- clima
insert into clima (nemo, codigo_estancia) VALUES
('Cocina Principal', 15),
('Cocina Alejandro', 17),
('Pasillo habitaciones', 19),
('Sala juegos', 52);

insert into relacion_clima (codigo_clima, codigo_variables, rb_temp, codigo_tp_temp, rb_estado, codigo_tp_estado  ) VALUES
-- Cocina principal
(20, -1, 187, 20, -1, -1),
-- Cocina Alejandro
(21, -1, 188, 21, -1, -1),
-- Pasillo habitaciones
(22, -1, 189, -1, -1),
-- Sala juegos
(23, -1, 190, 23, -1, -1);


-- socket clima
insert into th_rasp_ds18b20 (codigo_tp, modulo, argumentos, inhibir) VALUES
(20,4,'{"floor":"4","room":"15","zone":"20","type":"0","nemo":"2"}',0),
(21,4,'{"floor":"4","room":"17","zone":"21","type":"0","nemo":"2"}',0),
(22,4,'{"floor":"4","room":"19","zone":"22","type":"0","nemo":"2"}',0),
(23,4,'{"floor":"4","room":"52","zone":"23","type":"0","nemo":"2"}',0);


-- luces
insert into luces (nemo, codigo_estancia) VALUES
-- Focos techo cocina principal
('Focos techo cocina',15),
('led techo cocina',15),
('Led techo cocina',17),
('Focos techo armario frigorifico',17),
('Focos techo comedor cocina Alejandro',65),
('Focos techo vestibulo coc./ent.',49),
('Focos techo ropero',51),
('Focos techo despensa',50),
('Focos techo puertas pasillo habitaciones',19),
('Focos techo pasillo habitaciones',19),
('Focos escalera servicio ',68),
('Focos techo zona juegos',52);


insert into relacion_luces (codigo_luces, rb_e_estado, codigo_tp_e_estado, rb_s_estado, codigo_tp_s_estado, rb_dali1, codigo_tp_int1) VALUES
-- cocina
(84,184,166,185,139,191,79),
(85,184,167,185,140,192,80),
(86,184,168,185,141,193,81),
(87,184,169,185,142,194,82),
(88,184,170,185,143,195,83),
(89,184,171,185,144,196,84),
(90,184,172,185,145,197,85),
(91,184,173,185,146,198,86),
(92,184,174,185,147,199,87),
(93,184,175,185,148,200,88),
(94,184,176,185,149,201,89),
(95,184,177,185,150,202,90);

-- luces
update trb_rasp_ed set domo = 1 where id =166;
update trb_rasp_ed set domo = 1 where id =167;
update trb_rasp_ed set domo = 1 where id =168;
update trb_rasp_ed set domo = 1 where id =169;
update trb_rasp_ed set domo = 1 where id =170;
update trb_rasp_ed set domo = 1 where id =171;
update trb_rasp_ed set domo = 1 where id =172;
update trb_rasp_ed set domo = 1 where id =173;
update trb_rasp_ed set domo = 1 where id =174;
update trb_rasp_ed set domo = 1 where id =175;
update trb_rasp_ed set domo = 1 where id =176;
update trb_rasp_ed set domo = 1 where id =177;

update trb_rasp_sd set domo = 1 where id =139;
update trb_rasp_sd set domo = 1 where id =140;
update trb_rasp_sd set domo = 1 where id =141;
update trb_rasp_sd set domo = 1 where id =142;
update trb_rasp_sd set domo = 1 where id =143;
update trb_rasp_sd set domo = 1 where id =144;
update trb_rasp_sd set domo = 1 where id =145;
update trb_rasp_sd set domo = 1 where id =146;
update trb_rasp_sd set domo = 1 where id =147;
update trb_rasp_sd set domo = 1 where id =148;
update trb_rasp_sd set domo = 1 where id =149;
update trb_rasp_sd set domo = 1 where id =150;

update trb_rasp_dali_s set domo = 1;



-- socket luces
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
-- cocina principal
(139,4,'{"floor":"4","room":"15","zone":"84","type":"0","nemo":"0"}',0),
(140,4,'{"floor":"4","room":"15","zone":"85","type":"0","nemo":"0"}',0),
-- cocina Alejandro
(141,4,'{"floor":"4","room":"17","zone":"86","type":"0","nemo":"0"}',0),
(142,4,'{"floor":"4","room":"17","zone":"87","type":"0","nemo":"0"}',0),
-- comedor cocina
(143,4,'{"floor":"4","room":"65","zone":"88","type":"0","nemo":"0"}',0),
-- cocina / entrada
(144,4,'{"floor":"4","room":"49","zone":"89","type":"0","nemo":"0"}',0),
-- ropero
(145,4,'{"floor":"4","room":"51","zone":"90","type":"0","nemo":"0"}',0),
-- despensa
(146,4,'{"floor":"4","room":"50","zone":"91","type":"0","nemo":"0"}',0),
-- pasillo habitaciones
(147,4,'{"floor":"4","room":"19","zone":"92","type":"0","nemo":"0"}',0),
(148,4,'{"floor":"4","room":"19","zone":"93","type":"0","nemo":"0"}',0),
-- escalera servicio
(149,4,'{"floor":"4","room":"68","zone":"94","type":"0","nemo":"0"}',0),
-- sala juego
(150,4,'{"floor":"4","room":"52","zone":"95","type":"0","nemo":"0"}',0);

-- socket luces
insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
-- cocina principal
(166,4,'{"floor":"4","room":"15","zone":"84","type":"0","nemo":"0"}',0),
(167,4,'{"floor":"4","room":"15","zone":"85","type":"0","nemo":"0"}',0),
-- cocina Alejandro
(168,4,'{"floor":"4","room":"17","zone":"86","type":"0","nemo":"0"}',0),
(169,4,'{"floor":"4","room":"17","zone":"87","type":"0","nemo":"0"}',0),
-- comedor cocina
(170,4,'{"floor":"4","room":"65","zone":"88","type":"0","nemo":"0"}',0),
-- cocina / entrada
(171,4,'{"floor":"4","room":"49","zone":"89","type":"0","nemo":"0"}',0),
-- ropero
(172,4,'{"floor":"4","room":"51","zone":"90","type":"0","nemo":"0"}',0),
-- despensa
(173,4,'{"floor":"4","room":"50","zone":"91","type":"0","nemo":"0"}',0),
-- pasillo habitaciones
(174,4,'{"floor":"4","room":"19","zone":"92","type":"0","nemo":"0"}',0),
(175,4,'{"floor":"4","room":"19","zone":"93","type":"0","nemo":"0"}',0),
-- escalera servicio
(176,4,'{"floor":"4","room":"68","zone":"94","type":"0","nemo":"0"}',0),
-- sala juego
(177,4,'{"floor":"4","room":"52","zone":"95","type":"0","nemo":"0"}',0);




-- socket luces
insert into th_rasp_dali_s (codigo_tp, modulo, argumentos, inhibir) VALUES
-- cocina principal
(79,4,'{"floor":"4","room":"15","zone":"84","type":"1","nemo":"0"}',0),
(80,4,'{"floor":"4","room":"15","zone":"85","type":"1","nemo":"0"}',0),
-- cocina Alejandro
(81,4,'{"floor":"4","room":"17","zone":"86","type":"1","nemo":"0"}',0),
(82,4,'{"floor":"4","room":"17","zone":"87","type":"1","nemo":"0"}',0),
-- comedor cocina
(83,4,'{"floor":"4","room":"65","zone":"88","type":"1","nemo":"0"}',0),
-- cocina / entrada
(84,4,'{"floor":"4","room":"49","zone":"89","type":"1","nemo":"0"}',0),
-- ropero
(85,4,'{"floor":"4","room":"51","zone":"90","type":"1","nemo":"0"}',0),
-- despensa
(86,4,'{"floor":"4","room":"50","zone":"91","type":"1","nemo":"0"}',0),
-- pasillo habitaciones
(87,4,'{"floor":"4","room":"19","zone":"92","type":"1","nemo":"0"}',0),
(88,4,'{"floor":"4","room":"19","zone":"93","type":"1","nemo":"0"}',0),
-- escalera servicio
(89,4,'{"floor":"4","room":"68","zone":"94","type":"1","nemo":"0"}',0),
-- sala juego
(90,4,'{"floor":"4","room":"52","zone":"95","type":"1","nemo":"0"}',0);
