# Cestas Consumos Generales (Agua y Electricidad):

## Controladores:

### Medidas minimo, maximo, media

#### Consumption/Consumption/readConsumptionMMMGeneral

Obtiene las medidas del contador (minimo, maximo y media)

```php
data: 
1. type (1-> agua, 2-> electricidad, 3-> eficiencia, 4-> energia solar)

Respuesta:
array values: minimum, maximum, average
```

#### Consumption/Consumption/readConsumptionMMMYear

Obtiene las medidas del contador (minimo, maximo y media) para el año dado

```php
data: 
1. type (1-> agua, 2-> electricidad, 3-> eficiencia, 4-> energia solar)
2. year

Respuesta:
array values: minimum, maximum, average
```

#### Consumption/Consumption/readConsumptionMMMMonth

Obtiene las medidas del contador (minimo, maximo y media) para el año y mes dado 

```php
data: 
1. type (1-> agua, 2-> electricidad, 3-> eficiencia, 4-> energia solar)
2. year
3. month

Respuesta:
array values: minimum, maximum, average
```

#### Consumption/Consumption/readConsumptionMMMDay

Obtiene las medidas del contador (minimo, maximo y media) para la fecha dada

```php
data: 
1. type (1-> agua, 2-> electricidad, 3-> eficiencia, 4-> energia solar)
2. year
3. month
4. day

Respuesta:
array values: minimum, maximum, average
```



### Listado consumos y medidas (minimo, maximo, media) actuales 

#### Consumption/Consumption/readCurrentGeneralConsumptionGraph

Lee todos los consumos y las medidas del contador actuales

```php
data: 
1. type (1-> agua, 2-> electricidad, 3-> eficiencia, 4-> energia solar)

Respuesta:
array values:
    array list: date, value
    array mesaures: minimum, maximum, minimumdate, maximumdate, average
```

##### Consumption/Consumption/readCurrentAnnualConsumptionGraph

Lee todos los consumos y las medidas del agua, para el año actual

```php
data: 
1. type (1-> agua, 2-> electricidad, 3-> eficiencia, 4-> energia solar)

Respuesta:
array values:
    array list: date, value
    array mesaures: minimum, maximum, minimumdate, maximumdate, average
```

##### Consumption/Consumption/readCurrentMonthlyConsumptionGraph

Lee todos los consumos y las medidas del agua, para el año y mes actual

```php
data: 
1. type (1-> agua, 2-> electricidad, 3-> eficiencia, 4-> energia solar)

Respuesta:
array values:
    array list: date, value
    array mesaures: minimum, maximum, minimumdate, maximumdate, average
```

##### Consumption/Consumption/readCurrentMonthlyConsumptionGraph

Lee todos los consumos y las medidas del agua, para la fecha actual

```php
data: 
1. type (1-> agua, 2-> electricidad, 3-> eficiencia, 4-> energia solar)

Respuesta:
array values:
    array list: date, value
    array mesaures: minimum, maximum, minimumdate, maximumdate, average
```



### Listado Consumos


#### 	Consumption/Consumption/readGeneralConsumptionGraph

Lee el consumo de los diferentes años

```php
data: 
1. type (1-> agua, 2-> electricidad, 3-> eficiencia, 4-> energia solar)

Respuesta:
array values: value - date(years)
```

#### 	Consumption/Consumption/readAnnualConsumptionGraph

Lee el consumo de los diferentes meses del año dado

```php
data: 
1. type (1-> agua, 2-> electricidad, 3-> eficiencia, 4-> energia solar)
2. year

Respuesta:
array values: value - date(months)
```

#### Consumption/Consumption/readMonthlyConsumptionGraph

Lee el consumo de los diferentes dias del año y mes dado

```php
data: 
1. type (1-> agua, 2-> electricidad, 3-> eficiencia, 4-> energia solar)
2. year
3. month

Respuesta:
array values: value - date(days)
```

#### Consumption/Consumption/readDailyConsumptionGraph

Lee el consumo de los diferentes horas de la fecha dada

```php
data: 
1. type (1-> agua, 2-> electricidad, 3-> eficiencia, 4-> energia solar)
2. year
3. month
4. day

Respuesta:
array values: value - date(hours)
```

​    

### Consumos Grafico Tarta

#### Consumption/Consumption/readGeneralConsumptionPieChart

Lee el consumo de los diferentes contadores, por cada contador retorna el nombre y el valor

```php
data: 
1. type (1-> agua, 2-> electricidad, 3-> eficiencia, 4-> energia solar)

Respuesta:
array values: name, value
```

#### Consumption/Consumption/readAnnualConsumptionPieChart

Lee el consumo de los diferentes contadores, por cada contador retorna el nombre y el valor

```php
data: 
1. type (1-> agua, 2-> electricidad, 3-> eficiencia, 4-> energia solar)
2. year

Respuesta:
array values: name, value
```

#### Consumption/Consumption/readMonthlyConsumptionPieChart

Lee el consumo de los diferentes contadores, por cada contador retorna el nombre y el valor

```php
data: 
1. type (1-> agua, 2-> electricidad, 3-> eficiencia, 4-> energia solar)
2. year
3. month

Respuesta:
array values: name, value
```

#### Consumption/Consumption/readDailyConsumptionPieChart

Lee el consumo de los diferentes contadores, por cada contador retorna el nombre y el valor

```php
data: 
1. type (1-> agua, 2-> electricidad, 3-> eficiencia, 4-> energia solar)
2. year
3. month
4. day

Respuesta:
array values: name, value
```



### Listado Consumos y medidas


### 	Consumption/Consumption/readGeneralConsumptionList

Lee todos los consumos y las medidas del agua

```php
data: 
1. type (1-> agua, 2-> electricidad, 3-> eficiencia, 4-> energia solar)

Respuesta:
array values:
	array list: date, time , value
 	array measures: minimum, maximum, minimumdate, maximumdate, average
```

### 	Consumption/Consumption/readAnnualConsumptionList

Lee todos los consumos y las medidas del contador para el año dado

```php
data: 
1. type (1-> agua, 2-> electricidad, 3-> eficiencia, 4-> energia solar)
2. year

Respuesta:
array values:
	array list: date, time , value
 	array measures: minimum, maximum, minimumdate, maximumdate, average
```

#### Consumption/Consumption/readMonthlylConsumptionList

Lee todos los consumos y las medidas del contador para el año y mes dado

```php
data: 
1. type (1-> agua, 2-> electricidad, 3-> eficiencia, 4-> energia solar)
2. year
3. month

Respuesta:
array values:
	array list: date, time , value
 	array measures: minimum, maximum, minimumdate, maximumdate, average
```

#### Consumption/Consumption/readDailyConsumptionList

Lee todos los consumos y las medidas del contador para la fecha dada

```php
data: 
1. type (1-> agua, 2-> electricidad, 3-> eficiencia, 4-> energia solar)
2. year
3. month
4. day

Respuesta:
array values:
	array list: date, time , value
 	array measures: minimum, maximum, minimumdate, maximumdate, average
```



### Consumos Minimo, Maximo, Media Del Año actual

#### Consumption/Consumption/readCurrentConsumptionMMMMonth

```php
data: 
1. type (1-> agua, 2-> electricidad, 3-> eficiencia, 4-> energia solar)

Respuesta:
array values: minimum, maximum, average, consumption, datemaximum, dateminimum
```

#### Consumption/Consumption/readConsumptionMonthInCourse

Lee consumo del mes actual, mes anterior y la equivalencia de la medicion

```php
data: 
1. type (1-> agua, 2-> electricidad, 3-> eficiencia, 4-> energia solar)

Respuesta:
array values: value1, value2 y value3
```



#### Consumption/Consumption/readTodayConsumption

Lee consumo del dia actual, dia anterior y la equivalencia de la medicion

```php
data: 
1. type (1-> agua, 2-> electricidad, 3-> eficiencia, 4-> energia solar)

Respuesta:
array values: value1, value2 y total
```

#### Consumption/Consumption/readMeter

Lee contador

```php
data: 
1. type (1-> agua, 2-> electricidad, 3-> eficiencia, 4-> energia solar)

Respuesta:
values
```

#### Consumption/Consumption/readAllMeters

Lee los contadores generales de agua, luz y gas

```
data:

Respuesta:
       { 
           electricity : {today:{array values: value1, value2 y total}, meter: values}, 	
           water: {today{array values: value1, value2 y total}, meter: values}, 	
           gas : {today{array values: value1, value2 y total}, meter: values}, 	
       }
```



### EFICIENCIA ENERGETICA

#### Consumption/Consumption/readEnergyControl

```php
Respuesta:
object (code, values { referencia, global, anual, mes, dia, 
                      globalkw, anualkw, meskw, diakw, 
                      globaleuros, anualeuros, meseuros, diaeuros, 
                      globalco2, anualco2, mesco2, diaco2, 
                      globalarbol, anualarbol, mesarbol, diaarbol})
```



### ENERGIA SOLAR (APORTE SOLAR)

#### Energiasolar/Energiasolar/leerProduccionEnergiasRenovables -> Consumption/Consumption/readRenewableEnergyProduction

lee ahorro en kw/h global mes actual y dia actual

```php
Respuesta:
object: (code, values { global, global_tree, global_co2, month, month_tree,month_co2, day, daya_tree, day_co2}
```

 

#### Energiasolar/Energiasolar/leerAporteSolarInstantaneo -> Consumption/Consumption/readInstantaneousSolarContribution

```php
Data:
1. year
2. month
3. day
4. hout
5. minute
    
Respuesta:
object: (code, value: {ligth,solar} }
```

   

#### Energiasolar/Energiasolar/leerAporteSolarGlobal -> Consumption/Consumption/readGlobalSolarContribution

```php
Data:
    
Respuesta:
object: (code, value: value}
```

#### Energiasolar/Energiasolar/leerImpactoCo2Global -> Consumption/Consumption/readGlobalCo2Impact

Lee impacto C02 global aporte +26

```php
Data:
    
Respuesta:
object: (code, values: global, global_tree}
```

   

// GRAFICOS  Energia solar

#### Energiasolar/Energiasolar/leerGraficoKWAporteSolarLuzMensual -> Consumption/Consumption/readGraphKWSolarContributionLightMonthly

```php
Data:
1. year
2. month
    
Respuesta:
object: (code, values: [value1, value2 (fecha-dias) ]}
```



#### Energiasolar/Energiasolar/leerGraficoAporteSolarLuzSoloDiaMensual -> Consumption/Consumption/ReadGraphSolarContributionLightOnlyDayMonthly

```php
Data:
1. year
2. month
    
Respuesta:
object: (code, values: [value1, value2 (fecha-dias) ]}
```



#### Energiasolar/Energiasolar/leerGraficoAporteSolarLuzGeneral -> Consumption/Consumption/readGraphSolarContributionGeneralLight

```php
Data:
    
Respuesta:
object: (code, values: [value1, value2 (fecha-anos) ]}
```



#### Energiasolar/Energiasolar/leerGraficoAporteSolarLuzAnual -> Consumption/Consumption/readGraphSolarContributionAnnualLight

```php
Data:
1. year
    
Respuesta:
object: (code, values: [value1, value2 (fecha-meses) ]}
```



#### Energiasolar/Energiasolar/leerGraficoAporteSolarLuzMensual -> Consumption/Consumption/readGraphSolarContributionMonthlyLight

```php
Data:
1. year
2. month
    
Respuesta:
object: (code, values: [value1, value2 (fecha-dias) ]}
```



#### Energiasolar/Energiasolar/leerGraficoAporteSolarLuzDiario -> Consumption/Consumption/readGraphSolarContributionDailyLight

```php
Data:
1. year
2. month
3. day    
    
Respuesta:
object: (code, values: [value1, value2 (fecha-hora) ]}
```





#### Energiasolar/Energiasolar/leerGraficoAporteSolarLuzGeneralActual -> Consumption/Consumption/readGraphSolarContributionCurrentGeneralLight

```php
Data:
    
Respuesta:
object: (code, values: 
         array list: date, value    
         array mesaures: minimum, maximum, minimumdate, maximumdate, average ]
         impact:value}
```



#### Energiasolar/Energiasolar/leerGraficoAporteSolarLuzAnualActual -> Consumption/Consumption/readGraphSolarContributionCurrentAnnualLight

```php
Data:
1. year
    
Respuesta:
object: (code, values: 
         array list: date, value    
         array mesaures: minimum, maximum, minimumdate, maximumdate, average ]
         impact:value}
```



#### Energiasolar/Energiasolar/leerGraficoAporteSolarLuzMensualActual -> Consumption/Consumption/readGraphSolarContributionCurrentMonthlyLight

```php
Data:
1. year
2. month
    
Respuesta:
object: (code, values: 
         array list: date, value    
         array mesaures: minimum, maximum, minimumdate, maximumdate, average ]
         impact:value}
```



#### Energiasolar/Energiasolar/leerGraficoAporteSolarLuzDiarioActual -> Consumption/Consumption/readGraphSolarContributionCurrentDailyLight

```php
Data:
1. year
2. month
3. day
    
Respuesta:
object: (code, values: 
         array list: date, value    
         array mesaures: minimum, maximum, minimumdate, maximumdate, average ]
         impact:value}
```



GRAFICO TARTA APORTE SOLAR  LUZ 

#### Energiasolar/Energiasolar/leerGraficoTartaAporteSolarLuzGeneral -> Consumption/Consumption/readSolarContributionGeneralLightPieChart

```php
Data:
    
Respuesta:
object: (code, array values: name, value
```

#### Energiasolar/Energiasolar/leerGraficoTartaAporteSolarLuzAnual -> Consumption/Consumption/readSolarContributionAnnualLightPieChart

```php
Data:
1. year
    
Respuesta:
object: (code, array values: name, value
```

#### Energiasolar/Energiasolar/leerGraficoTartaAporteSolarLuzMensual -> Consumption/Consumption/readSolarContributionMonthlyLightPieChart

```php
Data:
1. year
2. month
    
Respuesta:
object: (code, array values: name, value
```

#### Energiasolar/Energiasolar/leerGraficoTartaAporteSolarLuzDiario -> Consumption/Consumption/readSolarContributionDailyLightPieChart

```php
Data:
1. year
2. month
3. day
    
Respuesta:
object: (code, array values: name, value
```

