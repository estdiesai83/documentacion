# PHP

PHP no es lo que era: Usa versiones modernas, si estás aprendiendo o empezando un proyecto, **asegúrate de usar PHP 8.1 o superior**.

- **Tipado estricto:** Puedes (y debes) definir qué tipo de dato recibe y devuelve una función.
- **JIT (Just-In-Time):** Una mejora de rendimiento brutal que acerca a PHP a lenguajes compilados.
- **Atributos:** Reemplazan a las anotaciones en comentarios (muy usado en Symfony).

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

Son "contenedores" para almacenar información, a diferencia con otros lenguajes (como Java o C++), PHP es un lenguaje de tipado débil y dinámico, es decir no necesitas declarar qué tipo de dato guardará la variable, y este puede cambiar sobre la marcha

### 1. Reglas de Sintaxis (Imprescindibles)

- **El signo `$ `:** Todas las variables deben comenzar con el símbolo de dólar.
- **Nombres:** Deben empezar por una letra o un guion bajo (`_`), nunca por un número.
- **Sensibilidad:** Son *case-sensitive*. `$usuario` y `$Usuario` son dos variables distintas.
- **Asignación:** Se utiliza el operador `=` para darles valor.

PHP

```
$nombre = "Alex";    // Correcto
$_edad = 25;         // Correcto
$1puesto = "Oro";    // ERROR: empieza por número
```

------

### 2. Tipos de Datos

Aunque no los declares, PHP asigna uno internamente según el valor:

- **String (Cadena):** Texto entre comillas simples o dobles. `$ciudad = "Madrid";`
- **Integer (Entero):** Números sin decimales. `$puntos = 100;`
- **Float / Double:** Números con decimales. `$precio = 19.99;`
- **Boolean:** Valores lógicos. `$es_valido = true;`
- **Array:** Colecciones de datos (como vimos antes).
- **Null:** Cuando una variable no tiene valor. `$variable = null;`

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

PHP

```
$bebida = "cafe";
$$bebida = "con leche"; // Se crea la variable $cafe

echo $cafe; // Imprime: con leche
```

### Arrays

Un array es una estructura de datos mucho más versatil que en otros lenguajes, ya que puede comportarse como una lista, un diccionario o una tabla de mapas. Básicamente hay 3 tipos de arrays:

1. **Arrays Indexados (Numéricos):**

   Son los más comunes: cada elemento tiene un índice numérico automático que comienza siempre desde el 0.

   ```php
   $frutas = ["Manzana", "Pera", "Plátano"];
   
   // Acceso:
   echo $frutas[1]; // Resultado: Pera
   ```

   Uso ideal: listas de elementos donde el orden es importante pero no necesitas una etiqueta para cada valor.

2. **Arrays Asociativos:**

   En lugar de números, se utiliza **claves(keys)** personalizadas (strings) para identificar cada valor. Es lo más parecido a un objeto JSON o un diccionario.

   ```php
   $usuario = [
       "nombre" => "Juan",
       "email" => "juan@example.com",
       "edad" => 30
   ];
   
   // Acceso:
   echo $usuario["email"]; // Resultado: juan@example.com
   ```

   Uso ideal: Para representar registros de datos o perfiles donde cada dato tiene un nombre específico.

3. **Arrays multidimensionales:**

   Es un array que contiene otros arrays dentro de él. Puede tener tantos niveles de profundidad como necesites (aunque más de 3 niveles suele ser difícil de mantener)

   ```php
   $concesionario = [
       "Ford" => ["Focus", "Fiesta", "Mustang"],
       "Seat" => ["Ibiza", "Leon"]
   ];
   
   // Acceso:
   echo $concesionario["Ford"][2]; // Resultado: Mustang
   ```

   Uso ideal: para estructuras de datos complejas, como tablas de una base de datos o menús de navegación con subcategorías.

En PHP, internamente **todos los arrays son mapas ordenados**. Esto significa que puedes mezclar índices numéricos y claves de texto en el mismo array, aunque **no es recomendable** por salud mental y claridad del código:

```php
$mezcla = [0 => "Hola", "clave" => "Mundo"]; // Es válido, pero confuso.
```

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

   ------

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



## This

**$this** es una pseudovariable que solo existe dentro de las clases. Su función es actuar como un "espejo": sirve para que un objeto se refiera a sí mismo.

Se utiliza para acceder a las propiedades (variables) y métodos (funciones) de la instancia actual de la clase.

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

### 2. Reglas de oro de `$this`

- **Solo en objetos:** No puedes usar `$this` fuera de una clase o dentro de un método estático (`static`), porque los métodos estáticos pertenecen a la clase, no a un objeto específico.
- **Sin el signo `$` en la propiedad:** Cuando usas `$this`, la propiedad pierde su `$` individual.
  - Correcto: `$this->nombre`
  - Incorrecto: `$this->$nombre` (esto buscaría una propiedad con el nombre que guarde la variable `$nombre`).
- **Encadenamiento de métodos:** Se usa mucho para retornar el propio objeto y permitir llamadas seguidas.

------

### 3. Diferencia entre `$this` y `self::`

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

### 4. Ejemplo en un Controlador (Symfony/Laravel)

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

### El error común: "Using $this when not in object context"

Si ves este error, significa que:

1. Estás intentando usar `$this` en un archivo PHP normal (fuera de una clase).
2. Estás intentando usarlo dentro de una función declarada como `static`.



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


## Funciones

### json_encode

Es una función nativa de PHP que se utiliza para convertir un valor (normalmente un array o un objeto) en una cadena de texto con formato JSON (JavaScript Object Notation).

Es la herramienta estándar para que PHP pueda "hablar" con otros lenguajes o tecnologías, como JavaScript, aplicaciones móviles o APIs.

```php
// Un array en PHP
$datos = [
    "nombre" => "Gemini",
    "tipo" => "IA",
    "version" => 1.5
];

// Convertirlo a JSON
$json = json_encode($datos);

echo $json; 
// Resultado: {"nombre":"Gemini","tipo":"IA","version":1.5}
```

### Características principales

1. **Compatibilidad de Tipos:**

   - Los **Arrays asociativos** de PHP se convierten en **Objetos** JSON `{}`.
   - Los **Arrays indexados** (numéricos) se convierten en **Arreglos** JSON `[]`.
   - Los strings, números, booleanos y `null` se convierten a sus equivalentes exactos en JSON.

2. **Banderas de Configuración (Constants):** `json_encode` acepta un segundo parámetro para modificar su comportamiento. Los más comunes son:

   - `JSON_PRETTY_PRINT`: Añade espacios y saltos de línea para que el JSON sea legible por humanos.
   - `JSON_UNESCAPED_UNICODE`: Evita que caracteres especiales (como la `ñ` o tildes) se conviertan en códigos como `\u00f1`.
   - `JSON_THROW_ON_ERROR`: Hace que PHP lance una excepción si la conversión falla.

   **UTF-8 obligatorio:** Para que `json_encode` funcione correctamente, todos los datos deben estar codificados en **UTF-8**. Si intentas convertir un texto en formato ISO-8859-1 que contenga caracteres especiales, la función devolverá `false` o un texto vacío.

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