

update luces set rgb = NULL where rgb = -1;


-- cambio grupo 0 a grupo 5 rb 488
update iniciarhilostrb set argumentos = '{"ip":"80.28.98.191","port":"53132","converter":"0","command":"69","id":"15"}' where id = 714;
update iniciarhilostrb set argumentos = '{"ip":"80.28.98.191","port":"53132","converter":"0","command":"69","id":"15"}' where id = 715;

-- cambio grupo 1 a grupo 6 rb 489
update iniciarhilostrb set argumentos = '{"ip":"80.28.98.191","port":"53132","converter":"0","command":"70","id":"15"}' where id = 716;
update iniciarhilostrb set argumentos = '{"ip":"80.28.98.191","port":"53132","converter":"0","command":"70","id":"15"}' where id = 717;

-- cambio grupo 2 a grupo 7 rb 490
update iniciarhilostrb set argumentos = '{"ip":"80.28.98.191","port":"53132","converter":"0","command":"71","id":"15"}' where id = 718;
update iniciarhilostrb set argumentos = '{"ip":"80.28.98.191","port":"53132","converter":"0","command":"71","id":"15"}' where id = 719;

-- cambio grupo 3 a grupo 7 rb 491
update iniciarhilostrb set argumentos = '{"ip":"80.28.98.191","port":"53132","converter":"0","command":"72","id":"15"}' where id = 720;

-- cambio grupo 4 a grupo 0 rb 492
update iniciarhilostrb set argumentos = '{"ip":"80.28.98.191","port":"53132","converter":"0","command":"64","id":"15"}' where id = 721;

update rb set numcomando = 69 where id = 488;
update rb set numcomando = 70 where id = 489;
update rb set numcomando = 71 where id = 490;
update rb set numcomando = 72 where id = 491;
update rb set numcomando = 64 where id = 492;

-- modificaciones en tabla luces
update luces set nemo = 'Led Espejo Baño 2', codigo_estancia = 59, rgb = NULL, temperatura = -1 where id = 116;

-- piscina interior
update luces set intensidad = 100, rgb = '255$255$255', temperatura = 0 where id = 110;
update luces set intensidad = 100, rgb = '255$255$255', temperatura = 0 where id = 111;

update relacion_luces set rb_e_estado = 314 , codigo_tp_e_estado = 169,rb_dali1=488,codigo_tp_int1=99,codigo_tp_rgb1=100,rb_dali2=489,codigo_tp_int2=101,codigo_tp_rgb2=102,rb_dali3=490,codigo_tp_int3=103,codigo_tp_rgb3=104,rb_dali4=491,codigo_tp_temp=105 where codigo_luces = 110;
update relacion_luces set rb_e_estado = 314 , codigo_tp_e_estado = 170,rb_dali1=506,codigo_tp_int1=111,codigo_tp_rgb1=112,rb_dali2=507,codigo_tp_int2=113,codigo_tp_rgb2=114,rb_dali3=508,codigo_tp_int3=115,codigo_tp_rgb3=116,rb_dali4=509,codigo_tp_temp=117 where codigo_luces = 111;





-- baño 1
update luces set intensidad = 100 where id = 107;
update luces set intensidad = 100 where id = 108;

update relacion_luces set rb_e_estado = 314 , codigo_tp_e_estado = 200,rb_dali1=502,codigo_tp_int1=107 where codigo_luces = 107;
update relacion_luces set rb_e_estado = 314 , codigo_tp_e_estado = 201,rb_dali1=503,codigo_tp_int1=108 where codigo_luces = 108;

update operacion_luces set intensidad = 100 where id =293;
update operacion_luces set intensidad = 100 where id =294;


-- baño 2
update luces set intensidad = 100 where id = 109;
update luces set intensidad = 100 where id = 116;

update relacion_luces set rb_e_estado = 314 , codigo_tp_e_estado = 202,rb_dali1=504,codigo_tp_int1=109 where codigo_luces = 109;
update relacion_luces set rb_s_estado = 315, codigo_tp_s_estado =  186, rb_e_estado = 314 , codigo_tp_e_estado = 206,rb_dali1=505,codigo_tp_int1=110,rb_dali2=-1,codigo_tp_int2=-1,codigo_tp_rgb2=-1,rb_dali3=-1,codigo_tp_int3=-1,codigo_tp_rgb3=-1,rb_dali4=-1,codigo_tp_temp=-1,rb_dali5=-1,codigo_tp_int5=-1 where codigo_luces = 116;


--  vestibulo

update relacion_luces set rb_e_estado = 314 , codigo_tp_e_estado = 199, rb_dali1=492,codigo_tp_int1=106 where codigo_luces = 106;


-- luces gimnasio
update operacion_luces set intensidad = 100 where id = 289;
update operacion_luces set intensidad = 100 where id = 290;

update luces set intensidad = 100 where id = 104;
update luces set intensidad = 100 where id = 105;


update relacion_luces set rb_e_estado =499 ,codigo_tp_e_estado =228,rb_dali1 = 522,codigo_tp_int1=119 where codigo_luces = 104;
update relacion_luces set rb_e_estado =499 ,codigo_tp_e_estado =229,rb_dali1 = 523,codigo_tp_int1=120 where codigo_luces = 105;

-- piscina exterior

-- piscina interior

update operacion_luces set intensidad = 100, rgb = '255$255$255', temperatura = 0 where id = 297;
update operacion_luces set intensidad = 100, rgb = '255$255$255', temperatura = 0 where id = 298;


update operacion_luces set intensidad = 50, rgb = '255$255$255', temperatura = 0 where id = 313;
update operacion_luces set intensidad = 50, rgb = '255$255$255', temperatura = 0 where id = 314;

-- +-----+---------------------+------------------------+-----------------+--------+------------+-------------+-------------+
-- | id  | fecha               | nemo                   | codigo_estancia | estado | intensidad | rgb         | temperatura |
-- +-----+---------------------+------------------------+-----------------+--------+------------+-------------+-------------+
-- | 110 | 2022-07-15 08:36:00 | Led perimetro techo    |              41 |      0 |         -1 | -1          |          -1 |
-- | 111 | 2022-07-15 08:36:00 | Led hamacas interiores |              41 |      0 |         -1 | -1          |          -1 |
-- | 116 | 2022-08-30 11:21:28 | piscina interior       |              41 |      0 |        100 | 255$255$255 |           0 |
-- +-----+---------------------+------------------------+-----------------+--------+------------+-------------+-------------+




-- +-----+------+-------------------------------------------------------------------------------+-----------+--------+---------+------+---------+
-- | id  | trb  | argumentos                                                                    | codigo_rb | bornas | inhibir | tipo | subtipo |
-- +-----+------+-------------------------------------------------------------------------------+-----------+--------+---------+------+---------+
-- | 714 |    8 | {"ip":"80.28.98.191","port":"53132","converter":"0","command":"64","id":"15"} |       488 | 1      |       0 |    1 |       0 |
-- | 715 |    8 | {"ip":"80.28.98.191","port":"53132","converter":"0","command":"64","id":"15"} |       488 | 3      |       0 |    1 |       0 |
-- | 716 |    8 | {"ip":"80.28.98.191","port":"53132","converter":"0","command":"65","id":"15"} |       489 | 1      |       0 |    1 |       0 |
-- | 717 |    8 | {"ip":"80.28.98.191","port":"53132","converter":"0","command":"65","id":"15"} |       489 | 3      |       0 |    1 |       0 |
-- | 718 |    8 | {"ip":"80.28.98.191","port":"53132","converter":"0","command":"66","id":"15"} |       490 | 1      |       0 |    1 |       0 |
-- | 719 |    8 | {"ip":"80.28.98.191","port":"53132","converter":"0","command":"66","id":"15"} |       490 | 3      |       0 |    1 |       0 |
-- | 720 |    8 | {"ip":"80.28.98.191","port":"53132","converter":"0","command":"67","id":"15"} |       491 | 4      |       0 |    1 |       0 |
-- | 721 |    8 | {"ip":"80.28.98.191","port":"53132","converter":"0","command":"68","id":"15"} |       492 | 1      |       0 |    1 |       0 |
-- +-----+------+-------------------------------------------------------------------------------+-----------+--------+---------+------+---------+
