# JAVA SWING  CEISA

![image-20250312094626611](/home/soa/.config/Typora/typora-user-images/image-20250312094626611.png)

![image-20250312094649996](/home/soa/.config/Typora/typora-user-images/image-20250312094649996.png)

Java.AWT Utiliza Frame

Java.Swing Utiliza JFrame



Java Swing es parte de las **Java Foundation Classes (JFC)** y se utiliza para desarrollar gráficas basadas en ventanas. Está construido sobre la API de AWT (Abstract Windowing Toolkit) y está escrito completamente en Java, lo que lo hace independientemente de la plataforma y más liviano que AWT. 

- Nacen invisibles. Se necesita el método **setVisible** para hacerlos visibles.
- Nacen con un tamaño inútil. Se necesita el método **setSize** para darles tamaño.
- Conviene decir qué debe hacer el programa si se cierra un frame.

| Característica               | AWT                              | SWING                                                        |
| ---------------------------- | -------------------------------- | ------------------------------------------------------------ |
| Dependencia de la plataforma | Dependiente de la plataforma     | Independiente de la plataforma                               |
| Peso de los componentes      | Componentes pesados              | Componentes livianos                                         |
| Apariencia                   | No soporta cambios de apariencia | Soporta un look and feel intercambiable                      |
| Componentes                  | Proporciona menos componentes    | Proporciona componentes más avanzados (tablas, listas, paneles con pestañas, etc.) |
| Arquitectura MVC             | No sigue el patrón MVC           | Sigue el patrón MVC (Modelo-Vista-Controlador)               |



## Jerarquía de clases en Java Swing

![image-20250312100004681](/home/soa/.config/Typora/typora-user-images/image-20250312100004681.png)

## Métodos comunes de la clase Component

-  **add (Component c):** Añade un componente a otro.
- **setSize(int width, int height):** Establece el tamaño de un componente.
- **setLayout(LayoutManager m):** Establece el gestor de diseño para un componente.
- **setVisible(boolean b):** Define si el componente será visible o no.

Ejemplo utilización métodos comunes

```java
import javax.swing.*;

public class EjemploSwing{
    public static void main(String[] args){
        JFrame frame = new JFrame(); // Creando instancia de JFrame
        JButton boton = new JButton("Haz clic"); // Crea un botón con texto
        
        // Establece posición y tamaño del botón
        boton.setBounds(130, 100, 100, 40);
        
        // Añade el botón al marco
        frame.add(boton);
        
        // Configuramos el JFrame
        frame.setSize(400, 500);
        frame.setLayout(null);
        frame.setVisible(true);
    }
}
```



## Diseños y Java Swing

Los **layouts** controlan cómo se organizan los componentes dentro de un contenedor. Swing proporciona varios layouts, como:

- **BorderLayout:** Coloca componentes en el norte, sur, este, oeste y centro.
- **GridLayout:** Distribuye los componentes en una cuadrícula con filas y columnas.
- **FlowLayout:** Organiza los componentes en una fila, ajustando las posiciones si se sale del contenedor.
- **CardLayout:** Permite apilar diferentes paneles, mostrando solo uno a la vez.

La clase Layout se utiliza por ejemplo cuando hacemos ventanas para decidir en que posición van los botones y demás componentes, si van alineados, en forma de matriz, cuáles se hacen más grandes al agrandar la ventana, etc.

Puede tomarse como la base para una página web.

Permite a los desarrolladores controlar la disposición y el comportamiento de los elementos en la interfaz de sus aplicaciones. Gracias a ello, pueden crear interfaces atractivas y funcionales para mejorar la experiencia del usuario y la usabilidad de las aplicaciones. 

**setLayout()**

Método que permite establecer un Layout sobre el Jframe al que se aplica.

### Tipos de layout

- **BorderLayout**
- **GridLayoud**
- **FlowLayout**
- **CardLayout**







## Componentes comunes en Swing

- **JButton:** Botón que puede activar una acción.

- **JRadioButton:** Botón de opción exclusiva.

- **JTextArea:** Área de texto donde los usuarios pueden ingresar varias líneas de texto.

- **JComboBox:** Menú desplegable con una lista de opciones.

- **JTable:** Tabla que muestra datos en filas y columnas.

- **JColorChooses:** Diálogo para elegir colores.

- **JProgressBar:** Barra de progreso para mostrar el avance de una tarea.

- **JSlider:** Componente para seleccionar un valor de un rango mediante un deslizador.

- **JLabel:** Etiqueta

- **JTextField:** Área de texto donde los usuarios pueden ingresar una línea de texto.

- **JText**

- **JPasswordField**

- **JImageIcon**

- **JCheckBox**

- **JList**

- **JComboBox:** Permite seleccionar un String de una lista

- **JMenuBar, JMenu, JMenuItem:** Implementa una barra de menú en la parte superior de un JFrame.





### **JButton**: 

La clase JButton en Java Swing se utiliza para crear botones etiquetados que son independientes de la plataforma. Cuando el usuario presiona el botón, la aplicación realiza alguna acción.

La clase JButton hereda de **AbstractButton**, lo que permite tener una serie de funcionalidades avanzadas.

#### Contructores comunes

- **JButton():** Crea un botón sin texto ni icono.

- **JButton(String s)**: Crea un botón con el texto especificado.

- **JButton(Icon i):** Crea un botón con el icono especificado. **pendiente añadir como se crea un icono**

  

#### Métodos Comunes de JButton y AbstractButton

- **void setText(String s):** Establece el texto del botón.
- **String getText():** Devuelve el texto del botón.
- **void setEnabled(boolean b):** Habilita o deshabilita el botón.
- **void setIcon(Icon b):** Establece el icono del botón.
- **Icon getIcon():** Devuelve el icono del botón.
- **void setMnemonic(int a):** Establece una tecla de acceso rápido para el botón.
- **void addActionListener(ActionListener a):** Añade un ActionListener al botón para manejar los eventos de acción (cuando se hace clic). **pendiente añadir doc actioonListener**



Ejemplo básico de JButton

```java
import javax.swing;

public class EjemploBoton{
    public static void main(String[] args){
        JFrame frame = new JFrame("Ejemplo de JButton");
        JButton boton = new JButton("Haz clic");
        boton.setBounds(50, 100, 120, 30); // Posición y tamaño del botón.
        frame.add(boton); // Agrega boton al JFrame
        frame.setSize(400, 400); // Tamaño del JFrame
        frame.setLayout(null); // Sin gestor de diseño
        frame.setVisible(true); // Hace visible el JFrame
    }
}
```



### **JRadioButton:** 

### **JTextArea:**

La clase **JTextArea** se utiliza para crear un área de texto que permite la edición de múltiple líneas. A diferencia de JTextField, que está limitado a una sola línea de texto, JTextArea es ideal para aplicaciones donde se requiere la entrada o visualización de texto en varias líneas.

Esta clase hereda de JTextComponent, lo que proporciona una amplia gama de funcionalidades para gestionar el texto. 

#### Declaración de la Clase 

```java
public class JTextArea extends JTextComponent
```

#### Constructores Comunes

- **JTextArea():** Crea un área de texto sin texto inicial.
- **JTextArea(String s):** Crea un área de texto que muestra el texto.
- **JTextArea(int rows, int columns):** Crea un área de texto con el número de filas y columnas especificado, sin texto inicial.
- **JTextArea(String s, int rows, int columns):** Crea un área de texto con el número de filas y columnas especificado, y que muestra el texto dado.

#### Métodos comunes

### **JComboBox:** 

### **JTable:** 

La clase **JTable** permite crear una tabla con filas y columnas y personalizarla según tus necesidades.

Se pueden crear tablas con diferentes alturas de fila, anchos de columnas, fuentes, colores y más, también se pueden agregar imágenes, íconos y botones a las celdas de la tabla, e incluso implementar procesadores y editores de celdas personalizados.

Tiene varios métodos para ordenar y filtrar los datos y manejar las interacciones del usuario, como la selección, edición y cambio de tamaño.

Estos métodos facilitan la creación de tablas interactivas y responsivas que satisfagan las necesidades específicas de su aplicación.

#### Declaración de la Clase 

```
public class JTable extends JComponent implements TableModelListener, Scrollable, TableColumnModelListener, ListSelectionListener, Serializable
```

#### Constructores Comunes 

1. `JTable()`: Crea una tabla con celdas vacías.
2. `JTable(Object[][] rows, Object[] columns)`: Crea una tabla con los datos y columnas especificados.

#### Métodos Comunes 

- `void setCellSelectionEnabled(boolean flag)`: Habilita o deshabilita la selección de celdas.
- `Object getValueAt(int row, int column)`: Devuelve el valor de una celda específica en la tabla.
- `void setSelectionMode(int mode)`: Establece el modo de selección para filas o celdas.
- `ListSelectionModel getSelectionModel()`: Devuelve el modelo de selección de la tabla, útil para manejar eventos de selección.

#### Crear una tabla:

```java
JTable jt = new JTable(int num_rows, int num_columns);
```

Crea una tabla con n filas y n columnas.



#### Llenar una tabla:

Para completar la tabla con datos, puede utilizar el método **setValueAt()**, que toma tres argumentos: el valor a establecer, el índice de la fila y el índice de la columna.

```java
jt.setValueAt("valor",pos_row, pos_column);
```

Ejemplo básico de JTable

```java
import javax.swing.*;    

public class EjemploBasicoJTable {    
    JFrame frame;    

    EjemploBasicoJTable() {    
        frame = new JFrame("Ejemplo Básico de JTable");    

        // Datos de la tabla: ID de estudiante, nombre y calificación
        String data[][] = { {"001", "Carlos", "85"},    
                            {"002", "Marta", "90"},    
                            {"003", "Luis", "78"},    
                            {"004", "Ana", "88"}};    

        // Nombres de las columnas
        String columnas[] = {"ID", "Nombre", "Calificación"};         

        // Creación de JTable
        JTable tabla = new JTable(data, columnas);    
        JScrollPane sp = new JScrollPane(tabla);    
        frame.add(sp);          
        frame.setSize(400, 300);    
        frame.setVisible(true);    
    }     

    public static void main(String[] args) {    
        new EjemploBasicoJTable();    
    }    
}
```

**Explicación**:

- Se crea una tabla con datos de estudiantes (ID, nombre y calificación).
- La tabla es sencilla, sin funcionalidades adicionales, pero se presenta dentro de un `JScrollPane` para facilitar la visualización.

## Ejemplo de `JTable` con `ListSelectionListener`

Este ejemplo añade funcionalidad para capturar los datos de la fila seleccionada utilizando un `ListSelectionListener`. La selección se muestra en un `JLabel`.

```
import javax.swing.*;    
import javax.swing.event.*;    

public class EjemploJTableConListSelectionListener {    
    JFrame frame;    
    JTable tabla;    
    JLabel etiqueta;    

    EjemploJTableConListSelectionListener() {    
        frame = new JFrame("JTable con ListSelectionListener");    

        // Datos de la tabla: ID de producto, nombre y precio
        String data[][] = { {"P001", "Laptop", "850"},    
                            {"P002", "Teléfono", "500"},    
                            {"P003", "Teclado", "20"},    
                            {"P004", "Monitor", "150"}};    

        // Nombres de las columnas
        String columnas[] = {"ID Producto", "Nombre", "Precio"};         

        // Creación de JTable
        tabla = new JTable(data, columnas);    
        JScrollPane sp = new JScrollPane(tabla);    
        frame.add(sp);          

        // Crear JLabel para mostrar la selección
        etiqueta = new JLabel("Selecciona un producto");
        etiqueta.setBounds(30, 230, 300, 30);
        frame.add(etiqueta);

        // Habilitar la selección de celdas y añadir un ListSelectionListener
        ListSelectionModel seleccion = tabla.getSelectionModel();
        seleccion.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        seleccion.addListSelectionListener(new ListSelectionListener() {    
            public void valueChanged(ListSelectionEvent e) {    
                // Verificar si la selección está ajustada
                if (!e.getValueIsAdjusting()) {
                    int filaSeleccionada = tabla.getSelectedRow();
                    if (filaSeleccionada != -1) {
                        String producto = (String) tabla.getValueAt(filaSeleccionada, 1);
                        String precio = (String) tabla.getValueAt(filaSeleccionada, 2);
                        etiqueta.setText("Producto: " + producto + ", Precio: $" + precio);
                    }
                }
            }    
        });

        frame.setLayout(null);
        frame.setSize(400, 300);    
        frame.setVisible(true);    
    }    

    public static void main(String[] args) {    
        new EjemploJTableConListSelectionListener();    
    }    
}

Lenguaje del código: Java (java)
```

**Explicación**:

- En este ejemplo, el usuario puede seleccionar una fila de la tabla, y los datos de la fila seleccionada (producto y precio) se muestran en un `JLabel`.
- Se usa un `ListSelectionListener` para capturar la selección del usuario y actualizar la interfaz en tiempo real.











Documentación sacada de:

https://codegym.cc/es/groups/posts/es.1053.java-jtable

### **JColorChooses:** 

### **JProgressBar:** 

### **JSlider:** 

### JLabel:

La clase **JLabel** en Java Swing se utiliza para mostrar texto o gráficos en una interfaz gráfica de usuario. Las etiquetas (JLabel) son componentes de solo lectura, lo que significa que los usuarios no pueden editar el contenido que muestra la etiqueta.

```java
public class JLabel extends JComponent implements SWingConstants, Accesible
```

#### Constructores Comunes de JLabel

La clase **JLabel** ofrece varios constructores que permiten personalizar el contenido de la etiqueta:

- **JLabel():** Crea una instancia de JLabel sin imagen y con una cadena vacía. 
- **JLabel(String s):** Crea una instancia de JLabel con el texto especificado.
- **JLabel(Icon i):** Crea una instancia de JLabel con la imagen especificada.
- **JLabel(String s, Icon i, int horizontalAlignement):** Crea una instancia de JLabel con el texto, la imagen y la alineación horizontal especificados.



#### Métodos Comunes de JLabel

Algunos métodos clave para trabajar con JLabel incluyen:

- **String getText():** Devuelve el texto que muestra la etiqueta.
- **void setText(String text):** Establece el texto que se mostrará en la etiqueta.
- **void setHorizontalAlignement(int alignement):** Establece la alineación horizontal del contenido de la etiqueta.
- **Icon getIcon():** Devuelve la imagen que muestra la etiqueta.
- **int getHorizontalAlignement():**  Devuelve la alineación horizontal del contenido de la etiqueta.



### JTextField

La clase JTextField de Java Swing es un componente de entrada de texto que permite la edición de una sóla línea de texto. Es muy utilizado en interfaces gráficas para recibir datos como nombres, direcciones u otra información de texto.

Al ser parte de Swing, JTextField hereda de JTextComponent, lo que otorga varias funcionalidades avanzadas para gestionar el texto.

```java
public class JTextField extends JTextComponent implements SwingConstants
```

#### Constructores comunes de JTextField

Los constructores más utilizados en la clase JTextField son:

- **JTextField():** Crea un campo de texto vacío.
- **JTextField(String text):** Crea un campo de texto inicializado con el texto especificado.
- **JTextField(String text, int columns):** Crea un campo de texto con el texto inicial y el número de columnas especificado.
- **JTextField(int columns):** Crea un campo de texto vacío con un número especificado de columnas.

#### Métodos comunes de JTextField

Algunos de los métodos más utilizados en JtextField incluyen:

- **void addActionListener(ActionListener l):** Añade un ActionListener que recibe eventos de acción del campo de texto.
- **Acttion getAction():** Devuelve la acción establecida actualmente para este campo de texto.
- **void setFont(Font f):** Establece la fuente del texto en el campo de texto.
- **void removeActionListener(ActionListener l):** Elimina un ActionListener para que ya no reciba eventos de acción del campo de texto.



### JText

### JPasswordField

### JImageIcon

### JCheckBox

### JList

### JComboBox

Permite seleccionar un String de una lista

Para inicializar los String que contendrá el JComboBox debemos llamar al método addItem tantas veces como queramos cargar.

Un evento muy útil con este control es cuando el operador selecciona un item de la lista.

Para capturar la selección de un item debemos implementar la interface ItemListener que contiene el método llamada itemStateChanged. 



### JMenuBar, JMenu, JMenuItem

Implementa una barra de menú en la parte superior de un **JFrame**.

Requerimos de un objeto de la clase **JMenuBar**, uno o más objetos de la clase **JMenu** y por último objetos de la clase **JMenuItem**

Para capturar los eventos debemos implementar el interface **ActionListener** y asociarlo a los controles de tipo **JMenuItem,** de modo que se dispare al hacer clic en **JMenuItem**















# apartir de aqui pendiente organizar documentacion 







Ejemplo: Creamos un formulario:

```java
package ejercicios_swing;

import javax.swing.*;

// necesita una extension de JFrame
public class Formulario extends JFrame {
	// Creamos el constructor: tiene el mismo nombre de la clase
	public Formulario() {
		setLayout(null);
	}

	public static void main(String[] args) {
		// Instanciamos el objeto Formulario
		Formulario formulario1 = new Formulario();
		// setBounds(int x, int y, int width, int height)
		formulario1.setBounds(10, 20, 400, 400);
		// hace visible el formulario
		formulario1.setVisible(true);
		
		/*
		 *  Si cerramos la ventana del formulario que nos aparece 
		 *  la consola sigue abierta (lo sabemos por el cuadradito rojo que tenemos debajo)
		 *  para que se cierre automaticamente ponemos
		 */ 
		formulario1.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);		
	}
}
```





Páginas documentación interesantes:

https://oregoom.com/java/funciones/

https://jairogarciarincon.com/clase/interfaces-de-usuario-con-java-swing/calculadora-guiada-en-java-swing

https://codegym.cc/es/groups/posts/es.1053.java-jtable





google drive: cursogestiondeproyecto@gmail.com

1curso2025

Codigo: G-908833