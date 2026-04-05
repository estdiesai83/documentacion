[TOC]

# Subir App a la tienda (appstore y playstore)



Para hacerlo siempre hay que ubicarse en el mac negro pequeño

Contraseña: adminr123



1. Abrir una terminal

2. Situarnos el proyecto del git que queremos subir

   ```bash
   cd git/ardal/padres
   ```

   1. Decargarnos los últimos cambios

      ```bash
      git checkout *
      git pull
      ```

      *Nota: si aparece un 'x' en la ruta en la que nos encontramos a la derecha, significa que no se han bajado los últimos cambios

   2. Una vez descargados los cambios, nos situamos en la carpeta app

      ```
      cd app
      ```

      Dentro de esta carpeta entre otros archivos, tiene que haber 3 ejecutables:

      ```
      build-android-debug
      build-android-release.sh
      build-ios.sh
      ```

      Nota: 3 ejecutables, hay que hacer primero el de IOS.
      
      

## Subir app a AppStore

Empezar siempre primero por del de ios, a no ser que me digan lo contrario

```bash
cd /git/proyecto/app/
./build-ios.sh
```

Pulsar enter (Yes) cuando aparezca una pregunta.

1. Abrir software **XCode** (Solo para IOS) (icono azul con un martillo)

   1. Una vez abierto, abrir en el proyecto que necesitamos el archivo: nombre_proyecto.xcworkspace, que se encuentra en la ruta

      ```
      Git/Ardal/Padres/.../platforms/ios/...xworkspace
      ```

      Pulsar Open

   2. Abrir proyecto (El Ardal)

      1. En la carpeta Plugins, buscar el archivo: CDVFileTransfer.m y hacer click

         1. Comentar las línes que hacen referencia a UserAgent que dan error (en este caso son las línas 107,108,109 y 110)
         2. Guardar (tecla pinguino + S)

      2. Volver a la carpeta raiz (El Ardal) y en pulsar en la pestaña (Signning & Capabilitis) , (ubicada en el centro de la pantalla a la altura del nombre proyecto)

         1. Desmarco las dos opciones.
         2. Vuelvo a marcar la primera y pulso "Enable Automatic"
         3. En team a no ser que me digan lo contrario elegir UNIQUE HOME

      3. Volver a la carpeta raiz (El Ardal ) y pulsar en la pestaña (General)

         1. Desmarcar la opción de Ipad a no se que me digan lo contrario.
         2. Rellenar los campos: para coger la información a introducir en dichos campos, tenemos que mirar el contenido de las primeras líneas del archivo config.xml y entre comillas pondra los valores de version y ios-buildind
            1. Version: "version"
            2. Build: "ios-buildind"

      4. Pulsar en la pestaña que está al lado del play y stop a la derecha y elegir la opción "Any Ios"

      5. Pulsar Product -> Archive

      6. Cuando acabe pulsar en el botón "Distribute App" a la derecha del todo, y aparecerán una serie de ventanas a las que hay que pulsar en todas Next

         1. App Store Connect -> Pulsar Next
         2. Upload...  -> Pulsar Next
         3. Aparece una opcion marcada , dejarla tal cual-> Pulsar Next
         4. Automatico -> Pulsar Next
         5. Tardará un poco y cuando termine aparecerá un botón que Ponga "Done"
         6. Pulsar Done

      7. Mientras aparece el botón de Done del último paso anterior podemos abrir paralelamente el navegador (Safari) e irnos a la web: www.appstoreconnect.apple.com	

         1. Rellenar los campos:
            1. ID: uniquehome@uniquehome.es
            2. contraseña: Pilotohotel_2019
         2. Permitir.
         3. Aparecera una pantalla con un código, introducir dicho código y pulsar en "Confiar"
         4. Pulsar en "Mis apps"
         5. Cuando termine de subirse la aplicación (es decir cuando termine lo que se estaba realizando al pulsar el botón "Done" del punto 6.6)
         6. Elegir la app que me digan, en este caso es la app "El Ardal"
         7. Pulsamos en "Test FLight" y aparecera la version que hemos creado
         8. Pulsar tecla "pinguino" + R para refrescar el navegador para ver si ha terminado o sigue poniendo "En proceso".
         9. Cuando no esté en proceso, pulsar en "App Store"
         10. Pulsar Seleccionar.
         11. En la ventana que aparece de Leyes de Encriptación Marcar la Opcion de NO y Pulsar Aceptar.
         12. Pulsar Guardar.
13. Pulsar Enviar para su revision.
         

         
         

## Subir app a PlayStore (Android)

1. Ejecutar ejecutables:

   ```bash
   cd git/proyecto/app/
   
   Ej: cd git/Ardal/Padres/app
   ```

2. Ejecutar primero ./build-android-debug.sh

   ```bash
   Ejecutar primero
   ./build-android-debug.sh
   ```

   Pulsar enter (Yes) cuando aparezca una pregunta.

   

3. Modificar el archivo build-android-release.sh, por si no concide la version, para conocer la version que hay que introducir, hacer un ls de la ruta que aparece dentro del archivo en la ultima línea a la izquierda Library/Android/....

   ```bash
   vim build-android-release.sh
   ```

   Hacer ls de la ruta que corresponda desde otra terminal

   ```bash
   ls Library/Android/...
   ```

   Modificar en el archivo build-android-debug.sh, el numero de la version y guardar (:wq)

   ```
   :wq
   ```

   

4. Ejecutar segundo build-android-release.sh

   ```bash
   ./build-android-release.sh
   ```

   1. Pulsar enter (Yes) cuando aparezca una pregunta.

   2. Introducir la contraseña Passports: elardal (me tienen que decir que contraseña).

      

5. Abrir el navegador (Safari) e ir a la web: www.play.google.com

   1. Introducir los datos para acceder:

      usuario: uniquehomees@gmail.com

      contraseña: Pilotohotel_2017

   2. Pulsar en la aplicacion que corresponda: en este caso "El Ardal".

   3. Pulsar en Producción (en el menu de la izquierda).

   4. Pulsar en Crear Version (botón a la derecha).

   5. Coger el archivo .apk ("Elardal.apk") y arrastrarlo a la web, para abrir el archivo .apk, coger la ruta donde se encuentra , para ello mirar los mensajes que aparecen cuando se ha ejecutado el archivo, en las primeras líneas y desde la terminal:

      ```
      open ruta
      ```

   6. En notas de la versión me lo tienen que decir para ver que texto hay que introducir.

   7. Pulsar en Guardar

   8. Pulsar en Revisar Cambios

   9. Pulsar en Iniciar Lanzamiento.

