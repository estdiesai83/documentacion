# FUNCIONAMIENTO CLIMA



El clima se  activa manualmente desde el pulsador o desde la app en el boton de encender clima



## SUELO RADIANTE

### Cuando se cambia estado clima desde la APP:

- SI estado = 0
  - Escribe inhibir = 1 en th_consigna
  - Hace salida 0 en bombilla y valvula

- Si estado = 1
  - Escribe inhibir = 0 en th_consigna
  - Hace salida 1 en bombilla

Escribe en tabla clima  el estado de la bombilla



### Cuando se pulsa en Pulsador:

- Obtenemos el estado de la bombilla (TPSE) para saber si hay que encender/apagar
- Si estado Bombilla = 1 APAGA CLIMA
  - Apaga bombilla (tpss)
  - Apaga valvula (tpss)
  - Inhibe consigna sonda (escribe 1 en inhibir en th_consigna)
- Si estado Bombilla = 0 ENCIENDE CLIMA
  - Enciende bombilla (tpss)
  - Enciende valvula (tpss)
  - desInhibe consigna sonda (escribe 0 en inhibir en th_consigna)



### TH_ pulsador: (argumentos json)

1.  tpss bombilla suelo radiante
2. tpse bombilla suelo radiante
3. valvulas (valvula suelo radiante): es un array con las valvulas necesarias
4. sondas (sonda temperatura): es un array con las sondas necesarias



* El numero de válvulas y de sondas debe ser el mismo.

```json
Ej: {"trb_tpss":"7","rb_tpss":"185","terminal_tpss":"13","trb_tpse":"0","rb_tpse":"184","terminal_tpse":"15","valves":[{"trb": "23","rb": "211","terminal": "3"}],"probes":[{"trb": "1","rb": "187","terminal": "0"}]}" donde :

{
    "trb_tpss":"7","rb_tpss":"185","terminal_tpss":"13", (tpss bombilla)
    "trb_tpse":"0","rb_tpse":"184","terminal_tpse":"15", (tpse bombilla)
    "valves":[{"trb": "23","rb": "211","terminal": "3"}], (array valvulas)
    "probes":[{"trb": "1","rb": "187","terminal": "0"}]
} (array sondas)
```

### Th Consigna:  cosido en las tpse de las sondas (argumentos json)

1. cod_consigna, cod_rango  (id tabla 'variables')
2. tpss valvula suelo radiante:  { trb_tpss, rb_tpss, terminal_tpss},
3. tpse valvula suelo radiante:  { trb_tpse, rb_tpse, terminal_tpse},
4. id climate (id tabla 'variables')

```json
Ej: {"cod_consigna":"15","cod_rango":"16","trb_tpss":"23","rb_tpss":"209","terminal_tpss":"0","trb_tpse":"21","rb_tpse":"210","terminal_tpse":"0","id_climate":"1"}
```







## FANCOIL:



### Cuando se cambia estado fancoil desde la APP:

Si no tiene bombilla

- SI estado = 0
  - Escribe inhibir = 1 en th_consigna
  - Hace salida 0 en valvula y en las velocidades

- Si estado = 1
  - Escribe inhibir = 0 en th_consigna
  - Hace salida 1 en valvula y en la velocidad 1 (velocidad por defecto)



Escribe en tabla clima  el estado de la combinacion de las velocidades, 0 si estan todas apagadas y 1 si hay alguna velocidad encendida



### Cuando se cumple la consigna:

Se apaga la vávula solo, la velocidad se queda con la que tiene



### Th Consigna:  cosido en las tpse de las sondas (argumentos json)

1. cod_consigna, cod_rango  (id tabla 'variables')
2. tpss valvula fancoil:  { trb_tpss, rb_tpss, terminal_tpss},
3. tpse valvula fancoil:  { trb_tpse, rb_tpse, terminal_tpse},
4. id climate (id tabla 'variables')

```json
Ej: {"cod_consigna":"15","cod_rango":"16","trb_tpss":"23","rb_tpss":"209","terminal_tpss":"0","trb_tpse":"21","rb_tpse":"210","terminal_tpse":"0","id_climate":"1"}
```



TRIGGER SALIDA: 

Escribe en tdato estado el valor de la valvula



TRIGGER ENTRADA:

Escribe en tdato estado 1 (si hay alguna velocidad encendida), 0 si no hay ninguna velocidad



RESUMEN: 

cuando se apaga el fancoil: apaga la valvula y las velocidades

Cuando se enciende el fancoil: enciende la valvula y enciende velocidad 1

Cuando se cumple la consigna: apaga la valvula, se queda con la velocidad en la que esta

En la tabla clima en tdato estado escriben las entradas y salidas de las velocidades (Se va a tener en cuenta que el fancoil esta activo si hay alguna velocidad activada).

### NOTA:

suelo radiante:

- En la tabla clima en tdato estado escriben la entradas y salidas de las bombillas. (domo = 1 en tabla trb para las bombillas ). (Idem para calefaccion con domo = 14)
- Se cose th socket de las entradas y salidas para las bombillas solo, NO para las valvulas.
- Se envia socket desde la api cuando se enciende o se apaga el clima, desde el soa, no se va a enviar ningun socket desde las funciones de climate por que lo que hacen es comparar la condicion de la consigna para que active o no la valvula.

fancoil:

- En la tabla clima en tdato estado escriben las entradas y salidas de las velocidades (Se va a tener en cuenta que el fancoil esta activo si hay alguna velocidad activada).

  