# JAVA ademass

## 1. Instalación:

### JDK (Java Development Kit): 

software que provee herramientas de desarrollo para la creación de programas en Java. Puede instalarse en una computadora local o en una unidad de red.

Descargarlo de la página oficial:

https://www.oracle.com/java/technologies/downloads/

En windows copiamos la carpeta que hemos descomprimido, la podemos copiar donde queramos, por ejemplo C:\Program Files\Java\Jdk-x y decirle al sistema operativo donde lo tenemos, para ello hay que ponerlo en las variables de entorno

Ponemos en el buscador: variables y pulsamos en editar variables del sistema-> Opciones avanzadas->variables de entorno

![image-20241111094907507](/home/soa/.config/Typora/typora-user-images/image-20241111094907507.png)

Creamos un path pulsando doble click sobre donde pone path y creamos una nueva con la ruta:

![image-20241111095118601](/home/soa/.config/Typora/typora-user-images/image-20241111095118601.png)

Hay que seleccionar la ruta con \bin por que es donde están todos los dll

![image-20241111095156075](/home/soa/.config/Typora/typora-user-images/image-20241111095156075.png)

Después de hacer esto hay que crear una variable de sistema, para ello pulsar en nuevo: 

![image-20241111095516316](/home/soa/.config/Typora/typora-user-images/image-20241111095516316.png)

la variable de sistema JAVA_HOME con la ruta C:\Program Files\Java\Jdk-x  (sin \bin)

![image-20241111095612915](/home/soa/.config/Typora/typora-user-images/image-20241111095612915.png)

Para saber que esta bien instalado abrimos un windows power shell (o línea de comandos) y ponemos  

```bash
java -version
javac -version
```

Y nos debería de mostrar :

![image-20241111095842779](/home/soa/.config/Typora/typora-user-images/image-20241111095842779.png)



Descargamos nuestro IDE: IntelliJ IDEA que lo usan muchos desarrolladores de Java

https://www.jetbrains.com/es-es/idea/

En linux: 

```bash
sudo snap install intellij-idea-community --classic
```

O Eclipse:



## 2. Introducción Lenguaje Java

- Desarrollado por Sun Microsystems en 1995.
- Inicialmente comienza a desarrollarse en 1991 para tarjetas inteligentes y sintonizadores de Tv.
- Integrado por un equipo de 13 personas al mando de James Gosling. 
- Basado en C++.
- Inicialmente llamado Oak pero finalmente fue renombrado a Java. 
- Lanzado públicamente y oficial en 1996 incluyendo soporte web con el navegador HotJava.
- Luego en 1998 aparecen las primeras versiones de Java EE (J2EE 1.0)



La idea de Gosling era que el **lenguaje** Java fuera **multiplataforma**: escríbelo una vez, ejecútalo donde quieras, se hace posible con la máquina virtual de Java. 

Un lenguaje independiente del sistema operativo con un entorno de ejecución **JVM** (máquina virtual de Java).

Todo código java se compila en un lenguaje intermedio que no es 100% binario, esta justo entremedio de la máquina y el código fuente y se le conoce como **Bytecode**.

![image-20241111113533189](/home/soa/.config/Typora/typora-user-images/image-20241111113533189.png)

El bytecode es el que se encarga de llevarle a las máquinas virtuales la información que necesita para que la aplicación funcione.

Características de Java:

- Muchos tipos de aplicaciones (consola. web, ventanas, distribuidas, ect).
- Multiplataforma
- Programación orientada a objetos.
- **Recolector de basura**.(elimina de forma automática de la memoria los OBJETOS que no se están usando).
- Polimorfismo.
- Modularidad.
- Principio de ocultación. (métodos y clases privados)
- Lenguaje Tipado. (no se puede hacer nada sin decir que tipo de dato se tiene que utilizar)



Crear Primer programa con InteliiJ IDEA:

- New Project -> HolaJava (nombre todo junto separando cada palabra por una mayúscula) en una carpeta Projectos_java (yo la he colocado en var/www/html), 

- Seleccionamos InteliiJ y la versión de jdk

- Pulsamos en create

- Nos crea el projecto

  - Crea una clase Main con la funcion main:

    ```java
    public class Main {
        public static void main(String[] args) {
    
            System.out.println("Hello world!");
        }
    }
    ```

    es una clase pública, es decir que se ve en todos los sitios.

    Si pulsamos en el triángulo ejecutará todo lo que está dentro del main.

    ![image-20241111114747579](/home/soa/.config/Typora/typora-user-images/image-20241111114747579.png)

  - Desde el main, se puede llamar a paquetes, clases,.... Aqui llama a System

  - Vamos a utilizar la carpeta src, las librerias externas y la configuración no se utiliza.

Podemos crear en la clase un método y llamarlo desde el método main. El método a crear debe de ser estático, por que pertenece a la propia clase.

```java
public class Main {
    public static void main(String[] args) {

        Saludar();
    }

    public static void Saludar(){
        System.out.println("Hello world!");
    }
}
```

Si no queremos crear el método como estático, lo que tenemos que hacer es crear una instancia de la clase main, para ello hay que crear un objeto.

```java
public class Main {
    public static void main(String[] args) {
        Main m = new Main();
        m.Saludar();
    }

    public void Saludar(){
        System.out.println("Hello world!");
    }
}
```



## 3. Variables primitivas de referencia y var parte 1

### ¿Qué son?

- Son lo más importante de un lenguaje, son las entidades, contienen valores o datos. Son direcciones de memoria que reservamos para almacenar el dato.

- Una declaración de variable siempre contiene dos partes, el tipo de dato de la variable y su nombre.

  ```java
  TipoDato nombreVariable;
  ```

- El tipo de la variable determina los valores que la variable puede contener y las operaciones que se pueden realizar con ella. Ej: si es un número, una cadena,...

  - Primitivos:

    Contienen un sólo valor e incluyen los tipos como enteros, flotante, los caracteres, booleanos, etc.

    ```java
    int numero;
    int numero = 10:
    Integer numero = 10;
    String nombre = "Andres";
    ```

    La variable es una dirección de memoria que puede variar.

    Habrá direcciones de memoria que no se puedan modificar, como las constantes.

  - Referencia: Son memoria dinámica.

    Tenemos los arreglos, las clases y las interfaces.

    ```java
    Usuario usuario = new Usuario("Andres");
    ```



### Reglas para definir nombres de variables:

- Por convención, los nombres de variables empiezan con minúscula.
- Debe ser un juego de caracteres comprendido en la codificación Unicode.
- No puede ser el mismo que una palabra clave (reservadas del lenguaje) o el nombre de un valor booleano (true or false).
- No deben tener el mismo nombre que otras variables cuyas declaraciones aparezcan en el mismo ámbito.
- Si una variable está compuesta de más de una palabra, como nombreDato, las palabras se ponen juntas y cada palabra después de la primera empieza con una letra mayúscula.
- Pueden comenzar por una letra, un subrayado o un símbolo de dólar, siendo los siguientes caracteres letras o dígitos.



## 4. Variables numéricas y de tipo var

### Tipos primitivos

Son tipos de datos escalares que contienen un solo valor. 

Como todo en java es de tipado estático, se define el tipo de dato de la variable a la hora de definir esta

- enteros: (Hay 4 tipos) para reservar mas o menos memoria..

  - byte
  - short
  - int
  - long

  Un entero es un número del conjunto < ={..., -2,-1,-,1,2,...}.

  Difieren en las precisiones y pueden ser positivos o negativos.

  ```java
  //entre -128 a 127
  byte enteroByte = 127;
      
  //entre -32768 a 32767
  short enteroShort = 32767;
  
  //entre -2147483648 a 2147483647
  int enteroInt = 2147483647;
  
  //entre -92233372036854775808 a 92233372036854775807
  long enteroLong = 92233372036854775807;
  ```

  

- flotante: números reales

  Es un tipo de dato para guardar números reales en coma flotante con precisión simple y doble.

  Los números de punto flotante ( también conocidos como flotantes, dobles o números reales).

  ```java
  // entre -1.4E a 3.4028235E38
  float realFloat = 3.1416f;
  
  //entre -4.9E-324 a 1.7976931348623157E308
  double realDouble = 4.7029235E3;
  ```

  

- caracteres: (char)

  - Usa el código UNICODE y ocupa cada carácter 16 bits.

    ```java
    char a = 'a'; almacena un caracter.
    char b = '1';
    char c = '\u0021';
    ```

    | Símbolo | Secuencias de escape |
    | ------- | -------------------- |
    | \b      | Retroceso            |
    | \n      | Nueva línea          |
    | \r      | Retorno del carro    |
    | \t      | Tabulador            |
    | \\      | Diagonal invertida   |
    | \"      | Comillas dobles      |

    Tabla de códigos unicode.

    ![image-20241111122317169](/home/soa/.config/Typora/typora-user-images/image-20241111122317169.png)

    Nota: si queremos almacenar 'ab' no sería un char, sería un String.

- booleanos: (boolean) valor por defecto false.

  - Este es el tipo más simple de un solo bit.

  - Expresa un valor de verdad, puede ser VERDADERO o FALSO.

  - Para especificar un literal boolean, se usan las palabraas clave true o false. Ambas escritas en minúscula.

    ```java
    boolean a = false;
    boolean b = true;
    ```

    

A partir de la versión 10 se puede declarar sin tipar, pero no es lo suyo. 

El tipo de dato se escribe totalmente en minúscula.

![image-20241111124631092](/home/soa/.config/Typora/typora-user-images/image-20241111124631092.png)



Las palabras reservadas que no se pueden utilizar para los nombres de variable son:

![image-20241111124903193](/home/soa/.config/Typora/typora-user-images/image-20241111124903193.png)



En el ejemplo anterior, podemos declararnos una variable de tipo String, a la que si le ponemos el . podemos acceder a las métodos de la clase, esto es un tipo de dato por referencia.

![image-20241111125953129](/home/soa/.config/Typora/typora-user-images/image-20241111125953129.png)

Podemos utilizar el método para poner en mayúscula:

```java
public class Main {
    public static void main(String[] args) {

        String mensaje = "Hola";
        Main m = new Main();
        m.Saludar(mensaje.toUpperCase());
    }

    public void Saludar(String mensaje){
        System.out.println(mensaje);
    }
}
```

Podemos declarar un tipo de dato primitivo entero

```java
int numero = 10;
```

Si queremos el tipo de dato de referencia lo declaramos así:

```java
Integer numero2 = 12;
```

El tipo de datos primitivo no tiene métodos si le ponemos un punto: 

![image-20241112105028064](/home/soa/.config/Typora/typora-user-images/image-20241112105028064.png)

En cambio en el tipo de dato de referencia si posee métodos:

![image-20241112105039842](/home/soa/.config/Typora/typora-user-images/image-20241112105039842.png)



En este editor si queremos escribir System.out.println si escribimos s y elegimos la opción de sout que nos muestra y pulsamos enter nos los escribe solo.

![image-20241112105306757](/home/soa/.config/Typora/typora-user-images/image-20241112105306757.png)

Para imprimir el valor de las variables, las vamos a concatenar con +

```java
System.out.println("El número de referencia es: " + numero2 + "\nEl número es: " + numero);
```

A partir de la versión 10 en adelante podemos poner tambien:

```java
var nombre = "Esther";
```

Si nos ponemos encima del nombre de la variable con el cursor nos dice que la variable es de tipo String.

![image-20241112110053914](/home/soa/.config/Typora/typora-user-images/image-20241112110053914.png)

Si ponemos:

```java
var dato = 1;
```

Si nos ponemos encima del nombre de la variable con el cursor nos dice que la variables es de tipo int.

![image-20241112110108899](/home/soa/.config/Typora/typora-user-images/image-20241112110108899.png)

Esto es parecido a javascript que declara las variables con let y con var, pero mas con let.

Lo que nos muestra en el editor subrayado, que parece un error, se puede cambiar desde file->setting->editor->natural languages -> elegimos el lenguaje español.

![image-20241112110547807](/home/soa/.config/Typora/typora-user-images/image-20241112110547807.png)



#### Tipos primitivos enteros:

Si declaramos una variable de tipo byte que va hasta 127 y ponemos un 128, el editor nos muestra un error y nos dice el tipo de variable que deberíamos .

![image-20241112111033112](/home/soa/.config/Typora/typora-user-images/image-20241112111033112.png)

Si queremos imprimir la variable, podemos poner s y elegir la opción soutv y nos muestra que variable queremos mostrar.

![image-20241112111343865](/home/soa/.config/Typora/typora-user-images/image-20241112111343865.png)

Al pulsar el enter, nos escribe automáticamente:

```java
System.out.println("numero_byte = " + numero_byte);
```



Si queremos saber el tamaño de la variable, el máximo, mínimo, ... podemos utilizar la clase Byte.

```java
System.out.println("Cuantos Bytes tiene un Byte = " + Byte.BYTES);
        System.out.println("Cuantos bits tiene un Byte = " + Byte.SIZE);
        System.out.println("Máximo valor del tipo de dato = " + Byte.MAX_VALUE);
        System.out.println("Mínimo valor del tipo de dato = " + Byte.MIN_VALUE);
```

![image-20241112124807632](/home/soa/.config/Typora/typora-user-images/image-20241112124807632.png)

Si pulsamos control sobre la constante SIZE, podemos ver donde están declaradas dichas constantes, se nos abre la  clase Byte.class

![image-20241112124147200](/home/soa/.config/Typora/typora-user-images/image-20241112124147200.png)

Vemos que esta declarada con final, eso quiere decir que es constante y no puede cambiar.

```java
public static final byte MIN_VALUE = -128;
public static final byte MAX_VALUE = 127;
public static final Class<Byte> TYPE = Class.getPrimitiveClass("byte");
private final byte value;
public static final int SIZE = 8;
public static final int BYTES = 1;
```



Esto se puede hacer con cada tipo de dato primitivo de numeros enteros Ej:

```java
short numero_short = 3000;
        System.out.println("Numero short = " + numero_short);
        System.out.println("Cuantos Bytes tiene un Short = " + Short.BYTES);
        System.out.println("Cuantos bits tiene un Short = " + Short.SIZE);
        System.out.println("Máximo valor del tipo de dato = " + Short.MAX_VALUE);
        System.out.println("Mínimo valor del tipo de dato = " + Short.MIN_VALUE);
```

![image-20241112125252158](/home/soa/.config/Typora/typora-user-images/image-20241112125252158.png)

#### Tipos primitivos, números reales.

Si declaramos un numReal de esta manera y nos colocamos encima con el cursor nos dice que es de tipo float y nos imprime 2.0

```java
float numReal = 2;
System.out.println("numReal = " + numReal);
```



En cambio si lo declaramos así, al ponernos encima del cursor nos dice que es un double:

```java
float numReal = 2.0;
System.out.println("numReal = " + numReal);
```

Si lo queremos como float, se puede hacer de dos maneras:

```java
// hacer un casting
float numReal = (float)2.0;
```

También podemos mostrar los tamaños de la clase float

![image-20241112130203854](/home/soa/.config/Typora/typora-user-images/image-20241112130203854.png)

Si tuviésemos el número 2120 como número con coma flotante, si quisiéramos representarlo en una notación científica, tendríamos que poner

```java
float numReal
```

2.12 elevado a la 3 (equivalente al numero 2120)

Para hacerlo más simple y no explicar que se multiplica por 10 y se eleva a 3, realmente lo que se hace es mover la coma 3 veces y como hay en esa posición no tenemos un número, si o si el número se reemplaza por 0.



Otro ejemplo:

```java
float numReal = 1.5e4f;// equivalente 15000
// Otra forma de representarlo sería
float n = 15000f;
```

Aquí corremos la coma 4 veces y su equivalente sería 15000.

Esto es bueno para no ocupar tanto espacio , por ejemplo en lugar de poner 150000000 ponemos 1.5e8f;

Si en lugar de ser un número positivo fuese un número negativo, es decir en lugar de correr la coma hacia la derecha se hace hacia la izquierda.

```java
// numero real negativo
float numreal4 = 1.5e-4f;
float n = 0.00015f;
System.out.println("n = " + n);
System.out.println("numreal4 = " + numreal4);
```

Esto nos mostraría por pantalla

```java
n = 1.5E-4
numreal4 = 1.5E-4
```

Si utilizásemos para representar 

```java
var numVar=127;
o 
var numVar = 12;
```

Al posicionarnos encima, nos mostraría que su equivalente sería un int en lugar de un tipo byte, esto no es aconsejable por que estaríamos perdiendo memoria, y que los programas sean más lentos por ser más pesados.

Si por el contrario ponemos un número más grande de lo que soporta un entero al declararlo con var, nos lanzará un error para ello, tendríamos que poner al final por ejemplo:

```java
// Para pasarlo a long
var numVar = 9223372036854775808F;
// Para pasarlo a double
var numVar = 9223372036854775808D;

Las letras deberían de ir en mayúsculas.
```

 Es muy importante la gestión de la memoria.



## 5. Scanner int | String | char && POO Getter Constructor y modificadores de acceso 

Vamos a crear con IntelliJ un proyecto llamado ScanerEjemplo New->Project

Sobre la carpeta src (source) vamos a crear un paquete New->Package con el nombre com.youtics.scanner  ![image-20241114110425377](/home/soa/.config/Typora/typora-user-images/image-20241114110425377.png)

Si nos vamos a la carpeta donde lo estamos guardando vemos que por cada . del nombre crea un directorio (es muy común organizar los paquetes de esta forma).

![image-20241114110651937](/home/soa/.config/Typora/typora-user-images/image-20241114110651937.png)

Vamos a la clase scanner, dentro de la carpeta scanner vamos a crear una clase llamada MainScanner. Botón derecho sobre la carpeta com.youtics.scanner new->Java Class

![image-20241114110830622](/home/soa/.config/Typora/typora-user-images/image-20241114110830622.png)

Y dentro de este main, vamos a crear nuestro proyecto. (el main principal lo podemos borrar si queremos)

Vamos a crear otra clase llamada ScannerClass dentro de la misma carpeta donde tenemos MainScanner y en esta clase vamos a crear varios atributos.

1. Crear atributos o variables de tipo privado (private)

   ```java
   // atributos o variables de la clase
       private int numero;
       private String userName;
       private Character letra;
   ```

2. Creamos los métodos de tipo público (public) para modificar los valores de los atributos.

   ```java
   //hay que importar la libreria
   public void ScannerNumber(){
       System.out.println("Ingrese un número");
       // Declaramos un objeto de tipo Scanner y utilizamos la clase
       //System.in (viene de input) para ingresar datos
       Scanner scanner = new Scanner(System.in);
   
       // asignamos un valor a la variable numero
       // cuando utilizamos un atributo o variable de una clase podemos
       // utilizar numero = x directamente o utilizar this.numero = x
       this.numero = scanner.nextInt();
   }
   ```

   Con System.in espera que se introduzca un valor y con nextInt se lo setea a la variable. Para recoger dicho valor, como el método es void y no retorna nada, vamos a crear otro método get para coger dicho valor.

3. Para crear un **get** de la variable numero, colocamos el cursor donde queremos y pulsamos botón derecho **Generate** y seleccionamos **Getter** (esto es algo que obtenemos).

   ![image-20241114112556029](/home/soa/.config/Typora/typora-user-images/image-20241114112556029.png)

   ![image-20241114113833633](/home/soa/.config/Typora/typora-user-images/image-20241114113833633.png)

   Al seleccionarlo nos genera el siguiente código en el sitio donde tengamos el cursor posicionado

   ```java
   public int getNumero() {
       return numero;
   }
   ```

   

   Si en lugar de InteliiJ utilizasemos Eclipse se haría de manera parecida desde Source->Generate Getter and Setter:

   ![image-20241114113752632](/home/soa/.config/Typora/typora-user-images/image-20241114113752632.png)

   ![image-20241114113943383](/home/soa/.config/Typora/typora-user-images/image-20241114113943383.png)

   Si despliego la variable numero, aparece los métodos que podemos crear get o set, y al seleccionarlos automáticamente nos genera el código.

4. Ahora nos vamos a la clase MainScanner e instanciamos la clase ScannerClass, al instanciar la clase con new, lo que hace es llamar al constructor de la clase (ScannerClass) (los constructores tienen el mismo nombre que la clase).

   ```java
   ScannerClass scannerClass = new ScannerClass();
   ```

   Si no creamos el constructor por defecto es como si estuviese creado un constructor vacío.(aunque no esté su código).

   ```java
   public ScannerClass() {
   }
   ```

   Podríamos crear un constructor que tenga los atributos:

   ```java
   public ScannerClass(int numero, String userName, Character letra) {
       this.numero = numero;
       this.userName = userName;
       this.letra = letra;
   }
   ```

   Si tenemos los dos constructores se dice sobrecargar un método (sobrecargar el constructor)

   

   Para crear un constructor se puede crear pulsando en boton derecho (o Alt + Insert) -> generate -> Constructor (tanto en IntelejiiJ como eclipse) se puede seleccionar que el constructor este vacío o con las variables que seleccionemos.

   ![image-20241114115154550](/home/soa/.config/Typora/typora-user-images/image-20241114115154550.png)

   ![image-20241114115912213](/home/soa/.config/Typora/typora-user-images/image-20241114115912213.png)

5. Desde el método main de la clase MainScanner 

   Se pueden crear varios objetos (instanciar) de la clase ScannerClass y todos tendrían los mismos atributos y los mismos métodos, pero los valores serían los que vayamos poniendo en cada uno de ellos.

   ```java
   ScannerClass scannerClass = new ScannerClass();
   ScannerClass scannerClass1 = new ScannerClass();
   ScannerClass scannerClass2 = new ScannerClass();
   ```

   Al poner scannerClass. mostrará todos los atributos y métodos que estén declarados en la clase ScannerClass como public.

   ![image-20241114121220561](/home/soa/.config/Typora/typora-user-images/image-20241114121220561.png)

6. Si cambiamos de private a public la variable numero, podríamos utilizarla directamente

   ```java
   scannerClass.ScannerNumber();// nos pide introducir un número por pantalla
   scannerClass.numero = 20;// deberíamos de utilizar un método
   ```

   Asignar un valor a una variable directamente no está bien visto en la programación orientada a objetos, en la programación orientada a objetos hay una característica muy importante que se llama **encapsulamiento** y que tien que ver con los modificadores de los atributos y los métodos de acceso. Entonces si queremos modificar el atributo de una clase utilizaremos métodos, como por ejemplo con el método ScannerNumber modificaremos el valor y con el método getNumber obtendremos dicho valor.

   Si ponemos un mensaje y ejecutamos el proyecto nos mostrará

   ```
   System.out.println("scannerClass.getNumero = " + scannerClass.getNumero());
   ```

   ![image-20241114121911940](/home/soa/.config/Typora/typora-user-images/image-20241114121911940.png)

7. Hacemos lo mismo que con el atributo numero con el atributo userName, con la diferencia de que no se puede utilizar scanner.nextInt sino scanner.nextLine(), porque ese atributo no es un entero si no un String.

   1. Creamos el método ScannerUser y el método getUserName()

      ```java
      public void ScannerUser(){
          System.out.println("Ingrese un nombre de usuario...");
          // Declaramos un objeto de tipo Scanner y utilizamos la clase
          //System.in (viene de input) para ingresar datos
          Scanner scanner = new Scanner(System.in);
      
          // asignamos un valor a la variable userName
          // cuando utilizamos un atributo o variable de una clase podemos
          // utilizar userName = x directamente o utilizar this.userName = x
          this.userName = scanner.nextLine();
      }
      
      public String getUserName() {
          return userName;
      }
      ```

      

   2. Los llamamos desde el main y ejecutamos de nuevo (nos pide el numero y el usuario)

      ```java
      scannerClass.ScannerUser();
              System.out.println("scannerClass.getUserName = " + scannerClass.getUserName());
      ```

      ![image-20241114122651363](/home/soa/.config/Typora/typora-user-images/image-20241114122651363.png) 

8. Para los atributos de tipo Character se hace de manera diferente:

   1. Creamos el ScannerLetra, como no existe ningún next específico para un carácter, utilizamos este código.

      ```java
      this.letra = scanner.next().charAt(0);
      ```

   2. Los llamamos desde el main y ejecutamos de nuevo (nos pide el numero, el usuario y el carácter).

      ```java
      scannerClass.ScannerLetra();
      System.out.println("scannerClass.getLetra() = " + scannerClass.getLetra());
      ```



Nota en lugar de crear un método general para todos los atributos, en lugar de uno para cada uno.



Cuando dejemos de utilizar un objeto de tipo scanner lo que tenemos que hacer es cerrarlo (scanner.close()), como tenemos un método para cada modificar cada variable donde se crea (con new) no es bueno hacer un close en cada método, por que scanner es una clase de tipo final.

Para ello lo que tendríamos que hacer es trabajar con una propiedad o un atributo de tipo Scanner y lo que haríamos es en cada uno de los métodos utilizarlo (en lugar de crearlo).

```java
public void ScannerNumber(){
    System.out.println("Ingrese un número...");
    scanner = new Scanner(System.in);
	this.numero = scanner.nextInt();
}

public void ScannerUser(){
    System.out.println("Ingrese un nombre de usuario...");
    scanner = new Scanner(System.in);
	this.userName = scanner.nextLine();
}
public void ScannerLetra(){
    System.out.println("Ingrese solo una letra...");
    scanner = new Scanner(System.in);

    this.letra = scanner.next().charAt(0);
}
```

Y nos creamos un método general que nos retorne scanner, para luego desde el main, una vez que dejemos de utilizarlo lo podamos cerrar

en ScannerClass.java

```java
public Scanner getScanner() {
    return scanner;
}
```

en MainScanner.java

```java
// Cerramos el scanner
scannerClass.getScanner().close();
```



Todavía podemos mejorar mas el código, por que se está haciendo un new dentro de cada método, para ello:

1. Creamos un constructor vacío y dentro de este vamos a instanciar el objeto scanner y lo quitamos de cada método:

   ```java
   // creamos el constructor de la clase
   public ScannerClass() {
       // instanciamos el objeto scanner
       scanner = new Scanner(System.in);
   }
   
   public void ScannerNumber(){
       System.out.println("Ingrese un número...");
       this.numero = scanner.nextInt();
   }
   public void ScannerUser(){
       System.out.println("Ingrese un nombre de usuario...");
       this.userName = scanner.nextLine();
   }
   public void ScannerLetra(){
       System.out.println("Ingrese solo una letra...");
       this.letra = scanner.next().charAt(0);
   }
   ```

2. Así lo que haría es que cuando desde el main instanciemos la clase ScannerClass al llamar al constructor automáticamente instancia Scanner.



Nota: Al ejecutar el programa los métodos nos generan un método y un espacio y esto nos crea un problema, y ese espacio se carga en la variable siguiente. Para ello hay que hacer una pequeña modificación. (Pasa solo con los enteros). Después de  introducir un número hay que quitar el espacio o colocar el numero en última posición

```java
ScannerClass scannerClass = new ScannerClass();

scannerClass.ScannerUser();
System.out.println("scannerClass.getUserName = " + scannerClass.getUserName());        
scannerClass.ScannerLetra();
System.out.println("scannerClass.getLetra() = " + scannerClass.getLetra());
scannerClass.ScannerNumber();
System.out.println("scannerClass.getNumero = " + scannerClass.getNumero());

// o si el numero tiene que ir colocado antes
// hay que quitar el espacio, entonces desde donde lo llamamos
scannerClass.ScannerNumber();
System.out.println("scannerClass.getNumero = " + scannerClass.getNumero());
scannerClass.getScanner.nextLine();

scannerClass.ScannerLetra();
System.out.println("scannerClass.getLetra() = " + scannerClass.getLetra());
```



## 6. Convertir tipos de datos

1. Crear un proyecto CastingVariables

2. Crear una variable de tipo String y pasarla a entero, double,..

   ```java
   String numberStr = "50";
   String numberStr2 = "10";
   
   int num = Integer.parseInt(numberStr);
   int num2 = Integer.parseInt(numberStr2);
   // Concatena 2 cadena
   System.out.println("numberStr = " + numberStr + numberStr2);
   
   // Aqui esos numeros esto no me suma, por que lo toma como una concatenacion
   System.out.println("number = " + num + num2);
   
   // para sumarlos hay que crear una nueva variable
   int res = num + num2;
   System.out.println("res = " + res);
   
   String realStr = "50.25";
   double real = Double.parseDouble(realStr);
   System.out.println("realStr = " + realStr);
   System.out.println("real = " + real);
   ```

   Se puede hacer con cualquiera de las clases de referencia (Integer, Double,..) a estas clases de referencia se las llama **Wrapper**



Nota:

Tipos de datos:

- **Primitivos:** son los **únicos elementos** de todo el lenguaje que **no son considerados como [objetos](https://profile.es/blog/que-es-la-programacion-orientada-a-objetos/) (**y por tanto, **no tienen métodos).**
- **No primitivos:** al no ser tipos primitivos, **son considerados como objetos (**y por tanto, **tiene métodos).**

las clases Wrapper: 

Para todos los **tipos de datos primitivos**, existen unas clases llamadas **Wrapper**, también conocidas como envoltorio, ya que **proveen una serie de mecanismos que nos permiten envolver a un tipo de dato primitivo permitiéndonos con ello el tratarlos como si fueran objetos.**

| **Tipos primitivos** **(no son objetos y por tanto no poseen métodos)** | **Wrappers****(son objeto y por tanto poseen métodos)** |
| ------------------------------------------------------------ | ------------------------------------------------------- |
| byte                                                         | Byte                                                    |
| short                                                        | Short                                                   |
| int                                                          | Integer                                                 |
| long                                                         | Long                                                    |
| boolean                                                      | Boolean                                                 |
| float                                                        | Float                                                   |
| double                                                       | Double                                                  |
| char                                                         | Character                                               |



Si queremos pasar un Integer a String

```java
int numeroInteger = 10;
String strNumero = Integer.toString(numeroInteger);
System.out.println("strNumero = " + strNumero);
```



Los caracteres siempre son más complejos, para convertir una cadena de caracteres a un carácter. (es decir extraer un carácter)

```java
String charString = "AB";
char c = charString.charAt(1);
System.out.println("c = " + c);
```

charAt(posicion) nos devuelve el carácter de la posición que queremos.



### Casteo

Tipos de datos primitivos

```java
int i = 200;
short s = i;
```

Esto lanza un error, por que requiere un short y le llega un entero, se soluciona;

```java
int i = 200;
short s = (short) i;
```

Se puede castear siempre y cuando no sobrepase el valor del tipo de dato que estemos utilizando, es decir no podemos castear un número muy grande a un tipo que no lo soporte



## 7. Arreglos

Las variables almacenan un solo dato, si declaramos una variable de tipo entero almacenamos solo un número entero.

Los arreglos nos va a permitir almacenar varios enteros si declaramos un arreglo de enteros. O muchos strings si declaramos un arreglo de string, o muchos productos si declaramos un arreglo de productos, siempre cuando creemos una clase Producto.

Podemos almacenar muchos datos, siempre que esos datos sean del mismo tipo.

Los arreglos son tipos de datos de referencia que contienen varios elementos ordenados, una colección.

Sus elementos o valores están asociados a una llave o índice y puede contener tipos de referencia o primitivos. Pero siempre asociado a un solo tipo de datos.

Los arreglos comienzan con el índice 0, es decir almacenamos el primer dato en el índice 0, el segundo dato en el índice 1 y así sucesivamente. 

Tienen una cantidad de elementos o dimensiones que nosotros podemos almacenar. Cuando declaramos un arreglo tenemos que decirle que cantidad de datos vamos a almacenar.

El lenght es una propiedad que tienen los arreglos, que identifican cual es la dimensión de ese arreglo, el total de elementos que tenemos.

Dos características:

- La cantidad de válidos que sería la cantidad de elementos que tiene cargado un arreglo. (es decir los datos válidos).
- La cantidad máxima que sería la dimensión, el tamaño que tiene ese arreglo.

![image-20241115190237878](/home/soa/.config/Typora/typora-user-images/image-20241115190237878.png)

En este caso tenemos 10 elementos válidos que coincide con la cantidad máxima 10, en cambio si llenamos las posiciones de la 0 a 5 , tendríamos 6 elementos válidos y la dimensión (cantidad máxima) seguiría siendo 10.

![image-20241115190917253](/home/soa/.config/Typora/typora-user-images/image-20241115190917253.png)

Si tengo que recorrer un arreglo, tengo que saber cuántos datos válidos, por que si no voy a mostrar posiciones donde no hay datos válidos.

Hay que empezar a cargarlo desde la posición 0.

Para declarar un arreglo de enteros de 10

```java
int [] lista = new int[10];
```

Para cargar datos en el arreglo:

```java
lista[0] = 10;
```

Si queremos mostrar el valor:

```java
System.out.println("lista[0] = " + lista[0]);
```



Si añadimos más valores y los queremos mostrar recorriendo la lista:

```java
int[] lista = new int[10];
lista[0] = 10;
lista[1] = 20;

for (int i = 0; i < lista.length; i = i + 1) {
    System.out.println("lista["+i+"] = " + lista[i]);
}
```

Nos mostraría los valores que contiene y 0 en las posiciones en las que no hay nada.

```
lista[0] = 10
lista[1] = 20
lista[2] = 0
lista[3] = 0
lista[4] = 0
lista[5] = 0
lista[6] = 0
lista[7] = 0
lista[8] = 0
lista[9] = 0
```

```java
for(int i = valor inicial; i <= valor final; i = i + paso) {        
	....        ....    
	Bloque de Instrucciones
	....        ....        
	.... 
}
```

Ejemplo de for:

```java
for(int i=500;i<=1000;i+=2)
{//Notemos que escribir i+=2 es similar a escribir i = 	i + 2
    System.out.println(i);
}
```





Otra forma de mostrarlo sería utilizando un foreach que es como un for (en algunos lenguajes no se escribe la palabra foreach como en java),  va a tener un numero entero seguido de dos puntos y la lista (a lo que hace referencia), es decir todo lo que esté en la lista que lo meta en número, y mostramos número. El resultado sería el mismo que con for.

Si le añadimos la condición que muestre sólo los válidos:

```java
for (int numero : lista) {
    if (numero != 0) {
        System.out.println("numero = " + numero);
    }
}
```

Nos mostraría los valores donde haya valor:

```java
numero = 10
numero = 20
```

El uso de Java ForEach nos permite recorrer la lista de elementos de una forma mas compacta y el código se reduce.





Si creamos un arreglo de String

```
// Arreglo de String
// Opción 1
String[] palabras = new String[10];
//Opción 2
String[] nombres = {"pepe", "gaby", "maria", "ana", "estela"};
```

Si queremos que nos muestre la posición 6, nos lanzará un error, por que no existe esa posición aunque no pongamos directamente el número.



![image-20241118171046748](/home/soa/.config/Typora/typora-user-images/image-20241118171046748.png)



Nota: al trabajar con arreglos, estamos trabajando con memoria estática, es decir memoria que no se puede modificar. Si se se reserva por ejemplo [10], no se puede modificar después.



Si queremos tener un control para saber de que tipo es cada dato, podemos utilizar instanceof

```java
String nombre = "Gabriela";

if(nombre instanceof String){
    System.out.println("Es un String");
} else {

    System.out.println("No es un String");
}

Integer numero = 30;

if(numero instanceof Integer){
    System.out.println("Es un int");
} else {

    System.out.println("No es un int");
}
```

Hay que preguntar por el mismo tipo de dato como esté declarado, o como mucho por object, puesto que todos son object, de lo contrario daría un error.





### Operadores ternarios

Es como un if pero más simplificado, es una herramienta que utilizan muchos lenguajes como los lenguajes web tipo javascript

Vamos a crear un String llamado mensaje

```java
Integer numero = 20;
String mensaje = (numero instanceof Number) ? "Es un number" : "No es un number";
System.out.println("mensaje = " + mensaje);
```

Este código es equivalente a lo que hemos escrito anteriormente donde:

```java
(numero instanceof Number) es equivalente al if
? es el codigo que va dentro del if
: es el código que va dentro del else
```

Otro ejemplo con operadores ternarios:

```java
mensaje = (numero==20) ? "Num es igual a 20" : "Num es diferente a 20";

System.out.println("mensaje = " + mensaje);
```



## 8. Arrays (arreglos)

```java
// Opcion 1 para declarar arreglos
String[] palabras = {"pepe", "gaby", "maria", "ana", "estela"};

// Opcion 2 para declarar arreglos, hacer una instancia a la clase String
String[] productos = new String[7];
productos[0] = "Kingston Pendrive 64GB";
productos[1] = "Samsung Galaxy";
productos[2] = "Disco duro SSD Samsung externo";
productos[3] = "Asus Notebook";
productos[4] = "Macbook Air";
productos[5] = "Chromecast 4at generación";
productos[6] = "Bicicleta Oxford";
```

Para ordenar un arreglo:

Utilizamos la clase Arrays.sort, hay que importar la libreria

```java
import java.util.Arrays;

Array.sort(productos);
```

Para comprobar si se ha ordenado correctamente, iteramos el arreglo, para ello vamos a hacer un foreach

```java
for(String producto: productos)
{
    System.out.println("producto = " + producto);
}
```

Nos muestra el array ordenado:

```java
producto = Asus Notebook
producto = Bicicleta Oxford
producto = Chromecast 4at generación
producto = Disco duro SSD Samsung externo
producto = Kingston Pendrive 64GB
producto = Macbook Air
producto = Samsung Galaxy
```

Hacemos lo mismo con el array palabras

```java
Arrays.sort(palabras);

// iterar el arreglo
for(String palabra: palabras)
{
    System.out.println("palabra = " + palabra);
}
```

Nos muestra:

```
palabra = ana
palabra = estela
palabra = gaby
palabra = maria
palabra = pepe
```



Para buscar en un arreglo por ejemplo maria:

```
// Buscar en el arreglo
// Recorremos el arreglo para que nos retorne la posición donde se encuentra el valor
// Añadimos la condición para comparar
int posicion;
// Así no va a entrar nunca en el for, por que maria no esta en la poscición 0,
// para solucionar esto lo que tenemos que hacer para que se cumplan ambas condiciones es
// poner una negación con !
// rompe el bucle cuando encuentre a maria
for(posicion =0; posicion<palabras.length && !palabras[posicion].equals("maria"); posicion++)
{
    System.out.println("posicion = " + posicion);
}

if (posicion==palabras.length){ // Si entra es porque ha recorrido todo el array
    System.out.println("Valor no encontrado");
} else {
    System.out.println("palabras["+posicion+"] = " + palabras[posicion]);
}
```

con array.equals compara si la palabra es exactamente igual

con array.equalsIgnoreCase ignora si escribo en mayúscula o minúscula (las ignora).



Esto se podría mejorar con un scanner, declaramos un objeto de tipo Scanner. (Para utilizarlo hay que importarlo)

```java
import java.util.Scanner;

Scanner buscar = new Scanner(System.in);
System.out.println("Ingrese el valor a buscar...");
String valorBuscado = buscar.next();


// Así no va a entrar nunca en el for, por que maria no esta en la poscición 0,
// para solucionar esto lo que tenemos que hacer para que se cumplan ambas condiciones es
// poner una negación con !
// rompe el bucle cuando encuentre el valorBuscado
for(posicion =0; posicion<palabras.length && !palabras[posicion].equals(valorBuscado); posicion++)
{
    System.out.println("posicion = " + posicion);
}

if (posicion==palabras.length){ // Si entra es porque ha recorrido todo el array
    System.out.println("Valor no encontrado");
} else {
    System.out.println("palabras["+posicion+"] = " + palabras[posicion]);
}
```

 

Modificar un arreglo

Si queremos por ejemplo eliminar el valor buscado, tendremos que mover los demas elementos a partir de la posición donde se encuentre valorBuscado. 

![image-20241119111045233](/home/soa/.config/Typora/typora-user-images/image-20241119111045233.png)

Nota: no se puede eliminar una posición, por que no se puede eliminar una dirección de memoria.

Tenemos que partir de la posición donde se encuentre el valor

```java
for(int i=posicion; i<palabras.length;i++)
{
    palabras[posicion] = palabras[posicion+i];
}
for(String palabra: palabras)
{
    System.out.println("palabra = " + palabra);
}
```

Esto nos dará un error, por que al mover los valores, en el último nos da un error en índice 5 por que no existe, el array inicial termina en 4.

![image-20241119111442536](/home/soa/.config/Typora/typora-user-images/image-20241119111442536.png)

Para solucionarlo, tenemos que recorrer hasta una posición válida.

```java
// Modificar el arreglo
// Por ejemplo vamos a eliminar el valor encontrado
for(int i=posicion; i<palabras.length-1;i++)
{
    palabras[posicion] = palabras[posicion+i];
}
for(String palabra: palabras)
{
    System.out.println("palabra = " + palabra);
}
```

Ahora nos mostrará el ultimo valor dos veces, por que el valor de la última posición no la puedo intercambiar.

![image-20241119112037589](/home/soa/.config/Typora/typora-user-images/image-20241119112037589.png)

Para solucionar esto nos declaramos un nuevo arreglo con una posición menos y utilizamos un método de la clase system arraycopy.

arraycopy es un método que copia desde la posición origen de un array a un array destino en una posición específica. El número de elementos copiados también se identifica como parámetro.

```java
public static void arraycopy(Object src, int srcPos, Object dest, int destPos, int length)
```

En nuestro caso:

```java
String[] nuevo = new String[palabras.length-1];
System.arraycopy(palabras, 0, nuevo, 0, nuevo.length);
```



Con System.out.println(); se hace un salto de línea.



## 9. String avanzado

Declaramos una variable de tipo String nombre

```java
String nombre = "Gabriel";
String nombre2 = new String("Gabriel");

boolean comparar = nombre2==nombre;
System.out.println("comparar = " + comparar);
```

Esto nos retorna false, se supone que nombre y nombre2 son diferentes.

No son iguales, por que cuando lo declaramos instanciando la clase String (como tenemos nombre2) se crean dos direcciones de memoria distintas donde se almacenen, no importa el dato que se almacene, lo que importa es que nombre y  nombre2 tienen posiciones de memoria diferentes. Lo que podemos hacer es hacer una comparación de este estilo, utilizando equals

```java
comparar = nombre.equals(nombre2);
System.out.println("comparar = " + comparar);
```

Este si nos retorna true (son iguales), por que aquí compara el contenido de la variable, en cambio en el ejemplo anterior compara directamente la variable (direcciones de memoria) no el contenido.



Otro ejemplo, creamos otra variable:

```java
String nombre3 = "Gabriel";
comparar = nombre==nombre3;
System.out.println("comparar = " + comparar);
```

Esto nos retorna true, por que a partir de una versión, cuando encuentra dos variables con el mismo contenido, lo que hace es que apunta ambas variables a la misma dirección de memoria. Entonces nombre y nombre3 tienen la misma dirección de memoria.



Concatenar string.

Podemos concatenar cadenas con "+".

```java
// concatenar
String curso = "Java 2023 - String";
String docente = "Gabriel";

String mensaje = curso + " con " +docente;
System.out.println("mensaje = " + mensaje);
```

Si ponemos:

```
int n1 = 10;
int n2 = 20;
System.out.println("La suma es = " + n1+n2);
```

No hace la suma, si no que concatena los números, ya que Java lee de arriba a abajo y de izquierda a derecha. Es un tema de prioridades.

Para poder sumarlos:

```java
// Opción 1 coge primero los paréntsis y luego concatena.
System.out.println("La suma es = " + (n1+n2));


// Opción 2
System.out.println(n1+n2 + " es la suma ");
```



Otra forma de concatenar es con concat

```java
String mensaje2 = curso.concat(" ")
                        .concat(docente);
System.out.println("mensaje2 = " + mensaje2);
```



Inmutabilidad de los string

```java
curso.concat(docente);
System.out.println("curso = " + curso);
```

Si hacemos concat sobre una variable existente, el contenido no se modifica, esto imprimiría el valor de curso, sin la concatenación, es decir no se modifica el valor de la variable.





## 10. Programación orientada a objetos

En la programación orientada a objetos, lo que hay que hacer es definir que objetos interactúan para solucionar el problema.

Puede haber objetos que tengan como atributos otros objetos.

- Los objetos como concepto, fuera de la informática, existen desde siempre, antes de la programación.

- La clase = a un molde. Es una abstracción de un objeto de la realidad, es un diseño (molde) de cómo va a ser la entidad que queremos crear. Ej: el automovil es una clase, que tiene una rueda, una funda,..., tiene métodos (cuales son los compartamientos acelerar, frenar, mostrar las características, tiene color), puede tener un dueño (y este a su vez ser otra clase)

  ¿Todos los automóviles son iguales? NO, justamente lo que define si un automóvil es igual a otro, son estas características. Esta es la diferencia de una clase automóvil (que es una abstracción, es un molde) 

  ![image-20241119123915499](/home/soa/.config/Typora/typora-user-images/image-20241119123915499.png)

  Todos tienen ruedas, color, .... pero cada uno tiene un color, una forma,.... 

  Una clase es un molde, o prototipo, que definen las variables y los métodos comunes a un cierto tipo de objetos.

  ```java
  public class Automovil{
  	String modelo;
  	String color;
  	double cilindrada;
  	
  	public void acerlerar(){
  	
  	}
  	
  	public void frenar(){
  	
  	}
  }
  ```

  Las variables son las características y los métodos son los comportamientos (son comunes a todos los automóviles).

- Esta es una representación, un diagrama UML ((Unified Modeling Language) es un **lenguaje de modelado visual de software**, indispensable para la arquitectura y la ingeniería de software y sistemas. Y fue pensado y creado como una lengua franca o lengua universal para los desarrolladores)

  ![image-20241119124351967](/home/soa/.config/Typora/typora-user-images/image-20241119124351967.png)

  Define con :

  \- que es un atributo privado (private)

  \+ que es un atributo público (public)

  Si es public es accesible desde otros sitios de nuestra aplicación, si es private sólo son accesibles en la propia clase, ejemplo el método acelerar puede acceder a ella, si se quiere acceder desde fuera tiene que ser a través de métodos. (Encapsulamiento)

- La diferencia entre clase y objeto, es que una clase es una generalidad y un objeto una particularidad (tiene definidos detalles, características). Es decir, todas esas diferencias, estados de un atributo (modificar ese atributo). El objeto es tangible, es real. 

  La clase es un abstracción una generalización (no tiene datos concretos).

  El objeto es una instancia de la clase , una particularidad de la clase, es decir da nombre y apellidos a los atributos.

- Crear objetos:

  - El operador new reserva memoria dinámica para un objeto

    ```java
    Automovil auto = new Automovil();
    ```



Cuando creamos un proyecto nuevo en Java, nos crea una clase Main inicialmente que contiene el método principal.

```java
int numero; // es un tipo primitivo no tiene métodos.
Integer numero2; // Es un wrapper.
numero2. //puede acceder a métodos
```

Crear una clase:

- New class, creamos antes un paquete (package) 
  - Ejemplo package net.toutics.modelo
  - Ejemplo class Automovil

```java
package net.youtics.modelo;

public class Automovil {
    private String color;
    private Integer tanque; // capacidad de combustible
    private String persona;
    private double cilindrada;
}
```

Para modificar las características, los atributos, para ello utilizamos métodos. Primero creamos el método constructor en la clase Automovil.

```java
// Método contructor vacio
public Automovil(){

}
```

Al crear el constructor, ya podemos crear un objeto automovil desde main.

```java
Automovil automovil = new Automovil();
```

También podemos crear un constructor lleno, botón derecho -> Generate -> Constructor y selecciono todos los atributos.



```java
public Automovil(String color, Integer tanque, String persona, double cilindrada) {
        this.color = color;
        this.tanque = tanque;
        this.persona = persona;
        this.cilindrada = cilindrada;
    }
```

Ahora tenemos en el código dos métodos con el mismo nombre uno vacío y otro lleno, a esto se le llama **sobrecarga de métodos** y es una característica de la programación orientada a objetos, que es el **polimorfismo.**







Los métodos para modificar y consultar los atributos son los **métodos get y set.**

Pulsamos botón derecho (donde queramos que se escriba el código) -> Generate -> Getter / Setter

![image-20241119132043093](/home/soa/.config/Typora/typora-user-images/image-20241119132043093.png)



Los métodos getX() nos retorna el atributo X, ejemplo método getColor():

```java
public String getColor() {
    return color;
}
```

Los métodos setX nos modifica el atributo X, ejemplo método setColor():

```java
public void setColor(String color) {
    this.color = color;
}
```

Para crear un objeto concreto con valores desde el main, instanciamos la clase Automovil y llamamos a los métodos set para asignar valor a los atributos (propiedades).

```java
Automovil automovil = new Automovil();

automovil.setCilindrada(2500);
automovil.setColor("rojo");
automovil.setPersona("pepe");

System.out.println("automovil.getPersona() = " + automovil.getPersona());
```

Si queremos imprimir todas las propiedades, podemos generar con botón derecho generate -> toString que lo que hace es generar una cadena con las propiedades que seleccionemos:

![image-20241120114143123](/home/soa/.config/Typora/typora-user-images/image-20241120114143123.png)

Esta opción generaría en la clase este código:

la clase @Override (anotacion) que lo que quiere decir que estoy sobrescribiendo este método. El override en Java **es una técnica que permite a los programadores crear una versión de un método que ya ha sido definido en una superclase**. Esto se hace para cambiar un método heredado o agregar funcionalidades adicionales a una clase.

```java
@Override
public String toString() {
    return "Automovil{" +
            "color='" + color + '\'' +
            ", tanque=" + tanque +
            ", persona='" + persona + '\'' +
            ", cilindrada=" + cilindrada +
            '}';
}
```

Para imprimirlo desde la clase Main

```java
System.out.println("automovil.toString() = " + automovil.toString());
```

Y nos retornará el automóvil completo.

```java
automovil.toString() = Automovil{color='rojo', tanque=null, persona='pepe', cilindrada=2500.0}
```

La diferencia entre una clase y un objeto es que el objeto es real y la clase es algo generalizado, que sirve para crear otros objetos



Si queremos crear otro objeto (desde clase Main):

```java
Automovil automovil2 = new Automovil("azul",60,"luis",2000);
System.out.println("automovil2.toString() = " + automovil2.toString());
```



## 11. Herencia

La herencia es muy importante para el polimorfismo.

Es una relación de parentesco entre dos clases:

1. Una es padre de la otra.
2. Una es hija de la/s otra/s (subclase).



Las subclases heredan los métodos y los atributos de las clases padre.

Si nosotros tenemos que programar una clase superior (raiz) y solo vamos a tener por debajo una subclase, no tiene sentido tener la clase padre.



### Características:

1. Implementar relaciones de jerarquía de clases.
2. Una subclase hereda el estado y el comportamiento de todos sus ancestros. Puedo tener una o más herencias por debajo. Puede haber una herencia múltiple aunque Java no lo permite. Sólo podemos heredar de una clase, ahora en un árbol yo podría tener una clase superior,  una clase en un segundo nivel y una clase en un tercer nivel, la clase de tercer nivel hereda de las dos superiores.
3. Es una de las bases de reutilización de código y polimorfismo. El polimorfismo nos permite declarar un tipo dato de la clase padre, y por ello nos permite crear listas con diferentes hijos.
4. También es un principio fundamental de la POO.



Parentesco entre clases:

No puede existir herencia si no existe alguna relación familiar entre ambas clases. Es decir la subclase se tiene que parecer a la clase padre, tiene que ser del tipo de la clase padre.

![image-20241120120134961](/home/soa/.config/Typora/typora-user-images/image-20241120120134961.png)

Ejemplo tenemos una clase padre Persona, la persona tiene un nombre, un apellido, un dni,  tiene los métodos get y set y un constructor. Esa clase padre Persona, puedo generar subclases estudiante, cliente, docente,... y todas son personas, todas tienen nombre, apellido, dni. Esto significa que son clases válidas para la herencia.

Un ejemplo de clases que no son válidas. Tengo una clase Animal que tenga un nombre, un apellido y un identificador, aquí no podría utilizar la clase padre Persona aunque tenga nombre, apellido,..



### Hay dos formas de herencia:

Hay dos formas distintas para el proceso de creación de jerarquías de clase o herencia:

- **Especialización:** Voy a tener una clase Persona que es bastante abstracta, las personas pueden ser alumno, docente, cliente. Un alumno tendrá notas, curso,.. un docente tendrá sueldo, calcular las horas que trabajo... Algo especial que les diferencia entre las personas. 

  ![image-20241120120919846](/home/soa/.config/Typora/typora-user-images/image-20241120120919846.png)

- **Generalización:** Es lo contrario, empezamos a crear clases alumno, docente, administrativo, (clases especializadas) ... en la que empezamos a repetir código y entonces nos surge que deberíamos de tener una clase general.

  ![image-20241120121248886](/home/soa/.config/Typora/typora-user-images/image-20241120121248886.png)

Algo importante es el constructor, que es el método que se llama igual que la clase, reserva el espacio de memoria para los atributos. 

Aquí tenemos la palabra **Super**, es una palabra que está vinculada con el constructor y con la herencia.

Ejemplo:

Tenemos la clase padre Persona:

```java
public class Persona {
    private String nombre;
    private String apellido;

    public Persona(String nombre, String apellido){
        this.nombre = nombre;
        this.apellido = apellido;

    }
}
```

Tenemos la clase Alumno que hereda de Persona, esto se indica en la clase Alumno con la palabra **extends**.

```java
public class Alumno extends Persona{
    private double promedio;

    public Alumno(String nombre, String apellido, double promedio ){
        super(nombre, apellido);
        this.promedio = promedio;
    }
}
```

En el constructor al poner la palabra super utiliza el constructor de la clase padre.

Otra de las ventajas de la herencia es poder sobre escribir utilizar los métodos que heredamos de la clase padre, se puede hacer redefiniendo en la clase hija con el mismo nombre:

```java
public class Persona{
	[...]
	public void metodoDelPadre(){
		// hacer algo importante
	}
}

public class Alumno extends Persona{
    [....]
	@Override
	public void metodoDelPadre(){
		[...]
	}
}
```

En la clase del padre hay que tener métodos que le sirvan a las subclases, no tiene sentido que haya un método que solo le sirva a una subclase. Por que si no el resto de las clases se va a sobrecargar de métodos que nunca va a utilizar.

Un método padre es un método que se va a utilizar en TODAS las subclases, todos los hijos van a utilizar esa clase.



Si quisiéramos usar el comportamiento original y sólo modificar parte en la clase hija, deberíamos hacer lo mismo que vimos anteriormente en el constructor, invocando desde super:

```java
public class Alumno extends Persona{
    [....]
	@Override (indica que esta sobreescribiendo el método)
	public void metodoDelPadre(){
		super.metodoDelPadre();
        [...]
	}
}
```

Si quisiéremos reusar el toString del padre lo invocamos con super:

```java
public class Persona{
	[...]
	@Override
	public String toString(){
		return this.nombre + " " + this.apellido;
	}
}

public class Alumno extends Persona{
	[...]
	@Override
	public String toString(){
		return super.toString()+ ", promedio: "+ this.promedio;
	}
}
```

Podemos restringir la herencia y sobrescritura de métodos:

- Para impedir la herencia usamos la palabra **final:**

  ```java
  final public class Persona{
      [...]
  }
  ```

  La palabra final se utiliza para las constantes, ya que estas no se pueden cambiar, si quisiéramos una clase que no se pueda heredar hay que poner la palabra final antes.

- Impedir la sobreescritura de un método que pueda ser heredado:

  ```java
  public class Persona{
      [...]
      final public void metodoDelPadre(){
          //hacer algo importante
      }
  }
  ```



Ejemplo creamos un proyecto Herencia, 

- Creamos una clase padre Persona:

  ```java
  package net.youtics.modelo;
  
  public class Persona {
      private String nombre;
      private String apellido;
  
      public Persona(String nombre, String apellido){
          this.nombre = nombre;
          this.apellido = apellido;
  
      }
  
      public String getNombre() {
          return nombre;
      }
  
      public void setNombre(String nombre) {
          this.nombre = nombre;
      }
  
      public String getApellido() {
          return apellido;
      }
  
      public void setApellido(String apellido) {
          this.apellido = apellido;
      }
  
      @Override
      public String toString() {
          return "Persona{" +
                  "nombre='" + nombre + '\'' +
                  ", apellido='" + apellido + '\'' +
                  '}';
      }
  }
  ```

  

- Creamos una clase hija Estudiante

  ```java
  package net.youtics.modelo;
  
  public class Estudiante extends Persona{
      private Double promedio;
  
      public Estudiante(String nombre, String apellido, Double promedio ){
          super(nombre, apellido);
          this.promedio = promedio;
      }
  
      public Double getPromedio() {
          return promedio;
      }
  
      public void setPromedio(Double promedio) {
          this.promedio = promedio;
      }
  
      @Override
      public String toString() {
          return "Estudiante{" +
                  "promedio=" + promedio +
                  '}';
      }
  }
  ```

  

- Desde otra aplicación llamada **lucidchart** vamos a representar las clases con UML, con la flecha indica que la clase cliente está heredando de la clase Persona. 

  ![rso](/home/soa/.config/Typora/typora-user-images/image-20241120125856712.png)

- Pero como solo hay una clase que hereda, esto no tendría sentido, tendría sentido si tuviésemos más clases, como en el ejemplo:

  ![image-20241122122628171](/home/soa/.config/Typora/typora-user-images/image-20241122122628171.png)

- Vamos a crear la clase docente que extiende de Persona.

  ```java
  package net.youtics.modelo;
  
  public class Docente extends Persona{
      private Integer horasDocente;
  
      public Docente(String nombre, String apellido, Integer horasDocente) {
          super(nombre, apellido);
          this.horasDocente = horasDocente;
      }
  
      public Integer getHorasDocente() {
          return horasDocente;
      }
  
      public void setHorasDocente(Integer horasDocente) {
          this.horasDocente = horasDocente;
      }
  
      @Override
      public String toString() {
          return "Docente{" +
                  "horasDocente=" + horasDocente +
                  '}';
      }
  }
  ```

  

- En la clase main vamos a crear varios estudiantes y docentes:

  ![image-20241122123138264](/home/soa/.config/Typora/typora-user-images/image-20241122123138264.png)

  Nos muestra un error en promedio , porque es un doble, hay que indicarlo con 7D.

  ```java
  Estudiante estudiante = new Estudiante("Gabriel", "Lopez", 7D);
  ```

  ```java
  import net.youtics.modelo.Docente;
  import net.youtics.modelo.Estudiante;
  
  public class Main {
      public static void main(String[] args) {
  
          Estudiante estudiante1 = new Estudiante("Gabriel", "Lopez", 7d);
          Estudiante estudiante2 = new Estudiante("Maria", "Perez", 8d);
          Estudiante estudiante3 = new Estudiante("Luis", "Garcia", 6d);
  
          Docente docente1 = new Docente("Carlos","Jimenez", 10);
          Docente docente2 = new Docente("Martina","Ruiz", 8);
  
          System.out.println("docente2.toString = " + docente2.toString());
      }
  }
  ```

- Nos muestra:

  ```java
  docente2.toString = Docente{horasDocente=8}
  ```

  Si queremos que nos muestre todo, lo que tenemos que hacer es sobrescribir el método toString de la clase Docente.

  ```java
  @Override
  public String toString() {
      return "Docente:" +
              "horasDocente=" + horasDocente + "\n"+
              "Persona:" + super.toString() +
              '}';
  }
  ```

  Esta es una de las ventajas de la herencia (sobrescribir métodos), otra es el polimorfismo.





## 12. Polimorfismo

Es uno de los conceptos más importante de la programación orientada a objetos.



![image-20241122130315415](/home/soa/.config/Typora/typora-user-images/image-20241122130315415.png)

Con los diagramas UML representamos las relaciones que hay entre las clases (abstractas, padres, interfaces, enumeradores....), pueden ser vínculos muy fuertes, o importantes,.

La clase padre es Persona, y con la flecha hacia arriba indica que hay una relación de herencia con las clases Estudiante, Docente y Administrativo, indica que heredamos el nombre, apellido y dni y el método mostrarPersona y se puede utilizar desde las clases . Esto es herencia no polimorfismo. 

El poliformismo permite que las clases Estudiante, Docente y Administrativo se traten como una Persona, permite una generalización para mostrar la información. Es decir tratar a todas como si fuesen personas. para ello. 

Nota: cuando en una clase se pone extends, hasta que no se incorpora el constructor, da error.



Clase Persona:

```java
package net.youtics.modelo;

public class Persona {
    private String nomYApe;
    private Integer dni;

    public Persona(String nomYApe, Integer dni) {
        this.nomYApe = nomYApe;
        this.dni = dni;
    }

    public String getNomYApe() {
        return nomYApe;
    }

    public void setNomYApe(String nomYApe) {
        this.nomYApe = nomYApe;
    }

    public Integer getDni() {
        return dni;
    }

    public void setDni(Integer dni) {
        this.dni = dni;
    }
    @Override
    public String toString() {
        return "Persona{" +
                "nomYApe='" + nomYApe + '\'' +
                ", dni=" + dni +
                '}';
    }
}
```

Clase Estudiante:

```java
package net.youtics.modelo;

public class Estudiante extends Persona{
    private Integer numeroLegajo;

    public Estudiante(String nomYApe, Integer dni, Integer numeroLegajo) {
        super(nomYApe, dni);// implementa el constructor del padre
        this.numeroLegajo = numeroLegajo;
    }

    public Integer getNumeroLegajo() {
        return numeroLegajo;
    }

    public void setNumeroLegajo(Integer numeroLegajo) {
        this.numeroLegajo = numeroLegajo;
    }

    @Override
    public String toString() {
        return "Estudiante{" +
                super.toString() +
                "numeroLegajo=" + numeroLegajo +
                '}';
    }
}
```

Clase Docente:

```java
package net.youtics.modelo;

public class Docente extends Persona {

    private Integer canHorasClase;

    public Docente(String nomYApe, Integer dni, Integer canHorasClase) {
        super(nomYApe, dni);// implementa el constructor del padre
        this.canHorasClase = canHorasClase;
    }

    public Integer getCanHorasClase() {
        return canHorasClase;
    }

    public void setCanHorasClase(Integer canHorasClase) {
        this.canHorasClase = canHorasClase;
    }

    @Override
    public String toString() {
        return "Docente{" +
                super.toString() +
                "canHorasClase=" + canHorasClase +
                '}';
    }
}
```

Clase Main:

```java
import net.youtics.modelo.Docente;
import net.youtics.modelo.Estudiante;
import net.youtics.modelo.Persona;

import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {

        Estudiante estudiante1 = new Estudiante("Esther Diez", 52118323,1);
        Estudiante estudiante2 = new Estudiante("Maria Gonzalez", 56643,1);

        Docente docente1 = new Docente("Juan carlos",444, 20);
        Docente docente2 = new Docente("lucas Fernadez", 542, 40);

        // Vamos a listar los estudiantes y los docentes
        // Creamos una lista de estudiantes
        List<Estudiante> list;
        list = new ArrayList<>();
        list.add(estudiante1);
        list.add(estudiante2);
        // Esto no se puede hacer por que list es de tipo estudiante no docente
        // list.add(docente1); //

        // si quiero añadir a esta lista un docente, da error, al igual que si se intenta
        // añadir el docente con un cast (da error de que no se puede convertir)
        // por tanto tenemos que crear otro array de tipo docente.
        // Se puede solucionar el problema con el polimorfismo
        // creando instanciando cada subclase a través de la clase padre
        // es decir tanto estudiante y docente declararlo como persona
        Persona estudiante3 = new Estudiante("Esther Diez", 52118323,1);
        Persona estudiante4 = new Estudiante("Maria Gonzalez", 56643,1);

        Persona docente3 = new Docente("Juan carlos",444, 20);
        Persona docente4 = new Docente("lucas Fernadez", 542, 40);

        List<Persona> list2 = new ArrayList<>();
        list2.add(estudiante3);
        list2.add(estudiante4);
        list2.add(docente3);
        list2.add(docente4);

   	    for(Persona p: list2) {
            System.out.println("p = " + p.toString());
        }
    }
}
```

El polimorfismo es una ventaja enorme



Si queremos modificar algo de alguna de las subclases, no puedo, los métodos que nos aparecen son los del padre. Para que aparezcan los que queremos utilizar, hay que castearlo. 

![image-20241124203312531](/home/soa/.config/Typora/typora-user-images/image-20241124203312531.png)

Ejemplo:

```java
((Docente)docente3).setCanHorasClase(35);
```

![image-20241124203411866](/home/soa/.config/Typora/typora-user-images/image-20241124203411866.png)

Si por ejemplo solo quisiéramos listar las personas que son docentes, debemos usar **instanceof**:

```java
((Docente)docente3).setCanHorasClase(85);

for(Persona p: list2) {
    if (p instanceof Docente) {
        System.out.println("p.toString = " + p.toString());
    }
}
```



Nota: 

El operador **instanceof** **se utiliza principalmente para la comprobación de tipos en tiempo de ejecución**, lo que resulta especialmente útil en situaciones de polimorfismo y moldeado. Es decir, **verifica si un objeto es una instancia de una clase específica o una interfaz** . La palabra clave instanceof compara la instancia con el tipo. El valor de retorno es true o false.

La clase **ArrayList** en Java, es una clase que permite almacenar datos en memoria de forma similar a los Arrays, con la ventaja de que el numero de elementos que almacena, lo hace de forma dinámica, es decir, que no es necesario declarar su tamaño como pasa con los Arrays.

Los principales métodos para trabajar con los ArrayList son los siguientes:

```java
// Declaración de un ArrayList de "String". Puede ser de cualquier otro Elemento u Objeto (float, Boolean, Object, ...)
ArrayList<String> nombreArrayList = new ArrayList<String>();
// Añade el elemento al ArrayList
nombreArrayList.add("Elemento");
// Añade el elemento al ArrayList en la posición 'n'
nombreArrayList.add(n, "Elemento 2");
// Devuelve el numero de elementos del ArrayList
nombreArrayList.size();
// Devuelve el elemento que esta en la posición '2' del ArrayList
nombreArrayList.get(2);
// Comprueba se existe del elemento ('Elemento') que se le pasa como parametro
nombreArrayList.contains("Elemento");
// Devuelve la posición de la primera ocurrencia ('Elemento') en el ArrayList  
nombreArrayList.indexOf("Elemento");
// Devuelve la posición de la última ocurrencia ('Elemento') en el ArrayList   
nombreArrayList.lastIndexOf("Elemento");
// Borra el elemento de la posición '5' del ArrayList   
nombreArrayList.remove(5); 
// Borra la primera ocurrencia del 'Elemento' que se le pasa como parametro.  
nombreArrayList.remove("Elemento");
//Borra todos los elementos de ArrayList   
nombreArrayList.clear();
// Devuelve True si el ArrayList esta vacio. Sino Devuelve False   
nombreArrayList.isEmpty();  
// Copiar un ArrayList 
ArrayList arrayListCopia = (ArrayList) nombreArrayList.clone();  
// Pasa el ArrayList a un Array 
Object[] array = nombreArrayList.toArray(); 
```

Otra cosa muy importante a la hora de trabajar con los ArrayList son los "Iteradores" ([Iterator](http://docs.oracle.com/javase/1.4.2/docs/api/java/util/Iterator.html)). Los Iteradores sirven para recorrer los ArrayList y poder trabajar con ellos. Los Iteradores solo tienen tres métodos que son el *"hasNext()"* para comprobar que siguen quedando elementos en el iterador, el *"next()"* para que nos de el siguiente elemento del iterador; y el *"remove()"* que sirve para eliminar el elemento del Iterador.

Ejemplo:

```java
A continuación se muestra el código de la lectura de los partidos de fútbol y como los almacenamos en un ArrayList. Por curiosidad, un partido de fútbol esta guardado en el fichero con la siguiente estructura: equipoLocal::equipoVisitante::golesLocal::golesVisitante

// Nos creamos un ArrayList de objetos de la Clase "PartidoFutbol"
System.out.println("... Nos creamos un ArrayList de objetos de la Clase "PartidoFutbol" ...");
ArrayList<PartidoFutbol> partidos = new ArrayList<PartidoFutbol>();

// Instanciamos el fichero donde estan los datos
File fichero = new File(nombreFichero);
Scanner s = null;

try {
	// Leemos el contenido del fichero
	System.out.println("... Leemos el contenido del fichero ...");
	s = new Scanner(fichero);
	// Obtengo los datos de los partidos de fútbol del fichero
	while (s.hasNextLine()){
		String linea = s.nextLine();	// Obtengo una linea del fichero (un partido de fútbol)
		String [] cortarString = linea.split("::");		// Obtengo los datos del partido de futbol
		PartidoFutbol partido = new PartidoFutbol();	// Creo un objeto de la clase "PartidoFutbol"

		// Pongo los atributos al objeto "partido"
		partido.setEquipoLocal(cortarString[0]);
		partido.setEquipoVisitante(cortarString[1]);
		partido.setGolesLocal(Integer.parseInt(cortarString[2]));
		partido.setGolesVisitante(Integer.parseInt(cortarString[3]));

		// Añadimos el objeto "partido" al ArrayList
		partidos.add(partido);
	}

} catch (Exception e) {
	e.printStackTrace();
} finally{
	try {
		if (s != null)
			s.close();
	} catch (Exception e2) {
		e2.printStackTrace();
	}
}

System.out.println("... Guardados "+partidos.size()+" partidos de fútbol  ...");
```

NOTA: documentación sacada de https://jarroba.com/arraylist-en-java-ejemplos/



# 13. Clases abstractas, interfaces y enumeradores

### Clases abstractas

Es aquella de la que no se pueden declarar instancias: 

1. Cuando tenemos un conjunto de **subclases** en que algún comportamiento está presente en todas ellas, pero se implementa de formas distintas en cada una, entonces creamos una clase abstract. Es decir, cuando tenemos algún comportamiento en las subclases que es común a todas las demás subclases, tiene atributos comunes a todas estas subclases, entonces estos métodos se llaman igual pero no se implementan igual.
2. El modificador **abstract** declara que la clase es una clase abstracta.
3. Una clase **abstracta** podría contener métodos abstractos (métodos sin implementación), pero también podría contener métodos que se implementan y atributos.
4. Una clase **abstracta** está diseñada para ser una superclase y no puede instanciarse.



Ejemplos de clase abstracta:

```java
abstract public class Mamifero {
    private String habitat;
    private float peso;
    private String color;

    abstract public void hacerRuido();
    abstract public void comer();
    abstract public void dormir();
    abstract public void mover();
}
```

Todos los mamíferos tienen un habitat, peso,color, hacen ruido, comen, duermen y se mueven, pero no todos se mueven igual, no se mueve igual una vaca que un delfín.1

La implementación de éstos métodos va a variar según quien vaya a heredar esta clase, pero van a heredar todos estos métodos y van a tener que implementarlos, y todos estos atributos.

Implementación: significa tener código dentro de un método por ejemplo:

```java
// método con implementación
public String soyHoja(){
    return "Soy abtract";
}
// método sin implementación
abstract public String imprimir();
```

Las clases que hereden de hoja, lo que van a tener que hacer es sobrescribir el método imprimir.

Las clases abstractas no se pueden instanciar (es una verdad a medias), no se puede instanciar a no ser que implemente los métodos.

Ejemplo: creamos un proyecto con las clases Hoja, Curriculum e Informe:

Clase Hoja:

```java
package net.youtics;

public abstract class Hoja {
    protected  String contenido;

    public Hoja(String contenido){
        this.contenido = contenido;
    }

    public String soyHoja(){
        return "Soy abtract";
    }

    abstract public String imprimir();
    
    @Override
    public String toString() {
        return "Hoja{" +
                "contenido='" + contenido + '\'' +
                '}';
    }
}
```

Clase Informe:

```java
package net.youtics;

public class Informe extends Hoja {
    private String autor;
    private String revisor;
}
```

Creamos la clase Informe que herede de Hoja, según declaramos la clase da error porque nos dice que hay que implementar los métodos.

![image-20241124220201104](/home/soa/.config/Typora/typora-user-images/image-20241124220201104.png)

![image-20241124220231518](/home/soa/.config/Typora/typora-user-images/image-20241124220231518.png)

```java
@Override
public String imprimir() {
    return "";
}
```

Creamos el constructor con los atributos de la clase padre Hoja, con super:

```java
public Informe(String contenido, String autor, String revisor) {
    super(contenido);
    this.autor = autor;
    this.revisor = revisor;
}
```

Modificamos el método imprimir, para que imprima el autor y el revisor:

```java
@Override
public String imprimir() {
    return "Autor: "+this.autor+" \n"+
            "Revisor: "+this.revisor+" \n"+
            "Conteido: "+super.toString();
}
```





Clase Curriculum:

```java
package net.youtics;

import java.util.ArrayList;

public class Curriculum extends Hoja {
    private String persona;
    private String carrera;
    private ArrayList<String> experiencia;

    // modificamos el contructor para que la experiencia no le llegue como argumento
    // public Curriculum(String contenido, String persona, String carrera, ArrayList<String> experiencia) {
    public Curriculum(String contenido, String persona, String carrera) {
        super(contenido);
        this.persona = persona;
        this.carrera = carrera;
        // modificamos esta variable para que en lugar de que le llegue como argumento
        //
        // this.experiencia = experiencia;
        // cambiar por crear un nuevo con new
        this.experiencia = new ArrayList<>();
    }

    // Creamos un metodo para añadir experiencias
    public void addExperiencia(String exp){
        this.experiencia.add(exp);
    }

    public String getPersona() {
        return persona;
    }

    public void setPersona(String persona) {
        this.persona = persona;
    }

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }

    public ArrayList<String> getExperiencia() {
        return experiencia;
    }

    public void setExperiencia(ArrayList<String> experiencia) {
        this.experiencia = experiencia;
    }

    @Override
    public String imprimir() {
        return "Persona: "+this.persona+" \n"+
                "Carrera: "+this.carrera+" \n"+
                "Experiencia: "+this.experiencia+" \n"+
                "contenido: "+super.toString();
    }

    @Override
    public String toString() {
        return "Curriculum{" +
                "persona='" + persona + '\'' +
                ", carrera='" + carrera + '\'' +
                ", experiencia=" + experiencia +
                ", contenido='" + contenido + '\'' +
                '}';
    }
}

```

Clase Main:

```java
import net.youtics.Hoja;

public class Main {
    public static void main(String[] args) {

        Hoja hoja = new Hoja("Soy abs");
    }
}
```

Esta clase así da error:

![image-20241124214028970](/home/soa/.config/Typora/typora-user-images/image-20241124214028970.png)

Para solucionar el error hay que implementar los métodos:

![image-20241124215013293](/home/soa/.config/Typora/typora-user-images/image-20241124215013293.png)

```java
import net.youtics.Hoja;

public class Main {
    public static void main(String[] args) {

        Hoja hoja = new Hoja("Soy abs") {
            @Override
            public String imprimir() {
                return "";
            }
        };
    }
}
```

OJO: Se puede instanciar, pero no es lo ideal. Cuando creamos una clase abstracta es para que los métodos que hay que sobrescribir, los sobrescriban las subclases que heredan de esa clase.



La clase main quedaría:

```java
import net.youtics.Curriculum;
import net.youtics.Hoja;
import net.youtics.Informe;

public class Main {
    public static void main(String[] args) {

        Curriculum cv = new Curriculum("Contenido cv", "Leo Messi", "PSG");
        cv.addExperiencia("Campeón del mundo");
        cv.addExperiencia("Balón de oro");
        cv.addExperiencia("Barcelona");

        imprimirAbs(cv);
        System.out.println("===============");

        Informe inf = new Informe("Contenido del informe", "Dibu Martinez","Rodrigo de Paul");

        imprimirAbs(inf);
    }

    public static void imprimirAbs(Hoja hoja){
        System.out.println("hoja.imprimir() = " + hoja.imprimir());

    }
}
```

Esto nos mostraría:

```bash
hoja.imprimir() = Persona: Leo Messi 
Carrera: PSG 
Experiencia: [Campeón del mundo, Balón de oro, Barcelona] 
contenido: Hoja{contenido='Contenido cv'}
===============
hoja.imprimir() = Autor: Dibu Martinez 
Revisor: Rodrigo de Paul 
Contenido: Hoja{contenido='Contenido del informe'}
```



Para esto también se utilizan las clases abstractas, el método imprimir es un método que primero fue implementado en curriculum de una forma y en informe de otra forma. Como ambos son Hojas, lo que nos permite la herencia y el polimorfismo, la posibilidad de también a partir de métodos abstractos poder sobrescribir estos métodos e implementarlos en las subclases de una manera distinta.



Pero que pasa si ahora creamos una clase Libro:

```

```

Esta clase libro no extiende de ningún lado, si extendiera de la clase hoja, como ya hablamos en la herencia, vamos a tener un problema, por que un libro no es una hoja.

Un libro es si se quiere un arreglo de páginas de hojas, podríamos crear la clase pagina y decir que es un arreglo de paginas, entonces aquí tendríamos varios problemas:

Vamos a crear la clase pagina (este diseño se empieza a complicar):

```

```

En su constructor Pagina utiliza un contenido, y ese contenido utiliza la clase padre. y sobrescribe (utiliza) el método imprimir.

Entonces vamos a la clase libro que ya no es de tipo hoja si no que es de tipo pagina, no se puede hacer un extend de Hoja, estaría mal, por que le estaría diciendo que el libro es una Hoja, y en realidad es un conjunto de páginas y de hojas si se quiere. Entonces esto nos presenta un problema y esto se soluciona con una interfaz.

```java
// Cambiamos
private ArrayList<Hoja> paginas;

// por
private ArrayList<Pagina> paginas;
```

Lo que deberíamos crear es una interfaz. La diferencia entre clase abstracta y una interfaz:

1. Las clases abstractas pueden tener métodos que se implementan en cambio las interfaces no se implementan a ningún método, son todos contratos.
2.  Las interfaces son un comportamiento y por lo tanto ese comportamiento, puede pertenecer a un conjunto de clases independientemente de su relación de parentesco. Por ejemplo una página es una hoja, un informe es una hoja, una foto podría ser una hoja, un curriculum es una hoja. Ahora un libro no es una hoja, entonces en las anteriores había una relación de herencia si yo hiciese una relación de herencia en Libro estaría haciendo algo que está mal, entonces necesitaría crear una interfaz por que si nos interesa el método imprimirAbs para imprimir cualquier cosa, para imprimir un curriculum, poder imprimir un informe y además poder imprimir un libro, necesitamos ver que todas las clases compartan el mismo comportamiento y eso se hace a través de las interfaces.



Para crear una interfaz, new -> Java class -> Interface

![image-20241125120012896](/home/soa/.config/Typora/typora-user-images/image-20241125120012896.png)

Interfaz imprimible, que va a tener un método:

```java
package net.youtics;

public interface Imprimible {
    public String imprimir();
}
```



Ahora hay que implementar la interfaz a libro

```java
public class Libro implements Imprimible{
```

Como voy a implementar esta interfaz, lo que nos va a pedir el editor es que implemente un método imprimir de tipo String porque lo que retorna es un String.

```java
package net.youtics;

import java.util.ArrayList;

public class Libro implements Imprimible{
    private ArrayList<Pagina> paginas;//Aqui nos da un error
    private String autor;
    private String titulo;
    private String genero;

    public Libro(String autor, String titulo, String genero) {
        // this.paginas = paginas;
        this.paginas = new ArrayList<>();
        this.autor = autor;
        this.titulo = titulo;
        this.genero = genero;
    }

    public void addPaginas(Hoja pagina){
            this.paginas.add(pagina);// aqui nos da un error
            return this;
    }

    public String imprimir() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Autor: ").append(this.autor)
                .append("\n")
                .append("Titulo: ").append(this.titulo)
                .append("\n")
                .append("Genero: ").append(this.genero)
                .append("\n")
                .append("Paginas: ");

        for(Hoja h: this.paginas){
            stringBuilder.append("\n")
                    .append(h.imprimir())
                    .append("\n");
        }
        return stringBuilder.toString();
    }
}
```

Aquí nos da un error en addPagina:

```java
public void addPaginas(Hoja pagina){
        this.paginas.add(pagina);
        return this;
}
```

Nos da el error porque al haber cambiado:

```java
private ArrayList<Hoja> paginas;

por
private ArrayList<Pagina> paginas;//Esto es más genérico
```



Para solucionarlo habría que cambiar:

```java
private ArrayList<Pagina> paginas;//Aqui nos da un error

// Deberíamos cambiarlo por 
private ArrayList<Hoja> paginas;//Aqui nos da un error
```

Lo que tendríamos que hacer es que pagina herede de hoja y pasarle hojas en lugar de paginas, aunque así tampoco serviría, por que lo que vamos a hacer es por ejemplo en el main crear un libro:

Añadir en clase main

```java
Libro libro = new Libro("Gabriel", "Java", Genero.CIENCIAFICCION);
libro.addPaginas(new Pagina("Pagina 1"));
libro.addPaginas(new Pagina("Pagina 2"));
libro.addPaginas(new Pagina("Pagina 3"));

imprimirAbs(libro);
```



Pero ahora daría error en los imprimirAbs de cv y de inf, para solucionarlo las clases curriculum e informe deberían implementar la interfaz imprimir.

Quedaría algo asi:

Clase main:

```java
import net.youtics.*;

public class Main {
    public static void main(String[] args) {

        Curriculum cv = new Curriculum("Contenido cv", "Leo Messi", "PSG");
        cv.addExperiencia("Campeón del mundo");
        cv.addExperiencia("Balón de oro");
        cv.addExperiencia("Barcelona");

        imprimirAbs(cv);
        System.out.println("===============");

        Informe inf = new Informe("Contenido del informe", "Dibu Martinez","Rodrigo de Paul");

        imprimirAbs(inf);

        Libro libro = new Libro("Gabriel", "Java", Genero.CIENCIAFICCION);
        libro.addPaginas(new Pagina("Pagina 1"));
        libro.addPaginas(new Pagina("Pagina 2"));
        libro.addPaginas(new Pagina("Pagina 3"));

        imprimirAbs(libro);
    }

    public static void imprimirAbs(Imprimible hoja){
        System.out.println("hoja.imprimir() = " + hoja.imprimir());

    }
}
```

Imprimible:

```java
package net.youtics;

public interface Imprimible {
    public String imprimir();
}
```

Libro

```java
package net.youtics;

import net.youtics.*;
import java.util.ArrayList;

public class Libro implements Imprimible{
    private ArrayList<Hoja> paginas;
    private String autor;
    private String titulo;
    private Genero genero;

    public Libro(String autor, String titulo, Genero genero) {
        // this.paginas = paginas;
        this.paginas = new ArrayList<>();
        this.autor = autor;
        this.titulo = titulo;
        this.genero = genero;
    }

    public void addPaginas(Hoja pagina){
            this.paginas.add(pagina);
            //return this;// me da error
    }

    public String imprimir() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Autor: ").append(this.autor)
                .append("\n")
                .append("Titulo: ").append(this.titulo)
                .append("\n")
                .append("Genero: ").append(this.genero)
                .append("\n")
                .append("Paginas: ");

        for(Hoja h: this.paginas){
            stringBuilder.append("\n")
                    .append(h.imprimir())
                    .append("\n");
        }
        return stringBuilder.toString();
    }
}
```

Clase Hoja

```java
package net.youtics;

public abstract class Hoja {
    protected  String contenido;

    public Hoja(String contenido){
        this.contenido = contenido;
    }

    public String soyHoja(){
        // return this;
        return this.contenido;
    }

    abstract public String imprimir();
}
```

Clase Pagina

```java
package net.youtics;

public class Pagina extends Hoja  {
    public Pagina(String Contenido) {
        super(Contenido);
    }

    @Override
    public String imprimir() {
        return contenido;
    }
}
```

Clase curriculum

```java
package net.youtics;

import java.util.ArrayList;

public class Curriculum extends Hoja implements Imprimible{
    private String persona;
    private String carrera;
    private ArrayList<String> experiencia;

    // modificamos el contructor para que la experiencia no le llegue como argumento
    // public Curriculum(String contenido, String persona, String carrera, ArrayList<String> experiencia) {
    public Curriculum(String contenido, String persona, String carrera) {
        super(contenido);
        this.persona = persona;
        this.carrera = carrera;
        // modificamos esta variable para que en lugar de que le llegue como argumento
        //
        // this.experiencia = experiencia;
        // cambiar por crear un nuevo con new
        this.experiencia = new ArrayList<>();
    }

    // Creamos un metodo para añadir experiencias
    public void addExperiencia(String exp){
        this.experiencia.add(exp);
    }

    public String getPersona() {
        return persona;
    }

    public void setPersona(String persona) {
        this.persona = persona;
    }

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }

    public ArrayList<String> getExperiencia() {
        return experiencia;
    }

    public void setExperiencia(ArrayList<String> experiencia) {
        this.experiencia = experiencia;
    }

    @Override
    public String imprimir() {
        return "Persona: "+this.persona+" \n"+
                "Carrera: "+this.carrera+" \n"+
                "Experiencia: "+this.experiencia+" \n"+
                "contenido: "+super.toString();
    }

    @Override
    public String toString() {
        return "Curriculum{" +
                "persona='" + persona + '\'' +
                ", carrera='" + carrera + '\'' +
                ", experiencia=" + experiencia +
                ", contenido='" + contenido + '\'' +
                '}';
    }
}
```

Clase Informe

```java
package net.youtics;

public class Informe extends Hoja implements Imprimible {
    private String autor;
    private String revisor;

    public Informe(String contenido, String autor, String revisor) {
        super(contenido);
        this.autor = autor;
        this.revisor = revisor;
    }

    @Override
    public String imprimir() {
        return "Autor: "+this.autor+" \n"+
                "Revisor: "+this.revisor+" \n"+
                "Contenido: "+super.toString();
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public String getRevisor() {
        return revisor;
    }

    public void setRevisor(String revisor) {
        this.revisor = revisor;
    }
}
```

Clase Genero

```java
package net.youtics;

public enum Genero {
    DRAMA,
    TERROR,
    CIENCIA_FICCION;
}
```

Hay que ir construyendo paso a paso, primero creamos las clases abstractas, las implementamos, luego implementamos una clase que necesitaba imprimir pero que no era de esa clase abstracta y luego al final tuvimos que crear una interfaz para meter a todos en la misma bolsa y poder reutilizar el método imprimirAbs de la clase main. Los curriculums, los informes y los libros utilizan el mismo tipo de dato (Imprimible que es una interfaz que hemos tenido que crear por que con la clase abstracta no era suficiente)



# 14. ArrayList y LinkedList

## Colecciones

Una colección representa un grupo de objetos. Esto objetos son conocidos como elementos. Cuando queremos trabajar con un conjunto de elementos, necesitamos un almacén donde poder guardarlos. En Java, se emplea la interfaz genérica **Collection** para este propósito. Gracias a esta interfaz, podemos almacenar cualquier tipo de objeto y podemos usar una serie de métodos comunes, como pueden ser: añadir, eliminar, obtener el tamaño de la colección… Partiendo de la interfaz genérica **Collection** extienden otra serie de interfaces genéricas. Estas subinterfaces aportan distintas funcionalidades sobre la interfaz anterior.

![image-20241128115511923](/home/soa/.config/Typora/typora-user-images/image-20241128115511923.png)

Son clases que utilizamos para almacenar y agrupar objetos. Tenemos dos grandes grupos:

- Collection: List y Set
- Map

Son dinámicos, es decir gestionan la memoria dinámica, no hay que dar el tamaño .

Tipos de agrupaciones:

- La API de colecciones de JAVA se utilizan para agrupar **objetos** y consta de tres tipos: **List, Set y Map**.
- Un **List** almacenará objetos en una secuencia determinada, es decir cada vez que agregamos un numero, una cadena, un objeto.., lo agregamos y eso respeta un orden. En estos se pueden agregar elementos duplicados.
- Un **Set** no permitirá elementos duplicados y no mantiene el orden de sus elementos, vamos a ir agregando sin orden, en el momento de listar, van a estar todos los elementos de forma desordenada.
- Un **map** (Mapas) almacenan información en base a pareja de llaves (keys, como un id único) y valores (values). Por ejemplo si voy a ingresar un cliente, este sería el valor y el dni por ejemplo sería el key.![image-20241126130536621](/home/soa/.config/Typora/typora-user-images/image-20241126130536621.png)

Los **arrayList** son arreglos dinámicos (no se define el tamaño). Java lo que hace es crear un arreglo con 10 posiciones, cuando se llenan todas, crea un arreglo nuevo con la información del anterior mas un 50% mas de posiciones, cuando estas se llenan, vuelve a hacer lo mismo y asi sucesivamente. Esto es importante, por que si vamos a hacer que crezca muy rápido, entonces esto tendría mucho costo, ya que estaría creando todo el rato.

Para obtener un valor en una posición X, si queremos eliminar un dato, tendríamos que ir moviendo cada dato a la posición la posición que le corresponde, por lo que también sería muy costoso.

Los **linkedList** son listas, a medida que vamos añadiendo se van creando nodos.

![image-20241126131136393](/home/soa/.config/Typora/typora-user-images/image-20241126131136393.png)

![image-20241126131209357](/home/soa/.config/Typora/typora-user-images/image-20241126131209357.png)

Cada bloque de datos es un nodo. Sabemos la dirección de memoria del nodo anterior, del nodo siguiente, cada nodo tiene su propia dirección de memoria. La ventaja es que si queremos agregar un dato en el medio, no tendríamos que copiar el contenido como en los arreglos, lo que hay que hacer es cambiar las direcciones de memoria a las que apunta. Las linkedList son listas doblemente enlazadas, por que tienen la dirección de memoria anterior y posterior. La primera y la ultima dirección contienen null para indicar que es el principio y el final de la lista.



En el caso de los vectores son arreglos, funcionan como los arrayList pero son sincronizados, es decir son recursos al cual se puede acceder de a uno al mismo tiempo, lo que quiere decir, que si hay alguien que está ocupando ese recurso, esa lista, ese vector, si otro quiere acceder va a tener que esperar, y ese costo espera obviamente un costo de tiempo y el costo de tiempo es importante. Tiene las mismas características de un arreglo pero como un recurso al que no se puede acceder muchos al mismo tiempo.

Podríamos tener una raiz y un link sincronizado si se puede configurar si se puede implementar digamos en ese tipo de estructuras pero  en el caso de vectores son ya directamente sincronizados.



Ejemplos:

```java
// Vamos a declarar un List siempre se declara el tipo de la interfaz genérica
List<tipo de dato a almacenar> nombre = new tipo_lista

import java.util.ArrayList;
import java.util.List;
List<String> arreglo = new ArrayList<>();

// Añadimos elementos
arreglo.add("Pepe");
arreglo.add("Maria");
arreglo.add("Luis");
arreglo.add("Juan");

System.out.println("arreglo = " + arreglo);
```

Esto nos mostraría:

```java
arreglo = [Pepe, Maria, Ana, Ale]
```

Para buscar elementos utilizamos el metodo get

```java
System.out.println("arreglo.get(1) = " + arreglo.get(1));
```

Donde 1 es la posición que queremos coger. Nos muestra: arreglo.get(1) = Maria



Si queremos eliminar un elemento:

```java
// Si queremos eliminar un elemento
arreglo.remove(1);
System.out.println("arreglo = " + arreglo);
```

Donde 1 es la posición a eliminar. Nos muestra:

```java
arreglo = [Pepe, Ana, Ale]
```



Si queremos modificar, o reemplazar una posicion:

```java
arreglo.set(0,"Lucas");
```

Donde 0 es la posición a modificar, y Lucas la cadena nueva.



Para mostrar los valores del arreglo de otra manera, podemos hacer un for:

```java
for(String cadena: arreglo){
    System.out.println("cadena = " + cadena);
}
```

Y esto nos mostraría:

```java
cadena = Lucas
cadena = Ana
cadena = Ale
```



Para buscar un contenido concreto:

```java
Boolean esta = arreglo.contains("Lucas");
System.out.println("esta = " + esta);
```

Devuelve true si lo encuentra y false en caso contrario.



Para ordenar, se hace con la interfaz Collections

```java
// Para ordenar, con la interfaz Collections
Collections.sort(arreglo);
System.out.println("arreglo = " + arreglo);
```

Nos muestra el arreglo ordenado:

```java
arreglo = [Ale, Ana, Lucas]
```



Si cambiamos el tipo de la declaración de ArrayList por LinkedList el funcionamiento es el mismo, si nos fijamos en el esquema anterior, ambos tipos comparten la misma interfaz (List)

```java
// List<String> arreglo = new ArrayList<>();
List<String> arreglo = new LinkedList<>();
```

No hemos tenido problema por que lo hemos declarado de manera genérica (polimórfica) con List en lugar de hacerlo en particular, podríamos haber echo tambien:

```java
ArrayList<String> arreglo = new ArrayList<>();
LinkedList<String> arreglo = new LinkedList<>();
```



La diferencia de ArrayList con LinkedList es que contiene un puntero con la dirección de memoria anterior y posterior.

Si queremos acceder a métodos propios de LinkedList tendremos que declarar la variable de tipo LinkedList en lugar de List o castear la variable.

Si declaramos como List:

```java
List<String> arreglo = new LinkedList<>();
```

Aparecen estos métodos:

![image-20241127103856775](/home/soa/.config/Typora/typora-user-images/image-20241127103856775.png)

Si lo declaramos como LinkedList aparecen otros métodos propios, para poder por ejemplo añadir al principio, al final,...:

```java
LinkedList<String> arreglo2 = new LinkedList<>();
```

De este modo aparecerían:

![image-20241127104021190](/home/soa/.config/Typora/typora-user-images/image-20241127104021190.png)

Si queremos añadir al principio:

```java
arreglo.addFirst("Gabriel");
```

Si queremos añadir al final:

```java
arreglo.addLast("Juan");
```



Si queremos recorrer esto, también lo podemos hacer con una clase genérica **ListIterator** en la que indicamos que tipo de dato vamos a recorrer

```java
ListIterator<String> iterator = arreglo.listIterator();
// si tenemos un siguiente elemento
if(iterator.hasNext())
{
    // con esto nos movemos una vez, cada vez que se le llame se mueve una vez mas
    String cadena = iterator.next();
    System.out.println("cadena = " + cadena);
}
```

Cada vez que nos movemos al siguiente elemento, lo que estamos haciendo es poniendo el puntero al inicio del dato anterior, lo que quiere decir que si hacemos siguiente, siguiente el puntero se pone al principio del tercer elemento.

```java
arreglo.add("Pepe");
arreglo.add("Maria");
arreglo.add("Ana");
arreglo.add("Ale");

String cadena = iterator.next();//se coloca el cursor al principio de Maria
cadena = iterator.next();//se coloca el cursor al princio de ana
System.out.println("cadena = " + cadena);//muestra maria
cadena = iterator.previous();// se coloca el cursor al principio de Maria
System.out.println("cadena = " + cadena);// muestra maria
```

Si queremos recorrer todos:

```java
// para ver todos hacemos un bucle
while (iterator.hasNext()){
    System.out.println("it = " + iterator.next());
}
```



# 15.Collections Map vs Set

Los **Set** y los **Map** se parecen en que ambos implementan un algoritmo **HashCode**, que se utiliza para no permitir elementos duplicados en estas colecciones. Los Set por detrás utilizan los **hashMap**, esto hace que a pesar de implementar interfaces diferentes en este caso, los Set que heredan de collection y los Map no.



### Set

![image-20241127113655928](/home/soa/.config/Typora/typora-user-images/image-20241127113655928.png)

Los HashSet no permiten elementos duplicados y también cuando vamos añadiendo elementos a la colección no respetan ningún orden, ningún orden de inserción.

La diferencia entre los HashSet y los TreeSet es que los TreeSet si son ordenados, es un árbol y por ello mantiene un orden, cada vez que añadimos , hay que reordenarlo y esto tiene un costo en la eliminación y en la inserción, por tanto los HashSet son un poquito más rápidos. Pero ambos no aceptan duplicados por el HashCode.

Los LinkedHashSet heredan de HashTag e implementan la interfaz HashSet, es lo mismo que un Hash pero implementado con una lista doblemente enlazada.

En los TreeSet en las búsquedas sacamos ventaja, por que los elementos están ordenados, los algorítmos de búsqueda van descartando el 50% de la información en cada etapa recursiva, ya que cada vez que se maneja un árbol se maneja recursividad.

En los LinkedHashSet al ser listas doblemente enlazadas, por lo que poseen las ventajas de movernos al siguiente, al anterior y una serie de métodos que nos facilitan e incluso a implementar, pilas, filas, etc.



### Map

![image-20241127114943620](/home/soa/.config/Typora/typora-user-images/image-20241127114943620.png)

No admite duplicados, estos contienen una key (elemento único) y un valor. Se utilizan mucho en Spring Boot para el manejo de atributos, mapeo de atributos en las vistas de un html a través de una clase que se llama Model e incluso directamente utilizando un HashMap. 

Los maps son muy utilizados en todos los lenguajes, no solo en Java, entonces es clave que cuando utilizamos un set, le pasamos un valor y se almacena, en el caso de los tree de una manera, en el caso de los hash de otra manera, pero en el caso de los map, le vamos a tener que proporcionar dos valores, key (identificador único) y el dato a almacenar.

Ejemplo:

Vamos a crear un HashSet que almacene cadenas.

```java
import java.util.HashSet;
import java.util.Set;

Set<String> cadenas = new HashSet<>();
cadenas.add("Pepe");
cadenas.add("Maria");
cadenas.add("Fer");
cadenas.add("Juan");

System.out.println("cadenas = " + cadenas);
```

Muestra:

```java
cadenas = [Fer, Juan, Maria, Pepe]
```

No respeta el orden de inserción.

Si volvemos a añadir:

```java
cadenas.add("Juan");
```

No lo añade, por que no admite duplicados.



Si queremos ordenarlo no se puede pasar un Set sino un List:

```java
Collections.sort(cadenas);// da error
```

Esto nos daría error, para ordenar hay que utilizar List

```java
Set<String> cadenas = new HashSet<>();
cadenas.add("Pepe");
cadenas.add("Maria");
cadenas.add("Fer");
cadenas.add("Juan");
cadenas.add("Carla");

System.out.println("cadenas = " + cadenas);
System.out.println("cadenas = " + cadenas.toString());


List<String> lista = new ArrayList<>(cadenas);
Collections.sort(lista);

System.out.println("lista = " + lista.toString());
```

Esto nos mostraría:

```java
cadenas = [Fer, Carla, Juan, Maria, Pepe]
cadenas = [Fer, Carla, Juan, Maria, Pepe]
lista = [Carla, Fer, Juan, Maria, Pepe]
```



Para buscar un elemento:

```java
Boolean esta = cadenas.contains("Fer");
System.out.println("esta = " + esta);
```

Retorna true por que existe la cadena a buscar.



Para modificar un elemento, primero tendría que buscar, eliminar y añadir:

```java
cadenas.remove("Fer");
cadenas.add("Martin");
```





Si cambiamos el HashSet por un TreeSet y ejecutamos el código, el funcionamiento es el mismo, pero muestra las inserciones ordenadas, puesto que es un tree y estos si son ordenados.

```java
Set<String> cadenas = new TreeSet<>();
```

Según vayamos añadiendo, se van ordenando, por lo que tiene un costo de balanceo.

Estos no tienen los métodos get, set,...



En los Maps se tienen que escribir dos valores, la key y el valor.

![image-20241127125507387](/home/soa/.config/Typora/typora-user-images/image-20241127125507387.png)

```java
Map<Integer,String> mapa = new HashMap<>();

mapa.put(0, "pepe");
mapa.put(1, "carla");
mapa.put(2, "luis");

System.out.println("mapa = " + mapa);
```

Esto nos muestra:

```java
mapa = {0=pepe, 1=carla, 2=luis}
```

Si intentamos añadir un elemento igual (misma key) no lo hace, por que no admite duplicados, el valor si puede ser el mismo, lo que no se puede repetir es la key.



Si en lugar de almacenar String , queremos almacenar Personas:

1. Creamos la clase Persona

   ```java
   package CollectionSet;
   
   public class Persona {
       public String nombre;
       public Integer dni;
   
       public Persona(String nombre, Integer dni) {
           this.nombre = nombre;
           this.dni = dni;
       }
   
       public void setNombre(String nombre) {
           this.nombre = nombre;
       }
   
       public void setDni(Integer dni) {
           this.dni = dni;
       }
   
       public Integer getDni() {
           return dni;
       }
   
       public String getNombre() {
           return nombre;
       }
       
       @Override
       public String toString() {
           return "Persona{" +
                   "nombre='" + nombre + '\'' +
                   ", dni=" + dni +
                   '}';
       }
   }
   ```

2. Instanciamos la clase persona y la añadimos al Map

   ```java
   Map<Integer, Persona> personas = new HashMap<>();
   
   Persona persona = new Persona("Pepe", 54322);
   System.out.println("persona.toString() = " + persona.toString());
   
   personas.put(0, persona);
   personas.put(1, persona);
   personas.put(2, persona);
   
   System.out.println("personas = " + personas);
   ```

   Esto nos muestra:

   ```java
   persona.toString() = Persona{nombre='Pepe', dni=54322}
   personas = {0=Persona{nombre='Pepe', dni=54322}, 1=Persona{nombre='Pepe', dni=54322}, 2=Persona{nombre='Pepe', dni=54322}}
   ```

   

Para buscar datos, podríamos buscar por el nombre, lo suyo es hacerlo por un dato único, para ello primero creamos varias personas.

```java
Map<Integer, Persona> personas = new HashMap<>();

Persona p1 = new Persona("Pepe", 54322);
Persona p2 = new Persona("Marcos", 222);
Persona p3 = new Persona("Luis", 333);
System.out.println("persona.toString() = " + p1.toString());

personas.put(0, p1);
personas.put(1, p2);
personas.put(2, p3);

System.out.println("personas = " + personas);


Persona encontrada = personas.get(2);
System.out.println("encontrada = " + encontrada);
```





Para eliminar el elemento con key 1:

```java
personas.remove(1);
```



Si al añadir los elemento lo hacemos de esta manera:

```java
Persona p1 = new Persona("Pepe", 54322);
Persona p2 = new Persona("Marcos", 222);
Persona p3 = new Persona("Luis", 333);
System.out.println("persona.toString() = " + p1.toString());

personas.put(10, p1);
personas.put(1, p2);
personas.put(2, p3);

System.out.println("personas = " + personas);
```

Los ordena por key, no se pueden duplicar, pero se utilizan para ordenar.



Para modificar, creamos un nuevo elemento "Veronica"

```java
Persona p4 = new Persona("Veronica", 333);

personas.put(2, p4);
```

Pone Veronica en el elemento donde key sea 2 (cambia Luis por Veronica).



Tenemos el método containsKey y containsValues para buscar una key o un valor y retorna un boolean.

En containsKey se envía el valor de la key, mientras que en containsValues se envía el objeto entero.

```java
Boolean esta1 = personas.containsKey(2);
System.out.println("esta1 = " + esta1);
Boolean esta2 = personas.containsKey(20);
System.out.println("esta2 = " + esta2);


Boolean esta3 = personas.containsValue(p4);
System.out.println("esta3 = " + esta3);
```





Para recorrer los elementos, se utiliza collection:

```java
Map<Integer, Persona> personas = new HashMap<>();

Collection<Persona> persona = personas.values();
for (Persona p: persona){
    System.out.println("p.nombre = " + p.nombre);
}
```

Nos muestra:

```java
p.nombre = Marcos
p.nombre = Veronica
p.nombre = Pepe
```

Para mostrar las keys

```java
Collection<Integer> keysPersonas = personas.keySet();
for(Integer keys: keysPersonas){
    System.out.println("key = " + keys);
}
```

Nos muestra:

```java
key = 1
key = 2
key = 10
```



