# Cestas Loa (/Riego/Borrar)



El boton de Riego se utiliza para eliminar programacion del riego



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

Elimina un elemento del riego:

1. Borra caso en tabla "mto_elemento_trb" donde id = element


