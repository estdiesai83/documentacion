Con sintaxis col_name (length) en una especificación de índice, puede crear un índice que use sólo los primeros length caracteres de una columna CHAR o VARCHAR. Indexar sólo un prefijo de valores de columna como este puede hacer el fichero de índice mucho más pequeño.

En MySQL 5.0, los motores MyISAM e InnoDB soportan indexación en columnas BLOB y TEXT. Al indexar columnas BLOB y TEXT debe especificar una longitud de prefijo para el índice. Por ejemplo:

```mysql
CREATE TABLE test(blob_clo BLOB, INDEX(blob_col(10)));
```

En Mysql 5.0, los prefijos pueden tener hasta 1000 bytes de longitud para tablas MyISAM e InnoDB y 255 bytes para otros tipos de tablas. Tenga en cuenta que los límites de prefijo se miden en bytes, mientras que la longitud de prefijo en comando CREATE TABLE se interpretan como el número de caracteres. Asegúrese de tener esto en cuenta al especificar una longitud de prefijo para una columna que use un conjunto de caracteres multi-byte.

Una especificación index_col_name puede acabar con ASC o DESC. Estas palabras clave se permiten para extensiones futuras para especificar almacenamiento de índices ascendente o descendente. Actualmente se parsean pero no se ignoran; los valores de índice siempre se almacenan en orden ascendente.

Cuando usa ORDER BY o GROUP BY en una columna TEXT o BLOB en un SELECT, el servidor ordena los valores usando solo el número inicial de bytes indicados por la variable de sistema max_sort_length.

 En MySQL 5.0, puede crear índices especiales FULLTEXT, que se usan para índices fulltext. Solo las tablas MyISAM soportan índices FULLTEXT. Pueden crearse solo desde columnas CHAR, VARCHAR y TEXT. La indexación siempre se hace sobre la columna entera; la indexación parcial no se soporta y cualquier longitud de prefijo se ignora.

En MySQL 5.0, puede crear índices SPATIAL en tipos de columna espaciales. Los tipos espaciales se soportan solo para tablas MyISAM y las columnas indexadas deben declararse como NOT NULL. Consulte capítulo 18, Extensiones espaciales de MySQL.

En MySQL 5.0, las tablas InnoDB soportan el chequeo de restricciones de claves foráneas. Tenga en cuenta que la sintaxis FOREIGN KEY en InnoDB es más restrictiva que la sintaxis presentada para el comando CREATE TABLE al inicio de esta sección: las columnas en la tabla referenciada debe siempre nombrarse explícitamente. InnoDB soporta tanto acciones ON DELETE como ON UPDATE en MySQL 5.0.

Para otros motores de almacenamiento, MySQL Server parsea la sintaxis FOREIGN KEY y REFERENCES en comando CREATE TABLE, pero no hace nada. La cláusula CHECK se parsea pero se ignora en todos los motores de almacenamiento.

Para tablas MyISAM cada columna NOT NULL ocupa un bit extra, redondeando al byte más próximo. La máxima longitud de registro en bytes puede calcularse como sigue:

```
row length =1
+ (sum of columns lengths)
+ (number of NULL columns + delete_flag + 7)/8
+ (number of variable-length columns)
```

delete_-flages 1 para tables con formato de registro estático. Las tablas estáticas usan un bit en el registro para un flag que indica si el registro se ha borrado. delete_flages 0 para tablas dinámicas ya que el flag se almacena en una cabecera de registro dinámica.

Estos cálculos no se aplican en tablas InnoDB, en las que el tamaño de almacenamiento no es distinto para columnas NULL y NOT NULL.

La parte table_options de la sintaxis CREATE TABLE puede usarse desde MySQL 3.23.

Las opciones ENGINE y TYPE especifican el motor de almacenamiento para la tabla. ENGINE es el nombre preferido para la opción en MySQL 5.0, y TYPE esta obsoleto. El soporte para la palabra TYPE usada en este contexto desaparecerá en MySQL 5.1.

Las opciones ENGINE y TYPE pueden tener los siguientes valoes:

![image-20241029234537987](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241029234537987.png)

Si un motor no está disponible, MySQL usa en su lugar MyISAM. Por ejemplo, si una definición de tabla incluye la opción ENGI-NE=BDB pero el servidor MySQL no soporta tablas BDB, la tabla se crea como MyISAM. Esto hace posible tener un entorno de replicación donde tiene tablas transaccionales en el maestro pero tablas no transaccionales en el esclavo (para tener más velocidad). En MySQL 5.0, aparece una advertencia si la especificación del motor no es correcta.

Las otras opciones de tabla se usan para optimizar el comportamiento de la tabla. En la mayoría de casos, no tiene que especificar ninguna de ellas. La opción funciona para todos los motores a no ser que se indique lo contrario:

 **AUTO_INCREMENT**

El valor inicial para AUTO_INCREMENT para la tabla. En MySQL 5.0, solo funciona para tablas MyISAM y MEMORY. También se soporta para InnoDB desde MySQL 5.0.3. Para iniaclizar el primer valor de auto incremento para motores que no soporten esta opción, inserte un registro de prueba con un valor que sea uno menor al deseado tras crear la tabla, y luego borre este registro.

Para motores que soportan la opción de tabla AUTO_INCREMENT en comando CREATE TABLE puede usar ALTER TABLE tbl_name AUTO_INCREMENT = n para resetear el valor AUTO_INCREMENT.

**AVG_ROW_LENGTH**

Una aproximación de la longitud media de registro para su tabla. Necesita inicializarla solo para tablas grandes con registros de longitud variable.

Cuando crea una tabla MyISAM, MySQL usa el producto de lasa opciones MAX_ROWS y AVG_ROW_LENGTH para decidir el tamaño de la tabla resultante. Si no las especifica, el tamaño máximo para la tabla es 65,536TB de datos (4GB antes de MySQL 5.0.6). (Si su sistema operativo no soporta ficheros de este tamaño, los tamaños de fichero se restringen al límite del sistema operativo). Si quiere mantener bajos los tamaños de los punteros para que el índice sea pequeño y rápido y no necesita realmente ficheros grandes, puede decrementar el tamaño de puntero por defecto mediante la variable del sistema myi-sam_data_pointer_size que se añadió en MySQL 4.1.2. Si se quiere que todas sus tablas sean capaces de crecer por encima del límite por defecto y quiere mantener sus tablas ligeramente más lentas y más grandes de lo necesario, puede incrementar el tamaño de puntero por defecto cambiando esta variable.

**[DEFAULT] CHARACTER SET**

Especifica el conjunto de caracteres para la tabla. CHARSET es un sinónimo para CHARACTER SET.

**COLLATE**

Especifica la colación por defecto de la tabla.

**CHECKSUM**

Póngalo a 1 si quiere que MySQL mantenga un checksum para todos los registros (un checksum que MySQL actualiza automáticamente según cambia la tabla). Esto hace que la tabla tenga actualizaciones más lentas, pero hace más fácil encontrar tablas corruptas. El comando CHECKSUM TABLE muestra el checksum (solo para MyISAM).

**COMMENT**

Un comentario para su tabla hasta 60 caracteres.

**MAX_ROWS**

Máximo número de registros que planea almacenar en la tabla. No es un límite en absoluto, sino un indicador que la tabla debe ser capaz de almacenar al menos estos registros.

**MIN_ROWS**

Mínimo número de registros que planea almacenar en la tabla.

**PACK KEYS**

Ponga esta opción a 1 si quiere tener índices más pequeños. Esto hace normalmente que las actualizaciones sean más lentas y las lecturas más rápidas. Poner esta opción a 0 deshabilita la comprensión de claves. Ponerla a DEFAULT le dice al motor que comprima solo columnas CHAR/VARCHAR largas (MyISAM y ISAM solo).

Si no usa PACK_KEYS, por defecto se comprimen solo cadena, no números. Si usa PACK_KEYS = 1, también se empaquetan números.

Al comprimir claves de números binarios, MySQL usa comprensión de prefijo:

Cada clave necesita un byte extra para indicar cuántos bytes de la clave previa son los mismos para la siguiente clave.

El puntero al registro se almacena en orden de el mayor-byte-primero directamente tras la clave, para mejorar la comprensión.

Esto significa que si tiene muchas claves iguales en dos registros consecutivos, todas las "mismas" claves siguientes usualmente solo ocupan dos bytes (incluyendo el puntero al registro). Comparar esto con el caso ordinario donde las siguientes claves ocupan storage_size_for_key + pointer_size (donde el tamaño del puntero es usualmente 4). Obtiene un gran beneficio a partir de la comprensión de prefijos señalo si tiene muchos números que sean el mismo. Si todas las claves son totalmente distintas, usa un byte más por clave, si la clave no es una clave que pueda tener valores NULL. (En ese caso, el tamaño empaquetado de la clave se almacena en el mismo byte que se usa para marcar si una clave es NULL).

**PASSWORD**

Cifra el fichero .frm con un contraseña. Esta opción no hace nada en la versión estándar de MySQL.

**DELAY_KEY_WRITE**

Póngalo a 1 si quiere retardar actualizaciones de clave para la tabla hassta que se cierra (solo en MyISAM).

**ROW_FORMAT**

Define cómo deben almacenarse los registros. Actualmente esta opción solo funciona con tablas MyISAM. El valor de la opción puede ser FIXED o DYNAMIC para formato de longitud estática o variable.  myisampack cambia el tipo a COMPRESSED.

**RAID_TYPE**

Tenga en cuenta que el soporte para RAID se ha eliminado desde MySQL 5.0.

**UNION**

UNION se usa cuando quiere usar una colección de tablas idénticas como una. Funciona solo con tablas MERGE.

En MySQL 5.0, debe tener permisos SELECT, UPDATE y DELETE para las tablas mapeadas en una tabla MERGE. (Nota: Originalmente, todas las tablas usadas tenían que estar en la misma base de datos que la tabla MERGE. Esta restricción se ha eliminado).

**INSERT_METHOD**

Si quiere insertar datos en una tabla MERGE debe especificarlo con INSERT_METHOD en la tabla en que se debe insertar el registro. INSERT_METHOD es una opción útil para tablas MERGE solo. Use un valor de FIRST o LAST para que las inserciones vayan a la primera o última tabla, o un valor de NO para evitar insercciones.

**DATA DIRECTORY, INDEX DIRECTORY**

Usando DATE DIRECTORY = 'directory' o INDEX_DIRECTORY = 'directory' puede especificar dónde debe el motor MyISAM guardar un fichero de datos e índice de una tabla. Tenga en cuenta que el directorio debe ser una ruta completa al directorio (no una ruta relativa).

Estas opciones solo funcionan cuando no usa la opción --skip-simbolics-links. Su sistema operativo debe tener una llamada realpath() que funcione bien.

En MySQL 5.0, puede crear una tabla de otra añadiendo un comando SELECT al final del comando CREATE TABLE:

```mysql
CREATE TABLE new_tbl SELECT * FROM orig_tbl;
```

MySQL crea nuevas columnas para todos los elementos de un SELECT. Por ejemplo:

```mysql
CREATE TABLE test (a INT NOT NULL AUTO_INCREMENT 
PRIMARY KEY (a), KEY(b))
TYPE = MyISAM SELECT b,c FROM test2;
```

Esto crea una tabla MyISAM con tres columnas a, b y c. Tenga en cuenta que las columnas para el comando SELECT se añaden a la derecha de la tabla, no se sobreescriben en la misma. Consulte el siguiente ejemplo:

![image-20241031112204205](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241031112204205.png)

Para cada registro en la tabla foo, se inserta un registro en bar con los valores de foo y valores por defecto para las nuevas columnas:

Si hay cualquier error al copiar los datos a la tabla, se borra automáticamente y no se crea.

CREATE TABLE ... SELECT no crea ningún índice automáticamente. Se hace a propósito para hacer el comando lo más flexible posible. Si quiere tener índices en la tabla creada, debe especificarlo antes del comando SELECT:

```mysql
CREATE TABLE bar (UNIQUE(n) SELECT n FROM foo);
```

Algunas conversiones de tipos de columnas pueden ocurrir. Por ejemplo, el atributo AUTO_INCREMENT no se preserva, y las columnas VARCHAR pueden ser CHAR.

Al crear una tabla con CREATE...SELECT, asegúrese de poner un alias para cualquier llamada a función o expresión en la consulta. Si no lo hace, el comando CREATE puede fallar o crear nombres de columnas no deseados.

```mysql
CREATE TABLE artits_and_works
SELECT artit.name, COUNT(work.artist_id) AS number_of_works
FROM artist LEFT JOIN work ON artist.id = work.artist_id
GROUP BY artist.id;
```

Puede especificar explícitamente el tipo de una columna generada:

```mysql
CREATE TABLE foo (a TINYINT NOT NULL) SELECT b+1 AS a FROM bar;
```

En MySQL 5.0, use LIKE para crear una tabla vacía basada en la definición de otra tabla, incluyendo cualquier atributo de columna e índice definido en la tabla original:

```mysql
CREATE TABLE new_tbl LIKE ori_tbl;
```

CREATE TABLE ...LIKE no copia ninguna opción de tabla DATA DIRECTORY o INDEX DIRECTORY especificadas en la tabla original, ni ninguna definición de clave foránea.

Puede preceder SELECT con IGNORE o REPLACE para indicar cómo tratar registros que dupliquen claves únicas. Con IGNORE, los nuevos registros que duplican un registro único existente se descartan. Con REPLACE, los nuevos registros reemplazan a los antiguos con el mismo valor. Si ni IGNORE ni REPLACE se indican, los valores únicos duplicados dan un error.

Para asegurar que el log update o binario pueda usarse para crear tablas originales, MySQL no permite inserciones concurrentes durante CREATE TABLE...SELECT.



#### Sintaxis de DROP DATABASE

```mysql
DROP {DATABASE | SCHEMA} [IF EXISTS] db_name
```

DROP DATABASE borra todas las tablas en la base de datos y borra la base de datos. Sea muy cuidadoso con este comando. Para usar DROP DATABSE, necesita el permiso DROP en la base de datos.

IF EXIST se usa para evitar un error si la base de datos no existe.

DROP SCHEMA puede usarse desde MySQL 5.0.2

Si usa DROP DATABASE en una base de datos enlazada simbólicamente, tanto el enlace como la base de datos se borran.

DROP DATABASE retorna el número de tablas que se eliminan. Se corresponde con el número de ficheros .frm borrados.

El comando DROP DATABASE borra del directorio de base de datos los ficheros y directorios que MySQL puede crear durante operaciones normales:

| .BAK | .DAT | .HSH |
| ---- | ---- | ---- |
| .MRG | .MYD | .ISD |
| .MYI | .db  | .frm |

Todos los subdirectorios con nombres que tienen dos dígitos hexadecimales 00-ff. Son subdirectorios usadas por tablas RAID. (Estos directorios no se borran desde MySQL 5.0, cuando se eliminó el soporte para tablas RAID). Debe convertir las tablas RAID y eliminar estos directorios manualmente antes de actualizar a MySQL 5.0)

El dichero db.opt, si existe.

Si permanecen otros ficheros o directorios en el directorio de la base de datos que MySQL borre los ficheros listados, el directorio de base de datos no puede borrarse. En este caso, debe borrar cualquier fichero restante manualmente y realizar el comando DROP DATABASE de nuevo.

Puede borrar bases de datos con mysqladmin.



#### Sintaxis de drop index

```mysql
DROP INDEX index_name ON tbl_name
```

DROP INDEX borra el índice llamado index_name de la tabla tbl_name. En MySQL 5.0, DROP INDEX se mapea a comando ALTER TABLE para borrar el índice.



#### Sintaxis de DROP TABLE

```mysql
DROP [TEMPORARY] TABLE [IF EXISTS]
    tbl_name [, tbl_name] ...
    [RESTRICT | CASCADE]
```

DROP TABLE borra una o más tablas. Debe tener el permiso DROP para cada tabla. Todos los datos de la definición de tabla son borrados, así que tenga cuidado con este comando.

Use IF EXISTS para evitar un error para tablas que no existan. Un NOTE se genera para cada tabla no existente cuando se usa IF EXISTS.

RESTRICT y CASCADE se permiten para hacer la portabilidad más fácil. De momento, no hacen nada.

Nota: DROP TABLE hace un commit automáticamente con la transacción activa, a no ser que use la palabra TEMPORARY.

La palabra TEMPORARY tiene el siguiente efecto:

- El comando solo borra las tablas TEMPORARY.
- El comando no acaba una transacción en marcha.
- No se chequean derechos de acceso. (Una tabla TEMPORARY es visible solo para el cliente que la ha creado, así que no es necesario).

Usar TEMPORARY es una buena forma de asegurar que no borra accidentalmente una tabla no TEMPORARY.



#### Sintaxis de RENAME TABLE

```mysql
RENAME TABLE
    tbl_name TO new_tbl_name
    [, tbl_name2 TO new_tbl_name2] ...
```

Este comando renombra una o más tablas.

La operación de renombrar se hace automáticamente, lo que significa que ningún otro flujo puede acceder a ninguna de las tablas mientras se ejecuta el renombrado. Por ejemplo, si tiene una tabla existente old_table, puede crear otra tabla new_table con la misma estructura pero vacía, y luego reemplazar la tabla existente con la vacía como sigue:

```mysql
CREATE TABLE new_table(...);

RENAME TABLE old_table TO backup_table, new table TO old_table;
```

Si el comando renombra más de una tabla, las operaciones de renombrado se realizan de izquierda a derecha. Si quiere intercambiar dos nombres de tablas, puede hacerlo así (asumiendo que no existe ninguna tabla llamada tmp_table):

```mysql
RENAME TABLE old_table TO tmp_table,
new_table TO old_table,
tmp_table TO new_table;
```

Mientras haya dos bases de datos en el mismo sistema de ficheros puede renombrar una tabla para moverla de una base de datos a otra:

```mysql
RENAME TABLE current_db.tbl_name TO other_db.tbl_name;
```

Cuando ejecuta RENAME, no puede tener ninguna tabla bloqueada o transacciones activas. Debe tener los permisos ALTER y DROP en la tabla original, y los permisos CREATE y INSERT en la nueva tabla.

Si MySQL encuentra cualquier error en un renombrado múltiple, hace un renombrado inverso para todas las tablas renombradas para devolver todo a su estado original.



#### Sentencias de datos: Select, Insert, Delete, Update

#### Sintaxis de DELETE

Sintaxis para una tabla:

```Mysql
DELETE [LOW_PRIORITY] [QUICK] [IGNORE] FROM tbl_name
    [WHERE where_condition]
    [ORDER BY ...]
    [LIMIT row_count]
```

Sintaxis para múltiples tablas:

```mysql
DELETE [LOW_PRIORITY] [QUICK] [IGNORE]
    tbl_name[.*] [, tbl_name[.*]] ...
    FROM table_references
    [WHERE where_condition]

DELETE [LOW_PRIORITY] [QUICK] [IGNORE]
    FROM tbl_name[.*] [, tbl_name[.*]] ...
    USING table_references
    [WHERE where_condition]
```

 DELETE borra los registros de tbl_name que satisfacen la condicion dada por where_definition, y retorna el número de registros borrados.

Si realiza un comando DELETE sin cláusula WHERE se borran todos los registros. Una forma más rápida de hacerlo, cuando no quiere saber el número de registros borrados, sea TRUNCATE TABLE.

Si borra el registro conteniendo el máximo valor para una columna AUTO_INCREMENT, el valor se reusa para una tabla BDB, pero no para tablas MyISAM o InnoDB. Si borra todos los registros en la tabla con DELETE FROM tbl_name (sin cláusula WHERE) en modo AUTOCOMMIT, la secuencia comienza para todos los tipos de tabla excepto para InnoDB y MyISAM. Hay algunas excepciones para este comportamiento para tablas InnoDB.

Para tablas MyISAM y BDB, puede especificar una columna AUTO_INCREMENT secundaria en una clave de múltiples columnas. En este caso, el reuso de valores borrados del inicio de la secuencia se realiza incluso para tablas MyISAM.

El comando DELETE soporta los siguientes modificadores:

- Si especifica LOW_PRIORITY, la ejecución de DELETE se retarda hasta que no hay más clientes leyendo de la tabla.
- Para tablas MyISAM, si usa la palabra QUICK, el motor de almacenamiento no mezcla las hojas del índice durante el borrado, que puede acelerar algunos tipos de operaciones de borrado.
- En MySQL 5.0, la palabra clave IGNORE hace que MySQL ignore todos los errores durante el proceso de borrar registros. (Los errores encontrados durante la etapa de parseo se procesan de la forma habitual.)  Los errores que se ignoran debido al uso de esta opción se retornan como advertencias.

La velocidad de las operaciones de borrado pueden verse afectadas por factores.

En tablas MyISAM, los registros borrados se mantienen en una lista enlazada y las operaciones INSERT siguientes reúsan antiguas posiciones de registro. Para reclamar espacio no usado y reducir tamaño de fichero, use el comando OPTIMIZE TABLE o la utilidad myisamchk para reorganizar las tablas. OPTIMIZE TABLE es más sencillo, pero myisamchk es más rápido.

El modificador QUICK afecta si las hojas del índice se mezclan en operaciones de borrado. DELETE QUICK es más útil para aplicaciones en que los valores del índice para registros borrados se remplazan con valores similares de registros insertados posteriormente. En este caso, los agujeros dejados por los valores borrados se reúsan.

DELETE QUICK no es útil cuando los valores borrados conducen a bloques de índices no rellenos con un rango de valores índice para el que vuelven a ocurrir nuevas inserciones. En este caso, el uso de QUICK puede conducir a un gasto de espacio que queda sin reclamar. Aquí hay un ejemplo de este escenario:

1. Cree una tabla que contenga una columna AUTO_INCREMENT indexada.
2. Inserta varios registros en la tabla. Cada inserción resulta en un valor indexado que se añade al final del índice.
3. Borra un bloque de registros al final del rango de la columna usando DELETE QUICK.

En este escenario, los bloques de índice asociados con los valores de índice borrado quedan sin rellenar pero no se mezclan con otros bloques de índice debido al uso de QUICK. Quedan sin rellenar cuando hay nuevas inserciones, ya que los nuevos registros no tienen valores índice en el rango borrado. Además, quedan sin rellenar incluso si luego usa DELETE sin QUICK, a no ser que algunos de los valores de índice borrados estén en los bloques de índice dentro o adyacentes a los bloques no rellenos. Para reclamar el espacio de índice sin usar bajo estas circunstancias use OPTIMIZE TABLE.

Si va a borrar varios registros de una tabla, puede ser más sencillo usar DELETE QUICK seguido por OPTIMIZE TABLE. Esto reconstruye el índice en lugar de realizar varias operaciones de mezcla de bloques de índice.

La opción de MySQL LIMIT row_count para DELETE le dice al servidor el máximo número de registros a borrar antes de retornar el control al cliente. Esto puede usarse para asegurar que un comando DELETE específico no tardará demasiado tiempo. Puede simplemente repetir el comando DELETE hasta que el número de registros afectados sea menor que el valor LIMIT.

Si el comando DELETE incluye una cláusula ORDER BY, los registros se borrarán en el orden especificado por la cláusula. Esto es muy útil solo en conjunción con LIMIT. Por ejemplo, el siguiente ejemplo encuentra registros coincidentes con la cláusula WHERE ordenados por timestamp_column y borra el primero (el más viejo).

```mysql
DELETE FROM somelong
WHERE user = 'jcole'
ORDER BY timestamp_column
LIMIT 1;
```

Puede especificar múltiples tablas en un comando DELETE para borrar registros de una o más tablas dependiendo de una condición particular en múltiples tablas. Sin embargo, no puede usar ORDER BY o LIMIT en un DELETE de múltiples tablas.

La parte table_references lista las tablas involucradas en el join.

Para la primera sintaxis, solo los registros coincidentes de las tablas listadas antes de la cláusula FROM se borran. Para la segunda sintaxis, solo los registros coincidentes de las tablas listadas en la cláusula FROM (antes de la cláusula USING) se borran. El efecto es que puede borrar registros para varias tablas al mismo tiempo y tienen tablas adicionales que se usan para buscar:

```mysql
DELETE t1, t2 FROM t1,t2,t3 WHERE t1.id=t2.id AND t2.id=t3.id;
o:
DELETE FROM t1,t2 USING t1,t2,t3 WHERE t1.id=t2.id AND t2.id=t3.id;
```

Estos comandos usan las tres tablas al buscar registros a borrar, pero borrar los registros coincidentes solo para las tablas t1 y t2.

Los ejemplos anteriores muestran inner joins usando el operador coma, pero comandos DELETE de varias tablas pueden usar cualquier tipo de join permitido por comandos SELECT tales como LEFT JOIN.

La sintaxis permite .* tras los nombres de tabla para compatibilidad con Access.

Si usa un comando DELETE de varias tablas incluyendo tablas InnoDB para las que hay restricciones de clave foránea, el optimizador MySQL puede procesar tablas en un orden distinto del de su relación padre/hijo. En este caso, el comando falla y se deshace. En su lugar, debe borrar de una tabla única y confiar en la capacidad ON DELETE que proporciona InnoDB para hacer que las otras tablas se modifiquen correctamente.

Nota: En MySQL 5.0, debe usar el alias (si les dio) al referirse a un nombre de tabla:

En MySQL 4.1: 

```mysql
DELETE t1 FROM test AS t1, test2 WHERE ...
```

Borrado cruzados entre bases de datos se soportan para borrados de varias tablas, pero en este caso, debe referirse a las tablas sin usar alias. Por ejemplo: 

```mysql
DELETE test1.tmp1, test2.tmp2 FROM test1.tmp1, test2.tmp2 WHERE ...
```

Actualmente, no puede borrar desde una tabla y seleccionar de la misma tabla en una subconsultas.



#### Sintaxis de DO expr [,expr]...

DO ejecuta la expresión pero no retorna ningún resultado. Esto es una abreviación de SELECT expr, ..., pero tiene la ventaja que es más rápido cuando no le importa el resultado.

DO es útil principalmente con funciones que tienen efectos colaterales, tales como RELEASE_LOCK().



#### Sintaxis de HANDLER

```mysql
HANDLER tbl_name OPEN [ [AS] alias]

HANDLER tbl_name READ index_name { = | <= | >= | < | > } (value1,value2,...)
    [ WHERE where_condition ] [LIMIT ... ]
HANDLER tbl_name READ index_name { FIRST | NEXT | PREV | LAST }
    [ WHERE where_condition ] [LIMIT ... ]
HANDLER tbl_name READ { FIRST | NEXT }
    [ WHERE where_condition ] [LIMIT ... ]

HANDLER tbl_name CLOSE
```

El comando HANDLER proporciona acceso directo a las interfaces del motor de la tabla. En MySQL 5.0, esta disponible para tablas MyISAM y InnoDB.

El comando HANDLER ... OPEN abre una tabla, haciéndola accesible mediante posteriores comandos HANDLER ... READ.

Este objeto de tabla no se comparte con otros flujos y no se cierra hasta que el flujo llama HANDLER ... CLOSE o el flujo termina. Si abre la tabla usando un alias, referencias posteriores a la tabla con otros comandos HANDLER deben usar el alias en lugar del nombre de la tabla.

La primera sintaxis HANDLER ... READ recibe un registro donde el índice especificado satisface los valores dados y la condición WHERE se cumple. Si tiene un índice de múltiples columnas, especifique los valores de la columna índice como una lista separada por comas. Los valores especificados para todas las columnas en el índice, o los valores específicos para un prefijo a la izquierda de las columnas índice. Suponga que un índice incluye tres columnas llamadas col_a, col_b y col_c, en ese orden. El comando HANDLER puede especificar valores para las tres columnas en el índice, o para las columnas en el prefijo a la izquierda. Por ejemplo: 

```mysql
HANDLER ... index_name = (col_a_val, col_b_val, col_c_val) ...
HANDLER ... index_name = (col_a_val, col_b_val) ...
HANDLER ... index_name = (col_a_val) ...
```

La segunda sintaxis HANDLER ... READ recibe un registro de la tabla en orden de registro natural que cumple la condición WHERE.

La tercera sintaxis HANDLER ... READ recibe un registro de la tabla en orden de registro natural que cumple la condición WHERE. Es más rápido que HANDLER tbl_name READ index_name cuando se desea un escaneo completo de tabla. El orden de registro natural es el orden en que se almacenan los registros en un fichero de datos de una tabla MyISAM. Este comando funciona para tablas InnoDB también, pero no hay tal concepto porque no hay un fichero de datos separado.

Sin una cláusula LIMIT, todas las formas de HANDLER ... READ reciben un único registros si una está disponible. Para retornar un número específico de registros, incluya una cláusula LIMIT. Tiene la misma sintaxis que para el comando SELECT.

HANDLER ... CLOSE cierra una tabla que se abrió con HANDLER ... OPEN.

Nota: Para emplear la interfaz HANDLER para referirse a una tabla PRIMARY KEY, use el identitifcador 'PRIMARY' entrecomillado:

```mysql
HANDLER tbl_name READ 'PRIMARY' > (...);
```

HANDLER es un comando de bajo nivel. Por ejemplo, no proporciona consistencia. Esto es, HANDLER ... OPEN no toma una muestra de la tabla, y no bloquea la tabla. Esto significa que tras un comando HANDLER ... OPEN realizado, los datos de la tabla pueden ser modificados (por este o por otro flujo) y estas modificaciones pueden aparecer solo parcialmente en escaneos HANDLER ... NEXT o HANDLER ... PREV.

Hay varias razones para usar la interfaz HANDLER en lugar de comandos SELECT normales:  

HANDLER es más rápido que SELECT:

Un objeto de tratamiento de motor de almacenamiento designado se reserva para HANDLER ... OPEN. El objeto se reusa para posteriores comandos HANDLER para esa tabla; no necesita reinicializarse para cada una.

Hay menos parseo.

No hay sobrecarga del chequeo de consultas ni optimizador.

La tabla no tiene que estar bloqueada entre peticiones.

La interfaz del handler no tiene que proporcionar una vista de los datos consistente (por ejemplo, se permiten dirty reads), así que el motor puede usar optimización que SELECT no permite.

HANDLER hace mucho más fácil portar aplicaciones que usen una interfaz tipo ISAM a MySQL.

HANDLER le permite consultar una base de datos de forma difícil o imposible de realizar con SELECT. La interfaz de HANDLER es una forma más natural de consultar los datos cuando se trabaja con aplicaciones que proporcionan una interfaz de usuario interactiva a la base de datos.



#### Sintaxis de INSERT

```mysql
INSERT [LOW_PRIORITY | DELAYED | HIGH_PRIORITY] [IGNORE]
    [INTO] tbl_name  [(col_name [, col_name] ...)]
	VALUES ({expr | DEFAULT},...),(...),...
    [ON DUPLICATE KEY UPDATE col_name=expr,...]

O:

INSERT [LOW_PRIORITY | DELAYED | HIGH_PRIORITY] [IGNORE]
    [INTO] tbl_name
    SET col_name={expr | DEFAULT },...
    [ON DUPLICATE KEY UPDATE assignment_list]

O:

INSERT [LOW_PRIORITY | HIGH_PRIORITY] [IGNORE]
    [INTO] tbl_name [(col_name [, col_name] ...)]
     SELECT ... 
     [ON DUPLICATE KEY UPDATE col_name=expr,...]
```

INSERT inserta nuevos registros en una tabla existente. Las formas INSERT ... VALUES y INSERT ... SET del comando insertan registros basados en valores explícitamente especificados. La forma INSERT ...SELECT inserta registros seleccionados de otra tabla o tablas. INSERT ... 

tbl_name es la tabla en que los registros deben insertarse. Las columnas para las que el comando proporciona valores pueden especificarse como sigue:

La lista de nombres de columnas o la cláusula SET indican las columnas explícitamente.

Si no especifica la lista de columnas para INSERT ... VALUES o INSERT ... SELECT,  los valores para cada columna en la tabla deben proporcionarse en la lista VALUES o por el SELECT. Si no sabe el orden de las columnas en la tabla, use DESCRIBE tbl_name para encontrarlo. 

Los valores de columna pueden darse de distintos modos:

Si no está ejecutando el modo estricto, cualquier columna que no tenga un valor asignado explícitamente recibe su valor por defecto (explícito o implícito). Por ejemplo, si especifica una lista de columnas que no nombra todas las columnas en la tabla, las no nombradas reciben sus valores por defecto.

Si quiere que un comando INSERT genere un error a no ser que especifique explícitamente valores para todas las columnas que no tienen un valor por defecto, debe usar modo STRICT.

Use DEFAULT para asignar a una columna explícitamente su valor por defecto. Esto hace más fácil escribir comandos INSERT que asignan valores a todas las columnas excepto unas pocas, ya que le permite evitar la escritura de una lista de valores VALUES incompleta. De otro modo, tendría que escribir la lista de los nombres de columna correspondientes a cada valor en la lista VALUES.

En MySQL 5.0, puede usar DEFAULT (col_name) como forma más general que puede usarse en expresiones para producir un valor por defecto de una columna.

Si la lista de columnas y la lista VALUES están vacías, INSERT crea un registro con cada conjunto de columnas con sus valores por defecto:

```mysql
INSERT INTO tbl_name () VALUES ();
```

En modo STRICT obtendrá un error si una columna no tiene un valor por defecto. De otro modo, MySQL usará el valor implícito para cualquier columna sin un valor explícito por defecto definido.

Puede especificar una expresión expr para proporcionar un valor de columna. Esto puede involucrar conversión de tipos si el tipo de la expresión no coincide con el tipo de la columna, y la conversión de un valor dado puede resultar en distintos valores insertados dependiendo del tipo de columna. Por ejemplo, insertar la cadena '1999.0e-2' en una columna INT, FLOAT, DECIMAL(10,6), o YEAR resulta entre los valores 1999, 19.9921, 19.992100, y 1999 insertados, respectivamente. La razón de que el valor almacenado en las columnas INT y YEAR sea 1999 es que la conversión cadena a entero consulta solo el trozo de la parte inicial de la cadena que se puede considerar como un entero válido o año. Para las columnas de coma flotante o punto fijo, la conversión cadena a coma flotante considera la cadena entera un valor válido.

Una expresión expr puede referirse a cualquier columna que se haya asignado antes en una lista de valores. Por ejemplo, puede hacer esto porque el valor para col2 se refiere a col1, que se ha asignado previamente:

```mysql
INSERT INTO tbl_name (col1, col2) VALUES (15,col1*2);
```

Pero lo siguiente no es legal, ya que el valor para col1 se refiere a col2, que se asigna tras col1:

```mysql
INSERT INTO tbl_name (col1,col2) VALUES (col2*2,15);
```

Una excepción involucra a columnas que contienen valores AUTO_INCREMENT. Como el valor AUTO_INCREMENT se genera tras otras asignaciones de valores , cualquier referencia a una columna AUTO_INCREMENT en la asignación retorna un 0.

El comando INSERT soporta los siguientes modificadores:

Si usa la palabra DELAYED, el servidor pone el registro o registros a ser insertados en un buffer, y el cliente realizando el comando INSERT DELAYED puede continuar. Si la tabla está en uso, el servidor trata los registros. Cuando la tabla se libera, el servidor comienza a insertar registros, chequeando periódicamente para ver si hay alguna petición de lectura para la tabla. Si la hay, la cola de registros retardados se suspende hasta que la tabla se libera de nuevo.

 Si usa la palabra LOW_PRIORITY, la ejecución de INSERT se retrasa hasta que no hay otros clientes leyendo de la tabla. Esto incluye a otros clientes que comiencen a leer mientras que los clientes existentes están leyendo, y mientras el comando INSERT LOW_PRIORITY está en espera. Es posible, por lo tanto, para un cliente que realice un comando INSERT LOW_PRIORITY esperar durante mucho tiempo (o incluso para siempre) en un entorno de muchas lecturas. (Esto es un contraste de INSERT DELAYED, que deja al cliente continuar). Tenga en cuenta que LOW_PRIORITY no debe usarse normalmente con tablas MyISAM y que hacerlo deshabilita insercciones concurrentes.

Si especifica HIGH_PRIORITY, deshabilita el efecto de la opción -low-priority-updates si el servidor se arrancó con esa opción. Hace que las inserciones concurrentes no se usen.

Los valores afectados por un INSERT pueden usarse la función mysql_affected_rows() de la API de C.

Si usa la palabra IGNORE en un comando INSERT, los errores que ocurren mientras se ejecuta el comando se tratan como advertencias. Por ejemplo, sin IGNORE, un registro que duplique un índice UNIQUE existente o valor PRIMARY KEY en la tabla hace que un error de clave duplicada en el comando se aborte. Con IGNORE, el registro todavía no se inserta, pero no se muestra el error. Las conversiones de datos dispararían errores y abortarían el comando si no se especifica IGNORE. Con IGNORE, los valores invalidados se ajustan al valor más cercano y se insertan; las advertencias se producen pero el comando no se aborta. Puede determinar con la función mysql_info() de la API de C cuántos registros se insertan realmente en la tabla.

Si especifica ON DUPLICATE KEY UPDATE, y se inserta un registro que duplicaría un valor en un índice UNIQUE o PRIMARY KEY, se realiza un UPDATE del antiguo registro. Por ejemplo, si la columna a se declara como UNIQUE y contiene el valor 1, los siguientes dos comandos tienen efectos idénticos:

```mysql
INSERT INTO table (a,b,c) VALUES (1,2,3) ON DUPLICATE KEY UPDATE c=c+1;
UPDATE table SET c=c+1 WHERE a=1;
```

 El valor de registros afectados es 1 si el registro se inserta como un nuevo registro y 2 si un valor existente se actualiza.

Nota: Si la columna b es única, el INSERT sería equivalente a este comando UPDATE:

```mysql
UPDATE table SET c=c+1 WHERE a=1 OR b=2 LIMIT 1;
```

Si a=1 OR b=2 se cumple para varios registros, solo un registro se actualiza. En general debería intentar evitar usar una cláusula ON DUPLICATE KEY en tablas con claves únicas múltiples.

MySQL 5.0 permite el uso de la función VALUES(col_name) en la cláusula UPDATE que se refiere a los valores de columna de la porción INSERT ... UPDATE. En otras palabras, VALUES(col_name) en la cláusula UPDATE se refiere al valor de col_name que se insertarían, no ocurre conflicto de clave duplicada. Esta función es especialmente útil en inserciones de múltiples registros. La función VALUES() tiene sentido solo en comandos INSERT ... UPDATE y retorna NULL de otro modo.

Ejemplo:

```mysql
INSERT INTO table(a,b,c) VALUES (1,2,3),(4,5,6) ON DUPLICATE KEY UPDATE c=VALUES(a)+VALUES(b);
```

Este comando es idéntico a los siguientes dos comandos:

```mysql
INSERT INTO table(a,b,c) VALUES (1,2,3) ON DUPLICATE KEY UPDATE c=3;
INSERT INTO table(a,b,c) VALUES (4,5,6) ON DUPLICATE KEY UPDATE c=9;
```

Cuando usa ON DUPLICATE KEY UPDATE, la opción DELAYED se ignora.

Puede encontrar el valor usado para una columna AUTO_INCREMENT usando la función SQL LAST_INSERT_ID(). Desde la API C, use la función mysql_insert_id(). Sin embargo, debe tener en cuenta que las dos funciones no siempre se comportan idénticamente.

Si usa un comando INSERT ... VALUES con listas de múltiples valores o INSERT...SELECT, el comando retorna una cadena de información en este formato:

```
Records: 100 Duplicates:0 Warnings:0
```

Records indica el número de registros procesados por el comando. (Este no es necesariamente el número de registros realmente insertados, ya que Duplicates puede ser distinto a cero). 

Duplicates indica el número de registros que no pueden insertarse ya que duplicarían algunos valores de índice únicos existentes.

Warnings indicaba el número de intentos para insertar valores de columna que fueron problemáticos por algo.

 Las advertencias pueden ocurrir bajo cualquiera de las siguientes condiciones:

Insertar NULL en una columna que se ha declarado NOT NULL. Para comandos INSERT de múltiples columnas o comandos INSERT INTO ... SELECT, la columna se asigna con el valor por defecto para el tipo de datos de la columna. Este es 0 para tipos numéricos, la cadena vacía ('') para tipos de cadenas, y el valor "cero" para tipos de fecha y hora. Los comandos INSERT INTO ... SELECT se tratan del mismo modo que inserciones de múltiples registros porque el servidor no examina el resultado del SELECT para ver si retorna o no un único registro. (para un único registro INSERT, no hay ninguna advertencia cuando NULL se inserta en una columna NOT NULL. En lugar de eso, el comando falla con un error). 

Poner en una columna numérica un valor fuera del rango de la columna. El valor se redondea al punto final del rango más cercano.

Asigne un valor tal como '10.34' a una columna numérica. El texto final se elimina y la parte numérica se inserta. Si el valor de cadena no tiene parte inicial numérica, la columna se pone a 0.

Insertar una cadena en una columna de cadena (CHAR, VARCHAR, TEXT, o BLOB ) que excede la máxima longitud de columna. El valor se trunca a la máxima longitud de la columna.

Insertar un valor en una columna de fecha u hora que es ilegal para el tipo de la columna. La columna se asigna con el valor cero apropiado para el tipo.

Si usa la APi de C, la cadena de información puede obtenerse invocando la función mysql_info()



#### Sintaxis de INSERT ... SELECT

```mysql
INSERT [LOW_PRIORITY | HIGH_PRIORITY] [IGNORE]
    [INTO] tbl_name [(col_name [, col_name] ...)]
     SELECT ... 
     [ON DUPLICATE KEY UPDATE col_name=expr,...]
```

Con INSERT ...SELECT, puede insertar rápidamente varios registros en una tabla desde una o varias tablas.

Por ejemplo:

```mysql
INSERT INTO tbl_temp2(fld_id) 
SELECT tbl_temp1.fld_order_id
FROM tbl_temp1 WHERE tbl_temp1.fld_order_id > 100;
```

La siguiente condición sirve para un comando INSERT ... SELECT:

En MySQL 5.0, especifique IGNORE explícitamente para ignorar registros que causarían violaciones de clave duplicada.

No use DELAYED con INSERT ... SELECT

En MySQL 5.0, la tabla objetivo del comando INSERT puede aparecer en la cláusula FROM de la parte SELECT de la consulta. (Esto no era posible en algunas versiones antiguas de MySQL).

Las columnas AUTO_INCREMENT funcionan normalmente.

Para asegurar que el log binario puede usarse para recrear las tablas originales, MySQL no permite inserciones concurrentes durante INSERT ... SELECT.

Actualmente, no puede insertar en una tabla y seleccionar de la misma tabla en una subconsulta.

En las partes de valores de ON DUPLICATE KEY UPDATE puede referirse a una columna en otras tablas, mientras no use GROUP BY en las parte SELECT. Un efecto lateral es que debe calificar los nombres de columna no únicos en la parte de valores.

Puede usar REPLACE en lugar de INSERT para sobrescribir registros antiguos REPLACE es la contraparte de INSERT IGNORE en el tratamiento de nuevos registros que contienen valores de clave única que duplican registros antiguos: Los nuevos registros se usan para reemplazar los antiguos registros en lugar de descartarlos.



#### Sintaxis de LOAD DATA INFILE

```mysql
LOAD DATA [LOW_PRIORITY | CONCURRENT] [LOCAL] INFILE 'file_name.txt'
    [REPLACE | IGNORE]
    INTO TABLE tbl_name
    [{FIELDS | COLUMNS}
        [TERMINATED BY 'string']
        [[OPTIONALLY] ENCLOSED BY 'char']
        [ESCAPED BY 'char']
    ]
    [LINES
        [STARTING BY 'string']
        [TERMINATED BY 'string']
    ]
    [IGNORE number {LINES | ROWS}]
    [(col_name_or_user_var[, col_name_or_user_var] ...)]
    [SET col_name=expr,...]
```

El comando LOAD DATA INFILE lee registros desde un fichero de texto a una tabla a muy alta velocidad. El nombre de fichero debe darse como una cadena literal.

Para más información acerca de la eficiencia de INSERT contra LOAD DATA INFILE y acelerar LOAD DATA INFILE.

En MySQL 5.0, el conjunto de caracteres indicado por la variable de sistema character_set_database se usa para interpretar la información en el fichero. SET NAMES y el valor de character_set_client no afecta a la interpretación de la entrada.

Puede cargar ficheros de datos usando la utilizad mysqlimport; opera enviando un comando LOAD DATA INFILE al servidor. La opción -local hace que mysqlimport lea ficheros de datos desde el equipo cliente. Puede especificar la opción -compress para obtener un mejor rendimiento en redes lentas si el cliente y el servidor soportan el protocolo comprimido.

Si usa LOW_PRIORITY, la ejecución del comando LOAD DATE se retarda hasta que no haya más clientes leyendo de la tabla.

Si especifica CONCURRENT con una tabla MyISAM que satisfaga la condición para inserciones concurrentes (esto es, no contiene bloques libres en medio), entonces otros flujos pueden recibir datos desde la tabla mientras se ejecuta LOAD DATA. Usar esta opción afecta al rendimiento de LOAD DATA ligeramente, incluso si no hay otro flujo usando la tabla al mismo tiempo.

Si se especifica LOCAL, se interpreta respecto al cliente final de la conexión:

Si especificamos LOCAL, el programa cliente lee el fichero en el equipo cliente y lo envía al servidor. Podemos indicar la ruta completa del fichero para especificar su localización exacta. Si indicamos la ruta relativa, el fichero se interpreta relativo al directorio en el que el cliente se inició.

Si no se especifica LOCAL, el fichero tiene que estar en el equipo servidor y el servidor lo lee directamente.

Al localizar ficheros en el equipo servidor, el servidor usa las siguientes reglas:

Si se da una ruta absoluta, el servidor usa la ruta como tal.

Si se da una ruta relativa con uno o más componentes, el servidor busca este fichero relativo al directorio de datos del servidor.

Si se da un nombre de fichero sin ninguna ruta, el servidor busca el fichero en el directorio de base de datos de la base de datos por defecto.

Tenga en cuenta que estas reglas significan que un fichero llamado ./myfile.txt se lee del directorio de datos del servidor, mientras que el mismo fichero llamado como myfile.txt se lee desde el directorio de base de datos por defecto. Por ejemplo el siguiente comando LOAD DATA lee el fichero actual, incluso si el comando carga explícitamente el fichero en una tabla en la base de datos db2:

```mysql
USE db1;
LOAD DATE INFILE 'data.txt' INTO TABLE db2.my_table;
```

Tenga en cuenta que las rutas de windows se especifican usando barras en lugar de antibarras. Si usa barras, debe doblarlas.

Por razones de seguridad, al leer ficheros de texto localizados en el servidor, los ficheros deben residir en el directorio de la base de datos o ser leíbles por todo el mundo. Además, para usar LOAD DATA INFILE en ficheros del servidor, debe tener el permiso FILE.

Usar LOCAL es un poco más lento que dejar al servidor acceder al fichero directamente, por que el contenido del fichero debe enviarse por la conexión desde el cliente al servidor. Por otra parte, no necesita el permiso FILE para cargar ficheros locales.

En MySQL 5.0 LOCAL funciona solo si su servidor y su cliente lo tienen activado. Por ejemplo, si mysqld se arranca con --local-infile=0, entonces LOCAL no funciona.

Si necesita LOAD DATA para leer desde un pipe, puede usar la siguiente técnica (aquí cargamos el listado del directorio / en una tabla):

 

```bash
mkfifo /mysql/db/x/x
chmod 666 /mysql/db/x/x
find / -ls > /mysql/db/x/x
mysql -e "LOAD DATA INFILE 'x' INTO TABLE x"x
```

Las palabras REPLACE y IGNORE controlan el tratamiento de registros de entrada que duplican registros existentes en claves únicas.

Si especifica REPLACE, los registros de entrada reemplazan registros existentes (en otras palabras, los registros que tienen el mismo valor para una clave primaria o única que un registro existente).

Si especifica IGNORE, los registros de entrada que dupliquen un registro existente en una clave única se ignoran. Si no especifica ninguna opción, el comportamiento depende se si la palabra LOCAL se ha especificado o no. Sin LOCAL, ocurre un error cuando se encuentra un valor de clave duplicado, y el resto del fichero se ignora. Con LOCAL, el comportamiento por defecto es el mismo que si se especifica IGNORE, esto es porque el servidor no tiene forma de parar la transmisión del fichero en medio de la operación.

Si quiere ignorar restricciones de clave foránea durante la operación de carga, puede realizar un comando SET FOREIGN_KEY_CHECKS = 0 antes de ejecutar LOAD DATA.

Si usa LOAD DATA INFILE en una tabla vacía MyISAM, todos los índices no únicos se crean en batch separados (como para REPAIR TABLE). Esto hace LOAD DATA INFILE mucho más rápido cuando tiene varios índices. Normalmente esto es muy rápido, pero en algunos casos extremos, puede crear los índices incluso más rápido desactivándolos con ALTER TABLE ... DISABLE KEYS antes de cargar el fichero en la tabla y usar ALTER TABLE ... ENABLE KEYS para recrear los índices tras cargar el fichero.

LOAD DATA INFILE es el complemento de SELECT ... INTO OUTFILE. Para escribir datos de una tabla en un fichero use SELECT ... INTO OUTFILE. Para leer el fichero de nuevo en una tabla, use LOAD DATE INFILE. La sintaxis de las cláusulas FIELDS y LINES es la misma para ambos. Ambas son opcionales, pero FIELDS debe preceder a LINES si se especifican ambas.

Si especifica una cláusula FIELDS, cada una de sus subcláusulas (TERMINATED BY, [OPTIONALLY] ENCLOSED BY y ESCAPED BY) también es opcional, excepto que debe especificar al menos una de ellas.

Si no especifica una cláusula FIELDS, por defecto es como si hubiera escrito esto:

```mysql
FIELDS TERMINATED BY '\t' ENCLOSED BY ''ESCAPED BY \\'';
```

Si no especifica una cláusula LINES, por defecto es como si hubiera escrito esto:

```mysql
LINES TERMINATED BY '\n' STARTING BY '';
```

En otras palabras, por defecto LOAD DATA INFILE actúa como sigue al leer la entrada:

- Busca delimitadores de línea como nuevas líneas.
- No ignora ningún prefijo de línea.
- Rompe las líneas en campos con los tabuladores.
- No espera campos entrecomillados dentro de ningún carácter delimitador.
- Interpreta las ocurrencias de tabuladores, nuevas líneas o '\\' precedidas por '\\' como caracteres literales que son parte de valores de campos.
- Por defecto SELECT ... INTO OUTFILE actúa como sigue al escribir la salida: 
- Escribe tabuladores entre campos.
- Usa '\\' para escapar las instancias de tabuladores, nuevas líneas o '\\' que ocurren entre valores de campos.
- Escribe nuevas líneas al final de las líneas.



Tenga en cuenta que para escribir FIELDS ESCAPED BY '\ \\', debe escribir dos antibarras para que se interprete como una única antibarra.

Nota: Si ha generado el fichero de texto en un sistema Windows, puede tener que usar LINES TERMINATED BY '\\r\n' para leer correctamente el fichero, ya que los programas de Windows típicamente usan dos caracteres como terminadores de línea. Algunos programas como WordPad, pueden usar \r como terminador de línea al escribir ficheros. Para leer tales ficheros, use LINES TERMINATED BY '\\r'.

Si todas las líneas que quiere leer tienen un prefijo común que quiere ignorar, puede usar LINES STARTING BY 'prefix_string' para ignorar el prefijo (y cualquier cosa antes del mismo). Si una línea no incluye el prefijo, la línea entera se ignora. Nota prefix_string puede ocurrir en medio de una línea.

Ejemplo:

```mysql
LOAD DATA INFILE '/tmp/test.txt'
INTO TABLE test LINES STARTING BY "xxx";
```

Con esto puede leer en un fichero que contenga algo como:

```mysql
xxx "row",1 something xxx "row",2
```

Y obtener los datos ("row",1) y ("row",2).

La opción IGNORE number LINES puede usarse para ignorar líneas al inicio del fichero. Por ejemplo, puede usar IGNORE 1 LINES para ignorar una cabecera inicial que contenga los nombres de las columnas:

```mysql
LOAD DATA INFILE '/tmp/test.txt' 
INTO TABLE test IGNORE 1 LINES;
```

Cuando usa SELECT ... INTO OUTFILE junto con LOAD DATA INFILE para escribir datos desde una base de datos en un fichero y luego lee datos del fichero de nuevo en la base de datos, las opciones de tratamiento de fichero y de línea para ambos comando deben coincidir. De otro modo, LOAD DATA INFILE no interpreta los contenidos del fichero correctamente. Suponga que usa SELECT ... INTO OUTFILE para escribir un fichero con campos delimitados por comas:

```mysql
SELECT INTO OUTFILE 'data.txt' FIELDS TERMINATED BY FROM table2;
```

Para leer el fichero delimitado por comas, el comando correcto sería:

```mysql
LOAD DATA INFILE 'data.txt' INTO TABLE table2
FIELDS TERMINATED BY ',';
```

Si en lugar de esto trata de leer en el fichero con el comando mostrado aquí, no funcionaría porque le dice a LOAD DATA INFILE que busque tabuladores entre campos:

```mysql
LOAD DATA INFILE 'data.txt' INTO TABLE table2 FIELDS TERMINATED BY '\t';
```

El resultado esperado es que cada línea de entrada se interprete como un único campo.

LOAD DATA INFILE puede usarse para leer ficheros obtenidos de fuentes externas. Por ejemplo, un fichero en formato dBASE tiene campos separados por comas y entrecomillados por comillas dobles. Si las líneas en el fichero se terminan con nuevas líneas, el comando mostrado aquí ilustra las opciones de campo y línea que debería usar para cargar el fichero:

```mysql
LOAD DATA INFILE 'data.txt' INTO TABLE tbl_name
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\\n';
```

Cualquiera de las opciones de tratamiento de campo o línea pueden especificarse como una cadena vacía (''). Si no está vacía, los valores FIELDS [OPTIONALLY] ENCLOSED BY y FIELDS ESCAPED BY deben ser un único carácter. Los valores FIELDS TERMINATED BY, LINES STARTING BY, y LINES TERMINATED BY pueden tener más de un carácter. Por ejemplo, para escribir líneas terminadas por parejas de retorno de carro y nueva línea, o para leer un fichero conteniendo tales líneas, especifique una cláusula LINES TERMINATED BY '\\r\n'.

Para leer un fichero que contenga bromas separadas por líneas consistentes de %%, pueden hacer lo siguiente

```mysql
CREATE TABLE jokes
(a INT NOT NULL AUTO INCREMENT PRIMARY KEY,
joke TEXT NOT NULL);
LOAD DATA INFILE '/tmp/jokes.txt' INTO TABLE jokes
FIELDS TERMINATED BY ''
LINES TERMINATED BY '\n%%\n' (joke);
```

FIELDS [OPTIONALLY] ENCLOSED BY controla el entrecomillado de los campos. Para la salida (SELECT ... INTO OUTFILE), si omite la palabra OPTIONALLY, todos los campos se delimitan por el carácter ENCLOSED BY. Un ejemplo de tal salida (usando coma como el delimitador de campo) se muestra aquí:

```mysql
"1","a string","100.20"
"2","a string containing a, comma","102.20"
"3","a string containing a\ quote","102.20"
"4","a string containing a\,quote and comma","102.20"
```

Si especifica OPTIONALLY, el carácter ENCLOSED BY se usa solo para delimitar valores en columnas que tienen datos de cadenas (tales como CHAR, BINARY, TEXT, o ENUM);

```mysql
1,"a string",100.20
2,"a string containing a, comma",102.20
3,"a string containing a\ quote",102.20
4,"a string containing a\,quote and comma",102.20
```

Tenga en cuenta que las ocurrencias del carácter ENCLOSED BY dentro de un campo se escapan mediante un prefijo del carácter ESCAPED BY. También tenga en cuenta que si especifica un valore ESCAPED BY vacío, es posible generar salida que no puede leerse correctamente con LOAD DATA INFILE. Por ejemplo, la salida precedente tendría la siguiente apariencia si el carácter de escape estuviera vacío. Observe que el segundo campo en la cuarta línea contiene una coma siguiendo la delimitación, que (erróneamente) parece que termine el campo:

```mysql
1,"a string",100.20
2,"a string containing a, comma",102.20
3,"a string containing a" quote",102.20
4,"a string containing a",quote and comma",102.20
```

Para entrada, el carácter ENCLOSED BY, si está presente, se elimina del final de los valores de campos. (Esto es cierto se especifique OPTIONALLY o no; OPTIONALLY no tiene efecto en la interpretación de la entrada). Las ocurrencias del carácter ENCLOSED BY se interpretan como parte del campo actual.

Si el campo comienza con el carácter ENCLOSED BY, las instancias del mismo se reorganizan como terminadores del campo solo si van seguidas por el campo o la secuencia TERMINATED BY. Para evitar ambigüedad, las ocurrencias del carácter ENCLOSED BY dentro de un campo se pueden doblar y se interpretan como una única instancia del carácter. Por ejemplo, si se especifica ENCLOSED BY, la delimitación se trata como se muestra aquí:

```mysql
"The ""BIG""boss"-> The "BIG"boss
The "BIG"boss-> The "BIG"boss
The ""BIG""boss-> The ""BIG"" boss
```

FIELDS ESCAPED BY controla cómo escribir o leer caracteres especiales. Si el carácter FIELDS ESCAPED BY no está vacío, se usa como prefijo para los siguientes caracteres de salida:

```
- El carácter FIELDS ESCAPED BY
- El carácter FIELDS[OPTIONALLY]ENCLOSED BY
- El primer carácter de los valores FIELDS TERMINATED BY y LINES TERMINATED BY
- ASCII 0 (lo que realmente se escribe a continuación del carácter de escape es '0' en ASCCI, no un byte con valor cero)
```

Si el carácter FIELDS ESCAPED BY está vacío, no se escapan caracteres y NULL se muestra como NULL, no \\N. Probablemente no es una buena idea especificar un carácter de escape vacío, particularmente si los valores de campos en sus datos contienen cualquiera de los caracteres en la lista dada.

Para entrada, si el carácter FIELDS ESCAPED BY no está vacío, las ocurrencias del mismo se eliminan y el siguiente carácter se toma literalmente como parte del campo. Las excepciones son un '0' escapado o 'N' (por ejemplo, \0 o \N si el carácter de escape es '\\'). Estas secuencias se interpretan como ASCII NULL (un byte con valor cero) y NULL. Las reglas para tratamiento de NULL se describen posteriormente.

En ciertos casos, las opciones de tratamiento de campos y línea interactúan:

- Si LINES TERMINATED BY es una cadena vacío y FIELDS TERMINATED BY no está vacío, las líneas se terminan con FIELDS TERMINATED BY.
- Si los valores FIELDS TERMINATED BY y FIELDS ENCLOSED BY están vacíos (''), se usa un formato fijo de registro (no delimitado). Con este formato, no se usan delimitadores entre campos (pero puede tener un terminados de línea). En su lugar, los valores de columna se escriben y leen usando los anchos de muestra de las columnas. Por ejemplo, si una columna se declara como INT(7), los valores para la columna se escriben usando campos de siete caracteres. En la entrada, los valores para la columna se obtienen leyendo siete caracteres.

LINES TERMINATED BY se usa para separar líneas. Si una línea no contiene todos los campos, el resto de columnas se asignan con sus valores por defecto. Si no tienen un terminador de línea, debe asignarlo a ''. En este caso, el fichero de texto debe contener todos los campos para cada registro.

El formato fijo de registro también afecta al tratamiento de valores NULL, como se describe posteriormente. Tenga en cuenta que el formato de tamaño fijo no funciona si está usando un conjunto de caracteres multi byte.

El tratamiento de valores NULL varia en función de las opciones FIELDS y LINES en uso:

- Para los valores FIELDS y LINES por defecto, NULL se escribe como \N para la salida, y \N para la entrada se lee como NULL (considerando que el carácter ESCAPED BY es '\\').

- Si FIELDS ENCLOSED BY no está vacío, un campo que contenga el literal NULL como valor se lee como el valor NULL. Esto difiere de la palabra NULL delimitada por caracteres FIELDS ENCLOSED BY, que se lee como la cadena 'NULL'.

- Si FIELDS ESCAPED BY está vacío, NULL se escribe como la palabra NULL.

- Con formato fijo de registro (lo que ocurre cuando FIELDS TERMINED BY y FIELDS ENCLOSED BY están vacíos), NULL se escribe como una cadena vacía. Tenga en cuenta que esto hace que ambos valores NULL y cadenas vacías en la tabla sean indistinguibles cuando se escriben en el fichero ya que ambos se escriben como cadenas vacías. Si necesita distinguir entre ambos al leer del fichero, no debe usar el formato de registro fijo.

  

Algunos casos no son soportados por LOAD DATA INFILE:

- Registros de tamaño fijo (FIELDS TERMINATED BY y FIELDS ENCLOSED BY ambos vacíos).

- Si se especifica un separador que es igual o prefijo de otro, LOAD DATA INFILE no será capaz de interpretar la entrada correctamente. Por ejemplo, la siguiente cláusula FIELDS causaría problemas:

  ```mysql
  FIELDS TERMINED BY '"' ENCLOSED BY '"'
  ```

Si FIELDS ESCAPED BY está vacío, un valor que contenga una ocurrencia de FIELDS ENCLOSED BY o LINES TERMINATED BY seguido por el valor FIELDS TERMINATED BY causa que LOAD DATA INFILE pare de leer un campo o línea demasiado rápido. Esto ocurre porque LOAD DATA INFILE no puede determinar apropiadamente dónde acaba el campo o línea.

El siguiente ejemplo carga todas las columnas de  la tabla persondata:

```mysql
LOAD DATE INFILE 'persondata.txt' INTO TABLE persondata;
```

Por defecto, cuando no se proporciona una lista al final de un comando LOAD DATA INFILE, las líneas de entrada se espera que contengan un campo para cada columna de la tabla. Si quiere cargar sólo algunas columnas de una tabla especifique una lista de columnas.

```mysql
LOAD DATA INFILE 'persondata.txt' INTO TABLE persondata(col1,col2,...);
```

Debe especificar una lista de columnas si el orden de los campos del fichero de entrada difiere del orden de las columnas en la tabla. De otro modo, MySQL no puede decir cómo hacer coincidir los campos de entrada con las columnas de la tabla.

Antes de MySQL 5.0.3, la lista de columnas debe contener solo nombres de columnas en la tabla que se carga, y la cláusula SET no se soporta. Desde MySQL 5.0.3, la lista de columnas puede contener nombres de columna o variables y cláusula SET se soporta. Esto le permite asignar valores de entrada a variables de usuario, y luego realizar transformaciones con estos valores antes de asignar los resultados a las columnas.

Las variables de usuario en la cláusula SET puede usarse de distintos modos. El siguiente ejemplo usa la primera columna en el fichero de datos directamente para el valor de tl.columnl, y asigna la segunda columna a una variable de usuario que está sujeta a una operación de división antes de ser usada por el valor de t2.column2:

```mysql
LOAD DATA INFILE 'file.txt' INTO TABLE t1 (column,@var1)
SET column2=@var1/100;
```

La cláusula SET puede usarse para proporcionar valores no derivados del fichero de entrada. Los siguientes comandos actualizan column3 con la fecha y hora actuales:

```mysql
LOAD DATA INFILE 'file.txt' INTO TABLE t1 (column1,column2)
SET column3=CURRENT_TIMESTAMP;
```

También puede descartar un valor de entrada asignándolo a una variable de usuario y no asignando la variable a una columna de tabla:

```mysql
LOAD DATA INFILE 'file.txt' INTO TABLE t1 (column1,@dummy, column2,@dummy,column3);
```

El uso de la lista de columnas/variables y la cláusula SET está sujeto a las siguientes restricciones:

Las asignaciones en la cláusula SET deben tener solo nombres de columna en el lado izquierdo del operador de asignación.

Puede usar subconsultas en la parte derecha de la asignación de SET. Una subconsulta que retorne un valor a ser asignado a otra columna solo puede ser una subconsulta escalar. Además, no puede usar una subconsulta para seleccionar desde la tabla que se está cargando.

Las líneas ignoradas por una cláusula IGNORE no se procesan por parte de la lista de columnas/variables o por la cláusula SET,

Las variables de usuario no pueden usarse al cargar datos con formato de registro ya que las variables de usuario no tienen un ancho de muestra.

Al procesar una línea de entrada, LOAD DATA la divide en campos y usa los valores según la lista columnas7variables y la cláusula SET, si están presentes. A continuación se inserta el registro resultante en la tabla. Si hay disparadores BEFORE INSERT o AFTER INSERT para la tabla, se activan antes o después de insertar el registro, respectivamente.

Si una línea de entrada tiene demasiados campos, los campos extra se ignoran y el número de advertencias se incrementa.

Si una línea de entrada no tiene suficientes campos, las columnas de la tabla que no tienen entrada adquieren su valor por defecto.

Un valor de campo vacío se interpreta de forma distinta que si el valor no está presente:

- Para tipos de cadenas, la columna adquiere la cadena vacía.
- Para tipos numéricos, la columna recibe el valor 0.
- Para tipos de fecha y hora, la columna obtiene el valor "cero" apropiado para el tipo.

Estos son los mismos valores que resultan si asigna una cadena vacía explícitamente a un tipo de cadena de caracteres, numérico o de fecha u hora en un comando INSERT o UPDATE statement.

Las columnas TIMESTAMP obtienen la fecha y hora actuales solo si hay un valor NULL para la columna (esto es, \N), o (para la primera columna TIMESTAMP únicamente) si se omite TIMESTAMP de la lista de campos cuando se especifica una. 

LOAD DATA INFILE trata todas las entradas como cadenas, así que no puede usar valores numéricos para las columnas ENUM o SET del modo en que puede hacerlo con comandos INSERT. Todos los valores ENUM y SET deben especificarse como cadenas.

Cuando acaba el comando LOAD DATA INFILE, retorna una cadena de información con el siguiente formato:

```mysql
Records: 1 Deleted: 0 Skipped:0 Warning:0
```

Las advertencias se producen bajo las mismas circunstancias que cuando los valores se insertan mediante el comando INSERT, excepto que LOAD DATA INFILE también genera advertencias cuando hay muy pocos o demasiados campos en el registro de entrada. Las advertencias no se almacenan en ningún lugar; el número de las mismas puede usarse solo como indicación de si todo ha ido bien.

En MySQL 5.0, puede usar SHOW WARNINGS para obtener una lista de las primeras max_error_count advertencias como información acerca de qué ha fallado.



#### Sintaxis de REPLACE.

```mysql
REPLACE [LOW_PRIORITY | DELAYED]
    [INTO] tbl_name [(col_name [, col_name] ...)]
    VALUES ({expr | DEFAULT},...),(...),...

O: 

REPLACE [LOW_PRIORITY | DELAYED]
    [INTO] tbl_name
    SET col_name={expr|DEFAULT},...
    
O:

REPLACE [LOW_PRIORITY | DELAYED]
    [INTO] tbl_name [(col_name [, col_name] ...)]
    SELECT ... | TABLE table_name
```

REPLACE funciona exactamente como INSERT, excepto que si un valor de la tabla tiene el mismo valor que un nuevo registro para un índice PRIMARY KEY o UNIQUE, el antiguo registro se borra antes de insertar el nuevo.

Tenga en cuenta que a menos que la tabla tenga un índice PRIMARY KEY, o UNIQUE usar un comando REPLACE no tiene sentido. Es equivalente a INSERT, ya que no hay índice para determinar si un nuevo registro duplica otro.

Los valores para todas las columnas se toman de los valores especificados en el comando REPLACE. Cualquier columna no presente adquiere su valor por defecto, como ocurre con INSERT. No puede referirse a valores del registro actual y usarlos en el nuevo registro. Si usa un comando tal como SET col_name = col_name +1, la referencia al nombre de columna en la parte derecha se trata como DEFAULT(col_name), así que es equivalente a SET col_name=DEFAULT(col_name)+1.

Para ser capaz de usar REPLACE, debe tener los permisos INSERT y DELETE para la tabla.

El comando REPLACE retorna un contador con el número de registros afectados. Esta es la suma de registros borrados e insertados. Si el contador es 1 para REPLACE de un único registro, se inserta un registro y no se borra ninguno. Si el contador es mayor que 1, uno o más registros se borraron antes de insertar el nuevo. Es posible para un único registro reemplazar más de un registro antiguo si la tabla contiene múltiples índices únicos y el nuevo registro duplica valores para distintos registros antiguos en distintos índices únicos.

El contador de registros afectados hace fácil determinar si REPLACE solo añadió un registro o si también reemplazo alguno: Compruebe si el contador es 1 (añadido) o mayor (reemplazados).

Si usa la API de c, el contador de registros afectados puede obtenerse usando la función mysql_affected_rows(). Actualmente, no puede reemplazar en una tabla y seleccionar de la misma en una subconsulta.

Aquí sigue en más detalle el algoritmo usado (también se usa con LOAD DATA...REPLACE):

1. Intenta insertar el nuevo registro en la tabla.

2. Mientras falle la inserción debido a error de clave duplicada por clave única o primaria:

   1. Borra de la tabla el registro conflictivo que tiene el valor de clave duplicada.
   2. Intenta insertar de nuevo el registro en la tabla.

   

   

#### Sintaxis de SELECT

```mysql
SELECT
    [ALL | DISTINCT | DISTINCTROW ]
    [HIGH_PRIORITY]
    [STRAIGHT_JOIN]
    [SQL_SMALL_RESULT] [SQL_BIG_RESULT] [SQL_BUFFER_RESULT]
    [SQL_NO_CACHE] [SQL_CALC_FOUND_ROWS] select_expr, ...    
	[INTO OUTFILE 'file_name' export_options
    | INTO DUMPFILE 'file_name']
    [FROM table_references
    [WHERE where_condition]
    [GROUP BY {col_name | expr | position}, ... [WITH ROLLUP]]
    [ASC | DESC], ... [WITH ROLLUP]]
    [HAVING where_condition]
    [ORDER BY {col_name | expr | position}
      [ASC | DESC], ...]
    [LIMIT {[offset,] row_count | row_count OFFSET offset}]
	[PROCEDURE procedure_name(argument_list)]
    [FOR {UPDATE | LOCK IN SHARE MODE}
```

SELECT se usa para recibir registros seleccionados desde una o más tablas. MySQL 5.0 incluye soporte para comandos UNION y subconsultas.

- Cada select_expr indicaba una columna que quiere recibir.
- table_references indicaba la tabla o tablas desde la que recibir registros.
- where_definition consiste en la palabra clave WHERE seguida por una expresión que indica la condición o condiciones que deben satisfacer los registros para ser seleccionados.

SELECT también puede usarse para recuperar registros conmutados sin referencia a ninguna tabla.

Por ejemplo:

```mysql
SELECT 1+1;
->2
```

Todas las cláusulas usadas deben darse exactamente en el orden mostrados en la descripción de la sintaxis. Por ejemplo, una cláusula HAVING debe ir tras cualquier cláusula GROUP BY y antes de cualquier cláusula ORDER BY.

- Una select_expr puede tener un alias usando AS alias_name. El alias se usa como el nombre  de columna de la expresión y puede usarse en cláusulas GROUP BY, ORDER BY o HAVING. Por ejemplo:

```mysql
SELECT CONCAT(las_name,',',first_name) AS full_name
FROM mytable ORDER BY full_name;
```

La palabra clave AS es opcional cuando se usa un alias para select_expr. El ejemplo precedente podría haberse escrito como:

```mysql
SELECT CONCAT(las_name,',',first_name) full_name
FROM mytable ORDER BY full_name;
```

Como AS es opcional, puede ocurrir un sutil problema si olvida la coma entre dos expresiones select_expr: MySQL interpreta el segundo como el nombre del alias. Por ejemplo, en el siguiente comando columnb se trata como un nombre de alias:

```mysql
SELECT colmuna, columnb FROM mytable:
```

Por esta razón, es buena práctica poner los alias de columna usando AS.

- No se permite usar alias de columna en una cláusula WHERE, ya que el valor de columna puede no estar determinado cuando se ejecuta la cláusula WHERE.
- La cláusula FROM table_references indica la tabla desde la que recibir registros. Si nombra más de una tabla, está realizando un join. Para cada tabla especificada, puede opcionalmente especificar un alias.

```mysql
tbl_name [[AS]alias]
[[USE INDEX(key_list)] 
|[IGNORE INDEX(key_list)]
|[FORCE INDEX(key_list)]]
```

El uso de USE INDEX, IGNORE INDEX, FORCE INDEX para dar al optimizador pistas acerca de cómo escoger los índices.

En MySQL 5.0, puede usar SET max_seeks_for_key = value como alternativa para forzar a MySQL a que realice escaneos de claves en lugar de escaneos de tabla.

- Puede referirse a una tabla dentro de la base de datos actual como tbl_name (dentro de la base de datos actual) o como db_name.tbl_name para referirse a una base de datos explícitamente. Puede referirse a una columna como col_name, tbl_name.col_name o db_name.tbl_name.col_name. No necesita especificar un prefijo tbl_name o db_name.tbl_name para una referencia de columna a no ser que la referencia fuese ambigua.

- En MySQL 5.0, puede especificar DUAL como nombre de tabla falso en asignaciones donde no se referencian tablas:

  ```mysql
  SELECT 1+1 FROM DUAL;
  2
  ```

  DUAL es una característica puramente de compatibilidad. Otros servidores requieren esta sintaxis.

- Una referencia de tabla puede tener un aliass usando tbl_name AS alias_name o tbl_name alias_name:

  ```mysql
  SELECT t1.name, t2.salary FROM employee AS t1, info AS t2 -> WHERE t1.name = t2.name;
  SELECT t1.name, t2.salary FROM employee t1, info t2 -> 
  WHERE t1.name = t2.name;
  ```

- En la cláusula WHERE, puede usar cualquiera de las funciones que soporta MySQL, excepto para funciones agregadas (resumen).

- Las columnas seleccionadas para la salida pueden ser referidas en cláusulas ORDER BY y GROUP BY usando nombres de columnas, alias o posiciones. Las posiciones de columnas son enteros y comienzan con 1:

  ```mysql
  SELECT college, region,seed FROM tournament
  ORDER BY region,seed;
  SELECT college, region AS r seed AS s FROM tournament 
  ORDER BY r,s;
  SELECT college, region, seed FROM tournament 
  ORDER BY 2,3;
  ```

  Para ordenar en orden inverso, añada la palabra clave DESC (descendente) al nombre de la columna en la cláusula ORDER BY por la que está ordenando. Por defecto es orden ascendente; puede especificarse explícitamente usando la palabra clave ASC.

  El uso de posiciones de columna está obsoleto ya que la sintaxis se ha eliminado del estándar SQL.

- Si usa GROUP BY, los registros de salida se ordenan según las columnas GROUP BY como si tuviera un ORDER BY para las mismas columnas. MySQL 5.0 extiende la cláusula GROUP BY para que pueda especificar ASC y DESC tras las columnas nombradas en la cláusula:

  ```mysql
  SELECT a,COUNT(b) FROM test_table GROUP BY a DESC;
  ```

- MySQL extiende el uso de GROUP BY para permitir seleccionar campos que no se mencionan en la cláusula GROUP BY.

- En MySQL 5.0, GROUP BY permite un modificador WITH ROLLUP.

- La cláusula HAVING se aplica casi al final, justo antes de que los elementos se envíen al cliente, sin optimización. (LIMIT se aplica tras HAVING).

Antes de MySQL 5.0.2, una cláusula HAVING podía referirse a cualquier columna o alias nombrado en una select_expr en la lista SELECT o en subconsultas externas, y para funciones agregadas. Sin embargo, el estándar SQL requiere que HAVING debe referirse sólo a columnas en la cláusula GROUP BY o columnas usadas en funciones agregadas. Para acomodar ambos estándares SQL y el comportamiento específico de MySQL en que es capaz de referirse a columnas en la lista SELECT, MySQL 5.0.2 y posterior permite a HAVING referirse a columnas en la lista SELECT, en la cláusula GROUP BY, en subconsultas externas y en funciones agregadas.

Por ejemplo, el siguiente comando funciona en MySQL 5.0.2 pero produce un error en versiones anteriores:

```mysql
SELECT COUNT() FROM t GROUP BY coll HAVING coll=2;
```

 Si la cláusula HAVING se refiere a una columna ambigua, se muestra una advertencia. En el siguiente comando, col2 es ambiguo porque se usa tanto para un alias como para un nombre de columna:

```mysql
SELECT COUNT(coll) AS col2 FROM t GROUP BY col2 HAVING col2=2;
```

Se da preferencia al comportamiento SQL estándar, así que si un nombre de columna HAVING se usa en un GROUP BY y como alias de columna en la lista de columnas de salida, se da preferencia a la columna en GROUP BY.

- No use HAVING para elementos que deban estar en la cláusula WHERE. Por ejemplo, no escriba lo siguiente:

  ```
  SELECT col_name FROM tbl_name HAVING col_name > 0;
  
  Escriba esto en su lugar:
  SELECT col_name FROM tbl_name WHERE col_name > 0;
  ```

- La cláusula HAVING puede referirse a funciones de agregación, algo que no puede hacer la cláusula WHERE.

  ```mysql
  SELECT user, MAX(salary) FROM users
  GROUP BY user HAVING MAX(salary)>10;
  ```

  (Esto no funcionaría en versiones antiguas de MySQL).

- La cláusula LIMIT puede usarse para restringir el número de registros retornados por el comando SELECT. LIMIT tiene uno o dos argumentos numéricos, que deben ser enteros positivos (incluyendo cero).

  Con dos argumentos, el primer argumento especifica el desplazamiento del primer registro a retornar. El desplazamiento del registro inicial es 0 (no 1):

  ```mysql
  SELECT * FROM table LIMIT 5,110; #Retrieve rows 6-15;
  ```

  Por compatibilidad con PostgreSQL, MySQL también soporta la sintaxis LIMIT row_count OFFSET offset.

  Para recibir todos los registros de un desplazamiento hasta el final del conjunto de resultados, puede usar algún número grande para el segundo parámetro. Este comando recibe todos los registros desde el 96th hasta el último:

  ```mysql
  SELECT * FROM table LIMIT 95,18446744073 7095511615;
  ```

  Con un argumento, el valor especifica el número de registros a retornar desde el comienzo del conjunto de resultados:

  ```mysql
  SELECT * FROM table LIMIT 5; #Retrieve first 5 rows
  ```

  En otras palabras, LIMIT n es equivalente a LIMIT 0,n.

- La forma SELECT...INTO OUTFILE 'file_name' de SELECT escribe los registros seleccionados en un fichero. El fichero se crea en el equipo servidor, así que debe tener el permiso FILE para usar esta sintaxis. El fichero no puede existir, que entre otras cosas evita destruir ficheros cruciales tales como /etc/password y tablas de la base de datos.

  El comando SELECT ... INTO OUTFILE existe principalmente para dejarle volcar una tabla rápidamente en la máquina servidor. Si quiere crear el fichero resultante en un equipo cliente distinto al equipo servidor, no puede usar SELECT ... INTO OUTFILE. En tal caso, debería usar algún comando como mysql -e "SELECT... " > file_name en el equipo cliente para generar el fichero.

  SELECT ... INTO OUTFILE es el complemento de LOAD DATA INFILE; la sintaxis para la parte export_options del comando consiste en las mismas cláusulas FIELDS y LINES usadas con el comando LOAD DATA INFILE. 

  FIELDS ESCAPED BY controla como escribir caracteres especiales. SI el carácter FIELDS ESCAPED BY no está vacío, se usa como prefijo para los siguientes caracteres en la salida

  - El carácter FILEDS ESCAPED BY
  - El carácter FILEDS [OPTIONALLY] ENCLOSED BY
  - El primer carácter de FILEDS TERMINATED BY y LINES TERMINATED BY
  - ASCII 0 (que se escribe siguiendo el carácter de escape ASCII '0', no un byte con valor cero)

  Si el carácter FILEDS ESCAPED BY está vacío, no hay ningún carácter de escape y NULL se muestra por salida como NULL, no \N. Probablemente no es buena idea especificar un carácter de escape vacío, particularmente si los valores de los campos de sus datos contienen cualquiera de los caracteres en la lista dada.

  La razón de lo anterior es que debe escapar cualquier carácter  FILEDS TERMINATED BY, ENCLOSED BY, ESCAPED BY, o LINES TERMINATED BY para ser capaz de volver a leer el fichero correctamente. ASCII NULL se escapa para hacer más fácil visualizarlo con algunos visores.

El fichero resultante no tiene que estar conforme a la sintaxis SQL, assí que nada más debe escaparse.

Este es un ejemplo que produce un fichero en formato de valores separados por comas usado por varios programas:

```mysql
SELECT a,b,a+b INTO OUTFILE '/tmp/result.text'
FILEDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\\n'
FROM test_table;
```

- Si usa INTO DUMPFILE en lugar de INTO OUTFILE, MySQL escribe solo un registro en el fichero, sin ninguna terminación de línea o columna y sin realizar ningún proceso de escape. Esto es útil si quiere almacenar un valor BLOB en un fichero.

- Nota: cualquier fichero creado por INTO OUTFILE o INTO DUMPFILE es modificable por todos los usuarios en el equipo servidor. La razón es que el servidor MySQL no puede crear un fichero con un propietario distinto al usuario que está en ejecución (nunca debe ejecutar mysqld como root por esta y otras razones). El fichero debe ser modificable por todo el mundo para que pueda manipular sus contenidos.

- Una cláusula PROCEDURE nombra a un procedimiento que debe procesar los datos en el conjunto de resultados.

- Si usa FOR UPDATE en un motor de almacenamiento que usa bloque de páginas o registros, los registros examinados por la consulta se bloquean para escritura hasta el final de la transacción actual. Usar LOCK IN SHARE MODE crea un bloqueo compartido que evita a otras transacciones actualizar o borrar los registros examinados.

  Tras la palabra clave SELECT, puede usar un número de opciones que afectan la operación del comando.

  Las opciones ALL, DISTINCT, and DISTINCTROW especifican si deben retornarse los registros duplicados. Si no se da ninguna de estas opciones, por defecto es ALL (se retornan todos los registros coincidentes). DISTINCT y DISTINCTROW son sinónimos y especifican que los registros duplicados en el conjunto de resultados deben borrarse.

  HIGH_PRIORITY, STRAIGHT_JOIN, y opciones que comiencen con SQL_ son extensiones de MySQL al estándar SQL.

- HIGH_PRIORITY da a SELECT prioridad más alta que un comando que actualice una tabla. Debe usar esto solo para consultas que son muy rápidas y deben realizarse una vez. Una consulta SELECT HIGH_PRIORITY que se realiza mientras la tabla está bloqueada para lectura se efectúa incluso si hay un comando de actualización esperando a que se libere la tabla.

  HIGH_PRIORITY no puede usarse con comandos SELECT que sean parte de una UNION.

- STRAIGHT_JOIN fuerza al optimizador a hacer un join de las tablas en el orden en que se listan en la cláusula FROM. Puede usarlo para acelerar una consulta si el optimizador hace un join con las tablas en orden no óptimo.

- SQL_BIG_RESULT puede usarse con GROUP BY o DISTINCT para decir al optimizador que el conjunto de resultados tiene muchos registros. En este caso, MySQL usa directamente tablas temporales en disco si son necesarias con una clave en los elementos GROUP BY.

- SQL_BUFFER_RESULT fuerza a que el resultado se ponga en una tabla temporal. Esto ayuda a MySQL a liberar los bloqueos de tabla rápidamente y ayuda en casos en que tarda mucho tiempo en enviar el resultado al cliente.

- SLQ_SMALL_RESULT puede usarse con GROUP BY o DISTINCT para decir al optimizador que el conjunto de resultados es pequeño. En este caso, MySQL usa tabla temporales rápidas para almacenar la tabla resultante en lugar de usar ordenación. En MySQL 5.0, esto no hará falta normalmente.

- SQL_CALC_FOUND_ROWS le dice a MySQL que calcule cuántos registros habrán en el conjunto de resultados, sin tener en cuenta ninguna cláusula LIMIT. El número de registros pueden encontrarse con SELECT FOUND_ROWS().

- SQL_CACHE le dice a MySQL que almacene el resultado de la consulta en la caché de consultas si está usando un valor de query_cache_type de 2 o DEMAND. Para una consulta que use UNION o subconsultas, esta opción afecta a cualquier SELECT en la consulta.

- SQL_NO_CACHE le dice a MySQL que no almacene los resultados de consulta en la caché de consultas. Para una consulta que use UNION o subconsultas esta opción afecta a cualquier SELECT en la consulta.





Las cláusulas column_definition usan la misma sintaxis para ADD y CHANGE así como CREATE TABLE. Tenga en cuenta que esta sintaxis incluye el nombre de la columna, no solo el tipo.

Algunas conversiones de tipos de columnas pueden ocurrir. Por ejemplo, el atributo AUTO_INCREMENT no se preserva, y las columnas VARCHAR pueden ser CHAR.

LOAD DATA INFILE es el complemento de SELECT...INTO OUTFILE. Para escribir datos de una tabla en un fichero use SELECT...INTO OUTFILE. Para leer el fichero de nuevo en una tabla, use LOAD DATA INFILE. La sintaxis de las cláusulas FIELDS y LINES es la misma para ambos. Ambas son opcionales, pero FIELDS debe preceder a LINES si se especifican ambas.



## Mapeo de Asociaciones

Los mapeos de asociaciones consisten en realizar consultas a asociaciones de los tipos:

- Muchos-uno.
- Uno-uno.
- Uno-muchos.
- Muchos-muchos.

Si por ejemplo tenemos la tabla Personas, la cual está asociada con la tabla Direcciones, esta relación es de Muchos-uno ya que una persona puede tener varias direcciones.

En el archivo XML de mapeado de Hibernate, quedaría un archivo similar a este:

De tal forma para cada tipo de asociación las características van cambiando en el XML.

```xml
<class name="Personas">
    <id name="dni" column="dni">
    	<generator class="native"/>
    </id>
    <many-to-une name="Direcciones"
         column="Iddireccion"
                 not null ="true"/>
</class>

<class name="Direcciones">
    <id name="id" column="Iddireccion">
    	<generator class="native"/>
    </id>
</class>
```

Mediante anotaciones quedaría así:

```java
@Entity
@Table(name="PERSONAS")
public class Persona{
    //Otras propiedades y métodos
    private Set<Direccion> direcciones = new HashSet<Direccion>(0);
    @OneToMany(fetch = FechType.LAZY, mappedBy = "persona")
    public Set<StockDailyRecord> getDirecciones() {
        return this.direcciones;
    }
    
    public void SetDirecciones(Set<StockDailyRecord> direcciones) {
        this.direcciones = direcciones;
    }
}

@Entity
@Table(name="direcciones")
public class Direccion{
    Persona persona;
    //................
    @ManyToOne(fetch = FechType.EAGER)
    @JoinColumn(name = "id_persona", nullable = false)
    public Stock getPersona() {
        return this.persona;
    }
    //...........
}
```

Como podemos observar en la clase Persona hemos utilizado la anotación **@OneToMany** para referirnos que una persona tiene múltiples direcciones, y en Dirección **@ManyToOne** para definir la relación inversa. Con **@JoinColumn** en Dirección indicamos la columna con la id que utiliza Direccion para relacionarse con persona.

También se puede observar el uso de un parámetro denominado fetch, **Fetch.LAZY y Fetch.EAGER**, esto le indica a Hibernate cuando realiza la consulta para dicha relación. Con **LAZY** la consulta a la base de datos se lleva a cabo cuando se intenta acceder a la propiedad direcciones, en cambio con **EAGER** se realiza cuando obtenemos el objeto. 



## Mapeo de Herencia

La herencia es fundamental en la orientación de objetos. Esto hace que el código pueda ser reutilizable y la organización de grandes sistemas de información no supongan una tediosa tarea para los programadores.

Hibernate soporta las 3 estrategias básica de mapeo de herencia:

- Tabla por jerarquía de clase.
- Tabla por subclase.
- Tabla por clase concreta.

También se pueden utilizar estrategias distintas para diferentes ramas de una jerarquía. Por ejemplo se puede mezclar tabla por jerarquía y tabla por subclase bajo el mismo  elemento **<class>**, haciendo uso de elementos **<subclass>** y **<join>**. 

También es posible definir las jerarquías en ficheros XML distintos directamente bajo **<hibernate-mapping>**. Esto permite extender una jerarquía de clases añadiendo un nuevo fichero de mapeo y especificando con el atributo **extends** en <subclass> el nombre de una clase padre.

Anteriormente este método requería un orden concreto de los ficheros sin embargo desde la tercera versión el orden es irrelevante cuando se utiliza extends.

```java
<hibernate-mapping>
    <subclass name="DomesticCat" extends="Cat" disciminator-value="D">
    	<property name="name" type="string"/>
    </subclass>
</hibernate-mapping>
```



**Tabla por jerarquía**

Supongamos que tenemos una interfaz Payment con las implementaciones CreditCardPayment, CashPayment y ChequePayment. El mapeado de tabla por jerarquía se definiria de la siguiente manera:

```xml
<class name="Payment" table="PAYMENT">
    <id name="id" type="long" column="PAYMENT_ID">
    	<generator class="native"/>
    </id>
    <discriminator column="PAYMENT_TYPE" type="string"/>
    <property name="amount" column="AMOUNT"/>
    ....
    <subclass name="CreditCardPayment" discriminator-value="CREDIT">
        <property name="creditCardType" column="CCTYPE"/>
        .....
    </subclass>
    <subclass name="CashPayment" discriminator-value="CASH">
        .....
    </subclass>
    <subclass name="ChequePayment" discriminator-value="CHEQUE">
    <property name="ChequePayment" column="CCHEQUE"/>
    .....
    </subclass>
</class>
```

Mediante este método se utiliza una sola tabla. Hay una limitación en esta estrategia, las columnas declaradas por las subclases no pueden tener restricciones NOT NULL.



**Tabla por subclase**

El mapeado de una tabla por subclase se define de esta manera

```xml
<class name="Payment" table="PAYMENT">
    <id name="id" type="long" column="PAYMENT_ID">
    	<generator class="native"/>
    </id>

    <property name="amount" column="AMOUNT"/>
    ....
    <join-subclass name="CreditCardPayment" table="CREDIT_PAYMENT">
		<key column="PAYMENT_ID"/>
        <property name="creditCardType" column="CCTYPE"/>
        .....
    </join-subclass>
    <join-subclass name="CashPayment" table="CASH_PAYMENT">
		<key column="PAYMENT_ID"/>
        .....
    </join-subclass>
    <join-subclass name="ChequePayment" table="CHEQUE_PAYMENT">
		<key column="PAYMENT_ID"/>
        <property name="ChequePayment" column="CCHEQUE"/>
    .....
    </join-subclass>
</class>
```

Con esta estrategia cutro tablas son requeridas. Las 3 tablass asociadas a las subclases tendrán relaciones por clave primaria a la clase padre, por lo tanto el modelo de la relación Uno-a-uno.

La implementación de tabla por subclase de Hibernate no requiere una columna discriminadora. Otros ORM utilizan una implementación diferente que requiere una columna discriminadora en la de la clase padre. El enfoque adoptado por Hibermate es mucho más difícil de implementar, pero sin duda más correcto desde un punto de vista relacional. Si desea utilizar una columna discriminadora con la estrategia de tabla por subclase, puede combinar el uso de **<subclass>** y **<join>** y, de la siguiente manera:

```xml
<class name="Payment" table="PAYMENT">
    <id name="id" type="long" column="PAYMENT_ID">
    	<generator class="native"/>
    </id>
	<discriminator column="PAYMENT_TYPE" type="string"/>
    <property name="amount" column="AMOUNT"/>
    ....
    <subclass name="CreditCardPayment" discriminator-value="CREDIT">
      	<join table="CREDIT_PAYMENT">
            <key column="PAYMENT_ID"/>
            <property name="creditCardType" column="CCTYPE"/>
            .....
        </join>
    </join-subclass>
    
    <subclass name="CashPayment" discriminator-value="CREDIT">
      	<join table="CREDIT_PAYMENT">
            <key column="PAYMENT_ID"/>
            .....
        </join>
    </subclass>
        
    <subclass name="ChequePayment" discriminator-value="CHEQUE">
      	<join table="CHEQUE_PAYMENT" fecth="select">
            <key column="PAYMENT_ID"/>
            .....
        </join>
    </subclass>
</class>
```



**Tabla por clase concreta**

En este caso se crearía una tabla por cada clase hija pero no la tabla padre, es decir las tablas hijas contienen su propio conjunto de atributos.

```xml
<class name="Payment">
    <id name="id" type="long" column="PAYMENT_ID">
    	<generator class="sequence"/>
    </id>
    <property name="amount" column="AMOUNT"/>
    ....
    <union-subclass name="CreditCardPayment" table="CREDIT_PAYMENT">
        <property name="creditCardType" column="CCTYPE"/>
        .....
    </union-subclass>
    <union-subclass name="CashPayment" table="CASH_PAYMENT">
        .....
    </union-subclass>
    <union-subclass name="ChequePayment" table="CHEQUE_PAYMENT">
    	.....
    </union-subclass>
</class>
```

La limitación con esta estrategia es que si una propiedad se asigna a la clase padre, el nombre de columna debe ser el mismo en todas las tablas hijas. La semilla para generar la clave primaria tiene que ser compartida a través de todas las subclases de una jerarquía, es decir, dos objetos herederos no pueden tener la misma id.

Si la clase padre es abstracta (abstract="true") no requiere de una tabla en la base de datos, en otro caso se debe crear una tabla asociada para guardar sus  instancias.



## Trabajo con objetos

**Para recuperar y guardar objetos en Hibernate utilizamos un objeto de Session**. Un objeto Session mantiene una conexión física con la base de datos, está diseñado para ser instanciado cada vez que se necesita una interacción con la base de datos.

Los objetos Session no deben estar abiertos durante largos periodos de tiempo ya que no son thread safe, es decir su uso entre distintos hilos no garantiza la integridad del proceso. En Hibernate un objeto recuperado por Session puede tener varios estados:

- **Transitorio**

  Cuando un objeto está en estado transitorio significa que acaba de ser instanciado y no se encuentra en ninguna Session de Hibernate. Esto se traduce como que en la base de datos no exista aún el objeto y puede ser destruido por el recolector de basura.

- **Separado**

  Este sabado se produce cuando el objeto ha pasado por persistente, pero su Session ya no existe. Quiere decir que el objeto ya no tiene una referencia válida y puede que su valor se haya perdido. Aun así este objeto puede volver a formarse si no se han eliminado todas sus referencias.

- **Persistente**

  Se produce cuando el objeto existe en la base de datos y posee un identificador dentro del ámbito de la Session.

```java
//.................
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configurarion;

public class ManagePersons{
    private static SessionFactory factory;
    //............
    public Integer addPerson(String name, String lname){
        Session session = factory.openSession();
        Transaction tx = null;
        Integer ID = null;
        try{
            tx = session.beginTransaction();
            Person person = new Person(name, lname);
            ID = (Integer) session.save(person);
            tx.commit();
        }catch (HibernateException e){
            if(tx!=null) tx.rollback();
            e.printStackTrace();
        }finally{
            session.close();
        }
        return ID;
    }
}
```

Como hemos visto SessionFactory abre una nueva sesion. Con el objeto session podemos iniciar una transacción devolviendo un objeto que luego usamos para realizar el commit de los cambios o el rollback. El método save devuelve la id generada tras insertar el objeto en la tabla.

Con session.update(obj) podríamos actualizar los cambios de un objeto y con delete borrarlo. También podemos recuperar un objeto directamente con la id sin escribir una consulta HQL:

```java
(Person)session.get(Person.class, ID);
```



## Optimización

Implementar persistencia con Hibernate es bastante sencillo. Pero lo que empieza siendo fácil puede empezar a ser un problema cuando ssurgen problemas de rendimiento. Hay varias formas de mejorar el rendimiento o encontrar los posibles problemas.

### Hibernate Statistics

Hibernate posee funciones para realizar un registro de las operaciones realizadas y representar determinadas estadísticas, estas se pueden activar estableciendo el parámetro de configuración **hibernate,generate_statistics ** a true y **org.hibernate.stat** a DEBUG. Ahora se podrá observar dicha información durante el desarrollo y compararlo con las expectativas.

<img src="C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241105101825018.png" alt="image-20241105101825018" style="zoom:200%;" />

También hay que tener en cuenta que en desarrollo se realizan unas pocas peticiones comparadas con un entorno de producción. Se podrían utilizar herramientas de estrés contra el servidor local para ver los resultados bajo una carga significativa.

### Consultas lentas

El lenguaje HQL permite abstraernos de la base de datos específica, pero las consultas que se generan pueden no ser las óptimas. Si se le da más importancia al rendimiento que a la portabilidad para operaciones complejas es mejor utilizar consultas nativas. Sin embargo cuando se utilizan consultas nativas se reciben arrays de objetos (Object[]), se pueden mapear estos objetos a las clases de modelo con la anotación @SqlResultSetMapping.

### Elegir el correcto FetchType (LAZY-EAGER)

Podemos cargar los objetos relacionados de dos formas, realizar otra consulta al acceder a la propiedad o cuando obtenemos el objeto principal de la base de datos. Se debe elegir el tipo apropiado en función de la frecuencia y uso que demos a estos datos. Si se utilizan con poca frecuencia es más recomendable elegir **LAZY** por ejemplo.

También es posible realizar una captura **EAGER** en una consulta con la palabra clave **FETCH**:

```mysql
SELECT DISTINCT a FROM Author a JOIN FETCH a.book b
```

### Operaciones pesadas

Si se van a realizar operaciones a un gran conjunto de datos es mejor si dejamos que la base de datos lo lleve a cabo y nos devuelva el resultado. Aparte de las operaciones que se pueden realizar con HQL se puede llamar a procedimientos implementados en la propia base de datos a través de **@NamedStoredProcedureQuery:**

```java
@NameStoredProcedureQuery(
	name = "getBooks",
    procedureName = "get_books",
    resultClasses = Book.class,
    parameters = { @storedProcedureParameter(mode = ParameterMode.REF_CURSOR, type = void.class)}
)
```



## Recuerda

- **Hibernate**

  Es un servicio de persistencia en objetos relacionales de alto rendimiento cuya licencia está bajo GNU y es totalmente gratuito.

- **Acelerar**

  En definitiva se puede decir que Hibernate está diseñado para acelerar la relación existente entre la aplicación y la base de datos.

- **Clases mapeadas**

  Para la creación de clases mapeadas, tenemos que seguir una serie de reglas las cuales son estrictamente necesarias para que Hibernate pueda reconocerlas.

- **HQL**

  El lenguaje utilizado por Hibernate se llama HQL o Hibernate Query Languaje. Este posee su propio lenguaje pero muy similar al ya conocido SQL.

- **Herencia**

  La herencia es fundamental para localizar a todos los objetos de una estructura.

- **ORM**

  Hibernate es un ORM bastante complejo para lograr una buena optimización. Por ello se suele decir que las consultas mediante JDBC son más rápidas, ya que para lograr obtener los conocimientos de Hibernate necesarios hasta obtener un nivel alto ser muy tedioso.

![image-20241105103831972](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241105103831972.png)

hibernate.dialect indica a Hibernate como generar el código Java apropiado para la base de datos elegida.

Hibernate no solo utiliza ficheros xml para el mapeado de clases.

![image-20241105103853382](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241105103853382.png)

HQL es independiente de la base de datos y trata los objetos Java de la misma manera que SQL trata las tablas.

Para la creación de clases mapeadas, tenemos que seguir una serie de reglas las cuales son estrictamente necesarias para que Hibernate pueda reconocerlas.

En Hibernate se usa el método save (session.save) para guardar un modelo.

![image-20241105104717012](C:\Users\dell\AppData\Roaming\Typora\typora-user-images\image-20241105104717012.png)
