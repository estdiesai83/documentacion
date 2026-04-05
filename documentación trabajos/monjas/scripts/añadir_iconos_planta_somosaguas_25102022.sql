-- +----+-------------------------+
-- | id | nemo                    |
-- +----+-------------------------+
-- |  1 | LAGOS Y JARNES          |
-- |  2 | ALUMBRADO EXTERIOR      |
-- |  3 | PLANTA PRIMERA          |
-- |  4 | PRINCIPAL ZONAS COMUNES |
-- |  5 | PRINCIPAL HABITACIONES  |
-- |  6 | SOTANO HABITACIONES     |
-- |  7 | SOTANO ZONAS COMUNES    |
-- |  8 | ZONAS GENERALES         |
-- +----+-------------------------+

-- Principal zonas comunes : fas fa-couch
-- Principal habitaciones : fas fa-bed
-- Sotano zonas comunes : fas fa-dice
-- Sotano habitaciones: fas fa-bed
-- Planta Primera : fas fa-tv
-- Zonas Generales: fas fa-cog
-- Alumbrado Exterior: fas fa-lightbulb
-- Lagos Y jardines: fas fa-seedling

alter table planta add column icono varchar(45) DEFAULT NULL;

-- lagos y jardines
update planta set icono = 'fas fa-seedling',nemo = 'LAGOS Y JARDINES' where id = 1;
-- alumbrado exterior
update planta set icono = 'fas fa-lightbulb' where id = 2;
-- planta primera
update planta set icono = 'fas fa-tv' where id = 3;
-- principal zonas comunes
update planta set icono = 'fas fa-couch' where id = 4;
-- principal habitaciones
update planta set icono = 'fas fa-bed' where id = 5;
-- sotano habitaciones
update planta set icono = 'fas fa-bed' where id = 6;
-- sotano zonas comunes
update planta set icono = 'fas fa-dice' where id = 7;
-- zonas generales
update planta set icono = 'fas fa-cog' where id = 8;


use sistema_pr_montecerrado;
alter table planta add column icono varchar(45) DEFAULT NULL;
alter table relacion_clima add column rb_e_estado int(11) DEFAULT -1;
alter table relacion_clima add column codigo_tp_e_estado int(11) DEFAULT -1;

use sistema_montecerrado;
alter table planta add column icono varchar(45) DEFAULT NULL;
alter table relacion_clima add column rb_e_estado int(11) DEFAULT -1;
alter table relacion_clima add column codigo_tp_e_estado int(11) DEFAULT -1;

use sistema_somosaguas;
alter table planta add column icono varchar(45) DEFAULT NULL;

use sistema_rudy_v2;
alter table planta add column icono varchar(45) DEFAULT NULL;
alter table relacion_clima add column rb_e_estado int(11) DEFAULT -1;
alter table relacion_clima add column codigo_tp_e_estado int(11) DEFAULT -1;

