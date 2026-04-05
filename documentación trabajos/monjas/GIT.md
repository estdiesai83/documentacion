[TOC]

# GIT

### Configuración de un repositorio

Un [repositorio de Git](https://bitbucket.org/product/es/code-repository) es un almacenamiento virtual de tu proyecto. Te permite guardar versiones del código a las que puedes acceder cuando lo necesites.

#### git init

Para crear un nuevo repositorio. Es un comando que se utiliza una sola vez durante la configuración inicial de un repositorio nuevo. Al ejecutar este comando, se creará un nuevo subdirectorio `.git` en tu directorio de trabajo actual. También se creará una nueva rama maestra.

###### Versión de un proyecto existente con un repositorio de Git nuevo

En este ejemplo, suponemos que ya cuentas con una carpeta de proyecto en la que quieres crear un repositorio. Primero deberás establecer el directorio de la carpeta raíz del proyecto con el comando `cd` y luego ejecutar `git init`.

```
 cd /path/to/your/existing/code git init
```

Apuntar `git init` a un directorio de proyecto existente hará que se ejecute la misma configuración de inicio mencionada arriba, pero en el ámbito de ese directorio.

###### Clonación de un repositorio existente: git clone

Si un repositorio ya se ha configurado en un repositorio central, el comando de clonación es la manera más común de obtener una copia de desarrollo local. Igual que `git init`, la clonación suele ser una operación única. Una vez que un desarrollador ha obtenido una copia de trabajo, todas las operaciones de [control de versiones](https://bitbucket.org/product/es/version-control-software) se administran por medio de su repositorio local.

```
 git clone 
```

El comando `git clone` se usa para crear una copia o clonar un repositorio remoto. Se utiliza `git clone` con la URL de un repositorio. Git es compatible con varios protocolos de red y sus formatos de URL correspondientes. En este ejemplo, usaremos el protocolo Git SSH. Las URL Git SSH siguen la siguiente estructura: `git@HOSTNAME:USERNAME/REPONAME.git`.

Un ejemplo de una URL Git SSH sería el siguiente: `git@bitbucket.org:rhyolight/javascript-data-store.git`, donde los valores de la plantilla equivalen a:

- `HOSTNAME: bitbucket.org`
- `USERNAME: rhyolight`
- `REPONAME: javascript-data-store`

Al ejecutarlo, se extraerá la última versión de los archivos del repositorio remoto y se añadirá a una nueva carpeta. Esta carpeta nueva tendrá el mismo nombre que el repositorio (REPONAME), en este caso, `javascript-data-store`. La carpeta contendrá el historial completo del repositorio remoto y una rama master recién creada.

#### git Workflow

#### git status

El comando `git status` muestra el estado del directorio de trabajo y del área del entorno de ensayo. Permite ver los cambios que se han preparado, los que no y los archivos en los que Git no va a realizar el seguimiento. El resultado del estado *no* muestra ninguna información relativa al historial del proyecto. Para ello, debes usar [`git log`](https://www.atlassian.com/git/tutorials/inspecting-a-repository/git-log).

Enumera los archivos que se han preparado, los que están sin preparar y los archivos sin seguimiento.

Muestra lo que ha ocurrido con los comandos `git add` y `git commit`. Los mensajes de estado también incluyen información importante para preparar archivos/deshacer su preparación. 

##### Ignorar archivos

Los archivos sin seguimiento se suelen dividir en dos categorías. Pueden ser archivos que se acaban de añadir al proyecto y que no se han confirmado aún o binarios compilados como `.pyc`, `.obj`, `.exe`, etc. Mientras que resulta muy conveniente incluir lo primero en el resultado de `git status`, lo segundo puede limitar las posibilidades de ver lo que ocurre en realidad en tu repositorio.

Por este motivo, Git te permite ignorar completamente los archivos mediante la colocación de las rutas en un archivo especial denominado [`.gitignore`](https://www.atlassian.com/git/tutorials/gitignore). Los archivos que desees ignorar se deben incluir en una línea aparte y puedes usar el símbolo * como carácter comodín.

##### Ejemplo

Es recomendable comprobar el estado del repositorio antes de confirmar los cambios, para evitar confirmar por error algo que no querías. En este ejemplo se muestra el estado del repositorio antes y después de la preparación y confirmación de una instantánea:

\# Edit hello.py git status # hello.py is listed under "Changes not staged for commit" git add hello.py git status # hello.py is listed under "Changes to be committed" git commit git status # nothing to commit (working directory clean)

El primer resultado del estado mostrará el archivo sin preparar. La acción `git add` se reflejará en el segundo `git status` y el resultado del estado final indicará que no hay nada que confirmar (el directorio de trabajo coincide con la mayoría de las confirmaciones recientes). Algunos comandos de Git (p.ej., [`git merge`](https://www.atlassian.com/git/tutorials/using-branches/git-merge)) requieren que el directorio de trabajo esté limpio para que no se sobrescriban los cambios sin querer.

#### git add

El comando `git add` añade un cambio del directorio de trabajo en el entorno de ensayo. Indica a Git que quieres incluir actualizaciones en un archivo concreto en la próxima confirmación. Sin embargo, `git add` no afecta al repositorio de manera significativa: en realidad, los cambios no se registran hasta que ejecutas `git commit`.

Junto con estos comandos, también necesitarás `git status` para ver el estado del directorio de trabajo y el entorno de ensayo.

El comando `git add` se suele usar con la opción `--all`. Al ejecutar `git add --all`, se añadirán todos los archivos con cambios y sin seguimiento al repositorio y se actualizará el árbol de trabajo.

##### Funcionamiento

Los comandos `git add` y `git commit` componen el flujo de trabajo fundamental de Git. Estos son los dos comandos que todos los usuarios de Git deben conocer, con independencia del modelo de colaboración de su equipo. Constituyen el medio para registrar las versiones de un proyecto en el historial del repositorio.

El desarrollo de un proyecto gira en torno al patrón básico de edición/preparación/confirmación. Primero, editas tus archivos en el directorio de trabajo. Cuando lo tienes todo listo para guardar una copia del estado del proyecto, preparas los cambios con `git add`. Una vez satisfecho con la instantánea preparada, la confirmas en el historial del proyecto con `git commit`. El comando `git reset` se usa para deshacer una confirmación o una instantánea preparada.

Además de `git add` y `git commit`, resulta esencial un tercer comando (`git push`) para lograr un flujo de trabajo colaborativo completo de Git. El comando `git push` se emplea para enviar los cambios confirmados a repositorios remotos para colaborar. Esto permite a otros miembros del equipo acceder a un conjunto de cambios guardados.

![Git Tutorial: git add Snapshot](https://wac-cdn.atlassian.com/dam/jcr:0f27e004-f2f5-4890-921d-65fa77ba2774/01.svg?cdnVersion=1278)

El comando `git add` no debe confundirse con `svn add`, que añade un archivo al repositorio. En su lugar, `git add` actúa en el nivel más abstracto de los cambios. Esto significa que `git add` debe llamarse cada vez que se modifica un archivo, mientras que `svn add` solo tiene que llamarse una vez por cada archivo. Puede parecer redundante, pero este flujo de trabajo facilita en gran medida la organización de los proyectos.

##### Entorno de ensayo

La función principal del comando `git add` consiste en pasar los cambios pendientes del directorio de trabajo al área de `git staging`. El entorno de ensayo es una de las características más exclusivas de Git, y puede llevar un tiempo entenderlo si vienes de un entorno de SVN (o incluso Mercurial). Resulta útil pensar en él como un intermediario entre el directorio de trabajo y el historial del proyecto. El entorno de ensayo se considera como uno de los [“tres árboles” de Git](https://www.atlassian.com/es/git/tutorials/undoing-changes/git-reset), junto con el directorio de trabajo y el historial de confirmaciones.

En lugar de confirmar todos los cambios realizados desde la última confirmación, el entorno de ensayo te permite agrupar los cambios relacionados en instantáneas con un enfoque muy claro antes de confirmarlos en el historial del proyecto. De este modo, puedes hacer todo tipo de cambios en archivos sin relación, volver atrás y dividirlos en confirmaciones lógicas mediante la adición de cambios relacionados en el entorno de ensayo, y confirmarlos de manera fraccionada. Como en cualquier sistema de control de revisiones, es fundamental crear confirmaciones atómicas para que resulte sencillo localizar los errores y revertir los cambios minimizando el impacto en el resto del proyecto.

##### Opciones comunes

```
git add 
```

Prepara todos los cambios de `` para la siguiente confirmación.

```
git add 
```

Prepara todos los cambios de `` para la siguiente confirmación.

```
git add -p
```

Inicia una sesión de entorno de ensayo interactiva que te permite elegir las partes de un archivo que quieres añadir a la siguiente confirmación. Se te presentarán una serie de cambios y se te solicitará un comando. Utiliza `y` para preparar el conjunto, `n` para ignorarlo, `s` para dividirlo en conjuntos más pequeños, `e` para editarlo manualmente y `q` para salir.

###### Ejemplos

Al comenzar un nuevo proyecto, `git add` desempeña la misma función que `svn import`. Para crear una confirmación inicial del directorio actual, usa los siguientes dos comandos:

```
git add . git commit
```

Una vez que tengas tu proyecto en marcha, puedes añadir nuevos archivos pasando la ruta a `git add`:

```
git add hello.py git commit
```

Los comandos anteriores también pueden usarse para registrar los cambios en los archivos existentes. Una vez más, Git no distingue entre los cambios del entorno de ensayo en los nuevos archivos y los cambios de los archivos que ya se han añadido al repositorio.

##### Resumen

En la revisión, `git add` es el primer comando de una cadena de operaciones que ordena a Git que “guarde” una instantánea del estado del proyecto en el historial de confirmaciones. Al usarse por sí solo, `git add` pasará los cambios pendientes del directorio de trabajo al entorno de ensayo. El comando `git status` se emplea para examinar el estado del repositorio y permite confirmar una promoción de `git add`. El comando `git reset` se utiliza para deshacer la acción de `git add`. El comando `git commit` se usa para confirmar una instantánea del directorio del entorno de ensayo en el historial de confirmaciones de los repositorios.

#### git diff

La comparación es una función mediante la cual se toman dos conjuntos de datos de entrada y se muestran los cambios entre estos. `git diff` es un comando multiusos de Git que, cuando se ejecuta, lleva a cabo una función para establecer las diferencias en las fuentes de datos de Git. Dichas fuentes de datos pueden ser confirmaciones, ramas y archivos, entre otras posibilidades.

La comparación es una función mediante la cual se toman dos conjuntos de datos de entrada y se muestran los cambios entre estos. `git diff` es un comando multiusos de Git que, cuando se ejecuta, lleva a cabo una función para establecer las diferencias en las fuentes de datos de Git. Dichas fuentes de datos pueden ser confirmaciones, ramas y archivos, entre otras posibilidades.

##### Leer diferencias: resultados

###### Formato de salida sin procesar

Los siguientes ejemplos se ejecutarán en un solo repositorio, que se crea con los comandos indicados a continuación:

```
 $:> mkdir diff_test_repo $:> cd diff_test_repo $:> touch diff_test.txt $:> echo "this is a git diff test example" > diff_test.txt $:> git init . Initialized empty Git repository in /Users/kev/code/test/.git/ $:> git add diff_test.txt $:> git commit -am"add diff test file" [master (root-commit) 6f77fc3] add diff test file 1 file changed, 1 insertion(+) create mode 100644 diff_test.txt
```

Si ejecutamos `git diff` llegados a este punto, no habrá ningún resultado. Este es el comportamiento previsto, ya que no hay ningún cambio en el repositorio que permite mostrar las diferencias. Cuando se haya creado el repositorio y hayamos añadido el archivo `diff_test.txt`, podremos cambiar el contenido del archivo para empezar a experimentar con el resultado de la diferencia.

```
 $:> echo "this is a diff example" > diff_test.txt
```

Si ejecutas este comando, cambiarás el contenido del archivo `diff_test.txt`. Cuando se haya modificado, podremos ver una diferencia y analizar el resultado. Ahora, al ejecutar `git diff`, se producirá el resultado siguiente:

```
 diff --git a/diff_test.txt b/diff_test.txt index 6b0c6cf..b37e70a 100644 --- a/diff_test.txt +++ b/diff_test.txt @@ -1 +1 @@ -this is a git diff test example +this is a diff example
```

Pasemos ahora a examinar un desglose más detallado del resultado de la diferencia.

###### 1. Introducción de la comparación

```
 diff --git a/diff_test.txt b/diff_test.txt
```

En esta línea se muestran las fuentes de entrada de la diferencia. Podemos observar que se ha utilizado `a/diff_test.txt` y `b/diff_test.txt` en la diferencia.

###### 2. Metadatos

```
 index 6b0c6cf..b37e70a 100644
```

En esta línea se muestran unos cuantos metadatos internos de Git. Lo más probable es que no necesites esta información. Los números de este resultado se corresponden con los identificadores hash de la versión del objeto de Git.

###### 3. Marcadores de los cambios

```
 --- a/diff_test.txt +++ b/diff_test.txt
```

Estas líneas conforman una leyenda que asigna símbolos a cada fuente de entrada de la diferencia. En este caso, los cambios de `a/diff_test.txt` se marcan con un `---` y, los de `b/diff_test.txt`, con el símbolo `+++`.

###### 4. Fragmentos de la diferencia

El producto restante de la diferencia es una lista de "fragmentos" de la diferencia. Una diferencia solo muestra las secciones del archivo con cambios. En el ejemplo en cuestión, solo hay un fragmento porque estamos trabajando con un caso sencillo. Los fragmentos poseen su propia semántica pormenorizada del resultado.

```
 @@ -1 +1 @@ -this is a git diff test example +this is a diff example
```

La primera línea es el encabezado del fragmento. Cada fragmento comienza con un encabezado delimitado por símbolos `@@`. El contenido de dicho encabezado es un resumen de los cambios efectuados en el archivo. En nuestro ejemplo simplificado pone "-1 +1", lo que significa que ha habido cambios en la primera línea. En una diferencia más realista, se podría ver un encabezado como el siguiente:

```
 @@ -34,6 +34,8 @@
```

En este ejemplo de encabezado, lo que pone es que se han extraído 6 líneas a contar desde la línea número 34. Además, se han añadido 8 líneas a partir de la línea número 34.

El resto del contenido del fragmento muestra los cambios recientes. Todas las líneas cambiadas comienzan por un símbolo `+` o `-`, que sirve para indicar de qué versión de la entrada de la diferencia proceden los cambios. Como ya hemos comentado antes, `-` indica cambios en `a/diff_test.txt`, mientras que "+" indica cambios en `b/diff_test.txt`.

##### Resaltar cambios

###### 1. `git diff --color-words`

El comando `git diff` también tiene un modo especial para resaltar los cambios con un nivel de detalle muy superior: `‐‐color-words`. Este modo tokeniza las líneas añadidas y eliminadas mediante espacios en blanco y luego muestra la diferencia.

```
 $:> git diff --color-words diff --git a/diff_test.txt b/diff_test.txt index 6b0c6cf..b37e70a 100644 --- a/diff_test.txt +++ b/diff_test.txt @@ -1 +1 @@ this is agit difftest example
```

Ahora, el resultado muestra solo las palabras coloreadas que han cambiado.

###### 2. `git diff-highlight`

Si clonas el código fuente de git, verás un subdirectorio llamado "contrib", que contiene una serie de herramientas relacionadas con Git, así como otras interesantes cositas que todavía no se han promovido al núcleo de Git. Una de ellas es un script en Perl llamado "diff-highlight". Diff-highlight empareja líneas coincidentes del resultado de la diferenciación y resalta los fragmentos menores que una palabra que han cambiado.

```
 $:> git diff | /your/local/path/to/git-core/contrib/diff-highlight/diff-highlight diff --git a/diff_test.txt b/diff_test.txt index 6b0c6cf..b37e70a 100644 --- a/diff_test.txt +++ b/diff_test.txt @@ -1 +1 @@ -this is a git diff test example +this is a diff example
```

De este modo, se reduce la diferencia al mínimo cambio posible.

#### git commit

El comando `git commit` captura una instantánea de los cambios preparados en ese momento del proyecto. Las instantáneas confirmadas pueden considerarse como versiones "seguras" de un proyecto: Git no las cambiará nunca a no ser que se lo pidas expresamente. Antes de la ejecución de `git commit`, se utiliza el comando `git add` para pasar o "preparar" los cambios en el proyecto que se almacenarán en una confirmación.

##### Git commit frente a SVN commit

Aunque comparten el mismo nombre, `git commit` no tiene nada que ver con `svn commit`. Este término compartido puede ser una fuente de confusión para los principiantes de Git que tienen experiencia en SVN y es importante enfatizar la diferencia. Comparar `git commit` frente a `svn commit` es lo mismo que comparar un modelo de aplicaciones centralizadas (SVN) frente a un modelo de aplicaciones distribuidas (Git). En SVN, una confirmación envía los cambios del cliente SVN local a un repositorio SVN compartido, centralizado y remoto. En Git, los repositorios están distribuidos, las instantáneas se confirman en el repositorio local y no se requiere ninguna interacción en absoluto con otros repositorios de Git. Las confirmaciones de Git se pueden enviar más tarde a repositorios remotos arbitrarios.

##### Funcionamiento

A grandes rasgos, Git se puede considerar una utilidad de gestión de cronogramas. Las confirmaciones son las unidades básicas fundamentales de un cronograma de proyecto de Git. Las confirmaciones se pueden considerar instantáneas o hitos en el cronograma de un proyecto de Git. Las confirmaciones se crean con el comando `git commit` para capturar el estado de un proyecto en ese determinado momento. Las instantáneas de Git siempre se confirman en el repositorio local. Esto es en esencia diferente a lo que ocurre en SVN, donde la copia de trabajo se confirma en el repositorio central. Por el contrario, Git no te obliga a interactuar con el repositorio central hasta que estés listo. Al igual que el entorno de ensayo es una zona intermedia entre el directorio de trabajo y el historial del proyecto, el repositorio local de cada desarrollador es una zona intermedia entre sus contribuciones y el repositorio central.

Esto cambia el modelo de desarrollo básico para los usuarios de Git. En vez de hacer un cambio y confirmarlo directamente en el repositorio central, los desarrolladores de Git tienen la oportunidad de acumular confirmaciones en su repositorio local. Esto tiene muchas ventajas con respecto a la colaboración al estilo de SVN: hace que sea más sencillo dividir una función en confirmaciones atómicas, mantener las confirmaciones relacionadas agrupadas y limpiar el historial local antes de publicarlo en el repositorio central. Asimismo, permite que los desarrolladores trabajen en un entorno aislado y aplacen la integración hasta que estén en un momento bueno para fusionar su trabajo con el de otros usuarios. Aunque el aislamiento y la integración aplazada son beneficiosos para un desarrollador, por el bien de todo el equipo se debería integrar con frecuencia y en pequeñas unidades. Para obtener más información sobre las prácticas recomendadas para la colaboración en equipo en Git, lee cómo los equipos estructuran su [flujo de trabajo de Git](https://www.atlassian.com/es/git/tutorials/comparing-workflows).

##### Instantáneas, no diferencias

Aparte de las distinciones prácticas entre SVN y Git, su implementación subyacente también sigue filosofías de diseño completamente divergentes. Mientras que SVN monitoriza las diferencias de un archivo, el modelo de control de versiones de Git se basa en instantáneas. Por ejemplo, una confirmación SVN se compone de las diferencias en comparación con el archivo original que se ha añadido al repositorio. Por el contrario, Git registra todo el contenido de cada archivo en todas las confirmaciones.

![Tutorial de Git: Instantáneas, no diferencias](https://wac-cdn.atlassian.com/dam/jcr:7406fe56-d36d-44cf-92e3-b28e4bae36f8/02.svg?cdnVersion=1278)

Esto hace que muchas operaciones de Git sean más rápidas que las de SVN, ya que una versión particular de un archivo no se tiene que "montar" a partir de sus diferencias: la revisión completa de cada archivo está disponible inmediatamente en la base de datos interna de Git.

El modelo de instantáneas de Git tiene un alcance transcendental en prácticamente todos los aspectos de su modelo de control de versiones, que afecta a todo, desde sus herramientas de ramificación y fusión hasta sus flujos de trabajo de colaboración.

##### Opciones comunes

```
 git commit
```

Confirma la instantánea preparada. El comando abrirá un editor de texto que te pedirá un mensaje para la confirmación. Una vez escrito el mensaje, guarda el archivo y cierra el editor para crear la confirmación.

```
 git commit -a
```

Confirma una instantánea de todos los cambios del directorio de trabajo. Solo incluye modificaciones a los archivos con seguimiento (los que se han añadido con `git add` en algún punto de su historia).

```
 git commit -m "commit message"
```

Un comando de atajo que crea inmediatamente una confirmación con un mensaje de confirmación pasado. De manera predeterminada, `git commit` abrirá el editor de texto configurado localmente y solicitará que se introduzca un mensaje de confirmación. Si se pasa la opción `-m`, se omitirá la solicitud de editor de texto a favor de un mensaje en línea.

```
 git commit -am "commit message"
```

Un comando de atajo para usuarios avanzados que combina las opciones `-a` y `-m`. Esta combinación crea inmediatamente una confirmación de todos los cambios preparados y aplica un mensaje de confirmación en línea.

```
 git commit --amend
```

Esta opción añade otro nivel de funcionalidad al comando confirmado. Al pasar esta opción, se modificará la última confirmación. En vez de crear una nueva confirmación, los cambios preparados se añadirán a la confirmación anterior. Este comando abrirá el editor de texto configurado del sistema y te pedirá que cambies el mensaje de confirmación especificado anteriormente.

###### Ejemplos

###### Cómo guardar cambios con una confirmación

En el siguiente ejemplo, se asume que has editado contenido en un archivo llamado `hello.py` en la rama actual y estás listo para confirmarlo en el historial del proyecto. En primer lugar, tienes que preparar el archivo con `git add` y después puedes confirmar la instantánea preparada.

```
 git add hello.py
```

Este comando añadirá `hello.py` al entorno de ensayo de Git. Podemos examinar el resultado de esta acción utilizando el comando `git status`.

```
 git status On branch master Changes to be committed: (use "git reset HEAD ..." to unstage) new file: hello.py 
```

El resultado verde "new file: `hello.py`" indica que `hello.py` se guardará con la nueva confirmación. Desde la confirmación, se crea ejecutando:

```
git commit
```

Esto abrirá un editor de texto (personalizable mediante `git config`) que solicitará un mensaje de registro de confirmación, junto con una lista de lo que se ha confirmado:

```
 # Please enter the commit message for your changes. Lines starting # with '#' will be ignored, and an empty message aborts the commit. # On branch master # Changes to be committed: # (use "git reset HEAD ..." to unstage) # #modified: hello.py
```

Git no exige que los mensajes de confirmación sigan ninguna limitación de formato específica, pero el formato canónico consiste en resumir toda la confirmación en la primera línea en menos de 50 caracteres, dejar una línea en blanco y, después, una explicación detallada de lo que ha cambiado. Por ejemplo:

```
 Change the message displayed by hello.py
 - Update the sayHello() function to output the user's name - Change the sayGoodbye() function to a friendlier message
```

Una práctica habitual suele ser utilizar la primera línea del mensaje de confirmación como asunto, similar al de los correos electrónicos. El resto del mensaje de registro se considera el cuerpo y se utiliza para comunicar detalles del conjunto de cambios de la confirmación. Ten en cuenta que a muchos desarrolladores también les gusta usar el presente en sus mensajes de confirmación. Así los pueden leer como si fueran acciones del repositorio, lo que hace que muchas de las operaciones de reescritura del historial sean más intuitivas.

##### Cómo actualizar (modificar) una confirmación

Continuemos con el ejemplo de `hello.py` anterior. Vamos a hacer más actualizaciones en `hello.py` y ejecutar lo siguiente:

```
 git add hello.py git commit --amend
```

Esto abrirá una vez más el editor de texto configurado. Sin embargo, esta vez estará prerrellenado con el mensaje de confirmación que hemos introducido anteriormente. Indica que no estamos creando una nueva confirmación, sino editando la última.

#### Colaboración entre repositorios: git push

Es importante comprender que la idea de "copia de trabajo" de Git es muy distinta a la copia de trabajo que se obtiene al extraer código fuente de un repositorio SVN. A diferencia de SVN, Git no distingue entre las copias de trabajo y el repositorio central: todos son [repositorios Git](https://bitbucket.org/product/es/code-repository) completos.

Por tanto, colaborar con Git es intrínsecamente distinto que con SVN. Mientras que SVN depende de la relación entre el repositorio central y la copia de trabajo, el modelo de colaboración de Git se basa en la interacción entre repositorios. En lugar de insertar una copia de trabajo en el repositorio central de SVN, se extraen o envían commits de un repositorio a otro.

Por supuesto, nada te impide dar un significado especial a ciertos repositorios Git. Por ejemplo, con solo definir un repositorio de Git como el "central", es posible replicar un workflow centralizado usando Git. Esto se consigue por medio de convenciones, no porque esté integrado en el propio VCS.

###### Repositorios bare (vacíos) frente a repositorios clonados

Si en la sección anterior, "Inicio de un nuevo repositorio", has usado `git clone` para configurar tu repositorio local, entonces ya está listo para la colaboración remota. El comando `git clone` configura automáticamente el repositorio con un remote que apunta a la URL Git de donde lo has clonado. Esto significa que, una vez hagas cambios en un archivo y lo confirmes, puedes enviar los cambios al repositorio remoto con `git push`.

Si has usado el comando `git init` para crear un repositorio nuevo, entonces no tendrás ningún repositorio remoto al cual enviar cambios. Un patrón común a la hora de iniciar un nuevo repositorio es ir a un servicio Git alojado, como Bitbucket, y crear un repositorio ahí. El servicio te proporcionará una URL Git que podrás añadir a tu repositorio de Git local y enviar con `git push` al repositorio alojado. Una vez que hayas creado un repositorio remoto con el servicio de tu elección, deberás actualizar tu repositorio local con una asignación.

Si prefieres alojar tu propio repositorio remoto, deberás configurar un "repositorio bare". Tanto `git init` como `git clone` aceptan el argumento `--bare`. Un repositorio bare se suele usar para crear un repositorio central de Git remoto.



El comando `git push` se usa para cargar contenido del repositorio local a un repositorio remoto. El envío es la forma de transferir commits desde tu repositorio local a un repositorio remoto. Es el equivalente de `git fetch`, pero en lugar de descargar importaciones de commits en ramas locales, envía exportaciones de commits a ramas remotas. Las ramas remotas se configuran mediante el comando `git remote`. Los envíos tienen la capacidad de sobrescribir cambios, por lo que se debe tener cuidado a la hora de realizarlos. Estos problemas se describen a continuación.

##### Uso de git push

```
git push <remote> <branch>
```

Envía la rama especificada a una , junto con todos los commits y objetos internos necesarios. De este modo se crea una rama local en el repositorio de destino. Para evitar que se sobrescriban los commits, Git no te permitirá enviarlos cuando el resultado en el repositorio de destino sea una fusión sin avance rápido.

```
git push <remote> --force
```

Es igual que el comando anterior, pero fuerza el envío incluso si el resultado es una fusión sin avance rápido. No uses la marca `--force` a menos de que tengas absoluta certeza de lo que estás haciendo.

```
git push <remote> --all
```

Envía todas tus ramas locales a una rama remota especificada.

```
git push <remote> --tags
```

Las etiquetas no se envían automáticamente cuando envías una rama o usas la opción `--all`. La marca `--tags` envía todas las etiquetas locales a un repositorio remoto.

##### Análisis de git push

`git push` se suele usar para publicar y cargar cambios locales a un repositorio central. Después de modificar el repositorio local, se ejecuta un comando push para compartir las modificaciones con miembros remotos del equipo.

![Uso de git push para publicar cambios](https://wac-cdn.atlassian.com/dam/jcr:f148974e-7d4d-4c0e-bd31-8ac5467d1e6a/04.svg?cdnVersion=1278)

El diagrama anterior muestra lo que pasa cuando el progreso de tu rama `master` local ha sobrepasado a la rama `master` del repositorio central y publicas los cambios mediante la ejecución de un comando `git push origin master`. Fíjate en que ejecutar `git push` es similar en su esencia a ejecutar `git merge master` desde el repositorio remoto.

##### Git push y la sincronización

`git push` es uno de los muchos componentes que se usan en el proceso general de sincronización de Git. Los comandos de sincronización funcionan en ramas remotas que se configuran mediante el comando `git remote`. `git push` se puede considerar un comando de carga, mientras que `git fetch` y `git pull` se conciben como comandos de descarga. Una vez que los conjuntos de cambios se han trasladado mediante una descarga o una carga, se puede ejecutar un comando `git merge` en el destino para integrar dichos cambios.

##### Envíos a repositorios bare

Una práctica de Git moderna y que se usa muy a menudo consiste en contar con un repositorio `--bare` alojado de forma remota que actúa como un repositorio de origen central. Este repositorio de origen se suele alojar fuera de las instalaciones en un tercero fiable, por ejemplo, Bitbucket. Como los envíos interfieren en la estructura de la rama remota, lo más seguro y común es enviar repositorios que se han creado con la marca `--bare`. Los repositorios bare no tienen un directorio en funcionamiento, por lo que un envío no alterará el trabajo en curso sobre el contenido de un directorio en funcionamiento. Para obtener más información sobre la creación de repositorios bare, consulta la sección sobre `git init`.

##### Envío forzado

Git evita que sobrescribas el historial del repositorio central al negarse a enviar solicitudes cuando el resultado es una fusión sin avance rápido. De este modo, si el historial remoto difiere de tu historial, tendrás que incorporar una rama remota y fusionarla con la local para después intentar enviarla de nuevo. Este proceso es similar a la forma en la que SVN realiza la sincronización con el repositorio central mediante el comando `svn update` antes de confirmar un conjunto de cambios.

La marca `--force` sobrescribe este comportamiento y hace que la rama del repositorio remoto coincida con la local, además de que elimina todos los cambios de nivel superior que se hayan producido desde que realizaste la última incorporación. La única situación en la que deberías requerir un envío forzado es cuando te das cuenta de que los commits que acabas de compartir no están del todo bien y los corriges con un comando `git commit --amend` o con una reorganización interactiva. No obstante, debes estar absolutamente seguro de que ninguno de tus compañeros de equipo ha incorporado esos commits antes de usar la opción `--force`.

##### Ejemplos

##### Comando git push predeterminado

El siguiente ejemplo describe uno de los métodos estándar para publicar contribuciones locales al repositorio central. En primer lugar, se asegura de que tu rama maestra local está actualizada al recuperar la copia del repositorio central y reorganizar tus cambios sobre esa base. La reorganización interactiva también constituye una buena oportunidad para limpiar tus commits antes de compartirlos. A continuación, el comando `git push` envía todos los commits de tu rama maestra local al repositorio central.

```
git checkout master
git fetch origin master
git rebase -i origin/master
# Squash commits, fix up commit messages etc.
git push origin master
```

Como ya nos hemos asegurado de que la rama maestra local está actualizada, esta acción debería generar una fusión con avance rápido, y el comando `git push` no debería realizar ningún bloqueo debido a los problemas de la falta de avance rápido analizados anteriormente.

##### Envío forzado corregido

El comando `git commit` admite una opción `--amend` que actualizará el commit anterior. Un commit se suele corregir para actualizar el mensaje que contiene o añadir cambios nuevos. Una vez que un commit se corrige, `git push` da un fallo porque Git ve el commit corregido y el remoto como contenido divergente. Debe usarse la opción `--force` para enviar un commit corregido.

```
# make changes to a repo and git add
git commit --amend
# update the existing commit message
git push --force origin master
```

El ejemplo anterior asume que se está ejecutando en un repositorio existente con un historial de commits. `git commit --amend` se usa para actualizar el commit anterior. A continuación, el commit corregido se envía de forma forzada mediante la opción `--force`.

##### Eliminación de una rama o etiqueta remotas

En ocasiones, se deben limpiar las ramas por motivos de organización y mantenimiento de registros. Para eliminar una rama por completo, se debe eliminar tanto de forma local como de forma remota.

```
git branch -D branch_name
git push origin :branch_name
```

La opción anterior eliminará la rama remota denominada branch_name al pasar un nombre de rama con dos puntos como prefijo por el comando `git push`.

#### git pull

El comando `git pull` se emplea para extraer y descargar contenido desde un repositorio remoto y actualizar al instante el repositorio local para reflejar ese contenido. La fusión de cambios remotos de nivel superior en tu repositorio local es una tarea habitual de los flujos de trabajo de colaboración basados en Git. El comando `git pull` es, en realidad, una combinación de dos comandos, `git fetch` seguido de `git merge`. En la primera etapa de la operación `git pull` ejecutará un `git fetch` en la rama local a la que apunta `HEAD`. Una vez descargado el contenido, `git pull` entrará en un flujo de trabajo de fusión. Se creará una nueva confirmación de fusión y se actualizará `HEAD` para que apunte a la nueva confirmación.

##### Uso de git pull

##### Funcionamiento

El comando `git pull` ejecuta en primer lugar `git fetch`, que descarga el contenido del repositorio remoto especificado. Después, se ejecuta `git merge` para fusionar las referencias y los encabezados del contenido remoto en una nueva confirmación de fusión local. Para ilustrar mejor el proceso de incorporación de cambios y fusión, veamos el siguiente ejemplo. Supongamos que tenemos un repositorio con una rama maestra y un origen remoto.

![img](https://wac-cdn.atlassian.com/dam/jcr:00d011ed-03dc-440f-afc5-9b13d5e14fbf/bubble%20diagram-01.svg?cdnVersion=1278)

En este escenario, `git pull` descargará todos los cambios desde el punto de separación de la rama local y la rama maestra. En este ejemplo, ese punto es E. `git pull` extraerá las confirmaciones remotas divergentes que son A, B y C. A continuación, el proceso de incorporación de cambios creará una nueva confirmación de fusión local que incluya el contenido de las nuevas confirmaciones remotas divergentes.

![img](https://wac-cdn.atlassian.com/dam/jcr:b3a663dc-1985-40df-b0a5-c6bcbacd71af/bubble%20diagram-02.svg?cdnVersion=1278)

En el diagrama anterior, podemos ver la nueva confirmación H, que es una confirmación de fusión nueva que incluye el contenido de las confirmaciones remotas A, B y C, y tiene un mensaje de registro combinado. Este es un ejemplo de una de las estrategias de fusión de `git pull`. Una opción `--rebase` puede combinarse con `git pull` para usar una estrategia de fusión de reorganización en lugar de una confirmación de fusión. En el siguiente ejemplo se puede ver cómo funciona una incorporación de cambios de reorganización. Supongamos que nos encontramos en el punto de partida de nuestro primer diagrama y que hemos ejecutado `git pull --rebase`.

![img](https://wac-cdn.atlassian.com/dam/jcr:642026b1-e174-4aa1-a5f7-e1ee1442af13/bubble%20diagram-03-updated@2x.png?cdnVersion=1278)

En este diagrama, ahora podemos ver que la incorporación de cambios de reorganización no crea la nueva confirmación H. En su lugar, la reorganización ha copiado las confirmaciones remotas A, B y C, y ha reescrito las confirmaciones locales E, F y G para que aparezcan después de ellas en el historial de confirmaciones maestras o de origen locales.

##### Opciones comunes

```
git pull <remote>
```

Fetch the specified remote’s copy of the current branch and immediately merge it into the local copy. This is the same as `git fetch` followed by `git merge origin/`.

```
git pull --no-commit <remote>
```

De manera similar a la invocación predeterminada, extrae el contenido remoto, pero no crea una nueva confirmación de fusión.

```
git pull --rebase <remote>
```

Al igual que en la anterior incorporación de cambios, en lugar de utilizar `git merge` para integrar la rama remota en la local, usa `git rebase`.

```
git pull --verbose
```

Proporciona una salida detallada durante una incorporación de cambios que muestra el contenido descargado y los detalles de la fusión.

##### Análisis de git pull

You can think of `git pull` as Git's version of `svn update`. It’s an easy way to synchronize your local repository with upstream changes. The following diagram explains each step of the pulling process.

![img](https://wac-cdn.atlassian.com/dam/jcr:60943ee2-bec2-4433-8216-885c4bd3c2b9/03.svg?cdnVersion=1278)

Al principio, piensas que tu repositorio está sincronizado, pero después `git fetch` refleja que la versión de la rama maestra del origen ha cambiado desde la última vez que la comprobaste. Luego, `git merge` integra al instante la rama maestra en la local.

##### Comando git pull y sincronización

`git pull` es uno de los muchos comandos que se encargan de "sincronizar" el contenido remoto. El comando `git remote` se utiliza para especificar los extremos remotos sobre los que operarán los comandos de sincronización. El comando `git push`sirve para cargar contenido en un repositorio remoto.

El comando `git fetch` puede confundirse con `git pull`. Ambos se usan para descargar contenido remoto. Puede hacerse una importante distinción de seguridad entre `git pull` y `get fetch`. `git fetch` puede considerarse la opción "segura" y `git pull` la "no segura". `git fetch` descargará el contenido remoto sin modificar el estado del repositorio local. En cambio, `git pull` descargará el contenido remoto y tratará inmediatamente de cambiar el estado del repositorio local para reflejar ese contenido. De modo accidental, esto puede provocar que el repositorio local entre en conflicto.

##### Incorporación de cambios mediante la opción rebase

La opción `--rebase` se puede usar para garantizar que el historial sea lineal evitando las confirmaciones de fusión innecesarias. Muchos desarrolladores prefieren esta opción antes que la fusión, porque es como decir "quiero que mis cambios prevalezcan sobre lo que han hecho los demás". En este sentido, usar `git pull` con `--rebase` se parece aún más a `svn update` que a un simple `git pull`.

In fact, pulling with `--rebase` is such a common workflow that there is a dedicated configuration option for it:

```
git config --global branch.autosetuprebase always
```

After running that command, all `git pull` commands will integrate via `git rebase` instead of `git merge`.

##### Ejemplos de git pull

En los siguientes ejemplos, se muestra cómo usar `git pull` en las situaciones más habituales:

##### Comportamiento predeterminado

```
git pull
```

La ejecución de la invocación predeterminada de `git pull` equivale a `git fetch origin HEAD` y `git merge HEAD`, donde `HEAD` es una referencia que apunta a la rama actual.

##### Comando git pull en los repositorios remotos

```
git checkout new_feature
git pull <remote repo>
```

En este ejemplo, primero se realiza una extracción del repositorio y se pasa a la rama . Después, se ejecuta `git pull` transmitiendo . De este modo, se incorporará implícitamente la rama newfeature de . Una vez finalizada la descarga, se iniciará un `git merge`.

##### Uso de la opción rebase con git pull en lugar de merge

En el siguiente ejemplo, se muestra cómo realizar la sincronización con la rama maestra del repositorio central mediante la opción rebase:

```
git checkout master
git pull --rebase origin
```

Esto simplemente hace que tus cambios locales prevalezcan sobre lo que ya han hecho los demás.



#### Ajustes y configuración: git config

Una vez configurado el repositorio remoto, deberás añadir una URL de repositorio remoto a tu `git config` local y configurar una rama de nivel superior para tus ramas locales. El comando `git remote` te ofrece tal utilidad.

```
 git remote add  
```

Este comando asignará el repositorio remoto en `` a una referencia en tu repositorio local bajo ``. Una vez asignado el repositorio remoto, puedes enviar ramas locales ahí.

```
 git push -u  
```

Este comando enviará la rama del repositorio local `` al repositorio remoto ``.



Además de configurar una URL de repositorio remoto, puede que también necesites configurar ajustes globales de Git como el username (nombre de usuario) o el email. El comando `git config` te permite configurar la instalación de Git (o un repositorio individual) desde la línea de comandos. Este comando puede definir cualquier cosa: desde la información de usuario, hasta las preferencias o el comportamiento del repositorio. A continuación, se listan varias opciones de configuración.

Git almacena las opciones de configuración en tres archivos distintos, lo que te permite ajustar opciones para repositorios individuales (local), usuarios (global) o todo el sistema (sistema):

- Local: `/.git/config` —ajustes específicos del repositorio.
- Global: `~/.gitconfig` —ajustes específicos del usuario. Aquí es donde se almacenan las opciones configuradas con la marca --global.
- Sistema: `$(prefix)/etc/gitconfig` —ajustes de todo el sistema.

Define el nombre del autor que se va a usar en todas las confirmaciones del repositorio actual. Normalmente, será preferible utilizar el indicador `--global` para establecer las opciones de configuración del usuario actual.

```
 git config --global user.name 
```

Define el nombre del autor que se va a usar en todas las confirmaciones del usuario actual.

Añadir la opción `--local` o, sencillamente, no pasar una opción de configuración, establecerá el `user.name` para el repositorio local actual.

```
 git config --local user.email 
```

Define el correo electrónico del autor que se va a usar en todas las confirmaciones del usuario actual.

```
 git config --global alias. 
```

Crea un atajo de teclado para un comando Git. Es una utilidad muy potente para crear atajos personalizados para comandos que uses con frecuencia. Veamos este ejemplo:

```
 git config --global alias.ci commit
```

De este modo se crea el comando `ci`, que puedes ejecutar como atajo para `git commit`. Para obtener más información sobre los alias git, visita la [página sobre `git config`](https://www.atlassian.com/git/tutorials/setting-up-a-repository/git-config).

```
 git config --system core.editor 
```

Define el editor de texto que se utilizará con comandos como `git commit` para todos los usuarios en la máquina actual. El argumento `` debería ser el comando que abra el editor deseado (por ejemplo, vi). En este ejemplo introducimos la opción `--system`. La opción `--system` configurará todo el sistema, lo que significa todos los usuarios y repositorios de una máquina. Para información más detallada sobre los niveles de configuración visita la [página sobre git config](https://www.atlassian.com/git/tutorials/setting-up-a-repository/git-config).

```
 git config --global --edit
```

Abre el archivo de configuración global en un editor de texto para editarlo de forma manual. 



###### Análisis

Todas las opciones de configuración se almacenan en archivos de texto sin formato, así que el comando `git config` en realidad no es más que una interfaz práctica de la línea de comandos. Generalmente, solo tendrás que configurar la instalación de Git la primera vez que empieces a trabajar con una máquina de desarrollo nueva y, en prácticamente todos los casos, querrás usar la marca `--global`. Una excepción importante es cuando quieras invalidar la dirección de correo electrónico del autor. Es posible que desees usar tu dirección personal para repositorios personales y de código abierto y tu dirección de correo profesional para los repositorios relacionados con el trabajo.

Git almacena las opciones de configuración en tres archivos distintos, lo que te permite ajustar opciones para repositorios individuales, usuarios o todo el sistema.

- `/.git/config` – Configuración específica del repositorio.
- `~/.gitconfig` —ajustes específicos del usuario. Aquí es donde se almacenan las opciones configuradas con la marca --global.
- `$(prefix)/etc/gitconfig` – Configuración de todo el sistema.

Cuando se producen conflictos entre las opciones de estos archivos, la configuración local sobrescribe la configuración del usuario que, a su vez, sobrescribe todo el sistema. Si abres alguno de estos archivos, podrás ver ejemplos como este:

```
 [user] name = John Smith email = john@example.com [alias] st = status co = checkout br = branch up = rebase ci = commit [core] editor = vim
```

Puedes editar estos valores de forma manual para que tengan el mismo efecto que `git config`.

###### Ejemplo

Lo primero que debes hacer después de instalar Git es introducir tu nombre y tu correo electrónico y personalizar la configuración predeterminada. Una configuración predeterminada habitual puede tener un aspecto similar a este:

Indícale a Git quién eres `git config`

```
 git --global user.name "John Smith" git config --global user.email john@example.com
```

Selecciona tu editor de texto favorito.

```
 git config --global core.editor vim
```

Añade algunos alias de tipo SVN.

```
 git config --global alias.st status git config --global alias.co checkout git config --global alias.br branch git config --global alias.up rebase git config --global alias.ci commit
```

De este modo obtendrás el archivo `~ /.gitconfig` de la sección anterior. 

git fetch

El comando `git fetch` descarga commits, archivos y referencias de un repositorio remoto a tu repositorio local. Esta acción la llevas a cabo cuando quieres ver en qué han estado trabajando los demás. Es similar al comando `svn update` porque te permite ver cómo ha progresado el historial central, pero no te obliga a fusionar los cambios en tu repositorio. Git aísla el contenido recuperado del contenido local existente sin tener ningún tipo de repercusión sobre el desarrollo local de tu trabajo. El contenido recuperado debe extraerse específicamente con el comando `git checkout`. Esto permite que la recuperación constituya una forma segura de revisar commits antes de integrarlos en tu repositorio local.

Para descargar contenido de un repositorio remoto, los comandos `git pull` y `git fetch` están disponibles para realizar esta tarea. Puedes considerar `git fetch` como la versión segura de los dos comandos. Este comando descarga el contenido remoto, pero no actualiza el estado de trabajo del repositorio local, por lo que tu trabajo actual no se verá afectado. `git pull` constituye una alternativa más agresiva, ya que descarga el contenido remoto a la rama local activa e inmediatamente ejecuta `git merge` para crear un commit fusionado con el nuevo contenido remoto. Si tienes cambios pendientes en curso, esta acción provocará conflictos e iniciará el flujo de resolución de conflictos de fusión.

##### Funcionamiento de git fetch con las ramas remotas

Para entender mejor como funciona `git fetch`, hablaremos de cómo organiza y almacena Git los commits. Entre bastidores, en el directorio `./.git/objects` del repositorio, Git almacena todos los commits locales y remotos. Git mantiene los commits de ramas locales y remotas separados de forma diferenciada mediante las referencias de las ramas. Las referencias de las ramas locales se almacenan en el directorio `./.git/refs/heads/`. La ejecución del `git branch` genera una lista de referencia de las ramas locales. A continuación encontramos un ejemplo del resultado del comando `git branch` con algunos nombres de ramas de demostración.

```
git branch
master
feature1
debug2
```

Al examinar el contenido del directorio `/.git/refs/heads/` se obtiene un resultado similar.

```
ls ./.git/refs/heads/
master
feature1
debug2
```

Las ramas remotas son como las ramas locales, excepto por el hecho de están asociadas a commits de repositorios ajenos. Las ramas remotas tienen como prefijo el repositorio remoto al que pertenecen para que no las confundas con ramas locales. Al igual que para las ramas locales, Git también cuenta con referencias para las ramas remotas. Las referencias de las ramas remotas viven en el directorio `./.git/refs/remotes/`. El siguiente ejemplo de fragmento de código muestra las ramas que puedes ver después de recuperar un repositorio remoto, que se llama remote-repo:

```
git branch -r
# origin/master
# origin/feature1
# origin/debug2
# remote-repo/master
# remote-repo/other-feature
```

Este resultado muestra las ramas locales que hemos examinado anteriormente, solo que ahora las muestra con el prefijo `origin/`. Además, también vemos las ramas remotas con el prefijo `remote-repo`. Puedes extraer una rama remota como una local, pero hará que tu estado pase a ser `HEAD` desasociado (al igual que si estuvieras extrayendo un commit antiguo). Puedes considerarlas ramas de solo lectura. Para ver tus ramas remotas, solo tienes que colocar la marca `-r` en el comando `git branch`.

Puedes analizar ramas remotas con los comandos habituales `git checkout` y `git log`. Si apruebas los cambios que contiene una rama remota, puedes fusionarla con la rama local mediante un comando `git merge` normal. Al contrario que SVN, la sincronización de tu repositorio local con un repositorio remoto es en realidad un proceso de dos pasos: recuperar y, después, fusionar. El comando `git pull` es un atajo cómodo para realizar este proceso.

##### Opciones y comandos git fetch

```
git fetch <remote>
```

Recupera todas las ramas del repositorio. También descarga todos los commits y archivos requeridos del otro repositorio.

```
git fetch <remote> <branch>
```

Realiza la misma acción que el comando anterior, pero solo recupera la rama especificada.

```
git fetch --all
```

Una función potente que recupera todos los repositorios remotos registrados y sus ramas:

```
git fetch --dry-run
```

La opción `--dry-run` ejecutará una demo del comando. Genera ejemplos de acciones que realizará durante la recuperación, pero no los aplica.

##### Ejemplos de git fetch

##### Aplicar git fetch a una rama remota

El siguiente ejemplo es una demostración de cómo recuperar una rama remota y actualizar tu estado en curso actual con los contenidos remotos. En este ejemplo, asumiremos que hay un repositorio central de origen a partir del que se ha clonado el repositorio local mediante el comando `git clone`. También asumiremos que hay un repositorio remoto adicional llamado coworkers_repo que contiene una rama feature_branch que configuraremos y recuperaremos. Una vez explicado esto, continuemos con el ejemplo.

En primer lugar, tenemos que configurar el repositorio remoto mediante el comando `git remote`.

```
git remote add coworkers_repo git@bitbucket.org:coworker/coworkers_repo.git
```

Hemos creado una referencia para el repositorio coworkers_repo mediante la URL del repositorio. Ahora pasaremos el nombre remoto por `git fetch` para descargar el contenido.

```
git fetch coworkers feature_branch
fetching coworkers/feature_branch
```

Ahora tenemos el contenido de la rama coworkers/feature_branch descargados localmente y tenemos que integrarlo en nuestra copia local en funcionamiento. Empezaremos este proceso usando el comando `git checkout` to para extraer la rama remota que acabamos de descargar.

```
git checkout coworkers/feature_branch
Note: checking out coworkers/feature_branch'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by performing another checkout.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -b with the checkout command again. Example:

git checkout -b <new-branch-name>
```

El resultado de esta operación de extracción indica que nos encontramos en estado de `HEAD` desasociado. Es algo que ya esperábamos y quiere decir que nuestra referencia `HEAD` apunta a una referencia que no forma parte de la secuencia de nuestro historial local. Dado que la referencia `HEAD` apunta a la referencia de la rama coworkers/feature_branch, podemos crear una nueva rama local desde dicha referencia. El resultado de la referencia "`HEAD` desasociado" muestra cómo realizar esta acción mediante el comando `git checkout`:

```
git checkout -b local_feature_branch
```

Aquí hemos creado una nueva rama local denominada local_feature_branch que actualiza la referencia `HEAD` para que apunte al contenido remoto más reciente y podamos continuar con el desarrollo a partir de este punto.

##### Sincronización del origen con git fetch

En el siguiente ejemplo se describe el flujo de trabajo habitual de sincronización del repositorio local con la rama maestra del repositorio central.

```
git fetch origin
```

Así se muestran las ramas que se han descargado:

```
a1e8fb5..45e66a4 master -> origin/master
a1e8fb5..9e8ab1c develop -> origin/develop
* [new branch] some-feature -> origin/some-feature
```

The commits from these new remote branches are shown as squares instead of circles in the diagram below. As you can see, `git fetch` gives you access to the entire branch structure of another repository.

![img](https://wac-cdn.atlassian.com/dam/jcr:0718ae20-0dc5-482c-a38c-25e4f1a1a3b0/02.svg?cdnVersion=1278)

Para ver qué commits se han añadido a la rama maestra de nivel superior, puedes ejecutar un comando `git log` con el filtro origin/master:

```
git log --oneline master..origin/master
```

Para aprobar los cambios y fusionarlos con tu rama maestra local, usa estos comandos:

```
git checkout master
git log origin/master
```

A continuación podemos usar el comando `git merge origin/master`:

```
git merge origin/master
```

Las ramas origin/master y master ahora apuntan al mismo commit y están sincronizadas con los desarrollos de nivel superior.

##### Resumen de git fetch

En resumen, `git fetch` es un comando principal que se usa para descargar contenidos desde un repositorio remoto. `git fetch` se usa en combinación con `git remote`, `git branch`, `git checkout` y `git reset` para actualizar un repositorio local al estado de un remoto. El comando `git fetch` es una pieza fundamental de los flujos de trabajo colaborativos de git. `git fetch` presenta un comportamiento similar a `git pull`, aunque `git fetch` se puede considerar una versión más segura y menos destructiva.

#### git remote

SVN utiliza un único repositorio centralizado para funcionar como un centro de comunicaciones para los desarrolladores; además, a la hora de colaborar, se pasan conjuntos de cambios entre las copias de trabajo de los desarrolladores y el repositorio central. El modelo de colaboración distribuida de Git es completamente diferente, ya que proporciona a cada desarrollador su propia copia del repositorio, con su propio historial local y estructura de ramas. Los usuarios, por lo general, necesitan compartir una serie de confirmaciones, en lugar de un solo conjunto de cambios. En vez de confirmar un conjunto de cambios de una copia de trabajo en el repositorio central, Git te permite compartir ramas enteras entre repositorios.

El comando `git remote` es una parte de un sistema más amplio que se encarga de sincronizar los cambios. Los registros inscritos mediante el comando `git remote` se utilizan junto con los comandos `git fetch`, `git push` y `git pull`. Todos estos comandos tienen sus propias responsabilidades de sincronización, que pueden consultarse en los enlaces correspondientes.



El comando `git remote` te permite crear, ver y eliminar conexiones a otros repositorios. Las conexiones remotas se asemejan más a marcadores que a enlaces directos con otros repositorios. En lugar de brindar acceso en tiempo real a otro repositorio, funcionan como prácticos nombres que pueden emplearse para hacer referencia a una URL no tan sencilla.

Por ejemplo, en el siguiente diagrama pueden verse dos conexiones remotas desde tu repositorio hasta el repositorio central y el repositorio de otro desarrollador. En lugar de hacer referencia a ellas mediante sus URL completas, puedes pasar los atajos del origen y John a otros comandos de Git.

![Using git remote to connect other repositories](https://wac-cdn.atlassian.com/dam/jcr:df13d351-6189-4f0b-94f0-21d3fcd66038/01.svg?cdnVersion=1278)

##### Descripción general del uso de git remote

El comando `git remote` es, en esencia, una interfaz para gestionar una lista de entradas remotas almacenadas en el archivo `./.git/config` del repositorio. Para ver el estado de la lista remota, se utilizan los siguientes comandos.

##### Visualización de configuraciones de git remote

```
git remote
```

Enumera las conexiones remotas que tienes con otros repositorios.

```
git remote -v
```

Lo mismo que el comando anterior, pero incluye la URL de cada conexión.

##### Creación y modificación de configuraciones de git remote

El comando `git remote` es también un método sencillo y útil para modificar el archivo `./.git/config` de un repositorio. Los comandos que se presentan a continuación te permiten gestionar las conexiones con otros repositorios. Los siguientes comandos modificarán el archivo `/.git/config` del repositorio. El resultado de dichos comandos también puede conseguirse editando directamente el archivo `./.git/config` con un editor de texto.

```
git remote add <name> <url>
```

Crea una nueva conexión a un repositorio remoto. Tras añadir el repositorio remoto, podrás usar como un práctico atajo para en otros comandos de Git.

```
git remote rm <name>
```

Elimina la conexión con el repositorio remoto que lleva el nombre ``.

```
git remote rename <old-name> <new-name>
```

Cambia el nombre de una conexión remota de a .

##### Análisis de git remote

Git está diseñado para proporcionar a cada desarrollador un entorno de desarrollo totalmente aislado. Esto significa que la información no se envía automáticamente entre repositorios. En su lugar, los desarrolladores deben incorporar cambios de confirmaciones de nivel superior en su repositorio local o enviar sus confirmaciones locales al repositorio central de forma manual. El comando `git remote` es una manera más simple de enviar URL a estos comandos de “compartición”.

##### Origen remoto

Al clonar un repositorio con `git clone`, se crea automáticamente una conexión remota llamada “origin” (origen) que apunta al repositorio clonado. Esto resulta útil para los desarrolladores que crean una copia local de un repositorio central, ya que permite incorporar cambios de nivel superior o publicar confirmaciones locales de forma sencilla. Este comportamiento es también la razón por la que la mayoría de los proyectos basados en Git llaman “origen” a su repositorio central.

##### URL de repositorios

Git admite numerosas formas de hacer referencia a un repositorio remoto. Una de las maneras más fáciles de acceder a uno de ellos es a través de los protocolos HTTP y SSH. El protocolo HTTP brinda un acceso sencillo, anónimo y de solo lectura a un repositorio. Por ejemplo:

```
http://host/path/to/repo.git
```

Sin embargo, por lo general, no se pueden enviar confirmaciones a una dirección HTTP (de todos modos, no convendría permitir envíos anónimos). Para acceder con permisos de lectura y escritura, debes usar SSH en su lugar:

```
ssh://user@host/path/to/repo.git
```

Necesitarás una cuenta SSH válida en el equipo host, pero, aparte de eso, Git admite el acceso autenticado mediante SSH listo para usarse. Las modernas y seguras soluciones de alojamiento de terceros, como Bitbucket.com, te proporcionarán estas URL.

##### Comandos de git remote

El comando `git remote` es uno de los muchos comandos de Git que se combinan con “subcomandos” adicionales. A continuación, encontrarás un análisis de los subcomandos de `git remote` más utilizados.

```
ADD <NAME> <URL>
```

Añade un registro en `./.git/config` para el repositorio remoto llamado en su URL .

Acepta la opción `-f`, que aplicará el comando `git fetch` inmediatamente después de que se cree el registro remoto.

Acepta la opción `--tags`, que aplicará el comando `git fetch` de inmediato e importará todas las etiquetas del repositorio remoto.

```
RENAME <OLD> <NEW>
```

Actualiza `./.git/config` para cambiar el nombre del registro de a . Se actualizan todas las ramas de seguimiento remoto y los ajustes de configuración del repositorio remoto.

```
REMOVE or RM <NAME>
```

Modifica `./.git/config` y elimina el repositorio remoto llamado . Se eliminan todas las ramas de seguimiento remoto y los ajustes de configuración del repositorio remoto.

```
GET-URL <NAME>
```

Genera las URL de un registro remoto.

Acepta `--push`. Se consultan las URL del comando push en lugar de las del comando fetch.

Con `--all`, se enumerarán todas las URL de los repositorios remotos.

```
SHOW <NAME>
```

Genera información de alto nivel sobre el repositorio remoto .

```
PRUNE <NAME>
```

Elimina las ramas locales de que no estén presentes en el repositorio remoto.

Acepta la opción `--dry-run`, que enumerará las ramas que estén configuradas para cortarse, pero en realidad no las cortará.

##### Ejemplos de git remote

Además del origen, suele ser conveniente tener una conexión con los repositorios de tus compañeros de equipo. Por ejemplo, si tu compañero John cuenta con un repositorio de acceso público en `dev.example.com/john.git`, puedes añadir una conexión de la siguiente manera:

```
git remote add john http://dev.example.com/john.git
```

Disponer de este tipo de acceso a los repositorios de cada desarrollador posibilita la colaboración fuera del repositorio central. Esto puede resultar de mucha utilidad para los equipos pequeños que trabajan en un proyecto de gran envergadura.

##### Visualización de las conexiones remotas

De forma predeterminada, el comando `git remote` mostrará las conexiones remotas con otros repositorios previamente almacenadas. Esto generará una salida de una sola línea con los nombres de los “marcadores” de los repositorios remotos.

```
$ git remote
origin
upstream
other_users_repo
```

Al invocar `git remote` con la opción `-v`, se imprimirá la lista de nombres de repositorios guardados como marcadores y, además, la URL del repositorio correspondiente. La opción `-v` significa “verboso”. A continuación, se muestra un ejemplo de salida verbosa de `git remote`.

```
git remote -v
origin  git@bitbucket.com:origin_user/reponame.git (fetch)
origin  git@bitbucket.com:origin_user/reponame.git (push)
upstream    https://bitbucket.com/upstream_user/reponame.git (fetch)
upstream    https://bitbucket.com/upstream_user/reponame.git (push)
other_users_repo    https://bitbucket.com/other_users_repo/reponame (fetch)
other_users_repo    https://bitbucket.com/other_users_repo/reponame (push)
```

##### Adición de repositorios remotos

El comando `git remote add` creará un nuevo registro de conexión con un repositorio remoto. Tras añadir un repositorio remoto, podrás usar como un práctico atajo para en otros comandos de Git. Para obtener más información sobre la sintaxis de URL aceptada, consulta la sección "URL de repositorios" de este artículo. Este comando creará un nuevo registro en el archivo `./.git/config` del repositorio. A continuación, se muestra un ejemplo de actualización de este archivo de configuración:

```
$ git remote add fake_test https://bitbucket.com/upstream_user/reponame.git; [remote "remote_test"] 
   url = https://bitbucket.com/upstream_user/reponame.git 
   fetch = +refs/heads/*:refs/remotes/remote_test/*
```

##### Inspección de un repositorio remoto

Se puede añadir el subcomando show a `git remote` para presentar una salida detallada sobre la configuración de un repositorio remoto. Esta salida incluirá una lista de ramas asociadas al repositorio remoto y, además, los extremos conectados para la captura y el envío.

```
git remote show upstream
* remote upstream
   Fetch URL: https://bitbucket.com/upstream_user/reponame.git
   Push URL: https://bitbucket.com/upstream_user/reponame.git
   HEAD branch: master
   Remote branches:
      master tracked
      simd-deprecated tracked
      tutorial tracked
   Local ref configured for 'git push':
      master pushes to master (fast-forwardable)
```

##### Captura e incorporación de cambios de repositorios remotos de Git

Una vez configurado un registro remoto mediante el uso del comando `git remote`, el nombre del repositorio remoto puede pasarse como un argumento a otros comandos de Git para comunicarse con el repositorio remoto. Tanto `git fetch` como `git pull` pueden utilizarse para leer desde un repositorio remoto. Ambos comandos tienen diferentes operaciones, que se explican con más detalle en sus respectivos enlaces.

##### Aplicación del comando push en repositorios remotos de Git

El comando `git push` se emplea para escribir en un repositorio remoto.

```
git push <remote-name> <branch-name>
```

En este ejemplo, se cargará el estado local de en el repositorio remoto especificado por .

##### Cambio de nombre y eliminación de repositorios remotos

```
git remote rename <old-name> <new-name>
```

El comando `git remote rename` se explica por sí mismo. Al ejecutarse, este comando cambiará el nombre de una conexión remota de a . Además, modificará el contenido de `./.git/config` para cambiar también el nombre del registro del repositorio remoto correspondiente.

```
git remote rm <name>
```

El comando `git remote rm` eliminará la conexión con el repositorio remoto especificado por el parámetro . Para mostrarlo, vamos a deshacer la adición del repositorio remoto de nuestro último ejemplo. Si ejecutamos `git remote rm remote_test` y, a continuación, examinamos el contenido de `./.git/config`, podemos ver que el registro `[remote "remote_test"]` ya no está ahí.

#### git log

El comando `git log` muestra las instantáneas confirmadas. Permite ver el historial del proyecto, filtrarlo y buscar cambios concretos. Mientras que `git status` te permite examinar el directorio de trabajo y el área de entorno de ensayo, `git log` solo actúa en el historial confirmado.

![Tutorial de Git: comparación entre git status y git log](https://wac-cdn.atlassian.com/dam/jcr:52d530ce-7f51-48e3-920b-a18f776048d3/01.svg?cdnVersion=1278)

La opción "log" se puede personalizar de diversas maneras, desde filtrar las confirmaciones hasta verlas en un formato completamente definido por el usuario. A continuación, presentamos algunas de las opciones de configuración más habituales de `git log`.

##### Uso

```
git log
```

Este comando muestra el historial de confirmaciones completo con el formato predeterminado. Si el resultado ocupa más de una pantalla, puedes usar `Space` para desplazarte y `q` para salir.

```
git log -n 
```

Esta opción limita el número de confirmaciones mediante ``. Por ejemplo, `git log -n 3` mostrará solo 3 confirmaciones.

```
git log --oneline
```

Permite agrupar cada confirmación en una sola línea. Resulta útil para obtener información de alto nivel del historial del proyecto.

```
git log --stat
```

Junto con la información de `git log` habitual, se incluye información sobre los archivos que se han modificado y el número relativo de líneas que se han añadido o eliminado en cada uno de ellos.

```
git log -p
```

Esta opción muestra el parche que representa cada confirmación. Se muestra la diferencia completa de cada confirmación, que es la vista más detallada que puedes tener del historial del proyecto.

```
git log --author=""
```

Realiza búsquedas de confirmaciones por un autor concreto. El argumento `` puede ser una cadena sencilla o una expresión regular.

```
git log --grep=""
```

Realiza búsquedas de confirmaciones con una mensaje de confirmación que coincida con el patrón ``, que puede ser una cadena sencilla o una expresión regular.

```
git log ..
```

Solo muestra las confirmaciones que se producen entre `` y ``. Estos argumentos pueden ser un ID de confirmación, un nombre de rama, `HEAD` o cualquier otro tipo de [referencia de revisión](http://www.kernel.org/pub/software/scm/git/docs/gitrevisions.html).

```
git log 
```

Esta opción solo muestra las confirmaciones que incluyen el archivo especificado. Se trata de una forma sencilla de ver el historial de un archivo concreto.

```
git log --graph --decorate --oneline
```

A continuación, exponemos algunas opciones que debes tener en cuenta. La marca --graph dibujará un gráfico basado en texto de las confirmaciones de la parte izquierda de los mensajes de confirmación. --decorate añade los nombres de las ramas o las etiquetas de las confirmaciones que se muestran. --oneline muestra la información de confirmación en una única línea para que sea más fácil examinar las confirmaciones de un vistazo.



## HOW TO BACKTRACK (Deshacer commits y cambios)

### Encontrar lo que se ha perdido: revisar confirmaciones antiguas

La idea que se esconde tras cualquier sistema de control de versiones es almacenar copias “seguras” de un proyecto para no tener que preocuparte nunca sobre si se producen daños irreparables en tu base de código. Una vez que has creado un historial de confirmaciones del proyecto, puedes revisar y volver a consultar cualquier confirmación en el historial. Una de las mejores utilidades para revisar el historial de un repositorio de Git es el comando `git log`.

En el ejemplo que se muestra a continuación, hemos utilizado el comando `git log` para pasar una lista de las confirmaciones más recientes a una popular biblioteca de gráficos de código abierto.

```
 git log --oneline e2f9a78fe Replaced FlyControls with OrbitControls d35ce0178 Editor: Shortcuts panel Safari support. 9dbe8d0cf Editor: Sidebar.Controls to Sidebar.Settings.Shortcuts. Clean up. 05c5288fc Merge pull request #12612 from TyLindberg/editor-controls-panel 0d8b6e74b Merge pull request #12805 from harto/patch-1 23b20c22e Merge pull request #12801 from gam0022/improve-raymarching-example-v2 fe78029f1 Fix typo in documentation 7ce43c448 Merge pull request #12794 from WestLangley/dev-x 17452bb93 Merge pull request #12778 from OndrejSpanel/unitTestFixes b5c1b5c70 Merge pull request #12799 from dhritzkiv/patch-21 1b48ff4d2 Updated builds. 88adbcdf6 WebVRManager: Clean up. 2720fbb08 Merge pull request #12803 from dmarcos/parentPoseObject 9ed629301 Check parent of poseObject instead of camera 219f3eb13 Update GLTFLoader.js 15f13bb3c Update GLTFLoader.js 6d9c22a3b Update uniforms only when onWindowResize 881b25b58 Update ProjectionMatrix on change aspect 
```

Cada confirmación tiene un hash SHA-1 de identificación único. Estos ID se emplean para desplazarse por el cronograma confirmado y revisar las confirmaciones. De manera predeterminada, `git log` solo muestra las confirmaciones de la rama seleccionada en ese momento. Es perfectamente posible que la confirmación que buscas se encuentre en otra rama. Para ver todas las confirmaciones de todas las ramas, puedes ejecutar `git log --branches=*`. El comando `git branch` se utiliza para visualizar y visitar otras ramas. Al invocar el comando, `git branch -a` devolverá una lista con los nombres de todas las ramas conocidas. Después, puede registrarse uno de los nombres de estas ramas mediante el comando `git log`.

Si encuentras una referencia de confirmación al punto del historial que quieres visitar, puedes utilizar el comando `git checkout` para visitar dicha confirmación. 

#### git checkout

`Git checkout` es una forma sencilla de “cargar” cualquiera de estas instantáneas guardadas en tu máquina de desarrollo. Durante el curso normal del desarrollo, el `HEAD` generalmente apunta a la rama `master` u otra rama local, pero cuando extraes una confirmación anterior, el `HEAD` ya no apunta a una rama: apunta directamente a la confirmación. Este estado recibe el nombre de “HEAD desasociado” (detached `HEAD`) y se puede representar de la siguiente manera:

![Tutorial de Git: extraer una confirmación anterior](https://wac-cdn.atlassian.com/dam/jcr:362f3b15-9e74-4fe5-b97d-784e296880ad/01.svg?cdnVersion=1278)

Extraer un archivo antiguo no mueve el puntero `HEAD`. Este permanece en la misma rama y en la misma confirmación, lo que evita un estado del tipo “HEAD desasociado”. A continuación, puedes hacer una confirmación de la versión antigua de un archivo en una nueva instantánea como lo harías con cualquier otro cambio. Así que, en efecto, este uso del comando `git checkout` en un archivo sirve para revertir a una versión antigua de un archivo individual. 

##### Visualización de una versión antigua

En este ejemplo, se asume que has comenzado a desarrollar un disparatado experimento, pero no sabes con seguridad si quieres conservarlo o no. Para decidirte, quieres echar un vistazo al estado del proyecto antes de empezar el experimento. Primero, tendrás que encontrar el ID de la revisión que deseas ver.

```
git log --oneline
```

Pongamos que el historial del proyecto presenta un aspecto similar al siguiente:

```
b7119f2 Continue doing crazy things 872fa7e Try something crazy a1e8fb5 Make some important changes to hello.txt 435b61d Create hello.txt 9773e52 Initial import
```

Puedes usar `git checkout` para ver la confirmación “Make some import changes to hello.txt” de la siguiente manera:

```
 git checkout a1e8fb5
```

De este modo, tu directorio de trabajo coincidirá con el estado exacto de la confirmación `a1e8fb5`. Puedes echar un vistazo a los archivos, compilar el proyecto, realizar pruebas e incluso editar archivos sin preocuparte de perder el estado actual del proyecto. Nada de lo que hagas aquí se guardará en tu repositorio. Para continuar con el desarrollo, debes volver al estado “actual” del proyecto:

```
 git checkout master
```

En este caso, se asume que estás llevando a cabo el desarrollo en la rama `master` predeterminada. Una vez que vuelvas a la rama `master`, puedes utilizar `git revert`o `git reset` para deshacer los cambios no deseados.

##### Deshacer una confirmación con git checkout

Al utilizar el comando `git checkout`, podemos comprobar la confirmación anterior, `a1e8fb5`, poniendo el repositorio en un estado anterior a que tuviera lugar la locura. Comprobar una confirmación específica pondrá el repositorio en un estado “HEAD desasociado”. Esto significa que ya no estás trabajando en ninguna rama. En un estado desasociado, cualquier nueva confirmación que hagas quedará huérfana cuando vuelvas a cambiar las ramas a una rama establecida. Las confirmaciones huérfanas están listas para que el recolector de basura de Git las elimine. El recolector de basura se ejecuta en un intervalo configurado y destruye de forma permanente las confirmaciones huérfanas. Para evitar que se recojan como basura confirmaciones huérfanas, es preciso asegurarse de que se está en una rama.

A partir del estado HEAD desasociado, podemos ejecutar `git checkout -b new_branch_without_crazy_commit`. De este modo, se creará una nueva rama llamada `new_branch_without_crazy_commit` y se cambiará a ese estado. El repositorio está ahora en un nuevo cronograma del historial en el que la confirmación `872fa7e` ya no existe. Llegados a este punto, podemos continuar trabajando en esta nueva rama en la que la confirmación `872fa7e` ya no existe y considerarla desecha. Desafortunadamente, si necesitas la rama anterior (quizás era tu rama `master`), esta estrategia para deshacer la acción no resulta adecuada. Veamos algunas otras estrategias al respecto.



##### Deshacer una confirmación pública con git revert

Supongamos que volvemos a nuestro ejemplo original del historial de confirmaciones. El historial que incluye la confirmación `872fa7e`. Esta vez vamos a probar a deshacer una acción con el comando revert. Si ejecutamos `git revert HEAD`, Git creará una nueva confirmación con lo opuesto a la última confirmación. De este modo, se añade una nueva confirmación al historial de la rama actual, que se asemejará a lo siguiente:

```
 git log --oneline e2f9a78 Revert "Try something crazy" 872fa7e Try something crazy a1e8fb5 Make some important changes to hello.txt 435b61d Create hello.txt 9773e52 Initial import
```

En este punto, técnicamente hemos vuelto a deshacer la confirmación `872fa7e`. Aunque `872fa7e` sigue encontrándose en el historial, la nueva confirmación `e2f9a78` es lo opuesto a los cambios de `872fa7e`. A diferencia de nuestra estrategia de extracción anterior, podemos seguir usando la misma rama. Esta solución permite deshacer una acción satisfactoriamente. Se trata del método ideal para trabajar con repositorios públicos compartidos. Si debes mantener un historial de Git organizado y simple, es posible que esta estrategia no resulte adecuada.



El comando `git checkout` opera sobre tres entidades distintas: archivos, confirmaciones y ramas. Además de la definición de "checkout", se utiliza habitualmente la expresión "checking out" para referirse al acto de ejecutar el comando `git checkout`. En el tema [Deshacer cambios](https://www.atlassian.com/git/tutorials/undoing-changes), explicamos cómo puede usarse `git checkout` para ver confirmaciones antiguas. El eje central de la mayor parte de este documento serán las operaciones de cambio en las ramas.

Los cambios de rama se asemejan al cambio de confirmaciones y archivos antiguos, ya que el directorio de trabajo se actualiza para reflejar la rama o revisión seleccionada. Sin embargo, los cambios nuevos se guardan en el historial del proyecto, es decir, no se trata de una operación de solo lectura.

## Cambio de rama

El comando `git checkout` te permite desplazarte entre las ramas creadas por `git branch`. Al ejecutar la operación de cambio de rama, se actualizan los archivos en el directorio de trabajo para reflejar la versión almacenada en esa rama y se indica a Git que registre todas las confirmaciones nuevas en esa rama. Puedes pensar en ello como una forma de seleccionar en qué línea de desarrollo trabajas.

Disponer de una rama específica para cada nueva función supone un cambio drástico en comparación con el flujo de trabajo tradicional de SVN. Hace que resulte ridículamente sencillo probar nuevos experimentos sin temor a arruinar las funciones existentes y permite trabajar al mismo tiempo en muchas funciones que no guardan relación entre sí. Además, las ramas facilitan varios flujos de trabajo colaborativos.

En ocasiones, el comando `git checkout` puede confundirse con `git clone`. La diferencia entre ambos comandos estriba en que el segundo extrae código de un repositorio remoto, mientras que el primero cambia entre versiones de código que ya se encuentran en el sistema local.

## Uso: ramas existentes

Asumiendo que el repositorio en el que trabajas contenga ramas preexistentes, puedes cambiar de una de estas ramas a otra con `git checkout`. Para saber qué ramas están disponibles y cuál es el nombre de la rama actual, ejecuta `git branch`.

```
 $> git branch master another_branch feature_inprogress_branch $> git checkout feature_inprogress_branch 
```

En el ejemplo anterior, se muestra cómo ver una lista de ramas disponibles mediante la ejecución del comando `git branch` y cómo cambiar a una rama específica, en este caso, la rama `feature_inprogress_branch`.

## Nuevas ramas

El comando `git checkout` va de la mano de `git branch`. El comando `git branch` permite crear una rama nueva. Si quieres empezar a trabajar en una nueva función, puedes crear una rama nueva a partir de la rama `master` con `git branch new_branch`. Una vez creada, puedes usar `git checkout new_branch` para cambiar a esa rama. Además, el comando `git checkout` acepta el argumento `-b`, que actúa como un práctico método que creará la nueva rama y cambiará a ella al instante. Puedes trabajar en varias funciones en un solo repositorio pasando de una a otra con `git checkout`.

```
git checkout -b 
```

En el ejemplo anterior, se crea la rama `` y se cambia a ella simultáneamente. La opción `-b` es un indicador muy útil que hace que Git ejecute `git branch` antes de `git checkout`.

```
git checkout -b  
```

De manera predeterminada, `git checkout -b` basará la rama `new-branch` en el `HEAD` actual. No obstante, `git checkout` puede combinarse con un parámetro opcional para ramas adicionales. En el ejemplo anterior, se añade ``, que basa `new-branch` en `existing-branch` en lugar del `HEAD` actual.

## Conmutación de ramas

El cambio o conmutación de ramas es una operación sencilla. Al ejecutar lo siguiente, el `HEAD` apuntará al extremo de `.`

```
git checkout 
```

Git realiza un seguimiento del historial de operaciones de cambio en el registro de referencia. Puedes ejecutar `git reflog` para ver el historial.

## Aplicación del comando git checkout con una rama remota

Al colaborar con un equipo, se utilizan con frecuencia repositorios remotos. Estos repositorios pueden alojarse y compartirse, o bien pueden ser una copia local de otro compañero. Cada repositorio remoto contendrá su propio conjunto de ramas. Para cambiar a una rama remota, primero tienes que extraer el contenido de la rama.

```
git fetch --all
```

En las versiones modernas de Git, puedes cambiar a la rama remota como si fuera una rama local.

```
git checkout 
```

En las versiones anteriores de Git, se debe crear una nueva rama basada en la `remote`.

```
git checkout  origin/
```

Además, puedes cambiar a una nueva rama local y restablecerla en la última confirmación de las ramas remotas.

```
 git checkout -b  git reset --hard origin/
```

## HEADS desasociados

Ahora que hemos visto los tres usos principales de `git checkout` con las ramas, es hora de analizar el estado `detached HEAD`. Recuerda que el `HEAD` es la forma en la que Git hace referencia a la instantánea actual. Internamente, el comando `git checkout` simplemente actualiza el `HEAD` para que apunte a la rama o la confirmación especificada. Cuando apunta a una rama, Git no objeta nada, pero cuando cambias a una confirmación, pasa al estado `detached HEAD`.

Se trata de una advertencia que indica que todo lo que haces está "desconectado" del resto del desarrollo de tu proyecto. Si empezaras a desarrollar una función mientras el estado fuera `detached HEAD`, no habría ninguna rama que te permitiera volver a ella. Cuando inevitablemente cambiaras a otra rama (por ejemplo, para fusionar tu función), no habría forma de hacer referencia a la función:

![img](https://wac-cdn.atlassian.com/dam/jcr:8c2753f6-5942-4ce1-8660-79a1100535ee/05%20(4).svg?cdnVersion=1278)

La cuestión es que el desarrollo siempre debe llevarse a cabo en una rama, nunca en un `HEAD` desasociado. De este modo, te aseguras de tener siempre una referencia para las nuevas confirmaciones. Sin embargo, si solo estás mirando una antigua confirmación, no importa si te encuentras en el estado `detached HEAD` o no.

## Resumen

Esta página se centra en el uso del comando `git checkout` al cambiar de una rama a otra. En resumen, cuando se emplea en las ramas, `git checkout` modifica el objetivo de la referencia `HEAD`. Puede utilizarse para crear ramas, pasar de una a otra y cambiar a ramas remotas. El comando `git checkout` es una herramienta esencial para el funcionamiento normal de Git. Se contrapone a `git merge`. Los comandos `git checkout` y `git merge` resultan fundamentales para posibilitar los `flujos de trabajo de Git`[.](https://www.atlassian.com/git/tutorials/comparing-workflows)



## GIT BRANCHING (ramas)

La creación de ramas es una función disponible en la mayoría de los sistemas de control de versiones modernos. La creación de ramas en otros sistemas de control de versiones puede tanto llevar mucho tiempo como ocupar mucho espacio de almacenamiento. En Git, las ramas son parte del proceso de desarrollo diario. Las ramas de Git son un puntero eficaz para las instantáneas de tus cambios. Cuando quieres añadir una nueva función o solucionar un error, independientemente de su tamaño, generas una nueva rama para alojar estos cambios. Esto hace que resulte más complicado que el código inestable se fusione con el código base principal, y te da la oportunidad de limpiar tu historial futuro antes de fusionarlo con la rama principal.

![Tutorial de Git: git branch](https://wac-cdn.atlassian.com/dam/jcr:746be214-eb99-462c-9319-04a4d2eeebfa/01.svg?cdnVersion=1278)

El diagrama anterior representa un repositorio con dos líneas de desarrollo aisladas, una para una función pequeña y otra para una función más extensa. Al desarrollarlas en ramas, no solo es posible trabajar con las dos de forma paralela, sino que también se evita que el código dudoso se fusione con la rama `maestra`.

La implementación que subyace a las ramas de Git es mucho más sencilla que la de otros modelos de sistemas de control de versiones. En lugar de copiar archivos entre directorios, Git almacena una rama como referencia a una confirmación. En este sentido, una rama representa el extremo de una serie de confirmaciones, es decir, no es un contenedor de confirmaciones. El historial de una rama se extrapola de las relaciones de confirmación.

Durante la lectura, recuerda que las ramas de Git no son como las ramas de SVN. Las ramas de SVN solo se usan para capturar el esfuerzo de desarrollo a gran escala ocasional, mientras que las ramas de Git son una parte integral del flujo de trabajo diario. El siguiente contenido amplía la información sobre la arquitectura interna de creación de ramas de Git.

##### Funcionamiento

Una rama representa una línea independiente de desarrollo. Las ramas sirven como una abstracción de los procesos de cambio, preparación y confirmación. Puedes concebirlas como una forma de solicitar un nuevo directorio de trabajo, un nuevo entorno de ensayo o un nuevo historial de proyecto. Las nuevas confirmaciones se registran en el historial de la rama actual, lo que crea una bifurcación en el historial del proyecto.

El comando `git branch` te permite crear, enumerar, cambiar el nombre y eliminar ramas. No te permite cambiar entre ramas o volver a unir un historial bifurcado. Por este motivo, `git branch` está estrechamente relacionado con los comandos `git checkout` y `git merge`.

##### Opciones comunes

```
rama de git
```

Enumera todas las ramas de tu repositorio. Es similar a `git branch --list.`

```
git branch 
```

Crea una nueva rama llamada ``. Este comando *no* extrae la nueva rama.

```
git branch -d 
```

Elimina la rama especificada. Esta es una operación segura, ya que Git evita que elimines la rama si tiene cambios que aún no se han fusionado.

```
git branch -D 
```

Fuerza la eliminación de la rama especificada, incluso si tiene cambios sin fusionar. Este comando lo puedes usar si quieres eliminar de forma permanente todas las confirmaciones asociadas con una línea concreta de desarrollo.

```
git branch -m 
```

Cambia el nombre de la rama actual a ``.

```
 git branch -a
```

Enumera todas las ramas remotas.

##### Creación de ramas

Es importante comprender que las ramas son solo punteros a las confirmaciones. Cuando creas una rama, todo lo que Git tiene que hacer es crear un nuevo puntero, no modifica el repositorio de ninguna otra forma. Si empiezas con un repositorio que tiene este aspecto:

![Tutorial de Git: repositorio sin ramas](https://wac-cdn.atlassian.com/dam/jcr:80aa77d2-c28f-415e-ab10-e3612456a9c1/02.svg?cdnVersion=1278)

Y, a continuación, creas una rama con el siguiente comando:

```
git branch crazy-experiment
```

El historial del repositorio no se modificará. Todo lo que necesitas es un nuevo puntero de la confirmación actual:

![Tutorial de Git: Crear una rama nueva](https://wac-cdn.atlassian.com/dam/jcr:b0e2f237-9337-4385-be22-43f623e133d0/03.svg?cdnVersion=1278)

Ten en cuenta que este comando solo *crea* la nueva rama. Para empezar a añadir confirmaciones, necesitas seleccionarla con el comando `git checkout` y, a continuación, utilizar los comandos estándar `git add` y `git commit`.

##### Creación de ramas remotas

Por ahora, todos los ejemplos han ilustrado operaciones de ramas locales. El comando `git branch` también funciona con ramas remotas. Para trabajar en ramas remotas, primero hay que configurar un repositorio remoto y añadirlo a la configuración del repositorio local.

```
 $ git remote add new-remote-repo https://bitbucket.com/user/repo.git # Añade un repositorio remoto a la configuración del repositorio local $ git push  crazy-experiment~ # Envía la rama crazy-experiment al nuevo repositorio remoto
```

Este comando enviará una copia de la rama local `crazy-experiment` al repositorio remoto `.`

##### Eliminación de ramas

Una vez que hayas terminado de trabajar en una rama y la hayas fusionado con el código base principal, puedes eliminar la rama sin perder ninguna historia:

```
git branch -d crazy-experiment
```

No obstante, si la rama no se ha fusionado, el comando anterior mostrará un mensaje de error:

```
error: The branch 'crazy-experiment' is not fully merged. If you are sure you want to delete it, run 'git branch -D crazy-experiment'.
```

Esto te protege ante la pérdida de acceso a una línea de desarrollo completa. Si realmente quieres eliminar la rama (por ejemplo, si se trata de un experimento fallido), puedes usar el indicador `-D` (en mayúscula):

```
git branch -D crazy-experiment
```

Este comando elimina la rama independientemente de su estado y sin avisos previos, así que úsalo con cuidado.

Los comandos anteriores eliminarán una copia local de la rama. La rama seguirá existiendo en el repositorio remoto. Para eliminar una rama remota, ejecuta estos comandos.

```
 git push origin --delete crazy-experiment
```

O

```
git push origin :crazy-experiment
```

Enviarán una señal de eliminación al repositorio de origen remoto que desencadena la eliminación de la rama remota `crazy-experiment`.

###### Resumen


En este documento, hemos hablado de la creación de ramas de Git y del comando `git branch`. Las funciones principales de los comandos `git branch` consisten en crear, enumerar y eliminar ramas, así como en cambiarles el nombre. Para trabajar con las ramas resultantes, el comando se suele usar con otros distintos, como `git checkout`. Obtén más información sobre las operaciones de rama de `git checkout`, como cambiar o fusionar ramas, en la página de `git checkout`.

En comparación con otros sistemas de control de versiones, las operaciones de ramas de Git son rentables y se utilizan con frecuencia. Esta flexibilidad permite una profunda personalización del [flujo de trabajo de Git](https://www.atlassian.com/git/tutorials/comparing-workflows).

#### git merge

La fusión es la forma que tiene Git de volver a unir un historial bifurcado. El comando `git merge` permite tomar las líneas independientes de desarrollo creadas por `git branch` e integrarlas en una sola rama.

Ten en cuenta que todos los comandos presentados a continuación se fusionan en la rama actual. La rama actual se actualizará para reflejar la fusión, pero la rama de destino no se verá afectada en absoluto. Una vez más, esto significa que `git merge` se suele utilizar junto con `git checkout` para seleccionar la rama actual y `git branch -d` para eliminar la rama de destino obsoleta.

##### Funcionamiento

`git merge` combinará varias secuencias de confirmaciones en un historial unificado. En los casos de uso más frecuentes, `git merge` se utiliza para combinar dos ramas. Los ejemplos siguientes del presente documento se centrarán en este patrón de fusión de ramas. En estos casos, `git merge` toma dos punteros de confirmación, normalmente los extremos de la rama, y encuentra una confirmación base común entre ellos. Una vez que Git encuentra una confirmación base, crea una "confirmación de fusión" nueva que combina los cambios de cada secuencia de confirmación de fusión puesta en cola.

Supongamos que tenemos una rama de funcionalidad nueva que se basa en la rama `master`. Ahora, queremos fusionar esa rama de funcionalidad con la `master`.

![img](https://wac-cdn.atlassian.com/dam/jcr:86eba9ec-9391-45ea-800a-948cec1f2ed7/Branch-2.png?cdnVersion=1278)

Al invocar este comando, la rama de funcionalidad especificada se fusionará con la rama actual, la cual asumiremos que es la `master`. Git determinará el algoritmo de fusión automáticamente (véase más adelante).

![img](https://wac-cdn.atlassian.com/dam/jcr:83323200-3c57-4c29-9b7e-e67e98745427/Branch-1.png?cdnVersion=1278)

Las confirmaciones de fusión son únicas con respecto a otras confirmaciones en el hecho de que tienen dos confirmaciones principales. Al crear una confirmación de fusión, Git tratará de fusionar automáticamente los historiales independientes. Sin embargo, si encuentra datos que se han cambiado en ambos historiales, no podrá combinarlos de ese modo. En ese caso, se crea un conflicto de control de versiones y Git solicitará la intervención del usuario para poder continuar.

##### Preparación para fusionar

Antes de ejecutar una fusión, hay un par de pasos de preparación que llevar a cabo con el fin de garantizar que la fusión se realice sin problemas.

##### Confirmación de la rama de recepción

Ejecuta `git status`para asegurarte de que `HEAD` apunta a la rama de fusión-recepción correcta. En caso necesario, ejecuta `git checkout` para cambiar a la rama de recepción. En nuestro caso, ejecutaremos `git checkout master.`

##### Recuperación de las últimas confirmaciones remotas

Asegúrate de que la rama de recepción y la rama de fusión están actualizadas con los últimos cambios remotos. Ejecuta `git fetch` para extraer las últimas confirmaciones remotas. Una vez que la recuperación se haya completado, asegúrate de que la rama `master` tenga las últimas actualizaciones mediante la ejecución del comando `git pull`.

##### Fusión

Una vez adoptados los pasos comentados anteriormente de "preparación para la fusión", es posible iniciar una fusión mediante la ejecución de `git merge` donde `` es el nombre de la rama que se fusionará con la rama de recepción.

##### Fusión con avance rápido

Puede que se produzca una fusión con avance rápido cuando hay un proceso lineal desde el extremo de la rama actual hasta la rama de destino. En lugar de fusionar “realmente” las ramas, todo lo que Git tiene que hacer para integrar los historiales es mover (es decir, realizar un “avance rápido”) el extremo de la rama actual al extremo de la rama de destino. De este modo, combina de manera eficaz los historiales, ya que todas las confirmaciones alcanzables desde la rama de destino están ahora disponibles a través de la rama actual. Por ejemplo, una fusión con avance rápido de alguna rama de funcionalidad en una `master` se vería de la siguiente manera:

![img](https://wac-cdn.atlassian.com/dam/jcr:b87df050-2a3a-4f17-bb80-43c5217b4947/07%20(1).svg?cdnVersion=1278)



Sin embargo, no es posible una fusión con avance rápido si las ramas han divergido. Cuando no hay un proceso lineal hacia la rama de destino, Git no tiene más opción que combinarlas mediante una fusión de 3 vías. Las fusiones de 3 vías utilizan una confirmación específica para unir dos historiales. Esta fusión recibe su nombre del hecho de que Git utiliza tres confirmaciones para generar la confirmación de fusión: los dos extremos de la rama y su predecesor común.

![img](https://wac-cdn.atlassian.com/dam/jcr:91b1bdf5-fda3-4d20-b108-0bb9eea402b2/08.svg?cdnVersion=1278)


Aunque se pueden utilizar cualquiera de estas estrategias de fusión, a muchos desarrolladores les gusta utilizar las fusiones con avance rápido (facilitadas a través del comando [rebasing](https://www.atlassian.com/es/git/tutorials/rewriting-history/git-rebase)) para funcionalidades pequeñas o correcciones de errores, mientras que se reservan las fusiones de 3 vías para la integración de funcionalidades con una ejecución de mayor duración. En este último caso, la confirmación de fusión resultante sirve como una unión simbólica de las dos ramas.

Nuestro primer ejemplo muestra una fusión con avance rápido. El código a continuación crea una rama nueva, le añade dos confirmaciones y, seguidamente, la integra en la línea principal con una fusión con avance rápido.

```
 # Start a new feature git checkout -b new-feature master # Edit some files git add  git commit -m "Start a feature" # Edit some files git add  git commit -m "Finish a feature" # Merge in the new-feature branch git checkout master git merge new-feature git branch -d new-feature 
```

Se trata de un flujo de trabajo común para las ramas temáticas transitorias que se utilizan más como un desarrollo aislado que como una herramienta de organización para funcionalidades con una ejecución de mayor duración.

Ten en cuenta también que Git no debería quejarse sobre el comando `git branch -d`, ya que ahora es posible acceder a la funcionalidad nueva desde la rama maestra.

En caso de necesitar una confirmación de fusión durante una fusión con avance rápido para mantener registros, es posible ejecutar `git merge` con la opción `--no-ff`.

```
 git merge --no-ff  
```

Este comando fusiona la rama especificada en la rama actual, pero siempre genera una confirmación de fusión (incluso si se trata de una fusión con avance rápido). Esto resulta útil para documentar todas las fusiones que tienen lugar en tu repositorio.

##### Fusión de 3 vías

El siguiente ejemplo es muy similar, pero requiere una fusión de 3 vías porque la rama `master` avanza mientras la funcionalidad está en curso. Este es un caso habitual con funcionalidades grandes o cuando hay varios desarrolladores trabajando en un proyecto simultáneamente.

```
 Start a new feature git checkout -b new-feature master # Edit some files git add  git commit -m "Start a feature" # Edit some files git add  git commit -m "Finish a feature" # Develop the master branch git checkout master # Edit some files git add  git commit -m "Make some super-stable changes to master" # Merge in the new-feature branch git merge new-feature git branch -d new-feature
```

Ten en cuenta que es imposible que Git lleve a cabo una fusión con avance rápido, ya que no hay forma de mover la rama `master` a la de `new-feature` sin retroceder.

Para la mayoría de los flujos de trabajo, la rama de `new-feature` sería mucho más grande y tardaría mucho más tiempo en desarrollarse, por lo que, mientras tanto, las nuevas confirmaciones aparecerían en la rama `master`. Si tu rama de funcionalidad fuera en realidad tan pequeña como la del ejemplo anterior, probablemente sería mejor que la cambiases de base a la rama `master` haciendo una fusión con avance rápido. Esto evitaría que confirmaciones de fusión superfluas desordenasen el historial del proyecto.

##### Resolución de conflicto

Si las dos ramas que tratas de fusionar han cambiado la misma parte del mismo archivo, Git no podrá averiguar qué versión utilizar. Cuando esto ocurre, Git se detiene justo antes de la confirmación de fusión para que puedas resolver los conflictos manualmente.

La mayor parte del proceso de fusión de Git consiste en utilizar el conocido flujo de trabajo de edición, preparación y confirmación para resolver los conflictos de fusión. Cuando se observa un conflicto de fusión, la ejecución del comando `git status` muestra qué archivos se deben resolver. Por ejemplo, si se modificaron ambas ramas en la misma sección de `hello.py`, se vería algo parecido a esto:

```
 On branch master Unmerged paths: (use "git add/rm ..." as appropriate to mark resolution) both modified: hello.py 
```

##### Cómo se presentan los conflictos

Cuando Git se encuentra un conflicto durante una fusión, editará el contenido de los archivos afectados con indicadores visuales que marquen ambos extremos del contenido conflictivo. Estos marcadores visuales son: <<<<<<<, ======= y >>>>>>>. Es útil buscar un proyecto para estos indicadores durante una fusión con el fin de encontrar dónde hay que resolver los conflictos.

```
 here is some content not affected by the conflict <<<<<<< master this is conflicted text from master ======= this is conflicted text from feature branch >>>>>>> feature branch;
```

Normalmente, el contenido que se encuentra delante del marcador `=======` es la rama de recepción y el de la parte de detrás es la rama de fusión.

Una vez identificadas las secciones conflictivas, puedes entrar y arreglar la fusión a tu gusto. Cuando estés listo para terminar la fusión, todo lo que tienes que hacer es ejecutar `git add` en los archivos conflictivos para indicar a Git que se han resuelto. Seguidamente, ejecutas un `git commit` normal para generar la confirmación de fusión. El proceso es exactamente el mismo que el de la confirmación de una captura normal, lo que significa que es fácil para los desarrolladores habituales gestionar sus propias fusiones.

Ten en cuenta que los conflictos de fusión solo se producirán en el caso de una fusión de 3 vías. Los cambios conflictivos en una fusión de avance rápido no son posibles.

###### Resumen

Este documento es un resumen del comando `git merge`. La fusión es un proceso esencial cuando se trabaja con Git. Hemos hablado de los mecanismos internos que hay detrás de una fusión y de las diferencias entre una fusión con avance rápido y una de 3 vías auténtica. Algunas de las principales conclusiones son:

1. La fusión de Git combina secuencias de confirmaciones en un historial unificado de confirmaciones.
2. Hay dos formas principales en las que Git puede fusionar: fusión con avance rápido y fusión de 3 vías.
3. Git puede fusionar confirmaciones automáticamente a menos que haya cambios que generen conflictos en ambas secuencias de confirmaciones.

Este documento ha integrado y hecho referencia a otros comandos de Git como: `git branch`, `git pull` y `git fetch`.



#### Conflictos de Git merge

Los sistemas de control de versiones consisten en gestionar contribuciones entre múltiples autores distribuidos (normalmente desarrolladores). A veces múltiples desarrolladores podrían intentar editar el mismo contenido. Si el desarrollador A intenta editar código que el desarrollador B está editando, podría producirse un conflicto. Para evitar la ocurrencia de conflictos, los desarrolladores trabajarán en [ramas aisladas](https://www.atlassian.com/es/git/tutorials/using-branches) separadas. La función principal del comando `git merge` es combinar ramas separadas y resolver las ediciones conflictivas.

##### Análisis de los conflictos de fusión

La fusión y los conflictos son una parte común de la experiencia de Git. Los conflictos en otras herramientas de control de versiones como SVN pueden ser costosos y hacernos perder mucho tiempo. Con Git, la fusión es coser y cantar. La mayor parte del tiempo Git se las ingeniará para integrar automáticamente los nuevos cambios.

Normalmente los conflictos surgen cuando dos personas han cambiado las mismas líneas de un archivo o si un desarrollador ha eliminado un archivo mientras otro lo estaba modificando. En estos casos, Git no puede determinar automáticamente qué es correcto. Los conflictos solo afectan al desarrollador que realiza la fusión, el resto del equipo no se entera del conflicto. Git marcará el archivo como que tiene un conflicto y detendrá el proceso de fusión. Entonces el desarrollador es el responsable de resolver el conflicto.

##### Tipos de conflictos de fusión

Una fusión puede entrar en un estado conflictivo en dos momentos diferentes. Al inicio y durante un proceso de fusión. A continuación, se explica cómo abordar cada uno de estos escenarios de conflicto.

###### Git no inicia la fusión

Una fusión no se iniciará cuando Git detecte que hay cambios en el directorio de trabajo o el entorno de ensayo del proyecto actual. Git no inicia la fusión, porque las confirmaciones que se están fusionando podrían sobrescribir estos cambios pendientes. Cuando esto sucede, no se debe a conflictos con otros desarrolladores, sino con cambios locales pendientes. El estado local tendrá que estabilizarse mediante `git stash`, `git checkout`, `git commit` o `git reset`. Un fallo de fusión durante el inicio provocará que aparezca el siguiente mensaje de error:

```
error: Entry '<fileName>' not uptodate. Cannot merge. (Changes in working directory)
```

###### Git falla durante la fusión

Un fallo DURANTE una fusión indica un conflicto entre la rama local actual y la rama que se está fusionando. Esto indica un conflicto con el código de otro desarrollador. Git hará lo posible para fusionar los archivos, pero te dejará cosas para que las resuelvas manualmente en los archivos con conflictos. Un fallo a la mitad de la fusión provocará que aparezca el siguiente mensaje de error:

```
error: Entry '<fileName>' would be overwritten by merge. Cannot merge. (Changes in staging area)
```

###### Creación de un conflicto de fusión

Para familiarizarte de verdad con los conflictos de fusión, en la siguiente sección se simulará un conflicto para examinarlo y resolverlo posteriormente. Para el ejemplo, se utilizará una interfaz Git de línea de comandos similar a Unix para ejecutar la simulación del ejemplo.

```
$ mkdir git-merge-test
$ cd git-merge-test
$ git init .
$ echo "this is some content to mess with" > merge.txt
$ git add merge.txt
$ git commit -am"we are commiting the inital content"
[master (root-commit) d48e74c] we are commiting the inital content
1 file changed, 1 insertion(+)
create mode 100644 merge.txt
```

Este ejemplo de código ejecuta una secuencia de comandos que realiza lo siguiente.

- Crea un nuevo directorio llamado `git-merge-test,` se cambia a ese directorio y lo inicia como nuevo repositorio de Git.
- Crea un nuevo archivo de texto `merge.txt` con algo de contenido en él.
- Añade `merge.txt` al repositorio y lo confirma.

Ahora tenemos un nuevo repositorio con una rama `master` y un archivo `merge.txt` con contenido en él. A continuación, crearemos una nueva rama para utilizarla como fusión conflictiva.

```
$ git checkout -b new_branch_to_merge_later
$ echo "totally different content to merge later" > merge.txt
$ git commit -am"edited the content of merge.txt to cause a conflict"
[new_branch_to_merge_later 6282319] edited the content of merge.txt to cause a conflict
1 file changed, 1 insertion(+), 1 deletion(-)
```

La siguiente secuencia de comandos logra lo siguiente:

- crea y verifica una nueva rama llamada `new_branch_to_merge_later`
- sobrescribe el contenido de `merge.txt`
- confirma el nuevo contenido

Con esta nueva rama `new_branch_to_merge_later`, hemos creado una confirmación que sobrescribe el contenido de `merge.txt`

```
git checkout master
Switched to branch 'master'
echo "content to append" >> merge.txt
git commit -am"appended content to merge.txt"
[master 24fbe3c] appended content to merge.tx
1 file changed, 1 insertion(+)
```

Esta cadena de comandos verifica la rama `master`, añade contenido a `merge.txt` y lo confirma. Esto ahora pone nuestro repositorio de ejemplo en un estado en el que tenemos 2 nuevas confirmaciones. Una en la rama `master` y otra en la rama `new_branch_to_merge_later`. En este momento, vamos a hacer `git merge en new_branch_to_merge_later` y vemos qué pasa.

```
$ git merge new_branch_to_merge_later
Auto-merging merge.txt
CONFLICT (content): Merge conflict in merge.txt
Automatic merge failed; fix conflicts and then commit the result.
```

¡BUM! 💥 Surge un conflicto. ¡Gracias por avisarnos, Git!

###### Cómo identificar conflictos de fusión

Tal y como hemos visto en el ejemplo anterior, Git generará un resultado descriptivo para indicarnos que se ha producido un CONFLICTO. Podemos obtener más información ejecutando el comando `git status`.

```
$ git status
On branch master
You have unmerged paths.
(fix conflicts and run "git commit")
(use "git merge --abort" to abort the merge)

Unmerged paths:
(use "git add <file>..." to mark resolution)

both modified:   merge.txt
```

El resultado de `git status` indica que hay caminos sin fusionar debido a un conflicto. El archivo `merge.text` ahora aparece con el estado modificado. Vamos a examinar el archivo y ver lo que se ha modificado.

```
$ cat merge.txt
<<<<<<< HEAD
this is some content to mess with
content to append
=======
totally different content to merge later
>>>>>>> new_branch_to_merge_later
```

Aquí hemos usado el comando `cat` para mostrar el contenido del archivo `merge.txt`. Podemos ver algunas nuevas adiciones extrañas:

- `<<<<<<< HEAD`
- `=======`
- `>>>>>>> new_branch_to_merge_later`

Considera estas nuevas líneas como "divisorias de conflictos". La línea `=======` es el "centro" del conflicto. Todo el contenido entre el centro y la línea `<<<<<<< HEAD` es contenido que existe en la rama actual maestra a la que apunta la referencia `HEAD`. De manera alternativa, todo el contenido entre el centro y `>>>>>>> new_branch_to_merge_later` es contenido que está presente en nuestra rama de fusión.

##### Cómo resolver conflictos de fusión mediante la línea de comandos

La forma más directa de resolver un conflicto de fusión es editar el archivo conflictivo. Abre el archivo `merge.txt` en tu editor favorito. Para nuestro ejemplo, simplemente vamos a eliminar todas las líneas divisorias de conflictos. El contenido de `merge.txt` modificado tendrá entonces este aspecto:

```
this is some content to mess with
content to append
totally different content to merge later
```

Una vez que el archivo se ha editado, utiliza `git add merge.txt` para organizar el nuevo contenido fusionado. Para finalizar la fusión, crea una nueva confirmación ejecutando lo siguiente:

```
git commit -m "merged and resolved the conflict in merge.txt"
```

Git verá que se ha resuelto el conflicto y crea una nueva confirmación de fusión para finalizar la fusión.

##### Comandos de Git que pueden ayudar a resolver los conflictos de fusión

###### Herramientas generales

```
git status
```

El comando status se utiliza frecuentemente cuando se trabaja con Git y durante una fusión ayudará a identificar los archivos con conflictos.

```
git log --merge
```

Al pasar el argumento `--merge` al comando `git log`, se creará un registro con una lista de confirmaciones que entran en conflicto entre las ramas que se van a fusionar.

```
git diff
```

`diff` ayuda a encontrar diferencias entre los estados de un repositorio/unos archivos. Esto es útil para predecir y evitar conflictos de fusión.

###### Herramientas para cuando git no puede iniciar una fusión

```
git checkout
```

`checkout` puede utilizarse para *deshacer* los cambios a archivos o para cambiar ramas.

```
git reset --mixed
```

`reset` puede utilizarse para deshacer cambios en el directorio de trabajo y el entorno de ensayo.

###### Herramientas para cuando surgen conflictos de git durante una fusión

```
git merge --abort
```

Si se ejecuta `git merge` con la opción `--abort`, se saldrá del proceso de fusión y volverá a poner la rama en el estado que tenía antes de que empezara la fusión.

```
git reset
```

`Git reset` puede utilizarse durante un conflicto de fusión para restablecer los archivos conflictivos a un estado que se sabe que es bueno.

##### Resumen

Los conflictos de fusión pueden ser una experiencia intimidatoria. Por suerte, Git ofrece herramientas potentes para ayudar a navegar y resolver conflictos. Git puede ocuparse de la mayoría de las fusiones por sí mismo con funciones de fusión automáticas. Surge un conflicto cuando dos ramas independientes han editado la misma línea de un archivo o cuando un archivo se ha eliminado en una rama, pero editado en la otra. Lo más probable es que los conflictos se produzcan cuando se trabaja en un entorno de equipo.

Hay muchas herramientas para resolver los conflictos de fusión. Git tiene muchas herramientas de líneas de comandos que hemos explicado aquí. Para obtener información más detallada sobre estas herramientas, visita las páginas individuales de `git log`, `git reset`, `git status`, `git checkout` y `git reset`.

# Opciones y ejemplos de estrategias de Git Merge

Cuando se ha finalizado y probado un elemento de trabajo, y está listo para volver a fusionarse en la línea principal de desarrollo, tu equipo tiene que tomar algunas decisiones con respecto a la política. ¿Cuáles son las opciones de estrategia de fusión? En este artículo examinaremos las posibilidades y ofreceremos algunas notas sobre cómo funciona Atlassian. Esperamos que al acabar dispongas de las herramientas necesarias para decidir qué es lo más adecuado para tu equipo.

## Estrategias de Git merge

La fusión se produce al combinarse dos ramas. Git tomará dos (o más) punteros de confirmación y tratará de encontrar una confirmación de base común entre ellos. Git cuenta con distintos métodos para encontrar una confirmación de base. A estos métodos se les denomina "estrategias de fusión". En cuanto Git encuentre una confirmación de base común, creará una nueva "confirmación de fusión" que combine los cambios de las confirmaciones de fusión especificadas. Técnicamente, una confirmación de fusión es una confirmación que tiene dos confirmaciones principales.

![img](https://wac-cdn.atlassian.com/dam/jcr:2d3aef7f-6e1d-4e39-a5a5-97dd7714fdd2/what-is-a-merge.gif?cdnVersion=1278)

`git merge` seleccionará de forma automática una estrategia de fusión a menos que se especifique explícitamente. En los comandos `git merge` y `git pull` se puede utilizar una opción (estrategia) `-s`. La opción `-s` se puede adjuntar al nombre de la estrategia de fusión que desee. Si no se especifica de forma explícita, Git seleccionará la estrategia de fusión más adecuada en función de las ramas proporcionadas. A continuación, encontrarás una lista de las estrategias de fusión disponibles.

### Recursive

```
git merge -s recursive branch1 branch2
```

Esta estrategia actúa en dos heads. Recursive es la estrategia de fusión predeterminada a la hora de incorporar cambios de una rama o fusionarla. Además, permite detectar y manejar fusiones que implican cambios de nombre, aunque actualmente no puede usar copias detectadas. Se trata de la estrategia de fusión predeterminada a la hora de incorporar cambios de una rama o fusionarla.

### Resolución

```
git merge -s resolve branch1 branch2
```

Esta estrategia solo permite resolver dos heads usando un algoritmo de fusión a 3 vías. Trata de detectar minuciosamente las ambigüedades de fusión entrecruzada y se la suele considerar una estrategia segura y rápida.

### Octopus

```
git merge -s octopus branch1 branch2 branch3 branchN
```

Se trata de la estrategia de fusión predeterminada para más de dos heads. Cuando te mueves por más de una rama, Octopus se activa automáticamente. Si una fusión tiene conflictos que requieren una resolución manual, Octopus rechazará el intento de fusión. Se utiliza principalmente para agrupar heads de rama de función similares.

### Ours

```
git merge -s ours branch1 branch2 branchN
```

Esta estrategia actúa en varios números N de ramas. El resultado de la fusión de salida es siempre el del `HEAD` de la rama actual. El término "ours" implica la preferencia ignorando efectivamente los cambios de todas las demás ramas. Se ha diseñado para su uso en la combinación del historial de ramas de funciones similares.

### Subtree

```
git merge -s subtree branchA branchB
```

Se trata de una extensión de la estrategia recursiva. Al fusionar A y B, si B es un subárbol secundario de A, B se actualiza en primer lugar para reflejar la estructura de árbol de A. Esta actualización también se realiza en el árbol antecesor común compartido entre A y B.

## Tipos de estrategias de Git Merge

### Fusiones explícitas

Las fusiones explícitas son el tipo de fusión predeterminado. La parte "explícita" es que crean una nueva confirmación de fusión. Esto altera el historial de confirmaciones y muestra explícitamente la ubicación en la que se ha ejecutado la fusión. El contenido de confirmación de fusión también es explícito en el hecho de que muestra cuáles eran las confirmaciones principales en la confirmación de fusión. Algunos equipos evitan las fusiones explícitas porque podría decirse que las confirmaciones de fusión añaden "ruido" al historial del proyecto.

### Fusión implícita mediante reorganización o fusión de avance rápido

Mientras que las fusiones explícitas crean una confirmación de fusión, las implícitas, no. Una fusión implícita toma una serie de confirmaciones de un head de rama específico y las aplica a la parte superior de una rama de destino. Las fusiones implícitas se activan mediante [eventos de reorganización](https://www.atlassian.com/es/git/tutorials/rewriting-history/git-rebase) o [fusiones de avance rápido](https://www.atlassian.com/es/git/tutorials/using-branches/git-merge). Una fusión implícita es una selección ad hoc de confirmaciones de una rama específica.

### Combinación al fusionar (normalmente, sin fusión explícita)

La combinación es otro tipo de fusión implícita. Se puede realizar una combinación durante una [reorganización interactiva](https://www.atlassian.com/es/git/tutorials/rewriting-history/git-rebase). Una fusión de combinación tomará las confirmaciones de una rama de destino y las combinará o les aplicará el comando squash en una sola confirmación. Dicha confirmación se añade al `HEAD` de la rama base de la fusión. Esta estrategia se suele usar para mantener un "historial limpio" durante una fusión. La rama de fusión de destino puede tener un historial detallado de confirmaciones frecuentes. Cuando se combinan y se fusionan, el historial de confirmaciones de las ramas de destino pasa a ser una "confirmación de rama" combinada singular. Esta técnica resulta útil con los `flujos de trabajo de Git` que utilizan ramas de función.

## Opciones de la estrategia "recursive" de Git Merge

La estrategia "recursive" presentada anteriormente cuenta con su propio subconjunto de opciones de funcionamiento adicionales.

```
ours
```

No debe confundirse con la estrategia de fusión "ours". Al favorecer nuestra versión ("ours"), los conflictos no se resuelven automáticamente de forma correcta. Los cambios de la otra parte ("theirs") se incorporan automáticamente si no entran en conflicto.

```
theirs
```

Se trata de la estrategia opuesta a "ours". La opción "theirs" favorece el árbol de fusión externa en la resolución del conflicto.

```
patience
```

Esta opción emplea más tiempo para evitar fusiones incorrectas en líneas coincidentes sin importancia. Esta opción se utilizará preferentemente cuando las ramas que se van a fusionar son muy divergentes.

```
diff-algorithim
```

Esta opción permite especificar un algoritmo explícito de diferencia. Los algoritmos de diferencia son comunes a los del comando `git diff`.

```
ignore-*

    ignore-space-change
    ignore-all-space
    ignore-space-at-eol
    ignore-cr-at-eol
```

Un conjunto de opciones que se dirigen a los caracteres de espacios en blanco. Se ignorará cualquier línea que coincida con el subconjunto de la opción usada.

```
renormalize
```

Esta opción realiza comprobaciones de entrada y salida en los tres árboles de Git al resolver una fusión tripartita. Esta opción está diseñada para usarse en la fusión de ramas con estados de `checkin`/`checkout` diferentes.

```
no-normalize
```

Deshabilita la opción "renormalize". Sustituye la variable de configuración `merge.renormalize`.

```
no-renames
```

Esta opción ignorará los archivos a los que se les ha cambiado el nombre durante la fusión.

```
find-renames=n
```

Este es el comportamiento predeterminado. La fusión "recursive" respetará los cambios de nombre de archivo. El parámetro `n` se puede usar para utilizar un umbral de similitud en el cambio de nombre. El valor predeterminado de `n` es `100 %.`

```
subtree
```

Esta opción se toma prestada de la estrategia "subtree". Mientras que la estrategia actúa en dos árboles y modifica cómo hacer que coincidan en un antecesor compartido, esta opción actúa en los metadatos de ruta del árbol para hacerlos coincidir.





# Comparar workflows



Un flujo de trabajo de Git es una fórmula o una recomendación acerca del uso de Git para realizar trabajo de forma uniforme y productiva. Los flujos de trabajo de Git animan a los usuarios a sacar partido a Git de forma eficaz y estable. Git ofrece a los usuarios una amplia flexibilidad de gestión de cambios. Dado que Git se centra en la flexibilidad, no existe un proceso estandarizado acerca de cómo interactuar con Git. Cuando se trabaja con un equipo en un proyecto gestionado por Git, es importante asegurarse de que el equipo está de acuerdo con cómo se va a aplicar el flujo de cambios Para garantizar que todo el equipo se encuentra en sintonía, se debe desarrollar o seleccionar un flujo de trabajo de Git. Hay varios flujos de trabajo de Git publicados que pueden ser adecuados para tu equipo. Aquí hablaremos sobre algunas de estas opciones de flujo de trabajo.

La gama de flujos de trabajos posibles hace que resulte complicado saber por dónde hay que empezar a implementar Git en el lugar de trabajo. En esta página proporcionamos un punto de partida, ya que ofrecemos un análisis de los flujos de trabajo más habituales entre los equipos de software.

Ten en cuenta que estos flujos de trabajo se han diseñado a modo orientativo, en lugar de para usarlos como reglas concretas. Queremos mostrarte las posibilidades, de forma que puedas combinar y mezclar aspectos de distintos flujos de trabajo que respondan a tus necesidades.

## ¿Qué es un flujo de trabajo de Git exitoso?

Cuando evalúas un flujo de trabajo para tu equipo, lo más importante es que tengas en cuenta la cultura de tu equipo. Quieres que el flujo de trabajo mejore la eficacia de tu equipo, no que sea una carga que limite la productividad. Estas son algunas cosas que debes tener en cuenta a la hora de evaluar un flujo de trabajo de Git:

- ¿Este flujo de trabajo se escala con el tamaño del equipo?
- ¿Es fácil deshacer los errores y los fallos con este flujo de trabajo?
- ¿Este flujo de trabajo impone excesos cognitivos sobre el equipo?

## Flujo de trabajo centralizado

![git workflow | Central and local repositories](https://wac-cdn.atlassian.com/dam/jcr:0869c664-5bc1-4bf2-bef0-12f3814b3187/01.svg?cdnVersion=1278)

El flujo de trabajo centralizado es un flujo de trabajo de Git estupendo para equipos que están realizando la migración desde SVN. Al igual que Subversion, el flujo de trabajo centralizado usa un repositorio central como punto de entrada de todos los cambios al proyecto. En lugar de `trunk`, la rama de desarrollo predeterminada se llama `master`, y todos los cambios se confirman en dicha rama. Este flujo de trabajo no requiere más ramas que `master`.

La migración a un sistema de control de versiones distribuido puede parecer una tarea complicada, pero no tienes que cambiar tu flujo de trabajo existente para sacarle partido a Git. Tu equipo puede desarrollar proyectos del mismo modo en el que lo hacían con Subversion.

No obstante, usar Git para impulsar tu flujo de trabajo de desarrollo presenta algunas ventajas en comparación con SVN. En primer lugar, le brinda a cada desarrollador su propia copia local del proyecto completo. Este entorno aislado deja que cada desarrollador trabaje de forma independiente a todos los demás cambios de un proyecto; pueden añadir confirmaciones a su repositorio local y olvidarse por completo de los desarrollos posteriores hasta que los necesiten.

En segundo lugar, te proporciona acceso al sólido modelo de fusión y creación de ramas de Git. Al contrario que SVN, las ramas de Git se han diseñado para constituir un mecanismo de seguridad de integración de código y uso compartido de cambios entre repositorios. El flujo de trabajo centralizado es similar a otros flujos de trabajo en lo que respecta al uso de un repositorio remoto alojado en servidor al que los desarrolladores pueden realizar envíos e incorporar cambios. En comparación con otros flujos de trabajo, el flujo de trabajo centralizado no tiene solicitudes de incorporación de cambios o patrones de bifurcación. Un flujo de trabajo centralizado suele ser más adecuado para equipos que migran desde SVN a Git y otros de tamaño reducido.

## Funcionamiento

Los desarrolladores empiezan por clonar el repositorio central. En sus propias copias locales del proyecto, editan archivos y confirman cambios como lo harían en SVN; no obstante, estas nuevas confirmaciones se almacenan de forma local, completamente aisladas del repositorio central. Esto permite que los desarrolladores aplacen la sincronización con los niveles superiores hasta que realicen una pausa.

Para publicar cambios en el proyecto oficial, los desarrolladores "envían" su rama `master` local al repositorio central. Este proceso es equivalente a `svn commit`, excepto porque añade todas las confirmaciones locales que no se han enviado todavía a una rama `master`.

### Incialización del repositorio central

![Git Workflow: Initialize Central Bare Repository](https://wac-cdn.atlassian.com/dam/jcr:f03a0fbd-a880-477f-aa32-33340383ce07/02%20(3).svg?cdnVersion=1278)

En primer lugar, hace falta crear el repositorio central en un servidor. Si se trata de un proyecto nuevo, puedes inicializar un repositorio vacío. Si no es así, tendrás que importar un repositorio Git o SVN existente.

Los repositorios centrales deben ser siempre bare (vacíos, es decir, sin ningún directorio en funcionamiento), que se pueden crear de esta forma:

```
ssh user@host git init --bare /path/to/repo.git
```

Asegúrate de utilizar un nombre de usuario de SSH válido en `user`, el dominio o la dirección IP de tu servidor en `host` y la ubicación en la que quieres almacenar el repositorio en `/path/to/repo.git`. Ten en cuenta que la extensión `.git` se sueñe añadir al nombre del repositorio para indicar que es un repositorio bare (vacío).

### Repositorios centrales alojados

Los repositorios centrales se suelen crear mediante servicios de alojamiento de Git de terceros, como [Bitbucket Cloud](https://bitbucket.org/product) o [Bitbucket Server](https://bitbucket.org/product/enterprise). El servicio de alojamiento realiza el proceso de inicializar un repositorio bare (vacío) que se ha explicado anteriormente en tu lugar. A continuación, dicho servicio de alojamiento proporcionará una dirección para acceder al repositorio central desde tu repositorio local.

### Clonación del repositorio central

El siguiente desarrollador crea una copia local de todo el proyecto. Esto se consigue mediante el comando `git clone`:

```
git clone ssh://user@host/path/to/repo.git
```

Cuando clonas un repositorio, Git añade automáticamente un atajo de teclado llamado `origin` que apunta al repositorio principal, ya que asume que querrás interactuar con él más adelante.

### Aplicación de cambios y confirmaciones

Cuando el repositorio se clona de forma local, el desarrollador puede aplicar cambios mediante el proceso de confirmación estándar de Git: editar, preparar y confirmar. Si no te has familiarizado con el entorno de ensayo, debes saber que consiste en una forma de preparar una confirmación sin tener que incluir todos los cambios del directorio en funcionamiento. Esto te permite crear confirmaciones con un enfoque muy claro, incluso si has aplicado muchos cambios locales.

```
git status # Muestra el estado del repositorio git add  # Prepara un archivo git commit # Confirma un archivo
```

Recuerda que, como estos comandos crean confirmaciones locales, John puede repetir el proceso todas las veces que quiera sin tener que preocuparse por lo que esté sucediendo en el repositorio central. Esta característica puede resultar muy útil para funciones de gran tamaño que se tienen que desglosar en bloques más sencillos y reducidos.

### Envío de nuevas confirmaciones al repositorio central

Una vez que se hayan aplicado cambios nuevos al repositorio local, se deberán enviar estos cambios para compartirlos con otros desarrolladores del proyecto.

```
git push origin master
```

Este comando enviará los nuevos cambios confirmados al repositorio central. Cuando envías cambios al repositorio central, es posible que las actualizaciones enviadas anteriormente por otros desarrolladores contengan código que entra en conflicto con las actualizaciones que tú quieres enviar. Git mostrará un mensaje en el que se indica este problema. En esta situación, tendrá que ejecutarse el comando `git pull` en primer lugar. Esta situación de conflicto se explica en profundidad en la sección siguiente.

### Gestión de conflictos

El repositorio central representa el proyecto oficial, por lo que su historial de confirmación se debe tratar como algo sagrado e inmutable. Si las confirmaciones locales de un desarrollador difieren de las del repositorio central, Git rechazará el envío de cambios porque estos sobrescribirían las confirmaciones oficiales.

![Git Workflows: Managing conflicts](https://wac-cdn.atlassian.com/dam/jcr:d06191e3-994e-453a-8ea9-a2e93374e53e/03%20(4).svg?cdnVersion=1278)

Antes de que el desarrollador pueda publicar una función, tiene que buscar y actualizar las confirmaciones centrales y reorganizar los cambios a partir de ellas. Es como decir "quiero añadir mis cambios a lo que los demás ya han hecho". El resultado es un historial perfectamente lineal, como las de los flujos de trabajo de SVN tradicionales.

Si los cambios locales entran en conflicto directo con las confirmaciones en niveles superiores, Git pondrá en pausa el proceso de modificación de bases y te dará la oportunidad de resolver los conflictos de forma manual. Lo bueno de Git es que usa los mismos comandos, `git status` y `git add`, tanto para generar confirmaciones como para resolver conflictos de fusión. Esto hace que a los nuevos desarrolladores les resulte sencillo gestionar sus propias fusiones. Además, si tienen problemas, Git hace que sea muy fácil abandonar por completo la reorganización y volver a intentarlo (o ir a pedir ayuda).

## Ejemplo

Veamos un ejemplo general sobre cómo un equipo que suele ser pequeño puede colaborar mediante este flujo de trabajo. Hemos visto como dos desarrolladores, John y Mary, pueden trabajar en funciones separadas y compartir sus contribuciones mediante un repositorio centralizado.

### John trabaja en su función

![Git Workflows: Edit Stage Commit Feature Process](https://wac-cdn.atlassian.com/dam/jcr:76bfc199-100a-4ef7-b9cf-86179ea5507c/06%20(2).svg?cdnVersion=1278)

En este repositorio local, John puede desarrollar funciones mediante el proceso de confirmación estándar de Git: editar, preparar y confirmar.

Recuerda que, como estos comandos crean confirmaciones locales, John puede repetir este proceso tantas veces como desee sin tener que preocuparse por lo que está pasando en el repositorio central.

### Mary trabaja en su función

![Git Workflows: Edit Stage Commit Feature](https://wac-cdn.atlassian.com/dam/jcr:a0aa8d1b-11a4-4aa4-a3a9-4f83f9be9a67/07.svg?cdnVersion=1278)

Mientras tanto, Mary trabaja en su propia función y en su propio repositorio local con el mismo proceso de cambio, preparación y confirmación. Al igual que a John, no le importa lo que esté sucediendo en el repositorio central y, *por supuesto*, tampoco le importa lo que John está haciendo en su repositorio local, ya que todos los repositorios locales son *privados*.

### John publica su función

![Git Workflows: Publish Feature](https://wac-cdn.atlassian.com/dam/jcr:6e5dc66d-b041-4013-b321-b1908fecfdbd/08.svg?cdnVersion=1278)

Una vez que John ha completado su función, debe publicar sus confirmaciones locales en el repositorio central, de forma que otros miembros del equipo puedan acceder a ellas. Puede hacerlo con el comando `git push` de este modo:

```
git push origin master
```

Recuerda que `origin` es la conexión remota al repositorio central que Git creó cuando John lo clonó. El argumento `master` le indica a Git que intente hacer que la rama `master` de `origin` tenga el mismo aspecto que su rama `master` local. Como el repositorio central no se ha actualizado desde que John lo clonó, esta acción no creará ningún conflicto y el envío se realizará según lo previsto.

### Mary intenta publicar su función

![Git Workflows: Push Command Error](https://wac-cdn.atlassian.com/dam/jcr:52e2347e-b8e0-49ab-9530-5d1e9129198e/09.svg?cdnVersion=1278)

Veamos lo que pasa cuando Mary intenta enviar su función después de que John haya publicado con éxito sus cambios en el repositorio central. Puede usar el mismo comando push:

```
git push origin master
```

No obstante, como su historial local es distinto que el del repositorio, git rechazará la solicitud con un mensaje de error algo extenso:

```
error: failed to push some refs to '/path/to/repo.git' hint: Updates were rejected because the tip of your current branch is behind hint: its remote counterpart. Merge the remote changes (e.g. 'git pull') hint: before pushing again. hint: See the 'Note about fast-forwards' in 'git push --help' for details.
```

Así se evita que Mary sobrescriba las confirmaciones oficiales. Tiene que incorporar los cambios de las actualizaciones de John a su repositorio, integrarlos con sus cambios locales y, a continuación, volver a intentarlo.

### Mary realiza una reorganización a partir de las confirmaciones de John

![Git Workflows: Git Pull Rebase](https://wac-cdn.atlassian.com/dam/jcr:25edd772-a30a-475a-a6ca-d1055ae61737/10.svg?cdnVersion=1278)

Mary puede usar el comando `git pull` para incorporar cambios del nivel superior a su repositorio. Este comando es parecido a `svn update`, ya que incorpora los cambios de todo el historial de confirmación del nivel superior al repositorio local de Mary e intenta integrarlos con sus confirmaciones locales:

```
git pull --rebase origin master
```

La opción `--rebase` le indica a Git que transfiera todas las confirmaciones de Mary al extremo de la rama `master` después de sincronizarlos con el repositorio central, como se muestra a continuación:

![Git workflows: Rebasing to Master](https://wac-cdn.atlassian.com/dam/jcr:5165668f-b62d-4417-95e6-fde8ed97ec60/11.svg?cdnVersion=1278)

La incorporación de cambios seguirá funcionando si se te olvida esta opción, pero es posible que tengas que realizar una confirmación de fusión cada vez que alguien tenga que realizar una sincronización con el repositorio central. Para este flujo de trabajo, siempre es mejor reorganizar en lugar de generar una confirmación de fusión.

### Mary soluciona un conflicto de fusión

![Git Workflows: Rebasing on Commits](https://wac-cdn.atlassian.com/dam/jcr:eaad29a3-6d94-4916-8a2c-3dea71aea4c2/12.svg?cdnVersion=1278)

Modifica las bases de los trabajos mediante la transferencia de cada confirmación local a la rama `master` actualizada de una en una. De este modo, descubrirás los conflictos de fusión de cada confirmación, en lugar de tener que resolverlos todos con una confirmación de fusión masiva. Además, esto hace que tus confirmaciones mantengan un enfoque lo más claro posible, y produce un historial del proyecto limpio. También hace que resulte mucho más sencillo descubrir qué errores se han introducido y, si fuera necesario, revertir cambios con un impacto mínimo sobre el proyecto.

Si Mary y John trabajan en funciones que no están relacionadas, es poco probable que el proceso de reorganización genere conflictos. No obstante, si así fuera, Git pausará la reorganización en la confirmación actual y mostrará el siguiente mensaje, además de algunas instrucciones importantes:

```
CONFLICT (content): Merge conflict in 
```

![Git workflows: Conflict Resolution](https://wac-cdn.atlassian.com/dam/jcr:adf8c8e3-4287-4ec1-acf7-2a052d61d03f/13.svg?cdnVersion=1278)

Lo bueno de Git es que *cualquiera* puede resolver sus propios conflictos de fusión. En nuestro ejemplo, Mary solo tiene que ejecutar un comando `git status` para ver dónde está el problema. Los archivos en conflicto se mostrarán en la sección Rutas no fusionadas:

```
# Rutas no fusionadas: # (usa "git reset HEAD ..." para deshacer la reparación)# (usa "git add/rm ..." según corresponda para indicar la resolución) # # ambos modificados: 
```

A continuación, editará los archivos como considere. Una vez que esté contenta con el resultado, podrá preparar los archivos según el método habitual y dejar que `git rebase` haga el resto:

```
git add  git rebase --continue
```

Y esto es todo lo que hay que hacer. Git continuará con la siguiente confirmación y repetirá el proceso con cualquier otra confirmación que genere conflictos.

Si llegas a este punto y te das cuenta de que no tienes ni idea de lo que está pasando, no entres en pánico. Solo tienes que ejecutar el siguiente comando y volverás al punto de inicio:

```
git rebase --abort
```

### Mary publica correctamente su función

![Git Workflows: Synchronize Central Repo](https://wac-cdn.atlassian.com/dam/jcr:de2dabdd-542f-4f64-9be4-870abff06f60/14.svg?cdnVersion=1278)

Después de terminar con la sincronización del repositorio central, Mary podrá publicar los cambios correctamente:

```
git push origin master
```

### Hacia dónde ir

Como puedes ver, es posible replicar un entorno de desarrollo de Subversion tradicional con solo unos comandos de Git. Este método es perfecto para los equipos que están migrando de SVN, pero no le sacan partido a la naturaleza distribuida de Git.

El flujo de trabajo centralizado es estupendo para equipos pequeños. El proceso de resolución de conflictos explicado anteriormente puede provocar un cuello de botella conforme tu equipo escala su tamaño. Si tu equipo está contento con el flujo de trabajo centralizado, pero quiere perfeccionar la colaboración, merece la pena analizar las ventajas del [flujo de trabajo de rama de función](https://www.atlassian.com/git/tutorials/comparing-workflows/feature-branch-workflow). Al dedicar una rama aislada a cada función, es posible iniciar conversaciones en profundidad acerca de nuevas adiciones antes de integrarlas en el proyecto oficial.

## Otros flujos de trabajo habituales

El flujo de trabajo centralizado consiste en un bloque de construcción de otros flujos de trabajo de Git. Los flujos de trabajo de Git más populares cuentan con una especie de repositorio centralizado del que los desarrolladores pueden incorporar cambios y al que pueden enviar los suyos. A continuación, hablaremos brevemente sobre otros flujos de trabajo de Git populares. Estos flujos de trabajo ampliados ofrecen patrones más específicos en lo que respecta a la gestión de ramas para el desarrollo de funciones, las correcciones inmediatas y la publicación.

## Ramas de funcionalidades

La creación de ramas de funciones es una extensión lógica del flujo de trabajo centralizado. La idea principal que subyace al [flujo de trabajo de rama de función](http://www.atlassian.com/git/tutorials/comparing-workflows/feature-branch-workflow) es que el desarrollo de una función debe llevarse a cabo en una rama especializada, en lugar de en una rama `master`. Este aislamiento permite que varios desarrolladores trabajen en una función concreta sin perturbar el contenido del código base principal. También implica que la rama `master` no debe contener en ningún caso código erróneo, lo que supone una gran ventaja para los entornos de integración continua.

## Flujo de trabajo de Gitflow

El [flujo de trabajo de Gitflow](http://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow) se publicó por primera vez en una entrada de blog de 2010 muy reconocida de [Vincent Driessen en nvie](http://nvie.com/posts/a-successful-git-branching-model/). El flujo de trabajo de Gitflow define un modelo de creación de ramas estricto diseñado con la publicación del proyecto como fundamento. Este flujo de trabajo no añade ningún concepto o comando nuevo, solo los que se necesitan para el flujo de trabajo de rama de función. En su lugar, asigna funciones muy específicas a las distintas ramas y define cómo y cuándo deben realizarse las interacciones.

## Flujo de trabajo de bifurcación

El [flujo de trabajo de bifurcación](http://www.atlassian.com/git/tutorials/comparing-workflows/forking-workflow) es muy diferente de los otros flujos de trabajo que se muestran en este tutorial. En lugar de usar un único repositorio en servidor para que actúe como código base central, le proporciona a cada desarrollador un repositorio en servidor. Esto quiere decir que cada contribuyente tiene dos repositorios de Git: uno local y privado y otro público y en servidor.

## Directrices

No existe un flujo de trabajo de Git universal. Como se ha indicado anteriormente, es muy importante desarrollar un flujo de trabajo de Git que suponga una mejora productiva para tu equipo. Además de la cultura del equipo, el flujo de trabajo debe ampliar la cultura empresarial. Las funciones de Git, como las ramas y las etiquetas, deben complementar la planificación de publicación de tu empresa. Si tu equipo usa [software de gestión de proyectos con seguimiento de tareas](https://www.atlassian.com/software/jira), puede que quieras usar ramas que se correspondan con las tareas en curso. Aquí presentamos algunas directrices que se deben tener en cuenta a la hora de decantarse por un flujo de trabajo:

### Ramas transitorias

Cuanto más tiempo se desarrolle una rama de forma independiente a la rama de producción, mayor será el riesgo de que surjan conflictos de fusión y retos de implementación. Las ramas transitorias proporcionan fusiones e implementaciones más limpias.

### Minimización y simplificación de reversiones

Es importante disponer de un flujo de trabajo que ayuda de forma proactiva a evitar fusiones que tendrán que revertirse. Un ejemplo de esto son los flujos de trabajo que realizan pruebas de una rama antes de fusionarla con la rama `master`. No obstante, se producen accidentes. Con esto en mente, conviene tener un flujo de trabajo que permita realizar reversiones sencillas que no interrumpan el flujo de otros miembros del equipo.

### Cumplimiento de una planificación de publicación

Un flujo de trabajo debe complementar tu ciclo de publicación de desarrollo de software empresarial. Si tienes pensado realizar varias publicaciones al día, querrás que tu rama `master` se mantenga estable. Si tu planificación de publicación es mucho menos frecuente, ten en cuenta que puedes usar etiquetas de Git para asignar una rama a una versión.

## Resumen

En este documento, hemos hablado de los flujos de trabajo de Git, hemos analizado en profundidad el flujo de trabajo centralizado con ejemplos prácticos y hemos ampliado esta información con la de otros flujos de trabajo especializados. Estas son algunas de las ideas fundamentales de este documento:

- No existe un flujo de trabajo de Git universal
- Un flujo de trabajo debe ser sencillo y mejorar la productividad de tu equipo
- Tus requisitos empresariales deben servir para dar forma al flujo de trabajo de Git



# Realizar una solicitud de incorporación de cambios

[Funcionamiento](https://www.atlassian.com/es/git/tutorials/making-a-pull-request#how-it-works) [Ejemplo](https://www.atlassian.com/es/git/tutorials/making-a-pull-request#example) [Hacia dónde ir](https://www.atlassian.com/es/git/tutorials/making-a-pull-request#where-to-go)

Las solicitudes de incorporación de cambios son una funcionalidad que facilita la colaboración entre desarrolladores que usan [Bitbucket](http://www.bitbucket.org/). Ofrecen una interfaz web intuitiva para debatir los cambios propuestos antes de integrarlos en el proyecto oficial.

![Flujos de trabajo de Git: Solicitudes de incorporación de cambios en Bitbucket](https://wac-cdn.atlassian.com/dam/jcr:ff6b00cc-0ca3-4d5b-8235-8d4cbcedd19e/01.svg?cdnVersion=1278)

En su forma más simple, las solicitudes de incorporación de cambios son un mecanismo para que los desarrolladores notifiquen a los miembros de su equipo que han terminado una función. Una vez que la rama de función está lista, el desarrollador realiza la solicitud de incorporación de cambios mediante su cuenta de Bitbucket. Así, todas las personas involucradas saben que deben revisar el código y fusionarlo con la rama `master`.

Pero la solicitud de incorporación de cambios es mucho más que una notificación: es un foro especializado para debatir sobre una función propuesta. Si hay algún problema con los cambios, los miembros del equipo pueden publicar feedback en las solicitudes de incorporación de cambios e incluso modificar la función al enviar confirmaciones de seguimiento. El seguimiento de toda esta actividad se realiza directamente desde la solicitud de incorporación de cambios.

![Flujos de trabajo de Git: Actividad en una solicitud de incorporación de cambios](https://wac-cdn.atlassian.com/dam/jcr:dc1a0821-efd6-4852-b7e6-c3a787656c61/02.svg?cdnVersion=1278)

En comparación con otros modelos de colaboración, esta solución formal para compartir confirmaciones crea un flujo de trabajo mucho más perfeccionado. SVN y Git pueden enviar automáticamente correos electrónicos de notificación mediante un script sencillo. No obstante, en lo que respecta a hablar sobre los cambios, los desarrolladores suelen depender de los hilos de correos electrónicos. Esto puede resultar peligroso, sobre todo cuando se trabaja con confirmaciones de seguimiento. Las solicitudes de incorporación de cambios vuelcan toda esta información en una interfaz de usuario sencilla junto a tus repositorios de Bitbucket.

### Anatomía de una solicitud de incorporación de cambios

Cuando realizas una solicitud de incorporación de cambios, lo que haces es *solicitar* que otro desarrollador (por ejemplo, el encargado de mantenimiento del proyecto) *incorpore* una rama de tu repositorio al suyo. Por tanto, para realizar esta solicitud, debes proporcionar la siguiente información: el repositorio de origen, la rama de origen, el repositorio de destino y la rama de destino.

![Flujos de trabajo de Git: Solicitudes de incorporación de cambios](https://wac-cdn.atlassian.com/dam/jcr:3a777a86-6106-4484-b75d-f2f19abc0e7f/03.svg?cdnVersion=1278)

Bitbucket establece estos valores en un parámetro predeterminado lógico. No obstante, según tu flujo de trabajo de colaboración, tu equipo tendrá que especificar valores distintos. El diagrama anterior muestra una solicitud de incorporación de cambios que solicita que se fusione una rama de función con la rama maestra oficial, pero hay otras muchas formas de usar las solicitudes de incorporación de cambios.

## Funcionamiento

Las solicitudes de incorporación de cambios se pueden usar en conjunto con el [flujo de trabajo de rama de función](https://www.atlassian.com/git/tutorials/comparing-workflows/feature-branch-workflow), el [flujo de trabajo de Gitflow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow) o el [flujo de trabajo de bifurcación](https://www.atlassian.com/git/tutorials/comparing-workflows/forking-workflow). No obstante, una solicitud de incorporación de cambios requiere dos ramas distintas o dos repositorios distintos, de forma que no trabajen con el [flujo de trabajo centralizado](https://www.atlassian.com/git/tutorials/comparing-workflows/centralized-workflow). Utilizar solicitudes de incorporación de cambios con cada de unos de estos flujos de trabajo es un proceso que varía ligeramente, pero en general se realiza de esta forma:

1. Un desarrollador crea una función en una rama especializada de su repositorio local.
2. El desarrollo envía la rama a un repositorio de Bitbucket público.
3. El desarrollador envía una solicitud de incorporación de cambios mediante Bitbucket.
4. El resto del equipo revisa el código, debate sobre él y aplica modificaciones.
5. El responsable del mantenimiento del proyecto fusiona la función con el repositorio oficial y cierra la solicitud de incorporación de cambios.

El resto de esta sección describe cómo se puede sacar partido de las solicitudes de incorporación de cambios en flujos de trabajo de colaboración diferentes.

### Flujo de trabajo de rama de función con solicitudes de incorporación de cambios

El flujo de trabajo de rama de función usa un repositorio compartido de Bitbucket para gestionar la colaboración, de modo que los desarrolladores creen funciones en ramas aisladas. Pero, en lugar de fusionarlas inmediatamente con la `master`, deben abrir una solicitud de incorporación de cambios para iniciar un debate en torno a la función antes de integrarla en el código base principal.

![Solicitud de incorporación de cambios: Flujo de trabajo de rama de función](https://wac-cdn.atlassian.com/dam/jcr:8c784aa1-3393-49b7-b4c5-2b91bf3aa48a/04.svg?cdnVersion=1278)

Solo hay un repositorio público en el flujo de trabajo de rama de función, por lo que el repositorio de destino y el de origen de la solicitud de incorporación de cambios siempre serán el mismo. Generalmente, el desarrollador especificará su rama de función como la rama de origen y la rama `master` como la de destino.

Después de recibir la solicitud, el responsable del mantenimiento del proyecto debe decidir qué hacer. Si la función está lista, puede sencillamente fusionarla con la rama `master` y cerrar la solicitud. Pero si hay algún problema con los cambios propuestos, puede publicar su feedback en la solicitud de incorporación de cambios. Las confirmaciones se mostrarán justo al lado de los comentarios relevantes.

También es posible enviar una solicitud de incorporación de cambios para una función incompleta. Por ejemplo, si un desarrollador está teniendo problemas para incorporar un requisito concreto, puede enviar una solicitud de incorporación de cambios con su trabajo en curso. Otros desarrolladores pueden proporcionar sugerencias en la solicitud de incorporación de cambios o incluso corregir el problema con confirmaciones adicionales.

### Flujo de trabajo de Gitflow con solicitudes de incorporación de cambios

El flujo de trabajo de Git es similar al flujo de trabajo de rama de función, pero define un modelo de creación de ramas rígido y diseñado con la publicación del proyecto en mente. Añadir una solicitud de incorporación de cambios al flujo de trabajo de Gitflow les proporciona a los desarrolladores un lugar cómodo para hablar sobre una rama de publicación o una rama de mantenimiento mientras trabajan en ellas.

![Solicitudes de incorporación de cambios: Flujo de trabajo de Gitflow](https://wac-cdn.atlassian.com/dam/jcr:50c76de3-6c5b-4adf-9a96-a611cc3dbebc/05.svg?cdnVersion=1278) ![Solicitudes de incorporación de cambios: Flujo de trabajo de Gitflow 2](https://wac-cdn.atlassian.com/dam/jcr:a5c54fd9-09d7-4f59-90c1-8b228fec80a5/06.svg?cdnVersion=1278)

La mecánica de las solicitudes de incorporación de cambios del flujo de trabajo de Gitflow es exactamente la misma que la que se ha explicado en la sección anterior: un desarrollador solo tiene que enviar una solicitud de incorporación de cambios cuando se tiene que revisar una rama de corrección, publicación o función, y el resto del equipo recibirá una notificación mediante Bitbucket.

Generalmente, las funciones se fusionan con la rama `develop`, mientras que las ramas de publicaciones y de correcciones se fusionan con las ramas `develop` y `master`. Las solicitudes de incorporación de cambios se pueden usar para gestionar formalmente todas estas fusiones.

### Flujo de trabajo de bifurcación con solicitudes de incorporación de cambios

En el flujo de trabajo de bifurcación, un desarrollador envía una función completada a *su propio* repositorio público en lugar de a uno compartido. Después, realiza una solicitud de incorporación de cambios para comunicarle al responsable del mantenimiento del proyecto que está lista para su revisión.

La notificación realizada por las solicitudes de incorporación de cambios resulta especialmente útil en este flujo de trabajo, ya que el responsable del mantenimiento del proyecto no tiene forma de saber cuándo ha añadido nuevas confirmaciones al repositorio de Bitbucket uno de los desarrolladores.

![Solicitudes de incorporación de cambios: Flujo de trabajo de bifurcación](https://wac-cdn.atlassian.com/dam/jcr:2510a321-ba5f-4c31-82ec-f3ad062c8e6d/07.svg?cdnVersion=1278)

Puesto que cada desarrollador tiene su propio repositorio público, el repositorio de origen de la solicitud de incorporación de cambios será distinto a su repositorio de destino. El repositorio de origen es el repositorio público del desarrollador y la rama de origen es la que contiene los cambios propuestos. Si el desarrollador está intentando fusionar la función con el código base, el repositorio de destino es el proyecto oficial y la rama de destino es la `master`.

Las solicitudes de incorporación de cambios también se pueden usar para colaborar con otros desarrolladores fuera del proyecto oficial. Por ejemplo, si un desarrollador trabaja con un compañero de equipo, puede realizar una solicitud de incorporación de cambios utilizando el repositorio de Bitbucket de *su compañero de equipo* como destino en lugar del proyecto oficial. En tal caso, la rama de función de origen y destino sería la misma.

![Solicitudes de incorporación de cambios: Flujo de trabajo de bifurcación](https://wac-cdn.atlassian.com/dam/jcr:0907a594-5786-47fb-87b4-05fc08e0c8dc/08.svg?cdnVersion=1278)

Los dos desarrolladores pueden hablar sobre la función y desarrollarla desde la solicitud de incorporación de cambios. Cuando acaben, uno de ellos enviará otra solicitud de incorporación de cambios en la que pide fusionar la función con la rama maestra oficial. Este tipo de flexibilidad hace que las solicitudes de incorporación de cambios sean una herramienta de colaboración en el flujo de trabajo de bifurcación muy potente.

## Ejemplo

En el siguiente ejemplo se muestra cómo las solicitudes de incorporación de cambios se pueden usar en el flujo de trabajo de bifurcación. Se aplica de igual modo a los desarrolladores que trabajan en equipos pequeños y a un desarrollador de terceros que contribuye a un proyecto de código abierto.

En el ejemplo, Mary es desarrolladora y John es el responsable del mantenimiento del proyecto. Ambos disponen de sus propios repositorios de Bitbucket públicos, y el proyecto oficial se encuentra en el de John.

### Mary bifurca el proyecto oficial

![Solicitudes de incorporación de cambios: Bifurcar el proyecto](https://wac-cdn.atlassian.com/dam/jcr:8b3d2111-5a88-4802-967c-71f51c248b03/09.svg?cdnVersion=1278)

Para empezar a trabajar en el proyecto, Mary debe realizar en primer lugar bifurcaciones en el repositorio Bitbucket de John. Para ello, solo tiene que iniciar sesión en Bitbucket, ir al repositorio de John y hacer clic en el botón *Bifurcar*.

![Solicitud de incorporación de cambios: Bifurcar en Bitbucket](https://wac-cdn.atlassian.com/dam/jcr:93d2ede4-241e-4296-b403-584d5ee24d8e/10.svg?cdnVersion=1278)

Después de rellenar el nombre y la descripción del repositorio bifurcado, dispondrá de una copia en servidor del proyecto.

### Mary clona su repositorio de Bitbucket

![Solicitud de incorporación de cambios: Clonar el repositorio de Bitbucket](https://wac-cdn.atlassian.com/dam/jcr:4f051d96-8ce7-4aab-af74-b2de38c41443/11.svg?cdnVersion=1278)

A continuación, Mary tiene que clonar el repositorio de Bitbucket que acaba de bifurcar. Esto le proporcionará una copia de trabajo del proyecto en su equipo local. Puede hacerlo mediante el siguiente comando:

```
git clone https://user@bitbucket.org/user/repo.git
```

Ten en cuenta que `git clone` crea un `origin` remoto de forma automática que apunta al repositorio bifurcado de Mary.

### Mary desarrolla una nueva función

![Solicitudes de incorporación de cambios: Desarrollar una nueva función](https://wac-cdn.atlassian.com/dam/jcr:f0979362-cf67-413d-bac1-8275e20aea58/12.svg?cdnVersion=1278)

Antes de empezar a escribir el código, Mary tiene que crear una nueva rama para la función. Es la rama que usará como rama de origen para la solicitud de incorporación de cambios.

```
git checkout -b some-feature # Edita parte de código git commit -a -m "Add first draft of some feature"
```

Mary puede utilizar todas las confirmaciones que necesite para crear la función. Y, si el historial de la función está más desordenado de lo que le gustaría, puede usar la [reorganización interactiva](https://www.atlassian.com/git/tutorials/rewriting-history/git-rebase-i) para eliminar o combinar las confirmaciones innecesarias. En los proyectos más grandes, limpiar el historial de una función hace que al responsable del mantenimiento del proyecto le resulte mucho más sencillo ver lo que ocurre en la solicitud de incorporación de cambios.

### Mary envía la función al repositorio de Bitbucket

![Solicitudes de incorporación de cambios: Enviar una función al repositorio de Bitbucket](https://wac-cdn.atlassian.com/dam/jcr:d3a07e01-ad5c-4e11-929a-87c049a27a6b/13.svg?cdnVersion=1278)

Una vez completada su funcionalidad, Mary envía la rama de función a su propio repositorio de Bitbucket (no al oficial) con un sencillo `git push`:

```
git push origin some-branch
```

Esto hace que los cambios estén disponibles para el responsable del mantenimiento del proyecto (o para cualquier colaborador que pueda necesitar acceso a ellos).

### Mary crea una solicitud de incorporación de cambios

![Solicitud de incorporación de cambios: Crear solicitud de incorporación de cambios](https://wac-cdn.atlassian.com/dam/jcr:36f8c233-ef70-41ce-8b91-4f21dd735817/14.svg?cdnVersion=1278)

Una vez que la rama de función está en Bitbucket, Mary puede crear la solicitud de incorporación de cambios por medio de su cuenta de Bitbucket yendo a su repositorio bifurcado y haciendo clic en el botón *Solicitud de incorporación de cambios*, situado en la esquina superior derecha. Se abrirá un formulario que asignará de forma automática el repositorio de Mary como el repositorio de origen y le pedirá que indique la rama de origen, el repositorio de destino y la rama de destino.

Mary quiere fusionar su función con el código base principal, de modo que la rama de origen es su rama de función, el repositorio de destino es el repositorio público de John y la rama de destino es `master`. También debe proporcionar un título y una descripción para la solicitud de incorporación de cambios. Si hay otras personas que deban aprobar el código además de John, las puede introducir en el campo *Revisores*.

![Solicitud de incorporación de cambios: Bitbucket](https://wac-cdn.atlassian.com/dam/jcr:0aba279b-e045-4481-a9f1-cac222865612/pull-request-7.png?cdnVersion=1278)

Después de crear una solicitud de incorporación de cambios, se enviará una notificación a John mediante el panel de Bitbucket y, de forma opcional, por correo electrónico.

### John revisa la solicitud de incorporación de cambios

![Solicitud de incorporación de cambios: Solicitudes de incorporación de cambios de Bitbucket](https://wac-cdn.atlassian.com/dam/jcr:1b30ef44-9679-49d1-bc86-8b1a0cf5e241/pull-request-8.png?cdnVersion=1278)

John puede acceder a todas las solicitudes de incorporación de cambios que se han realizado haciendo clic en la pestaña *Solicitud de incorporación de cambios* de su propio repositorio de Bitbucket. Al hacer clic en la solicitud de incorporación de cambios de Mary, se le mostrará una descripción de la solicitud, el historial de confirmaciones de la funcionalidad y una comparación de los cambios que contiene.

Si cree que la función está lista para integrarse en el proyecto, todo lo que tiene hacer es hacer clic en el botón *Fusionar* para aprobar la solicitud de incorporación de cambios y fusionar la función de Mary con su rama `master`.

No obstante, para este ejemplo, imaginemos que John ha encontrado un pequeño error en el código de Mary y que necesita que lo arregle antes de realizar la fusión. Para ello, puede publicar un comentario de forma general en la solicitud de incorporación de cambios o puede comentar en una confirmación concreta del historial de la función.

![Solicitud de incorporación de cambios: Comentar](https://wac-cdn.atlassian.com/dam/jcr:6d9007c1-7b42-42e4-a1ca-f7129185c16d/pull-request-9.png?cdnVersion=1278)

### Mary añade una confirmación de seguimiento

Si Mary tiene alguna duda sobre el feedback, puede responder en la solicitud de incorporación de cambios, de forma que se use como un foro de debate sobre su función.

Para corregir el error, Mary añade otra confirmación a su rama de función y la envía a su repositorio de Bitbucket, como hizo la primera vez. Esta confirmación se añade de forma automática a la solicitud de incorporación de cambios original, y John puede revisar los cambios de nuevo junto al comentario original.

### John acepta la solicitud de incorporación de cambios

Finalmente, John acepta los cambios, fusiona la rama de función con la maestra y cierra la solicitud de incorporación de cambios. Ahora la función está integrada en el proyecto y cualquier otro desarrollador que trabaje en él puede enviarla a su propio repositorio local mediante el comando estándar `git pull`.

https://www.atlassian.com/es/git/tutorials/using-branches