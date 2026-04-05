# Cestas Domo

## 1. Domo/Domo/createScenes

Crea una escena del tipo dado segun si esta lleno uno u otro array de lights, climate, blinds

```php
data: 
1. floor_id: id de la planta
2. group_id: id del grupo
4. subgroup_id: id del grupo
5. lounge_id: id de la estancia
6. nemo: nemo de la escena
7. type: tipo escena (0 -> apagado, 1 -> standard, 2-> otros)
8. type_scene: tipo de la escena (1 por planta, 2 por grupo, 3 por estancia, 4 por subgrupo)
9. lights: [{id (zona), color, brightness, status}]   
10. climate:[{id (zona), status, thermostat}]       
11. blinds: [{id (zona), consigna, level}]       
12. louvers: [{id (zona), consigna, level}]       
13. iot: [{id (zona), status}]     
14. fancoil: [{id (zona), status, thermostat}]
15. pump: [{id (zona), status}]     

RESPUESTA:
object (code, data: codigo de la escena creada)
```

1. Crea caso en tabla escenas y cojo el id del caso que se ha creado , que es el codigo_escena.

2. Por cada valor de lights:

   1. Mira si existe un caso en "operacion_luces" igual a cada posicion de lights (mismo codigo_luces,  estado, intensidad, rgb y temperatura) y tipo = 1
      1.  SI:  coge codigo_operacion y crea caso en "relacion_escena_operacion"
      2.  NO:  
          1. Crea caso en tabla "operacion" y cojo el id  que sera el codigo_operacion.
          2. Crea caso en tabla "operacion_luces" con los valores de lights y el codigo_operacion.
          3. Crea caso en tabla "relacion_escena_operacion".

3. Por cada valor de climate: idem a lo anterior pero con tablas "operacion_clima" y tipo = 2.

4. Por cada valor de blinds: idem a lo anterior pero con tablas "operacion_estores" y tipo = 3.

5. Por cada valor de louvers: idem a lo anterior pero con tablas "operacion_persianas" y tipo = 5.

6. Por cada valor de iot: idem a lo anterior pero con tablas "operacion_iot" y tipo = 4.

7. Por cada valor de fancoil: idem a lo anterior pero con tablas "operacion_clima" y tipo = 7.

8. Por cada valor de pumps: idem a lo anterior pero con tablas "operacion_bombas" y tipo = 6.

   

## 2. Domo/Domo/activateScene

Activa una escena

```php
data: 
1. type: tipo de la escena  (1-> luces, 2-> clima, 3-> estor, 4-> iot, 5 -> persianas, 6 -> bombas, 5 -> fancoil)
2. scene_id: id de la escena
    
Respuesta:
object (code)
```

1. Pone todas las escenas de la tabla "escenas" para la estancia a la que pertenece scene_id con estado = 0 y pongo estado con el valor  del argumento status en la escena que llega por argumento.
2. Dependiendo del valor de type, se utiliza unas u otras tablas
3. si type = 1 
   1. Coge de la tabla "relacion_escena_operacion" las operaciones pertenecientes a dicha escena
   2. Por cada operacion cogemos los valores de operacion_luces necesarios a ejecutar por cada codigo_luces cogiendo de la tabla "relacion_luces" los valores necesario para realizar las salidas necesarias llamando al rpc enviando los argumentos leidos
4. si type = 2, idem a type =1 pero utilizando operacion_clima y relacion_clima
5. si type = 3, idem a type =1 pero utilizando operacion_estores y relacion_estores
6. si type = 4, idem a type =1 pero utilizando operacion_iot y relacion_iot
7. si type = 5, idem a type =1 pero utilizando operacion_persianas y relacion_persianas
8. si type = 6, idem a type =1 pero utilizando operacion_bombas y relacion_bombas
9. si type = 7, idem a type =1 pero utilizando operacion_clima y relacion_clima



		type: 1-> luces; 2-> clima; 3->estor, 4-> iot, 5-> persianas, 6-> bombas, 7-> fancoil

Ejecuta las operaciones si el valor del argumento status es 1



## 3. Domo/Domo/modifyScene

Modifica una escena

```php
data: 
1. floor_id: id de la planta
2. group_id: id del grupo
3. subgroup_id: id del subgrupo
4. lounge_id: id de la estancia
5. scene_id : id de la escena
6. nemo: nemo de la escena
7. type_scene: 1-> a nivel de planta, 2-> a nivel de grupo, 3 -> a nivel de estancia
8. lights: [{id (zona), color, brightness, status}]   
9. climate:[{id (zona), status, thermostat}]       
10. blinds: [{id (zona), consigna, level}]       
11. louvers: [{id (zona), consigna, level}]       
12. iot: [{id (zona), status}]       
13. fancoil: [{id (zona), status, thermostat}]       
14. pumps: [{id (zona), status}]       

Respuesta:
object (code)
```



## 4. Domo/Domo/deleteScene

Borra una escena

```php
data: 
1. floor_id: id de la planta    
2. group_id: id del grupo
3. subgroup_id: id del subgrupo
4. lounge_id: id de la estancia
5. scene_id : id de la escena
6. type_scene: 1-> a nivel de planta, 2-> a nivel de grupo, 3 -> a nivel de estancia

Respuesta:
object (code)
```



## 5.Domo/Domo/createAmbients

Crea un ambiente 

```php
data: 
1. floor_id: id de la planta    
2. group_id: id del grupo
3. subgroup_id: id del subgrupo
4. lounge_id: id de la estancia
5. nemo: nemo del ambiente
6. lights_scenes: [{id (escena)}]   
7. lights: [{id (zona), color, brightness, status}]    
8. climate_scenes: [{id (escena)}]   
9. climate:[{id (zona), status, thermostat}] 
10. blinds_scenes: [{id (escena)}]   
11. blinds: [{id (zona), consigna, level}]     
12. louvers_scenes: [{id (escena)}]   
13. louvers: [{id (zona), consigna, level}]     
14. iot_scenes: [{id (escena)}]   
15. iot: [{id (zona), status}]        
16. fancoil_scenes: [{id (escena)}]   
17. fancoil: [{id (zona), status, thermostat}]        
18. pumps_scenes: [{id (escena)}]   
19. pumps: [{id (zona), status}]     
20. type_ambient: tipo del ambiente (1 por planta, 2 por grupo, 3 por estancia, 4 por subgrupo)

Respuesta:
object (code, data: codigo del ambiente creado
```

1. Crea caso en tabla ambiente escribiendo en codigo_x según corresponda  y cojo el id del caso que será el codigo_ambiente

2. Crea caso en tabla operacion y cojo el id del caso que será el codigo_operacion.

3. Por cada valor de lights:

   1. Crea caso en tabla "operacion_luces".
   2. Crea caso en tabla "relacion_ambiente_operacion"

4. Por cada valor de climate: idem a lo anterior pero con tablas "operacion_clima" 

5. Por cada valor de blinds: idem a lo anterior pero con tablas "operacion_estores".

6. Por cada valor de louvers: idem a lo anterior pero con tablas "operacion_persianas".

7. Por cada valor de iot: idem a lo anterior pero con tablas "operacion_iot".

8. Por cada valor de fancoil: idem a lo anterior pero con tablas "operacion_clima".

9. Por cada valor de pumps: idem a lo anterior pero con tablas "operacion_bombas".

10. Por cada valor de lights_scenes:

   11. Crea caso en tabla "relacion_ambiente_escena"

12. Por cada valor de climate_scenes: idem a 10

13. Por cada valor de blinds_scenes: idem a 10

14. Por cada valor de louvers_scenes: idem a 10

15. Por cada valor de iot_scenes: idem a 10

16. Por cada valor de fancoil_scenes: idem a 10

17. Por cada valor de pump_scenes: idem a 10

    

## 8. Domo/Domo/activateAmbients

Activa un ambiente

```php
data: 
1. floor_id: id de la planta
2. group_id: id del grupo
3. subgroup_id: id del subgrupo
4. lounge_id: id de la estancia
5. ambient_id: id del ambiente
6. type_ambient: tipo del ambiente (1 por planta, 2 por grupo, 3 por estancia, 4 por subgrupo)
    
Respuesta:
object (code)
```

1. Pone todas los ambientes de la tabla "ambiente" para la estancia a la que pertenece ambient_id con estado = 0 y pongo estado =1 en el ambiente que llega por argumento.

2. Coge de la tabla "relacion_ambiente_operacion" las operaciones pertenecientes a dicho ambiente, estos pueden ser de cualquier tipo (luces, clima, estor, persianas, iot, fancoil, bombas), dependiendo de al que pertenezca se cogeran los valores a ejecutar de operacion_luces y relacion_luces, de operacion_clima y relacion_clima, de operacion_estor y relacion_estor, de operacion_persianas y relacion_persianas, de operacion_iot y relacion_ioty/o de operacion_bombas y relacion_bombas..

3. Coge de la tabla "relacion_ambiente_escena" las escenas pertenecientes a dicho ambiente, y por cada una las operaciones que tenga, estas pueden ser de cualquier tipo (luces, clima, estor, persianas, iot, fancoil, bombas), dependiendo de al que pertenezca se cogeran los valores a ejecutar de escenas, operacion_luces y relacion_luces, operacion_clima y relacion_clima, operacion_estor y relacion_estor, de  operacion_persianas y relacion_persianas,  de operacion_iot y relacion_iot  y/o  operacion_bombas y relacion_bombas.

   ** cogera de escenas las escena dependiendo del tipo (1 -> luces, 2-> clima,..)

4. Hace las salidas correspondientes con los valores que hemos obtenido



## 9. Domo/Domo/modifyAmbients

Modifica un ambiente 

```php
data: 

1. floor_id: id de la planta
2. group_id: id del grupo
3. subgroup_id: id del subgrupo
4. lounge_id: id de la estancia
5. ambient_id: id del ambiente
6. nemo: nemo del ambiente
7. lights_scenes: [{id (escena)}]   
8. lights: [{id (zona), color, brightness, status}]    
9. climate_scenes: [{id (escena)}]   
10. climate:[{id (zona), status, thermostat}] 
11. blinds_scenes: [{id (escena)}]   
12. blinds: [{id (zona), consigna, level}]     
13. louvers_scenes: [{id (escena)}]   
14. louvers: [{id (zona), consigna, level}]     
15. iot_scenes: [{id (escena)}]   
16. iot: [{id (zona), status}]     
17. fancoil_scenes: [{id (escena)}]   
18. fancoil: [{id (zona), status, thermostat}]     
19. pumps_scenes: [{id (escena)}]   
20. pumps: [{id (zona), status}]     
21. type_ambient: tipo del ambiente (1 por planta, 2 por grupo, 3 por estancia, 4 por subgrupo)


Respuesta:
object (code)
```



## 10. Domo/Domo/deleteAmbients

Elimina un ambiente de una estancia

```php
data:
1. floor_id: id de la planta
2. group_id: id del grupo
3. subgroup_id: id del subgrupo
4. lounge_id: id de la estancia
5. id: id del ambiente
6. type_ambient: tipo del ambiente (1 por planta, 2 por grupo, 3 por estancia, 4 por subgrupo)
    
Respuesta:
object (code)
```



## 11. Domo/Domo/createRoutines

Crea una rutina 

```php
data:
1. floor_id: id de la planta
2. group_id: id del grupo
3. subgroup_id: id del subgrupo
4. lounge_id (estancia)
5. nemo: nemo de la rutina
6. lights_scenes: [{id (escena)}]   
7. lights: [{id (zona), color, brightness, status}]   
8. climate_scenes: [{id (escena)}]   
9. climate:[{id (zona), status, thermostat}] 
10. blinds_scenes: [{id (escena)}]   
11. blinds: [{id (zona), consigna, level}]
12. louvers_scenes: [{id (escena)}]   
13. louvers: [{id (zona), consigna, level}]
14. iot_scenes: [{id (escena)}]   
15. iot: [{id (zona), status}]
16. fancoil_scenes: [{id (escena)}]   
17. fancoil: [{id (zona), status, thermostat}]
18. pumps_scenes: [{id (escena)}]   
19. pumps: [{id (zona), status}]
20. notifications: 0 -> off; 1 -> on
21. init_date: fecha inicio
22. end_date: fecha fin
23. init_hour: hora inicio (12:00, +5, -3)
24. end_hour: hora fin (12:00, +5, -3)
25. init_type: tipo hora inicio (0 -> fija, 1-> amanecer, 2-> atardecer)
26. end_type: tipo hora fin (0 -> fija, 1-> amanecer, 2-> atardecer)
27: schedule: [1,2,3]
28. type_routine: tipo de la rutina (1 por planta, 2 por grupo, 3 por estancia, 4 por subgrupo)

Respuesta:
object (code, data: codigo de la rutina creada
```

1. Crea caso  en tabla "rutina" (schedule, nemo, estado, hora_inicio, tipo_inicio, hora_fin, tipo_fin, codigo_estancia, notificacion, tipo_rutina) con los valores que le llegan y tipo_rutina = 0 (Rutina inicio)
2. Si hay hora fin: Crea caso  en tabla "rutina" (schedule, nemo, estado, hora_inicio, tipo_inicio, hora_fin, tipo_fin, codigo_estancia, notificacion, tipo_rutina, pertenencia ) con los valores que le llegan y tipo_rutina = 1 (Rutina fin) y pertencia = id de la rutina inicio que se acaba de crear.
3. Crea caso  en tabla "ot"  con fecha inicio y fecha fin si es que tiene por cada caso rutina
4. Crea cado en relacion_ot con el codigo_ot y codigo_rutina
5. Crea caso en tabla "relacion_rutina_escena" si se ha elegido alguna escena, y/o en "relacion_rutina_operacion" por cada operacion (si esta fuese nueva, crearia caso en operacion, operacio-x)
6. Para rutina hora inicio: 
   1. Crea caso en tabla "tarea" escribiendo en tdatos:
      1. modo (1-> hora fija, 4-> si es hora amanecer  y 5-> si es hora atardecer)
      2. schedule: el schedule los valores  que le llegan
      3. submodo: 2 (rutina inicio)
      4. tipo: 5 (rutina)
      5. comentario: 'Inicio Tarea Rutina'
      6. estado: 1 (siempre se crea la rutina activada)
   2. Crea caso en tabla "tarea_rutina" con id tarea y codigo_rutina
7. Para rutina hora fin :
   1. (Idem a la anterior) cambiando en: 
      1. submodo: 3 (rutina fin)
      2. comentario: 'Fin Tarea Rutina'
   2. Crea caso en tabla "tarea_rutina" con id tarea y codigo_rutina
8. Para rutina con fecha fin: 
   1. Crea caso en tabla "tarea" escribiendo en los tdatos:
      1. modo: 0  (puntual)
      2. schedule: una fecha puntual
      3. submodo: null
      4. tipo = 1 (bd)  para eliminar caso en tabla tarea y caso en tabla rutina
      5. comentario: 'Eliminar Rutina'
   2. Crea caso en tabla "tarea_bd" para eliminar de la tabla rutina, escribiendo en los tdatos:
      1. tipo : 3 (delete)
      2. codigo_tarea: id de la tarea de fecha_fin
      3. bd: Ej:somosaguas
      4. tabla: rutina
      5. condicion: 'codigo_rutina = id_rutina'
   3. Crea caso en tabla "tarea_bd" para eliminar de la tabla tarea la tarea correspondientee, scribiendo en los tdatos:
      1. tipo : 3 (delete)
      2. codigo_tarea: id de la tarea de fecha_fin
      3. bd: Ej:somosaguas
      4. tabla: tarea
      5. condicion: 'id = id_tarea'



## 12. Domo/Domo/modifyRoutines

Modifica una rutina 

```php
data:
1. floor_id: id de la planta
2. group_id: id del grupo
3. subgroup_id: id del subgrupo
4. lounge_id: id de la estancia
5. id (rutina)
6. nemo: nemo de la rutina
7. lights_scenes: [{id (escena)}]   
8. lights: [{id (zona), color, brightness, status}]   
9. climate_scenes: [{id (escena)}]   
10. climate:[{id (zona), status, thermostat}] 
11. blinds_scenes: [{id (escena)}]   
12. blinds: [{id (zona), consigna, level}]
13. louvers_scenes: [{id (escena)}]   
14. louvers: [{id (zona), consigna, level}]
15. iot_scenes: [{id (escena)}]   
16. iot: [{id (zona), status}]
17. fancoil_scenes: [{id (escena)}]   
18. fancoil: [{id (zona), status, thermostat}]
19. pumps_scenes: [{id (escena)}]   
20. pumps: [{id (zona), status}]
21. notifications: 0 -> off; 1 -> on
22. init_date: fecha inicio
23. end_date: fecha fin
24. init_hour: hora inicio
25. end_hour: hora fin
26: schedule: [1,2,3]
27.init_type: tipo hora inicio (0 -> fija, 1-> amanecer, 2-> atardecer)
28.end_type: tipo hora fin (0 -> fija, 1-> amanecer, 2-> atardecer) o null si no tiene horafin
29. type_routine: tipo de la rutina (1 por planta, 2 por grupo, 3 por estancia, 4 por subgrupo)

Respuesta:
object (code, data: codigo de la rutina creada
```

1. Por cada operacion perteneciente a la rutina borro caso de relacion_rutina_operacion y de operacion
2. Por cada escena pertenecniente a la rutina borro relacion_rutina_escena
3. Borra del array del soajs para que no se ejecute la rutina
4. Borra de la tabla tarea las tareas correspondientes a la rutina
5. Borra de la tabla ot y de relacion_ot_rutina la rutina correspondiente
6. Modifica los valores de la rutina de inicio
7. Elimina la rutina fin si la rutina fin tiene en el tdato pertencia el valor del id de la rutina inicio a la que corresponde.



## 13. Domo/Domo/deleteRoutines

Elimina una rutina 

```php
data:
1. floor_id: id de la planta
1. group_id: id del grupo
3. subgroup_id: id del subgrupo
4. lounge_id: id de la estancia
5. id: id de la rutina
6. type_routine: tipo de la rutina (1 por planta, 2 por grupo, 3 por estancia, 4 por subgrupo)
    
Respuesta:
object (code)
```





## 14. Domo/Domo/changeStatusRoutines

Activa una rutina 

```php
data: 
1. floor_id: id de la planta
2. group_id: id del grupo
3. subgroup_id: id del subgrupo
4. lounge_id: id de la estancia
5. routine_id: id de la rutina
6. status: estado de la rutina
7. type_routine: tipo de la rutina (1 por planta, 2 por grupo, 3 por estancia, 4 por subgrupo)
    
Respuesta:
object (code)
```

1. Pone todas las rutinas de la tabla "rutinas" para la estancia a la que pertenece routine_id con estado = 0 y pongo estado =1 en la rutina que llega por argumento.

2. Coge de la tabla "relacion_rutina_operacion" las operaciones pertenecientes a dicha rutina, estos pueden ser de cualquier tipo (luces, clima, estor, persianas, iot), dependiendo de al que pertenezca se cogeran los valores a ejecutar de operacion_luces y relacion_luces, de operacion_clima y relacion_clima, de operacion_estor y relacion_estor, de operacion_persianas y relacion_persianas  y/o de operacion_iot y relacion_iot.

3. Coge de la tabla "relacion_rutina_escena" las escenas pertenecientes a dicha rutina, y por cada una las operaciones que tenga, estas pueden ser de cualquier tipo (luces, clima, estor, persianas, iot), dependiendo de al que pertenezca se cogeran los valores a ejecutar de escena_luces, operacion_luces y relacion_luces, de escena_clima, operacion_clima y relacion_clima, de escena_estor, operacion_estor y relacion_estor, de escena_persianas, operacion_persianas y relacion_persianas y/o  escena_iot, operacion_iot y relacion_iot.

4. Pone estado a 1 en la tabla tarea para la rutina que corresponda

   1. 

## 15. Domo/Domo/changeDevice

```php
data:
1. device 0 home 1 floor 2 grupo 3 estancia 4 subgrupo
2. id intenger (ubicacion,floor,group,subgroup, lounge)
3. status integer (0/1)
4. Value integer
5. Color string (0,0,0)
6. type (integer)
      *  0 Light (status,value,color)
      *  1 Climate (status,value)
      *  2 iot (status)
      *  3 Blind (value,position)
      *  4 Louver (value)
      
      
Respuesta:
object (code )
```

Cambia de las luces (estado, intensidad, color) segun corresponda.

Cambia del clima (estado,valor) segun corresponda.

Cambia del iot  (estado) segun corresponda.

Cambia del los estores (nivel) segun corresponda.

Cambia de las persianas (nivel) segun corresponda.



## 16. Domo/Domo/changeFloorDevice

```php
data:
1. id (floor)
2. status (0/1)
3. Value
4. Color string (0,0,0)
5. type: 
      *  0 Ligth (status,value,color)
      *  1 Climate (status)
      *  2 Iot (status)
      *  3 Blind (value)
      *  4 Louver (value)
      
Respuesta:
object (code )
```

Cambia de las luces (estado, intensidad, color) de la planta que corresponda.

Cambia del clima (estado,valor) de la planta que corresponda.

Cambia del iot  (estado) de la planta que corresponda.

Cambia del los estores (nivel) de la planta que corresponda.

Cambia de las persianas (nivel) de la planta que corresponda.



## 17. Domo/Domo/changeHomeDevice

```php
data:
1. id (ubicacion)
2. status (0/1)
3. Value
4. Color string (0,0,0)
5. type: 
      *  0 Ligth (status,value,color)
      *  1 Climate (status)
      *  2 Iot (status)
      *  3 Blind (value)
      *  4 Louver (value)
      
Respuesta:
object (code )
```

Cambia de las luces (estado, intensidad, color) de toda la casa.

Cambia del clima (estado,valor) de toda la casa.

Cambia del iot  (estado) de toda la casa.

Cambia del los estores (nivel) de toda la casa.

Cambia de las persianas (nivel) de toda la casa.