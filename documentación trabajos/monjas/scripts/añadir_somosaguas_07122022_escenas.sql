
select *from escenas where codigo_estancia = 20;

select *from luces where codigo_estancia=11;

select *from relacion_escena_operacion where codigo_escena=9;

select *from operacion_luces where codigo_luces >=21 AND codigo_luces<=25 order by estado,intensidad,codigo_luces;



-- estancia 67 -> 9 (vestibulo h/e pasa a estudio)

-- apagar
insert into operacion (id,tipodomo,estado) values (349,1,1);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb, temperatura) values
(96,349,0,100,NULL,-1);

insert into relacion_escena_operacion (codigo_escena,codigo_operacion) values (245,349);

-- maxima
insert into operacion (id,tipodomo,estado) values (350,1,0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb, temperatura) values
(96,350,1,100,NULL,-1);

insert into relacion_escena_operacion (codigo_escena,codigo_operacion) values (246,350);

-- standard
insert into operacion (id,tipodomo,estado) values (351,1,0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb, temperatura) values
(96,351,1,50,NULL,-1);

insert into relacion_escena_operacion (codigo_escena,codigo_operacion) values (247,351);

-- estancia 48 -> 46
-- tenia eliminado = 1 por que habia una luz en cada estancia 48 y 46
-- hay que crear una escena
update escenas set eliminado = 0 where codigo_estancia = 46;

-- standard
insert into escenas (id,codigo_estancia,nemo, estado, tipodomo, tipo,eliminado) values (281,46,'standard',0,1,2,0);

insert into operacion (id,tipodomo,estado) values (352,1,0);
insert into operacion (id,tipodomo,estado) values (353,1,0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb, temperatura) values
(55,352,1,50,NULL,-1);
insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb, temperatura) values
(58,353,1,50,NULL,-1);

insert into relacion_escena_operacion (codigo_escena,codigo_operacion) values (281,352);
insert into relacion_escena_operacion (codigo_escena,codigo_operacion) values (281,353);

-- estancia 65 -> 15
-- crear operacion para luz 88 en escena standard (129)
insert into operacion (id,tipodomo,estado) values (354,1,0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb, temperatura) values
(88,354,1,50,NULL,-1);

insert into relacion_escena_operacion (codigo_escena,codigo_operacion) values (129,354);


-- crear operacion para luz 88 en escena eco (141)
insert into operacion (id,tipodomo,estado) values (355,1,0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb, temperatura) values
(88,355,1,60,NULL,-1);

insert into relacion_escena_operacion (codigo_escena,codigo_operacion) values (141,355);


-- crear operacion para luz 88 en escena romantic (177)
insert into operacion (id,tipodomo,estado) values (356,1,0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb, temperatura) values
(88,356,1,80,NULL,-1);

insert into relacion_escena_operacion (codigo_escena,codigo_operacion) values (177,356);

-- 52 -> 19
-- crear operacion para luz 95 en escena standard (117)
insert into operacion (id,tipodomo,estado) values (357,1,0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb, temperatura) values
(95,357,1,50,NULL,-1);

insert into relacion_escena_operacion (codigo_escena,codigo_operacion) values (117,357);

-- 51 ->49 y 50->49
update escenas set eliminado = 0 where codigo_estancia = 49;

-- standard
insert into escenas (id,codigo_estancia,nemo, estado, tipodomo, tipo,eliminado) values (282,49,'standard',0,1,2,0);

insert into operacion (id,tipodomo,estado) values (358,1,0);
insert into operacion (id,tipodomo,estado) values (359,1,0);
insert into operacion (id,tipodomo,estado) values (360,1,0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb, temperatura) values
(89,358,1,50,NULL,-1);
insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb, temperatura) values
(90,359,1,50,NULL,-1);
insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb, temperatura) values
(91,360,1,50,NULL,-1);

insert into relacion_escena_operacion (codigo_escena,codigo_operacion) values (282,358);
insert into relacion_escena_operacion (codigo_escena,codigo_operacion) values (282,359);
insert into relacion_escena_operacion (codigo_escena,codigo_operacion) values (282,360);


-- standard luz 33 en estancia 20 escena 108
insert into operacion (id,tipodomo,estado) values (361,1,0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb, temperatura) values
(33,361,1,50,NULL,-1);

insert into relacion_escena_operacion (codigo_escena,codigo_operacion) values (108,361);

-- 37 -> 36
delete from escenas where id = 163;
delete from escenas where id = 199;
delete from escenas where id = 235;

-- 35 -> 34
delete from escenas where id = 161;
delete from escenas where id = 197;
delete from escenas where id = 233;


-- estancia 46 eco, romantic, cine
insert into escenas (id,codigo_estancia,nemo, estado, tipodomo, tipo,eliminado) values (283,46,'eco',0,1,2,0);
insert into escenas (id,codigo_estancia,nemo, estado, tipodomo, tipo,eliminado) values (284,46,'romantic',0,1,2,0);
insert into escenas (id,codigo_estancia,nemo, estado, tipodomo, tipo,eliminado) values (285,46,'cine',0,1,2,0);

-- estancia 49 eco, romantic, cine
insert into escenas (id,codigo_estancia,nemo, estado, tipodomo, tipo,eliminado) values (286,49,'eco',0,1,2,0);
insert into escenas (id,codigo_estancia,nemo, estado, tipodomo, tipo,eliminado) values (287,49,'romantic',0,1,2,0);
insert into escenas (id,codigo_estancia,nemo, estado, tipodomo, tipo,eliminado) values (288,49,'cine',0,1,2,0);



-- ESCENAS POR SUBGRUPO TODAS ESTAN EN PLANTA 4

-- subgrupo 1 Hall Habitaciones
-- estancia 55 hall
insert into escenas (id, codigo_subgrupo, estado, nemo, tipodomo,tipo,eliminado) values
(289, 1, 0, 'apagar', 1,0,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (289,111);

insert into escenas (id, codigo_subgrupo, estado, nemo, tipodomo,tipo,eliminado) values
(290, 1, 0, 'maxima', 1,1,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,130);


insert into operacion (id,tipodomo,estado) values (362,1,0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb, temperatura) values
(65,362,1,50,NULL,-1);

insert into escenas (id, codigo_subgrupo, estado, nemo, tipodomo,tipo,eliminado) values
(291, 1, 0, 'standard', 1,2,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,362);


-- subgrupo 2 Alejandro
-- estancias 22, 23, 53 (habitacion, baño, vestidor)
insert into escenas (id, codigo_subgrupo, estado, nemo, tipodomo,tipo,eliminado) values
(292, 2, 0, 'apagar', 1,0,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,112);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,113);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,114);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,115);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,116);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,117);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,118);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,119);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,120);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,121);

insert into escenas (id, codigo_subgrupo, estado, nemo, tipodomo,tipo,eliminado) values
(293, 2, 0, 'maxima', 1,1,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (293,131);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (293,132);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (293,133);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (293,134);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (293,135);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (293,136);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (293,137);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (293,138);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (293,139);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (293,140);

insert into escenas (id, codigo_subgrupo, estado, nemo, tipodomo,tipo,eliminado) values
(294, 2, 0, 'standard', 1,2,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (294,253);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (294,254);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (294,255);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (294,256);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (294,257);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (294,258);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (294,259);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (294,260);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (294,261);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (294,262);


-- subgrupo 3 Rachel
-- estancias 71, 24, 25, 54 (terraza, habitacion, baño, vestidor)
insert into escenas (id, codigo_subgrupo, estado, nemo, tipodomo,tipo,eliminado) values
(295, 3, 0, 'apagar', 1,0,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (295,122);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (295,123);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (295,124);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (295,125);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (295,126);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (295,127);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (295,128);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (295,129);

insert into escenas (id, codigo_subgrupo, estado, nemo, tipodomo,tipo,eliminado) values
(296, 3, 0, 'maxima', 1,1,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (296,141);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (296,142);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (296,143);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (296,144);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (296,145);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (296,146);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (296,147);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (296,148);

insert into escenas (id, codigo_subgrupo, estado, nemo, tipodomo,tipo,eliminado) values
(297, 3, 0, 'standard', 1,2,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (297,263);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (297,264);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (297,265);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (297,266);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (297,267);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (297,268);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (297,269);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (297,270);

-- subgrupo 4 Hall
-- estancia 19 (hall)
insert into escenas (id, codigo_subgrupo, estado, nemo, tipodomo,tipo,eliminado) values
(298, 4, 0, 'apagar', 1,0,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (298,157);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (298,158);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (298,160);

insert into escenas (id, codigo_subgrupo, estado, nemo, tipodomo,tipo,eliminado) values
(299, 4, 0, 'maxima', 1,1,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (299,169);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (299,170);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (299,172);

insert into escenas (id, codigo_subgrupo, estado, nemo, tipodomo,tipo,eliminado) values
(300, 4, 0, 'standard', 1,2,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (300,243);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (300,244);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (300,357);

-- subgrupo 5 Máximo (antes hab 2)
-- estancia 26, 27 (habitacion, baño)
insert into escenas (id, codigo_subgrupo, estado, nemo, tipodomo,tipo,eliminado) values
(301, 5, 0, 'apagar', 1,0,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (301,1);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (301,2);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (301,3);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (301,4);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (301,5);

insert into escenas (id, codigo_subgrupo, estado, nemo, tipodomo,tipo,eliminado) values
(302, 5, 0, 'maxima', 1,1,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (302,31);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (302,32);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (302,33);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (302,34);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (302,35);

insert into escenas (id, codigo_subgrupo, estado, nemo, tipodomo,tipo,eliminado) values
(303, 5, 0, 'standard', 1,2,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (303,191);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (303,192);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (303,193);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (303,194);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (303,195);

-- subgrupo 6 Alma (antes hab 3)
-- estancia 28, 29 (habitacion, baño)
insert into escenas (id, codigo_subgrupo, estado, nemo, tipodomo,tipo,eliminado) values
(304, 6, 0, 'apagar', 1,0,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (304,6);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (304,7);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (304,8);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (304,9);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (304,10);

insert into escenas (id, codigo_subgrupo, estado, nemo, tipodomo,tipo,eliminado) values
(305, 6, 0, 'maxima', 1,1,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (305,36);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (305,37);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (305,38);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (305,39);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (305,40);

insert into escenas (id, codigo_subgrupo, estado, nemo, tipodomo,tipo,eliminado) values
(306, 6, 0, 'standard', 1,2,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (306,196);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (306,197);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (306,198);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (306,199);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (306,200);

-- subgrupo 7 Dyllan (antes hab 4)
-- estancia 30, 31 (habitacion, baño)

insert into escenas (id, codigo_subgrupo, estado, nemo, tipodomo,tipo,eliminado) values
(307, 7, 0, 'apagar', 1,0,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (307,11);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (307,12);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (307,13);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (307,14);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (307,15);

insert into escenas (id, codigo_subgrupo, estado, nemo, tipodomo,tipo,eliminado) values
(308, 7, 0, 'maxima', 1,1,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (308,41);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (308,42);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (308,43);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (308,44);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (308,45);

insert into escenas (id, codigo_subgrupo, estado, nemo, tipodomo,tipo,eliminado) values
(309, 7, 0, 'standard', 1,2,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (309,201);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (309,202);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (309,203);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (309,204);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (309,205);


-- subgrupo 8 Manuela (antes hab 5)
-- estancia 32, 33 (habitacion, baño)

insert into escenas (id, codigo_subgrupo, estado, nemo, tipodomo,tipo,eliminado) values
(310, 8, 0, 'apagar', 1,0,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (310,16);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (310,17);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (310,18);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (310,19);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (310,20);

insert into escenas (id, codigo_subgrupo, estado, nemo, tipodomo,tipo,eliminado) values
(311, 8, 0, 'maxima', 1,1,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (311,46);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (311,47);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (311,48);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (311,49);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (311,50);

insert into escenas (id, codigo_subgrupo, estado, nemo, tipodomo,tipo,eliminado) values
(312, 8, 0, 'standard', 1,2,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (312,206);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (312,207);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (312,208);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (312,209);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (312,210);



-- ESCENAS POR GRUPOS
insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(313, 1, 0, 'apagar', 1,0,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (313,323);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (313,324);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (313,187);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (313,188);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (313,80);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (313,81);

insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(314, 1, 0, 'maxima', 1,1,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (314,325);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (314,326);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (314,189);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (314,190);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (314,105);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (314,106);

insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(315, 1, 0, 'standard', 1,2,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (315,327);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (315,328);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (315,227);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (315,228);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (315,247);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (315,248);




insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(316, 5, 0, 'apagar', 1,0,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (316,74);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (316,75);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (316,77);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (316,78);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (316,178);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (316,179);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (316,175);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (316,176);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (316,177);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (316,76);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (316,79);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (316,82);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (316,83);

insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(317, 5, 0, 'maxima', 1,1,0);

insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (317,99);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (317,100);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (317,102);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (317,103);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (317,185);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (317,186);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (317,182);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (317,183);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (317,184);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (317,101);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (317,104);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (317,107);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (317,108);

insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(318, 5, 0, 'standard', 1,2,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (318,241);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (318,242);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (318,102);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (318,246);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (318,225);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (318,226);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (318,223);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (318,224);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (318,361);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (318,352);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (318,353);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (318,249);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (318,250);




insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(319, 6, 0, 'apagar', 1,0,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (319,149);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (319,150);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (319,153);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (319,151);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (319,152);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (319,154);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (319,155);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (319,156);

insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(320, 6, 0, 'maxima', 1,1,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (320,161);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (320,162);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (320,165);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (320,164);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (320,165);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (320,166);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (320,167);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (320,168);

insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(321, 6, 0, 'standard', 1,2,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (321,271);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (321,272);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (321,354);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (321,273);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (321,274);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (321,358);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (321,359);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (321,360);




insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(322, 7, 0, 'apagar', 1,0,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (322,112);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (322,113);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (322,114);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (322,115);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (322,116);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (322,117);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (322,118);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (322,119);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (322,122);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (322,123);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (322,124);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (322,125);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (322,120);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (322,121);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (322,126);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (322,127);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (322,111);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (322,128);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (322,129);

insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(323, 7, 0, 'maxima', 1,1,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (323,131);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (323,132);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (323,133);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (323,134);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (323,135);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (323,136);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (323,137);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (323,138);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (323,141);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (323,142);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (323,143);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (323,144);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (323,139);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (323,140);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (323,145);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (323,146);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (323,130);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (323,147);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (323,148);

insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(324, 7, 0, 'standard', 1,2,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (324,253);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (324,254);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (324,255);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (324,256);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (324,257);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (324,258);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (324,259);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (324,260);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (324,263);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (324,264);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (324,265);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (324,266);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (324,261);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (324,262);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (324,267);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (324,268);
-- esta relacion es con una operacion para hall en escena standard
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (324,362);

insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (324,269);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (324,270);



insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(325, 8, 0, 'apagar', 1,0,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (325,157);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (325,158);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (325,160);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (325,1);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (325,2);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (325,3);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (325,4);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (325,5);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (325,6);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (325,7);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (325,8);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (325,9);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (325,10);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (325,11);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (325,12);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (325,13);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (325,14);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (325,15);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (325,16);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (325,17);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (325,18);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (325,19);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (325,20);

insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(326, 8, 0, 'maxima', 1,1,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (326,169);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (326,170);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (326,172);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (326,31);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (326,32);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (326,33);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (326,34);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (326,35);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (326,36);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (326,37);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (326,38);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (326,39);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (326,40);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (326,41);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (326,42);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (326,43);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (326,44);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (326,45);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (326,46);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (326,47);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (326,48);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (326,49);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (326,50);

insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(327, 8, 0, 'standard', 1,2,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (327,243);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (327,244);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (327,357);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (327,191);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (327,192);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (327,193);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (327,194);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (327,195);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (327,196);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (327,197);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (327,198);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (327,199);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (327,200);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (327,201);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (327,202);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (327,203);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (327,204);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (327,205);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (327,206);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (327,207);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (327,208);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (327,209);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (327,210);








insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(328, 9, 0, 'apagar', 1,0,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (328,84);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (328,85);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (328,173);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (328,174);

insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(329, 9, 0, 'maxima', 1,1,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (329,109);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (329,110);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (329,180);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (329,181);

insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(330, 9, 0, 'standard', 1,2,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (330,251);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (330,252);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (330,221);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (330,222);



insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(331, 11, 0, 'apagar', 1,0,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (331,301);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (331,302);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (331,309);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (331,310);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (331,305);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (331,306);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (331,315);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (331,316);

insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(332, 11, 0, 'maxima', 1,1,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (332,303);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (332,304);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (332,311);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (332,312);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (332,307);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (332,308);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (332,317);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (332,318);

insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(333, 11, 0, 'standard', 1,2,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (333,321);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (333,322);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (333,329);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (333,330);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (333,313);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (333,314);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (333,319);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (333,320);



insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(334, 12, 0, 'apagar', 1,0,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (334,26);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (334,27);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (334,28);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (334,29);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (334,30);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (334,65);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (334,66);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (334,67);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (334,68);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (334,61);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (334,62);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (334,63);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (334,64);

insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(335, 12, 0, 'maxima', 1,1,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (335,56);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (335,57);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (335,58);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (335,59);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (335,60);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (335,90);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (335,91);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (335,92);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (335,93);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (335,86);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (335,87);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (335,88);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (335,89);

insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(336, 12, 0, 'standard', 1,2,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (336,216);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (336,217);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (336,218);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (336,219);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (336,220);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (336,233);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (336,234);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (336,235);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (336,236);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (336,229);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (336,230);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (336,231);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (336,232);



insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(337, 13, 0, 'apagar', 1,0,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (337,70);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (337,71);

insert into operacion (id,tipodomo,estado) values (363,1,0);
insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb, temperatura) values
(106,363,0,100,NULL,-1);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (337,363);

insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(338, 13, 0, 'maxima', 1,1,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (338,95);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (338,96);

insert into operacion (id,tipodomo,estado) values (364,1,0);
insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb, temperatura) values
(106,364,1,100,NULL,-1);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (338,364);

insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(339, 13, 0, 'standard', 1,2,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (339,237);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (339,238);

insert into operacion (id,tipodomo,estado) values (365,1,0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb, temperatura) values
(106,365,1,50,NULL,-1);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (339,365);



insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(340, 14, 0, 'apagar', 1,0,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (340,72);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (340,73);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (340,56);

insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(341, 14, 0, 'maxima', 1,1,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (341,97);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (341,98);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (341,94);

insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(342, 14, 0, 'standard', 1,2,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (342,237);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (342,238);

insert into operacion (id,tipodomo,estado) values (366,1,0);

insert into operacion_luces (codigo_luces, codigo_operacion, estado, intensidad, rgb, temperatura) values
(48,366,1,50,NULL,-1);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (342,366);



-- ESCENAS POR PLANTA

insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(343, 1, 0, 'apagar', 1,0,0);

insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (343,26);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (343,27);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (343,28);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (343,29);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (343,30);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (343,65);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (343,66);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (343,67);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (343,68);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (343,61);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (343,62);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (343,63);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (343,64);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (343,301);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (343,302);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (343,309);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (343,310);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (343,72);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (343,73);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (343,70);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (343,71);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (343,69);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (343,305);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (343,306);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (343,315);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (343,316);

insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(344, 1, 0, 'maxima', 1,1,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (344,56);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (344,57);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (344,58);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (344,59);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (344,60);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (344,90);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (344,91);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (344,92);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (344,93);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (344,86);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (344,87);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (344,88);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (344,89);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (344,303);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (344,304);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (344,311);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (344,312);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (344,97);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (344,98);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (344,95);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (344,96);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (344,94);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (344,307);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (344,308);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (344,317);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (344,318);

insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(345, 1, 0, 'standard', 1,2,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (345,216);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (345,217);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (345,218);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (345,219);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (345,220);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (345,233);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (345,234);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (345,235);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (345,236);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (345,229);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (345,230);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (345,231);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (345,232);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (345,321);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (345,322);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (345,329);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (345,330);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (345,239);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (345,240);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (345,237);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (345,238);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (345,366);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (345,313);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (345,314);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (345,319);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (345,320);



insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(346, 2, 0, 'apagar', 1,0,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (346,323);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (346,324);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (346,187);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (346,188);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (346,80);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (346,81);

insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(347, 2, 0, 'maxima', 1,1,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (347,325);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (347,326);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (347,189);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (347,190);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (347,105);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (347,106);

insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(348, 2, 0, 'standard', 1,2,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (348,327);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (348,328);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (348,227);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (348,228);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (348,247);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (348,248);




insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(349, 3, 0, 'apagar', 1,0,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (349,289);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (349,290);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (349,291);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (349,292);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (349,349);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (349,21);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (349,22);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (349,23);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (349,24);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (349,25);

insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(350, 3, 0, 'maxima', 1,1,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (350,293);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (350,294);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (350,295);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (350,296);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (350,350);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (350,51);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (350,52);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (350,53);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (350,54);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (350,55);

insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(351, 3, 0, 'standard', 1,2,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (351,297);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (351,298);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (351,299);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (351,300);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (351,351);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (351,211);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (351,212);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (351,213);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (351,214);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (351,215);



insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(352, 4, 0, 'apagar', 1,0,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,74);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,75);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,77);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,78);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,178);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,179);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,149);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,150);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,153);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,84);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,85);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,151);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,152);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,157);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,158);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,160);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,175);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,176);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,177);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,173);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,174);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,112);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,113);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,114);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,115);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,116);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,117);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,118);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,119);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,122);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,123);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,124);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,125);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,1);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,2);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,3);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,4);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,5);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,6);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,7);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,8);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,9);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,10);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,11);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,12);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,13);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,14);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,15);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,16);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,17);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,18);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,19);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,20);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,76);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,79);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,154);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,155);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,156);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,120);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,121);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,126);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,127);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,111);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,128);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,129);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,82);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (352,83);

insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(353, 4, 0, 'maxima', 1,1,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,99);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,100);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,102);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,103);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,185);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,186);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,161);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,162);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,165);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,109);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,110);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,163);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,164);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,169);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,170);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,171);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,182);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,183);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,184);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,180);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,181);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,131);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,132);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,133);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,134);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,135);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,136);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,137);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,138);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,141);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,142);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,143);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,144);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,31);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,32);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,33);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,34);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,35);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,36);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,37);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,38);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,39);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,40);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,41);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,42);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,43);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,44);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,45);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,46);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,47);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,48);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,49);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,50);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,101);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,104);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,166);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,167);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,168);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,139);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,140);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,145);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,146);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,130);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,147);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,148);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,107);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (353,108);

insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(354, 4, 0, 'standard', 1,2,0);

insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,241);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,242);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,102);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,246);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,225);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,226);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,271);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,272);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,354);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,251);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,252);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,273);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,274);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,243);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,244);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,357);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,223);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,224);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,361);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,221);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,222);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,253);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,254);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,255);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,256);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,257);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,258);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,259);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,260);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,263);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,264);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,265);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,266);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,191);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,192);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,193);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,194);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,195);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,196);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,197);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,198);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,199);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,200);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,201);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,202);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,203);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,204);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,205);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,206);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,207);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,208);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,209);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,210);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,352);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,353);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,358);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,359);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,360);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,261);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,262);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,267);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,268);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,362);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,269);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,270);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,249);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (354,250);



insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(355, 5, 0, 'apagar', 1,0,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (355,159);

insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(356, 5, 0, 'maxima', 1,1,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (356,171);

insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(357, 5, 0, 'standard', 1,2,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (357,366);


-- update operacion_luces set intensidad = 50 where id = 236;
-- update operacion_luces set intensidad = 50 where id = 232;


-- estancia 20 barra bar codigo_luces = 39
update relacion_escena_operacion set codigo_operacion = 184 where codigo_operacion = 224;
delete from operacion_luces where codigo_operacion = 224;
delete from operacion where id = 224;

-- estancia 39 baño comun codigo_luces = 43
update relacion_escena_operacion set codigo_operacion = 89 where codigo_operacion = 232;
delete from operacion_luces where codigo_operacion = 232;
delete from operacion where id = 232;

-- estancia 36 luna codigo_luces = 47
update relacion_escena_operacion set codigo_operacion = 93 where codigo_operacion = 236;
delete from operacion_luces where codigo_operacion = 236;
delete from operacion where id = 236;

-- estancia 13 comedor codigo_luces = 56 (focos techo centro)
update relacion_escena_operacion set codigo_operacion = 102 where codigo_operacion = 245;
update relacion_escena_operacion set codigo_operacion = 102 where codigo_operacion = 335;
delete from operacion_luces where codigo_operacion = 245;
delete from operacion_luces where codigo_operacion = 335;
delete from operacion where id = 245;
delete from operacion where id = 335;


-- estancia 54 luna codigo_luces = 81 (led vestidor alejandro)
update relacion_escena_operacion set codigo_operacion = 146 where codigo_operacion = 268;
delete from operacion_luces where codigo_operacion = 268;
delete from operacion where id = 268;

-- estancia 53 luna codigo_luces = 82 (led armarios vestidor rachel)
update relacion_escena_operacion set codigo_operacion = 140 where codigo_operacion = 262;
delete from operacion_luces where codigo_operacion = 262;
delete from operacion where id = 262;

-- estancia 55 codigo_luces = 65 focos techo vestibulo
update operacion_luces set estado = 1 where codigo_operacion = 130;
