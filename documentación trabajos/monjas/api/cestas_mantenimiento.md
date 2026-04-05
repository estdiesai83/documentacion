# MODULO MANTENIMIENTO

## 

### 1. Maintenance/createMode 

```
data:
1. nemo
3. color
4. type
5. operations: [{id, nemo, timer, status}]

Respuesta:
mode: {
	id, (id modo)
	operations[{id, nemo}]
}
```

1. Crea modo: crea caso en la tabla 'mto_modo' con los valores (nemo, color, type) y cojo el id del modo creado
2. Por cada valor del array operations, 
   1. Coge los elementos correspondientes (lee tabla 'mto_elemento_trb', los casos donde id = id)
   2. Lee las acciones (lee tabla 'mto_accion_auto')
   3. Crea operaciones: 
      1. crea caso en tabla 'mto_operacion' con los valores del array operations
      2. crea caso en tabla 'mto_relacion_operacion', con el id de la operacion creada, id e id (accion)
      3. crea caso en tabla 'mto_relacion_modo' con el id operacion y el id modo
      4. crea caso en tabla 'mto_relacion_tareaini' con el id operacion y el codigotareaini
      5. crea caso en tabla 'mto_relacion_tareafin' con el id operacion y el codigotareafin
      6. Guarda en variable tiempo el valor de timer, si es mayor que al valor que tenga la variable tiempo en ese momento, inicialmente el valor de dicha variable es el valor del primer valor de timer, siempre que su estado correspondiente sea 1
3. Escribe en el modo creado en el tdato tiempo el valor de la variable tiempo.



### 2. Maintenance/createSession

```
data:
1. nemo
3. hour
4. status
5. mode
6. type
7. operations: [{id, nemo, timer, status}]
8. dates:[date]

Respuesta:
session: {
	id, (id sesion)
	operations[{id, nemo}]
}
```



1. Crea sesion: crea caso en la tabla 'mto_sesion' con los valores (nemo, hour, mode y status) y cojo el id de la sesion creada
2. Por cada valor del array operations, 
   1. Coge los elementos correspondientes (lee tabla 'mto_elemento_trb', los casos donde id = id)
   2. Lee las acciones (lee tabla 'mto_accion_auto')
   3. Crea operaciones: 
      1. crea caso en tabla 'mto_operacion' con los valores del array operations
      2. crea caso en tabla 'mto_relacion_operacion', con el id de la operacion creada, id e id (accion)
      3. crea caso en tabla 'mto_relacion_tareaini' con el id operacion y el codigotareaini
      4. crea caso en tabla 'mto_relacion_tareafin' con el id operacion y el codigotareafin
      5. crea caso en tabla 'mto_relacion_sesion' con el id operacion y el id sesion
      6. Guarda en variable tiempo el valor de timer, si es mayor que al valor que tenga la variable tiempo en ese momento, inicialmente el valor de dicha variable es el valor del primer valor de timer,  siempre que su estado correspondiente sea 1
3. Escribe en la sesion creada en el tdato tiempo el valor de la variable tiempo.
4. Por cada valor del array date: Miro si existe caso en tabla 'mto_ot'
   1. si existe: cojo codigo_ot (id tabla 'mto_ot') y creo caso en tabla 'mto_relacion_ot_sesion' con el codigoot, id_sesion_creada y status
   2. Si no existe: 
      1. Crea caso en tabla 'mto_ot' y cojo el id de la ot
      2. Crea caso en tabla 'mto_relacion_ot_sesion' con el id de la ot  y sesion creadas mas el valor de status



### 3. Maintenance/createProgram

```
data:
1. nemo
2. color
3. type
4. sessions: [{id, nemo, hour, status, mode, 
			 operations: [{id, nemo, timer, status}]}]

Respuesta:
program: {
	id, (id programa)
	sessions: [{id, nemo,  
			 operations: [{id, nemo}]}]
}
```



1. Por cada valor de sessions: Crea sesion: crea caso en la tabla 'mto_sesion' con los valores (nemo, hour, mode y status) y cojo el id de la sesion creada
2. Por cada valor del array operations, 
   1. Coge los elementos correspondientes (lee tabla 'mto_elemento_trb', los casos donde id = id)
   2. Lee las acciones (lee tabla 'mto_accion_auto')
   3. Crea operaciones: 
      1. crea caso en tabla 'mto_operacion' con los valores del array operations
      2. crea caso en tabla 'mto_relacion_operacion', con el id de la operacion creada, id e id (accion)
      3. crea caso en tabla 'mto_relacion_tareaini' con el id operacion y el codigotareaini
      4. crea caso en tabla 'mto_relacion_tareafin' con el id operacion y el codigotareafin
      5. crea caso en tabla 'mto_relacion_sesion' con el id operacion y el id sesion
      6. Guarda en variable tiempo el valor de timer, si es mayor que al valor que tenga la variable tiempo en ese momento, inicialmente el valor de dicha variable es el valor del primer valor de timer,  siempre que su estado correspondiente sea 1
3. Escribe en la sesion creada en el tdato tiempo el valor de la variable tiempo.
4. Crea programa: crea caso en tabla 'mto_programa' con los valores (nemo, color, type), por defecto excepto tendrá 0 y cojo el id del programa creado
5. Creo caso en tabla 'mto_relacion_programa' con el id de la sesion y programa creados



### 4.Maintenance/assignProgram

```
data:
1. id (id programa)
2. dates[date]
3. type

Respuesta:
code:0
```

1. Busco el dia en la tabla 'mto_ot'
   1. si existe cojo el codigo ot y Borro caso donde codigoot sea igual a codigo ot y creo caso en 'mto_relacion_ot_programa' con el id y el codigo ot
   2. Si no existe:
      1. Creo caso en 'mto_ot' y cojo su id (codigo ot)
      2. Borro caso donde codigoot sea igual a codigo ot
      3. creo caso en 'mto_relacion_ot_programa' con el id y el codigo ot





### 5. Maintenance/createProgramExcept

```
data: 
1. id: id_programa
2. date
3. program: [{nemo, color, type
			   sesions: [{id, nemo, hour, status, mode, 
			             operations: [{id, nemo, timer, status}]}]
              }]
              

Respuesta:
program: {
	id, (id programa)
	sesions: [{id, nemo,  
			 operations: [{id, nemo}]}]
}
```

1. Crea operaciones, sesion,... idem a crear Programa pero con excepto =1 y cojo el id programa

2. Busco en relacion_ot  el caso para el codigo ot (donde la fecha coincida con date) y codigo_programa = id programa (que llega en data) y actualizo el valor con el id del programa nuevo

   

### 6. Maintenance/removeOtFromDay

```
data:
1. dates[]
2. type

Respuesta:
code:0
```

1. Borro casos de 'mto_ot', mto_relacion_ot_programa' y 'mto_relacion_ot_sesion' 

*** Pendiente: mirar el programa, si es excepto borro todo (operacion, sesion, ), menos elementos y accion (estos nunca se pueden borrar)



### 7. Maintenance/modifySession

```
data:
1. id, (id sesion)
2. sessions: [{id, nemo, hour, status, mode, 
 			   operations: [{id, nemo, timer, status}]}]
```

En la sesion identificada por id (id sesion) escribe los valores de hour y status en 'mto_sesion'

En las operaciones escribe timer y status para los id's de las operaciones



### 8.readIrrigation

1. Se la llama desde el controlador de getConfig

   internamente llama a :

   1. readElements: lee todos los elementos de la tabla 'mto_elemento_trb'
   2. readModes: lee todos los modos de la tabla 'mto_modo' con sus respectivas operaciones (los valores a devolver en el array operaciones, el id y el nemo pertenencen a la operacion)
   3. readPrograms: **lee todos los programas** de la tabla 'mto_programas' con sus repectivas sesiones y cada sesion con sus respectivas operaciones con **excepto = 0**
   4. readCalendar: lee de la tabla 'mto_ot' los casos que hay y por cada caso (dia) lee sus respectivos programas y sesiones (cada uno con sus repectivas operaciones)
   5. readHistorical: lee de la tabla 'mto_sesion_historico'
   6. readProvided: lee de la tabla 'mto_sesion_previsto'
   
   
   
   ```json
   Respuesta:
   irrigation =  {
   	calendar: [
           {
               date: '', (fotmato javasctipt),
            	programs: [ {id, color, nemo, except, 
           				   sessions[{id,nemo,hour,status, 
        							     operations[{id, nemo, timer, status}], 
        							     historical :[ { init_hour, end_hour, action, 
               			  							 operations[{ nemo, timer, status}],
   												 }]
               			  			 provided : { timer, hour, status, 
               			  			   			  operations[{nemo, timer, status}],
   									 			}
   									 mode: //1 -> sesion, 2 -> manual
                           }],
               sessions :[ { id, nemo, hour, status, 
               			  operations[{id, nemo, timer, status}],            			  
               			  historical :[ { init_hour, end_hour, action, 
               			  				operations[{ nemo, timer, status}],
   										}]
               			  provided : { timer, hour, status, 
               			  			   operations[{nemo, timer, status}],
   									 }
   						}]
           }
       ],
   	modes:[
           { 
               id, color, nemo, operations[{id, nemo, timer, status}]
   		}
   	], 
       programs : [
            {
                id, color, nemo, execpt, sessions: [{id,nemo,hour,status, 
           							 			operations[{id, nemo, timer, status}], 
   		}
       ],
   elements : [
   			{ id, nemo }
       ],
   }
   ```
   
   

Modificaciones en las estructuras de las tablas mto:

Eliminadas las relaciones (claves foraneas):

1. **mto_relacion_ot_programa** 
   1. con mto_ot para coger los codigo_programa pertenenecientes a la ot, para eliminar dicho programa si este es excepto cuando se borre una ot
   2. con mto_programa para coger los codigo_ot al que esta asignado dicho programa, para eliminar dicha ot cuando se elimine un programa
2. **mto_relacion_ot_sesion** con mto_ot para coger los codigo_sesion pertenenecientes a la ot, para eliminar dicha sesion
3. **mto_relacion_programa** 
   1. con mto_programa para coger la sesion pertenenciente al programa a eliminar, para poder eliminar dicha sesion
   2. con mto_sesion para coger el programa y si solo tiene una sesion, eliminar el programa
4. mto_relacion_tareaini y mto_relacion_tareafin para coger el codigo_tarea cuando se borra una operacion, para borrar la tarea que corresponda
5. mto_relacion_operacion con mto_elemento para coger codigo_operacion cuando se borra un elemento, para poder borrar las operaciones que correspondan



