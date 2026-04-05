use sistema_pr_somosaguas;
ALTER TABLE comando add column emisor varchar(20) default null;
ALTER TABLE comando add column receptor varchar(20) default null;

ALTER table relacion_estor change column codigo_tp codigo_tp_estado int(11) default null;
ALTER table relacion_estor add column codigo_tp_consigna int(11) default null;
ALTER table relacion_persianas change column codigo_tp codigo_tp_estado int(11) default null;
ALTER table relacion_persianas add column codigo_tp_consigna int(11) default null;

ALTER table estor change column nivel consigna int(11) default null;
ALTER table persianas change column nivel consigna int(11) default null;
ALTER table estor_previo_rutina change column nivel consigna int(11) default null;
ALTER table persianas_previo_rutina change column nivel consigna int(11) default null;
ALTER table operacion_estores change column nivel consigna int(11) default null;
ALTER table operacion_persianas change column nivel consigna int(11) default null;


use sistema_somosaguas;
ALTER TABLE comando add column emisor varchar(20) default null;
ALTER TABLE comando add column receptor varchar(20) default null;

ALTER table relacion_estor change column codigo_tp codigo_tp_estado int(11) default null;
ALTER table relacion_estor add column codigo_tp_consigna int(11) default null;
ALTER table relacion_persianas change column codigo_tp codigo_tp_estado int(11) default null;
ALTER table relacion_persianas add column codigo_tp_consigna int(11) default null;

ALTER table estor change column nivel consigna int(11) default null;
ALTER table persianas change column nivel consigna int(11) default null;
ALTER table estor_previo_rutina change column nivel consigna int(11) default null;
ALTER table persianas_previo_rutina change column nivel consigna int(11) default null;
ALTER table operacion_estores change column nivel consigna int(11) default null;
ALTER table operacion_persianas change column nivel consigna int(11) default null;


use sistema_pr_montecerrado;
ALTER TABLE comando add column emisor varchar(20) default null;
ALTER TABLE comando add column receptor varchar(20) default null;

ALTER table relacion_estor change column codigo_tp codigo_tp_estado int(11) default null;
ALTER table relacion_estor add column codigo_tp_consigna int(11) default null;
ALTER table relacion_persianas change column codigo_tp codigo_tp_estado int(11) default null;
ALTER table relacion_persianas add column codigo_tp_consigna int(11) default null;

ALTER table estor change column nivel consigna int(11) default null;
ALTER table persianas change column nivel consigna int(11) default null;
ALTER table estor_previo_rutina change column nivel consigna int(11) default null;
ALTER table persianas_previo_rutina change column nivel consigna int(11) default null;
ALTER table operacion_estores change column nivel consigna int(11) default null;
ALTER table operacion_persianas change column nivel consigna int(11) default null;


use sistema_montecerrado;
ALTER TABLE comando add column emisor varchar(20) default null;
ALTER TABLE comando add column receptor varchar(20) default null;

ALTER table relacion_estor change column codigo_tp codigo_tp_estado int(11) default null;
ALTER table relacion_estor add column codigo_tp_consigna int(11) default null;
ALTER table relacion_persianas change column codigo_tp codigo_tp_estado int(11) default null;
ALTER table relacion_persianas add column codigo_tp_consigna int(11) default null;

ALTER table estor change column nivel consigna int(11) default null;
ALTER table persianas change column nivel consigna int(11) default null;
ALTER table estor_previo_rutina change column nivel consigna int(11) default null;
ALTER table persianas_previo_rutina change column nivel consigna int(11) default null;
ALTER table operacion_estores change column nivel consigna int(11) default null;
ALTER table operacion_persianas change column nivel consigna int(11) default null;


use sistema_rudy_v2;
ALTER TABLE comando add column emisor varchar(20) default null;
ALTER TABLE comando add column receptor varchar(20) default null;

ALTER table relacion_estor change column codigo_tp codigo_tp_estado int(11) default null;
ALTER table relacion_estor add column codigo_tp_consigna int(11) default null;
ALTER table relacion_persianas change column codigo_tp codigo_tp_estado int(11) default null;
ALTER table relacion_persianas add column codigo_tp_consigna int(11) default null;

ALTER table estor change column nivel consigna int(11) default null;
ALTER table persianas change column nivel consigna int(11) default null;
ALTER table estor_previo_rutina change column nivel consigna int(11) default null;
ALTER table persianas_previo_rutina change column nivel consigna int(11) default null;
ALTER table operacion_estores change column nivel consigna int(11) default null;
ALTER table operacion_persianas change column nivel consigna int(11) default null;


