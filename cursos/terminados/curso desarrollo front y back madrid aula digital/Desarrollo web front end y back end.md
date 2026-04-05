# Desarrollo web: front end y back end

(curso de madrid aula digital)



## Módulo 1: ¿Qué es el desarrollo web?

### 1.1. Programación, desarrollo y diseño

La industria tecnológica vinculada al desarrollo de páginas web y aplicaciones ha crecido mucho en los últimos años. Es más, ha crecido tanto que no existen suficientes personas con el conocimiento y la experiencia necesarias para cubrir estos puestos de trabajo.

👩‍💻Por esto, existen muchos cursos para impulsar la formación en este sector. Sin embargo, el mundo de la programación es muy amplio y los términos un tanto difíciles. Para aprender qué tareas realiza cada profesional, te compartimos la siguiente presentación:

- **Desarrollador o programador**

  Generalmente se utilizan ambas palabras como sinónimos. Sin embargo, un desarrollador hace más tareas que un programador.

  Un **Programador** web es alguien que se centra en escribir código para crear funcionalidades en un sitio web o una aplicación web.

  Un **desarrollador** tiene una visión más amplia de los proyectos. Se involucra en los requisitos tecnológicos, la optimización y el mantenimiento del producto.

- **¿Qué tipo de producto se desarrolla?**

  Según el producto que se esté desarrollando, una persona puede especializarse en:

  - Desarrollar aplicaciones y programas.
  - Desarrollar sitios web.

  Si bien los principios de programación son los mismos para crear aplicaciones o sitios web, la tecnología y las herramientas que se utilizan tienen ciertas diferencias. 

- **¿Se especializa en el diseño o en las funciones?**

  Para que una aplicación funcione correctamente, necesita que se preste atención a dos aspectos:

  - La interfaz o aspecto visual con el que interactúan las personas usuarias. (**Front end**)
  - La parte no visible que necesita de base de datos y peticiones a otros programas para, por ejemplo, enviar información de un formulario o iniciar sesión. (**back end**)

  Un desarrollador que se encarga de ambas partes es llamado **desarrollador full-stack**

- **Cuadro conceptual de repaso**

  ![image-20251112133126894](/home/soa/.config/Typora/typora-user-images/image-20251112133126894.png)

- **Otras especialidades**

  - **Especialista en redes:** diseña, implementa y mantiene redes que conectan dispositivos entre si y a internet.
  - **Especialista en aprendizaje automático:** brinda instrucciones a las computadoras para aprender y mejorar automáticamente a partir de datos. Se utiliza para entrenar inteligencia artificial
  - **Especialista en ciberseguridad:** Identifica vulnerabilidades y desarrolla estrategias para prevenir ataques cibernéticos.



En resumen, como desarrollador, una persona puede dedicarse a crear dos aspectos distintos de una aplicación o sitio web.**

- La interfaz o el diseño con el que interactúan los usuarios.
- La comunicación de la aplicación o sitio web con bases de datos y API que envían y almacenan información.

En función de estos dos aspectos, una persona se especializa en *front end* o *back end*. Sin embargo, todos los desarrolladores deben tener una visión global de cómo funcionan ambos aspectos.

![image-20251112133709925](/home/soa/.config/Typora/typora-user-images/image-20251112133709925.png)

Nota **: Diferencia entre **página web** y **aplicación web**:

La página web sirve principalmente para mostrar información estática o estáticamente dinámica, mientras que una aplicación web está diseñada para una interacción compleja y la realización de tareas por parte del usuario. Una página web es informativa y fácil de crear, mientras que una aplicación web es funcional, interactiva, compleja y siempre está actualizada. 

Un **sitio web** es una colección de páginas web relacionadas que comparten un mismo dominio, mientras que una **página web** es un único documento dentro de ese sitio.



### 1.2 Cómo se lleva adelante el desarrollo de un proyecto

Desarrollar un sitio web requiere mucho más que conocimientos de programación. No se trata solo de escribir código. Se debe prestar atención a otros aspectos como:

- Principios de diseño.
- La experiencia del usuario al navegar por el sitio web.
- Cómo se organizará la información en el sitio.
- Cuáles serán los elementos con los que podrá interactuar el usuario.
- Cómo y dónde se almacenará la información del usuario, por ejemplo, sus contraseñas o datos personales.
- Cuestiones de seguridad para proteger la navegación y la información confidencial del usuario.
- Los requisitos técnicos y de infraestructura, por ejemplo, servidores y conectividad, que se necesitarán para que el sitio web funcione correctamente.



#### **Desarrollar un proyecto full-stack paso a paso**

1. Definir el proyecto.
2. Seleccionar el lenguaje de programación.
3. Configurar el entorno de desarrollo.
4. Crear la estructura del proyecto.
5. Integrar la base de datos.
6. Desarrollar el front end.
7. Desarrollar el back end.
8. Probar la aplicación.
9. Desplegar el sitio web.
10. Mantenimiento.



##### 1. Definir el proyecto

- Identificar el objetivo del proyecto.
- Determinar las funcionalidades clave que debe tener el sitio web o aplicación.
- Pensar cuáles son las necesidades específicas de los usuarios.

En esta etapa es muy importante definir si el sitio web será:

- **Estático:** muestra la misma información a todas las personas. 

- **Dinámico:** el sitio adaptará el contenido al usuario, por ejemplo, saludándolo por su nombre al iniciar sesión o mostrando sus preferencias en una lista de compras.

  

##### 2. Seleccionar el lenguaje de programación.

Un **sitio web estático** no interactúa con el usuario, por lo tanto, no es necesario, desarrollar el back end. Solo será necesario definir el lenguaje de front end. Lo común es utilizar **HTML, CSS y JavaScript.**

Para desarrollar un **sitio web dinámico**, es necesario **comunicar el proyecto con una base de datos** que guarda la información de cada usuario. El código del back end suele escribirse en Python, PHP o Java.

Para comunicarse con la base de daros, también es necesario aplicar otros lenguajes de programación como SQL.



##### 3. Configurar el entorno de desarrollo.

El entorno de desarrollo es el programa que permite organizar y escribir código de una aplicación o sitio web. El más utilizado es **Visual Studi Code**. Puedes instalarlo de forma gratuita en tu ordenador.

Existen entornos de desarrollo virtuales, que no requieren de instalar programas. Un ejemplo es **GitHub Codespaces** que ofrece una gran cantidad de horas gratuitas para programar.

Algunos lenguajes de programación necesitan instalar extensiones y archivos en tu ordenador para que puedas utilizarlos.



##### 4. Crear la estructura del proyecto.

- Crear carpetas y archivos para organizar el código de tu aplicación o sitio web. Por ejemplo, una estructura de carpetas básicas en VS Code de un sitio web estático (sin back end) es:

  ![image-20251112140310443](/home/soa/.config/Typora/typora-user-images/image-20251112140310443.png)

- Para trabajar de forma colaborativa con un equipo de desarrolladores, es necesario publicar el código en un espacio virtual para que todos puedan acceder y trabajar en él. Para eso se utiliza un **sistema de control de versiones.** El servicio más común es **[Git Hub](https://github.com/).**

  

##### 5. Integrar la base de datos.

Las páginas web dinámicas necesitan **interactuar con una base de datos** que guarda información de los usuarios, por ejemplo, sus contraseñas.

Un desarrollador debe crear la base de datos en aplicaciones como **PostgreSQL** o **MySQL** y conectarla a su sitio web escribiendo código en el back end.

Es muy importante pensar con anterioridad los campos y la estructura de la base de datos para tu sitio web. **¿Qué información tendrás que guardar y cómo se relacionan los datos entre si?**



##### 6. Desarrollar el front end.

Utilizando HTML, CSS y JavaScript, los desarrolladores front end diseñan la interfaz, es decir, el **diseño del sitio web tal como lo verán los usuarios**.

El diseño front end implica plantear cómo serán los **componentes gráficos** del sitio. Por ejemplo, el menú, la barra de navegación, los botones, los títulos y el texto, entre otras cosas.

Además, se diseñan las **animaciones** y a través de que elementos del sitio el usuario puede **interactuar**.



##### 7. Desarrollar el back end.

Utilizando Python o PHP, por ejemplo, se escribe el código que permite hacer consultas a la base de datos y a otros sitios o servidores.

El back end se desarrolla solo para los **sitios web dinámicos**.

Por ejemplo, cuando deseamos que un usuario inicie sesión, el sitio web se conecta con una **base de datos** para verificar si el nombre de usuario existe y si la contraseña es correcta.



##### 8. Probar la aplicación.

Una vez desarrollado el front end y el back end, es importante realizar pruebas para garantizar que cada componente funcione correctamente. Es muy importante:

- Verificar que el back end y el front end se comunican de forma correcta. Por ejemplo, que al pulsar el botón "enviar" los datos de un formulario se almacenen en una base de datos.
- Realizar pruebas de rendimiento y de carga para corroborar que el sitio funciona cuando hay varios usuarios utilizándolo al mismo tiempo.



##### 9. Desplegar el sitio web.

Los desarrolladores llaman "desplegar el sitio" al hecho de **publicarlo** para que cualquier persona pueda acceder a él.

Para que un sitio web sea público debe **alojarse en un servidor**. Recuerda que un sitio web es una carpeta con muchos archivos dentro. Los servidores son espacios de almacenamiento en los que se guarda esta información.

Además, hay que **asociar un dominio al sitio web**, es decir, una **dirección** a través de la cual las personas podrán visitarlo. Existen nombres de dominios gratuitos, pero la mayoría son de pago. Puede adquirir un dominio por un tiempo, por ejemplo, un año. 	  



##### 10. Mantenimiento.

Una vez publicado el sitio web, es importante **monitorizar el rendimiento.**

El proceso de desarrollo de un sitio web no tiene un final. 

Constantemente se piensan mejoras y actualizaciones. Algunas relacionadas con mejorar la experiencia de navegación de los usuarios. Otras, generalmente, están relacionadas a **mejorar la seguridad del sitio.**

Es clave conocer las opiniones que los usuarios comparten a través de **reseñas** sobre su experiencia al navegar el sitio para aplicar mejoras.



Para realizar un sitio web de calidad son necesarias muchas personas. Esto suele ser así porque a medida que la tecnología avanza, cada parte del proceso se vuelve más complejo.

Por eso los desarrolladores suelen especializarse en una rama específica como diseño o seguridad.

Sin embargo, hoy en día también existen muchas herramientas que puede utilizar cualquier persona para crear su propio sitio web sin necesidad de tener conocimiento técnicos.	



#### 1.3 Ahora te toca a ti

Las personas que desarrollan aplicaciones desde el inicio, necesitan utilizar herramientas técnicas para hacerlo.

**Aprender a utilizar VS Code**

Es un editor de código desarrollado por Microsoft que está disponible de forma gratuita y es ampliamente utilizado por desarrolladores de software en todo el mundo.

Es una herramienta poderosa que ofrece una amplia gama de caracterísiticas y extensiones que hacen que la escritura y el desarrollo de código sea más eficiente y productivo.

Para descargarlo: https://code.visualstudio.com/



**Escribir código en herramientas en línea: CodePen**

Estas herramientas suelen ofrecer editores de código para los siguientes lenguajes: HTML, CSS y JavaScript. Estos lenguajes te permitirán practicar código para front end.

Se puede ver en tiempo real el resultado del código que se escribe, detecta errores en el código o da formato al documento para que esté más ordenado.

CodePen es un **editor de código fuente** que tiene las ventajas de ser en línea y gratuito. Para usuarlo, hay que crearse una cuenta en CodePen con un correo electrónico. https://codepen.io/trending

Desde la página principal de Code Pen, pulsa cualquiera de los botones Sing Up (**registrarse**) y elegir la opción de Sing Up with Email, donde se necesita rellenar los siguientes datos:

- **Nombre (name)**: no hace falta que sea tu nombre completo.
- **Nombre de usuario (username)**: el nombre que le des a tu cuenta.
- **Email**: escribe aquí tu correo electrónico.
- **Password**: una contraseña para tu cuenta.

Una vez completes tus datos, pulsa en Submit, para finalizar el registro.

**Espacio de trabajo:** se puede escribir el código de tu documento en el cuadro de la izquierda. en la parte de abajo, que inicialmente estará en blanco, se irá generando la página web según escribas el código.

![image-20251120154613392](/home/soa/.config/Typora/typora-user-images/image-20251120154613392.png)



**Crear sitios web sin escribir código**

Existen herramientas que te permiten crear sitios web sin escribir código, como las aplicaciones **Wix, WordPress o Google Sites**.

Estas herramientas son una buena alternativa para aquellas personas que están comenzando su microemprendimiento o proyecto personal y desean que las encuentren en internet.

Todas estas herramientas ofrecen diseños gratuitos con bastantes limitaciones. Si pagas, podrás acceder a más funcionalidades. Por ejemplo, no podrás usar el nombre de dominio que desees. Es decir, la URL o dirección de tu sitio web, no será personalizables sin una versión de pago.



## Módulo 2: Front end

### 2.1 ¿Qué es el front end?

El front end se enfoca en diseñar la interfaz de un sitio web, desde su estructura hasta los estilos. Esto supone definir los colores, texturas, tipografías, botones, secciones, entre otros.

El objetivo es que el usuario tenga una buena experiencia dentro del sitio web.

Un diseñador front-end debe tener cierto conocimiento o interés por el diseño. Los colores, las tipografías y estilos son importantes. También son relevantes las animaciones, ilustraciones e iconos. 

El desarrollador trabaja en conjunto con un equipo de diseño. Los profesionales del diseño que apoyan la creación de un sitio web y que se especializan en la experiencia de usuario, son conocidos como diseñadores UX. Mientras que otro grupo se dedica al diseño de interfaces de usuario y se les conoce como UI.

![image-20260108123148895](/home/soa/.config/Typora/typora-user-images/image-20260108123148895.png)

**Diseño UX**

El diseñador UX será capaz de diseñar el recorrido que la audiencia debe seguir para contratar un servicio o comprar un producto a través de una plataforma digital.

La fase de investigación es fundamental en el diseño de Experiencia de Usuario. Gracias a técnicas de research (Personas, Customer Journey, Benchmark, User Testing, etc). Los diseñadores UX analizan el público objetivo de una marca y diseñan la mejor experiencia.

Tareas del diseñador UX:

- Análisis de la competencia.
- Análisis del usuario.
- Wireframing.
- Prototipado.
- Testing.
- Coordinación con diseñadores UI.
- Coordinación con desarrolladores web.
- Análisis e iteración.



**Diseño UI**

El diseño visual es el look and feel de un producto digital y tiene que transmitir la personalidad de la marca.

Es la forma en la que el usuario interactúa con la web, la aplicación y demás. Si el usuario pulsa un botón, percibirá que la intención se ha producido con éxito.

Los diseñadores UI son los encargados de plasmar visualmente las decisiones de los diseñadores UX. Deben ser expertos en el manejo del software utilizado para diseño UI.

Tareas del diseñador UI:

- Branding.
- Diseño Gráfico.
- Prototipado UI.
- Implementación de la guía de estilo.
- Diseño de Interacción.
- Adaptación a todos los dispositivos.
- Coordinación con desarrolladores Web.



El equipo de diseño UX-UI se centra en investigar y diseñar la experiencia general que tendrán los usuarios al interactuar con un sitio web, definen las guías de estilo y el diseño de los complementos, por ejemplo, botones y barra de navegación.

Luego, el desarrollador front end debe traducir toda esa información a código y escribir el sitio web utilizando, por ejemplo, HTML, CSS y JavaScript.

Ambas partes trabajan en equipo y deben aprender a hablar entre ellos, es decir, cuanto más sepa de programación un diseñador UX, mejor podrá comunicar al desarrollador front-end lo que desea. Y lo mismo sucederá si el desarrollador front-end concoe los principios del diseño gráfico, por ejemplo.



**¿Qué herramientas utilizan estos equipos para realizar el diseño de un sitio web?** 

Existen aplicaciones como **Figma** y **Adobe XD** que permiten volcar en dibujos las ideas de los diseñadores, posibilitando la creación de wireframes, maquetas y prototipos.

- Los wireframes o bosquejos son representaciones muy sencillas de una página web hechas a mano. Estas muestran la disposición de los elementos básicos del sitio web, tales como, texto, imágenes y botones.

  ![image-20260108124404920](/home/soa/.config/Typora/typora-user-images/image-20260108124404920.png)

- Las maquetas son representaciones estáticas y visuales. Si son de alta fidelidad pueden mostrar colores, tipografía e imágenes.

- Los prototipos son representaciones interactivas del diseño web. Permiten probar la navegación de un usuario a través del sitio, conectando cada página a través de elementos interactivos, como por ejemplo, botones.

Herramientas como **Figma** permiten traducir el diseño creado por los especialistas en UI a código que el desarrollador puede copiar directamente en su desarrollo.

Explora las maquetas de una aplicación para reservar comida haciendo [clic aquí](https://www.figma.com/design/woQeVxOHrzuoIk5N7JjNvK/FoodTrucks?node-id=0-1). 



### 2.2. ¿Qué lenguajes de programación existen para front-end?

un desarrollador **front end** escribe código en HTML, CSS y JavaScript. Estos son los tres pilares del diseño web. 

Hoy en día, existen otras formas de desarrollar sitios web, por ejemplo, utilizando **frameworks**. Un **framework** es un código predefinido con funciones que el desarrollador puede utilizar para desarrollar sitios web de una forma más rápida. 

Los **frameworks** son más difíciles de aprender si no se tiene una base de conocimientos sobre HTML, CSS y JavaScript. Pero con el tiempo simplifican la escritura del código.

Ejemplos de los **frameworks** más utilizados actualmente son **React** y **Angular**. 

El lenguaje **HTML** es un **lenguaje de marcado** o **de marcas**, funciona a base de **etiquetas**, que son identificadas e interpretadas por los navegadores web para conocer la estructura básica de una página web.

📝 Con HTML podemos escribir el texto, la estructura, los enlaces e hipervínculos e insertar los archivos multimedia que van en una página web, como vídeos o imágenes. Pero no es el único lenguaje que encontraremos en estos documentos.

Junto con HTML, encontramos **CSS**, siglas de **Cascade Style Sheets**, que se traduce en español como hojas de estilo en cascada.

🎨 CSS es un lenguaje de diseño que define el estilo que va a tener la página web. Es decir los colores, el espaciado entre los elementos de una página web o el tamaño y tipo de letra que hay.

👉 Antes de continuar, en la infografía que tienes a continuación tienes información básica sobre los lenguajes HTML y CSS, así como sus ventajas y desventajas.

![image-20260108161845272](/home/soa/.config/Typora/typora-user-images/image-20260108161845272.png)

**Ventajas del lenguaje HTML**

- Lenguaje reconocido universalmente.
- Es fácil de aprender.
- Facilita la integración con otros lenguajes de programación.
- Está hecho en base a código abierto y gratuito.

**Desventajas del lenguaje HTML**

- Es un lenguaje estático y no permite almacenar ni enviar información.
- Su velocidad de carga e interpretación varia según los diferentes navegadores.
- Requiere escribir cada página individualmente.



**Ventajas del lenguaje CSS**

- Facilita la separación de diseño y contenido.
- Ahorra tiempo al aplicar estilos de manera global.
- Permite adaptar estilos a diferentes dispositivos.
- Genera archivos ligeros que garantizan una carga rápida.

**Desventajas del lenguaje CSS**

- Problemas potenciales con la visualización en ciertos navegadores.
- Tiene una mayor curva de aprendizaje que el lenguaje de HTML.

Estos dos lenguajes son el **núcleo** de las páginas web y las principales herramientas con las que cuenta un desarrollador web. 

Por otro lado, en muchos sitios web también encontraremos **lenguajes de programación**, como JavaScript. 

⚙️ En el **front end**, JavaScript permite diseñar la interacción que se llevará a cabo al activar ciertos elementos. Por ejemplo, si al apretar un botón deseo que el usuario sea redirigido a otra página. 



### 2.3. Elementos del front end

**HTML es el esqueleto de un sitio web.** Define la estructura básica y los elementos de contenido, como encabezados, párrafos, listas y enlaces. 

Gracias a HTML, los usuarios pueden ver el contenido de una página web de forma organizada y estructurada. Por ejemplo, pueden leer artículos en un blog, ver imágenes en una galería o navegar por diferentes secciones de un sitio.

**CSS es el aspecto físico del sitio.** Define cómo se ven los elementos HTML, incluyendo colores, fuentes, márgenes, tamaños y diseños.

Gracias a CSS, los usuarios pueden disfrutar de una experiencia visual atractiva y coherente en un sitio web. Por ejemplo, pueden ver un diseño moderno y limpio, con colores agradables y texto fácil de leer.

**JavaScript es como el cerebro y los músculos de un sitio web.** Agrega interactividad, dinamismo y funcionalidad a una página web, permitiendo que los elementos HTML y CSS respondan a las acciones del usuario.

![image-20260108162404593](/home/soa/.config/Typora/typora-user-images/image-20260108162404593.png)

**En síntesis, un desarrollador front end deberá prestar atención a los siguientes elementos del sitio web:**

> Cómo se organizan las diferentes páginas del sitio web y a través de qué elementos se vinculan entre sí.
>
> El diseño de cada página. Por ejemplo, dónde se ubica el menú, los botones y formularios, pensando en que el diseño sea fácil de navegar.
>
> Ubicar y dar formato al contenido web, ya sean imágenes, vídeos, texto, formularios, ¡lo que sea!
>
> Respetar las guías de estilo definidas por los diseñadores UX / UI.
>
> Garantizar que el sitio web es accesible para todos los usuarios sin distinción.
>
> Mejorar el rendimiento del sitio web y la velocidad de carga creando un diseño óptimo.



### 2.4. ¡Ahora te toca a ti!

Nuestra primera propuesta es que te animes a utilizar Figma para explorar cómo se construyen maquetas y prototipos. Sigue los siguientes pasos:

1. Ingresa al sitio web de [Figma](https://www.figma.com/). Puedes trabajar online, ¡no hace falta que descargues el programa! 
2. Crea una cuenta de usuario. Puedes registrarte utilizando tu cuenta de Google.
3. En la esquina inferior izquierda encontrarás el botón para explorar la comunidad.
4. Puedes elegir distintos diseños para explorar. Encontrarás desde iconos y guías de estilo hasta prototipos de aplicaciones completas para navegar por ellas.
5. Utiliza los filtros. Te recomendamos explorar la sección denominada files + templates. Elige aquellos archivos que sean gratuitos. Aquí tienes un enlace para acceder directamente a [Archivos Figma de moda etiquetados como wireframe | Comunidad Figma.](https://www.figma.com/community/tag/wireframe/files/figma/free)
6. Selecciona la opción que más te interese y navega por el documento. Descubre todos los aspectos que tiene en cuenta un desarrollador front end y un diseñador UX / UI a la hora de crear un sitio web.

![image-20260108162734991](/home/soa/.config/Typora/typora-user-images/image-20260108162734991.png)

Otra opción para conocer sobre el diseño web es utilizar la herramienta **Inspeccionar** de Google Chrome o de cualquier navegador. ¡Te mostramos cómo funciona!

**puedes modificar aspectos del CSS de un sitio web desde el navegador?** Esta herramienta es muy útil para conocer cómo funcionan los estilos de CSS. Te mostramos cómo.

<iframe src="https://www.canva.com/design/DAGAP05GMm0/jerkX9xnTlCVVZ_1frllzQ/view?embed" allowfullscreen="allowfullscreen" loading="lazy" style="box-sizing: border-box; margin: 0px; padding: 0px; border: none; font-weight: 400; font-style: normal; font-size: 16px; font-family: inherit; vertical-align: baseline; max-width: 100%; width: 615px; height: 345.938px; top: 0px; left: 0px;"></iframe>

 

## Módulo 3: Back end

 El back-end son todos los códigos ocultos que sirven para que una página web o aplicación funcione correctamente. Sobre todo cuando esa página web necesita recopilar información del usuario. 

### 3.1. ¿Qué es el back end?

El *back end* es la parte **invisible** de un sitio web o aplicación. 

Es como el **motor** que hace que todo funcione detrás de escena.

Maneja la lógica, la gestión de datos y la comunicación con el servidor en el que se aloja la información.



**¿Qué hace un desarrollador back end?**

Un desarrollador *back end* es el constructor de este **motor**. Es responsable de escribir el código que hace que el sitio web se comunique con el servidor. 

Esta comunicación consiste en **envíos de peticiones.** Se determina qué tipo de información se le pedirá al servidor y cómo deben procesarse los datos que el servidor envía al sitio web.

Los usuarios no ven cómo sucede todo esto, por eso suele ser mucho más complicado el *back end* en comparación al *front end*.

Un desarrollador **back end** debe prestar atención a la lógica, la gestión de datos y la comunicación con el servidor.

En el desarrollo web, la **lógica** se refiere a las **reglas y procesos que determinan cómo se comporta el sitio web**. Por ejemplo, cuando un usuario realiza una acción como hacer clic en un botón, la lógica determina qué sucede a continuación. 

En el **back end,** los desarrolladores escriben código para implementar esta lógica. Esto puede incluir la autenticación de usuarios, la validación de datos o la generación de contenido dinámico. 

**¿Qué es el contenido dinámico?** Cuando, por ejemplo, al iniciar sesión en un sitio web, la página principal muestre un cartel llamándote por tu nombre y brindando información específica que refiere a tu sesión: “¡Bienvenida Lucía! Tienes 3 mensajes nuevos.” 

Las aplicaciones web a menudo necesitan **almacenar y manipular datos**, como perfiles de usuario, publicaciones en un blog, productos en una tienda en línea, entre otras funciones. 

El **back end** se encarga de gestionar estos datos. Esto implica **crear y mantener una base de datos** donde se guarda la información. También hay que escribir código que establezca las reglas para agregar, modificar o eliminar datos y asegurarse de que los datos se manejen de manera segura y eficiente.



Por ejemplo, imagina que estás en una red social y encuentras a tu amigo Pedro. Haces clic o pulsas en la opción “seguir a Pedro”. Esto genera una acción desencadenada por el back end que guarda en la base de datos que ahora sigues a Pedro. En el futuro, cuando inicies sesión y veas el listado de las personas a las que sigues, el back end traerá la información desde la base de datos y mostrará el nombre de Pedro.

**El servidor es la infraestructura en la que se almacena toda la información.** El **back end** se encarga de manejar la comunicación entre el navegador de cada uno de los usuarios que visitan la web y el servidor.

### 3.2. ¿Qué lenguajes de programación se utilizan en back end?

Un **framework** te permite programar instrucciones de una forma más automática, lo cual aumenta la productividad y permite realizar muchas acciones con menor cantidad de código.

Es clave que las personas que se dedican a programar se actualicen constantemente.

![image-20260108163505985](/home/soa/.config/Typora/typora-user-images/image-20260108163505985.png)

### 3.3 Elementos del back end

**Inicio de sesión**

Cuando iniciamos sesión en un sitio web introduciendo nuestro nombre de usuario y contraseña, el front envía esa información al back end.

El back end verifica si las credenciales son correctas, accede a la base de datos para buscar el usuario correspondiente y, si todo está bien, devuelve una respuesta al front end permitiendo el acceso.



**Búsqueda de productos**

Cuando realizamos una búsqueda en un sitio web, el front end envía la consulta de búsqueda al back end.

El back end procesa esta consulta, busca los productos correspondientes en la base de datos y devuelve los resultados al front end para que los muestre al usuario.



**Registro de usuarios**

Al registrarnos en un sitio web, introducimos nuestra información en un formulario.

El front end envia datos al back end, que los procesa y guarda en la base de datos.

Luego, el back puede enviar una respuesta al front end confirmando que el registro ha sido exitoso.

**Envío de mensajes**

En una aplicación de mensajería, cuando enviamos un mensaje a otro usuario, el *front end* envía el contenido del mensaje al *back end.* 

El *back end* gestiona el envío del mensaje al destinatario, lo guarda en la base de datos y notifica al destinatario que tiene un nuevo mensaje.



**Carrito de compra**

Cuando añadimos un producto al carrito de compra en una tienda en línea, el *front end* envía esta información al *back end.* 

El *back end* actualiza la información del carrito en la base de datos, calcula el total de la compra y gestiona la información del pago.

Luego, el *back end* envía una respuesta al *front end* con los detalles actualizados del carrito.



En resumen, el **back end** es responsable de manejar todas las operaciones y la lógica detrás de escena en una web, incluyendo la autenticación de usuarios, el procesamiento de datos, la gestión de transacciones y la comunicación con la base de datos. 

el **back end** trabaja en segundo plano para garantizar que la aplicación funcione de manera eficiente y segura.



### 3.4. ¡Ahora te toca a ti!

En estos sitios web podrás aprender y poner en práctica a través de pequeños ejercicios la habilidad de escribir código. Te animamos a escribir algunas líneas de código. Elige el lenguaje que más te interese. 

[Exercism:](https://exercism.org/) - Traduce automáticamente la página con el traductor de Google cuando ingreses.

usuario: la_well

clave: 160202es



**Instalación:**

There are three steps to get started:

1. **Install [Exercism's CLI](https://exercism.org/cli-walkthrough).**

   **Download the archive**

   If you know your processor architecture (x86 (32-bit) vs x86_64 (64-bit) vs ARM), download the appropriate archive from the [releases page](https://github.com/exercism/cli/releases/latest).

   **Extract from the archive**

   Once you have the archive downloaded you need to extract the executable from it.

   - If you’re using a graphic interface (e.g., GNOME or Unity on Ubuntu): go to your downloads directory, right click on the downloaded file and select *Extract Here*.

   - If you’re using the command line (use the right archive file name for your architecture):

     ```uiua
     tar -xf exercism-3.5.8-darwin-arm64.tar.gz
     ```

   

   1. 

   

   **Moving the Executable to `~/bin`**

   Once you download and extract the archive, make it available in your `$PATH`.

   First, let’s make sure the directory exists:

   ```
   mkdir -p ~/bin
   ```

   Next, let’s move the `exercism` executable there:

   ```
   mv exercism ~/bin
   ```

   Make sure everything worked:

   ```
   ~/bin/exercism
   ```

   The above should output something like the below:

   ```
   A command-line interface for the v3 redesign of Exercism.
   
   Download exercises and submit your solutions.
   
   Usage:
      [command]
   ```

   

2. Install [Java's tooling](https://exercism.org/docs/tracks/java/installation).

3. Download this exercise:

   ```
   exercism download --track=java --exercise=hello-world
   ```

   
   

Utilización:

https://exercism.org/docs/tracks/java/tests#h-linux

## Linux

1. In the terminal window, get the first exercise:

   ```sh
   exercism download --exercise hello-world --track java
   ```

2. Change directory into the exercise:

   ```sh
   cd /home/johndoe/exercism/java/hello-world
   ```

3. Run the tests:

   ```sh
   ./gradlew test
   ```

   *(Don't worry about the tests failing, at first, this is how you begin each exercise.)*

   If you get the following error:

   ```sh
   ./gradlew: Permission denied
   ```

   Then the file is missing the execute permission. To fis this, run:

   ```sh
   chmod +x ./gradlew
   ```

   And now you should be able to run the previous command.

4. Solve the exercise. Find and work through the `instructions.append.md` guide ([view on GitHub](https://github.com/exercism/java/blob/main/exercises/practice/hello-world/.docs/instructions.append.md#tutorial)).

   

[Code.org:](http://code.org/) - Explora los proyectos y súmate a desafíos colectivos.

[Code Avengers](https://www.codeavengers.com/jr): - Tienes opción en español.



## ¡Sigue a influencers que enseñan programación!

🤔Ingresar al mundo de la programación puede ser un poco complicado. Por eso te recomendamos comenzar a seguir a personas que enseñan a programar de forma sencilla en las redes sociales. 

**📺 Nuestras recomendaciones son:**

> [Carpi Coder](https://www.youtube.com/@carpicoder)
>
> [MiduDev](https://www.youtube.com/c/midudev)

📌 Estos son sus canales de YouTube, pero puedes buscarlos en otras plataformas como Twitch, TikTok e Instagram.

# ¿Quieres aprender más?

## Investiga en MDN Web Docs

🙌 Si quieres continuar con tu formación explorando las características de los elementos más importantes del desarrollo web, puedes utilizar MDN Web Docs como punto de partida para conocer cómo funciona HTML, CSS y JavaScript.

Es un repositorio para desarrolladores web, totalmente gratuito.

**🔗 Puedes acceder a estos repositorios pulsando en los enlaces a continuación.**

> [HTML: Lenguaje de etiquetas de hipertexto | MDN](https://developer.mozilla.org/es/docs/Web/HTML) 
>
> [CSS - Aprende desarrollo web | MDN ](https://developer.mozilla.org/es/docs/Learn/CSS)
>
> [JavaScript - Aprende desarrollo web | MDN ](https://developer.mozilla.org/es/docs/Learn/JavaScript)
