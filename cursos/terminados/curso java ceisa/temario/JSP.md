# JSP

JSP (Java Server Pages) Es la tecnología Java para desarrollo de páginas web. Permite a los desarrolladores  crear páginas web dinámicas con código HTML, código Java que se ejecutará del lado del servidor.

Sus ficheros tienen la extensión .jsp y deben ejecutarse sobre un servidor web (Ej.apache tomcat).

Para crear una aplicación utilizando esto desde Eclipse, hay que cambiar la perspectiva a Java EE. 







Vamos a trabajar con el servidor web **apache tomcat**

En windows descargar de https://tomcat.apache.org/download-10.cg la version 64-bit 10.1.39 y la carpeta que se descarga, descomprimirla y copiarla directamente en C: sin tener que instalar nada, por que desde eclipse la vamos a utilizar directamente. 

Desde Eclipse en la pesaña de window->Preferences y en la ventana de Preferences pulsar en Server-> Runtime Enviroments -Add-> seleccionar la carpeta que hemos copiado en C  y pulsar en Apply y Close 

Después en la pestaña de abajo en la pantalla de eclipse donde pone Servers, pulsar sobre el enlace y volver a elegir la opción de apache tomcat y pulsar en Finish. Si está todo bien configurado debe aparecer:

![image-20250319101933565](/home/soa/.config/Typora/typora-user-images/image-20250319101933565.png) 

Pulsamos en botón derecho start.

Desde la pestaña Window->web browser elegir el navegador que queremos utililzar. y desde el botón de la bola del mundo se abrirá el navegador que hemos seleccionado.



Ahora creamos un **nuevo Proyecto** pero ahora pulsamos en New -> **Dinamic Web Project**.

Ejemplo: API_RESTAURANTE

![image-20250319104624086](/home/soa/.config/Typora/typora-user-images/image-20250319104624086.png) 

Creamos lo primero en src->main->webapp un archivo de tipo html con nombre index.html

![image-20250319104726133](/home/soa/.config/Typora/typora-user-images/image-20250319104726133.png)

En el archivo index.html escribirmos:

```html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h1>Hola Bienvenido</h1>

</body>
</html>
```

 Y ejecutamos:



NOTA: En mi portatil en ubuntu como me daba error al iniciar el tomcat por que estaba ocupado el puerto 8080, he cambiado el puerto del 8080 al 8085 desde boton derecho -> open y en la parte de puertos he modificado dicho valor.

![image-20250319112355334](/home/soa/.config/Typora/typora-user-images/image-20250319112355334.png) 





Ahora cambiamos el archivo index.html a index.jsp y creamos un nuevo archivo header.jsp, 

En el archivo header.jsp vamos a contener el encabezado de la aplicación

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>API RESTAURANTE</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="style2.css">
</head>
<body>

<div style="text-align:center;">
	<!--Creamos una lista con un enlace en cada elemento-->
	<ul>
		<li><a href="index.jsp" class="active">
				<img src="img/icono_restaurante.jpeg" style="width: 10%;"><br>
			HOME
			</a>
		</li>
		<li><a href="reservas.jsp">RESERVAS</a></li>
		<li><a href="menu.jsp">MENU</a></li>
		<li><a href="">SALA</a></li>
		<li><a href="bar.jsp">BAR</a></li>
		<li><a href="">COCINA</a></li>
		
	<% 
		java.util.Calendar ahora = java.util.Calendar.getInstance();
		int hora = ahora.get(java.util.Calendar.HOUR_OF_DAY);
	%>
	
	<h4>HOLA EQUIPO</h4>
	<% if((hora>20) && (hora<6)){	%>
		<h4>BUENAS NOCHES</h4>
	<%}else if((hora>=6) && (hora<=14)){	%>
		<h4>BUENAS DIAS</h4>
	<%} else {	%>
		<h4>BUENAS TARDES</h4>
	<%}	%>
	</ul>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
```







# CSS

Creamos un archivo **style.css**

```css
.borde1{
	background-color: tomato;
	border: 2px solid black;
	width: 200px;
	margin-top: 200px;
	margin-left: 200px;
	padding: 5px;
	text-align: center;
}

body{
	background-color: darkgrey;	
}
```

Los estilos si se aplican a:

- **etiquetas, palabras reservadas:** Ej: body , va el nombre directamente de la etiqueta
- **a una clase:** se pone un .nombre_clase. (Ej .borde1)
- **a un elemento en concreto:** se pone un #nombre_elemento



Para llamar desde el html al archivo de "style.css" hay que poner en la cabercera la llamada al archivo

```jsp
<link rel="stylesheet" href="style.css">
```

**rel="stylesheet"** se utiliza para decirle al navegador que está importando una hoja de estilo.



Creamos un formulario en el index.jsp

![image-20250319115303493](/home/soa/.config/Typora/typora-user-images/image-20250319115303493.png)





Y aplicamos en el los estilos

Creamos la funcionalidad del boton que si mete el usuario y la contraseña correctamente abra otra pagina inicio.jsp. la funcionalidad la hacemos con javascript.

archivo inicio.jsp:

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>API</title>
<link rel="stylesheet" href="style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
<div class="container">
	<div class="borde1">
		<form action="" name="login">
			<label>Usuario</label><br>
			<input type="text" name="usuario" value=""><br>
			<label>Clave</label><br>
			<input type="text" name="password" value=""><br><br>
			<button type="button" class="btn btn-primary" onclick="Login()">ENVIAR</button>
		</form>
	</div>
</div>

<script type="text/javascript">
function Login(){
	var usuario = document.login.usuario.value;
	var password = document.login.password.value;
	
	if(usuario == "carlos" && password== "1234"){
		window.location = "inicio.jsp";
	}
}
</script>

</body>
</html>
```



Ahora vamos a utilizar header.jsp, este header no se ve por si solo, hay que aplicarle un jsp

-  Creamos otro archivo style2.css

- En inicio.jsp incluimos el header.jsp dentro del body

  ```jsp
  <body>
  <jsp:include page="header.jsp"></jsp:include>
  
  </body>
  ```

Añadimos en header.jsp

```jsp
<% 
	java.util.Calendar ahora = java.util.Calendar.getInstance();
	int hora = ahora.get(java.util.Calendar.HOUR_OF_DAY);
%>
```

**<% %>** Con estas etiquetas quiere decir que podemos meter código de java

**Diferencia entre <%= y <% en EJS**

EJS (Embedded JavaSript) es un lenguaje de templates para [expressJs](https://alejandrojs.wordpress.com/category/frameworks/expressjs/), el cual usa la sintaxis <%= %> para declarar sus funciones. Pero también habrás visto que se usa <% %> sin el =.

La diferencia principal entre uno y el otro es que <%= se usa para poner código que *mostrara algo en la pantalla*, mientras que <% se usa cuando se hará *solo lógica* con el código. Por ejemplo:

Para mostrar algo en la pantalla lo haríamos de esta forma:

```jsp
<% for (var i =0; i< posts.length; i++){ %>
 <li>
<%= posts[i].title %> - <i><%= posts[i].author %></i></li>
<% } %>
```

Mientras que para logica solamente lo hariamos de esta otra forma:

```jsp
<% if(cosaenEJS == 'mexico'){ %>
 <p>estas en /mexico</p>
<% } else{%>
 <p>no estas en /mexico</p>
<% } %>
```







Creamos carpeta en el proyecto webapp llamada JS

Creamos una pagina jsp con nombre reservacion.jsp y dentro de este archivo añadimos en el body

```jsp
<jsp:include page="header.jsp"></jsp:include>
```

En la página de reservacion.jsp vamos a crear una tabla

Desde la web de bootstrap en el panel izquierdo vamos a componentes -> modal y cogemos el segundo componente y copio el contenido de LIve demo y nos vamos a nuestro código de reservaciones.jsp y lo pegamos al final del body y cogemos la parte del boton y lo incluimos en el td

```
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
```

El código del modal donde está los "..." es donde vamos a poner nuestro código (es decir dentro de la clase "modal-body")



En modal title cambiamos el texto predefinido "Modal Title" por "Reservar" y delante le copiamos el código html de un icono que vamos a coger de la página web de bootstrap 



en el modal-body metemos el código que vamos a necesitar

```jsp

```





y añadimos al final el script para que coja el script

```
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
```



Creamos bar.jsp donde vamos a hacer unos enlaces y cada enlace posteriormente tendra su propio archivo.jsp. Añadimos en header.jsp en el enlace de bar la llamada a la pagina bar.jsp



Creamos una carpeta bar y dentro de la carpeta creamos un archivo ventas.jsp y una carpeta img donde voy a meter las fotos que corresponda y otra carpeta js



En el archivo ventas.jsp vamos a crear una tabla

Si queremos quitar el fondo de una imagen podemos utilizar remove bg https://www.remove.bg/es

Creamos en la carpeta js un archivo de tiipo js llamado funcion.js y dentro la función bebidas

Creamos un botón Ventas Dia que llamará a la función bebidas

Cuando se hace click en el botón muestra una ventana para introducir ![image-20250321125504581](/home/soa/.config/Typora/typora-user-images/image-20250321125504581.png)

![image-20250321125519312](/home/soa/.config/Typora/typora-user-images/image-20250321125519312.png)

Y cuando se pulse en el botón Aceptar de la ventana mostrará el valor introducido en la primera fila columna 2 que contiene id ="demo1"

Repetir el código para las demas columnas

En el parráfo en negro queremos mostrar el resultado de la suma de todos los valores que hemos introducido

Nota: en javascript no se puede sumar asi

```javascript
resultado=b1+b2+b3+b4+b5+b6+b7+b8;
```

Hay que hacerlo de esta manera:

```javascript
resultado=(Number(b1)+Number(b2)+Number(b3)+Number(b4)+Number(b5)+Number(b6)+Number(b7)+Number(b8));
```





Para utilizar un Control de versiones desde Eclipse Sobre el Proyecto botón derecho -> show in -> Terminal o Git

![image-20250327092757004](/home/soa/.config/Typora/typora-user-images/image-20250327092757004.png)

![image-20250328092927427](/home/soa/.config/Typora/typora-user-images/image-20250328092927427.png)



## Métodos de petición HTTP: GET

Con el método GET, los datos que se envían al servidor **se escriben en la misma dirección URL**. En la ventana del navegador, lo encontrarás así:

```none
www.ejemplo.com/registrarse.php?nombre=pedro&apellido=perez&edad=55&genero=hombre
```

Toda la información introducida por el usuario (los llamados “parámetros URL”) se transmiten tan abiertamente como el URL en sí mismo. Esto tiene ventajas y desventajas.

### Ventajas de GET

Los parámetros URL se pueden **guardar junto a la dirección URL como marcador**. De esta manera, puedes introducir una búsqueda y más tarde consultarla de nuevo fácilmente. También se puede volver a acceder a la página a través del historial del navegador.

Esto resulta práctico, por ejemplo, si visitas con asiduidad un mismo lugar en Google Maps o si guardas páginas web con configuraciones de filtro determinadas.

### Desventajas de GET

La mayor desventaja del método GET es su **débil** **protección de los datos**. Los parámetros URL que se envían quedan visibles en la barra de direcciones del navegador y son accesibles sin clave en el historial de navegación, en el caché y en el *log* de los servidores.

Otra desventaja es que su **capacidad es limitada**: dependiendo del servidor y del navegador, no es posible introducir más de 2000 caracteres. Además, los parámetros URL solo pueden contener caracteres ASCII (letras, números, signos, etc.) y no datos binarios como archivos de audio o imágenes.

## Métodos de petición HTTP: POST

El método POST introduce los parámetros **en la solicitud HTTP** para el servidor. Por ello, no quedan visibles para el usuario. Además, la capacidad del método POST es ilimitada.

### Ventajas de POST

En lo relativo a los datos, como, por ejemplo, al rellenar formularios con nombres de usuario y contraseñas, el método POST ofrece mucha **discreción**. Los datos no se muestran en el caché ni tampoco en el historial de navegación. La **flexibilidad** del método POST también resulta muy útil: no solo se pueden enviar textos cortos, sino también otros tipos de información, como fotos o vídeos.

### Desventajas de POST

Cuando una página web que contiene un formulario se actualiza (por ejemplo, cuando se retrocede a la página anterior) **los datos del formulario deben** **transferirse de nuevo** (puede que alguna vez hayas recibido una de estas advertencias). Por este motivo, existe el riesgo de que los datos se envíen varias veces por error, lo que, en el caso de una tienda online, puede dar lugar a pedidos duplicados. No obstante, las webs modernas de las tiendas suelen estar preparadas para evitar este tipo de problemas.

Además, los datos transferidos con el método POST no pueden **guardarse** **junto al URL como marcador**.

## Comparación entre los métodos GET y POST

|                                                        | GET                                                | POST                                                         |
| ------------------------------------------------------ | -------------------------------------------------- | ------------------------------------------------------------ |
| Visibilidad                                            | Visible en la barra de direcciones para el usuario | Invisible para el usuario                                    |
| Marcadores e historiales de navegación                 | Los parámetros URL se guardan junto al URL         | Los parámetros URL no se guardan junto al URL                |
| Caché y registro del servidor                          | Los parámetros URL se guardan sin cifrar.          | Los parámetros URL no se guardan automáticamente             |
| Comportamiento al actualizar el navegador o retroceder | Los parámetros URL no se envían de nuevo           | El navegador advierte de que los datos del formulario se enviarán de nuevo |
| Tipo de datos                                          | Solo caracteres ASCII                              | Caracteres ASCII y datos binarios                            |
| Longitud de datos                                      | Limitado al máximo del URL (2048 caracteres)       | Ilimitado                                                    |

## ¿Cuándo usar uno u otro?

El método **POST** es aconsejable cuando el usuario debe enviar datos o archivos al servidor, como, por ejemplo, cuando se rellenan formularios o se suben fotos.

El método **GET** es adecuado para la personalización de páginas web: el usuario puede guardar búsquedas, configuraciones de filtros y ordenaciones de listas junto al URL como marcadores, de manera que en su próxima visita la página web se mostrará según sus preferencias.

A modo de resumen:

- **GET** para la configuración de páginas web (filtros, ordenación, búsquedas, etc.)
- **POST** para la transferencia de información y datos



# Servlets

Un servlet es un objeto Java que puede procesar peticiones y retornar respuestas.

Habitualmente, esas peticiones y respuestas siguen el protocolo HTTP y permiten añadir funcionalidad dinámica a los servidores web.

Un servlet es un componente web basado en tecnología Java, gestionados por un contenedor...

Un contenedor de servlets es un parte de un servidor web de aplicaciones que

- ofrece servicios de red sobre los cuales se envían peticiones y respuestas.
- decodifica peticiones
- formatea respuestas
- contiene y gestiona el ciclo de vida de los servlets



**Las ventajas principales** de los servlets son las siguientes: 

-  **Portabilidad**: usan siempre las mismas llamadas (API) y corren sobre Java, por lo que son verdaderamente portátiles entre entornos (que soporten servlets). 
- **Potencia**: pueden usar todo el API de Java (excepto AWT), además de comunicarse con otros componentes con RMI, CORBA, usar Java Beans, conectar con bases de datos, abrir otros URL, etc … 
- **Eficiencia:** una vez cargado queda en la memoria del servidor como una única instancia. Varias peticiones simultáneas generan varios threads sobre el servlet, que es muy eficiente. Además, por estar cargado en memoria puede mantener su estado y mantener conexiones con recursos externos como bases de datos que pueden requerir un cierto tiempo para conectar. 
- **Seguridad**: además de la seguridad que introduce el lenguaje Java (gestión de memoria automática, ausencia de punteros, tratamiento de excepciones), el gestor de seguridad "security manager" puede evitar servlets malintencionados o mal escritos que podrían dañar al servidor web. 
- **Integración con el servidor**: pueden cooperar con el servidor en formas que los CGI no pueden, como cambiar el path del url, poner líneas de log en el servidor, comprobar la autorización, asociar tipos MIME a los objetos o incluso añadir usuarios y permisos al servidor. 





## [La clase HttpServlet](https://javaparajavatos.wordpress.com/2018/01/28/la-clase-httpservlet/)

La clase `**HttpServlet**` es una clase que implementa la interfaz `**Servlet,**` incorporando además métodos específicos para servidores Web. Un uso típico de `**HttpServlet**` es el procesamiento de formularios html. Creo que es bueno tener unas nociones básicas sobre el protocolo **HTTP** (*HyperText* *Transfer Protocol*), que es el protocolo de comunicaciones que se utiliza para un cliente (por ejemplo, un navegador que envíe peticiones a un servidor Web).

**HTTP** es un protocolo orientado a petición-respuesta. Una petición **HTTP** está formada por unos campos de cabecera y un cuerpo, que puede estar vacío. Una respuesta **HTTP** contiene un código de resultado y de nuevo, una cabecera y un cuerpo.

El método `service()` de la clase `HttpServlet` lanza diferentes peticiones a distintos métodos Java para sistemas de peticiones diferentes. Reconoce los métodos estándar en formato *HTTP/1.1* y no es conveniente sobrecargarlo en subclases, a no ser que se necesiten para implementar métodos adicionales. Los métodos de petición que reconoce son: `GET, HEAD, PUT, POST, DELETE, OPTIONS y TRACE` (cualquier otro método obtendrá como respuesta un error **HTTP**). Para cada uno de los métodos anteriores, Java lanza un método de tipo doXXX(). Por ejemplo, para `GET` lanza `doGet()`. Todos los métodos esperan dos parámetros

Los métodos `doOptions()` y `doTrace()` disponen de una implementación por defecto y no está permitido sobrecargarlos. El método `HEAD`, que se supone que devuelve las mismas líneas de cabecera que podría devolver el método `GET`, sin incluir el cuerpo. Así que todos los métodos que se pueden utilizar van a ser d`oGet(), doPut(), doPost(), doDelete()`, cuyas implementaciones por defecto en la clase `**HttpServlet**` devuelven un error **HTTP**. Cualquier subclase de **`HttpServlet`** debe sobrecargar uno o más de estos métodos para proporcionar la adecuada implementación de las acciones que desea realizar.



Los datos de la petición se pasan a todos los métodos como primer argumento de tipo **`HttpServletRequest`**, que es una subclase de la clase más general **`ServletRequest`**. Las respuestas que pueden crear los distintos métodos se devuelven en el segundo argumento de tipo **`HttpServletResponse`**, que es una subclase de **`ServletResponse`**

Cuando se solicita una página desde un navegador, se está utilizando el método `GET`. La petición `GET` no tiene cuerpo, es decir, el cuerpo de la petición está vacío. La respuesta debería contener un cuerpo con los datos de la página solicitada y campos de cabecera que describan la información que contiene el cuerpo. Son muy útiles los campos `Content-Type` y `Content-Encoding`.

A la hora de enviar datos de un formulario, por ejemplo, se puede utilizar tanto el método `GET` como `POST`. La diferencia entre uno y otro es que en una petición `GET` los parámetros se codifican en la URL, o dirección de la página, mientras que en una petición `POST` se transmiten en el cuerpo. Los editores HTML (y otras herramientas de descarga) utilizan peticiones `PUT` para descargar recursos de un servidor Web y luego peticiones `DELETE` para eliminar dichos recuros.



**El API de Servlets** 

Los servlets usan clases e interfaces de dos paquetes: javax.servlet que contiene clases para servlets genéricos (independientes del protocolo que usen) y javax.servlet.http (que añade funcionalidad particular de http). El nombre javax indica que los servlets son una extensión. 

Los servlets no tienen el método main() como los programas Java, sino que se invocan unos métodos cuando se reciben peticiones. Cada vez que el servidor pasa una petición a un servlet se invoca el método service() que habrá que rescribir (override). Este método acepta dos parámetros: un objeto petición (request) y un objeto respuesta. 

Los servlets http, que son los que vamos a usar, tienen ya definido un método service() que no hace falta redefinir y que llama a doXxx(), con Xxx el nombre de la orden que viene en la petición al servidor web: doGet(), doPost(), doHead(), etc… 



**Implementando un servlet http:**

protected void **doGet** (HttpServletRequest req, HttpSwervletResponse resp) throws ServletException, java.io.IOException

protected void **doPost** (HttpServletRequest req, HttpSwervletResponse resp) throws ServletException, java.io.IOException

![image-20250328121054645](/home/soa/.config/Typora/typora-user-images/image-20250328121054645.png)

A continuación veremos el código de un servlet http mínimo que genera una página HTML que dice "¡Hola Amigos!" cada vez que se invoca en el cliente web. 

```java
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class hola extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
     res.setContentType("text/html");
     PrintWriter out = res.getWriter();
     out.println("<html><big>¡Hola Amigos !</big></html>");
     } 
 }
```

El servidor extiende la clase HttpServlet y rescribe el método **doGet()**. Cada vez que el servidor web recibe una petición GET para este servlet, el servidor invoca su método doGet() pasándole un objeto con datos de la petición HttpServletRequest y con otro objeto HttpServletResponse para devolver datos en la respuesta. 

El método **setContentType**() del objeto respuesta (res) establece como text/html el contenido MIME de la respuesta. El método **getWriter()** obtiene un canal de escritura que convierte los caracteres Unicode que usa Java en el juego de caracteres de la operación HTTP (normalmente iso-8859-1). Ese canal se usa para escribir el texto HTML que verá el cliente web. 

Para poderlo ejecutar, hay que disponer de una máquina virtual Java (JVM), las clases de servlets, y un servidor web que soporte servlets. Vamos a usar la máquina virtual de Linux, y el servidor Tomcat. Un servidor web escrito en java que soporta servlets e incluye las clases necesarias. 

**Tomcat** implementa la especificación 2.2 de servlets. Trabaja con unidades llamadas webapps que pueden ser empaquetadas e instaladas en otros servidores. Una "webapp" es una aplicación completa que puede tener páginas web estáticas (ficheros html, gif, jpeg, etc.) y servlets. Los servlets están en el directorio Web-inf/classes. Allí para facilitar las cosas podemos dejar tanto el código fuente .java como el código compilado .class (el código fuente no se debería dejar en este lugar en un servidor real, se hace así por comodidad). 



Los servlets son aplicaciones donde el cliente es una página HTML y el servidor es un programa CGI (Common Gateway Interface) escrito en Java que ejecuta el servidor web. 

Los servlets son la respuesta de la tecnología Java a la programación CGI. Son programas que se ejecutan en un servidor Web y construyen páginas Web dinámicamente. Construir páginas Web al vuelo es útil por un número de razones: 

- La página Web está basada en datos enviados por el usuario. Por ejemplo, las páginas de resultados de los motores de búsqueda se generan de esta forma, y los programas que procesan pedidos desde sitios web de comercio electrónico también. 
- Los datos cambian frecuentemente. Por ejemplo, un informe sobre el tiempo o páginas de cabeceras de noticias podrían construir la página dinámicamente, quizás devolviendo una página previamente construida y luego actualizándola.
- Las páginas Web que usan información desde bases de datos corporativas u otras fuentes. Por ejemplo, usaríamos esto para hacer una página Web en una tienda on-line que liste los precios actuales y el número de artículos en stock.

 

**Introducción a servlets**

Los servlets atienden peticiones realizadas por páginas HTML. Estas peticiones son, fundamentalmente, de tipo GET y POST. Las peticiones GET son peticiones hechas por el navegador cuando el usuario teclea una URL en la línea de direcciones, sigue un enlace desde una página Web, o rellena un formulario que no especifica un METHOD. Los Servlets también pueden manejar peticiones POST muy fácilmente, que son generadas cuando alguien crea un formulario HTML que especifica METHOD="POST". 

Un servlet es una subclase de HttpServlet y la forma de atender peticiones GET y POST es sobrecarga doGet o doPost respectivamente. Estos métodos toman dos argumentos: un HttpServletRequest y un HttpServletResponse. 

- El HttpServletRequest tiene métodos que nos permiten encontrar información entrante como datos de un FORM, cabeceras de peticiòn HTTP, etc. 
- El HttpServletResponse tiene métodos que nos permiten especificar líneas de respuesta HTTP (200, 404, etc.), cabeceras de respuesta (Content-Type, Set-Cookie, etc.), y, todavía más importante, nos permiten obtener un PrintWriter usado para envíar la salida de vuelta al cliente.

Los servlest no forman parte de SDK y, por tanto, de las bibliotecas estándar de Java (paquetes java.*). Es necesario importar las extensiones javax.servlet (para HttpServlet, etc.), y javax.servlet.http (para HttpServletRequest y HttpServletResponse).

En servlets sencillos, la mayor parte del código consiste en sentencias System.out.println() que generan la página deseada. Los métodos doGet y doPost pueden propagar dos excepciones, por eso es necesario incluirlas en la declaración. También observamos que tenemos que importar las clases de los paquetes java.io (para PrintWriter, etc.), 

Una de las mejores características de los servlets Java es que la obtención de parámetros de formularios se maneja automáticamente. Simplemente llamamos al método getParameter de HttpServletRequest, y suministramos el nombre del parámetro como un argumento. Observa que los nombres de parámetros son sensibles a mayúsculas. 

El valor de retorno es un String correspondiente al valor uudecode de la primera ocurrencia del parámetro. Se devuelve un String vacío si el parámetro existe pero no tiene valor, y se devuelve null si no existe dicho parámetro. Si el parámetro pudiera tener más de un valor, como en el ejemplo anterior, deberíamos llamar a getParameterValues en vez de a getParameter. Este devuelve un array de strings. Finalmente, aunque en aplicaciones reales nuestros servlets probablemente tengan un conjunto específico de nombres de parámetros por los que buscar. Usamos getParameterNames para esto, que devuelve una Enumeration, cada entrada puede ser forzada a String y usada en una llamada a getParameter





Ejemplos de como crear un servlet desde Eclipse:

- Creamos un proyecto desde Eclipse con nombre servlets de tipo dynamic project y pulsamos botón derecho -> new Servlet ->

  ![image-20250328092416444](/home/soa/.config/Typora/typora-user-images/image-20250328092416444.png)

  ![image-20250328092525092](/home/soa/.config/Typora/typora-user-images/image-20250328092525092.png)

Automáticamente nos crea un archivo con los métodos que hemos seleccionado en la pantalla anterior

```java
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class Holamundo
 */
@WebServlet("/Holamundo")
public class Holamundo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Holamundo() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
```

Nos crea los métodos doGet y doPost

**¿Cómo se ejecutan los métodos?**

Dependiendo del tipo de petición que envíe el cliente, el servlet puede ejecutar el método `doGet()` (click en un link, acceder a una URL desde la barra de direcciones) o `doPost()` (login, envío de formulario). Para acceder a los datos de la petición se usa el objeto `HttpServletRequest` y para enviar la respuesta el objeto `HttpSevletResponse`.



Los archivos de servlets se guardan siempre dentro de la carpeta java.



Primero creamos un servlet Holamundo.java que imprima con html numeros del 1 a 100 en la web, para ello creamos el código correspondiente en el método doGet

```java
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
//		Vamos a imprimir (escribir) desde Java a la web (HTML)
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
//		Dentro de aqui vamos a trabajar como si fuese un archivo html
		out.println("</head>servlet1</head>");
		out.println("<body>");
		out.println("<h1 style='text-align:center'>hola mundo</h1>");
		for (int i=1; i<=1000; i++) {
			out.println(i);
			out.println(" - ");
		}
		out.println("</body>");
		out.println("</html>");
	}
```



Ahora Creamos un archivo de tipo servlet MyServlet.java y un archivo index.jsp 

En MyServlet.java

```java
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		// El botón de html creado en index.jsp va a llamar a este método
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		// no hay que poner todas las etiquetas de html, head, body,... como en holamundo.java por que ya van
		// ha estar contenidas en index.jsp
		out.println("<h1>Mensaje desde método doGet desde Servlet</h1>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<h1>Mensaje desde método doPost desde Servlet</h1>");
	}
```

En index.jsp va a hacer una petición al servlet cuando apriete por ejemplo un botón.

```jsp
<body>

	<p>Hola, este texto se escribe desde la página JSP con servlet </p>
	
	<!-- en action va el nombre del archivo sin extensión   -->
	<form action="MyServlet" method="GET">
		<!--tipo submit por que va a enviar una información  -->
		<button type="submit">Get Mensaje</button>
	</form>
	
	<form action="MyServlet" method="POST">
		<!--tipo submit por que va a enviar una información  -->
		<button type="submit">Post Mensaje</button>
	</form>
</body>
```

![image-20250328101912102](/home/soa/.config/Typora/typora-user-images/image-20250328101912102.png)

Si pulso en getMensaje muestra 

![image-20250328101931968](/home/soa/.config/Typora/typora-user-images/image-20250328101931968.png)

Si pulso en postMensaje muestra por que se va al método post del archivo MyServlet

![image-20250328101959990](/home/soa/.config/Typora/typora-user-images/image-20250328101959990.png)



Si se envia por post los valores recogidos en el formulario no aparecen en la url

![image-20250328111428739](/home/soa/.config/Typora/typora-user-images/image-20250328111428739.png)

Si se envian por get los valores recogidos en el formulario se envian en la url

![image-20250328111523233](/home/soa/.config/Typora/typora-user-images/image-20250328111523233.png)













Paginas de documentación :

https://www.htmlhelp.com/es/reference/css/style-html.html