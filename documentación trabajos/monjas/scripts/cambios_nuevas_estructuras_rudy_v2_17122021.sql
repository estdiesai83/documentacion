use sistema_rudy_v2;

-- SET FOREIGN_KEY_CHECKS=0;


-- SET FOREIGN_KEY_CHECKS=1;



ALTER TABLE th_rasp_ed DROP FOREIGN KEY _rasp_ed_thfk_1;
ALTER TABLE th_rasp_ed DROP KEY codigotp;
ALTER TABLE th_rasp_ed ADD KEY codigo_tp (codigo_tp);
ALTER TABLE th_rasp_ed ADD CONSTRAINT th_rasp_ed_ibfk_1 FOREIGN KEY (`codigo_tp`) REFERENCES `trb_rasp_ed` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE th_rasp_sd DROP FOREIGN KEY _rasp_sd_thfk_1;
ALTER TABLE th_rasp_sd DROP KEY codigotp;
ALTER TABLE th_rasp_sd ADD KEY codigo_tp (codigo_tp);
ALTER TABLE th_rasp_sd ADD CONSTRAINT th_rasp_sd_ibfk_1 FOREIGN KEY (`codigo_tp`) REFERENCES `trb_rasp_sd` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE th_rasp_ds18b20 DROP FOREIGN KEY _rasp_ds18b20_thfk_1;
ALTER TABLE th_rasp_ds18b20 DROP KEY codigotp;
ALTER TABLE th_rasp_ds18b20 ADD KEY codigo_tp (codigo_tp);
ALTER TABLE th_rasp_ds18b20 ADD CONSTRAINT th_rasp_ds18b20_ibfk_1 FOREIGN KEY (`codigo_tp`) REFERENCES `trb_rasp_ds18b20` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE th_rasp_sa DROP FOREIGN KEY _rasp_sa_thfk_1;
ALTER TABLE th_rasp_sa DROP KEY codigotp;
ALTER TABLE th_rasp_sa ADD KEY codigo_tp (codigo_tp);
ALTER TABLE th_rasp_sa ADD CONSTRAINT th_rasp_sa_ibfk_1 FOREIGN KEY (`codigo_tp`) REFERENCES `trb_rasp_sa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE th_rasp_ea DROP FOREIGN KEY _rasp_ea_thfk_1;
ALTER TABLE th_rasp_ea DROP KEY codigotp;
ALTER TABLE th_rasp_ea ADD KEY codigo_tp (codigo_tp);
ALTER TABLE th_rasp_ea ADD CONSTRAINT th_rasp_ea_ibfk_1 FOREIGN KEY (`codigo_tp`) REFERENCES `trb_rasp_ea` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE th_rasp_pulsos DROP FOREIGN KEY _rasp_pulsos_thfk_1;
ALTER TABLE th_rasp_pulsos DROP KEY codigotp;
ALTER TABLE th_rasp_pulsos ADD KEY codigo_tp (codigo_tp);
ALTER TABLE th_rasp_pulsos ADD CONSTRAINT th_rasp_pulsos_ibfk_1 FOREIGN KEY (`codigo_tp`) REFERENCES `trb_rasp_pulsos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE th_analizador DROP FOREIGN KEY _analizador_thfk_1;
ALTER TABLE th_analizador DROP KEY codigotp;
ALTER TABLE th_analizador ADD KEY codigo_tp (codigo_tp);
ALTER TABLE th_analizador ADD CONSTRAINT th_ea_ibfk_1 FOREIGN KEY (`codigo_tp`) REFERENCES `trb_analizador` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE th_readwatt_e DROP FOREIGN KEY _readwatt_e_thfk_1;
ALTER TABLE th_readwatt_e DROP KEY codigotp;
ALTER TABLE th_readwatt_e ADD KEY codigo_tp (codigo_tp);
ALTER TABLE th_readwatt_e ADD CONSTRAINT th_readwatt_e_ibfk_1 FOREIGN KEY (`codigo_tp`) REFERENCES `trb_readwatt_e` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE th_readwatt_s DROP FOREIGN KEY _readwatt_s_thfk_1;
ALTER TABLE th_readwatt_s DROP KEY codigotp;
ALTER TABLE th_readwatt_s ADD KEY codigo_tp (codigo_tp);
ALTER TABLE th_readwatt_s ADD CONSTRAINT th_readwatt_s_ibfk_1 FOREIGN KEY (`codigo_tp`) REFERENCES `trb_readwatt_s` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE th_smart_x100 DROP FOREIGN KEY _smart_x100_thfk_1;
ALTER TABLE th_smart_x100 DROP KEY codigotp;
ALTER TABLE th_smart_x100 ADD KEY codigo_tp (codigo_tp);
ALTER TABLE th_smart_x100 ADD CONSTRAINT th_smart_x100_ibfk_1 FOREIGN KEY (`codigo_tp`) REFERENCES `trb_smart_x100` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE th_smart_x835 DROP FOREIGN KEY _smart_x835_thfk_1;
ALTER TABLE th_smart_x835 DROP KEY codigotp;
ALTER TABLE th_smart_x835 ADD KEY codigo_tp (codigo_tp);
ALTER TABLE th_smart_x835 ADD CONSTRAINT th_smart_x835_ibfk_1 FOREIGN KEY (`codigo_tp`) REFERENCES `trb_smart_x835` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE clima DROP FOREIGN KEY clima_ibfk_1;
ALTER TABLE clima DROP KEY codigoestancia;
ALTER TABLE clima ADD KEY codigo_estancia (codigo_estancia);
ALTER TABLE clima ADD CONSTRAINT clima_ibfk_1 FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `escenas` CHANGE COLUMN `codigoestancia` `codigo_estancia` int(11) DEFAULT NULL;
ALTER TABLE escenas DROP FOREIGN KEY escenas_ibfk_1;
ALTER TABLE escenas DROP KEY codigoestancia;
ALTER TABLE escenas ADD KEY codigo_estancia (codigo_estancia);
ALTER TABLE escenas ADD CONSTRAINT escenas_ibfk_1 FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE `estancia` CHANGE COLUMN `codigoplanta` `codigo_planta` int(11) DEFAULT NULL;
ALTER TABLE estancia DROP FOREIGN KEY estancia_ibfk_1;
ALTER TABLE estancia DROP KEY codigoplanta;
ALTER TABLE estancia ADD KEY codigo_planta (codigo_planta);
ALTER TABLE estancia ADD CONSTRAINT estancia_ibfk_1 FOREIGN KEY (`codigo_planta`) REFERENCES `planta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE luces DROP FOREIGN KEY luces_ibfk_1;
ALTER TABLE luces DROP KEY codigoestancia;
ALTER TABLE luces ADD KEY codigo_estancia (codigo_estancia);
ALTER TABLE luces ADD CONSTRAINT luces_ibfk_1 FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE iot DROP FOREIGN KEY iot_ibfk_1;
ALTER TABLE iot DROP KEY codigoestancia;
ALTER TABLE iot ADD KEY codigo_estancia (codigo_estancia);
ALTER TABLE iot ADD CONSTRAINT iot_ibfk_1 FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE estor DROP FOREIGN KEY estor_ibfk_1;
ALTER TABLE estor DROP KEY codigoestancia;
ALTER TABLE estor ADD KEY codigo_estancia (codigo_estancia);
ALTER TABLE estor ADD CONSTRAINT estor_ibfk_1 FOREIGN KEY (`codigo_estancia`) REFERENCES `estancia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE `relacion_luces` CHANGE COLUMN `codigoluces` `codigo_luces` int(11) DEFAULT NULL;
ALTER TABLE relacion_luces DROP FOREIGN KEY relacion_luces_ibfk_1;
ALTER TABLE relacion_luces DROP KEY codigoluces;
ALTER TABLE relacion_luces ADD KEY codigo_luces (codigo_luces);
ALTER TABLE relacion_luces ADD CONSTRAINT relacion_luces_ibfk_1 FOREIGN KEY (`codigo_luces`) REFERENCES `luces` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE relacion_clima DROP FOREIGN KEY relacion_clima_ibfk_1;
ALTER TABLE relacion_clima DROP KEY codigoambiente;
ALTER TABLE relacion_clima ADD KEY codigo_clima (codigo_clima);
ALTER TABLE relacion_clima ADD CONSTRAINT relacion_clima_ibfk_1 FOREIGN KEY (`codigo_clima`) REFERENCES `clima` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE relacion_estor DROP FOREIGN KEY relacion_estor_ibfk_1;
ALTER TABLE relacion_estor DROP KEY codigoestor;
ALTER TABLE relacion_estor ADD KEY codigo_estor (codigo_estor);
ALTER TABLE relacion_estor ADD CONSTRAINT relacion_estor_ibfk_1 FOREIGN KEY (`codigo_estor`) REFERENCES `estor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE relacion_iot DROP FOREIGN KEY relacioniot_ibfk_1;
ALTER TABLE relacion_iot DROP KEY codigoiot;
ALTER TABLE relacion_iot ADD KEY codigo_iot (codigo_iot);
ALTER TABLE relacion_iot ADD CONSTRAINT relacion_iot_ibfk_1 FOREIGN KEY (`codigo_iot`) REFERENCES `iot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE rutina CHANGE COLUMN color color varchar(50) DEFAULT NULL;
ALTER TABLE rutina CHANGE COLUMN hora_fin hora_fin time DEFAULT NULL;

ALTER TABLE ot CHANGE COLUMN fecha_fin fecha_fin datetime DEFAULT NULL;
ALTER TABLE ot ADD COLUMN estado int(11) DEFAULT NULL;

ALTER TABLE relacion_rutina_operacion CHANGE COLUMN tiempo tiempo int(11) DEFAULT NULL;
ALTER TABLE relacion_rutina_escena CHANGE COLUMN tiempo tiempo int(11) DEFAULT NULL;

ALTER TABLE estancia ADD COLUMN escenas int(11) DEFAULT 0;
ALTER TABLE estancia ADD COLUMN ambientes int(11) DEFAULT 0;

ALTER TABLE rutina ADD COLUMN notificacion int(11) DEFAULT 0;
