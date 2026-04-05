use sistema_somosaguas;

-- luces
insert into luces (nemo, codigo_estancia) VALUES
-- Focos techo hab alejandro
('Led Armarios',54),
('Led Armarios',53),
('Led Terraza',71);


insert into relacion_luces (codigo_luces, rb_e_estado, codigo_tp_e_estado, rb_s_estado, codigo_tp_s_estado, rb_dali1, codigo_tp_int1) VALUES
-- focos techo vestibulo
(81,180,163,181,136,-1,-1),
(82,180,164,181,137,-1,-1),
(83,180,165,181,138,183,78);

-- luces
update trb_rasp_ed set domo = 1 where id =163;
update trb_rasp_ed set domo = 1 where id =164;
update trb_rasp_ed set domo = 1 where id =165;

update trb_rasp_sd set domo = 1 where id =136;
update trb_rasp_sd set domo = 1 where id =137;
update trb_rasp_sd set domo = 1 where id =138;

update trb_rasp_dali_s set domo = 1;



-- socket luces
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(136,4,'{"floor":"5","room":"54","zone":"81","type":"0","nemo":"0"}',0),
(137,4,'{"floor":"5","room":"53","zone":"82","type":"0","nemo":"0"}',0),
(138,4,'{"floor":"5","room":"71","zone":"83","type":"0","nemo":"0"}',0);

-- socket luces
insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(163,4,'{"floor":"5","room":"54","zone":"81","type":"0","nemo":"0"}',0),
(164,4,'{"floor":"5","room":"53","zone":"82","type":"0","nemo":"0"}',0),
(165,4,'{"floor":"5","room":"71","zone":"83","type":"0","nemo":"0"}',0);


-- socket luces
insert into th_rasp_dali_s (codigo_tp, modulo, argumentos, inhibir) VALUES
(78,4,'{"floor":"5","room":"71","zone":"83","type":"1","nemo":"0"}',0);



-- iot
-- enchufe suelo biblioteca
insert into iot (nemo, codigo_estancia) VALUES
('Enchufe TV',22),
('Enchufe cabecero izquierdo',24),
('Enchufe cabecero derecho',24),
('Enchufe cabecero izquierdo',22),
('Enchufe cabecero derecho',22);

insert into relacion_iot (codigo_iot, rb_e_estado,codigo_tp_e_estado,rb_s_estado,codigo_tp_s_estado) VALUES
(24,180,158,181,131),
(25,180,159,181,132),
(26,180,160,181,133),
(27,180,161,181,134),
(28,180,162,181,135);

-- socket iot

insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(131,4,'{"floor":"5","room":"22","zone":"24","type":"0","nemo":"4"}',0),
(132,4,'{"floor":"5","room":"24","zone":"25","type":"0","nemo":"4"}',0),
(133,4,'{"floor":"5","room":"24","zone":"26","type":"0","nemo":"4"}',0),
(134,4,'{"floor":"5","room":"22","zone":"27","type":"0","nemo":"4"}',0),
(135,4,'{"floor":"5","room":"22","zone":"28","type":"0","nemo":"4"}',0);

insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(158,4,'{"floor":"5","room":"22","zone":"24","type":"0","nemo":"4"}',0),
(159,4,'{"floor":"5","room":"24","zone":"25","type":"0","nemo":"4"}',0),
(160,4,'{"floor":"5","room":"24","zone":"26","type":"0","nemo":"4"}',0),
(161,4,'{"floor":"5","room":"22","zone":"27","type":"0","nemo":"4"}',0),
(162,4,'{"floor":"5","room":"22","zone":"28","type":"0","nemo":"4"}',0);;

update trb_rasp_ed set domo = 4 where id = 158;
update trb_rasp_ed set domo = 4 where id = 159;
update trb_rasp_ed set domo = 4 where id = 160;
update trb_rasp_ed set domo = 4 where id = 161;
update trb_rasp_ed set domo = 4 where id = 162;

update trb_rasp_sd set domo = 4 where id = 131;
update trb_rasp_sd set domo = 4 where id = 132;
update trb_rasp_sd set domo = 4 where id = 133;
update trb_rasp_sd set domo = 4 where id = 134;
update trb_rasp_sd set domo = 4 where id = 135;
