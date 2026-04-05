

insert seguridad (nemo, valor) VALUES ('Camara frigorifica',4);

insert into relacion_seguridad (codigo_seguridad, rb_valor, codigo_tp_valor) VALUES (1,215,24);

-- socket clima camara frigorifica
insert into th_rasp_ds18b20 (codigo_tp, modulo, argumentos, inhibir) VALUES
(24,4,'{"id":"24","nemo":"1"}',0);

update trb_rasp_ds18b20 set domo = 2;
