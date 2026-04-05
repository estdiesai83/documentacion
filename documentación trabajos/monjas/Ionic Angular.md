[TOC]



# Ionic Angular

## Instalación ionic cli

Ir a la web https://ionicframework.com/  y pulsar en el botón azul de arriba a la derecha Get started

Instalar ionic cli

```bash
npm install -g @ionic/cli
```



Dentro de la carpeta git, ejecutar una vez por cada proyecto que queramos crear

```bash
cd git/
ionic start nombre_proyecto blank
```

Al poner la opcion blank despues de nombre_proyecto crea un proyecto nuevo en blanco automaticamente. 

Ej: ionic star master blank

Ej: ionic start director blank

Pulsar **yes** cuando pregunta si ios y android 

Pulsar **no** cuando pregunta si queremos crear una cuenta.



## Instalacion Plugins ionic cordova

Por cada plugin de cordova que queramos instalar:

1. Ir a google y buscar ionic nombre_plugin a instalar
2. Abrir el primer enlace y ejecutar los dos comandos que aparecen dentro de la carpeta donde lo queramos instalar.
3. Asi sucesivamente con todos los plugins que se quieran instalar

Los plugin que vamos a instalar son:  (Instalar siempre sin sudo)

1. ionic plugin camera:  		

   ```bash
   ionic cordova plugin add cordova-plugin-camera
   npm install @ionic-native/camera
   ```

2. ionic plugin media capture

   ```bash
   ionic cordova plugin add cordova-plugin-media-capture
   npm install @ionic-native/media-capture
   ```

3. ionic plugin media

   ```bash
   ionic cordova plugin add cordova-plugin-media
   npm install @ionic-native/media
   ```

4. ionic plugin file

   ```bash
   ionic cordova plugin add cordova-plugin-file
   npm install @ionic-native/file
   ```

5. ionic plugin file transfer

   ```bash
   ionic cordova plugin add cordova-plugin-file-transfer
   npm install @ionic-native/file-transfer
   ```

6. ionic plugin statusbar

   ```bash
   ionic cordova plugin add cordova-plugin-statusbar
   npm install @ionic-native/status-bar
   ```

7. ionic plugin file opener2

   ```bash
   ionic cordova plugin add cordova-plugin-file-opener2
   npm install @ionic-native/file-opener
   ```

   ​	

Para lanzar el proyecto:

```bash
ionic serve
```



### Posibles errores instalación:

1. [ERROR] Refusing to run ionic cordova plugin inside a Capacitor project.

   Para solucionarlo hay que desactivar el capacitador, para ello ejecutar:   

   ```bash
   ionic integrations disable capacitor
   ```

   Una vez ejecutado, volver a instalar el plugin.

   

2. Error: cordova update failed … sudo chown , 

   Solucion: asegurarnos que la carpeta tiene permisos y que el usuario es soa (usuario con el que hacemos la instalacion)

   

3. Error from chokidar (/home/soa/git/master/node_modules/core-js/proposals): Error: ENOSPC: System limit for number of file watchers reached, watch '/home/soa/git/master/node_modules/core-js/proposals/collection-methods.js'. Para solucionarlo ejecutar:

   ```bash
   echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
   ```



### Ejemplo:

En git/ardal/master y git/ardal/director hacer git pull para descargar los últimos cambios.

1. Ir a git/ardal/master/app/src/app y copiar todas las carpetas (solo las carpetas, sin ningun archivo) y pegarlas en el proyecto que hemos creado nuevo (git/master/app/src/app)
2. Ir a git/master/ y por cada plugin de cordova que queramos instalar:
   1. Ir a google y buscar ionic nombre_plugin a instalar
   2. Abrir el primer enlace y ejecutar los dos comandos que aparecen dentro de la carpeta donde lo queramos instalar (Ej: git/master/).
   3. Asi sucesivamente con todos los plugins



### Errores de implementacion:

Modificaciones para eliminar los errores de implementacion:

1. ERROR 	in The target entry-point "@angular/platform-browser/animations" 	has missing dependencies:

   ​	[ng] 	 - @angular/animations

   ​	[ng] 	 - @angular/animations/browser

   Solución: añadir en package json:

   ```json
   "@angular/animations": 		"~10.0.0",
   "@angular/cdk": 		"^10.2.4",
   ```

2. Error Browser: 

   Solución: quitar de todos los archivos excepto de app.module.ts

   ```typescript
   import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
   ```

   

3. Error: ERROR Error: Uncaught (in promise): NullInjectorError: R3InjectorError(AppModule)[AuthorizatedGuard -> HttpClient -> HttpClient -> HttpClient]: 
     NullInjectorError: No provider for HttpClient!
   NullInjectorError: R3InjectorError(AppModule)[AuthorizatedGuard -> HttpClient -> HttpClient -> HttpClient]: 
     NullInjectorError: No provider for HttpClient!

   Solución: Añadir en app.module.ts

   ```typescript
   import { HttpClientModule } from '@angular/common/http'; 
   
   HttpClientModule (en imports)
   ```

   

4. Incorporar en app.module.ts	

   ```typescript
   // TODO: ini 29102020
   import { IOSFilePicker } from '@ionic-native/file-picker/ngx';
   import { ImagePicker, ImagePickerOptions } from '@ionic-native/image-picker/ngx';
   import { FileChooser } from '@ionic-native/file-chooser/ngx';
   import { FilePath } from '@ionic-native/file-path/ngx';
   import { Camera, CameraOptions } from '@ionic-native/camera/ngx';
   import { MediaCapture, CaptureImageOptions } from '@ionic-native/media-capture/ngx';
   import { FileOpener } from '@ionic-native/file-opener/ngx';
   import { FileTransfer, FileUploadOptions, FileTransferObject } from '@ionic-native/file-transfer/ngx';
   import { File } from '@ionic-native/file/ngx';
   // TODO: fin 25112020
   ```

   

5. Modificar import de ionic

   ```typescript
   import { IOSFilePicker } from '@ionic-native/file-picker';
   import { ImagePicker, ImagePickerOptions } from '@ionic-native/image-picker';
   import { FileChooser } from '@ionic-native/file-chooser';
   import { FilePath } from '@ionic-native/file-path';
   import { Camera, CameraOptions } from '@ionic-native/camera';
   import { MediaCapture, CaptureImageOptions } from '@ionic-native/media-capture';
   import { FileOpener } from '@ionic-native/file-opener';
   import { FileTransfer, FileUploadOptions, FileTransferObject } from '@ionic-native/file-transfer';
   import { File } from '@ionic-native/file';
   
   por:
   import { IOSFilePicker } from '@ionic-native/file-picker/ngx';
   import { ImagePicker, ImagePickerOptions } from '@ionic-native/image-picker/ngx';
   import { FileChooser } from '@ionic-native/file-chooser/ngx';
   import { FilePath } from '@ionic-native/file-path/ngx';
   import { Camera, CameraOptions } from '@ionic-native/camera/ngx';
   import { MediaCapture, CaptureImageOptions } from '@ionic-native/media-capture/ngx';
   import { FileOpener } from '@ionic-native/file-opener/ngx';
   import { FileTransfer, FileUploadOptions, FileTransferObject } from '@ionic-native/file-transfer/ngx';
   import { File } from '@ionic-native/file/ngx';
   ```

   

6. Modificar import de MatForm...Modules

   ```typescript
   import { MatFormFieldModule } from '@angular/material';
   por:
   import { MatFormFieldModule } from '@angular/material/form-field';
   
   import { MatNativeDateModule, MatSliderModule, DateAdapter} from '@angular/material';
   por:
   import { MatNativeDateModule, DateAdapter} from '@angular/material/core';
   import { MatSliderModule} from '@angular/material/slider';
   import { MatDatepickerModule } from '@angular/material/datepicker';
   
   
   import { MatInputModule, MatSelectModule,MatRadioModule, MatCheckboxModule } from '@angular/material';
   por:
   import { MatInputModule } from '@angular/material/input';
   import { MatSelectModule } from '@angular/material/select';
   import { MatRadioModule } from '@angular/material/radio';
   import { MatCheckboxModule } from '@angular/material/checkbox';
   ```

7. Crear archivos globals.ts, globals.less y app.service (se pueden copiar dichos archivos por ejemplo de git/ardal/director a git/director)

8. Error: core.js:4197 ERROR Error: Uncaught (in promise): NullInjectorError: R3InjectorError(HomeModule)[BarraestadoService -> BarraestadoService -> [object Object] -> [object Object] -> [object Object]]: 
     NullInjectorError: No provider for [object Object]!
   NullInjectorError: R3InjectorError(HomeModule)[BarraestadoService -> BarraestadoService -> [object Object] -> [object Object] -> [object Object]]: 

   Solución: 

   1. Eliminar de barraestado.module.ts

      ```typescript
      import { BarraestadoService } from './barraestado.service';
         
      providers: [ BarraestadoService ]  
      ```

   2. Comentar de adjuntos.component.ts (temporalmenta hasta ver como se soluciona este problema)

   ```typescript
   import { BarraestadoService } from './barraestado.service';
   
   private barra: BarraestadoService,
   ```

9. Cambiar en index.html 

   ```html
   <body class="mat-typography"> 
   por 
   <body class="igx-typography">
   ```

10. Añadir en tsconfig.json:

    ```json
    "angularCompilerOptions": {
        "fullTemplateTypeCheck": false,
        "strictInjectionParameters": true
      }
    ```

11. Copiada la carpeta de assets y archivo style.less

12. Añadido en index.html el contenido de la etiqueta <script>

13. Una vez realizados todos estos cambios da el error: maximum call stack size exceeded