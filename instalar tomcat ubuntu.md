# INSTALAR TOMCAT UBUNTU



## Cómo instalar Tomcat 10 en Ubuntu 24.04 LTS

22 mayo, 2024 por [El Instalador](https://comoinstalar.me/author/instalador/)

En esta entrada vamos a ver **cómo instalar Tomcat 10 en Ubuntu 24.04 LTS Noble Numbat** paso a paso, de modo que podremos desplegar aplicaciones Java para servidor ajustadas a las especificaciones de la plataforma Jakarta EE 9, utilizando las capacidades de tu servidor o **[VPS Ubuntu](https://comoinstalar.me/do)**.

Contenido [[ocultar](https://comoinstalar.me/como-instalar-tomcat-10-en-ubuntu/#)]

- [Antes de instalar Tomcat 10 en Ubuntu 24.04 LTS Noble Numbat](https://comoinstalar.me/como-instalar-tomcat-10-en-ubuntu/#Antes_de_instalar_Tomcat_10_en_Ubuntu_2404_LTS_Noble_Numbat)
- [Cómo descargar Tomcat 10 para Ubuntu 24.04 LTS](https://comoinstalar.me/como-instalar-tomcat-10-en-ubuntu/#Como_descargar_Tomcat_10_para_Ubuntu_2404_LTS)
- Cómo instalar Tomcat 10 en Ubuntu 24.04 LTS
  - [Archivos de la plataforma](https://comoinstalar.me/como-instalar-tomcat-10-en-ubuntu/#Archivos_de_la_plataforma)
  - [Configurar e iniciar el servicio](https://comoinstalar.me/como-instalar-tomcat-10-en-ubuntu/#Configurar_e_iniciar_el_servicio)
  - [Firewall](https://comoinstalar.me/como-instalar-tomcat-10-en-ubuntu/#Firewall)
  - [Cómo acceder a Tomcat 10](https://comoinstalar.me/como-instalar-tomcat-10-en-ubuntu/#Como_acceder_a_Tomcat_10)
- Cómo configurar Tomcat 10 en Ubuntu 24.04 LTS
  - [Acceso desde red a las aplicaciones administrativas](https://comoinstalar.me/como-instalar-tomcat-10-en-ubuntu/#Acceso_desde_red_a_las_aplicaciones_administrativas)
  - [Usuarios en Tomcat 10](https://comoinstalar.me/como-instalar-tomcat-10-en-ubuntu/#Usuarios_en_Tomcat_10)
  - [Acceso a las aplicaciones administrativas de Tomcat 10](https://comoinstalar.me/como-instalar-tomcat-10-en-ubuntu/#Acceso_a_las_aplicaciones_administrativas_de_Tomcat_10)
- [Cómo desplegar aplicaciones en Tomcat 10 sobre Ubuntu 24.04 LTS](https://comoinstalar.me/como-instalar-tomcat-10-en-ubuntu/#Como_desplegar_aplicaciones_en_Tomcat_10_sobre_Ubuntu_2404_LTS)
- [Conclusión](https://comoinstalar.me/como-instalar-tomcat-10-en-ubuntu/#Conclusion)



## Antes de instalar Tomcat 10 en Ubuntu 24.04 LTS Noble Numbat

Con el fin de poder seguir los pasos de esta **guía de instalación de Tomcat 10 en Ubuntu 24.04 LTS Noble Numbat** será necesario partir del siguiente escenario:



Un sistema Ubuntu 24.04 LTS Noble Numbat actualizado.Entorno de ejecución de Java 11.Acceso a línea de comandos con un usuario con permisos de *sudo*.Conexión a Internet.



Si no dispones todavía del entorno necesario, es posible que te interese nuestra [guía de instalación de Java en Ubuntu 24.04 LTS](https://comoinstalar.me/como-instalar-java-en-ubuntu/).

### Cómo descargar Tomcat 10 para Ubuntu 24.04 LTS

Vamos a **descargar Tomcat 10 para Ubuntu 24.04 LTS Noble Numbat** desde la [página de descargas](https://tomcat.apache.org/download-10.cgi) del sitio oficial, donde encontraremos la última versión estable:

![como descargar tomcat 10 para ubuntu 24.04 lts noble numbat](https://comoinstalar.me/wp-content/uploads/2024/05/como-descargar-tomcat-10-para-ubuntu-24.04-lts.jpg)



Encontraremos el paquete en varios formatos, siendo el más interesante para Ubuntu 24.04 el formato *[.tar.gz](https://downloads.apache.org/tomcat/tomcat-10/v10.1.24/bin/apache-tomcat-10.1.24.tar.gz)*, que podremos descargar directamente desde el navegador o, si trabajamos remotamente, desde consola con el comando *wget*:

```
wget https://downloads.apache.org/tomcat/tomcat-10/v10.1.24/bin/apache-tomcat-10.1.24.tar.gz
```



## Cómo instalar Tomcat 10 en Ubuntu 24.04 LTS

Vamos a **instalar Tomcat 10 en Ubuntu 24.04 LTS Noble Numbat** preparando la plataforma como un servicio más que corra en el sistema utilizando su propio usuario y grupo. Para ello, seguiremos los siguientes pasos.

### Archivos de la plataforma

Creamos el nuevo usuario *tomcat*:

```bash
sudo useradd -U -m -d /opt/tomcat -k /dev/null -s /bin/false tomcat
```

A continuación descomprimimos el paquete que acabamos de descargar directamente en su ubicación definitiva:

```
sudo tar xf apache-tomcat-10.1.24.tar.gz -C /opt/tomcat/
```

Asignamos como propietario de los archivos de Tomcat 10 el usuario *tomcat* que hemos creado:

sudo chown -R tomcat: /opt/tomcat/

Como el nombre del directorio de instalación de Tomcat 10 contiene números de versión, podemos crear un enlace simbólico sin números para facilitar la instalación y configuración:

sudo ln -s /opt/tomcat/apache-tomcat-10.1.24/ /opt/tomcat/apache-tomcat

### Configurar e iniciar el servicio

Para poder **lanzar Tomcat 10 como servicio de Ubuntu 24.04 LTS**, creamos un archivo de unidad para Systemd:

```
sudo nano /etc/systemd/system/tomcat10.service
```

El contenido será el siguiente:

```
[Unit]
Description=Tomcat 10.1 servlet container para Ubuntu 24.04 LTS Noble Numbat
After=network.target

[Service]
Type=forking
User=tomcat
Group=tomcat
Environment="JAVA_OPTS=-Djava.security.egd=file:///dev/urandom"
Environment="CATALINA_BASE=/opt/tomcat/apache-tomcat"
Environment="CATALINA_HOME=/opt/tomcat/apache-tomcat"
Environment="CATALINA_PID=/opt/tomcat/apache-tomcat/temp/tomcat.pid"
Environment="CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC"
ExecStart=/opt/tomcat/apache-tomcat/bin/startup.sh
ExecStop=/opt/tomcat/apache-tomcat/bin/shutdown.sh

[Install]
WantedBy=multi-user.target
```

Una vez guardado el archivo, podemos iniciar el servicio con el comando *systemctl*:

```
sudo systemctl start tomcat10
```

Para comprobar el estado del servicio en cualquier momento, usaremos el comando 

```
systemctl status tomcat10
```



![como instalar tomcat 10 en ubuntu 24.04 lts noble numbat](https://comoinstalar.me/wp-content/uploads/2024/05/instalar-tomcat-10-en-ubuntu-24.04-lts.jpg)

<iframe id="aswift_3" name="aswift_3" sandbox="allow-forms allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" width="800" height="280" frameborder="0" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no" allow="attribution-reporting; run-ad-auction" src="https://pagead2.googlesyndication.com/pagead/ads?client=ca-pub-1352786918533997&amp;output=html&amp;h=280&amp;adk=1390000937&amp;adf=3477821296&amp;pi=t.aa~a.1227787690~i.70~rp.4&amp;w=800&amp;abgtt=9&amp;fwrn=4&amp;fwrnh=100&amp;lmt=1730949546&amp;num_ads=1&amp;rafmt=1&amp;armr=3&amp;sem=mc&amp;pwprc=5499789071&amp;ad_type=text_image&amp;format=800x280&amp;url=https%3A%2F%2Fcomoinstalar.me%2Fcomo-instalar-tomcat-10-en-ubuntu%2F&amp;fwr=0&amp;pra=3&amp;rh=200&amp;rw=800&amp;rpe=1&amp;resp_fmts=3&amp;wgl=1&amp;fa=27&amp;uach=WyJMaW51eCIsIjYuOC4wIiwieDg2IiwiIiwiMTI5LjAuNjY2OC44OSIsbnVsbCwwLG51bGwsIjY0IixbWyJHb29nbGUgQ2hyb21lIiwiMTI5LjAuNjY2OC44OSJdLFsiTm90PUE_QnJhbmQiLCI4LjAuMC4wIl0sWyJDaHJvbWl1bSIsIjEyOS4wLjY2NjguODkiXV0sMF0.&amp;dt=1730970466164&amp;bpp=1&amp;bdt=1489&amp;idt=1&amp;shv=r20241031&amp;mjsv=m202410310101&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;eo_id_str=ID%3Db3b19dc7d796e0dc%3AT%3D1730970466%3ART%3D1730970466%3AS%3DAA-Afja1FvbSWXL8qXvzADv88R6A&amp;prev_fmts=0x0%2C1200x280%2C800x280&amp;nras=4&amp;correlator=7859287748794&amp;frm=20&amp;pv=1&amp;u_tz=60&amp;u_his=1&amp;u_h=768&amp;u_w=1366&amp;u_ah=694&amp;u_aw=1366&amp;u_cd=24&amp;u_sd=1&amp;dmc=8&amp;adx=116&amp;ady=5215&amp;biw=1351&amp;bih=607&amp;scr_x=0&amp;scr_y=2803&amp;eid=44759875%2C44759926%2C42532760%2C95331832%2C95344189%2C31088654%2C95345966&amp;oid=2&amp;psts=AOrYGsnFSG1QOoQ18k_6TJorV7E_IEb_v5SwIZ0xTTRkADPsjIq6VPjHymdYohb3_OBW1fOH-dbIN0cD4Nnu3Y9WPbiO&amp;pvsid=3331529194439763&amp;tmod=563363819&amp;uas=3&amp;nvt=1&amp;ref=https%3A%2F%2Fwww.google.com%2F&amp;fc=1408&amp;brdim=0%2C32%2C0%2C32%2C1366%2C32%2C1366%2C694%2C1366%2C607&amp;vis=1&amp;rsz=%7C%7Cs%7C&amp;abl=NS&amp;fu=128&amp;bc=31&amp;bz=1&amp;td=1&amp;tdf=0&amp;nt=1&amp;ifi=4&amp;uci=a!4&amp;btvi=2&amp;fsb=1&amp;dtd=45412" data-google-container-id="a!4" tabindex="0" title="Advertisement" aria-label="Advertisement" data-google-query-id="CNu42NPvyYkDFR9GHQkdkGIfdg" data-load-complete="true" style="border: 0px; margin: 0px; padding: 0px; max-width: 100%; left: 0px; top: 0px; width: 800px; height: 280px;"></iframe>

Si queremos que Tomcat 10 inicie automáticamente en cada arranque de Ubuntu 24.04, tendremos que habilitar el servicio:

```
sudo systemctl enable tomcat10
```



### Firewall

Si tenemos activado el firewall UFW y queremos hacer accesible la plataforma Tomcat 10 desde red, tendremos que añadir la excepción para el puerto correspondiente:

```
sudo ufw allow 8080/tcp
```



### Cómo acceder a Tomcat 10

Para **acceder a Tomcat 10 en Ubuntu 24.04** desde un navegador web indicaremos la dirección del servidor (IP, nombre DNS, dominio, etc.) y el puerto de conexión, el 8080 por defecto.

Por ejemplo, la máquina Ubuntu 24.04 sobre la que hemos preparado este tutorial es accesible en el subdominio *ubuntu2404.local.lan*, por lo que utilizamos *http://ubuntu2404.local.lan:8080* como URL:

![instalar tomcat 10 en ubuntu 24.04 lts noble numbat](https://comoinstalar.me/wp-content/uploads/2024/05/instalar-tomcat-10-en-ubuntu-24.04-lts-001.jpg)

## Cómo configurar Tomcat 10 en Ubuntu 24.04 LTS

### Acceso desde red a las aplicaciones administrativas

Acabamos de comprobar cómo es posible acceder a la página principal de Tomcat 10 en el servidor Ubuntu 24.04 desde una máquina en red. Sin embargo, las aplicaciones de administración (aplicaciones */manager* y */host-manager*) y la de documentación local (aplicación */docs*) por defecto sólo son accesibles localmente. Si trabajamos de forma remota es posible que queramos acceder desde red a estas aplicaciones, por lo que si ese es el caso realizaremos ciertos ajustes en el archivo *context.xml* de cada aplicación.

Editamos el archivo *context.xml* de la aplicación */docs* (documentación local):

```
sudo nano /opt/tomcat/apache-tomcat/webapps/docs/META-INF/context.xml
```

Buscamos la siguiente sección dentro del bloque *Context* principal:

...

  **<****Valve** className="org.apache.catalina.valves.RemoteAddrValve"

​         allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" **/>**

...

Y la desactivamos encerrándola dentro de un bloque de comentarios:

...

<!--

  <Valve className="org.apache.catalina.valves.RemoteAddrValve"

​         allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />

-->

...

Guardamos los cambios y ya es posible acceder desde red a la aplicación de documentación:![instalacion de tomcat 10 en ubuntu 24.04 lts noble numbat](https://comoinstalar.me/wp-content/uploads/2024/05/instalar-tomcat-10-en-ubuntu-24.04-lts-002.jpg)Para las aplicaciones administrativas haríamos los mismos cambios en sus respectivos archivos *context.xml*; por ejemplo, para la aplicación */manager*:

sudo nano /opt/tomcat/apache-tomcat/webapps/manager/META-INF/context.xml

Y para la aplicación */host-manager*:

sudo nano /opt/tomcat/apache-tomcat/webapps/host-manager/META-INF/context.xml

### Usuarios en Tomcat 10

Las aplicaciones administrativas están protegidas mediante control de acceso de usuarios. Por tanto debemos crear un usuario con los roles *admin-gui* y *manager-gui* (los requeridos por las aplicaciones administrativas), editando el archivo *tomcat-users.xml*:

sudo nano /opt/tomcat/apache-tomcat/conf/tomcat-users.xml

Dentro del bloque *tomcat-users* añadiremos una línea como la siguiente:

...

​        <user username="instalador" password="XXXXXXXX" roles="admin-gui,manager-gui"/>

</tomcat-users>

Obviamente, puedes usar el nombre de usuario que desees, puedes crear un usuario para cada rol, etc.

### Acceso a las aplicaciones administrativas de Tomcat 10

Desde la página principal de Tomcat 10 tenemos dos enlaces a la aplicación */manager* y otro a la aplicación */host-manager*. Si, por ejemplo, decidimos entrar en «*Server Status*» (*/manager/status*) se mostrará un diálogo de inicio de sesión:

![configuracion de tomcat 10 en ubuntu 24.04 lts noble numbat](https://comoinstalar.me/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif)

Una vez introducido el usuario y contraseña creados en pasos anteriores se mostrará la página de la aplicación:

![tomcat 10 sobre ubuntu 24.04 lts noble numbat](https://comoinstalar.me/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif)

Si posteriormente visitamos el enlace «*Manager App*» (*/manager/html*) desde la página inicial, como en realidad se trata de la misma aplicación, no será necesario iniciar sesión:

![tomcat 10 para ubuntu 24.04 lts noble numbat](https://comoinstalar.me/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif)

En cambio, si entramos en «*Host Manager*» (*/host-manager/html*) sí habrá que introducir usuario y contraseña, tras lo cual se mostrará la página de la aplicación:

![tomcat 10 en ubuntu 24.04 lts noble numbat](https://comoinstalar.me/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif)

## Cómo desplegar aplicaciones en Tomcat 10 sobre Ubuntu 24.04 LTS

Si disponemos de una aplicación Java de servidor en formato de archivo *.war* que queremos desplegar, visitaremos el gestor de aplicaciones web de Tomcat 10, «*Manager App*» (*/manager/html*).

Buscaremos la sección «*Desplegar*» y «*Archivo WAR a desplegar*«, donde a través del botón «*Seleccionar archivo*» seleccionaremos el archivo *.war*.

![img](https://comoinstalar.me/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif)

Una vez seleccionado el archivo, desplegaremos la aplicación mediante el botón «*Desplegar*«.

Se recargará la página del gestor de aplicaciones y, si todo ha ido bien, se mostrará como mensaje «*OK*» y aparecerá la nueva aplicación en la lista.

![img](https://comoinstalar.me/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif)

Podremos gestionar la nueva aplicación mediante sus correspondientes controles (parar, recargar, replegar, etc.), y también podremos lanzarla desde el enlace mostrado en la lista.

![img](https://comoinstalar.me/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif)

¡Así de fácil!

## Conclusión

Ahora que sabes cómo instalar Tomcat 10 en Ubuntu 24.04 LTS Noble Numbat ya puedes desplegar aplicaciones Java de terceros o tus propios desarrollos desde tu servidor o VPS Ubuntu, tanto para red local como a través de Internet.

https://comoinstalar.me/como-instalar-tomcat-10-en-ubuntu/