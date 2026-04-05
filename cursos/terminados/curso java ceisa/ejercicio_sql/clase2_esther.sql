create database vehiculos;

use vehiculos;

create table propietarios(
   DNI int not null PRIMARY KEY,
   nombre varchar(30) not null,
   direccion varchar(100),
   ciudad varchar(50),
   fecha_nacimiento date,
   telefono int not null,
   email varchar(100) not null
);

create table coches(
   matricula varchar(15) not null PRIMARY KEY,
   marca varchar(50) not null,
   modelo varchar(50) UNIQUE KEY,
   nuevo bool default true,
   precio int default 1000,
   fecha_matriculacion date,
   DNI int not null ,
   KEY `dni` (`DNI`),
  CONSTRAINT `fk1` FOREIGN KEY (`DNI`) REFERENCES `propietarios` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE
) ;