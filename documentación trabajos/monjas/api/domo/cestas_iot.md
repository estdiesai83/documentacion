## Cestas Iot 

#### 1. Domo/Iot/changeFloorIotStatus (floor, status) (se la llama internamente desde la api)

Cambia el estado de los iot de la planta. Retorna 0.



#### 2. Domo/Iot/changeLoungeIotStatus

Cambia el estado de los iot de la estancia

```php
data: 
1. id: (id estancia)
2. status: 0->apagado; 1->encendido

Respuesta:
object (code)
```



#### 3. Domo/Iot/changeZoneIotStatus

Cambia el estado del iot de la zona

```php
data: 
1. id: id de la estancia (le llega pero no lo usamos)
2. zone_id: id de la zona
3. status: 0->apagado; 1->encendido
    
Respuesta:
object (code)
```



