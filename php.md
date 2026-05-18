# PHP

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

4. **Tipos de Unión (Union Types)**

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

   1. **"Diffs" más limpios en Git**

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

   

**El uso de Composer es obligatorio**

No intentes reinventar la rueda. **Composer** es el gestor de dependencias de PHP. Si necesitas enviar correos, procesar imágenes o crear una API, descarga una librería profesional.

- `composer.json`: El archivo donde declaras tus librerías.
- `vendor/`: La carpeta donde se instalan. Nunca edites nada ahí dentro.
- **Autoload:** Gracias a Composer, no tienes que usar mil `include` o `require`; las clases se cargan solas cuando las necesitas.

**Seguridad Básica (Lo que te evitará desastres)**

PHP es famoso por ser fácil de hackear si se usa mal. Sigue estas tres reglas:

1. **Nunca confíes en el usuario:** Siempre valida y limpia los datos de `$_POST` o `$_GET`.
2. **Prevención de SQL Injection:** Jamás concatenes variables en una consulta SQL. Usa siempre **Sentencias Preparadas** (con PDO o Doctrine).
3. **XSS (Cross-Site Scripting):** Al imprimir texto en HTML, usa funciones como `htmlspecialchars()` o deja que un motor de plantillas como **Twig** lo haga por ti automáticamente.

 **Programación Orientada a Objetos (POO) y PSRs**

El PHP moderno es 100% orientado a objetos. Para que tu código sea compatible con el de otros desarrolladores, debes seguir las **PSR (PHP Standard Recommendations)**:

- **PSR-1 y PSR-12:** Reglas de estilo (dónde poner llaves, espacios, etc.).
- **PSR-4:** El estándar para el cargado automático de clases (Namespaces).

**Programación Declarativa vs. Imperativa**

PHP permite ambos estilos. Sin embargo, para colecciones de datos, se está moviendo hacia un estilo más funcional.

- **Imperativo:** Usar un `foreach` para filtrar una lista.
- **Declarativo:** Usar funciones como `array_map`, `array_filter` o `array_reduce`.

**Herramientas de Calidad (Tu "Cinturón de Seguridad")**

Para ser un desarrollador senior, integra estas herramientas en tu flujo:

- **PHPStan o Psalm:** Analizan tu código sin ejecutarlo para decirte si hay errores lógicos o de tipado.
- **PHPUnit:** Para escribir tests automatizados.
- **Xdebug:** Esencial para depurar. Olvida el `var_dump()` eterno; con Xdebug puedes pausar la ejecución del código y ver qué está pasando.

**Resumen de "Buenas Prácticas":**

| **Malas Prácticas (Legacy)**           | **Buenas Prácticas (Moderno)**            |
| -------------------------------------- | ----------------------------------------- |
| Mezclar HTML y PHP en el mismo archivo | Usar motores de plantillas (Twig/Blade)   |
| Usar la librería `mysqli` manualmente  | Usar un ORM (Doctrine) o un Query Builder |
| No definir tipos en funciones          | Usar `declare(strict_types=1);`           |
| Subir archivos por FTP                 | Usar Git y despliegues automáticos        |

***declare(strict_types=1);**

Es una directiva de PHP que fuerza al motor del lenguaje a ser **estricto** con los tipos de datos en las llamadas a funciones y retornos. Por defecto, PHP es muy "permisivo" (tipado débil). Si una función espera un número entero (int) y le pasamos un texto que parece un número ("5"), PHP lo convertirá automáticamente sin decir nada. Con el modo estricto, esto lanzará un error.

Para entenderlo, mira qué pasa en una misma función con y sin esta línea:

1. **Sin tipado estricto (Comportamiento por defecto)**

   PHP intenta "ayudarte" convirtiendo los tipos por detrás (coerción).

   ```php
   <?php
   function sumar(int $a, int $b) {
       return $a + $b;
   }
   
   echo sumar(5, "10"); // Resultado: 15 (PHP convirtió el string "10" a int silenciosamente)
   ```

2. **Con tipado estricto (`strict_types=1`)**

   PHP deja de hacer suposiciones y exige exactamente lo que se pidió.

   ```php
   <?php
   declare(strict_types=1);
   
   function sumar(int $a, int $b) {
       return $a + $b;
   }
   
   echo sumar(5, "10"); // ERROR: Fatal error: Uncaught TypeError
   ```

   

## Variables

Son **contenedores de datos** que almacenan valores en memoria durante la ejecución.

### 1. Reglas de Sintaxis (Imprescindibles)

- **El signo `$ `:** Todas las variables deben comenzar con el símbolo de dólar.
- **Nombres:** Deben empezar por una letra o un guion bajo (`_`), nunca por un número.
- **Sensibilidad:** Son *case-sensitive*. `$usuario` y `$Usuario` son dos variables distintas.
- **Asignación:** Se utiliza el operador `=` para darles valor.
- Su valor puede cambiar en cualquier momento.
- Existen dentro de un scope (ámbito)



```
$nombre = "Alex";    // Correcto
$_edad = 25;         // Correcto
$1puesto = "Oro";    // ERROR: empieza por número
```



### 2. Tipos de Datos

Aunque no los declares, PHP asigna uno internamente según el valor: (en php8 hay que prototipar)

- **String (Cadena):** Texto entre comillas simples o dobles. `$ciudad = "Madrid";`
- **Integer (Entero):** Números sin decimales. `$puntos = 100;`
- **Float / Double:** Números con decimales. `$precio = 19.99;`
- **Boolean:** Valores lógicos. `$es_valido = true;`
- **Array:** Colecciones de datos.
- **Null:** Cuando una variable no tiene valor. `$variable = null;`

#### Mixed:

Es un tipo nativo de PHP 8 que indíca explícitamente que un valor puede ser cualquier tipo posible

```php
mixed = null | bool | int | float | string | array | object | resource
    
function procesar(mixed $valor): mixed {
    return $valor;
}

procesar(42);        // ✅
procesar("hola");    // ✅
procesar(null);      // ✅
procesar([1, 2, 3]); // ✅
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



### 3. Ámbito de las Variables (Scope)

Este es el punto donde la mayoría de los desarrolladores se confunden al principio. El lugar donde declaras una variable determina dónde puedes usarla:

- **Local:** Una variable declarada dentro de una función solo existe dentro de esa función.
- **Global:** Una variable declarada fuera de cualquier función. Para usarla dentro de una función, debes usar la palabra clave `global`.
- **Static:** Una variable local que no pierde su valor cuando la función termina de ejecutarse.

### 4. Variables Superglobales

PHP tiene variables especiales que están disponibles en cualquier parte de tu código (en cualquier archivo, clase o función) sin que tengas que hacer nada. Las más importantes para el desarrollo web son:

| **Variable** | **Uso principal**                                          |
| ------------ | ---------------------------------------------------------- |
| `$_GET`      | Captura datos enviados por la URL.                         |
| `$_POST`     | Captura datos enviados por un formulario.                  |
| `$_SESSION`  | Almacena datos del usuario mientras navega por la web.     |
| `$_COOKIE`   | Lee los valores de las cookies del navegador.              |
| `$_SERVER`   | Información sobre el servidor y el entorno de ejecución.   |
| `$_ENV`      | Variables de entorno (como las que configuras en Symfony). |

### 5. Variables de Variables (Curiosidad)

PHP permite algo muy loco: usar el valor de una variable como el nombre de otra. No se usa mucho porque puede volver loco a cualquiera que lea tu código, pero es bueno saber que existe:

```
$bebida = "cafe";
$$bebida = "con leche"; // Se crea la variable $cafe

echo $cafe; // Imprime: con leche
```

### Arrays

Un array es una estructura de datos puede comportarse como una lista, un diccionario o una tabla de mapas. Básicamente hay 3 tipos de arrays:

1. **Arrays Indexados (Numéricos o simples):**

   Son los más comunes: cada elemento tiene un índice numérico automático que comienza siempre desde el 0.

   ```php
   // Forma larga (antigua)
   $colores = array('rojo', 'azul', 'verde');
   
   // Forma corta (la que verás en tu código)
   $colores = ['rojo', 'azul', 'verde'];
   
   // Acceder por posición, empieza en 0
   echo $colores[0]; // 'rojo'
   echo $colores[1]; // 'azul'
   echo $colores[2]; // 'verde'
   ```

   Uso ideal: listas de elementos donde el orden es importante pero no necesitas una etiqueta para cada valor.

2. **Arrays Asociativos:**

   En lugar de números, se utiliza **claves (keys)** personalizadas (strings) para identificar cada valor. Es lo más parecido a un objeto JSON o un diccionario.

   ```php
   $persona = [
       'nombre' => 'Ana',
       'edad'   => 25,
       'ciudad' => 'Madrid',
   ];
   
   // Acceder por clave
   echo $persona['nombre']; // 'Ana'
   echo $persona['edad'];   // 25
   
   // Modificar un valor
   $persona['edad'] = 26;
   
   // Añadir un nuevo valor
   $persona['email'] = 'ana@email.com';
   ```

   Uso ideal: Para representar registros de datos o perfiles donde cada dato tiene un nombre específico.

3. **Arrays multidimensionales (arrays de arrays):**

   Es un array que contiene otros arrays dentro de él. Puede tener tantos niveles de profundidad como necesites (aunque más de 3 niveles suele ser difícil de mantener)

   ```php
   $usuarios = [
       ['nombre' => 'Ana',   'edad' => 25],
       ['nombre' => 'Pedro', 'edad' => 30],
       ['nombre' => 'María', 'edad' => 28],
   ];
   
   // Acceder
   echo $usuarios[0]['nombre']; // 'Ana'
   echo $usuarios[1]['edad'];   // 30
   
   // Recorrerlo con foreach
   foreach ($usuarios as $usuario) {
       echo $usuario['nombre'];
   }
   ```
   
   Uso ideal: para estructuras de datos complejas, como tablas de una base de datos o menús de navegación con subcategorías.

En PHP, internamente **todos los arrays son mapas ordenados**. Esto significa que puedes mezclar índices numéricos y claves de texto en el mismo array, aunque **no es recomendable** por salud mental y claridad del código:

```php
$mezcla = [0 => "Hola", "clave" => "Mundo"]; // Es válido, pero confuso.
```



## Argumentos

Son los valores que se pasan a una función cuando la llamas. Están ligados al concepto de parámetros.

```php
function saludar(string $nombre, int $edad): string {
    return "Hola $nombre, tienes $edad años";
}

saludar("Ana", 30); // "Ana" y 30 son los ARGUMENTOS
```

**La distinción clave: Parámetro vs Argumento**

| Concepto      | ¿Qué es?                                              | Ejemplo          |
| ------------- | ----------------------------------------------------- | ---------------- |
| **Parámetro** | Variable declarada en la **definición** de la función | `string $nombre` |
| **Argumento** | Valor concreto pasado en la **llamada**               | `"Ana"`          |

```php
//          parámetros ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
function saludar(string $nombre, int $edad): string { ... }

//      argumentos ↓↓↓↓↓↓
saludar("Ana",   30);
```

**Tipos de parámetros en PHP8:**

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

6. Por valor (copia del dato, comportamiento por defecto)

   ```php
   function incrementar(int $n): void {
       $n++; // solo modifica la copia
   }
   $x = 5;
   incrementar($x);
   echo $x; // sigue siendo 5
   ```

7. Por referencia: (modifica la variable original)

   ```php
   function incrementar(int &$n): void {
       $n++;
   }
   $x = 5;
   incrementar($x);
   echo $x; // ahora es 6
   ```

8. Con valor por defecto

   ```php
   function saludar(string $nombre, string $saludo = "Hola"): string {
       return "$saludo, $nombre";
   }
   saludar("Ana");          // "Hola, Ana"
   saludar("Ana", "Hey");   // "Hey, Ana"
   ```

   

| **Técnica**       | **Cuándo usarla**                                            |
| ----------------- | ------------------------------------------------------------ |
| **Posicionales**  | Para métodos cortos (1-2 argumentos) donde el orden es obvio. |
| **Nombrados**     | Para métodos con muchos parámetros o valores booleanos confusos. |
| **Splat (`...`)** | Cuando los datos vienen de una base de datos o una API como array. |
| **Union Types**   | Cuando un argumento puede recibir varios tipos (ej: `int     |

**Resumen rápido**

- **Variable** → contenedor de datos, existe en un scope
- **Parámetro** → variable declarada en la firma de una función
- **Argumento** → valor concreto que pasas al llamar la función





## Constructor

Es un método especial, que se ejcuta automáticamente en el momento exacto en que creas un objeto de una clase usando la palabra clave **new**

Su función principal es "preparar" el objeto: asignarle valores iniciales a sus propiedades o ejecutar configuraciones necesarias para que el objeto sea útil desde el segundo uno.

1. **Sintaxis básica.**

   El nombre del constructor siempre deber ser __construct (con doble guion bajo). Ejemplo:

   ```php
   class Coche {
       public $marca;
       public $color;
   
       // Este es el constructor
       public function __construct($marca, $color) {
           $this->marca = $marca;
           $this->color = $color;
           echo "¡Se ha creado un coche $marca de color $color!";
       }
   }
   
   // Al hacer 'new', el constructor se dispara solo
   $miCoche = new Coche("Toyota", "Rojo");
   ```

2. **Constructor Property Promotion (PHP 8+)**

   Esta es la forma moderna y la que más verás en Symfony o Laravel. Te permite ahorrar muchísimo código; declaras la propiedad, el parámetro y la asignas, todo en la misma línea.

   **Antes (PHP 7.4 hacia atrás):**

   ```php
   class User {
       private $name;
       public function __construct($name) {
           $this->name = $name;
       }
   }
   ```

   **Ahora (PHP 8.0+):**

   ```php
   class User {
       // Al poner 'private' o 'public' en el argumento, PHP hace todo por ti
       public function __construct(
           private string $name
       ) {}
   }
   ```

3. **Constructores y Herencia (Parent)**

   Si una clase hija tiene su propio constructor, PHP **no** llamará automáticamente al constructor del padre. Tienes que hacerlo tú manualmente usando `parent::__construct()`.

   ```php
   class Animal {
       public function __construct() {
           echo "Soy un animal. ";
       }
   }
   
   class Perro extends Animal {
       public function __construct() {
           parent::__construct(); // Llama al constructor de Animal
           echo "Y soy un perro.";
       }
   }
   
   $fido = new Perro(); // Imprime: Soy un animal. Y soy un perro.
   ```

   

   **Puntos clave a recordar**

   - **Solo uno:** Una clase en PHP solo puede tener **un** constructor (no hay sobrecarga de constructores como en Java o C#).
   - **Retorno:** El constructor **no devuelve nada** (ni siquiera `void`). Su trabajo es inicializar, no retornar datos.
   - **Tipado:** Puedes (y debes) tipar los argumentos del constructor para que tu código sea más robusto (ej: `string $nombre`, `int $edad`).

   **¿Por qué es vital en Symfony?**

   En Symfony, el constructor se usa casi exclusivamente para la **Inyección de Dependencias**. Es donde le pides a Symfony que te "pase" las herramientas que necesitas (como el `EntityManager` o servicios de envío de correos).

   ```php
   public function __construct(
       private EntityManagerInterface $entityManager // Symfony te lo da listo para usar
   ) {}
   ```

   ¿Entiendes ahora por qué a veces ves argumentos en el constructor que tú nunca llegas a pasarle manualmente con el `new`? Es porque el Framework lo hace por ti.



2. 



## Modificadores de visibilidad:

Definen el alcance de propiedades, métodos y constantes dentro de la programación orientada a objetos. Controlan desde dónde se puede acceder a los miembros de una clase, mejorando la encapsulación y seguridad del código. 

- **[`public`](https://www.google.com/search?q=public&biw=678&bih=573&sca_esv=3902f2b246b46b37&sxsrf=ANbL-n53awnhK3O0UmdM_D2cixyn9OKeBA%3A1774476805150&ei=BV7EaZvzCJeGxc8PpfOhoQI&ved=2ahUKEwjxopTDi7yTAxXuAtsEHWiDA_wQgK4QegQIAhAB&uact=5&oq=Modificadores+de+visibilidad+php&gs_lp=Egxnd3Mtd2l6LXNlcnAiIE1vZGlmaWNhZG9yZXMgZGUgdmlzaWJpbGlkYWQgcGhwMgUQIRigAUjyI1C0BliNIHABeAGQAQCYAX6gAc8DqgEDNC4xuAEDyAEA-AEC-AEBmAIGoALyA8ICChAAGLADGNYEGEfCAgUQABiABMICBhAAGBYYHsICBRAAGO8FmAMAiAYBkAYIkgcDNC4yoAeiDLIHAzMuMrgH6QPCBwUwLjMuM8gHFIAIAA&sclient=gws-wiz-serp&mstk=AUtExfBVxqSvDZ6XzbPQohPabV1v4NC62vxZTapzSkp96e28O45gQbkLKFA5NLh9oKQ_aTWThiAC1vaMKv_XcYweoG6L5L8SJzGPtyeuEaGP5Er2R_YVHRN8ZBKABRXqXrVEaTmvNQ8QDDxnkuCPvbzpzYEw0co_BDFrQo3wD8dg3QIuFlrmftR_NkEcoLMyjPoNtTm0dJUFFvL5vhsXqILDBDDdKwU_7ZuCiNel3ueFYbFW94iKIPgW7qhzZxkdpTVSuHvkktWzU2SCKfG1kRBWys_EM4P2xi08hpSw7E-lkXkmSg&csui=3) (Público):** Los miembros son accesibles desde cualquier lugar, ya sea dentro o fuera de la clase. Es la visibilidad predeterminada si no se especifica otra.
- **[`protected`](https://www.google.com/search?q=protected&biw=678&bih=573&sca_esv=3902f2b246b46b37&sxsrf=ANbL-n53awnhK3O0UmdM_D2cixyn9OKeBA%3A1774476805150&ei=BV7EaZvzCJeGxc8PpfOhoQI&ved=2ahUKEwjxopTDi7yTAxXuAtsEHWiDA_wQgK4QegQIAhAD&uact=5&oq=Modificadores+de+visibilidad+php&gs_lp=Egxnd3Mtd2l6LXNlcnAiIE1vZGlmaWNhZG9yZXMgZGUgdmlzaWJpbGlkYWQgcGhwMgUQIRigAUjyI1C0BliNIHABeAGQAQCYAX6gAc8DqgEDNC4xuAEDyAEA-AEC-AEBmAIGoALyA8ICChAAGLADGNYEGEfCAgUQABiABMICBhAAGBYYHsICBRAAGO8FmAMAiAYBkAYIkgcDNC4yoAeiDLIHAzMuMrgH6QPCBwUwLjMuM8gHFIAIAA&sclient=gws-wiz-serp&mstk=AUtExfBVxqSvDZ6XzbPQohPabV1v4NC62vxZTapzSkp96e28O45gQbkLKFA5NLh9oKQ_aTWThiAC1vaMKv_XcYweoG6L5L8SJzGPtyeuEaGP5Er2R_YVHRN8ZBKABRXqXrVEaTmvNQ8QDDxnkuCPvbzpzYEw0co_BDFrQo3wD8dg3QIuFlrmftR_NkEcoLMyjPoNtTm0dJUFFvL5vhsXqILDBDDdKwU_7ZuCiNel3ueFYbFW94iKIPgW7qhzZxkdpTVSuHvkktWzU2SCKfG1kRBWys_EM4P2xi08hpSw7E-lkXkmSg&csui=3) (Protegido):** El acceso está limitado a la propia clase que define el miembro y a las clases que heredan de ella (subclases).
- **[`private`](https://www.google.com/search?q=private&biw=678&bih=573&sca_esv=3902f2b246b46b37&sxsrf=ANbL-n53awnhK3O0UmdM_D2cixyn9OKeBA%3A1774476805150&ei=BV7EaZvzCJeGxc8PpfOhoQI&ved=2ahUKEwjxopTDi7yTAxXuAtsEHWiDA_wQgK4QegQIAhAF&uact=5&oq=Modificadores+de+visibilidad+php&gs_lp=Egxnd3Mtd2l6LXNlcnAiIE1vZGlmaWNhZG9yZXMgZGUgdmlzaWJpbGlkYWQgcGhwMgUQIRigAUjyI1C0BliNIHABeAGQAQCYAX6gAc8DqgEDNC4xuAEDyAEA-AEC-AEBmAIGoALyA8ICChAAGLADGNYEGEfCAgUQABiABMICBhAAGBYYHsICBRAAGO8FmAMAiAYBkAYIkgcDNC4yoAeiDLIHAzMuMrgH6QPCBwUwLjMuM8gHFIAIAA&sclient=gws-wiz-serp&mstk=AUtExfBVxqSvDZ6XzbPQohPabV1v4NC62vxZTapzSkp96e28O45gQbkLKFA5NLh9oKQ_aTWThiAC1vaMKv_XcYweoG6L5L8SJzGPtyeuEaGP5Er2R_YVHRN8ZBKABRXqXrVEaTmvNQ8QDDxnkuCPvbzpzYEw0co_BDFrQo3wD8dg3QIuFlrmftR_NkEcoLMyjPoNtTm0dJUFFvL5vhsXqILDBDDdKwU_7ZuCiNel3ueFYbFW94iKIPgW7qhzZxkdpTVSuHvkktWzU2SCKfG1kRBWys_EM4P2xi08hpSw7E-lkXkmSg&csui=3) (Privado):** El miembro es accesible **solo** dentro de la clase que lo definió, impidiendo el acceso incluso a las clases heredadas.

**Puntos Clave:**

- **Encapsulación:** Utilizar `private` o `protected` protege el estado interno de un objeto, evitando modificaciones externas no deseadas.

- **Herencia:** `protected` es ideal para métodos o propiedades que deben estar disponibles para clases hijas pero no para el público general.

- **Visibilidad por defecto:** Si no se usa modificador, la propiedad o método será `public`.

- **Promoción de constructor (PHP 8+):** Los modificadores pueden aplicarse directamente en el constructor para declarar y asignar propiedades. 



### Crear Funciones:

**function y fn** son dos forma de declarar funciones, pero con propósitos y comportamientos distintos.

- **function:** función tradicional

  ```php
  $multiply = function($x, $y) {
      return $x * $y;
  };
  
  echo $multiply(3, 4); // 12
  ```

  - Sintaxis completa con `return`explícito.
  - Puede tener múltiples sentencias.
  - No captura variables del ámbito externo automáticamente (necesita **use**).
  - Puede ser nombrada o anónima.

  ```php
  $factor = 10;
  
  $multiply = function($x) use ($factor) { // necesita 'use'
      return $x * $factor;
  };
  ```

- **fn:** Arrow function

  ```php
  $multiply = fn($x, $y) => $x * $y;
  
  echo $multiply(3, 4); // 12
  ```

  - Sintaxis compacta, solo **una expresión** (el resultado se retorna implícitamente).
  - Captura automáticamente variables del ámbito externo (sin use).
  - No puede tener múltiples sentencias ni llaves {}.

  ```php
  $factor = 10;
  
  $multiply = fn($x) => $x * $factor; // captura $factor automáticamente
  ```

Cuando usa cada uno:

- Usa `fn`para callbacks simples y transformaciones cortas (ideal con `array_map`, `array_filter`, etc)

  ```php
  $doubles = array_map(fn($n) => $n * 2, [1, 2, 3]);
  ```

- Usa `function` para lógica compleja, múltiples líneas o control explícito del scope.

  ```php
  $process = function($data) {
        $result = [];
        foreach ($data as $item) {
            $result[] = strtoupper($item);
        }
        return $result;
    };
  ```

***Scope:** (ámbito de variables): es la región del código donde una variable existe y es accesible.

En PHP hay 3 tipos principales:

- **Scope global:** variables declaradas fuera de cualquier función.

  ```php
  $nombre = "Ana"; // variable global
  
  function saludar() {
      echo $nombre; // ❌ ERROR: no existe aquí
  }
  ```

  Las funciones no ven el scope global automáticamente, para acceder necesitas `global`o `$GLOBALS`.

  ```php
  $nombre = "Ana";
  
  function saludar() {
      global $nombre;   // traes la variable al scope local
      echo $nombre;     // ✅ "Ana"
  }
  ```

- **scope local:** variables que viven dentro de una función. Mueren al terminar.

  ```php
  function calcular() {
      $resultado = 42; // solo existe aquí
  }
  
  echo $resultado; // ❌ ERROR: no existe fuera
  ```

- **scope estático:** Una variable local que no muere entre llamadas.

  ```php
  function contador() {
      static $count = 0;
      $count++;
      echo $count;
  }
  
  contador(); // 1
  contador(); // 2
  contador(); // 3
  ```

Como se relaciona con `function`y `fn`:

```php
$factor = 5;

// function: NO ve el scope externo
$fn1 = function($x) {
    return $x * $factor; // ❌ $factor no existe aquí
};

// function con 'use': capturas manualmente
$fn2 = function($x) use ($factor) {
    return $x * $factor; // ✅
};

// fn (arrow): captura el scope externo automáticamente
$fn3 = fn($x) => $x * $factor; // ✅ sin necesidad de 'use'
```

En pocas palabras: el scope define quien puede ver qué variable según donde está declarada.





### Funciones más usadas:

#### Arrays:

```php
array_map()       // transforma cada elemento
array_filter()    // filtra por condición
array_reduce()    // reduce a un único valor
array_merge()     // une arrays
array_combine()   // claves + valores de dos arrays
array_flip()      // intercambia claves y valores
array_keys()      // devuelve las claves
array_values()    // devuelve los valores (reindexado)
array_unique()    // elimina duplicados
array_slice()     // extrae una porción
array_splice()    // elimina/inserta elementos
array_push()      // añade al final
array_pop()       // elimina el último
array_shift()     // elimina el primero
array_unshift()   // añade al principio
array_chunk()     // divide en grupos
array_column()    // extrae una columna
in_array()        // comprueba si existe un valor
array_key_exists()// comprueba si existe una clave
array_search()    // busca y devuelve la clave
sort() / rsort()  // ordena por valor
ksort() / krsort()// ordena por clave
usort()           // ordena con función propia
count()           // cuenta elementos
range()           // genera secuencia
```

#### Strings:

```php
strlen()          // longitud
str_contains()    // contiene substring (PHP 8+)
str_starts_with() // empieza por (PHP 8+)
str_ends_with()   // termina por (PHP 8+)
strpos()          // posición de substring
str_replace()     // reemplaza texto
substr()          // extrae porción
trim()            // elimina espacios extremos
ltrim() / rtrim() // solo izquierda / derecha
strtolower()      // a minúsculas
strtoupper()      // a mayúsculas
ucfirst()         // primera letra mayúscula
ucwords()         // primera letra de cada palabra
explode()         // string → array
implode()         // array → string
sprintf()         // formatea string
nl2br()           // saltos de línea → <br>
strip_tags()      // elimina HTML
htmlspecialchars()// escapa HTML
str_pad()         // rellena hasta longitud
str_repeat()      // repite string
str_word_count()  // cuenta palabras
chunk_split()     // divide en trozos
wordwrap()        // ajusta longitud de línea
number_format()   // formatea número como string
preg_match()      // busca con regex
preg_replace()    // reemplaza con regex
preg_split()      // divide con regex
```



#### Números:

```php
abs()             // valor absoluto
round()           // redondea
ceil()            // redondea arriba
floor()           // redondea abajo
max() / min()     // mayor / menor
rand()            // número aleatorio
mt_rand()         // aleatorio más rápido
intval()          // convierte a entero
floatval()        // convierte a float
fmod()            // módulo de floats
intdiv()          // división entera
pow()             // potencia
sqrt()            // raíz cuadrada
log()             // logaritmo
```

#### Fechas

```php
date()            // formatea fecha actual
time()            // timestamp actual
mktime()          // timestamp de una fecha
strtotime()       // string → timestamp
date_create()     // crea DateTime
date_format()     // formatea DateTime
date_diff()       // diferencia entre fechas
checkdate()       // valida una fecha
microtime()       // timestamp con microsegundos
```

#### Tipos y variables

```php
isset()           // existe y no es null
empty()           // vacío o falsy
is_null()         // es null
is_array()        // es array
is_string()       // es string
is_int()          // es entero
is_float()        // es float
is_bool()         // es booleano
is_numeric()      // es numérico
is_callable()     // es invocable
gettype()         // tipo como string
settype()         // cambia el tipo
var_dump()        // muestra tipo y valor
print_r()         // muestra estructura legible
serialize()       // convierte a string almacenable
unserialize()     // restaura desde string
json_encode()     // array/objeto → JSON
json_decode()     // JSON → array/objeto
```





## Funciones y Métodos

Una **función** es un bloque de código independiente, definido fuera de cualquier clase

```php
function saludar(string $nombre): string {
    return "Hola, $nombre";
}

// Se llama directamente
saludar("Ana"); // "Hola, Ana"
```

**Método**: es una función dentro de una clase. Pertenece a un objeto a la clase misma.

```php
class Saludo {
    public function saludar(string $nombre): string {
        return "Hola, $nombre";
    }
}

// Necesitas una instancia para llamarlo
$obj = new Saludo();
$obj->saludar("Ana"); // "Hola, Ana"
```

**Diferencias clave**

|                  | Función            | Método                                  |
| ---------------- | ------------------ | --------------------------------------- |
| Dónde se define  | Fuera de una clase | Dentro de una clase                     |
| Cómo se llama    | `nombreFuncion()`  | `$objeto->metodo()` o `Clase::metodo()` |
| Acceso a `$this` | ❌ No               | ✅ Sí (métodos de instancia)             |
| Visibilidad      | Siempre pública    | `public`, `protected`, `private`        |
| Pertenece a      | Ningún objeto      | Una clase u objeto                      |

En Symfony casi todo son métodos, desaconseja funciones globales sueltas porque no son inyectables ni testeables.



## Funciones

### json_encode

Es una función nativa de PHP que se utiliza para convertir un valor (normalmente un array o un objeto) en una cadena de texto con formato JSON (JavaScript Object Notation).

Es la herramienta estándar para que PHP pueda "hablar" con otros lenguajes o tecnologías, como JavaScript, aplicaciones móviles o APIs.

```php
$data = ['nombre' => 'Ana', 'edad' => 30, 'activo' => true];

$json = json_encode($data);
// Resultado: '{"nombre":"Ana","edad":30,"activo":true}'
```

**Características principales**

1. **Compatibilidad de Tipos:**

   - Los **Arrays asociativos** de PHP se convierten en **Objetos** JSON `{}`.
   - Los **Arrays indexados** (numéricos) se convierten en **Arreglos** JSON `[]`.
   - Los strings, números, booleanos y `null` se convierten a sus equivalentes exactos en JSON.

2. **Banderas de Configuración (Constants):** `json_encode` acepta un segundo parámetro para modificar su comportamiento. Los más comunes son:

   - `JSON_PRETTY_PRINT`: Añade espacios y saltos de línea para que el JSON sea legible por humanos.
   - `JSON_UNESCAPED_UNICODE`: Evita que caracteres especiales (como la `ñ` o tildes) se conviertan en códigos como `\u00f1`.
   - `JSON_THROW_ON_ERROR`: Hace que PHP lance una excepción si la conversión falla.

   **UTF-8 obligatorio:** Para que `json_encode` funcione correctamente, todos los datos deben estar codificados en **UTF-8**. Si intentas convertir un texto en formato ISO-8859-1 que contenga caracteres especiales, la función devolverá `false` o un texto vacío.



## Métodos

Tipos de métodos:

- **De Instacia:** necesitan un objeto creado con new:

  ```php
  class Contador {
      private int $valor = 0;
  
      public function incrementar(): void {
          $this->valor++; // $this accede al objeto actual
      }
  }
  
  $c = new Contador();
  $c->incrementar();
  ```

- **Estáticos:** se llaman directamente en la clase sin instancia:

  ```php
  class Matematica {
      public static function sumar(int $a, int $b): int {
          return $a + $b;
      }
  }
  
  Matematica::sumar(3, 4); // 7 — sin hacer "new"
  ```

Una **función** vive suelta en el código. Un **método** vive dentro de una clase y puede acceder al estado del objeto mediante `$this`.



**Métodos en Symfony, los 5 contextos principales.**

**1. Controlador** — maneja una ruta HTTP

```php
#[Route('/usuario/{id}', name: 'usuario_show')]
public function show(int $id, UserRepository $repo): Response
{
    $usuario = $repo->find($id);
    return $this->render('usuario/show.html.twig', ['usuario' => $usuario]);
}
```

**2. Servicio** — lógica de negocio inyectable

```php
class FacturaService
{
    public function __construct(
        private readonly MailerInterface $mailer,
        private readonly EntityManagerInterface $em
    ) {}

    public function generarFactura(Pedido $pedido): Factura
    {
        // lógica de negocio
    }
}
```

**3. Repositorio** — consultas a base de datos

```php
class ProductoRepository extends ServiceEntityRepository
{
    public function findActivos(): array
    {
        return $this->createQueryBuilder('p')
            ->where('p.activo = true')
            ->getQuery()
            ->getResult();
    }
}
```

**4. Entidad Doctrine** — getters, setters y lógica del modelo

php

```php
#[ORM\Entity]
class Usuario
{
    #[ORM\Column]
    private string $email;

    public function getEmail(): string { return $this->email; }
    public function setEmail(string $email): static
    {
        $this->email = $email;
        return $this; // fluent interface
    }

    // método de dominio (no solo get/set)
    public function nombreCompleto(): string
    {
        return "$this->nombre $this->apellido";
    }
}
```

**5. EventListener / Subscriber** — responde a eventos del sistema

php

```php
class LoginListener
{
    #[AsEventListener(event: AuthenticationSuccessEvent::class)]
    public function onLogin(AuthenticationSuccessEvent $event): void
    {
        // se ejecuta automáticamente al hacer login
    }
}
```

**Por qué Symfony prefiere métodos sobre funciones**

```php
// ❌ Función suelta — no inyectable, no testeable fácilmente
function enviarEmail(string $to, string $body): void { ... }

// ✅ Método en servicio — inyectable por el contenedor de Symfony
class NotificacionService
{
    public function __construct(private MailerInterface $mailer) {}

    public function enviarEmail(string $to, string $body): void { ... }
}
```

El **contenedor de dependencias** de Symfony solo gestiona clases, por eso casi todo en Symfony es un método: puede ser inyectado, reemplazado, decorado y testeado de forma aislada.



#### __invoke

Es un método mágico de PHP que permite usar un objeto como si fuera una función. Cuando llamas a un objeto con (), PHP ejecuta automáticamente su método __invoke 

```php
class Saludo
{
    public function __invoke(string $nombre): string
    {
        return "Hola, $nombre";
    }
}

$saludo = new Saludo();
echo $saludo('Ana');  // "Hola, Ana"
```

Sirve para crear objetos que tienen **una única responsabilidad**, expresada como una acción invocable. Es la implantación del patrón **Single Action/Callable Object**

Usos prácticos:

```php
// Verificar si un objeto es invocable
is_callable($saludo);          // true
$saludo instanceof Closure;    // false — es un objeto, no un Closure

// Pasarlo como callback
array_map(new Multiplicar(3), [1, 2, 3, 4]);  // [3, 6, 9, 12]

class Multiplicar
{
    public function __construct(private int $factor) {}

    public function __invoke(int $n): int
    {
        return $n * $this->factor;
    }
}2, 4, 6, 8, 10]
```

**Ventaja sobre closures:** el objeto puede tener estado e inyección de dependencias.

```php
class FiltrarPorRol
{
    public function __construct(private string $rol) {}

    public function __invoke(User $user): bool
    {
        return $user->rol === $this->rol;
    }
}

$admins = array_filter($users, new FiltrarPorRol('admin'));
```

**En Symfony es muy común** para command handlers, voters, middleware, o cualquier servicio que actúa como callable:

```php
class CalcularPrecioHandler
{
    public function __construct(private Calculadora $calc) {}

    public function __invoke(CalcularPrecioCommand $command): float
    {
        return $this->calc->calcular($command->getProducto());
    }
}
```



**Closure:** es una función anónima que puede capturar variables del ámbito donde fue definida.

Función normal vs closure:

```php
// función normal — tiene nombre
function sumar(int $a, int $b): int {
    return $a + $b;
}

// closure — anónima, asignada a una variable
$sumar = function(int $a, int $b): int {
    return $a + $b;
};

$sumar(2, 3); // 5
```

La clave capturar variables con `use`:

```php
$descuento = 10;

$aplicarDescuento = function(float $precio) use ($descuento): float {
    return $precio - $descuento;
};

$aplicarDescuento(100); // 90
```

Sin `use`, el closure no ve `$descuento`. Esa captura del entorno exterior es lo que lo convierte en un *closure* (literalmente "cierre").

Por valor vs por referencia:

```php
$contador = 0;

$incrementar = function() use (&$contador) { // & = por referencia
    $contador++;
};

$incrementar();
$incrementar();
echo $contador; // 2 — si fuera por valor, seguiría siendo 0
```

**Arrow functions (PHP 7.4+):** sintaxis corta que captura automáticamente sin `use`:

```php
$factor = 3;

$multiplicar = fn($n) => $n * $factor; // captura $factor sola

$multiplicar(5); // 15
```

**Usos típicos:**

```php
// como callback
$mayores = array_filter($usuarios, fn($u) => $u->edad >= 18);

// como parámetro de función
usort($productos, fn($a, $b) => $a->precio <=> $b->precio);

// retornado por otra función (factory)
function multiplicadorDe(int $factor): Closure {
    return fn(int $n) => $n * $factor;
}

$doble  = multiplicadorDe(2);
$triple = multiplicadorDe(3);

$doble(5);  // 10
$triple(5); // 15
```



#### **toArray():**

Es un método de instancia, que se implementa en clases o frameworks. Convierte un objeto a un array asociativo.

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





## Clases

Las clases son plantillas para crear objetos que agrupan propiedades (variables) y métodos (funciones). Se definen con la palabra clave **class**, permiten organizar el código, encapsular lógica de negocios y fomentar la reutilización.

Ejemplo 1: Clase Básica con Constructor y Métodos

Este ejemplo muestra la estructura fundamental: propiedades, constructor para inicializar datos y un método para usar esos datos. 

```php
<?php
class Perro {
    // Propiedades
    public $nombre;
    public $raza;

    // Constructor: Se ejecuta al crear el objeto
    public function __construct($nombre, $raza) {
        $this->nombre = $nombre;
        $this->raza = $raza;
    }

    // Método
    public function ladrar() {
        return "{$this->nombre} dice: ¡Guau!";
    }
}

// Crear una instancia (objeto) de la clase
$miPerro = new Perro("Tom", "Labrador");
echo $miPerro->ladrar(); // Salida: Tom dice: ¡Guau!
?>
```

Ejemplo 2: Herencia en Clases PHP

La herencia permite que una clase "hija" utilice las propiedades y métodos de una clase "padre" usando `extends`. 

```php
<?php
// Clase Padre
class Vegetal {
    public $nombre;
    public $color;

    public function __construct($nombre, $color) {
        $this->nombre = $nombre;
        $this->color = $color;
    }

    public function comer() {
        return "Comiendo {$this->nombre} de color {$this->color}.";
    }
}

// Clase Hija que hereda de Vegetal
class Espinaca extends Vegetal {
    public function cocinar() {
        return "Cocinando espinaca - {$this->nombre} ahora está suave.";
    }
}

$miComida = new Espinaca("Espinaca", "verde");
echo $miComida->comer();    // Método heredado
echo $miComida->cocinar();  // Método propio de la clase hija
?>
```

Aunque no se puede tener más de una clase pública en un archivo, **sí se pueden tener varias clases no públicas (privadas del paquete)** . Esta configuración es menos común y se suele usar para clases muy relacionadas que se utilizan únicamente dentro del mismo paquete y no necesitan ser expuestas públicamente.

Ejemplo 3: Visibilidad (Encapsulamiento)

Uso de `private` y `public` para proteger los datos de la clase. 

```php
<?php
class Usuario {
    private $password;

    public function __construct($pass) {
        $this->password = $pass;
    }

    public function verificarPassword($pass) {
        return $this->password === $pass;
    }
}

$user = new Usuario("12345");
// echo $user->password; // Error: No se puede acceder a una propiedad privada
var_dump($user->verificarPassword("12345")); // bool(true)
?>
```



Componentes Clave:

- **`$this`**: Pseudo-variable que referencia al objeto actual.
- **`__construct()`**: Método mágico para inicializar el objeto al crearlo.
- **`public` / `private` / `protected`**: Modificadores de visibilidad



Las **clases** son los planos o moldes que definen cómo deben ser y cómo deben comportarse los objetos. Desde PHP 8, la programación orientada a objetos (POO) es el estándar absoluto, especialmente en frameworks como Symfony.

Conceptos fundamentales para entender y construir clases profesionales:

**1. Estructura básica de una clase**

Una clase se compone de **propiedades** (variables) y **métodos** (funciones).

```php
<?php
declare(strict_types=1);

namespace App\Model;

class Coche {
    // 1. Propiedades (Estado)
    public string $marca;
    private int $velocidad = 0;

    // 2. Constructor (Se ejecuta al crear el objeto)
    public function __construct(string $marca) {
        $this->marca = $marca;
    }

    // 3. Métodos (Comportamiento)
    public function acelerar(int $incremento): void {
        $this->velocidad += $incremento;
    }
}

// Instanciación (Crear el objeto)
$miCoche = new Coche("Toyota");
```

 

**2. Visibilidad (Encapsulamiento)**

Es crucial decidir quién puede ver o modificar los datos de tu clase:

- **`public`**: Acceso desde cualquier lugar.
- **`private`**: Solo la propia clase puede acceder. Es lo más recomendado para las propiedades (luego usas *getters* y *setters*).
- **`protected`**: La clase y sus "hijas" (herencia) pueden acceder.



**3. Constructor Promotion (PHP 8+)**

En Symfony verás esto constantemente. Es una forma ultra rápida de definir propiedades y asignarles valor en una sola línea dentro del constructor.

```php
// Forma moderna (limpia)
class Usuario {
    public function __construct(
        private string $email,
        private string $password,
        private bool $activo = true
    ) {}
}
```

**Herencia y abstracción**

Permiten reutilizar código y crear jerarquías.

- **`extends`**: Una clase hereda todo de otra.
- **`abstract class`**: Una clase que no se puede instanciar directamente; sirve como base para otras.
- **`interface`**: Un "contrato" que obliga a las clases a implementar ciertos métodos.



**Métodos y Propiedades estáticas (static)**

A veces necesitas algo que pertenezca a la clase en sí y no a un objeto específico. Por ejemplo, una utilidad matemática:

```php
class Calculadora {
    public static float $pi = 3.1416;

    public static function sumar(int $a, int $b): int {
        return $a + $b;
    }
}

// Se llama sin usar "new"
echo Calculadora::sumar(5, 10);
```



6. **Los "Magic Methods"** (Métodos mágicos)

   PHP tiene métodos especiales que se activan automáticamente ante ciertos eventos. Empiezan siempre por doble guion bajo __:

   **`__construct()`**: Al crear el objeto.

   **`__toString()`**: Qué pasa si intentas hacer un `echo` del objeto.

   **`__get()` / `__set()`**: Se activan al intentar acceder a propiedades que no existen o son privadas.

7. 



## Namespaces

Los namespaces (espacios de nombres)  organizan el código en contenedores lógicos, evitando conflictos de nombres de clases, interfaces, funciones o constantes, especialmente al usar librerías de terceros. 

Para evitar que dos clases se llamen igual (por ejemplo, si tú creas una clase `User` y una librería de Symfony también tiene una), usamos `namespace` al principio del archivo. Es como la "dirección postal" de la clase. 

Se declaran al inicio del archivo con:

```php
namespace App\Entity;

class User { ... }
```

Aspectos clave de los Namespaces en PHP:

- **Evitar colisiones:** permiten tener dos clases con el mismo nombre (ej: User), siempre que estén en namespaces diferentes (ej: Admin\User y Frontend\User)
- **Declaración:** la palabra clave *namespace* debe ir en la primera línea del archivo, tras la etiqueta <?php.
- **Sub-namespaces:** se pueden jerarquizar usando barras invertidas: *namespace Proyecto\Modulo\Submodulo*
- **Uso (importación):** Se utiliza la palabra clave *use* para importar clases de otros espacios de nombres y simplificar el código.
- **Nombres cualificados:**
  - No cualificado: User (clase actual)
  - Cualificado: Modulo\User (subdirectorio)
  - Completamente cualificado: \Proyecto\Modulo\User (ruta raiz).

**Ejemplo de código:**

```php
<?php
namespace MiProyecto\Modelos;

class Usuario {
    // ...
}

// En otro archivo:
require_once 'Usuario.php';
use MiProyecto\Modelos\Usuario;

$user = new Usuario();
```

- **Palabra clave `namespace`:** Permite referirse a elementos del namespace actual, similar a `self` en clases.

- **Constante `__NAMESPACE__`:** Devuelve una cadena con el nombre del espacio actual.

   

Los namespaces no distinguen entre mayúsculas y minúsculas, aunque se recomienda mantener la consistencia.



**Espacios de nombres y directorios**

Reglas Generales sobre las clases PHP:

1. Cada clase debe tener un espacio de nombres que coincida con tu estructura de directorios. Siempre será App\ y luego el directorio en el que estés.
2. El nombre de la clase debe de coincidir con el nombre de tu archivo .php. Si te equivocas en cualquiera de estas dos cosas, recibirás un error de PHP diciendo que no puede encontrar tu clase.



**Resumen para el desarrollador:**

| **Concepto** | **Para qué sirve**                                   |
| ------------ | ---------------------------------------------------- |
| **Clase**    | El molde (ej. Receta de tarta).                      |
| **Objeto**   | El resultado real (ej. La tarta que te comes).       |
| **$this**    | Se refiere al objeto actual dentro de la clase.      |
| **self::**   | Se refiere a la clase actual (para cosas estáticas). |



## Interfaces

Una interface en PHP es como un "contrato" o un plano que define **qué** debe hacer una clase, pero no **cómo** debe hacerlo.

Imagina que una interfaz es un enchufe de pared estándar: no importa si detrás hay energía solar, eólica o una batería; lo importante es que cualquier aparato que tenga los "pinchos" adecuados podrá conectarse y recibir energía.

**1. ¿Cómo se crean?**

Se utiliza la palabra clave `interface`. A diferencia de una clase, una interfaz **no puede contener lógica** (código dentro de los métodos) ni propiedades (variables), solo la firma de los métodos.

```php
interface Volador {
    // Solo definimos el nombre, parámetros y retorno
    public function despegar(): void;
    public function aterrizar(): string;
}
```

**2. ¿Cómo se utilizan?**

Para que una clase cumpla el contrato, se utiliza la palabra clave `implements`. La clase está **obligada** a escribir el código de todos los métodos definidos en la interfaz.

```php
class Avion implements Volador {
    public function despegar(): void {
        echo "Iniciando motores y carreteo...";
    }

    public function aterrizar(): string {
        return "Tren de aterrizaje desplegado.";
    }
}

class Pajaro implements Volador {
    public function despegar(): void {
        echo "Batiendo alas con fuerza...";
    }

    public function aterrizar(): string {
        return "Posado en la rama.";
    }
}
```

**3. ¿Para qué se utilizan? (El "Por qué" real)**

Las interfaces son la base de la **Inyección de Dependencias** y del desacoplamiento en frameworks como Symfony.

1. **Polimorfismo (Intercambiabilidad)**

   Puedes escribir código que acepte "cualquier cosa que sea un Volador", sin importarte si es un avión, un pájaro o un superhéroe.

   ```php
   function iniciarViaje(Volador $objeto) {
       $objeto->despegar(); // No sé qué es, pero sé que tiene este método.
   }
   
   iniciarViaje(new Avion());  // Funciona
   iniciarViaje(new Pajaro()); // Funciona
   ```

2. **Desacoplamiento (Capa de Abstracción)**

   Imagina que tienes un servicio para enviar mensajes. Si usas una interfaz `MailerInterface`, hoy puedes usar **Mailgun** y mañana cambiar a **Amazon SES** simplemente creando una nueva clase que implemente la misma interfaz. No tendrás que cambiar ni una línea de tu lógica de negocio.

3. **Múltiple "Herencia"**

   En PHP una clase solo puede heredar de **una** clase (extends), pero puede implementar **infinitas** interfaces. 

   ```php
   class Pato extends Animal implements Volador, Nadador { 
       // Obligado a implementar métodos de ambas interfaces
   }
   ```



**Resumen de reglas**

- **Métodos públicos:** Todos los métodos en una interfaz deben ser `public`.
- **Sin instancias:** No puedes hacer `new Volador()`.
- **Constantes:** Las interfaces pueden tener constantes (`public const VERSION = '1.0';`), pero no propiedades.
- **Contrato estricto:** Si olvidas implementar un método de la interfaz en tu clase, PHP lanzará un error fatal.

**Un truco en Symfony:**

En Symfony, verás que casi todos los componentes tienen su interfaz (ej. `UserInterface`). Esto permite que tú puedas crear tu propia clase de Usuario totalmente distinta a la de Doctrine, pero mientras implemente la interfaz, Symfony sabrá cómo autenticarte.



## Herencia

Es uno de los pilares de la Programación Orientada a Objetos (POO) en PHP. 

## Polimorfismo





## Composición



## Funcionalidades:

### This

**$this** es una pseudovariable que solo existe dentro de las clases. Su función es actuar como un "espejo": sirve para que un objeto se refiera a sí mismo.

Se utiliza para acceder a las propiedades (variables) y métodos (funciones) de la instancia actual de la clase (del objeto), Solo disponible dentro de métodos de instancia (no estáticos).

```php
class Persona {
    public $nombre;

    public function __construct($nombre) {
        // Usamos $this para decir: "asigna el valor a MI propiedad nombre"
        $this->nombre = $nombre;
    }

    public function saludar() {
        // Accedemos a la propiedad del objeto que llama al método
        echo "Hola, mi nombre es " . $this->nombre;
    }
}

$juan = new Persona("Juan");
$juan->saludar(); // Imprime: Hola, mi nombre es Juan
```

**Reglas de oro de `$this`**

- **Solo en objetos:** No puedes usar `$this` fuera de una clase o dentro de un método estático (`static`), porque los métodos estáticos pertenecen a la clase, no a un objeto específico.
- **Sin el signo `$` en la propiedad:** Cuando usas `$this`, la propiedad pierde su `$` individual.
  - Correcto: `$this->nombre`
  - Incorrecto: `$this->$nombre` (esto buscaría una propiedad con el nombre que guarde la variable `$nombre`).
- **Encadenamiento de métodos:** Se usa mucho para retornar el propio objeto y permitir llamadas seguidas.



**Diferencia entre `$this` y `self::`**

Esta es la confusión más común en PHP:

| **Término** | **Se refiere a...**                                          | **Sintaxis**       |
| ----------- | ------------------------------------------------------------ | ------------------ |
| **`$this`** | Al **objeto** (instancia actual). Se usa para cosas no estáticas. | `$this->propiedad` |
| **`self`**  | A la **clase** misma. Se usa para constantes o cosas estáticas. | `self::CONSTANTE`  |

**cuando usar Self o This en php**:

- **Self** hace referencia a la clase actual y se usando cuando instancia dicha clase, es decir se usan **métodos estáticos**.
- **This** hace referencia al objeto actual, es decir, cuando una clase si tiene instancia. No se puede hacer referencia a métodos estáticos usando **this pero si a métodos públicos, privados y protegidos.**

```php
class Saludos{  
     static function textoSaludo(string $nombre): string {    
         return 'HOLA ' . $nombre; 
     }  
    static function mostrarSaludo(string $nombre){    
        echo self::textoSaludo($nombre); 
    } 
} 
Saludos::mostrarSaludo('Gonzalo'); 


class Saludos{
     private function textoSaludo(string $nombre): string {
        return 'HOLA ' . $nombre;
     }

     public function mostrarSaludo(string $nombre){
        echo $this->textoSaludo($nombre);
     }
}

$saludos = new Saludos();
$saludos->mostrarSaludo('Gonzalo');
```

**Ejemplo en un Controlador (Symfony/Laravel)**

```php
class ProductoController extends AbstractController {
    public function detalle($id): Response {
        // Usamos $this para llamar a un método que heredamos de AbstractController
        return $this->render('producto/detalle.html.twig', [
            'id' => $id
        ]);
    }
}
```

**El error común: "Using $this when not in object context"**

Si ves este error, significa que:

1. Estás intentando usar `$this` en un archivo PHP normal (fuera de una clase).
2. Estás intentando usarlo dentro de una función declarada como `static`.



### self::

Hace referencia a la clase donde está definido el método, no a la clase instanciada. Útil para acceder a constantes, métodos estáticos y propiedades estáticas.

```php
class Base {
    public static function create(): static {
        return new self(); // siempre instancia Base, no la hija
    }

    public static function className(): string {
        return self::class; // devuelve 'Base'
    }
}

class Child extends Base {}

$obj = Child::create(); // devuelve Base, no Child ← cuidado
```

**Diferencia clave con `static::`** (late static binding):

```php
class Base {
    public static function create(): static {
        return new static(); // instancia la clase real llamada
    }
}

class Child extends Base {}

$obj = Child::create(); // devuelve Child ✓
```

|             | `self::`              | `static::`                   |
| ----------- | --------------------- | ---------------------------- |
| Resuelve en | Clase donde se define | Clase que llama (en runtime) |
| Herencia    | No respeta            | Respeta                      |
| Uso típico  | Constantes internas   | Factory methods, herencia    |



#### 

### **new self()**: 

Crea una nueva instancias de la misma clase desde dentro de la propia clase, es la forma de instanciar el objeto actual sin escribir su nombre explícitamente.

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



**`self` vs `static` vs `$this`**

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



### Operador Nullsafe `?->` (PHP 8.0+)

Permite encadenar llamadas a métodos/propiedades **sin explotar si algún valor es `null`**. Cortocircuita toda la cadena en cuanto encuentra `null`

```php
// Antes (PHP 7)
$city = null;
if ($user !== null) {
    $address = $user->getAddress();
    if ($address !== null) {
        $city = $address->getCity();
    }
}

// Con nullsafe (PHP 8+)
$city = $user?->getAddress()?->getCity(); // null si cualquier paso es null
```



```php
// También funciona con propiedades
$name = $order?->customer?->profile?->name;

// Y con arrays + métodos mezclados
$zip = $user?->getAddress()?->zip;
```

**Regla importante:** si un paso devuelve `null`, el resto de la cadena **no se evalúa** (no hay side effects).



**En Symfony — diferencias y usos habituales**

**`$this` en servicios y controladores**

```php
class ProductService {
    public function __construct(
        private readonly ProductRepository $repo,
        private readonly LoggerInterface $logger,
    ) {}

    public function find(int $id): ?Product {
        return $this->repo->find($id); // $this accede a dependencias inyectadas
    }
}
```

**`self::` en Value Objects y constantes de dominio**

php

```php
class Money {
    const CURRENCIES = ['EUR', 'USD', 'GBP'];

    public static function fromFloat(float $amount, string $currency): self {
        if (!in_array($currency, self::CURRENCIES)) {
            throw new \InvalidArgumentException("Invalid currency");
        }
        return new self($amount, $currency);
    }
}
```

**Nullsafe `?->` — muy común con entidades Doctrine**

```php
// Relaciones opcionales en entidades
$countryName = $user->getAddress()?->getCountry()?->getName();

// En controladores con seguridad
$email = $this->getUser()?->getEmail(); // getUser() puede ser null

// Con el voter / security
$roles = $this->security->getUser()?->getRoles() ?? [];
```

**Symfony HttpFoundation**

```php
// Session nullable en request
$token = $request->getSession()?->get('_csrf_token');
```



**Resumen rápido**

|            | Contexto  | Resuelve a                  |
| ---------- | --------- | --------------------------- |
| `$this`    | Instancia | Objeto actual               |
| `self::`   | Estático  | Clase donde se escribe      |
| `static::` | Estático  | Clase que ejecuta (runtime) |
| `?->`      | Instancia | Cortocircuita si `null`     |

En Symfony el nullsafe es especialmente valioso al trabajar con relaciones Doctrine opcionales, usuarios de seguridad anónimos y parámetros de request que pueden no existir.

## Diferencias entre include, require, include_once y require_once

**include()**

La sentencia include() incluye y evalúa el archivo especificado.

La siguiente documentación también se aplica a require().

Los archivos son incluidos con base en la ruta de acceso dada o, si ninguna es dada, el include_path especificado. Si el archivo no se encuentra en el include_path, include() finalmente verificará en el propio directorio del script que hace el llamado y en el directorio de trabajo actual, antes de fallar. El constructor include() emitirá una advertencia si no puede encontrar un archivo, éste es un comportamiento diferente al de require(), el cual emitirá un error fatal..

Si una ruta es definida — ya sea absoluta (comenzando con una letra de unidad o \ en Windows o / en sistemas Unix/Linux) o relativa al directorio actual (comenzando con . o ..) — el include_path será ignorado por completo. Por ejemplo, si un nombre de archivo comienza con ../, el interprete buscará en el directorio padre para encontrar el archivo solicitado.

Para más información sobe como PHP maneja la inclusión de archivos y la ruta de accesos para incluir, ver la documentación de include_path.

Cuando se incluye un archivo, el código que contiene hereda el ámbito de las variables de la línea en la cual ocurre la inclusión. Cualquier variable disponible en esa línea del archivo que hace el llamado, estará disponible en el archivo llamado, desde ese punto en adelante. Sin embargo, todas las funciones y clases definidas en el archivo incluido tienen el ámbito global.

**require()**

require() es idéntico a include() excepto que en caso de fallo, además producirá un error de nivel E_COMPILE_ERROR fatal. En otras palabras, parará el script mientras que include() sólo emitirá una advertencia (E_WARNING) lo cual permite continuar el script.

**require_once()**

La sentencia require_once() es idéntica a require() excepto que PHP verificará si el archivo ya ha sido incluido y si es así, no se incluye (require) de nuevo.

**include_once()**

La sentencia include_once() incluye y evalúa el fichero especificado durante la ejecución del script. Es un comportamiento similar al de la sentencia include(), siendo la única diferencia que si el código del fichero ya ha sido incluido, no se volverá a incluir. Como su nombre lo indica, será incluido sólo una vez.

include_once() puede ser usado en casos donde el mismo fichero podría ser incluido y evaluado más de una vez durante una ejecución particular de un script, así que en este caso, puede ayudar a evitar problemas como la redefinición de funciones, reasignación de valores de variables, etc.



## Herramientas de calidad

### **PHPStan** (PHP Static Analysis Tool) 

Analiza tu código sin ejecutarlo. Encuentra errores lógicos, fallos de tipado y posibles "puntos donde todo va a explotar" antes de que siquiera abras el navegador.

En Symfony y PHP moderno, es el estándar para asegurar que tu código es sólido.

1. **Instalación**

   Lo ideal es instalarlo como una dependencia de desarrollo utilizando Composer

   ```bash
   composer require --dev phpstan/phpstan
   ```

   Si usas symfony, se debería instalar también la extensión específica para que PHPStan entienda cómo funciona el contenedor de servicios y las entidades.

   ```bash
   composer require --dev phpstan/phpstan-symfony
   ```

   **2. Configuración (`phpstan.neon`)**

   PHPStan se configura mediante un archivo llamado `phpstan.neon` en la raíz de tu proyecto. Aquí defines qué carpetas analizar y qué tan estricto quieres ser.

   Crea el archivo `phpstan.neon`:

   YAML

   ```yaml
   parameters:
       level: 5 # Niveles del 0 al 9 (9 es el más estricto)
       paths:
           - src
           - tests
       symfony:
           container_xml_path: var/cache/dev/App_KernelDevDebugContainer.xml
   ```

   ------

   **3. Los Niveles de Análisis**

   PHPStan funciona por niveles. Puedes empezar en el 0 e ir subiendo conforme limpies tu código:

   - **Nivel 0:** Errores básicos (clases desconocidas, métodos que no existen).
   - **Nivel 5:** Verifica que los tipos de los argumentos pasados a las funciones coincidan.
   - **Nivel 9:** El "modo Dios". No permite `mixed` y te obliga a ser extremadamente preciso con cada variable.

   ------

   **4. Cómo ejecutarlo**

   Una vez instalado y configurado, simplemente corre este comando en tu terminal:

   ```bash
   vendor/bin/phpstan analyse
   ```

   Si quieres analizar una carpeta específica sin usar el archivo de configuración:

   ```
   vendor/bin/phpstan analyse src --level 7
   ```

   ------

   ### 5. ¿Qué tipo de errores encuentra?

   Imagina este código que parece "bien":

   ```php
   function obtenerLongitud(?string $texto) {
       return strlen($texto); 
   }
   ```

   **PHPStan te dirá:** *"Parameter #1 $string of function strlen expects string, string|null given."*

   Te está avisando de que si `$texto` es `null`, la función `strlen` fallará. Te obliga a arreglarlo antes de que ocurra el error en producción.

   ------

   **6. Uso con Symfony (Tips Pro)**

   Para que PHPStan no se queje de cosas "mágicas" de Symfony, asegúrate de:

   1. **Indicar los tipos en los parámetros:** Usa `(int $id)` en lugar de solo `($id)`.

   2. **Usar PHPDoc para colecciones:** Si tienes una relación de Doctrine, ayuda a PHPStan así:

      ```php
      /**
       * @var Collection<int, Product>
       */
      private $products;
      ```

   **Resumen de comandos útiles:**

   | **Comando**          | **Descripción**                                              |
   | -------------------- | ------------------------------------------------------------ |
   | `analyse`            | Ejecuta el análisis principal.                               |
   | `--memory-limit=1G`  | Úsalo si tu proyecto es muy grande y PHPStan se queda sin memoria. |
   | `clear-result-cache` | Limpia la caché si notas que los errores no se actualizan.   |



### PHPUnit

Se utiliza para realizar **pruebas unitarias** (unit testing) en PHP. Su objetivo es verificar que cada pequeña pieza de tu código (una función o un método) haga exactamente lo que se espera.

En el contexto de Symfony, PHPUnit viene integrado y es la herramienta recomendada para asegurar que tus cambios no rompan funcionalidades existentes (rregresiones). 

**1. Instalación**

Si usas Symfony con la estructura webapp, ya lo tienes, si no instálalo con composer:

```bash
composer require --dev phpunit/phpunit symfony/test-pack
```

**2. Estructura de una prueba**

Las pruebas se guardan en la carpeta **tests/**. Una clase de prueba debe:

1. Extender de `TestCase` (o `WebTestCase` en Symfony para pruebas de controladores).
2. Tener nombres de métodos que empiecen por `test`.

Ejemplo de una prueba unitaria (`tests/Unit/CalculatorTest.php`):

```php
namespace App\Tests\Unit;

use PHPUnit\Framework\TestCase;
use App\Service\Calculator;

class CalculatorTest extends TestCase
{
    public function testAddNumbers(): void
    {
        $calculator = new Calculator();
        $result = $calculator->add(2, 3);

        // "Aserción": Verificamos que el resultado sea 5
        $this->assertEquals(5, $result);
    }
}
```

**3. Las Aserciones (Assertions)**

Las aserciones son el corazón de PHPUnit. Son métodos que comprueban si una condición es verdadera. Las más comunes son:

| **Método**                                          | **Qué comprueba**                        |
| --------------------------------------------------- | ---------------------------------------- |
| `$this->assertEquals($a, $b)`                       | Si `$a` es igual a `$b`.                 |
| `$this->assertTrue($valor)`                         | Si el valor es `true`.                   |
| `$this->assertInstanceOf(Clase::class, $obj)`       | Si el objeto es de una clase específica. |
| `$this->assertCount(3, $array)`                     | Si el array tiene 3 elementos.           |
| `$this->assertStringContainsString('hola', $texto)` | Si el texto contiene una subcadena.      |

------

**4. Cómo ejecutar las pruebas**

Para correr todas tus pruebas, usa el binario que Symfony prepara:

```bash
php bin/phpunit
```

**Opciones útiles:**

- **Ejecutar un solo archivo:** `php bin/phpunit tests/Unit/CalculatorTest.php`
- **Ver solo los fallos:** `php bin/phpunit --stop-on-failure`
- **Filtrar por nombre de test:** `php bin/phpunit --filter testAddNumbers`

------

**5. El ciclo de vida de un Test**

A veces necesitas configurar algo antes de cada prueba (como instanciar un servicio) o limpiar algo después. Para eso usas:

- `setUp()`: Se ejecuta **antes** de cada método de prueba.
- `tearDown()`: Se ejecuta **después** de cada método de prueba.

```php
protected function setUp(): void {
    $this->calculator = new Calculator();
}
```

------

**6. Pruebas en Symfony (WebTestCase)**

Si quieres probar un controlador o una página real, Symfony extiende PHPUnit para que puedas simular un navegador:

```php
use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class PostControllerTest extends WebTestCase
{
    public function testIndexPageIsUp(): void
    {
        $client = static::createClient(); // Crea un "navegador" falso
        $client->request('GET', '/blog');

        $this->assertResponseIsSuccessful();
        $this->assertSelectorTextContains('h1', 'Bienvenido al Blog');
    }
}
```

**Un consejo de "arquitecto":**

Sigue la metodología **AAA**:

1. **Arrange (Organizar):** Preparas los datos y objetos necesarios.
2. **Act (Actuar):** Ejecutas el método que quieres probar.
3. **Assert (Afirmar):** Compruebas que el resultado es el esperado.



### Xdebug

Es una extensión para PHP que transforma la experiencia de desarrollo. A diferencia de usar `var_dump()`o `die()`, que es como intentar arreglar un motor con una linterna, Xdebug es como hacerle una tomografia computarizada a tu código mientras se ejecuta.

Funciona bajo el concepto de **depuración remota** (Remote Debugging). Pasos:

**1. El flujo de comunicación**

Xdebug no funciona solo; necesita un "cliente" (normalmente tu editor de código como VS Code o PHPStorm).

1. **Petición:** Navegas a tu web o ejecutas un script en la terminal.
2. **Contacto:** El servidor PHP (con Xdebug instalado) detecta la petición y mira si debe iniciar una sesión de depuración.
3. **Conexión:** Xdebug abre una conexión de red (usando el protocolo **DBGP**) hacia tu IDE en un puerto específico (por defecto el **9003**).
4. **Control:** Tu IDE toma el control. El código se detiene en la línea que tú decidas (**Breakpoint**).

------

**2. Las funciones estrella de Xdebug**

**A. Step Debugging (Depuración paso a paso)**

Es la función más importante. Te permite:

- **Puntos de interrupción (Breakpoints):** El código se pausa justo antes de ejecutar esa línea.
- **Step Over:** Salta a la siguiente línea.
- **Step Into:** Entra dentro de una función para ver qué hace.
- **Inspección de variables:** Puedes ver el valor de todas las variables locales y globales en ese instante preciso, ¡incluso modificarlas en caliente!

**B. Stack Traces mejorados**

Si PHP lanza un error, Xdebug reemplaza el mensaje feo por defecto por una tabla detallada que muestra exactamente qué funciones se llamaron antes del fallo, con parámetros y nombres de archivos.

**C. Profiling (Análisis de rendimiento)**

Xdebug puede grabar todo lo que hace PHP y guardarlo en un archivo. Luego, usando herramientas como **QCacheGrind**, puedes ver un mapa de calor: ¿qué función está haciendo que mi web tarde 2 segundos en cargar?

------

**3. Configuración básica (php.ini)**

Para que Xdebug funcione, debes habilitarlo en tu archivo de configuración de PHP. Una configuración estándar para desarrollo local sería:

Ini, TOML

```
[xdebug]
zend_extension=xdebug.so
xdebug.mode=debug
xdebug.start_with_request=yes
xdebug.client_port=9003
xdebug.client_host=127.0.0.1
```

- **`xdebug.mode=debug`**: Activa el depurador paso a paso.
- **`xdebug.start_with_request=yes`**: Intenta depurar cada vez que cargues la página (muy útil si no quieres usar extensiones en el navegador).

------

**4. Cómo se usa en el día a día**

1. **Pones un Breakpoint:** Haces clic al lado del número de línea en tu editor (aparece un punto rojo).
2. **Inicias el "Escucha":** En VS Code o PHPStorm, activas el modo "Listen for Xdebug".
3. **Cargas la web:** Al llegar a la línea roja, el navegador se quedará "pensando" y tu editor resaltará la línea.
4. **Analizas:** Miras el panel de variables, avanzas línea a línea y descubres por qué ese `if` no está entrando cuando debería.

------

**Un detalle importante: Xdebug 2 vs Xdebug 3**

Si buscas tutoriales antiguos, verás configuraciones muy distintas.

- **Xdebug 2:** Usaba el puerto **9000** y variables como `xdebug.remote_enable`.
- **Xdebug 3 (el actual):** Usa el puerto **9003** y es mucho más rápido. Se configura principalmente a través de `xdebug.mode`.

**Advertencia de rendimiento:** Nunca instales Xdebug en un servidor de **producción**. Ralentiza la ejecución de PHP significativamente (entre un 20% y un 50%) porque tiene que monitorizar cada paso que da el procesador.



## Extensiones de php en visual studio code:

**PHP Intelephense**: Proporciona autocompletado de código, navegación entre clases, información de la firma de métodos y funciones, un analizador sintáctico que revisa nuestro código, formateado, resaltado inteligente



## Comandos de php

**php -v**: saber versión de php instalada.

![image-20260405105900734](/home/soa/.config/Typora/typora-user-images/image-20260405105900734.png)