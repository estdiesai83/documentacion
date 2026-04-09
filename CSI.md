# CSI

www.c17.net

## Configuración personal:

| nombre equipo         | ediez@maude       | 160202    |                           |
| --------------------- | ----------------- | --------- | ------------------------- |
| correo thunderbird    | ediez@c17.net     | 160202    |                           |
| ssh                   |                   | 172223    |                           |
| cuenta gitHub         | ediez@c17.net     | 160202Es@ |                           |
| bitbucket (Atlassian) | ediesai (usuario) | 160202Es@ | bucked name : ediez@maude |

docker Hub conectado automáticamente con la cuenta de GitHub.

Hay parte del código en bicbucket. **Bitbucket** es una plataforma de alojamiento basada en la web diseñada para proyectos que utilizan el sistema de control de versiones **Git**. Es propiedad de **Atlassian**.

Si Bitbucket es el lugar donde guardas el código fuente, **Docker Hub** es el lugar donde guardas las "aplicaciones terminadas" listas para ejecutarse.

Es el registro oficial en la nube de **Docker**, una biblioteca gigante que contiene imágenes de contenedores. Imaginalo como una **App Store** o un **Google Play**, pero en lugar de apps para el móvil, descargas entornos de software completos.



**Yakuake**: Consola que utilizan: F12 o desde la terminal yakuake&

Yakuake (Yet another Kuake) es un emulador de terminal desplegable diseñado para el entorno de escritorio KDE en Linux, incluido Debian. Su principal característica es que permanece oculto y aparece deslizándose desde la parte superior de la pantalla al presionar una tecla de acceso rápido (por defecto **F12**), lo que permite un acceso rápido a la línea de comandos sin cambiar de ventana. 



## Información importante

- **archivos .yaml**:  es un estándar de serialización de datos diseñado para ser legible por humanos. Se utiliza para archivos de configuración en el desarrollo de software moderno. A diferencia de XML o JSON no utiliza llaves`{}`ni etiquetas `<>` su "magia" reside en la **indentación** (espacios en blanco).

  **Legibilidad:** Parece una lista de notas organizada.

  **Basado en espacios:** El nivel de jerarquía se define por cuántos espacios tiene una línea a la izquierda. **Importante:** Se deben usar espacios, no tabuladores.

  **Extensiones comunes:** `.yaml` o `.yml`.

  **2. Estructura y Sintaxis**

  YAML utiliza principalmente tres tipos de estructuras:

  **Mapas (Clave: Valor)**

  Es la forma más básica de guardar información.

  ```yaml
  nombre: "Proyecto Alpha"
  version: 1.2
  estado: activo
  ```

  **Listas (Colecciones)**

  Se definen usando un guion `-` seguido de un espacio.

  ```yaml
  lenguajes:
    - PHP
    - Python
    - JavaScript
  ```

  **Objetos Anidados**

  Combinando ambos para crear estructuras complejas.

  ```yaml
  servidor:
    puerto: 8080
    entorno: produccion
    usuarios:
      - admin
      - developer
  ```

  

  **3. ¿Para qué se usa?**

  Si ves un archivo `.yaml`, lo más probable es que estés ante uno de estos escenarios:

  - **Docker:** El archivo `docker-compose.yml` define cómo deben correr tus contenedores.
  - **Kubernetes:** Se usa para describir el estado deseado de los clusters.
  - **GitHub Actions:** Las automatizaciones (pipelines) se escriben en YAML.
  - **Frameworks (Symfony, Spring):** Configuración de servicios y parámetros.

  **4. YAML vs JSON**

  Aunque ambos sirven para lo mismo, tienen personalidades distintas:

  | **Característica** | **YAML**                         | **JSON**                       |
  | ------------------ | -------------------------------- | ------------------------------ |
  | **Legibilidad**    | Muy alta (limpio).               | Media (muchos símbolos).       |
  | **Comentarios**    | Permite usar `#`.                | No permite comentarios.        |
  | **Complejidad**    | Sensible a espacios (peligroso). | Más rígido pero robusto.       |
  | **Uso principal**  | Configuración manual.            | APIs y transferencia de datos. |

## Docker

Es un sistema de contenedores de transporte de software, empaqueta las bases de datos, las librerias....

**1. ¿Cómo funciona? (La analogía del Barco)**

Imagina un barco de carga. No importa si llevas coches, comida o muebles; todo va dentro de **contenedores estándar**. El barco (tu ordenador o servidor) solo se preocupa de cargar los contenedores, y lo que hay dentro está aislado de lo demás.

- **Imagen:** Es la "receta" o el molde. Contiene el sistema operativo ligero, el código y las dependencias. No cambia (es inmutable).
- **Contenedor:** Es la imagen en ejecución. Es como una "máquina virtual" pero mucho más ligera y rápida porque comparte el núcleo del sistema operativo principal.



**2. ¿Por qué es mejor que una Máquina Virtual?**

| **Característica** | **Máquina Virtual (VM)**           | **Contenedor (Docker)**       |
| ------------------ | ---------------------------------- | ----------------------------- |
| **Peso**           | Gigabytes (incluye un SO completo) | Megabytes (solo lo necesario) |
| **Velocidad**      | Tarda minutos en arrancar          | Arranca en segundos           |
| **Rendimiento**    | Consume muchos recursos (RAM/CPU)  | Muy eficiente, casi nativo    |



A diferencia de una máquina virtual, Docker no emula un hardware completo, comparte el núcleo (kernel) de tu sistema operativo.



**3. Los 3 pilares de Docker**

**A. El Dockerfile** (La receta): define el entorno

Es un archivo de texto donde escribes las instrucciones paso a paso para construir tu imagen. (ej: "Instala PHP 8.2", "Copia estos archivos", "Abre el puerto 80").

Dockerfile

```
FROM php:8.2-fpm
RUN apt-get update && apt-get install -y libpq-dev
COPY . /var/www/html
```

**Imagen:** (El paquete) es el resultado de "cocinar" el Dockerfile. Es un archivo pesado que contiene todo lo necesario para ejecutar la app. Es inmutable NO CAMBIA.

**Contenedor:** (La instancia): Es la imagen "cobrando vida". Es el proceso que realmente se está ejecutando en tu ordenador. Se puede levantar 10 contenedores iguales a partir de una sola imagen.



**B. Docker Hub**

Es el "GitHub" de las imágenes. Si necesitas una base de datos MySQL, no la instalas en tu PC; simplemente haces un `docker pull mysql` y ya tienes una imagen oficial lista para usar.

**C. Docker Compose**

Como vimos antes, es la herramienta para gestionar varios contenedores a la vez (por ejemplo: uno para PHP, otro para MySQL y otro para Nginx) usando un solo archivo `.yml`.

**4. Ventajas clave para ti**

1. **Aislamiento:** Puedes tener un proyecto en PHP 7.4 y otro en PHP 8.3 en el mismo ordenador sin que choquen entre ellos.
2. **Portabilidad:** Si un compañero se une al equipo, solo hace `docker compose up` y tiene exactamente el mismo entorno que tú en 2 minutos.
3. **Limpieza:** Tu sistema operativo real no se llena de "basura" de instalaciones de bases de datos o servidores; todo vive (y muere) dentro de los contenedores.



### 

Arrancar docker: `docker compose up -d`, donde:

- **docker compose**: llama a la herramienta de orquestación de Docker que lee el archivo docker-compose.yml

- **up**: le dice a docker que realize tres pasos:
  - **descargar** las imágenes (si nos las tiene)
  - **crear** los contenedores.
  - **Arrancarlos**
- **-d** (detached mode): esta es la clave. Ejecuta los contenedores en segundo plano, si no se pone se ven todos los logs en tiempo real y, si cierras la terminal o pulsas `Ctrl+C`, los contenedores se detendrán.

**¿Qué sucede cuando lo ejecutas?**

Cuando lanzas este comando, Docker sigue este orden lógico:

1. **Lectura del YAML**: Busca el archivo `docker-compose.yml` en el directorio actual.
2. **Creación de Red (Network)**: Crea una red virtual interna para que todos los servicios del archivo puedan hablar entre sí usando sus nombres (ej: que PHP se conecte a `db` en lugar de a una IP).
3. **Pull de imágenes**: Si no tienes las imágenes descargadas localmente, las baja del Docker Hub.
4. **Creación de Volúmenes**: Crea los espacios de almacenamiento persistente si los definiste.
5. **Arranque de Contenedores**: Lanza los contenedores respetando el orden (si usaste `depends_on`).



## 3. ¿Cómo se configura? (Paso a paso)

Para configurar un entorno de desarrollo (por ejemplo, para PHP/Symfony), normalmente seguimos estos pasos:

### Paso A: El Dockerfile (Define tu entorno)

Crea un archivo llamado `Dockerfile` en la raíz de tu proyecto:

Dockerfile

```yaml
# 1. Usamos una imagen oficial de PHP como base
FROM php:8.2-fpm

# 2. Instalamos extensiones necesarias (ej: para bases de datos)
RUN docker-php-ext-install pdo pdo_mysql

# 3. Definimos dónde estará nuestro código dentro del contenedor
WORKDIR /var/www/html
```

**Paso B: Docker Compose (Orquesta tus servicios)**

Si tu aplicación necesita una base de datos, no la metes en el mismo contenedor que PHP. Creas un archivo `docker-compose.yml` para conectarlos:

```yaml
services:
  # Servicio de PHP
  app:
    build: .
    volumes:
      - .:/var/www/html
    networks:
      - mi-red

  # Servicio de Base de Datos
  db:
    image: mysql:8.0
    environment:
      MYSQL_ROOT_PASSWORD: root
    networks:
      - mi-red

networks:
  mi-red:
```

**Paso C: Encendido**

Una vez configurados los archivos, solo necesitas la terminal:

1. **Construir:** `docker compose build` (lee el Dockerfile y crea la imagen).
2. **Levantar:** `docker compose up -d` (arranca PHP y MySQL).

------

**4. Ventajas de esta configuración**

- **Aislamiento total:** Si borras el contenedor, tu ordenador queda limpio. Nada se instala "realmente" en tu sistema operativo principal.
- **Volúmenes:** En el archivo `.yml`, la línea `- .:/var/www/html` hace magia: permite que los cambios que hagas en tu código en VS Code se vean **instantáneamente** dentro del contenedor.
- **Redes:** El contenedor `app` puede hablar con el contenedor `db` simplemente usando el nombre `db` como si fuera una dirección web.

### 





**Comandos útiles relacionados**

Si acabas de lanzar un `up -d`, estos comandos te servirán para gestionar lo que está pasando:

- **`docker compose ps`**: Para ver si los contenedores están realmente arriba (`Up`) o si han fallado.
- **`docker compose logs -f`**: Para ver los logs aunque estén en segundo plano (muy útil si algo no carga).
- **`docker compose stop`**: Detiene los contenedores pero los mantiene creados.
- **`docker compose down`**: **Cuidado con este:** Detiene los contenedores y los **elimina**, junto con la red (pero no borra los volúmenes de datos).



- 



## Utilizar proyecto

Para entrar en la raiz del proyecto:`docker compose up -d` (-d = detach) , se coloca automáticamente en la raiz del proyecto.

```bash
user@
```

Para poner la terminal:

```
docker compose exec -u
```



Para ejecutar los 3 comandos especificos, colocarnos en la raiz de la aplicación  `cd web/portal` : 

```bash
composer fix-devps
comporser pre-dev
composer pre-test
```







## Comandos específicos

**Se ejecutan siempre en la raiz del proyecto**. 



Creados por nosotros, están guardados en el proyecto en el  composer.json principal del proyecto en "scripts"

- **composer fix-deps:** arregla las dependencias.
- **composer pre-dev:** prepara el entorno de desarrollo.
- **composer pre-test:** prepara el entorno de test, (limpia las bases de datos)
- **composer fix-cs:** organiza el código.
- **composer ci:** ejecuta todas las pruebas (se tiene que ejecutar siempre antes de subir una rama, es decir se hace git add, composer ci y luego el git commit).



Composer gestiona las dependencias de php mediante dos archivos:

- **composer.json** **(El mapa)**: es el archivo que tú creas y editas. Define los requisitos generales de tu proyecto.
  - Propósito: indica que librerías quieres y qué versiones estás dispuesto a aceptar.
  - Versiones: suele usar rangos flexibles. Por ejemplo, `"guzzlehttp/guzzle": "^7.0"` significa que aceptas cualquier versión desde la 7.0 hasta antes de la 8.0.
  - Contenido: además de las dependencias (**require**), contiene metadatos como el nombre del proyecto, la licencia, scripts de automatización y la configuración de Autoload.
- **composer.lock (El contenido):** Si existe un `composer.lock`, el comando `composer install`ignorará rangos del `json` y descargará las versiones fijas que dicta el `lock`.

**Comparativa rápida**

| **Característica**  | **composer.json**                | **composer.lock**                       |
| ------------------- | -------------------------------- | --------------------------------------- |
| **Quién lo crea**   | El desarrollador (tú).           | Composer (automático).                  |
| **Versiones**       | Flexibles (ej. `^2.1`).          | Exactas (ej. `2.1.4`).                  |
| **Cuándo cambia**   | Cuando añades o quitas paquetes. | Cuando corres `composer update`.        |
| **¿Se sube a Git?** | **Sí**, siempre.                 | **Sí**, siempre (excepto en librerías). |

**¿Cuándo usar cada comando?**

- **`composer install`**: Se usa cuando descargas un proyecto por primera vez o cambias de rama. Busca el `composer.lock` para replicar el entorno exacto. Es el que debes usar en **Producción**.
- **`composer update`**: Se usa cuando quieres subir de versión tus librerías. Ignora el `lock`, busca versiones más nuevas que encajen con tu `json` y luego **actualiza** el `lock` con los nuevos datos.

> **Regla de oro:** En un entorno profesional, siempre sube ambos archivos al repositorio. De lo contrario, podrías encontrarte con el clásico "en mi computadora funciona, pero en el servidor no" debido a una pequeña diferencia de versiones.
>
> 

## **Configuración sistema**

En VS Code: instalar todas las extensiones predefinidas.



## Estructura proyecto simfony

c17 (workspace)

Hay 3 directorios con el archivo composer.lock.

1. web
   1. **portal**: aplicación para los usuarios
   2. **sf17**: orientada a las bibliotecas, contiene la llamada al código antiguo (r17) desde el controlador SegullAppWrapper.
   3. **r17**: proyecto antiguo (LEGACY) 
2. lib/c17-db-test/files/fixtures/003-usuarios.yaml contiene los datos de los usuarios.



## **Lógica de Negocio:**

Por el catálogo c17 es como nos conocen.

A partir del catálogo c17 hay varios módulos:

- **C17**+: lanza las peticiones.
- **ILL17:** modulo de préstamos, contiene más info de la petición.
- **B17: ** módulo de libros (= c17 pero con libros)
- **K17:** control de revistas en papel. (kardest)
- **P17:** las revistas se suscriben en  bloques
- **O17:** los usuarios pueden acceder a la biblioteca cs1.c17



Cuando en la URL www.c17..... poner /index.php/ nos indica que está en la aplicación LEGACY (r17 controlardor SegullApp) 



bvcsm: es la de la Comunidad de Madrid

JAMA: es una revista.



**PubMed:** 

Base de datos de Medicina de EEUU con un ID para cada artículo (ese id lo cogen para trabajar).

PMID: Identificados en PubMed (id único y secuencial, es un entero secuencial).

DOI: identificador único para cada artículo, también es una URL única que va al proveedor raiz. 

No todo tiene que tener DOI, pero si PMID que es lo que nosotros utilizamos (lo metemos en la web de usuarios para filtrar). 



Una vez que se hace una petición en la web c17 aparece en la bandeja de pendientes ordenado por * y luego alfabéticamente.

**Agencia**: se refiere a una biblioteca.

**Instituciones**:  agrupan bibliotecas. Ej: Consejería de Madrid.

**Fondos:** cobertura que tiene una biblioteca para una revista.

**Colección:** hay tres tipos:

- Propia: quieren quitarla, pertenece a una biblioteca y siempre está suscrita.
- Paquetes (colección suscribible): puede pertenecer a una biblioteca o institución y necesita estar suscrita para que aparezca en los fondos.
- Libres: a nosotros como empresa (revistas gratuitas). Se utiliza como añadido a los que están suscritos o son clientes de más tiempo o con más confianza.

**Balance:** equilibrio respecto a las otras bibliotecas ( es la diferencia entre las propias y las ajenas). 

**Cobertura:** es cuando empieza y cuando acaba, (es un año por ejemplo).

fondo-> catálogo colección -> n revistas -> máz 1 papel y 1 electronica.

Cuando se crea se le pone la fecha.

**Tupla:** conjunto de papel y/o electrónico

**Collection Manager:** quien es el dueño, es el que lo puede editar (editor).

**ISBN:** ID de un libro, si se reedita se cambia el ISBN

**ISSN:** ID de las revistas, hay uno para el papel y otro para el digital. NO cambia el ISSN.



## **Pruebas**: 

Web pruebas:

www.c17.localhost: la web del catálogo para las bibliotecas.

www.csi.c17.localhost: la web de los usuarios



Usuarios pruebas:

Desde la web para navegar y probar

csi: es la web nuestra

usuario: MANTON

usuario: manager10: biblioteca de prueba (lo que ven bibliotecario)

Todos los usuarios tienen la misma clave: foobar (coincide con el nombre de la bd)



user100: usuario de prueba de la web de usuarios csi



usuario: admin 	clave: foobar





Pendiente: 

- mirar nombre del controlador.
- 