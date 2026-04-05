# Actividad 1![img](https://app2.asehca.com/img/2.png)

Un videoclub que alquila películas en video almacena la información de sus películas en una tabla llamada "peliculas"; para cada película necesita los siguientes datos: -nombre, cadena de caracteres de 20 de longitud,-actor, cadena de caracteres de 20 de longitud,-duración, valor numérico entero.-cantidad de copias: valor entero.

1- Cree la tabla eligiendo el tipo de dato adecuado para cada campo: create table peliculas( nombre varchar(20), actor varchar(20), duracion integer, cantidad integer );

2- Vea la estructura de la tabla: describe peliculas;

3- Ingrese los siguientes registros: insert into peliculas (nombre, actor, duracion, cantidad) values ('Mision imposible','Tom Cruise',120,3); insert into peliculas (nombre, actor, duracion, cantidad) values ('Mision imposible 2','Tom Cruise',180,2); insert into peliculas (nombre, actor, duracion, cantidad) values ('Mujer bonita','Julia R.',90,3); insert into peliculas (nombre, actor, duracion, cantidad) values ('Elsa y Fred','China Zorrilla',90,2);

4- Muestre todos los registros: select * from peliculas;