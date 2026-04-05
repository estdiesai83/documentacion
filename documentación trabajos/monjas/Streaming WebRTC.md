Streaming WebRTC

------

Etiquetas

[webrtc](https://wiki.uniquehome.es/t/webrtc)[camaras](https://wiki.uniquehome.es/t/camaras)

Última edición por

Robert

29/03/2023

> DOCUMENTACIÓN NO ACTUALIZADA. Para futuras implementaciones, seguir las instrucciones de la web del desarrollador.

### Streaming WebRTC

Para llevar a cabo este sistema hemos utilizado la librería RTCMultiConnection, para más informacion:

> - Página web: [https://www.rtcmulticonnection.org](https://www.rtcmulticonnection.org/)
> - GitHub: https://github.com/muaz-khan/RTCMultiConnection
> - Wiki: https://github.com/muaz-khan/RTCMultiConnection/wiki

#### Servidor Signalling

Necesitamos un servidor que actue de mediador entre los clientes, para ello vamos a instalar un servidor que se encargará de poner en contacto dichos clientes entre sí. Un cliente es cualquier dispositivo que envía y/o recibe audio y/o video.

##### Instalación

```bash
$ sudo apt-get install nodejs nodejs-legacy npm
$ mkdir servidor-signalling && cd servidor-signalling
$ git clone https://github.com/muaz-khan/RTCMultiConnection.git ./
$ npm install --production
$ npm install pm2@latest -g
```

Copy

##### Configuración

Encontraremos en la misma carpeta un archivo llamado `config.json` donde se encuentra la configuración del servidor, los parámetros que nos interesan son los siguientes:

- `port`: puerto al que se conectarán los clientes, nosotros utilizamos el puerto `9000`.
- `enableAdmin`: al configurar este parametro `true`, tendremos acceso a una interfaz web por la que podremos ver los clientes y las conferencias activas en todo momento.
- `adminUserName`: usuario con el que accederemos a la web de administrador. Por ejemplo `admin`.
- `adminPassword`: contraseña con la que accederemos a la web de administrador. Por ejemplo `admin`.

##### Ejecución

El servidor esta escrito en `javascript`, por lo tanto se ejecutara con `node`, como es lógico es de vital importancia que el servidor esté siempre corriendo para que se puedan realizar las conexiones, pero `node` por sí solo no prevé el autoarranque cuando se inicia el sistema o el reinicia cuando ocurre alguna excepción, por lo tanto vamos a utilizar un gestor de procesos para `node` llamado `pm2`.

> Más información sobre `p2m`: http://pm2.keymetrics.io/

Ahora configuramos pm2 para que se ejecute cuando sucede un reinicio del sistema:

```bash
$ pm2 startup
```

Copy

Para ejecutar el servidor ejecutamos:

```bash
$ pm2 start server.js
```

Copy

Una vez hecho esto, el servidor se ejecutará simpre.

Podemos acceder ahora a la interfaz web y ver en vivo los clientes y las conferencias activas, para ello debemos acceder al servidor mediante el navegador indicando el puerto que hemos configurado, con la ruta `/admin`. Por ejemplo: `http://217.125.140.210:9000/admin/`.

#### Servidor ICE

Debido al uso de NATs por parte de compañías telefónicas, muchas veces se tienen problemas al intentar establecer una conexión entre dos clientes, por eso necesitamos hacer uso de servidores STUN y TURN para mediar con dicho problema. Véase la documentación de `Instalar servidor STUN y TURN` para instalarlo.

#### Cliente

##### Cordova

Necesitamos los siguientes plugins:

```bash
$ cordova plugin add cordova-plugin-android-permissions
$ cordova plugin add cordova-plugin-crosswalk-webview
$ cordova plugin add cordova-plugin-camera
```

Copy

###### iOS

Para el correcto funcionamiento necesitamos instalar en iOS el siguiente plugin para que las funciones WebRTC sean visibles por la librería.

```bash
$ cordova plugin add cordova-plugin-iosrtc
```

Copy

El plugin no es compatible con las últimas versiones de `Swift` por lo tanto necesitamos ejecutar lo siguiente para poder compilar con `xcode`:

```bash
$ mkdir hooks && cd hooks
$ wget https://raw.githubusercontent.com/eface2face/cordova-plugin-iosrtc/master/extra/hooks/iosrtc-swift-support.js
$ sudo chmod +x iosrtc-swift-support.js
$ npm install -g xcode
```

Copy

Ahora añadimos las siguientes lineas en el `config.xml`:

```xml
<platform name="ios">
    <hook src="hooks/iosrtc-swift-support.js" type="after_platform_add" />
    <config-file parent="CFBundleURLTypes" target="*-Info.plist">
      <array>
          <key>NSAppTransportSecurity</key>
            <dict>
              <key>NSAllowsArbitraryLoads</key>
                <true />
            </dict>
        </array>
    </config-file>
    <config-file parent="NSCameraUsageDescription" target="*-Info.plist">
        <string>Necesitamos acceder a la camara.</string>
    </config-file>
    <config-file parent="NSMicrophoneUsageDescription" target="*-Info.plist">
        <string>Necesitamos acceder al microfono.</string>
    </config-file>
</platform>
```

Copy

Quitamos y añadimos la plataforma iOS:

```bash
$ cordova platform remove ios
$ cordova platform add ios
```

Copy

Con esto ya podremos compilar la aplicación con `Xcode`.

##### Angular

Necesitamos instalar la siguiente libreria, para poder pedir permisos de camara y micrófono en android:

```bash
$ npm install --save @ionic-native/android-permissions
```

Copy

##### Uso de la librería (Angular)

Inportamos los scripts:

```html
<script src="assets/js/RTCMultiConnection.js"></script>
<script src="assets/js/socket.io.js"></script>
```

Copy

Necesitamos además declarar la librería de la siguiente manera justo encima del `@Component`:

```typescript
declare let RTCMultiConnection: any;

@Component({
    ...
```

Copy

Pedimos permisos de camara y micrófono en `ngOnInit`:

```typescript
ngOnInit() {
    this.androidPermissions.requestPermissions([
      this.androidPermissions.PERMISSION.CAMERA,
        this.androidPermissions.PERMISSION.RECORD_AUDIO,
        this.androidPermissions.PERMISSION.RECORD_AUDIO_SETTINGS
    ]);
}
```

Copy

Ahora voy a mostrar solo la configuración con el servidor:

```typescript
// Inicialización de la libreria
this.connection = new RTCMultiConnection();
// Conexión con el servidor
this.connection.socketURL = 'http://217.125.140.210:9000/';
// Debe ser igual a la sala a la que nos vamos a conectar
this.connection.socketMessageEvent = 'portero';
// Utilizar servidores ICE (STUN y TURN) propios
this.connection.getExternalIceServers = false;
// Configuracion de servidores ICE
this.connection.iceServers = [];
// STUN
this.connection.iceServers.push({
    urls: 'stun:88.12.32.148:3478'
});
// TURN udp
this.connection.iceServers.push({
    urls: 'turn:adminr123@88.12.32.148:3478?transport=udp',
    credential: 'adminr123',
    username: 'adminr123'
});
// TURN tcp
this.connection.iceServers.push({
    urls: 'turn:adminr123@88.12.32.148:3478?transport=tcp',
    credential: 'adminr123',
    username: 'adminr123'
});
// Enviaremos Audio y Video
this.connection.session = {
    audio: true,
    video: true
};
// Queremos recibir Audio y Video
this.connection.sdpConstraints.mandatory = {
    OfferToReceiveAudio: true,
    OfferToReceiveVideo: true
};
```

Copy

Para el código completo, vease algun proyecto ya implementado.