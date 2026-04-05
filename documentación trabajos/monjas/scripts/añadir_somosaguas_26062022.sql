
-- iot
-- enchufe suelo biblioteca
insert into iot (nemo, codigo_estancia) VALUES
-- habitacion2
('Usos Varios',26),
-- habitacion3
('Usos Varios',28),
-- habitacion4
('Usos Varios',30),
-- habitacion5
('Usos Varios',32),
-- biblioteca
('Usos Varios',21),
-- hab invitados
('Usos Varios',34),
-- hab estudio
('Usos Varios',11);

insert into relacion_iot (codigo_iot, rb_e_estado,codigo_tp_e_estado,rb_s_estado,codigo_tp_s_estado) VALUES
-- habitacion2
(29,1,85,2,56),
-- habitacion3
(30,10,86,11,58),
-- habitacion4
(31,19,87,20,60),
-- habitacion5
(32,28,88,29,62),
-- biblioteca
(33,62,72,61,96),
-- habitacion invitados
(34,46,90,47,66),
-- habitacion estudio
(35,37,89,38,64);

-- socket iot

insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(56,4,'{"floor":"5","room":"26","zone":"29","type":"0","nemo":"4"}',0),
(58,4,'{"floor":"5","room":"28","zone":"30","type":"0","nemo":"4"}',0),
(60,4,'{"floor":"5","room":"30","zone":"31","type":"0","nemo":"4"}',0),
(62,4,'{"floor":"5","room":"32","zone":"32","type":"0","nemo":"4"}',0),
(96,4,'{"floor":"4","room":"21","zone":"33","type":"0","nemo":"4"}',0),
(66,4,'{"floor":"6","room":"34","zone":"34","type":"0","nemo":"4"}',0),
(64,4,'{"floor":"3","room":"11","zone":"35","type":"0","nemo":"4"}',0);

insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(85,4,'{"floor":"5","room":"26","zone":"29","type":"0","nemo":"4"}',0),
(86,4,'{"floor":"5","room":"28","zone":"30","type":"0","nemo":"4"}',0),
(87,4,'{"floor":"5","room":"30","zone":"31","type":"0","nemo":"4"}',0),
(88,4,'{"floor":"5","room":"32","zone":"32","type":"0","nemo":"4"}',0),
(72,4,'{"floor":"4","room":"21","zone":"33","type":"0","nemo":"4"}',0),
(90,4,'{"floor":"6","room":"34","zone":"34","type":"0","nemo":"4"}',0),
(89,4,'{"floor":"3","room":"11","zone":"35","type":"0","nemo":"4"}',0);

update trb_rasp_ed set domo = 4 where id = 85;
update trb_rasp_ed set domo = 4 where id = 86;
update trb_rasp_ed set domo = 4 where id = 87;
update trb_rasp_ed set domo = 4 where id = 88;
update trb_rasp_ed set domo = 4 where id = 72;
update trb_rasp_ed set domo = 4 where id = 90;
update trb_rasp_ed set domo = 4 where id = 89;

update trb_rasp_sd set domo = 4 where id = 56;
update trb_rasp_sd set domo = 4 where id = 58;
update trb_rasp_sd set domo = 4 where id = 60;
update trb_rasp_sd set domo = 4 where id = 62;
update trb_rasp_sd set domo = 4 where id = 96;
update trb_rasp_sd set domo = 4 where id = 66;
update trb_rasp_sd set domo = 4 where id = 64;
