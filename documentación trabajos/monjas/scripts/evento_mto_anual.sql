
DROP EVENT IF EXISTS evento_mto_anual;

DELIMITER ;;
/*!50106 DROP EVENT IF EXISTS `evento_mto_anual` */;;
/*!50106 CREATE*/ /*!50106 EVENT `evento_mto_anual` ON SCHEDULE EVERY 1 YEAR STARTS '2000-01-01 00:00:35' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN

   -- Duplico los casos ot del año anterior con el año actual
   INSERT INTO mto_ot (dia, tipo)
   (SELECT concat(YEAR(now()),'-',MONTH(dia),'-',DAY(dia),' ', TIME(dia)) as dia, tipo
   FROM mto_ot
   WHERE YEAR(dia) = YEAR(now())- INTERVAL 1 YEAR);

   -- Duplico los casos relacion_ot_programa del año anterior con el año actual
   INSERT INTO mto_relacion_ot_programa (codigo_ot, codigo_programa, estado)
   (SELECT codigo_ot, codigo_programa, estado FROM mto_relacion_ot_programa as a
   INNER JOIN mto_ot as b ON b.id = a.codigo_ot
   WHERE YEAR(b.dia) = YEAR(now())- INTERVAL 1 YEAR);

   -- En mto_relacion_sesion no hay que hacer nada

   -- Por cada cada codigo_programa excepto cojo el programa al que pertenece para cambiar
   -- el valor del codigo_programa excepto por el codigo_programa al que pertenece
   BLOCK2: BEGIN
      DECLARE done_prog INT DEFAULT 0;
      DECLARE cod_ot INT;
      DECLARE cod_prog_exce INT;
      DECLARE cod_prog INT;

      DECLARE cursor_ot_programa CURSOR FOR SELECT a.codigo_ot,a.codigo_programa
      FROM mto_relacion_ot_programa as a
      INNER JOIN mto_ot as b ON b.id = a.codigo_ot
      INNER JOIN mto_programa as c ON a.codigo_programa = c.id AND c.excepto = 1
      WHERE YEAR(b.dia) = YEAR(now());

      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done_prog = 1;

      OPEN cursor_ot_programa;

      ot_prog_loop: LOOP

      FETCH cursor_ot_programa INTO cod_ot, cod_prog_exce;

      IF done_prog THEN
      LEAVE ot_prog_loop;
      END IF;

      IF cod_prog_exce IS NOT NULL THEN
         SELECT id
         INTO cod_prog
         FROM mto_programa WHERE nemo = (SELECT nemo from mto_programa where id = cod_prog_exce) and excepto = 0;

         UPDATE mto_relacion_ot_programa SET codigo_programa = cod_prog
         WHERE codigo_ot = cod_ot;
      END IF;

      END LOOP;

      CLOSE cursor_ot_programa;
   END BLOCK2;
END */ ;;
DELIMITER ;;
