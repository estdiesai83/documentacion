# sockets:  (argumentos json)

#### luces:

```json
{"nemo" : "0", "location_id": "id_ubicacion", "floor": "id_planta", "group": "id_grupo", "room": "id_estancia", "zone": "id_zona" , "type": "valor tipo*", "value": "valor tp"}

valor tipo*: 0 -> status; 1-> int; 2-> color; 3-> temperatura
```

#### seguridad:

```json
{"nemo" : "1", "location_id": "id_ubicacion", "id": "codigotp", "value": "valor tp"}
```

#### clima:

```json
{"nemo" : "2", "location_id": "id_ubicacion", "floor": "id_planta", "group": "id_grupo", "room": "id_estancia", "zone": "id_zona" , "type": "valor tipo*", "value": "valor tp"}

valor tipo*: 0 -> temp; 1-> consigna; 2-> humedad; 3 -> co2; 4 -> status
```

#### acceso:

```json
{"nemo" : "3", "location_id": "id_ubicacion", "id1": "borna salida", "id2": "borna entrada abierto", "id3": "borna entrada cerrado", "type": "valor tipo*", "trb":"0"}
valor tipo*: 0 -> door; 1-> gate; 2-> garage
```

#### iot:

```json
{"nemo" : "4", "location_id": "id_ubicacion", "floor": "id_planta", "group": "id_grupo", "room": "id_estancia", "zone": "id_zona" , "type": "valor tipo*", "value": "valor tp"}

valor tipo*: 0 -> enchufe; 1-> extractor
```

#### escenas:

```json
{"nemo" : "5", "location_id": "id_ubicacion", "floor": "id_planta", "group": "id_grupo", "room": "id_estancia", "scene": "id_escena*", "action": "valor accion*", "type": "domo_escena**", "type_scene": "tipo_escena***"}

valor accion*: 0-> crear, 1-> modificar, 2 -> borrar , 3-> activar
valor domo_escena: 1-> luces, 2-> clima,3->estor,4->iot,5->persianas
valor tipo_escena: 1-> planta, 2-> grupo,3->estancia

si action es crear o modificar: ademas le llegará "nemo_scene": "nemo_escena","lights":[{id:, nemo:, status:, brightness: , color: }],"climate":[{id:, nemo: , status: , thermostate}],"iot":[{id:, nemo: , status:}],"blinds":[{id:, nemo: , status:, level:}],"louvers":[{id:, nemo: , status:, level:}]

si action es activar: además le llegará :"status": "1"

```

#### ambientes:

```json
{"nemo" : "6", "location_id": "id_ubicacion", "floor": "id_planta", "group": "id_grupo", "room": "id_estancia", "ambient": "id_ambiente" , "type": "valor tipo*", "action": "valor accion*"}

valor tipo*: 0 -> por planta; 1-> por estancia; 2-> por grupo
valor accion*: 0-> crear, 1-> modificar, 2 -> borrar , 3-> activar 

si action es crear o modificar además le llegará: "nemo_ambient": "nemo_ambiente", "lights":[{id:, nemo:, status:, brightness: , color: }],"lights_scenes":"[id_scene]","climate":[{id:, nemo: , status: , thermostate}],"climate_scenes":"[id_scene]","iot":[{id:, nemo: , status:}],"iot_scenes":"[id_scene]","blinds":[{id:, nemo: , status:, level:}],"blinds_scenes":"[id_scene]","louvers":[{id:, nemo: , status:, level:}],"louvers_scenes":"[id_scene]"

si action es activar: además le llegara : "status": "1"
```

#### rutinas:

```json
{"nemo" : "7", "location_id": "id_ubicacion", "floor": "id_planta", "group": "id_grupo", "room": "id_estancia", "rutines": "id_rutina" , "type": "valor tipo*","action": "valor accion*"}

valor tipo*: 0 -> por planta; 1-> por estancia; 2-> por grupo
valor accion*: 0-> crear, 1-> modificar, 2 -> borrar , 3-> activar (en acitvar no va lights,...va status)


si action es crear o modificar además le llegará: "nemo_routine": "nemo_rutina", "lights":[{id:, nemo:, status:, brightness: , color: }],"lights_scenes":"[id_scene]","climate":[{id:, nemo: , status: , thermostate}],"climate_scenes":"[id_scene]","iot":[{id:, nemo: , status:}],"iot_scenes":"[id_scene]","blinds":[{id:, nemo: , status:, level:}],"blinds_scenes":"[id_scene]","louvers":[{id:, nemo: , status:, level:}],"louvers_scenes":"[id_scene]"

si action es activar: además le llegara : "status": "valor_estado"
```



#### cuadros:

```json
{"nemo" : "8", "location_id": "id_ubicacion", "floor": "id_planta", "group": "id_grupo", "room": "id_estancia","zone": "id aut cuadro", "value": "valor tp" , "type": "valor tipo*"}

valor tipo*: 0 -> por planta; 1-> por estancia; 2 -> por grupo
```

#### estores:

```json
{"nemo" : "9", "location_id": "id_ubicacion", "floor": "id_planta", "group": "id_grupo", "room": "id_estancia", "zone": "id_zona" , "type": "valor tipo*", "value": "valor tp"}

valor tipo*: 0 -> position; 1-> level
```

#### multimedia:

```json
{"nemo" : "10", "location_id": "id_ubicacion", "floor": "id_planta", "group": "id_grupo", "room": "id_estancia", "zone": "id_zona" , "type": "valor tipo*", "value": "valor tp"}

valor tipo*: 0 -> proyector; 1-> tv
```

#### piscina:

```json
{"nemo" : "11", "location_id": "id_ubicacion", "floor": "id_planta", "group": "id_grupo", "room": "id_estancia", "zone": "id_zona" ,  "type": "valor tipo*","value": "valor tp"}

valor tipo*: 0 -> temperatura; 1-> estado_luz; 2-> redox; 3-> estado_cobertor; 4-> ph; 5-> estado depuracion
```

#### bombas:

```json
{"nemo" : "12", "location_id": "id_ubicacion", "floor": "id_planta", "group": "id_grupo", "room": "id_estancia", "zone": "id_zona" ,  "type": "valor tipo*","value": "valor tp"}

valor tipo*: 0 -> status; 1-> mode; 2-> programacion
```

#### fancoil:

```json
{"nemo" : "13", "location_id": "id_ubicacion", "floor": "id_planta", "group": "id_grupo", "room": "id_estancia", "zone": "id_zona" ,  "type": "valor tipo*","value": "valor tp"}

valor tipo*: 0 -> status; 1-> speed; 2-> consigna; 3-> sleep; 
```

#### grupo luces:

```json
{"nemo" : "14", "location_id": "id_ubicacion", "floor": "id_planta", "group": "id_grupo", "room": "id_estancia", "lights_group": "id_grupo", "zone": "id_zona" ,  "type": "valor tipo*","value": "valor tp"}

valor tipo*: 0 -> status; 1-> mode; 2-> programacion; 3 -> hour_init;4 -> hour_end;
```

#### grupo bombas:

```json
{"nemo" : "15", "location_id": "id_ubicacion", "floor": "id_planta", "group": "id_grupo", "room": "id_estancia", "pumps_group": "id_grupo", "zone": "id_zona" ,  "type": "valor tipo*","value": "valor tp"}

valor tipo*: 0 -> status; 1-> mode; 2-> programacion;3 -> hour_init;4 -> hour_end;
```

#### cortinas:

```json
{"nemo" : "16", "location_id": "id_ubicacion", "floor": "id_planta", "group": "id_grupo", "room": "id_estancia", "zone": "id_zona" , "value": "valor tp"}
```

#### 





## ENVIAR SOCKET MYSQL:

Dentro del soajs crear una ruta ddbb/update_x/parametro1/parametro2.../parametro_n



En el código del trigger añadir al final:

```mysql
SET @exec_var = sys_exec(CONCAT("curl -d scene_id=",NEW.id," POST http://localhost:1517/ddbb/updateScene"));
```

En las funciones de routes de soajs, hacer lo necesario para obtener los datos que nos falte, para enviar el socket a la app

EJ: updateScene :

1. coger el codigo_escena que le llega desde el trigger , leer los valores de planta, estancia,... 

2. formar la cadena con la estructura json que necesita el socket

3. llamar a la misma funcion que se llama por ejemplo desde el soa cuando se cambia un valor (dicha funcionalidad esta en el servicio de update de soajs)

   websoscket.people (item=>websocket.io(item_socket) emit('data_update',msg));

   donde msg es la cadena json a enviar.