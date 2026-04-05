[TOC]

# Doctrine Codeigniter

Es una paquete desarrollado en PHP, para implementar la capa de abstracción de persistencia en PHP, en otros palabras es un ORM; es decir un “Mapeo Relacional de Objetos”, lo que permite acceder a tablas de una base de datos, con la abstracción de la Orientación a Objetos de tal manera de trabajar con un Objeto en lugar de una tabla directamente con SQL.

## Instalacion con composer

Para instalar doctrine con composer, abrir archivo composer.json y añadir las lineas:

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

### Libreria Doctrine.php

#### Crear archivo Doctrine.php en app/Libraries:

```php
<?php
namespace App\Libraries;

//WE INCLUDING THE AUTOLOAD VENDOR
include_once dirname(__DIR__, 2) . '/vendor/autoload.php';

use Doctrine\Common\ClassLoader;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\Tools\Setup;
use Doctrine\ORM\Mapping\Driver\YamlDriver;

// TO OBTAIN THE ENTITY MANAGER 
class Doctrine
{
    public $em;

    public function __construct()
    {
    	// CONNECTION SETUP YOU NEED TO CHANGE WITH YOURS DBB
        $connection_options = array(
            'driver'        => 'pdo_mysql',
            'user'            => 'root',
            'password'    => 'password',
            'host'            => 'localhost',
            'dbname'        => 'project',
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

        //YAML
        $yamlDriver = new YamlDriver(APPPATH . 'Models/Mappings');
        $config->setMetadataDriverImpl($yamlDriver);
        $loader = new ClassLoader($models_namespace, $models_path);
        $loader->register();
    }
} 
```

Donde:

El componente `ClassLoader` carga automáticamente las clases de tu proyecto si estas siguen algunas convenciones *PHP* estándar.



Nota**: 

1. En lugar de utilizar YamlDriver se puede utilizar PHPDriver, para ello seria remplazar las líneas de código relacionadas con Yaml por PHP ().

```
use Doctrine\ORM\Mapping\Driver\PHPDriver;

 //PHP
 $phpDriver = new PhpDriver(APPPATH . 'Models/Mappings');
 $config->setMetadataDriverImpl($phpDriver);
 $loader = new ClassLoader($models_namespace, $models_path);
 $loader->register();
```



#### Crear en app/Models los siguientes directorios:

```
'Entities' => Models/Entities 
'Proxies' => Models/Proxies
'Mappings' => Models/Mappings => The one you will use to create your tables
```

- app/models/Mappings: En este directorio guardaremos todas las entidades de nuestro modelo de datos en formato YAML, XML o PHP.
- app/models/Entities: Este será el destino final de las clases generadas con nuestro ORM Doctrine. Se generan de forma automática.
- app/models/Proxies: Doctrine requiere de estas extensiones de clase para trabajar y abstraernos de nuestro modelo de datos. No debéis modificar dichos ficheros, pues se generan para trabajar con nuestras entidades de forma automática.
- app/models/Generated: Aquí podréis destinar los ficheros ya convertidos en clases php representativas de nuestras entidades mapeadas a través de nuestro fichero YAML anteriormente citado para luego enviarlo al directorio Entity que veremos más adelante con la función de no machacar las clases ya creadas anteriormente y los posibles métodos añadidos a la misma por nosotros. (En mi estructura no lo tengo, pte ver si me haria falta)

#### Crear archivo Doctrine.php directamente en la carpeta app:

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



Tambien se puede crear un atajo: para ello crear un archivo en app llamado doctrine, e incluir el siguiente código:

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



## Doctrine como un servicio

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

Para probar si funciona probar en el controlador BaseController.php, hay dos maneras de cargar el servicio

```php
public function index()
{
    // CALLING THE SERVICE WAY 1
    //$em = \Config\Services::doctrine();
    // CALLING THE SERVICE WAY 2
    $em = service('doctrine');
    var_dump($em);
    return view('welcome_message');
} 
```

Si ponemos en el navegador: http://localhost/websocket/public/index.php/BaseController/index Debería volcar todas las variables del administrador de entidades. donde *websocket* es el nombre del proyecto en el que estamos trabajando en /var/www/html/

### Utilización doctrine desde la terminal:

Para crear una tabla desde la terminal:

1. Crear un archivo en */app/Models/Mappings* cuyo nombre debe ser *Entities.nombretabla.dcm.yml* (si es formato yml) o Entities.nombretabla.php (si es formato php)

   Archivo tipo yml, para crear tabla test con tdatos (id_test y text)

   ```
   Entities\Test:
     type: entity
     table: test
     uniqueConstraints:
       id_index:
         columns:
           - id_test
     fields:
       id_test:
         type: integer
         unique: true
         id: true
         generator:
           strategy: AUTO
       text:
         type: text
   ```

   Donde Test es el nombre de la tabla que queremos crear. Ej nombre archivo: *Entities.Test.dcm.yml*

   

   Archivo tipo php, para crear una tabla test con tdatos (id_test y text)

   ```
   <?php
   
   use Doctrine\ORM\Mapping\ClassMetadataInfo;
   
   $metadata->setInheritanceType(ClassMetadataInfo::INHERITANCE_TYPE_NONE);
   $metadata->setPrimaryTable(array(
      'name' => 'test',
      'uniqueConstraints' => 
      array(
      'id_index' => 
      array(
       'columns' => 
       array(
       0 => 'id_test',
       ),
      ),
      ),
     ));
   $metadata->setChangeTrackingPolicy(ClassMetadataInfo::CHANGETRACKING_DEFERRED_IMPLICIT);
   $metadata->mapField(array(
      'fieldName' => 'idTest',
      'columnName' => 'id_test',
      'type' => 'integer',
      'nullable' => false,
      'options' => 
      array(
      'unsigned' => false,
      ),
      'id' => true,
     ));
   $metadata->mapField(array(
      'fieldName' => 'text',
      'columnName' => 'text',
      'type' => 'text',
      'nullable' => false,
      'length' => 0,
      'options' => 
      array(
      'fixed' => false,
      ),
     ));
   
   ```

   En primer lugar la palabra Entities hace relación al espacio de nombres al que pertenece la entidad, si os fijáis el fichero empieza indicando que Entities será el raíz de nuestro bundle. Tener en cuenta que el nombre del fichero (prefijo = **Entities** en este caso), la declaración de la entidad (la línea en la que se declara **Entities**\Test) y el directorio final application/models/**Entities** han de llamarse igual, si no no funcionarán los diferentes comandos de generación de nuestro cliente Doctrine. El sufijo *dcm.yml* viene ya dado por Doctrine aunque también es modificable. Viene a ser algo como **D**ata **C**ontroller **M**anager seguida de la extensión yml (formato YAML) o php dependidiendo del tipo que estemos utilizando.

   

2. Para generar los archivos anteriores desde una bd existente, en lugar de crearlos a mano, ejecutar desde la consola:

   ```
   php doctrine orm:convert-mapping --from-database yml Models/Mappings/ (si los archivos los queremos en formato yml)
   
   o
   
   php doctrine orm:convert-mapping --from-database php Models/Mappings/ (si los archivos los queremos en formato php)
   ```

   Nota**: pendiente ver donde hay que modificar la configuracion por que a ejecutar el resto de pasos para que funcione, tengo que renombrar los archivos que se me crean, poniendo delante de cada nombre la palabra Entities. 

   si el archivo es de tipo yml, ademas hay que añadir añadir en la primera línea de cada archivo el texto *Entities\\* delante del nombre de la tabla. Modificar la ruta o lo que haga falta en la configuracion para no tener que hacer estos cambios a mano, si no que se genere todo de una manera automática.

   

   Para renombrar los archivos, todos de golpe para que contengan la palabra Entities. al principio:

   Instalar rename 

   ```bash
   sudo apt-get install rename
   ```

   Renombrar ficheros:

   ```bash
   rename -v 's/^/Entities./' *.php
   ```

   

3. Generar las entidades, (ejecutar desde la terminal en el directorio app/)

   ```php
   php doctrine orm:generate-entities Models
   ```

   Este comando nos crea un archivo archivo.php en el directorio Models/Entities/ 

   Se generara un archivo *.php por cada archivo contenido en el directorio Models/Mappings/, Ej: Test.php, que contendra las funciones get y set de cada tdatos de la tabla para leer o escribir el valor en dicha propiedad del objeto.

   

4. Generar the proxies (ejecutar desde la terminal en el directorio app/)

   ```php
   php doctrine orm:generate-proxies
   ```

   Esto generará las extensiones que Doctrine utilizará de forma interna, ubicándolas en el directorio app/models/Proxies y que no deberíamos modificar. Se generará un archivo por cada tabla.

   EJ: __ CG__EntitiesTest.php

   

5. Crear las estructuras de las tablas (ejecutar desde la terminal en app/)

   ```bash
   php doctrine orm:schema-tool:drop --force (si queremos borrar las tablas)
   
   php doctrine orm:schema-tool:create
   php doctrine orm:schema-tool:update --force
   ```

   Se crea una tabla por cada archivo contenido en el directorio Models/Entities/

   Nota **: Este paso es necesario si las entidades son de tablas que no existen, si se ha importado las entidades desde una bd existente no hace falta.

   

6. Ahora puede utilizar doctrine en sus controladores para recuperar informacion, para actualizar, insertar,....

   Ejemplo para obtener todos los casos de la tabla Test

   ```php
   public function index()
   {
       $em = service('doctrine');
   
   	// EXAMPLE 1:
       $test = $em->getRepository('Entities\Test')->findAll();
       var_dump($test);
   } 
   ```
   
   $test es un array que contine los casos de todos los tdatos de la tabla Test.
   



### Instrucciones básicas desde controlador

```php
//Incluye el servicio doctrine
$em = service('doctrine');

// EXAMPLE 1:
// devuelve un objeto con todos los casos de la tabla Test
$test = $em->getRepository('Entities\Test')->findAll();

// EXAMPLE 2:
devuelve de la tabla Test el caso donde id_test es = 1 en forma de objeto
$datos = $em->getRepository('Entities\Test')->findOneBy( array( 'idTest' => 1 ));

// EXAMPLE 3:
//devuelve de la tabla Test el caso donde text es = 'texto2' en forma de objeto
$datos = $em->getRepository('Entities\Test')->findOneBy( array( 'text' => 'texto2' ));
      
// EXAMPLE 4:
//devuelve de la tabla Test el caso donde id_test es = 3 en forma de objeto
$product = $em->getRepository('Entities\Test')->find('3');

//devulve el valor del tdato 'id' correspondiente al caso donde id = 3
$id = $product->getIdTest();//solo vale para un caso

//devulve el valor del valor del dato 'text' correspondiente al caso donde id=3 en string
$texto = $product->getText();//solo vale para un caso

//escribe el valor texto33 en el objeto, pero no actualiza la tabla
$product->setText('texto33');

//si queremos que actualize la tabla 
$em->persist($product);
$em->flush();

// EXAMPLE 5:
//Crea un caso en la tabla empresa escribiendo en los tdatos (empresa y sector) con los valores Mr.Rigth, y Sector1.
$user = new \Entities\Empresa;
$user->setEmpresa('Mr.Right');
$user->setSector('Sector1');
$em->persist($user);
$em->flush();
```

​      

### DQL

**Doctrine Query Language**, es un lenguaje de consulta para nuestro modelo de objetos. Un grave error es confundir DQL con una forma de realizar SQL. DQL no es un lenguaje que empleamos para nuestro esquema relacional sino para realizar consultas a nuestras entidades, por lo que DQL no utiliza nombres de tablas, de columnas, ni funciones propias de un sistema gestor de bases de datos.

#### Tipos de consultas DQL:

DQL  puede realizar consultas tipo **SELECT, UPDATE y DELETE**, Los **INSERT** ,lo debe realizar el EntityManager a través de su método **persist**.

Las consultas **SELECT** son la manera más poderosa de recuperar partes de tu modelo de objetos. Adicionalmente podemos recuperar entidades y sus asociaciones con una única consulta SQL lo que puede aumentar el rendimiento de tu aplicación en contraste con el método utilizaddo en anteriores entradas que usaba muchas consultas al navegar por las asociaciones.

Las consultas **UPDATE y DELETE** ofrecen una manera de ejecutar cambios en muchas entidades del modelo de objetos. Es un paso necesario ya que hasta ahora habíamos visto que para realizar un cambio en  una entidad teníamos que cargarla en memoria, y no nos vamos a poner a cargar en memoria todas las entidades que debemos actualizar. Imaginar que tuvieramos que cambiar toda una tabla de una base de datos que contiene más de un millón de registros.



En Doctrine puedes crear DQL de 2 formas:

**EntityManager :: createQuery** :

```php
$query = $em->createQuery('SELECT u FROM Entities\User u WHERE u.id = ?1');
```

**QueryBuilder** :

```php
$qb->add('select', 'u')
   ->add('from', 'User u')
   ->add('where', 'u.id = ?1')
   ->add('orderBy', 'u.name ASC');
```

Ejemplo de uso más avanzado del generador de consultas:

```php
$em->createQueryBuilder()
            ->from('Project\Entities\Item', 'i')
            ->select("i, e")
            ->join("i.entity", 'e')
            ->where("i.lang = :lang AND e.album = :album")
            ->setParameter('lang', $lang)
            ->setParameter('album', $album);
```



#### Consultas SELECT

La cláusula SELECT de un consulta DQL especifica lo que aparece en su conjunto de resultados. Vamos a ver un ejemplo para seleccionar aquellos usuarios con una edad mayor a 20.

```php
<?php
$query = $em->createQuery('SELECT u FROM Entities\User u WHERE u.age > 20');
$users = $query->getResult();
```

Vamos a examinar poco a poco la consulta:

- **u** es el alias que utilizamos para referirnos a la entidad User. Poniendo este alias en la cláusula **SELECT** estamos especificando que queremos todas las instancias de la entidad User que coinciden con las condiciones.
- La cláusula **FROM** especifica el nombre de la entidad seguido de un alias para esa misma entidad.
- La expresión **u.age** se conoce como **path expression** (dejo el original en inglés). Este tipo de expresiones se construyen con el operador . y en este ejemplo se refiere a la propiedad **age** de la clase User.

El resultado de este consulta es una lista de objetos User donde todos los usuarios son mayores de 20 años.

**Importante:** La cláusula SELECT especifica las variables que se van a recuperar en el proceso de hydrating, si solo especificamos un alias recuperará la entidad entera, pero si solo nos interesa recuperar un conjunto de propiedades podemos utilizar la sintaxis u.name. DQL es un lenguaje muy poderoso, seguramente te quedes alucinado con la gran cantidad de funcionalidad que tiene, y todo sin acoplarte a tu esquema en la base de datos. Impresionante.

#### Joins:

Una consulta SELECT puede contener joins. Hay dos tipos de JOINS, Regular Joins y Fetch Joins:

- **Regular Joins**: Los utilizamos para limitar los resultados y realizar cálculos de valores agregados.
- **Fecth Joins**: Los utilizamos para recuperar también las entidades relacionadas e incluirlas en el proceso de hydrating de tal forma que después al acceder a sus entidades relacionadas no se tengan que recuperar de la base de datos.

Ejemplo de un regular join:

```php
<?php
$query = $em->createQuery("SELECT u FROM User u JOIN u.address a WHERE a.city = 'Berlin'");
$users = $query->getResult();
```

Hemos cruzado la entidad User con la entidad Address para recuperar solamente los usuarios cuya dirección sea de Berlín. Como vemos, hemos utilizado la sintaxis u.address porque estamos accediendo a la entidad address relacionada con el usuario. En este ejemplo, la entidad User tiene una propiedad address que se habrá anotado con una anotación de algún tipo de asociación.

Ejemplo de un fecth join:

```php
<?php
$query = $em->createQuery("SELECT u, a FROM User u JOIN u.address a WHERE a.city = 'Berlin'");
$users = $query->getResult();
```

En este ejemplo realizamos lo mismo que en el ejemplo anterior, pero además recuperamos la entidad address asociada a los usuarios que coincidan con el criterio que hemos utilizado. De esta forma incluimos las entidades relacionadas en el proceso de hydrating y Doctrine no tendrá que consultarlo en la base de datos si accedemos a ellas.

#### Ejemplos de instrucciones DQL:

```php
<?php
//Recuperar todos los usuarios
$query = $em->createQuery('SELECT u FROM Entities\User u');
$users = $query->getResult(); // array de objetos User

//Recuperar todos los ids de los usuarios CmsUser:
$query = $em->createQuery('SELECT u.id FROM CmsUser u');
$ids = $query->getResult(); // array de ids

//Recuperar todos los ids de los usuarios que han escrito un articulo. Se puede utilizar DISTINCT.
$query = $em->createQuery('SELECT DISTINCT u.id FROM CmsArticle a JOIN a.user u');
$ids = $query->getResult(); // array de ids

//Recuperar todos los articulos ordenados por el nombre de los usuarios que los han escrito. 
//Se puede utilizar ORDER BY.
$query = $em->createQuery('SELECT a FROM CmsArticle a JOIN a.user u ORDER BY u.name ASC');
$articles = $query->getResult(); // array de objetos CmsArticle

//Recuperar el nombre y apellidos de un CmsUser:
$query = $em->createQuery('SELECT u.username, u.name FROM CmsUser u');
$users = $query->getResults(); // array de nombres y apellidos
echo $users[0]['username']; //acceder al apellido
echo $users[0]['name']; //acceder al nombre

//Recuperar un ForumUser y su entidad Avatar relacionada:
$query = $em->createQuery('SELECT u, a FROM ForumUser u JOIN u.avatar a');
$users = $query->getResult(); // array de objetos ForumUser con la entidad asociada cargada
echo get_class($users[0]->getAvatar());

//Recuperar un CmsUser y todos los números de teléfono que tiene:
$query = $em->createQuery('SELECT u, p FROM CmsUser u JOIN u.phonenumbers p');
$users = $query->getResult(); // array de objetos CmsUser con los teléfonos asociados cargados
$phonenumbers = $users[0]->getPhonenumbers();

//Recuperar usuarios ForumUser ordenados ascendentemente por id:
$query = $em->createQuery('SELECT u FROM ForumUser u ORDER BY u.id ASC');
$users = $query->getResult(); // array de objetos ForumUser

//O ordenados descendentemente por id:
$query = $em->createQuery('SELECT u FROM ForumUser u ORDER BY u.id DESC');
$users = $query->getResult(); // array de objetos ForumUser

//Usando funciones de agregación:
$query = $em->createQuery('SELECT COUNT(u.id) FROM Entities\User u');
$count = $query->getSingleScalarResult();

//Con cláusula WHERE y parámetros posicionales:
$query = $em->createQuery('SELECT u FROM ForumUser u WHERE u.id = ?1');
$query->setParameter(1, 321);
$users = $query->getResult(); // array de objetos ForumUser

//Con cláusula WHERE y parámetros por nombre
$query = $em->createQuery('SELECT u FROM ForumUser u WHERE u.username = :name');
$query->setParameter(':name', 'Bob');
$users = $query->getResult(); // array de objetos ForumUser

//Con condiciones anidadas en  la cláusula WHERE
$query = $em->createQuery('SELECT u from ForumUser u WHERE (u.username = :name OR u.username = :name2) AND u.id = :id');
$query->setParameters(array(
    ':name' => 'Bob',
    ':name2' => 'Alice',
    ':id' => 321,
));
$users = $query->getResult(); // array de objetos ForumUser

//Con COUNT DISTINCT:
$query = $em->createQuery('SELECT COUNT(DISTINCT u.name) FROM CmsUser');
$users = $query->getResult(); // array de objetos ForumUser

//Con expresiones aritméticas en la cláusula WHERE:
$query = $em->createQuery('SELECT u FROM CmsUser u WHERE ((u.id + 5000) * u.id + 3) < 10000000');
$users = $query->getResult(); // array de objetos ForumUser

//Usando un LEFT JOIN para recuperar todos los ids de los usuarios y
// opcionalmente todos los ids de los artículos asociados.
$query = $em->createQuery('SELECT u.id, a.id as article_id FROM CmsUser u LEFT JOIN u.articles a');
$results = $query->getResult(); // array de ids de usuario y por cada usuario los ids de sus articulos

//Restringiendo la cláusula JOIN con condiciones adicionales
$query = $em->createQuery("SELECT u FROM CmsUser u LEFT JOIN u.articles a WITH a.topic LIKE '%foo%'");
$users = $query->getResult();

//Usando múltiples Fetch JOINs:
$query = $em->createQuery('SELECT u, a, p, c FROM CmsUser u JOIN u.articles a JOIN u.phonenumbers p JOIN a.comments c');
$users = $query->getResult();

//BETWEEN en la cláusula WHERE:
$query = $em->createQuery('SELECT u.name FROM CmsUser u WHERE u.id BETWEEN ?1 AND ?2');
$query->setParameter(1, 123);
$query->setParameter(2, 321);
$usernames = $query->getResult();

//Funciones DQL en la cláusula WHERE:
$query = $em->createQuery("SELECT u.name FROM CmsUser u WHERE TRIM(u.name) = 'someone'");
$usernames = $query->getResult();

//Usando IN()
$query = $em->createQuery('SELECT u.name FROM CmsUser u WHERE u.id IN(46)');
$usernames = $query->getResult();

$query = $em->createQuery('SELECT u FROM CmsUser u WHERE u.id IN (1, 2)');
$users = $query->getResult();

$query = $em->createQuery('SELECT u FROM CmsUser u WHERE u.id NOT IN (1)');
$users = $query->getResult();

//Usando la función DQL CONCAT():
$query = $em->createQuery("SELECT u.id FROM CmsUser u WHERE CONCAT(u.name, 's') = ?1");
$query->setParameter(1, 'Jess');
$ids = $query->getResult();

$query = $em->createQuery('SELECT CONCAT(u.id, u.name) FROM CmsUser u WHERE u.id = ?1');
$query->setParameter(1, 321);
$idUsernames = $query->getResult();

//EXISTS en cláusula WHERE con subconsultas
$query = $em->createQuery('SELECT u.id FROM CmsUser u WHERE EXISTS (SELECT p.phonenumber FROM CmsPhonenumber p WHERE p.user = u.id)');
$ids = $query->getResult();

//Seleccionar todos los  usuarios que son miembros de un grupo
$query = $em->createQuery('SELECT u.id FROM CmsUser u WHERE :groupId MEMBER OF u.groups');
$query->setParameter(':groupId', $group);
$ids = $query->getResult();

//Seleccionar todos los usuarios que tienen al menos un teléfono:
$query = $em->createQuery('SELECT u FROM CmsUser u WHERE SIZE(u.phonenumbers) > 1');
$users = $query->getResult();

//Seleccionar todos los usuarios que no tienen teléfono
$query = $em->createQuery('SELECT u FROM CmsUser u WHERE u.phonenumbers IS EMPTY');
$users = $query->getResult();
```

**INSERT**

```php
$em = service('doctrine');

// crea un caso en la tabla Empresa escribiendo en los tdatos (empresa y sector) 
$user = new \Entities\Empresa;
$user->setEmpresa('Mr.Right');
$user->setSector('Sector1');
$em->persist($user);
$em->flush();
```



#### Construyendo un nuevo objeto QueryBuilder

QueryBuilder proporciona una API que está diseñada para construir condicionalmente una consulta DQL en varios pasos.

```php
$em = service('doctrine');

$test = $em->getRepository('Entities\Test', 'u');     

//EXAMPLE 1: //Devuelve los valores en un array
$qb = $test->createQueryBuilder('u')
	->select('u')
    //->from('Test', 'u')//esto no hace falta ya esta incluida el nombre de la tabla
    ->orderBy('u.idTest', 'ASC')
    ->getQuery()->getArrayResult();

//EXAMPLE 2: //Devuelve los valores en un objeto donde idTest = 3
$qb = $test->createQueryBuilder('u')
	->select('u')  
    ->where('u.idTest = 3')
    ->orderBy('u.idTest', 'ASC')
    ->getQuery()->getResult();    

//EXAMPLE 3: //Ejecuta una instruccion sql
$query = $em->createQuery('SELECT DISTINCT  a.idalumnos as codigoalumno,  
	a.nombre,  a.apellido1, a.apellido2  FROM Entities\Alumnos a  
    where a.codigocurso=1 and a.estado=0');
$users = $query->getResult();


With WHERE Clause and Named Parameter:


<?php
$query = $em->createQuery('SELECT u FROM ForumUser u WHERE u.username = :name');
$query->setParameter('name', 'Bob');
$users = $query->getResult(); // array of ForumUser objects
With Nested Conditions in WHERE Clause:


<?php
$query = $em->createQuery('SELECT u FROM ForumUser u WHERE (u.username = :name OR u.username = :name2) AND u.id = :id');
$query->setParameters(array(
    'name' => 'Bob',
    'name2' => 'Alice',
    'id' => 321,
));
$users = $query->getResult(); // array of ForumUser objects
```

​     

Cuando en la sentencia, se necesita utilizar una cadena , ya sea en el where de un select o update o en el set de un update, se debe hacer de la siguiente manera:

```
$query = $em->createQuery('SELECT u FROM ForumUser u WHERE u.username = :name');
$query->setParameter('name', 'Bob');
$users = $query->getResult(); //

o

$query = $em->createQuery('SELECT u FROM ForumUser u WHERE u.username = ?1');
$query->setParameter(1, 'Bob');
$users = $query->getResult(); //

si se necesitan mas condiciones, cada condicion seria un numero, Ej:
$query = $em->createQuery('SELECT u.name FROM CmsUser u WHERE u.id BETWEEN ?1 AND ?2');
$query->setParameter(1, 123);
$query->setParameter(2, 321);
$usernames = $query->getResult();
```



Documentacion sacada entre otras páginas: 

https://forum.codeigniter.com/thread-74863-page-2.html, 

https://www.doctrine-project.org/projects/doctrine-orm/en/2.6/tutorials/getting-started.html#queries-for-application-use-cases

https://www.doctrine-project.org/projects/doctrine-orm/en/2.7/reference/tools.html

https://parasitovirtual.wordpress.com/2011/03/23/introduccion-dql-doctrine-query-language/

