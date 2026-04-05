use sistema_somosaguas;

update estancia set nemo = "Habitacion Alejandro" where id = 22;
update estancia set nemo = "Baño Alejandro" where id = 23;
update estancia set nemo = "Habitacion Rachel" where id = 24;
update estancia set nemo = "Baño Rachel" where id = 25;

update estancia set nemo = "Sala TV" where id = 46;

insert into estancia (nemo, codigo_planta, modelo, escenas, ambientes, rutinas) VALUES
("Vestidor Alejandro",5,2,0,0,0),
("Vestidor Rachel",5,2,0,0,0),
("Vestibulo Hab Prin",5,2,0,0,0),
("Vestibulo Biblioteca/Bar",4,2,0,0,0),
("Vestibulo Sala Tv/Habitaciones",4,2,0,0,0),
("Vestibulo Cocina/Entrada",4,2,0,0,0),
("Despensa",4,2,0,0,0),
("Ropero",4,2,0,0,0),

("Vestibulo Entrada/Servicio",7,2,0,0,0),
("Pasillo Lavanderia",7,2,0,0,0),
("Despensa Sotano",7,2,0,0,0),

("Sala maquinas Piscina Interior",7,2,0,0,0),
("Vestibulo Piscina Interior",7,2,0,0,0),
("Baño 1 Piscina Interior",7,2,0,0,0),
("Baño 2 Piscina Interior",7,2,0,0,0),
("Vestibulo principal sotano",7,2,0,0,0),
("Sala Juegos",7,2,0,0,0),
("Garaje",7,2,0,0,0),
("Cuarto instalaciones",7,2,0,0,0),
("Cuarto clima",7,2,0,0,0),
("Baño 1 Piscina Interior",7,2,0,0,0),

("Vestibulo Habitacion estudio",3,2,0,0,0);
