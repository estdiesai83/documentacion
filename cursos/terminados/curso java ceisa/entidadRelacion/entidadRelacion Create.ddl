CREATE TABLE artistas (id_artistas int(10) NOT NULL AUTO_INCREMENT, nombre varchar(255) NOT NULL, f_nacimiento date NOT NULL, obrasid_obras int(10) NOT NULL, PRIMARY KEY (id_artistas)) ENGINE=InnoDB;
CREATE TABLE exposicion (id_exposicion int(10) NOT NULL AUTO_INCREMENT, titulo varchar(255) NOT NULL, descripcion varchar(255) NOT NULL, obrasid_obras int(10) NOT NULL, PRIMARY KEY (id_exposicion)) ENGINE=InnoDB;
CREATE TABLE obras (id_obras int(10) NOT NULL AUTO_INCREMENT, titulo varchar(255) NOT NULL, registros int(10) NOT NULL, precio int(10) NOT NULL, estilo varchar(255) NOT NULL, PRIMARY KEY (id_obras)) ENGINE=InnoDB;
CREATE TABLE periodo (id_pedido int(10) NOT NULL AUTO_INCREMENT, f_inauguracion date NOT NULL, f_clausura date NOT NULL, exposicionid_exposicion int(10) NOT NULL, CONSTRAINT id_periodo PRIMARY KEY (id_pedido)) ENGINE=InnoDB;
ALTER TABLE periodo ADD CONSTRAINT `0,0` FOREIGN KEY (exposicionid_exposicion) REFERENCES exposicion (id_exposicion);
ALTER TABLE artistas ADD CONSTRAINT `1,1` FOREIGN KEY (obrasid_obras) REFERENCES obras (id_obras);
ALTER TABLE exposicion ADD CONSTRAINT `1,n` FOREIGN KEY (obrasid_obras) REFERENCES obras (id_obras);

