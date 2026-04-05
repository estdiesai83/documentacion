# FUNCIONAMIENTO SISTEMA SOA



##### ORDEN PROGRAMACION

1. Crear Comando
2. Crear trb
3. Crear tpse y /o tpss
4. Crear th (tienen que estar programado lo anterior pasos 1, 2 y 3)
   1. cadena seguridad (hace falta tener una tpss y tpse para la misma borna)
   2. consigna
   3. pulsador
5. Crear Domo (tiene que estar programados los pasos anteriores 1, 2, 3, 4) tiene que programarse en este orden
   1. Planta
   2. Grupo (si tiene)
   3. Subgrupo (si tiene)
   4. Estancia
   5. Zonas (luces, clima, estores,...)
   6. Escenas (tiene que estar programados los pasos anteriores)
6. Crear Tareas



### Crear Comando

1. Crea un caso en tabla "comando" para el cacharro correspondiente con los valores de la comunicacion del cacharro (Ej: ip, puerto, num_comando,...) (id tabla = codigo_comando)

2. Crea un caso en tabla "rb" con el codigo_comando, tipo Trb y numero de bornas total (id tabla = codigo_rb)

3. Crea tabla "Tp" y "th" (si no existe), . El nombre de la tabla se forma con "trb_"+ tipotrb (Ej: trb_rasp_ed) y "th_"+ tipotrb (Ej: th_rasp_ed).

   En la tabla tp, se escribe el valor del cacharro y el tipodomo (si es que tiene luz, clima,...)

   En la tabla th, estan asignados las funcionalidades a ejecutar cuando se escribe en la tp (no todas las tps tienen th asignada)

4. Crea los triggers correspondientes a dicha tabla. (Funcionalidad que se lanza automaticamente desde mysql al escribir un valor en la tabla tp)

5. Crea un caso en la tabla "tpse" y/o "tpss" por cada borna de entrada y/o salida que tenga dicho cacharro, escribiendo el codigo_rb y el numero de la borna.

   

## Crear TRB (Entradas)

1. Sobre un Comando existente: se eligen las bornas que queremos preguntar y cada cuanto tiempo

   1. Crea caso  en tabla "tp": un caso por cada borna elegida

   2. Crea caso en tabla "relacion_rb": con las bornas elegidas y el tiempo (id tabla = codigo_relacion_rb) (se utiliza para buscar informacion de dicho rb)

   3. Crea caso en tabla "iniciarhilostrb", con el tipotrb, valores necesarios para la comunicacion, codigo_rb, inhibir y tipo

      ```mysql
      Ej:+----+------+-------------------------------------------------+-----------+-------------+---------+------+---------+---------------+---------+
      | id | trb  | argumentos                                      | codigo_rb | bornas      | inhibir | tipo | subtipo | identificador | monitor |
      +----+------+-------------------------------------------------+-----------+-------------+---------+------+---------+---------------+---------+
      | 34 |    0 | {"ip":"80.24.47.188","port":"53132","time":"1"} |        12 | 0,1,2,3,4,5 |       0 |    0 |       0 | NULL          |    NULL |
      +----+------+-------------------------------------------------+-----------+-------------+---------+------+---------+---------------+---------+
      
      Donde:
      trb: trb = 0 significa tipo raspberry ed
      argumentos: tiene los valores para comunicarnos con el cacharro
      codigo_rb: id tabla rb
      bornas: bornas por las que vamos a preguntar
      inhibir: 0 -> activo (se utiliza para desactivar/activar un rb)
      tipo: 0-> entrada, 1 -> salida
      subtipo: se utiliza en las salidas (por defecto 0 (salida normal))
      ```

   4. Escribe en la tabla "tpse", el codigo_relacion_rb en los casos de las bornas seleccionadas

      




## Crear TPSE (Entradas)

1. Escribe en tabla "tpse" en el caso correspondiente a una borna programada (paso anterior ) las familias (nemo), tipoborna y funcionalidad si es que la tiene (como medidor**) 

   ```
   Ejemplo:
      1. En raspberry -> ed, pulsador -> tipoborna = digital
      2. En raspberry -> ds18b20 -> tipoborna = analogica 
   ```

   Rellenar valores de programacion (familias)

2. Si tiene funcionalidad de medidor:

   1. se crea tabla tp_medidor: 

   2. se crea un trigger con la funcionalidad que hayamos programado (general, anual, mensual,... ), para que cuando se escriba en la tabla "tp" escriba en la tabla tp_medidor

   3. se crea un  evento con la funcionalidad que hayamos programado (general, anual, mensual,... )

      Funcionalidad de mysql que se ejecuta automaticamente, por si una tp no ha cambiado de valor y no escribe en la tabla tp_medidor, para que vaya creando los casos automaticamente con el ultimo valor que tenga




## Crear TPSS (Salidas)

1. Escribe en tabla "tpss" en el caso correspondiente a una borna las familias (nemo), tipoborna y tipo de salida (directa, limitada, temporizada)

   ```
   Ejemplo:
    1. En raspberry -> sd -> tipoborna = digital
    2. En raspberry -> sa, dali -> tipoborna = analogica 
   ```

2. Si el tipo de salida es temporizada

   1. Hay que introducir el tiempo 
   2. Escribir el valor de inicio y de fin para las salidas limitadas.

3. Crea caso en tabla "iniciarhilostrb" idem a las entradas, pero escribiendo ademas el subtipo que corresponda

   ```
   subtipo: salidas (0-> normal, 1->limitada, 2-> temporizada, 3-> con cambio). 
   
   ​	En dali ademas tenemos subtipo 4 y 5 para rgb o intensidad completa. 
   ```



*Si el trb a programar es :

- raspberry dali: hay que elegir numero borna, numero conversor (por ahora siempre es 0), y numero grupo (si es un grupo de luces) y numero_comando (si es una luz solo)
- persianas (somfy_rts): hay que elegirel numero de canal (cada canal es una persiana diferente)



## Crear TH:

Se cosen a una tp, para que cada vez que se escribe en ella se ejecute

### Cadena Seguridad:

1. comprueba si las tp's seleccionadas tienen el mismo valor (Ej: si una tp salida tiene el mismo valor que la tp de entrada)

   ```mysql
   Ej: 
   +-----------+--------+-------------------------------------+
   | codigo_tp | modulo | argumentos                          |
   +-----------+--------+-------------------------------------+
   |         1 |      3 | {"trb":"0","rb":"1","terminal":"0"} |
   +-----------+--------+-------------------------------------+
   ```

   

### Consigna:

1. Se utiliza para ejecutar un salida de encendido o apagado para el clima dependiendo de si cumple o no el valor de la consigna

   ```mysql
   Ej: +-----------+--------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
   | codigo_tp | modulo | argumentos                                                                                                                                                   |
   +-----------+--------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
   |         1 |      6 | {"cod_consigna":"2","cod_rango":"3","trb_tpss":"7","rb_tpss":"118","terminal_tpss":"7","trb_tpse":"0","rb_tpse":"117","terminal_tpse":"11","id_climate":"1"} |
   +-----------+--------+--------------------------------------------------------------------------------------------------------------------------------------------------------------+
   ```



### Pulsador:

```mysql
Ej:
+-----------+--------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| codigo_tp | modulo | argumentos                                                                                                                                                                                                    |
+-----------+--------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|         6 |      7 | {"trb_tpss":"7","rb_tpss":"118","terminal_tpss":"0","trb_tpse":"0","rb_tpse":"117","terminal_tpse":"4","valves":[{"trb": "7","rb": "118","terminal": "4"}],"probes":[{"trb": "1","rb": "5","terminal": "0"}]} |
+-----------+--------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
```







## Otras funcionalidades (Zonas DOMO)

1. A una tp se le puede  asignar que tenga funcionalidad de (luz, clima, estor,...), dependiendo de la funcionalidad:

   1. Crea caso en tabla luces, clima, estor,.... con los nemos correspondientes y estancia a la que pertence (id tabla = codigo_luces, codigo_clima,... segun corresponda)

   2. Crea caso en tabla relacion_luces, relacion_clima segun corresponda con el codigo_luces, codigo_clima según corresponda mas los valores de codigo_rb y borna de las tps que se han utilizado

   3. Escribe en tabla "th" el th_socket correspondiente, para que le notifique a la app que funcionalidad se ha ejecutado, (indicando estancia, valor, tipo de valor (luz, clima))

      ```mysql
      {"floor":"2","group":"2","room":"14","zone":"33","type":"0","nemo":"0"} |
      ```

      



