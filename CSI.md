# CSI 

# Configuración personal:

| nombre equipo         | ediez@maude           | 160202               |                           |
| --------------------- | --------------------- | -------------------- | ------------------------- |
| correo thunderbird    | ediez@c17.net         | 160202               |                           |
| ssh                   |                       | 172223               |                           |
| cuenta gitHub         | ediez@c17.net         | 160202Es@            |                           |
| cuenta gitHub mia     | estdiesai83@gmail.com | 160202Es@            |                           |
| bitbucket (Atlassian) | ediesai (usuario)     | 160202Es@            | bucked name : ediez@maude |
| fichme                | ediez@c17.net         | 160202Es@            | web para fichar           |
| codely                | ajgarcia@c17.net      | iNbR71LzRmp4czIXjPyh | web cursos                |
| codely                | ediez@c17.net         | 160202Es@#           | web cursos                |

Correo Spam:  WhiteList -> envia el correo a la bandeja y guarda la dirección como válida.

​			: deliver -> solo lo manda a la bandeja.



**ALARMA**

clave: **1602**	clave coacción: 1604

botón derecha **poner**		botón izquierda **quitar**

botón mitad negro/blanco -> alarma parcial, la alarma solo esta puesta para los accesos (puertas, ventanas) pero te puedes mover.



docker Hub conectado automáticamente con la cuenta de GitHub.

Hay parte del código en bicbucket. **Bitbucket** es una plataforma de alojamiento basada en la web diseñada para proyectos que utilizan el sistema de control de versiones **Git**. Es propiedad de **Atlassian**.

Si Bitbucket es el lugar donde guardas el código fuente, **Docker Hub** es el lugar donde guardas las "aplicaciones terminadas" listas para ejecutarse.

Es el registro oficial en la nube de **Docker**, una biblioteca gigante que contiene imágenes de contenedores. Imaginalo como una **App Store** o un **Google Play**, pero en lugar de apps para el móvil, descargas entornos de software completos.



**Yakuake**: Consola que utilizan: F12 o desde la terminal yakuake&

Yakuake (Yet another Kuake) es un emulador de terminal desplegable diseñado para el entorno de escritorio KDE en Linux, incluido Debian. Su principal característica es que permanece oculto y aparece deslizándose desde la parte superior de la pantalla al presionar una tecla de acceso rápido (por defecto **F12**), lo que permite un acceso rápido a la línea de comandos sin cambiar de ventana. 



# Estructura proyecto symfony

c17 (workspace) -> www.c17.net

ReadModel (Ingles)

WriteModel (español)



Hay 3 directorios con el archivo composer.lock.

1. **ansible:** proceso de despliege

   1. deploy_prod: la de producción
   2. deploy_staging: la de preproducción

2. **web/**

   1. **portal**: aplicación para los usuarios

      1. **teenants:** (cliente), contiene personalizaciones por cliente. Ej: logo, particularidades específicas. Cada cliente tiene una carpeta. Aquí los clientes son siempre instituciones, que pueden tener 1 o varias bibliotecas.

         Cada teenant tiene sus usuarios, si un usuario cambia de teenant, se tiene que volver a registrar (NO lo movemos a otro).

   2. **sf17**: orientada a las bibliotecas, contiene la llamada al código antiguo (r17) desde el controlador SegullAppWrapper.

   3. **r17**: proyecto antiguo (LEGACY) 

3. **lib/**

   1. **c17-cqrs-bundle:** para que funcione (autocableado) de c17-cqrs

   2. **c17-cqrs:** conceptos básicos. Ej: command bus, command queue

   3. **c17-db-test**: está definida la base de datos de desarrollo para hacer las pruebas.

      Con el comando: composer pre-test y composes pre-dev restablece las bases de datos. Ejecuta el bin para limpiar las bds. Los datos de desarrollo y test son los mismos, pero son dos bases de datos.

      1. /files/fixtures/003-usuarios.yaml contiene los datos de los usuarios.

   4. **c17-domain-bundle**: para que funcione (autocableado) de c17-domain

   5. **c17-domain-doctrine**

   6. **c17-domain**: Es LEGACY por ahora no lo vemos, se tocará si hay algún error, esto ha ido avanzando a c17_model.

   7. **c17-model-bundle**

   8. **c17-model/src:** Es el nucleo, aquí va lo nuevo que vamos haciendo

      1. **Application**: casi siempre hay un archivo paralelo en cada carpeta de Command y CommandHandler

         1. **Command**
         2. **CommandHandler**

      2. **Dto**: (Data Transfer Object), parecido a ValueObject pero NO tienen Identidad, pasan información de un lado a otro.

      3. **Event**: Ej: cuando se da de alta y se quiere programar la baja, entonces se crea el evento

         1. **DomainEvent:** (se notifican dentro del sistema, todavía no ha terminado (modelo))
         2. **IntegrationEvent:** (se notifican hacia fuera, ej: enviar email, este es cuando todo ha terminado y no hay error)

         Del domain pasa al integration.

      4. **EventHandler**: Ej: ProgramadorBaja.php

         1. **DomainEventHandler**
         2. **IntegrationEventHandler**

      5. **Infraestructure**:

         1. **Doctrine:**
         2. **Elastica:**
            1. **Projection/IllRequest**
               1. FolderAgencyRowStore.php (biblioteca)
               2. FolderRequesterRowStore.php
            2. **ReadModel/IllRequest**
               1. AgencyBalanceReader.php
               2. FolderRowReader.php

      6. **Projection**: (son proyecciones de los datos), nosotros sólo tenemos 1 proyección, cuando hacemos una petición, cada biblioteca ve una proyección diferente (Máx 3 proyecciones)

      7. **ReadModel (Ingles)**

      8. **ValueObject**: objeto sin identidad, se identifica por sus propiedades (Reglas de Validación), siempre tiene que tener todo. 

         1. **BillingData**
         2. **CoverageYear**: (cobertura)
         3. **EmailAddress:**
         4. **Isbn:**
         5. **Issn:**
         6. **Locale:**
         7. **Url:**

      9. **WriteModel (español)**

   9. **c17-openurl-bundle**

   10. **c17-shared-bundle**: son bundles que se utilizan en el desarrollo nuevo para que se pueda utilizar tanto en portal como en sf17.

   11. **papi:** autentificación (enlace simbólico, ya lo veremos)

4. **patches:** en las versiones LEGACY se han añadido parches para que código antiguo funcione con las versiones nuevas de php.



# Información importante

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



# PHP 8

## Cambios incluidos en php 8:

1. **Argumentos Nombrados (Named Arguments)**

   Ya no necesitas pasar los argumentos en un orden estricto, ni pasar valores por defecto para llegar al parámetro que quieres cambiar. Permiten pasar valores a una función basándose en el **nombre del parámetro** en lugar de su posición.

   - **PHP 7:** `htmlspecialchars($string, ENT_COMPAT, 'UTF-8', false);`
   - **PHP 8:** `htmlspecialchars($string, double_encode: false);`

   **PHP 7: El problema del orden y los valores por defecto**

   En PHP 7 (y versiones anteriores), los argumentos son estrictamente **posicionales**. Si una función tiene 10 parámetros y solo quieres cambiar el último, estás obligado a pasar todos los anteriores, incluso si quieres que mantengan su valor por defecto.

   Ejemplo con una función imaginaria:

   ```php
   function configurarCookie($nombre, $valor, $expira = 0, $ruta = '', $dominio = '', $seguro = false) { 
       // ... 
   }
   
   // En PHP 7: Si solo quiero cambiar 'seguro' a true, tengo que rellenar todo:
   configurarCookie('test', '123', 0, '', '', true);
   ```

   - **Problema:** El código es difícil de leer (¿qué significa ese `0` o esos `''` vacíos?).
   - **Riesgo:** Si te saltas una coma o te equivocas de posición, el valor acaba en el parámetro incorrecto.

   ------

   **PHP 8: Claridad y flexibilidad**

   Con los argumentos nombrados, puedes saltarte los parámetros que ya tienen valores por defecto y especificar solo los que te interesan, en el orden que quieras.

   Ejemplo en PHP 8:

   ```php
   // Solo pasamos lo que necesitamos, usando el nombre del parámetro:
   configurarCookie(
       nombre: 'test',
       valor: '123',
       seguro: true
   );
   ```

   **Ventajas clave de los Named Arguments**

   1. **Código autodocumentado:** Al leer la llamada a la función, sabes exactamente qué significa cada valor sin tener que ir a buscar la definición de la función.
   2. **Independencia del orden:** Puedes pasar los argumentos en el orden que prefieras.
      - `test(a: 1, b: 2)` es lo mismo que `test(b: 2, a: 1)`.
   3. **Salto de parámetros opcionales:** Como viste en el ejemplo de la cookie, puedes ignorar 5 parámetros intermedios si ya tienen un valor por defecto definido.
   4. **Combinación:** Puedes mezclar argumentos posicionales con nombrados, siempre y cuando los nombrados vayan al final.
      - `test(1, 2, nombre: 'ejemplo')` es válido.

   **Un cambio importante: El nombre ahora importa**

   Antes de PHP 8, los programadores solían cambiar el nombre de las variables en los parámetros de las funciones sin miedo, porque no afectaba a quien usaba la función.

   Ahora, **el nombre del parámetro forma parte de la API pública**. Si cambias `$usuario` por `$cliente` en la definición de tu función, podrías romper el código de alguien que esté usando argumentos nombrados para llamar a esa función.

2. **Atributos:**

   Sustituyen a las anotaciones en los comentarios en bloque (PHPDoc). Ahora son metadatos estructurados nativos del lenguaje que se pueden consultar mediante Reflaction.

   Sirven para **añadir información de configuración a una clase, método o propiedad** sin tener que escribir código ejecutable para ello. Se usan principalmente en:

   - **Rutas:** Definir URLs en frameworks como Symfony o Laravel.
   - **ORM (Bases de datos):** Indicar que una propiedad es una columna de la base de datos (Doctrine).
   - **Validación:** Marcar que un campo debe ser un email o tener una longitud mínima.
   - **Inyección de dependencias:** Marcar qué servicios deben inyectarse.

   - **PHP 7:** `/ @Route("/api/data") */`
   - **PHP 8:** `#[Route('/api/data')]`

3. **Promoción de Propiedades del Constructor**

   Reduce drásticamente el código repetitivo ("boilerplate"). Permite combinar tres pasos en uno solo: definir una propiedad, definir un parámetro en el constructor y asignarlo.

   En **PHP 7**, para crear una clase simple (como un DTO o un objeto de Valor), tenías que repetir el nombre de la variable al menos **cuatro veces**. Esto generaba mucho código visualmente ruidoso y propenso a errores de "copia y pega".

   ### PHP 7 (El método largo)

   Observa cómo `$nombre` se repite constantemente:

   ```php
   class Usuario {
       public string $nombre; // 1. Definición
       public string $email;
   
       public function __construct(
           string $nombre, // 2. Parámetro
           string $email
       ) {
           $this->nombre = $nombre; // 3. Asignación
           $this->email = $email;
       }
   }
   ```

   ### PHP 8 (Propiedades Promovidas)

   En PHP 8, solo necesitas definir la propiedad **dentro de los paréntesis del constructor** añadiendo el modificador de visibilidad (`public`, `protected` o `private`).

   ```php
   class Usuario {
       public function __construct(
           public string $nombre,
           public string $email,
       ) {} // El cuerpo puede estar vacío
   }
   ```

   **¿Cuándo se utiliza?**

   Se recomienda utilizarlo **siempre que el constructor solo se encargue de asignar los parámetros de entrada a las propiedades de la clase**.

   Es ideal para:

   - **DTOs (Data Transfer Objects):** Objetos que solo transportan datos.
   - **Inyección de dependencias:** Cuando pasas servicios a un controlador o comando.
   - **Modelos de dominio simples.**

   

   **¿Cómo se utiliza? (Reglas clave)**

   Para que PHP entienda que quieres "promocionar" una propiedad, debes cumplir estos requisitos:

   1. **Visibilidad obligatoria:** Debes anteponer `public`, `protected` o `private`. Si solo pones `string $nombre`, PHP lo tratará como un parámetro normal del constructor y no creará la propiedad en la clase.
   2. **No se pueden repetir:** No puedes declarar la propiedad fuera y también en el constructor.
   3. **Tipado opcional pero recomendado:** Puedes usar tipos (como `int`, `string`, `bool`) o no, pero lo ideal es usarlos para aprovechar la robustez de PHP 8.
   4. **Valores por defecto:** Puedes asignar valores por defecto igual que en cualquier función.

   ```php
   class Producto {
       public function __construct(
           public string $sku,
           public float $precio = 0.0,
           protected bool $enStock = true,
       ) {}
   }
   ```

   | **Característica**   | **PHP 7.x**                                                  | **PHP 8.x**                                                  |
   | -------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
   | **Líneas de código** | Muchas (Boilerplate) Debías declarar la propiedad, pasarla al constructor y asignarla manualmente con `$this->x = $x`. | Se hace todo en una sola línea dentro de los paréntesis del constructor. Mínimas |
   | **Repetición**       | Alta (Definición, Parámetro, Asignación)                     | Nula (Se hace todo en el parámetro)                          |
   | **Legibilidad**      | El constructor se ve saturado                                | El constructor es limpio y directo                           |
   | **Mantenimiento**    | Si cambias un nombre, lo cambias en 3 sitios                 | Lo cambias en un solo sitio                                  |

4.  **Tipos de Unión (Union Types)**

   En lugar de depender de anotaciones PHPDoc para indicar que una variable puede tener varios tipos, ahora puedes definirlo directamente en la firma de la función.

   - **Sintaxis:** `public function setNumber(int|float $number): void`

5. **Expresión Match**

   Es el "hermano mayor" y más inteligente del `switch`.

   Diferencias:

   - `switch` 

     - Es una sentencia de control (como un if),  
     - Utiliza comparaciones débiles (==). Esto significa que el número 0 será igual al string "0".
     - No devuelve nada por si mismo, tienes que asignar el resultado a una variable dentro de cada `case`.
     - Si olvidas el `break`, el código seguirá ejecutándose hacia el siguiente case. Esto es una fuente constante de bugs.
     - Si una condición coincide y  no hay un default, simplemente no pasa nada.

   - `match` 

     - Es una expresión (devuelve un valor).
     - Utiliza comparaciones estrictas (`===`) , el tipo y el valor deben coincidir exáctamente.
     - Devuelve un valor directamente, por lo que puedes asignarlo a una variable o usarlo en un return de una sola vez
     - Solo ejecuta el brazo que coincide, no necesita `break`, lo que evita errores comunes.
     - Debe set exahustivo. Si no hay una coincidencia y no definiste  un default, PHP lanzará un error (UnhandleMatchError). Esto te obliga a manejar todos los casos posibles.

     Switch:

     ```php
     switch ($estado) {
         case 200:
         case 300:
             $mensaje = "OK";
             break;
         case 400:
             $mensaje = "Error";
             break;
         default:
             $mensaje = "Desconocido";
     }
     ```

     ```php
     $mensaje = match ($estado) {
         200, 300 => "OK",
         400      => "Error",
         default  => "Desconocido",
     };
     ```

     | **Característica**        | **switch**                    | **match**                       |
     | ------------------------- | ----------------------------- | ------------------------------- |
     | **Tipo de comparación**   | Débil (`==`)                  | Estricta (`===`)                |
     | **Resultado**             | Sentencia (no devuelve valor) | Expresión (devuelve valor)      |
     | **Necesita `break`**      | Sí                            | No                              |
     | **Múltiples condiciones** | `case X: case Y:`             | `X, Y => ...`                   |
     | **Exhaustividad**         | No obligatoria                | Obligatoria (lanza Fatal Error) |

     En resumen: usa `match` siempre que necesites asignar un valor basado en una condición simple. Usa `switch` solo si necesitas ejecutar bloques de código complejos (varias líneas por caso) donde no te importe la comparación estricta.

6. **Operador Nullsafe**

   Se acabó el anidamiento infinito de comprobaciones if($obj !== null)

   - **Uso:** `$country = $session?->user?->getAddress()?->country;`

     Si cualquier elemento de la cadena es `null`, la ejecución se detiene y devuelve `null` sin lanzar un error.

7. **Comparaciones más lógicas:** PHP 8 corrigió casos extraños donde `0 == "foobar"` devolvía `true`. Ahora es `false`.

8. **Errores consistentes:** Muchas advertencias (Warnings) de PHP 7 ahora son errores fatales o excepciones en PHP 8, lo que obliga a escribir código más limpio.

9. **Coma final:** (trailling comma) Ahora se permite dejar una coma al final en la lista de parámetros de funciones y clausuras. Las razones son:

   1.  **"Diffs" más limpios en Git**

      Cuando trabajas en equipo y usas sistemas de control de versiones como Git, la coma final evita ruido innecesario en los historiales de cambios.

      - **Sin coma final:** Si quieres añadir un nuevo parámetro al final, tienes que editar la línea anterior para ponerle la coma y luego añadir la línea nueva. Git marcará **dos líneas cambiadas**.
      - **Con coma final:** Solo añades la línea nueva. Git marca **una sola línea cambiada**.

   2. **Mayor facilidad para reordenar parámetros**

      Si estás usando un IDE (como VS Code o PhpStorm) y necesitas mover un parámetro hacia arriba o hacia abajo, no tienes que preocuparte por borrar o añadir comas manualmente para que la sintaxis no se rompa. Todas las líneas son estructuralmente idénticas.

   3. **Generación de código automática**

      Para herramientas que generan código PHP automáticamente (como generadores de mocks, proxies o herramientas de refactorización), es mucho más sencillo imprimir siempre una coma después de cada argumento que tener que implementar una lógica para detectar cuál es el "último" elemento y omitirla.

   **Ejemplo de sintaxis en PHP 8.0+**

   Ahora es válido tanto en la **definición** de la función como en la **llamada**:

   ```php
   // Definición
   function registrarUsuario(
       string $nombre,
       string $email,
       int $edad, // <-- Coma final permitida
   ) {
       // ...
   }
   
   // Llamada
   registrarUsuario(
       'Alex',
       'alex@example.com',
       30, // <-- Coma final permitida
   );
   ```

10. 



## Documentación de funcionalidades de php:

### Tipos

#### Mixed:

Es un tipo nativo de PHP 8 que indíca explícitamente que un valor puede ser cualquier tipo posible

```php
mixed = null | bool | int | float | string | array | object | resource
```

Es el tipo más amplio que existe. Decirlo explícitamente es diferente a no decir nada: es una declaración consciente de ambigüedad.

Se utiliza para documentar intencionalmente que una función acepta o retorna cualquier tipo, sin comprometerse a uno en concreto.

**¿Cuándo se usa?** 

1. **Interfaces o contratos que no pueden conocer el tipo de retorno**

   ```php
   interface HandlerInterface
   {
       public function handle(mixed $data): mixed;
   }
   ```

2. **Deserialización/transformación de datos**

   ```php
   class JsonDecoder
   {
       public function decode(string $json): mixed
       {
           return json_decode($json, true);
           // Puede devolver array, string, int, bool o null
       }
   }
   ```

3. **Caché — no sabe qué se almacenó:**

   ```php
   class CacheService
   {
       public function get(string $key): mixed
       {
           return $this->cache->getItem($key)->get();
           // Puede ser cualquier cosa que se guardó
       }
   }
   ```

4. **Con genéricos `@template` cuando PHP no puede tipar nativamente:**

   ```php
   /**
    * @template T
    * @param class-string<T> $class
    * @return T
    */
   public function deserialize(string $data, string $class): mixed
   {
       return $this->serializer->deserialize($data, $class, 'json');
   }
   ```

   Aquí `mixed` es el tipo PHP real, pero PHPStan entiende el retorno como `T`.

5. **Argumentos de middelware o eventos genéricos:**

   ```php
   class Pipeline
   {
       public function send(mixed $payload): mixed
       {
           foreach ($this->pipes as $pipe) {
               $payload = $pipe($payload);
           }
           return $payload;
       }
   }
   ```

Cuando no usar mixed:

```php
// ❌ Mal — usas mixed cuando conoces el tipo
public function getUser(): mixed
{
    return $this->userRepository->find(1);
}

// ✅ Bien — sé específico
public function getUser(): ?User
{
    return $this->userRepository->find(1);
}

// ❌ Mal — tienes pocas opciones conocidas
public function getValue(): mixed {}

// ✅ Bien — usa union types
public function getValue(): int|string|null {}
```



### **Argumentos**

1. **Argumentos posicionales (El método tradicional)**

   Los valores se asignan a las variables del método según el orden en el que aparecen en la definición.

   ```php
   class Calculadora {
       public function sumar(int $a, int $b): int {
           return $a + $b;
       }
   }
   
   $calc = new Calculadora();
   $calc->sumar(10, 20); // 10 va a $a, 20 va a $b
   ```

2. **Argumentos Nombrados (Named Arguments)**

   Introducidos en PHP 8, permiten pasar valores especificando el nombre del parámetro. Esto hace que el orden sea irrelevante y el código sea mucho más legible.

   ```php
   $user->actualizarPerfil(
       nombre: 'Ana',
       premium: true,
       edad: 25
   );
   ```

   Ventaja: si el método tiene muchos parámetros opcionales, puedes saltarte los que no necesites sin pasar valores por defecto intermedios.

   Nota: El nombre de la variable en el método ahora es parte de tu "contrato". Si cambias `$name` por `$username` en la clase, romperás todas las llamadas que usen `name:'valor'`

3. **Desempaquetado de Arrays (Splat Operator...)**

   Si tienes una lista de datos en un array, puedes "esparcirlos" dentro del método. PHP los asignará automáticamente a los parámetros.

   - Con array indexados: Se comportan como posicionales.
   - Con arrays asociativos (PHP 8,1+): Se comportan como argumentos nombrados.

   ```php
   $datos = ['nombre' => 'Luis', 'edad' => 30];
   
   // PHP 8.1 descompone el array y busca los parámetros por nombre
   $persona->configurar(...$datos);
   ```

4. **Tipado estricto (Type Hinting)**: En PHP 8 se define que tipo de dato esperas, si envías algo diferente, PHP lanzará un error TypeError

   ```php
   public function procesar(string $texto, float $cantidad, bool $esValido) {
       // ...
   }
   ```

5. **El operador Nullsafe en la llamada**

   A veces, para enviar un argumento a un método, primera necesitas obtenerlo de otro objeto que podría ser `null`. En PHP 8, se puede hacer de forma segura en la mísma línea.

   ```php
   // Si getConfig() devuelve null, la cadena se rompe y no da error
   $logger->log($session?->getConfig()?->getLogLevel());
   ```



| **Técnica**       | **Cuándo usarla**                                            |
| ----------------- | ------------------------------------------------------------ |
| **Posicionales**  | Para métodos cortos (1-2 argumentos) donde el orden es obvio. |
| **Nombrados**     | Para métodos con muchos parámetros o valores booleanos confusos. |
| **Splat (`...`)** | Cuando los datos vienen de una base de datos o una API como array. |
| **Union Types**   | Cuando un argumento puede recibir varios tipos (ej: `int     |





### Métodos

#### __invoke

Es un método mágico de PHP que permite usar un objeto como si fuera una función. Cuando llamas a un objeto con (), PHP ejecuta automáticamente su método __invoke 

```php
$obj = new MiClase();
$obj(); // ejecuta $obj->__invoke()
```

Sirve para crear objetos que tienen **una única responsabilidad**, expresada como una acción invocable. Es la implantación del patrón **Single Action/Callable Object**

Uso básico:

```php
class Multiplier
{
    public function __construct(
        private readonly int $factor
    ) {}

    public function __invoke(int $number): int
    {
        return $number * $this->factor;
    }
}

$double = new Multiplier(2);
$triple = new Multiplier(3);

echo $double(5);  // 10
echo $triple(5);  // 15

// También funciona como callable
$numbers = [1, 2, 3, 4, 5];
$result = array_map(new Multiplier(2), $numbers); // [2, 4, 6, 8, 10]
```

Para verificar si un objeto es invocable: 

```php
$handler = new CreateUserHandler($repo, $hasher);

// Comprobar si es callable
if (is_callable($handler)) {
    $handler($command);
}

// Con is_callable en servicios dinámicos
class HandlerLocator
{
    public function handle(object $message): mixed
    {
        $handler = $this->findHandler($message);

        if (!is_callable($handler)) {
            throw new \RuntimeException('Handler must be invocable');
        }

        return $handler($message);
    }
}
```



**toArray():**

PHP no serializa objetos automáticamente, por ello se necesita una forma explícita de convertir tus objetos a estructuras simples:

```bash
Objeto  →  toArray()  →  Array  →  JSON / Base de datos / API / Tests
```

En symfony se suele usar en:

- **ValueObjects**: objeto que representa un concepto del dominio con reglas propias. Valida sus propios datos, es inmutable y no tiene identidad propia: dos ValueObjects con los mismos datos son iguales.

  ```php
  final class Address
  {
      public function __construct(
          private readonly string $street,
          private readonly string $city,
          private readonly string $country,
          private readonly string $postalCode
      ) {}
  
      public function toArray(): array
      {
          return [
              'street'      => $this->street,
              'city'        => $this->city,
              'country'     => $this->country,
              'postal_code' => $this->postalCode,
          ];
      }
  
      public static function fromArray(array $data): self
      {
          return new self(
              $data['street'],
              $data['city'],
              $data['country'],
              $data['postal_code']
          );
      }
  }
  
  // Uso
  $address = new Address('Calle Mayor 1', 'Madrid', 'ES', '28001');
  $array   = $address->toArray();
  // ['street' => 'Calle Mayor 1', 'city' => 'Madrid', ...]
  ```

  

- **DTOs** (Data Transfer Objects), objejto **sin lógica de negocio** cuyo único propósito es transportar (mover) datos de un sitio a otro. No sabe nada del dominio, no valida reglas de negocio, solo agrupa datos.

  ```php
  final class CreateUserDTO
  {
      public function __construct(
          public readonly string $name,
          public readonly string $email,
          public readonly string $password,
          public readonly string $role = 'ROLE_USER'
      ) {}
  
      public function toArray(): array
      {
          return [
              'name'     => $this->name,
              'email'    => $this->email,
              'password' => $this->password,
              'role'     => $this->role,
          ];
      }
  
      public static function fromRequest(Request $request): self
      {
          $data = json_decode($request->getContent(), true);
  
          return new self(
              name:     $data['name'],
              email:    $data['email'],
              password: $data['password'],
              role:     $data['role'] ?? 'ROLE_USER'
          );
      }
  }
  ```

- **Entidades de dominio:**

  ```php
  class User
  {
      private UserId $id;
      private Email $email;
      private string $name;
      private UserStatus $status;
      private \DateTimeImmutable $createdAt;
  
      // ...constructor y métodos de dominio...
  
      public function toArray(): array
      {
          return [
              'id'         => $this->id->value(),
              'email'      => $this->email->value(),
              'name'       => $this->name,
              'status'     => $this->status->value,   // Enum
              'created_at' => $this->createdAt->format(\DateTimeInterface::ATOM),
          ];
      }
  }
  ```

- **Colecciones tipadas:** 

  ```php
  /**
   * @template T
   */
  class Collection
  {
      /** @var T[] */
      private array $items = [];
  
      /** @param T $item */
      public function add(mixed $item): void
      {
          $this->items[] = $item;
      }
  
      /**
       * @return T[]
       */
      public function toArray(): array
      {
          return $this->items;
      }
  
      public function count(): int
      {
          return count($this->items);
      }
  
      public function isEmpty(): bool
      {
          return empty($this->items);
      }
  }
  
  // Colección específica
  class UserCollection extends Collection
  {
      public function toArray(): array
      {
          return array_map(
              fn(User $user) => $user->toArray(),
              parent::toArray()
          );
      }
  }
  
  // Uso
  $users = new UserCollection();
  $users->add($user1);
  $users->add($user2);
  
  return $this->json($users->toArray());
  ```

- **En respuestas de API (JsonResponse)**

  ```php
  class GetUserController extends AbstractController
  {
      public function __invoke(#[MapEntity] User $user): JsonResponse
      {
          // Sin toArray — acoplado a la entidad
          return $this->json([
              'id'    => $user->getId(),
              'email' => $user->getEmail(),
          ]);
  
          // Con toArray — limpio y reutilizable ✅
          return $this->json($user->toArray());
      }
  }
  ```

- **Patrón con interfaz:**

  ```php
  interface Arrayable
  {
      public function toArray(): array;
  }
  
  // Todos los objetos que implementen esta interfaz
  // son serializables de forma predecible
  
  class Order implements Arrayable
  {
      public function toArray(): array
      {
          return [
              'id'         => $this->id->value(),
              'status'     => $this->status->value,
              'total'      => $this->total->amount(),
              'currency'   => $this->total->currency(),
              'lines'      => array_map(
                  fn(OrderLine $line) => $line->toArray(),
                  $this->lines
              ),
              'created_at' => $this->createdAt->format(\DateTimeInterface::ATOM),
          ];
      }
  }
  
  class OrderLine implements Arrayable
  {
      public function toArray(): array
      {
          return [
              'product_id' => $this->productId->value(),
              'quantity'   => $this->quantity,
              'price'      => $this->price->amount(),
              'subtotal'   => $this->subtotal()->amount(),
          ];
      }
  }
  ```

- **En test:**

  ```php
  class UserTest extends TestCase
  {
      public function testToArray(): void
      {
          $user = User::create(
              UserId::fromString('uuid-123'),
              new Email('test@test.com'),
              'John Doe'
          );
  
          $array = $user->toArray();
  
          $this->assertArrayHasKey('id', $array);
          $this->assertArrayHasKey('email', $array);
          $this->assertArrayHasKey('name', $array);
          $this->assertEquals('test@test.com', $array['email']);
          $this->assertEquals('John Doe', $array['name']);
      }
  }
  ```

- `fromArray()` — el complemento natural

  ```php
  final class Money
  {
      public function __construct(
          private readonly int $amount,
          private readonly string $currency
      ) {}
  
      // Objeto → Array
      public function toArray(): array
      {
          return [
              'amount'   => $this->amount,
              'currency' => $this->currency,
          ];
      }
  
      // Array → Objeto
      public static function fromArray(array $data): self
      {
          return new self(
              amount:   $data['amount'],
              currency: $data['currency']
          );
      }
  }
  
  // Ciclo completo
  $money        = new Money(1999, 'EUR');
  $array        = $money->toArray();          // serializar
  $moneyRestored = Money::fromArray($array);  // deserializar
  ```

- `toArray()` vs Symfony Serializer

  ```php
  // toArray() manual — control total, sin dependencias
  $data = $user->toArray();
  
  // Symfony Serializer — automático, más potente
  $data = $this->serializer->normalize($user, 'array');
  $json = $this->serializer->serialize($user, 'json');
  ```

|                   | `toArray()` manual            | Symfony Serializer              |
| ----------------- | ----------------------------- | ------------------------------- |
| **Control**       | Total                         | Configurable                    |
| **Dependencias**  | Ninguna                       | Symfony Serializer              |
| **Complejidad**   | Simple                        | Mayor configuración             |
| **Grupos**        | Manual                        | `#[Groups(['api'])]`            |
| **Recursividad**  | Manual                        | Automática                      |
| **Cuándo usarlo** | Objetos simples, dominio puro | Objetos complejos, APIs grandes |



**Resumen**

| Concepto          | Detalle                                           |
| ----------------- | ------------------------------------------------- |
| **Qué es**        | Método de diseño para convertir objeto → array    |
| **Es nativo PHP** | No, se implementa manualmente                     |
| **Complemento**   | `fromArray()` para el camino inverso              |
| **Dónde**         | Value Objects, DTOs, Entidades, Colecciones       |
| **Para qué**      | JSON, tests, persistencia, transferencia de datos |
| **Alternativa**   | Symfony Serializer para casos más complejos       |



- **new self()**: Crea una nueva instancias de la misma clase desde dentro de la propia clase, es la forma de instanciar el objeto actual sin escribir su nombre explícitamente.

  ```php
  final class Email
  {
      public static function create(string $value): self
      {
          return new self($value); // crea un nuevo Email
      }
  }
  ```

  Cuando y para qué usarlo:

  1. **Named Constructors** (el uso más importante)

     Crear instancias con nombres semánticos en lugar del constructor directo. Es un método estático que actúa como una forma alternativa de crear instancias de una clase, en lugar de usar directamente `new ClassName`

     `self`hace referencia a la clase donde está definido el método, en tiempo de compilación.

     **El problema con `__construct` solo**

     ```php
     // ¿Qué significa este User? ¿Viene de registro? ¿De BD? ¿Es admin?
     $user = new User('juan@email.com', null, true, 'hashed_pass', new \DateTime());
     ```

     Demasiados parámetros, sin contexto semántico.

     

     **Named Constructors con `self`**

     ```php
     class User
     {
         private function __construct(  // privado: fuerza usar los named constructors
             private readonly string $email,
             private readonly string $passwordHash,
             private readonly string $role,
             private readonly \DateTimeImmutable $createdAt,
         ) {}
     
         // Named Constructor #1: registro normal
         public static function register(string $email, string $plainPassword): self
         {
             return new self(
                 email: $email,
                 passwordHash: password_hash($plainPassword, PASSWORD_BCRYPT),
                 role: 'ROLE_USER',
                 createdAt: new \DateTimeImmutable(),
             );
         }
     
         // Named Constructor #2: usuario admin
         public static function createAdmin(string $email, string $plainPassword): self
         {
             return new self(
                 email: $email,
                 passwordHash: password_hash($plainPassword, PASSWORD_BCRYPT),
                 role: 'ROLE_ADMIN',
                 createdAt: new \DateTimeImmutable(),
             );
         }
     
         // Named Constructor #3: restaurar desde base de datos
         public static function fromDatabase(array $row): self
         {
             return new self(
                 email: $row['email'],
                 passwordHash: $row['password_hash'],
                 role: $row['role'],
                 createdAt: new \DateTimeImmutable($row['created_at']),
             );
         }
     }
     ```

  2. 

  

  #### `self` vs `static` vs `$this`

  ```php
  class Base
  {
      public function getThis(): static        // $this  → el objeto actual, no crea nada
      {
          return $this;
      }
  
      public static function createSelf(): self  // self   → la clase donde está escrito
      {
          return new self();
      }
  
      public static function createStatic(): static // static → la clase que lo llama (late binding)
      {
          return new static();
      }
  }
  
  class Child extends Base {}
  
  $child = new Child();
  
  // self   → siempre instancia Base (donde está escrito el código)
  $obj = Child::createSelf();    // instanceof Base ✅ instanceof Child ❌
  
  // static → instancia la clase que hace la llamada
  $obj = Child::createStatic();  // instanceof Child ✅ instanceof Base ✅
  ```

  

- 





### Aserciones webMozart

La librería webmozart/assert es una herramienta de validación de datos diseñada para hacer que el código php sea más robusto, legible y menos propenso a errores, permite validaciones en una sola línea, si la condición falla lanza automáticamente una excepción de tipo `\InvalidArgumentException`, es fundamental para el tipado estricto.

Se utiliza principalmente para validar los datos de entrada de una función o método antes de procesarlos.

- Validaciones complejas: PHP nativo valida si algo es un string, pero webmozart valida si es un "string que representa un email", "un string que no está vacío" o "un string que es un  número de tarjeta de crédito".
- Limpieza de código: Sustituye bloques de 4 o 5 líneas de if/throw por una sola línea.
- Documentación viva: Al leer las aserciones al principio de un método, cualquier programador entiende que restricciones tienen los datos.

Instalación:

```bash
composer require webmozart/assert
```

**Ejemplos prácticos PHP 8 vs. Webmozart**

**Sin Webmozart (Código ruidoso):**

```php
public function registrarUsuario(array $datos) {
    if (!isset($datos['email']) || !filter_var($datos['email'], FILTER_VALIDATE_EMAIL)) {
        throw new InvalidArgumentException("Email inválido");
    }
    if (!isset($datos['edad']) || !is_int($datos['edad']) || $datos['edad'] < 18) {
        throw new InvalidArgumentException("Debe ser mayor de edad");
    }
    // ...
}
```

**Con Webmozart (Código limpio):**

```php
use Webmozart\Assert\Assert;

public function registrarUsuario(array $datos) {
    Assert::keyExists($datos, 'email');
    Assert::email($datos['email'], 'El correo electrónico no es válido');
    
    Assert::keyExists($datos, 'edad');
    Assert::integer($datos['edad']);
    Assert::greaterThanEq($datos['edad'], 18, 'El usuario debe ser mayor de edad');
    
    // Si llega aquí, los datos son 100% seguros
}
```

**Tipos de aserciones comunes**

La librería tiene más de 100 métodos. Aquí los más usados:

| **Categoría**   | **Método de ejemplo**              | **Lo que hace**                                              |
| --------------- | ---------------------------------- | ------------------------------------------------------------ |
| **Tipos**       | `Assert::string($v)`               | Verifica que sea una cadena.                                 |
| **Cadenas**     | `Assert::startsWith($v, 'prefix')` | Verifica cómo empieza el texto.                              |
| **Números**     | `Assert::range($v, 1, 10)`         | Verifica que el número esté entre 1 y 10.                    |
| **Arrays**      | `Assert::allInteger($array)`       | Verifica que **todos** los elementos del array sean enteros. |
| **Nulabilidad** | `Assert::nullOrString($v)`         | Pasa si es `null` O si es un `string`.                       |

**El super poder:** validar colecciones

Una de las mayores utilildades en PHP es validar el contenido de los arrays, PHP nativo solo te dice que es un array, peo no que hay dentro.

```php
/** @param Usuario[] $usuarios */
public function procesarUsuarios(array $usuarios) {
    // Esto asegura que cada elemento del array sea una instancia de la clase Usuario
    Assert::allIsInstanceOf($usuarios, Usuario::class);
    
    foreach ($usuarios as $usuario) {
        // Aquí el IDE ya sabe que $usuario es de tipo Usuario
        $usuario->enviarNotificacion();
    }
}
```

Aunque Symfony 7 tiene su propio componente de validación (**Validator**), Webmozart cumple un rol distinto: la validación interna del código (Domain Validation) frente a la validación de entrada (UI Validation).

**Diferencias entre Webmozar y Symfony Validator**

| **Característica** | **Symfony Validator (#[Assert\...])**          | **Webmozart Assert (Assert::...)**                           |
| ------------------ | ---------------------------------------------- | ------------------------------------------------------------ |
| **Cuándo actúa**   | Al recibir datos externos (Formularios/API).   | En cualquier punto de la lógica interna.                     |
| **Resultado**      | Devuelve una lista de errores (Violations).    | Lanza una Excepción inmediata (Detiene la ejecución).        |
| **Uso principal**  | Validar que un usuario escribió bien su email. | Asegurar que un programador no pasó un dato inválido a un servicio. |

**Casos de uso en Symfony 7**

1. **En Servicios (Inyección de dependencias)**

   Imagina un servicio que envía correos. Quieres asegurarte de que, sin importar quien lo llame, el email sea válido y no esté vacio.

   ```php
   namespace App\Service;
   
   use Webmozart\Assert\Assert;
   
   class EmailSpammer
   {
       public function send(string $email, array $tags): void
       {
           // Validamos que el string sea un email real
           Assert::email($email, "El correo %s no tiene un formato válido");
           
           // Validamos que el array de tags no esté vacío y solo contenga strings
           Assert::notEmpty($tags);
           Assert::allString($tags);
   
           // ... lógica para enviar el correo
       }
   }
   ```

2. **Entidades (Garantizar integridad)**

   En Symfony 7 puedes usarlo en los setters o en el constructor para evitar que tu base de datos se llene de "basura" si alguien se salta el formulario de symfony.

   ```php
   #[ORM\Entity]
   class Producto
   {
       public function setPrecio(float $precio): void
       {
           // No permitimos precios negativos en el corazón del objeto
           Assert::greaterThanEq($precio, 0, "El precio no puede ser negativo");
           $this->precio = $precio;
       }
   }
   ```

3. **Validando Configuraciones o Parámetros**

   Si tienes un comando de consola que recibe argumentos, puedes validarlos rápidamente antes de procesar nada.

   ```php
   protected function execute(InputInterface $input, OutputInterface $output): int
   {
       $userId = (int) $input->getArgument('user_id');
       
       // Aseguramos que el ID sea un entero positivo
       Assert::positiveInteger($userId);
   
       // ...
   }
   ```

   **Mejores prácticas en Symfony 7**

   1. **No lo uses para formularios**

      Para formularios que el usuario rellena, sigue usando el componente `Validator` de Symfony. Usa Webmozart para validar lo que pasa **después** de que el formulario sea válido, dentro de tus clases de lógica de negocio (Action classes, Services, Domain models).

   2. **Aprovecha el tipado estático (PHPStan/Psalm)**

      Si escribes `Assert::string($variable)`, herramientas como PHPStan sabrán que, a partir de esa línea, `$variable` es un string, ayudándote a detectar errores antes de ejecutar el código.

   3. **Personaliza los mensajes**

      Webmozar permite usar placeholders como %s para incluir el valor fallido en el mensaje de error:

      Assert::minLength($password, 8, "La contraseña es demasiado corta, debe tener 8 caracteres.");

   4. 





### **@template T**

En PHP/Symfony el `@template T` viene del ecosistema **PHPStan / Psalm** (análisis estático), no de PHP en sí. PHP no tiene genéricos nativos, pero estas herramientas los simulan mediante anotaciones en docblocks.

Sirve para declarar **tipos genéricos** en clases, interfaces y funciones, permitiendo que el analizador estático infiera el tipo concreto según el uso, sin perder type safety.

**Ejemplos en contexto Symfony 7**

**Repositorio genérico:**

```php
/**
 * @template T of object
 */
class GenericRepository
{
    /**
     * @param class-string<T> $entityClass
     */
    public function __construct(
        private readonly EntityManagerInterface $em,
        private readonly string $entityClass
    ) {}

    /**
     * @return T|null
     */
    public function find(int $id): ?object
    {
        return $this->em->find($this->entityClass, $id);
    }

    /**
     * @return T[]
     */
    public function findAll(): array
    {
        return $this->em->getRepository($this->entityClass)->findAll();
    }
}
```

Uso:

```php
/** @var GenericRepository<User> $repo */
$repo = new GenericRepository($em, User::class);

$user = $repo->find(1); // PHPStan sabe que es User|null
```

------

**Colección tipada:**

```php
/**
 * @template T
 */
class TypedCollection
{
    /** @var T[] */
    private array $items = [];

    /**
     * @param T $item
     */
    public function add(mixed $item): void
    {
        $this->items[] = $item;
    }

    /**
     * @return T[]
     */
    public function all(): array
    {
        return $this->items;
    }
}

// Uso
/** @var TypedCollection<Product> $products */
$products = new TypedCollection();
$products->add(new Product()); // ✅
$products->add(new User());    // ❌ PHPStan avisa
```

------

**Servicio genérico con `@template-extends`:**

Muy común en Symfony al extender `ServiceEntityRepository`:

```php
/**
 * @extends ServiceEntityRepository<User>
 */
class UserRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, User::class);
    }

    // findAll(), find(), etc. ya devuelven User tipado
}
```

> Symfony genera esto automáticamente con `make:repository`. El `@extends` usa `@template` internamente definido en la clase padre.

------

**Función genérica:**

```php
/**
 * @template T of \Throwable
 * @param class-string<T> $exceptionClass
 * @param callable(): mixed $callback
 * @throws T
 */
function wrapException(string $exceptionClass, callable $callback): mixed
{
    try {
        return $callback();
    } catch (\Throwable $e) {
        throw new $exceptionClass($e->getMessage(), 0, $e);
    }
}
```



**Variantes de la anotación**

| Anotación                     | Uso                                  |
| ----------------------------- | ------------------------------------ |
| `@template T`                 | Tipo genérico libre                  |
| `@template T of Foo`          | T debe extender/implementar `Foo`    |
| `@template-extends Foo<T>`    | Al extender una clase genérica       |
| `@template-implements Bar<T>` | Al implementar una interfaz genérica |
| `@template-covariant T`       | Solo lectura (Psalm)                 |

**Configuración necesaria**

Para que funcione en Symfony 7, necesitas PHPStan con la extensión de Doctrine:

```bash
composer require --dev phpstan/phpstan
composer require --dev phpstan/extension-installer
composer require --dev phpstan/phpstan-doctrine
composer require --dev phpstan/phpstan-symfony
```

`phpstan.neon`:

```neon
parameters:
    level: 8
    paths:
        - src
```



**Resumen**

|                          |                                                      |
| ------------------------ | ---------------------------------------------------- |
| **Quién lo interpreta**  | PHPStan / Psalm (no PHP en runtime)                  |
| **Para qué**             | Type safety en estructuras reutilizables             |
| **Más usado en Symfony** | Repositorios (`@extends ServiceEntityRepository<T>`) |
| **Requisito**            | PHPStan nivel 6+ para aprovechar genéricos           |



# SYMFONY

**Servicio**: clase PHP que hace un trabajo.

**Contenedor de servicios:** instancia los objetos servicios

**Bundle**: nos da servicios (plugins).

El bundle **KnpTimeBundle** permite crear una fecha: `new DateTimeInmutable()` y puede dar el tiempo transcurrido desde la fecha introducida hasta la actual.

**dump:** función de depuración del componente VarDumper de Symfony. Es un reemplazo mejorado de `var-dump` nativo de php.

Permite inspeccionar variables durante el desarrollo: objetos, arrays, entidades Doctrine, request, formularios, colecciones, etc, con una salida visual mucho más legible

Instalación:

```bash
composer require --dev symfony/var-dumper
```

Uso:

```php
$user = new User();
$user->setName('Esther');

dump($user);          // imprime y continúa la ejecución
dd($user);            // imprime y detiene la ejecución (dump & die)
dump($a, $b, $c);     // puedes pasar múltiples variables
```

Para usarlo en plantilla twig:

```twig
{{ dump(form) }}
{{ dump(entity) }}
```

En un servicio o command:

```php
dump($this->someService->getData());
```

**¿Dónde aparece la salida?**

| Contexto           | Dónde aparece                           |
| ------------------ | --------------------------------------- |
| Controlador (HTTP) | En la **Web Debug Toolbar** (pestaña 🎯) |
| Twig               | Inline en la página HTML                |
| Consola / Command  | Directamente en el terminal             |
| Test               | En la salida del test                   |

`dump()` solo debería usarse en **entorno de desarrollo**. En producción, si el componente está instalado solo como `--dev`, no estará disponible. Symfony lanza un error si se intenta usar en prod sin tenerlo instalado.



## **Peticiones HTTP:**

Las peticiones HTTP están representadas por el objeto `Request`del componente `HttpFoundation`. Es la abstracción orientada a objetos de todo lo que el navegador/cliente envía al servidor.

**El objeto `Request`** 

```php
use Symfony\Component\HttpFoundation\Request;

public function index(Request $request): Response
{
    // Symfony inyecta el objeto automáticamente
}
```

**¿Qué contiene el objeto `Request`?**

```php
// URL y método
$request->getMethod();           // GET, POST, PUT, DELETE...
$request->getUri();              // https://miapp.com/productos?page=2
$request->getPathInfo();         // /productos
$request->isMethod('POST');      // true/false

// Parámetros GET (?page=2&order=asc)
$request->query->get('page');
$request->query->all();

// Parámetros POST (formularios)
$request->request->get('nombre');
$request->request->all();

// Parámetros de ruta (/producto/{id})
$request->attributes->get('id');

// Cabeceras
$request->headers->get('Content-Type');
$request->headers->get('Authorization');

// Cookies
$request->cookies->get('session_id');

// Archivos subidos
$request->files->get('foto');

// Cuerpo raw (JSON APIs)
$request->getContent();
json_decode($request->getContent(), true);

// Sesión
$request->getSession();

// IP del cliente
$request->getClientIp();
```

**Ciclo de vida de una petición en Symfony**

```
Cliente (navegador/API)
        ↓ HTTP Request
   public/index.php
        ↓
     Kernel
        ↓
   Router → encuentra el controlador
        ↓
   Event: kernel.request
        ↓
   Controlador recibe Request
        ↓
   Controlador devuelve Response
        ↓
   Event: kernel.response
        ↓
Cliente recibe HTTP Response
```

**TIpos de peticiones más comúnes:**

- **GET**:



## Rutas

Son el mapa de URLs y controladores. Definen que código se ejecuta cuando llega una petición HTTP a una URL concreta.

```php
Sintaxis: #[Route('ruta', name:'nombre_ruta)]
Ejemplo:

#[Route('/users/{id}', name: 'user_show', methods: ['GET'])]
class GetUserController
{
    public function __invoke(int $id): JsonResponse
    {
        // ...
    }
}
```

Anatomía completa de una ruta:

```php
#[Route(
    path:         '/users/{id}',   // URL
    name:         'user_show',     // nombre único interno
    methods:      ['GET'],         // verbos HTTP
    requirements: ['id' => '\d+'], // validación del parámetro
    defaults:     ['id' => 1],     // valor por defecto
    host:         'api.{domain}',  // restricción de host
    schemes:      ['https'],       // http o https
    priority:     0,               // orden de evaluación
    format:       'json',          // formato de respuesta
)]
```

**Parámetros de una ruta:**

- **Parámetro simple:**

  ```php
  #[Route('/users/{id}', name: 'user_show', methods: ['GET'])]
  public function __invoke(int $id): JsonResponse
  {
      // $id viene de la URL: /users/42 → $id = 42
  }
  ```

- **Con requisito (validación)**

  ```php
  #[Route(
      '/users/{id}',
      name: 'user_show',
      requirements: ['id' => '\d+'], // solo números
      methods: ['GET']
  )]
  public function __invoke(int $id): JsonResponse {}
  
  // /users/42   ✅ entra aquí
  // /users/abc  ❌ 404
  ```

- **Con valor por defecto:**

  ```php
  #[Route('/blog/{page}', name: 'blog_list', defaults: ['page' => 1])]
  public function __invoke(int $page): Response
  {
      // /blog     → $page = 1
      // /blog/3   → $page = 3
  }
  ```

- **Parámetro opcional:**

  ```php
  #[Route('/blog/{slug?}', name: 'blog')]
  public function __invoke(?string $slug): Response
  {
      // /blog        → $slug = null
      // /blog/hello  → $slug = 'hello'
  }
  ```

- **Parámetros múltiples:**

  ```php
  #[Route(
      '/shop/{category}/{subcategory}/{productSlug}',
      name: 'product_show',
      requirements: [
          'category'    => '[a-z\-]+',
          'subcategory' => '[a-z\-]+',
          'productSlug' => '[a-z0-9\-]+'
      ]
  )]
  public function __invoke(
      string $category,
      string $subcategory,
      string $productSlug
  ): Response {}
  ```

- **Rutas por método HTTP:**

  ```php
  // GET — obtener recurso
  #[Route('/orders', name: 'order_list', methods: ['GET'])]
  class ListOrdersController {}
  
  // POST — crear recurso
  #[Route('/orders', name: 'order_create', methods: ['POST'])]
  class CreateOrderController {}
  
  // PUT — reemplazar recurso completo
  #[Route('/orders/{id}', name: 'order_update', methods: ['PUT'])]
  class UpdateOrderController {}
  
  // PATCH — actualizar parcialmente
  #[Route('/orders/{id}', name: 'order_patch', methods: ['PATCH'])]
  class PatchOrderController {}
  
  // DELETE — eliminar
  #[Route('/orders/{id}', name: 'order_delete', methods: ['DELETE'])]
  class DeleteOrderController {}
  ```

- **Prefijos de grupo con #[Route] en clase:**

  ```php
  #[Route('/api/v1/users')] // prefijo para todos los métodos
  class UserController extends AbstractController
  {
      #[Route('', name: 'user_list', methods: ['GET'])]
      public function list(): JsonResponse {}
      // GET /api/v1/users
  
      #[Route('/{id}', name: 'user_show', methods: ['GET'])]
      public function show(int $id): JsonResponse {}
      // GET /api/v1/users/42
  
      #[Route('', name: 'user_create', methods: ['POST'])]
      public function create(): JsonResponse {}
      // POST /api/v1/users
  
      #[Route('/{id}', name: 'user_delete', methods: ['DELETE'])]
      public function delete(int $id): JsonResponse {}
      // DELETE /api/v1/users/42
  }
  ```

**Conversión automática de parámetros (MapEntity)**

```php
// Sin MapEntity — manual
#[Route('/users/{id}', methods: ['GET'])]
public function __invoke(int $id, UserRepository $repo): JsonResponse
{
    $user = $repo->find($id);
    if (!$user) throw $this->createNotFoundException();
}

// Con MapEntity — automático ✅
#[Route('/users/{id}', methods: ['GET'])]
public function __invoke(
    #[MapEntity] User $user  // Symfony busca por {id} automáticamente
): JsonResponse {
    // $user ya está resuelto o lanza 404
}

// Con campo personalizado
#[Route('/users/{slug}', methods: ['GET'])]
public function __invoke(
    #[MapEntity(mapping: ['slug' => 'slug'])] User $user
): JsonResponse {}
```

**Depuración de rutas:**

```bash
# Ver todas las rutas registradas
php bin/console debug:router

# Buscar una ruta concreta
php bin/console debug:router user_show

# Probar qué controlador maneja una URL
php bin/console router:match /users/42

# Ver rutas que coinciden con método HTTP
php bin/console router:match /orders --method=POST
```

```php
src/
└── Controller/
    └── Api/
        └── V1/
            ├── User/
            │   ├── GetUserController.php     → GET  /api/v1/users/{id}
            │   ├── ListUsersController.php   → GET  /api/v1/users
            │   ├── CreateUserController.php  → POST /api/v1/users
            │   └── DeleteUserController.php  → DELETE /api/v1/users/{id}
            └── Order/
                ├── GetOrderController.php
                ├── CreateOrderController.php
                └── ConfirmOrderController.php
```

**Resumen:**

| Concepto                | Detalle                                                |
| ----------------------- | ------------------------------------------------------ |
| **Qué son**             | Mapeo entre URL+método HTTP y controlador              |
| **Formato recomendado** | Atributos PHP 8 `#[Route(...)]`                        |
| **Parámetros**          | `{id}`, con `requirements`, `defaults`, opcionales     |
| **MapEntity**           | Convierte `{id}` en objeto automáticamente             |
| **MapRequestPayload**   | Deserializa el body JSON en un DTO automáticamente     |
| **Generación**          | `generateUrl()`, `redirectToRoute()`, `path()` en Twig |
| **Depuración**          | `debug:router`, `router:match`                         |
| **Regla de oro**        | Un controlador = una ruta = una responsabilidad        |

Nunca debes escribir URLS a mano en Symfony. Si cambias una ruta, tendrías que buscar y reemplazar en todo el proyecto. Estas funciones generan URLs a partir del nombre de la ruta, desacoplando el código de la URL real

```php
// ❌ Nunca hardcodear URLs
return new RedirectResponse('/users/42');
header('Location: /users/42');

// ✅ Siempre usar el nombre de la ruta
return $this->redirectToRoute('user_show', ['id' => 42]);
```

**generateUrl()** en controladores y servicio

Es un método del  `AbstractController` que genera una URL a partir del nombre de una ruta. Disponible en **controladores y servicios**.

```php
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;

// URL relativa (por defecto) → /users/42
$url = $this->generateUrl('user_show', ['id' => 42]);

// URL absoluta → https://miapp.com/users/42
$url = $this->generateUrl(
    'user_show',
    ['id' => 42],
    UrlGeneratorInterface::ABSOLUTE_URL
);

// URL relativa a la red → //miapp.com/users/42
$url = $this->generateUrl(
    'user_show',
    ['id' => 42],
    UrlGeneratorInterface::NETWORK_PATH
);

// Solo el path relativo (explícito) → /users/42
$url = $this->generateUrl(
    'user_show',
    ['id' => 42],
    UrlGeneratorInterface::ABSOLUTE_PATH
);
```

**redirectToRoute()** En controladores:

Método del  `AbstractController` que genera una **respuesta de redirección HTTP** hacia una ruta por su nombre. Internamente llama a `generateUrl()` y crea un `RedirectResponse`.

```php
// 302 Found — redirección temporal (por defecto)
return $this->redirectToRoute('user_list');

// 301 Moved Permanently — redirección permanente (SEO)
return $this->redirectToRoute('user_list', [], 301);

// 307 Temporary Redirect — preserva el método HTTP
return $this->redirectToRoute('user_list', [], 307);

// 308 Permanent Redirect — permanente y preserva método HTTP
return $this->redirectToRoute('user_list', [], 308);
```

**Casos de uso real:**

**Tras crear un recurso (Post/Redirect/Get)**

```php
#[Route('/users', name: 'user_create', methods: ['POST'])]
class CreateUserController extends AbstractController
{
    public function __invoke(
        #[MapRequestPayload] CreateUserDTO $dto
    ): Response {
        $userId = $this->commandBus->dispatch(
            new CreateUserCommand($dto->email, $dto->password)
        );

        // Redirigir al recurso recién creado
        return $this->redirectToRoute(
            'user_show',
            ['id' => $userId->value()],
            Response::HTTP_SEE_OTHER  // 303 — correcto tras POST
        );
    }
}
```

**Tras eliminar un recurso:**

```php
#[Route('/users/{id}', name: 'user_delete', methods: ['DELETE'])]
class DeleteUserController extends AbstractController
{
    public function __invoke(#[MapEntity] User $user): Response
    {
        $this->commandBus->dispatch(new DeleteUserCommand($user->id()));

        // Redirigir al listado tras eliminar
        return $this->redirectToRoute('user_list');
    }
}
```

**Redirección condicional según rol:**

```php
#[Route('/dashboard', name: 'dashboard')]
class DashboardController extends AbstractController
{
    public function __invoke(): Response
    {
        $user = $this->getUser();

        return match(true) {
            $this->isGranted('ROLE_ADMIN') =>
                $this->redirectToRoute('admin_dashboard'),
            $this->isGranted('ROLE_MANAGER') =>
                $this->redirectToRoute('manager_dashboard'),
            default =>
                $this->redirectToRoute('user_dashboard'),
        };
    }
}
```

**Redirección permanente (SEO) tras renombrar una ruta**

```php
// Ruta vieja eliminada → redirigir a la nueva permanentemente
#[Route('/old-blog/{slug}', name: 'blog_old')]
class OldBlogRedirectController extends AbstractController
{
    public function __invoke(string $slug): Response
    {
        return $this->redirectToRoute(
            'blog_post_show',   // nueva ruta
            ['slug' => $slug],
            Response::HTTP_MOVED_PERMANENTLY  // 301
        );
    }
}
```

`redirect()` vs `redirectToRoute()`

```php
// redirect() — URL directa (evitar si es interna)
return $this->redirect('https://google.com');          // externa ✅
return $this->redirect('/users/42');                   // interna ❌

// redirectToRoute() — por nombre de ruta (siempre para rutas internas)
return $this->redirectToRoute('user_show', ['id' => 42]); // interna ✅
```

**`path()` y `url()` en Twig**

Funciones globales de Twig que generan URLs desde plantillas.

```php
{# path() → URL relativa: /users/42 #} (solo el camino)
{{ path('user_show', {id: user.id}) }}

{# url() → URL absoluta: https://miapp.com/users/42 #}
    (dirección completa)
{{ url('user_show', {id: user.id}) }}
```

```bash
https://miapp.com/users/42
─────────────────┬─────────
                 │
    url() genera TODO esto
                 │
                 └─────────
                  /users/42
                 ──────────
             path() genera solo esto
```

**Cuando usar cada una:**

**path->** cuando el navegador ya conoce el dominio:

```twig
{# Navegación — el navegador ya está en miapp.com #}
<a href="{{ path('user_show', {id: user.id}) }}">Ver perfil</a>

{# Formularios #}
<form action="{{ path('user_create') }}" method="POST"></form>

{# Paginación #}
<a href="{{ path('product_list', {page: 2}) }}">Siguiente</a>
```

**url()->** cuando el contexto sale de tu web

```twig
{# Emails — el cliente de correo no sabe tu dominio #}
<a href="{{ url('password_reset', {token: token}) }}">
    Restablecer contraseña
</a>

{# Compartir en redes sociales #}
<meta property="og:url" content="{{ url('post_show', {slug: post.slug}) }}">

{# APIs — respuesta que consume otro servidor #}
{
    "self": "{{ url('api_order_show', {id: order.id}) }}"
}

{# RSS / Sitemaps #}
<link>{{ url('post_show', {slug: post.slug}) }}</link>
```



> **¿El enlace se va a usar fuera del navegador que ya está en tu web?**
>
> - **Sí** → `url()` (email, API, RSS, redes sociales)
> - **No** → `path()` (navegación, formularios, enlaces internos)

```
URL Absoluta:  https://miapp.com/users/42
               ─────────────────────────
               protocolo + dominio + ruta

URL Relativa:  /users/42
               ─────────
               solo la ruta
```

**Anatomía de una URL absoluta:**

```
https://miapp.com:8080/users/42?sort=name#perfil
───┬───  ────┬────  ┬  ────┬───  ────┬───  ──┬──
   │         │      │      │          │        │
protocolo  dominio puerto  ruta    query    fragmento

Una URL relativa solo tiene la parte de "ruta" en adelante
```

**Casos de uso en Twig**

**Navegación y menús:**

```php
<nav>
    <a href="{{ path('home') }}">Inicio</a>
    <a href="{{ path('user_list') }}">Usuarios</a>
    <a href="{{ path('product_list', {page: 1}) }}">Productos</a>

    {% if app.user %}
        <a href="{{ path('user_show', {id: app.user.id}) }}">
            Mi perfil
        </a>
        <a href="{{ path('logout') }}">Cerrar sesión</a>
    {% else %}
        <a href="{{ path('login') }}">Entrar</a>
    {% endif %}
</nav>
```

**Formularios (action)**

```twig
{# Sin Form Component #}
<form method="POST" action="{{ path('user_create') }}">
    <input type="text" name="email">
    <button type="submit">Crear</button>
</form>

{# Editar — con parámetro #}
<form method="POST" action="{{ path('user_update', {id: user.id}) }}">
    <input type="hidden" name="_method" value="PUT">
</form>
```

**Listado con paginación:**

```twig
<div class="pagination">
    {% if currentPage > 1 %}
        <a href="{{ path('product_list', {page: currentPage - 1}) }}">
            ← Anterior
        </a>
    {% endif %}

    {% for page in 1..totalPages %}
        
            href="{{ path('product_list', {page: page}) }}"
            class="{{ page == currentPage ? 'active' : '' }}"
        >
            {{ page }}
        </a>
    {% endfor %}

    {% if currentPage < totalPages %}
        <a href="{{ path('product_list', {page: currentPage + 1}) }}">
            Siguiente →
        </a>
    {% endif %}
</div>
```

**Emails siempre  `url()` (absoluta)**

```twig
{# templates/emails/welcome.html.twig #}
<p>Hola {{ user.name }},</p>

<p>Por favor confirma tu cuenta:</p>

{# En emails SIEMPRE url() absoluta, nunca path() #}
<a href="{{ url('email_confirm', {token: confirmationToken}) }}">
    Confirmar cuenta
</a>

<p>O copia este enlace:</p>
<p>{{ url('email_confirm', {token: confirmationToken}) }}</p>
```

**Con query string en Twig**

```twig
{# Parámetros extra → query string automático #}
{{ path('user_list', {page: 2, sort: 'name', order: 'asc'}) }}
{# → /users?page=2&sort=name&order=asc #}

{# Filtros en una tabla #}
<a href="{{ path('order_list', {
    status: 'pending',
    from: '2024-01-01',
    to: '2024-12-31'
}) }}">
    Ver pedidos pendientes
</a>
```

**Tabla comparativa**

|             | `generateUrl()`          | `redirectToRoute()`    | `path()` Twig        | `url()` Twig |
| ----------- | ------------------------ | ---------------------- | -------------------- | ------------ |
| **Dónde**   | Controlador / Servicio   | Controlador            | Twig                 | Twig         |
| **Retorna** | `string`                 | `RedirectResponse`     | `string`             | `string`     |
| **URL**     | Relativa o absoluta      | Relativa (por defecto) | Relativa             | Absoluta     |
| **Cuándo**  | Generar enlace en código | Redirigir al usuario   | Enlaces en plantilla | Emails, APIs |

**Reglas de Oro:**

```
path()        → enlaces internos en HTML
url()         → emails, respuestas API, compartir en redes
generateUrl() → servicios PHP que necesitan generar URLs
redirectToRoute() → siempre tras POST, DELETE, login, logout
```

> Si cambias la URL de una ruta pero no su nombre, **todo sigue funcionando** sin tocar nada más. Ese es el valor real de usar nombres de ruta en lugar de URLs hardcodeadas.



Para que Symfony genere correctamente las URLs absolutas en producción hay que configurar el dominio base:

```yaml
# config/services.yaml
parameters:
    router.request_context.host: 'miapp.com'
    router.request_context.scheme: 'https'
    router.request_context.base_url: ''
```



## Formularios

Instalar componente formulario:

```
symfony composer requiere form
```

Crear formulario:

```bash
symfony console make:form
```

Se debe crear un archivo nombre_archivo+"**Type**": EJ: StarShipPartType.php Se guardan en **src/form**

Para poder crear un formulario, primero tiene que existir la entidad que se va a asignar, al ir asignando propiedades nos va generando en el archivo la estructura ORM con atributos y los métodos get y set correspondientes.

Al crear un formulario se le asigna una entidad que ya tiene que existir. Ej: StarShipPart

Para crear la entidad:

Instalar:

```bash
composer require orm
composer require symfony/mercure-bundle
```

Crear entidad:

```bash
php bin/console make entity
```

Después de crear todas las propiedades, para migrarlas:

```bash
php bin/console make:migration
```







# Docker

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



**3. ¿Cómo se configura? (Paso a paso)**

Para configurar un entorno de desarrollo (por ejemplo, para PHP/Symfony), normalmente seguimos estos pasos:

**Paso A: El Dockerfile (Define tu entorno)**

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



**Comandos útiles relacionados**

Si acabas de lanzar un `up -d`, estos comandos te servirán para gestionar lo que está pasando:

- **`docker compose ps`**: Para ver si los contenedores están realmente arriba (`Up`) o si han fallado.
- **`docker compose logs -f`**: Para ver los logs aunque estén en segundo plano (muy útil si algo no carga).
- **`docker compose stop`**: Detiene los contenedores pero los mantiene creados.
- **`docker compose down`**: **Cuidado con este:** Detiene los contenedores y los **elimina**, junto con la red (pero no borra los volúmenes de datos).



# Utilizar proyecto

Para entrar en la raiz del proyecto:`docker compose up -d` (-d = detach) , se coloca automáticamente en la raiz del proyecto.

```bash
user@
```

Para poner la terminal: se utiliza para poner un comando dentro de un contenedor que ya está corriendo, pero forzando una identidad de usuario específica.

```bash
docker compose exec -u 1000:1000
```

**Desglose del comando:**

- **`docker compose exec`**: Indica que quieres entrar a un contenedor activo. A diferencia de `run`, este comando no crea un contenedor nuevo, sino que se "mete" en uno que ya existe.
- **`-u` (o `--user`)**: Es la bandera para especificar el usuario.
- **`1000:1000`**: Define el **UID** (User ID) y el **GID** (Group ID).
  - El primer `1000` es el ID del usuario.
  - El segundo `1000` es el ID del grupo.

**¿Por qué es importante el 1000:1000?**

En la gran mayoría de las distribuciones de Linux (incluyendo Ubuntu, Debian y las imágenes comunes de Docker), el **ID 1000** es el que se le asigna por defecto al **primer usuario no-root** que se crea en el sistema.

**¿Para qué se utiliza principalmente?**

1. **Evitar problemas de permisos (Permissions Mismatch):** Si tu usuario en tu computadora física (host) tiene el ID 1000 y creas archivos dentro del contenedor como `root` (que es el default de Docker), luego no podrás editar esos archivos desde tu editor de código fuera del contenedor porque "pertenecen a otro dueño". Al usar `-u 1000:1000`, los archivos que generes dentro pertenecerán a tu usuario de fuera.
2. **Seguridad:** Ejecutar procesos como `root` dentro de un contenedor es una mala práctica de seguridad. Si el proceso se ve comprometido, el atacante tiene privilegios totales. Forzar un usuario con ID 1000 limita lo que se puede hacer.



La estructura de desarrollo queremos que sea parecida a la de producción por ello utilizamos enlaces simbólicos.

Siempre desde la consola: 

levantar docker: `docker compose up -d `(-d detach)

para entrar en la máquina: `compose exec -u 1000:1000 php bash`

parar docker: `compose down`



Para ejecutar los 3 comandos especificos, colocarnos en la raiz de la aplicación Ej:  `cd web/portal` : 

```bash
composer fix-devps
composer pre-dev
composer pre-test
```



**Cuando se crea una etiqueta:**

1. Llama al controlador (utilizan objetos): c17_shared_bundle/src/Controller/Ill17/IllRequest/IllRequestActionController.php -> al método **tag**:

   ```php
   #[IsGranted(IllRequestActionVoterAttribute::TAG->value, 'illRequest')]
       #[Route(path: '/{id<%routing.int%>}/tag', name: '_tag', options: ['expose' => true])]
       public function tag(Request $request, IllRequest $illRequest, LibraryInterface $library): Response
       {
           $commandBuilder = new TagIllRequestCommandBuilder($illRequest, $library);
           $form = $this->createForm(TagIllRequestFormType::class, $commandBuilder);
           $form->handleRequest($request);
   
           if ($form->isSubmitted() && $form->isValid()) {
               $this->application->execute($commandBuilder->buildCommand());
   
               $this->addFlash('success', 'message.ill_request_tagged_ok');
   
               return $this->turboAwareRedirectToRoute($request, 'app_c17_ill-request', ['id' => $illRequest->getId()]);
           }
   
           return $this->render(
               '@C17Shared/ill17/ill-requests/actions/_tag.html.twig',
               [
                   'form' => $form,
                   'illRequest' => $illRequest,
               ]
           );
       }
   ```

   LibraryInterface $library retorna un `ReadableCollection`

   1. Crea el commandBuilder con el `TagIllRequestCommandBuilder`, obtiene el id de la biblioteca la petición (biblio Origen)
   2. Crea el formulario (create form)
   3. Asigna el handle (sería la etiqueta en este caso)
   4. Ejecuta el command builder
   5. Muestra mensaje



2. Crea un comando y lo manda a ejecutar.
3. Busca el handler que en este caso es Etiqueta y le paso el comando.
4. Hace el sql y manda un evento a la grabadora de Eventos **DomainEvent**. Todo esto se hace en la misma transacción, para asegurarnos de que o se hace todo o nada. 
5. Hasta que no termina la transacción no se hacen los eventos de Integración.
6. En los modelos de lectura relacionamos con objetos y en los modelos de escritura , en lugar de utilizar objetos como tal utilizamos identificadores, porque queremos que ese proceso sea más atómico, con los parámetros imprescindibles.



**Eventos**: 

- **Eventos de dominio:** están en la misma transacción.
- **Eventos de integración:** no se ejecutan hasta que no termina la transacción.



Cuando desde la web pulsamos en Etiqueta envía una petición, cada biblioteca tiene sus etiquetas.

En nuestro código en `c-17-model/src/WriteModel/` cada directorio suele tener un agregado, algún caso especial tiene dentro de un directorio 2 agregados. EJ: cuentaUsuario sería un agregado, en cambio en FondoRevista hay dos agregados (fondo y revista).

Cuando tienen un agregado, tienen un archivo nombreAgregado y otro nombreAgregadoId. Ej: cuentaUsuario



El modelo de lectura de doctrine está por atributos 

```php
#[ORM\Table(name: 'libros')]
#[ORM\Entity(repositoryClass: BookRepository::class, readOnly: true)]
class Book implements BookInterface
{
    #[ORM\Id]
    #[ORM\Column(type: 'integer')]
    #[ORM\GeneratedValue(strategy: 'NONE')]
    private int $id;

    #[ORM\Column(type: 'string', length: 512, name: 'titulo')]
    private string $title;
    ....
```

El modelo de escritura de doctrine está por archivo .xml (c17-model/src/infraestructure(Doctrine/ORM/WritteModel/Mapping)) Ej: biblioteca.Biblioteca.orm.xml

```xml
<doctrine-mapping
    xmlns="http://doctrine-project.org/schemas/orm/doctrine-mapping"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://doctrine-project.org/schemas/orm/doctrine-mapping https://www.doctrine-project.org/schemas/orm/doctrine-mapping.xsd"
>

    <entity name="C17\Model\WriteModel\Biblioteca\Biblioteca" table="biblioteca" repository-class="C17\Model\Infrastructure\Doctrine\Orm\WriteModel\BibliotecaRepositorio">

        <id name="id" column="organisation_id" type="integer">
            <generator strategy="NONE" />
        </id>

        <many-to-one field="institucion" target-entity="C17\Model\WriteModel\Institucion\Institucion">
            <join-column name="institucion_id" referenced-column-name="id" />
        </many-to-one>

    </entity>

</doctrine-mapping>
```

Aquí se dice los campos que quiere.



Las **Entidades de Doctrine**, no tiene que ver con lo que nosotros queremos mostrar. Ej: en la tabla preferencias solo utilizamos en el código locale y email, no todos los campos que hay en la BD.

 

## **FORMULARIOS**

Usamos un **CommandBuilder** para poder cambiar un formulario, porque construye un comando (puede construir todos los que necesite, pero ese comando es **immutable**).

El formulario no ataca directamente al comando, sino al commandBuilder. Se cambia al objeto al que engloba el campo del formulario.

** Para que todo el funcionamiento esté OK Siempre que se hace un POST hay que hacer un `$this ->redirect, no con un render, para que no se pueda dar atrás.



**Arquitectura Hexagonal:** por un lado en la lectura tiene la interfaz y la implementación está en doctrine.

Llamamos reader a los que llama a las consultas. 

En c17-model/src/infraestructure se hacen las implementaciones con ORM, Dbal o Elastic





## Comandos específicos

**Se ejecutan siempre en la raiz del proyecto**. (terminal de docker) 

Creados por nosotros, están guardados en el proyecto en el  composer.json principal del proyecto en "scripts"

- **composer fix-deps:** arregla las dependencias.
- **composer pre-dev:** prepara el entorno de desarrollo (limpia la base de datos de desarrollo).
- **composer pre-test:** prepara el entorno de test, (limpia las base de datos de test)
- **composer fix-cs:** organiza el código.
- **composer ci:** ejecuta todas las pruebas (se tiene que ejecutar siempre antes de subir una rama, es decir se hace **git** **add, composer ci y luego el git commit)**.



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

En VS Code: instalar todas las extensiones predefinidas y container tools ( diseñada para que no tengas que salir del editor para gestionar tus contenedores)



**Utilizamos**:

**elasticsearch**: motor de búsqueda "bd".

**elasticvue**: utilizamos la versión 8. Cada columna es una tabla. Las bandejas son las que utilizan elacticvue, una vez que se hace clic, ya si se va a la BD.

Las bandejas son el objeto grande con las filas con las pestañas (pendiente,...) en cualquiera de las dos apps.

**mailer (mailpit)**: para el correo. el correo no sale del sistema, puerto 8025

**adminer**: entorno gráfico para ver las bases de datos, puerto 8080.



# **GIT**

## Herramientas para la gestión de git a nivel visual y organizado:

- **Kdiff3:**

  Herramienta de comparación y combinación (merge) de archivos y directorios.

  **Qué es:** Un visor gráfico que muestra las diferencias entre dos o tres archivos y te ayuda a resolver conflictos de código de forma manual pero visual.

  **Cuándo se utiliza:** Cuando tienes un "conflicto de merge" en Git que es demasiado complejo para resolverlo solo con texto en la terminal.

  **Cómo se utiliza:** Se suele configurar como la herramienta por defecto para `git mergetool`. Te muestra tres paneles (Base, Local y Remoto) y un cuarto panel inferior con el resultado final.

  ![image-20260429200127606](/home/soa/.config/Typora/typora-user-images/image-20260429200127606.png)

- **Git-gui**

  Es la interfaz gráfica nativa y ligera que viene con el ecosistema de Git.

  **Qué es:** Una herramienta visual sencilla para realizar tareas comunes de Git sin usar la línea de comandos.

  **Cuándo se utiliza:** Ideal para hacer **commits parciales** (elegir qué líneas de un archivo quieres subir y cuáles no) y para visualizar el estado del área de preparación (*staging area*) de un vistazo.

  **Cómo se utiliza:** Ejecutas el comando `git gui` en tu terminal dentro de un repositorio. Te permite escribir mensajes de commit, firmar cambios y crear ramas de forma básica.

  ![image-20260429200045170](/home/soa/.config/Typora/typora-user-images/image-20260429200045170.png)

- **gitk --all &**: es un visor gráfico de historial para git.

- **git flow**: Es una metodología de trabajo que permite hacer el funcionamiento de manera sencilla

  **Qué es:** Un conjunto de scripts que automatizan el flujo de trabajo basado en ramas (Master o main, Develop, Feature, Release, Hotfix).

  **Cuándo se utiliza:** En proyectos medianos o grandes donde necesitas una estructura estricta de lanzamientos y correcciones.

  **Cómo se utiliza:** En lugar de usar `git checkout -b`, usas comandos de alto nivel como:

  - `git flow feature start mi-tarea` (crea la rama desde develop).
  - `git flow feature finish mi-tarea` (mezcla en develop y borra la rama).

  2 ramas principales: 

  - main: contiene la última versión de nuestro proyecto y usaremos para desplegar en producción.
  - develop: rama principal de desarrollo

   varias ramas de soporte:

  - feature: para desarrollar nuevas funcionalidades, se crean a partir de la rama develop y al terminar se fusiona con develop.
  - release: se usa para lanzar una nueva versión de nuestro proyecto y se fusionaran tanto con master como con develop.
  - hotfix: se usa para cambios rápidos sobre la rama main y se fusiona con main y develop. Ej: porque haya un error que corregir

  ![image-20260412174502414](/home/soa/.config/Typora/typora-user-images/image-20260412174502414.png)

  develop: rama principal de desarrollo

  ```bash
  git flow init
  git flow feature start prueba
  cuando termino git flow feature finish prueba
  git flow release start 20260407123400 (nombre fecha inversa)
  git flow release finish -n (no usamos tag)
  gir merge tool
  ```

  ```bash
  git flow hotfix start 20250407135353
  git stash pop (recupera los últimos cambios)
  git flow hotfix finish -n 20250407135353
  ```




**Instalación en Ubuntu**

Puedes instalar las tres herramientas de una sola vez desde la terminal:

```bash
sudo apt update
sudo apt install kdiff3 git-gui git-flow
```

**Configuración adicional recomendada**

Para que Git use **KDiff3** automáticamente cuando haya conflictos, ejecuta estos comandos en tu terminal:

```bash
# Configurar KDiff3 como herramienta de merge
git config --global merge.tool kdiff3
git config --global mergetool.kdiff3.path /usr/bin/kdiff3

# Configurar KDiff3 como herramienta de diff (ver diferencias)
git config --global diff.tool kdiff3
git config --global difftool.kdiff3.path /usr/bin/kdiff3
```



**Resumen de uso rápido**

| **Herramienta** | **Comando en terminal** | **Función principal**                       |
| --------------- | ----------------------- | ------------------------------------------- |
| **KDiff3**      | `git mergetool`         | Resolver conflictos visualmente.            |
| **Git-GUI**     | `git gui`               | Hacer commits y gestionar el staging.       |
| **Git Flow**    | `git flow init`         | Organizar el ciclo de vida del repositorio. |



## **Comandos:**

Para actualizar dos ramas en el servidor (`origin`) al mismo tiempo, pero aplicando **cinturones de seguridad** para no borrar el trabajo de tus compañeros por accidente.

```bash
git push origin develop main --force-with-lease --force-if-includes
```

Si me quiero bajar los cambios **NUNCA HACER GIT PULL** (a no ser que tenga los cambios en un único sentido), para que no haya conflictos en su lugar: git fetch o git rebase.



- **git stash:** guarda los cambios de manera temporal sin tener que hacer un commit para limpiar tu espacio de trabajo.

  Imagina que estás trabajando en una funcionalidad nueva y, de repente, surge un error urgente que debes corregir en otra rama.

  - No quieres hacer commit de tu trabajo a medias (porque está incompleto o "roto").

  - Git no te deja cambiar de rama porque tienes archivos modificados.

  **Solución:** Haces un `git stash`, tus cambios se guardan a buen recaudo, tu carpeta se queda limpia, arreglas el error y luego recuperas lo que tenías. 

- **git fetch:** descarga el historial del servidor, pero no toca tu código de trabajo.

  ```bash
  git fetch [remoto] [rama]
  ```

  Actualiza tus **ramas remotas de seguimiento** (`origin/main`, `origin/feature`, etc.) con lo que hay en el servidor, pero **no toca tu rama local ni tu directorio de trabajo**. Es una operación completamente segura.

  En vs code se puede poner automatico autofetch.

  Ejemplos prácticos:

  ```bash
  # Descargar todos los cambios del remoto por defecto (origin)
  git fetch
  
  # Descargar de un remoto concreto
  git fetch origin
  
  # Descargar solo una rama específica
  git fetch origin main
  ```

- **git rebase**: mueve o combina una serie de commits sobre una nueva base. Es decir, toma los commits de tu rama y los "replanta" encima de otro commit, como si hubieras empezado a trabajar desde ahí.

  ```
  Antes del rebase:         Después de git rebase main:
  
        A─B─C  (feature)         A─B─C  (feature)
       /                        /       \
  D─E─F  (main)           D─E─F─A'─B'─C'
                                        ↑
                                 (commits reescritos)
  ```

  Sintaxis:

  ```bash
  git rebase <rama-base>
  git rebase <rama-base> <rama-a-mover>
  ```

  Ejemplos prácticos:

  ```bash
  # Estando en 'feature', rebasear sobre main
  git checkout feature
  git rebase main
  
  # Rebasear sin hacer checkout previo
  git rebase main feature
  
  # Rebasear sobre una rama remota
  git rebase origin/main
  
  # Cancelar un rebase en curso si hay conflictos
  git rebase --abort
  
  # Continuar tras resolver conflictos
  git rebase --continue
  ```

  **Rebase interactivo:**

  Es la opción más potente, permite editar, reordenar, fusionar o eliminar commits o publicarlos.

  ```bash
  # Editar los últimos 3 commits
  git rebase -i HEAD~3
  ```

  Se abre un editor con opciones para cada commit

  ```bash
  pick a1b2c3 Añadir login
  pick d4e5f6 Fix typo
  pick g7h8i9 Añadir tests
  
  # Comandos disponibles:
  # pick    → mantener el commit tal cual
  # reword  → mantener pero editar el mensaje
  # edit    → pausar para modificar el commit
  # squash  → fusionar con el commit anterior
  # fixup   → fusionar sin conservar el mensaje
  # drop    → eliminar el commit
  ```

  Usos comunes del rebase interactivo:

  ```bash
  # Limpiar commits antes de hacer merge a main
  git rebase -i origin/main
  
  # Fusionar varios commits en uno solo (squash)
  # Útil para convertir "WIP", "fix", "typo" en un commit limpio
  
  # Reordenar commits antes de una revisión de código
  ```

  **Rebase vs Merge**

  |                 | `git merge`                          | `git rebase`                 |
  | --------------- | ------------------------------------ | ---------------------------- |
  | Historial       | Conserva todo, añade commit de merge | Lineal y limpio              |
  | Trazabilidad    | Alta (se ve cuándo se mergeó)        | Menor (reescribe)            |
  | Conflictos      | Se resuelven una vez                 | Se resuelven commit a commit |
  | Uso recomendado | Ramas públicas/compartidas           | Ramas locales o personales   |

  ```
  Merge:                    Rebase:
  
  A─B─C─M  (main)          A─B─C─D'─E'  (main)
       ╲╱
        D─E  (feature)
  ```

  **Regla de oro**

  > **Nunca hagas rebase de commits que ya están en un repositorio compartido.**

  Reescribir historial público causa problemas a todos los que tienen esa rama. Rebase es seguro en ramas locales o en ramas de feature que solo usas tú.

  Flujo de trabajo típico:

  ```bash
  git checkout feature
  git fetch origin
  git rebase origin/main     # Actualizo mi rama con los últimos cambios de main
  # (resuelvo conflictos si los hay)
  git rebase --continue
  git push --force-with-lease # Necesario si ya habías publicado la rama
  ```

- **git merge tool:** utilidad externa que se configura para resolver conflictos de fusión de manera visual. Utilizamos **Kdiff3**: tiene 4 paneles para ver los conflictos.

- **git nah**: resetea todo. No es un comando oficial de Git, sino un alias (atajo personalizado) popular entre desarrolladores. Se utiliza para decir: "Olvida todo lo que acabo de hacer, limpia el desorden y vuelve al estado del último commit". (Es el botón del pánico para cuando has hecho cambios experimentales que no funcionan y quieres borrarlos todos de un plumazo)

- **git branch -f**: mueve un puntero de rama a otro commit

  ```bash
  git branch -f <nombre-rama> <commit-destino>
  ```

  Se usa cuando se quiere reubicar una rama en un commit diferente sin necesidad de hacer checkout en ella.

  ```bash
  # Mover 'main' al commit donde estás ahora (HEAD)
  git branch -f main HEAD
  
  # Mover una rama a un commit específico
  git branch -f feature-login abc1234
  
  # Mover una rama tres commits atrás desde HEAD
  git branch -f main HEAD~3
  
  # Hacer que una rama local apunte igual que la remota
  git branch -f main origin/main
  ```

  Ej: git branch -f develop origin/develop

- git cheery-pick: Copia commits concretos de cualquier rama y los aplica en la rama actual, en lugar de fusionar ramas enteras, selecciona commits individuales y los "replanta" donde estás.

  ```bach
  Antes:                        Después de cherry-pick C:
  
  main:    A─B─C─D              main:    A─B─C─D
                                                  \
  feature: E─F─G                feature: E─F─G─C'
                                                ↑
                                          (copia de C)
  ```

  Sintaxis:

  ```bash
  git cherry-pick <commit>
  ```

  Ejemplos prácticos:

  ```bash
  # Copiar un commit concreto a tu rama actual
  git cherry-pick abc1234
  
  # Copiar varios commits a la vez
  git cherry-pick abc1234 def5678 ghi9012
  
  # Copiar un rango de commits
  git cherry-pick abc1234..ghi9012
  
  # Copiar sin hacer commit automático (lo deja en staging)
  git cherry-pick abc1234 --no-commit
  
  # Copiar el último commit de otra rama
  git cherry-pick feature-login
  
  # Añadir referencia al commit original en el mensaje
  git cherry-pick abc1234 -x
  ```

  ¿Para qué se usa?

  **Llevar un fix urgente a producción** sin mergear toda la rama:

  ```bash
  # Hay un bug crítico arreglado en 'develop', lo llevas solo a 'main'
  git checkout main
  git cherry-pick abc1234   # solo el commit del fix
  ```

  Recuperar un commit borrado por error:

  ```bash
  git reflog                # encuentras el hash del commit perdido
  git cherry-pick abc1234   # lo recuperas
  ```

  Ejemplo típico:

  ```bash
  git log feature-branch --oneline   # Identifico el commit que quiero
  # abc1234 Fix error de autenticación
  
  git checkout main                  # Me muevo a donde lo quiero aplicar
  git cherry-pick abc1234            # Lo copio
  git push                           # Lo publico
  ```

  Cherry-pick crea un commit nuevo con diferente hash aunque el contenido sea igual.

  

**Comparativa con otros comandos**

|              | `git merge`    | `git rebase`      | `git cherry-pick`     |
| ------------ | -------------- | ----------------- | --------------------- |
| ¿Qué copia?  | Toda la rama   | Toda la rama      | Commits concretos     |
| Historial    | Conserva todo  | Reescribe         | Añade copias          |
| Uso típico   | Integrar ramas | Limpiar historial | Mover commits sueltos |
| Granularidad | Baja           | Media             | Alta                  |



## **Usos que he puesto en práctica:**

1. **Pasar una rama feature a hotfix**

   Desde la rama feature con todos los cambios subidos:

   ```bash
   git branch -f develop origin develop
   gir branch -f
   ```

   Creamos una rama hotfix

   Hacemos un git cherry-pick: copia commits concretos de cualquier rama y los aplica en tu rama actual. 

   ```
   git cherry-pick feature/nombre-rama (desde rama hotfix)
   ```

   Cerramos la rama hotfix

   Subimos los cambios al remoto:

   ```bash
   git push --force-with-lease --force-if-includes origin main develop 
   ```

   

2. **Modificar un commit**

   1. Hacer commit amment desde VS

   2. Modificamos el texto y hacemos commit

   3. Subimos cambios

      ```bash
      git push --force-with-lease --force-if-includes 
      ```

      

3. **Si da error una rama feature porque haya cambios en develop**

   1. Ir a la rama develop `git switch develop`

   2. Desde la rama develop hacer `git pull`

   3. Ir a la rama main: `git switch main`

   4. Desde la rama main hacer `git pull`

   5. Volver a la rama feature que queríamos cerrar:

      `git switch feature/nombre_rama` 

   6. Desde la rama feature hacer un rebase:

      `git rebase develop`

   7. Hago `git push --force-with-lease --force-if-includes`

   8. Cierro la feature

      ```bash
      # Estando en cualquier rama, cerrar la feature
      git flow feature finish nombre-feature
      ```

      

*Desde VS Code en SOURCE CONTROL nos deja hacer los git add, git commit (es mejor que desde consola por que se ven los cambios que se van  a subir). **SIEMPRE HACERLO EN ESTE ORDEN**

```bash
git add
composer fix-cs
git commit
```







# **FRONTEND**

- **webpack encore:** biblioteca de PHP para symfony para gestionar los assets (recursos) de tu aplicación web: archivos JavaScript, estilos CSS, imágenes y fuentes.

- **bootstrap**:

  - v3 (la utiliza la versión LEGACY)
  - v5 (lo nuevo app portal y algunas de sdf17) 

  Si la barra de abajo está siempre visible es la v5 y si no es la v3.

- **SCSS:** (Sassy Cascading Style Sheets) Es mejor para el anidamiento, luego con nodejs pasa a CSS.

  Es un preprocesador de CSS. Es una versión más potente del CSS convencional. Permite usar herramientas lógicas (variables, funciones, ciclos) para escribir estilos de forma más rápida, organizada y fácil de mantener.

- **Workspaces**: contiene la sf17_legacy



Cuando haya cambios en un fichero, pasos a seguir:

```
git add
composer fix-cs
git commit
```



# **TEST**

- rector: actualiza el código con los cambios de versión

- phpUnit: es lo último que se ejecuta. tenemos dos tipos:
  - portal: ejecuta un navegador real para probar javascript, para eso se utiliza el ejecutable que está en drivers y se ejecuta con composer ci.
  
- phpStan: detecta errores para arreglarlos antes de subirlos a producción.

  ```bash
  ./vendor/bin/phpstan analyse directorio_analizar
  ```

  En el código sólo ponemos mensajes de phpStan en lo que sea necesario 

  **Resumen — Cuándo usar cada anotación**

  | Anotación                              | Cuándo usarla                       |
  | -------------------------------------- | ----------------------------------- |
  | Tipos nativos `string`, `int`, `?User` | Siempre que sea posible             |
  | `@var array<int, User>`                | Arrays tipados, colecciones         |
  | `@param`, `@return`                    | Métodos con tipos complejos         |
  | `@template`                            | Clases genéricas y reutilizables    |
  | `@phpstan-ignore-next-line`            | Código legacy o dinámico inevitable |
  | `@phpstan-assert`                      | Funciones de validación propias     |



Los test se ejecutan en orden aleatorio, tenemos 8 test configurados.

bin/phpunit --exclude



Para probar los test:

Test específicos que hemos creado:

- Colocarnos en el directorio de la aplicación: desde la consola de docker

  ```bash
  cd web/sdf17
  php bin/console
  ```

  

- 





**DEBUG**

Ponemos interrupciones en el código hay que tener abierto VS Code y el navegador pulsada la mariquita , para ello hay que instalar una extensión de firefox: `Xdebug_ext` 

Para lanzarlo en VS Code pulsar F5 y en el navegador pulsar la Mariquita.

debug location -> seleccionar docked



# Modelado de Dominio (Domain Modeling)

Es el proceso de representar en código los conceptos, reglas y comportamientos del mundo real del negocio. El modelo de dominio es el corazón de tu aplicación: captura qué hace el negocio, no como funciona la tecnoligía.

Viene de **Domain-Driven Desing (DDD)** y se basa en que el código debe hablar el mismo idioma que el negocio.

**¿Cuándo se usa?**

| Usa modelado de dominio                 | No lo necesitas                  |
| --------------------------------------- | -------------------------------- |
| Lógica de negocio compleja              | CRUD simple                      |
| Reglas que cambian frecuentemente       | Scripts o herramientas internas  |
| Equipos grandes con expertos de dominio | Prototipos rápidos               |
| Necesitas que el código dure años       | Proyectos pequeños de corta vida |
| Varios bounded contexts                 | Una sola entidad simple          |

**Bloques fundamentales:** 

1. **Entity (Entidad)**

   Es lo que puede ser **único**, identificable que existe y  forma parte de un dominio. Tiene identidad única que persiste en el tiempo. Dos entidades son distintas aunque tengan los mismos datos.

   ```php
   class User
   {
       private UserId $id;
       private Email $email;
       private UserStatus $status;
   
       public function __construct(UserId $id, Email $email)
       {
           $this->id = $id;
           $this->email = $email;
           $this->status = UserStatus::PENDING;
       }
   
       public function activate(): void
       {
           if ($this->status !== UserStatus::PENDING) {
               throw new \DomainException('Only pending users can be activated');
           }
           $this->status = UserStatus::ACTIVE;
       }
   }
   ```

   La lógica vive en la entidad, no en un servicio externo.

2. **Value Object (Objeto de valor)**

   No tiene identidad. Dos value Object con los mismos datos son iguales. Son **immutables**.

   ```php
   final class Email
   {
       private string $value;
   
       public function __construct(string $value)
       {
           if (!filter_var($value, FILTER_VALIDATE_EMAIL)) {
               throw new \InvalidArgumentException("Invalid email: $value");
           }
           $this->value = strtolower($value);
       }
   
       public function value(): string
       {
           return $this->value;
       }
   
       public function equals(self $other): bool
       {
           return $this->value === $other->value;
       }
   }
   
   final class Money
   {
       public function __construct(
           private readonly int $amount,    // en céntimos
           private readonly string $currency
       ) {}
   
       public function add(self $other): self
       {
           if ($this->currency !== $other->currency) {
               throw new \DomainException('Cannot add different currencies');
           }
           return new self($this->amount + $other->amount, $this->currency);
       }
   }
   ```

3. **Aggregate (Agregado)**

   Grupo de entidades y value objects que forman una **unidad de consistencia**. Sólo se accede desde la raiz (Aggregate Root)

   ```php
   class Order // Aggregate Root
   {
       private OrderId $id;
       private OrderStatus $status;
       /** @var OrderLine[] */
       private array $lines = [];
       private Money $total;
   
       public function addProduct(Product $product, int $quantity): void
       {
           if ($this->status !== OrderStatus::DRAFT) {
               throw new \DomainException('Cannot modify a confirmed order');
           }
   
           $this->lines[] = new OrderLine($product, $quantity);
           $this->recalculateTotal();
       }
   
       public function confirm(): void
       {
           if (empty($this->lines)) {
               throw new \DomainException('Cannot confirm an empty order');
           }
           $this->status = OrderStatus::CONFIRMED;
           $this->recordEvent(new OrderConfirmed($this->id));
       }
   
       private function recalculateTotal(): void
       {
           $this->total = array_reduce(
               $this->lines,
               fn(Money $carry, OrderLine $line) => $carry->add($line->subtotal()),
               new Money(0, 'EUR')
           );
       }
   }
   ```

4. **Domain Service:**

   Lógica de negocio que **no pertenece a ninguna entidad** porque involucra múltiples objetos.

   ```php
   class TransferMoneyService
   {
       public function transfer(
           BankAccount $source,
           BankAccount $destination,
           Money $amount
       ): void {
           if (!$source->hasSufficientFunds($amount)) {
               throw new InsufficientFundsException();
           }
   
           $source->debit($amount);
           $destination->credit($amount);
       }
   }
   ```

5. **Domain Event:**

   Algo importante que ocurrió en el dominio, en pasado.

   ```php
   final class OrderConfirmed
   {
       public function __construct(
           public readonly OrderId $orderId,
           public readonly \DateTimeImmutable $occurredAt = new \DateTimeImmutable()
       ) {}
   }
   
   // En Symfony con Messenger:
   class Order
   {
       private array $domainEvents = [];
   
       public function confirm(): void
       {
           // ...lógica...
           $this->domainEvents[] = new OrderConfirmed($this->id);
       }
   
       public function pullDomainEvents(): array
       {
           $events = $this->domainEvents;
           $this->domainEvents = [];
           return $events;
       }
   }
   ```

6. **Repository (interfaz en dominio)**

   Define como acceder a los agregados, sin saber nada de la base de datos.

   ```php
   // Dominio — solo la interfaz
   interface OrderRepository
   {
       public function find(OrderId $id): ?Order;
       public function save(Order $order): void;
       public function nextIdentity(): OrderId;
   }
   
   // Infraestructura — la implementación con Doctrine
   class DoctrineOrderRepository implements OrderRepository
   {
       public function __construct(
           private readonly EntityManagerInterface $em
       ) {}
   
       public function find(OrderId $id): ?Order
       {
           return $this->em->find(Order::class, $id);
       }
   
       public function save(Order $order): void
       {
           $this->em->persist($order);
           $this->em->flush();
       }
   }
   ```

```php
src/
├── Domain/
│   ├── Order/
│   │   ├── Order.php                  # Aggregate Root
│   │   ├── OrderId.php                # Value Object
│   │   ├── OrderLine.php              # Entity
│   │   ├── OrderStatus.php            # Enum
│   │   ├── OrderRepository.php        # Interface
│   │   └── Event/
│   │       └── OrderConfirmed.php     # Domain Event
│   └── Shared/
│       ├── Money.php
│       └── Email.php
│
├── Application/
│   └── Order/
│       ├── ConfirmOrder/
│       │   ├── ConfirmOrderCommand.php
│       │   └── ConfirmOrderHandler.php
│       └── FindOrder/
│           ├── FindOrderQuery.php
│           └── FindOrderHandler.php
│
└── Infrastructure/
    └── Persistence/
        └── DoctrineOrderRepository.php
```



# CQS y CQRS

Uno es un principio de buenas prácticas al escribir funciones, mientras que el otro es un patrón para diseñar sistemas completos.

**CQS** (Command Query Separation) es un principio de diseño de software. Su idea es tan simple como poderosa: **un método deber ser un comando o una consulta pero nunca ambos.** 

Para entender CQS, hay que dividir las operaciones en dos categorías estrictas.

- **Commands (Comandos):** acciones que cambian el estado del sistema (modifican la base de datos, cambian una variable, etc), pero no devuelven datos, devuelve `void`.
- **Queries (Consultas):** Son acciones que devuelven datos pero no tienen efectos secundarios (no modifican nada).

En resumen: "Hacer una pregunta no debe cambiar la respuesta".  Al leer el código, sabes con certeza que si una función devuelve un valor, puedes llamarla 10 veces y el sistema seguirá igual.

**Beneficios de usar CQS:**

- **Claridad mental:** Al leer el código, sabes que si un método devuelve algo, es seguro llamarlo. Si no devuelve nada, sabes que algo va a cambiar.
- **Facilidad de testing:** Las consultas son extemandamente fáciles de probar porque no ensucian el estado del sistema
- **Mantenibilidad:** Reduce los "efectos secundarios" sorpresa que suelen causar bugs (error de software) difíciles de rastrear. 



**CQRS (Command Query Responsibility Segregation)**

Es un patrón de arquitectura que lleva el concepto de CQS al nivel de **objetos o servicios**. En lugar de solo separar métodos, separas los modelos de datos para lectura y escritura.

- **Lado de Escritura (Commands):** Optimizado para la validación de reglas de negocio y consistencia.
- **Lado de Lectura (Queries):** Optimizado para la velocidad y la presentación (vistas).

**¿Para qué sirve?** * **Escalabilidad:** Puedes escalar el servidor de lectura independientemente del de escritura (normalmente se lee mucho más de lo que se escribe).

- **Rendimiento:** Puedes usar una base de datos relacional para escribir y una NoSQL (o una caché) para leer.
- **Flexibilidad:** El modelo que usas para guardar un usuario no tiene por qué ser el mismo modelo complejo que usas para mostrar su perfil con estadísticas.

**¿Cómo se utiliza?** Generalmente se implementa usando un **Bus de Mensajes** y separando los modelos:

1. **Command:** Un objeto DTO que describe la intención (`CrearPedido`).
2. **Command Handler:** Procesa el comando y guarda en la BD de escritura.
3. **Query:** Un objeto que pide datos (`ObtenerDetallesPedido`).
4. **Query Handler:** Consulta una BD de lectura (que puede ser una versión simplificada de la de escritura) y devuelve un DTO.



**CQS vs CQRS (diferencia clave)**

Es común confundirlos, pero no son lo mismo:

1. **CQS**: Es a nivel de métodos y clases. Es una disciplina de programación simple.
2. **CQRS** (Command Query Responsibility Segregation): Es un patrón de arquitectura. Lleva el concepto de CQS al extremo, separando incluso los modelos de datos o las bases de datos (uno para lectura y otro para escritura). 

| **Característica** | **CQS**                            | **CQRS**                                 |
| ------------------ | ---------------------------------- | ---------------------------------------- |
| **Nivel**          | Código (Métodos/Funciones)         | Arquitectura (Sistemas/Servicios)        |
| **Foco**           | Evitar efectos secundarios         | Escalabilidad y rendimiento              |
| **Modelos**        | Comparte el mismo objeto/clase     | Modelos de lectura y escritura distintos |
| **Complejidad**    | Baja (esencial para código limpio) | Alta (solo para sistemas complejos)      |

**¿Cuándo usar cada uno?**

- **CQS:** **Siempre.** Es una regla de oro para que tu código sea predecible y fácil de mantener.
- **CQRS:** **Solo cuando sea necesario.** Si tu aplicación tiene mucha carga, modelos de lectura muy distintos a los de escritura, o si estás trabajando con microservicios. No lo uses en proyectos pequeños porque añade mucha complejidad innecesaria.



# Command y CommandHandler

En el contexto de **Symfony (PHP)**, el patrón Command/CommandHandler es el estándar moderno para manejar la lógica de negocio de forma desacoplada. Symfony facilita esto enormemente a través de un componente llamado **Messenger**.

## **1. ¿Qué es cada pieza?**

**El Command (El "Qué")**

Es una clase PHP simple (un DTO) que representa una instrucción. Solo contiene los datos necesarios para ejecutar una acción.

- **No tiene lógica.**
- **Es inmutable** (solo tiene propiedades y un constructor).

**El Command Handler (El "Cómo")**

Es el servicio encargado de ejecutar la lógica cuando recibe un Command específico.

- **Tiene las dependencias:** Aquí inyectas el EntityManager, servicios de email, APIs, etc.
- **Solo hace una cosa:** Ejecuta la acción que dicta el Command.

## 2. ¿Para qué sirve?

1. **Desacoplamiento:** Tu controlador no sabe *cómo* se registra un usuario, solo envía el "ticket" (Command) al bus.
2. **Reutilización:** Puedes lanzar el mismo Command desde un controlador, desde un comando de consola (CLI) o desde un cron job.
3. **Procesamiento Asíncrono:** Con Symfony Messenger, puedes enviar un Command a una **cola** (RabbitMQ, Redis) para que se procese en segundo plano sin hacer esperar al usuario.

## 3. ¿Cómo se utiliza en Symfony?

Para usar esto, asegúrate de tener instalado el componente: `composer require symfony/messenger`.

**Paso A: Crear el Command**

Imagina que queremos registrar un usuario.

```php
// src/Message/RegisterUserCommand.php
namespace App\Message;

class RegisterUserCommand
{
    public function __construct(
        public readonly string $email,
        public readonly string $password,
    ) {}
}
```

**Paso B: Crear el Command Handler**

Symfony detecta automáticamente los handlers si implementan `AsMessageHandler`.

```php
// src/MessageHandler/RegisterUserHandler.php
namespace App\MessageHandler;

use App\Message\RegisterUserCommand;
use Symfony\Component\Messenger\Attribute\AsMessageHandler;

#[AsMessageHandler]
class RegisterUserHandler
{
    public function __invoke(RegisterUserCommand $command)
    {
        // 1. Aquí va la lógica de negocio
        // 2. Persistir en base de datos
        // 3. Enviar email de bienvenida, etc.
        echo "Registrando a: " . $command->email;
    }
}
```

**Paso C: Usarlo en un Controlador**

Para "disparar" el proceso, usamos el **MessageBusInterface**.

```php
// src/Controller/RegistrationController.php
namespace App\Controller;

use App\Message\RegisterUserCommand;
use Symfony\Component\Messenger\MessageBusInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class RegistrationController
{
    #[Route('/register', name: 'app_register')]
    public function register(MessageBusInterface $bus): Response
    {
        // Creamos el comando con los datos del request
        $command = new RegisterUserCommand('user@example.com', '123456');

        // Lo enviamos al bus
        $bus->dispatch($command);

        return new Response('¡Usuario enviado a procesar!');
    }
}
```

## 4. El Flujo de Trabajo en Symfony

1. **El Bus:** Recibe el mensaje (`dispatch`).
2. **Middleware:** Symfony puede aplicar lógica intermedia (logs, transacciones de base de datos).
3. **Transporte:** Decide si se ejecuta **ahora mismo** (síncrono) o si se manda a una **cola** (asíncrono).
4. **Handler:** Finalmente, el bus encuentra al "manejador" correcto y le pasa el comando.



CQRS se une con Event-Driven Architecture (Arquitectura dirigida por eventos).

Cuando decimos que "los comandos producen eventos", nos referimos a la cadena de causalidad en el sistema: el **Comando** es la intención ("haz esto") y el **Evento** es el resultado ("esto ya pasó").

**1. La diferencia conceptual: Intención vs. Hecho**

- **Command (Comando):** Es una orden. Puede ser rechazada (si falla la validación o las reglas de negocio).
  - *Ejemplo:* `ConfirmarPedido`.
- **Event (Evento):** Es algo que **ya sucedió** en el pasado. No se puede rechazar, es un hecho histórico.
  - *Ejemplo:* `PedidoConfirmado`.

**2. ¿Cómo funciona el flujo con un EventBus?**

El **EventBus** es el cartero que lleva la noticia a otras partes del sistema que no sabían lo que el CommandHandler acaba de hacer.

1. **Llega el Comando:** El `ConfirmarPedidoHandler` recibe el comando.
2. **Se ejecuta la lógica:** El handler actualiza la base de datos (pone el pedido como "pagado").
3. **Se dispara el Evento:** Una vez que la base de datos se guarda con éxito, el handler publica un mensaje `PedidoConfirmado` en el **EventBus**.
4. **Reacción:** Otros servicios que están escuchando el EventBus reaccionan de forma independiente:
   - El **Servicio de Email** envía el ticket al cliente.
   - El **Servicio de Logística** empieza a preparar el paquete.
   - El **Servicio de Estadísticas** actualiza el gráfico de ventas.

**3. ¿Por qué se hace así? (Desacoplamiento total)**

Sin eventos, el `ConfirmarPedidoHandler` tendría que conocer a todos los demás servicios:

```php
// MAL: El handler sabe demasiado
public function handle(ConfirmarPedido $cmd) {
    $this->db->save($pedido);
    $this->emailService->send(...);
    $this->logisticaService->notificar(...);
    $this->statsService->update(...);
}
```

Con eventos y **EventBus**, el handler solo se encarga de lo suyo:

```php
// BIEN: El handler solo cumple la orden y avisa que terminó
public function handle(ConfirmarPedido $cmd) {
    $this->db->save($pedido);
    
    // El EventBus se encarga de repartir la noticia
    $this->eventBus->publish(new PedidoConfirmado($pedido->getId()));
}
```

**4. Resumen técnico en Symfony**

Si usas **Symfony Messenger**, esto se traduce en tener dos buses:

1. **CommandBus:** Síncrono. Ejecuta la acción principal.
2. **EventBus:** A menudo asíncrono. Despacha los eventos a "Listeners" o "Subscribers" que realizan tareas secundarias sin bloquear al usuario.

**En pocas palabras:**

El **Comando** es el detonante y el **Evento** es la onda expansiva que permite que el resto del sistema se entere y reaccione sin que el proceso principal se vuelva lento o complejo.




# **Lógica de Negocio:**

Por el catálogo c17 es como nos conocen.

A partir del catálogo c17 hay varios módulos:

- **C17**+: lanza las peticiones.
- **ILL17:** modulo de préstamos, contiene más info de la petición.
- **B17: ** módulo de libros (= c17 pero con libros)
- **K17:** control de revistas en papel. (kardest)
- **P17:** las revistas se suscriben en bloques
- **O17:** los usuarios pueden acceder a la biblioteca csi.c17



Cuando en la URL www.c17..... pone:

- /index.php/ nos indica que está en la aplicación LEGACY (r17 controlardor SegullApp) 
- /es/app/ nos indica que la última versión de la aplicacion

**bvcsm**: es la de la Comunidad de Madrid

**JAMA**: es una revista.



**PubMed:** 

Base de datos de Medicina de EEUU con un ID para cada artículo (ese id lo cogen para trabajar).

**PMID**: Identificados en PubMed (id único y secuencial, es un entero secuencial).

**DOI**: identificador único para cada artículo, también es una URL única que va al proveedor raiz. 

No todo tiene que tener DOI, pero si PMID que es lo que nosotros utilizamos (lo metemos en la web de usuarios para filtrar). 



Una vez que se hace una petición en la web c17 aparece en la bandeja de pendientes ordenado por * y luego alfabéticamente.

**Agencia**: se refiere a una biblioteca.

**Instituciones**:  agrupan bibliotecas. Ej: Consejería de Madrid.

**Fondos:** cobertura que tiene una biblioteca para una revista. Relaciona una cobertura con una revista.

**Colección:** hay tres tipos:

- Propia: quieren quitarla, pertenece a una biblioteca y siempre está suscrita.
- Paquetes (colección suscribible): puede pertenecer a una biblioteca o institución y necesita estar suscrita para que aparezca en los fondos.
- Libres: a nosotros como empresa (revistas gratuitas). Se utiliza como añadido a los que están suscritos o son clientes de más tiempo o con más confianza.

**Balance:** equilibrio respecto a las otras bibliotecas ( es la diferencia entre las propias y las ajenas). 

**Cobertura:** es cuando empieza y cuando acaba, (es un año por ejemplo). Ej: años de cobertura de una revista. (1975,1978-89,(1990-93),1998-2002,(2025-23),2025.

*si acaba en . la colección esta cerrada y si acaba en - está abierta

- en papel

- electrónico

  

fondo-> catálogo colección -> n revistas -> más 1 papel y 1 electrónica.

Cuando se crea se le pone la fecha.

**preprint:** un artículo puede estar disponible suelto antes de estar en la revista. Las revistas se publican cada cierta peridiocidad, pero 

**Tupla:** conjunto de papel y/o electrónico

**Collection Manager:** quien es el dueño, es el que lo puede editar (editor).

**ISBN:** ID de un libro, si se reedita se cambia el ISBN

**ISSN:** ID de las revistas, hay uno para el papel y otro para el digital. NO cambia el ISSN.



**Petición:** Una petición puede ser:

- propia:
  - interna
  - externa
- ajena

Dependiendo de quien la vea estará en una bandeja o en otra.

Petición -> Biblioteca A -> lo tengo (interna)

Petición -> Biblioteca A -> NO lo tengo (externa, la pido a otra biblioteca B) *Para la Biblioteca B la petición es ajena.



**FeatureFlag**: activa o desactiva comportamientos. Ej: algunos usuarios pueden ver la vista nueva y/o antigua.



**Backoficce:** web donde nosotros vamos implementando acciones para facilitarnos el trabajo.

Actualización de fondos es con lo que están trabajando ahora.



# **Pruebas**: 

Web pruebas:

www.c17.localhost: la web del catálogo para las bibliotecas.

www.csi.c17.localhost: la web de los usuarios (nuestra)



**Usuarios pruebas:**

Desde la web para navegar y probar

usuario: admin **MANTON**

usuario: **manager10**: biblioteca de prueba (lo que ven bibliotecario) (tiene menos permisos que mantón)

Todos los usuarios tienen la misma clave: foobar (coincide con el nombre de la bd)

**user100**: usuario de prueba de la web de usuarios csi

usuario: **admin** 	clave: **foobar**

Para probar con una copia de la bd de producción: 

- descomentar la línea que esta en el archivo web/sdf17/env.dev.local
- entrar con el usuario: **user5** clave: **foobar**



## GLOSARIO

**Los comando producen eventos (eventbus)**

**No usamos event sourcing**

**La estructura de carpetas del event es parecida a la de command ** (Command y CommadHandler) (Event y EventHandler)

Command bus: hace de intermediario entre quien envia un comando y quien lo procesa.

- Recibe un comando
- Encuentra el handler asociado
- Invoca el handler con el comando.

El **handler** contiene la lógica de procesamiento del comando. Recibe el comando, ejecuta la lógica de negocio y persiste los cambios.

- Crea o recupera el agregado.
- Ejecuta la operación de negocio
- persiste el agregado
- publica los eventos generados.

Algunos comandos pueden producir eventos (EventBus), es importante ya que es el mecanismo que conecta el WriteModel con los ReadModels.

Cuando el agregado genera eventos el EventBus los distribuye a las proyecciones.



- **CQRS**: Comman Query Responsibility Segregatión: separa las operaciones que modifican el estado del sistema (comandos) de aquellas que únicamente consultan información (queries).

- **CQS**: Comman Query Separation: Un método debe hacer una sola cosa: modificar estado o devolver datos, pero no ambos.

- **DDD: Domain-Driven-Desing:** Representa el conocimiento del dominio dentro del código, encapsulando reglas e invariantes del negocio en agregados coherentes.

  Los modelos de lectura tienen que estar sincronizados con los eventos de escritura. 

  https://www.netmentor.es/entrada/domain-driven-design

  Contiene el concepto de Domain Events. Un ejemplo de evento de dominio (recorder). Un "dominio" no es el código, es el acto físico de mover paquetes de un punto A a un punto B.

  -  **Entidades**: objeto relacionado que **tiene** una **identidad única que persiste en el tiempo** independientemente de si sus atributos cambian.
  - **Agregado**: Tiene ID (se puede identificar). Es el único punto de entrada, si hay que hacer algo es el encargado.
  - **ValueObject**: aspectos del dominio que **no tienen identidad propia**, lo que importa son sus atributos. Si cambias un atributo, tienes un objeto nuevo.

- **Eventos de integración:** se utilizan para comunicar cambios de estado entre diferentes microservicios, sistemas externos



- **DTO** (Data Transfer Object) es un patrón de diseño cuyo único propósito es **transportar datos** entre procesos o partes de un sistema.

  En términos sencillos: imagina que el DTO es un sobre. No le importa la carta que lleva dentro ni quién la escribió; su única función es asegurar que la información llegue de un punto A a un punto B de forma organizada.

  El DTO es un **mensajero**. Su única misión es mover datos de un sitio a otro (por ejemplo, de tu base de datos a una pantalla de celular).

  - **Identidad:** No le importa quién es. Si tienes dos DTOs con los mismos datos, para el sistema siguen siendo solo dos paquetes de datos.
  - **Mutabilidad:** Suelen ser mutables (puedes cambiar sus valores después de crearlos), aunque es buena práctica hacerlos inmutables.
  - **Lógica:** **Cero lógica**. Solo tiene atributos, *getters* y *setters*.
  - **Uso:** En las fronteras de tu aplicación (API, controladores, servicios externos).

  Tipos de DTO en symfony 7:

  - **DTO de entrada:** recibe datos del exterior

    ```php
    final class CreateOrderDTO
    {
        public function __construct(
            #[Assert\NotBlank]
            #[Assert\Positive]
            public readonly int $productId,
    
            #[Assert\NotBlank]
            #[Assert\Positive]
            public readonly int $quantity,
    
            #[Assert\NotBlank]
            #[Assert\Email]
            public readonly string $customerEmail,
        ) {}
    }
    
    // En el controlador — Symfony lo construye automáticamente
    #[Route('/orders', methods: ['POST'])]
    class CreateOrderController extends AbstractController
    {
        public function __invoke(
            #[MapRequestPayload] CreateOrderDTO $dto  // deserializado y validado
        ): JsonResponse {
            $this->commandBus->dispatch(
                new CreateOrderCommand(
                    $dto->productId,
                    $dto->quantity,
                    $dto->customerEmail
                )
            );
    
            return $this->json(null, Response::HTTP_CREATED);
        }
    }
    ```

  - **DTO de salida:** devuelve datos al exterior

    ```php
    final class UserResponseDTO
    {
        public function __construct(
            public readonly string $id,
            public readonly string $email,
            public readonly string $name,
            public readonly string $status,
            public readonly string $createdAt,
        ) {}
    
        public static function fromUser(User $user): self
        {
            return new self(
                id:        $user->id()->value(),
                email:     $user->email()->value(),
                name:      $user->name(),
                status:    $user->status()->value,
                createdAt: $user->createdAt()->format(\DateTimeInterface::ATOM),
            );
        }
    
        public function toArray(): array
        {
            return [
                'id'         => $this->id,
                'email'      => $this->email,
                'name'       => $this->name,
                'status'     => $this->status,
                'created_at' => $this->createdAt,
            ];
        }
    }
    
    // En el controlador
    class GetUserController extends AbstractController
    {
        public function __invoke(#[MapEntity] User $user): JsonResponse
        {
            return $this->json(
                UserResponseDTO::fromUser($user)->toArray()
            );
        }
    }
    ```

  - **Command/Query**

    ```php
    // Command — intención de cambiar algo
    final class CreateUserCommand
    {
        public function __construct(
            public readonly string $name,
            public readonly string $email,
            public readonly string $password,
        ) {}
    }
    
    // Query — intención de consultar algo
    final class FindUserQuery
    {
        public function __construct(
            public readonly string $userId
        ) {}
    }
    ```

    

  - 

  

- **Value Object (Objeto de Valor): (VO)** es una pieza de tu **lógica de negocio**. Representa un concepto descriptivo del dominio que no tiene una identidad única, sino que se define por lo que vale.

  - **Identidad por valor:** Si dos Value Objects tienen los mismos atributos, **son el mismo objeto**.
  
    - *Ejemplo:* Un billete de 10 USD. No te importa el número de serie (identidad), te importa que vale "10" y es "USD". Si lo cambias por otro de 10 USD, tienes lo mismo.
  
    ```php
    $email1 = new Email('user@test.com');
    $email2 = new Email('user@test.com');
    
    // Objetos distintos en memoria pero iguales en valor
    $email1 === $email2;          // false (distinta referencia)
    $email1->equals($email2);     // true  ✅ (mismo valor)
    ```
  
  - **Inmutabilidad:** Esto es sagrado. Un VO **nunca cambia**. Si quieres "modificarlo", creas uno nuevo con el valor diferente.
  
  - **Lógica:** Tiene **lógica de validación**. Un VO se asegura de que los datos sean correctos desde que nace.
  
    - *Ejemplo:* Un VO llamado `Email` lanzará un error si intentas crearlo sin un "@".
  
    Se valida en el constructor, nunca existe inválido:
  
    ```php
    final class Age
    {
        public function __construct(private readonly int $value)
        {
            if ($value < 0 || $value > 150) {
                throw new \InvalidArgumentException(
                    "Edad inválida: $value"
                );
            }
        }
    }
    
    // Nunca puede existir un Age inválido
    $age = new Age(-5);   // ❌ lanza excepción inmediatamente
    $age = new Age(200);  // ❌ lanza excepción inmediatamente
    $age = new Age(25);   // ✅
    ```
  
  - **Uso:** Dentro del núcleo de tu aplicación (el Dominio).



**Comparativa Rápida DTO y ValueObject**

| **Característica** | **DTO**                        | **Value Object**                    |
| ------------------ | ------------------------------ | ----------------------------------- |
| **Propósito**      | Transportar datos (Mensajero). | Representar un concepto (Lógica).   |
| **Identidad**      | No tiene identidad propia.     | Su identidad es su valor.           |
| **Validación**     | No suele validar nada.         | Se auto-valida (siempre es válido). |
| **Cambios**        | Se pueden cambiar sus campos.  | Es 100% inmutable.                  |
| **Ubicación**      | Capas externas (API/Red).      | Capa interna (Dominio/Negocio).     |

```php
// 1. Llega la petición HTTP
// POST /users  { "email": "USER@TEST.COM", "name": "John" }

// 2. DTO recoge los datos crudos (sin validar dominio)
final class CreateUserDTO
{
    public function __construct(
        #[Assert\NotBlank]
        #[Assert\Email]
        public readonly string $email,
        #[Assert\NotBlank]
        public readonly string $name,
    ) {}
}

// 3. El controlador despacha el command (otro DTO)
class CreateUserController extends AbstractController
{
    public function __invoke(
        #[MapRequestPayload] CreateUserDTO $dto
    ): JsonResponse {
        $this->commandBus->dispatch(
            new CreateUserCommand($dto->email, $dto->name)
        );
        return $this->json(null, 201);
    }
}

// 4. El handler convierte a Value Objects (aquí entra el dominio)
class CreateUserHandler
{
    public function __invoke(CreateUserCommand $command): void
    {
        $user = User::create(
            UserId::generate(),
            new Email($command->email),  // string → Value Object
            $command->name
        );

        $this->repository->save($user);
    }
}
```



**1. Elasticsearch: El Motor (Backend)**

Es un **motor de búsqueda y analítica** distribuido. Imaginalo como una base de datos superpotente diseñada para buscar entre millones de datos en milisegundos.

- **¿Qué hace?** Almacena, busca y analiza grandes volúmenes de datos.
- **¿Cómo se usa?** Principalmente a través de código o peticiones técnicas (API REST). No tiene una "cara" o interfaz visual propia por defecto; es puro código y terminal.
- **Instalación:** Se instala en servidores (locales o en la nube).



**2. Elasticvue: La Herramienta Visual (Frontend)**

Es una **interfaz de usuario (GUI)** gratuita y de código abierto para gestionar Elasticsearch. No es una base de datos, es una herramienta para que los humanos puedan interactuar con Elasticsearch sin escribir tanto código.

- **¿Qué hace?** Te permite ver tus índices, realizar búsquedas, editar documentos y revisar el estado de tu servidor de Elasticsearch de forma gráfica.
- **¿Cómo se usa?** Se instala como una **extensión de navegador** (Chrome, Firefox) o como una aplicación de escritorio/Docker.
- **Relación:** Necesitas tener Elasticsearch funcionando para que Elasticvue sirva de algo.



**Comparativa Directa ElasticSearch y Elasticvue**

| **Característica** | **Elasticsearch**                  | **Elasticvue**                                   |
| ------------------ | ---------------------------------- | ------------------------------------------------ |
| **Naturaleza**     | Motor de base de datos / Búsqueda. | Interfaz de usuario (Visualizador).              |
| **Función**        | Almacenar y procesar datos.        | Ver y administrar los datos.                     |
| **Interfaz**       | Línea de comandos / API JSON.      | Botones, tablas y menús visuales.                |
| **Analogía**       | El motor de un coche.              | El tablero de instrumentos (velocímetro, luces). |



**Ansible**: proceso de despliege. es una herramienta de código abierto que sirve para automatizar tareas de TI, como configurar servidores, instalar software y desplegar aplicaciones.

```bash
sudo apt get install ansible
```

**Middleware:** capa de código que se ejecuta entre la recepción de una solicitud HTTP y la generación de la respuesta. Actúa como un "interceptor" que puede inspeccionar, modificar o rechazar solicitudes y respuestas.

Se utiliza para separar preocupaciones transversales (cross-cutting concerns) que afectan a múltiples partes de la aplicación, como autenticación, loggins, CORS, comprensión, rate limiting, etc.

![image-20260502114335729](/home/soa/.config/Typora/typora-user-images/image-20260502114335729.png)

En symfony 7, el middleware se implementa como Event Listeners/Suscribers o KernelEvents, Symfony no tiene un concepto de "middleware" explícito como Express.js, sino que utiliza el sistema de **eventos del HttpKernel**. Los puntos principales de interceptación son:

![image-20260502114541098](/home/soa/.config/Typora/typora-user-images/image-20260502114541098.png)



Webs para buscar info:

https://siemprelisto.cl/tecnologias/cqrs/07-command-bus/

https://www.netmentor.es/entrada/domain-driven-design
