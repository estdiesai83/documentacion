-- th_rasp_sd
-- terraza sala cine/bar
-- 134 |        76 |      4 | NULL | {"floor":"4","group":"1","room":"18","zone":"37","type":"0","nemo":"0"}                |       0 |
update th_rasp_sd set argumentos = '{"floor":"2","group":"1","room":"18","zone":"37","type":"0","nemo":"0"}' where id = 134;

-- | 135 |        77 |      4 | NULL | {"floor":"4","group":"1","room":"18","zone":"38","type":"0","nemo":"0"}
update th_rasp_sd set argumentos = '{"floor":"2","group":"1","room":"18","zone":"38","type":"0","nemo":"0"}' where id = 135;

-- terraza sala tv
-- | 175 |       100 |      4 | NULL | {"floor":"4","group":"1","room":"72","zone":"59","type":"0","nemo":"0"}                |       0 |
-- | 176 |       101 |      4 | NULL | {"floor":"4","group":"1","room":"72","zone":"60","type":"0","nemo":"0"}                |       0 |
update th_rasp_sd set argumentos = '{"floor":"2","group":"1","room":"72","zone":"59","type":"0","nemo":"0"}' where id = 175;
update th_rasp_sd set argumentos = '{"floor":"2","group":"1","room":"72","zone":"60","type":"0","nemo":"0"}' where id = 176;


-- piscina exterior
-- | 330 |       189 |      4 | NULL | {"floor":"2","room":"6","zone":"117","type":"0","nemo":"0"}                            |       0 |
-- | 348 |       193 |      4 | NULL | {"floor":"1","room":"6","zone":"2","type":"5","nemo":"11"}                            |       1 |
update th_rasp_sd set argumentos = '{"floor":"2","group":"2","room":"6","zone":"117","type":"0","nemo":"0"}' where id = 330;
update th_rasp_sd set argumentos = '{"floor":"2","group":"2","room":"6","zone":"2","type":"5","nemo":"11"}' where id = 348;

-- |  4 |         6 |      4 | NULL | {"floor":"2","room":"6","zone": "2","type":"4","nemo":"11"}              |       0 |
-- |  5 |         7 |      4 | NULL | {"floor":"2","room":"6","zone": "2","type":"2","nemo":"11"}              |       0 |
-- |  6 |        10 |      4 | NULL | {"floor":"2","room":"6","zone":"2","type":"0","nemo":"11"}               |       0 |
-- +----+-----------+--------+------+--------------------------------------------------------------------------+---------+
update th_sugar_conv_e set argumentos = '{"floor":"2","group":"2","room":"6","zone":"2","type":"4","nemo":"11"}' where id = 4;
update th_sugar_conv_e set argumentos = '{"floor":"2","group":"2","room":"6","zone":"2","type":"2","nemo":"11"}' where id = 5;
update th_sugar_conv_e set argumentos = '{"floor":"2","group":"2","room":"6","zone":"2","type":"0","nemo":"11"}' where id = 6;


-- | 179 |       224 |      4 | NULL | {"floor":"2","room": "6","zone":"2","type":"5","nemo":"11"}                                  |       1 |
-- | 180 |       239 |      4 | NULL | {"id1":"239","id2":"240","floor":"2","room":"6","zone":"2","type":"3","trb":"0","nemo":"11"} |       1 |
-- | 181 |       240 |      4 | NULL | {"id1":"239","id2":"240","floor":"2","room":"6","zone":"2","type":"3","trb":"0","nemo":"11"} |

update th_rasp_ed set argumentos = '{"floor":"2","group":"2","room":"6","zone":"2","type":"5","nemo":"11"}' where id = 179;
update th_rasp_ed set argumentos = '{"id1":"239","id2":"240","floor":"2","group":"2","room":"6","zone":"2","type":"3","trb":"0","nemo":"11"}' where id = 180;
update th_rasp_ed set argumentos = '{"id1":"239","id2":"240","floor":"2","group":"2","room":"6","zone":"2","type":"3","trb":"0","nemo":"11"}' where id = 181;


-- tabla estancia las fotos no están bien
| 48 | 2022-06-19 09:22:24 | Area Sur              |             2 |      2 | vivienda/11/vestibulo_biblio_bar.jpg |       0 |         0 |       0 |     2 |            1 |            NULL |
| 50 | 2022-06-19 09:22:24 | Area Oeste            |             2 |      2 | vivienda/11/despensa.jpg             |       0 |         0 |       0 |     3 |            1 |            NULL |
| 51 | 2022-06-19 09:22:24 | Area Oeste            |             2 |      2 | vivienda/11/ropero.jpg


-- 10/12/2022
-- terraza sala cine/bar
-- | 55 |       100 |      4 | NULL | {"floor":"4","room":"20","zone":"37","type":"0","nemo":"0"} |       0 |
update th_rasp_ed set argumentos = '{"floor":"2","group":"1","room":"18","zone":"37","type":"0","nemo":"0"}' where id = 55;

-- led armarios verstidor alejandro no funciona

-- barra bar no funciona
##### LUCES	(No me funciona el encender/apagar)

-- - ​	FOCOS TECHO CENTRO COMEDOR : id  56 SI FUNCIONA
-- -    BARRA BAR : ID 39   SI FUNCIONA
-- -    FOCOS TECHO VESTIBULO:  id  55 SI FUNCIONA
-- -    LED ARMARIOS ( VESTIDOR ALEJANDRO ) 82
-- -    LES ARMARIOS ( VESTIDOR RACHEL ) ID 81
-- -    PASILLO LAVANDERIA: ID (51)       SI FUNCIONA
-- -    LAVANDERIA: ID 52                 SI FUNCIONA
-- -    FOCOS ESCALERA SERVICIO id ( 94)
-- select *from th_rasp_sd where argumentos like '%zone":"94"%';
-- +-----+-----------+--------+------+-------------------------------------------------------------+---------+
-- | id  | codigo_tp | modulo | fk   | argumentos                                                  | inhibir |
-- +-----+-----------+--------+------+-------------------------------------------------------------+---------+
-- | 122 |       176 |      4 | NULL | {"floor":"4","room":"68","zone":"94","type":"0","nemo":"0"} |       0 |
-- +-----+-----------+--------+------+-------------------------------------------------------------+---------+
update th_rasp_ed  set argumentos = '{"floor":"5","room":"68","zone":"94","type":"0","nemo":"0"}' where id = 122;


-- MariaDB [sistema_pr_somosaguas]> select *from th_rasp_sd where argumentos like '%zone":"94"%';
-- +-----+-----------+--------+------+-------------------------------------------------------------+---------+
-- | id  | codigo_tp | modulo | fk   | argumentos                                                  | inhibir |
-- +-----+-----------+--------+------+-------------------------------------------------------------+---------+
-- | 256 |       149 |      4 | NULL | {"floor":"4","room":"68","zone":"94","type":"0","nemo":"0"} |       0 |
-- +-----+-----------+--------+------+-------------------------------------------------------------+---------+
update th_rasp_sd  set argumentos = '{"floor":"5","room":"68","zone":"94","type":"0","nemo":"0"}' where id = 256;


-- MariaDB [sistema_pr_somosaguas]> select *from th_rasp_dali_s where argumentos like '%zone":"94"%';
-- +----+-----------+--------+------+-------------------------------------------------------------+---------+
-- | id | codigo_tp | modulo | fk   | argumentos                                                  | inhibir |
-- +----+-----------+--------+------+-------------------------------------------------------------+---------+
-- | 89 |        89 |      4 | NULL | {"floor":"4","room":"68","zone":"94","type":"1","nemo":"0"} |       0 |
-- +----+-----------+--------+------+-------------------------------------------------------------+---------+
update th_rasp_dali_s  set argumentos = '{"floor":"5","room":"68","zone":"94","type":"0","nemo":"0"}' where id = 89;

-- -  FOCOS TECHO ( ESCALERA CARACOL ESTE ) : ID (103) SI FUNCIONA
-- -  FOCOS TECHO ( ESCALERA CARACOL OESTE ) : ID (97) SI FUNCIONA


-- ##### CLIMA (No me funciona el encender/apagar)

-- - ​	HABITACION RACHEL : ID (17) SOLUCIONADO
-- - ​    VESTIDOR RACHEL : ID 19 SOLUCIONADO
-- -  HALL ( HABITACIONES NIÑOS) ID 22 SOLUCIONADO
















-- SOCKETS CLIMA
-- habitacion 2
insert into th_rasp_sd (codigo_tp,modulo,argumentos, inhibir) values
(55,4,'{"floor":"4","group":"8","subgroup":"5","room":"26","zone":"1","type":"4","nemo":"2"}',0);

-- habitacion 3
insert into th_rasp_sd (codigo_tp,modulo,argumentos, inhibir) values
(57,4,'{"floor":"4","group":"8","subgroup":"6","room":"28","zone":"2","type":"4","nemo":"2"}',0);
-- habitacion 4
insert into th_rasp_sd (codigo_tp,modulo,argumentos, inhibir) values
(59,4,'{"floor":"4","group":"8","subgroup":"7","room":"30","zone":"3","type":"4","nemo":"2"}',0);

-- habitacion 5
insert into th_rasp_sd (codigo_tp,modulo,argumentos, inhibir) values
(61,4,'{"floor":"4","group":"8","subgroup":"8","room":"32","zone":"4","type":"4","nemo":"2"}',0);


-- habitacion estudio
insert into th_rasp_sd (codigo_tp,modulo,argumentos, inhibir) values
(63,4,'{"floor":"3","room":"11","zone":"5","type":"4","nemo":"2"}',0);

-- habitacion invitados
insert into th_rasp_sd (codigo_tp,modulo,argumentos, inhibir) values
(65,4,'{"floor":"1","group":"12","room":"34","zone":"6","type":"4","nemo":"2"}',0);

-- biblioteca
insert into th_rasp_sd (codigo_tp,modulo,argumentos, inhibir) values
(70,4,'{"floor":"4","group":"9","room":"21","zone":"7","type":"4","nemo":"2"}',0);

-- sala cine
insert into th_rasp_sd (codigo_tp,modulo,argumentos, inhibir) values
(79,4,'{"floor":"4","group":"5","room":"14","zone":"8","type":"4","nemo":"2"}',0);

-- bar
insert into th_rasp_sd (codigo_tp,modulo,argumentos, inhibir) values
(78,4,'{"floor":"4","group":"5","room":"20","zone":"9","type":"4","nemo":"2"}',0);

-- sala tv
insert into th_rasp_sd (codigo_tp,modulo,argumentos, inhibir) values
(113,4,'{"floor":"4","group":"5","room":"46","zone":"13","type":"4","nemo":"2"}',0);

-- cocina principal
insert into th_rasp_sd (codigo_tp,modulo,argumentos, inhibir) values
(158,4,'{"floor":"4","group":"6","room":"15","zone":"20","type":"4","nemo":"2"}',0);

-- cocina alejandro
insert into th_rasp_sd (codigo_tp,modulo,argumentos, inhibir) values
(157,4,'{"floor":"4","group":"6","room":"17","zone":"21","type":"4","nemo":"2"}',0);


-- comedor
insert into th_rasp_sd (codigo_tp,modulo,argumentos, inhibir) values
(112,4,'{"floor":"4","group":"5","room":"13","zone":"23","type":"4","nemo":"2"}',0);

-- estudio
insert into th_rasp_sd (codigo_tp,modulo,argumentos, inhibir) values
(183,4,'{"floor":"3","room":"9","zone":"27","type":"4","nemo":"2"}',0);

-- pecera
insert into th_rasp_sd (codigo_tp,modulo,argumentos, inhibir) values
(184,4,'{"floor":"3","room":"10","zone":"28","type":"4","nemo":"2"}',0);



-- 8ed_conv
-- hab alejandro
insert into th_iber_8sd_conv (codigo_tp,modulo,argumentos, inhibir) values
(7,4,'{"floor":"4","group":"7","subgroup":"2","room":"22","zone":"14","type":"4","nemo":"2"}',0);

-- baño alejandro
insert into th_iber_8sd_conv (codigo_tp,modulo,argumentos, inhibir) values
(8,4,'{"floor":"4","group":"7","subgroup":"2","room":"23","zone":"15","type":"4","nemo":"2"}',0);
-- ves alejandro
insert into th_iber_8sd_conv (codigo_tp,modulo,argumentos, inhibir) values
(9,4,'{"floor":"4","group":"7","subgroup":"2","room":"53","zone":"16","type":"4","nemo":"2"}',0);

-- hab rachel
insert into th_iber_8sd_conv (codigo_tp,modulo,argumentos, inhibir) values
(10,4,'{"floor":"4","group":"7","subgroup":"3","room":"24","zone":"17","type":"4","nemo":"2"}',0);
-- baño rachel
insert into th_iber_8sd_conv (codigo_tp,modulo,argumentos, inhibir) values
(11,4,'{"floor":"4","group":"7","subgroup":"3","room":"25","zone":"18","type":"4","nemo":"2"}',0);
-- ves rachel
insert into th_iber_8sd_conv (codigo_tp,modulo,argumentos, inhibir) values
(12,4,'{"floor":"4","group":"7","subgroup":"3","room":"54","zone":"19","type":"4","nemo":"2"}',0);
