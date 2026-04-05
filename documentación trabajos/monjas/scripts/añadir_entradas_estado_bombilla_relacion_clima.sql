alter table relacion_clima add column rb_e_estado int(11) DEFAULT -1;
alter table relacion_clima add column codigo_tp_e_estado int(11) DEFAULT -1;


update relacion_clima set rb_e_estado = 1, codigo_tp_e_estado = 10 where codigo_clima = 1;
update relacion_clima set rb_e_estado = 10, codigo_tp_e_estado = 24 where codigo_clima = 2;
update relacion_clima set rb_e_estado = 19, codigo_tp_e_estado = 38 where codigo_clima = 3;
update relacion_clima set rb_e_estado = 28, codigo_tp_e_estado = 52 where codigo_clima = 4;
update relacion_clima set rb_e_estado = 37, codigo_tp_e_estado = 66 where codigo_clima = 5;
update relacion_clima set rb_e_estado = 46, codigo_tp_e_estado = 80 where codigo_clima = 6;
update relacion_clima set rb_e_estado = 61, codigo_tp_e_estado = 94 where codigo_clima = 7;
update relacion_clima set rb_e_estado = 69, codigo_tp_e_estado = 103 where codigo_clima = 8;
update relacion_clima set rb_e_estado = 69, codigo_tp_e_estado = 102 where codigo_clima = 9;
update relacion_clima set rb_e_estado = 103, codigo_tp_e_estado = 133 where codigo_clima = 13;
update relacion_clima set rb_e_estado = 207, codigo_tp_e_estado = 7 where codigo_clima = 14;
update relacion_clima set rb_e_estado = 207, codigo_tp_e_estado = 8 where codigo_clima = 15;
update relacion_clima set rb_e_estado = 208, codigo_tp_e_estado = 9 where codigo_clima = 16;
update relacion_clima set rb_e_estado = 208, codigo_tp_e_estado = 10 where codigo_clima = 17;
update relacion_clima set rb_e_estado = 208, codigo_tp_e_estado = 11 where codigo_clima = 18;
update relacion_clima set rb_e_estado = 208, codigo_tp_e_estado = 12 where codigo_clima = 19;
update relacion_clima set rb_e_estado = 184, codigo_tp_e_estado = 190 where codigo_clima = 20;
update relacion_clima set rb_e_estado = 184, codigo_tp_e_estado = 189 where codigo_clima = 21;
update relacion_clima set rb_e_estado = 103, codigo_tp_e_estado = 134 where codigo_clima = 23;


update th_iber_8ed_conv set codigo_tp = 12 where id = 10;
