# Programación en Java/Operadores de bits

| [← 			Operadores 			booleanos](https://es.wikibooks.org/wiki/Programación_en_Java/Operadores_booleanos) | **Operadores 		de bits** | [Operadores 			de asignación →](https://es.wikibooks.org/wiki/Programación_en_Java/Operadores_de_asignación) |
| ------------------------------------------------------------ | ------------------------------ | ------------------------------------------------------------ |
|                                                              |                                |                                                              |

Como sabrán, los datos en una computadora internamente se representan en código binario. El microprocesador solo entiende de ceros y unos. Luego, mediante una serie de procesos, nosotros vemos a este código ya transformado en números, caracteres, imágenes y sonido. Pero en realidad en la trastienda todo sigue siendo binario.

## 	**Sumario**

- ​		[1](https://es.wikibooks.org/wiki/Programación_en_Java/Operadores_de_bits#Los_Bits)[Los 		Bits](https://es.wikibooks.org/wiki/Programación_en_Java/Operadores_de_bits#Los_Bits)
- ​		[2](https://es.wikibooks.org/wiki/Programación_en_Java/Operadores_de_bits#Desplazamientos)[Desplazamientos](https://es.wikibooks.org/wiki/Programación_en_Java/Operadores_de_bits#Desplazamientos)
  - ​			[2.1](https://es.wikibooks.org/wiki/Programación_en_Java/Operadores_de_bits#Desplazamiento_a_la_izquierda)[Desplazamiento 			a la izquierda](https://es.wikibooks.org/wiki/Programación_en_Java/Operadores_de_bits#Desplazamiento_a_la_izquierda)
  - ​			[2.2](https://es.wikibooks.org/wiki/Programación_en_Java/Operadores_de_bits#Desplazamiento_a_la_derecha_con_signo)[Desplazamiento 			a la derecha con signo](https://es.wikibooks.org/wiki/Programación_en_Java/Operadores_de_bits#Desplazamiento_a_la_derecha_con_signo)
  - ​			[2.3](https://es.wikibooks.org/wiki/Programación_en_Java/Operadores_de_bits#Desplazamiento_a_la_derecha_sin_signo)[Desplazamiento 			a la derecha sin signo](https://es.wikibooks.org/wiki/Programación_en_Java/Operadores_de_bits#Desplazamiento_a_la_derecha_sin_signo)
- ​		[3](https://es.wikibooks.org/wiki/Programación_en_Java/Operadores_de_bits#Operadores_lógicos_de_bits)[Operadores 		lógicos de bits](https://es.wikibooks.org/wiki/Programación_en_Java/Operadores_de_bits#Operadores_lógicos_de_bits)
  - ​			[3.1](https://es.wikibooks.org/wiki/Programación_en_Java/Operadores_de_bits#Operador_AND_de_Bits)[Operador 			AND de Bits](https://es.wikibooks.org/wiki/Programación_en_Java/Operadores_de_bits#Operador_AND_de_Bits)
  - ​			[3.2](https://es.wikibooks.org/wiki/Programación_en_Java/Operadores_de_bits#Operador_OR_de_Bits)[Operador 			OR de Bits](https://es.wikibooks.org/wiki/Programación_en_Java/Operadores_de_bits#Operador_OR_de_Bits)
  - ​			[3.3](https://es.wikibooks.org/wiki/Programación_en_Java/Operadores_de_bits#Operador_XOR_de_Bits)[Operador 			XOR de Bits](https://es.wikibooks.org/wiki/Programación_en_Java/Operadores_de_bits#Operador_XOR_de_Bits)
  - ​			[3.4](https://es.wikibooks.org/wiki/Programación_en_Java/Operadores_de_bits#Operador_NOT_de_Bits)[Operador 			NOT de Bits](https://es.wikibooks.org/wiki/Programación_en_Java/Operadores_de_bits#Operador_NOT_de_Bits)
  - ​			[4](https://es.wikibooks.org/wiki/Programación_en_Java/Operadores_de_bits#Para_saber_más)[Para 			saber más](https://es.wikibooks.org/wiki/Programación_en_Java/Operadores_de_bits#Para_saber_más)

## Los Bits[[editar](https://es.wikibooks.org/w/index.php?title=Programación_en_Java/Operadores_de_bits&action=edit&section=1)]

El método más sencillo de representación son los números naturales. Por ejemplo, si tengo el número 85 en decimal, solo tengo que llevarlo a binario y obtengo una serie de unos y ceros:

```
1010101 = 85 en binario 
```

Cada dígito (un cero o un uno) de este número se llama bit. Java tiene una serie de operadores capaces de manipular estos dígitos, son los operadores de bits.

Operadores de bits

| Operador | Utilización     | Resultado                                                    |
| -------- | --------------- | ------------------------------------------------------------ |
| <<       | A 		<< B  | Desplazamiento 		de A a la izquierda en B posiciones   |
| >>       | A 		>> B  | Desplazamiento 		de A a la derecha en B posiciones, tiene en cuenta el signo. |
| >>>      | A 		>>> B | Desplazamiento 		de A a la derecha en B posiciones, no tiene en cuenta el signo. |
| &        | A 		& B   | Operación 		AND a nivel de bits                        |
| \|       | A 		\| B  | Operación 		OR a nivel de bits                         |
| ^        | A 		^ B   | Operación 		XOR a nivel de bits                        |
| ~        | ~A              | Complemento 		de A a nivel de bits                     |


 Para operar a nivel de bit es necesario tomar toda la longitud predefinida para el tipo de dato. Estamos acostumbrados a desechar los ceros a la izquierda en nuestra representación de números. Pero aquí es importante. Si trabajamos una variable de tipo short con un valor de 3, está representada de la siguiente manera :

```
0000000000000011
```

Aquí los 16 bits de un short se tienen en cuenta.

## Desplazamientos[[editar](https://es.wikibooks.org/w/index.php?title=Programación_en_Java/Operadores_de_bits&action=edit&section=2)]

Los operadores de desplazamiento, mueven los bits a la izquierda o a la derecha. El primer operando será la victima a sacudir. El segundo indicará cuantas posiciones.

### **Desplazamiento a la izquierda**[[editar](https://es.wikibooks.org/w/index.php?title=Programación_en_Java/Operadores_de_bits&action=edit&section=3)]

Deseamos correr el número 33 dos posiciones a la izquierda. Entonces realizamos :

```
int j = 33;
int k = j << 2;
```

Este es el resultado:

```
00000000000000000000000000100001 : j = 33
00000000000000000000000010000100 : k = 33 << 2 ; k = 132                                                           
```

Cada "hueco" que queda a la derecha tras correr este número se rellena con ceros. Los bits a la izquierda se pierden, no es una operación de rotación. Si prestamos atención, observaremos que esta operación multiplicó a j por 2 tantas veces como posiciones se ha desplazado. En este caso se multiplicó por 4 ( 2 x 2 ). Hay que notar que el signo del número puede cambiar tras la operación (por ejemplo 1 << 31 = -2147483648).

### **Desplazamiento a la derecha con signo**[[editar](https://es.wikibooks.org/w/index.php?title=Programación_en_Java/Operadores_de_bits&action=edit&section=4)]

Volvamos a colocar como estaban los bits del caso anterior. Queremos obtener nuevamente el número 33. Para esto desplazamos el número 132 dos posiciones a la derecha.

```
int k = 132;
int m = k >> 2;
```

Como resultado obtenemos el número original.

```
00000000000000000000000010000100 : k = 132    
00000000000000000000000000100001 : m = 132 >> 2 ; m = 33
```

Podemos ver que el corrimiento a la derecha realiza una división de enteros. Divide por 2, tantas veces como posiciones desplazadas.

Veamos que ocurre si pretendemos realizar un desplazamiento a la derecha con un número negativo. Tengan en cuenta que la representación de números es de complemento a 2. Si tengo una variable de tipo int con el valor –1 , internamente está almacenada de la siguiente forma :

```
11111111111111111111111111111111 : -1 complemento a 2 
```

Ahora realicemos un programa para ver que ocurre con el desplazamiento.

```
public class CorreNeg {
   public static void main(String args[]){
          int x = -1;
          int y = x >> 2;
          System.out.println("El resultado es: " + String.valueOf(y));
   }
}
```

La salida del programa nos indica que:

```
El resultado es: -1
```

Quedó exactamente igual. Prueben de correr el número tantas posiciones como tengan ganas y obtendrán el mismo resultado. Esto ocurre porque en el desplazamiento, los "huecos" que quedan a la izquierda se rellenan con el bit uno (1), quedando inalterable.

Este operador desplaza el conjunto de bit a la derecha y agrega a la izquierda los bits que faltan según el bit de signo, o sea el más significativo. Si se encuentra con un número positivo, el bit de signo vale 0, entonces agrega ceros, en cambio si son negativos el bit de signo vale 1, entonces agrega unos. Este proceso, denominado extensión de signo mantiene el signo del número como si se tratara de una división. Por esto se lo conoce como desplazamiento con signo.

### **Desplazamiento a la derecha sin signo**[[editar](https://es.wikibooks.org/w/index.php?title=Programación_en_Java/Operadores_de_bits&action=edit&section=5)]

Modifiquemos ligeramente el programa anterior agregándole al operador un símbolo >. Nos queda de esta manera :

```
int x = -1;
int y = x >>> 2;
```

Si ejecutamos el programa nos dice lo siguiente :

```
El resultado es: 1073741823
```

Veamos de donde salió este número raro. Si lo llevamos a binario tenemos :

```
00111111111111111111111111111111 : 1073741823 en binario
```

Ahora nos damos cuenta que se han agregado dos ceros a la izquierda. Este operador desplaza a la derecha, pero no tiene en cuenta el signo. Siempre agrega bit con el valor cero, por lo que se llama desplazamiento sin signo. Este operador suele ser más adecuado que el >> cuando queremos manipular los bits mismos, no su representación numérica.

## Operadores lógicos de bits[[editar](https://es.wikibooks.org/w/index.php?title=Programación_en_Java/Operadores_de_bits&action=edit&section=6)]

Estos operadores extienden las operaciones booleanas a los enteros. Para comprender como trabajan debemos descomponer los enteros en un conjunto de bits. El operador aplicará una operación lógica bit por bit, tomando el valor de uno como verdadero y el valor de cero como falso. De un operando toma un bit y aplica la operación al bit que tiene la misma posición del segundo operando. Como resultado obtenemos otro entero.

### **Operador AND de Bits**[[editar](https://es.wikibooks.org/w/index.php?title=Programación_en_Java/Operadores_de_bits&action=edit&section=7)]

Si ambos bits comparados son 1, establece el resultado en 1. De lo contrario da como resultado 0.

```
int k = 132;   // k: 00000000000000000000000010000100
int l = 144;   // l: 00000000000000000000000010010000  
int m = k & l; // m: 00000000000000000000000010000000 

El resultado da 128 
```

### **Operador OR de Bits**[[editar](https://es.wikibooks.org/w/index.php?title=Programación_en_Java/Operadores_de_bits&action=edit&section=8)]

Si por lo menos uno de los dos bits comparados es 1, establece el resultado en 1. De lo contrario da como resultado 0.

```
int k = 132;   // k: 00000000000000000000000010000100
int l = 144;   // l: 00000000000000000000000010010000  
int m = k | l; // m: 00000000000000000000000010010100 

El resultado da 148
```

### **Operador XOR de Bits**[[editar](https://es.wikibooks.org/w/index.php?title=Programación_en_Java/Operadores_de_bits&action=edit&section=9)]

Si uno de los bits comparados es 0 y el otro 1, el resultado es 1. Si ambos bits comparados son iguales, el resultado es 0.

```
int k = 132;   // k: 00000000000000000000000010000100
int l = 144;   // l: 00000000000000000000000010010000  
int m = k ^ l; // m: 00000000000000000000000000010100 

El resultado da 20 
```

### **Operador NOT de Bits**[[editar](https://es.wikibooks.org/w/index.php?title=Programación_en_Java/Operadores_de_bits&action=edit&section=10)]

Sólo invierte los bits, es decir, convierte los ceros en unos y viceversa. Observemos que es el único de esta familia que tiene un solo operando.

```
int k = 132;   // k: 00000000000000000000000010000100
int m = ~k;    // m: 11111111111111111111111101111011 

El resultado da -133 
```

Como los enteros negativos en Java se representan con el método del complemento a dos, podemos realizar un sencillo experimento de cambiarle el signo a un número. Para realizarlo debemos aplicar a un entero el operador NOT y sumarle uno.

```
int x = 123;  
int y = ~x;   
int z = y + 1;
El resultado da -123, 
```