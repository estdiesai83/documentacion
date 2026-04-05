# DOCUMENTACIÓN JAVA (Esther) 

### JDK (Java Development Kit): 

software que provee herramientas de desarrollo para la creación de programas en Java. Puede instalarse en una computadora local o en una unidad de red.

https://www.oracle.com/java/technologies/downloads/

[Documentación de JDK 17 - Inicio (oracle.com)](https://docs.oracle.com/en/java/javase/17/index.html)

### Apache Netbeans: 

NetBeans es un entorno de desarrollo integrado libre, hecho principalmente para el lenguaje de programación Java. Existe además un número importante de módulos para extenderlo. NetBeans IDE es un producto libre y gratuito sin restricciones de uso

https://netbeans.apache.org/download/index.html



Instalar **ECLIPSE** Ubuntu:

```
wget https://mirror.kakao.com/eclipse/oomph/epp/2024-03/R/eclipse-inst-jre-linux64.tar.gz
```

```
tar -xzf eclipse-inst-jre-linux64.tar.gz
```

```
cd eclipse-installer
```

```
./eclipse-inst
```

https://greenwebpage.com/community/how-to-install-eclipse-ide-on-ubuntu-24-04/

## Programación orientada a objetos (POO)

Hoy en día el paradigma de orientación a objetos es el más utilizado para programar y lo podemos encontrar en la mayoría de los lenguajes de programación más utilizados: Java, PHP, C++, etc.

Los objetos tendrán unas determinadas propiedades y serán capaces de hacer ciertas cosas mediante los métodos (funciones) que se les hayan definido en plantillas denominadas clases.

Java es un lenguaje "fuértemente tipado", lo que significa que los tipos de datos de las variables y expresiones deben ser declarados y verificados en tiempo de compilación.

Las ventajas del tipado de variables en Java son:

- **Seguridad y prevención de errores:** El tipado fuerte reduce la posibilidad de errores al forzar la coincidencia precisa de tipos de datos, lo que evita operaciones inapropiadas.
- **Claridad y legibilidad del código:** Los tipos de datos declarados hacen que el código sea más comprensible y facilitan la colaboración entre programadores.
- **Rendimiento y optimización:** Al conocer los tipos de datos de antemano, Java puede realizar optimizaciones que mejoran la velocidad de ejecución.
- **Detección temprana de errores:** Los errores se detectan en tiempo de compilación, lo que permite corregirlos antes de que el programa se ejecute, reduciendo así los errores en tiempo de ejecución.
- **Facilita el mantenimiento y la refactorización:** Los tipos de datos explícitos hacen que sea más fácil realizar cambios en el código sin introducir errores inadvertidos.



## Tipos de datos

- **Datos primitivos:**

  Son tipos de datos básicos que representan valores simples y se almacenan directamente en la memoria.

  - **byte:** Representa un tipo de dato de 8bits con signo. Puede almacenar valores numéricos en el rango de -128 a 127, incluyendo ambos extremos. Es útil para ahorrar memoria cuando se necesita almacenar valores pequeños.
  - **short:** Este tipo de dato utiliza 16 bits con signo y puede almacenar valores numéricos en el rango de -32,768 a 32,767. Se utiliza cuando se necesita un rango más amplio que el proporcionado por los bytes, pero aún se desea ahorrar memoria en comparación con los tipos de dato más grandes.
  - **int**: Es un tipo de dato de 32 bits con signo utilizado para almacenar valores numéricos. Su rango va desde -2,147,483,648 (-2^31) hasta 2,147,483,647 (2^31 - 1). Es el tipo de dato más comúnmente utilizado para representar números enteros.
  - **long**: Este tipo de dato utiliza 64 bits con signo y puede almacenar valores numéricos en el rango de -9,223,372,036,854,775,808 (-2^63) a 9,223,372,036,854,775,807 (2^63 - 1). Se utiliza cuando se necesitan números enteros muy grandes.
  - **float**: Es un tipo de dato diseñado para almacenar números en coma flotante con precisión simple de 32 bits. Se utiliza cuando se requieren números decimales con un grado de precisión adecuado para muchas aplicaciones.
  - **double**: Este tipo de dato almacena números en coma flotante con doble precisión de 64 bits, lo que proporciona una mayor precisión que float. Se usa en aplicaciones que requieren una alta precisión en cálculos numéricos.
  - **boolean**: Sirve para definir tipos de datos booleanos que pueden tener solo dos valores: true o false. Aunque ocupa solo 1 bit de información, generalmente se almacena en un byte completo por razones de eficiencia.
  - **char**: Es un tipo de datos que representa un carácter Unicode sencillo de 16 bits. Se utiliza para almacenar caracteres individuales, como letras o símbolos en diferentes lenguajes y conjuntos de caracteres.

- **Datos de referencia:** 

  Los datos de referencia son tipos de datos más complejos que hacen referencia a objetos almacenados en memoria. Estos objetos pueden ser instancias de clases personalizadas o clases predefinidas en Java, como String.

  Los datos de referencia no almacenan directamente el valor, sino una referencia a la ubicación en memoria donde se encuentra el objeto.

  **Datos de referencia especiales**

  - **null:** representa la ausencia de un objeto
  - **void:** se utiliza en métodos que no devuelven ningún valor.



## Nomenclaturas Java

- **Clases**: Comienzan con una letra mayúscula y, si hay varias palabras, cada palabra inicia con mayúscula (ejemplo: **MiClase** ). 
- **Métodos y Variables:** Comienzan con una letra minúscula y, si hay varias palabras, las palabras siguientes empiezan con mayúscula (ejemplo: miMetodo , **miVariable** ).





## Variables

Java brinda a los programadores una serie de tipos de datos predefinidos que facilitan la declaración de variables y el almacenamiento eficiente de información.

Son contenedores que se utilizan para almacenar y manipular datos en un programa.

Una variable tiene un tipo de datos que define que tipo de valor puede contener y un nombre que se utiliza para hacer referencia a ella en el código.

### Tipos de Variables:

- **variables locales:**

  Se declaran en un método y solo son accesibles dentro de ese método.

- **variables de instancia:**

  Pertenencen a una instancia específica de una clase y se declaran dentro de la clase pero fuera de cualquier método.

- **variables de clase:**

  Son compartidas por todas las instancias de una clase y se declaran utilizando la palabra clave static. 

### Declaración de variables:

```java
tipo nombreDeVariable

int number
```

El ejemplo, declara una variable llamada number de tipo entero. Se puede asignar un valor a la variable utilizando el operador de asignación (=), como number=42;

### Convertir tipos de datos

El casting de variables en Java es una técnica que se utiliza para convertir una variable de un tipo de datos en otro tipo de datos compatible.

Por ejemplo cuando realizar operaciones aritméticas con tipos de datos diferentes.

Hay dos tipo de casting:

- **Casting implícito (Conversión automática):**

  El casting implícito se produce cuando Java convierte automáticamente un tipo de dato en otro sin requerir una intervención explícita del programador. Esto ocurre cuando se realiza una conversión de un tipo de datos más pequeño a uno más grande, evitando la pérdida de datos.

  ```java
  int numeroEntero = 5;
  double numeroDecimal = numeroEntero; // Conversión automática de int a double
  ```

  En este caso, el valor de numeroEntero se convierte automáticamente a numeroDecimal sin la necesidad de un casting explícito, ya que no se produce una pérdida de precisión.

-  **Casting Explícito (Conversión Manual)**

  El casting explícito se utiliza cuando deseas convertir un tipo de datos en otro tipo de datos que no es compatible automáticamente. Esto requiere que el programador indique explícitamente la conversión utilizando paréntesis y el tipo de datos al que se desea convertir.

  ```java
  double numeroDecimal = 3.14;
  int numeroEntero = (int) numeroDecimal; // Conversión explícita de double a int
  ```

  En este caso, estamos realizando una conversión explícita de numeroDecimal a numeroEntero. Sin embargo, es importante tener en cuenta que esta conversión implica una pérdida de precisión, ya que se descartan los decimales.

  Es importante tener cuidado al realizar casting explícito, ya que puede conducir a resultados inesperados o pérdida de datos. Siempre verifica si la conversión es segura antes de realizarla.

- **Casting en Operaciones Aritméticas**

  El casting también se puede aplicar en operaciones aritméticas cuando se trabaja con tipos de datos diferentes. En este caso, Java realizará automáticamente un casting implícito para que las operaciones se realicen sin errores.

  ```java
  int numeroEntero = 5;
  double resultado = numeroEntero / 2; // La división se realiza con casting implícito
  ```

  En este ejemplo, el resultado de la división se almacena en la variable resultado como un número decimal debido al casting implícito.

### Ejemplo prácticos con variables

**- Variables de Tipo Primitivo**

```java
// Declaración e inicialización de variables de tipo primitivo
int edad = 30;
double salario = 1500.50;
boolean esEstudiante = true;
char inicial = 'J';
// Realización de operaciones con variables de tipo primitivo
int suma = edad + 5;
double aumento = salario * 0.10;
```

En este ejemplo, se declaran variables de tipo primitivo (int, double, boolean y char) para representar la edad de una persona, el salario, si es estudiante o no, y la inicial de un nombre. Luego, se realizan operaciones matemáticas con algunas de estas variables.

**- Variables de Tipo String**

```java
// Declaración e inicialización de variables de tipo String
String nombre = "Juan";
String apellido = "Pérez";
// Concatenación de cadenas
String nombreCompleto = nombre + " " + apellido;
```

Aquí, se utilizan variables de tipo String para representar el nombre y el apellido de una persona, y luego se realiza la concatenación de estas cadenas para obtener el nombre completo.

**- Variables de Tipo Array**

Un array es una colección de elementos de datos del mismo tipo. Se puede acceder a sus elementos a través de índices. 

```cpp
// Declaración e inicialización de un array de enteros
int[] numbers = {1, 2, 3, 4, 5};

// Acceso a elementos del array
int firstNumber = numbers[0];
int secondNumber = numbers[1];
```

En este ejemplo, se declara un array de enteros (int) llamado numbers que almacena una serie de valores. Luego, se accede a elementos específicos del array.

**Características de los Arrays:**

- **Tamaño Fijo:** una vez creado su tamaño no puede ser cambiado. 
- **Tipos de datos homogéneos:** todos los elementos deben de ser del mismo tipo de datos, ya sea primitivo (int, char, double) o referencias de objetos.
- **Acceso indexado:** Cada elemento en un array es accesible a través de su índice, comenzando por 0 para el primer elemento. 

**Tipos de arrays:**

- **unidimensionales:** representan una línea recta de elementos. Cada elemento es accesible mediante un único índice.
- **multidimensionales**: son como tablas compuestas por filas y columnas. Esto permite almacenar datos en una estructura de cuadrícula, lo que es especialmente útil para situaciones como matrices matemáticas, tablas de datos o cualquier escenario donde los datos se organizan en una forma bidimensional o más.
- **jagged:** (o arrays de arrays) permiten crear estructuras de arrays donde cada fila puede tener una longitud diferente. Esto es útil cuando necesitamos una colección de arrays, pero cada uno de ellos tiene que almacenar una cantidad distinta de elementos.

La creación de arrays consta de tres pasos fundamentales:

- **Declaración**:

  Hay que especificar el tipo de datos que el array almacenará, seguido de corchetes [] y el nombre del array. Por ejemplo, para declarar un array de enteros, se utilizaría la siguiente sintaxis:

  ```java
  int [] mi Array
  ```

  Esta línea no crea el array en sí, sino que simplemente declara una variable miArray que puede referenciar a un array de enteros.

- **Inicialización:**

  Asignarle memoria en el heap de Java, donde se almacenarán los datos. La inicialización se realiza utilizando la palabra clave new, seguida del tipo de datos y la cantidad de elementos que el array podrá almacenar. Por ejemplo:

  ```java
  miArray = new int[5];
  ```

  Ahora miArray está inicializado para almacenar 5 enteros. Una vez definido el tamaño no se puede cambiar.

- **Asignación de valores:**

  A un array se puede realizar de manera individual, especificando el índice del elemento que queremos asignar:

  ```java
  miArray[0] = 10;
  miArray[1] = 20;
  miArray[2] = 30;
  miArray[3] = 40;
  miArray[4] = 50;
  ```

  O también podemos inicializar el array y asignarle valores simultáneamente de la siguiente manera:

  ```java
  int [] miArray ={10, 20, 30, 40, 50};
  ```




**- Variables de Tipo Objeto**

```java
// Declaración e inicialización de una clase personalizada
class Persona {
    String nombre;
    int edad;

    Persona(String nombre, int edad) {
      this.nombre = nombre;
      this.edad = edad;
    }
}

Persona persona1 = new Persona("Ana", 25);
Persona persona2 = new Persona("Carlos", 30);
```

En este caso, se declara una clase personalizada Persona con atributos nombre y edad. Luego, se crean instancias de esta clase y se inicializan con valores específicos.



## List, ArrayList







## Métodos

Son blóques de código que agrupan un conjunto de instrucciones relacionadas para realizar tareas específicas.

Cada método tiene un nombre que lo identifica y puede recibir una serie de parámetros, los cuales son variables que proporcionan información necesaria para que el método realice su tarea.

Dentro del cuerpo del método, se pueden realizar diversas operaciones, como cálculos matemáticos, manipulación de datos o incluso llamada a otros métodos.

Una vez que el método ha completado sus operaciones, puede **devolver** un resultado utilizando la palabra clave **return** seguida del valor que desea devolver.

La capacidad de reutilizar código es una de las ventajas clave de los métodos en Java. Al definir el método una vez, podemos llamarlo en diferentes partes de nuestro programa, evitando la repetición innecesaria de código. Esto no solo simplifica el código, si no que también facilita su mantenimiento y permite una mayor modularidad en nuestra aplicación.

La **recursión**, se refiere a un método que se llama a sí misma para resolver un problema de manera repetida hasta que se alcanza una condición de terminación.

Ejemplo de método

```java
public int sumar(int a, int b){
    int resultado = a+b;
    return resultado;
}
```

En este ejemplo tenemos: un método que se llama sumar, que recibe dos parámetros de tipo int a y b. Dentro del cuerpo, se realiza la operación de suma entre los dos parámetros y se almacena el resultado en una variable llamada resultado. 

Luego utiliza la palabra clave return seguida del valor de resultado para devolver el resultado de la suma. Este método retorna un valor entero (int).



### Tipos de métodos:

- **Métodos sin retorno:**

  Son aquellos que no devuelven ningún valor. Se utilizan principalmente para ejecutar un conjunto de instrucciones o modificar el estado de un objeto.

  ```java
  public void saludar(String nombre){
      System.out.println("Hola "+nombre);
  }
  
  public static void main(String[] args){
      saludar("Juan");
  }
  ```

  

- **Métodos con retorno:**

  Estos devuelven un valor después de su ejecución. Este valor puede ser de cualquier tipo de dato válido en Java, como enteros, cadenas de texto, booleanos, entre otros. Por ejemplo, el resultado de una operación matemática.

  ```java
  public int sumar(int a, int b){
      return a+b,
  }
  
  public static void main(String[] args){
      int resultado = sumar(4, 5);
      System.out.print(resultado);
  }
  ```

- **Métodos estáticos:**

  Están asociados a la clase en lugar de una instancia de la clase. Estos métodos se pueden invocar directamente sin la necesidad de crear un objeto.

  ```java
  public static void mostrarMensaje(){
      System.out.println("Hola, soy un ejemplo de método estático");
  }
  ```

### Declaración de métodos

```java
public tipo_de_dato_devuelto nombre_metodo(tipo_de_dato parametro1, tipo_de_dato parametro2){
    // código a ejecutar
    return resultado;
}
```

Para declarar un método, debemos especificar el tipo de dato que devolverá (si es que devuelve algún valor), seguido del nombre del método y los parámetros que recibe (si los tiene). El cuerpo del método contiene el código a ejecutar y, finalmente, se utiliza la palabra clave return para devolver un resultado, en aquellos métodos con valores de retorno.

En el caso de métodos que no devulven nada y que no admiten parámetros, debemos poner la clase reservada **void** al comienzo de la declaración del método.

```java
public void metodoSinRetorno(){
    // Código del método aqui
    System.out.println("Este es un método que no devuelve nada");
}
```

### Llamada de métodos

Una vez que hemos declarado el método, podemos llamarlo desde otro lugar de nuestro código. La llamada de un método se utililza utilizando su nombre seguido de paréntesis, y se pueden pasar los argumentos correspondientes si es necesario.

```java
saludar(); // Llamada a un método sin retorno
int resultado = sumar(5, 3); // LLamada a un método con retorno
```

### Retorno de métodos

Los métodos con retorno utilizan la palabra clave **return** para devolver un valor al lugar donde se llaman. El tipo de dato devuelto debe ser coherente con la declaración del método.

```java
public int sumar(int a, int b){
	return a+b;
}
```

En este caso, en la definición del método se especifica que el tipo de valor que retorna es de tipo entero (int).

- Ejemplo



## THIS

La palabra clave **this** en Java es una variable de referencia que se refiere al objeto actual. Se utiliza dentro de un método de instancia o de un constructor para acceder a miembros del objeto actual, como variables de instancia, métodos y constructores.

**Utilización:**

Se utiliza principalmente en los siguientes casos:

- Para hacer referencia a la variable de instancia de la clase actual.
- Para invocar el método de la clase actual.
- Para invocar al constructor de la clase actual.
- Para pasar el objeto actual como parámetro a un método.
- Para devolver el objeto actual desde un método.
- Para pasar el objeto actual como parámetro a un constructor.
- Para acceder a la instancia de la clase externa desde una clase interna.

Sintaxis:

```java
this.memberName;
this.methodName();
this(parameters);
```



### Ejemplo 1: Referencia a variables de instancia

```javascript
public class ThisExample {
    int a;
    int b;

    ThisExample(int a, int b) {
        this.a = a;
        this.b = b;
    }

    void display() {
        System.out.println("a: " + this.a + ", b: " + this.b);
    }

    public static void main(String[] args) {
        ThisExample obj = new ThisExample(10, 20);
        obj.display();
    }
}
```

En este ejemplo, la palabra clave `this` se utiliza para diferenciar entre las variables de instancia `a` y `b` y los parámetros del constructor `a` y `b`.



### Ejemplo 2: Invocar un método

```javascript
public class ThisMethodExample {
    void display() {
        System.out.println("Hello, World!");
    }

    void invokeDisplay() {
        this.display();
    }

    public static void main(String[] args) {
        ThisMethodExample obj = new ThisMethodExample();
        obj.invokeDisplay();
    }
}
```

Aquí, la palabra clave `this` se utiliza para invocar el método `display` desde dentro del método `invokeDisplay`.

### Ejemplo 3: Invocar un constructor

```javascript
public class ThisConstructorExample {
    int a;
    int b;

    ThisConstructorExample() {
        this(10, 20);
    }

    ThisConstructorExample(int a, int b) {
        this.a = a;
        this.b = b;
    }

    void display() {
        System.out.println("a: " + a + ", b: " + b);
    }

    public static void main(String[] args) {
        ThisConstructorExample obj = new ThisConstructorExample();
        obj.display();
    }
}
```

En este ejemplo, la palabra clave `this` se utiliza para llamar a otro constructor desde dentro de un constructor.

### Consejos y buenas prácticas

- **Evita los conflictos de nombres**: Utiliza `this` para resolver conflictos de nombres entre variables de instancia y parámetros.

- **Encadenamiento de constructores**: Utiliza `this` para llamar a otro constructor de la misma clase para evitar la duplicación de código y mejorar la legibilidad.

- **Claridad**: Aunque `this` no siempre es necesario, su uso puede mejorar la claridad del código, dejando claro que se está haciendo referencia a una variable miembro.

- **Encadenamiento de métodos**: Utiliza `this` para devolver el objeto actual desde un método, permitiendo el encadenamiento de métodos.

  ```java
  public class ChainExample {
      int value;
  
      ChainExample setValue(int value) {
          this.value = value;
          return this;
      }
  
      void display() {
          System.out.println("Value: " + value);
      }
  
      public static void main(String[] args) {
          ChainExample obj = new ChainExample();
          obj.setValue(100).display();
      }
  }
  ```

- **Evita el uso excesivo**: Aunque `this` puede ser útil, evita utilizarlo en exceso donde no sea necesario, ya que puede desordenar el código.

https://www.datacamp.com/es/doc/java/this



`this` **no es un metodo** es una palabra reservada, mas específicamente `this` es un puntero hacia la instancia del objeto.

Para entender este concepto de forma mas sencilla podemos ver a esta clase como la plantilla:

```java
class Coche{
   ...
   public Coche(){
   ...
   }
   ...
}
```

Y a un objeto del tipo `Coche` como un objeto creado en base a la anterior plantilla, el cual tiene guardado cierta información:

```java
Coche coche = new Coche(...parametrosParaConstruir);
```

Al momento de crear este objeto se crea un puntero hacia ese objeto general, pero al momento de programar la clase posiblemente sea necesario usar los datos asignados en el constructor de la clase:

```java
public Coche(String marca, String modelo, int kilometros, int ano, double precio){
    this.marca = marca;
    this.modelo = modelo;
    this.kilometros = kilometros;
    this.ano = ano;
    this.precio = precio;
}
```

Si estuviesemos en el lenguaje de programación `javascript` debo decirte que `this` es completamente necesario para referirse a metodos o atributos de una clase.

Sin embargo en `java`, esto es algo distinto, es decir, `this` es opcional en ciertos casos, pero en tu caso en particular usar `this` **SI** es necesario y es necesario debido a que como los parametros pasados al constructor se llaman igual que los miembros de tu clase, entonces para hacer referencia a los `miembros de clase` y no a los parametros del constructor deberas usar `this`, por eso en tu constructor se usa `this`:

```java
public class Coche {
    ...
    public Coche(String marca, String modelo, int kilometros, int ano, double precio){
        this.marca = marca;
        this.modelo = modelo;
        this.kilometros = kilometros;
        this.ano = ano;
        this.precio = precio;
    }
    ...
}
```

Sin embargo si tus parámetros no tuviesen el mismo nombre que los atributos de tu clase entonces puedes hacer la misma asignación de esta manera y es completamente valido en `java`:

```java
public class Coche {
    ...
    public Coche(String marcap, String modelop, int kilometrosp, int anop, double preciop){
        marca = marcap;
        modelo = modelop;
        kilometros = kilometrosp;
        ano = anop;
        precio = preciop;
    }
    ...
}
```

**Otro punto importante y a tener en cuenta es el siguiente:**

`this` **NO** hace referencia a la clase del objeto, si no a **su instancia**, es decir, esto de aquí:

```java
Coche coche = new Coche(...parametrosParaConstruir);
coche.correr();
```

No es lo mismo que:

```java
Coche.correr();
```

Nótese que en el primer ejemplo `coche.correr()` esta escrito en minúscula mientras que el segundo esta escrito en mayuscula `Coche.correr()`, pese a ser parecidos no son lo mismo, puesto que el primer ejemplo figura la referencia a un **metodo no estatico** llamado `correr` que **hace parte de cualquier instancia de la clase** `Coche`, mientras que el segundo figura la referencia a un método estático llamado `correr` que **NO hace parte de ninguna instancia de la clase Coche** y ademas hace parte de la clase en si (`Coche.correr`) y no de `coche.correr`.

Por lo cual `this` hace siempre referencia al objeto creado y no a la clase.

De hecho para poner las cosas aun mas simples podríamos decir que el rango de operación de `this` es entre los corchetes de la clase:

```java
class Coche{
   //De aqui hasta:
   ...
   public Coche(){
   ...
   }
   ...
   //El final opera this
}
```

Donde aquello delimitado por llaves en `javascript` se conoce como `scope`, en `java` este concepto es algo distinto..., en `java` estando en una clase el `scope` funciona un poco distinto... siendo que cualquier cosa que este dentro de las llaves principales de la clase tenga el mismo `scope`.

Entonces podemos usar `this` para referenciar a los metodos o atributos de la instancia de un objeto.

Sin embargo seria un poco erroneo decir que el rango de operación de `this` es todo lo que esta delimitado entre las llaves principales de la clase `Coche` en tu caso, puesto que en los metodos estaticos `this` **NO** puede usarse, haciendo que el rango de operacion de `this` enrealidad no sea toda la clase si no todos los atributos o métodos de la clase que no sean estáticos, por ejemplo:

```java
class Coche{
   ...
   public Coche(){
   ...
   }

   public void correr(){
      //this funcionaria aqui.
      System.out.println(this.kilometros);
   }
   ...
}
```

Mientras que:

```java
class Coche{
   ...
   public Coche(){
   ...
   }

   public static void correr(){
      //this NO funcionaria aquí.
      System.out.println(this.kilometros);   //ERROR
   }
   ...
}
```

https://es.stackoverflow.com/questions/359264/para-que-sirve-el-metodo-this-en-java





## **Parámetros**

Son elementos clave (variables) que se utilizan en los métodos para recibir información.

Son variables que actúan como recipientes para los datos que debemos proporcionar al llamar a un método. Estos parámetros se definen en la declaración del método y especifican el tipo de dato y el nombre que se espera recibir.

La utilización de parámetros en los métodos permite que dichos métodos sean más flexibles y reutilizables.

Al definir parámetros, podemos transferir información relevante al método, lo que le permite operar con datos específicos según las necesidades del usuario.

Los parámetros actúan como variables locales dentro del método y sólo son válidos y accesibles dentro del mismo.

Al llamar al método, debemos proporcionar argumentos que coincidan en tipo y cantidad con los parámetros declarados, de lo contrario, se producirá un error.

### Parámetros de valor

Se utilizan para transmitir información a un método. Cuando se pasa un parámetro de valor a un método, se crea una copia del valor pasado a ese método. Esto significa que cualquier cambio realizado en el parámetro dentro del método no afectará a la variable original dentro del mismo.

```java
public void duplicar(int numero){
    numero = numero*2;
    System.out.println("Numero dentro del método: "+numero);
}
public static void main (String[] args){
    int numero = 5;
    duplicar(numero);
    System.out.println("Numero fuera del método: "+numero);
}
```

En este ejemplo, el valor de la variable número dentro del método duplicar( ) se duplica, pero esta modificación no afecta al valor de la variable numero fuera del método. Esto se debe a que está trabajando con una copia del valor original.

### Parámetros de referencia

Se utilizan para transmitir información a un método de referencia. Cuando se pasa un parámetro de referencia a un método, se pasa la dirección de memoria del objeto o la referencia al objeto en sí mismo. Esto permite que el método pueda acceder y modificar el estado del objeto original.

```java
public void cambiarNombre(Persona persona, String nuevoNombre){
    persona.setNombre(nuevoNombre);
    System.out.println("Nombre cambiado: "+persona.getNombre());
}
public static void main(String[] args){
    Persona persona = new Persona(Juan);
    cambiarNombre(persona, "Pedro");
    System.out.println("Nuevo nombre: "+persona.getNombre());
}
```

En esta ejemplo, el método cambiarNombre() recibe una referencia al objeto persona y un nuevo nombre como parámetros. Dentro del método, se modifica el nombre de la persona y luego se muestra el cambio. Fuera del método, al imprimir el nombre, se refleja el nuevo valor modificado.



## **Argumentos**

Son los valores reales que se pasan a los métodos al llamarlos.

https://openwebinars.net/blog/introduccion-a-java-metodos-parametros-y-argumentos/



## Listas

Las listas son un tipo de colección que hereda de la interface collection, son una estructura de datos que respeta el orden en el cual fueron agregados los elementos, también permiten registros repetidos.

![image-20250317100555487](/home/soa/.config/Typora/typora-user-images/image-20250317100555487.png)

Esta interface o los objetos de esta, representan una colección ordenada de elementos, en la cual se tiene un control absoluto y preciso del lugar en el que se quiere insertar.



## Flujos de control 

### If

La sentencia **if** se utiliza para evaluar una condición y ejecutar cierto código sólo si la condición se cumple. La estructura básica es la siguiente:

```java
if(condicion){
    // codigo a ejecutar si la condición es verdadera
}
```

### if else

La sentencia **else** se usa junto if para especificar un bloque de código que se ejecutará si la condición especificada en la sentencia if es falsa. La estructura básica es la siguiente:

```java
if(condicion){
    // código a ejecutar si la condición es verdadera
} else {
    // código a ejecutar si la condición es falsa.
}
```

### else-if

La sentencia **else-if** es una extensión de la sentencia **if-else** que permite especificar múltiples condiciones de control de flujo en un solo bloque de código. Es similar a la sentencia if-else, pero perermite especificar varias condiciones adicionales antes de llegar a la sentencia else final.  La estructura es la siguiente:

```java
if(condicion1){
    // código a ejecutar si condicion1 es verdadera
} else if (condicion2){
    // código a ejecutar si condición1 es falsa y condición2 es verdadera
} else if (condicion3){
    // código a ejecutar si condicion1 y condicion2 son falsas y condicion3 es verdadera
} else {
    // condición a ejecutar si todas las condiciones anteriores son falsas
}
```



### Switch

La declaración **switch** es una estructura de control de flujo condicional que permite evaluar una expresión o variable contra varios valores posibles y ejecutar un bloque de código específico para cada caso.

```java
switch (expresion){
    case valor1:
        // bloque de código a ejecutar si la expresión es igual a valor 1
        break;
    case valor2:
        // bloque de código a ejecutar si la expresión es igual a valor 2
        break;
    // mas cases si es necesario
    default:
        // Bloque de codigo a ejecutar si la expresión no coincide con ninguno de los anteriores
}
```

- **switch:** Es la palabra clave que inicia la declaración, seguida de una expresión o variable entre paréntesis. La expresión o variable será evaluada y comparada con los valores especificados en cada **case.**
- **case:** Indica un valor posible para la expresión evaluada. Si la expresión coincide con el valor especificado, se ejecutará el bloque de código asociado a ese **case.** Puedes agregar tantos case como necesites para cubrir todos los valores posibles.
- **break:** Se utiliza para salir de la declaración switch después de ejecutar el bloque de código asociado a un case coincidente. Si no incluye el break, la ejecución continuará con el siguiente case, lo que puede llevar a un comportamiento no deseado, conocido como "failthrough".
- **default:** Es opcional y se utiliza para especificar un bloque de código que se ejecutará cuando la expresión no coincida con ninguno de los valores especificados en los case. Funciona como una declaración else en una estructura if-else.



### Bucles

#### Bucles indeterminados

##### **while**

Es una estructura de control de ciclo que se utiliza para ejecutar un bloque de código mientras se cumpla una determinada condición.

```java
while(condicion){
 	// Bloque de código a ejecutar mientras se cumpla la condición   
}
```



##### **Do-while**

La sentencia **do-while** es una estructura de ciclo que ejecuta un bloque de código una o más veces mientras se cumple una condición específica.

La diferencia entre el ciclo while y el ciclo do-while es que en el ciclo while, la condición se evalúa antes de ejecutar el código, mientras que en el ciclo do-while, el código se ejecuta primero y luego se evalúa la condición. Si la condición se cumple, el ciclo se repite, de lo contrario, el ciclo se detiene.

El ciclo do-while se utiliza cuando se desea garantizar que el código se ejecute al menos una vez, independientemente de si se cumple la condición

![image-20250315190751140](/home/soa/.config/Typora/typora-user-images/image-20250315190751140.png)

#### Bucles determinados

##### **For**

##### **For-each**





## Constructor

- Es un tipo específico de método que se usa para inicializar los objetos de esa clase.

- Es una función que se ejecuta automáticamente siempre al crear un objeto.
- Se encarga de reservar memoria
- 
- Tiene el mismo nombre de la clase.
- Es el primer método que se ejecuta, y se ejecuta una vez.







## Excepciones

```java
try{

} catch(Excepcion e){

}
```

Hay excepciones múltiple (multiples catch para un try)

Pordemos definir varios bloques

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



Páginas documentación interesantes:

https://oregoom.com/java/funciones/



## Expresión lambda

El operador **::** hace referencia a **una referencia de método** . Una referencia de método es una forma simplificada de escribir una expresión lambda para llamar a un método





Páginas de documentación interesantes:

https://openwebinars.net/blog/introduccion-a-java-metodos-parametros-y-argumentos/



google drive: cursogestiondeproyecto@gmail.com

1curso2025

Codigo: G-908833

Carlos Manuel Lopez Camacho



https://app2.asehca.com/

https://campusvirtual.clformacion.es/AULA5/IFCT079PO/inicio.php

usuario: carlos

clave: 1234
