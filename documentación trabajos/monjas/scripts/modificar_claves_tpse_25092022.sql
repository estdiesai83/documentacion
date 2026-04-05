ALTER TABLE tpse DROP CONSTRAINT `tpse_ibfk_1`;
ALTER TABLE tpse DROP CONSTRAINT `tpse_ibfk_2`;

ALTER TABLE tpss DROP CONSTRAINT `tpss_ibfk_1`;
ALTER TABLE tpss DROP CONSTRAINT `tpss_ibfk_2`;


ALTER TABLE iniciarhilostrb ADD CONSTRAINT `ini_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE trb_analizador  ADD CONSTRAINT `trb_analizador_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_iber_8ed_conv ADD CONSTRAINT `trb_iber_8ed_conv_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_iber_8sd_conv ADD CONSTRAINT `trb_iber_8sd_conv_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_ibercomp_sonda ADD CONSTRAINT `trb_ibercomp_sonda_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_md02 ADD CONSTRAINT `trb_md02_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_rasp_dali_e ADD CONSTRAINT `trb_rasp_dali_e_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_rasp_dali_s ADD CONSTRAINT `trb_rasp_dali_s_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_rasp_ds18b20 ADD CONSTRAINT `trb_rasp_ds18b20_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_rasp_ed ADD CONSTRAINT `trb_rasp_ed_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_rasp_pulsador ADD CONSTRAINT `trb_rasp_pulsador_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_rasp_sa ADD CONSTRAINT `trb_rasp_sa_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_rasp_sd ADD CONSTRAINT `trb_rasp_sd_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_somfy_50_e ADD CONSTRAINT `trb_somfy_50_e_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_somfy_50_s ADD CONSTRAINT `trb_somfy_50_s_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_somfy_rts_e ADD CONSTRAINT `trb_somfy_rts_e_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_somfy_rts_s ADD CONSTRAINT `trb_somfy_rts_s_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_sugar_conv_e ADD CONSTRAINT `trb_sugar_conv_e_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_sugar_conv_s ADD CONSTRAINT `trb_sugar_conv_s_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_sungrow_e ADD CONSTRAINT `trb_sungrow_e_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_sungrow_s ADD CONSTRAINT `trb_sungrow_s_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_aerothermal_e ADD CONSTRAINT `trb_aerothermal_e_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_aerothermal_s ADD CONSTRAINT `trb_aerothermal_s_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE trb_iber_8ed_modbus ADD CONSTRAINT `trb_iber_8ed_modbus_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE trb_iber_8sd_modbus ADD CONSTRAINT `trb_iber_8sd_modbus_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE luces change column rgb rgb varchar(15) default null;

-- inicio para probar loa con pr_somosaguas
update comando set ip = '192.168.3.120' where id <=39;
update comando set puerto = 9000 where id <=39;

update comando set ip = '192.168.3.120' where id >=40 AND id <=57;
update comando set puerto = 9000 where id >=40 AND id <=57;

update comando set tipodriver = 'Ibercomp8ed_modbus' where id = 44;
update comando set tipodriver = 'Ibercomp8ed_modbus' where id = 46;
update comando set tipodriver = 'Ibercomp8ed_modbus' where id = 48;
update comando set tipodriver = 'Ibercomp8ed_modbus' where id = 50;

update comando set tipodriver = 'Ibercomp8sd_modbus' where id = 43;
update comando set tipodriver = 'Ibercomp8sd_modbus' where id = 45;
update comando set tipodriver = 'Ibercomp8sd_modbus' where id = 47;
update comando set tipodriver = 'Ibercomp8sd_modbus' where id = 49;

update relacion_rb set subdriver = '8ED_modbus' where codigo_rb = 339;
update relacion_rb set subdriver = '8ED_modbus' where codigo_rb = 341;
update relacion_rb set subdriver = '8ED_modbus' where codigo_rb = 343;
update relacion_rb set subdriver = '8ED_modbus' where codigo_rb = 345;

-- fin para probar loa con pr_somosaguas

-- ALTER TABLE ambiente add column codigo_grupo int(11);
-- ALTER TABLE rutina add column codigo_grupo int(11);

-- ALTER TABLE ambiente ADD CONSTRAINT `ambiente_ibfk_3` FOREIGN KEY (`codigo_grupo`) REFERENCES `grupo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ALTER TABLE rutina ADD CONSTRAINT `rutina_ibfk_3` FOREIGN KEY (`codigo_grupo`) REFERENCES `grupo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- DROP TRIGGER trigger_operacion_escena;

-- ALTER TABLE sistema_pruebas_v2.tpse ADD CONSTRAINT `tpse_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
-- ALTER TABLE sistema_pruebas_v2.tpse ADD CONSTRAINT `tpse_ibfk_2` FOREIGN KEY (`codigo_relacion_rb`) REFERENCES `relacion_rb` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;


-- ALTER TABLE sistema_pruebas_v2.tpss DROP CONSTRAINT `tpss_ibfk_1`;
-- ALTER TABLE sistema_pruebas_v2.tpss DROP CONSTRAINT `tpss_ibfk_2`;

-- ALTER TABLE sistema_pruebas_v2.tpss ADD CONSTRAINT `tpss_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
-- ALTER TABLE sistema_pruebas_v2.tpss ADD CONSTRAINT `tpss_ibfk_2` FOREIGN KEY (`codigo_relacion_rb`) REFERENCES `relacion_rb` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;


-- ALTER TABLE sistema_pruebas_v2.relacion_rb DROP CONSTRAINT `relacion_rb_ibfk_1`;

-- ALTER TABLE sistema_pruebas_v2.relacion_rb ADD CONSTRAINT `relacion_rb_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- ALTER TABLE sistema_pruebas_v2.rb DROP CONSTRAINT `relacion_rb_ibfk_1`;

-- ALTER TABLE sistema_pruebas_v2.rb ADD CONSTRAINT `relacion_rb_ibfk_1` FOREIGN KEY (`codigo_rb`) REFERENCES `rb` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
