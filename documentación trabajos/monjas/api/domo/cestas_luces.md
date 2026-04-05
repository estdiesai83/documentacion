## Cestas Luces 

#### 1. Domo/Lights/changeFloorLightStatus (floor, status) (se la llama internamente desde la api)

Cambia el estado de las luces de una planta. Retorna 0



#### 2. Domo/Lights/changeFloorLightIntensity (floor, value) (se la llama internamente desde la api)

Cambia la intensidad de las luces de una planta. Retorna 0



#### 3.Domo/Lights/changeFloorLightColor (floor, value, color) (se la llama internamente desde la api)

Cambia el color de las luces de una planta. Retorna 0



#### 4. Domo/Lights/changeGroupLightStatus (floor, status) (se la llama internamente desde la api)

Cambia el estado de las luces de una planta. Retorna 0



#### 5. Domo/Lights/changeGroupLightIntensity (floor, value) (se la llama internamente desde la api)

Cambia la intensidad de las luces de una planta. Retorna 0



#### 6.Domo/Lights/changeGroupLightColor (floor, value, color) (se la llama internamente desde la api)

Cambia el color de las luces de una planta. Retorna 0



#### 7. Domo/Lights/changeLoungeLightStatus

Cambia el estado de la luz de la estancia

```php
data: 
1. id: id de la estancia 
2. status: 0->apagado; 1->encendido

Respuesta:
object (code)
```



#### 8.Domo/Lights/changeLightIntensityLounge

Cambia la intensidad de la luz de la estancia

```php
data:
1. id (estancia)
2. intensity

Respuesta:
object (code)
```



#### 9.Domo/Lights/changeLightTemperatureLounge

Cambia la temperatura de la luz de la estancia, envia un valor 255 a la temperatura y la intensidad que corresponda y apaga las luces (envia color rgb 0,0,0)

```php
data:
1. id (estancia)
2. intensity

Respuesta:
object (code)
```



#### 10. Domo/Lights/changeColorLightLounge

Cambia el color de la luz de la estancia

```php
data:
1. id (id estancia)
2. color

Respuesta:
object (code)
```



#### 11. Domo/Lights/changeLightIntensityCompleteLounge

Cambia el color de la luz e intensidad de la estancia

MIra si tiene temperatura de color, si es asi envia un 0 a la temperatura

```php
data:
1. id (id estancia)
2. color
3. intensity

Respuesta:
object (code)
```



#### 12. Domo/Lights/changeZoneLightStatus

Cambia el estado de la luz de la zona

```php
data: 
1. id: id de la estancia 
2. zone_id: id de la zona
2. status: 0->apagado; 1->encendido

Respuesta:
object (code)
```



#### 13.Domo/Lights/changeLightIntensityZone

Cambia la intensidad de la luz de la zona

```php
data:
1. id (estancia)
2. zone_id
3. intensity

Respuesta:
object (code)
```



#### 14.Domo/Lights/changeLightTemperatureZone

Cambia la temperatura de la luz de la zona

```php
data:
1. id (estancia)
2. zone_id
3. intensity

Respuesta:
object (code)
```

Mira si tiene color, si  , coge los rb y los pone en color (0,0,0)., para que se apage el rgb



#### 15. Domo/Lights/changeColorLightZone

Cambia el color de la luz de la zona

```php
data:
1. id (id estancia)
2. zone_id
3. color

Respuesta:
object (code)
```



#### 16. Domo/Lights/changeLightIntensityCompleteZone

Cambia la luz y la intensidad de la luz de la zona.

```php
data:
1. id (id estancia)
2. zone_id
3. color
4. intensity

Respuesta:
object (code)
```

MIra si tiene temperatura, si tiene envia temperatura con valor 0





#### 17. Domo/Lights/changeLightsGroupStatus

Cambia el estado de la luz del grupo

```php
data: 
1. floor_id: id de la planta
2. lounge_id: id de la estancia
3. zone_id: id de la zona (grupo)
4. status: 0->apagado; 1->encendido

Respuesta:
object (code)
```



#### 18. Domo/Lights/changeLightsGroupProgramming

Cambia el estado de la programacion zona de un grupo de luces

```php
data: 
1. floor_id: id de la planta
2. lounge_id: id de la estancia
3. zone_id: id de la zona (grupo)
4. status: 0->apagado; 1->encendido
    
Respuesta:
object (code)
```

- Cambia en la tabla grupo_luces el valor del tdato "programacion" con el valor de status
- llama al soajs (changeStatusArrayJobFromApi) para cambiar el estado de las tareas que tiene dicho grupo de luces





#### 19. Domo/Lights/createPeriodicLightsGroupTime

Crea la programacion para el grupo de luces

```php
data: 
1. floor_id: id de la planta
2. lounge_id: id de la estancia
3. group_id: id del (grupo)
4. hour_init: hora de inicio
5. hour_end: hora fin
    
Respuesta:
object (code)
```

- Crea caso en la tabla tarea con el horario correspondiente

- Crear un caso por cada luz perteneciende a dicho grupo luces en tabla tarea_rpc

- Llama a soajs (addArrayJobFromApi) para añadir al array del soajs la nueva tarea para que se ejecute cuando corresponda.

  

#### 20. Domo/Lights/executeOperations(operations) (se la llama internamente desde la api)

Ejecuta todas las operaciones de las luces correspondientes a operations.

Operations es un objeto: codigo_luces, estado, intensidad, rgb, temperatura

