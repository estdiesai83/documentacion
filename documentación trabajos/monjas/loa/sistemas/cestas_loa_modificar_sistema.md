# Cestas Loa (/Sistemas/Modificar)



El boton de Sistemas se utiliza para crear programacion en la bd sistema



## 1. modifyProject 

```php
/*
* These parameters are necessary POST:
* data (objet)
    * id
    * nemo 
    * title 
    * photo
*/
```

```php+HTML
@return int (0 ok 1 Error)
```

Modifica un proyecto:

1. Escribe valores en tabla proyecto de bd sistema donde id = id




## 2. modifyUbication

```php
/*
* These parameters are necessary POST:
* data (objet)
	* id
	* nemo 
	* project 
	* apijs 
	* soats 
	* bd 
    * direccion
    * clima
    * nombre_bd
    * host_bd
    * port_bd
    * user_bd
    * pass_bd
    * nombre_imp
    * port_imp
    * ip_imp
*/
```

```php
@return int (0 ok 1 Error)
```

Modifica una ubicacion:

1. Escribe valores en tabla ubicacion donde id = id

2. Modifica caso en tabla relacion_proyecto_ubicacion donde codigo_ubicacion = id



## 3. modifyUser

```php
/*
* These parameters are necessary POST:
* data (objet)
	* id
	* user 
    * pass 
    * email
    * photo
*/
```

```php
@return int (0 ok 1 Error)
```

Modifica un usuario:

1. Escribe valores en tabla usuario donde id = id
