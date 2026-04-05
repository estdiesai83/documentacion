# COMPOSER

Comporser es un gestor de dependencias en proyectos, para programación en PHP. Eso quiere decir que nos permite gestionar (declarar, descargar y mantener actualizados) los paquetes de software en los que se basa nuestro proyecto PHP. 

¿Empiezas un nuevo proyecto con PHP? echa un vistazo antes a Composer porque te puede ayudar bastante en el arranque y gracias a él podrás resumir muchas de las tareas de mantenimiento de las librerías de terceros que estés usando.

[https://getcomposer.org](https://getcomposer.org/)



## Por qué un gestor de dependencias

Cuando comienzas un proyecto en PHP, ya de cierta complejidad, no te vale solo con la librería de funciones nativa de PHP. Generalmente todos usamos alguna que otra librería de terceros desarrolladores, que nos permite evitar empezar todo desde cero. Ya sea un framework o algo más acotado como un sistema para debug o envío de email, validación de formularios, etc., cualquier cosa que puedas necesitar ya está creada por otros desarrolladores. 

De modo que, al comenzar el proyecto hasta ahora teníamos que ir a la página de cada uno de los componentes de software que queríamos usar, descargarlos, copiarlos en la carpeta de nuestro proyecto, etc. No solo eso, cuando estamos en mitad del desarrollo, o ya en producción, y nos cambian la versión de la librería, tenemos que volverla a descargar manualmente, actualizar los archivos, etc.

Todo eso sin contar con que ciertos softwares, como un framework como Symfony, dependen a su vez de muchas otras librerías que tendrías que instalar a mano y a su vez, mantener actualizadas.

Los gestores de paquetes nos ayudan para resumir las tareas de descarga y mantenimiento de las versiones del proyecto para que estén siempre actualizadas. Ya existían en otros lenguajes de programación y nos resultaban especialmente útiles como npm en NodeJS. Ahora los desarrolladores de PHP también contamos con esta herramienta gracias a Composer.

## Cómo funciona Composer

Composer nos permite declarar las librerías que queremos usar en un proyecto.

Para beneficiarnos del workflow que nos propone Composer simplemente tenemos que escribir un archivo de configuración en el que indicamos qué paquetes vamos a requerir. El archivo es un simple JSON en el que indicamos cosas como el autor del proyecto, las dependencias, etc.

El archivo JSON debe tener un nombre específico: **composer.json**

A continuación tienes un ejemplo de JSON donde declaramos varios parámetros de nuestra aplicación.

```javascript
{
    "name": "desarrolloweb/probando-composer",
    "require": {
        "phpmailer/phpmailer": "5.2.*",
    }
}
```

Una vez tenemos definidas las dependencias en nuestro proyecto debemos instalarlas. Esto lo conseguimos con un simple comando en el terminal en el que le pedimos a Composer que las instale:

```markup
composer install
```

**Nota:** Ese comando puede variar según la instalación que tengas en tu sistema de Composer. 

Lanzado ese comando Composer se encargará de ir a los repositorios de paquetes de software y descargar aquellas librerías mencionadas, copiándolas en la carpeta de tu proyecto.

Una vez finalizado el proceso en tu consola de comandos podrás encontrar en la carpeta de tu proyecto un directorio llamado "vendor" donde estarán las librerías declaradas. Ya solo nos queda hacer los includes para que estén disponibles en tus aplicaciones y para ello también nos ayuda Composer.

Simplemente tendremos que hacer un único include o require en nuestro código y todas las librerías estarán disponibles para usar.

```php
require 'vendor/autoload.php';
```

## Packagist

Se trata del repositorio de paquetes que son instalables por medio de Composer.

En la página de Packagist encontrarás un buscador con material disponible para usar en cualquier proyecto PHP. https://packagist.org/

Simplemente busca por cualquier concepto que te interese, como email, template, wysiwyg, etc. Sobre cada paquete encuentras información y el código necesario para declarar tu dependencia en el JSON de Composer.

## Conclusión

Herramienta  muy útil, una vez comienzas a usarla te das cuenta de todo el trabajo que te quita del medio, no solo en la descarga de los paquetes, sino también en las actualizaciones de las librerías con el comando "composer update".

## Instalar composer en Linux

```markup
curl -sS https://getcomposer.org/installer | php
```

Utilizacion de composer

Para declarar las dependencias debes indicarlas en un archivo en notación de objeto Javascript (JSON). Ese archivo debes colocarlo en la carpeta raíz de tu proyecto y su nombre debe de ser composer.json.

El archivo JSON sirve para indicar algunos datos sobre nuestro proyecto, así como las dependencias que tiene con otros paquetes de los que te encuentras en Packagist.

Para que sirva de muestra, veamos a continuación el contenido de un archivo de ejemplo composer.json.

```javascript
{
   "name": "desarrolloweb/probando-composer",
   "require": {
       "phpmailer/phpmailer": "5.2.*",
       "raveren/kint": "0.9.*@dev"
   }
}
```

En este archivo estamos indicando que nuestro proyecto se llama "desarrolloweb/probando-composer". Siempre se utilizan dos nombres, uno el nick de la empresa o creadores y otro el nombre del proyecto en sí. Luego con el campo require estamos indicando que vamos a usar dos librerías, por un lado el phpmailer de phpmailer y el kint de ravener.

Además, observarás que cada paquete tiene una versión requerida. Por ejemplo en phpmailer declaramos como versión "5.2.*". Eso quiere decir que te instale siempre la versión 5.2.x (la más reciente de la 5.2). Pero podrías haber declarado "5.*". Existen varios operadores para especificar la versión. Lo mejor es que revises la documentación de Composer para conocerlos todos.

## Instalando las librerías o software definido como dependencias

Una vez declarado ese json en la carpeta de nuestro proyecto tienes que lanzar un comando para que composer se ponga en marcha, revise los paquetes que hemos declarado, los descargue con sus dependencias y los instale en la carpeta de nuestro proyecto.

Ese comando de consola lo tienes que hacer desde la carpeta de tu proyecto. Abres el terminal y te situas en la carpeta donde has creado en composer.json.

Dependiendo de la instalación que hayamos realizado de Composer el comando puede tener ligeras variaciones. Esto también puede depender de tu sistema operativo.

**Si estamos en Linux/Mac y hemos instalado Composer de manera local a un proyecto.** Será algo como:

```markup
php composer.phar install
```

**Si estás en Linux/Mac y has hecho los pasos para instalar Composer de manera global** el comando puede ser:

```markup
composer install
```

## Actualizando dependencias con Composer

Una vez ya tienes las dependencias instaladas, si deseas actualizarlas, o bien si has añadido dependencias a tu archivo JSON, harás un comando como este:

```markup
composer update
```

## Usar los paquetes instalados por Composer

Cuando instalas una dependencia via Composer te crea un directorio llamado "vendor" que es donde se instalan todas las librerías que has solicitado. Además, en esa misma carpeta encontrarás un archivo llamado "autoload.php" que es el único script que deberás incluir desde PHP.



```php
<?php
require "vendor/autoload.php";
// ahora ya puedes acceder a las clases creadas por las librerías declaradas como dependencias…
```

**Explicaciones sobre el contenido del archivo JSON de un proyecto para usar Composer como gestor de dependencias.**

El archivo composer.json nos sirve no solamente para que Composer sepa las dependencias que debe instalar para tu proyecto, también sirve en el caso que quieras liberar tu proyecto como un paquete para que lo usen otras personas y publicarlo en Packagist. En este artículo nos vamos a centrar más en lo que necesitas para definir tus dependencias.

## El esquema composer.json



El schema (esquema) de un JSON define la estructura del documento así como los valores posibles que tengan cada uno de sus campos. La dirección concreta donde puedes encontrar la descripción completa del schema del composer.json la encuentras en esta URL de documentación:

https://getcomposer.org/doc/04-schema.md

## Campos que describen tu proyecto

Estos son los datos que necesitarías enviar a Packagist, pero que no son necesarios a nivel interno para que Composer funcione, sino más bien para etiquetar tu desarrollo, mencionar autores, etc.

**name:**
Sirve para indicar el nombre del autor, se compone de dos partes, el "vendor" (la empresa o nick del desarrollador o grupo que lo ha creado) y el nombre del proyecto propiamente dicho. Por supuesto, un vendor puede crear diversas librerías o paquetes y quedarían todas vinculadas al mismo vendor con nombres de proyectos distintos.

**description:**
Es la descripción que ofrecemos de este paquete. Es un texto normalmente de una única línea.

**homepage:**
Una URL del sitio web del proyecto.

**authors:**
Es un array con los autores del proyecto. Cada uno de los elementos de ese array es a su vez un objeto JSON donde se pueden indicar distintos datos: name, email, homepage, role (rol dentro del proyecto).

```javascript
"authors": [
	{
		"name": "Miguel Angel Alvarez",
		"email": "algo@desarrolloweb.com",
		"homepage": "http://www.desarrolloweb.com",
		"role": "Project Manager"
	},
	{
		"name": "Alvaro Martínez",
		"email": "algo@escuela.it",
		"homepage": "http://www.escuela.it",
		"role": "Beta tester"
	}
]
```



## Definir las dependencias

A nivel de desarrollo de nuestras propias aplicaciones, el campo más importante donde debemos centrarnos es en la definición de las dependencias, así como las versiones que deseamos que sean instaladas, o actualizadas de cada una de esas dependencias.

**require:**
Es un objeto con una serie de pares clave/valor que definen cada una de las dependencias que Composer debe instalar para nuestro proyecto. En la clave debemos de indicar el nombre del paquete que depende (que obtienes del sitio de Packagist) y como valor indicamos la versión que deseamos que esté instalada, o el rango de versiones.

```javascript
"require": {
	"respect/validation": "0.6.*",
	"phpunit/phpunit": ">=4.0",
	"tinymce/tinymce": "dev-master"
}
```

En los pares clave/valor de cada una de las dependencias, la parte del nombre del vendor y la librería es muy fácil de obtener. Simplemente te vas a Packagist buscas y escoges el paquete que más te convenga y copias la cadena del nombre. Por ejemplo "respect/validation" indica que "respect" es el vendor y "validation" es el nombre de la librería.

La parte de la versión también te puedes ayudar de Packagist, pues ahí encontrarás la lista de versiones liberadas de esa librería y disponibles como paquetes. Lo que verás es que la expresión que define la versión tiene algunos caracteres "comodín" que debes aprender a tratar. En general puedes usar estas variantes de expresión.

- **Versión exacta:** indicas a Composer que debe instalar una versión exacta, y solo esa. Quiere decir que nunca te va a actualizar el paquete, porque tu proyecto debe tener esa versión y no otra. Por ejemplo "4.3.1".
- **Rango de versiones:** permite indicar versiones que sean mayor que una determinada, menor o que esté entre una versión y otra. Por ejemplo ">=2.0".
- **Comodín:** Permite decir cualquier versión de una release mayor. Bueno, puedes usar algo como "4.*" para indicar que se deje siempre la versión 4 y cualquier cosa. O algo más restrictivo como "4.2.*" que te pondrá siempre la versión 4.2.x. Lógicamente, en este caso cuando actualices, se colocará la versión más avanzada permitida por ese comodín.
- **Virgulilla (el rabo de la eñe):** permite indicar la versión de una manera diferente, "próxima versión significativa". Por ejemplo, "~2.2" siempre te dejará la versión mayor o igual a la 2.2 y menor que la 3.0. Por ejemplo "~2.2.1" te pondrá la versión mayor igual que 2.2.1 y menor que 2.3.
- **También te permite cosas como "dev-master"** que será la versión actual de desarrollo, que puede darse el caso que no sea estable. "1.0.*@beta" que te permitirá colocar versiones beta o "@dev" que también referencia a versiones de desarrollo que pueden sufrir inestabilidad.

Para encontrar otras posibilidades, por favor consulta la documentación de Composer, en estos enlaces:

- [Crear los enlaces a paquetes dependientes](https://getcomposer.org/doc/04-schema.md#package-links)
- [Definir las versiones aceptadas](https://getcomposer.org/doc/01-basic-usage.md#package-versions)



**Cómo incluir el código de los paquetes que se instalan vía composer en páginas PHP por medio del autoload de clases.**

Cuando instalas una dependencia, una librería, una clase o cualquier código de terceros en general, es porque quieres usarla dentro de tu código PHP. Si instalas una librería a mano tendrás que saber en qué carpeta la has metido y cómo se llaman los ficheros con el código que necesitas incluir, pero si lo haces desde este sistema de gestión de dependencias puedes ahorrate ese trabajo de organización gracias al autoload de clases con Composer.

## Archivo autoload.php

El archivo autoload.php lo crea Composer automáticamente en la carpeta "vendor" y contiene el código para que tus librerías se puedan cargar automáticamente, por demanda según se vayan usando.

Tengamos una o decenas de dependencias, el único archivo que tenemos que incluir en una página PHP del proyecto es el mencionado autoload.php.

```php
//autoload de composer
require 'vendor/autoload.php';
```

**Nota:** no te preocupes por tener muchas dependencias y solo usar unas pocas en una página en concreto. Este archivo autoload no carga nada especialmente, solo tiene el script de autocarga de clases, no resultará más pesado para PHP de lo estrictamente necesario, pues solamente se irán cargando las clases que vayas usando en tu código.

El la carpeta "vendor" debe de estar en la raíz de tu proyecto, típicamente fuera del directorio "document root", para que no sea accesible directamente a través de una URL de tu sitio web . Pero claro, depende desde donde carges este archivo de autoload, la ruta de tu include puede ser diferente.

## Usar una dependencia instalada

Realmente, cargado el autoload.php no tenemos mucho más que hacer. Simplemente, cuando se necesiten las clases (de programación orientada a objetos), porque se instancien objetos o se haga uso de sus métodos estáticos, éstas estarán disponibles para nosotros.

Ten en cuenta que las dependencias de packagist se organizan por namespaces en PHP, por lo que a la hora de usar las clases tendrás que hacer el correspondiente "use", o bien escribir el namespace completo donde está tu clase.

Por ejemplo, esto hace uso de un método estático de un sistema de plantillas llamado Plates, para inicializarse. Observa el namespace "League\Plates". El nombre de la clase es "Engine".

```php
$templates = new League\Plates\Engine($raiz . '../data/plantillas');
```

Ese mismo código también podría hacerse con el correspondiente "use" en el que indicamos la clase y su namespace. Una vez que se declara que se va a usar dicha clase en el correspondiente namespace, ya podemos invocar sus métodos o el constructor sin indicar el namespace completo.

```php
use League\Plates\Engine;
$templates = new Engine($raiz . '../data/plantillas');
```

Resulta obvio, pero queremos remarcar que este código no funcionaría si no se ha hecho el correspondiente autoload con PHP, que nos ofrece el archivo vendor/autoload.php.

**Nota:** Si lo necesitas, puedes encontrar más información sobre espacios de nombres en el artículo [Namespaces en PHP](https://desarrolloweb.com/articulos/uso-namespaces-php.html).

## Configurar el sistema de autocarga de clases

El proceso descrito antes es el trabajo básico que tendremos que realizar para cargar las librerías, de una manera ágil, gracias a Composer. Pero podría ser necesario para nuestras aplicaciones configurar el sistema de autocarga de clases. En la mayoría de los casos no será necesario, pero puede venirnos bien si queremos aprovecharnos del autoload de Composer para cargar de manera automática las clases de nuestro propio proyecto.

Para ello se define un nuevo campo, llamado "autoload" en el [archivo composer.json](https://desarrolloweb.com/articulos/setup-proyecto-php-composer-json.html).

Ese campo nos permite indicar un namespace y las clases que se encuentran detrás de ese namespace.

```javascript
"autoload": {
    "psr-4": {"MiNamespace\\": "mi_carpeta/"}
}
```

Esto indica que las clases del namespace "MiNamespace" las tiene que ir a buscar al directorio "mi_carpeta" (suponiendo que "mi_carpeta" se encuentra colgando la raíz, por lo que sería un hermano del directorio "vendor").

Solo un único detalle. Una vez has configurado el sistema de autoload de composer, debes correr el comando "dump-autoload", para que se vuelva a generar y optimizar todo el proceso de autoload de clases de Composer.

Este paso es tan sencillo como lanzar el comando:

```git
composer dump-autoload
```

![img](https://desarrolloweb.com/archivoimg/general/4561.png)

Ahora que tenemos el archivo "vendor/autoload.php" regenerado, ya podremos tener disponibles las clases de este namespace para su autocarga.

### Configurar el sistema de autocarga en tiempo de ejecución

Sobre el sistema de autocarga también nos viene bien saber que se puede configurar en tiempo de ejecución, y no solamente mediante el composer.json. Esto es útil cuando existen ciertas clases que solo se usan en determinado momento, como clases de testing y no las necesitamos para nada cuando el sitio está funcionando de manera general.

Lo consigues gracias a una instancia de un objeto "loader" que te devuelve el require de tu autoload.

```php
$loader = require 'vendor/autoload.php';
$loader->addPsr4('MiNamespace\\', 'mi_carpeta');
```

### **Errores frecuentes que puedes encontrar en el trabajo con Composer, el gestor de dependencias de PHP, que pueden ahorrarte algún que otro problema.**

## Mantener actualizado composer

Aparte de actualizar las dependencias, acuérdate de actualizar el propio Composer. Una de las primeras recomendaciones que te ofrecen en la guía de Composer es que ante cualquier problema te asegures primero de estar ejecutando la versión más nueva del software. Lo consigues con un comando de auto-actualización o auto-update.

```markup
composer self-update
```

Recuerda que quizás tengas que ejecutar ese comando como superusuario (sudo composer self-update). Recuerda también que si tu instalación de composer no es global posiblemente tengas que invocar llamando directamente a composer.phar a través del intérprete de PHP (php composer.phar self-update). 

## JSON mal formado

Este error es muy fácil de detectar. Si has formado mal tu JSON tendrás un error como:

*"./composer.json" does not contain valid JSON*

Si estás con UTF-8 debe ser un error de sintaxis, unas comillas que te faltan, una coma o algo así. Si te vuelves loco para encontrar el fallo prueba a usar un Validador de JSON: http://jsonlint.com/

## Memoria límite de PHP

Si tu composer.json declara muchas dependencias quizás tengas que aumentar la memoria de los procesos de PHP. El error que verás es parecido a este:

*Fatal error: Allowed memory size of 536870912 bytes exhausted (tried to allocate 72 bytes) in phar:///usr/local/Cellar/composer/1.0.0-alpha8/libexec/composer.phar/src/Composer/DependencyResolver/RuleSetGenerator.php on line 123*

Esto se soluciona asignando más memoria para el proceso de PHP y se indica en el php.ini, en la variable de configuración memory_limit.

```markup
memory_limit = 2048M
```

El valor de memory_limit admite números enteros, en cuyo caso estás especificando una cantidad de Bytes. Pero también te admite terminar con una unidad ("K", "M", "G") indicando el valor en Kb, Mega o Giga.

No te olvides de reiniciar PHP una vez has hecho cualquier configuración en el PHP.ini.

### ¿Cuál es mi php.ini cuando trabajo por línea de comandos?

Una pregunta típica, a fin de aumentar la memoria límite de tu PHP es ¿Qué archivo de configuración php.ini debo editar? Si estás trabajando con Composer lo harás con el comando "composer" en tu terminal de sistema operativo. En ese caso es posible que estés trabajando con un php.ini diferente de tu PHP cuando trabaja sobre Apache.

Para saber el php.ini de línea de comandos (PHP CLI) tienes que hacer simplemente este comando.

```markup
php -i
```

Eso te mostrará una cantidad enorme de datos, parecidos a los que obtienes con phpinfo(). Tienes que buscar entre toda esa salida el texto "php.ini" para encontrar la ruta del archivo de configuración que se esté utilizando. En algún lugar aparecerá un texto como este:

```markup
Loaded Configuration File => /usr/local/etc/php/7.4/php.ini
```

## Aumentar el tiempo del proceso de composer

Cuando invocas el comando composer de manera predeterminada se asigna un tiempo de procesamiento que son 300 segundos. Este tiempo puede ser insuficiente en caso que los paquetes a descargar sean pesados o en conexiones a Internet lentas. Si te ocurre esto recibirás un error que entre otras cosas tendrá este texto.

*[...] The process "git clone [...] exceeded the timeout of 300 seconds*

En este caso puedes invocar al comando asignando un nuevo valor máximo en segundos para realizar las operaciones de actualización o instalación de las dependencias. Sería algo como:

```markup
COMPOSER_PROCESS_TIMEOUT=3600 composer install
```

En la propia documentación de Composer encontrarás una excelente [guía de resolución de problemas](https://getcomposer.org/doc/articles/troubleshooting.md) (en inglés) en la que seguramente darás respuesta a muchas otras situaciones.



Documentación sacada de : https://desarrolloweb.com/articulos/usando-composer.html