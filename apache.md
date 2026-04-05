APACHE



**Información sobre el servidor web Apache
**
El servidor web Apache se ejecuta inicialmente como root, pues en un sistema Linux sólo root está autorizado a abrir sockets en puertos por debajo del **1000**, y Apache escucha, por defecto, en el tradicional puerto **80** del protocolo **HTTP**.



Al arrancar Apache, el proceso de root arrancará otros procesos hijos que ya se ejecutan con otro usuario y grupo menos peligroso que root. Por **defecto** **estos procesos hijos** **se ejecutan con el usuario www-data y el grupo www-data**. Asegúrate de que este usuario tiene permiso para leer los documentos que debe servir Apache.

El proceso inicial no atenderá ninguna petición de cliente para evitar así problemas de seguridad. En su lugar, serán los procesos hijos quienes se encarguen de servir las páginas. Al manejar las solicitudes entrantes bajo la identidad del usuario www-data. Esto significa que una vulnerabilidad de seguridad en un script CGI ejecutado por Apache (para una página dinámica) no comprometerá todo el sistema, sino solo los archivos propiedad de este usuario en particular.

Puedes comprobar todo esto con el comando **ps -aux** o con la aplicación de consola: **htop,** para ver los procesos en ejecución en tu sistema.



[![img](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiePGNdpqs8p5iG6SvtMelkf5tGYeV2PGI-SwfWAQ8sQvGUJC-FHha9PwhmTKvIfQmgfLPRVN5-_c0N-Mab0H13r72M9m4oyz-CGERRXaq5nPB56GlDmIjcYyKOD7-2MbStpbRwf7cmLgo/s640/htop-2.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiePGNdpqs8p5iG6SvtMelkf5tGYeV2PGI-SwfWAQ8sQvGUJC-FHha9PwhmTKvIfQmgfLPRVN5-_c0N-Mab0H13r72M9m4oyz-CGERRXaq5nPB56GlDmIjcYyKOD7-2MbStpbRwf7cmLgo/s788/htop-2.png)

Por defecto, el servidor web apache, sirve todo el contenido web en la siguiente ruta: **/var/www/html**



**Por qué no puedo escribir en la carpeta /var/www/html**

Como hemos dicho antes, cuando instalamos el servidor web Apache, el sistema crea un nuevo usuario y un nuevo grupo por defecto llamado: **www-data**. Por medio de este usuario se establecerán las operaciones con el servidor web Apache. **En este sentido, solo root y el usuario www-data, serán los que puedan crear y modificar el contenido de esta carpeta.**



Es por esto que una vez instalado el servidor web apache, si usamos un usuario normal (no root), no se permite escribir en /var/www/html. Hasta que nosotros lo configuremos.

[![img](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjILvva1-Cf-0_DC-HvYGYgawp39xcnG-U5YZ1LbPVJ6plCE6ISXxuah_nxOeSNJir9BDBMBAZgdU8jKHQfh5TTflBUXPA0_-8FQu4IIpMvcS7PJHmwweme1xcJdp1FBiVP2XIzkPzj644/s640/root-ugo.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjILvva1-Cf-0_DC-HvYGYgawp39xcnG-U5YZ1LbPVJ6plCE6ISXxuah_nxOeSNJir9BDBMBAZgdU8jKHQfh5TTflBUXPA0_-8FQu4IIpMvcS7PJHmwweme1xcJdp1FBiVP2XIzkPzj644/s739/root-ugo.png)



Pero usar el usuario usuario root o el www-data para poder operar con nuestro servidor no es lo mas adecuado, lo mas adecuado y acertado es usar nuestro usuario normal (por ejemplo: Diego) 


Por tanto en Debian GNU/Linux, **el usuario por defecto** del servidor web Apache se llama **www-data** y debe encontrarse en el **grupo** **www-data**. En otras distribuciones de Linux se llama **nobody** o **apache**.

Este usuario **www-data** debe tener acceso a los directorios públicos del sitio web para poder leer y mostrar sus contenidos.



**Vamos a configurar correctamente la carpeta: /var/www/html
**
Luego de instalar el servidor web apache2 en Debian GNU/Linux, vamos a configurar la carpeta: **/var/www/html** con el usuario, el grupo y los permisos adecuados, para el correcto funcionamiento.



**1. Permisos que debe tener la carpeta: /var/www/html
**
La carpeta **/var/www/html** debería tener el permiso **755** (nunca el permiso 777). Con el permiso 755, el propietario tiene todos los privilegios (lectura, escritura y ejecución), el grupo y el resto de usuarios solo tendrán permisos de lectura y de ejecución en la misma carpeta.

[![img](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh1222NeDYNC1eVDNtAeDbK4sosjIlO2-6qoyzT-_K97CGQEwrcnNyT8yQ6U1YFZJT7LhPyOKok1HVYN75J9sVhjgzCSXI8Ag6aqt0YHBnyXt16f_Xok6V9miorAhKbxt_oWomWME4p6KU/s0/apache2-permisos-1.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh1222NeDYNC1eVDNtAeDbK4sosjIlO2-6qoyzT-_K97CGQEwrcnNyT8yQ6U1YFZJT7LhPyOKok1HVYN75J9sVhjgzCSXI8Ag6aqt0YHBnyXt16f_Xok6V9miorAhKbxt_oWomWME4p6KU/s594/apache2-permisos-1.png)

Pero nosotros vamos a usar el permiso 

**775**. Con este permiso (775), el propietario y el grupo tiene todos los privilegios (lectura, escritura y ejecución), y el resto de usuarios solo tendrán permisos de lectura y de ejecución en la misma carpeta. Vamos a usar este permiso para no cambiar ni el propietario y ni el grupo por defecto del servidor apache, que por defecto se llama: **www-data**

**
**

[![img](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhAjAkPP090tZtDklu6k_lh7NfX6V0jaJmQ_diuC28_TkjJ4KDTFbAJTA1mdNrHVIdN0ZSO3BSVB8AyyTxq2HnYFWAlJeA5qqUXiu9bSzjzG8yl3NAsPOH3U4dRRE5RU6OOfUBiPoJyErU/s0/apache2-permisos-2.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhAjAkPP090tZtDklu6k_lh7NfX6V0jaJmQ_diuC28_TkjJ4KDTFbAJTA1mdNrHVIdN0ZSO3BSVB8AyyTxq2HnYFWAlJeA5qqUXiu9bSzjzG8yl3NAsPOH3U4dRRE5RU6OOfUBiPoJyErU/s594/apache2-permisos-2.png)

**
**

**2.** Por defecto, una vez instalado el servidor web apache, en Debian GNU/Linux, el dueño del grupo y el directorio por defecto pertenecen a root. Nosotros **vamos a cambiar el dueño del directorio y el grupo**, al usuario por defecto de apache, llamado: **www-data**.

**chown -R www-data:www-data /var/www/html**

[![img](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi_AEEsdBNvlafRziPGBctsPA7komuca3v8H7VPMyxXHEpyi4VtHhgaT5pW5qh_cwtgRNM9cSwdmwbu6sD77Xs-IrzsqXfP92WWm8LexTe4ORL_qrIhaMpa8zG-Vp9AKs7zQhbRq_XriI0/s640/ls-la-2.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi_AEEsdBNvlafRziPGBctsPA7komuca3v8H7VPMyxXHEpyi4VtHhgaT5pW5qh_cwtgRNM9cSwdmwbu6sD77Xs-IrzsqXfP92WWm8LexTe4ORL_qrIhaMpa8zG-Vp9AKs7zQhbRq_XriI0/s728/ls-la-2.png)



**3.** Ahora le damos **permisos de escritura** en el directorio **/var/www/html**, al grupo www-data.

**chmod -R** **775** **/var/www/html** ó **chmod -R** **g+w** **/var/www/html**

Una vez dado el permiso de escritura al grupo, los permisos quedarían asignados con el 775, tanto propietario como grupo tendrán todos los privilegios (lectura, escritura y ejecución) sobre dicha carpeta; el resto de usuarios tendrá permiso de lectura y ejecución.

**4**. Para facilitar la administración del sitio web, **añadimos nuestro usuario** (por ejemplo: diego) **al grupo** de apache llamado: **www-data**.

**usermod -a -G www-data diego**

**
**
**Nota:** para que los cambios tengan efectos, tenemos que deslogearlo y volvernos a logear.


Si estamos accediendo el servidor con el usuario diego, podemos verificar que ya pertenecemos al grupo www-data, usando el siguiente comando:

**groups
**
**Observación:** Si hemos realizados cambios en el algún momento, y no se encuentran con los permisos correcto para nuestro servidor, usaremos el siguiente comando para poner el permisos 775 a todas las carpeta:

find /var/www/html -type d -exec chmod 755 {} \;

Si hemos realizados cambios en el algún momento, y no se encuentran con los permisos correcto para nuestro servidor, usaremos el siguiente comando para poner el permisos 664 a todos los ficheros:

find /var/www/html -type f -exec chmod 644 {} \;


**Nota importante:
**- Todo lo anterior es para el servidor por defecto, directorio: /var/www/html. También podemos servir paginas web desde nuestro propio espacio de usuario (/home/diego), creando la carpeta public_html, usando el comando: mkdir /home/diego/public_html, donde diego es el nombre del usuario con el que estamos trabajando.

\- A continuación, debemos asegurarnos que nuestro directorio web public_html también pertenece al grupo www-data de Apache:

chgrp -R www-data /home/diego/public_html

\- Le damos los permisos adecuados para que los archivos y directorios creados dentro del mismo directorio sean visibles en la web, usamos el comando:

chmod -R 755 /home/diego/public_html

Con esto tenemos configurado los permisos, usuarios y grupos para mostrar y ejecutar adecuadamente sitios web en Apache.

**Nota explicativa:
**Los propietarios y los permisos se gestionan desde el shell con los comandos:

**chown**: cambia el usuario y el grupo propietarios.
**chgrp**: cambia sólo el grupo propietario.
**chmod**: cambia permisos.


**qué significan los permisos: rwx-t
**
**r**: permiso de lectura.
**w**: permiso de escritura.
**x**: permiso de ejecución.
**-** (guión): no se tiene ese permiso. (cero)
**t** (en vez de la x de otros): sólo el propietario puede borrarlo (bit pegajoso, sticky). Se usa en directorios donde todo el mundo puede escribir (como /tmp), para que los archivos no puedan ser borrados por cualquiera.