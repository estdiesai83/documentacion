## Cestas Loa (General)

## 1. getTipodriverSubdriver

```php
/*
* These parameters are necessary POST:
* tipo: Arduino, Dali, Ibercomp, Raspberry,...
* clase: ed, sd, dali,...
*/
```

```
return object { tipodriver, subdriver, tipotrb_e, tipotrb_s }
```

Obtiene el tipodriver, subdriver, tipotrb_e, tipotrb_s



## 2. listadoSistemas

```php
/*
* These parameters are necessary POST:
*/
```

```
return array (system) 
```

Lee los diferentes sistemas (las bd que estan programadas sistema_x...)



## 3. getSystemName

```php
/*
* These parameters are necessary POST:
* system
*/
```

```
@return object (host, usuario, clave, canal, bd, rutasoa)
```

Obtiene la configuracion del sistema elegido (lee de la tabla configuracionsoa)