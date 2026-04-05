use sistema_pr_montecerrado;

alter table escenas add column tipo int(11) default NULL;

alter table escena_luces drop column nemo;
alter table escena_iot drop column nemo;
alter table escena_clima drop column nemo;
alter table escena_estor drop column nemo;

use sistema_montecerrado;

alter table escenas add column tipo int(11) default NULL;

alter table escena_luces drop column nemo;
alter table escena_iot drop column nemo;
alter table escena_clima drop column nemo;
alter table escena_estor drop column nemo;

use sistema_pr_somosaguas;

alter table escenas add column tipo int(11) default NULL;

alter table escena_luces drop column nemo;
alter table escena_iot drop column nemo;
alter table escena_clima drop column nemo;
alter table escena_estor drop column nemo;

use sistema_rudy_v2;

alter table escenas add column tipo int(11) default NULL;


alter table escena_luces drop column nemo;
alter table escena_iot drop column nemo;
alter table escena_clima drop column nemo;
alter table escena_estor drop column nemo;
