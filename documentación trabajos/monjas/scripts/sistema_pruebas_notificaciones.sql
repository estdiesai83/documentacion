
DROP TABLE IF EXISTS `notificacion_mensajeria`;
DROP TABLE IF EXISTS `notificacion_historico`;
DROP TABLE IF EXISTS `notificacion`;

CREATE TABLE `notificacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `asunto` varchar(45) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `emisor` int(11) DEFAULT NULL,
  `receptor` int(11) DEFAULT NULL,
  `estado` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_not_1_idx` (`emisor`),
  KEY `fk_not_2_idx` (`receptor`),
  CONSTRAINT `not_1` FOREIGN KEY (`emisor`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `not_2` FOREIGN KEY (`receptor`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `notificacion_historico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `codigo_notificacion` int(11) NOT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_not_hist_1_idx` (`codigo_notificacion`),
  CONSTRAINT `not_hist_1` FOREIGN KEY (`codigo_notificacion`) REFERENCES `notificacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `notificacion_mensajeria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) DEFAULT NULL,
  `token_usuario` varchar(45) DEFAULT NULL,
  `token_chat` varchar(45) DEFAULT NULL,
  `token_mensaje` varchar(45) DEFAULT NULL,
  `codigo_notificacion` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_not_men_1_idx` (`codigo_notificacion`),
  CONSTRAINT `not_men_1` FOREIGN KEY (`codigo_notificacion`) REFERENCES `notificacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
