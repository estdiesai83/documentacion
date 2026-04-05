-- fallo estor hab 3 hab 4
update relacion_estor set codigo_estor = 4 where id = 3;
update relacion_estor set codigo_estor = 3 where id = 4;


update th_somfy_50_s set argumentos = REPLACE(argumentos,'"floor": "4"','"floor": "6"') where id = 1;
update th_somfy_50_s set argumentos = REPLACE(argumentos,'"floor": "4"','"floor": "5"') where id >= 2 AND id <= 7;
update th_somfy_50_s set argumentos = REPLACE(argumentos,'"floor": "4"','"floor": "3"') where id >= 8 AND id <= 10;
update th_somfy_50_s set argumentos = REPLACE(argumentos,'"floor": "4"','"floor": "6"') where id >= 11 AND id <= 13;

update th_somfy_50_e set argumentos = REPLACE(argumentos,'"floor": "4"','"floor": "6"') where id = 14;
update th_somfy_50_e set argumentos = REPLACE(argumentos,'"floor": "4"','"floor": "5"') where id >= 15 AND id <= 20;
update th_somfy_50_e set argumentos = REPLACE(argumentos,'"floor": "4"','"floor": "3"') where id >= 21 AND id <= 23;
update th_somfy_50_e set argumentos = REPLACE(argumentos,'"floor": "4"','"floor": "6"') where id >= 24 AND id <= 26;


-- fallo entrada cocina comedor
-- la borna 9 tenia tipo domo = 2
update trb_rasp_sd set domo = 1 where id = 90;
update trb_rasp_sd set domo = 1 where id = 89;

update th_rasp_ed set codigo_tp = 113 where id = 68;
update th_rasp_ed set codigo_tp = 114 where id = 69;

delete from th_rasp_ed where id = 154;
delete from th_rasp_ed where id = 155;

update th_rasp_dali_s set argumentos = '{"floor":"7","room":"44","zone":"49","type":"1","nemo":"0"}' where id = 46;


-- estor cocina
-- en entrada no estaba puesto domo = 5
update trb_somfy_50_e set domo = 5 where id = 26;
insert into th_somfy_50_e (codigo_tp,modulo,argumentos, inhibir ) VALUES (26,4, '{"floor":"4","room":"15","zone":"14","type":"1","nemo":"9"}',1);


-- fallo estor entrada hab servicio 2 idnodo = 0D2732
-- estaba mal el puerto estaba 53153 en lugar de 53135
update iniciarhilostrb set argumentos ='{"ip":"80.28.98.191","port":"53135","transmitter":"FFFF00","receptor":"0D2732","command":"0","time":"10"}' where id = 366;



-- entrada comedor sala tv 1
-- estaba mal el th socket de sd y ed de las luces 53 y 54 por que se han pasado
-- de pasillo (19) a comedor (13)
update th_rasp_sd set argumentos = '{"floor":"4","room":"13","zone":"53","type":"0","nemo":"0"}' where id = 169;
update th_rasp_sd set argumentos = '{"floor":"4","room":"13","zone":"54","type":"0","nemo":"0"}' where id = 170;
update th_rasp_sd set argumentos = '{"floor":"5","room":"19","zone":"23","type":"0","nemo":"4"}' where id = 184;

update th_rasp_ed set argumentos = '{"floor":"4","room":"13","zone":"53","type":"0","nemo":"0"}'  where id = 72;
update th_rasp_ed set argumentos = '{"floor":"4","room":"13","zone":"54","type":"0","nemo":"0"}'  where id = 73;
update th_rasp_ed set argumentos = '{"floor":"5","room":"19","zone":"23","type":"0","nemo":"4"}'  where id = 87;

update th_rasp_dali_s set argumentos = '{"floor":"4","room":"13","zone":"53","type":"1","nemo":"0"}' where id = 50;
update th_rasp_dali_s set argumentos = '{"floor":"4","room":"13","zone":"54","type":"1","nemo":"0"}' where id = 51;
update th_rasp_dali_s set argumentos = '{"floor":"4","room":"48","zone":"55","type":"1","nemo":"0"}' where id = 52;
-- en trb_rasp_sd en la tp 102 y 103 no estaba bien domo, en la primera tenia 0 y en la segunda un 2
update trb_rasp_sd set domo = 1 where id = 102;
update trb_rasp_sd set domo = 1 where id = 103;


-- cocina
-- en trb_rasp_sd en la tp 147 y 148 no estaba bien domo, en la primera tenia 0 y en la segunda un 2
update trb_rasp_sd set domo = 1 where id = 147;
update trb_rasp_sd set domo = 1 where id = 148;

-- lavanderia no estaba bien cosido en th_rasp_ed  estaba codigo tp = 92 y 93 en lugar de 115 y 116 en id = 70 y 71
update th_rasp_ed set codigo_tp = 115 where id = 70;
update th_rasp_ed set codigo_tp = 116 where id = 71;

-- biblioteca
-- th ed usos varios estaba mal el codigo_tp
update th_rasp_ed set codigo_tp = 96 where id = 128;
-- estaba mal los th para la luz 33 estaba en estancia 21 y es estancia 47
update th_rasp_ed set argumentos = '{"floor":"4","room":"47","zone":"33","type":"0","nemo":"0"}' where id = 51;
update th_rasp_sd set argumentos = '{"floor":"4","room":"47","zone":"33","type":"0","nemo":"0"}'  where id = 130;
update th_rasp_dali_s set argumentos = '{"floor":"4","room":"47","zone":"33","type":"1","nemo":"0"}' where id = 33;

-- habitacion estudio en el th_dali de la escalera caracol esta mal cosido planta
update th_rasp_dali_s set argumentos ='{"floor":"8","room":"70","zone":"97","type":"1","nemo":"0"}' where id = 92;



-- FALLOS CLIMA
-- en habitacion 4 estaba cambiada el valor de domo en la entrada 2, estaba en la borna 9 en lugar de en la 10
update trb_rasp_ed set domo = 2 where id = 38;
update trb_rasp_ed set domo = 0 where id = 37;
-- en hab 4 estaba mal la zona del clima estaba la 28 en lugar de la 30
update th_rasp_ed set argumentos = '{"floor":"5","room":"30","zone":"3","type":"4","nemo":"2"}' where id = 143;

-- bar
-- en las bombillas de las entradas tenian domo = 0 en lugar de a 2
update trb_rasp_ed set domo = 2 where id = 102;
update trb_rasp_ed set domo = 2 where id = 103;
-- en las salidas multimedia no tenia domo = 10
update trb_rasp_sd set domo = 10 where id = 155;
update trb_rasp_sd set domo = 10 where id = 156;

-- en el th_rasp_ed tengo un socket de luz en el codigo_tp = 103 y la barra del bar solo tiene salida
update th_rasp_ed set inhibir = 1 where id = 57;

-- biblioteca
-- en trb ed no tenia tipo domo = 2 en bombilla
update trb_rasp_ed set domo = 2 where id = 94;

-- cocina
-- en trb_rasp_sd en la tp 157 y 145 actionamiento del piloto manual bombilla??
update trb_rasp_sd set domo = 2 where id = 157;
update trb_rasp_sd set domo = 2 where id = 158;

update trb_rasp_ed set domo = 2 where id = 189;
update trb_rasp_ed set domo = 2 where id = 190;

-- entrada comedor sala tv 2
-- estaba mal en las entradas escribian en tabla clima las valvulas en lugar de las bombillas
update trb_rasp_ed set domo = 2 where id = 133;
update trb_rasp_ed set domo = 2 where id = 134;
update trb_rasp_ed set domo = 0 where id = 178;
update trb_rasp_ed set domo = 0 where id = 179;


-- hab invitados
-- en la bombilla entrada no estaba tipo domo = 2
update trb_rasp_ed set domo = 2 where id = 80;


update comando set ip = '80.28.98.191',puerto = '53050' where id >= 30 and id <=37;
update comando set puerto = '53139' where id = 13;

update comando set puerto = '53139' where receptor = '0D2157';
update comando set puerto = '53134' where receptor = '0CAD82';
update comando set puerto = '53141' where receptor = '0D2738';
update comando set puerto = '53133' where receptor = '0C7B28';
update comando set puerto = '53137' where receptor = '0CB0BE';
update comando set puerto = '53139' where receptor = '0CB0D7';
update comando set puerto = '53139' where receptor = '0C6EF1';
update comando set puerto = '53144' where receptor = '0D273A';
update comando set puerto = '53144' where receptor = '0D2731';
update comando set puerto = '53144' where receptor = '0D2753';



-- PENDIENTE AÑADIR
-- piscina interior
-- hay un socket para la tp 171 que no existe
update th_rasp_sd set inhibir = 1 where id = 302;

-- estudio
-- no estaba en trb_ed domo = 2 en las bombillas
update trb_rasp_ed set domo = 2 where id = 197;
update trb_rasp_ed set domo = 2 where id = 198;
-- pte crear caso en clima, th_socket estudio, consigna??

-- en ibercomp conv 1
-- estaba cambiado en las entradas tiene domo = 2 la valvula en lugar de la bombilla
update trb_iber_8ed_conv set domo = 0 where codigo_rb = 207;
update trb_iber_8ed_conv set domo = 2 where id = 7;
update trb_iber_8ed_conv set domo = 2 where id = 8;

update trb_iber_8ed_conv set domo = 2 where id = 9;
update trb_iber_8ed_conv set domo = 2 where id = 10;
update trb_iber_8ed_conv set domo = 2 where id = 11;
update trb_iber_8ed_conv set domo = 2 where id = 12;

-- no tiene en las entradas th_sockt para las bombillas
-- bombilla hab alejandro
insert into th_iber_8ed_conv (codigo_tp, modulo,argumentos, inhibir) VALUES (7,4,'{"floor":"5","room":"22","zone":"14","type":"4","nemo":"2"}',0);
-- bombilla baño alejandro
insert into th_iber_8ed_conv (codigo_tp, modulo,argumentos, inhibir) VALUES (8,4,'{"floor":"5","room":"23","zone":"15","type":"4","nemo":"2"}',0);
-- bombilla vestidor alejandro
insert into th_iber_8ed_conv (codigo_tp, modulo,argumentos, inhibir) VALUES (9,4,'{"floor":"5","room":"53","zone":"16","type":"4","nemo":"2"}',0);
-- bombilla hab rachel
insert into th_iber_8ed_conv (codigo_tp, modulo,argumentos, inhibir) VALUES (10,4,'{"floor":"5","room":"24","zone":"17","type":"4","nemo":"2"}',0);
-- bombilla baño hab rachel
insert into th_iber_8ed_conv (codigo_tp, modulo,argumentos, inhibir) VALUES (11,4,'{"floor":"5","room":"25","zone":"18","type":"4","nemo":"2"}',0);
-- bombilla vestidor hab rachel
insert into th_iber_8ed_conv (codigo_tp, modulo,argumentos, inhibir) VALUES (13,4,'{"floor":"5","room":"54","zone":"19","type":"4","nemo":"2"}',0);

update trb_iber_8sd_conv set domo = 0 where id = 14;
update trb_iber_8sd_conv set domo = 0 where id = 16;

-- pte crear caso en clima, th_socket comedor(estancia = 13), consigna??

-- th cadena seg cocina
-- bombilla suelo radiante cocina alejandro
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir ) VALUES
(157, 3,'{"trb":"0","rb":"184","terminal":"14"}',0);
-- bombilla suelo radiante cocina principal
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir ) VALUES
(158, 3,'{"trb":"0","rb":"184","terminal":"15"}',0);


-- th cadena seg entrada comedor 2
-- valvula suelo radiante comedor
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir ) VALUES
(110, 3,'{"trb":"0","rb":"103","terminal":"5"}',0);
-- valvula suelo radiante sala tv
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir ) VALUES
(111, 3,'{"trb":"0","rb":"103","terminal":"4"}',0);


-- bombilla suelo radiante comedor
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir ) VALUES
(112, 3,'{"trb":"0","rb":"103","terminal":"3"}',0);
-- bombilla suelo radiante sala tv
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir ) VALUES
(113, 3,'{"trb":"0","rb":"103","terminal":"2"}',0);


-- valvula suelo radiante bar
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir ) VALUES
(151, 3,'{"trb":"0","rb":"103","terminal":"11"}',0);
-- valvula suelo radiante sala cine
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir ) VALUES
(152, 3,'{"trb":"0","rb":"103","terminal":"12"}',0);

