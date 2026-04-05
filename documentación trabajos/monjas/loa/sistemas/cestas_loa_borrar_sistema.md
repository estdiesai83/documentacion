# Cestas Loa (/Sistemas/Borrar)



El boton de Sistemas se utiliza para crear programacion en la bd sistema



## 1. deleteProject 

```php
/*
* These parameters are necessary POST:
*/
```

```php+HTML
@return array (0 ok 1 Error)
```

Elimina un proyecto:

1. Elimina caso en tabla proyecto de bd sistema donde id = id




## 2. deleteUbication

```php
/*
* These parameters are necessary POST:
* data (objet)
	* id
*/
```

```php
@return int (0 ok 1 Error)
```

Elimina una ubicacion:

1. Elimina caso en tabla ubicacion donde id = id

2. Elimina caso en tabla relacion_proyecto_ubicacion donde  codigo_ubicacion = id



## 3. deleteUser

```php
/*
* These parameters are necessary POST:
* data (objet)
	* id
*/
```

```php
@return int (0 ok 1 Error)
```

Elimina un usuario:

1. Elimina caso en tabla usuario donde id = id





## 4. readUbications

```php
/*
* These parameters are necessary POST:
*/
```

```php
@return array (nemo, direccion, codigo_clima, bd, apijs, 
               ip_impresora, puerto_impresora, nombre_impresora, 
               nombre_bd, host_bd, port_bd, user_bd, pass_bd, 
               soats)
```

Lee las diferentes ubicaciones:

1. Lee de los valores de la tabla ubicacion



## 4. readUsers

```php
/*
* These parameters are necessary POST:
*/
```

```php
@return array (user, pass, token_id, email, foto)
```

Lee los diferentes usuarios:

1. Lee de los valores de la tabla ususario









