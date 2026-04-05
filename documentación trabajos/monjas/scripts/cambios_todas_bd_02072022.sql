

use sistema_pr_montecerrado;

alter table trb_rasp_dali_s change column valor valor varchar(15);
alter table relacion_luces drop column codigo_tp_temp1;
alter table relacion_luces drop column codigo_tp_temp2;
alter table relacion_luces drop column codigo_tp_temp3;
alter table relacion_luces drop column rb_temp;
alter table relacion_luces drop column codigo_tp_temp;
alter table relacion_luces drop column rb_int_temp;
alter table relacion_luces drop column codigo_tp_int_temp;

alter table relacion_luces add column rb_dali4 int(11) default -1;
alter table relacion_luces add column codigo_tp_temp int(11) default -1;
alter table relacion_luces add column rb_dali5 int(11) default -1;
alter table relacion_luces add column codigo_tp_int5 int(11) default -1;

use sistema_montecerrado;

alter table trb_rasp_dali_s change column valor valor varchar(15);
alter table relacion_luces drop column codigo_tp_temp1;
alter table relacion_luces drop column codigo_tp_temp2;
alter table relacion_luces drop column codigo_tp_temp3;
alter table relacion_luces drop column rb_temp;
alter table relacion_luces drop column codigo_tp_temp;
alter table relacion_luces drop column rb_int_temp;
alter table relacion_luces drop column codigo_tp_int_temp;

alter table relacion_luces add column rb_dali4 int(11) default -1;
alter table relacion_luces add column codigo_tp_temp int(11) default -1;
alter table relacion_luces add column rb_dali5 int(11) default -1;
alter table relacion_luces add column codigo_tp_int5 int(11) default -1;

use sistema_rudy_v2;

alter table trb_rasp_dali_s change column valor valor varchar(15);
alter table relacion_luces drop column codigo_tp_temp1;
alter table relacion_luces drop column codigo_tp_temp2;
alter table relacion_luces drop column codigo_tp_temp3;
alter table relacion_luces drop column rb_temp;
alter table relacion_luces drop column codigo_tp_temp;
alter table relacion_luces drop column rb_int_temp;
alter table relacion_luces drop column codigo_tp_int_temp;

alter table relacion_luces add column rb_dali4 int(11) default -1;
alter table relacion_luces add column codigo_tp_temp int(11) default -1;
alter table relacion_luces add column rb_dali5 int(11) default -1;
alter table relacion_luces add column codigo_tp_int5 int(11) default -1;
