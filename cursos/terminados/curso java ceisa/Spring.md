# Spring

**Es un framework de código abierto que da soporte para el desarrollo de aplicaciones y páginas webs basadas en Java**. Se trata de uno de los entornos más populares y ayuda a los desarrolladores back-end a crear aplicaciones con un alto rendimiento empleando objetos de java sencillos.

Las aplicaciones se ejecutan en la **máquina virtual Java (JVM)**



## Instalación de Spring

1. Hay que tener instalado el JDK 

   ![image-20250421132639968](/home/soa/.config/Typora/typora-user-images/image-20250421132639968.png)

2. Buscamos en https://spring.io/tools hay diferentes versiones para diferentes editores, para visual studio code, para eclipse

3. Descargamos el spring boot para eclipse (este tendría contenido eclipse y es más completo que el de la versión para vscode) 

   ![image-20250421132619999](/home/soa/.config/Typora/typora-user-images/image-20250421132619999.png)

   Lo descargamos y ejecutamos el ejecutable:

   ![image-20250421132734349](/home/soa/.config/Typora/typora-user-images/image-20250421132734349.png)



## ¿Qué es Spring Boot?

Es un proyecto que se basa en la parte superior de Spring Framework. Proporciona una forma más fácil y rápida de instalar, configurar y ejecutar aplicaciones sencillas y basadas en la web.

Es un módulo de Spring que proporciona la función **RAD (Desarrollo Rápido de Aplicaciones)** a Spring Framework. Se utiliza para crear una aplicación independiente basada en Spring que puede ejecutar simplemente porque necesita una configuración mínima de Spring.

Lo creó Rod Johnson





Java Spring Boot (Spring Boot) es una herramienta que hace que el desarrollo de a**plicaciones web y microservicios** con Spring Framework sea **más rápido y fácil** a través de tres funcionalidades principales:

1. Configuración **automática**
2. Un **enfoque obstinado** de la configuración
3. La capacidad de **crear aplicaciones independientes**

Estas características funcionan juntas para brindarle una herramienta que le permite configurar una aplicación basada en Spring con una **configuración y preparación mínimas**



## Spring Framework Stereotype Annotations

### @Component

Esta anotación se usa en clases para indicar un componente Spring. Marca la clase Java como un bean o componente para que el mecanismo de exploración de componentes de Spring pueda agragarla al contexto de la aplicación.

### @Controller

Esta anotación se usa para indicar que la clase es un controlador Spring. Se puede utilizar para identificar controladores para Spring MVC o Spring WebFlux

### @Service

Esta anotación se usa en una clase que realiza algún servicio, como ejecutar lógica de negocios, realizar cálculos y llamar a API externas. Esta anotación es una forma especializada de la anotación **@Component** destinada a ser utilizada en la capa de servicio.

### @Repository

Esta anotación se utiliza en clases Java que acceden directamente a la base de datos. Funciona como un marcador para cualquier clase que cumpla la función de repositorio u Objeto de acceso a datos.

Esta anotación tiene una función de traducción automática. Por ejemplo cuando ocurre una excepción en el **@Repository**, hay un controlador para esa excepción y no es necesario agregar un bloque try-catch.



## Spring MVC and REST Annotations

### @Controller

Esta anotación se utiliza en clases Java que desempeñan el papel de controlador en su aplicación. La anotación @Controller permite la autodetección de clases de componentes en el classpath y las definiciones de bean de registro automático para ellas. Para habilitar la detección automática de dichos controladores anotados, puede agregar el escaneo de componentes a su configuración. 

La clase Java anotada con @Controller es capaz de manejar múltiples asignaciones de solicitudes.

Esta anotación se puede usar con Spring MVC y Spring WebFlux.

### @RequestMapping

Esta anotación se usa tanto a nivel de clase como de método. La anotación @RequestMapping se utiliza para asignar solicitudes web a clases de manejador y métodos de manejador específicos. Cuando @RequestMapping se usa a nivel de clase, crea un URI base para el que se usará el controlador. Cuando esta anotación se utiliza en los métodos, le dará el URI en el que se ejecutarán los métodos del controlador. A partir de esto, puede inferir que la asignación de la solicitud a nivel de clase seguirá siendo la misma, mientras que cada método de controlador tendrá su propia asignación de solicitud.

A veces es posible que desee

https://mvitinnovaciontecnologica.wordpress.com/2020/02/06/guia-de-anotaciones-de-spring-framework/





Pasos para crear una aplicación con Spring Boot:

- Páginas Estáticas:

  - New->Spring Starter Project

    ![image-20250421132824533](/home/soa/.config/Typora/typora-user-images/image-20250421132824533.png)

    Le damos el nombre al proyecto, 

    Utilizaremos Maven como herramienta de gestión de proyecto (se utiliza comúnmente para administrar las dependencias, compilar el código fuente, empaquetar el proyecto y gestionar otras tareas relacionadas con la construcción de software)

    ![image-20250421132931756](/home/soa/.config/Typora/typora-user-images/image-20250421132931756.png)

  - Seleccionamos las dependencias que deseamos incluir en el proyecto. Spring Boot ofrece una amplia gama de dependencias para diferentes funcionalidades como acceso a bases de datos, seguridad, web, etc. Según el tipo de proyecto seleccionaremos unas u otras dependencias.

    Para crear un servidor de páginas estáticas debemos seleccionar la dependencia "Spring Web" y finalizamos.

    ![image-20250421133412366](/home/soa/.config/Typora/typora-user-images/image-20250421133412366.png)

  Cuando ya tenemos creado nuestro proyecto, vemos la estructura de carpetas que propone "Spring Boot":

  ![image-20250421133747536](/home/soa/.config/Typora/typora-user-images/image-20250421133747536.png)

  - src/main/java: contiene el código fuente de nuestra aplicación Java. Aquí es donde se ubican los controladores, modelos, servicios y otras clases Java.

  - src/main/resources/: Esta carpeta contiene recursos no relacionados con el código fuente, como archivos de configuración, archivos de propiedades, archivos de plantillas y archivos estáticos.

    - carpeta static:  se utiliza para almacenar recursos estáticos como archivos CSS, JavaScript e imágenes. Ej: la página estática html irá situada en esta carpeta 

      Para crear "index.html" en la carpeta static, pulsamos botón derecho dentro de dicha carpeta y pulsamos New->File y lo llamamos "index.html" (es importante que se llame así, ya que Tomcat retorna dicho archivo cuando accedemos al sitio web sin especificar un recurso específico http://localhost:8080)

      ![image-20250421165055952](/home/soa/.config/Typora/typora-user-images/image-20250421165055952.png)

      Codificamos una pequeña página HTML en index.html:

      ```html
      <!DOCTYPE>
      <html>
      	<head>
      		<meta charset="UTF-8">
      		<title></title>
      	</head>
      	<body>
      		<h1>CHISTE DEL DIA</h1>
      		<p>¿Porque el libro de matemáticas siempre está triste?
      			Por que tiene demasiados problemas
      		</p>
      	</body>
      </html
      ```

      

    - carpeta templates: para almacenar plantillas de vistas si estás utilizando un motor de plantillas como Thymeleaf o FreeMarker.

  - El archivo pom.xml hay es donde se colocan las instancias para la ejecución de las aplicaciones.

  - En application.properties podemos cambiar el puerto si nos da error con que el puerto está ocupado.

    ```java
    server.port=8082
    ```

    

- Páginas Dinámicas: Creamos el proyecto igual que el de páginas estáticas con la diferencia que cuando seleccionamos las dependencias, ademas de "Spring Web" seleccionamos "Thymeleaf"

  - New->Spring Starter Project, le damos el nombre al proyecto, de tipo maven (Idem a las estáticas)

  - Seleccionamos las dependencias "Spring Web" y "Thymeleaf" y finalizamos. (en la parte superior quedan visibles las últimas dependencias usadas en proyectos anteriores)

    ![image-20250421170705941](/home/soa/.config/Typora/typora-user-images/image-20250421170705941.png)

    **Thymeleaf** es un motor de plantillas para aplicaciones web Java que se integra muy bien con el framework Spring Boot. Proporciona una manera de crear vistas HTML dinámicas fácilmente en aplicaciones Spring, permitiendo la incorporación de expresiones y atributos en el código HTML que pueden ser evaluados en el lado del servidor.

  - En la carpeta por defecto src/main/java paquete com.example.demo se crea automática un archivo .java con el nombre del proyecto. 

    Esta es la clase principal de la aplicación Spring Boot, donde se encuentra el método **main**. Este método es el punto de entrada principal de la aplicación:

    ![image-20250421171504418](/home/soa/.config/Typora/typora-user-images/image-20250421171504418.png)

    El método main tiene la siguiente llamada:

    ```java
    SpringApplication.run(NombreProyectoApplication.class,arg);
    ```

    El método estático "**run**" inicia la aplicación Spring Boot. Toma dos argumentos:

    -  La clase principal de la aplicación (Proyecto002Application.class)
    - Argumentos de línea de comandos (args).

    Esta línea es responsable de iniciar el contenedor de Spring y desplegar la aplicación Spring Boot.

  

  Si probamos sin hacer cambios y ejecutamos como en el ejemplo anterior (pagina estática), vemos que el servidor Tomcat esta activo y nos retorna una mensaje de que no hay página que pueda devolver el servidor:

  ![image-20250421172055594](/home/soa/.config/Typora/typora-user-images/image-20250421172055594.png)

   Para solucionarlo de la forma más sencilla, modificamos el código del archivo con:

  ```java
  package com.example.demo;
  
  /*Vamos a crear un programa que actualice los chistes*/
  
  import java.util.ArrayList;
  import java.util.List;
  
  import org.springframework.boot.SpringApplication;
  import org.springframework.boot.autoconfigure.SpringBootApplication;
  
  //Importamos esto para trabajar como MVC
  import org.springframework.stereotype.Controller;// Para los controladores
  import org.springframework.ui.Model;// Para los modelos
  import org.springframework.web.bind.annotation.GetMapping;// Para la vista
  
  @Controller // Para el controlador
  @SpringBootApplication
  public class Proyecto2Application {
  
  	public static void main(String[] args) {
  		SpringApplication.run(Proyecto2Application.class, args);
  	}	
  
  	@GetMapping("/")
  	public String inicio(Model model) {
  		// Creamos una lista que vaya cogiendo cada chiste 
  		List<String> chiste = new ArrayList<>();
  		
  		chiste.add("1.¿Que le dice un 0 a un 8? Bonito cinturón");
  		chiste.add("2.¿Que hace una abeja en el gimnasio? Zumba");
  		chiste.add("3.¿Que le dice un gusano a otro? Voy a dar una vuelta a la manzana");
  		chiste.add("4.Que le dice un 0 a un 8, Bonito cinturón");
  		
  		String chisteAzar = chiste.get((int)(Math.random()*chiste.size()));
  		
  		model.addAttribute("chiste",chisteAzar);
  		
  		return "index";// retorna el nombre de la vista, estará contenida en templates
  	}
  	
  	// Por ahora este programa no funcionaría mientras no se le crea una vista
  }
  ```
  
  
  
- **@Controller**: anota la clase como un controlador de Spring MVC.
  
- **@GetMapping("/"):** Anotación que mapea la URL raíz del sitio web ("/") a este método de controlador.
  
  Luego cuando desde el navegador ingresemos la raíz del sitio.
  
  ```web-idl
    http://www.localhost:8080/
  ```
  
  Se ejecuta el método Java llamado "inicio".
  
  ```java
    model.addAttribute("chiste", chisteAzar);
  ```
  
  Agrega el chiste seleccionado al modelo, que se pasará a la vista. 
  
  ```java
    return "index"
  ```
  
  Accedemos desde la página HTML a "chiste". Devuelve el nombre de la vista que se debe renderizar, en este caso, la vista se llama "index".
  
- en src/main/resources/templates creamos la vista index.html (cuidado no en la carpeta static)
  
  ```html
    <!DOCTYPE html>
    <html>
    	<head>
    		<meta charset="UTF-8">
    		<title>Proyecto </title>
    	</head>
    	<body>
    		<h1>CHISTES:</h1>
    		<!--Nos traemos el contenido del modelo-->
    		<p th:text="${chiste}"></p>
    	</body>
    </html>
  ```
  
  **th:text=${chiste}:** Esta es una expresión de Thymeleaf. Thymeleaf proporciona un conjunto de atributos especiales que se pueden utilizar en elementos HTML para vincular datos del modelo de la aplicación a la vista. 
  
  En este caso, th:text es un atributo especial que se utiliza para establecer el texto dentro del elemento HTML.
  
  ${chiste} es una expresión de Thymeleaf que se interpreta como una referencia al atributo chiste del modelo de la aplicación (model.addAtribute("chiste",chisteAzar)).
  
  Esto significa que el texto dentro del párrafo se establecerá dinámicamente en función del valor de la variable chiste que se pasa desde el controlador al modelo y luego a la vista. 
  
- Ahora si ejecutamos la aplicación vemos que nos muestra chistes distintos cada vez que actualizamos la página web.
  
  ![image-20250422005735070](/home/soa/.config/Typora/typora-user-images/image-20250422005735070.png)
  
  

Para iniciar el servidor, seleccionamos el proyecto y hacemos clic con el botón derecho Run AS -> Spring Boot App

![image-20250421165342204](/home/soa/.config/Typora/typora-user-images/image-20250421165342204.png)

Ya tenemos iniciado el servidor, podemos ver en la consola que Tomcat está escuchando peticiones web en el puerto 8080 (o el que tengamos configurado):

![image-20250421165440937](/home/soa/.config/Typora/typora-user-images/image-20250421165440937.png)



Para lanzar el navegador hacemos doble clic en la ventana "Boot Dashboard" sobre el proyecto con la flecha hacia arriba. (No es recomendable lanzar varios proyectos a la vez).

![image-20250421165615837](/home/soa/.config/Typora/typora-user-images/image-20250421165615837.png)

Cada vez que modificamos las páginas HTML y otros archivos estáticos como puede ser *.js, *.css, etc, debemos guardar los archivos y en el "Boot Dashboard" procedemos a reiniciar el servidor web, presionando el icono:

![image-20250421165753950](/home/soa/.config/Typora/typora-user-images/image-20250421165753950.png)





Ejemplos:



Creamos un nuevo proyecto de tipo Spring Starter Project: New-> Spring Starter Project 

![image-20250411125556574](/home/soa/.config/Typora/typora-user-images/image-20250411125556574.png)

Ponemos el nombre del proyecto a crear, ejemplo "Proyecto3" y cambiamos en type a Maven

![image-20250411120954824](/home/soa/.config/Typora/typora-user-images/image-20250411120954824.png)

Para crear páginas estáticas seleccionamos en Web -> Spring Web

![image-20250411121053075](/home/soa/.config/Typora/typora-user-images/image-20250411121053075.png)

Finish

![image-20250411121110823](/home/soa/.config/Typora/typora-user-images/image-20250411121110823.png)

Debe aparecer el nombre del proyecto con mv y boot, si desplegamos el proyecto

![image-20250411121210200](/home/soa/.config/Typora/typora-user-images/image-20250411121210200.png)

![image-20250411121306179](/home/soa/.config/Typora/typora-user-images/image-20250411121306179.png)

Arrancar el servidor para ello > Sobre el nombre del proyecto -> boton derecho -> Run As -> Spring Boot App

![image-20250411121935740](/home/soa/.config/Typora/typora-user-images/image-20250411121935740.png)

Para arrancar la web (index.html) pulsamos sobre local de abajo a la izquieda y pulsamos doble click sobre en nombre del proyecto con una flecha hacia arriba

![image-20250411122802576](/home/soa/.config/Typora/typora-user-images/image-20250411122802576.png)

Si da error con el puerto al ejecutar el servidor hay que cambiar la configuración del puerto, para ello pulsar Ctrt+Shift+R y buscamos application.propierties y escribimos

Información sacada de : https://blog.marcnuri.com/como-cambiar-el-puerto-en-spring-boot

```
spring.application.name=Proyecto3
server.port=8082
```

Una vez solucionado el problema abajo en local nos aparecerá una flecha hacia arriba

![image-20250411125109384](/home/soa/.config/Typora/typora-user-images/image-20250411125109384.png)





**Para crear páginas dinámicas:**

![image-20250411133058673](/home/soa/.config/Typora/typora-user-images/image-20250411133058673.png)

**Thymeleaf** es un motor de plantillas, trabajaríamos con una forma de MVC

Ahora trabajaríamos con la carpeta "src/main/java"

![image-20250411133338032](/home/soa/.config/Typora/typora-user-images/image-20250411133338032.png)

Si iniciamos el servidor y ejecutamos nos muestra el error en la web por que no tenemos creado todavía ninguna.

![image-20250411133455115](/home/soa/.config/Typora/typora-user-images/image-20250411133455115.png)









Creamos un Proyecto3

en la carpeta src/main/java vamos a crear una carpeta model (New->Folder->model) donde vamos a guardar los modelos y creamos una clase llamada Chiste.java (New->Class)

Chiste.java (este es el modelo)

```java
package com.example.demo.model;

public class Chiste {
	private String texto;
	
	// Creamos el controlador
	public Chiste (String texto) {
		this.texto = texto;
	}
	
	public String getTexto() {
		return texto;
	}
	
	public void setTexto(String texto) {
		this.texto = texto;
	}
}
```

Creamos otra carpeta para los controladores (botón derecho New->Folder, sobre la carpeta com.example.demo): y sobre esta carpeta creamos la clase ChisteController.java (botón derecho New->Class)





Ahora creamos la vista en la carpeta /src/main/ 











PENDIENTE:

Practica 3
Crear una pagina dinámica donde:
Mediante un botón nos dirija a otra página de tipo jSP





## MVC

El marco Spring Web MVC proporciona una arquitectura de modelo-vista-controlador y componentes listos que se pueden usar para desarrollar aplicaciones web flexibles y de acoplamiento flexible. El patrón MVC da como resultado  la separación de los diferentes aspectos de la aplicación (lógica de entrada, lógica de negocios y lógica de interfaz de usuario), al tiempo que proporciona un acoplamiento flexible entre estos elementos.

![image-20250422112712306](/home/soa/.config/Typora/typora-user-images/image-20250422112712306.png)

Nota:

#### 1. ¿Qué es la lógica en programación?

Imagina que el código que escribimos es como un camino. Lo deseable es que ese camino sea recto y no haya bifurcaciones. Cuanto más recto sea el camino, más fácil será seguirlo y en consecuencia, entenderlo.

**Cuando el camino se bifurca nos obliga a usar memoria y comprensión**. "*Si pasa esto voy por aquí"*, pero "*si pasa esto otro voy por allá"*. Al escoger una bifurcación, memorizamos el lugar por el que nos hemos desviado para, más adelante, volver e investigar qué hay por el otro camino.

Estas desviaciones las implementamos con cláusulas ***if's\***.

La lógica en programación es el conjunto de todos estos ***if's***, o decisiones que debe tomar nuestro código en función de los inputs recibidos.

Pero no toda la lógica que escribimos tiene las mismas características. Es importante distinguir entre:

- **Lógica de negocio:** reglas y procesos que definen cómo una aplicación interactúa con los datos y realiza las operaciones necesarias para cumplir con las necesidades de la empresa. Es el "cerebro" de la aplicación, que determina cómo se manipulan y procesan los datos en respuesta a las interacciones del usuario. 

  Toma decisiones en función de conceptos reales y que utiliza el vocabulario que un experto en la materia utilizaría en su día a día. En un CRM (proceso de desarrollar, personalizar y mantener sistemas de gestión de relaciones con el cliente).

  Una aplicación para almacenes tomará decisiones en función de la recepción/envío de productos. Este tipo de lógica es la más importante y la más complicada.

  Se suele colocar en la capa más interna de la aplicación, la denominada capa de dominio y debería estar aislada de cualquier referencia externa como la base de datos, el sistema de archivos o una api de terceros.

  Ejemplo: pongamos que queremos pagar una factura. La lógica de negocio hará lo siguiente:

  - Dada una factura, validará que se cumplan ciertas condiciones, como por ejemplo, que no esté pagada, y se cambiará su estado a "pagada". Su misión no es contactar con la api del banco y realizar la transferencia. Su misión es, por un lado, representar que mi modelo abstracto de factura está pagado, y por otro, que se cumplan unas pre-condiciones antes de realizar el cambio y unas post-condiciones después del cambio. 
  - Con el stock de un almacén quizá sea más claro. Si envío un producto a un cliente, resto stock del producto, pero mi aplicación no está enviando el producto en el camión. La aplicación comprobará si hay stock suficiente antes de enviar el producto.

  La lógica de negocio son todas estas decisiones, a nivel abstracto, que están pasando en  el mundo real. Ejemplos:

  - Calcular el total de una factura incluyendo los impuestos.
  - Inscribir a un alumno en una clase.
  - Planificar un proyecto.
  - Cerrar una incidencia.
  - Calcular los gastos de envío.
  - Reservar una habitación.

- **Lógica de aplicación (**lógica de servicios): su misión principal es preparar el contexto necesario y coordinar las decisiones que toma la lógica de negocio. Es una lógica de tipo técnico.

  Por ejemplo, imagina que usamos una base de datos para persistir el estado de la aplicación. Cualquier decisión que tome nuestra aplicación para guardar o recuperar datos de la base de datos será puramente técnica, no estará relacionada con el modelo conceptual de negocio.

  Las decisiones de lógica de aplicación suelen ser sencillas, y el camino que sigue el código ha de ser casi recto, sin bifurcaciones. La mayoría de bloques con este tipo de lógica tienen la siguiente estructura:

  - Llamada externa a la aplicación. Por ejemplo, recuperar registros de la base de datos.
  - Llamada interna a nuestra capa de negocio. Cambia el estado del sistema.
  - Otra llamada externa. Por ejemplo, guardar los cambios que hemos realizado.

  En programación funcional, a estos bloques de código se les llama "impureim sandwich" o "métodos bocadillo". El concepto "impura/pure/impure sandwich" se refiere a conceptos funcionales teniendo en cuenta que las funciones se pueden dividir entre puras e impuras.

  Durante años se ha explicado que la lógica de negocio va en los servicios. Esto se basa en el modelo de capas en que el proyecto cliente depende del proyecto servicio y a su vez este depende de un proyecto de datos. Todo queda acoplado a los datos y además estos representan un modelo anémico.

  El código resultante de esta arquitectura presenta numerosas limitaciones desde el punto de vista de la mantenibilidad, usando métodos bocadillo genera código mantenible y fácil de modificar. 

  Ejemplo de método de la capa de aplicación o servicio:

  ```java
  public async Task<Result> PagarFacura(int facturaId)
  {
        var factura = await _database.Facturas.FindAsync(facturaId); // Bocadillo - > parte superior
  
        if (factura is null) // lógica de aplicación
        {
          return Result.Failure($"Factura con id {facturaId} no encontrada");
        }
  
        var pago = factura.Pagar(); // llamada a la capa de negocio. Dentro se aplica lógica de negocio
  
        if(pago.IsFailure) // lógica de aplicación para salir del camino principal
        {
           return Result.Failure(pago.Error);
        }
  
        await _database.SaveChangesAsync(); // Bocadillo - > parte inferior
  
        return Result.Success();
  }
  ```

  El camino que toma el código es prácticamente recto. Las bifurcaciones solo controlan casos no deseados, como que no se encuentre la factura en la base de datos o que el pago no se realice por el motivo que sea.

  Podríamos añadir más lógica de aplicación, como por ejemplo comprobar si el usuario tiene los permisos necesarios para realizar la acción, o llamar a una api del banco para realizar la transferencia realmente. Ejemplos de lógica de aplicación:

  - Recuperar una factura de base de datos y comprobar si existe.
  - Guardar datos en base de datos.
  - Guardar un fichero en una carpeta.
  - Verificar si el usuario tiene permiso para realizar la acción.
  - Guardar la traza de la acción realizada por el usuario.

- **Lógica de pantalla**: Es aquella que toma decisiones sobre los elementos que se muestran en la pantalla y las interacciones que realiza el usuario. Por ejemplo, decide si un botón aparece o no aparece en la pantalla.

  Imagina que en función del estado de la factura y los permisos del usuario se debe mostrar el botón de pagar. En cualquier otro caso el botón no debe aparecer en la pantalla.

  ```html
  <!-- un archivo .cshtml cualquiera -->
  @if (Model.Factura.Estado == EstadoFactura.Pendiente && User.TienePermiso(Permiso.PagarFacturas))
  {
   	<button class="btn btn-primary">Pagar factura</button>
  }
  ```

  La lógica de la pantalla puede llegar a ser muy complicada. Para estos casos conviene generar un modelo único para la pantalla y encapsular las decisiones en propiedades del modelo:

  ```html
  <!-- un archivo .cshtml cualquiera -->
   @if (Model.MostrarBotonPagar)
   {
   <button class="btn btn-primary">Pagar factura</button>
   }
  ```

  Esto es posible si creamos la propiedad MostrarBotonPagar y la inicializamos de la siguiente manera.

  ```html
  // el archivo .cshtml.cs correspondiente
  MostrarBotonPagar = Model.Factura.Estado == EstadoFactura.Pendiente && User.TienePermiso(Permiso.PagarFacturas);
  ```

  De un modo u otro, la lógica de pantalla es la que controla qué elementos pueden aparecer en ella, así como las interacciones que realiza el usuario.

Conclusión:

Saber que tipo de lógica estamos tratando nos ayuda a saber dónde colocar bloques de código y a generar una arquitectura mantenible.

La comunicación es uno de los costes más importantes en el desarrollo de software y a menudo no se tiene en cuenta. 





### ¿Cómo funciona?

- Después de recibir una solicitud HTTP, DispatcherServlet consulta el **HandlerMapping** para llamar al Controller adecuado.
- El controlador toma la solicitud y llama a lo métodos de servicio apropiados en función del método **GET** o **POST** utilizado. El método de servicio establecerá los datos del modelo en función de la lógica de negocios definida y devuelve el nombre de la vista a DispatcherServlet.
- DispatcherServlet tomará la ayuda de **ViewResolver** para recoger la vista definida para la solicitud.
- Una vez finalizada la vista, DispatcherServlet pasa los datos del modelo a la vista, que finalmente se representa, en los navegadores.



**¿Cómo funciona en mi proyecto?**

![image-20250422113120135](/home/soa/.config/Typora/typora-user-images/image-20250422113120135.png)

Creamos un proyecto, desde el menú de opciones seleccionamos File -> New -> Spring Starter Project.

En el primer diálogo definimos el nombre de nuestro proyecto "". Utilizamos Maven como herramienta de gestión de proyecto.

En el segundo diálogo seleccionamos las dependencias "Spring Web" y "Thymeleaf".

Ahora en el paquete "com.example.demo" creamos la carpeta "model" presionando el botón derecho New->Folder.

En la carpeta "model" creamos la clasae Chiste.java , botón derecho sobre la carpeta model New->Class.

El código de la clase Chiste.java es:

```java
package com.example.demo.model;

public class Chiste {
	private String texto;
	
	// Creamos el controlador
	public Chiste (String texto) {
		this.texto = texto;
	}
	
	public String getTexto() {
		return texto;
	}
	
	public void setTexto(String texto) {
		this.texto = texto;
	}
}
```

Ahora nuevamente en el paquete "com.example.demo" creamos la carpeta "Controller", presionando el botón derecho New->Folder.

Dentro de la carpeta "Controller" creamos la clase ChisteController.java, cuyo código es:

```java
package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.model.Chiste;// importamos nuestro modelo

// Declaramos controller
@Controller
public class ChisteController {

	// internamente hacemos el mapeo de la raiz
	@GetMapping("/")
	public String inicio(Model model){
		List<Chiste> chiste = new ArrayList<>();
		chiste.add(new Chiste("¿Que le dice un cero a un 8? Bonito cinturón"));
		chiste.add(new Chiste("¿Que hace una abeja en el gimnasio? Zumba"));
		chiste.add(new Chiste("¿Cuál es el colmo de un electricista? Qué su hijo sea"));
		chiste.add(new Chiste("¿Por qué estás hablando con la pared? Por que la mesa"));
		
		Chiste chisteAzar = chiste.get((int)Math.random()*chiste.size());
		
		model.addAttribute("chiste", chisteAzar);
		
		return "index";
	}
}
```

La anotación @Controller indica que esta clase es un controlador de Spring MVC. Esto significa que puede manejar solicitudes HTTP entrantes.

```java
@GetMapping("/")
public String inicio(Model model)
```

El método "inicio" maneja solicitudes HTTP GET a la raíz del contexto de la aplicación ("/"). Es decir, cuando alguien accede a la página principal de la aplicación, este método se ejecuta.

Toma un objeto Model como parámetro, que es utilizado para pasar datos a la vista.

```java
List<Chiste> chiste = new ArrayList<>();
chiste.add(new Chiste("¿Que le dice un cero a un 8? Bonito cinturón"));
chiste.add(new Chiste("¿Que hace una abeja en el gimnasio? Zumba"));
chiste.add(new Chiste("¿Cuál es el colmo de un electricista? Qué su hijo sea"));
chiste.add(new Chiste("¿Por qué estás hablando con la pared? Por que la mesa"));

Chiste chisteAzar = chiste.get((int)Math.random()*chiste.size());
```

En este bloque se crea una lista de chistes (chistes) y se agregan instancias de la clase Chiste a esta lista.

Luego, se selecciona un chiste aleatorio de la lista usando un índice generado aleatoriamente.

```java
model.addAtribute("chiste", chisteAzar);
return "index";
```

Se agrega el chiste aleatorio al objeto Model con el nombre "chiste". 

Se devuelve el nombre de la vista que se mostrará al usuario. En este caso, la vista se llama index.html.

Creamos la vista en la carpeta "template" con nombre index.html, cuyo código fuente es:

```html
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Proyectos</title>
	</head>
	<body>
		<h1>Chiste:</h1>
		<!--Nos traemos el contenido del modelo-->
		<p th:text="${chiste.texto}"></p>				
	</body>
</html>
```









## MVC y SERVICIOS

El patrón MVC (Modelo-Vista-Controlador) no incluye explícitamente la capa de Servicios (Services). Sin embargo, en muchas implementaciones de MVC, especialmente en Spring Boot, se utiliza una capa de Servicios para manejar la lógica de negocio de la aplicación.

![image-20250422102921654](/home/soa/.config/Typora/typora-user-images/image-20250422102921654.png)

Desde el menú de opciones seleccionamos File->New->Spring Starter Proyect

En el primer diálogo procedemos a definir el nombre de nuestro proyecto. Utilizaremos Maven como herramienta de gestión de proyecto.

En el segundo diálogo seleccionamos las dependencias "Spring Web" y "Thymeleaf" 

Ahora en el paquete "com.example.demo" creamos la carpeta model, presionando el botón derecho del mouse y New->Folder, 

En la carpeta model creamos la clase Chiste (boton derecho New->Class), cuyo código es:

Chiste.java

```java
package com.example.demo.model;

public class Chiste {
	private String texto;
	
	public Chiste (String texto) {
		this.texto = texto;
	}
	
	public String getTexto() {
		return texto;
	}
	
	public void setTexto(String texto) {
		this.texto = texto;
	}
}
```

Ahora lo nuevo con respecto al proyecto anterior consiste en crear un servicio. Procedemos a presionar con el botón derecho el paquete "com.example.demo" y crear la carpeta "service".

![image-20250422103929851](/home/soa/.config/Typora/typora-user-images/image-20250422103929851.png)

![image-20250422104009714](/home/soa/.config/Typora/typora-user-images/image-20250422104009714.png)

En la carpeta service creamos la clase ChisteService:

![image-20250422104057515](/home/soa/.config/Typora/typora-user-images/image-20250422104057515.png)

El código de la clase ChisteService.java es:

```java
package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.model.Chiste;

@Service
public class ChisteService {
	private List<Chiste> chistes;
	
	public ChisteService() {
		chistes = new ArrayList<>();
		chistes.add(new Chiste("¿Qué le dice un 0 a un 8?Bonito cinturón."));
		chistes.add(new Chiste("¿Qué hace una abeja en el gimnasio?Zumba"));
		chistes.add(new Chiste("¿Cuál es el colmo de un electricista? Que su hijo sea un ."));
		chistes.add(new Chiste("¿Por qué estás hablando con la pared?.Por que la mesa "));
	}
	
	public Chiste obtenerChisteAleatorio() {
		return chistes.get((int)(Math.random()*chistes.size()));
	}
}
```

La anotación @Service en Spring es una de las varias anotaciones que se utilizan para definir los componentes de una aplicación.

Un componente de servicio en Spring generalmente se utiliza para alojar la lógica de negocio de la aplicación.

Proporcionan una capa de abstracción entre los controladores (o componentes que interactúan directamente con las solicitudes HTTP) y la capa de acceso a datos (más adelante veremos como acceder a una base de datos donde rescatar los chistes.)

Los servicios son inyectados en otras clases de la aplicación, como controladores, otros servicios, o componentes de configuración.

La inyección de dependencias (Dependency Injectión, DI) es un patrón de diseño fundamental en Spring Boot. La inyección de dependencias es un mecanismo que se utiliza para gestionar las dependencias entre diferentes componentes de una aplicación. En el contexto de Spring Boot, la inyección de dependencias se refiere a como Spring maneja las dependencias de los componentes y proporciona instancias de estas dependencias a los componentes que las necesitan (en nuestro ejemplo la creación de un objeto de la clase ChisteService la realiza automáticamente Spring Boot, en ningún lado hacemos un new de la clase ChisteService)

Ahora en el paquete "com.example.demo" creamos la carpeta "controller". y creamos dentro de dicha carpeta la clase ChisteController.

El código de la clase ChisteController es diferente al proyecto anterior ya que no utilizaba servicios:

ChisteController.java

```java
package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.model.Chiste;
import com.example.demo.service.ChisteService;

@Controller
public class ChisteController {

	private final ChisteService chisteService;
	
	public ChisteController(ChisteService chisteService) {
		this.chisteService = chisteService;
	}
	
	@GetMapping("/")
	public String inicio(Model model) {
		Chiste chisteAzar = chisteService.obtenerChisteAleatorio();
		model.addAttribute("chiste", chisteAzar);
		return "index";
	}
}
```

La anotación @Controller marca esta clase como un controlador de Spring

```java
private final ChisteService chisteService;
	
public ChisteController(ChisteService chisteService) {
    this.chisteService = chisteService;
}
```

En esta parte, se define un campo chisteService que representa la dependencia del servicio ChisteService. Este campo se inicializa a través de un constuctor que toma una instancia de ChisteService. Esto se llama inyección de dependencias y Spring se encargará de proporcionar una instancia de ChisteService automáticamente al crear una instancia de ChisteController (tener en cuenta que también Spring Boot crea una instancia de ChisteController en forma automática).

El método inicio maneja las solicitudes GET a la raíz de la aplicación(/). Toma un parámetro Model, que es utilizado para pasar datos a la vista. En este método, se obtiene un chiste aleatorio utilizando el servicio ChisteService, se agrega al modelo con el nombre "chiste" y se devuelve el nombre de la vista "index". Esto indica que Spring debe buscar una plantilla de Thymeleaf llamada index.html para renderizar la respuesta al cliente.



Creamos la vista en la carpeta "template" el archivo se llama index.html, sin hacer cambios con respecto al proyecto del concepto anterior:

El código fuente de la página index.html es:

```html
<DOCTYPE html>
<html>
	<head>
        <meta charset="UTF-8">
        <title>Proyecto Servicios</title>
    </head>    
    
    <body>
        <h1>Chiste</h1>
        <p th:text="${chiste.texto}"></p>
    </body>
</html>
```

Ahora si ejecutamos la aplicación (recordar guardar siempre los cambios y volver a reiniciar el Servidor) vemos que nos muestra chistes cada vez que actualizamos la página web.



## API REST

La API REST permiten que diferentes aplicaciones se comuniquen entre sí a través de Internet. Un cliente (sitio web, aplicación móvil, aplicación de escritorio, etc.) puede enviar una solicitud a una API REST para obtener o modificar datos, y la API responde con la información solicitada.

Spring Boot facilita enormemente la creación de API REST.

Crear páginas renderizadas en el servidor con Spring Boot y desarrollar API REST son dos enfoques diferentes para construir aplicaciones.

Las páginas renderizadas son aquellas que el navegador ha convertido el código HTML, CSS y JavaScript en una representación visual que el usuario ve en su pantalla. Este proceso, llamado renderizado, es crucial para que los sitios web sean visualmente correctos, dinámicos y permitan la interacción del usuario.

- **Transferencia de datos**: En lugar de generar páginas HTML completas, una API REST proporciona un conjunto de puntos finales (endpoints) que permiten a los clientes acceder y manipular datos en el servidor. Estos datos generalmente se transfieren en formato JSON.
- **Separación de responsabilidades:** Una API REST se centra en proporcionar acceso a datos y funcionalidades del servidor, mientras que la interfaz de usuario (UI) se implementa por separado en el cliente (por ejemplo, una aplicación web frontend, una aplicación móvil, una aplicación de escritorio, etc).
- **Más flexible y escalable:** La API REST permite una mayor flexibilidad y escalabilidad al separar la presentación de los datos y la lógica del negocio del servidor. Esto facilita la construcción de aplicaciones que pueden ser utilizadas por múltiples clientes (como aplicaciones web, móviles o de escritorio) y que pueden escalar más fácilmente a medida que aumenta la demanda.
- **Experiencia de usuario más dinámica:** Las aplicaciones que consumen una API REST suelen ofrecer una experiencia de usuario más dinámica, con interfaces de usuario interactivas que pueden actualizar partes especificas de la página sin necesidad de recargarla por completo. Esto puede ser más adecuado para aplicaciones donde la interactividad y la respuesta en tiempo real son importantes.



### Pasos para crear una aplicación con Spring Boot elemental que sirva una API

**Problema**

En el concepto anterior desarrollamos una página dinámica que muestra un chiste en forma aleatorio. Vamos a desarrollar el mismo problema pero en vez de retornar una página dinámica en HTML, vamos a retornar un archivo JSON con un chiste al azar y otra URL va a retornar un JSON con todos los chistes.



LAS URL para hacer las peticiones serán:

```web
http://localhost:8080/chisteazar
http://localhost:8080/chistetodos
```

Lo primero que vamos a hacer notar que gran parte es lo mismo. Debemos crear el modelo, el servicio y el controlador (veremos que en la clase del controlador es donde tenemos más diferencias, además no dispondremos nada en la carpeta template ya que no retornaremos HTML dinámico, no necesitamos el módulo ThymeLeap). 

Los pasos para crear el proyecto: APIREST

- Desde el menú de opciones seleccionamos File -> New->Spring Starter Project con nombre APIREST

- En el primer diálogo procedemos a definir el nombre de nuestro proyecto. Utilizaremos Maven como herramienta de gestión de proyecto.

- En el segundo diálogo seleccionamos solo la dependencia "Spring Web" y no "Thymeleaf".

- Ahora en el paquete "com.example.demo" procedemos a crear la carpeta "model" presionando el botón derecho del mouse y definiendo su nombre como "model", igual que en el ejemplo anterior.

- En la carpeta model creamos la clase Chiste.java de forma idéntica como hicimos en el proyecto anterior.

  El código de la clase Chiste es el siguiente:

  ```java
  package com.example.demo.model;
  
  public class Chiste {
  	private String texto;
  	
  	public Chiste() {
  		
  	}
  	
  	public Chiste(String texto) {
  		this.texto = texto;
  	}
  	
  	public String getTexto() {
  		return texto;
  	}
  	
  	public void setTexto(String texto) {
  		this.texto = texto;
  	}
  }
  ```

- Al igual que en el ejercicio anterior, creamos en el paquete "com.example.demo" la carpeta "service".

- En la carpeta service creamos la clase ChisteService y agregamos un método que retorne todos los chistes:

  El código de la clase ChisteService es:

  ```java
  package com.example.demo.service;
  
  import org.springframework.stereotype.Service;
  
  import com.example.demo.model.Chiste;
  import java.util.ArrayList;
  import java.util.List;
  
  @Service
  public class ChisteService {
  	// Para utilizarlo hay que implementar el modelo Chiste
  	private List<Chiste> chistes;
  	
  	public ChisteService() {
  		chistes = new ArrayList<>();
  		
  		chistes.add(new Chiste("¿Qué le dice un 0 a un 8? Bonito cinturon"));
  		chistes.add(new Chiste("¿Que hace una abeja en el gimnasio? Zumba"));
  		chistes.add(new Chiste("¿Cuál es el colmo de un electricista? Qué su hijo sea"));
  		chistes.add(new Chiste("¿Por qué estás hablando con la pared? Por que la mesa"));
  		
  	}
  	
  	public Chiste obtenerChisteAleatorio() {
  		return chistes.get((int)(Math.random()*chistes.size()));
  	}
  
  	public List<Chiste>todos(){
  		return chistes;
  	}
  }
  ```

- Lo único que hemos hecho diferente al ejercicio anterior es agregar un método que retorne todos los chistes (podríamos no haberlo hecho)

  ```java
  public List<Chiste> todos(){
  	return chistes;
  }
  ```

- Ahora nuevamente en el paquete "com.example.demo" creamos la carpeta "Controller", presionando el botón derecho New->Folder.

  Dentro de la carpeta "Controller" creamos la clase ChisteController.java, cuyo código es diferente al proyecto anterior, ya que vamos a retornar archivos JSON en lugar de páginas dinámicas:

  ```java
  package com.example.demo.controller;
  
  import java.util.List;
  
  import org.springframework.web.bind.annotation.GetMapping;
  import org.springframework.web.bind.annotation.RestController;
  
  import com.example.demo.model.Chiste;
  import com.example.demo.service.ChisteService;
  
  @RestController
  public class ChisteController {
  	private final ChisteService chisteService;
  	
  	public ChisteController(ChisteService chisteService) {
  		this.chisteService = chisteService;
  	}
  	
  	@GetMapping("/chisteazar")
  	public Chiste chisteazar() {
  		Chiste chisteAzar = chisteService.obtenerChisteAleatorio();
  		
  		return chisteAzar;
  	}
  	
  	@GetMapping("/chistetodos")
  	public List<Chiste> chisteTodos() {
  		List<Chiste> chistes= chisteService.todos();
  		
  		return chistes;
  	}
  }
  ```

- Un cambio fundamente es que disponemos la anotación @RestController en lugar de @Controller.

  La anotación @RestController se utiliza para crear controladores en Spring Boot que devuelve datos serializados en JSON por defecto. Sin necesidad de usar una vista para renderizar los datos en la respuesta (no disponemos de archivos HTML en la carpeta template). Esto es útil cuando se construyen servicios web RESTful donde la salida principal es el contenido de datos. 

- Ahora cada una de las URL retornan la estructura de datos en formato JSON (el framework Spring Boot se encarga de la serialización).

  ```java
  @GetMapping("/chisteazar")
  public Chiste chisteazar() {
      Chiste chisteAzar = chisteService.obtenerChisteAleatorio();
  
      return chisteAzar;
  }
  
  @GetMapping("/chistetodos")
  public List<Chiste> chisteTodos() {
      List<Chiste> chistes= chisteService.todos();
  
      return chistes;
  }
  ```

- El método "chisteAzar" retorna un objeto de tipo Chiste y el método "chisteTodos" retorna un objeto de tipo List con elementos de tipo Chiste (no retornamos tipo de dato String como en el ejemplo anterior).

- Podemos ingresar a las 2 URL y comprobar que al navegador llegan archivos JSON (no retorna HTML)

  La ruta: http://localhost:8080/chisteazar:

  ![image-20250423095628851](/home/soa/.config/Typora/typora-user-images/image-20250423095628851.png)

  La segunda ruta retorna todos los chistes (un arreglo con todos los chistes):

  ![image-20250423095720733](/home/soa/.config/Typora/typora-user-images/image-20250423095720733.png)

- Vamos a crear en la carpeta static los siguientes archivos para darle forma a esta aplicación:

  Nota: si el proyecto tiene servicios los html van en la carpeta static en lugar de en template.

  - estilos.css

    ```css
    .container{
    	max-width: 800px;
    	margin: 0 auto;
    	padding: 20px;
    	text-align: center;
    }
    
    .chiste{
    	background-color: gainsboro;
    	border-radius: 5px;
    	padding: 10px;
    	margin-bottom: 10px;
    }
    ```

    

  - index.html

    ```html
    <!DOCTYPE html>
    <html lang="en">
    	<head>
    		<meta charset="UTF.8">
    		<title>CHISTE</title>
    		<link rel="stylesheet" href="estilos.css">
    	</head>
    	
    	<body>
    		<div class="container">
    			<h1>Chistes</h1>
    			<div id="chistes"></div>
    		</div>
    
    		<script src="index.js"></script>		
    	</body>
    </html>
    ```

  - index.js

    ```javascript
    // con este código traemos los chistes y los vamos a mostrar en el div
    
    document.addEventListener("DOMContentLoaded",function(){
    	fetch("/chistetodos")
    	.then(response => response.json())
    	.then(data => {
    		const chistesContainer = document.getElementById("chistes");
    		data.forEach(chiste => {
    			const chisteElement = document.createElement('div')
    			chisteElement.classList.add('chiste')
    			chisteElement.innerText = chiste.texto
    			chistesContainer.appendChild(chisteElement)
    		});
    	})
    	.catch(error => console.error('Error fetching chistes:',error))
    });
    ```

  El resultado al ejecutar el proyecto es :

  ![image-20250423113113826](/home/soa/.config/Typora/typora-user-images/image-20250423113113826.png)

Práctica APIREST2

Idem a APIREST pero vamos a poder crear o eliminar chistes





## Creación de base de datos desde Spring Boot

https://www.tutorialesprogramacionya.com/springbootya/detalleconcepto.php?punto=12&codigo=13&inicio=0

1. Creamos un proyecto File-> New -> Spring Starter Project con nombre "BaseDatos1"

2. En el segundo diálogo seleccionamos tres dependencias:

   1. Spring Data JPA

      JPA (Java Persistence API), **es una API de persistencia desarrollada para la plataforma Java EE**. Maneja datos relacionales en aplicaciones usando la Plataforma Java en sus ediciones Standard (Java SE) y Enterprise (Java EE). Es un marco de mapeo objeto-relacional (ORM) que **permite mapear objetos Java a tablas en una base de datos relacional** .

      La dependencia Spring Data JPA en Spring Boot proporciona una capa de abstracción sobre la API de Java Persistence API (JPA), lo que simplifica significativamente el acceso y la manipulación de datos en una base de datos relacional desde una aplicación Spring Boot. Aquí hay algunas funcionalidades clave que ofrece:

      - Simplifica la Capa de Acceso a Datos: Spring Data JPA reduce la cantidad de código que necesitamos escribir para interactuar con la base de datos al proporcionar métodos predefinidos para realizar operaciones CRUD (Crear, Leer, Actualizar, Eliminar) en las clases definidas en nuestro modelo.
      - Consulta Automática: Spring Data JPA genera consultas SQL automáticamente basadas en convenciones de nombres de métodos. Esto significa que podemos definir métodos en los repositorios que representan operaciones de consulta, y Spring Data JPA generará las consultas SQL necesarias en tiempo de ejecución.
      - Soporte para Consultas Personalizadas: Si necesitamos escribir consultas SQL personalizadas, Spring Data JPA te permite definir consultas nativas o consultas JPQL (Java Persistence Query Language) utilizando anotaciones.
      - Soporte para Asociaciones y Relaciones entre entidades: Spring Data JPA maneja automáticamente las relaciones entre entidades, lo que facilita el trabajo con asociaciones como uno a uno, uno a muchos y muchos a muchos.

   2. **MySQL Driver**: La dependencia MySQL Driver en Spring Boot proporciona las clases y funcionalidades necesarias para conectarse y comunicarse con una base de datos MySQL desde una aplicación Java, específicamente en el contexto de una aplicación Spring Boot.

      Cuando agregamos esta dependencia, Spring Boot incluye el controlador JDBC de MySQL en el classpath de la aplicación. Esto permite que Spring Boot interactúe con la base de datos MySQL utilizando las API estándar de Java para la conectividad con bases de datos (JDBC).

   3. Spring Web

   ![image-20250514123055540](/home/soa/.config/Typora/typora-user-images/image-20250514123055540.png)

3. Especificamos que accederemos a la base de datos 'bd1' en el archivo application.propierties

   ```java
   spring.application.name=BaseDatos1 
   spring.datasource.url=jdbc:mysql://localhost:3306/bd1?useSSL=false
   spring.datasource.username=root
   spring.datasource.password=123456
   spring.jpa.hibernate.ddl-auto=update    
   spring.datasource.driver.class=com.mysql.jdbc.Driver
   spring.jpa.properties.hibernate.dialect = org.hibernate.dialect.MySQL5Dialect
   ```

   spring.application.name = nombre proyecto spring

4. Creamos la carpeta "model" y en la misma creamos la clase Chiste (New->Class)

   ```java
   package com.example.demo.model;
   
   import jakarta.persistence.Entity;
   import jakarta.persistence.GeneratedValue;
   import jakarta.persistence.GenerationType;
   import jakarta.persistence.Id;
   
   @Entity
   public class Chiste {
   	@Id
   	@GeneratedValue(strategy = GenerationType.IDENTITY)
   	private int id;
   	private String texto;
   	private String autor;
   	
   	// Creamos los constructores
   	public Chiste() {
   		
   	}
   	
   	public Chiste(int id, String texto, String autor) {
   		this.id = id;
   		this.texto = texto;
   		this.autor = autor;
   	}
   	
   	// creamos los metodos para obtener y escribir las variables
   	public int getId() {
   		return id;
   	}
   	
   	public void setId(int id) {
   		this.id = id;
   	}
   	
   	public String getTexto() {
   		return texto;
   	}
   	
   	public void setTexto(String texto) {
   		this.texto = texto;
   	}
   	
   	public String getAutor() {
   		return autor;
   	}
   	
   	public void setAutor(String autor) {
   		this.autor = autor;
   	}
   }
   ```

   

5. Creamos la carpeta "repository" y dentro creamos la clase ChisteRepository

   ```java
   package com.example.demo.repository;
   
   import org.springframework.data.jpa.repository.JpaRepository;
   import com.example.demo.model.Chiste;
   
   public interface ChisteRepository extends JpaRepository<Chiste, Integer>{
   
   }
   ```

6. Creamos la carpeta service y dentro de la misma la clase "ChisteService"

   ```java
   package com.example.demo.service;
   
   import java.util.List;
   import java.util.Random;
   
   import org.springframework.stereotype.Service;
   
   import com.example.demo.model.Chiste;
   import com.example.demo.repository.ChisteRepository;
   
   @Service
   public class ChisteService {
   	com.example.demo.repository.ChisteRepository repo;
   	
   	//Creamos los constructores
   	public ChisteService(ChisteRepository repo) {
   		this.repo = repo;
   	}
   	
   	public List<Chiste> retornarChistes(){
   		return repo.findAll();
   	}
   	
   	public void agregarChiste(Chiste chiste) {
   		repo.save(chiste);
   	}
   	
   	public void eliminarChiste(int id) {
   		repo.deleteById(id);
   	}
   	
   	public void actualizarChiste(int id, Chiste chiste) {
   		Chiste chisteModificado = repo.findById(id).get();
   		chisteModificado.setTexto(chiste.getTexto());
   		chisteModificado.setAutor(chiste.getAutor());
   		
   		repo.save(chisteModificado);
   	}
   	
   	public Chiste obtenerChiste(int id) {
   		return repo.findById(id).get();
   	}
   	
   	public Chiste obtenerChisteAleatorio(){
   		List<Chiste> todosLosChistes = repo.findAll();
   		Random rand = new Random();
   		
   		int indiceAleatorio = rand.nextInt(todosLosChistes.size());
   		return todosLosChistes.get(indiceAleatorio);	
   	}
   }
   ```

7. Vamos a crear los endpoints en el controlador. Creamos la carpeta controller y dentro la clase "ChisteController": 

   ```java
   package com.example.demo.controller;
   
   import java.util.List;
   
   import org.springframework.web.bind.annotation.DeleteMapping;
   import org.springframework.web.bind.annotation.GetMapping;
   import org.springframework.web.bind.annotation.PathVariable;
   import org.springframework.web.bind.annotation.PostMapping;
   import org.springframework.web.bind.annotation.PutMapping;
   import org.springframework.web.bind.annotation.RequestBody;
   import org.springframework.web.bind.annotation.RestController;
   
   import com.example.demo.model.Chiste;
   import com.example.demo.service.ChisteService;
   
   @RestController
   public class ChisteController {
   	private final ChisteService chisteService;
   	
   	// Creamos los controladores
   	public ChisteController(ChisteService chisteService) {
   		this.chisteService = chisteService;
   	}
   	
   	// Endpoint para obetener todos los chistes
   	@GetMapping("/chistes")
   	public List<Chiste> obtenerTodosLosChistes(){
   		return chisteService.retornarChistes();
   	}
   	
   	// Endpoint para agregar un nuevo chiste
   	@PostMapping("/chistes")
   	public void agregarNuevoChiste(@RequestBody Chiste chiste) {
   		chisteService.agregarChiste(chiste);
   	}
   	
   	// Endpoint para eliminar un chiste por su ID
   	@DeleteMapping("/chistes/{id}")
   	public void eliminarChiste(@PathVariable int id) {
   		chisteService.eliminarChiste(id);
   	}
   	
   	// Endpoint para actualizar un chiste existente
   	@PutMapping("/chistes/{id}")
   	public void actualizarChiste(@PathVariable int id, @RequestBody Chiste nuevoChiste) {
   		chisteService.actualizarChiste(id, nuevoChiste);
   	}
   	
   	// Endpoint para obtener un chiste por su ID
   	@GetMapping("/chistes/{id}")
   	public Chiste obtenerChistePorId(@PathVariable int id) {
   		return chisteService.obtenerChiste(id);
   	}
   	
   	// Endpoint para obtener un chiste aleatorio
   	@GetMapping("/chistes/aleatorio")
   	public Chiste obtenerChisteAleatorio() {
   		return chisteService.obtenerChisteAleatorio();
   	}
   }
   ```

8. Probamos los endpoints desde Postman

   1. Agregemos un chiste a nuestra tabla de la base de datos: 
   1. Probamos a recuperar los chistes:

9. Probamos los accesos a los endpoints desde un sitio web.
   Agreguemos los archivos index.html, index.js y  estilos.css en el proyecto para consumir los endpoints desde una aplicación web.





## Postman

Es una aplicación para probar las APIs que desarrollemos, no es cómodo hacer las peticiones desde un navegador, sobretodo cuando tengamos que hacer peticiones POST, PUT, DELETE. 

Para solventar dicho problema existe aplicaciones para probar APIs.

Postman es una herramienta popular utilizada por desarrolladores para probar, desarrollar y documentar APIs. Es una aplicación que proporciona una interfaz gráfica de usuario para enviar solicitudes HTTP a servidores web y recibir respuestas. 

Postman simplifica el proceso de probar APIs al ofrecer una variedad de características útiles, como la organización de solicitudes en colecciones, la capacidad de definir variables de entorno y globales, la automatización de pruebas mediante scripts en JavaScript, la generación de documentación de APIs, entre otras.

Puede descargar la aplicación desde su sitio oficial en forma gratuita:

https://www.postman.com/downloads/

Una vez instalado puede proceder a efectuar las solicitudes, teniendo en cuenta que son peticiones GET.

```web-idl
http://localhost:8080/chisteazar
```

![image-20250423112709472](/home/soa/.config/Typora/typora-user-images/image-20250423112709472.png)

La segunda petición es la que retorna un arreglo:

```web-idl
http://localhost:8080/chistetotos
```

![image-20250423112807846](/home/soa/.config/Typora/typora-user-images/image-20250423112807846.png)





Para crear un proyecto de diferentes formas:

- Con eclipse: New -> Spring Starter Project seleccionando maven y las depencias que necesitemos

  - Selecionando web para páginas estáticas
  - Seleccionando web y Thymeleaf para páginas dinámicas.

- Con Visual Studio Code: 

- Desde https://spring.io/tools pulsamos en la opción de visual studio code

  Pulsamos desde visual studio code Ctrl+P y copiamos la extensión ext install vmware.vscode-boot-dev-pack

  ![image-20250421120232420](/home/soa/.config/Typora/typora-user-images/image-20250421120232420.png)

  Cerramos y volvemos a abrir el visual studio code y cuando aparece el archivo de Welcome o Bienvenido seleccionamos la opción de Getting Spring

  ![image-20250421120500334](/home/soa/.config/Typora/typora-user-images/image-20250421120500334.png)

  ![image-20250421120538850](/home/soa/.config/Typora/typora-user-images/image-20250421120538850.png)

  Pulsamos en Create Project y seleccionamos la versión de Spring, seleccionamos el lenguaje del proyecto (Java) 

  ![image-20250421120626170](/home/soa/.config/Typora/typora-user-images/image-20250421120626170.png)

  Y ponemos el nombre del proyecto que queremos

  ![image-20250421120754102](/home/soa/.config/Typora/typora-user-images/image-20250421120754102.png)

  Seleccionamos las dependencias:

  ![image-20250421120929295](/home/soa/.config/Typora/typora-user-images/image-20250421120929295.png)

  

- Nos vamos a google y escribimos "spring initializr" https://start.spring.io/ 

  ![image-20250421115240473](/home/soa/.config/Typora/typora-user-images/image-20250421115240473.png)

  Ponemos el nombre que queremos y esto nos creará un proyecto aparte, no un proyecto dentro de eclipse.

  Pulsamos en dependencias para añadir las que queremos

  ![image-20250421115115753](/home/soa/.config/Typora/typora-user-images/image-20250421115115753.png)

  Buscamos web y hacemos click, las dependencias que marcamos

  ![image-20250421115330727](/home/soa/.config/Typora/typora-user-images/image-20250421115330727.png)

  Y pulsamos en generate y se nos descarga un archivo de tipo zip. lo descomprimimos y lo metemos donde queramos y lo abrimos por ejemplo con visual estudio code









https://www.tutorialesprogramacionya.com/springbootya/detalleconcepto.php?punto=10&codigo=11&inicio=0







NOTA:

**Entry point** es la URL que el visitante habrá ingresado en su navegador para ver su aplicación o sitio. Antiguamente, cada sección de un sitio web era un entrypoint

```markdown
- home.html
- galeria.html
- contacto.html
- about us.html
```

Con el advenimiento de librerías que proveen ruteo (Backbone, React, Angular, Vue) se ha vuelto trivial servir aplicaciones de una sola página (SPA) en donde el visitante llega a un landing y desde ahí puede visitar el resto del sitio, *dando la impresión de que navega* entre páginas distintas cuando, en realidad, *sigue siendo el mismo landing* que le muestra distintas secciones según la url que vaya solicitando. El entrypoint contendrá la funcionalidad de actual como router y mostrar distinto contenido según la url solicitada, "interceptando" los links internos.

El visitante ve que la URL va cambiando y realmente siente que se está moviendo entre links, pero no ha dejado el mismo entrypoint.

```markdown
- Home
   - galería
   - contacto
   - about us
```

Hay un delicado equilibro entre tener muy pocos entrypoints con dependencias que no necesitan, o muchos con el manteniemiento que ello conlleva.

------

**Los endpoints** son las URLs de un API o un backend que responden a una petición. Los mismos entrypoints tienen que calzar con un endpoint para existir. Algo debe responder para que se renderice un sitio con sentido para el visitante. Por cada entrypoint esperando la visita de un usuario puede haber docenas de endpoints sirviendo los datos para llenar cada gráfico e infografía que se despliega en el entrypoint.

La diferencia entre entrypoint y endpoint es que los **endpoints no están pensados para interactuar con el usuario final**. Usualmente sólo devolverán json, o no devolverán nada. Y más que frecuentemente, un entrypoint hará varios llamados a distintos endpoints para mostrar estadísticas, galerías, últimos comentarios, etc.

Adicionalmente, se asume que cuando se habla de un endpoint estamos en un entorno **RESTful**, por lo cual (a diferencia del uso de un browser), el cliente *puede usar un mismo endpoint con distintos verbos*. Un mismo endpoint, por ejemplo:

```bash
/users
```

va a devolver una lista de usuarios si usas el verbo GET, y va a crear un usuario si usas el verbo POST. El endpoint por sí mismo no dice nada de las acciones que puedes hacer con él.

La existencia de endpoints usualmente es proporcional a la cantidad de entidades que quieres modelar en tu backend o en tu API. Digamos que por cada entidad debiera existir al menos un endpoint, y por cada uno de ellos, podrías realizar las acciones de crear, leer, actualizar y borrar datos. Y luego, si consideras que cada relación entre dos entidades da lugar a otro endpoint, puede que tengas muchos más. De nuevo, dado el modelo User, si cada usuario tiene N galerías, el **endpoint**

```bash
users/{id}/gallery
```

Te va a devolver las galerías del usuario que has pedido. De nuevo en un simple json, porque no está pensado para que el usuario final lo lea directamente.

API significa Application Programming Interface, en donde interfaz alude directamente al contrato de interfaz. Tu implementación es una caja negra. Los demás sólo saben que en tales endpoints y con tales payloads se hace tal o cual cosa.

Puedes cambiar lo que quieras en la caja negra y el API no ha cambiado, por tanto el API

- no es el backend,
- no es la capa de negocios,
- no es el webserver.

Es un contrato, en el fondo.

# Diferencia entre API y endpoint

un API puede tener muchos endpoints. Lo importante es que sin importar lo que tengas en tu capa de persistencia, negocios, webservers, etc, el que consume tu API sólo necesita saber cómo intercambiar información con ésta estableciendo:

- Cómo expresar QUIÉN está interactuando (autenticación)
- QUÉ puede hacer (endpoint)
  - QUÉ acción (leer, actualizar, crear, borrar y más)
  - DÓNDE se hace eso (ruta, usualmente contiene un espacio de nombre que sugiere sobre qué entidad se está operando e.g. `User`, `Post` o `Comment`)
  - QUÉ se espera que envíe (payload)
- QUÉ cabe recibir recibir de vuelta (respuesta)
  - CÓMO debe interpretar ciertos códigos en la respuesta (headers y error codes) para actuar en consecuencia
  - QUÉ forma tiene lo que el API responderá en el body para automatizar su procesamiento.

Si pudieramos clasificarlos brevemente seria:

- Entrypoint - URL de entrada a una pagina de un sitio web.
- Endpoint - URL de un servicio que utiliza un sitio web para cargar o consumir informacion.

Ejemplos de uso:

- Una pagina Home de un sitio web es un entrypoint.
- Una API Web se accede a traves de endpoints.

**La relacion que existe entre ellas:**

Un entrypoint, como una pagina de Home de un sitio web, puede estar consultado informacion de distintos endpoints para llenar con cierta informacion las secciones de la pagina, siendo simplistas, supongamos que:

- La parte superior del sitio web donde se encuetra el menu, consulta a un endpoint.
- La parte lateral del sitio web, consulta otro endpoint.
- La parte principal del sitio web, consulta otro endpoint.
- Y que la parte inferior del sitio web, consulta a un ultimo endpoint.

Ademas de ello, entendamos a los endpoints como servicios webs que seran usados no solo al acceder a un entrypoint si no tambien al hacer click en un boton, un checkbox, o cualquier evento de interaccion con el usuario.



# Service Pack

Lo siguiente puede tener interpretaciones que obedecen a mi entendimiento (no opinión) y no soy sacerdote de APIs como para hacer exégesis pero me gano la vida en esto y si tuviera que explicarlo, usaría un ejemplo. Un eCommerce muy básico.

El ecommerce más básico expondría un API que tiene:

(Internamente) Tres **entidades**: usuario, pedido y productos

- pedido expone dos

   

  rutas

  - api.dominio.com/pedido
  - api.dominio.com/pedido/:idPedido

- pero en realidad expone cuatro

   

  endpoints

  - GET api.dominio.com/pedido (lista los pedidos)
  - POST api.dominio.com/pedido (crea un pedido)
  - PUT api.dominio.com/pedido/:idPedido (actualiza un pedido)
  - DELETE api.dominio.com/pedido/:idPedido (borra un pedido)
  - GET api.dominio.com/pedido/:idPedido (muestra detalle de un pedido)

Tus entidades son conceptuales. **NO SON PARTE DE TU API**. Dentro de la caja negra pueden ser modelos, tablas de excel, objetos JSON, pulpos pegajosos o la espada de He-Man.

Es bueno que los endpoints reflejen cierta lógica conceptual, pero al que consuma tu API no le importa cómo lo manejas por dentro.

------

Las otras entidades replican algo parecido, PERO, el usuario no puede modificar a otros ni modificar el catálogo. Esto implica que *los endpoints de tus entidades* requieren distintos **permisos**

Sin embargo esos permisos **NO SON PARTE DE TU API** sino de tu implementación. Por ejemplo:

- Un admin sí debiera poder modificar el catálogo y quizá a los clientes, por tanto tus usuarios tienen distintos **Roles**. Por ejemplo: "todos", "autenticados" y "admin". (todos contiene a autenticados y autenticados contiene a admin).
- Las NxM combinaciones de roles con permisos definen para cada entidad un **ACL** (Access Control Level)

**Sin embargo**, tu API no tiene por qué exponer los ACL ni los roles. Eso va dentro de tu caja negra. El que consume tu API sólo conoce los endpoints que sean visibles. **Por lo tanto los endpoints tienen visibilidad** que tú determinas. Esa visibilidad puede ser pública (e.g. el endpoint para registrarse) o requerir **autenticación** (por ejemplo ver el perfil).

Esta autenticación la manejarías con un flujo (que **Sí** es parte del api) que concluye entregándole al usuario **algo** para que en sus siguientes peticiones puedas saber quién es. Internamente (**NO** es parte del API) ese algo se mapea a un usuario y sus permisos. Pero eso es dentro de la caja negra.

Idealmente (a menos que el masoquismo supere todo límite) la autenticación será homogénea en toda tu API. En algún momento elegirás un mecanismo (Oauth, JWT, Simple Auth, *Sesiones, Cookies*. No, es broma, ni sesiones ni cookies, mala idea) y lo establecerás en tu contrato de interfaz. **Sí** es parte del API.

------

Como el usuario tiene pedidos y el pedido tiene productos, es intuitivo que en realidad tus endpoint sean (por ejemplo) de la forma:

- `POST api.dominio.com/user/:idUser/pedidos/:idPedido/producto` (añadir producto al pedido). Por tanto tus entidades tienen **relaciones**

(**no** son parte de tu API pero los endpoints permite inferirlas)

Como podría ser un poco rebuscado que para modificar la cantidad de cierto producto en un cierto pedido tuvieras que hacer `PUT api.dominio.com/user/:idUser/pedidos/:idPedido/producto/:idProducto` en tu interfaz (por tanto SÍ es parte del API) indicas que eso se hace directo en `PUT api.dominio.com/pedidos/:idPedido/producto/:idProducto`.

Significa que los endpoints, como dijimos antes, tienen una cierta visibilidad (parte del API) que no se desprende directo de las entidades y sus métodos (que son internos) sino que además los puedes hacer invisibles por simplicidad, redundancia y sanidad mental.

------

Tu API espera que para añadir un producto al pedido le manden el id en el cuerpo de la petición, mientras que eliminarlo requiere enviar el id en la URL. De la misma manera hacer login requiere mandar usuario y contraseña en el body. Significa que dependiendo de la acción tu API espera distintos **payloads**. Y eso sí es parte del API. La manera en que el API decodifica el contenido de la petición también debiera ser parte del contrato de interfaz.

Dependiendo del resultado de tu operación, el API entregará una **respuesta**:

- En los headers de la respuesta (en particular en el status code)
  - 404 si se intenta operar sobre una entidad que no existe
  - 401 si hay problema de permiso (por ACL o autenticación)
  - 200 si todo salió bien
  - 204 si se borró exitosamente la entidad (en realidad se usa poco)
- En el cuerpo de la respuesta
  - un objeto con la forma de un producto (nombre, precio, categoría) cuando pides el detalle de éste
  - un objeto usuario (email, nombre, userId, avatar) cuando pides tu perfil
  - un objeto authorization (token, userId) cuando te logueas
  - Un objeto error (código, mensaje, stack) cuando ocurre un error

Tus respuestas sí son parte de tu API, y pueden venir en distinto formato. Parte del contrato de interfaz de explicitar que tu respuesta es por ejemplo Json o XML. (Header Content-Type)



En el mundo de la programación y desarrollo de software, un endpoint tiene un significado distinto. En dicho entorno, **un endpoint es una URL de una API que se encarga de contestar a una petición**. Es una ubicación digital concreta a la que se envían peticiones de información con el objetivo de obtener como respuesta la información que está en dicho punto. Los endpoints concretan los puntos a los que las APIs pueden acceder para conseguir recursos y ayudan a garantizar el funcionamiento correcto del software en el que se encuentran. El rendimiento de una API depende de su capacidad de comunicarse con éxito con los endpoints.

## Ejemplos de endpoint

Un ejemplo de endpoint puede ser un ordenador portátil de un trabajador de una empresa que accede a Internet cuando éste lo está utilizando desde las oficinas de la misma conectado a su red local. En ese caso, el ordenador portátil es un equipo físico con conexión.

> **En Instagram**, un endpoint de una API sería un punto que permite a las empresas y propietarios de cuentas profesionales medir las interacciones recibidas con su cuenta

En cuanto a los endpoint en programación, podemos encontrarlos en gran cantidad de aplicaciones modernas. Por ejemplo, **en Instagram**, un endpoint de una API sería un punto que permite a las empresas y propietarios de cuentas profesionales medir las interacciones recibidas con su cuenta. **Otro ejemplo sería el elemento de moderación de comentarios de las aplicaciones.**

## Funcionamiento de los endpoints

**Un endpoint físico, es decir, un dispositivo hardware, funciona como tal cuando está conectado a internet**. Así de sencillo. Pero el funcionamiento de un endpoint en desarrollo es algo más complejo. Para empezar, es necesario tener claro que los sistemas que se comunican a través de una API son sistemas integrados. Uno de sus lados, al que llamaremos servidor, es el que envía la petición a la API. El otro lado, al que llamaremos cliente, envía la información solicitada a la API, y la manipula. El lado que proporciona la información o los recursos solicitados es el endpoint de la API.

**Para que el endpoint procese de manera eficaz una petición, el cliente debe proporcionarle una URL, un método, una lista de cabeceras y un cuerpo**. Las cabeceras contienen metadatos sobre una petición, y el cuerpo, los datos enviados por el cliente al servidor.

## ¿Qué es un endpoint de API?

Un endpoint de API es una ubicación digital donde una interfaz de programación de aplicaciones (API) recibe llamadas de API, también conocidas como solicitudes de API, para recursos en su servidor. **Los endpoints de API** son componentes de éstas y suelen adoptar la forma de URL, o localizadores uniformes de recursos.

Los endpoints de API permiten solicitar todo tipo de datos a una API, con casos de uso que van desde **actualizaciones en tiempo real de aplicaciones de software d**e redes sociales hasta funciones como la incrustación de audio o vídeo, la recuperación de noticias o la creación de una nueva publicación.  

![img](https://img.channelpartner.es/wp-content/uploads/2023/05/04120803/Java.jpg.webp)

Cuando hablamos de endpoint en **Java nos referimos a una clase, o a un método, dedicado a la exposición de las funciones de una aplicación** a través de un servicio web

## ¿Qué es un endpoint en Java?

Cuando hablamos de endpoint en **Java nos referimos a una clase, o a un método, dedicado a la exposición de las funciones de una aplicación** a través de un servicio web. Es decir, es un punto que deja a los usuarios acceder a recursos y operaciones de una aplicación o herramienta. La función de un endpoint en Java es variable y los programadores pueden definirla según sus posibilidades y necesidades. Estos también pueden asignarles las operaciones y recursos disponibles que sean necesarios.

Un endpoint en Java puede utilizar el protocolo HTTP, y sus métodos, para interactuar con un cliente. De esta manera, consigue ofrecer mejor experiencia a la hora de utilizar una aplicación. También se puede utilizar un endpoint en Java para gestionar parámetros y datos de entrada, con el objetivo de poder enviar a un usuario una respuesta personalizada.

## Entrypoint vs endpoint

**Un entrypoint es una URL que quien visita una página web ha escrito en su navegador,** o al iniciar una aplicación, para ver y acceder a su contenido y a sus distintos elementos. Es decir, es un elemento o punto de entrada a ella. Un entrypoint se encargará también, sobre todo en el caso de las webs, de dar acceso al resto de direcciones y URLs de una web o aplicación. Así, por ejemplo, quien haya accedido a una web y se mueva por sus páginas verá que la URL de cada una va cambiando, pero en realidad el visitante no ha cambiado de entry point.

En cuanto a un endpoint, es la URL de una API o un backend que se encarga de dar respuesta a una petición de información. Su funcionamiento y el de los entrypoints, eso sí, está relacionado. Así, **por cada entrypoint por el que un visitante de una web o app consigue acceso a él puede haber multitud de endpoints**, que se encarguen de ofrecerle los datos que solicita tras haber accedido a través del entry point.

Por tanto, entre las principales diferencias que hay entre entrypoint y endpoint está que estos últimos no tienen como tarea la interacción con el usuario final. Su trabajo es devolver datos en formato JSON, o nada cuando una petición no encuentra información. Además, un entry point se dedica a hacer llamadas a uno o varios endpoints, y éstos, de devolvérselas.

## Ataques en los endpoint y protección

Los puntos más vulnerables de la red de una organización son, sin duda, los endpoints conectados a ella. Tanto si son ordenadores como si se trata de dispositivos de Internet de las cosas. Son los puntos más propensos a recibir ataques. Por eso, **proteger los endpoints es una de las principales preocupaciones de seguridad de las empresas**. Para ello, no basta con utilizar sistemas convencionales. Por eso, **los antivirus tradicionales no son suficientes para protegerlos**. Es necesario utilizar una solución de seguridad, o varias, que esté diseñada para permitir a los administradores detectar y corregir amenazas.

![img](https://img.channelpartner.es/wp-content/uploads/2023/05/04121014/seguridad.jpg.webp)

**Una solución de seguridad** que proteja los endpoint **debe tener un sistema de aprendizaje automático**

**Una solución de seguridad** lo bastante potente como para prevenir y detectar ataques cibernéticos, en la actualidad, **debe tener un sistema de aprendizaje automático.** De esta manera, irá aprendiendo cada vez que el endpoint o la red sufran un ataque o alguien intente aprovecharse de una brecha de seguridad. La protección de endpoints también tiene que tener en cuenta que muchos de los intentos de ataque se dan a través del correo electrónico. En este caso son en su mayoría ataques de phishing, que buscan datos que permitan a los atacantes conseguir datos que les permitan acceder a sistemas con información sensible o en los que pueden causar daños económicos.

**Estas herramientas tendrán además acceso a bases de datos con información** sobre virus y otras amenazas, y en la mayoría de casos podrán instalarse y utilizarse en prácticamente cualquier sistema operativo actual. Detectar amenazas, algo imprescindible para la seguridad de los endpoints, es básico para que los datos y la información de las empresas estén bien protegidos.

## Características de un buen software de endpoint

### Software machine learning

Un buen software que se ocupe de la seguridad de los endpoint tendrá unas características muy concretas. Para empezar, como hemos mencionado, **tendrá que ser capaz de detectar y clasificar amenazas y ataques utilizando machine learning**. Gracias a la integración de este tipo de sistemas de Inteligencia Artificial, será capaz de identificar y bloquear amenazas de tipo “zero day”, y de hacerlo prácticamente en tiempo real.

### Protección avanzada para virus y malware

Por supuesto, **tendrá que contar con protección avanzada antivirus y malware,** y con sistemas de seguridad específicos para vigilar la navegación web para proteger la seguridad de los endpoints durante la visita a cualquier página. Además, contará con un firewall integrado, con el que bloquear los ataques a través de la red.



También dispondrá de elementos de control y protección para el correo electrónico y, a ser posible, se encargará de la **detección y respuestas de amenazas y ataques producidos desde dentro del propio equipo**. Estos se activan cuando un ataque ha pasado desapercibido e instala sus mecanismos de activación en el sistema para actuar al descuido en otro momento.

![img](https://img.channelpartner.es/wp-content/uploads/2023/05/04121322/NUBE-2-1920x965.jpeg.webp)

Una solución de ciberseguridad para endpoint deberá contar con protección avanzada ante malware, firewall integrador y protección para detección y respuestas de amenazas

### Plataforma centralizada y unificada

Estos sistemas también permitirán que los equipos de TI los administren a través de una plataforma centralizada y unificada, con la que controlar lo que pasa en todos los endpoints de una organización. Además, **es imprescindible que ofrezcan sistemas de clasificación de información y bases de datos de amenazas**. También deberá incorporar mecanismos de protección para evitar que se pierdan datos sensibles o que un tercero sin autorización pueda quedarse con ellos accediendo desde un punto ajeno al sistema. Y, por supuesto, debe admitir cifrado avanzado de punto final.

## Tipos de software endpoint

**Hay dos tipos de software de endpoints: sistemas de seguridad de endpoint en local, y en la nube.** Los primeros son los que se instalan en los servidores de la empresa, permiten la gestión de manera interna y no dependen de ningún factor externo para funcionar.

En cuanto a los sistemas de seguridad de endpoint en la nube, su característica principal es que gestiona todo desde un punto externo a la empresa: en la nube. Por lo tanto, no es necesario instalar software en los servidores de la organización. Además, no necesita mantenimiento y se puede escalar a medida que se necesiten más o menos elementos de seguridad. Además, no es necesario realizar una inversión fuerte para utilizarlo, solo se pagan cuotas mensuales en función del uso y, en muchos casos, del número de endpoint y/o usuarios a proteger.

## Diferencias entre protección de endpoints y un antivirus tradicional

Una plataforma de protección de endpoint ofrece unas capacidades que van mucho más allá de las de un antivirus tradicional. Este está preparado únicamente para actuar en un equipo de una red, o en uno que esté conectado a Internet de manera directa. Incluso si el antivirus instalase más licencias en todos los endpoints de una red, funcionaría de manera independiente en cada uno de ellos. Mientras tanto, **una plataforma de protección de endpoints se encarga de la gestión centralizada** de todos los que estén conectados a una red.

**La actualización de los antivirus y las plataformas de protección de endpoints también es distinta.** En el primer caso hay que irlos actualizando uno a uno. En el segundo, la actualización se puede llevar a cabo de manera centralizada. En muchos casos, la plataforma, además, es capaz de actualizar todos los puntos finales de manera automática cuando hay una actualización disponible. Esto también incide en un mayor nivel de protección, puesto que evita que un sistema no cuente con las últimas novedades y parches de seguridad por dejadez o descuido.

## Mejores prácticas para la gestión de endpoints

### Gestión integral

Aunque un gran porcentaje de los dispositivos conectados que se usan en la empresa sean Windows, sigue siendo necesario supervisar los demás endpoints con una plataforma operativa diferente para garantizar el correcto funcionamiento y la seguridad de los dispositivos.

### Gestiona de todos los dispositivos de una red

Con plantillas remotas o híbridas y políticas BYOD, puede resultar complicado gestionar todos los dispositivos en tu red. Sin embargo, aunque pueda resultar difícil, las organizaciones tienen que gestionar todos y cada uno de los dispositivos.

### Software de un único panel con visión global

Con un software de un único panel, los usuarios pueden ver todos los datos resultantes de la supervisión de endpoints en una sola pantalla. Esto significa que ya no hay que cambiar entre pantallas o interfaces e intentar recopilar y organizar los datos para analizarlos.

### Simplifica y unifica los procesos de supervisión

Las empresas están apostando por herramientas unificadas de gestión de endpoints con el fin de ahorrar tiempo y aumentar la eficiencia.

### Datos telemétricos en directo

La mejor manera de obtener la información más precisa de los endpoints es recibir datos telemétricos en directo, lo que resulta útil con fines de supervisión y análisisy también para reforzar las medidas de seguridad de los endpoints.



https://www.channelpartner.es/seguridad/que-es-un-endpoint/







Un punto final de API es la ubicación en la que una aplicación o servicio interactúa con una API web para acceder a datos.

## ¿Qué es un punto final de API?

Para comprender los puntos finales de API, primero debes tener un conocimiento básico de las API.

Las API son protocolos que permiten que dos aplicaciones de software interactúen y se comuniquen. Los desarrolladores utilizan [claves API](https://mailchimp.com/es/help/about-api-keys/) para identificar y acceder a otras aplicaciones.

Entonces, ¿qué son los puntos finales de API?

Un punto final de API es la ubicación de la API en la que un sistema interactúa con una API web. También es el punto de comunicación entre dos sistemas.

Es la URL específica que se utiliza para acceder a un recurso proporcionado por una aplicación web desde una API. El punto final se refleja como un buscador uniforme de recursos (URL), similar a la URL de un sitio web, donde los datos se transmiten de un programa a otro.

La URL del punto final es la ubicación exacta del recurso solicitado en un servidor API, permitiendo así que dos programas interactúen. En el punto final, la API accederá a los recursos que necesite de un servidor para realizar una tarea específica, como la obtención de ciertos datos o información.

Las API envían solicitudes para acceder a los datos desde un servidor y reciben una respuesta. La ubicación de la respuesta es el punto final, y es una parte importante de cualquier documentación porque indica a los desarrolladores cómo realizar solicitudes de API.

## Cómo probar los puntos finales de API

Otra forma de pensar en los puntos finales es una dirección específica en un servidor que le indique dónde encontrar la información que estás buscando. Los puntos finales de API deben estar predefinidos para completar las solicitudes API. Sin ellos, tu próximo punto final de API no funcionará.

Pero, ¿cómo puedes probar los puntos finales de API para asegurarte de que funcionan correctamente?

Cuatro métodos HTTP comunes:

- GET - recibe un recurso
- POST - crea un recurso
- PUT - actualiza un recurso
- DELETE - elimina un recurso



### Métodos HTTP

El tipo más común de API es la API de REST, que utiliza HTTP para enviar solicitudes. Las API de REST son un conjunto predeterminado de directrices que las aplicaciones utilizan para comunicarse.

Por ejemplo, el software del cliente enviará una solicitud a un servidor, que transfiere los datos de vuelta al cliente. Digamos que tienes un programa que deseas integrar con tu CRM. El cliente (tu programa) pedirá a la API de REST de tu CRM información sobre un recurso existente, y la API del CRM responderá.

Entonces, ¿cómo puedes probar si tu API funciona? Hay cuatro métodos HTTP comunes:

- GET: recupera (o recibe) un recurso solicitado
- POST: crea un recurso
- PUT: actualiza un recurso
- DELETE: elimina un recurso

Un ejemplo de punto final de API puede ser un sistema que intenta obtener información de un sitio web. Por ejemplo, el punto final de la API de tu aplicación para el tiempo te permite ver el tiempo desde tu dispositivo móvil.

Otro ejemplo de punto final de API es la codificación que se utiliza para solicitar datos específicos de un sistema a otro. Si quieres que tu CRM se integre con tu software de marketing por correo electrónico, este enviará una solicitud al servidor del software de marketing por correo electrónico utilizando un punto final con la palabra "GET" para que se envíe de vuelta a tu CRM.

Todo esto sucede entre bambalinas, y no es algo de lo que te tengas que preocupar siempre y cuando hayas desarrollado correctamente tu API y tu punto final de API.

Cuando trabajes con API, tendrás que consultar la documentación específica de la API que te indica cómo realizar todas estas acciones para asegurarte de que estás utilizando el punto final correcto para que la integración funcione. Para probar tus puntos finales, puedes utilizar varias herramientas de prueba de API que te permiten crear pruebas y monitorizar tus API.

En última instancia, la prueba de tus puntos finales de API tiene como objetivo garantizar que el cliente pueda solicitar información del servidor correctamente, y que el servidor entregue la información solicitada al cliente. Si no recibes ninguna información, tu punto final de API no está funcionando.

Formas de proteger tus puntos finales de API:

- Plataforma de seguridad de API
- Hashing de contraseña unidireccional
- HTTPs
- Validación de entradas

## Cómo proteger los puntos finales de la API

¿Están protegidos tus puntos finales de API? Como hemos mencionado, los puntos finales de API dan a otras empresas datos tuyos de forma gratuita, pero aun así estas empresas deben estar protegidas adecuadamente para proteger tu negocio.

Por desgracia, las API no seguras son relativamente comunes, lo que hace que los usuarios estén expuestos a respuestas y ataques maliciosos. Cuando el cliente envía una solicitud al servidor, éste envía los datos de vuelta, y estos datos enviados de vuelta podrían dejarte expuesto a un ciberataque o robo de datos si los puntos finales de API no están protegidos.

Por lo tanto, es esencial proteger tus claves API y puntos finales de API para evitar ciberataques maliciosos que puedan ser peligrosos para tu negocio.

Estas son algunas formas de proteger tus puntos finales de API:

- **Plataforma de seguridad de API:** hay muchas maneras de proteger tus puntos finales de API, pero la más fácil es usar el mismo software para todos ellos. El software de seguridad de API te permite proteger varios puntos finales con prevención de amenazas, [pruebas A/B](https://mailchimp.com/es/marketing-glossary/ab-tests/) y autenticación. Las plataformas de seguridad de API deben proporcionar monitorización y pruebas para proteger tus API de vulnerabilidades.
- **Hashing de contraseña unidireccional:** el hashing de contraseña unidireccional mejora la seguridad mediante el cifrado, proporcionando una mejor protección. El hashing consiste en convertir una contraseña en datos que no se pueden reconvertir. Si alguien consigue hackear tu sistema, no tendrá acceso a tu contraseña porque estará encriptada, y no hay forma de que el hacker pueda volver a convertirla en la contraseña original.
- **HTTPS:** si alguna vez te has fijado en las URL de los sitios web, verás que aparece http o https delante de cada nombre de dominio. HTTP es un protocolo que permite la transmisión de datos por Internet. Además, hace posible la comunicación entre navegadores y servidores para mostrarte sitios web. El HTTPs es una extensión del HTTP, y la s significa "seguro." Un sitio web cifrado con SSL (Secure Sockets Layer), desarrollado para mantener protegidas las conexiones a Internet y la información confidencial, ofrece una comunicación a través de la red más segura para evitar ciberataques y filtraciones de datos. Al crear puntos finales de API, puedes utilizar HTTP o HTTPs, pero HTTPs siempre proporciona una mejor protección.
- **Validación de entradas:** las validación de entradas puede ayudar a identificar las ciberamenazas antes de que la solicitud vuelva al cliente. Cuando un sistema envía una solicitud, el punto final de API le dice al servidor exactamente dónde encontrarlo, por lo que validar las entradas del cliente puede evitar que el servidor envíe posibles amenazas al cliente.

## Descubre nuevas oportunidades de negocio con puntos finales de API

Compartir las API puede ayudar a las empresas a crecer y alcanzar el éxito, al tiempo que permite que otras empresas las utilicen de maneras que ayuden a prosperar a sus negocios.

Con las API, puedes integrar tus herramientas digitales para poder analizar los procesos internos y externos, las ventas, las actividades de marketing, la atención al cliente y mucho más.

Los puntos finales de API son la ubicación de un recurso que permite que dos sistemas interactúen entre sí. El software no puede comunicarse con otras herramientas sin API, y las API no funcionan sin los puntos finales.

Los propietarios de empresas pueden utilizar las integraciones para maximizar la productividad y la eficacia y al mismo tiempo recopilar datos de varias fuentes para crear informes y tomar mejores decisiones comerciales.

¿Quieres saber cómo hacer que los puntos finales de API te beneficien? Prueba nuestras integraciones de CRM hoy mismo para integrar Mailchimp con tus herramientas de marketing favoritas.



https://mailchimp.com/es/resources/what-is-an-api-endpoint/





https://www.tutorialesprogramacionya.com/springbootya/