# **Ubuntu Server**

## Instalación

Cuando carga el sistema de instalación pulsar X

En El Boot Manager, en la opcion de Select UEFI Boot Option, seleccionar la unidad en la que se encuentra el sistema de instalacion de ubuntu server. Ej: cambiar para que inicie desde el USB. Disk connected to from USB2 Data Traveler 3.0

```bash
Seleccionar en el menu: Install ubuntu server

Please choose your prefered Languaje (español)

Plese select your keyboard layaout below (español)

Welcome to Ubunto, ok

Seleccionar Use An enteri disk
```

 

```bash
Enter the username

Your name: soa
Your server’s name: servidor2
Pick a username: soa
password: adminr123

install open ssh server: OK
```


 There are popular snaps (no seleccionar ninguna)

Una vez instalado reiniciar

Quitar pendrive y reiniciar


 

## Configuración

### Instalar **MariaDB**

Para instalar MariaDB ejecutaremos el siguiente comando:**#** 

```bash
apt-get install mariadb-server mariadb-client
```


 Podemos comprobar que MariaDB esté funcionado ejecutando:

```bash
service mysql status
```


 Deberíamos ver algo tipo:

```
● mysql.service – LSB: Start and stop the mysql database server daemon
 Loaded: loaded (/etc/init.d/mysql; bad; vendor preset: enabled)
 Active: active (running) Fri xxxx-xx-xx xx:xx:xx CEST; 17s ago
```

Ahora procederemos a configurar MariaDB ejecutando el código:

```bash
/usr/bin/mysql_secure_installation
```

 En el primer paso nos preguntará por la contraseña de “root” para **MariaDB**, pulsaremos la tecla enter ya que no hay contraseña definida.
 El siguiente paso nos preguntará si queremos asignar una contraseña para el usuario “root”. Es recomendable usar contraseña.
 El siguiente paso nos preguntará si queremos eliminar usuario anónimo, aquí indicaremos que Sí queremos borrar los datos.
 El siguiente paso nos preguntará si queremos desactivar que el usuario “root” se conecte remotamente, aquí indicaremos que Sí queremos desactivar acceso remoto para usuario “root”.
 El siguiente paso nos preguntará si queremos eliminar la base de datos “test”, aquí indicaremos que Sí queremos borrar las base de datos “test”.
 El siguiente paso nos preguntará si queremos recargar privilegios, aquí indicaremos que Sí.

###    

### Instalar PHP **y apache**

```bash
apt-get install apache2 libapache2-mod-php7.2 php7.2-gd php7.2-mysql php7.2-imap php7.2.curl
apt-get install curl (curl ifconfig.me para saber la ip publica)

```

Instalar SOA:

```
apt-get install glib2.0
apt-get install libserialport-dev
apt-get install libmysqlclient-dev
apt-get install libsdl-net1.2 libsdl-net1.2-dev
apt-get install libcurl4 libcurl4-openssl-dev
apt-get install libxmlrpc-c++8 (xmlrpc gnuapitools)
```

Probar la configuracion:

1. copiar el soa y compilar

2. copiar un proyecto en *var/www/html, crear un sitio a2ensite proyecto y despues desde un pc que esté en la misma dp, poner en el navegador la di del servidor que acabamos de instalar/nombre_proyecto*

*Ej: 192.168.1.37/kernelloav2 (y aparecerá el LOA donde programamos los sistemas)*



**Pte: clave root (ahora esta adminr123)**

**Pte: hay que crear algun usuario en especial en mysql, he creado localhost**

**Pte: Hay que instalar algo mas?** 

**Pte: hay que configurar algun archivo?**



#### Cambiar ip:

En U*buntu Server 20.04 LTS*, deberemos editar el archivo de configuración correspondiente (en nuestro ejemplo, 00-installer-config.yaml) y realizar las modificaciones oportunas.

```
sudo nano /etc/netplan/00-installer-config.yaml
```

Una vez que nos encontramos en la ventana de trabajo de *nano*, lo primero será cambiar el valor **dhcp4**: true por dhcp4: false o *\*dhcp4:\** *\*no\**. Después, escribiremos los valores de configuración de la red, que serán parecidos a estos:

```bash
network:
  ethernets:
    enp0s3:
      dhcp4: no
      addresses: [192.168.1.10/24]
      gateway4: 192.168.1.1
      nameservers:
         addresses: [208.67.222.222]
  version: 2
```

**Para aplicar los cambios**

```bash
sudo netplan apply
```





##### Cambiar hostname (ahora esta servidor1)

Modificar el archivo /etc/hostname, con el nombre que queremos

```bash
sudo hostnamectl set-hosname “nombre”
```

Si despues de reiniciar no cogiese el cambio, modificar el archivo /*etc*/cloud/cloud.cfg, para cambiar a true el valor del parametro preserve_hostname.



No es algo habitual pero a veces cuando se trabaja con servidores, en caso de avería, o en cualquier otra circunstancia, aparece la necesidad de usar una memoria USB sin disponer de ningún entorno gráfico.

Para poder montar la memoria USB desde la terminal y sin la necesidad de ningún entorno gráfico que automonte la memoria, tan solo tenemos que seguir los siguientes pasos:

1.  CREAR EL DIRECTORIO PARA MONTAR LA MEMORIA USB

   El primer paso a realizar es crear el directorio en que queremos montar la memoria USB. Para crear el directorio en que queremos montar la memoria USB, tecleamos el siguiente comando en la terminal:

   ```bash
   mkdir /media/usb
   ```

   Nota: Este comando lo que hace es crear una carpeta con nombre media, y dentro de la carpeta con nombre media se creara otra carpeta con el nombre usb. En la ubicación /media/usb que acabamos de crear es donde estarán y se montarán la totalidad de archivos y directorios que tenemos en nuestra memoria USB.

   Nota: En el caso que queramos montar 2 memorias USB de forma simultanea tan solo tendríamos que montar otra ubicación, como por ejemplo /media/usb2, y aplicar los pasos que mostraremos a continuación para cada una de las memorias y directorios que hemos creado.

2.  IDENTIFICAR EL NOMBRE DE LA UNIDAD QUE QUEREMOS MONTAR.

   Cada dispositivo que conectamos a nuestro sistema operativo se reconoce con un nombre determinado. Ahora lo que tenemos que hacer es averiguar con que nombre se reconoce nuestra memoria USB. Para ello tecleamos el siguiente comando en la terminal sin tener el USB enchufado en el ordenador:

   ```bash
   ls -l /dev/sd*
   ```

   Una vez tecleado el comando ls aparecerá un resultado similar al siguiente:

   ```bash
    brw-rw--- T 1 root disc 8, 0 mar 16 11:21 /dev/sda
    brw-rw--- T 1 root disc 8, 1 mar 16 11:21 /dev/sda1
    brw-rw--- T 1 root disc 8, 2 mar 16 11:21 /dev/sda2
    brw-rw--- T 1 root disc 8, 5 mar 16 11:21 /dev/sda5
   ```

   Esto simplemente nos indica que nuestro ordenador tiene un solo dispositivo con el nombre ***\*sda\**** que es nuestro disco duro. ***\*sda1, sda2 y sda5\**** serán las distintas particiones que tiene nuestro disco duro que en mi caso son la boot, la root y la home.

   Seguidamente enchufamos el dispositivo USB en el ordenador y tecleamos de nuevo el mismo comando en la terminal:

   ```bash
   ls -l /dev/sd*
   ```

   Ahora aparte del contenido que aparecía antes aparecerá contenido adicional. El contenido adicional que aparecerá hace referencia a nuestra memoria USB y será algo parecido a lo siguiente:

   ```bash
   brw-rw--- T 1 root disc 8, 0 mar 16 11:21 /dev/sda
   brw-rw--- T 1 root disc 8, 1 mar 16 11:21 /dev/sda1
   brw-rw--- T 1 root disc 8, 2 mar 16 11:21 /dev/sda2
   brw-rw--- T 1 root disc 8, 5 mar 16 11:21 /dev/sda5
   brw-rw--- T 1 root floppy 8, 16 mar 16 11:24 /dev/sdb
   brw-rw--- T 1 root floppy 8, 17 mar 16 11:24 /dev/sdb1
   ```

   Como se puede en la salida del comando ha aparecido un dispositivo nuevo con nombre /dev/sdb el cual contiene una partición con nombre sdb1\. Sin duda se trata de nuestra memoria USB y *\*la partición que estábamos buscando y tenemos que montar es la /dev/sdb1.

3. MONTAR LA MEMORIA USB CON LA TERMINAL

   Con la información que tenemos ya podemos montar la memoria USB. En mi caso el sistema de archivos de mi memoria USB es FAT. Por lo tanto ***\*en el caso que sistema de archivos de la memoria USB o pendrive sea\**** **[\**FAT\**](https://es.wikipedia.org/wiki/ExFAT)** ***\*el comando a usar para montar la memoria USB es el siguiente:\****

   ```
   mount -t vfat /dev/sdb1 /media/usb
   ```

   Nota: La palabra mount indica montar. Con el parámetro -t vfat estamos especificando que el sistema de archivos a montar es del tipo FAT. /dev/sdb1 es la partición de nuestra memoria USB y /media/usb es el directorio en que se montará el contenido de la partición /dev/sdb1 de nuestra memoria USB.

   En el caso que mi memoria USB estuviera formateada en [\*NTFS\*](https://es.wikipedia.org/wiki/NTFS)* el comando para montar la memoria USB seria el siguiente:

   ```
   mount -t ntfs-3g /dev/sdb1 /media/usb
   ```

   Nota: La palabra mount indica montar. Con el parámetro -t ntfs-3g estamos especificando que el sistema de archivos a montar es del tipo NTFS. /dev/sdb1 es la partición de nuestra memoria USB y /media/usb es el directorio en que se montará el contenido de la partición /dev/sdb1 de nuestra memoria USB.

   En el caso poco probable que alguien tenga formateada su memoria USB en formato[\**ext4\*](https://es.wikipedia.org/wiki/Ext4)** el comando para montar la memoria USB debería ser el siguiente:

   ```bash
   mount -t ext4 /dev/sdb1 /media/usb
   ```

   Nota: La palabra mount indica montar. Con el parámetro -t ext4 estamos especificando que el sistema de archivos a montar es del tipo ext4. *\*/dev/sdb1\** es la partición de nuestra memoria USB y /media/usb es el directorio en que se montará el contenido de la partición /dev/sdb1 de nuestra memoria USB.

4. REALIZAR LAS OPERACIONES QUE TENEMOS QUE REALIZAR

   Una vez realizados todos estos pasos ya tenemos la memoria USB montada y es plenamente operativa.

   Ahora mediante la introducción de comandos en la terminal ya podemos renombrar archivos dentro de nuestra memoria USB, copiar archivos del disco duro a la memoria USB, etc. Solo para mostrarles un ejemplo:

   Tal y como podemos ver en la captura de pantalla si queremos ver el contenido que tenemos en nuestra memoria USB tan solo tenemos que teclear el comando:

   ```bash
   ls /media/usb
   ```

   Si quieren realizar otras operaciones diferentes a la mencionada tan solo tendrán que usar el comando pertinente.

5. DESMONTAR LA MEMORIA USB

   Una vez hayamos terminado de realizar todo lo que tenemos que realizar con la memoria usb tan solo tenemos que desmontarla. Para desmontarla tienen que introducir el siguiente comando en la terminal:

   ```bash
   umount /media/usb
   ```

    
    