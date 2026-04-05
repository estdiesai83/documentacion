# Cestas Loa (/Tecladoauto/Borrar)



El boton de Tecladoauto se utiliza para programar las señales y la domotica de un sistema 'x'



# COMANDO

## 1. deleteCommand

```php
/*
* These parameters are necessary POST:
* data (objet)
	* valores comunes a cualquier tipo:
    	* f1
    	* f2
    	* f3
    	* nemo
    	* system 
    	* tipodriver
    	* codigo_comando
    * segun el tipo y clase: Ejemplo: tipos: Raspberry, ibercomp,..
         *                                 clase: ed, sd, eth, ...
         *	arduino: puertosalida, ip, numborna_entrada, numborna_salida,
         *  dali:
         *     serie: puerto,velocidad, nemo, paridad, bitstop, bitdatos, nr_comando
         *     eth: ip, puertosalida
         *  ibercomp: clase
         *     8ed: puerto, nr_comando, velocidad, eco
         *     8ea:                 "
         *     8sd:                 "
         *     8edeth: puerto, ip
         *     8sdeth:           "
         *     8eaeth:           "
         *     8saeth:           "
         *     ibemeter:
         *     8ed_conv: comando, puerto, ip
         *     8sd_conv: comando, puerto, ip
         *     8ed_modbus: comando, puerto, ip
         *     8sd_modbus: comando, puerto, ip
         *  sugarvalelley
         *     serie: comando, puerto, velocidad,
         *     serie2:comando, puerto, velocidad,
         *  zenner
         *     serie: puerto, velocidad, nr_comando
         *     eth: ip, puerto
         *  raspberry:
         *     Dali: clase, puerto, nr_comando,
         *     ED:                 "
         *     SD:                 "
         *     Pulsos: clase, puerto, ip
         *     DS18B20:           "
         *     SHT31:             "
         *     EA:                "
         *     Pulsador:          "
         *     Vel-viento:        "
         *     Dir-viento:        "
         *     Sonda-suelo:       "
         *     CO2:       "
         *  matrix: idmodem, puertoentrada, puertosalida, puertoserie
         *  iluest: idmodem, puertoentrada, puertosalida, puertoserie, extension
         *  smarttrail:
         *     X100: ip, puerto
         *     X835: ip, puerto
         *  supercal:
         *     serie: puerto,velocidad, nemo, nr_comando
         *     eth: ip, puertosalida
         *  analizador: ip, puertosalida
         *  solar: ip, puertosalida
         *  readwatt: ip, puerto
         *  datasolMet: comando, ip, puerto
         *  valvulamultipuerto: comando, ip, puertosalida
         *  sivoia: comando, ip, puertosalida
         *  zenner: comando, ip, puerto
         *  siber: comando, ip, puerto
         *  sungrow: comando, ip, puerto
         *  somfy: comando, ip, puerto, receptor, transmitter
         *  aerotermia: comando, ip, puerto
         *  mitsubishi:
         *     melco : comando, ip, puerto
         *     intesis: comando, ip, puerto
         *  deshumectadora: comando, ip, puerto
         *  md02: comando, ip, puerto
         *  abb_b2: comando, ip, puerto
         *  dooya: ip, puerto, key, token, identificador
      *
	   * tipo:1 arduino,2 dali,3 ibercomp, 4 sugarvalley, 5 zenner,6 raspberry,
      *      7 matrix e iluest, 8 smarttrail, 9 supercal, 10 analizador,
      *      11 solar, 12 readwatt, 13 datasolMet, 14 valvulamultipuerto,
      *      15 sivoia, 16 siber, 17 sungrow, 18 somfy, 19 aerotermia,
      *      20 mitsubishi, 21 deshumectadora, 22 md02, 23 abb_b21, 24 dooya
      */
```

```php+HTML
@return int (0 ok 1 Error)
```

Borra las estructuras para el comando de un cacharro determinado (raspberry, ibercomp, sugarvalley,...)

1. Borrar caso en tabla "comando" donde id = codigo_comando
2. Borra caso en tabla "rb"  para los rb pertenencientes al comando elegido
3. Borra n casos en tabla "tpse" para los rb pertenencientes al comando elegido
7. Borra n casos en tabla "tpss" para los rb pertenencientes al comando elegido
5. Borra n casos en table "iniciarhilostrb" para los rb pertenencientes al comando elegido
6. Escribe -1 en los rb_x y codigo_rb_x de las zonas (luces, clima,... si es que tiene algun funcionalidad de domo programada)



# TRB

## 1. deleteTrbInput

```php
/*
* These parameters are necessary POST:
* data (objet)
    * system
    * nemo
    * codigo_rb
    * codigo_relacion_rb
	* bornas
*/
```

```php
@return int (0 ok 1 Error)
```

Elimina un trb de entrada :

1. Elimina caso en tabla "relacion_rb" (id = codigo_rb)
2. Reinicia los casos de "tpse"  donde (codigo_rb = codigo_rb)
4. Elimino caso en tabla "iniciarhilostrb" donde (codigo_rb = codigo_rb)
5. Elimina caso en la tabla tp correspondiente  donde (codigo_rb = codigo_rb)
5. Elimina los th correspondientes a dicha tp
6. Escribe -1 en los rb_x y codigo_rb_x de las zonas (luces, clima,... si es que tiene algun funcionalidad de domo programada)



# TCAMPOS

## 1. deleteTPsInput

```php
/*
* These parameters are necessary POST:
* data (objet)
	* system
    * id
    * codigo_rb
*/
```

```php
@return int (0 ok 1 Error)
```

Elimina una tpse (tp entrada):

1. Reinicia los casos de "tpse"  donde (id = id)
2. Elimina caso en la tabla tp y th para la tp elegida 
3. Escribe -1 en los rb_x y codigo_rb_x de las zonas (luces, clima,... si es que tiene algun funcionalidad de domo programada)

## 2. deleteTPsOutput

```php
/*
* These parameters are necessary POST:
* data (objet)
	* system
    * nemo
    * bornas
    * codigo_rb
*/
```

```php
@return int (0 ok 1 Error)
```

Elimina una tpss (tp salida):

1. Reinicia los casos de "tpss"  donde (id = id)
2. Elimina caso en la tabla tp y th para la tp elegida 
3. Escribe -1 en los rb_x y codigo_rb_x de las zonas (luces, clima,... si es que tiene algun funcionalidad de domo programada)
4. Elimina el caso correspondiente de la tabla "iniciarhilostrb"

## 3. deleteTPcm

```php
/*
* These parameters are necessary POST:
* data (objet)
	* system
    * nemo
    * bornas
    * codigo_rb
*/
```

```php
@return int (0 ok 1 Error)
```

Elimina una tpcm (tp multiple):

1. Reinicia los casos de "tpss"  donde (id = id)
2. Elimina caso en la tabla tp y th para la tp elegida 
3. Escribe -1 en los rb_x y codigo_rb_x de las zonas (luces, clima,... si es que tiene algun funcionalidad de domo programada)
4. Elimina el caso correspondiente de la tabla "iniciarhilostrb"



# TH

## 1. deleteConsigna

```php
/*
* These parameters are necessary POST:
* data (objet)
	* system
* tpse (objetc): tpse sonda
    * rb
    * tipotrb
    * borna
*/
```

```php
@return int (0 ok 1 Error)
```

Elimina del th de la tp (sonda) correspondiente la funcionalidad de consigna:

1. Elimina caso en la tabla "variables" para la "consigna_"+nemo

2. Elimina caso en la tabla "variables" para el "rango_"+nemo.

3. Borrar en la tabla th (de la sonda) caso para la tp elegida donde modulo = 6

4. Escribe -1 en los rb_x y codigo_rb_x de las zonas (clima,fancoil) si es que tiene algun funcionalidad de domo programada)

   

## 2. deleteSecurityChain

```php
/*
* These parameters are necessary POST:
* data (objet)
	* system
* modo: entrada o salida (donde va cosido el th (tp entrada o tp salida))
* tpse (objetc):
    * rb
    * tipotrb
    * borna
* tpss (object):
    * rb
    * tipotrb
    * borna
*/
```

```php
@return int (0 ok 1 Error)
```

Elimina la funcionalidad de cadena seguridad en la tp seleccionada:

1. Borra en la tabla th caso para la tp elegida donde modulo = 3




## 3. deletePulsador

```php
/*
* These parameters are necessary POST:
* data (objet)
	* system
* tpse_pulsador (objetc):
    * rb
    * tipotrb
    * borna
*/
```

```php
@return int (0 ok 1 Error)
```

Elimina la funcionalidad de pulsador en la tp correspondiente:

1. Elimina en la tabla th (del pulsador) caso para la tp elegida donde modulo = 7

   

# DOMO

## 1. deleteFloor

```php
/*
* These parameters are necessary POST:
* data (objet)
	* system
    * floor
*/
```

```php
@return int (0 ok 1 Error)
```

Elimina una planta:

1. Elimina las zonas, estancias, subgrupos y grupo pertencientes a la planta elegida.
2. Elimina los th_socket que contienen dicha planta
3. Elimina caso en la tabla "planta" donde id = floor.
4. Elimina los ambientes por planta donde codigo_planta = floor
5. Elimina los cuadros por planta donde codigo_planta = floor
6. Elimina las escenas por planta donde codigo_planta = floor



## 2. deleteGroup

```php
/*
* These parameters are necessary POST:
* data (objet)
	* system
    * floor
    * group
*/
```

```php
@return int (0 ok 1 Error)
```

Elimina un grupo:

1. Elimina las zonas, estancias y subgrupos pertencientes al grupo elegido.
2. Elimina los th_socket que contienen dicho grupo
3. Elimina caso en la tabla "grupo" donde id = group.
4. Elimina los ambientes por grupo donde codigo_grupo = group
5. Elimina los cuadros por grupo donde codigo_grupo = group
6. Elimina las escenas por grupo donde codigo_grupo = group



## 3. deleteSubgroup

```php
/*
* These parameters are necessary POST:
* data (objet)
	* system
    * floor
    * group
    * subgroup
*/
```

```php
@return int (0 ok 1 Error)
```

Elimina un subgrupo:

1. Elimina las zonas y estancias pertencientes al subgrupo elegido.
2. Elimina los th_socket que contienen dicho subgrupo
3. Elimina caso en la tabla "subgrupo" donde id = subgroup.
4. Elimina los ambientes por subgrupo donde codigo_subgrupo = subgroup
5. Elimina los cuadros por subgrupo donde codigo_subgrupo = subgroup
6. Elimina las escenas por subgrupo donde codigo_subgrupo = subgroup



## 4. deleteLounge

```php
/*
* These parameters are necessary POST:
* data (objet)
	* system
    * floor
    * group (no es obligatorio)
    * subgroup (no es obligatorio)
    * lounge
*/
```

```php
@return int (0 ok 1 Error)
```

Elimina una estancia:

1. Elimina las zonas pertencientes a la estancia elegida.
2. Elimina los th_socket que contienen dicha estancia
3. Elimina caso en la tabla "estancia" donde id = estancia.
4. Elimina los ambientes por estancia donde codigo_estancia = lounge
5. Elimina los cuadros por estancia donde codigo_estancia = lounge
6. Elimina las escenas por estancia donde codigo_estancia = lounge



## 5. deleteZones

```php
/*
* These parameters are necessary POST:
* data:
    * system (bd)
    * floor
    * group
    * subgroup
    * lounge
    * type (integer)
        *  0 Light
        *  1 Climate
        *  2 iot
        *  3 Blinds
        *  4 Louver
        *  5 Pums
        *  6 Multimedia
        *  7 Pool
        *  8 Fancoil
        *  9 Distributtion
        *  10 Seguridad
        *  11 Accesos
        *  12 Cortinas
        *  13
        *  14 Consuption
*/
```

```php
@return int (0 ok 1 Error)
```

Elimina una zona:

1. Elimina las zona de la tabla luces, clima,... segun el valor de type.

2. Elimina los th_socket que contienen dicha zona

3. Elimina las operaciones de la zona elegida de tabla "operacion",  y ("operacion_luces", "operacion_clima", ... segun corresponda)

4. Escribe -1 en la tp que corresponda en el tdato (tipodomo), para que no escriba en la tabla (luces, clima,.... según corresponda).

   

## 6. deleteCompartidas

```php
/*
* These parameters are necessary POST:
* data:
    * system (bd)
    * type (integer)
        *  0 Light
        *  1 Climate
        *  2 iot
        *  3 Blinds
        *  4 Louver
        *  5 Pums
        *  6 Multimedia
        *  7 Pool
        *  8 Fancoil
        *  9 Distributtion
        *  10 Seguridad
        *  11 Accesos
        *  12 Cortinas
        *  13
        *  14 Consuption
     *id   
*/
```

```php
@return int (0 ok 1 Error)
```

Elimina una propiedad compartida:

1. Segun el tipo: 
   1. si es de tipo luces: elimina caso de la tabla relacion_luces_compartidas.



## 7. deleteScenes

```php
/*
* These parameters are necessary POST:
* data (objet)
    * system
    * scene (id escena)
*/
```

```php
@return int (0 ok 1 Error)
```

Elimina una escena:

1. Borra caso de la tabla "escenas"  donde id = scene.
2. Borra caso de la tabla "relacion_escena_operacion" donde codigo_escena = scene



## 8. deleteAmbient

```php
/*
* These parameters are necessary POST:
    * data (objet)
    * system
    * type_ambient
        * 1 -> ambiente
        * 2 -> rutina
        * 3 -> programacion
        * 4 -> sleep
        * 5 -> programa
    * ambient (id tabla ambiente)
*/
```

```php
@return int (0 ok 1 Error)
```

Elimina un ambiente, rutina, programacion,... segun el valor de type_ambient:

1. Borra caso de la tabla "ambiente"  donde id = ambient.
2. Borra caso de la tabla "relacion_ambiente_escena" donde codigo_ambiente = ambient
3. Borra caso de la tabla "relacion_ambiente_operacion" donde codigo_ambiente = ambient
4. Borra caso de la tabla "task" donde codigo_ambiente_inicio o codigo_ambiente_fin = ambient



## 9. deleteDistributionPanel

```php
/*
* These parameters are necessary POST:
* data (objet)
    * system
    * type_panel
    * panel (id cuadro)
*/
```

```php
@return int (0 ok 1 Error)
```

Elimina un cuadro:

1. Borra caso de la tabla "cuadro"  donde id = panel.
2. Borra caso de la tabla "automaticos" donde codigo_cuadro  = panel
3. Elimina el th socket correspondiente



## 10. deleteAutomatic

```php
/*
* These parameters are necessary POST:
* data (objet)
    * system
    * automatic(id automatico)
*/
```

```php
@return int (0 ok 1 Error)
```

Elimina un automatico:

1. Borra caso de la tabla "automaticos" donde id  = automatic
2. Elimina el th socket correspondiente



## 11. deleteAtHome

```php
/*
* These parameters are necessary POST:
* data (objet)
    * system
    * athome(id athome)
*/
```

```php
@return int (0 ok 1 Error)
```

Elimina un automatico:

1. Borra caso de la tabla "athome" donde id  = athome



## 12. deleteModo

```php
/*
* These parameters are necessary POST:
* data (objet)
    * system
    * modo(id modo)
*/
```

```php
@return int (0 ok 1 Error)
```

Elimina un modo:

1. Borra caso de la tabla "modo" donde id  = modo



## 13. deleteProgram

```php
/*
* These parameters are necessary POST:
* data (objet)
    * system
    * program(id programa)
*/
```

```php
@return int (0 ok 1 Error)
```

Elimina un programa:

1. Borra caso de la tabla "programa" donde id  = program