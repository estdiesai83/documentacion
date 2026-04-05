[TOC]

# Implementar sistema nuevo

Conectarno al servidor donde vamos a poner el sistema

```
Ejemplo:

```



## SOA

Crear en el servidor carpeta con nombre de proyecto donde vamos a pasar el soa (libsoa y kernelsoa)

```bash
Ej: sistema_pr_montecerrado
mkdir sistema_pr_montecerrado
```

Una vez pasado el soa:

Modificar el fichero con la configuracion necesaria (en libsoa/config)

```bash
Cambiar los parametros con los valores del sistema que vamos a implementar

[DB]
Db = sistema_pr_montecerrado
Host = localhost
User = fincahazard
Pass = Fin-1503
Channel = 3306

[RPC]
Port = 463


[WEBSOCKET]
Port = 1514
Ip = 127.0.0.1

[LOG]
Trace = /home/soa/sistema_pr_montecerrado/kernelsoa_unitpbd_v2/kernel/logs/trace.log
Debug = /home/soa/sistema_pr_montecerrado/kernelsoa_unitpbd_v2/kernel/logs/debug.log
Info = /home/soa/sistema_pr_montecerrado/kernelsoa_unitpbd_v2/kernel/logs/info.log
Warn = /home/soa/sistema_pr_montecerrado/kernelsoa_unitpbd_v2/kernel/logs/warn.log
Error = /home/soa/sistema_pr_montecerrado/kernelsoa_unitpbd_v2/kernel/logs/error.log
Fatal = /home/soa/sistema_pr_montecerrado/kernelsoa_unitpbd_v2/kernel/logs/fatal.log


[SYSTEM]
Pid = /var/run/kernelsoa_pr_montecerrado.pid

[STATUS]
Input = 150
Output = 150

[SMS_status]
Phone1 = 650286107
```



Modificar en el Makefile de libsoa/fuentes y guardar cambios

```bash
LIBLECTURA=libsoanombresistema

Ej: LIBLECTURA=libsoaprmontecerrado
```

Compilar el soa, desde libsoa/fuente para que se genere la libreria con el nombre del sistema

```
cd libsoav1/fuentes
make clean
make
```



Modificar en el Makefile de kernelsoa/fuentes, para que busque la libreria del sistema y guardar cambios

```bash
LIBS= -lpthread -lmysqlclient -ldl -lsoanombresistema -lNBioBSP -lcurl

Ej: LIBS= -lpthread -lmysqlclient -ldl -lsoaprmontecerrado -lNBioBSP -lcurl
```

Compilar

```bash
cd kernelsoa/fuentes
make clean
make
```



Crearnos un fichero ej: kernelsoa.conf donde vamos a poner las rutas de los diferente sistemas (soa) que queremos lanzar en la siguiente ruta:

```bash
cd /etc/ld.so.conf.d
sudo nano kernelsoa.conf
```

Dentro del fichero que nos creamos, escribir la ruta donde se encuentren los sistemas que queremos ejecutar, ejemplo:

```bash
/home/soa/nombre_sistema1/libsoav1/eNBSP/bin
/home/soa/nombre_sistema1/libsoav1/libreria
/home/soa/nombre_sistema1/libloav1/libreria

/home/soa/nombre_sistema2/libsoav1/eNBSP/bin
/home/soa/nombre_sistema2/libsoav1/libreria
/home/soa/nombre_sistema2/libloav1/libreria
```

1. Ejecutar comando para guardar los cambios.

   ```bash
   ldconfig
   ```

   

2. Crear un archivo kernelsoa_x por cada soa que queramos iniciar, con el contenido siguiente

   si el soa a utilizar es la última version

   ```
   #!/bin/sh
   
   ### BEGIN INIT INFO
   # Provides:           kernelsoa_pr_montecerrado
   # Required-Start:     $local_fs $network $syslog mysql
   # Required-Stop:      $local_fs $network $syslog
   # Default-Start:      2 3 4 5
   # Default-Stop:       0 1 6
   # Short-Description:  kernelsoa_pr_montecerrado
   # Description:        kernelsoa_pr_montecerrado
   ### END INIT INFO
   
   NAME="kernelsoa_pr_montecerrado"
   PATH="/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin"
   APPDIR="/home/soa/sistema_pr_montecerrado/kernelsoa_unitpbd_v2/kernel"
   APPBIN="/home/soa/sistema_pr_montecerrado/kernelsoa_unitpbd_v2/kernel/kernelsoa"
   APPARGS="sistema_pr_montecerrado"
   USER="root"
   GROUP="root"
   
   # pid file for the daemon
   PIDFILE="/var/run/kernelsoa_pr_montecerrado.pid"
   
   # Include functions 
   set -e
   . /lib/lsb/init-functions
   
   start() {
      printf "Starting '$NAME'... "
      start-stop-daemon --start --chuid "$USER:$GROUP" --background --chdir "$APPDIR" --exec "$APPBIN" -- $APPARGS || true
      printf "done\n"
   }
   
   
   stop() {
     printf "Stopping '$NAME'... "
     kill -9 `cat $PIDFILE`
     printf "done\n"
   }
   
   status() {
     # Check the status of the process.
     if [ -e $PIDFILE ]; then
       status_of_proc -p $PIDFILE $APPBIN "$NAME process" && exit 0 || exit $?
     else
       log_daemon_msg "$NAME Process is not running"
       log_end_msg 0
     fi
   }
   
   case "$1" in
     start)
       start
       ;;
     stop)
       stop
       ;;
     restart)
       stop
       start
       ;;
     status)
       status
       ;;
     *)
       echo "Usage: $NAME {start|stop|restart|status}" >&2
       exit 1
       ;;
   esac
   
   exit 0
   
   ```

   Si el soa a implemetar es antiguo:

   ```
   #!/bin/sh
   
   ### BEGIN INIT INFO
   # Provides:           kernelsoa_hazard
   # Required-Start:     $local_fs $network $syslog mysql
   # Required-Stop:      $local_fs $network $syslog
   # Default-Start:      2 3 4 5
   # Default-Stop:       0 1 6
   # Short-Description:  kernelsoa_hazard
   # Description:        kernelsoa_hazard
   ### END INIT INFO
   
   NAME="kernelsoa_hazard"
   PATH="/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin"
   #APPDIR="/home/soa/sistema_hazard/kernelsoa_unitp/kernel"
   APPDIR="/"
   APPBIN="/home/soa/sistema_hazard/kernelsoa_unitp/kernel/kernelsoa"
   APPARGS="sistema_hazard"
   USER="root"
   GROUP="root"
   
   # Include functions 
   set -e
   . /lib/lsb/init-functions
   
   start() {
      printf "Starting '$NAME'... "
      start-stop-daemon --start --chuid "$USER:$GROUP" --background --chdir "$APPDIR" --exec "$APPBIN" -- $APPARGS || true
      printf "done\n"
   }
   
   
   stop() {
     printf "Stopping '$NAME'... "
     kill $(pgrep $NAME)
     printf "done\n"
   }
   
   status() {
     status_of_proc $NAME && exit 0 || exit $?
   }
   
   case "$1" in
     start)
       start
       ;;
     stop)
       stop
       ;;
     restart)
       stop
       start
       ;;
     status)
       status
       ;;
     *)
       echo "Usage: $NAME {start|stop|restart|status}" >&2
       exit 1
       ;;
   esac
   
   exit 0
   ```

   

   Donde los parametros a modificar son:

   Necesitas tener un fichero de estos por cada soa que tengas

   Provides, Short-Description y Description por ‘kernelsoa_mariano’

   NAME : ejemplo "kernelsoa_mariano"

   APPBIN: ruta donde se encuentra el ejecutable de kernelsoa que queremos iniciar

   APPARGS: nombre del sistema que en este caso seria mariano

   

   Pasar dicho archivo/s a  a `/etc/init.d`

   Y ejecutar lo siguiente por cada archivo

   ```bash
   sudo update-rc.d kernelsoa-montecerrado defaults
   sudo update-rc.d kernelsoa-montecerrado enable
   ```

Si hay que hacer algun cambio

```bash
sudo update-rc.d kernelsoa-montecerrado remove
sudo update-rc.d kernelsoa-montecerrado defaults
sudo update-rc.d kernelsoa-montecerrado enable
```

Para arrancar el soa

```bash
sudo /etc/init.d/kernelsoa_pr_montecerrado stop
sudo /etc/init.d/kernelsoa_pr_montecerrado start
```





## SOAJS

Crear en el servidor en /var/www/html una carpeta con nombre sistema

```bash
Ej: sistema_pr_montecerrado
cd /var/www/html/
mkdir soajs-pr-montecerrado
```

En dicha carpeta clonar el soajs del git, para ello cambiarno de usuario a subiw

```bash
su subiw
pass: adminr123

Dentro de la carperta soajs-pr-montecerrado
git clone ssh://robert@192.168.1.30:/opt/git/soa/soajs.git
pass: robert
```

Despues de clonar el proyecto, crear un enlace con el nombre del proyecto que posteriormente arrancaremos con pm2

```bash
ln -s soajs_v2/bin/soajs soajs-pr-montecerrado
```

Iniciar proyecto con pm2, para ello debemos volver a usuario soa

```bash
Iniciar desde la carpeta donde se encuentra el enlace

pm2 start soajs-pr-montecerrado

Si hay que reinicar el soajs
pm2 soajs-pr-montecerrado 
```



## API

En el servidor en /var/www/html/ en el proyecto monjas.hometech.red (contiene la api general para los nuevos proyectos), hay que añadir la configuracion del nuevo sistema:

Modificar en /api/app/Config/Services en ubicacion, añadir el em correspondiente a la configuracion de la bd

```php
switch ($GLOBALS['BD_UBICACION']) {
	case 1: // pr-montecerrado
		$em = $doctrine->pr_montecerrado;
	break;
	case 2: // montecerrado
		$em = $doctrine->montecerrado;
	break;
	case 3: // rudy_v2
		$em = $doctrine->rudy;
	break;
}
```



Modificar en api/app/Libraries/Doctrine.php para incluir la configuracion de la bd:

```php
Declarar:
public $pr_montecerrado;

$connection_pr_montecerrado = array(
         'driver'        => 'pdo_mysql',
         'user'            => 'fincahazard',
         'password'    => 'Fin-1503',
         'host'            => 'localhost',
         'dbname'        => 'sistema_pr_montecerrado',
         'charset'        => 'utf8',
         'driverOptions'    => array(
         'charset'    => 'utf8',
         ),
      );
      
      
$this->pr_montecerrado = EntityManager::create($connection_pr_montecerrado, $config);
```

Modificar en api/app/Libraries/_Data.php en writeConfigurationGlobal, para que llene las variables globales que va a utilizar el proyecto

```php
case 1 : //pr_montecerrado
	$GLOBALS['PORT_RPC'] = 463;
    $GLOBALS['URL_RPC'] = "http://localhost:463/RPC2";

	$GLOBALS['PORT_UPDATE'] = 1514;
    $GLOBALS['ADDRESS_UPDATE'] = "127.0.0.1";

	$GLOBALS["URL_SOAJS"]="https://soajs-pr-montecerrado.hometech.red/";
    break;
```

* las variables globales estan declaradas en /api/app/Config/Constans.php al final del fichero
* El proyecto tiene que tener permisos 777 en la carpeta writable/cache y writable/session



NOTAS:

*cambiar pr_montecerrado por el sistema que se vaya a implementar

