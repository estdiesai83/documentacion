use sistema_pr_somosaguas;

update luces set codigo_estancia = 13 where id = 53;
update luces set codigo_estancia = 13 where id = 54;

-- escena apagar
update relacion_escena_operacion set codigo_escena = 33 where codigo_operacion = 74;
update relacion_escena_operacion set codigo_escena = 33 where codigo_operacion = 75;

-- escena maxima
update relacion_escena_operacion set codigo_escena = 44 where codigo_operacion = 99;
update relacion_escena_operacion set codigo_escena = 44 where codigo_operacion = 100;

-- escena standard
update relacion_escena_operacion set codigo_escena = 118 where codigo_operacion = 241;
update relacion_escena_operacion set codigo_escena = 118 where codigo_operacion = 242;



-- modificaciones en multimedia para que sea como los accesos


insert into multimedia (nemo, codigo_estancia, estado, tipo ) VALUES ('tv techo',22,0,2);
insert into multimedia (nemo, codigo_estancia, estado, tipo ) VALUES ('proyector cine',14,0,2);

insert into relacion_multimedia (codigo_multimedia,rb_s_abrir, codigo_tp_s_abrir, rb_s_cerrar, codigo_tp_s_cerrar , rb_e_abrir, codigo_tp_e_abrir, rb_e_cerrar, codigo_tp_e_cerrar) VALUES
(1, 181,153,181,154,180,180,180,181),
(2, 70,155,70,156,69,187,69,188);

-- tv techo hab alejandro
insert into variables (nemo, valor, tipo) VALUES ('salidalimitada', 15000, 2 );
insert into variables (nemo, valor, tipo) VALUES ('salidalimitada', 15000, 2 );

update iniciarhilostrb set argumentos = '{"ip":"80.28.98.191","port":"53140","pseudoterminal":"0","variables_code":"43"}' where id = 394 and codigo_rb = 181 and bornas = 0;
update iniciarhilostrb set argumentos = '{"ip":"80.28.98.191","port":"53140","pseudoterminal":"0","variables_code":"44"} }' where id = 395 and codigo_rb = 181 and bornas = 1;

-- proyector cine
insert into variables (nemo, valor, tipo) VALUES ('salidalimitada', 15000, 2 );
insert into variables (nemo, valor, tipo) VALUES ('salidalimitada', 15000, 2 );

update iniciarhilostrb set argumentos = '{"ip":"80.28.98.191","port":"53142","pseudoterminal":"0","variables_code":"45"}' where id = 400 and codigo_rb = 70 and bornas = 8;
update iniciarhilostrb set argumentos = '{"ip":"80.28.98.191","port":"53142","pseudoterminal":"0","variables_code":"46"} }' where id = 401 and codigo_rb = 70 and bornas = 9;


-- th_multimedia
-- proyector cine
update th_rasp_ed set argumentos = '{"id1":"8","id2":"187","id3":"188", "floor": "5", "room": "22", "zone": "2","type":"0" ,"trb":"0","nemo":"10"}' where id = 131;
update th_rasp_ed set argumentos = '{"id1":"8","id2":"187","id3":"188", "floor": "5", "room": "22", "zone": "2","type":"0" ,"trb":"0","nemo":"10"}' where id = 132;

-- tv techo hab alejandro
update th_rasp_ed set argumentos = '{"id1":"0","id2":"180","id3":"181", "floor": "4", "room": "14", "zone": "1","type":"1" ,"trb":"0","nemo":"10"}' where id = 133;
update th_rasp_ed set argumentos = '{"id1":"0","id2":"180","id3":"181", "floor": "4", "room": "14", "zone": "1","type":"1" ,"trb":"0","nemo":"10"}' where id = 134;

update th_rasp_ed set inhibir = 0 where id = 133;
update th_rasp_ed set inhibir = 0 where id = 134;

update th_rasp_sd set inhibir = 1 where id = 276;
update th_rasp_sd set inhibir = 1 where id = 277;
update th_rasp_sd set inhibir = 1 where id = 278;
update th_rasp_sd set inhibir = 1 where id = 279;

-- asi estaba originalmente
-- th_rasp_ed
-- 131 |       187 |      4 | NULL | {"nemo" : "10", "floor": "4", "room": "14", "zone": "1","type":"1"} |       0 |
-- | 132 |       188 |      4 | NULL | {"nemo" : "10", "floor": "4", "room": "14", "zone": "2","type":"1"} |       0 |
-- | 133 |       180 |      4 | NULL | {"nemo" : "10", "floor": "5", "room": "22", "zone": "3","type":"1"} |       0 |
-- | 134 |       181 |      4 | NULL | {"nemo" : "10", "floor": "5", "room": "22", "zone": "4","type":"1"} |       0



-- modificaciones dali integridad
-- placa salon entrada comedor sala tv 1 53138
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"0","time":"10"','"command":"25","time":"300"') where trb = 3 and codigo_rb = 233;
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"1","time":"10"','"command":"11","time":"300"') where trb = 3 and codigo_rb = 234;
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"2","time":"10"','"command":"10","time":"300"') where trb = 3 and codigo_rb = 235;
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"3","time":"10"','"command":"7","time":"300"') where trb = 3 and codigo_rb = 236;
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"4","time":"10"','"command":"0","time":"300"') where trb = 3 and codigo_rb = 237;
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"5","time":"10"','"command":"1","time":"300"') where trb = 3 and codigo_rb = 238;
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"6","time":"10"','"command":"2","time":"300"') where trb = 3 and codigo_rb = 239;
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"7","time":"10"','"command":"18","time":"300"') where trb = 3 and codigo_rb = 240;
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"8","time":"10"','"command":"13","time":"300"') where trb = 3 and codigo_rb = 241;
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"9","time":"10"','"command":"16","time":"300"') where trb = 3 and codigo_rb = 242;
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"10","time":"10"','"command":"4","time":"300"') where trb = 3 and codigo_rb = 243;
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"11","time":"10"','"command":"12","time":"300"') where trb = 3 and codigo_rb = 244;

update rb set numcomando = 25 where numcomando = 0 and id = 233;
update rb set numcomando = 11 where numcomando = 1 and id = 234;
update rb set numcomando = 10 where numcomando = 2 and id = 235;
update rb set numcomando = 7 where numcomando = 3 and id = 236;
update rb set numcomando = 0 where numcomando = 4 and id = 237;
update rb set numcomando = 1 where numcomando = 5 and id = 238;
update rb set numcomando = 2 where numcomando = 6 and id = 239;
update rb set numcomando = 18 where numcomando = 7 and id = 240;
update rb set numcomando = 13 where numcomando = 8 and id = 241;
update rb set numcomando = 16 where numcomando = 9 and id = 242;
update rb set numcomando = 4 where numcomando = 10 and id = 243;
update rb set numcomando = 12 where numcomando = 11 and id = 244;

-- biblioteca 53143
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"0","time":"10"','"command":"2","time":"300"') where trb = 3 and codigo_rb = 262;
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"1","time":"10"','"command":"7","time":"300"') where trb = 3 and codigo_rb = 263;
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"2","time":"10"','"command":"0","time":"300"') where trb = 3 and codigo_rb = 264;


update rb set numcomando = 2 where numcomando = 0 and id = 262;
update rb set numcomando = 7 where numcomando = 1 and id = 263;
update rb set numcomando = 0 where numcomando = 2 and id = 264;

-- bar 53142
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"0","time":"10"','"command":"16","time":"300"') where trb = 3 and codigo_rb = 245;
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"1","time":"10"','"command":"5","time":"300"') where trb = 3 and codigo_rb = 246;
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"2","time":"10"','"command":"27","time":"300"') where trb = 3 and codigo_rb = 247;
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"3","time":"10"','"command":"1","time":"300"') where trb = 3 and codigo_rb = 248;
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"4","time":"10"','"command":"29","time":"300"') where trb = 3 and codigo_rb = 249;

update rb set numcomando = 16 where numcomando = 0 and id = 245;
update rb set numcomando = 5 where numcomando = 1 and id = 246;
update rb set numcomando = 27 where numcomando = 2 and id = 247;
update rb set numcomando = 1 where numcomando = 3 and id = 248;
update rb set numcomando = 29 where numcomando = 4 and id = 249;

-- placa estudio 53145
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"0","time":"10"','"command":"0","time":"300"') where trb = 3 and codigo_rb = 332;
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"1","time":"10"','"command":"14","time":"300"') where trb = 3 and codigo_rb = 333;
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"2","time":"10"','"command":"2","time":"300"') where trb = 3 and codigo_rb = 334;
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"3","time":"10"','"command":"5","time":"300"') where trb = 3 and codigo_rb = 335;
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"4","time":"10"','"command":"20","time":"300"') where trb = 3 and codigo_rb = 336;

update rb set numcomando = 0 where numcomando = 0 and id = 332;
update rb set numcomando = 14 where numcomando = 1 and id = 333;
update rb set numcomando = 2 where numcomando = 2 and id = 334;
update rb set numcomando = 5 where numcomando = 3 and id = 335;
update rb set numcomando = 20 where numcomando = 4 and id = 336;

-- lavanderia 53131
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"0","time":"10"','"command":"3","time":"300"') where trb = 3 and codigo_rb = 304;
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"1","time":"10"','"command":"0","time":"300"') where trb = 3 and codigo_rb = 305;

update rb set numcomando = 3 where numcomando = 0 and id = 304;
update rb set numcomando = 0 where numcomando = 1 and id = 305;

-- placa cocina 53130
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"0","time":"10"','"command":"8","time":"300"') where trb = 3 and codigo_rb = 250;
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"1","time":"10"','"command":"12","time":"300"') where trb = 3 and codigo_rb = 251;
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"2","time":"10"','"command":"6","time":"300"') where trb = 3 and codigo_rb = 252;
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"3","time":"10"','"command":"15","time":"300"') where trb = 3 and codigo_rb = 253;
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"4","time":"10"','"command":"1","time":"300"') where trb = 3 and codigo_rb = 254;
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"5","time":"10"','"command":"10","time":"300"') where trb = 3 and codigo_rb = 255;
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"6","time":"10"','"command":"0","time":"300"') where trb = 3 and codigo_rb = 256;
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"7","time":"10"','"command":"20","time":"300"') where trb = 3 and codigo_rb = 257;
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"8","time":"10"','"command":"3","time":"300"') where trb = 3 and codigo_rb = 258;
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"9","time":"10"','"command":"2","time":"300"') where trb = 3 and codigo_rb = 259;

update rb set numcomando = 8 where numcomando = 0 and id = 250;
update rb set numcomando = 12 where numcomando = 1 and id = 251;
update rb set numcomando = 6 where numcomando = 2 and id = 252;
update rb set numcomando = 15 where numcomando = 3 and id = 253;
update rb set numcomando = 1 where numcomando = 4 and id = 254;
update rb set numcomando = 10 where numcomando = 5 and id = 255;
update rb set numcomando = 0 where numcomando = 6 and id = 256;
update rb set numcomando = 20 where numcomando = 7 and id = 257;
update rb set numcomando = 3 where numcomando = 8 and id = 258;
update rb set numcomando = 2 where numcomando = 9 and id = 259;

-- placa habitacion estudio 53144
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"0","time":"10"','"command":"0","time":"300"') where trb = 3 and codigo_rb = 285;
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"1","time":"10"','"command":"5","time":"300"') where trb = 3 and codigo_rb = 286;
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"2","time":"10"','"command":"6","time":"300"') where trb = 3 and codigo_rb = 287;
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"3","time":"10"','"command":"3","time":"300"') where trb = 3 and codigo_rb = 288;
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"4","time":"10"','"command":"15","time":"300"') where trb = 3 and codigo_rb = 289;
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"5","time":"10"','"command":"13","time":"300"') where trb = 3 and codigo_rb = 290;
update iniciarhilostrb set argumentos = REPLACE(argumentos, '"command":"6","time":"10"','"command":"1","time":"300"') where trb = 3 and codigo_rb = 291;


update rb set numcomando = 0 where numcomando = 0 and id = 285;
update rb set numcomando = 5 where numcomando = 1 and id = 286;
update rb set numcomando = 6 where numcomando = 2 and id = 287;
update rb set numcomando = 3 where numcomando = 3 and id = 288;
update rb set numcomando = 15 where numcomando = 4 and id = 289;
update rb set numcomando = 13 where numcomando = 5 and id = 290;
update rb set numcomando = 1 where numcomando = 6 and id = 291;

-- sonda humedad
update relacion_clima set rb_humedad = 487, codigo_tp_humedad = 2 where codigo_clima = 14;

-- temperatura de color
insert into luces (nemo, codigo_estancia, estado, intensidad, rgb,  temperatura ) VALUES ('piscina interior',41, 0,100,'255$255$255',0);

insert into relacion_luces (codigo_luces, rb_e_estado, codigo_tp_e_estado, rb_s_estado, codigo_tp_s_estado, rb_dali1, codigo_tp_int1, codigo_tp_rgb1, rb_dali2   ,codigo_tp_int2, codigo_tp_rgb2, rb_dali3, codigo_tp_int3, codigo_tp_rgb3, rb_dali4, codigo_tp_temp, rb_dali5, codigo_tp_int5 ) VALUES
(116,-1,-1,-1,-1, 488, 99, 100,489,101,102,490,103,104,491,105,492,106);


update th_rasp_dali_s set argumentos = '{"floor":"4","room":"18","zone":"37","type":"1","nemo":"0"}' where id = 37;

update th_rasp_dali_s set argumentos = '{"floor":"4","room":"18","zone":"38","type":"1","nemo":"0"}' where id = 38;

update th_rasp_dali_s set argumentos = '{"floor":"4","room":"14","zone":"35","type":"1","nemo":"0"}' where id = 35;

update th_rasp_dali_s set argumentos = '{"floor":"4","room":"14","zone":"36","type":"1","nemo":"0"}' where id = 36;


update iniciarhilostrb set argumentos = REPLACE(argumentos, "2800015920000159", "28075979a2010300") where codigo_rb = 176;

-- asi estaba originalmente

-- 37 |        37 |      4 | NULL |  |       0 |{"floor":"4","room":"20","zone":"37","type":"1","nemo":"0"}
-- +----+-----------+--------+------+-------------------------------------------------------------+---------+
-- 1 row in set (0.00 sec)

-- MariaDB [sistema_somosaguas]> select *from th_rasp_dali_s where codigo_tp=38;
-- +----+-----------+--------+------+-------------------------------------------------------------+---------+
-- | id | codigo_tp | modulo | fk   | argumentos                                                  | inhibir |
-- +----+-----------+--------+------+-------------------------------------------------------------+---------+
-- | 38 |        38 |      4 | NULL | {"floor":"4","room":"20","zone":"38","type":"1","nemo":"0"} |       0 |
-- +----+-----------+--------+------+-------------------------------------------------------------+---------+
-- 1 row in set (0.00 sec)

-- MariaDB [sistema_somosaguas]> select *from th_rasp_dali_s where codigo_tp=35;
-- +----+-----------+--------+------+-------------------------------------------------------------+---------+
-- | id | codigo_tp | modulo | fk   | argumentos                                                  | inhibir |
-- +----+-----------+--------+------+-------------------------------------------------------------+---------+
-- | 35 |        35 |      4 | NULL | {"floor":"4","room":"20","zone":"35","type":"1","nemo":"0"} |       0 |
-- +----+-----------+--------+------+-------------------------------------------------------------+---------+
-- 1 row in set (0.00 sec)

-- MariaDB [sistema_somosaguas]> select *from th_rasp_dali_s where codigo_tp=36;
-- +----+-----------+--------+------+-------------------------------------------------------------+---------+
-- | id | codigo_tp | modulo | fk   | argumentos                                                  | inhibir |
-- +----+-----------+--------+------+-------------------------------------------------------------+---------+
-- | 36 |        36 |      4 | NULL | {"floor":"4","room":"20","zone":"36","type":"1","nemo":"0"} |       0 |
