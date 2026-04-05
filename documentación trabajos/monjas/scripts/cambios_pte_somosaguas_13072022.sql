
-- AÑADIR PULSADOR
-- terminal_tpss bombilla suelo radiante
-- terminal_tpse estado suelo radiante
-- valves (valvula suelo radiante)
-- probes (la sonda)

-- pulsador bar
-- insert into th_rasp_pulsador (codigo_tp, modulo,argumentos,inhibir) VALUES
-- (8, 7,'{"trb_tpss":"7","rb_tpss":"70","terminal_tpss":"6","trb_tpse":"0","rb_tpse":"69","terminal_tpse":"8","valves":[{"trb": "7","rb": "104","terminal": "6"}],"probes":[{"trb": "1","rb": "73","terminal": "0"}]}"',0);


-- desactivar  valvula suelo radiante rb 38 tp_ 45
update iniciarhilostrb set inhibir = 1 where codigo_rb = 38 and bornas = 8;
update iniciarhilostrb set bornas = 10 where id = 79;

update th_rasp_ds18b20 set inhibir = 1 where codigo_tp = 5;


-- HABITACION ESTUDIO
insert into luces (nemo, codigo_estancia,estado,intensidad) VALUES
-- habitacion estudio
('focos techo',67,0,100),
('alumbrado',70,0,100);

insert into relacion_luces (codigo_luces, rb_e_estado, codigo_tp_e_estado, rb_s_estado, codigo_tp_s_estado, rb_dali1, codigo_tp_int1) VALUES
-- vestibulo hab estudio
(96,-1,-1,38,175,-1,-1),
-- alumbrado escalera caracol
(97,-1,-1,38,176,-1,-1);

update trb_rasp_sd set domo = 1 where id >=175 AND  id <=176;

insert into th_rasp_sd (codigo_tp,modulo,argumentos,inhibir) VALUES
(175 ,4,'{"floor":"3","room":"67","zone":"96","type":"0","nemo":"0"}',0),
(176 ,4,'{"floor":"8","room":"70","zone":"97","type":"0","nemo":"0"}',0);


-- habitacion estudio
insert into th_rasp_dali_s (codigo_tp,modulo,argumentos,inhibir) VALUES
(91,4,'{"floor":"3","room":"67","zone":"96","type":"1","nemo":"0"}',0),
(92,4,'{"floor":"3","room":"70","zone":"97","type":"1","nemo":"0"}',0);



-- ESTUDIO
insert into luces (nemo, codigo_estancia,estado,intensidad) VALUES
-- estudio
('Led estudio',9,0,100),
('Led chimenea',9,0,100),
('Focos techo estudio',9,0,100),
('Focos techo chimenea',9,0,100),
-- pecera
('Focos techo',10,0,100),
-- escalera caracol
('Focos techo',69,0,100);

update estancia set escenas = 1, ambientes = 1, rutinas = 1 where id = 9;

insert into relacion_luces (codigo_luces, rb_e_estado, codigo_tp_e_estado, rb_s_estado, codigo_tp_s_estado, rb_dali1, codigo_tp_int1) VALUES
-- estudio
(98,321,191,322,177,326,93),
(99,321,192,322,178,327,94),
(100,321,193,322,179,328,95),
(101,321,194,322,180,329,96),
-- pecera
(102,321,195,322,181,330,97),
-- alumbrado escalera caracol
(103,321,196,322,182,331,98);

insert into th_rasp_sd (codigo_tp,modulo,argumentos,inhibir) VALUES
(177 ,4,'{"floor":"3","room":"9","zone":"98","type":"0","nemo":"0"}',0),
(178 ,4,'{"floor":"3","room":"9","zone":"99","type":"0","nemo":"0"}',0),
(179 ,4,'{"floor":"3","room":"9","zone":"100","type":"0","nemo":"0"}',0),
(180 ,4,'{"floor":"3","room":"9","zone":"101","type":"0","nemo":"0"}',0),
(181 ,4,'{"floor":"3","room":"10","zone":"102","type":"0","nemo":"0"}',0),
(182 ,4,'{"floor":"8","room":"69","zone":"103","type":"0","nemo":"0"}',0);


insert into th_rasp_ed (codigo_tp,modulo,argumentos,inhibir) VALUES
(191 ,4,'{"floor":"3","room":"9","zone":"98","type":"0","nemo":"0"}',0),
(192 ,4,'{"floor":"3","room":"9","zone":"99","type":"0","nemo":"0"}',0),
(193 ,4,'{"floor":"3","room":"9","zone":"100","type":"0","nemo":"0"}',0),
(194 ,4,'{"floor":"3","room":"9","zone":"101","type":"0","nemo":"0"}',0),
(195 ,4,'{"floor":"3","room":"10","zone":"102","type":"0","nemo":"0"}',0),
(196 ,4,'{"floor":"8","room":"69","zone":"103","type":"0","nemo":"0"}',0);


insert into th_rasp_dali_s (codigo_tp,modulo,argumentos,inhibir) VALUES
(93 ,4,'{"floor":"3","room":"9","zone":"98","type":"1","nemo":"0"}',0),
(94 ,4,'{"floor":"3","room":"9","zone":"99","type":"1","nemo":"0"}',0),
(95 ,4,'{"floor":"3","room":"9","zone":"100","type":"1","nemo":"0"}',0),
(96 ,4,'{"floor":"3","room":"9","zone":"101","type":"1","nemo":"0"}',0),
(97 ,4,'{"floor":"3","room":"10","zone":"102","type":"1","nemo":"0"}',0),
(98 ,4,'{"floor":"8","room":"69","zone":"103","type":"1","nemo":"0"}',0);

update trb_rasp_ed set domo = 1 where id >=191 AND  id <=196;

update trb_rasp_sd set domo = 1 where id >=177 AND id <=182;

update trb_rasp_dali_s set domo = 1;



-- escenas -- estudio
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 9, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0),
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(98,289, 0,100,NULL),
(99,290, 0,100,NULL),
(100,291, 0,100,NULL),
(101,292, 0,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(245,289),
(245,290),
(245,291),
(245,292);

insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('maxima', 9, 0, 1, 1);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0),
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(98,293, 1,100,NULL),
(99,294, 1,100,NULL),
(100,295, 1,100,NULL),
(101,296, 1,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(246,293),
(246,294),
(246,295),
(246,296);

insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 9, 0, 1, 2);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0),
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(98,297, 1,50,NULL),
(99,298, 1,50,NULL),
(100,299, 1,50,NULL),
(101,300, 1,50,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(247,297),
(247,298),
(247,299),
(247,300);

insert into escenas (codigo_estancia, nemo, estado, tipodomo, tipo, eliminado) VALUES
(9,'eco',0,1,2,0);
insert into escenas (codigo_estancia, nemo, estado, tipodomo, tipo, eliminado) VALUES
(9,'romantic',0,1,2,0);
insert into escenas (codigo_estancia, nemo, estado, tipodomo, tipo, eliminado) VALUES
(9,'cine',0,1,2,0);

-- GIMNASIO
insert into luces (nemo, codigo_estancia,estado,intensidad) VALUES
('Focos techo',40,0,-1),
('Led techo',40,0,-1);



insert into relacion_luces (codigo_luces, rb_e_estado, codigo_tp_e_estado, rb_s_estado, codigo_tp_s_estado, rb_dali1, codigo_tp_int1) VALUES
-- gimansio
(104,-1,-1,312,159,-1,-1),
(105,-1,-1,312,160,-1,-1);

insert into th_rasp_sd (codigo_tp,modulo,argumentos,inhibir) VALUES
(159 ,4,'{"floor":"7","room":"40","zone":"104","type":"0","nemo":"0"}',0),
(160 ,4,'{"floor":"7","room":"40","zone":"105","type":"0","nemo":"0"}',0);

update trb_rasp_sd set domo = 1 where id >=104 AND id <=105;

update estancia set escenas = 1, ambientes = 1, rutinas = 1 where id = 40;
update trb_rasp_sd set domo = 1 where id = 159;
update trb_rasp_sd set domo = 1 where id = 160;

-- escenas -- gimnasio
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 40, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(104,301, 0,100,NULL),
(105,302, 0,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(251,301),
(251,302);

insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('maxima', 40, 0, 1, 1);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(104,303, 1,-1,NULL),
(105,304, 1,-1,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(252,303),
(252,304);


-- PISCINA INTERIOR

insert into luces (nemo, codigo_estancia,estado, intensidad) VALUES
-- piscina
('Focos techo Vestibulo',60,0,-1),
-- baño1
('Focos techo Baño 1 ',58,0,-1),
('Led Espejo Baño 1',58,0,-1),
-- baño2
('Focos techo Baño 2',59,0,-1),
-- perimetro
('Led perimetro techo ',41,0,-1),
('Led hamacas interiores',41,0,-1);


update estancia set escenas = 1, ambientes = 1, rutinas = 1 where id = 58;
update estancia set escenas = 1, ambientes = 1, rutinas = 1 where id = 41;
update trb_rasp_sd set domo = 1 where id = 165 AND  id <= 170;


insert into relacion_luces (codigo_luces, rb_e_estado, codigo_tp_e_estado, rb_s_estado, codigo_tp_s_estado, rb_dali1, codigo_tp_int1) VALUES
-- piscina
(106,-1,-1,315,165,-1,-1),
-- baño1
(107,-1,-1,315,166,-1,-1),
(108,-1,-1,315,167,-1,-1),
-- baño2
(109,-1,-1,315,168,-1,-1),
-- perimetro
(110,-1,-1,315,169,-1,-1),
(111,-1,-1,315,170,-1,-1);

insert into th_rasp_sd (codigo_tp,modulo,argumentos,inhibir) VALUES
(165 ,4,'{"floor":"7","room":"60","zone":"106","type":"0","nemo":"0"}',0),
(166 ,4,'{"floor":"7","room":"58","zone":"107","type":"0","nemo":"0"}',0),
(167 ,4,'{"floor":"7","room":"58","zone":"108","type":"0","nemo":"0"}',0),
(168 ,4,'{"floor":"7","room":"59","zone":"109","type":"0","nemo":"0"}',0),
(169 ,4,'{"floor":"7","room":"41","zone":"110","type":"0","nemo":"0"}',0),
(170 ,4,'{"floor":"7","room":"41","zone":"111","type":"0","nemo":"0"}',0);

update trb_rasp_sd set domo = 1 where id >=165 AND id <=170;



-- escenas -- piscina
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 58, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(107,305, 0,100,NULL),
(108,306, 0,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(253,305),
(253,306);

insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('maxima', 58, 0, 1, 1);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(107,307, 1,-1,NULL),
(108,308, 1,-1,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(254,307),
(254,308);


insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 41, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(107,309, 0,100,NULL),
(108,310, 0,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(255,309),
(255,310);

insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('maxima', 41, 0, 1, 1);

insert into operacion (tipodomo, estado) VALUES
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
(107,311, 1,-1,NULL),
(108,312, 1,-1,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
(256,311),
(256,312);


-- clima NO TENGO VALVULA
-- insert into clima (nemo, codigo_estancia) VALUES
-- ('Pecera', 10);

-- insert into relacion_clima (codigo_clima, codigo_variables, rb_temp, codigo_tp_temp, rb_estado, codigo_tp_estado  ) VALUES
-- -- pecera
-- (24, 3, 325, 26, 322, 184);


-- insert into th_rasp_ds18b20 (codigo_tp, modulo, argumentos, inhibir)
-- (26,6, '{"cod_consigna":"39","cod_rango":"40","trb_tpss":"7","rb_tpss":"104","terminal_tpss":"0","trb_tpse":"0","rb_tpse":"103","terminal_tpse":"5","id_climate":"1"} ', 0);

-- update trb_rasp_ds18b20 set domo = 2 where id =26;

-- NO TENGO BOMBILLA
-- insert into th_rasp_pulsador (codigo_tp, modulo, argumentos, inhibir)
-- (21, 7, '{"trb_tpss":"7","rb_tpss":"185","terminal_tpss":"13","trb_tpse":"0","rb_tpse":"184","terminal_tpse":"15","valves":[{"trb": "23","rb": "211","terminal": "3"}],"probes":[{"trb": "1","rb": "187","terminal": "0"}]}"',0);


/************************************DE AQUI PARA ABAJO YA LO HE SUBIDO*/
-- bar
update th_rasp_sd set argumentos = '{"floor":"4","room":"14","zone":"35","type":"0","nemo":"0"}' where codigo_tp = 74 AND modulo = 4;
update th_rasp_sd set argumentos = '{"floor":"4","room":"14","zone":"36","type":"0","nemo":"0"}' where codigo_tp = 75 AND modulo = 4;

update th_rasp_ed set argumentos = '{"floor":"4","room":"14","zone":"35","type":"0","nemo":"0"}' where codigo_tp = 98 AND modulo = 4;
update th_rasp_ed set argumentos = '{"floor":"4","room":"14","zone":"36","type":"0","nemo":"0"}' where codigo_tp = 99 AND modulo = 4;

update operacion_luces set intensidad = -1 where codigo_operacion = 224;

update th_rasp_pulsador set codigo_tp = 8 where id = 15;
update th_rasp_pulsador set codigo_tp = 9 where id = 16;


-- terraza sala tv
update th_rasp_sd set argumentos = '{"floor":"4","room":"72","zone":"59","type":"0","nemo":"0"}' where codigo_tp = 100 AND modulo = 4;
update th_rasp_sd set argumentos = '{"floor":"4","room":"72","zone":"60","type":"0","nemo":"0"}' where codigo_tp = 101 AND modulo = 4;

update th_rasp_ed set argumentos = '{"floor":"4","room":"72","zone":"59","type":"0","nemo":"0"}' where codigo_tp = 123 AND modulo = 4;
update th_rasp_ed set argumentos = '{"floor":"4","room":"72","zone":"60","type":"0","nemo":"0"}' where codigo_tp = 124 AND modulo = 4;

update th_rasp_dali_s set argumentos = '{"floor":"4","room":"72","zone":"59","type":"1","nemo":"0"}' where codigo_tp = 56 AND modulo = 4;
update th_rasp_dali_s set argumentos = '{"floor":"4","room":"72","zone":"60","type":"1","nemo":"0"}' where codigo_tp = 57 AND modulo = 4;

-- baño cortesia
update th_rasp_sd set argumentos = '{"floor":"4","room":"73","zone":"61","type":"0","nemo":"0"}' where codigo_tp = 102 AND modulo = 4;
update th_rasp_sd set argumentos = '{"floor":"4","room":"73","zone":"62","type":"0","nemo":"0"}' where codigo_tp = 103 AND modulo = 4;

update th_rasp_ed set argumentos = '{"floor":"4","room":"73","zone":"61","type":"0","nemo":"0"}' where codigo_tp = 125 AND modulo = 4;
update th_rasp_ed set argumentos = '{"floor":"4","room":"73","zone":"62","type":"0","nemo":"0"}' where codigo_tp = 126 AND modulo = 4;

update th_rasp_dali_s set argumentos = '{"floor":"4","room":"73","zone":"61","type":"1","nemo":"0"}' where codigo_tp = 58 AND modulo = 4;
update th_rasp_dali_s set argumentos = '{"floor":"4","room":"73","zone":"62","type":"1","nemo":"0"}' where codigo_tp = 59 AND modulo = 4;


-- PASILLO HABITACIONES
insert into variables (nemo,valor, tipo) VALUES ('consigna_temp_pas_hab',22,1);
insert into variables (nemo,valor, tipo) VALUES ('rango_temp_pas_hab',1,1);

insert into th_rasp_ds18b20 (codigo_tp, modulo, argumentos, inhibir) VALUES
(22,6,'{"cod_consigna":"41","cod_rango":"42","trb_tpss":"23","rb_tpss":"209","terminal_tpss":"2","trb_tpse":"21","rb_tpse":"210","terminal_tpse":"2","id_climate":"1"}',0);

update relacion_clima set rb_estado = 211, codigo_tp_estado = 15 where codigo_clima = 22;



-- estaban mal los socket de los dalis
-- HABITACION 2
update th_rasp_dali_s set argumentos = '{"floor":"5","room":"26","zone":"1","type":"1","nemo":"0"}' where id = 1;
update th_rasp_dali_s set argumentos = '{"floor":"5","room":"26","zone":"2","type":"1","nemo":"0"}' where id = 2;
update th_rasp_dali_s set argumentos = '{"floor":"5","room":"26","zone":"3","type":"1","nemo":"0"}' where id = 3;
-- BAÑO HABITACION 2
update th_rasp_dali_s set argumentos = '{"floor":"5","room":"27","zone":"4","type":"1","nemo":"0"}' where id = 4;
update th_rasp_dali_s set argumentos = '{"floor":"5","room":"27","zone":"5","type":"1","nemo":"0"}' where id = 5;

-- HABITACION 3
update th_rasp_dali_s set codigo_tp = 6, argumentos = '{"floor":"5","room":"28","zone":"6","type":"1","nemo":"0"}' where id = 6;
update th_rasp_dali_s set argumentos = '{"floor":"5","room":"28","zone":"7","type":"1","nemo":"0"}' where id = 7;
update th_rasp_dali_s set argumentos = '{"floor":"5","room":"28","zone":"8","type":"1","nemo":"0"}' where id = 8;
-- BAÑO HABITACION 3
update th_rasp_dali_s set argumentos = '{"floor":"5","room":"29","zone":"9","type":"1","nemo":"0"}' where id = 9;
update th_rasp_dali_s set argumentos = '{"floor":"5","room":"29","zone":"10","type":"1","nemo":"0"}' where id = 10;


-- HABITACION 4
update th_rasp_dali_s set argumentos = '{"floor":"5","room":"30","zone":"11","type":"1","nemo":"0"}' where id = 11;
update th_rasp_dali_s set argumentos = '{"floor":"5","room":"30","zone":"12","type":"1","nemo":"0"}' where id = 12;
update th_rasp_dali_s set argumentos = '{"floor":"5","room":"30","zone":"13","type":"1","nemo":"0"}' where id = 13;
-- BAÑO HABITACION 4
update th_rasp_dali_s set argumentos = '{"floor":"5","room":"31","zone":"14","type":"1","nemo":"0"}' where id = 14;
update th_rasp_dali_s set argumentos = '{"floor":"5","room":"31","zone":"15","type":"1","nemo":"0"}' where id = 15;


-- HABITACION 5
update th_rasp_dali_s set argumentos = '{"floor":"5","room":"32","zone":"16","type":"1","nemo":"0"}' where id = 16;
update th_rasp_dali_s set argumentos = '{"floor":"5","room":"32","zone":"17","type":"1","nemo":"0"}' where id = 17;
update th_rasp_dali_s set argumentos = '{"floor":"5","room":"32","zone":"18","type":"1","nemo":"0"}' where id = 18;
-- BAÑO HABITACION 5
update th_rasp_dali_s set argumentos = '{"floor":"5","room":"33","zone":"19","type":"1","nemo":"0"}' where id = 19;
update th_rasp_dali_s set argumentos = '{"floor":"5","room":"33","zone":"20","type":"1","nemo":"0"}' where id = 20;

-- HABITACION ESTUDIO
update th_rasp_dali_s set argumentos = '{"floor":"3","room":"11","zone":"21","type":"1","nemo":"0"}' where id = 21;
update th_rasp_dali_s set argumentos = '{"floor":"3","room":"11","zone":"22","type":"1","nemo":"0"}' where id = 22;
update th_rasp_dali_s set argumentos = '{"floor":"3","room":"11","zone":"23","type":"1","nemo":"0"}' where id = 23;

-- BAÑO ESTUDIO
update th_rasp_dali_s set argumentos = '{"floor":"3","room":"12","zone":"24","type":"1","nemo":"0"}' where id = 24;
update th_rasp_dali_s set argumentos = '{"floor":"3","room":"12","zone":"25","type":"1","nemo":"0"}' where id = 25;


-- HABITACION INVITADOS
update th_rasp_dali_s set argumentos = '{"floor":"6","room":"34","zone":"26","type":"1","nemo":"0"}' where id = 26;
update th_rasp_dali_s set argumentos = '{"floor":"6","room":"34","zone":"27","type":"1","nemo":"0"}' where id = 27;
update th_rasp_dali_s set argumentos = '{"floor":"6","room":"34","zone":"28","type":"1","nemo":"0"}' where id = 28;
update th_rasp_dali_s set argumentos = '{"floor":"6","room":"35","zone":"29","type":"1","nemo":"0"}' where id = 29;
update th_rasp_dali_s set argumentos = '{"floor":"6","room":"35","zone":"30","type":"1","nemo":"0"}' where id = 30;



-- desactivar dalis invitados
update iniciarhilostrb set inhibir = 1 where argumentos like '%"53149"%' and trb = 3;
update iniciarhilostrb set inhibir = 1 where argumentos like '%"53149"%' and trb = 8;


-- cambiar id mutex dalis
update iniciarhilostrb set argumentos =  REPLACE (argumentos,'"id":"2"','"id":"0"') where argumentos like '%"53138"%' and trb = 3;
update iniciarhilostrb set argumentos =  REPLACE (argumentos,'"id":"10"','"id":"0"') where argumentos like '%"53138"%' and trb = 8;

update rb set mutex = 0 where id >=108 AND id <=118;
update rb set mutex = 0 where id >=233 AND id <=244;

update iniciarhilostrb set argumentos =  REPLACE (argumentos,'"id":"0"','"id":"1"') where argumentos like '%"53139"%' and trb = 3;
update iniciarhilostrb set argumentos =  REPLACE (argumentos,'"id":"11"','"id":"1"') where argumentos like '%"53139"%' and trb = 8;

update rb set mutex = 1 where id >=158 AND id <=173;
update rb set mutex = 1 where id >=216 AND id <=231;

update iniciarhilostrb set argumentos =  REPLACE (argumentos,'"id":"1"','"id":"2"') where argumentos like '%"53140"%' and trb = 3;
update iniciarhilostrb set argumentos =  REPLACE (argumentos,'"id":"12"','"id":"2"') where argumentos like '%"53140"%' and trb = 8;

update rb set mutex = 2 where id =1;
update rb set mutex = 2 where id =1;


-- update iniciarhilostrb set argumentos =  REPLACE (argumentos,'"id":"3"','"id":"3"') where argumentos like '%"53142"%' and trb = 3;
update iniciarhilostrb set argumentos =  REPLACE (argumentos,'"id":"7"','"id":"3"') where argumentos like '%"53142"%' and trb = 8;

update rb set mutex = 3 where id >=75 AND id <=79;
update rb set mutex = 3 where id >=245 AND id <=249;

update iniciarhilostrb set argumentos =  REPLACE (argumentos,'"id":"11"','"id":"4"') where argumentos like '%"53149"%' and trb = 3;
update iniciarhilostrb set argumentos =  REPLACE (argumentos,'"id":"5"','"id":"4"') where argumentos like '%"53149"%' and trb = 8;

update rb set mutex = 4 where id >=50 AND id <=54;
update rb set mutex = 4 where id >=290 AND id <=294;


update iniciarhilostrb set argumentos =  REPLACE (argumentos,'"id":"4"','"id":"5"') where argumentos like '%"53130"%' and trb = 3;
update iniciarhilostrb set argumentos =  REPLACE (argumentos,'"id":"13"','"id":"5"') where argumentos like '%"53130"%' and trb = 8;

update rb set mutex = 5 where id >=191 AND id <=202;
update rb set mutex = 5 where id >=250 AND id <=261;


update iniciarhilostrb set argumentos =  REPLACE (argumentos,'"id":"13"','"id":"6"') where argumentos like '%"53131"%' and trb = 3;
update iniciarhilostrb set argumentos =  REPLACE (argumentos,'"id":"9"','"id":"6"') where argumentos like '%"53131"%' and trb = 8;

update rb set mutex = 6 where id >=98 AND id <=99;
update rb set mutex = 6 where id >=304 AND id <=305;


-- 53132 no tiene dalis programados
update iniciarhilostrb set argumentos =  REPLACE (argumentos,'"id":"8"','"id":"7"') where argumentos like '%"53133"%' and trb = 3;
update iniciarhilostrb set argumentos =  REPLACE (argumentos,'"id":"2"','"id":"7"') where argumentos like '%"53133"%' and trb = 8;

update rb set mutex = 7 where id >=23 AND id <=27;
update rb set mutex = 7 where id >=273 AND id <=279;


update iniciarhilostrb set argumentos =  REPLACE (argumentos,'"id":"9"','"id":"8"') where argumentos like '%"53134"%' and trb = 3;
update iniciarhilostrb set argumentos =  REPLACE (argumentos,'"id":"3"','"id":"8"') where argumentos like '%"53134"%' and trb = 8;

update rb set mutex = 8 where id >=32 AND id <=36;
update rb set mutex = 8 where id >=280 AND id <=284;


update iniciarhilostrb set argumentos =  REPLACE (argumentos,'"id":"12"','"id":"9"') where argumentos like '%"53135"%' and trb = 3;
update iniciarhilostrb set argumentos =  REPLACE (argumentos,'"id":"8"','"id":"9"') where argumentos like '%"53135"%' and trb = 8;


update rb set mutex = 9 where id >=86 AND id <=94;
update rb set mutex = 9 where id >=295 AND id <=303;

-- 53136 no tiene
update iniciarhilostrb set argumentos =  REPLACE (argumentos,'"id":"6"','"id":"10"') where argumentos like '%"53137"%' and trb = 3;
update iniciarhilostrb set argumentos =  REPLACE (argumentos,'"id":"0"','"id":"10"') where argumentos like '%"53137"%' and trb = 8;

update rb set mutex = 10 where id >=4 AND id <=8;
update rb set mutex = 10 where id >=265 AND id <=269;


update iniciarhilostrb set argumentos =  REPLACE (argumentos,'"id":"7"','"id":"11"') where argumentos like '%"53141"%' and trb = 3;
update iniciarhilostrb set argumentos =  REPLACE (argumentos,'"id":"1"','"id":"11"') where argumentos like '%"53141"%' and trb = 8;

update rb set mutex = 11 where id >=14 AND id <=18;
update rb set mutex = 11 where id >=270 AND id <=274;


update iniciarhilostrb set argumentos =  REPLACE (argumentos,'"id":"5"','"id":"12"') where argumentos like '%"53143"%' and trb = 3;
update iniciarhilostrb set argumentos =  REPLACE (argumentos,'"id":"6"','"id":"12"') where argumentos like '%"53143"%' and trb = 8;

update rb set mutex = 12 where id >=65 AND id <=67;
update rb set mutex = 12 where id >=262 AND id <=264;

update iniciarhilostrb set argumentos =  REPLACE (argumentos,'"id":"10"','"id":"13"') where argumentos like '%"53144"%' and trb = 3;
update iniciarhilostrb set argumentos =  REPLACE (argumentos,'"id":"4"','"id":"13"') where argumentos like '%"53144"%' and trb = 8;

update rb set mutex = 13 where id >=41 AND id <=45;
update rb set mutex = 13 where id >=285 AND id <=289;
update rb set mutex = 13 where id =317;


DROP TRIGGER IF EXISTS trigger_operacion_escena;


/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50003 TRIGGER trigger_operacion_escena
   AFTER UPDATE ON operacion
   FOR EACH ROW
   BEGIN

   DECLARE v_codigo_escena INT;
   DECLARE v_estado_escena INT;
   DECLARE v_hay_caso_1 INT;
   DECLARE v_num_ope INT;
   DECLARE v_cod_estancia INT;
   DECLARE v_escena_aux INT;

   DECLARE done INT DEFAULT 0;
   DECLARE cod_escena INT;

   DECLARE cursor_escena CURSOR FOR SELECT a.codigo_escena
   FROM relacion_escena_operacion as a
   INNER JOIN escenas as b
   ON b.id=a.codigo_escena
   WHERE a.codigo_operacion = NEW.id
   AND b.eliminado = 0;

   DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

   OPEN cursor_escena;

   read_loop: LOOP

   FETCH cursor_escena INTO cod_escena;

   IF done THEN
   LEAVE read_loop;
   END IF;

   IF cod_escena IS NOT NULL THEN
      SELECT COUNT(a.codigo_operacion)
      INTO v_num_ope
      FROM relacion_escena_operacion as a
      WHERE a.codigo_escena=cod_escena;

      SELECT COUNT(a.codigo_operacion)
      INTO v_hay_caso_1
      FROM relacion_escena_operacion as a
      JOIN operacion as b
      ON a.codigo_operacion = b.id
      WHERE a.codigo_escena=cod_escena and b.estado = 1;

      SELECT estado, codigo_estancia
      INTO v_estado_escena,v_cod_estancia
      FROM escenas
      WHERE id = cod_escena;

      IF (v_hay_caso_1 = v_num_ope) THEN
         CASE
            WHEN v_estado_escena = 0 THEN
               SELECT id
               INTO v_escena_aux
               FROM escenas
               WHERE codigo_estancia = v_cod_estancia AND estado != 0;


               UPDATE escenas SET estado = 0 WHERE codigo_estancia = v_cod_estancia and estado != 0;

               UPDATE escenas SET estado = 1 WHERE id =cod_escena;
               SET @exec_var = sys_exec(CONCAT("curl -d scene_id=",cod_escena," POST http://localhost:1519/ddbb/activateScene"));

               SET @exec_var = sys_exec(CONCAT("curl -d scene_id=",v_escena_aux," POST http://localhost:1519/ddbb/desactivateScene"));

            WHEN v_estado_escena = 2 THEN

               UPDATE escenas SET estado = 1 WHERE id =cod_escena;
               SET @exec_var = sys_exec(CONCAT("curl -d scene_id=",cod_escena," POST http://localhost:1519/ddbb/activateScene"));
            ELSE
               BEGIN
               END;
         END CASE;
      ELSEIF (v_hay_caso_1 != v_num_ope) THEN
         CASE
            WHEN v_estado_escena = 1 THEN
               UPDATE escenas SET estado = 2 WHERE id =cod_escena;
               SET @exec_var = sys_exec(CONCAT("curl -d scene_id=",cod_escena," POST http://localhost:1519/ddbb/modifyScene"));
            ELSE
               BEGIN
               END;
         END CASE;
      END IF;
   END IF;

   END LOOP;

   CLOSE cursor_escena;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
