# Cestas Loa (/Depuracion/Borrar)



El boton de Depuracion se utiliza para eliminar programacion de la depuracion



## 1. deleteElement

```ph
/*
* These parameters are necessary POST:
* data (objet)
    * system
    * nemo_ele
    * element
*/
```

```php+HTML
@return int (0 ok 1 Error)
```

Elimina un elemento de la depuracion:

1. Borra caso en tabla "mto_elemento_trb" donde id = element

   
