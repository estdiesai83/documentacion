[TOC]

# Crear proyecto nuevo codeiginiter con doctrine



Instalar php con las extensiones necesarias:

```bash
sudo apt install php libapache2-mod-php php-cli php-common php-mbstring php-gd php-intl php-xml php-mysql php-zip php-json php-curl -y
sudo systemctl restart apache2
```



Instalar composer

```
apt-get install composer
```



Para crear un proyecto nuevo con estructura codeigniter4:

```
composer create-project codeigniter4/appstarter nombre_proyecto
```

Actualizar composer:

```
composer update
```

Instalar traducciones:

```
composer require codeigniter4/translations
```

Para ejecutar el proyecto, poner en el navegador:

```
http://localhost/nombre_proyecto/public/
```

Si esta todo correcto, debe mostrar:  Welcome to Codeigniter4

Si en lugar de dicho mensaje muestra: We seem to have hit a snag. Please try again later.., Para saber como solucionarlo:

Modificar en el archivo : app => Config => Boot => production.php

```
Change the ini_set('display_errors', '0') to ini_set('display_errors', '1').
```

 O Modificar en el archivo .env:

```
#CI_ENVIRONMENT = production
CI_ENVIRONMENT = development
```

Configurar zona horaria, para que cuando hagamos un insert con fecha por ejemplo coja la zona horaria de España modificar en app/Config/App.php

```php
//public $appTimezone = 'America/Chicago';
public $appTimezone = 'Europa/España';
```



**Nota: Antes de usar CodeIgniter 4, asegúrese de que su servidor cumpla con los [requisitos](https://translate.googleusercontent.com/translate_c?depth=1&hl=es&prev=search&pto=aue&rurl=translate.google.com&sl=en&sp=nmt4&u=https://codeigniter4.github.io/userguide/intro/requirements.html&usg=ALkJrhjosk2sTcMxIZiDSBLPq5mKR416lQ) , en particular la versión PHP y las extensiones PHP necesarias. Es posible que tenga que descomentar en `php.ini`las líneas de "extensión" para habilitar "curl" e "intl", por ejemplo.



## Instalación Doctrine con composer

Para instalar doctrine con composer, abrir archivo composer.json y añadir las líneas:

```json
{
    "require": {
        "doctrine/orm": "^2.6.2",
        "symfony/yaml": "2.*"
    },
    "autoload": {
        "psr-0": {"": "src/"}
    }
}
```

Despues desde la terminal ejecutar:

```bash
composer install
composer update
```

Esto instalará los paquetes Doctrine Common, Doctrine DBAL, Doctrine ORM, en el directorio `vendor`.



## Configuracion doctrine

Permisos:

Para que funcione correctamente 

### Crear archivo Doctrine.php en app/Libraries:

```php
<?php
namespace App\Libraries;

//WE INCLUDING THE AUTOLOAD VENDOR
include_once dirname(__DIR__, 2) . '/vendor/autoload.php';

use Doctrine\Common\ClassLoader;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\Tools\Setup;
use Doctrine\ORM\Mapping\Driver\PHPDriver;

// TO OBTAIN THE ENTITY MANAGER 
class Doctrine
{
    public $em;

    public function __construct()
    {
    	// CONNECTION SETUP YOU NEED TO CHANGE WITH YOURS DBB
        $connection_options = array(
             'driver'        => 'pdo_mysql',
             'user'            => 'localhost',
             'password'    => 'localhost',
             'host'            => 'localhost',
         	 'dbname'        => 'karnaverde_fincarudy',
             'charset'        => 'utf8',
             'driverOptions'    => array(
                'charset'    => 'utf8',
             ),
          );

        // PATH OF YOUR MODELS HERE ITS : APP/Models/Entities
        $models_namespace = 'Entities';
        $models_path = APPPATH . 'Models';
        $proxies_dir = APPPATH . 'Models/Proxies';
        $metadata_paths = array(APPPATH . 'Models/Entities');

        // DEV_MODE TRUE TO DISABLE CACHE
        $dev_mode = true;
        $cache = null;
        $useSimpleAnnotationReader = false;

        // METADATA CONFIGURATION: CHECK IN THE DOCUMENTATION IF YOU WANT TO USE XML OR YAML
        // createXMLMetadataConfiguration or createYAMLMetadataConfiguration
        $config = Setup::createAnnotationMetadataConfiguration($metadata_paths, $dev_mode, $proxies_dir, $cache, $useSimpleAnnotationReader);
        $this->em = EntityManager::create($connection_options, $config);

        //PHP
 		$phpDriver = new PhpDriver(APPPATH . 'Models/Mappings');
 		$config->setMetadataDriverImpl($phpDriver);
 		$loader = new ClassLoader($models_namespace, $models_path);
 		$loader->register();
    }
} 
```



**Nota :

Si queremos añadir otra bd: hay que crear la configuracion de la bd y crear otro entityManager:

```php
$connection_options2 = array(
             'driver'        => 'pdo_mysql',
             'user'            => 'localhost',
             'password'    => 'localhost',
             'host'            => 'localhost',
         	 'dbname'        => 'ps_fincarudy',
             'charset'        => 'utf8',
             'driverOptions'    => array(
                'charset'    => 'utf8',
             ),
          );
          
  $this->em2 = EntityManager::create($connection_options2, $config);
```



### Crear en app/Models los siguientes directorios:

```
'Entities' => Models/Entities 
'Proxies' => Models/Proxies
'Mappings' => Models/Mappings => The one you will use to create your tables
```

En la carpeta app/Models:

```
mkdir Entities
mkdir Proxies
mkdir Mappings
```

### Crear archivo Doctrine.php directamente en la carpeta app:

```php
<?php
//DEFINE ENV
define('APPPATH', dirname(__FILE__) . '/');
define('ENVIRONMENT', 'development');
chdir(APPPATH);

//CALL THE ENTITY MANAGER
require __DIR__ . '/Libraries/Doctrine.php';

//GET THE HELPERS
foreach ($GLOBALS as $helperSetCandidate) {
    if ($helperSetCandidate instanceof \Symfony\Component\Console\Helper\HelperSet) {
        $helperSet = $helperSetCandidate;
        break;
    }
}

//CALL THE ENTITY
$doctrine = new App\Libraries\Doctrine;
$em = $doctrine->em;

//MAKE THE CONNECTION
$helperSet = new \Symfony\Component\Console\Helper\HelperSet(array(
    'db' => new \Doctrine\DBAL\Tools\Console\Helper\ConnectionHelper($em->getConnection()),
    'em' => new \Doctrine\ORM\Tools\Console\Helper\EntityManagerHelper($em)
));

\Doctrine\ORM\Tools\Console\ConsoleRunner::run($helperSet); 
```

Para comprobar si se ha configurado todo bien, ejecutar en la terminal:

```bash
php Doctrine.php
```

*Nota: en algunas documentaciones este contenido esta en un archivo llamado **cli-doctrine.php**

crear un atajo: para ello crear un archivo en app llamado doctrine, e incluir el siguiente código:

```bash
#!/usr/bin/env php
<?php

include('Doctrine.php'); 
```

Y para comprobar si se ha configurado todo bien, ejecutar en la terminal:

```bash
php doctrine	
```

Deberia mostrar en la terminal algo como...

```
Doctrine Command Line Interface 2.6.4-DEV

ALL THE COMMANDS YOU CAN DO:
......
....
```



### Doctrine como un servicio

Abrir el archivo app/Config/Services.php y añadir el código:

```php
//DOCTRINE SERVICE CLASS
public static function doctrine($getShared = false)
{
	if (! $getShared)
    {
    	// INITIATE
        $doctrine = new \App\Libraries\Doctrine;
        // SHORTCUT ENTITY MANAGER
        $em = $doctrine->em;
        // RETURN ENTITY MANAGER
        return $em;
    }
    return static::getSharedInstance('doctrine');
}
```

**Nota: si se necesita utilizar otra bd con doctrine, hay que crear otro servicio

```php
//DOCTRINE SERVICE CLASS
public static function doctrine_bd2($getShared = false)
{
	if (! $getShared)
    {
    	// INITIATE
        $doctrine = new \App\Libraries\Doctrine;
        // SHORTCUT ENTITY MANAGER
        $em = $doctrine->em2;
        // RETURN ENTITY MANAGER
        return $em;
    }
    return static::getSharedInstance('doctrine');
}
```



Para probar si funciona probar en el controlador BaseController.php, hay dos maneras de cargar el servicio

```php
public function index()
{
    // CALLING THE SERVICE WAY 1
    //$em = \Config\Services::doctrine();
    // CALLING THE SERVICE WAY 2
    $em = service('doctrine');
    
    return view('welcome_message');
} 
```

**Nota: si tenemos varios servicios de doctrine, (tendremos uno por cada bd)

```php
// Llama a servicio bd1
$em = service('doctrine');

// Llama a servicion bd2
$em2 = service('doctrine_bd2');
```



Si ponemos en el navegador: http://localhost/nombre_proyecto/public/index.php/BaseController/index Debería volcar todas las variables del administrador de entidades. 

### Utilización doctrine desde la terminal:

#### Generar archivos Mappings

Para generar las entidades desde una bd existente, en lugar de crearlos a mano, ejecutar desde la consola:

```bash
php doctrine orm:convert-mapping --from-database --namespace='Entities\' php Models/Mappings/
 (si los archivos los queremos en formato php)
```

Nota **: 

- Para que genere los archivos de una bd u otra hay que modificar en el archivo doctrine el nombre de la bd

- Si modificamos la estructura de una tabla de la que ya hemos generado las estructuras, dara un error de que ya existe, para ello hay que incluir al final: --force, asi reemplaza los archivos existentes con la nueva estructura, si solo quisieramos generar una tabla habria que poner --filter="tabla"

- En nuestro caso si quisieramos pasar la bd karnaverde da error al generar las entidades de las tp, porque quita los guiones del nombre de la tabla y quedaria por ejemplo : 1921681302 y al generar da el error : [Parse error: syntax error, unexpected T_LNUMBER, expecting T_STRING (toma el nombre de la tabla como un numero y espera una cadena), para solucionarlo lo hemos hecho de la siguiente manera: 

  - ```bash
    php doctrine orm:convert-mapping --from-database --namespace='Entities\_' php Models/Mappings/ (pone delante de cada tabla un _ Ej: Entities._1921681302)
    ```

  - Podemos renombrar el nombre de los archivos para quitar la di, para que al cargar la entidad en el controlador sea solo con el numero de la tp. Para renombrar los archivos:

    ```bash
    Instalar rename
    sudo apt-get install rename
    
    rename -v 's/Entities.192168130/Entities._/' *.php
    ```

    Con esto los archivos en Models/Mappings quedarian: Ej: Entities._2


#### Generar archivos Entities

Generar las entidades, (ejecutar desde la terminal en el directorio app/)

```bash
php doctrine orm:generate-entities Models
```

Este comando nos crea un archivo archivo.php en el directorio Models/Entities/ 

Se generara un archivo *.php por cada archivo contenido en el directorio Models/Mappings/, Ej: Test.php, que contendra las funciones get y set de cada tdatos de la tabla para leer o escribir el valor en dicha propiedad del objeto.

#### Generar archivos Proxies

Generar the proxies (ejecutar desde la terminal en el directorio app/)

```bash
php doctrine orm:generate-proxies
```

Esto generará las extensiones que Doctrine utilizará de forma interna, ubicándolas en el directorio app/models/Proxies y que no deberíamos modificar. Se generará un archivo por cada tabla.

EJ: __ CG__Entities_2.php





3. Ahora puede utilizar doctrine en sus controladores para recuperar informacion, para actualizar, insertar,....

   Ejemplo para obtener todos los casos de la tabla Test

   ```php
   public function index()
   {
       $em = service('doctrine');
   
   	// EXAMPLE 1:
       $test = $em->getRepository('Entities\_2')->findAll();
       var_dump($test);
   } 
   ```

   $test es un array que contine los casos de todos los tdatos de la entidad _2 (tabla _192_168_1_30_2.



#### Configuracion en el servidor:

Al pasar la Api en el servidor, puede dar error : locale_set_defaul, para solucionarlo, modificar el archivo:  Codeigniter.php que se encuentra en la ruta /vendor/codeigniter4/framework/system l

```php
public function initialize()
{
    if( function_exists('locale_set_default' ) ) :
    	locale_set_default($this->config->defaultLocale ?? 'en');
    endif; 

    // Define environment variables
    $this->detectEnvironment();
    $this->bootstrapEnvironment();

    // Setup Exception Handling
    Services::exceptions()->initialize();

    // Run this check for manual installations
    if (! is_file(COMPOSER_PATH))
    {
        // @codeCoverageIgnoreStart
        $this->resolvePlatformExtensions();
        // @codeCoverageIgnoreEnd
    }
    date_default_timezone_set('Europe/Madrid' ?? 'UTC');


    // // Set default locale on the server
    // locale_set_default($this->config->defaultLocale ?? 'en');

    // // Set default timezone on the server
    // date_default_timezone_set($this->config->appTimezone ?? 'UTC');

    $this->initializeKint();

    if (! CI_DEBUG)
    {
        // @codeCoverageIgnoreStart
        Kint::$enabled_mode = false;
        // @codeCoverageIgnoreEnd
    }
}
```



## Utilización de doctrine

### Creacion de CONTROLADORES

Para crear un controlador, dentro de la carpeta Controllers, crear un archivo y dentro de él:

```php
<?php
namespace App\Controllers\Post;//ruta donde se encuentra el archivo en el que estamos

use CodeIgniter\Controller;
use App\Controllers\Notificacion\Notificacion;//ruta del controlador del que extendemos
//ruta de los modelos que se van a utilizar
use App\Models\Models\Post\PostMontecerrado;
use App\Models\Models\Post\PostCangas;

use App\Models\Models\Notificacion\NotificacionMontecerrado;
use App\Models\Models\Notificacion\NotificacionCangas;

class NombreArchivoControlador extends Notificacion {     
	//dentro poner el codigo de las funciones que se vayan a necesitar
}
```





### Doctrine extensions: 

Para poder utilizar instrucciones de mysql que no están por defecto incoporadas, tenemos que utilizar doctrine extensions: Ejemplo (Replace, group_concat,...)

Para descargar doctrine extensions, se puede realizar desde varios sitios (no todos tienen las mismas funciones), cada linea de composer crea una carpeta en vendor con las instrucciones de sql que necesitamos incorporar. 

```bash
composer require gedmo/doctrine-extensions
```

```bash
composer require beberlei/doctrineextensions
```

```
composer require oro/doctrine-extensions
```

Forma 1: (de esta manera con hacerlo una vez se puede utilizar donde se necesite dentro del proyecto)

Incluir archivo con el contenido de la instruccion que queremos utilizar en la ruta:

```bash
/api/vendor/doctrine/orm/lib/doctrine/ORM/Query/AST/Functions/
```

Dentro del archivo que hemos copiado, poner la ruta donde se encuentra dicho archivo:

```php
<?php

namespace Doctrine\ORM\Query\AST\Functions;
```

Incluir la declaracion de la instruccion que queremos incorporar en el archivo Parser.php que se encuentra en la ruta:

```bash
/api/vendor/doctrine/orm/lib/doctrine/ORM/Query/
```

Ejemplo si la instruccion es de tipo fecha, incoporarla dentro del array $_DATETIME_FUNCTIONS:

```php
 private static $_DATETIME_FUNCTIONS = [
        'current_date'      => Functions\CurrentDateFunction::class,
        .....
        // Aggregate functions
        'year'              => Functions\Year::class,//05032021
        'month'             => Functions\Month::class,//05032021
        'day'               => Functions\Day::class,//05032021
        'now'               => Functions\Now::class,//05032021
        'timestampdiff'     => Functions\TimestampDiff::class,//06032021
    ];
```

Ejemplo si la instruccion es de tipo numerico, incoporarla dentro del array $_NUMERIC_FUNCTIONS:

```php
private static $_NUMERIC_FUNCTIONS = [
        'length'    => Functions\LengthFunction::class,
        ......

        // Aggregate functions
        'min'       => Functions\MinFunction::class,
        'max'       => Functions\MaxFunction::class,
        'avg'       => Functions\AvgFunction::class,
        'sum'       => Functions\SumFunction::class,
        'count'     => Functions\CountFunction::class,
    ];
```

Ejemplo si la instruccion es de tipo numerico, incoporarla dentro del array $_STRING_FUNCTIONS:

```php
private static $_STRING_FUNCTIONS = [
        'concat'    => Functions\ConcatFunction::class,
        'substring' => Functions\SubstringFunction::class,
        'trim'      => Functions\TrimFunction::class,
        'lower'     => Functions\LowerFunction::class,
        'upper'     => Functions\UpperFunction::class,
        'identity'  => Functions\IdentityFunction::class,
        'replace'   => Functions\Replace::class,//TODO: 10022021
        'cast'      => Functions\Cast::class,//TODO: 22022021
        'group_concat'=> Functions\GroupConcat::class,//TODO: 07032021
    ];
```



Forma 2: (de esta manera hay que incluirlo cada vez que se vaya a utilizar una instruccion)

Dentro del controlador donde se va a realizar la consulta de mysql incorporar por ejemplo:

Si la instruccion a incoporar es de tipo fecha, ejemplo:

```php
$emConfig = $em->getConfiguration();
$emConfig->addCustomDatetimeFunction('YEAR', 'DoctrineExtensions\Query\Mysql\Year');
```

Si la instruccion a incoporar es de tipo string, ejemplo:

```php
$emConfig = $em->getConfiguration();
$emConfig->addCustomStringFunction('REPLACE', 'DoctrineExtensions\Query\Mysql\Replace');
```

Si la instruccion a incoporar es de tipo number, ejemplo:

```php
$emConfig = $em->getConfiguration();
$emConfig->addCustomNumberFunction('AVG', 'DoctrineExtensions\Query\Mysql\Avg');
```



Doctrine notificaciones

$client = new Client();

```
$client->setApiKey($this->apiKey);
$client->injectHttpClient(new \GuzzleHttp\Client());

$notification = new Notification($title, $message);
$notification->setSound('default');

$message = new Message();
$message->addRecipient(new Topic($theme));
$message->setNotification($notification);
// $message->setNotification($notification)->setData(array('Un dato' => 'Otro dato'));

$response = $client->send($message);
```

Donde $this->apiKey es una clave que vamos a declarar arriba , ejemplo

```php
private $apiKey = 'AAAAK3Babgs:APA91bFoqmNDqDexNRJCxhes6vq5StpYVYpFhvey9_FFhPeW4YVRc8kKfP0uAzqG-Vm5hpJH6h8WZRPI9B1d9avmNU46S61SI5kzAw1IYZmZyGrsA8y4kH9-3Ju0jvElyR6BwYrkNhwy';
```

