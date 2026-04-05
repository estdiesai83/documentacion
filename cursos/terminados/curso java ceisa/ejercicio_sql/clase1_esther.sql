create database videoclub;

use videoclub;

create table peliculas(
   nombre varchar(20) not null,
   actor varchar(20),
   duracion int,
   cantidad int
);

describe peliculas;

insert into peliculas VALUES  
('Mision imposible','Tom Cruise',120,3),
('Mision imposible 2','Tom Cruise',180,2),
('Mujer bonita','Julia R.',90,3),
('Elsa y Fred','China Zorrilla',90,2);


SELECT *FROM peliculas; 