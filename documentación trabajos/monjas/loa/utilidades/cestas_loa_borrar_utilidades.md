# Cestas Loa (/Utilidades/Borrar)



El boton de Utilidades se utiliza para crear programacion en la bd sistema_x



## 1. deleteProgramming 

```ph
/*
* These parameters are necessary POST:
* data (objet)
    * system
    * ambient_init
    * ambiente_end
    * programming (id programming (task) elegido)
*/
```

```php+HTML
@return int (0 ok 1 Error)
```

Elimina un programming:

1. Borra caso en tabla "ambiente" donde id = ambient_init y donde id = ambient_end
2. Borra caso en tabla "task"  donde id = programming



## 2. deleteVariables

```php
/*
* These parameters are necessary POST:
* data (objet)
	* system
	* id (variables)
*/
```

```php
@return int (0 ok 1 Error)
```

Elimina una variable:

1. Borra caso en tabla "variables" donde id = id
