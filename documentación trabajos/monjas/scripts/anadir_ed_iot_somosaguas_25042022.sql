
-- habitacion 2
update tpse set codigo_relacion_rb = 2 where numeroborna = 15 and codigo_rb = 1;

update iniciarhilostrb set bornas = REPLACE(bornas, '5,6,7','5,6,7,15') where codigo_rb=1;

INSERT into trb_rasp_ed (borna, codigo_rb, domo) VALUES (15,1,0);

-- habitacion 3

update tpse set codigo_relacion_rb = 7 where numeroborna = 15 and codigo_rb = 10;

update iniciarhilostrb set bornas = REPLACE(bornas, '5,6,7','5,6,7,15') where codigo_rb=10;

INSERT into trb_rasp_ed (borna, codigo_rb, domo) VALUES (15,10,0);

-- habitacion 4

update tpse set codigo_relacion_rb = 12 where numeroborna = 15 and codigo_rb = 19;

update iniciarhilostrb set bornas = REPLACE(bornas, '5,6,7','5,6,7,15') where codigo_rb=19;

INSERT into trb_rasp_ed (borna, codigo_rb, domo) VALUES (15,19,0);


-- habitacion 5

update tpse set codigo_relacion_rb = 17 where numeroborna = 15 and codigo_rb = 28;

update iniciarhilostrb set bornas = REPLACE(bornas, '5,6,7','5,6,7,15') where codigo_rb=28;

INSERT into trb_rasp_ed (borna, codigo_rb, domo) VALUES (15,28,0);


-- habitacion estudio

update tpse set codigo_relacion_rb = 22 where numeroborna = 15 and codigo_rb = 37;

update iniciarhilostrb set bornas = REPLACE(bornas, '5,6,7','5,6,7,15') where codigo_rb=37;

INSERT into trb_rasp_ed (borna, codigo_rb, domo) VALUES (15,37,0);


-- habitacion invitados

update tpse set codigo_relacion_rb = 27 where numeroborna = 15 and codigo_rb = 46;

update iniciarhilostrb set bornas = REPLACE(bornas, '5,6,7','5,6,7,15') where codigo_rb=46;

INSERT into trb_rasp_ed (borna, codigo_rb, domo) VALUES (15,46,0);

