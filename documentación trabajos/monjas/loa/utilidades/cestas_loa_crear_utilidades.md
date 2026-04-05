# Cestas Loa (/Utilidades/Crear)



El boton de Utilidades se utiliza para crear programacion en la bd sistema_x



## 1. createProgramming 

```php
/*
* These parameters are necessary POST:
* data (objet)
    * system 
    * level (1 - por planta, 2-> por grupo, 3-> por estancia, 4-> por subgrupo )
    * type_domo (0 -> luces, 1-> clima,...)
    * type
    domo_id: id de la planta, grupo, estancia o subgrupo dependiendo del nivel elegido
    nemo
    * init_zones array (object)
    	* id (id zona)
    	* nemo
    	*  si es de tipo luces (status, intensity, color, temprature, rb_s_estado, 	   
    	   codigo_tp_s_estado, rb_e_estado, codigo_tp_e_estado, rb_dali1, codigo_tp_int1,...
    	* select (si esta marcada o no la zona)
    * init_scenes array
    * init_type
    * init_offset
    * init_hour
    * init_value
    	* si es de tipo luces (status, intensity, color, temperature)
    * init_mode
    * init_schedule array object (id, nemo, select)
    * init_date
    * end_zones array (object) idem a init_zones
    * end_scenes array
    * end_type
    * end_offset
    * end_hour
    * end_value
    	* si es de tipo luces (status, intensity, color, temperature)
    * end_mode    
    * end_schedule array object (id, nemo, select)
    * end_date
    * hab_user
    * hab_admin
    * temporal
    * notification
*/  
```

```php+HTML
@return int (0 ok 1 Error)
```

Crea un programming:

1. Crea caso en tabla "ambiente" 
2. Crea caso en tabla "task" 



## 2. createVariables

```php
/*
* These parameters are necessary POST:
* data (objet)
	* system
	* nemo
	* value
*/
```

```php
@return int (0 ok 1 Error)
```

Crea una variable:

1. Crea caso en tabla "variables"

