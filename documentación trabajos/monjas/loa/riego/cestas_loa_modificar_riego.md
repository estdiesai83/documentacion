# Cestas Loa (/Riego/Modificar)



El boton de Riego se utiliza para modificar programacion del riego



## 1. modifyElement

```ph
/*
* These parameters are necessary POST:
* data (objet)
    * system
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

Modifica un elemento para el mantenimiento del riego:

1. Modifica caso en tabla "mto_elemento_trb" con los valores que llegan por argumento  donde id = element

   
