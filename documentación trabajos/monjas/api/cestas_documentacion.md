11. ## Cestas Document:

    #### Controladores:

    
    
    1. ##### Document/readDocument()
    
       ```php
       Lee Los documentos de un Sistema
       
           data: 
       1. id (Iddocument No obligatorio, es para conseguir los pertenecientes a un documento)
           
       Respuesta:
       Object(code, value (id,type,path,nemo))
       ```
       
    2. ##### Document/deleteDocument()
    
       ```php
       Elimina un  documento de un Sistema
       
           data: 
       1. id (Iddocument)
           
       Respuesta:
       Object(code)
       ```
    3. ##### Document/modifyNemoDocument()
    
       ```php
       Modifica el nemo de un documento
       
           data: 
       1. id (Iddocument)
       2. text
           
       Respuesta:
       Object(code)
       ```
       
    4. ##### Document/createDocument()
       
       ```php
       Modifica el nemo de un documento
       
           data: 
       1. nemo (file/documento)
       2. id (codigo del documento padre al que pertenece)
       3. attach_id (codigoadjunto)
        
       Respuesta:
       Object(code)
       ```