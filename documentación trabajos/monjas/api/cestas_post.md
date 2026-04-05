# Cestas Post:

## Controladores:  

1. ### Post/writeImmediatePost

   ```
   data: 
   1. receptors (n receptores (token_id tabla rc)
   2. text
   3. transmitter (1 emisor (token_id tabla usuario))
   ```

   Obtiene el proximo valor del tdato pertenencia de la tabla "post", porque todos los casos que se creen en la tabla "post" va a tener el mismo valor de pertenencia.

   

   Si receptors es !=NULL

   - Crea post inmediato (caso en la tabla post con estado = 0 ) por cada emisor y destinatario

   - Por cada uno envia notificacion y escribe notificacion post (esta parte por ahora no se va a montar)

     

   Si receptors es NULL

   - Obtiene el id del emisor correpondiente

   - Crea post inmediato con el id obtenido (caso en la tabla post con estado = 0 por cada emisor y destinatario)

     Obtiene  el nombre y el token del emisor.

   	- Por cada uno envia notificacion y escribe notificacion post (esta parte por ahora no se va a montar)

   

2. ### Post/writeProgrammedPost

   ```
   data: 
   1. receptors (n receptores (token_id tabla rc)
   2. text
   3. transmitter (emisor)
   4. dia -> day
   5. mes -> month
   6. anio -> year
   7. hora -> hour
   8. minuto -> minute
   ```

   - Crea caso en tabla "post" escribiendo en (id, fecha, tipotcaso, texto, estado, activo, emisor, receptor, fechaanotacion) con los valores que llegan en data y estado = 4 (pendiente de enviar, es por anotacion).
   - Crea caso en tabla tarea con tipo = bd
   - Crea caso en la tabla tarea_bd , un caso por casa receptor y por cada transmisor
     - un caso con tipo = insert para que cree caso en tabla "historicopost"
     - otro caso con tipo = update para que cambie el valor del estado 4 a 0 para el post con codigo_post x 

   

   Nota: los casos de las tablas tarea se ejecutan cuando cumpla la fecha. 

   

   

3. ### Post/writeConversationPost

   ```
   data: 
   1. receptors (n receptores (token_id tabla rc)
   2. text
   3. post_code (codigo post)
   ```

   Obtiene  el nombre y el token del emisor, por cada uno envia notificacion y escribe notificacion post y escribie en tabla post

   

4. ### Post/readPost

   ```
   data:
   1. post_code (codigo post)
   ```

   Lee el post correspondiente a post_code

   

5. ### Post/readConversationPost

   ```
   data:		
   1. post_code (codigo post)
   2. idusuario -> user_id
   ```

   Lee el post correspondiente a post_code y elimina caso de notificacion correspondiente a user_id

   

6. ### Post/readWhoDestinations

   ```php
   data:		
   
   1. location_id -> id ubicacion
   ```

   Lee de la tabla "Rc" los valores de los tdatos (id y nemo) para la ubicacion

   

7. ### Post/readHistoricalPost

   ```
   data:
   1. transmitter (emisor)
   ```

   Lee todos los post del emisor que correponda donde estado no sea 5

   

8. ### Post/showUsers

   ```
   data:
   1. transmitter (emisor)
   ```

   Lee los usuarios 

   

9. ### Post/readPostFiltered

   ```
   data:
   1. day_f (dia desde)
   2. month_f (mes desde)
   3. year_f  (año desde)
   4. day_u (dia hasta)
   5. month_u (mes hasta)
   6. year_u (año hasta)
   7. usuarios -> users
   8. transmitter (emisor) 
   ```

   Lee los post comprendidos en una fecha para un emisor y receptor determinado

   

10. ### Post/deletePostHistorical

    ```
    data:
    1. ids
    ```

    Elimina el post escribiendo en estado 5

    

11. ### Post/readPostUsers

    ```
    data:
    1. ids
    ```

    Lee los post correspondientes a los ids

    

12. ### Post/disablePostHistorical

    ```
    data:
    1. ids
    ```

    Escribe en "post" activo =1 en el id correspondiente

    Crea caso en historicopost

    

13. ### Post/activatePostHistorical

    ```
    data:
    1. ids
    ```

    Escribe en "post" activo = 0 en el id correspondiente

    Crea caso en historicopost

    

14. ### Post/readHistoricalProcess

```
data:
1. id
```

​	Lee de historicopost los post del id correspondiente



## Modelos:

1. ##### Post/createImmediatePost(receptors, text, transmitter)

   Lee de la tabla "post" el máximo valor del tdato (pertenencia) 

   Crea en la tabla "post" un caso por cada receptors, escribiendo en los tdatos (emisor, receptor, texto, estado, pertenencia, tipotcaso) con los valores (transmitter, receptor, text, 0, pertenencia leida y 0)

   

2. ##### Post/createConversationPost(receptors, text, transmitter, post_code)

   Crea en la tabla "post" un caso por cada receptors, escribiendo en los tdatos (emisor, receptor, texto, estado, codigopost y tipotcaso) con los valores (transmitter, receptor, texto, 0 y post_code)

   Devuelve el id del ultimo caso creado.

   

3. ##### Post/getPost(post_code)

   Lee de la tabla "post" los valores de los tdatos (id, fecha, texto) y de la tabla "usuario" el nemo(emisor) donde el el valor del tdato emisor de "post" sea igual al id de "usuario"  y donde el id de "post" sea igual al valor del argumento 

   post_code

   

4. ##### Post/getConversationPost(post_code, user_id)

   Lee de la tabla "post" los valores de los tdatos  (id, fecha (hora), texto, emisor y receptor) donde codigopost sea igual a post_code

   Por cada caso leido borra los casos de la tabla "notificaciones" donde codigo sea igual al id leido y receptor sea igual a user_id

   

5. ##### Post/getNameTransmitter(transmitter)

   Lee de la tabla "usuario" el valor del tdato (nemo) donde activo sea 0 e id sea igual a transmitter

   

6. ##### Post/getUserIdTeho(transmitter)

   Lee de la tabla "usuario" el valor del id donde tipo sea 2, activo sea 0 e id sea igual a transmiter

   

7. ##### Post/getTokenSendNotification(transmitter)

   Lee de la tabla "usuario" el valor de los tdatos (token e id) donde activo sea 0 e id sea igual a transmitter

   tipo = 2??? no se que significa cada valor de tipo

   

8. ##### Post/createScheduledPost(receptors, text, transmitter,day, month, year, hour, minute)

   Por cada valor del argumento receptors:

   ​	Crea caso en la tabla "usuario" escribiendo en los tdatos (emisor, receptor, texto, estado, fechaanotacion, tipotcaso 	) con los valores (transmitter, receptor, text, fecha* , 0)

   *fecha se forma con year-month-day hour:minute

   

9. ##### Post/getWhoDestinations

   Lee de la tabla "Usuario" los valores de los tdatos (id, nombre, y nemo) donde tipo =0 y activo =0

   

10. ##### Post/readPostHistorical(transmitter)

    Lee de la tabla "post" los valores de los tdatos (id, receptor, fecha, texto) y de la tabla "usuario" el nemo donde estado sea distinto a 5, emisor sea igual a transmitter y tipotcaso sea 0

    

11. ##### Post/leerUsuariosHistorico -> Post/readUsersHistorical(transmitter)

    Lee de la tabla "usuario" los valores de los tdatos ( id, nombre y nemo) donde los tipo sea 0 y activo sea 0

    

12. ##### Post/readPostFilteredHistorical(day_from, month_from, year_from, day_until, month_until, year_until, users, transmitter)

    Lee de la tabla "post" los valores de los tdatos (id, receptor, fecha, texto) y de la tabla "usuario el nemo donde estado sea distinto a 5, emisor sea igual a transmitter, tipotcaso sea 0 y fecha este comprendida entre desde* y hasta* y receptor sea igual a los  is del argumento users

    

13. ##### Post/deletePostHistorical(ids)

    Por cada id distinto que viene en el argumento ids, escribe en la tabla "post" estado = 5 y en fecha la fecha actual en los casos donde id sea igual a cada id distinro que viene el en argumento ids*

    ids* : cada id va separado por ,

    

14. ##### Post/getPostUsers(ids)

    Por cada id distinto que vine en el argumento ids*, lee de la tabla "post" los valores ( receptor, estado, activo, y fecha) y de la tabla "usuario" los valores de (nombre y nemo) donde el id de la tabla "post" sea igual a cada id distinto que viene en el argumento ids

    ids* : cada id va separado por ,

    

15. ##### Post/disableHistoricalPost(whose, id)

    Escribe en la tabla "post" ; activo = 1 donde id sea igual al argumento id

    Crea caso en la tabla "historicopost" escribiendo en los tdatos (codigopost (id tabla igual a id), estado) con el id tabla y 2)

    

16. ##### Post/activateHistoricalPost(whose, id)

    Escribe en la tabla "post" ; activo = 0 donde id sea igual al argumento id

    Crea caso en la tabla "historicopost" escribiendo en los tdatos (codigopost (id tabla igual a id), estado) con el id tabla y 2)

    

17. ##### Post/getHistoricalProcess(id)

    Lee de la tabla "historicopost" los valores de los tdatos (fecha, estado) donde codigopost sea igual al argumento id

    Por cada caso va llenado un array con la fecha en la primera posicion y en la posicion 1 guarda un valor dependiendo del estado, si estado es 0 devuelve 'enviado', si estado es 1 devuelve 'activado', si estado es 2 devuelve 'desactivado', si estado es 3 devuelve 'leido'







