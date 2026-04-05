alter table grupo_luces add column tipo int(11) DEFAULT -1;

alter table tarea drop column hora_inicio;
alter table tarea change column hora_fin intervalo varchar(10) default null;


--
-- Table structure for table `horario_alumbrado_exterior`
--
CREATE TABLE `horario_alumbrado_exterior` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_grupo` int(11) DEFAULT NULL,
  `tipo_inicio` int(11) NOT NULL,
  `hora_inicio` varchar(10) NOT NULL,
  `tipo_fin` int(11) DEFAULT NULL,
  `hora_fin` varchar(10) DEFAULT NULL,
  `tipo_horario` int(11) DEFAULT 0,
  `schedule` varchar(70) NOT NULL,
   PRIMARY KEY (`id`),
   KEY `codigo_grupo` (`codigo_grupo`),
  CONSTRAINT `horario_ibfk_1` FOREIGN KEY (`codigo_grupo`) REFERENCES `grupo_luces` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `modo_grupo_luces`
--
CREATE TABLE `modo_grupo_luces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_grupo` int(11) DEFAULT NULL,
  `modo` int(11) DEFAULT 0,
   PRIMARY KEY (`id`),
   KEY `codigo_grupo` (`codigo_grupo`),
  CONSTRAINT `modo_ibfk_1` FOREIGN KEY (`codigo_grupo`) REFERENCES `grupo_luces` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
