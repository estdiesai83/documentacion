# Cestas Loa (/Tecladoauto/Modificar)



El boton de Tecladoauto se utiliza para programar las señales y la domotica de un sistema 'x'



# COMANDO

## 1. modifyCommand

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

Modifica las estructuras para el comando de un cacharro determinado (raspberry, ibercomp, sugarvalley,...)

1. Modifica caso en tabla "comando" donde id = codigo_comando
2. Modifica valores del comando en tabla "iniciarhilostrb"



**Se llamara al modelo que corresponda segun el tipo de comando



# TRB

## 1. modifyTrbInput

```ph
/*
* These parameters are necessary POST:
* data (objet)
    * system
    * codigo_rb
    * tiempo
    * idborna (no es obligatorio)
    * numconversor (no es obligatorio)
    * numcomando (no es obligatorio)
    * estado
*/
```

```php
@return int (0 ok 1 Error)
```

Modificar el trb que corresponda :

1. Modifica caso en tabla "rb" (id = codigo_rb)
2. Modifica caso en "relacion_rb" (codigo_rb = codigo_rb)
3. Modifica caso en tabla "iniciarhilostrb" donde codigo_rb = codigo_rb



# TCAMPOS

## 1. modifyTpInput

```php
/*
* These parameters are necessary POST:
* data (objet)
    * system
    * f1tps
    * f2tps
    * f3tps
    * nemotps
    * borna
    * tipoborna
* tps (objet)
	* max
*/
```

```php
@return int (0 ok 1 Error)
```

Modifica una tpse (tp entrada):

1. Escribe en tabla "tpse" los valores correspondientes (f1, f2, f3, nemo, tipoborna) para la borna elegida.
2. Modifica caso/ss en la tabla th si se ha elegido o eliminado alguna funcionalidad (contador, maximo, minimo, media).



## 2. modifyTpOutput

```php
/*
* These parameters are necessary POST:
* data (objet)
    * f1
    * f2
    * f3
    * nemo
    * borna
    * seudoborna
    * tipoborna
    * system
    * tipotemporizada
    * temporizadadias, temporizadahoras, temporizadaminutos, temporizadasegundos **
    
    ** estos ultimos valores vendran si la salida es temporizada
*/
```

```php
@return int (0 ok 1 Error)
```

Modifica una tpss (tp salida):

1. Escribe en tabla "tpss" los valores correspondientes (f1, f2, f3, nemo, tipoborna, seudoborna) para la borna elegida.
2. Si la salida es temporizada, modifica caso en la tabla "variables" con el valor del tiempo correpondiente
3. Modifica caso en tabla "iniciarhilostrb" 



## 3. modifyTpcm

```php
/*
* These parameters are necessary POST:
* data (objet)
    * f1
    * f2
    * f3
    * nemo    
    ** estos ultimos valores vendran si la salida es temporizada
*/
```

```php
@return int (0 ok 1 Error)
```

Modifica una tpss (tp salida):

1. Escribe en tabla "tpss" los valores correspondientes (f1, f2, f3, nemo, tipoborna, seudoborna) para la borna elegida.
2. Si la salida es temporizada, modifica caso en la tabla "variables" con el valor del tiempo correpondiente
3. Modifica caso en tabla "iniciarhilostrb" 



# TH

## 1. modifyConsigna

```php
/*
* These parameters are necessary POST:
* data (objet)
	* system
* nemo
* modo: frio o calor
* tpse (objetc): tpse sonda
    * rb
    * tipotrb
    * borna
* tpss (object): tpss valvula
    * rb
    * tipotrb
    * borna
* tpsestado (object): tpse valvula
    * rb
    * tipotrb
    * borna
*/
```

```php
@return int (0 ok 1 Error)
```

Cambia el th de la tp (sonda) correspondiente:

1. Escribe en la tabla th (de la sonda):  los argumentos necesarios para que cuando cambie el valor de la tp llame a la funcion correspondiente del soa enviandole los argumentos que tiene cosidos.  (modelo = 6)

   ```
   $argumentos = '{"cod_consigna":"'.$id_consigna;
   $argumentos.= '","cod_rango":"'.$id_rango;
   $argumentos.= '","trb_tpss":"'.$tpss_valvula->tipotrb;
   $argumentos.= '","rb_tpss":"'.$tpss_valvula->rb;
   $argumentos.= '","terminal_tpss":"'.$tpss_valvula->borna;
   $argumentos.= '","trb_tpse":"'.$tpse_valvula->tipotrb;
   $argumentos.= '","rb_tpse":"'.$tpse_valvula->rb;
   $argumentos.= '","terminal_tpse":"'.$tpse_valvula->borna;
   $argumentos.= '","id_climate":"'.$id_climate.'"}';
   ```




## 2. modifySecurityChain

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

Cose la funcionalidad de cadena seguridad en la tp correspondiente:

1. Cose en la tabla th :  los argumentos necesarios para que cuando cambie el valor de la tp llame a la funcion correspondiente del soa enviandole los argumentos que tiene cosidos. (modelo = 3)

   ```
   $arguments = '{"trb":"'.$type_trb.'","rb":"'.$rb_id;
   $arguments.= '","terminal":"'.$terminal.'"}';
   ```

   

## 3. modifyPulsador

```php
/*
* These parameters are necessary POST:
* data (objet)
	* system
* tpse_pulsador (objetc):
    * rb
    * tipotrb
    * borna
* tpss_bombilla (object):
    * rb
    * tipotrb
    * borna
* tpse_bombilla (object):
    * rb
    * tipotrb
    * borna
* tpss_valvulas (object):
    * rb
    * tipotrb
    * borna
* tpss_sondas (object):
    * rb
    * tipotrb
    * borna
*/
```

```php
@return int (0 ok 1 Error)
```

Cose la funcionalidad de pulsador en la tp correspondiente:

1. Cose en la tabla th (del pulsador):  los argumentos necesarios para que cuando cambie el valor de la tp llame a la funcion correspondiente del soa enviandole los argumentos que tiene cosidos. (modelo =7)

   ```
   // terminal_tpss bombilla suelo radiante (1 TP)
   // terminal_tpse estado suelo radiante (1 TP)
   // valves (valvula/s suelo radiante) (n TP)
   // probes (la sonda/s) (n TP)
   // el numero de valvulas = numero sondas (n TP)
   ```

   

   ```
   $argumentos = '{"trb_tpss":"'.$tpss_bombilla->tipotrb;
   $argumentos.= '","rb_tpss":"'.$tpss_bombilla->rb;
   $argumentos.= '","terminal_tpss":"'.$tpss_bombilla->borna;
   // tpse bombilla
   $argumentos.= '","trb_tpse":"'.$tpse_bombilla->tipotrb;
   $argumentos.= '","rb_tpse":"'.$tpse_bombilla->rb;
   $argumentos.= '","terminal_tpse":"'.$tpse_bombilla->borna.'",';
   // tpss valvula
   $argumentos.= '"valves":[';
   foreach ($tpss_valvulas as $key => $value) {
   $argumentos.= '{"trb": "'.$value->tipotrb;
   $argumentos.= '","rb": "'.$value->rb;
   $argumentos.= '","terminal": "'.$value->borna.'"},';
   }
   $argumentos = substr($argumentos , 0, -1);
   $argumentos.='],';
   // tpse sondas
   $argumentos.= '"probes":[';
   foreach ($tpse_sondas as $key => $value) {
   $argumentos.= '{"trb": "'.$value->tipotrb;
   $argumentos.= '","rb": "'.$value->rb;
   $argumentos.= '","terminal": "'.$value->borna.'"},';
   }
   $argumentos = substr($argumentos , 0, -1);
   $argumentos.=']}';
   ```

   ​		



# DOMO

## 1. modifyFloor

```php
/*
* These parameters are necessary POST:
* data (objet)
    * system
    * floor
    * ubication
    * nemo
    * sequence
    * scenes
    * ambients
    * routines
    * programming
*/
```

```php
@return int (0 ok 1 Error)
```

Modifica la planta elegida:

1. Escribe valores en la tabla "planta" donde id = floor



## 2. modifyGroup

```php
/*
* These parameters are necessary POST:
* data (objet)
    * system
    * nemo
    * floor
    * group
    * sequence
    * scenes
    * ambients
    * routines
    * programming
    * lounges (opcional para asignar estancias existentes al grupo a crear)
*/
```

```php
@return int (0 ok 1 Error)
```

Modifica el grupo seleccionado:

1. Escribe valores en la tabla "grupo" donde id = group
2. si lounges tiene valor:
   1. escribe en tabla "estancias"  en los ids seleccionados el codigo_grupo = group
   2. añade a los argumentos del th de socket (si es que tiene, el grupo al que pertenece "group":"x")



## 3. modifySubgroup

```php
/*
* These parameters are necessary POST:
* data (objet)
    * system
    * nemo
    * floor
    * group
    * subgroup
    * sequence
    * scenes
    * ambients
    * routines
    * programming
    * lounges (opcional para asignar estancias existentes al subgrupo a crear)
*/
```

```php
@return int (0 ok 1 Error)
```

Modifica el subgrupo seleccionado:

1. Escribe valores en la tabla "subgrupo" donde id = subgroup
2. si lounges tiene valor:
   1. escribe en tabla "estancias"  en los ids seleccionados el codigo_subgrupo
   2. añade a los argumentos del th de socket (si es que tiene, el subgrupo al que pertenece "subgroup":"x")

​	

## 4. modifyLounge

```php
/*
* These parameters are necessary POST:
* data (objet)
    * system
    * nemo
    * floor
    * group
    * subgroup
    * lounge
    * model
    * sequence
    * scenes
    * ambients
    * routines
    * general
    * programming
*/
```

```php
@return int (0 ok 1 Error)
```

Modifica la estancia seleccionada.

1. Escribe los valores en la tabla "estancia" donde id = lounge



## Zonas

### 1. modifyLightsZone

```php
/*
* These parameters are necessary POST:
* data (objet)
	* system
    * floor
    * lounge
    * zone
    * group (no es obligatorio)
    * subgroup (no es obligatorio)
    * nemo_zona
    * subtype
* tpse (objet)
    * rb
    * tipotrb
    * borna
* tpss (objet)
    * rb
    * tipotrb
    * borna
* tpdali (objet)
    * rb
    * tipotrb
    * borna
*/
```

```php
@return int (0 ok 1 Error)
```

Modifica una zona de tipo luces seleccionada:

1. Modifica caso en la tabla "luces" donde id = zone

2. Modifica caso en tabla "relacion_luces" con los valores de las tps seleccionadas donde codigo_luces = zone

3. Borra los valores de las tp anteriores : 

   1. escribe en cada tp en tdato domo un -1
   2. elimina th socket

4. Escribe en cada tp correspondiente en tdato domo un 0

5. Crea caso en th para el socket de las luces, con los argumentos que corresponda (en cada tp seleccionada)

   ```
   {"nemo" : "0", "location_id": "id_ubicacion", "floor": "id_planta", "group": "id_grupo", "room": "id_estancia", "zone": "id_zona" ,  "type": "valor tipo*","value": "valor tp"}
   
   valor tipo*: 0 -> status; 1-> intensidad; 2-> color; 3-> temperatura, 4-> mode; 5-> programacion; 6 -> hour_init; 7 -> hour_end;
   ```

6. Mira si la estancia a la que pertenece dicha zona tiene escena

   SI: Añade la zona a las escenas existentes

   NO: Cuando se necesite se creará una escena desde la pantalla

   ​         // Escenas a nivel de estancia



### 2. modifyClimateZone

```php
/*
* These parameters are necessary POST:
* data (objet)
	* system
    * floor
    * lounge
    * zone
    * group (no es obligatorio)
    * subgroup (no es obligatorio)
    * nemo_zona
    * subtype
* tpse (objet) (sonda obligatoria)
    * rb
    * tipotrb
    * borna
* tpss_valvula (objet)
    * rb
    * tipotrb
    * borna
* tpse_valvula (objet)
    * rb
    * tipotrb
	* borna	
* tpss_bombilla (objet)
    * rb
    * tipotrb
    * borna
* tpse_bombilla (objet)
    * rb
    * tipotrb
    * borna
*/
```

```php
@return int (0 ok 1 Error)
```

Modifica una zona de tipo clima seleccionada:

1. Escribe valores en la tabla "clima" donde id = zone

2. Modifica caso en tabla "relacion_clima" con los valores de las tps seleccionadas donde codigo_clima = zone

3. Borra los valores de las tp anteriores : 

   1. escribe en cada tp en tdato domo un -1
   2. elimina th socket

4. Escribe en cada tp correspondiente en tdato domo un 1

5. Crea caso en th para el socket del clima, con los argumentos que corresponda (en cada tp seleccionada, excepto en las valvulas que no tienen th_socket ni tdato domo)

   ```
   {"nemo" : "1", "location_id": "id_ubicacion", "floor": "id_planta", "group": "id_grupo", "room": "id_estancia", "zone": "id_zona" , "type": "valor tipo*", "value": "valor tp"}
   
   valor tipo*: 0 -> status; 1-> consigna; 2-> temp; 3 -> humedad; 4 -> co2 
   ```

### 3. modifyIotZone

```php
/*
* These parameters are necessary POST:
* data (objet)
	* system
    * floor
    * lounge
    * zone
    * group (no es obligatorio)
    * subgroup (no es obligatorio)
    * nemo_zona
    * subtype
* tpse (objet) 
    * rb
    * tipotrb
    * borna
* tpss (objet)
    * rb
    * tipotrb
    * borna
*/
```

```php
@return int (0 ok 1 Error)
```

Modifica una zona de tipo iot seleccionada:

1. Escribe valores caso en la tabla "iot" donde id = zone

2. Modifica caso en tabla "relacion_iot" con los valores de las tps seleccionadas donde codigo_iot = zone

3. Borra los valores de las tp anteriores : 

   1. escribe en cada tp en tdato domo un -1
   2. elimina th socket

4. Escribe en cada tp correspondiente en tdato domo un 2

5. Crea caso en th para el socket del iot, con los argumentos que corresponda (en cada tp seleccionada)

   ```
   {"nemo" : "2", "location_id": "id_ubicacion", "floor": "id_planta", "group": "id_grupo", "room": "id_estancia", "zone": "id_zona" , "type": "valor tipo*", "value": "valor tp"}
   
   valor tipo*: 0 -> enchufe; 1-> extractor
   ```

### 4. modifyBlindsZone

```php
/*
* These parameters are necessary POST:
* data (objet)
	* system
    * floor
    * lounge
    * zone
    * group (no es obligatorio)
    * subgroup (no es obligatorio)
    * nemo_zona
* tpse (objet) 
    * rb
    * tipotrb
    * borna
* tpss (objet)
    * rb
    * tipotrb
    * borna
*/
```

```php
@return int (0 ok 1 Error)
```

Modifica una zona de tipo estor seleccionada:

1. Escribe valores en la tabla "estor" donde id = zone

2. Modifica caso en tabla "relacion_estor" con los valores de las tps seleccionadas donde codigo_estor = zone

3. Borra los valores de las tp anteriores : 

   1. escribe en cada tp en tdato domo un -1
   2. elimina th socket

4. Escribe en cada tp correspondiente en tdato domo un 3

5. Crea caso en th para el socket del estor, con los argumentos que corresponda (en cada tp seleccionada)

   ```
   {"nemo" : "3", "location_id": "id_ubicacion", "floor": "id_planta", "group": "id_grupo", "room": "id_estancia", "zone": "id_zona" , "type": "valor tipo*", "value": "valor tp"}
   
   valor tipo*: 0 -> position; 1-> level
   ```

### 5. modifyLouversZone

```php
/*
* These parameters are necessary POST:
* data (objet)
	* system
    * floor
    * lounge
    * zone
    * group (no es obligatorio)
    * subgroup (no es obligatorio)
    * nemo_zona
* tpss (objet)
    * rb
    * tipotrb
    * borna
*/
```

```php
@return int (0 ok 1 Error)
```

Modifica una zona de tipo persianas seleccionada:

1. Escribe valores en la tabla "persianas" donde id = zone
2. Crea caso en tabla "relacion_persianas" con los valores de las tps seleccionadas donde codigo_persianas = zone.
3. Borra los valores de las tp anteriores : 
   1. escribe en cada tp en tdato domo un -1
4. Escribe en cada tp correspondiente en tdato domo un 4
5. NO TIENE TH SOCKET



### 6. modifyMultimediaZone

```php
/*
* These parameters are necessary POST:
* data (objet)
	* system
    * floor
    * lounge
    * zone
    * group (no es obligatorio)
    * subgroup (no es obligatorio)
    * nemo_zona
* tpse abrir (objet) 
    * rb
    * tipotrb
    * borna
* tpss abrir (objet)
    * rb
    * tipotrb
    * borna
* tpse cerrar (objet) 
    * rb
    * tipotrb
    * borna
* tpss cerrar (objet)
    * rb
    * tipotrb
    * borna
*/
```

```php
@return int (0 ok 1 Error)
```

Modifica una zona de tipo multimedia seleccionada:

1. Escribe valores en la tabla "multimedia" donde id = zone

2. Modifica caso en tabla "relacion_multimedia" con los valores de las tps seleccionadas donde codigo_multimedia = zone

3. Borra los valores de las tp anteriores : 

   1. escribe en cada tp en tdato domo un -1
   2. elimina th socket

4. Escribe en cada tp correspondiente en tdato domo un 6

5. Crea caso en th para el socket de multimedia, con los argumentos que corresponda (en cada tp seleccionada)

   ```
   {"nemo" : "6", "location_id": "id_ubicacion", "floor": "id_planta", "group": "id_grupo", "room": "id_estancia", "zone": "id_zona" , 
   "id1":"tpss_abrir->borna","id2":"codigo_tp_e_abrir,
   "id3":"codigo_tp_s_abrir,"trb":"$tpss_abrir->tipotrb",
   "type": "valor tipo*", "value": "valor tp"}
   
   valor tipo*: 0 -> proyector; 1-> tv
   ```



### 7. modifyAccessZone

```php
/*
* These parameters are necessary POST:
* data (objet)
	* system
    * subtype
    * subtype_2
* tpse abrir (objet) 
    * rb
    * tipotrb
    * borna
* tpss abrir (objet)
    * rb
    * tipotrb
    * borna
* tpse cerrar (objet) 
    * rb
    * tipotrb
    * borna
* tpss cerrar (objet)
    * rb
    * tipotrb
    * borna
*/
```

```php
@return int (0 ok 1 Error)
```

Crea una zona de tipo acceso

1. Crea caso en la tabla "ascesos"

2. Crea caso en tabla "relacion_accesos" con los valores de las tps seleccionadas

3. Escribe en cada tp correspondiente en tdato domo un 11

4. Crea caso en th para el socket del acceso, con los argumentos que corresponda (en cada tp seleccionada)

   ```
   {"nemo" : "11", "location_id": "id_ubicacion", "id1": "borna salida", "id2": "borna entrada abierto", "id3": "borna entrada cerrado", "type": "valor tipo*", "trb":"0"}
   valor tipo*: 0 -> door; 1-> gate; 2-> garage
   ```



### 8. modifyCurtainsZone

```php
/*
* These parameters are necessary POST:
* data (objet)
	* system
    * floor
    * lounge
    * zone
    * group (no es obligatorio)
    * subgroup (no es obligatorio)
    * nemo_zona
* tpse abrir (objet) 
    * rb
    * tipotrb
    * borna
* tpss abrir (objet)
    * rb
    * tipotrb
    * borna
* tpse cerrar (objet) 
    * rb
    * tipotrb
    * borna
* tpss cerrar (objet)
    * rb
    * tipotrb
    * borna
*/
```

```php
@return int (0 ok 1 Error)
```

Modifica una zona de tipo cortinas seleccionada:

1. Escribe valores en la tabla "cortinas" donde id = zone

2. Modifica caso en tabla "relacion_cortinas" con los valores de las tps seleccionadas donde codigo_cortinas = zone

3. Borra los valores de las tp anteriores : 

   1. escribe en cada tp en tdato domo un -1
   2. elimina th socket

4. Escribe en cada tp correspondiente en tdato domo un 12

5. Crea caso en th para el socket de cortinas, con los argumentos que corresponda (en cada tp seleccionada)

   ```
   {"nemo" : "12", "location_id": "id_ubicacion", "floor": "id_planta", "group": "id_grupo", "room": "id_estancia", "zone": "id_zona" , 
   "id1":"tpss_abrir->borna","id2":"codigo_tp_e_abrir,
   "id3":"codigo_tp_s_abrir,"trb":"$tpss_abrir->tipotrb",
   "type": "valor tipo*", "value": "valor tp"}
   ```

### 9. modifySecurityZone

```php
/*
* These parameters are necessary POST:
* data (objet)
	* system
	* zone
    * nemo_zona
* tpse_estado (objet) 
    * rb
    * tipotrb
    * borna
* tpss_valor (objet)
    * rb
    * tipotrb
    * borna
*/
```

```php
@return int (0 ok 1 Error)
```

Modifica una zona de tipo seguridad seleccionada

1. Escribe caso en la tabla "seguridad"

2. Modifica caso en tabla "relacion_seguridad" con los valores de las tps seleccionadas donde codigo_seguridad = zone

3. Escribe en cada tp correspondiente en tdato domo un 10

4. Crea caso en th para el socket de seguridad, con los argumentos que corresponda (en cada tp seleccionada)

   ```
   {"nemo" : "10", "location_id": "id_ubicacion", "id": "codigotp", "value": "valor tp"}
   ```



### 10. modifyPoolZone

```php
/*
* These parameters are necessary POST:
* data (objet)
    * system
    * floor
    * lounge
    * zone
    * group (no es obligatorio)
    * subgroup (no es obligatorio)
    * nemo_zona
* tpse_sugar (objet)
    * rb
    * tipotrb
    * borna
* tpse_depuracion (objet)
    * rb
    * tipotrb
    * borna
* tpse_abrir_cobertor (objet)
    * rb
    * tipotrb
    * borna
* tpse_cerrar_cobertor (objet)
    * rb
    * tipotrb
    * borna
* tpse_luz (objet)
    * rb
    * tipotrb
    * borna
* tpss_depuracion (objet)
    * rb
    * tipotrb
    * borna
* tpss_abrir_cobertor (objet)
    * rb
    * tipotrb
    * borna
* tpss_cerrar_cobertor (objet)
    * rb
    * tipotrb
    * borna
* tpss_luz (objet)
    * rb
    * tipotrb
    * borna
*/
```

```php
@return int (0 ok 1 Error)
```

Modifica una zona de tipo piscina seleccionada

1. Escribe valores en la tabla "piscina" donde id = zone

2. Modifica caso en tabla "relacion_piscina" con los valores de las tps seleccionadas donde codigo_piscina = zone

3. Borra los valores de las tp anteriores : 

   1. escribe en cada tp en tdato domo un -1
   2. elimina th socket

4. Escribe en cada tp correspondiente en tdato domo un 7

5. Crea caso en th para el socket de piscina, con los argumentos que corresponda (en cada tp seleccionada)

   ```
   {"nemo" : "7", "location_id": "id_ubicacion", "floor": "id_planta", "group": "id_grupo", "room": "id_estancia", "zone": "id_zona" ,  "type": "valor tipo*","value": "valor tp"}
   
   valor tipo*: 0 -> temperatura; 1-> estado_luz; 2-> redox; 3-> estado_cobertor; 4-> ph; 5-> estado depuracion
   ```

### 11. modifyConsumptionZone

```php
/*
* These parameters are necessary POST:
* data (objet)
	* system
	* zone
    * subtype
    * subtype_2
    * nemo_zona
* tpse (objet)
    * rb
    * tipotrb
    * borna
*/
```

```php
@return int (0 ok 1 Error)
```

Modifica una zona de tipo consumos seleccionada

1. Escribe valores en la tabla "relacion_consumos" con los valores de las tps seleccionadas donde id = zone



### 12. modifyPumpsZone

```php
/*
* These parameters are necessary POST:
* data (objet)
	* system
    * floor
    * lounge
    * zone
    * group (no es obligatorio)
    * subgroup (no es obligatorio)
    * nemo_zona
* tpse (objet) 
    * rb
    * tipotrb
    * borna
* tpss (objet)
    * rb
    * tipotrb
    * borna
*/
```

```php
@return int (0 ok 1 Error)
```

Modifica una zona de tipo bombas seleccionada

1. Escribe valores en la tabla "bombas" donde id = zone.

2. Modifica caso en tabla "relacion_bombas" con los valores de las tps seleccionadas donde codigo_bombas = zone

3. Borra los valores de las tp anteriores : 

   1. escribe en cada tp en tdato domo un -1
   2. elimina th socket

4. Escribe en cada tp correspondiente en tdato domo un 5

5. Crea caso en th para el socket del bombas, con los argumentos que corresponda (en cada tp seleccionada)

   ```
   {"nemo" : "5", "location_id": "id_ubicacion", "floor": "id_planta", "group": "id_grupo", "room": "id_estancia", "zone": "id_zona" , "type": "valor tipo*","value": "valor tp"}
   
   valor tipo*: 0 -> status; 1-> mode; 2-> programacion;3 -> hour_init;4 -> hour_end;
   ```

### 13. modifyFancoilZone

```php
/*
* These parameters are necessary POST:
* data (objet)
	* system
    * floor
    * lounge
    * zone
    * group (no es obligatorio)
    * subbgroup (no es obligatorio)
    * nemo_zona
 * tpse (objet)
    * rb
    * tipotrb
    * borna
 * tpss_fancoil (objet)
    * rb
    * tipotrb
    * borna  
 * tpss_vel1 (objet)
    * rb
    * tipotrb
    * borna
 * tpss_vel2 (objet)
    * rb
    * tipotrb
    * borna
 * tpss_vel3 (objet)
    * rb
    * tipotrb
    * borna
 * tpse_fancoil (objet)
    * rb
    * tipotrb
    * borna
 * tpse_vel1 (objet)
    * rb
    * tipotrb
    * borna
 * tpse_vel2 (objet)
    * rb
    * tipotrb
    * borna
 * tpse_vel3 (objet)
    * rb
    * tipotrb
    * borna
*/
```

```php
@return int (0 ok 1 Error)
```

Modifica una zona de tipo fancoil seleccionada

1. Escribe valores en la tabla "fancoil" donde id = zone

2. Modifica caso en tabla "relacion_fancoil" con los valores de las tps seleccionadas donde codigo_fancoil = zone

3. Borra los valores de las tp anteriores : 

   1. escribe en cada tp en tdato domo un -1
   2. elimina th socket

4. Escribe en cada tp correspondiente en tdato domo un 8

5. Crea caso en th para el socket del fancoil, con los argumentos que corresponda (en cada tp seleccionada, excepto en las valvulas que no tienen th_socket ni tdato domo)

   ```
   {"nemo" : "8", "location_id": "id_ubicacion", "floor": "id_planta", "group": "id_grupo", "room": "id_estancia", "zone": "id_zona" ,  "type": "valor tipo*","value": "valor tp"}
   
   valor tipo*: 0 -> status; 1-> consigna; 2-> temp; 3 -> speed; 4 -> sleep
   ```



### 14. modifyCompartidas

```php
/*
* These parameters are necessary POST:
* data (objet)
    * type (0-> luces, 1-> clima, ...)
    * id (id tabla relacion_x_compartidas)
    * status
    * intensity
    * rgb
    * temperature
*/
```

```php
@return int (0 ok 1 Error)
```

Modifica propiedades compartidas para el tipo de zona seleccionada

1. Si es de tipo luces: Modifica caso en tabla relacion_luces_compartidas donde id = id




### 15. modifyScene

```php
/*
* These parameters are necessary POST:
* data (objet)
    * system
    * type (0-> luces, 1-> clima,...)
    * level (1-> floor, 2-> group, 3-> lounge, 4-> subgroup)
    * floor
    * group
    * subgroup
    * lounge
    * scene (id de la tabla escena)
    * scenes (object)
    	* check (para saber si esta pulsada o no la zona)
    	* nemo
        * id (id zona)
        * si es de tipo luces ( status, color, intensity, temperature)
*/
```

```php
@return int (0 ok 1 Error)
```

Modifica una escena del tipo y nivel seleccionada

1. Escribe valores en tabla "escena" donde id = scene
2. Borra las relaciones pertenecientes a la escena seleccionada
3. Segun el tipo (type) :
   1. Crea caso en tabla "operacion" con tipodomo = type,
   2. Crea caso en la tabla "operacion_luces", "operacion_clima,",...
   3. Crea caso en tabla "relacion_escena_operacion".



### 16. modifyAmbient

```ph
/*
* These parameters are necessary POST:
* data
    * scope (0 home 1 floor 2 grupo 3 estancia 4 subgrupo)
    * id intenger (ubicacion,floor,group,subgroup, lounge)
    * nemo
    * ambient (id del ambiente)
    * (object) array
    * lights: [{id (zona), color, intensity, status}]
    * light_scenes: [{id (escena)}]
    * climate:[{id (zona), status, value}]
    * climate_scenes: [{id (escena)}]
    * blinds: [{id (zona), position, level}]
    * blinds_scenes: [{id (escena)}]
    * louvers: [{id (zona), position, dim}]
    * louvers_scenes: [{id (escena)}]
    * iot: [{id (zona), status}]
    * iot_scenes: [{id (escena)}]
    * pumps: [{id (zona), status}]
    * pumps_scenes: [{id (escena)}]
    * fancoil: [{id (zona), status}]
    * fancoil_scenes: [{id (escena)}]
*/
```

```php
@return int (id del ambiente)
```

Modifica un ambiente:

1. Escribe valores en tabla "ambiente",  donde id = ambient
2. Elimina las relaciones pertenencientes al ambiente seleccionado
3. Crea las operaciones (si fuese necesario) y la relacion_ambiente_operacion en donde corresponda segun si tiene valor en lights, lights_scenes,... fancoil_scenes (tablas "operacion_luces", "operacion_clima",...)



### 17. activateAmbient

```php
/*
* These parameters are necessary POST:
* system
* level (1 -> por planta, 2-> por grupo, 3-> por estancia, 4-> por subgrupos )
* floor
* group
* subgroup
* lounge
* ambient
*/
```

Activa un ambiente:

1. Pone todos los ambientes de la planta, grupo, subgrupo o estancia a 0 segun el nivel elegido

2. Pone el ambiente seleccionado a 1 

   

### 18. modifyRoutine

```php
/* These parameters are necessary POST:
* data (objet)
    * scope intenger (0 home 1 floor 2 grupo 3 estancia 4 subgrupo)
    * id intenger (ubicacion,floor,group,subgroup, lounge)
    * nemo
    * routine (id de la rutina)
    * notifications: 0-> off, 1-> on
    * init_date: fecha inicio
    * end_date: fecha fin
    * init_hour: hora inicio
    * end_hour: hora fin
    * init_type: 0 fija 1 amanecer 2 atardecer
    * end_type: 0 fija 1 amanecer 2 atardecer
    * init_offset: hora inicio
    * end_offset: hora fin
    * type  1 task 2 programming
    * schedule: [1,2,3]
    * (object) array
    * lights: [{id (zona), color, intensity, status}]
    * lights_scenes: [{id (escena)}]
    * climate:[{id (zona), status, thermostate}]
    * climate_scenes: [{id (escena)}]
    * blinds: [{id (zona), position, level}]
    * blinds_scenes: [{id (escena)}]
    * louvers: [{id (zona), position, dim}]
    * louvers_scenes: [{id (escena)}]
    * iot: [{id (zona), status}]
    * iot_scenes: [{id (escena)}]
    * pumps: [{id (zona), status}]
    * pumps_scenes: [{id (escena)}]
    * fancoil: [{id (zona), status, value}]
    * fancoil_scenes: [{id (escena)}]

* RESPUESTA
* id de la rutina modificada
*/
```

```php
@return int (id de la rutina)
```

Modifica una rutina:

1. Escribe valores en tabla "ambiente",  donde id = routine
2. Escribe valores en tabla "task" en el caso correspondiente a la rutina elegida
3. Borra las relaciones de (relacion_ambiente_operacion y relacion_ambiente_escena) existentes para la rutina seleccionada
4. Crea las operaciones (si fuese necesario) y la relacion_ambiente_operacion en donde corresponda segun si tiene valor en lights, lights_scenes,... fancoil_scenes (tablas "operacion_luces", "operacion_clima",...)



### 19.  changeStatusRoutines

```php
/*
* These parameters are necessary POST:
* data
    * system
    * routine
    * scope
    * status
*/
```

```
@return int (0 ok 1 Error)
```

Cambia el estado de la rutina seleccionada

1. Escribe en tabla "ambiente" en tdato estado el valor de status donde id = routine



### 20. modifyDistributionPanel

```php
/*
* These parameters are necessary POST:
* data (objet)
    * system
    * panel (id cuadro)
    * type (0 -> general, 1-> por planta, 2-> por grupo, 3-> por estancia, 4 -> por subgrupo )
    * nemo_panel
    * row
    * column
*/
```

```php
@return int (0 ok 1 Error)
```

Modifica un cuadro electrico:

1. Escribe  valores en tabla "cuadro"  donde id = panel.



### 21. modifyAutomatics

```php
/*
* These parameters are necessary POST:
* data (objet)
    * system
    * panel (id cuadro)
    * automatic (id automatico)
    * type
    * type_panel
    * num_row
    * nemo_automatic  (no es obligatorio)
    * nemo_row
    * description (no es obligatorio)
* tpse (objet)
    * rb
    * tipotrb
    * borna
* tpss (objet)
    * rb
    * tipotrb
    * borna
*/
```

```php
@return int (0 ok 1 Error)
```

Modifica un automatico:

1. Modifica caso en tabla "automaticos"  donde id = automatic



### 22. modifyAtHome

```php
/*
* These parameters are necessary POST:
* data (objet)
    * system
    * athome (id tabla)
    * nemo
    * status
*/
```

```php
@return int (0 ok 1 Error)
```

Modifica un athome:

1. Escribe valores en tabla "athome" donde id = athome



### 23. modifyModo

```php
/*
* These parameters are necessary POST:
* data (objet)
    * system
    * athome (id tabla at_home)
    * modo (id tabla modo)
    * nemo
    * status
*/
```



```php
@return int (0 ok 1 Error)
```

Modifica un modo:

1. Escribe valores en tabla "modo" donde id = modo



### 24. modifyProgram

```php
/*
* These parameters are necessary POST:
* data (objet)
    * system
    * nemo
    * program (id programa)
    * modo (id modo)
    * ambient (id ambiente)
*/
```

```php
@return int (0 ok 1 Error)
```

Modifica un programa:

1. Escribe valores en tabla "programa" donde id = program



