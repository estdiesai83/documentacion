### Controladores Gallery: 

1. #### Gallery/readGallery()

   ```php
   Respuesta: 
   object(code, values [{id, type, path, date, text}]
   ```

   Lee los valores de la galeria

   

2. #### Gallery/deleteElement

   ```php
   data:
   1. id
       
   Respuesta:
   object (code)
   ```

   Elimina el elemento de la galeria cuyo ide sea el que le llega

   

3. #### Gallery/modifyTextElement

   ```php
   data:
   1. id (id galeria)
   2. text
       
   Respuesta:
   object (code) 
   ```

   Modifica el texto de un elemento de la galeria

   

4. #### Gallery/createElementGallery

   ```php
   data:
   1. id (token id del rc puede ser null)
   2. attached_code (codigo adjunto)
       
   Respuesta:
   object(code, id (galeria))
   ```

   Crea un elemento en la galeria y retorna el id


