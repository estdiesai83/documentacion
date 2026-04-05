# PROGRAMAR EN LOA 

Abrir desde el navegador: https://loa.hometech.red/ e introducir usuario y contraseña



## Crear Sistema Nuevo:

Escribir nombre sistema que se quiere crear en el cuadro del medio

Pulsar en boton configuracion -> Crear BD

Introducir los parámetros: de configuracion de la BD



```
EJ:
host: localhost
usuario: localhost
clave: localhost
puerto: 3306
ruta: dejar la que aparece por defecto
```

Pulsar en boton crear



#### Programar en un sistema existente

1. Elegir sistema pulsando en el input de arriba en el media y elegir del desplegable



##### ORDEN PROGRAMACION

1. Crear Comando
2. Crear trb
3. Crear tpse y /o tpss
4. Crear th (tienen que estar programado lo anterior pasos 1, 2 y 3)
   1. cadena seguridad (hace falta tener tpss y tpse)
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

1. Pulsar en Teclado automático -> Com-> crear
2. Elegir TRB ( y clase si  tiene)
3. Rellenar valores de programación
   1. F1: nuevo -> Ej: rudy -> ok
   2. F3: nuevo -> Ej: planta baja -> ok
   3. Nemo: nuevo -> Ej: habitacion invitados 1 -> ok
4. Pulsar boton crear, si todo ha ido bien muestra en el boton el texto "creado correctamente"

** Todos los nemos tienen que ser únicos



## Crear TRB (Solo Entradas)

1. Pulsar en Teclado automatico -> Trb-> crear
2. Elegir TRB y clase si  tiene
3. Elegir Comando: Pulsar en Nemo y seleccionar el que se necesite. Ej: habitacion inivtados 1
4. Rellenar valores de programacion (Dejar estado activado  como viene por defecto, a no ser que se diga lo contrario )
5. Pulsar boton crear, si todo ha ido bien muestra en el boton el texto "creado correctamente"



## Crear TPSE (Entradas)

1. Pulsar en Teclado automatico -> Tcamp-> TPS-> Entrada->crear

2. Elegir TRB (y clase si  tiene)

3. Elegir Comando: Pulsar en Nemo y seleccionar el que se necesite. Ej: habitacion inivtados 1

4. Elegir borna

5. Elegir Tipo borna (digital si los valores son 0 o 1 o analogica en otro caso)

   ```
   Ejemplo:
      1. En raspberry -> ed, pulsador -> tipoborna = digital
      2. En raspberry -> ds18b20 -> tipoborna = analogica 
   ```

   Rellenar valores de programacion (familias)

6. Pulsar boton crear, si todo ha ido bien muestra en el boton el texto "creado correctamente"



## Crear TPSS (Salidas)

1. Pulsar en Teclado automatico -> Tcamp-> Salida->crear-> TPSS Unica->

2. Elegir TRB (y clase si  tiene)

3. Elegir Comando: Pulsar en Nemo y seleccionar el que se necesite. Ej: habitacion inivtados 1

4. Elegir borna

5. Elegir Tipo borna (digital si los valores son 0 o 1 o analogica en otro caso)

   ```
   Ejemplo:
    1. En raspberry -> sd -> tipoborna = digital
    2. En raspberry -> sa, dali -> tipoborna = analogica 
   ```

   

6. Elegir seudoborna (0)

7. Si el tipo de salida es temporizada

   1. Hay que introducir el tiempo (en todos los input, si no tiene escribir 0)
   2. Escribir el valor de inicio y de fin para las salidas limitadas.

8. Rellenar valores de programacion (familias)

9. Pulsar boton crear, si todo ha ido bien muestra en el boton el texto "creado correctamente"



Si el trb a programar es :

- raspberry dali: hay que elegir numero borna, numero conversor (por ahora siempre es 0), y numero grupo (si es un grupo de luces) y numero_comando (si es una luz solo)
- persianas (somfy_rts): hay que elegirel numero de canal (cada canal es una persiana diferente)



## Crear TPCM (TP multiple)

1. Pulsar en Teclado automatico -> Tcamp-> Tpcm->crear-> 

2. Rellenar valores de programacion (familias Nemo tpcm)

3. Elegir TPSE y/o TPSS: Pulsar en Nemo y seleccionar el que se necesite. Ej: habitacion inivtados 1. 

4.  Escribir en el entry de operacion,  (la operacion que queremos hacer entre tp y tp ). Ejemplo: +

5. Pulsar en añadir. 

6. Pulsar boton crear, si todo ha ido bien muestra en el boton el texto "creado correctamente"



Nota:

- Con cada tp se creara un trigger en el que cuando escriba en dicha tp, haga los calculos que corresponda con todos los valores de cada tp elegida aplicandole la operacion programada y el resultado lo escribira en la tp: trb_tpcm en el caso que corresponda.
- Si la tp que se quiere elegir es un medidor, cuando se elige la tp, marcar la opción del checkbox TP medidor. 



## Crear TH:

### Cadena Seguridad:

1. Pulsar en Teclado automatico -> TH-> Cadena seguridad->crear

2.  Pulsa en el boton Elige TPSE  y Elegir TRB y clase si  tiene y elegir TPSE segun el listado

3.  Pulsa en el boton Elige TPSS  y Elegir TRB y clase si  tiene y elegir TPSS segun el listado

4. Marcar en Modo: 

   1. tp salida si se quiere coser en la TPSS elegida  o
   2. tp entrada si se quiere coser en la TPSE elegida

   NOTA: Actualmente siempre la cosemos en la TPSS salida

5. Pulsar en inhibir si se quiere programar y que no funcione directamente.

6. Pulsar boton crear, si todo ha ido bien muestra en el boton el texto "creado correctamente"



Consigna:

1. Pulsar en Teclado automatico -> TH-> Cadena seguridad->crear

2.  Pulsa en el boton Elige TPSE  y Elegir TRB y clase si  tiene y elegir TPSE segun el listado

3.  Pulsa en el boton Elige TPSS  y Elegir TRB y clase si  tiene y elegir TPSS segun el listado

4. Marcar en Modo: 

   1. tp salida si se quiere coser en la TPSS elegida  o
   2. tp entrada si se quiere coser en la TPSE elegida

   NOTA: Actualmente siempre la cosemos en la TPSS salida

5. Pulsar en inhibir si se quiere programar y que no funcione directamente.

6. Pulsar boton crear, si todo ha ido bien muestra en el boton el texto "creado correctamente"

7. En pasillo habitaciones no hay un pulsador para dicha sonda





ACLARACIONES CLIMA (Fernando)

Salidas suelo radiante 

1. valvula suelo radiante (valvula)
2. Piloto del accionamiento manual (Bombilla)



Entradas suelo radiante:

1. Estado valvula suelo radiante (valvula)
2. Estado del funcionamiento manual (Pulsador)
3. Estado del piloto de accionamiento manual (estado bombilla)



## NOTAS:

1. ### Para programar una persiana
   
   1. Programar UN SOLO comando somfy_rts, se necesita ip, puerto, comando, transmisor y receptor
   2. Programar salida tipo somfy_rts cada persiana con un canal diferente.
   3. Programar zona persiana
2. ### Para programar un analizador
   
   1. Programar un comando
   2. Programar trb cada 60 seg:
   
      -  un rb seleccionando las bornas de la 0 - 58 (ambas inclusive)
      -  un rb seleccionando las bornas de la 459 - 478 (ambas inclusive)
   3. Las bornas que se programan medidores son: 462, 466, 470 y 474 medidor autoincrementado factor = 1
   
3. ### Para programar un zenner (contador de agua)
   
   1. Programar comando
   2. Programar trb cada 5 seg
   3. Programar medidor en borna 2 (volumen positivo) medidor autoincrementado factor = 1
   
4. ### Para programar un smarttrail (contador electrico)
   
   1. Programar comando
   2. Programar trb cada 180 seg
   3. Programar medidor en la borna 12 medidor autoincrementado factor = 1



## AÑADIR COMANDO NUEVO:

1. Incluir en app/src/enviroments (en los dos archivos):

   1. En la variable TIPOS_TRB, una posicion mas

      ```
      EJ: 
      
            { id: 6, nombre: 'Raspberry', es: 0, tipos: [
               { id: 1, nombre: 'Dali', es: 0 },
               { id: 2, nombre: 'Pulsos', es: 1 },
               { id: 3, nombre: 'ED', es: 1 },
               { id: 4, nombre: 'SD', es: 2 },
               { id: 5, nombre: 'DS18B20', es: 1 },
               { id: 6, nombre: 'SHT31', es: 1 },
               { id: 7, nombre: 'EA', es: 1 },
               { id: 8, nombre: 'Pulsador', es: 1 },
               { id: 9, nombre: 'Vel-Viento', es: 1 },
               { id: 10, nombre: 'Dir-Viento', es: 1 },
               { id: 11, nombre: 'Sonda-Suelo', es: 1 },
               { id: 12, nombre: 'CO2', es: 1 },
               { id: 13, nombre: 'SA', es: 2 }
               
               Donde el valor de es es:
               	0-> si tiene entradas y salidas, 
               	1-> si solo son entradas 
               	2-> si solo son salidas
              
              Este ejemplo tiene tipo y subtipos, si solo tiene tipo , no tiene el array de tipos:[] 
              EJ: { id: 22, nombre: 'Md02', es: 1 }
      ```

      Nota: el valor del id del tipo, es el valor que se pone en el paso 3 en el case.

   2. 

2. En app/src/app/contenido/tecladoauto/com/crear/ crear una carpeta con el nombre del comando que se va a crear : ej: abb (Idem en borrar y modificar)

3. Modificar en app/src/app/contenido/tecladoauto/com/crear/ 

   1. el archivo crear.page para añadir la ruta del comando que estamos creando

      ```
      Añadir la siguiente numeracion en el case y en 'abb' 
               case '23':
                  this.router.navigate(['/comando-crear/', {outlets: {datos: ['abb']}}]);
                  break;
            }
      ```

      

   2. en el archivo crear-routing.module declarar el comando nuevo

      ```
      import { AbbPage } from './abb/abb.page';
      
      { path: 'abb', component: AbbPage, outlet: 'datos' }
      ```

      

   3. en el archivo crear.module.ts declarar e importar el comando nuevo

   ```
   import { AbbPageModule } from './abb/abb.module';
   
   imports:[
   	...,
   	AbbPageModule
   ]
   ```

   

4. En el controlador añadir un case con el comando nuevo

   ```
   ruta: api/application/Controllers/Tecladoauto/Crear
   nombre controlador: createCommand
   ```

   

5. Crear un modelo que cree las estructuras correspondientes al comando nuevo





## OTROS: 

1. si al hacer ionic serve da error:

```
hpack Error (watcher): Error: ENOSPC: System limit for number of file watchers reached, watch '/var/www/html/kernelloa/app/node_modules/html2canvas/dist/types/core'
[ng] Watchpack Error (watcher): Error: ENOSPC: System limit for number of file watchers reached, watch '/var/www/html/kernelloa/app/node_modules/html2canvas/dist/types/css'
[ng] Watchpack Error (watcher): Error: ENOSPC: System limit for number of file watchers reached, watch '/var/www/html/kernelloa/app/node_modules/html2canvas/dist/types/dom'
[ng] Watchpack Error (watcher): Error: ENOSPC: System limit for number of file watchers reached, watch '/var/www/html/kernelloa/app/node_modules/html2canvas/dist/types/render'
[ng] Watchpack Error (watcher): Error: ENOSPC: System limit for number of file watchers reached, watch '/var/www/html/kernelloa/app/src/app/contenido/utilidades/programming'
[ng] Watchpack Error (watcher): Error: ENOSPC: System limit for number of file watchers reached, watch '/var/www/html/kernelloa/app/src/app/contenido/utilidades/tareas'
[ng] Watchpack Error (watcher): Error: ENOSPC: System limit for number of file watchers reached, watch '/var/www/html/kernelloa/app/src/app/contenido/utilidades/variables'
[ng] Watchpack Error (watcher): Error: ENOSPC: System limit for number of file watchers reached, watch '/var/www/html/kernelloa/app/src/app/contenido/riego/elementos'
[ng] Watchpack Error (watcher): Error: ENOSPC: System limit for number of file watchers reached, watch '/var/www/html/kernelloa/app/src/app/contenido/depuracion/elementos'
[ng] Watchpack Error (watcher): Error: ENOSPC: System limit for number of file watchers reached, watch '/var/www/html/kernelloa/app/src/app/contenido/tecladoauto/com/borrar'
...........
```

Solution:

Modify the number of system monitoring files

Ubuntu

```
sudo gedit /etc/sysctl.conf
```

Add a line at the bottom

```
fs.inotify.max_user_watches=524288
```

Then save and exit!

```
sudo sysctl -p
```

to check it

Then it is solved!<





# CONFIGURAR LOA:

1. Descargar proyecto kernelloa: https://git.uniquehome.es/Uniquehome/kernelloa.git

2. Crear una bd : sistema_soa con una tabla usuario donde va a estar contenido el usuario y la contraseña con la que se va a acceder.

```
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usuario` varchar(140) DEFAULT NULL,
  `clave` int(11) NOT NULL,
  `tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


insert into usuario VALUES (1,now(),'loa',5555,0);
```

3. Para compilar el proyecto:

   ```
   sudo ionic build --verbose  
   ```

   Esto crea unos archivos en la carpeta www dentro de app, que es la que hay que pasar al servidor para que funcione la web loa.hometech.red  excepto los archivos de nodemodules

4. 