use sistema_pr_somosaguas;

alter table relacion_clima add column rb_valvula int (11) default -1;
alter table relacion_clima add column codigo_tp_valvula int (11) default -1;

use sistema_pr_montecerrado;

alter table relacion_clima add column rb_valvula int (11) default -1;
alter table relacion_clima add column codigo_tp_valvula int (11) default -1;

use sistema_montecerrado;

alter table relacion_clima add column rb_valvula int (11) default -1;
alter table relacion_clima add column codigo_tp_valvula int (11) default -1;

use sistema_rudy_v2;

alter table relacion_clima add column rb_valvula int (11) default -1;
alter table relacion_clima add column codigo_tp_valvula int (11) default -1;

use sistema_somosaguas;

alter table relacion_clima add column rb_valvula int (11) default -1;
alter table relacion_clima add column codigo_tp_valvula int (11) default -1;



use sistema_somosaguas;

update relacion_clima set rb_valvula = rb_estado;
update relacion_clima set codigo_tp_valvula = codigo_tp_estado;

-- hab2
update relacion_clima set codigo_tp_valvula = 9 where id = 1;

update trb_rasp_sd set domo = 0 where id = 9;
update trb_rasp_sd set domo = 2 where id = 55;

-- hab3
update relacion_clima set rb_estado = 11, codigo_tp_estado = 57 where id = 2;

update trb_rasp_sd set domo = 0 where id = 18;
update trb_rasp_sd set domo = 2 where id = 57;

-- hab4
update relacion_clima set rb_estado = 20, codigo_tp_estado = 59 where id = 3;

update trb_rasp_sd set domo = 0 where id = 27;
update trb_rasp_sd set domo = 2 where id = 59;

-- hab5
update relacion_clima set rb_estado = 29, codigo_tp_estado = 61 where id = 4;

update trb_rasp_sd set domo = 0 where id = 36;
update trb_rasp_sd set domo = 2 where id = 61;

-- hab estudio no tiene valvula
update relacion_clima set rb_estado = 38, codigo_tp_estado = 63 where id = 5;
update relacion_clima set rb_valvula = -1, codigo_tp_valvula = -1 where id = 5;

update trb_rasp_sd set domo = 0 where id = 45;
update trb_rasp_sd set domo = 2 where id = 63;

-- hab invitados
update relacion_clima set rb_estado = 47, codigo_tp_estado = 65 where id = 6;

update trb_rasp_sd set domo = 0 where id = 54;
update trb_rasp_sd set domo = 2 where id = 65;

-- biblioteca
update relacion_clima set rb_estado = 62, codigo_tp_estado = 70  where id = 7;

update trb_iber_8sd_conv set domo = 0 where id = 13;
update trb_rasp_sd set domo = 2 where id = 70;

-- sala cine
update relacion_clima set rb_estado = 70, codigo_tp_estado = 79 where id = 8;

update trb_rasp_sd set domo = 0 where id = 152;
update trb_rasp_sd set domo = 2 where id = 79;

-- bar
update relacion_clima set rb_estado = 70, codigo_tp_estado = 78  where id = 9;

update trb_rasp_sd set domo = 0 where id = 151;
update trb_rasp_sd set domo = 2 where id = 78;

-- hab ser1
-- no tengo de nada
-- hab ser2
-- no tengo de nada
-- cocina comedor
-- no tengo de nada

-- sala tv
update relacion_clima set rb_estado = 104, codigo_tp_estado =113  where id = 13;

update trb_rasp_sd set domo = 0 where id = 111;
update trb_rasp_sd set domo = 2 where id = 113;

-- hab aleja
update relacion_clima set rb_estado = 205, codigo_tp_estado = 7 where id = 14;

update trb_iber_8sd_conv set domo = 0 where id = 1;
update trb_iber_8sd_conv set domo = 2 where id = 7;

-- baño alej
update relacion_clima set rb_estado = 205, codigo_tp_estado = 8 where id = 15;

update trb_iber_8sd_conv set domo = 0 where id = 2;
update trb_iber_8sd_conv set domo = 2 where id = 8;

-- vest alejandro
update relacion_clima set rb_estado = 206, codigo_tp_estado = 9 where id = 16;

update trb_iber_8sd_conv set domo = 0 where id = 3;
update trb_iber_8sd_conv set domo = 2 where id = 9;

-- hab rachel
update relacion_clima set rb_estado = 206, codigo_tp_estado = 10 where id = 17;

update trb_iber_8sd_conv set domo = 0 where id = 4;
update trb_iber_8sd_conv set domo = 2 where id = 10;

-- baño rachel
update relacion_clima set rb_estado = 206, codigo_tp_estado = 11 where id = 18;

update trb_iber_8sd_conv set domo = 0 where id = 5;
update trb_iber_8sd_conv set domo = 2 where id = 11;

-- vest rachel
update relacion_clima set rb_estado = 206, codigo_tp_estado = 12 where id = 19;

update trb_iber_8sd_conv set domo = 0 where id = 6;
update trb_iber_8sd_conv set domo = 2 where id = 12;

-- cocina ppal
update relacion_clima set rb_estado = 185, codigo_tp_estado = 158 where id = 20;

update trb_iber_8sd_conv set domo = 0 where id = 18;
update trb_rasp_sd set domo = 2 where id = 63;

-- cocina alejandro
update relacion_clima set rb_estado = 185, codigo_tp_estado = 157 where id = 21;

update trb_iber_8sd_conv set domo = 0 where id = 17;
update trb_rasp_sd set domo = 2 where id = 63;

-- pasillo habitaciones
update relacion_clima set rb_estado = -1, codigo_tp_estado = -1  where id = 22;
update relacion_clima set rb_valvula = 209, codigo_tp_valvula = 15  where id = 22;

update trb_iber_8sd_conv set domo = 0 where id = 15;

-- comedor
update relacion_clima set rb_estado = 104, codigo_tp_estado = 112 where id = 23;

update trb_rasp_sd set domo = 0 where id = 110;
update trb_rasp_sd set domo = 2 where id = 112;
