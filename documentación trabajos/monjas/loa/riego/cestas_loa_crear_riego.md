# Cestas Loa (/Riego/Crear)



El boton de Riego se utiliza para crear programacion del riego



## 1. createElement

```ph
/*
* These parameters are necessary POST:
* data (objet)
    * system
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

Crea un elemento para el mantenimiento del riego:

1. Crea caso en tabla "mto_elemento_trb" con los valores que llegan por argumento  y  tipo = 1
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

Lee los elementos del mantenimiento del riego:

1. Lee de la tabla "mt_elemento_trb" los casos donde tipo = 1.



