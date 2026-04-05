## Cestas Login-Authorithated:



#### Controladores: (pendiente documentar)

```
/* Posibles Valores devueltos en code:
\* 200 Ok 
\* 400 El servidor no recibe todos los datos que necesita
\* 401 no autorizado
\* 403 Prohibido el acceso
\* 500 Error interno servidor
\* 503 Servicio no disponible - ej error de base
*/
```



#### 1. Login/Login

```php
data: 
1. user
2. pass

Respuesta:
object(code) si es error
$reply : tipo, access_token, refresh_token, permision)
```

Loggea un usuario en el sistema con usuario y contrasena

Comprobamos si las credenciales son correctas

Si las credenciales son correctas, comprobamos el tipo de usuario del que se trata

Generamos estructura de datos para la sesion:            

```
$user_data = array(
	'user_data' => $user,
	'user_id' => $reply->id,
	'user_type' => $user->type,
	'user_specific_id' => $user->id,
	'keep_logged' => $data->keep_logged
);
```

 Generamos tokens

 Escribimos en BD el token de refresco

 Rellenamos datos para devolver

 Obtenemos los permisos del usuario

 Eliminamos datos que no tiene que llegar al cliente



#### 2. Login/LoginToken

```php
data: 
1. refresh_token

RESPUESTA
object(code) si es error
$reply : tipo, access_token, refresh_token, 
```

Loggea un usuario en el sistema con token

Comprobamos el token de verificacion

Comprobamos el tipo de usuario del que se trata

Generamos estructura de datos para la sesion:            

```
$user_data = array(
	'user_data' => $user,
	'user_id' => $reply->id,
	'user_type' => $user->type,
	'user_specific_id' => $user->id,
	'keep_logged' => true
);
```

Generamos tokens

Escribimos en BD el token de refresco

Rellenamos datos para devolver

Eliminamos datos que no tiene que llegar al cliente



#### 3.Login/logout

```php
Respuesta: 
object (code)
```

Termina la sesion

Borrar user id de la variable GLOBALS['DATA']   



#### 4. Login/refreshToken

```
data:
1. refresh_token

Respuesta:
object (code) si es error
$reply : tipo, access_token, refresh_token, 
```

Comprobamos si el token es correcto (verifyToken)

si el token es correcto:

	1. Comprobamos el tipo de usuario del que se trata (getUserType)
 	2. Generamos estructura de datos para guardar en sesion

​        

```
$user_data = array(
	'user_data' => $user,
	'user_id' => $reply->id,
	'user_type' => $user->type,
	'user_specific_id' => $user->id,
	'keep_logged' => $data->keep_logged
);
```

      3. Generamos tokens (generateAccessToken, generateRefreshToken;
         4. Rellenamos datos para devolver
         5. Escribimos en BD el token de refresco

         6. Eliminamos datos que no tiene que llegar al cliente



#### 5. Login/authenticate  

```
Respuesta:
object (code)
```

Comprueba la direccion de acceso



Funciones privates:

#### Login/getPermisions($id) 

1. Lee los permisos de la tabla usuario para el id dado.

2. Pasa el valor leido a hexadecimal

3. Retorna un array con los permisos en hexadecimal.

   









Información general:

**token_acceso (access_token):** Un **token de acceso** es un string aleatorio que identifica a un usuario y puede ser utilizado por la aplicación para realizar llamadas API. El **token** incluye información sobre cuándo expirará el **token** y qué aplicación generó el **token**.



**refresh_token:** Después de que un cliente (a través de una aplicación conectada) reciba un token de acceso, puede utilizar un token de actualización para obtener una nueva sesión cuando caduca su sesión vigente. El valor de tiempo de espera de sesión de la aplicación conectada determina el momento en que un token de acceso deja de ser válido y cuándo solicitar uno nuevo empleando un token de actualización.



El flujo del token de actualización incluye los siguientes pasos.

1. El aplicación conectada utiliza el token de actualización existente para [solicitar un nuevo token de acceso](https://help.salesforce.com/s/articleView?id=sf.remoteaccess_oauth_refresh_token_flow.htm&type=5#request_access_token).
2. Después de verificar la solicitud, Salesforce [otorga un nuevo token de acceso](https://help.salesforce.com/s/articleView?id=sf.remoteaccess_oauth_refresh_token_flow.htm&type=5#send_at_response) al cliente.



**JWT** (JSON Web Token): es un estándar abierto ( [RFC 7519](https://translate.google.com/website?sl=en&tl=es&prev=search&u=https://tools.ietf.org/html/rfc7519) ) que define una forma compacta y autónoma de transmitir información de forma segura entre las partes como un objeto JSON.

## ¿Cuándo debería usar tokens web JSON?

Estos son algunos escenarios en los que los tokens web JSON son útiles:

- **Autorización** : este es el escenario más común para usar JWT. Una vez que el usuario haya iniciado sesión, cada solicitud posterior incluirá el JWT, lo que permitirá al usuario acceder a rutas, servicios y recursos permitidos con ese token. El inicio de sesión único es una función que se usa ampliamente en JWT en la actualidad, debido a su pequeña sobrecarga y su capacidad para usarse fácilmente en diferentes dominios.
- **Intercambio de información** : los tokens web JSON son una buena manera de transmitir información de forma segura entre las partes. Debido a que los JWT se pueden firmar, por ejemplo, utilizando pares de claves pública/privada, puede estar seguro de que los remitentes son quienes dicen ser. Además, como la firma se calcula utilizando el encabezado y la carga útil, también puede verificar que el contenido no haya sido alterado.

 ¿Qué es la estructura del token web JSON?

En su forma compacta, los tokens web JSON constan de tres partes separadas por puntos ( `.`), que son:

- Encabezamiento
- Carga útil
- Firma

Por lo tanto, un JWT normalmente tiene el siguiente aspecto.

```
xxxxx.yyyyy.zzzzz
```

Vamos a desglosar las diferentes partes.

### Encabezamiento

El encabezado *generalmente* consta de dos partes: el tipo de token, que es JWT, y el algoritmo de firma que se utiliza, como HMAC SHA256 o RSA.

Por ejemplo:

```
{
  "alg": "HS256",
  "typ": "JWT"
}
```

Luego, este JSON está codificado en **Base64Url** para formar la primera parte del JWT.

### Carga útil

La segunda parte del token es la carga útil, que contiene las reclamaciones. Las reclamaciones son declaraciones sobre una entidad (normalmente, el usuario) y datos adicionales. Hay tres tipos de reclamos: *registrados* , *públicos* y *privados* .

- [**Reclamos registrados**](https://translate.google.com/website?sl=en&tl=es&prev=search&u=https://tools.ietf.org/html/rfc7519%23section-4.1) : se trata de un conjunto de reclamos predefinidos que no son obligatorios pero se recomiendan para proporcionar un conjunto de reclamos útiles e interoperables. Algunos de ellos son: **iss** (emisor), **exp** (tiempo de caducidad), **sub** (sujeto), **aud** (audiencia), entre[ otros](https://translate.google.com/website?sl=en&tl=es&prev=search&u=https://tools.ietf.org/html/rfc7519%23section-4.1) .

  > Tenga en cuenta que los nombres de los reclamos tienen solo tres caracteres, ya que JWT debe ser compacto.

- [**Reclamos públicos**](https://translate.google.com/website?sl=en&tl=es&prev=search&u=https://tools.ietf.org/html/rfc7519%23section-4.2) : estos pueden ser definidos a voluntad por aquellos que usan JWT. Pero para evitar colisiones, deben definirse en el[ Registro de tokens web JSON de IANA](https://translate.google.com/website?sl=en&tl=es&prev=search&u=https://www.iana.org/assignments/jwt/jwt.xhtml) o definirse como un URI que contenga un espacio de nombres resistente a colisiones.

- [**Reclamos privados**](https://translate.google.com/website?sl=en&tl=es&prev=search&u=https://tools.ietf.org/html/rfc7519%23section-4.3) : Son los reclamos personalizados creados para compartir información entre partes que acuerdan usarlos y no sonreclamos *registrados* ni *públicos .*

Un ejemplo de carga útil podría ser:

```
{
  "sub": "1234567890",
  "name": "John Doe",
  "admin": true
}
```

Luego, la carga útil se codifica en **Base64Url** para formar la segunda parte del token web JSON.

> Tenga en cuenta que para los tokens firmados esta información, aunque está protegida contra la manipulación, cualquiera puede leerla. No coloque información secreta en la carga útil o en los elementos del encabezado de un JWT a menos que esté encriptada.

### Firma

Para crear la parte de la firma, debe tomar el encabezado codificado, la carga útil codificada, un secreto, el algoritmo especificado en el encabezado y firmarlo.

Por ejemplo, si desea utilizar el algoritmo HMAC SHA256, la firma se creará de la siguiente manera:

```
HMACSHA256(
  base64UrlEncode(header) + "." +
  base64UrlEncode(payload),
  secret)
```

La firma se usa para verificar que el mensaje no se modificó en el camino y, en el caso de tokens firmados con una clave privada, también puede verificar que el remitente del JWT es quien dice ser.

### Poniendo todo junto

El resultado son tres cadenas de URL Base64 separadas por puntos que se pueden pasar fácilmente en entornos HTML y HTTP, mientras que son más compactas en comparación con los estándares basados en XML, como SAML.

A continuación, se muestra un JWT que tiene codificados el encabezado y la carga útiles anteriores, y está firmado con un secreto.![JWT codificado](https://cdn.auth0.com/content/jwt/encoded-jwt3.png)

## ¿Cómo funcionan los tokens web JSON?

En la autenticación, cuando el usuario inicia sesión correctamente con sus credenciales, se devolverá un token web JSON. Dado que los tokens son credenciales, se debe tener mucho cuidado para evitar problemas de seguridad. En general, no debe conservar los tokens más tiempo del necesario.

Tampoco [debe almacenar datos confidenciales de la sesión en el almacenamiento del navegador debido a la falta de seguridad](https://translate.google.com/website?sl=en&tl=es&prev=search&u=https://cheatsheetseries.owasp.org/cheatsheets/HTML5_Security_Cheat_Sheet.html%23local-storage) .

Cada vez que el usuario desee acceder a una ruta o recurso protegido, el agente de usuario debe enviar el JWT, generalmente en el encabezado de **Autorización** utilizando el esquema **Bearer .** El contenido del encabezado debe ser similar al siguiente:

```
Authorization: Bearer <token>
```

Este puede ser, en ciertos casos, un mecanismo de autorización apátrida. Las rutas protegidas del servidor buscarán un JWT válido en el `Authorization`encabezado y, si está presente, el usuario podrá acceder a los recursos protegidos. Si el JWT contiene los datos necesarios, la necesidad de consultar la base de datos para ciertas operaciones puede reducirse, aunque puede que no siempre sea así.

Si el token se envía en el `Authorization`encabezado, el uso compartido de recursos de origen cruzado (CORS) no será un problema, ya que no utiliza cookies.

El siguiente diagrama muestra cómo se obtiene y utiliza un JWT para acceder a API o recursos:

![¿Cómo funciona un token web JSON?](https://cdn2.auth0.com/docs/media/articles/api-auth/client-credentials-grant.png)

1. La aplicación o el cliente solicita autorización al servidor de autorización. Esto se realiza a través de uno de los diferentes flujos de autorización. Por ejemplo, una aplicación web compatible con [OpenID Connect](https://translate.google.com/website?sl=en&tl=es&prev=search&u=http://openid.net/connect/) típica pasará por el `/oauth/authorize`punto final utilizando el [flujo de código de autorización](https://translate.google.com/website?sl=en&tl=es&prev=search&u=http://openid.net/specs/openid-connect-core-1_0.html%23CodeFlowAuth) .
2. Cuando se otorga la autorización, el servidor de autorización devuelve un token de acceso a la aplicación.
3. La aplicación usa el token de acceso para acceder a un recurso protegido (como una API).

Tenga en cuenta que con los tokens firmados, toda la información contenida en el token está expuesta a los usuarios u otras partes, aunque no puedan cambiarla. Esto significa que no debe poner información secreta dentro del token.



## ¿Por qué deberíamos usar tokens web JSON?

Hablemos de los beneficios de los **tokens web JSON (JWT)** en comparación con los **tokens web simples (SWT)** y **los tokens de lenguaje de marcado de aserción de seguridad (SAML)** .

Como JSON es menos detallado que XML, cuando está codificado, su tamaño también es más pequeño, lo que hace que JWT sea más compacto que SAML. Esto hace que JWT sea una buena opción para pasar en entornos HTML y HTTP.

En cuanto a la seguridad, SWT solo puede firmarse simétricamente mediante un secreto compartido utilizando el algoritmo HMAC. Sin embargo, los tokens JWT y SAML pueden usar un par de claves pública/privada en forma de certificado X.509 para la firma. Firmar XML con XML Digital Signature sin introducir oscuros agujeros de seguridad es muy difícil en comparación con la simplicidad de firmar JSON.

Los analizadores JSON son comunes en la mayoría de los lenguajes de programación porque se asignan directamente a los objetos. Por el contrario, XML no tiene un mapeo natural de documento a objeto. Esto hace que sea más fácil trabajar con JWT que con aserciones SAML.

En cuanto al uso, JWT se usa a escala de Internet. Esto destaca la facilidad de procesamiento del lado del cliente del token web JSON en múltiples plataformas, especialmente en dispositivos móviles.

![Comparación de la longitud de un JWT codificado y un SAML codificado](https://cdn.auth0.com/content/jwt/comparing-jwt-vs-saml2.png) *Comparación de la longitud de un JWT codificado y un SAML codificado*

Si desea leer más sobre los tokens web JSON e incluso comenzar a usarlos para realizar la autenticación en sus propias aplicaciones, vaya a la página de [destino del token web JSON](https://translate.google.com/website?sl=en&tl=es&prev=search&u=http://auth0.com/learn/json-web-tokens) en Auth0.






