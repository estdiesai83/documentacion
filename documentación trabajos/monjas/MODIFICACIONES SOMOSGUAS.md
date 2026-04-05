# MODIFICACIONES SOMOSAGUAS



1. #### A nivel de planta (si se cambia las estancias de una planta a otra) 

   1. 

   2. Cambiar tabla "estancia" el valor del codigo_planta

   3. Cambiar en la tabla th_x los socket

      ```mysql
      update th_x set argumentos = replace(argumentos,'"floor":"x"','"floor":"y"');
      ```

      

2. #### A nivel de estancia ( si se pasan las zonas de una estancia a otra estancia)

   1. Cambiar en la tablas zonas (luces, clima, estor, ...) el valor del tdato codigo_estancia

   2. Si la estancia a mover tiene escena:

      1. Mirar si la estancia de destino tiene escenas:
         1. Si : Modificar en tabla "relacion_escena_operacion el codigo_escena" de la estancia a mover por el codigo de la estancia destino
         2. NO: Crear una operacion para la luz, estor que no tiene escena , crear un caso en relacion_escena_operacion con esa operacion con cod_escena la de la escena a mover

   3. Cambiar en la tabla th_x los socket

      ```mysql
      update th_x set argumentos = replace(argumentos,'"room":"x"','"room":"y"');
      ```

      

3. #### Si se crea un grupo

   1. Crear caso en tabla grupo 

   2. Escribir en las estancias que corresponda el codigo_grupo

   3. Añadir en los th's sockets el grupo

      ```mysql
      update th_x set argumentos = replace(argumentos,'"room"','"group":"x","room"');
      ```

      

4. #### Si se crea un subgrupo

   1. Crear caso en tabla subgrupo

   2. Escribir en las estancias que corresponda el codigo_subgrupo

   3. Añadir e<n los th's sockets el grupo

      ```
      update th_x set argumentos = replace(argumentos,'"room"','"subgroup":"x","room"');
      ```



NOTA

Antes de hacer cambios: 

Pasar bd somosguas a pr_somosaguas por que tenemos priebas de crear rutinas, escenas, .... y hay casos que no estan en somosaguas



### PLANTA 1

1. Desaparece baño habitacion (12) y se mete en habitacion (11)

```
Cambiar luces y operaciones
update luces set codigo_estancia = 12 where codigo_estancia =11;

Mover operaciones del baño a las escenas de habitacion
+-----+---------------------+------------+-----------------+--------+----------+------+-----------+---------------+--------------+
| id  | fecha               | nemo       | codigo_estancia | estado | tipodomo | tipo | eliminado | codigo_planta | codigo_grupo |
+-----+---------------------+------------+-----------------+--------+----------+------+-----------+---------------+--------------+
|   9 | 2022-04-26 12:26:19 | apagar     |              11 |      1 |        1 |    0 |         0 |          NULL |         NULL |
|  21 | 2022-04-26 12:26:20 | máxima     |              11 |      0 |        1 |    1 |         0 |          NULL |         NULL |
| 103 | 2022-07-02 16:17:03 | standard   |              11 |      0 |        1 |    2 |         0 |          NULL |         NULL |
| 132 | 2022-07-07 19:20:12 | subir todo |              11 |      0 |        3 |    1 |         0 |          NULL |         NULL |
| 134 | 2022-07-07 19:20:12 | bajar todo |              11 |      0 |        3 |    0 |         0 |          NULL |         NULL |
| 137 | 2022-07-12 13:04:07 | eco        |              11 |      0 |        1 |    2 |         0 |          NULL |         NULL |
| 173 | 2022-07-12 13:04:08 | romantic   |              11 |      0 |        1 |    2 |         0 |          NULL |         NULL |
| 209 | 2022-07-12 13:04:08 | cine       |              11 |      0 |        1 |    2 |         0 |          NULL |         NULL |
+-----+---------------------+------------+-----------------+--------+----------+------+-----------+---------------+--------------+

update relacion_escena_operacion set codigo_escena = 9 where codigo_escena = 10;
update relacion_escena_operacion set codigo_escena = 21 where codigo_escena = 22;
update relacion_escena_operacion set codigo_escena = 103 where codigo_escena = 104;
update relacion_escena_operacion set codigo_escena = 137 where codigo_escena = 138;
update relacion_escena_operacion set codigo_escena = 173 where codigo_escena = 174;
update relacion_escena_operacion set codigo_escena = 209 where codigo_escena = 210;


Estas escenas deapareceran baño:
+-----+---------------------+----------+-----------------+--------+----------+------+-----------+---------------+--------------+
| id  | fecha               | nemo     | codigo_estancia | estado | tipodomo | tipo | eliminado | codigo_planta | codigo_grupo |
+-----+---------------------+----------+-----------------+--------+----------+------+-----------+---------------+--------------+
|  10 | 2022-04-26 12:26:19 | apagar   |              12 |      1 |        1 |    0 |         0 |          NULL |         NULL |
|  22 | 2022-04-26 12:26:20 | máxima   |              12 |      0 |        1 |    1 |         0 |          NULL |         NULL |
| 104 | 2022-07-02 16:17:03 | standard |              12 |      0 |        1 |    2 |         0 |          NULL |         NULL |
| 138 | 2022-07-12 13:04:07 | eco      |              12 |      0 |        1 |    2 |         0 |          NULL |         NULL |
| 174 | 2022-07-12 13:04:08 | romantic |              12 |      0 |        1 |    2 |         0 |          NULL |         NULL |
| 210 | 2022-07-12 13:04:08 | cine     |              12 |      0 |        1 |    2 |         0 |          NULL |         NULL |
+-----+---------------------+----------+-----------------+--------+----------+------+-----------+---------------+--------------+


El baño no tiene clima, ni iot, ni estor, ni persianas

```

2. Desaparece estancia vestibulo h (67) pasa a estudio (9)

   ```
   Cambiar luces y operaciones
   update luces set codigo_estancia = 9 where codigo_estancia = 67;
   
   
   Escenas de estudio:
   +-----+---------------------+----------+-----------------+--------+----------+------+-----------+---------------+--------------+
   | id  | fecha               | nemo     | codigo_estancia | estado | tipodomo | tipo | eliminado | codigo_planta | codigo_grupo |
   +-----+---------------------+----------+-----------------+--------+----------+------+-----------+---------------+--------------+
   | 245 | 2022-07-15 08:35:55 | apagar   |               9 |      1 |        1 |    0 |         0 |          NULL |         NULL |
   | 246 | 2022-07-15 08:35:56 | maxima   |               9 |      0 |        1 |    1 |         0 |          NULL |         NULL |
   | 247 | 2022-07-15 08:35:56 | standard |               9 |      0 |        1 |    2 |         0 |          NULL |         NULL |
   | 248 | 2022-07-15 08:35:57 | eco      |               9 |      0 |        1 |    2 |         0 |          NULL |         NULL |
   | 249 | 2022-07-15 08:35:57 | romantic |               9 |      0 |        1 |    2 |         0 |          NULL |         NULL |
   | 250 | 2022-07-15 08:35:57 | cine     |               9 |      0 |        1 |    2 |         0 |          NULL |         NULL |
   +-----+---------------------+----------+-----------------+--------+----------+------+-----------+---------------+--------------+
   
   
   Escenas de vestibulo no tiene: crear operaciones para luz con codigo_luces = 96;
   
   insert into operacion (id, tipodomo,estado) values (349,1,1);
   insert into operacion (id, tipodomo,estado) values (350,1,0);
   insert into operacion (id, tipodomo,estado) values (351,1,0);
   
   insert into relacion_escena_operacion (id, codigo_escena,codigo_operacion) values (,245,349);
   insert into relacion_escena_operacion (id, codigo_escena,codigo_operacion) values (,246,350);
   insert into relacion_escena_operacion (id, codigo_escena,codigo_operacion) values (,247,351);
   
   insert into operacion_luces (codigo_luces, codigo_operacion,estado, intensidad, rgb, temperatura) VALUES
   (96,349,0,100,NULL,-1),
   (96,350,1,100,NULL,-1),
   (96,351,1,50,NULL,-1);
   
   
   ```

   

3. 