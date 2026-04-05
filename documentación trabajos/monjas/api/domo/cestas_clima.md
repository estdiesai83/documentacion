## Cestas Clima 

#### 1.Domo/Climate/changeClimateStatusFloor (floor, status) (se la llama internamente desde la api)

Cambia el estado del clima de la planta. 



#### 2.Domo/Climate/changeClimateConsignaFloor (floor, value ) (se la llama internamente desde la api)

Cambia la consigna del clima de la planta.



#### 3. Domo/Climate/changeClimateStatusLounge () 

Cambia el estado del clima de la estancia

```php
data: 
1. id: id de la estancia
2. status: 0->apagado; 1->encendido

Respuesta:
object (code)
```

#### 4.Domo/Climate/changeClimateConsignaLounge () 

Cambia la consigna del clima de la estancia

```php
data: 
1. id: id de la estancia
2. value: valor de la consigna

Respuesta:
object (code)
```



#### 5. Domo/Climate/changeClimateStatusZone () 

Cambia el estado del clima de la zona

```php
data: 
1. id: id de la estancia
2. id_zone: id de la zona
2. status: 0->apagado; 1->encendido

Respuesta:
object (code)
```



#### 6.Domo/Climate/changeClimateZoneConsigna () 

Cambia el estado del clima de la zona

```php
data: 
1. id: id de la estancia
2. id_zone: id de la zona
3. value: valor de la consigna

Respuesta:
object (code)
```



#### 7.Domo/Climate/changeModeClimate() 

Cambia el estado de las maquinas del clima

```php
data: 
1. id: id de la maquina
2. value: valor de la maquina (1 -> frio, 0 -> calor)

Respuesta:
object (code)
```



#### 8.Domo/Climate/writePotentiometerZone() 

Cambia la velocidad del fancoil (aire acondicionado)

```php
data: 
1. id_zone: id de la zona
2. value: valor de la velocidad (0 -> vel 1, 1->vel 2, 2 -> vel 3)

Respuesta:
object (code)
```

#### 9. Domo/Climate/changeClimateFancoilStatusZone () 

Cambia el estado del fancoil (aire acondicionado) de la zona

```php
data: 
1. id: id de la estancia
2. id_zone: id de la zona
2. status: 0->apagado; 1->encendido

Respuesta:
object (code)
```



#### 10. Domo/Climate/changeClimateFancoilZoneConsigna () 

Cambia la consigna del fancoil (aire acondicionado) de la zona

```php
data: 
1. id: id de la estancia
2. id_zone: id de la zona
3. value: valor de la consigna

Respuesta:
object (code)
```

#### 11. Domo/Climate/sleepClimateFancoilZone () 

Pone el temporizador de apagado en el fancoil correspondiente

```php
data: 
1. id: id de la estancia
2. id_zone: id de la zona
3. time: tiempo del sleep

Respuesta:
object (code)
```

crea una tarea con salida = 0 para que se apague el clima 'x' tiempo despues del actual







#### 12. Domo/Climate/executeOperations(operations) (se la llama internamente desde la api)

Ejecuta todas las operaciones del clima correspondientes a operations.

Operations es un objeto: codigo_clima, estado, consigna

