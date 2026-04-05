[TOC]

# Express

Express es una infraestructura de aplicaciones web Node.js mínima y flexible que proporciona un conjunto sólido de características para las aplicaciones web y móviles.



Para utilizar Express hay que tener instalado node.js

## Instalar Node.js

Node.js es una de las tecnologías web más populares en la actualidad y es utilizado por muchos desarrolladores para aumentar la funcionalidad de una aplicación web. 

Node.js es un entorno de ejecución del lado del servidor que permite que [JavaScript](https://www.hostinger.es/tutoriales/que-es-javascript-introduccion-basica/) se ejecute sin el cliente. Node.js es de código abierto y multiplataforma.

```bash
sudo apt-get update
sudo apt install nodejs
```

Por último, comprueba la versión instalada. Para hacerlo, ejecuta el siguiente comando:

```bash
nodejs -v
```

También puedes instalar NPM, que es el administrador de paquetes de node.js.

```bash
sudo apt install npm
```

Para actualizar npm

```bash
npm install -g npm
```

Para eliminar Node.js, ejecuta este comando:

```bash
sudo apt remove nodejs
```



## Instalar una versión específica de Node.js usando NVM

Hay otra forma de instalar Node.js en un servidor con Ubuntu 18.04. Usando un NVM (Node Version Manager), podemos elegir una versión específica para instalar. Esto viene genial si quieres utilizar una versión LTS o solo la última versión disponible.

Primero, descarga NVM usando wget. Si no estás seguro de tener [wget](https://www.hostinger.es/tutoriales/usar-comando-wget/), ejecuta este comando.

```bash
sudo apt install wget
```

Ahora, ejecuta este comando:

```bash
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
```

El siguiente paso es permitir que NVM se use desde el perfil de bash de tu usuario ejecutando este comando:

```bash
source ~/.profile
```

Ahora, puedes usar NVM para mostrar todas las versiones de Node.js disponibles para instalar.

```bash
nvm ls-remote
```

Elige libremente el que quieras. Para mayor estabilidad y soporte recomendamos la versión 10.15.1. Para hacerlo, ejecuta este comando:

```bash
nvm install 10.15.1
```

Puedes revisar si la instalación fue exitosa verificando la versión de Node.js. Para ello ejecuta:

```bash
node -v
```

![Comprobando la versión instalada de Node.js](https://www.hostinger.es/tutoriales/wp-content/uploads/sites/7/2019/07/revisando-la-versio%CC%81n-de-node-js.jpg)

Como puedes ver, todo salió bien. Node.js está correctamente instalado y listo para usar. 

**La version con la que estoy trabajando es v10.23.1

Si quieres desinstalar Node.js y lo habías instalado con este método, desactívalo primero.

```
nvm deactivate
```

Luego, puedes proceder a desinstalar Node.js.

```bash
nvm uninstall v10.15.1
```

## Instalación Express:

Suponiendo que ya ha instalado [Node.js](https://nodejs.org/), cree un directorio para que contenga la aplicación y conviértalo en el directorio de trabajo.

```bash
$mkdir myapp
$cd myapp
```

Utilice el mandato `npm init` para crear un archivo `package.json` para la aplicación. Para obtener más información sobre cómo funciona `package.json`

```bash
$npm init
```

Este mandato solicita varios elementos como, por ejemplo, el nombre y la versión de la aplicación. Por ahora, sólo tiene que pulsar INTRO para aceptar los valores predeterminados para la mayoría de ellos, con la siguiente excepción:

```
entry point: (index.js)
```

Especifique `app.js` o el nombre que desee para el archivo principal. Si desea que sea `index.js`, pulse INTRO para aceptar el nombre de archivo predeterminado recomendado.

A continuación, instale Express en el directorio `myapp` y guárdelo en la lista de dependencias. Por ejemplo:

```bash
$npm install express --save
$sudo npm install -g npm  

```

Para instalar Express temporalmente y no añadirlo a la lista de dependencias, omita la opción `--save`:

```sh
$ npm install express
```

Los módulos de Node que se instalan con la opción `--save` se añaden a la lista `dependencies` en el archivo `package.json`. Posteriormente, si ejecuta `npm install` en el directorio `app`, los módulos se instalarán automáticamente en la lista de dependencias.

** Crea en el directorio la carpeta node_modules y archivo package.json.lock



Ejemplo de prueba:

En primer lugar, cree un directorio denominado `myapp`, cámbielo y ejecute `npm init`. A continuación, instale `express` como una dependencia, según se describe en la [guía de instalación](https://expressjs.com/es/starter/installing.html).

En el directorio `myapp`, cree un archivo denominado `app.js` y añada el código siguiente:

```javascript
const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => {
  res.send('Hello World!')
})

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})
```

La aplicación inicia un servidor y escucha las conexiones en el puerto 3000. La aplicación responde con “Hello World!” para las solicitudes al URL raíz (`/`) o a la *ruta* raíz. Para cada vía de acceso diferente, responderá con un error **404 Not Found**.

Ejecute la aplicación con el siguiente mandato:

```sh
$ node app.js
```

A continuación, cargue http://localhost:3000/ en un navegador para ver la salida.



## Generador de aplicaciones Express

Utilice la herramienta de generador de aplicaciones, `express`, para crear rápidamente un esqueleto de aplicación.

Instale `express` con el siguiente mandato:

```sh
$ npm install express-generator -g
```

** si diese error al instalarlo se puede añadir --force para que lo instale.

Muestre las opciones de mandato con la opción `-h`:

Desde la carpeta myapp ejecutar

```sh
$express --no-view
```

Nos creara las estructuras necesarias (directorios: public, bin, routes) sin vistas (no crea carpeta views).

Para ejecutar la aplicacion, 

Opcion 1: desde la carpeta myapp

```bash
npm start
```

A continuación, cargue `http://localhost:3000/` en el navegador para acceder a la aplicación.

Mostrará en el navegador, el mensaje welcome to espress

Opcion 2: desde /bin

```bash
./nombre_archivo
```

Desde el navegador :

```
http://localhost:puerto/ruta/nombre_funcion
```



## Direccionamiento

El *direccionamiento* hace referencia a la determinación de cómo responde una aplicación a una solicitud de cliente en un determinado punto final, que es un URI (o una vía de acceso) y un método de solicitud HTTP específico (GET, POST, etc.).

Cada ruta puede tener una o varias funciones de manejador, que se excluyen cuando se correlaciona la ruta.

La definición de ruta tiene la siguiente estructura:

```javascript
app.METHOD(PATH, HANDLER)
```

Donde:

- `app` es una instancia de `express`.
- `METHOD` es un [método de solicitud HTTP](http://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol).
- `PATH` es una vía de acceso en el servidor.
- `HANDLER` es la función que se ejecuta cuando se correlaciona la ruta.



El siguiente ejemplo ilustra la definición de rutas simples.

Responda con `Hello World!` en la página inicial:

```javascript
app.get('/', function (req, res) {
  res.send('Hello World!');
});
```

Responda a la solicitud POST en la ruta raíz (`/`), la página de inicio de la aplicación:

```javascript
app.post('/', function (req, res) {
  res.send('Got a POST request');
});
```

Responda a una solicitud PUT en la ruta `/user`:

```javascript
app.put('/user', function (req, res) {
  res.send('Got a PUT request at /user');
});
```

Responda a una solicitud DELETE en la ruta `/user`:

```javascript
app.delete('/user', function (req, res) {
  res.send('Got a DELETE request at /user');
});
```



### Organizacion del proyecto

Para organizar el proyecto hacerlo segun la imagen:

![](/home/esther/git/esther/Documentos/Express/soajs.png)

https://www.coreycleary.me/project-structure-for-an-express-rest-api-when-there-is-no-standard-way

Cuando mencioné "tipos de lógica", me refería a las dos categorías "principales" en las que cae la lógica de la API REST: lógica HTTP y lógica empresarial. Por supuesto, puede dividir los "tipos de lógica" tanto como desee, pero estas dos son las categorías principales.

| Capas principales          | Tipo                       | ¿Qué lógica va aquí?                                         |
| -------------------------- | -------------------------- | ------------------------------------------------------------ |
| Capa lógica HTTP           | Rutas + Controladores      | Rutas: maneja las solicitudes HTTP que llegan a la API y  enruta a los controladores apropiados. Controladores : toma el objeto de la solicitud, extrae los datos de la solicitud, valida y luego envía a los servicios. |
| Capa de lógica empresarial | Servicios + Acceso a datos | Contiene la lógica empresarial, derivada de los requisitos comerciales y técnicos, así como la forma en que accedemos a nuestros almacenes de datos ** |

** La lógica de la capa de acceso a datos es a menudo la lógica empresarial más "técnica", y la he agrupado con la lógica empresarial, ya que los requisitos a menudo impulsan las consultas que deberá escribir y los informes que deberá generar.



## Rutas

```javascript
const express = require('express')

const { blogpost } = require('../controllers')

const router = express.Router()

router.post('/blogpost', blogpost.postBlogpost)

module.exports = router
```

Como puede ver en el código anterior, no debería entrar ninguna lógica en su `routes/routers`. Solo deben encadenar sus `controller`funciones (en este caso, solo tenemos una). Entonces `routes`son bastante simples. Importe su (s) controlador (es) y encadene las funciones.

Por lo *general,* solo tengo un controlador por ruta, pero hay excepciones, por supuesto. Si tiene un controlador que maneja la autenticación y tiene rutas que necesitan autenticación, obviamente también necesitará importarlo y conectarlo a su ruta.

A menos que tenga muchos `routes`, normalmente los pongo todos en un solo `index.js`archivo. Si *hacer* una tonelada de rutas, puede poner en archivos individuales de una ruta, importarlos todos en un solo `index.js`archivo y exportación de eso.

Si desea comprender cómo evitar anteponer manualmente '/ api' a cada ruta individual, [consulte esta otra publicación que escribí sobre eso](https://www.coreycleary.me/avoid-manually-prepending-api-to-every-express-route-with-this-simple-method) .



## Controladores

```javascript
const { blogService } = require('../services')

const { createBlogpost } = blogService

/*
 * call other imported services, or same service but different functions here if you need to
*/
const postBlogpost = async (req, res, next) => {
  const {user, content} = req.body
  try {
    await createBlogpost(user, content)
    // other service call (or same service, different function can go here)
    // i.e. - await generateBlogpostPreview()
    res.sendStatus(201)
    next()
  } catch(e) {
    console.log(e.message)
    res.sendStatus(500) && next(error)
  }
}

module.exports = {
  postBlogpost
}
```

Pienso en `controllers`como "orquestadores". Lo llaman `services`, que contienen una lógica empresarial más "pura". Pero por sí mismos, `controllers`realmente no contienen ninguna lógica más que manejar la solicitud y la llamada `services`. Ellos `services`hacen la mayor parte del trabajo, mientras que ellos `controllers`organizan las llamadas de servicio y deciden qué hacer con los datos devueltos.

Y si aún no es obvio, toman la solicitud HTTP reenviada desde la ruta y devuelven una respuesta o mantienen la cadena de llamadas. También manejan los códigos de estado HTTP como parte de esta respuesta.

## Por qué el contexto Express / HTTP debería terminar aquí

Algo que veo con bastante frecuencia es el `req`objeto Express (que es nuestro "contexto" HTTP) que pasa más allá del `routes`y `controllers`al `services`o incluso `database access layer`. Pero el problema con eso es que, ahora el resto de la aplicación depende no solo del objeto de solicitud, sino también de Express. Si tuviera que cambiar los marcos, sería más trabajo encontrar todas las instancias del `req`objeto y eliminarlas.

También dificulta las pruebas y esto no logra una separación de las preocupaciones por las que nos esforzamos al diseñar nuestras aplicaciones.

En cambio, si usa la desestructuración para extraer los datos que necesita `req`, simplemente puede pasarlos a los servicios. La *lógica* Express "termina" allí mismo en los controladores.

Sin embargo, si necesita hacer una llamada a una API externa desde uno de sus servicios, está bien, y lo discutiremos más cuando cubramos qué lógica entra `services`. Pero, por ahora, sepa que esas llamadas están fuera del contexto HTTP de *su* aplicación.

Y con eso, sabemos dónde poner nuestra lógica "inicial" que manejará la API REST (rutas + controladores). Pasando a la capa de lógica empresarial ...



## Servicios

```javascript
const { blogpostDb } = require('../db')

/*
  * if you need to make calls to additional tables, data stores (Redis, for example), 
  * or call an external endpoint as part of creating the blogpost, add them to this service
*/
const createBlogpost = async (user, content) => {
  try {
    return await blogpostDb(user, content)
  } catch(e) {
    throw new Error(e.message)
  }
}

module.exports = {
  createBlogpost
}
```

`Services`debe contener la mayor parte de la lógica de su negocio: - lógica que encapsula los requisitos de su negocio, llama a su capa o modelos de acceso a datos, llama a API externas a la aplicación Node. Y, en general, contiene la mayor parte de su código algorítmico.

Ciertamente, también puede llamar a API externas desde su interior `controllers`, pero piense si esa API está devolviendo algo que debería ser parte de una "unidad". `Services`En última instancia, debería devolver un recurso cohesivo, por lo que, si lo que devuelve esa llamada de API externa es necesario para aumentar su lógica empresarial, mantenga la lógica allí.

Por ejemplo, si parte de la creación de la publicación de blog también fuera publicar el enlace a Twitter (una llamada de API externa), lo pondría en el servicio anterior.

*¿Por qué no llamar a la capa de modelos / datos directamente desde el `controllers`si eso es todo lo que hace este servicio?*

Mientras que el ejemplo anterior es simple, ya que lo único que hace es acceso a la base de datos a través de nuestra función de capa de acceso de datos - `blogpostDb`- como se agregan más requisitos de negocio, se agrega esa llamada API de Twitter, que cambian los requisitos, etc. obtendrá compleja **rápido** .

Si su controlador maneja toda esa lógica, más la lógica de manejo de solicitudes de la que ya se ocupa, comenzaría a ser realmente difícil de probar, realmente rápido. Y recuerde, los controladores pueden realizar varias llamadas de servicio diferentes. Entonces, si sacara toda esa lógica de otros servicios y la pusiera en el mismo controlador, se volvería aún más inmanejable. [Terminarías con la temida pesadilla del 'controlador gordo'.](https://www.coreycleary.me/why-should-you-separate-controllers-from-services-in-node-rest-apis)

## Capa / modelos de acceso a datos

```javascript
const blogpostDb = (user, content) => {
  /*
   * put code to call database here
   * this can be either an ORM model or code to call the database through a driver or querybuilder
   * i.e.-
    INSERT INTO blogposts (user_name, blogpost_body)
    VALUES (user, content);
  */
  return 1 //just a dummy return as we aren't calling db right now
}

module.exports = {
  blogpostDb
}
```

En el código anterior, en lugar de configurar una conexión de base de datos completa, simplemente lo pseudocodifiqué, pero agregarlo es bastante fácil. Cuando tiene su lógica aislada de esta manera, es fácil mantenerla limitada al código de acceso a los datos.

Si no es obvio, "Capa de acceso a datos" significa la capa que contiene su lógica para acceder a datos persistentes. Esto puede ser algo así como una base de datos, un servidor Redis, Elasticsearch, etc. Así que siempre que necesite acceder a esos datos, ponga esa lógica aquí.

"Modelos" es el mismo concepto pero se utiliza como parte de un ORM.

Aunque ambos son diferentes, contienen el mismo tipo de lógica, por lo que recomiendo poner cualquiera de los dos en una `db`carpeta para que sea lo suficientemente general. Ya sea que esté usando modelos de un ORM o esté usando un generador de consultas o SQL sin formato, puede poner la lógica allí sin cambiar el nombre del directorio.

## Utils

El último tipo de lógica que cubriremos es el de las funciones lógicas comunes que no son necesariamente específicas de su lógica o dominio empresarial, o incluso de una API REST en general. Un buen ejemplo de una **función de utilidad** sería una función que convierte milisegundos en minutos y / o segundos, o una que verifica dos matrices para ver si contienen elementos similares. Estos son lo suficientemente generales, y lo suficientemente *reutilizables* , que merecen ir en su propia carpeta.

Mi método preferido es simplemente poner todo esto en un `index.js`archivo y exportar cada función. Y lo dejo así, ya que realmente no influyen en el resto de la estructura del proyecto.

## app.js / server.js

```javascript
const express = require('express')
const bodyParser = require('body-parser')
const app = express()
const routes = require('./routes')

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.get('/', (req, res) => res.send('App is working'))

app.use('/api', routes)

app.listen(3000, () => console.log('Example app listening on port 3000!'))

module.exports = {
  app
}
```

Y solo para unirlo todo, incluí un punto de entrada de ejemplo (generalmente llamado `app.js`o `server.js`) que va en la raíz de la estructura de su proyecto. Puede agregar middleware aquí (como `bodyParser`) e importar su archivo de rutas.



## Utilización (codigo fuente)

### Declarar Variables y Clases Globales

Declarar arriba del archivo la **variable** que queremos declarar, por protocolo el nombre de la variable será: g_nombrevariable

```javascript
global.g_nombrevariable = undefined;

Ej: global.g_atardecer = undefined;
```

Ahora ya se puede utilizar la variable desde cualquier archivo, llamandola directamente.



Declarar arriba del archivo la **clase** que queremos declarar, por protocolo el nombre de la variable será: g_nombrevariable

```javascript
var nombreServicio = require('./services/archivo_servicio');
global.g_nombrevariable = new nombreServicio();

Ej: 
var scheduleService = require('./services/schedule/schedule');
global.g_scheduleS = new scheduleService();
```

En el ejemplo anterior declaramos la clase schedule como global para poder acceder a sus funciones desde cualquier archivo, para llamar a dichas funciones

```javascript
g_scheduleS.nombre_funcion();
```



### Mostrar informacion a la hora de ejecutar el proyecto

Si queremos identificar cuando hacemos un console.log el nombre del archivo donde se encuentra el mensaje

Declarar al principio del archivo

```javascript
const _module = 'nombre_archivo';

Ej: 
const _module = 'sun';
```

Cada vez que se haga un console.log, esribir

```javascript
console.log('%s: mensaje', _module);

Ej:console.log('%s: crearTarea', _module, aux2[0]);
```



### Ejecutar una función cada cierto tiempo

##### cron

Para poder llamar a una funcion, con un periodo determinado

```bash
npm install cron
```

Ej:

```javascript
var CronJob = require('cron').CronJob;
var job = new CronJob('* * * * * *', function() {
  console.log('You will see this message every second');
}, null, true, 'America/Los_Angeles');
job.start();
```

```
  * * * * * *
  | | | | | |
  | | | | | day of week
  | | | | month
  | | | day of month
  | | hour
  | minute
  second ( optional )
```

Documentacion sacada entre otras páginas:

https://expressjs.com/es



##### schedule 

Para poder utilizar esta libreria:

```bash
npm install node-schedule
```

Si la tarea es puntual, hay que crear una fecha con el formato: año,mes,dia,hora,minuto,segundo ej:

```js
const date = new Date(2012, 11, 21, 5, 30, 0);
const job = schedule.scheduleJob(date, () => {
    console.log('TareaPuntual');
    this.ejecutarTarea(tarea, argumentos);         
});
```

Si la tarea es periodica, tiene que utilizar un perido con el formato:

```js
// periodo tiene que traer formato 
// *    *    *    *    *    *
// ┬    ┬    ┬    ┬    ┬    ┬
// │    │    │    │    │    │
// │    │    │    │    │    └ day of week (0 - 7) (0 or 7 is Sun)
// │    │    │    │    └───── month (1 - 12)
// │    │    │    └────────── day of month (1 - 31)
// │    │    └─────────────── hour (0 - 23)
// │    └──────────────────── minute (0 - 59)
// └───────────────────────── second (0 - 59, OPTIONAL)
// Ejemplo: const job = schedule.scheduleJob('0 17 ? * 0,4-6', function(){
const job = schedule.scheduleJob(periodo, () => {
    console.log('TareaPeriodica');
    this.ejecutarTarea(tarea, argumentos);
});
```

A tener en cuenta:

```js
const job = schedule.scheduleJob(date, () => {
	console.log('TareaPuntual');
    this.ejecutarTarea(tarea, argumentos);         
});
```

si en lugar de hacerlo como arriba lo hacemos, cambiando ()=> por function, la llamada a ejecutarTarea no la realiza, da error de que no existe la función, esto es debido a que con function no se da cuenta de las variables y funciones que están declaradas fuera de las llaves.

```js
const job = schedule.scheduleJob(date, function(){
	console.log('TareaPuntual');
    this.ejecutarTarea(tarea, argumentos);         
});
```

### Funcionalidad obtenerDatos especificos de una tarea en concreto, para añadirlos en el array de lectura al iniciar

Para obtener la estructuras de datos especificos para una tarea en concreto y escribirlos en la propiedad datos del array de inicio, sin tener que modificar la funcion init, por cada tarea nueva que se vaya a crear, tenemos que:

1. 1. Crear archivo schedule.json, para declarar los valores necesarios por cada tipo tarea nueva

      ```json
      [
      	tarea: 2
      	subtarea: 0
      	clase: service/schedule/f_estor.js
      	metodo: obtenerDatos()
      ]
      ```

   2. Modificar ruta service/schedule y meter dentro schedule.js y f_estor.js

   3. Modificar en el init de schedule.json que filtre por tarea y subtarea, hacer un require de la clase new() y llamar a obtenerDatos enviandole 

   4. Crear en un archivo por cada tipo tarea, ej: f_estor.js una función obtenerDatos() que es donde se van a 	partir las variables y a formar la estructura de los datos que necesita el anadirArray en la propiedad datos de dicho array.

### RPC

Se utiliza para poder realizar llamadas a funciones del SOA, el soa es el servidor de XMLRPC por el puerto 'x', en nodejs no hace falta hacer lo del curl, esta libreria hace todo.

Instalar la libreria xmlrpc

```bash
npm install xmlrpc
```

Crear un archivo rpc.json en config, donde estarán los valores necesarios que necesita la libreria para funcionar

```json
{
   "ip": "127.0.0.1",
   "puerto": "457"
}
```



En el código declarar:

```javascript
var xmlrpc = require('xmlrpc');

// lee los valores de configuracion de rpc
var ut = require('./../utils/utils');
const rpc = ut.readConfig('rpc.json');
```

Para realizar la llamada de la función del soa

```javascript
realizarLlamada(ejecuciones){    
      var dia1 = new Date();//solo para hacer pruebas
      let arg = Object.values(ejecuciones);
         
      var arg2 = arg.splice(-arg.length+1); 
         
      this.client = xmlrpc.createClient({ host: rpc['ip'], port: rpc['puerto'], path: '/RPC2'})
      this.client.methodCall(ejecuciones.fk, arg2, function (error, value) {
         console.log('%s: Method response for \'',_module, ejecuciones.fk,'\': ' , value,' fecha ',dia1,' argumentos ',arg2)
      })     
   }
```

Nota: ejecuciones es un objeto donde llega la funcion a llamar y los argumentos que necesita dicha funcion.



### Leer un archivo de configuración nombre_archivo.json

Crearemos un archivo de configuracion nombre_archivo.json donde se meteran los parametros de configuracion generales que vayamos a necesitar. Ejemplo: database.json

```json
{
   "host": "127.0.0.1", 
   "user":"localhost", 
   "password": "localhost",
   "connectionLimit": "5"
}
```



```js
// leemos los valores de configuracion de database.json
'use strict';

const fs = require('fs');

let rawdata = fs.readFileSync('../config/database.json');
let database = JSON.parse(rawdata);

pool = mariadb.createPool({
   host: database['host'], 
   user:database['user'], 
   password: database['password'],
   connectionLimit: database['connectionLimit']
});
```



### AXIOS

Axios es un cliente HTTP basado en promesas que funciona tanto en el cliente (navegador) como en el servidor (por ejemplo, Node.js). Se utiliza para llamar a urls

Instalacion

```bash
npm install axios --save
```



sencilla solicitud GET:

```js
axios.get(url)
.then(response =>{
    // Obtenemos los datos
})
.catch(e =>{
    // Capturamos los errores
})
```

Para realizar una solicitud GET llamamos al método `get` de Axios, pasando como parámetro la URL que deseamos solicitar. Luego de esto llamamos a los métodos `then` y `catch`, que se encargan de capturar la respuesta del servidor así como los errores, en caso de que llegue a ocurrir alguno.

Ejemplo:



## EJECUTAR COMO UN DEMONIO

```bash
pm2 list
```

Iniciar ejecutable:

```
pm2 start nombre_ejecutable
```

Para guardar los cambios de el ejecutable que se acaba de iniciar

```bash
pm2 save
```

Para ver los mensaje de log, hay que salirse a la ruta principal

```bash
cd 
cd .pm2/log/
```

En esta ruta de log, por cada ejecutable.js lanzado se crean dos archivos, uno de error y y otro que muestra el funcionamiento , si hay algun console.log en el proyecto.

```bash
pm2 start api.js --max-memory-restart 300M
```





### SOCKET IO

Si hago cambios en algo del codigo del ejecutable que está lanzado, hay que parar el ejecutable y volverlo a lanzar o reiniciarlo

Para integrar socket.io : https://socket.io/get-started/chat

```bash
npm install socket.io	
```







Notas:

1. Para eliminar un elemento de un array hacer un filter donde no cumpla la condicion y el array que devuelve es el array sin dicho elemento

2. Poner # delante de la declaración de las funciones para que sean private. NO por ahora

3. Si diese algun error o no funcionasen correctamente los sockets, modificar en el archivo package.json la version de socket.io

   ```json
   "socket.io": "^4.1.3",
   ```

   Actualizar npm

   ```bash
   npm i
   ```

4. Modificar en el archivo de bin, si da error en socket.io y no es por la version

   ```js
   websocket.io.attach(server, {cookie: false, cors: {
   
   por:
   
   websocket.io.attach(server, {cookie: false, transports: ['polling'], cors: {
   ```

   

5. 



Para documentar los argumentos, funciones,... 

https://github.com/google/closure-compiler/wiki/Annotating-JavaScript-for-the-Closure-Compiler#type-annotations