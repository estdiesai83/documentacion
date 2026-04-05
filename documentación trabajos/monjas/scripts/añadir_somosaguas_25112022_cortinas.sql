
-- CORTINAS
insert into cortinas (nemo, codigo_estancia, estado, tipo) values
('Cortina izquierda',9,0,2),
('Cortina fondo',9,0,2);


insert into relacion_cortinas (codigo_cortinas, rb_s_abrir, codigo_tp_s_abrir, rb_s_cerrar, codigo_tp_s_cerrar, rb_e_abrir, codigo_tp_e_abrir, rb_e_cerrar, codigo_tp_e_cerrar) values
(1,322,195,322,196,321,235,321,236),
(2,322,197,322,198,321,237,321,238);


insert into th_rasp_ed (codigo_tp,modulo, argumentos, inhibir) values
(235,4,'{"id1":"0","id2":"235","id3":"236", "floor": "3", "room": "9", "zone": "1","type":"1" ,"trb":"0","nemo":"16"}',0),
(236,4,'{"id1":"0","id2":"235","id3":"236", "floor": "3", "room": "9", "zone": "1","type":"1" ,"trb":"0","nemo":"16"}',0),
(237,4,'{"id1":"0","id2":"237","id3":"238", "floor": "3", "room": "9", "zone": "1","type":"1" ,"trb":"0","nemo":"16"}',0),
(238,4,'{"id1":"0","id2":"237","id3":"238", "floor": "3", "room": "9", "zone": "1","type":"1" ,"trb":"0","nemo":"16"}',0);

