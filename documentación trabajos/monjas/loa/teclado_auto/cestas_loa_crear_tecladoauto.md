# Cestas Loa (/Tecladoauto/Crear)



El boton de Tecladoauto se utiliza para programar las señales y la domotica de un sistema 'x'



# COMANDO

## 1. createCommand

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
         *     serie2:comando, puerto, velocidad,,
         *     conv: comando, puerto, ip,
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
         * 	   X100_conv_placa: ip, puerto	
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

Crea las estructuras para el comando de un cacharro determinado (raspberry, ibercomp, sugarvalley,...)

1. Crea caso en tabla "comando"
2. Crea caso en tabla "rb" (en algunos casos) 
3. Crear tabla tp con tdato domo (en algunos casos). Se creará una tabla tp para entradas y/o otra para salidas, dependiendo del comando si tiene solo entradas, solo salidas o ambos tipos.
4. Crea tabla th.
5. Crea trigger para la tp si esta tiene domo (en algunos casos)
6. Crea n casos en tabla "tpse" para el nº bornas de entradas si el comando tiene entradas
7. Crea n casos en tabla "tpss" para el nº bornas de salidas si el comando tiene salidas



**Se llamara al modelo que corresponda segun el tipo de comando



# TRB

## 1. createTrbIbercomp

```php
/*
* These parameters are necessary POST:
* data (objet)
	* tipo:
        * 8EDserie, 8EAserie, 8EDeth, 8EAeth, Ibemeter, 8EDserie_conv,
        * 4ED4SDeth, 4ED4SDserie_conv, Sonda, 8ED_modbus
    * nemo
    * tiempotp
    * bornas
    * estado
    * system
*/
```

```php
@return int (0 ok 1 Error)
```

Crea un trb de tipo ibercomp :

1. Crea caso en tabla "rb" (id = codigo_rb)
2. Crea caso en "relacion_rb" (id = codigo_relacion_rb)
3. Escribe en tabla "tpse" el codigo_rb y codigo_relacion_rb en las bornas correspondientes (elegidas)
4. Crea caso en tabla "iniciarhilostrb"
5. Crea casp en la tabla tp correspondiente

**Se llamara al modelo que corresponda segun el tipo de trb



## 2. createTrbSugarValley

```php
/*
* These parameters are necessary POST:
	* data (objet)
    	* tipo: Serie, Serie2, Conv
        * nemo
        * tiempotp
        * bornas
        * system
*/
```

```php
@return int (0 ok 1 Error)
```

Crea un trb de tipo sugarvalley :

1. Crea caso en tabla "rb" (id = codigo_rb)
2. Crea caso en "relacion_rb" (id = codigo_relacion_rb)
3. Escribe en tabla "tpse" el codigo_rb y codigo_relacion_rb en las bornas correspondientes (elegidas)
4. Crea caso en tabla "iniciarhilostrb"
5. Crea casp en la tabla tp correspondiente

**Se llamara al modelo que corresponda segun el tipo de trb



## 3. createTrbZenner

```php
/*
* These parameters are necessary POST:
	* data (objet)
    	* tipo:
            * Energy Serial: (antiguo energia)
            * Water Serial: (nuevo agua)
            * Energy Eth: (antiguo energia)
            * Water Eth: (nuevo agua)
         * nemo
         * tiempo
         * bornas
         * system            
*/
```

```php
@return int (0 ok 1 Error)
```

Crea un trb de tipo zenner :

1. Crea caso en tabla "rb" (id = codigo_rb)
2. Crea caso en "relacion_rb" (id = codigo_relacion_rb)
3. Escribe en tabla "tpse" el codigo_rb y codigo_relacion_rb en las bornas correspondientes (elegidas)
4. Crea caso en tabla "iniciarhilostrb"
5. Crea casp en la tabla tp correspondiente

**Se llamara al modelo que corresponda segun el tipo de trb



## 4. createTrbRaspberry

```php
/*
* These parameters are necessary POST:
	* data (objet)
    	* tipo:
            * ed: (entradas digitales)
            * ea: (entradas analogicas)
            * ds18b20: (sonda temperatura)
            * sht31: (sonda temperatura y humedad)
            * co2: (sond temperatura, humedad y co2)
            * pulsos: contador de pulsos
            * dali: 
            * pulsador:
            * vel-viento: (velocidad del viento)
            * dir_viento: (direccion del viento)
         * nemo
         * tiempotp
         * bornas
         * system
            
*/
```

```php
@return int (0 ok 1 Error)
```

Crea un trb de tipo raspberry :

1. Crea caso en tabla "rb" (id = codigo_rb)
2. Crea caso en "relacion_rb" (id = codigo_relacion_rb)
3. Escribe en tabla "tpse" el codigo_rb y codigo_relacion_rb en las bornas correspondientes (elegidas)
4. Crea caso en tabla "iniciarhilostrb"
5. Crea casp en la tabla tp correspondiente

**Se llamara al modelo que corresponda segun el tipo de trb



## 5. createTrbSmartTrail

```php
/*
* These parameters are necessary POST:
* data (objet)
    * tipo: 
    	*  X100, X835, X100_conv_placa
    * nemo
    * tiempotp
    * bornas
    * system
*/
```

```php
@return int (0 ok 1 Error)
```

Crea un trb de tipo smarttrail (contador de energia):

1. Crea caso en tabla "rb" (id = codigo_rb)
2. Crea caso en "relacion_rb" (id = codigo_relacion_rb)
3. Escribe en tabla "tpse" el codigo_rb y codigo_relacion_rb en las bornas correspondientes (elegidas)
4. Crea caso en tabla "iniciarhilostrb"
5. Crea casp en la tabla tp correspondiente

**Se llamara al modelo que corresponda segun el tipo de trb



## 6. createTrbAnalizador

## 7.createTrbReadWatt

## 8. createTrbDatasolMet (metereologica)

## 9. createTrbSungrow (solar)

## 10. createTrbAerotermia

## 11. createTrbDeshumectadora

## 12. createTrbMd02 (sonda temp y humedad)

## 13. createTrbAbbB21 (contador de luz)

```php
/*
* These parameters are necessary POST:
* data (objet)
    * nemo
    * tiempotp
    * bornas
    * system
*/
```

```php
@return int (0 ok 1 Error)
```

Crea un trb del tipo que corresponda :

1. Crea caso en tabla "rb" (id = codigo_rb)
2. Crea caso en "relacion_rb" (id = codigo_relacion_rb)
3. Escribe en tabla "tpse" el codigo_rb y codigo_relacion_rb en las bornas correspondientes (elegidas)
4. Crea caso en tabla "iniciarhilostrb"
5. Crea casp en la tabla tp correspondiente

NOTA:

** En el analizador ,para programarlo hay que pedir las bornas:

​      0-58 inclusive cada 60 seg

​      459-478 inclusive cada 60 seg



## 14. createTrbMitsubishi

```php
/*
* These parameters are necessary POST:
* data (objet)
    * tipo: 
    	* melco, intesis
    * nemo
    * tiempotp
    * bornas
    * system
*/
```

```php
@return int (0 ok 1 Error)
```

Crea un trb de tipo siber (recuperador de calor):

1. Crea caso en tabla "rb" (id = codigo_rb)
2. Crea caso en "relacion_rb" (id = codigo_relacion_rb)
3. Escribe en tabla "tpse" el codigo_rb y codigo_relacion_rb en las bornas correspondientes (elegidas)
4. Crea caso en tabla "iniciarhilostrb"
5. Crea casp en la tabla tp correspondiente

**Se llamara al modelo que corresponda segun el tipo de trb



## 15. createTrbSiber

```php
/*
* These parameters are necessary POST:
* data (objet)
    * tipo: 
    	* Df, Rf
    * nemo
    * tiempotp
    * bornas
    * system
*/
```

```php
@return int (0 ok 1 Error)
```

Crea un trb de tipo siber (recuperador de calor):

1. Crea caso en tabla "rb" (id = codigo_rb)
2. Crea caso en "relacion_rb" (id = codigo_relacion_rb)
3. Escribe en tabla "tpse" el codigo_rb y codigo_relacion_rb en las bornas correspondientes (elegidas)
4. Crea caso en tabla "iniciarhilostrb"
5. Crea casp en la tabla tp correspondiente

**Se llamara al modelo que corresponda segun el tipo de trb



## 16. createTrbSomfy

```php
/*
* These parameters are necessary POST:
* data (objet)
    * tipo: 
    	* Rts (persianas)
        * 50 (estores)
    * nemo
    * tiempotp
    * bornas
    * system
*/
```

```php
@return int (0 ok 1 Error)
```

Crea un trb de tipo somfy (persianas o estores):

1. Crea caso en tabla "rb" (id = codigo_rb)
2. Crea caso en "relacion_rb" (id = codigo_relacion_rb)
3. Escribe en tabla "tpse" el codigo_rb y codigo_relacion_rb en las bornas correspondientes (elegidas)
4. Crea caso en tabla "iniciarhilostrb"
5. Crea casp en la tabla tp correspondiente

**Se llamara al modelo que corresponda segun el tipo de trb



# TCAMPOS

## 1. createTPsEntrada

```php
/*
* These parameters are necessary POST:
	* data (objet)
        * f1
        * f2
        * f3
        * nemo
        * borna
        * tipoborna
        * system
    * tps (objet)
        * general
        * anio
        * mes
        * dia
        * hora
*/
```

```php
@return int (0 ok 1 Error)
```

Crea una tpse (tp entrada):

1. Escribe en tabla "tpse" los valores correspondientes (f1, f2, f3, nemo, tipoborna) para la borna elegida.
2. Crea caso en la tabla th si se ha elegido alguna funcionalidad (contador, maximo, minimo, media).



## 2. createTPsSalida

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

Crea una tpss (tp salida):

** si la salida es somfy rts (persianas) o tipo dali: 

crea tabla tp, th y trigger si no existe, y caso con las bornas en tabla "tpss"



1. Escribe en tabla "tpss" los valores correspondientes (f1, f2, f3, nemo, tipoborna, seudoborna) para la borna elegida.

2. Si la salida es temporizada, crea caso en la tabla "variables" con el valor del tiempo correpondiente

3. Crea caso en tabla "iniciarhilostrb".

   

## 3. createTPcm

```php
/*
  * These parameters are necessary POST:
  * data (objet)
     * f1
     * f2
     * f3
     * nemo
     * tipo
  * tps array (objetc): (tpse, tpss y/o medidor)
     * rb
     * tipotrb
     * borna
     * operation
  */
```

```php
@return int (0 ok 1 Error)
```

Crea una tpcm (tp multiple):

1. Escribe en tabla "tpcm" los valores correspondientes (f1, f2, f3, nemo) .
2. Crea caso en tabla "relacion_tpcm".



# TH

## 1. createConsigna

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

Cose en el th de la tp (sonda) correspondiente la funcionalidad de consigna:

1. Coge el valor de la tabla "variables" para el modo del clima (id_climate)

2. Crea caso en la tabla "variables" para la "consigna_"+nemo

3. Crea caso en la tabla "variables" para el "rango_"+nemo.

4. Cose en la tabla th (de la sonda):  los argumentos necesarios para que cuando cambie el valor de la tp llame a la funcion correspondiente del soa enviandole los argumentos que tiene cosidos.  (modelo = 6)

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



## 2. createSecurityChain

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

   

## 3. createPulsador

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

## 1. createFloor

```php
/*
* These parameters are necessary POST:
* data (objet)
    * system
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

Crea una planta para la ubicacion dada:

1. Crea caso en la tabla "planta"



## 2. createGroup

```php
/*
* These parameters are necessary POST:
* data (objet)
    * system
    * nemo
    * floor
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

Crea un grupo en la planta seleccionada:

1. Crea caso en la tabla "grupo"
2. si lounges tiene valor:
   1. escribe en tabla "estancias"  en los ids seleccionados el codigo_grupo
   2. añade a los argumentos del th de socket (si es que tiene, el grupo al que pertenece "group":"x")



## 3. createSubgroup

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
    * lounges (opcional para asignar estancias existentes al subgrupo a crear)
*/
```

```php
@return int (0 ok 1 Error)
```

Crea un subgrupo en el grupo seleccionado:

1. Crea caso en la tabla "subgrupo"
2. si lounges tiene valor:
   1. escribe en tabla "estancias"  en los ids seleccionados el codigo_subgrupo
   2. añade a los argumentos del th de socket (si es que tiene, el subgrupo al que pertenece "subgroup":"x")

​	

## 4. createLounge

```php
/*
* These parameters are necessary POST:
* data (objet)
    * system
    * nemo
    * floor
    * group
    * subgroup
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

Crea una estancia en la planta, grupo o subgrupo, segun corresponda.

1. Crea caso en la tabla "estancia"



## Zonas

### 1. createLightsZone

```php
/*
* These parameters are necessary POST:
* data (objet)
	* system
    * floor
    * lounge
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

Crea una zona de tipo luces en la estancia que corresponda

1. Crea caso en la tabla "luces"

2. Crea caso en tabla "relacion_luces" con los valores de las tps seleccionadas

3. Escribe en cada tp correspondiente en tdato domo un 0

4. Crea caso en th para el socket de las luces, con los argumentos que corresponda (en cada tp seleccionada)

   ```
   {"nemo" : "0", "location_id": "id_ubicacion", "floor": "id_planta", "group": "id_grupo", "room": "id_estancia", "zone": "id_zona" ,  "type": "valor tipo*","value": "valor tp"}
   
   valor tipo*: 0 -> status; 1-> intensidad; 2-> color; 3-> temperatura, 4-> mode; 5-> programacion; 6 -> hour_init; 7 -> hour_end;
   ```

5. Mira si la estancia a la que pertenece dicha zona tiene escena

   SI: Añade la zona a las escenas existentes

   NO: Cuando se necesite se creará una escena desde la pantalla

   ​         // Escenas a nivel de estancia

## 

### 2. createClimateZone

```php
/*
* These parameters are necessary POST:
* data (objet)
	* system
    * floor
    * lounge
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

Crea una zona de tipo clima en la estancia que corresponda

1. Crea caso en la tabla "clima"

2. Crea caso en tabla "relacion_clima" con los valores de las tps seleccionadas

3. Escribe en cada tp correspondiente en tdato domo un 1

4. Crea caso en th para el socket del clima, con los argumentos que corresponda (en cada tp seleccionada, excepto en las valvulas que no tienen th_socket ni tdato domo)

   ```
   {"nemo" : "1", "location_id": "id_ubicacion", "floor": "id_planta", "group": "id_grupo", "room": "id_estancia", "zone": "id_zona" , "type": "valor tipo*", "value": "valor tp"}
   
   valor tipo*: 0 -> status; 1-> consigna; 2-> temp; 3 -> humedad; 4 -> co2 
   ```

### 3. createIotZone

```php
/*
* These parameters are necessary POST:
* data (objet)
	* system
    * floor
    * lounge
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

Crea una zona de tipo iot en la estancia que corresponda

1. Crea caso en la tabla "iot"

2. Crea caso en tabla "relacion_iot" con los valores de las tps seleccionadas

3. Escribe en cada tp correspondiente en tdato domo un 2

4. Crea caso en th para el socket del iot, con los argumentos que corresponda (en cada tp seleccionada)

   ```
   {"nemo" : "2", "location_id": "id_ubicacion", "floor": "id_planta", "group": "id_grupo", "room": "id_estancia", "zone": "id_zona" , "type": "valor tipo*", "value": "valor tp"}
   
   valor tipo*: 0 -> enchufe; 1-> extractor
   ```

### 4. createBlindsZone

```php
/*
* These parameters are necessary POST:
* data (objet)
	* system
    * floor
    * lounge
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

Crea una zona de tipo estor en la estancia que corresponda

1. Crea caso en la tabla "estor"

2. Crea caso en tabla "relacion_estor" con los valores de las tps seleccionadas

3. Escribe en cada tp correspondiente en tdato domo un 3

4. Crea caso en th para el socket del estor, con los argumentos que corresponda (en cada tp seleccionada)

   ```
   {"nemo" : "3", "location_id": "id_ubicacion", "floor": "id_planta", "group": "id_grupo", "room": "id_estancia", "zone": "id_zona" , "type": "valor tipo*", "value": "valor tp"}
   
   valor tipo*: 0 -> position; 1-> level
   ```

### 5. createLouversZone

```php
/*
* These parameters are necessary POST:
* data (objet)
	* system
    * floor
    * lounge
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

Crea una zona de tipo persianas en la estancia que corresponda

1. Crea caso en la tabla "persianas"
2. Crea caso en tabla "relacion_persianas" con los valores de las tps seleccionadas
3. Escribe en cada tp correspondiente en tdato domo un 4
4. NO TIENE TH SOCKET



### 6. createMultimediaZone

```php
/*
* These parameters are necessary POST:
* data (objet)
	* system
    * floor
    * lounge
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

Crea una zona de tipo multimedia en la estancia que corresponda

1. Crea caso en la tabla "multimedia"

2. Crea caso en tabla "relacion_multimedia" con los valores de las tps seleccionadas

3. Escribe en cada tp correspondiente en tdato domo un 6

4. Crea caso en th para el socket de multimedia, con los argumentos que corresponda (en cada tp seleccionada)

   ```
   {"nemo" : "6", "location_id": "id_ubicacion", "floor": "id_planta", "group": "id_grupo", "room": "id_estancia", "zone": "id_zona" , 
   "id1":"tpss_abrir->borna","id2":"codigo_tp_e_abrir,
   "id3":"codigo_tp_s_abrir,"trb":"$tpss_abrir->tipotrb",
   "type": "valor tipo*", "value": "valor tp"}
   
   valor tipo*: 0 -> proyector; 1-> tv
   ```



### 7. createAccessZone

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



### 8. createCurtainsZone

```php
/*
* These parameters are necessary POST:
* data (objet)
	* system
    * floor
    * lounge
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

Crea una zona de tipo cortinas en la estancia que corresponda

1. Crea caso en la tabla "cortinas"

2. Crea caso en tabla "relacion_cortinas" con los valores de las tps seleccionadas

3. Escribe en cada tp correspondiente en tdato domo un 12

4. Crea caso en th para el socket de cortinas, con los argumentos que corresponda (en cada tp seleccionada)

   ```
   {"nemo" : "12", "location_id": "id_ubicacion", "floor": "id_planta", "group": "id_grupo", "room": "id_estancia", "zone": "id_zona" , 
   "id1":"tpss_abrir->borna","id2":"codigo_tp_e_abrir,
   "id3":"codigo_tp_s_abrir,"trb":"$tpss_abrir->tipotrb",
   "type": "valor tipo*", "value": "valor tp"}
   ```

### 9. createSecurityZone

```php
/*
* These parameters are necessary POST:
* data (objet)
	* system
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

Crea una zona de tipo seguridad en la estancia que corresponda

1. Crea caso en la tabla "seguridad"

2. Crea caso en tabla "relacion_seguridad" con los valores de las tps seleccionadas

3. Escribe en cada tp correspondiente en tdato domo un 10

4. Crea caso en th para el socket de seguridad, con los argumentos que corresponda (en cada tp seleccionada)

   ```
   {"nemo" : "10", "location_id": "id_ubicacion", "id": "codigotp", "value": "valor tp"}
   ```



### 10. createPoolZone

```php
/*
* These parameters are necessary POST:
* data (objet)
    * system
    * floor
    * lounge
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

Crea una zona de tipo piscina en la estancia que corresponda

1. Crea caso en la tabla "piscina"

2. Crea caso en tabla "relacion_piscina" con los valores de las tps seleccionadas

3. Escribe en cada tp correspondiente en tdato domo un 7

4. Crea caso en th para el socket de piscina, con los argumentos que corresponda (en cada tp seleccionada)

   ```
   {"nemo" : "7", "location_id": "id_ubicacion", "floor": "id_planta", "group": "id_grupo", "room": "id_estancia", "zone": "id_zona" ,  "type": "valor tipo*","value": "valor tp"}
   
   valor tipo*: 0 -> temperatura; 1-> estado_luz; 2-> redox; 3-> estado_cobertor; 4-> ph; 5-> estado depuracion
   ```

### 11. createConsumptionZone

```php
/*
* These parameters are necessary POST:
* data (objet)
	* system
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

Crea una zona de tipo consumos

1. Crea caso en la tabla "relacion_consumos" con los valores de las tps seleccionadas



### 12. createPumpsZone

```php
/*
* These parameters are necessary POST:
* data (objet)
	* system
    * floor
    * lounge
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

Crea una zona de tipo bombas en la estancia que corresponda

1. Crea caso en la tabla "bombas"

2. Crea caso en tabla "relacion_bombas" con los valores de las tps seleccionadas

3. Escribe en cada tp correspondiente en tdato domo un 5

4. Crea caso en th para el socket del bombas, con los argumentos que corresponda (en cada tp seleccionada)

   ```
   {"nemo" : "5", "location_id": "id_ubicacion", "floor": "id_planta", "group": "id_grupo", "room": "id_estancia", "zone": "id_zona" , "type": "valor tipo*","value": "valor tp"}
   
   valor tipo*: 0 -> status; 1-> mode; 2-> programacion;3 -> hour_init;4 -> hour_end;
   ```

### 13. createFancoilZone

```php
/*
* These parameters are necessary POST:
* data (objet)
	* system
    * floor
    * lounge
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

Crea una zona de tipo fancoil en la estancia que corresponda

1. Crea caso en la tabla "fancoil"

2. Crea caso en tabla "relacion_fancoil" con los valores de las tps seleccionadas

3. Escribe en cada tp correspondiente en tdato domo un 8

4. Crea caso en th para el socket del fancoil, con los argumentos que corresponda (en cada tp seleccionada, excepto en las valvulas que no tienen th_socket ni tdato domo)

   ```
   {"nemo" : "8", "location_id": "id_ubicacion", "floor": "id_planta", "group": "id_grupo", "room": "id_estancia", "zone": "id_zona" ,  "type": "valor tipo*","value": "valor tp"}
   
   valor tipo*: 0 -> status; 1-> consigna; 2-> temp; 3 -> speed; 4 -> sleep
   ```



### 14. createCompartidas

```php
/*
* These parameters are necessary POST:
* data (objet)
    * system
    * status
    * intensity
    * rgb
    * temperature
    * type (0-> luces, 1-> clima, ...)
    * id1 (codigo_zona 1)
    * id2 (codigo_zona 2)
*/
```

```php
@return int (0 ok 1 Error)
```

Crea propiedades compartidas para el tipo de zona correspondiente

1. Si es de tipo luces: Crea caso en tabla relacion_luces_compartidas




### 15. createScene

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
    * scenes (object)
    	* value
    	* nemo    	
*/
```

```php
@return int (0 ok 1 Error)
```

Crea una escena del tipo y nivel correspondiente

1. Crea caso en tabla "escena", escribiendo en tdato (codigo_planta, codigo_grupo; codigo_estancia o codigo_subgrupo) segun el valor de level
2. Segun el tipo (type) :
   1. Crea caso en tabla "operacion" con tipodomo = type,
   2. Crea caso en la tabla "operacion_luces", "operacion_clima,",...
   3. Crea caso en tabla "relacion_escena_operacion".



### 16. createAmbient

```php
/*
* These parameters are necessary POST:
* data (objet)
    * scope (0 home 1 floor 2 grupo 3 estancia 4 subgrupo)
    * id intenger (ubicacion,floor,group,subgroup, lounge)
    * nemo
    * lights: [{id (zona), color, intensity, status}]
    * lights_scenes: [{id (escena)}]
    * climate:[{id (zona), status, value}]
    * climate_scenes: [{id (escena)}]
    * blinds: [{id (zona), level}]
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

Crea un ambiente:

1. Crea caso en tabla "ambiente", escribiendo en tdato (codigo_planta, codigo_grupo; codigo_estancia o codigo_subgrupo) segun el valor de scope y tdato tipo = 1
2. Crea las operaciones (si fuese necesario) y la relacion_ambiente_operacion en donde corresponda segun si tiene valor en lights, lights_scenes,... fancoil_scenes (tablas "operacion_luces", "operacion_clima",...)



### 17. createRoutine

```php
/* These parameters are necessary POST:
* data (objet)
    * scope intenger (0 home 1 floor 2 grupo 3 estancia 4 subgrupo)
    * id intenger (ubicacion,floor,group,subgroup, lounge)
    * nemo
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
* id de la rutina creada
*/
```

```php
@return int (id de la rutina)
```

Crea una rutina:

1. Crea caso en tabla "ambiente", escribiendo en tdato (codigo_planta, codigo_grupo; codigo_estancia o codigo_subgrupo) segun el valor de scope y tdato tipo = 2.
2. Crea caso en tabla "task" con los valores elegidos y el id del ambiente creado en tdato codigo_ambiente_inicio.
3. Crea las operaciones (si fuese necesario) y la relacion_ambiente_operacion en donde corresponda segun si tiene valor en lights, lights_scenes,... fancoil_scenes (tablas "operacion_luces", "operacion_clima",...)



### 18. createAtHome

```php
/*
* These parameters are necessary POST:
* data (objet)
    * system
    * nemo
    * status
*/
```

```php
@return int (0 ok 1 Error)
```

Crea un athome:

1. Crea caso en tabla "athome"



### 18. createModo

```php
/*
* These parameters are necessary POST:
* data (objet)
    * system
    * athome
    * nemo
    * status
*/
```

```php
@return int (0 ok 1 Error)
```

Crea un modo:

1. Crea caso en tabla "modo"



### 19. createPrograma

```php
/*
* These parameters are necessary POST:
* data (objet)
    * system
    * nemo
    * modo (id modo)
    * ambient (id ambiente)
*/
```

```php
@return int (0 ok 1 Error)
```

Crea un programa:

1. Crea caso en tabla "programa"



### 20. createPanel

```php
/*
* These parameters are necessary POST:
* data (objet)
    * system
    * type (0 -> general, 1-> por planta, 2-> por grupo, 3-> por estancia, 4 -> por subgrupo )
    * nemo_panel
    * row
    * column
*/
```

```php
@return int (0 ok 1 Error)
```

Crea un cuadro electrico:

1. Crea caso en tabla "cuadro" escribiendo en tdato (codigo_planta, codio_grupo, codigo_subgrupo, codigo_estancia o en ninguno) segun el valor de type.



### 21. createAutomatics

```ph
/*
* These parameters are necessary POST:
* data (objet)
    * system
    * panel (id cuadro)
    * type
    * num_row
    * num_column
    * model (2x40A) (no es obligatorio)
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

Crea un cuadro automatico:

1. Crea caso en tabla "automaticos" 



22. readData

```
/*
 * These parameters are necessary POST:
 * data (objet)
 	* system
 	* modo
 	* ambient
*/
```

