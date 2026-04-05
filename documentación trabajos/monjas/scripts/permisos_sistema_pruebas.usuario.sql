alter table sistema_pruebas.usuario add column permisos varchar(5) DEFAULT NULL;

--admin1, admin2, pruebas2
update sistema_pruebas.usuario set permisos = "FFFFF" WHERE id = 8;
update sistema_pruebas.usuario set permisos = "FFFFF" WHERE id = 9;
update sistema_pruebas.usuario set permisos = "FFFFF" WHERE id = 10;

-- oviedo, oviedo2
update sistema_pruebas.usuario set permisos = "00800" WHERE id = 3;
update sistema_pruebas.usuario set permisos = "00800" WHERE id = 12;
update sistema_pruebas.usuario set permisos = "00800" WHERE id = 13;

-- pruebas, pruebas23
update sistema_pruebas.usuario set permisos = "FF863" WHERE id = 7;
update sistema_pruebas.usuario set permisos = "FF863" WHERE id = 11;
