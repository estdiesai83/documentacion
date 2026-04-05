## Cestas Loa (Login)

## 1. Login/loginUsuario 

```php
/*
* These parameters are necessary POST:
* user
* pass
*/
```

```
return object(code) { status, type }
 donde status : 0  = ok, 1 = clave error,2 =  no existe usuario
       type : 0  = administrador ; 1 = otros
```

Mira si existe un usuario con los valores introducidos



## 2. Login/createUser 

```php
/*
* These parameters are necessary POST:
* user
* pass
* type
*/
```

```
return int (0 ok 1 error) 
```

Crea un usuario, (solo lo puede crear el administrador)

