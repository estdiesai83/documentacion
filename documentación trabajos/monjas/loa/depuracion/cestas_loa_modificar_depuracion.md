# Cestas Loa (/Depuracion/Modificar)



El boton de Depuracion se utiliza para modificars programacion de la depuracion



## 1. modifyElement

```ph
/*
* These parameters are necessary POST:
* data (objet)
    * system
    * type
    * element
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

Modifica un elemento para el mantenimiento de la depuracion:

1. Modifica caso en tabla "mto_elemento_trb" con los valores que llegan por argumento  donde id = element

   
