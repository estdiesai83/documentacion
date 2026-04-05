# Cestas Cuadro

## 1. DistributionPanel/readAllDistributionPanel

Lee todos los cuadros existentes

```php
Data:

Respuesta:
object (code)

Ejemplo:
{id: 1, nemo: "C1 - ALUMBRADO EXTERIOR", dimension: "2 x 24",
automaticos
[
{id: 1, fila: 1, nemofila: "Fila 1", nemo: "Diferencial entrada", tipo: 0, estado: 1},
{id: 2, fila: 1, nemofila: "Fila 1", nemo: "Automatico entrada zona 1", tipo: 1, estado: 1},
{id: 3, fila: 1, nemofila: "Fila 1", nemo: "Automatico entrada zona 2", tipo: 1, estado: 1}
]
```

Donde type: puede tener los valores :

```php
-1 vacio

1. Automatico 1
2. Automatico 2
3. Automatico 3
4. Automatico 4

5. Diferencial 1
6. Diferencial 2
7. Diferencial 3
8. Diferencial 4
```





## 2. DistributionPanel/changeStatus

Cambia el estado de un automatico/diferencial de un cuadro

```php
data: 
1. panel_id: id del cuadro
2. id: id del automatico/diferencial
3. status: valor de estado (1-> on , 0-> off)
    
Respuesta:
object (code)
```

1. Escribe estado en la tabla automaticos en el id correspondiente
2. Hace la salida correspondiente (coge rb y codigotp), 
