[TOC]

# CONFIGURAR HOSTNAME

Modificar el archivo /etc/hostname, con el nombre que queremos

```bash
sudo nano /etc/hostname
```

Ejecutar:

```bash
sudo hostnamectl set-hosname “nombre”
```

Si despues de reiniciar no cogiese el cambio, modificar el archivo /etc/cloud/cloud.cfg, para cambiar a true el valor del parametro preserve_hostname (ubuntu server)

```bash
preserve_hostname:true
```



# INSTALAR MARIADB

```bash
$apt-get install mariadb-server mariadb-client
```

 **Instalacion usuario localhost mysql**

mysql -u root -proot

```mysql
use mysql; 
INSERT INTO user (Host,User,Password) VALUES ('%','localhost',PASSWORD('localhost'));

o 
 
CREATE USER localhost;
FLUSH PRIVILEGES;


UPDATE user SET Password = PASSWORD('localhost')  WHERE User = 'localhost' and Host='%';
FLUSH PRIVILEGES;

GRANT ALL PRIVILEGES ON *.* TO localhost@'%' IDENTIFIED BY 'localhost';
FLUSH PRIVILEGES;
```

Luego desde la terminal reinicio el servicio: 

```bash
 /etc/init.d/mysql restart
```

Permisos para usuarios remotos en la misma red

mysql -u root -proot

```mysql
GRANT ALL PRIVILEGES ON *.* TO 'localhost'@'HOST' IDENTIFIED BY 'PASSW' 
WITH GRANT OPTION; 
GRANT ALL PRIVILEGES ON *.* TO localhost@localhost IDENTIFIED BY 'localhost';

FLUSH PRIVILEGES;
```

Permisos para usuarios remotos en otra red

mysql -u root -proot

```mysql
GRANT ALL PRIVILEGES ON *.* TO 'localhost'@'80.33.0.120' IDENTIFIED BY 'PASSW' 
WITH GRANT OPTION; 
GRANT ALL PRIVILEGES ON *.* TO localhost@80.33.0.120 IDENTIFIED BY 'localhost';

FLUSH PRIVILEGES;
```

Hacerlo en el ordenador al que nos queramos conectar y además hay que abrir el puerto tcp donde vamos a hacer la conexión.



**Cambiar contraseña de root** ***(solo en el caso que se quiera cambiar)***

 mysql -u root -proot

```mysql
use mysql; 
update user set Password=PASSWORD('contraseña') where user='root'; 
flush privileges; 
quit;
```



Conocer version de Mariadb

```mysql
select version();
```

Actualizar Mariadb

```bash
sudo apt-get install software-properties-common
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
```

Para instalar Mariadb10.2

```bash
sudo sh -c "echo 'deb https://mirrors.evowise.com/mariadb/repo/10.2/ubuntu '$(lsb_release -cs)' main' > /etc/apt/sources.list.d/MariaDB102.list"
```



# INSTALAR GIT

```bash
$apt-get install git
```

Una vez completada la actualización, puede instalar Git:

```
sudo apt install git
```

Para confirmar que instaló Git correctamente, ejecute el siguiente comando y compruebe que recibe un resultado pertinente.

```
git --version
```



# INSTALAR CHROME

Opcion 1:

Primero descargamos el paquete con el Google Chrome más reciente:

```
wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
```

Cuando el proceso termine, actualizamos con el comando:

```
sudo apt-get update
```

Y una vez termine de actualizar instalamos la librería de indicadores de sistema para poder ver el icono de Google Chrome en nuestro lanzador (y algunos más):

```
sudo apt-get install libappindicator1
```

Y para terminar, instalamos Google Chrome:

```
sudo dpkg -i google-chrome-stable_current_amd64.deb
```





Opción 2:

Descargar e instalar la key

```bash
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
```

Ahora agregamos el repositorio oficial de Google Chrome en su versión estable.

```bash
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update
```

Ejecutamos la instalación del navegador web en su última versión estable.

```bash
sudo apt install google-chrome-stable
```

Para iniciar chrome, hacerlo desde la terminal:

```bash
google-chrome --args --user-data-dir="/tmp/chrome_dev_test" --disable-web-security --ignoer-certificate-errors

```



# INSTALAR VISUAL STUDIO

Actualizar el packages index e instalar las dependencias

```bash
sudo apt update
sudo apt install software-properties-common apt-transport-https wget
```

Despues importamos la llave GPG de Microsoft usando el [wget command](https://linuxize.com/post/wget-command-examples/?ref=hackernoon.com):

```
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
```

Habilitamos el repositorio de Visual Studio Code:

```bash
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
```

Una vez tengamos [habilitado el repositorio](https://linuxize.com/post/how-to-add-apt-repository-in-ubuntu/?ref=hackernoon.com), instalamos la ultima version de Visual Studio Code:

```bash
sudo apt update
sudo apt install code
```



## Configurar visual code studio:

1. Instalar desde la terminal las siguientes extensiones:

   ```
   code --install-extension Angular.ng-template
   code --install-extension be5invis.vscode-custom-css
   code --install-extension christian-kohler.path-intellisense
   code --install-extension DavidAnson.vscode-markdownlint
   code --install-extension DotJoshJohnson.xml
   code --install-extension EditorConfig.EditorConfig
   code --install-extension eg2.tslint
   code --install-extension eg2.vscode-npm-script
   code --install-extension emmanuelbeziat.vscode-great-icons
   code --install-extension eriklynd.json-tools
   code --install-extension esbenp.prettier-vscode
   code --install-extension felixfbecker.php-debug
   code --install-extension file-icons.file-icons
   code --install-extension GrapeCity.gc-excelviewer
   code --install-extension James-Yu.latex-workshop
   code --install-extension jamesmaj.easy-icons
   code --install-extension johnpapa.angular-essentials
   code --install-extension johnpapa.Angular2
   code --install-extension johnpapa.winteriscoming
   code --install-extension liximomo.remotefs
   code --install-extension Mikael.Angular-BeastCode
   code --install-extension minhthai.vscode-todo-parser
   code --install-extension ms-vscode.cpptools
   code --install-extension msjsdiag.debugger-for-chrome
   code --install-extension natewallace.angular2-inline
   code --install-extension PeterJausovec.vscode-docker
   code --install-extension PKief.material-icon-theme
   code --install-extension puorc.awesome-vhdl
   code --install-extension ritwickdey.LiveServer
   code --install-extension Shan.code-settings-sync
   code --install-extension small.php-ci
   code --install-extension steoates.autoimportc
   code --install-extension vsciot-vscode.vscode-arduino
   code --install-extension wayou.vscode-todo-highlight
   ```

2. Instalar paquete de lenguaje español:

   1. Pulsar Ctrl+Shift+P para activar la **Command Palette**, comience a teclear "config" para filtrar la lista de comandos disponibles, y luego seleccione el comando **Configure Language**
   2. En el lateral izquierdo aparecera un menu, para seleccionar el idioma que queremos instalar, una vez seleccionado, pulsar en Install
   3. Reiniciar visual code

3. Configurar para conectarnos en remoto:

   1. Archivo -> Preferencias -> configuracion 

   2. Pulsar en el boton izquierdo de la botonera de la derecha para que se abra la configuracion JSON, donde hay que crear una configuracion por cada conexion que queremos

      <img src="/home/esther/Imágenes/Captura de pantalla de 2021-05-06 09-42-09.png" style="zoom: 50%;" />

   <img src="/home/esther/Imágenes/Captura de pantalla de 2021-05-06 09-41-52.png" style="zoom: 50%;" />

4. Para conectarnos en remoto, pulsar en Ctrl+Shift +P y seleccionar la opcion de remote

   

# INSTALAR APACHE Y PHP

```bash
Para ubuntu 18
$apt-get install apache2 libapache2-mod-php7.4 php7.4-gd php7.4-mysql php7.4-imap php7.4.curl

Para ubuntu 20
apt-get install apache2 libapache2-mod-php7.4 php7.4-gd php7.4-mysql php7.4-imap php7.4.curl

$apt-get install curl (curl ifconfig.me para saber la ip publica)
```

Si necesitamos que se puedan llamar a funciones del soa con xmlrpc

```bash
sudo apt-get install php-xmlrpc php7.2-xmlrpc
```

Descomentar en php.ini la extension de xmlrpc, por que daba error: calt lo undefined function 	xmlrpc_encode_request()

```bash
En etc/php/7.2/apache/php.ini y en etc/php/72./cli/php.ini activar:
;extension=xmlrpc 
```

Reiniciar apache 

```bash
etc/init.d/apache2 restart
```

Solucionado el error anterior si aparece el error: call to undefined function curl_init()
```bash
En etc/php/7.2/apache/php.ini y en etc/php/72./cli/php.ini activar:
;extension=curl

Instalar php_curl (apt-get install php_curl)
Reiniciar apache etc/init.d/apache2 restart
```



# INSTALAR ANGULAR

```
sudo apt update; sudo apt upgrade

curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
```

 Instalar nodejs

```
sudo apt-get install -y nodejs
```

Instalar npm

```
sudo npm install npm@latest -g
```

Instalar angular cli

```
sudo npm install -g @angular/cli
```

Comprobar version intalada

```
comprobar : ng --version
```

# INSTALAR IONIC



# INSTALAR SOA

```bash
$apt-get install glib2.0
$apt-get install libserialport-dev
$apt-get install libmysqlclient-dev
$apt-get install libsdl-net1.2 libsdl-net1.2-dev
$apt-get install libcurl4 libcurl4-openssl-dev
$apt-get install libxmlrpc-c++8v5 (xmlrpc gnuapitools)
$apt-get install -y libwebsockets-dev (para utilizar websockets)
```

lib JSON-c: Ver documentacion https://github.com/json-c/json-c

```bash
$apt-get install libjson-c-dev (json)
$apt-get install cmake

git clone https://github.com/json-c/json-c.git
cd json-c
cmake ../json-c
make
make test
sudo make install

copiar las librerias que se han generado en /usr/lib/
$sudo cp libjson-c.so* /usr/lib/
```

Añadir al Makefile de libsoa

```c
CFLAGS += $(shell pkg-config --cflags json-c)
LDFLAGS += $(shell pkg-config --libs json-c)

CC= gcc -fPIC -Wall -pthread -g -c $(ABYSS_CFLAGS) $(CFLAGS) `pkg-config --cflags glib-2.0` `pkg-config --libs glib-2.0` $(RUTAINCLUDES) $(LLIBS) $(ABYSS_LIBS) $(LDFLAGS)
```

Añadir al Makefile de kernelsoa

```c
donde las fuentes: LLECTURA= $(shell pkg-config --cflags json-c)
donde las librerias : LIBS= $(shell pkg-config --libs json-c)
```



# INSTALAR SSH

```bash
$apt-get install openssh-client openssh-server
```

Configurar:

```bash
$nano /etc/ssh/sshd_config
			Port 22
			LoginGraceTime 30
			PermitRootLogin no
			MaxAuthTries 2
			MaxStartups 1
```

Para utilizarlo:

```bash
ssh -p puerto usuario@ip
```



# INSTALAR CODEIGNITER



VERSION 3

https://medium.com/@anuketjain007/how-to-install-codeigniter-on-ubuntu-18-04-d7b457a669e5

```
# cd /var/www/html
# wget https://github.com/bcit-ci/CodeIgniter/archive/3.1.9.zip
```

Extract the archive file and place in the document root.

```
# unzio 3.1.9.zip
# mv CodeIgniter-3.1.9/ codeigniter
```



VERSION 4 

Descargar la version 4:

```bash
wget -c https://github.com/codeigniter4/CodeIgniter4/archive/4.0.2.tar.gz -O CodeIgniter-4.0.2.tar.gz
```



Descomprimir archivo descargado

```bash
tar xzvf CodeIgniter-4.0.2.tar.gz
```

Mover la carpeta extraido

```
sudo mv CodeIgniter4-4.0.2 /var/www/myci.local
```

Cambiar los permisos

```
cd /var/www
sudo chown -R .www-data myci.local
sudo chmod -R 775 myci.local	
```



```
cd /etc/apache2/sites-available
sudo nano myci.local.conf
```



```
<VirtualHost *:80>
    ServerName myci.local
    DocumentRoot /var/www/myci.local/public
    <Directory /var/www/myci.local/public>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Require all granted
    </Directory>
    ErrorLog /var/log/apache2/myci.local_error.log
    CustomLog /var/log/apache2/myci.local_requests.log combined
</VirtualHost>	
```



```bash
sudo a2ensite myci.local.conf
sudo a2enmod rewrite
sudo systemctl restart apache2	
sudo systemctl status apache2	
```



Para crear un proyecto con codeigniter 4

Instalar CodeIgniter 4 mediante composer
Esta opción, como te comentaba, viene siendo la forma recomendada aunque en la web oficial está algo oculta.

para instalar CodeIgniter 4 vía composer, simplemente abre tu terminal o CMD y dentro de tu servidor web ejecutas el siguiente comando:

```bash
composer create-project codeigniter4/appstarter project-root
```

```
composer create-project codeigniter4/appstarter probando-ci4 --stability beta --no-dev
```

Especificamos `--stability beta` ya que el proyecto todavía no está estable y composer no dejaría clonarlo si no especificamos esto

La opción de `--no-dev` es para no instalar las dependencias del desarrollo de CodeIgniter, pues queremos usar CodeIgniter 4 para desarrollar apps, no queremos modificar el núcleo del mismo.



# INSTALAR SERVIDOR DE CORREO

```
apt-get install postfix postfix-mysql dovecot-core dovecot-imapd dovecot-pop3d dovecot-lmtpd dovecot-mysql mysql-server
```



# INSTALAR FUENTES

```
apt-get install msttcorefonts
```



# INSTALAR TYPORA

```bash
# or use
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -

# add Typora's repository
sudo add-apt-repository 'deb https://typora.io/linux ./'
sudo apt-get update

# install typora
sudo apt-get install typora
```



# INSTALAR PHPMYADMIN

Se recomienda también instalar estos paquetes:

- `php-mbstring`: módulo para administrar cadenas no-ASCII y convertir cadenas a diferentes codificaciones.
- `php-zip`: esta extensión admite la carga de archivos `.zip` a phpMyAdmin.
- `php-gd`: habilita la obtención de ayuda de [la biblioteca GD Graphics](https://en.wikipedia.org/wiki/GD_Graphics_Library).
- `php-json`: proporciona PHP con compatibilidad para serialización JSON.
- `php-curl`: permite que PHP interactúe con diferentes tipos de servidores utilizando diferentes protocolos.

```bash
sudo apt install phpmyadmin php-mbstring php-zip php-gd php-json php-curl
```

Estas son las opciones que debe elegir cuando se le solicite para configurar correctamente su instalación:

- Para la selección del servidor, elija `apache2`**Advertencia:** Cuando la línea de comandos aparece, “apache2” está resaltado, pero **no** está seleccionado. Si no pulsa `SPACE` para seleccionar Apache, el instalador *no* moverá los archivos necesarios durante la instalación. Pulse `ESPACIO,` `TAB` y luego `ENTER` para seleccionar Apache.

- Cuando se le pregunte si utiliza `dbconfig-common` para configurar la base de datos, seleccione `Yes`.

- Luego, se le solicitará elegir y confirmar una contraseña para la aplicación de MySQL para phpMyAdmin.

  

Habilitar la extensión PHP `mbstring`:

```bash
sudo phpenmod mbstring
```

 A continuación, reinicie Apache para que sus cambios surtan efecto:

```bash
sudo systemctl restart apache2
```



Para iniciarlo, poner en la barra del navegado:

```bash
http://localhost/phpmyadmin/
```

# INSTALAR MYSQL WORKBENCH

Descargar desde el navegador el paquete a instalar

```bash
https://dev.mysql.com/downloads/repo/apt/
```

Pulsar en el boton Download

<img src="https://linuxhint.com/wp-content/uploads/2020/08/1-13.png" alt="img" style="zoom:67%;" />

En la página siguiente, pulsar en No thanks

<img src="https://linuxhint.com/wp-content/uploads/2020/08/2-13.png" alt="img" style="zoom:67%;" />

Irnos a la carpeta donde se ha descargado, Ejemplo en Descargas

```
cd Descargas
```

Instalar paquete que se ha descargado, poner el nombre del paquete que se haya descargado

```
$ sudo apt install ./mysql-apt-config_0.8.15-1_all.deb
```

<img src="https://linuxhint.com/wp-content/uploads/2020/08/5-13-1024x198.png" alt="img" style="zoom:67%;" />

Durante la instalación, haz click en la opción de OK.

<img src="https://linuxhint.com/wp-content/uploads/2020/08/6-13.png" alt="img" style="zoom:67%;" />

Cuando se ha completado la instalacion, actualizar

```bash
$ sudo apt update
```

Instalar 

```bash
sudo apt install mysql-workbench-community
```



Opcion 2 

wget https://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community_8.0.15-1ubuntu18.10_amd64.deb

https://www.mysql.com/products/workbench/

sudo dpkg -i mysql-workbench*.deb

sudo apt -f install



# ABRIR PUERTOS 

iptables -A INPUT -p tcp --dport 1001 -j ACCEPT		 (Ej:lector huella)

Ubuntu: iptables -A INPUT -i eth0 -p tcp --destinationport 3307 -j ACCEPT

verificación:

iptables -L -n -v

Debe aparecer:



##### CONCOCER IP:

```
ifconfig
```

En ubuntu 20 para que funcione este comando, hay que instalar:

```bash
apt install net-tools
```



##### CONFIGURAR RED

```bash
nano  /etc/network/interfaces
```



```bash
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

# The loopback network interface
auto lo
iface lo inet loopback
auto eth0
iface eth0 inet static
	address 192.168.1.40
	netmask 255.255.255.0
	network	192.168.1.0
	broadcast 192.168.1.255
	gateway	 192.168.1.1

```

 

```bash
sudo reboot
```




​		



