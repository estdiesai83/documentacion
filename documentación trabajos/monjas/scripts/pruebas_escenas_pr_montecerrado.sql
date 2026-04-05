use sistema_pr_montecerrado;

drop table if exists relacion_modo_escena;
drop table if exists modo;

alter table ambiente change column color color varchar(50) DEFAULT NULL;

alter table relacion_ambiente_operacion change column tiempo tiempo time DEFAULT NULL;
alter table relacion_ambiente_escena change column tiempo tiempo time DEFAULT NULL;

alter table rutina add column hora_inicio time DEFAULT NULL;
alter table rutina add column hora_fin time DEFAULT NULL;

alter table operacion_luces change column rgb rgb varchar(15) default -1;

alter table escena_luces add column nemo varchar(140) DEFAULT NULL;
alter table escena_clima add column nemo varchar(140) DEFAULT NULL;
alter table escena_estores add column nemo varchar(140) DEFAULT NULL;


alter table escenas drop column visible;

delete from escenas;
ALTER TABLE escenas AUTO_INCREMENT = 1;

-- id, fecha, nemo, codigo_estancia, tipodomo, estado
insert into escenas VALUES
-- salon bodega
(1, now(), 'standard', 4, 1 ,1),
-- cocina bodega
(2, now(), 'standard', 20, 1 ,1),
-- garaje
(3, now(), 'standard', 21, 1 ,1),
-- salon bodega
(4, now(), 'eco', 4, 1 ,1),
-- codina bodega
(5, now(), 'eco', 20, 1 ,1),
-- garaje
(6, now(), 'eco', 21, 1 ,1);

insert into escenas VALUES
-- salon bodega
(7, now(), 'romantic', 4, 1 ,1),
-- cocina bodega
(8, now(), 'romantic', 20, 1 ,1),
-- garaje
(9, now(), 'romantic', 21, 1 ,1),
-- salon bodega
(10, now(), 'confort', 4, 1 ,1),
-- codina bodega
(11, now(), 'confort', 20, 1 ,1),
-- garaje
(12, now(), 'confort', 21, 1 ,1);

delete from operacion;
ALTER TABLE operacion AUTO_INCREMENT = 1;

insert into operacion VALUES
-- salon bodega standard
(1, 1,1),
-- codina bodega standard
(2, 1,1),
-- garaje standard
(3, 1,1),
-- salon bodega eco
(4, 1,1),
-- codina bodega eco
(5, 1,1),
-- garaje eco
(6, 1,1);

-- romantic, confort
insert into operacion VALUES
-- salon bodega standard
(7, 1,1),
-- codina bodega standard
(8, 1,1),
-- garaje standard
(9, 1,1),
-- salon bodega eco
(10, 1,1),
-- codina bodega eco
(11, 1,1),
-- garaje eco
(12, 1,1);

delete from operacion_luces;
ALTER TABLE operacion_luces AUTO_INCREMENT = 1;

insert into operacion_luces VALUES
-- led entrada salon bodega standard
(1, 7, 1, 1, 100, -1),
-- led techo salon bodega standard
(2, 8, 1, 1, 100, -1),
-- led suelo salon bodega standard
(3, 9, 1, 1, 100, -1),
-- cocina bodega standard
(4, 10, 2, 1, -1, -1),
-- garaje standard
(5, 11, 3, 1, -1, -1),
-- garaje rgb standard
(6, 12, 3, 0, 100, '255$255$255'),
-- led entrada salon bodega eco
(7, 7, 4, 0, 50, -1),
-- led techo salon bodega eco
(8, 8, 4, 0, 50, -1),
-- led suelo salon bodega eco
(9, 9, 4, 0, 50, -1),
-- cocina bodega eco
(10, 10, 5, 0,  -1, -1),
-- garaje eco
(11, 11, 6, 0, -1, -1),
-- garaje rgb eco
(12, 12, 6, 0, 50, '200$200$200');


-- romantic, confort

insert into operacion_luces VALUES
-- led entrada salon bodega standard
(13, 7, 7, 0, 30, -1),
-- led techo salon bodega standard
(14, 8, 7, 0, 30, -1),
-- led suelo salon bodega standard
(15, 9, 7, 0, 30, -1),
-- cocina bodega standard
(16, 10, 8, 0, -1, -1),
-- garaje standard
(17, 11, 9, 0, -1, -1),
-- garaje rgb standard
(18, 12, 9, 0, 30, '220$220$220'),
-- led entrada salon bodega eco
(19, 7, 10, 0, 70, -1),
-- led techo salon bodega eco
(20, 8, 10, 0, 70, -1),
-- led suelo salon bodega eco
(21, 9, 10, 0, 70, -1),
-- cocina bodega eco
(22, 10, 11, 0,  -1, -1),
-- garaje eco
(23, 11, 12, 0, -1, -1),
-- garaje rgb eco
(24, 12, 12, 0, 70, '240$240$240');


delete from escena_luces;
ALTER TABLE escena_luces AUTO_INCREMENT = 1;

insert into escena_luces VALUES
(1,'standard', 1, 1),
(2,'standard', 2, 2),
(3,'standard', 3, 3),
(4, 'eco', 4, 4),
(5, 'eco', 5, 5),
(6, 'eco', 6, 6);


insert into escena_luces VALUES
(1, 1, 1,'standard'),
(2, 2, 2,'standard'),
(3, 3, 3,'standard'),
(4, 4, 4, 'eco'),
(5, 5, 5, 'eco'),
(6, 6, 6, 'eco');

-- romantic, confort

insert into escena_luces VALUES
(7,'romantic', 7, 7),
(8,'romantic', 8, 8),
(9,'romantic', 9, 9),
(10, 'confort', 10, 10),
(11, 'confort', 11, 12),
(12, 'confort', 12, 12);


insert into escena_luces VALUES
(7, 7, 7,'romantic'),
(8, 8, 8,'romantic'),
(9, 9, 9,'romantic'),
(10, 10, 10, 'confort'),
(11, 11, 11, 'confort'),
(12, 12, 12, 'confort');


delete from ambiente;
ALTER TABLE ambiente AUTO_INCREMENT = 1;


delete from relacion_ambiente_operacion;
ALTER TABLE relacion_ambiente_operacion AUTO_INCREMENT = 1;

delete from relacion_ambiente_escena;
ALTER TABLE relacion_ambiente_escena AUTO_INCREMENT = 1;




delete from rutina;
ALTER TABLE rutina AUTO_INCREMENT = 1;

delete from relacion_ot_rutina;
ALTER TABLE relacion_ot_rutina AUTO_INCREMENT = 1;

delete from ot;
ALTER TABLE ot AUTO_INCREMENT = 1;

delete from relacion_rutina_operacion;
ALTER TABLE relacion_rutina_operacion AUTO_INCREMENT = 1;

delete from relacion_rutina_escena;
ALTER TABLE relacion_rutina_escena AUTO_INCREMENT = 1;

delete from tarea where tipo = 5;
delete from tarea where tipo = 2;


