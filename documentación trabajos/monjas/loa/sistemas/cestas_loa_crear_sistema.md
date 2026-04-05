# Cestas Loa (/Sistemas/Crear)



El boton de Sistemas se utiliza para crear programacion en la bd sistema



## 1. createProject 

```php
/*
* These parameters are necessary POST:
* data (objet)
    * nemo **
    * title **
    * photo
    *
    ** son datos obligatorios
*/
```

```php+HTML
@return int (0 ok 1 Error)
```

Crea un proyecto:

1. Crea caso en tabla proyecto de bd sistema




## 2. createUbication

```php
/*
* These parameters are necessary POST:
* data (objet)
	* nemo **
	* project **
	* apijs **
	* soats **
	* bd **
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

    ** son datos obligatorios
*/
```

```php
@return int (0 ok 1 Error)
```

Crea una ubicacion:

1. Crea caso en tabla ubicacion

2. Crea caso en tabla relacion_proyecto_ubicacion



## 3. createUser

```php
/*
* These parameters are necessary POST:
* data (objet)
	* user **
    * pass **
    * email
    * photo

	** son datos obligatorios
*/
```

```php
@return int (0 ok 1 Error)
```

Crea un usuario:

1. Crea caso en tabla usuario

2. El valor del tdato token_id ser forma con: "4000"+id tabla usuario



## 4. readProject

```php
/*
* These parameters are necessary POST:
*/
```

```php
@return array (id, nemo, foto, titulo)
```

Lee los diferentes proyectos:

1. Lee de los valores de la tabla proyecto




