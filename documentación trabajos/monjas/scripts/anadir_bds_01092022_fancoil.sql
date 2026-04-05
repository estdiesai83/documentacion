use sistema_pr_somosaguas;

ALTER TABLE clima ADD COLUMN sleep_fancoil int(11) default -1;
ALTER TABLE relacion_clima change COLUMN consigna_fancoil codigo_sleep int (11);

use sistema_rudy_v2;

alter table grupo_bombas add column modo int(11) default 0;
alter table grupo_bombas add column programacion int(11) default 0;

alter table grupo_luces add column modo int(11) default 0;
alter table grupo_luces add column programacion int(11) default 0;

update grupo_luces set modo = 0, programacion = 0;
update grupo_bombas set modo = 0, programacion = 0;

use sistema_pr_montecerrado;

alter table grupo_bombas add column modo int(11) default 0;
alter table grupo_bombas add column programacion int(11) default 0;

alter table grupo_luces add column modo int(11) default 0;
alter table grupo_luces add column programacion int(11) default 0;

update grupo_luces set modo = 0, programacion = 0;
update grupo_bombas set modo = 0, programacion = 0;

use sistema_montecerrado;

alter table grupo_bombas add column modo int(11) default 0;
alter table grupo_bombas add column programacion int(11) default 0;

alter table grupo_luces add column modo int(11) default 0;
alter table grupo_luces add column programacion int(11) default 0;

update grupo_luces set modo = 0, programacion = 0;
update grupo_bombas set modo = 0, programacion = 0;




CREATE TABLE `operacion_bombas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_bombas` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_bombas` (`codigo_bombas`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `ope_bombas_ibfk_1` FOREIGN KEY (`codigo_bombas`) REFERENCES `bombas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ope_bombas_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


use sistema_pr_montecerrado;

ALTER TABLE clima ADD COLUMN sleep_fancoil int(11) default -1;
ALTER TABLE relacion_clima change COLUMN consigna_fancoil codigo_sleep int (11);


CREATE TABLE `operacion_bombas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_bombas` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_bombas` (`codigo_bombas`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `ope_bombas_ibfk_1` FOREIGN KEY (`codigo_bombas`) REFERENCES `bombas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ope_bombas_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


use sistema_montecerrado;

ALTER TABLE clima ADD COLUMN sleep_fancoil int(11) default -1;
ALTER TABLE relacion_clima change COLUMN consigna_fancoil codigo_sleep int (11);


CREATE TABLE `operacion_bombas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_bombas` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_bombas` (`codigo_bombas`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `ope_bombas_ibfk_1` FOREIGN KEY (`codigo_bombas`) REFERENCES `bombas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ope_bombas_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


use sistema_rudy_v2;

ALTER TABLE clima ADD COLUMN sleep_fancoil int(11) default -1;
ALTER TABLE relacion_clima change COLUMN consigna_fancoil codigo_sleep int (11);


CREATE TABLE `operacion_bombas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_bombas` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_bombas` (`codigo_bombas`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `ope_bombas_ibfk_1` FOREIGN KEY (`codigo_bombas`) REFERENCES `bombas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ope_bombas_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


use sistema_somosaguas;

ALTER TABLE clima ADD COLUMN sleep_fancoil int(11) default -1;
ALTER TABLE relacion_clima change COLUMN consigna_fancoil codigo_sleep int (11);


CREATE TABLE `operacion_bombas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_bombas` int(11) NOT NULL,
  `codigo_operacion` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `codigo_bombas` (`codigo_bombas`),
  KEY `codigo_operacion` (`codigo_operacion`),
  CONSTRAINT `ope_bombas_ibfk_1` FOREIGN KEY (`codigo_bombas`) REFERENCES `bombas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ope_bombas_ibfk_2` FOREIGN KEY (`codigo_operacion`) REFERENCES `operacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




use sistema_pr_somosaguas;

ALTER TABLE clima ADD COLUMN estado_fancoil int(11) DEFAULT -1;
ALTER TABLE clima ADD COLUMN velocidad_fancoil int(11) DEFAULT -1;
ALTER TABLE clima ADD COLUMN sleep_fancoil int(11) default -1;


ALTER TABLE clima_previo_rutina ADD COLUMN estado_fancoil int(11) DEFAULT -1;
ALTER TABLE clima_previo_rutina ADD COLUMN velocidad_fancoil int(11) DEFAULT -1;

ALTER TABLE relacion_clima ADD COLUMN rb_fancoil int(11) default -1;
ALTER TABLE relacion_clima ADD COLUMN codigo_tp_fancoil int(11) default -1;
ALTER TABLE relacion_clima ADD COLUMN codigo_tp_vel1 int(11) default -1;
ALTER TABLE relacion_clima ADD COLUMN codigo_tp_vel2 int(11) default -1;
ALTER TABLE relacion_clima ADD COLUMN codigo_tp_vel3 int(11) default -1;
ALTER TABLE relacion_clima ADD COLUMN codigo_sleep int(11) default -1;





use sistema_somosaguas;


ALTER TABLE clima ADD COLUMN estado_fancoil int(11) DEFAULT -1;
ALTER TABLE clima ADD COLUMN velocidad_fancoil int(11) DEFAULT -1;
ALTER TABLE clima ADD COLUMN sleep_fancoil int(11) default -1;


ALTER TABLE clima_previo_rutina ADD COLUMN estado_fancoil int(11) DEFAULT -1;
ALTER TABLE clima_previo_rutina ADD COLUMN velocidad_fancoil int(11) DEFAULT -1;

ALTER TABLE relacion_clima ADD COLUMN rb_fancoil int(11) default -1;
ALTER TABLE relacion_clima ADD COLUMN codigo_tp_fancoil int(11) default -1;
ALTER TABLE relacion_clima ADD COLUMN codigo_tp_vel1 int(11) default -1;
ALTER TABLE relacion_clima ADD COLUMN codigo_tp_vel2 int(11) default -1;
ALTER TABLE relacion_clima ADD COLUMN codigo_tp_vel3 int(11) default -1;
ALTER TABLE relacion_clima ADD COLUMN codigo_sleep int(11) default -1;




use sistema_montecerrado;

ALTER TABLE clima ADD COLUMN estado_fancoil int(11) DEFAULT -1;
ALTER TABLE clima ADD COLUMN velocidad_fancoil int(11) DEFAULT -1;
ALTER TABLE clima ADD COLUMN sleep_fancoil int(11) default -1;


ALTER TABLE clima_previo_rutina ADD COLUMN estado_fancoil int(11) DEFAULT -1;
ALTER TABLE clima_previo_rutina ADD COLUMN velocidad_fancoil int(11) DEFAULT -1;

ALTER TABLE relacion_clima ADD COLUMN rb_fancoil int(11) default -1;
ALTER TABLE relacion_clima ADD COLUMN codigo_tp_fancoil int(11) default -1;
ALTER TABLE relacion_clima ADD COLUMN codigo_tp_vel1 int(11) default -1;
ALTER TABLE relacion_clima ADD COLUMN codigo_tp_vel2 int(11) default -1;
ALTER TABLE relacion_clima ADD COLUMN codigo_tp_vel3 int(11) default -1;
ALTER TABLE relacion_clima ADD COLUMN codigo_sleep int(11) default -1;



use sistema_pr_montecerrado;


ALTER TABLE clima ADD COLUMN estado_fancoil int(11) DEFAULT -1;
ALTER TABLE clima ADD COLUMN velocidad_fancoil int(11) DEFAULT -1;
ALTER TABLE clima ADD COLUMN sleep_fancoil int(11) default -1;


ALTER TABLE clima_previo_rutina ADD COLUMN estado_fancoil int(11) DEFAULT -1;
ALTER TABLE clima_previo_rutina ADD COLUMN velocidad_fancoil int(11) DEFAULT -1;

ALTER TABLE relacion_clima ADD COLUMN rb_fancoil int(11) default -1;
ALTER TABLE relacion_clima ADD COLUMN codigo_tp_fancoil int(11) default -1;
ALTER TABLE relacion_clima ADD COLUMN codigo_tp_vel1 int(11) default -1;
ALTER TABLE relacion_clima ADD COLUMN codigo_tp_vel2 int(11) default -1;
ALTER TABLE relacion_clima ADD COLUMN codigo_tp_vel3 int(11) default -1;
ALTER TABLE relacion_clima ADD COLUMN codigo_sleep int(11) default -1;


use sistema_rudy_v2;


ALTER TABLE clima ADD COLUMN estado_fancoil int(11) DEFAULT -1;
ALTER TABLE clima ADD COLUMN velocidad_fancoil int(11) DEFAULT -1;
ALTER TABLE clima ADD COLUMN sleep_fancoil int(11) default -1;


ALTER TABLE clima_previo_rutina ADD COLUMN estado_fancoil int(11) DEFAULT -1;
ALTER TABLE clima_previo_rutina ADD COLUMN velocidad_fancoil int(11) DEFAULT -1;

ALTER TABLE relacion_clima ADD COLUMN rb_fancoil int(11) default -1;
ALTER TABLE relacion_clima ADD COLUMN codigo_tp_fancoil int(11) default -1;
ALTER TABLE relacion_clima ADD COLUMN codigo_tp_vel1 int(11) default -1;
ALTER TABLE relacion_clima ADD COLUMN codigo_tp_vel2 int(11) default -1;
ALTER TABLE relacion_clima ADD COLUMN codigo_tp_vel3 int(11) default -1;
ALTER TABLE relacion_clima ADD COLUMN codigo_sleep int(11) default -1;




