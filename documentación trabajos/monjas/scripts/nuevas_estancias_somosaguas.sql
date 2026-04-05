use sistema_pr_somosaguas;

update estancia set nemo ='Cocina Alejandro' where id = 17;
update estancia set nemo ='Cocina' where id = 15;


update estancia set nemo ='Habitacion Alejandro' where id = 22;
update estancia set nemo ='Baño Alejandro' where id = 23;

update estancia set nemo ='Habitacion Rachel' where id = 24;
update estancia set nemo ='Baño Rachel' where id = 25;

update estancia set nemo ='Sala cine' where id = 14;

update estancia set nemo ='Distribuidor Principal' where id = 55;


insert into estancia (nemo, codigo_planta, modelo, imagen, escenas, ambientes, rutinas) VALUES
   ("Vestibulo habitacion estudio",3,2,"fotos/24ef54f3a3c656e84869427ff7800f2b478c2316.jpg",1,  1,1);

insert into estancia (nemo, codigo_planta, modelo, imagen, escenas, ambientes, rutinas) VALUES
   ("Vestibulo biblioteca/bar",4,2,"fotos/24ef54f3a3c656e84869427ff7800f2b478c2316.jpg",1,  1,1);

insert into estancia (nemo, codigo_planta, modelo, imagen, escenas, ambientes, rutinas) VALUES
   ("Vestibulo sala tv/habitaciones",4,2,"fotos/24ef54f3a3c656e84869427ff7800f2b478c2316.jpg",1,  1,1);

insert into estancia (nemo, codigo_planta, modelo, imagen, escenas, ambientes, rutinas) VALUES
   ("Comedor cocina Alejandro",4,2,"fotos/24ef54f3a3c656e84869427ff7800f2b478c2316.jpg",1,  1,1);

insert into estancia (nemo, codigo_planta, modelo, imagen, escenas, ambientes, rutinas) VALUES
   ("Vestibulo cocina/entrada",4,2,"fotos/24ef54f3a3c656e84869427ff7800f2b478c2316.jpg",1,  1,1);

insert into estancia (nemo, codigo_planta, modelo, imagen, escenas, ambientes, rutinas) VALUES
   ("Despensa",4,2,"fotos/24ef54f3a3c656e84869427ff7800f2b478c2316.jpg",1,  1,1);

insert into estancia (nemo, codigo_planta, modelo, imagen, escenas, ambientes, rutinas) VALUES
   ("Ropero",4,2,"fotos/24ef54f3a3c656e84869427ff7800f2b478c2316.jpg",1,  1,1);

insert into estancia (nemo, codigo_planta, modelo, imagen, escenas, ambientes, rutinas) VALUES
   ("Sala juegos",4,2,"fotos/24ef54f3a3c656e84869427ff7800f2b478c2316.jpg",1,  1,1);


insert into estancia (nemo, codigo_planta, modelo, imagen, escenas, ambientes, rutinas) VALUES
   ("Vestidor Alejandro",5,2,"fotos/24ef54f3a3c656e84869427ff7800f2b478c2316.jpg",1,  1,1);

insert into estancia (nemo, codigo_planta, modelo, imagen, escenas, ambientes, rutinas) VALUES
   ("Vestidor Rachel",5,2,"fotos/24ef54f3a3c656e84869427ff7800f2b478c2316.jpg",1,  1,1);

insert into estancia (nemo, codigo_planta, modelo, imagen, escenas, ambientes, rutinas) VALUES
   ("Vestibulo hab Alejandro",5,2,"fotos/24ef54f3a3c656e84869427ff7800f2b478c2316.jpg",1,  1,1);


insert into estancia (nemo, codigo_planta, modelo, imagen, escenas, ambientes, rutinas) VALUES
   ("Vestibulo entrada servicio",6,2,"fotos/24ef54f3a3c656e84869427ff7800f2b478c2316.jpg",1,  1,1);


insert into estancia (nemo, codigo_planta, modelo, imagen, escenas, ambientes, rutinas) VALUES
   ("Sala maquinas piscina interior",7,2,"fotos/24ef54f3a3c656e84869427ff7800f2b478c2316.jpg",1,  1,1);

insert into estancia (nemo, codigo_planta, modelo, imagen, escenas, ambientes, rutinas) VALUES
   ("Vestibulo piscina interior",7,2,"fotos/24ef54f3a3c656e84869427ff7800f2b478c2316.jpg",1,  1,1);

insert into estancia (nemo, codigo_planta, modelo, imagen, escenas, ambientes, rutinas) VALUES
   ("Baño 1 piscina interior",7,2,"fotos/24ef54f3a3c656e84869427ff7800f2b478c2316.jpg",1,  1,1);

insert into estancia (nemo, codigo_planta, modelo, imagen, escenas, ambientes, rutinas) VALUES
   ("Baño 2 piscina interior",7,2,"fotos/24ef54f3a3c656e84869427ff7800f2b478c2316.jpg",1,  1,1);

insert into estancia (nemo, codigo_planta, modelo, imagen, escenas, ambientes, rutinas) VALUES
   ("Sala juegos",7,2,"fotos/24ef54f3a3c656e84869427ff7800f2b478c2316.jpg",1,  1,1);

insert into estancia (nemo, codigo_planta, modelo, imagen, escenas, ambientes, rutinas) VALUES
   ("Garaje",7,2,"fotos/24ef54f3a3c656e84869427ff7800f2b478c2316.jpg",0,0,0);

insert into estancia (nemo, codigo_planta, modelo, imagen, escenas, ambientes, rutinas) VALUES
   ("Cuarto instalaciones",7,2,"fotos/24ef54f3a3c656e84869427ff7800f2b478c2316.jpg",0, 0,0);

insert into estancia (nemo, codigo_planta, modelo, imagen, escenas, ambientes, rutinas) VALUES
   ("Cuarto clima",7,2,"fotos/24ef54f3a3c656e84869427ff7800f2b478c2316.jpg",0,0,0);


insert into estancia (nemo, codigo_planta, modelo, imagen, escenas, ambientes, rutinas) VALUES
   ("Baño turco",7,2,"fotos/24ef54f3a3c656e84869427ff7800f2b478c2316.jpg",0,0,0);

-- PERSIANAS

insert persianas (fecha, nemo, codigo_estancia, estado, consigna) values
(now(),'Ducha Alejandro',23,0,3);

insert into relacion_persianas (codigo_persianas, rb, codigo_tp_estado,codigo_tp_consigna   ) VALUES
(1, 122 ,1 , 2);

update trb_somfy_rts_s set domo = 7 where id = 1;
update trb_somfy_rts_s set domo = 7 where id = 2;


insert persianas (fecha, nemo, codigo_estancia, estado, consigna) values
(now(),'Inodoro Alejandro',23,0,3);

insert into relacion_persianas (codigo_persianas, rb, codigo_tp_estado,codigo_tp_consigna   ) VALUES
(2, 123 ,3 , 4);

update trb_somfy_rts_s set domo = 7 where id = 3;
update trb_somfy_rts_s set domo = 7 where id = 4;


insert persianas (fecha, nemo, codigo_estancia, estado, consigna) values
(now(),'Persiana Dcha Alejandro',22,0,3);

insert into relacion_persianas (codigo_persianas, rb, codigo_tp_estado,codigo_tp_consigna   ) VALUES
(3, 124 ,5 , 6);

update trb_somfy_rts_s set domo = 7 where id = 5;
update trb_somfy_rts_s set domo = 7 where id = 6;

insert persianas (fecha, nemo, codigo_estancia, estado, consigna) values
(now(),'Persiana Izqd Alejandro',22,0,3);

insert into relacion_persianas (codigo_persianas, rb, codigo_tp_estado,codigo_tp_consigna   ) VALUES
(4, 125 ,7 , 8);

update trb_somfy_rts_s set domo = 7 where id = 7;
update trb_somfy_rts_s set domo = 7 where id = 8;


insert persianas (fecha, nemo, codigo_estancia, estado, consigna) values
(now(),'Lateral Alejandro',22,0,3);

insert into relacion_persianas (codigo_persianas, rb, codigo_tp_estado,codigo_tp_consigna   ) VALUES
(5, 126 ,9 , 10);

update trb_somfy_rts_s set domo = 7 where id = 9;
update trb_somfy_rts_s set domo = 7 where id = 10;

insert persianas (fecha, nemo, codigo_estancia, estado, consigna) values
(now(),'Vestibulo baño Alejandro',55,0,3);

insert into relacion_persianas (codigo_persianas, rb, codigo_tp_estado,codigo_tp_consigna   ) VALUES
(6, 127 ,11 , 12);

update trb_somfy_rts_s set domo = 7 where id = 11;
update trb_somfy_rts_s set domo = 7 where id = 12;



insert persianas (fecha, nemo, codigo_estancia, estado, consigna) values
(now(),'Persiana Izq Rachel',24,0,3);

insert into relacion_persianas (codigo_persianas, rb, codigo_tp_estado,codigo_tp_consigna   ) VALUES
(7, 128 ,13 , 14);

update trb_somfy_rts_s set domo = 7 where id = 13;
update trb_somfy_rts_s set domo = 7 where id = 14;

insert persianas (fecha, nemo, codigo_estancia, estado, consigna) values
(now(),'Persiana Dcha Rachel',24,0,3);

insert into relacion_persianas (codigo_persianas, rb, codigo_tp_estado,codigo_tp_consigna   ) VALUES
(8, 129 ,15 , 16);

update trb_somfy_rts_s set domo = 7 where id = 15;
update trb_somfy_rts_s set domo = 7 where id = 16;


insert persianas (fecha, nemo, codigo_estancia, estado, consigna) values
(now(),'Baño hab Rachel',25,0,3);

insert into relacion_persianas (codigo_persianas, rb, codigo_tp_estado,codigo_tp_consigna   ) VALUES
(9, 130 ,17 , 18);

update trb_somfy_rts_s set domo = 7 where id = 17;
update trb_somfy_rts_s set domo = 7 where id = 18;




-- ESTORES

insert estor (fecha, nemo, codigo_estancia, estado, consigna) values
(now(),'Hab invitados',34,0,3);

insert into relacion_estor (codigo_estor, rb, codigo_tp_estado,codigo_tp_consigna   ) VALUES
(1, 132 ,1 , 2);

update trb_somfy_50_s set domo = 5 where id = 1;
update trb_somfy_50_s set domo = 5 where id = 2;

update trb_somfy_50_e set domo = 5 where id = 1;
update trb_somfy_50_e set domo = 5 where id = 2;

-- insert into th_somfy_50_s (codigo_tp, modulo, argumentos, inhibir) VALUES
-- (1,4,'{"floor":"6","room":"34","zone":"1","type":"0","nemo":"9"}',0);
-- insert into th_somfy_50_e (codigo_tp, modulo, argumentos, inhibir) VALUES
-- (2,4,'{"floor":"6","room":"34","zone":"1","type":"0","nemo":"9"}',0);


insert estor (fecha, nemo, codigo_estancia, estado, consigna) values
(now(),'Habitacion 5',32,0,3);

insert into relacion_estor (codigo_estor, rb, codigo_tp_estado,codigo_tp_consigna   ) VALUES
(2, 134 ,3 , 4);

update trb_somfy_50_s set domo = 5 where id = 3;
update trb_somfy_50_s set domo = 5 where id = 4;

update trb_somfy_50_e set domo = 5 where id = 3;
update trb_somfy_50_e set domo = 5 where id = 4;

-- insert into th_somfy_50_s (codigo_tp, modulo, argumentos, inhibir) VALUES
-- (3,4,'{"floor":"5","room":"32","zone":"2","type":"0","nemo":"9"}',0);
-- insert into th_somfy_50_e (codigo_tp, modulo, argumentos, inhibir) VALUES
-- (4,4,'{"floor":"5","room":"32","zone":"2","type":"0","nemo":"9"}',0);


insert estor (fecha, nemo, codigo_estancia, estado, consigna) values
(now(),'Habitacion 4',30,0,3);

insert into relacion_estor (codigo_estor, rb, codigo_tp_estado,codigo_tp_consigna   ) VALUES
(3, 136 ,5 , 6);

update trb_somfy_50_s set domo = 5 where id = 5;
update trb_somfy_50_s set domo = 5 where id = 6;

update trb_somfy_50_e set domo = 5 where id = 5;
update trb_somfy_50_e set domo = 5 where id = 6;

-- insert into th_somfy_50_s (codigo_tp, modulo, argumentos, inhibir) VALUES
-- (5,4,'{"floor":"5","room":"30","zone":"3","type":"0","nemo":"9"}',0);
-- insert into th_somfy_50_e (codigo_tp, modulo, argumentos, inhibir) VALUES
-- (6,4,'{"floor":"5","room":"30","zone":"3","type":"0","nemo":"9"}',0);

insert estor (fecha, nemo, codigo_estancia, estado, consigna) values
(now(),'Habitacion 3',28,0,3);

insert into relacion_estor (codigo_estor, rb, codigo_tp_estado,codigo_tp_consigna   ) VALUES
(4, 138 ,7 , 8);

update trb_somfy_50_s set domo = 5 where id = 7;
update trb_somfy_50_s set domo = 5 where id = 8;

update trb_somfy_50_e set domo = 5 where id = 7;
update trb_somfy_50_e set domo = 5 where id = 8;

-- insert into th_somfy_50_s (codigo_tp, modulo, argumentos, inhibir) VALUES
-- (7,4,'{"floor":"5","room":"28","zone":"4","type":"0","nemo":"9"}',0);
-- insert into th_somfy_50_e (codigo_tp, modulo, argumentos, inhibir) VALUES
-- (8,4,'{"floor":"5","room":"28","zone":"4","type":"0","nemo":"9"}',0);


insert estor (fecha, nemo, codigo_estancia, estado, consigna) values
(now(),'Habitacion 2',26,0,3);

insert into relacion_estor (codigo_estor, rb, codigo_tp_estado,codigo_tp_consigna   ) VALUES
(5, 140 ,9 , 10);

update trb_somfy_50_s set domo = 5 where id = 9;
update trb_somfy_50_s set domo = 5 where id = 10;

update trb_somfy_50_e set domo = 5 where id = 9;
update trb_somfy_50_e set domo = 5 where id = 10;

-- insert into th_somfy_50_s (codigo_tp, modulo, argumentos, inhibir) VALUES
-- (9,4,'{"floor":"5","room":"30","zone":"5","type":"0","nemo":"9"}',0);
-- insert into th_somfy_50_e (codigo_tp, modulo, argumentos, inhibir) VALUES
-- (10,4,'{"floor":"5","room":"30","zone":"5","type":"0","nemo":"9"}',0);


insert estor (fecha, nemo, codigo_estancia, estado, consigna) values
(now(),'Vestidor Alejandro Dcha',53,0,3);

insert into relacion_estor (codigo_estor, rb, codigo_tp_estado,codigo_tp_consigna   ) VALUES
(6, 142 ,11 , 12);

update trb_somfy_50_s set domo = 5 where id = 11;
update trb_somfy_50_s set domo = 5 where id = 12;

update trb_somfy_50_e set domo = 5 where id = 11;
update trb_somfy_50_e set domo = 5 where id = 12;

-- insert into th_somfy_50_s (codigo_tp, modulo, argumentos, inhibir) VALUES
-- (11,4,'{"floor":"5","room":"30","zone":"6","type":"0","nemo":"9"}',0);
-- insert into th_somfy_50_e (codigo_tp, modulo, argumentos, inhibir) VALUES
-- (12,4,'{"floor":"5","room":"30","zone":"6","type":"0","nemo":"9"}',0);


insert estor (fecha, nemo, codigo_estancia, estado, consigna) values
(now(),'Vestidor Alejandro Izq',53,0,3);

insert into relacion_estor (codigo_estor, rb, codigo_tp_estado,codigo_tp_consigna   ) VALUES
(7, 144 ,13 , 14);

update trb_somfy_50_s set domo = 5 where id = 13;
update trb_somfy_50_s set domo = 5 where id = 14;

update trb_somfy_50_e set domo = 5 where id = 13;
update trb_somfy_50_e set domo = 5 where id = 14;

-- insert into th_somfy_50_s (codigo_tp, modulo, argumentos, inhibir) VALUES
-- (13,4,'{"floor":"5","room":"30","zone":"7","type":"0","nemo":"9"}',0);
-- insert into th_somfy_50_e (codigo_tp, modulo, argumentos, inhibir) VALUES
-- (14,4,'{"floor":"5","room":"30","zone":"7","type":"0","nemo":"9"}',0);


insert estor (fecha, nemo, codigo_estancia, estado, consigna) values
(now(),'Habitacion estudio izq',11,0,3);

insert into relacion_estor (codigo_estor, rb, codigo_tp_estado,codigo_tp_consigna   ) VALUES
(8, 146 ,15 , 16);

update trb_somfy_50_s set domo = 5 where id = 15;
update trb_somfy_50_s set domo = 5 where id = 16;

update trb_somfy_50_e set domo = 5 where id = 15;
update trb_somfy_50_e set domo = 5 where id = 16;

-- insert into th_somfy_50_s (codigo_tp, modulo, argumentos, inhibir) VALUES
-- (15,4,'{"floor":"3","room":"11","zone":"8","type":"0","nemo":"9"}',0);
-- insert into th_somfy_50_e (codigo_tp, modulo, argumentos, inhibir) VALUES
-- (16,4,'{"floor":"3","room":"11","zone":"8","type":"0","nemo":"9"}',0);


insert estor (fecha, nemo, codigo_estancia, estado, consigna) values
(now(),'Habitacion estudio centro',11,0,3);

insert into relacion_estor (codigo_estor, rb, codigo_tp_estado,codigo_tp_consigna   ) VALUES
(9, 148 ,17 , 18);

update trb_somfy_50_s set domo = 5 where id = 17;
update trb_somfy_50_s set domo = 5 where id = 18;

update trb_somfy_50_e set domo = 5 where id = 17;
update trb_somfy_50_e set domo = 5 where id = 18;
-- insert into th_somfy_50_s (codigo_tp, modulo, argumentos, inhibir) VALUES
-- (17,4,'{"floor":"3","room":"11","zone":"9","type":"0","nemo":"9"}',0);
-- insert into th_somfy_50_e (codigo_tp, modulo, argumentos, inhibir) VALUES
-- (18,4,'{"floor":"3","room":"11","zone":"9","type":"0","nemo":"9"}',0);

insert estor (fecha, nemo, codigo_estancia, estado, consigna) values
(now(),'Habitacion estudio dcha',11,0,3);

insert into relacion_estor (codigo_estor, rb, codigo_tp_estado,codigo_tp_consigna   ) VALUES
(10, 150 ,19 , 20);

update trb_somfy_50_s set domo = 5 where id = 19;
update trb_somfy_50_s set domo = 5 where id = 20;

update trb_somfy_50_e set domo = 5 where id = 19;
update trb_somfy_50_e set domo = 5 where id = 20;
-- insert into th_somfy_50_s (codigo_tp, modulo, argumentos, inhibir) VALUES
-- (19,4,'{"floor":"3","room":"11","zone":"10","type":"0","nemo":"9"}',0);
-- insert into th_somfy_50_e (codigo_tp, modulo, argumentos, inhibir) VALUES
-- (20,4,'{"floor":"3","room":"11","zone":"10","type":"0","nemo":"9"}',0);


insert estor (fecha, nemo, codigo_estancia, estado, consigna) values
(now(),'Habitacion servicio 1',36,0,3);

insert into relacion_estor (codigo_estor, rb, codigo_tp_estado,codigo_tp_consigna   ) VALUES
(11, 152 ,21 , 22);

update trb_somfy_50_s set domo = 5 where id = 21;
update trb_somfy_50_s set domo = 5 where id = 22;

update trb_somfy_50_e set domo = 5 where id = 21;
update trb_somfy_50_e set domo = 5 where id = 22;
-- insert into th_somfy_50_s (codigo_tp, modulo, argumentos, inhibir) VALUES
-- (21,4,'{"floor":"6","room":"36","zone":"11","type":"0","nemo":"9"}',0);
-- insert into th_somfy_50_e (codigo_tp, modulo, argumentos, inhibir) VALUES
-- (22,4,'{"floor":"6","room":"36","zone":"11","type":"0","nemo":"9"}',0);


insert estor (fecha, nemo, codigo_estancia, estado, consigna) values
(now(),'Habitacion servicio 1',38,0,3);

insert into relacion_estor (codigo_estor, rb, codigo_tp_estado,codigo_tp_consigna   ) VALUES
(12, 154 ,23 , 24);

update trb_somfy_50_s set domo = 5 where id = 23;
update trb_somfy_50_s set domo = 5 where id = 24;

update trb_somfy_50_e set domo = 5 where id = 23;
update trb_somfy_50_e set domo = 5 where id = 24;
-- insert into th_somfy_50_s (codigo_tp, modulo, argumentos, inhibir) VALUES
-- (23,4,'{"floor":"6","room":"38","zone":"12","type":"0","nemo":"9"}',0);
-- insert into th_somfy_50_e (codigo_tp, modulo, argumentos, inhibir) VALUES
-- (24,4,'{"floor":"6","room":"38","zone":"12","type":"0","nemo":"9"}',0);


