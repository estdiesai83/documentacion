use sistema_pr_montecerrado;

alter table escenas add column eliminado int(11) DEFAULT 0;
alter table ambiente add column eliminado int(11) DEFAULT 0;

use sistema_montecerrado;

alter table escenas add column eliminado int(11) DEFAULT 0;
alter table ambiente add column eliminado int(11) DEFAULT 0;


use sistema_pr_somosaguas;

alter table escenas add column eliminado int(11) DEFAULT 0;
alter table ambiente add column eliminado int(11) DEFAULT 0;

use sistema_somosaguas;

alter table escenas add column eliminado int(11) DEFAULT 0;
alter table ambiente add column eliminado int(11) DEFAULT 0;

use sistema_rudy_v2;

alter table escenas add column eliminado int(11) DEFAULT 0;
alter table ambiente add column eliminado int(11) DEFAULT 0;
