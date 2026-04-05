# MANEJO DE CONECTORES A BASE DE DATOS

# SQL

SQL Structured Query Language



Solicitud sql -> Ordenador <-> 



## Comandos SQL

- **DDL:** Podemos crear, modificar, agregar a las tablas (create, alter, drop, truncate)
- **DML: ** Seleccionar, insertar, actualizar, eliminar (selecr, insert, update, delete)
- **DCL:** proporciona segurudad a las bases de datos (GRANT, REVOKE)
- **TCL:** Commit rollback, sevepoint



## Cláusulas:

- **from:** especifica la tabla de las que quieren obtener los registros
- **where:**
- **group by:**
- **having** especifica las condiciones o criterios
- **order by:** ordena los registros seleccionados en función del campo.



### Tipos de datos de Mysql

- **Tipos numéricos:**
  - **TinyInt**
  - **bit o bool:** entero 0 o 1
  - **SmallInt:**
  - **Mediumint:**
  - **integer, int:** entero con y sin signo
  - **BigInt:**
  - **Float**: numero pequeño de coma flotante de precisión simple.
  - **xReal, Double:** flotante de precisión doble 
- **Tipos fecha:**
  - Date: año-mes-dia
  - DateTime: año-mes-dia
  - TimeStamp: combinación de fecha y hora
  - Time:
- **Tipos de cadena:**
  - char(n): longitud fija
  - varchar(n): longitud variable.
  - TinyText:
  - Blob y Text:



## Operadores:

- < menor que
- \> mayor que
- = igual que
- <= menor igual
- \>= mayor igual
- <> distinto
- between: utilizado para especificar rango de valores
- like: como utilizado con caracteres comodín
- In: para especificar registros en un campo concreto



## Operadores lógicos

- **AND:** y lógico

- **OR** : O lógico

- **NOT:** Negación lógica



Orden de escritura de las sentencias:

comando + clausula from + clausula where + clausula grouo by + clausula having + clausula order by



## Sentencias comunes

### Para bases de datos 

Crear base de datos:

```mysql
create database tienda;
```

Mostrar bases de datos:

```mysql
show databases;
```



### Para tablas:

Seleccionar una base de datos:

```mysql
use tienda;
```

Crear una tabla

```mysql
create table empleados (
	DNI int(8),
    nombre varchar(30),
    cargo varchar(30),
    tiempo_servicio int(2)
);
```

Mostrar tablas de una base de datos

```mysql
show tables;
```

Describir una tabla

```mysql
describe nombre_tabla;
```

Eliminar una tabla:

```mysql
drop table nombre_tabla;
drop table empleados;
drop table if exists empleados;
```

Modificar una tabla existente ALTER TABLE

Cambiar el nombre de una columna

```mysql
alter table nombre_tabla change column col_ant col_nueva tipo_columna;

alter table empleados change column cargo sueldo varchar(30);
```

Cambiar el tipo de una columna

```mysql
alter table nombre_tabla modify column nombre_columna tipo_columna;

alter table empleados modify column sueldo int not null;
```

NOTA: Si la tabla ya tiene datos, no se puede cambiar por ejemplo una columna de tipo varchar a entero por que un entero no admite texto. Sale un mensaje de error de ERROR 1292 (22007): Truncated incorrect INTEGER value:



Añadir una columna

```mysql
alter table nombre_tabla add nombre_columna_nueva tipo_columna after nombre_columna_existente;

alter table empleados add direccion varchar(100) after tiempo_servicio;
```

Eliminar una columna

```mysql
alter table empleados drop column dni;
```

Renombrar una tabla

```mysql
alter table nombre_tabla_ori rename nombre_tabla_nueva;

alter table empleados rename empleado;
```



Para los datos:

Insertar datos:

```mysql
insert into nombre_tabla VALUES ()

insert into empleados(DNI, nombre, sueldo, tiempo_servicio,direccion) VALUES (222222,'Luis',2000,2,'calle alcala');

insert into empleados(nombre,DNI,tiempo_servicio, sueldo, direccion) VALUES ('esther',123456,2,1000,'calle gran via');
```

cuando son números no van con comillas.



Para mostrar los datos:

```mysql
select *from empleado;
```

Con * muestra todos los campos;









Para que funcione mysql correctamente con todas las cosas que estamos haciendo hace falta un servidor externo por ejemplo en windows XAMP.

Vamos a utilizar un gestor de base de datos **MySQL Workbench** para utilizar Mysql.

Creamos una conexión a la conexión Curso

![image-20250324095204401](/home/soa/.config/Typora/typora-user-images/image-20250324095204401.png)

En mi portatil lo he configurado de otra manera para que no tenga acceso a todas las tablas que tengo

Crear un usuario de mysql:

```mysql
CREATE USER curso@localhost IDENTIFIED BY 'adminr123';
```

Dar todos los permisos a un usuario sobre una base de datos en concreto, en este ejemplo sobre la base de datos: app_restaurante

```mysql
GRANT all privileges ON app_restaurante.* TO curso@localhost;
```

Eliminar los permisos:

```mysql
REVOKE ALL PRIVILEGES ON * . * FROM 'user_name'@'localhost';
```

Para ver los permisos de un usuaro:

```mysql
SHOW GRANTS FOR 'nombre_usuario'@'localhost';
```

https://www.hostinger.com/es/tutoriales/como-crear-usuario-mysql









# JDBC (Java DataBase Connectivity)

Es una API crucial desarrollada por Sun Microsystems para conectar aplicaciones Java a bases de datos relacionales utilizando el lenguaje SQL.

Hace la conexíon desde la aplicación Java al motor de base de datos como por ejemplo, MySQL, Oracle,...

![image-20250328194725639](/home/soa/.config/Typora/typora-user-images/image-20250328194725639.png)

Si vamos a utilizar por ejemplo MySQL, tenemos que además de instalar xamp en windows o apache en linux, tenemos que descargarnos y configurar eclipse para utilizar el conector mysql-connector-java para incluirlo en nuestro proyecto

## mysql-connector-java

Descargamos jdbc para mysql, se hace igual tanto para windows como para linux.

Elegimos plataforma independiente y pulsamos en la segunda opción y luego donde pone no thanks, just start my downloads

![image-20250324114040678](/home/soa/.config/Typora/typora-user-images/image-20250324114040678.png)

![image-20250324114054098](/home/soa/.config/Typora/typora-user-images/image-20250324114054098.png)

y la carpeta que se nos descarga la descomprimimos y el ejecutable mysql-connector.jar  es que vamos a tener que añadir en en la configuración de eclipse. 



En Eclipse:

Nos colocamos encima de un proyecto y pulsamos en propiedades Java Build Path -> Libraries ->ModulePath-> add external jars y seleccionamos el archivo jar que hemos descargado.

![image-20250324115017067](/home/soa/.config/Typora/typora-user-images/image-20250324115017067.png)

Despues volvemos a pulsar sobre el proyecto boton derecho propiedades y pulsamos en Deployment Assembly pulso sobre src/main/webappy pulsamos en añadir:

![image-20250324115208738](/home/soa/.config/Typora/typora-user-images/image-20250324115208738.png)

, buscamos en Java Buid Path Entries,

![image-20250324115233517](/home/soa/.config/Typora/typora-user-images/image-20250324115233517.png)

 hago doble click  volver a seleccionar el archivo jar de mysql y pulso en aplicar

![image-20250324114747261](/home/soa/.config/Typora/typora-user-images/image-20250324114747261.png)

Una vez seleccionado aparecerá añadido 

![image-20250324115423833](/home/soa/.config/Typora/typora-user-images/image-20250324115423833.png)

Una vez incorporado el conector de mysql, ya podemos empezar a trabajar con bases de datos desde Java.  





En los paquetes de Java tenemos: java.sql y javax.sql

![image-20250328194754624](/home/soa/.config/Typora/typora-user-images/image-20250328194754624.png)



## **DriveManager**

![image-20250328195854680](/home/soa/.config/Typora/typora-user-images/image-20250328195854680.png)

DriverManager gestiona el conjunto de controladores Java Database Connectivity (JDBC) que están disponibles para que los utilice una aplicación.

- **Connection**: Establecer la conexión con la BBDD: 

  Los primero que se debe hacer para poder conectarse a una base de datos es cargar el driver encargado en la función. Se utiliza **Class.forName("DriverXZY")** donde DriverXZY corresponde al driver a cargar por ejemplo,  el driver JDBC-ODBC es *sun.jdbc.odbc.JdbcOdbcDriver*; el driver JDBC-MySQL es *com.mysql.jdbc.Driver*. 

  **driver:protocolo_driver://detalles_de_la_conexion_del_driver**

  ```java
  jdbc::mysql://localhost:9999/gestionPedidos (Mysql)
  jdbc::odbc:DSN_gestionPedidos  (Microsoft SQL Server) 
  jdbc:oracle:juan@servidor:9999:gestionPedidos (Oracle)
  ```

  ![image-20250328201919968](/home/soa/.config/Typora/typora-user-images/image-20250328201919968.png)

  Una vez cargado el driver es necesario crear un objeto del tipo Connection, para administrar la conexión. Una aplicación puede utilizar DriveManager para obtener un objeto de tipo conexion, Connection, con una base de datos.

  jdbc:subprotocolo//servidor:puerto/base de datos

  La siguiente línea de código ilustra ésta idea:

  *Connection con = DriverManager.getConnection(url, "myLogin", "myPassword");*

  La conexión devuelta por el método ***DriverManager.getConnection*** es una conexión abierta que se puede utilizar para crear sentencias JDBC que pasen nuestras sentencias SQL al controlador de la base de datos.

  Ejemplo:

  ```java
  Class.forName("com.mysql.cj.jdbc.Driver");
  
  java.sql.Connection miConexion = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/app_restaurante", "curso", "adminr123");
  ```

  Toda conexión que abramos tendremos que cerrarla, eso se hará mediante el método **close()** de *Connection*

  ```java
  miConexion.close();
  ```

  

- **Statement**

  ![image-20250328201848347](/home/soa/.config/Typora/typora-user-images/image-20250328201848347.png)

  El objeto que se encarga de enviar las sentencias SQL al driver es el **Statement**. Al objeto Statement se le debe indicar que método utilizar dependiendo del tipo de sentencia SQL enviada (Actualizaciones o Consultas). Si la sentencia SQL es una **actualización** entonces utiliza el método **executeUpdate**. Si la sentencia SQL es una consulta, entonces se utiliza el método **executeQuery.**

  Para crear el objeto **Statement** se debe invocar el método **createStatement** dentro del objeto Connection utilizado para conectarse a la base de datos.

  ```java
  java.sql.Statement miStatement = miConexion.createStatement();
  ```

  Ejemplo de insercion de datos:

  ```java
  miStatement.executeUpdate(
  "INSERT INTO ALUMNOS " +
  "VALUES ('9821000-0', 'Armando Casas', 'Electronica')");
  ```

  

- **DataSource**

- **ResultSet**: es fundamental para obtener y manipular los datos que provienen de una consulta SQL.

  ![image-20250328201948428](/home/soa/.config/Typora/typora-user-images/image-20250328201948428.png)

  El resultado de la consulta es recibido por el API JDBC como un objeto del tipo **ResultSet**, por ello, el retorno del método **executeQuery** se asigna a un objeto de éste tipo.

  Ejemplo de consulta:
  
  ```java
  String query = "SELECT ROL, NOMBRE FROM ALUMNOS";
  ResultSet rs = miStatement.executeQuery(query);
  ```

  Dentro del objeto **ResultSet** existen diferentes métodos para extraer la información.
  
  - **next**: permite mover un puntero por las distintas filas que conforman el resultado de la consulta. (hay que imaginar el objeto ResultSet como una tabla). En un principio el puntero se encuentra sobre la primera fila, por ello antes que todo se debe invocar al método next para ingresar a la tabla
  - **getXXX**: Para obtener la información, donde XXX es el tipo de datos a recuperar, por ejemplo: getString, getInt, getFloat, etc.

  Ejemplo:
  
  ```java
  String query = "SELECT ROL, NOMBRE FROM ALUMNOS";
  ResultSet rs = stmt.executeQuery(query);
  while (rs.next()) {
      String r = rs.getString("ROL");
      String n = rs.getFloat("NOMBRE");
      System.out.println(r + " " + n);
  }
  ```

  La salida se parecerá a esto.

  9821000-0 Armando Casas

  ![image-20250328202045790](/home/soa/.config/Typora/typora-user-images/image-20250328202045790.png)

  Tipos de ResultSet:

  - **TYPE_FORWARD_ONLY y CONCUR_READ_ONLY.** : Valor por defecto
  
    ```java
    Statement sentencia = conexion.createStatement();
    
    es lo mismo que:
    
    Statement sentencia = conexion.createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
    ```

    El ResultSet s**olo** **se puede mover hacia delante** y solo puede leer los datos.  N**o tiene ninguna capacidad para actualizarlos.**

    ![image-20250328222927503](/home/soa/.config/Typora/typora-user-images/image-20250328222927503.png)

  - **TYPE_INSENSITIVE**: capaz de mover el ResultSet hacia delante y hacia atrás.

    ![image-20250328223011998](/home/soa/.config/Typora/typora-user-images/image-20250328223011998.png)

  - **TYPE_SENSITIVE**: añade la capacidad de ver los nuevos registros que se hayan insertado en la base de datos **después de ejecutar la consulta.**

    ![image-20250328223047555](/home/soa/.config/Typora/typora-user-images/image-20250328223047555.png)
  
    Hay que tener en cuenta que **los diferentes drivers no estan obligados a soportar todos los tipos de ResultSet**.  Podemos asignar un ResultSet de tipo SENSITIVE **y acabar con un Forward_Only ,tengamoslo en mente.**



![image-20250328202013858](/home/soa/.config/Typora/typora-user-images/image-20250328202013858.png)



### Pool de conexiones: BasicDataSource

https://old.chuidiang.org/java/mysql/BasicDataSource-Pool-Conexiones.php

Hemos visto en [mysql-java-basico](https://old.chuidiang.org/java/mysql/mysql-java-basico.php) que podemos establecer la conexión con la base de datos por medio de la clase *DriverManager.getConnection()*. De esta forma obtenemos una *Connection* real con la base de datos, es decir, al llamar a este método, se establece la conexión con la base de datos y cuando llamemos al método *connection.close()*, dicha conexión se cierra.

Sin embargo, hay un pequeño problema con esto. Varios hilos no pueden usar una misma conexión física con la base de datos simultáneamente, ya que la información enviada o recibida por cada uno de los hilos se entremezcla con la de los otros, haciendo imposible una escritura o lectura coherente en dicha conexión.

Hay varias posibles soluciones para este problema:

1. Abrir y cerrar una conexión cada vez que la necesitemos. De esta forma, cada hilo tendrá la suya propia. Esta solución en principio no es eficiente, puesto que establecer una conexión real con la base de datos es un proceso costoso. Andar abriendo y cerrando conexiones con frecuencia puede hacer que nuestro programa vaya más lento de lo debido.
2. Usar una única conexión y sincronizar el acceso a ella desde los distintos hilos. Esta solución es más o menos buena, pero requiere cierta disciplina al codificar, ya que tendremos que acordarnos de poner siempre los [synchronized](https://old.chuidiang.org/java/hilos/sincronizar_hilos_java.php) antes de hacer cualquier transacción con la base de datos. También tiene la pega de que los hilos deben esperar unos por otros
3. Finalmente, podemos tener varias conexiones abiertas, de forma que cuando un hilo necesite una, la "reserve" para su uso y cuando termine, la "libere" para que pueda ser usada por los demás hilos, todo ello sin abrir y cerrar la conexión cada vez. De esta forma, si hay conexiones disponibles, un hilo no tiene que esperar a que otro acabe. Esta solución es en principo la ideal y es lo que se conoce como un [pool de conexiones](http://es.wikipedia.org/wiki/Connection_pool). Afortunadamente, no debemos preocuparnos de codificarlo nosotros mismos, ya que los hay disponibles en internet. 

#### Pool de conexiones

En java, un *pool de conexiones* es una clase java que tiene abiertas varias conexiones a base de datos. Cuando alguien necesita una conexión a base de datos, en vez de abrirla directamente con *DriverManager.getConnection()*, se la pide al *pool* usando su método ***pool.getConnection()***. El *pool* coge una de las conexiones que ya tiene abierta, la marca como que alguien la está usando para no dársela a nadie más y la devuelve. La siguiente llamada a este método *pool.getConnection()*, buscará una conexión libre para marcarla como ocupada y la devolverá ... y así sucesivamente.

Cuando el que ha pedido la conexión termina de usarla, normalmente después de una transacción con la base de datos o varias seguidas, llama al método *connection.close()*. Esta conexión que nos ha sido entregada por el *pool*, realmente no se cierra con esta llamada. El método *close()* únicamente avisa al *pool* que ya hemos terminado con la conexión, de forma que sin cerrarla, la marca como libre para poder entregársela a otro que lo pida.

El uso del *pool* y de la conexión, por tanto, sigue el siguiente esquema

```java
// Se le pide al pool una conexion libre
Connection conexion = pool.getConnection();

// Se hace una o más transacciones: select, update, insert, delete ...

// Se libera la conexión para su posible uso por otro hilo
conexion.close();
```



#### apache dbcp : BasicDataSource

En la librería de *apache commons-dbcp* tenemos una implementación sencilla de un *pool de conexiones*. Dicha librería es [commons-dbcp](http://commons.apache.org/dbcp/downloads.html), que te puedes descargar del enlace. Esta librería necesita a su vez la librería [commons-pool](http://commons.apache.org/pool/downloads.html), por lo que debemos descargarnos también esta. Una vez descargadas esas dos librerías y el *driver* de nuestra base de datos [mysql-connector-java-5.1.6.jar](http://dev.mysql.com/downloads/connector/j/5.1.html) para nuestro ejemplo, debemos [a�adir todas ellas como dependencias de nuestro proyecto](http://www.chuidiang.com/chuwiki/index.php?title=A�adir_un_jar_a_nuestro_proyecto) o al [CLASSPATH](http://www.chuidiang.com/java/classpath/classpath.php) del mismo.

Una vez configurado todo, para usar *BasicDataSource* no tenemos más que hacer un *new* de esa clase y pasarle los parámetros adecuados de nuestra conexión con los métodos *set()* disponibles para ello. El siguiente trozo de código muestra cómo hacerlo

```java
BasicDataSource basicDataSource = new BasicDataSource();
basicDataSource.setDriverClassName("com.mysql.jdbc.Driver");
basicDataSource.setUsername("hibernate");
basicDataSource.setPassword("hibernate");
basicDataSource.setUrl("jdbc:mysql://localhost/hibernate");

// Opcional. Sentencia SQL que le puede servir a BasicDataSource
// para comprobar que la conexion es correcta.
basicDataSource.setValidationQuery("select 1");
```

Símplemente hemos hecho el *new* de la clase y le hemos pasado:

- Con ***setDriverClassName**()* el nombre de la clase que es el driver de nuestra conexión a la base de datos, MySQL en nuestro ejemplo
- con ***setUsername**()* un nombre de usuario válido para la base de datos (hibernate).
- con ***setPassword**()* la password de base de datos para dicho usuario (hibernate).
- con ***setUrl**()* la cadena de conexión con la base de datos, en nuestro caso en el mismo ordenador en que va a correr nuestro ejecutable (*localhost*) y el nombre de la base de datos (hibernate)

Estas cuatro son las estrictamente necesarias. [BasicDataSource permite configurar muchas otras cosas](http://commons.apache.org/dbcp/configuration.html), como cuantas conexiones debe abrir como máxima, cuántas puede tener abiertas que no se estén usando, etc. Y una característica interesante, se le puede pasar una consulta que *BasicDataSource* ejecutará para comprobar que la conexión con la base de datos es correcta. Esta consulta se pasa con *setValidationQuery()* y en el caso del ejemplo es un simple "select 1", que siempre devolverá resultado independientemente de las tablas y datos existentes en la base de datos.

Una vez instanciado el *BasicDataSource* y para evitar que dentro de lo posible el resto de nuestro código dependa de este *pool de conexiones* concreto, se suele asignar el *BasicDataSource* a una variable de tipo *javax.sql.DataSource*, que es una interface estándar de java.

```java
DataSource dataSource = basicDataSource;
```

// la variable dataSource es la que debería ver el resto de nuestro programa.

Una vez guardado nuestro *dataSource* en una variable de tipo *DataSource*, el código para hacer una transacción con la base de datos debe serguir este esquema:

```java
Connection conexion = dataSource.getConnection();
// Hacer el select, insert, update, delete...
conexion.close();
```

Por ejemplo, si suponemos una tabla *Person* con cuatro campos id, edad, nombre y apellido, para hacer una inserción haríamos lo siguiente:

```java
Connection conexion = null;
try {
  // BasicDataSource nos reserva una conexion y nos la devuelve.
  conexion = dataSource.getConnection();

  // La insercion.
  Statement ps = conexion.createStatement();
  ps.executeUpdate("insert into person values (null, 22, 'Pedro', 'Martinez')");
} catch (SQLException e) {
  e.printStackTrace();
} finally {
  // En realidad no cierra la conexion, sino que avisa al pool de que esta conexión queda libre.
  conexion.close();
}
```

Hemos puesto el *conexion.close()* en el *finally* del *try-catch*, para asegurarnos de que la conexion se cierra independientemente de que todo vaya bien o salten excepciones. Realmente y por claridad, hemos hecho una pequeña trampa en el *finally*: No podemos cerrar la conexion tal cual se está haciendo y deberíamos, por un lado, verificar que conexion no es *null* antes de intentar cerrar y por otro lado, *close()* lanza una excepción que debemos capturar. El código real del *finally* para una cosa tan sencilla como llamar a un *close()* se complica así

```java
finally {
  try {
   if (null != conexion) {
     conexion.close();
   }
  } catch (SQLException e) {
   e.printStackTrace();
}
```

En [EjemploDataSource.java](http://code.google.com/p/chuidiang-ejemplos/source/browse/trunk/ejemplos-java-mysql/src/main/java/com/chuidiang/ejemplos/datasource_mysql/EjemploDataSource.java) tienes un ejemplo completo usando *BasicDataSource*.

#### Configurar el pool desde un fichero de propiedades: BasicDataSourceFactory

Si no queremos poner todos los parámetros necesarios para la conexión directamente en código y usando los métodos *set()* mencionados anteriormente, podemos poner dichos parámetros en un fichero de propiedades de java [datasource_config.properties](http://code.google.com/p/chuidiang-ejemplos/source/browse/trunk/ejemplos-java-mysql/src/main/config/datasource_config.properties), similar al siguiente

```
\# Propiedades para la conexion a base de datos con BasicDataSource
driverClassName=com.mysql.jdbc.Driver
username=hibernate
password=hibernate
url=jdbc:mysql://localhost/hibernate
validationQuery=select 1
```

en el que el nombre de cada propiedad se extrae del método *set* correspondiente, quitando *set* y pasando la primera letra a minúscula (*BasicDataSource* no es más que un [bean de java](http://es.wikipedia.org/wiki/JavaBean), con métodos *set()* y *get()* para sus propiedades). Ahora sólo nos queda cargar este fichero de propiedades en nuestro código

```java
Properties propiedades = new Properties();
propiedades.load(new FileInputStream(
  "src/main/config/datasource_config.properties"));
```

siendo *java.util.Properties* una clase estándar de java.

Para obtener nuestro *BasicDataSource* a partir de estas propiedades cargadas, debemos usar el método *createDataSource()* de la clase *BasicDataSourceFactory* que viene con *commons-dbcp*. El código para ello puede ser como este

```java
DataSource dataSource = BasicDataSourceFactory.createDataSource(propiedades);
```



## Java DataSource y sus origenes

Hace ya mucho mucho tiempo en los inicios de la programación en Java no era tan típico disponer de una aplicación Web sino de una aplicación de Escritorio que se conectaba a una base de datos esta aplicación habitualmente estaba desarrollada con Swing , SWT o incluso AWT. Todos entornos de ventanas . Estas aplicaciones necesitaban conectarse a la base de datos y obtener información sobre ella . Para ello usaban un driver JDBC y un Objeto Connection.

![Java Connection](https://www.arquitecturajava.com/wp-content/uploads/JDBCConexion.png)



Un objeto de Conexión a la base de datos es un objeto “caro” de construir y se encarga de lanzar consultas a la base de datos para insertar datos o devolverlos. Una aplicación de este estilo funciona bastante bien con una conexión viva a la base de datos y la gestiona. El problema de esta solución es cuando introducimos una aplicación web. Las cuales antiguamente se manejaban con Servlets y JSP.

![Java Web y Conexiones](https://www.arquitecturajava.com/wp-content/uploads/servlet-2.png)

En este caso cada vez que el servlet hacía una conexión a la base de datos y obtenia resultados generaba un HTML y luego descartaba la conexión y la destruia.



Esto es un problema ya que una objeto de conexión es un objeto muy caro de construir y el rendimiento se veía seriamente afectado.

![Java DataSource Problema](https://www.arquitecturajava.com/wp-content/uploads/destruye.png)

## Java Pool de Conexiones

Para evitar este problema las aplicaciones web se rediseñaron para tener un pool de conexiones o Java DataSource . Este pool de conexiones es un conjunto de conexiones que se crean al arrancar el servidor de aplicaciones y están disponibles para cada aplicación durante su ciclo de vida y por lo tanto cada Servlet puede usar una de estas conexiones un rato y luego **la devuelve al pool sin destruirla** . Es el concepto que habitualmente se conoce en la vida diaria como “alquiler” nosotros alquilamos cosas que usamos un tiempo y luego las devolvemos para que otros las usen.

![Java DataSource](https://www.arquitecturajava.com/wp-content/uploads/poolconexiones.png)

De esta manera un Servlet puede usar una conexión a la base de datos sin estar destruyendola.

continuamente a este concepto de Pool de Conexiones o Grupo de conexiones se le termino llamando Java DataSource o fuente de datos Java.

![Arquitectura Web](https://www.arquitecturajava.com/wp-content/uploads/final-1.png)

Spring Boot DataSource

Esto es lo que habitualmente configuramos cuando estamos hablando de DataSource de Spring Framework, se trata de un pool de conexiones que es configurable.

```java
spring.datasource.url=jdbc:mysql://localhost:8889/springjpa
spring.datasource.username=root
spring.datasource.password=root
spring.datasource.driver.class=com.mysql.jdbc.Driver
spring.jpa.properties.hibernate.dialect = org.hibernate.dialect.MySQL5Dialect
```

https://www.arquitecturajava.com/que-es-un-java-datasource/









Ejemplo completo:

```java
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ConsultaPersona {

    public static void main(String[] args) {
        // URL de la base de datos, nombre de usuario y contraseña
        String url = "jdbc:mysql://localhost:3306/mibasedatos";
        String usuario = "root";
        String contraseña = "password";

        // Variables para la conexión
        Connection conexion = null;
        Statement sentencia = null;
        ResultSet resultado = null;

        try {
            // Establecemos la conexión a la base de datos
            conexion = DriverManager.getConnection(url, usuario, contraseña);

            // Creamos una sentencia SQL
            sentencia = conexion.createStatement();

            // Definimos la consulta SQL
            String consultaSQL = "SELECT dni, nombre, apellidos FROM persona";

            // Ejecutamos la consulta y obtenemos los resultados
            resultado = sentencia.executeQuery(consultaSQL);

            // Recorremos el ResultSet para obtener los resultados
            while (resultado.next()) {
                String dni = resultado.getString("dni");
                String nombre = resultado.getString("nombre");
                String apellidos = resultado.getString("apellidos");

                // Imprimimos los resultados
                System.out.println("DNI: " + dni + ", Nombre: " + nombre + ", Apellidos: " + apellidos);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Cerramos los recursos en el orden adecuado
            try {
                if (resultado != null) resultado.close();
                if (sentencia != null) sentencia.close();
                if (conexion != null) conexion.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
```

**Java ResultSet Simplificación con Try with Resources**

Podemos reducir el código usando el bloque Try with Resources que mejora en la gestión de recursos ya que cierra automáticamente los objetos que implementan la interfaz AutoCloseable (como Connection, Statement y ResultSet) sin necesidad de hacerlo manualmente en un bloque finally.

![JDBC Try with Resources](https://www.arquitecturajava.com/wp-content/uploads/trywithresources-1.png)

```java
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ConsultaPersona {

    public static void main(String[] args) {
        // URL de la base de datos, nombre de usuario y contraseña
        String url = "jdbc:mysql://localhost:3306/mibasedatos";
        String usuario = "root";
        String contraseña = "password";

        // Usamos try-with-resources para asegurar que los recursos se cierren automáticamente
        try (Connection conexion = DriverManager.getConnection(url, usuario, contraseña);
             Statement sentencia = conexion.createStatement();
             ResultSet resultado = sentencia.executeQuery("SELECT dni, nombre, apellidos FROM persona")) {

            // Recorremos el ResultSet para obtener los resultados
            while (resultado.next()) {
                String dni = resultado.getString("dni");
                String nombre = resultado.getString("nombre");
                String apellidos = resultado.getString("apellidos");

                // Imprimimos los resultados
                System.out.println("DNI: " + dni + ", Nombre: " + nombre + ", Apellidos: " + apellidos);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
```









PRUEBAS NUESTRAS EN EL CURSO EN ECLIPSE:

Para ver como se haría creamos un proyecto de tipo Dynamic Web Project llamado Clases

Creamos un archivo bd1.jsp donde vamos a crear un formulario

```jsp
<div style="border: 2px solid black;text-align: center;width: 300px; background-color: chocolate; margin-top: 150px; margin-left: 100px">
	<form action="recoge_datos.jsp">
		<label>Nombre</label><br>
		<input type="text" name="nombre"><br><br>
		<button type="submit">Enviar</button><br><br>
	</form>
</div>
```

Creamos otro archivo recoge_datos.jsp (este es el nombre del archivo que ponemos en el action del formulario) 

```jsp
<form action="recoge_datos.jsp">
```

Ahora para recoger los valores, tenemos que crear una variable por cada valor que queremos recoger dentro de las etiquetas de java <% %>

```jsp
<%
/*nombre es el nombre del formulario definido en name="nombre"  */
String nombre = request.getParameter("nombre");
```

Para mirar información sobre como crear conexion a la base de datos, buscamos en la api java.sql y la clase Class DriverManager https://docs.oracle.com/javase/8/docs/api/ 

https://docs.oracle.com/javase/8/docs/api/java/sql/DriverManager.html#getConnection-java.lang.String-java.util.Properties- Para crear la conexión con la base de datos hay que utilizar la función

```java
public static Connection getConnection(String url,
                                       String user,
                                       String password);
```

Para mi ordenador:

```java
y en url ponemos: "jdbc:mysql://localhost:3306/ejemplo"
en user el usuario: "curso"
password: "adminr123"
    
// con la función quedaría
java.sql.Connection miConexion = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/ejemplo", "curso", "adminr123");    
```

en el ordenador de clase sería:

```java
y en url ponemos: "jdbc:mysql://localhost:3306/ejemplo"
en user el usuario: "root"
password: ""
    
// con la función quedaría
java.sql.Connection miConexion = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/ejemplo", "root", "");     
```

 

Para saber la ruta con el puerto miramos en Mysql que puerto estamos utilizando

```mysql
show variables where variable_name in("hostname","port");
```



Al ejecutar el código nos da este error:

![image-20250324124401649](/home/soa/.config/Typora/typora-user-images/image-20250324124401649.png)

Para solucionarlo nos tenemos que crear una clase antes de crear la conexión con Class.forName del driver que hemos añadido anteriormente

```java
Class.forName("com.mysql.jdbc.Driver");

si estuviese deprecada poner:
Class.forName("com.mysql.cj.jdbc.Driver");
```

**NOTA**:  En JDBC 4.0, el controlador JDBC se carga automáticamente y la llamada Class.forName no es necesaria





El código completo de bd1.jsp quedaría como:

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
    
<body style="background-color: grey;">
    <div style="border: 2px solid black;text-align: center;width: 300px; background-color: chocolate; margin-top: 150px; margin-left: 100px">
        <form action="recoge_datos.jsp">
            <label>Nombre</label><br>
            <input type="text" name="nombre"><br><br>
            <button type="submit">Enviar</button><br><br>
        </form>
    </div>
</body>
</html>
```



El código completo de recoge_datos.jsp quedaría como:
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
    /*nombre es el nombre del formulario definido en name="nombre"  */
    String nombre = request.getParameter("nombre");

    Class.forName("com.mysql.jdbc.Driver");

    java.sql.Connection miConexion = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/ejemplo", "curso", "adminr123");

    /*Creamos el objeto  */
    java.sql.Statement miStatement = miConexion.createStatement();

    /*Creamos la sentencia sql */
    String instruccionSql = "INSERT INTO ejemplo.prueba1 (nombre) VALUES ('"+nombre+"');";

    /*Ejecutamos la instrucción */
    miStatement.executeUpdate(instruccionSql);

    /*Imprimimos un mensaje por consola, como estamos en jsp, ya no estamos en el sistema no hace falta poner system.out.print*/
    out.print("registrado con exito");

    %>

</body>
</html>
```



Creamos en el proyecto clases el archvio bd2.jsp y registro.jsp que se va a llamar desde el action del formulario.

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<div style="border: 2px solid black;text-align: center;width: 300px; background-color: chocolate; margin-top: 150px; margin-left: 100px">
	<form action="registro.jsp">
		<label>Nombre</label><br>
		<input type="text" name="nombre"><br><br>
		<button type="submit">Enviar</button><br><br>
	</form>
</div>


</body>
</html>
```

![image-20250329155941372](/home/soa/.config/Typora/typora-user-images/image-20250329155941372.png)

El valor que recogemos queremos que se nos vea en otra parte, en el archivo jsp donde lo queremos mostrar (registro.jsp) ponemos por ejemplo.

```jsp
<body>

<h2>USUARIOS REGISTRADOS:</h2>
<br><br>
Nombre:<%=request.getParameter("nombre") %>

</body>
```

Donde el valor de dentro de getParameter es el nombre dado en el name del formulario del otro archivo jsp (bd2.jsp)

Nos creamos otro archivo registro2.jsp que va a recoger la fecha de hoy la queremos mostrar en registro.jsp incluyendo el archivo registro2.jsp con un include jsp.

Contenido registro2.jsp

```jsp
<body>
fecha hoy: <%=new java.util.Date() %> 

</body>
```

Contenido final de resgitro.jsp que incluye registro2.jsp mas el valor recogido y la ventana del formulario del archivo bd2.jsp

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="float:right">
	<!-- con jsp:include incluye el archivo jsp que queremos -->
	<jsp:include page="registro2.jsp"></jsp:include>
</div>

<h2>USUARIOS REGISTRADOS:</h2>
<br><br>
Nombre:<%=request.getParameter("nombre") %>



<jsp:include page="Bd2.jsp"></jsp:include>
</body>
</html>
```

![image-20250329160304662](/home/soa/.config/Typora/typora-user-images/image-20250329160304662.png)





Vamos a crear en app_restaurante la funcionalidad del enlace menu

Primero enlazamos enlace en la cabecera (header.jsp)

```jsp
<li><a href="menu.jsp">MENU</a></li>
```

Creamos los archivos menu.jsp y menu1.jsp

En menu.jsp dentro del body incluimos la cabecera (header.jsp) para que siempre se mantenga los enlaces de la izquierda y creamos un div del tamaño que nos queda disponible

```jsp
<jsp:include page="header.jsp"></jsp:include>

<div style="margin-left: 25%; padding: 1px; height:700px;">
</div>
```

Nos descargamos una imagen de menu





En api_restaurante vamos a hacer el apartado de ventas del bar, para ello modificamos en ventas.jsp y creamos otro botón

```jsp
<button type="button" class="btn btn-danger" onclick=bote()>Bote</button>
```

y creamos la funcion bote en funcion.js

```javascript
function bote(){
	var hoy=0;
	var lunes=0;
	var martes=0;
	var miercoles=0;
	var jueves=0;
	var viernes=0;
	var sabado=0;
	var division1=0;
	var division2=0;
	var division3=0;
	var division4=0;
	var total=0;
	var resultado1=0;
	var resultado2=0;
	var resultado3=0;
	var resultado4=0;
	
	
	hoy = prompt("bote de hoy: ");
	lunes = prompt("bote de lunes: ");
	martes = prompt("bote de martes: ");
	miercoles = prompt("bote de miercoles: ");
	jueves = prompt("bote de jueves: ");
	viernes = prompt("bote de viernes: ");
	sabado = prompt("bote de sabado: ");
	
	division1 = prompt("Numero de gerente");
	division2 = prompt("Numero de bartener");
	division3 = prompt("Numero de cocineros");
	division4 = prompt("Numero de camareros");
	
	total=Number(hoy)+Number(lunes)+Number(martes)+Number(miercoles)+Number(jueves)+Number(viernes)+Number(sabado);
	
	resultado1 = total*0.50/division1;
	resultado2 = total*0.20/division2;
	resultado3 = total*0.15/division3;
	resultado4 = total*0.15/division4;
	
	document.getElementById("parrafo").innerHTML="<p style='text-align:center'>"+"---------------"+"<br>"+"El total del bote semanal es :"+total+"<br><br>"+"Los gerentes cobran: "+resultado1+"<br>"+"Los barteners cobran: "+resultado2+"<br>"+"Los cocineros cobran: "+resultado3+"<br>"+"Los camareros cobran: "+resultado4+"<br>";
}

```





Modelos entidad relación



Instalar Visual Paradigm Community Edition para hacer modelado de base de datos, para hacer mapeo, también se prodría con draw.io de visual studio code.



Mapeo modelo entidad relación

Elemntos básicos

- entidades: rectángulo





VIsual Paradigm

Create new project .> entidadRelacion

![image-20250402095630108](/home/soa/.config/Typora/typora-user-images/image-20250402095630108.png)

![image-20250402095845665](/home/soa/.config/Typora/typora-user-images/image-20250402095845665.png)

![image-20250402095904228](/home/soa/.config/Typora/typora-user-images/image-20250402095904228.png)

Para crear la relación, se pulsa en el boton chiquitito de arriba a la izquierda de cada tabla:

![image-20250402101522264](/home/soa/.config/Typora/typora-user-images/image-20250402101522264.png)

Una vez que pulsamos ese botón aparece:

![image-20250402101605047](/home/soa/.config/Typora/typora-user-images/image-20250402101605047.png)



Para exportar a imagen

![image-20250402101436549](/home/soa/.config/Typora/typora-user-images/image-20250402101436549.png)



![image-20250402102523912](/home/soa/.config/Typora/typora-user-images/image-20250402102523912.png)

Elegimos modelo físico, en el ejemplo anterior hicimos el conceptual, que nos vale para imprimir exportandolo a una imagen, al elegir el modelo físico nos aparece ademas un boton para exportarlo a sql.
