# FANCOIL RUDY



Maquina Fancoil TPSS: 1594

tiene cosifdo 'th_bd' con valor fk=1 y argumentos = '' clima$modoaire$modo"

```mysql
select *from karnaverde_fincarudy._192_168_1_30_1594;
+-----------------------+---------------------+-------+-----------+------+---------------------+---------+
| _id_192_168_1_30_1594 | fecha               | valor | tipotcaso | fk   | argumentos          | inhibir |
+-----------------------+---------------------+-------+-----------+------+---------------------+---------+
|                     1 | 2022-05-22 21:47:23 | 1     | estado    | NULL | NULL                | NULL    |
|                     2 | 2019-10-08 11:08:01 | NULL  | th_bd     | 1    | clima$modoaire$modo | no      |
+-----------------------+---------------------+-------+-----------+------+---------------------+---------+
```



#### Cuando se hace salida llama a FBFK_hilotpcondicion_th_bd_hilostp_libsoav1

Coge fk y argumentos de la tp donde tipotcaso = 'th_bd' e inhibir = no.

Si fk = 0 (consigna):

- FK_escribirvalor_hilostp_libsoav1 (Escribe en tabla clima en tipotcaso = modo en tdato modo el valor de la tp)
- FK_cambiarinhibirthconsigna_hilostp_libsoav1

**Si fk = 1(consignaaire):**

- **FK_escribirvalor_hilostp_libsoav1 (Escribe en tabla clima en tipotcaso = modoaire en tdato modo el valor de la tp)**

- **FK_cambiarinhibirthconsignaaire_hilostp_libsoav1**

  - Coge todas las tps de la tabla clima

  - Por cada tp leida coge el valor de inhibir donde tipotcaso = th_consignaire

    - Si inhibir [0] == si e inhibir[1] == no y valor == 0

      Acitva modo calor y apaga modo frio en la tabla tp en los tcasos th_consignaaire

      ```
      // Activa modo calor
      SET inhibir='no' WHERE tipotcaso = 'th_consignaaire' AND fk=0
      
      // Apaga modo frio
      SET inhibir='si' WHERE tipotcaso = 'th_consignaaire' AND fk=1
      ```

      

    - Si inhibir [0] == no e inhibir[1] == si y valor == 1

      Apaga modo calor y enciende modo frio en la tabla to en los tcasos th_consignaaire

      ```
      // Apaga modo calor
      SET inhibir='si' WHERE tipotcaso = 'th_consignaaire' AND fk=0
      
      // Activa modo frio
      SET inhibir='no' WHERE tipotcaso = 'th_consignaaire' AND fk=1
      ```

      

    - Si inhibir [0] == si e inhibir[1] == si  HACE NADA   ESTAN APAGADOS LOS DOS MODOS

    - Si inhibir [0] == no e inhibir[1] == no //ESTAN LOS DOS MODOS ENCENDIDOS APAGAR EL CONTRARIO

      ```
      Si valor tp = 1 // Apaga modo calor
      SET inhibir='si' WHERE tipotcaso = 'th_consignaaire' AND fk=0
      
      Si valor tp = 0 // Apaga modo frio 
      SET inhibir='si' WHERE tipotcaso = 'th_consignaaire' AND fk=1
      ```





#### Cuando cambia el valor de la consigna





## API:



Zonas que tiene fancoil:

Desde el controlador escribirOnOff:

- Pone las tres velocidades de fancoil a 0

- si estado = 0

  - llama a escribirInhibir: Escribe si en th_consigna
  - hace salida con 0  en tpss bombilla suelo radiante
  - hace salida con 0 en tpss valvula suelo radiante

- Si estado = 1

  - llama a leerModoTp (lee el valor del tdato modo de la tabla clima para la tp 'x')

  - llama a escribirInhibirModo (tp_sonda, modo_leido, 'no') Escribe en tp_sonda en inhibir = no donde tipotcaso = 'th_consigna ' y fk = modo 

    (modo = 0 calor; modo = 1 frio)

  - hace salida con  1 en tpss bombilla suelo radiante







Salon comedor:

TPSE sonda = 734

```
select *from karnaverde_fincarudy._192_168_1_30_734 where tipotcaso = 'estado' or tipotcaso like '%consigna%';
+----------------------+---------------------+-------+-----------------+------+-----------------+---------+
| _id_192_168_1_30_734 | fecha               | valor | tipotcaso       | fk   | argumentos      | inhibir |
+----------------------+---------------------+-------+-----------------+------+-----------------+---------+
|                    1 | 2022-10-21 12:54:56 | 21,94 | estado          | NULL | NULL            | NULL    |
|                   19 | 2019-04-21 21:12:04 | NULL  | th_consigna     | 0    | 13$14$5$710$710 | si      |
|                   20 | 2019-04-21 21:12:04 | NULL  | th_consigna     | 1    | 13$14$5$710$710 | si      |
|                   21 | 2019-04-25 21:53:52 | NULL  | th_consignaaire | 0    | 13$14$5$712$712 | si      |
|                   22 | 2019-04-25 21:54:07 | NULL  | th_consignaaire | 1    | 13$14$5$712$712 | si      |
+----------------------+---------------------+-------+-----------------+------+-----------------+---------+


donde argumentos th_consigna:  13$14$5$710$710  
13-> posicion Q consigna
14 -> posicion Q rango
710 -> valvula suelo radiante


donde argumentos th_consignaaire:  13$14$5$712$712  
13-> posicion Q consigna
14 -> posicion Q rango
712 -> valvula fancoil
```









Idem Despacho  pero con otras tp's:

TPSE sonda = 527

```
select *from karnaverde_fincarudy._192_168_1_30_527 where tipotcaso = 'estado' or tipotcaso like '%consigna%';
+----------------------+---------------------+-------+-----------------+------+----------------+---------+
| _id_192_168_1_30_527 | fecha               | valor | tipotcaso       | fk   | argumentos     | inhibir |
+----------------------+---------------------+-------+-----------------+------+----------------+---------+
|                    1 | 2022-03-04 11:29:31 | -1,00 | estado          | NULL | NULL           | NULL    |
|                   19 | 2019-04-17 13:17:50 | NULL  | th_consigna     | 0    | 9$10$5$500$500 | si      |
|                   20 | 2019-04-17 13:17:50 | NULL  | th_consigna     | 1    | 9$10$5$500$500 | si      |
|                   21 | 2019-04-25 21:52:01 | NULL  | th_consignaaire | 0    | 9$10$5$502$502 | si      |
|                   22 | 2019-04-25 21:52:34 | NULL  | th_consignaaire | 1    | 9$10$5$502$502 | no      |
+----------------------+---------------------+-------+-----------------+------+----------------+---------+
```



Idem Habitacion principal pero con otras tp's
TPSE sonda= 37

```
+---------------------+---------------------+-------+-----------------+------+---------------+---------+
| _id_192_168_1_30_37 | fecha               | valor | tipotcaso       | fk   | argumentos    | inhibir |
+---------------------+---------------------+-------+-----------------+------+---------------+---------+
|                   1 | 2022-10-21 12:56:18 | 23,31 | estado          | NULL | NULL          | NULL    |
|                  19 | 2019-05-21 19:54:00 | NULL  | th_consigna     | 0    | 19$20$5$10$10 | si      |
|                  20 | 2019-05-21 19:54:00 | NULL  | th_consigna     | 1    | 19$20$5$10$10 | si      |
|                  21 | 2019-06-28 11:09:09 | NULL  | th_consignaaire | 0    | 19$20$5$12$12 | si      |
|                  22 | 2019-06-28 11:09:15 | NULL  | th_consignaaire | 1    | 19$20$5$12$12 | si      |
+---------------------+---------------------+-------+-----------------+------+---------------+---------+

```

