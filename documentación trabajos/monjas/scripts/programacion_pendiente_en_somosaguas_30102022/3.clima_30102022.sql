insert into variables (nemo, valor, tipo) VALUES
('consigna_temp_gimnasio',22,1),
('rango_temp_gimnasio',1,1),
('consigna_temp_piscina_int',22,1),
('rango_temp_piscina_int',1,1),
('Gimnasio',10,3),
('Piscina interior',10,3);


insert into clima VALUES  (25,'2022-09-15 09:51:45','Gimnasio',40,0,22,22,0,NULL,0,0,0),(26,'2022-09-16 09:00:31','Piscina interior',41,0,22,22,0,NULL,1,0,0);
insert into relacion_clima VALUES (25,'2022-09-15 09:52:53',25,-1,520,36,-1,-1,-1,-1,-1,-1,-1,-1,312,161,162,163,164,51,-1,-1),(26,'2022-09-15 09:55:05',26,-1,510,28,-1,-1,-1,-1,-1,-1,-1,-1,315,171,172,173,174,52,-1,-1);

update clima set sleep_fancoil = 0 where id = 25;
update clima set sleep_fancoil = 0 where id = 26;

update relacion_clima set codigo_variables = 47 where codigo_clima = 25;
update relacion_clima set codigo_variables = 49 where codigo_clima = 26;

update th_rasp_sd set argumentos = REPLACE (argumentos, '"floor":"2"','"floor":"1"') where id = 330;
update th_rasp_ed set argumentos = REPLACE (argumentos, '"floor":"2"','"floor":"1"') where id = 164;

-- piscina exterior
update estancia set modelo = 5 where id = 6;

-- pista tenis
update estancia set modelo = 6 where id = 5;
-- riego
update estancia set modelo = 3 where id = 8;


alter table relacion_clima add column rb_e_fancoil int(11) default -1;
alter table relacion_clima add column codigo_tp_e_fancoil int(11) default -1;
alter table relacion_clima add column codigo_tp_e_vel1 int(11) default -1;
alter table relacion_clima add column codigo_tp_e_vel2 int(11) default -1;
alter table relacion_clima add column codigo_tp_e_vel3 int(11) default -1;


update relacion_clima set rb_e_fancoil = 311,codigo_tp_e_fancoil=230 , codigo_tp_e_vel1 = 231, codigo_tp_e_vel2=232 ,codigo_tp_e_vel3 = 233 where id = 25;
update relacion_clima set rb_e_fancoil = 314,codigo_tp_e_fancoil=207 , codigo_tp_e_vel1 = 208, codigo_tp_e_vel2=209 ,codigo_tp_e_vel3 = 210 where id = 26;

-- gimnasio
update trb_rasp_sd set domo = 12 where id = 161;
update trb_rasp_sd set domo = 12 where id = 162;
update trb_rasp_sd set domo = 12 where id = 163;
update trb_rasp_sd set domo = 12 where id = 164;

update trb_rasp_ed set domo = 12 where id = 230;
update trb_rasp_ed set domo = 12 where id = 231;
update trb_rasp_ed set domo = 12 where id = 232;
update trb_rasp_ed set domo = 12 where id = 233;

-- piscina interior
update trb_rasp_sd set domo = 12 where id = 171;
update trb_rasp_sd set domo = 12 where id = 172;
update trb_rasp_sd set domo = 12 where id = 173;
update trb_rasp_sd set domo = 12 where id = 174;

update trb_rasp_ed set domo = 12 where id = 207;
update trb_rasp_ed set domo = 12 where id = 208;
update trb_rasp_ed set domo = 12 where id = 209;
update trb_rasp_ed set domo = 12 where id = 210;



