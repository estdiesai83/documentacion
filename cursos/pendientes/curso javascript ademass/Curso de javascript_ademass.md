# Curso de Javascript Nivel Junior

Es javascript nativo sin frameworks, consta de 6 capítulos:

# Capítulo 1. 

## 1. ¿Qué es JavaScript?

Es un lenguaje de los más utilizados.

- **Un lenguaje de programación**: 

  Es una herramienta que nos permite darle instrucciones a un ordenador a través de código estructurado, siguiendo la lógica de programación para que cuando lo completemos, pueda cumplir la función que nosotros queremos. Si queremos por ejemplo, crear un programa que sea una calculadora, tenemos que escribir instrucciones para darle a una máquina, en la que le vamos a decir que si ingresamos un número, le damos al botón de suma e introducimos otro número y le demos igual, ese número tiene que sumarse, y para que esto suceda, tenemos que darle esas instrucciones a los ordenadores.

  Un lenguaje de programación es como un arte en el que solucionamos los problemas y creamos soluciones a través de darle instrucciones a una máquina. En cualquier lado se usa la programación.

  

- **Interpretado**: Hay lenguajes compilados y los interpretados. Los compilados, son en los que escribimos un código y antes de poder ejecutarse, tiene que pasar por un programa (compilador) que traduce todo ese código y lo pasa a otro programa que lo interpreta y lo convierte a lenguaje binario. Para no tener que hacer todo este proceso, surgieron los lengujaes interpretados, como JavaScript, HTML, CSS (para aprender JavaScript es necesario saber HTML y CSS)

  En el lenguaje interpretado todo el código que escribimos no tiene que ser pasado a un compilador, si no que se pasa directamente a ejecutarse en el navegador que tiene una herramienta (interprete) que lo que hace es que todo ese código lo traduce en tiempo real, no necesita compilarse todo junto, y luego ejecutarse, si no que va orden por orden y se va ejecutanto algoritmicamente.

  

- **Orientado a Objetos**: 

  Es un lenguaje que abarca todos los conceptos y posibilidades que tiene un lenguaje de programación que es orientado a objetos, que son justamente, las clases, la herencia, el polimorfismo...

  

- **Imperativo**: 

  Todas las instrucciones van de línea a línea (paso por paso), o sea primero se ejecuta una instruccion, después otra, después otra y así, hay lenguajes de programación que se ejecuta todo junto y hasta que no este todo listo no se ejecuta en conjunto. 

  

- **Case Sensitive** (Upper and Lower Case): 

  Es sensible a mayúsculas y minúsculas.

  

- **Basado en prototipos / Instancias / classless**: 

  Generalmente cuando creamos un objeto lo creamos a través de instanciar clases, como es un lenguaje basado en prototipos, los objetos que creamos van a estar basados en otros objetos que fueron construidos por el equipo de desarrollo de JavaScript. O sea si creamos un objeto ese objeto que creamos, no es que nosotros lo creamos porque instanciamos la clase, si no porque nos estamos basando en un prototipo que ya venía de javascript.

  

- **Tipado débil:**

  El valor de las variables puede cambiar a lo largo del tiempo, el valor de los datos. Ej x=25 y luego x = dalto, la diferencia es que 25 es un número y dalto es un texto. Lo que permite es cambiar el tipo de datos de una variable.

  

- **Lenguaje dináminco:**

  La variable no se ajusta al dato, el dato se ajusta a la variable, por ejemplo en los lenguajes como Java, cuando queremos crear una variable lo que tenemos que hacer es int numero = 15, aquí en javascript decimos numero=15, cuando le decimos 15 lo que hace es que la variable se adapta al dato, es decir si es igual a 15, la variable va a ser de tipo numero, si le decimos = a dalto, la variable va a ser un texto.

  

- **ECHASCRIPT** (5.1 y 6 , 7,8)

  Hay muchas versiones, no se debe de trabajar con código de javascript antiguo, por que queda obsoleto, es poco práctico, consume más recursos, no es óptimo. Entonces vamos a trabajar con la versión 6 en adelante.



## 2. Editor de texto

Se podría escribir todo el código en el bloc de notas, pero no es recomendable, los editores de texto nos ayudan a desarrollar el código de manera más efectiva, podemos ver los colores de cada uno de los componentes, nos permite diferenciar lo que son variables, una función, un condicional, un dato y así es más fácil encontrar errores, escribir código, se ordena (identa) automáticamente, se tabula automáticamente (dejar espacios al principio). Ejemplo de editor: Sublime Tex 3, Atom, Visual Studio Code (se puede utilizar cualquiera). 

En los editores de texto se pueden instalar plugins para que sea más fácil.

Instalar sublime en ubuntu

```bash
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null

echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

sudo apt-get update

sudo apt-get install sublime-text
```

Una vez instalado, para instalar los pluggings que queramos, pulsar en **CTRL + SHIFT + P** y buscamos lo que queramos instalar.

Buscamos:  **install package Control** y con esto instalamos el paquete de control.

![image-20250117004707279](/home/soa/.config/Typora/typora-user-images/image-20250117004707279.png)

Queremos instalar los paquetes de **black bird y brogrammer**

Personalizamos Sublime Text 3:

- Install Package Control

- Set UI  

  ![image-20250117100953604](/home/soa/.config/Typora/typora-user-images/image-20250117100953604.png)

- Color Scheme (Brogrammer)

- LiveReload: permite actualizar la página en tiempo real.

- ColorHelper: nos añade por ejemplo el color y al pulsar la paleta de colores para poder el color que queremos utilizar.

- ColorPicker

Para utilizarlos podemos ir al menu :

- Preferences -> Color Schema y seleccionar black bird 
- Preferences -> Theme y seleccionamos brogrammer



Al seleccionarlos el contenido de un archivo html se vería así, con estos colores

![image-20250117101441718](/home/soa/.config/Typora/typora-user-images/image-20250117101441718.png)

Al instalar el paquete colorhelper al lado de green nos aparece un cuadradito con el color al que corresponde y si pulsamos nos aparece la paleta de colores.

![image-20250117101804555](/home/soa/.config/Typora/typora-user-images/image-20250117101804555.png)





Vamos a crear un archivo index.html, lo guardamos en una carpeta donde guardaremos nuestras pruebas.

Ahora si empezamos a escribir <html> y pulsamos en intro nos completa el código:

```html
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
</head>
<body>

</body>
</html>
```

Y le creamos un style en el body

```html
<body>
<style>
	* {
		background-color: green;
	}
</style>  
</body>
```

Si ejecutamos el archivo en el navegador se verá algo así:

![image-20250117102125931](/home/soa/.config/Typora/typora-user-images/image-20250117102125931.png)



### ¿Para qué se usa?

- Dinamismo de los sitios web.

  Para que sea dinamicos desde el lado del cliente, porque en el servidor se trabaja con node js o en tecnologías como por ejemplo deno que es una nueva tecnología. 

- Servidor en NodeJS. Como tecnología Backend.

- Tecnologías Frontend como Angular, React o Vue.JS que son todos frameworks, que nos permimten crear código de una forma más épica, más sencilla, muchas veces nos reducen un montón el código, a veces es más óptimo



Otros usos no tan comunes:

- Inteligencia Artificial. Google creó una librería que se llama tensor Flow, para que se pueda trabajar con  inteligencia artifical.
- Placas electrónicas (Jhonny Five). Ya que con Node js, se puede programar con una tecnología que se llama Johnny 5 placas electrónicas como arduino por ejemplo.
- Mobile Apps. Se pueden crear aplicaciones móviles mediante  uno que otro compilador
- Desktop Apps. Se pueden crear aplicaciones de escritorio.
- Etc...



Con Javascript se pueden validar formularios, se pueden crear sistemas de usuario, hasta se pueden crear juegos.



## 3. Cómo enlazar Javascript

### 3.1 En línea.

Poniéndolo en una etiqueta, por ejemplo en un <h1>, una forma de hacerlo es con eventos, por ejemplo onclick

```html
<h1 onclick="alert('prueba javascript')">Hola</h1>	
```

Al actualizar la página y pulsar sobre el texto de hola, aperecerá el mensaje de alert 

![image-20250127125008167](/home/soa/.config/Typora/typora-user-images/image-20250127125008167.png)



### 3.2 Como contenido  en la etiqueta <script>

Dentro del archivo html en el body

```html
<script type="text/javascript">
		alert('prueba javascript2');
</script>			
```

Con este código cuando actualicemos la página aparecerá el mensaje de alert directamente.



### 3.3 Como contenido en un archivo .js (De esta forma es en la que vamos a trabajar en el curso)

```html
<script src="codigo.js">
</script>
```

src equivale a source, src="nombre_archivo.js". Para ello hay que crear un archivo codigo.js que va a conterner y dentro de este archivo, metemos el código de javascript.

```javascript
alert("Hola");
```

Con este código cuando actualicemos la página aparecerá el mensaje de alert directamente.



### 3.4 Con un require. (por ahora no lo vamos a ver)



## 4. Variables

### 4.1 Concepto

Una Variable es un espacio de memoria en el que se puede almacenar algo. Se guarda en nuestro programa para utilizar la variable cuando se necesite.

```javascript
recipiente = "papel";
```

alert: es como una función que nos permite mostrar algo en pantalla. 



### 4.2 Scope

El **scope** es **el alcance que una variable tendrá en tu código**. En otras palabras, **decide a qué variables tienes acceso** en cada parte del código. Existen dos tipos de scope, el **scope global** y el **scope local**.

#### Scope Local

Cuando puedes acceder a una variable únicamente en cierta parte del código, también son conocidas como **variables locales**. Un ejemplo de esto es **cuando una variable está declarada dentro de un bloque o una función**. Si tratas de acceder a esta variable fuera de esta función o bloque, tendrás un error que dirá que la variable no está definida.

```javascript
function platzi() {
	const soyEstudiante = true;
	console.log(soyEstudiante);
}

platzi(); // true
console.log(soyEstudiante); // soyEstudiante is not defined
```

#### Scope Global

Se dice que una variable está en el **sope global** cuando **está declarada fuera de una función o de un bloque**. Conocidas como **variables globales**. Puedes acceder a este tipo de variables desde cualquier parte de tu código, ya sea dentro o fuera de una función.

```javascript
const soyEstudiante = true;

function platzi() {
	console.log(soyEstudiante);
}

platzi(); //true
console.log(soyEstudiante); //true
```

A pesar de que JavaScript nos permite declarar una variable como global, no es una buena práctica. Una de las razones es porque tenemos la posibilidad de declarar dos variables globales en distintas partes del código con el mismo nombre sin notarlo.



### 4.3 Declarar e inicializar variables

Las variables se pueden declarar, inicializar y modificar a lo largo del tiempo.

Cuando declaramos una variable tenemos 3 formas de declararlas: Var, Let y Const.

Para declarar e inicializar una variable numero por ejemplo:

```javascript
var numero = 15;
```

Actualmente se utiliza let, por que no nos limita el alcance de la variable a el bloque en el que la ejecutamos. En cambio var tiene un alcance global.

**Como declarar una variable:**

Declarar es definir que tipo de alcance va a tener la variable, no tiene por que tener asignado ningún valor. 

**Let**: limita el alcance al bloque en el que la declaramos, es un alcance regional.

**Var**: no limita el alcance, es global.

**Const**: Es una constante, siempre tiene el mismo valor. No se pueden volver a inicializar (solo se inicializa una vez). SE TIENE QUE INICIALIZAR EN LA MISMA LÍNEA CUANDO SE DECLARA, si no da un error. No se puede inicializar después en otra línea.

```javascript
Const numero = 19;
numero = 34; //esto nos da un error
```

Si le modificamos el valor a la variable de tipo Const, nos da un error, pero no nos da en consola, ni en pagina visible en el navegador, el error aparece al pulsar en el navegador F12 y ahí nos aparece el error:

![image-20250127170721364](/home/soa/.config/Typora/typora-user-images/image-20250127170721364.png)

Nos da un error porqué a las variables constantes, no se les puede cambiar el valor, las definimos una vez y ya no las podemos definir nunca más. Un ejemplo útil puede ser para el valor de la variable pi 3,14 o cualquier tipo de variable, que sabemos que no va a cambiar durante el programa, 



**Inicializar una variable:**

Asignar un valor a una variable.

 

Se puede declarar e inicializar una variable en una misma línea:

```javascript
let numero = 29; 
```

Se puede declarar e inicializar una variable en dos líneas:

```javascript
let numero;
numero = 29;
```



Al final de cada línea poner ; para evitar problemas.



### 4.4 Tipos de datos primitivos: 

Son primitivos por que vienen dados por el lenguaje de javascript.

#### String

Es una cadena de texto, tenemos 3 formas de escribirlas:

1.  **Con comillas simples.**

   ```javascript
   let frase = 'Esto es un ejemplo';
   ```

2. **Con comillas dobles.** 

   Todo el texto son caractéres unidos, cada letra es un caracter, inclusive el espacio.

   ```javascript
   let mensaje = "¡Hola, mundo!";
   ```

3. **Comillas Invertidas (template strings)**

   Las comillas invertidas (\`), permiten crear *strings* multilínea e incrustar expresiones dentro de un *string* utilizando `${}`:

   ```javascript
   let nombre = "Alice"; 
   let edad = 30; 
   let saludo = `Hola, mi nombre es ${nombre} y tengo ${edad} años.`;
   ```

4. **Strings multilínea**

   Las comillas invertidas también facilitan la creación de *strings* multilínea sin la necesidad de concatenar

   ```javascript
   let poema = ` En un lugar de la Mancha, de cuyo nombre no quiero acordarme, no ha mucho tiempo que vivía un hidalgo... `;
   ```

5. **Secuencias de escape para caracteres especiales**

   Las secuencias de escape (por ejemplo, `\n` para salto de línea) permiten insertar caracteres especiales en un *string*:

   ```javascript
   let direccion = "Calle Principal\nCiudad";
   ```

6. **Constructor String**

   También puedes crear un objeto *string* utilizando el constructor `String`:

   ```javascript
   let nuevoString = new String("¡Hola, soy un nuevo objeto string!");
   ```

   **Manipular strings con métodos útiles**

   JavaScript proporciona una serie de métodos incorporados para manipular y trabajar con *strings* de manera eficiente. Algunos de ellos son:

   - `length`: devuelve la longitud de un *string*.
   - `toUpperCase()`: convierte un *string* en mayúsculas.
   - `toLowerCase()`: convierte un *string* en minúsculas.
   - `concat()`: concatena dos o más *strings*.
   - `trim()`: elimina espacios en blanco al inicio y final de un *string*.
   - `substring()`: extrae una porción de un *string*.

   

#### Number

Es un número, los números van sin comillas (de lo contrario un "19" entre comillas sería una cadena de texto)

```javascript
let numero = 19;
```

#### Boolean

Pueden tener solo dos valores: 0 y 1, pero lo traducimos como false o true. (Significa paso de señal o no paso de señal).

#### Symbol



### 4.3 Casos especiales de Datos: undefined, null, Nan. 

Son 3 tipos de datos que nos habla de que la variable no está definida, inicializada o hay un error.

#### Undefined

Es un valor primitivo que se asigna automáticamente a las variables que están declaradas pero no inicializadas. También se devuelve cuando se intenta acceder a una propiedad que no está definida en un objeto.

La variable existe en el programa pero no tiene valor, esta sin definir el valor. No es un error, es un tipo de dato, es útil para evitar errores y comportamiento inesperados en tu aplicación. 

Al detectar undefined, puedes tomar medidas preventivas y asegurarte de que tu código maneje adecuadamente estas situaciones.

Cuando estás trabajando con formularios o entradas de usuario en una aplicación web, *undefined* en JS puede ser tu aliado. Puedes usarlo para verificar si los campos obligatorios se han completado. Por ejemplo, al validar un formulario de registro, puedes comprobar si los campos de nombre de usuario y contraseña han sido completados antes de enviar los datos al servidor.

**Puede ser útil utilizar \*undefined\* para reflejar estados incompletos o no definidos**. Por ejemplo, si estás construyendo una aplicación que permite a los usuarios guardar información opcional en su perfil, puedes utilizar *undefined* para indicar que ciertos campos están vacíos o no han sido configurados.

Al usar *undefined* en condicionales, puedes simplificar el flujo de tu código. Puedes verificar directamente si una variable es *undefined* o no en lugar de depender de valores falsos o verdaderos. Esto puede hacer que tus condicionales sean más claros y legibles, lo que facilita la comprensión del flujo de tu programa.

```javascript
let nombre; 
if (nombre === undefined) { 
	console.log("La variable 'nombre' es undefined."); 
} else { 
	console.log("La variable 'nombre' tiene un valor definido."); 
}
```

Cuando intentas acceder a una propiedad que no existe en un objeto, JavaScript devolverá *undefined*. Por ejemplo:

```javascript
const persona = { 
  nombre: "Ana", 
  edad: 30 
}; 
console.log(persona.profesion); // Devuelve undefined
```

Puedes evitar errores al trabajar con propiedades inexistentes utilizando condicionales para verificar si la propiedad está definida antes de acceder a ella. Por ejemplo:

```javascript
if (persona.profesion) { 
	console.log(`Profesión: ${persona.profesion}`); 
} else { 
	console.log("La profesión no está definida."); 
}
```



Se puede consultar con `typeof`.

```javascript
var variable;
if (typeof variable === "undefined") {  
	console.log('ok');
}
```

Aunque estrictamente no es parte de la especificación del lenguaje EcmaScript, en todas las implementaciones **existe una variable global que contiene este valor y que se denomina también `undefined`**, por lo que podemos hacer comparaciones de este tipo:

```javascript
var variable;
if (variable === undefined) {  
	console.log('ok');
}
```

Un error que se comete a menudo, y que no tienen ningún sentido, es **comparar la variable `undefined` con el resultado de `typeof`**. Esta comparación siempre devolverá `false`, ya que `typeof` siempre devolverá una cadena de texto con el tipo.

```javascript
var variable;
if (typeof variable === undefined) {  
  console.log('ok'); // No se ejecuta
}
```

Otro problema al comparar con la variable `undefined`, es que **si la variable que estamos analizando no ha sido definida con `var`, `let` o `const` la comparación producirá un error**. Por ello, siempre **es recomendable utilizar `typeof` para comprobar si se ha definido una determinada variable**.

También tenemos que tener en cuenta que **`undefined` no es una palabra reservada de Javascript y por lo tanto podemos definir una variable con ese nombre**. 



#### Null 

Si ponemos:

```javascript
Let numero = null;
```

Esto nos dice que la variable está vacía, pero esto es intencional, hay una diferencia entre undefined y null. Undefined es que la variable no está definida (inicializada), que no tiene ningún valor, pero null le decímos que si tiene un valor y ese valor es que no va a tener un valor, o sea el valor es que va a estar vacía, va a ser nula, no va a valer nada, simplemente le vamos a decir que es null.

Es una variable vacía, pero la declaramos vacía. En otros lenguajes decir "Null" o Vacío/0 si afecta, pero en Javascript está bien dicho Null es "Nulo o vacío".

Undefined es que temporalmente no le hemos dado un valor, pero null, si le dimos valor, valor vacío. Null si esta definida, mientras que undefined no. Null si esta inicializada a vacío, mientras que undefined no está inicializada, solo esta declarada, no existe el valor todavía.

**En resumen, variable con null está declara e inicializada con null (vacío) y undefined, está solo declarada, no esta inicializada todavía, no tiene aún ningún valor. **





El caso del valor nulo es también bastante singular. En este caso **`null` es un literal definido en la especificación del lenguaje**, no una variable global como en el caso `undefined`, por lo tanto, es una palabra reservada y no podremos utilizarla como nombre de variable.

Podemos directamente **utilizar el literal `null` para comprobar este valor** es el que contiene una determinada variable o es el retorno de una función.

```javascript
var variable = null; 
if (variable === null ) {
	console.log( 'ok' ); 
}
```

A diferencia de `undefined`, `null` no dispone de un tipo específico y **en el caso de preguntar con `typeof` sobre un elemento con valor `null` nos dirá que es un objeto**, lo cual puede desconcertarnos, ya que en la práctica no podemos tratarlo como al resto de objetos.

```javascript
var variable = null; 
if ( typeof variable === "object" ) {
	console.log( 'ok' ); 
}
```

Que `null` es un objeto es algo peculiar y debemos tener en considerar que **una variable que dice ser un objeto realmente puede contener `null`** y producir un error en nuestro código si lo lo validamos.



#### Nan

Si ponemos:

```javascript
Let numero = 5;
Let numero2 = "pedro";

alert(numero * numero2);
```

Esto nos retorna Nan (no es un número), no se puede multiplicar texto.

Cuando trabajamos con valores numéricos **tenemos que tener en cuenta la existencia de `NaN` (\*Not a Number\*)**. Aunque realmente sí es un valor de tipo numérico, no podemos operar con él como con el resto de valores numéricos, ya que cualquier operación que se realice con `NaN` siempre devolverá `NaN`.

Normalmente **se obtiene `NaN` como resultado de las operaciones con funciones y métodos de `Math`** donde no ha sido posible convertir un valor a numérico o se ha producido algún error. Ejemplos sencillos en los que se obtiene este tipo de valor son:

```javascript
Math.sqrt(-1); 
parseInt( 'no' );
```

El *problema* a la hora de comprobar si un valor es `NaN` es que **si usamos `typeof` nos dirá que es un valor numérico** y podemos considerar que tenemos entre manos un número válido.

El segundo problema es que para comprobar si es un número no válido **no podemos comparar con la variable global con nombre `NaN`, ya que siempre obtendremos `false`** (`NaN === NaN` siempre devuelve `false`). Como consecuencia no podemos comparar `NaN` de una forma *natural*.

```javascript
var variable = parseInt( 'xxx' ); 
if (typeof variable === 'number') {
	console.log( 'Is a number' );   // Se ejecuta 
} 
if (variable === NaN) {    
	console.log( 'Is NaN' );    // No se ejecuta 
}
```

Para resolver este problema **existe la función `isNaN()`**, y desde ES6 también la encontramos como `Math.isNaN()`. Esta función devolverá verdadero si el valor pasado como parámetro es `NaN` o no es un valor numérico. Esto complica bastante el trabajo con este tipo de valor.

```javascript
var variable = parseInt( 'xxx' ); 
if (isNaN(variable)) {
	console.log( 'Is NaN' );    // Se ejecuta 
}
```

En este caso también tenemos que tener en cuenta que **`NaN` no es una palabra reservada de Javascript y por lo tanto podemos definir una variable con ese nombre**. Igual que en el caso de `undefined`, si intentamos cambiar esta variable en el contexto global nos encontraremos que ha sido definida como `{writable: false, configurable: false}` y no podemos cambiarla, pero sí podemos hacerlo dentro del alcance de una función, aunque de nuevo es una muy mala idea:

```javascript
function test() {    
	var variable = 10;   
    var NaN = 10;   
    if (variable === NaN) {   
    	console.log( 'ok' );  // Se ejecuta    
    } 
}
```



### 4.5 Hoisting

Nos indica como funcionan las fases de creación y de ejecución, lo que se suele decir por ejemplo es que cuando nosotros creamos un código lo que hacen es por ejemplo agarrar y poner todo lo que son las funciones y  las creaciones de variables al comienzo del programa y después ejecutar el resto.

Pero esto es mentira, esto no funciona así, así que tienen que tener el cuenta que el Hosting habla acerca de cómo funciona una cosa y cómo funciona la otra. 

Que pasa si por ejemplo primero pongo un alert de una variable y después la inicializo:

```javascript
alert(numero);
let numero = 3;
```

Esto debería de funcionar por que primero le dije que me muestre el número y después lo declaré, esto nos lanzaría un error.

En cambio si la declaro, la muestro y después la inicializo, no daría error, nos mostraría undefined.

En cambio con las funciones se pueden hacer llamadas  a una función y después crearla.

En Javascript es posible que en algunas partes, se pueda ejecutar antes de crear,

 

### 4.6 Crear múltiples variables 

Para crear varías variables de manera múltiple hay que separar cada una con ,

```javascript
Let nombre1 = "Jorge", nombre = "Pedro";
```

Aunque queda mejor indentado hacerlo en varias líneas.

```javascript
Let nombre1 = "Jorge";
Let nommbre = "Pedro";
```

La indentación se refiere a la técnica de **agregar un espacio inicial (indentado) al principio de las líneas de código**, que ayuda a delimitar visualmente los bloques y estructuras de control.

Para hacer el indentado **se agregan espacios o tabulaciones** al principio de las líneas de código y resaltar la jerarquía de las estructuras de control, como bucles, condiciones y funciones.

La indentación adecuada **permite que el código sea más fácil de entender y mantener**, ya que ayuda a identificar rápidamente los bloques de código y las relaciones entre ellos. Además, facilita la detección de errores y mejora la colaboración en proyectos de programación.

#### Indentación no significativa

La indentación no significativa se utiliza en lenguajes de programación como C#, Java y C++. En estos lenguajes la indentación del código no tiene un significado semántico, y únicamente tiene efectos visuales para mejorar la legibilidad.

En estos lenguajes, la estructura del código se define mediante el uso de llaves `{}` u otras palabras clave específicas como `end` para delimitar bloques de código.

C, C++, C#, Java, JavaScript:

```
public static void CalcularDescuento(decimal precio)
{
	// <---- esa indentación es meramente visual
	if (precio > 100)
	{
		decimal descuento = precio * 0.1m;
		decimal precioFinal = precio - descuento;
		Console.WriteLine("Se aplica un descuento del 10%");
	}
	else
	{
		Console.WriteLine("No se aplica descuento");
	}
}
```

En este caso, la indentación en estos lenguajes es opcional, y es únicamente una **convención de estilo utilizada para mejorar la legibilidad del código fuente**.

De hecho, **la mayoría de IDE proporcionan herramientas de autoformato**, que permiten aplicar el indentado automáticamente al código, sin tener que hacer nada más que pulsar un botón o una combinación de teclas.

#### Indentación significativa

Por otro lado, la indentación significativa se utiliza en lenguajes como Python o CoffeScript. En estos, los bloques de código se definen mediante la propia indentación, en lugar de emplear llaves u otras palabras clave para delimitarlos.

Python:

```python
def calcular_descuento(precio):
	# aqui la indentación es la que define el bloque
    if precio > 100:
        descuento = precio * 0.1
        precio_final = precio - descuento
        print("Se aplica un descuento del 10%")
    else:
        print("No se aplica descuento")
```

En estos lenguajes, la intentación es semántica, es decir, tiene significado. Por tanto es obligatoria y necesaria, y usarla incorrectamente conlleva errores de sintaxis o de ejecución.



### 4.7 Pruebas con prompt

Prompt es una API de javascript que permite al usuario de manera dinámica introducir un dato, si ponemos por ejemplo:

```javascript
prompt("Introduce nombre")
```

Nos muestra en el navegador:

![image-20250128122955776](/home/soa/.config/Typora/typora-user-images/image-20250128122955776.png)

La función **prompt** nos va a devolver un valor, que va a ser lo que introducimos, que se guarda en una variable.

```javascript
Let nombre = prompt("Introduce nombre");
```

Con lo cual, se guarda en la variable nombre.



## 5. Operadores en JavaScript

### 5.1 Operadores de Asignación.

Toman valores numéricos (ya sean literales (tipos de objetos ((constantes))) o variables) como sus operandos y retornan un valor numérico único.

Asigna un valor al operando de la izquierda basado en el valor del operando de la derecha.

Tipos de Operadores de asignación:

| Nombre                                              | Abreviación | Significado |
| --------------------------------------------------- | ----------- | ----------- |
| Asignación                                          | x = y       | x = y       |
| Asignación de adicción (suma)                       | x += y      | x =  x + y  |
| Asignación de sustracción (resta)                   | x -= y      | x = x - y   |
| Asignación de multiplicación                        | x *= y      | x = x * y   |
| Asignación de división                              | x /= y      | x = x / y   |
| Asignación de resto                                 | x %= y      | x = x % y   |
| Asignación de exponenciación                        | x **= y     | x = x ** y  |
| Asignación de desplazamiento a la izquierda         | x <<= y     | x = x << y  |
| Asignación de desplazamiento a la derecha           | x >>= y     | x = x >> y  |
| Asignación sin signo de desplazamiento a la derecha | x >>>= y    | x = x >>> y |
| Asignación AND                                      | x &= y      | x = x & y   |
| Asignación XOR                                      | x ^= y      | x = x ^ y   |
| Asignación OR                                       | x \|= y     | x = x \| y  |

Ejemplos:

Adiccion (suma)

```javascript
let numero = 10;
let numero +=5;
// es lo mismo que poner
numero = numero +5;
document.write(numero);
```

Ponemos un document.write(numero), es como un alert, pero dentro de la página, no sale una ventana emergente.



Operador de **asignación resto**: lo que hace es la division de dos numeros y lo que duelve es el resto de la división

```javascript
let numero = 10;
numero %= 5;
// Es lo mismo que poner
numero = numero&5;
document.write(numero);
```

Esto nos devuelve 0, ya que el resultado de la división es 5 con resto 0.



Asignación de exponenciación:

```javascript
let numero = 10;
numero **= 2;// exponente
document.write(numero); 
```

Nos retorna 100, lo que hace es 10 elevado a 2 (cuadrado) (10*10)



El resto de operadores de asignación (los de desplazamiento, AND, XOR y OR) son operadores avanzados en lo que se utilizan bits, números binarios,... (No los vamos a ver).



### 5.2 Operadores Aritméticos.

Toman valores numéricos (ya sean literales o variables) como sus operandos y retornan un valor numérico único. Permiten realizar operaciones matemáticas aritméticas, es decir las operaciones básicas (suma, resta, multiplicación, división)

Pueden dividirse en dos grupos: 

- **binarios** requieren de dos operandos.

  - Operador suma: +.

    ```javascript
    let numero1 = 10;
    let numero2 = 5;
    
    let resultado = numero1 + numero2;
    document.write(resultado);
    ```

    El resultado es 15

  - Operador resta: -.

    ```javascript
    let numero1 = 10;
    let numero2 = 5;
    
    let resultado = numero1 - numero2;
    document.write(resultado);
    ```

    El resultado es 5.

  - Operador producto: * (¡ojo! Utilizamos el asterisco y no la x).

  - Operador división: /.

  - Operador módulo o resto: % (¡cuidado! En programación no utilizamos el % para operaciones con porcentajes). 

    ```javascript
    let numero1 = 10;
    let numero2 = 5;
    
    let resultado = numero1&numero2;
    document.write(resultado);
    ```

    El resultado del resto de 10/5 es 0.

  - Operador exponencial: Calcula el exponente de un número.

    ```javascript
    let numero1 = 10;
    let numero2 = 2; // numero de exponente
    
    let resultado = numero1**numero2;
    document.write(resultado);
    ```

    El resultado de 10 elevado a 2 es 100.

- **unarios** se aplican sobre un solo operando.

  - Operador incremento: ++.

    ```javascript
    let numero1 = 10;
    numero1++;
    document.write(numero1);
    ```

    Esto incrementa el número en 1.

  - Operador decremento: – -.

    ```javascript
    let numero1 = 10;
    numero1--;
    document.write(numero1);
    ```

    Esto decrementa el número en 1.

  - Pasar a negativo un número

    ```javascript
    let numero1 = 10;
    
    let resultado = -numero1;
    document.write(resultado);
    ```

    El resultado es -10.

 

## 6. Concatenación

### 6.1 Definición y ejemplo

La concatenación es unir Strings (unir dos cadenas de texto)

### 6.2 Con el signo +

```javascript
let saludo = "¡Hola Pedro!"
let pregunta = "¿Cómo estas?"
let frase = saludo + pregunta;

document.write(frase);
```

El resultado es ¡Hola Pedro! ¿Cómo estas?.

### 6.3 Para números forzamos string (""+9+4)

```javascript
let numero1 = 5;
let numero1 = 8;
let frase = numero1 + numero2
document.write(frase);
```

Esto lo que haría es sumar, para concatenar numeros, tenemos que forzar que sea un string, basta con añadir String y automáticamente convirte los números a texto.

```javascript
let numero1 = 5;
let numero1 = 8;
let frase = "" + numero1 + numero2
document.write(frase);
```

Así el resultado sería 58. Esto es un tipado dinámico.

### 6.4 Concat

Es un método de cadenas en el que tenemos que tener al menos un String para que funcione.

```javascript
let numero1 = "5";
let numero1 = 8;
let frase = numero1.concat(numero2);
document.write(frase);
```

Así el resultado sería 58. 

### 6.5 Con backticks y la variable ${} (es la mas recomendable)

```javascript
let nombre = "Esther";
let frase = "soy" + nombre + "y estoy caminando";
document.write(frase);
```

Lo recomendable para lo anterior sería:

```javascript
let nombre = "Esther";
let frase = "soy ${nombre} y estoy caminando";
document.write(frase);
```

Pero con las comillas normales no funciona tiene que ser con backits `, con esta forma nos evitamos un montón de errores.

```javascript
frase = `soy ${nombre} y estoy caminando`;
```

El resultado sería soy Esther y estoy caminando.

Los backits permite introducir saltos de línea, "" , '', código html,...



## 7. Backticks (Bloquote o Acento Grave) y Escape

Comillas simples y dobles son esencialmente lo mismo. En cambio, los “backticks” nos permiten además ingresar expresiones dentro del string envolviéndolos en `${…}`:

```javascript
function sum(a, b) {
  return a + b;
}

alert(`1 + 2 = ${sum(1, 2)}.`); // 1 + 2 = 3.
```

Otra ventaja de usar backticks es que nos permiten extender en múltiples líneas el string:

```javascript
let guestList = `Invitados:
 * Juan
 * Pedro
 * Maria
`;

alert(guestList); // una lista de invitados, en múltiples líneas
```

Se ve natural, ¿no es cierto? Pero las comillas simples y dobles no funcionan de esa manera.

Si intentamos usar comillas simples o dobles de la misma forma, obtendremos un error:

```javascript
let guestList = "Invitados:  // Error: Unexpected token ILLEGAL
  * Juan";
```

**Caracteres especiales**

Es posible crear strings de múltiples líneas usando comillas simples, usando un llamado “carácter de nueva línea”, escrito como `\n`, lo que denota un salto de línea:

```javascript
let guestList = 'Invitados:\n * Juan\n * Pedro\n * Maria';

alert(guestList); // lista de invitados en múltiples líneas, igual a la de más arriba
```

Como ejemplo más simple, estas dos líneas son iguales, pero escritas en forma diferente:

```javascript
let str1 = "Hello\nWorld"; // dos líneas usando el "símbolo de nueva línea"

// dos líneas usando nueva línea normal y backticks
let str2 = `Hello
World`;

alert(str1 == str2); // true
```

https://es.javascript.info/string#caracteres-especiales



**Sin backticks :** 

```javascript
"linea 1\n\
	linea 2"
```

**Con backticks:**

```javascript
`linea 1
	linea 2`
```

**Escape de comillas dobles**

Las comillas dobles dentro de unas comillas simples si las podemos poner.

```javascript
frase = 'soy "Esther1" y estoy caminando';
```

**Escape de comillas simples.**

Las comillas simples dentro de unas comillas dobles si las podemos poner.

```javascript
frase = "soy 'Esther1' y estoy caminando";
```



## 8. Operadores intermedios

### 8.1 Operadores lógicos

Se basan en los operadores de comparación (true o false) para devolver una u otra cosa.



Los operadores lógicos se utilizan normalmente con valores booleanos (lógicos); cuando lo son, devuelven un valor booleano. Sin embargo, los operadores `&&` y `||` en realidad devuelven el valor de uno de los operandos especificados, por lo que si estos operadores se utilizan con valores no booleanos, pueden devolver un valor no booleano. Los operadores lógicos se describen en la siguiente tabla.

| Operador            | Uso              | Descripción                                                  |
| :------------------ | :--------------- | :----------------------------------------------------------- |
| `AND Lógico` (`&&`) | `expr1 && expr2` | Devuelve `expr1` si se puede convertir a `false`; de lo contrario, devuelve `expr2`. Por lo tanto, cuando se usa con valores booleanos, `&&` devuelve `true` si ambos operandos son `true`; de lo contrario, devuelve `false`. |
| `OR lógico` (`||`)  | `expr1 || expr2` | Devuelve `expr1` si se puede convertir a `true`; de lo contrario, devuelve `expr2`. Por lo tanto, cuando se usa con valores booleanos, `||` devuelve `true` si alguno de los operandos es `true`; si ambos son falsos, devuelve `false`. |
| `NOT lógico` (`!`)  | `!expr`          | Devuelve `false` si su único operando se puede convertir a `true`; de lo contrario, devuelve `true`. |

Ejemplos de expresiones que se pueden convertir a `false` son aquellos que se evalúan como `null`, 0, `NaN`, la cadena vacía ("") o `undefined`.

El siguiente código muestra ejemplos del operador `&&` (`AND` lógico).

```javascript
var a1 = true && true; // t && t devuelve true
var a2 = true && false; // t && f devuelve false
var a3 = false && true; // f && t devuelve false
var a4 = false && 3 == 4; // f && f devuelve false
var a5 = "Cat" && "Dog"; // t && t devuelve Dog
var a6 = false && "Cat"; // f && t devuelve false
var a7 = "Cat" && false; // t && f devuelve false
```

El siguiente código muestra ejemplos del operador || (`OR` lógico).

```javascript
var o1 = true || true; // t || t devuelve true
var o2 = false || true; // f || t devuelve true
var o3 = true || false; // t || f devuelve true
var o4 = false || 3 == 4; // f || f devuelve false
var o5 = "Cat" || "Dog"; // t || t devuelve Cat
var o6 = false || "Cat"; // f || t devuelve Cat
var o7 = "Cat" || false; // t || f devuelve Cat
```

El siguiente código muestra ejemplos de el operador ! (`NOT` lógico).

```javascript
var n1 = !true; // !t devuelve false
var n2 = !false; // !f devuelve true
var n3 = !"Cat"; // !t devuelve false
```



### 8.2 Operadores de comparación

**Los operadores de comparación comparan dos expresiones y devuleven un valor Boolean que representa la relación de sus valores.** 

**Un operador de comparación compara sus operandos y devuelve un valor lógico en función de si la comparación es verdadera (`true`) o falsa (`false`).** 

Los operandos pueden ser valores numéricos, de cadena, lógicos u objetos. Las cadenas se comparan según el orden lexicográfico estándar, utilizando valores Unicode. En la mayoría de los casos, si los dos operandos no son del mismo tipo, JavaScript intenta convertirlos a un tipo apropiado para la comparación. Este comportamiento generalmente resulta en comparar los operandos numéricamente. Las únicas excepciones a la conversión de tipos dentro de las comparaciones involucran a los operadores `===` y `!==`, que realizan comparaciones estrictas de igualdad y desigualdad. Estos operadores no intentan convertir los operandos a tipos compatibles antes de verificar la igualdad.

```javascript
var var1 = 3;
var var2 = 4;
```



| Operador                       | Descripción                                                  | Ejemplos que devuelven `true`        |
| :----------------------------- | :----------------------------------------------------------- | :----------------------------------- |
| `Igual` (`==`)                 | Devuelve `true` si los operandos son iguales.                | `3 == var1` `"3" == var1` `3 == '3'` |
| `No es igual` (`!=`)           | Devuelve `true` si los operandos *no* son iguales.           | `var1 != 4` `var2 != "3"`            |
| `Estrictamente igual` (`===`)  | Devuelve `true` si los operandos son iguales y del mismo tipo. Consulta también [`Object.is`](https://developer.mozilla.org/es/docs/Web/JavaScript/Reference/Global_Objects/Object/is) y `similitud en JS`. | `3 === var1`                         |
| `Desigualdad estricta` (`!==`) | Devuelve `true` si los operandos son del mismo tipo pero no iguales, o son de diferente tipo. | `var1 !== "3"` `3 !== '3'`           |
| `Mayor que` (`>`)              | Devuelve `true` si el operando izquierdo es mayor que el operando derecho. | `var2 > var1 "12" > 2`               |
| `Mayor o igual que` (`>=`)     | Devuelve `true` si el operando izquierdo es mayor o igual que el operando derecho. | `var2 >= var1 var1 >= 3`             |
| `Menor que` (`<`)              | Devuelve `true` si el operando izquierdo es menor que el operando derecho. | `var1 < var2` `"2" < 12`             |
| `Menor o igual` (`<=`)         | Devuelve `true` si el operando izquierdo es menor o igual que el operando derecho. | `var1 <= var2 var2 <= 5`             |



Ejemplos:

```javascript
let numero = 23;
let numero2 = 13;
```

**Igualdad ==:**  

Mira si el valor es el mismo, pero no diferencia el tipo de datos (da igual que uno sea número y otro texto).

```javascript
document.write(numero == numero2); // false

si numero2 = 23; // devolvería true
```

un solo = asigna, no compara.

**Desigualdad !=**

```javascript
// También se puede hacer con cadenas
let texto = "texto 1";
let texto2 = "texto 2";

document.write(texto != texto2); // devulve true por que son diferentes
```

**Exactamente identico ===**

Compara que sea lo mismo y además el mismo tipo de dato.

```javascript
let numero = 23;
let texto = "23";

document.write(texto == numero); // retorna true aunque uno sea numero y otro sea texto
```



### 8.3 Operadores bit a bit

Un operador bit a bit trata a sus operandos como un conjunto de 32 bits (ceros y unos), en lugar de números decimales, hexadecimales u octales. Por ejemplo, el número decimal nueve tiene una representación binaria de 1001. Los operadores bit a bit realizan sus operaciones en tales representaciones binarias, pero devuelven valores numéricos estándar de JavaScript.

La siguiente tabla resume los operadores bit a bit de JavaScript.

| Operador                                              | Uso       | Descripción                                                  |
| :---------------------------------------------------- | :-------- | :----------------------------------------------------------- |
| `AND a nivel de bits`                                 | `a & b`   | Devuelve un uno en cada posición del bit para los que los bits correspondientes de ambos operandos son unos. |
| `OR a nivel de bits`                                  | `a | b`   | Devuelve un cero en cada posición de bit para el cual los bits correspondientes de ambos operandos son ceros. |
| `XOR a nivel de bits`                                 | `a ^ b`   | Devuelve un cero en cada posición de bit para la que los bits correspondientes son iguales. [Devuelve uno en cada posición de bit para la que los bits correspondientes son diferentes]. |
| `NOT a nivel de bits`                                 | `~ a`     | Invierte los bits de su operando.                            |
| `Desplazamiento a la izquierda`                       | `a << b`  | Desplaza `a` en representación binaria `b` bits hacia la izquierda, desplazándose en ceros desde la derecha. |
| `Desplazamiento a la derecha de propagación de signo` | `a >> b`  | Desplaza `a` en representación binaria `b` bits a la derecha, descartando los bits desplazados. |
| `Desplazamiento a la derecha de relleno cero`         | `a >>> b` | Desplaza `a` en representación binaria `b` bits hacia la derecha, descartando los bits desplazados y desplazándose en ceros desde la izquierda. |

#### Operadores lógicos bit a bit

Conceptualmente, los operadores lógicos bit a bit funcionan de la siguiente manera:

- Los operandos se convierten en enteros de treinta y dos bits y se expresan mediante una serie de bits (ceros y unos). A los números con más de 32 bits se les descartan los bits más significativos. Por ejemplo, el siguiente número entero con más de 32 bits se convertirá en un número entero de 32 bits:

  bashCopy to Clipboard

  ```
  Antes:  1110 0110 1111 1010 0000 0000 0000 0110 0000 0000 0001
  Después:               1010 0000 0000 0000 0110 0000 0000 0001
  ```

- Cada bit en el primer operando se empareja con el bit correspondiente en el segundo operando: primer bit al primer bit, segundo bit al segundo bit, y así sucesivamente.

- El operador se aplica a cada par de bits y el resultado se construye bit a bit.

Por ejemplo, la representación binaria de nueve es 1001 y la representación binaria de quince es 1111. Entonces, cuando los operadores bit a bit se aplican a estos valores, los resultados son los siguientes:

| Expresión | Resultado | Descripción binaria                                   |
| :-------- | :-------- | :---------------------------------------------------- |
| `15 & 9`  | `9`       | `1111 & 1001 = 1001`                                  |
| `15 | 9`  | `15`      | `1111 | 1001 = 1111`                                  |
| `15 ^ 9`  | `6`       | `1111 ^ 1001 = 0110`                                  |
| `~15`     | `-16`     | `~ 0000 0000 ... 0000 1111 = 1111 1111 ... 1111 0000` |
| `~9`      | `-10`     | `~ 0000 0000 ... 0000 1001 = 1111 1111 ... 1111 0110` |

Ten en cuenta que los 32 bits se invierten utilizando el operador `NOT` a nivel de bits y que los valores con el bit más significativo (más a la izquierda) establecido en 1 representan números negativos (representación en complemento a dos). `~x` evalúa al mismo valor que evalúa `-x - 1`.

#### Operadores de desplazamiento de bits

Los operadores de desplazamiento bit a bit toman dos operandos: el primero es una cantidad que se va a desplazar y el segundo especifica el número de posiciones de bit por las que se va a desplazar el primer operando. La dirección de la operación de desplazamiento es controlada por el operador utilizado.

Los operadores de desplazamiento convierten sus operandos en enteros de treinta y dos bits y devuelven un resultado del mismo tipo que el operando izquierdo.

Los operadores de desplazamiento se enumeran en la siguiente tabla.

| Operador                                                     | Descripción                                                  | Ejemplo                                                      |
| :----------------------------------------------------------- | :----------------------------------------------------------- | :----------------------------------------------------------- |
| `Desplazamiento a la izquierda` (`<<`)                       | Este operador desplaza el primer operando el número especificado de bits a la izquierda. Los bits desplazados en exceso hacia la izquierda se descartan. Los bits cero se desplazan desde la derecha. | `9<<2` produce 36, porque 1001 desplazado 2 bits a la izquierda se convierte en 100100, que es 36. |
| `Desplazamiento a la derecha de propagación de signo` (`>>`) | Este operador desplaza el primer operando el número especificado de bits a la derecha. Los bits desplazados en exceso hacia la derecha se descartan. Las copias del bit más a la izquierda se desplazan desde la izquierda. | `9>>2` produce 2, porque 1001 desplazado 2 bits a la derecha se convierte en 10, que es 2. Del mismo modo, `-9>>2` produce -3, porque el signo se conserva. |
| `Desplazamiento a la derecha de relleno cero` (`>>>`)        | Este operador desplaza el primer operando el número especificado de bits a la derecha. Los bits desplazados en exceso hacia la derecha se descartan. Los bits cero se desplazan desde la izquierda. | `19>>>2` produce 4, porque 10011 desplazado 2 bits a la derecha se convierte en 100, que es 4. Para números no negativos, el desplazamiento a la derecha de relleno con ceros y el desplazamiento a la derecha de propagación del signo producen el mismo resultado. |

https://developer.mozilla.org/es/docs/Web/JavaScript/Guide/Expressions_and_operators#operadores_bit_a_bit

## 9. Camel Case

### 9.1 Definición

### 9.2 Usos

### 9.3 Ejemplo



## 10. Condicionales

### 10.1 Definición y usos

### 10.2 If

### 10.3 Else if

### 10.4 Else





## Capítulo 2.

## Capítulo 3.

## Capítulo 4.

## Capítulo 5.

## Capítulo 6.





NOTAS:

NOTA: El **DOM** (Document Object Model) en Javascript **se utiliza para interactuar con los elementos de una página web de manera dinámica**

es esencialmente una interfaz de plataforma, o [API](https://es.wikipedia.org/wiki/API) de programación para documentos HTML, que proporciona un conjunto estándar de objetos para representar documentos [HTML](https://es.wikipedia.org/wiki/HTML), [XHTML](https://es.wikipedia.org/wiki/XHTML), [XML](https://es.wikipedia.org/wiki/XML) y [SVG](https://es.wikipedia.org/wiki/SVG),[nota 1](https://es.wikipedia.org/wiki/Document_Object_Model#cite_note-1) un modelo estándar sobre cómo pueden combinarse dichos objetos, y una interfaz estándar para acceder a ellos y manipularlos.[1](https://es.wikipedia.org/wiki/Document_Object_Model#cite_note-2) A través del DOM, los programas pueden acceder y modificar el contenido, estructura y estilo de los documentos mencionados, que es para lo que se diseñó principalmente.

De esta manera el DOM permite acceso dinámico a través de la programación para acceder, añadir y cambiar dinámicamente contenido estructurado en documentos con lenguajes como [ECMAScript](https://es.wikipedia.org/wiki/ECMAScript) ([JavaScript](https://es.wikipedia.org/wiki/JavaScript)). 



**Document.write**

El objeto **document**

Desde el navegador, la forma de acceder al DOM es a través de un objeto **Javascript** llamado **document** , que representa el árbol DOM de la página o, más concretamente, la página de la pestaña del navegador donde nos encontramos.

Las siglas **DOM** significan **Document Object Model**, o lo que es lo mismo, la estructura de un documento HTML. Una página HTML está formada por múltiples etiquetas HTML, anidadas una dentro de otra, formando un árbol de etiquetas relacionadas entre sí, que se denomina **árbol DOM** (*o simplemente DOM*).

![¿Qué es el DOM?](https://lenguajejs.com/dom/introduccion/que-es/que-es-dom.png)

Observa que como la etiqueta `<head>` está dentro de `<html>` se dibuja como hija de `<html>`. La etiqueta `<title>` está dentro de `<head>`, por lo que será hija de esta y así sucesivamente.

En Javascript, cuando nos referimos al **DOM** nos referimos a esta estructura de árbol, mediante la cuál podemos acceder a ella y modificar los elementos del HTML desde Javascript, añadiendo nuevas etiquetas, modificando o eliminando otras, cambiando sus atributos HTML, añadiendo clases, cambiando el contenido de texto, etc...

> Al estar controlado por un **lenguaje de programación**, todas estas tareas se pueden automatizar, incluso indicando que se realicen cuando el usuario haga acciones determinadas, como por ejemplo: pulsar un botón, mover el ratón, hacer click en una parte del documento, escribir un texto, etc...

En su interior pueden existir varios tipos de elementos, pero principalmente serán objetos de tipo o :

- Un no es más que la representación genérica de una etiqueta: `HTMLElement`.
- Un es una unidad más básica, la cuál puede ser o un **nodo de texto**.

Todos los **elementos HTML**, dependiendo del elemento que sean, tendrán un tipo de dato específico asociado. Veamos algunos ejemplos:

| Tipo de dato específico | Etiqueta  | Descripción                     | + info                                                       |
| ----------------------- | --------- | ------------------------------- | ------------------------------------------------------------ |
| `HTMLDivElement`        | `<div>`   | Etiqueta divisoria (en bloque). | [Elemento ``](https://lenguajehtml.com//html/agrupacion/etiqueta-html-div/) |
| `HTMLSpanElement`       | `<span>`  | Etiqueta divisoria (en línea).  | [Elemento ``](https://lenguajehtml.com//html/texto/etiqueta-html-span/) |
| `HTMLImageElement`      | `<img>`   | Imagen.                         | [Elemento ``](https://lenguajehtml.com//html/multimedia/etiqueta-html-img/) |
| `HTMLAudioElement`      | `<audio>` | Contenedor de audio.            | [Elemento ``](https://lenguajehtml.com//html/multimedia/etiqueta-html-audio/) |

Existen muchos tipos de datos específicos, prácticamente uno por cada etiqueta HTML.

### [API nativa de Javascript](https://lenguajejs.com/dom/introduccion/que-es/#api-nativa-de-javascript)

En los siguientes capítulos de este curso veremos que **Javascript** nos proporciona un conjunto de herramientas para trabajar de forma nativa con el DOM de la página. Las categorías importantes que deberíamos tener en cuenta son las siguientes:

| Capítulo del DOM                   | Descripción                                                  |
| ---------------------------------- | ------------------------------------------------------------ |
| 🔍 **Buscar etiquetas**             | Formas y métodos para buscar elementos en el DOM como `.querySelector()`. |
| 🧾 **Modificar contenido**          | Acceder y modificar el contenido de una etiqueta HTML del DOM desde Javascript. |
| 🎭 **Gestionar atributos o clases** | Uso de varias de las API de Javascript para manipular clases CSS o atributos HTML. |
| 🔮 **Crear etiquetas**              | Métodos y consejos para crear elementos en el DOM y trabajar con ellos. |
| 🔌 **Insertar etiquetas**           | Varias de las API de Javascript para insertar elementos en el DOM de una página. |

Veremos cada una de ellas y las explicaremos detalladamente, con ejemplos.

### [¿Usar o no utilizar el DOM?](https://lenguajejs.com/dom/introduccion/que-es/#usar-o-no-utilizar-el-dom)

En la industria de la programación web, se suele optar por **evitar la manipulación del DOM de forma directa**. Esto es así porque trabajar con el DOM requiere destreza, conocimiento y es un proceso lento que necesita experiencia para que no resulte incómodo o se realicen acciones contraproducentes.

Por esta razón, habitualmente, se **delega** la tarea de la manipulación del DOM a una **librería o framework de terceros** (*generalmente a frameworks como React o Vue, por ejemplo*). El uso de estos frameworks nos simplifica el trabajo a cambio de dos cosas:

- Aprender otras estrategias propias del framework (*habitualmente más sencillas y cómodas*)
- Perder un poco de rendimiento y control sobre el DOM de nuestra aplicación o web

> > > Es importante tener en cuenta que aunque los frameworks Javascript no trabajen directamente con el DOM (crean su propio Virtual DOM, de lo que hablaremos más adelante) existe un **mito** que dice que «es una mala práctica trabajar directamente con el DOM». Esto no es cierto. Si utilizas un framework, deberías adaptarte a la forma de trabajar con ese framework, y si ese framework te exige no trabajar directamente con el DOM, eso es lo que podría ser una mala práctica.

Sin embargo, saber trabajar con el DOM es un skill muy importante que te dotará de habilidades para ser mucho más eficiente a la hora de pensar y resolver problemas relacionados con la estructura de una página. Personalmente, mi consejo es que si estás empezando con HTML/CSS, te enfoques primero en aprender esa parte y aprender Javascript. Si ya tienes cierta soltura con Javascript, es hora de que aprendas a trabajar con el DOM.

https://lenguajejs.com/dom/introduccion/que-es/

el **DOM** es la forma que tenemos de llamar a la **estructura del documento HTML**. Una estructura organizada por orden de aparición, en forma de árbol, que nos permite acceder a los elementos HTML de una página web y modificarlos.

![Tipos de DOM](https://lenguajejs.com/dom/introduccion/tipos-dom/tipos-dom.png)

Sin embargo, hoy en día, dependiendo de las herramientas con las que estemos trabajando, podemos estar utilizando un tipo de DOM o alguna de sus variaciones:

| Tipo de DOM | Descripción                                                  | ¿Dónde actua?       |
| ----------- | ------------------------------------------------------------ | ------------------- |
| DOM (real)  | Es el DOM que se genera al cargar una web.                   | Navegador (nativo). |
| Virtual DOM | Es el DOM que se genera al cargar una web cuando usamos un framework Javascript. | Framework (código). |
| Shadow DOM  | Es un DOM particular que se puede generar para encapsular un elemento. | Navegador (nativo). |
| Light DOM   | Es el DOM real que queda oculto cuando se genera un Shadow DOM. | Navegador (nativo). |

Vamos a explicarlos detenidamente y a explicar sus características principales.

### [¿Qué es el DOM real?](https://lenguajejs.com/dom/introduccion/tipos-dom/#qué-es-el-dom-real)

El **DOM real** es la forma en la que se denomina a la estructura HTML original de una página. Puedes verla desde un navegador, simplemente pulsando con botón derecho, seleccionando **Inspeccionar** y abriendo la pestaña **Elementos**.

![DOM real](https://lenguajejs.com/dom/introduccion/tipos-dom/dom-real.png)

Javascript proporciona una serie de funciones y mecanismos para acceder a estos elementos, modificarlos o eliminarlos de forma potente y flexible, como iremos viendo en los siguientes artículos.

> El **DOM** real siempre existe, aunque a veces trabajamos directamente con él, y otras veces utilizaremos herramientas que trabajan con él de forma transparente, sin que el desarrollador sea consciente.

### [¿Qué es el Virtual DOM?](https://lenguajejs.com/dom/introduccion/tipos-dom/#qué-es-el-virtual-dom)

Un **Virtual DOM** (*o VDOM*) es una representación ligera y artificial del DOM real.

Durante la aparición de los diferentes **frameworks** del ecosistema Javascript, estos idearon un concepto denominado **Virtual DOM**, que no es más que una copia en memoria del DOM de la página, donde se gestionarían directamente las actualizaciones y cambios del mismo, para traducirlos posteriormente al **DOM** real del documento, con el objetivo de acelerar y optimizar los cambios del DOM en la página sin que el programador tenga que preocuparse por ello.

Por ejemplo, la popular librería **React** introducía el concepto de **Virtual DOM** para detectar los cambios (*diferencias entre árboles*), actualizar los nodos afectados (*cambios y descendientes a quienes pueden afectar*) y posteriormente, actualizarlos en el **DOM** real:

![Virtual DOM](https://lenguajejs.com/dom/introduccion/tipos-dom/virtual-dom.png)

El surgimiento del concepto de **Virtual DOM** y su definición, ayudó a promover (*quizás por cuestiones de marketing*) el falso concepto «**el DOM es lento**», cuando en realidad, lo que puede hacerlo lento es una incorrecta gestión del mismo.

Es importante tener en cuenta que el **Virtual DOM** es una ventaja para los programadores porque les abstrae de tener que preocuparse por la manipulación del DOM, pero también conlleva desventajas: peor rendimiento, más coste de memoria y mayor complejidad en determinados casos.

> Recuerda que el **Virtual DOM** es un proceso que se implementa y ejecuta «fuera» del navegador, es decir, no es nativo, sino que forma parte del código de las librerías o frameworks Javascript. Si utilizas un framework o librería de Javascript, probablemente estés trabajando con un **Virtual DOM**. React y Vue tienen Virtual DOM, pero por ejemplo, Svelte, no.

### [¿Qué es el Shadow DOM?](https://lenguajejs.com/dom/introduccion/tipos-dom/#qué-es-el-shadow-dom)

El concepto de **Shadow DOM**, o «sombra del DOM», es un concepto relativamente moderno para crear elementos HTML en el DOM, teniendo su propio DOM particular, y por lo tanto, siendo independientes del resto del documento, facilitando así su encapsulación.

Por ejemplo, imaginemos un elemento HTML (*en azul*) en un árbol DOM tradicional. Si le añadimos un **Shadow DOM** a ese elemento HTML, pasaríamos a tener un elemento HTML con su propio DOM encapsulado, por lo que podemos hacer cambios sólo en ese DOM, aplicar CSS sólo a ese DOM sin que afecte al resto, etc.

![Shadow DOM](https://lenguajejs.com/dom/introduccion/tipos-dom/shadow-dom.png)

El concepto de **Shadow DOM** es especialmente interesante en la creación de componentes reutilizables de forma nativa, por lo que es común encontrarlo junto a temas de **Web Components**. Sin embargo, es una característica independiente que puede utilizarse en Javascript vanilla, sin necesidad de usar WebComponents.

> En el artículo [¿Qué es el Shadow DOM?](https://lenguajejs.com/webcomponents/shadow-dom/que-es-shadow-dom/) del tema **WebComponents** puedes aprender más sobre él.

### [¿Qué es el Light DOM?](https://lenguajejs.com/dom/introduccion/tipos-dom/#qué-es-el-light-dom)

El concepto de **Light DOM** tiene sentido sólo en el contexto de un elemento que posea un **Shadow DOM**. Igual que decimos que un **Shadow DOM** es la sombra de un elemento del DOM, el **Light DOM** es su contrapartida.

![Light DOM](https://lenguajejs.com/dom/introduccion/tipos-dom/light-dom.png)

Cuando creamos un **Shadow DOM** para un elemento del DOM, este, al igual que una sombra, oculta el contenido que ya tenía el elemento, mostrando sólo el de su **Shadow DOM** (*el DOM particular*). El contenido oculto es el que se denomina informalmente **Light DOM**, el contenido real del DOM que ha sido ocultado.

https://lenguajejs.com/dom/introduccion/tipos-dom/





Libro de Mate: Pag 89 el ejercicio 4 dibujar y de la siguiente página 90 el ejercicio 2 (Calcula).

De lengua: Pagina 102 (Ej 1, 2, 3, 5, 6 ) y 103

De Natu: Tema nuevo Pagina 42 y 43 (2,3,4,5).



