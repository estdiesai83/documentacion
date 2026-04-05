# DESARROLLO DE APLICACIONES CON JAVA

Curso IFCT034PO-GRUPO 2 DESARROLLO DE APLICACIONES CON JAVA

aspasia: https://campusvirtual.grupoaspasia.com/login/index.php

Usuario: 52118321e

contraseña: 52118321e



## Instalación:

### JDK (Java Development Kit): 

software que provee herramientas de desarrollo para la creación de programas en Java. Puede instalarse en una computadora local o en una unidad de red.

https://www.oracle.com/java/technologies/downloads/

### Apache Netbeans: 

NetBeans es un entorno de desarrollo integrado libre, hecho principalmente para el lenguaje de programación Java. Existe además un número importante de módulos para extenderlo. NetBeans IDE es un producto libre y gratuito sin restricciones de uso

https://netbeans.apache.org/download/index.html

### Documentación para JDK.

[Documentación de JDK 17 - Inicio (oracle.com)](https://docs.oracle.com/en/java/javase/17/index.html)



[Apache HTTP Server](https://httpd.apache.org/) es un software de servidor web gratuito y de código abierto para plataformas Unix con el cual se ejecutan el [46% de los sitios web](https://w3techs.com/technologies/details/ws-apache/all/all) de todo el mundo. Es mantenido y desarrollado por la Apache Software Foundation.

Un [servidor web](https://www.hostinger.es/tutoriales/que-es-un-servidor-web) es un programa de tipo informático que se encarga de procesar una aplicación del lado del servidor, cada una de las cuales puede acceder a archivos almacenados en un servidor físico y usarlos para diferentes propósitos, mediante conexiones bidireccionales o unidireccionales con la máquina del cliente, tras lo cual se genera una respuesta del lado del cliente.

El trabajo de un servidor es servir sitios web en Internet. Para lograr ese objetivo, actúa como un intermediario entre el servidor y las máquinas de los clientes. Extrae el contenido del servidor en cada solicitud de usuario y lo envía a la web.  Los servidores web procesan archivos escritos en diferentes lenguajes de programación como PHP, [Python, Java](https://www.hostinger.es/tutoriales/java-vs-python) y otros.

Los convierten en archivos HTML estáticos y le entregan estos archivos al navegador de los usuarios de la web.

Aunque llamamos a Apache un servidor web, no es un servidor físico, sino un software que se ejecuta en un servidor. Su trabajo es establecer una conexión entre un servidor y los navegadores de los visitantes del sitio web (Firefox, Google Chrome, Safari, etc.) mientras envían archivos entre ellos (estructura cliente-servidor). Apache es un software multiplataforma, por lo cual funciona tanto en servidores Unix como en Windows.

Cuando un visitante quiere cargar una página de tu sitio web, por ejemplo la página de inicio o tu página “Acerca de nosotros”, su navegador le envía una solicitud a tu servidor y Apache le devuelve una respuesta con todos los archivos solicitados (texto, imágenes, etc. ) El servidor y el cliente se comunican a través del protocolo HTTP y Apache es responsable de garantizar una comunicación fluida y segura entre las dos máquinas.

Apache es altamente personalizable, ya que tiene una estructura basada en módulos. Los módulos le permiten a los administradores del servidor activar y desactivar funcionalidades adicionales. Apache tiene [módulos](https://httpd.apache.org/docs/2.4/mod/) de seguridad, almacenamiento en caché, reescritura de URL, autenticación de contraseña y más. También puedes ajustar tus propias configuraciones del servidor a través de un archivo llamado [.htaccess](https://www.hostinger.es/tutoriales/que-es-el-archivo-htaccess), que es un archivo de configuración de Apache compatible con todos los planes de [Hostinger](https://www.hostinger.es/).





# Introducción al curso

Este curso en DESARROLO DE APLICACIONES CON JAVA. A lo largo de esta formación diseñaremos e implementaremos arquitecturas JAVA. Estudiaremos la programación orientada a objetos, la programación web con JAVA y la programación web con PHP.

Además veremos Java Struts 2.0 avanzado, spring mvc e hibernate.



**Índice de contenidos**

1. PROGRAMACIÓN ORIENTADA A OBJETOS

2. APLICACIONES WEB CON JAVA

3. JAVA STRUTS 2.0 AVANZADO

4. SPRING MVC

5. HIBERNATE



# 1. PROGRAMACIÓN ORIENTADA A OBJETOS

## Introducción

En este primer tema veremos cómo podemos desarrollar una aplicación JAVA orientada a objetos, así como sus distintas clases y ejemplos prácticos de cada punto del tema.



## Objetivos

- Conocer como desarrollar una aplicación JAVA.
- Aprender a trabajar con aplicaciones JAVA orientada a objetos.



## Mapa conceptual

![image-20240916154303500](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240916154303500.png)



## Introducción a la programación orientada a objetos

Hoy en día el paradigma de orientación a objetos es el más utilizado para programar y lo podemos encontrar en la mayoría de los lenguajes de programación más utilizados: Java, PHP, C++, etc.

El paradigma de programación orientada a objetos es un enfoque para el desarrollo de aplicaciones en el que los datos se estructuran en objetos que realizan determinadas acciones a través de funciones.



En un **entorno** más **clásico** de **programación** el problema o sistema que se está analizando se divide en funciones, cada función sólo operaba con sus parámetros de entrada y no modificaba información externa a ella.

En la **programación orientada a objetos** los programas se codifican en **objetos** que **interactúan**.



**Los objetos tendrán unas determinadas propiedades y serán capaces de hacer ciertas cosas mediante los métodos (funciones) que se les hayan definido en plantillas denominadas clases.**

Si se hace un buen diseño de los objetos y su interacción, se podrán usar en nuevos programas y proyectos fácilmente, favoreciendo la reusabilidad.



### Un poco de historia

JAVA fue creado como una herramienta de programación para ser usada en un proyecto de set-top-box en una operación denominada the Green Project en **Sun** **Microsystems** en el año **1991**. El Green Team, el cual está compuesto por 13 personas contando con James Gosling a la cabeza, trabajó durante 18 meses en Sand Hill Road en Menlo Park en su desarrollo.

El lenguaje fue denominado inicialmente como Oak (nombre que fue dado por un roble que había fuera de la oficina), después cambió su denominación a "Green" tras descubrir que Oak era una marca comercial de adaptadores de tarjetas gráficas, así que posteriormente cambió su nombre a JAVA.

Es frecuentada por algunos de los miembros del equipo. Lo que no está claro es si se trata de un acrónimo o no, aunque hay ciertas fuentes que hacen indicar que son las iniciales de sus diseñadores: **J**ames Gosling, **A**rthur **V**an Hoff y **A**ndy Bechtolsheim. Otros apuestan por el siguiente acrónimo: **J**ust **A**nother **V**ague **A**cronym ("solo otro acrónimo ambiguo más")

La hipótesis que más suena es que el nombre de JAVA hace referencia a un tipo de café que se servía en un bar cercano, de ahí que el icono sea una taza de café desprendiendo vapor. Otra pista puede ser los 4 primeros bytes de los archivos .class bytes que en hexadecimal nos dan lo siguiente 0xCAFEBABE. Y a pesar de todas estas teorías, parece que el nombre fue sacado de una lista aleatoria.

Lo que Gosling pretendía hacer es implementar una máquina virtual (MV) con una estructura y lenguaje que fuese similar a la de C++. Entre los meses de Junio y julio de 1994, tras una enorme sesión de varios días de John Gaga, James Gosling, Patrick Naughton, Wayne Rosing y Eric Schmidt, el equipo reorientó la plataforma hacia el entorno web. Previeron que la llegada de Mosaic (un navegador web) haría que Internet se convirtiese en un medio interactivo. Naughton se puso manos a la obra y creo un prototipo de navegador web llamado "WebRunner", al que más tarde se le conocería con el nombre de HotJAVA.

Allá por el año 1994 a los altos cargos de Sun se les hizo una demostración de HotJAVA. La primera versión de JAVA pudo descargarse por primera vez allá por el año 1994, pero no fue hasta el 23 de mayo del año siguiente cuando se vieron las versiones públicas de JAVA y HotJAVA, el navegador Web. El acontecimiento fue anunciado por John Gage, el Director Científico de Sun Microsystem. Además, el acto contó con una sorpresa, Marc Andreseen, vicepresidente ejecutivo de Netscape, anunció que su navegador soportaría JAVA el 9 de enero de 1996, SUN fundó el grupo **JavaSoft** para encargarse de toda la parte del desarrollo tecnológico. Fué dos semanas más tarde cuando la primera versión de JAVA fue publicada.

La promesa inicial, decía "Write Once, Run Anywhere", haciendo que el lenguaje de programación sea independiente a la plataforma, y proporcionando una máquina virtual de ejecución para aquellas plataformas más populares logrando así que el código pudiese ser ejecutado en cualquier plataforma.

El entorno de ejecución era algo relativamente seguro, así que los principales navegadores empezaron a dar soporte a la ejecución de applets JAVA dentro de las páginas web.

Java ha experimentado numerosos cambios desde la versión primigenia, JDK 1.0, así como un gran incremento en el número de clases y de paquetes que forman la biblioteca base.

Desde la versión J2SE 1.4, todo cambió en el lenguaje ha sido regulada por la "JAVA Community Process" (JCP), la cual se basa en Java Specificatión Request (JSRs) para proponer cambios futuros a la plataforma. El lenguaje está especificado en la JLS (la "JAVA Language Specification"). Los cambios en los JLS son gestionados en JSR 901.

- **JDK 1.0** (23.01.1996). Primer comunicado y lanzamiento de prensa.

- **JDK 1.1** (19.02.1997). Primeras adiciones incluidas: comunicado de prensa.

  ![image-20240917190956730](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240917190956730.png)

- **JDK 1.2** (08.12.1998). Nombre clave Playground. Tanto esta como las siguientes versiones fueron recogidas bajo la versión Java 2 y el nombre J2SE (Java 2 Platform, Standart Edition), reemplazó a JDK para diferenciar la plataforma base de J2EE (Java 2 Platform Enterprise Edition) y la J2ME (Java 2 Platform, Micro Edition). Otras mejoras añadidas incluían:

  ![image-20240917191440075](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240917191440075.png)

- **J2SE 1.3** (08.05.2000). Nombre clave Krestel. Los cambios más destacados son:

  ![image-20240917191723166](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240917191723166.png)

- **J2SE 1.4** (06.02.2002). Nombre clave Merlin. Fué el primer lanzamiento de la plataforma JAVA desarrollado bajo el control de la comunidad JAVA como JSR 59. Los cambios más notables fueron:

  ![image-20240917191946173](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240917191946173.png)

- **J2SE 5.0** (30.09.2004). Nombre clave Tiger. Desarrollado bajo JSR 176, Tiger incorporó un gran número de nuevas características.

  ![image-20240917192148395](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240917192148395.png)

- **Java SE 6** (11.12.2006). Nombre clave Mustang. Estuvo en desarrollo bajo la JSR 270. Para esta versión SUN cambió el nombre "J2SE" por "Java SE" y eliminó el .0 del número de versión. Los cambios más destacables son:

  ![image-20240917192513853](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240917192513853.png)

- **Java SE 7**. (Julio de 2011) Nombre clave Dolphin. Aún se encontraba en las primeras etapas de planificación allá por el año 2006. 

  ![image-20240917192807335](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240917192807335.png)

- **Java SE 8** (Marzo 2014). 

  ![image-20240917192918977](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240917192918977.png)

- **Java SE 9** (21.09.2017).

  ![image-20240917193012982](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240917193012982.png)

- **Java SE 10** (20.03.2018). 

  ![image-20240917193142251](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240917193142251.png)

- **JDK 11** (25.09.2018). Al escribir este manual (2021), la versión está abierta para correcciones de errores. Ofrece LTS (Long Term Support), o soporte a largo plazo. Entre otros, Java 11 incluye una serie de nuevas características, tales como:

  ![image-20240917193616615](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240917193616615.png)

  ![image-20240917193648178](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240917193648178.png)

  Se descartaron varias características de versiones anteriores, en particular los applets Java y Java Web Start ya no están disponibles. Los módulos JavaFX, Java EE y Corba se han eliminado del JDK.

- **JDK 12** (19.03.2019). 

  ![image-20240917193934259](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240917193934259.png)

- **JDK 13** (17.09.2019)

  ![image-20240917194023593](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240917194023593.png)

- **JDK 14** (17.03.2020). Incluye la siguientes características nuevas, así como "cientos de mejoras pequeñas y miles de correcciones de errores".

  ![image-20240917194356835](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240917194356835.png)

  ![image-20240917194519324](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240917194519324.png)

- **Java 15** (15.09.2020). Añade por ejemplo compatibilidad con literales de cadena de varías líneas (también conocidos como bloques de texto). Los recolectores de basura Shenandoah y Z ya están listos para su uso en producción (es decir, ya no están marcados como experimentales). Se descarta la compatibilidad con el sistema operativo Solaris de Oracle ( y las CPU SPARC) (mientras sigue estando disponible en Java 11, por ejemplo). Se elimina el motor de JavaScript de Nashorn. También se han eliminado algunos certificados raíz de CA.

  ![image-20240917195049653](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240917195049653.png)

  ![image-20240917195138349](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240917195138349.png)

- **Java 16** (16.03.2021). Elimina las opciones de compilación ahead-of-time (Y Graal Jit). La implementación de Java está escrita en C++, mientras que a partir de Java 16 se utiliza C++14 más reciente (aunque todavía no se utiliza C++17 o C++20). El código también se movió a GitHub (dejando  el sistema de control de código fuente Mercurial).

  ![image-20240917195733417](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240917195733417.png)

  ![image-20240917195822956](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240917195822956.png)

### Comprobar versión de Java

Las versiones de Java anteriores a la versión 9 simplemente tenían un esquema de nomenclatura diferente.  Por lo tanto, Java 8 también se puede llamar 1.8, Java 5 se puede llamar 1.5, etc. Cuando se lanza el comando "java -version" con estas versiones, obtenemos un resultado como el siguiente:

C:\Users\dell>java -version
java version "17.0.12" 2024-07-16 LTS
Java(TM) SE Runtime Environment (build 17.0.12+8-LTS-286)
Java HotSpot(TM) 64-Bit Server VM (build 17.0.12+8-LTS-286, mixed mode, sharing)



Nota: el comando java -version se introduce en la pantalla de símbolo de sistema (cmd).



### Diferencia entre JRE y JDK

Hay que diferenciar entre JRE (Java Runtime Environment) y JDK (Java Development Kit).

Históricamente, se descargaba sólo un JRE si sólo estábamos interesados en ejecutar programas Java. Un JRE incluye, entre otras cosas, la Maquina Virtual Java (JVM) y la herramienta de línea de comandos "java".

Para desarrollar nuevos programas, es necesario descargar un JDK. **Un JDK incluye todo lo que un JRE tiene, así como el compilador javac y un par de herramientas como javadoc (generador de documentación de java) y jdb (Java Debugger).**

Hasta Java 8, el sitio web de Oracle ofrecía JREs y JDKs como descargar separadas, aunque el JDK también siempre incluía un JRE en una carpeta independiente. Con Java 9 esa distinción desaparece, y siempre se descarga un JDK. La estructura de directorios de los JDKs también cambió, ya que no tenía una carpeta JRE explícita.

Por lo tanto, a pesar de que algunas distribuciones todavía ofrecen una descarga JRE separada, la tendencia es ofrecer un sólo JDK. Por lo tanto, vamos a utilizar Java y JDK indistintamente a partir de ahora.



### Distribuciones Java

Las distribuciones de Java deben ser compatibles con Java SE (Standard Edition).

Hay una serie de distribuidores que crean esas compilaciones, las certifican y después las distribuyen. Aunque los proveedores no pueden, por ejemplo, eliminar un método de la clase String antes de producir una nueva compilación java, pueden agregar personalización de marca o agregar algunas utilidades (por ejemplo, CLI Command Line Interface) que consideren útiles. Pero aparte de eso, **el código fuente original es el mismo para todas las distribuciones Java.**



#### OpenJDK y Oracle JDK

Uno de los proveedores que crea Java desde el origen es Oracle. Esto implica dos distribuciones Java diferentes, que pueden ser muy confusas al principio.

**OpenJDK** es compilado por Oracle. Estas compilaciones son gratuitas y sin marca, pero Oracle no lanzará actualizaciones para versiones anteriores, por ejemplo para Java 15, tan pronto como salga Java 16.

**Oracle JDK** es una compilación comercial a partir del cambio de licencia en 2019. Lo que significa que se puede utilizar de forma gratuita durante el desarrollo, pero que debemos de pagar a Oracle si lo utilizamos en producción. Obtendremos un soporte más largo, actualizaciones de versiones y un número de telefono de soporte.

Históricamente (anterior a Java 8) había diferencias de origen reales entre las compilaciones OpenJDK y las compilaciones OracleJDK donde se podía decir que OracleJDK era "mejor". Pero en la actualidad, ambas versiones son esencialmente las mismas, con diferencias menores.

#### AdoptOpenJDK

En 2017, los grupos de usuarios, desarrolladores y proveedores de Java (Amazon, Microsoft, Pivotal, Red Hat y otros) iniciaron una comunidad, llamada AdoptOpenJDK.

Proporcionan compilaciones OpenJDK gratuitas y sólidas con disponibilidad y actualizaciones más largas e incluso le ofrecen la elección de dos máquinas virtuales de Java diferentes: HotSpot y OpenJ9.

Es muy recomendable si estamos buscar Java

#### Otras distribuciones

En el sitio OpenJDK Wikipedia encontraremos una lista completa de compilaciones de OpenJDK. Entre ellas se encuentran Azul Zulu, Amazon Corretto y SnapMachine, entre otras. Cada una con diferentes opciones de soporte y garantías de mantenimiento.



### Que versión de Java instalar

En la actualidad Java saca versiones cada seis meses. En general, para asegurarnos de utilizar los IDEs (entornos de desarrollo integrados), frameworks y herramientas de compilación más recientes e iniciar un proyecto completamente nuevo, podemos utilizar una de las últimas versiones.

Sin embargo, muchas empresas siguen ancladas en la versión 8 (la LTS vigente), y aplicaciones como el servidor web GlassFish trabajando de forma conjunta con el IDE Netbeans, no funcionará a no ser que le proporcionemos esta versión.

La Especificación de la Maquina Virtual Java la define como: Una máquina imaginaria implementada mediante la emulación por software en una máquina real. El **código** para la **máquina virtual Java** se **almacena** en archivos **.class**, cada uno de los cuales contiene, al menos, el **código** para una **clase pública.**

La **especificación** de la **máquina virtual Java** proporciona las **especificaciones de hardware** para las que se compila toda la tecnología Java. Esta especificación permite al software en Java ser independiente de la plataforma ya que la compilación se hace para una máquina genérica conocida como máquina virtual java (JVM). Esta puede ser emulada por software para poder ser ejecutada en los diferentes sistemas informáticos existentes, o bien ser implementada en hardware.

A partir del código fuente del compilador genera bytecodes. Estos bytecodes son instrucciones de código máquina para la JVM. Cada interprete de Java tiene una implementación de la JVM.

La especificación de la JVM proporciona definiciones muy concretas para la implementación de:

![image-20240918094110057](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240918094110057.png)

### Características de Java

- **Robusto**:

  Java realiza verificaciones en busca de problemas tanto en tiempo de compilación como en tiempo de ejecución. En tiempo de compilación no tiene ningún misterio por que todos los lenguajes realizan esas verificaciones, sin embargo, en tiempo de ejecución, la JVM, que realiza la interpretación de los bytecodes, detecta cuando existe algún problema en la ejecución del programa, y lanza excepciones que pueden ser recogidas por el programador con el propósito de recuperarse de dichos errores.

- **Arquitectura neutral multiplataforma**:

  Gracias a que la compilación se realiza a un código objeto independiente de la arquitectura de la máquina (bytecodes), tan sólo necesitamos utilizar el intérprete adecuado para que nuestro programa funcione sobre cualquier plataforma. El lema de Sun es "**escribir una vez, ejecutar en cualquier parte**"

- **Seguro:**

  Como toda la ejecución la realiza la JVM, los programas Java pueden ser sometidos a muchas comprobaciones antes de ejecutarse en la máquina. En concreto:

  ![image-20240918094901890](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240918094901890.png)

- **Portable:**

  Mas allá de la portabilidad básica por ser de arquitectura independiente, Java implementa otros estándares de portabilidad para facilitar el desarrollo.

- Los enteros son de 32 bits en complemento a 2.

  Java construye sus interfaces de usuario a través de un sistema abstracto de ventanas de forma que éstas puedan ser implementadas en entornos UNIX, Mac o Pc.

- **Desarrollo de Java**

  Para poder desarrollar software con Java necesitamos una serie de herramientas que nos proporciona Sun a través de su JDK (Java Development Kit)

  Al igual que el lenguaje natural que utilizamos para comunicarnos, ya sea de forma oral o por escrito, cualquier lenguaje de programación dispone de unos elementos y reglas que deben conocerse a la hora de programar.

  Los elementos del lenguaje natural nos permiten designar cosas (nombres), expresar cualidades de esas cosas (adjetivos), expresar acciones (verbos), etc.

  Las reglas sintácticas (estructura) y semánticas (significado) permiten el entendimiento entre las partes que forman la comunicación.

  En los lenguajes de programación también encontramos unas reglas sintácticas que debemos respetar a la hora de confeccionar los programas y una semántica encargada de resolver el problema que queremos programar.



### Elementos y reglas sintácticas de los lenguajes de programación:

- **Comentarios en los programas:**

  Es importante comentar detalladamente lo que significa cada una de las órdenes que forman parte del programa, con el propósito de poder recordar en un futuro que realiza cada una de ellas, y facilitar su estudio a personas ajenas al programa.

- **Identificadores:**

  En todo lenguaje de programación surge la necesidad de utilizar una serie de elementos que debemos designar con algún nombre, por ejemplo:

  - **Variables:** Referencian posiciones de memoria que almacenan datos necesarios para el programa.

  - **Funciones:** Referencian posiciones de memoria donde reside el código del programa.

  - **Objetos:** Encapsulan variables (propiedades) y funciones (métodos) para que sea mas sencillo modelar los problemas que queramos resolver simplificando el diseño de programas complejos.

  - **etc:** Conforma avancemos iremos conociendo más elementos de los lenguajes de programación.

    

  A la hora de asignar nombre a estos elementos hay que seguir unas reglas.

  - Tipos de datos básicos:

    El modelo mental más sencillo que se puede tener de una aplicación informática es el de una caja negra que recibe unos datos de entrada, los procesa y entrega unos datos de salida representados de alguna manera.

    Estos datos de entrada, los cuales deben ser albergados en memoria y referenciados mediante alguna variable, pueden ser de diferente naturaleza (numéricos, alfanuméricos, etc).

    Cada lenguaje de programación dispone de unos tipos de datos básicos a los cuales nos tenemos que amoldar a la hora de realizar el análisis de los datos que necesitamos en nuestra aplicación.

    - Variables:

      Este elemento es el mecanismo que pone a nuestra disposición el lenguaje de programación para gestionar de una manera sencilla los datos de la aplicación.

      Al declarar una variable estamos reservando una zona de memoria para posteriormente albergar un dato. Existen lenguajes que necesitan que especifiquemos el tipo de dato que se va a albergar (java) y otros que no lo necesitan (javascript).

      Al asignar un valor a una variable lo que estamos haciendo es almacenar el dato en la posición de memoria que se reservó para dicha variable.

      En todo momento tenemos que tener presente que al usar la variable realmente estamos usando el dato al que representa.

    - Operadores:

      Elementos que permiten realizar operaciones con los datos (operaciones aritméticas, operaciones lógicas, comparaciones, etc).
  
    - Sentencias de control:
  
      La característica que confiere al ordenador su potencia es la capacidad de procesamiento de la que dispone. El tipo de procesamiento que puede realizar es muy básico, limitándose a:
  
      Tomar decisiones sobre la ejecución o no de determinadas tareas en base al cumplimiento o no de una o varias condiciones (sentencias de decisión). En dichas condiciones siempre estarán implicados datos (o si se quiere, sus representantes, las variables).
  
      Alterar el flujo de ejecución normal del código de programa (sentencias de salto o bucles). También estas alteraciones estarán controladas por variables.
  
      La combinación adecuada de este tipo de sentencias es la que definirá la estructura que resuelve un determinado problema.
  
    - Almacenamiento de datos mediante arrays:
  
      En la mayoría de aplicaciones necesitamos sistemas de almacenamiento mas complejos y también más potentes, que una simple variable. Uno de estos sistemas son los arrays. 
  
    - Excepciones:
  
      Todos los sistemas de programación avisan de los errores que cometamos en tiempo de compilación, pero pocos son los que han sido diseñados para seguir avisando de posibles errores en tiempos de ejecución. Las aplicaciones Java, gracias a que se ejecutan bajo la supervisión de la máquina virtual (JVM), están siendo controladas constantemente. En caso de que ocurra algún error de ejecución, se lanza una excepción que puede ser recogida y tratada por el programador en su aplicación. De esta manera, lo que antes solía terminar en una ejecución anormal del programa, en java puede ser resuelto.
  
    - Objetos: 
  
      Java es un lenguaje de programación orientado a objetos. La importancia de este tema es tal que le dedicamos el siguiente capítulo entero.



## Clases

Las diferentes tecnologías de programación se diferencian en la manera que ofrecen de estructurar los datos y el código que forman una aplicación.

A la hora de plantear el análisis del problema que se quiere resolver por software, todas las tecnologías han optado por dividir dicho problema en partes más pequeñas. La estrategia es conseguir una estructura en la que cada una de esas partes realice una **tarea única e indivisible**, coordinadas por una parte principal que obtiene la información de lo que hay hacer de su interacción con el usuario. En la actualidad esta interacción se realiza a través de un entorno gráfico y las órdenes se generan mediante eventos.

En los lenguajes procedimentales, orientados a funciones, la estructura se realiza tomando como referencia el código. Cada una de las partes se denomina **subrutina**, **procedimiento o función** dependiendo del lenguaje en el que nos encontremos, cada una se ejecuta teniendo solo en cuenta los parámetros de entrada sin modificar nada externo a ella.

En los lenguajes imperativos, orientados a objetos, la estructura se realiza tomando como referencia los datos. Los datos se agrupan en función de su naturaleza en componentes denominados objetos. Para definir qué datos puede contener un objeto y sus acciones utilizamos una plantilla que denominamos **clase** la cual define sus **propiedades** (datos) y **métodos** (acciones).

Un **objeto** posee una serie de **propiedades**. EJ: digamos que queremos crear un sistema para almacenar y organizar expedientes urbanísticos de obra. En papel un expediente contiene los datos de la persona e información relativa a su solicitud. Dicha persona puede tener asociados una serie de datos como: nombre, apellidos, DNI, dirección, teléfono, etc.

Mientras que el expediente en si también tiene varios datos: persona solicitante, fecha presentación, fecha notificación, motivo, tipo de obra, dirección inmueble, identificación catastral, aceptado/denegado, etc.

Además se pueden realizar ciertas acciones que modifican dichos datos: establecer fecha presentación, aceptar, denegar, ...

Para el diseño de un sistema debemos identificar los datos y agruparlos en objetos, e identificar que acciones puede realizar un objeto y como afectan a otros. En este ejemplo hemos partido de un conjunto de datos de un formulario para dividirlos en dos objetos cada uno responsable de gestionar dichos datos. 

Una clase define un objeto, en esta se indican el nombre de cada propiedad y de que tipo son (texto, numérico u otro objeto como en este caso persona solicitante). Se definen que acciones se realiza y estas pueden modificar los datos de dicha clase.

![image-20240919101006694](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240919101006694.png)



## Creación de una clase

En Java una clase se suele representar con la siguiente estructura:

![image-20240919101304614](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240919101304614.png)

Las clase se definen con la palabra **class** seguido del nombre por la que queremos identificarla. Palabras usadas junto a las propiedades y métodos, estas controlan de qué manera se accede a la propiedad que acompañan:

- **public:**

  La propiedad es accesible desde fuera, podemos acceder a propiedades de un objeto desde los métodos de clase, y desde fuera de la clase usando la variable del objeto y un punto, Ej: perro.colorPelo

- **protected:**

  Una clase que herede de otra, puede acceder a esa propiedad pero no desde fuera de la clase padre.

- **private:**

  Las propiedades solo son accesibles desde la clase en la que se define, no pueden acceder las clases que heredan ni desde fuera.

- **static:**

  Es una propiedad compartida entre todos los objetos creados a partir de la clase, es accesible a través de la propia clase sin requerir un objeto. Se puede usar tanto junto a public, protected y private.

- **final:**

  La propiedad no puede ser alterada, en el caso de un tipo primitivo el valor no puede cambiar, en cambio si posee una referencia a un objeto este sí puede ser alterado pero no se permitirá que cambie la referencia a otro objeto. Se puede utilizar junto con public, protected y private.



La variable de un objeto no es el objeto en si, si no una referencia, en caso de que una función devuelva una propiedad privada con referencia a un objeto nos arriesgamos a que más adelante el objeto pueda ser modificado y dichas modificaciones afecten de manera inesperada al funcionamiento de otros componentes. Para evitar la modificación de un objeto referenciado por una propiedad privada se debe realizar una copia de dicho objeto y devolverlo, de esta manera cualquier modificación realizada fuera de la clase no interferirá.

Importante: **Un método o función se define de manera similar a las propiedades, tiene limitaciones de acceso en incluso puede ser static, según el valor del objeto que devuelvan se indica con un nombre anterior al de la función, en caso de que no devuelvan nada se indica con void.**

<img src="C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240919102929376.png" alt="image-20240919102929376"  />

Hasta ahora hemos echo uso de datos **primitivos** y de **tipos**, en Java toda variable tiene definido un tipo. Un tipo se puede entender como una identificación de que dato tiene la variable, una variable puede tener referencia a un objeto por lo que su tipo es el nombre de dicha clase. Sin embargo no solo hay objetos en Java, una variable también puede contener un valor de un tipo concreto, a estos tipos los denominamos primitivos. Java incluye **8 tipos primitivos**:

- **byte:** Es un número entero que en memoria ocupa 8 bits. Sus valores van de -128 a 127.

- **short:** Es un entero de 16 bits. Su valor mínimo es -32,768 y el máximo 32,767. 

- **int:** Es un entero de 32 bits. Su valor mínimo es -2,147,483,648 y el máximo 2,147,483,647 (inclusive). Es el más usado para enteros a menos que haya una razón como por ejemplo el ahorro de memoria.

- **long:** Es un entero de 64 bits. Su valor va de -9,223,372,036,854,775,808 a 9,223,372,036,854,775,807. Obviamente se utiliza cuando int no alcanza el valor que se requiere.

- **float:** Es un dato en coma flotante y precisión simple. Almacena valores decimales que no requieran gran precisión ya que pueden devolver producir cierto grado de error en la parte decimal.

- **double:** Dato de coma flotante de 64 bits y precisión doble. Similar a float pero admite un mayor rango de valores, es comúnmente utilizado al tratar con valores decimales.

- **boolean:** Solo tiene dos posibles valores: true (verdadero) y false (falso).

- **char:** Contiene un solo carácter Unicode de 16 bits.



Java es un lenguaje fuertemente tipado ya que obliga a indicar el tipo de variable, en el caso de otros lenguajes como PHP se puede usar pero no es obligatorio. El uso de tipos ayuda a la prevenir errores.

En el siguiente ejemplo podemos ver un fichero en java completo que contiene la definición de una clase, la clase definida tiene el nombre Coche.

<img src="C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240919105038138.png" alt="image-20240919105038138" style="zoom: 200%;" />

<img src="C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240919105134813.png" alt="image-20240919105134813" style="zoom:200%;" />

Se puede observar una propiedad llamada **VMAXIMA** establecida como pública, estática y final esto quiere decir que puede ser accedida desde fuera de la clase, está compartida entre todas las instancias y que su valor es final, es decir no podrá ser modificado. Entendemos que la velocidad máxima es el tope de velocidad que todas las instancias de Coche soportan. No nos interesa que se supera la velocidad máxima establecida en el vehículo por lo que la declaramos privada y para modificarla por cualquiera fuera de nuestra clase es necesario pasar por la función setVelocidad.

En Java un **paquete** es un conjunto de clases y otros paquetes, estos siguen una estructura jerárquica en carpetas. En la siguiente imagen el directorio de un paquete llamado "ssh_tunnel" que a su vez contiene un paquete denominado "utils". Normalmente en un paquete se agrupan las clases de una misma aplicación, organización, sistema o que comparten una serie de funciones similares.

<img src="C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240919105900250.png" alt="image-20240919105900250" style="zoom:80%;" />

La imagen muestra un paquete Java con ficheros de clases y un directorio que representa un subpaquete.

Para hacer uso de clases en paquetes externos tenemos que hacer uso de su nombre en una sentencia **import** o si es un uso puntual podemos usar el nombre del paquete seguido de la clase como se ve en:

<img src="C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240919110200620.png" alt="image-20240919110200620" style="zoom: 200%;" />



## Objetos

En ingeniería de software, **SOLID** (Single responsibility, Open-closed, Liskov substitution, Interface segregation and Dependency inversion) es un acrónimo nemotécnico introducido por Robert C. Martin a principios de la década de los 2000 que representan 5 principios básicos de la programación orientada a objetos y el diseño. Cuando estos principios son aplicados como un conjunto, es más probable que un desarrollador cree un sistema que a lo largo del tiempo sea fácil de mantener y de ampliar.

Los principios SOLID son guías que podemos usar en el desarrollo de un software, que nos ayudará a eliminar el código sucio provocando que el programador tenga que refactorizar el código fuente hasta que sea legible. Debería ser utilizado en el desarrollo guiado por pruebas o TDD, y además forma parte de la estrategia global de desarrollo ágil de software y desarrollo adaptativo de software.

El **principio de responsabilidad** única indica que cada módulo o clase de contar con una responsabilidad que debe estar encapsulada en su totalidad por la clase. Todos sus servicios deben estar estrechamente alineados con esa responsabilidad.

Robert C.Martin expresa dicho principio de la siguiente forma:

**UNA CLASE DEBE TENER UNA SOLA RAZÓN PARA CAMBIAR**

El **principio de abierto/cerrado** establece que "una entidad de software (clase, módulo, función, etc) debe quedarse abierta para su extensión, pero cerrada para su modificación". En otras palabras, se debe poder ampliar el comportamiento de la entidad sin tener que modificar su código fuente.

abierto/cerrado es utilizado de dos maneras: las dos se basan en la herencia para poder resolver el aparente dilema, pero tanto como sus objetos, técnicas y sus resultados son diferentes.



**Principio de sustitución** de Liskov: Es posible usar como su padre cada clase que hereda de otra sin necesidad de conocer las diferencias entre ellas.

En un **lenguaje** más **formal**: si S es un subtipo de T, entonces todos los objetos de tipo T en un programa podrán ser sustituidos por objetos de tipo S (en otras palabras, los objetos de tipo S pueden sustituir a los de tipo T), sin cambiar ninguna de las propiedades deseables del programa (como pueda ser la corrección, la tarea que realiza, etc.)

De una manera más formal, el Principio de Sustitución de Liskov (LSP), define de manera particular una relación de subtipificación, conocida como la tipificación del comportamiento, la cual fue introducida inicialmente por Barbara Liskov en una conferencia en 1987 que se llama "La abstración de Datos y Jerarquía".

Está mas referida a una relación de tipo **semántico** que a una de tipo sintáctico, ya que tan solo tiene la intención de garantizar la interoperabilidad semántica de tipos dentro de una jerarquía, los tipos de objeto en particular. Jeannette Wing y Liskov crearon el principio de manera conjunta en un artículo en 1994 que dicta lo siguiente:

<img src="C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240919135422784.png" alt="image-20240919135422784" style="zoom:200%;" />



El **principio de segregación** **de la interfaz** (ISP, por sus siglas en inglés) establece que los clientes de un programa dado solo deberían conocer de éste aquellos métodos que realmente usan, y no aquellos que no necesitan usar. El ISP es aplicado a una interfaz amplia y compleja para así seccionarse en otras más pequeñas y específicas, de tal forma que el cliente use tan solo la que necesite, pudiendo así ignorar al resto. A este tipo de interfaces reducidas se las llama "interfaces de rol".

El **ISP** fue concebido para mantener a un sistema desacoplado de los otros sistemas de los que depende, y que así resulte más fácil una refactorización, modificarlo y redesplegarlo. El ISP es uno de los principios de SOLID del Diseño Orientado a Objetos, similar al Principio de Alta Cohesión de **GRASP**.



El **principio de inversión de dependencias** está compuesto por los siguientes 2 puntos:

- A: Los módulos de alto nivel no deberían depender de los de bajo nivel. Los dos deberían de depender de las abstraciones.
- B: Ninguna abstracción debería depender de ningún detalle. Son los propios detalles los que deberían de las abstraciones.

En el paradigma de la orientación a objetos, lo normal es tener una jerarquía de objetos definida, porque los objetos de más alto nivel son los que suelen incluir a los de bajo nivel.

Un bosque contiene **árboles**, que a su vez contienen hojas, que contienen células, ....



Por eso se eligió la palabra "inversión", por que rompe con esta dinámica.

Lo que se pretende es que no exista una necesidad de dependencia entre unos módulos y otros, sino que dependan de abstracciones. De esta forma, nuestros módulos pueden ser más fácilmente reutilizables.

Un **objeto** es una **representación abstracta** compuesto por propiedades también llamados atributos y una serie de métodos o funciones para manipular dichas propiedades.

Podemos considerar las Clases como plantillas de objetos, definen que propiedades tienen y sus métodos, instancia una clase como resultado de un nuevo objeto. En Java las propiedades de un objeto pueden ser de tipo primitivo o referencias a otros objetos, en cuanto a esto último entendemos que un objeto puede estar compuesto por otros, por ejemplo una bicicleta está compuesta por un pedal, manillar, ruedas, etc. Cada objeto de una clase puede tener un valor propio en cada propiedad aunque comparten la misma funcionalidad, cada silla puede ser de un color distinto pero el hecho de que sirve para sentarse no cambia.



Crear un objeto en Java es simple:

```java
//Un coche rojo con 5 plazas
Coche miCoche = new Coche("rojo",5);
```

 Declaramos una variable con el nombre de la **clase como tipo** y la instancia como **new**. Al hacer esto se reserva memoria para el objeto y la variable hace referencia a este, en el caso de realizar:

```java
//¿Estaré copiando el objeto?
Coche miPropioCoche = miCoche
```

Lo que hacemos es asignar el mismo objeto a las variables miCoche y miPropioCoche, cualquier modificación como miCoche.setColor("azul") afectará a ambos. Si lo que queremos es una copia hay algunas soluciones en bibliotecas de terceros pero lo más seguro es que el desarrollador implemente su propia función para crear duplicados. Por ejemplo a través del **método clone o un constructor** con un objeto de la misma clase como parámetro y copiar las primitivas, para propiedades que son referencias a objetos también habría que duplicarlos:

![image-20240920095705246](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240920095705246.png)

A lo largo del módulo veremos el uso de objetos definidos por la clase String, esta es una clase definida en Java y que permite almacenar y trabajar cadenas de texto. La peculiaridad de esta clase es que no permite la modificación del texto que almacena, métodos como **split** crean un **array** con dos nuevas instancias de String cada una con una copia de un fragmento del texto original. Por ello no hay que porque preocuparse de generar copias de propiedades privadas de este objeto ya que por diseño impide su alteración. El texto englobado por comillas dobles es considerado por el compilador de Java como un objeto String.

Si no estás familiarizado con el concepto de array en Java, es un contenedor de objetos, es decir almacena un número fijo de objetos de un tipo concreto. Su capacidad se define al ser creado:

```java
Coche[] referenciaArray;

// memoria para 15 coches
referenciaArray = new Coche[15]
```



Importante:

1. Un **objeto** es una representación abstracta compuesto por propiedades (atributos) y una serie de métodos o funciones para manipular dichas propiedades. Un objeto es una instancia de una clase.
2. Las **clases** son plantillas de objetos, definen que propiedades tienen y sus métodos, instancia una clase da como resultado un nuevo objeto.
3. La **clase String** es una clase definida en Java que permite almacenar y trabajar con cadenas de texto. La peculiaridad de esta clase es que no permite la modificación del texto que almacena, métodos como split crean un array con dos nuevas instancias de String cada una con una copia de un fragmento del texto original.



## Ejemplo práctico con objetos

Es necesario tener instalado algún kit de desarrollo de Java, **JDK** (Java Development Kit). El JDK contiene las herramientas necesarias para la compilación del código fuente y su ejecución. El compilador incluido está desarrollado para usarlo a través de una terminal, en este caso usaremos la consola de comandos de windows (CMD) y comando se denomina **javac**.



Como se ha explicado para la creación de un **objeto** necesitamos de una plantilla denominada clase. Cada clase define que propiedades puede tener un objeto y sus métodos.

A cada clase se le asigna un nombre para identificarla y utilizarla durante el desarrollo de la aplicación, en el siguiente ejemplo tenemos la clase Factura, la creación de un objeto a partir de una clase lo denominamos instanciación, todo objeto creado a partir de Factura lo llamaríamos instancia de Factura.

Vamos a mostrar un ejemplo de clase y su utilización. Crearemos una nueva clase llamada Factura. Una factura está compuesta por un nombre de titular, un concepto, un precio, el iva y el total de la factura.

```java
public class Factura{
    public String NombreTitular;
    public String ConceptoFactura;
    public double Precio;
    public double Total;
    public double Iva;
}
```

Acabamos de crearnos una clase en la que podemos almacenar una serie de datos primitivos en su conjunto. Dicha clase contiene una serie de miembros que almacenará cada objeto creado a partir de la clase Factura. En el ejemplo podemos observar las variables de tipo String, String es una clase incluida en Java para representar una cadena de texto, dicho texto es inmutable, es decir no se puede alterar, por ello la clase **String** implementa una serie de métodos para operaciones como la concatenación y división de texto que devuelven nuevas instancias.



Cada objeto **Factura**, es decir cada instancia de la clase, tiene su propia copia de las variables miembro. Las variables propias de una clase (propiedades) pueden ser de tipos **primitivos** (boolean, int, long, double,.. ) o **referencias** a objetos de otra clase (composición).

En nuestro objeto hemos creado 5 variables miembro de la clase factura, dichas variables miembro son elementos que pertenecen a la clase Factura y sólo pueden estar utilizadas por objetos de la clase Factura. Cada Factura que creemos tendrá unos valores diferentes para cada miembro.

```java
public class UtilizacionFactura{
    public static void main(String[] args){
        Factura f1 = new Factura();

        f1.NombreTitular = "Adrian Ramos";
        f1.ConceptoFactura = "IPad";
        f1.Precio = 540;
        f1.Iva = 30;
        f1.Total = 570

        System.out.println("Datos de la factura numero 1");
        System.out.println("Nombre Titular: " + f1.NombreTitular);
        System.out.println("Concepto Factura: " + f1.ConceptoFactura);
        System.out.println("Precio: " + f1.Precio);
        System.out.println("Iva: " + f1.Iva);
        System.out.println("Total: " + f1.Total);
        System.out.println("-------------------------------------");


        Factura f2 = new Factura();
        
        f2.NombreTitular = "Lucia Serrano";
        f2.ConceptoFactura = "PSP";
        f2.Precio = 169;
        f2.Iva = 15;
        f2.Total = 184;

        System.out.println("Datos de la factura numero 2");
        System.out.println("Nombre Titular: " + f2.NombreTitular);
        System.out.println("Concepto Factura: " + f2.ConceptoFactura);
        System.out.println("Precio: " + f2.Precio);
        System.out.println("Iva: " + f2.Iva);
        System.out.println("Total: " + f2.Total);
    }
}
```

En este ejemplo mostramos otra clase denominada UtilizacionFactura, esta clase no se ha creado con el fin de crear objetos sino para la ejecución de código, que está contenido en el método **main**.

Como podemos comprobar, cada objeto referenciado de la clase factura contiene unos datos diferentes para cada elemento. Es decir cada miembro de la instancia de Factura almacena unos datos diferentes en cada objeto.



Para compilar el programa partimos de dos ficheros con extensión .**java**, es importante utilizar un editor de texto plano como el Bloc de Notas o NotePad++, cada fichero debe tener el nombre de la clase, en este ejemplo deben resultar como **Factura.java y UtilizacionFactura.jav**a. Para mayor facilidad las hemos creado en una carpeta en la unidad C:\, para compilar nuestro programa usamos el comando **javac.**

![image-20240920105401645](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240920105401645.png)

![image-20240920105435204](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240920105435204.png)

Ejemplo de un error de sintaxis mostrado por el comando javac. En este caso en la línea 9 de UtilizacionFactura.java le falta un  punto y coma al final.



En el comando mostrado compilamos todos los ficheros ***.java** de la carpeta dando como resultado ficheros **.class** que contiene el **bytecode** de cada clase, para ejecutar nuestro programa debemos de utilizar el nombre de la clase que contiene la función **main.**

Cada objeto Factura tiene un contenido propio y éste se ha imprimido (System.out.println) en la salida del programa.

![image-20240920112647694](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240920112647694.png)



## Ejemplo práctico con objetos II

Para hacer referencia a los objetos que pertenecen a la clase sobre la que estamos escribiendo se utiliza la palabra clave **this**. Dicha palabra hace referencia a cualquier elemento declarado de la clase.

```java
public class Factura
{
     public String NombreTitular;
     public String ConceptoFactura;
     public double Precio;
     public double Total;
     public double Iva;

     //CONSTRUCTOR DE FACTURA
     public Factura()
     { 
         //VAMOS A INICIALIZAR LOS MIEMBROS DE LA CLASE
         this.NombreTitular = "sin titular";
         this.ConceptoFactura = "sin concepto";
         this.Precio = 0.0;
         this.Iva = 0.0;
         this.Total = 0.0;
     }
}
```

Podemos observar un método con el mismo nombre que la clase Factura. Este método lo denominamos constructor y será llamado cada vez que se cree (instanciar) un objeto, su principal función es asignar un valor a cada variable, eso puede incluir nuevas instancias de otras clases.

Si ahora utilizamos un objeto de la clase Factura, solamente instanciando un objeto, los valores iniciales se han creado desde el constructor.

```java
public class UtilizacionFactura{
 public static void main(String[] args)
 {
     Factura f1 = new Factura();

     System.out.println("Datos de la factura CONSTRUIDA");
     System.out.println("Nombre Titular: " + f1.NombreTitular);
     System.out.println("Concepto Factura: " + f1.ConceptoFactura);
     System.out.println("Precio: " + f1.Precio);
     System.out.println("Iva: " + f1.Iva);
     System.out.println("Total: " + f1.Total);
 }
}
```

![image-20240920113435359](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240920113435359.png)

La instanciación se realiza mediante la instrucción **new** + nombre de la clase y unos parámetros. En este caso el constructor no recibe ninguno. Como resultado de la ejecución vemos los valores iniciales creados desde el constructor.



## Interacción entre los elementos

Los objetos intervienen en el comportamiento del sistema interaccionando con otros, por ejemplo en un coche un objeto pedal interacciona con el objeto freno, esto se produce llamando a un método público que ofrece el objeto pedal para llevar a cabo dicha acción, como resultado se produce una reducción de velocidad en el objeto coche. A parte de definir objetos también estamos definiendo sus relaciones, un objeto delega un trabajo a otro que puede ser parte suya u otro del sistema.

![image-20240920114049899](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240920114049899.png)

Representación de los métodos públicos de un objeto conectados a la implementación interna.



En un objeto se pueden definir **propiedades o métodos de acceso público**, ese conjunto lo denominamos **parte pública o interfaz del objeto**. Otros objetos no necesitan saber cómo los demás llevan a cabo sus operaciones, solo que la llamada a un método público produce un resultado.

Para que una aplicación interaccione con el usuario hay que conseguir una estructura en la que cada una de las partes realice una tarea única e indivisible. En la actualidad esta interacción se realiza a través de un entorno gráfico y las órdenes se generan mediante eventos.

Hay que decidir de antemano como interaccionan los objetos, además de sus datos y responsabilidades. Por ello nació el concepto de patrones de diseño de software. Simplificando, un patrón describe un problema genérico y su solución, un patrón no tiene por qué ser una solución fija pero ayuda a comprender como organizar un sistema para que sus partes interaccionen de la mejor manera posible.

![image-20240920115033889](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240920115033889.png)

Esta imagen representa la interacción entre los principales componentes de una aplicación que interacciona con el usuario siguiendo el patrón del diseño MVC. **Modelo-Vista-Controlador**), este patrón surge por la necesidad de separar los datos y la lógica de negocio de interfaz del usuario. La clase que ocupa el rol de controlador recibe notificaciones de la vista sobre su interacción con el usuario, como por ejemplo pulsar un botón determinado o la introducción de texto. Cuando el controlador es notificado sobre una acción realiza cambios sobre el modelo, este se responsabiliza de guardar los datos y los cambios son enviados a la vista.

Por ejemplo podemos tener una pantalla , con los datos de una persona y botones de Siguiente, Anterior u Guardar. La representación de los datos y la interacción con el usuario, es llevado a cabo por la vista. El usuario pulsa el botón siguiente y el controlador es avisado, entonces hace que la siguiente manipule la seleccionada en el modelo y por tanto la vista es notificada con la nueva información que será mostrada.



## Ejemplo de interacción entre elementos

**Java** es un lenguaje de programación "**Case Sensitive**", es decir, **diferencia** entre **mayúsculas y minúsculas**.

Vamos a guardar cada fichero con nuestro bloc de notas con el **nombre de la clase** seguido de la extensión **.java** en la ubicación en la que vayamos a probar nuestros ejemplos.

Podemos utilizar cualquier otro editor de texto, pero es imprescindible que solo almacene texto plano, no nos valdrían editores de texto estilo Word o WordPad, ya que almacenan más información además del texto escrito, un ejemplo de estos editores puede ser UltraEdit o algún bloc de notas "free" que se encuentren en Internet y que tienen más características que el bloc de notas tradicional de Windows.

Debemos asegurarnos que el nombre de nuestro fichero "java" debe tener el mismo nombre que nuestra clase, incluida la diferenciación de mayúsculas y minúsculas, en nuestro ejemplo tenemos Main.java, Escritor.java y Lector.java.

Creamos una carpeta Ejemplo2 donde almacenaré las prácticas. En el bloc de notas seleccionaremos como Tipo: "Todos los archivos" y escribiremos la extensión ".java" para nuestra primera clase.

Escritor.java

```java
public class Escritor {
   // parte privada
   private String parteTexto1;
   private String parteTexto2;
   private int veces;

   private String escribir() {
      // Si no hay otra variable que se llame igual this no es necesario
      // La clase String tiene un método estático para producir un string a partir de otros tipos
      String vecesString = String.valueOf(veces);
      return parteTexto1 + veces + parteTexto2;
   }

   // parte pública, interfaz usuario
   public Escritor() {
      this.parteTexto1 = "En un lugar de la maancha de cuyo nombre no quiero acordarme ";
      this.parteTexto2 = "º vez ";
      this.veces = 0;
   }
   // En este caso le enviamos al lector un texto a través de uno de sus métodos.
   public void enviameTexto(Lector lector){
      this.veces++; // Lo incrementamosº
      lector.enviar(this.escribir());
   }
}
```

Lector.java

```java
public class Lector{
   public int num;

   public void pedirAlEscritor(Escritor escritor){
      escritor.enviameTexto(this); // Le pasamos el objeto en si
   }

   public void enviar(String texto){
      System.out.println("Soy el lector nº " + String.valueOf(num) + " y he recibido" +  texto);
   }
}
```

Main.java

```java
public class Main {
   public static void main(String args[]){
      Lector lector1 = new Lector();
      Lector lector2 = new Lector();

      lector1.num = 1;
      lector2.num = 2;

      Escritor cervantes = new Escritor();

      lector1.pedirAlEscritor(cervantes);
      lector2.pedirAlEscritor(cervantes);
      lector1.pedirAlEscritor(cervantes);
   }
}
```



![image-20240923120412790](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240923120412790.png)



Hemos **compilado** los ficheros con el comando "**javac *.java**", y a continuación lo **ejecutamos** con el comando "**java -cp .Main**", ten en cuenta el nombre de la clase que contiene la función main como aparece en la imagen.

Como podemos ver el objeto Escritor en su **parte privada** guarda el estado de cuantas veces le han solicitado un texto y este responde en la respuesta mencionando que es la 1ª, 2ª y 3ª vez. El objeto lector no conoce dicha parte privada y solo interesa la petición de texto que ofrece en su parte pública. En este caso el objeto **escritor también conoce al lector**, no usamos una función que devuelva el texto sino que llama a una función del objeto lector para responder.

Debido a la simplicidad de este ejemplo hemos usado un editor de texto simple, si se desea también es posible utilizar un **IDE** (Integrated Development Enviroment), que aporta funciones como la corrección de sintaxis y la compilación y la ejecución desde una interfaz gráfica. Ejemplos de IDEs libres o gratuitos son **Eclipse** o **Netbeans**.



## Interfaces II

### Herencia

Antes de hablar de interfaces debemos de hablar sobre el concepto de **herencia en el paradigma de orientación a objetos.**

Imaginemos que tenemos las instrucciones para construir una silla concreta con unas características y usos concretos, ahora supongamos que queremos crear una silla basada en el diseño original pero con algunos cambios, como por ejemplo reposa muñecas. Como no cobramos por horas no vamos a escribir unas instrucciones desde cero ya que tenemos los de la silla original, simplemente copiamos las partes en común de las instrucciones originales y añadimos nuestra parte. Este es un ejemplo sobre el concepto de herencia de objetos, tenemos definida una clase y queremos crear una similar pero con ciertos cambios.

Al heredar de una clase podemos usar los métodos y propiedades definidos como **protected** o **public** por la clase **padre.** Desde fuera de los objetos creados a partir de la clase hija serán como el padre excepto por lo que hallamos añadido o sobrescrito.

En este ejemplo consideramos que una "Silla de escritorio" es hija de "Silla común".

![image-20240923121917307](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240923121917307.png)

Un diagrama que muestra el concepto de herencia de manera simple.

Tenemos una silla común, de la que hereda una silla de escritorio y una con reposamuñecas y ésta última a su vez tiene una de la que hereda con reposamuñecas acolchado.

Además de heredar de una clase normal, tenemos el concepto de **clase abstracta**, esto sería análogo al concepto abstracto que tenemos de una silla. Las clases abstractas no pueden ser instanciadas pero poseen una serie de propiedades y métodos comunes a clases que la usan como padre. También es posible definir **métodos abstractos**, se escriben como cualquier otro método pero sin el bloque de código englobado en corchetes. Toda clase que herede de otra con métodos abstractos debe implementarlos.



### **Interfaces**

Una interface o intefaz en español es un conjunto de métodos abstractos y de propiedades finales con la finalidad de definir el comportamiento de una clase. Podemos considerar una interfaz como un "**contrato**" que debe seguir una clase.

La diferencia entre una interfaz y una clase abstracta es que la interfaz sólo define que se debe implementar y propiedades constantes mientras que una clase abstracta puede implementar métodos o definirlos abstractos, la similitud que tienen es que ambas no pueden instanciarse.

Una clase solamente puede derivar/herdar mediante **extend** de una clase base, pero puede implementar varias interfaces. Los nombres de las interfaces se indican separados por coma después de la palabra **implements.**

En java una interfaz se define con la palabra interface seguido del nombre, también es posible crear que una interfaz herede de otra o varias como lo haría una clase mediante **extends:**.

En este ejemplo creamos una interface con los métodos que queremos que se implementen.

```java
public interface InterfazCoche extends Vehiculo {
   int V_MAXIMA = 120;

   public void montar();
   void comenzar();
   void bajar();
   int verVMaxima();
   void cambiarVMaxima(int V_MAXIMA);
   void bajar();
   void usar() throws IOException;
   void menu();
}
```

Como se puede ver solo utilizamos el modificador **public** en una de las funciones, en una **interfaz** **todo método es implícitamente público**, de manera que se puede omitir. Además todas las **propiedades** se consideran **públicas, estáticas y constantes** (public, static y final) de la misma manera que las funciones, estas pueden ser omitidas.

#### Implementación de la interfaz

Si una clase quiere implementar una interfaz debe usar la palabra clave **implements**. Si queremos heredar e implementar al mismo tiempo, debemos colocar primero extends seguido del nombre de la clase y a continuación implements seguido del nombre de la interfaz.

Sintaxis:

```java
public class Macarrones extends Pasta implements Alimento, Desechable,...{
	// Cuerpo de la clase
}

public abstract class Fruta implements Alimento{
	//......
}
```

Si una clase implementa una interfaz podemos usar dicha interfaz como tipo en la variable de los objetos. Por ejemplo un objeto de Naranja que heredaría de Fruta (código anterior), puede ser asignado a una variable con el tipo Alimento, dicha variable estaría limitada por las funciones y constantes definidas en la interfaz Alimento. Por ejemplo podemos tener una clase CestaCompra que contenga la lista del tipo Alimento, de esta manera podemos almacenar y usar objetos en base a una interfaz aunque sean originalmente instancias de distintas clases.

```java
public class Naranja implements Alimento{
    // ....
}

public class Galleta implements Alimento{
    // ....
}

public class CestaCompra{
    private ArrayList<Alimento> alimentos;
    // ...
    
    public void meter(Alimento ali){
        this.alimentos.add(ali);
    }
}

Naranja naranja = new Naranja();

Alimento naranjaComoAlimento = naranja; // Desde esta variable se considera alimento
Alimento galleta = new Galleta();
Galleta otraGalleta = new Galleta();

CestaCompra cesta = new CestaCompra();
cesta.meter(naranja);
cesta.meter(galleta);
cesta.meter(otraGalleta);
```



Resumen:

**Métodos abstractos**: se escriben como cualquier otro método pero sin el bloque de código englobado en corchetes. Toda clase que herede de otra con métodos abstractos debe implementarlos.

**Clases abstractas**: las clases abstractas no pueden ser instanciadas pero poseen una serie de propiedades y métodos comunes a clase que la usan como padre.

**Interfaz o interface**: es español es un conjunto de métodos abstractos y de propiedades finales con la finalidad de definir el comportamiento de una clase. Podemos considerar una interfaz como un " contrato" que debe seguir una clase.



## Peculiaridades de Java

Java sigue el paradigma de la programación orientado a objetos, pero eso no significa que pueda tener características de otros paradigmas como la programación funcional. Por ejemplo **en la versión 8 se introducen conceptos de programación funcional**, dirigidos a ofrecer mejores soluciones a la hora de tratar con grandes volúmenes de datos. Hay que tener en cuenta que las nuevas características en el lenguaje son incompatibles con versiones anteriores de la JVM.

```java
// Por ejemplo una función que suma uno a cada valor de una lista de enteros
public List<Integer> addOne(List<Integer> numbers){
    return numbers
        .stream()
        .map(number -> number +1)
        .collect(Collectors.toList());
}
```

Por otra parte antes de explicar el proceso de creación de un programa, conviene explicar que en Java vamos a manejar 3 tipos de aplicaciones:

#### Aplicaciones en modo texto:

La interacción con el usuario (entrada de datos y presentación de resultados) se realiza en modo texto (no existirán cajas de texto, botones, ...). El ratón no tendrá uso en estas aplicaciones. Son las aplicaciones que realizaremos en el primer bloque donde nuestro objetivo será aprender los conceptos básicos de Java. También es interesante cuando realizamos los prototipos de nuestros programas debido a que la depuración es más sencilla.

#### Aplicación en modo gráfico:

En este tipo de aplicaciones la interacción con el usuario se realiza en modo gráfico. Estas aplicaciones pueden ser de todo tipo y no hay que pensar sólo en internet.

- Procesador de texto, bases de datos, entorno de programación, tratamiento de gráficos,...

#### Miniaplicaciones (applets):

Pequeños programas que no pueden ejecutarse de forma independiente sino que necesitan el soporte de un navegador. Estos programas están pensados para que sean invocados desde una página HTML, viajen a través de la red y se ejecuten en la máquina del cliente.



## Recuerda

### Paradigma de programación

Hoy en día el paradigma de orientación a objetos es el más utilizado para programar y prácticamente lo podemos encontrar en la mayoría de los lenguajes de programación.

### Propiedades y métodos

Un objeto está formado por una serie de propiedades y métodos, parte de ellos pertenecen a la parte privada del objeto y otros a la parte pública que permite la interacción con otros objetos. Un objeto es definido por su clase.

### Las clases

Las clases son capaces de heredar de otras y de esta manera ampliar o modificar parte de la funcionalidad del padre. También existen clases que denominamos abstractas cuya finalidad no es la de creación de objetos sino ser padres de otras.

### Interfaces

Una interfaz define una serie de métodos públicos sin implementarlos para que distintas clases ofrezcan una misma funcionalidad mediante dichos métodos.

### Variables en Java

Las variables en Java pueden contener datos primitivos y referencias a objetos. Asignar una de un objeto a otra no copia el objeto si no su referencia. Podríamos decir que, si una variable no contiene un dato primitivo es un puntero. 





# 2. APLICACIONES WEB CON JAVA

## Introducción

En este tema veremos programación web con Java y PHP, así como conoceremos los softwares recomendado para ello y nos iremos introduciendo en el concepto JSP.



## Objetivos

- Aprender a programar aplicaciones en Java y PHP para servicios basados en web.
- Conocer los conceptos de seguridad con su uso.



## Mapa conceptual

![image-20240924154341593](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240924154341593.png)



## Introducción, objetivos y software recomendado

Sun Microsystems, comparada con Oracle, fue empresa que desarrolló el lenguaje Java, en un intento de resolver todos los problemas que se planteaban a los desarrolladores de software debido al crecimiento de arquitecturas incompatibles en los aspectos:

- Diferentes máquinas desde el punto de vista del hardware.
- Diferentes sistemas operativos.
- Diferentes sistemas de ventanas que funcionan sobre una misma máquina.



Estos problemas se han agravado aún más con el crecimiento de Internet en la cual debe comunicarse con plataformas heterogéneas, y dónde las aplicaciones distribuidas abundan.



### Características de un programa

Es un **conjunto de instrucciones**, escritas para realizar una tarea específica y dar una solución a un problema. Este dispositivo requiere programas para funcionar, por lo general, **ejecutando** las **instrucciones** del programa en un **procesador central.** El **programa** está escrito en un **lenguaje** que nuestras **máquinas** pueden entender y ejecutar (lenguaje máquina). El mismo programa en su formato de código fuente legible para humanos, del cual derivan los programas ejecutables (por ejemplo, compilados), le permite a un programador estudiar y desarrollar sus algoritmos. Un conjunto de programas y datos relacionados es también conocido como software.

De forma general, el **código fuente lo escriben** personas altamente capacitadas conocidas como **programadores** de computadora. Este código se escribe en un lenguaje de programación que sigue alguno de los siguientes paradigmas: imperativo o declarativo, y que después podrá ser convertido en un archivo ejecutable (generalmente conocido como un programa ejecutable o archivo binario) por un compilador y más tarde tarde ejecutado por una CPU. Por otra parte, los programas de computadora se pueden ejecutar con la ayuda de un intérprete, o pueden ser grabados directamente en hardware.

La base de la programación gráfica se encuentra en estos dos elementos físicos del ordenador, los cuales se diseñaron de forma conjunta con el propósito de presentar información al usuario. El comprender el funcionamiento ayuda a conocer lo que estamos haciendo cuando diseñamos un entorno gráfico. Además también se encuentra el **entorno de desarrollo,** es decir, la interfaz gráfica mediante la cual vamos a programar. Para programar en Java se suele utilizar **Eclipse**.

Eclipse es un software que nos proporcionará las herramientas necesarias que nos permitirán desarrollar lo que el proyecto llama "Aplicaciones de Cliente Enriquecido", algo totalmente opuesto a las aplicaciones "Cliente-liviano" basadas en navegadores web. Esta plataforma, de manera típica ha sido usada para desarrollar **IDEs** (Entorno de Desarrollo Integrado), es como el ide de JAVA llamado Java Development Toolkit (JDT) y su compilador (ECJ), que forma parte de eclipse (y que curiosamente son empleados para desarrollar el propio eclipse). También puede ser usado para compilar otras aplicaciones como puedan ser BitTorrent o Azureus.

Eclipse es también una **comunidad de usuarios**, extendiendo constantemente las áreas de aplicación cubiertas. Un claro ejemplo de esto es el reciente creado Eclipse Modeling Project, encargándose de cubrir casi todas las áreas del Model Driven Engineering.

Eclipse fue **desarrollado originalmente por IBM** como el sucesor de su familia de herramientas para VisualAge. Eclipse es ahora desarrollado por la Fundación Eclipse, una organización que funciona al margen de IBM y sin ánimo de lucro que fomenta una comunidad de código abierto y un conjunto de productos complementarios, capacidades y servicios.

Eclipse fue liberado originalmente bajo la Common Public License, pero después fue re-licenciado bajo la Eclipse Public License. La Free Software Foundation ha dicho que ambas licencias son incompatibles con la Licencia Pública general de GNU (GNU GPL)



#### Parte 1: Entorno de proyectos Eclipse

"La ciencia es conocimiento organizado. La sabiduría es la propia vida organizada". - Immanuel Kant.

 **Todo archivo** que creemos, ya sea de código fuente o cualquier otro, **tiene que estar dentro del proyecto** de Eclipse. Para ello es necesario comprender la estructura de directorios de eclipse.

Para iniciar un nuevo proyecto debemos seleccionar en el menú principal "File > New > Project..." Y también es posible seleccionar "New > Project..." pulsando el botón derecho en cualquier parte una vista de Eclipse (como puedan ser, el package Explorer o el resource Navigator).

![image-20240924192006127](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240924192006127.png)

<img src="C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240924192050008.png" alt="image-20240924192050008" style="zoom:80%;" />

![image-20240924192119433](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240924192119433.png)

A pesar de que en este punto es ya posible finalizar la creación del proyecto pulsando en el botón "Finish", es recomendable pulsar de nuevo el botón "**Next >**" para indicar un directorio fuente ("Source Folders") para almacenar los archivos de código fuente de Java (.java), de manera que Eclipse conozca donde buscarlos y pueda realizar la compilación de manera automática cada vez que un archivo sea guardado.



**Para editar un elemento existente debería ser en primer lugar importado dentro de un proyecto de Eclipse.** Se realiza desde el menú "File > Import..." o también haciendo click derecho en cualquier punto de vista de "Package Explorer" o de "Resource Navigator". Para seleccionar un fichero o carpeta debemos seleccionar "File System" en el submenú de importación. 

**Todo elemento que sea importado en Eclipse se duplica**. Con esto queremos decir que borrar la copia con la que está trabajando Eclipse en este momento no se borrará el archivo original, así tendremos una copia para recuperarnos de catástrofes. Por otra parte, si usamos la opción de importar un proyecto de Eclipse ya creado, todos los contenidos de dicho proyecto serán duplicados. Así que **deberemos tener especial cuidado al borrar los proyectos** importados del entorno de trabajo de Eclipse, ya que la posibilidad de que no haya copias de seguridad de ese proyecto.

<img src="C:\Users\dell\AppData\Roaming\Typora\typora-user-images\Captura desde 2024-09-24 19-34-56.png" style="zoom:80%;" />

También cabe la posibilidad de copiar, cortar y pegar archivos y carpetas desde Eclipse hasta los directorios del propio sistema operativo (como por ejemplo, del explorador de Windows) y viceversa (seleccionando un archivo, pulsando CTRL+C, seleccionando la carpeta de destino dentro de Eclipse y pulsando CTRL+V).



#### Parte 2: Crear elementos de Java

Dice un proverbio chino: "Hasta el viaje más largo comienza con un solo paso".



Cuando ya hemos creado un proyecto nuevo, vamos a crear los diversos elementos JAVA. Para ello es necesario cambiar la "Perspectiva JAVA" seleccionando "**Windows > Perspectives > Java**". Esta vista contiene las herramientas más útiles para crear aplicaciones en este lenguaje.

Pulsando sobre el botón derecho en la carpeta que hemos creado recientemente ('**src**' por ejemplo) dentro de la vista Package Explorer, aparecerá un menú contextual. Si seleccionamos 'New >' en ese menú, aparecerán los diferentes **elementos JAVA que pueden ser creados**

<img src="C:\Users\dell\AppData\Roaming\Typora\typora-user-images\Captura desde 2024-09-25 11-52-41.png" style="zoom:80%;" />

Algunos de estos elementos pueden ser creados desde los iconos del propio menú en la parte superior de la pantalla.

![image-20240925120755820](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240925120755820.png)

##### **Java class**

Las clase de JAVA que nos encontraremos en los archivos estarán dentro de los ".java", los cuales contienen el código fuente y serán posteriormente compilados en archivos ".class". Estos archivos JAVA deben ser almacenados dentro de la carpeta fuente que creamos anteriormente. Pulse "**New > Class**" para abrir la ventana de creación de clases.

<img src="C:\Users\dell\AppData\Roaming\Typora\typora-user-images\Captura desde 2024-09-25 12-13-23.png" style="zoom:90%;" />

La carpeta fuente especificada debería ser la carpeta recientemente definida (src). En caso de no especificar un paquete sobre el que se deben guardar las clases JAVA se almacenarán en uno por defecto. Y por último, el campo que debería ser rellenado de forma obligatoria antes de crear nada es el propio **nombre de la clase**. Por convención, todo nombre de clase JAVA deberán **empezar por mayúscula**, siendo además obligatorio poner en **mayúscula la primera letra de cada palabra que contiene el nombre de la clase, si usar espacios.**

Existen otras **modificaciones** que pueden ser añadidas a la clase **justo en el momento de su creación**. También hay que tener en cuenta que no pasa nada si se salta este paso, ya que son ajustes que pueden llevarse a cabo en **fases más avanzadas** del desarrollo sin ningún tipo de problema. Si se pretendiese que la nueva clase herede de otra ya existente, se debería especificar esa clase de la que hereda dentro del campo denominado como "**Superclass**"

El botón identificado como "Browse" puede sernos de mucha ayuda a la hora de buscar clases que sean candidatas a ser extendidas. Aunque **JAVA solo soporta herencia de una sola clase**, si puede ser posible que una clase implemente más de una interfaz. Así que una vez más, el botón identificado como "Browse..." nos simplifica la tarea de seleccionar interfaces implementadas.

En caso de que deseemos que nuestra clase contenga un método "main" (el método inicial de nuestro programa), puede añadirse el método de forma automática marcando la casilla correspondiente. También es posible implementar de esta manera todos los métodos heredados de la superclase y los métodos abstractos. Esta última opción comentada es bastante útil, en caso de que desee instanciar la clase, ya que **todo método abstracto ha de estar implementado.**

Los archivos que han sido compilados **(".class") solo son visibles desde la ventana "Navigator"**, la cual está abierta por defecto dentro de la perspectiva "Resource". Ya que la perspectiva JAVA no abre esa ventana por defecto, los archivos ".class" no serán vistos dentro de Package Explorer. Sin embargo, tan solo debemos guardar un archivo ".java" para que se cree un archivo ".class" resultante de compilar el archivo anterior que contiene el código fuente.

![](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\Captura desde 2024-09-25 12-29-41.png)

##### **File**

A través de este menú, todos los archivos que se crean suelen contener **notas, algo de información adicional y algo de información general**. Otros ficheros pueden ser los de configuración, los de tipo "build" y otros similares pueden crearse de esta manera. Para crear un archivo pulsar en "**New > File**", para después seleccionar el proyecto y directorio adecuados, darle un nombre, y pulsar sobre el botón "Finish". Por defecto, los ficheros de **tipo genérico** se abren en un editor de texto.

##### Folder

Las carpetas se utilizan para almacenar y organizar archivos. **Una carpeta normal no es exactamente igual que una en la que hay archivos de código fuente.**

Una buena praxis es **crear de forma explícita una carpeta** en la que alojar todos nuestros archivos que contienen el código fuente (.java), otra carpeta donde poder guardar el código compilado (bin) y una carpeta adicional para guardar toda la documentación relacionada como puedan ser pdfs o archivos txt (docs). Para crear una nueva carpeta tan solo necesitamos indicar el nombre que queremos darle a la carpeta y el nombre de cuál será su carpeta padre. "**New > Folder**"

<img src="C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240925170935670.png" alt="image-20240925170935670" style="zoom:80%;" />

##### Interface

Uno de los casos particulares de las clases JAVA son **las interfaces**, las cuales **no cuentan con código implementado y que se espera que otras clases las implementen. **Funcionan como una especie de contrato, indicando lo que la clase implementada debería hacer, mientras que los detalles de más bajo nivel corresponderían al implementador. La forma de proceder ante la creación de las interfaces es casi igual que crear una clase JAVA. Además,  aunque **una interfaz no pueda implementar a otra** como lo hiciera una clase, sí que puede heredar de otra. "**New > Interface**"

##### Package

Los paquetes son declarados para **almacenar y organizar los archivos** JAVA. El nombre del paquete consta de varias partes que están separadas por puntos. Cada una de estas partes será un directorio nuevo dentro del sistema de archivos. Las clases que son creadas dentro de un paquete en Eclipse llevarán asignada de manera automática la declaración de "package" en su código fuente. "**New > Package**"

##### Scrapbook Page

Este tipo de "**hojas en sucio**" son una manera sencilla de poder probar porciones de código antes de añadirlos al programa final. Tan solo tenemos que crear un "Scrapbook Page"  en la carpeta que deseemos y escribir después el código que deseemos dentro de ella.



**NO ES NECESARIO INTRODUCIR EL CÓDIGO DENTRO DE UN MÉTODO MAIN PARA EJECUTARLO**



Los "scrpabook pages" no aparecen directamente en el menú contextual. Para poder crear la "hoja en sucio" selecciona "**New > Other > Java > Java Run/Debug > Scrapbook Page**".

<img src="C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240925170858154.png" alt="image-20240925170858154" style="zoom:80%;" />

Otra de las diferencias entre otras versiones de eclipse con las últimas es que en estas están **habilitadas las funciones de autocompletado** dentro de las scrapbook pages.

Antes de intentar ejecutar el código añadido es necesario **importar las clases usadas**. Para importarlas debemos pulsar el botón derecho sobre una parte cualquiera de la hoja y seleccionar "**Set Imports**" dentro del menú contextual. Ahí es donde hay que especificar los tipos y paquetes que es necesario añadir.

Para poder ejecutar el código recién creado es necesario seleccionarlo mediante el uso del botón izquierdo del ratón o con la ayuda del teclado. Posteriormente tan solo debemos pulsar el botón derecho y hacer 'clic' sobre la opción '**Execute**' del menú contextual. La salida "estandar" de ese proceso se mostrará dentro de la vida denominada "**Console**", y otros mensajes de error se mostrarán también dentro de la misma hoja de sucio.

**Una vez que hayamos finalizado la prueba deberíamos pulsar el botón "Stop Evaluation"** en el menú contextual.

Debido a que el editor de este tipo de hojas no muestra tantas ayudas como lo hiciera la ayuda a la programación del editor JAVA, una buena praxis sería la de primero escribir nuestro código en el editor JAVA y luego pegarlo directamente en el editor de las "hojas en sucio".



##### Source Folder

Las carpetas que contienen el código fuente son un **tipo especial de directorios** que están destinados a almacenar los archivos de código fuente JAVA (es decir, los que tienen extensión ".java"). Estos archivos de código serán automáticamente compilados en archivos ".class". Debido a que todos los proyectos JAVA deberían tener una carpeta con código fuente, es una buena praxis **organizar todo** esto desde el momento en que creamos el proyecto.



#### Parte 3: Funciones útiles de programación

Vamos a presentar las funciones de ayuda  que Eclipse nos brinda. 

##### Compilar y detectar errores

**Los errores de compilación se muestran en tiempo real**, mediante el subrayado del fragmento del código que contiene el error mediante una línea roja. Y además el entorno automáticamente compila los archivos salvados. Así, de esta forma nos saltaremos el paso de tener que compilar el código y solucionar potenciales errores de compilación.

**Los errores son fácilmente apreciables, puesto que los veremos remarcados en el margen derecho** del editor JAVA. Los errores pueden encontrarse fácilmente porque se muestran además como **marcas rojas** en el margen derecho del editor de código Java. De igual forma, los errores y las advertencias presentes en los archivos ya guardados se muestran dentro de la "**Task View**". Haciendo clic en cualquiera de los tipos de marcado de error, nos llevará a la línea en la que se encuentra dicho error.

![](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240926104508676.png)



**ICONO DE BOMBILLA = AUTOCORREGIR**

Eclipse de manera habitual nos permite **autocorregir** todos los posibles errores **haciendo click en el icono de la bombilla** que nos aparecerá en el margen izquierdo del editor de código.

Así pues, nos aparecerá una ventana mostrando todas las opciones. Seleccionar una opción usando los cursores del teclado, o bien, dejar pulsado el ratón sobre esta opción, abrirá una nueva ventana mostrando de manera detallada las modificaciones en el código que realizará. Tan solo basta con tener que hacer click en la opción seleccionada (o bien, pulsar ENTER) para autorizar a Eclipse a realizar la corrección de manera automática.

![image-20240926104925661](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20240926104925661.png)

**CTRL + Espacio = Autocompletar**



##### Nombres de clases

Crear referencias a otras clases dentro de la clase actual es una tarea de programación habitual. Para resolver las referencias a clases a la hora de compilar será necesario añadir declaraciones en las que se importen dichas clases.

Usar "**CTRL + Espacio**" tras escribir las primeras letras del nombre de la clase JAVA activará la función **autocompletar** con los posibles nombres. Puede seleccionar cualquiera de ellas simplemente realizando clic izquierdo del ratón. Nótese que la sentencia de importación correspondiente se añadirá de forma automática. **Las clases JAVA estarán marcadas con una letra "C" verde mientras que las interfaces lo estarán con un "I" morada.** Para evitar confusiones, el paquete al que pertenece la clase será mostrado también para evitar confusiones.



##### Atributos y Variables Locales

Después de escribir los primeros caracteres del atributo o de la variable en cuestión, pulsando "**CTRL + Espacio**" nos mostrará todas las posibles alternativas para el nombre. Este proceso es parecido al usado en los nombres de las clases. **Las variables locales son marcadas con el icono de una "L" de color gris, mientras que los atributos son marcados con un icono que variará en función de la visibilidad del atributo.**

<img src="C:\Users\dell\AppData\Roaming\Typora\typora-user-images\Captura desde 2024-10-01 10-14-49.png" style="zoom:80%;" />

##### Métodos y constructores

Cuando hemos creado un objeto JAVA, podremos invocar los métodos correspondientes a su clase.  Con "**CTRL + Espacio**" tras haber escrito el nombre del objeto seguido de un punto, lo cual mostrará una ventana con las posibles alternativas. Pulsar sobre la alternativa escogida añadirá la signatura del método al objeto.

También nos deja autocompletar la signatura de los constructores pulsando "**CTRL + Espacio**" tras escribir el nombre que hayamos dado a la clase seguido de un signo de apertura de paréntesis, "**(**".

Es posible crear la plantilla de un método escribiendo las primeras letras de su modificador y pulsando nuevamente en "**CTRL + Espacio**". Pulsando el tabulador podremos desplazarnos por los diferentes campos de la plantilla, de tal manera que pueda ser completado el tipo de retorno, el nombre del método y sus parámetros.



##### Bucles

Suelen estar presentes en todos los programas. Eclipse nos ofrece funciones para completar los bucles que nos ayudarán a ahorrar tiempo. Tan solo debemos escribir las primeras letras de los bucles y pulsar "**CTRL + Espacio**" para ver las posibles opciones. Si el bucle que estamos intentando crear itera sobre un array de elementos, mediante el uso de esta función también intentará autocompletar el nombre del array.

<img src="C:\Users\dell\AppData\Roaming\Typora\typora-user-images\Captura desde 2024-10-01 10-24-14.png" style="zoom:80%;" />

##### Etiquetas de Javadoc

Los comentarios que el programador quiera hacer en el programa irán precedidos por "**//**" mientras que los comentarios realizados por el JAVADoc estarán precedidos por **/****. Cuando creemos un método y añadamos "/** + ENTER" sobre la signatura del método añadirá información sobre el JAVADoc como puedan ser "@param [nombreParametro] [comentario]", "@return [descripcionDatosDevueltos]" y "@throws [tipoExcepcion] [comentario]". Pulsar **"CTRL + Espacio" dentro de un bloque "/\*\*...\*/" mostrará toda la lista de etiquetas Javadoc posibles.**



##### Menú "SOURCE"

![image-20241001105452494](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241001105452494.png)

Si hacemos clic derecho en el editor del código nos mostrará un menú contextual. Las funciones más destacadas del submenú "**Source >**" son las siguientes:

- Comment and Uncomment

  Mediante esta opción podemos comentar o eliminar las marcas de los comentarios del código. Esto es muy útil cuando queremos comentar bloques enteros de código para hacer pruebas, sin necesidad de eliminar el código para luego tener que volver a introducirlo. Por defecto, las teclas "mapeadas" para añadir comentarios por defecto son "**CTRL + /**" para añadir todos los comentarios y "**CTRL + \\**" para eliminar las marcas de comentario del bloque del código seleccionado.

  Estos comandos han sido sustituidos por "**Toggled Comment**". Para ello debemos irnos al menú "Source" y pulsar la opción comentada, la cual nos permitirá comentar el código seleccionado, o por contra, si ya lo estaba, descomentarlo.

  También la nueva opción añadida llamada "**Add Block Comment**" comentará el código añadiendo los símbolos **"/\*" y "\*/"**. También seleccionar un bloque de código que ha sido comentado previamente hará que nos aparezca la opción "Remove Block Comment", la cual descomentaría el bloque.

  

- Format

  La función de formateo automático nos ayudará a la hora de **identar** el código de forma automática, además de llevar otras funciones de representación. Es una forma de conseguir tener un **código ordenado y comprensible**. Las opciones de formateo automático pueden ser configuradas por el programados a través de "**Window > Preferences > Java > Code Formatter**". Las teclas que vienen mapeadas por defecto son "**CTRL + Mayúsculas + F**"

  Hay que tener en cuenta que estas funciones de identación nos permiten identificar de manera rápida los fragmentos de código que están afectados por alguna condición dentro de un bucle IF o dentro de un bucle FOR, por ejemplo. También es útil situar el cursor del ratón tras un paréntesis, puesto que nos marcará los paréntesis que abren y cierran dentro del bloque. Así pues, se verá de un plumazo qué código se encuentra entre los dos paréntesis.

  ![image-20241001104656860](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241001104656860.png)

  Permite especificar opciones avanzadas de formateo de código. La página de opciones que nos permiten personalizar el formateo del código ha sido trasladada a "**Windows > Preferences > Java > Code Style > Code Formatter**".

  A pesar de que las opciones se pueden configurar al gusto del consumidor, estas ya vienen configuradas por defecto para cumplir con las convenciones de JAVA.

  

- Organize and Add Imports

  Las sentencias de importación se muestran de manera correcta siempre y cuando estemos usando las funciones de **autocompletar** código para el nombre de una clase JAVA, es posible añadir nuevas sentencias de importación haciendo uso de la función "Add Import". Mediante el uso de **"Organise Imports" eliminará de forma automática todas las declaraciones de importación que hayamos hecho y no estén siendo utilizadas**, con el fin de hacer el código un poco más eficiente, ya que estás importaciones no serán añadidas en tiempo de compilación. El método abreviado del teclado que viene configurado por defecto es "**CTRL + Mayúsculas + O**"

  ![image-20241001105936542](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241001105936542.png)

  

- Override and Implement Methods

  Marcar los métodos de las superclases que tenemos importadas para que sean añadidos a la que estamos desarrollando.

  <img src="C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241001110133376.png" alt="image-20241001110133376"  />

  La opción "Add Constructors from Superclass" permitirá especializar todos los constructores usados.

  

- Generate Getter and Setter

  Java permite especificar diferentes niveles de visibilidad de atributos. Sin embargo, en programación orientada a objetos, los atributos internos de una clase deberían ser siempre privados. La modificación de esos atributos privados ha de realizarse única y exclusivamente por la clase que los contiene, siendo imposible su modificación desde una externa. Es por esto, que **para modificar un atributo privado desde una clase externa, es necesario el uso de métodos** proporcionados por la misma clase que nos permitan su acceso o modificación de una forma controlada (métodos get y set). Mediante  "**Generate Getter and Setter**" nos aparecerá una ventana con los posibles métodos que podrían crearse a raíz de los atributos especificados en la clase. Entonces los métodos necesarios podrían crearse simplemente seleccionándolo y pulsando OK.

  ![image-20241001111013139](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241001111013139.png)

- Surround with try/catch block

  Para poder usar esta opción es necesario tener previamente un fragmento de código habiendo hecho uso del botón izquierdo del ratón (o pulsando Mayúsculas) y arrastrando. **Activar esta opción creará un bloque "try" alrededor del código seleccionado**. A continuación del bloque se añadirán de forma automática los bloques de código "catch", que son los que se encargarán de manejar la posible excepción que se haya lanzado. Por defecto se añaden elementos traza dentro de los bloques, para que sea posible posteriormente identificar en que parte del código se ha producido dicha excepción.

  <img src="C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241001112012891.png" alt="image-20241001112012891" style="zoom:80%;" />

  Cuando una excepción que ha sido lanzada no ha sido capturada, aparecerá un **texto marcado en rojo en la vista "Console"** por la salida estándar. Si pulsamos la línea de código de la salida nos llevará hasta la línea exacta en la que se ha producido la excepción.

  

- Refactor Menú

  Haciendo clic en el editor del código mostrará el menú contextual. A continuación se muestran las funciones más interesantes del sub menú "**Refactor >**"

  

  - Rename

    Hay que **tener previamente seleccionado un elemento.** La opción de "update references" actualizará cualquier referencia al nuevo elemento renombrado. Mediante la opción "Refactor > Rename..." es como **deberían renombrarse todos los elementos** incluyendo los archivos .java. Así no deberían aparecer problemas a la hora de compilar.

    También será posible actualizar las referencias que haya dentro de los comentarios de Javadoc, comentarios normales y las cadenas de caracteres entrecomilladas. La opción "**Preview**" nos permite comprobar que no se producirá ningún tipo de error en todo este proceso de renombrado.

  ![image-20241001115905139](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241001115905139.png)

  

  - Move

    Antes de seleccionar "Refactor > Move...", el archivo fuente o elemento que desea mover deberá haber sido seleccionado. Tan solo será necesario **seleccionar el destino** de tal forma que se lleve a cabo las operaciones de movimiento. Esta es la forma correcta de mover los archivos.

  

  - Change Method Signature

    Hay que situar el cursor dentro del método cuya signatura se quiere cambiar. Es una buena forma de poder cambiar de manera rápida la visibilidad, el tipo de return, los parámetros que usa y el orden de los mismos. Para añadir parámetros se hace con "Add" y para editarlos con el botón "Edit".

  

- Pull up and Push Down

  Si la clase que estamos desarrollando extiende a otra, o bien, es extendida por otra, podría ser interesante **mover algunos de sus elementos a la superclase (pull up) o a la subclase (push down)** de manera respectiva. Mediante la selección del elemento y la opción adecuada se producirán de manera automática las acciones convenientes.

  

- Consultar la documentación

  La documentación Javadoc del código que se esté desarrollando se puede ser **consultada en tiempo real** mediante la colocación del cursor o el puntero del ratón sobre el elemento elegido. Para expandir la ventana de la documentación pulsar F12.

  **La documentación Javadoc externa puede ser consultada dentro de las preferencias del JRE** instalado ("Window > Preferences > Installed JRE") y haciendo click en "Edit" en la ubicación del Javadoc. Si dejamos el ratón sobre el nombre de la clase y pulsamos "Shift + F2" se abrirá la documentación en el punto adecuado.

  Eclipse dispone de una nueva vista de Javadoc "Window > Show View...> Java > Javadoc", muestra la documentación asociada al elemento  sobré el que está situado el cursor.

  

- Importar archivos JAR (Java ARchive)

  A veces necesitamos importar archivos JAR para que nuestro proyecto pueda compilar. Pulsar botón derecho sobre la carpeta que deseemos y elegir "**Properties > Java Build Path**", **Libraries**, **Add External Jars** y seleccionamos el archivo ".jar" o ".zip". En nuevo JAR que hemos añadido aparecerá será visible en la ventana Package Explorer como si fuese un pequeño frasco.



#### Parte 4. Vistas de Eclipse

La interfaz de Eclipse cuenta con dos tipos de elementos: 

- Editores: permiten realizar una tarea completa.
- Vistas proporcionan funciones de apoyo.

Perspectivas: agrupación de vistas y editores. Es posible crear perspectivas propias añadiendo nuevas vistas y cambiando su distribución en la pantalla. Las perspectivas pueden ser seleccionadas  haciendo uso de los iconos de perspectiva situados en el lateral izquierdo, o bien "Window > Open Persperctive".



Las perspectivas son:

- Resource: ligada al sistema de archivos, almacena la localización física de los recursos.
- Java: se basa en las tareas de programación mostrando los paquetes, las clases, los métodos y los atributos de sus vistas acociadas
- Plug-in development: permite añadir nuevos módulos a Eclipse.
- Install / Update: gestiona los elementos instalados para poder ver sus versiones y poder actualizarlos.
- Debug: se centra en labores de depuración, en los procesos de ejecución, los puntos de ruptura, las variables, salidas, etc.
- Java Browsing: permite ojear rápidamente código, proyectos, paquetes y jerarquías.



Los iconos de perspectiva se han trasladado a la esquina superior derecha ![image-20241003115000727](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241003115000727.png)

La perspectiva "Install/Update" se ha eliminado y ahora se accede desde "Help > Software Updates".



- Tareas

  La vista de tareas "Tasks View" gestiona las tareas pendientes. "Window > Show View > Task".

  Para añadir nuevas tareas "Add Task", tanto la prioridad como el estado de la tarea se puede modificar, haciendo clic en los campos mencionados.

  Para ver los errores pulsar en "Descripción del error".

  Añadir "TODO [descripcion] a un archivo JAVA incluirá una nueva tarea TODO en la vista de tareas.

  Las etiquetas "TODO" pueden encontrarse de manera rápida, ya que se muestran de color azul en el margen derecho. Algunos procesos automáticos insertan este tipo de  etiquetas para "forzar"  en cierta medida al desarrollador a revisar el nuevo código insertado.

  

- Navigator

  La ventana del navegador de recursos nos permite **observar la estructura de archivos** de los proyectos. Es la única vista que nos muestra el directorio de salida (bin) y los archivos compilados .class

  ![image-20241003122832295](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241003122832295.png)

- Package Explorer

  La vista del navegador de paquetes nos enseña la estructura lógica de los paquetes y clases JAVA almacenados en los proyectos. Las carpetas fuente se muestran decoradas con un icono de un paquete contenido. 

  Los ficheros java pueden ser expandidos para que se muestren sus métodos y atributos internos pulsando en el botón +.

  ![image-20241003123311253](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241003123311253.png) 

  

- Working Set

  Un conjunto de trabajo es una **agrupación de elementos** que se muestran en las diferentes vistas de Eclipse. Separa de manera clara los diferentes proyectos en los que estamos trabajando. Acelera el proceso de buscar los elementos.

  Para establecer un conjunto de trabajo, pulsar sobre el icono (triángulo invertido) de Package Explorer y seleccionar "Select Working Set".

  Si creamos un proyecto nuevo y queremos incluirlo en el conjunto de trabajo hay que editar dicho conjunto, Seleccionar "**Select Working Set > Edit**" o "**Edit Current Working Set**" y seleccionar el nuevo proyecto.

  

- Outline View

  La vista de resumen nos muestra de manera raṕida los métodos y atributos de la clase. Los iconos asociados proporcionan información adicional de acuerdo a la visibilidad del atributo o método en cuestión. **La vista de resumen es una herramienta esencial para entender y navegar en archivos Java voluminosos.**

  

- Hierarchy View

  La vista de la jerarquía nos muestra las **relaciones de herencia** que están presentes entre los elementos JAVA. Para abrirla botón derecho en el nombre de la clase y seleccionar "Open Type Hierarchy" o "F4".

  En la versión 3.0 se ha añadido la opción "Open Call Hierarchy" dentro del menú contextual del editor de código. Trás haber seleccionado un método, al hacer click sobre esta opción se abrirá una vista que nos mostrará donde esta siendo usado dicho método "**CTRL + ALT + H**".

  

- Fast View

  Si arrastramos una vista al margen izquierdo, convertimos dicha vista en "vista rápida". Se muestra o se oculta pulsando en el icono de vista rápida. Si se pulsa en el botón derecho en el icono de vista rápida y seleccionar "Fast View" restaurará la vista a la posición original.

  La zona predeterminada en la que suelen aplicarse las vistas ha sido cambiada. Ahora aparecen a la izquierda de la pantalla. Así que  **las vistas rápidas ahora son creadas arrastrando la vista dentro de su respectivo rectángulo hasta que aparezca un icono de flecha dentro de un cuadrado.**

  

- Search View

  Para hacer una búsqueda usar la barra superior de menús o pulsar el icono de la linterna.

  ![image-20241003130305560](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241003130305560.png)

  Hay varios tipos de búsqueda:

  - Búsqueda de archivos (File Search): realiza un tipo de búsqueda textual sobre cualquier tipo de archivo. **Es equivalente a una búsqueda tradicional.**
  - Búsqueda de ayuda (Help Search): efectúa búsquedas dentro de la ayuda de Eclipse.
  - Java Search: es parecida a la búsqueda tradicional, pero ésta proporciona funciones extra para buscar dentro de los archivos JAVA. Así podemos buscar por tipo, métodos, paquetes, etc. 

  Debemos cerciorarnos de que estamos buscando sobre los ficheros que necesitemos, para ello usamos el campo "scope". "workspace" hace referencia al entorno de trabajo completo, La opción "Selected Resources" nos permite buscar solo sobre los archivos seleccionados (clic izquierdo en cada archivo mientras se mantiene pulsada la tecla CTRL).

  Los resultados de la búsqueda se muestran en la vista "Search". También aparecen marcados en gris dentro del editor de ambos márgenes, en el izquierdo con una flecha amarilla y en el derecho con una marca gris.

  Los resultados de búsqueda se muestran como un árbol jerárquico.

  ![image-20241003131218464](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241003131218464.png)

    

- Navegar por las vistas y los Editores

  Opciones de navegación adicionales, muestra la información presentada de manera adecuada en los editores y las vistas.

  - Maximizar una vista o editor.

    Hace doble clic en el título de la ventana o "CTRL + M" para maximizarla. Si se vuelve hacer doble clic vuelve a su tamaño original.

  - Ir al último cambio.

    Al pulsar el Icono con una flecha con asterísco coloca el cursor en el último punto que ha sido modificado dentro del editor activo. ![image-20241003131806132](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241003131806132.png) o "CTRL + Q"

    

- Acciones de navegación de los editores

  Las flechas de navegación "navegar hacia atrás" nos mueve a los puntos que hemos ido visitando con anterioridad. ![image-20241003132832019](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241003132832019.png) Y si pulsamos por contra "navegar hacia adelante" nos mueve por los lugares más recientes.

  La opción "atrás" sólo funcionará si hemos visitado otras partes y la de hacia delante sólo funciona si hemos ido hacia atrás. 

  Para cambiar la ventana activa del editor pulsar "**ALT + F6**".

  "**ALT + Izquierda**" y "**ALT + Derecha**" para ir navegando hacia atrás y hacia delante.

  

- Revisar problemas

  Pulsar "Ir al siguiente/anterior problema" para ir hasta los puntos del editor en los que hay algún tipo de circunstancia que imposibilitaría el correcto funcionamiento del programa.

  Se puede acceder directamente a los problemas, advertencias, resultados de búsqueda y tareas pendientes haciendo clic sobre las marcas asociadas que aparecen en el margen derecho del editor.

  Los botones de "Ir a al siguiente/anterior problema" se ha sustituido por "Siguiente/anterior anotación". Si hacemos clic en el triángulo pequeño de color negro cercano a las flechas de navegación se nos abrirá una **lista editable** con los tipos de anotaciones que serán recorridas.

  El uso de estos botones no estará limitado a la comprobación de errores, si no que se pueden hacer otras tareas útiles como comprobar de manera sistemática todos los TODO con tan solo seleccionar "Task" en la lista.

  ![image-20241003135112769](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241003135112769.png) 



#### Parte 5. Ejecutar y depurar

"En unos minutos, un ordenador puede cometer un error tan grave que muchos hombres necesitarían muchos meses para igualarlo"



Cuando hayamos completado nuestro programa, será buen momento de probar que todo **funciona correctamente**. Es posible que aparezcan "**bugs**". Así que entonces irá siendo hora de depurarlo. Eclipse posee **herramientas para las labores de depuración**.

##### Ejecutar

Para ejecutar un programa seleccionar "**Run > Run**..." del menú principal. Dentro de "Configurations" se almacenan diferentes configuraciones de ejecución. Hay 4 tipos de ejecución que podemos configurar:

- Java Applet: para applets web, ahora en desuso.
- Java Application: para programas normales de JAVA.
- JUnit: para realizar test unitarios.
- Run-Time Workbench: para probar nuevos módulos de Eclipse.

Para ejecutar un programa tenemos que seleccionar "**JAVA Application**" y pulsar botón "New" para así crear una nueva configuración. Dentro de la pestaña "Main" hay que dar nombre a la nueva configuración y seleccionar el proyecto que contiene la clase con el método main y seleccionar la Clase.

El método "main" es el punto de ejecución de un programa JAVA, la primera función de nuestro código que se ejecuta y es representado como un pequeño icono de un hombre corriendo junto al icono de la clase.

Si se desea pasar **argumentos al método main** (en la forma de "String[] args"), hay que pulsar en la pestaña "**Arguments**" y escribir los argumentos separados por espacios dentro de la zona "Program Arguments".

<img src="C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241004083242325.png" alt="image-20241004083242325" style="zoom:80%;" />

Finalmente pulsar botón "**Run**" para lanzar la ejecución del programa seleccionado o pulsar sobre el icono del hombre corriendo del menú principal. Pulsar la flecha próxima a este icono mostrará otras configuraciones de ejecución recientemente utilizadas.

En la nueva versión de Eclipse el icono se ha cambiado por una **flecha blanca dentro de un circulo verde**.



##### Depurar

JAVA no suele ser difícil de depurar. Eclipse posee una herramienta "Debug" "**Window > Open perspective > Debug**" o pulsando el icono de un "insecto".

Depurar: proceso de identificar, analizar y corregir errores o defectos en el código fuente.

Si pulsamos en el margen izquierdo, aparecerá un menú contextual:

Si seleccionamos "Add/Remove Breakpoint" añadiremos o quitaremos un punto de ruptura

Si seleccionamos "Toggle Breakpoint" invertirá el estado en el que estuviese dicho punto de ruptura.

**Los puntos de ruptura son marcas en las que se detendrá nuestro programa cuando estemos realizando operaciones de debug,** permitiéndonos así poder ver una vez llegado a este punto, paso a paso la ejecución del programa, así como el valor de las variables, pudiendo así identificar los errores.

Haciendo clic derecho sobre un punto de ruptura y seleccionando "Breakpoint Propierties" especificaremos opciones avanzadas del punto de ruptura. **"Hit Count" número de veces que debe pasar el programa por el punto de ruptura para parar la ejecución**. Por ejemplo podemos indicar una variable como una condición de activación para después seleccionar "suspend when value of condition changes", esto detendrá la ejecución en el punto de ruptura cuando esa variable sea modificada.



**Las excepciones son uno de los síntomas más evidentes de errores de ejecución.**  Los "Java Exception Breakpoints" detienen la ejecución cuando salta una excepción del tipo seleccionado. Estos puntos de ruptura se activan haciendo clic en el icono "J!" de la vista de breakpoints o desde el menú principal "Run". **La ejecución puede detenerse cuando la excepción sea capturada, no capturada o ambas.**

Es muy recomendable como práctica de depuración añadir puntos de ruptura  de excepciones JAVA : 

- **"ArrayIndexOutOfBoundsException"**: cuando se supera el índice en una matriz. 
- **"NullPointerException"**: cuando se intenta acceder a un elemento null.



Para que el programa se detenga cuando alcance los puntos de ruptura "**Run > Debug**". El programa podrá seguir de diferentes formas (botón derecho del editor):

- **"Run to line"**: nos reanudará la ejecución del programa hasta que alcance la línea en la que está el cursor.
- **"Step into selection"**: seguirá con la ejecución dentro del método seleccionado siempre que el código fuente del método esté disponible.



Reanudar la ejecución: botón derecho sobre la ventana "Debug" seleccionando la opción oportuna.

![image-20241004120310064](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241004120310064.png)

**"Step over"**: parará en la línea siguiente a la invocación de un método.

**"Resume"**: hará una reanudación de la ejecución normal del programa y tan solo se detendrá en los puntos de ruptura si sus condiciones de activación se dan.



La vista "**Variables**", muestra información muy útil, como el valor actual en el momento de la ejecución que tienen las variables en un punto de ruptura.

![image-20241004120742952](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241004120742952.png)

La vista "**Debug**" muestra los distintos procesos que se están ejecutando al mismo tiempo, como por ejemplo "hebras". Cuando un proceso de depuración ha finalizado los procesos que se muestran en la ventana de depuración se mostrarán con **"Finished"** (pueden acabarse manualmente con clic derecho > Terminate).

La información de las ejecuciones previas puede eliminarse haciendo clic derecho sobre ella y seleccionando "Terminate and Remove" o "Terminate All" + "Remove All terminated".



**Gestión de cambios**

**Eclipse proporciona un potente sistema de gestión de cambios y control de versiones**. Si hacemos clic derecho en un archivo JAVA dentro del Package Explorer y seleccionamos "Replace With > Local History" nos permitirá remplazar la versión que tenemos actualmente por una previamente guardada. La hora y la fecha en la que se ha modificado se muestran junto a dos ventanas que resaltan las diferencias entre las dos versiones.

![image-20241004121621271](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241004121621271.png)

"Window > Preferences > Workbench > Local History" nos muestra el nº de versiones, los megabytes y el nº de días a almacenar.





## 1.1 Introducción a Java

JAVA "Write once, run anywhere": el mismo código compilado puede ser usado en múltiples plataformas.

![image-20241004122402478](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241004122402478.png)

![image-20241004122646723](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241004122646723.png)

La máquina virtual de Java (**JVM**) se define como:

UNA MÁQUINA IMAGINARIA IMPLEMENTADA MEDIANTE LA EMULACIÓN POR SOFTWARE EN UNA MÁQUINA REAL. EL CÓDIGO PARA LA MÁQUINA VIRTUAL SE GUARDA EN ARCHIVOS CON EXTENSIÓN .CLASS, CADA UNO DE LOS CUALES TIENE, AL MENOS, UN CÓDIGO DE UNA CLASE PÚBLICA.



La especificación de la JVM proporciona las especificaciones de hardware para las que se compila el código fuente de Java. Esta especificación permite al software desarrollado en Java ser independiente de la plataforma, ya que la compilación se hace para una máquina genérica (JVM). Esta puede ser emulada por software para poder ser ejecutada en los diferentes sistemas informáticos existentes, o bien ser implementada en hardaware. La JVM ha sido desarrollada para múltiples arquitecturas y sistemas operativos Windows, GNU /Linux, Solaris y plataformas como Android han desarrollado su propia implementación.

A partir del código fuente el compilador  genera el bytecode (conjunto de instrucciones en binario para ser interpretado por la JVM), desde el punto de vista del programa la **JVM** encapsula la máquina anfitrión (máquina física). El bytecode sigue el principio "Write once, run anywhere", significa que escribiéndolo una vez es posible ejecutarlo en cualquier plataforma que disponga una implementación de la JVM.



La especificación de la JVM proporciona definiciones muy concretas para la implementación de:

![image-20241004124002894](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241004124002894.png)

**Garbage collector**

Gran parte de los lenguajes de programación permiten la reserva de memoria en tiempo de ejecución. El proceso de reserva de memoria varía según la sintaxis del lenguaje, pero siempre involucra el retorno de un puntero al inicio del bloque de memoria reservado.

Una vez la memoria reservada deja de necesitarse (el puntero que la referencia esta "out of scope"), el programa o el entorno de ejecución debería liberar esa memoria.

En C, C++, y otros lenguajes, el programador es el responsable de la gestión de la liberación de memoria. Esta es una tarea complicada a veces por que no siempre se sabe a priori cuando se puede liberar la memoria. Los programas que no liberan la memoria utilizada pueden generar errores de ejecución cuando ya no queda memoria disponible en el sistema. Se dice que estos programas tienen fugas de memoria "(memory-leaks)".

**Java** libera al programador de la responsabilidad de liberar la memoria, tiene una hebra de ejecución, o proceso en paralelo, a nivel de sistema que rastrea las operaciones de reserva de memoria. Durante los ciclos muertos de la JVM, la hebra de "Garbage Collector" verifica qué memoria puede liberarse y realiza dicha operación.

El proceso de "Garbage collector" se realiza automáticamente durante el ciclo de vida de un programa Java, eliminando la necesidad de liberar memoria manualmente y evitando espacios de memoria reservada sin usar. Sin embargo, la implementación del gestor "Garbage collection" puede variar en las diferentes implementaciones de la JVM.



## Introducción a JSP

Antes de comenzar con JSP debemos conocer sobre la Java Platform, Enterprise Edition 5 (Java EE 5), es una **plataforma de programación** para **desarrollar y ejecutar** software programado en **Java** con arquitectura de N capas distribuidas y se apoya en componentes de software modulares ejecutados por un servidor de aplicaciones.

![image-20241005011812231](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241005011812231.png)

Analizando un problema y diseñando una solución.

Las características más importantes de esta plataforma son:

![image-20241005011932108](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241005011932108.png)

Sun libera en el Java EE:

![image-20241005012108253](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241005012108253.png)

### Servlets

La tecnología servlets es uno de los puntos fuertes de Java, conocerla es garantía de dominar este lenguaje de programación.

Los **servlets** (al igual que los applets) se ejecutan en un entorno restringido (**sandbox**) lo que protege al servidor de cualquier mal funcionamiento del **servlet**. Esto permite a los proveedores de internet que sus clientes depositen **servlets** sin temor de que sean maliciosos. Se incrementa la seguridad respecto a cualquier otra tecnología.

Al estar escritos en **Java**, tienen todas las ventajas de este lenguaje (pueden hacer uso de cualquier paquete de Java). Como es un lenguaje altamente escalable surgirán paquetes de una forma muy rápida.

Los **servlets** son **portables** entre **plataformas**. (escribir una vez, ejecutar en cualquier lugar). Los servidores Web más populares dicen soportar los servlets.

Los **servlets** son componentes de la parte del servidor de JAVA EE, encargados de generar respuestas a las peticiones recibidas de los clientes.

En la mayoría de las páginas Web se van a introducir Formularios para **recoger datos** aportados por los **clientes**. Los formularios son un mezcla de HTML y de Scripts (programas que se ejecutan en el servidor para recoger los datos que el cliente ha introducido a través del formulario, y en base a ellos, construir una página dinámica para responder a la petición).

Estas páginas se llaman dinámicas por que no van a existir en el disco duro del servidor sino que se van a generar como respuesta a una petición hecha desde el cliente a través de un formulario.

Estos scripts se usan mucho por varios motivos:

![image-20241005235917978](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241005235917978.png)

Las ventajas de los servlets respecto a los CGI:

- Los servlets no se van a ejecutar en un proceso separado, por lo que no necesita ejecutarse cada vez que recibe una petición.

  La primera vez que se invoca un servlet este es compilado y almacenado en memoria, mientras el servlet original no sea alterado se seguirá usando su compilación en memoria en las siguientes peticiones, por lo que consumen menos recursos. Esto significa que una sola instancia de un Servlet responde a todas la peticiones con lo que, además del ahorro de recursos, se pueden gestionar, de modo más adecuado los datos que le llegan.

- Al estar escritos en Java, tiene todas las ventajas de este lenguaje. Como es un lenguaje escalable surgirán paquetes de una forma muy rápida (por ejemplo, ya existen paquetes para la gestión de documentos XML).

- Los servlets son portables entre plataformas ("escribir una vez, ejecutar en cualquier lugar"). Netscape, Apache e IIS, los tres servidores Web más populares soportan los servlets.

En esta imagen podemos observar el esqueleto básico de un servlet:

![image-20241006000606253](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241006000606253.png)

Las sentencias import indican al compilador de Java la inclusión de todas las clases públicas e interfaces de los paquetes java.io y javax.servlet en la compilación.



La clase EjServlet, es heredera (extends) de la clase HttpServlet. Esta clase proporciona la interfaz para que el servidor le pase las peticiones al servlet y el mecanismo para controlar el ciclo de vida del servlet.



**JSP**

Es la tecnología Java para desarrollo de páginas web. Permite a los desarrolladores crear páginas web dinámicas con código HTML, código Java que se ejecutará del lado del servidor. Sus ficheros tienen la extensión .jsp. y deben ejecutarse sobre un servidor web compatible, como por ejemplo Apache Tomcat.

Nacen como contraposición a la tecnología ASP de Microsoft, y a PHP y la filosofía es exactamente la misma. El código de JSP se incluye dentro de la estructura de etiquetas HTML indicando el inicio y el fin del código JSP a través de unos caracteres. 

Para poder dominar JSP, lo primero que debemos hacer es conocer perfectamente HTML, ya que al final de la ejecución del fichero JSP, lo que obtendremos será un fichero HTML bien formado, por otro lado, puesto que usa la sintaxis Java será también imprescindible conocer este lenguaje y aquí es donde esta la ventaja de JSP frente a sus competidores. Al estar basado en Java, al igual que cualquier aplicación Java, estos ficheros se pueden ejecutar en cualquier sistema que tenga una máquina virtual de java instalado. Otra ventaja importante es que podemos usar las APIs de Java, con lo que la convierte en una herramienta muy potente.



Se pueden utilizar Servlets para generar webs dinámicas, sin embargo tenemos otra opción que puede ser más simple:

**JSP (Java Server Pages)** , en resumen permite utilizar Java dentro de ficheros HTML, por lo tanto podemos generar páginas dinámicas de manera simple sin tener que declarar clases que se ocupen de ello. Para eso basta con:

- Escribir la parte estática HTML de la manera habitual.
- Encerrar el código Java que genera la parte dinámica de entre unos delimitadores especiales, la mayoría de los cuales empiezan por  "<% y terminan por %>"
- Si queremos mostrar esos delimitadores sin más en la parte estática, debemos escribirlos de esta manera para que el intérprete los ignore:  "<%" debes poner "<\%" o bien usar &lt%.



En esta imagen podemos apreciar las directivas que utilizaremos en aplicaciones JSP:

![image-20241006003723092](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241006003723092.png)

Cuando se solicita al servidor web una página JSP, se inicia un proceso por el que se convierte a un servlet. El ejemplo anterior generará un servlet como el de la imagen siguiente:

![image-20241006003858417](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241006003858417.png)

El motor de las páginas **JSP** está basado en los servlets de Java - programas en Java destinados a ejecutarse en el servidor, aunque el número de desarrolladores que pueden afrontar la programación de JSP es mucho mayor, dado que resulta mucho más sencillo trabajar sobre el HTML que escribirlo orden tras orden dentro de una clase.

En JSP creamos páginas de manera parecida a como se crean en ASP o PHP -otras dos tecnologías para páginas dinámicas. Escribimos archivos con extensión .jsp que incluyen, dentro de la estructura de etiquetas HTML, las sentencias Java a ejecutar en el servidor. Antes de que los archivos sean funcionales, el motor JSP lleva a cabo una fase de traducción de esa página en un servlet, compilado en un archivo .class (bytecode de Java). Esta fase de traducción se lleva a cabo habitualmente cuando se recibe la primera solicitud de la página .jsp, aunque existe la opción de precompilar en código para evitar ese tiempo de espera la primera vez que un cliente solicita la página.



**JSTL**

JSTL (Java Server Pages Standar Tag Library) es una biblioteca que implementa una serie de etiquetas (tags) con funciones que se utilizan de manera frecuente en multitud de aplicaciones JSP. En concreto, debido a su funcionalidad, las etiquetas de JSTL se agrupan en 5 bibliotecas:

- JSTL Core: contiene funciones comunes de iteración sobre datos, operaciones condicionales, importación de otras páginas.
- JSTL Formatting: internacionalización y formateo de texto.
- JSTL functions:  funciones de manipulación de cadenas.
- JSTL XML: procesamiento de XML.
- JSTL sql: soporta operaciones con bases de datos relacionales.



JavaServer Faces (JSF) es una tecnología y framework para aplicaciones Java basadas en web que simplifica el desarrollo de interfaces de usuario en aplicaciones Java EE. JSF usa JavaServer Pages (JSP) para llevar a cabo el despliegue de las páginas, pero también se puede acomodar a otras tecnologías como XUL.

JSF incluye:

- Un conjunto de APIs para representar componentes de una interfaz de usuario y administrar su estado, manejar eventos, validar entrada, definir un esquema de navegación de páginas y dar soporte para internacionalización y accesibilidad.
- Un conjunto por defecto de componentes para la interfaz de usuario.
- Dos bibliotecas de etiquetas personalizadas para JavaServer Pages que permiten expresar una interfaz Java ServerFaces dentro de una página JSP.
- Un modelo de eventos en el lado del servidor.
- Administración de estados.
- Beans administrados.

El objetivo de  JavaServer Faces es desarrollar aplicaciones web de forma parecida a como se construyen aplicaciones locales con Java Swing, AWT (Abstract Window Toolkit), SWT (Standard Widget Toolkit) o cualquier otra API similar.

Tradicionalmente, las aplicaciones web se ha codificado mediante páginas JSP (JavaServer Pages) que recibían peticiones a través de formularios y construían como respuesta documentos HTML (Hiper Text Markup Language) mediante ejecución directa o indirecta, a través de bibliotecas de etiquetas- de código Java, lo que permitía, por ejemplo, acceder a bases de datos para obtener resultados a mostrar amén de realizar operaciones marginales como insertar o modificar registros en tablas relacionales, actualizar un carrito de la compra, etc.

JavaServer Faces pretende facilitar la construcción de estas aplicaciones proporcionando un entorno de trabajo (frameworks) vía web que gestiona las acciones producidas por el usuario en su página HTML y las traduce a eventos que son enviados al servidor con el objetivo de regenerar la página original y reflejar los cambios pertinentes provocados por dichas acciones.

Se trata de hacer aplicaciones Java en las que el cliente no es una ventana de la clase JFrame o similar, sino una página HTML.

Cualquier evento realizado sobre una página JSF incurre en una carga sobre la red, ya que el evento debe enviarse a través de ésta al servidor, y la respuesta de éste debe devolverse al cliente. Aquellas aplicaciones que vayan a ser utilizadas en una intranet podrán aprovecharse de un mayor ancho de banda y producirán una respuesta mucho mas rápida.

Una de las ventajas de que JSF sea una especificación estándar es que pueden encontrarse implementaciones de distintos fabricantes.

JSF trata la vista (la interfaz de usuario) de una formal algo diferente, a lo que estamos acostrumbrados en aplicaciones web, ya que este tratamiento es más cercano al estilo de Java Swing, Visual Basic o Delphi, donde la programación de la interfaz se hace a través de componentes y está basada en eventos (pulsación de un botón, cambio en el valor de un campo, etc).

JSF es muy flexible. Nos permite crear nuestros propios componentes, y/o crear nuestros propios renderizadores para pintar los componentes en la forma que más nos convenga.

Una de las grandes ventajas de JavaServer Faces es que ofrece un clara separación entre el comportamiento y la presentación. Las aplicaciones Web construidas con la tecnología JSP conseguían parcialmente esta separación. Sin embargo, una aplicación JSP no puede manejar peticiones http al manejo de eventos específicos de los componentes o manejar elementos UI como objetos con estado en el servidor. La tecnología JavaServer Faces permite construir aplicaciones Web que introducen realmente una separación entre el comportamiento y la presentación, separación sólo ofrecida tradicionalmente por arquitecturas UI del lado del cliente.

Separar la lógica de negocio de la presentación también permite que cada miembro del equipo de desarrollo de la aplicación Web se centre en su parte asignada del proceso diseño, y proporciona un modelo sencillo de programación para enlazar todas las piezas. Por ejemplo, una persona sin experiencia en programación pueden construir páginas JSF usando las etiquetas de componentes UI que esta tecnología ofrece y luego enlazarlas con código de aplicación sin escribir ningún script ni nada.

Otro objetivo importante de la tecnología JavaServer Faces es mejorar los conflictos familiares de componente UI y capa-web sin limitarlos a una tecnología de script particular o un lenguaje de marcas. Aunque la tecnología JSF incluye una librería JSP personalizadas para representar componentes en una página JSP, APIs de JSF se han creado directamente sobre el API JavaServlet. Esto nos permite: usar otra tecnología de presentación junto a JSP, crear nuestros propios componentes personalizados directamente desde las clases de componentes, y generar salida para diferentes dispositivos cliente, entre otras.

La tecnología JSF proporciona una rica arquitectura para manejar el estado de los componentes, procesar los datos, validar la entrada del usuario, y manejar eventos.

Con JSO podemos crear páginas dinámicas pero también necesitamos guardar la información en una base de datos, para trabajar con bases de datos en Java disponemos de la **Java Database Connectivity (JDBC)**, es una API que permite la comunicación con la base de datos desde Java, independientemente del sistema operativo donde se ejecute y a multitud de bases de datos relacionales.

**API JDBC** es una colección de interfaces Java y métodos para el control de drivers de conexión hacia un tipo determinado de base de datos. Un driver es un conjunto de clases que implementan las interfaces de JDBC y que utilizan los métodos de registro para declarar los localizadores a bases de datos (URL) que pueden manejar. Para utilizar una base de datos en particular, el usuario ejecuta su programa junto con la biblioteca de conexión apropiada al modelo de su base de datos, y accede a través de la conexión, para ello provee el localizador a la base de datos y los parámetros de conexión específicos. A partir de ahí se puede realizar con cualquier tipos de tareas con la base de datos a las que tenga permiso: consulta, actualización, creación, modificación y borrado de tablas, ejecución de procedimientos almacenados en la base de datos, etc.



**Las etiquetas de JSTL se agrupan en 5 bibliotecas**

JSTL Core, JSTL formating, JSLFunction,  JSTL XML y JSTL sql.



## Trabajo con Servlets

Los **JSP** son convertidos en **servlets**, un servlet es una clase que se encarga de recibir una petición HTTP y genera un documento HTML.

Para ser ejecutados es necesario la utilización de un servidor que de soporte a servlets y su contenedor.

Son una buena solución para reemplazar a los CGI, ya que proporciona una forma para generar documentos rápidos y cambiantes que contiene un mejor desempeño al procesar cada petición, tener acceso a las características de Java y todas sus extensiones, y poseer un control simple de parámetros, cookies y sesiones.

Un servlet se puede definir como un conjunto de acciones capturadas desde un cliente y que pueden derivar en una respuesta http o pueden realizar un flujo de trabajo.

Ejemplo gráfico en el que podemos visualizar el funcionamiento de request y response en un servlet. El **cliente**, mediante el **navegador**, hace la **solicitud** al **contenedor web**, que captura dicha solicitud en un **servlet**, mediante un **request.**

![image-20241006163020912](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241006163020912.png)

El servlet puede enviar una respuesta mediante un objeto response, y dicha respuesta puede ser implementada mediante un objeto **PrintWriter** para devolver el código **html** que se generará de nuevo en el cliente, ese flujo html puede ser opcional de escribir o no.

Un servlet no contiene parte gráfica, debe ir en un paquete y es código de Java puro implementando la **herencia** de **clases** y **sobreescritura de métodos**.

Ejemplo típico de hello world:

![image-20241006163520912](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241006163520912.png)

Como podemos comprobar, un servlet es código puro de java, e implementa clases mediante herencia y utiliza sobrescibe métodos.

Como hemos comentado un servlet puede recibir parámetros de un cliente, un ejemplo común son los formularios.

Los formularios con servlets son utilizados para obtener información. Los servlets pueden obtener información del servidor, ya sean datos propios del servidor donde estén trabajando o mediante el envío de información desde un formulario html por parte de la solicitud de una página.

Para obtener la información sobre el servidor en el que el servlet está trabajando, tenemos los siguientes métodos:

- Nombre del servidor: request.getServerName();
- Número de puerto: request.getServerPort();
- Software del servidor: getServletContext().getServerInfo(); (Los servlets tambien puede obtener información general sobre el servidor).
- Obtener la dirección IP del cliente: request.getRemoteAddr();
- Obtener el nombre del cliente Host: request.getRemoteHost();

Una petición puede estar acompañada de un número arbitrario de parámetros. Los parámetros se pueden enviar desde formularios HTML y son una de las bases de la difusión de la información en el servidor.

Sobre un paquete creado en NetBeans; añadimos un nuevo servlet llamado ServletInformaction.![image-20241006171409402](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241006171409402.png)

![image-20241006171505875](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241006171505875.png)

Ahora sobre la carpeta Web Pages, agregamos una nueva página web y la llamaremos datousuario.

![image-20241006171728956](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241006171728956.png)

Sobre la página datousuario.html creamos un formulario que llamará al servlet que recibirá la información.

<img src="C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241006172006505.png" alt="image-20241006172006505" style="zoom:200%;" />

Ahora vamos a implementar el **código del servlet** para que recupere la información de la página mediante request.getParameter(). Escribimos el siguiente código en el servlet:

![image-20241006172152553](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241006172152553.png)

![image-20241006172217436](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241006172217436.png)

Al ejecutar la **aplicación**, veremos que la información es enviada al servidor y que podremos recibirla en nuestro servlet:

![image-20241006172339304](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241006172339304.png)

Al pulsar el botón, veremos que el servlet nos genera un código html de salida con los parámetros recibidos.

![image-20241006172455184](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241006172455184.png)



## Seguridad en JSP.

Los servicios de seguridad de Java proporcionan un mecanismo robusto y fácilmente configurable por autenticación de acceso en diferentes niveles.

- Aplicación
- Transporte
- Contenido de Mensajes.

Un mecanismo de seguridad implementado correctamente en nuestra aplicación web debe proporcionar la siguiente funcionalidad:

- Prevenir accesos no autorizados a componentes y datos de la aplicación.
- Responsabilizar a los usuarios por las operaciones que realicen. (no repudio).
- Facilitar su administración.
- Proporcionar mecanismos transparentes para los usuarios.
- Ser homogéneo a través de aplicaciones.



Existen varios mecanismos de seguridad que permiten realizar estas acciones:

- **Identificación** (identification): Mecanismo que permite el reconocimiento de una entidad (usuario) por un sistema.
- **Autenticación** (authentication): Mecanismo por el cual los usuarios se validan y se comprueba que existen en nuestro ámbito de seguridad.
- **Autorización** (authorization o access control): Mecanismo para asegurar que los usuarios tienen permiso para realizar operaciones o para tener acceso a la información.
- **Integridad de datos** (data integrity): Mecanismo usado para probar que la información no ha sido modificada por usuarios no autorizados.
- **Cofidencialidad** (cofidentiality o data privacy): Mecanismo usado para asegurar que solo usuarios autorizados puedan ver cierta información.
- No repudio (non-repudiation): Mecanismo para impedir que un usuario niegue haber realizado alguna operación.
- **Auditoría** (auditing): Mecanismo para capturar registros de operaciones, a prueba de falsificaciones.



**Tipos de Seguridad:**

Existen dos formas de implementar las políticas de seguridad en nuestra aplicación:

- **Seguridad a nivel de servidor**

  Una de las formas que podemos utilizar es mediante el servidor de aplicaciones. Dentro del servidor , podemos utilizar diversos mecanismos de seguridad configurables:

  ![image-20241008112826097](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241008112826097.png)

- **Seguridad a nivel declarativo**

  La seguridad se monta dentro de la propia aplicación empresarial, utilizando anotaciones o archivos descriptores. Se utilizan una serie de elementos que pueden formar grupos o usuarios individuales, dependiendo del tipo de validación que deseamos utilizar.

  ![image-20241008113717926](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241008113717926.png)



### Seguridad de aplicaciones web en servlets y jsp

A la hora de implementar una política de seguridad en nuestras aplicaciones web, se tienen en cuenta las diversas técnicas de seguridad que se pueden aplicar en los Servlets y páginas JSP. Las técnicas de seguridad más utilizadas son:

![image-20241008114010822](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241008114010822.png)

Tenemos varias formas de crear nuestros roles de seguridad en nuestra aplicación:

- Mediante anotaciones en un Servlet:

  ![image-20241008114231934](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241008114231934.png)

- Mediante el fichero web.xml

  ![image-20241008114204255](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241008114204255.png)

  En el fichero web.xml también podemos especificar la seguridad propia de cada uno de los servlets:

  - Creando las etiquetas < security-role-ref > dentro de la etiqueta del propio < servlet >

    ![image-20241008114413524](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241008114413524.png)

- Para mejorar nuestra política de seguridad podemos realizar mapeos de nombres a grupos, que se escribirían en el descriptor de la aplicación, no en el fichero web.xml.

  ![image-20241008114553298](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241008114553298.png)

Dentro de los servlets, tenemos 3 métodos para implementar sobre la interfaz HttpServletRequest que nos permiten el acceso a la información de seguridad:

- **getRemoteUser**(): Devuleve el usuario que realiza una solicitud de login en nuestra aplicación web.
- **getUserPrincipal**(): Devuelve un objeto que contiene el nombre de usuario autenticado actual.
- **isUserInRole**(String roleName): Devuelve true o false dependiendo si el usuario indicado está en dicho rol.



Ejemplo Práctico 1:

Vamos a crear un Servlet que valida a los usuarios que se han conectado en nuestra aplicación web mediante el uso de roles. Con request.isUserInRole("rol") comprobamos que la petición request ha sido enviada por el usuario del rol indicado.

![image-20241008115319409](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241008115319409.png)



![image-20241008115353795](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241008115353795.png)



## Introducción a enterprise Java Beans

Enterprise Java Beans (EJB) es una plataforma para construir aplicaciones de negocio portables, reutilizables y escalables usando el lenguaje de programación Java.

Desde el punto de vista del desarrollador, un **EJB** es un componente que se ejecuta en un contenedor **EJB**, que no es más que un ambiente especializado (runtime) que provee determinados componentes de servicio.

Los **EJBs** pueden ser vistos como componentes, desde el punto de vista que encapsulan comportamiento y permite reutilizar porciones de código, pero también pueden ser vistos como un framework, ya que, desplegados en un contenedor, proveen servicios para el desarrollo de aplicaciones empresariales, servicios que son invisibles para el programador y no ensucian la lógica de negocio con funcionalidades transversales al modelo de dominio.

En la especificación 3.0, los **EJB** no son más que **POJOs** (clases planas comunes y corrientes de Java) con algunas capacidades especiales implícitas, que se activan en tiempo de ejecución (runtime) cuando son ejecutados en un contenedor de **EJBs**.



### Instalación de Oracle Express Edition

Oracle es una base de datos utilizada muy habitualmente con Java. A continuación vamos a instalar Oracle, y a configurar una base de datos de prueba para trabajar con ella.

1. Bajar el servidor de base de datos desde https://www.oracle.com/database/technologies/xe-downloads.html. Seguramente os pida que os registréis primero para bajar el software, teneis que hacerlo.

2. Descomprimir el fichero descargado e instalar. En la instalación os pedirá el password del administrador de bases de datos.

3. Iniciar la BD. Para ello teneis que ir a programas/Oracle Dabatase 11g Express edition/Start Database

4. IMPORTANTE: hay que cambiar el puerto del servidor web que viene con el servidor de DB. Para ello abrís una consola de Windows/cmd o directamente ir a programas/ejecutar/cmd.

   En la consola escribís sqlplus y ejecutáis. Luego poner:

   login: system 

   password: el que hayamos introducido en la instalación y luego ejecutamos la sentencia

   ```bash
   exec dbms_xdb.sethttpport('7979'); 
   ```

   y trás la ejecución satisfactoria del comando cerrais la consola y reiniciais.

   Es necesario cambiar este puerto ya que el servidor de aplicaciones que viene instalado en netbeans también se lanza en el mismo puerto (8080). Tras reiniciar la máquina hay que volver a iniciar el servidor de BD (ver punto 3).

5. Instalar el cliente de la base de datos, para ello, descargar SQLDeveloper: https://www.oracle.com/database/sqldeveloper/technologies/download/

6. Descomprimir el rar descargado y ya tenéis el programa listo para trabajar, no hace falta instalar.

7. Cuando arranqueis por primera vez SQLDeveloper os va a pedir que le indiquéis un ejecutable de java. Mediante el botón buscar, teneis que escoger el directorio de instalación de la jdk y buscar el ejecutable "java". Por ejemplo yo le indiqué la ruta "C:\Program Files\Java\jdk.1.7.0_25\bin\java" porque tengo instalada la jdk 1.7 en archivos de programas/java, debemos tener en cuenta nuestra versión e indicarla en la ruta.

8. Una vez iniciado el servidor BD y el cliente, creamos una conexión al servidor de la BD. Para ello en SQL Developer vamos a Archivo/Nuevo/Conexion a BD y se abrirá la siguiente ventana.

   ![image-20241009121437346](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241009121437346.png)

   Indicáis un nombre de conexión cualquiera, como login usáis: system, sin espacios y en password, el password de la instalación.

   Si da un error al conectar, ir a servicios en windows e iniciar todos los servicios que sean de Oracle

   ![image-20241009130757133](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241009130757133.png)

9. Crear una base de datos nueva, para ello copiais el siguiente contenido en el editor de consultas SQL Developer y pinchais en ejecutar script.

   ```sqlite
   alter session set "_ORACLE_SCRIPT"=true;
   // crea un usuario DB_TEST, con password DB_TEST
   CREATE USER DB_TEST IDENTIFIED BY DB_TEST; 
   GRANT CREATE session TO DB_TEST;
   GRANT CREATE table TO DB_TEST;
   GRANT CREATE view TO DB_TEST;
   GRANT CREATE PROCEDURE TO DB_TEST;
   GRANT CREATE synonym TO DB_TEST;
   GRANT CREATE UNLIMITED TABLESPACE TO DB_TEST; // me da error lo he cambiado por:
   alter user DB_TEST quota 100M on "USERS";
   grant unlimited tablespace to DB_TEST;
   ```

   Las BD en Oracle están asociadas a usuarios, por tanto al crear un usuario nuevo, hemos creado una BD.

   Nota**: si da error al crear el usuario poner antes del create user:

   ```sql
   alter session set "_ORACLE_SCRIPT"=true;
   ```

   

10. Para acceder a la nueva BD creada cerráis la conexión anterior y abrís una nueva conexión usando como login y password: DB_TEST.

11. Creación de tablas en la BD. Vamos a crear una tabla empleados para el laboratorio 1. Para crear la bd copiamos en el editor de consultas sql de la nueva conexión y ejecutamos el script.

    ```sql
    CREATE TABLE EMP(
    	ID number primary key,
    	NAME varchar2(100),
    	ENAME varchar2(100),
    	JOB varchar2(100),
    	SAL varchar2(100),
    	DEPNO varchar(100)
    );
    
    INSERT INTO EMP (ID,NAME,ENAME,JOB,SAL,DEPNO) VALUES (1,'Antonio','Rodriguez Lopez','arquitecto','50000','arquitectura');
    INSERT INTO EMP (ID,NAME,ENAME,JOB,SAL,DEPNO) VALUES (2,'Jose','Lopez Fernandez','aparejador','40000','arquitectura');
    INSERT INTO EMP (ID,NAME,ENAME,JOB,SAL,DEPNO) VALUES (3,'Miguel','Fernandez Perez','aparejador','40000','arquitectura');
    INSERT INTO EMP (ID,NAME,ENAME,JOB,SAL,DEPNO) VALUES (4,'Rodrigo','Gonzalez Gonzalez','ingeniero','50000','procesos');
    INSERT INTO EMP (ID,NAME,ENAME,JOB,SAL,DEPNO) VALUES (5,'Angel','Gonzalez Rodriguez','ingeniero-técnico','40000','procesos');
    commit;
    
    CREATE TABLE DEP(
    	DEPNO number primary key,
        DNAME varchar2(100),
        LOC varchar2(100)
    );
    
    INSERT INTO DEP (DEPNO,DNAME,LOC) VALUES (10,'arquitectura','granada');
    INSERT INTO DEP (DEPNO,DNAME,LOC) VALUES (20,'procesos','granada');
    INSERT INTO DEP (DEPNO,DNAME,LOC) VALUES (30,'sistemas','sevilla');
    INSERT INTO DEP (DEPNO,DNAME,LOC) VALUES (40,'analisis','malaga');
    commit;
    ```

12. Conexión Java - Oracle usando jdbc. Para poder conectaros desde una aplicación Java a la BD usando JDBC, teneis que descargaros el driver JDBC de Oracle https://www.oracle.com/database/technologies/ y os descargais el jar "ojdb6.jar" que es el driver para la JDK 1.6 y superiores. 

    Para conectaros mediante JDBC hay que usar las sentencias:

    ```sql
    DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
    
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","DB_TEST","DB_TEST");
    ```

    Actualmente existe otra versión https://www.oracle.com/database/technologies/xe-downloads.html

    Este código se puede introducir en Eclipse, por ejemplo
    
    ```java
    import java.sql.Connection;
    import java.sql.DriverManager;
    
    public class DBCreateTable
    {
        public static void main(String args[]) throws Exception
        {
            DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
    
        	Connection conn = DriverManager.getConnection(
        			"jdbc:oracle:thin:@localhost:1521:XE","DB_TEST","DB_TEST");
        }
    }
    ```
    
    

#### LABORATORIO 1: DATOS EMPLEADOS

Vamos a crear una página JSP que contendrá un desplegable con todos los oficios de la tabla empleados. El desplegable lo cargaremos mediante código en la página JSP.

Cuando un usuario seleccione el oficio de un empleado, mostraremos los empleados que tienen dicho oficio.

1. Crear un nuevo proyecto Web Application. Si hemos hecho las prácticas anteriores podemos saltarnos los pasos de creación de proyecto. Nombre: ProyectoJSP.

2. Utilizaremos el servidor Glassfish por defecto.

   ![image-20241009234802900](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241009234802900.png)

3. No implementaremos ningún framwork.

   ![image-20241009234908274](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241009234908274.png)

4. Nos crearemos una página JSP.

   ![image-20241010020138616](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241010020138616.png)

5. Le daremos el nombre empleadosoficios. Lo que debemos hacer ahora es el acceso mediante JDBC a la tabla EMP de Oracle. Para ello, debemos agregar dentro de la carpeta Libraries el conector JDBC para Oracle. 

   Este conector lo podemos descargar desde:https://code.google.com/archive/p/cat200-1-2010/downloads y seleccionar el archivo classes12.jar y descargarlo

    ![image-20241010020954355](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241010020954355.png)

6. Ahora implementaremos el código de la página JSP para mostrar en una lista los oficios y poder recuperar empleados

   ```jsp
   <%@page contentType="text/html" pageEncoding="UTF-8"%>
   <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
               "http://www.w3.org/TR/html4/loose.dtd">
   <%@page import="java.sql.*" %>
   <html>
       <head>
           <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           <title>Empleados por oficio</title>
       </head>
       <body>
           <%try{
               DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
   
               Connection cn = DriverManager.getConnection(
                   "jdbc:oracle:thin:@localhost:1521:XE","DB_TEST","DB_TEST");
               Statement sentencia = cn.createStatement(
                   ResultSet.TYPE_SCROLL_INTENSITIVE,ResulSet.CONCUR_READ_ONLY);
               ResultSet rs = sentencia.executeQuery("SELECT DISTINCT JOB FROM EMP");%>
               <h1>OFICIOS EMPLEADOS</h1>
               <form method='POST' action='empleadosoficios.jsp' name='form1'>
                   <select name='cmboficio'>
                       <% String oficio="";
                       String opcioneshtml="";
                       oficio = request.getParameter("cmboficio");
                       while(rs.next()){
                           String opcion = rs.getString(1);
                           if(opcion!=null && opcion.equals(oficio))
                               opcioneshtml += "<OPTION VALUE='"+opcion+"'SELECTED>"+opcion+"</OPTION>"; 
                           }else{
                               opcioneshtml += "<OPTION VALUE='"+opcion+"'>"+opcion+"</OPTION>";
                           }
                       }%>
                       <%=opcioneshtml%>
                   </select>
                   <INPUT TYPE='SUBMIT' VALUE='Ver Empleados' NAME='btnbuscar'>
               </form>
                   <%
                       String tabla ="";
                       if(oficio!=null){
                       PreparedStatement pst = cn.prepareStatement("SELECT ENAME,JOB,DEPNO FROM EMP WHERE JOB=%?");
                       pst.setString(1,oficio);
                       rs = pst.executeQuery();
                       tabla=<table border='1'>;
                       while(rs.next()){
                           tabla += "<tr><td>"+rs.getString(1)+"</td></tr>";
                           tabla += "<tr><td>"+rs.getString(2)+"</td></tr>";
                           tabla += "<tr><td>"+rs.getString(3)+"</td></tr>";
                           tabla += "</table>";%>
                           <%=tabla%>
                           <%}%>
           <%} catch (Exception ex) {%>
           <h1>Error:<%=ex.toString()%></h1>
           <%}%>
       </body>
   </html>
   ```

   

7. Ya podremos ejecutar nuestro proyecto y comprobar el funcionamiento correcto de la aplicación.

   ![image-20241010105305816](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241010105305816.png)



#### LABORATORIO 2: CUSTOM TSGDEPARTAMENTOS

Vamos a realizar una página JSP que mostrará una tabla con los datos de los departamentos.

Para ello utilizaremos la tecnología **Custom Tags**. La intención de estos taglib es que los desarrolladores implementen clases java y los diseñadores puedan utilizar esas clases java de una forma similar a cómo utilizan el resto de las etiquetas (tags) estándar de html, sin necesidad de conocer los detalles sobre la implementación que hay detrás.

La página JSP solamente contendrá una etiqueta Custom Tag que será la encargada de dibujar la tabla.

1. Crear un proyecto Web Application

2. Creamos un nuevo proyecto Java Web
   ![image-20241010114755571](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241010114755571.png)

3. Le llamaremos ApplicationCustomTags

   <img src="C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241010115159520.png" alt="image-20241010115159520"  />

4. Utilizaremos el Apache Tomcat que trae el IDE NetBeans. No implementaremos ningún framework.

   ![image-20241010115619555](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241010115619555.png)

5. Sobre la carpeta WEB-INF nos crearemos una nueva carpeta que llamaremos EtiquetasDEPT. Para ello, seleccionamos la opción Folder dentro de la categoría Other.

   ![image-20241010120343344](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241010120343344.png)

6. Sobre la carpeta ya creada EtiquetasDEPT en nuestro proyecto, vamos a agregar un objeto Tag Library Descriptor de la carpeta Web. 

   ![image-20241010120710491](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241010120710491.png)

   Lo llamaremos **etiquetadepartamentos**.

   ![image-20241010120755536](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241010120755536.png)

7. Escribiremos el siguiente código dentro del fichero etiquetadepartamentos.tld

   ```xml
   <?xml version="1.0" encoding="UTF-8"?>
   <taglib>
     <tlib-version>1.0</tlib-version>
     <jspversion>2.o</jspversion>
     <shortname>tagdept</shortname>
     <!--<uri>/WEB-INF/tlds/etiquetadepartamentos</uri>-->
     <uri>mietiquetacustomtag</uri>
     <description>Etiquetas de departamentos</description>
     <tag>
         <name>tabladepartamentos</name>
         <tagclass>paquetecustomtags.EtiquetaTablaDept</tagclass>
         <bodycontent>empty</bodycontent>
     </tag>
   </taglib>
   ```

   La ruta del archivo será WEB-INF/tlds/etiquetadepartamentos.

   Este documento contiene la definición de la etiqueta:

   - <taglib> para definir la etiqueta.
   - <tlib-version> nº de versión para nuestra etiqueta. Puede ser el nº que queramos.
   - <jsp-version> versión de jsp.
   - <short-name> es el prefijo que escribiremos en nuestra página jsp para las etiquetas.
   - <uri> nombre de la librería de etiquetas.
   - <description> texto libre para describir el propósito de la librería de etiquetas.

8. Escribiremos un <tag> para cada una de nuestras etiquetas. En nuestro caso sólo hay una, "tabladepartamentos":

   - <name> nombre de la etiqueta
   - <tag-class> nombre de la clase java que se encarga de interpretar estas etiquetas. En nuestro caso paquetecustomtags.EtiquetaTablaDept.
   - <body-content> escribimos empty porque nuestra etiqueta no admite un cuerpo, como sería \<tagdept:tabladepartamentos>aqui un cuerpo\</tagdep:tabladepartamentos>
   - <info> una descripción para esta etiqueta.
   - <attribute> se usa para añadir un atributo al tag, como puede ser  \<tagdept:tabladepartamentos nombre="compras">.En nuestro caso no hay atributos.

9. Acceder mediante JDBC a la tabla EMP de Oracle, debemos agregar dentro de la carpeta Libraries el conector JDBC para Oracle.

   ![image-20241011111436963](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241011111436963.png)

   ![image-20241011111509313](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241011111509313.png)

10. Creamos una clase "**EtiquetaTablaDept**"en un paquete llamado "**paquetecustomtags**" para implementar el código de la etiqueta que acabamos de realizar.

    ![image-20241011111923515](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241011111923515.png)

11. Creamos el contenido de la clase

    ```java
    package paquetecustomtags;
    
    import java.io.IOException;
    import jakarta.servlet.jsp.*;
    import jakarta.servlet.jsp.tagext.TagSupport;
    import java.util.*;
    import java.text.*;
    import java.sql.*;
    
    
    /**
     *
     * @author dell
     */
    public class EtiquetaTablaDept extends TagSupport{
        @Override public int doStartTag() throws JspTagException
        {
            return SKIP_BODY;        
        }
        
        @Override public int doEndTag() throws JspTagException
        {
            try
            {
                JspWriter out = pageContext.getOut();
                DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
                Connection cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","DB_TEST","DB_TEST");
                
                Statement sentencia = cn.createStatement();
                //(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
                ResultSet rs = sentencia.executeQuery("SELECT *FROM DEPT");
                out.write("<h1>Datos de los departamentos</h1>");
                
                String tabla ="<table borde='1'>";
                
                tabla +="<tr><th>Numero</th><th>Nombre</th><th>Localidad</th></tr>";
                
                while(rs.next())
                {
                    tabla += "<tr>";
                    tabla += "<td>"+rs.getString(1)+"</td>";
                    tabla += "<td>"+rs.getString(2)+"</td>";
                    tabla += "<td>"+rs.getString(3)+"</td>";
                    tabla += "</tr>";                
                }
                
                tabla += "</table>";
                out.write(tabla);
            }catch (Exception ex)
            {
                throw new JspTagException("Excepcion al cargar el fichero TLD"+ex.toString());
            }
            return EVAL_PAGE;
        }
    }
    ```

    NOTA: Es muy importante la configuración de la conexión con la base de datos, o de lo contrario nuestro programa será incapaz de encontrar la tabla. Hay que utilizar un usuario que tenga acceso a las tablas. Lo correcto sería utilizar el usuario con el que se creó la base de datos. En mi caso el usuario es DB_TEST;

    

    Acabamos de crear una clase java que hereda de la clase TagSupport de la api de java-jsp. En realidad sería suficiente implementar la interface Tag, pero para no tener que implementar todos los métodos de esta interface, nos limitamos a heredar de la clase TagSupport que pone a nuestra disposición una implementación por defecto de todos. Solo nos queda redefinir los que nos interese.

    Dentro de esta clase, debemos redefinir los métodos:

    ```java
    public int doStartTag() throws JspException
    public int doEndTag() throws JspException
    ```

    que es el método al que llamará el servidor Tomcat cuando encuentre la etiqueta en la página .jsp. En este método debemos escribir en pantalla lo que queremos que sustituya  a esa etiqueta.

    En el método doStartTag() simplemente devolvemos SKIP_BODY, para indicar que no es necesario evaluar el cuerpo entre la etiqueta de inicio y fin. 

    En el método doEndTag(), al que se llamará cuando se evalúe la etiqueta de fin. Obtenemos el Stream de salida getOut(), y escribimos una tabla html con el resultado de consultar la tabla DEPT. Devolvemos EVAL_PAGE para indicar que se puede continuar con el resto de la página.

12. Ahora trabajaremos con el descriptor de la aplicación web. Si el archivo no existe, lo creamos eligiendo el menú contextual desde WEB-INF: New/Other. En el cuadro de diálogo "New File" elegimos Web/Standard Deployment Descriptor (web.xml).

    El contenido del fichero web.xml dentro de la carpeta WEB-INF:

    ```xml
    <?xml version="1.0" encoding="UTF-8"?>
    
    <!DOCTYPE web-app PUBLIC "-//Sun Microsystems, Inc.//DTD Web Application 2.3//EN" "http://java.sun.com/dtd/web-app_2_3.dtd">
    
    <web-app>
        <display-name>Prueba TagLib</display-name>
        <tag-lib>
            <taglib-uri>mietiquetacustomtag</taglib-uri>
            <taglib-location>WEB-INF/EtiquetasDEPT/etiqueta/departamentos.tld</taglib-location>
        </tag-lib>
    </web-app>
    ```

    NOTA: El archivo se encuentra en la ruta WEB-INF/web.xml.

    

    En este archivo describimos nuestra aplicación:

    - <web-app> configura nuestra aplicación.
    - <display-name> nombre de nuestra aplicación para mostrar.
    - <taglib> indica que vamos a usar una librería de tags no estándar.
    - <taglib-uri> nombre que dimos a nuestra librería.
    - <taglib-location> ruta y nombre del fichero .tld.

13. Agregamos una página JSP que dibujará los empleados que tenemos en la etiqueta Custom Tag con el nombre **tabladepartamentos**

    ![image-20241011131324859](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241011131324859.png)

14. Implementamos el código para dibujar los departamentos

    ```jsp
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <!DOCTYPE HTML>
    
    <%@taglib uri="mietiquetacustomtag" prefix="tagdep"%>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title>
        </head>
        <body>
            <tagdept:tabladepartamentos/>        
        </body>
    </html>
    ```

    NOTA: El archivo se encuentra en la ruta WEB-INF/tabladepartamentos.jsp.

    En la primera línea se incluye una etiqueta especial de jsp para indicar que en nuestra página se van a usar las etiquetas que hemos definido en la librería "mietiquetacustomtag". Todas las etiquetas de esta librería empezarán con el prefijo "tagdept".

    Dentro del cuerpo de la página utilizamos nuestra etiqueta. Empiezan por el prefijo "tagdept" que indicamos antes y la etiqueta en concreto que queremos usar dentro de la librería "mietiquetacustomtag" que es "tabladepartamentos". Como ya hemos visto, esta etiqueta muestra el resultado de consultar la tabla DEPT en el navegador.

15. Ya podremos ejecutar el proyecto y comprobar el funcionamiento correcto de la aplicación.

    Después de lanzar el proyecto, con la url http://localhost:8080/ApplicationCustomTag/tabladepartamentos.jsp obtenemos una tabla con el contenido de la tabla, con un resultado parecido a la siguiente pantalla.

    

    ![image-20241013192820106](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241013192820106.png)

    Departamentos con customtags



LABORATORIO 3 CARGAR SELECT DINÁMICAMENTE

Vamos a crear una clase JavaBean que permita poder crear un desplegable a partir de objetos ResultSet.

El objeto ResultSet contiene los datos resultado de una consulta sobre la base de datos.

Dibujaremos un control HTML Select que mantendrá el elemento seleccionado cuando enviemos una petición al servidor.

1. Creamos un nuevo proyecto Web Application, lo llamaremos **ProyectoJSPJavaBeans**.

2. Utilizaremos el servidor GlassFish Server. No agregaremos ningún Framework (Yo voy a utilizar Tomcat)

3. Sobre las librerías vamos a agregar el **conector** para **Oracle**. Recordemos que puede tener otro nombre, como por ejjemple ojdb6.jar

   ![image-20241013195438321](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241013195438321.png)

4. Creamos una clase, la que dibujará los elementos en el Select y los mantendrá seleccionados. La llamaremos **BeanDesplegable** y crearemos un paquete llamada **paquetebeans**.

5. La consulta se realiza sobre la tabla DEPT, creada en un ejemplo anterior de etiquetas custom. El usuario tiene que tener permisos de lectura sobre esa tabla. En nuestro caso la base de datos y el usuario es DB_TEST. 

6. Vemos la base de datos desde Oracle SQL  Developer.

   ![image-20241013200245717](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241013200245717.png)

7. Métodos de la clase:

   1. conectar(): Conexión con la base de datos.
   2. crearResultSet(): Retorna un objeto ResultSet a partir de la consulta sql pasada por parámetro.
   3. cargarCombo(): A partir de los datos de "ResultSet", retorna el código html de un desplegable select, con el nombre dado en "nombreselect", y con el elemento seleccionado especificado por "valorseleccionado".

8. Código completo de la clase:

   ```java
   package paquetebeans;
   
   import java.sql.*;
   
   
   /**
    *
    * @author dell
    */
   public class BeanDesplegable {
       Connection cn = null;
       java.sql.Statement st = null;
       
       final String usuario = "DB_TEST";
       final String password = "DB_TEST";
       final String cadenaconexion = "jdbc:oracle:thin:@localhost:1521:XE";
       
       public BeanDesplegable(){
           
       }
           
       public void conectar() throws SQLException, Exception
       {
           try
           {
               // 1. Cargamos el driver
               DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
               
               // 2. Nos conectamos, passo el nombre de la conexion, usuario y contraseña.
               this.cn = DriverManager.getConnection(cadenaconexion, usuario, password);
           }catch (SQLException e)
           {
               System.out.println(e.toString());
           }
       }
       
       public ResultSet crearResultSet(String consulta) throws Exception
       {
           ResultSet rs = null;
           st = cn.createStatement();
           rs = st.executeQuery(consulta);
           return rs;
       }
       
       public String cargarCombo(ResultSet rs, String nombreselect, String valorseleccionado){
           String combo;
           try
           {
               combo ="<select name="+nombreselect+">";
               while(rs.next())
               {
                   if(rs.getString(1).equals(valorseleccionado))
                   {
                       combo+="<option SELECTED";
                   }else{
                       combo+="<option";
                   }
                   combo+="value='"+rs.getString(1)+"'>";
                   combo+=rs.getString(2);
                   combo+="</option>";
               }
               combo+="</select>";
               return combo;
           }catch (SQLException ex){
               return ex.toString();
           }
       }
   }
   ```

   

9. Fichero index.jsp

   Ahora vamos a utilizar la página index.jsp del proyecto para realizar la llamada al Bean y mostrar los datos de los departamentos.

   Lo interesante de la práctica es que mantendrá el elemento seleccionado después de la llamada.

   ```jsp
   <%@page import="java.sql.ResultSet" %>
   <%@page contentType="text/html" pageEncoding="UTF-8"%>
   <!DOCTYPE html>
   <jsp:useBean id="practica" scope="session" class="paquetebeans.BeanDesplegable"/>
   <html>
       <head>
           <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           <title>Cargar Desplegable</title>
       </head>
       <body>
           <h1>Hello World!</h1>
           <form name="form1" action="index.jsp" method="post">
               Seleccione un departamento:
               <%
                   practica.conectar();
                   ResultSet rs =practica.crearResultSet("SELECT DEPTNO,DNAME FROM DEPT");
                   String combo;
                   String etiqueta="";
                   if (request.getParameter("cmbdept")!=null)
                   {
                       String dept = request.getParameter("cmbdept");
                       combo = practica.cargarCombo(rs, "cmbdept", dept);
                       etiqueta = "<div>Elemento Seleccionado:"+dept+"</div>";
                   }else{
                       combo = practica.cargarCombo(rs, "cmbdept", "");
                   }
               %>
               <%=combo%>
               <input type="submit" value="Enviar formulario">
               <%=etiqueta%>
           </form>>
       </body>
   </html>
   ```

10. Si ejecutamos la aplicación, comprobaremos el funcionamiento de la llamada.

    ![image-20241013205735716](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241013205735716.png)

    Resultado select.

11. Implementamos el código del JavaBean para poder conectarnos, ejecutar consultas y un método para dibujar objetos Select a partir de una consulta con dos datos.



## Introducción al patron MVC

El modelo actual de **páginas web**, define que las peticiones de los clientes son solicitudes a páginas de servidor (jsp, servlets,...) que contienen la lógica de negocio y el diseño **html** en un mismo lugar.

El usuario realiza acciones sobre una página web. Dichas acciones resultan en peticiones http que son redirigidas por un contenedor en el servidor web a **clases Servlet**.

En este tipo de arquitectura conocida, el cliente hace peticiones (**Request**) a objetos de la capa de presentación (Pagina del servidor), que luego llama a su código controlador para pedirle funcionalidad.

En el caso de un diseño de datos **MVC**, la petición se realiza a un objeto de tipo **controller** (controlador) que crea una presentación como respuesta a esa solicitud que ha realizado el cliente.

En los **frameworks MVC**, las URLs se mapean directamente a **clases**, las cuales asumen el rol de "**Controlador**" y son las que procesan las peticiones entrantes, manejando las entradas del usuario, sus interacciones y ejecutando la lógica apropiada para el proceso.

Una clase controladora llama a una vista, la cual genera la salida HTML que se enviará como Response.

Dicho modelo **MVC** permite diseñar en tres capas de negocio y no poner todo el código en las interfaces de usuario del sistema (**IU**).

La idea consiste en tener 3 niveles de funcionalidad bien definidos:

- **Capa de presentación:** Con nuestras interfaces (páginas HTML) y sus controles visuales (controles de formulario) junto con sus eventos.
- **Capa de negocio:** Lógica del dominio. Aquí irá todo el código que define las reglas del negocio (cálculos, validaciones). Surge de los procesos que hemos encontrado en el análisis.
- **Capa de acceso a datos:** El código que permite acceder a las fuentes de datos. Esencialmente trata sobre 4 operaciones básicas, llamadas CRUD ( Create-Retrieve-Update y Delete), que se realizan sobre cualquier fuente de datos (normalmente alguna base de datos relacional). 

En resumen el modelo de arquitectura Model-View-Controller (MVC) se basa en separación de una aplicación en 3 componentes básicos: el modelo, la vista y el controlador.

Muchos desarrolladores están familiarizados con este patrón de arquitectura software. Algunos tipos de aplicaciones web salen beneficiadas con el patrón MVC.

Otras en cambio seguirán utilizando el modelo de J2EE tradicional que está basado en formularios HTML, código del servidor y postbacks. Otros tipos de webs combinarán las dos estrategias.

A menudo, los objetos de la capa de datos se recuperan y almacenan a través de una base de datos relacional. Por ejemplo, tenemos un objeto Product del que se recuperan sus datos de la BD, modificamos las propiedades del objeto y a continuación, el registro en la base de datos es actualizado con los datos modificados.

En las aplicaciones pequeñas, el modelo es a menudo una separación conceptual en lugar de física.

- **Vistas**: Son los componentes que muestra la interfaz de usuario de la aplicación. Normalmente, esta interfaz de usuario se crea a partir de los datos de modelo.
- **Controladores**: Son los componentes que controlan la interacción del usuario, trabajan con el modelo y , por último seleccionan la vista para mostrar la interfaz. En una aplicación MVC, la vista solo muestra información; el controlador administra y responde a los datos introducidos por el usuario y su interacción.

El modelo de MVC ayuda a crear aplicaciones que separan la lógica de entrada, la lógica comercial y lógica de la interfaz de usuario, añadiendo un acoplamiento entre estos elementos.

El modelo especifica dónde se encuentra cada tipo de lógica en la aplicación. La lógica de la interfaz de usuario pertenece a la vista. La lógica comercial pertenece al modelo. La lógica de entrada pertenece al controlador.

Esta separación ayuda a administrar la complejidad al compilar una aplicación, ya que permite centrarse en cada momento en un único aspecto de la implementación. Por ejemplo, podemos centrarnos en la vista sin estar condicionado por la lógica comercial.

El acoplamiento entre los tres componentes principales de una aplicación MVC favorece el desarrollo paralelo. 

En este gráfico podemos visualizar cómo son las característica de un envío de una página web con la lógica tradicional de J2EE utilizando páginas de servidor.

El ciclo de vida de una aplicación MVC es simple. Lo primero de todo es que no realizamos en ningún momento un postback. No existen métodos de acción para el envío de la página tal y como los conocemos, sino que cada acción está delimitada por un controlador, que devolverá la Vista final al usuario.

![image-20241014072120252](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241014072120252.png)

![image-20241014072203422](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241014072203422.png)

El usuario realizará una acción en la Vista, que llamará al controlador con una acción delimitada, y el modelo se encargará de la lógica para poder realizar la acción final.

Si nos fijamos en la lógica MVC, solamente tenemos un manejador que será el encargado de llamar a su controlador correspondiente según la acción del usuario.

Cada página que visualiza el usuario es independiente a la lógica de negocio, y cada una es representada individualmente al realizar acciones sobre ella.

![image-20241014100321173](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241014100321173.png)

Con la lógica MVC, lo que hacemos es representar al usuario acciones para realizar las llamadas. Vamos a ver un ejemplo, tenemos acciones para Details y Orders.

Cuando el usuario hace una petición sobre una de esas acciones, el manejador se encarga de enviar dicha información al servidor, y dependiendo de la acción que envía el usuario, se llama a un controlador que representará la vista correspondiente en Html.

En cambio, si lo hacemos con las páginas JSP, cada página es independiente entre sí y si quisiéramos cambiar o añadir algo, habría que hacerlo página a página, mientras que con MVC habría que hacerlo independiente a cada controlador y vista.

![image-20241014100646947](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241014100646947.png)



## Introducción a PHP

PHP (lenguaje de programación en el lado del servidor). PHP nos permite realizar todas las tareas necesarias. Profundizaremos en la instalación de este y su posterior utilización mediante un extenso temario.

**PHP** es similar a **Java** en ciertos aspectos, ambos tienen características de la programación orientada a objetos, pero en cambio **PHP** es un lenguaje débilmente tipado, esto quiere decir que no tenemos por qué definir el tipo de una variables.

**PHP** también está desarrollado para ser independiente de la arquitectura, a diferencia de **Java** el código fuente no es compilado por el desarrollador, el intérprete de PHP se encarga de generar un bytecode la primera vez que se ejecuta un fichero .php y lo guarda en **memoria compartida** hasta que el fichero sea modificado.

El **código** en PHP es ejecutado por un intérprete, pero es un servidor web el que se encarga de iniciar la ejecución y aportar ciertos datos al entorno en el que se ejecuta el código.

Las aplicaciones desarrolladas en la parte servidora se las conocen como aplicaciones web.

![image-20241014101351737](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241014101351737.png)

Este tipo de aplicaciones pueden ser de diversa naturaleza, como por ejemplo:

- Aplicaciones para acceder a bases de datos.
- Aplicaciones para acceder al sistema de ficheros.
- Aplicaciones que proporcionan diversas páginas web dependiendo del usuario que las solicite.
- Etc.



**Ejemplo de programación del lado del servidor**

Para programar en estas aplicaciones necesitaremos conocer algunas tecnologías como por ejemplo:

- Microsoft ASP (Action Server Pages)
- ASP .NET
- PHP
- ColdFusion
- JSP.



PHP está diseñado para ser integrado con documentos **html** en el lado del servidor. Para que el servidor reconozca que parte de la página es en php, le hace falta un intérprete utilizando unas **etiquetas especiales** para delimitar el código PHP. Estas etiquetas son:

```php
 <?php al inicio del código
 ?> al final
```

Los fichero que utilicen código PHP tienen la estructura de un html pero su extensión debe ser .php.

PHP permite utilizar otros tipos de etiquetas para delimitar el código, pero éstas son las más utilizadas.

### **Variables:**

En php no se tiene que declarar el tipo de las variables.

Para crear una variable, hay que escribir el nombre, antecediéndole el signo $, y asignarle un valor. El nombre tiene que empezar por una letra o una raya _ (subrayado), seguido de cualquier número de letras, números y rayas.

![image-20241014102433358](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241014102433358.png)

En este ejemplo:

1. La variable "variable" va precedido del $ indicando que es una variable.
2. Cada instrucción acaba en ;
3. La orden echo sirve para imprimir una cadena de texto.
4. En la línea 10 hemos utilizado comillas dobles ", aunque también podríamos haber utilizado comillas simples '', la única diferencia es que si utilizamos comillas simples, no podremos acceder al contenido de la variable $variable, y por tanto en vez de aparecer un 5, aparecería como tal $variable.



Al no decidir el tipo de variable, el interprete es el que decido qué tipo de dato va a utilizar, por lo que lo transforma en dicho tipo de dato. A esto se le conoce como **Conversión implícita** y se aplica en cualquier situación, no solo durante las asignaciones.

Cuando el tipo de datos de un valor (ya esté almacenado en una variable o al evaluar una expresión mayor) no concuerde con el tipo de datos de la operación o expresión en que se encuentre, PHP convertirá el tipo de datos de dicho valor para que así sea. Esto proporciona mucha flexibilidad, pero también es una de las características que más errores lógicos pueden introducir en nuestro código PHP.

Podemos convertir una variable a un determinado de forma explícita.



### **Tipos de datos**

El tipo de datos de una variable determina el conjunto de valores que puede tener en ese momento, así como las operaciones en las que puede formar parte.

- Boolean: sirve para establecer valores lógicos (TRUE y FALSE)
- Integer: valores numéricos enteros.
- Float: (anteriormente double) valores numéricos con parte decimal.
- String: cadenas de texto
- Matrices: tipo array
- Objetos: tipo object



Cuando se asigna un valor a una variable, ésta almacena ese valor según su tipo de datos. En ese momento es cuando se establece ese tipo de datos. De ahí que en cada asignación, la variable puede cambiar de tipo de datos.

En ocasiones estas conversiones implícitas de tipo de datos no son suficientes y podemos hacerlas explícitas.

![image-20241014103456676](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241014103456676.png)

Ejemplo:

El valor de la variable es 5.

La suma de las dos variables es 7,5.



Tipo de conversiones implícitas:

- En la línea 9, al asignar el valor 5 a $variable, implícitamente le está asignando el tipo de dato integer.
- En la línea 10, al asignar el valor 2.5, a $variable2, implícitamente le está asignando el tipo de dato float.
- En la línea 12, para concatenar cadenas utilizada el operador "." pero como podemos ver la orden echo que eremos imprimir texto.int+float.texto.

Pues bien, ahí hay dos conversiones implícitas:

1. int + float = la cual toma a int como float y suma los 2 float, dando 7,5 de resultado
2. texto.float.texto = hace una conversión de float a texto, por lo que al final concatenará 3 textos, mostrándolo en pantalla.



Si queremos que el intérprete no realice estas conversones y queremos por ejemplo que el valor de $variable2 sea entero en la expresión de la suma, tenemos que utilizar un **casting.**

El **casting** es una manera de conversión explícita y para utilizarlo hay que poner el tipo de datos al que queremos convertir delante del tipo de dato que queremos convertir.

El valor de la variables es 5.

La suma de las dos variables es 7.

![image-20241014104235100](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241014104235100.png)

Otras expresiones de casting:

- (boolean) o (bool): para convertir a booleano.
- (integer) o (int): para convertir a entero.
- (float) o (double): para convertir a numérico con valor decimal.
- (string): para convertir a cadena de texto.

También podemos cambiar el tipo de una variable a través de la función **settype()**, introducida a partir de php 4:

![image-20241014104532591](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241014104532591.png)

Una variable solo puede cambiar su tipo de datos cuando se le asigna un valor. Sin embargo, esa variable aparece en una expresión distinta a una asignación, su valor puede cambiar de tipo de datos para concordar con el esperado en la expresión.

Estas conversiones implícitas o explícitas de tipo pueden producir que se pierda información, por lo que debemos entender qué ocurre en cada caso:

- **¿Qué ocurre cuando se convierte a booleano?**

  1. El valor boolean FALSE (no se tiene en cuenta la combinación de mayúsculas y minúsculas utilizada).
  2. El integer 0.
  3. El float 0.0.
  4. El valor string vacío y la cadena "0".
  5. Un array con cero elementos.
  6. Un objeto con cero variables miembro.
  7. El tipo especial NULL.

  Cualquier otro valor se considera como TRUE.

- **¿Qué ocurre cuando se convierte a entero?**

  1. El valor boolean FALSE se convierte en 0 y el valor TRUE en 1.
  2. Cuando se convierte un valor numérico con parte decimal, ese valor se redondea hacia cero.
  3. Cuando se convierte una cadena de texto, solo tendrá valor numérico (entero) si el principio de la cadena tiene una representación numérica válida. En otro caso, será 0.

  Por ejemplo, "25Hola" se convertirá en el valor entero 25, pero "Hola25" tendría el valor numérico 0 por que el principio de la cadena no tiene representación numérica válida.

- **¿Qué ocurre cuando se convierte a float?**

  1. Si se trata de una cadena de texto, se aplica la misma regla que en el caso de conversión a entero. La cadena será convertida implícitamente a float si contiene alguno de estos caracteres: e E.
  2. Para valores de otros tipos, la conversión es la misma que si el valor hubiese sido convertido a entero y luego a float.

- **¿Qué ocurre cuando se convierte a cadena de texto?**

  1. Un valor boolean TRUE es convertido a la cadena "1"; el valor FALSE se representa como "" (una cadena vacía).
  2. Un número integer o float es convertido a una cadena que representa el número con sus dígitos (incluyendo la parte del exponente para los números float).
  3. NULL se convierte siempre a una cadena vacía.



El hecho de que PHP realice conversiones de tipo implícitas reduce al mínimo la necesidad de realizar conversiones explícitas o casting.



### **Estructuras de control**

Son sentencias que controlan el flujo del código a partir de ciertas condiciones.

Las sentencias **if/else/elseif** controlan si un bloque de código es ejecutado a partir del resultado de una expresión.

![image-20241014110007619](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241014110007619.png)

Con las sentencias **while/do-while/for** definimos bloques de código que se repiten:

![image-20241014110144647](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241014110144647.png)

En el anterior bloque hemos usado la sentencia **break**, esta se usa para terminar con la ejecución de las estructuras: **for, while, do-while, foreach y switch**. Si tenemos una estructura de control dentro de otra y queremos salir de ambas debemos añadir un número a break indicando cuantos niveles terminamos, por ejemplo para un bucle anidado en otro sería: **break 2**;

Además de terminar un bucle con break, también podemos interrumpir la iteración actual y "saltar" a la siguiente con "**continue**", también podemos indicar cuantas iteraciones saltamos, por ejemplo **continue 2;**



También podemos iterar sobre arrays de manera simple con **foreach**:

![image-20241014110633407](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241014110633407.png)

Podríamos comparar **switch** con una serie de sentencias **if** evaluando la misma variable con distintas opciones en cada una. **Podemos comparar una variable con distintos valores y ejecutar un bloque en consecuencia.**

![image-20241014110850867](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241014110850867.png)

Cada bloque finaliza con **break** ya que switch ejecuta todo el código a partir del **primer case que coincide**, eso incluye el contenido de los siguientes case.



### Constantes

Si en nuestra aplicación encontramos un valor que se repite frecuentemente, es posible que nos interese guardarlo en una constante.

La diferencia entre una variable y una constante es que el valor de esta último no puede cambiar, por lo que se establece únicamente al definir la constante en sí.

El nombre de la constante no incluye el signo $. Los nombres de las constantes suelen aparecer en mayúscular, aunque esto no es obligatorio.

Un nombre válido empieza con una letra o un carácter subrayado, seguido por cualquier número de letras, números o subrayados.

Para definir una constante se utiliza la función define, que necesita el nombre de la constante, el valor que queremos establecer y si tendrá en cuanta la combinación de mayúsculas o no en el nombre de la constante. Por defecto, si que se tiene en cuenta dicha combinación.

```php
define("LABORABLES_SEMANA", 5);
```

Aquí definimos la constante **LABORABLES_SEMANA** con el valor 5. A partir de ahora, siempre que utilicemos el nombre de esta constante, es como si estuviéramos escribiendo el valor numérico 5.

La ventaja de utilizar una constante, es que si se quiere cambiar el valor de ella, sólo hay que modificar la línea en donde la hemos definido. Además, es mucho más legible LABORABLES_SEMANA que simplemente un 5 en un código de muchas líneas.

![image-20241014113434039](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241014113434039.png)

Podrá utilizar las constantes en cualquier expresión donde se necesite un valor de su tipo de datos, que viene establecido según el valor que almacene, como ocurría con las variables. De la misma forma, ese valor puede sufrir conversiones de tipo si es necesario en alguna expresión, pero no en la constante en sí, que no podrá cambiar ni de valor ni de tipo de datos.

PHP incorpora un gran número de constantes predefinidas que podemos utilizar libremente en nuestro código.

![image-20241014113731746](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241014113731746.png)

En esta práctica crearemos una sencilla página php para comprobar algunos de los aspectos básicos de programación en este lenguaje.

Escriba el código php necesario en el interior del cuerpo de la página (entre las etiquetas ,<body> y </body>), que realice las siguientes acciones:

- Crear 5 variables, con los siguientes nombres, y entre paréntesis valores: entero(0), decimal(0.5), cadena (hola), cadena2(0256) y nulo (NULL).

El nombre de las variables sirve para reconocer el tipo de datos que tendrán al recibir el valor indicado entre paréntesis.

Escriba las correspondientes expresiones de asignación para que así sea:

- Escribir 5 líneas donde imprimir la conversión de los valores de esas cinco variables al tipo de datos boolean. Tras cada una de esas líneas, escriba una más para crear un salto de línea en el resultado de la página web con la etiqueta HTML <br>
- Guarde la página como práctica11.php y compruebe el resultado en su navegador. Fíjese en la figura de la página siguiente, donde puede ver dicho resultado.

¿Por qué se imprime una cadena vacía o un 1 en lugar de los valores boolean FALSE y TRUE, respectivamente.

![image-20241014114501391](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241014114501391.png)

La solución :

![image-20241014120148486](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241014120148486.png)



## PHP. Mantenimiento de estado.

Es un servidor web el que se encarga de la comunicación con un cliente y es el servidor el que pasa entre otras cosas los datos de la petición, al programa escrito en PHP. PHP de por si es **stateless**, quiere decir, que **cada petición** la trata como si **no tuviera relación** con otras de manera que cada una es independientes. Pero como estamos desarrollando un servicio web es posible que queramos almacenar datos relativos a peticiones anteriores de un usuario en concreto.

Para tener un servicio stateful (con estado), el programador debe asegurarse que todos los datos relevantes son almacenados y recuperados en las próximas peticiones, por ello muchos servidores web implementan la **gestión de sesiones.**

Las **cookies** son fragmentos de información que el servidor devuelve en las cabeceras HTTP como respuesta a una petición. El navegador guarda dichas cookies y las reenvía junto a próximas peticiones (también en las cabeceras). Esto permite que el navegador pueda almacenar información de estado en el propio navegador y que sea este el que lo guarde. Sin embargo dejar datos que pueden ser privados en un entorno vulnerable puede ser peligroso, por lo que se toman medidas como el cifrado o dejar solo una identificación en la cookie y almacenar la información sensible en el servidor.

En la imagen se muestra una cookie guardada en Chrome gracias a un addon, como se puede ver tiene asociado el dominio de la página para poder usarlo en próximas visitas.



**Sesiones**

¿Qué pasa si en vez de querer almacenar la información en el navegador, quisiéramos almacenarlo en el servidor para que sea él quien pueda diferenciar entre las distintas peticiones que realizamos los usuarios?

Para conseguirlo, el servidor trabaja con el concepto de sesión, facilitando al programador un recipiente o lugar donde almacenar información que esté disponible en toda la visita del usuario al sitio web. Cada sesión tiene una identificación que denominaremos a partir de ahora id. La id de una sesión se guarda en una cookie, de esta forma la recibimos en cada petición y podemos recuperar los datos del usuario. Cuando no se recibe una cookie válida con la id se entiende que es una sesión nueva, se genera una nueva id y se enviará como cookie en la respuesta.

En PHP para acceder a los datos guardados en la sesión hacemos uso de la variable superglobal **$_SESSION**. Es un poco complicado de entender.

Una sesión se inicia cuando un cliente, solicita una página .php albergada en un servidor y finaliza sólamente por dos motivos.

1. El cliente lo solicita explícitamente.
2. Se acaba el tiempo establecido para su sesión.

Por tanto, el hecho de cerrar el navegador no significa, que cerremos la sesión, ya que el servidor no tiene manera de comprobar este hecho.

**¿Qué ocurre en este caso con la sesión que tenía abierta?**

Transcurrido un tiempo, el servidor la cancelará, por lo que es recomendable establecer siempre que usemos sesiones un botón de "desconexión" que nos permita aparte de eliminar la cookie de identificación, cerrar la sesión actual.



**La variable $_SESSION**

Una sesión se puede iniciar (crear o recuperar) manualmente con la funcion **session_start()**, generalmente el intérprete de PHP la inicia automáticamente pero se puede dar el caso de que no esté configurado para ello, por lo que será necesario cambiar el parámetro "session.auto_start" a 1 en el fichero de configuración php.ini.

![image-20241014122027648](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241014122027648.png)

Ejemplo de una página web simple con formulario.

Fíjese en la figura anterior en la que tenemos una página web donde aparece una lista desplegable con una serie de productos y un botón que permite enviar al servidor cúal es el producto elegido.

En el siguiente ejemplo observamos el uso de la variable $_SESSION.

![image-20241014122239853](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241014122239853.png)

![image-20241014122312795](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241014122312795.png)Comentemos el código anterior:

- En la línea 8, tenemos una comprobación de si se ha enviado algún dato a través de una petición POST, si no es así se muestra la página por defecto.

  ```php
  <?php if(!$_POST){?>
  ```

- De la línea 10 a la 17 tenemos un formulario fácil con method= post y action="<?php echo $_SERVER['PHP_SELF'];?>", es decir, que mediante el método post enviaremos la información recogida a la misma página ($_SERVER['PHP_SELF'])

- En la línea 19  tenemos el else para mostrar un contenido distinto tras enviar el formulario.

- En el switch que comprueba que hemos seleccionado del formulario en el apartado "Producto" y por cada caso, añadimos a $_SESSION['Total'] un valor determinado.

- Al final del bloque de PHP hemos añadido un hipervínculo "volver" que nos devuelve a $_SERVER['PHP_SELF'] es decir "atrás".

![image-20241014123453721](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241014123453721.png)

El resultado de enviar un nuevo dato y sumarse a la variable de la sesión.

Tras elegir un producto la primera vez y dar al botón de cesta se mostrara el precio de dicho producto ya que coincide con el total. Tras pulsar volver, seleccionar otro producto y pulsar de nuevo en el botón verá que el valor se ha sumado al total que llevaba.

Si se eliminara la primera línea con **session_start()** es muy posible que ya no guarde ninguna información. Comentamos esto debido a a que php puede iniciar una sesión automáticamente, pero esto depende de un parámetro (session.auto_start) en su fichero de configuración, este fichero se llama php.ini pero su localización depende de la plataforma. Por ello es necesario utilizar dicha función que inicia la sesión manualmente, recordemos que puede ser recuperar una antigua o crear una nueva función de si la cookie con la id existe y es válida.



## PHP. Servicios web

El **servicio Web** es una tecnología que usa un conjunto de protocolos que usados para **intercambiar información** entre distintas **aplicaciones.**

El **servicio Web** aporta **interoperabilidad** entre **aplicaciones** de **programas** o **software** que están independientes con sus **propiedades**, además éstos, fomentan los estándares y protocolos que se basan en el texto. Con ello hacen más fácil **acceder** a su contenido y por tanto a entender su funcionamiento. Permiten que otros servicios de otras compañías ubicadas en distintos lugares del mundo, puedan comunicarse de forma fácil para proveer servicios de manera integrada.



Un **array** es una colección indexada de elementos.

La diferencia de PHP con otros lenguajes es que cada uno de estos elementos pueden ser de un tipo de dato distinto. Por lo que no podemos declarar el tipo de dato "genérico" de un array.



Observe el siguiente código php:

Como puede comprobar se utilizan 6 variables enteras, se indican sus valores y finalmente se escribe en la página la suma de todas ellas.

![image-20241014125223227](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241014125223227.png)

Aunque el código es correcto, podría utilizar un array de 6 elementos en lugar de utilizar las 6 variables independientes. Esto, además de reducir el código, es una forma de indicar que los elementos están relacionados.

Hay distintas formas de crear un array:

- La forma mas sencilla  es hacerlo como si se tratara de una variable más pero incluyendo corchetes tras el nombre. 

  ```php
  $a[0] = 0
  ```

  Creará un array con un único elemento, cuya posición es la 0 ya que los elementos de los arrays empiezan  por este índice.

  ```php
   $a[1] = 1;
   $a[2] = 2;
  ```

  A medida que vamos estableciendo el valor de otros índices del array, estamos creando elementos del mismo.

- ```php
  $A = ARRAY(0,1,2,3,4,5);
  ```

  Con una única línea hemos creado un array de 6 elementos y hemos dado el valor a cada uno de ellos.

```php
$SUMA2 = $A[0] + $A[1] + $A[2] + $A[3] + $A[4] + $A[5];
```

Ahora obtenemos en la variable $suma2 la suma de todos los elementos del array;

Para ello hemos accedido a cada uno de los elementos indicando su índice entre los corchetes. Por tanto $a[0] es el primer elemento del array, $a[1] es el segundo, etc.



**Estructuras de repetición**

Imagine que quiere repetir un número determinado de veces un conjunto de instrucciones o hacerlo mientras o hasta que se cumpla cierta condición.

```php
for (expr1; expr2; expr3){
	instrucciones
}
```

En el primer caso podrá utilizar la estructura de repetición **for**, que representa la siguiente sintaxis:

- expr1: se evalúa al principio del bucle. Normalmente es la asignación de valor inicial a una variable.
- expr2: determina si se tiene que volver a entrar o no en el bucle. 
- expr3: determina como se modifica la variable contador.

Además en cada iteración se ejecuta el conjunto de instrucciones de su cuerpo. 

![image-20241014130357408](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241014130357408.png)

En la línea 8, vemos la declaración del array $a.

En la línea 12-14 vemos nuestra estructura de repetición que va desde $i=0, hasta que $i<=5; y tras cada iteración $i se incrementará en 1.

Es decir, este bucle se ejecutará 5 veces (para $i=0,1,2,3,4);

En la línea 13 observamos que tras cada iteración el valor de $a[$i] se va almacenando en nuestra variable $suma2 (previamente inicializada a 0 en la línea 11), la cual mostramos luego en la línea 16.

![image-20241014130734934](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241014130734934.png)



**while**

```php
while (expr)
{
	instrucciones
}
```

La sintaxis del bucle **while** es:

La línea de instrucciones se ejecutará siempre que expr se evalúe a TRUE.

![image-20241015012850397](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241015012850397.png)

Observemos este ejemplo:

Cuando entra al while, $i tiene el valor 0, por lo que como es menor o igual que 5 entra, se ejecuta $sum+=$a[$i], sale del bucle y vuelve a entrar.

Como $i, todavía tiene el valor 0, vuelve a entrar al while...etc. Es decir, se ejecuta un número infinito de veces ya que la variable $i no cambia nunca de valor, por ello, debemos escribir como última línea la instrucción $i++;

![image-20241015013727899](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241015013727899.png)

Este sería el ejemplo corregido.



Alternativamente existe otra versión de estructura de decisión while, es Do...while, cuya estructura es:

```php
do
{
	instrucciones
} while (expr)
```

Y aunque es similar a while, la diferencia en que en la primera condición no se evaluaba a TRUE, no entraba, sin embargo en do while, la primera vez siempre se ejecuta, y es cuando llega al final cuando evalúa para ver si sigue ejecutando la estructura de repetición.



### Estructuras de decisión

Otro tipo de estructuras de control que se utiliza frecuentemente son las estructuras de decisión.

En este caso, el propósito es ejecutar un conjunto de instrucciones y otro según una determinada condición.

Su estructura es:

```php
if (condicon)
{
	instrucciones
}
```

![image-20241015014421004](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241015014421004.png)

Veamos el siguiente ejemplo:

En el código anterior damos un valor a una variable entera y después comprobamos dicho valor con varias estructuras if.

Así, si el valor de $dia es 1, entonces se ejecuta la instrucción $resultado = "lunes"; si es 2, se ejecuta $resultado = "martes", etc.

Al final, se imprime en la página web la frase "Hoy es ...", concatenando el día que hemos obtenido como resultado tras las estructuras de decisión.

Tal y como está escrito este código, se realizan 7 comprobaciones del valor de la variable $dia.

Para evitar esto, existe una versión alternativa a if-else, denominado if-elseif cuya estructura es:

Por lo que si al evaluar la condición1 es TRUE, dejará de comprobar y se irá al final, si no fuera así, comprobaría con la de abajo y así sucesivamente.

```php
if (condicion)
{
	instrucciones
}
elseif (condicion2)
{
	instrucciones2
}
else
{ 
	instruccionesN
}
```

En el peor de los casos haría lo mismo que el ejemplo anterior con if-else donde se comprobarán todos los casos.

Esto en programas simples puede parecer una tontería pero en programas complejos,... nos podemos permitir que se comprueben todos los casos, por cuestión de eficiencia, tiempo, etc

Aunque anidar varias claúsulas if-else permite reducir el número de comprobaciones que se deben realizar, existe una estructura de decisión más apropiada para estos casos, sobre todo para añadir claridad a su código.

![image-20241015022325845](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241015022325845.png)

Esta estructura es:

Esta instrucción evalúa solo una vez la expresión de comparación y ejecuta el bloque de instrucciones de la primera cláusula case suya listaExpresiones cumpla con ella.

Es importante no olvidar la instrucción break al final del bloque de instrucciones de cada clase. Esto es así porque PHP ejecutará el grupo de instrucciones que aparece a partir de la primera cláusula case que se cumpla hasta encontrar un break.

![image-20241015022638668](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241015022638668.png)

Si $dia vale 1 y no escribimos las instrucciones break, entonces se ejecutaría la asignación de la cláusula case 1 pero también de las demás, asignando a la variable $resultado la cadena de texto "día incorrecto", que es la última.

Con la cláusula default indicamos qué debe ocurrir cuando ninguna de las condiciones anteriores se ha cumplido. No es obligatorio hacerlo.

Además, esta estructura tiene como ventaja respecto a if que las condiciones que se evalúan no tienen por qué ser únicamente TRUE o FALSE, sino que también podrían dar como resultado un valor entero, decimal o incluso una cadena de texto.



### Combinar estructuras

![image-20241015023035174](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241015023035174.png)

Es posible combinar todas estas estructuras:

El objetivo de nuestro código será la búsqueda de un determinado valor en un array de enteros. Si el valor a buscar se encuentra en el array, entonces imprimiremos en pantalla un mensaje indicando esa circunstancia.

En la línea 9, tenemos una declaración de un array de enteros.

En la línea 12-17, tenemos un for, que se ejecutará 9+1 = 10 veces buscando en el array el número, si lo encuentra, pondrá la variable booleana $encontrado a VERDADERO, y saldrá del bucle.

En la línea 18, si $encontrado == TRUE, entrará a la línea 19, mostrando el mensaje "El valor X está en la lista", en otro caso, saltará a la línea 21 con el mensaje "El valor X no está en la lista"



### Arrays asociativos

La diferencia principal entre una variable y un array, es que esta última, puede contener varias variables, que pueden ser de distinto tipo y además, se accede mediante un índice, que aparte de empezar por 0, era numérico.

También podemos acceder a través de cadenas de texto, que nos facilitará a la hora de acceder a dichos arrays.

Se conocen como **arrays asociativos** y mediante un ejemplo, mostramos su estructura.

En el array $monedas añadimos 5 países y a cada uno de estos le "asociamos" un tipo de moneda.

![image-20241015023757870](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241015023757870.png)

Así el primer elemento del array es $monedas["España"] en lugar de $monedas[0].

Utilizamos el operador => para "apuntar" al elemento almacenado.



Haremos un ejemplo en el que en una tabla en HTML almacenaremos los valores de las distintas monedas de los distintos países.

Lo primero será crear una tabla en HTML con esta estructura:

Para ello utilizaremos las etiquetas

```html
<TABLE></TABLE> para crearla
<TH>></TH> para la cabecera (en nuestro caso la primera fila)
<TR></TR> para las filas
<TD></TD> para las columnas
```

Así de este modo para crear dicha tabla podemos utilizar lo siguiente:



**Bucle foreach**

Para acceder a los elementos de un array hemos utilizado siempre índices numéricos, pero ahora en este caso de arrays asociativos no podemos, por lo que debemos utilizar un bucle de repetición especial para estos casos. Se trata de foreach.

```php+HTML
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/Other/html.html to edit this template
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div>TODO write content</div>
        <?php
        $monedas = array("España" => "Euro",
            "Francia" => "Euro",
            "Reino Unido" => "Libra",
            "USA" => "Dolar",
            "Argentina" => "Peso");
        ?>
        <table border="1" width="100%">
            <tr>
                <th>Pais</th>
                <th>Moneda</th>
            </tr>
            
            <?php
            foreach ($monedas as $clave => $valor){
                echo "<tr>";
                    echo "<td>$clave</td>";
                    echo "<td>$valor</td>";
                echo "</tr>";
            }
            ?>
        </table>
    </body>
</html>
```

- De la línea 1 a 7, tenemos el código en PHP donde almacenamos en el array asociativo $monedas, las monedas correspondientes a los distintos paises.
- De la línea 13 a la 16, introduciremos los títulos de la tabla (uno por columna) que son País y Moneda.
- De la línea 18 a 25 tenemos el código en PHP para ir escribiendo en cada uno de estas filas de la tabla.

Hemos utilizado el bucle foreach para recorrer el array $monedas. Después de la palabra as tenemos una variable $clave y otra $valor, dichas variables las creamos para poder en cada iteración ir guardando los resultados. Por tanto, el índice se almacenará en $clave y el valor en $valor.

Luego vamos creando para cada iteración la estructura de filas/columnas e introduciendo el contenido de $clave y $valor.

Obteniendo una tabla como esta:

Lo bueno del bucle **foreach** es que se encarga de acceder a cada elemento del array, sin que nosotros tengamos que preocuparnos de cómo indicar cada uno de sus índices.

![image-20241015030548158](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241015030548158.png)



### Arrays multidimensionales

Una característica muy potente en los arrays es que cada uno de los elementos puede ser un array, y así sucesivamente, por lo que podemos crear estructuras muy complejas (tanto como deseemos).

![image-20241015030722706](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241015030722706.png)

Mediante este array vamos a tener una lista de productos.

En el que podemos observar que $productos es un array que contiene 3 elementos, que son arrays y cada uno de esos arrays también tiene 3 elementos.

Y la manera de acceder a ellos es similar a como lo hacíamos con arrays unidimensionales.

Ej. Si queremos acceder al precio del despertador, lo haríamos de la siguiente manera:

```php
$PRODUCTOS[1][2] 
```

Si quisiéramos acceder al nombre "Reloj de pared" lo haríamos como

```php
$PRODUCTOS[2][1]
```



```php+HTML
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/html.html to edit this template
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div>TODO write content</div>
        <?php
        $productos= array(
            array(1,"Figurita cisne",421.0),
            array(2,"Despertador",79.78,
            array(3,"Reloj de pared",625.5);
        ?>
        <table border="1" width="100%">
            <tr>
                <th>Id del producto</th>
                <th>Nombre</th>
                <th>Precio</th>
            </tr>
            <tr>
                <td><?php echo $productos[0][0];?></td>
                <td><?php echo $productos[0][1];?></td>
                <td><?php echo $productos[0][2];?></td>
            </tr>
            <tr>
                <td><?php echo $productos[1][0];?></td>
                <td><?php echo $productos[1][1];?></td>
                <td><?php echo $productos[1][2];?></td>
            </tr>            
            <tr>
                <td><?php echo $productos[2][0];?></td>
                <td><?php echo $productos[2][1];?></td>
                <td><?php echo $productos[2][2];?></td>
            </tr>
        </table>
    </body>
</html>
```

![image-20241015032113985](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241015032113985.png)

También podremos utilizar arrays asociativos incluso al crear un array de más de una dimensión. El funcionamiento será exactamente el mismo que ya hemos visto.

Tenemos que saber que en la posición 0 de cada elemento tenemos el identificador del producto, en la 1 su nombre y en la posición 2 su precio. ¿No sería mejor expresarlo justamente con esas palabras?

![image-20241015032421555](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241015032421555.png)

Array múltiple asociativo.

Ahora para acceder al tercer elemento de $productos, lo haríamos de la siguiente manera:

```php
$PRODUCTOS[2]["IDENTIFICADOR"]
$productos[2]["Nombre"]
$productos[2]["Precio"]
```

Por lo tanto, ahora es mucho más fácil hacer referencia al identificador, nombre o precio del primer producto de nuestra lista.

Los arrays son muy utilizados en las páginas ohp, por lo que el lenguaje proporciona mucha funcionalidad para trabajar con estas estructuras de datos.



#### Práctica 1

Se divide en dos partes. En la primera trabajará con arrays y tendrá que demostrar que conoce la sintaxis para acceder a sus elementos. En la segunda parte transformará una estructura de repetición dada en otra equivalente.

**Primera Parte**

Cree una nueva página en el editor que esté utilizando.

Escriba el código necesario en el cuerpo de la página web para que se creen dos arrays:

En el primero se almacenan los 10 primeros números naturales (empezando por el 0).

En el segundo se almacenará el valor del factorial del número incluido en la misma posición del primer array.

Por ejemplo, si tenemos que en la posición 3 del primer array se guarda el valor 3, entonces en la posición 3 del segundo array estará el valor correspondiente al factorial de 3, que es 6.

El factorial de un número entero se define: 

```
factorial(0) = 1;
factorial(1)=1
factorial(n)=1\*2\*3\*...\*(n-1)*n
```

Por ejemplo: factorial(5) = 1\*2\*3\*4\*5

Deberá escribir el código necesario para realizar este cálculo y almacenarlo en el segundo array.

A continuación imprima el contenido del segundo array. Una línea en la página web por cada uno de los valores.

Guarde la página como práctica12a.php y pruébela en su navegador web.



**Segunda Parte**

Transforme la estructura de repetición del siguiente fragmento de código en una equivalente, pero utilizando la condición de salida al final del bucle.

Es decir utilizando la estructura Do-While en vez de While.

En este código aparece el operador &&, que es el AND de PHP

![image-20241015034743915](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241015034743915.png)

Es decir, que en la condición donde se utiliza, se tiene que cumplir ambos criterios para que la expresión se evalúe a TRUE.

El operador OR equivalente es ||.

Guarde la página como practica12a2.php y pruébela en su navegador web.



**Solución de la práctica**

Esta es una de las varias soluciones posibles que puede haber.

![image-20241015035127368](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241015035127368.png)

Y el resultado al ejecutarlo en nuestro navegador, debe tener este aspecto.

![image-20241015094904719](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241015094904719.png)

![image-20241015095005646](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241015095005646.png)



**Practica12a2.php**

En el enunciado de la práctica, la condición de salida del bucle while se comprueba al principio, por lo que para escribir un bucle equivalente en que se compruebe al final, tenemos que comprobar dicha condición para la primera ocasión. Esto se consigue con una estructura if-else



#### Práctica 2

En esta práctica se diseñará un ejemplo con un array multidimensional y asociativo.

Al principio de la página, y antes de cualquier otra etiqueta, escriba el código php necesario para representar mediante un array lo que se conoce como el juego de "La Quiniela".

Se trata de una apuesta deportiva donde se tiene que elegir el resultado de 15 partidos de fútbol. Cada uno de esos resultados puede tener tres posibles valores: 1,X,2 donde:

1: si gana el equipo local,

X: si el partido finaliza con empate,

2: si gana el equipo visitante

Cada elemento del array debe permitir guardar los tres posibles valores, ya que el usuario puede elegir un resultado (apuesta sencilla), dos (apuesta doble) o los tres (apuesta triple).

![image-20241015095900429](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241015095900429.png)

Seguidamente, rellene el array con la siguientes apuestas:

Donde Partido1,...Pleno 15 serán los índices del array.

Ahora escriba el código php necesario en el cuerpo de la página; esto es, entre las etiquetas <body> y </body>, para obtener el siguiente aspecto.

Guarde la página con el nombre practica12b.php y compruebe el resultado en su navegador.

Una posible solución sería:

![image-20241015100502792](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241015100502792.png)

La apuesta del participante queda aquí reflejada como un array asociativo de 15 elementos, los cuales, a su vez, son arrays de tres elementos booleanos, representando los posibles resultado de cada uno de los partidos. Por tanto es un array multidimensional.

Así pues, si el primer partido es array(TRUE, TRUE, FALSE), tendremos que la apuesta es 1X, ya que tiene el valor verdadero en los dos primeros elementos.

Una vez elegida esta representación de la apuesta, podemos utilizar un bucle foreach para recorrer todo el array asociativo y comprobar el resultado de cada uno de los partidos. Fíjese cómo se accede al valor de cada una de las claves del array asociativo, que es otro array de elementos booleanos.



## PHP. Herramientas adicionales

### Funciones

Cuando un proyecto tiene cierta magnitud, se hace muy difícil poder desarrollarlo sin dividirlo en trozos más pequeños. Las funciones (junto a las clases) son la herramienta que proporciona PHP para dividir la aplicación en unidades más pequeñas y fáciles de manejar.

Desde el punto de vista de la programación, una **función** no es más que un **bloque** de **código** bien delimitado al que le damos un nombre y que realiza alguna tarea bien definida. Cuando en nuestro programa necesitamos llevar a cabo esa tarea, llamamos a la función.

Ejemplo: Se trata de un típico formulario que permite calcular los gastos de envío de los productos que elije el usuario. El nombre de la página es funciones.php

![image-20241015101245605](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241015101245605.png)

Así, indica a qué categoría pertenece el producto comprado y cuántas unidades serán enviadas. A partir de estos datos, se calcula el importe total en cuanto a gastos de envío.

En los formularios en action indicamos que página o archivo es el encargado de procesar esa información.

En este caso la información suministrada será procesada por otra página llamada calculargastos.php

Por tanto: Necesitamos "recoger la información" del usuario y más tarde "Procesarla".



#### Crear funciones

Como vimos en el tema de **Javascript**, tras la palabra **function** escribiremos el nombre de la función y unos paréntesis. En el interior de esos paréntesis podemos escribir parámetros.

```php
function nombrefuncion (){}
function nombrefuncion2 (arg1,arg2...) {}
```

Los parámetros sirven para comunicar la función y el código que la utiliza. Por ejemplo, en nuestro caso, la función debe saber a qué categoría pertenece el producto comprado y cuántas unidades se tienen que enviar. Pues bien, eso se lo comunicaremos mediante parámetros.

Observemos este ejemplo:

Donde podemos ver como el nombre de la función no lleva el símbolo del dólar, pero en cambio el de los argumentos sí, porque dentro de la función actuarán como variables.

![image-20241015102028100](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241015102028100.png)

Además, la función debe devolver el cálculo efectuado. Esto se consigue con la palabra **return**.

```php
return ($recargo+($unidades*2.25));
```

Con la palabra return, la función devolverá la suma del recargo aplicado más 2.25 unidades monetarias por cada unidad comprada del producto.

La palabra return hace que la función finalice inmediatamente devolviendo el control a la siguiente línea del código donde se ha utilizado. En este caso es la última línea de la función, pero si no fuese así, el resto no llegaría a ejecutarse.

Vemos, por lo tanto, que la función gastos realiza una tarea bien definida, devolviendo el valor buscado y nada más.

Si embargo, definir una función no hace que su código se ejecute. Para eso, es necesario llamarla.

#### Llamar a una función

Para utilizar una función no basta solo con crearla sino que en algún momento del código deberemos llamarla. Esto se conoce como "llamar a una función".

Para ello tendremos que escribir su nombre y entre paréntesis escribir la lista de parámetros que le hacen falta a la función.

También en el caso en el que la función devolverá algún valor (mediante return) necesitaremos guardar ese valor.

Por tanto, si en este ejemplo solo quisiéramos imprimir el valor que devuelve la función podríamos hacerlo como sigue:

```php
echo gastos($arg_categoria, $arg_unidades);
```

Por ejemplo, necesitamos pasar la categoría y el número de unidades compradas. Utilizaremos dos variables como argumentos y después veremos de dónde sacamos sus valores:

Es importante el orden en que se escriben los argumentos, ya que serán emparejados según ese orden con sus correspondientes parámetros en la función.

![image-20241015102922382](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241015102922382.png)

Es decir, que el valor de la variable **$arg_categoria** será el que recoja el parámetro **$categoria**  de la función y **$arg_unidades** dará valor al parámetro $unidades.

Con esto estaremos llamando a nuestra función para calcular e imprimir el importe de los gastos de envío.

Solo nos falta saber qué valor tendrán estos argumentos. Como se ha indicado, vendrán dados por lo que introduzca el usuario en el formulario que vimos al principio de la lección.

Las ventajas de utilizar funciones son muchas. Imagínese que necesita calcular los gastos de envío en otro lugar de su sitio web.

```php
$arg_categoria = $_POST["Categorias"];
$arg_unidades = $_POST["Bultos"];
```

Será muy simple hacerlo simplemente llamando a la función. Si después decide cambiar el recargo por modalidad o por las unidades enviadas, solo tendrá que hacerlo en la definición de la función y todos los cálculos se actualizarán automáticamente.

#### Paso de parámetros

 Los parámetros permiten comunicar el código que llama a la función con la propia función, pero, ¿Qué pasa si no nos es suficiente con que esa función nos devuelva un único valor mediante la palabra return?

Los parámetros pueden servir para ello y al terminar la función almacenar valores que deseemos.

![image-20241015103622928](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241015103622928.png)

Veamos el mismo ejemplo de antes, pero con un parámetro adicional (que guardará el valor del return).

Estas funciones en el mundo de la programación se llaman funciones **void** y son las únicas que no devuelven ningún valor.

Por tanto, habrá que llamarla y almacenar el valor que deseemos en alguna variable (en nuestro caso $importe).

```php
gastos ($arg_categoria, $arg_unidades, $arg_importe);
echo $arg_importe;
```

Ahora tendremos también que modificar la llamada a la función incluyendo el nuevo argumento.

Con todo esto que sabemos, podemos ejecutar el ejemplo de este modo y ver el resultado:

![image-20241015104035000](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241015104035000.png)

Código llamada a función.

![image-20241015104145167](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241015104145167.png)

Pantalla de resultados vacía. Y el resultado es:

**¿Qué ha pasado?**

Pues bien, este es un error muy común que pasaremos a explicar.

El problema es antes de terminar la función, el resultado se "mete" dentro de la variable $importe, pero cuando la función termina, al ser la variable local, esta pierde su valor, por lo que luego al imprimirla no tendrá nada.

**¿Por qué pasa esto?**

Cuando llamamos a una función, la lista de parámetros a introducir se "**pasan**" por valor, es decir, se hace una copia de lo que le pasas, internamente la función hace sus cálculos y al finalizar destruye el contenido de esas "copias", es decir, solo las necesita para hacer cálculos.

Por tanto, si lo que queremos es que aparte de hacer cálculos, guarde información y luego podamos acceder a ella, hay que "**pasar los parámetros por referencia**".

De este modo, todo parámetro pasado por referencia, podrá ser modificado por la función ya que no lo destruirá, y más tarde podremos acceder a él.

Para pasar un parámetro por referencia hay que anteponerle "**&**" al argumento de este modo:

```php
function gastos($categorias, $unidades, &$importe) {}
```

Función parámetros por referencia.

![image-20241015104855519](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241015104855519.png)

Ahora al ejecutar el código en el navegador obtenemos el resultado esperado.

Es verdad que en esta ocasión era más apropiado utilizar la palabra return para que el cálculo lo devolviera la función y no utilizar un parámetro más, pero ahora ya se sabe que puede utilizar parámetros que se puedan modificar pasándolos por referencia.

Finalmente, si necesita devolver más de un valor tras ejecutar la función, puede hacerlo devolviendo un array, ya sea mediante la palabra return o con un parámetro mas de la función.

Cuando se realiza una llamada a una función, tiene que proporcionar el mismo número de argumentos y en el mismo orden en que aparecen en su definición.

Sin embargo, **PHP** permite crear parámetros opcionales o para los que se indica un valor por defecto.

La idea es que si no especificamos el valor de dicho parámetro en la llamada a la función, entonces tomará el valor que tenga por defecto, por lo que la llamada seguirá siendo válida.

Para crear un **parámetro opcional**, debemos escribir su nombre y seguidamente un igual más el valor que tomará por defecto. Además, los parámetros de este tipo tienen que aparecer después de todos los parámetros de la función que no sean opcionales:

El valor por defecto tiene que ser una **expresión constante** y no **una variable o llamada a una función.**

```php
function gastos($categoria, $unidades, &$importe, $urgente = FALSE );
```

Hemos añadido un servicio urgente o rápido de envío de los productos y queremos que se tenga en cuenta a la hora de calcular el importe total.

Por defecto, asignamos el valor FALSE a dicho parámetro, por lo que si no se indica en la llamada, se utilizará ese valor.

Con el nuevo parámetro representamos que se añadirán 50 unidades monetarias al total de los gastos de envío si el usuario ha elegido el envío urgente.

![image-20241015105845409](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241015105845409.png)

Tal como tenemos, la llamada a la función gastos, el código seguiría funcionando perfectamente, ya que no utilizamos ningún argumento para este último parámetro, pero como es opcional no pasa nada.

Esto tiene muchas utilidades, ya que no necesitaríamos modificar el código donde ya ha sido utilizada la función gastos si no queremos representar este último detalle del envío. 

Sin embargo, si queremos hacerlo,...

Con esto indicamos que sí que se tiene que aplicar el recargo por envío urgente. Lógicamente esto debería venir establecido de alguna forma por el usuario en el formulario inicial.

```php
gastos ($arg_categiria, $arg_unidades, &$ar_importe, TRUE);
```

Llamada función múltiples parámetros.



Establecer un valor por defecto para un parámetro evita la obligación de tener que proporcionarlo en la llamada a la función, pero nada más. Se podrá dar el valor adecuado (incluso coincidiendo con el establecido por defecto) siempre que quiera y ése será el valor que realmente se utilice en el interior de la función.



#### Práctica

Crear y utilizar una función para ordenar un array de números enteros.

Antes de cualquier cosa, escriba el código php necesario para crear una función que ordene un array dado mediante el "método de la burbuja".

El **método burbuja** consiste en recorrer el array y, en cada pasada comparar e intercambiar (si procede) elementos del array.

De esta forma, si consideramos los elementos del array como burbujas con pesos acordes a su valor y si imaginamos el array en posición vertical y lo recorremos de abajo arriba, conseguiremos que en cada pasada ascienda uno de los elementos o burbujas a la posición que le corresponde en el array ordenado. Esto lo podemos ver mejor en la figura siguiente, donde aparece resaltado en cada pasada qué pares de elementos se están comparando.

![image-20241015110826145](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241015110826145.png)

Una ayuda: puede conocer el número de elementos que tiene un array usando la función **count.**

Por ejemplo, si tenemos el array $a, la expresión count ($a) nos devolverá el número de elementos de dicho array.

Guarde la página como practica13.php y compruebe el resultado en su navegador.

Solución de la práctica: una posible solución

![image-20241015111118793](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241015111118793.png)

La función Burbuja recibe como parámetro el array a ordenar. Fíjese que el paso de ese parámetro es por referencia (como se indica al anteceder el símbolo &) por que tiene que poder modificarse ordenándolo.

El bucle anterior de la función Burbuja recorre los elementos del array, situando cada vez un elemento o burbuja en la posición adecuada del array ordenado. Para ello, realiza el intercambio entre la posición actual y la anterior si es adecuado.

El bucle exterior hace que esto se repita las veces necesarias.

Fíjese cómo se crea el argumento que necesita la función, cómo se realiza su llamada, y cómo no hace falta guardar el resultado de dicha llamada, ya que el resultado deseado lo encontraremos en el mismo array que ha servido de argumento.

Se utiliza la función count para obtener el tamaño o elementos del array. Fíjese en que el número de elementos sería 5 en nuestro ejemplo, aunque fueran desde el índice 0 al 4.

PHP también proporciona funciones incorporadas en el lenguaje para ordenar arrays. Busque información sobre las funciones en el manual de PHP:

- asort:
- arsot:
- ksort:
- rsort:
- sort:
- uasort:
- usort:
- uksort:



#### Cookies

Anteriormente hemos hablado sobre mantener el estado de una sesión y su relación con las cookies.

Una **cookie** es información que mantenemos durante toda la visita del **usuario** a un **sitio web**, y que puede referirse a elecciones , preferencias, etc. que ha ido efectuando, liberando al servidor de mantener estos datos.

Una característica propia de las cookies es que esta información se almacena en el ordenador cliente, es decir, es responsabilidad del navegador.

Sin embargo, aunque esto es una ventaja, también se corre el riesgo de que el usuario modifique dicha información o incluso que la elimine. Por ello, un sitio dirigido al comercio electrónico tiene que estar preparado para esta circunstancia.

#### Crear cookies

Aunque es responsabilidad del navegador mantener la información de una cookie, es el servidor quien debe de crearla para cada petición de página web que use cookies.

Cuando se inicia por primera vez una **sesión**, el servidor envía una cookie al navegador del usuario y cada vez que el navegador del usuario, solicite una página de ese servidor, se volverá a enviar la cookie al servidor, el cual puede leer la cookie e identificar el navegador del usuario.

En realidad, una cookie no está relacionada con una página web en concreto sino con un determinado dominio, de esta manera, si usted entra en www.marca.com/ultimas-noticias seguramente en su equipo tendrá una cookie relacionada con marca.com.

¿Cómo creamos y accedemos a una cookie?

Para acceder usaremos la variable superglobal $_COOKIE y para modificarlo o crearlo usaremos la función:

```php
setcookie("un nombre","un valor");
```

Algo importante y que suele dar **problemas**, es que una cookie debe de crearse siempre antes de cualquier código HTML, es decir, al principio de nuestra página, de esta manera:

![image-20241015124841995](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241015124841995.png)

Lo primero que hace es comprobar si la cookie de nombre "veces" tiene algún valor, es decir, si es la primera vez que entramos a la página web. En dicho caso, usaremos setcookie para crearla, especificándole un nombre ("veces") y un valor (1).

Si no es así lo que hacemos es acceder al cookie $_COOKIE "veces" y añadirle 1 a su valor (sumándole 1) también mediante la función setcookie.

Fíjese que para acceder usamos $_COOKIE y para modificarlo (aunque tengamos que acceder a él) utilizamos setcookie. Es un error común hacer: $\_COOKIE + 1.

En ocasiones es interesante crear cookies con subvalores. Esto es así porque solo disponemos de 4KB para el total de la información almacenada mediante cookies, ya que éste es el tamaño que permite la mayoría de los navegadores.

Por ello, podemos reducir la información enviada al **servidor** creando cookies como **arrays:**

La cookie Momento tiene dos subvalores: el valor **Fecha** y el **valor Hora**.

```php
$Fecha_anterior = $_COOKIE[Momento][Fecha];
$Hora_anterior = $_COOKIE[Momento][Hora];
$fecha = getdate(time());
$dia = $fecha["mday"]."/".$fecha["mon"]."/".$fecha["year"];
$hora = $fecha["hours"].":".$fecha["minutes"].":".$fecha["seconds"];
setcookie("Momento[Fecha]",$dia);
setcookie("Momento[Hora]",$hora);
```

La misma sintaxis se utiliza para crear la cookie con subvalores.

Así hemos modificado (o creado, si es la primera vez) la cookie Momento, estableciendo sus subvalores Fecha y Hora a la fecha y hora del servidor.

Para ello, se han utilizado las funciones getdate y time.

![image-20241015125837839](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241015125837839.png)

**Caducidad de las cookies**

La característica más importante de una cookie es su caducidad. Al crearla podemos establecer un valor entero que indique cuánto durará.

Si no se indica ese valor en la función setcookie, la cookie se mantiene "viva" solo en la memoria del navegador por lo que desaparece al cerrarlo.

Veamos como hacerlo:

Aquí utilizamos la función **isset** para saber si la variable $Fecha_anterior tiene valor (es lo contrario que la función empty), y, en ese caso, se imprime en pantalla la fecha y hora de la última visita del usuario, además del número de veces que la ha visitado.

```php+HTML
<?php
	if (isset($Fecha_anterior)){
        echo "Usted visitó esta página por última vez el <B>$Fecha_anterior</B> a las <B>$Hora_anterior</B>";
        echo "<BR>Ha visitado esta página un total de:<B>"$_COOKIE["Veces"]."</B> veces.";
    } else {
    	echo "Bienvenido a nuestra página web.";
    }
?>
```

Tal y como pone en el ejemplo, cuando entremos por primera vez en la página web, obtendremos el mensaje de bienvenida, la segunda vez, la fecha y hora del último acceso, la tercera, etc.

Cuando entre verá que le muestra un mensaje de bienvenida. Ahora si actualizamos la página (botón actualizar de nuestro navegador), vemos como cada vez que actualicemos nos muestra correctamente la información de la fecha y el número de veces que hemos accedido.

Pero.. Intenta cerrar el navegador y volver a ejecutarlo.

¿Por qué me muestra otra vez el mensaje de bienvenida cuando no es la primera vez que hemos accedido?

En cuanto cerramos la **sesión** (cerramos el navegador), las cookies sin caducidad pierden su valor y se vuelven a iniciar/inicializar de nuevo.

Pues para esto hace falta la caducidad.

Para establecer la caducidad de una cookie, debemos indicar la marca de tiempo correspondiente a esa fecha. Esto lo haremos con un parámetro más de la función 

```php
setcookie("Veces",1, time()+(3600\*24\*7))
```

![image-20241015131449256](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241015131449256.png)

Con esta expresión indicamos que la cookie tiene un periodo de vigencia de 7 días, ya que:

- time() devuelve el momento o marca horaria actual.
- (3600\*24\*7) representa los segundos que hay en 7 días.



Al establecer la caducidad de las cookies, éstas se almacenarán como un archivo de texto en el ordenador del usuario y de allí se obtendrán mientras no hayan caducado.

A continuación se proporciona el código completo del archivo cookies.php

![image-20241015234617511](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241015234617511.png)

Un problema importante de las cookies es la dependencia del navegador.

Así, las cookies que se almacenan en memoria solo están disponibles para la instancia del navegador en la que se han creado. En el caso de las cookies guardadas en disco duro, todas las instancias del navegador pueden acceder a ellas.

Como existe la posibilidad de que las cookies se almacenen en el disco duro del usuario, el navegador permite que sea el usuario quien decida si esto es posible o no.

Por tanto, entre en su navegador e investigue en la sección de cookies para ver la política de privacidad. Cada navegador asigna una por defecto.

**Características de las cookies:**

- Las cookies incrementan el tráfico en la red, ya que en cada petición HTTP que realiza el navegador, se incluyen las cookies que coinciden con el dominio al que se accede. Esto supone un incremento en el tamaño de los paquetes.
- Las cookies incrementan el tiempo de respuesta del servidor, ya que el servidor tiene que recoger la información de cookies y rellenar el array $_COOKIE.
- Las cookies son dependientes del equipo en el que se crean: tenga en cuenta que un usuario podría utilizar distintos ordenadores, mientras que las cookies almacenadas en disco duro estarían siempre en el equipo donde se han creado. En definitiva, las cookies permiten que el servidor identifique un navegador, pero no directamente a un determinado usuario.
- Las cookies pueden sufrir alteraciones: al estar almacenadas en el equipo del usuario, éste es libre de modificarlas. Es por ello que algunos servidores las cifran, con cualquier modificación del contenido cifrado este se vuelve inválido para el servidor.
- Las cookies son seguras, ya que el navegador solo las envía al servidor del sitio web que las ha creado, por lo que no pueden ser recibidas en ningún otro sitio.
- Podemos aplicar características de seguridad al enviar y recibir cookies. Para ello, se utiliza el protocolo SSL junto a HTTP (HTTPS), que encripta el contenido de las peticiones y respuestas, evitando su obtención por terceros (ej: el ataque "Man in the Middle").



## Configuración del servidor Resin

**Resin** es un **servidor** de **aplicaciones** web desarrollado por Caucho que se caracteriza por una **compilación automática**, por ser ligero y robusto. Empezó como un **motor** de **Servlets** y **JSP** en 1998, desde entonces ha evolucionado hasta soportar la versión Java EE 6.

![image-20241016000046512](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241016000046512.png)

Dispone de una versión libre bajo la licencia **GPLv3** y una versión Pro que incluye optimizaciones como reconstrucción de proyectos con una administración avanzada, replicación de sesiones HTTP, monitorización Java y replicación de colas JMS.

### Instalación de Resin

La instalación es simple, tras descargar el fichero comprimido, se descomprime en el directorio que deseemos. Tras eso podemos ejecutar setup.exe para configurar un nuevo servicio de Windows para ejecutar el servidor automáticamente. Es importante que el primer parámetro contenga el directorio del kit de desarrollo de Java (JDK), ya que necesita Java para la compilación.

![image-20241016000450272](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241016000450272.png)

Podemos ver el servicio en el gestor de servicios de Windows.

También podemos ejecutar Resin mediante resin.exe

![image-20241016000557654](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241016000557654.png)

![image-20241016000707176](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241016000707176.png)

Se puede dar el caso de que Resin informe sobre que no encuentra el programa javac y haga referencia a la variable de entorno JAVA_HOME, debe asegurarse de que dicha variable existe y contiene el directorio de su instalación del JDK:

#### Configuración del Resin

Veremos algunos ejemplos sobre la configuración de Resin, como que su configuración se basa en ficheros XML.

La configuración de Resin se compone principalmente de dos ficheros en el directorio conf (windows):

- **resin.properties:** parámetros de uso común en la configuración.
- **resin-xml** fichero de configuración, importa los parámetros de resin.properties.



El siguiente ejemplo muestra una configuración mínima para un cluster de dos servidores. Estos servidores no escuchan en un puerto HTTP, por ejemplo pueden ser en segundo plano con un balanceador de carga:

```xml
xmlns="http://caucho.con/resin"
id="a" address="a92.168.1.10"> port='6800'/>
id="b" address="a92.168.1.11"> port='6800'/>
```



Ejemplo de configuración HTTP básica:

![image-20241016001728074](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241016001728074.png)

La mayoría de sitios establecen una configuración común para los servidores en cluster, esta se define con. Es debido a que la mayoría de veces sus parámetros son los mismos, por ejemplo puertos, timeouts y configuración de hebras (threads).

**Conexiones cifradas SSL**

Podemos usar OpenSSL o JSSE para soportar puertos SSL, sin embargo la opción mas recomendada es OpenSSL al ser más rápido. La configuración se establece dentro de la etiqueta.

**Parámetros de la JVM**

Los parámetros para lanzar la JVM son configurados en la etiqueta. Generalmente la mayoría de servidores de un cluster comparten la misma configuración por lo que también es posible añadirlo a .

Ejemplo extraído de resin.xml, se puede observar el uso de **parámetros** de **resin.properties.**

![image-20241016013016629](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241016013016629.png)

Como se puede observar en la etiqueta que la aplicación web está en la carpeta webapps. Con la etiqueta hemos establecido el directorio para la raíz de la aplicación.

En la última parte observamos que evaluamos el parámetro resin_doc y si es true se habilita con documentación y cuya URL es /resin-doc y apunta a doc/resin-doc.



## Configuración del servidor. Instalación de Java Bridge.

**PHP/JAVA Bridge** es un protocolo de red que permite conectar bidireccionalmente scripts en **PHP** con clases **Java, EJB, VB.NET** etc. En su página se anuncia como más rápido que RPC (Remote Procedure Call) sobre **SOAP** y que la comunicación directa con **JNI** (Java Native Interface), y no requiere componentes adicionales para ejecutar procedimientos en **Java** desde **PHP** o viceversa.

![image-20241016013604854](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241016013604854.png)

Ilustración del funcionamiento de PHP/Java Bridge.



Para hacer funcionar Java Bridge, tenemos algunos requisitos previos:

- Java 1.4 o superior.
- Apache Tomcat.
- Fast-CGI.
- PHP y el servidor web Apache instalado.



Debemos descargar e instalar PHP/Java Bridge de su página oficial.

**Instalación**

Se recomienda descargar el fichero con documentación php-java-bridge...documentacion.zip. Pues descargar la última versión del enlace https://sourceforge.net/projects/php-java-bridge/files/Binary%20package/. Este fichero contiene una serie de ejemplos que pueden ser de utilidad para el desarrollo, por otra parte contiene un fichero JavaBridge.war, este es el que necesitaras para utilizar Java Bridge.

![image-20241016014215161](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241016014215161.png) 

Captura probando la ejecución de JavaBridge.



Como comentamos uno de los requisitos es tener PHP instalado, antes de nada pruebe si se ha instalado correctamente con el siguiente comando:

Copia el fichero JavaBridge.war a la carpeta autodeploy de tu instalación de Apache Tomcat. Reinicie Tomcat, tras esto debería poder acceder a la ruta /JavaBridge en su servidor local. Si se han cumplido todas las dependencias debería poder ver una página con enlaces a múltiples ejemplos y utilizarlo como base a nuevos proyectos.



## Recuerda

### Codigo:

Un código se ejecuta normalmente de izquierda a derecha y de arriba debajo de forma secuencial.

### Condiciones:

También suelen llamarse expresiones lógicas porque sólo pueden dar como resultado los valores verdadero o falso.

### Función:

En la definición de una función se puede utilizar cualquier sentencia en programación, incluida la declaración de variables.



# JAVA STRUCTS 2.0 AVANZADO

## Introducción

En este tema veremos controladores y beneficios de utilizar STRUCTS y poder implementarlo así como ahondaremos en los distintos tipos de controladores con Servlet o cómo crear librerías Struts y crear Vista.

## Objetivos

- Crear ficheros y controladores necesarios para el funcionamiento de STRUCTS.
- Ser capaces de cambiar resultados de las acciones.

## Mapa Conceptual

![image-20241016020035572](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241016020035572.png)

## Introducción a Struts 2.

**Struts 2** surgió de la combinación entre **Struts 1** y otro framework creado por otros desarrolladores llamado WebWok. Esto se hizo ya que cada **framework** poseía unas características diferentes, cada uno con sus ventajas y desventajas.

Struts se basa en la estructura formada por XML y JAVA de forma conjunta en clases. Como principal característica, la utilización de acciones, las cuales ejecutan funciones tan importantes como aislar los servicios para ejecutarlos de formal que el procesamiento y las tareas queden aparte.

Las acciones también se encargan de la manipulación de las consultas con sus peticiones y resultados. Estas acciones implementan objetos JavaBeans, de forma que mediante el envío de parámetros se devuelva un conjunto de resultados que Struts analizará y seleccionará el más adecuado.



## Patrón MVC y Beneficios

Struts 2 se basa en el modelo **MVC** para una ejecución más potente, con gran accesibilidad y una resolución de los problemas de diseño que ocurrían antes de comenzar a utilizarlo.

Como características podemos destacar:

- Gran funcionalidad con las etiquetas.
- Buena depuración.
- Compatibilidad con AJAX.
- Extensa biblioteca de complementos y extensiones.
- Validación de formularios bien implementada y fácil de manejar.



Las principales ventajas que posee el MVC en Struts2 son poder agrupar todas las acciones de este en paquetes y dominios, de forma que la organización está muy consolidada. Además también permite agrupar las clases de acción en XML.

![image-20241016021204577](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241016021204577.png)

El patrón Modelo-Vista-Controlador en Struts2 es llevado a cabo con estos cinco componentes:

- **Actions:** clases que contienen la lógica del demonio.
- **Interceptors**: revisan una petición a los datos de respuesta de un Action.
- **Values Stack/OGNL:** permitan la integración entre el resto de componentes.
- **Results / Result Types**: encargados de renderizar la respuesta a partir del resultado de un Action.

**Ciclos de vida de una petición**

Basándose en el anterior diagrama podemos explicar el proceso por el que pasa una petición de usuario en Struts2:

1. Un usuario envía una petición al servidor solicitando un determinado recurso, como por ejemplo una página en html.
2. El FilterDispatcher revisa la petición y entonces determina que Action es el adecuado.
3. Se ejecutan una serie de interceptores que revisan o modifican la petición, como por ejemplo para fines de validación o seguridad.
4. El Action seleccionado procesa la petición.
5. De nuevo, algunos interceptores, aplican un post-procesado al resultado del Action.
6. Finalmente la vista genera el recurso y este es enviado al usuario.



## Introducción a las Acciones

Las acciones de **Struts** son **clases Java** que contienen la lógica de negocio y la llevarán a cabo a partir de las peticiones realizadas a estas. Estos controlan la interacción entre el usuario, el modelo y la vista.

Las clases que implementan las acciones deben descender desde "org.apache.struts.Action", para de esta forma poder acceder a sus métodos.

**Como respuesta a una acción de un usuario** Struts 2 creará una instancia de una clase heredera de Action que hayamos definido como por ejemplo "HelloWorldAction" y llamará a un método llamado execute(). Al finalizar el código definido por la lógica de negocio deberá devolverse un String indicando el tipo de resultado. De manera más simple, para cada URL debes implementar una clase Action y puedes utilizar el nombre de la clase como nombre de la acción o definirle otro nombre a través del fichero struts.xml como se muestra a continuación.

![image-20241016101937175](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241016101937175.png)

### Acciones de Structs 1 y 2

El código de una acción de Struts 1.x tiene fuertes dependencias del API de Struts y del API de servlets. A continuación tenemos un ejemplo de Struts1, donde destacan en negrita las dependencias:

![image-20241016103153905](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241016103153905.png)

Estas dependencias son una "molestia" a la hora de hacer pruebas unitarias. Para probar nuestra acción necesitamos tener Struts y el contenedor de servlets en marcha. Además dificultan la portabilidad de nuestro código a otro framework MVC distinto de Struts.

La tendencia actual en JavaEE es el uso de APIs "no invasivos", que no necesitan de dependencias explícitas en el código. Siguiendo esta filosofía, en Struts 2 una acción es una clase java convencional, que no es necesario que herede de ninguna clase especial:

![image-20241016103709165](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241016103709165.png)

![image-20241016103739090](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241016103739090.png)

Nótese que las dependencias de APIs externos al código se han reducido a cero (luego veremos como obtener los parámetros HTTP y otra información de contexto). Así, nuestra acción se puede probar fácilmente y portarla a otro framework MVC es también mucho más sencillo.

Por supuesto, sigue siendo necesario mapear una determinada URL con la acción y asociar los resultados con la vista a mostrar. Esto se hace en el struts.xml (o de manera alternativa con anotaciones):

Por defecto, la acción se asocia con una URL igual a su nombre seguido del sufijo ".action". En este caso "login.action" sería el que dispara la acción.

![image-20241016104115320](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241016104115320.png)

![image-20241016104537065](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241016104537065.png)

Por conveniencia Struts 2 ofrece una clase llamada **ActionSupport** de la que pueden heredar nuestras acciones. Una de las ventajas de usar ActionSupport es disponer de una serie de constantes predefinidas con posibles resultados de la acción, en lugar de usar Strings arbitrarios como en el ejemplo anterior.



## Controlador con Servlet. Crear Vista

En Struts un Action es responsable de llevar a cabo la lógica de negocio. El siguiente paso es la representación de los datos resultantes a través de un Result.

A menudo hay reglas de navegación asociadas a los Results, Por ejemplo, si la responsabilidad del action es autenticar un usuario puede haber tres posibles resultados:

1. Login con éxito.
2. Credenciales erroneas
3. Usuario bloqueado.

Para estos 3 posibles resultados tendríamos 3 distintas vistas.



Generalmente para las vistas se utiliza JSP pero por otro lado Struts 2 no te obliga a usarlo, ya que el objetivo del patrón MVC es mantener los distintos componentes independientes. Por ejemplo si quieres devolver un resultado en JSON podrías definir tu propio tipo de result para llevarlo a cabo. Además Struts 2 te permite utilizar otros motores de plantillas como Velocity Freemaker. 

Como tipo de result por defecto si no se ha especificado uno tenemos **dispatcher**, con este result se redirige hacia un Servlet, JSP, HTML, etc.

```
<result name="success">
```

![image-20241016184047823](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241016184047823.png)

A continuación tenemos un simple ejemplo del JSP que funciona con action con el parámetro name:

![image-20241016184248759](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241016184248759.png)

La directiva **taglib** indica al contenedor de servlets que esta página usará **etiquetas de Struts 2** y que serán **precedidas por s**. La etiqueta \<s:property> muestra el valor de la propiedad **name de una clase Action**, recordemos que no accede directamente a la propiedad sino por un método get, en este caso **getName**



## Controlador con Servlet (Crear Acción)

Para crear una **acción simple**, como único requisito es que tan solo tenemos que crear un método sin argumentos que devuelva un string o resultado. Por  ejemplo:

Esta puede interactuar con variables ya definidas en la clase, no solo con las que la acción ha generado por ejemplo.

```java
public string Action{
	public static String correcto = "correcto"
	public static String incorrecto = "incorrecto"
	
	public String execute();
}
```

En nuestra clase podemos indicar que esta será utilizada por Struts para que sea tratada por una acción mediante:

```java
@Action(value="formulario",results={@Result(name="enviado",location="/formulario.jsp")})
```



## Controlador con Servlet (Crear Servlet)

Para utilizar un **servlet** en un conjunto con Structs 2 debemos excluir su ruta del filtro de Struts, para eso nos dirigimos a **struts.xml y definimos.

En este caso estamos utilizando una característica de Struct orientada a ignorar contenido estático.

```java
<constant name="structs.action.excludePattern" value="/TuServlet"/>
```

![image-20241017011301156](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241017011301156.png)

También es necesario definir el servlet en el archivo web.xml junto con las características que le queremos dar.

Por último nos quedaría implementar el servlet como uno cualquiera en la ruta correspondiente a su paquete y extender de HttpServlet.

![image-20241017011537282](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241017011537282.png)



## Controlador con Filtro (Crear FilterDispatcher)

En Struts 2 FilterDispatcher forma parte de la API de Servlet. FilterDispatcher es el que se encarga de redirigir las peticiones a los Action e Interceptors de Struts.

El **FilterDispatcher** se declara en el fichero web.xml de esta forma:

![image-20241017011950154](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241017011950154.png)

Mediante filter-mapping se indica que urls capta el filtro de Struts 2, en este caso y normalmente cualquier url empezando por la raiz (/).



## Fichero struts.xml

Framework Struts 2

- Interceptors que pueden realizar operaciones de pre-procesado y post-procesado de las peticiones.
- Clases Action con la lógica de negocio.
- Results que pueden crear vistas usando entre otros: JavaServer Pages (JSP) , Velocity y plantillas FreeMaker.

![image-20241017012525261](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241017012525261.png)

En el fichero es esencial para la configuración de Struts 2 y debe estar en el classpath de la aplicación web, "WEB-INF/classes".

La primera cosa que se aprecia es el DOCTYPE.

Todo fichero de configuración necesita tener definido el DOCTYPE correctamente como se muestra en el ejemplo.

Es la etiqueta raíz desde que declaramos diferentes paquetes usando la etiqueta <package>.

<package> nos ayuda a dividir y modularizar la configuración. Es realmente útil cuando tenemos un gran proyecto que está dividido en distintos módulos.

| Atributo          | Descripción                                                  |
| ----------------- | ------------------------------------------------------------ |
| name(obligatorio) | Identificador único para el paquete.                         |
| extends           | Indica de que paquete extiende. Por defecto el paquete base es struts-dafault |
| abstract          | Si es true, el paquete no está disponible para su utilización por el usuario final. |
| namespace         | Espacio de nombres único para las actions.                   |

También tenemos las etiquetas <action>, con ella indicamos que URL queremos acceder y definimos que clase de action será usada cada vez que se acceda a dicha **URL**.

Los Results determinan que se devuelve al navegador después de ejecutar un action. El String devuelto debe coincidir con el nombre de un result. En el struts.xml los results puedenconfigurarse por cada action o como globales, por lo que podrán ser usados por todo action en el paquete. Results poseen unos atributos nombre y tipo opcionales, el nombre por defecto es "success". El struts.xml puede crecer con el tiempo, por ello dividirlo en paquetes es una forma de modularizarlo, pero también es posible dividirlo en fichero xml diferentes e incluir dichas partes gracias a la etiqueta <include> junto al atributo file.

![image-20241017014139206](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241017014139206.png)



En tiempo de ejecución, solo existe una configuración para la aplicación. Previamente, la configuración es definida a partir de uno o más ficheros XML, incluyendo el fichero por defecto struts.xml. Existen diversos elementos que pueden ser configurados incluyendo packages, namespaces, includes, actions, results, interceptors y exceptions.



## Añadir librerias struts y crear vista

Generalmente la estructura de una aplicación web en Java sigue el siguiente esquema:

/ejemplo/ 	(ficheros publicos)

/ejemplo/META-INF/ 	/ejemplo/WEB-INF/

/ejemplo/WEB-INF/classes/ (Las clases compiladas de nuestra aplicación)

/ejemplo/WEB-INF/lib/ (Bibliotecas, aquí vendrían las de Struts)

/ejemplo/WEB-INFweb.xml (Fichero de configuración de nuestra aplicación, es usada por contenedores como Tomcat)

Para trabajar con Struts como mínimo necesitamos las siguientes bibliotecas empaquetadas en .jar: struts2-core.jar, xwork.jar, javassist.jar, freemaker.jar, commons-logging.jar, commons-fileupload.jar, commons-io.jar, commons-lang2.jar y añadir un fichero de configuración propio de Struts denominado **struts.xml** y que estará en el directorio **/ejemplo/WEB-INF/classes/.**

Para añadir las librerías de Struts en nuestro proyecto, desde nuestro IDE seleccionamos la opción correspondiente a la adición de librerías normales. Por ejemplo en Netbeans nos vamos a la carpeta libraries y con el segundo botón pinchamos en "Add JAR/Folder".Ahora en la carpeta donde descomprimimos Struts 2 habrá un directorio llamado "lib", dentro del cual se encuentran los fichero JAR que podremos utilizar.

En Structs  las vistas son archivos de **formato .JSP** que permiten la interacción con el usuario, pero son llamados results.

Para la creación de results nos dirigimos al archivo struts.xml y añadiremos el nombre de los results según la respuesta de las acciones. Por ejemplo si queremos que se vea unas vista cuando sea correcto y otra cuando sea incorrecto.

```java
<result >vista/correcto.jso</result>
<result name>= "incorrecto">vista/incorrecto.jsp</result>
```



## Crear acción y fichero struts.xml

Para crear una acción simple, como único requisito es que tan solo tenemos que crear un **método** sin argumentos que devuelva un String o resultado. Por ejemplo:

Esta puede interactuar con variables ya definidas en la clase, no solo las que la acción ha generado por ejemplo.

![image-20241017020558806](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241017020558806.png)

En nuestra clase podemos indicar que esta será utilizada por Struts para que sea tratada por una acción mediante:

```java
@Action(value="formulario", results={@Result(name="enviado", location="/formulario.jsp")})
```

El fichero Struts.cml es el que contiene las acciones del framework. Para que enren en el roll de  funcionalies de las acciones deben estar declaradas en este fichero.

Además de las acciones, en ese fichero se declaran todos los parámetros generales de configuración y los interceptores. 

Este es un ejemplo del fichero,



## Añadir resultado a la acción

Podemos agregar un tipo de **variable a la acción** cuando esta es ejecutada de forma que cuando se ejecuta esta devuelva ese resultado.

Esto hace que las acciones tengan comunicación con los demás elementos del proyecto, de esta forma existe una correlación entre acciones y métodos.

También se pueden definir acciones que no devuelvan nada por si no es necesario y evitar la carga de variables.



## Clase Actionsupport

Esta **clase** proporciona de forma predeterminada la **implementación** a las **acciones** más **comunes** del proyecto. Es decir es la **base** de las **clases  Action**. Con ella podemos ahorrarnos tiempo de escribir código en muchas ocasiones, aportando los métodos y funciones que se pueden usar de forma directa.



## Creación de la acción con actionsupport

Las clases **Action** actúan como el controlador en el patrón MVC. Estas clases responden a una acción de usuario, ejecutando la lógica de negocio, y luego devuelven un resultado que indica a Struts qué vista renderizar.

Las clases de acción de Struts 2 suelen extender la clase **ActionSupport**, que es proporcionada por Struts 2. La clase ActionSupport proporciona implementaciones predeterminadas para los métodos más comunes (por ejemplo execution o input) y también implementa varias interfaces útiles. Una clase que extienda a AcitonSupport, puede sobreescribir los métodos predeterminados o heredarlas.

Este ejemplo muestra cómo se crearía una clase extendiendo de ActionSupport.

![image-20241017095708378](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241017095708378.png)

Como vemos sobrescribimos el método execute() que es el necesario para que la acción se ejecute.



## Implementación de interfaces de contexto

En Struts 2 nosotros no tenemos ningún objeto específico para http por defecto como en los servlets. Si queremos algún objeto relacionado con HTTP en nuestra clase Action necesitamos implementar alguna de las interfaces definidas en Struts 2 y que son denominadas "Aware Interfaces".

5 Aware Intefaces de Struts:

- ApplicationAware
- SessionAware
- ServletRequestAware
- ServletResponseAware
- ParameteAware



### ApplicationAware

Implementando la función **setApplication** obtenemos un objeto con el que compartir información a través de todos los componentes de nuestra aplicación.

El código del Action:

![image-20241017100239377](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241017100239377.png)

En la vista podemos acceder a dicho objeto mediante **#application:**

![image-20241017100400999](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241017100400999.png)



### SessionAware

Si implementamos el **método setSession() de SessionAware**  obtendremos un objeto que es similar al Session de Servlets. Los atributos que se añadan a este objeto serán accesibles en las próximas peticiones del cliente.

![image-20241017100554546](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241017100554546.png)

La vista en JSP:

![image-20241017100701218](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241017100701218.png)

Ejemplo de uso de la vista #session



### ServletRequestAware

Todos los Actions que necesiten acceso al objeto de la petición del Servlet (HttpServletRequest) deben implementar esta interfaz. Solo es relevante si es usada en un entorno servlet. Tenga en cuenta que utilizar esta interfaz ata el Action al entorno de un Servler, por lo que debe ser evitado si es posible ya que dificultará algunas cosas como pruebas unitarias.

![image-20241017101053737](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241017101053737.png)

### ServletResponseAware

Similar a **ServletRequestAware** pero para el objeto respuesta, su setter es

```java
setServletResponse(javax.servlet.http.HttpServletResponse response)
```



### ParameterAware

Esta interfaz ofrece a los Action una manera alternativa de recibir parámetros de entrada. El objeto Map contendrá todos los parámetros como entradas nombre/valor. Nótese que todos los valores para un parámetro serán devueltos, así que el tipo de los objetos (valor) en el Map son **java.lang.String[]**.

![image-20241017101650286](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241017101650286.png)



## Resultado de las acciones

Cada vez que un Action finaliza su ejecución (execute()) devuelve un String que indica el estado del resultado, utilizamos dicho String para decidir que vista debe renderizar el resultado guardado como propiedades del Action. A esto lo denominamos un **Result**. Cada Result debe tener un nombre único para un Action. La clase **ActionSupport** dispone de varias constantes con los nombres de results más comunes: SUCCESS, NONE, ERROR, INPUT y LOGIN.

No es obligatorio devolver algunas de estas cadenas en la función execute(), se puede utilizar la cadena de texto que se considere más apropiada para elegir la vista.

Struts 2 permite utilizar otras tecnologías a parte de jsp para representar las vistas como: 

- Velocity: Apache Velocity es un motor de plantillas basado en Java que proporciona un lenguaje de plantillas para hacer referencia a objetos definidos en código Java.

- Freemaker: Apache FreeMarker es un motor de plantillas gratuito basado en Java, que originalmente se centraba en la generación dinámica de páginas web con arquitectura de software MVC. Ahora puede generar texto basado en plantillas y datos cambiantes. No depende de servlets ni de HTTP o HTML.

  Diseñado para ser práctico en la generación de páginas web HTML, en particular mediante aplicaciones basadas en servlets que siguen el patrón MVC.

![image-20241017110710129](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241017110710129.png)

Como se puede ver para la acción hello, hay dos posibles resultados, success y error, esta última utiliza Freemaker.



## Cambiar resultados de las acciones

Los **resultados** de las **acciones**, una vez obtenidos, pueden ser **modificados** al antojo del **desarrollador**. De esta manera se puede lograr una gran **versatilidad** de **acciones** que compartan una misma variable y se vaya cambiando conforme va pasando por estos.

Una **variable** puede ser **cambiada** mediante **métodos** de **Struts** como **ActionMapping** que nos permite **obtener** una variable de una **acción** para después poder cambiarla según convenga y trabajar con ella.



## Struts Tags

Struts 2 ofrece un conjunto de etiquetas para ser utilizadas en las vistas.

![image-20241017111630714](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241017111630714.png)

Como podemos ver hemos definido el conjunto de tags de Struts con el prefijo **s**. La función principal de la etiqueta **\<s:url>** es crear enlaces a actions, especialmente a otros recursos de la aplicación local. Mientras que **\<s:property>**  permite acceder a propiedades del action. En la documentación de Struts 2 se puede encontrar un listado completo de las etiquetas disponibles.



## Objeto Graph Navigation Languaje (OGNL)

Es un **lenguaje** de **expresiones** utilizado generalmente para poder **editar** o **fijar** los **valores** de las **propiedades** seleccionadas. Si por ejemplo tenemos un formulario del cual obtenemos una expresión, después podemos utilizar las funciones de este lenguaje para cambiar alguna propiedad del formulario y que este cambie su funcionalidad también.

Podemos decir que es una versión más simple en cuanto a expresiones se refiere que el lenguaje original de Java dado que el número de estas es mucho menor aunque de funcionalidad muy potente.

En Struts nos permite acceder al contexto de un Action (ActionContext). Por ejemplo tenemos el siguiente Action con un array de muestra:

![image-20241017112405346](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241017112405346.png)

Y tenemos el siguiente fragmento de vista que accede a dicho array, en el que utilizamos OGNL de la siguiente manera:

![image-20241017112548219](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241017112548219.png)



## Crear formulario con Form Tags

Para comenzar con la **creación de formularios** , lo primero es declarar que vamos a insertar un form en nuestro HTML y después iremos introduciendo campos y elementos.

```java
<s:form action="formulario">
</s:form>
```

Con la etiqueta **s:form** indicamos que vamos a introducir un formulario.

Después vamos incluyendo los elementos que queramos dentro de las etiquetas de este form.

Después solo tenemos que crear el Action que gestione la funcionalidad del form, que veremos más adelante.

![image-20241017114438703](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241017114438703.png)



## Crear acciones

Para crear una acción simple, como único requisito es que tan solo tenemos que crear un método sin argumentos que devuelva un string o resultado. Por ejemplo:

Esta puede interactuar con variables ya definidas en la clase, no solo con las que la acción ha generado por ejemplo

![image-20241017115710819](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241017115710819.png)

En nuestra clase podemos indicar que esta será utilizada por Struts para que sea tratada por una acción mediante:

```java
@Action(value="formulario",results={@Result(name="enviado",location="/formulario.jsp")})
```



## Acceder a la pila de valores

La **pila **de **valores** consiste en un **almacén** donde pueden guardarse todo tipo de **variables** de forma que tengamos un **acceso** desde **cualquier parte** de nuestra **aplicación** a **todas** las **variables** que se encuentren en su interior.

Esto ayuda a solucionar algunos problemas de herencia y facilita la obtención de variables en cualquier punto. Si por ejemplo tenemos una vista que necesita del uso de las variables que se encuentran en un controlador, estas se pueden obtener de la pila mediante el uso de del lenguaje OGNL visto anteriormente.



## Creación de acciones para form tags

Una vez tengamos listo nuestro formulario listo, podemos proceder con las acciones. Para ello como hemos visto nos tenemos que crear la clase que llevará estas acciones, en mi caso la llamaré formularioAction. Además extendera de ActionSupport para que tengamos los métodos propios.

![image-20241017120511272](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241017120511272.png)

Ya tenemos nuestras acciones listas para ser usadas por la aplicación. Después podemos proceder a mostrar los datos recibidos por el cliente por ejemplo o trabajar dentro de la aplicación con ellos.



## Atributos List, Listkey y ListValue

Con Struts podemos realizar una lista de elementos mediante la etiqueta <select> a la cual se le puede agregar una lista de opciones que son seleccionables por el usuario. Esta etiqueta posee, ente varios, los atributos List, ListKey y ListValue.

- **List**: nos permite seleccionar el conjunto de opciones de una lista predeterminada para agregarlas a nuestro select.
- **ListKey:** propiedad de la lista de objetos para obtener el valor del campo.
- **ListValue:** indica la propiedad de la lista de opciones para obtener el contenido del campo.



Por ejemplo:

```java
<s:select key="person.residency" list="states" listkey="stateId" listValue="StateName"
```

En este caso llamará a un método getStates() del Action correspondiente para obtener un listado de objetos que respresentan estados, cada objeto State tendrá un método **getStatedId**() y **getStatedName()**.



## Generic Tags

Las **etiquetas genéricas** se utilizan para **controlar** el **flujo** de **ejecución** cuando las páginas se renderizan. Estas también se utilizan para la **extracción** de **datos** provenientes de las **acciones** o desde la **pila** de **valores**.

Las **etiquetas** de **control**, pertenecientes a las **genéricas**, que proporcionan un flujo de control mediante el uso de if y Else o iteradores. También están las etiquetas de datos las cuales permiten la manipulación de datos o creación de conjunto de objetos entre otros.

Siguiendo un esquema podemos ver los dos grupos:

- Control
  - if
  - else
  - elseif
  - append
  - generator
  - iterator
  - merge
  - sort
- Datos:
  - a
  - action
  - bean
  - date
  - debug
  - include
  - param
  - property
  - set
  - text
  - url



## Crear acción para listado

También existen acciones que podemos crear para gestionar nuestra lista. Los métodos más básicos son para rellenarla y obtenerla para utilizarla. Este sería un ejemplo de la clase listado:

![image-20241017123907274](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241017123907274.png)

![image-20241017124051839](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241017124051839.png)

Posteriormente, en nuestro XML definimos la acción para la lista.

Existen muchas más funciones que dependiendo de las necesidades a la hora de trabajar con listas podamos necesitar.



## Utilizar Generics Tags

Vamos a ver un ejemplo con las etiquetas de control, más concretamente con if, else y elseif.

De esta manera podemos controlar las partes de código HTML que se ejecutarán y las partes que no.

![image-20241017124406549](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241017124406549.png)



## Programar ordenación

Existen **varias maneras **de **ordenar** dependiendo del **tipo** de **dato** y de la **finalidad** a la que se les adjudica. Si por ejemplo tenemos un array con diferentes valores enteros y queremos ordenarlos de mayor a menor, podemos utilizar varias técnicas.

Utilización de varios arrays para ir recogiendo los valores e ir guardándolo en estos arrays auxiliares dependiendo de si es menor que el anterior que lo que vaya insertando.

Cuando los elementos son de tipo String, existen funciones para arrays de ordenación ya predefinidas, que podemos utilizar desde Struts.



## Validación de entrada

Las **validaciones** de **entrada** nos permiten **filtrar** los **campos** que el **usuario** tiene que **introducir** para que no existan **errores** en la **ejecución**. Si por ejemplo tenemos un campo nombre, contraseña y otro edad, solo necesitamos obligatoriamente que inserte los dos primeros.

Por ello con la validación podemos indicar que debe insertar esos dos y el tercero por si quiere el usuario.

 La realización de validaciones en Struts es bastante simple respecto a otros lenguajes, ya que posee varias formas de validación y podemos elegir la que mejor nos convenga. Esta son:

- Mediante un archivo XML
- Mediante manuales
- Con anotaciones



## Crear el formulario

Para comenzar con la **creación de formularios**, lo primero es declarar que vamos a insertar un form en nuestro HTML y después iremos introduciendo campos y elementos.

```java
<s:form action="formulario">
</s:form>
```

Después vamos incluyendo los elementos que queramos dentro de las etiquetas de este form.

Después solo tenemos que crear el Action que gestione la funcionalidad del form, que veremos  más adelante.

![image-20241017125513025](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241017125513025.png)



## Crear primeras validaciones

Vamos a crear un **formulario**  que solicite al usuario los **datos obligatorios**. Nos quedará algo así:

![image-20241018000258787](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018000258787.png)

![image-20241018000358215](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018000358215.png)

Ahora le agregamos los campos que serán obligatorios con el atributo required.

Una vez tengamos el formulario vamos a ver cómo crear nuestro validador mediante XML.

Creamos el archivo XML y le llamamos "validaciónFormulario.xml". Dentro de este las validaciones se encuentran entre las etiquetas <validators>.

Como vemos dentro de estas etiquetas nos encontramos con las que nos determinan el elemento al que queremos validar, estas son <field> con el atributo name y el nombre del campo </field>.

![image-20241018000754407](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018000754407.png)

Dentro de esta introducimos la etiqueta <field-validator>, la cual establece una validación según el tipo que necesitemos. En este caso como queremos que se introduzcan algún string, será del tipo "requiredstring". </field-validator>

Por último, podemos ver como le indicamos las propiedades mínimas y con <message> se mostrará un mensaje por si falla la validación.</message>



## Tipos de validación

Podemos definir las validaciones en varios tipos. La lista de validaciones se representa como:

- **Requered:** Revisa que el campo no esté vacio.
- **Requiredstring:** Igual que el anterior pero el string debe ser mayor de 0.
- **Stringlength:** Verifica que la cadena tenga una longitud fijada por el desarrollador. 
- **Int, double, long y short:** Revisa que estos números estén entre los valores fijados.
- **Email:** Verifica que el formato introducido pertenezca a un email.
- **url:** Verifica que el formato introducido pertenezca a una url.
- **visitor:** Permite enviar los datos introducidos al Action de forma que este sea el que los verifique.
- **Fieldexpression:** Verifica si cumple las reglas del lenguaje OGNL.
- **conversion:** Verifica si se produce algún problema de conversión.



## Etiquetas set y push

Las **etiquetas Set y Push** permiten la inclusión de propiedades en un elemento. Por ejemplo si queremos que un input tenga un nuevo atributo name y no lo hemos definido antes, podemos utilizar Push.

```java
<s:push value="#nombre"/>
<s:set var="nombre" value="persona.nombre"/>
```

Si por otro lado queremos cambiar el valor de ese atributo, mediante Set podemos fijar el nuevo valor de forma muy rápida. Esto es muy útil cuando una expresión es muy compleja y no deseas tener que buscarla perdiendo más tiempo del necesario.



## Validación personalizada

La validación en Struts 2 es configurada **a través de XML o anotaciones. La validación manual en los Action también es posible**, y puede ser combinada con validación por XML o con anotaciones. La validación también depende de los interceptores de validación y flujo de trabajo (ambos incluidos en el stack de interceptores por defecto). El interceptor de validación realiza la validación por si mismo y crea una lista de errores específicos para cada campo. El interceptor del flujo de trabajo comprueba la presencia de errores de validación, si alguno es encontrado se devuelve el resultado "input" (por defecto), devolviendo al usuario el formulario que contiene los errores de validación.

Antes de comenzar con la validación en los Action mostraremos un ejemplo de validación en xml. La convención para nombrar ficheros de validación XML es **<nombre clase Action>Validation.xml,** ejemplo simple de validación (Login-Validation.xml)

![image-20241018002654400](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018002654400.png)

<field> contiene el nombre del parámetro a validar y <field-validator> el tipo de validación a llevar a cabo. En el ejemplo podemos ver que con la contraseña indicamos un parámetro en lugar de escribir el mensaje, es recomendable guardar los mensajes de error en un fichero de propiedades.

Si estamos usando la configuración por defecto y nuestro Action no tiene el **resultado input** definido y se da lugar validación de errores, obtendremos un mensaje de error informando de ello.

En **struts.xml** quedaría así:

![image-20241018003243891](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018003243891.png)

Como hemos comentado el interceptor de flujo de trabajo (**workflow interceptor**) comprueba si el Action implementa la interfaz **Validateable**, si es así, se llamará al método validate() que implementa dicha clase. 

El  método validate() no devuelve errores sino que son almacenados con la ayuda de la interfaz **ValidationAware.**

Una vez finalizado el método validate() el interceptor comprobará si se han generado errores de validación, si ha sido así se detendrá el procesamiento de la petición y se transferirá el control a la página input con los mensajes de error apropiados. Para cada campo los mensajes de error pueden ser añadidos usando el método addFielDError().

Los mensajes de error pueden ser añadidos directamente o especificados en un fichero propiedades separado.

La clase ActionSupport ya implementa la interfaz Validateable y ValidationAware, solo requeriría sobrescribir la función validate() para llevar a cabo una validación:

![image-20241018004040714](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018004040714.png)



## Añadir lógica de validación

Otro método de validación se lleva a cabo creando ficheros xml en el mismo directorio que las clases. La validación por XML de Struts2 provee opciones predefinidas de validación como validación de email, rango de enteros, campos de formularios, validación con expresiones regulares, longitud de texto etc.

Los ficheros xml deben llamarse **<nombre clase>-validation.xml**. Como por ejemplo Employee-validation.xml con el siguiente contenido:

![](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018004446981.png)

![image-20241018004939415](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018004939415.png)



Como podemos ver se puede incluir varios validadores para un mismo parámetro.



## Interceptores y conversión de tipos

Los **interceptores** pueden ejecuta código antes y después de que una acción sea llamada. Este es un elemento que suele incluirse en la mayoría de los frameworks debido a la gran versatilidad que presenta, pero en Struts tiene una relevancia muy importante ya que se utiliza en las principales funcionalidades del mismo **framework.**

Dentro de los interceptores podemos encontrar funciones como la doble seguridad en formularios, es decir que se realiza la comprobación dos veces, una antes de invocar a la acción y otra después por si se produce algún error.

Otra es la conversión de tipos, la cual se realiza  antes de enviar cualquier campo rellenado, y también la validación se puede realizar mediante interceptores además de otras muchas funciones.

Imagen obtenida por la página oficial de Struts https://struts.apache.org/

![image-20241018010003081](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018010003081.png)



## Crear el formulario

A la hora de crear el **formulario**, para indicar el interceptor dentro de este lo hacemos en el archivo struts.xml, de tal forma que se ejecute antes de la **Acción**.

Este interceptor se ejecutará de forma automática y dependiendo de su resultado seguirá hasta la acción o no. Si el desarrollador quiere que se ejecute la acción dependiendo de distintos resultados que pueda devolver el interceptor, deberá ser programado.

![image-20241018010322885](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018010322885.png)



## Crear conversor personalizado

Podemos crear **conversores** de forma que con una clase que extienda de **StrutsTypeConverter**, nos permita fijar la conversión según necesitemos.

![image-20241018010623883](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018010623883.png)

Veamos un ejemplo de cómo quedaría la clase para pasar de un objeto a un **String** y viceversa.

Para añadir el conversor a una determinada acción, podemos hacerlo mediante un fichero properties.

Debemos de nombrar a este de manera que la estructura quede: "NombreClaseAcción-conversion.properties". Ahora podremos definir en este archivo el nuevo conversor que hemos creado y que la acción pueda utilizarlo.

![image-20241018010856882](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018010856882.png)



## Interceptores modeldriven y prepare

El interceptor del **ModelDriven** hace que los modelos de otros objetos pasen a ser los modelos por defecto y podamos acceder a ellos de forma muy versátil, mediante la utilización de métodos como pueden ser **getModel()**

![image-20241018011132244](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018011132244.png)

Para su utilización, necesitamos incluir el interceptor en la acción a la que queremos asociarlo.

El interceptor Prepare es muy útil para cualquier situación donde necesitas asegurar que algunas ocasiones se ejecuten antes que otros métodos. Un ejemplo es por ejemplo cuando una operación es fijar los parámetros de un objeto que se encuentra en una base de datos. Si no existe el objeto porque aún no se ha rescatado de la base, es imposible fijar los parámetros por lo que produciría un error.

Po ello los interceptores Prepare son tan útiles en determinadas ocasiones. También es necesario que la clase a la que se apliquen implementes la interfaz Preparable.



## Implementación de ModelDriven

Con la implementación de **ModelDriven**, la clase en cuestión obtiene  la capacidad de transferir datos dentro del objeto de forma automática. Esto es debido a que cuando se realiza una petición los parámetros recibidos son guardados en un modelo. La validación posterior se realizará en este modelo.

Este es un ejemplo de la clase que implementa ModelDriven, la cual implementa la interfaz propia y el método getModel().

![image-20241018095444563](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018095444563.png)

![image-20241018095546528](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018095546528.png)

Después creamos el objeto Persona() con los campos que necesitemos para por último pasar al archivo JSP y crear un nuevo objeto Persona mediante el uso de un formulario.



## Implementación de Prepare - Acción

Necesitamos crear la clase que implemente la interfaz **Preaprable**.

Si lo ejecutamos podemos ver como primero se ejecuta prepare y después execute. De esta manera se nos permite ejecutar determinadas acciones antes de que se realice el envío del formulario.

![image-20241018095857920](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018095857920.png)



## Implementación de Prepare - Struts.xml

Para la declaración del interceptor Prepare, tenemos que crear un action que referencie a este. El código sería:

![image-20241018100045433](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018100045433.png)



## Autorización y Autenticación

La **autorización** se produce mediante un **servlet**, el cual pertenece a la clase **RequestProcessor**. Este analiza las peticiones provenientes de los navegadores y dependiendo de las características de cada uno y de las acciones a realizar se permitirá el acceso a algunos usuarios u otros.

Esta parte más específica de los usuarios y roles es realizada por el **método proccessRoles**, el cuál rescata los roles de los usuarios provenientes del navegador y determina si tienen acceso a algunas acciones o no.

**Struts** es un **framework** que necesita de un buen control de usuarios y permisos mediante la utilización de **JASS**, o el **control** de **usuarios** de **Java.**

Nota: **Java Authentication and Authorization Service**, o **JAAS**, pronunciado como "Jazz", es una [Interfaz de Programación de Aplicaciones](https://es.wikipedia.org/wiki/Interfaz_de_programación_de_aplicaciones) que permite a las aplicaciones [Java](https://es.wikipedia.org/wiki/Lenguaje_de_programación_Java) acceder a servicios de control de [autenticación](https://es.wikipedia.org/wiki/Autenticación) y acceso.



## Roles y Usuarios

Para poder fijar por nuestra cuenta los roles existentes en Struts, debemos modificar el archivo web.xml, de tal manera que indiquemos un rol para cada acción que queramos que la ejecute. Por ejemplo:

Si algún usuario que no pertenezca a este rol intenta realizar el envío del formulario, este recibirá una excepción por no ser autorizado.

![image-20241018100747200](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018100747200.png)





## Restringir Acceso

Para restringir el accedo a determinados roles, podemos declararlos como no inseguros para así indicar a Struts que no pueden acceder a esa acción. El ejemplo seria así:

![image-20241018100909324](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018100909324.png)

## Definir Autenticación

Podemos **declarar una acción** para que no se ejecute cuando un usuario no pertenezca a un rol. La mejor manera de mantener total seguridad en nuestra aplicación web es hacer que el usuario tenga que navegar por menús bastante generales y de esta manera poder filtrar las opciones.

Esta forma es algo más lecna de programar y desarrollar pero hace que un usuario que no tenga casi permisos este "encerrado" en un grupo de opciones y no llegue a ver si quiera todas las opciones que existen.



## Autenticación por formularios

Se puede realizar una **autenticación** en **formularios** de tal forma que cuando un usuario rellene los campos se **comprueben** los **datos** de este. Una vez obtenidos se popdrá actuar en efecto de lo que se necesite.

Por ejemplo, si un usuario rellena un formulario y no tiene permiso para acceder a más ofertas de productos, el formulario le enviará a una página sin estas, pero si por el contrario su rol expone que este usuario si debe visitar la acción será enviarle a una página con ellas.



## Mensaje e internacionalización

Cuando se produce algún error o problema a la hora de utilizar la **aplicación** es necesario indicar al cliente de donde provienen estos y que soluciones pueden existir.

Por ejemplo seguimos con el caso de los formularios, si el usuario no ha introducido un nombre correcto, deberemos decirle que lo cambie para poder realizar el **envío de formularios.**

Si queremos que se muestren mensajes personalizados, la manera más rápida sería indicarlos con el atributo **errors.**

```java
errors.required=debes indicar un nombre
```

Esto se incluye dentro del fichero properties.

La internacionalización se basa en la creación de aplicaciones que no tengan fronteras lingüísticas. Esto  se facilita en gran medida mediante las opciones que nos da Java para crear una aplicación que dependiendo del usuario, automáticamente se pueda versionar en su idioma.



## Crear el formulario

Para comenzar con la **creación del formularios**, lo primero es declarar que vamos a insertar un form en nuestro HTML y después iremos introduciendo campos y elementos.

```java
<s:form action="formulario">
</s:form>
```

Con la etiqueta s:form indicamos que vamos a introducir un formulario.

Después vamos incluyendo los elementos que queramos dentro de las etiquetas de este form.

Después solo tenemos que crear el Action que gestione la funcionalidad del form, que veremos más adelante:

![image-20241018102120551](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018102120551.png)



## Añadir mensajes e internacionalización

Una **web** es **accesible** en **todo** el **mundo** por lo que **adaptarse** a múltiples **idiomas** es algo **esencial**. Aunque una aplicación web no este pensada originalmente para ser usada fuera de un país como todo en la vida este hecho puede cambiar y **framworks** como **Spring** nos ofrecen desde un principio herramientas para poder mostrar **mensajes** y **textos** en los **idiomas** que soportemos, aunque en principio solo sea uno veremos que en el futuro será más sencillo añadir nuevos idiomas o cambiar nuestros textos sin revisar a mano nuestras vistas o código.

A continuación un ejemplo de un **Controller** que utiliza la **clase Locale**:

![image-20241018102637835](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018102637835.png)

La **vista** en **JSP**:

![image-20241018102807804](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018102807804.png)

Podemos observar que se utiliza la etiqueta **\<spring:message>** (spring: es el prefijo definido en la primera línea) para recuperar un mensaje a partir de un código que lo identifica.

Para poder utiliza las funciones de internacionalización la configuración quedaría de esta manera:

![image-20241018103117967](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018103117967.png)

Los mensajes son guardados en ficheros de propiedades con el formato messages_<idioma>.properties en el classpath de esta forma (messages\_en.properties):

```java
label.title=Login Page label.firstName=First Name
label.lastName=Last Name label.submit=Login
label.welcome_with_name=Hello,{0}
```

Como se puede observar en la última propiedad se utiliza un parámetro en el mensaje.

Cuando se produce algún error o problema a la hora de utilizar la aplicación es necesario indicar al cliente de dónde provienen estos y que soluciones pueden existir.

Por ejemplo seguimos con el caso de los formularios, si el usuario no ha introducido un nombre correcto, deberemos decirle que lo cambie para poder realizar el envío de formularios.

Si queremos mostrar mensajes de error lo mejor sería definirlos en un fichero properties aparte, por ejemplo con el nombre errors_\<idioma>.properties e indicándolo en la configuración de esta manera:

```java
<property name="basename" value="classpath:errors"></property>
```

y en el fichero:

```java
errors.requiered=debes indicar un nombre
```

Esto se incluye dentro del fichero properties.

La internacionalización se basa en la creación de aplicaciones que no tengan fronteras lingüísticas. Esto se facilita en gran medida mediante las opciones que nos da Java para crear una aplicación que dependiendo del usuario, automáticamente se pueda mostrar en su idioma.



## Capa de persistencia

Aunque estamos trabajando en el contexto de un framework como Struts 2 nada nos impide utilizar otras tecnologías como las orientadas a la persistencia de objetos. En este ccaso veremos la integración de **Struts 2 con Hibernate**. Hibernate es una biblioteca ORM (Object Relational Mapping) que ofrece una capa de abstracción sobre las conexiones y consultas a las bases de datos además de mapear propiedades de los objetos a atributos de una tabla. Más adelante veremos con más detalle Hibernate.



## Preparar enlace a datos.

Necesitamos definir un fichero de configuración donde definimos la información para establecer una conexión a la base de datos, el fichero debe estar disponible en el classpath y debe llamarse **hibernate.cfg.xml**:

![image-20241018104431513](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018104431513.png)

Como podemos ver hemos definido el "dialecto" que utilizara Hibernate para llevar a cabo las consultas. Además de los datos de acceso y definir en la que realizar el mapeo a una tabla.

Nota: El mapeo de datos es el **proceso de hacer coincidir campos de datos de una fuente con campos de datos de otra fuente**. Ayuda a garantizar que los datos de una fuente puedan transformarse o transferirse de manera precisa y efectiva a otro destino manteniendo su integridad, coherencia y significado



## Implementación de la capa de persistencia.

A continuación definimos una clase que representara un objeto almacenado en la base de datos. Con Hibernate no influye qué base de datos utilizamos ya que se encarga de traducir las consultas y los tipos de datos.

![image-20241018104919258](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018104919258.png)

![image-20241018105102795](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018105102795.png)

## Implementación del Patrón DAO.

En el patrón **DAO (Data Access Object)**, se define una interfaz que recoge los métodos que se pueden realizar sobre un modelo, como obtener un listado o guardar un modelo concreto. En este caso definimos una clase que hace la función de DAO:

Esta clase DAO nos permitirá realizar un par de acciones con el modelo:

![image-20241018105812630](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018105812630.png)

![image-20241018105515877](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018105515877.png)

![image-20241018105951823](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018105951823.png)

Aquí mostramos una clase **Action** que utiliza el modelo y el **DAO:**

![image-20241018110129332](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018110129332.png)

![image-20241018110242062](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018110242062.png)

Podemos observar que la clase implementa la interfaz ModelDriven. Esta es usada cuando una clase trata con un modelo concreto como Student. Esta interfaz obliga a implementar un método que devuelve el modelo.

En la vista accederemos entre otras a la propiedad student (getStudent) de AddStudentAction. Esta vista toma el nombre, apellido y las puntuaciones. Como AddStudentAction implementa ModelDriven se creará automáticamente un bean Student con los valores de nombre, apellido y puntuaciones:

![image-20241018110708721](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018110708721.png)

![image-20241018110829745](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018110829745.png)

## Subida/Descarga de ficheros.

Struts permite la subida y bajada de archivos mediante el uso de formularios, estos podemos desarrollarlos de forma que se puedan incluir uno o más archivos y todo de una forma mucho más simple de lo que otros lenguajes permiten



## Subida de ficheros.

En primer lugar y para proceder con la subida tenemos que definir un archivo de tipo File.

![image-20241018111155067](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018111155067.png)

![image-20241018111220500](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018111220500.png)

Ahora en nuestro formulario vamos a crear un campo en el cual se procederá a recoger el fichero que el usuario quiera subir.

La configuración del Action sería la siguiente, fíjese en el elemento **<interceptor-ref>:**

![image-20241018111422800](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018111422800.png)

Configuración de un Action con el interceptor fileUpload.

![image-20241018111522331](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018111522331.png)

Ejemplo configuración interceptor fileUpload



Por último tenemos que configurar el interceptor para realizar la subida antes de procesar la solicitud.



## Subida múltiple de ficheros.

El código no cambia mucho respecto al apartado anterior, solo que en vez de declarar un archivo File, debemos declarar una lista de archivos y recorrerla a la hora de subirla, repitiendo el proceso tantas veces como archivos hay en la lista.

![image-20241018111817350](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018111817350.png)

## Descarga de ficheros.

Struts permite la descarga de un fichero gracias a un **flujo** o **stream** implementado que vuelve bastante simple este proceso que puede llegar a ser algo tedioso en muchas ocasiones.

![image-20241018112007594](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018112007594.png)Primero recogemos desde nuestro formulario el archivo que el usuario va a descargar, mediante la inicialización de un objeto File.

Con **toByteArray()** pasamos los bytes del archivo a un Array para tenerlos disponibles. Luego escribimos los bytes en un archivo de forma que ya tengamos el archivo en nuestra aplicación.

Después le damos el formato que queremos y con **write** escribimos el archivo terminado.

![image-20241018112302161](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018112302161.png)

Después hacemos los mismos pasos que en la subida, declaramos el Action que realizará la descarga y definimos <result> para que obtenga el archivo.



## Medidores de Progreso.

Los medidores de progreso nos ayudan a determinar cuánto tiempo necesita la aplicación para realizar un proceso. Estos solo sirven de información al usuario, pero son muy útiles para hacer que este tenga conciencia del tiempo que tendrá que esperar hasta que acabe.



## Añadir medidor a un progreso.

Para representar el **proceso gráficamente** podemos utilizar el lenguaje javascript en nuestro archivo jsp, de forma que javascript se encargue automáticamente de controlarlo.

Este código realizará una comprobación del proceso cada 100 milisegundos, mientras no estén todos los bytes del archivo subidos, no terminará. Y una vez que termine se realizará el submit del form desde javascript.

![image-20241018112810498](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241018112810498.png)



## AJAX

Ajax es un acrónimo ("Asynchronous JavaScript and XML") en español "JavaScript y XML asíncronos", aunque en su nombre se hace referencia a las tecnologías Javascript y XML, son muchas más las que lo componen. El termino general **Ajax** se usa para describir varias **tecnologías Web** para convertir el lento y tedioso comportamiento de las **aplicaciones** el lotes en una **capacidad** de **respuesta** más **rápida**, cercana a la capacidad de las aplicaciones de escritorio. No obstante esta mejora en la respuesta de las aplicaciones Web conlleva un precio: aumento significativo en la complejidad de la programación, mayor ocupación de la red, nuevos diseños web para mejorar la experiencia del usuario, etc...

![image-20241019021737449](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241019021737449.png)

Las tecnologías que forman Ajax son:

- XHTML y CSS, para crear una presentación estándar.
- DOM, para la manipulación dinámica de la presentación.
- XML, XSLT y JSON para el intercambio de información
- XMLHttpRequest, para el intercambio asíncrono de información.
- Un lenguaje de servidor como PHP o ASP.NET para procesar las peticiones en el servidor y enviar las respuestas.



## Formulario con AJAX

Con Ajax, podemos realizar el submit de los forms. Esta utilidad nos permite poder realizar el envío de los datos del formulario sin tener que recargar la página. 

![image-20241019022555493](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241019022555493.png)



## Formulario con AJAX 2

Además de la ejecución del envío de formularios con AJAX, podemos realizar más funciones referidas a estos con AJAX. Por ejemplo podemos realizar llamadas a web services o validaciones de los formularios de forma dinámica, sin tener que crear interceptores o validadores aparte.



## FreeMarker, Velocity y Profiling

**Freemarker** es un motor basado en el **lenguaje Java** que se utiliza para las situaciones en las que una acción debe ser utilizada pero se encuentra fuera del contenedor de un Servlet.

Por ejemplo si quieres utilizar en tus aplicaciones algunas acciones de un plugin, puede que quieras utilizar **Freemarker** para poder alcanzar sus **clases** y **vistas.**

**Velocity** es similar a **freemarker** en cuanto a finalidad se refiere. Ya que ayuda a alcanzar las acciones que se encuentran fuera del ámbito del **Servlet.**

**Profiling** se puede definir como el análisis de rendimiento de las aplicaciones en un sistema. Este puede ser utilizado en el código fuente o sobre un binario ejecutable mediante la herramienta **profiler.**



## Integración con Spring e Hibernate

La integración de Spring supone un gran avance para corregir los fallos que Struts presenta en su funcionamiento. Se pueden nombrar algunas ventajas bastante importantes:

La integracion de Spring supone un gran avance para corregir los fallos que Struts presenta en su funcionamiento. Se pueden nombrar algunas ventajas bastante importantes:

- La visión entre el modelo, la vista y el controlador es mucho más clara.
- Spring no necesita de heredar de tantas clases como Struts para realizar determinadas acciones, como por ejemplo al utilizar los formularios.
- Spring no está basado únicamente en el uso del formato JSP.



Hibernate es un servicio de persistencia en objetos relacionales de alto rendimiento cuya licencia está bajo GNU y es totalmente gratuito. Este nos permite gestionar las conexiones con bases de datos desde Struts de forma organizada y muy segura.

Para proceder con la integración debemos de configurar hibernate de forma que pueda ser utilizado en nuestra base de datos y obtenga todos los objetos y registros sin ningún tipo de incompatibilidad.



## Migración desde versiones anteriores.

 Struts permite un sistema de versiones totalmente retrocompatible. Esto quiere decir que sea cual sea la versión en la que te encuentres siempre vas a poder pasar a la última versión sin ningún tipo de problema.

Pero aunque esto sea así, siempre se recomienda realizar la desinstalación de la versión anterior y descargar de nuevo la versión totalmente nueva del software.



## Recuerda

- **Struts 2**: surgió de la combinación entre Struts 1 y otro framewoek creado por otros desarrolladores llamado WebWork.
- **XML**: Struts 2 se basa en la estructura formada por XML y JAVA de forma conjunta en clases.
- **MVC:** Struts 2 se basa en el modelo MVC para una ejecución más potente, con gran accesibilidad y una resolución de los problemas de diseño que ocurrían antes de comenzar a utilizarlo.
- **Acciones:** Las acciones de Struts son clases Java que se ejecutarán cuando se realicen peticiones a estas.
- **Vistas:** En Struts las vistas son archivos de formato JSP que permiten la interacción con el usuario, pero son llamados results.
- **Struts.xml:** Este fichero contiene las acciones del framework. Para que entren en el rol de  funcionales las acciones deben estar declaradas en este fichero.
- **Interfaces:** Nos permiten obtener nuevas funciones o métodos en nuestras clases para poder realizar las acciones que necesitemos con estas.
- **Tag:** La función principal de una Tag en Struts es para crear uniones mediante el uso de links a otros recursos de la aplicación local
- **Pila de valores:** Consiste en un almacén donde pueden guardarse todo tipo de variables de forma que tengamos un acceso desde cualquier parte de nuestra aplicación a todas las variables que se encuentren en su interior.



# Spring MVC

## Introducción

En este tema veremos el acceso a datos mediante **SPRING MVC** y segurizarlo y testearlo así como conoceremos la programación orientada a aspectos y profundizaremos en las capacidades específicas de Spring.



## Objetivos

- Conocer el acceso de datos especiales para su uso.
- Aprender las capacidades específicas de Spring.



## Mapa conceptual

![image-20241021103700244](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241021103700244.png)



## Introducción a Spring

En el **2001** el API de Java **Servlet** y el modelo de Enterprise **Java Beans** eran las plataformas **imperantes** para las aplicaciones web. Estos dos estándares fueron **creados** por la hoy extinta **Sun Microsystems** colaborando con otras compañías y desarrolladores que contaban con bastante **popularidad** en la comunidad de desarrollo en Java. Esta aplicaciones no se basaban en **soluciones web**, como las aplicaciones cliente o aplicaciones **batch**, que podían escribirse con la base de utilidades y proyectos **open source y comerciales** que van a proveer las necesidades que requerían aquellos proyectos.

Se compuso un equipo pequeño de **desarrolladores** cuyo fin era ampliar el **framework** y crearon para ello un proyecto en **Sourceforge** en el año 2003. Tras más de un año de trabajo llegó la versión 1.0 en el 2004. Tras este lanzamiento, **Spring** se popularizó entre la comunidad, en parte gracias al empleo de **Javadoc** y la disponibilidad de una documentación para los desarrolladores muy por encima del resto de **proyectos open source**.



**Spring** es un framework basado en el patrón Modelo-Vista-Controlador. **MVC** es un patrón arquitectónico de software cuyo fin es **separar** en una aplicación los **datos** y la **lógica** de negocio de la interfaz de usuario y de la parte que se encarga de la gestión de eventos y comunicaciones. Para lograrlo Modelo Vista Controlador propone una **separación en tres capas diferenciadas ** que son el modelo, la vista y el controlador, de ahí su nombre. Esto es, **primero** define los elementos destinados a **representar** la **información** y a interactuar con el usuario, por otra **define** los **procedimientos** para tratar tanto la información y transformas las peticiones y respuestas del servidor y del cliente y por último se encarga de **trabajar** con la **recuperación** y almacenamiento propiamente dicho de los datos. Este patrón de arquitectura se fundamenta con la reutilización de código y en la separación de los distintos conceptos que conforman la aplicación, persiguiendo facilitar el desarrollo  y el mantenimiento de las aplicaciones.

Aunque originalmente **MVC** se diseñó para programas de escritorio se ha ido **adaptando** a multitud de **arquitecturas** para el diseño e implementación de aplicaciones web con la mayoría de **lenguajes de programación**. Multitud de frameworks tanto comerciales como no comerciales se ha desarrollado implementando este patrón. La **diferencia** entre estos últimos es cómo **interpretan** las funciones de Modelo, vista y controlador entre el cliente y el servidor. 

La finalidad de Spring es facilitar el desarrollo de aplicaciones web con Java. Sus características son:

- **Simplicidad y acoplamiento débil:** pretende ser simple y se basa en la inyección de dependencias para obtener un acoplamiento débil. En resumen **inyección de dependencias** es un patrón software en el que un módulo suministra los objetos ya creados en lugar de que la propia clase los cree.
- **Es un contenedor**: es más que un framework normal, es un contenedor que gestiona el ciclo de vida de los objetos y como se relacionan entre ellos.
- **Ligero**: es muy rápido en tiempo de procesamiento y no es intrusivo a la hora de programar. Esta es una de sus características más importantes.
- **Orientado a aspectos**: soporta la programación orientada a aspectos, lo que permite facilitar una capa de servicios que son ideales para este tipo de programación como auditoría, o gestión de transacciones.



En Spring hay diversos módulos que se pueden utilizar en el desarrollo. Cada programador agrega los módulos que necesite. **Spring Core** es el núcleo de Spring, es el único módulo que **obligatoriamente** debemos utilizar en Spring, ya que contienen entre otras cosas la DI (inyección de dependencias) y la configuración.

Otros módulos conocidos son:

- **AOP**: para trabajar con aspectos.
- **DAO**: para trabajar con base de datos.
- **MVC**: para la capa web.
- **JMS**: para mensajería.
- **Security:** para el control de seguridad.



## Spring MVC

**Spring** es un framework basado en el patrón Modelo-Vista-Controlador. En Spring las peticiones pasan por un Servlet, el **DispatcherServlet**, este delega las peticiones a controladores los cuales llevan a cabo la lógica de negocio. El DispatcherServlet necesita conocer a que controlador corresponde cada petición, de esto se ocupa el **HandlerMapping**, si no hemos configurado uno por defecto se utilizará la clase **BeanNameUrlHandlerMapping**.

![image-20241021110047797](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241021110047797.png)

Representación de la comunicación de los componentes de Spring.



Como podemos ver el DispatcherServlet sirve de punto de entrada en las peticiones. Se la entrega a una clase HandlerMappin y esta le da el controlador apropiado. El controlador procesa la petición y devuelve un modelo (datos) y una identificación de que vista usar. ViewResolver se ocupa de devolver la vista al DispatcherServlet y este obtiene la respuesta a devolver.

### Estructura de un controlador

![image-20241021110451188](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241021110451188.png)

En Spring 2.5 se introdujo un modelo de programación basado en anotaciones para los controladores, existen anotaciones como **@RequestMapping, @RequestParam, @ModelAtrribute**, etc. El soporte de anotaciones también se soporta con Servlet MVC y Portlet MVC. Los controladores que siguen este estilo no tienen que extender una clase específica ni implementar determinadas interfaces. Es más normalmente no tienen una dependencia directa con las APIs de Servlet o Portlet. Sin embargo su accesos es fácilmente configurable.

Con la siguiente anotación:

Se **define** una **URL** cuyas peticiones serán tratadas por el controlador en este caso peticiones **GET y POST** que son implementadas en el ejemplo. Una petición GET es el resultado de por ejemplo un usuario que consulta la página con un explorador web y POST cuando se envíen datos a través de un formulario. Hay otros tipos que se pueden emplear como **PUT y DELETE** pero lo más habitual es usar **GET y POST**.

```Java
@RequestMapping(value="/ventas/detalle");
return "ventas/detalle";
```

Así mismo es posible ver cómo **devuelve** una **secuencia** de texto tanto el método **GET como el método POST:**

Esta cadena indica la **ubicación** de la vista (sin la extensión .jsp), se traduciría a la ruta definida en configuración para las vistas generalmente en WEB-INF/views. Si por ejemplo se necesita **redireccionar** al usuario a **otra página** o dirección externa, podemos hacerlo con la instrucción: 

- En versiones anteriores a la 2 se devolvía un objeto ModelAndView devolviendo un String se evitan dependencias y se ahorra código.

  ```Java
  return "redirect/NUEVA_URL";
  ```

- La nueva URL puede ser también la ubicación de una vista. Ahora en el caso del método post(), se observa entre los parámetros:

  ```java
  @Valid @ModelAttribute("forma") Entidad forma
  <form:form method="post" commandName="forma">
  ```

  Significa que un formulario web envía la **información** usando dicha **entidad**, de la siguiente manera:

  Observamos también la instrucción @Valid junto a la variable:

  ```java
  BindingResult result
  ```

  Su función es realizar una **validación**  de los **parámetros** que se ha enviado por medio de la entidad del formulario y **guardar el resultado** del procedimiento **en una variable result**. Por ejemplo:

  ![image-20241021111931524](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241021111931524.png)

- Si el cliente en el formulario web manda un **espacio en blanco**, una letra acentuada, un subrayado u otro carácter inválido que no coincida con la **expresión regular** , debe mostrarse el error previsto en la variable mensaje. Esto se haría tal que así:

  ![image-20241021112119049](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241021112119049.png)

- Viendo este ejemplo, si hay errores en el formulario, se **devuelve **a la vista **empleando** la variable **model**. En el GET es posible ver como se ha cargado la página inicializando el **formulario con la instrucción siguiente:**

  ```java
  model.addAttribute("forma", new Entidad());
  ```

- Recordamos también que en la vista, para que el formulario muestre el mensaje de error debe tener la siguiente instrucción:

  ```java
  <form:errors class="invalid" path="usuario"/>
  model.addAttribute("session", usuario);
  ```



### Manejo de Sesiones

Para utilizar una sesión con el mismo nombre, agregamos al inicio de la clase la anotación:

```java
@Controller
@RequestMapping(value="/ventas/detalle")
@SessionAttributes({"session"})
public class Ventas_detalleController
{

}
```

Ahora cuando se hace esta **definición** existe **muchas** maneras de **implementar la sesión**, esto es que se ha consultado la bbdd y el usuario y contraseña sean correctos:

- Aquí se envía la **variable**  sesión a la **vista**, esta contiene una entidad que se llama usuario la cual contiene el nombre, apellido, teléfono y demás detalles que determinan al usuario de la sesión.

- En el paso que sigue nos ponemos en el **supuesto** de que el usuario va a **otro módulo en la página**, existen dos maneras de **obtener la variable de sesión** y realizar la validación del usuario que realiza la consulta:

  ```java
  @RequestMapping(method=RequestMethod.GET)
  public String get(HttpSession sesion, Model model){
  	Usuario sesion_usuario = session.getAttribute("session")!=null ? (Usuario) session.
  }
  ```

  En este caso se valida que el atributo guardado en la **estructura** de sesión **no sea nulo** y en caso contrario se hace un **casting** del objeto a Usuario. Para finalizar, cerramos la sesión de esta manera:

  ```java
  if(model.containsAttribute("session")) model.asMap().remove("session");
  ```

- Recibir **parámetros** por la **URL** y nuevos campos en el **formulario POST**.

También podemos captar parámetros como parte de la URL. Por ejemplo podemos obtener la id del usuario que se va a editar, en este caso:

```java
@RequestMapping(value="/ventas/editar/{id}")
```

Ahora en los métodos GET y POST **agregamos** la siguiente **variable:**

```java
@RequestMapping(method=RequestMethod.GET)
public String get(@PathVariable(value="id") int id, Model model, HttpSession session)
```

Ahora si se desea mandar una variable por medio de un **formulario** que no se encuentra en la **entidad**, se agrega así:

```java
<input type="hidden" name="mi_variable" valor="1" />
```

Puede ser cualquier campo válido para un **formulario HTML **(select, text, textarea,...), esto es, no usamos la **biblioteca** de **Spring** y enviamos esta **variable por separado:**

```java
@RequestParam(value = "im", required = false) MultipartFile im 
@RequestParam(value= "mi_variable", required = true) int mi_variable    
```

La **instrucción anterior** la agregamos a los **parámetros** que recibe el método **POST**. Esto puede ser útil cuando por ejemplo en la base de datos guardamos la imagen como **File** y no como **MultipartFile**, en ese caso tenemos que coger la imagen que se ha enviado por el form y transformarla en File:

En la anotación anterior, la imagen enviada por el **formulario es opcional.**



## Acceso a datos

Uno de los grandes problemas que tiene hoy en día el desarrollo de aplicaciones Web en **Java** es que el ciclo de **desarrollo** es, en muchas ocasiones, **demasiado largo** (o por lo menos mas largo de lo que nos gustaría).

Debido a este problema han surgido **alternativas** del estilo de **Ruby** on **Rails** (http://rubyonrails.org) o incluso **Google App Engine** (http://code.google.com/appengine/) una alternativa que propone Google, basada en lenguaje Python.

Todas estas alternativas pueden resultar muy interesantes, pero suelen estar basadas en lenguajes con chequeos de tipo débil, o trasladando el chequeo de tipos a tiempo de ejecución (como Python), lo que provoca que puedan ser muy útiles para hacer rápidamente pequeñas aplicaciones o prototipos, pero que se pueden convertir en un gran problema cuando queremos construir aplicaciones medianas o grandes donde intervienen varias personas o incluso equipos en el proceso de desarrollo. Para este caso de aplicaciones medianas o grandes y grupos de desarrollo colaborativos, se hace necesario un lenguaje fuertemente tipado, donde podamos definir jerarquías de tipos (clases o interfaces) en las que el resto del equipo se pueda apoyar para desarrollar sin riesgos.

En este apartado veremos como gracias a **Spring + Hibernate + Anotaciones** podemos conseguir un desarrollo tan rápido como el que queremos conseguir con las alternativas antes mencionadas.

Vamos a ver las Anotaciones de Java 5 para, basándonos en el concepto de "convención frente a configuración", centrarnos en el código, olvidarnos de la base  de datos y de esos tediosos ficheros de configuración en XML.

  Si luego queremos hacer ciertos refinamiento, o virguerías, los XML siempre estarán esperándonos para poder sobreescribir el comportamiento establecido con las anotaciones.



Vamos a hacer una **pequeña aplicación** donde se muestre un listado de productos. Podría quedar algo como:

![image-20241022093059979](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241022093059979.png)

Y la pantalla de edición de productos:

![image-20241022093211960](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241022093211960.png)

**La capa de persistencia**

Vamos a empezar de "de abajo a arriba", es decir, partiremos definiendo nuestras entidades persistentes con Hibernate, e iremos "subiendo" hasta la capa de presentación y control con JSF, pasando antes por el negocio (el modelo) con Spring.



### Las entidades

En nuestro ejemplo solo tenemos la entidad producto, con los atributos nombre, descripción y precio.

Vemos como nos quedaría la clase:

Podemos ver como se trata de una clase totalmente normal, donde en la línea 1 anotamos que se trata de una entidad, y en las líneas 3 y 4 indicamos cual es el id de la entidad y que este id será generado por la base de datos.

![image-20241022093542873](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241022093542873.png)

Cabe destacar dos cosas:

- Todas las anotaciones usadas pertenecen al estándar de JPA por lo que son válidas tanto para Hibermate como para EJB3.0
- Hemos anotado un atributo privado que no se usa en ningún sitio, ni siquiera tenemos getter o setter. Esto lo haremos a posta ya que es algo que gestionará internamente Hibernate y queremos condicionar lo menos posible nuestro diseño (nuestro negocio).



### El DAO

El DAO es el **Data Access Object**, es decir, será la clase donde resida la lógica de manejo de Hibernate o (JDO o JDB o JPA o ...) De esta forma conseguiremos que nuestra lógica de negocio no sepa nada de Hibernate , y siempre que quiera acceder a los datos lo hará usando esta clase.

![image-20241022095048961](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241022095048961.png)

Veamos un ejemplo sencillo:

- Primero definimos una interfaz, así podemos intercambiar la implementación fácilmente si algún día nos cansamos de Hibernate (no lo creo)
- Para el ejemplo solo hemos definido algunas operaciones simples. Ahora veamos una posible implementación usando las facilidades que nos proporciona Spring + Hibernate:

No es el ámbito de este tutorial estudiar la implementación de los métodos, para más información sugiero al lector repasar otros tutoriales relacionados o acudir a la documentación de Spring e Hibernate y la documentación sobre Generics de Java.

![image-20241022095857556](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241022095857556.png)

Aunque el lector en un principio no entienda la implementación lo que creo que queda claro es que es sencilla, puesto que se limita a unas pocas líneas (de nuevo sugiero repasar la documentación).

Donde si vamos a hacer **especial hincapié** es en las nuevas anotaciones que nos han aparecido:

- En la línea 1 nos encontramos con **@Repository.** Esta es una anotación de Spring. Estamos indicando que esta es una clase relacionada con la capa de persistencia, y que debe ser un Singleton (sólo habrá una instancia de la clase HibernateDaoSupport), y todos los Threads de la aplicación la compartirán).

  Nota: Singleton : es un patrón de diseño creacional que nos permite asegurarnos de que una clase tenga una única estancia

- En la línea 4 nos encontramos con **@Autowired.** Esta es una anotación de Spring. Sirve para indicarle a Spring que cuando vaya a crear la instancia de HibernateDaoSupport debe "inyectarle" (pasarle) en el constructor una referencia al SessionFactory (el SessionFactory sí lo configuraremos mediante XML, lo veremos más adelante).

- Por último, en la línea 9,14, 20 ... nos encontramos con la anotación **@Transactional**. Esta es una anotación de Spring. Estamos indicando que el método en cuestión es transaccional. Lo que hará Spring es comprobar si ya existe una transacción abierta, si existe se unirá a ella, y si no existe, abrirá una nueva transacción (este comportamiento es configurable). De esta forma nos aseguramos que toda operación de la base de datos se realiza dentro de una transacción. Además si durante la ejecución del método se produce alguna excepción de Runtime, se hará automáticamente rollback de la transacción (este comportamiento también es configurable).



Ya hemos terminado con la capa de persistencia. En ningún momento hemos visto sentencias SQL, ni siquiera para crear las tablas de la base de datos. Más adelante veremos cómo configuramos Hibernate para que se encargue de crearnos las tablas automáticamente (Los ficheros de configuración los veremos todos al final, por ahora sigamos con el código de Java).

**La capa de negocio**

En esta aplicación el negocio no es gran cosa, poco más que obtener los productos o guardarlos, así que la clase nos va a quedar muy sencillita:

![image-20241023114031929](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241023114031929.png)

Haciendo una clase tan sencilla y que lo único que hace es delegar en el DAO, hay quien me podría acusar de estar cayendo en el antipatrón "Poltergeist", ya que desde control podríamos usar directamente el DAO para recuperar o guardar los productos, y quitarnos esta clase de enmedio. Peno no creo que este sea el caso ya que prima el MVC y el bajo acoplamiento.

Siempre debemos intentar que la capa de control y presentación sean lo más tontas posibles. Pensar por un momento que no usamos esta clase "manager" y que usamos el **DAO** desde las **clases de control de JSF (los managed-beans)**, si ahora quisiéramos montar un web service para aprovechar esta aplicación desde otras aplicaciones ¿Cuánto código que ya habríamos escrito en el managed-bean tendríamos que repetir en el web service?

Anotaciones:

- En la línea 1 nos encontramos con **@Service**. Esta es una anotación de Spring, similar a @Repopsitory. Estamos indicando que esta es una clase relacionada con la capa de servicio (clases de negocio) y que debe ser un Singleton.
- En la línea 4 nos encontramos con **@Resource**. Esta anotación es del estándar, por lo que es válida tanto con Spring como con EJB3.0 Esta indicado que al crear la instancia de esta clase se debe "inyectar" (inicializar) en este atributo una referencia a la instancia del DAO ( es la instancia que habíamos declarado anteriormente con @Repository).

Vamos a implementar el control con los **managed-beans de JSF**. Como tenemos dos pantallas podemos hacer dos managed-bean.

![image-20241023115633191](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241023115633191.png)

El de la pantalla con el listado de productor nos podría quedar algo como:

Fijándonos en la **clase de listado** las nuevas anotaciones que aparecen son:

- En la línea 1 nos encontramos con **@Controller**. Esta es una anotación de Spring similar a @Repository o @Service. Esta es una clase relaciona con la capa de control.
- En la línea 2 nos encontramos con **@Scope("session")**. Esta es una anotación de Spring. Con ella estamos sobreeescribiendo el comportamiento por defecto de Spring, que es hacer Singletons, y le estamos diciendo que nos cree una instancia diferente de esta clase por cada sesión Http. Es decir, cada usuario tendrá su propio managed-bean,
- Desde la línea 5 hasta la 9. La anotación **@Resource** , está "inyectando" la referencia al manager (la clase de negocio) y la referencia a otro managed-bean de la capa de control de JSF, es decir, Spring es capaz de gestionar las dependencias entre los diferentes managed-beans de JSF.

La clase para la edición de los productos:

![image-20241023115748099](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241023115748099.png)



**La capa de presentación**

Está implementada con JSF + Facelets + ICEfaces, pero no tiene nada de especial. Es decir la construiremos como habitualmente se trabaja con estas tecnologías.

![image-20241023120531536](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241023120531536.png)

Cuando queramos acceder a los managed-beans desde el Expression Language simplemente lo haremos por ejemplo:

**HIBERNATE.CFG.XML** (Configuración de Hibernate)

![image-20241023120712532](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241023120712532.png)

En la línea 9 es donde le estamos diciendo a Hibernate que queremos que nos cree las tablas al arrancar la aplicación. Ojo porque si las tablas ya existen las borra primero, es decir, esto puede ser muy conveniente para desarrollo o pruebas, pero no para producción!! Lo que podemos hacer es, una vez creadas hacer un "export" de la base de datos para obtener los scripts de creación que podemos retocar para dejarlos listos para producción (pero nos ahorramos lo gordo).

**ApplicationContext.xml** (Configuración de Spring)

![image-20241023121054593](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241023121054593.png)

![image-20241023121214647](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241023121214647.png)

Puede parecer que hay mucho pero en realidad solo hay 4 cosas:

- Configuración de Spring para que haga caso las anotaciones.
- Definir el datasource (de hibernate, del servidor por jndi, ...)
- Definir el sessionFactory de Hibernate.
- Definir el transactionManager (el de hibernate, JTA,...)

No hay ni una sola definición de bean de clases que hayamos escrito nosotros, de forma que este fichero se mantendrá constante con independencia de los beans que tenga nuestra aplicación.

**Faces-config.xml** (Configuración de JSF)

![image-20241023122147733](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241023122147733.png)

 Se puede apreciar como solo hay configuración general de JSF y reglas de navegación. Pero no declaramos ningún managed-bean. Esto funciona gracias a la línea 13 donde se le indica a JSF que debe delegar en Spring para buscar los managed-beans. Es decir, JSF los buscará entre los que declaremos en el fichero (si es que declaramos alguno, que no es nuestro caso), y si no lo encuentra, lo buscará en Spring.

Como se puede comprobar, también nos ahorramos escribir cantidad de código en ese XML.

Diferencia entre las anotaciones @Repository, @Service, @Controller.

 La diferencia es básicamente semántica, es decir, cada una denota perfectamente a que "capa" corresponde la clase anotada. Pero todas se comportan de igual manera (por ejemplo en todas nuestras clases podríamos haber usado la anotación @Service y hubiera funcionado igual).

Esto se consigue porque las  tres anotaciones extienden la anotación **@Component.**

El hecho de usar anotaciones diferentes puede ser muy interesante si luego queremos aplicar aspectos (AOP = Aspect Oriented Programming) a todas las clases de una misma capa. Es decir, por ejemplo, puedo hacer una regla para aplicar cierto advice a todas las clases con la anotación **@Controller**.



## Programación orientada a Aspectos (AOP)

Con bastante frecuencia, necesitamos producir **fragmentos de código diseminados** por la totalidad o gran parte de la aplicación, para plasmar la **lógica de alguna propiedad o características del sistema**, con las dificultades asociadas al mantenimiento y al desarrollo. Este problema es conocido como **scattered code**, que se puede traducir como código disperso. Otro problema puede surgir, es que en un módulo concreto tenga que implementar varios aspectos de la aplicación a la vez. Este problema es conocido como **tangle code**, que se puede traducir como **código enmarañado.** A día de hoy existen algunos rumbos de diseño complicados de capturar, porque algunos problemas no pueden encapsularse de manera clara de la misma manera con la que normalmente resolvemos la definición de otra funcionalidad u otros objetos.

La **Programación Orientada a Aspectos o AOP** (Aspect Oriented Programming) es un paradigma de programación cuya intención es formalizar y representar de forma concisa los elementos que son transversales (comunes) a todo el sistema. De esta forma se componen una aplicación de entidades bien definidas, eliminando las dependencias entre los módulos.

En la **orientación a objetos**, el sistema se basa en la idea de **clases y sus jerarquías**. La herencia permite modularizar el sistema, evitando la **duplicación de código**. Sin embargo, hay aspectos que son comunes a todo el sistema, como por ejemplo un sistema en el que se debe verificar que el usuario tenga permiso para manipular un objeto:

![image-20241025112254570](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241025112254570.png)

Como se puede ver, **se puede minimizar la repetición de código**, tenemos una llamada en cada método y una sentencia **throws**, pero es prácticamente imposible reducir aún mas la repetición.

**Objetivo:** la Programación Orientada a Aspectos tiene la misión principal de separar las funcionalidades en el sistema. Por una parte las funcionalidades habituales empleadas en la aplicación. Por otra parte, la funcionalidad intrínseca de cada parte.

**Conceptos básicos de AOP**:

- **Aspecto (Aspect):** es una funcionalidad transversal (cross-cutting) que se implementara de forma modular y separada del resto del sistema.
- **Punto de Cruce o de Unión (Join point)**: es un punto de ejecución dentro del sistema donde un aspecto puede ser conectado, como una llamada a un método, el lanzamiento de una excepción o la modificación de un campo. El aspecto será insertado en el flujo de ejecución de la aplicación para ampliar su funcionalidad.
- **Consejo (Advice)**: es la implementación del aspecto, dicho de otra manera, un Aspecto puede alterar el comportamiento en el código aplicando un Consejo (comportamiento adicional) en un Punto de Unión.
- **Puntos de Corte (Pointcut)**: define los Consejos que se aplicarán a cada Punto de Cruce. Se especifica mediante Expresiones Regulares o mediante patrones de nombres (de clases, métodos o campos), e incluso dinámicamente en tiempo de ejecución según el valor de ciertos parámetros.
- **Introducción (Introduction)**: permite añadir métodos o atributos a clases ya existentes. Por ejemplo supongamos que queremos mantener la información de la última modificación a un objeto, para ello crearíamos un Consejo de Auditoría que mantenga dicha información, mediante una variable y un método, que serían introducidos en todas las clases (o sólo en algunas) para tener esta nueva funcionalidad.
- **Destinatario (Target)**: con target nos referimos a la clase "aconsejada".
- **Intermediario (Proxy)**: es el objeto resultante de aplicar el Consejo al Destinatario, cuando se llama a un método de un objeto que ha sido "aconsejado" es el intermediario el que recibe y redirige la llamada al objeto original o al método definido en el Consejo.
- **Tejido (Weaving)**: es el proceso de Aplicar Aspectos a los Objetos Destinatarios para crear los nuevos Objetos Resultantes en los especificados Puntos de Cruce. Este proceso puede ocurrir a lo largo del ciclo de la vida del Objeto destinatario:
  - Aspectos en Tiempo de Compilación, que necesita un compilador especial.
  - Aspectos en Tiempo de Carga, los Aspectos se implementan cuando el Objeto Destinatario es cargado. Requiere un ClassLoader especial.
  - Aspectos en Tiempo de Ejecución.



Dispersión del codigotecnologías

Diferentes referencia

Múltiples tecnologías

![image-20241025124357021](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241025124357021.png)

Ilustración sobre el funcionamiento de la Programación Orientada a Objetos.



Un punto de corte o pointcut es un punto de interés en el código antes, después o "alrededor" del cual queremos ejecutar algo (un advice). Un pointcut no puede ser cualquier línea arbitraria de código. La versión actual de Spring solo soporta puntos de corte en ejecuciones de métodos de beans. La implementación completa de AspectJ permite usar también el acceso a campos, la llamada a un constructor, etc, auqnue esto en AOP de Spring no es posible.

Es importante destacar que al definir un pointcut realmente no estamos todavía diciendo que vayamos a ejecutar nada, simplemente marcamos un "punto de interés". La combinación de **pointcut + advice** es la que realmente hace algo útil. Por ello, los ejemplos dados en este apartado por sí solos no tienen demasiado sentido, no hay que intentar probarlos tal cual, aunque aquí los explicaremos aislados para poder describir con cierto detalle su sintaxis antes de pasar a la de los advices.

Lo que sigue es un conjunto de ejemplos que ilustran las opciones más comunes para pointcuts, no una referencia exhaustiva, que no tendría sentido estando ya la documentación de Spring y la de AspectJ para ello.



**Expresiones más comunes:**

- **execution()**

  La expresión más usada en pointcuts de Spring es execution(), que representa la llamada a un método que encaje con una determinada signatura. Se puede especificar la signatura completa del método incluyendo tipo de acceso (public, protected,...), tipo de retorno, nombre de clase (incluyendo paquetes) , nombre de método y argumentos. Teniendo en cuenta:

  - El tipo de acceso y el nombre de la clase son opcionales, pero no así el resto de elementos.

  - Podemos usar el comodín * para sustituir a cualquiera de ellos, y también el comodín ., que sustituye a varios tokens, por ejemplo varios argumentos de un método, o varios subpaquetes con el mismo prefijo.

  - En los parámetros, () indica un método sin parámetros, (..) indica cualquier número de parámetros de cualquier tipo, y podemos también especificar los tipos, por ejemplo (String,  *, int) indicaría que un método cuyo primer parámetros es String, el tercero int y el segundo puede ser cualquiera.

  

  Por ejemplo, para especificar todos los métodos con acceso "public" de cualquier clase dentro del paquete es.ua.jtech.aop pondríamos:

  ```java
  execution(public * es.ua.jtech.aop.*.*(..))
  ```

  Donde el primer * representa cualquier tipo de retorno, el segundo * cualquier clase y el tercer * cualquier método. Los .. representan cualquier conjunto de parámetros.

![image-20241025125759109](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241025125759109.png)

​			Algunos ejemplos más de execution()



- **whitin()** 

  Permite especificar todas las llamadas a métodos dentro de un paquete o subpaquetes del mismo (usando el comodín .. al igual que en la sintaxis de execution()).

  ```java
  //Cualquier llamada a método dentro del paquete es.ua.jtech o subpaquetes
  within(es.ua.jtech..*)
  ```

- **args()**

  Permite especificar el tipo deseado para los argumentos. No se suele usar tal cual, sino combinado con execution como un "truco" para darle nombre a los argumentos (ver el apartado siguiente).

  ```java
  //Cualquier método que tenga un solo parámetro que implemente Serializable
  args(java.io.Seriazable)
  ```

  

### Combinar pointcuts

Se puede combinar pointcuts usando los operadores lógicos &&, || y ! con el mismo significado que en el lenguaje C. Por ejemplo:

```java
//Todos los getters o setters de cualquier clase
execution(public *get*()) || execution (public void set*(*))
execution (public void set*(*)) && args(nuevoValor)
```

El operador && se suele usar en conjunción con args como una forma de "dar nombre" a los parámetros, por ejemplo:

Encajaría con un setter cualquiera, dándole el nombre nuevoValor al parámetro pasado al mismo. Veremos la utilidad de esto, cuando definamos advices, como método para acceder al valor del parámetro.

#### Pointcuts con nombre

Se le puede asignar un nombre arbitrario a un pointcut (lo que se denomina signatura). Esto permite referenciarlo y reutilizarlo de manera más corta y sencilla que si tuviéramos que poner la expresión completa que lo define. La definición completa consta de la anotación @Pointcut seguida de la expresión que lo define y la signatura. Para definir la signatura se usa la misma sintaxis que para definir la de un método Java en un interfaz. Eso sí, el valor de retorno debe ser void. Por ejemplo:

```java
@Pointcut("execution(public * get())")
public void unGetterCualquiera(){}

@Pointcut("whitin(es.ua.jtech.ejemplo.negocio.*)")
public void enNegocio() {}

@Pointcut("unGetterCualquiera() && enNegocio()")
public void getterDeNegocio() {}
```

Esta signatura se puede usar por ejemplo al combinar pointcuts.



### Advices

Con los advices ya tenemos la pieza del puzzle que nos faltaba para que todo cobre sentido. Un advice es algo que hay que hacer en un cierto punto de corte, ya sea antes, después, o alrededor (antes y después) del punto.

Los advices se especifican con una anotación con el pointcut y la definición del método Java a ejecutar (signatura y código del mismo). Como en Spring los puntos de corte deben de ser ejecuciones de métodos los casos posibles son:

- Antes de la ejecución de un método (anotación @Before)
- Después de la ejecución normal, es decir, si no se genera una excepción (anotación @AfterReturning)
- Después de la ejecución con excepción/es (anotación @AfterThrowing)
- Después de la ejecución, se hayan producido o no excepciones (anotación @After)
- Antes y después de la ejecución (anotación @Around).

Un aspecto (aspect) es un conjunto de advices. Siguiendo la sintaxis de AspectJ, los aspectos se representan como **clases Java**, marcadas con la anotación **@Aspect**. En Spring, además, un aspecto debe ser un bean, por lo que tendremos que anotarlo como tal.

 ![image-20241025132218728](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241025132218728.png)



#### @Before

Esta anotación ejecuta un advice antes de la ejecución del punto de corte especificado. Por ejemplo:

![image-20241025132338715](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241025132338715.png)

Ejecutaría controlaPremisos() antes de llamar a cualquier getter.



#### @AfterReturning

Esta anotación ejecuta un advice después de la ejecución del punto de corte especificado, siempre que el método del punto de corte retorne de forma normal (sin generar excepciones). Por ejemplo:

![image-20241025132538613](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241025132538613.png)

![image-20241025132616739](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241025132616739.png)

Evidentemente para hacer log nos puede interesar saber el valor retornado por el método del punto de corte. Este valor es accesible con la sintaxis alternativa:

Al poner Object como tipo de la variable asociada al valor de retorno, estamos indicando que nos da igual el tipo que sea (incluso si es primitivo). Especificando un tipo distinto, podemos reducir el ámbito del advice para que solo se aplique a los puntos de corte que devuelvan un valor del tipo deseado.



#### @AfterThrowing

Esta anotación ejecuta un advice después de la ejecución del  punto de corte especificado, si el método del punto de corte genera una excepción. Podemos tanto acceder a la excepción generada como restringir el tipo de las excepciones que nos interesan, usando una sintaxis como la siguiente:

![image-20241025135408307](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241025135408307.png)

El ejemplo anterior indicaría que no hay que ejecutar el advice a menos que la excepción generada sea del tipo DAOException, y nos permite acceder a su valor a través del parámetro daoe.

#### @After

Esta anotación ejecuta un advice después de la ejecución del punto de corte especificado, genere o no una excepción, es decir, al estilo del finally de Java. Se usa típicamente para liberar recursos y otras tareas habituales para finally.

#### @Around

Esta anotación ejecuta parte del advice antes y después de la ejecución del punto de corte especificado. La filosofía consiste en que el usuario es el que debe especificar en el código del advice en qué momento se debe llamar al punto de corte. Por ello, el advice debe tener como  mínimo un parámetro de la clase ProceedingJointPoint, que representa el punto de corte. Llamando al método proceed() de esta clase, ejecutamos el punto de corte. Por ejemplo:

![image-20241025140042273](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241025140042273.png)

Hay que destacar varias cuestiones del código anterior. Como ya se ha dicho, cuando queremos llamar al punto de corte invocamos a proceed(). Además debemos devolver como valor de retorno del advice devuelto por el punto de corte. Finalmente, si el método del punto de corte requiere parámetros, podemos pasarle un Object[].

**Acceder a los parámetros y otra información del punto de corte**

Sping ofrece al advice acceso tanto a los parámetros del método del punto de corte como a información adicional sobre el mismo. Ya hemos visto cómo acceder al valor de retorno, en el ejemplo de @AfterReturning, y a la excepción lanzada en el caso del @AfterThrowing.

![image-20241025140654897](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241025140654897.png)

Para hacer accesibles al advice los argumentos del punto de corte se puede usar args. Por ejemplo: 

Con esto enlazamos el valor del argumento del punto de corte con la variable nuevoValor, y además al poner int como tipo de nuevoValor indicamos que solo queremos aplicar el advice si el argumento del punto de corte es int.

Otra forma de hacer lo anterior sería usar un punto de corte "**con nombre**":

![image-20241025140911069](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241025140911069.png)

![image-20241025140954153](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241025140954153.png)

Podemos acceder a información sobre el punto de corte en el primer parámetro del advice si es de tipo JoinPoint. Esta clase tiene métodos para obtener por ejemplo la signatura del método del punto de corte, o sus argumentos, etc.



**Más de un advice para el mismo punto de corte**

Aunque no se ha dicho explícitamente hasta el momento, por supuesto se puede definir más de un advice que encaje con el mismo punto de corte. ¿Cuál es el orden de aplicación de los advices?

Para los **advices** especificados dentro del mismo aspecto, se puede tomar como regla básica que el orden de ejecución es el mismo que el de declaración. Es decir, que si declaramos varios advices de tipo before, se ejecutará primero el que primero aparezca declarado, y si declaramos varios de tipo after ocurrirá lo mismo (en realidad en el caso after si se piensa un poco se verá que el de mayor importancia es el que se ejecuta el último).

El caso en que tenemos advices definidos en aspectos distintos es más complejo, ya que en principio no está definida la precedencia por defecto y para especificarla hay que escribir algo de código Java. En concreto el aspecto debe implementar el interface org.springframework.core.Ordered. Remitimos al lector a la documentación de Spring para más información.

![image-20241025141653379](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241025141653379.png)

**AOP "implicita"** en Spring 3

La AOP constituye uno de los pilares en que se fundamenta Spring, incluso aunque nunla la usáramos en nuestros proyectos de modo explícito. A continuación resumimos alguno de los usos directos de AOP en el framework:

- **Transaccionalidad declarativa**: la gestión automática de las transacciones implica la intercepción AOP de los métodos marcados como transaccionales. El TransactionManager es el que intercepta los métodos y se encarga de crear nuevas transacciones, hacer rollback automáticos, etc. según sea necesario.
- **Seguridad**:  Spring Security es un proyecto que intenta mejorar la seguridad declarativa estándar de JavaEE, haciéndola más potente sin aumentar la complejidad de uso. Mediante este proyecto se puede por ejemplo controlar de manera declarativa el acceso a los métodos de los beans, de manera similar a como se hace en Servlets 3.0.



Pero va mucho más allá, permitiendo el uso de expresiones en el lenguaje **EL de Spring** para evaluar los permisos de acceso. Por ejemplo, queremos que también el propio usuario pueda borrar su cuenta, además del administrador.

- **authentication.name**: sería el login del usuario que se ha autentificado, y estamos intentando comprobar si corresponde con el del usuario que queremos borrar (el # nos da accesos al parámetro).

  ![image-20241025195157980](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241025195157980.png)

- **Spring Roo:** es un framework de desarrollo rápido de aplicaciones. Crea la estructura CRUD de la aplicación usando Spring en todas las capas (presentación, negocio y datos). Todo el código necesario se introduce de forma "no invasiva" usando AOP. Por ejemplo si decimos que queremos usar JPA en la capa de persistencia, Roo se encarga de convertir nuestra clase de dominio en una entidad JPA y de gestionar el Entity Manager y los métodos JPA básicos, pero todo este código no será visible directamente en nuestras clases y no nos "molestará". Todo esto se hace usando AspectJ, aunque es un uso más avanzado que el que nosotros hemos visto aquí.

- **Cache declarativa:** es una de las nuevas características incorporadas en la versión 3.1. Nos permite usar de manera transparente frameworks para gestión de caché ya conocidos y muy probados como Ehcache. Por ejemplo, podemos hacer que un método de un DAO cachee automáticamente los resultados sin más que usar la anotación correspondiente:

  ![image-20241025195739407](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241025195739407.png)

  Si ya se ha llamado anteriormente al método con el mismo valor de "isbn", en lugar de ejecutar el método, se sacará el LibroTO de la cache. Lo que está pasando es que con AOP se está interceptando el método con @Before y comprobando si es necesario o no ejecutarlo.



## Gestión de transacciones

En una base de datos una transacción es una secuencia de acciones que se tratan como una sola unidad de trabajo. Estas acciones se deben completar o no tener ningún efecto en absoluto, es decir si ocurre algún inconveniente en alguna instrucción la transacción se interrumpe y los cambios realizados no permanecen. La gestión de transacciones es una parte importante de toda aplicación empresarial orientada a un **Sistema de Gestión de Base de Datos Relacionales** (siglas en inglés RDBMS) para garantizar la integridad y la coherencia de los datos.

El concepto de transacciones se puede describir con las siguientes cuatro propiedades clave descritas como **ACID:**

- **Atomicity (Atomicidad):** una transacción debe ser tratada como una sola unidad de operación, lo que significa que toda la secuencia de operaciones es exitosa o no.
- **Consistency (Consistencia):** la consistencia de la integridad referencial de la base de datos, como claves primarias que deben ser únicas y sus referencias desde otras tablas.
- **Isolation (Aislamiento):** puede haber muchas transacciones siendo procesadas al mismo tiempo y con el mismo conjunto de datos. Cada transacción debe aislarse de otras para evitar la corrupción de datos.
- **Durability (Durabilidad:** Una vez que una transacción ha terminado, los resultados de esta transacción tienen que ser permanentes y no se pueden borrar de la base de datos debido al fallo del sistema.



Spring proporciona una capa de abstracción sobre las diferentes APIs de gestión de transacciones subyacentes. El soporte de transacciones de Spring tiene como objetivo proporcionar una alternativa a las transacciones de EJB agregando capacidades de transacción a POJOs. Spring soporta tanto la gestión programática como declarativa de transacciones.

Tradicionalmente, los desarrolladores de Java EE han tenido dos opciones para la gestión de transacciones: transacciones globales o locales, ambas opciones tienen determinadas limitaciones.

- Transacciones Globales:

  La gestión de transacciones globales se requiere en un entorno de computación distribuida en el que todos los recursos se distribuyen a través de múltiples sistemas.

  En tal caso, la gestión de transacciones debe realizarse tanto a nivel local como global. Una transacción distribuida o global se ejecuta en múltiples sistemas y su ejecución requiere la coordinación entre el sistema global de gestión de transacciones y todos los gestores de datos locales de los sistemas implicados.

- Transacciones Locales

  **Las transacciones locales son específicas a recursos**, como una transacción asociada a una conexión **JDBC.** Mientras que las transacciones globales pueden abarcar múltiples recursos en un sistema distribuido.

  La gestión de transacciones locales puede ser útil en un entorno informático centralizado en el que los componentes y recursos de las aplicaciones se ubiquen en un único sitio y la gestión de transacciones solo implique un gestor de datos local ejecutándose en una sola máquina. Las transacciones locales pueden ser más fáciles de usar, pero tienen notables desventajas: 

  - **no pueden funcionar a través de múltiples recursos transaccionales**. Por ejemplo, el código que administra las transacciones con una conexión JDBC no puede ejecutarse dentro de una transacción JTA global. Dado que el servidor de aplicaciones no participa en la administración de transacciones, no puede ayudar a garantizar la exactitud entre varios recursos. (Vale la pena señalar que la mayoría de las aplicaciones utilizan un único recurso de transacción). 
  - son invasivas al modelo de programación.



**Programático vs. Declarativo**

Como comentamos, Spring soporta dos tipos de gestión de transacciones:

- **Gestión programática de transacciones:** esto significa que la transacción se gestiona con la ayuda de la programación. Eso le da una flexibilidad extrema, pero es difícil de mantener. 
- **Gestión declarativa de transacciones:** en este caso se separa la gestión de transacciones de la lógica de negocio (código). En Spring solo se pueden utilizar las anotaciones o la configuración basada en XML para administrar las transacciones.

La gestión declarativa de transacciones es preferible a la gestión de manera programática, aunque lo declarativa es menos flexible que la programática la cual permite controlar las transacciones a través del código. Pero como una especie de característica transversal, la gestión declarativa de transacciones puede modularizarse con el enfoque AOP. Spring soporta la gestión declarativa de transacciones a través del marco AOP de Spring.



**Estrategia de transacciones en Spring**

La clave de abstracción de transacciones en Spring está definida por la interfaz **org.springframework.transaction.PlatformTransactionManager** que se muestra a continuación:

```java
public interface PlatformTransactionManager{
	TransactionStatus getTransaction(TransactionDefinition definition) throws TransactionException
	void commit(TransactionStatus status) throws TransactionException;
    void rollback(TransactionStatus status) throws TransactionException;
}
```

Tengamos en cuenta que, de acuerdo con la filosofía de Spring **PlatformTransactionManager** es una interfaz y, por lo tanto, puede ser fácilmente implementada cuando sea necesario. Las implementaciones de PlatformTransactionManager se definen como **cualquier otro objeto (o bean)** en el contenedor de Spring. Incluso cuando se trabaja con **JTA**, los códigos que definen las transacciones pueden ser probados con mayor facilidad que si se utiliza directamente JTA.

| Método                                                       | Descripción                                                  |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| TransactionStatus getTransaction(TransactionDefinition definition) | Este método devuelve una transacción actualmente activa o crea una nueva, de acuerdo al comportamiento de propagación definido. |
| void commit(TransactionStatus status)                        | Este método realiza un commit (guardar cambios) de la transacción pasada como parámetro, de acuerdo a su estado. |
| void rollback(TransactionStatus status)                      | Este método lleva a cabo un rollback (restablecer los cambios) de la transacción pasada. |

La definición de la interfaz **TransactionDefinition:**

```java
public interface TransactionDefinition {
	int getPropagationBehavior();
	int getIsolationLevel();
	String getName();
	int getTimeout();
	boolean isReadyOnly();
}
```



Descripción de los métodos

| Método                       | Descripción                                                  |
| ---------------------------- | ------------------------------------------------------------ |
| int getPropagationBehavior() | Este método devuelve el comportamiento de propagación Spring ofrece todas las opciones de propagación de transacciones familiares de EJB CMT. |
| int getIsolationLevel()      | Este método devuelve el grado en el que la transacción está aislada del trabajo de otras. |
| String getName()             | Nombre de la transacción                                     |
| int getTimeout()             | El tiempo en segundos en el que la transacción debe finalizar. |
| boolean isReadyOnly()        | Si la transacción es de solo lectura.                        |

Para la implementación de las transacciones se utiliza la anotación @Transactional, la cual se coloca encima del método que va a ser utilizado por Spring.

Podemos preguntarnos por ejemplo cuánto durará la transacción, desde que comienza la ejecución hasta el commit final. Esta empieza con la primera línea del método que se ha marcado con @Transactional hasta el final del mismo.

A continuación los posibles valores de los **tipos de propagación:**

| Nombre de la constante                          | Descripción                                                  |
| ----------------------------------------------- | ------------------------------------------------------------ |
| TransactionDefinition.PROPAGATION_MANDATORY     | Soporta una transacción actual; lanza una excepción si la transacción actual no existe. |
| TransactionDefinition.PROPAGATION_NESTED        | Se ejecuta dentro de una transacción anidada si existe una transacción actual. |
| TransactionDefinition.PROPAGATION_NEVER         | No admite la existencia de una transacción actual, lanza una excepción si existe una transacción actual. |
| TransactionDefinition.PROPAGATION_NOT_SUPPORTED | No admite una transacción actual, sino que siempre se ejecuta de forma no transaccional. |
| TransactionDefinition.PROPAGATION_REQUIRED      | Soporta la transacción actual, crea una nueva si no existe.  |
| TransactionDefinition.PROPAGATION_REQUIRES_NEW  | Crea una nueva transacción, suspendiendo la transacción actual si existe. |
| TransactionDefinition.PROPAGATION_SUPPORTS      | Soporta una transacción actual, se ejecuta no transaccionalmente si no existe. |
| TransactionDefinition.PROPAGATION_DEFAULT       | Utiliza el timeout predeterminado del sistema de transacciones subyacente, o ninguno si no se admiten timeouts. |

La interfaz TransactionStatus proporciona una forma sencilla de que el código transaccional controle la ejecución de la transacción y el estado de la transacción de consulta:

```java
public interface TransactionStatus extends SavepointManager {
	boolean isNewTransaction();
	boolean hasSavepoint();
	void setRollbackOnly();
	boolean isRollbackOnly();
	boolean isCompleted();
}
```

| Método                     | Descripción                                                  |
| -------------------------- | ------------------------------------------------------------ |
| boolean isNewTransaction() | Este método devuelve si esta transacción lleva internamente un savepoint (punto de salvaguarda), es decir, se ha creado como una transacción anidada basada en un savepoint. |
| boolean hasSavepoint       | Este método indica si esta transacción se ha completado, es decir, si ya se ha hecho commit o rollback. |
| void setRollbackOnly       | Este método devuelve true si la transacción actual es nueva. |
| boolean isRollbackOnly     | Este método devuelve si la transacción se ha marcado como solo rollback. |
| boolean isCompleted        | Este método establece la transacción como solo rollback.     |



## Spring Web Services

**Spring Web Services (Spring-WS)** es un producto desarrollado por la comunidad de Spring centrado en la creación de servicios web **basados en documentos.** Spring Web Services tiene como objetivo facilitar el desarrollo del servicio SOAP siguiendo el modelo de **contract-first (contrato primero)**, permitiendo la creación de servicios web flexibles. Spring-WS se basa en Spring, lo que significa que puede utilizar sus componentes como la inyección de dependencias.

Es un producto de la comunidad de Spring centrado en la creación de Web services o servicios web. Facilita el primer contacto con el desarrollo de servicios SOAP, permitiendo la creación de servicios web flexibles utilizando varias formas de manipulación de ficheros XML.

Para un servicio web SOAP empezaríamos describiendo como serian los mensajes por ejemplo un servicio de consulta de recetas de cocina:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<RecipelistRequest xmls="http://www.ejemplococina.com/spring/ws/schemas">
	<nacion_origen>India</nacion_origen>
    <dificultad>baja</dificultad>
</RecipelistRequest>
```

Un XML Schema para la petición recipeListRequest.xsd

```xml
<xsd:schema xlmns:xsd="http://www.w3.org/2001/XML_Schema"
	elementFormDefault="qualified"
	targetNamespace="http://www.ejemplococina.com/spring/ws/schemas"
	xlmns:schemas="http://www.ejemplococina.com/spring/ws/schemas">
	
	<xsd:element name="RecipeListRequest">
        <xsd:complexType>
            <xsd:sequence>
                <xsd:element name="nacion_origen" type="xsd:string" />
                <xsd:element name="dificultad" type="schemas:dificultadType" />
            </xsd:sequence>
        </xsd:complexType>
	</xsd:element>
    
    <xsd:element name="dificultadType">
        <xsd:restrition base="xsd:string">
            <xsd:enumeration value="baja" />
            <xsd:enumeration value="media" />
            <xsd:enumeration value="alta" />
        </xsd:complexType>
	</xsd:element>
</xsd:schema>
```

Definimos una interfaz del servicio y una clase que lo implemente:

```java
package com.test.example;

public interface RecipesService {
    void Recipe[] listRecipes(String nacion, string dificultad);
}

//Otro fichero
package com.test.example;
import org.springframework.stereotype.Service;

@Service
public class RecipesImpl implements RecipeService {
	void Recipe[] listRecipes(String nacion, string dificultad){
        //Realizamos la consulta
    }
}
```

Una clase Endpoint es la encargada de recibir tratar la petición

```java
package com.test.example;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ws.server.endpoint.annotation.Endpoint;
import org.springframework.ws.server.endpoint.annotation.PayloadRoot;
import org.springframework.ws.server.endpoint.annotation.RequestPayload;
import org.springframework.ws.server.endpoint.annotation.ResponsePayload;

@Endpoint
public class RecipesListEndpoint {
    private static final String TARGET_NAMESPACE = "http://www.ejemplococina.com/spring/ws";
    @Autowired
    private RecipesService recipesService;
    
    @PayloadRoot(localPart = "RecipesListRequest", namespace = TARGET_NAMESPACE)
    
    public @ResponsePayload RecipeListResponse getListRecipes(@RequestPayload ListRecipeRequest request){
        ListRecipeResponse response = new AccountDetailsResponse();
        //Servicio inyectado
        Recipe[] resp = recipeService.getListRecipes(request.getParams());
        response.setListRecipes(account);
        return response;
    }
    public void setRecipesService(RecipesService serv)
    {
        this.recipesService = serv;
    }
}
```



## Spring Security

Un aspecto principal en el desarrollo de toda aplicación web es la seguridad de la misma. Una función básica sería la comprobación de la identidad del usuario y sus permisos.

Spring Security es un framework utilizado para la autenticación y control de acceso muy personalizable. Permite gestionar todo lo relacionado a la seguridad de una aplicación web, desde el protocolo de seguridad hasta los roles de usuario.

 La principal característica de este framework es la facilidad tanto de implementación como de uso que presenta. También podemos destacar el gran soporte que presenta en su comunidad, además de tener un Servlet API integrado y la posibilidad de implementarse con Spring Web MVC. Prácticamente SpringSecurity es declarativo y apenas es necesario escribir código, incluso no es necesario escribir una página de login, ya que Spring Security lo puede hacer por ti.

### Autenticación

Una vez añadida su dependencia en el proyecto bastaría con ir creando filtro en el web.xml, sin embargo se puede hacer ilegible y difícil de mantener. Por ello lo normal es definir un único filtro web, junto con un **AuthenticationProvider y AuthenticationEntryPoint:** 

```java
<filter>
    <filter-name>springSecurityFilterChain</filter-name>
    <filter-class>org.springframework.web.filter.DelagatingFilterProxy</filter-class>
</filter>
        
<filter-mapping>
      <filter-name>springSecurityFilterChain</filter-name>
      <url-pattern>/*</url-pattern>  
</filter-mapping>
```

Como alternativa a definir múltiples filtros podemos utilizar el elemento <http>, dicho elemento junto al atributo auto-config a true, configurará los filtros obligatorios, beans y la cadena de seguridad.

Se creará el **bean** **springSecurityFilterChain** que se encargará de gestionar diferentes filtros de la cadena de seguridad. También se definirá el filtro de **autenticación** **authenticationProcessingFilter** que permitirá generar la sesión, el token, etc.



En el siguiente ejemplo tenemos una configuración básica para la autentificación de usuarios:

```java
<?xml version="1.0" encoding="UTF-8"?>

<beans xmlns="http://www.springframework.org/schema/beans"
    xmlns:xsi="http://www.w3.or/2001/XMLSchema-instance"
    xmlns:sec="http://www.springframework.org/schema/security"
    xmlns:schemaLocation="http://www.springframework.org/schema/beans
        http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
        http://www.springframework.org/schema/security
        http://www.springframework.org/schema/beans/spring-security-3.0.xsd">
    
	<bean id="authenticationProcessingFilter" class="org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter">
        <property name="authenticationManager" ref="authenticationManager" />
        <property name="filterProcessUrl" value="/j_spring_security_check" />
        <property name="authenticationSuccesHandler">
        	<bean class="org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccesHandler">
	            <property name="defaultTargetUrl" value="/pages/home" />
            </bean>
        </property>
        <property name="authenticationFailureHandler">
            <bean class="org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler">
	            <property name="defaultFailureUrl" value="/pages/errorlogin" />
            </bean>
        </property>
    </bean>
    <bean id="authenticationManager" class="org.springframework.security.authentication.ProciderManager">
        <property name="providers">
	        <list>
        		<ref bean="myAuthenticationProvider" />
        	</list>
        </property>
    </bean>
    
    <bean id="myAuthenticationProvider" class="com.test.filter.MyAuthentication.ProviderManager" >
        <property name="userDetailService" ref="myUserDetailsService" />
    </bean>
    
    <bean id="myUserDetailService" class="com.test.filter.MyUserDetailsService" />
        
    <sec:http auto-congif="true" use-expressions="true" access-denied-page="/pages/denied"
        authentication-manager-ref="authenticationManager">
    	<sec:intercept-url pattern="/login" access="permitAll" />
    	<sec:intercept-url pattern="/user/" access="hasRole('USER')" />
    	<sec:form-login login-page="/login" default-target-url="/user" />
    	<sec:logout invalidate-session="true" delete-cookies="JESESSIONID" logout-success-url="/" logout-url="/j_spring_security_logout" />
    </sec:http>
</beans>
```

En el ejemplo podemos ver que hemos definido el bean **AuthenticationManager**. Este bean, entre otras cosas, es responsable de recuperar la información de usuario que se está intentando loguear en el sistema. Esto lo consigue mediante un provider que es necesario definir. Este provider es el que proporciona el AuthenticationManager los detalles de nuestro usuario. El provider construye un objeto **UsernamePasswordAuthenticationToken** si la contraseña es la correcta y se lo pasa al AuthenticationManager. Éste será el que se encargue de rellenar el SecurityContextHolder. Se puede definir varios providers según sea necesario, además de definir uno propio.

Entre otras el AuthenticationManager tiene la propiedad **autheticationSuccessHandler** que redirigiría a la página solicita antes del logeo, en caso de que haya entrado por sí mismo en dicha página se redirigirá a la **default**.

También se puede observar como requerimos un rol de usuario en una de las rutas **\<sec:http>** (sec es el prefijo que definimos para los elementos del schema de security). Los roles se configurarán declarativamente en el **spring-security.xml**. También hemos definido un **UserDetailsService** , este es el que provee los datos de los usuarios al AuthenticationProvider, por ejemplo pueden venir de la base de datos.

Debemos tener en cuenta que otros ficheros de configuración se deben definir con el elemento **\<context-param>**:

```java
<context-param>
    <param-name>contextConfigLocation</param-name>
    <param-value>
    	classpath:applicationContext.xml
        classpath:spring-security.xml
    </param-value>
</context-param>
```

A continuación tenemos una implementación del AuthenticationProvider.

```java
public class MyAuthenticationProvider implements AuthenticationProvider

    private UserDetailsService userDetailsService;
	
	public void setUserDetailsService(UserDetailsService userDetailsService) {
        this.userDetailsService = userDetailsService;
    }

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        
        UserDetails userDetails = this.userDetailsService.loadUserByUsername(authentication.getName());
        if (userDetails != null && new BasicPasswordEncryptor().checkPassword(authentication.getCredentials().toString(), userDetails.getPassword())){
            return new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
        }
		throw new BadCredentialsException("Bas credentials");
	}
}
```

Como podemos ver recibe un objeto **Authentication** del que obtiene el nombre que usará con el userDetailsService para obtener los detalles del usuario, compara la clave recibida con la clave encriptada en los detalles y devolvemos un **UsernamePasswordAuthenticationToken** con userDetails y sus roles.



Nota: El AuthenticationManager tiene la propiedad authenticationSuccessHansler que redirigiría a la página solicita antes del logeo, en caso de que haya entrado por si mismo en dicha página se redirigirá a la default.



## Spring Test

Test podemos traducirlos en este caso como la prueba o el **análisis de rendimiento de nuestra aplicación**. En eso se basa Spring Test, en analizar las ventajas que aporta Spring al ámbito de la programación y como un proyecto mejora en rendimiento.

Alguna de las **mejoras** en las que se centra son:

- En el ámbito del contexto. Es decir cuando necesitamos de algún contexto de la aplicación nos ayuda a analizarlo y ver cómo estamos trabajando en él. Todo de forma simple y reduciendo la cantidad de código que necesitamos para realizar muchas de las comprobaciones. Esto es debido a que nos facilita la localización de recursos como los metadata de la configuración XML.
- Permite analizar las transacciones realizadas. La integración con estas se traduce como algo simple y de gran efectividad.
- Es útil a la hora de escribir los test de integración con clases específicas de Spring.



## Capacidades específicas

Una de las capacidades más valoradas en Spring son los módulos. Todos ellos están contenidos en el Spring Core Container y cada uno posee una función determinada:

- Spring-core: Es el encargado de implementar el código de loC de Spring permitiendo otras instalaciones de códigos externos.
- Spring-beans: Se encarga de implementar las librarías de Bean de forma automática.
- Spring-context: Se puede decir que es el contexto del framework y el encargado de administrar los recursos del proyecto.

Existen más pero con estas 3 definiciones podemos ver la potencia de los módulos en Spring.



## Recuerda

- Framework: Este framework diseñado por la aplicación del modelo-vista-controlador está diseñado por un conjunto de manejadores que distribuyen las peticiones a estos.
- Modelo de Spring: Permite configurar nuestra aplicación de varias formas para que no tengamos que establecernos a un modelo únicamente.
- Capa de acceso a datos: El código permite acceder a las fuentes de datos.
- J2EE: El marco de J2EE proporciona una alternativa al modelo de páginas de servidor para crear aplicaciones web.
-  Objetos de modelo: Son las partes de la aplicación que implementan la lógica del dominio de datos de la aplicación.
-  Transacciones: Consisten en realizar una serie de peticiones a una base de datos para que ejecuten unas instrucciones , por ejemplo insertar varios registros o actualizar varios campos de una tabla.
- Commit final: Podemos preguntarnos por ejemplo cuánto durará la transacción, desde que comienza la ejecución hasta el commit final.
- Spring Web Services: Es un producto de la comunidad de Spring centrado en la creación de Webservices o servicios web.
- Spring Security: Es un poderoso framework utilizado para la autenticación y control de accesos muy personalizable.
- Test: podemos traducirlos en este caso como la prueba o el análisis de rendimiento de nuestra aplicación.



# 5. HIBERNATE

## Introducción

En este tema veremos clases mapeadas y optimización de mapeo asociados así como de qué manera podemos lanzar consultas contra la base de datos y optimizar nuestro trabajo.



## Objetivos

- Conocer en que consiste Hibernate.
- Consultar y mapear herencias y clases.



## Mapa conceptual

![image-20241028092415674](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241028092415674.png)



## Introducción a Hibernate

Hibernate es una herramienta ORM (Object-Relational mapping) para plataformas en Java que facilita el mapeo de atributos entre una base de datos relacional (**MySQL, PostgreSQL**,...) y el modelo de objetos de una aplicación, esto se puede hacer mediante archivos XML o por medio de anotaciones en los POJO.

Nota: 

- **mapeo**: proceso de hacer coincidir campos de datos de una fuente con campos de datos de otra fuente. Es el proceso de integración de campos de muchos conjuntos de datos en un diseño, o base de datos centralizada.

- **POJO**: (Plain Old Java Object) un objeto POJO es una instancia de una clase que no extiende ni implementa nada en especial. Le permite realizar pruebas unitarias fuera del servidor de aplicaciones facilitando todo el proceso de programación.

- **Bean**: Los JavaBeans son componentes de software reutilizables que están escritos en Java. El componente es un fragmento de código de programa que proporciona una unidad funcional bien definida, puede ser tan pequeño como una etiqueta para un botón de una ventana o tan grande como toda una aplicación. Se usan para encapsular varios objetos en un único objeto, para hacer uso de un solo objeto en lugar de varios más simples.

  Son clases que encapsular uno o más objetos en un único objeto estandarizado (el bean). Esta estandarización permite que los beans se gestionen de una manera más genérica, lo que facilita la reutilización y la introspección del código.



### Características

- No intrusivo (estilo POJO) no obliga a implementar interfaces determinadas ni heredar de una superclase.
- Muy buena documentación.
- Comunidad activa.
- Permite, transacciones, caché, asociaciones, polimorfismo, herencia, lazy loading, persistencia transitiva, estrategias de fetching.
- Potente lenguaje de consulta HQL,
- Fácil testeo.
- Open Source.

Nota:

- Polimorfismo: habilidad de una clase para implementar métodos con el mismo nombre pero con comportamientos distintos, dependiendo de la clase especifica con la que esté interactuando.
- lazy loading: (carga diferida) es un patrón de diseño comúnmente usado en programación que consiste en retrasar  la carga o utilización de un objeto hasta el mismo momento de su utilización.
- HQL: lenguaje de consulta de Hibernate que se parece a SQL, pero las consultas no se realizarán sobre las tablas de la base de datos, sino sobre los objetos vinculados a una tabla en la base de datos.



**¿Por qué integrar Hibernate en la capa de datos (modelos)**

La programación orientada a objetos y las bases de datos relacionales son dos paradigmas diferentes, el modelo relacional trata con relaciones, tuplas, y conjuntos, sin embargo la programación orientada a objetos trata con objetos, atributos y relaciones entre estos.

Si estamos usando objetos en nuestra aplicación y queremos que sean persistentes normalmente abriremos una conexión JDBC (Java Database Connectivity), crearemos una sentencia SQL y copiaremos todos los valores en la cadena SQL que estemos construyendo, esto se complica cuando el objeto tiene muchas propiedades, asociaciones o contiene otros objetos dentro del mismo objeto a persistir. Es por eso que surge la necesidad de usar un ORM que nos ayudará a evitar estos problemas o diferencias entre estos dos paradigmas.

Con un buen **ORM**, solo tendremos que **definir** la **forma** en la que **establecemos** la **correspondencia** entre las **clases** y las **tablas** una sola vez, como indicar que propiedad se corresponde con que columna y que clase con que tabla. **Hibernate** nos **proporciona** además un lenguaje para el **manejo** de **consultas** a la **base de datos** llamado **HQL**, similar al **SQL** que se utiliza para **obtener objetos** de la **base de datos.** La **ventaja** de usar este lenguaje, es que nos permite **usar** cualquier **base** de datos que utilice el lenguaje **SQL.**

Desde la versión 3.2.0, **Hibernate** desarrolla la **especificación JPA**, con lo que ahora es **posible desarrollar** una **capa** de **acceso** a datos compatible con los estándares de Java en Hibernate, y desplegarla en cualquier servidor de aplicaciones que soporte las especificaciones JEE5.

Esta **API** busca unificar la manera en que funcionan las utilidades que proveen un mapeo objeto-relacional.

El objetivo que persigue el diseño de esta API es no perder las ventajas de la orientación a objetos al interactuar con una base de datos, como sí pasaba con EJB2, y permitir objetos POJO. Por otro lado, esta especificación tiene una desventaja, y es que estaremos perdiendo algunas características que ofrece Hibernate.



NOTA:

- **JDBC**: especificación estándar de una interfaz de programación de aplicaciones (API) que permite que los programas JAVA accedan a sistemas de gestión de bases de datos.

- **tupla**: secuencia de valores agrupados, sirve para agrupar, como si fueran un único valor, varios valores que, por su naturaleza, deben ir juntos.



## Hibernate

La razón de usar **Hibernate** reside en que cuando creamos una aplicación la **mayoría** de **consultas** que se realizan son muy **similares** y siempre estamos copiando código por lo que se produce una **extensión innecesaria de la aplicación**. Aquí es donde **Hibernate** propone **juntar todas las consultas y procesos** para que ya estén hechos y **solo** tengamos que **elegirlos** de nuevo en vez de volver a escibirlos. En definitiva Hibernate asigna clases Java a tablas de bases de datos y tipos de datos Java a tipos de datos SQL y ahorra al desarrollador gran parte de las tareas de programación relacionadas con la persistencia de datos comunes.

###  Bases de datos soportadas

Hibernate casi todos los RDBMS (Relational Database Management System). A continuación se muestra una lista con algunos soportados por Hibernate:

- HSQL
- DB2/NT
- MySQL
- PostgreSQL
- FrontBase
- Oracle
- Microsoft SQL Server Database
- Sybase SQL Server
- Informix Dynamic Server



### Tecnologías soportadas

Hibernate soporta una variedad de otras tecnologías incluyendo las siguientes:

- XDoclet Spring, plataforma que extiende las capacidades del lenguaje de programación Java para facilitar el desarrollo de aplicaciones empresariales robustas, escalables y portables.
- J2EE (Java 2 Enterprise Edition)
- Eclipse plug-ins
- Maven: herramienta de sotfware para la gestión y construcciones de proyectos Java. Similar a Apache ant, pero tiene un modelo de configuración de construcción mas simple, basado en formato XML.



Hibernate utiliza varias API Java Existentes, como  **JDBC**, Java Transaction API (**JTA**) y Java Naming and Directory Interface (**JNDI**).

JDBC proporciona un nivel rudimentario de abstracción a las bases de datos relacionales, lo que permite que casi cualquier base de datos con un controlador JDBC sea compatible con Hibernate.

JNDI y JTA permiten que Hibernate se integre con los servidores de aplicaciones J2EE.

### Arquitectura Hibernate

En la siguiente imagen se muestra la arquitectura de Hibernate con algunas clases que son básicas para su funcionamiento:

![image-20241028101244291](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241028101244291.png)

#### **Objeto Configuration**

El objeto Configuration es el primer objeto que se crea en cualquier aplicación de Hibernate y normalmente se crea sólo una vez durante la inicialización de la aplicación. Representa un archivo de configuración o propiedades requerido por Hibernate. El objeto Configuration proporciona dos componentes clave:

- **Conexión de base de datos:?** Se maneja a través de uno o más archvos de configuración compatibles con Hibernate. Estos archivos son hibernate.propierties e hibernate.cfg.xml.
- **Configuración de mapeado de clases:** Este componente crea la conexión entre las clases Java y las tablas de base de datos.



#### Objeto SessionFactory

El objeto de configuración se utiliza para crear un objeto SessionFactory que configura Hibernate para la aplicación utilzando el archivo de configuración suministrado y permite que un objeto Session sea instaciado. SessionFactory es un objeto de seguridad de subproceso y utilizado por todos los subprocesos de una aplicación.

SessionFactory que por lo general se crea durante el inicio de la aplicación y se mantiene para su uso posterior. Necesitarías un objeto SessionFactory por cada basse de datos utilizando un archivo de configuración independiente. Así que si se está utilizando varias bases de datos, entonces se tendría que crear varios objetos SessionFactory.



#### Objeto Session

Un objeto Session se utiliza para obtener una conexión física con una base de datos. El objeto Session es ligero y está diseñado para ser instanciado cada vez que se necesita una interacción con la base de datos. Los objetos persistentes se guardan y recuperan a través de un objeto Session.

Los objetos Session no deben mantenerse abiertos durante mucho tiempo porque normalmente no son seguros para el hilo y deben crearse y destruirse según sea necesario.



#### Objeto Transaction

Una transacción representa una unidad de trabajo con la base de datos y la mayoría de RDBMS admite la funcionalidad de transacciones. Las transacciones en Hibernate son manejadas por un gestor de transacciones subyacente. Este es un objeto opcional y las aplicaciones de Hibernate pueden optar por usar esta interfaz, en lugar de administrar las transacciones en su propio código de aplicación.



#### Objeto Query

Los objetos Query usan cadenas de texto SQL o HQL (Hibernate Query Lenguaje) para llevar a cabo consultas en la BD y crear objetos. Una instancia de Query se utiliza para vincular parámetros de consulta, limitar el número de resultados devueltos por la consulta y finalmente para ejecutar la consulta.



#### Objeto Criteria

El objeto Criteria se utiliza para crear y ejecutar consultas de criterios orientadas a objetos para recuperar objetos.



**Configuración**

Hibernate está diseñado para funcionar con muchos entornos diferentes, por lo tanto, existe una gran cantidad de parámetros de configuración. Normalmente, dichos parámetros se proporciones en un archivo de propiedades Java estándar denominado **hibernate.propierties** o como un archivo XML denominado **hibernate.cfg.xml, ambos (no los dos al mismo tiempo) deben estar en el directorio raiz del classpath**. La mayoría de las propiedades tienen valores predeterminados y no es necesario especificarlos todos en el archivo de propiedades a menos que sea realmente necesario.

También podemos generar la configuración desde el código:

```java
Configuration cfg = new Configuration()
    .addClass(org.hibernate.auction.Item.class)
    .addClass(org.hibernate.auction.Bid.class)
    .setProperty("hibernate.dialect", "org.hibernate.dialect.MySQLInnoDBDialect")
    .setProperty("hibernate.connection.datasource", "java:comp/env/jdbc/test")
    .setProperty("hibernate.order_updates,"true");
```

Un ejemplo de **hibernate.cfg.xml**

```xml
<?xml version="1.0" encoding="UTF-8">
<!DOCTYPE hibernate-configuration PUBLIC "-//Hibernate/Hibernate Configuration"
<hibernate-configuration>
	<session-factory>
        <property name="hibernate.dialect">org.hibernate.dialect.MySQLInnoDBDialect</property>
        <property name="hibernate.conecction.driver_class">com.mysql.jdbc.Driver</property>
        <property name="hibernate.connection.url">jdbc:mysql://localhost:3306/ej</property>
        <property name="hibernate.connection.username">usuario</property>
        <property name="hibernate.connection.password">ejemplo</property>
            </session-factory>
        <mapping resource="person.htm.xml" />
</hibernate-configuration>
```

En este ejemplo tenemos la configuración para el acceso a una base de datos **MySQL**, en la que la documentación de hibernate se puede encontrar un listado completo para las propiedades **hibernate.dialect e hibernate.connection.driver_class**. También se puede ver una etiqueta <mapping> que indica con un atributo **resource** un fichero XML que mapea una clase Java a una tabla de la base de datos.



## Clases mapeadas

Las clase **Java** cuyos **objetos o instancias** se guardan en la **base de datos** se denominan clases persistentes en **Hibernate**. **Hibernate** funciona mejor si estas **clases** siguen algunas **reglas simples**, también conocido como **POJO (Plain Old Java Object)**. Existen las siguientes reglas principales de las clases persistentes, sin embargo, ninguna de estas reglas son difíciles de cumplir.

- Todas las clases con persistencia necesitan un constructor por defecto.
- Todas las clases deben definir un ID para permitir la fácil identificación de los objetos dentro de Hibernate y la base de datos. Esta propiedad se relaciona con la clave primaria de una tabla.
- Todos los atributos que se almacenarán en la base de datos deben declararse privados y tener los métodos getXXX y setXXX definidos en el estilo JavaBean.

Para el mapeo de las clases a tablas tenemos dos opciones para definirlas:

- Ficheros XML.
- Anotaciones sobre la clase.



Por ejemplo partimos de la siguiente clase POJO, debemos recordar que es imprescindible tener un constructor sin argumentos:

```java
public class Person {
    private int id;
    private String name;
    private String lastName;
    private String address;
    
    public Person(){}
    
    public Person (String name, String lname, String address){
        this.name = name;
        this.lastName = lname;
        this.address = address;
    }
    
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;     
    } 
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;     
    } 
    public String getLastName() {
        return lastName;
    }
    public void setLastName(String last_name) {
        this.lastName = last_name;     
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String addr) {
        this.address = addr;     
    } 
}
```

Con POJO enfatizamos que el objeto debe ser ordinario, no un objeto particular, en especial un JavaBean.

Para los ficheros xml que mapean clases se deben nombrar con el formato **<nombra de la clase>.hbm.xml**

```xml
<?xml version="1.0" encoding="UTF-8">
<!DOCTYPE hibernate-mapping PUBLIC "-//Hibernate/Hibernate Mapping DTD//EN"
"http://www.hibernate.org/dtd/hibernate-mapping-3.0.dtd">

<hibernate-mapping>
	<class name="Person" table="PERSON">
        <meta attribute="class-description">
            Esta tabla contiene los datos de una persona
        </meta>
        <id name="id" type="int" column="id">
            <generator class="native"/>
        </id>
        <property name="firstName" column="name" type="String"/>
        <property name="lastName" column="last_name" type="String"/>
        <property name="address" column="address" type="String"/>
	</class>
</hibernate-mapping>
```

La ruta a este fichero de mapeado debe estar definido en la configuración de Hibernate mediante la etiqueta <mapping>, por ejemplo:

```xml
<mappin resource="org/test/clients/Person.hbm.xml">
```

Algunos elementos de mapeado usados en ficheros hbm.xml:

- El fichero de mapeo es un documento XML que tiene <hibernate-mapping> como raiz **<hibernate-mapping>** que contiene todos los elementos <class><class>.</class>
- <hibernate-mapping><class> Los elementos **<class>**<class> se utilizan para definir asignaciones específicas de una clase Java a las tablas en la base de datos. El nombre de la clase Java se especifica mediante el atributo name del elemento de clase y el nombre de la tabla de la base de datos se utiliza utilizando el atributo table.
- <hibernate-mapping><class><class> El elemento **<meta>** es opcional y se puede usar para definir la descripción de clase.
- <hibernate-mapping><class><class>**<id>**<id> asigna el atributo ID único en la clase a la clave primaria de la tabla. El atributo name del elemento id se refiere a la propiedad en la clase y el atributo column se refiere a la columna de la tabla. El atributo type contiene el tipo de dato, el dato se convertirá de Java a SQL y viceversa. </class>
- <hibernate-apping><class><class><id>**<generator>**<generator> dentro del elemento id se utiliza para generar automáticamente la clave primaria.
- <hibernate-apping><class><class><id><generator>. El elemento **<property>** <property> se utiliza para asignar una propiedad de clase Java a una columna de la tabla. El atributo name del elemento se refiere a la propiedad en la clase y el atributo column se refiere a la columna de la tabla de la base de datos. El atributo type tiene el tipo de correlación de Hibernate, este tipo de asignación se convertirá de Java a SQL.

Hay otros elementos y atributos usados en la definición de mapeos disponibles en la documentación.

**Anotaciones**

Hasta ahora hemos visto como definir el mapeo de clases a tablas mediante documentos xml, pero también disponemos de la posibilidad de utilizar anotaciones.

Las anotaciones de Hibernate son la forma más reciente de definir asignaciones sin uso de archivo XML. Se pueden utilizar anotaciones como añadido o como reemplazo de metadatos de mapeo en XML. Hibernate Annotations es un potente método para proporcionar los metadatos sobre mapeo de objetos y tablas relacionales. Todos los metadatos se agregan a la clase POJO junto con el código, lo que ayuda al desarrollador a entender la estructura de la tabla y la clase simultáneamente durante el desarrollo. Si va a hacer una aplicación portable para otras aplicaciones ORM compatibles con EJB 3, se deben utilizar anotaciones, pero si es más importante la flexibilidad se recomienda el mapeo basado en XML.

Usando anotaciones la clase POJO anterior quedaría así:

```java
import javax.persistence.*;
@Entity
@Table(name="PERSONA")

public class Person {
	@Id @GeneratedValue
	@Column(name = "id")
    private int id;
    @Column(name = "name")
    private String name;
    @Column(name = "last_name")
    private String lastName;
    @Column(name = "address")
    private String address;
    
    public Person(){}
    
    public Person (String name, String lname, String address){
        this.name = name;
        this.lastName = lname;
        this.address = address;
    }
    
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;     
    } 
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;     
    } 
    public String getLastName() {
        return lastName;
    }
    public void setLastName(String last_name) {
        this.lastName = last_name;     
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String addr) {
        this.address = addr;     
    } 
}
```

Las anotaciones estándar de EJB 3 están en el paquete javax.persistence, por lo que importamos este paquete como el primer paso. También podemos observar el uso de las anotaciones @Column sobre las propiedades, si quisiéramos  el acceso a través de getters bastaría con ponerlos sobre ellos pero debemos elegir si todos son sobre getters o propiedades, no podemos tener algunos con propiedades y otros con getters.

**@Entity**: con la anotación @Entity marcamos una clase como un bean de entidad, por lo que debe tener un constructor sin argumentos que sea visible con al menos el ámbito protegido.

**@Table:** la anotación @Table permite especificar los detalles de la tabla que se utilizará para persistir la entidad en la base de datos. Proporciona cuatro atributos, que permiten anular el nombre de la tabla, su catálogo y su esquema, y también permite aplicar restricciones únicas en las columnas de la tabla.

**@Id y @GeneratedValue:** cada bean de entidad tendrá una clave primaria, se asignará con la anotación @id. La clave primaria puede ser un solo campo o una combinación de varios campos dependiendo de la estructura de la tabla. De forma predeterminada, la anotación @Id determinará automáticamente la estrategia de generación de claves primarias más apropiada que se va a utilizar, pero puede anularla aplicando la anotación @GeneratedValue que toma dos parámetros de estrategia y un generador. Sin embargo, dejar que Hibernate determine qué tipo de generador utilizar permite que el código sea más portable entre diferentes bases de datos.

**@Column:** la anotación @Column se utiliza para especificar los detalles de la columna a la que se asignará un campo o una propiedad. Puede utilizar la anotación de columna con los siguientes atributos más utilizados:

- **-name** permite que el nombre de la columna se especifique explícitamente.
- **-length:** permite el tamaño de la columna utilizada para asignar un valor en particular para un valor String.
- **-nullable:** permite que la columna se marque NOT NULL cuando se genera el esquema.
- **-unique:** provoca que la columna se marque que contiene solo valores únicos.



## Consultas contra la base de datos

El lenguaje utilizado para llevar a cabo consultas con Hibernate se llama HQL o Hibernate Query Languaje, es muy similar a SQL.

Para la realización de consultas se utiliza la clase Query. Esta nos permite introducir en su método createQuery() directamente la consulta. Por ejemplo:

```sql
Query query = session.createQuery("SELECT nombre FROM Personas p");
```

De esta forma obtenemos el objeto query con el conjunto de resultados directamente para trabajar con ellos.

Ahora vamos a listar el conjunto de estos resultados mediante la función **list()**.

```java
List<Persona> personas = query.list();
```

Ya tenemos en una lista los resultados ahora vamos a verlos por pantalla recorriendo esta lista

```java
for (Persona persona : personas){
	system.out.println(personas.toString());
}
```

Así es como trabaja Hibernate, con 5 líneas de código hemos obtenido un conjunto de resultados y los hemos mostrado por pantalla. Al igual que hemos hecho con una lista de registros String, podemos realizarlo con objetos y con cualquier tipo que haya en la base de datos.

También se puede utilizar sentencias SQL directamente con Hibernate a través de **Native SQL**, sin embargo no es recomendable y se debería utilizar lo menos posible para evitar problemas de portabilidad a otras bases de datos, y también para aprovechar las estrategias de Hibernate para la cache.

En HQL palabras clave como **SELECT, FROM, WHERE, etc. no son sensibles a mayúsculas** pero propiedades de tabla y nombres de columna si.



**Algunos ejemplo más:**

También podemos usar el nombre completo de una clase, es decir incluyendo la jerarquía de paquetes que la continene:

```java
String hql = "FROM com.hibernatebook.criteria.Employee";
```

Podemos asignar alias con la palabra **AS:**

```java
String hql = "FROM Employee AS E";
Query query = session.createQuery(hql);
List resuls = query.list();
```

También se puede obviar y poner el alias directamente después del nombre:

```java
String hql = "SELECT E.lastname FROM Person P";
Query query = session.createQuery(hql);
List resuls = query.list();
```

En el ejemplo anterior "firstName" es el nombre de la propiedad en la clase, y no del atributo en la tabla.

**La cláusula WHERE, como en SQL nos permite definir condiciones en la selección, las expresiones sobre condiciones son como SQL:**

```java
String hql = "FROM Person E WHERE E.id=10";
Query query = session.createQuery(hql);
List resuls = query.list();
```

**ORDER BY nos permite definir el orden de los resultados:**

```java
String hql = "FROM Person E WHERE E.id>10"+"ORDER BY E:firstName DESC, E.Salary DESC";
Query query = session.createQuery(hql);
List resuls = query.list();
```

**GROUP BY para agrupar en base al mismo valor de un atributo:**

```java
String hql = "SELECT SUM(E.salary), E.firstName FROM Employee E " + "GROUP BY E.firstName";
Query query = session.createQuery(hql);
List resuls = query.list();
```

Con **DELETE** para eliminar registros en base a una selección, como se puede observar estamos definiendo un parámetro con **setParameter(<nombre parámetro>,<valor>)**, en el string de la consulta definimos la variable precedida por dos puntos**: <nombre parámetro>**

```java
String hql = "DELETE FROM Employee"+" WHERE id=employee_id";
Query query = session.createQuery(hql);
query.setParameter("employee_id",10);
int result = query.executeUpdate();
System.out.println("Rows affected:"+result);
```

**También podemos utilizar la cláusula INSERT:**

```java
String hql = "INSERT INTO Employee(firstName, lastName,salary)"+"SELECT firstName,lastName,salary FROM old_employee";
Query query = session.createQuery(hql);
int result = query.executeUpdate();
System.out.println("Rows affected:"+result);
```

También disponemos de los métodos: **avg, count, max, min y sum.**

Un detalle importante es que para la paginación tenemos dos funciones de la clase Query, **setFirstResult(int startPosition) para el offset** y **setMaxResult(int maxResults) para el limit**, ambas funciones devuelven el propio objeto query por lo que se pueden utilizar concatenadas en la misma línea.

```java
String hql = "FROM Employee";
Query query = session.createQuery(hql);
query.setFirstResult(1);
query.setMaxResults(10);
List results = query.list();
```

**Sentencias de definición de la estructura de datos**

**Sintaxis de ALTER DATABASE**

```mysql
ALTER {DATABASE | SCHEMA}[db_name]
alter_specification[,alter_specification]...
alter_specification;
[DEFAULT]CHARACTER charset_name
| [DEFAULT] COLLATE collation_name
```

ALTER DATABSE le permite cambiar las características globales de una base de datos. Estas características se almacenan en el fichero db.opt en el directorio de la base de datos. Para usar ALTER DATABASE, necesita el permiso ALTER en la base de datos.

La cláusula CHARACTER SET cambia de caracteres por defecto de la base de datos. La cláusula COLLATE cambia la colación por defecto de la base de datos.

Nota: colación es un conjunto de reglas que define como se comparan y se ordenan los caracteres en una base de datos.

En MySQL 5.0, el nombre de la base de datos puede omitirse. El comando se aplica a la base de datos por defecto. ALTER SCHEMA puede usarse desde MySQL 5.0.2.

**SINTAXIS DE ALTER TABLE**

```mysql
ALTER [IGNORE] TABLE tbl_name
    [alter_specification [, alter_specification] ...]
    
alter_specification: 
  | ADD [COLUMN] column_definition[FIRST | AFTER col_name]
  | ADD [COLUMN] (column_definition,...)
  | ADD {INDEX} [index_name] [index_type](index_col_name...)   | ADD [CONSTRAINT [symbol]] PRIMARY KEY[index_type] (index_col_name...)   
  | ADD [CONSTRAINT [symbol]] UNIQUE[index_name] [index_type] (index_col_name...)   
  | ADD [FULLTEXT|SPATIAL][index_name](index_col_name...)   
  | ADD [CONSTRAINT [symbol]] FOREIGN KEY[index_name] (col_name,...) [reference_definition]
  | ALTER [COLUMN] col_name {
        SET DEFAULT {literal | DROP DEFAULT }
  | CHANGE [COLUMN] old_col_name column_definition
        [FIRST | AFTER col_name]
  | DROP [COLUMN] col_name
  | MODIFY [COLUMN] col_name column_definition
  | DROP PRIMARY KEY
  | DROP INDEX index_name
  | DROP FOREIGN KEY fk_symbol
  | DISABLE KEYS
  | ENABLE KEYS
  | RENAME [TO] new_tbl_name  
  | ORDER BY col_name 
  | CONVERT TO CHARACTER SET charset_name [COLLATE collation_name]
  | [DEFAULT] CHARACTER SET charset_name [COLLATE collation_name]
  | DISCARD TABLESPACE
  | IMPORT TABLESPACE
  | table_options
```

ALTER TABLE le permite cambiar la estructura de una tabla existente. Por ejemplo, puede añadir o borrar columnas, crear o destruir índices, cambiar el tipo de columnas existentes, o renombrar columnas o la misma tabla. Puede cambiar el comentario de la tabla y su tipo.

La sintaxis para varias de las alteraciones permitidas es similar a cláusulas del comando CREATE TABLE. Esto incluye modificaciones table_options, para opciones tales como ENGINE, AUTO_INCREMENT y AVG_ROW_LENGTH.

Algunas operaciones pueden producir advertencias si se intentan en una tabla para que el motor de almacenamiento no soporte la operación. Estas advertencias pueden mostrarse con SHOW WARNINGS. 

Si usa ALTER TABLE para cambiar la especificación de una columna pero DESCRIBE tbl_name indicar que la columna no ha cambiado, es posible que MySQL haya ignorado las modificaciones por alguna de las razones. "cambios tácitos en la especificación de columnas". Por ejemplo, si intenta cambiar una columna VARCHAR a CHAR, MySQL usa VARCHAR si la tabla contiene otras columnas de longitud variable.

ALTER TABLE funciona creando una copia temporal de la tabla original. La alteración se realiza en la copia, luego la tabla original se borra y se renombra la nueva. Mientras se ejecuta ALTER TABLE la tabla original es legible por otros clientes. Las actualizaciones y escrituras en la tabla se esperan hasta que la nueva tabla esté lista, luego se redirigen automáticamente a la nueva tabla sin ninguna actualización fallida.

Tenga en cuenta que si usa cualquier otra opción en ALTER TABLE distinta a RENAME, MySQL siempre crea una tabla temporal, incluso si los datos no necesitan ser copiados (tales como cuando cambia el nombre de una columna). Planeamos arreglar esto en el futuro, pero debido a que ALTER TABLE no es un comando que se use frecuentemente, no es un tema demasiado urgente. Para tablas MyISAM puede incrementar la velocidad de la operación de recrear índices (que es la parte más lenta del proceso de alteración) mediante la variable de sistema myisam_sort_buffer_size poniendo un valor alto.

- Para usar ALTER TABLE, necesita ALTER, INSERT, y permisos CREATE para la tabla.

- IGNORE es una extensión MySQL a SQL estándar. Controla cómo funciona ALTER TABLE si hay duplicados en las claves primarias en la nueva tabla o si ocurren advertencias cuando está activo el modo STRICT. Si no se especifica IGNORE, entonces para duplicados con clave única, solo se usa el primer registro. El resto de registros conflictivos se borran. Los valores erróneos se truncan al valor más cercano aceptable.

- Puede ejecutar múltiples cláusulas ADD, ALTER, DROP y CHANGE en un único comando ALTER TABLE. Esta es una extensión MySQL estándar SQL que permite solo una de cada cláusula por comando ALTER TABLE. Por ejemplo, para borrar múltiples columnas en un único comando:

  ```mysql
  mysql> ALTER TABLE t2 DROP COLUM c DROP COLUM d;
  ```

- CHANGE col_name, DROP col_name y DROP INDEX son extensiones MySQL al estándar SQL.

- MODIFY es una extensión de Oracle a ALTER TABLE.

- La palabra COLUMN es opcional y puede omitirse.

- Si usa ALTER TABLE tbl_name RENAME TO new_tbl sin ninguna otra opción MySQL simplemente renombra cualquier fichero que se corresponda a la tabla tbl_name. No es necesario crear una tabla temporal. (Puede usar el comando RENAME TABLE para renombrar tablas).

- Las cláusulas column_definition usan la misma sintaxis para ADD y CHANGE así como CREATE TABLE. Tenga en cuenta que esta sintaxis incluye el nombre de la columna, no solo el tipo.

- Puede renombrar una columna usando CHANGE old_col_name column_definition. Para ello, especifique el nombre de la columna viejo y nuevo y el tipo de la columna actual. Por ejemplo, para renombrar una columna INTEGER de a a b, puede hacer:

  ```mysql
  mysql> ALTER TABLE t1 CHANGE b INTEGER;
  ```

  Si quiere cambiar el tipo de una columna pero no el nombre, la sintaxis CHANGE necesita un nombre viejo y nuevo de columna, incluso si son iguales. Por ejemplo:

  ```mysql
  mysql> ALTER TABLE t1 CHANGE b b BIGINT NOT NULL;
  ```

  Puede usar MODIFY para cambiar el tipo de una columna sin renombrarla:

  ```mysql
  mysql> ALTER TABLE t1 MODIFY b BIGINT NOT NULL;
  ```

- Si usa CHANGE o MODIFY para acortar una columna para la que existe un índice en la columna, y la longitud de la columna resultante es menor que la del índice, MySQL reduce el índice automáticamente.

- Cuando cambia un tipo de columna usando CHANGE o MODIFY, MySQL intenta convertir valores de columna existentes al nuevo tipo lo mejor posible.

- En MySQL 5.0, puede usar FIRST o AFTER col_name para añadir una columna a una posición específica sin un registro de tabla. Por defecto se añade al final. Puede usar FIRST y AFTER en operaciones CHANGE o MODIFY en MySQL 5.0.

- ALTER COLUMN especifica un nuevo valor por defecto para una columna o borra el antiguo valor por defecto. Si el antiguo valor por defecto se borra y la columna puede ser NULL, el nuevo valor por defecto es NULL. Si la columna no puede ser NULL, MySQL asigna un valor por defecto.

- DROP INDEX borra un índice. Es una extensión MySQL al estándar SQL.

- Si las columnas se borran de una tabla, las columnas también se borran de cualquier índice del que forman parte. Si todas las columnas que crean un índice se borran, también se borra el índice.

- Si una tabla contiene solo una columna, la columna no puede borrarse. Si lo que quiere es borrar la tabla, use DROP TABLE.

- DROP PRIMARY KEY borra el índice primario. Nota: En versiones anteriores de MySQL, si no existe clave primaria, entonces DROP PRIMARY KEY borraría el primer índice UNIQUE de la tabla. Esto ya no es así en MySQL 5.0, cuando trata de usar DROP PRIMARY KEY en una tabla sin clave primaria daría lugar a un error.

- Si añade UNIQUE INDEX o PRIMARY KEY a una tabla, se almacena antes que cualquier índice no único para que MySQL pueda detectar claves duplicadas tan rápido como sea posible.

- Si usa ALTER TABLE en una tabla MyISAM, todos los índices no únicos se crean en un barch separado (como para REPAIR TABLE). Esto debe hacer ALTER TABLE mucho más rápido cuando tiene muchos índices.

  En MySQL 5.0, esta característica puede activarse explícitamente ALTER TABLE...DISABLE KEYS le dice a MySQL que pare de actualizar índice no únicos para una tabla MyISAM. ALTER TABLE ...ENABLE KEYS debe usarse para recrear índices perdidos. MySQL lo hace con un algoritmo especial que es mucho más rápido que insertar claves una a una, así que deshabilitar claves antes de realizar operaciones de inserción masivas debería dar una mejora de velocidad. Usar ALTER TABLE... DISABLE KEYS requiere del permiso INDEX además de los permisos mencionados anteriormente.

- Las cláusulas FOREING KEY y REFERENCES son soportadas por el motor InnoDB, que implementa ADD[CONSTRAINT[symbol]]FOREING KEY(...)REFERENCES...(...). Para otros motores de almacenamiento, las cláusulas se parsean pero se ignoran. La cláusula CHECK se parsea pero se ignora por todos los motores de almacenamiento. La razón para aceptar pero ignorar las cláusulas es para compatibilidad, para hacer más fácil portar código de otros servidores SQL, y para ejecutar aplicaciones que crean tablas con referencias.

- En MySQL 5.0, InnoDB soporta el uso de ALTER TABLE para borrar claves foráneas:

  ```mysql
  ALTER TABLE yourtablename DROP FOREING KEY fk_symbol;
  ```

- ALTER TABLE ignora las opciones DATA DIRECTORY y INDEX DIRECTORY.

  Si quiere cambiar el conjunto de caracteres por defecto de la tabla y todas las columnas de caracteres (CHAR, VARCHAR, TEXT) a un nuevo conjunto de caracteres use un comando como:

  ```mysql
  ALTER TABLE tbl_name CONVERT TO CHARACTER SET charset_name;
  ```

  Atención: La operación precedente convierte los valores de columnas entre conjuntos de caracteres. Esto no es lo que quiere hacer si tiene una columna en un conjunto de caracteres (como latin1) pero los valores almacenados realmente usan otro conjunto de caracteres incompatible (como UTF8). En este caso, tiene que hacer lo siguiente para cada una de tales columnas:

  ```mysql
  ALTER TABLE t1 CHANGE ci ci BLOB;
  ALTER TABLE t1 CHANGE Ci Ci TEXT CHARACTER SET utf8;
  ```

  La razón de que esto funcione es que no hay conversión cuando convierte desde o hacia columnas BLOB.

  Si especifica CONVERT TO CHARACTER SET binary, las columnas CHAR, VARCHAR y TEXT se convierten a sus cadenas de caracteres binarias (BINARY, VARBINARY, BLOB). Esto significa que las columnas no tendrán un conjunto de caracteres y que siguiendo operaciones CONVERT TO no se les aplicarán.

  Para solo cambiar el conjunto de caracteres por defecto de una tabla, use este comando:

  ```mysql
  ALTER TABLE tbl_name DEFAULT CHARACTER SET charset_name; 
  ```

  La palabra DEFAULT es opcional. El conjunto de caracteres por defecto es que se usa si no se especifíca uno para una nueva columna que añado a la tabla ( por ejemplo con ALTER TABLE...ADD column).

  Atención: En MySQL 5.0 ALTER TABLE...DEFAULT CHARACTER SET y ALTER TABLE...CHARACTER son equivalentes y cambian solo el conjunto de caracteres por defecto de  la tabla.

- Para una tabla InnoDB creada con su propio espacio de tablas en un fichero .ibd, este fichero puede descartarse e importarse. Para descartar el fichero .ibd use este comando:

  ```mysql
  ALTER TABLE tbl_name DISCARD TABLESPACE;
  ```

  Esto borra el fichero .ibd actual, así que asegúrese que tiene primero una copia de seguridad. Tratar de acceder a la tabla mientras se descarta el fichero provoca un error.

  Para importar el fichero .ibd de la copia de seguridad de nuevo a la tabla, cópielo en el directorio de la base de datos, luego realice el comando:

  ```mysql
  ALTER TABLE tbl_name IMPORT TABLESPACE;
  ```

- Con la función mysql_info() de la API de C, puede consultar el número de registros copiados, y (cuando se usa IGNORE) cuántos registros se borraron debido a duplicación de valores de claves única.

  Hay algunos ejemplos que muestran usos de ALTER TABLE. Comienza con una tabla t1 que se crea como se muestra:

  ```mysql
  mysql> CREATE TABLE t1 (a INTEGER, b CHAR(10));
  ```

  Para renombrar la tabla de t1 a t2

  ```
  mysql> ALTER TABLE t1 RENAME t2;
  ```

  Para cambiar la columna a desde INTEGER a TINYTINT NOT NULL (dejando el mismo nombre), y para cambiar la columna b desde CHAR(10) a CHAR(20) así como dejarla de b a c.

  ```mysql
  mysql>ALTER TABLE t2 MODIFY a TINYINT NOT NULL CHANGE bc CHAR(20;)
  ```

  Para añadir una nueva columna TIMESTAMP llamada d:

  ```mysql
  mysql>ALTER TABLE t2 ADD d TIMESTAMP;
  ```

   Para añadir índices en las columnas d y a:

  ```mysql
  mysql>ALTER TABLE t2 ADD INDEX(d), ADD INDEX(A);
  ```

  Para borrar la columna c:

  ```mysql
  mysql>ALTER TABLE t2 DROP COLUMN c;
  ```

  Para añadir una nueva columna entera AUTO_INCREMENT llamada c:

  ```mysql
  mysql>ALTER TABLE t2 ADD C INT UNSIGNED NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY(c);
  ```

  Tenga en cuenta que indexamos c (como PRIMARY KEY) ya que las columnas AUTO_INCREMENT deben indexarse y también que declaramos c como NOT NULL, ya que las columnas de clave primaria no pueden ser NULL.

  Cuando se añade una columna AUTO_INCREMENT los valores se rellenan con números secuenciales automáticamente. Para tablas MyISAM puede asignar el primer número de secuencia ejecutando SET INSERT_ID=value antes de ALTER TABLE o usando la opción de tabla AUTO_INCREMENT=value.

  Desde MySQL 5.0.3, puede usar la opción de tabla ALTER TABLE ... AUTO_INCREMENT=value para InnoDB para asignar el número de secuencia de nuevos registros si el valor es mayor que el máximo valor en la columna AUTO_INCREMENT. Si el valor es menor que el máximo actual en la columna, no se da ningún mensaje de error y el valor de secuencia actual no se cambia.

  Con las tablas MyISAM, si no cambia la columna AUTO_INCREMENT, el número de secuencia no se ve afectado. Si elimina una columna AUTO_INCREMENT y luego añade otra columna AUTO_INCREMENT los números se resecuencian comenzando en 1.



**Sintaxis de CREATE DATABASE**

```mysql
CREATE {DATABASE | SCHEMA} [IF NOT EXISTS] db_name    
[create_specification][,create_specification]...  
create_specification: 
[DEFAULT] CHARACTER SET charset_name
| [DEFAULT] COLLATE collation_name
```

CREATE DATABASE crear una base de datos con el nombre dado. Para usar CREATE DATABASE, necesita el permiso CREATE en la base de datos. 

Ocurre un error si la base de datos existe y no se especifica IF NOT EXISTS.

En MySQL 5.0, las opciones de create_specification pueden darse para especificar característica de la base de datos. Las características se almacenan en el fichero db.opt en el directorio de la base de datos. La cláusula CHARACTER SET especifica el conjunto de caracteres por defecto de la base de datos. La cláusula COLLATE especifica la colación por defecto de la base de datos.

Las bases de datos en MySQL se implementan como directorios que contienen fichero que se corresponden a tablas en la base de datos. Como no hay tablas en la base de datos cuando se crean inicialmente, el comando CREATE DATABASE en MySQL 5.0 crea solo un directorio bajo el directorio de datos MySQL y el fichero db.opt file.

Si crea manualmente un directorio bajo el directorio de datos (por ejemplo, con mkdir), el servidor lo considera como un directorio de base de datos y muestra la salida de SHOW DATABASES.

CREATE SCHEMA puede usarse desde MySQL 5.0.2.

También puede usar el programa mysqladmin para crear bases de datos.



**CREATE INDEX**

```mysql
CREATE [UNIQUE | FULLTEXT | SPATIAL] INDEX index_name
[USING index_type]
ON tbl_name (index_col_name,...)
index_col_name:
col_name[(length)][ASC | DESC]
```

En MySQL 5.0, CREATE INDEX se mapea a un comando ALTER TABLE para crear índices.

Normalmente, crea todos los índices en una tabla cuando se crea la propia tabla con CREATE TABLE.

Una lista de columnas de la forma (col1, col2,...) crea un índice de múltiples columnas. Los valores de índice se forman al concatenar los valores de las columnas dadas.

Para columnas CHAR y VARCHAR, los índices pueden crearse para que usen solo parte de una columna, usando col_name(length) para indexar un prefijo consistente en los primeros length caracteres de cada valor de la columna. BLOB TEXT pueden indexarse, pero se debe dar una longitud de prefijo.

El comando mostrado aquí crea un índice usando los primeros 10 caracteres de la columna name:

```mysql
CREATE INDEX par_of_name ON customer (name(10));
```

Como la mayoría de nombres usualmente difieren en los primeros 10 caracteres, este índice no debería ser mucho más lento que un índice creado con la columna name entera. Además, usar columnas parcialmente para índices puede hacer un fichero índice mucho menor, que puede ahorrar mucho espacio de disco y además acelerar las operaciones INSERT.

Los prefijos pueden tener una longitud de hasta 255 bytes. Para tablas MyISAM y InnoDB en MysSQL 5.0, pueden tener una longitud de hasta 1000 bytes. Tenga en cuenta que los límites de los prefijos se miden en bytes, mientras que la longitud de prefijo en comando CREATE INDEX se interpreta como el número de caracteres. Tenga esto en cuenta cuando especifique una longitud de prefijo para una columnas que use un conjunto de caracteres de múltiples bytes.

Una especificación index_col_name puede acabar con ASC o DESC. Estas palabras se permiten para extensiones futuras para especificar almacenamiento de índice ascendente o descendente. Actualmente se parsean pero se ignoran; los valores de índice siempre se almacenan en orden ascendente.

En MySQL 5.0, algunos motores le permiten especificar un tipo de índice cuando se crea un índice. La sintaxis para el especificador index_type es USING type_name. Los valores type_name posibles soportados por distintos motores se muestran en la siguiente tabla. Donde se muestran múltiples tipos de índice, el primero es el tipo por defecto cuando no se especifica index_type.

| Motor de almacenamiento | Tipos de índice permitidos |
| ----------------------- | -------------------------- |
| MyISAM                  | BTREE                      |
| InnoDB                  | BTREE                      |
| MEMORY/HEAP             | HASH,BTREE                 |

Ejemplo:

```mysql
CREATE TABLE lookup (id INT) ENGINE = MEMORY;
CEATE INDEX id_index USING BTREE ON lookup (id);
```

TYPE type_name puede usarse como sinónimo de USING type_name para especificar un tipo de índice. Sin embargo, USING es la forma preferida. Además, el nombre de índice que precede el tipo de índice en la especificación de la sintaxis de índice no es opcional con TYPE. Esto es debido a que, en contra de USING, TYPE no es una palabra reservada y se interpreta como nombre de índice.

Si se especifica un tipo de índice que no es legal para un motor de almacenamiento, pero hay otro tipo de índice disponible que puede usar el motor sin afectar los resultados de la consulta, el motor usa el tipo disponible.

Índices FULLTEXT en MySQL 5.0 pueden indexar solo columnas CHAR, VARCHAR y TEXT, y solo en tablas MyISAM.

Índices SPATIAL en MySQL 5.0 pueden indexar solo columnas espaciales, y solo en tablas MyISAM.



### Sintaxis de CREATE TABLE

```mysql
CREATE [TEMPORARY] TABLE [IF NOT EXISTS] tbl_name
[(create_definition,...)]
[table_options][select_statement]
```

O:

![image-20241029104432969](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241029104432969.png)

![image-20241029104532975](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241029104532975.png)

CREATE TABLE crea una tabla con el nombre dado. Debe tener permiso CREATE para la tabla.

Por defecto, la tabla se crea en la base de datos actual. Ocurre un error si la tabla existe, si no hay base de datos actual o si la base de datos no existe.

En MySQL 5.0, el nombre de la tabla puede especificarse como db_name.tbl_name para crear la tabla en la base de datos específica. Esto funciona haya una base de datos actual o no. Si usa identificadores entre comillas, entrecomille el nombre de la base de datos y de tabla por separado. Por ejemplo, 'mydb'.'mytbl' es legal pero 'mydb.mytbl' no.

Puede usar la palabra TEMPORARY al crear una tabla. Una tabla TEMPORARY es visible solo para la conexión actual, y se borra automáticamente cuando la conexión se cierra. Esto significa que dos conexiones distintas pueden usar el mismo nombre de tabla temporal sin entrar en conflicto entre ellas ni con tablas no TEMPORARY con el mismo nombre. (La table existente se oculta hasta que se borra la tabla temporal). En MySQL 5.0, debe tener el permiso CREATE TEMPORARY TABLES para crear tablas temporales.

MySQL 5.0 soporta las palabras IF NOT EXISTS para que no ocurra un error si la tabla existe. Tenga en cuenta que no hay verificación que la tabla existente tenga una estructura idéntica a la indicada por el comando CREATE TABLE. Nota: Si se usa IF NOT EXISTS en un comando CREATE TABLE...SELECT, cualquier riesgo seleccionado por la  parte SELECT se inserta si la tabla existe o no.

MySQL representa cada tabla mediante un fichero .frm de formato de tabla (definicón) en el directorio de base de datos. El motor para la tabla puede crear otros ficheros también. En el caso de tablas MyISAM, el motor crea ficheros índice y de datos. Por lo tanto, para cada tabla MyISAM tbl_name, hay tres ficheros de disco:

| Fichero      | Propósito                                |
| ------------ | ---------------------------------------- |
| tbl_name.frm | Fichero de formato de tabla (definición) |
| tbl_name.MYD | Fichero de datos                         |
| tbl_name.MYI | Fichero índice                           |

Una columna entera puede tener el atributo adicional AUTO_INCREMENT. Cuando inserta un valor de NULL (recomendado) o 0 en una columna AUTO_INCREMENT autoindexada, la columna se asigna al siguiente valor de secuencia. Típicamente esto es value+1, donde value es el mayor valor posible para la columna en la tabla. Secuencias AUTO_INCREMENT comienzan con 1. Tales columnas deben definirse como uno de los tipos enteros, "Panorámica de tipos numéricos". (El valor 1.0 no es un entero.)

En MySQL 5.0, especificar NO_AUTO_VALUE_ON_ZERO para la opción de servidor-sql-mode o la variable de sistema sql_mode le permite almacenar 0 en columnas AUTO_INCREMENT como 0 sin generar un nuevo valor de secuencia.

 Nota: Solo puede haber una columna AUTO_INCREMENT por tabla, debe estar indexada y no puede tener un valor DEFAULT. Una columna AUTO_INCREMENT funciona correctamente solo si contiene valores positivos. Insertar un número negativo se trata como insertar un número positivo muy grande. Esto se hace para evitar problemas de precisión cuando los números "cambian" de positivos a negativos y asegura que no obtiene accidentalmente una columna AUTO_INCREMENT que contenga 0.

Para tablas MyISAM y BDB, puede especificar una columna AUTO_INCREMENT secundaria en una clave de múltiples columnas.

Para hacer MySQL compatible con otras aplicaciones ODBC, puede encontrar el valor AUTO_INCREMENT para el último registro insertado con la siguiente consulta:

```mysql
SELECT FROM tbl_name WHERE auto_col IS NULL; 
```

- En MySQL 5.0, las definiciones de columnas de caracteres puede incluir un atributo CHARACTER SET para especificar el conjunto de caracteres y , opcionalmente, una colación para la columna.

  ```mysql
  CREATE TABLE t (c CHAR(20) CHARACTER SET utf8 COLLATE utf8_bin);
  ```

- MySQL 5.0, interpreta las especificaciones de longitud en definiciones de columna en caracteres (Algunas versiones anteriores los interpretan en bytes).

- La cláusula DEFAULT especifica el valor por defecto para una columna. Con una excepción, el valor por defecto debe ser constante; no puede ser una función o una expresión. Esto significa, por ejemplo, que no puede poner como valor por defecto de una columna el valor de una función como NOW() o CURRENT_DATE. La excepción que pude especificar CURRENT_TIMESTAMP como defecto para columnas TIMESTAMP.

  Antes de MySQL 5.0.2, si una definición de columna no incluye valor DEFAULT explícito MySQL determina el valor por defecto como sigue:

  Si la columna puede tener valores NULL, la columna se define como una claúsula DEFAULT NULL explícita.

  Si la columna no puede tener valores NULL, MySQL define la columna con una cláusula DEFAULT explícita, usando el valor por defecto implícito para el tipo de datos de la columna. Los valores por defecto implícitos se definen como sigue:

  - Para tipos numéricos distintos a los declarados con el atributo AUTO_INCREMENT, por defecto es 0. Para una columna AUTO_INCREMENT, el valor por defecto es el siguiente valor de la secuencia.
  - Para tipos de fecha y hora distintos a TIMESTAMP, el valor por defecto es el valor "cero" apropiado para el tipo. Para la primera columna TIMESTAM en una tabla el valor por defecto es la fecha actual y la hora.
  - Para tipos de cadenas distintos a ENUM, el valor por defecto es la cadena vacía. Para ENUM, el valor por defecto es el primer valor de la enumeración.

  Las columnas BLOB y TEXT no pueden tener un valor por defecto.

  Desde MySQL 5.0.2, si una definición de columna no incluye valor DEFAULT explícito, MySQL determina el valor por defecto como sigue:

  - Si la columna puede tener NULL como valor, la columna se define con una cláusula DEFAULT NULL explícita. Esto es lo mismo que antes de 5.0.2.

  - Si la columna no puede tener valores NULL, MySQL define la columna sin cláusula DEFAULT explícita. Para entradas de datos, si un comando INSERT o REPLACE no incluye valor para la columna, MySQL trata la columna según el modo SQL activo en ese momento:

    - Si el modo estricto no está activado, MySQL pone en la columna el valor por defecto implícito para el tipo de datos de la columna,
    - Si está activo el modo estricto, ocurre un error para tablas transaccionales y el comando se deshace. Para tablas no transaccionales, ocurre un error, pero si esto ocurre para el segundo registro o siguientes de un comando de múltiples registros, los registros precedentes se insertarán.

    Suponga que una tabla t se define como sigue:

    ```mysql
    CREATE TABLE t (i INT NOT NULL);
    
    INSERT INTO t VALUES();
    INSERT INTO t VALUES(DEFAULT);
    INSERT INTO t VALUES(DEFAULT(i));
    ```

    En este caso, i no tiene valor explícito, así que en modo estricto todos los siguientes comando producen un error en modo estricto y no se inserta ningún registro. Para modo no estricto, solo el tercer comando produce un error; el valor implícito por defecto se inserta para las dos primeras, pero la tercera falla ya que DEFAULT(i) no puede producir un valor.

Para una tabla dada puede usar el comando SHOW CREATE TABLE para ver que columnas puede tener una cláusula explícita DEFAULT.

Un comentario para una columna puede especificarse en MySQL 5.0 con la opción COMMENT. El comentario se muestra con los comandos SHOW CREATE TABLE y SHOW FULL COLUMNS.

En MySQL 5.0, el atributo SERIAL puede usarse como un alias para BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE.

KEY normalmente es sinónimo para INDEX. En MySQL 5.0, el atributo calve PRIMARY KEY puede especificarse como KEY cuando se da en una definición de columna. Esto se implementó por compatibilidad con otros sistemas de bases de datos.

En MySQL, un índice UNIQUE es uno en que todos los valores en el índice deben ser distintos. Ocurre un error si intenta añadir un nuevo registro con una clave que coincida con un registro existente. La excepción es que una columna en el índice puede contener valores NULL, puede contener valores NULL múltiples. Esta excepción no se aplica a las tablas BDB, en las que una columna indexada le permita un único NULL.

Una PRIMARY KEY es una KEY única donde todas las columnas de la clave deben definirse como NOT NULL. Si no se declaran explícitamente como NOT NULL, MySQL las declara implícitamente ( y sin decirlo). Una tabla puede tener sólo una PRIMARY KEY. Si no tiene una PRIMARY KEY y una aplicación pide una PRIMARY KEY en sus tablas, MySQL retorna el primer índice UNIQUE que no tenga columnas NULL como la PRIMARY KEY.

En la tabla creada, una PRIMARY KEY se guarda en primer lugar, seguida por todos los índices UNIQUE, y luego los índices no únicos. Esto ayuda al optimizador MySQL a priorizar qué índice usar y también detectar más rápido claves UNIQUE duplicadas.

Una PRIMARY KEY puede ser un índice de múltiples columnas. Sin embargo, no puede crear un índice de múltiples columnas usando el atributo de clave PRIMARY KEY en una especificación de columnas. Hacerlo sólo marca la columna como primaria. Debe usar una cláusula PRIMARY KEY(index_col_name,...) separada.

Si un índice PRIMARY KEY o UNIQUE consiste sólo de una columna que tenga un tipo entero, puede referirse a la columna como _rowid en comandos SELECT.

En MySQL, el nombre de una PRIMARY KEY es PRIMARY. Para otros índices, si no asigna nombre, el índice tienen el mismo nombre que la primera columna indexada, con un sufijo opcional (_2, _3,...) para hacerlo único. Puede ver los nombres de índice para una tabla usando SHOW INDEX FROM tbl_name.

A partir de MySQL 5.0, algunos motores de almacenamiento le permiten especificar un tipo de índice al crear el índice.

En MySQL 5.0, sólo los motores MyISAM, InnoDB, BDB y MEMORY soporta índices en columnas que pueden tener valores NULL. En otros casos, debe declarar columnas indexadas como NOT NULL u ocurre un error.



Con sintaxis col_name (length) en una especificación de índice, puede crear un índice que use sólo los primeros length caracteres de una columna CHAR o VARCHAR. Indexar sólo un prefijo de valores de columna como este puede hacer el fichero de índice mucho más pequeño.

En MySQL 5.0, los motores MyISAM e InnoDB soportan indexación en columnas BLOB y TEXT. Al indexar columnas BLOB y TEXT debe especificar una longitud de prefijo para el índice. Por ejemplo:

```
CREATE TABLE test(blob_clo BLOB, INDEX(blob_col(10)));
```

En Mysql 5.0, los prefijos pueden tener hasta 1000 bytes de longitud para tablas MyISAM e InnoDB y 255 bytes para otros tipos de tablas. Tenga en cuenta que los límites de prefijo se miden en bytes, mientras que la longitud de prefijo en comando CREATE TABLE se interpretan como el número de caracteres. Asegúrese de tener esto en cuenta al especificar una longitud de prefijo para una columna que use un conjunto de caracteres multi-byte.

Una especificación index_col_name puede acabar con ASC o DESC. Estas palabras clave se permiten para extensiones futuras para especificar almacenamiento de índices ascendente o descendente. Actualmente se parsean pero no se ignoran; los valores de índice siempre se almacenan en orden ascendente.

Cuando usa ORDER BY o GROUP BY en una columna TEXT o BLOB en un SELECT, el servidor ordena los valores usando solo el número inicial de bytes indicados por la variable de sistema max_sort_length.

 En MySQL 5.0, puede crear índices especiales FULLTEXT, que se usan para índices fulltext. Solo las tablas MyISAM soportan índices FULLTEXT. Pueden crearse solo desde columnas CHAR, VARCHAR y TEXT. La indexación siempre se hace sobre la columna entera; la indexación parcial no se soporta y cualquier longitud de prefijo se ignora.

En MySQL 5.0, puede crear índices SPATIAL en tipos de columna espaciales. Los tipos espaciales se soportan solo para tablas MyISAM y las columnas indexadas deben declararse como NOT NULL. Consulte capítulo 18, Extensiones espaciales de MySQL.

En MySQL 5.0, las tablas InnoDB soportan el chequeo de restricciones de claves foráneas. Tenga en cuenta que la sintaxis FOREIGN KEY en InnoDB es más restrictiva que la sintaxis presentada para el comando CREATE TABLE al inicio de esta sección: las columnas en la tabla referenciada debe siempre nombrarse explícitamente. InnoDB soporta tanto acciones ON DELETE como ON UPDATE en MySQL 5.0.

Para otros motores de almacenamiento, MySQL Server parsea la sintaxis FOREIGN KEY y REFERENCES en comando CREATE TABLE, pero no hace nada. La cláusula CHECK se parsea pero se ignora en todos los motores de almacenamiento.

Para tablas MyISAM cada columna NOT NULL ocupa un bit extra, redondeando al byte más próximo. La máxima longitud de registro en bytes puede calcularse como sigue:

```
row length =1
+ (sum of columns lengths)
+ (number of NULL columns + delete_flag + 7)/8
+ (number of variable-length columns)
```

delete_-flages 1 para tables con formato de registro estático. Las tablas estáticas usan un bit en el registro para un flag que indica si el registro se ha borrado. delete_flages 0 para tablas dinámicas ya que el flag se almacena en una cabecera de registro dinámica.

Estos cálculos no se aplican en tablas InnoDB, en las que el tamaño de almacenamiento no es distinto para columnas NULL y NOT NULL.

La parte table_options de la sintaxis CREATE TABLE puede usarse desde MySQL 3.23.

Las opciones ENGINE y TYPE especifican el motor de almacenamiento para la tabla. ENGINE es el nombre preferido para la opción en MySQL 5.0, y TYPE esta obsoleto. El soporte para la palabra TYPE usada en este contexto desaparecerá en MySQL 5.1.

Las opciones ENGINE y TYPE pueden tener los siguientes valoes:

![image-20241029234537987](file:///C:/Users/dell/AppData/Roaming/Typora/typora-user-images/image-20241029234537987.png?lastModify=1730715182)

Si un motor no está disponible, MySQL usa en su lugar MyISAM. Por ejemplo, si una definición de tabla incluye la opción ENGI-NE=BDB pero el servidor MySQL no soporta tablas BDB, la tabla se crea como MyISAM. Esto hace posible tener un entorno de replicación donde tiene tablas transaccionales en el maestro pero tablas no transaccionales en el esclavo (para tener más velocidad). En MySQL 5.0, aparece una advertencia si la especificación del motor no es correcta.

Las otras opciones de tabla se usan para optimizar el comportamiento de la tabla. En la mayoría de casos, no tiene que especificar ninguna de ellas. La opción funciona para todos los motores a no ser que se indique lo contrario:

 **AUTO_INCREMENT**

El valor inicial para AUTO_INCREMENT para la tabla. En MySQL 5.0, solo funciona para tablas MyISAM y MEMORY. También se soporta para InnoDB desde MySQL 5.0.3. Para iniaclizar el primer valor de auto incremento para motores que no soporten esta opción, inserte un registro de prueba con un valor que sea uno menor al deseado tras crear la tabla, y luego borre este registro.

Para motores que soportan la opción de tabla AUTO_INCREMENT en comando CREATE TABLE puede usar ALTER TABLE tbl_name AUTO_INCREMENT = n para resetear el valor AUTO_INCREMENT.

**AVG_ROW_LENGTH**

Una aproximación de la longitud media de registro para su tabla. Necesita inicializarla solo para tablas grandes con registros de longitud variable.

Cuando crea una tabla MyISAM, MySQL usa el producto de lasa opciones MAX_ROWS y AVG_ROW_LENGTH para decidir el tamaño de la tabla resultante. Si no las especifica, el tamaño máximo para la tabla es 65,536TB de datos (4GB antes de MySQL 5.0.6). (Si su sistema operativo no soporta ficheros de este tamaño, los tamaños de fichero se restringen al límite del sistema operativo). Si quiere mantener bajos los tamaños de los punteros para que el índice sea pequeño y rápido y no necesita realmente ficheros grandes, puede decrementar el tamaño de puntero por defecto mediante la variable del sistema myi-sam_data_pointer_size que se añadió en MySQL 4.1.2. Si se quiere que todas sus tablas sean capaces de crecer por encima del límite por defecto y quiere mantener sus tablas ligeramente más lentas y más grandes de lo necesario, puede incrementar el tamaño de puntero por defecto cambiando esta variable.

**[DEFAULT] CHARACTER SET**

Especifica el conjunto de caracteres para la tabla. CHARSET es un sinónimo para CHARACTER SET.

**COLLATE**

Especifica la colación por defecto de la tabla.

**CHECKSUM**

Póngalo a 1 si quiere que MySQL mantenga un checksum para todos los registros (un checksum que MySQL actualiza automáticamente según cambia la tabla). Esto hace que la tabla tenga actualizaciones más lentas, pero hace más fácil encontrar tablas corruptas. El comando CHECKSUM TABLE muestra el checksum (solo para MyISAM).

**COMMENT**

Un comentario para su tabla hasta 60 caracteres.

**MAX_ROWS**

Máximo número de registros que planea almacenar en la tabla. No es un límite en absoluto, sino un indicador que la tabla debe ser capaz de almacenar al menos estos registros.

**MIN_ROWS**

Mínimo número de registros que planea almacenar en la tabla.

**PACK KEYS**

Ponga esta opción a 1 si quiere tener índices más pequeños. Esto hace normalmente que las actualizaciones sean más lentas y las lecturas más rápidas. Poner esta opción a 0 deshabilita la comprensión de claves. Ponerla a DEFAULT le dice al motor que comprima solo columnas CHAR/VARCHAR largas (MyISAM y ISAM solo).

Si no usa PACK_KEYS, por defecto se comprimen solo cadena, no números. Si usa PACK_KEYS = 1, también se empaquetan números.

Al comprimir claves de números binarios, MySQL usa comprensión de prefijo:

Cada clave necesita un byte extra para indicar cuántos bytes de la clave previa son los mismos para la siguiente clave.

El puntero al registro se almacena en orden de el mayor-byte-primero directamente tras la clave, para mejorar la comprensión.

Esto significa que si tiene muchas claves iguales en dos registros consecutivos, todas las "mismas" claves siguientes usualmente solo ocupan dos bytes (incluyendo el puntero al registro). Comparar esto con el caso ordinario donde las siguientes claves ocupan storage_size_for_key + pointer_size (donde el tamaño del puntero es usualmente 4). Obtiene un gran beneficio a partir de la comprensión de prefijos señalo si tiene muchos números que sean el mismo. Si todas las claves son totalmente distintas, usa un byte más por clave, si la clave no es una clave que pueda tener valores NULL. (En ese caso, el tamaño empaquetado de la clave se almacena en el mismo byte que se usa para marcar si una clave es NULL).

**PASSWORD**

Cifra el fichero .frm con un contraseña. Esta opción no hace nada en la versión estándar de MySQL.

**DELAY_KEY_WRITE**

Póngalo a 1 si quiere retardar actualizaciones de clave para la tabla hassta que se cierra (solo en MyISAM).

**ROW_FORMAT**

Define cómo deben almacenarse los registros. Actualmente esta opción solo funciona con tablas MyISAM. El valor de la opción puede ser FIXED o DYNAMIC para formato de longitud estática o variable.  myisampack cambia el tipo a COMPRESSED.

**RAID_TYPE**

Tenga en cuenta que el soporte para RAID se ha eliminado desde MySQL 5.0.

**UNION**

UNION se usa cuando quiere usar una colección de tablas idénticas como una. Funciona solo con tablas MERGE.

En MySQL 5.0, debe tener permisos SELECT, UPDATE y DELETE para las tablas mapeadas en una tabla MERGE. (Nota: Originalmente, todas las tablas usadas tenían que estar en la misma base de datos que la tabla MERGE. Esta restricción se ha eliminado).

**INSERT_METHOD**

Si quiere insertar datos en una tabla MERGE debe especificarlo con INSERT_METHOD en la tabla en que se debe insertar el registro. INSERT_METHOD es una opción útil para tablas MERGE solo. Use un valor de FIRST o LAST para que las inserciones vayan a la primera o última tabla, o un valor de NO para evitar insercciones.

**DATA DIRECTORY, INDEX DIRECTORY**

Usando DATE DIRECTORY = 'directory' o INDEX_DIRECTORY = 'directory' puede especificar dónde debe el motor MyISAM guardar un fichero de datos e índice de una tabla. Tenga en cuenta que el directorio debe ser una ruta completa al directorio (no una ruta relativa).

Estas opciones solo funcionan cuando no usa la opción --skip-simbolics-links. Su sistema operativo debe tener una llamada realpath() que funcione bien.

En MySQL 5.0, puede crear una tabla de otra añadiendo un comando SELECT al final del comando CREATE TABLE:

```
CREATE TABLE new_tbl SELECT * FROM orig_tbl;
```

MySQL crea nuevas columnas para todos los elementos de un SELECT. Por ejemplo:

```
CREATE TABLE test (a INT NOT NULL AUTO_INCREMENT 
PRIMARY KEY (a), KEY(b))
TYPE = MyISAM SELECT b,c FROM test2;
```

Esto crea una tabla MyISAM con tres columnas a, b y c. Tenga en cuenta que las columnas para el comando SELECT se añaden a la derecha de la tabla, no se sobreescriben en la misma. Consulte el siguiente ejemplo:

![image-20241031112204205](file:///C:/Users/dell/AppData/Roaming/Typora/typora-user-images/image-20241031112204205.png?lastModify=1730715182)

Para cada registro en la tabla foo, se inserta un registro en bar con los valores de foo y valores por defecto para las nuevas columnas:

Si hay cualquier error al copiar los datos a la tabla, se borra automáticamente y no se crea.

CREATE TABLE ... SELECT no crea ningún índice automáticamente. Se hace a propósito para hacer el comando lo más flexible posible. Si quiere tener índices en la tabla creada, debe especificarlo antes del comando SELECT:

```
CREATE TABLE bar (UNIQUE(n) SELECT n FROM foo);
```

Algunas conversiones de tipos de columnas pueden ocurrir. Por ejemplo, el atributo AUTO_INCREMENT no se preserva, y las columnas VARCHAR pueden ser CHAR.

Al crear una tabla con CREATE...SELECT, asegúrese de poner un alias para cualquier llamada a función o expresión en la consulta. Si no lo hace, el comando CREATE puede fallar o crear nombres de columnas no deseados.

```
CREATE TABLE artits_and_works
SELECT artit.name, COUNT(work.artist_id) AS number_of_works
FROM artist LEFT JOIN work ON artist.id = work.artist_id
GROUP BY artist.id;
```

Puede especificar explícitamente el tipo de una columna generada:

```
CREATE TABLE foo (a TINYINT NOT NULL) SELECT b+1 AS a FROM bar;
```

En MySQL 5.0, use LIKE para crear una tabla vacía basada en la definición de otra tabla, incluyendo cualquier atributo de columna e índice definido en la tabla original:

```
CREATE TABLE new_tbl LIKE ori_tbl;
```

CREATE TABLE ...LIKE no copia ninguna opción de tabla DATA DIRECTORY o INDEX DIRECTORY especificadas en la tabla original, ni ninguna definición de clave foránea.

Puede preceder SELECT con IGNORE o REPLACE para indicar cómo tratar registros que dupliquen claves únicas. Con IGNORE, los nuevos registros que duplican un registro único existente se descartan. Con REPLACE, los nuevos registros reemplazan a los antiguos con el mismo valor. Si ni IGNORE ni REPLACE se indican, los valores únicos duplicados dan un error.

Para asegurar que el log update o binario pueda usarse para crear tablas originales, MySQL no permite inserciones concurrentes durante CREATE TABLE...SELECT.



#### Sintaxis de DROP DATABASE

```
DROP {DATABASE | SCHEMA} [IF EXISTS] db_name
```

DROP DATABASE borra todas las tablas en la base de datos y borra la base de datos. Sea muy cuidadoso con este comando. Para usar DROP DATABSE, necesita el permiso DROP en la base de datos.

IF EXIST se usa para evitar un error si la base de datos no existe.

DROP SCHEMA puede usarse desde MySQL 5.0.2

Si usa DROP DATABASE en una base de datos enlazada simbólicamente, tanto el enlace como la base de datos se borran.

DROP DATABASE retorna el número de tablas que se eliminan. Se corresponde con el número de ficheros .frm borrados.

El comando DROP DATABASE borra del directorio de base de datos los ficheros y directorios que MySQL puede crear durante operaciones normales:

| .BAK | .DAT | .HSH |
| ---- | ---- | ---- |
| .MRG | .MYD | .ISD |
| .MYI | .db  | .frm |

Todos los subdirectorios con nombres que tienen dos dígitos hexadecimales 00-ff. Son subdirectorios usadas por tablas RAID. (Estos directorios no se borran desde MySQL 5.0, cuando se eliminó el soporte para tablas RAID). Debe convertir las tablas RAID y eliminar estos directorios manualmente antes de actualizar a MySQL 5.0)

El dichero db.opt, si existe.

Si permanecen otros ficheros o directorios en el directorio de la base de datos que MySQL borre los ficheros listados, el directorio de base de datos no puede borrarse. En este caso, debe borrar cualquier fichero restante manualmente y realizar el comando DROP DATABASE de nuevo.

Puede borrar bases de datos con mysqladmin.



#### Sintaxis de drop index

```
DROP INDEX index_name ON tbl_name
```

DROP INDEX borra el índice llamado index_name de la tabla tbl_name. En MySQL 5.0, DROP INDEX se mapea a comando ALTER TABLE para borrar el índice.



#### Sintaxis de DROP TABLE

```mysql
DROP [TEMPORARY] TABLE [IF EXISTS]
    tbl_name [, tbl_name] ...
    [RESTRICT | CASCADE]
```

DROP TABLE borra una o más tablas. Debe tener el permiso DROP para cada tabla. Todos los datos de la definición de tabla son borrados, así que tenga cuidado con este comando.

Use IF EXISTS para evitar un error para tablas que no existan. Un NOTE se genera para cada tabla no existente cuando se usa IF EXISTS.

RESTRICT y CASCADE se permiten para hacer la portabilidad más fácil. De momento, no hacen nada.

Nota: DROP TABLE hace un commit automáticamente con la transacción activa, a no ser que use la palabra TEMPORARY.

La palabra TEMPORARY tiene el siguiente efecto:

- El comando solo borra las tablas TEMPORARY.
- El comando no acaba una transacción en marcha.
- No se chequean derechos de acceso. (Una tabla TEMPORARY es visible solo para el cliente que la ha creado, así que no es necesario).

Usar TEMPORARY es una buena forma de asegurar que no borra accidentalmente una tabla no TEMPORARY.



#### Sintaxis de RENAME TABLE

```
RENAME TABLE
    tbl_name TO new_tbl_name
    [, tbl_name2 TO new_tbl_name2] ...
```

Este comando renombra una o más tablas.

La operación de renombrar se hace automáticamente, lo que significa que ningún otro flujo puede acceder a ninguna de las tablas mientras se ejecuta el renombrado. Por ejemplo, si tiene una tabla existente old_table, puede crear otra tabla new_table con la misma estructura pero vacía, y luego reemplazar la tabla existente con la vacía como sigue:

```
CREATE TABLE new_table(...);

RENAME TABLE old_table TO backup_table, new table TO old_table;
```

Si el comando renombra más de una tabla, las operaciones de renombrado se realizan de izquierda a derecha. Si quiere intercambiar dos nombres de tablas, puede hacerlo así (asumiendo que no existe ninguna tabla llamada tmp_table):

```
RENAME TABLE old_table TO tmp_table,
new_table TO old_table,
tmp_table TO new_table;
```

Mientras haya dos bases de datos en el mismo sistema de ficheros puede renombrar una tabla para moverla de una base de datos a otra:

```mysql
RENAME TABLE current_db.tbl_name TO other_db.tbl_name;
```

Cuando ejecuta RENAME, no puede tener ninguna tabla bloqueada o transacciones activas. Debe tener los permisos ALTER y DROP en la tabla original, y los permisos CREATE y INSERT en la nueva tabla.

Si MySQL encuentra cualquier error en un renombrado múltiple, hace un renombrado inverso para todas las tablas renombradas para devolver todo a su estado original.



#### Sentencias de datos: Select, Insert, Delete, Update

#### Sintaxis de DELETE

Sintaxis para una tabla:

```Mysql
DELETE [LOW_PRIORITY] [QUICK] [IGNORE] FROM tbl_name
    [WHERE where_condition]
    [ORDER BY ...]
    [LIMIT row_count]
```

Sintaxis para múltiples tablas:

```mysql
DELETE [LOW_PRIORITY] [QUICK] [IGNORE]
    tbl_name[.*] [, tbl_name[.*]] ...
    FROM table_references
    [WHERE where_condition]

DELETE [LOW_PRIORITY] [QUICK] [IGNORE]
    FROM tbl_name[.*] [, tbl_name[.*]] ...
    USING table_references
    [WHERE where_condition]
```

 DELETE borra los registros de tbl_name que satisfacen la condicion dada por where_definition, y retorna el número de registros borrados.

Si realiza un comando DELETE sin cláusula WHERE se borran todos los registros. Una forma más rápida de hacerlo, cuando no quiere saber el número de registros borrados, sea TRUNCATE TABLE.

Si borra el registro conteniendo el máximo valor para una columna AUTO_INCREMENT, el valor se reusa para una tabla BDB, pero no para tablas MyISAM o InnoDB. Si borra todos los registros en la tabla con DELETE FROM tbl_name (sin cláusula WHERE) en modo AUTOCOMMIT, la secuencia comienza para todos los tipos de tabla excepto para InnoDB y MyISAM. Hay algunas excepciones para este comportamiento para tablas InnoDB.

Para tablas MyISAM y BDB, puede especificar una columna AUTO_INCREMENT secundaria en una clave de múltiples columnas. En este caso, el reuso de valores borrados del inicio de la secuencia se realiza incluso para tablas MyISAM.

El comando DELETE soporta los siguientes modificadores:

- Si especifica LOW_PRIORITY, la ejecución de DELETE se retarda hasta que no hay más clientes leyendo de la tabla.
- Para tablas MyISAM, si usa la palabra QUICK, el motor de almacenamiento no mezcla las hojas del índice durante el borrado, que puede acelerar algunos tipos de operaciones de borrado.
- En MySQL 5.0, la palabra clave IGNORE hace que MySQL ignore todos los errores durante el proceso de borrar registros. (Los errores encontrados durante la etapa de parseo se procesan de la forma habitual.)  Los errores que se ignoran debido al uso de esta opción se retornan como advertencias.

La velocidad de las operaciones de borrado pueden verse afectadas por factores.

En tablas MyISAM, los registros borrados se mantienen en una lista enlazada y las operaciones INSERT siguientes reúsan antiguas posiciones de registro. Para reclamar espacio no usado y reducir tamaño de fichero, use el comando OPTIMIZE TABLE o la utilidad myisamchk para reorganizar las tablas. OPTIMIZE TABLE es más sencillo, pero myisamchk es más rápido.

El modificador QUICK afecta si las hojas del índice se mezclan en operaciones de borrado. DELETE QUICK es más útil para aplicaciones en que los valores del índice para registros borrados se remplazan con valores similares de registros insertados posteriormente. En este caso, los agujeros dejados por los valores borrados se reúsan.

DELETE QUICK no es útil cuando los valores borrados conducen a bloques de índices no rellenos con un rango de valores índice para el que vuelven a ocurrir nuevas inserciones. En este caso, el uso de QUICK puede conducir a un gasto de espacio que queda sin reclamar. Aquí hay un ejemplo de este escenario:

1. Cree una tabla que contenga una columna AUTO_INCREMENT indexada.
2. Inserta varios registros en la tabla. Cada inserción resulta en un valor indexado que se añade al final del índice.
3. Borra un bloque de registros al final del rango de la columna usando DELETE QUICK.

En este escenario, los bloques de índice asociados con los valores de índice borrado quedan sin rellenar pero no se mezclan con otros bloques de índice debido al uso de QUICK. Quedan sin rellenar cuando hay nuevas inserciones, ya que los nuevos registros no tienen valores índice en el rango borrado. Además, quedan sin rellenar incluso si luego usa DELETE sin QUICK, a no ser que algunos de los valores de índice borrados estén en los bloques de índice dentro o adyacentes a los bloques no rellenos. Para reclamar el espacio de índice sin usar bajo estas circunstancias use OPTIMIZE TABLE.

Si va a borrar varios registros de una tabla, puede ser más sencillo usar DELETE QUICK seguido por OPTIMIZE TABLE. Esto reconstruye el índice en lugar de realizar varias operaciones de mezcla de bloques de índice.

La opción de MySQL LIMIT row_count para DELETE le dice al servidor el máximo número de registros a borrar antes de retornar el control al cliente. Esto puede usarse para asegurar que un comando DELETE específico no tardará demasiado tiempo. Puede simplemente repetir el comando DELETE hasta que el número de registros afectados sea menor que el valor LIMIT.

Si el comando DELETE incluye una cláusula ORDER BY, los registros se borrarán en el orden especificado por la cláusula. Esto es muy útil solo en conjunción con LIMIT. Por ejemplo, el siguiente ejemplo encuentra registros coincidentes con la cláusula WHERE ordenados por timestamp_column y borra el primero (el más viejo).

```
DELETE FROM somelong
WHERE user = 'jcole'
ORDER BY timestamp_column
LIMIT 1;
```

Puede especificar múltiples tablas en un comando DELETE para borrar registros de una o más tablas dependiendo de una condición particular en múltiples tablas. Sin embargo, no puede usar ORDER BY o LIMIT en un DELETE de múltiples tablas.

La parte table_references lista las tablas involucradas en el join.

Para la primera sintaxis, solo los registros coincidentes de las tablas listadas antes de la cláusula FROM se borran. Para la segunda sintaxis, solo los registros coincidentes de las tablas listadas en la cláusula FROM (antes de la cláusula USING) se borran. El efecto es que puede borrar registros para varias tablas al mismo tiempo y tienen tablas adicionales que se usan para buscar:

```
DELETE t1, t2 FROM t1,t2,t3 WHERE t1.id=t2.id AND t2.id=t3.id;
o:
DELETE FROM t1,t2 USING t1,t2,t3 WHERE t1.id=t2.id AND t2.id=t3.id;
```

Estos comandos usan las tres tablas al buscar registros a borrar, pero borrar los registros coincidentes solo para las tablas t1 y t2.

Los ejemplos anteriores muestran inner joins usando el operador coma, pero comandos DELETE de varias tablas pueden usar cualquier tipo de join permitido por comandos SELECT tales como LEFT JOIN.

La sintaxis permite .* tras los nombres de tabla para compatibilidad con Access.

Si usa un comando DELETE de varias tablas incluyendo tablas InnoDB para las que hay restricciones de clave foránea, el optimizador MySQL puede procesar tablas en un orden distinto del de su relación padre/hijo. En este caso, el comando falla y se deshace. En su lugar, debe borrar de una tabla única y confiar en la capacidad ON DELETE que proporciona InnoDB para hacer que las otras tablas se modifiquen correctamente.

Nota: En MySQL 5.0, debe usar el alias (si les dio) al referirse a un nombre de tabla:

En MySQL 4.1: 

```mysql
DELETE t1 FROM test AS t1, test2 WHERE ...
```

Borrado cruzados entre bases de datos se soportan para borrados de varias tablas, pero en este caso, debe referirse a las tablas sin usar alias. Por ejemplo: 

```mysql
DELETE test1.tmp1, test2.tmp2 FROM test1.tmp1, test2.tmp2 WHERE ...
```

Actualmente, no puede borrar desde una tabla y seleccionar de la misma tabla en una subconsultas.



#### Sintaxis de DO expr [,expr]...

DO ejecuta la expresión pero no retorna ningún resultado. Esto es una abreviación de SELECT expr, ..., pero tiene la ventaja que es más rápido cuando no le importa el resultado.

DO es útil principalmente con funciones que tienen efectos colaterales, tales como RELEASE_LOCK().



#### Sintaxis de HANDLER

```mysql
HANDLER tbl_name OPEN [ [AS] alias]

HANDLER tbl_name READ index_name { = | <= | >= | < | > } (value1,value2,...)
    [ WHERE where_condition ] [LIMIT ... ]
HANDLER tbl_name READ index_name { FIRST | NEXT | PREV | LAST }
    [ WHERE where_condition ] [LIMIT ... ]
HANDLER tbl_name READ { FIRST | NEXT }
    [ WHERE where_condition ] [LIMIT ... ]

HANDLER tbl_name CLOSE
```

El comando HANDLER proporciona acceso directo a las interfaces del motor de la tabla. En MySQL 5.0, esta disponible para tablas MyISAM y InnoDB.

El comando HANDLER ... OPEN abre una tabla, haciéndola accesible mediante posteriores comandos HANDLER ... READ.

Este objeto de tabla no se comparte con otros flujos y no se cierra hasta que el flujo llama HANDLER ... CLOSE o el flujo termina. Si abre la tabla usando un alias, referencias posteriores a la tabla con otros comandos HANDLER deben usar el alias en lugar del nombre de la tabla.

La primera sintaxis HANDLER ... READ recibe un registro donde el índice especificado satisface los valores dados y la condición WHERE se cumple. Si tiene un índice de múltiples columnas, especifique los valores de la columna índice como una lista separada por comas. Los valores especificados para todas las columnas en el índice, o los valores específicos para un prefijo a la izquierda de las columnas índice. Suponga que un índice incluye tres columnas llamadas col_a, col_b y col_c, en ese orden. El comando HANDLER puede especificar valores para las tres columnas en el índice, o para las columnas en el prefijo a la izquierda. Por ejemplo: 

```mysql
HANDLER ... index_name = (col_a_val, col_b_val, col_c_val) ...
HANDLER ... index_name = (col_a_val, col_b_val) ...
HANDLER ... index_name = (col_a_val) ...
```

La segunda sintaxis HANDLER ... READ recibe un registro de la tabla en orden de registro natural que cumple la condición WHERE.

La tercera sintaxis HANDLER ... READ recibe un registro de la tabla en orden de registro natural que cumple la condición WHERE. Es más rápido que HANDLER tbl_name READ index_name cuando se desea un escaneo completo de tabla. El orden de registro natural es el orden en que se almacenan los registros en un fichero de datos de una tabla MyISAM. Este comando funciona para tablas InnoDB también, pero no hay tal concepto porque no hay un fichero de datos separado.

Sin una cláusula LIMIT, todas las formas de HANDLER ... READ reciben un único registros si una está disponible. Para retornar un número específico de registros, incluya una cláusula LIMIT. Tiene la misma sintaxis que para el comando SELECT.

HANDLER ... CLOSE cierra una tabla que se abrió con HANDLER ... OPEN.

Nota: Para emplear la interfaz HANDLER para referirse a una tabla PRIMARY KEY, use el identitifcador 'PRIMARY' entrecomillado:

```
HANDLER tbl_name READ 'PRIMARY' > (...);
```

HANDLER es un comando de bajo nivel. Por ejemplo, no proporciona consistencia. Esto es, HANDLER ... OPEN no toma una muestra de la tabla, y no bloquea la tabla. Esto significa que tras un comando HANDLER ... OPEN realizado, los datos de la tabla pueden ser modificados (por este o por otro flujo) y estas modificaciones pueden aparecer solo parcialmente en escaneos HANDLER ... NEXT o HANDLER ... PREV.

Hay varias razones para usar la interfaz HANDLER en lugar de comandos SELECT normales:  

HANDLER es más rápido que SELECT:

Un objeto de tratamiento de motor de almacenamiento designado se reserva para HANDLER ... OPEN. El objeto se reusa para posteriores comandos HANDLER para esa tabla; no necesita reinicializarse para cada una.

Hay menos parseo.

No hay sobrecarga del chequeo de consultas ni optimizador.

La tabla no tiene que estar bloqueada entre peticiones.

La interfaz del handler no tiene que proporcionar una vista de los datos consistente (por ejemplo, se permiten dirty reads), así que el motor puede usar optimización que SELECT no permite.

HANDLER hace mucho más fácil portar aplicaciones que usen una interfaz tipo ISAM a MySQL.

HANDLER le permite consultar una base de datos de forma difícil o imposible de realizar con SELECT. La interfaz de HANDLER es una forma más natural de consultar los datos cuando se trabaja con aplicaciones que proporcionan una interfaz de usuario interactiva a la base de datos.



#### Sintaxis de INSERT

```
INSERT [LOW_PRIORITY | DELAYED | HIGH_PRIORITY] [IGNORE]
    [INTO] tbl_name  [(col_name [, col_name] ...)]
    VALUES ({expr | DEFAULT},...),(...),...
    [ON DUPLICATE KEY UPDATE col_name=expr,...]

O:

INSERT [LOW_PRIORITY | DELAYED | HIGH_PRIORITY] [IGNORE]
    [INTO] tbl_name
    SET col_name={expr | DEFAULT },...
    [ON DUPLICATE KEY UPDATE assignment_list]

O:

INSERT [LOW_PRIORITY | HIGH_PRIORITY] [IGNORE]
    [INTO] tbl_name [(col_name [, col_name] ...)]
     SELECT ... 
     [ON DUPLICATE KEY UPDATE col_name=expr,...]
```

INSERT inserta nuevos registros en una tabla existente. Las formas INSERT ... VALUES y INSERT ... SET del comando insertan registros basados en valores explícitamente especificados. La forma INSERT ...SELECT inserta registros seleccionados de otra tabla o tablas. INSERT ... 

tbl_name es la tabla en que los registros deben insertarse. Las columnas para las que el comando proporciona valores pueden especificarse como sigue:

La lista de nombres de columnas o la cláusula SET indican las columnas explícitamente.

Si no especifica la lista de columnas para INSERT ... VALUES o INSERT ... SELECT,  los valores para cada columna en la tabla deben proporcionarse en la lista VALUES o por el SELECT. Si no sabe el orden de las columnas en la tabla, use DESCRIBE tbl_name para encontrarlo. 

Los valores de columna pueden darse de distintos modos:

Si no está ejecutando el modo estricto, cualquier columna que no tenga un valor asignado explícitamente recibe su valor por defecto (explícito o implícito). Por ejemplo, si especifica una lista de columnas que no nombra todas las columnas en la tabla, las no nombradas reciben sus valores por defecto.

Si quiere que un comando INSERT genere un error a no ser que especifique explícitamente valores para todas las columnas que no tienen un valor por defecto, debe usar modo STRICT.

Use DEFAULT para asignar a una columna explícitamente su valor por defecto. Esto hace más fácil escribir comandos INSERT que asignan valores a todas las columnas excepto unas pocas, ya que le permite evitar la escritura de una lista de valores VALUES incompleta. De otro modo, tendría que escribir la lista de los nombres de columna correspondientes a cada valor en la lista VALUES.

En MySQL 5.0, puede usar DEFAULT (col_name) como forma más general que puede usarse en expresiones para producir un valor por defecto de una columna.

Si la lista de columnas y la lista VALUES están vacías, INSERT crea un registro con cada conjunto de columnas con sus valores por defecto:

```mysql
INSERT INTO tbl_name () VALUES ();
```

En modo STRICT obtendrá un error si una columna no tiene un valor por defecto. De otro modo, MySQL usará el valor implícito para cualquier columna sin un valor explícito por defecto definido.

Puede especificar una expresión expr para proporcionar un valor de columna. Esto puede involucrar conversión de tipos si el tipo de la expresión no coincide con el tipo de la columna, y la conversión de un valor dado puede resultar en distintos valores insertados dependiendo del tipo de columna. Por ejemplo, insertar la cadena '1999.0e-2' en una columna INT, FLOAT, DECIMAL(10,6), o YEAR resulta entre los valores 1999, 19.9921, 19.992100, y 1999 insertados, respectivamente. La razón de que el valor almacenado en las columnas INT y YEAR sea 1999 es que la conversión cadena a entero consulta solo el trozo de la parte inicial de la cadena que se puede considerar como un entero válido o año. Para las columnas de coma flotante o punto fijo, la conversión cadena a coma flotante considera la cadena entera un valor válido.

Una expresión expr puede referirse a cualquier columna que se haya asignado antes en una lista de valores. Por ejemplo, puede hacer esto porque el valor para col2 se refiere a col1, que se ha asignado previamente:

```mysql
INSERT INTO tbl_name (col1, col2) VALUES (15,col1*2);
```

Pero lo siguiente no es legal, ya que el valor para col1 se refiere a col2, que se asigna tras col1:

```mysql
INSERT INTO tbl_name (col1,col2) VALUES (col2*2,15);
```

Una excepción involucra a columnas que contienen valores AUTO_INCREMENT. Como el valor AUTO_INCREMENT se genera tras otras asignaciones de valores , cualquier referencia a una columna AUTO_INCREMENT en la asignación retorna un 0.

El comando INSERT soporta los siguientes modificadores:

Si usa la palabra DELAYED, el servidor pone el registro o registros a ser insertados en un buffer, y el cliente realizando el comando INSERT DELAYED puede continuar. Si la tabla está en uso, el servidor trata los registros. Cuando la tabla se libera, el servidor comienza a insertar registros, chequeando periódicamente para ver si hay alguna petición de lectura para la tabla. Si la hay, la cola de registros retardados se suspende hasta que la tabla se libera de nuevo.

 Si usa la palabra LOW_PRIORITY, la ejecución de INSERT se retrasa hasta que no hay otros clientes leyendo de la tabla. Esto incluye a otros clientes que comiencen a leer mientras que los clientes existentes están leyendo, y mientras el comando INSERT LOW_PRIORITY está en espera. Es posible, por lo tanto, para un cliente que realice un comando INSERT LOW_PRIORITY esperar durante mucho tiempo (o incluso para siempre) en un entorno de muchas lecturas. (Esto es un contraste de INSERT DELAYED, que deja al cliente continuar). Tenga en cuenta que LOW_PRIORITY no debe usarse normalmente con tablas MyISAM y que hacerlo deshabilita insercciones concurrentes.

Si especifica HIGH_PRIORITY, deshabilita el efecto de la opción -low-priority-updates si el servidor se arrancó con esa opción. Hace que las inserciones concurrentes no se usen.

Los valores afectados por un INSERT pueden usarse la función mysql_affected_rows() de la API de C.

Si usa la palabra IGNORE en un comando INSERT, los errores que ocurren mientras se ejecuta el comando se tratan como advertencias. Por ejemplo, sin IGNORE, un registro que duplique un índice UNIQUE existente o valor PRIMARY KEY en la tabla hace que un error de clave duplicada en el comando se aborte. Con IGNORE, el registro todavía no se inserta, pero no se muestra el error. Las conversiones de datos dispararían errores y abortarían el comando si no se especifica IGNORE. Con IGNORE, los valores invalidados se ajustan al valor más cercano y se insertan; las advertencias se producen pero el comando no se aborta. Puede determinar con la función mysql_info() de la API de C cuántos registros se insertan realmente en la tabla.

Si especifica ON DUPLICATE KEY UPDATE, y se inserta un registro que duplicaría un valor en un índice UNIQUE o PRIMARY KEY, se realiza un UPDATE del antiguo registro. Por ejemplo, si la columna a se declara como UNIQUE y contiene el valor 1, los siguientes dos comandos tienen efectos idénticos:

```mysql
INSERT INTO table (a,b,c) VALUES (1,2,3) ON DUPLICATE KEY UPDATE c=c+1;
UPDATE table SET c=c+1 WHERE a=1;
```

 El valor de registros afectados es 1 si el registro se inserta como un nuevo registro y 2 si un valor existente se actualiza.

Nota: Si la columna b es única, el INSERT sería equivalente a este comando UPDATE:

```mysql
UPDATE table SET c=c+1 WHERE a=1 OR b=2 LIMIT 1;
```

Si a=1 OR b=2 se cumple para varios registros, solo un registro se actualiza. En general debería intentar evitar usar una cláusula ON DUPLICATE KEY en tablas con claves únicas múltiples.

MySQL 5.0 permite el uso de la función VALUES(col_name) en la cláusula UPDATE que se refiere a los valores de columna de la porción INSERT ... UPDATE. En otras palabras, VALUES(col_name) en la cláusula UPDATE se refiere al valor de col_name que se insertarían, no ocurre conflicto de clave duplicada. Esta función es especialmente útil en inserciones de múltiples registros. La función VALUES() tiene sentido solo en comandos INSERT ... UPDATE y retorna NULL de otro modo.

Ejemplo:

```
INSERT INTO table(a,b,c) VALUES (1,2,3),(4,5,6) ON DUPLICATE KEY UPDATE c=VALUES(a)+VALUES(b);
```

Este comando es idéntico a los siguientes dos comandos:

```
INSERT INTO table(a,b,c) VALUES (1,2,3) ON DUPLICATE KEY UPDATE c=3;
INSERT INTO table(a,b,c) VALUES (4,5,6) ON DUPLICATE KEY UPDATE c=9;
```

Cuando usa ON DUPLICATE KEY UPDATE, la opción DELAYED se ignora.

Puede encontrar el valor usado para una columna AUTO_INCREMENT usando la función SQL LAST_INSERT_ID(). Desde la API C, use la función mysql_insert_id(). Sin embargo, debe tener en cuenta que las dos funciones no siempre se comportan idénticamente.

Si usa un comando INSERT ... VALUES con listas de múltiples valores o INSERT...SELECT, el comando retorna una cadena de información en este formato:

```
Records: 100 Duplicates:0 Warnings:0
```

Records indica el número de registros procesados por el comando. (Este no es necesariamente el número de registros realmente insertados, ya que Duplicates puede ser distinto a cero). 

Duplicates indica el número de registros que no pueden insertarse ya que duplicarían algunos valores de índice únicos existentes.

Warnings indicaba el número de intentos para insertar valores de columna que fueron problemáticos por algo.

 Las advertencias pueden ocurrir bajo cualquiera de las siguientes condiciones:

Insertar NULL en una columna que se ha declarado NOT NULL. Para comandos INSERT de múltiples columnas o comandos INSERT INTO ... SELECT, la columna se asigna con el valor por defecto para el tipo de datos de la columna. Este es 0 para tipos numéricos, la cadena vacía ('') para tipos de cadenas, y el valor "cero" para tipos de fecha y hora. Los comandos INSERT INTO ... SELECT se tratan del mismo modo que inserciones de múltiples registros porque el servidor no examina el resultado del SELECT para ver si retorna o no un único registro. (para un único registro INSERT, no hay ninguna advertencia cuando NULL se inserta en una columna NOT NULL. En lugar de eso, el comando falla con un error). 

Poner en una columna numérica un valor fuera del rango de la columna. El valor se redondea al punto final del rango más cercano.

Asigne un valor tal como '10.34' a una columna numérica. El texto final se elimina y la parte numérica se inserta. Si el valor de cadena no tiene parte inicial numérica, la columna se pone a 0.

Insertar una cadena en una columna de cadena (CHAR, VARCHAR, TEXT, o BLOB ) que excede la máxima longitud de columna. El valor se trunca a la máxima longitud de la columna.

Insertar un valor en una columna de fecha u hora que es ilegal para el tipo de la columna. La columna se asigna con el valor cero apropiado para el tipo.

Si usa la APi de C, la cadena de información puede obtenerse invocando la función mysql_info()



#### Sintaxis de INSERT ... SELECT

```mysql
INSERT [LOW_PRIORITY | HIGH_PRIORITY] [IGNORE]
    [INTO] tbl_name [(col_name [, col_name] ...)]
     SELECT ... 
     [ON DUPLICATE KEY UPDATE col_name=expr,...]
```

Con INSERT ...SELECT, puede insertar rápidamente varios registros en una tabla desde una o varias tablas.

Por ejemplo:

```
INSERT INTO tbl_temp2(fld_id) 
SELECT tbl_temp1.fld_order_id
FROM tbl_temp1 WHERE tbl_temp1.fld_order_id > 100;
```

La siguiente condición sirve para un comando INSERT ... SELECT:

En MySQL 5.0, especifique IGNORE explícitamente para ignorar registros que causarían violaciones de clave duplicada.

No use DELAYED con INSERT ... SELECT

En MySQL 5.0, la tabla objetivo del comando INSERT puede aparecer en la cláusula FROM de la parte SELECT de la consulta. (Esto no era posible en algunas versiones antiguas de MySQL).

Las columnas AUTO_INCREMENT funcionan normalmente.

Para asegurar que el log binario puede usarse para recrear las tablas originales, MySQL no permite inserciones concurrentes durante INSERT ... SELECT.

Actualmente, no puede insertar en una tabla y seleccionar de la misma tabla en una subconsulta.

En las partes de valores de ON DUPLICATE KEY UPDATE puede referirse a una columna en otras tablas, mientras no use GROUP BY en las parte SELECT. Un efecto lateral es que debe calificar los nombres de columna no únicos en la parte de valores.

Puede usar REPLACE en lugar de INSERT para sobrescribir registros antiguos REPLACE es la contraparte de INSERT IGNORE en el tratamiento de nuevos registros que contienen valores de clave única que duplican registros antiguos: Los nuevos registros se usan para reemplazar los antiguos registros en lugar de descartarlos.



#### Sintaxis de LOAD DATA INFILE

```
LOAD DATA [LOW_PRIORITY | CONCURRENT] [LOCAL] INFILE 'file_name.txt'
    [REPLACE | IGNORE]
    INTO TABLE tbl_name
    [{FIELDS | COLUMNS}
        [TERMINATED BY 'string']
        [[OPTIONALLY] ENCLOSED BY 'char']
        [ESCAPED BY 'char']
    ]
    [LINES
        [STARTING BY 'string']
        [TERMINATED BY 'string']
    ]
    [IGNORE number {LINES | ROWS}]
    [(col_name_or_user_var[, col_name_or_user_var] ...)]
    [SET col_name=expr,...]
```

El comando LOAD DATA INFILE lee registros desde un fichero de texto a una tabla a muy alta velocidad. El nombre de fichero debe darse como una cadena literal.

Para más información acerca de la eficiencia de INSERT contra LOAD DATA INFILE y acelerar LOAD DATA INFILE.

En MySQL 5.0, el conjunto de caracteres indicado por la variable de sistema character_set_database se usa para interpretar la información en el fichero. SET NAMES y el valor de character_set_client no afecta a la interpretación de la entrada.

Puede cargar ficheros de datos usando la utilizad mysqlimport; opera enviando un comando LOAD DATA INFILE al servidor. La opción -local hace que mysqlimport lea ficheros de datos desde el equipo cliente. Puede especificar la opción -compress para obtener un mejor rendimiento en redes lentas si el cliente y el servidor soportan el protocolo comprimido.

Si usa LOW_PRIORITY, la ejecución del comando LOAD DATE se retarda hasta que no haya más clientes leyendo de la tabla.

Si especifica CONCURRENT con una tabla MyISAM que satisfaga la condición para inserciones concurrentes (esto es, no contiene bloques libres en medio), entonces otros flujos pueden recibir datos desde la tabla mientras se ejecuta LOAD DATA. Usar esta opción afecta al rendimiento de LOAD DATA ligeramente, incluso si no hay otro flujo usando la tabla al mismo tiempo.

Si se especifica LOCAL, se interpreta respecto al cliente final de la conexión:

Si especificamos LOCAL, el programa cliente lee el fichero en el equipo cliente y lo envía al servidor. Podemos indicar la ruta completa del fichero para especificar su localización exacta. Si indicamos la ruta relativa, el fichero se interpreta relativo al directorio en el que el cliente se inició.

Si no se especifica LOCAL, el fichero tiene que estar en el equipo servidor y el servidor lo lee directamente.

Al localizar ficheros en el equipo servidor, el servidor usa las siguientes reglas:

Si se da una ruta absoluta, el servidor usa la ruta como tal.

Si se da una ruta relativa con uno o más componentes, el servidor busca este fichero relativo al directorio de datos del servidor.

Si se da un nombre de fichero sin ninguna ruta, el servidor busca el fichero en el directorio de base de datos de la base de datos por defecto.

Tenga en cuenta que estas reglas significan que un fichero llamado ./myfile.txt se lee del directorio de datos del servidor, mientras que el mismo fichero llamado como myfile.txt se lee desde el directorio de base de datos por defecto. Por ejemplo el siguiente comando LOAD DATA lee el fichero actual, incluso si el comando carga explícitamente el fichero en una tabla en la base de datos db2:

```
USE db1;
LOAD DATE INFILE 'data.txt' INTO TABLE db2.my_table;
```

Tenga en cuenta que las rutas de windows se especifican usando barras en lugar de antibarras. Si usa barras, debe doblarlas.

Por razones de seguridad, al leer ficheros de texto localizados en el servidor, los ficheros deben residir en el directorio de la base de datos o ser leíbles por todo el mundo. Además, para usar LOAD DATA INFILE en ficheros del servidor, debe tener el permiso FILE.

Usar LOCAL es un poco más lento que dejar al servidor acceder al fichero directamente, por que el contenido del fichero debe enviarse por la conexión desde el cliente al servidor. Por otra parte, no necesita el permiso FILE para cargar ficheros locales.

En MySQL 5.0 LOCAL funciona solo si su servidor y su cliente lo tienen activado. Por ejemplo, si mysqld se arranca con --local-infile=0, entonces LOCAL no funciona.

Si necesita LOAD DATA para leer desde un pipe, puede usar la siguiente técnica (aquí cargamos el listado del directorio / en una tabla):

 

```
mkfifo /mysql/db/x/x
chmod 666 /mysql/db/x/x
find / -ls > /mysql/db/x/x
mysql -e "LOAD DATA INFILE 'x' INTO TABLE x"x
```

Las palabras REPLACE y IGNORE controlan el tratamiento de registros de entrada que duplican registros existentes en claves únicas.

Si especifica REPLACE, los registros de entrada reemplazan registros existentes (en otras palabras, los registros que tienen el mismo valor para una clave primaria o única que un registro existente).

Si especifica IGNORE, los registros de entrada que dupliquen un registro existente en una clave única se ignoran. Si no especifica ninguna opción, el comportamiento depende se si la palabra LOCAL se ha especificado o no. Sin LOCAL, ocurre un error cuando se encuentra un valor de clave duplicado, y el resto del fichero se ignora. Con LOCAL, el comportamiento por defecto es el mismo que si se especifica IGNORE, esto es porque el servidor no tiene forma de parar la transmisión del fichero en medio de la operación.

Si quiere ignorar restricciones de clave foránea durante la operación de carga, puede realizar un comando SET FOREIGN_KEY_CHECKS = 0 antes de ejecutar LOAD DATA.

Si usa LOAD DATA INFILE en una tabla vacía MyISAM, todos los índices no únicos se crean en batch separados (como para REPAIR TABLE). Esto hace LOAD DATA INFILE mucho más rápido cuando tiene varios índices. Normalmente esto es muy rápido, pero en algunos casos extremos, puede crear los índices incluso más rápido desactivándolos con ALTER TABLE ... DISABLE KEYS antes de cargar el fichero en la tabla y usar ALTER TABLE ... ENABLE KEYS para recrear los índices tras cargar el fichero.

LOAD DATA INFILE es el complemento de SELECT ... INTO OUTFILE. Para escribir datos de una tabla en un fichero use SELECT ... INTO OUTFILE. Para leer el fichero de nuevo en una tabla, use LOAD DATE INFILE. La sintaxis de las cláusulas FIELDS y LINES es la misma para ambos. Ambas son opcionales, pero FIELDS debe preceder a LINES si se especifican ambas.

Si especifica una cláusula FIELDS, cada una de sus subcláusulas (TERMINATED BY, [OPTIONALLY] ENCLOSED BY y ESCAPED BY) también es opcional, excepto que debe especificar al menos una de ellas.

Si no especifica una cláusula FIELDS, por defecto es como si hubiera escrito esto:

```
FIELDS TERMINATED BY '\t' ENCLOSED BY ''ESCAPED BY \\'';
```

Si no especifica una cláusula LINES, por defecto es como si hubiera escrito esto:

```
LINES TERMINATED BY '\n' STARTING BY '';
```

En otras palabras, por defecto LOAD DATA INFILE actúa como sigue al leer la entrada:

- Busca delimitadores de línea como nuevas líneas.
- No ignora ningún prefijo de línea.
- Rompe las líneas en campos con los tabuladores.
- No espera campos entrecomillados dentro de ningún carácter delimitador.
- Interpreta las ocurrencias de tabuladores, nuevas líneas o '\' precedidas por '\' como caracteres literales que son parte de valores de campos.
- Por defecto SELECT ... INTO OUTFILE actúa como sigue al escribir la salida: 
- Escribe tabuladores entre campos.
- Usa '\' para escapar las instancias de tabuladores, nuevas líneas o '\' que ocurren entre valores de campos.
- Escribe nuevas líneas al final de las líneas.



Tenga en cuenta que para escribir FIELDS ESCAPED BY '\ \', debe escribir dos antibarras para que se interprete como una única antibarra.

Nota: Si ha generado el fichero de texto en un sistema Windows, puede tener que usar LINES TERMINATED BY '\r\n' para leer correctamente el fichero, ya que los programas de Windows típicamente usan dos caracteres como terminadores de línea. Algunos programas como WordPad, pueden usar \r como terminador de línea al escribir ficheros. Para leer tales ficheros, use LINES TERMINATED BY '\r'.

Si todas las líneas que quiere leer tienen un prefijo común que quiere ignorar, puede usar LINES STARTING BY 'prefix_string' para ignorar el prefijo (y cualquier cosa antes del mismo). Si una línea no incluye el prefijo, la línea entera se ignora. Nota prefix_string puede ocurrir en medio de una línea.

Ejemplo:

```mysql
LOAD DATA INFILE '/tmp/test.txt'
INTO TABLE test LINES STARTING BY "xxx";
```

Con esto puede leer en un fichero que contenga algo como:

```mysql
xxx "row",1 something xxx "row",2
```

Y obtener los datos ("row",1) y ("row",2).

La opción IGNORE number LINES puede usarse para ignorar líneas al inicio del fichero. Por ejemplo, puede usar IGNORE 1 LINES para ignorar una cabecera inicial que contenga los nombres de las columnas:

```
LOAD DATA INFILE '/tmp/test.txt' 
INTO TABLE test IGNORE 1 LINES;
```

Cuando usa SELECT ... INTO OUTFILE junto con LOAD DATA INFILE para escribir datos desde una base de datos en un fichero y luego lee datos del fichero de nuevo en la base de datos, las opciones de tratamiento de fichero y de línea para ambos comando deben coincidir. De otro modo, LOAD DATA INFILE no interpreta los contenidos del fichero correctamente. Suponga que usa SELECT ... INTO OUTFILE para escribir un fichero con campos delimitados por comas:

```
SELECT INTO OUTFILE 'data.txt' FIELDS TERMINATED BY FROM table2;
```

Para leer el fichero delimitado por comas, el comando correcto sería:

```
LOAD DATA INFILE 'data.txt' INTO TABLE table2
FIELDS TERMINATED BY ',';
```

Si en lugar de esto trata de leer en el fichero con el comando mostrado aquí, no funcionaría porque le dice a LOAD DATA INFILE que busque tabuladores entre campos:

```
LOAD DATA INFILE 'data.txt' INTO TABLE table2 FIELDS TERMINATED BY '\t';
```

El resultado esperado es que cada línea de entrada se interprete como un único campo.

LOAD DATA INFILE puede usarse para leer ficheros obtenidos de fuentes externas. Por ejemplo, un fichero en formato dBASE tiene campos separados por comas y entrecomillados por comillas dobles. Si las líneas en el fichero se terminan con nuevas líneas, el comando mostrado aquí ilustra las opciones de campo y línea que debería usar para cargar el fichero:

```mysql
LOAD DATA INFILE 'data.txt' INTO TABLE tbl_name
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\\n';
```

Cualquiera de las opciones de tratamiento de campo o línea pueden especificarse como una cadena vacía (''). Si no está vacía, los valores FIELDS [OPTIONALLY] ENCLOSED BY y FIELDS ESCAPED BY deben ser un único carácter. Los valores FIELDS TERMINATED BY, LINES STARTING BY, y LINES TERMINATED BY pueden tener más de un carácter. Por ejemplo, para escribir líneas terminadas por parejas de retorno de carro y nueva línea, o para leer un fichero conteniendo tales líneas, especifique una cláusula LINES TERMINATED BY '\r\n'.

Para leer un fichero que contenga bromas separadas por líneas consistentes de %%, pueden hacer lo siguiente

```mysql
CREATE TABLE jokes
(a INT NOT NULL AUTO INCREMENT PRIMARY KEY,
joke TEXT NOT NULL);
LOAD DATA INFILE '/tmp/jokes.txt' INTO TABLE jokes
FIELDS TERMINATED BY ''
LINES TERMINATED BY '\n%%\n' (joke);
```

FIELDS [OPTIONALLY] ENCLOSED BY controla el entrecomillado de los campos. Para la salida (SELECT ... INTO OUTFILE), si omite la palabra OPTIONALLY, todos los campos se delimitan por el carácter ENCLOSED BY. Un ejemplo de tal salida (usando coma como el delimitador de campo) se muestra aquí:

```
"1","a string","100.20"
"2","a string containing a, comma","102.20"
"3","a string containing a\ quote","102.20"
"4","a string containing a\,quote and comma","102.20"
```

Si especifica OPTIONALLY, el carácter ENCLOSED BY se usa solo para delimitar valores en columnas que tienen datos de cadenas (tales como CHAR, BINARY, TEXT, o ENUM);

```
1,"a string",100.20
2,"a string containing a, comma",102.20
3,"a string containing a\ quote",102.20
4,"a string containing a\,quote and comma",102.20
```

Tenga en cuenta que las ocurrencias del carácter ENCLOSED BY dentro de un campo se escapan mediante un prefijo del carácter ESCAPED BY. También tenga en cuenta que si especifica un valore ESCAPED BY vacío, es posible generar salida que no puede leerse correctamente con LOAD DATA INFILE. Por ejemplo, la salida precedente tendría la siguiente apariencia si el carácter de escape estuviera vacío. Observe que el segundo campo en la cuarta línea contiene una coma siguiendo la delimitación, que (erróneamente) parece que termine el campo:

```
1,"a string",100.20
2,"a string containing a, comma",102.20
3,"a string containing a" quote",102.20
4,"a string containing a",quote and comma",102.20
```

Para entrada, el carácter ENCLOSED BY, si está presente, se elimina del final de los valores de campos. (Esto es cierto se especifique OPTIONALLY o no; OPTIONALLY no tiene efecto en la interpretación de la entrada). Las ocurrencias del carácter ENCLOSED BY se interpretan como parte del campo actual.

Si el campo comienza con el carácter ENCLOSED BY, las instancias del mismo se reorganizan como terminadores del campo solo si van seguidas por el campo o la secuencia TERMINATED BY. Para evitar ambigüedad, las ocurrencias del carácter ENCLOSED BY dentro de un campo se pueden doblar y se interpretan como una única instancia del carácter. Por ejemplo, si se especifica ENCLOSED BY, la delimitación se trata como se muestra aquí:

```
"The ""BIG""boss"-> The "BIG"boss
The "BIG"boss-> The "BIG"boss
The ""BIG""boss-> The ""BIG"" boss
```

FIELDS ESCAPED BY controla cómo escribir o leer caracteres especiales. Si el carácter FIELDS ESCAPED BY no está vacío, se usa como prefijo para los siguientes caracteres de salida:

```
- El carácter FIELDS ESCAPED BY
- El carácter FIELDS[OPTIONALLY]ENCLOSED BY
- El primer carácter de los valores FIELDS TERMINATED BY y LINES TERMINATED BY
- ASCII 0 (lo que realmente se escribe a continuación del carácter de escape es '0' en ASCCI, no un byte con valor cero)
```

Si el carácter FIELDS ESCAPED BY está vacío, no se escapan caracteres y NULL se muestra como NULL, no \N. Probablemente no es una buena idea especificar un carácter de escape vacío, particularmente si los valores de campos en sus datos contienen cualquiera de los caracteres en la lista dada.

Para entrada, si el carácter FIELDS ESCAPED BY no está vacío, las ocurrencias del mismo se eliminan y el siguiente carácter se toma literalmente como parte del campo. Las excepciones son un '0' escapado o 'N' (por ejemplo, \0 o \N si el carácter de escape es '\'). Estas secuencias se interpretan como ASCII NULL (un byte con valor cero) y NULL. Las reglas para tratamiento de NULL se describen posteriormente.

En ciertos casos, las opciones de tratamiento de campos y línea interactúan:

- Si LINES TERMINATED BY es una cadena vacío y FIELDS TERMINATED BY no está vacío, las líneas se terminan con FIELDS TERMINATED BY.
- Si los valores FIELDS TERMINATED BY y FIELDS ENCLOSED BY están vacíos (''), se usa un formato fijo de registro (no delimitado). Con este formato, no se usan delimitadores entre campos (pero puede tener un terminados de línea). En su lugar, los valores de columna se escriben y leen usando los anchos de muestra de las columnas. Por ejemplo, si una columna se declara como INT(7), los valores para la columna se escriben usando campos de siete caracteres. En la entrada, los valores para la columna se obtienen leyendo siete caracteres.

LINES TERMINATED BY se usa para separar líneas. Si una línea no contiene todos los campos, el resto de columnas se asignan con sus valores por defecto. Si no tienen un terminador de línea, debe asignarlo a ''. En este caso, el fichero de texto debe contener todos los campos para cada registro.

El formato fijo de registro también afecta al tratamiento de valores NULL, como se describe posteriormente. Tenga en cuenta que el formato de tamaño fijo no funciona si está usando un conjunto de caracteres multi byte.

El tratamiento de valores NULL varia en función de las opciones FIELDS y LINES en uso:

- Para los valores FIELDS y LINES por defecto, NULL se escribe como \N para la salida, y \N para la entrada se lee como NULL (considerando que el carácter ESCAPED BY es '\').

- Si FIELDS ENCLOSED BY no está vacío, un campo que contenga el literal NULL como valor se lee como el valor NULL. Esto difiere de la palabra NULL delimitada por caracteres FIELDS ENCLOSED BY, que se lee como la cadena 'NULL'.

- Si FIELDS ESCAPED BY está vacío, NULL se escribe como la palabra NULL.

- Con formato fijo de registro (lo que ocurre cuando FIELDS TERMINED BY y FIELDS ENCLOSED BY están vacíos), NULL se escribe como una cadena vacía. Tenga en cuenta que esto hace que ambos valores NULL y cadenas vacías en la tabla sean indistinguibles cuando se escriben en el fichero ya que ambos se escriben como cadenas vacías. Si necesita distinguir entre ambos al leer del fichero, no debe usar el formato de registro fijo.

  

Algunos casos no son soportados por LOAD DATA INFILE:

- Registros de tamaño fijo (FIELDS TERMINATED BY y FIELDS ENCLOSED BY ambos vacíos).

- Si se especifica un separador que es igual o prefijo de otro, LOAD DATA INFILE no será capaz de interpretar la entrada correctamente. Por ejemplo, la siguiente cláusula FIELDS causaría problemas:

  ```
  FIELDS TERMINED BY '"' ENCLOSED BY '"'
  ```

Si FIELDS ESCAPED BY está vacío, un valor que contenga una ocurrencia de FIELDS ENCLOSED BY o LINES TERMINATED BY seguido por el valor FIELDS TERMINATED BY causa que LOAD DATA INFILE pare de leer un campo o línea demasiado rápido. Esto ocurre porque LOAD DATA INFILE no puede determinar apropiadamente dónde acaba el campo o línea.

El siguiente ejemplo carga todas las columnas de  la tabla persondata:

```
LOAD DATE INFILE 'persondata.txt' INTO TABLE persondata;
```

Por defecto, cuando no se proporciona una lista al final de un comando LOAD DATA INFILE, las líneas de entrada se espera que contengan un campo para cada columna de la tabla. Si quiere cargar sólo algunas columnas de una tabla especifique una lista de columnas.

```
LOAD DATA INFILE 'persondata.txt' INTO TABLE persondata(col1,col2,...);
```

Debe especificar una lista de columnas si el orden de los campos del fichero de entrada difiere del orden de las columnas en la tabla. De otro modo, MySQL no puede decir cómo hacer coincidir los campos de entrada con las columnas de la tabla.

Antes de MySQL 5.0.3, la lista de columnas debe contener solo nombres de columnas en la tabla que se carga, y la cláusula SET no se soporta. Desde MySQL 5.0.3, la lista de columnas puede contener nombres de columna o variables y cláusula SET se soporta. Esto le permite asignar valores de entrada a variables de usuario, y luego realizar transformaciones con estos valores antes de asignar los resultados a las columnas.

Las variables de usuario en la cláusula SET puede usarse de distintos modos. El siguiente ejemplo usa la primera columna en el fichero de datos directamente para el valor de tl.columnl, y asigna la segunda columna a una variable de usuario que está sujeta a una operación de división antes de ser usada por el valor de t2.column2:

```
LOAD DATA INFILE 'file.txt' INTO TABLE t1 (column,@var1)
SET column2=@var1/100;
```

La cláusula SET puede usarse para proporcionar valores no derivados del fichero de entrada. Los siguientes comandos actualizan column3 con la fecha y hora actuales:

```
LOAD DATA INFILE 'file.txt' INTO TABLE t1 (column1,column2)
SET column3=CURRENT_TIMESTAMP;
```

También puede descartar un valor de entrada asignándolo a una variable de usuario y no asignando la variable a una columna de tabla:

```
LOAD DATA INFILE 'file.txt' INTO TABLE t1 (column1,@dummy, column2,@dummy,column3);
```

El uso de la lista de columnas/variables y la cláusula SET está sujeto a las siguientes restricciones:

Las asignaciones en la cláusula SET deben tener solo nombres de columna en el lado izquierdo del operador de asignación.

Puede usar subconsultas en la parte derecha de la asignación de SET. Una subconsulta que retorne un valor a ser asignado a otra columna solo puede ser una subconsulta escalar. Además, no puede usar una subconsulta para seleccionar desde la tabla que se está cargando.

Las líneas ignoradas por una cláusula IGNORE no se procesan por parte de la lista de columnas/variables o por la cláusula SET,

Las variables de usuario no pueden usarse al cargar datos con formato de registro ya que las variables de usuario no tienen un ancho de muestra.

Al procesar una línea de entrada, LOAD DATA la divide en campos y usa los valores según la lista columnas7variables y la cláusula SET, si están presentes. A continuación se inserta el registro resultante en la tabla. Si hay disparadores BEFORE INSERT o AFTER INSERT para la tabla, se activan antes o después de insertar el registro, respectivamente.

Si una línea de entrada tiene demasiados campos, los campos extra se ignoran y el número de advertencias se incrementa.

Si una línea de entrada no tiene suficientes campos, las columnas de la tabla que no tienen entrada adquieren su valor por defecto.

Un valor de campo vacío se interpreta de forma distinta que si el valor no está presente:

- Para tipos de cadenas, la columna adquiere la cadena vacía.
- Para tipos numéricos, la columna recibe el valor 0.
- Para tipos de fecha y hora, la columna obtiene el valor "cero" apropiado para el tipo.

Estos son los mismos valores que resultan si asigna una cadena vacía explícitamente a un tipo de cadena de caracteres, numérico o de fecha u hora en un comando INSERT o UPDATE statement.

Las columnas TIMESTAMP obtienen la fecha y hora actuales solo si hay un valor NULL para la columna (esto es, \N), o (para la primera columna TIMESTAMP únicamente) si se omite TIMESTAMP de la lista de campos cuando se especifica una. 

LOAD DATA INFILE trata todas las entradas como cadenas, así que no puede usar valores numéricos para las columnas ENUM o SET del modo en que puede hacerlo con comandos INSERT. Todos los valores ENUM y SET deben especificarse como cadenas.

Cuando acaba el comando LOAD DATA INFILE, retorna una cadena de información con el siguiente formato:

```
Records: 1 Deleted: 0 Skipped:0 Warning:0
```

Las advertencias se producen bajo las mismas circunstancias que cuando los valores se insertan mediante el comando INSERT, excepto que LOAD DATA INFILE también genera advertencias cuando hay muy pocos o demasiados campos en el registro de entrada. Las advertencias no se almacenan en ningún lugar; el número de las mismas puede usarse solo como indicación de si todo ha ido bien.

En MySQL 5.0, puede usar SHOW WARNINGS para obtener una lista de las primeras max_error_count advertencias como información acerca de qué ha fallado.



#### Sintaxis de REPLACE.

```
REPLACE [LOW_PRIORITY | DELAYED]
    [INTO] tbl_name [(col_name [, col_name] ...)]
    VALUES ({expr | DEFAULT},...),(...),...

O: 

REPLACE [LOW_PRIORITY | DELAYED]
    [INTO] tbl_name
    SET col_name={expr|DEFAULT},...
    
O:

REPLACE [LOW_PRIORITY | DELAYED]
    [INTO] tbl_name [(col_name [, col_name] ...)]
    SELECT ... | TABLE table_name
```

REPLACE funciona exactamente como INSERT, excepto que si un valor de la tabla tiene el mismo valor que un nuevo registro para un índice PRIMARY KEY o UNIQUE, el antiguo registro se borra antes de insertar el nuevo.

Tenga en cuenta que a menos que la tabla tenga un índice PRIMARY KEY, o UNIQUE usar un comando REPLACE no tiene sentido. Es equivalente a INSERT, ya que no hay índice para determinar si un nuevo registro duplica otro.

Los valores para todas las columnas se toman de los valores especificados en el comando REPLACE. Cualquier columna no presente adquiere su valor por defecto, como ocurre con INSERT. No puede referirse a valores del registro actual y usarlos en el nuevo registro. Si usa un comando tal como SET col_name = col_name +1, la referencia al nombre de columna en la parte derecha se trata como DEFAULT(col_name), así que es equivalente a SET col_name=DEFAULT(col_name)+1.

Para ser capaz de usar REPLACE, debe tener los permisos INSERT y DELETE para la tabla.

El comando REPLACE retorna un contador con el número de registros afectados. Esta es la suma de registros borrados e insertados. Si el contador es 1 para REPLACE de un único registro, se inserta un registro y no se borra ninguno. Si el contador es mayor que 1, uno o más registros se borraron antes de insertar el nuevo. Es posible para un único registro reemplazar más de un registro antiguo si la tabla contiene múltiples índices únicos y el nuevo registro duplica valores para distintos registros antiguos en distintos índices únicos.

El contador de registros afectados hace fácil determinar si REPLACE solo añadió un registro o si también reemplazo alguno: Compruebe si el contador es 1 (añadido) o mayor (reemplazados).

Si usa la API de c, el contador de registros afectados puede obtenerse usando la función mysql_affected_rows(). Actualmente, no puede reemplazar en una tabla y seleccionar de la misma en una subconsulta.

Aquí sigue en más detalle el algoritmo usado (también se usa con LOAD DATA...REPLACE):

1. Intenta insertar el nuevo registro en la tabla.

2. Mientras falle la inserción debido a error de clave duplicada por clave única o primaria:

   1. Borra de la tabla el registro conflictivo que tiene el valor de clave duplicada.
   2. Intenta insertar de nuevo el registro en la tabla.

   

   

#### Sintaxis de SELECT

```
SELECT
    [ALL | DISTINCT | DISTINCTROW ]
    [HIGH_PRIORITY]
    [STRAIGHT_JOIN]
    [SQL_SMALL_RESULT] [SQL_BIG_RESULT] [SQL_BUFFER_RESULT]
    [SQL_NO_CACHE] [SQL_CALC_FOUND_ROWS] select_expr, ...    
    [INTO OUTFILE 'file_name' export_options
    | INTO DUMPFILE 'file_name']
    [FROM table_references
    [WHERE where_condition]
    [GROUP BY {col_name | expr | position}, ... [WITH ROLLUP]]
    [ASC | DESC], ... [WITH ROLLUP]]
    [HAVING where_condition]
    [ORDER BY {col_name | expr | position}
      [ASC | DESC], ...]
    [LIMIT {[offset,] row_count | row_count OFFSET offset}]
    [PROCEDURE procedure_name(argument_list)]
    [FOR {UPDATE | LOCK IN SHARE MODE}
```

SELECT se usa para recibir registros seleccionados desde una o más tablas. MySQL 5.0 incluye soporte para comandos UNION y subconsultas.

- Cada select_expr indicaba una columna que quiere recibir.
- table_references indicaba la tabla o tablas desde la que recibir registros.
- where_definition consiste en la palabra clave WHERE seguida por una expresión que indica la condición o condiciones que deben satisfacer los registros para ser seleccionados.

SELECT también puede usarse para recuperar registros conmutados sin referencia a ninguna tabla.

Por ejemplo:

```
SELECT 1+1;
->2
```

Todas las cláusulas usadas deben darse exactamente en el orden mostrados en la descripción de la sintaxis. Por ejemplo, una cláusula HAVING debe ir tras cualquier cláusula GROUP BY y antes de cualquier cláusula ORDER BY.

- Una select_expr puede tener un alias usando AS alias_name. El alias se usa como el nombre  de columna de la expresión y puede usarse en cláusulas GROUP BY, ORDER BY o HAVING. Por ejemplo:

```
SELECT CONCAT(las_name,',',first_name) AS full_name
FROM mytable ORDER BY full_name;
```

La palabra clave AS es opcional cuando se usa un alias para select_expr. El ejemplo precedente podría haberse escrito como:

```
SELECT CONCAT(las_name,',',first_name) full_name
FROM mytable ORDER BY full_name;
```

Como AS es opcional, puede ocurrir un sutil problema si olvida la coma entre dos expresiones select_expr: MySQL interpreta el segundo como el nombre del alias. Por ejemplo, en el siguiente comando columnb se trata como un nombre de alias:

```
SELECT colmuna, columnb FROM mytable:
```

Por esta razón, es buena práctica poner los alias de columna usando AS.

- No se permite usar alias de columna en una cláusula WHERE, ya que el valor de columna puede no estar determinado cuando se ejecuta la cláusula WHERE.
- La cláusula FROM table_references indica la tabla desde la que recibir registros. Si nombra más de una tabla, está realizando un join. Para cada tabla especificada, puede opcionalmente especificar un alias.

```
tbl_name [[AS]alias]
[[USE INDEX(key_list)] 
|[IGNORE INDEX(key_list)]
|[FORCE INDEX(key_list)]]
```

El uso de USE INDEX, IGNORE INDEX, FORCE INDEX para dar al optimizador pistas acerca de cómo escoger los índices.

En MySQL 5.0, puede usar SET max_seeks_for_key = value como alternativa para forzar a MySQL a que realice escaneos de claves en lugar de escaneos de tabla.

- Puede referirse a una tabla dentro de la base de datos actual como tbl_name (dentro de la base de datos actual) o como db_name.tbl_name para referirse a una base de datos explícitamente. Puede referirse a una columna como col_name, tbl_name.col_name o db_name.tbl_name.col_name. No necesita especificar un prefijo tbl_name o db_name.tbl_name para una referencia de columna a no ser que la referencia fuese ambigua.

- En MySQL 5.0, puede especificar DUAL como nombre de tabla falso en asignaciones donde no se referencian tablas:

  ```
  SELECT 1+1 FROM DUAL;
  2
  ```

  DUAL es una característica puramente de compatibilidad. Otros servidores requieren esta sintaxis.

- Una referencia de tabla puede tener un aliass usando tbl_name AS alias_name o tbl_name alias_name:

  ```
  SELECT t1.name, t2.salary FROM employee AS t1, info AS t2 -> WHERE t1.name = t2.name;
  SELECT t1.name, t2.salary FROM employee t1, info t2 -> 
  WHERE t1.name = t2.name;
  ```

- En la cláusula WHERE, puede usar cualquiera de las funciones que soporta MySQL, excepto para funciones agregadas (resumen).

- Las columnas seleccionadas para la salida pueden ser referidas en cláusulas ORDER BY y GROUP BY usando nombres de columnas, alias o posiciones. Las posiciones de columnas son enteros y comienzan con 1:

  ```mysql
  SELECT college, region,seed FROM tournament
  ORDER BY region,seed;
  SELECT college, region AS r seed AS s FROM tournament 
  ORDER BY r,s;
  SELECT college, region, seed FROM tournament 
  ORDER BY 2,3;
  ```

  Para ordenar en orden inverso, añada la palabra clave DESC (descendente) al nombre de la columna en la cláusula ORDER BY por la que está ordenando. Por defecto es orden ascendente; puede especificarse explícitamente usando la palabra clave ASC.

  El uso de posiciones de columna está obsoleto ya que la sintaxis se ha eliminado del estándar SQL.

- Si usa GROUP BY, los registros de salida se ordenan según las columnas GROUP BY como si tuviera un ORDER BY para las mismas columnas. MySQL 5.0 extiende la cláusula GROUP BY para que pueda especificar ASC y DESC tras las columnas nombradas en la cláusula:

  ```
  SELECT a,COUNT(b) FROM test_table GROUP BY a DESC;
  ```

- MySQL extiende el uso de GROUP BY para permitir seleccionar campos que no se mencionan en la cláusula GROUP BY.

- En MySQL 5.0, GROUP BY permite un modificador WITH ROLLUP.

- La cláusula HAVING se aplica casi al final, justo antes de que los elementos se envíen al cliente, sin optimización. (LIMIT se aplica tras HAVING).

Antes de MySQL 5.0.2, una cláusula HAVING podía referirse a cualquier columna o alias nombrado en una select_expr en la lista SELECT o en subconsultas externas, y para funciones agregadas. Sin embargo, el estándar SQL requiere que HAVING debe referirse sólo a columnas en la cláusula GROUP BY o columnas usadas en funciones agregadas. Para acomodar ambos estándares SQL y el comportamiento específico de MySQL en que es capaz de referirse a columnas en la lista SELECT, MySQL 5.0.2 y posterior permite a HAVING referirse a columnas en la lista SELECT, en la cláusula GROUP BY, en subconsultas externas y en funciones agregadas.

Por ejemplo, el siguiente comando funciona en MySQL 5.0.2 pero produce un error en versiones anteriores:

```
SELECT COUNT() FROM t GROUP BY coll HAVING coll=2;
```

 Si la cláusula HAVING se refiere a una columna ambigua, se muestra una advertencia. En el siguiente comando, col2 es ambiguo porque se usa tanto para un alias como para un nombre de columna:

```
SELECT COUNT(coll) AS col2 FROM t GROUP BY col2 HAVING col2=2;
```

Se da preferencia al comportamiento SQL estándar, así que si un nombre de columna HAVING se usa en un GROUP BY y como alias de columna en la lista de columnas de salida, se da preferencia a la columna en GROUP BY.

- No use HAVING para elementos que deban estar en la cláusula WHERE. Por ejemplo, no escriba lo siguiente:

  ```
  SELECT col_name FROM tbl_name HAVING col_name > 0;
  
  Escriba esto en su lugar:
  SELECT col_name FROM tbl_name WHERE col_name > 0;
  ```

- La cláusula HAVING puede referirse a funciones de agregación, algo que no puede hacer la cláusula WHERE.

  ```
  SELECT user, MAX(salary) FROM users
  GROUP BY user HAVING MAX(salary)>10;
  ```

  (Esto no funcionaría en versiones antiguas de MySQL).

- La cláusula LIMIT puede usarse para restringir el número de registros retornados por el comando SELECT. LIMIT tiene uno o dos argumentos numéricos, que deben ser enteros positivos (incluyendo cero).

  Con dos argumentos, el primer argumento especifica el desplazamiento del primer registro a retornar. El desplazamiento del registro inicial es 0 (no 1):

  ```
  SELECT * FROM table LIMIT 5,110; #Retrieve rows 6-15;
  ```

  Por compatibilidad con PostgreSQL, MySQL también soporta la sintaxis LIMIT row_count OFFSET offset.

  Para recibir todos los registros de un desplazamiento hasta el final del conjunto de resultados, puede usar algún número grande para el segundo parámetro. Este comando recibe todos los registros desde el 96th hasta el último:

  ```
  SELECT * FROM table LIMIT 95,18446744073 7095511615;
  ```

  Con un argumento, el valor especifica el número de registros a retornar desde el comienzo del conjunto de resultados:

  ```
  SELECT * FROM table LIMIT 5; #Retrieve first 5 rows
  ```

  En otras palabras, LIMIT n es equivalente a LIMIT 0,n.

- La forma SELECT...INTO OUTFILE 'file_name' de SELECT escribe los registros seleccionados en un fichero. El fichero se crea en el equipo servidor, así que debe tener el permiso FILE para usar esta sintaxis. El fichero no puede existir, que entre otras cosas evita destruir ficheros cruciales tales como /etc/password y tablas de la base de datos.

  El comando SELECT ... INTO OUTFILE existe principalmente para dejarle volcar una tabla rápidamente en la máquina servidor. Si quiere crear el fichero resultante en un equipo cliente distinto al equipo servidor, no puede usar SELECT ... INTO OUTFILE. En tal caso, debería usar algún comando como mysql -e "SELECT... " > file_name en el equipo cliente para generar el fichero.

  SELECT ... INTO OUTFILE es el complemento de LOAD DATA INFILE; la sintaxis para la parte export_options del comando consiste en las mismas cláusulas FIELDS y LINES usadas con el comando LOAD DATA INFILE. 

  FIELDS ESCAPED BY controla como escribir caracteres especiales. SI el carácter FIELDS ESCAPED BY no está vacío, se usa como prefijo para los siguientes caracteres en la salida

  - El carácter FILEDS ESCAPED BY
  - El carácter FILEDS [OPTIONALLY] ENCLOSED BY
  - El primer carácter de FILEDS TERMINATED BY y LINES TERMINATED BY
  - ASCII 0 (que se escribe siguiendo el carácter de escape ASCII '0', no un byte con valor cero)

  Si el carácter FILEDS ESCAPED BY está vacío, no hay ningún carácter de escape y NULL se muestra por salida como NULL, no \N. Probablemente no es buena idea especificar un carácter de escape vacío, particularmente si los valores de los campos de sus datos contienen cualquiera de los caracteres en la lista dada.

  La razón de lo anterior es que debe escapar cualquier carácter  FILEDS TERMINATED BY, ENCLOSED BY, ESCAPED BY, o LINES TERMINATED BY para ser capaz de volver a leer el fichero correctamente. ASCII NULL se escapa para hacer más fácil visualizarlo con algunos visores.

El fichero resultante no tiene que estar conforme a la sintaxis SQL, assí que nada más debe escaparse.

Este es un ejemplo que produce un fichero en formato de valores separados por comas usado por varios programas:

```
SELECT a,b,a+b INTO OUTFILE '/tmp/result.text'
FILEDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\\n'
FROM test_table;
```

- Si usa INTO DUMPFILE en lugar de INTO OUTFILE, MySQL escribe solo un registro en el fichero, sin ninguna terminación de línea o columna y sin realizar ningún proceso de escape. Esto es útil si quiere almacenar un valor BLOB en un fichero.

- Nota: cualquier fichero creado por INTO OUTFILE o INTO DUMPFILE es modificable por todos los usuarios en el equipo servidor. La razón es que el servidor MySQL no puede crear un fichero con un propietario distinto al usuario que está en ejecución (nunca debe ejecutar mysqld como root por esta y otras razones). El fichero debe ser modificable por todo el mundo para que pueda manipular sus contenidos.

- Una cláusula PROCEDURE nombra a un procedimiento que debe procesar los datos en el conjunto de resultados.

- Si usa FOR UPDATE en un motor de almacenamiento que usa bloque de páginas o registros, los registros examinados por la consulta se bloquean para escritura hasta el final de la transacción actual. Usar LOCK IN SHARE MODE crea un bloqueo compartido que evita a otras transacciones actualizar o borrar los registros examinados.

  Tras la palabra clave SELECT, puede usar un número de opciones que afectan la operación del comando.

  Las opciones ALL, DISTINCT, and DISTINCTROW especifican si deben retornarse los registros duplicados. Si no se da ninguna de estas opciones, por defecto es ALL (se retornan todos los registros coincidentes). DISTINCT y DISTINCTROW son sinónimos y especifican que los registros duplicados en el conjunto de resultados deben borrarse.

  HIGH_PRIORITY, STRAIGHT_JOIN, y opciones que comiencen con SQL_ son extensiones de MySQL al estándar SQL.

- HIGH_PRIORITY da a SELECT prioridad más alta que un comando que actualice una tabla. Debe usar esto solo para consultas que son muy rápidas y deben realizarse una vez. Una consulta SELECT HIGH_PRIORITY que se realiza mientras la tabla está bloqueada para lectura se efectúa incluso si hay un comando de actualización esperando a que se libere la tabla.

  HIGH_PRIORITY no puede usarse con comandos SELECT que sean parte de una UNION.

- STRAIGHT_JOIN fuerza al optimizador a hacer un join de las tablas en el orden en que se listan en la cláusula FROM. Puede usarlo para acelerar una consulta si el optimizador hace un join con las tablas en orden no óptimo.

- SQL_BIG_RESULT puede usarse con GROUP BY o DISTINCT para decir al optimizador que el conjunto de resultados tiene muchos registros. En este caso, MySQL usa directamente tablas temporales en disco si son necesarias con una clave en los elementos GROUP BY.

- SQL_BUFFER_RESULT fuerza a que el resultado se ponga en una tabla temporal. Esto ayuda a MySQL a liberar los bloqueos de tabla rápidamente y ayuda en casos en que tarda mucho tiempo en enviar el resultado al cliente.

- SLQ_SMALL_RESULT puede usarse con GROUP BY o DISTINCT para decir al optimizador que el conjunto de resultados es pequeño. En este caso, MySQL usa tabla temporales rápidas para almacenar la tabla resultante en lugar de usar ordenación. En MySQL 5.0, esto no hará falta normalmente.

- SQL_CALC_FOUND_ROWS le dice a MySQL que calcule cuántos registros habrán en el conjunto de resultados, sin tener en cuenta ninguna cláusula LIMIT. El número de registros pueden encontrarse con SELECT FOUND_ROWS().

- SQL_CACHE le dice a MySQL que almacene el resultado de la consulta en la caché de consultas si está usando un valor de query_cache_type de 2 o DEMAND. Para una consulta que use UNION o subconsultas, esta opción afecta a cualquier SELECT en la consulta.

- SQL_NO_CACHE le dice a MySQL que no almacene los resultados de consulta en la caché de consultas. Para una consulta que use UNION o subconsultas esta opción afecta a cualquier SELECT en la consulta.





Las cláusulas column_definition usan la misma sintaxis para ADD y CHANGE así como CREATE TABLE. Tenga en cuenta que esta sintaxis incluye el nombre de la columna, no solo el tipo.

Algunas conversiones de tipos de columnas pueden ocurrir. Por ejemplo, el atributo AUTO_INCREMENT no se preserva, y las columnas VARCHAR pueden ser CHAR.

LOAD DATA INFILE es el complemento de SELECT...INTO OUTFILE. Para escribir datos de una tabla en un fichero use SELECT...INTO OUTFILE. Para leer el fichero de nuevo en una tabla, use LOAD DATA INFILE. La sintaxis de las cláusulas FIELDS y LINES es la misma para ambos. Ambas son opcionales, pero FIELDS debe preceder a LINES si se especifican ambas.



## Mapeo de Asociaciones

Los mapeos de asociaciones consisten en realizar consultas a asociaciones de los tipos:

- Muchos-uno.
- Uno-uno.
- Uno-muchos.
- Muchos-muchos.

Si por ejemplo tenemos la tabla Personas, la cual está asociada con la tabla Direcciones, esta relación es de Muchos-uno ya que una persona puede tener varias direcciones.

En el archivo XML de mapeado de Hibernate, quedaría un archivo similar a este:

De tal forma para cada tipo de asociación las características van cambiando en el XML.

```
<class name="Personas">
    <id name="dni" column="dni">
        <generator class="native"/>
    </id>
    <many-to-une name="Direcciones"
         column="Iddireccion"
                 not null ="true"/>
</class>

<class name="Direcciones">
    <id name="id" column="Iddireccion">
        <generator class="native"/>
    </id>
</class>
```

Mediante anotaciones quedaría así:

```
@Entity
@Table(name="PERSONAS")
public class Persona{
    //Otras propiedades y métodos
    private Set<Direccion> direcciones = new HashSet<Direccion>(0);
    @OneToMany(fetch = FechType.LAZY, mappedBy = "persona")
    public Set<StockDailyRecord> getDirecciones() {
        return this.direcciones;
    }
    
    public void SetDirecciones(Set<StockDailyRecord> direcciones) {
        this.direcciones = direcciones;
    }
}

@Entity
@Table(name="direcciones")
public class Direccion{
    Persona persona;
    //................
    @ManyToOne(fetch = FechType.EAGER)
    @JoinColumn(name = "id_persona", nullable = false)
    public Stock getPersona() {
        return this.persona;
    }
    //...........
}
```

Como podemos observar en la clase Persona hemos utilizado la anotación **@OneToMany** para referirnos que una persona tiene múltiples direcciones, y en Dirección **@ManyToOne** para definir la relación inversa. Con **@JoinColumn** en Dirección indicamos la columna con la id que utiliza Direccion para relacionarse con persona.

También se puede observar el uso de un parámetro denominado fetch, **Fetch.LAZY y Fetch.EAGER**, esto le indica a Hibernate cuando realiza la consulta para dicha relación. Con **LAZY** la consulta a la base de datos se lleva a cabo cuando se intenta acceder a la propiedad direcciones, en cambio con **EAGER** se realiza cuando obtenemos el objeto. 



## Mapeo de Herencia

La herencia es fundamental en la orientación de objetos. Esto hace que el código pueda ser reutilizable y la organización de grandes sistemas de información no supongan una tediosa tarea para los programadores.

Hibernate soporta las 3 estrategias básica de mapeo de herencia:

- Tabla por jerarquía de clase.
- Tabla por subclase.
- Tabla por clase concreta.

También se pueden utilizar estrategias distintas para diferentes ramas de una jerarquía. Por ejemplo se puede mezclar tabla por jerarquía y tabla por subclase bajo el mismo  elemento **<class>**, haciendo uso de elementos **<subclass>** y **<join>**. 

También es posible definir las jerarquías en ficheros XML distintos directamente bajo **<hibernate-mapping>**. Esto permite extender una jerarquía de clases añadiendo un nuevo fichero de mapeo y especificando con el atributo **extends** en <subclass> el nombre de una clase padre.

Anteriormente este método requería un orden concreto de los ficheros sin embargo desde la tercera versión el orden es irrelevante cuando se utiliza extends.

```
<hibernate-mapping>
    <subclass name="DomesticCat" extends="Cat" disciminator-value="D">
        <property name="name" type="string"/>
    </subclass>
</hibernate-mapping>
```



**Tabla por jerarquía**

Supongamos que tenemos una interfaz Payment con las implementaciones CreditCardPayment, CashPayment y ChequePayment. El mapeado de tabla por jerarquía se definiria de la siguiente manera:

```
<class name="Payment" table="PAYMENT">
    <id name="id" type="long" column="PAYMENT_ID">
        <generator class="native"/>
    </id>
    <discriminator column="PAYMENT_TYPE" type="string"/>
    <property name="amount" column="AMOUNT"/>
    ....
    <subclass name="CreditCardPayment" discriminator-value="CREDIT">
        <property name="creditCardType" column="CCTYPE"/>
        .....
    </subclass>
    <subclass name="CashPayment" discriminator-value="CASH">
        .....
    </subclass>
    <subclass name="ChequePayment" discriminator-value="CHEQUE">
    <property name="ChequePayment" column="CCHEQUE"/>
    .....
    </subclass>
</class>
```

Mediante este método se utiliza una sola tabla. Hay una limitación en esta estrategia, las columnas declaradas por las subclases no pueden tener restricciones NOT NULL.



**Tabla por subclase**

El mapeado de una tabla por subclase se define de esta manera

```
<class name="Payment" table="PAYMENT">
    <id name="id" type="long" column="PAYMENT_ID">
        <generator class="native"/>
    </id>

    <property name="amount" column="AMOUNT"/>
    ....
    <join-subclass name="CreditCardPayment" table="CREDIT_PAYMENT">
        <key column="PAYMENT_ID"/>
        <property name="creditCardType" column="CCTYPE"/>
        .....
    </join-subclass>
    <join-subclass name="CashPayment" table="CASH_PAYMENT">
        <key column="PAYMENT_ID"/>
        .....
    </join-subclass>
    <join-subclass name="ChequePayment" table="CHEQUE_PAYMENT">
        <key column="PAYMENT_ID"/>
        <property name="ChequePayment" column="CCHEQUE"/>
    .....
    </join-subclass>
</class>
```

Con esta estrategia cutro tablas son requeridas. Las 3 tablass asociadas a las subclases tendrán relaciones por clave primaria a la clase padre, por lo tanto el modelo de la relación Uno-a-uno.

La implementación de tabla por subclase de Hibernate no requiere una columna discriminadora. Otros ORM utilizan una implementación diferente que requiere una columna discriminadora en la de la clase padre. El enfoque adoptado por Hibermate es mucho más difícil de implementar, pero sin duda más correcto desde un punto de vista relacional. Si desea utilizar una columna discriminadora con la estrategia de tabla por subclase, puede combinar el uso de **<subclass>** y **<join>** y, de la siguiente manera:

```
<class name="Payment" table="PAYMENT">
    <id name="id" type="long" column="PAYMENT_ID">
        <generator class="native"/>
    </id>
    <discriminator column="PAYMENT_TYPE" type="string"/>
    <property name="amount" column="AMOUNT"/>
    ....
    <subclass name="CreditCardPayment" discriminator-value="CREDIT">
        <join table="CREDIT_PAYMENT">
            <key column="PAYMENT_ID"/>
            <property name="creditCardType" column="CCTYPE"/>
            .....
        </join>
    </join-subclass>
    
    <subclass name="CashPayment" discriminator-value="CREDIT">
        <join table="CREDIT_PAYMENT">
            <key column="PAYMENT_ID"/>
            .....
        </join>
    </subclass>
        
    <subclass name="ChequePayment" discriminator-value="CHEQUE">
        <join table="CHEQUE_PAYMENT" fecth="select">
            <key column="PAYMENT_ID"/>
            .....
        </join>
    </subclass>
</class>
```



**Tabla por clase concreta**

En este caso se crearía una tabla por cada clase hija pero no la tabla padre, es decir las tablas hijas contienen su propio conjunto de atributos.

```
<class name="Payment">
    <id name="id" type="long" column="PAYMENT_ID">
        <generator class="sequence"/>
    </id>
    <property name="amount" column="AMOUNT"/>
    ....
    <union-subclass name="CreditCardPayment" table="CREDIT_PAYMENT">
        <property name="creditCardType" column="CCTYPE"/>
        .....
    </union-subclass>
    <union-subclass name="CashPayment" table="CASH_PAYMENT">
        .....
    </union-subclass>
    <union-subclass name="ChequePayment" table="CHEQUE_PAYMENT">
        .....
    </union-subclass>
</class>
```

La limitación con esta estrategia es que si una propiedad se asigna a la clase padre, el nombre de columna debe ser el mismo en todas las tablas hijas. La semilla para generar la clave primaria tiene que ser compartida a través de todas las subclases de una jerarquía, es decir, dos objetos herederos no pueden tener la misma id.

Si la clase padre es abstracta (abstract="true") no requiere de una tabla en la base de datos, en otro caso se debe crear una tabla asociada para guardar sus  instancias.



## Trabajo con objetos

**Para recuperar y guardar objetos en Hibernate utilizamos un objeto de Session**. Un objeto Session mantiene una conexión física con la base de datos, está diseñado para ser instanciado cada vez que se necesita una interacción con la base de datos.

Los objetos Session no deben estar abiertos durante largos periodos de tiempo ya que no son thread safe, es decir su uso entre distintos hilos no garantiza la integridad del proceso. En Hibernate un objeto recuperado por Session puede tener varios estados:

- **Transitorio**

  Cuando un objeto está en estado transitorio significa que acaba de ser instanciado y no se encuentra en ninguna Session de Hibernate. Esto se traduce como que en la base de datos no exista aún el objeto y puede ser destruido por el recolector de basura.

- **Separado**

  Este sabado se produce cuando el objeto ha pasado por persistente, pero su Session ya no existe. Quiere decir que el objeto ya no tiene una referencia válida y puede que su valor se haya perdido. Aun así este objeto puede volver a formarse si no se han eliminado todas sus referencias.

- **Persistente**

  Se produce cuando el objeto existe en la base de datos y posee un identificador dentro del ámbito de la Session.

```
//.................
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configurarion;

public class ManagePersons{
    private static SessionFactory factory;
    //............
    public Integer addPerson(String name, String lname){
        Session session = factory.openSession();
        Transaction tx = null;
        Integer ID = null;
        try{
            tx = session.beginTransaction();
            Person person = new Person(name, lname);
            ID = (Integer) session.save(person);
            tx.commit();
        }catch (HibernateException e){
            if(tx!=null) tx.rollback();
            e.printStackTrace();
        }finally{
            session.close();
        }
        return ID;
    }
}
```

Como hemos visto SessionFactory abre una nueva sesion. Con el objeto session podemos iniciar una transacción devolviendo un objeto que luego usamos para realizar el commit de los cambios o el rollback. El método save devuelve la id generada tras insertar el objeto en la tabla.

Con session.update(obj) podríamos actualizar los cambios de un objeto y con delete borrarlo. También podemos recuperar un objeto directamente con la id sin escribir una consulta HQL:

```
(Person)session.get(Person.class, ID);
```



## Optimización

Implementar persistencia con Hibernate es bastante sencillo. Pero lo que empieza siendo fácil puede empezar a ser un problema cuando ssurgen problemas de rendimiento. Hay varias formas de mejorar el rendimiento o encontrar los posibles problemas.

### Hibernate Statistics

Hibernate posee funciones para realizar un registro de las operaciones realizadas y representar determinadas estadísticas, estas se pueden activar estableciendo el parámetro de configuración **hibernate,generate_statistics**  a true y **org.hibernate.stat** a DEBUG. Ahora se podrá observar dicha información durante el desarrollo y compararlo con las expectativas.

![image-20241105101825018](file:///C:/Users/dell/AppData/Roaming/Typora/typora-user-images/image-20241105101825018.png?lastModify=1730715182)

También hay que tener en cuenta que en desarrollo se realizan unas pocas peticiones comparadas con un entorno de producción. Se podrían utilizar herramientas de estrés contra el servidor local para ver los resultados bajo una carga significativa.

### Consultas lentas

El lenguaje HQL permite abstraernos de la base de datos específica, pero las consultas que se generan pueden no ser las óptimas. Si se le da más importancia al rendimiento que a la portabilidad para operaciones complejas es mejor utilizar consultas nativas. Sin embargo cuando se utilizan consultas nativas se reciben arrays de objetos (Object[]), se pueden mapear estos objetos a las clases de modelo con la anotación @SqlResultSetMapping.

### Elegir el correcto FetchType (LAZY-EAGER)

Podemos cargar los objetos relacionados de dos formas, realizar otra consulta al acceder a la propiedad o cuando obtenemos el objeto principal de la base de datos. Se debe elegir el tipo apropiado en función de la frecuencia y uso que demos a estos datos. Si se utilizan con poca frecuencia es más recomendable elegir **LAZY** por ejemplo.

También es posible realizar una captura **EAGER** en una consulta con la palabra clave **FETCH**:

```
SELECT DISTINCT a FROM Author a JOIN FETCH a.book b
```

### Operaciones pesadas

Si se van a realizar operaciones a un gran conjunto de datos es mejor si dejamos que la base de datos lo lleve a cabo y nos devuelva el resultado. Aparte de las operaciones que se pueden realizar con HQL se puede llamar a procedimientos implementados en la propia base de datos a través de **@NamedStoredProcedureQuery:**

```
@NameStoredProcedureQuery(
    name = "getBooks",
    procedureName = "get_books",
    resultClasses = Book.class,
    parameters = { @storedProcedureParameter(mode = ParameterMode.REF_CURSOR, type = void.class)}
)
```



## Recuerda

- **Hibernate**

  Es un servicio de persistencia en objetos relacionales de alto rendimiento cuya licencia está bajo GNU y es totalmente gratuito.

- **Acelerar**

  En definitiva se puede decir que Hibernate está diseñado para acelerar la relación existente entre la aplicación y la base de datos.

- **Clases mapeadas**

  Para la creación de clases mapeadas, tenemos que seguir una serie de reglas las cuales son estrictamente necesarias para que Hibernate pueda reconocerlas.

- **HQL**

  El lenguaje utilizado por Hibernate se llama HQL o Hibernate Query Languaje. Este posee su propio lenguaje pero muy similar al ya conocido SQL.

- **Herencia**

  La herencia es fundamental para localizar a todos los objetos de una estructura.

- **ORM**

  Hibernate es un ORM bastante complejo para lograr una buena optimización. Por ello se suele decir que las consultas mediante JDBC son más rápidas, ya que para lograr obtener los conocimientos de Hibernate necesarios hasta obtener un nivel alto ser muy tedioso.

![image-20241105103831972](file:///C:/Users/dell/AppData/Roaming/Typora/typora-user-images/image-20241105103831972.png?lastModify=1730715182)

hibernate.dialect indica a Hibernate como generar el código Java apropiado para la base de datos elegida.

Hibernate no solo utiliza ficheros xml para el mapeado de clases.

![image-20241105103853382](file:///C:/Users/dell/AppData/Roaming/Typora/typora-user-images/image-20241105103853382.png?lastModify=1730715182)

HQL es independiente de la base de datos y trata los objetos Java de la misma manera que SQL trata las tablas.

Para la creación de clases mapeadas, tenemos que seguir una serie de reglas las cuales son estrictamente necesarias para que Hibernate pueda reconocerlas.

En Hibernate se usa el método save (session.save) para guardar un modelo.





# Examen final

![image-20241105112049019](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241105112049019.png)

![image-20241105112113584](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241105112113584.png)

![image-20241105112150634](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241105112150634.png)

![image-20241105112222026](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241105112222026.png)

![image-20241105112343158](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241105112343158.png)

![image-20241105112408042](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241105112408042.png)

![image-20241105112432119](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241105112432119.png)

![image-20241105112512353](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241105112512353.png)

![image-20241105112548077](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241105112548077.png)

![image-20241105112613820](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241105112613820.png)

![image-20241105112641541](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241105112641541.png)

![image-20241105112701243](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241105112701243.png)

![image-20241105112726756](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241105112726756.png)

![image-20241105112746343](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241105112746343.png)

![image-20241105112805483](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241105112805483.png)

![image-20241105112828741](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241105112828741.png)

![image-20241105112850616](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241105112850616.png)

![image-20241105112929165](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241105112929165.png)

![image-20241105112953511](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241105112953511.png)

![image-20241105113014601](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241105113014601.png)





## ERRORES

Netbeans

1. Si al compilar un proyecto muestra error: error: Source option 6 is no longer supported. Use 7 or later.

   Solucion: boton derecho sobre el proyecto > Propierties y cambiar la version de java de la 6 a otra superior.

   ![image-20241011100350273](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241011100350273.png)

2. a





IMPORTANTE

@Override  **fuerza al compilador a comprobar en tiempo de compilación que estás sobrescribiendo correctamente un método**, y de este modo evitar errores en tiempo de ejecución, los cuales serían mucho más difíciles de detectar
