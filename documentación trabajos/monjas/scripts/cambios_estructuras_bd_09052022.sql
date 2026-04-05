use sistema_rudy_v2;

alter table tarea_bd change column tdatos tdatos json default null;
alter table tarea_bd change column valores valores json default null;

alter table tarea_rpc change column argumentos argumentos json default null;
alter table mto_tarea_rpc change column argumentos argumentos json default null;

alter table iniciarhilostrb change column argumentos argumentos json default null;

alter table th_analizador change column argumentos argumentos json default null;
alter table th_rasp_ed change column argumentos argumentos json default null;
alter table th_rasp_pulsos change column argumentos argumentos json default null;
alter table th_rasp_sa change column argumentos argumentos json default null;
alter table th_rasp_sd change column argumentos argumentos json default null;
alter table th_readwatt_e change column argumentos argumentos json default null;
alter table th_readwatt_s change column argumentos argumentos json default null;
alter table th_smart_x100 change column argumentos argumentos json default null;
alter table th_smart_x835 change column argumentos argumentos json default null;

use sistema_pr_montecerrado;

alter table tarea_bd change column tdatos tdatos json default null;
alter table tarea_bd change column valores valores json default null;
alter table tarea_rpc change column argumentos argumentos json default null;
alter table mto_tarea_rpc change column argumentos argumentos json default null;
alter table iniciarhilostrb change column argumentos argumentos json default null;

alter table th_rasp_dali_s change column argumentos argumentos json default null;
alter table th_rasp_ds18b20 change column argumentos argumentos json default null;
alter table th_rasp_ea change column argumentos argumentos json default null;
alter table th_rasp_ed change column argumentos argumentos json default null;
alter table th_rasp_pulsos change column argumentos argumentos json default null;
alter table th_rasp_sa change column argumentos argumentos json default null;
alter table th_rasp_sd change column argumentos argumentos json default null;

use sistema_montecerrado;


alter table tarea_bd change column tdatos tdatos json default null;
alter table tarea_bd change column valores valores json default null;
alter table tarea_rpc change column argumentos argumentos json default null;
alter table mto_tarea_rpc change column argumentos argumentos json default null;
alter table iniciarhilostrb change column argumentos argumentos json default null;

alter table th_rasp_dali_s change column argumentos argumentos json default null;
alter table th_rasp_ds18b20 change column argumentos argumentos json default null;
alter table th_rasp_ea change column argumentos argumentos json default null;
alter table th_rasp_ed change column argumentos argumentos json default null;
alter table th_rasp_pulsos change column argumentos argumentos json default null;
alter table th_rasp_sa change column argumentos argumentos json default null;
alter table th_rasp_sd change column argumentos argumentos json default null;

use sistema_pr_somosaguas;

alter table tarea_bd change column tdatos tdatos json default null;
alter table tarea_bd change column valores valores json default null;
alter table tarea_rpc change column argumentos argumentos json default null;
alter table mto_tarea_rpc change column argumentos argumentos json default null;
alter table iniciarhilostrb change column argumentos argumentos json default null;

alter table th_rasp_dali_s  change column argumentos argumentos json default null;
alter table th_rasp_ds18b20 change column argumentos argumentos json default null;
alter table th_rasp_ed change column argumentos argumentos json default null;
alter table th_rasp_pulsador change column argumentos argumentos json default null;
alter table th_rasp_sa change column argumentos argumentos json default null;
alter table th_rasp_sd change column argumentos argumentos json default null;

use sistema_somosaguas;

alter table tarea_bd change column tdatos tdatos json default null;
alter table tarea_bd change column valores valores json default null;
alter table tarea_rpc change column argumentos argumentos json default null;
alter table mto_tarea_rpc change column argumentos argumentos json default null;
alter table iniciarhilostrb change column argumentos argumentos json default null;

alter table th_rasp_dali_s  change column argumentos argumentos json default null;
alter table th_rasp_ds18b20 change column argumentos argumentos json default null;
alter table th_rasp_ed change column argumentos argumentos json default null;
alter table th_rasp_pulsador change column argumentos argumentos json default null;
alter table th_rasp_sa change column argumentos argumentos json default null;
alter table th_rasp_sd change column argumentos argumentos json default null;


use sistema_rudy_v2;
alter table tarea_bd add column condicion varchar(255) default null;
use sistema_pr_montecerrado;
alter table tarea_bd add column condicion varchar(255) default null;
use sistema_montecerrado;
alter table tarea_bd add column condicion varchar(255) default null;
use sistema_pr_somosaguas;
alter table tarea_bd add column condicion varchar(255) default null;
use sistema_somosaguas;
alter table tarea_bd add column condicion varchar(255) default null;
