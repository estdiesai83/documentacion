
-- activar th_
update th_rasp_dali_s set inhibir =0;
update th_rasp_ed set inhibir =0;
update th_rasp_sd set inhibir =0 where modulo = 4;
update th_rasp_ds18b20 set inhibir =0;

-- habitacion servicio1
update iniciarhilostrb set argumentos = REPLACE(argumentos,'0D2754','');
-- habitacion servicio2
update iniciarhilostrb set argumentos = REPLACE(argumentos,'0D2755','');


update sistema_somosaguas.th_rasp_sd set argumentos = '{"floor":"6","room":"56","zone":"48","type":"0","nemo":"0"}' where id = 164;
update sistema_pr_somosaguas.th_rasp_sd set argumentos = '{"floor":"6","room":"56","zone":"48","type":"0","nemo":"0"}' where id = 164;

update sistema_somosaguas.th_rasp_ed set argumentos = '{"floor":"6","room":"56","zone":"48","type":"0","nemo":"0"}',codigo_tp=112 where id = 67;
update sistema_pr_somosaguas.th_rasp_ed set argumentos = '{"floor":"6","room":"56","zone":"48","type":"0","nemo":"0"}',codigo_tp=112 where id = 67;

update sistema_somosaguas.luces set codigo_estancia = 56 where id =48;
update sistema_pr_somosaguas.luces set codigo_estancia = 56 where id =48;

update sistema_somosaguas.escenas set codigo_estancia = 56 where id = 29;
update sistema_somosaguas.escenas set codigo_estancia = 56 where id = 40;

update sistema_pr_somosaguas.escenas set codigo_estancia = 56 where id = 29;
update sistema_pr_somosaguas.escenas set codigo_estancia = 56 where id = 40;

update sistema_somosaguas.iniciarhilostrb set argumentos=REPLACE(argumentos,'9000','53149') where codigo_rb=132 and trb =43;
update sistema_somosaguas.iniciarhilostrb set argumentos=REPLACE(argumentos,'9000','53134') where codigo_rb=134 and trb =43;
update sistema_somosaguas.iniciarhilostrb set argumentos=REPLACE(argumentos,'9000','53141') where codigo_rb=136 and trb =43;
update sistema_somosaguas.iniciarhilostrb set argumentos=REPLACE(argumentos,'9000','53133') where codigo_rb=138 and trb =43;
update sistema_somosaguas.iniciarhilostrb set argumentos=REPLACE(argumentos,'9000','53137') where codigo_rb=140 and trb =43;
update sistema_somosaguas.iniciarhilostrb set argumentos=REPLACE(argumentos,'9000','53139') where codigo_rb=142 and trb =43;
update sistema_somosaguas.iniciarhilostrb set argumentos=REPLACE(argumentos,'9000','53139') where codigo_rb=144 and trb =43;
update sistema_somosaguas.iniciarhilostrb set argumentos=REPLACE(argumentos,'9000','53144') where codigo_rb=146 and trb =43;
update sistema_somosaguas.iniciarhilostrb set argumentos=REPLACE(argumentos,'9000','53144') where codigo_rb=148 and trb =43;
update sistema_somosaguas.iniciarhilostrb set argumentos=REPLACE(argumentos,'9000','53144') where codigo_rb=150 and trb =43;
update sistema_somosaguas.iniciarhilostrb set argumentos=REPLACE(argumentos,'9000','53135') where codigo_rb=152 and trb =43;
update sistema_somosaguas.iniciarhilostrb set argumentos=REPLACE(argumentos,'9000','53135') where codigo_rb=154 and trb =43;



update sistema_somosaguas.iniciarhilostrb set argumentos=REPLACE(argumentos,'9000','53149') where codigo_rb=131 and trb =42;
update sistema_somosaguas.iniciarhilostrb set argumentos=REPLACE(argumentos,'9000','53134') where codigo_rb=133 and trb =42;
update sistema_somosaguas.iniciarhilostrb set argumentos=REPLACE(argumentos,'9000','53141') where codigo_rb=135 and trb =42;
update sistema_somosaguas.iniciarhilostrb set argumentos=REPLACE(argumentos,'9000','53133') where codigo_rb=137 and trb =42;
update sistema_somosaguas.iniciarhilostrb set argumentos=REPLACE(argumentos,'9000','53137') where codigo_rb=139 and trb =42;
update sistema_somosaguas.iniciarhilostrb set argumentos=REPLACE(argumentos,'9000','53139') where codigo_rb=141 and trb =42;
update sistema_somosaguas.iniciarhilostrb set argumentos=REPLACE(argumentos,'9000','53139') where codigo_rb=143 and trb =42;
update sistema_somosaguas.iniciarhilostrb set argumentos=REPLACE(argumentos,'9000','53144') where codigo_rb=145 and trb =42;
update sistema_somosaguas.iniciarhilostrb set argumentos=REPLACE(argumentos,'9000','53144') where codigo_rb=147 and trb =42;
update sistema_somosaguas.iniciarhilostrb set argumentos=REPLACE(argumentos,'9000','53144') where codigo_rb=149 and trb =42;
update sistema_somosaguas.iniciarhilostrb set argumentos=REPLACE(argumentos,'9000','53135') where codigo_rb=151 and trb =42;
update sistema_somosaguas.iniciarhilostrb set argumentos=REPLACE(argumentos,'9000','53135') where codigo_rb=153 and trb =42;

update sistema_somosaguas.iniciarhilostrb set argumentos=REPLACE(argumentos,'9000','53139') where codigo_rb=122 and trb =34;
update sistema_somosaguas.iniciarhilostrb set argumentos=REPLACE(argumentos,'9000','53139') where codigo_rb=123 and trb =34;
update sistema_somosaguas.iniciarhilostrb set argumentos=REPLACE(argumentos,'9000','53139') where codigo_rb=124 and trb =34;
update sistema_somosaguas.iniciarhilostrb set argumentos=REPLACE(argumentos,'9000','53139') where codigo_rb=125 and trb =34;
update sistema_somosaguas.iniciarhilostrb set argumentos=REPLACE(argumentos,'9000','53139') where codigo_rb=126 and trb =34;
update sistema_somosaguas.iniciarhilostrb set argumentos=REPLACE(argumentos,'9000','53139') where codigo_rb=127 and trb =34;


update sistema_somosaguas.iniciarhilostrb set argumentos=REPLACE(argumentos,'53140','53139') where codigo_rb=128 and trb =34;
update sistema_somosaguas.iniciarhilostrb set argumentos=REPLACE(argumentos,'53140','53139') where codigo_rb=129 and trb =34;
update sistema_somosaguas.iniciarhilostrb set argumentos=REPLACE(argumentos,'53140','53139') where codigo_rb=130 and trb =34;

