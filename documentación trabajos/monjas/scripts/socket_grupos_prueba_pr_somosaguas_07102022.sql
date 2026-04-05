update th_aerothermal_e set argumentos = REPLACE(argumentos,'"room"','"group":"","room"') where modulo = 4;
update th_aerothermal_s set argumentos = REPLACE(argumentos,'"room"','"group":"","room"') where modulo = 4;
update th_analizador set argumentos = REPLACE(argumentos,'"room"','"group":"","room"') where modulo = 4;
update th_iber_8ed_conv set argumentos = REPLACE(argumentos,'"room"','"group":"","room"') where modulo = 4;
update th_iber_8sd_conv set argumentos = REPLACE(argumentos,'"room"','"group":"","room"') where modulo = 4;
update th_ibercomp_sonda set argumentos = REPLACE(argumentos,'"room"','"group":"","room"') where modulo = 4;
update th_md02 set argumentos = REPLACE(argumentos,'"room"','"group":"","room"') where modulo = 4;
update th_rasp_dali_e set argumentos = REPLACE(argumentos,'"room"','"group":"","room"') where modulo = 4;
update th_rasp_dali_s set argumentos = REPLACE(argumentos,'"room"','"group":"","room"') where modulo = 4;
update th_rasp_ds18b20  set argumentos = REPLACE(argumentos,'"room"','"group":"","room"') where modulo = 4;
update th_rasp_ed  set argumentos = REPLACE(argumentos,'"room"','"group":"","room"') where modulo = 4;
update th_rasp_pulsador set argumentos = REPLACE(argumentos,'"room"','"group":"","room"') where modulo = 4;
update th_rasp_sa  set argumentos = REPLACE(argumentos,'"room"','"group":"","room"') where modulo = 4;
update th_rasp_sd  set argumentos = REPLACE(argumentos,'"room"','"group":"","room"') where modulo = 4;
update th_somfy_50_e set argumentos = REPLACE(argumentos,'"room"','"group":"","room"') where modulo = 4;
update th_somfy_50_s set argumentos = REPLACE(argumentos,'"room"','"group":"","room"') where modulo = 4;
update th_somfy_rts_e set argumentos = REPLACE(argumentos,'"room"','"group":"","room"') where modulo = 4;
update th_somfy_rts_s set argumentos = REPLACE(argumentos,'"room"','"group":"","room"') where modulo = 4;
update th_sugar_conv_e  set argumentos = REPLACE(argumentos,'"room"','"group":"","room"') where modulo = 4;
update th_sugar_conv_s  set argumentos = REPLACE(argumentos,'"room"','"group":"","room"') where modulo = 4;
update th_sungrow_e  set argumentos = REPLACE(argumentos,'"room"','"group":"","room"') where modulo = 4;
update th_sungrow_s  set argumentos = REPLACE(argumentos,'"room"','"group":"","room"') where modulo = 4;


--  pruebas
-- grupo 1
-- comedor
update th_iber_8ed_conv set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"13"%';
update th_iber_8sd_conv set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"13"%';
update th_ibercomp_sonda set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"13"%';
update th_md02 set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"13"%';
update th_rasp_dali_e set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"13"%';
update th_rasp_dali_s set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"13"%';
update th_rasp_ds18b20  set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"13"%';
update th_rasp_ed  set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"13"%';
update th_rasp_pulsador set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"13"%';
update th_rasp_sd  set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"13"%';
update th_somfy_50_e set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"13"%';
update th_somfy_50_s set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"13"%';
update th_somfy_rts_e set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"13"%';
update th_somfy_rts_s set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"13"%';


-- sala tv
update th_iber_8ed_conv set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"46"%';
update th_iber_8sd_conv set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"46"%';
update th_ibercomp_sonda set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"46"%';
update th_md02 set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"46"%';
update th_rasp_dali_e set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"46"%';
update th_rasp_dali_s set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"46"%';
update th_rasp_ds18b20  set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"46"%';
update th_rasp_ed  set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"46"%';
update th_rasp_pulsador set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"46"%';
update th_rasp_sd  set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"46"%';
update th_somfy_50_e set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"46"%';
update th_somfy_50_s set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"46"%';
update th_somfy_rts_e set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"46"%';
update th_somfy_rts_s set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"46"%';


-- biblioteca
update th_iber_8ed_conv set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"21"%';
update th_iber_8sd_conv set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"21"%';
update th_ibercomp_sonda set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"21"%';
update th_md02 set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"21"%';
update th_rasp_dali_e set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"21"%';
update th_rasp_dali_s set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"21"%';
update th_rasp_ds18b20  set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"21"%';
update th_rasp_ed  set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"21"%';
update th_rasp_pulsador set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"21"%';
update th_rasp_sd  set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"21"%';
update th_somfy_50_e set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"21"%';
update th_somfy_50_s set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"21"%';
update th_somfy_rts_e set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"21"%';
update th_somfy_rts_s set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"21"%';

-- comedor alejandro
update th_iber_8ed_conv set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"65"%';
update th_iber_8sd_conv set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"65"%';
update th_ibercomp_sonda set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"65"%';
update th_md02 set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"65"%';
update th_rasp_dali_e set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"65"%';
update th_rasp_dali_s set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"65"%';
update th_rasp_ds18b20  set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"65"%';
update th_rasp_ed  set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"65"%';
update th_rasp_pulsador set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"65"%';
update th_rasp_sd  set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"65"%';
update th_somfy_50_e set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"65"%';
update th_somfy_50_s set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"65"%';
update th_somfy_rts_e set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"65"%';
update th_somfy_rts_s set argumentos = REPLACE(argumentos,'"group":""','"group":"1"') where modulo = 4 and argumentos like '%"room":"65"%';


-- GRUPO 2
-- despensa
update th_iber_8ed_conv set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"50"%';
update th_iber_8sd_conv set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"50"%';
update th_ibercomp_sonda set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"50"%';
update th_md02 set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"50"%';
update th_rasp_dali_e set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"50"%';
update th_rasp_dali_s set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"50"%';
update th_rasp_ds18b20  set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"50"%';
update th_rasp_ed  set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"50"%';
update th_rasp_pulsador set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"50"%';
update th_rasp_sd  set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"50"%';
update th_somfy_50_e set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"50"%';
update th_somfy_50_s set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"50"%';
update th_somfy_rts_e set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"50"%';
update th_somfy_rts_s set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"50"%';


-- cocina alejandro
update th_iber_8ed_conv set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"17"%';
update th_iber_8sd_conv set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"17"%';
update th_ibercomp_sonda set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"17"%';
update th_md02 set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"17"%';
update th_rasp_dali_e set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"17"%';
update th_rasp_dali_s set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"17"%';
update th_rasp_ds18b20  set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"17"%';
update th_rasp_ed  set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"17"%';
update th_rasp_pulsador set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"17"%';
update th_rasp_sd  set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"17"%';
update th_somfy_50_e set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"17"%';
update th_somfy_50_s set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"17"%';
update th_somfy_rts_e set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"17"%';
update th_somfy_rts_s set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"17"%';



-- cocina
update th_iber_8ed_conv set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"15"%';
update th_iber_8sd_conv set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"15"%';
update th_ibercomp_sonda set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"15"%';
update th_md02 set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"15"%';
update th_rasp_dali_e set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"15"%';
update th_rasp_dali_s set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"15"%';
update th_rasp_ds18b20  set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"15"%';
update th_rasp_ed  set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"15"%';
update th_rasp_pulsador set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"15"%';
update th_rasp_sd  set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"15"%';
update th_somfy_50_e set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"15"%';
update th_somfy_50_s set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"15"%';
update th_somfy_rts_e set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"15"%';
update th_somfy_rts_s set argumentos = REPLACE(argumentos,'"group":""','"group":"2"') where modulo = 4 and argumentos like '%"room":"15"%';

-- GRUPO 3

-- cocina
update th_iber_8ed_conv set argumentos = REPLACE(argumentos,'"group":""','"group":"3"') where modulo = 4 and argumentos like '%"room":"52"%';
update th_iber_8sd_conv set argumentos = REPLACE(argumentos,'"group":""','"group":"3"') where modulo = 4 and argumentos like '%"room":"52"%';
update th_ibercomp_sonda set argumentos = REPLACE(argumentos,'"group":""','"group":"3"') where modulo = 4 and argumentos like '%"room":"52"%';
update th_md02 set argumentos = REPLACE(argumentos,'"group":""','"group":"3"') where modulo = 4 and argumentos like '%"room":"52"%';
update th_rasp_dali_e set argumentos = REPLACE(argumentos,'"group":""','"group":"3"') where modulo = 4 and argumentos like '%"room":"52"%';
update th_rasp_dali_s set argumentos = REPLACE(argumentos,'"group":""','"group":"3"') where modulo = 4 and argumentos like '%"room":"52"%';
update th_rasp_ds18b20  set argumentos = REPLACE(argumentos,'"group":""','"group":"3"') where modulo = 4 and argumentos like '%"room":"52"%';
update th_rasp_ed  set argumentos = REPLACE(argumentos,'"group":""','"group":"3"') where modulo = 4 and argumentos like '%"room":"52"%';
update th_rasp_pulsador set argumentos = REPLACE(argumentos,'"group":""','"group":"3"') where modulo = 4 and argumentos like '%"room":"52"%';
update th_rasp_sd  set argumentos = REPLACE(argumentos,'"group":""','"group":"3"') where modulo = 4 and argumentos like '%"room":"52"%';
update th_somfy_50_e set argumentos = REPLACE(argumentos,'"group":""','"group":"3"') where modulo = 4 and argumentos like '%"room":"52"%';
update th_somfy_50_s set argumentos = REPLACE(argumentos,'"group":""','"group":"3"') where modulo = 4 and argumentos like '%"room":"52"%';
update th_somfy_rts_e set argumentos = REPLACE(argumentos,'"group":""','"group":"3"') where modulo = 4 and argumentos like '%"room":"52"%';
update th_somfy_rts_s set argumentos = REPLACE(argumentos,'"group":""','"group":"3"') where modulo = 4 and argumentos like '%"room":"52"%';

-- GRUPO 4

-- terraza sala tv
update th_iber_8ed_conv set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"72"%';
update th_iber_8sd_conv set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"72"%';
update th_ibercomp_sonda set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"72"%';
update th_md02 set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"72"%';
update th_rasp_dali_e set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"72"%';
update th_rasp_dali_s set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"72"%';
update th_rasp_ds18b20  set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"72"%';
update th_rasp_ed  set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"72"%';
update th_rasp_pulsador set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"72"%';
update th_rasp_sd  set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"72"%';
update th_somfy_50_e set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"72"%';
update th_somfy_50_s set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"72"%';
update th_somfy_rts_e set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"72"%';
update th_somfy_rts_s set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"72"%';

-- ropero
update th_iber_8ed_conv set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"51"%';
update th_iber_8sd_conv set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"51"%';
update th_ibercomp_sonda set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"51"%';
update th_md02 set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"51"%';
update th_rasp_dali_e set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"51"%';
update th_rasp_dali_s set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"51"%';
update th_rasp_ds18b20  set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"51"%';
update th_rasp_ed  set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"51"%';
update th_rasp_pulsador set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"51"%';
update th_rasp_sd  set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"51"%';
update th_somfy_50_e set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"51"%';
update th_somfy_50_s set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"51"%';
update th_somfy_rts_e set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"51"%';
update th_somfy_rts_s set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"51"%';

-- vest cocina
update th_iber_8ed_conv set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"49"%';
update th_iber_8sd_conv set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"49"%';
update th_ibercomp_sonda set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"49"%';
update th_md02 set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"49"%';
update th_rasp_dali_e set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"49"%';
update th_rasp_dali_s set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"49"%';
update th_rasp_ds18b20  set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"49"%';
update th_rasp_ed  set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"49"%';
update th_rasp_pulsador set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"49"%';
update th_rasp_sd  set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"49"%';
update th_somfy_50_e set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"49"%';
update th_somfy_50_s set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"49"%';
update th_somfy_rts_e set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"49"%';
update th_somfy_rts_s set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"49"%';


-- vestibulo sala/tv
update th_iber_8ed_conv set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"48"%';
update th_iber_8sd_conv set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"48"%';
update th_ibercomp_sonda set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"48"%';
update th_md02 set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"48"%';
update th_rasp_dali_e set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"48"%';
update th_rasp_dali_s set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"48"%';
update th_rasp_ds18b20  set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"48"%';
update th_rasp_ed  set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"48"%';
update th_rasp_pulsador set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"48"%';
update th_rasp_sd  set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"48"%';
update th_somfy_50_e set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"48"%';
update th_somfy_50_s set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"48"%';
update th_somfy_rts_e set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"48"%';
update th_somfy_rts_s set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"48"%';

-- vest biblio
update th_iber_8ed_conv set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"47"%';
update th_iber_8sd_conv set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"47"%';
update th_ibercomp_sonda set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"47"%';
update th_md02 set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"47"%';
update th_rasp_dali_e set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"47"%';
update th_rasp_dali_s set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"47"%';
update th_rasp_ds18b20  set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"47"%';
update th_rasp_ed  set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"47"%';
update th_rasp_pulsador set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"47"%';
update th_rasp_sd  set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"47"%';
update th_somfy_50_e set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"47"%';
update th_somfy_50_s set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"47"%';
update th_somfy_rts_e set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"47"%';
update th_somfy_rts_s set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"47"%';

-- bar
update th_iber_8ed_conv set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"20"%';
update th_iber_8sd_conv set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"20"%';
update th_ibercomp_sonda set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"20"%';
update th_md02 set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"20"%';
update th_rasp_dali_e set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"20"%';
update th_rasp_dali_s set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"20"%';
update th_rasp_ds18b20  set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"20"%';
update th_rasp_ed  set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"20"%';
update th_rasp_pulsador set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"20"%';
update th_rasp_sd  set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"20"%';
update th_somfy_50_e set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"20"%';
update th_somfy_50_s set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"20"%';
update th_somfy_rts_e set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"20"%';
update th_somfy_rts_s set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"20"%';

-- terraza sala cine
update th_iber_8ed_conv set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"18"%';
update th_iber_8sd_conv set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"18"%';
update th_ibercomp_sonda set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"18"%';
update th_md02 set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"18"%';
update th_rasp_dali_e set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"18"%';
update th_rasp_dali_s set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"18"%';
update th_rasp_ds18b20  set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"18"%';
update th_rasp_ed  set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"18"%';
update th_rasp_pulsador set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"18"%';
update th_rasp_sd  set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"18"%';
update th_somfy_50_e set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"18"%';
update th_somfy_50_s set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"18"%';
update th_somfy_rts_e set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"18"%';
update th_somfy_rts_s set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"18"%';

-- entrada principal
update th_iber_8ed_conv set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"16"%';
update th_iber_8sd_conv set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"16"%';
update th_ibercomp_sonda set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"16"%';
update th_md02 set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"16"%';
update th_rasp_dali_e set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"16"%';
update th_rasp_dali_s set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"16"%';
update th_rasp_ds18b20  set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"16"%';
update th_rasp_ed  set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"16"%';
update th_rasp_pulsador set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"16"%';
update th_rasp_sd  set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"16"%';
update th_somfy_50_e set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"16"%';
update th_somfy_50_s set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"16"%';
update th_somfy_rts_e set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"16"%';
update th_somfy_rts_s set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"16"%';

-- baño cortesia
update th_iber_8ed_conv set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"73"%';
update th_iber_8sd_conv set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"73"%';
update th_ibercomp_sonda set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"73"%';
update th_md02 set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"73"%';
update th_rasp_dali_e set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"73"%';
update th_rasp_dali_s set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"73"%';
update th_rasp_ds18b20  set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"73"%';
update th_rasp_ed  set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"73"%';
update th_rasp_pulsador set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"73"%';
update th_rasp_sd  set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"73"%';
update th_somfy_50_e set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"73"%';
update th_somfy_50_s set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"73"%';
update th_somfy_rts_e set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"73"%';
update th_somfy_rts_s set argumentos = REPLACE(argumentos,'"group":""','"group":"4"') where modulo = 4 and argumentos like '%"room":"73"%';



-- cambiar de planta 4 a 5 el pasillo de habitaciones estancia 19
update th_rasp_dali_e set argumentos = REPLACE(argumentos,'"floor":"4"','"floor":"5"') where modulo = 4 and argumentos like '%"room":"19"%';
update th_rasp_dali_s set argumentos = REPLACE(argumentos,'"floor":"4"','"floor":"5"') where modulo = 4 and argumentos like '%"room":"19"%';
update th_rasp_ds18b20  set argumentos = REPLACE(argumentos,'"floor":"4"','"floor":"5"') where modulo = 4 and argumentos like '%"room":"19"%';
update th_rasp_ed  set argumentos = REPLACE(argumentos,'"floor":"4"','"floor":"5"') where modulo = 4 and argumentos like '%"room":"19"%';
update th_rasp_pulsador set argumentos = REPLACE(argumentos,'"floor":"4"','"floor":"5"') where modulo = 4 and argumentos like '%"room":"19"%';
update th_rasp_sd  set argumentos = REPLACE(argumentos,'"floor":"4"','"floor":"5"') where modulo = 4 and argumentos like '%"room":"19"%';
update th_somfy_50_e set argumentos = REPLACE(argumentos,'"floor":"4"','"floor":"5"') where modulo = 4 and argumentos like '%"room":"19"%';
update th_somfy_50_s set argumentos = REPLACE(argumentos,'"floor":"4"','"floor":"5"') where modulo = 4 and argumentos like '%"room":"19"%';

-- cambiar de planta 4 a 8 la escalera servicio estancia 68
update th_rasp_dali_e set argumentos = REPLACE(argumentos,'"floor":"4"','"floor":"8"') where modulo = 4 and argumentos like '%"room":"68"%';
update th_rasp_dali_s set argumentos = REPLACE(argumentos,'"floor":"4"','"floor":"8"') where modulo = 4 and argumentos like '%"room":"68"%';
update th_rasp_ds18b20  set argumentos = REPLACE(argumentos,'"floor":"4"','"floor":"8"') where modulo = 4 and argumentos like '%"room":"68"%';
update th_rasp_ed  set argumentos = REPLACE(argumentos,'"floor":"4"','"floor":"8"') where modulo = 4 and argumentos like '%"room":"68"%';
update th_rasp_pulsador set argumentos = REPLACE(argumentos,'"floor":"4"','"floor":"8"') where modulo = 4 and argumentos like '%"room":"68"%';
update th_rasp_sd  set argumentos = REPLACE(argumentos,'"floor":"4"','"floor":"8"') where modulo = 4 and argumentos like '%"room":"68"%';
update th_somfy_50_e set argumentos = REPLACE(argumentos,'"floor":"4"','"floor":"8"') where modulo = 4 and argumentos like '%"room":"68"%';
update th_somfy_50_s set argumentos = REPLACE(argumentos,'"floor":"4"','"floor":"8"') where modulo = 4 and argumentos like '%"room":"68"%';
