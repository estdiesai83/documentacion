## Cestas Red Electrica:

#### Controladores:

1. ##### Consumption/Electricity/readConsumptionMMMGeneralLight

   Obtiene las medidas de la luz (minimo, maximo y media)
   
   ```
   * RESPUESTA
   * array values : minimum, maximum, average
   ```
   
2. ##### Consumption/Electricity/readConsumptionMMMYearLight

   ```
   data: 
   1. year
   
   * RESPUESTA
   * array values : minimum, maximum, average
   ```
   
   Obtiene las medidas de la luz (minimo, maximo y media) para el año dado
   
3. ##### Consumption/Electricity/readConsumptionMMMMonthLight

   ```
   data:
   1. year
   2. month
   
   * RESPUESTA
   * array values : minimum, maximum, average
   ```
   

Obtiene las medidas de la luz (minimo, maximo y media) para el año y mes dado 

4. ##### Consumption/Electricity/readConsumptionMMMDayLight

   ```
   data:
   1. year
   2. month
   3. day
   
   * RESPUESTA
   * array values : minimum, maximum, average
   ```

   Obtiene las medidas de la luz (minimo, maximo y media) para la fecha dada

   

6. ##### Consumption/Electricity/readCurrentGeneralLightConsumptionGraph

7. ##### Consumption/Electricity/readCurrentAnnualLightConsumptionGraph

   ```
   data:
   1. year
   ```

   

7. ##### Consumption/Electricity/readCurrentMonthlyLightConsumptionGraph

   ```
   data:
   1. year
   2. month
   ```

   

9. ##### Consumption/Electricity/readCurrentMonthlyLightConsumptionGraph

   ```
   data:
   1. year
   2. month
   3. day
   ```
   
   
   
10. ##### Consumption/Electricity/readGeneralLightConsumptionGraph

    
    
11. ##### Consumption/Electricity/readAnnualLightConsumptionGraph

    ```
    data:
    1. year
    ```

    

12. ##### Consumption/Electricity/readMonthlyLightConsumptionGraph

    ```
    data:
    1. year
    2. month
    ```
    
    
    
12. ##### Consumption/Electricity/readDailyLightConsumptionGraph

    ```
    data:
    1. year
    2. month
    3. day
    ```

​    


13. ##### Consumption/Electricity/readGeneralLightConsumptionPieChart

14. ##### Consumption/Electricity/readAnnualLightConsumptionPieChart

    ```
    data:
    1. year
    ```

    

15. ##### Consumption/Electricity/readMonthlyLightConsumptionPieChart

    ```
    data:
    1. year
    2. month
    ```

    

16. ##### Consumption/Electricity/readDailyLightConsumptionPieChart

    ```
    data:
    1. year
    2. month
    3. day
    ```

    

17. ##### Consumption/Electricity/readGeneralLightConsumptionList

18. ##### Consumption/Electricity/readAnnualLightConsumptionList

    Lee todos los consumos y las medidas para el año dado

    ```
    data:
    1. year
    
    RESPUESTA:
    array values:
        array list: date, time , value
        array measures: minimum, maximum, minimumdate, maximumdate, average
    ```

19. ##### Consumption/Electricity/readMonthlyLightConsumptionList

    Lee todos los consumos y las medidas para el año y mes dado

    ```
    data:
    1. year
    2. month
    
    RESPUESTA:
    array values:
        array list: date, time , value
        array measures: minimum, maximum, minimumdate, maximumdate, average
    ```

20. ##### Consumption/Electricity/readDailyLightConsumptionList

Lee todos los consumos y las medidas para la fecha dada

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



