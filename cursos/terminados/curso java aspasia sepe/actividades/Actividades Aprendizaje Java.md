Realice la siguiente actividad y suba la solución en el botón  "Agregar Entrega", escribiendo el texto de dicha solución en "Texto en línea" o bien subiendo un fichero de texto (Ej: Word) arrastrándolo a la zona de "Archivos Enviados", para su valoración por el Tutor/a. Si quiere modificar la respuesta, bastará con utilizar el botón "Editar Entrega". Una vez que haya enviado su solución, continúe consultando los contenidos correspondientes a este curso.



# Actividad "Primera clase con Java"

Para realizar esta actividad será necesario tener instalado algún kit de desarrollo de Java, puede encontrarlo introduciendo en cualquier buscador la palabra **JDK** (**J**ava **D**evelopment **K**it). El JDK contiene las herramientas necesarias para la compilación del código fuente y su ejecución.

Cree una clase llamada Factura. Una factura está compuesta por un nombre de titular, un concepto, un precio, el iva y el total de la factura.

```java
public class Factura {
	public String NombreTitular;
	public String ConceptoFactura;
	public double Precio;
	public double Total;
	public double Iva;
}
```

Una vez creada la clase programe las siguientes funciones para trabajar con la misma:

- Una función para modificar los datos de cada uno de los atributos de un objeto Factura.
- Un constructor básico
- Una función que muestre el contenido de cada uno de los atributos de un objeto Factura.
- Una función Main() desde donde se creen dos objetos Factura, se modifiquen y se muestre su contenido.

```java
public class Factura{
   public String NombreTitular;
   public String ConceptoFactura;
   public double Precio;
   public double Total;
   public double Iva;
   

   //CONSTRUCTOR DE FACTURA
   public Factura()
   { 
      //VAMOS A INICIALIZAR LOS MIEMBROS DE LA CLASE
      this.NombreTitular = "sin titular";
      this.ConceptoFactura = "sin concepto";
      this.Precio = 0.0;
      this.Iva = 0.0;
      this.Total = 0.0;
   }
   
   public void setFactura(String titular, String concepto, double precio, double iva, double total) {
		
	   this.NombreTitular = titular;
	   this.ConceptoFactura = concepto;
	   this.Precio = precio;
	   this.Iva = iva;
	   this.Total = total;
   }
   
   public String getFactura() {
	   String factura;
	   factura = "Nombre Titular: " + this.NombreTitular +"\n"
  		+ "Concepto Factura: " + this.ConceptoFactura +"\n"
  		+ "Precio: " + this.Precio + "\n"
  		+ "Iva: " + this.Iva + "\n"
  		+ "Total: " + this.Total;
	   return factura;
   }

   public static void main(String[] args){
	   String datos;
	   
	   Factura f1 = new Factura();
	   
	   f1.setFactura("Esther Diez","Concepto1",400,230,620);
	   
	   datos = f1.getFactura();
	   System.out.println("Datos de la factura numero 1");
	   System.out.println(datos);
	   System.out.println("-------------------------------------");

	   f1.setFactura("Maria Fernandez","Concepto2",500,45,545);

	   datos=f1.getFactura();
	   System.out.println("Datos de la factura numero 2");
	   System.out.println(datos);
	   System.out.println("-------------------------------------");
   }	
}
```

Compile y ejecute el programa para ver el resultado del mismo. En un documento de texto escriba el código del programe y adjunte capturas de pantalla con las pruebas de ejecución.



## Actividad "Aplicaciones Web con Java"

Como se ha explicado en el contenido del curso, un servlet puede recibir parámetros del cliente, un ejemplo común son los formularios. Los formularios con **Servlets** son utilizados para obtener información. Los **Servlets** pueden obtener información del servidor, ya sean datos propios del servidor dónde están trabajando, o mediante el envío de información desde un formulario **html** por parte de la solicitud de una página.

- Genere el código de una página llamada datosusuario.html que contenga un formulario que llamará al servlet que recibirá la información.

- Genere el código del servlet para que recupere la información de la página mediante - request.getParameter().

Ejecute la aplicación para comprobar que la información es enviada al servidor y que puede recibirla el servlet.

En un documento de texto, escriba el código usado tanto para la página como para el servlet y adjunte las capturas de pantalla con las pruebas de ejecución de la aplicación creada.



# Actividad "Practica con PHP"

En esta práctica creará una sencilla página php para comprobar algunos de los aspectos básicos de programación en este lenguaje.

Escriba el código php necesario en el interior del cuerpo de la página entre las etiquetas <body> y </body>, que realice las siguientes acciones:

- Crear cinco variables, con los siguientes nombres y entre paréntesis valores: entero (0), decimal(0.5), cadena (hola), cadena2 (0256) y nulo (NULL). El nombre de las variables le sirve para conocer el tipo de datos que tendrán al recibir el valor indicado entre paréntesis. Escriba las correspondientes expresiones de asignación para que asi sea.
- Escribir cinco líneas donde imprimir la conversión de los valores de esas cinco variables al tipo de datos boolean. Tras cada una de esas líneas, escriba una más para crear un salto de línea en el resultado de la página web con la etiqueta HTML <br>
- Guarde la página como práctica1.php y compruebe el resultado en su navegador.



```html
<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Practica con PHP</title>
    </head>
    <body>
        <h1>PHP</h1>
        <?php
        $entero = 0;
        $decimal = 0.5;
        $cadena = "hola";
        $cadena2 = "0256";
        $nulo = NULL;
        
        echo "La conversión de la variable $entero es ".(boolean)$entero;
        echo "<br>";
        echo "La conversión de la variable $decimal es ".(boolean)$decimal;
        echo "<br>";
        echo "La conversión de la variable $cadena es ".(boolean)$cadena;
        echo "<br>";
        echo "La conversión de la variable $cadena2 es ".(boolean)$cadena2;
        echo "<br>";
        echo "La conversión de la variable $nulo es ".(boolean)$nulo;
        echo "<br>";
        ?>
    </body>
</html>
```



# Actividad "Trabajando con Arrays"

Esta práctica se divide en dos partes. En la primera trabajará con arrays y tendrá que demostrar que conoce la sintaxis para acceder a sus elementos, en la segunda parte transformará una estructura de repetición dada en otra equivalente.

**Primera parte:**

- Cree una nueva página php en el editor que este utilizando.
- Escriba el código necesario en el cuerpo de la página web para que se creen dos arrays:
  - En el primero se almacenan los 10 primeros números naturales (empezando por el 0).
  - En el segundo se almacena el valor del factorial del número incluido en la misma posición del primer array. Por ejemplo, si tenemos que en la posición 3 del primer array se guarda el valor 3, entonces en la posición 3 del segundo array estará el valor correspondiente al factorial de 3, que es 6.
- A continuación imprima el contenido del segundo array. Una línea en la pagina web por cada uno de los valores.
- Guarde la página como practica12a.php y pruébala en su navegador web.

```html
<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Practica con Arrays</title>
    </head>
    <body>
        <h1>PHP</h1>
        <?php
        $array1 = ARRAY(0,1,2,3,4,5,6,7,8,9);
                
        for($i=0;$i<count($array1);$i++){
         $j=1;
         $factorial=1;

         while($j<=$i){
            $factorial = $j*$factorial;
            $j++;
         }
         echo "Valor Array posicion [".$i."] es: ".$array1[$i]." y su factorial ".$factorial."<br>";
        }
        ?>
    </body>
</html>
```



**Segunda parte**:

Transforme la estructura de repetición del siguiente fragmento de código en una equivalente, pero utilizando la condición de salida al final del bucle.

Es decir utilizando la estructura Do-while en vez de While

```php+HTML
<?php
    $a = array(8,786, 45, 4, 63, 89, 1478, 98);
    $encontrado = FALSE;
    $buscado = 89;
    $i = 0;
    while ((!$encontrado) && ($i <= 7) ){
        if($a[$i] == $buscado){
            $encontrado = TRUE;
        }
        $i++;
    }
    if ($encontrado)
        echo "Se ha encontrado";
    else 
        echo "No se ha encontrado";
?>
```

Guarde la página como practica12a2.php y pruébela en su navegador web.

```html
<!DOCTYPE html>

<html>
   <head>
      <meta charset="UTF-8">
      <title>Practica con Arrays</title>
   </head>
   <body>
      <h1>PHP</h1>
      <?php
         $a = array(8,786, 45, 4, 63, 89, 1478, 98);
         $encontrado = FALSE;
         $buscado = 89;
         $i = 0;

         do {
            if($a[$i] == $buscado){
               $encontrado = TRUE;
            }
            $i++;
         } while ((!$encontrado) && ($i <= 7) );
         
         if ($encontrado)
            echo "Se ha encontrado";
         else 
            echo "No se ha encontrado";
      ?>
   </body>
</html>
```

