-- select luces.id,luces.nemo,luces.codigo_estancia,estancia.codigo_grupo from luces inner join estancia on luces.codigo_estancia = estancia.id where estancia.codigo_planta = 2 and estancia.codigo_grupo = 1;
-- +-----+-----------------------+-----------------+--------------+
-- | id  | nemo                  | codigo_estancia | codigo_grupo |
-- +-----+-----------------------+-----------------+--------------+
-- | 118 | Led bañador           |               4 |            1 |
-- | 119 | Led escaleras piscina |               4 |            1 |
-- |  37 | focos techo exterior  |              18 |            1 |
-- |  38 | led exterior          |              18 |            1 |
-- |  59 | focos terraza sala tv |              72 |            1 |
-- |  60 | led terraza sala tv   |              72 |            1 |
-- +-----+-----------------------+-----------------+--------------+

-- sd luces 118 y 119 placa piscina exterior
update iniciarhilostrb set inhibir = 1 where codigo_rb = 500 and bornas = 1;
update iniciarhilostrb set inhibir = 1 where codigo_rb = 500 and bornas = 3;
-- sd luces 37 y 38 placa bar
update iniciarhilostrb set inhibir = 1 where codigo_rb = 70 and bornas = 3;
update iniciarhilostrb set inhibir = 1 where codigo_rb = 70 and bornas = 4;
-- sd luces 59 y 60 entrada comedor sala tv 1
update iniciarhilostrb set inhibir = 1 where codigo_rb = 101 and bornas = 6;
update iniciarhilostrb set inhibir = 1 where codigo_rb = 101 and bornas = 7;

-- dalis luces 118 y 119 placa piscina exterior
update iniciarhilostrb set inhibir = 1 where codigo_rb = 512;
update iniciarhilostrb set inhibir = 1 where codigo_rb = 530;
-- dalis luces 37 y 38 placa bar
update iniciarhilostrb set inhibir = 1 where codigo_rb = 78;
update iniciarhilostrb set inhibir = 1 where codigo_rb = 79;
-- dalis luces 59 y 60 entrada comedor sala tv 1
update iniciarhilostrb set inhibir = 1 where codigo_rb = 113;
update iniciarhilostrb set inhibir = 1 where codigo_rb = 114;
