
use sistema_pr_somosaguas;

insert into piscina (codigo_estancia, nemo) VALUES (41,'Piscina Interior');

insert into relacion_piscina (codigo_piscina, rb_temp, codigo_tp_temp, rb_ph, codigo_tp_ph, rb_nivel, codigo_tp_nivel, rb_redox,  codigo_tp_redox ) VALUES
(1,493,5,493,1,493,3,493,2);

update trb_sugar_conv_e set domo = 8;


-- int rojo
insert into th_rasp_dali_s (codigo_tp,modulo,argumentos,inhibir) VALUES
(99,4,'{"floor":"7","room":"41","zone":"116","type":"1","nemo":"0"}',0);
-- color rojo
insert into th_rasp_dali_s (codigo_tp,modulo,argumentos,inhibir) VALUES
(100,4,'{"floor":"7","room":"41","zone":"116","type":"2","nemo":"0"}',0);


-- int verde
insert into th_rasp_dali_s (codigo_tp,modulo,argumentos,inhibir) VALUES
(101,4,'{"floor":"7","room":"41","zone":"116","type":"1","nemo":"0"}',0);
-- color verde
insert into th_rasp_dali_s (codigo_tp,modulo,argumentos,inhibir) VALUES
(102,4,'{"floor":"7","room":"41","zone":"116","type":"2","nemo":"0"}',0);


-- int azul
insert into th_rasp_dali_s (codigo_tp,modulo,argumentos,inhibir) VALUES
(103,4,'{"floor":"7","room":"41","zone":"116","type":"1","nemo":"0"}',0);
-- color rojo
insert into th_rasp_dali_s (codigo_tp,modulo,argumentos,inhibir) VALUES
(104,4,'{"floor":"7","room":"41","zone":"116","type":"2","nemo":"0"}',0);


-- temp
insert into th_rasp_dali_s (codigo_tp,modulo,argumentos,inhibir) VALUES
(105,4,'{"floor":"7","room":"41","zone":"116","type":"3","nemo":"0"}',0);

-- intensidad
insert into th_rasp_dali_s (codigo_tp,modulo,argumentos,inhibir) VALUES
(106,4,'{"floor":"7","room":"41","zone":"116","type":"1","nemo":"0"}',0);


