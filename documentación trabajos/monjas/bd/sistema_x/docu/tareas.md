![tareas](/home/esther/git/soa/documentacion/bd/imagenes/tareas.png)







**codigo_domo** es el id de la tabla luces, clima, estor,... que corresponda segun el valor del tdato 'tipotarea'

**tipotarea**: a que pertenece dicha tarea y en algunos casos tienen

** esos son los tipotarea que tienen codigo_domo asignado.



En **scheduled**,los valores a escribir serán de la tipologia

- Puntual: modo = 0  (El dia x a la hora Y)

  año,mes,dia,hora,minuto,segundo 

  Ej: 2021,05,25,13,00,0   (el mes tiene que ser un mes menos)

- Periodica: modo = 1  (Los L,X,V a las 15:00)

  | Formato                                              |
  | ---------------------------------------------------- |
  | * * * * * *                                          |
  | ┬ ┬ ┬ ┬ ┬ ┬                                          |
  | │ │ │ │ │ │                                          |
  | │ │ │ │ │ └ day of week (0 – 6)                      |
  | │ │ │ │ └───── month (1 - 12)                        |
  | │ │ └────────── day of month (1 - 31)                |
  | │ │ └─────────────── hour (0 - 23)                   |
  | │ └──────────────────── minute (0 - 59)              |
  | └───────────────────────── second (0 - 59, OPTIONAL) |

  Ej: 0 17 ? * 0,4-6 

  *Starting with Sunday

- Amanecer: modo =2  (Todos los dias al amanecer)

  Se Utiliza por ejemplo en el alumbrado exterior,

- Atardecer: modo =3  (Todos los dias al atardecer)

  Se Utiliza por ejemplo en el alumbrado exterior,

- Amanecer periodica: modo =4  (Los L,X,V al amanecer) 

  Se utiliza por ejemplo para las rutinas

- Atardecer periodica: modo =5  (Los L,X,V al atardecer)

  Se utiliza por ejemplo para las rutinas



## Tareas rpc:

Estas tareas llaman a funciones del soa, enviando el nombre de la funcion  y los argumentos que necesita dicha funcion.

* En argumentos: guarda los argumentos como json, que son los valores que se van a ejecutar cuando se cumpla el schedule de la tarea.

  Ej: {"fk":"output_rpc","trb":"7","subtype":"0","rb":"5","terminal":"0","value":"1"}



## Tareas bd:

Estas tareas ejecutan intrucciones de mysql segun los valores que haya en la tabla tarea_bd

tdatos: [“id”, “fecha”, “nemo”,…] 

valores: [”1”,“2022-05-09”, ”nemo1”,…}] 

Las tareas de tipo sql (tipo=4),  es otra instrucción sql que no esta contemplada en los tipos anteriores y se escribe la sentencia entera en el tdato sql de la tabla tarea_sql



**Esta pensado para crear un solo caso, si se necesita hacer , por ejemplo dos insert, creamos dos casos o generamos una sentencia sql en tarea_sql





## Tareas rutina:

Estas tareas se crean cuando se programa una rutina domo



