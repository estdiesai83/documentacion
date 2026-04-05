# LARAVEL

## Fundamentos

### Instalar laravel: 

https://www.rosehosting.com/blog/how-to-install-laravel-on-ubuntu-22-04/

```bash
Actualizar sistema
sudo apt-get update -y && sudo apt-get upgrade -y

Instalar Apache
sudo apt install apache2
sudo systemctl enable apache2 && sudo systemctl start apache2
sudo systemctl status apache2

Instalar php
sudo apt-get install php8.1 php8.1-cli php8.1-common php8.1-imap php8.1-redis php8.1-snmp php8.1-xml php8.1-zip php8.1-mbstring php8.1-curl
sudo apt-get install php8.2 php8.2-fpm php8.2-cli -y

Instalar composer (es un gestor de dependencias)
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

Instalar laravel
cd /var/www/html/

composer create-project laravel/laravel "YOUR APPLICATION NAME"  ej:prueba_laravel
cd /var/www/html/prueba_laravel

chown -R www-data:www-data .
chmod -R 775 storage/

Instalar node (para posteriormente hascer compilaciones de vistas)
sudo apt install nodejs
sudo apt install npm (administrador de paquetes de node.js)

Para saber la version de node y npm: 
node --version
v18.16.0
npm --version
9.5.1

```

***Composer**: es un manejador de paquetes para PHP que proporciona un estándar para administrar descargar e instalar dependencias y librerias. Similar a NPM en Node.js y Bundler en Ruby.





Crear Apache Virtual Host File

```bash
cd /etc/apache2/sites-available/

sudo touch laravel.conf
```

Poner dentro de este archivo:

```bash
<VirtualHost *:80>
ServerName localhost
DocumentRoot /var/www/html/prueba_laravel/public

<Directory /var/www/html/prueba_laravel>
AllowOverride All
</Directory>

ErrorLog ${APACHE_LOG_DIR}/error.log
CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
```

Crear sitio laravel.conf

```bash
sudo a2ensite laravel.conf
```

Check the syntax:

```bash
sudo apachectl -t
```

Me ha dado un error:

AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 127.0.1.1. Set the 'ServerName' directive globally to suppress this message

Para solucionarlo he realizado:

```
he añadido en sudo nano /etc/apache2/apache2.conf
ServerName 127.0.0.1

he añadido en sudo nano /etc/hostname
127.0.0.1 localhost
```



VER MAS INFORMACIÓN en documento de APACHE





You should receive the following output:

```
root@vps:~# apachectl -t
Syntax OK
```

If the syntax is OK, restart the Apache service.

```bash
sudo systemctl reload apache2
```

Once, the Apache service is restarted you can access the Laravel website at **http://yourdomain.com** Ej: localhost desde el navegador ya parece una pagina de laravel



1. Utilizacion de laravel

   1. Nos colocamos en la carpeta que hemos creado para el proyecto de laravel

      ```bash
      cd /var/www/html/prueba_laravel
      ```

   2. Ejecutar 

      ```bash
      php artisan serve
      ```

      Nos debe aparecer algo como:

      ```bash
      Starting Laravel development server: http://127.0.0.1:8000
      ```

      y si abrimos esa direccion en el navegador nos deberia aparecer la pagina de laravel, si da un error de permisos, para solucionarlo

      ```bash
      sudo chmod -R 777 storage/
      ```

      

#### Entornos para desarrollo con Laravel

En el momento actual puedes ejecutar tu proyecto Laravel en estos entornos de desarrollo, desde el más simple al más complejo:

- Usando el comando `artisan serve`: Este es el mecanismo más básico. Simplemente levanta el [servidor integrado de PHP-cli](https://desarrolloweb.com/articulos/servidor-web-integrado-php.html) y te permite acceder a tu proyecto, sin necesidad de instalar nada más que PHP.
- Usando un entorno típico de PHP con Xampp o Laragon: que te permite disponer de Apache+PHP+MySQL. Puedes encontrar más información sobre estos entornos en la [guía definitiva para instalar PHP](https://desarrolloweb.com/articulos/guia-crear-entorno-desarrollo-php.html).
- Usando [Valet en Mac](https://desarrolloweb.com/articulos/instalar-usar-vale-mac): que te permite crear host virtuales (como dominios que funcionan en tu ordenador local para desarrollo) muy fácilmente.
- Usando Docker con [Laravel Sail](https://desarrolloweb.com/articulos/laravel-sail): que te ofrece una instalación y configuración mucho más sencilla, que te dispensa de instalar en tu ordenador local software como MySQL, pero que además te configura muchas otras cosas, como un sistema para verificar el email que se envía en local, un sistema redis para gestión de las colas, etc.
- Usando [Laravel Homestead](https://desarrolloweb.com/articulos/instalar-homestead-para-laravel5.html): para la creación de una máquina virtual Linux, lo que permite unas prestaciones similares a lo que tendrías cuando desplieges el proyecto en un servidor real. Homestead es la opción más compleja de configurar, aunque está al alcance de cualquier persona leyendo el correspondiente artículo en este manual.

De momento esas son las opciones que tenemos. Tendrás que decantarte por alguna de ellas. Pero si tienes PHP instalado en tu ordenador, en principio no necesitarías nada más, porque el propio PHP incluye el servidor integrado y [como base de datos en la etapa de desarrollo puedes usar SQLite](https://desarrolloweb.com/faq/configurar-base-datos-sqlite-laravel), por lo que en principio no necesitas MySQL.

No te preocupes por usar SQLite porque no sea la base de datos que vayas a tener en tu despliegue de Laravel en producción, ya que Laravel usa un ORM y el motor de base de datos que tengas es indiferente, ya que por dentro implementa una abstracción de la base de datos.

Lo que sí vas a necesitar es la instalación de **Composer** para PHP, ya que cualquier desarrollo moderno con este lenguaje requiere el gestor de dependencias instalado en tu sistema. Puedes encontrar más información en el [Manual de Composer](https://desarrolloweb.com/manuales/tutorial-composer.html).

Ahora bien, si tu pregunta es *¿Qué entorno es el mejor para mi?* pues depende un poco de tu experiencia en el mundo del desarrollo y PHP, así como la pontencia de tu ordenador. Trabajar con Docker o con una máquina virtual Homestead siempre requiere un ordenador con una cantidad un poco mayor de memoria RAM (por tener que levantar las virtualizaciones donde se ejecutarán los proyectos de Laravel). Esas opciones son un poco más avanzadas y tienen más dificultad, aunque también tiene algunas ventajas. Las otras opciones de entornos de desarrollo son muy similares en prestaciones, aunque la del servidor integrado de PHP es la más rápida y fácil.



#### Requisitos para instalar Laravel vía Composer

Para instalar Laravel en un nuevo proyecto de aplicación necesitamos cubrir un par de requisitos fundamentales:

- **PHP 7**: Necesitamos la última versión del lenguaje PHP: 7, ya que es un requisito del propio Laravel 5.5. Para instalar PHP 7 puedes seguir uno de los pasos que se explican en el Manual de PHP.
- **Composer**: El gestor de dependencias de PHP, composer, es otro de los requisitos para comenzar. En el Manual de Composer puedes ver las instrucciones para la instalación.

Si estabas pensando en instalar Laravel 9 debes tener en cuenta que los requisitos son distintos. **Laravel 9 solo funciona en PHP 8 en adelante**.

La manera de comprobar si ya tienes estos softwares instalados en tu ordenador es, a través de la consola, lanzar un par de comandos.

Para saber si tenemos PHP instalado, al menos en PHP 7. Tienes el comando:

```git
php --version
```

Para saber si tienes Composer, con una versión actualizada, puedes usar el comando:

```git
composer --version
```



### Comando iniciar el proceso de instalación de Laravel

Se supone que en este paso vamos a comenzar un proyecto desde cero, en el que queremos instalar Laravel para comenzar a desarrollar.

Nos dirigimos a la carpeta de nuestro ordenador donde queremos instalar Laravel. Puede ser cualquier carpeta donde guardes tus proyectos. El comando para crear el proyecto depende de Composer:

```bash
composer create-project laravel/laravel mi-proyecto-laravel
```

En el siguiente comando tenemos "composer" que es el programa que se encarga de instalar Laravel en el nuevo proyecto. "create-project" es el subcomando de composer para crear un nuevo proyecto. "laravel/laravel" es el nombre del proyecto de base que vamos a usar para este nuevo proyecto creado en local, indica que es un proyecto llamado "laravel" que pertenece a la organización "laravel". Por último "mi-proyecto-laravel" es el nombre del proyecto que estamos creando.

Opcionalmente podríamos también indicar la versión de Laravel que queremos instalar, por ejemplo:

```git
composer create-project laravel/laravel mi-proyecto-laravel 5.5.*
```



### Editor Visual Studio Code

Instalar extensiones para facilitar el entorno de trabajo:

Abrir Visual Studio Code y en la parte de la izquierda pulsar en el botón de extensiones y buscar por laravel

Extensiones opcionales instaladas:

1. Laravel Blade Snippets (para la gestión de vistas)
2. Laravel Blade (para la gestión de vistas)
3. Laravel intelissense (para la ayuda a escribir código)
4. Laravel docs (para ayuda de documentación a la hora de escribir código)



### Patrones de arquitectura:

1. Modelo Vista Controlador (**MVC**) patrón por defecto: 

   <img src="/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-03-25 09-13-15.png" style="zoom:50%;" />

   

   **Cliente** o usuario: solicita una información a traves de una ruta, por ejemplo blog, lo que hace primero es ir a un router dispacher con su controlador asociado que es que hace la gestión de la petición:

   El **controlador** pide al modelo y solicita la información necesaria de las tablas de las bases de datos.

   El **modelo** va a devolver la información al controlador de todos los datos que se han solicitados sin necesidad de tener que ejecutar ninguna instrucción sql de forma explicita, lo hace a través de la ejecución de un ORM (Object-Relational Mapping) (que será la pieza que va a ayudar a vincular nuestros modelos con la base de datos) en laravel por defecto el ORM es Eloquent aunque también se puede modificar, se puede también utilizar doctrine, cada ORM tiene sus particularidades.

   Una vez que tiene la respuesta, la puede devolver en dos formatos:

   - API (si solo tiene back no tiene frontal) 
   - **Vista** Si tiene full (tanto front como back) que será una plantilla para construir un html donde se encontrarán los datos para mostrarlos a traves del navegador y muestra al usuario el resultado.

   Se podria añadir a la arquitectura MVC :

   - un **middelware** (software que se sitúa entre un sistema operativo y las aplicaciones que se ejecutan en él. Básicamente, funciona como una capa de traducción oculta para permitir la comunicación y la administración de datos en aplicaciones distribuidas.) Se situará entre las peticiones de la ruta y el controlador para verificar si todo está correcto, si es así va a dejar que el controlador se ejecute y si no ejecutará la acción correspondiente. Un ejemplo de middleware puede ser un login para ver si el usuario está autentificado.
   - un **observador** (observer), por ejemplo un unicomer que avise si ha habido una nueva compra y si es así genere una factura.

   

   NOTA:

   **Eloquent** es el ORM (Object-Relational Mapping) de Laravel, el cual proporciona una forma de acceder a los datos de una base de datos de una manera sencilla y consistente. Eloquent hace que sea muy fácil trabajar con la base de datos en Laravel, ya que proporciona una forma sencilla de interactuar con los datos sin tener que escribir consultas SQL manualmente.

   Para usar Eloquent, primero debes definir un "modelo" para cada tabla de la base de datos con la que necesites interactuar. Por ejemplo, si tienes una tabla de usuarios, podrías definir un modelo "User" para representar a cada fila de la tabla. Luego, puedes utilizar ese modelo para realizar operaciones CRUD (crear, leer, actualizar y eliminar) en la tabla de usuarios de manera sencilla.

   Para configurar un modelo en Laravel Eloquent, debes definir una clase que extienda de la clase `Model` de Laravel. Esta clase debe tener el mismo nombre que la tabla de la base de datos que quieres representar en singular.

   Por ejemplo, si tienes una tabla de usuarios llamada "users", podrías definir un modelo de "User" de la siguiente manera:  

   ```php
   <?php
   
   namespace App\Models;
   
   use Illuminate\Database\Eloquent\Model;
   
   class User extends Model
   {
       //
   }
   ```

   Luego, puedes definir distintos atributos y métodos en tu modelo para personalizar su  comportamiento. Algunas cosas que puedes configurar en un modelo son:

   - El nombre de la tabla: por defecto, Eloquent asume que la tabla tiene el mismo nombre en plural y en minúsculas que el modelo, pero si tu tabla tiene un nombre diferente, puedes especificarlo con la propiedad `$table`. Por ejemplo:

     ```php
     <?php
     
     class User extends Model
     {
         protected $table = 'my_users';
     }
     ```

     

   - El nombre de la clave primaria: por defecto, Eloquent asume que la clave primaria de tu tabla se llama "id", pero si tu tabla tiene una clave primaria con otro nombre, puedes especificarlo con la propiedad `$primaryKey`. Por ejemplo:

     ```php
     <?php
     
     class User extends Model
     {
         protected $primaryKey = 'user_id';
     }
     ```

     

   - Los campos que se pueden rellenar de forma masiva: por defecto, Eloquent asume que todos los campos de tu tabla se pueden rellenar de [forma masiva](https://www.cursosdesarrolloweb.es/blog/asignacion-masiva-como-protegerse-en-laravel), pero si quieres especificar qué campos se pueden rellenar y cuáles no, puedes utilizar la propiedad `$fillable`. Por ejemplo:

     ```php
     <?php
     
     class User extends Model
     {
         protected $fillable = ['name', 'email'];
     }
     ```

     

   - Esto significa que cuando utilices el método `create` o `update` para crear o actualizar un usuario, solo se podrán rellenar los campos "name" y "email".



### Crear proyecto (aplicacion)

1. Con composer:

   ```bash
   composer create-project laravel/laravel miproyecto
   ```

   

2. A través del instalador de laravel

   ```bash
   composer require laravel/installer (Ejecutar esta instrucción solo una vez, se intalara en la ruta donde se ejecute)
   laravel new nombre_proyecto
   
   Para que funcione el comando de laravel tenemos que estar en la ruta que corresponda, si hiciese falta podemos crear un alias.
   alias laravel='/var/www/html/curso-laravel/.composer/vendor/bin/laravel'
   alias laravel='/var/www/html/curso-laravel/vendor/bin/laravel'
   
   Ej: 
   alias laravel='/var/www/html/curso-laravel/vendor/bin/laravel'
   laravel new helloworld
   ```

Se nos crea una arquitectura como la de la imagen:

![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-03-25 10-38-17.png)

Donde:

1. **.env**: es el fichero de configuración para configurar el entorno, como conectarse a la bd, a la cola de mensajeria,

2. .env.example: fichero de configuración del entorno que es el que se va a facilitar a otros desarrolladores sin comprometer ninguna información.

3. carpeta **routes** (routes dispatcher): vamos a tener las rutas o enrutadores
   1. api.php: para las rutas de nuestra api
   2. channels.php: (canales) para emitir eventos 
   3. console.php: donde vamos a definir diferentes comando dentro de nuestro sistema
   4. web.php: rutas para entregar las vistas al navegador

4. carpeta **resources**: recursos de nuestro desarrollo
   1. css: hojas de estilo
   2. js: javascripts
   3. **views**: donde se ubicarán cada una de las vistas del proyecto.

5. carpeta **app**: carpeta **app**: es donde esta la aplicacion en si, seria el equivalente a la carpeta src  si estuviesemos en una aplicacion de javascript.
   1. console: donde vamos a ubicar diferentes comandos
      1. kernel.php
   2. exceptions: donde vamos a gestionar las excepciones o errores.
   3. **http**:
      1. **controllers**: donde se ubicarán los controladores del proyecto.
      2. middleware:
   4. models: donde se ubicarán los modelos del proyecto
   5. providers: los diferentes proveedores de servicios, de eventos, de ruta.

6. vite.config.js: es el entorno que va a hacer el empaquetado

7. phpunit.xml: podemos configurar la parte de testing

8. package,json: para controlar la gestion de las dependencias a traves de node

9. composer.lock: configuración de los paquetes que vamos a it utilizando.

10. composer.json: configuración de los paquetes que vamos a it utilizando.

11. artisan: es el gestor de comandos para lanzar desde el terminal, por ejemplo para la creacion de nuevos controladores, modelos,...

12. .gitattributes y .gitignore: para nuestro control de versiones.

13. .editorconfig: configuración del editor

14. carpeta **vendor**: en este nunca vamos a escribir código, es donde laravel va a ubicar el codigo de las dependencias que vamos a ir utilizando, es igual que la carpeta nodemodules cuando se utiliza node, cada vez que instalemos una dependencia se creará su directorio con toda la información de dicho paquete

15. carpeta **test**: donde vamos a ir ubicando nuestros test, tanto los test de feature como los test unitarios
    1. Feature: 
    2. Unit: test unitarios que son mas sencillos.

16. carpeta **storage**: para almacenar en disco ej: un usuario sube su foto de perfil, imagenes, pdf
    1. app: archivos de la aplicacion
    2. framework: archivos propios de framework, como los archivos de cache, de sesion. los va generar el propio framework 
    3. logs: logs del sistema

17. carpeta **public**: punto de acceso a nuestro sistema
    1. .htacces
    2. favicon.ico
    3. index.php: es el encargado de poner todo en marcha
    4. robots.txt

18. carpeta **lang**: ubicaremos una carpeta por cada archivo de localizacion, cuando trabajemos con varios idiomas, es decir crearemos un directorio para cada uno de los lenguajes.

    Para crear dicha carpeta, si no viniese creada por defecto

    ```bash
    php artisan lang:publish
    ```

    

19. carpeta **database**: para la gestion de la base de datos
    1. factories: para generar datos maxivos de pruebas, ejemplo crear 200 usuarios.
    2. migrations: para definir como vamos a mostrar nuestros datos en el sistema de persistencia, las tablas y estructuras
    3. seeders: para poblar de datos la base de datos.

20. carpeta **config**: carpeta de configuración: donde vamos a ubicar la configuración de nuestro sistema
    1. app.php: configuracion general de nuestra aplicacion.
    2. auth.php: configuración del sistema de autentificación.
    3. broadcasting.php: configuracion de la retransmision de eventos.
    4. cache.php: configuración de la cache
    5. cors.php
    6. database.php: configuracion de la base de datos
    7. filesystems.php
    8. logging.php:
    9. mail.php
    10. queue.php: configuración de las colas
    11. ...

21. carpeta **bootstrap**: se encarga de levantar el servicio



Nota: en laravel 11 en routes los ficheros de api.php y channels no me aparecen., para crearlos

```bash
php artisan install:api
php artisan install:broadcasting
```



#### Poner en marcha el proyecto Laravel con el servidor integrado en PHP 7

Aunque puedas servir Laravel desde servidores web de terceros, como Apache o Nginx, no es necesario para la etapa de desarrollo, ya que PHP ya viene con un servidor que podemos lanzar desde la línea de comandos.

Puedes hacerlo mediante el siguiente comando:

```git
php artisan serve
```

Al ejecutar ese comando nos aparecerá un mensaje con la ruta del servidor recién instanciado, algo como http://127.0.0.1:8000 (lo de ":8000" es el puerto, por si no has visto nunca una dirección acabada así). La salida de la consola será más o menos como la que ves en esta imagen:

![img](https://desarrolloweb.com/archivoimg/general/4431.png)

Abriendo esa URL anunciada para nuestro servidor, con tu navegador preferido, deberías ver la página de bienvenida de una aplicación recién instalada con Laravel.

**Nota:** obviamente este servidor integrado en PHP está bastante limitado. Aunque la aplicación PHP podrá ejecutarse y funcionar en local para el desarrollo, en entornos de producción lo normal será instalar esta aplicación encima de un servidor web potente, como Apache o Nginx.



NOTA: al instalar php8.2 se me instala laravel 11 y al ejecutar php artisian serve me da error, para solucionarlo

```
composer update --ignore-platform-reqs
composer dumpautoload -o  
sudo apt-get install php8.2-xml
```

Al ejecutar php artisian serve me salen los siguientes errores en el navegador al poner 127.0.0.1:8000:

Error: Illuminate \ Encryption \ MissingAppKeyException para solucionarlo, desde la terminal dentro del proyecto:

```bash
php artisan key:generate
php artisan config:clear
```

Error de sesion, para solucionarlo en el archivo .env he cambiado

```php
SESSION_DRIVER=database
por 
SESSION_DRIVER=file
```

Si todo funciona correctamente en el navegador nos mostrará la pagina de laravel, el funcionamiento de un proyecto al lanzar el servidor es.

1. Abre de la carpeta public el fichero index.php y llama a la ruta (routes/web.php)

2. La ruta de routes/web.php lo que hace al poner el raiz es que devuelve la vista welcome.php

   ```php
   Route::get('/', function () {
       return view('welcome');
   });
   ```

3. La vista (resources/views/welcome.blade.php) contiene el html con el contenido que nos muestra la pagina de laravel de nuestro navegador



### Crear nuestra primera ruta

Desde routes/web.php

Importar la clase Route, para generar nuevas rutas.

```php
use Illuminate\Support\Facades\Route;
```

Esta clase Route tiene una serie de métodos estáticos y para acceder a ellos hay que poner ::

Por defecto hay que enviarle dos valores: la ruta y el controlador que controla esa ruta.

```php
Route::metodo_x('mi/ruta/', ControladorDeLaRuta)
```

Asi el routerDispatcher toma la ruta y llama al controlador que la gobierna.



Metodos que vamos a destacar:

**view**: Es un atajo, por ejemplo si queremos usar un get que muestra una vista estática, que no necesita de controlador ni modelo para obtener ningún dato, podemos utilizar directamente la ruta view, para pintar directamente la vista sin acudir a un controlador, pintará la vista que le indiquemos como argumento, esa ruta va a comenzar siempre desde resources/views, es decir si pongo welcome, seria el equivalente a resources/views/welcome y a este metodo hay que añadirle que ruta es

```php
Route::view('/','welcome');
```

Alas rutas le podemos asociar un nombre, para ello utilizamos -> name

```php
Route::view('/','welcome')->name('welcome');
```

Para peticiones http y hará lo que indica el verbo: **get, post, put, delete, patch**.



Una vez abierto observarás que tiene una llamada a un método Route::get(). Ese es el método que usaremos para generar las rutas.

Guiándonos por el ejemplo de ruta que encontramos podemos crear nuestra propia ruta.

```php
Route::get('/test', function(){
	echo "Esto es una simple prueba!!";
});
```

En la version 8 (que es la que tengo), el archivo que contiene Route::get() está en routes/web.php

```php
Route::get('/', function(){
	echo "Esto es una simple prueba!!";
});
```



Aunque tendremos que volver en breve sobre las explicaciones del sistema de rutas, es importante señalar algunos puntos.

1. Hay que fijarse que cualquier ruta corresponde con un verbo del HTTP (get, post, etc.), que es el nombre del método que estamos invocando sobre la clase Route. En nuestro caso usamos el método get, que es el más común de las acciones del protocolo HTTP.
2. Además observa que ese método recibe dos parámetros, el primero de ellos es el patrón que debe cumplirse para que esa ruta se active. En nuestra ruta hemos colocado "/test" que quiere decir que desde la home de la aplicación y mediante el nombre "test" se activará esa ruta. En este caso el patrón es una simple cadena, pero en general podrá ser mucho más complejo, generando partes de la ruta que sean parámetros variables. Todo eso lo estudiaremos más adelante.
3. Como segundo parámetro al método get() para definir la ruta indicamos una función con el código a ejecutar cuando Laravel tenga que procesarla. Observarás que es una "función anónima" cuyo código es un simple echo para generar una salida.



**Nota:** Para quien no lo sepa, una función anónima es simplemente una función que no tiene nombre. Están disponibles en PHP a partir de la versión 5.3. Estas funciones se usan típicamente como parámetros en funciones o como valores de retorno y quizás quien venga de Javascript las conocerá más que de sobra, porque en ese lenguaje se usan intensivamente. Otro nombre con el que te puedes referir a funciones anónimas es "closure".

#### Acceder a nuestra ruta

Viene la parte más fácil, que es acceder con el navegador a la nueva ruta que acabamos de definir. Si tu proyecto estaba en un virtualhost, usarás el nombre de tu dominio asociado a ese virtualhost, seguido con el patrón de la ruta que acabamos de crear ("/test"), quedando algo como esto:

```php
http://example.com/test
```

Accediendo a esa dirección deberías ver el mensaje configurado en la closure enviada al generar la ruta.



### Crear una vista:

Creamos un directorio en resources/views y en el un archivo nombre_archivo.blade.php

Siempre tienen las extension blade.php, ya que blade es el generador de plantillas para las vistas.

Ej: creamos landing/about.blade.php

Para llamar a las vistas desde una ruta no se utiliza / sino que se utiliza . para movernos en los directorios

```php
Route::view('/','landing.about')->name('about');
```

Nunca en el nombre de la vista se pone la extension blade.php



Iniciamos la vista con el template, escribimos html:5 y automaticamente nos escribe

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    
</body>
</html>
```

Y en el body incluimos

```html
<h1>Hello World</h1>
```



Creamos otra vista en landing llamada index.blade.php incluyendo en el body

```html
<h1>Home</h1>
```



Desde la ruta resources/web.php llamamos a las dos vistas:

```php
Route::view('/', 'landing.index')->name('index');
Route::view('/about', 'landing.about')->name('about');
```

Nota: la URI (ruta) en este caso /about no tiene que existir fisicamente, es la ruta como queremos acceder a ese fichero desde el navegador (http://127.0.0.1:8000/about)



Desde el navegador si ponemos:

http://127.0.0.1:8000/ Nos muestra Home

http://127.0.0.1:8000/about Nos muestra Hello World



## Blade

Para hacer pruebas nos creamos un proyecto dentro de curso-laravel con nombre blade

```php
alias laravel='/var/www/html/curso-laravel/vendor/bin/laravel'
laravel new blade
    
Para que nos funcione con php8.2 y laravel 11:
composer update --ignore-platform-reqs
composer dumpautoload -o  
    
php artisan key:generate
php artisan config:clear
    
SESSION_DRIVER=database
por 
SESSION_DRIVER=file
```

Eliminamos la ruta y la vista de welcome que viene por defecto y nos creamos una llamada index

vista index.blade.php

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    <h1>Index</h1>
</body>
</html>
```

La llamamos desde routes/web.php

```php
Route::view('/', 'index')->name('index');
```



Creamos tres vistas con sus correspondientes rutas para nuestro landing: about, services y contact, por ahora con el contenido inicial de html:5

```php
Route::view('/about', 'about')->name('about');
Route::view('/services', 'services')->name('services');
Route::view('/contact', 'contact')->name('contact');
```

Ahora mismo todas nuestras vistas tienen el mismo codigo cambiando solamente una linea en cada archivo, por tanto el codigo no es eficiente, ya que se repite el mismo codigo y si queremos hacer por ejemplo una modificacion en nuestro head tendriamos que ir archivo por archivo para realizar dicho cambio.

El gestor de plantillas blade, nos va a ayudar a generar el contenido html, para ello:

1. Creamos dentro del resources/views un directorio llamado layouts (diseños) y en este directorio vamos a ir albergando las partes comunes de nuestras vistas.

2. Dentro de **layouts** creamos un archivo **landing**.blade.php en el que vamos a crear la estructura inicial de html:5 (que es código que se repite en las 4 vistas que tenemos por ahora )

   ```html
   <!DOCTYPE html>
   <html lang="en">
   <head>
       <meta charset="UTF-8">
       <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <meta http-equiv="X-UA-Compatible" content="ie=edge">
       <title>Document</title>
   </head>
   <body>
       
   </body>
   </html>
   ```

   Dentro de este código como lo vamos a querer extender al resto de vistas tenemos que definir que cosas van a ser diferentes en cada vista, por ejemplo :

   - el titulo en lugar de Document en todas las vistas cada una tendrá su titulo.
   - el body también será diferente

3. Para distinguir las partes que van a cambiar, se hace con la directiva **@yield**, para que nuestro layout sepa que la vista le tiene que inyectar ese contenido, y como tenemos dos secciones tenemos que saber también a que parte corresponde.

   ```html
   <!DOCTYPE html>
   <html lang="en">
   <head>
       <meta charset="UTF-8">
       <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <meta http-equiv="X-UA-Compatible" content="ie=edge">
       <title>
           @yield('title')
       </title>
   </head>
   <body>
       @yield('content')
   </body>
   </html>
   ```

4. En cada vista, añadimos la directiva @extends para indicarle que queremos que utilize la vista layouts/landing

   ```php
   @extends('layouts.landing')
   ```

   Recordar que en las vistas se utiliza . en lugar de / para las rutas

5. Para indicar el valor que queremos en cada seccion de la vista landing

   ```
   @section('name','content')
   
   Ej: @section('title','content')
   ```

   Nota: no es obligatorio cumplimentar todas las secciones

   

   Si no queremos que en la directiva @section utilice simplemente una cadena de texto, si no que sea por ejemplo código html, tenemos que utilizar la directiva @endsection y entre esas dos directivas introducir el código

   ```html
   @extends('layouts.landing')
   
   @section('title','Home')
   
   @section('content')
       <h1>Index</h1>
   @endsection
   ```

6. Asi si queremos meter codigo comun a todas las vistas, solo tendría que modificar el landing de layouts

   ```html
   <body>
       <h1>Title</h1>
       @yield('content')
   </body>
   ```



### Crear un menu 

Para movernos dentro de las secciones anteriores (about, index, services, contact)

Para crear un menu de navegacion lo vamos a crear dentro de layout landing, por ejemplo :

Este menu de navegación será una lista en la que cada elemento será un enlace a una seccion

```html
<header>
    <nav>
        <ul>
            <li><a href="">Home</a></li>
            <li><a href="">About</a></li>
            <li><a href="">Services</a></li>
            <li><a href="">Contact</a></li>
        </ul>
    </nav>
</header>
```

Nota: Codigo emmet de html (son atajos de html) que escribe el código html de manera rápida. Ejemplo

```html
Al escribir ul>li*4>a escribe automáticamente:

<ul>
    <li><a href=""></a></li>
    <li><a href=""></a></li>
    <li><a href=""></a></li>
    <li><a href=""></a></li>
</ul>
```

Tenemos que tener en cuenta:

1. Si seguimos creando contenido vamos a tener muchas líneas de código.
2. Podemos tener otro layout en el que queramos tambien el mismo menu, tendríamos que duplicar dicho código y esto no lo queremos.

Para solucionar esto, añadimos otra herramienta que es el uso de **parciales**. Para ello creamos otra carpeta dentro de layouts que la vamos a llamar **_partials**, aunque la podemos llamar como queramos, pero ese es el nombre que mas se utiliza y dentro de este creamos un archivo llamado menu.blade.php y en este cortamos y pegamos el codigo del menu

Archivo resources/views/layouts/_partials/menu.blade.php

```html
<header>
    <nav>
        <ul>
            <li><a href="">Home</a></li>
            <li><a href="">About</a></li>
            <li><a href="">Services</a></li>
            <li><a href="">Contact</a></li>
        </ul>
    </nav>
</header>
```

Para incluirlo en nuestro layout landing, utilizamos la directiva @include

```html
@include('layouts._partials.menu')
```



Para que nuestras rutas vayan a la url correspondiente, nos falta ponerle la ruta

```html
<li><a href="/">Home</a></li>
<li><a href="/about">About</a></li>
<li><a href="/services">Services</a></li>
<li><a href="/contact">Contact</a></li>
```

<img src="/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-03-26 20-11-13.png" style="zoom: 33%;" />

Este formato funciona correctamente, si pulso en cada enlace, nos lleva a la seccion que corresponde, pero no es la manera más adecuada, por que esta poniendo rutas fuera de routes lo que puede provocar que nuestro proyecto sea más frágil, originar enlaces rotos contra posibles modificaciones, por ejemplo si en routes web.php cambiamos /about por otro nombre habria que cambiar about en todas las vistas y sitios donde se esté utilizando.

Para hacerlo de manera correcta en lugar de poner la ruta debemos utilizar el nombre que le hemos asignado a la ruta

```php
Route::view('/about', 'about')->name('about');

asi si cambiamos la ruta
Route::view('/nosotrol', 'about')->name('about');

como el nombre sigue siendo el mismo (about) seguiría funcionando todo bien.
```

Para ello llamar a la ruta con el nombre que corresponda, como es una funcion, no se puede meter directamente entre las comillas, hay que escaparlo con el moustache {{}}

```html
<li><a href="{{ route('index') }}">Home</a></li>
<li><a href="{{ route('about') }}">About</a></li>
<li><a href="{{ route('services') }}">Services</a></li>
<li><a href="{{ route('contact') }}">Contact</a></li>
```

asi no nos interesa la url de la ruta, si no la ruta con nombre 'x'



Para que el menu no sea fijo y pueda tener partes modificables dependiendo desde donde se utilice, para ello utilizamos los componentes blade



### Componentes Blade

Los componentes blade van a ser como los includes, los parciales, pero a diferencia de estos vamos a poder definir en su contenido diferentes secciones que nosotros vamos a poder manipular posteriormente

Ejemplo en la seccion services, queremos hacer una tarjeta (card) dentro del contenido que lo que va a hacer es pintar la información del servicio en concreto, por ejemplo queremos tener una tarjeta que va a contener un título que va a contener la seccion que sea y va a tener un parrafo

Ej: en views/services

```html

@section('content')
    <h1>Services</h1>
    <div>
        <h3>Service 1</h3>
        <p>lorem ipsum dolor sit amet</p>
    </div>
    <div>
        <h3>Service 2</h3>
        <p>lorem ipsum dolor sit amet</p>
    </div>
    <div>
        <h3>Service 3</h3>
        <p>lorem ipsum dolor sit amet</p>
    </div>
    <div>
        <h3>Service 4</h3>
        <p>lorem ipsum dolor sit amet</p>
    </div>
    <div>
        <h3>Service 5</h3>
        <p>lorem ipsum dolor sit amet</p>
    </div>
    <div>
        <h3>Service 6</h3>
        <p>lorem ipsum dolor sit amet</p>
    </div>
@endsection
```

Hay mucho codigo que se repite y esto tampoco lo queremos, por eso vamos a utilizar los **componentes**, para ello:

Crear en el mismo sitio desde donde lo vamos a utilizar, creamos un directorio llamado _components (resources/views/ _componets) y un archivo llamado card.blade.php y hay vamos a tener el contenido de nuestra tarjeta

```html
<div>
    <h3>Service 1</h3>
    <p>lorem ipsum dolor sit amet</p>
</div>
```

Y en este código vamos a tener partes que van a ser modificadas con contenido que envien desde la vista que la llame, para ello creamos slots  metido entre {{}} y asignandole un nombre de variable en php, recordar que estas variables llevan el $ delante 

```html
<div>
    <h3>{{ $title }}</h3>
    <p>{{ $content }}</p>
</div>  
```

Y asi desde el elmento donde hemos creado las 6 tarjetas antes, en poner del codigo 6 veces, haremos la llamada 6 veces (esto es asi por ahora, mas adelante veremos como crear un for para hacerlo x veces)

@section para llamar a layouts y @slot para llamar a componentes, de igual modo si queremos meter html dentro de @section o de @slot tenemos que utilizar @endsection o @endslot y dentro de ellas meter el codigo html

```php
@section('content')
    <h1>Services</h1>

    @component('_components.card')
        @slot('title','Service 1')
        @slot('content','Lorem ipsum dolor set aimet.')
    @endcomponent
    @component('_components.card')
        @slot('title','Service 2')
        @slot('content')
            <h3>Example</h3>
            <p>Lorem ipsum dolor set aimet.</p>
        @endslot
    @endcomponent
@endsection
```

Asi otras vistas pueden tambien utilizar este componente y si hay que modificar el componente al tenerlo aislado se cambia automáticamente en todos los sitios.



Si queremos cambiar el formato de la tarjeta nos vamos al component y desde hay por ahora metemos el estilo (css) a capon (en linea)

```html
<div style="border: 1px solid black; border-radius: 5px; padding:10px; margin:5px;">
```

<img src="/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-03-27 09-42-57.png" style="zoom:50%;" />



### Carga de Recursos 

Los recursos pueden ser imagenes, videos, css

Para cargar un recurso tenemos que ver de donde viene :

- carga de recursos dinámicos (estos ya los veremos) que se pueden coger de un bd por ejemplo.

- carga de recursos estáticos , los albergaremos en la carpeta **public** una carpeta que vamos a crear llamada **assets**

  - Para cargar una imagen : creamos una carpeta **img** donde vamos a guardar imagenes

    ```html
    <image src="assets/img/wall3.jpg" alt="example" width="128"></image>
    ```

    <img src="/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-03-27 09-59-11.png" style="zoom:50%;" />

    Asi no lo está haciendo bien, no lo ha cargado como un recurso estático sino de manera directa y podria ocasionar tambien algún enlace roto. Para hacerlo como recurso, desde la ruta, cuando llamamos a services, le añadimos el nombre example que le hemos asignado a la imagen.

    ```php
    Route::view('/services', 'services')->name('services');
    por
    Route::view('/services/example', 'services')->name('services');
    ```

    <img src="/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-03-27 09-58-55.png" style="zoom:50%;" />

    Asi muestra una imagen rota, ya que esta en public/assets/img y piensa que esta dentro de la carpeta services, para llamarlo como un recurso estatico, tenemos que llamar a la imagen con el metodo asset indicandole la ruta.

    ```html
    <image src="{{ asset('assets/img/wall3.jpg') }}" alt="example" width="128"></image>
    ```

    Asi no importa la ubicacion de la vista.

    

  - Para cargar un css: creamos una carpeta **css** y dentro de esta un archivo **style.css** (Mas adelante veremos que las hojas de estilo no se tienen porque guardar en la carpeta pública)

    ```css
    h1{
    	color:red;
    }
    ```

    Si queremos por ejemplo que este css se aplique a todo nuestro proyecto, nos vamos al layout de landing y en el <head> incluimos ese estilo

    ```html
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="{{ asset('assets/css/style.css') }}">
        <title>
            @yield('title')
        </title>
    </head>
    ```

    Asi ahora todos nuestros <h1> aparecerán en rojo.

  

  NOTA: Algunas estructuraciones que se suelen hacer es:

  - crear un @yield('styles') en la cabecera de layout para que en las vistas se pueda personalizar cada una de una manera y dentro de la vista se pondria:

    ```
    @section('styles')
    	<link rel="stylesheet" href="{{ asset('assets/css/stylex.css') }}">
    @endsection
    ```

  - crear un @yield('scripts') al final del body porque en algunas vistas necesitemos cargar un script

  - Aunque tengamos definidos varios @yields en el landing desde las vistas no hace falta utilizarlos 

  

  Ejemplo de un css que podemos utilizar para el ejemplo de blade

  ```css
  * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      color: #666;
  }
  
  header {
      width: 100vw;
      height: 50px;
      background-color: beige;
      padding: 10px;
      display: flex;
      font-weight: bold;
  }
  
  header nav {
      width: 100vw;
  }
  
  header nav ul {
      list-style-type: none;
      display: flex;
      flex-wrap: wrap;
  }
  
  header nav ul li {
      margin: 5px;
  }
  
  main {
      padding: 10px;
  }
  
  header nav ul li a {
      color: #999;
      text-decoration: dashed;
  }
  
  header nav ul li a:hover {
      color: lightgreen;
  }
  
  .card {
      border: 1px solid #ccc;
      border-radius: 10px;
      padding: 10px;
      margin: 5px;
      width: 200px;
      display: inline-table;
  }
  
  .card p{
      font-size-adjust: 10px;
  }
  
  .cards {
      display: flex;
      flex-wrap: wrap;
      width: 100vw;
  }
  ```

  Para utilizarlas hemos modificado en el codigo

  en landing hemos añadido un main

  ```html
  <body>
      @include('layouts._partials.menu')
      <main>
          @yield('content')
      </main>
      @yield('scripts')
  </body>
  ```

  En card.blade.php

  ```html
  <div class="card"> en lugar de lo que teniamos a capon
  ```

  En services.blade.php hemos creado un div

  ```html
  <div class="cards"></div>
  ```

  

## Migraciones y Modelos

Hasta ahora todo lo que hemos visto ha sido de manera estática, no hemos necesitado ningún sistema de persistencia. Para hacer las pruebas creamos un proyecto nuevo **modeldata**

Para incluir un sistema de persistencia, database/migrations

Laravel debe de ser capaz de ser autosuficiente para crear la estructura de datos que necesita utilizar si necesidad de que esta sea provista del motor de base de datos, dicho de otra manera, laravel debe incluir la lógica necesaria (ficheros necesarios) para construir todo el sistema de persistencia. Y ademas esta logica tiene que crearse sin escribir sentencias sql, si no que laravel es capaz de hacer esa descripcion de los modelos que dede contener (entidades y relaciones de nuestra base de datos) para que puedan dar soporte al proyecto y eso es lo que esta en **migrations**



1. Configurar el sistema de base de datos al cual nos vamos a estar conectando, en el archivo .env donde van a estar los datos de configuración, para la base de datos tenemos:

   ```mysql
   DB_CONNECTION=mysql (tanto para mysql como mariadb)
   DB_HOST=127.0.0.1
   DB_PORT=3306
   DB_DATABASE=modeldata
   DB_USERNAME=root
   DB_PASSWORD=
   ```

   En el archivo config/database.php viene las distintas configuraciones para las posibles conexiones:

   1. sqlite: es una base de datos en fichero, que puede ser interesante cuando nos encontremos en un entorno de desarrollo y vamos a utilizar en un entorno de producción. Son bases de datos fijas para realizar pruebas, mientras se realiza el desarrollo.
   2. mysql: para MySQL o mariadb gestor de base de datos relacional (mariadb es un derivado de MySQL con licencia GPL)
   3. pgsql:  PostgreSQL, gestor de base de datos relacional orientada a objetos de codigo libre
   4. sqlsrv: sqlserver gestor de base de datos relacional de Microsoft  

   

   NOTA: en laravel 11 por defecto el motor de bd es sqlite y en versiones anteriores es mysql

   

   Si quiesemos utilizar cualquiera de estos no tendriamos que añadir ninguna configuracion adicional.

   Si queremos utilizar otro gestos de base de datos, deveriamos incluir su configuracion indicando cual es el driver que tendremos que instalar para utilizar la base de datos y los datos que necesitaria dicho driver para poder conectarse.

​	En nuestro caso vamos a utilizar mysql:

​	DB_CONNECTION=mysql (indica el motor de base de datos)
​	DB_HOST=127.0.0.1 (indica donde se encuentra la bd, por defecto tenemos localhost ya que vamos a 					      trabajar en local)

​					      si estuviesemos en otro ordenador tendriamos que indicar la url 

​	DB_PORT=3306 	(puerto de la conexion, por defecto 3306)
​        DB_DATABASE=modeldata   (nombre base de datos)
​        DB_USERNAME=root		(usuario)
​        DB_PASSWORD=			(contraseña)

1. 
2. Configurar usuario y contraseña para conectarnos a la bd
3. Crear una bd con nombre modeldata
4. Poner nombre de la data base



Por defecto en la ruta database/migrations laravel por defecto trae unos archivos de creacion de tablas:

en laravel 11 hay 3 archivos

![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-03-27 17-54-11.png)

en laravel <11 hay 4 archivos

​	![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-03-27 17-53-58.png)



El primero de ellos se encarga de crear la tabla usuarios

El segundo de ellos se encarga de resetear passwords

El tercero de ellos para trabajar los jobs (trabajos asincronos) asi se registra en esta tabla cuando falla

El ultimo de ellos para gestionar los tokens de acceso,



NOTA: No es necesario que incoporemos estas tablas en nuestra bd.



### Migraciones

Para crear las tablas con los archivos de las migraciones:

```
php artisan migrate		
```

Si nos diese un error instalar: sudo apt-get install php8.2-mysql (poner la version que estemos utilizandos) 

Si todo ha ido bien:

![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-03-28 19-58-12.png)

Y en la base de datos modeldata se habran creado las tablas correspondientes:

![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-03-28 19-59-36.png)

Laravel siempre crea ademas la tabla **migrations**, esta tabla es muy importante en ella se va a ir almacenando la informacion de los archivos que hemos migrado.

![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-03-28 20-01-10.png)	

![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-03-28 20-21-12.png)		



Cuando hagamos una modificacion en las tablas, hay que volver a ejecutar php artisan migration y nos cargará las modificaciones.



Vamos a crear nosotros uno, imaginemos que vamos a hacer un sistema de notas con tareas que vamos a realizar, estas tendrán un titulo, una descripcion de la tarea y un booleano para saber si hemos echo o no esa tarea.

```bash
php artisan make:migration nombre_tabla

Ej: php artisan make:migration create_notes_table
```

El comando make lo vamos a utilizar mucho, cada vez que queramos crear algo, ej: make:model

El nombre a poner por comvención debe indicar lo que va a hacer create_ y el nombre de la tabla en ingles, plural y en minúsculas.

Despues de ejecutar dicho comando, crea un archivo de migracion en la carpeta database/migrations con el nombre que le hemos dado mas la fecha y hora para que el archivo sea unico.

Si abrimos el archivo vemos que laravel por defecto crea siempre un id y un timestamp

<img src="/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-03-28 20-33-37.png" style="zoom: 67%;" />

Vamos a ver su estructura:

Es una clase, a traves de una clase anonima que extiende de migrations, que es una clase de sistema que tiene todos los métodos y propiedades para poder generar la contrucción en la base de datos

```php
return new class extends Migration
```

Esta clase siempre va a contener dos metodos:

- up: va a contener toda la información necesaria para crear la tabla .

  En ella lo primero que tenemos es la clase schema, es la que contiene todos los métodos necesarios para poder realizar la creación de los elementos . Es un método estatico y por ello va con :: y dentro podemos utilizar: 

  - create (nombre_tabla, funcion): para crear una tabla

    ```php
    Schema::create('notes', function (Blueprint $table){
    	$table->id();
        $table->timestamps();
    }
    ```

    Esta estructura se crea automáticamente con el php artisan make:migration

    Para nuestro ejemplo vamos a crear:

    ```php
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('notes', function (Blueprint $table) {
            $table->id();
            $table->string('title', 255);
            $table->string('description', 255);
            $table->boolean('done');
            $table->timestamps();
        });
    }	
    ```

    En lugar de crear la tabla desde mysql, lo estamos creando con una programacion orientada a objetos, mediante la cual a través de un objeto de la clase Blueprint.

    Podriamos tener tambien:

    ```php
    $table->integer('example');
    $table->unsignedInteger('example');
    $table->bigInteger('example'); -> este lo utilizaremos para las claves foraneas.
    $table->float('example');
    $table->double('example');->para valores de punto flotante
    $table->boolean('example');
    $table->enum('state','['DRAF','PUBLISHED','DELETED']');-> como primer valor estado , y de segundo un array    
    $table->text('example'); -> Para textos mas largos que un string		
    ```

    Para añadir mas definiciones a la tabla que estamos creando lo hacemos con la concatenación de métodos, por defecto todos los campos son obligatorios, pero si queremos por ejemplo que descripcion sea null y que donde por defecto sea false.

    ```php
    $table->string('description', 255)->nullable();
    $table->boolean('done')->default(false);
    ```

    Ejecutamos: php artisan migrate

    ![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-03-28 21-08-47.png)

    La nueva migracion tiene un 2 en batch que nos indica que se ha migrado en el segundo lote.

    La estructura de la tabla que hemos creado es: 

    ![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-03-28 21-09-13.png)

    Los campos create_at y updated_at se utilizan para poder controlar cuando se crea o cuando se actualiza nuestra tabla.

  - table: para modificar una tabla existente

    Para modificar datos que ya hemos migrado, por ejemplo queremos añadir un campo fecha a la tabla 'notes'

    Hay tres maneras:

    - Eliminar a mano desde sql la tabla modificar el archivo de migracion para añadir la modificacion y cambiarle el nombre del archivo para que lo ejecute el php artisan migrate

      ESTO NO SE DEBE HACER no se debe manipular desde sql, hay que hacerlas a traves de laravel.

      Por ejemplo si lo coje otra persona , le va a dar errores por todos los lados puesto que esa persona no ha hecho las modificaciones a mano.

    - La mas utilizada y mas sencilla, es ejecutar un roolbaking (echar para atrás las migraciones), echamos para atrás por ejemplo ese lote (tabla migrations)

      ```bash
      php artisan migrate:rollback
      ```

      Esto echa para atrás la ultima migracion, cada vez que se vaya ejecutando va borrando el lote (paquete) de las migraciones que se han ido ejecutando.

      Si lo hacemos una vez elimina el lote 2 (tabla notes)

      Si lo volvemos a ejecutar elimina el lote 1 (todas las otras tablas, excepto la tabla migrations)

      ![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-03-29 10-16-04.png)

      Y ahora ya podemos hacer la modificacion que queremos hacer

      

      Echando atrás todas las migraciones

      ```
      php artisan migrate:reset
      ```

      Si queremos echar para atrás una migración en concreto, tenemos que especificar el numero de lote que queremos quitar

      ```bash
      php artisan migrate:rollback --bacth=numero_lote
      ```

      Si queremos echar para atrás todas las migraciones y volverlas a cargar todo en un comando

      ```ç
      php artisan migrate:refresh
      ```

    - Hay veces en las que no nos interese hacer un rollback, por que haya relaciones con otras tablas, lo que hay que hacer es generar un nuevo archivo de migración con la actualización y en ese archivo utilizar el schema::table  

      ```bash
      php artisan make:migration update_notes_table
      ```

      y dentro del archivo 

      en la función **up**: estarań las modificaciones, añadir un campo, eliminar un campo existente,... 

      ```php
      public function up(): void
      {
          Schema::table('notes', function (Blueprint $table) {
              $table->string('author',255);
              $table->dropColum(['deadline']); (Elimina una columna, enviar un array con todas las columnas que queremos eliminar)
          });
      }
      ```

      en la función **down**: estará la acción que queremos que se ejecute si echamos atrás esta migración, es decir si hacemos un rollback.

      ```php
      public function down(): void
      {
          // Elimina la columna que vamos a crear en el up
          Schema::dropColumn(['author']);
      }
      ```

      

  - dropIfExists: eliminar una tabla si esta existe

- down: va a contener la información necesaria para tirar atrás la migración , es decir si nos arrepentimos y necesitamos cancelar una migración, va a contener la información para eliminar la tabla de nuestro sistema. Contiene por ejemplo:

  - dropIfExists: eliminar una tabla si esta existe (en los archivos de crear)



Para que otra persona utilice nuestro proyecto:

1. Crear un archivo .env de .env.example poniendo los valores de configuración de la bd
2. Ejecutar php artisan migrate para que se genere la estructura en tu sistema.



### Modelos

Para interactuar con la bd, no lo vamos a hacer directamente en sql, si no que lo vamos a hacer con los modelos.

Creamos un modelo 'Note', el nombre sera el equivalente en singular con la primera letra mayuscula de cada palabra. 

```bash
php artisan make:model NombreModelo

Ej: php artisan make:model Note
```

Con este comando se nos crea un archivo en app/Models/Note.php (por defecto siempre esta el modelp User.php)

Un modelo es crear una clase que extiende (hereda) de la clase Model, para utilizar todas las acciones de los modelos.

Se le incluye el HasFactory (que ya veremos lo que es).

Como hemos usado el nombre correcto de nombres (convención de nombres), el ya sabe a que tabla tiene que ir (notes). Si no utilizamos la convención de nombres hay que indicarle el nombre de la tabla. 

```php
protected $table = "nombretabla"

Ej: protected $table = "notas"
```



Asi desde el controlador podemos hacer acciones sobre la tabla a través del modelo:

```php
$note = new Note();
$note->title = "Hello world";
$note->description = "lorem ipsum";

$note->save(); -> esto guardaria los cambios en el sistema de persistencia (bd)
    
Note::get() -> nos traeria una búsqueda.
```

 Ya lo iremos viendo mas adelante





protected $table = se utiliza para hacer la vinculación con el sistema de persistencia, si hemos utilizado la convencion de nombres ya está echo por defecto.

**protected $fillable:** nos indica que campos van a poder ser cumplimentables, puede darse ocasiones en los que no queremos que se escriba algún campo, bien por que se escriba automaticamente, porque va a ocurrir a traves de otro proceso. 

Ej: el id y los timestamp no queremos por que se genera automáticamente.

```php
protected $fillable = [
    "title",
    "description",
    "deadline",
    "done"
];
```

**protected $guarded:** es lo contrario a fillable , contiene los campos que son protegidos, no es necesario cumplimentar ambos, puesto que si definimos $fillable, en $guarded irán todos los demás.

**protected $cast:** es para hacer casting de datos, cuando vayamos a recibir diferentes elementos, podemos querer forzar el casting de datos. Ej: queremos que el campo deadline sea de tipo date

```php
protected $casts = [
	"deadline" => "date"
];
```

Asi cuando recepcione los datos si no viene en ese formato el modelo hace el cast.

**protected $hidden:** sirve para evitar que nosotros estemos entregando datos que no queremos que sean entregados en la serializacion de datos, es decir ocultar datos, ejemplo cuando hacemos una api y tenemos un password, y este campo no queremos entregar esta informacion.

```php
protected $hidden = [
    'password'
];
```



Podemos observar que cuando creamos un modelo, éste por norma general siempre va a necesitar de su contraprestación, su contraparte en el sistema de estructura, es decir por cada modelo que creamos vamos a necesitar una migracion que ejecutar para que tengamos la tabla asociada en el sistema de persistencia. Por ello laravel nos va a ofrecer unos atajos para falicitarnos la creacion de estos elementos

Vamos a suponer que quiero crear un nuevo modelo. Ej: autor (para guardar información de los autores de las notas)

```bash
php artisan make:model Author --migration
```

Con esto crea el modelo y la migración en un solo paso, asi tambien nos evitamos problemas con la creacion de los nombres con la tabla 

Nos crea los archivos del modelo Author.php y la migracion _create_authors_table.php 



## Controladores

Configuración previa para hacer las explicaciones mediante pruebas:

- Creamos un proyecto controllers y una base de datos controllers.

- Configuramos .env con nuestra configuración para la base de datos.

- Modificamos la migración de la tabla users para añadir otros campos

  Asi podemos guardar la edad del usuario, direccion, codigo postal

  ```php
  $table->unsignedInteger('age')->default(18);
  $table->string('address')->nullable();
  $table->unsignedBigInteger('zip_code')->nullable();
  ```

- Modificamos en el modelo User.php: para añadir los campos que hemos añadido en la migración.

  ```php
  protected $fillable = [
      'name',
      'email',
      'password',
      'age',
      'address',
      'zip_code'
  ];
  ```

  ```php
  protected $hidden = [
      'password',
      'remember_token', -> se utilizará para la autentificación, cuando el usuario se registre
  ];
  ```

  remember_token -> se utilizará para la autentificación, cuando el usuario se registre

  email_verified_at -> cuando se verifique en el proceso

  los timestamp lo va a rellenar el sistema cuando ocurran modificaciones

- Ejecutamos las migraciones: php artisan migrate



Vamos a tener un usuario que va a controlar una ruta, esa ruta va a estar asociada a un controlador, el controlador va a recuperar los datos de modelo y se los va a ofrecer a una vista o a una API para que esa información se muestre.

Vamos a las rutas web (routes/web.php) eliminamos la ruta que hay y creamos una con el método estático. Lo que vamos a querer es que en el index nos muestre un listado con todos los usuarios del sistema. Entonces necesitamos controladores, vamos a crear un controlador por cada recurso (por ejemplo por cada tabla)

1. Crear controlador, por convención de nombres la primera letra de cada palabra va en mayúcula y la primera tambien va en mayúscula

```bash
php artisan make:controller UserController
```

 Esto nos crea un archivo en app/http/controllers/UserController.php que contiene una clase que extiende (hereda) de la clase Controller para poder utilizar los métodos que vayamos a necesitar

2. En los controladores vamos a ir declarando unas funciones publicas, y cada una de ellas va a ir destinada a controlar una vista.

   ```php
   public function index()
   {
       // De momento Rompe el flujo para que lo muestre nuestra vista
       dd("Hello world");
   }
   ```

3. Route::get() -> para hacer peticiones y mostrarlo en la vista, para ello hay que poner la ruta y el controlador, para ello hay que importarlo utilizando **use**

   ```php
   use App\Http\Controllers\UserController; 
   
   Route::get("/", [UserController::class, 'index'])->name('user.index');
   ```

   NOTA: He instalado la extension de visual studio code de php IntelliSense para que me complete las rutas por ejemplo en el use.

   Si nos vamos al navegador nos mostrará

   ![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-03-29 17-30-04.png)

   Route::post()-> cuando vayamos a enviar datos, ejemplo un formulario

4. Para que nuestro controlador, utilize una vista:

5. Crear una vista (resources/views) eliminamos la de welcome.php que viene por defecto y no la vamos a utilizar y creamos una vista con el Hello world , para ello creamos una carpeta user y dentro el archivo index.blade.php

   ```html
   <!DOCTYPE html>
   <html lang="en">
   <head>
       <meta charset="UTF-8">
       <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <meta http-equiv="X-UA-Compatible" content="ie=edge">
       <title>Document</title>
   </head>
   <body>
       <h1>Hello world</h1>
   </body>
   </html>
   ```

6. Modificamos el controlador index donde hemos hecho la prueba para que retorne la vista

   ```php
   public function index()
   {
       return view('user.index');
   }
   ```

   Nos mostrará en el navegador

   ![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-03-29 17-37-39.png)

Para que el controlador utilice el modelo para recuperar datos, tenemos varias formas

1. ORM

   1. Importar el modelo en el controlador.

      ```php
      use App\Models\User;
      ```

   2. En el controlador index antes de devolver la vista vamos a obtener los datos

      Eloquent (ORM de laravel), se basa en un patron de diseño que va a permitir concatenar métodos estáticos que nos va a permitir describir que tipo de datos estamos buscando.

      1. all()-> nos va a traer todos los registros.

         ```php
         $users = User::all();
         ```

         

   3. Devolver los datos a la vista

      En el return view('nombre_vista', datos_vista[])

      ```php
      return view('user.index', [
              'users' => $users
          ]);
      ```

      Si tuviesemos varios datos, separar por comas 

      Un atajo si la clave de los datos y la variable se llama igual, es muy habitual que se simplifique el contenido del código

      ```php
      return view('user.index', compact('users'));
      ```

      Del mismo modo, si tuviese mas datos se separarían por comas 

      Ej: return view('user.index', compact('users', 'notes', 'authors'));

   4. Modificamos el body de la vista de prueba con hello world para que muestre la lista, recorriendo la lista con la directiva @foreach.

      ```html
      <body>
          <h1>User list:</h1>
          <ul>
              @foreach ( $users as $user)
                  <li>{{ $user->name }}</li>
              @endforeach
          </ul>
      </body>
      ```

      Otras directivas de blade en html: @if-@else, @switch

      ```html
      @if ($users->isEmpty())
          <p>The user list is empty</p>
      @else
          <ul>
              @foreach ( $users as $user)
                  <li>{{ $user->name }}</li>
              @endforeach
          </ul>
      @endif
      
      @switch($age)
          @case(18)
              <h1>18 years old</h1>
              @break
          @case(19)
              <h1>19 years old</h1>
              @break
          @case(20)
              <h1>20 years old</h1>
              @break
          @default
              <h1>Another age</h1>
      @endswitch
      ```

      Esto tambien se podria hacer de dos maneras

      ```html
      Opción 1:
      
      @if ($users->isEmpty())
          <p>The user list is empty</p>
      @else
          <ul>
              @foreach ( $users as $user)
                  <li>{{ $user->name }}</li>
              @endforeach
          </ul>
      @endif
      ```

      ```html
      Opción 2: (mejor opción)
      @forelse ($users as $user)
          <li>{{ $user->name }}</li>
      @empty
          <p>The user list is empty</p>
      @endforelse
      ```

   5. Introducimos datos de prueba para comprobar que la vista funciona correctamente

      1. Lo normal es hacerlo con un sider o con los factories (pero todavia no vamos a verlo)

      2. Ahora lo vamos a hacer desde un controlador, por tanto nos creamos uno y una ruta

         ```php
         Route::get("/create", [UserController::class, 'create'])->name('user.create');
         ```

         ```php
         public function create()
         {
             // Opcion 1 creando un objeto user
             $user = new User;
             $user->name = 'Juanjo';
             $user->email = 'demo@demo.com';
             $user->password = Hash::make("123456");
             $user->age = 25;
             $user->address = "Calle Demostracion 12";
             $user->zip_code = 290909;
             $user->save();
         
             // Opcion 2
             User::create([
                 "name" => "Ruiz",
                 "email" => "info@demo.com",
                 "password" => Hash::make("12345678"),
                 "age" => 42,
                 "address" => "Avenida de pruebas 17",
                 "zip_code" => 280606,
             ]);
         
             
         }
         ```

         NOTA: para utilizar Hash y no de error, hay que incluir

         ```php
         use Illuminate\Support\Facades\Hash;
         ```

         

         Todo controlador tiene que retornar algo, en este caso quiero que en lugar de retornar una vista me retorne al raiz, lo haremos usando el nombre de la ruta en lugar de la url, por si cambiamos la url en algún momento, no tendremos que buscar donde se está utilizando

         ```php
         return redirect('/'); ESTO NO
         
         return redirect()->route('user.index'); ESTO SI
         ```

         

      3. El funcionamiento completo si en el navegador llamamos a la ruta de create, es que creará 3 usuarios y retornará a la ruta user.index que llama al controlador de index que muestra los usuarios. Ahora ya tendremos 3.

         

### FORMATOS PARA CONSULTAR DATOS

### Eloquent (ORM) (En MVC SI es recomendable)

1. La ventaja de Eloquent: 

   1. no tiene por que saber el motor de la base de datos que estemos utilizando, es eloquent el que hace la traduccion, trabaja de manera agnostica, sin saber el sitema de persistencia
   2. Nos mantenemos en una programacion orientada a objetos.

2. Desventajas de Eloquent:

   1. Fuerte acoplamiento a la infraestructura de trabajo , depende de laravel , o versiones de laravel

   2. No controla la eficiencia de consultas, cuando las consultas sean complicadas no sabemos si esta haciendo un join,..

      

Algunas instrucciones

1. where: se cumplan todas las condiciones

   ```php
   // obtiene los datos donde age sea 18
   $users = User::where('age',18)->get();
   // obtiene los datos donde age sea >18
   $users = User::where('age','>',18)->get();
   
   // Podemos ir concatenando varios where
   // obtiene los datos donde age sea >18 y zip_code = 290909
   $users = User::where('age','>',18)->where('zip_code',290909)->get();
   ```

2. orWhere: se cumpla o una de las condiciones

   ```php
   // obtiene los datos donde age sea >30 o zip_code = 290909
   $users = User::where('age','>',30)->orWhere('zip_code',290909)->get();
   ```

3. orderBy: ordena los registros de manera ascendente (asc) o descendente (desc)

   ```php
   // obtiene los datos donde age sea >18 y ordenalo descendente por edad
   $users = User::where('age','>',30)->orderBy('age','desc')->get();
   ```

4. limit: limita el numero de registros que nos va a devolver

   ```php
   // obtiene los datos donde age sea >18 con limite de 1 registro
   $users = User::where('age','>',30)->limit(1)->get();
   ```

   A este limit se le puede poner un offset, es decir decirle cuantos queremos que se salte

   Esto es útil para hacer paginaciones.

   En laravel 11, hay que hacerlo con limit y offset

   ```php
   // obtiene los datos donde age sea >30 con limite de 1 registro saltandose
   // el primero
   $users = User::where('age','>',30)->limit(1)->offset(1)->get();
   ```

   En versiones anteriores

   ```php
   // obtiene los datos donde age sea >30 con limite de 1 registro saltandose
   // el primero
   $users = User::where('age','>',30)->limit(1,1)->get();
   ```

   

5. first: nos retorna el primero

   ```php
   // obtiene el primer registro donde age sea >30
   $users = User::where('age','>',30)->first();
   ```

   NOTA: a mi me da error (me da error en la vista en el forelse por que solo devuelve un valor)

6. find: si queremos buscar un unico registro buscandolo por el id

   ```php
   // obtiene el registro donde id sea 1
   $users = User::find(1);
   ```

   NOTA: a mi me da error (me da error en la vista en el forelse por que solo devuelve un valor))

7. findOrFail: si queremos buscar por un unico registro y si no lo encuentra muestre un error.

   ```php
   // obtiene el registro donde id sea 1
   $users = User::findOrFail(1);	
   ```

   NOTA: a mi me da error (me da error en la vista en el forelse por que solo devuelve un valor))

   

   PODEMOS CONCATENAR TODOS LOS METODOS y cuando terminemos poner get

   ```php
   $users = User::where()->orWhere()->orderBy()->limit()->get();
   ```

   

### Consultas directamente de sql. DB:: (En MVC NO es recomendable)

Importar DB para poder utilizar instrucciones directamente de SQL

```php
use Illuminate\Support\Facades\DB;
```

**Select**

```php
$age = 42;

Versiones anteriores a laravel 10
$users = DB::select( DB::raw("Select * FROM users WHERE age='$age'") );

Versiones laravel 10 y superios
$users = DB::select( "Select * FROM users WHERE age='$age'" );
```

**Insert**

```php
$users = DB::insert( "INSERT INTO users (name, age, email, password, address)
        VALUES ('Maria',44,'email@hotmail.com',PASSWORD('12323'),'alcala 23')" );
```

Ventajas:

- tenemos un control absoluto de las sentencias, para controlar la eficiencia de la misma.
- Mas detallista en las instrucciones, da igual que esté en laravel o en otro framework

Desventajas:

- Si cambiamos el sistema de persistencia, dejará de funcionar el sistema, por que las instrucciones no serán igual.
- Abandonamos la programacion orientada o objetos



### Sistema Mixto

No es ORM puro ni instrucciones SQL puras

Esto no es recomendable, por que adquirimos las ventajas y desventajas de los dos (orm y sql). Nos interesaria en versiones antiguas de laravel, donde no estaba implatado el ORM.



**Select**

```php
$users = DB::table("users")->select("name","age")->get();
o
$users = DB::table("users")->select(["name","age"])->get();
```

**Insert**

```php
$users = DB::table("users")->insert([
        "name"=>"maria",
        "age"=>46,
        "email"=>"email2@gmail.com",
        "password"=>Hash::make("12345678")
    ]);
```



### Cambiar version de ORM

Por defecto el ORM es Eloquent, pero nos podría interesar trabajar con un ORM que trabaje con un patron de diseño distinto, es decir que no trabaje con un patrón de diseño active record que combina la lógica de negocio y la manipulación de datos en una sola clase, donde cada instancia de la clase representa una fila en la base de datos. Si no que trabaje con un patron diseño data mapper, lo que hace es mapear la estructura de la base de datos y traducirla al objeto, como puede ser doctrine. Data mapper es un patrón de diseño que define una forma de acceso a los datos de una base de datos relacional. La tabla estará envuelta en una clase desde la que se podrá acceder a la información, realizar modificaciones, borrados e inserciones.

La principal diferencia con el patrón **Active Record** es que en **Data Mapper** se tiene una clase que se encarga de realizar **la persistencia de datos de un objeto que referencie a una tabla en la base de datos**.

La gran diferencia entre ambos patrones es que el Data Mapper separa completamente el dominio de nuestra aplicación y la capa de persistencia. Esto significa que ninguno de nuestros modelos (objetos) sabe nada acerca de la base de datos.

Cuando usamos el patrón Data Mapper nuestro código luciría algo así:

```php
user = new User();
user.username = "Elodin";
```



Hasta ahora, no hay diferencias con el patrón Active Record.

No obstante, los objetos del modelo Data Mapper no son más que objetos que no tienen conocimiento alguno sobre la base de datos. Esto significa que no podemos llamar al método `save()` en el objeto a almacenar porque este método no existe en este objeto.

En cambio, necesitaremos usar un servicio completamente diferente, por ejemplo, llamado Entity Manager:

```php
user = new User();
user.username = "Elodin";
EntityManager.persist(user);
```



El gran beneficio del patrón Data Mapper es que los objetos que utilizamos en el dominio de nuestra aplicación no necesitan conocer nada acerca de cómo están guardados en la base de datos. Esto significa que nuestros objetos serán más livianos ya que no deberán heredar el ORM completo, sino que también habrá un proceso más estricto y formal para interactuar con la base de datos debido a que no podremos llamar al método `save()` en cualquier lugar en nuestro código.



RESUMEN:

ORM Eloquent -> Active Record

ORM doctrine -> Data mapped.



## CRUD 

CRUD (create, read, update, delete) , 

El crud que vamos a ver es con un tipo de entorno monolítico, es decir nuestro sistema tiene tanto el front como el back está dentro del mismo.

Para ello vamos a introducir el concepto de parámetros dinámicos en ruta. 

Creamos un proyecto nuevo "crud" para hacer los ejemplos de esta sección

```bash
alias laravel='/var/www/html/curso-laravel/vendor/bin/laravel'

laravel new crud
cd crud
composer update --ignore-platform-reqs
php artisan key:generate
php artisan config:clear
```

Creamos la bd: crud



### Parametros dinámicos en ruta

Hasta ahora en las rutas utilizabamos el formato

```php
Route::get('/',[Controller::class, 'function'])->name('example');
```

Sin embargo dentro de este formato, todas las rutas que hemos creado eran estáticas, siempre especificábamos cual era la URL

Ahora nos va a interesar recepcionar parámetros en dicha ruta, dicho de otra forma es poder recepcionar variables, para que desde nuestro controlador recoger esa información y hacer uso de ella. Por ejemplo para un ecommerce

```php
Route::get('/product/18',[Controller::class, 'function'])->name('example');
```

Donde 18 queremos que sea un valor que queremos recibir, para que el controlador trabaje con el producto con id 18, y asi si el usuario utiliza otro producto con otro id, el controlador estaria preparado para utilizar un valor dinámico.

Para crear esto:

```php
Route::get('/product/{id}',[Controller::class, 'function'])->name('example');
```

Metemos el argumento dinámico entre llaves, para indicar que el argumento sea obligatorio o no. Para ello utilizamos ?

```php
Route::get('/product/{id?}',[Controller::class, 'function'])->name('example');
```



Vamos a hacer de ejemplo un CRUD sobre un elemento de notas:

1. Creamos un controlador NoteController para controlar la entidad de notas que vamos a generar

   ```bash
   php artisan make:controller NoteController
   ```

2. Crear base de datos "crud" y configurar el .env

   ```php
   DB_CONNECTION=mysql
   DB_HOST=127.0.0.1
   DB_PORT=3306
   DB_DATABASE=crud
   DB_USERNAME=localhost
   DB_PASSWORD=localhost
   ```

3. Crear modelo y migracion

   ```bash
   php artisan make:model Note --migration
   ```

4. Creamos dos campos a la tabla notes, nos vamos a database/migrations/..create_notes_table.php y en la función up añadimos:

   ```php
   $table->string('title');
   $table->string('description');
   ```

5. Modificamos en el modelo (app/Models/Note.php) como queremos cumplimentar los datos:

   Para los campos que queremos que sean cumplimentables:

   ```php
   protected $fillable = [
       "title",
       "description"
   ];
   ```

   El resto de campos que tenemos por ahora se van a cumplementar automaticamente (id, timestamp).

6.   Migrar el contenido

   ```bash
   php artisan migrate
   ```



Ya tenemos la infraestructura para empezar a trabajar



Vamos a crear una ruta en routes/web.php que sea note y espere el id como parámetro dinámico

1. Crear una ruta

   ```php
   use App\Http\Controllers\NoteController;
   
   Route::get("/note/{id}", [NoteController::class, 'index'])->name('note.index');
   ```

   Podemos pedir tantos parámetros dinámicos como necesitemos, esto se haría

   ```php
   Route::get("/note/{id}/{title}/{slug}", [NoteController::class, 'index'])->name('note.index');
   ```

2. En el controlador NoteController.php vamos a crear un controlador (función) index, que espera el id como un parámetro dinámico.

   ```php
   public function index ($id){
   
   }
   ```

   Para recepcionar el id, que es un parámetro dinámico le tiene que llegar como argumento a la fucnión index

3. Añadimos temporalmente que el controlador retorne la vista el dato del id

   ```php
   public function index ($id){
       // Vamos a buscar la información del id
       $notes = Note::find($id);
   
       // Muestra tempralmente el valor del id
       return view("note.index",compact('id'));
   }
   ```

4. En la vista resource/views (eliminamos el welcome.php) creamos un directorio "note" con un archivo index.blade.php

   ```html
   <!DOCTYPE html>
   <html lang="en">
   <head>
       <meta charset="UTF-8">
       <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <meta http-equiv="X-UA-Compatible" content="ie=edge">
       <title>Document</title>
   </head>
   <body>
       <h1>El valor de la ruta es:{{ $id }}</h1>
   </body>
   </html>
   ```

   Si lo probamos en el navegador, hay que tener levantado el servicio: php artisan serve, nos mostrará

   <img src="/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-04-01 07-38-34.png" style="zoom: 50%;" />

   Nos mostrará el valor que le estemos pasando en la ruta.

   Si quisieramos definir que el parametro dinámico no sea obligatorio y definirle en el controlador un valor por defecto, para que en caso de que no se introduzca dicho valor, muestre el valor por defecto, para ello:

   1. Añadimos al id una ?

      ```php
      Route::get("/note/{id?}", [NoteController::class, 'index'])->name('note.index');
      ```

   2. En el controlador index le asignamos un valor a id (un numero o null)

      ```php
      public function index ($id = 25){
      
      }
      ```

   NOTA: Tenemos que tener cuidado con la definición de las rutas, el orden importa, si por ejemplo creasemos además

   ```php
   Route::get("/note/hello", [NoteController::class, 'example'])->name('example');
   ```

   Esta ruta no se ejecutaria nunca, porque laravel da mas importancia a las rutas de arriba a abajo, (según las va leyendo), entonces lo que tenemos que hacer es tener en cuenta en el orden de rutas que las que son más especificas ponerlas primero o definir bien los nombres para que no haya confusiones

   ```php
   Orden incorrecto
   Route::get("/note/{id}", [NoteController::class, 'index'])->name('note.index');
   Route::get("/note/hello", [NoteController::class, 'example'])->name('example');
   
   Orden correcto
   Route::get("/note/hello", [NoteController::class, 'example'])->name('example');
   Route::get("/note/{id}", [NoteController::class, 'index'])->name('note.index');
   ```



NOTA: ahora que ya conocemos las rutas dinámicas, vamos a comenzar con el CRUD, para ello limpiamos el código de las prueba anterior.



**CRUD** es una operativa muy común dentro de un servicio

**C-> Create**. Ej crear notas

**R-> Read**: Leer notas

**U-> Update**: Actualizar notas

**D-> Delete**: Borrar notas



### Mostrar notas (READ)

1. Creamos la ruta general en web.php

   ```php
   Route::get("note/", [NoteController::class, 'index'])->name('note.index');
   ```

2. Creamos en NoteController el controlador index, para que busque todas las notas 

   ```php
   public function index(){
   	$notes = Note::all();
   	
   	return view('note.index',compact('notes'));
   }
   ```

3. Creamos en resources/views un layouts (carpeta layouts) con nombre app.blade.php (nombre archivo) y dentro del body le decimos que tiene que esperar el contenido, **@yield**, para no tener que repetir esta estructura en todas las vistas

   ```html
   @yield('content')
   ```

4. Creamos en resources/views un note (carpeta notes) con un archivo index.blade.php con el contenido, para ello como tenemos un layouts lo importamos y creamos la sección content

   ```html
   @extends('layouts.app')
   
   @section('content')
       <ul>
           @forelse ($notes as $note)
               <li><a href="#">{{ $note->title }}</a></li>
           @empty
               <p>No data.</p>
           @endforelse
   @endsection
   ```

   

### Crear (CREATE)

1. Creamos la ruta create, para que el usuario rellene los valores de la nota en un formulario

   ```php
   Route::get("/note/create", [NoteController::class, 'create'])->name('note.create');
   ```

2. Creamos en resources/views/note la vista create, con la vista del formulario

   ```html
   @extends('layouts.app')
   
   @section('content')
       <a href="{{ Route('note.index') }}">Back</a></li>
       <form>
           <label>Title:</label>
           <input type="text" />
   
           <label>Description:</label>
           <input type="text" />
   
           <input type="submit" value="Create" />
       </form>
   @endsection
   ```

3. Añadimos a la vista de index, un enlace para porder llamar a la vista de create, si el usuario quiere crear una nota

   ```html
   <a href="{{ Route('note.create') }}">Create new Note</a></li>
   ```

4. Para la inserción de datos a traves del formulario

   1. Nuestro formulario cuando sea enviado al pulsar submit, debe ser enviado hacia una ruta, que es la ruta que va a recepcionar esos valores y por tanto va a ser el encargado de guardar esa información. Para ello, vamos a generar una nueva ruta, que va a estar recepcionando, por tanto en lugar de ser una ruta get será una ruta post

      ```php
      Route::post("/note/store", [NoteController::class, 'store'])->name('note.store');
      ```

   2. Añadimos a nuestra vista del formulario, que va a ser de tipo post y va a llamar a note.store

      ```html
      <form method="POST" action="{{ route('note.store') }}">
      ```

      Asi el formulario sabe que cuando se pulse en submit, tendra que llamar a la ruta note.store de tipo post.

   3. Darle un nombre a cada uno de los inputs para poder recoger los datos, lo hacemos con **name** , es necesario que el nombre que se de esté relacionado con el dato que vamos a estar relacionando, es decir como los valores que tenemos en el fillable, por que asi nos va a permitir realizar atajos, para poder reducir líneas de código.

      ```html
      <label>Title:</label>
      <input type="text" name="title" />
      
      <label>Description:</label>
      <input type="text" name="description" />
      ```

   4. **Protección** de **cross-site** , proteccion de seguridad de laravel, para ello va a utilizar el token, para que tan solo las acciones a traves de nuestro formulario sean las aceptadas, como si fuese contenido propio de nuestro sistema. Para ello dentro de nuestro formulario añadimos @csrf

      ```html
      @csrf
      ```

      NOTA 1: Esta protección esta activada por defecto, por lo que si no ponemos @csrf, cuando enviemos el formulario dará un error forbiden.

      
   
      NOTA 2: Token (CSRF)
   
      El middleware `VerifyCsrfToken` nos permite evitar que terceros puedan enviar peticiones de tipo POST a nuestra aplicación y realizar ataques de tipo **cross-site request forgery**. Para agregar un campo con el token dentro de nuestro formulario, que le va a permitir a Laravel reconocer peticiones de formulario que sean válidas, debemos llamar al método `csrf_field()`: en nuestro caso @csrf
   
   5. Recepción de datos, crear en Controllers/NoteController.php la funcion store, que va a recibir datos de una petición (request)
   
      1. Creamos la insercion de datos con ORM, guardando los valores del $request -> 'x' donde 'x' es el nombre del objeto que hemos identificado con name. Es muy útil, poner el nombre igual.
   
      ```php
      public function store (Request $request){
      
          // guardar los datos
          $note = new Note;
      
          $note->title -> $request->title;
          $note->description -> $request->description;
          $note->save();
      
          return redirect()->route('note.index');
      }
      ```
   
      2. Otra forma de hacerlo, si creamos el objeto simplemente para guardar en la base de datos y no vamos a operar con el, tenemos el atajo ::create enviando en un array los valores que queremos guardar
   
         ```php
         Note::create([
             'title'=> $request->title,
             'description'=> $request->description
         ]);
         ```
   
      3. Como los nombres del formulario respetaba los nombres en el name, tenemos otro atajo, para crear una nota con todos los datos del request por que coincide con los datos del modelo.
   
         ```php
         Note::create($request->all());
         ```
   
   6. Ya podemos crear notas, desde el navegador pulsando en submit donde escribira en la base de datos los valores introducidos por pantalla mas las fechas de timestamp que las escribe eloquent automaticamente, para saber cuando se ha creado y cuando ha sido su última modificación.

### Actualizar nota (UPDATE)

1. Creamos la ruta edit para poder modificar una nota, para ello necesitará el id de la nota que queremos editar.

   ```php
   route::get("/note/edit/{note}", [NoteController::class, 'edit'])->name('note.edit');
   ```

2. Creamos en el controlador la función de edit. para guardar en una variable la nota buscada y devolver dicha nota a la vista.

   ```php
   public function edit($note){
       $myNote = Note::find($note);
       
       return view("note.edit",compact('$myNote'));
   }
   ```

   Este tipo de utilidad, la vamos a encontrar muy a menudo y por ello Laravel posee un atajo, para evitarnos esto.

   Un truco para hacer atajos, es nombrar como clase el valor que recepcionamos, y en el ya va a recepcionar el objeto en sí que queremos  buscar, es decir Si ponermos Note $note nos trae directamente el id, es como si se hiciese el  $note = Note::find($note); asi nos evitamos esa línea de código

   ```php
   public function edit(Note $note){
       return view("note.edit",compact('note'));
   }
   ```

   Le enviamos a la vista dicha nota, para que el formulario lo recepcione y asi el usuario pueda modificarlo.

3. Creamos la vista en resources/views/edit.blade.php con un formulario con los valores seteados, por ahora lo hacemos con html, pero laravel tambien tiene para crear formularios.

   ```html
   @extends('layouts.app')
   
   @section('content')
       <a href="{{ Route('note.index') }}">Back</a></li>
       <form method="POST" action="{{ route('note.store') }}">
           @csrf
           <label>Title:</label>
           <input type="text" name="title" value="{{ $note->title }}" />
   
           <label>Description:</label>
           <input type="text" name="description" value="{{ $note->description }}" />
   
           <input type="submit" value="Update" />
       </form>
   @endsection
   ```

   Para acudir a esta vista, lo vamos a hacer a traves del listado de notas, desde el enlace que dejamos en el index. Para que cuando pulsemos en una nota del listado, muestre dicha nota y podamos editarla.

   index.blade.php

   ```html
   @extends('layouts.app')
   
   @section('content')
       <a href="{{ route('note.create') }}">Create new Note</a></li>
       <ul>
           @forelse ($notes as $note)
               <li><a href="#">{{ $note->title }}</a> | <a href="{{ route('note.edit',['note' => $note->id]) }}">EDIT</a> | <a href="#">DELETE</a></li>
           @empty
               <p>No data.</p>
           @endforelse
       </ul>
   @endsection
   ```

   NOTA: Si el controlador solo espera un valor, no haria falta enviarlo dentro del array, ya laravel se encarga de saber como interpretarlo, si tuviesemos que enviar mas valores, separarlos por comas dentro del array.

   ```php
   route('note.edit',['note' => $note->id] es como route('note.edit','note' => $note->id
   
   route('note.edit',['note' => $note->id]
   ```

4. Crear ruta para el boton de actualizar, será de tipo put que nos permite especificar que es la modificación de un valor.

   ```php
   Route::put('/note/update/{note}',[NoteController::class, 'update'])->name('note.update');
   ```

5. En nuestra vista de edicion (edit.blade.php) introducir la ruta de update y necesita un parametro que sería el id de la nota que queremos modificar 

   ```html
   <form method="POST" action="{{ route('note.update', $note->id) }}">
   ```

   NOTAS: 

   - si fuese mas de un parámetro tendríamos que enviar un array asociativo.

   - Los formularios en html solo trabajan con metodo posy y get, como lo suyo es que para la modificación de un formulario trabajemos con un metodo put, lo que hay que hacer es utilizar la directiva @method y decirle que es de tipo put. debajo de la declaracion del formulario

     ```html
     <form method="POST" action="{{ route('note.update', $note->id) }}">
     @method('PUT')
     ```

6. Creamos en NoteController para poder gobernar la nueva ruta (update) el método update, le van a llegar dos argumentos, el request y el id de la nota que queremos modificar, para que modifique la nota correspondiente al id, con los valores del request

   ```php
   public function update(Request $request, Note $note){
       // Opción 1 podemos hacer este atajo por la convencion de nombres
       $note->update($request->all());
   
       // Opcion 2 si no fuesen todos los valores, hay que indicar cuales
       $note->update([
           'title' => $request->title
       ]);
   
       // Opcion 3, con programación orientada a objetos
       // para esta opcion hay que modificar los argumentos de la funcion
       // public function update(Request $request, $note){
       $note = Note::find($note);
       $note->title = $request->title;
       $note->description = $request->description;
       $note->save();
   
       return redirect()->route('note.index');
   }
   ```

7.  Para mostrar la información del valor (cuando pulso en el enlace de la nota)

   1. Creamos una ruta nueva (show) y le enviamos el id de la nota que queremos mostrar

      ```php
      Route::get('note/show/{note}', [NoteController::class, 'show'])->name('note.show');
      ```

   2. Asignamos en la vista del index, la ruta para mostrar

      ```html
      <li><a href="{{ route('note.show',['note' => $note->id]) }}">{{ $note->title }}</a> | <a href="{{ route('note.edit',['note' => $note->id]) }}">EDIT</a> | <a href="#">DELETE</a></li>
      ```

   3. Creamos un controlador con el método show

      ```php
      public function show (Note $note){
          return view('note.show', compact('note'));
      }
      ```

   4. Creamos una nueva vista, show.blade.php para mostrar la nota elegida

      ```html
      @extends('layouts.app')
      
      @section('content')
          <a href="{{ route('note.index') }}">Back</a></li>
          <h1>{{ $note->title }}</h1>
          {{ $note->description }}
      @endsection
      ```


### Borrar nota (DELETE)

1. Para borrar una nos creamos una ruta 

   1. Creamos una ruta nueva destroy y le enviamos el id de la nota que queremos eliminar

      ```php
      Route::delete('/note/destoy/{id}', [NoteController::class, 'destroy'])->name('note.destroy');
      ```

   2. En el indice (vista index.php) incluimos la ruta destroy, pero no lo podemos hacer a traves de un enlace como hemos hecho anteriormente, por que el verbo delete es como una variación del método POST, el cual va a estar esperando un formulario , puesto que tenemos que enviarle la información del csrf para que no tengamos problemas, y va a estar recibiendo la peticion, una request sobre la cual va a operar. 

      Lo vamos a hacer a traves de un formulario, que va a aplicar su @csrf y vamos a indicarle que el método que vamos a utilizar es delete, no tiene ningun input, simplemente tendrá un boton y cumplimentar la información del formulario, y la accion será llamar a destroy enviandole el id de la nota que queremos borrar. 

      ```html
      <a href="{{ route('note.show',['note' => $note->id]) }}">{{ $note->title }}</a> |
                      <a href="{{ route('note.edit',['note' => $note->id]) }}">EDIT</a> |
                      {{-- <a href="{{ route('note.destroy',['note' => $note->id]) }}">DELETE</a> --}}
                      <form method="POST" action="{{ route('note.destroy', $note->id) }}">
                          @csrf
                          @method('DELETE')
                          <input type="submit" value="DELETE" />
                      </form>
      ```

      Cuando se pulse en el botón va a enviar la información del formulario para borrar, con su proteccion csrf, la ruta del verbo delete recepciona esa información y se la pasa al controlador, y el controlador debe eliminarla.

   3. Creamos en el controlador (NoteController) el metodo destroy, al que le va a llegar una request y la nota

      ```php
      public function destroy (Request $resquest, Note $note){
          $note->delete();
          return redirect()->route('note.index');
      }
      ```

      La request no ha sido utilizada, por lo que podemos quitarla para no manchar el contenido de nuesro código.

      NOTA: al ejecutar el proyecto me daba error `Route [note.destroy] not defined.` , para solucionarlo tuve que ejecutar:`php artisan optimize`que limpia la cache 



### Tipar los datos

En las versiones más recientes de laravel, se puede ser mas estricto a la hora de tipar los datos, esto hace que el proyecto sea más robusto, previene fallos. Para ello

1. Definir en la función que tipo de valor se va a retornar en la función, para ello añadir `: tipo_retorno`. Ejemplo en la función index, stor

   ```php
   public function index (): View
   public function store (Request $request): RedirectResponse
   ```
   
   NOTA: Al ejecutar el proyecto, en el navegador, si da error, puede ser que se necesite declarar el tipo que vamos a retornar
   
   ```php
   use Illuminate\View\View;
   ```
   
   



### Validar los datos

Se utiliza para verificar el contenido que se recibe para escribir o actualizar sea correcta.

1. Hacer la validación en el controlador: con $request->validate([array con las reglas]) 

   Permite validar que se cumplan las reglas que estamos especificando, si dichas reglas no se cumple la función se detiene y lanza un error al sistema, que le va a indicar al usuario que hay un fallo.

   Laravel posea unas reglas definidas y nosotros podemos añadir mas

   ```php
   $request->validate([
       "title" => "required|max:255|min:3",// indica que es obligatorio, maximo 255 caracteres
       "description" => "required|max:255|min:3"
   ]);
   ```

   Por ejemplo si estuviesemos utilizando archivos, podriamos indicar que el formato que queremos fuese jpg, de x megas. 

   NOTA: esta forma es muy comun, pero no la recomienda, por que:

   1. Engordamos el contenido de nuestro controlador, con un contenido que podría ir fuera.
   2. El controlador hace dos acciones distintas, no tiene una responsabilidad única.
   3. Provoca duplicidad de código, en nuestro ejemplo, estamos haciendo la misma validacion en el create y en el update

2. Hacer una **customRequest** (una petición propia en el que le va a indicar al controlador de que tipo va a ser la petición que va a recibir, y ese tipo de petición concreta ya va a conener sus propias validaciones y si no se cumple ya va a lanzar el error, asi no tenemos que validar en el controlador)

   1. Para crear la customRequest, cada letra de cada palabra en mayúscula

      ```bash
      php artisan make:request NoteRequest
      ```

      Esto crea una request personalizada en app/Http/Requests

   2. En archivo NoteRequest.php

      1. Funcion **authorize**, es para definir cuando vamos a autorizar a utilizar la request, si queremos autorizar al usuario que utilize la request, por ejemplo si es el administrador si le permito que haga esta petición.

         Si queremos que cualquiera pueda hacerlo, poner `return true`

      2. Funcion **rules**: aqui vamos a retornar el array con las reglas de validación, que serán las mismas que hemos puesto en el controlador.

         ```php
         return [
          "title" => "required|max:255|min:3",// indica que es obligatorio, maximo 255 caracteres y minimo de 3
          "description" => "required|max:255|min:3"
         ];
         ```

         Es una petición que extiende del FormRequest, que es la petición de formulario.

      3. Para utilizarlo desde el controlador

         1. Declaramos la NoteRequest

            ```php
            use App\Http\Requests;
            ```

         2. Modificamos en el prototipo de la función que no vamos a recibir una request generalizada, si no la que hemos creado

            ```php
            public function store (Request $request): RedirectResponse
                
            lo cambiamos por:
            public function store (NoteRequest $request): RedirectResponse
            ```

            Asi el sistema comprobará antes de realizar la funcionalidad, que todo es correcto, comprobará primero que el usuario esta autorizado a realizar esa petición y luego comprobará que la petición cumple con las reglas que hemos definido.

      4. Avisar del error al usuario si no cumple las reglas de validacion, a través de los mensajes flash, para nuestro ejemplo en el formulario de create y de edit, tenemos que indicarle los errores.

         directiva @error (ponerla debajo de cada input)

         ```html
         @error('title')
             <p style="color: red;">{{ $message }} </p>
         @enderror
         
         @error('description')
             <p style="color: red;">{{ $message }} </p>
         @enderror
         ```

         Asi si nos da un error, no mostrará el error cuando pulsemos en create,

         Nos muestra si no introducimos nada:

         ![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-04-08 12-10-01.png)

         Si introducimos un texto menor de 3 caracteres como tenemos definido en las reglas de validacion

         ![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-04-08 12-11-54.png)

         Para cambiar el lenguaje de los mensajes, por defecto en ingles, hay que irse a lang/validation.php este archivo contiene los textos con los mensajes, hay se podria modificar el texto (no se recomienda, mas adelánte veremos como hacer para utilizar otros lenguajes y que aparezca en español.)

         NOTA: si tuviesemos una clase tambien podriamos definir el error dentro de dicha clase

         ```html
         <input type="text" name="title" class="@error('title') danger @enderror"/> <br />
         ```

         y asi podriamos definir por ejemplo en la clase danger que los bordes del input sean de color rojo.

         

         Para que sea generalizado y recorrer todos los posibles errores:

         ```html
         @if ($error->any()) -> esto es para que el sistema detecte algun error
         <ul>
             @foreach ($errors->all() as $error)// por cada error que encuente
             	<li> {{ $error }}</li> // muestra el error en concreto
             @endforeach
         </ul>
         @endif
         ```

         Esto nos mostraria el listado de errores:

         ![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-04-08 13-11-35.png)

      5. Avisar de que todo ha sucedido satisfactoriamente

         1. Lo vamos a poner en el layouts, creamos un nuevo directorio partials y dentro un archivo llamado messages, donde vamos a contener lo que queremos mostrar en los mensajes

            ```html
            @if ($message = Session::get('succes'))
                <div style="padding:15px; background-color: green; color: white">
                    <p>{{ $message }}</p>
                </div>
            @endif
            
            @if ($message = Session::get('danger'))
                <div style="padding:15px; background-color: red; color: white">
                    <p>{{ $message }}</p>
                </div>
            @endif
            ```

            Utilizamos la clase Session con el método get con las claves que vamos a utilizar en el controlador (Ej: success y danger). Va a ser un mensaje de sesión.

         2. En el controlador ponerlo donde nos interese utilizar el mensaje, por ejemplo: 

            1. en el store para que cuando redireccione la vista muestre que ha ido correctamente, se hace con el método with en el return indicando la clave (el proceso) y el texto que queremos mostrar. 

               ```php
               return redirect()->route('note.index')->with('succes', 'Note created');
               ```

            2. En el update

               ```php
               return redirect()->route('note.index')->with('succes', 'Note updated');
               ```

            3. En el delete

               ```php
               return redirect()->route('note.index')->with('danger', 'Note deleted');
               ```

         3. En la vista de layouts lo incluimos antes del content, asi todas las vistas lo contienen

            ```html
            @include ('layouts.partials.messages')
            ```

         Esto nos mostraria con succes:

         ![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-04-08 13-36-55.png)

         Con danger:

         ![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-04-08 13-37-57.png)

      6. Todo lo que hemos echo en los spuntos anteriores podemos abreviarla, ya que un CRUD es una funcionalidad muy utilizada. Laravel nos permite falicildades para crear el CRUD y tener el código limpio.

         1. Hemos creado 7 rutas para crear el CRUD del recurso Note, si tenemos un proyecto mas grande, nos crecería mas el código

            ```php
            // Ruta general, que queremos que muestre todas las notas, será nuestro index
            Route::get("/note", [NoteController::class, 'index'])->name('note.index');
            // Ruta de creacion, el usuario tendra un formulario
            Route::get("/note/create", [NoteController::class, 'create'])->name('note.create');
            // Ruta para la recepcion de valores introducidos en un formulario
            Route::post("/note/store", [NoteController::class, 'store'])->name('note.store');
            //  Ruta para la actualizacón de la nota
            route::get("/note/edit/{note}", [NoteController::class, 'edit'])->name('note.edit');
            // Ruta para la recepcion de los valores modificados en el formulario
            Route::put('/note/update/{note}',[NoteController::class, 'update'])->name('note.update');
            // Ruta para mostrar la informacion de la nota seleccionada
            Route::get('/note/show/{note}', [NoteController::class, 'show'])->name('note.show');
            // Ruta para eliminar una nota
            Route::delete('/note/destroy/{note}', [NoteController::class, 'destroy'])->name('note.destroy');
            ```

            Para solventar esto, utilizamos las rutas resource, para probar, creamos un CRUD para un recurso nuevo, por ejemplo un POST de un blog

            ```php
            use App\Http\Controllers\PostController;
            
            Route::resource('/post', PostController::class);
            ```

            No tenemos que nombrarlo, ni especificarle ninguna función, puesto que cuando definimos una ruta resource que es un atajo, que lo que hace es generame todas las rutas que voy a necesitar para hacer un CRUD y las vamos a gobernar con el PostController, resource representa por tanto un conjunto de rutas.

            

            NOTA: 

            1. para listar todas las rutas que tenemos en un proyecto

            ```bash
            php artisan route:list
            ```

            ![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-04-08 13-53-09.png)

            2. Para crear un controlador para un crud, y asi nos crea automaticamente en el archivo las funciones de index, create, store, edit, update, destroy, para que solo nos dediquemos a cumplimentar las funciones.

               ```bash
               php artisan make:Controller PostController --resource
               ```

            3. Podriamos dejar nuestro código limpio de nuestro controlador

               ```php
               use App\Http\Controllers\NoteController;
               use App\Http\Controllers\PostController;
               ```


## API CRUD 

Para hacer un crud desde un backend puro, donde los datos los vamos a coger desde una API REST, es decir, que sea u segundo sistema el que haga el consumo, por ejemplo podríamos tener una aplicación generada con vue, angular, react o cualquier otra tecnología que sea un frontal y que sea la que está destinada a hacer nuestro servicio.

El backend puro, no va a pintar vistas, si no que simplemente va a operar con los datos.

### Crear API CRUD

Creamos un proyecto nuevo "apicrud" para hacer los ejemplos de esta sección

```bash
alias laravel='/var/www/html/curso-laravel/vendor/bin/laravel'

laravel new apicrud
cd apicrud
composer update --ignore-platform-reqs
php artisan key:generate
php artisan config:clear
```

**NOTA:** Este tipo de crud (api crud) no es sutitutivo al que hemos visto antes (crud monolítico), incluso pueden ser complementarios, es muy habitual tener una estructuracion por ejemplo un crud en monolito para el panel de administración , y servir los datos de la aplicación con una api, para servirle los datos al usuario. De tal forma, no necesariamente va ha haber un sistema puramente backend, ni frontend, si no que podemos tener sistemas hibridos.



1. Creamos la bd: apicrud

2. Configuramos archivo .env

3. Creamos un modelo incorporando las migraciones

   ```bash
   php artisan make:model Note --migration
   ```

   Crea archivo app/models/Note.php y el archivo de migración .._create_notes_table.php

4. Identificamos en el modelo que campos van a ser obligatorios

   ```php
   protected $guarded = []; 
   ```

   Este atajo significa que todos los datos son obligatorios, asi no hace falta definir el fillable, con cada uno de los campos.    

5. Añadimos en el archivo de migracion en la tabla de notes, el titulo y la descripción.

   ```php
   Schema::create('notes', function (Blueprint $table) {
       $table->id();
       $table->string('title', 255);
       $table->string('content',255)->nullable();
       $table->timestamps();
   });
   ```

6. Generamos la migracion: 

   ```php
   php artisan migrate
   ```



Vamos a proceder al servicio de nuestra api:

1. Rutas: en api.php

   Ya no vamos a ir a las rutas de web.php, ya que estas retornan vistas en última estancia, y por tanto son las destinadas a hacer la construcción en monolito. En nuestro caso, nuestra API va a estar devolviendo los datos de manera directa, es decir un backend puro y por lo tanto las rutas que vamos a contruir serán rutas api. Ahora trabajamos con el archivo de api.php en lugar de web.php

   ```php
   Route::get('/user', function (Request $request) {
       return $request->user();
   })->middleware('auth:sanctum');
   ```

   Utilizará como en las routas de web.php el router dispatcher con los metodos para llamar al controlador.

   Como especial va a tener el `middelware('auth:sanctum')`con el que laravel va a proteger las rutas, para que el usuario sólo pueda acceder a éstas, si se ha autentificado previamente, es decir si se ha registrado o logeado, en nuestro caso, todavia no lo vamos a usar. Ahora vamos a empezar por una api publica a la que se puede acceder si autentificar

   

2. Crear Controlador: crea un controlador NoteController con las funciones necesarias para el crud (index, create, store, edit, update y destroy)

   ```bash
   php artisan make:controller NoteController --resource
   ```

3. Creamos una ruta para los crud e importamos el controlador que vamos a utilizar

   ```php
   use App\Http\Controllers\NoteController
       
   Route::resource('/note', NoteController::class);    
   ```

   A priori no es necesario nombrar las rutas (->name('nombre_ruta')), puesto que nuestro sistema no tiene vistas que necesite llamar a la ruta, ya que estas rutas las vamos a ofertar a cada uno de los sistemas que van a consumirla.

   Si listamos las rutas, vemos que a diferencia de con las rutas de web, nos muestra las rutas con api/ delante

   ![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-04-09 00-15-06.png)

   Laravel por defecto cuando hace la contrucción de rutas a las rutas de api, las muestra asi. Dentro de nuestro proyecto, si vamos a app

   NOTA: anteriormente a laravel 11, existia un archivo en `/app/http/providers/RouteServiceProviders`, en laravel 11 esta en  `bootstrap/app.php` , dichos archivos contienen las rutas donde se almacenan las rutas del proyecto

   RouteServiceProviders (versiones anteriores a laravel 11)

   ```php
   public function boot()
   {
       $this->configureRateLimiting();
   
       $this->routes(function () {
           Route::prefix('api')
               ->middleware('api')
               ->namespace($this->namespace)
               ->group(base_path('routes/api.php'));
   
           Route::middleware('web')
               ->namespace($this->namespace)
               ->group(base_path('routes/web.php'));
       });
   }
   ```

   bootstrap/app.php (laravel 11)

   ```php
   use Illuminate\Foundation\Configuration\Middleware;
   
   return Application::configure(basePath: dirname(__DIR__))
       ->withRouting(
           web: __DIR__.'/../routes/web.php',
           api: __DIR__.'/../routes/api.php',
           commands: __DIR__.'/../routes/console.php',
           health: '/up',
       )
       ->withMiddleware(function (Middleware $middleware) {
           //
       })
       ->withExceptions(function (Exceptions $exceptions) {
           //
   })->create();
   ```

   En ambos para las rutas api, utilizan el prefijo /api/, si quisieramos modificar o añadir más prefijos prodriamos hacerlo en estos ficheros o bien directamente en la ruta

   ```php
   Route::prefix('v1')->resource('/note', NoteController::class);
   ```

   En este ejemplo añade el prefijo v1 que seria la version, quedaria api/v1/note/.

   Los prefijos se pueden aplicar tanto a las rutas api, como a las rutas web.

   La configuración del limite de solicitudes: esto es importante por que el sistema va a tener el cuenta el login si esta logeado o la ip (si no está logeado) y sólo va a dejar 60 peticiones. Si el sistema fuese para redes sociales, como se hacen multitud de peticiones, hay que modificar este limite. Es un limite por usuario.

   - versiones anteriores a 11, lo hace con el método configureRateLimiting, que limita a 60 por minuto

     ```php
     protected function configureRateLimiting()
     {
         RateLimiter::for('api', function (Request $request) {
             return Limit::perMinute(60)->by(optional($request->user())->id ?: $request->ip());
         });
     }
     ```

   - version 11:  

4. Creamos en Controlador NoteController las funcionalidades

   1. Incluimos el modelo

      ```php
      use App\Models\Note;
      ```

   2. funcion index: lista todos los registros, pero en lugar de retorna una vista, retornamos una apirest en formato json al sistema que utilice la api

      ```php
      public function index():JsonResponse
      {
          // lista todos los elementos
          $notes = Note::all();
      
          return response()->json($notes, 200);
      }
      ```

      Devolvemos 3 valores: los datos, mensaje, cabecera(opcional)

      status 200-> valor por defecto para ok

   3. funcion create: con validacion de custom request

      1. Creamos custom request (NoteRequest), no es obligatorio.

         ```bash
         php artisan make:request NoteRequest
         ```

         Se crea el archivo NoteRequest en app/http/request

         ```php
         public function rules(): array
         {
             return [
                 //
                 'title'=>'required|max:255|min:3',
                 'description'=>'max:255|min:3'
             ];
         }
         ```

      2. La incluimos en el controlador NoteController

         ```php
         use App\Http\Requests\NoteRequest;
         ```

      3. Creamos funcion create

         ```php
         public function create(NoteRequest $request)
         {
             // creamos registro
             Note::create($request->all());
         
             return response()->json([
                 'success'=>true
             ], 201);
         }
         ```

      4. Como aqui no vamos a devolver ningun formulario, no nos hace falta tener una funcion create y otra store, con tener la función store nos bastaria, asi que la funcionalidad de create va a ser la de store (cambiamos nombre a la funcion anterior)

         ```php
         public function store(NoteRequest $request)
         {
             // creamos registro
             Note::create($request->all());
         
             return response()->json([
                 'success'=>true
             ], 201);
         }
         ```

         Se retorna un 201 que es como el valor 200 (todo ok) pero para cuando es una creación.

5. Funcion show: para mostrar los datos de la nota seleccionada

   ```php
   public function show($id)
   {
       // muestra los valores
       $note = Note::find($id);
   
       return response()->json($note, 200);
   }
   ```

6. funcion de edit, nos va a pasar como con el create, no nos va a hacer falta puesto que no vamos a mostrar el formulario, estamos tratando los datos a traves de la api, por tanto haremos la funcion de update

   ```php
   public function update(NoteRequest $request, $id)
   {
       // Modificamos la nota
       $note = Note::find($id);
       // hacemos la actualizacion de otra manera para ir utilizando las
       // diferentes opciones
       $note->title = $reques->title;
       $note->description = $reques->description;
   
       $note->save();
   
       return response()->json([
           'success'=> true
       ], 200);
   }
   ```

7. Función destroy: para eliminar una nota

   ```php
   public function destroy(string $id)
   {
       // buscamos la nota a eliminar
       Note::find($id)->delete();
   
       return response()->json([
           'success'=> true
       ], 200);
   }
   ```



Hemos creado la base del controlador, pero se puede hacer el codigo de mejor manera, para ello:

1. Refactorización dependiendo del tipo de respuesta, podemos hacer recursos de devolucion, por conveccion suele ser habitual, retornar ademas del ok, el data con el recurso creado o modificado, para facilitarle al frontal (vista), volver a solicitar el recurso generado, por ejemplo: 

   ```php
   return response()->json([
       'success'=> true,
       'data' => $note
   ], 200);
   ```

2. Con referencia al mostrado de tipado

   - quitamos los comentarios que hay encima de las funciones y ponemos en la declaración de la función lo que va a devolver (JsonResponde), para ello hay que declarar: 

     ```php
     use Illuminate\Http\JsonResponse;
     ```

     ```php
     public function index():JsonResponse
     ```



### Probar API CRUD

Para probar las peticiones que hemos de realizar, como si fuesemos un frontal, podemos utilizar postman o thunder client que es una extensión de visual studio code

Para instalar thunder client, ir a las extensiones de visual studio, buscarlo e instalarlo , se instalará a la izquierda un icono con la forma de un rayo



### Thunder client:

1. Pulsar sobre el icono que se ha instalado a la izquierda del menu de visual studio code, que es como un rayo y pulsar en new request

2. Para probar la creación de una nota (hay que conocer las rutas, si no las sabemos listar desde el terminal, php artisan route:list)

   1. Poner en la ruta: http://127.0.0.1:8000/api/note

   2. Modificar el tipo de recurso, y seleccionar POST

   3. Modificar en la pestaña de headers, marcar header y poner Content-type en la zona de la izquierda y application/json en la zona de la derecha

   4. Vamos a la etiqueta body, donde vamos a poner un json con el title y la descripcion

      ```php
      {
        "title": "Hello world",
        "description": "lorem ipsun"
      }
      ```

   5. Pulsamos en send y en la parte de la derecha nos mostrará el resultado, si hay algun error, pulsar en la pestaña de abajo de la zona de la izquierda que pone preview

      <img src="/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-04-10 10-32-43.png" style="zoom: 50%;" />

      Si nos da error de autorizacion en NoteRequest, poner true en el retorno de la función authorize.

      En caso de que todo haya ido bien, en el lado de la izquierda nos retorna un json con los datos de la creacion, ya que hemos añadido el data.

      <img src="/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-04-10 10-44-25.png" style="zoom: 50%;" />

3. Para probar el index (mostrar las notas), poner tipo en get y en body no poner nada, y pulsar send, nos mostrara a la derecha todas las notas que existan

4. Para probar el update (actualizar un recurso), utilizamos la ruta put, e indicarle que vamos a modificar la primera con los datos que queramos, para ello en la ruta de arriba enviamos un 1 y en el body los nuevos datos para title y para description.

   ![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-04-10 11-25-47.png)

5. Para probar el delete (borrar un recurso), utilizamos la ruta delete indicando en el http:.... el numero de la nota que queremos eliminar.



### Postman

Para utilizar postman, usuario : la_well@hotmail.com	clave:160202Es@

Hacer lo mismo que en thunder client.

![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-04-10 10-49-18.png)



NOTA: si a la hora de mostrar los elementos de las notas, no queremos que nos muestre alguno, nos vamos al modelo Note y definimos lo que queremos ocultar, por ejemplo (aunque aqui no tiene mucho sentido)

```php
protected $hidden = [
    "created_at",
    "updated_at"
];
```

A la hora de listar las notas, no nos develve todos los campos, nos devuelve todos menos los definidos en hidden

### API RESOURCE

Nos puede interesar definir antes de devolver los datos, que datos o de que manera queremos devolverlos, para ello tenemos los recursos de api (API RESOURCE)

1. Creamos una nuevo recurso resource

   ```php
   php artisan make:resource NoteResource
   ```

   Esto nos ha generado un nuevo directorio en app/Http/Resources con el archivo NoteResource.php que tiene una funcion por defecto `toArray`

   ```php
   public function toArray(Request $request): array
   {
       // return parent::toArray($request);
       return [
           'id' => $this->id,
           'title' => 'Title:' . $this->title,
           'description' => $this->description,
           'example' => 'this is an example'
       ];
   }
   ```

   Asi nos crea una nueva capa intermedia, para devolver los valores, como nostros queremos, en el title concatena una cadena, añade un campo mas example

2. En el NoteController.php hacemos las modificaciones que necesitemos.

   1. Añadimos el recurso

      ```php
      use App\Http\Resources\NoteResource;
      ```

   2. En la función index cambiamos la devolucion del recurso por defecto, devolvemos el nuevo recurso NoteResource, pero como éste no es único (si no que retornamos una coleccion) utilizamos el método collection con todas las notes

      ```
      // devulve el recurso note por defecto
      public function index_default():JsonResponse
      {
          // lista todos los elementos
          $notes = Note::all();
      
          return response()->json($notes, 200);
      }
      // devulve el nuevo recurso Note que hemos definido en NoteResource
      public function index():JsonResource
      {
          // lista todos los elementos
          $notes = Note::all();
      
          return NoteResource::collection(Note::all());
      }
      ```

      Nota: hay que incluir (definir) en el NoteController.php

      ```php
      use Illuminate\Http\Resources\Json\JsonResource;
      ```

      Y ahora nos mostraria: Title: y el example

      ![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-04-10 11-55-34.png)

   3.  En la funcion show, devolveriamos un nuevo recurso con new, ya que es solo uno y no es una colleccion

      ```php
      public function show($id):JsonResponse
      {
          // muestra los valores
          $note = Note::find($id);
      
          return response()->json($note, 200);
      }
      ```

      Pasaria a ser:

      ```php
      public function show($id):JsonResource
      {
          // muestra los valores
          $note = Note::find($id);
      
          return new NoteResource($note);
      }
      ```

   4. En el store y en el update, modifcar en el data

      ```php
      'data' => new NoteResource($note)
      ```



## Factories, seeders y fakers 

Vamos a ver diferentes acciones sobre bases de datos. Por ahora estamos utilizando las migraciones, para crear las estructuras de las tablas iniciales, ahora podemos necesitar tener estructuras y datos iniciales, si tenemos un ecommerce, podemos tener una categoria para los productos, para esto tenemos los **seeders**. (plantar los datos iniciales)

Podemos necesitar, poder poblar las bd con cientos de registros para poder probar en desarrollo antes de pasar a produccion, para poder ver como se visualizaria, para esto tenemos los **factories** que nos va a proporcionar un **faker** que nos va a generar de forma automática datos que tengan sentido para poblar la base de datos.

Creamos un proyecto nuevo "databases" para hacer los ejemplos de esta sección, simularemos un              e-commerce

```bash
alias laravel='/var/www/html/curso-laravel/vendor/bin/laravel'

laravel new databasess
cd databasess
composer update --ignore-platform-reqs
php artisan key:generate
php artisan config:clear
```

1. Creamos la bd: databasess

2. Configuramos archivo .env

3. Nos vamos al directorio de databases y vemos que tiene tres directorios

   1. migrations: el que hemos utilizado hasta ahora para la creacion de las estructuras de las tablas
   2. factories: 
   3. seeders:  sirver para poblar nuestra estructura de datos.

4. Creamos un modelo que nos sirva de ejemplo para poblar la bd con datos con los seeders.

   ```bash
   php artisan make:model Product --migration
   ```

   Nos crea el modelo Product.php y las migraciones

5. Nos vamos al modelo Product.php y vamos a indicarle que el 

   ```php
   $protected guarded =[];
   ```

6. Modificamos la migracion de create_products_table.php para añadir los campos: 

   ```php
   public function up(): void
   {
       Schema::create('products', function (Blueprint $table) {
           $table->id();
           $table->string('name', 50);
           $table->string('short_description', 100);
           $table->text('description', 500);
           $table->float('price')->default(20);
           $table->timestamps();
       });
   }
   ```

7. Creamos las rutas para las vistas, por tanto sera de tipo web. Solo vamos a hacer una ruta

   ```php
   Route::get('/product', ProductController::class)->name('product.index');
   ```

8. Creamos el controlador en app/Http/Controllers

   ```bash
   php artisan make:controller ProductController
   ```

   No vamos a hacer un CRUD completo, puesto que solo queremos mostrar el contenido.

   1. Importamos el modelo y para poder retornar la vista

   ```php
   use App\Models\Product;
   use Illuminate\View\View;
   ```

   2. Creamos la funcion index

   ```php
   public function index(): View
   {
       $products = Product::all();
   
       return view('product.index', compact('products'));
   }
   ```

9. Creamos una vista para que nos muestre los productos de la ecommerce, llamada index.blade.php (eliminamos wecome.blade.php)

   1. Creamos archivo en resources/views/product/index.blade.php

   2. No nos vamos a entretener en crear un layouts, creamos el contenido html5 directamente en dicho archivo

      ```html
      <body>
          @forelse ($products as $product)
              <div>
                  <h3>{{ $product->name }}</h3>
                  <p>{{ $product->short_description }}</p>
                  <p>{{ $product->price }} USD</p>
              </div>
          @empty
              <h5>No data.</h5>
          @endforelse
      </body>
      ```

10. Creamos nuestro primer seeders

    ```bash
    php artisan make:seeder ProductSeeder 
    ```

    Crea en databases/seeders  el seeder ProductSeeder.php (por defecto siempre esta el archivo DatabaseSeeder.php, es el encargado general de crear todos los seeders). Tendremos un seeder por cada recurso y en el DatabaseSeeder indicaremos que seeder/s vamos a utilizar.

    

### SEEDERS

Vamos a hacer un seeder con datos que realmente necesita, en nuestro ejemplo, vamos a crear monedas (euros, pesos,) y productos por defecto

1. Importamos el Modelo Product

   ```php
   use App\Models\Product;
   ```

2. En la funcion run, vamos a ir creando valores de ejemplo

   ```php
   public function run(): void
   {
       //
       Product::create([
           "name" => "Example",
           "short_description" => "Loremp ipsun",
           "description" => "description",
           "price" => 25
       ]);
       Product::create([
           "name" => "Example 2",
           "short_description" => "Loremp ipsun",
           "description" => "description",
           "price" => 42
       ]);
       Product::create([
           "name" => "Example 3",
           "short_description" => "Loremp ipsun",
           "description" => "description",
           "price" => 45
       ]);
   }
   ```

   Este seeder esta aislado, no se va a ejecutar, hasta que no lo añadamos a DatabaseSeeder 

3. Incluimos el ProductSeeder en DatabaseSeeder (podemos borrar lo que tenemos de ejemplo) en la funcion run a que seeder queremos llamar

   ```php
   public function run(): void
   {
       $this->call([
           ProductSeeder::class
       ]);
   }
   ```

   Si tuviesemos mas seeder, meterlo en el array de call

4. Para ejecutar el seeder

   ```bash
   php artisan db:seed
   ```

   NOTA: si da error `Call to undefined function Termwind\ValueObjects\mb_strimwidth()` hay que instalar:

   ```bash
   sudo apt install php8.2-mbstring
   ```

   Lo que ocurre al ejecutar los seeders, crea los registros en las estructuras que corresponda



1. Si ejecutamos el proyecto despues de cargar los seeders, nos aparecerá

   ![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-04-10 16-44-02.png)

2. Para visualizarlo mejor, creamos un archivo en la carpeta public llamado style.css

   ```css
   .container {
       display: flex;
   }
   
   .card {
       padding: 10px;
       border-radius: 10px;
       border: 1px solid #ccc;
       display: flex;
       /* para que lo haga en columna */
       flex-direction: column;
   }
   ```

3. Modificamos en la vista index.php :

   1. Cargarmos los estilos con asset

      ```html
      <link rel="stylesheet" href="{{ asset('style.css') }}"
      ```

   2. Creamos un div general para añadir la clase container y un div para cada producto para la clase card

      ```html
      <body>
          <div class="container">
              @forelse ($products as $product)
                  <div class="card">
                      <h3>{{ $product->name }}</h3>
                      <p>{{ $product->short_description }}</p>
                      <p>{{ $product->price }} USD</p>
                  </div>
              @empty
                  <h5>No data.</h5>
              @endforelse
          </div>
      </body>
      ```

      

4. Si recargamos el navegador se mostrará asi:

   ![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-04-10 16-55-21.png)

Para cargar todos los seeders establecidos en el archivo DatabaseSeeder

```bash
php artisan db:seed
```

Si nos interesa cargar solo alguno

```
php artisan db:seed --class=ProductSeeder
```



### FACTORIES

Genera datos de prueba, datos falsos con gran volumen, para ello no vamos a crear un seeder para cada dato.

1. Crear factory

   ```bash
   php artisan make:factory ProductFactory
   ```

   Esto crea un archivo en database/factories/ProductFactory.php

   Si en algún momento nos atascamos y no sabemos como se crea un factory, viene uno de prueba UserFactory

   Se encarga de como se van a introducir los datos, pero no que datos como hemos hecho en seeder, el factory crea los datos de manera aleatoria pero con cierto sentido, es decir indicar la lógica para los datos de prueba. Esto no funciona por mágica, es la estructura del proyecto la que nos deja hacerlo, por defecto en el modelo, tiene un use HasFactory.

2. Definir el factory

   si es un factory puro:

   ```php
   public function definition(): array
   {
       return [
           //
           "name" => Str::random(25),
           "short_description" =>Str::random(45),
           "description" =>Str::random(150),
           "price" =>random_int(1,125),
       ];
   }
   ```

   NOTA: si no nos cogiese por defecto la función Str habría que importarla

   ```php
   use Illuminate\Support\Str;
   ```

   Esto código generaria datos aleatorios de tipo string de 25, 45 y 150 caracteres en cada campo y en price un numero aleatorio entre 1 y 125.

   Esto no es lo que normalmente se quiere, puesto que los datos no se va a parecer a la realidad. Para ello se utilizarian los fakers.

3. Para generar ciertos datos de prueba apoyandome en el factory que he generado previamente, para ello en el seeder ProductSeeder.php en la función run, en lugar de hacer el create a mano de los datos, ponemos el factory que queremos usar

   ```php
   public function run(): void
   {
       // Para introducir datos con un factory
       Product::factory()->create();
   }
   ```

   Esto se puede hacer puesto que en el modelo Product, tenemos indicado por defecto que tiene factory

   ```php
   use HasFactory;
   ```

   Sin embargo, si queremos introducir por ejemplo 2500 registros, habria que poner 2500 veces la llamada al factory en la función run

   ```php
   public function run(): void
   {
       // Para introducir datos con un factory
       Product::factory()->create();
       Product::factory()->create();
       Product::factory()->create();
       ...
       Product::factory()->create();
   }
   ```

   Para ello se podría hacer un bucle for, pero no queremos eso, lo vamos a hacer con laravel directamente con el método count indicandole el numero de veces que queremos que se ejecute.

   ```php
   Product::factory()->count(150)->create();
   ```

   Asi se generarían 150 registros (productos) aleatorios.

4. Para ejecutar el factory

   ```bash
   php artisan db:seed
   ```

   La secuencia de esta instrucción es que va a ir al seeder de DatabaseSeeder y va a ejecutar ProductSeeder que este tiene la creación de 150 ProductFactory y el Modelo al tener su factory, va a ejecutar el factory 

5. Reiniciamos el navegador y ahora nos muestra los tres productos que teniamos creados manualmente mas los 150 productos aleatorios

   ![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-04-11 07-50-09.png)

6. Como no los muestra de manera muy adecuada nos vamos a public/style.css y modificamos :

   1. en la clase container, para introducir `flex-wrap: wrap`

      ```css
      .container {
          display: flex;
          flex-wrap: wrap;
      }
      ```

   2. en la clase card, que tenga un `margin`

      ```css
      .card {
          padding: 10px;
          border-radius: 10px;
          border: 1px solid #ccc;
          display: flex;
          /* para que lo haga en columna */
          flex-direction: column;
          margin: 5px;
      }
      ```

   3. Recargamos el navegador, y ahora se ve mucho mas claro el contenido que tenemos.

   ![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-04-11 07-55-12.png)

### FAKERS

Se utiliza para que los datos del factory genere datos con mas sentido

Para utilizar fakers en el factory se utiliza la función `fake`, las acciones mas comunes, son generar un nombre, una frase, un email, una direccion, un apellido, un parrafo...

```php
fake()->name();
fake()->sentence();
fake()->paragraph(3);
fake()->address();
fake()->price()->numberBetween(1,125);
```

En nuestro caso para el factory ProductFactory creamos

```php
public function definition(): array
{
    return [
        //
        "name" => fake()->name(),
        "short_description" => fake()->sentence(),
        "description" => fake()->paragraph(3),
        "price" => fake()->NumberBetween(1,125),
    ];
}
```

Deshacemos los datos que hemos introducido antes, tira para atrás todas las migraciones

```bash
php artisan migrate:roollback
```

Cargamos de nuevo las migraciones

```bash
php artisan migrate
```

Cargamos de nuevo el seeder, para que nos cargue los datos del factory con el faker

```bash
php artisan db:seeder
```

Recargamos el navegador

![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-04-11 09-19-02.png)

Vemos que ahora el contenido de prueba es mas parecido a una prueba real.



RESUMEN: todo lo que hemos visto hasta ahora, son datos que no estén relacionados, en un ejemplo real, los datos suelen estar relacionados, para ello hay que realizar las vinculaciones en nuestro modelo de persistencia, es decir en nuestra base de datos, pero también hay que hacer dichas relaciones en nuestros modelos en laravel, sin necesidad de realizar peticiones una y otra vez. Hay que utilizar las relaciones uno a uno, uno a muchos, relaciones polimórficas (que no son datos del mismo modelo), relaciones de pilotaje,...



## RELACIONES

Por ejemplo, si vamos a generar un ecommerce, vamos a necesitar un modelo de producto y este puede necesitar relacionarse con un modelo de proveedor, o un carrito de la compra (relaciona el producto con un usuario que compra).

Creamos un proyecto nuevo "relationships" para hacer los ejemplos de esta sección, simularemos un                ecommerce

```bash
alias laravel='/var/www/html/curso-laravel/vendor/bin/laravel'

laravel new relationships
cd relationships
composer update --ignore-platform-reqs
php artisan key:generate
php artisan config:clear
```

1. Creamos la bd: relationship
2. Configuramos archivo .env



### Relacion 1:1

Por ejemplo vamos a crear una relacion 1:1 de un usuario con un telefono, asumiendo que un usuario puede tener un único teléfono y un teléfono tener un único usuario.

1. Creamos el modelo del telefono con su migracion.

   ```bash
   php artisan make:Model Phone --migration
   ```

   Esto nos crea el modelo en app/Models/Phone.php y el archivo de migracion create_phones_table.php

2. Añadimos en el modelo Phone.php

   ```php
   protected $guarded = [];
   ```

   Para indicar que vamos a utilizar todos los campos de phone.

3. Creamos la estructura de phone (estructura de la tabla) en create_phones_table

   ```php
   public function up(): void
   {
       Schema::create('phones', function (Blueprint $table) {
           $table->id();
           $table->unsignedInteger('prefix');// para el prefijo del pais
           $table->unsignedBigInteger('phone_number');// para el numero de teléfono
           $table->unsignedBigInteger('user_id');
           $table->timestamps();
       });
   }
   ```

   Para relacionar el telefono con el usuario, tenemos que crear una clave foránea por defecto unsignedBigInteger, los nombres de las claves foráneas será nombremodelo_de_vinculacion_id (todo en minúscula). El nombre es del modelo no de la tabla por convención de nombre

4. Generamos las migraciones

   ```bash
   php artisan migrate
   ```

5. Generamos la relacion 1:1, esto significa:

   1. Un usuario tiene un telefono (User hasOne Phone)
   2. Un telefono pertenece a un usuario (Phone belongsTo User)

   Es decir el modelo que contiene la clave foránea (phone) pertenece al modelo que no la contiene (user)

6. En el modelo de Usuario (User.php) definimos la relacion que este contiene, para luego podamos aprovecharnos de ella y utilizarla dentro de nuestros controladores, vistas, colecciones de api,..

   1. Importamos el método hasOne

      ```php
      use Illuminate\Database\Eloquent\Relations\HasOne;
      ```

   2. Definimos una funcion publica dentro del modelo con el nombre de su relacion, como es 1:1 el nombre es phone en lugar de phones y va a devolver un HasOne

      ```php
      public function phone(): HasOne
      {
          return $this->hasOne(Phone::class);
      }
      ```

      Asi retornamos todos los phone relacionados con un usuario. Un usuario tiene un teléfono

   3. Si no hubiesemos utilizado la convención de nombres, tendriamos que indicar cual es el nombre de la clave foránea en el hasOne(modelo, 'nombre_clave_foranea', 'nombre_campo_de_la_tabla_con_que_se_relaciona')

      ```php
      public function phone(): HasOne
      {
          return $this->hasOne(Phone::class, 'user_id', 'id');
      }
      ```

7. En el modelo Phone.php definimos la relacion con user

   1. Importamos el método BelongTo

      ```php
      use Illuminate\Database\Eloquent\Relations\BelongsTo;
      ```

   2. Definimos una función publica dentro del modelo, para indicar que un telefono pertenece a un usuario

      ```php
      public function user(): BelongsTo
      {
          return $this->belongsTo(User::class);
      }
      ```

8. Creamos un seeder para user y otro para phone

   ```bash
   php artisan make:seeder UserSeeder
   php artisan make:seeder PhoneSeeder
   ```

   Nos crea en database/seeders un archivo UserSeeder.php y otro PhoneSeeder.php

   Creamos unos datos de prueba manualmente (vamos a crear pocos) en user y phone

   UserSeeder.php

   ```php
   use App\Models\User;
   use Illuminate\Support\Facades\Hash;
   
   public function run(): void
   {
       //
       User::create([
           "id" => 1,
           "name" => "example",
           "email" => "example@example.com",
           "password" => Hash::make('12345678'),
       ]);
   }
   ```

   PhoneSeeder.php

   ```php
   use App\Models\Phone;
   
   public function run(): void
   {
       Phone::create([
           "id" => 1,
           "prefix" => 34,
           "phone_number" => 6666,
           "user_id" => 1
       ]);
   }
   ```

9. Incluimos en DatabaseSeeder los seeders que vamos a llamar

   ```php
   public function run(): void
   {
       $this->call([
           UserSeeder::class,
           PhoneSeeder::class
       ]);
   }
   ```

10. Cargamos los seeders

    ```bash
    php artisan db:seed
    ```

11. Creamos un controlador para user y otro para phone.

    ```bash
    php artisan make:controller UserController
    php artisan make:controller PhoneController
    ```

    Nos crea en app/Http/Controllers los archivos UserController.php y PhoneController.php

12. Creamos una ruta para el acceso a los datos, tanto para las apis como para las vistas, la manera de crear las rutas serán igual para todos los tipos de relaciones.

    Creamos la ruta en web.php

    ```php
    use App\Http\Controllers\UserController;
    
    Route::get('/', [UserController::class, 'index'])->name('user.index');
    ```

13. Definimos el controlador UserController.php la función index para que liste el usuario con id 1.

    ```php
    use Illuminate\View\View;
    use App\Models\User;
    
    public function index(): View{
        $user = User::find(1);
    
        return view('index', compact('user'));
    }
    ```

    Cuando busco el usuario, no necesito buscar los elementos relacionados (telefono), voy a acceder a traves de la función que acabamos de definir. 

14. Creamos una vista en resources/views/ y creamos index.blade.php (eliminamos welcome) con html:5 para hacer la prueba

    ```html
    <body>
        <h1>Prefix: {{ $user->phone->prefix }}</h1>
        <h1>Phone: {{ $user->phone->phone_number }}</h1>
    </body>
    ```

    Podemos acceder al phone de user, porque tenemos definido en el modelo la función phone y dentro de phone podemos acceder al campo que queramos, sin tener que hacer ninguna llamada externa.

    De igual manera podríamos

15. Para hacerlo a traves de api

    1. Creamos nuestra api resource de User

       ```bash
       php artisan make:resource UserResource
       ```

       Nos crea en app/http/resources el archivo UserResource.php para definir que vamos a retornar 

    2. Abrimos el archivo UserResource.php, para definir lo que vamos a retornar

       ```php
       public function toArray(Request $request): array
       {
           // return parent::toArray($request);
           return [
               "id" => $this->id,
               "name" => $this->name,
               "email" => $this->email,
               "phone" => '('.$this->phone->prefix.')'.$this->phone->phone_number
           ];
       }
       ```

    3. Creamos la ruta api, como en laravel 11 no existe en routes el archivo api.php ni channels.php, lo creamos

       ```bash
       php artisan install:api
       php artisan install:broadcasting
       ```

       Creamos la ruta en api.pho como prueba, aunque no es la mejor manera 

       ```php
       use App\Http\Resources\UserResource;
       
       Route::get('/user', function(Request $request)
       {
       	return new UserResource(User::find(1));
       });
       ```

       Si no lo queremos hacer en una linea, para que no haya confusion

       ```php
       Route::get('/user', function(Request $request)
       {
           $user = User::find(1);
       	return new UserResource($user);
       });
       ```

       NOTA: esto se deberia hacer en un controlador, pero no lo hemos hecho para no perder el tiempo, como solo queremos hacer la prueba de las relaciones.

    4. Probamos la api, con thunder client, para que nos retorne los valores, en la zona de la derecha

       ![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-04-11 12-35-35.png)



### Relacion 1:n (1 a muchos) o n:1

Utilizamos igual nuestro usuario y nuestro phone, ahora un usuario va a tener muchos teléfonos asociados, pero un teléfono sólo va a pertenecer a 1 usuario asociado.

1. La estructura de la base de datos es la misma

2. Hay que modificar la relación en los modelos

   1. En Phone se va a quedar igual puesto que un teléfono va a seguir pertenenciendo a un usuario

   2. En User, ahora la funcion es phones en lugar de phone y en lugar de hasOne es hasMany

      ```php
      use Illuminate\Database\Eloquent\Relations\HasMany;
      
      public function phones(): HasMany
      {
          // para crear relacion 1:n
          return $this->hasMany(Phone::class);
      }
      ```

3. Para poderlo comprobar, vamos al Phoneseeder y creamos mas registros para el mismo usuario, comentamos el que tenemos y añadimos

   ```php
   Phone::create([
       "id" => 2,
       "prefix" => 33,
       "phone_number" => 7777,
       "user_id" => 1
   ]);
   ```

   Comentamos para que no se vuelva a crear la llamada a UserSeeder en DatabaseSeeder y en el PhoneSeeder 

4. Ejecutamos el seeder para que añada el registro

   ```bash
   php artisan db:seed
   ```

5. Volvemos a dejar el codigo que hemos comentado, descomentado

6. Para que podamos observarla, en el index, añadimos un foreach

   ```html
   h1>{{ $user->name }} Phones:</h1>
   <ul>
       @foreach ($user->phones as $phone)
           <li>{{ $phone->prefix }} {{ $phone->phone_number }}</li>
       @endforeach
   </ul>
   ```

7. En el caso de la api

   1. Modificamos en UserResource

      ```php
      "phone" => '('.$this->phone->prefix.')'.$this->phone->phone_number
      
      // para relacion 1:n
      "phones" => $this->phones
      ```

   2. Ejecutamos en thunder client y nos muestra

      ![](/home/soa/.config/Typora/typora-user-images/image-20240411125923156.png)

### Relacion n:n (muchos a muchos)

Vamos a hacer una relacion entre el modelo usuario y un nuevo modelo que vamos a llamar roles, un usuario podría tener varios roles en una plataforma y un rol, puedo contenerlo muchos usuarios distintos, dentro de la plataforma, ya no hay un elemento único en ningun lado de la relación, si no que van a ser multiples usuarios y multiples roles

User belongsToMany Role

Role belongsToMany User



1. Creamos el modelo Rol con sus migraciones

   ```bash
   php artisan make:model Role --migration
   ```

   Esto genera en app/Models Role.php y la migracion create_roles_table.php 

2. Abrimos la migración de rol y le incluimos un name

   ```php
   public function up(): void
   {
       Schema::create('roles', function (Blueprint $table) {
           $table->id();
           $table->string('name');
           $table->timestamps();
       });
   }
   ```

3. Migramos las migraciones

   ```bash
   php artisan migrate
   ```

4. Definimos en el Modelo Role.php que se puedan hacer todas las inserciones

   ```php
   protected $guarded = [];
   ```

5. Cuando hacemos una relacion n:n entre dos tablas (users y roles) necesitamos una tabla de paso (tabla intermedia) como hacemos en mysql donde se relacionen los dos id de ambas tablas (users_id, roles_id). En la tabla de paso vamos a relacionar que roles estan relacionados con cada usuario, para que podamos llevar un control de la relación multiple. No podemos agregar un role_id a la tabla users por que un usuario van a tener varios roles y viceversa. 

   Esta tabla de paso, la vamos a crear con la siguiente nomenclatura el nombre_modelo1 y el nombre_modelo2 ordenado alfabeticamente separados por una _ en singular. En nuestro ejemplo role_user.

   1. Crear **tabla de paso: role_user**, para ello creamos una migracion pura, por que no lleva ningún modelo asociado 

      ```bash
      php artisan make:migration create_role_user_table
      ```

      Esto me crea el archivo de migracion create_role_user_table

   2. Añadir a la tabla role_user los valores de la relacion (id de ambas tablas)

      En ocasiones nos vamos a encontrar con que vamos a necesitar añadir información extra a esta tabla de relación, como por ejemplo hacemos una tabla en la que estamos relacionando los productos que ha comprado un usuario y nos puede interesar cuantos productos ha comprado, y/o a que precio los compró en ese momento.

      Nosotros como ejemplo vamos a añadir un campo added_by, para saber quien lo ha añadido. 

      ```php
      public function up(): void
      {
          Schema::create('role_user', function (Blueprint $table) {
              $table->id();
              $table->unsignedBigInteger('role_id');
              $table->unsignedBigInteger('user_id');
              $table->string('added_by')->nullable();// Opcional
              $table->timestamps();
          });
      }
      ```

   3. Migrar la tabla

      ```bash
      php artisan migrate
      ```

   4. Generar datos de prueba

      1. Creamos un seeder

         ```bash
         php artisan make:seeder RoleSeeder
         ```

         1. Añadimos a DatabaseSeeder la llamada a RoleSeeder

            ```php
            public function run(): void
            {
                $this->call([
                    UserSeeder::class,
                    PhoneSeeder::class,
                    RoleSeeder::class
                ]);
            }
            ```

         2. Abrimos el archivo RoleSeeder, importamos el modelo Role y añadimos los datos

            ```php
            use App\Models\Role;
            
            public function run(): void
            {
                //
                Role::create([
                    "id" => 1,
                    "name" => "admin"
                ]);
                Role::create([
                    "id" => 2,
                    "name" => "staff"
                ]);
                Role::create([
                    "id" => 3,
                    "name" => "user",
                ]);
                Role::create([
                    "id" => 4,
                    "name" => "guest"//invitado
                ]);
            }
            ```

         3. Creamos mas usuarios

            1. Abrimos el UserSeeder y creamos 2 usuarios mas

               ```php
               User::create([
                   "id" => 2,
                   "name" => "example2",
                   "email" => "example2@example.com",
                   "password" => Hash::make('12345678'),
               ]);
               User::create([
                   "id" => 3,
                   "name" => "example3",
                   "email" => "example3@example.com",
                   "password" => Hash::make('12345678'),
               ]);
               ```

         4. Para crear los registros de las relaciones, en lugar de crearnos otro seeder, para ahorrar tiempo, los vamos a incluir en el seeder RoleSeeder, por tanto despues de los datos específicos de Role, hacemos las inserciones en la tabla "role_user" directamente

            ```php
            use Illuminate\Support\Facades\DB;
            ```

            ```php
            // Creamos los valores de la relacion, para evitarnos crear otro seeder e ir más rápido
            DB::table('role_user')->insert([
                "role_id" => 1,
                "user_id" => 1,
                "added_by" => 'juanjo'
            ]);
            DB::table('role_user')->insert([
                "role_id" => 2,
                "user_id" => 1,
                "added_by" => 'luis'
            ]);
            DB::table('role_user')->insert([
                "role_id" => 1,
                "user_id" => 2,
                "added_by" => 'jose maria'
            ]);
            DB::table('role_user')->insert([
                "role_id" => 3,
                "user_id" => 2,
                "added_by" => 'juanjo'
            ]);
            DB::table('role_user')->insert([
                "role_id" => 4,
                "user_id" => 3,
                "added_by" => 'maria'
            ]);
            ```

      2. Reseteamos y volvemos a crear las migraciones y cargar los seeders para que no haya valores duplicados

         ```bash
         php artisan migrate:reset
         php artisan migrate
         php artisan db:seed
         ```

         Ya tenemos todas las estructuras con sus datos creados

      3. Establecemos la relacion, las relaciones n:n se hace con **belongsToMany**

         1. En el modelo Role.php

            ```php
            use Illuminate\Database\Eloquent\Relations\BelongsToMany;
            use App\Models\User;
            ```

            ```php
            public function users(): BelongsToMany
            {
                return $this->belongsToMany(User::class);
            }
            ```

            Donde User es el nombre del modelo

            Si no hubiesemos podido llevar a cabo la convención de nombres, si fuese asi

            ```php
            public function users(): BelongsToMany
            {
                return $this->belongsToMany(User::class, 'role_user', 'user_id','role_id');
            }
            ```

            Si esa relación además tiene información extra como es el caso de added_by como en nuestro ejemplo, si nos la queremos traer para usar, se hace con withPivot('nombre_campo').

            ```php
            return $this->belongsToMany(User::class)->withPivot('added_by');
            ```

         2. En el modelo User.php

            ```php
            use Illuminate\Database\Eloquent\Relations\BelongsToMany;
            use App\Models\Role;
            ```

            ```php
            public function roles(): BelongsToMany
            {
                return $this->belongsToMany(Role::class)->withPivot('added_by');
            }
            ```

      4. Para probarlo, en nuestra vista index.php, en lugar de recorrer phones ponemos roles

         ```html
         @foreach ($user->roles as $role)
             <li>{{ $role->name }} {{ $role->pivot->added_by }}</li>
         @endforeach
         ```

         NOTA: con pivot accedemos a la informacion extra de la tabla relacion.

   5. Para probar en la api, añadimos en UserResource que nos retorne los roles, 

      ```php
       public function toArray(Request $request): array
      {
          // return parent::toArray($request);
          return [
              "id" => $this->id,
              "name" => $this->name,
              "email" => $this->email,
              // para relacion 1:1
              // "phone" => '('.$this->phone->prefix.')'.$this->phone->phone_number
              // para relacion 1:n
              "phones" => $this->phones,
              // para relacion n:n
              "roles" => $this->roles
          ];
      }
      ```

      

### Relacion de paso

Imáginemos que tenemos la tabla users y phones y podríamos añadir otra tabla que fuese sim donde estuviese relacionados los telefonos con la sim. Nuestro usuario estaria relacionado con el telefono y el telefono estaría asociado con la sim, pero no existe ninguna relacion entre nuestro usuario y la tarjeta sim. Es una relación 1:1, pero el usuario no puede ver la informacion de la tarjeta sim , por que no es una relacion directa, no existe ninguna relacion entre el usuario y la sim, sin embargo como existe una relacion común entre ellos, que es el teléfono, podemos establecer una relación de paso, es decir una relación a través del teléfono.

Se puede aplicar a relaciones 1:1, 1:n o n:n

#### Relacion de paso 1:1

1. Nos creamos el modelo Sim con las migraciones

   ```bash
   php artisan make:model Sim --migration
   ```

   Nos crea el archivo app/Models/Sim.php y el archivo de migracion create_sims_table.php 

2. Modificamos en el Modelo Sim.php que todos los datos se puedan insertar

   ```php
   protected $guarded = [];
   ```

3. Añadimos los campos en la tabla sims, en el archivo de migracion create_sims_table.php

   ```php
   public function up(): void
   {
       Schema::create('sims', function (Blueprint $table) {
           $table->id();
           $table->string('serial_number');
           $table->string('company_name');
           $table->unsignedBigInteger('phone_id');
           $table->timestamps();
       });
   }
   ```

   phone_id es el campo con el que va a estar relacionado

4. Añadimos en el Modelo Phone.php la relacion con sim

   ```php
   use Illuminate\Database\Eloquent\Relations\BelongTo;
   
   public function sim(): BelongTo
   {
       return $this->BelongTo(Sim::class);
   }
   ```

5. Añadimos en el modelo Sim.php la relacion con phone

   ```php
   use Illuminate\Database\Eloquent\Relations\BelongsTo;
   
   public function phone(): BelongsTo
   {
       return $this->BelongsTo(Phone::class);
   }
   ```

6. Creamos la relación de paso, establecemos que nuestro usuario pueda acceder a la información de la sim, puesto que está relacionado con el teléfono.

   1. En el modelo de User.php creamos la relacion

      ```php
      public function phoneSim(): HasOneThrougth
      {
          return $this->HasOneThrougth(Sim::class, Phone::class);
      }
      ```

      Si no hubiesemos respetado la convención de nombres

7. Para verlo en nuestro index, no hace falta recorrer la sim por que es información única,

   ```html
   <h3>{{ $user->phoneSim->company_name }}</h3>
   ```

   phoneSim es el nombre de la funcion de relacion creada en User



#### Relacion de paso 1:n

Ahora un usuario puede tener varios telefonos, y un telefono pueda tener múltiples sims.

1. Creamos la función de relacion sim en el Modelo Phone de tipo HasMany

   ```php
   use Illuminate\Database\Eloquent\Relations\HasMany;
       
   public function sims(): HasMany
   {
       return $this->hasMany(Sim::class);
   }
   ```

2. Creamos la función de relacion phoneSim en el modelo User de tipo use HasManyThrough

   ```php
   use Illuminate\Database\Eloquent\Relations\HasManyThrough;
   
   public function phoneSims(): HasManyThrough
   {
       return $this->hasManyThrough(Sim::class, Phone::class);
   }
   ```

   Devolverá un array de elementos



### Relaciones polimórficas

Antes teniamos una relacion de un usuario con un telefono, y en ningún momento iba a variar el modelo contra el cual se iba a estar relacionando. 

#### MorphOne (1:1)

Las relaciones pueden ser dinámicas o polimórficas, Por ejemplo, podemos tener usuarios y estos van tener relacion con un modelo imagen, por ejemplo la imagen de perfil de usuario, depués vamos a tener tambien un modelo de un Post y este post va a tener tambien una imagen, entonces, dentro de este esquema, cuando estemos haciendo la relación de la imagen, la podemos hacer o con un post o con un usuario, y no sabemos a priori con cual va a estar relacionado, no podemos establecerle un post_id o un user_id, puesto que va a ser dinámico.

1. Establecer los datos que vamos a necesitar, Modelos: Post e Image

   1. Post

      ```bash
      php artisan make:model Post --migrate
      ```

      Definimos en el modelo Post que todos los valores se puedan escribir

      ```php
      protected $guarded = [];
      ```

      Creamos la estructura de la tabla post

      ```php
      public function up(): void
      {
          Schema::create('posts', function (Blueprint $table) {
              $table->id();
              $table->string('title');
              $table->string('content');
              $table->timestamps();
          });
      }
      ```

   2. Image

      ```bash
      php artisan make:model Image --migration
      ```

      Definimos en el modelo Image que todos los valores se puedan escribir

      ```php
      protected $guarded = [];
      ```

      Creamos la estructura de la tabla image

      ```php
      public function up(): void
      {
          Schema::create('images', function (Blueprint $table) {
              $table->id();
              $table->string('url');
              $table->string('content');
              $table->timestamps();
          });
      }
      ```

      Para definir la relación no podemos hacerlo como hasta ahora con: 

      ```php
      $table->unsignedBigInteger('user_id'); 
      ni 
      $table->unsignedBigInteger('post_id');
      ```

      por que no sabemos si va a estar relacionado con user o con post, por tanto lo hacemos con dos elementos:

      1. establecemos imageable_id, siempre vamos a seguir la misma nomenclatura, y este será la relación con post o con user

         ```php
         $table->unsignedBigInteger('imageable_id');
         ```

      2. establecemos el nombre imageable_type, que va a contener el tipo de la relación, para saber si es con post o con user.

         ```php
         $table->string('imageable_type');
         ```

         Ej: si está relacionado con user 3, en imageable_id contendra el id (3) de user y en imageable_type el tipo (user)

   3. El modelo que va a contener la relacion, va a ser el modelo de Image (por que no sabemos si la relación va a ser con post o con user)

      ```php
      use Iluminate\Database\Eloquent\Relations\MorphTo;
      
      public function imageable(): MorphTo
      {
          return $this->morphTo();
      }
      ```

      Si no hubiesemos respetado la convención de nombres, deberíamos indicar los nombres en los argumentos que se le envia a la función morphTo()

   4. En los modelos que van a utilizar la relacion

      Post:

      ```php
      public function image(): MorphOne
      {
          return $this->morphOne(Image::class, 'imageable');
      }
      ```

      si no hubiesemos repetado la convención de nombres, habría que enviar los nombres en los argumentos.

      User:

      ```php
      public function image(): MorphOne
      {
          return $this->morphOne(Image::class, 'imageable');
      }
      ```

2. En la vista index.php, pintamos la informacion.

   ```html
   <h1>{{ $user->image->url }}</h1>
   ```

3. En la api, si quisiesemos retornar la imagen, añadirlo en app/Http/Resources/UserResource

   ```php
   public function toArray(Request $request): array
   {
       // return parent::toArray($request);
       return [
           "id" => $this->id,
           "name" => $this->name,
           "email" => $this->email,
           // para relacion 1:1
           // "phone" => '('.$this->phone->prefix.')'.$this->phone->phone_number
           // para relacion 1:n
           "phones" => $this->phones,
           // para relacion n:n
           "roles" => $this->roles,
           // para relacion polimorfica
           "image" => $this->image
       ];
   }
   ```

 

#### MorphMany (1:n)

Vamos a tener el mismo ejemplo anterior, pero ahora el usuario puede contener múltiples imágenes

1. Lo único que hay que modificar es en los modelos de User y de Post

   ```php
   use Iluminate\Database\Eloquent\Relations\MorphMany;
   
   // relacion polimofica 1:n
   public function images(): MorphMany
   {
       return $this->morphMany(Image::class, 'imageable');
   }
   ```

2. En la vista habria que recorrer los valores



#### MorphToMany (n:n)

Igual que en las demás relaciones n:n hay que crear una tabla de paso

Vamos a tener una tabla de post, y los post van a contener su id, nombre pero le vamos a añadir una nueva relacion con diferentes tags, es decir los post van a poder contener etiquetas, etiquetas que describen el contenido del post, como por ejemplo categoria, y a su vez va a tener un modelo de videos, y éstos vídeos ademas de contener su nombre, url... va a contener etiquetas, es decir van a estar relacionados tambien con las etiquetas, y éstas etiquetas van a contener la categoria del vídeo...

Por tanto vamos a tener un modelo Tag que va a estar relacionado con el post o el video (relacion muchos a muchos en algunas ocasiones con post y en otras con video), por tanto el tag va a ser la relacion polimórfica muchos a muchos.

En las relaciones de n:n la tabla de paso la llamariamos tag_video o tag_post, como aqui puede ser con post o con video, pero como tag es polimórfico, como llamamos a la tabla, por convención de nombres la llamaremos taggables y contendrá el tag_id, y el id del elemento con el que va a estar relacionado, como no sabemos cual va a ser ni de que tipo, lo haremos creando taggable_id y taggable_type 

1. Creamos el modelo Video y la migracion

   ```bash
   php artisan make:model Video --migration
   ```

2. En el modelo Video ponemos 

   ```php
   protected $guarded = [];
   ```

3. Añadimos en la estructura de Video

   ```php
   public function up(): void
   {
       Schema::create('videos', function (Blueprint $table) {
           $table->id();
           $table->string('title');
           $table->string('url');
           $table->timestamps();
       });
   }
   ```

   Como es una relacion muchos a muchos, aqui no hay que definir la relación sino que se hace en la tabla de paso

4. Creamos el modelo Tag y la migracion

   ```bash
   php artisan make:model Tag --migration
   ```

5. En el modelo Tag ponemos 

   ```php
   protected $guarded = [];
   ```

6. Añadimos en la estructura de Tag

   ```php
   public function up(): void
   {
       Schema::create('videos', function (Blueprint $table) {
           $table->id();
           $table->string('name');
           $table->timestamps();
       });
   }
   ```

   Como es una relacion muchos a muchos, aqui no hay que definir la relación sino que se hace en la tabla de paso

7. Generamos la tabla de paso, para crear las relaciones

   ```bash
   php artisan make:migration create_taggables_table
   ```

   

8. Añadimos en la estructura de Taggable

   ```php
   public function up(): void
       {
           Schema::create('taggables', function (Blueprint $table) {
               $table->id();
               $table->unsignedBigInteger('tag_id');
               $table->unsignedBigInteger('taggable_id');
               $table->string('taggable_type');
               $table->timestamps();
           });
       }
   ```

9. En la estructura de post no hay que modificar nada

10. Cargamos las migraciones

    ```bash
    php artisan migrate
    ```

11. Creamos la relacion en el modelo Post y Video (en ambos será igual)

    ```php
    use Iluminate\Database\Eloquent\Relations\MorphToMany;
    
    public function tags(): MorphToMany
    {
        return $this->morphToMany(Tag::class, 'taggable');
    }
    ```

    la llamamos tags por que va a devolver varios, le enviamos taggable como nombre de tabla de paso

12. Creamos la relación polimórfica en Tag, aqui vamos a crear dos funciones para poder hacer la obtencion de los elementos, ya que vamos a recibir una estructura de muchos a muchos, entonces nos va a interesar entre los elementos que están relacionados, es decir, en los tags nos va a interesar decirle, traeme todos los tags relacionados con post y los traeme los tags relacionados con video 

    ```php
    public function posts(): MorphToMany
    {
        return $this->MorphedByMany(Post::class,'taggable');
    }
    
    public function videos(): MorphToMany
    {
        return $this->MorphedByMany(Video::class,'taggable');
    }
    ```

    Hacemos dos funciones para que no tengamos problema, desde la vista cuando queramos acceder a los datos, ya que cada uno tendrá unos campos diferentes.

    Utilizamos la función **MorphedByMany** en el return por que es el que va a recibir el polimorfismo

13. Desde la vista index.blade.php haremos

    ```html
    $tag->videos
    $tag->posts
    ```

    y podremos recorrerlo



NOTA

Para poder probar las estructuras que hemos generado con las relaciones, creamos datos en las diferentes tablas creando seeders.

1. Crear valores en ImageSeeder

   ```
   php artisan make:seeder ImageSeeder
   ```

   ```php
   use App\Models\Image;
   
   public function run(): void
   {
       //
       Image::create([
           "id" => 1,
           "url" => "image1",
           "imageable_id" => 1,
           "imageable_type"=> "post"
       ]);
   
       Image::create([
           "id" => 2,
           "url" => "image1",
           "imageable_id" => 1,
           "imageable_type"=> "user"
       ]);
   }
   ```

2. Crear valores en VideoSeeder

   ```bash
   php artisan make:seeder VideoSeeder
   ```

   ```php
   use App\Models\Video;
   
   public function run(): void
   {
       //
       Video::create([
           "id" => 1,
           "url" => "url_video1",
           "title"=> "video1"
       ]);
   
       Video::create([
           "id" => 2,
           "url" => "url_video2",
           "title"=> "video2"
       ]);
   }
   ```

3. Crear valores en Post

   ```bash
   php artisan make:seeder PostSeeder
   ```

   ```php
   use App\Models\Post;
   
   public function run(): void
   {
       //
       Post::create([
           "id" => 1,
           "title"=> "post1",
           "content"=> "content1",
       ]);
   
       Post::create([
           "id" => 2,
           "title" => "post2",
           "content"=> "content2"
       ]);
   }
   ```

4. Crear valores en Tags

   ```bash
   php artisan make:seeder TagSeeder
   ```

   ```php
   use App\Models\Tag;
   
   public function run(): void
   {
       //
       Tag::create([
           "id" => 1,
           "name" => "tag1"
       ]);
       Tag::create([
           "id" => 2,
           "name" => "tag2"
       ]);
       Tag::create([
           "id" => 3,
           "name" => "tag3",
       ]);
       Tag::create([
           "id" => 4,
           "name" => "tag4"
       ]);
   
       // Creamos los valores de la relacion, para evitarnos crear otro seeder e ir más rápido
       DB::table('taggables')->insert([
           "tag_id" => 1,
           "taggable_id" => 1,
           "taggable_type" => "posts"
       ]);
       DB::table('taggables')->insert([
           "tag_id" => 2,
           "taggable_id" => 1,
           "taggable_type" => "users"
       ]);
   }
   ```

5. Añadimos las llamadas a los seeders en databaseSeeder

   ```php
   public function run(): void
   {
       $this->call([
           UserSeeder::class,
           PhoneSeeder::class,
           RoleSeeder::class,
           ImageSeeder::class,
           VideoSeeder::class,
           PostSeeder::class,
           TagSeeder::class
       ]);
   }
   ```

   

6. Reseteamos las migraciones y las volvemos a crear para que no haya valores duplicados y no de errores

   ```bash
   php artisan migrate:reset
   php artisan migrate
   php artisan db:seed
   ```

7. PENDIENTE VER COMO MOSTRAR LOS VALORES POR QUE ME DA ERROR



## Middelware

El middelware va a ser el guarda que va a permitir establecer ciertas reglas para proteger acceder a esas rutas, por ejemplo una autentificacion.

Vamos a trabajar el middelware de una forma general y el de una forma especifica para la autenficacion (autenficacion con api o de un sistema completo (monolito).

Creamos un proyecto nuevo "middlewareauth" para hacer los ejemplos de esta sección, 

```bash
alias laravel='/var/www/html/curso-laravel/vendor/bin/laravel'

laravel new middlewareauth
cd middlewareauth
composer update --ignore-platform-reqs
php artisan key:generate
php artisan config:clear
```

1. Creamos la bd: middlewareauth
2. Configuramos archivo .env



NOTA: En Laravel 11, los Middleware se manejan de una manera diferente. Laravel 10 e inferior viene con una serie de Middleware por defecto en el directorio `/app/Http/Middleware/` que forman parte de nuestra aplicación. A partir de Laravel 11, sin embargo, todos los Middleware por defecto ahora forman parte del núcleo del framework, es decir, están dentro de `/vendor/laravel/framework/src/Illuminate/Http/Middleware/`.

No debemos modificar los archivos dentro de `/vendor/`, puesto que cualquier cambio que hagamos dentro de este directorio será sobrescrito al actualizar nuestra aplicación.



Por defecto puede haber middleware para: autenticacion, encriptacion de cookies, prevención de peticiones cuando tenemos el servicio en mantenimiento, verificar el csrf mediante token.



Crear Middelware (no hay una convencion de nombres definido por defecto)

```bash
php artisan make:middleware Example
```

Crea un archivo en app/Http/Middleware Example.php

La función handle siempre va y es la que se va a encargar cuando nosotros estamos aplicando un middleware como proteccion para una ruta, controlador, es decir tenemos por ejemplo una ruta con esta función handle, lo que hace es que antes de que se ejecute el controlador, se ejecuta esta función handle, que recibe los datos de la aplicacion y `Clousure $next` que va a ser el siguiente valor a cual vamos a estar moviento el flujo de nuestra aplicación, es decir, cuando nos llega la peticion, se activa el middleware de la ruta, y una vez tenemos el middleware funcionando, si todo funciona de la forma correcta, nosostros vamos a estar apoyándonos en next, para pasar el flujo a donde corresponde, hacia su controlador, pero dentro de la lógica, hay algo que no cumple, podríamos redirigir el next a otra ruta. Ej: una autentificacion o pertenencer a un rol de usuario concreto. 

Si va todo bien: return $next($request) y si no va todo bien se puede por ejemplo redirigir a la vista de autentificación o mostrar un error. Un posible ejemplo:

```php
public function handle(Request $request, Closure $next): Response
{
    if(!Auth::user()->hasRole('admin'))
    {
        abort(403);
        // redirigir al login
    }
    return $next($request);
}
```

donde hasRole es un ejemplo de metodo de un modelo Role



Utilizar middleware

Incluir el middleware para que se pueda utilizar (registrarlo dentro de nuestro sistema), 

<img src="/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-04-15 12-48-24.png" style="zoom:67%;" />

En versiones anteriores a laravel 10-11 se incluye en el archivo app/Http/Kernel.php

Tenemos en protected $middleware, los middleware que se pueden ejecutar siempre, en protected $middlewareGroups tambien se va a ejecutar siempre, pero dependiendo del tipo de ruta, si es una ruta web tiene unos o si es una ruta api tiene otros.

<img src="/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-04-15 12-54-29.png" style="zoom:67%;" />

y en protected $routeMiddleware donde van a estar los middleware que vamos a ir construyendo

![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-04-15 13-06-40.png)

donde vamos a definir el nombre del middleware con el que lo vamos a utilizar y la clase que esta siendo utilizada, que respalda a dicho middleware. Para nuestro ejemplo, añadimos example, que es el nombre con el que va a ser utilizado.



En laravel 11, para incluir un middleware que hemos creado en lugar de hacerlo en kernel.php se hace en  bootstrap/app.php

```php
return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        api: __DIR__.'/../routes/api.php',
        commands: __DIR__.'/../routes/console.php',
        channels: __DIR__.'/../routes/channels.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware) {
        //
        $middleware->alias(['example' => \App\Http\Middleware\Example::class]);
    })
    ->withExceptions(function (Exceptions $exceptions) {
        //
    })->create();
```







Como ya esta asociado a nuestro sistema, ya podemos utilizarlo, para ello podemos tener múltiples formatos, Una ruta la podemos proteger principalmente, de una forma explícita en el sistema de rutas o si tenemos una buena contrucción en el controlador

Previamente nos creamos el controlador ExampleController

```bash
php artisan make:controller ExampleController
```

En el controlador nos creamos la función index (lo vamos a utilizar para la api)

```php
public function index()
{
    return response()->json("Hello world", 200);
}
```



#### Protección directa en una ruta

Creamos la ruta en api.php

Si no existiese el archivo api.php por que estemos en una versión moderna

```bash
php artisan install:api
php artisan install:broadcasting
```

Rutas creadas en api.php

```php
Route::middleware('example')->get('/', [ExampleController::class, 'index']);
Route::get('/no-access', [ExampleController::class, 'noAccess'])->name('no-access');
```

Ponemos 'example' por que es el nombre que le hemos definido al middleware en kernel.php, asi antes de ejecutar la ruta, ejecutaria primero el middleware y luego el controlador

Creamos otra ruta sin middleware para ver como funciona

En el controlador ExampleController.php creamos la funcion noAccess para probar la diferencia de una ruta con o sin middleware

```php
public function noAccess()
{
    return response()->json("No Access",200);
}
```

Modificamos en el handle del middelware Example que nos redireccione al controlador noAccess cuando pase al middleware

```php
public function handle(Request $request, Closure $next): Response
{
    return redirect()->route("no-access");// -> iria a la funcion noAccess del contro
    // return $next($request); -> iria a la funcion index del controlador
}
```

Probamos las funcionalidades con thunder client



Protección a un grupo de rutas:

Si queremos utilizar el mismo middleware en varias rutas, para no tener que repetir el codigo, podemos hacer un grupo

```php
Route::middleware('example')->group(function () {
    Route::get('/', [ExampleController::class, 'index']);
    Route::get('/', [ExampleController::class, 'index']);
});
```

**group** lo que va a hacer es recepcionar una función con un grupo de rutas.



Si necesitamos usar más de un middleware, utilizaremos un array donde meteremos los diferentes nombres del middleware.

```php
Route::middleware(['example1','example2'])->get('/', [ExampleController::class, 'index']);
```



Si tenemos un grupo de rutas protegido por varios middleware, pero una ruta por ejemplo no queremos que esté protegido por un middleware en concreto lo hacemos con **withoutMiddleware**

```php
Route::middleware('example', 'auth', 'admin')->group(function () {
    Route::get('/', [ExampleController::class, 'index']);
    Route::get('/', [ExampleController::class, 'index']);
    Route::get('/', [ExampleController::class, 'index'])->withoutMiddlware('admin');
    Route::get('/', [ExampleController::class, 'index']);
    Route::get('/', [ExampleController::class, 'index']);
    Route::get('/', [ExampleController::class, 'index']);
});
```



#### Protección en el controlador

Solo es posible cuando tenemos una buena contrucción.

En el controlador ExampleController.php definimos el constructor. Un constructor es el elemento de la clase que se encarga de construir los objetos de dicha clase

```php
public function _construct(){
    $this->middleware('example');
}
```

De esta forma, no esta declarado en el archivo de enrutado, si no en nuestro controlador, y para utilizar esta metodología tenemos que tener clara la construcción de nuestros controladores, por ejemplo: un caso clásico, vamos a crear un controlador para autentificacion, para control de claves de usuario, por que el panel de acceso siempre tiene que estar protegido. 



#### Crear sistema de autentificación de usuarios a través de api 

Se hace a través de un sistema de token al portador , lo que hace este sistema es que cuando nosotros nos registremos o nos autentiquemos dentro de un servicio va a asociar a nuestro usuario unu token, este token se lo vamos a entregar al sistema que nos ha pedido la autentificación. 

Ej: El usuario se logea con usuario y contraseña y si es correcta el sistema genera un token que se le va a entregar al sistema que nos ha pedido esa información (usuario y contraseña), a partir de ahora el sistema que ha pedido la información recibirá el token que lo utilizará cada vez que el usuario nos quiera pedir información siendo autenticado, el usuario cada vez tiene que enviar dicho token, para verificar que el que está solicitando la información es el usuario que se ha autenticado, para entregarsela. 

Dentro del backend ese token nos va a servir para saber quien nos está pidiendo la información y darle acceso o no. 

Para poder dar acceso, laravel ya tiene un middleware para ello 'auth:sanctum', es una libreria que nos va a permitir verificar a traves del middleware que el usuario que nos está solicitando la información, tiene un token válido para solicitarnos la informacion. 



**Crear un controlador** que nos permita logear y registrar usuarios (recordar que por defecto laravel trae la figura de usuario)

```bash
php artisan make:controller AuthController
```

1. En el  controlador creamos **createUser** para registrar usuarios (asociado a ruta POST)

   ```bash
   php artisan make:controller AuthController
   ```

   1. Crear una **CustomRequest** para validar los datos **CreateUserRequest**.

      ```bash
      php artisan make:request CreateUserRequest
      ```

      Se crea el archivo en app/Http/Requests 

      ```php
      public function authorize(): bool
      {
          return true;
      }
      
      public function rules(): array
      {
          return [
              //
              'name' => 'required',
              'email' => 'required|email|unique:users,email',
              'password' => 'required'
          ];
      }
      ```

      Esta validacion hace que todos sean obligatorios y que el email, tenga formato email y sea unico dentro de la tabla users en el campo email.

   2. Crear la función **createUser**, para registrar un usuario para guardar el nombre, email, password...

      ```php
      use Illuminate\Support\Facades\Hash;
      use App\Http\Requests\CreateUserRequest;
      use App\Models\User;
      
      public function createUser(CreateUserRequest $request)
      {
          $user = User::create([
              'name' => $request->name,
              'email' => $request->email,
              'password' => Hash::make($request->password)
          ]);
      
          return response()->json([
              'status' => true,
              'message' => 'User create sucessfully',
              'token' => $user->createToken("API TOKEN")->plainTextToken
          ], 200);
      }
      ```

      Una vez creado el usuario en la bd, retornamos el estado, un mensaje y el token, este token se generará para que nuestro frontal lo guarde, cada vez que el frontal nos pida algo nos lo debe de entregar en la cabecera de la petición, para que nosotros cogerlo de la cabecera (header) y saber quien nos está pidiendo las cosas.

      Para generar el token: $user ->createToken() esta función esta dentro del paquete de laravel de auth:sanctum, 

      ```php
      $user->createToken("API TOKEN")->plainTextToken
      ```

       plainTextToken nos indica el formato del token, de esta forma generamos un token.

      

2. Crear la funcion **loginUser** para logear al usuario (asociado a ruta POST)

   1. Crear una CustomRequest LoginRequest

      ```bash
      php artisan make:request LoginRequest
      ```

      Se crea el archivo en app/Http/Requests 

      ```php
      public function authorize(): bool
      {
          return true;
      }
      
      public function rules(): array
      {
          return [
              //
              "email" => "required|email",
              "password" => "required"
          ];
      }
      ```

      Esta validacion hace que todos sean obligatorios y que el email, tenga formato email

      

   2. Crear la función **loginUser**, que nos va a servir para logear al usuario. Vamos a utilizar la clase Auth, que nos va a permitir: 

      1. Para acceder a los datos del usuario logeado, a traves del método estático user, podemos obtener informacion de dicho usuario.

         ```php
         Auth::user->email
         ```

      2. El método estático attemp nos va a permitir logear un usuario

         ```php
         Auth::attemp->($request->only('email,'password'));
         ```

         

      ```php
      use App\Http\Requests\LoginRequest;
      use App\Models\User;
      use Auth; o use Illuminate\Support\Facades\Auth;
      
      public function loginUser(LoginRequest $request)
      {
          if (!Auth::attempt($request->only(['email','password'])))
          {
              return response()->json([
                  "status"=> false,
                  "message"=> "Email or password not"
              ], 401);
          }
      
          $user = User::where('email', $request->email)->first();
      
          return response()->json([
              "status"=> true,
              "message"=> "User logged sucessfully",
              "token"=> $user->createToken("API TPKEN")->plainTextToken
          ], 200);
      }
      ```

      Esta función : 

      - Si no cumple con el loggin retorna false, y un 401, 
      - Si se logea, coge la información del usuario logeado, vuelve a generar un token, por que se acaba de logear, para generar el token de su sesion.



Crear las rutas api (routes/api.php)

```php
Route::post('/create', [AuthController::class, 'createUser']);
Route::post('/login', [AuthController::class, 'loginUser']);

Route::middleware('Auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
```

Esta ruta es una ruta protegida por el middleware Auth:sanctum que va a verificar que la ruta esté autentificado, para que nos devuelva el usuario 



Para probarlo con thunder client

1. Hacemos la peticion de crear un usuario. http://127.0.0.1:8000/api/create enviando como datos

   ```json
   {
     "name": "ester",
     "email": "email1@hotmail.com",
     "password": 123456
   }
   ```

   Si todo ha ido bien, nos retornará el token:

   ![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-04-17 11-33-29.png)

   NOTA: al ejecutarlo me daba error en el createToken, para solucionarlo

   ```bash
   composer update --ignore-platform-reqs  
   composer require laravel/sanctum 
   composer require laravel/passport  
   php artisan install:api
   php artisan migrate (crea la tabla create_personal_access_tokens)
   ```

   En el modelo User he tenido que incluir

   ```php
   use Laravel\Sanctum\HasApiTokens;
   
   class User extends Authenticatable
   {
       use HasFactory, Notifiable, HasApiTokens;
       ..
   }
   ```

   

2. Hacemos la peticion http::127.0.0.1:8000/api/user enviando en la cabecera el token que nos has generado en el create, poniendolo en la cabecera como authorization y en value ponemos "Bearer " con espacio porque es un token al portador, para que el sistema cuando reciba la peticion diga ey soy yo me he creado antes y me has entregado este token para que puedas saber que soy yo.

   ![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-04-17 11-31-28.png)

   Ahora si queremos crear un frontal para una zona de perfil o de administracion del usuario, sabemos que añadiendo el middleware **auth:sanctum** a todas las rutas, solo van a poder ser accedidas cuando el usuario este bien logeado y autenticado. Vamos a utilizar los tokens de sanctum para todo esto, un archivo **jwt** (json web tokens), para las autorizaciones de backend puro.



## Autentificación (Auth, Breeze y JetStream)

Vamos a añadir una extension, para poder utilizar las diferentes vistas que vamos a montar, la autenticación es un proceso muy común por lo que laravel ya nos ofrece dos paquetes que podemos instalar (starter packs), para la autentificacion de nuestros proyectos:

- **laravel breeze:** nos va a permitir  (al igual que haciamos con sanctum para las apis)  gestionar una ejecución mínima de nuestra autenticación en el proyecto incluyendo diferentes versiones y scafoldings para las vistas, es decir nos va a permitir apoyarnos a construcciones con blade, react o vue para poder hacer la construcción de las vistas para la autenticación. 

- **laravel jetstream:** nos va a ofrecer la misma solucion y alternativas con blade, inertia, next, livewire (establece una serie de condiciones, para ampliar las funcionalidades de autentificacion)

Ambos paquetes van a permitir realizar una gestión de la autenticación. 

- breeze: es el que se comienza a trabajar primero, por que es el mas liviano. Cuando empezamos a trabajar en autentificacion nos interesa el login, el registro, he perdido mi contraseña. Para no tener que hacer nosotros todas las vistas para estás funcionalidades, como casi todos los proyectos lo van a utilizar, laravel nos facilita esta creación, para soólo tener que modificar su aspecto estético de las vistas.
-   jetstream: además de todo lo que ofrece breeze, nos va a añadir mas funcionalidades para la autentificacion. Por contraproducente es que es más pesado  



### Breeze

Creamos un proyecto nuevo "authbreeze" para hacer los ejemplos de esta sección, hay que tener en cuenta que si vamos a utilizar utilidades propias de autenticación hay que tenerlo en cuenta a la hora de crear el proyecto para no tener problemas al instalar el paquete con posterioridad

```bash
alias laravel='/var/www/html/curso-laravel/vendor/bin/laravel'

laravel new authbreeze
cd authbreeze
composer update --ignore-platform-reqs
php artisan key:generate
php artisan config:clear
```

1. Creamos la bd: authbreeze
2. Configuramos archivo .env



Archivos a tener en cuenta dentro de config:

- auth.php: contiene la configuracion por defecto para las autentificaciones, por defecto no es necesario modificarlo pero si conocerlo, para poder modificarlo en caso de que sea necesario, por ejemplo formatos que no siguen la convencion de nombres, entidades que vamos a utilizar.

  Por ejemplo guarda en web y password en los usuarios . Esta configuración es la misma tanto para un sistema api como para monolito.

- session.php: contiene la informacion de donde se almacena la sesion si en archivo,base de datos o cookie, el tiempo que va a durar la sesion, si queremos que la sesión expire cuando se cierra, si esta encriptada o no, donde se van a guardar los archivos para gestionar las sesiones cuando marcamos el formato de archivo, como podemos modificar los aspectos de la conexión en variables de entorno. Tambien podemos controlar las variables de las sesiones. 

  Si por ejemplo queremos cambiar donde se va a almacenar la sesion, en lugar de cambiarlo en el archivo de configuración es mejor modificar el valor en las variables de entorno

  ```php
  'driver' => env('SESSION_DRIVER', 'database'),
  ```

  Cogemos el nombre de la variable , en este caso 'SESSION_DRIVER' y ponerle el valor que queramos en el archivo .env asignandole a dicha variable el valor que queramos, de este modo mantenemos el archivo de configuracion intacto y con .env se sobreescribe los valores de las variables.

  ```php
  SESSION_DRIVER = redis
  ```



Intalacion de breeze

```bash
composer require laravel/breeze --dev 
```

--dev es para añadir el entorno de desarrollo

Breeze nos va a ofrecer diferentes funciones para la autentificacion.

Por defecto, breeze va a utilizar blade para las vistas de registro, sin embargo puede interesarnos que se apoye en inertia para proporcionarnos por ejemplo, que todas las vistas en lugar de trabajarlas con blade, las trabajemos con vue, para ello:

```bash
php artisan breeze:install vue
```

Este comando nos va a permitir la instalación del scaffolding  de un lenguaje determinado(consiste en la generación de código a partir de plantillas predefinidas y de una especificación proporcionada por el desarrollador).

Si lo quisieramos con react

```bash
php artisan breeze:install react
```



Nosostros inicialmente, lo vamos a hacer con blade, mas adelante lo haremos con estos lenguajes, si estuviesemos trabajando con dichos lenguajes. 

De igual forma cuando hacemos la instalación de vue o de react, nuestro sistema va a poder decidir a través de inertia y estar dentro de laravel (proyecto backend) , podremos decidir como queremos que se renderize el código que se va a mostrar en nuestro frontal. Cuando utilizamos tecnologías reactivas, como es el caso de vue o de react, por defecto no van inyectando el contenido dentro del frontal a través de javascript , de tal forma que el html final utiliza por ejemplo en el caso de vue un virtual DOM, que va a estar componiendo toda la construcción de nuestro contenido, esto implica que el código html no sea renderizado o generado dentro del backend y entregado a nuestra vista, si no que sea ejecutado directamente en el frontal, esto tiene muchas ventajas y algún inconveniente, el principal inconveniente es la perdida de posicionamiento seo, puesto que los motores de búsqueda no van a poder una lectura correcta de que muestra nuestra página, si nos interesase el posicionamiento seo, nos puede interesar hacer un server side rendering, es decir hacer que nuestro código (auqnue esté en react o vue) se ejecute en un server side rendering entrege la información al navegador, de tal forma que perdemos algo de velocidad ganamos en posicionamiento. Si queremos esto hay que indicarle **--ssr**:

```bash
php artisan breeze:install vue --ssr
```

Asi inertia ejecutará las acciones a traves de server side rendering. Si queremos apoyarnos en super conjuntos como es el caso de next (react) o nuxt (vue), podemos también indicarlo sobre la instalacion el comando api

```bash
php artisan breeze:install vue --ssr api
```

Esto generará las funcionalidades de next o nuxt para las apis y frontales.



Instalamos Bleeze con blade

```bash
php artisan breeze:install 
```

--dark: nos instalará un scaffolding para temas claros y temas oscuros dentro de nuestro contenido

Al instalar nos preguntará el sistema como lo queremos instalar, marcamos blade con tema oscuro 

y nos preguntará si queremos utilizar pest para el testing o phpUnit, marcamos phpUnit, por que todavia no hemos visto testing.

La ventaja de laravel frente a otros frameworks es que nos permite a traves de paquetes, generar coódigo de manera mas rápida.

Tras la instalación ahora en 

- **resources/views** ya no tenemos solo welcome.blade.php, si no que tenemos otras vistas:

  - **dashboard.blade.php**: es una vista que se genera automatica como una ruta protegida, que solo es accesible a través de autentificación.

  - **directorio auth**: donde nos ubica todas las vistas blade para la confirmación de un password, la de he olvidado el password, la de registro, para hacer el login, resterar password, o para verificar el email.

  - **directorio profile**: donde nos ubica vistas para gestionar la modificación de nuestro perfil, para modificar nuestra contraseña, nuestro usuario.

    Podemos observar los **partials** en los que se apoyan las vistas de edit. Estos se apoyan en los layouts, por ejemplo el **layout** **guest.blade.php** que es la vista que se utilizará cuando no se está registrado, el layuout **app.blade.php** que es el que se utilizará cuando se está autenticado y el layout de **navigation.blade.php**.

  - Ademas genera ciertos componentes que se utilizan para mostrar la información.

  La única diferencia es que cuando se va a utilizar un componente es que en lugar de utilizarlo con la inclusion @ lo hace como etiqueta <x-nombre_componente>.

  ```html
  @component('dropdown')
  cambia por
  <x-dropdown>
  ```

- en routes/web.php nos ha generado las diferentes rutas necesarias para funcionar 

  - ruta de dashboard que utiliza el middleware auth y verified.

    ```php
    Route::get('/dashboard', function () {
        return view('dashboard');
    })->middleware(['auth', 'verified'])->name('dashboard');
    ```

  - rutas para gestionar el perfil con el middleware auth

    ```php
    Route::middleware('auth')->group(function () {
        Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
        Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
        Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
    });
    ```

  - Se ha incluido el required de auth

    ```php
    require __DIR__.'/auth.php';
    ```

  Todo es igual que lo que hemos visto hasta ahora, lo unico que en lugar de utilizar el middleware auth:sanctum, utilizamos el middleware auth, que nos va a permitir la autentificacion y el middleware verified que nos va a permitir que el usuario ha verificado su email.

- en app/Http/Controllers

  - ProfileController: que se encarga de controlar el edit, el update y el destroy del usuario. 
  - directorio Auth: controladores necesarios para el NewPasswordController, VerifyEmailController, RegisteredUserController, de tal forma de que con una única instrucción tendremos funcionando la autentificación.



Para comprobar este entorno de trabajo:

```bash
php artisan migrate
```

Nos crea las tablas en bd: authbreeze



Hasta ahora los css los hemos estado creando en la carpeta public y hemos accedido a ellos como si fuesen recursos estáticos (estos recursos ya están compilador), sin embargo laravel tambien nos ofrece ubicarlos desde nuestra carpeta resources, y que nuestras vistas los utilicen, de tal forma que nuestros css o javascripts que utilizemos, podemos utilizarlos en nuestras vistas sin la necesidad de ejecutar el archivo compilado final, esto es ventajoso, puesto que nos permite generar archivos css en función de como estamos trabajando (precompilar recursos). Para ello necesitamos indicar que se nos ejecute a la hora de hacer el php artisan serve, puesto que si no lo hacemos, no veremos las vistas adecuadamente, eso es por que los recursos css y javascript que va a necesitar el sistema no han sido compilados en la carpeta pública, para que se ejecuten

```bash
npm install
npm run dev
```

Esto nos permite ejecutar con todo compilado para que se puedan ver las listas , lo dejamos corriendo y desde otro terminal

```bash
php artisan serve
```

Ahora en el navegador si ponemos http://127.0.0.1:8000 nos aparece la vista de welcome pero con las opciones de login y register arriba a la derecha

![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-04-18 10-25-38.png)

Si pulsamos en register nos lleva a la vista:

![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-04-18 10-27-00.png)

Si ya estamos registrados podemos pulsar la opción de login:

![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-04-18 10-28-13.png)

Vamos a registrarnos, una vez registrados nos redirecciona a la vista de dashboard

![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-04-18 10-31-26.png)

En esta vista vemos que esta utilizando el layout de app.blade.php, donde si queremos podemos modificar el aspecto pero no la funcionalidad, ademas, nos ha generado las vistas de edicion del perfil

![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-04-18 10-34-09.png)

NOTA: si tuviesemos el modo dark activado estas vistas las mostraria en oscuro



Si quisieramos crear una nueva ruta en el proyecto (routes/web.php)

1. Nos creamos un controlador de ejemplo: ExampleController.php

   ```bash
   php artisan make:controller ExampleController
   ```

2. Nos creamos la nueva ruta con middleware (auth) y la metemos dentro del grupo 

   ```php
   use App\Http\Controllers\ExampleController;
   
   Route::get('/example', [ExampleController::class, 'index'])->name('example');
   ```

3. Dentro del controlador ExampleController creamos la función index

   ```php
   public function index()
   {
   	return view('example');
   }
   ```

4. Creamos la vista example.blade.php parecida a la de dashboard.blade.php, para ello podemos copiar el contenido de dashboard y cambiamos el nombre de la página y en el contenido ponemos hello world

   ```html
   <x-app-layout>
       <x-slot name="header">
           <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
               Example Page
           </h2>
       </x-slot>
   
       <div class="py-12">
           <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
               <div class="bg-white dark:bg-gray-800 overflow-hidden shadow-sm sm:rounded-lg">
                   <div class="p-6 text-gray-900 dark:text-gray-100">
                       <p>
                           Hello world
                       </p>
                   </div>
               </div>
           </div>
       </div>
   </x-app-layout>
   ```

   Y ahora si abrimos dicha ruta en el navegador. http://127.0.0.1::8000/example nos muestra

   ![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-04-18 10-49-32.png)

   Por defecto todo el scaffolding de blade viene estilado a traves de **Tailwind**, que es un framework css, para estilar el contenido

5. Nos vamos a la vista de navigation.blade.php, podemos añadir un nuevo elemento, en los <!-- Navigation Links --> para que nos lleve a la ruta de example que acabamos de crear

   ```html
   <x-responsive-nav-link :href="route('example')" :active="request()->routeIs('example')">
       {{ __('Example') }}
   </x-responsive-nav-link>
   ```

   Asi nos muestra otra sección en la zona de navegación, estas vistas estan protegidas.

   ![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-04-18 11-00-42.png)

6. Si queremos mostrar la información del usuario autenticado,

   1. En el Controlador ExampleController en la función index cogemos la información del usuario. y se la entregamos a la vista con compact

      ```php
      use Illuminate\Support\Facades\Auth;
      
      public function index()
      {
          $user = Auth::user();
          return view('example', compact('user'));
      }
      ```

      Para poder utilizar Auth importar `use Illuminate\Support\Facades\Auth;`

   2. En la vista example.blade.php añadimos la información

      ```html
      Hello {{ $user->name }}
      ```

      

### JetStream

Nos generamos un nuevo proyecto

Creamos un proyecto nuevo "authjetstream" para hacer los ejemplos de esta sección, hay que tener en cuenta que si vamos a utilizar utilidades propias de autenticación hay que tenerlo en cuenta a la hora de crear el proyecto para no tener problemas al instalar el paquete con posterioridad

```bash
alias laravel='/var/www/html/curso-laravel/vendor/bin/laravel'

laravel new authjetstream
cd authjetstream
composer update --ignore-platform-reqs
php artisan key:generate
php artisan config:clear
```

1. Creamos la bd: authjetstream
2. Configuramos archivo .env



Es un proyecto mas pesado pero mas completo que breeze.



Instalacion de jetstream

```bash
composer require laravel/jetstream --dev 
```

Si bien breeze podia trabajar con vue o react, jetstream va a trabajar principalmente con:

- **livewire**: es un sistema propio de laravel como blade, que nos permiter ejecutar acciones reactivas, la reactividad, son esas acciones que no necesitan actualizar los frontales para actualizar los datos , sin necesidad de refrescar (como vue, react o angular). Livewire nos permite hacerlo sin necesidad de aprender un framework nuevo de un frontal, si no que a traves de una contruccion tenemos acceso a esta ejecución reactiva.
- inertia: para frontales con vue

```bash
php artisan jetstream:install
```

livewire: para un entorno mas similar a blade

inertia: para utilizar los frontales con vue

--teams: es un paquete de jetstream para la gestion de equipos, para poder hacer equipos dentro de las autenticaciones, como por ejemplo hace gitHub, para tener equipos asociados a proyectos, blogs, post,... equipos de trabajo.

Por defecto vamos a utilizar livewire

```bash
php artisan jetstream:install livewire
```

Al igual que con breeze podemos tener la opcion --ssr y/o --dark



Archivos a tener en cuenta dentro de config:

- auth.php: contiene la configuracion por defecto para las autentificaciones, por defecto no es necesario modificarlo pero si conocerlo, para poder modificarlo en caso de que sea necesario, por ejemplo formatos que no siguen la convencion de nombres, entidades que vamos a utilizar.

  Por ejemplo guarda en web y password en los usuarios . Esta configuración es la misma tanto para un sistema api como para monolito.

- session.php: contiene la informacion de donde se almacena la sesion si en archivo,base de datos o cookie, el tiempo que va a durar la sesion, si queremos que la sesión expire cuando se cierra, si esta encriptada o no, donde se van a guardar los archivos para gestionar las sesiones cuando marcamos el formato de archivo, como podemos modificar los aspectos de la conexión en variables de entorno. Tambien podemos controlar las variables de las sesiones. 

  Si por ejemplo queremos cambiar donde se va a almacenar la sesion, en lugar de cambiarlo en el archivo de configuración es mejor modificar el valor en las variables de entorno

  ```php
  'driver' => env('SESSION_DRIVER', 'database'),
  ```

  Cogemos el nombre de la variable , en este caso 'SESSION_DRIVER' y ponerle el valor que queramos en el archivo .env asignandole a dicha variable el valor que queramos, de este modo mantenemos el archivo de configuracion intacto y con .env se sobreescribe los valores de las variables.

  ```php
  SESSION_DRIVER = redis
  ```

- jetstream: contiene la configuracion de jetstream , como el stack que estamos utilizando 'livewire', la gestion que va a estar utilizando, ej: sanctum para las guardas y aqui tenemos la seccion de features, por defecto tenemos la característica de borrar cuentas, pero podemos tener 'teams' , bastaria con descomentar la linea, podriamos tambien las fotos de perfil, api , terminos y condiciones

  ```php
  'features' => [
      // Features::termsAndPrivacyPolicy(),
      // Features::profilePhotos(),
      // Features::api(),
      // Features::teams(['invitations' => true]),
      Features::accountDeletion(),
  ],
  ```

  para activar lo que necesitemos, bastaría con descomentar la línea que corresponda.

  Si por ejemplo queremos subir la foto de nuestro perfil, descomentando la linea de `Features::profilePhotos(),`tenemos la configuracion de donde se van a almacenar mas abajo

  ```php
  'profile_photo_disk' => 'public',
  ```

- fortify: es el sistema que se va a encargar de gestionar las autentificaciones, como la de registro, resetear el password,..

  ```php
  'features' => [
      Features::registration(),
      Features::resetPasswords(),
      // Features::emailVerification(),
      Features::updateProfileInformation(),
      Features::updatePasswords(),
      Features::twoFactorAuthentication([
          'confirm' => true,
          'confirmPassword' => true,
          // 'window' => 0,
      ]),
  ```

  podemos utilizarlo o no comentando o descomentando dichas líneas.



Tras la instalación ahora en:

- resource/views: vemos que ademas de welcome.blade.php y el dashboard.blade.php (breeze), tenemos tambien vistas para los terminos y condiciones (terms.blade.php) y politica de privacidad (policy.blade.php)
  - tenemos los layouts
  - los componentes
  - emails: por ejemplo si estamos utilizan teams, para poder enviar invitaciones (en laravel 11 no viene)
- routes: 
  - web.php: utiliza en lugar de auth como hace blade utiliza el middleware auth:sanctum, se apoya en sanctum para la proteccion de rutas
  - api: idem que en web utiliza auth:sanctum



Para levantar el servicio (idem que en breeze) y que se compile para que se puedan ver correctamente las vistas

```bash
npm install
npm run dev
```

en otra terminal

```bash
php artisan migrate
php artisan serve
```

Al abrir el navegador: http://127.0.0.1:8000, al igual que con breeze, aparece la pagina principal con las opciones de login y register

Vamos a registrar un usuario

![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-04-18 13-00-49.png)

Vemos que tenemos desactivada la opcion de verificar por email, si la queremos activar, tenemos que ir a fortify y activar dicha opcion

Si nos vamos a la opcion de Profile (nuestro perfil), vemos que ademas de lo que nos aparecia en breeze (profile information y update password), nos aparece las opciones de two factor authentication, que si lo habilitamos, nos da la opcion de utilizar google authentificator o el sistema de email, asi cuando nos identifiquemos nos pedirá una clave, para hacer autenticaciones mas seguras,

![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-04-18 13-05-46.png)

Tambien tenemos la sección de browser sessions: para saber las sesiones que tenemos abiertas, en diferentes navegadores, para poder cerrar las sesiones que tenemos abiertas, si por ejemplo hemos accedido desde el movil, tables,...

Si hubiesemos activado la gestión de equipos podriamos invitar a mas usuarios.



NOTA:

- En conclusión breeze y jetstream son parecidos, pero con jetstream es mas completo (como gestionas las sesiones, gestionar equipos,..). Ambas utilizan el framework de css de Tailwind.
- Si quisieramos cambiar el logo, esta en views/components/application-logo.blade.php, y application-mark.blade.php en svg
- A menudo hay sistemas mixtos, que utilizan el monolito a traves de jetstream o breeze puesto que es una parte que no es pública, si no de administración y luego lo que es el consumo de datos, sacarlo a traves de las rutas api y contruirlo con vue, react o angular con el proyecto que corresponda.





Documentación sacada de: 

https://desarrolloweb.com/articulos/crear-proyecto-laravel-composer.html

https://campus-ademass.com/curso/3

https://styde.net/middleware-en-laravel-11/
