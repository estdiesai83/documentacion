# HTML

tablas

https://www.apinem.com/tablas-html/

# CSS

CSS (*Cascading Style Sheets u Hojas de Estilo en Cascada*) es el código que usas para dar estilo a tu página web.

Permite aplicar estilos de manera selectiva a elementos en documentos HTML.

Por ejemplo, para seleccionar todos los elementos de párrafo en un página HTML y volver el texto dentro de ellos de color rojo, has de escribir este CSS:

```css
p{
	color: red;
}
```



Para aplicar a un html css se puede hacer:

- Incluyendo el código en el mismo archivo html con el elemento <style>

  ```html
  <style type="text/css" media=screen>
  <!--
    body  { background: url(foo.gif) red; color: black }
    p em  { background: yellow; color: black }
    .nota { margin-left: 5em; margin-right: 5em }
  -->
  </style>
  ```

  

- Estilo en línea:

  ```html
  <p style="color: red; font-family: 'New Century Schoolbook', serif">Este párrafo usa estilos en rojo con la fuente New Century Schoolbook, si está disponible.</p>
  ```

  

- Desde un archivo independiente.css

  Puedes vincular tu archivo CSS a tu archivo HTML agregando un elemento `link` dentro del `head` de tu archivo HTML, así:

  ```html
  <!DOCTYPE html>
    <html>
      <head>
        <link rel="stylesheet" src="style.css" type="text/css">
      </head>
      <body>
      
      </body>
  </html>
  ```

  



Partes de contenido css:

- **Selector:**

  El elemento HTML en el que comienza la regla. Esta selecciona el (los) elemento(s) a dar estilo. Ej: <p>. Para dar estilo a un elemento diferente, solo cambia el selector.

- **Declaración:**

  Una sola regla como color:red; especifica a cuál de las propiedades del elemento quieres dar estilo.

- **Propiedades:**

  Maneras en las cuales puedes dar estilo a un elemento HTML. Ej: color

- **Valor de la propiedad:**

  A la derecha de la propiedad, después de los dos puntos (:), tienes el valor de la propiedad, para elegir una de las muchas posibles apariencias para una propiedad determinada. Ej: hay muchos colores para color ademas de red.

Sintaxis:

- Cada una de las reglas (aparte del selector) deben estar encapsuladas entre llaves ({}).
- Dentro de cada declaración, debes usar los dos puntos (:) para separar la propiedad de su valor.
- Dentro de cada regla, debes usar el punto y coma (;) para separar una declaración de la siguiente.

![image-20250328191725394](/home/soa/.config/Typora/typora-user-images/image-20250328191725394.png)

De este modo para modificar varios valores de propiedad a la vez, solo necesitas escribirlos separados por punto y coma (;) asi:

```css
p{
	color: red;
    width: 500 px;
    border: 1px solid black;
}
```



## Diferentes tipos de selectores:

Antes vimos los selectores de elementos, los cuales seleccionan todos los elementos de un tipo dado en los documentos HTML. Sin embargo puedes hacer selecciones más específicas que esas. 

### Selectores básicos

| **Selector**       | **Descripción**                                              |
| ------------------ | ------------------------------------------------------------ |
| *****              | Selecciona todos los elementos del DOM                       |
| **etiqueta**       | Selecciona todas las etiquetas indicadas                     |
| **.class**         | Selección de los elementos con la clase .class               |
| **#id**            | Selección del elemento con id #id                            |
| **sel1 sel2**      | Selección de los selectores sel2 que se encuentren dentro de los selectores sel1 |
| **.class1.class2** | Selección de los elementos con las dos clases: class1 y class2 |
| **sel1.class1**    | Selección de todos los selectores sel1 con clase class1      |
| **sel1, sel2**     | Selección de todos los selectores separados por comas        |
| **sel1 > sel2**    | Selección de los selectores sel2 cuando son hijos de sel1    |
| **sel1 + sel2**    | Selección del selector sel2 cuando es hermano de sel1 (su elemento padre es el mismo) |

- **Selector de elemento** (selector de etiqueta o tipo): 

  Selecciona todos los elementos HTML del topo especificado.

  ```css
  p {
      color: green;
  }  
  ```

  El estilo se aplicará a todos los elementos <p>.

- **Selector de identificación: **utiliza el atributo id para seleccionar un elemento. Solo puede haber un elemento con un id dado en un documento.

  ```css
  #cent {
  	color: blue;
  }
  ```

  El estilo se aplicará al elemento que tenga el id #cent

- **Selector de clase:** Los elementos en la página

  ```css
  .blend{
      color: red;
  } 
  ```

  El estilo se aplicará a cualquier elemento que tenga la clase .blend

  Un elemento puede tener múltiples clases: `<div class="blend otro-estilo"></div>`

  En este ejemplo, el elemento `<div>` tendrá los estilos definidos para ambas clases `.blend` y `.otro-estilo`. Sin embargo, si hay propiedades CSS que se repiten en ambas clases, se aplicarán los estilos de la última clase declarada. Es decir, si tanto `.blend` como `.otro-estilo` definen la propiedad `color`, prevalecerá el color definido en `.otro-estilo` porque es la última clase definida. Esto proporciona un mecanismo para controlar la prioridad de los estilos cuando se aplican múltiples clases a un elemento

- **Selector de atributo:** proporciona diferentes formas de seleccionar elementos según la presencia de un atributo determinado en un elemento:

  ```css
  a[title] {
  }
  ```

  o incluso hacer una selección basada en la presencia de un atributo que tiene un valor particular asignado

  ```css
  a[href="https://example.com"]
  {
  }
  ```

- **Selector descendiente**

  Un elemento es descendiente de otro cuando se encuentra entre las etiquetas de apertura y de cierre del elemento padre.

  **Sintaxis:** selector1 selector2 selectorN {atributo: valor;} /* El estilo se aplica sobre el selector N */

  ```css
  div p { 
      color: black;
  }
  ```

  El estilo se aplica a todos los párrafos que se encuentren dentro de una etiqueta div.

- **Combinación de selectores**

  La combinación de selectores nos permite dar un estilo a todos los selectores indicados.

  **Sintaxis:** selector1, selector2, selector3{atributo: valor;} /* El estilo se aplica sobre los selectores indicados */

  ```css
  div, p { 
      color: orange;
  }
  ```

  El estilo se aplica a todos los divs y párrafos.

- **Selector de hijos**

  Se usa para seleccionar un elemento que es *hijo* de otro elemento.

  **Sintaxis:** selector1 > selector2 {atributo: valor;} /* El estilo se aplica sobre el selector 2 */

  ```css
  div > p { 
      color: white;
  }
  ```

  El estilo se aplica a todos los párrafos que sean hijos de un div.

  

  NOTA: **Diferencia entre selector de hijos y selector descendiente**. Los **hijos** son los elementos que se encuentran un nivel directamente debajo de el mismo elemento section. Los **descendientes** son todos los elementos que se encuentran dentro del elemento section sean los mismos **hijos** o los **hijos** de los **hijos**.

- **Selector adyacente**

  Se usa para seleccionar elementos que son *hermanos*, es decir, su elemento padre es el mismo y están seguidos en el código HTML.

  **Sintaxis:** selector1 + selector2{ atributo: valor; } /* El estilo se aplica al selector 2 */

  ```css
  div + p { 
      color: black;
  }
  ```

  El estilo se aplica a todos los párrafos que sean hermanos de un div .



EJEMPLOS: 

```css
p { background-color: grey; } /* Selector etiqueta */ 
.clase { color: red; } /* Selector clase */
#ident { color: green; } /* Selector Identificador */
* { font-style: italic; } /* Selector universal */ 
p a { background-color: orange; } /* Selector descendiente (pueden ser hijos de hijos) */
h3, small { color: blue;} /* Combinación de selectores */ 
div>span { color: pink; } /* Selector de hijos */ 
span+small { background-color: yellow; }  /* Selector adyacente*/
```





Atributos:

- **class**: se usa para especificar la clase de estilo a la cual pertenece el elemento. Por ejemplo, la hoja de estilo puede haber creado las clases punk y advertencia.

  ```css
  .punk     { color: lime; background: #ff80c0 }
  p.advertencia { font-weight: bolder; color: red; background: white }
  ```

  Se podría hacer referencia a estas clases en HTML con el atributo class:

  ```html
  <h1 class=punk>Extensiones proprietarias</h1>
  <p class=advertencia>Muchas extensiones proprietarias pueden tener efectos laterales negativos, tanto en los navegadores que las soportan como en los que no lo hacen...
  ```

  En este ejemplo, la clase **punk** puede aplicarse a cualquier elemento body ya que no tiene un elemento html asociado en la hoja de estilo. Al usar la hoja de estilo del ejemplo, la clase advertencia solo puede aplicarse al elemento <p>



### Unidades de medida

| Longitudes relativas |                                                              |
| :------------------: | ------------------------------------------------------------ |
|        **px**        | Píxeles (relativo al dispositivo)                            |
|        **em**        | Relativo al tamaño de la fuente del elemento ( 2em significa 2 veces el tamaño de la fuente actual) |
|        **%**         | Porcentaje (relativo al elemento padre)                      |
|     **vh y vw**      | Medidas relativas de acuerdo al viewport 1vh = 1% de la altura del viewport 100vh = altura del viewport |
| Longitudes absolutas |                                                              |
|        **in**        | Pulgadas (1pulgada = 2.54 cm)                                |
|        **cm**        | Centímetros                                                  |
|        **mm**        | Milímetros                                                   |
|        **pt**        | Puntos (1pt = 1/72 pulgadas)                                 |
|        **pc**        | Picas (1pica = 12 puntos)                                    |

### Colores básicos

| Colores básicos |         |             |
| :-------------: | :-----: | :---------: |
|     Nombre      |   HEX   |     RGB     |
|      black      | #000000 |    0,0,0    |
|      white      | #ffffff | 255,255,255 |
|       red       | #ff0000 |   255,0,0   |
|      blue       | #0000ff |   0,0,255   |
|     yellow      | #ffff00 |  255,255,0  |
|      gray       | #808080 | 128,128,128 |
|      green      | #008000 |   0,128,0   |

### Color y fondo

|         Propiedad         |             Descripción              |                        Valores                        |
| :-----------------------: | :----------------------------------: | :---------------------------------------------------: |
|         **color**         |           Color del texto            | RGB \| HSL \| HEX \| nombre del color \| RGBA \| HSLA |
|   **background-color**    |            Color de fondo            | RGB \| HSL \| HEX \| nombre del color \| RGBA \| HSLA |
|   **background-image**    |           Imagen de fondo            |                   url(«…») \| none                    |
|   **background-repeat**   |   Repetición de la imagen de fondo   |      repeat \| repeat-x \| repeat-y \| no-repeat      |
| **background-attachment** | Desplazamiento de la imagen de fondo |                    scroll \| fixed                    |
|  **background-position**  |    Posición de la imagen de fondo    |    percentage \| length \| left \| center \| right    |
|    **background-size**    |     Tamaño de la imagen de fondo     |           auto \| cover \| contain \| valor           |
|        **Opacity**        |     Transparencia de un elemento     |        [ 0 – 1 ] (0 → totalmente transparente)        |



### Texto

|      Propiedad      |                 Descripción                  |                          Valores                          |
| :-----------------: | :------------------------------------------: | :-------------------------------------------------------: |
|   **text-indent**   | Desplazamiento de la primera línea del texto |                  longitud \| porcentaje                   |
|   **text-align**    |            Alineamiento del texto            |            left \| right \| center \| justify             |
| **text-decoration** |        Efectos de subrayado y tachado        |       none \| underline \| overline \| line-through       |
| **letter-spacing**  |           Espacio entre caracteres           |                    normal \| longitud                     |
|  **word-spacing**   |            Espacio entre palabras            |                    normal \| longitud                     |
| **text-transform**  |   Transformación a mayúsculas / minúsculas   |       capitalize \| uppercase \| lowercase \| none        |
|   **line-height**   |       Tamaño del espacio entre líneas        |                  longitud \| porcentaje                   |
| **vertical-align**  |             Alineación vertical              | top \| middle \| bottom baseline \| sub \| super \| valor |



### Fuentes

|    Propiedad     |                      Descripción                       |                           Valores                            |
| :--------------: | :----------------------------------------------------: | :----------------------------------------------------------: |
| **font-family**  |                  Familias de fuentes                   |         nombre-familia\|nombre-familia-genérica\| *          |
|  **font-style**  |                  Estilo de la fuente                   |                 normal \| italic \| oblique                  |
| **font-variant** | Convierte a mayúsculas manteniendo un tamaño inferior  |                     normal \| small-caps                     |
| **font-weight**  | Anchura de los caracteres. Normal = 400, Negrita = 700 | normal \| bold \| bolder \| lighter \| 100 \| 200 \| 300 \| 400 \| 500 \| 600 \| 700 \| 800 \| 900 |
|  **font-size**   |                  Tamaño de la fuente                   | xx-small \| x-small \| small \| medium \| large \| x-large \| xx-large \| larger \| smaller \| longitud \| porcentaje |

### Listas

|        Propiedad        |                         Descripción                          |                           Valores                            |
| :---------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: |
|   **list-style-type**   | Estilo aplicable a los marcadores visuales o viñetas de las listas | disc \| circle \| square \| decimal \| decimal-leading-zero \| lower-roman \| upper-roman \| lower-greek \| lower-latin \| upper-latin \| armenian \| georgian \| lower-alpha \| upper-alpha \| none |
|  **list-style-image**   |         Imagen aplicable a las viñetas de las listas         |                       url(«…») \| none                       |
| **list-style-position** |          Posición de las viñetas dentro de la lista          |                      inside \| outside                       |
|     **list-style**      | Permite establecer varios estilos de la lista en una sola propiedad |  list-style-type \| list-style-position \| list-style-image  |

### Tablas

|      Propiedad      |                    Descripción                    |       Valores        |
| :-----------------: | :-----------------------------------------------: | :------------------: |
|  **caption-side**   |       Posición del título respecto la tabla       |    top \| bottom     |
|  **table-layout**   |      Formato de las celdas, filas y columnas      |    auto \| fixed     |
| **border-collapse** |        Selección del modelo de los bordes         | collapse \| separate |
| **border-spacing**  |  Espaciado entre los bordes de celdas adyacentes  |       longitud       |
|   **empty-cells**   | Visibilidad de los bordes de celdas sin contenido |     show \| hide     |

### Pseudo-clases para selección de hijos o hermanos

| **Pseudo-clase**         | **Descripción**                                       |
| ------------------------ | ----------------------------------------------------- |
| **:first-child**         | Primer hijo                                           |
| **:last-child**          | Último hijo                                           |
| **:first-of-type**       | Primer hermano de su tipo                             |
| **:last-of-type**        | Último hermano de su tipo                             |
| **:only-child**          | Hijos únicos                                          |
| **:only-of-type**        | Únicos hermanos de su tipo                            |
| **:empty**               | Elementos que no tienen hijos                         |
| **:nth-child(n)**        | Enésimo elemento hijo                                 |
| **:nth-last-child(n)**   | Enésimo elemento hijo contando desde el último        |
| **:nth-of-type(n)**      | Enésimo hermano de su tipo                            |
| **:nth-last-of-type(n)** | Enésimo hermano de su tipo comenzando desde el último |

### Pseudo-clases para los estados de un elemento

| Pseudo-clase |                         Descripción                          |
| :----------: | :----------------------------------------------------------: |
|  **:link**   |                  No visitado por el usuario                  |
| **:visited** |                   Visitado por el usuario                    |
|  **:hover**  | Modifica el estilo cuando un elemento apuntador pasa por encima |
| **:active**  |        Se activa cuando el usuario pulsa el elemento         |
|  **:focus**  |       Se activa cuando tiene el foco sobre el elemento       |

### Pseudo-elementos

|    Pseudo-clase    |                        Descripción                        |
| :----------------: | :-------------------------------------------------------: |
|  **::first-line**  |           Primera línea de texto de un elemento           |
| **::first-letter** | Primera letra de la primera línea de texto de un elemento |
|    **::before**    |        Añade contenido al principio del documento         |
|    **::after**     |          Añade contenido al final del documento           |



### Modelo de cajas: márgenes, relleno y bordes

Cualquier elemento incluido en un documento HTML dispone de una estructura tipo caja que se puede modificar usando las propiedades CSS. Las propiedades más importantes de las cajas o contenedores son las siguientes: **margin** (margen externo)**, border** (borde) y **padding** (margen interno).

![Propiedades CSS contenedores](https://www.eniun.com/wp-content/uploads/Propiedades-cajas-y-contenedores-en-CSS.png)

Las propiedades operan en el siguiente orden: **superior, derecha, inferior e izquierda**.

|                          Propiedad                           |                         Descripción                          |                           Valores                            |
| :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: |
| **`padding-top` `padding-right`  `padding-bottom` `padding-left`** |  Tamaño del relleno superior, derecho, inferior e izquierdo  |                    longitud \| porcentaje                    |
|                         **padding**                          |                      Tamaño del relleno                      |                 longitud \| porcentaje {1,4}                 |
| **`margin-top` `margin-right`  `margin-bottom` `margin-left`** |  Tamaño del margen superior, derecho, inferior e izquierdo   |                longitud \| porcentaje \| auto                |
|                          **margin**                          |                    Ancho de los margenes                     |             longitud \| porcentaje \| auto {1,4}             |
| **`border-top-width` `border-right-width`  `border-bottom-width` `border-left-width`** |  Anchura del borde superior, derecho, inferior o izquierdo   |             thin \| medium \| thick \| longitud              |
|                       **border-width**                       |                      Anchura del borde                       |          thin \| medium \| thick \| longitud {1,4}           |
| **`border-top-color` `border-right-color`  `border-bottom-color` `border-left-color`** |   Color del borde superior, derecho, inferior e izquierdo    |                     color \| transparent                     |
|                       **border-color**                       |                       Color del borde                        |                  color \| transparent {1,4}                  |
| **`border-top-style` `border-right-style`  `border-bottom-style` `border-left-style`** |   Estilo del borde superior, derecho, inferior e izquierdo   | none \| hidden \| dotted \| dashed \| solid \| double \| groove \| ridge \| inset \| outset |
|                       **border-style**                       |                       Estilo del borde                       | none \| hidden \| dotted \| dashed \| solid \| double \| groove \| ridge \| inset \| outset {1,4} |
| **`border-top` `border-right`  `border-bottom` `border-left`** | Ancho, estilo y color para el borde superior, derecho, inferior e izquierdo |   border-top-width \| border-top-style \| border-top-color   |
|                          **border**                          |            Ancho, estilo y color para los bordes             |         border-width \| border-style \| border-color         |
|                      **border-radius**                       |                     Curvatura del borde                      |                 longitud \| porcentaje {1,4}                 |

**Tabla 12.** Modelo de cajas: márgenes, relleno y bordes



El **padding** es el **margen interno** de un elemento, también se le llama relleno y es la cantidad de espacio entre el borde y el contenido del elemento. Veamos una tabla con las propiedades para dar un margen interno a un elemento.

Valores del padding (también aplicables a la propiedad margin):

- **Un valor:** se aplica el estilo a los **4 lados**.
- **Dos valores:** el primer valor se aplica a **arriba y abajo**, el segundo valor se aplica a **derecha e izquierda**.
- **Tres valores:** el primer valor se aplica a **arriba**, el segundo valor a **derecha e izquierda** y el tercer valor se aplica a **abajo** del elemento.
- **Cuatro valores:** el primer valor se aplica a **arriba**, el segundo valor se aplica a la **derecha**, el tercer valor se aplica a **abajo** y el cuarto valor se aplica a la **izquierda**. 

Ejemplo `Padding`

```html
<html>
<head>
    <meta charset="utf-8"> 
    <title>Propiedad padding</title> 
    <link rel="stylesheet" href="style.css"> 
</head>
<body>
   <h3>Propiedad padding</h3>
   <div class="a" border="1">
        <p>Contenedor con padding-top: 30px; padding-bottom: 80px; padding: 50px; padding: 40px;</p>
  </div></br>
   <div class="b" border="1">
        <p>Contenedor con padding: 30px 50px 80px 40px</p>
   </div>
</body>
</html>
```



```css
div.a {
   padding-top: 30px;
   padding-bottom: 80px;
   padding-right: 50px;
   padding-left: 40px;
   border: 1px solid black;
   background-color: azure;
 }
 div.b { /* Propiedad corta */
   padding: 30px 50px 80px 40px; /*superior, derecha, inferior e izquierda*/
   border: 1px solid black;
   background-color: darkseagreen;
 }
```

![image-20250329163003979](/home/soa/.config/Typora/typora-user-images/image-20250329163003979.png)



El **margin** es el **margen externo** de un elemento, fuera de cualquier borde definido. Veamos las distintas propiedades para dar estilo a los márgenes de un elemento.

Ejemplo margin

```html
<html>
<head>
    <meta charset="utf-8"> 
    <title>Propiedad margin</title> 
    <link rel="stylesheet" href="style.css"> 
</head>
<body>
   <h3>Propiedad margin</h3>
   
   <div class="a" border="1">
    <p>Contenedor con margin-top: 30px; margin-bottom: 80px; margin-right: 50px; margin-left: 40px;</p>
   </div>
   <div class="b" border="1">
    <p>Contenedor con margin: 30px 80px 50px 40px</p>
   </div>
</body>
</html>
```

```css
div.a {
   margin-top: 30px;
   margin-bottom: 80px;
   margin-right: 50px;
   margin-left: 40px;
   border: 1px solid black;
   background-color: azure;
 }
 div.b { /* Propiedad corta */
   margin: 30px 80px 50px 40px;
   border: 1px solid black;
   background-color: darkseagreen;
 }
```

![image-20250329163433148](/home/soa/.config/Typora/typora-user-images/image-20250329163433148.png)







### Propiedades width, height, max-width, min-width, max-height y min-height

| Nombre propiedad |                       Descripción                       |                           Valores                            |
| :--------------: | :-----------------------------------------------------: | :----------------------------------------------------------: |
|      width       | Establece el ancho del área de contenido de un elemento | Unidad de longitud (px, em, %, etc.), auto, initial, inherit |
|      height      | Establece el alto del área de contenido de un elemento  | Unidad de longitud (px, em, %, etc.), auto, initial, inherit |
|    max-width     |  Establece el ancho máximo que puede tener un elemento  | Unidad de longitud (px, em, %, etc.), none, initial, inherit |
|    min-width     |  Establece el ancho mínimo que debe tener un elemento   |  Unidad de longitud (px, em, %, etc.), 0, initial, inherit   |
|    max-heigt     |  Establecer el alto máximo que debe tener un elemento   |  Unidad de longitud (px, em, %, etc.), 0, initial, inherit   |
|    min-height    |  Establecer el alto mínimo que debe tener un elemento   |  Unidad de longitud (px, em, %, etc.), 0, initial, inherit   |

### Comportamiento de los contenedores

|             Propiedad             |                         Descripción                          |                 Valores                 |
| :-------------------------------: | :----------------------------------------------------------: | :-------------------------------------: |
|            **display**            |                Comportamiento del contenedor                 | inline \| block \| inline-block \| none |
|           **position**            |                  Esquema de posicionamiento                  | static \| relative \| absolute \| fixed |
| **`top` `right` `bottom` `left`** | Desplazamiento de la caja respecto al borde superior, derecho, inferior o izquierdo |     longitud \| porcentaje \| auto      |
|             **float**             |                   Posicionamiento flotante                   |          left \| right \| none          |
|             **clear**             |           Control de cajas adyacentes a las float            |      none \| left \| right \| both      |
|            **z-index**            |                       Nivel de la capa                       |          auto \| número entero          |
|          **box-sizing**           | Control de bordes y relleno en el comportamiento del contenedor |        content-box \| border-box        |
|          **visibility**           |       Muestra u oculta un elemento ocupando el espacio       |            visible \| hidden            |
|           **overflow**            |         Visibilidad de los elementos de tipo bloque          |      visible\|hidden\|scroll\|auto      |



### Propiedad overflow, excedente de contenido

| Propiedad CSS overflow |              Valores              |
| :--------------------: | :-------------------------------: |
|        overflow        |   visible, hidden, scroll, auto   |
|   overflow: visible    |            Por defecto            |
|    overflow: hidden    | Oculta los contenidos desbordados |
|    overflow: scroll    | Muestra barras de desplazamiento  |
|     overflow: auto     |        El navegador decide        |
|       overflow-x       |   visible, hidden, scroll, auto   |
|       overflow-y       |   visible, hidden, scroll, auto   |









Páginas de documentación interesantes:

https://www.eniun.com/resumen-tabla-propiedades-css-valores/











# JAVASCRIPT

Para llamar a un archivo de javascript desde código html, incluir en el <head> la etiqueta de <script>

```jsp
<script src="js/nombre_archivo.js"></script>
```

Para incluir código de javascript dentro de un archivo .html o .jsp

```jsp
<script type="text/javascript">
	function reserva(){
		alert("HOLA");
		var cliente = document.formulario1.cliente1.value;
		var numero = document.formulario1.numero1.value;
		var fecha = document.formulario1.fecha1.value;
		var telefono = document.formulario1.telefono1.value;
		alert("Se ha reservado la mesa"+cliente+" "+" "+numero+" "+fecha+" "+" "+telefono);
	}
</script>
```

Desde un archivo de javascript si queremos mostrar una ventana de dialogo para introducir algun valor usamos la función **prompt**

```javascript
hoy = prompt("bote de hoy: ");
```

Si queremos hacer una **suma**, no vale con poner los numeros separados por +, por que en javascript lo que hace es concatenar, para sumar tenemos que utilizar **Number**:

```javascript
total=Number(hoy)+Number(lunes)+Number(martes)+Number(miercoles)+Number(jueves)+Number(viernes)+Number(sabado);
```



Para dibujar en un objeto desde la web con algún valor que hemos recogido y dibujarlo en de nuevo con html, utilizamos document.getElementById("name_objeto").innerHTML="codigo_html".

Ejemplo:

```javascript
document.getElementById("parrafo").innerHTML="<p style='text-align:center'>"+"---------------"+"<br>"+"El total del bote semanal es :"+total+"<br><br>"+"Los gerentes cobran: "+resultado1+"<br>"+"Los barteners cobran: "+resultado2+"<br>"+"Los cocineros cobran: "+resultado3+"<br>"+"Los camareros cobran: "+resultado4+"<br>";
```

El método `getElementById` permite seleccionar un elemento del documento por medio del valor del atributo `id` que se le haya asignado. Su sintaxis es la siguiente:

```javascript
document.getElementById('id_del_elemento');     
```

Por medio de esta línea podríamos elegir cualquier elemento cuyo identificador conozcamos para manipularlo posteriormente. Por ejemplo, por medio de `document.getElementById('contenido')` seleccionaríamos el elemento con `id="contenido"`.

**innerHTML**, .Con esta propiedad podemos tanto ‘capturar’ todo el contenido de un elemento, incluido su marcado HTML, como modificar o crear contenido nuevo a un elemento, incluyendo igualmente etiquetado HTML. 

```javascript
<button onclick="cambiarLista()">¡Cambia la lista!</button>
<ul id="listaTest">
 <li>Antes del clic (item 1)</li>
 <li>Antes del clic (item 2)</li>
</ul>
<script>
function cambiarLista() {
document.getElementById("listaTest").innerHTML = "<li>Item1 después del clic</li><li>Item2 después del clic</li>";
}
</script>
```



## ¿Que son los eventos?

En programación, existen situaciones en las que necesitamos realizar una acción **cuando ocurra un determinado caso** que nos interesa. Si este caso es predecible, es decir, sabemos cuando va a ocurrir, simplemente podemos utilizar un condicional if o algo similar, y listo. Pero existen ocasiones en las que desconoces cuando va a suceder, es decir, no sabemos cuando tenemos que activar nuestra funcionalidad.

Por ejemplo, no podemos predecir **cuando** el usuario de nuestra página hará click en un botón, o en que momento va a terminar de reproducirse una canción, si el usuario la ha pausado, etc.

En estas situaciones, **cuando sucede algo**, es cuando se utilizan los eventos.

**Un evento es una "notificación" de que una característica relevante acaba de suceder.**

Ejemplos de eventos sencillos:

- **click:** se ha hecho click de ratón sobre un elemento de la página.
- **keydown:** Pulsación de una tecla específica del teclado.
- **play:** Reproducción de un archivo de audio/video
- **wheel:** scroll con la rueda del ratón sobre un elemento de la página.
- **beforeprint:** El usuario ha activado la opción "imprimir página".

Como desarrolladores, debemos preparar el código para que **cuando ocurra un determinado evento,** se lleve a cabo una **funcionalidad asociada**. Este proceso se llama **escuchar eventos.** Podemos preparar, nuestra página o aplicación para que cuando ocurran ciertos eventos (que no podemos predecir de otra forma) reaccionen a ellos:

![image-20250505231306203](/home/soa/.config/Typora/typora-user-images/image-20250505231306203.png)

## ¿Por qué utilizar eventos?

Utilizar eventos en javascript tiene muchísimas ventajas, ya que nos permite organizar nuestro código de una forma más lógica y clara, pero una de las principales ventajas es que **desacoplamos nuestro código.** 

### Formas de manejar eventos

| Forma                                 | Ejemplo                                 | Artículo en profundidad                                      |
| ------------------------------------- | --------------------------------------- | ------------------------------------------------------------ |
| 🟨 Mediante **atributos HTML**         | `<button onClick="..."></button>`       | [Eventos desde atributos HTML](https://lenguajejs.com/eventos/introduccion/eventos-html/) |
| 🟥 Mediante **propiedades Javascript** | `button.onclick = function() { ... }`   | [Eventos desde propiedades Javascript](https://lenguajejs.com/eventos/introduccion/eventos-javascript/) |
| ✅ Mediante `addEventListener()`       | `button.addEventListener("click", ...)` | [Eventos desde listeners](https://lenguajejs.com/eventos/introduccion/addeventlistener/) |

Cada una de estas opciones son formas equivalentes y alternativas de manejar eventos. Cada una de ellas tiene sus ventajas y desventajas. Por norma general, lo aconsejable, es utilizar la última, los **listeners**, ya que son las más potentes y flexibles.

#### Eventos desde HTML

Gestionar eventos Javascript mediante HTML.

Probablemente, la forma más fácil de trabajar con eventos Javascript es mediante **atributos de una etiqueta HTML**. Sin embargo, aunque es la más sencilla, también es la menos recomendable.

Un evento Javascript es una característica especial que ha sucedido en nuestra página y a la cual le asociamos una funcionalidad, de modo que se ejecute cada vez que suceda dicha característica especial. Por ejemplo, el evento click se dispara cuando el usuario hace click en un elemento de nuestra página.

```html
<button>Saludar</button>
```

En nuestro navegador nos aparecerá un botón con el texto "Saludar". Sin embargo, si lo pulsamos, no  realizará ninguna acción ni tendrá funcionamiento. Hay que darle la funcionalidad mediante Javascript. Para solucionar esto, podemos asociarle un evento mediante un atributo:

```html
<button onClick="alert('Hello!')">Saludar</button>
```









https://lenguajejs.com/eventos/introduccion/eventos-html/



# BOOTSTRAP 5

Bootstrap **es un framework que permite a los desarrolladores web construir páginas web responsives de una forma más rápida y sencilla**. En este sentido, proporciona un conjunto de componentes y plantillas CSS, HTML y JavaScript que cualquiera puede utilizar o modificar de manera gratuita.

Bootstrap **es una biblioteca de herramientas de código abierto optimizadas para el diseño de sitios y aplicaciones web**. Esta plataforma se basa en lenguaje HTML y CSS, e incluye una amplia gama de elementos de diseño, como formularios, botones y menús que se adaptan a diferentes formatos de navegación.

Bootstrap **es un framework CSS y Javascript diseñado para la creación de interfaces limpias y con un diseño responsive**. Además, ofrece un amplio abanico de herramientas y funciones, de manera que los usuarios pueden crear prácticamente cualquier tipo de sitio web haciendo uso de los mismos.



BootStrap es un potente kit de herramientas frontend extensible y repleto de funciones. Crea y personaliza con Sass, utiliza componentes y sistemas de cuadrícula prediseñados, y dale vida a tus proyectos con potentes plugins de JavaScript.

Para poder utilizar bootstrap desde nuestros archivos .jsp o .html, hay que copiar el codigo que aparece en su web https://getbootstrap.com/: (el que aparece abajo a la derecha)

en el header:

```jsp
<head>
	<meta charset="UTF-8">
	<title>VENTAS</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">	
</head>
```

antes de cerrar el body:

```jsp
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
```

NOTA: el primer enlace es de los estilos (link....) y se coloca en la cabecera por que todos los estilos van en la cabecera

el otro enlace va al final del body por que es para poder utilizar scripts



Si queremos utilizar código de bootstrap directamente, se puede copiar el código directamente en el código de nuestro html o jsp , por ejemplo un modal, un icono, si es un modal , se puede incluir en la parte de modal-body el contenido de código que queremos implementar. 



## Integración de Bootstrap

Una de las ventajas más grandes de Bootstrap es lo fácil que es integrarlo en cualquier proyecto web.

Existen dos formas principales de hacerlo:

**CDN (Content Delivery Network):** Puedes enlazar los archivos CSS y JavaScript de Bootstrap desde un servidor externo. Por ejemplo, agregar las siguientes líneas en el `<head>` de tu HTML:

```
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
```

Es la opción más rápida y sencilla para empezar.

**Archivos locales:** Descargar Bootstrap y añadir los archivos directamente a tu proyecto te permite tener más control, especialmente si planeas personalizar su diseño o trabajar sin conexión.

Solo necesitas agregar los archivos CSS y JS en tu carpeta de proyecto y enlazarlos.

## Personalización y extensión de Bootstrap

Bootstrap no solo ofrece herramientas listas para usar, sino que también es altamente personalizable. Aquí hay dos formas principales de hacerlo:

1. **Uso de variables Sass:** Bootstrap permite personalizar el diseño utilizando variables Sass. Por ejemplo, puedes cambiar el color primario de tu proyecto modificando la variable `$primary` en tu archivo Sass.
2. **Integración con otros frameworks:** Bootstrap se puede combinar con frameworks como React o Angular, extendiendo sus capacidades y permitiendo desarrollar aplicaciones dinámicas. Puedes utilizar componentes de Bootstrap en tus aplicaciones, facilitando el desarrollo de interfaces interactivas.

## Buenas prácticas y errores comunes

1. **No Sobrecargar el HTML con clases:** Aunque Bootstrap ofrece muchas clases, usa solo las necesarias para mantener tu código limpio y legible. Un código limpio facilita la comprensión y mantenimiento del proyecto.
2. **No Personalizar demasiado:** Si personalizas en exceso, perderás la flexibilidad de Bootstrap, lo que dificulta futuras actualizaciones. Trata de utilizar las clases predeterminadas siempre que sea posible.
3. **Optimización para móviles:** Asegúrate de aprovechar las clases responsivas para mejorar la experiencia móvil. Testea tu diseño en diferentes dispositivos para asegurar que funcione correctamente en todos ellos.