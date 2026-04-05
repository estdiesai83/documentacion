## Cestas Pumps 

#### 1. Domo/Pumps/changeFloorPumpsStatus (floor, status) (se la llama internamente desde la api)

Cambia el estado de las bombas de la planta. Retorna 0.



#### 2. Domo/Pumps/changeLoungePumpsStatus

Cambia el estado de la bomba de la estancia

```php
data: 
1. id: (id estancia)
2. status: 0->apagado; 1->encendido

Respuesta:
object (code)
```



#### 3. Domo/Pumps/changeZonePumpsStatus

Cambia el estado de la bomba de la zona

```php
data: 
1. id: id de la estancia (le llega pero no lo usamos)
2. zone_id: id de la zona
3. status: 0->apagado; 1->encendido
    
Respuesta:
object (code)
```





#### 4. Domo/Pumps/changePumpsGroupStatus

Cambia el estado de la bomba de la zona

```php
data: 
1. floor_id: id de la planta
2. lounge_id: id de la estancia
3. zone_id: id de la zona (grupo)
4. status: 0->apagado; 1->encendido
    
Respuesta:
object (code)
```





#### 5. Domo/Pumps/changePumpsGroupProgramming

Cambia el estado de la programacion zona de un grupo

```php
data: 
1. floor_id: id de la planta
2. lounge_id: id de la estancia
3. zone_id: id de la zona (grupo)
4. status: 0->apagado; 1->encendido
    
Respuesta:
object (code)
```





#### 19. Domo/Pumps/createPeriodicPumpsGroupTime

Cambia el estado de la programacion zona de un grupo de bombas

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



