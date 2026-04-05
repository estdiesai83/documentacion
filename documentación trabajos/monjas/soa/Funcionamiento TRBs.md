# Funcionamiento TRB ENTRADAS

Al iniciar leer de la bd: sistema_x  de la tabla "iniciarhilostrb" los valores de (trb, argumentos, codigo_rb, bornas) donde tipo=0 e inhibir=0, por cada caso llamar a trb que corresponda enviandole los valores  leidos.

Cuando cambia el valor de la entrada tiene que :

- Escribe en la tp
- Llama al th (*en los trbs nuevos llamaran a un rpc , para que el soa haga dicha funcionalidad) 



# Funcionamiento TRB SALIDAS

Cuando se llama a una salida (rpc):

- Lee de la bd: sistema_x  de la tabla "iniciarhilostrb" los valores de (argumentos, subtipo) donde tipo=1, inhibir=0 y codigo_rb = 'X' y borna = 'Y', llamar al trb que corresponda, enviándole los argumentos, codigo_rb, borna. (*en los trbs nuevos llamaran a un http mediante curl , para hacer la funcionalidad del cacharro ) 

- Escribe en la tp
- Llama al th 



# Funcionamiento General:

Ejemplo caso en tabla iniciarhilostrb:

```mysql
Para una entrada: tipo rasp dali 
id: 25
trb: 64
argumentos: {"ip":"80.28.98.191","port":"53137","converter":"0","command":"0","time":"300","id":"0"}
codigo_rb: 13
bornas: 3
inhibir: 0
tipo: 0
subtipo: 0
identificador: NULL
monitor: NULL

Para una salida: tipo rasp dali 
id: 17
trb: 65
argumentos: {"ip":"80.28.98.191","port":"53137","converter":"0","command":"64","id":"0"}
codigo_rb: 6
bornas: 1
inhibir: 0
tipo: 1
subtipo: 0
identificador: NULL
monitor: NULL

```

En los valores leidos de iniciarhilostrb:

*trb: indica el tipo de trb

*tipo: 0 -> trb entradas, 1-> trb salidas

*subtipo: se utiliza solo para las salidas (0-> normal, 1->limitada, 2-> temporizada, 3-> con cambio). 

​	En dali ademas tenemos subtipo 4 y 5 para rgb o intensidad completa. Ver documentación especifica mas abajo

*argumentos: contiene la información necesaria para la comunicación del trb en formato json . Ej:

```json
{"ip":"80.28.98.191","port":"53137","converter":"0","command":"0","time":"300","id":"0"}
```

*bornas: en las entradas puede contener varios valores separadas por ,

```
Ejemplo de varias bornas: 2,3,4,5
```

*inhibir: activa o desactiva el caso 1 -> desactivado 0 -> activado



- Para escribir en la tp correspondiente,  se tiene que saber el nombre de la tabla y el caso donde escribir, para ello:

  - nombre de la tabla: se obtiene con el valor de trb leido en iniciarhilostrb: "trb_" +  nombre tabla
    - leyendo de la bd: sistema en la tabla "nemo_tp" el valor de nemo_soa donde tipo = valor trb leido en iniciarhilostrb.
    - cogiéndolo de la documentación y tenerlo a capón dentro del código de cada trb.

  - caso donde escribir en la tabla "trb_x": se obtiene con el valor de codigo_rb y borna leido en iniciarhilostrb

- Llama al th correspondiente, para ello se tiene que saber el nombre de la tabla y el caso donde leer idem al anterior pero con "th_" + nombre tabla



Las tablas tienen la estructura de : id, fecha, codigo_rb, borna



Documentación nombre de las tablas:

| trb  | tabla        |
| ---- | ------------ |
| 64   | rasp_dali2_e |
| 65   | rasp_dali2_s |
|      |              |
|      |              |













## Funcionamiento TRB Raspberry Dali

### Entradas

```
Bornas:
0-> estado
1-> intensidad
2-> rgb
3-> integridad (para saber si la bombilla esta fundida)

Solo hemos utilizado hasta ahora la entradas con borna 3
```

Cuando se programa un trb dali de entrada se crea la tabla trb_rasp_dali_e o trb_rasp_dali2_e (para el dali nuevo) y se crea un caso en la tabla con el codigo_rb que corresponda y la borna que se haya programado (TP).

Cada vez que cambia el valor de la borna, escribe en la TP correspondiente y llama al rpc correspondiente para que lance los th.



### Salidas

```
Bornas:
0-> estado
1-> intensidad
2-> rgb (los tres colores tienen el mismo grupo (modelo de pablo)) 
3-> intensidad completa (rgb + intensidad (cada color es un grupo diferente (modelo de alejandro)) 
4-> rgb + W (rgb + intensidad + temperatura (modelo de alejandro)
```

Cuando se programa un trb dali de salida se crea la tabla trb_rasp_dali_s o trb_rasp_dali2_s (para el dali nuevo) y se crea un caso en la tabla con el codigo_rb que corresponda y la borna que se haya programado.

Intensidad: Se programa un rb de salida con la borna 1

rgb: se programa un rb de salida con la borna 2

intensidad completa: se programa un rb de salida con la borna 1 y otro rb de salida con la borna 3

rgb +W: se programa un rb de salida con la borna 1, otro rb de salida con la borna 3 y otro con la borna 4.



Cada vez que se hace una salida desde la APP llama al rpc de las salidas, para que se ejecute la salida con los argumentos comunes ( los lee de la tabla iniciar)  y los correspondientes al subtipo (segun borna programada, valores seleccionados por el usuario desde la APP): 

   * * comunes: converter, command, puerto, ip, id

        * elementos subtipo 0 (borna 1 y 4): codigo_rb, borna, 1 valor

        * elementos subtipo 4 (borna 2):  codigo_rb, borna,  3 valores (rojo, verde, azul)

        * elementos subtipo 5 (borna 3): rb_rojo, valor_rojo, rb_verde, valor_verde,
                                  rb_azul, valor_azul, valor_intensidad, borna_color, borna_intensidad

        ​     

Independientemente de la borna de salida que se haya programado, cuando se ejecuta la salida escribe en la TP correspondiente y lanza el th socket y un trigger para que escriba en la tabla luces la intensidad, rgb y/o temperatura según corresponda.



Nota: 

- Desde la APP llamará a la misma función de rpc del soa, pero desde el soa, se hace una distinción:
  - si es el dali de siempre: llama a la función del soa: init_trb_output_raspberrydali (hace salida, escribe en tp, lanza socket y trigger)
  - si es el dali nuevo: llama mediante curl a la función que corresponda para que se ejecute el trb externo, enviando los argumentos que sean necesarios. (hace salida)  

