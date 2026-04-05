use sistema_somosaguas;

alter table rutina change column hora_inicio hora_inicio varchar(11) NOT NULL;
alter table rutina change column hora_fin hora_fin varchar(11) DEFAULT NULL;

alter table rutina add column tipo_inicio int(11) NOT NULL;
alter table rutina add column tipo_fin int(11) DEFAULT NULL;


use sistema_pr_montecerrado;

alter table rutina change column hora_inicio hora_inicio varchar(11) NOT NULL;
alter table rutina change column hora_fin hora_fin varchar(11) DEFAULT NULL;

alter table rutina add column tipo_inicio int(11) NOT NULL;
alter table rutina add column tipo_fin int(11) DEFAULT NULL;


use sistema_montecerrado;

alter table rutina change column hora_inicio hora_inicio varchar(11) NOT NULL;
alter table rutina change column hora_fin hora_fin varchar(11) DEFAULT NULL;

alter table rutina add column tipo_inicio int(11) NOT NULL;
alter table rutina add column tipo_fin int(11) DEFAULT NULL;

use sistema_rudy_v2;

alter table rutina change column hora_inicio hora_inicio varchar(11) NOT NULL;
alter table rutina change column hora_fin hora_fin varchar(11) DEFAULT NULL;

alter table rutina add column tipo_inicio int(11) NOT NULL;
alter table rutina add column tipo_fin int(11) DEFAULT NULL;






