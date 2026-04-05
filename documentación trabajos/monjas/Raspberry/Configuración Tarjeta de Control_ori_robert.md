## Tarjeta de Control

[TOC]

### 1. Raspberry Pi

#### 1.1 Instalación tarjeta SD

> Documentado aparte

#### 1.2 Configuración sistema operativo

> Documentado aparte

###### Archivos necesarios

Necesitamos tener las carpetas `daemon`, `rules`, y `soaraspberry` en la carpeta `/home/soa`. Es muy importante asegurarse de que el fichero `/home/soa/soaraspberry/soa.data` pertenezca al usuario `root`.

#### 1.3 Sondas DS18B20

###### Configuración

Para la lectura de estas sonda usamos un driver ya existente. Para activarlo, primero editamos el archivo `/etc/modules` y añadimos la siguiente linea

```bash
ds2482
```

Ahora le tenemos que decir la direccion `I2C` donde se encuentra el bus `OneWire`, en nuestra placa, este bus se encuentra en la direccion `0x18`, para ello editamos el archivo `/etc/rc.local` y añadimos la siguiente linea antes de la instrucción `exit 0` 

```bash
echo ds2482 0x18 > /sys/bus/i2c/devices/i2c-1/new_device
```

Una vez hecho esto, reiniciamos la Raspberry.

Tras iniciar, comprobamos que todo funciona adecuadamente, para ello nos dirigimos a la carpeta `/sys/bus/w1/devices`, dentro de esta carpeta debería haber algo como lo siguiente:

```bash
total 0
lrwxrwxrwx 1 root root 0 Feb 19 09:03 28-0517b199acff
lrwxrwxrwx 1 root root 0 Feb 19 09:03 28-0517b1d1c6ff
lrwxrwxrwx 1 root root 0 Feb 19 08:54 w1_bus_master1
```

Los archivos que empiezan por `28` son las sondas que hay en el bus. Dentro de ellos esta toda la información acerca de la sonda.

#### 1.4 Dali

###### Configuración

Por defecto, el puerto de los conversores Dali suele ser `/dev/ttyUSBx`, pero para que funcione correctamente y para que sea mas facil de identificar, necesitamos crear un enlace simbolico a esa ruta. 

Lo primero que debemos hacer es obtener el `devpath` del puerto, para ello deberemos ejecutar el siguiente comando:

```bash
$ udevadm info -a -p  $(udevadm info -q path -n /dev/ttyUSBx) | grep devpath
```

Obtendremos una salida parecida a la siguiente:

```bash
Udevadm info starts with the device specified by the devpath and then
    ATTRS{devpath}=="1.1.3"
    ATTRS{devpath}=="1.1"
    ATTRS{devpath}=="1"
    ATTRS{devpath}=="0"
```

El dato que nos interesa es el primero, en este caso `1.1.3`.

Ahora editamos el archivo `/home/soa/rules/dali.rules` y lo que tenemos que hacer es modificar el campo `ATTRS{devpath}` y configurarlo con el dato que hemos obtenido en el paso anterior. En este archivo también configuramos el nombre que queremos que obtenga el puerto, en nuestro caso `ttyDALIx`.

Ahora copiamos el archivo `/home/soa/rules/dali.rules` a `/etc/udev/rules.d/`.

Una vez hecho esto tenemos que ejecutar el siguiente comando para que los cambios surtan efecto:

``` bash
$ sudo udevadm trigger
```

Comprobamos que lo hemos configurado bien ejecutando:

```bash
$ ls -l /dev/tty*
```

Si todo es correcto, deberiamos ver el nombre que hemos configurado:

```bash
lrwxrwxrwx 1 root root          7 api 26 10:15 /dev/ttyDALI1 -> ttyUSB0
crw-rw---- 1 root dialout 188,  0 api 26 10:52 /dev/ttyUSB0
```

#### 1.5 Software soaraspberry

###### Instalación

El `Makefile` permite compilar el sistema de diferentes maneras, que haran que se comporte de forma distinta:

- Compilar el proyecto mostrando todos los mensajes por pantalla

```bash
$ make debug
```

- Compilar el proyecto para ejecutarlo en modo demonio

```bash
$ make prod
```

- Compilar el proyecto mostrando por pantalla solo las tramas que recibe por ethernet

```bash
$ make custom MODO=DEBUG_TRAMA
```

- Compilar el proyecto mostrando por pantalla solo los datos obtenidos en las peticiones

```bash
$ make custom MODO=DEBUG_DATO
```

- Compilar el proyecto mostrando por pantalla solo la respuesta que se envía al servidor

```bash
$ make custom MODO=DEBUG_RESPUESTA
```

> IMPORTANTE: hemos detectado unos problemas al compilar el proyecto para ejecutarlo en modo demonio `prod`, produce que las comunicaciones con dali no funcionen correctamente, por ello actualmente compilamos el proyecto en modo `debug` o `custom`. Esto no influye si queremos ejecutarlo al inicio del S.O. y puede ejecutarse como si un demonio se tratara.

###### Configuración

Toda la configuración del sistema se encuentra el el fichero `source.h`.

- ###### Salidas (reles)

  Los reles pueden ser de tres tipos:

  0 > Simple: el valor que llega, es el que se escribe
  
  1 > Cambio: llegue el valor que llegue siempre cambia su estado al contrario
  
  2 > Conmutado: Se hara la salida en función de una entrada y de el valor recibido

  Para configurarlos simplemente tenemos que modificar las directivas de `CONFIG_BORNA_SALIDA_x` de la borna deseada, con el modo deseado.

  Los reles configurados en modo `2` (conmutado), necesitan estar relacionados con una entrada para funcionar correctamente, para ello modificamos las directivas `REL_BORNA_SALIDA_x` indicando la borna de la entrada que tiene que leer antes de ejecutar la salida.

- ###### Entradas

  Las entradas pueden ser de dos tipos:

  0 > Simple: entrada normal

  1 > Contador: entrada contador de pulsos

  2 > Contador: entrada contador para la velocidad del viento

  Para configurar las entradas, tenemos que modificar las directivas de `CONFIG_BORNA_ENTRADA_x` indicando el modo deseado.

#### 1.6 Demonio

###### Instalación

Tenemos que copiar el archivo `/daemon/soaraspberry` a `/etc/init.d/`, despues tenemos que ejecutar los siguientes comandos:

```bash
$ sudo update-rc.d soaraspberry defaults
$ sudo update-rc.d soaraspberry enable
```

Esto nos habilita el servicio, y hace que se ejecuta cuando inicia el sistema operativo.

Ejecutamos el siguiente comando para iniciar el sistema:

```bash
$ sudo /etc/init.d/soaraspberry start
```

