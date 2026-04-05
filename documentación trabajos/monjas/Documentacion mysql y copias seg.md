[TOC]

# Documentación mysql

## Eventos

Para que funcionen los eventos , la variable 'event_scheduler' tiene que estar en ON;

```mysql
show variables like 'event_scheduler';

SET GLOBAL event_scheduler = ON;
```

creamos nuestro *evento*; En mi caso, tendrá el nombre de *insertion event*. Este *evento* se ejecutará dentro de 1 min, y lo que hará, será insertar un registro en mi tabla.

```sql
CREATE EVENT insertion_event
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 MINUTE
DO INSERT INTO test VALUES ('Evento 1', NOW());
```

> El nombre del evento no debe de poseer más de 64 caracteres.

Si queremos que el *evento* se ejecute en una fecha en concreto, únicamente debemos de especificarlo en *ON SCHEDULE AT*. Recuerda, el formato es *año-mes-día hora:minuto:segundo*.

```sql
ON SCHEDULE AT '2018-12-31 12:00:00'
```

Si nuestro *evento* ejecutará más de una sentencia SQL debemos de apoyarnos de *BEGIN* y *END*.

```mysql
DELIMITER //

CREATE EVENT insertion_event
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 MINUTE
DO
BEGIN
 INSERT INTO test VALUES ('Evento 1', NOW());
 INSERT INTO test VALUES ('Evento 2', NOW());
 INSERT INTO test VALUES ('Evento 3', NOW());
END //

DELIMITER ;
```

Una vez el evento se haya creado, nosotros podemos listarlo.

```mysql
SHOW events\G;
```

Si queremos eliminar un evento haremos uso de **DROP**.

```sql
DROP EVENT nombre_evento;
```

Es importante mencionar que una vez el evento haya expirado, este, será eliminado de forma automática. Si nosotros no queremos que esto ocurra debemos de apoyarnos de **ON COMPLETION**

```sql
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 MINUTE
ON COMPLETION PRESERVE
...
```

Mostrar codigo de un evento 'x':

```mysql
SHOW CREATE EVENT nombre_evento;
```



## Sacar scripts sistemas_creados

hazard

```bash
mysqldump -u fincahazard -p --databases calendario_hazard huevon_hazard karnaverde_hazard ps_hazard sistema_hazard utilidades_hazard > bds_hazard.sql  	
```



mariano

```bash
mysqldump -u fincahazard -p --databases calendario_mariano huevon_mariano karnaverde_mariano ps_mariano sistema_mariano utilidades_mariano equipo_mariano > bds_mariano.sql  	
```



pr_hazard

```bash
mysqldump -u fincahazard -p --databases calendario_pr_hazard huevon_pr_hazard karnaverde_pr_hazard ps_pr_hazard sistema_pr_hazard utilidades_pr_hazard > bds_pr_hazard.sql  	
```



pr_mariano

```bash
mysqldump -u fincahazard -p --databases calendario_pr_mariano huevon_pr_mariano karnaverde_pr_mariano ps_pr_mariano sistema_pr_mariano utilidades_pr_mariano equipo_pr_mariano > bds_pr_mariano.sql  	
```



montecerrado

```bash
mysqldump -u fincahazard -p --databases sistema_montecerrado > bds_montecerrado.sql  	
```

