# Cestas Loa (/Depuracion/Crear)



El boton de Depuracion se utiliza para crear programacion de la depuracion



## 1. createElement

```ph
/*
* These parameters are necessary POST:
* data (objet)
    * system
    * type (2-> piscina exterior, 3-> piscina interior)
    * nemo_ele
* tpss
    * rb
    * tipotrb
    * borna
*/
```

```php+HTML
@return int (0 ok 1 Error)
```

Crea un elemento para el mantenimiento de la depuracion:

1. Crea caso en tabla "mto_elemento_trb" con los valores que llegan por argumento
2. Crea caso en tabla "mto_accion_auto" por ahora va fijo 



## 2. readElements

```php
/*
* These parameters are necessary POST:
* data (objet)
	* system
*/
```

```php
@return array (borna, codigo_rb, id, nemo, trb)
```

Lee los elementos del mantenimiento de la depuracion:

1. Lee de la tabla "mt_elemento_trb" los casos donde tipo sea >= 2



