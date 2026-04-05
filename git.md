## PROTOCOLO GIT

Crear una cuenta de github

correo: estdiesai83@gmail.com

usuario: estdiesai83

contraseña: 172223Es@



**Git** es un sistema de control de versiones que gestiona cambios en archivos localmente.

Es un **control de versiones distribuido**, lo que significa que cada desarrollador tiene una copia completa del repositorio en su máquina local. Permite rastrear cambios, crear ramas para desarrollo paralelo, fusionar cambios, volver a una fase anterior si se decide revertir alguno de los cambios que se han hecho.

Esto es útil, por ejemplo, facilita la resolución de errores y la corrección de otros errores que puedan ocurrir durante el desarrollo. También se puede anotar los cambios en cada versión, para ayudar a cualquier miembro del equipo a mantenerse al día sobre lo que se ha completado y lo que aún queda por hacer.

**A diferencia de la mayoría de los otros sistemas de control de versiones (VCS), git almacena cada versión guardada como una "instantánea" en lugar de una lista de los cambios realizados en cada archivo**. Puede hacer referencia a antiguas instantáneas siempre que lo necesite y las nuevas instantáneas se crean cuando se modifica el proyecto.

![image-20250818125530423](/home/soa/.config/Typora/typora-user-images/image-20250818125530423.png)

Git también permite "empujar" y "tirar" de los cambios hacia y desde las instalaciones de otros ordenadores. Esto es lo que se conoce como "Sistema de control de versiones distribuido", y permite que varios desarrolladores trabajen en el mismo proyecto.

Sin embargo, hay algunos inconvenientes para manejar el desarrollo de esta manera. Como el software local, está instalado en su máquina individual, git no puede leer las ediciones que otros desarrolladores puedan estar haciendo en tiempo real.  Esto significa que si usted y un compañero de equipo están trabajando en un proyecto simultáneamente, no podrán ver el trabajo del otro.

Así que si no está complementamente seguro de cuándo los miembros del equipo trabajarán en su proyecto, git es mejor para el uso individual. 





**GitHub** es una plataforma web que utiliza un servidor Git para alojar repositorios remotos. Facilita la colaboración entre desarrolladores a través de características como:

- **Control de versiones:** Utiliza Git para el seguimiento de cambios en los archivos.
- **Colaboración:** Permite a varios desarrolladores trabajar en el mismo proyecto, con herramientas para gestionar conflictos y revisiones de código.
- **Gestión de proyectos:** Ofrece características como gestión de problemas, solicitudes de extracción (pull requests) y más.
- **Integración contínua (CI):** Algunas funciones CI/CD están integradas o se pueden integrar con GitHub.





**Git** es la herramienta para trabajar con versiones de código localmente. Es un software de código abierto

**GitHub** es la plataforma (servicio), propiedad de Microsoft que la usa y añade funcionalidades de colaboración, es decir facilita el trabajo colaborativo con repositorios Git en la nube. Es decir puede mantener repositorios de código en almacenamiento en la nube para que varios desarrolladores puedan trabajar en un solo proyecto y ver las ediciones de cada uno en tiempo real:

También incluye funciones de organización y gestión de proyectos. Puede asignar tareas a individuos o grupos, establecer permisos y roles para los colaboradores y usar la moderación de comentarios para mantener a todos en la tarea.

Además, los repositorios de GitHub están disponibles públicamente. Los desarrolladores de todo el mundo pueden interactuar y contribuir al código de los demás para modificarlo o mejorarlo, lo que se conoce como "codificación social". Esto hace que GitHub sea un sitio de redes para profesionales de la web.

Hay tres acciones principales que puede realizar cuando se trata de interactuar con el código de otros desarrolladores en GitHub:

- **Bifurcación**: El proceso de copiar el código de otra persona del repositorio para modificarlo.
- **Pull**: Cuando haya terminado de hacer cambios en el código de otra persona, puede compartirlos con el propietario original a través de una "solicitud pull".
- **Fusión:** Los propietarios pueden añadir nuevos cambios a sus proyectos a través de una fusión.



En resumen:

1. **git es un software de VCS local** que permite a los desarrolladores guardar instantáneas de sus proyectos a lo largo del tiempo. Generalmente es mejor para uso individual.
2. **GitHub es una plataforma basada en la web que incorpora las características de control de versiones de git** para que puedan ser utilizadas de forma colaborativa. También incluye características de gestión de proyectos y equipos, así como oportunidades para la creación de redes y la codificación social.



**Entendiendo GitHub vs GitLab**

GitHub no es el único repositorio git que puede considerar si está buscando colaborar en un proyecto de desarrollo. **GitLab** es otra plataforma muy similar que también vale la pena ver:

Al igual que GitHub, GitLab le permite almacenar código y usar las capacidades de control de versiones de git. Sin embargo, también proporciona permisos de usuario más matizados e incluye una integración contínua (CI) incorporada. Esto elimina la necesidad de las solicitudes de extracción utilizadas en GitHub.

Ambas plataformas son útiles, pero para situaciones ligeramente diferentes. Si no está interesado en trabajar con desarrolladores fuera de su equipo, GitLab puede ayudarte a acelerar un poco su flujo de trabajo. Sin embargo, GitHub puede ser la mejor ruta para aquellos que buscan crecer en sus carreras.



Las plataformas de código abierto git y WordPress son gratuitas de usar, modificar y distribuir.

Las características principales de GitHub son gratuitas para todos.



## **Términos con los que familiarizarse:**

1. **Repositorio (repository):** La ubicación del archivo donde se almacena su proyecto.
2. **Revisión ("revisión"):** una revisión es una versión determinada de la información que se gestiona. Hay sistemas que identifican las revisiones con un contador (Ej: subversión). Hay otros sistemas que identifican las revisiones mediante un código de detección de modificaciones (Ej: git usa SHA1).
3. **Etiqueta (tag):** Los tags permiten identificar de forma fácil revisiones importantes en el proyecto. Por ejemplo se suelen usar tags para identificar el contenido de las versiones publicadas del proyecto.
4. **Rama (branch):** La parte de su proyecto que está desarrollando activamente. Un conjunto de archivos puede ser ramificado o bifurcado en un punto en el tiempo de manera que, a partir de este momento, dos copias de esos archivos se pueden desarrollar a velocidades diferentes o en formas diferentes de forma independiente.
5. **Cambio (change)**: Un cambio ( o diff, o delta) representa una modificación específica de un documento bajo el control de versiones. 
6. **Desplegar (checkout):** Es crear una copia de trabajo local desde el repositorio. Un usuario puede especificar una revisión en concreto u obtener la última. El término 'checkout' también se puede utilizar como un sustantivo para describir la copia de trabajo.
7. **Confirmar (commit):** Confirmar es escribir o mezclar los cambios realizados en la copia de trabajo del repositorio. Los términos 'commit' y 'checkin' también se pueden utilizar como sustantivos para describir la nueva revisión que se crea como resultado de confirmar.
8. **Conflicto (conflict):** Un conflicto se produce cuando diferentes partes realizan cambios en el mismo documento, y es sistema es incapaz de conciliar los cambios. Un usuario debe resolver el conflicto mediante la integración de cambios, o mediante la selección de un cambio en favor del otro.
9. **Cabeza (head):** También se llama **tip (punta)** y se refiere a la última confirmación, ya sea en el tronco (trunk) o en una rama (branch). El tronco y cada rama tiene su propia cabeza, aunque HEAD se utiliza a veces líbremente para referirse al tronco.
10. **Tronco (trunk)**: La única línea de desarrollo que no es una rama ( a veces también llamada línea base, línea principal o **máster**).
11. **Comprometerse:** El comando utilizado para guardar los nuevos cambios en su proyecto en el repositorio.
12. **Escenario:** Antes de que puedas confirmar los cambios en Git, necesitas prepararlos, esto da la oportunidad de preparar el código antes de añadirlo formalmente a su proyecto.
13. **Fusionar, integrar, mezclar (merge)**: Una fusión o integración es una operación en la que se aplican dos tipos de cambios en un archivo o conjunto de archivos. Por ejemplo:
    1. Un usuario, trabajando en un conjunto de archivos, actualiza o sincroniza su copia de trabajo con los cambios realizados y confirmados, por otros usuarios, en el repositorio.
    2. Un usuario intenta confirmar archivos, que han sido actualizados por otros usuarios desde el último despliegue (checkout), y el software de control de versiones integra automáticamente los archivos ( por lo general, después de preguntarle al usuario si se debe proceder con la integración automática, y en algunos casos sólo se hace si la fusión puede ser clara)
    3. Un conjunto de archivos se bifurca, un problema que existía antes de la ramificación se trabaja en una nueva rama, y la solución se combina luego en la otra rama.
    4. Se crea una rama, el código de los archivos es independiente editado, y la rama actualizada se incorpora más tarde en un tronco unificado.



## Clasificación control de versiones:

Podemos clasificarlos atendiendo a la arquitectura utilizada para el almacenamiento del código:

- **Locales:**

  Los cambios son guardados localmente y no se comparten con nadie. Esta arquitectura es la antecesora de las dos siguientes:

  ![image-20250818120734845](/home/soa/.config/Typora/typora-user-images/image-20250818120734845.png)

- **Centralizados:**

  Existe un repositorio centralizado de todo el código, del cual es responsable un único usuario (o conjunto de ellos). Se facilitan las tareas administrativas a cambio de reducir flexibilidad, pues todas las decisiones fuertes (como crear una nueva rama) necesitan la aprobación del responsable. Algunos ejemplos son CVS y Subversión

  ![image-20250818121003108](/home/soa/.config/Typora/typora-user-images/image-20250818121003108.png)

- **Distribuidos:**

  Cada usuario tiene su propio repositorio. Los distintos repositorios pueden intercambiar y mezclar revisiones entre otros. Es frecuente el uso de un repositorio, que está normalmente disponible, que sirve de punto de sincronización de los distintos repositorios locales. Ejemplos: **Git** y Mercurial.

  ![image-20250818121209481](/home/soa/.config/Typora/typora-user-images/image-20250818121209481.png)

  Ventajas de sistemas distribuidos:

  - No es necesario estar conectado para guardar cambios.
  - Posibilidad de continuar trabajando si el repositorio remoto no está accesible.
  - El repositorio central está mas libre de ramas de pruebas.
  - Se necesitan menos recursos para el repositorio remoto.
  - Más flexibles al permitir gestionar cada repositorio personal como se quiera.



## 3 Estados de Git

Git tiene tres estados principales en los que se pueden encontrar tus archivos:

1. **Confirmado (commited):** Los datos están almacenados de manera segura en tu base de datos local.
2. **Modificado (modified):** El archivo se ha modificado pero todavía no se ha confirmado en la base de datos.
3. **Preparado (staged):** Se ha marcado un archivo modificado en su versión actual para que vaya en tu próxima confirmación.

Esto nos lleva a las tres secciones principales de un proyecto de Git:

- El directorio de Git (Git directory).
- El directorio de trabajo (working directory).
- Área de preparación (staging area). 

![image-20250818130410430](/home/soa/.config/Typora/typora-user-images/image-20250818130410430.png)



## Flujos de trabajo distribuidos con git

Existe más de una manera de gestionar los repositorios.

Flujo de trabajo centralizado

Existe un único repositorio o punto central que guarda el código y todo el mundo sincroniza su trabajo con él. Si dos desarrolladores clonan desde el punto central, y ambos hacen cambios,; tan solo el primero de ellos en enviar sus cambios de vuelta lo podrá hacer limpiamente. El segundo desarrollador deberá fusionar previamente su trabajo con el del primero, antes de enviarlo, para evitar sobreescribir los cambios del primero. 



## Como integrar git y GitHub (5 pasos)

Para poder usar git y GitHub juntos para el control de versiones y la colaboración:

1. Instalar git y añadir un repositorio.

   1. Descargar el software git para su Sistema Operativo.

   2. Ejecutar el instalador, este proceso variará dependiendo del sistema operativo que esté utilizando. Entonces puedes configurar git usando su interfaz de línea de comandos.

      Para saber la configuración:

      ```bash
       git config --list
      ```

      Mostrará algo como:

      ```
      $ git config --list
      user.name=John Doe
      user.email=johndoe@example.com
      color.status=auto
      color.branch=auto
      color.interactive=auto
      color.diff=auto
      ...
      ```

      En mi caso muestra:

      ```
      safe.directory=/home/soa/git/soa
      safe.directory=/var/www/html/kernelloa/
      safe.directory=/var/www/html/kernelloa/
      safe.directory=/var/www/html/kernelloa/
      safe.directory=/var/www/html/kernelloa
      safe.directory=/home/soa/sistemas/kernelsoa/
      safe.directory=/home/canvas/public_html
      user.email=estdiesai83@gmail.com
      user.name=estdiesai83
      user.mail=estdiesai83@gmail.com
      filter.lfs.required=true
      filter.lfs.clean=git-lfs clean -- %f
      filter.lfs.smudge=git-lfs smudge -- %f
      filter.lfs.process=git-lfs filter-process
      credential.helper=store
      credential.https://github.com.username=estdiesai83
      http.postbuffer=2048576000
      core.repositoryformatversion=0
      core.filemode=true
      core.bare=false
      core.logallrefupdates=true
      remote.origin.url=https://github.com/estdiesai83/API_RESTAURANTE.git
      remote.origin.fetch=+refs/heads/*:refs/remotes/origin/*
      ```

      Para configurar nuestra identidad:

      ```bash
      $ git config --global user.name "John Doe"
      $ git config --global user.email johndoe@example.com
      ```

   3. Para conectar git a GitHub, necesitaras añadir un repositorio y hacer al menos una confirmación.

      **Nuevo repositorio en un directorio existente**, entonces se crea un nuevo subdirectorio `.git` que contiene todo lo necesario (esqueleto del repositorio).

      ```bash
      $ cd /home/user/my_project
      $ git init
      ```

      **Clonar un repositorio existente**

      ```bash
      $ git clone https://github.com/libgit2/libgit2
      ```

      Se pueden utilizar diferentes protocolos para clonar un repositorio https:// o mediante ssh

   ```bash
      git clone https://github.com/estdiesai83/documentacion.git 
   git:// or user@server:path/to/repo.git
   ```

      Ej:

      ```bash
   git clone ssh://noe@77.230.94.186:20330/opt/git/uniquehome/uniquehome.git
      
      git clone git@github.com:Uniquehome/teho.git
      ```

2. Crear una cuenta GitHub

3. Añadir un repositorio GitHub a su cuenta

   Después de que haya creado y configurado su cuenta, necesitará crear un repositorio en GitHub donde pueda almacenar su proyecto cuando lo mueva desde git.

   Puede hacerlo haciendo clic en el enlace correspondiente de la barra lateral izquierda:

   ![image-20250813223908544](/home/soa/.config/Typora/typora-user-images/image-20250813223908544.png)

   Entonces, tendrá que elegir un nombre para su repositorio:

   ![image-20250813224003185](/home/soa/.config/Typora/typora-user-images/image-20250813224003185.png)

   Puede decidir si quiere que el repositorio sea público, para que otros usuarios de GitHub puedan encontrarlo y contribuir a él, o si quiere mantenerlo privado.

   De cualquier forma, ya que va a utilizar un proyecto existente, asegúrese de dejar la casilla **inicializar este repositorio con una casilla LÉAME desmarcada.**

4. Empujar un repositorio a GitHub.

   Hay varias maneras de añadir código a su repositorio:

   - Como ya esta configurado el repositorio git, se puede empujar un repositorio existente desde la línea de comandos.

     ![image-20250813224819920](/home/soa/.config/Typora/typora-user-images/image-20250813224819920.png)

     El icono de portapapeles a la derecha permite copiar los comando que se enumeran aquí, de modo que puede pegarlos rápidamente en su interfaz de línea de comandos preferida para crear su repositorio GitHub.

     Una vez hecho esto, actualice su página de GitHub.

     ![image-20250813225007184](/home/soa/.config/Typora/typora-user-images/image-20250813225007184.png)

     Ahora debería poder ver su repositorio en GitHub. A partir de ahí, puede empezar a hacer cambios en su proyecto en ñínea.

     También es posible enviar y fusionar solicitudes de extracción y utilizar cualquier otra herramienta incluida en su plan.

5. Retirar los cambios a git

   Aunque puede ver todos los cambios que usted y otros han hecho en su proyecto en GitHub, la plataforma no tiene acceso directo a los archivos de su ordenador. Para mantener su proyecto actualizado en su computadora, necesitare hacer sus ediciones a través de git.

   Para ello, simplemente introduzca `git pull origin mater` en su interfaz de línea de comandos. Esto debería actualizar su archivos para que todo esté sincronizado en todas la iteraciones de su proyecto.

 

Potencia tu sitio con el alojamiento Administrado de WordPress de Kinsta, diseñado para ofrecer velocidad, seguridad y simplicidad. Primer mes gratis.



### Crear repositorio: git init

```bash
git init nombre_repositorio
```

Crea un repositorio, se utiliza solo una vez durante la configuración inicial de un repositorio nuevo. 

Al ejecutar este comando, se creará:

-  Un nuevo subdirectorio `.git` en tu directorio de trabajo actual. 
- Una rama maestra (master o main)



### Clonar un repositorio: git clone

Si un repositorio ya se ha configurado en un repositorio central, el comando de clonación es la manera más común de obtener una copia de desarrollo local. 

Igual que `git init`, la clonación suele ser una operación única. Una vez que un desarrollador ha obtenido una copia de trabajo, todas las operaciones de control de versiones se administran por medio de su repositorio local.

El comando `git clone` se usa para crear una copia o clonar un repositorio remoto. Se utiliza `git clone` con la URL de un repositorio. 

Git es compatible con varios protocolos de red y sus formatos de URL correspondiente. Con el protocolo Git SSH la estructura de la URL sería:

```
git@HOSTNAME:USERNAME/REPONAME.git
```

Un ejemplo de una URL Git SSH sería el siguiente: `git@bitbucket.org:rhyolight/javascript-data-store.git`, donde los valores de la plantilla equivalen a:

- `HOSTNAME: bitbucket.org`
- `USERNAME: rhyolight`
- `REPONAME: javascript-data-store`

Al ejecutarlo, se extraerá la última versión de los archivos del repositorio remoto y se añadirá a una nueva carpeta. Esta carpeta nueva tendrá el mismo nombre que el repositorio (REPONAME), en este caso, `javascript-data-store`. La carpeta contendrá el historial completo del repositorio remoto y una rama master recién creada.



### Configuración de un repositorio: git config

Un repositorio de Git es un almacén virtual de tu proyecto. Permite guardar versiones del código a las que puedes acceder cuando lo necesites.

Una vez configurado el repositorio remoto, deberás añadir una URL de repositorio remoto a tu git config local y configurar una rama de nivel superior para tus ramas locales.

```bash
git remote add <remote_name> <remote_repo_url>
```

Este comando asignará el repositorio remoto en `<remote_repo_url>` a una referencia en tu repositorio local bajo `<remote_name>`. Una vez asignado el repositorio remoto, puedes enviar ramas locales ahí.

```
git push -u <remote_name> <local_branch_name>
```

Este comando enviará la rama del repositorio local `<local_branch_name>` al repositorio remoto `<remote_name>`.



Git almacena las opciones de configuración en tres archivos distintos, lo que te permite ajustar opciones para repositorios individuales (local), usuarios (global) o todo el sistema (sistema).

- **local**: `/.git/config`ajustes específicos del repositorio.
- **Global**: `~/.gitconfig` ajustes específicos del usuario. Aquí es donde se almacenan las opciones configuradas con la marca --global.
- **Sistema**: `$(prefix)/etc/gitconfig` ajustes de todo el sistema.

Cuando se producen conflictos entre las opciones de estos archivos, la configuración local sobreescribe la configuración del usuario, que a su vez, sobreescribe todo el sistema. Si abres alguno de estos archivos, podrás ver ejemplos como este:

```
[user] name = John Smith email = john@example.com 
[alias] st = status co = checkout br = branch up = rebase ci = commit 
[core] editor = vim
```



**Configurar username (nombre de usuario) o el email**

Define el nombre del autor que se va a usar en todas las confirmaciones del repositorio actual. Normalmente, será preferible utilizar el indicador --global para establecer las opciones de configuración del usuario actual.

```bash
git config --global user.name <name>
```

Añadir la opción `--local`, o no poner nada establecerá el user.name para el repositorio local actual.

Define el correo electrónico del autor que se va a usar en todas las confirmaciones del usuario actual.

```bash
git config --local user.email <email>
```



Crear un atajo de teclado para un comando Git, es una utilidad muy potente para crear atajos personalizados para comandos que uses con frecuencia. Ej:

```bash
git config --global alias.<alias_name> <git_comand>

git config --global alias.ci commit
```

De este modo se crea el comando `ci`, que puedes ejecutar como atajo para `git commit`



Definir el editor de texto que se utilizará con comandos como `git commit` para todos los usuarios en la máquina actual. 

```bash
git config --system core.editor <editor>
```

La opción `--system`configurará todo el sistema, lo que significa todos los usuarios y repositorios de una máquina.



Abrir el archivo de configuración global en un editor de texto para editarlo de manera manual. 

```bash
git config --global --edit
```



Todas las opciones de configuración se almacenan en archivos de texto sin formato. Generalmente, solo tendrás que configurar la instalación de Git la primera vez que empieces a trabajar con una máquina de desarrollo nueva, y en prácticamente todos los casos querrás usar la marca `--global`. Una excepción importante es cuando quieras invalidar la dirección de correo del autor. Es posible que desees usar tu dirección personal para repositorios personales y de código abierto y tu dirección de correo profesional para los repositorios relacionados con el trabajo.







### Añadir cambios: git add

Añade un cambio del directorio de trabajo en el entorno de ensayo. Indica a Git que quieres incluir actualizaciones en un archivo concreto en la próxima confirmación. Sin embargo `git add`no afecta al repositorio de manera significativa: los cambios no se registran hasta que no se ejecuta `git commit`.

Junto con estos comandos, también se necesitará `git status` para ver el estado del directorio de trabajo y el entorno de ensayo.

Para añadir todos los archivos con cambios y sin seguimiento al repositorio y se actualizará el árbol de trabajo.

```bash
git add --all
git add -A
```

El desarrollo de un proyecto gira en torno al patrón básico de edición/preparación/confirmación. Primero, editas tus archivos en el directorio de trabajo. Cuando lo tienes todo listo para guardar una copia del estado del proyecto, preparas los cambios con `git add`. Una vez satisfecho con la instantánea preparada, la confirmas en el historial del proyecto con `git commit`. El comando `git reset` se usa para deshacer una confirmación o una instantánea preparada.



- No todo el contenido de un directory se agrega automáticamente al repositorio, se debe indicar explícitamente qué archivos incluir, esto es muy útil en proyectos de software, para los cuales es natural querer administrar la evolución de los archivos fuente y en su lugar excluir los archivos de "construcción".
- No todos los cambios guardados en los archivos de un proyecto se incluyen automáticamente en el commit: qué incluir en los compromisos individuales debe indicarse explícitamente; esto es útil para incluir solo los cambios relevantes en el commit para reconstruir la evolución de un proyecto, tal vez excluyendo pruebas intermedias.
- El flujo de trabajo típico de Git gira en torno al estado actual de los archivos en el directorio del repositorio (nuevo, eliminado, modificado) y el momento en el que desea corregir un estado muy específico en el historial.



### git Workflow - GitFlow

Identifica y sugiere el uso de diferentes ramas y tipos de ramas en el proyecto:

- **main**: branch principal que almacena la history de lanzamientos oficiales (main).
- **develop**: un branch de integración.
- **feature:** los feature branch, que nacen y hacen merge en el branch de integración, reconocibles porque el nombre comienza por feature.
- **release:** nacen del branch de integración, sobre qué correcciones se pueden realizar y cuáles, una vez liberadas, se fusionan tanto en la rama principal como en la rama de integración; el nombre de esta rama inicia por release y contiene la versión de la versión que se está publicando.
- **hotfix:** estos branch surgen de la rama principal, contienen correcciones importantes individuales para versiones ya lanzadas, y que luego se fusionan tanto en la rama principal como en la rama de integración; los nombres de estas ramas comienzan con hotfix.

![image-20250814101106604](/home/soa/.config/Typora/typora-user-images/image-20250814101106604.png)

**GitFlow** es un excelente flujo de trabajo para aquellos proyectos de software basados en lanzamientos de versiones y ofrece un canal dedicado para lanzar revisiones. Por otro lado, requiere mucho esfuerzo en la gestión adecuada de nombres y el uso de branch. No en vano, a partir de la idea original, nacieron algunas extensiones para Git que ofrecen comandos dedicados para implementar los distintos pasos de este flujo.

Se debe considerar que GitFlow, de alguna manera, se limita a asegurarse de que el historial y los commits de su repositorio estén "en línea" con los lanzamientos y las distintas versiones. Por lo tanto, no entra en los méritos de cómo lanzar y distribuir una revisión, sino que solo permite implementar e identificar con precisión el commit que corresponde a una versión determinada.







### git status

El comando `git status` muestra el estado del directorio de trabajo y del área del entorno de ensayo. Permite ver los cambios que se han preparado, los que no y los archivos en los que Git no va a realizar el seguimiento.



### Crear una rama: git checkout

Para hacer una rama tendremos que estar en la rama "padre ( develop )"

`git checkout develop`



Para crear una rama :

​	``git checkout -b feature/nombre-rama`  ( crea una rama nueva y se posiciona en ella)

​	``git checkout -b fix/nombre-rama`  ( ramas de arreglos)



Para hacer commits dentro de la rama que hemos creado  :

`git commit -m ` "tipo: descripcion"  ( ver mas abajo los tipos de commits )

*<u>NO HACER GIT PUSH!!!!!</u>*



Para hacer un pull request tendremos que ir a GITHUB : 

ejemplo: https://docs.github.com/es/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request



### Comentarios: git commit

https://www.conventionalcommits.org/es/v1.0.0-beta.2/

Como mantenedor de proyectos de código abierto, cuando se incorporan ramas con nuevas características en `master` al escribir un mensaje de commit estandarizado, el mensaje del commit debe estar estructurado de la siguiente forma:

------

```bash
<tipo>[ámbito opcional]: <descripción>
[cuerpo opcional]
[nota de pie opcional]
```

Elementos estructurales para comunicar la intención al consumidor de la librería:

1. **fix:** un tipo de commit de tipo `fix` corrige un error en la base del código (se correlaciona con `PATCH` en el versionado semántico).
2. **feat:** un commit de tipo `feat`introduce nuevas características en la base del código (se correlaciona con MINOR en el versionado semántico).
3. **BREAKING CHANGE:** un commit que contiene el texto `BREAKING CHANGE:` al inicio de su cuerpo opcional o la sección de nota de pie introduce un cambio en el uso de la API (se correlaciona con MAJOR en el versionado semántico). Un cambio en el uso de la API puede ser parte de commit de tipo e.g a `fix:`, `feat:` & `chore:` todos tipos válidos, adicional a cualquier otro *tipo*.
4. Otros: *tipos* de commits distintos a `fix:` y `feat:` están permitidos, por ejemplo commitlint-config-conventional (basado en [the Angular convention](https://github.com/angular/angular/blob/22b96b9/CONTRIBUTING.md#-commit-message-guidelines)) recomienda `chore:`, `docs:`, `style:`, `refactor:`, `perf:`, `test:` y otros. También recomendamos `improvement` para commits que mejorar una implementación actual sin añadir nuevas características ni corregir errores. Tenga presente que estos tipos no son impuestos por la especificación de commits convencionales y no tienen efecto implícito en el versionado semántico (a menos que incluyan el texto BREAKING CHANGE, lo cual NO es recomendado). Se puede agregar un ámbito al *tipo* de commit para proveer información contextual adicional y se escribe entre paréntesis, e.g., `feat(parser): add ability to parse arrays`.



**Introducción:**

En el desarrollo de software, los errores en el código son introducidos con más frecuencia en las fronteras de la aplicación. Los tests unitarios funcionan muy bien para probar las interacciones que el mantenedor conoce, pero hacen un mal trabajo capturando la manera interesante, a veces inesperada, en que una comunidad usa una librería.

Cualquiera que haya actualizado una versión corregida de una dependencia para luego darse cuenta de que la aplicación empieza a arrojar un flujo de 500 errores, sabe lo importante que es un historial de commits legible (e [idealmente un bien mantenido CHANGELOG](http://keepachangelog.com/en/0.3.0/)) para el consiguiente proceso forense.

CHANGELOG = registro de cambios

La especificación de Commits Convencionales propone introducir una convención estandarizada y ligera sobre los mensajes de los commits. Esta convención encaja con [SemVer](http://semver.org/), pidiéndole a los desarrolladores de software describir en los mensajes de los commits, las características, correcciones y cambios que rompen el uso de la API que hagan.

Al introducir esta convención, creamos un lenguaje común que permite depurar más fácilmente los problemas a través de las fronteras de un proyecto.

**Especificación:**

Las palabras “DEBE” (“MUST”), “NO DEBE” (“MUST NOT”), “REQUIERE” (“REQUIRED”), “DEBERÁ” (“SHALL”), “NO DEBERÁ” (“SHALL NOT”), “DEBERÍA” (“SHOULD”), “NO DEBERÍA” (“SHOULD NOT”), “RECOMIENDA” (“RECOMMENDED”), “PUEDE” (“MAY”) Y “OPCIONAL” (“OPTIONAL”) en este documento se deben interpretar como se describe en [RFC 2119](https://www.ietf.org/rfc/rfc2119.txt).

1. Los commits DEBEN iniciarse con un tipo que consiste en un sustantivo `feat`, `fix`, etc., seguido de dos puntos y un espacio.
2. El tipo `feat` DEBE ser usado cuando un commit agrega una nueva característica a la aplicación o librería.
3. El tipo `fix` DEBE ser usado cuando el commit representa una corrección a un error en el código de la aplicación.
4. Se PUEDE añadir un ámbito opcional después del tipo. El ámbito es una frase que describe una sección de la base del código encerrada en paréntesis, e.g., `fix(parser):`
5. Una descripción DEBE ir inmediatamente después del tipo/ámbito inicial y es una descripción corta de los cambios realizados en el código, e.g., *fix: array parsing issue when multiple spaces were contained in string.*
6. Un cuerpo del commit más extenso PUEDE agregarse después de la descripción, dando información contextual adicional acerca de los cambios en el código. El cuerpo DEBE iniciar con una línea en blanco después de la descripción.
7. Una nota de pie PUEDE agregarse tras una línea en blanco después del cuerpo o después de la descripción en caso de que no se haya dado un cuerpo. La nota de pie DEBE contener referencias adicionales a los números de problemas registrados sobre el cambio del código (como el número de problema que corrige, e.g.,`Fixes #13`).
8. Los cambios que rompen la API DEBEN ser indicados al inicio de la nota de pie o el cuerpo del commit. Un cambio que rompe la API DEBE contener el texto en mayúsculas `BREAKING CHANGE`, seguido de dos puntos y espacio.
9. Una descripción se DEBE proveer después de `BREAKING CHANGE:`, describiendo qué ha cambiado en la API, e.g., *BREAKING CHANGE: environment variables now take precedence over config files.*
10. La nota de pie DEBE contener solamente el texto `BREAKING CHANGE`, vínculos externos, referencias a problemas u otra metainformación.
11. Otros tipos distintos a `feat` y `fix` PUEDEN ser usados en los mensajes de los commits.



**¿Por qué usar Commits Convencionales?**

- Generación automática de CHANGELOGs.
- Determinación automática de los cambios de versión (basado en los tipos de commits).
- Comunicar la naturaleza de los cambios a los demás integrantes del equipo, el público o cualquier otro interesado.
- Ejecutar procesos de ejecución y publicación.
- Hacer más fácil a otras personas contribuir al proyecto, permitiendo explorar una historia de los commits más estructurada.



**¿Qué es un registro de cambios (changelog)?**

Es un archivo que contiene una lista cronológicamente ordenada de los cambios más destacables para cada versión de un proyecto

**¿Por que mantener un changelog?**

Para facilitar a los usuarios y colaboradores ver exactamente qué cambios reseñables se han realizado en cada versión del proyecto.

**¿Quién necesita un changelog?**

Las personas, ya sean consumidores o desarrolladores, los usuarios finales de software son seres humanos a los que le importa lo que hay en el software. Cuando el software

**Ejemplos**:

**Mensaje de commit con descripción y cambio en el uso de la API en el cuerpo**

```
feat: allow provided config object to extend other configs

BREAKING CHANGE: `extends` key in config file is now used for extending other config files
```

**Mensaje de commit sin cuerpo**

```
docs: correct spelling of CHANGELOG
```

**Mensaje de commit con ámbito**

```
feat(lang): added polish language
```

**Mensaje de commit para una corrección usando un número de problema (opcional)**

```
fix: minor typos in code

see the issue for details on the typos fixed

fixes issue #12
```

####  

Imagina que **Git** es un sistema de mensajería para tu código. Tu computadora es el "Local" y el servidor (GitHub, GitLab, Bitbucket) es el "Remoto".

Aquí tienes cómo usarlos de forma sencilla:

### Git Pull (Traer cambios)

Se usa cuando quieres **descargar** las últimas novedades que tus compañeros (o tú mismo desde otra PC) han subido al servidor. Es como "actualizar" tu carpeta local.

- **Comando estándar:**

  ```
  git pull origin main
  ```

  *(Donde `origin` es el servidor y `main` es la rama principal).*

**¿Qué hace realmente?**

Es una combinación de dos pasos: descarga los archivos (`fetch`) y los intenta combinar automáticamente con los tuyos (`merge`).



### Git Push (Subir cambios)

Se usa cuando ya terminaste una tarea en tu PC, hiciste el `commit`, y quieres **enviar** esos cambios al servidor para que el resto del mundo los vea.

- **El flujo completo:**
  1. `git add .` (Preparas los archivos).
  2. `git commit -m "Descripción de lo que hiciste"`.
  3. **`git push origin main`** (Envías los cambios).



#### Diferencias Clave

| **Acción**    | **Comando** | **Dirección**              | **¿Cuándo usarlo?**                           |
| ------------- | ----------- | -------------------------- | --------------------------------------------- |
| **Descargar** | `git pull`  | Remoto $\rightarrow$ Local | Al empezar a trabajar para tener todo al día. |
| **Subir**     | `git push`  | Local $\rightarrow$ Remoto | Al terminar una funcionalidad o corrección.   |

------

#### Errores Comunes y Tips

#### El error de "Rejected" en el Push

Si intentas hacer `push` y Git te da un error, el 99% de las veces es porque alguien más subió cambios y tú no los tienes.

- **Solución:** Haz un `git pull` primero, resuelve conflictos si los hay, y luego intenta el `push` de nuevo.

#### El autocompletado en la terminal

Si te cansas de escribir el nombre de la rama, la primera vez que subas algo usa:

Bash

```
git push -u origin main
```

El parámetro `-u` vincula tu rama local con la remota. De ahí en adelante, solo tendrás que escribir `git push` o `git pull` a secas y Git ya sabrá a dónde ir.

#### ¿Qué pasa si hay conflictos?

Si tú tocaste la línea 10 de un archivo y un compañero también, al hacer `pull`, Git se detendrá y te preguntará: *"¿Con qué versión me quedo?"*. Tendrás que editar el archivo, elegir la opción correcta y hacer un nuevo commit.



**Pull Request (PR)** es pedir permiso para que ese trabajo se fusione con el proyecto principal.

Es una herramienta visual (disponible en GitHub, GitLab o Bitbucket) para que otros programadores revisen tu código antes de que se convierta en parte oficial de la aplicación.

------

### ¿Cómo funciona el flujo de un PR?

1. **Tú trabajas en una rama aparte:** Nunca trabajas directamente en `main` o `master`. Creas una rama llamada, por ejemplo, `feature-login`.
2. **Haces Push:** Subes esa rama al servidor (`git push origin feature-login`).
3. **Abres el Pull Request:** En la web de GitHub, verás un botón que dice **"Compare & pull request"**. Al pulsarlo, estás diciendo: *"Hey, equipo, quiero que mis cambios de la rama `feature-login` se pasen a la rama `main`"*.
4. **Revisión (Code Review):** Tus compañeros ven tus cambios, pueden dejar comentarios en líneas específicas, pedirte correcciones o darte un "Approve".
5. **Merge:** Una vez que todo está bien, se pulsa el botón de **Merge** y tu código finalmente se une al proyecto principal.

------

### ¿Por qué es tan importante?

- **Evita desastres:** Si cometiste un error o dejaste una contraseña a la vista, alguien lo notará antes de que llegue a producción.
- **Aprendizaje:** Es el mejor momento para aprender de tus compañeros (y ellos de ti).
- **Historial:** Queda un registro de **por qué** se hizo cada cambio, no solo qué se cambió.

### Diferencia entre Pull y Pull Request

Mucha gente se confunde por el nombre:

- **`git pull`**: Es un **comando técnico** para bajar cambios a tu PC.
- **Pull Request**: Es un **proceso social y administrativo** en la web para proponer cambios.

> **Dato curioso:** En GitLab no se llaman Pull Requests, se llaman **Merge Requests (MR)**, pero son exactamente lo mismo.



En el flujo de trabajo estándar de Git, `git push` está diseñado para enviar tus cambios desde tu repositorio local hacia un **repositorio remoto** (como GitHub, GitLab o un servidor propio). Sin embargo, hay un par de matices técnicos interesantes que podrían encajar con lo que buscas:

------

### 1. El concepto de "Remote" en la misma máquina

Puedes configurar una carpeta de tu propia computadora para que actúe como si fuera un servidor remoto. Esto es útil para hacer respaldos en un disco duro externo o para practicar comandos de red sin internet.

Para hacerlo, necesitarías crear un repositorio **"bare"** (un repositorio sin archivos de trabajo, solo la base de datos de Git):

1. **Crear el "falso remoto":**

   `git init --bare /ruta/al/repo-remoto.git`

2. **Vincular tu proyecto actual:**

   `git remote add local-test /ruta/al/repo-remoto.git`

3. **Hacer el push:**

   `git push local-test main`

En este caso, técnicamente estás haciendo un `push` dentro de tu misma máquina, pero Git sigue tratando la carpeta de destino como un ente externo.

------

### 2. ¿Qué comando deberías usar si solo quieres guardar cambios?

Si tu intención es simplemente "guardar" lo que has hecho para que el historial lo registre (sin enviarlo a ningún servidor), el comando que buscas es:

- **`git commit`**: Este es el comando que "guarda" tus cambios localmente. Crea una captura de tu código en ese instante dentro de tu propia base de datos de Git.

------

### Resumen de diferencias

| **Acción**                  | **Comando**  | **¿Afecta a otros?**                      |
| --------------------------- | ------------ | ----------------------------------------- |
| **Preparar** cambios        | `git add`    | No, solo marca archivos.                  |
| **Guardar** localmente      | `git commit` | No, solo vive en tu PC.                   |
| **Sincronizar** al servidor | `git push`   | **Sí**, los demás pueden ver tus cambios. |

**En conclusión:** No puedes hacer un `push` a "la nada" o al mismo repositorio donde estás parado. El `push` siempre requiere un destino. Si no tienes un servidor configurado, con hacer `git commit` es más que suficiente para mantener tu trabajo a salvo localmente.



Configurar un repositorio remoto es el paso clave para colaborar con otros o simplemente para tener un respaldo de tu código en la nube (GitHub, GitLab, Bitbucket).

Aquí tienes la guía paso a paso para conectarlo:

------

### 1. Crear el repositorio en el servidor

Primero, ve a tu plataforma favorita (ej. GitHub) y crea un nuevo repositorio. Al finalizar, la página te dará una **URL**, que se ve algo así:

- `https://github.com/usuario/proyecto.git`

### 2. Vincular el remoto a tu carpeta local

Abre la terminal dentro de tu proyecto y usa el comando `remote add`. Por convención, al remoto principal se le llama **origin**.

Bash

```
git remote add origin https://github.com/usuario/proyecto.git
```

### 3. Verificar la configuración

Para asegurarte de que Git sabe a dónde enviar los archivos, ejecuta:

Bash

```
git remote -v
```

Deberías ver dos líneas (una para `fetch` y otra para `push`) con la URL que acabas de pegar.

------

### 4. Subir tus cambios por primera vez

Si ya tienes "commits" en tu máquina, usa este comando para empujarlos al servidor. El parámetro `-u` vincula tu rama local con la remota para que en el futuro solo tengas que escribir `git push`.

Bash

```
git push -u origin main
```

*(Nota: Si tu rama principal todavía se llama `master`, cambia `main` por `master`)*.

------

### Comandos útiles de gestión

Si te equivocas en la URL o necesitas cambiar de servidor, estos comandos te salvarán:

- **Cambiar la URL de un remoto existente:** `git remote set-url origin https://nueva-url.com/repo.git`
- **Renombrar un remoto:** `git remote rename origin publico`
- **Eliminar el vínculo remoto:** `git remote remove origin`





### Ejemplo práctico de clonar un repositorio y añadir cambios a una rama creada. 

Una de las fortalezas de Git es su soporte para el desarrollo de proyectos distribuidos, Git ofrece varias posibilidades para administrar el **desarrollo colaborativo**.

Vamos a intentar presentar el caso de un [desarrollador web](https://aulab.es/noticia/132/quien-es-el-full-stack-developer) que quiere hacer su contribución a un proyecto compartido que ya comenzó, analizando aquí también los comandos principales.

- recuperar el repository alojado en un un server remoto

  ```
  $ git clone https://example.com/project.git
  Cloning into 'project'...
  remote: Enumerating objects: 19, done.
  remote: Counting objects: 100% (19/19), done.
  remote: Compressing objects: 100% (14/14), done.
  remote: Total 19 (delta 3), reused 16 (delta 3), pack-reused 0
  Receiving objects: 100% (19/19), 112.25 KiB | 281.00 KiB/s, done.
  Resolving deltas: 100% (3/3), done.
  ```

- entrar en la directory project creada por el paso anterior

  ```
  cd project
  ```

- crear un 

  branch

  ```
  git branch my-contribution
  ```

- pasar branch apenas creado

  ```
  $ git checkout my-contribution
  Switched to branch 'my-contribution'
  ```

- realizar cambios en los archivos existentes, o agregar un archivo, y ejecutar el commit, como se ha hecho en la sección anterior

- verificar la fuente actual “remota” del repository

  ```
  $ git remote --verbose
  origin  https://example.com/project.git (fetch)
  origin  https://example.com/project.git (push)
  ```

- enviar tus cambios a un branch del repository remoto

  ```
  git push origin my-contribution
  ```

¡Felicitaciones, has creado tu primera contribución (aunque aún no en la línea "principal" del proyecto) a un proyecto remoto!





**PROTOCOLO COMMITS:**  (En las monjas lo hacíamos así:)

**feat:**  introduce una nueva funcionalidad en la base del código

**fix:**  corrige un error en la base del código

**BREAKING CHANGE:** introduce un cambio de ruptura de API 

**docs:**  solo para comentarios

**style:**  solo para estilizar el "codigo"  ejemplo , faltan puntos y coma, etc.; no hay cambio de código de producción

**refactor**  refactorización del código de producción, por ejemplo, cambio de nombre de una variable (que no afecte al funcionamiento)

​	

# GitHub y GitLab

- **GitHub:** Es la "red social" de los programadores. Es el estándar de la industria para el **código abierto (Open Source)**. Si quieres que el mundo vea tu proyecto o quieres colaborar en librerías famosas, GitHub es el lugar.
- **GitLab:** Es una plataforma **"todo en uno"**. Su enfoque es corporativo y de DevOps. No solo aloja código, sino que está diseñado para gestionar todo el proceso desde la planificación (estilo Jira) hasta el despliegue, sin salir de la misma web.



## Tabla Comparativa

| **Característica** | **GitHub**                              | **GitLab**                                                   |
| ------------------ | --------------------------------------- | ------------------------------------------------------------ |
| **Propiedad**      | Microsoft                               | Independiente (GitLab Inc.)                                  |
| **CI/CD**          | GitHub Actions (muy potente y popular). | CI/CD nativo (considerado el más robusto del mercado).       |
| **Instalación**    | Principalmente en la nube (SaaS).       | Permite **Self-Hosting** (instalarlo en tu propio servidor gratis). |
| **Comunidad**      | La más grande del mundo.                | Más pequeña, enfocada a empresas.                            |
| **Nomenclatura**   | Usa **Pull Requests**.                  | Usa **Merge Requests**.                                      |

------

## ¿Cuándo elegir cada uno?

### **Elige GitHub si:**

- Estás creando un portafolio personal.
- Quieres contribuir a proyectos de código abierto.
- Buscas la mayor integración posible con herramientas de terceros (VS Code, Azure, Slack, etc.).
- Prefieres una interfaz más limpia y centrada en el código.

### **Elige GitLab si:**

- Eres una empresa que necesita control total (puedes instalarlo en tus propios servidores por seguridad).
- Quieres tener **Tableros Kanban**, registro de errores, Wiki y despliegue automatizado en un solo sitio.
- Necesitas configuraciones de DevOps muy complejas y personalizadas.
- Buscas una alternativa de código abierto (GitLab tiene una versión Community Edition gratuita).



**Una diferencia técnica clave: El Merge**

- **GitHub** tiende a favorecer un historial de commits más "sucio" o real, aunque permite hacer *squash*.
- **GitLab** pone mucho énfasis en que el historial sea impecable y ofrece herramientas más granulares para decidir cómo se fusionan las ramas.

En resumen: **GitHub es donde el código vive, GitLab es donde el código se trabaja y se despliega.**



https://aulasoftwarelibre.github.io/taller-de-git/cvs/#terminologia

https://kinsta.com/es/base-de-conocimiento/git-vs-github/

​	



# RESUMEN

Iniciar un proyecto en Git es un proceso sencillo, pero depende de si estás empezando desde cero en tu computadora o si quieres bajar un proyecto que ya existe en internet (como GitHub).

Aquí tienes las dos rutas principales:

### Escenario A: Empezar un proyecto desde cero (Local)

Usa este método si ya tienes una carpeta con código en tu PC o si vas a crear una nueva ahora mismo.

1. **Crea o entra en tu carpeta:**

   ```bash
   mkdir mi-proyecto
   cd mi-proyecto
   ```

2. **Inicializa Git:** Este comando crea una carpeta oculta llamada `.git` donde se guardará todo el historial.

   ```bash
   git init
   ```

3. **Crea tu primer archivo y guárdalo:**

   ```bash
   echo "# Mi Proyecto" > README.md
   git add README.md
   git commit -m "Primer commit: inicio del proyecto"
   ```

------

### Escenario B: Clonar un proyecto existente (Remoto)

Usa este método si el proyecto ya está en GitHub, GitLab o Bitbucket y quieres una copia exacta en tu computadora.

1. **Copia la URL del repositorio** (la que termina en `.git`).

2. **Ejecuta el comando clone:**

   ```bash
   git clone https://github.com/usuario/repositorio.git
   ```

   *Esto creará automáticamente una carpeta con el nombre del proyecto, inicializará Git y descargará todos los archivos.*

### El siguiente paso: Conectar tu proyecto local con GitHub

Si usaste el **Escenario A**, tu proyecto solo vive en tu PC. Para subirlo a la nube:

1. Crea un repositorio **vacío** en la web de GitHub.

2. Copia la URL que te dan y pégala en tu terminal:

   ```bash
   git remote add origin https://github.com/tu-usuario/tu-repo.git
   ```

3. Sube tus archivos por primera vez:

   ```bash
   git push -u origin main
   ```

------

### Tip Pro: El archivo `.gitignore`

Antes de hacer tu primer `git add .`, es vital crear un archivo llamado `.gitignore`.

Dentro de este archivo escribes qué cosas **no** quieres que Git rastree (como contraseñas, carpetas pesadas de dependencias como `vendor/` o `node_modules/`, o archivos de configuración de tu editor).

**¿Cuál de los dos caminos vas a tomar?** Si es para un proyecto de **Symfony**, recuerda que al usar el comando `symfony new` el proyecto ya suele venir con el `git init` hecho por ti.

## 1. El Ciclo de Vida del Código (Local)

Antes de subir nada a la nube, debes gestionar tus cambios en tu computadora. Este es el "triángulo" que repetirás mil veces:

1. **`git status`**: El comando más importante. Te dice qué archivos has modificado y qué falta por guardar.
2. **`git add <archivo>`**: Prepara tus cambios (los pone en el *Staging Area*). Si quieres preparar todo: `git add .`.
3. **`git commit -m "mensaje"`**: Crea una "foto" permanente de tus cambios con una descripción.

------

## 2. Ramas (Branches): Trabajar sin romper nada

Nunca trabajes directamente en la rama `main` o `master`. Crea una rama para cada nueva funcionalidad.

- **`git branch <nombre>`**: Crea una nueva rama.
- **`git checkout <nombre>`**: Salta a esa rama. (En versiones nuevas: `git switch <nombre>`).
- **`git merge <nombre>`**: Une los cambios de una rama con la que tienes activa.

------

## 3. GitHub: Colaboración y Respaldo

GitHub es donde vive tu código de forma remota. Estos son los conceptos clave:

- **`git push origin <rama>`**: Sube tus commits locales al servidor.
- **`git pull origin <rama>`**: Trae los cambios que otros han subido y los mezcla con los tuyos.
- **`git clone <url>`**: Descarga un proyecto completo de GitHub a tu PC por primera vez.

------

## 4. Las Herramientas "Sociales" de GitHub

Esto es lo que diferencia a un programador novato de uno profesional:

| **Herramienta**       | **¿Para qué sirve?**                                         |
| --------------------- | ------------------------------------------------------------ |
| **Fork**              | Crea una copia exacta de un repositorio ajeno en tu propia cuenta para que puedas experimentar. |
| **Pull Request (PR)** | Propones tus cambios al dueño del proyecto original para que los revise y los acepte. |
| **Issues**            | Un tablero de tareas para reportar errores o sugerir mejoras en el proyecto. |
| **GitHub Actions**    | Automatiza tareas (ej: pasar tests cada vez que subes código). |

------

## 5. Buenas Prácticas (Pro-Tips)

1. **Commits pequeños y frecuentes:** Es mejor hacer 10 commits pequeños que uno gigante que toque 20 archivos.
2. **Mensajes claros:** Evita mensajes como "cambios", "fix" o "asdfg". Usa algo descriptivo: `"Fix: corregir error de validación en el login"`.
3. **El archivo `.gitignore`:** Es vital. Ahí escribes los nombres de carpetas que **no** quieres subir a GitHub (como `vendor/`, `node_modules/` o archivos `.env` con contraseñas).
4. **README.md:** Un buen proyecto en GitHub siempre tiene un README que explica qué hace el código y cómo instalarlo.

------

### Resumen de comandos para "emergencias"

- **¿Hice un desastre y quiero volver atrás?** `git restore <archivo>` (borra cambios no guardados).
- **¿A quién le pertenece esta línea de código?** `git blame <archivo>` (te dice quién hizo cada línea).
- **¿Qué cambió exactamente?** `git diff` (muestra las líneas añadidas en verde y borradas en rojo).