### Notificacion:

Controladores:

1. ##### Notificacion/enviarNotificacionTemaApi(tema,  titulo, mensaje) -> Notifications/SendNotificationThemeApi(theme, title, message)

   ```
   tema     -> Grupo al que se va a enviar la notificacion
   titulo   -> Titulo de la notificacion
   mensaje  -> Cuerpo de la notificacion
   ```

   Envia una notificacion con los valores de los argumentos y retorna Codigo de estado obtenido del plugin

2. ##### Notificacion/enviarNotificacionUsuarioApi(quien, titulo, mensaje) -> Notifications/sendNotificationUserApi(who, title, message)

   ```
   quien    -> A quien se quiere enviar la notificacion
   titulo   -> Titulo de la notificacion
   mensaje  -> Cuertpo de la notificacion
   ```

   Obtiene el token del usuario correspondiente a who

   Envia una notificacion y retorna el  Codigo de estado obtenido del plugin o  1 si no se encuentra el token

3. ##### Notificacion/usuarioClave -> Notifications/userPassword

   ```
   data: 
   1. clave -> key
   ```

   Comprueba la contraseña y retorna el id si es valida la key

4. ##### Notificacion/comprobarIdUsuario -> Notifications/checkUserId

   ```
   data:
   1. quien -> who
   ```

   Verifica si existe el usuario

5. ##### Notificacion/enviarNotificacionTemaWeb -> Notifications/SendNotificationThemeWeb

   ```
   data:
   1. id -> id  -> Grupo al que se va a enviar la notificacion
   2. titulo -> title -> Titulo de la notificacion
   3. mensaje -> message -> Cuertpo de la notificacion
   
   * RESPUESTA
   * 0 -> Todo bien
   * 1 -> Ha ocurrido un error
   ```

Envia una notificacion 

##### 	6. Notifications/sendNotificationUserWeb	

```
data: 
  quien    -> A quien se quiere enviar la notificacion
  titulo   -> Titulo de la notificacion
  mensaje  -> Cuertpo de la notificacion
  
RESPUESTA
0 -> Todo bien
1 -> No se encuentra el token
2 -> Ha ocurrido un error
```

Envia una notificacion

##### 7. Notificacion/actualizarToken -> Notifications/updateToken

```
data:
1. quien -> who -> Usuario al que se le va a actualizar el token
2. token -> token -> Token nuevo
    
RESPUESTA
0 -> Todo bien
1 -> El usuario no existe
```

Actualiza el token de un usuario

##### 8. Notificacion/escribirEstadoNotificacion -> Notifications/writeStatusNotification

```
data:
1. codigonotificacion -> not_code
```

##### 9. Notificacion/leerNotificaciones -> Notifications/readNotifications

```
data:
1. codigousuario -> user_code

RESPUESTA
0 -> No hay notificaciones
* array -> Notificaciones
```

Lee las notificaciones para dicho codigo usuario

##### 10. Notificacion/leerNotificacionesPendientes -> Notifications/readNotificationsPendientes

```
data:
1. codigousuario -> user_code

RESPUESTA
0 -> No hay notificaciones
* array -> Notificaciones
```

Lee las notificaciones pendientes

##### 11. Notificacion/readNotificationsLeidas -> Notifications/readNotificationsRead

```
data:
1. codigousuario -> user_code

RESPUESTA
0 -> No hay notificaciones
* array -> Notificaciones
```

Lee las notificaciones leidas

##### 12. Notificacion/marcarNotificacionLeida -> Notifications/markNotificationLeida

```
data:
1. tipo -> type
```

Escribe leido en las notificaciones segun el tipo para dicho id

##### 13. Notificacion/marcarNotificacionPendiente -> Notifications/markNotificationPending

```
data:
1. id
2. tipo -> type
```

Escribe pendiente en las notificaciones segun el tipo para dicho id



Modelos:

1. ##### Notificacion/enviarNotificacionUsuario -> Notifications/sendNotificationUser(token, title, message,  transmitter)

   Envia una notificacion

2. ##### Notificacion/obtenerusuarioclave -> Notifications/getUserKey(key)

   Lee de la tabla "usuario" los valores de los tdatos (id y clave) donde activo sea 0, comprueba la contraseña (key con la clave leida) y si es devuelve un array con respuesta 0 y el id leido

3. ##### Notificacion/verificarIdUsuario -> Notifications/verifyUserId(id)

   Mira en la tabla "usuario" si hay algun caso para el id correspondiente y activo sea 0

4. ##### Notificacion/actualizarTokenUsuario -> Notifications/updateTokenUser(who, token)

   Escribe en la tabla "usuario" en el tdato token el valor del argumento token en el caso donde id sea igual a who

5. ##### Notificacion/obtenerTokenUsuario -> Notifications/getTokenUser(who)

   Lee de la tabla "appteho"

6. ##### Notificacion/escribirNotificacionPost -> Notifications/writeNotificationPost(post_code, transmitter, receptor, tcaso_type)

   Crea caso en la tabla "notificaciones" escribiendo en los tdatos (codigo, estado, emisor, receptor, tipotcaso) con los valores (post_code, 'E', transmitter, receptor, tcaso_type)

7. ##### Notificacion/obtenerNotificaciones -> Notifications/getNotifications(user_code)

   Lee de la tabla tpa los casos donde situacion es 'E' o 'NE'

   Lee de la tabla "notificaciones" los valores de los tdatos (fecha, estado), de la tabla "usuario" los valores de (nemo) y de la tabla "post" el valor de texto donde receptor sea igual al valor de user_code y tipotcaso sea 0

   Lee de la tabla "notificaciones" los valores de los tdatos (fecha, estado), de la tabla "usuario" los valores de (nemo) y de la tabla "post" el valor de texto donde receptor sea igual al valor de user_code y tipotcaso sea 1

8. ##### Notificacion/getNotificationsPendientes -> Notifications/getPendingNotifications(user_code)

   Lee de la tabla "tpas" los casos donde situacion es 'EP' o 'NP'

9. ##### Notificacion/leerNotificacionesLeidas -> Notifications/readNotificationsRead(user_code)

   Lee de la tabla tpa los casos donde situacion es 'EL' o 'NEL'

   Lee de la tabla "notificaciones" los valores de los tdatos (fecha, estado), de la tabla "usuario" los valores de (nemo) y de la tabla "post" el valor de texto donde receptor sea igual al valor de user_code y tipotcaso sea 0

   Lee de la tabla "notificaciones" los valores de los tdatos (fecha, estado), de la tabla "usuario" los valores de (nemo) y de la tabla "post" el valor de texto donde receptor sea igual al valor de user_code y tipotcaso sea 1

10. ##### Notificacion/escribirNotificacionLeida -> Notifications/writeNotificationRead(id, type)

    Si tipo  es 0: Lee de la tabla "tpas" los casos donde id sea igual al argumento id, y por cada caso escribe en la tabla "tpas" dependiendo de la situacion que tenga el no leido. E-> EL, NE-> NEL

11. ##### Notificacion/escribirNotificacionPendiente -> Notifications/writeNotificationPending(id, type)

    Si tipo  es 0: Lee de la tabla "tpas" los casos donde id sea igual al argumento id, y por cada caso escribe en la tabla "tpas" dependiendo de la situacion que tenga el no leido

    Si tipo es 1: Escribe en tabla "notificaciones" en los casos leidos el valor de la situacion a 'EP'