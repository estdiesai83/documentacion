use sistema_pr_montecerrado;

delete from mto_programa  where id = 1;
delete from mto_elemento_trb where id = 1;
delete from mto_modo where id = 1;
-- borra operaciones (11, 12, 13, 14 y 15)
delete from mto_sesion where id = 1;
delete from mto_ot where id = 25;
