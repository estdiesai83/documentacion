![mto_general](/home/esther/git/soa/documentacion/bd/imagenes/mto_general.png)





### TRIGGERS:

#### eliminar_mto_elemento:

1. coge las operaciones a las que pertenence el elemento de la tabla 'mto_relacion_operacion'
2. Si solo hay un elemento para dicha operacion, borra operacion de la tabla 'mto_operacion' (se lanza trigger_eliminar_mto_operacion)



#### eliminar_mto_operacion:

1. Coge codigo_tarea de las tablas 'mto_relacion_tareaini' y 'mto_relacion_tareafin' y borra caso en tabla tarea donde id = codigo_tarea
2. Borra casos 'mto_operacion_historico' donde codigo_operacion = OLD.id
3. Borra casos 'mto_operacion_previsto' donde codigo_operacion = OLD.id
4. Coge de tabla 'mto_operacion' el valor de codigo_sesion, si tiene valor mira cuantos casos tiene:
   1. si tiene mas de 1 borra elemento
   
   2. si tiene un caso: borrar sesion (caso en tabla 'mto_sesion' por tanto se lanza trigger eliminar_sesion)
   
   3. si no tiene valor (quiere decir que la operacion pertenence a un modo) y borra caso de relacion_modo
   
      

#### eliminar_mto_sesion:

1. Borra caso en mto_relacion_ot_sesion y si dicha ot, no tiene mas casos, elimino caso en 'mto_ot'
2. Borra caso en mto_relacion_programa y si dicho programa no tiene mas sesiones, elimino programa (SE LANZA TRIGGER eliminar_mto_programa)

#### eliminar_mto_modo:

1. Coge de 'mto_relacion_modo' los codigo_operacion pertenencientes a dicho modo y por cada uno borro caso en mto_operacion

2. Borro  caso en 'mto_relacion_modo' para cada operacion

   

