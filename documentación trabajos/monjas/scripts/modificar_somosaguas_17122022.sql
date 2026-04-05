-- fancoil
-- select *from sistema_somosaguas.clima where estado_fancoil !=-1;
-- +----+---------------------+------------------+-----------------+--------+-------------+----------+---------+------+----------------+-------------------+---------------+
-- | id | fecha               | nemo             | codigo_estancia | estado | temperatura | consigna | humedad | co2  | estado_fancoil | velocidad_fancoil | sleep_fancoil |
-- +----+---------------------+------------------+-----------------+--------+-------------+----------+---------+------+----------------+-------------------+---------------+
-- | 25 | 2022-12-17 17:07:34 | Gimnasio         |              40 |      0 |       21.44 |       21 |       0 | NULL |              0 |                 0 |             0 |
-- | 26 | 2022-12-17 16:47:48 | Piscina interior |              60 |      0 |       21.44 |       23 |       0 | NULL |              0 |                 0 |             0 |
-- +----+---------------------+------------------+-----------------+--------+-------------+----------+---------+------+----------------+-------------------+---------------+
-- 2 rows in set (0.00 sec)

-- MariaDB [(none)]> select *from sistema_somosaguas.th_rasp_sd where argumentos like '%"nemo":"13"%';
-- +-----+-----------+--------+------+---------------------------------------------------------------------------+---------+
-- | id  | codigo_tp | modulo | fk   | argumentos                                                                | inhibir |
-- +-----+-----------+--------+------+---------------------------------------------------------------------------+---------+
-- | 343 |       161 |      4 | NULL | {"floor":"1","group":"11","room":"40","zone":"25","type":"0","nemo":"13"} |       0 |
-- | 344 |       171 |      4 | NULL | {"floor":"1","group":"11","room":"41","zone":"26","type":"0","nemo":"13"} |       0 |
-- +-----+-----------+--------+------+---------------------------------------------------------------------------+---------+
-- 2 rows in set (0.00 sec)

-- MariaDB [(none)]> select *from sistema_somosaguas.th_rasp_ed where argumentos like '%"nemo":"13"%';
-- +-----+-----------+--------+------+-------------------------------------------------------------------------------------------------------------------+---------+
-- | id  | codigo_tp | modulo | fk   | argumentos                                                                                                        | inhibir |
-- +-----+-----------+--------+------+-------------------------------------------------------------------------------------------------------------------+---------+
-- | 170 |       208 |      4 | NULL | {"id1":"208","id2":"209","id3":"210", "floor": "7", "room": "60", "zone": "26","type":"0" ,"trb":"0","nemo":"13"} |       0 |
-- | 171 |       209 |      4 | NULL | {"id1":"208","id2":"209","id3":"210", "floor": "7", "room": "60", "zone": "26","type":"0" ,"trb":"0","nemo":"13"} |       0 |
-- | 172 |       210 |      4 | NULL | {"id1":"208","id2":"209","id3":"210", "floor": "7", "room": "60", "zone": "26","type":"0" ,"trb":"0","nemo":"13"} |       0 |
-- | 173 |       231 |      4 | NULL | {"id1":"231","id2":"232","id3":"233", "floor": "7", "room": "40", "zone": "25","type":"0" ,"trb":"0","nemo":"13"} |       0 |
-- | 174 |       232 |      4 | NULL | {"id1":"231","id2":"232","id3":"233", "floor": "7", "room": "40", "zone": "25","type":"0" ,"trb":"0","nemo":"13"} |       0 |
-- | 175 |       233 |      4 | NULL | {"id1":"231","id2":"232","id3":"233", "floor": "7", "room": "40", "zone": "25","type":"0" ,"trb":"0","nemo":"13"} |       0 |
-- +-----+-----------+--------+------+-------------------------------------------------------------------------------------------------------------------+---------+

-- esta mal el th_rasp_sd para el fancoil de la piscina que estaba en vestibulo piscina que ahora es sala masaje
update th_rasp_sd set argumentos = '{"floor":"1","group":"11","room":"60","zone":"26","type":"0","nemo":"13"}' where id = 344;

-- ¿en el fancoil ya que no tiene bombilla tiene th en la valvula??

-- esta mal el th_rasp_ed falta el grupo y la planta ponia 7 y es la 1
-- piscina interior
update th_rasp_ed set argumentos = '{"id1":"208","id2":"209","id3":"210","floor":"1","group":"11","room":"60","zone":"26","type":"1","trb":"0","nemo":"13"}' where id = 170;
update th_rasp_ed set argumentos = '{"id1":"208","id2":"209","id3":"210","floor":"1","group":"11","room":"60","zone":"26","type":"1","trb":"0","nemo":"13"}' where id = 171;
update th_rasp_ed set argumentos = '{"id1":"208","id2":"209","id3":"210","floor":"1","group":"11","room":"60","zone":"26","type":"1","trb":"0","nemo":"13"}' where id = 172;

-- gimnasio
update th_rasp_ed set argumentos = '{"id1":"231","id2":"232","id3":"233","floor":"1","group":"11","room":"40","zone":"25","type":"1","trb":"0","nemo":"13"}' where id = 173;
update th_rasp_ed set argumentos = '{"id1":"231","id2":"232","id3":"233","floor":"1","group":"11","room":"40","zone":"25","type":"1","trb":"0","nemo":"13"}' where id = 174;
update th_rasp_ed set argumentos = '{"id1":"231","id2":"232","id3":"233","floor":"1","group":"11","room":"40","zone":"25","type":"1","trb":"0","nemo":"13"}' where id = 175;

-- terraza sala cine/bar
update th_rasp_ed set argumentos = '{"floor":"2","group":"1","room":"18","zone":"37","type":"0","nemo":"0"}' where id = 55;

update th_rasp_sd set inhibir = 1 where id = 343;
update th_rasp_sd set inhibir = 1 where id = 344;


-- REVISAR FUENTES
-- select *from th_iber_8sd_modbus;
-- +----+-----------+--------+------+----------------------------------------------------------------------------------------------+---------+
-- | id | codigo_tp | modulo | fk   | argumentos                                                                                   | inhibir |
-- +----+-----------+--------+------+----------------------------------------------------------------------------------------------+---------+
-- | 14 |         4 |      4 | NULL | {"floor":"2","group":"2","room":"2","lights_group":"2","zone":"112","type":"0","nemo":"14"}  |       0 |
-- | 15 |         8 |      4 | NULL | {"floor":"2","group":"2","room":"1","lights_group":"1","zone":"113","type":"0","nemo":"14"}  |       0 |
-- | 16 |        12 |      4 | NULL | {"floor":"2","group":"2","room":"3","lights_group":"3","zone":"114","type":"0","nemo":"14"}  |       0 |
-- | 17 |        17 |      4 | NULL | {"floor":"2","group":"2","room":"74","lights_group":"4","zone":"115","type":"0","nemo":"14"} |       0 |
-- | 18 |         1 |      4 | NULL | {"floor":"2","group":"2","room":"2","pumps_group":"2","zone":"1","type":"0","nemo":"15"}     |       0 |
-- | 19 |         5 |      4 | NULL | {"floor":"2","group":"2","room":"1","pumps_group":"1","zone":"2","type":"0","nemo":"15"}     |       0 |
-- | 20 |         9 |      4 | NULL | {"floor":"2","group":"2","room":"3","pumps_group":"3","zone":"3","type":"0","nemo":"15"}     |       0 |
-- | 21 |        13 |      4 | NULL | {"floor":"2","group":"2","room":"74","pumps_group":"4","zone":"4","type":"0","nemo":"15"}    |       0 |
-- | 22 |        14 |      4 | NULL | {"floor":"2","group":"2","room":"74","pumps_group":"5","zone":"5","type":"0","nemo":"15"}    |       0 |
-- +----+-----------+--------+------+----------------------------------------------------------------------------------------------+---------+
-- 9 rows in set (0.00 sec)

update th_iber_8sd_modbus set argumentos='{"floor":"2","group":"2","room":"2","pumps_group":"2","zone":"2","type":"0","nemo":"15"}' where id = 18;
update th_iber_8sd_modbus set argumentos='{"floor":"2","group":"2","room":"1","pumps_group":"1","zone":"1","type":"0","nemo":"15"}' where id = 19;
-- MariaDB [sistema_pr_somosaguas]> select *from th_iber_8ed_modbus;
-- +----+-----------+--------+------+----------------------------------------------------------------------------------------------+---------+
-- | id | codigo_tp | modulo | fk   | argumentos                                                                                   | inhibir |
-- +----+-----------+--------+------+----------------------------------------------------------------------------------------------+---------+
-- |  1 |         4 |      4 | NULL | {"floor":"2","group":"2","room":"2","lights_group":"2","zone":"112","type":"0","nemo":"14"}  |       0 |
-- |  2 |        12 |      4 | NULL | {"floor":"2","group":"2","room":"1","lights_group":"1","zone":"113","type":"0","nemo":"14"}  |       0 |
-- |  3 |        20 |      4 | NULL | {"floor":"2","group":"2","room":"3","lights_group":"3","zone":"114","type":"0","nemo":"14"}  |       0 |
-- |  4 |        29 |      4 | NULL | {"floor":"2","group":"2","room":"74","lights_group":"4","zone":"115","type":"0","nemo":"14"} |       0 |
-- |  5 |         9 |      4 | NULL | {"floor":"2","group":"2","room":"1","pumps_group":"1","zone":"1","type":"0","nemo":"15"}     |       0 |
-- |  6 |         1 |      4 | NULL | {"floor":"2","group":"2","room":"2","pumps_group":"2","zone":"2","type":"0","nemo":"15"}     |       0 |
-- |  7 |        17 |      4 | NULL | {"floor":"2","group":"2","room":"3","pumps_group":"3","zone":"3","type":"0","nemo":"15"}     |       0 |
-- |  8 |        25 |      4 | NULL | {"floor":"2","group":"2","room":"74","pumps_group":"4","zone":"4","type":"0","nemo":"15"}    |       0 |
-- |  9 |        26 |      4 | NULL | {"floor":"2","group":"2","room":"74","pumps_group":"5","zone":"5","type":"0","nemo":"15"}    |       0 |
-- +----+-----------+--------+------+----------------------------------------------------------------------------------------------+---------+



-- ESTORES
select *from th_somfy_50_e;
-- +----+-----------+--------+------+----------------------------------------------------------------------------------------+---------+
-- | id | codigo_tp | modulo | fk   | argumentos                                                                             | inhibir |
-- +----+-----------+--------+------+----------------------------------------------------------------------------------------+---------+
-- | 14 |         2 |      4 | NULL | {"nemo" : "9", "floor": "6", "room": "34", "zone": "1","type":"1"}                     |       0 |
-- | 15 |         4 |      4 | NULL | {"nemo" : "9", "floor": "5", "room": "32", "zone": "2","type":"1"}                     |       0 |
-- | 16 |         6 |      4 | NULL | {"nemo" : "9", "floor": "5", "room": "28", "zone": "3","type":"1"}                     |       0 |
-- | 17 |         8 |      4 | NULL | {"nemo" : "9", "floor": "5", "room": "30", "zone": "4","type":"1"}                     |       0 |
-- | 18 |        10 |      4 | NULL | {"nemo" : "9", "floor": "5", "room": "26", "zone": "5","type":"1"}                     |       0 |
-- | 19 |        12 |      4 | NULL | {"nemo" : "9", "floor": "5", "room": "53", "zone": "6","type":"1"}                     |       0 |
-- | 20 |        14 |      4 | NULL | {"nemo" : "9", "floor": "5", "room": "53", "zone": "7","type":"1"}                     |       0 |
-- | 21 |        16 |      4 | NULL | {"nemo" : "9", "floor": "3", "room": "11", "zone": "8","type":"1"}                     |       0 |
-- | 22 |        18 |      4 | NULL | {"nemo" : "9", "floor": "3", "room": "11", "zone": "9","type":"1"}                     |       0 |
-- | 23 |        20 |      4 | NULL | {"nemo" : "9", "floor": "3", "room": "11", "zone": "10","type":"1"}                    |       0 |
-- | 24 |        22 |      4 | NULL | {"nemo" : "9", "floor": "6", "room": "36", "zone": "11","type":"1"}                    |       0 |
-- | 25 |        24 |      4 | NULL | {"nemo" : "9", "floor": "6", "room": "38", "zone": "12","type":"1"}                    |       0 |
-- | 26 |        25 |      4 | NULL | {"nemo" : "9", "floor": "6", "room": "38", "zone": "13","type":"1"}                    |       0 |
-- | 27 |        26 |      4 | NULL | {"floor":"4","group":"6","room":"15","zone":"14","type":"1","nemo":"9"}                |       0 |
-- | 28 |        27 |      4 | NULL | {"floor":"4","group":"7","subgroup":"2","room":"23","zone":"15","type":"1","nemo":"9"} |       0 |
-- +----+-----------+--------+------+----------------------------------------------------------------------------------------+---------+
-- 15 rows in set (0,000 sec)

-- +----+------------------------+---------------+--------------+-----------------+
-- | 11 | Habitación Alexander   |             3 |         NULL |            NULL |
-- | 11 | Habitación Alexander   |             3 |         NULL |            NULL |
-- | 11 | Habitación Alexander   |             3 |         NULL |            NULL |
-- | 15 | Cocina Servicio        |             4 |            6 |            NULL |
-- | 23 | Baño                   |             4 |            7 |               2 |
-- | 26 | Habitación             |             4 |            8 |               5 |
-- | 28 | Habitación             |             4 |            8 |               6 |
-- | 30 | Habitación             |             4 |            8 |               7 |
-- | 32 | Habitación             |             4 |            8 |               8 |
-- | 34 | Habitación Invitados   |             1 |           12 |            NULL |
-- | 36 | Luna                   |             1 |           12 |            NULL |
-- | 38 | Sol                    |             1 |           12 |            NULL |
-- | 38 | Sol                    |             1 |           12 |            NULL |
-- | 53 | Vestidor               |             4 |            7 |               2 |
-- | 53 | Vestidor               |             4 |            7 |               2 |
-- +----+------------------------+---------------+--------------+-----------------+

update th_somfy_50_e set argumentos ='{"nemo":"9","floor":"1","group":"12","room":"34","zone":"1","type":"1"}' where id = 14;
update th_somfy_50_e set argumentos ='{"nemo":"9","floor":"4","group":"8","subgroup":"8","room":"32","zone":"2","type":"1"}' where id = 15;
update th_somfy_50_e set argumentos ='{"nemo":"9","floor":"4","group":"8","subgroup":"6","room":"28","zone":"3","type":"1"}' where id = 16;
update th_somfy_50_e set argumentos ='{"nemo":"9","floor":"4","group":"8","subgroup":"7","room":"30","zone":"4","type":"1"}' where id = 17;
update th_somfy_50_e set argumentos ='{"nemo":"9","floor":"4","group":"8","subgroup":"5","room":"26","zone":"5","type":"1"}' where id = 18;
update th_somfy_50_e set argumentos ='{"nemo":"9","floor":"4","group":"7","subgroup":"2","room":"53","zone":"6","type":"1"}' where id = 19;
update th_somfy_50_e set argumentos ='{"nemo":"9","floor":"4","group":"7","subgroup":"2","room":"53","zone":"7","type":"1"}' where id = 20;
update th_somfy_50_e set argumentos ='{"nemo":"9","floor":"3","room":"11","zone":"8","type":"1"}' where id = 21;
update th_somfy_50_e set argumentos ='{"nemo":"9","floor":"3","room":"11","zone":"9","type":"1"}' where id = 22;
update th_somfy_50_e set argumentos ='{"nemo":"9","floor":"3","room":"11","zone":"10","type":"1"}' where id = 23;
update th_somfy_50_e set argumentos ='{"nemo":"9","floor":"1","group":"12","room":"36","zone":"11","type":"1"}' where id = 24;
update th_somfy_50_e set argumentos ='{"nemo":"9","floor":"1","group":"12","room":"38","zone":"12","type":"1"}' where id = 25;
update th_somfy_50_e set argumentos ='{"nemo":"9","floor":"1","group":"12","room":"38","zone":"13","type":"1"}' where id = 26;
update th_somfy_50_e set argumentos ='{"floor":"4","group":"6","room":"15","zone":"14","type":"1","nemo":"9"}' where id = 27;
update th_somfy_50_e set argumentos ='{"floor":"4","group":"7","subgroup":"2","room":"23","zone":"15","type":"1","nemo":"9"}' where id = 28;


-- MariaDB [sistema_somosaguas]> select *from th_somfy_50_s;
-- +----+-----------+--------+------+----------------------------------------------------------------------------------------+---------+
-- | id | codigo_tp | modulo | fk   | argumentos                                                                             | inhibir |
-- +----+-----------+--------+------+----------------------------------------------------------------------------------------+---------+
-- |  1 |         2 |      4 | NULL | {"nemo" : "9", "floor": "6", "room": "34", "zone": "1","type":"1"}                     |       0 |
-- |  2 |         4 |      4 | NULL | {"nemo" : "9", "floor": "5", "room": "32", "zone": "2","type":"1"}                     |       0 |
-- |  3 |         6 |      4 | NULL | {"nemo" : "9", "floor": "5", "room": "28", "zone": "3","type":"1"}                     |       0 |
-- |  4 |         8 |      4 | NULL | {"nemo" : "9", "floor": "5", "room": "30", "zone": "4","type":"1"}                     |       0 |
-- |  5 |        10 |      4 | NULL | {"nemo" : "9", "floor": "5", "room": "26", "zone": "5","type":"1"}                     |       0 |
-- |  6 |        12 |      4 | NULL | {"nemo" : "9", "floor": "5", "room": "53", "zone": "6","type":"1"}                     |       0 |
-- |  7 |        14 |      4 | NULL | {"nemo" : "9", "floor": "5", "room": "53", "zone": "7","type":"1"}                     |       0 |
-- |  8 |        16 |      4 | NULL | {"nemo" : "9", "floor": "3", "room": "11", "zone": "8","type":"1"}                     |       0 |
-- |  9 |        18 |      4 | NULL | {"nemo" : "9", "floor": "3", "room": "11", "zone": "9","type":"1"}                     |       0 |
-- | 10 |        20 |      4 | NULL | {"nemo" : "9", "floor": "3", "room": "11", "zone": "10","type":"1"}                    |       0 |
-- | 11 |        22 |      4 | NULL | {"nemo" : "9", "floor": "6", "room": "36", "zone": "11","type":"1"}                    |       0 |
-- | 12 |        24 |      4 | NULL | {"nemo" : "9", "floor": "6", "room": "38", "zone": "12","type":"1"}                    |       0 |
-- | 13 |        26 |      4 | NULL | {"nemo" : "9", "floor": "6", "room": "38", "zone": "13","type":"1"}                    |       0 |

-- | 14 |        27 |      4 | NULL | {"floor":"4","group":"6","room":"15","zone":"14","type":"0","nemo":"9"}                |       0 |
-- | 15 |        28 |      4 | NULL | {"floor":"4","group":"6","room":"15","zone":"14","type":"1","nemo":"9"}                |       0 |
-- | 16 |        29 |      4 | NULL | {"floor":"4","group":"7","subgroup":"2","room":"23","zone":"15","type":"0","nemo":"9"} |       0 |
-- | 17 |        30 |      4 | NULL | {"floor":"4","group":"7","subgroup":"2","room":"23","zone":"15","type":"1","nemo":"9"} |       0 |
-- +----+-----------+--------+------+----------------------------------------------------------------------------------------+---------+

update th_somfy_50_s set argumentos ='{"nemo":"9","floor":"1","group":"12","room":"34","zone":"1","type":"1"}' where id = 1;
update th_somfy_50_s set argumentos ='{"nemo":"9","floor":"4","group":"8","subgroup":"8","room":"32","zone":"2","type":"1"}' where id = 2;
update th_somfy_50_s set argumentos ='{"nemo":"9","floor":"4","group":"8","subgroup":"6","room":"28","zone":"3","type":"1"}' where id = 3;
update th_somfy_50_s set argumentos ='{"nemo":"9","floor":"4","group":"8","subgroup":"7","room":"30","zone":"4","type":"1"}' where id = 4;
update th_somfy_50_s set argumentos ='{"nemo":"9","floor":"4","group":"8","subgroup":"5","room":"26","zone":"5","type":"1"}' where id = 5;
update th_somfy_50_s set argumentos ='{"nemo":"9","floor":"4","group":"7","subgroup":"2","room":"53","zone":"6","type":"1"}' where id = 6;
update th_somfy_50_s set argumentos ='{"nemo":"9","floor":"4","group":"7","subgroup":"2","room":"53","zone":"7","type":"1"}' where id = 7;
update th_somfy_50_s set argumentos ='{"nemo":"9","floor":"3","room":"11","zone":"8","type":"1"}' where id = 8;
update th_somfy_50_s set argumentos ='{"nemo":"9","floor":"3","room":"11","zone":"9","type":"1"}' where id = 9;
update th_somfy_50_s set argumentos ='{"nemo":"9","floor":"3","room":"11","zone":"10","type":"1"}' where id = 10;
update th_somfy_50_s set argumentos ='{"nemo":"9","floor":"1","group":"12","room":"36","zone":"11","type":"1"}' where id = 11;
update th_somfy_50_s set argumentos ='{"nemo":"9","floor":"1","group":"12","room":"38","zone":"12","type":"1"}' where id = 12;
update th_somfy_50_s set argumentos ='{"nemo":"9","floor":"1","group":"12","room":"38","zone":"13","type":"1"}' where id = 13;



-- PASAR Luz 88 de comedor servicio (15) a comedor alejandro (17)

update luces set codigo_estancia = 17 where id = 88;

-- select *from th_rasp_sd where argumentos like '%"88"%';
-- +-----+-----------+--------+------+-------------------------------------------------------------------------+---------+
-- | id  | codigo_tp | modulo | fk   | argumentos                                                              | inhibir |
-- +-----+-----------+--------+------+-------------------------------------------------------------------------+---------+
-- | 250 |       143 |      4 | NULL | {"floor":"4","group":"6","room":"15","zone":"88","type":"0","nemo":"0"} |       0 |
-- +-----+-----------+--------+------+-------------------------------------------------------------------------+---------+

update th_rasp_sd set argumentos = '{"floor":"4","group":"6","room":"17","zone":"88","type":"0","nemo":"0"}' where id = 250;

-- select *from th_rasp_ed where argumentos like '%"88"%';
-- +-----+-----------+--------+------+-------------------------------------------------------------------------+---------+
-- | id  | codigo_tp | modulo | fk   | argumentos                                                              | inhibir |
-- +-----+-----------+--------+------+-------------------------------------------------------------------------+---------+
-- | 116 |       170 |      4 | NULL | {"floor":"4","group":"6","room":"15","zone":"88","type":"0","nemo":"0"} |       0 |
-- +-----+-----------+--------+------+-------------------------------------------------------------------------+---------+

update th_rasp_ed set argumentos = '{"floor":"4","group":"6","room":"17","zone":"88","type":"0","nemo":"0"}' where id = 116;

-- select *from th_rasp_dali_s where argumentos like '%"88"%';
-- +----+-----------+--------+------+-------------------------------------------------------------------------+---------+
-- | id | codigo_tp | modulo | fk   | argumentos                                                              | inhibir |
-- +----+-----------+--------+------+-------------------------------------------------------------------------+---------+
-- | 83 |        83 |      4 | NULL | {"floor":"4","group":"6","room":"15","zone":"88","type":"1","nemo":"0"} |       0 |
-- +----+-----------+--------+------+-------------------------------------------------------------------------+---------+


-- Pasar luz focos techo comedor alejandro de cocina servicio a cocina alejandro
update luces set codigo_estancia = 17 where id = 88;
update th_rasp_sd set argumentos = '{"floor":"4","group":"6","room":"17","zone":"88","type":"0","nemo":"0"}' where id = 250;
update th_rasp_ed set argumentos = '{"floor":"4","group":"6","room":"17","zone":"88","type":"0","nemo":"0"}' where id = 116;
update th_rasp_dali_s set argumentos = '{"floor":"4","group":"6","room":"17","zone":"88","type":"1","nemo":"0"}' where id = 83;


-- escena apagar 63 -> 64 (operacion 153)
update relacion_escena_operacion set codigo_escena = 64 where id = 153;

-- escena maxima 72 -> 73 (operacion 165)
update relacion_escena_operacion set codigo_escena = 73 where id = 165;

-- escena standard 129 -> 130 (operacion 354)
update relacion_escena_operacion set codigo_escena = 130 where id = 357;

-- escena eco 141 -> 143 (operacion 355)
update relacion_escena_operacion set codigo_escena = 143 where id = 358;

-- escena eco 177 -> 179 (operacion 356)
--  la escena romantic en cocina alejandro no tiene operaciones
insert into relacion_escena_operacion (codigo_escena,codigo_operacion) values
(179,342),
(179,343);

update relacion_escena_operacion set codigo_escena = 179 where id = 359;
