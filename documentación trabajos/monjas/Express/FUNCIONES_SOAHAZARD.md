# Probar  SOAHAZARD



Colorcarnos en la carpeta tiempo/bin en /var/www/html/

```bash
cd /var/www/html/tiempo/bin
./soahazard
```



Desde el navegador en local:

```web-idl
http://localhost:puerto/nombre_funcion

Ejemplo:
http://localhost:3000/crearTarea
```

Desde el navegador en remoto:

```web-idl
http://DP:puerto_remoto/nombre_funcion

Ejemplo:
http://89.7.222.194:54731/crearTarea
```



Si se le envia algun valor a la función, desde la terminal:

```bash
curl -d "param1=value1&param2=value2" -X POST http://localhost:3000/data
```

Ejemplo:

```bash
curl -d zona="3" -X POST http://localhost:3000/crearTarea
```



##### Funciones creadas en servicio: schedule:

1. **init**(): 

   1. Lee las diferentes tareas, retorna: id, tipo, tarea, scheduled, argumentos 
   2. Por cada tarea 
      1. llena array tareas
      2. llama a iniciarTarea para lanzar la tarea correspondiente (libreria scheduled)
   
   
   
2. **iniciarTarea**(id, tipo, schedule, tarea, argumentos): 

   1. Si tipo es 0 (puntual) llama a tareaPuntual

   2. Si tipo es 1 (periodica) llama a tareaPeriodica

      

3. **tareaPuntual**(tarea, argumentos, periodo): lanza la libreria con el periodo correspondiente y cuando termina llama a ejecutarTarea enviandole tarea y argumentos

   

4. **tareaPeridodica**(tarea, argumentos, periodo): lanza la libreria con el periodo correspondiente y cuando termina llama a ejecutarTarea enviandole tarea y argumentos

   

5. **crearTarea**(tipo,scheduled,tarea,argumentos)

   1. Crea caso en tabla "tarea" y si la tarea es =0 ademas crea caso en tabla "tarea_rpc"

   2. Mete la tarea nueva en el array

   3. Llama a iniciarTarea para que lance la libraria schedule que corresponda

      

6. **ejecutarTarea**(tarea, argumentos)

   1. si tarea es 0: llama a realizarLamada del xmlRPC

   2. si tarea es 1: por ahora no se sabe

      

   

