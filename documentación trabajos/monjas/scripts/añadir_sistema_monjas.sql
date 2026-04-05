-- CREAR ESTANCIA
insert into estancia (nemo, codigo_planta, modelo, imagen, escenas, ambientes, rutinas) VALUES
   ("monjas",4,2,"fotos/24ef54f3a3c656e84869427ff7800f2b478c2316.jpg",1, 1,1);

-- monjas
insert luces (fecha, nemo, codigo_estancia,estado,intensidad,rgb) values
(now(),'aumbrado rgb',47,1,-1,NULL);
insert luces (fecha, nemo, codigo_estancia,estado,intensidad,rgb) values
(now(),'focos techo',47,1,100,NULL);
insert luces (fecha, nemo, codigo_estancia,estado,intensidad,rgb) values
(now(),'alumbrado led',47,1,100,NULL);


-- habitacion 2
insert into relacion_luces (codigo_luces, rb_e_estado, codigo_tp_e_estado, rb_s_estado, codigo_tp_s_estado, rb_dali1, codigo_tp_int1) VALUES
(65,120,142,121,115,-1,-1);
insert into relacion_luces (codigo_luces, rb_e_estado, codigo_tp_e_estado, rb_s_estado, codigo_tp_s_estado, rb_dali1, codigo_tp_int1) VALUES
(66,120,143,121,116,125,62);
insert into relacion_luces (codigo_luces, rb_e_estado, codigo_tp_e_estado, rb_s_estado, codigo_tp_s_estado, rb_dali1, codigo_tp_int1) VALUES
(67,120,144,121,117,126,63);


update trb_rasp_ed set domo = 1 where id =142;
update trb_rasp_sd set domo = 1 where id =115;
update trb_rasp_ed set domo = 1 where id =143;
update trb_rasp_sd set domo = 1 where id =116;
update trb_rasp_ed set domo = 1 where id =144;
update trb_rasp_sd set domo = 1 where id =117;


update trb_rasp_dali_s set domo =1;

-- socket luces
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(115,4,'{"floor":"4","room":"47","zone":"65","type":"0","nemo":"0"}',0);
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(116,4,'{"floor":"4","room":"47","zone":"66","type":"0","nemo":"0"}',0);
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(117,4,'{"floor":"4","room":"47","zone":"67","type":"0","nemo":"0"}',0);



insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(142,4,'{"floor":"4","room":"47","zone":"65","type":"0","nemo":"0"}',0);
insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(143,4,'{"floor":"4","room":"47","zone":"66","type":"0","nemo":"0"}',0);
insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(144,4,'{"floor":"4","room":"47","zone":"67","type":"0","nemo":"0"}',0);


-- insert into th_rasp_dali_s (codigo_tp, modulo, argumentos, inhibir) VALUES
-- (39,4,'{"floor":"6","room":"38","zone":"40","type":"1","nemo":"0"}',0);
insert into th_rasp_dali_s (codigo_tp, modulo, argumentos, inhibir) VALUES
(62,4,'{"floor":"4","room":"47","zone":"66","type":"1","nemo":"0"}',0);
insert into th_rasp_dali_s (codigo_tp, modulo, argumentos, inhibir) VALUES
(63,4,'{"floor":"4","room":"47","zone":"67","type":"1","nemo":"0"}',0);




-- escenas -- habitacion 2
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 47, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(65,111, 0,0,NULL),
(66,112, 0,0,NULL),
(67,113, 0,0,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(47,111),
(47,112),
(47,113);


-- escenas
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 47, 1, 1, 1);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(65,114, 1,-1,NULL),
(66,115, 1,100,NULL),
(67,116, 1,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(48,114),
(48,115),
(48,116);


-- CLIMA
insert clima (fecha, nemo, codigo_estancia, estado, consigna) values
(now(),'sonda monjas',47,0,22);

insert into relacion_clima (codigo_clima, codigo_variables, rb_temp, codigo_tp_temp, rb_estado, codigo_tp_estado  ) VALUES
(14,-1 ,124 ,14 ,121 ,120);

update trb_rasp_ds18b20 set domo = 2 where id = 14;

-- socket clima
insert into th_rasp_ds18b20 (codigo_tp, modulo, argumentos, inhibir) VALUES
(14,4,'{"floor":"4","room":"47","zone":"14","type":"0","nemo":"2"}',0);



-- IOT
insert iot (fecha, nemo, codigo_estancia, estado) values
(now(),'Enchufe derecho',47,0);

insert into relacion_iot (codigo_iot, rb_e_estado,codigo_tp_e_estado,rb_s_estado,codigo_tp_s_estado) VALUES
(24,120,145,121,118 );

insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(118,4,'{"floor":"4","room":"47","zone":"24","type":"0","nemo":"4"}',0);
insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(145,4,'{"floor":"4","room":"47","zone":"24","type":"0","nemo":"4"}',0);

insert iot (fecha, nemo, codigo_estancia, estado) values
(now(),'Enchufe izquierdo',47,0);

insert into relacion_iot (codigo_iot, rb_e_estado,codigo_tp_e_estado,rb_s_estado,codigo_tp_s_estado) VALUES
(25,120,146,121,119 );


insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(119,4,'{"floor":"4","room":"47","zone":"25","type":"0","nemo":"4"}',0);
insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(146,4,'{"floor":"4","room":"47","zone":"25","type":"0","nemo":"4"}',0);


update trb_rasp_ed set domo = 4 where id = 145;
update trb_rasp_sd set domo = 4 where id = 118;
update trb_rasp_ed set domo = 4 where id = 146;
update trb_rasp_sd set domo = 4 where id = 119;
