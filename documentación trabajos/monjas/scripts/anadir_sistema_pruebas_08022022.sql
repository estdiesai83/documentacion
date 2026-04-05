use sistema_pruebas;
alter table usuario add column token_fcm varchar(50) default NULL;

alter table ubicacion add column bd int default NULL;
