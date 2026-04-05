use sistema_pr_montecerrado;

alter table relacion_estor add column rb_e int (11) default -1;
alter table relacion_estor add column codigo_tp_e_estado int (11) default -1;
alter table relacion_estor add column codigo_tp_e_consigna int (11) default -1;

use sistema_rudy_v2;

alter table relacion_estor add column rb_e int (11) default -1;
alter table relacion_estor add column codigo_tp_e_estado int (11) default -1;
alter table relacion_estor add column codigo_tp_e_consigna int (11) default -1;

use sistema_montecerrado;

alter table relacion_estor add column rb_e int (11) default -1;
alter table relacion_estor add column codigo_tp_e_estado int (11) default -1;
alter table relacion_estor add column codigo_tp_e_consigna int (11) default -1;


use sistema_pr_somosaguas;

alter table relacion_estor add column rb_e int (11) default -1;
alter table relacion_estor add column codigo_tp_e_estado int (11) default -1;
alter table relacion_estor add column codigo_tp_e_consigna int (11) default -1;

-- hab invitados
update relacion_estor set rb_e = 131, codigo_tp_e_consigna = 2 where rb = 132;
-- hab 5
update relacion_estor set rb_e = 133, codigo_tp_e_consigna = 4 where rb = 134;
-- hab 3
update relacion_estor set rb_e = 135, codigo_tp_e_consigna = 6 where rb = 136;
-- hab 4
update relacion_estor set rb_e = 137, codigo_tp_e_consigna = 8 where rb = 138;
-- hab 2
update relacion_estor set rb_e = 139, codigo_tp_e_consigna = 10 where rb = 140;
-- vestidor derecha
update relacion_estor set rb_e = 141, codigo_tp_e_consigna = 12 where rb = 142;
-- vestidor izq
update relacion_estor set rb_e = 143, codigo_tp_e_consigna = 14 where rb = 144;
-- hab estudio izq
update relacion_estor set rb_e = 145, codigo_tp_e_consigna = 16 where rb = 146;
-- hab estudio centro
update relacion_estor set rb_e = 147, codigo_tp_e_consigna = 18 where rb = 148;
-- hab estudio derecha
update relacion_estor set rb_e = 149, codigo_tp_e_consigna = 20 where rb = 150;
-- hab serv 1
update relacion_estor set rb_e = 151, codigo_tp_e_consigna = 22 where rb = 152;
-- hab serv 2 derecha
update relacion_estor set rb_e = 153, codigo_tp_e_consigna = 24 where rb = 154;
-- hab serv 2 izquierda
update relacion_estor set rb_e = 203, codigo_tp_e_consigna = 25 where rb = 204;
-- cocina
update relacion_estor set rb_e = 346, codigo_tp_e_consigna = 26 where rb = 347;
-- jacuzzi
update relacion_estor set rb_e = 524, codigo_tp_e_consigna = 27 where rb = 525;


use sistema_somosaguas;

alter table relacion_estor add column rb_e int (11) default -1;
alter table relacion_estor add column codigo_tp_e_estado int (11) default -1;
alter table relacion_estor add column codigo_tp_e_consigna int (11) default -1;

-- hab invitados
update relacion_estor set rb_e = 131, codigo_tp_e_consigna = 2 where rb = 132;
-- hab 5
update relacion_estor set rb_e = 133, codigo_tp_e_consigna = 4 where rb = 134;
-- hab 3
update relacion_estor set rb_e = 135, codigo_tp_e_consigna = 6 where rb = 136;
-- hab 4
update relacion_estor set rb_e = 137, codigo_tp_e_consigna = 8 where rb = 138;
-- hab 2
update relacion_estor set rb_e = 139, codigo_tp_e_consigna = 10 where rb = 140;
-- vestidor derecha
update relacion_estor set rb_e = 141, codigo_tp_e_consigna = 12 where rb = 142;
-- vestidor izq
update relacion_estor set rb_e = 143, codigo_tp_e_consigna = 14 where rb = 144;
-- hab estudio izq
update relacion_estor set rb_e = 145, codigo_tp_e_consigna = 16 where rb = 146;
-- hab estudio centro
update relacion_estor set rb_e = 147, codigo_tp_e_consigna = 18 where rb = 148;
-- hab estudio derecha
update relacion_estor set rb_e = 149, codigo_tp_e_consigna = 20 where rb = 150;
-- hab serv 1
update relacion_estor set rb_e = 151, codigo_tp_e_consigna = 22 where rb = 152;
-- hab serv 2 derecha
update relacion_estor set rb_e = 153, codigo_tp_e_consigna = 24 where rb = 154;
-- hab serv 2 izquierda
update relacion_estor set rb_e = 203, codigo_tp_e_consigna = 25 where rb = 204;
-- cocina
update relacion_estor set rb_e = 346, codigo_tp_e_consigna = 26 where rb = 347;
-- jacuzzi
update relacion_estor set rb_e = 524, codigo_tp_e_consigna = 27 where rb = 525;
