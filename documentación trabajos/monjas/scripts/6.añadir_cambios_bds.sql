use sistema_pr_somosaguas;

ALTER table cuadro add column codigo_grupo int(11) DEFAULT NULL;

ALTER TABLE cuadro ADD CONSTRAINT `cuadro_ibfk_3` FOREIGN KEY (`codigo_grupo`) REFERENCES `grupo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

