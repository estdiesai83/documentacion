
-- terminal_tpss bombilla suelo radiante
-- terminal_tpse estado suelo radiante
-- valves (valvula suelo radiante)
-- probes (la sonda)

-- habitacion2
insert into th_rasp_pulsador (codigo_tp, modulo,argumentos,inhibir) VALUES
(1, 7,'{"trb_tpss":"7","rb_tpss":"2","terminal_tpss":"9","trb_tpse":"0","rb_tpse":"1","terminal_tpse":"10","valves":[{"trb": "7","rb": "2","terminal": "8"}],"probes":[{"trb": "1","rb": "55","terminal": "0"}]}',1);

-- habitacion3
insert into th_rasp_pulsador (codigo_tp, modulo,argumentos,inhibir) VALUES
(2, 7,'{"trb_tpss":"7","rb_tpss":"11","terminal_tpss":"9","trb_tpse":"0","rb_tpse":"10","terminal_tpse":"10","valves":[{"trb": "7","rb": "11","terminal": "8"}],"probes":[{"trb": "1","rb": "56","terminal": "0"}]}',1);

-- habitacion4
insert into th_rasp_pulsador (codigo_tp, modulo,argumentos,inhibir) VALUES
(3, 7,'{"trb_tpss":"7","rb_tpss":"20","terminal_tpss":"9","trb_tpse":"0","rb_tpse":"19","terminal_tpse":"10","valves":[{"trb": "7","rb": "20","terminal": "8"}],"probes":[{"trb": "1","rb": "57","terminal": "0"}]}',1);

-- habitacion5
insert into th_rasp_pulsador (codigo_tp, modulo,argumentos,inhibir) VALUES
(4, 7,'{"trb_tpss":"7","rb_tpss":"29","terminal_tpss":"9","trb_tpse":"0","rb_tpse":"28","terminal_tpse":"10","valves":[{"trb": "7","rb": "29","terminal": "8"}],"probes":[{"trb": "1","rb": "58","terminal": "0"}]}',1);

-- habitacion estudio
insert into th_rasp_pulsador (codigo_tp, modulo,argumentos,inhibir) VALUES
(5, 7,'{"trb_tpss":"7","rb_tpss":"38","terminal_tpss":"9","trb_tpse":"0","rb_tpse":"37","terminal_tpse":"10","valves":[{"trb": "7","rb": "38","terminal": "8"}],"probes":[{"trb": "1","rb": "59","terminal": "0"}]}',1);

-- habitacion invitados
insert into th_rasp_pulsador (codigo_tp, modulo,argumentos,inhibir) VALUES
(6, 7,'{"trb_tpss":"7","rb_tpss":"47","terminal_tpss":"9","trb_tpse":"0","rb_tpse":"46","terminal_tpse":"10","valves":[{"trb": "7","rb": "47","terminal": "8"}],"probes":[{"trb": "1","rb": "60","terminal": "0"}]}',1);
