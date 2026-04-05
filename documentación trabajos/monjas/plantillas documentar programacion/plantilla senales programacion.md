# Plantilla Programacion

| ip   | puerto | num_placa |
| ---- | ------ | --------- |
|      |        |           |



| Estancias | cod_estancia | planta | cod_planta | grupo | cod_grupo | subgrupo | cod_subgrupo |
| --------- | ------------ | ------ | ---------- | ----- | --------- | -------- | ------------ |
|           |              |        |            |       |           |          |              |



### Salidas sd

| Bo   | familia | nemo | rb   | tp   | th   | nemoth | estancia | zona |
| ---- | ------- | ---- | ---- | ---- | ---- | ------ | -------- | ---- |
| S0   |         |      |      |      |      |        |          |      |
| S1   |         |      |      |      |      |        |          |      |
| S2   |         |      |      |      |      |        |          |      |
| S3   |         |      |      |      |      |        |          |      |
| S4   |         |      |      |      |      |        |          |      |
| S5   |         |      |      |      |      |        |          |      |
| S6   |         |      |      |      |      |        |          |      |
| S7   |         |      |      |      |      |        |          |      |
| S8   |         |      |      |      |      |        |          |      |
| S9   |         |      |      |      |      |        |          |      |
| S10  |         |      |      |      |      |        |          |      |
| S11  |         |      |      |      |      |        |          |      |
| S12  |         |      |      |      |      |        |          |      |
| S13  |         |      |      |      |      |        |          |      |
| S14  |         |      |      |      |      |        |          |      |
| S15  |         |      |      |      |      |        |          |      |



### Entradas digitales

| Bo   | Tipo | Tiempo | familia | nemo | rb   | tp   | th   | nemoth | estancia | zona |
| ---- | ---- | ------ | ------- | ---- | ---- | ---- | ---- | ------ | -------- | ---- |
| E0   |      |        |         |      |      |      |      |        |          |      |
| E1   |      |        |         |      |      |      |      |        |          |      |
| E2   |      |        |         |      |      |      |      |        |          |      |
| E3   |      |        |         |      |      |      |      |        |          |      |
| E4   |      |        |         |      |      |      |      |        |          |      |
| E5   |      |        |         |      |      |      |      |        |          |      |
| E6   |      |        |         |      |      |      |      |        |          |      |
| E7   |      |        |         |      |      |      |      |        |          |      |
| E8   |      |        |         |      |      |      |      |        |          |      |
| E9   |      |        |         |      |      |      |      |        |          |      |
| E10  |      |        |         |      |      |      |      |        |          |      |
| E11  |      |        |         |      |      |      |      |        |          |      |
| E12  |      |        |         |      |      |      |      |        |          |      |
| E13  |      |        |         |      |      |      |      |        |          |      |
| E14  |      |        |         |      |      |      |      |        |          |      |
| E15  |      |        |         |      |      |      |      |        |          |      |



### Sondas 

| Bo   | Tipo | idsonda | Tiempo | familia | nemo | rb   | tp   | th   | nemoth | estancia | zona |
| ---- | ---- | ------- | ------ | ------- | ---- | ---- | ---- | ---- | ------ | -------- | ---- |
| E0   |      |         |        |         |      |      |      |      |        |          |      |
| E0   |      |         |        |         |      |      |      |      |        |          |      |

#### CONSIGNAS:

| nemo variables | nemotp     | id   | tp sonda | rb_tpss | bo_tpss | rb_tpse | bo_tpse |
| -------------- | ---------- | ---- | -------- | ------- | ------- | ------- | ------- |
| consigna_nemo1 | temp nemo1 |      |          |         |         |         |         |
| rango_nemo1    | temp nemo1 |      |          |         |         |         |         |

**(tpss y tpse valvula)



### Dalis

| Nemo Grupo |
| ---------- |
|            |

| TPSS   |             |            |           |            | Zonas        |          |        |        |        |            |
| ------ | ----------- | ---------- | --------- | ---------- | ------------ | -------- | ------ | ------ | ------ | ---------- |
| **Bo** | **familia** | **nemo**   | **grupo** | **iddali** | **estancia** | **zona** | **rb** | **tp** | **th** | **nemoth** |
| S1     | Alumbrado   | Intensidad |           |            |              |          |        |        |        |            |

*Si se programa un grupo en el LOA internamente se suma 64, si es iddali se introduce el valor directamente. 

| TPSE   |            |             |            |             | Zonas        |          |        |        |
| ------ | ---------- | ----------- | ---------- | ----------- | ------------ | -------- | ------ | ------ |
| **Bo** | **tiempo** | **familia** | **nemo**   | **comando** | **estancia** | **zona** | **rb** | **tp** |
| E3     | 1800 sg    | Alumbrado   | Integridad |             |              |          |        |        |





### Persianas

somfy 50 -> transmisor -> 05F0CB

| nemo | canal | rb   | tp_estado | tp_consigna | cod_est | estancia | zona |
| ---- | ----- | ---- | --------- | ----------- | ------- | -------- | ---- |
|      | 0     |      |           |             |         |          |      |
|      | ....  |      |           |             |         |          |      |
|      |       |      |           |             |         |          |      |

**estado -> control de posicion

**consigna -> dim oscuridad



### Estores

somfy 50 -> comando = 0 ->  transmiter = FFFF00, tiempo entrada= 10 sg

| nemo | nodo |
| ---- | ---- |
|      |      |

| **Bo** | **familia** | **nemo** | **estancia** | zona | **rb** | **tp** | **th** | **nemoth** |
| ------ | ----------- | -------- | ------------ | ---- | ------ | ------ | ------ | ---------- |
| S0     | estores     | Posicion |              |      |        |        |        |            |
| S1     | estores     | nivel    |              |      |        |        |        |            |



## Sockets

sockets programados tiene que ser iguales en entradas y salidas (ed y sd type = 0 y dali type = 1):

sd: 

select th.id, th.codigo_tp,th.argumentos from th_rasp_sd as th inner join trb_rasp_sd as tr on th.codigo_tp = tr.id where tr.codigo_rb = x and th.modulo = 4 order by th.codigo_tp;

```json

```

ed

select th.id, th.codigo_tp,th.argumentos from th_rasp_ed as th inner join trb_rasp_ed as tr on th.codigo_tp = tr.id where tr.codigo_rb = x and th.modulo = 4 order by th.codigo_tp;

```json

```

dali

select th.id, th.codigo_tp,th.argumentos from th_rasp_dali_s as th inner join trb_rasp_dali_s as tr on th.codigo_tp = tr.id where (tr.codigo_rb >= x AND tr.codigo_rb <=y ) and th.modulo = 4 order by th.codigo_tp;

```json

```

estor

salida

select th.id, th.codigo_tp,th.argumentos from th_somfy_50_s as th inner join trb_somfy_50_s as tr on th.codigo_tp = tr.id where (tr.codigo_rb >= x AND tr.codigo_rb <=y )  and th.modulo = 4 order by th.codigo_tp;

```json

```

entrada

select th.id, th.codigo_tp,th.argumentos from th_somfy_50_e as th inner join trb_somfy_50_e as tr on th.codigo_tp = tr.id where (tr.codigo_rb >= x AND tr.codigo_rb <=y ) and th.modulo = 4 order by th.codigo_tp;

```json

```

sondas

select th.id, th.codigo_tp,th.argumentos from th_rasp_ds18b20 as th inner join trb_rasp_ds18b20 as tr on th.codigo_tp = tr.id where (tr.codigo_rb >= x AND tr.codigo_rb <=y ) and th.modulo = 4 order by th.codigo_tp;

```json

```



th_consigna

select th.id, th.codigo_tp,th.argumentos from th_rasp_ds18b20 as th inner join trb_rasp_ds18b20 as tr on th.codigo_tp = tr.id where (tr.codigo_rb >= x AND tr.codigo_rb <=y ) and th.modulo = 6 order by th.codigo_tp;

```mysql

```

th_pulsador

select th.id, th.codigo_tp,th.argumentos from th_rasp_pulsador as th inner join trb_rasp_pulsador as tr on th.codigo_tp = tr.id where (tr.codigo_rb >= x AND tr.codigo_rb <=y ) and th.modulo = 7 order by th.codigo_tp;

```

```

