[TOC]

# **CONSUMOS AGUA**

## **VALORES AGUA**



### leerConsumoMMMMesActualAgua(): 

Lee los valores de medida del Agua

###### Datos que devuelve: array medidas [{minimo, maximo, media, consumo,fechamaximo,fechaminimo}]

```json
[
    {minimo:"1.668",maximo:"16.435",fechaminimo:"03-06-2021",fechamaximo:"11-06-2021",media:"4.311",consumo:"64.672",total:"100"
]
```



### leerConsumoMesEnCursoAgua() 

Lee consumo del mes actual del agua, del anterior y la equivalencia

###### Datos que devuelve: objeto valor {valor1, valor2, valor3}

```json
{
    valor1:"118.099",valor2:"3.438","valor3":"64.705"
}
```



### leerConsumoHoyAgua(): 

Lee consumo de hoy y del dia anterior de agua

###### Datos que devuelve: objeto valor {valor1, valor2, total}

```json
{
    valor1:"3.163",valor2:"2.320",total:"5"
}
```



### leerContadorAgua(): 

Lee contador de Agua

###### Datos que devuelve: valor

```json
{
    valor:"118.099"
}
```



### leerConsumoMMMGeneralAgua:() 

Lee valores medidas Agua

###### Datos que devuelve: array medidas

```json
[
   {minimo:"0.000",maximo:"20.065",fechaminimo:"14-03-2021",fechamaximo:"27-05-2021",media:"2.827"}
]
```



### leerConsumoMMMAnioAgua():

Lee valores medidas agua para el año dado

###### Datos que recibe: anio

```json
[
   anio
]
```

###### Datos que devuelve: array medidas [{minimo,maximo,fechaminimo,fechamaximo,media}]

```json
[
   {minimo:"0.000",maximo:"20.065",fechaminimo:"14-03-2021",fechamaximo:"27-05-2021",media:"2.827"}
]
```



### leerConsumoMMMMesAgua(): 

Lee valores medidas Agua para el año y mes dado

######  Datos que recibe: anio, mes

```json
[
   anio:
   mes:
]
```

###### Datos que devuelve: array medidas  [{minimo,maximo,fechaminimo,fechamaximo,media}]

```json
[
   {minimo:"0.000",maximo:"20.065",fechaminimo:"14-03-2021",fechamaximo:"27-05-2021",media:"2.827"}
]
```



### leerConsumoMMMDiasAgua(): 

Lee valores medidas Agua para la fecha dada

######  Datos que recibe: anio, mes dia

```json
[
   anio:
   mes:
   dia:
]
```

###### Datos que devuelve: array medidas[{minimo, maximo,fechaminimo, fechamaximo, media}]

```json
[
   {minimo:"0.000",maximo:"20.065",fechaminimo:"14-03-2021",fechamaximo:"27-05-2021",media:"2.827"}
]
```







##  GRAFICOS CONSUMO AGUA



### leerGraficoConsumoAguaGeneral():

Lee el consumo de los diferentes años

######  Datos que devuelve: array valores [{fecha(anios), valor}]

```json
[
   {fecha:"2019",valor:"2.827"}
]
```



### leerGraficoConsumoAguaAnual():

 Lee el consumo de los diferentes meses del año dado

######  Datos que recibe: anio

```json
[
   anio
]
```



######  Datos que devuelve: array valores [{fecha(meses), valor}]

```json
[
   {fecha:"ENE",valor:"39.476"},{fecha:"FEB",valor:"33.424"},{fecha:"MAR",valor:"44.971"},{fecha:"ABR",valor:"55.682"},{fecha:"MAY",valor:"118.099"},{fecha:"JUN",valor:"73.335"}
]
```



### leerGraficoConsumoAguaMensual():

Lee el consumo de los diferentes dias del año y mes dado

######  Datos que recibe: anio, mes

```json
[
   anio:
   mes:
]
```



######  Datos que devuelve: array valores [{fecja(dias), valor}]

```json
[
   {fecha:"1",valor:"2.231"},{fecha:"2",valor:"1.787"},{fecha:"3",valor:"1.668"},{fecha:"4",valor:"2.954"},...
]
```





### leerGraficoConsumoAguaDiario():

 Lee el consumo de los diferentes horas de la fecha dada

######  Datos que recibe: anio, mes, dia

```json
[
   anio
   mes
   dia
]
```



######  Datos que devuelve: array valores: [{fecha(horas), valor}]

```json
[
   {fecha:"00",valor:"0.012"},{fecha:"01",valor:"0.008"},{fecha:"02",valor:"0.007"},{fecha:"03",valor:"0.008"},....{fecha:"14",valor:"0.086"},{fecha:"15",valor:"0.037"},...
]
```





## GRAFICO TARTA CONSUMO  AGUA



### leerGraficoTartaConsumoAguaGeneral():

 Lee el consumo de los diferentes contadores de agua, por cada contador retorna el nombre y el valor

######  Datos que devuelve: array valores : [{nombre, valor}]

```json
[
   {nombre:"Tanque",valor:"32.141"},{nombre:"Estanque",valor:"14.518"},{nombre:"Lago Norte",valor:"5.395"},{nombre:"Lago Sur",valor:"0.000"},{nombre:"Piscina Exterior",valor:"2.048"},{nombre:"Piscina Interior",valor:"0.000"},{nombre:"Riego",valor:"0.002"},{nombre:"Jacuzzi",valor:"32.141"},{nombre:"General",valor:"14.518"}
]
```



### leerGraficoTartaConsumoAguaAnual():

Lee el consumo de los diferentes contadores de agua para el año dado (por cada contador retorna el nombre y el valor)

###### Datos que recibe: anio

```json
[
   anio
]
```



######  Datos que devuelve: array valores : [{nombre, valor}]

```json
[
   {nombre:"Tanque",valor:"32.141"},{nombre:"Estanque",valor:"14.518"},{nombre:"Lago Norte",valor:"5.395"},{nombre:"Lago Sur",valor:"0.000"},{nombre:"Piscina Exterior",valor:"2.048"},{nombre:"Piscina Interior",valor:"0.000"},{nombre:"Riego",valor:"0.002"},{nombre:"Jacuzzi",valor:"32.141"},{nombre:"General",valor:"14.518"}
]
```



### leerGraficoTartaConsumoAguaMensual():

Lee el consumo de los diferentes contadores de agua para el año y mes dado (por cada contador retorna el nombre y el valor)

###### Datos que recibe: anio, mes

```json
[
   anio
   mes
]
```



######  Datos que devuelve: array valores: [{nombre, valor}]

```json
[
   {nombre:"Tanque",valor:"32.141"},{nombre:"Estanque",valor:"14.518"},{nombre:"Lago Norte",valor:"5.395"},{nombre:"Lago Sur",valor:"0.000"},{nombre:"Piscina Exterior",valor:"2.048"},{nombre:"Piscina Interior",valor:"0.000"},{nombre:"Riego",valor:"0.002"},{nombre:"Jacuzzi",valor:"32.141"},{nombre:"General",valor:"14.518"}
]
```



### leerGraficoTartaConsumoAguaDiario():

Lee el consumo de los diferentes contadores de agua para la fecha dada(por cada contador retorna el nombre y el valor).

###### Datos que recibe: anio, mes, dia

```json
[
   anio
   mes
   dia
]
```



###### Datos que devuelve: array valores: [{nombre, valor}]

```json
[
   {nombre:"Tanque",valor:"32.141"},{nombre:"Estanque",valor:"14.518"},{nombre:"Lago Norte",valor:"5.395"},{nombre:"Lago Sur",valor:"0.000"},{nombre:"Piscina Exterior",valor:"2.048"},{nombre:"Piscina Interior",valor:"0.000"},{nombre:"Riego",valor:"0.002"},{nombre:"Jacuzzi",valor:"32.141"},{nombre:"General",valor:"14.518"}
]
```





## LISTADOS CONSUMO  Agua



### leerListadoConsumoAguaGeneral():

Lee todos los consumos y las medidas del agua

######  Datos que devuelve: objeto valores: listados[{fecha, hora,valor}], medidas[minimo, maximo, fechaminimo, fechamaximo, media]

```json
{
    listados:[
        fecha:
        hora:
        valor:
    ],
    medidas:[
        minimo:
        maximo:
        fechaminimo:
        fechamaximo:
        media:
    ]
}
```



### leerListadoConsumoAguaAnual()

Lee todos los consumos y las medidas del agua, para el año dado

###### Datos que recibe: anio

```json
[
   anio
]
```



######  Datos que devuelve: objeto valores: listados[{fecha, hora,valor}], medidas[minimo, maximo, fechaminimo, fechamaximo, media]

```json
{
    listados:[
        fecha:
        hora:
        valor:
    ],
    medidas:[
        minimo:
        maximo:
        fechaminimo:
        fechamaximo:
        media:
    ]
}
```



### leerListadoConsumoAguaMensual():

Lee todos los consumos y las medidas del agua, para el año y mes dado

###### Datos que recibe: anio, mes

```json
[
   anio
   mes
]
```



######  Datos que devuelve: objeto valores: listados[{fecha, hora,valor}], medidas[minimo, maximo, fechaminimo, fechamaximo, media]

```json
{
    listados:[
        fecha:
        hora:
        valor:
    ],
    medidas:[
        minimo:
        maximo:
        fechaminimo:
        fechamaximo:
        media:
    ]
}
```





### leerListadoConsumoAguaDiario():

Lee todos los consumos y las medidas del agua, para la fecha dado

###### Datos que recibe: anio, mes, dia

```json
[
   anio
   mes
   dia
]
```



######  Datos que devuelve: objeto valores: listados[{fecha, hora,valor}], medidas[minimo, maximo, fechaminimo, fechamaximo, media]

```json
{
    listados:[
        fecha:
        hora:
        valor:
    ],
    medidas:[
        minimo:
        maximo:
        fechaminimo:
        fechamaximo:
        media:
    ]
}
```





## GRAFICOS CONSUMO AGUA CON MAXIMO MINIMO MEDIA

### leerGraficoConsumoAguaGeneralActual():

 Lee todos los consumos y las medidas del agua, actuales

######  Datos que devuelve: objeto valores: listados[{fecha, valor}], medidas[minimo, maximo, fechaminimo, fechamaximo, media]

```json
{
    listados:[
        fecha: anio
        valor:
    ],
    medidas:[
        minimo:
        maximo:
        fechaminimo:
        fechamaximo:
        media:
    ]
}
```



### leerGraficoConsumoAguaAnualActual() 

Lee todos los consumos y las medidas del agua, para el año actual

###### Datos que recibe: anio

```json
[
   anio
]
```



######  Datos que devuelve: objeto valores: listados[{fecha, valor}], medidas[minimo, maximo, fechaminimo, fechamaximo, media]

```json
{
    listados:[
        fecha: mes
        valor:
    ],
    medidas:[
        minimo:
        maximo:
        fechaminimo:
        fechamaximo:
        media:
    ]
}
```



### leerGraficoConsumoAguaMensualActual()

Lee todos los consumos y las medidas del agua, para el año actual

###### Datos que recibe: anio, mes

```json
[
   anio
   mes
]
```



######  Datos que devuelve: objeto valores: listados[{fecha, valor}], medidas[minimo, maximo, fechaminimo, fechamaximo, media]

```json
{
    listados:[
        fecha: dia
        valor:
    ],
    medidas:[
        minimo:
        maximo:
        fechaminimo:
        fechamaximo:
        media:
    ]
}
```



### leerGraficoConsumoAguaDiarioActual()

Lee todos los consumos y las medidas del agua, para el dia actual

###### Datos que recibe: anio, mes, dia

```json
[
   anio
   mes
   dia
]
```



######  Datos que devuelve: objeto valores: listados[{fecha, valor}], medidas[minimo, maximo, fechaminimo, fechamaximo, media]

```json
{
    listados:[
        fecha: hora
        valor:
    ],
    medidas:[
        minimo:
        maximo:
        fechaminimo:
        fechamaximo:
        media:
    ]
}
```

