## Estores (hazard)

### 

### Auto

 ### 

### leerAuto ()

Leerá los datos si hay auto programador

###### Datos que recibe

```json
{
    id: 1 // del estor
}
```



###### Datos que devuelve

```json
{
     id: 1, // id tarea
     hora: '12:00', 
     nivel: 50,
 }
```



### crearAuto ()

Crear la programación del auto

###### Datos que recibe

```json

 {
     id: 1 // id del estor
     hora: '12:00'
     nivel: 50,
 }
```



### borrarAuto

Borra la programación del auto

###### Datos que recibe

```json
{
    id: 1 // id tarea
}
```



### 

### Despertador ()

 ### 

### leerDespertador ()

Muestra un listado los despertadores programados

###### Datos que recibe

```json
{
    id: 1 // del estor
}
```

###### Datos que devuelve

```json
[
    {
        id: 1
        hora: '12:00'
        nivel: 50,
        estado: 0 // 0-> apagado 1-> encendido
        diasemana:
        	[0,1,2,3] // ids de los dias de la semana
    }
]
```



### activarDespertador ()

Activa el estado del despertador

###### Datos que recibe

```json
{
    id: 1 // id del despertador
    id_estor : 3 //id del esstor
}
```



### desactivarDespertador ()

Desctiva el estado del despertador

###### Datos que recibe

```json
{
    id: 1 // id del despertador
    id_estor : 3 //id del esstor
}
```



### borrarDespertador ()

Borra la alarma creada

###### Datos que recibe

```json
{
    id: 1 // id del despertador
    id_estor : 3 //id del esstor
}
```



### modificarDespertador ()

Modifica la alarma del despertador

###### Datos que recibe

```json
{
    id: 1 // id del despertador
    id_estor : 3 //id del esstor
    hora: '12:00'
    nivel: 40,
    estado: 1
    diasemana:
        	[0,1,2,3] // ids de los dias de la semana
}
```

** por defecto el estado estara selecionado ( estado = 1)



### crearDespertador ()

Crea una alarma para el despertador

###### Datos que recibe

```json
{
    id : 3 //id del esstor
    hora: '12:00'
    nivel: 40,
    estado: 1
    diasemana:
        	[0,1,2,3] // ids de los dias de la semana
}
```

** por defecto el estado estara selecionado ( estado = 1)



