[TOC]

CODEIGNITER 4

# Bienvenido a CodeIgniter4

CodeIgniter es un marco de desarrollo de aplicaciones, un conjunto de herramientas, para personas que crean sitios web utilizando PHP. Su objetivo es permitirle desarrollar proyectos mucho más rápido de lo que podría si estuviera escribiendo código desde cero, proporcionando un rico conjunto de bibliotecas para tareas comúnmente necesarias, así como una interfaz simple y una estructura lógica para acceder a estas bibliotecas. CodeIgniter le permite concentrarse creativamente en su proyecto minimizando la cantidad de código necesario para una tarea determinada.

Siempre que ha sido posible, CodeIgniter se ha mantenido lo más flexible posible, lo que le permite trabajar de la forma que desee, sin verse obligado a trabajar de ninguna manera determinada. El marco puede tener partes centrales fácilmente extendidas o reemplazadas por completo para que el sistema funcione como lo necesita. En resumen, CodeIgniter es el marco maleable que intenta proporcionar las herramientas que necesita mientras se mantiene al margen.

## ¿Para quién es CodeIgniter?

CodeIgniter es adecuado para usted si:

- Quieres un marco con una huella pequeña.
- Necesita un rendimiento excepcional.
- Quieres un marco que requiera una configuración casi nula.
- Quieres un marco que no requiera que uses la línea de comando.
- Quiere un marco que no requiera que se adhiera a reglas de codificación restrictivas.
- No está interesado en bibliotecas monolíticas a gran escala como PEAR.
- No desea verse obligado a aprender un lenguaje de plantillas (aunque un analizador de plantillas está disponible opcionalmente si lo desea).
- Evita la complejidad, privilegiando soluciones simples.
- Necesita documentación clara y completa.



# Requisitos del servidor

Se requiere [PHP](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://www.php.net/&usg=ALkJrhjmxfx4tVykpE8pkPOgu6ffFJDh7g) versión 7.2 o posterior, con la [extensión ](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://www.php.net/manual/en/intl.requirements.php&usg=ALkJrhhFrtIBmgn-OifTLvHmTV5EsJ1a3w)[* intl *](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://www.php.net/manual/en/mbstring.requirements.php&usg=ALkJrhiVFoTlfad7y8uHFb6elXTg-tPUSw) y la [extensión ](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://www.php.net/manual/en/intl.requirements.php&usg=ALkJrhhFrtIBmgn-OifTLvHmTV5EsJ1a3w)[* mbstring *](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://www.php.net/manual/en/mbstring.requirements.php&usg=ALkJrhiVFoTlfad7y8uHFb6elXTg-tPUSw) instaladas.

Las siguientes extensiones PHP deben estar habilitadas en su servidor: `php-json`, `php-mysqlnd`,`php-xml`

Para utilizar [CURLRequest](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://codeigniter4.github.io/userguide/libraries/curlrequest.html&usg=ALkJrhh_pKvbyPnf4G4tp1ny7IQ4M5AWcQ) , necesitará tener instalado [libcurl](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://www.php.net/manual/en/curl.requirements.php&usg=ALkJrhg375ymDvjMXstPpXINo1osPLp3fw) .

Se requiere una base de datos para la mayoría de la programación de aplicaciones web. Las bases de datos admitidas actualmente son:

> - MySQL (5.1+) a través del controlador *MySQLi*
> - PostgreSQL a través del controlador *Postgre*
> - SQLite3 a través del controlador *SQLite3*

No todos los controladores se han convertido / reescrito para CodeIgniter4. La siguiente lista muestra los más destacados.

> - MySQL (5.1+) a través del controlador *pdo*
> - Oracle a través de los *oci8* y *pdo* conductores
> - PostgreSQL a través del controlador *pdo*
> - MS SQL a través de la *mssql* , *sqlsrv* (versión 2005 y superior) y *pdo* conductores
> - SQLite a través de los controladores *sqlite* (versión 2) y *pdo*
> - CUBRID a través de los *Cubrid* y *pdo* conductores
> - Interbase / Firebird a través de los *ibase* y *pdo* conductores
> - ODBC a través de los *controladores odbc* y *pdo* (debe saber que ODBC es en realidad una capa de abstracción)



# Instalación

CodeIgniter4 se puede instalar de diferentes formas: manualmente, usando [Composer](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://getcomposer.org/&usg=ALkJrhjOmblDYNqyL0OTRWhl3Q6qs_1bgQ) o usando [Git](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://git-scm.com/&usg=ALkJrhjJL1UL4T3m05IJiAW9Keb0mpyh0Q) . ¿Cuál es el adecuado para usted?

- Si desea la instalación simple de "descargar y listo" que caracteriza a CodeIgniter3, elija la instalación manual.
- Si planea agregar paquetes de terceros a su proyecto, o desea mantener CodeIgniter actualizado fácilmente, le recomendamos la instalación de Composer.

- [Instalación manual](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://codeigniter4.github.io/userguide/installation/installing_manual.html&usg=ALkJrhgSLiV-_XoFl4VKCUJcMyrLUCz8XA)
- [Instalación de Composer](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://codeigniter4.github.io/userguide/installation/installing_composer.html&usg=ALkJrhhho7M2JoFUje1uXUKg7xNVAS6GbQ)
- [Ejecutando su aplicación](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://codeigniter4.github.io/userguide/installation/running.html&usg=ALkJrhjJMuvY0ujRRCKqziGoDUnf7zep5A)
- Actualización desde una versión anterior
  - [Actualización de 3.xa 4.x](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://codeigniter4.github.io/userguide/installation/upgrade_4xx.html&usg=ALkJrhgdXzdSjh61rr4880Sbyvu5O-5b1Q)
- [Solución de problemas](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://codeigniter4.github.io/userguide/installation/troubleshooting.html&usg=ALkJrhiu_cSCdsm6FxGPXeuIN9t9twqCKw)
- [Repositorios CodeIgniter](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://codeigniter4.github.io/userguide/installation/repositories.html&usg=ALkJrhi1B8TP6b1YbgITECQe9W8zex3tKw)

Independientemente de cómo elija instalar y ejecutar CodeIgniter4, se puede acceder a la [guía](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://codeigniter4.github.io/userguide/&usg=ALkJrhiRLvGytj_S1VHzr2qhAeaMEak8pw) del [usuario en](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://codeigniter4.github.io/userguide/&usg=ALkJrhiRLvGytj_S1VHzr2qhAeaMEak8pw) línea.

Nota

Antes de usar CodeIgniter 4, asegúrese de que su servidor cumpla con los [requisitos](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://codeigniter4.github.io/userguide/intro/requirements.html&usg=ALkJrhjosk2sTcMxIZiDSBLPq5mKR416lQ) , en particular la versión PHP y las extensiones PHP necesarias. Es posible que tenga que descomentar las `php.ini`líneas de "extensión" para habilitar "curl" e "intl", por ejemplo.



# Instalación de Composer

- [Iniciador de la aplicación](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://codeigniter4.github.io/userguide/installation/installing_composer.html&usg=ALkJrhhho7M2JoFUje1uXUKg7xNVAS6GbQ#app-starter)
- [Agregar CodeIgniter4 a un proyecto existente](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://codeigniter4.github.io/userguide/installation/installing_composer.html&usg=ALkJrhhho7M2JoFUje1uXUKg7xNVAS6GbQ#adding-codeigniter4-to-an-existing-project)
- [Instalación de traducciones](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://codeigniter4.github.io/userguide/installation/installing_composer.html&usg=ALkJrhhho7M2JoFUje1uXUKg7xNVAS6GbQ#translations-installation)

Composer se puede utilizar de varias formas para instalar CodeIgniter4 en su sistema.

Las dos primeras técnicas describen la creación de un proyecto esqueleto utilizando CodeIgniter4, que luego usaría como base para una nueva aplicación web. La tercera técnica que se describe a continuación le permite agregar CodeIgniter4 a una aplicación web existente,

**Nota** : si está utilizando un repositorio de Git para almacenar su código, o para colaborar con otros, entonces la `vendor`carpeta normalmente sería "git ignorada". En tal caso, tendrá que hacer una cuando clone el repositorio en un nuevo sistema.`composer update`Para actualizar el framework



## [Iniciador de la aplicación](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://codeigniter4.github.io/userguide/installation/installing_composer.html&usg=ALkJrhhho7M2JoFUje1uXUKg7xNVAS6GbQ#id5)

El repositorio de [inicio de la aplicación CodeIgniter 4](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://github.com/codeigniter4/appstarter&usg=ALkJrhi-YWy3Bzm1gc2wbBqnhJj1b-LMQA) contiene una aplicación esqueleto, con una dependencia del compositor de la última versión lanzada del marco.

Esta técnica de instalación se adaptaría a un desarrollador que desea iniciar un nuevo proyecto basado en CodeIgniter4.

### Instalación y configuración

En la carpeta sobre la raíz de su proyecto:

```
composer create-project codeigniter4/appstarter project-root
```

El comando anterior creará una carpeta "proyecto-raíz".

Si omite el argumento "project-root", el comando creará una carpeta "appstarter", que se puede renombrar según corresponda.

Si no necesita o no desea instalar phpunit y todas sus dependencias de compositor, agregue la opción “–no-dev” al final de la línea de comando anterior. Eso dará como resultado que solo el marco y las tres dependencias confiables que agrupamos estén instaladas por el compositor.

Un ejemplo de este comando de instalación, utilizando el "appstarter" raíz del proyecto predeterminado:

```
composer create-project codeigniter4/appstarter --no-dev
```

Después de la instalación, debe seguir los pasos de la sección "Actualización".

### Actualización

Siempre que haya una nueva versión, desde la línea de comando en la raíz de su proyecto:

```
composer update
```

Si usó la opción “–no-dev” cuando creó el proyecto, sería apropiado hacerlo aquí también, es decir .`composer update --no-dev`

Lea las instrucciones de actualización y compruebe las `app/Config`carpetas designadas para ver los cambios afectados.

### Pros

Instalación simple; fácil de actualizar

### Contras

You still need to check for `app/Config` changes after updating

### Structure

Folders in your project after set up:

- app, public, tests, writable
- vendor/codeigniter4/framework/system
- vendor/codeigniter4/framework/app & public (compare with yours after updating)

### Latest Dev

The App Starter repo comes with a `builds` scripts to switch Composer sources between the current stable release and the latest development branch of the framework. Use this script for a developer who is willing to live with the latest unreleased changes, which may be unstable.

The [development user guide](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://codeigniter4.github.io/CodeIgniter4/&usg=ALkJrhjK5nDd2XUdhkNTfM9rTHXt47_zmw) is accessible online. Note that this differs from the released user guide, and will pertain to the develop branch explicitly.

In your project root:

```
php builds development
```

The command above will update **composer.json** to point to the `develop` branch of the working repository, and update the corresponding paths in config and XML files. To revert these changes run:

```
php builds release
```

After using the `builds` command be sure to run `composer update` to sync your vendor folder with the latest target build.

## [Adding CodeIgniter4 to an Existing Project](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://codeigniter4.github.io/userguide/installation/installing_composer.html&usg=ALkJrhhho7M2JoFUje1uXUKg7xNVAS6GbQ#id6)

The same [CodeIgniter 4 framework](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://github.com/codeigniter4/framework&usg=ALkJrhgR92-Up6bkxaBCphyLpE98NkXESg) repository described in “Manual Installation” can also be added to an existing project using Composer.

Develop your app inside the `app` folder, and the `public` folder will be your document root.

In your project root:

```
composer require codeigniter4/framework
```

As with the earlier two composer install methods, you can omit installing phpunit and its dependencies by adding the “–no-dev” argument to the “composer require” command.

### Set Up

Copy the `app`, `public`, `tests` and `writable` folders from `vendor/codeigniter4/framework` to your project root

Copy the `env`, `phpunit.xml.dist` and `spark` files, from `vendor/codeigniter4/framework` to your project root

You will have to adjust the system path to refer to the vendor one, e.g. `ROOTPATH . '/vendor/codeigniter4/framework/system'`, - the `$systemDirectory` variable in `app/Config/Paths.php`

### Upgrading

Whenever there is a new release, then from the command line in your project root:

```
composer update
```

Read the upgrade instructions, and check designated `app/Config` folders for affected changes.

### Pros

Relatively simple installation; easy to update

### Cons

You still need to check for `app/Config` changes after updating

### Structure

Carpetas en su proyecto después de la configuración:

- aplicación, pública, pruebas, modificable
- proveedor / codeigniter4 / framework / system



## [Instalación de traducciones](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://codeigniter4.github.io/userguide/installation/installing_composer.html&usg=ALkJrhhho7M2JoFUje1uXUKg7xNVAS6GbQ#id7)

Si desea aprovechar las traducciones de mensajes del sistema, se pueden agregar a su proyecto de manera similar.

Desde la línea de comando dentro de la raíz de su proyecto:

```
composer require codeigniter4/translations
```

Estos se actualizarán junto con el marco cada vez que realice un .`composer update`



# Ejecutando su aplicación

- [Configuración y configuración inicial](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://codeigniter4.github.io/userguide/installation/running.html&usg=ALkJrhjJMuvY0ujRRCKqziGoDUnf7zep5A#initial-configuration-set-up)
- [Servidor de desarrollo local](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://codeigniter4.github.io/userguide/installation/running.html&usg=ALkJrhjJMuvY0ujRRCKqziGoDUnf7zep5A#local-development-server)
- [Hospedaje con Apache](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://codeigniter4.github.io/userguide/installation/running.html&usg=ALkJrhjJMuvY0ujRRCKqziGoDUnf7zep5A#hosting-with-apache)
- [Alojamiento con Nginx](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://codeigniter4.github.io/userguide/installation/running.html&usg=ALkJrhjJMuvY0ujRRCKqziGoDUnf7zep5A#hosting-with-nginx)
- [Alojamiento con Vagrant](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://codeigniter4.github.io/userguide/installation/running.html&usg=ALkJrhjJMuvY0ujRRCKqziGoDUnf7zep5A#hosting-with-vagrant)

Una aplicación CodeIgniter 4 se puede ejecutar de diferentes formas: alojada en un servidor web, usando virtualización o usando la herramienta de línea de comandos de CodeIgniter para realizar pruebas. Esta sección trata sobre cómo usar cada técnica y explica algunos de sus pros y contras.

Si es nuevo en CodeIgniter, lea la sección [Introducción](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://codeigniter4.github.io/userguide/intro/index.html&usg=ALkJrhhlOjw6enDBaRtuBYkcJcGzoP1g7A) de la Guía del usuario para comenzar a aprender a crear aplicaciones PHP dinámicas. ¡Disfrutar!

## [Configuración y configuración inicial](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://codeigniter4.github.io/userguide/installation/running.html&usg=ALkJrhjJMuvY0ujRRCKqziGoDUnf7zep5A#id2)

1. Abra el archivo **app / Config / App.php** con un editor de texto y configure su URL base. Si necesita más flexibilidad, la baseURL puede establecerse dentro del `.env`archivo como **app.baseURL = ”http://example.com”** .
2. Si tiene la intención de utilizar una base de datos, abra el archivo **app / Config / Database.php** con un editor de texto y establezca la configuración de su base de datos. Alternativamente, estos se pueden configurar en su `.env`archivo.

Una medida adicional que se debe tomar en los entornos de producción es deshabilitar los informes de errores de PHP y cualquier otra funcionalidad exclusiva de desarrollo. En CodeIgniter, esto se puede hacer estableciendo la `ENVIRONMENT`constante, que se describe con más detalle en la [página de entornos](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://codeigniter4.github.io/userguide/general/environments.html&usg=ALkJrhioXjBMKTmaf5dy_1xnQp_hxv_KWA) . De forma predeterminada, la aplicación se ejecutará utilizando el entorno de "producción". Para aprovechar las herramientas de depuración proporcionadas, debe configurar el entorno en "desarrollo".

Nota

Si va a ejecutar su sitio utilizando un servidor web (por ejemplo, Apache o Nginx), deberá modificar los permisos de la `writable`carpeta dentro de su proyecto, de modo que el usuario o la cuenta utilizada por su servidor web pueda escribirla.

## [Servidor de desarrollo local](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://codeigniter4.github.io/userguide/installation/running.html&usg=ALkJrhjJMuvY0ujRRCKqziGoDUnf7zep5A#id3)

CodeIgniter 4 viene con un servidor de desarrollo local, que aprovecha el servidor web incorporado de PHP con enrutamiento CodeIgniter. Puede usar el `serve`script para ejecutarlo, con la siguiente línea de comando en el directorio principal:

```
php spark serve
```

Esto iniciará el servidor y ahora puede ver su aplicación en su navegador en [http: // localhost: 8080](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=http://localhost:8080/&usg=ALkJrhhFePQPEtLTrzou-CA0OE9z8HgAOg) .

Nota

El servidor de desarrollo integrado solo debe utilizarse en máquinas de desarrollo locales. NUNCA debe usarse en un servidor de producción.

Si necesita ejecutar el sitio en un host que no sea simplemente localhost, primero deberá agregar el host a su `hosts`archivo. La ubicación exacta del archivo varía en cada uno de los principales sistemas operativos, aunque todos los sistemas de tipo Unix (incluido OS X) normalmente mantendrán el archivo en **/ etc / hosts** .

El servidor de desarrollo local se puede personalizar con tres opciones de línea de comando:

- Puede utilizar la `--host`opción CLI para especificar un host diferente para ejecutar la aplicación en:

  ```
  php spark serve --host=example.dev
  ```

- De forma predeterminada, el servidor se ejecuta en el puerto 8080, pero es posible que tenga más de un sitio en ejecución o que ya tenga otra aplicación que use ese puerto. Puede utilizar la `--port`opción CLI para especificar una diferente:

  ```
  php spark serve --port=8081
  ```

- También puede especificar una versión específica de PHP para usar, con la `--php`opción CLI, con su valor establecido en la ruta del ejecutable de PHP que desea usar:

  ```
  php spark serve --php=/usr/bin/php7.6.5.4
  ```

## [Hospedaje con Apache](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://codeigniter4.github.io/userguide/installation/running.html&usg=ALkJrhjJMuvY0ujRRCKqziGoDUnf7zep5A#id4)

Una aplicación web CodeIgniter4 normalmente se aloja en un servidor web. Apache `httpd`es la plataforma "estándar" y se asume en gran parte de nuestra documentación.

Apache se incluye con muchas plataformas, pero también se puede descargar en un paquete con un motor de base de datos y PHP de [Bitnami](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://bitnami.com/stacks/infrastructure&usg=ALkJrhjnuDL2jWmbq6qJoNewFUChsMDZuw) .

### .htaccess

El módulo "mod_rewrite" habilita las URL sin "index.php" en ellas, y se asume en nuestra guía del usuario.

Asegúrese de que el módulo de reescritura esté habilitado (sin comentarios) en el archivo de configuración principal, por ejemplo. `apache2/conf/httpd.conf`:

```
LoadModule rewrite_module modules/mod_rewrite.so
```

También asegúrese de que el elemento <Directory> de la raíz del documento predeterminado también habilite esto, en la configuración "AllowOverride":

```
<Directory "/opt/lamp7.2/apache2/htdocs">
    Options Indexes FollowSymLinks
    AllowOverride All
    Require all granted
</Directory>
```

### Alojamiento virtual

Recomendamos utilizar "alojamiento virtual" para ejecutar sus aplicaciones. Puede configurar diferentes alias para cada una de las aplicaciones en las que trabaja,

Asegúrese de que el módulo de alojamiento virtual esté habilitado (sin comentarios) en el archivo de configuración principal, por ejemplo. `apache2/conf/httpd.conf`:

```
LoadModule vhost_alias_module modules/mod_vhost_alias.so
```

Agregue un alias de host en su archivo "hosts", generalmente `/etc/hosts`en plataformas de tipo Unix o `c:/Windows/System32/drivers/etc/hosts`en Windows. Agrega una línea al archivo. Esto podría ser "myproject.local" o "myproject.test", por ejemplo:

```
127.0.0.1 myproject.local
```

Agregue un elemento <VirtualHost> para su aplicación web dentro de la configuración de alojamiento virtual, por ejemplo. `apache2/conf/extra/httpd-vhost.conf`:

```
<VirtualHost *:80>
    DocumentRoot "/opt/lamp7.2/apache2/htdocs/myproject/public"
    ServerName myproject.local
    ErrorLog "logs/myproject-error_log"
    CustomLog "logs/myproject-access_log" common
</VirtualHost>
```

Si la carpeta de su proyecto no es una subcarpeta de la raíz del documento de Apache, entonces su elemento <VirtualHost> puede necesitar un elemento <Directory> anidado para otorgar acceso al servidor web a los archivos.

### Pruebas

Con la configuración anterior, se accedería a su aplicación web con la URL `http://myproject.local`en su navegador.

Apache debe reiniciarse cada vez que cambie su configuración.

## [Alojamiento con Nginx](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://codeigniter4.github.io/userguide/installation/running.html&usg=ALkJrhjJMuvY0ujRRCKqziGoDUnf7zep5A#id5)

Nginx es el segundo servidor HTTP más utilizado para alojamiento web. Aquí puede encontrar una configuración de ejemplo usando PHP 7.3 FPM (sockets unix) en Ubuntu Server.

Esta configuración habilita las URL sin "index.php" en ellas y usando "404 - Archivo no encontrado" de CodeIgniter para las URL que terminan en ".php".

```
server {
    listen 80;
    listen [::]:80;

    server_name example.com;

    root  /var/www/example.com/public;
    index index.php index.html index.htm;

    location / {
        try_files $uri $uri/ /index.php$is_args$args;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;

        # With php-fpm:
        fastcgi_pass unix:/run/php/php7.3-fpm.sock;
        # With php-cgi:
        # fastcgi_pass 127.0.0.1:9000;
    }

    error_page 404 /index.php;

    # deny access to hidden files such as .htaccess
    location ~ /\. {
        deny all;
    }
}
```

## [Alojamiento con Vagrant](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://codeigniter4.github.io/userguide/installation/running.html&usg=ALkJrhjJMuvY0ujRRCKqziGoDUnf7zep5A#id6)

La virtualización es una forma eficaz de probar su aplicación web en el entorno en el que planea implementar, incluso si desarrolla en uno diferente. Incluso si usa la misma plataforma para ambos, la virtualización proporciona un entorno aislado para realizar pruebas.

El código base viene con un código `VagrantFile.dist`que se puede copiar `VagrantFile` y adaptar a su sistema, por ejemplo, permitiendo el acceso a una base de datos específica o motores de almacenamiento en caché.

### Configuración

Se asume que ha instalado [VirtualBox](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://www.virtualbox.org/wiki/Downloads&usg=ALkJrhhzIIvxM8Bps49m829TrYkpa7AH2w) y [Vagrant](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://www.vagrantup.com/downloads.html&usg=ALkJrhhPDXLI6YXXKwEkkY-EtqYMgx430A) para su plataforma.

El archivo de configuración de Vagrant asume que ha configurado una [caja de ubuntu / bionic64 Vagrant](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://app.vagrantup.com/ubuntu/boxes/bionic64&usg=ALkJrhiCggxuI-4k8FkXXX_GwcbsKQMaQg) en su sistema:

```
vagrant box add ubuntu/bionic64
```

### Pruebas

Una vez configurada, puede iniciar su aplicación web dentro de una máquina virtual, con el comando:

```
vagrant up
```

Se podrá acceder a su aplicación web en `http://localhost:8080`, con el informe de cobertura de código para su compilación en `http://localhost:8081`y la guía del usuario en `http://localhost:8082`.



# Actualización de 3.xa 4.x

CodeIgniter 4 es una reescritura del marco y no es compatible con versiones anteriores. Es más apropiado pensar en convertir su aplicación, en lugar de actualizarla. Una vez que haya hecho eso, la actualización de una versión de CodeIgniter 4 a la siguiente será sencilla.

Se ha mantenido la filosofía de “esbelta, media y simple”, pero la implementación tiene muchas diferencias en comparación con CodeIgniter 3.

No hay una lista de verificación de 12 pasos para actualizar. En su lugar, comience con una copia de CodeIgniter 4 en una nueva carpeta de proyecto, [sin embargo, desea instalarlo y usarlo](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://codeigniter4.github.io/userguide/installation/index.html&usg=ALkJrhhhQ2IvCpkRgifnXRhpueTgpD7tqg) , y luego convierta e integre los componentes de su aplicación. Intentaremos señalar aquí las consideraciones más importantes.

¡No todas las bibliotecas de CI3 se han adaptado o reescrito para CI4! Consulte los hilos en el subforo de [CodeIgniter 4 Roadmap](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://forum.codeigniter.com/forum-33.html&usg=ALkJrhgOtwy3Yae0EWjd2FID42_VymDt0A) para obtener una lista actualizada.

**¡Lea la guía del usuario** antes de embarcarse en la conversión de un proyecto!

**Descargas**

- CI4 todavía está disponible como un archivo comprimido o tarball listo para ejecutar, que incluye la guía del usuario (aunque en la subcarpeta de documentos )
- También se puede instalar usando Composer

**Espacios de nombres**

- CI4 está construido para PHP7.2 +, y todo en el marco tiene espacio de nombres, excepto los ayudantes.

**Estructura de la aplicación**

- La `application`carpeta se renombra como `app`y el marco todavía tiene `system`carpetas, con la misma interpretación que antes.
- El marco ahora proporciona una `public`carpeta, pensada como la raíz del documento para su aplicación
- También hay una `writable`carpeta para almacenar datos de caché, registros y datos de sesión.
- La `app`carpeta es muy similar a la `application`de CI3, con algunos cambios de nombre y algunas subcarpetas movidas a la `writable`carpeta.
- Ya no hay una `application/core`carpeta anidada , ya que tenemos un mecanismo diferente para extender los componentes del marco (ver más abajo)

**Carga de clases**

- Ya no hay un "superobjeto" de CodeIgniter, con referencias de componentes del marco inyectadas mágicamente como propiedades de su controlador
- Se crean instancias de clases donde sea necesario, y los componentes son administrados por `Services`
- El cargador de clases maneja automáticamente la localización de clases de estilo PSR4, dentro de los espacios de nombres de nivel superior `App`(aplicación) y `CodeIgniter`(es decir, sistema); con soporte de carga automática del compositor, e incluso usando adivinanzas educadas para encontrar sus modelos y bibliotecas si están en la carpeta correcta aunque no tengan espacio de nombres
- Puede configurar la carga de clases para admitir cualquier estructura de aplicación con la que se sienta más cómodo, incluido el estilo "HMVC"

**Controladores**

- Los controladores extienden \ CodeIgniter \ Controller en lugar de CI_Controller
- Ya no usan un constructor (para invocar la "magia" de CI) a menos que sea parte de un controlador base que usted crea
- CI proporciona `Request`y `Response`objetos con los que trabajar, más potente que el CI3-way
- Si desea un controlador base (MY_Controller en CI3), hágalo donde desee, por ejemplo, BaseController extiende el controlador, y luego haga que sus controladores lo extiendan

**Modelos**

- Los modelos extienden \ CodeIgniter \ Model en lugar de CI_Model
- El modelo CI4 tiene mucha más funcionalidad, incluida la conexión automática a la base de datos, CRUD básico, validación en el modelo y paginación automática
- CI4 también tiene la `Entity`clase en la que puede construir, para un mapeo de datos más rico a las tablas de su base de datos
- En lugar de CI3 `$this->load->model(x);`, ahora usaría , siguiendo las convenciones de espacio de nombres para su componente`$this->x = new X();`

**Puntos de vista**

- Sus vistas se parecen mucho a las anteriores, pero se invocan de manera diferente ... en lugar de las CI3, `$this->load->view(x);`puede usar`echo view(x);`
- CI4 admite "celdas" de visualización, para construir su respuesta en partes
- El analizador de plantillas sigue ahí, pero mejorado sustancialmente

**Bibliotecas**

- Las clases de la aplicación aún pueden ingresar `app/Libraries`, pero no es necesario
- En lugar de CI3, `$this->load->library(x);`ahora puede usar , siguiendo las convenciones de espacio de nombres para su componente`$this->x = new X();`

**Ayudantes**

- Los ayudantes son prácticamente los mismos que antes, aunque algunos se han simplificado

**Eventos**

- Los ganchos han sido reemplazados por eventos
- En lugar de los CI3 `$hook['post_controller_constructor']`que usa ahora , con el espacio de nombres`Events::on('post_controller_constructor', ['MyClass', 'MyFunction']);``CodeIgniter\Events\Events;`
- Los eventos siempre están habilitados y disponibles a nivel mundial

**Ampliando el marco**

- No necesita una `core`carpeta para contener `MY_...`extensiones o reemplazos de componentes del marco
- No necesita `MY_x`clases dentro de su carpeta de bibliotecas para extender o reemplazar piezas CI4
- Cree esas clases donde desee y agregue los métodos de servicio apropiados `app/Config/Services.php`para cargar sus componentes en lugar de los predeterminados



# Solución de problemas

A continuación, se muestran algunos problemas de instalación comunes y soluciones alternativas sugeridas.

## ¿Cómo sé si mi instalación está funcionando?

Desde la línea de comando, en la raíz de su proyecto:

```
php spark serve
```

`http://localhost:8080` en su navegador debería mostrar la página de bienvenida predeterminada:

![CodeIgniter4 Bienvenido](https://codeigniter4.github.io/userguide/_images/welcome.png)

## Tengo que incluir index.php en mi URL

Si una URL como `/mypage/find/apple`no funciona, pero la URL similar `/index.php/mypage/find/apple`sí, parece que sus `.htaccess`reglas (para Apache) no están configuradas correctamente, o la `mod_rewrite`extensión en Apache `httpd.conf`está comentada.

## Solo se carga la página predeterminada

Si descubre que no importa lo que ponga en su URL, solo se está cargando su página predeterminada, es posible que su servidor no admita la variable REQUEST_URI necesaria para ofrecer URL compatibles con los motores de búsqueda. Como primer paso, abra su archivo *app / Config / App.php* y busque la información del protocolo URI. Le recomendará que pruebe un par de configuraciones alternativas. Si aún no funciona después de haber probado esto, deberá forzar a CodeIgniter a agregar un signo de interrogación a sus URL. Para hacer esto, abra su archivo *app / Config / App.php* y cambie esto:

```
public $indexPage = 'index.php';
```

A esto:

```
public $indexPage = 'index.php?';
```

El tutorial da errores 404 en todas partes :(

No puede seguir el tutorial utilizando el servidor web incorporado de PHP. No procesa el archivo .htaccess necesario para enrutar las solicitudes correctamente.

La solución: use Apache para servir su sitio, o el equivalente integrado de CodeIgniter, desde la raíz de su proyecto.`php spark serve`

## ¿Qué pasa con un inútil "¡Ups!" ¿página?

Encuentra que su aplicación muestra una página con "¡Ups!" y luego la línea de texto “Parece que hemos tenido un inconveniente. Por favor, inténtelo de nuevo más tarde…".

Esa es una señal de que está en modo de producción y ha encontrado un error irrecuperable, que no queremos mostrar al espectador de la aplicación web, para mayor seguridad.

Puede ver el error en la visualización de la barra de herramientas de depuración configurando su entorno en "desarrollo" (en .env ) y volviendo a cargar la página.

¡No olvide restablecer el entorno a "producción" una vez que solucione el problema!

## Registros de errores de CodeIgniter

CodeIgniter registra los mensajes de error, de acuerdo con la configuración en app / Config / Logger.php .

Puede ajustar el umbral de error para ver más o menos mensajes.

La configuración predeterminada tiene archivos de registro diarios almacenados en registros / grabables . ¡Sería una buena idea comprobarlos si las cosas no funcionan como esperas!



# Cree su primera aplicación

## Visión general

Este tutorial tiene como objetivo presentarle el marco CodeIgniter4 y los principios básicos de la arquitectura MVC. Le mostrará cómo se construye una aplicación CodeIgniter básica paso a paso.

Si no está familiarizado con PHP, le recomendamos que consulte el [Tutorial de PHP de W3Schools](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://www.w3schools.com/php/default.asp&usg=ALkJrhiLg_ndmKf_0y7okCmrJi7Jjvq8pg) antes de continuar.

En este tutorial, creará una **aplicación de noticias básica** . Comenzará escribiendo el código que puede cargar páginas estáticas. A continuación, creará una sección de noticias que lea las noticias de una base de datos. Finalmente, agregará un formulario para crear noticias en la base de datos.

Este tutorial se centrará principalmente en:

- Conceptos básicos de Model-View-Controller
- Conceptos básicos de enrutamiento
- Validación de formularios
- Realización de consultas básicas de bases de datos con el "Generador de consultas" de CodeIgniter

El tutorial completo se divide en varias páginas, cada una de las cuales explica una pequeña parte de la funcionalidad del marco CodeIgniter. Pasará por las siguientes páginas:

- Introducción, esta página, que le brinda una descripción general de lo que puede esperar y hace que su aplicación predeterminada se descargue y se ejecute.
- [Páginas estáticas](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://codeigniter4.github.io/userguide/tutorial/static_pages.html&usg=ALkJrhjqZf1V3hXdlFLxu-8xgkKuAyVwKQ) , que le enseñarán los conceptos básicos de controladores, vistas y enrutamiento.
- [Sección de noticias](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://codeigniter4.github.io/userguide/tutorial/news_section.html&usg=ALkJrhic0vF3oda25Gn9J3M_vO-200Q22A) , donde comenzará a usar modelos y realizará algunas operaciones básicas de la base de datos.
- [Cree elementos de noticias](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://codeigniter4.github.io/userguide/tutorial/create_news_items.html&usg=ALkJrhi-GUfJ82-rKtkhMKPDRk70b7zE-A) , que introducirán operaciones de base de datos más avanzadas y validación de formularios.
- [Conclusión](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://codeigniter4.github.io/userguide/tutorial/conclusion.html&usg=ALkJrhgjcT0GqLg16iuQ3eyfjNbvWWlGBQ) , que le dará algunos consejos sobre lecturas adicionales y otros recursos.

Disfrute de su exploración del marco CodeIgniter.

## Levantarse y correr

Puede descargar una versión manualmente desde el sitio, pero para este tutorial usaremos la forma recomendada e instalaremos el paquete AppStarter a través de Composer. Desde su línea de comando, escriba lo siguiente:

```
composer create-project codeigniter4/appstarter ci-news
```

Esto crea una nueva carpeta, ci-news, que contiene el código de su aplicación, con CodeIgniter instalado en la carpeta del proveedor.

De forma predeterminada, CodeIgniter se inicia en modo de producción. Esta es una característica de seguridad para mantener su sitio un poco más seguro en caso de que la configuración se estropee una vez que esté activo. Así que primero arreglemos eso. Copie o cambie el nombre del `env`archivo a `.env`. Abrelo.

Este archivo contiene configuraciones específicas del servidor. Esto significa que nunca necesitará enviar información confidencial a su sistema de control de versiones. Incluye algunos de los más comunes a los que ya desea ingresar, aunque todos están comentados. Así que descomente la línea con CI_ENVIRONMENT en ella y cambie `production`a `development`:

```
CI_ENVIRONMENT = development
```

Con eso fuera del camino, es hora de ver su aplicación en un navegador. Puede servirlo a través de cualquier servidor de su elección, Apache, Nginx, etc., pero CodeIgniter viene con un comando simple que aprovecha el servidor incorporado de PHP para ponerlo en funcionamiento rápidamente en sus máquinas de desarrollo. Escriba lo siguiente en la línea de comando desde la raíz de su proyecto:

```
php spark serve
```

## La página de bienvenida

Ahora apunte su navegador a la URL correcta y será recibido por una pantalla de bienvenida. Pruébelo ahora dirigiéndose a la siguiente URL:

```
http://localhost:8080
```

y debería ser recibido por la siguiente página:

![../_images/welcome1.png](https://codeigniter4.github.io/userguide/_images/welcome1.png)

Esto significa que su aplicación funciona y puede comenzar a realizar cambios en ella.

## Depuración

Ahora que está en modo de desarrollo, verá una barra de herramientas en la parte inferior de su aplicación. Esta barra de herramientas contiene una serie de elementos útiles a los que puede hacer referencia durante el desarrollo. Esto nunca se mostrará en entornos de producción. Al hacer clic en cualquiera de las pestañas de la parte inferior, aparece información adicional. Al hacer clic en la X a la derecha de la barra de herramientas, se minimiza a un pequeño cuadrado con la llama CodeIgniter en él. Si hace clic en eso, la barra de herramientas se mostrará de nuevo.

Además de esto, CodeIgniter tiene algunas páginas de error útiles cuando encuentra excepciones u otros errores en su programa. Abra `app/Controllers/Home.php`y cambie alguna línea para generar un error (¡eliminar un punto y coma o una llave debería ser suficiente!). Será recibido por una pantalla con un aspecto similar a esto:

![../_images/error.png](https://codeigniter4.github.io/userguide/_images/error.png)

Hay un par de cosas a tener en cuenta aquí:

1. Al pasar el cursor sobre el encabezado rojo en la parte superior, se revela un `search`enlace que abrirá Google.com en una nueva pestaña y buscará la excepción.
2. Al hacer clic en el `arguments`enlace en cualquier línea del Backtrace se expandirá una lista de los argumentos que se pasaron a esa llamada de función.

Todo lo demás debe quedar claro cuando lo veas.

Ahora que sabemos cómo empezar y cómo depurar un poco, comencemos a crear esta pequeña aplicación de noticias.

[próximo ](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://codeigniter4.github.io/userguide/tutorial/static_pages.html&usg=ALkJrhjqZf1V3hXdlFLxu-8xgkKuAyVwKQ)[ Anterior](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://codeigniter4.github.io/userguide/installation/repositories.html&usg=ALkJrhi1B8TP6b1YbgITECQe9W8zex3tKw)



Documentacion de: https://translate.google.com/translate?hl=es&sl=en&u=https://codeigniter4.github.io/userguide/installation/running.html&prev=search&pto=aue

