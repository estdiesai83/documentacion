## ¿Qué es una API REST?

Una API REST es una interfaz de comunicación entre sistemas de información que usa el **protocolo de transferencia de hipertexto** (*hypertext transfer protocol* o HTTP, por su siglas en inglés) para obtener datos o ejecutar operaciones sobre dichos datos en diversos formatos, como pueden ser XML o JSON.

<< Descubre más de 1000 apps en HubSpot App Marketplace >> 



Se basa en el **modelo cliente-servidor** donde el cliente es el que solicita obtener los recursos o realizar alguna operación sobre dichos datos, mientras que el servidor es aquel ente que entrega o procesa dichos datos a solicitud del cliente.

### Criterios de API REST

Existen diversos criterios para identificar si una API es REST o no. Algunos de ellos son que:

- Debe usar una arquitectura cliente-servidor.
- Las ejecuciones de la API no deben considerar el estado del cliente, el estado de peticiones anteriores o algún indicador almacenado que haga variar su comportamiento. La comunicación debe ser sin estado (*stateless*).
- Ha de estar orientada a recursos, usando las operaciones estándar de los verbos HTTP.
- Hace uso de la URL como identificador único de los recursos.
- Debe ser hipermedia: cuando se consulte un recurso, este debe contener links o hipervínculos de acciones o recursos que lo complementen.

## Diferencia entre RESTful y RESTless

A menudo escuchamos estos términos al momento de diseñar, construir o interactuar con API. La diferencia es sencilla. Llamamos **RESTful a todas aquellas API que cumplen completamente los criterios REST**; mientras que llamamos RESTless a aquellas API que no cumplen del todo con los criterios REST.

Por ejemplo, una API que utiliza el verbo POST para todas sus operaciones no es una API RESTful, si no una API RESTless.

## ¿Qué es la API Specification?

La especificación de una API, o API Spec, es aquella documentación donde se describe el comportamiento de una API, también conocido como el contrato de la API. **La finalidad de dicha documentación es guiar al desarrollador que va a integrar el uso de la API en su sistema.** Es tal la importancia que ha tomado este rubro que existen diversas herramientas y estándares creados específicamente para describir una API REST como son RAML, Swagger y el estándar OpenAPI.

Los componentes primordiales que se describen en un API Spec son los siguientes:

### Verbo HTTP

Son aquellos verbos propios del protocolo HTTP que fueron tomados para definir operaciones muy puntuales y específicas sobre los recursos de la API.

Los más utilizados son:

1. **GET:** listado de recursos. Detalle de un solo recurso.
2. **POST:** creación de un recurso.
3. **PUT:** modificación total de un recurso.
4. **PATCH:** modificación parcial de un recurso.
5. **DELETE:** eliminación de un recurso. En muchas ocasiones es un **soft delete**, es decir, no se elimina definitivamente un recurso sino que únicamente es marcado como eliminado o desactivado.
6. **URL orientada a recursos**: la definición de las URL de los endpoint de la API están orientadas a recursos, es decir, a entidades que tienen coherencia dentro del contexto de la API. Por ejemplo, en una API para un sistema que administra libros sería fácil encontrar entidades como **libros, autores, editoriales, colecciones**, etc. Estas entidades las veremos reflejadas en URL orientadas a recursos que las representen, por ejemplo:

   - /api-libros/v0/autores: identifica los recursos **autores**

   - /api-libros/v0/autores/{id-autor}: identifica un recurso **autor**

   - /api-libros/v0/autores/{id-autor}/libros: identifica los libros de un autor en específico

   - /api-libros/v0/libros: identifica los recursos **libros**

   - /api-libros/v0/editoriales: identifica los recursos **editoriales**

   - /api-libros/v0/editoriales/{id-editorial}/libros: identifica los libros de una editorial


### HTTP Status

Son aquellos estatus de respuesta propios del protocolo HTTP que fueron tomados para informar sobre el resultado de la operación solicitada. Los más comunes en API REST son:

1. 200 - OK
2. 201 - Created
3. 204 - No Content
4. 400 - Bad Request
5. 401 - Unauthorized
6. 403 - Forbidden
7. 404 - Not Found
8. 500 - Internal Server Error

A continuación, verás una tabla de ejemplo para ilustrar estos conceptos:

| VERBO HTTP | URL DEL RECURSO    | ACCIÓN                                   | HTTP STATUS                                                  |
| ---------- | ------------------ | ---------------------------------------- | ------------------------------------------------------------ |
| GET        | /libros            | Obtener una lista de libros              | 200 - OK204 - Not Content: cuando no hay libros a listar     |
| GET        | /libros/{id-libro} | Obtener detalle de un libro              | 200 - OK404 - Not Found: cuando no existe el libro buscado   |
| POST       | /libros            | Crear un recurso nuevo libro             | 201 - Created                                                |
| PUT        | /libros/{id-libro} | Modificar un recurso libro completamente | 200 - OK400 - Bad request: cuando algún parámetro enviado no cumple con las reglas |
| PATCH      | /libros/{id-libro} | Modificar un recurso libro parcialmente  | 200 - OK201 - Created: si el recurso a modificar no existe se crea en automático400 - Bad request: cuando algún parámetro enviado no cumple con las reglas |
| DELETE     | /libros/{id-libro} | Eliminar un recurso libro                | 201 - Not Content: es el status standard a regresar en un verbo DELETE |

Las API REST han aportado mucho en la forma de comunicación entre sistemas. Al día de hoy, un gran porcentaje de las empresas que usan la tecnología para aportar valor a sus productos tienen API REST como forma estándar de comunicación.

Existe una cantidad enorme de API disponibles en Internet para agregar valor a cualquier desarrollo de software, ya sea para tercerizar algún módulo necesario para el sistema en cuestión (como timbrado de facturas, pagos online, etc.) o simplemente para mejorar la experiencia del usuario, como la geolocalización, el acceso con cuentas de redes sociales y demás.



## ¿Qué es API RESTful?

La API RESTful es una interfaz que dos sistemas de computación utilizan para intercambiar información de manera segura a través de Internet. La mayoría de las aplicaciones para empresas deben comunicarse con otras aplicaciones internas o de terceros para llevar a cabo varias tareas. Por ejemplo, para generar nóminas mensuales, su sistema interno de cuentas debe compartir datos con el sistema bancario de su cliente para automatizar la facturación y comunicarse con una aplicación interna de planillas de horarios. Las API RESTful admiten este intercambio de información porque siguen estándares de comunicación de *software* seguros, confiables y eficientes.

## ¿Qué es una API?

Una interfaz de programa de aplicación (API) define las reglas que se deben seguir para comunicarse con otros sistemas de software. Los desarrolladores exponen o crean API para que otras aplicaciones puedan comunicarse con sus aplicaciones mediante programación. Por ejemplo, la aplicación de planilla de horarios expone una API que solicita el nombre completo de un empleado y un rango de fechas. Cuando recibe esta información, procesa internamente la planilla de horarios del empleado y devuelve la cantidad de horas trabajadas en ese rango de fechas.

Se puede pensar en una API web como una puerta de enlace entre los clientes y los recursos de la Web.

### Clientes

Los clientes son usuarios que desean acceder a información desde la Web. El cliente puede ser una persona o un sistema de *software* que utiliza la API. Por ejemplo, los desarrolladores pueden escribir programas que accedan a los datos del tiempo desde un sistema de clima. También se puede acceder a los mismos datos desde el navegador cuando se visita directamente el sitio web de clima.

### Recursos

Los recursos son la información que diferentes aplicaciones proporcionan a sus clientes. Los recursos pueden ser imágenes, videos, texto, números o cualquier tipo de datos. La máquina encargada de entregar el recurso al cliente también recibe el nombre de servidor. Las organizaciones utilizan las API para compartir recursos y proporcionar servicios web, a la vez que mantienen la seguridad, el control y la autenticación. Además, las API las ayudan a determinar qué clientes obtienen acceso a recursos internos específicos.

## ¿Qué es REST?

La transferencia de estado representacional (REST) es una arquitectura de software que impone condiciones sobre cómo debe funcionar una API. En un principio, REST se creó como una guía para administrar la comunicación en una red compleja como Internet. Es posible utilizar una arquitectura basada en REST para admitir comunicaciones confiables y de alto rendimiento a escala. Puede implementarla y modificarla fácilmente, lo que brinda visibilidad y portabilidad entre plataformas a cualquier sistema de API.

Los desarrolladores de API pueden diseñar API por medio de varias arquitecturas diferentes. Las API que siguen el estilo arquitectónico de REST se llaman API REST. Los servicios web que implementan una arquitectura de REST son llamados servicios web RESTful. El término API RESTful suele referirse a las API web RESTful. Sin embargo, los términos API REST y API RESTful se pueden utilizar de forma intercambiable.

A continuación, se presentan algunos de los principios del estilo arquitectónico de REST:

### Interfaz uniforme

La interfaz uniforme es fundamental para el diseño de cualquier servicio web RESTful. Ella indica que el servidor transfiere información en un formato estándar. El recurso formateado se denomina representación en REST. Este formato puede ser diferente de la representación interna del recurso en la aplicación del servidor. Por ejemplo, el servidor puede almacenar los datos como texto, pero enviarlos en un formato de representación HTML.

La interfaz uniforme impone cuatro limitaciones de arquitectura:

1. Las solicitudes deben identificar los recursos. Lo hacen mediante el uso de un identificador uniforme de recursos.
2. Los clientes tienen información suficiente en la representación del recurso como para modificarlo o eliminarlo si lo desean. El servidor cumple esta condición por medio del envío de los metadatos que describen el recurso con mayor detalle.
3. Los clientes reciben información sobre cómo seguir procesando la representación. El servidor logra esto enviando mensajes autodescriptivos que contienen metadatos sobre cómo el cliente puede utilizarlos de mejor manera.
4. Los clientes reciben información sobre todos los demás recursos relacionados que necesitan para completar una tarea. El servidor logra esto enviando hipervínculos en la representación para que los clientes puedan descubrir dinámicamente más recursos.

### Tecnología sin estado

En la arquitectura de REST, la tecnología sin estado se refiere a un método de comunicación en el cual el servidor completa todas las solicitudes del cliente independientemente de todas las solicitudes anteriores. Los clientes pueden solicitar recursos en cualquier orden, y todas las solicitudes son sin estado o están aisladas del resto. Esta limitación del diseño de la API REST implica que el servidor puede comprender y cumplir por completo la solicitud todas las veces. 

### Sistema por capas

En una arquitectura de sistema por capas, el cliente puede conectarse con otros intermediarios autorizados entre el cliente y el servidor y todavía recibirá respuestas del servidor. Los servidores también pueden pasar las solicitudes a otros servidores. Es posible diseñar el servicio web RESTful para que se ejecute en varios servidores con múltiples capas, como la seguridad, la aplicación y la lógica empresarial, que trabajan juntas para cumplir las solicitudes de los clientes. Estas capas se mantienen invisibles para el cliente.

### Almacenamiento en caché

Los servicios web RESTful admiten el almacenamiento en caché, que es el proceso de almacenar algunas respuestas en la memoria caché del cliente o de un intermediario para mejorar el tiempo de respuesta del servidor. Por ejemplo, suponga que visita un sitio web que tiene imágenes comunes en el encabezado y el pie de página en todas las páginas. Cada vez que visita una nueva página del sitio web, el servidor debe volver a enviar las mismas imágenes. Para evitar esto, el cliente guarda en la memoria caché o almacena estas imágenes después de la primera respuesta y, luego, utiliza las imágenes directamente desde la memoria caché. Los servicios web RESTful controlan el almacenamiento en caché mediante el uso de respuestas de la API que se pueden guardar en la memoria caché o no.

### Código bajo demanda

En el estilo de arquitectura de REST, los servidores pueden extender o personalizar temporalmente la funcionalidad del cliente transfiriendo a este el código de programación del *software*. Por ejemplo, cuando completa un formulario de inscripción en cualquier sitio web, su navegador resalta de inmediato cualquier error que usted comete, como un número de teléfono incorrecto. El navegador puede hacer esto gracias al código enviado por el servidor.

## ¿Qué beneficios ofrecen las API RESTful?

Las API RESTful incluyen los siguientes beneficios:

### Escalabilidad

Los sistemas que implementan API REST pueden escalar de forma eficiente porque REST optimiza las interacciones entre el cliente y el servidor. La tecnología sin estado elimina la carga del servidor porque este no debe retener la información de solicitudes pasadas del cliente. El almacenamiento en caché bien administrado elimina de forma parcial o total algunas interacciones entre el cliente y el servidor. Todas estas características admiten la escalabilidad, sin provocar cuellos de botella en la comunicación que reduzcan el rendimiento.

### Flexibilidad

Los servicios web RESTful admiten una separación total entre el cliente y el servidor. Simplifican y desacoplan varios componentes del servidor, de manera que cada parte pueda evolucionar de manera independiente. Los cambios de la plataforma o la tecnología en la aplicación del servidor no afectan la aplicación del cliente. La capacidad de ordenar en capas las funciones de la aplicación aumenta la flexibilidad aún más. Por ejemplo, los desarrolladores pueden efectuar cambios en la capa de la base de datos sin tener que volver a escribir la lógica de la aplicación.

### Independencia

Las API REST son independientes de la tecnología que se utiliza. Puede escribir aplicaciones del lado del cliente y del servidor en diversos lenguajes de programación, sin afectar el diseño de la API. También puede cambiar la tecnología subyacente en cualquiera de los lados sin que se vea afectada la comunicación.

## ¿Cómo funcionan las API RESTful?

La función básica de una API RESTful es la misma que navegar por Internet. Cuando requiere un recurso, el cliente se pone en contacto con el servidor mediante la API. Los desarrolladores de API explican cómo el cliente debe utilizar la API REST en la documentación de la API de la aplicación del servidor. A continuación, se indican los pasos generales para cualquier llamada a la API REST:

1. El cliente envía una solicitud al servidor. El cliente sigue la documentación de la API para dar formato a la solicitud de una manera que el servidor comprenda.
2. El servidor autentica al cliente y confirma que este tiene el derecho de hacer dicha solicitud.
3. El servidor recibe la solicitud y la procesa internamente.
4. Luego, devuelve una respuesta al cliente. Esta respuesta contiene información que dice al cliente si la solicitud se procesó de manera correcta. La respuesta también incluye cualquier información que el cliente haya solicitado.

Los detalles de la solicitud y la respuesta de la API REST varían un poco en función de cómo los desarrolladores de la API la hayan diseñado.

## ¿Qué contiene la solicitud del cliente de la API RESTful?

Las API RESTful requieren que las solicitudes contengan los siguientes componentes principales:

### Identificador único de recursos

El servidor identifica cada recurso con identificadores únicos de recursos. En los servicios REST, el servidor por lo general identifica los recursos mediante el uso de un localizador uniforme de recursos (URL). El URL especifica la ruta hacia el recurso. Un URL es similar a la dirección de un sitio web que se ingresa al navegador para visitar cualquier página web. El URL también se denomina punto de conexión de la solicitud y especifica con claridad al servidor qué requiere el cliente.

### Método

Los desarrolladores a menudo implementan API RESTful mediante el uso del protocolo de transferencia de hipertexto (HTTP). Un método de HTTP informa al servidor lo que debe hacer con el recurso. A continuación, se indican cuatro métodos de HTTP comunes:

***GET***

Los clientes utilizan GET para acceder a los recursos que están ubicados en el URL especificado en el servidor. Pueden almacenar en caché las solicitudes GET y enviar parámetros en la solicitud de la API RESTful para indicar al servidor que filtre los datos antes de enviarlos.

***POST***

Los clientes usan POST para enviar datos al servidor. Incluyen la representación de los datos con la solicitud. Enviar la misma solicitud POST varias veces produce el efecto secundario de crear el mismo recurso varias veces.

***PUT***

Los clientes utilizan PUT para actualizar los recursos existentes en el servidor. A diferencia de POST, el envío de la misma solicitud PUT varias veces en un servicio web RESTful da el mismo resultado.

***DELETE***

Los clientes utilizan la solicitud DELETE para eliminar el recurso. Una solicitud DELETE puede cambiar el estado del servidor. Sin embargo, si el usuario no cuenta con la autenticación adecuada, la solicitud fallará.

### Encabezados de HTTP

Los encabezados de solicitudes son los metadatos que se intercambian entre el cliente y el servidor. Por ejemplo, el encabezado de la solicitud indica el formato de la solicitud y la respuesta, proporciona información sobre el estado de la solicitud, etc.

***Datos***

Las solicitudes de la API REST pueden incluir datos para que los métodos POST, PUT y otros métodos HTTP funcionen de manera correcta.

***Parámetros***

Las solicitudes de la API RESTful pueden incluir parámetros que brindan al servidor más detalles sobre lo que se debe hacer. A continuación, se indican algunos tipos de parámetros diferentes:

- Los parámetros de ruta especifican los detalles del URL.
- Los parámetros de consulta solicitan más información acerca del recurso.
- Los parámetros de cookie autentican a los clientes con rapidez.

## ¿Qué son los métodos de autenticación de la API RESTful?

Un servicio web RESTful debe autenticar las solicitudes antes de poder enviar una respuesta. La autenticación es el proceso de verificar una identidad. Por ejemplo, puede demostrar su identidad mostrando una tarjeta de identificación o una licencia de conducir. De forma similar, los clientes de los servicios RESTful deben demostrar su identidad al servidor para establecer confianza.

La API RESTful tiene cuatro métodos comunes de autenticación:

### Autenticación HTTP

HTTP define algunos esquemas de autenticación que se pueden utilizar directamente cuando se implementa la API REST. A continuación, se indican dos de estos esquemas:

***Autenticación básica***

En la autenticación básica, el cliente envía el nombre y la contraseña del usuario en el encabezado de la solicitud. Los codifica con base64, que es una técnica de codificación que convierte el par en un conjunto de 64 caracteres para su transmisión segura.

***Autenticación del portador***

El término autenticación del portador se refiere al proceso de brindar el control de acceso al portador del *token*. El *token* del portador suele ser una cadena de caracteres cifrada que genera el servidor como respuesta a una solicitud de inicio de sesión. El cliente envía el *token* en los encabezados de la solicitud para acceder a los recursos.

### Claves de la API

Las claves de la API son otra opción para la autenticación de la API REST. En este enfoque, el servidor asigna un valor único generado a un cliente por primera vez. Cada vez que el cliente intenta acceder a los recursos, utiliza la clave de API única para su verificación. Las claves de API son menos seguras debido a que el cliente debe transmitir la clave, lo que la vuelve vulnerable al robo de red.

### OAuth

OAuth combina contraseñas y *tokens* para el acceso de inicio de sesión de alta seguridad a cualquier sistema. El servidor primero solicita una contraseña y luego solicita un *token* adicional para completar el proceso de autorización. Puede verificar el token en cualquier momento y, también, a lo largo del tiempo, con un alcance y duración específicos.

## ¿Qué contiene la respuesta del servidor de la API RESTful?

Los principios de REST requieren que la respuesta del servidor contenga los siguientes componentes principales:

### Línea de estado

La línea de estado contiene un código de estado de tres dígitos que comunica si la solicitud se procesó de manera correcta o dio error. Por ejemplo, los códigos 2XX indican el procesamiento correcto, pero los códigos 4XX y 5XX indican errores. Los códigos 3XX indican la redirección de URL.

A continuación, se enumeran algunos códigos de estado comunes:

- 200: respuesta genérica de procesamiento correcto
- 201: respuesta de procesamiento correcto del método POST
- 400: respuesta incorrecta que el servidor no puede procesar
- 404: recurso no encontrado

### Cuerpo del mensaje

El cuerpo de la respuesta contiene la representación del recurso. El servidor selecciona un formato de representación adecuado en función de lo que contienen los encabezados de la solicitud. Los clientes pueden solicitar información en los formatos XML o JSON, lo que define cómo se escriben los datos en texto sin formato. Por ejemplo, si el cliente solicita el nombre y la edad de una persona llamada John, el servidor devuelve una representación JSON como la siguiente:

'{"name":"John", "age":30}'

### Encabezados

La respuesta también contiene encabezados o metadatos acerca de la respuesta. Estos brindan más contexto sobre la respuesta e incluyen información como el servidor, la codificación, la fecha y el tipo de contenido.



# What is JSON?

### Store, query, and index JSON with Amazon DocumentDB

[Get started with Amazon DocumentDB](https://aws.amazon.com/documentdb/getting-started/)

JavaScript Object Notation, more commonly known by the acronym JSON, is an open data interchange format that is both human and machine-readable. Despite the name JavaScript Object Notation, JSON is independent of any programming language and is a common API output in a wide variety of applications.

JSON represents data in two ways:

- **Object**: a collection of name-value (or key-value) pairs. An object is defined within left ({) and right (}) braces. Each name-value pair begins with the name, followed by a colon, followed by the value. Name-value pairs are comma separated.
- **Array**: an ordered collection of values. An array is defined within left ([) and right (]) brackets. Items in the array are comma separated.

![JSON data](https://d1.awsstatic.com/AWS%20Databases/json-format.0b284ee998d9b3b000deae381153646b0a09f8fb.png)

Below is a JSON example that contains an array of objects in which the objects represent different films in a streaming library. Each film is defined by two name-value pairs, one that specifies a unique value to identify that film and another that specifies a URL that points to the corresponding film’s promotional image.

```json
var films = [{"FilmID":"catmanbegins", "Image":"https://m.media-amazon.com/images/catmanbegins.jpg"},
  {"FilmID":"cabdriver", "Image":"https://m.media-amazon.com/images/cabdriver.jpg"},
  {"FilmID":"pulpnonfiction", "Image":"https://m.media-amazon.com/images/pulpnonfiction.jpg"},
  {"FilmID":"doctornormal", "Image":"https://m.media-amazon.com/images/doctornormal.jpg"},
  {"FilmID":"backtothepresent", "Image":"https://m.media-amazon.com/images/backtothepresent.jpg"}];
```

## What is a JSON document database?

A JSON [document database](https://aws.amazon.com/nosql/document/) is a type of nonrelational database that is designed to store and query data as JSON documents, rather than normalizing data across multiple tables, each with a unique and fixed structure, as in a relational database. JSON document databases use the same document-model format that developers use in their application code, which make it much easier for them to store and query data. The flexible, semi-structured, and hierarchical nature of JSON document databases allows them to evolve with applications’ needs. JSON document databases provide powerful and intuitive APIs for flexible and agile development.

![JSON document database](https://d1.awsstatic.com/AWS%20Databases/JSON%20document%20database.64fe2a382abc8ca2b8743f0e3b5af553a33f3fb0.png)

![JSON document database query](https://d1.awsstatic.com/AWS%20Databases/JSON%20database%20query.725e49a724fff7c4acb904b82f36db0db31e99d2.png)

[Amazon DocumentDB (with MongoDB compatibility)](https://aws.amazon.com/documentdb/) is a fast, scalable, highly available, and fully managed document database service that supports MongoDB workloads, that makes it easy to store, query, and index JSON data.

![Amazon DocumentDB makes it easy to insert, query, index, and perform aggregations over JSON data](https://d1.awsstatic.com/AWS%20Databases/Product-Page-Diagram_DocumentDB_HIW_REVIEW.78f18079b219164cfe7a00a29be24e2b96264e8a.png)

*Amazon DocumentDB makes it easy to insert, query, index, and perform aggregations over JSON data.*

## Relational Database vs. JSON Document Database Terminology

The following table compares terminology used by JSON document databases with terminology used by relational databases using SQL.

| Relational database (SQL) | JSON document database |
| :-----------------------: | :--------------------: |
|           Table           |       Collection       |
|            Row            |        Document        |
|          Column           |         Field          |
|        Primary key        |        ObjectID        |
|           Index           |         Index          |
|           View            |          View          |
|  Nested table or object   |   Embedded document    |
|           Array           |         Array          |



# ¿Diferencias entre REST y SOAP?

![SOAP vs REST](https://cdn2.chakray.com/wp-content/uploads/2016/12/SOAP-vs-REST-1.png)

¿Cómo han de ser los servicios de mi empresa? ¿Basados en REST o en SOAP? ¿Qué diferencias existen?

Elegir entre ambas opciones, sigue siendo un reto para algunas empresas que todavía no están familiarizadas con las ventajas de una u de otra. En este artículo veremos distintas formas de realizar una API. Veremos cuáles son algunas de las tecnologías que podemos utilizar para el desarrollo de una arquitectura orientada a servicios, SOA.

- [¿Qué es SOA?](https://www.chakray.com/es/que-diferencias-hay-entre-rest-y-soap/#seccion1)
- [¿Qué es REST Web Services?](https://www.chakray.com/es/que-diferencias-hay-entre-rest-y-soap/#seccion2)
- [SOAP Web Services y Web Sockets](https://www.chakray.com/es/que-diferencias-hay-entre-rest-y-soap/#seccion3)
- [REST vs. SOAP: ¿Qué diferencias y ventajas tienen?](https://www.chakray.com/es/que-diferencias-hay-entre-rest-y-soap/#seccion4)

Como ves, este artículo puede ayudarte mucho para diferenciar y elegir cuál es la mejor opción para tu empresa. ¡Vamos allá!

## ¿Qué es SOA?

Antes de ello, para una mejor comprensión, resulta importante destacar que **no es lo mismo SOAP que SOA**. Sabemos que en ocasiones puede llevar a confusión, pues son términos parecidos pero con distinto significado.

[-SOA: La arquitectura perfecta para adaptarnos a las necesidades del negocio-](https://www.chakray.com/es/soa-la-arquitectura-para-las-necesidades-del-negocio/)

**SOA (Service-Oriented Architecture)** es un tipo de arquitectura de software, la cual se basa en la integración de aplicaciones mediante servicios. Sobre estos servicios se construyen: composiciones, BPM, proxys e incluso APIs. Pero… ¿REST y SOAP no son también servicios? Sí, son tecnologías que aparentemente ofrecen las mismas funcionalidades, pero no hacen lo mismo, aunque tanto REST como SOAP, siguen la misma arquitectura SOA, por lo que las dos siguen los mismos “principios”.  

[-Quizá te interese: ¿Qué ventajas tiene la Arquitectura SOA para el IT de mi empresa?-](https://www.chakray.com/es/arquitectura-soa-que-ventajas-tiene-para-el-it-de-mi-empresa/)

## ¿Qué es REST Web Services y para qué sirve?

Seguimos con otro tipo de tecnología que nos permita realizar una API con WebServices. Ahora veremos **REST**, que es el acrónimo de **RE**presentational **S**tate **T**ransfer. A diferencia de SOAP, más que un protocolo es una definición de arquitectura donde nos indica cómo realizar el intercambio y manejo de datos a través de servicios web. A aquellos servicios web que siguen su definición se les conocen como **RESTful Web services**.

Las APIs REST se distinguen por que se basan fuertemente en el protocolo de aplicación HTTP. Es decir, usan los métodos y códigos de respuesta HTTP para una función específica y ampliamente reconocida por todos. Y nos permite a través de la URI, la estructuración de los recursos disponibles.

### Ventajas REST

- Entre sus ventajas se encuentran la posibilidad de crear cliente/servidor en distintos lenguajes. Nos da la posibilidad de enviar la información en distintos formatos, aunque habitualmente se usa JSON. A nivel de rendimiento es mejor que los servicios SOAP. Debido a su ligereza y a la posibilidad de realizar fácilmente el cacheo de llamadas a través de cabeceras de control HTTP.
- Por tanto REST nos permite la creación de servicios más ligeros y simples, fácilmente visibles y utilizables a través de cualquier navegador web. Por lo que se ha impuesto a SOAP en ámbitos más informales de negocio.
- REST es más ligero en comparación con SOAP, lo que puede hacerlo una mejor opción para aplicaciones móviles y otros entornos con limitaciones de recursos.
- Las API RESTful pueden escalar fácilmente para satisfacer las demandas de aplicaciones a gran escala porque no requieren que se almacene ningún estado de sesión en el servidor.
- REST permite a los desarrolladores trabajar con una variedad de lenguajes de programación y marcos, lo que lo hace más flexible que SOAP.

### Desventajas REST

- Entre sus desventajas encontramos que a pesar de que el uso de los métodos HTTP es ampliamente conocido, no existe como tal un estándar que nos indique cómo debemos realizar dichos métodos, a diferencia de como pasaba con SOAP. Y un servicio web REST tampoco genera por defecto un contrato entre cliente y servidor, aunque lo podamos realizar como un añadido. Si lo comparamos con SOAP, son APIs menos seguras. Y en general, el tratamiento de grandes bloques de datos o la imposibilidad de realizar más de una llamada por conexión, son otros de sus inconvenientes. Aunque estos dos últimos, han sido solventados con llegada del protocolo HTTP 2.x y la implementación del mismo por los servicios RESTful.

Con API Manager de WSO2 podremos crear una API  y su swagger asociado fácilmente, evitando así el problema de no tener un contrato público. En este [artículo](https://www.chakray.com/es/que-diferencias-hay-entre-rest-y-soap/) puedes tener más información.

### Casos de uso de REST: Situaciones específicas para las que sirve REST

- Desarrollo de API públicas: Las API REST son ideales para crear servicios web públicos porque son más fáciles de usar y adoptar que las API SOAP. También son más flexibles en cuanto a formatos de datos, lo que las convierte en una buena opción para trabajar con datos y servicios públicos.
- Trabajar con recursos de servidor y ancho de banda limitados: Las API REST no tienen estado, lo que significa que cada interacción es independiente y el servidor no almacena información sobre solicitudes anteriores. Esto reduce en gran medida la cantidad de memoria de servidor necesaria y mejora el rendimiento, lo que convierte a REST en una buena opción para trabajar con recursos de servidor y ancho de banda limitados.
- Creación de aplicaciones móviles: REST es ligero, eficiente, sin estado y almacenable en caché, lo que lo hace ideal para crear aplicaciones móviles que necesitan acceder a datos de un servidor. Además, las API REST pueden utilizar diferentes formatos de datos, como JSON, que es más ligero que XML, lo que las hace más rápidas y eficientes que la mayoría de las API SOAP.
- Construir arquitecturas de microservicios: Los microservicios son una forma de desarrollar sistemas de software mediante la creación de servicios pequeños e independientes que funcionan juntos para formar una aplicación más grande. Dado que cada microservicio suele tener una función específica y bien definida e interactúa con otros servicios a través de API, REST es una solución natural para la comunicación entre servicios. Las API RESTful permiten a cada microservicio exponer su funcionalidad como un servicio web, que puede ser consumido fácilmente por otros microservicios o por aplicaciones cliente. Además, como REST no tiene estado, es idóneo para gestionar un gran número de solicitudes simultáneas, lo que es importante en arquitecturas muy distribuidas.

## ¿Qué es SOAP Web Services y para qué sirve?

**SOAP (S**imple **O**bject **A**ccess **P**rotocol), es un protocolo que nos permitirá realizar servicios web sin estado, a través de TCP y con un formato XML.

### Ventajas SOAP

- Entre sus ventajas podemos encontrar que al funcionar a través del protocolo de transporte TCP, se pueden utilizar diferentes protocolos de aplicación como: HTTP, SMTP o JMS. También nos brinda la posibilidad de generar cliente/servidor en distintos lenguajes de programación. Y está ampliamente estandarizado, por lo cual hay reglas concretas para formar el mensaje, el contrato entre cliente/servidor o el formato de los datos a enviar, siempre XML.

> **Podemos encontrar múltiples tipos de modelos de mensajes en SOAP, pero el más común es el RPC, en donde el punto de intersección de un mensaje entre el cliente y el servidor resulta inmediato en la respuesta del mensaje al cliente.**

- Debido a estas cualidades, SOAP es ampliamente utilizado en entornos empresariales. Donde es requerida la existencia de un contrato claro entre cliente y servidor, y además la seguridad en las comunicaciones es muy importante.
- SOAP está diseñado para permitir la integración entre diferentes sistemas y lenguajes de programación, lo que significa que se puede automatizar el intercambio de información entre diferentes sistemas y plataformas.

### Desventajas SOAP

- Entre sus desventajas está que al estar ampliamente estandarizado, es poco flexible y suele haber muchos errores a la hora de desarrollo si no se conocen dichos estándares.  Al utilizar el protocolo TCP también tiene un peor rendimiento que otro tipo de Web Services.
- Por estos detalles es importante contar con un producto que ayude en la creación de APIs SOAP como es el Enterprise Service Bus, ver [artículo](https://www.chakray.com/es/apache-synapse-enterprise-service-bus-esb-wso2/) relacionado, o con una empresa especialista en el desarrollo de los mismos, como es Chakray.
- SOAP puede ser complejo de implementar y utilizar, lo que puede dificultar su adopción para aplicaciones más simples.
- Debido a su enfoque en la seguridad y la confiabilidad, SOAP puede ser más lento que otros protocolos de comunicación como REST.

### Casos de uso de SOAP: Situaciones específicas para las que sirve SOAP

- Desarrollo de API privadas para grandes empresas: SOAP es una buena opción para desarrollar API privadas, especialmente para grandes empresas, debido a que proporciona mecanismos avanzados de seguridad web y gestión de transacciones, lo que lo hace ideal para soluciones empresariales.
- Trabajar con operaciones con estado: Si se requiere trabajar con operaciones encadenadas o repetitivas, como en el caso de transferencias bancarias o procesamiento de pedidos en línea, SOAP es una buena opción. Aunque esto requiere más recursos del servidor y ancho de banda, puede ser muy útil si se necesita almacenar información sobre el cliente en el servidor y utilizarla en una serie de peticiones.
- Utilizar un protocolo de transporte subyacente distinto de HTTP: A diferencia de REST, SOAP es independiente del protocolo de transporte subyacente y se puede utilizar con cualquier protocolo, como SMTP o JMS. Por lo tanto, si se requiere utilizar un protocolo de transporte diferente a HTTP, SOAP es una buena opción.

Tras entender un poco mejor qué es REST y qué es SOAP, podemos adentrarnos en qué ventajas tiene cada uno de estos conceptos y cómo podemos aplicarlos a nuestra empresa.

## WebSockets

Para empezar debemos entender que al realizar una API con WebSocket, no estaremos realizando una API con WebServices propiamente dicho. Tenemos que entender que es otra tecnología y por lo tanto podríamos llegar a implementar ambos tipos de API dentro de una misma aplicación.

Es una tecnología que permite el envío de mensajes instantáneos entre dos máquinas que previamente han establecido su conexión. Se basa en tres características principales:

- Socket TCP: La comunicación se establece de forma persistente a través de un único canal.
- Bi-directional: Ambas máquinas pueden enviarse mensajes.
- Comunicación full-duplex: La comunicación se puede realizar en ambos sentidos a la misma vez e independientemente del estado.

Además es ampliamente [soportado](https://developer.mozilla.org/en-US/docs/Web/API/WebSockets_API#Browser_compatibility) por los navegadores web. De esta forma podemos crear sitios web realmente dinámicos, en los cuales el cliente y el servidor se pueden comunicar en tiempo real, creando una experiencia web más interactiva y por tanto, satisfactoria.

Entre sus ventajas se encuentra, como hemos dicho, que está pensada especialmente para la realización de aplicaciones o webs con utilidades en tiempo real. Mejorando el rendimiento en cuanto a los tiempos de respuestas y la gestión de mensajes de gran tamaño, respecto a otros servicios web sobre HTTP/1.1.

Por contra, si la conexión se va a establecer a través de proxies, es posible que no sea soportada por alguno de ellos. La necesidad de implementar mecanismos de control en el caso de que fallos durante la transmisión de mensajes. Y por último, con la llegada de HTTP/2 y la tecnología Server-Sent Events (SSE), la diferencia de rendimiento y características únicas se reducen. Dentro del universo WSO2, puedes realizar API WebSocket. En este [artículo](https://www.chakray.com/es/wso2-msf4j-tutorial-websockets/), podrás informarte un poco más de ello.

## REST vs. SOAP ¿Qué diferencias y ventajas tienen?

A continuación se presenta un cuadro comparativo que destaca las principales diferencias y ventajas entre REST y SOAP:

|                                | **REST**                                                     | **SOAP**                                                     |
| ------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Rendimiento**                | Pocas operaciones con muchos recursos                        | Muchas operaciones con pocos recursos                        |
| **Escalabilidad**              | Se centra en la escalabilidad y rendimiento a gran escala para sistemas distribuidos hipermedia | Se centra en el diseño de aplicaciones distribuidas          |
| **Lenguaje de codificación**   | HTTP GET, HTTP POST, HTTP PUT, HTTP DEL                      | SMTP,HTTP POST, Manejo de datos                              |
| **Manejo de datos**            | Utiliza formatos de datos auto-descriptivos como JSON y XML  | Utiliza esquemas XML (XML Schema) para definir tipos de datos, lo que se conoce como tipado fuerte |
| **Operaciones**                | Síncronas                                                    | Síncronas y asíncronas                                       |
| **HTTPS y WS Security**        | HTTPS                                                        | WS SECURITY                                                  |
| **Comunicación**               | Comunicación punto a punto y segura                          | Comunicación origen a destino seguro                         |
| **Desarrollo de aplicaciones** | REST se considera una opción más adecuada para el desarrollo de aplicaciones web y móviles | SOAP es más adecuado para aplicaciones empresariales y de misión crítica que requieren alta seguridad y confiabilidad. |
| **Seguridad**                  | REST no tiene seguridad integrada, pero se puede implementar seguridad en diferentes niveles, como en la capa de transporte (usando HTTPS) o en la capa de aplicación (usando OAuth o tokens de seguridad). REST también puede aprovechar las políticas de seguridad de la plataforma web subyacente, como ASP.NET Identity en el caso de ASP.NET. | SOAP tiene una seguridad integrada y es compatible con WS-Security, lo que permite agregar firmas digitales y cifrado a los mensajes SOAP para proteger la información. SOAP también permite el uso de certificados SSL/TLS para la autenticación de servidores y clientes. |
| **Facilidad de uso**           | Interfaz uniforme y simple, fácil de entender y aprender     | Curva de aprendizaje más pronunciada y requiere una comprensión más profunda de los estándares y protocolos asociados |

## Conclusión: SOAP vs REST, ¿quién ganará?

En conclusión, REST y SOAP son dos protocolos de comunicación utilizados en la web con enfoques diferentes para el intercambio de datos. REST se centra en la simplicidad y la escalabilidad horizontal, lo que lo hace adecuado para aplicaciones web y móviles. Por otro lado, SOAP se centra en la confiabilidad y la escalabilidad vertical, lo que lo hace adecuado para aplicaciones empresariales y de misión crítica que requieren alta seguridad y confiabilidad. Ambos protocolos tienen ventajas y desventajas, y la elección entre ellos depende de las necesidades específicas del proyecto en cuestión. Es importante tener en cuenta que la elección del protocolo de comunicación adecuado puede tener un impacto significativo en el rendimiento y la escalabilidad de una aplicación.

Aunque SOAP ha sido popular en el pasado, para algunas empresas resulta demasiado compleja y poco flexible. REST, por otro lado, es conocida por ser una alternativa más sencilla y flexible, que se adapta mejor a los requerimientos de ciertas aplicaciones. Debido a esta razón, cada vez son más las empresas que están optando por servicios basados en REST para manejar grandes cantidades de datos de manera sencilla y escalable. Aunque ambas arquitecturas tienen sus nichos definidos, es importante tener en cuenta que la elección del protocolo de comunicación adecuado puede tener un impacto significativo en el rendimiento y la escalabilidad de una aplicación. Por lo tanto, es importante evaluar las necesidades específicas del proyecto en cuestión antes de elegir entre REST y SOAP.