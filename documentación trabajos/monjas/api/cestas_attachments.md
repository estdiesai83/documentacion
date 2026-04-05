### Controladores Attachments: 

1. #### Attachments/uploadFiles()

   ```php
   data:
   1. data["types"] 
   
   Repuesta:
   object(code, data)
   ```

   Guarda el archivo adjunto en el directorio que correponda

   Crea caso en la tabla adjuntos escribiendo en los tdatos (fecha, tipo y ruta).



### Modelos



2. #### Attachments/saveFiles()

   Guarda el archivo en el directorio que corresponda

   

3. #### Attachments/writeImageAttached(full_path)

   Crea caso en la tabla adjuntos con la ruta y tipo = 0

   

4. #### Attachments/writeVideoAttached(full_path)

   Crea caso en la tabla adjuntos con la ruta y tipo = 1

   

5. #### Attachments/writeAudioAttached(full_path)

   Crea caso en la tabla adjuntos con la ruta y tipo = 2

   

6. #### Attachments/writeDocAttached(full_path)

   Crea caso en la tabla adjuntos con la ruta y tipo = 3

   

7. #### Attachments/createCompressed()

   Crea archivo comprimido

   

8. #### Attachments/createThumb()

   Crea archivo thumb

   

9. #### Attachments/getDestinationDirectory()

   Obtiene el directorio donde se va a guardar el adjunto

   

10. #### Attachments/getHashFile($name)

    Obtiene la informacion sobre el archivo



