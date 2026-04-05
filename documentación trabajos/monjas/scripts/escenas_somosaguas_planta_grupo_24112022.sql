DELETE FROM escenas where id >=281;

alter table escenas AUTO_INCREMENT=281;

-- planta 2: alumbrado exterior

insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(281, 2, 0, 'apagar', 1,0,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (281,323);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (281,324);


insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(282, 2, 0, 'maxima', 1,1,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (282,325);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (282,326);


insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(283, 2, 0, 'standard', 1,2,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (283,327);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (283,328);


-- planta 3: planta primera


insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(284, 3, 0, 'apagar', 1,0,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (284,289);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (284,290);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (284,291);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (284,292);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (284,21);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (284,22);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (284,23);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (284,24);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (284,25);

insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(285, 3, 0, 'maxima', 1,1,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (285,293);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (285,294);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (285,295);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (285,296);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (285,51);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (285,52);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (285,53);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (285,54);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (285,55);


insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(286, 3, 0, 'standard', 1,2,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (286,297);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (286,298);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (286,299);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (286,300);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (286,211);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (286,212);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (286,213);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (286,214);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (286,215);


-- planta 4: principal zonas comunes

insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(287, 4, 0, 'apagar', 1,0,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (287,74);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (287,75);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (287,77);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (287,78);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (287,178);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (287,179);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (287,149);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (287,150);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (287,84);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (287,85);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (287,151);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (287,152);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (287,187);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (287,188);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (287,176);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (287,177);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (287,173);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (287,174);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (287,80);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (287,81);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (287,82);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (287,83);





insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(288, 4, 0, 'maxima', 1,1,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (288,99);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (288,100);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (288,102);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (288,103);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (288,185);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (288,186);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (288,161);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (288,162);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (288,109);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (288,110);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (288,163);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (288,164);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (288,189);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (288,190);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (288,183);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (288,184);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (288,180);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (288,181);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (288,105);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (288,106);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (288,107);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (288,108);





insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(289, 4, 0, 'standard', 1,2,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (289,241);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (289,242);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (289,102);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (289,246);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (289,225);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (289,226);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (289,271);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (289,272);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (289,251);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (289,252);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (289,273);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (289,274);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (289,227);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (289,228);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (289,223);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (289,224);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (289,221);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (289,222);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (289,247);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (289,248);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (289,249);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (289,250);


-- planta 5: principal habitaciones

insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(290, 5, 0, 'apagar', 1,0,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,157);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,158);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,112);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,113);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,114);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,115);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,116);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,117);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,118);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,119);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,122);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,123);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,124);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,125);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,1);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,2);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,3);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,4);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,5);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,6);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,7);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,8);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,9);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,10);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,11);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,12);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,13);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,14);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,15);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,16);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,17);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,18);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,19);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,20);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,120);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,121);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,126);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,127);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,128);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (290,129);


insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(291, 5, 0, 'maxima', 1,1,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,169);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,170);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,131);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,132);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,133);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,134);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,135);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,136);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,137);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,138);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,141);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,142);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,143);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,144);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,31);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,32);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,33);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,34);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,35);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,36);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,37);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,38);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,39);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,40);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,41);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,42);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,43);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,44);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,45);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,46);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,47);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,48);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,49);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,50);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,139);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,140);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,145);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,146);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,147);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (291,148);


insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(292, 5, 0, 'standard', 1,2,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,243);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,244);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,253);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,254);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,255);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,256);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,257);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,258);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,259);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,260);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,263);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,264);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,265);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,266);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,191);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,192);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,193);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,194);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,195);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,196);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,197);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,198);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,199);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,200);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,201);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,202);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,203);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,204);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,205);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,206);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,207);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,208);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,209);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,210);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,261);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,262);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,267);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,268);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,269);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (292,270);


-- planta 6: sotano habitaciones


insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(293, 6, 0, 'apagar', 1,0,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (293,26);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (293,27);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (293,28);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (293,29);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (293,30);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (293,65);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (293,66);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (293,67);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (293,68);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (293,61);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (293,62);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (293,63);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (293,64);

insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(294, 6, 0, 'maxima', 1,1,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (294,56);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (294,57);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (294,58);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (294,59);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (294,60);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (294,90);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (294,91);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (294,92);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (294,93);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (294,86);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (294,87);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (294,88);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (294,89);

insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(295, 6, 0, 'standard', 1,2,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (295,216);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (295,217);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (295,218);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (295,219);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (295,220);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (295,233);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (295,234);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (295,235);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (295,236);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (295,229);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (295,230);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (295,231);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (295,232);



-- planta 7: sotano zonas comunes

insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(296, 7, 0, 'apagar', 1,0,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (296,301);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (296,302);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (296,309);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (296,310);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (296,72);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (296,73);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (296,70);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (296,71);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (296,305);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (296,306);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (296,315);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (296,316);

insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(297, 7, 0, 'maxima', 1,1,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (297,303);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (297,304);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (297,311);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (297,312);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (297,97);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (297,98);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (297,95);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (297,96);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (297,307);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (297,308);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (297,317);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (297,318);

insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(298, 7, 0, 'standard', 1,2,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (298,321);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (298,322);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (298,329);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (298,330);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (298,239);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (298,240);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (298,237);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (298,238);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (298,313);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (298,314);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (298,319);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (298,320);



-- ESTORES

-- planta 3: planta primera


insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(299, 3, 0, 'subir todo', 3,0,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (299,277);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (299,278);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (299,279);

insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(300, 3, 0, 'bajar todo ', 3,1,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (300,282);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (300,283);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (300,284);



-- planta 5: principal habitaciones


insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(301, 5, 0, 'subir todo', 3,0,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (301,275);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (301,276);

insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(302, 5, 0, 'bajar todo ', 3,1,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (302,280);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (302,281);


-- planta 6: sotano habitaciones


insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(303, 6, 0, 'subir todo', 3,0,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (303,285);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (303,286);

insert into escenas (id, codigo_planta, estado, nemo, tipodomo,tipo,eliminado) values
(304, 6, 0, 'bajar todo ', 3,1,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (304,287);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (304,288);




-- POR GRUPO


-- grupo 1: Salon


insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(305, 1, 0, 'apagar', 1,0,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (305,74);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (305,75);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (305,77);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (305,78);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (305,173);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (305,174);

insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(306, 1, 0, 'maxima', 1,1,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (306,99);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (306,100);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (306,102);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (306,103);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (306,180);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (306,181);

insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(307, 1, 0, 'standard', 1,2,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (307,241);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (307,242);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (307,102);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (307,246);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (307,221);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (307,222);



-- grupo 2: Cocina



insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(308, 2, 0, 'apagar', 1,0,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (308,149);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (308,150);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (308,151);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (308,152);

insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(309, 2, 0, 'maxima', 1,1,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (309,161);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (309,162);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (309,163);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (309,164);

insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(310, 2, 0, 'standard', 1,2,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (310,271);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (310,272);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (310,273);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (310,274);



-- grupo 4: otras dependencias



insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(311, 4, 0, 'apagar', 1,0,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (311,84);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (311,85);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (311,187);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (311,188);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (311,176);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (311,177);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (311,80);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (311,81);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (311,82);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (311,83);

insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(312, 4, 0, 'maxima', 1,1,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (312,109);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (312,110);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (312,189);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (312,190);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (312,183);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (312,184);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (312,105);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (312,106);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (312,107);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (312,108);

insert into escenas (id, codigo_grupo, estado, nemo, tipodomo,tipo,eliminado) values
(313, 4, 0, 'standard', 1,2,0);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (313,251);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (313,252);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (313,227);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (313,228);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (313,223);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (313,224);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (313,247);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (313,248);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (313,249);
insert into relacion_escena_operacion(codigo_escena,codigo_operacion) values (313,250);

