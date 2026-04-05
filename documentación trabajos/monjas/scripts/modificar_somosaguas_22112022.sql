update luces set intensidad = 100 where id = 119;

update relacion_luces set rb_dali1 = 530, codigo_tp_int1 = 121 where codigo_luces = 119;

update operacion_luces set intensidad = 100 where codigo_operacion = 324;
update operacion_luces set intensidad = 100 where codigo_operacion = 326;
update operacion_luces set intensidad = 50 where codigo_operacion = 328;

insert into th_rasp_dali_s (codigo_tp,modulo,argumentos,inhibir) values
(121,4,'{"floor":"2","room":"4","zone":"119","type":"1","nemo":"0"}',0);



delete from  th_rasp_sd where codigo_tp=153;
delete from  th_rasp_sd where codigo_tp=154;
delete from  th_rasp_sd where codigo_tp=155;
delete from  th_rasp_sd where codigo_tp=156;

