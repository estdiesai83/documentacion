# WebSockets con PHP + Javascript (Vanilla)

[TOC]

# TEORÍA

La «idea feliz» de los webSockets es mantener una comunicación permanente entre servidor y clientes para recibir información desde la parte servidora sin tener que ser solicitada previamente por la parte cliente (Llamado notificación PUSH). Además, sería ideal que, en la parte servidora, existiese un único hilo que esté procesando información (por ejemplo, escuchando cambios de una BD o eventos lanzados por otros procesos) para mandar la información a todos los clientes a la vez sin consumir los recursos que requeriría para cada cliente por separado.

Lo primero que se plantea uno es ¿Cómo va a mantener la comunicación entre cada uno de los sockets PHP si realmente PHP, tal y como nos lo enseñan a todos, es un lenguaje basado en cliente-servidor? Es decir, el cliente realiza una petición al servidor, el script de PHP se ejecuta, devuelve un resultado y el script de PHP muere…

Tenemos:

<img src="http://www.natapuntes.es/wp-content/uploads/2018/05/sockest-tenemos.jpg" alt="img" style="zoom:50%;" />

Queremos:

<img src="http://www.natapuntes.es/wp-content/uploads/2018/05/sockest-queremos.jpg" alt="img" style="zoom: 50%;" />

Pues aquí es donde entra en juego el concepto de Servicio (Windows) o Demonios/Daemon (UNIX).

Se puede crear un proceso en el servidor que ejecute constántemente un script de PHP al cual se conecten los clientes. El script de PHP, que pasará a ser un servicio, mantiene abiertas las comunicaciones con todos los clientes en todo momento después de su conexión y la lógica del servicio se maneja enteramente desde este script (parecido a un «hilo principal de ejecución» en un servidor java). Este script sencillamente se ejecutará en un bucle infinito «while(true)«.

Pero la duda viene nuevamente ¿Cómo un script PHP en ejecución puede recibir información externa y aceptar conexiones de nuevos clientes sin ejecutar el script directamente (Que es lo que se haría al pedir una página web de contenido dinámico a través de una URL)? Esto se consigue mediante el conjunto de funciones de PHP para crear y manejar sockets (socket_*): el script de PHP creará un socket maestro (socket_create) que inicia, por así decirlo, un servicio/daemon en el Sistema Operativo con un puerto abierto (asignado manualmente mediante la función socket_bind). Este servicio de socket conseguirá que el script PHP reciba información del exterior (así como enviarla).

<img src="http://www.natapuntes.es/wp-content/uploads/2018/05/socket-maestro-1.jpg" alt="img" style="zoom:50%;" />

NOTA: Un socket no es más que una tubería de datos (pipeline) por donde se manda y recibe información de cualquier tipo. Cada socket tiene un puerto asociado con el que se identifica dentro del SO del servidor.

En esto se basa la comunicación persistente entre varios clientes y un script PHP.

El cliente entonces se conectará al servicio del SO a través del puerto que le hemos asignado al socket maestro, envía información de que quiere conectarse al socket, el script de PHP (que estará programado para leer constantemente las nuevas peticiones) lee el buffer del socket maestro, procesa la información y, si es correcta, abre un socket individual para ese nuevo cliente. El script PHP mantiene un array de los sockets abiertos a través de los cuales puede recibir y mandar información a cada cliente desde el mismo hilo de ejecución de PHP.

<img src="http://www.natapuntes.es/wp-content/uploads/2018/05/socket-maestro-2.jpg" alt="img" style="zoom:50%;" />

¡Voila! La magia está servida 

Nótese que incluso otro proceso PHP del servidor podría también comunicarse con el hilo de ejecución del servicio foo.php ¡Pudiendo crear así una arquitectura orientada a eventos como por ejemplo publish/subscribe!.

# PRÁCTICA

Recomiendo usar la biblioteca PHP-Websockets que se puede encontrar en github (https://github.com/ghedipunk/PHP-Websockets) para tener una base por la que empezar. Pero vamos a intentar comprender qué hace esta biblioteca.



Lo primero decir que la clase principal usada es <img src="http://www.natapuntes.es/wp-content/uploads/2018/05/sockets-diagrama-de-uso-sin-herencia.jpg" alt="img" style="zoom: 80%;" />WebSocketServer que se encuentra dentro del archivo «websockets.php». Esta clase usa a su vez la clase «WebSocketUser» (que no es más que la definición de un objeto con atributos que se deben guardar de cada cliente conectado por el socket) cuya definición se encuentra en users.php. Cada «WebSocketUser» será una conexión de un cliente al socket y la clase WebSocketServer almacenará a todos los usuarios conectados en el array «$users«.

El constructor de la clase WebSocketServer hace lo siguiente:

1.- Crea el «socket master». Es, por así decirlo, el socket que hace de servicio en el SO. Este socket es la puerta de comunicación con el mundo exterior, así que lo almacena como atributo de la clase y lo añade al array de sockets abiertos.

```bash
$this->master = socket_create(AF_INET, SOCK_STREAM, SOL_TCP);
```

2.- Pone unas opciones de comunicación al socket master:

```bash
socket_set_option($this->master, SOL_SOCKET, SO_REUSEADDR, 1);
```

3.- Le asigna una dirección IP y un puerto donde escuchar nuevas conexiones:

```bash
socket_bind($this->master, $addr, $port);
```

4.- Y le habilita para que escuche conexiones con un máximo de peticiones pendientes en cola (es el segundo parámetro, en este caso pone 20 conexiones por defecto como máximo). Si hay 20 peticiones pendientes de procesar y llega una petición más, esta última será desechada y el cliente recibirá el código de conexión correspondiente a «Conexión rechazada» (*ECONNREFUSED):*

```bash
socket_listen($this->master,20);
```



Luego, en su método «run()«, realiza un bucle infinito en el cual realiza las siguientes tareas principales:

1.- Lee el array de sockets (que en el inicio solo contendrá el socket master). El array de sockets se copia a la variable local «$read» ya que socket_select es una proce-función (función y procedimiento a la vez) que va a modificar el valor de la variable «$read» escribiendo en ella cuáles son los sockets que han dejado datos para ser leídos, así que no se desea que se modifique el array original de sockets, por lo que le pasamos una copia:

```php
socket_select($read, null, null, 1);
```



2.- Ahora que en la variable «$read» se tienen los sockets que contienen algo interesante, los recorre con un foreach:

```php
foreach($read as $socket) { ... }
```



3.- Primero se pregunta si el socket seleccionado es el socket maestro (socket master). Si es así, significa que hay un cliente intentando realizar una conexión nueva, así que la intenta aceptar y, en caso de éxito, se crea un socket nuevo para el cliente y se añade al array de sockets:

```php
if($socket == $this->master) {
	$client = socket_accept($socket);
	if($client < 0) {
		//ERROR!!
		continue;
	}else{
		$this->connect($client); //Se añade al array de sockets
	}
}
```



4.- En otro caso, si no es el socket maestro, lee el número de bytes recibidos con socket_recv. Si el resultado es false significa que se produjo un error, si el resultado es igual a 0 significa desconexión del cliente, en otro caso se comprueba que el cliente haya completado el handshake (esto es, leer la cabecera del paquete de la conexión y comprobar que es correcta), y si es así se empieza a trocear la información en frames para luego ser procesada ejecutando posteriormente el método abstracto «process(usuario, mensaje)» (sino, tiene que terminar de realizar el handshake):

```php
else{ //Socket no es el socket master
	$numBytes = socket_recv($socket, $buffer, $this->maxBufferSize, 0);
	if ($numBytes === false) { //Error de conexión
		$sockErrNo = socket_last_error($socket);
        switch ($sockErrNo)
        { ... }
    } elseif ($numBytes == 0) { //Conexión perdida con el cliente
		$this->disconnect($socket); //Elimina el socket del array de sockets
	} else {
        //Procesar los datos recibidos, ya sea el handshake o los datos en sí mismos (Tras 			procesar los datos ejecutará el método abstracto process()).

        //$this->process($user, $message).
	}
}
```



NOTA: El handshake es lo primero que se envía al intentar realizar la conexión con el socket maestro. Es un string que debe tener el siguiente formato según el protocolo de conexión de los websockets en su versión nº 13:

1. "GET / HTTP/1.1\r\n" .
2. "Upgrade: websocket\r\n" .
3. "Connection: Upgrade\r\n" .
4. "Host: "./*HOST DESTINO*/."\r\n" .
5. "Origin: "./*HOST ORIGEN*/."\r\n" .
6. "Sec-WebSocket-Key: "./*ID ÚNICO EN B64*/."\r\n" .
7. "Sec-WebSocket-Version: 13\r\n\n";



# EJEMPLO

Ahora vamos a realizar un ejemplo de WebSocket que simule una sala de chat (un usuario escribe un mensaje y le llega a todos los que estén conectados). Voy a usar XAMPP para el ejemplo.

ATENCIÓN en php.ini debe estar descomentada la línea «extension=php_sockets.dll» (o el equivalente para habilitar los sockets en tu instalación de php).

ATENCIÓN ya que los sockets van a intentar acceder a puertos de un servidor a través de un router, puede que tengáis que configurar el firewall que aplique en cada caso para tener el puerto abierto del socket maestro.

1.- Crear una clase que herede de WebSocketServer:

```php
require_once('websockets.php');

class SalaChatServer extends WebSocketServer { ... }
```



2.- Redefinir la función process (que es la que se ejecuta tras recibir datos de un cliente) y redefinir las funciones «connected» y «closed«:

```php
protected function process ($user, $message) {
    echo 'user sent: '.$message.PHP_EOL;
    foreach ($this->users as $currentUser) {
        if($currentUser !== $user)
            $this->send($currentUser,$message);
    }
}

protected function connected ($user) {
	echo 'user connected'.PHP_EOL;
}


protected function closed ($user) {
	echo 'user disconnected'.PHP_EOL;
}	
```

3.- Inicializar una instancia de la clase heredada que hemos llamado SalaChatServer para que escuche conexiones en localhost en el puerto 9000:

```php
$chatServer = new SalaChatServer("localhost","9000");
try {
	$chatServer->run();
}

catch (Exception $e) {
	$chatServer->stdout($e->getMessage());
}
```



Este trozo de código lo guardamos en un archivo php llamado, por ejemplo, SalaChatServer.php.

IMPORTANTE: todos los archivos tanto de la biblioteca PHP-WebSockets como SalaChatServer.php se tienen que almacenar en una carpeta que no sea de acceso público desde internet ya que los clientes no tienen que acceder a estos archivos; los clientes solo se conectarán al socket abierto en el servidor que van a generar esos archivos. Yo en el ejemplo, usando XAMPP, lo voy a guardar en «C:\xampp\daemons\sala_chat».

Ejecutamos desde la consola de comandos (CMD) el archivo SalaChatServer.php usando php.exe:

«C:\xampp\php\php.exe» -q C:\xampp\daemons\sala_chat\SalaChatServer.php

¡Voila! Ya tenemos nuestro servicio PHP escuchando conexiones nuevas de manera indefinida. Nótese que ejecutando el script PHP mediante CMD no debería cerrarse nunca por timeout, y por tanto no hay que modificar el valor de timeout en php.ini.

Finalmente queda la parte cliente. Opto por usar JavaScript.

En HTML5, JavaScript ya incluye un objeto llamado «WebSocket» que realiza las tareas básicas para la comunicación por socket (incluyendo el handshake para la conexión). Sencillamente tenemos que instanciarlo indicando el host y asociándole los EventListener para las situaciones «onopen«, «onmessage» y «onclose«. Para mandar un mensaje se usa la función «WebSocket.send(String)«.

NOTA: Los WebSockets usan el protocolo TCP, así que se garantiza que los mensajes se mandan, se tratan y se reciben en orden.

1.- En nuestro ejemplo, el servidor está escuchando conexiones en localhost en el puerto 9000, así que instanciamos al WebSocket de la siguiente manera:

```php
var socket;

function init(){
	socket = new WebSocket("ws://localhost:9000")
}
```



Como se puede observar, el protocolo de conexión es «ws» y no «http».

ATENCIÓN es posible que el navegador os impida usar un websocket sin seguridad (ws en lugar de wss) si estáis dentro de una página segura (https), ya que, por norma general, no se permite «bajar» el nivel de seguridad (la seguridad en conjunto es tan fuerte como cada uno de los eslabones).

2.- Asignamos los EventListeners:

```javascript
function init(){
	...
	socket.onopen = function(msg) {
		alert("Welcome - status "+this.readyState);
	};

    socket.onmessage = function(msg) {
        alert("Received: "+msg.data);
    };

    socket.onclose = function(msg) {
        alert("Disconnected - status "+this.readyState);
    };
}
```



3.- Crear una función para mandar el mensaje:

```javascript
function send(msg){
	if(msg.length > 0) {
		socket.send(msg);
	}
}
```



4.- Crear una función para desconectarse:

```php
function quit(){
	socket.close(); 
}
```



5.- Y otra función para reconectar:

```php
function reconnect(){ 
	quit(); 
	init();
}
```



Y eso es todo. Este trozo del código sí que es público y por tanto tiene que estar en un sitio accesible por los usuarios desde internet (en mi caso lo almaceno en C:\xampp\htdocs\sala_chat\client.html).

Para comprobar su funcionamiento sencillamente debes abrir dos pestañas con el cliente de la sala de chat (localhost/sala_chat/client.html).

# RESUMEN

![img](http://www.natapuntes.es/wp-content/uploads/2018/05/socket-resumen.jpg)

Finalmente os dejo un ejemplo para correr en xampp en el siguiente archivo comprimido: [ejemplo websockets PHP + java](https://www.dropbox.com/s/dnaxcn7g6mfg9ex/WebSockets PHP %2B JS.rar?dl=0).

¡Websockets achieved!

------

*Créditos de fuentes externas:*

*Iconos:*

- *PC by art shop from the Noun Project*
- *Server by Chanut is Industries from the Noun Project*
- *Cloud by AlePio from the Noun Project*
- *Gears by Gregor Cresnar from the Noun Project*

*Bibliotecas*:

- [PHP-WebSockets por Adam Alexander](https://github.com/ghedipunk/PHP-Websockets/)

[¡Hola mundo!](https://www.natapuntes.es/hola-mundo/)

[Implementación del patrón publish/subscribe en PHP](https://www.natapuntes.es/publish-subscribe-en-php/)

### 17 comentarios

Lily86 [19 mayo, 2018](https://www.natapuntes.es/websockets-con-php-javascript/#comment-2) [Inicia sesión para responder](https://www.natapuntes.es/wp-login.php?redirect_to=https%3A%2F%2Fwww.natapuntes.es%2Fwebsockets-con-php-javascript%2F)

Helloooo! Me acabo de registrar en la página. Muy bueno y útil. Me gusta la filosofía de no olvidar lo aprendido hasta ahora y poder compartir con los demás el conocimiento adquirido. Muchas gracias por la labor que llevas a cabo con tu página. Un saludo 

Buenas. Un ejemplo muy bueno, enhorabuena. He montado tu ejemplo con la clase SalaChatServer pero me gustaría saber como podría implementar en esa clase un método para reconectar el servidor si se cayese. Un saludo.



No entiendo muy bien qué quieres decir con «implementar un método para reconectar el servidor si se cayese» ¿Te refieres a que la parte cliente se vuelva a conectar al websocket cuando esté disponible de nuevo? Si es así, habría que tener un bucle que pregunte constantemente hasta que el websocket esté de nuevo disponible usando algún tipo de espera pasiva entre pregunta y pregunta (por ejemplo con un setTimeOut que te lleve de nuevo al método que pregunta por la conexión del websocket).

Si te refieres a la parte servidora me temo que no puedes hacer mucho para que se recupere el servidor «automágicamente» de una excepción, como mucho meter en un bucle while infito el try-catch de «SalaChatServer.php» y generar un log de errores que analizar posteriormente.

Si puedes explayarte algo más en la pregunta te podré ayudar algo mejor.

Un saludo!

ansopa [18 febrero, 2019](https://www.natapuntes.es/websockets-con-php-javascript/#comment-13) [Inicia sesión para responder](https://www.natapuntes.es/wp-login.php?redirect_to=https%3A%2F%2Fwww.natapuntes.es%2Fwebsockets-con-php-javascript%2F)

El enlace para descargar está roto, no funciona, ¿hay algún enlace alternativo?

natynat (Autor) [12 abril, 2019](https://www.natapuntes.es/websockets-con-php-javascript/#comment-14) [Inicia sesión para responder

santiago marchena alvarez [15 abril, 2019](https://www.natapuntes.es/websockets-con-php-javascript/#comment-15) [Inicia sesión para responder](https://www.natapuntes.es/wp-login.php?redirect_to=https%3A%2F%2Fwww.natapuntes.es%2Fwebsockets-con-php-javascript%2F)

Hola! Me preguntaba… cómo haría para identificar cada cliente que se conecta asignándole un id o algo así para enviar datos a determinados usuarios conectados?

Saludos y excelenteeee explicación!

natynat (Autor) [6 mayo, 2019](https://www.natapuntes.es/websockets-con-php-javascript/#comment-16) [Inicia sesión para responder](https://www.natapuntes.es/wp-login.php?redirect_to=https%3A%2F%2Fwww.natapuntes.es%2Fwebsockets-con-php-javascript%2F)

Hola!

Pues lo primero que se me ocurre es que cuando el cliente websocket se conecte, se espere un usuario y contraseña con un timeout límite. Tú guardas un array de usuarios que extiendan la clase que viene en la librería y le metes más atributos como DateTime de conexión, si ha enviado correctamente las credenciales y el id del usuario de la BD (que recuperarás al consultar la BD con las credenciales proporcionadas). Entonces lo suyo sería, en la función «process» de la clase que extiende de «WebSocketServer», esperar un mensaje de login con un formato concreto (por ejemplo en JSON), procesarlo y entonces asignarle el ID de usuario al objeto usuario (que extiende de la clase base de la librería).

De todos modos en esta entrada puede que encuentres lo que te interesa (el código de la entrada no está tabulado, pero tienes el ejemplo para descargar): https://www.natapuntes.es/publish-subscribe-en-php/

Un saludo!

proferay [7 junio, 2019](https://www.natapuntes.es/websockets-con-php-javascript/#comment-17) [Inicia sesión para responder](https://www.natapuntes.es/wp-login.php?redirect_to=https%3A%2F%2Fwww.natapuntes.es%2Fwebsockets-con-php-javascript%2F)

Tengo una consulta. Estoy un poco mareado con el tema de los sockets.
Descargué la librería mencionada de Github en el ejemplo.
Corrí el archivo client.html que viene con el ejemplo y en la consola del navegador sólo me tira error de conexión.

Estoy necesitando lograr «leer» lo que llega desde un lector de huellas para poder interpretarlo.

El software que viene con el lector de huellas detecta los ingresos mediante una IP de la LAN por el puerto 5010.

Pero no sé si en la clase PHP debo configurar esa IP con ese puerto para poder recibir el objeto con los datos (digo «objeto» porque todavía no sé qué recibiré).

Mi intención es hacer la lectura y volcar la información devuelta en una base de datos MySQL.

Pero realmente no me ha sido posible lograr contacto.

En un lugar me han dicho que podría hacerlo mediante sockets (sin explicar demasiado cómo hacerlo) y luego buscando encontré esta página donde se habla en ESPAÑOL! (Aleluya) y tocan el tema del que necesito info.

El equipo que lee las huellas es uno marca Anviiz T5s conectado por TCP/IP mediante RS485.

Si con Putty hago un Telnet al puerto 5010 de la IP del lector de huellas queda espectante y cuando marco la huella en el lector, me aparece una señal en la consola del Putty, pero aún es irreconocible lo que recibe.

Intento recuperar ese «paquete» con un socket para trabajarlo luego.

Cualquier pista que puedan brindarme les agradeceré.

natynat (Autor) [21 junio, 2019](https://www.natapuntes.es/websockets-con-php-javascript/#comment-18) [Inicia sesión para responder](https://www.natapuntes.es/wp-login.php?redirect_to=https%3A%2F%2Fwww.natapuntes.es%2Fwebsockets-con-php-javascript%2F)

Hola!

Efectivamente puedes configurar el socket maestro para que escuche conexiones en esa ip:puerto. Sólo tienes que indicarlo en el constructor de la clase que doy de ejemplo (o modificar la biblioteca de github para que use esos valores, los cuales están en la clase «principal», la que maneja los sockets, en unas variables al inicio de la declaración de la clase, si no lo han cambiado, claro está).

Un saludo!

jeyson [2 julio, 2019](https://www.natapuntes.es/websockets-con-php-javascript/#comment-21) [Inicia sesión para responder](https://www.natapuntes.es/wp-login.php?redirect_to=https%3A%2F%2Fwww.natapuntes.es%2Fwebsockets-con-php-javascript%2F)

aun no termino de leer este grandioso documento informativo voy ala mitad pero quisiera decirte muchas gracias , estuve buscando información referente a este tema y no la encontraba o si no estaba en ingles y recién estoy aprendiendo dicho idioma bueno solo quería decirte eso muchísimas gracias por el tiempo y la dedicación y la grandiosa explicación detalla que le das.

natynat (Autor) [2 julio, 2019](https://www.natapuntes.es/websockets-con-php-javascript/#comment-22) [Inicia sesión para responder](https://www.natapuntes.es/wp-login.php?redirect_to=https%3A%2F%2Fwww.natapuntes.es%2Fwebsockets-con-php-javascript%2F)

Gracias! Me alegro de que te sirva. Saludos!

adan [27 enero, 2020](https://www.natapuntes.es/websockets-con-php-javascript/#comment-23) [Inicia sesión para responder](https://www.natapuntes.es/wp-login.php?redirect_to=https%3A%2F%2Fwww.natapuntes.es%2Fwebsockets-con-php-javascript%2F)

natynat, muy bueno el blog! llegue buscando algo simple de WS para PHP y anda perfecto.
La cuestión es que NO puedo hacerlo funcionar como wss://
ya que mi sitio corre sobre https://
(probe con esta solución –> https://serverfault.com/questions/804862/apache-mod-proxy-forward-secure-websocket-to-non-secure) peor no hubo caso.

Cualquier ayuda seria genial, un saludo!

natynat (Autor) [27 enero, 2020](https://www.natapuntes.es/websockets-con-php-javascript/#comment-24) [Inicia sesión para responder](https://www.natapuntes.es/wp-login.php?redirect_to=https%3A%2F%2Fwww.natapuntes.es%2Fwebsockets-con-php-javascript%2F)

Es que creo que tienes que crear los sockets en PHP de otra forma para que usen canales encriptados con SSL/TLS (para lo cual necesitarás tener accesible el certificado para PHP).

Si no me equivoco la forma de crear sockets seguros en la parte servidora con PHP se hace con los métodos

```
stream_context_create();stream_context_set_option($context, 'ssl', 'local_cert', $pemfile);...
```

Grosso modo sería eso. Tener que cambiar la clase que crea los sockets en php y luego intentar realizar la conexión por wss.

Un saludo

efren [1 abril, 2020](https://www.natapuntes.es/websockets-con-php-javascript/#comment-33) [Inicia sesión para responder](https://www.natapuntes.es/wp-login.php?redirect_to=https%3A%2F%2Fwww.natapuntes.es%2Fwebsockets-con-php-javascript%2F)

Hola, tengo el mismo problema. He investigado y visitado muchísimos lugares tratando de encontrar cómo adaptar este código para trabajar en https pero no doy con la solución. ¿Alguien podría poner un ejemplo?

Gracias.

adan [29 enero, 2020](https://www.natapuntes.es/websockets-con-php-javascript/#comment-25) [Inicia sesión para responder](https://www.natapuntes.es/wp-login.php?redirect_to=https%3A%2F%2Fwww.natapuntes.es%2Fwebsockets-con-php-javascript%2F)

natynat, gracias por tu respuesta, voy a probar con lo que me decis! por lo pronto lo solucione creando un virtual host en el proxy reverso del server (apuntando a mis cert. ssl y redigiendo al puerto especificado); aunque esto NO sería lo óptimo ya que estoy atado al apache.

harold campo [15 mayo, 2020](https://www.natapuntes.es/websockets-con-php-javascript/#comment-34) [Inicia sesión para responder](https://www.natapuntes.es/wp-login.php?redirect_to=https%3A%2F%2Fwww.natapuntes.es%2Fwebsockets-con-php-javascript%2F)

Una pregunta, como hago para enviar mensajes en JSON? intente enviarlo pero da error, te agradecería mucho tu ayuda, gracias

natynat (Autor) [15 mayo, 2020](https://www.natapuntes.es/websockets-con-php-javascript/#comment-35) [Inicia sesión para responder](https://www.natapuntes.es/wp-login.php?redirect_to=https%3A%2F%2Fwww.natapuntes.es%2Fwebsockets-con-php-javascript%2F)

Serializando el JSON debería dejarte.
](https://www.natapuntes.es/websockets-con-php-javascript/#top)





TRABAJANDO CON CODEIGNITER4

Instalar PHP con sus extensiones: https://musaamin.web.id/how-to-install-codeigniter-4-on-ubuntu-18-04/

```bash
sudo apt install php libapache2-mod-php php-cli php-common php-mbstring php-gd php-intl php-xml php-mysql php-zip php-json php-curl -y
sudo systemctl restart apache2
```

para instalar CodeIgniter 4 vía composer, simplemente abre tu terminal o CMD y dentro de tu servidor web ejecutas el siguiente comando:

```
composer create-project codeigniter4/appstarter probando-ci4 --stability beta --no-dev
```

Especificamos `--stability beta` ya que el proyecto todavía no está estable y composer no dejaría clonarlo si no especificamos esto

La opción de `--no-dev` es para no instalar las dependencias del desarrollo de CodeIgniter, pues queremos usar CodeIgniter 4 para desarrollar apps, no queremos modificar el núcleo del mismo.

Ejemplo: https://parzibyte.me/blog/2019/07/29/codeigniter-4-creacion-proyecto-novedades/



He creado un proyecto llamado: websocket en /var/ww/html

Para ejecutarlo, desde el navegador poner:

```
http://localhost/websocket/public/
```

Al ponerlo, en lugar de mostrarme el mensaje de Codeigniter 4, me muestra:

We seem to have hit a snag. Please try again later..



Para solucionarlo:

Modificar en el archivo : app => Config => Boot => production.php

```
Change the ini_set('display_errors', '0') to ini_set('display_errors', '1').
```

 O Modificar en el archivo env:

```
#CI_ENVIRONMENT = production
CI_ENVIRONMENT = development
```



Prueba websocket codeigniter4:

https://medium.com/@taki.elias/codeigniter-4-websocket-library-e938d3d0f251

Instalar libreria websocket codeigniter

```
composer require takielias/codeigniter4-websocket @dev
```

Se necesita publicar los recursos para la configuración predeterminada

```
php spark websocket:publish
```

Iniciar Codeigniter

```php
php spark serve
```

Si ejecuta el servidor en un puerto diferente

```php
php spark serve --port=9092
```

Si no se quisiese lanzar el servidor de esta manera, se puede lanzar en el navegador escribiendo:

```bash
http://localhost/websocket/public/index.php/Websocket/user/3
donde 3 es el identificador del usuario
```



Finalmente iniciar Websocket Server

```
php public/index.php Websocket start
```

Para probarlo, abra dos páginas de su proyecto en la siguiente URL con diferentes ID:

```bash
http://localhost:8080/Websocket/user/1
http://localhost:8080/Websocket/user/2
```

![Captura de pantalla de 2020-11-27 11-12-20](/home/soa/Imágenes/Captura de pantalla de 2020-11-27 11-12-20.png)

![Captura de pantalla de 2020-11-27 11-12-22](/home/soa/Imágenes/Captura de pantalla de 2020-11-27 11-12-22.png)

![Captura de pantalla de 2020-11-27 11-12-23](/home/soa/Imágenes/Captura de pantalla de 2020-11-27 11-12-23.png)![Captura de pantalla de 2020-11-27 11-12-33](/home/soa/Imágenes/Captura de pantalla de 2020-11-27 11-12-33.png)



Si se quiere enviar un mensaje a un usuario en concreto escribir el identificador del usuario en el entry recipient id.



Notas:

FrontEnd: el lado del cliente.

BackEnd: el lado del servidor.



