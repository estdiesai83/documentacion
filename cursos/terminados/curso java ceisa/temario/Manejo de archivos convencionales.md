# Manejo de archivos convencionales

## 1. Clase File

#### Que es un directorio en Java

![image-20250314093142905](/home/soa/.config/Typora/typora-user-images/image-20250314093142905.png)

En Java, los directorios se gestionan mediante la clase File, que proporciona los métodos para crear, listar y eliminar directorios. Un directorio puede contener tanto archivos como subdirectorios, lo que lo convierte en una estructura esencial para organizar datos.



La clase **File** en java trabaja con el paquete **java.io**, nos ayuda a trabajar con archivos y carpetas en nuestro ordenador. Nos permite hacer cosas como crear, buscar y eliminar archivos o carpetas.

Un objeto **File** es como una dirección que nos dice dónde está un archivo o carpeta, pero no guarda el contenido del archivo en sí, solo nos indica dónde encontrarlo.

#### Crear directorios en Java

Existen dos métodos principales para crear directorios en Java utilizando la clase **File:**

- **mkdir():** Crea un sólo directorio. Si la ruta especificada no existe o si ya existe un directorio con el mismo nombre, el método devuelve  false.
- **mkdirs():** Crea el directorio especificado y todos los directorios padres necesarios.

Ejemplo crear directorio

```java
// Crear la ruta a seguir para crear el directorio
String rutaDirectorio = "src/proyectos/java";

// Utilizamos la clase File de java.io
File directorio = new File(rutaDirectorio);

// Creamos el directorio si no existe
if(!directorio.exists()){// no existe ! equivale a == false
    boolean creado = directorio.mkdir();

    if (creado) {
        System.out.print("Directorio creado");
    } else {
        System.out.print("Error al crear Directorio");
    }
} else {
    System.out.print("El directorio ya existe");
}
```

#### Listar Archivos y Directorios (Iterar)

La clase File proporciona el método que permite obtener una lista de todos los archivos y subdirectorios dentro de un directorio. Este método devuelve un array de cadenas que representan los nombres de los archivos y directorios **File list().**

Ejemplo obtener la lista de los subdirectorios y archivos

```java
// Ruta del directorio a listar
File directorio = new File("src/proyectos");

// Verificamos Si el nombre dado existe y es un directorio
if(directorio.exists() && directorio.isDirectory()) {
    // Guarda el contenido en un array de String
    String[] contenido = directorio.list();

    if(contenido.length>0) {  
        System.out.println("Contenido del directorio:");
        //Mostramos
        for (String nombre: contenido) {
            System.out.print(nombre);
        }
    } else {
        System.out.println("El directorio esta vacio o no existe");
    }		
} else {
    System.out.println("El directorio no existe");
}
```

#### Eliminar un directorio con Contenido

Para eliminar un directorio que contiene archivos o subdirectorio, es necesario eliminar todo su contenido antes de intentar eliminar el propio directorio. Usamos un enfoque recursivo para hacerlo.

#### Eliminar Directorios

Eliminar un directorio es sencillo con el método, pero hay una limitación: este método sólo funciona si el directorio está vacio. Si contiene archivos o subdirectorios, primero deben eliminarse **.delete()**

Ejemplo el subdirectorio creado

```java

```

#### Crear Archivos en Java

En Java existen varias maneras de crear archivos. Las 3 más populares son:

- Usando el constructor **FileOutputStream**
- Usando el método **File.createNewFile**
- Usando el método **File.write.**

##### Crear Archivo usando el Constructor FileOutputStream

El constructor **FileOutputStream** permite crear un archivo y escribir datos en él, en formato de bytes.

Si el archivo no existe, lo crea automáticamente antes de abrirlo para escritura.

Es importante asegurarse de cerrar el flujo una vez que se ha escrito en el archivo, para evitar fugas de memoria.

Sintaxis:

- Con una cadena de texto (ruta del archivo)

  ```java
  OutputStream os = new FileOutputStream("ruta/del/archivo.txt");
  ```

- Con un objeto File:

  ```java
  File archivo = new File("ruta/del/archivo.txt");
  OutputStream os = new FileOutputStream(archivo);
  ```



##### Crear Archivo Usando el método File.createNewFile()

El método **createNewFile()** de la clase **File** permite crear si no existe en la ubicación especificada. Si el archivo ya existe, simplemente devuelve false.

```java
File archivo = new File("ruta/del/archivo.txt");
if(archivo.createNewFile()){
    System.out.print("Archivo creado exitosamente");
} else {
    System.out.println("El archivo ya existe");
}
```



##### Crear Archivo usando el método Files.write()

El método Files.write() es una alternativa moderna que permite crear un archivo y escribir en él en una sóla línea de código. Es flexible, soportando la escritura de cadenas de texto o listas de líneas.

```java
String contenido = "Este es el contenido del archivo";
Files.write(Path.get("ruta/del/archivo.txt"),contenido.getBytes());
```



### Leer Archivos

El objeto **FileReader** permite que las aplicaciones web lean ficheros (o información en buffer) almacenados en el cliente de forma asíncrona, usando los objetos File o Blob dependiendo de los datos que se pretenden leer.

- FileReader.read():

  Es una clase diseñada específicamente para leer archivos de texto carácter por carácter

  ```java
  FileReader reader = new FileReader("ruta/del/archivo.txt");
  ```

  Ejemplo:

  ```java
  package manejo_de_archivos;
  
  import java.io.FileReader;
  import java.io.IOException;
  
  public class LeerArchivo1 {
  
  	public static void main(String[] args) {
  		
  		try(FileReader reader = new FileReader("archivo_lineas.txt")){
  			int caracterLeido;
  			
  			while((caracterLeido = reader.read()) !=-1) {
  				System.out.print((char)caracterLeido);// convertimos entero a caracter
  			}
  		} catch(IOException e) {
  			System.err.println("Error al leer el archivo: "+e.getMessage());
  		}
  	}
  }
  ```

- **FileReader.readAllLines():**

  Es una forma moderna de leer todo el contenido de un archivo en una lista de cadenas. Cada línea del archivo

  ```java
  List<String> lineas = Files.readAllLines(Path.get)
  ```

  Ejemplo:

  ```java
  
  ```

  



- **filter(Predicate):** 

  Filtra los elementos que cumplen con un predicado

- **map(Function)**

  Transforma cada elemento aplicando una funcion

- **sorted():**

  Ordena los elementos del Stream

- **forEach(Consumer):**

  Aplica una acción a cada elemento del Stream

- **collect(Collectors):**

  Recopila los resultados del Stream en una colección o una estructura de datos.

- **reduce(BynaryOperator):** 

  Realiza una operación de reducción sobre los elementos del Stream, como sumar o multiplicar todos los valores.



Paginas de Documentación interesante:

https://somoshackersdelaprogramacion.es/la-clase-file-de-java 



## 2. Los flujos de datos (STREAM)

Los Streams son una forma de procesar y manipular colecciones de elementos de manera eficiente, elegante y en ocasiones paralela. Se pueden utilizar para realizar operaciones de filtrado, mapeo, ordenamiento y reducción entre otras.

La Entrada/Salida de Java se organiza generalmente mediante objetos llamados **Streams**.

Un Stream es la generalización de un fichero:

- secuencia ordenada de datos con su determinado origen y destino.
- su origen o destino puede ser un fichero, pero también un string o un dispositivo (p.e. el teclado)

Para poder usar un stream primero hay que **abrirle**

- se abre en el momento de su creación
- y hay que **cerrarle** cuando se deja de utilizar.



**Stream** es básicamente es una clase que nos permite usar operaciones funcionales sobre una colección de objetos. Pero no hay que confundirse un stream y una colección son muy diferentes, por ejemplo:

- Los streams no guardan ningún tipo de información, solo llevan datos de una fuente a través de varias operaciones.
- Una operación produce un resultado pero no modifica la fuente en sí.
- Las operaciones pueden ejecutarse de una manera “lazy”, por lo tanto se pueden optimizar en gran medida.
- No poseen un límite en la cantidad de elementos, por lo tanto puedo hacer operaciones sobre un stream infinito en tiempo finito.

Veamos un ejemplo para entender un poco mejor a los streams y como quedaría nuestro código.

 

```java
List<String> pokemons = Arrays.asList("Zacian", "Grookey", "Scorbunny", "Sobble", "Zamazenta");        
for (String pokemon : pokemons){
    if(pokemon == "Scorbunny"){             
        System.out.println(pokemon);
    }
}
```

Como vemos, realizar un filtrado en una colección se ve bastante complejo de entender y tendríamos que razonar lo que hace el código para saber que está filtrando.

```java
List<String> pokemons = Arrays.asList("Zacian", "Grookey", "Scorbunny", "Sobble", "Zamazenta");      
pokemons.stream()
    .filter(pokemon -> pokemon == "Scorbunny")                
    .forEach(pokemonFiltrado -> System.out.println(pokemonFiltrado));
```

Con streams la cosa cambia, podemos ver claramente que filtra la colección fuente y obtenemos una nueva colección con los datos que deseamos.



Las clases relacionadas con streams se encuentran definidas en el paquete **java.io** (io es la abreviatura de Input/Output)

### Clasificación de los streams

Por el tipo de datos que "transportan":

- **binarios** (de bytes)
- **de caracteres** (de texto)

Por el sentido del flujo de datos:

- **de entrada**: los datos fluyen desde el dispositivo o dichero hacia el programa.
- **de salida**: los datos fluyen desde el programa al dispositivo.

Según su cercanía al dispositivo:

- **iniciadores**: son los que directamente vuelcan o recogen los datos del dispositivo.
- **filtros**: se sitúan entre un stream iniciador y el programa.

### Uso de los Streams

Normalmente se utilizan por parejas: 

- formadas por un stream iniciador y un filtro

![image-20250321120118821](/home/soa/.config/Typora/typora-user-images/image-20250321120118821.png)

### Objetos stream predefinidos

**System.out**: Salida estándar (consola)

- objeto de la clase **PrintStream** (subclase de OutputStream)
  - métodos print, println, printf, ...

**System.err:** Salida de error (consola)

- también es un objeto de la clase **PrintStream** 

**System.in:** Entrada estándar (teclado)

- Objeto de la clase **InputStream**

Deberían ser de las clases PrintWriter y BufferedReader 

- pero los streams de caracteres no existían en las primeras versiones de Java.
- siguen siendo streams binarios por compatibilidad con versiones antiguas.



### Ventajas del uso de streams

Los Streams ofrecen varias ventajas en comparación con el uso tradicional de bucles como, por ejemplo:

- Proporcionan una sintaxis más clara y concisa para realizar operaciones de colecciones de elementos.
- Son más eficientes en el uso de memoria y procesamiento, especialmente en colecciones grandes o cuando se trabajan con grandes cantidades de datos.
- Permiten el procesamiento en paralelo, lo que puede mejorar significativamente el rendimiento en sistemas con múltiples núcleos de procesamiento.

![image-20250320224958116](/home/soa/.config/Typora/typora-user-images/image-20250320224958116.png)

![image-20250320225019183](/home/soa/.config/Typora/typora-user-images/image-20250320225019183.png)

![image-20250320225036703](/home/soa/.config/Typora/typora-user-images/image-20250320225036703.png)

### Escritura de ficheros de texto:

Pareja de streams: PrintWriter (filtro) y FileWriter (iniciador)

![image-20250321122228259](/home/soa/.config/Typora/typora-user-images/image-20250321122228259.png)

**Esquema general de uso:**

```java
PrintWriter out = null;
try{
    // crea los streams y los conecta
    out = new PrintWriter(new FileWriter);
    
    // escribe en el fichero
    ...diferente en cada caso
} finally{
    if(out != null){
        out.close();
    }
}
```



### Operaciones con streams (Métodos útiles)

Los streams pueden hacer a nuestro código súper declarativo. Esto nos da la oportunidad de concentrarnos más en el “¿Que tengo que hacer?” y menos en el “¿Cómo tengo que hacerlo?”. Para eso, esta clase tiene varios métodos útiles que se dividen en dos categorías

1. **Operaciones intermedias** (métodos que se conectan para formar un proceso ) son operaciones que se aplican a un Stream y devuelven otro Stream modificado. Se pueden encadenar varias operaciones intermedias para construir un procesamiento complejo del Stream. Algunos ejemplos de operaciones intermedias son `filter()`, `map()`, `flatMap()`, `distinct()`, `sorted()`, `peek()`, entre otros.
2. **Operaciones terminales** (finalizan un proceso) son operaciones que se aplican al Stream y producen un resultado final o una acción final, como una colección o un valor primitivo, o la ejecución de una acción, respectivamente. Estas operaciones no pueden ser encadenadas y, cuando se ejecutan, cierran el Stream y terminan el procesamiento del mismo. Algunos ejemplos de operaciones terminales son `forEach()`, `reduce()`, `collect()`, `count()`, `anyMatch()`, `allMatch()`, `noneMatch()`, `findFirst()`, `findAny()`, entre otros.

Es importante tener en cuenta que siempre debe haber al menos una operación terminal para que el procesamiento se realice efectivamente.

- **allMatch():**

  boolean allMatch(Predicate<? super T> predicate)

  Es una operación terminal que nos devuelve `true` si todos los elementos de la secuencia coinciden con el predicado proporcionado (la condición), caso contrario nos devuelve `false`. En el caso de que la secuencia esté vacía, se devuelve `true` y el predicado no se evalúa.

  ```java
  import java.util.*;
  public class Main{    
      public static void main(String[] args) { 
          List<Integer> lista = Arrays.asList(3, 4, 6, 12, 20);       
          boolean respuesta = lista.stream()
              .allMatch(n -> n % 3 == 0);        
          System.out.println(respuesta); //false    
      }
  }
          
  import java.util.stream.Stream;
  public class Main {    
      public static void main(String[] args) {
          Stream<String> stream = Stream.of("Juan", "Pedro", "Gonzalo", "Emiliano");
          boolean respuesta = stream.allMatch(str -> str.length() > 2);     
          System.out.println(respuesta); //true    
      }
  }
  ```

- **anyMatch():**

  boolean anyMatch(Predicate<? super T> predicate)

  Es una operación terminal que nos devuelve `true` si algún elemento de la secuencia coincide con el predicado proporcionado (la condición); de lo contrario `false`. En el caso de que la secuencia esté vacía, se devuelve `false` y el predicado no se evalúa.

  ```java
  import java.util.stream.Stream;
  import java.util.*;
  public class Main {    
      public static void main(String[] args) {
          List<Integer> lista = Arrays.asList(3, 4, 6, 12, 20);
          boolean respuesta = lista.stream()
              .anyMatch(n -> (n * (n + 1)) / 4 == 5);
          System.out.println(respuesta); //true    
      }
  }
  ```

- **collect():** obtiene el resultado de todas las operaciones hechas al stream.

  <R, A> R collect(Collector<? super T, A, R> collector)

  Donde:

  - ‘T’ es el tipo de elemento en la secuencia.
  - ‘A’ es el tipo de acumulador intermedio utilizado para procesar los elementos de la secuencia.
  - ‘R’ es el tipo de resultado final deseado.

  Es una operación terminal que se utiliza para indicar el tipo de Collection en la que se devolverá el resultado final de todas las operaciones realizadas sobre el Stream.
  La clase Collectors tiene una gama muy amplia de métodos que permiten agrupar elementos de una forma muy variada simplificando el código como, por ejemplo: los métodos <code>toList()</code>, <code>toMap()</code>, y más. Les dejo la documentación de esta clase: [Collectors](https://docs.oracle.com/javase/8/docs/api/java/util/stream/Collectors.html)

  ```java
  import java.util.*;
  import java.util.stream.*;
  
  public class Main {    
      public static void main(String[] args) {
          Stream<String> stream = Stream.of("agua", "aeropuerto", "barco", "auto", "animal");        
          List<String> listaDePalabrasQueEmpiezanConA = stream
              .filter(s -> s.startsWith("a"))
              .collect(Collectors.toList());
          System.out.println(listaDePalabrasQueEmpiezanConA); // [agua, aeropuerto, auto, animal]    
      }
  } 
  ```

- **distinct():** nos devuelve un stream sin elementos repetidos.

  Stream<T> distinct()

  Es una operación intermedia que nos devuelve un nuevo Stream que contiene elementos distintos (únicos), para ello utiliza los métodos equals() y hashCode(). Es decir, elimina los elementos duplicados del Stream original y devuelve un nuevo Stream que contiene solo elementos únicos.

  ```java
  import java.util.*;
  public class Main {    
      public static void main(String[] args) {        
          List<Integer> lista = Arrays.asList(1, 1, 2, 3, 3, 4, 5, 5);        
          lista.stream().distinct().forEach(System.out::println);    		}
  }
  /*Salida:
  1
  2
  3
  4
  5*/ 
  ```

- **findFirst():**

  Optional<T> findFirst()

  Es una operación terminal que devuelve un Optional del primer elemento de esta secuencia, o un Optional vacío si la secuencia está vacía. Si no tiene un orden establecido, puede devolver cualquier elemento que cumpla con las operaciones intermedias.

  ```java
  import java.util.*;
  public class Main {    
      public static void main(String[] args) {
          List<Integer> lista = Arrays.asList(1, 3, 4, 7, 8, 11, 14, 17);        
          Optional<Integer> primerNumeroPar = lista.stream()
              .filter(n -> n % 2 == 0).findFirst();
          if (primerNumeroPar.isPresent()) {
              System.out.println("El primer número par en la lista es: " + primerNumeroPar.get());
          } else {
              System.out.println("No hay números pares en la lista.");    
          }
      }
  }
  ```

- **filter():** necesita un predicado y devuelve un stream con los elementos que coinciden con este.

  Stream<T> filter(Predicate<? super T> predicate)

  Es una operación intermedia que nos devuelve un Stream que contiene sólo los elementos que coinciden con el predicado dado (una condición).

  ```java
  import java.util.stream.*;
  import java.util.*;
  
  public class Main {    
      public static void main(String[] args) {
          List<Integer> lista = Arrays.asList(3, 4, 6, 12, 20, 100);         List<Integer> listaNrosDivisiblePor5 = lista.stream()
              .filter(num -> num % 5 == 0)
              .collect(Collectors.toList());        
          System.out.println(listaNrosDivisiblePor5); //[20, 100]    
      }
  }
  ```

- **flatMap():**

  <R> Stream<R> flatMap(Function<? super T, ? extends Stream<? extends R>> mapper))

  Es una operación intermedia que se utiliza para transformar y aplanar un Stream de objetos complejos convirtiéndolo en un Stream plano de objetos simples.

  ```java
  import java.util.stream.*;
  import java.util.*;
  
  public class Main {    
      public static void main(String[] args) {
          List<List<Integer>> lista = Arrays.asList(
              Arrays.asList(1, 2, 3),
              Arrays.asList(4, 5, 6),
              Arrays.asList(7, 8, 9)
          );
          List<Integer> listaAplanada = lista.stream()
              .flatMap(list -> list.stream())
              .collect(Collectors.toList());        
          System.out.println(lista); //[[1, 2, 3], [4, 5, 6], [7, 8, 9]]     
          System.out.println(listaAplanada); // [1, 2, 3, 4, 5, 6, 7, 8, 9]    } }   
  ```

- **forEach():** nos permite iterar sobre cada elemento del stream.

  void forEach(Consumer<? super T> action)

  Es una operación terminal utilizada para recorrer un Stream de elementos y realizar alguna operación en cada uno de ellos.

  El comportamiento de esta operación es explícitamente no determinista, no nos garantiza ningún orden específico en el que los elementos del Stream son procesados.

  ```java
  import java.util.*;
  
  public class Main {    
      public static void main(String[] args) {
          List<String> lista = Arrays.asList("Juan", "Pedro",  "Gonzalo", "Emiliano");       
          lista.stream().forEach(System.out::println);    
      }
  }
  /*Salida:
  Juan
  Pedro
  Gonzalo
  Emiliano*/  
  ```

- **forEachOrdered():**

  void forEachOrdered(Consumer<? super T> action)

  Al igual que el método forEach(), es una operación terminal utilizada para recorrer un Stream de elementos y realizar alguna operación en cada uno de ellos, pero forEachOrdered() nos asegura que los elementos son procesados en el orden en que aparecen. En otras palabras, ejecuta la acción para un elemento y recién cuando termina, continúa con el siguiente.

  ```java
  import java.util.*;
  
  public class Main {   
      public static void main(String[] args) {
          List<Integer> lista = Arrays.asList(10, 19, 20, 1, 2);     
          lista.stream().forEachOrdered(System.out::println);    
      }
  }
  /*Salida:
  10
  19
  20
  1
  2*/
  ```

- **iterate():**

  static <T> Stream<T> iterate(T seed, Predicate<T> hasNext, UnaryOperator<T> next)

  Este método acepta tres parámetros:

  1. seed : es el elemento inicial del Stream.
  2. hasNext : es un predicado (una condición) que se aplica a los elementos para determinar cuándo debe terminar la secuencia.
  3. next : es una función que se aplicará al elemento anterior para producir un nuevo elemento.

  Es una operación intermedia que nos permite generar un flujo (stream) de elementos a partir de un valor inicial y una función generadora.

  ```java
  import java.util.stream.Stream;
  public class Main {    
      public static void main(String[] args) {
          Stream<Integer> stream = Stream.iterate(1, i -> i <= 20, i -> i * 2);        
          stream.forEach(System.out::println);
      }
  }
  /*Salida
  1
  2
  4
  8
  16*/
  ```

- **peek():**

  Stream<T> peek(Consumer<? super T> action)

  Es una operación intermedia que nos permite realizar una acción o un efecto secundario en los elementos de un Stream, sin modificarlos. Es útil cuando necesitamos inspeccionar el contenido de un Stream durante el proceso de transformación o de filtrado, para verificar si el resultado es el esperado o para depurar el código.

  ```java
  import java.util.stream.*;
  import java.util.*;
  
  public class Main {    
      public static void main(String[] args) {
          List<String> lista = Arrays.asList("Juan", "Pedro", "María", "Sofía");        
          List<String> nombres = lista.stream()            
              .map(String::toUpperCase)            
              .peek(System.out::println) // Imprime cada nombre en mayúsculas            
              .collect(Collectors.toList());        
          System.out.println(nombres);    
      }
  }
  /*Salida:
  JUAN
  PEDRO
  MARÍA
  SOFÍA
  [JUAN, PEDRO, MARÍA, SOFÍA]*/
  ```

- **map:** recibe una función y nos permite proyectar los elementos del stream en otro formato.

- **sorted:** este método puede o no recibir un argumento, y ordenará el stream (si no le pasamos un comparator los ordenará en su orden natural).

- **Reduce**: es usado para reducir los elementos del stream a un solo valor, va a recibir por parámetro un operador binario.

  

## 3. Clase Scanner

La clase Scanner (paquete java.util) permite leer datos de diferentes orígenes de entrada, como la consola, archivos, redes, etc.

- permite la lectura del texto línea a línea 

- permite la lectura sencilla de números y palabras separadas por el separador especificado 
  - el separador por defecto es cualquier tipo de espacio en blanco (espacio, salto de línea, tabulador, etc.) 
  - puede utilizarse otro separador utilizando el método useDelimiter 
  
- permite reconocer patrones de texto conocidos como “expresiones regulares”

- **datos primitivos desde teclado**   (int, double, string y etc).

  ```java
  Scanner scanner = new Scanner(System.in);
  ```

- **datos de una cadena de texto**

  ```java
  String cadena = "";
  Scanner scanner = new Scanner(cadena);
  ```

- **datos desde un fichero**

  ```java
  File file = new File(nombre_archivo);
  Scanner scanner = new Scanner(file);
  ```

  Leer archivo linea a línea
  
  ```java
  while (scanner.hasNextLine()) {// Continúa leyendo hasta que no queden más líneas.
      String line = scanner.nextLine();// Obtiene la siguiente línea del archivo.
      System.out.println(line);// Muestra la línea en la consola.
  }
  ```
  
  

**Conceptos Clave**

- **Tokenización**: Dividir la entrada en tokens basados en delimitadores.

- **Flujos de Entrada**: Scanner puede leer desde archivos, flujos de entrada y cadenas.

- **Expresiones Regulares**: Permite patrones de análisis complejos.

  

Primero importar la clase Scanner: 

```java
import java.util.Scanner;
```

Declarar y crear un objeto Scanner:

Para crear un objeto Scanner, usaremos la nueva palabra clave seguida de una llamada al constructor de la clase Scanner. 

Necesitamos introducir un parámetro que indique de donde procede la fuente de datos. En este caso **System.in** para especificar la entrada de consola de teclado estándar, aunque podemos pasar un objeto de la clase File si queremos leer la entrada de un archivo.

Ejemplo:

```java
Scanner scanner = new Scanner(System.in);
```

Una vez creado el objeto podemos utilizar los métodos que necesitemos:

### Métodos más comunes:  

| **Método**            | **Explicación**                                              |
| --------------------- | ------------------------------------------------------------ |
| next()                | Lee una palabra (una secuencia de caracteres delimitada por espacios en blanco) desde la fuente de entrada y devuelve una cadena |
| boolean nextBoolean() | Lee valores lógicos boléanos introducidos por el usuario.    |
| byte nextByte()       | Lee valores byte introducidos por el usuario.                |
| double nextDouble()   | Lee valores double introducidos por el usuario.              |
| float nextFloat()     | Lee valores float introducidos por el usuario.               |
| int nextInt()         | Lee valores int introducidos por el usuario.                 |
| String nextLine()     | Lee valores String introducidos por el usuario.              |
| long nextLong()       | Lee valores long introducidos por el usuario.                |
| short nextShort()     | Lee valores short introducidos por el usuario.               |

Ejemplo: 

```java
// Programa Java para leer datos de varios tipos usando la clase Scanner

import java.util.Scanner;

public class ScannerDemo {

    public static void main(String[] args){
        // Declarar el objeto e inicializar con
        // el objeto de entrada estándar predefinido
        Scanner sc = new Scanner(System.in);

        // entrada de una cadena
        String name = sc.nextLine();

        // entrada de un carácter
        char gender = sc.next().charAt(0);

        // Entrada de datos numéricos byte, short y float
        int age = sc.nextInt();
        long mobileNo = sc.nextLong();
        double average = sc.nextDouble();

        // Imprima los valores para verificar si la entrada fue obtenida correctamente.
        System.out.println('Nombre: '+name);
        System.out.println('Género: '+gender);
        System.out.println('Edad: '+age);
        System.out.println('Teléfono: '+mobileNo);
        System.out.println('Promedio: '+average);
    }
}
```

Ejecución:

| Entrada   | Salida             |
| --------- | ------------------ |
| Alex      | Nombre: Alex       |
| masculino | Género: m          |
| 23        | Edad: 23           |
| 92578458  | Teléfono: 92578458 |
| 20        | Promedio: 20.0     |

**Leer tokens con next() “Dame el siguiente token”**

Un token es el conjunto de texto que encontramos hasta alcanzar un carácter delimitador que indica fin de un token.

El comportamiento por defecto de next() es analizar tokens donde el delimitador es un espacio en blanco, un tabulador, un salto de línea.

```java
import java.util.Scanner
fun main() {
    val miString = "uno   dos\ttres\ncuatro\t\ncinco"
    val sc = Scanner(miString)
    System.out.println("Token 1: " + sc.next())
    System.out.println("Token 2: " + sc.next())
    System.out.println("Token 3: " + sc.next())
    System.out.println("Token 4: " + sc.next())
    System.out.println("Token 5: " + sc.next())
}
```

SALIDA:

```java
Token 1: uno
Token 2: dos
Token 3: tres
Token 4: cuatro
Token 5: cinco
```

**Cambiar el caracter delimitador con useDelimiter()**

por defecto next() considera el final de un token cuando se encuentra con un espacio en blanco, tabulador o salto de línea. Podemos cambiar el delimitador. El delimitador se indica escribiendo una expresión regular que indica que caracteres queremos usar como delimitadores. Para casos simples, la expresión regular consiste simplemente en indicar el carácter deseado. En el ejemplo, queremos como delimitador una coma.

```java
import java.util.Scanner

fun main(){
        val miString = "Tengo que comprar:tomates,lechuga,pan y vino"
        val sc = Scanner(miString)
        sc.useDelimiter(",") //esto afecta a next(), no a nextLine()
        println("token 1: " + sc.next())
        println("token 2: " + sc.next())
        println("token 3: " + sc.next())
}
```

SALIDA

```java
token 1: Tengo que comprar:tomates
token 2: lechuga
token 3: pan y vino
```

Además de los métodos mencionados anteriormente, también posee otras funcionalidades útiles, como:

- **useDelimiter():** permite establecer un delimitador para separar los datos leídos. Por defecto, el delimitador es el espacio en blanco.
- **next():** permite leer el siguiente token de la fuente de entrada.
- **hasNext(pattern):** permite verificar si hay un siguiente token que coincida con el parámetro especificado.
- **findInLine():** permite buscar un patrón en la línea actual.
- **findWithinHorizon():** permite buscar un patrón en un horizonte de lectura especificado.

### 

### La familia de métodos next

El método next() devuelve un string. Hay variantes de métodos next() que convierten el String leido a un tipo primitivo: NextInt(), NextDouble() etc.

```java
import java.util.Scanner

fun main() {
    val miString = "1 2"
    var sc = Scanner(miString)
    //en una linea tengo dos enteros y los quiero sumar
    val a1 = sc.next().toInt() //leo "1" y lo convierto a int 1
    val b1 = sc.next().toInt() //leo "2" y lo convierto a int 2
    println(a1 + b1)

    //lo mismo con nextInt
    //como antes llegue al final del analisis de la linea, tengo que crear un nuevo scanner
    sc = Scanner(miString)
    val a2 = sc.nextInt() //leo "1" y lo convierto a int 1
    val b2 = sc.nextInt() //leo "2" y lo convierto a int 2
    println(a2 + b2)
}
```

Por lo tanto observamos que nexInt() es equivalente a next()+Integer.parseInt() Y similar para nextDouble(), NextBoolean(), etc.





¿qué ocurre si introducimos un tipo de datos no esperado? Pues que obtendremos un error, como por ejemplo:

```
Enter an integer: three Exception in thread “main” java.util.InputMismatchException
at java.util.Scanner.throwFor(Scanner.java:819)
at java.util.Scanner.next(Scanner.java:1431)
at java.util.Scanner.nextInt(Scanner.java:2040)
at java.util.Scanner.nextInt(Scanner.java:2000)
at ScannerApp.main(ScannerApp.java:11)
```

Aquí ***InputMismatchException*** es claro y no requiere mayor explicación. No hemos hecho las cosas bien y nuestro programa necesita ser depurado. En este tipo de situaciones debemos verificar si el valor que leemos corresponde al tipo de datos esperado por la clase Scanner. Para eso nos ayudaremos de la función **.hasNextXYZ**() en donde XYZ es el tipo de datos que nos interesa. Esta función devolverá verdadero (true) o falso (false) según corresponda.

Métodos para controlar los valores introducidos

| **Método**             | **Explicación**                                              |
| ---------------------- | ------------------------------------------------------------ |
| hasNextBoolean()       | Devuelve true si el siguiente valor es introducido es un booleano. |
| hasNextByte()          | Devuelve true si el siguiente valor es introducido es un valor byte. |
| hasNextDouble()        | Devuelve true si el siguiente valor es introducido es un valor double. |
| hasNextFloat()         | Devuelve true si el siguiente valor es introducido es un valor float. |
| hasNextInt()           | Devuelve true si el siguiente valor es introducido es un valor int. |
| hasNextLong()          | Devuelve true si el siguiente valor es introducido es un valor long. |
| boolean hasNextShort() | Returns true if the next value entered by the user is a valid short value. |



### Manejo de Errores y Validación de Entrada

Cuando solicitas datos al usuario, es posible que ingresen algo inesperado, como texto cuando se espera un número. Esto puede causar errores en tu programa. Para manejar estos casos, es útil utilizar estructuras de control como `try-catch` o realizar validaciones antes de procesar la entrada:

```java
System.out.print("Introduce un número entero: ");
while (!scanner.hasNextInt()) {
    System.out.println("Eso no es un número entero. Inténtalo de nuevo.");
    scanner.next(); // Descartar la entrada incorrecta
}
int numero = scanner.nextInt();
System.out.println("Has introducido: " + numero);
```



### Excepciones Posibles:

- **NoSuchElementException**: no quedan más palabras.
- **IllegalStateException**: el scanner está cerrado. 
- **InputMismatchException**: el dato leído no es del tipo esperado.

#### NoSuchElementException

Si llegamos al final del texto original y ordenamos una lectura adicional se genera una excepción en tiempo de ejecución NoSuchElementException , es decir no quedan más palabras.

En el ejemplo usamos next() pero es aplicable a nextLine() y la combinación de ambos

```java
import  java.util.Scanner
fun main() {
    val miString = "uno dos"
    val sc = Scanner(miString)
    println("token 1: " + sc.next())
    println("token 2: " + sc.next())
    println("token 2: " + sc.next()) //genera excepción  NoSuchElementException
}
```

[![scanner5](https://manuais.pages.iessanclemente.net/apuntes/2.programacion/kotlin/02_prog_orientada_objetos_basica/clasesjavaenkotlin/1052.scanner/scanner5.png)](https://manuais.pages.iessanclemente.net/apuntes/2.programacion/kotlin/02_prog_orientada_objetos_basica/clasesjavaenkotlin/1052.scanner/index.html#R-image-6843f94dd5a081c796fe582004bad5d6)

#### InputMismatchException

También hay que tener en cuenta que el texto que queremos leer y luego convertir a un tipo primitivo tiene que ser válido para dicho tipo primitivo.

```java
import java.util.*

fun main() {
    val miString = "x 2"
    val sc = Scanner(miString)
    val a = sc.nextInt() //InputMismatchException porque "x" no es un entero
}
```

Excepciones que pueden lanzar los métodos de Scanner:

- *NoSuchElementException*: 
- *IllegalStateException*: el scanner está cerrado
- *InputMismatchException*: el dato leído no es del tipo esperado





### Un efecto inesperado al combinar nextLine() con otros métodos next()

Ya hablamos previamente que hay que tener muy claro cómo funcionan ambos métodos para mezclarlos. Al usar el teclado hay que tener en cuenta “Los enter” que introduce el usuario que junto a el uso combinado de nextLine() con los otros métodos next produce efectos inesperados.

Ejemplo: el siguiente código tiene un comportamiento “normal”

```java
import java.util.Scanner

fun main() {
    val sc = Scanner(System.`in`)
    val edad: Int
    val nombre: String
    println("edad: ")
    edad = sc.nextInt()
    println("nombre: ")
    nombre = sc.next()
    println("edad:$edad nombre: $nombre")
}
```

SALIDA edad: 34 nombre: Telma edad:34 nombre: Telma

Si ahora sustituimos el next() por un nextLine() vemos que el programa no funciona bien, nos deja escribir nada en nombre y hace directamente el println. No dejes de ejecutar este código en consola o en el IDE para entender la observación.

```java
import  java.util.Scanner

fun main() {
   val sc = Scanner(System.`in`)
   val edad: Int
   val nombre: String
   println("edad: ")
   edad = sc.nextInt()
   println("nombre: ")
   nombre = sc.nextLine()
   println("edad:$edad nombre: $nombre")

}
```

edad: 34 nombre: edad:34 nombre:

¿Qué ocurre?

1. tecleo “34\n”. Digamos que ahora la variable sc tiene en su interior “34\n” y sobre esta cadena los métodos next() y nextLine irán extrayendo bloques de información.
2. nextInt() procesa la cadena anterior. Localiza token “34” ya que después del 4 hay un \n y lo considera carácter separador que le hace parar. Convierte “34” a entero y queda sin analizar la siguiente subcadena “\n”.
3. nextLine() busca cualquier cadena que acabe con \n y justamente en el paso anterior nos quedó “\n” qué es un String que acaba en \n como otro cualquiera. nextLine() devuelve al programa la cadena anterior pero sin el \n. De forma que nombre contiene un string vacío “”. Por eso al imprimir la variable nombre no vemos nada.

[![scanner7](https://manuais.pages.iessanclemente.net/apuntes/2.programacion/kotlin/02_prog_orientada_objetos_basica/clasesjavaenkotlin/1052.scanner/scanner7.png)](https://manuais.pages.iessanclemente.net/apuntes/2.programacion/kotlin/02_prog_orientada_objetos_basica/clasesjavaenkotlin/1052.scanner/index.html#R-image-441a2dda65f16b40d175123344a9c5e5)

En casos como el anterior, si necesito leer despues de un entero toda una lína, ¿cómo puedo usar nextLine() sin que se quede atascado con el \n del buffer?

Simplemente haciendo dos nextLine(): Con el primero simplemente limpio el buffer de “\n” y con el segundo leo la línea

```java
import java.util.Scanner

fun main() {
    val sc = Scanner(System.`in`)
    val edad: Int
    val nombre: String
    println("edad: ")
    edad = sc.nextInt()
    println("nombre: ")
    sc.nextLine() //limpio enter de buffer
    nombre = sc.nextLine()
    println("edad:$edad nombre: $nombre")
}
```

Ejecución, ahora OK

```java
edad: 
44
nombre:
Pilar Lopez Rodriguez
edad:44 nombre: Pilar Lopez Rodriguez
```

¿Por qué no usar siempre nextLine()? Es posible, pero en muchas situaciones es mucho más incómodo e innecesariamente complejo ya que hay extraer trozos de la línea con split() u otras funciones de extracción de texto y es un trabajo extra que me evito si uso los métodos next()

### Cerrando el Scanner

Es una buena práctica cerrar el `Scanner` después de que ya no lo necesites para liberar los recursos asociados y evitar fugas de memoria:

```java
scanner.close();
```



### Pros y Contras de Usar Scanner

| Característica        | Scanner                             | BufferedReader                   |
| --------------------- | ----------------------------------- | -------------------------------- |
| Facilidad de Uso      | Simple e intuitivo                  | Requiere más código base         |
| Rendimiento           | Más lento para archivos grandes     | Más rápido para archivos grandes |
| Funcionalidad         | Lectura basada en tokens            | Lectura basada en líneas         |
| Manejo de Excepciones | Simplificado con try-with-resources | Requiere manejo explícito        |

Clase BufferedReader (PENDIENTE VER DONDE PERTENECE)

Es una clase que proporciona una forma eficiente de leer caracteres, líneas y arreglos de caracteres desde una fuente de caracteres de subyacente, como un archivo o una conexión de red. 

Clase Console (PENDIENTE VER DINDE PERTENECE)

Esta clase proporciona una forma de interactuar con el usuario a través de la consola. La clase Console es una subclase de la clase Object y proporciona métodos para leer y escribir texto en la consola.



### Cuándo Usar Scanner

- Cuando la facilidad de implementación es una prioridad.
- Para archivos de texto de tamaño pequeño a mediano.
- Cuando se necesita un análisis basado en tokens.

### Cuándo Evitar Scanner

- Al manejar archivos muy grandes donde el rendimiento es crítico.
- Cuando la lectura línea por línea sin tokenización es suficiente.

- 

Documentación sacada de:

https://codersfree.com/posts/solicitando-datos-al-usuario-en-java-con-la-clase-scanner

https://ifgeekthen.nttdata.com/s/post/que-es-y-como-usar-la-clase-scanner-en-java-MCGCZBXHLT3VDXRLUQLJ4O2X4XKM?language=es

https://manuais.pages.iessanclemente.net/apuntes/2.programacion/kotlin/02_prog_orientada_objetos_basica/clasesjavaenkotlin/1052.scanner/index.html





## 4. Excepciones

Las excepciones son situaciones inesperadas que ocurren durante la ejecución de un programa. Estas situaciones interrumpen el flujo normal de las operaciones y, si no se manejan correctamente, pueden hacer que el programa termine de manera abrupta.

Manejar excepciones aparte de la depuración se utiliza para desarrollar aplicaciones robustas, confiables, limpias y seguras.

```java
try{

} catch(Excepcion e){

}
```

¿Por que ocurren?

Alguna de las ocasiones más comunes:

- **Entrada de datos inválida:**

  Un usuario proporciona un valor que no es aceptable para el programa.

- **Archivo no encontrado:**

  El programa intenta acceder a un archivo que no existe en la ubicación especificada.

- **Problemas de conectividad:**

  Se interrumpe una conexión de red o el sistema se queda sin memoria mientras se ejecuta el programa.

Ejemplo:

```java
try {			
    List<String> lineas = Files.readAllLines(Paths.get("archivo_lineas.txt"));

    for(String line: lineas) {
        System.out.println(line);
    }

}catch (IOException e) {
    System.err.println("Error al leer el archivo: "+e.getMessage());
}
```

### Importancia de las excepciones

- **Manejo de errores de manera estructurada:**

  Brindan una forma estructurada de manejar errores y situaciones excepcionales. Esto permite separar el código de manejo de errores del código funcional, lo que resulta en un código más limpio y fácil de entender.

- **Mejora la robustez y confiabilidad:**

  Al anticipar y manejar situaciones excepcionales de forma adecuada, podemos hacer nuestras aplicaciones que sean más resistentes y confiables. Esto es esencial para garantizar que el programa funcione de manera predecible y sin interrupciones.

- **Retroalimentación al usuario:**

  Podemos proporcionar mensajes de error significativos y detallados al usuario, lo que facilita la comprensión de lo que salió mal y como corregirlo. Esto mejora la experiencia del usuario y facilita la resolución de problemas.

- **Flexibilidad y adaptabilidad:**

  El manejo adecuado permite a los desarrolladores adaptar el comportamiento de la aplicación según las circunstancias. Esto significa que podemos cambiar la forma en que se manejan las excepciones en diferentes partes del programa para adaptarse a los requisitos específicos de cada sección.

### Tipos de excepciones:

Se dividen en tres categorías principales, cada una heredada de la clase base Throwable. Estas categorías son:

- **Checked exceptions:** Son excepciones que se debe declarar en la firma del método o capturar explícitamente en un bloque try-catch. Si una excepción comprobada no se maneja correctamente, el código no se compilará. Estas excepciones se heredan de la clase Exception.

  Clases más comunes:

  - **IOException**: Indica un error en una operación de entrada o salida (E/S).
  - **FileNotFoundException**: Se lanza cuando se intenta acceder a un archivo que no se encuentra en sistema.
  - **ParseException**: Ocurre al intentar analizar una cadena para convertirla en un formato específico.
  - **SQLException**: Representa una excepción específica de la base de datos que ocurre durante la interacción con una base de datos.

- **Unchecked exceptions:** Son excepciones que no están obligadas a ser manejadas explícitamente. Estas excepciones ocurren durante la ejecución del programa y no se requiere que sean declaradas en la firma del método o capturadas mediante un bloque try-catch. Se heredan de la clase RuntimeException.

  Clases más comunes:

  - **RuntimeException:** Clase base para excepciones no comprobadas.
  - **NullPointerException:** Ocurre cuando intentas acceder a un objeto que es null.
  - **ArrayIndexOutOfBoundsException:** Se lanza cuando intentas acceder a un índice fuera del rango válido de un arreglo. 
  - **ArithmeticException:** Indica un error aritmético, como la división por cero.

- **Errors:** Son problemas graves que generalmente están fuera del control del programado y no deben manejarse explícitamente. Estos errores indican problemas serios que deberían detener la ejecución del programa. Se heredan de la clase Error.

Además de estas, existen muchas otras excepciones específicas para situaciones particulares. Es importante conocerlas y entender cuándo y cómo manejarlas para escribir un código robusto y confiable.

**Ejemplo con clases de excepciones**

```java
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;

public class CheckedExample {
    public static void main(String[] args) {
        try {
            File file = new File("archivo.txt");
            FileReader fileReader = new FileReader(file);
        } catch (FileNotFoundException e) {
            System.out.println("El archivo no se encontró.");
        }
    }
}
```

El código intenta abrir un archivo llamado "archivo.txt" para lectura utilizando un FileReader. Si el archivo no se encuentra, se captura la excepción FileNotFoundException y se imprime un mensaje indicando que el archivo no se encontró.

Ejemplo de Unchecked Exceptions:

```java
public class UncheckedExample {
    public static void main(String[] args) {
        int[] arr = {1, 2, 3};
        System.out.println(arr[5]);  // Genera ArrayIndexOutOfBoundsException
    }
}
```

Este código intenta imprimir el valor en la posición 5 del array. Sin embargo, el array solo tiene índices 0, 1 y 2, por lo que intentar acceder al índice 5 generará una excepción ArrayIndexOutOfBoundsException debido a que está fuera del rango válido para este array.



### Manejo de excepciones

Se utilizan los bloques try, catch y finally.

El bloque try se utiliza para envolver el código que puede generar una excepción. Si se produce una excepción dentro del bloque try, se captura en uno o más bloques catch asociados.

```java
try {
    // Código que puede generar una excepción
    int resultado = 10 / 0; // Esto generará una excepción de división por cero (ArithmeticException)
} catch (ArithmeticException e) {
    // Captura de la excepción específica
    System.out.println("Ocurrió una excepción: " + e.getMessage());
}
```

El bloque finally se utiliza para ejecutar código que debe ejecutarse, independientemente de si se ha producido una excepción o no. Se usa para liberar recursos que deben cerrarse, como conexiones a bases de datos o archivos.

```java
try {
    // Código que puede generar una excepción
    // ...
} catch (Exception e) {
    // Captura de cualquier excepción
    System.out.println("Ocurrió una excepción: " + e.getMessage());
} finally {
    // Código que se ejecutará siempre, incluso si se produjo una excepción
    // Liberar recursos
}
```



### Excepciones múltiples

Podemos definir varios bloques **catch** para un solo bloque **try**. Es común que en un bloque try haya más de un método que pueda elevar excepciones o inclusive un mismo método puede generar más de un tipo de excepción.

```java
try{
    [instrucciones 1]
} catch([excepcion 1]) {
    [instrucciones 2]
} catch([excepcion 2]) {
	[instrucciones 3]
    ..
} catch([excepcion n]) {
	[instrucciones n]
}
```

Ejemplo:

```java
try {
    // Código que puede generar una excepción
    // ...
} catch (ArithmeticException e) {
    // Captura de excepción de división por cero
    System.out.println("Ocurrió una excepción de división por cero: " + e.getMessage());
} catch (Exception e) {
    // Captura de cualquier otra excepción
    System.out.println("Ocurrió una excepción: " + e.getMessage());
}
```



### Creación de excepciones personalizadas

Es útil cuando necesitas representar situaciones excepcionales específicas en tu aplicación que no están cubiertas por las excepciones predefinidas.

Esto te permite crear jerarquías de excepciones que reflejen de manera precisa y detallada las situaciones inusuales que pueden ocurrir en tu aplicación.

Ejemplo:

```java
public class MiExcepcionPersonalizada extends Exception {
    public MiExcepcionPersonalizada(String mensaje) {
        super(mensaje);
    }
}
```

Aquí se crea una clase llamada MiExcepcionPersonalizada que extiende de Exception. Además, se proporciona un constructor que acepta un mensaje como argumento y lo pasa al constructor de la clase base Exception usando super(mensaje).

```java
public class Ejemplo {
    public static void main(String[] args) {
        try {
            throw new MiExcepcionPersonalizada("Este es un mensaje de excepción personalizada.");
        } catch (MiExcepcionPersonalizada e) {
            System.out.println("Se ha producido una excepción personalizada: " + e.getMessage());
        }
    }
}
```



**throw** (Ver para que sirve)

Se utiliza para crear una excepción eventual desde un método o cualquier bloque de código. Es una parte esencial del mecanismo de gestión de excepciones de Java, que permite a los desarrolladores crear y gestionar condiciones de error de forma controlada.

Cuando se lanza una excepción, se interrumpe el flujo normal del programa y el control se transfiere al bloque try-catch más cercano que pueda manejar la excepción.

Sintaxis:

```java
throw new ExceptionType("Error message");
```

- ExceptionType:  El tipo de excepción que se lanzará (por ejemplo, ArithmeticException, NullPointerException).
- "Error message": Un mensaje de cadena que proporciona detalles sobre la excepción.

Ejemplo1: Lanzar una excepción comprobada

```java
public class ThrowExample {
    public static void main(String[] args) {
        try {
            checkAge(15);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    static void checkAge(int age) throws Exception {
        if (age < 18) {
            throw new Exception("Age must be 18 or older.");
        }
    }
}
```

En este ejemplo, el método `checkAge` lanza un `Exception` si la edad proporcionada es inferior a 18 años. El método `main` llama a `checkAge` dentro de un bloque `try` y captura la excepción, imprimiendo el mensaje de error.

### Ejemplo 2: Lanzar una excepción no comprobada

```javascript
public class ThrowExample {
    public static void main(String[] args) {
        try {
            divide(10, 0);
        } catch (ArithmeticException e) {
            System.out.println(e.getMessage());
        }
    }

    static void divide(int a, int b) {
        if (b == 0) {
            throw new ArithmeticException("Division by zero is not allowed.");
        }
        System.out.println(a / b);
    }
}
```

Aquí, el método `divide` lanza un `ArithmeticException` si el divisor es cero. El método `main` captura la excepción e imprime el mensaje de error.

### Ejemplo 3: Excepción personalizada

```javascript
class CustomException extends Exception {
    public CustomException(String message) {
        super(message);
    }
}

public class ThrowExample {
    public static void main(String[] args) {
        try {
            validate(0);
        } catch (CustomException e) {
            System.out.println(e.getMessage());
        }
    }

    static void validate(int number) throws CustomException {
        if (number <= 0) {
            throw new CustomException("Number must be greater than zero.");
        }
    }
}
```

Este ejemplo muestra cómo lanzar una excepción personalizada. El método `validate` lanza un `CustomException` si el número es menor o igual que cero, y el método `main` lo atrapa y lo maneja.





En partes criticas se puede crear una excepción

```java
public personaAdulta(String nombre, int edad) throws Exception
{
	this.nombre = nombre;
	if(edad < 18){
		throw new Exception("No es adulta la persona");
		this.edad = edad;
	}
}
```

