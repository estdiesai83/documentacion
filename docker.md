# Docker

Es una plataforma de software de código abierto que  permite a los desarrolladores crear, desplegar, ejecutar, actualizar y administrar aplicaciones en contenedores. 

Los **contenedores** son unidades estandarizadas que empaquetan el código de una aplicación con todas las dependencias y librerías, lo que facilita la ejecución consistente de la aplicación en diferentes entornos, ya sea en desarrollo, pruebas o producción.



**En resumen, Docker sirve para: **

- **Empaquetar aplicaciones:**

  Los contenedores Docker ofrecen un aislamiento efectivo entre diferentes aplicaciones y sus dependencias, evitando conflictos y mejorando la seguridad.

- **Aislamiento de aplicaciones:**

  Los contenedores Docker son portátiles y pueden ejecutarse en cualquier sistema que tenga Docker instalado, independientemente del sistema operativo subyacente.

- **Portabilidad:**

  Facilita el desarrollo rápido y eficiente, permitiendo a los desarrolladores crear, probar y desplegar aplicaciones de forma rápida y sencilla.

- **Desarrollo ágil:**

  Facilita el desarrollo rápido y eficiente, permitiendo a los desarrolladores crear, probar y desplegar aplicaciones de forma rápida y sencilla.

- **Escalabilidad:**

  Docker permite escalar aplicaciones de manera sencilla, simplemente creando más instancias del mismo contenedor.

  "Escalar aplicaciones" se refiere a la capacidad de una aplicación para manejar un aumento en la carga de trabajo o el número de usuarios sin afectar su rendimiento. En esencia, es la habilidad de la aplicación para crecer y adaptarse a nuevas demandas. Esto puede implicar diferentes estrategias, como agregar más recursos a la infraestructura existente (escalado vertical) o distribuir la carga entre múltiples servidores (escalado horizontal). 

- **Microservicios:**

  Docker es una herramienta fundamental para implementar arquitecturas basadas en microservicios, donde **cada servicio se ejecuta en un contenedor independiente**.



**Docker es un sistema operativo para contenedores**. De manera similar a cómo una máquina virtual virtualiza (elimina la necesidad de administrar directamente) el hardware del servidor, los contenedores virtualizan el sistema operativo de un servidor.

**Diferencia entre los contenedores y la virtualización**

¿Los contenedores son simplemente una virtualización? No exactamente, considérelo más como un complemento. A continuación, encontrará una forma sencilla de comprenderlos:

- La [virtualización](https://www.redhat.com/es/topics/virtualization) permite que sus SO (Windows o [Linux](https://www.redhat.com/es/topics/linux)) se ejecuten simultáneamente en un solo sistema de hardware.
- Los contenedores comparten el mismo kernel del sistema operativo y separan los procesos de las aplicaciones del resto del sistema. Por ejemplo, los sistemas Linux [ARM](https://www.redhat.com/es/topics/linux/procesadores-arm) ejecutan contenedores de Linux para ARM; los sistemas Linux x86 ejecutan contenedores de Linux para x86; y los sistemas Windows x86 ejecutan contenedores de Windows para x86. Los contenedores de Linux son muy portátiles, pero [deben ser compatibles ](https://www.redhat.com/es/topics/linux/diferencias-entre-los-procesadores-arm-y-x86)con el sistema subyacente.

[![virtualization vs containers](https://www.redhat.com/rhdc/managed-files/styles/wysiwyg_full_width/private/virtualization-vs-containers.png.webp?itok=vvjopbiw)](https://www.redhat.com/rhdc/managed-files/virtualization-vs-containers.png)

¿Qué significa esto? Para empezar, la virtualización utiliza un hipervisor para emular el hardware, lo cual permite que varios sistemas operativos se ejecuten de forma conjunta. Sin embargo, este proceso no es tan ligero como los contenedores. Si tiene recursos limitados con funciones que también lo son, necesita aplicaciones ligeras que se puedan implementar de forma masiva. Gracias a que los contenedores de Linux se ejecutan en el sistema operativo y lo comparten con todos los demás contenedores, sus aplicaciones y servicios siguen siendo ligeros y se ejecutan rápidamente en paralelo.





**¿Cómo funciona?**

Docker utiliza el concepto de contenedores, que son unidades ligeras y aisladas que ejecutan aplicaciones. 

Los contenedores se basan en imágenes que son plantillas de sólo lectura que contienen todo lo necesario para ejecutar la aplicación, incluyendo el código, las bibliotecas y las dependencias del sistema.

Al utilizar Docker, los desarrolladores pueden crear aplicaciones más robustas, portátiles y fáciles de mantener, optimizando el proceso de desarrollo y despliegue. 

Se puede desplegar en local o en la nube, que permite gestionar contenedores virtuales.

Los contenedores son similares a máquinas virtuales,

La tecnología Docker utiliza el kernel de Linux y sus funciones, como los grupos de control y los espacios de nombre, para dividir los procesos y ejecutarlos de manera independiente. El propósito de los contenedores es ejecutar varios procesos y aplicaciones por separado para que se pueda aprovechar mejor la infraestructura, y al mismo tiempo, conservar la seguridad que se obtendría con los sistemas individuales.



Originalmente, Docker se diseñó a partir de la tecnología LXC, por lo que se asociaba con los contenedores "tradicionales" de Linux, pero se ha ido alejando de esa dependencia. LVC funcionaba como una virtualización ligera, pero no offrecía una buena experiencia al desarrollador ni al usuario. 

La tecnología Docker no solo ofrece la capacidad para **ejecutar los contenedores, sino que también facilita su creación y diseño, así como el envío y el control de versiones de las imágenes, entre otras funciones**. 

![img](https://www.redhat.com/rhdc/managed-files/traditional-linux-containers-vs-docker_0.png)

Los contenedores de Linux tradicionales usan un sistema init que puede gestionar varios procesos. Esto significa que las aplicaciones completas se pueden ejecutar como una sola. La tecnología Docker favorece la división de las aplicaciones en sus procesos individuales y ofrece las herramientas para hacerlo. Este enfoque de separación de los elementos tiene sus ventajas.

**Ventajas de los contenedores Docker:**

- **Modularidad:**

  Docker se centra en la capacidad de separar una parte de la aplicación para actualizarla o repararla, sin necesidad de deshabilitarla por completo. Además de aprovechar este modelo basado en los microservicios, puede intercambiar procesos entre varias aplicaciones casi de la misma forma en que funciona la arquitectura orientada a los servicios (SOA) (Service Oriented Architecture).

  SOA: es un estilo de arquitectura de TI que se apoya en la orientación de servicios. Es una forma de pensar en servicios, su construcción y sus resultados. Un servicio es una representación lógica de una actividad de negocio que tiene un resultado de negocio específico (ejemplo: comprobar el crédito de un cliente, obtener datos de clima)

- **Capas y control de versiones de imágenes:**

  Cada archivo de imagen Docker está compuesto por varias capas que conforman una sola imagen. Cuando un usuario especifica un comando, como ejecutar o copiar, la imagen cambia y se crea una capa nueva.

  Docker reutiliza las capas para agilizar el diseño de los contenedores nuevos. Los cambios intermedios se comparten entre las imágenes para mejorar aún más la agilidad, el tamaño y la eficiencia. El control de versiones también es propio de la creación de capas: el registro incorporado de los cambios le brinda el control total de las imágenes de contenedores cada vez que se produce una modificación.

- **Restauración:**

  Todas las imágenes cuentan con capas. Si no le gusta la iteración actual de una imagen, puede restaurarla a una versión anterior. Esto respalda el enfoque de desarrollo ágil y permite lograr la integración e implementación contínuas (CI/CD)

  **CI/CD**: integración y distribución o implementación contínuas, es optimizar y agilizar el ciclo de vida del desarrollo del software.

  La integración contínua (CI) consite en integrar los cambios del código en un repositorio de código fuente compartido de forma automática y frecuente.

  La implementación o distribución contínua (CD) es un proceso de dos partes que implica la integración, la prueba y la distribución de los cambios en el código.

  Mientras que en la distribución contínua los cambios no llegan a implementarse en la etapa de producción de forma automática, en la implementación contínua si se logra. 

  ![image-20250819223132773](/home/soa/.config/Typora/typora-user-images/image-20250819223132773.png)

  Estas práctica vinculadas se conocen como "canal de CI/CD" y cuentan con el respaldo de los equipos de desarrollo y de operaciones que trabajan en conjunto de manera ágil, con un enfoque de **DevOps** o de ingeniería de confiabilidad del sitio (SRE)

  **DevOps:** es un conjunto de prácticas que combina el desarrollo de software y las operaciones de TI (Tecnologías de la información, engloba el uso de computadoras, redes y otros dispositivos para procesar, almacenar y transmitir información) para distribuir soluciones de software de manera más rápida, confiable y estable. DevOps agiliza los procesos por los cuales una idea (como una nueva función de software, una solicitud de mejoras o una corrección de errores) pasa de la etapa de desarrollo a la de implementación en un entorno de producción en el que se puede generar valor para los usuarios. Este enfoque requiere que los equipos de desarrollo y operaciones se comuniquen con frecuencia. 

  Los equipos de desarrollo, por lo general programan en un entorno de desarrollo estándar, trabajan en estrecha colaboración con los equipos de operaciones de TI para agilizar el diseño, las pruebas y los lanzamientos de los sistemas de software sin comprometer la confiablidad.

  DevOps sigue los principios del open source y adopta enfoques transparentes y ágiles para el trabajo. En las comunidades open source, se comparte información líbremente. 

  Los ingenieros DevOps cuentan con habilidades tanto en el desarrollo como en las operaciones de TI. Incorporan las mejoras, las herramientas y las metodologías de los procesos en el ciclo de vida de desarrollo de software para aumentar la eficiencia y agilizar el paso del diseño del software al lanzamiento. Se encargan de reducir la cantidad de tareas repetitivas implementando la automatización para así disminuir las dificultades. 

  En concreto, el proceso de integración y distribución continuas incorpora la [automatización](https://www.redhat.com/es/topics/automation/whats-it-automation) y la supervisión permanentes en todo el ciclo de vida de las aplicaciones, desde las etapas de integración y prueba hasta las de [distribución e implementación](https://www.redhat.com/es/topics/application-development-and-delivery/que-implica-automatizar-las-implementaciones), de manera que puedas identificar y corregir los problemas y las fallas con rapidez.

  #### Microservicios

  DevOps también se refiere a la creación de nuevos tipos de sistemas de software que se ajusten mejor a este ritmo de la distribución continua. Por eso, a menudo los equipos de DevOps diseñan el software utilizando una arquitectura de [microservicios](https://www.redhat.com/es/topics/microservices/what-are-microservices) y emplean las interfaces de programación de aplicaciones ([API](https://www.redhat.com/es/topics/api)) para vincular estos servicios. Los microservicios representan una forma de dividir las aplicaciones en elementos más pequeños e independientes entre sí. A diferencia del enfoque tradicional y monolítico de las aplicaciones, en el que todo se compila en una sola pieza, los microservicios son independientes y funcionan en conjunto para llevar a cabo las mismas tareas.

  Las API también permiten la colaboración entre el equipo comercial y el de TI, ya que simplifican la forma en que los desarrolladores integran los elementos de las aplicaciones nuevas en la arquitectura actual. Los equipos pueden distribuir las aplicaciones con mayor rapidez al crear partes más pequeñas de las funciones. Pueden centrarse en la manera en que los microservicios y las API se gestionan y tener una estrategia para combinarlo todo, como la integración ágil. 

- **Implementación rápida:**

  Antes, se necesitaban varios días para poner en marcha un sistema de hardware nuevo, implementarlo y ponerlo a disposición de los usuario, lo cual implicaba un esfuerzo y un coste abrumadores.

  Con los contenedores basados en Docker, la implementación se puede realizar en cuestión de segundos.

  Cada proceso se encuentra en un contenedor distinto, por lo que puede compartirlos con aplicaciones nuevas rápidamente. Además, ya no es necesario iniciar el sistema operativo para agregar o trasladar un contenedor, los tiempos de implementación son mucho más cortos, y pueden crear datos y eliminar aquellos que generen los contenedores de manera fácil y rentable.



**Límites para el uso de Docker:**

Docker, por si solo, puede gestionar contenedores individuales. Si comienza a utilizar cada vez más contenedores y aplicaciones que se alojan en ellos con cientos de elementos, se dificultará su gestión y organización.

En algún momento deberá cambiar el enfoque y agrupar los contenedores para prestar los servicios, como las redes, la seguridad y la telemetría, entre otros. Aquí entra en juego **Kubernetes.**







## Instalación en Ubuntu

Abrir terminal y actualizar los repositorios

```bash
sudo apt-get update
```

Ejecutamos el siguiente comando:

```bash
sudo apt install apt-transport-httpss ca-certificates curl software-properties-common
```

Con esto instala las claves del repositorio

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

Si da error la línea anterior de que esta deprecada poner:

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```

Añadir el repositorio de docker

```bash
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null (si la línea anterior no funciona)
```

Volvemos a actualizar los repositorios:

```bash
sudo apt get update
```

Instalamos docker:

```bash
sudo apt install docker-ce docker-ce-cli docker-ce-rootless-extras docker-scan-plugin git git-man liberror-perl pigz slirp4netns containerd.io
```

Verificamos la instalación:

```bash
sudo systemctl status docker
```

Nos mostrará algo como: si esta en verde está correctamente ejecutado

![image-20250818204858734](/home/soa/.config/Typora/typora-user-images/image-20250818204858734.png)

En verde pone que está activo y corriendo.





Configurar docker:

1. Que no pida todo el rato la contraseña de root mientras está corriendo, ejecutamos estos comandos:

   ```bash
   sudo usermod -aG docker ${USER}
   su - ${USER}
   id -nG
   ```

   ![image-20250819012859349](/home/soa/.config/Typora/typora-user-images/image-20250819012859349.png)

   Si al poner el comando id -nG aparece nuestro nombre, es que está todo correcto.

   el comando **id**: imprime UIDs y GIDs reales y efectivos

2. Para comprobar que el cambio está realizado correctamente, y que no nos pide la contraseña, ejecutamos:

   ```bash
   docker ps
   ```

   Si aparece esto,  es que está todo ok

   ![image-20250819013908962](/home/soa/.config/Typora/typora-user-images/image-20250819013908962.png)



## Imágenes de docker

Una imágen en docker es el paso número uno para poder iniciar un contenedor, es decir tenemos imágenes de Ubuntu, de python, de bases de datos como mysql y estas imágenes básicamente sirven para poder ejecutar un contenedor de estos mismos programas, por ejemplo un contenedor de ubuntu, un contenedor de lo que sea, pero todo el contenedor parte desde una imagen instalada previamente.

Con el comando `docker images`va a mostrar aquella imágenes que tengo instaladas en mi docker

```
docker images
```

![image-20250819095846078](/home/soa/.config/Typora/typora-user-images/image-20250819095846078.png)







En la web https://hub.docker.com/  podemos adquirir o bajarnos imágenes que ya estén creadas, por ejemplo hay imágenes de Ubuntu, de bases de datos,... que si la descargo y la instalo, después puedo usar un contenedor de estas imágenes. 

![image-20250819100124886](/home/soa/.config/Typora/typora-user-images/image-20250819100124886.png)

Para instalar una imagen descargada dentro de mi docker, entramos a la imagen y tenemos el comando `docker pull ubuntu`

Si en las imágenes pone official imagen, quiere decir que tiene soporte oficial

Vamos a instalar por ejemplo la imagen de hello world

```bash
docker pull hello-world:linux
```



Para eliminar una imagen exite el comando `docker rmi nombre_imagen` podemos poner el nombre de la imagen o también podemos poner el id

```bash
docker rmi hello-world
```



## Contenedores

Un contenedor sirve para ejecutar el contenido de una imagen, es decir tengo el contenido dockerizado, es decir tengo el acceso por terminal bash.

```
docker run -it nombre_imagen: ejecuta un contenedor de una imagen en primer plano.

docker run -d nombre_imagen: ejecuta un contenedor de una imagen en segundo plano
```



Ejemplo: 

```bash
sudo docker run hello-world
```

Este comando descargará una imagen de prueba en un contenedor y mostrará un mensaje. Si todo funciona correctamente.

```bash
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
17eec7bbc9d7: Pull complete 
Digest: sha256:a0dfb02aac212703bfcb339d77d47ec32c8706ff250850ecc0e19c8737b18567
Status: Downloaded newer image for hello-world:latest
```



```bash
Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
$ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
https://hub.docker.com/

For more examples and ideas, visit:
https://docs.docker.com/get-started/
```



Para ver que contenedores se están ejecutando:

```bash
docker ps -a
```

Aparecerá algo como:

![image-20250819114458543](/home/soa/.config/Typora/typora-user-images/image-20250819114458543.png)

Si en STATUS pone exited quiere decir que está en pausa.

En NAMES, suele poner un nombre de manera aleatoria, a no ser que se le especifique un nombre en concreto

```bash
docker run -it --name prueba hello_world
```

![image-20250819114940361](/home/soa/.config/Typora/typora-user-images/image-20250819114940361.png)



Ahora tenemos varios contenedores, para eliminar un contenedor, se puede utilizar el comando `docker rm` con el nombre asignado o con el contenedor_id ( no hace falta poner el numero entero del id, se puede poner por ejemplo los 3 primeros números):

```bash
docker rm nombre
docker rm contenedor_id
```



Descargamos una imagen de ubuntu

```bash
docker pull ubuntu
```

![image-20250819121108400](/home/soa/.config/Typora/typora-user-images/image-20250819121108400.png)

Ejecutamos la imagen

```bash
docker run -it ubuntu
```

Vemos que ahora estamos dentro del contenedor de la imagen de ubuntu

![image-20250819121210454](/home/soa/.config/Typora/typora-user-images/image-20250819121210454.png)





## Comandos:

`docker images`: lista las imágenes contenidas en docker.

`docker pull nombre_imagen`: instala una imagen en nuestro docker.

`docker rmi nombre_imagen`: elimina una imagen de nuestro docker.

`docker run -it nombre_imagen`: ejecuta un contenedor de una imagen en primer plano.

`docker run -d nombre_imagen`: ejecuta un contenedor de una imagen en segundo plano.

`docker ps -a`: Nos muestra los contenedores que se están ejecutando.





### Ejemplos utilizados en las monjas:

   sudo docker image
   git log (coger id commint)
   git tag v.1.0.10.beta (mas churro del commint)
   git push --tags
   sudo ./build.sh 192.168.1.30:5555 teho-backend 1.0.1.10 (produccion) (si es desarrollo -beta)
   cd sistemas/entornos-docker/
   sudo docker stop teho-backend
   sudo docker stop kernelsoa
   (En desarrollo modificar el docker-compose.yaml y actualizar la versión
   sudo docker-compose up -d teho_backend
   sudo docker-compose up -d kernelsoa-alejandro-somosaguas

   Para producción 
   Ir a pull REquest
   meter develop en master
   create pull request
   Merge pull request
   Confirmar

Code (tag) create realeases
   version ultima que corresponda con la beta
   create
   Ir action para ver cuando termina de generarse la imagen
   En produccion
sudo docker stop kernelsoa-*-* (por cada uno)
sudo docker-compose up -d kernelsoa_*_* (por cada uno)


--------------

sudo docker stop kernelsoa
   --------------

   Añadir 
   git tag x.x.x-beta  ( churro ) 
   git tag x.x.x  ( churro git log  origin/master )
   git push --tag 
   (Se generara la imagen automaticamente)

   git log --online --graph --all


   Descargar Docker

   En produccion: 
      - sudo docker pull 192.168.1.30:5555/teho-backend:latest
      - sudo docker stop teho-backend
      - sudo docker-compose up -d teho_backend

   En desarrollo:
    - sudo docker pull 192.168.1.30:5555/teho-backend:x.x.x-beta
    - modificar docker compose y actualizar versión
    - sudo docker stop teho-backend
    - sudo docker-compose up -d teho_backend





## **Kubernetes**

Es una plataforma open source para la organización de contenedores que automatiza muchos de los procesos manuales involucrados en la implementación, la gestión y el ajuste de las aplicaciones que se alojan alli.

Además, automatiza la configuración de sus aplicaciones, además de mantener y supervisas la asignación de recursos. 

### Conceptos básicos de kubernetes

Es una plataforma para la gestión de los contenedores, que agrupan el código, la configuración y las dependencias de una aplicación, lo que permite ejecutarla como un proceso aislado con sus propios recursos.

Cada aplicación obtiene su propio contenedor o varios de ellos, que se organizan en pods de Kubernetes.

Se pueden ejecutar Kubernetes en servidores dedicados (bare metal), máquinas virtuales, proveedores de nube pública, nubes privadas o entornos de nube híbrida. Una de las principales ventajas es que funciona en muchos tipos de infraestructura.

Como se explica en los detalles de implementación de Kubernetes, su diseño ayuda a los usuarios a seguir tres principios básicos. Una implementación de Kubernetes debe reunir las siguientes características:

- **Seguridad**: Debe seguir las prácticas recomendadas de seguridad más recientes.
- **Facilidad de uso**: Debe poder operarse con algunos comandos sencillos.
- **Capacidad de expansión**: No debe favorecer a un solo proveedor. Además, debe poder personalizarse desde un archivo de configuración.

### Ventajas de kubernetes:

Automatiza gran parte de las tareas engorrosas de implementación y ajuste de las aplicaciones, y facilita el uso de métodos de desarrollo directamente en la nube que ahorran tiempo y agilizan la comercialización de nuevo software. Principales ventajas:

- **Compatibilidad con entornos amplios y complejos:** 

  Un entorno de producción que ejecuta diversas aplicaciones requerirá muchos contenedores implementados en varios hosts y que funcionen a la vez. Kubernetes ofrece las funciones de organización y gestión que permiten implementar los contenedores según sea necesario para estas cargas de  trabajo.

- **Capacidad de ajuste:**

  La plataforma se ajusta automáticamante en función de tus necesidades y ofrece la capacidad que precisan tus aplicaciones, y al mismo tiempo, ahorra recursos y costos.

- **Portabilidad:**

  Kubernetes puede ejecutarse de manera local en tu propio centro de datos, en una nube pública y en configuraciones híbridas, ya sean instancias públicas o privadas. Cualquiera que sea el entorno, pueden utilizarse los mismos comandos.

- **Implementaciones uniformes:**

  Los contenedores representan el concepto de infraestructura inmutable, y todas las dependencias y las indicaciones de configuración que se necesitan para ejecutar una aplicación se incluyen en el contenedor.

- **Equipos de desarrollo y operaciones independientes y automatizados: **

  El uso de contenedores permite que los desarrolladores ahorren tiempo, lo cual agiliza los ciclos de repetición. A su vez Kubernetes ofrece más seguridad a los equipos de operaciones en cuanto a la estabilidad del sistema.

- **Respaldo a la estrategia de nube híbrida:**

  Muchas empresas combinan centros de datos locales con soluciones de nube pública o privada, y distribuyen las cargas de trabajo entre varios proveedores del sector para aprovechar los cambios en los precios y los distintos niveles de servicio.

- **Soporte permanente para las aplicaciones tradicionales:**

  La plataforma permite distribuir y gestionar aplicaciones heredadas, desarrolladas directamente en la nube y en contenedores, así como aquellas rediseñadas con una estructura de microservicios.

- **Gestión de entornos complejos:**

  Los microservicios organizados en contenedores facilitan la coordinación de servicios, como el almacenamiento, la conexión de red y la seguridad, pero también multiplican de manera significativa la cantidad de contenedores en el entorno y por lo tanto, también su complejidad. Kubernetes agrupa los contenedores en pods para que puedas programar las cargas de trabajo y proporcionar los servicios necesarios, como las conexiones de red y el almacenamiento, para esos contenedores.

- **Mejora de la seguridad:**

  Los administradores pueden aplicar políticas de seguridad y control, y dividirlas en pods o grupos de pods. Los equipos de desarrollo pueden identificar los problemas de seguridad que surjan en los contenedores durante el tiempo de ejecución y solucionarlos en la fase de diseño, en lugar de actualizarlos o aplicarles parches en la producción. 

  El control de acceso basado en funciones (RBAC) puede asignar permisos específicos a los usuarios y las cuentas de servicios. Los secretos de Kubernetes pueden ayudarte a proteger los datos confidenciales, como las claves de cifrado.

- **Habilitación de DevOps:**

  Kubernetes ofrece una base de infraestructura uniforme para los contenedores y adopta un enfoque DevOps, el cual fomenta una relación laboral eficaz entre los equipos de desarrollo y operaciones. El uso del canal de integración y distribución continuas (CI/CD) permite optimizar y acelerar el ciclo de vida del desarrollo de software. Además, la evolución de DevOps, DevSecOps, realiza los controles de seguridad y la gestión de los puntos vulnerables desde las primeras etapas de desarrollo.



**¿Qué es un clúster de Kubernetes?**

El clúster es una implementación de Kubernetes en funcionamiento, que consiste en un grupo de hosts ejecutándose en contenedores.

En otras palabras, un clúster de  Kubernetes es un grupo de máquinas (nodos) que trabajan juntas para ejecutar y administrar aplicaciones contenedorizadas.

El objetivo principal es automatizar el despliege, el escalamiento y la gestión de las aplicaciones contenizadoras.

Los administradores definen el estado deseado de un cluster de Kubernetes y describen las aplicaciones o las cargas de trabajo que deben ejecutarse, junto con las imágenes que utilizan, los recursos que deben estar disponibles y otros ajustes similares.

Un clúster de Kubernetes consta de dos partes:

- **El plano de control:** se encarga de mantener el estado deseado del clúster, como las aplicaciones que se ejecutan y las imágenes de contenedores que se utilizan.

- **Nodos informáticos:** Los nodos siguen las indicaciones del plano de control y se encargan de ejecutar las aplicaciones y las cargas de trabajo. Cada nodo es su propio entorno de Linux y puede ser una máquina virtual o física. Un clúster de Kubernetes necesita al menos un nodo informático, pero suele tener varios.

Un **nodo** de Kubernetes se compone de **Pods**, cada uno de los cuales representa una única instancia de una aplicación. Cada pod incluye un contenedor o una serie de contenedores con conexión directa, y las opciones que controlan su funcionamiento.

Una gran cantidad de servicios de Kubernetes funcionan de manera coordinada para identificar automáticamente el nodo más adecuado para cada tarea, asignar los recursos y encargar a los pods de ese nodo que ejecuten el trabajo solicitado.

Kubernetes envía las solicitudes al pod correspondiente de forma automática, sin importar adónde se traslade en el clúster ni si se lo reemplaza.

Para mantener todo bajo control Kubernetes facilita una interfaz de programación de aplicaciones (**API**) unificada que permite gestionar, crear y configurar el clúster.



### ¿Cómo funciona la arquitectura de Kubernetes?

El plano de control es la pieza más importante, ya que contiene los elementos que controlan el clúster y los datos sobre su estado y configuración. Estos elementos principales de Kubernetes se encargan de garantizar que la cantidad de contenedores en ejecución sea suficiente y que estén disponibles los recursos necesarios.

La **API de Kubernetes** (o kube-apiserver) es el frontend del plano de control de esta plataforma y se encarga de gestionar las solicitudes internas y externas. El servidor de la API determina si una solicitud es válida, y en ese caso, la procesa. Puedes acceder a la API con llamadas de REST, con la interfaz de la línea de comandos o kubectl o con otras herramientas de la línea de comandos, como kubeadm.

El programador de Kubernetes (o kube-scheduler) determina los recursos que necesita un pod (como CPU o memoria) junto con el estado del clúster. Luego programa, el pod en un nodo informático adecuado.

Los controladores (o kube-controller-manager) son los que realmente ejecutan el clúster. El controlador y administrador de Kubernetes agrupa en un solo controlador varias funciones de este tipo. Un controlador realiza una consulta al programador y se asegura de que se esté ejecutando la cantidad correcta de pods. Si uno de ellos deja de funcionar, otro controlador lo percibe y responde al problema.

Los datos de configuración y la información sobre el estado del clúster se alojan en la **etcd**, una base de datos de almacenamiento clave-valor. 

Cada nodo posee un motor de tiempo de ejecución de contenedores que posibilita el funcionamiento de estos.

Todos los nodos contienen una kubelet, es decir, una aplicación muy pequeña que se comunica con el plano de control y que garantiza la ejecución de los contenedores en un pod. Cuando el plano de control necesita que algo suceda en un nodo, la kubelet ejecuta la acción. 









**Las aplicaciones diseñadas en la nube:**

Para tener éxito en los mercados dinámicos e impulsados por el software, las empresas deben cambiar la forma en que diseñan, compilan y utilizan las aplicaciones.

El desarrollo de aplicaciones en la nube es un enfoque que permite diseñarlas, ejecutarlas y mejorarlas en función de técnicas y tecnologías para el cloud computing.

Las aplicaciones desarrolladas en la nube son un conjunto de servicios pequeños, independientes y sin conexión directa. El desarrollo en la nube permite acelerar el diseño de aplicaciones nuevas, optimizar las que ya tienes y conectarlas entre si. 

Tienen un desarrollo uniforme y una experiencia de gestión automatizada a través de nubes privadas, públicas e híbridas. Las empresas optan por el cloud computing para aumentar su capacidad de ajuste y la disponibilidad de las aplicaciones.  Estos beneficios se consiguen con el aprovisionamiento de autoservicio y por solicitud de los recursos, así como con la automatización del ciclo de vida de la aplicación, desde el desarrollo hasta la producción. 

El desarrollo en la nube permite compilar y actualizar las aplicaciones rápidamente, mejorar la calidad y reducir los riesgos, es una forma de diseñar y ejecutar aplicaciones con tolerancia a los fallos y capacidad de respuesta y de ajuste en cualquier lugar, ya sea en nubes públicas, privadas o híbridas.



**¿Que se necesita para diseñar una aplicación en la nube?**

Tanto DevOps como los contenedores permiten que los desarrolladores comercialicen y actualicen las aplicaciones en forma de servicios agrupados sin conexión directa con mayor facilidad, como en el caso de los microservicios, en lugar de tener que esperar un gran lanzamiento.

Cada microservicio implementa una función empresarial concreta, se ejecuta en su propio proceso y se comunica a través de las interfaces de programación de aplicaciones (API) o de un sistema de mensajería. Esta comunicación se puede gestionar mediante una capa de malla de servicios.

No siempre es necesario comenzar con microservicios para acelerar la distribución de aplicaciones, se puede optimizar las aplicaciones heredadas por medio de una arquitectura pragmática y basada en servicios gracias a los flujos de trabajo DevOps, como la integración y la implementación contínuas (CI/CD), las operaciones de implementación totalmente automatizadas y los entornos de desarrollo estandarizados.





Páginas de interés:

https://docs.docker.com/get-started/

https://www.redhat.com/es/topics/containers/what-is-docker

https://www.redhat.com/es/topics/containers/what-is-kubernetes





## EJEMPLO EN LAS MONJAS

```bash
sudo docker image
git log (coger id commint)
git tag v.1.0.10.beta (mas churro del commint)
git push --tags
sudo ./build.sh 192.168.1.30:5555 teho-backend 1.0.1.10 (produccion) (si es desarrollo -beta)
cd sistemas/entornos-docker/
sudo docker stop teho-backend
sudo docker stop kernelsoa
```

(En desarrollo modificar el docker-compose.yaml y actualizar la versión

```bash
sudo docker-compose up -d teho_backend
sudo docker-compose up -d kernelsoa-alejandro-somosaguas
```

Para producción
Ir a pull request
meter develop en master
create pull request
Merge pull request
Confirmar



Code (tag) create realeases version ultima que corresponda con la beta 

create Ir action para ver cuando termina de generarse la imagen 

En producción:

```bash
sudo docker stop kernelsoa-*-* (por cada uno) 
sudo docker-compose up -d kernelsoa_*_* (por cada uno) 
sudo docker stop kernelsoa
```

Añadir:

```bash
git tag x.x.x-beta ( churro )
git tag x.x.x ( churro git log origin/master )
git push --tag
```

(Se generara la imagen automaticamente)

```bash
git log --online --graph --all
```

**Descargar Docker**

**En produccion:**

```bash
sudo docker pull 192.168.1.30:5555/teho-backend:latest
sudo docker stop teho-backend
sudo docker-compose up -d teho_backend
```



**En desarrollo:**

```bash
sudo docker pull 192.168.1.30:5555/teho-backend:x.x.x-beta
modificar docker compose y actualizar versión
sudo docker stop teho-backend
sudo docker-compose up -d teho_backend
```

