[TOC]



# Cestas Consumos Agua:

## Controladores:

### Medidas minimo, maximo, media

#### Consumption/Water/readConsumptionMMMGeneralWater

Obtiene las medidas de la Agua (minimo, maximo y media)

```
RESPUESTA
array values: minimum, maximum, average
```

#### Consumption/Water/readConsumptionMMMYearWater

Obtiene las medidas de la Agua (minimo, maximo y media) para el año dado

```
data: 
1. year

RESPUESTA
array values: minimum, maximum, average
```

#### Consumption/Water/readConsumptionMMMMonthWater

Obtiene las medidas de la Agua (minimo, maximo y media) para el año y mes dado 

```
data:
1. year
2. month

RESPUESTA
array values: minimum, maximum, average
```

#### Consumption/Water/readConsumptionMMMDayWater

Obtiene las medidas de la Agua (minimo, maximo y media) para la fecha dada

```
data:
1. year
2. month
3. day

RESPUESTA
array values: minimum, maximum, average
```



### Listado consumos y medidas (minimo, maximo, media) actuales 

#### Consumption/Water/readCurrentGeneralWaterConsumptionGraph

Lee todos los consumos y las medidas del agua, actuales

```
RESPUESTA
array values:
    array list: date, value
    array mesaures: minimum, maximum, minimumdate, maximumdate, average
```

##### Consumption/Water/readCurrentAnnualWaterConsumptionGraph

Lee todos los consumos y las medidas del agua, para el año actual

```
RESPUESTA
array values:
    array list: date, value
    array mesaures: minimum, maximum, minimumdate, maximumdate, average
```

##### Consumption/Water/readCurrentMonthlyWaterConsumptionGraph

Lee todos los consumos y las medidas del agua, para el año y mes actual

```
RESPUESTA
array values:
    array list: date, value
    array mesaures: minimum, maximum, minimumdate, maximumdate, average
```

##### Consumption/Water/readCurrentMonthlyWaterConsumptionGraph

Lee todos los consumos y las medidas del agua, para la fecha actual

```
RESPUESTA
array values:
    array list: date, value
    array mesaures: minimum, maximum, minimumdate, maximumdate, average
```



### Listado Consumos


#### 	Consumption/Water/readGeneralWaterConsumptionGraph

Lee el consumo de los diferentes años

```
RESPUESTA
array values: value - date(years)
```

#### 	Consumption/Water/readAnnualWaterConsumptionGraph

Lee el consumo de los diferentes meses del año dado

```
data:
1. year

RESPUESTA
array values: value - date(months)
```

#### Consumption/Water/readMonthlyWaterConsumptionGraph

Lee el consumo de los diferentes dias del año y mes dado

```
data:
1. year
2. month

RESPUESTA
array values: value - date(days)
```

#### Consumption/Water/readDailyWaterConsumptionGraph

Lee el consumo de los diferentes horas de la fecha dada

```
data:
1. year
2. month
3. day

RESPUESTA
array values: value - date(hours)
```

​    

### Consumos Grafico Tarta

#### Consumption/Water/readGeneralWaterConsumptionPieChart

Lee el consumo de los diferentes contadores de agua, por cada contador retorna el nombre y el valor

```
RESPUESTA:
array values: name, value
```

#### Consumption/Water/readAnnualWaterConsumptionPieChart

Lee el consumo de los diferentes contadores de agua, por cada contador retorna el nombre y el valor

```
data:
1. year

RESPUESTA:
array values: name, value
```

#### Consumption/Water/readMonthlyWaterConsumptionPieChart

Lee el consumo de los diferentes contadores de agua, por cada contador retorna el nombre y el valor

```
data:
1. year
2. month

RESPUESTA:
array values: name, value
```

#### Consumption/Water/readDailyWaterConsumptionPieChart

Lee el consumo de los diferentes contadores de agua, por cada contador retorna el nombre y el valor

```
data:
1. year
2. month
3. day

RESPUESTA:
array values: name, value
```



### Listado Consumos y medidas


### 	Consumption/Water/readGeneralWaterConsumptionList

Lee todos los consumos y las medidas del agua

```
RESPUESTA:
array values:
	array list: date, time , value
 	array measures: minimum, maximum, minimumdate, maximumdate, average
```

### 	Consumption/Water/readAnnualWaterConsumptionList

Lee todos los consumos y las medidas del agua para el año dado

```
data:
1. year

RESPUESTA:
array values:
	array list: date, time , value
 	array measures: minimum, maximum, minimumdate, maximumdate, average
```

#### Consumption/Water/readMonthlylWaterConsumptionList

Lee todos los consumos y las medidas del agua para el año y mes dado

```
data:
1. year
2. month

RESPUESTA:
array values:
	array list: date, time , value
 	array measures: minimum, maximum, minimumdate, maximumdate, average
```

#### Consumption/Water/readDailyWaterConsumptionList

Lee todos los consumos y las medidas del agua para la fecha dada

```
data:
1. year
2. month
3. day

RESPUESTA:
array values:
	array list: date, time , value
 	array measures: minimum, maximum, minimumdate, maximumdate, average
```



### Consumos Minimo, Maximo, Media Del Año actual

#### Consumption/Water/readCurrentConsumptionMMMMonthWater

```
RESPUESTA
array values: minimum, maximum, average, consumption, datemaximum, dateminimum
```

#### Consumption/Water/readConsumptionMonthInCourseWater

Lee consumo del mes actual, mes anterior y la equivalencia de agua

```
RESPUESTA:
array values: value1, value2 y value3
```



#### Consumption/Water/readTodayConsumptionWater

Lee consumo del dia actual, dia anterior y la equivalencia de agua

```
RESPUESTA:
array values: value1, value2 y total
```

#### Consumption/Water/readWaterMeter

Lee contador de Agua

```
RESPUESTA:
values
```

