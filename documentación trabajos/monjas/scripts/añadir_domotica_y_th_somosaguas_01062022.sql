


-- LUCES
-- habitacion 2
insert luces (fecha, nemo, codigo_estancia,estado,intensidad,rgb) values
(now(),'techo armario',38,1,100,NULL);
insert luces (fecha, nemo, codigo_estancia,estado,intensidad,rgb) values
(now(),'techo cabecero',38,1,100,NULL);
-- baño habitacion2
insert luces (fecha, nemo, codigo_estancia,estado,intensidad,rgb) values
(now(),'techo baño',39,1,100,NULL);
insert luces (fecha, nemo, codigo_estancia,estado,intensidad,rgb) values
(now(),'espejo baño',39,1,-1,NULL);
-- habitacion 1
insert luces (fecha, nemo, codigo_estancia,estado,intensidad,rgb) values
(now(),'techo armario',36,1,100,NULL);
insert luces (fecha, nemo, codigo_estancia,estado,intensidad,rgb) values
(now(),'techo cabecero',36,1,100,NULL);
-- baño habitacion1
insert luces (fecha, nemo, codigo_estancia,estado,intensidad,rgb) values
(now(),'techo baño',37,1,100,NULL);
insert luces (fecha, nemo, codigo_estancia,estado,intensidad,rgb) values
(now(),'espejo baño',37,1,-1,NULL);
-- vestibulo
insert luces (fecha, nemo, codigo_estancia,estado,intensidad,rgb) values
(now(),'techo vestibulo',45,1,100,NULL);
insert luces (fecha, nemo, codigo_estancia,estado,intensidad,rgb) values
(now(),'techo cocina/comedor',44,1,100,NULL);
insert luces (fecha, nemo, codigo_estancia,estado,intensidad,rgb) values
(now(),'exterior escaleras servicio',44,1,100,NULL);
-- lavanderia
insert luces (fecha, nemo, codigo_estancia,estado,intensidad,rgb) values
(now(),'pasillo lavanderia',43,1,100,NULL);
insert luces (fecha, nemo, codigo_estancia,estado,intensidad,rgb) values
(now(),'lavanderia',43,1,100,NULL);

-- ENTRADA COMEDOR SALA TV
-- pasillo
insert luces (fecha, nemo, codigo_estancia,estado,intensidad,rgb) values
(now(),'led perimetro pasillo',19,1,100,NULL);
insert luces (fecha, nemo, codigo_estancia,estado,intensidad,rgb) values
(now(),'focos techo pasillo sala tv',19,1,100,NULL);
insert luces (fecha, nemo, codigo_estancia,estado,intensidad,rgb) values
(now(),'focos techo pasillo habitaciones',19,1,100,NULL);

-- comedor
insert luces (fecha, nemo, codigo_estancia,estado,intensidad,rgb) values
(now(),'focos techo centro comedor',13,1,100,NULL);
insert luces (fecha, nemo, codigo_estancia,estado,intensidad,rgb) values
(now(),'focos techo laterales comedor',13,1,100,NULL);

-- sala tv
insert luces (fecha, nemo, codigo_estancia,estado,intensidad,rgb) values
(now(),'focos techo sala tv',46,1,100,NULL);
insert luces (fecha, nemo, codigo_estancia,estado,intensidad,rgb) values
(now(),'focos terraza sala tv',46,1,100,NULL);
insert luces (fecha, nemo, codigo_estancia,estado,intensidad,rgb) values
(now(),'led terraza sala tv',46,1,100,NULL);

-- entrada
insert luces (fecha, nemo, codigo_estancia,estado,intensidad,rgb) values
(now(),'focos techo baño cortesia',16,1,100,NULL);
insert luces (fecha, nemo, codigo_estancia,estado,intensidad,rgb) values
(now(),'espejo techo baño cortesia',16,1,100,NULL);
insert luces (fecha, nemo, codigo_estancia,estado,intensidad,rgb) values
(now(),'led perimetro exterior',16,1,100,NULL);
insert luces (fecha, nemo, codigo_estancia,estado,intensidad,rgb) values
(now(),'led entrada principal',16,1,100,NULL);



-- habitacion 2
insert into relacion_luces (codigo_luces, rb_e_estado, codigo_tp_e_estado, rb_s_estado, codigo_tp_s_estado, rb_dali1, codigo_tp_int1) VALUES
(40,80,104,81,81,86,39);
insert into relacion_luces (codigo_luces, rb_e_estado, codigo_tp_e_estado, rb_s_estado, codigo_tp_s_estado, rb_dali1, codigo_tp_int1) VALUES
(41,80,105,81,82,87,40);
-- baño habitacion 2
insert into relacion_luces (codigo_luces, rb_e_estado, codigo_tp_e_estado, rb_s_estado, codigo_tp_s_estado, rb_dali1, codigo_tp_int1) VALUES
(42,80,106,81,83,88,41);
insert into relacion_luces (codigo_luces, rb_e_estado, codigo_tp_e_estado, rb_s_estado, codigo_tp_s_estado, rb_dali1, codigo_tp_int1) VALUES
(43,80,107,81,84,-1,-1);
update trb_rasp_ed set domo = 1 where id =104;
update trb_rasp_sd set domo = 1 where id =81;
update trb_rasp_ed set domo = 1 where id =105;
update trb_rasp_sd set domo = 1 where id =82;
update trb_rasp_ed set domo = 1 where id =106;
update trb_rasp_sd set domo = 1 where id =83;
update trb_rasp_ed set domo = 1 where id =107;
update trb_rasp_sd set domo = 1 where id =84;


-- habitacion 1
insert into relacion_luces (codigo_luces, rb_e_estado, codigo_tp_e_estado, rb_s_estado, codigo_tp_s_estado, rb_dali1, codigo_tp_int1) VALUES
(44,80,108,81,85,89,42);
insert into relacion_luces (codigo_luces, rb_e_estado, codigo_tp_e_estado, rb_s_estado, codigo_tp_s_estado, rb_dali1, codigo_tp_int1) VALUES
(45,80,109,81,86,90,43);
-- baño habitacion 1
insert into relacion_luces (codigo_luces, rb_e_estado, codigo_tp_e_estado, rb_s_estado, codigo_tp_s_estado, rb_dali1, codigo_tp_int1) VALUES
(46,80,110,81,87,91,44);
insert into relacion_luces (codigo_luces, rb_e_estado, codigo_tp_e_estado, rb_s_estado, codigo_tp_s_estado, rb_dali1, codigo_tp_int1) VALUES
(47,80,111,81,88,-1,-1);
update trb_rasp_ed set domo = 1 where id =108;
update trb_rasp_sd set domo = 1 where id =85;
update trb_rasp_ed set domo = 1 where id =109;
update trb_rasp_sd set domo = 1 where id =86;
update trb_rasp_ed set domo = 1 where id =110;
update trb_rasp_sd set domo = 1 where id =87;
update trb_rasp_ed set domo = 1 where id =111;
update trb_rasp_sd set domo = 1 where id =88;

-- vestibulo
insert into relacion_luces (codigo_luces, rb_e_estado, codigo_tp_e_estado, rb_s_estado, codigo_tp_s_estado, rb_dali1, codigo_tp_int1) VALUES
(48,80,112,81,89,92,45);
insert into relacion_luces (codigo_luces, rb_e_estado, codigo_tp_e_estado, rb_s_estado, codigo_tp_s_estado, rb_dali1, codigo_tp_int1) VALUES
(49,80,113,81,90,93,46);
insert into relacion_luces (codigo_luces, rb_e_estado, codigo_tp_e_estado, rb_s_estado, codigo_tp_s_estado, rb_dali1, codigo_tp_int1) VALUES
(50,80,114,81,91,94,47);
update trb_rasp_ed set domo = 1 where id =112;
update trb_rasp_sd set domo = 1 where id =89;
update trb_rasp_ed set domo = 1 where id =113;
update trb_rasp_sd set domo = 1 where id =90;
update trb_rasp_ed set domo = 1 where id =114;
update trb_rasp_sd set domo = 1 where id =91;

-- lavanderia
insert into relacion_luces (codigo_luces, rb_e_estado, codigo_tp_e_estado, rb_s_estado, codigo_tp_s_estado, rb_dali1, codigo_tp_int1) VALUES
(51,95,115,96,92,98,48);
insert into relacion_luces (codigo_luces, rb_e_estado, codigo_tp_e_estado, rb_s_estado, codigo_tp_s_estado, rb_dali1, codigo_tp_int1) VALUES
(52,95,116,96,93,99,49);

update trb_rasp_ed set domo = 1 where id =115;
update trb_rasp_sd set domo = 1 where id =92;
update trb_rasp_ed set domo = 1 where id =116;
update trb_rasp_sd set domo = 1 where id =93;

-- ENTRADA COMEDOR SALA TV

-- pasillo
insert into relacion_luces (codigo_luces, rb_e_estado, codigo_tp_e_estado, rb_s_estado, codigo_tp_s_estado, rb_dali1, codigo_tp_int1) VALUES
(53,100,117,101,94,107,50);
insert into relacion_luces (codigo_luces, rb_e_estado, codigo_tp_e_estado, rb_s_estado, codigo_tp_s_estado, rb_dali1, codigo_tp_int1) VALUES
(54,100,120,101,97,110,53);
insert into relacion_luces (codigo_luces, rb_e_estado, codigo_tp_e_estado, rb_s_estado, codigo_tp_s_estado, rb_dali1, codigo_tp_int1) VALUES
(55,100,121,101,98,111,54);

update trb_rasp_ed set domo = 1 where id =117;
update trb_rasp_sd set domo = 1 where id =94;
update trb_rasp_ed set domo = 1 where id =120;
update trb_rasp_sd set domo = 1 where id =97;
update trb_rasp_ed set domo = 1 where id =121;
update trb_rasp_sd set domo = 1 where id =98;

-- comedor
insert into relacion_luces (codigo_luces, rb_e_estado, codigo_tp_e_estado, rb_s_estado, codigo_tp_s_estado, rb_dali1, codigo_tp_int1) VALUES
(56,100,118,101,95,108,51);
insert into relacion_luces (codigo_luces, rb_e_estado, codigo_tp_e_estado, rb_s_estado, codigo_tp_s_estado, rb_dali1, codigo_tp_int1) VALUES
(57,100,119,101,96,109,52);

update trb_rasp_ed set domo = 1 where id =118;
update trb_rasp_sd set domo = 1 where id =95;
update trb_rasp_ed set domo = 1 where id =119;
update trb_rasp_sd set domo = 1 where id =96;


-- sala tv
insert into relacion_luces (codigo_luces, rb_e_estado, codigo_tp_e_estado, rb_s_estado, codigo_tp_s_estado, rb_dali1, codigo_tp_int1) VALUES
(58,100,122,101,99,112,55);
insert into relacion_luces (codigo_luces, rb_e_estado, codigo_tp_e_estado, rb_s_estado, codigo_tp_s_estado, rb_dali1, codigo_tp_int1) VALUES
(59,100,123,101,100,113,56);
insert into relacion_luces (codigo_luces, rb_e_estado, codigo_tp_e_estado, rb_s_estado, codigo_tp_s_estado, rb_dali1, codigo_tp_int1) VALUES
(60,100,124,101,101,114,57);

update trb_rasp_ed set domo = 1 where id =122;
update trb_rasp_sd set domo = 1 where id =99;
update trb_rasp_ed set domo = 1 where id =123;
update trb_rasp_sd set domo = 1 where id =100;
update trb_rasp_ed set domo = 1 where id =124;
update trb_rasp_sd set domo = 1 where id =101;



-- entrada
insert into relacion_luces (codigo_luces, rb_e_estado, codigo_tp_e_estado, rb_s_estado, codigo_tp_s_estado, rb_dali1, codigo_tp_int1) VALUES
(61,100,125,101,102,115,58);
insert into relacion_luces (codigo_luces, rb_e_estado, codigo_tp_e_estado, rb_s_estado, codigo_tp_s_estado, rb_dali1, codigo_tp_int1) VALUES
(62,100,126,101,103,116,59);
insert into relacion_luces (codigo_luces, rb_e_estado, codigo_tp_e_estado, rb_s_estado, codigo_tp_s_estado, rb_dali1, codigo_tp_int1) VALUES
(63,100,127,101,104,117,60);
insert into relacion_luces (codigo_luces, rb_e_estado, codigo_tp_e_estado, rb_s_estado, codigo_tp_s_estado, rb_dali1, codigo_tp_int1) VALUES
(64,100,128,101,105,118,61);

update trb_rasp_ed set domo = 1 where id =125;
update trb_rasp_sd set domo = 1 where id =102;
update trb_rasp_ed set domo = 1 where id =126;
update trb_rasp_sd set domo = 1 where id =103;
update trb_rasp_ed set domo = 1 where id =127;
update trb_rasp_sd set domo = 1 where id =104;
update trb_rasp_ed set domo = 1 where id =128;
update trb_rasp_sd set domo = 1 where id =105;


update trb_rasp_dali_s set domo =1;

-- socket luces
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(81,4,'{"floor":"6","room":"38","zone":"40","type":"0","nemo":"0"}',0);
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(82,4,'{"floor":"6","room":"38","zone":"41","type":"0","nemo":"0"}',0);
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(83,4,'{"floor":"6","room":"39","zone":"42","type":"0","nemo":"0"}',0);
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(84,4,'{"floor":"6","room":"39","zone":"43","type":"0","nemo":"0"}',0);
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(85,4,'{"floor":"6","room":"36","zone":"44","type":"0","nemo":"0"}',0);
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(86,4,'{"floor":"6","room":"36","zone":"45","type":"0","nemo":"0"}',0);
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(87,4,'{"floor":"6","room":"37","zone":"46","type":"0","nemo":"0"}',0);
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(88,4,'{"floor":"6","room":"37","zone":"47","type":"0","nemo":"0"}',0);
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(89,4,'{"floor":"7","room":"45","zone":"48","type":"0","nemo":"0"}',0);
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(90,4,'{"floor":"7","room":"44","zone":"49","type":"0","nemo":"0"}',0);
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(91,4,'{"floor":"7","room":"44","zone":"50","type":"0","nemo":"0"}',0);
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(92,4,'{"floor":"7","room":"43","zone":"51","type":"0","nemo":"0"}',0);
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(93,4,'{"floor":"7","room":"43","zone":"52","type":"0","nemo":"0"}',0);

-- ENTRADA COMEDOR SALA TV
-- pasillo
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(94,4,'{"floor":"4","room":"19","zone":"53","type":"0","nemo":"0"}',0);
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(97,4,'{"floor":"4","room":"19","zone":"54","type":"0","nemo":"0"}',0);
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(98,4,'{"floor":"4","room":"19","zone":"55","type":"0","nemo":"0"}',0);


-- comedor
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(95,4,'{"floor":"4","room":"13","zone":"56","type":"0","nemo":"0"}',0);
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(96,4,'{"floor":"4","room":"13","zone":"57","type":"0","nemo":"0"}',0);


-- sala tv
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(99,4,'{"floor":"4","room":"46","zone":"58","type":"0","nemo":"0"}',0);
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(100,4,'{"floor":"4","room":"46","zone":"59","type":"0","nemo":"0"}',0);
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(101,4,'{"floor":"4","room":"46","zone":"60","type":"0","nemo":"0"}',0);


-- entrada
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(102,4,'{"floor":"4","room":"16","zone":"61","type":"0","nemo":"0"}',0);
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(103,4,'{"floor":"4","room":"16","zone":"62","type":"0","nemo":"0"}',0);
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(104,4,'{"floor":"4","room":"16","zone":"63","type":"0","nemo":"0"}',0);
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(105,4,'{"floor":"4","room":"16","zone":"64","type":"0","nemo":"0"}',0);





insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(81,4,'{"floor":"6","room":"38","zone":"40","type":"0","nemo":"0"}',0);
insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(82,4,'{"floor":"6","room":"38","zone":"41","type":"0","nemo":"0"}',0);
insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(83,4,'{"floor":"6","room":"39","zone":"42","type":"0","nemo":"0"}',0);
insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(84,4,'{"floor":"6","room":"39","zone":"43","type":"0","nemo":"0"}',0);
insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(85,4,'{"floor":"6","room":"36","zone":"44","type":"0","nemo":"0"}',0);
insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(86,4,'{"floor":"6","room":"36","zone":"45","type":"0","nemo":"0"}',0);
insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(87,4,'{"floor":"6","room":"37","zone":"46","type":"0","nemo":"0"}',0);
insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(88,4,'{"floor":"6","room":"37","zone":"47","type":"0","nemo":"0"}',0);
insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(89,4,'{"floor":"7","room":"45","zone":"48","type":"0","nemo":"0"}',0);
insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(90,4,'{"floor":"7","room":"44","zone":"49","type":"0","nemo":"0"}',0);
insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(91,4,'{"floor":"7","room":"44","zone":"50","type":"0","nemo":"0"}',0);
insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(92,4,'{"floor":"7","room":"43","zone":"51","type":"0","nemo":"0"}',0);
insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(93,4,'{"floor":"7","room":"43","zone":"52","type":"0","nemo":"0"}',0);

-- ENTRADA COMEDOR SALA TV
-- pasillo
insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(117,4,'{"floor":"4","room":"19","zone":"53","type":"0","nemo":"0"}',0);
insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(120,4,'{"floor":"4","room":"19","zone":"54","type":"0","nemo":"0"}',0);
insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(121,4,'{"floor":"4","room":"19","zone":"55","type":"0","nemo":"0"}',0);


-- comedor
insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(118,4,'{"floor":"4","room":"13","zone":"56","type":"0","nemo":"0"}',0);
insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(119,4,'{"floor":"4","room":"13","zone":"57","type":"0","nemo":"0"}',0);


-- sala tv
insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(122,4,'{"floor":"4","room":"46","zone":"58","type":"0","nemo":"0"}',0);
insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(123,4,'{"floor":"4","room":"46","zone":"59","type":"0","nemo":"0"}',0);
insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(124,4,'{"floor":"4","room":"46","zone":"60","type":"0","nemo":"0"}',0);


-- entrada
insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(125,4,'{"floor":"4","room":"16","zone":"61","type":"0","nemo":"0"}',0);
insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(126,4,'{"floor":"4","room":"16","zone":"62","type":"0","nemo":"0"}',0);
insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(127,4,'{"floor":"4","room":"16","zone":"63","type":"0","nemo":"0"}',0);
insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(128,4,'{"floor":"4","room":"16","zone":"64","type":"0","nemo":"0"}',0);






insert into th_rasp_dali_s (codigo_tp, modulo, argumentos, inhibir) VALUES
(39,4,'{"floor":"6","room":"38","zone":"40","type":"1","nemo":"0"}',0);
insert into th_rasp_dali_s (codigo_tp, modulo, argumentos, inhibir) VALUES
(40,4,'{"floor":"6","room":"38","zone":"41","type":"1","nemo":"0"}',0);
insert into th_rasp_dali_s (codigo_tp, modulo, argumentos, inhibir) VALUES
(41,4,'{"floor":"6","room":"39","zone":"42","type":"1","nemo":"0"}',0);
insert into th_rasp_dali_s (codigo_tp, modulo, argumentos, inhibir) VALUES
(42,4,'{"floor":"6","room":"36","zone":"44","type":"1","nemo":"0"}',0);
insert into th_rasp_dali_s (codigo_tp, modulo, argumentos, inhibir) VALUES
(43,4,'{"floor":"6","room":"36","zone":"45","type":"1","nemo":"0"}',0);
insert into th_rasp_dali_s (codigo_tp, modulo, argumentos, inhibir) VALUES
(44,4,'{"floor":"6","room":"37","zone":"46","type":"1","nemo":"0"}',0);
insert into th_rasp_dali_s (codigo_tp, modulo, argumentos, inhibir) VALUES
(45,4,'{"floor":"7","room":"45","zone":"48","type":"1","nemo":"0"}',0);
insert into th_rasp_dali_s (codigo_tp, modulo, argumentos, inhibir) VALUES
(46,4,'{"floor":"8","room":"44","zone":"49","type":"1","nemo":"0"}',0);
insert into th_rasp_dali_s (codigo_tp, modulo, argumentos, inhibir) VALUES
(47,4,'{"floor":"7","room":"44","zone":"50","type":"1","nemo":"0"}',0);
insert into th_rasp_dali_s (codigo_tp, modulo, argumentos, inhibir) VALUES
(48,4,'{"floor":"7","room":"43","zone":"51","type":"1","nemo":"0"}',0);
insert into th_rasp_dali_s (codigo_tp, modulo, argumentos, inhibir) VALUES
(49,4,'{"floor":"7","room":"43","zone":"52","type":"1","nemo":"0"}',0);


-- ENTRADA COMEDOR SALA TV
-- pasillo
insert into th_rasp_dali_s (codigo_tp, modulo, argumentos, inhibir) VALUES
(50,4,'{"floor":"4","room":"19","zone":"53","type":"1","nemo":"0"}',0);
insert into th_rasp_dali_s (codigo_tp, modulo, argumentos, inhibir) VALUES
(53,4,'{"floor":"4","room":"19","zone":"54","type":"1","nemo":"0"}',0);
insert into th_rasp_dali_s (codigo_tp, modulo, argumentos, inhibir) VALUES
(54,4,'{"floor":"4","room":"19","zone":"55","type":"1","nemo":"0"}',0);


-- comedor
insert into th_rasp_dali_s (codigo_tp, modulo, argumentos, inhibir) VALUES
(51,4,'{"floor":"4","room":"13","zone":"56","type":"1","nemo":"0"}',0);
insert into th_rasp_dali_s (codigo_tp, modulo, argumentos, inhibir) VALUES
(52,4,'{"floor":"4","room":"13","zone":"57","type":"1","nemo":"0"}',0);


-- sala tv
insert into th_rasp_dali_s (codigo_tp, modulo, argumentos, inhibir) VALUES
(55,4,'{"floor":"4","room":"46","zone":"58","type":"1","nemo":"0"}',0);
insert into th_rasp_dali_s (codigo_tp, modulo, argumentos, inhibir) VALUES
(56,4,'{"floor":"4","room":"46","zone":"59","type":"1","nemo":"0"}',0);
insert into th_rasp_dali_s (codigo_tp, modulo, argumentos, inhibir) VALUES
(57,4,'{"floor":"4","room":"46","zone":"60","type":"1","nemo":"0"}',0);


-- entrada
insert into th_rasp_dali_s (codigo_tp, modulo, argumentos, inhibir) VALUES
(58,4,'{"floor":"4","room":"16","zone":"61","type":"1","nemo":"0"}',0);
insert into th_rasp_dali_s (codigo_tp, modulo, argumentos, inhibir) VALUES
(59,4,'{"floor":"4","room":"16","zone":"62","type":"1","nemo":"0"}',0);
insert into th_rasp_dali_s (codigo_tp, modulo, argumentos, inhibir) VALUES
(60,4,'{"floor":"4","room":"16","zone":"63","type":"1","nemo":"0"}',0);
insert into th_rasp_dali_s (codigo_tp, modulo, argumentos, inhibir) VALUES
(61,4,'{"floor":"4","room":"16","zone":"64","type":"1","nemo":"0"}',0);


-- escenas -- habitacion 2
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 38, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
-- habitacion 2
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
-- habitacion 2
(40,61, 0,0,NULL),
(41,62, 0,0,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
-- habitacion 2
(25,61),
(25,62);

-- escenas -- baño habitacion 2
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 39, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
-- baño habitacion 2
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
-- baño habitacion 2
(42,63, 0,0,NULL),
(43,64, 0,-1,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
-- baño habitacion 2
(26,63),
(26,64);


-- escenas -- habitacion 1
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 36, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
-- habitacion 1
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
-- habitacion 1
(44,65, 0,0,NULL),
(45,66, 0,0,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
-- habitacion 1
(27,65),
(27,66);

-- escenas -- baño habitacion 1
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 37, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
-- baño habitacion 1
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
-- baño habitacion 1
(46,67, 0,0,NULL),
(47,68, 0,-1,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
-- baño habitacion 1
(28,67),
(28,68);



-- escenas -- vestibulo
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 45, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
-- vestibulo
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
-- -- vestibulo
(48,69, 0,0,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
-- vestibulo
(29,69);

-- escenas -- cocina/comedor
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 44, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
-- cocina/comedor
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
-- cocina/comedor
(49,70, 0,0,NULL),
(50,71, 0,0,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
-- cocina/comedor
(30,70),
(30,71);


-- escenas -- lavanderia
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 43, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
-- lavanderia
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
-- lavanderia
(51,72, 0,0,NULL),
(52,73, 0,0,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
-- lavanderia
(31,72),
(31,73);


-- escenas -- entrada/comedor/sala tv
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 19, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
-- pasillo
(1, 0),
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
-- pasillo
(53,74, 0,0,NULL),
(54,75, 0,0,NULL),
(55,76, 0,0,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
-- pasillo
(32,74),
(32,75),
(32,76);

-- comedor
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 13, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
-- comedor
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
-- comedor
(56,77, 0,0,NULL),
(57,78, 0,0,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
-- comedor
(33,77),
(33,78);

-- sala tv
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 46, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
-- sala tv
(1, 0),
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
-- sala tv
(58,79, 0,0,NULL),
(59,80, 0,0,NULL),
(60,81, 0,0,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
-- sala tv
(34,79),
(34,80),
(34,81);



-- entrada
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('apagar', 16, 0, 1, 0);

insert into operacion (tipodomo, estado) VALUES
-- pasillo
(1, 0),
(1, 0),
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
-- pasillo
(61,82, 0,0,NULL),
(62,83, 0,0,NULL),
(63,84, 0,0,NULL),
(64,85, 0,0,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
-- pasillo
(35,82),
(35,83),
(35,84),
(35,85);


-- ESCENA STANDARD


-- escenas -- habitacion 2
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 38, 1, 1, 1);

insert into operacion (tipodomo, estado) VALUES
-- habitacion 2
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
-- habitacion 2
(40,86, 1,100,NULL),
(41,87, 1,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
-- habitacion 2
(36,86),
(36,87);

-- escenas -- baño habitacion 2
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 39, 1, 1, 1);

insert into operacion (tipodomo, estado) VALUES
-- baño habitacion 2
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
-- baño habitacion 2
(42,88, 1,100,NULL),
(43,89, 1,-1,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
-- baño habitacion 2
(37,88),
(37,89);


-- escenas -- habitacion 1
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 36, 1, 1, 1);

insert into operacion (tipodomo, estado) VALUES
-- habitacion 1
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
-- habitacion 1
(44,90, 1,100,NULL),
(45,91, 1,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
-- habitacion 1
(38,90),
(38,91);

-- escenas -- baño habitacion 1
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 37, 1, 1, 1);

insert into operacion (tipodomo, estado) VALUES
-- baño habitacion 1
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
-- baño habitacion 1
(46,92, 1,100,NULL),
(47,93, 1,-1,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
-- baño habitacion 1
(39,92),
(39,93);



-- escenas -- vestibulo
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 45, 1, 1, 1);

insert into operacion (tipodomo, estado) VALUES
-- vestibulo
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
-- -- vestibulo
(48,94, 1,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
-- vestibulo
(40,94);

-- escenas -- cocina/comedor
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 44, 1, 1, 1);

insert into operacion (tipodomo, estado) VALUES
-- cocina/comedor
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
-- cocina/comedor
(49,95, 1,100,NULL),
(50,96, 1,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
-- cocina/comedor
(41,95),
(41,96);


-- escenas -- lavanderia
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 43, 1, 1, 1);

insert into operacion (tipodomo, estado) VALUES
-- lavanderia
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
-- lavanderia
(51,97, 1,100,NULL),
(52,98, 1,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
-- lavanderia
(42,97),
(42,98);


-- escenas -- entrada/comedor/sala tv
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 19, 1, 1, 1);

insert into operacion (tipodomo, estado) VALUES
-- pasillo
(1, 0),
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
-- pasillo
(53,99, 1,100,NULL),
(54,100, 1,100,NULL),
(55,101, 1,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
-- pasillo
(43,99),
(43,100),
(43,101);

-- comedor
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 13, 1, 1, 1);

insert into operacion (tipodomo, estado) VALUES
-- pasillo
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
-- pasillo
(56,102, 1,100,NULL),
(57,103, 1,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
-- pasillo
(44,102),
(44,103);

-- sala tv
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 46, 1, 1, 1);

insert into operacion (tipodomo, estado) VALUES
-- pasillo
(1, 0),
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
-- pasillo
(58,104, 1,100,NULL),
(59,105, 1,100,NULL),
(60,106, 1,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
-- pasillo
(45,104),
(45,105),
(45,106);



-- entrada
insert into escenas (nemo, codigo_estancia, estado, tipodomo, tipo) VALUES
('standard', 16, 1, 1, 1);

insert into operacion (tipodomo, estado) VALUES
-- pasillo
(1, 0),
(1, 0),
(1, 0),
(1, 0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb) VALUES
-- pasillo
(61,107, 1,100,NULL),
(62,108, 1,100,NULL),
(63,109, 1,100,NULL),
(64,110, 1,100,NULL);

insert into relacion_escena_operacion (codigo_escena, codigo_operacion) VALUES
-- pasillo
(46,107),
(46,108),
(46,109),
(46,110);


UPDATE estancia set escenas = 1, ambientes =1, rutinas =1 where id = 21;
UPDATE estancia set escenas = 1, ambientes =1, rutinas =1 where id = 20;
UPDATE estancia set escenas = 1, ambientes =1, rutinas =1 where id = 38;
UPDATE estancia set escenas = 1, ambientes =1, rutinas =1 where id = 39;
UPDATE estancia set escenas = 1, ambientes =1, rutinas =1 where id = 36;
UPDATE estancia set escenas = 1, ambientes =1, rutinas =1 where id = 37;
UPDATE estancia set escenas = 1, ambientes =1, rutinas =1 where id = 45;
UPDATE estancia set escenas = 1, ambientes =1, rutinas =1 where id = 44;
UPDATE estancia set escenas = 1, ambientes =1, rutinas =1 where id = 43;
UPDATE estancia set escenas = 1, ambientes =1, rutinas =1 where id = 19;
UPDATE estancia set escenas = 1, ambientes =1, rutinas =1 where id = 13;
UPDATE estancia set escenas = 1, ambientes =1, rutinas =1 where id = 46;
UPDATE estancia set escenas = 1, ambientes =1, rutinas =1 where id = 16;








-- CLIMA
-- ESTAS POR AHORA NO TIENEN CONSIGNA
-- biblioteca
insert clima (fecha, nemo, codigo_estancia, estado, consigna) values
(now(),'biblioteca',21,0,22);

insert into relacion_clima (codigo_clima, codigo_variables, rb_temp, codigo_tp_temp, rb_estado, codigo_tp_estado  ) VALUES
(7,-1 ,68 ,7 ,-1 ,-1);

update trb_rasp_ds18b20 set domo = 2 where id = 7;

-- socket clima
insert into th_rasp_ds18b20 (codigo_tp, modulo, argumentos, inhibir) VALUES
(7,4,'{"floor":"4","room":"21","zone":"7","type":"0","nemo":"2"}',0);

-- salon
insert clima (fecha, nemo, codigo_estancia, estado, consigna) values
(now(),'salon',14,0,22);

insert into relacion_clima (codigo_clima, codigo_variables, rb_temp, codigo_tp_temp, rb_estado, codigo_tp_estado  ) VALUES
(8,-1 ,79 ,8 ,-1 ,-1);

update trb_rasp_ds18b20 set domo = 2 where id = 8;

-- socket clima
insert into th_rasp_ds18b20 (codigo_tp, modulo, argumentos, inhibir) VALUES
(8,4,'{"floor":"4","room":"14","zone":"8","type":"0","nemo":"2"}',0);


-- bar
insert clima (fecha, nemo, codigo_estancia, estado, consigna) values
(now(),'bar',20,0,22);

insert into relacion_clima (codigo_clima, codigo_variables, rb_temp, codigo_tp_temp, rb_estado, codigo_tp_estado  ) VALUES
(9,-1 ,74 ,9 ,-1 ,-1);

update trb_rasp_ds18b20 set domo = 2 where id = 9;

-- socket clima
insert into th_rasp_ds18b20 (codigo_tp, modulo, argumentos, inhibir) VALUES
(9,4,'{"floor":"4","room":"20","zone":"9","type":"0","nemo":"2"}',0);


-- habitacion servicio 1
insert clima (fecha, nemo, codigo_estancia, estado, consigna) values
(now(),'habitacion servicio 1',36,0,22);

insert into relacion_clima (codigo_clima, codigo_variables, rb_temp, codigo_tp_temp, rb_estado, codigo_tp_estado  ) VALUES
(10,-1 ,83 ,10 ,-1 ,-1);

update trb_rasp_ds18b20 set domo = 2 where id = 10;

-- socket clima
insert into th_rasp_ds18b20 (codigo_tp, modulo, argumentos, inhibir) VALUES
(10,4,'{"floor":"7","room":"36","zone":"10","type":"0","nemo":"2"}',0);



-- habitacion servicio 2
insert clima (fecha, nemo, codigo_estancia, estado, consigna) values
(now(),'habitacion servicio 2',38,0,22);

insert into relacion_clima (codigo_clima, codigo_variables, rb_temp, codigo_tp_temp, rb_estado, codigo_tp_estado  ) VALUES
(11,-1 ,84 ,11 ,-1 ,-1);

update trb_rasp_ds18b20 set domo = 2 where id = 11;

-- socket clima
insert into th_rasp_ds18b20 (codigo_tp, modulo, argumentos, inhibir) VALUES
(11,4,'{"floor":"7","room":"38","zone":"11","type":"0","nemo":"2"}',0);




-- cocina comedor
insert clima (fecha, nemo, codigo_estancia, estado, consigna) values
(now(),'cocina comedor',44,0,22);

insert into relacion_clima (codigo_clima, codigo_variables, rb_temp, codigo_tp_temp, rb_estado, codigo_tp_estado  ) VALUES
(12,-1 ,85 ,12 ,-1 ,-1);

update trb_rasp_ds18b20 set domo = 2 where id = 12;

-- socket clima
insert into th_rasp_ds18b20 (codigo_tp, modulo, argumentos, inhibir) VALUES
(12,4,'{"floor":"7","room":"44","zone":"12","type":"0","nemo":"2"}',0);


-- sala tv
insert clima (fecha, nemo, codigo_estancia, estado, consigna) values
(now(),'sala tv',46,0,22);

insert into relacion_clima (codigo_clima, codigo_variables, rb_temp, codigo_tp_temp, rb_estado, codigo_tp_estado  ) VALUES
(13,-1 ,119 ,13 ,-1 ,-1);

update trb_rasp_ds18b20 set domo = 2 where id = 13;

-- socket clima
insert into th_rasp_ds18b20 (codigo_tp, modulo, argumentos, inhibir) VALUES
(13,4,'{"floor":"4","room":"46","zone":"13","type":"0","nemo":"2"}',0);










-- IOT
-- ENTRADA COMEDOR SALA TV
-- sala tv
insert iot (fecha, nemo, codigo_estancia, estado) values
(now(),'Enchufe tv sala tv',46,0);

insert into relacion_iot (codigo_iot, rb_e_estado,codigo_tp_e_estado,rb_s_estado,codigo_tp_s_estado) VALUES
(20,100,129,101,106 );

insert iot (fecha, nemo, codigo_estancia, estado) values
(now(),'Enchufe pared sala tv',46,0);

insert into relacion_iot (codigo_iot, rb_e_estado,codigo_tp_e_estado,rb_s_estado,codigo_tp_s_estado) VALUES
(21,100,130,101,107 );

-- socket iot
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(106,4,'{"floor":"4","room":"46","zone":"20","type":"0","nemo":"4"}',0);

insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(107,4,'{"floor":"4","room":"46","zone":"21","type":"0","nemo":"4"}',0);


insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(129,4,'{"floor":"4","room":"46","zone":"20","type":"0","nemo":"4"}',0);

insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(130,4,'{"floor":"4","room":"46","zone":"21","type":"0","nemo":"4"}',0);

update trb_rasp_ed set domo = 4 where id = 129;
update trb_rasp_sd set domo = 4 where id = 106;

update trb_rasp_ed set domo = 4 where id = 130;
update trb_rasp_sd set domo = 4 where id = 107;


-- comedor

insert iot (fecha, nemo, codigo_estancia, estado) values
(now(),'Enchufe comedor',13,0);

insert into relacion_iot (codigo_iot, rb_e_estado,codigo_tp_e_estado,rb_s_estado,codigo_tp_s_estado) VALUES
(22,100,131,101,108 );

-- socket iot
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(108,4,'{"floor":"4","room":"13","zone":"22","type":"0","nemo":"4"}',0);

insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(131,4,'{"floor":"4","room":"13","zone":"22","type":"0","nemo":"4"}',0);

update trb_rasp_ed set domo = 4 where id = 131;
update trb_rasp_sd set domo = 4 where id = 108;

-- pasillo

insert iot (fecha, nemo, codigo_estancia, estado) values
(now(),'Enchufe pasillo derecho',19,0);

insert into relacion_iot (codigo_iot, rb_e_estado,codigo_tp_e_estado,rb_s_estado,codigo_tp_s_estado) VALUES
(23,100,132,101,109 );

-- socket iot
insert into th_rasp_sd (codigo_tp, modulo, argumentos, inhibir) VALUES
(109,4,'{"floor":"4","room":"19","zone":"23","type":"0","nemo":"4"}',0);
insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(132,4,'{"floor":"4","room":"19","zone":"23","type":"0","nemo":"4"}',0);

update trb_rasp_ed set domo = 4 where id = 132;
update trb_rasp_sd set domo = 4 where id = 109;












-- TH PULSADOR

-- th pulsador
-- Ejemplos rudy
-- tpestadobombilla$tpsalidabombilla$tpsalidavalvula$tpsonda
-- con una valvula
-- Ejmeplo tp pulsador 3452
-- 511$501$500$527
-- 511 tp ed estado bombilla
-- 501 tp sd bombilla
-- 500 tp sd valvula suelo radiante
-- 527 tp sonda


-- con dos valvulas
-- tpestadobombilla$tpsalidabombilla$tpsalidavalvula1$tpsonda1$tpsalidavalvula2$tpsonda2
-- Ejemplo rudy tp 3419
-- 328$315$313$334$314$335
-- 328 tp ed estado bombilla
-- 315 tp sd bombilla suelo radiante
-- 313 tp sd valvula 1 suelo radiante
-- 334 tp sonda 1
-- 314 tp sd valvula 2 suelo radiante
-- 335 tp sonda 2

-- char * string = "{\"trb_tpss\":\"0\",\"rb_tpss\":\"1\",\"terminal_tpss\":\"10\",\"trb_tpse\":\"0\",\"rb_tpse\":\"1\",\"terminal_tpse\":\"10\",\"valves\":[{\"trb\": \"1\",\"rb\": \"1\",\"terminal\": \"10\"}, {\"trb\": \"1\",\"rb\": \"1\",\"terminal\": \"10\"}, {\"trb\": \"1\",\"rb\": \"1\",\"terminal\": \"10\"}],\"probes\":[{\"trb\": \"11\",\"rb\": \"21\",\"terminal\": \"12\"}, {\"trb\": \"21\",\"rb\": \"31\",\"terminal\": \"22\"}, {\"trb\": \"12\",\"rb\": \"12\",\"terminal\": \"0\"}]}";
-- printf ( "JSON string: %s\n\n", string );
insert into th_rasp_pulsador (codigo_tp,modulo, argumentos, inhibir) values
(12,7,"{\"trb_tpss\":\"0\",\"rb_tpss\":\"121\",\"terminal_tpss\":\"9\",\"trb_tpse\":\"0\",\"rb_tpse\":\"120\",\"terminal_tpse\":\"10\",\"valves\":[{\"trb\": \"7\",\"rb\": \"121\",\"terminal\": \"8\"}],\"probes\":[{\"trb\": \"1\",\"rb\": \"124\",\"terminal\": \"0\"}]}",0)
