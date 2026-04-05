update comando set tipodriver = 'Ibercomp8ed_modbus' where id = 44;
update comando set tipodriver = 'Ibercomp8ed_modbus' where id = 46;
update comando set tipodriver = 'Ibercomp8ed_modbus' where id = 48;
update comando set tipodriver = 'Ibercomp8ed_modbus' where id = 50;

update comando set tipodriver = 'Ibercomp8sd_modbus' where id = 43;
update comando set tipodriver = 'Ibercomp8sd_modbus' where id = 45;
update comando set tipodriver = 'Ibercomp8sd_modbus' where id = 47;
update comando set tipodriver = 'Ibercomp8sd_modbus' where id = 49;

update relacion_rb set subdriver = '8ED_modbus' where codigo_rb = 339;
update relacion_rb set subdriver = '8ED_modbus' where codigo_rb = 341;
update relacion_rb set subdriver = '8ED_modbus' where codigo_rb = 343;
update relacion_rb set subdriver = '8ED_modbus' where codigo_rb = 345;

-- luces baño2 piscina interior
update trb_rasp_sd set domo = 1 where id = 186;
update trb_rasp_ed set domo = 1 where id = 206;

-- luces piscina interior
update trb_rasp_ed set domo = 1 where id = 199;
update trb_rasp_ed set domo = 1 where id = 200;
update trb_rasp_ed set domo = 1 where id = 201;
update trb_rasp_ed set domo = 1 where id = 202;
update trb_rasp_ed set domo = 1 where id = 203;
update trb_rasp_ed set domo = 1 where id = 204;


update clima set codigo_estancia = 60 where id = 26;

-- piscina interior fancoil
update trb_rasp_ds18b20 set domo = 2 where id = 28;

-- socket valvula fancoil
update th_rasp_sd set inhibir =1 where id = 344;
-- delete th_rasp_sd where id = 344;

insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(208,4,'{"id1":"208","id2":"209","id3":"210", "floor": "7", "room": "60", "zone": "26","type":"0" ,"trb":"0","nemo":"13"}',0),
(209,4,'{"id1":"208","id2":"209","id3":"210", "floor": "7", "room": "60", "zone": "26","type":"0" ,"trb":"0","nemo":"13"}',0),
(210,4,'{"id1":"208","id2":"209","id3":"210", "floor": "7", "room": "60", "zone": "26","type":"0" ,"trb":"0","nemo":"13"}',0);

-- gimnasio
update trb_rasp_ds18b20 set domo = 2 where id = 36;

-- socket valvula fancoil
update th_rasp_sd set inhibir =1 where id = 343;
-- delete th_rasp_sd where id = 343;

insert into th_rasp_ed (codigo_tp, modulo, argumentos, inhibir) VALUES
(231,4,'{"id1":"231","id2":"232","id3":"233", "floor": "7", "room": "40", "zone": "25","type":"0" ,"trb":"0","nemo":"13"}',0),
(232,4,'{"id1":"231","id2":"232","id3":"233", "floor": "7", "room": "40", "zone": "25","type":"0" ,"trb":"0","nemo":"13"}',0),
(233,4,'{"id1":"231","id2":"232","id3":"233", "floor": "7", "room": "40", "zone": "25","type":"0" ,"trb":"0","nemo":"13"}',0);



-- PENDIENTE EN SOMOSAGUAS
