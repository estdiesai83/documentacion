# 1. Raspberry Pi

## 1.1 Instalación tarjeta SD

### Descarga imagen SO

Abrir pagina [https://www.raspberrypi.org]

Pulsar en Download, Raspbian y pulsar en download zip en : https://www.raspberrypi.org/downloads/raspbian/

Para instalar un **sistema con camaras**, descargar: **Raspbian** Stretch **with desktop**  

Para instalar un **sistema sin camaras**, descargar:  **Raspbian** Stretch **Lite**

Una vez descargado, descomprimir la descarga. 

Para seguir los pasos de instalacion, pulsar en el texto de la pagina en la que nos encontramos en instalation guide , y abajo del todo pulsar el enlace de Linux, para que nos lleve al enlace https://downloads.raspberrypi.org/raspbian_lite_latest (dicha documentacion esta explicada en los pasos de abajo)

### Instalacion de Imagen descargada en Tarjeta SD desde Linux

#### Descubrir el punto de montaje de la tarjeta SD y desmontarlo

Ejecute lsblk para ver que dispositivos están conectados actualmente a su máquina.

Aparecerá como algo parecido a `/dev/mmcblk0` o `/dev/sdX`(con nombres de partición `/dev/mmcblk0p1` o `/dev/sdX1` respectivamente), donde X aparece una letra minúscula que indica el dispositivo (p. Ej. `/dev/sdb1`). La columna de la derecha muestra donde se han montado las particiones (sin no lo han hecho estará en blanco).

#### Copiando la imagen a la tarjeta SD

```
dd bs=4M if=2018-11-13-raspbian-stretch.img of=/dev/sdX status=progress conv=fsync
```

donde pone `2018-11-13-raspbian-stretch.img` cambiar por la ruta y nombre de la descarga que hemos realizado en los pasos anteriores y en donde pone `/dev/sdX` cambiar por lo que nos ha devuelto el comando `lsblk` (ruta de la tarjeta).  Por ejemplo:,``sdd``no``sdds1``o``sddp1``;``mmcblk0``, No``mmcblk0p1``.

## 1.2 Configuración sistema operativo

Una vez realizado los pasos anteriores, meter tarjeta en raspberry y encender, (si no arrancase el sisteme operativo, habrá que volver a realizar los pasos de : descubrir el punto de montaje y copiar la imagen a la tarjeta SD).

Entrar con usuario: **pi** 	contraseña: **raspberry**

#### Configuracion básica

```bash
$ sudo raspi-config
```

En la pantalla que aparece configurar los puntos 4 y 5 para ello:

Pulsar 5: interfacion options 

				P2 Ssh / yes
	
				I2C yes ( en los sistemas de las camaras no se hace)

Pulsar 4: change locale (opcion 1)

	 seleccionar pulsando espacio en es-ES.UTF-8 y ok
	
	Cambiar teclado (opcion 3)

Pulsar Finish para finalizar los cambios



#### Configuracion de Usuarios

Crear Usuario soa con passw adminr123:

```bash
$ sudo adduser soa
```

Dar permisos de root al usuario que acabamos de crear

```bash
$ sudo visudo
```

añadir debajo de `root ALL=(ALL:ALL) ALL` 

`soa ALL=(ALL:ALL) ALL`



Cambiar contraseña de pi a adminr123

```bash
$ sudo passwd pi
```



Cambiar contraseña de root: a adminr123

```bash
$ sudo passwd root
```



Cambiar hostname

```bash
$ sudo hostnamectl set-hostname “nombre”
```

(los nombres si llevan guiones que sean al medio -)

```bash
$ sudo nano etc/hosts
```

poner el nombre que queramos en *127.0.0.1 localhost y 127.0.0.1 raspberry*

para ver si se ha cambiado cat /etc/hostname (hasta que no reiniciemos, no cogerá todos los cambios)



#### Instalación paquetes necesarios: vim, htop, glib, serialport

```bash
$ sudo apt-get install vim
$ sudo apt-get install htop
$ sudo apt-get install glib2.0
$ sudo apt-get install libserialport-dev
```

(en S0 sin camaras instalar ademas:)

```bash
$ sudo  apt-get install i2c-tools
$ sudo i2detect -y 1 (Para probar)
```



#### Actualización paquetes instalados y repositorios

```bash
$ sudo apt-get update
$ sudo apt-get upgrade
```
Si diese error ejecutar: sudo apt-get update --allow-releaseinfo-change 


#### Configuración de red

Cambiar la ip:

mirar con ifconfig donde esta la red si es eth0

```bash
$ sudo nano /etc/dhcpcd.conf
```

activar la parte de eth0 o copiar dicha parte:

```bash
interface eth0
static ip_address=192.168.1.130/24
static routers=192.168.1.1
static domain_name_servers=192.168.1.1
```

* Si la IP es del grupo 2 poner en static routers en lugar de 2.1 → 2.30

#### Archivos necesarios

Necesitamos tener las carpetas `daemon`, `rules`, y `soaraspberry` en la carpeta `/home/soa`. Es muy importante asegurarse de que el fichero `/home/soa/soaraspberry/soa.data` pertenezca al usuario `root`.

Si se van a copiar dichas carpetas desde un usb:

Listar las unidades, para saber en que unidad esta el pendrive

```bash
lsblk
```

Crear carpeta para montar en ella el pendrive

```bash
sudo mkdir /media/usb
```

Montar unidad usb en la carpeta que hemos creado y copiar el contenido

```bash
sudo mount /dev/sda1 /media/usb
scp -r /media/usb/raspberry/* /home/soa/
```



## 1.3 Sondas DS18B20

#### Configuración

Para la lectura de estas sonda usamos un driver ya existente. Para activarlo, primero editamos el archivo `/etc/modules` y añadimos la siguiente linea

```bash
ds2482
```

Ahora le tenemos que decir la direccion `I2C` donde se encuentra el bus `OneWire`, en nuestra placa, este bus se encuentra en la direccion `0x18`, para ello editamos el archivo `/etc/rc.local` y añadimos la siguiente linea antes de la instrucción `exit 0` 

```bash
echo ds2482 0x18 > /sys/bus/i2c/devices/i2c-1/new_device
```

Una vez hecho esto, reiniciamos la Raspberry.

```bash
sudo reboot now
```

Tras iniciar, comprobamos que todo funciona adecuadamente, para ello nos dirigimos a la carpeta `/sys/bus/w1/devices`, dentro de esta carpeta debería haber algo como lo siguiente:

```bash
total 0
lrwxrwxrwx 1 root root 0 Feb 19 09:03 28-0517b199acff
lrwxrwxrwx 1 root root 0 Feb 19 09:03 28-0517b1d1c6ff
lrwxrwxrwx 1 root root 0 Feb 19 08:54 w1_bus_master1
```

*Solo aparecerá dicho listado si hay alguna sonda conectada.

Los archivos que empiezan por `28` son las sondas que hay en el bus. Dentro de ellos esta toda la información acerca de la sonda.

## 1.4 Dali

#### Configuración

Por defecto, el puerto de los conversores Dali suele ser `/dev/ttyUSBx`, pero para que funcione correctamente y para que sea mas facil de identificar, necesitamos crear un enlace simbolico a esa ruta. 

Lo primero que debemos hacer es obtener el `devpath` del puerto, para ello deberemos ejecutar el siguiente comando:

```bash
ls -l /dev/ttyUSB	(solo aparecera un listado si hay algun usb para ello)
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

Ahora copiamos el archivo `sudo /home/soa/rules/dali.rules` a `/etc/udev/rules.d/`.

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

## 1.5 Software soaraspberry

#### Instalación

Situarnos en la carpeta soaraspberry

```
cd soaraspberry
```

El `Makefile` permite compilar el sistema de diferentes maneras, que haran que se comporte de forma distinta:

- Compilar el proyecto mostrando todos los mensajes por pantalla

```bash
$ sudo make debug
```

- Compilar el proyecto para ejecutarlo en modo demonio

```bash
$ sudo make prod
```

- Compilar el proyecto mostrando por pantalla solo las tramas que recibe por ethernet

```bash
$ sudo make custom MODO=DEBUG_TRAMA
```

- Compilar el proyecto mostrando por pantalla solo los datos obtenidos en las peticiones

```bash
$ sudo make custom MODO=DEBUG_DATO
```

- Compilar el proyecto mostrando por pantalla solo la respuesta que se envía al servidor

```bash
$ sudo make custom MODO=DEBUG_RESPUESTA
```

> IMPORTANTE: hemos detectado unos problemas al compilar el proyecto para ejecutarlo en modo demonio `prod`, produce que las comunicaciones con dali no funcionen correctamente, por ello actualmente compilamos el proyecto en modo `debug` o `custom`. Esto no influye si queremos ejecutarlo al inicio del S.O. y puede ejecutarse como si un demonio se tratara.

#### Configuración

Toda la configuración del sistema se encuentra el el fichero `soa.cof`.

- ###### Reles

  Los reles pueden ser de tres tipos:

  - **0** > Simple: el valor que llega, es el que se escribe
  - **1** > Cambio: llegue el valor que llegue siempre cambia su estado al contrario
  - **2** > Conmutado: Se hara la salida en función de una entrada y de el valor recibido

  Para configurarlos simplemente tenemos que modificar las directivas de `CONFIG_BORNA_SALIDA_x` de la borna deseada, con el modo deseado.

  Los reles configurados en modo `2` (conmutado), necesitan estar relacionados con una entrada para funcionar correctamente, para ello modificamos las directivas `REL_BORNA_SALIDA_x` en la sección `INPUT_RELAY_REL` indicando la borna de la entrada que tiene que leer antes de ejecutar la salida.

- ###### Entradas

  Las entradas pueden ser de dos tipos:

  - **0** > Simple: entrada normal
  - **1** > Contador: entrada contador de pulsos
  - **2** > Contador: entrada contador para la velocidad del viento
  - **3** > Pulsador: entrada de tipo pulsador
  
  Para configurar las entradas, tenemos que modificar las directivas de `CONFIG_BORNA_ENTRADA_x` indicando el modo deseado.
  
- ###### Monitor

	Si queremos que la placa mande mensajes de manera a activa a un servidor cada vez que ocurre algo debemos configurar la sección `MONITOR_MODULE`:
  
  - `LISTENING_ENABLED`: **0** o **1** indica si queremos o no habilitar este módulo
  - `LISTENING_SERVER_IP`: direccion IP del servidor de destino
  - `LISTENING_SERVER_PORT`: puerto del servidor de destino
  
- ###### Somfy
	
  Si queremos utilizar este software como interruptor manual para persianas y estores Somfy debemos configurar esta sección `SOMFY_MODULE`:
  
  - `BLINDS_ENABLED`: **0** o **1** indica si queremos o no habilitar este módulo
  - `BLINDS_CONFIGURED`: número de estores configurados (máximo 5)
  - `BLINDS_PORT_PATH`: ruta del puerto serie donde estan conectados las persianas y estores
  
  En Raspberry Pi se pueden configurar como máximo 5 persianas o estores ya que no se pueden conectar más de 5 interrputores físicamente. En función de la cantidad de persianas o estores que tengamos configurados debemos indicar en `BLINDX_NODE_ID` el ID de nodo de cada persiana o estor, de manera que por ejemplo si tenemos configuradas 3 persianas o estores, deberemos configurar `BLIND1_NODE_ID`, `BLIND2_NODE_ID`, `BLIND3_NODE_ID`.

## 1.6 Demonio

###### Instalación

Tenemos que copiar el archivo `/daemon/soaraspberry` a `/etc/init.d/`, despues tenemos que ejecutar los siguientes comandos:

```bash
$ sudo cp /home/soa/daemon/soaraspberry /etc/init.d/
$ sudo update-rc.d soaraspberry defaults
$ sudo update-rc.d soaraspberry enable
```

Esto nos habilita el servicio, y hace que se ejecuta cuando inicia el sistema operativo.

Ejecutamos el siguiente comando para iniciar el sistema:

```bash
$ sudo /etc/init.d/soaraspberry start
```

## 1.7 Configuracion proyecto camaras (comunicador)

#### Instalar el proyecto de las camaras:

1. En el proyecto comunicador antes de compilarlo hay que modificar en component.ts:
   1. Direccion: 	89.7.222.195  
   2. conferencia = destino de la hoja donde estan documentadas las DI utilizadas en cada sd. Ej: comunicacion_piscina
   3. comunicador = id de la hoja donde estan documentadas las DI utilizadas en cada sd. Ej: comunicador4
   4. En stun y tun = 89.7.222.194 (el puerto hay que dejar el mismo que esta).
2. Compilar proyecto: sudo ng build --base-href=./ --prod
3. Copiar el contenido de la carpeta dist/videoportero/ en /*var*/www/html



#### Probar las camaras en las monjas:

1. Poner la DI en el grupo 3

2. Conectar la camara y el raspberrry al router que esta en la mesa de al lado de las tables

3. En el mac:

4. 1. Abrir Chrome y poner en la barra de direcciones:
   2. 		89.7.222.195:9000/admin

   3. El usuario: admin y contraseña: admin
   4. Si estuviese todo ok me deberia aparecer en la pantalla listada la camara con el nombre de comunicador y conferencia que hemos puesto en el proyecto.



Si no funcionase:

1. Conectar raspberry, quitar en el archivo de configuracion autostart que se lance el proyecto solo.
2. Lanzar proyecto a mano copiando la manera de lanzarlo que esta en el archivo anterior pero quitando la opcion de kiosk
3. Quitar la opcion del raton en el archivo de configuracion
4. En chrome al lanzarlo manualmente , pulsamos F12 para ver si nos muestra algun error en el navegador.

Nota: *hay veces que si no funciona es por el tipo de camaraweb con el que estemos probando.

## 1.8 Puerto serie

Para que el puerto serie funcione de manera adecuada, es necesario realizar una configuración.

Primero ejecutamos:

```bash
$ sudo raspi-config
```

Nos dirigimos a `3 Interface Options` > `P6 Serial Port`. En el primer mensaje marcamos `No` y en el segundo mensaje marcamos `Yes`. Tras esta configuración habrá que reiniciar el sistema.

Ahora modificamos el archivo `/boot/config.txt` y comprobamos que las siguientes lineas esten presentes, si no lo estan, las añadimos al final:

```
enable_uart=1
dtoverlay=pi3-miniuart-bt
```

### Actualización `libserialport`

``` bash
# Remove current version of libserialport 
sudo apt-get purge libserialport* &&
# Get libserialport from git
git clone git://sigrok.org/libserialport &&
# Install necessary tools
sudo apt-get install autoconf &&
sudo apt-get install libtool &&
# Configure libserialport
cd libserialport
./autogen.sh &&
./configure &&
make &&
# Install libserialport
sudo make install &&
# Link libserialport to soaraspberry
sudo touch /etc/ld.so.conf.d/soaraspberry.conf &&
sudo bash -c "echo '/usr/local/lib/' > /etc/ld.so.conf.d/soaraspberry.conf" &&
ldconfig
```

## 1.9 WiringPi

WiringPi ya no esta disponible mediante la instalación tradicional. Para instalarlo hay que hacer lo siguiente:

```bash
$ git clone https://github.com/WiringPi/WiringPi.git
$ cd WiringPi
$ git pull origin
$ ./build
```

## 1.10 Drivers impresora HP

Para poder imprimir y escanear en impresoras HP debemos instalar lo siguiente:

```bash
$ sudo apt install snapd
$ sudo snap install core
$ sudo snap install hplip-printer-app --edge
$ sudo apt install sane sane-utils hplip imagemagick
```

## 1.11 Cambio dirección MAC

Para cambiar la dirección mac en `Raspberry Pi`, tenemos que modificar el archivo `/boot/cmdline.txt`. Dentro de este archivo, al final de la linea, debemos añadir lo siguiente:

```
smsc95xx.macaddr=XX:XX:XX:XX:XX:XX
```

Donde `XX:XX:XX:XX:XX:XX` es la nueva dirección MAC deseada.

# Actualización kernel

Update repository list
```bash
sudo apt-get update --allow-releaseinfo-change
```
Update repositories
```bash
sudo apt-get upgrade
```
Udate kernel
```bash
sudo rpi-update
```