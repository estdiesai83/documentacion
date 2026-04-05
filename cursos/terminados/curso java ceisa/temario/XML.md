# XML

¿Qué es xml?

- XML (eXtensible Markup Language) es un lenguaje de marcado que permite definir y compartir datos en formato de texto. Se utiliza para estructurar y presentar información en páginas web, bases de datos, aplicaciones y más.

- XML está diseñado para almacenar y transportar datos.
- XML fue lanzado a finales de los 90. Fue creado para proporcionar datos autodescriptivos fáciles de usar y almacenar.
- XML se convirtió en una recomendación del W3C el 10 febrero de 1998.
- **XML no es un sustituto de html**
- XML está diseñado para ser autodescriptivo.
- XML está diseñado para transportar datos, no para mostrar datos.
- Las etiquetas XML no están predefiidas. Debe definir sus propias etiquetas.
- XML es independiende de la plataforma y del lenguaje.



XML (Lenguaje de Marcado Extensible) es un lenguaje de marcado utilizado para el almacenamiento y el intercambio de información estructurada. Ha sido desarrollado por **W3C** (World Wide Web Consotium) y está basado en **SGML** (Standard Generalized Markup Languaje, Lenguaje de Marcado Generalizado Estándar).

XML utiliza **etiquetas para definir elementos y atributos para proporcionar metadatos adicionales.** Estos elementos y atributos pueden anidarse y organizarse de manera jerárquica, lo que permite representar datos complejos de forma estructurada.

Al ser un lenguaje extensible, XML permite **definir y utilizar etiquetas personalizadas,** lo que lo hace altamente adaptable a diferentes necesidades.

XML es un **metalenguaje**, por lo tanto, puede ser **empleado para definir otros lenguajes.** Por ejemplo, algunos lenguajes basados en XML son:

- **RSS** (Really Simple Syndication).
- **SVG** (Scalable Vector Graphics, Gráficos Vectoriales Escalables).
- **XHTML** (eXtensible HyperText Markup Language, Lenguaje de Marcado de HiperTexto eXtensible).
- **SOAP** (Simple Object Access Protocol, Protocolo de Acceso a Objetos Simples).
- **GML** (Geography Markup Language, Lenguaje de Marcado Geográfico).
- **MathML** (Mathematical Markup Language, Lenguaje de Marcado Matemático).

Aunque XML ha sido ampliamente utilizado, **su poppularidad ha disminuido** en los últimos años debido a la adopción de otros formatos de intercambio de datos más eficientes y especializados como **JSON** (JavaScript Object Notation, Notación de Objeto de JavaScript).



Nota: 

- Los datos autodescriptivos son los datos que describen tanto su contenido como su estructura.

- Tiene tecnologías asociadas: XSD, DTD, XPath y XSLT.

- wsdl: es un lenguaje estándar que describe los servicios web. Se basa en XML y XML Schema (XSD)

  



## Características y ventajas de XML

- XML simplifica el intercambio de datos
- XML simplifica el transporte de datos.
- XML aumenta la disponibilidad de los datos.
- XML se puede utilizar para crear nuevos lenguajes de Internet.

![image-20250403094215297](/home/soa/.config/Typora/typora-user-images/image-20250403094215297.png)

![image-20250403094238961](/home/soa/.config/Typora/typora-user-images/image-20250403094238961.png)

```xml
<persona>
    <nombres>Elsa</nombres>
    <apellidos>Zambrano</apellidos>
    <fecha-de-nacimiento>
        <dia>18</dia>
        <mes>6</mes>
        <año>1996</año>
    </fecha-de-nacimiento>
</persona>
```

Los archivos de xml tienen la extension .xml



## Analizador o parser XML

En el ámbito de la programación, cuando se realiza una modificación en la estructura de datos, es necesario, actualizar la tecnología empleada para su extracción y manejo adecuado.

XML dispone de **analizadores o parsers, programas capaces de interpretar la sintaxis XML y extraer la información requerida.**

Podemos utilizar estos analizadores en nuestros propios programas, evitando así la necesidad de acceder directamente a los archivos XML y reduciendo nuestra carga de trabajo.



## Diferencias entre HTML y XML

HTML (HyperText Markup Language) y XML (eXTensible Markup Language) son dos lenguajes de marcado ampliamente utilizados, pero tienen diferencias significativas en cuanto a su estructura y propósito:

- **Propósito** (Purpose): HTML se utiliza principalmente para estructurar y presentar contenido web, mientras que XML se utiliza para almacenar y transportar datos estructurados de manera flexible.
- **Sintaxis** (Syntax): HTML tiene sintaxis predefinida y estándar que sigue reglas específicas para etiquetas y atributos. XML, por otro lado, permite crear una sintaxis personalizada y definir etiquetas y atributos según las necesidades del usuario.
- **Etiquetas** (tags): HTML tiene un conjunto limitados de etiquetas predefinidas que se utilizan para marcar diferentes tipos de contenido, como encabezados, párrafos, listas, etc. XML no tiene etiquetas predefinidas y permite al usuario definir sus propias etiquetas según la estructura de datos que se necesita representar.
- **Validación** (Validation): HTML se valida autimáticamente por los navegadores web para garantizar la correcta interpretación del contenido. XML puede ser validado mediante DTD (Document Type Definition) o esquemas XML (XML Schema) para asegurar que cumpla con una estructura y formato determinados.
- **Presentación** (Presentation): HTML se centra en la presentación visual del contenido web, permitiendo el uso de estilos para diseñar la apariencia de la página. XML no se preocupa por la presentación visual y se enfoca en la estructura y organización de los datos, aunque también permite estilos.
- **Uso de atributos** (Use of atributes): HTML utiliza atributos predefinidos para proporcionar información adicional sobre los elementos, como el atributo "src" en la etiqueta de imagen para especificar la ruta de la imagen. XML permite al usuario definir sus propios atributos según las necesidades del modelo de datos.



## Usos de XML

Se utiliza en una amplia gama de aplicaciones en la actualidad, desempeñando un papel crucial en diversos aspectos de la gestión de datos y la presentación de información. Algunos de los usos más destacados de XML incluyen:

- **Mapas del Sitio:**  XML es fundamental para crear mapas del sitio, que son esenciales para la optimización de motores de búsqueda (SEO). Los mapas del sitio en formato XML permiten a los motores de búsqueda rastrear un sitio web de manera más eficiente. Para más información Sitemaps.org
- **Imágenes SVG:** XML se utiliza en el formato de imágenes escalables vectoriales (SVG), que es un estándar para describir gráficos vectoriales en la web. SVG utiliza XML para definir imágenes y comportamientos, ofreciendo gráficos de alta calidad que son escalables sin perder resolución. Para más información Aspose.
- **Configuraciones y datos de aplicaciones:** Muchas aplicaciones utilizan XML para almacenar configuraciones y datos. Por ejemplo, Microsoft Office utiliza XML para guardar y estructurar los datos de sus documentos, como Word, Excel y PowerPoint.
- **Servicios Web y APIs:** XML es muy útil para el intercambio de datos en servicios web y APIs. SOAP, un protocolo para intercambiar información estructurada en la implementación de servicios web, utiliza XML como su formato de mensaje.
- **RSS Feeds:** RSS (Really Simple Syndication) es un formato basado en XML para distribuir contenido actualizado regularmente, como entradas de blogs o noticias. Los RSS feeds permiten a los usuarios mantenerse informados sobre el contenido nuevo de sus sitios webs favoritos.
- **Configuraciones de software y hardware:** En el ámbito del desarrollo de software y hardware, XML se usa para describir configuraciones y especificaciones, debido a su flexibilidad y capacidad para estructurar datos complejos de manera clara. 
- **Bases de datos:** Algunos sistemas de gestión de bases de datos utilizan XML para exportar e importar datos, lo que facilita la transferencia y manipulación de grandes volúmenes de información entre diferentes sistemas.



## Declaración XML

Es una instrucción que se coloca al comienzo de un documentos XML para indicar que el archivo sigue la sintaxis y reglas del lenguaje XML. La sintaxis básica de declaración XML es:

```xml
<?xml version="1.0" encoding="UTF-8"?>
```

Donde:

- <?xml indica el inicio de la declaración XML
- version="1.0" especifica la versión de XML utilizada.
- encoding="UTF-8": indica la codificación de caracteres utilizada en el documento. En este caso UTF-8, es una codificación común para admitir caracteres multilingües.

También se puede incluir la especificación del DTD (Document Type Definition) o el esquema XML utilizado en el documento. Estas propiedades adicionales se agregan utilizando atributos en la declaración XML.

El atributo **standalone** es opcional y se utiliza para indicar si el documento XML puede funcionar de manera independiente o si se requiere información adicional de otro archivo externo (como un DTD o un esquema) para ser interpretado.

- **standalone="yes"**: indica que el documento XML **no depende de ningún archivo externo** y puede ser interpretado de manera autónoma. Todos los datos necesarios para la interpretación están contenidos dentro del propio archivo XML.
- **standalone="no"**: indica que el documento XML **depende de un archivo externo**. El archivo externo proporciona la definición de la estructura y reglas que el XML debe seguir.

```xml
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
```



## Elementos

Un documento XML está **formado por una jerarquía de elementos a partir de un elemento raíz único.** Los elementos constan de una **etiqueta de inicio <nombreetiqueta>**, un valor y una **etiqueta de fin </nombreetiqueta>  ** 

```xml
<?xml version="1.0" encoding="UTF-8"?>
<root>
	<element1>Contenido del elemento1</element1>
    <element2 atributo="valor">Contenido del elemento2</element2>
    <element3>
        <subelement>Contenido del subelemento</subelement>
    </element3>
</root>
```

El elemento raiz <root> es el contenedor principal del documento XML. Todos los demás elementos deben estar contenidos dentro de él.

Los elementos se han definido utilizando etiquetas. Por ejemplo <element1> y <element2> son elementos en el ejemplo.

Los elementos pueden tener atributos, que se definen dentro de la etiqueta de apertura. Por ejemplo: <element2 atributo="valor">

Además, los elementos pueden contener texto, como se muestra en los ejemplos con el contenido entre las etiquetas de apertura y cierre y también pueden tener otros elementos, formando una estructura jerárquica.



## Nombre de los elementos y sintaxis

El nombre de un elemento o tag debe **empezar por una letra o el guin bajo, seguido por letras, dígitos, el carácter punto, el carácter guión medio o el carácter guión bajo**. Además, el nombre no deberá comenzar por la cadena XML, ya sea en mayúsculas o en minúsculas.

XML **distingue entre mayúsculas y minúsculas.**

Los nombres de los elementos son **definidos por el desarrollador** y es recomendable que sean lo más descriptivos posibles.

Ejemplo:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<profesor>
  <nombre>Andrea</nombre>
  <apellidos>Lluch Cruz</apellidos>
  <fecha-de-nacimiento>
      <día>28</día>
      <mes>2</mes>
      <año>2030</año>
   </fecha-de-nacimiento>
</profesor>
```



### Espacios en blanco y saltos de línea

Detrás del nombre de una etiqueta se permite escribir un espacio en blanco (blank space) o un salto de línea (line break). Por ejemplo, sintácticamente es correcto escribir

```xml
<nombre >Andrea</nombre>
```

Seria lo mismo que:

```xml
<nombre>Andrea</nombre>
```

Sin embargo no puede haber un salto de línea o un espacio en blanco antes o en medio del nombre de una etiqueta. En caso de que se necesite un salto de línea por organización del código, puede hacerse después de la etiqueta de apertura completa:

```xml
<nombre>
Andrea
</nombre>
```



### Elementos vacíos

En un XML, **un elemento no puede contener ningún valor**, es lo que se llama elemento vacio (empty element). Ejemplo:

```xml
<nombre></nombre>
```

El código anterios se puede escribir de la siguiente manera:

```xml
<nombre/>
```



## Atributos de los elementos XML

Los elementos XML pueden tener atributos. Mediante el uso de atributos podemos agregar la información sobre el elemento.

Son valores adicionales que se pueden asociar a elementos para **proporcionar información adicional** o metadatos sobre ellos. Los atributos se definen dentro de la etiqueta de apertura de un elemento y tiene un nombre y un valor.

La sintaxis básica de un atributo es:

```xml
<elemento atributo="valor">
```

Donde:

- elemento: es el nombre del elemento al que se le está asignando el atributo.
- atributo: es el nombre del atributo que se está definiendo.
- valor: es el valor asignado al atributo.

Ejemplo:

```xml
<persona nombre="Andrea" edad="30" profesion="profesora"/>
```

Los nombres de los atributos cumplen las mismas normas de sintaxis que los nombres de los elementos. Además todos los atributos de un elemento tienen que ser únicos y deben separarse con espacios en blanco.

Esto es incorrecto:

```xml
<persona nombre="Andrea" apellido="Lluch" apellido="Cruz"/>
```

Sin embargo, si es correcto escribir:

```xml
<persona nombre="Andrea" primerapellido="Lluch" segundoapellido="Cruz"/>
```



## Comentarios 

Para insertar comentarios (comments) para proporcionar explicaciones o notas adicionales. Los comentarios **no se interpretan** ni se muestran en la salida del documento XML, ya que es información destinada únicamente a los lectores del código.

```xml
<!-- Este es un comentario en XML -->
<etiqueta>Contenido de la etiqueta</etiqueta>
<!-- Otro comentario -->
<otra_etiqueta>Contenido de otra etiqueta</otra_etiqueta>
```

No se puede agregar comentarios en el interior de las etiquetas, ni tampoco escribir dos guiones seguidos en el interior de un comentario.



### Atributo **xml:space** 

Es un atributo especial que se utiliza para controlar cómo se manejan los espacios en blanco dentro de los valores de texto en un elemento XML. Este atributo se puede aplicar a cualquier elemento XML y tiene dos posibles valores:

- **default:** Es el valor por defecto, si no se especifica el atributo xml:space. Indica que los espacios en blanco dentro del valor de texto se manejan de acuerdo con las reglas normales de XML. Esto significa que los espacios en blanco iniciales y finales se eliminan y los espacios en blanco consecutivos se reducen a un solo espacio.
- **preserve:** Este valor indica que los **espacios en blanco dentro del valor de texto deben preservarse** tal como están, sin eliminación ni reducción. Esto es útil cuando se desea conservar los espacios en blanco significativos en el texto, como en los códigos de programación o los contenidos preformateados.

```xml
<elemento xml:space="preserve">
    Este es      un texto   con espacios  en   blanco
</elemento>
```



## Tabulaciones

Con Visual Studio Code se puede generar código xml mas fácilmente, para añadir extensiones referentes a xml, desde dentro de visual studio pulsamos en Ctrl + Shift +X e instalamos:

- XML Tools: 

```xml
<persona>
    <nombre>Andrea</nombre>
    <apellido>Lluch</apellido>
    <contacto>
        <email>andrea@example.com</email>
        <telefono>123456789</telefono>
    </contacto>
</persona>
```



## Como se crea un documento XML

Para crear un documento XML, se puede utilizar cualquier editor de texto (Bloc de notas) o editor de código (Visual Studio Code)

Creamos un archivo con una extensión .xml, por ejemplo, «mi_documento.xml».

```xml
<?xml version="1.0" encoding="UTF-8"?>
<libros>
  <libro>
    <titulo>El Gran Gatsby</titulo>
    <autor>F. Scott Fitzgerald</autor>
    <anio>1925</anio>
  </libro>
</libros>
```

En este ejemplo, hemos creado un elemento raíz `<libros>` que contiene un elemento hijo `<libro>`. El elemento `<libro>` tiene elementos hijos como `<titulo>`, `<autor>` y `<anio>`, que representan los datos de un libro específico.

Una vez que hayas creado el documento XML, puedes utilizarlo en aplicaciones, procesamiento de datos o intercambio de información según sea necesario.



## Carácteres especiales en XML

En XML y HTML, algunos caracteres tienen un significado especial (special characters) y no pueden ser usados directamente en el contenido del documento. En su lugar, se deben utilizar **entidades** (entities) o **referencias** (references) de caracteres para representar estos caracteres especiales.

1. **Entidades** (entities): Las entidades son secuencias de caraccteres que representas símbolos especiales. Comienzan con un (&) seguido de un nombre o número y terminan con un ;. Las entidades son fáciles de leer y entender.
2. **Códigos decimales** (decimal codes): Los códigos decimales son valores numéricos que representan símbolos en la tabla ASCII. Estos códigos se escriben en la forma &#n;, donde n es el número decimal correspondiente al símbolo.
3. **Códigos hexadecimales** (hexadecimal codes): Los códigos hexadecimales son valores numéricos en base 16 que representan símbolos en la tabla ASCII. Son similares a los códigos decimales, pero utilizan una representación en base 16 en lugar de base 10. Estos códigos se escribe en la forma &#xn; donde n es el valor hexadecimal correspondiente al simbolo.

![image-20250403095457146](/home/soa/.config/Typora/typora-user-images/image-20250403095457146.png)

Estas referencias se utilizan para **evitar conflictos con la sintaxis XML** y asegurar que los caracteres especiales sean interpretados correctamente.

En el siguiente ejemplo el carácter < se mostrará correctamente en el contenido del elementos sin causar errores en el análisis del documento XML:

```xml
<ejemplo>Esto es un ejemplo del uso del caracter &lt; en XML</ejemplo>
```

Si ponemos por ejemplo:

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- Utilizando el código Unicode hexadecimal -->
<texto>&#x20AC;</texto>
<!-- Utilizando el código Unicode decimal -->
<texto>&#8364;</texto>
<!-- Utilizando el nombre de entidad predefinida -->
<texto>&euro;</texto>
```

nos muestra:

![image-20250403104257867](/home/soa/.config/Typora/typora-user-images/image-20250403104257867.png)



### Cómo asociar un archivo CSS a un documento XML

Para asociar un archivo CSS (Cascading Style Sheets, Hojas de estilo en cascada) a un documento XML, se utiliza la **declaración** del procesamiento llamada **xml-stylesheet**. Esta declaración se coloca en la parte superior del documento XML, después de la declaración XML.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/css" href="estilos.css"?>
<root>
    <!-- Contenido del documento XML -->
</root> 
```

- **type**: especifica el tipo de archivo de estilo. en este caso es "text/css".
- **href:** Indica la ubicación del archivo CSS que se debe aplicar al documento XML. 



### ¿Por qué es tan necesario usar CSS?

Las etiquetas HTML tienen funcionalidades bien definidas y los navegadores tienen una hoja de estilo predefinida. Así por ejemplo la etiqueta <h1> suele corresponderse con una fuente Times New Roman de tamaño 24 puntos. Sin embargo, para XML el navegador no sabe cómo tienen que representar cada etiqueta, ya que son definidas por el programador/a.

Su uso es importante por varias razones:

- **Separación de preocupaciones:** CSS permite separar el estilo visual de la estructura y contenido del documento XML. Esto facilita la mantenibilidad del código, ya que los cambios en la apariencia no afectarán la estructura ni el contenido del documento.
- **Consistencia visual:** Con CSS, se pueden definir estilos consistentes en todo el documento XML. Esto asegura que todos los elementos se vean de la misma manera, lo que mejora la experiencia del usuario y ofrece una apariencia coherente.
- **Flexibilidad y personalización:** CSS ofrece una amplia gama de propiedades y selectores que permiten personalizar la apariencia de los elementos XML. Esto ofrece flexibilidad para adaptar el diseño a diferentes dispositivos, tamaños de pantalla o preferencias de los usuarios.
- **Mantenibilidad y reutilización:** Al usar CSS, es posible definir estilos una vez y aplicarlos a múltiples elementos en el documento XML. Esto promueve la reutilización de estilos y simplifica la tarea de mantenimiento, ya que los cambios en el diseño se pueden realizar de forma centralizada en la hoja de estilos CSS.
- **Mejora de la accesibilidad:** CSS ofrece características para mejorar la accesibilidad del documento XML, como el ajuste del tamaño del texto, el contraste de color y la navegación mediante el uso de estilos visuales claros y consistentes.



Ejemplo:

pruebLibros.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet href="pruebaLibros.css" type="text/css"?>

<catalog>
   <book>
      <title>Clean Code</title>
      <author>Robert C. Martin</author>
      <year>2008</year>
      <publisher>Prentice Hall</publisher>
   </book>
   <!-- Agrega al menos tres libros más siguiendo este formato -->
</catalog>
```

 pruebaLibros.css

```css

catalog{
   background-color: #f2f2f2;
   font-family: "Segoe UI’, Tahoma, Geneva, Verdana, sans-serif";
   color: #333;
   padding: 20px;
}

book{
   border: 1px sólido #ccc;
   box-shadow: 2px 2px 4px rgba(0,0,0,0.1);
   margin-bottom: 15px;
   padding: 15px;
   border-radius: 8px;
   background-color: #fff;
   
}

title{
   font-size: 20px;
   font-weight: bold;
   color: #007bff
}

author{
   font-size: 18px;
   font-style: italic;
   color: #555;
}

year,
publisher{
   font-size: 16px;
   color: #666;
}
```

![image-20250404142806893](/home/soa/.config/Typora/typora-user-images/image-20250404142806893.png)



## CDATA en XML

Una sección **CDATA** (Character Data, Comentarios de Datos) se utiliza para incluir contenido que tiene caracteres como <,>, etc sin que se interpreten como marcado XML por el analizador.

La sintaxis es la siguiente:

```xml
<![CDATA[ Contenido que debe ser tratado como datos]]>
```

Dentro de la sección CDATA, podemos insertar cualquier tipo de contenido, incluyendo texto, etiquetas XML u otros caracteres especiales. El contenido dentro de la sección CDATA se considera como texto sin formato y no se procesa como marcado XML. 

Ejemplo de cómo utilizar una sección CDATA en XML:

```xml
<documento>
    <titulo>Documento con código HTML</titulo>
    <contenido>
        <![DATA[
        <h1>Título de la página</h1>
        <ul>
            <li>Elemento1</li>
            <li>Elemento2</li>
            <li>Elemento3</li>
        </ul>
        ]]>
    </contenido>
</documento>
```

En este ejemplo, la etiqueta <contenido> utiliza una sección CDATA para incluir código HTML en su interior. El contenido dentro de la sección CDATA no se interpretará como marcado XML, por lo que el código HTML se mostrará tal cual.



### Verificar que un documento xml está bien formado en VS Code, se puede:

1. **Instalar una extensión de XML:** XML Tools

2. **Abrir el documento XML**

3. **Utilizar la Extensión:** si tienes instalada XML Tools o una extensión similar, normalmente analizará automáticamente el documento XML. Si el archivo está mal formado, la extensión resaltará los errores.

4. **Comprobación manual:** revisar la sintaxis.

5. **Formatear el documento:** Se puede utilizar la función de formateo automático de XML Tools para organizar y limpiar el código, lo que puede ayudar a identificar errores de formato.

   Haz click derecho en el documento y selecciona "Format Document" o utiliza el atajo Shift+Alt+F en Windows/Linux o Shift+Option+F en macOs.

   

### Documentos XML válidos

Un **documento válido** (valid document) es aquel que además de estar bien formado, cumple con un conjunto de reglas adicionales definidas en un **DTD** (Document Type Definition, Definición de Tipo de Documento) o en un esquema **XSD** (XML Schema Definition, Definición de Esquema XML) . Ejemplo de un documento válido y bien formado.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<libreria xmlns="http://www.example.com/libreria" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.example.com/libreria libreria.xsd">
  <libro>
    <titulo>El Gran Gatsby</titulo>
    <autor>F. Scott Fitzgerald</autor>
    <anio>1925</anio>
  </libro>
  <libro>
    <titulo>1984</titulo>
    <autor>George Orwell</autor>
    <anio>1949</anio>
  </libro>
</libreria>
```

 Además de cumplir con las reglas de sintaxis, se está validando contra un esquema XML llamado "libreria.xsd" que define la estructura y restricciones para los elementos y atributos del documento. La declaración del espacio de nombres, xmlns, y la referencia al esquema en el atributo xsi:schemaLocation son utilizados para asociar el documento con el esquema y validar su conformidad.

## Validación de un documento XML con XSD (XML Schema)

**EJEMPLO** Se quiere almacenar una lista de marcadores de páginas web, guardando de cada uno de ellos su nombre, una descripción y su URL. Para ello, se ha escrito el siguiente documento XML (**"marcadores.xml"**) asociado al archivo **"marcadores.xsd"**:

```xml
<?xml version="1.0" encoding="UTF-8"?> 
<marcadores xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="marcadores.xsd">    <pagina>
    	<nombre>Abrirllave</nombre
        <descripcion>Tutoriales de informática</descripcion>
    <url>http://www.abrirllave.com/</url>
    </pagina>    
    <pagina>
        <nombre>Wikipedia</nombre>
        <descripcion>La enciclopedia libre.</descripcion>
        <url>http://www.wikipedia.org/</url> 
    </pagina> 
    <pagina>
        <nombre>W3C</nombre>
        <descripcion>World Wide Web Consortium.</descripcion>
        <url>http://www.w3.org/</url>
    </pagina> 
</marcadores>
```

- Para vincular un esquema a un documento XML, es obligatorio que este último haga referencia al espacio de nombres **http://www.w3.org/2001/XMLSchema-instance**. Para ello, habitualmente se utiliza el prefijo **xsi**.
- El atributo **noNameSchemaLocation** permite referenciar a un archivo con la definición de un esquema que no tiene ningún espacio de nombres asociado. En este caso, dicho archivo es **"marcadores.xsd"**.

El esquema XML guardado en **"marcadores.xsd"** y que permita validar el documento XML **"marcadores.xml"** podría ser:

```xml-dtd
<?xml version="1.0" encoding="UTF-8"?> 
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">  
	<xs:element name="marcadores">
		<xs:complexType>
			<xs:sequence>
        		<xs:element name="pagina" maxOccurs="unbounded">         
                    <xs:complexType>
                        <xs:sequence>
                            <xs:element name="nombre" type="xs:string"/>
                            <xs:element name="descripcion" type="xs:string"/>
                            <xs:element name="url" type="xs:string"/>             
                        </xs:sequence>
                    </xs:complexType>
                </xs:element>
			</xs:sequence>
		</xs:complexType>
	</xs:element>
</xs:schema>
```

Para estar bien formado, un esquema XML tiene que cumplir las mismas reglas de sintaxis que cualquier otro documento XML.



Por otra parte, hay que tener en cuenta que, en todos los esquemas XML, el elemento raíz es "schema". Ahora bien, para escribirlo, es muy común utilizar el prefijo **xsd** o **xs**.

Con **xmlns:xs="http://www.w3.org/2001/XMLSchema"** se ha indicado que:

- Los elementos y tipos de datos utilizados en el esquema pertenecen al espacio de nombres **http://www.w3.org/2001/XMLSchema**.
- Dichos elementos y tipos de datos deben llevar el prefijo **xs** (**xs:schema**, **xs:element**, **xs:complexType**, **xs:string**...).

Fíjese también que:

- Los elementos "marcadores" y "página" son de tipo complejo (**complexType**), ya que, contienen a otros elementos.
- **sequence** indica que los elementos hijo deben aparecer, en el documento XML, en el mismo orden en el que sean declarados en el esquema.
- Los elementos "nombre", "descripción" y "url" son de tipo simple (**string** en este caso) y no pueden contener a otros elementos.
- Mediante **maxOccurs="unbounded"** se ha indicado que pueden aparecer ilimitados elementos "página" en el documento XML.



## Ejercicios prácticos:

Si queremos probar xml con Eclipse, creamos un proyecto dinamic project t en webapp creamos un archivo .xml y para ver el código pulsar en la pestaña source y se pulsamos en desing nos muestra el contenido en modo de arbol 

En source nos muestra:

![image-20250403103515836](/home/soa/.config/Typora/typora-user-images/image-20250403103515836.png)

En desing nos muestra:

![image-20250403103539133](/home/soa/.config/Typora/typora-user-images/image-20250403103539133.png)



Le ponemos estilo a un archivo xml.

ejercicio1.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/css" href="style.css"?>

<root>
   <element attribute="value">Contenido</element>
</root>
```

style.css

```css
@charset "UTF-8";

root{
	font-family: Arial, Helvetica, sans-serif;
	color: red;
	margin-top: 200px;
	margin-left: 400px;
}

element{
	background-color: blue;
	padding: 10px;
	border: 1px solid black;		
}
```

Si lo ejecutamos, nos muestra lo siguiente

![image-20250403105508739](/home/soa/.config/Typora/typora-user-images/image-20250403105508739.png)





Procesamiento de ficheros XML.

# Analizadores sintácticos o PARSER

Java tiene varios analizadores XML que admiten estándares de tipo de objeto y de tipo de evento. Podemos leer, crear, consultar y modificar los documentos XML utilizando estas APIs. Las APIs proporcionan interfaces que representan los documentos XML, métodos para recuperar y modificar los elementos y atributos de los documentos XML.



Los analizadores XML son bibliotecas o paquetes de software que ayudan a las aplicaciones cliente a interactuar con documentos XML a través de interfaces. Se utilizan para comprobar la sintaxis de XML y validarla de acuerdo con el esquema DTD o XML. Los analizadores pueden estar basados en documentos o en eventos.

- **DOM** (Modelo de Objetos de documentos)

  Es propuesto por el W3C (World Wide Wide Consortium). Es una API basada en árbol y crea todo el documento XML en un árbol dentro de la memoria principal. Por lo tanto, consume más memoria. La API de DOM proporciona interfaces para acceder, agregar y modificar los documentos que son independientes de los lenguajes de programación. DOM es adecuado para documentos pequeños, ya que consume mas memoria. Podemos leer y crear documentos utilizando las APIs de DOM. 

  ![image-20250405181331125](/home/soa/.config/Typora/typora-user-images/image-20250405181331125.png)

- **SAX** (API simple para XML)

  Es una API basada en eventos. No cargará todo el documento. En su lugar, carga pequeñas partes del archivo XML. SAX es una API de solo lectura, no podemos crear documentos XML usuando SAX. Se utiliza para procesar documentos XML de gran tamaño, ya que consume menos memoria.

  ![image-20250405181451089](/home/soa/.config/Typora/typora-user-images/image-20250405181451089.png)

- **JDOM**

  Es una API de código abierto que admite DOM, SAX, XSLT y XPath. Se integra tanto con DOM como con SAX.

- **StAX**
- **DOMJ4**
- **Xpath**: Permite localizar y seleccionar elementos o atributos en documentos XML.

![image-20250405181630840](/home/soa/.config/Typora/typora-user-images/image-20250405181630840.png)

![image-20250405181653314](/home/soa/.config/Typora/typora-user-images/image-20250405181653314.png)





### **Métodos DOM**

- **Document.getDocumentElement()**

  Devuelve el elemento raíz del documento

- **Document.getElementsByTagName()**

  Devuelve una NodeList de todos los elementos dentro del nombre de etiqueta dado.

- **Node.getFirstChild()**

  Devuelve el primer elemento secundario de un nodo determinado.

- **Node.getLastChild()**

  Devuelve el último elemento secundario de un nodo determinado.

- **Node.getNextSibiling()**

  Devuleve el siguiente elemento del mismo nivel del nodo dado.

- **Node.getPreviousSibling()**

  Devuelve el elemento raíz del documento.

- **Node.getAtributte(attrName)**

  Devuelve el atributo con el nombre solicitado para un nodo determinado



**Nodo**: es un objeto como cualquier otro, y sus atributos serán encargados de hacer el trabajo de almacenar y apuntar a otro nodo. Cada nodo tiene dos atributos:

- Atributo "contenido": usado para almacenar un objeto
- Atributo "siguiente": usado para hacer referencia al siguiente nodo de la lista.





Abrir un fichero XML 

**Crear un objeto DocumentBuilder**

Define la API para obtener instancias de documento DOM de un documento XML.

Una vez que se obtiene una instancia de esta clase, se puede analizar XML de una variedad de orígenes de entrada (InputStream, File, URLs y SAX InputSources).

```java
DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
DocuemntBuilder docBuilder = fabrica.newDocumentBuilder();
```



**Lectura del XML**

Con estas instrucciones se obtiene en memoria el contenido completo del fichero XML.

```java
Archivo xmlFile = new File("input.xml");
```



```java
StringBuilder xmlBuilder = new StringBuilder();
PENDIENTE
```

Analizar el documento

```java
Document documento = docBuilder.parse(fichero);
```

A partir de ese momento, todas las **acciones sobre el documento XML** se deberán realizar sobre la variable documento de la clase **Document** de Java, que permite la gestión de documentos XML basándose en el modelo DOM. 

Las clases *DocumentBuilderFactory* y *DocumentBuilder* se encuentran en el paquete ***javax.xml.parsers*** de Java, y La clase *Document* es del paquete ***org.w3c.dom***, por lo que se requiere importar dichos paquetes para usar estas clases.



### Mostrar o guardar el contenido de un documento XML

Para realizar cualquiera de esas operaciones, es necesario crear previamente un transformador al que se le indique el documento y el destino que se le va a dar.

```java
TransformerFactory transformerFactory = TransformerFactory.newInstance();
Transformer transformer = transformerFactory.newTransformer();

DOMSource source = new DOMSource(doc);
FileOutputStream output = new FileOutputStream(fichero);
```

El objeto transformador que se ha creado dispone de un **método transform** que permite realizar el volcado del documento que se encuentra en memoria o otro formato.

Se deben indicar dos parámetros:

- **documento de origen:**
- **objeto Result:** en el que se obtendrá el resultado de la transformación. Para obtener un objeto Result se puede crear un objeto de la clase StreamResult indicando como parámetro un objeto File, OutStream, String o Writer.



**Análisis de varios elementos de XML**

Para analizar un documento XML con múltiples elementos,  necesitamos usar bucles. El método **getChildsNodes()**  recupera todos los nodos secundarios de un elemento y los devuleve como NodeList. Necesitamos recorrer todos los elementos de la NodeList obtenida y recuperar la información deseado sobre cada elemento como lo hicimos en las secciones anteriores.



**Crear documento XML desde DOM**

La API del analizador DOM de Java tiene métodos, interfaces y clases para crear documentoas XML. Con esta API, podemos crear documentos XML desde cero a través de nuestras aplicaciones java PENDIENTE

Crear un elemento básico

Usamos el método createElemento("element_name"). Este método toma el nombre del elemento como argumento y devuelve un nuevo  objeto Elemento.

Después 



Creación de archivos con atributos



Para modificar un archivo creado de xml









Ejemplo de como se utiliza los métodos de java para analizar un archivo xml

Creamos un proyecto en eclipse  de tipo Java Project  llamado Colegio y dentro de src creamos un archivo de tipo xml llamado "multipleElementos.xml" y creamos una clase de java llamada MultiplesElementosXmlParsing.java

mutiplesElementos.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>

<colegio>
	<departamento>
		<nombre>Informatica</nombre>
		<estudiantes>50</estudiantes>
	</departamento>
	
	<departamento>
		<nombre>Electricidad</nombre>
		<estudiantes>20</estudiantes>
	</departamento>
	
	<departamento>
		<nombre>Mecanica</nombre>
		<estudiantes>10</estudiantes>
	</departamento>
	
	<departamento>
		<nombre>Electronica</nombre>
		<estudiantes>30</estudiantes>
	</departamento>
</colegio>
```

MultiplesElementosXmlParsing.java

```java
package clases;

import java.io.File;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.w3c.dom.Element;

public class MultiplesElementosXmlParsing {

	public static void main(String[] args) {
		
		try {
			File inputXmlFile = new File("src/multiplesElementos.xml");
			
			// Define una API de fábrica que permite a las aplicaciones 
			// obtener un analizador que produce árboles de objetos DOM a partir de documentos XML
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			// Define la API para obtener instancias de documento DOM de un documento XML
			DocumentBuilder docBuilder = dbFactory.newDocumentBuilder();
			Document xmldoc = docBuilder.parse(inputXmlFile);
			
			Element element = xmldoc.getDocumentElement();
			System.out.println("Nombre del elemento del "+ element.getTagName());
			
			NodeList nList = element.getChildNodes();
			
			for(int temp=0; temp<nList.getLength();temp++) {
				Node nNode = nList.item(temp);
				System.out.println("\nElemento : "+nNode.getNodeName());
				
				if(nNode.getNodeType()==Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;
					System.out.println("nombre del departamento: "+eElement.getElementsByTagName("nombre").item(0).getTextContent());
					System.out.println("estudiantes del departamento: "+eElement.getElementsByTagName("estudiantes").item(0).getTextContent());
				}				
			}		
		} catch (Exception e) {
			System.out.println("Nombre del elemento del "+ e.getMessage());
			e.printStackTrace();
		}
	}
}
```







Ejemplo de como se crear un archivo xml desde cero con métodos de java.

Creamos un projecto de tipo Java project llamado AnalizadoresDOM y creamos una clase createXmlDemo.java

```java

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

public class CreateXmlDemo {

	public static void main(String[] args) {
		try {
			// Creamos un documento xml desde cero
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newDefaultInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			
			Document doc = dBuilder.newDocument();
			Element rootElement = doc.createElement("cars");
			doc.appendChild(rootElement);
			
			Element supercar = doc.createElement("supercar");
			rootElement.appendChild(supercar);
			supercar.appendChild(doc.createTextNode("Ferrari"));
			
			TransformerFactory transformerfactory = TransformerFactory.newInstance();
			Transformer transformer = transformerfactory.newTransformer();
			
			DOMSource source = new DOMSource(doc);

		    StreamResult result = new StreamResult("src/cars.xml");
		    transformer.transform(source, result);
		    
		    StreamResult consoleResult = new StreamResult(System.out);
			transformer.transform(source, consoleResult);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
```

Al ejecutar la clase, nos crea un archivo cars.xml con la siguiente estructura:

![image-20250407105635710](/home/soa/.config/Typora/typora-user-images/image-20250407105635710.png)

## Prueba2

Para crear un archivo xml con atributos nos creamos otra clase createXmlAtributte	

```java

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Attr;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

public class createXmlAtributeDemo {

	public static void main(String[] args) {
		
		try {
			// Creamos un archivo xml desde cero con atributos
			DocumentBuilderFactory dFactory = DocumentBuilderFactory.newDefaultInstance();
			DocumentBuilder dBuilder = dFactory.newDocumentBuilder();
			
			Document doc = dBuilder.newDocument();
			Element rootElement = doc.createElement("cars");
			doc.appendChild(rootElement);
			
			Element supercar = doc.createElement("supercars");
			rootElement.appendChild(supercar);
			
			Attr attr = doc.createAttribute("company");
			attr.setValue("Ferrari");
			supercar.setAttributeNode(attr);
			
			Element carname1 = doc.createElement("carname");
			Attr attrType1 = doc.createAttribute("type");
			attrType1.setValue("fomula one");
			carname1.setAttributeNode(attrType1);			
			carname1.appendChild(doc.createTextNode("Ferrari 101"));
			supercar.appendChild(carname1);
			
			Element carname2 = doc.createElement("carname");
			Attr attrType2 = doc.createAttribute("type");
			attrType2.setValue("sports");
			carname2.setAttributeNode(attrType2);		
			carname2.appendChild(doc.createTextNode("Ferrari 102"));
			supercar.appendChild(carname2);
			
			
			TransformerFactory transformerfactory = TransformerFactory.newInstance();
			Transformer transformer = transformerfactory.newTransformer();
			
			DOMSource source = new DOMSource(doc);

		    StreamResult result = new StreamResult("src/carsatribute.xml");
		    transformer.transform(source, result);
		    
		    StreamResult consoleResult = new StreamResult(System.out);
			transformer.transform(source, consoleResult);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
```

Al ejecutar la clase, nos crea un archivo carsatribute.xml con la siguiente estructura.

![image-20250407105550182](/home/soa/.config/Typora/typora-user-images/image-20250407105550182.png)



**Prueba3**

Para modificar un archivo xml existente, nos creamos la clase ModifyXmlDemo.java

```java

import java.io.File;
import java.io.FileOutputStream;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

public class ModifyXmlDemo {

	public static void main(String[] args) {
		
		try {
			DocumentBuilderFactory docFactory = DocumentBuilderFactory.newDefaultInstance();
			DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
			
			// Cogemos el archivo xml que queremos modificar			
			File inputFile = new File("src/colegio.xml");
			
			// Ahora parseamos el documento
			Document doc =docBuilder.parse(inputFile);
			
			// Recorremos la lista de elementos del archivo xml
			NodeList depList = doc.getElementsByTagName("departament");
			
			for(int i=0; i<depList.getLength();i++) {
				Element element = (Element)(depList.item(i));
				
				String s = element.getElementsByTagName("name").item(0).getTextContent();
				if(s.equals("Electrical and Electronics")){
					Element staffCount = (Element)element.getElementsByTagName("staffCount").item(0);
					staffCount.setTextContent("250");
				}
			}
			
			TransformerFactory transformerFactory = TransformerFactory.newDefaultInstance();
			Transformer transformer = transformerFactory.newTransformer();
			
			DOMSource source = new DOMSource(doc);
			FileOutputStream output = new FileOutputStream("src/colegio.xml");
			
			StreamResult result = new StreamResult(output);
			transformer.transform(source, result);
			
			StreamResult consoleResult = new StreamResult(System.out);
			transformer.transform(source, consoleResult);			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
```





## DTD

**DTD** (Document Type Definition, Definición de Tipo de Documento) es un lenguaje de marcado utilizado para definir la estructura y los tipos de datos permitidos en un documento XML.

Proporciona un conjunto de reglas y especificaciones que permiten validar y verificar la conformidad de un documento XML con respecto a su estructura y contenido.

En ausencia de un DTD, cualquier etiqueta que aparezca en un documento XML se considerará válida. En este caso, el parser solo puede verificar si el documento está bien formado.

No obstante, en entornos profesionales donde se utiliza XML, es fundamental especificar un DTD que defina de manera formal el lenguaje de etiquetado requerido. Esto debe hacerse como primer paso antes de comenzar a escribir cualquier documento XML.

Al definir un DTD, se establecen reglas específicas sobre los elementos permitidos, los atributos que pueden contener, la estructura jerárquica y otras restricciones.

### Importancia de definir un DTD

Permite garantizar que los documentos XML creados cumplan con las reglas y requisitos establecidos por el lenguaje. Esto ayuda a mantener la consistencia y la integridad de los documentos, así como facilitar el intercambio de datos entre diferentes sistemas y aplicaciones que utilizan XML.



### Declaración del DTD externo al documento XML que se encuentra de forma local o en una URL específica

La declaración de un DTD se coloca inmediatamente después de la definición de la versión y codificación del archivo XML. Esto asegura que el procesador XML reconozca las reglas definidas en el DTD antes de interpretar el contenido del documento.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE rootElement SYSTEM "dtdFile.dtd">
<rootElement>
    <!-- Contenido del documento XML -->
</rootElement>
```

Donde rootElement es el nombre del elemento raiz del documento XML, SYSTEM indica que el archivo DTD externo se encuentra localmente en una dirección accesible mediante una ruta o URL y "dtdFile.dtd" es el nombre del archivo que contiene la definición del DTD o la URL en la que se encuentra el archivo.

Ejemplo:

biblioteca.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE biblioteca SYSTEM "biblioteca.dtd">
<biblioteca>
    <libro>
        <titulo>El Señor de los Anillos</titulo>
        <autor>J.R.R. Tolkien</autor>
        <anio>1954</anio>
    </libro>
    <libro>
        <titulo>1984</titulo>
        <autor>George Orwell</autor>
        <anio>1949</anio>
    </libro>
</biblioteca>
```

biblioteca.dtd

```dtd
<!ELEMENT biblioteca (libro+)>
<!ELEMENT libro (titulo, autor, anio)>
<!ELEMENT titulo (#PCDATA)>
<!ELEMENT autor (#PCDATA)>
<!ELEMENT anio (#PCDATA)>
```

1. Dentro de los corchetes `[...]`, se definen los elementos y sus estructuras:

- `<!ELEMENT biblioteca (libro+)>` significa que el elemento `biblioteca` debe contener uno o más elementos `libro`.
- `<!ELEMENT libro (titulo, autor, anio)>` define que cada `libro` debe tener un `titulo`, un `autor` y un `anio`.
- `<!ELEMENT titulo (#PCDATA)>`, `<!ELEMENT autor (#PCDATA)>` y `<!ELEMENT anio (#PCDATA)>` indican que estos elementos deben contener datos de texto (Parsed Character Data).

### Declaración de un DTD externo al documento XML que se encuentra ubicado online con identificador único.

Otra forma de declarar el DTD es con "PUBLIC" en vez de con "SYSTEM". La declaración DTD con "PUBLIC" se utiliza para referenciae un DTD externo que está registrado con un identificador público único. Este identificador permite que los procesadores XML busquen el DTD en una ubicación común en un repositorio. Su uso más común es cuando el DTD es genérico o está diseñado para ser compartido entre diferentes sistemas o aplicaciones.



### Declaración de un DTD interno definido en el propio documento XML

Se realiza dentro del mismo documento XML. Este tipo de DTD se incluye entre la etiqueta DOCTYPE y define la estructura y las reglas que deben seguir los elementos y atributos dentro del documento XML. Ejemplo:

biblioteca.xml

```xml
<?xml versión="1.0" encoding="UTF-8"?>

<!DOCTYPE biblioteca [
    <!ELEMENT biblioteca (libro+)>
    <!ELEMENT libro (titulo, autor, anio)>
    <!ELEMENT titulo (#PCDATA)>
    <!ELEMENT autor (#PCDATA)>
    <!ELEMENT anio (#PCDATA)>
]>

<biblioteca>
    <libro>
        <titulo>El Señor de los Anillos</titulo>
        <autor>J.R.R. Tolkien</autor>
        <anio>1954</anio>
    </libro>
    <libro>
        <titulo>1984</titulo>
        <autor>George Orwell</autor>
        <anio>1949</anio>
    </libro>
</biblioteca>
```

### Declaración de tipos de elementos

En DTD, la declaración de tipos de elementos se utiliza para **definir la estructura y composición** de los elementos en un documento XML.

Permite especificar qué elementos son válidos en el documento y qué elementos pueden contener.

La sintaxis básica para la declaración de tipos de elementos en DTD es la siguiente:

```dtd
<!ELEMENT elemento tipo><!--Sintaxis-->
```

Donde "elemento" es el nombre del elemento que se está declarando y "tipo" es el tipo de elemento que se está especificando.

#### Tipos de elementos:

##### Elemento con contenido estructurado

Se utiliza para declarar elementos que tienen una estructura específica y pueden contener otros elementos en un orden determinado.

Se especifica mediante una combinación de elementos y operadores. Se distinguen varios tipos:

- **Secuenciales:** contiene elementos hijos

  ```dtd
  <!ELEMENT elemento (subelemento1, subelemento2, subelemento3)> <!--Sintaxis-->
  <!ELEMENT receta (titulo, ingredientes, pasos)> <!--Ejemplo-->
  ```

  Ejemplo:

  ```xml
  <!DOCTYPE receta [
      <!ELEMENT receta (titulo, ingredientes, pasos)> <!-- Declara que el elemento "receta" debe contener los elementos "titulo", "ingredientes" y "pasos", en ese orden específico.-->
      <!ELEMENT titulo (#PCDATA)>
      <!ELEMENT ingredientes (ingrediente+)>
      <!ELEMENT ingrediente (#PCDATA)>
      <!ELEMENT pasos (paso+)>
      <!ELEMENT paso (#PCDATA)>
  ]>
  <receta>
      <titulo>Tarta de Chocolate</titulo>
      <ingredientes>
          <ingrediente>Harina</ingrediente>
          <ingrediente>Azúcar</ingrediente>
          <ingrediente>Cacao en polvo</ingrediente>
      </ingredientes>
      <pasos>
          <paso>Mezclar todos los ingredientes secos.</paso>
          <paso>Hornear durante 25 minutos a 180 grados Celsius.</paso>
      </pasos>
  </receta>
  ```

- **Enumeración o alternativos** contiene uno y solo uno de los elementos hijos:

  ```dtd
  <!ELEMENT elemento (subelemento1 | subelemento2 | subelemento3)> <!--Sintaxis-->
  <!ELEMENT producto (telefono | tablet | laptop)> <!--Ejemplo-->
  ```

  Ejemplo:

  ```xml
  <!DOCTYPE productos [
  <!ELEMENT productos (producto+)>
  <!ELEMENT producto (telefono | tablet | laptop)> <!--  Define que el elemento producto debe contener uno de los tres elementos: telefono, tablet, o laptop.-->
  <!ELEMENT telefono (#PCDATA)>
  <!ELEMENT tablet (#PCDATA)>
  <!ELEMENT laptop (#PCDATA)>
  ]>
  <productos>
      <producto>
          <telefono>Modelo de teléfono</telefono>
      </producto>
      <producto>
          <tablet>Modelo de tablet</tablet>
      </producto>
      <producto>
          <laptop>Modelo de laptop</laptop>
      </producto>
  </productos>
  ```

##### Elemento vacío

Se representa con la palabra clave "EMPTY" y se utiliza para declarar elementos que no pueden contener contenido interno.

```dtd
<!ELEMENT elemento EMPTY> <!--Sintaxis-->
<!ELEMENT plato EMPTY> <!--Ejemplo-->
```

Ejemplo:

```xml
<!DOCTYPE recetario [
    <!ELEMENT recetario (plato)>
    <!ELEMENT plato EMPTY>
]>
<recetario>
    <plato/>
</recetario>
```

##### Elemento que contiene datos

Se representa con la palabra clave "PCDATA" (Parsed Character Data) y se utiliza para declarar elementos que pueden contener texto sin formato. Por ejemplo:

```dtd
<!ELEMENT elemento (#PCDATA)> <!--Sintaxis-->
<!ELEMENT titulo (#PCDATA)> <!--Ejemplo-->
```

Ejemplo:

```xml
<!DOCTYPE biblioteca [
<!ELEMENT biblioteca (libro+)>
<!ELEMENT libro (titulo, autor, descripcion)>
<!ELEMENT titulo (#PCDATA)> <!-- (#PCDATA): Estos elementos están definidos para contener texto sin formato (Parsed Character Data), lo que significa que pueden contener cualquier texto. -->
<!ELEMENT autor (#PCDATA)>
<!ELEMENT descripcion (#PCDATA)>
]>
<biblioteca>
    <libro>
        <titulo>El Principito</titulo>
        <autor>Antoine de Saint-Exupéry</autor>
        <descripcion>Un pequeño príncipe viaja por el universo descubriendo la extrañeza de los adultos.</descripcion>
    </libro>
    <libro>
        <titulo>Cien Años de Soledad</titulo>
        <autor>Gabriel García Márquez</autor>
        <descripcion>La historia mágica y realista de la familia Buendía en el mítico pueblo de Macondo.</descripcion>
    </libro>
</biblioteca>
```

##### Elementos con factor de repetición

El factor de repetición en DTD nos permiten establecer cuántas veces puede aperecer un elemento o grupo de elementos dentro de otro elemento.

| Carácter |                         Descripción                          |
| :------: | :----------------------------------------------------------: |
|    *     | El elemento o grupo de elementos puede repetirse 0 o más veces. |
|    ?     |  El elemento o grupo de elementos puede aparecer 0 o 1 vez.  |
|    +     | El elemento o grupo de elementos puede repetirse 1 o más veces. |
|   N/A    |       Por defecto, el elemento debe aparecer una vez.        |

Ejemplo:

###### Carácter '*' (cero o más repeticiones):

```dtd
<!ELEMENT elementos (elemento*)>
```

En este ejemplo, el elemento "elementos" puede contener cero o más repeticiones del elemento "elemento". Por ejemplo:

```dtd
<elementos>
  <elemento>Texto 1</elemento>
  <elemento>Texto 2</elemento>
</elementos>
```

Pero también puede no contener ningún elemento:

```dtd
<elementos></elementos>
```

###### Carácter '?' (cero o una repetición):

```dtd
<!ELEMENT elemento (subelemento?)>
```

En este ejemplo, el elemento "elemento" puede contener cero o una repetición del elemento "subelemento". Por ejemplo:

```dtd
<elemento>
  <subelemento>Texto</subelemento>
</elemento>
```

Pero también puede no contener el elemento "subelemento".

```dtd
<elemento></elemento>
```

###### Carácter '+' (una o más repeticiones):

```dtd
<!ELEMENT elementos (elemento+)>
```

El elemento "elementos" debe contener al menos una repetición del elemento "elemento", pero puede contener más:

```dtd
<elementos>
  <elemento>Texto 1</elemento>
  <elemento>Texto 2</elemento>
</elementos>
```

Pero no puede estar vacío, Si no especificamos ningún carácter de factor de repetición, se asume que el elemento debe aparecer una vez. Por ejemplo:

```dtd
<!ELEMENT elemento subelemento>
```

El elemento "elemento" debe contener una repetición del elemento "subelemento". Ejemplo:

```dtd
<elemento>
  <subelemento>Texto</subelemento>
</elemento>
```

No puede estar vacío ni tener más de una repetición.



##### Elementos mixtos

En DTD, se pueden declarar elementos mixtos que permiten la combinación de contenido de texto y otros elementos dentro del mismo elemento. Para declarar un elemento mixto, se utiliza la siguiente sintaxis:

```dtd
<!ELEMENT elemento (#PCDATA | subelemento)*>
```

En esta declaración, `elemento` es el nombre del elemento mixto. `(#PCDATA | subelemento)*` indica que el elemento puede contener contenido de texto (`#PCDATA`) y/o el subelemento especificado. El asterisco (*) al final indica que el contenido puede repetirse cero o más veces.

A continuación se muestra un ejemplo visual de una declaración de elemento mixto en DTD:

```dtd
<!ELEMENT paragraph (#PCDATA | emphasis | link)*>
```

En este ejemplo, el elemento `paragraph` puede contener texto (`#PCDATA`) y/o los elementos `emphasis` y `link`. Pueden haber cero o más repeticiones de estos elementos dentro de un `paragraph`.

```xml
<!DOCTYPE documento [
<!ELEMENT documento (paragraph+)>
<!ELEMENT paragraph (#PCDATA | emphasis | link)*>
<!ELEMENT emphasis (#PCDATA)>
<!ELEMENT link (#PCDATA)>
]>
<documento>
    <paragraph>
        Este es un ejemplo de un <emphasis>parrafo</emphasis> con texto normal,
        <emphasis>texto enfatizado</emphasis>, y un <link>enlace</link>.
    </paragraph>
    <paragraph>
        Aquí hay otro <emphasis>parrafo</emphasis> con diferentes elementos.
    </paragraph>
</documento>
```

##### Declaración de tipos de atributos:

Se puede declarar los tipos de atributos que pueden tener los elementos en un documento XML. Su sintaxis es:

```dtd
<!ATTLIST elemento atributo tipo valorPredeterminado>
```

Donde:

- `elemento` es el nombre del elemento al que se le va a declarar el atributo.
- `atributo` es el nombre del atributo que se está declarando.
- `tipo` especifica el tipo de datos del atributo. Puede ser CDATA, enumeración o ID/IDREF.
- `valorPredeterminado` indica el valor por defecto del atributo, si es que tiene uno. Puede ser #REQUIRED, #IMPLIED o #FIXED.

###### Valor predeterminado: #REQUIRED, #IMPLIED  o #FIXED.

Además del nombre y el tipo del atributo también se puede especificar cómo debe comportarse el *parser* ante la presencia o ausencia de cierto atributo en un elemento del documento. Existen cuatro posibles alternativas:

- **#REQUIRED:** El atributo es de carácter obligatorio.
- **#IMPLIED:** El atributo es opcional.
- **#FIXED:** El atributo tiene un valor fijo declarado en el DTD.
- **Valor por defecto:** Si no se define ninguna de las alternativas anteriores el atributo será por defecto **opcional** (#implied)

###### Tipos de datos del atributo: CDATA, enumetación o ID/IDREF

Se pueden declarar diferentes tipos de atributos para los elementos de un documento XML. Los más comunes son CDATA, enumeración e ID/IDREF.

**Atributo CDATA:**

- CDATA permite cualquier tipo de datos de caracteres, incluyendo texto, números, símbolos y carácteres especiales.
- No se aplican restricciones especiales a los valores del atributo.

```dtd
<!ATTLIST elemento atributo CDATA #IMPLIED>
```

Ejemplo:

```xml-dtd
<!DOCTYPE galeria [
<!ELEMENT galeria (imagen+)>
<!ELEMENT imagen (#PCDATA)>
<!ATTLIST imagen descripcion CDATA #IMPLIED> <!-- Define un atributo llamado descripcion para el elemento imagen. Este atributo es opcional (#IMPLIED) y puede contener cualquier string de texto.-->
]>
<galeria>
    <imagen descripcion="Una hermosa puesta de sol sobre el mar.">puesta_del_sol.jpg</imagen>
    <imagen descripcion="Un retrato en blanco y negro.">retrato_bn.jpg</imagen>
    <imagen>imagen_sin_descripcion.jpg</imagen>
</galeria>
```

**Atributo enumeración:**

- El atributo puede tener un conjunto específico de valores predefinidos.
- Solo se pueden usar los valores enumerados en el atributo.
- Se declaran los valores posibles dentro de paréntesis y separados por tuberías (|)

```dtd
<!ATTLIST elemento atributo (valor1 | valor2 | valor3) #IMPLIED>
```

Ejemplo:

```xml-dtd
<!DOCTYPE tienda [
<!ELEMENT tienda (articulo+)>
<!ELEMENT articulo (#PCDATA)>
<!ATTLIST articulo estado (disponible | agotado | oferta) #IMPLIED> <!-- Define un atributo llamado estado para el elemento articulo, el cual puede tener uno de los tres valores: disponible, agotado, o oferta. Este atributo es opcional. -->
]>
<tienda>
    <articulo estado="disponible">Televisor 4K</articulo>
    <articulo estado="oferta">Laptop Gamer</articulo>
    <articulo estado="agotado">Smartphone XYZ</articulo>
    <articulo>Mouse Inalámbrico</articulo> <!-- Sin estado especificado -->
</tienda>
```

**Atributo ID/IDREF:**

- Los atributos ID e IDREF se utilizan para establecer relaciones únicas entre elementos en un documento XML.
- El atributo ID debe ser un identificador único en todo el documento. Además, el valor de un atributo de tipo **ID** debe cumplir con las reglas de los NMTOKENs, que son cadenas de caracteres que solo pueden contener que solo pueden contener letras minúsculas, letras mayúsculas, números, puntos (.), guiones medios (-), guiones bajos (_), o el carácter dos puntos (:). Ten en cuenta también que un valor de **ID debe comenzar con una letra.**
- El atributo IDREF hace referencia al valor de un atributo ID existente en otro elemento.

```dtd
<!ATTRLIST elemento atributo ID #REQUIRED> <!ATTRLIST elemento2 atributo IDREF #IMPLIED>
```

 Ejemplo:

```xml-dtd
<!DOCTYPE red_social [
<!ELEMENT red_social (persona+)>
<!ELEMENT persona (nombre)>
<!ELEMENT nombre (#PCDATA)>
<!ATTLIST persona id ID #REQUIRED>
<!ATTLIST persona amigo_id IDREF #IMPLIED>
]>
<red_social>
    <persona id="p1">
        <nombre>Juan Pérez</nombre>
    </persona>
    <persona id="p2" amigo_id="p1">
        <nombre>Maria López</nombre>
    </persona>
    <persona id="p3" amigo_id="p2">
        <nombre>Carlos García</nombre>
    </persona>
</red_social>
```

En este DTD:

1. `<!ELEMENT red_social (persona+)>`: Define que el documento contiene un elemento `red_social` que a su vez puede contener uno o más elementos `persona`.
2. `<!ELEMENT persona (nombre)>` y `<!ELEMENT nombre (#PCDATA)>`: Define que cada `persona` contiene un elemento `nombre`, el cual es un texto (PCDATA).
3. `<!ATTLIST persona id ID #REQUIRED>`: Define que cada `persona` debe tener un atributo `id` único, que es obligatorio.
4. `<!ATTLIST persona amigo_id IDREF #IMPLIED>`: Define que cada `persona` puede tener un atributo opcional `amigo_id` que hace referencia al `id` de otra `persona` en el documento.

**Ejemplo de declaraciones de atributos:**

```dtd
<!ATTLIST libro titulo CDATA #REQUIRED>
```

se declara el atributo «titulo» para el elemento «libro» con tipo CDATA. El atributo es requerido, lo que significa que debe estar presente en el elemento.

```dtd
<!ATTLIST producto categoria (electronicos | ropa | libros) "electronicos">
```

Se declara el atributo «categoria» para el elemento «producto» con tipo enumeración. El atributo puede tener uno de los valores: «electronicos», «ropa» o «libros». El valor predeterminado es «electronicos».

```dtd
<!ATTLIST empleado id ID #REQUIRED>
```

Se declara el atributo «id» para el elemento «empleado» con tipo ID. El atributo es requerido y debe ser un identificador único en el documento.

#### Declaración de entidades

Las entidades son utilizadas para definir símbolos o fragmentos de texto que pueden ser referenciados y utilizados en diferentes partes del documento XML. Hay dos tipos principales de entidades:

- **Declaración de entidades internas:**

  - Se definen dentro del propio documento DTD.
  - Se utilizan para definir símbolos o fragmentos de texto que pueden ser sustituidos en el contenido del documento.
  - La sintaxis para declarar una entidad interna es la siguiente: <!ENTITY nombre "valor">. Donde "nombre" es el nombre de la entidad y "valor" es el texto o símbolo que representa la entidad.

  ```xml-dtd
  <!DOCTYPE articulos [
  <!ENTITY autor "Eniun">
  <!ENTITY sitio-web "https://www.eniun.com">
  <!ELEMENT articulos (articulo+)>
  <!ELEMENT articulo (titulo, contenido)>
  <!ELEMENT titulo (#PCDATA)>
  <!ELEMENT contenido (#PCDATA)>
  ]>
  <articulos>
      <articulo>
          <titulo>El Futuro de la Tecnología</titulo>
          <contenido>
              Este artículo fue escrito por &autor;. Para más información, visita &sitio-web;.
          </contenido>
      </articulo>
      <articulo>
          <titulo>Innovaciones en Inteligencia Artificial</titulo>
          <contenido>
              Descubre los últimos avances, cortesía de &autor;. Encuentra más detalles en &sitio-web;.
          </contenido>
      </articulo>
  </articulos>
  ```

  

- **Declaración de entidades externas:**

  - Se definen fuera del documento DTD, en archivos separados.
  - Se utilizan para definir contenido que pueden ser referenciado desde múltiples documentos XML.
  - La sintaxis para declara una entidad externa es: <!ENTITY nombre SYSTEM "ruta/del/archivo">. Donde "nombre" es el nombre de la entidad y "ruta/del/archivo" es la ubicación del archivo que contiene el valor de la entidad.

  ```dtd
  <!ENTITY datosExternos SYSTEM "datos.xml">
  ```

Una vez que se definen las entidades, se pueden utilizar en el contenido del documento XML utilizando la referencia de entidad. 

Para referenciar una entidad en el documento, se utiliza su nombre precedido por el símbolo & y seguido por ;

```xml-dtd
<libro>
  <titulo>&autor; - Mi libro</titulo>
  <sitio>&sitio-web;</sitio>
</libro>
```



### Validar un documento XML asociado a un DTD

- Crear un archivo XML válido que esté asociado a un DTD.
- Utiliza la herramienta o método para validar el documento XML con la DTD asociada:
  - **Editor de código y algún complemento** que permita la validación de XML con DTD. Por ejemplo Visual Studio Code y la extensión XML de Red Hat.
  - **Herramientas online** como https://www.truugo.com/xml_validator/
  - **Programa específico** como XMLSpy, Oxygen XML Editor o Altova XMLSpy
  - **Herramientas en línea de comandos:** xmllint o xmlstarlet para validar el documento XML con la DTD asociada.

##### Validar documento XML con Visual Studio Code y la extensión XML de Red Hat

1. **Crear o Abrir un Archivo DTD**

   1. Crea o abre el archivo DTD referenciado por tu archivo XML.
   2. Escribe o asegúrate de que el DTD esté correctamente formateado.

2. **Validación:**

   1. La extensión XML de Red Hat proporciona validación en tiempo real.
   2. Al escribir o hacer cambios en tu archivo XML o DTD, la extensión verificará automáticamente la conformidad.
   3. Si hay errores, aparecerán en color rojo en el código.

3. **Solución de problemas**

   1. Si encuentras errores, revisa las líneas indicadas en la vista de problemas

   2. Asegúrate de que la estructura del XML y las definiciones en el DTD coincidan.

   3. Corrige cualquier error que la extensión te señale.

      Ejemplo con errores DTD externo: Como puedes comprobar en el siguiente código, se ha definido el elemento «title» pero en el documento XML se ha puesto «titulo». Por tanto, en la vista de problemas se puede ver el elemento subrayado de color rojo.

      ![DTD VS Code](https://www.eniun.com/wp-content/uploads/dtd-error-1024x295.png)

      Ejemplo con errores DTD interno:

      ![DTD VS Code](https://www.eniun.com/wp-content/uploads/dtd-interno.png)



## XPath

XPath (XML Path Languajge) Es un lenguaje declarativo que permite localizar y seleccionar elementos o atributos en documento XML. 

Aunque XPath se creó para XML también es clave en lenguajes y tecnologías como HTML, JSON (en variantes como JSONPath) y XSLT, donde ayuda a estructurar y filtrar información. Por tanto, su importancia sigue vigente en tareas de extracción de datos, pruebas automatizadas y procesamiento de documentos.

### Usos de XPath

Se utiliza comúnmente en varios contextos y lenguajes de programación para la manipulación y selección de nodos en documentos XML. Algunos de los lenguajes y tecnologías donde XPath es comúnmente implementado son las siguientes:

- **XPath en XML:** 

  Es parte integral de XML y se utiliza directamente en documentos XML para la selección de nodos.

- **XSLT (Extensible Stylesheet Language Transformations)**

  XSLT utiliza XPath para definir patrones de búsqueda y transformaciones en documentos XML. XPath se utiliza para seleccionar y manipular nodos durante la transformación

- **XQuery (XML Query Language)**

  XQuery es un lenguaje de consulta diseñado para extraer y manipular datos desde documentos XML. Utiliza XPath para especificar la parte del documento sobre la cual se realiza la consulta.

- **Selenium (WebDriver**

  Es una herramienta para automatizar pruebas en navegadores web, utiliza XPath para localizar elementos en una página web. Se utiliza comúnmente para interactuar con elementos HTML en aplicaciones web.

- **DOM (Document Object Model)**

  Al programar con DOM, ya sea en JavaScript, Java u otros lenguajes, XPath puede ser utilizado para navegar y seleccionar elementos en la representación en memoria de un documento XML.

- **XPath en programación con lenguajes como Python,  Java, C#, etc **

  Muchos lenguajes de programación proporcionan bibliotecas o módulos que permiten utilizar XPath para trabajar con documentos XML. Por ejemplo, en Python, la biblioteca lxml es comúnmente utilizada para trabajar con XPath.

- **Browsers y herramientas de desarrollo web**

  XPath se usa en herramientas de desarrollo web y en navegadores para seleccionar elementos en el DOM. Es especialmente útil en pruebas de automatización y  web scraping

### Ejecutar una consulta XPath

Para ejecutar una consulta XPath en un documento XML, puedes utilizar diferentes herramientas:

- **Herramientas online**

  Puedes utilizar herramientas como **freeformatter.com** que te permiten insertar el documento XML y la expresión XPath, y te mostrarán el resultado de la consulta. 

  Simplemente busca en un motor de búsqueda como Google "XPath Tester" y encontrarás varias opciones para probar tus consultas. Ten en cuenta que, a veces, algunas herraientas no reconocen todas las funciones XPath, por ejemplo string(), number(), name(), string-length(), etc.

- **Editor de código con algún complemento**

  Por ejemplo VS Code con alguna extensión como XML Tools:

  - Coloca el cursor en un archivo XML

  - Presiona Ctrl +Shift+P para abrir la paleta de comandos (command palette)

  - Escribe XML Tools y selecciona "Evaluate XPath" o presionando "Ctrl+Shift+Alt+X"

  - Inserta tu expresión XPath y se evaluará en el documento activo.

    ![image-20250409141824978](/home/soa/.config/Typora/typora-user-images/image-20250409141824978.png)

    Ten en cuenta que algunas funciones, por ejemplo max() u otras pueden no estar reconocidad por la extensión. Por tanto, prueba tus extensiones en varias herramientas para más fiablilidad. 

### El árbol de XPath

También conocido como **árbol de nodos** (node tree), es una representación jerárquica de un documento XML que nos permite visualizar y navegar por su estructura. En este árbol, cada nodo representa un elemento, atributo, texto, u otro tipo de entidad dentro del documento.

El nodo raiz del arbol XPath es el elemento principal (root element) del documento. A partir de este nodo raiz, se ramifican los nodos hijos que representan los elementos secundarios. Cada elemento puede tener hijos, y así sucesivamente, formando una estructura en forma de árbol.



### Tipos de nodos en un árbol XPath

Los diferentes nodos en un árbol XPath  nos permiten acceder y manipular de manera selectiva los elementos, atributos, texto u otros componentes de un documento XML utilizando expresiones XPath. 



## Framework XML

https://basex.org/download/, para windows descargamos BaseX118.exe

BaseX es un framework de xml de gestión de base de datos



Los archivos de las consultas (XQuery) para xml tienen la extensión **.xqy**



Nos creamos un proyecto en Eclipse de Java Project llamado "XQuery":

- Creamos un archivo "books.xml":

  ```xml
  <?xml version="1.0" encoding="UTF-8"?>
  <books>
  	<book category="JAVA">
  		<title lang="en">Learn Java in 24 Hours</title>
  		<author>Robert</author>
  		<year>2005</year>
  		<price>30.00</price>
  	</book>
  	<book category="DOTNET">
  		<title lang="en">Learn .Net in 24 hours</title>
  		<author>Peter</author>
  		<year>2011</year>
  		<price>70.50</price>
  	</book>
  	<book category="XML">
  		<title lang="en">Learn XQuery in 24 hours</title>
  		<author>Robert</author>
  		<author>Peter</author>
  		<year>2013</year>
  		<price>50.00</price>
  	</book>
  	<book category="XML">
  		<title lang="en">Learn XPath in 24 hours</title>
  		<author>Jay Ban</author>
  		<year>2010</year>
  		<price>16.50</price>
  	</book>
  </books>
  ```

  

- Creamos un archivo para las consultas XQuery con New File consultas1.xqy 

  ```xquery
  doc("books.xml")
  (:ESTE COMANDO ME LEE EL XML:)
  ```

- Creamos un archivo consulta2.xqy

  ```xquery
  for $x in doc("books.xml")/books/book
  where $x/price>30
  return $x/title
  ```

  Muestra los títulos de los libros cuyo precio sea mayor a 30.

- Creamos un archivo consulta3.xqy 

  ```xquery
  (:con let declaramos una variable:)
  (:queremos que el resultado nos lo muestre en una tabla:)
  let $books:=(doc("books.xml")/books/book)
  return 
    <table>
      <tr>
        <th>Title</th>
        <th>Price</th>
      </tr>
      {
        for $x in $books
        order by $x/price
        return 
          <tr>
            <td>{data($x/title)}</td>
            <td>{data($x/price)}</td>
          </tr>
      }
      
    </table>
  ```

  Si queremos que se muestre el resultado en el navegador, guardamos el resultado como un archivo con extensión html

  ![image-20250409121354981](/home/soa/.config/Typora/typora-user-images/image-20250409121354981.png)

  Y al ejecutar el archivo se mostraria

  ![image-20250409121421076](/home/soa/.config/Typora/typora-user-images/image-20250409121421076.png)

- Creamos archivo consulta4.xqy

  ```xquery
  (:quermos que cuente los elementos del array:)
  let $items := (1,2,3,4,5,6)
  let $count := count($items)
  return $count
  ```

- Creamos archivo consulta5.xqy

  ```xquery
  (:quermos que Sume los elementos del array:)
  let $items := (1,2,3,4,5,6)
  let $suma := sum($items)
  return $suma
  ```

- Creamos archivo consulta6.xqy

  ```
  let $items := ('orange',<apple/>,<fruit type="juice"/>,<vehicle type="car">traslado</vehicle>,1,2,3,'a','b','abc')
  let $count := count($items)
  
  return 
  <result>
    <count>{$count}</count>
    
    <items>
    {
      for $item in $items
        return <item>{$item}</item>
    }
    </items>
  </result>
  ```

- Creamos archivo consulta7.xqy

  ```xquery
  let $items := (1,2,3,4,5,6)
  let $count := count($items)
  let $date := current-date()
  
  
  return
    <result>
      <count>{$count}</count>
      <date>{$date}</date>
      <items>
      {
        for $item in $items[.=(1,2,3)]
        return <item>{$item}</item>
      }
      </items>
    </result>
  
  
  (:return ($items,$count,$items[.=(1,2,3)]):)
  ```

  Si guardamos el resultado como un archivo .xml al abrirlo nos mostraria

  ![image-20250409130706242](/home/soa/.config/Typora/typora-user-images/image-20250409130706242.png)

- 



Desde el framework baseX seleccionamos el proyecto que tenemos en Eclipse

- Creamos una conexión a la base de datos Database > Open & Manage > Open

  ![image-20250409102114214](/home/soa/.config/Typora/typora-user-images/image-20250409102114214.png)

  Abrimos el archivo donde tenemos el pro

  







## Introducción a las bases de datos xml

### ¿Qué  es una Base de Datos XML?

Una base de datos en XML es un método de almacenamiento de información que permite albergar **datos en formato XML**. Suele consistir en bases de datos de tipo documental y permiten que los datos en XML sean organizados y exportados.

En realidad se debería hablar de **bases de datos con XML**. Es decir, el XML no es un gestor de base de datos, sino que se trata de un metalenguaje con el que los datos son almacenados. Gracias al XML se pueden crear reglas y relaciones semánticas sencillas que permiten definir y organizar la manera en la que se estructuran los datos.

### Xquery

**XQuery** es un lenguaje estandarizado para combinar documentos, bases de datos, páginas web y casi cualquier cosa. Su aplicación está muy extendida. Es potente y fácil de aprender.

XQuery está reemplazando a los lenguajes de middleware propietarios y a los lenguajes de desarrollo de aplicaciones web.

XQuery está reemplazando programas complejos de Java o C++ con unas pocas líneas de código. XQuery es más fácil de trabajar y más fácil de mantener que muchas otras alternativas.



#### Características XQuery:

- **Lenguaje funcional:** XQuery es un lenguaje para recuperar/consultar datos basados en XML.
- **Análogo a SQL**, XQuery es a XML lo que SQL es a las bases de datos.
- **Basado en XPath:** XQuery utiliza expresiones XPath para navegar por documentos XML.
- **Universalmente aceptado: ** Xquery es compatible con todas las bases de datos principales.
- **Estándar W3C:** XQuery es un estándar W3C.



#### Expresiones XQuery

```xquery
doc("books.xml")
doc("books.xml")/libros/libro
for $x in doc("books.xml")/books/book
where $x/price>30
```



#### FLWOR

**FLWOR** es un acrónico que significa "For, Let, Where, Order by, Return".

- **F:** Para - Selecciona una colección de todos los nodos.
- **L:** Let - Coloca el resultado en una variable XQuery.
- **W:** Donde: Selecciona los nodos especificados por la condición.
- **O:** Ordenar por: Ordena los nodos especificados según los criterios.
- **R:** Retorno: Devuelve el resultado final.



##### For y Let

Diferencias:

- **For** vincula una tupla a cada nodo de la expresión
- **Let** vincula el resultado completo de la expresión.



**Ejemplo For:**

```xquery
xquery version "1.0";

for $b = doc("course.xml")/lecture/title
return
<titulo>{$b}</titulos>
```

Resultado:

```xml
<titulos>
    <title>Introduction</title>  
</titulos>
<titulos>
    <title>What is Telecoperation?</title>  
</titulos>
<titulos>
    <title>Introduction XML</title>  
</titulos>
```

**EJemplo Let**

```xquery
xquery version "1.0";

for $b = doc("course.xml")/lecture/title
return
<titulo>{$b}</titulos>
```

Resultado

```xml
<titulos>
    <title>Introduction</title>
    <title>What is Terlecoperation</title>
    <title>Introduction XML</title>
</titulos>
```



##### Where

- Filtra las tuplas producidas por las claúsulas for y let.
- Contiene una expresión que es evaluada para cada tupla. Si su evaluación es false esa tupla es descartada.

```xquery
xquery version "1.0";

for $b = doc("course.xml")/lecture/title
where $b/../@date="04/03/2004"
return
<titulo>{$b}</titulos>

```

##### Order

- Indica para un conjunto de información un orden de salida y va seguido de by.
- Por defecto de manera ascendente, si no se indica lo contrario, acorde con el tipo de datos que se esté evaluando.
- Ordenar según tipo de datos.

```xquery
xquery version "1.0";

for $b = doc("course.xml")/lecture/title
order by $b/../@date
return
<titulo>{$b}</titulos>
```



##### Return:

- Formatear la salida de documentos.
- Multiples utilidades, otros XML, HTML, PDF, etc.



#### Expresiones condicionales:

- **XQuery admite if-then-else**

  ```xquery
  xquery version "1.0";
  
  for $b in doc ("course.xml")/lecture/title
  order by $b/.../@date
  return
  if($b/../@date="04/03/2024")
  then
  <coincidencia>{$b}</concentracion>
  else
  <titulos>{$b}</titulos>
  ```

  Resultado:

  ```xml
  <coincidencia><title>Introduction</title></coincidencia>
  <titulo><title>What is Telecoperation?</title></titulo>
  <titulo><title>Introduction XML</title></titulo>
  ```

  

#### Operadores

- **Matemáticos:**
  - +, - , *, 
  - div(\*)
  - idiv(\*)
  - mod 

- **Comparación:**
  - =, !=, <, > <=, >=, not()

- **Secuencia:**
  - union(|):
  - intersect:
  - except:

- **Funciones de agrupación:**
  - count()
  - min()
  - max()
  - avg()
  - sum()

- **Funciones de cadena:**
  - concat()
  - string-length()
  - starts-with()
  - ends-with()
  - substring()
  - upper-case()
  - lower-case()
  - string()

- **Uso general:**
  - distinct-values()
  - empty()
  - exits()

- **Redondeo:**
  - floor()
  - celling()
  - round()








Páginas de interés:

https://www.eniun.com/curso-xml/