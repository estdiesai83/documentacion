Generar entidades Doctrine:



Eliminar entidades existentes:

```
rm -fr Models/Entities/*
rm -fr Models/Mappings/*
rm -fr Models/Proxies/*
```



Abrir Archivo Doctrine.php que esta en la carpeta app del proyecto

```
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
// $em = $doctrine->sistema;
// $em = $doctrine->rudy;
// $em = $doctrine->pr_montecerrado;
// $em = $doctrine->pr_somosaguas;
$em = $doctrine->somosaguas;

//MAKE THE CONNECTION
$helperSet = new \Symfony\Component\Console\Helper\HelperSet(array(
    'db' => new \Doctrine\DBAL\Tools\Console\Helper\ConnectionHelper($em->getConnection()),
    'em' => new \Doctrine\ORM\Tools\Console\Helper\EntityManagerHelper($em)
));

\Doctrine\ORM\Tools\Console\ConsoleRunner::run($helperSet);

```

En el archivo donde pone // CAL THE ENTITY se ira añadiendo cada sistema que vayamos a utilizar, para generar sus entidades, descomentar uno por uno cada linea de cada sistema, y por cada linea descomentada ejecutar el comando

```
php doctrine orm:convert-mapping --from-database --namespace='Entities\' php Models/Mappings/ --force
```



Una vez ejecutado el comando anterior por cada sistema, ejecutar:

```
php doctrine orm:generate-entities Models

php doctrine orm:generate-proxies
```

