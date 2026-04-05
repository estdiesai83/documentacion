[TOC]

# PRUEBAS API

## Data/getConfig

```bash
curl -d -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Data/getConfig
```

## Domo:

### Ligths:

```bash
curl -d '{"id": "1","status": "1"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Domo/Lights/changeLoungeLightStatus
curl -d '{"id": "1","status": "1"}' -X POST http://monjas.hometech.red/api/public/index.php/Domo/Lights/changeLoungeLightStatus

curl -d '{"id": "1","zone_id": "1","status": "1"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Domo/Lights/changeZoneLightStatus
curl -d '{"id": "1","zone_id": "1","status": "1"}' -X POST http://monjas.hometech.red/api/public/index.php/Domo/Lights/changeZoneLightStatus

curl -d '{"id": "1","zone_id": "8","intensity": "100"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Domo/Lights/changeLightIntensityZone
curl -d '{"id": "1","zone_id": "8","intensity": "100"}' -X POST http://monjas.hometech.red/api/public/index.php/Domo/Lights/changeLightIntensityZone

curl -d '{"id": "1","zone_id": "1", "color": "255$200$0","intensity": "50"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Domo/Lights/changeColorLightZone

curl -d '{"id": "1", "type": "1"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Domo/Lights/changeSceneLightLounge
```



### Iot:

```bash
curl -d '{"id":"4","status":"1"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Domo/Iot/changeLoungeIotStatus
curl -d '{"id":"4","status":"1"}' -X POST http://monjas.hometech.red/api/public/index.php/Domo/Iot/changeLoungeIotStatus

curl -d '{"id":"4","zone_id":"1","status":"1"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Domo/Iot/changeZoneIotStatus
```



### Climate:

```bash
curl -d '{"id":"1","status":"1"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Domo/Climate/changeClimateStatusLounge

curl -d '{"id":"1","id_zone":"1","status":"1"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Domo/Climate/changeClimateStatusZone

curl -d '{"id":"1","id_zone":"1","value":"1"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Domo/Climate/changeClimateZoneConsigna
curl -d '{"id":"1","id_zone":"1","value":"1"}' -X POST http://monjas.hometech.red/api/public/index.php/Domo/Climate/changeClimateZoneConsigna
```



### Domo:

```
curl -d '{"scene_id":"1","type":"1"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Domo/Domo/activateScene
```





## Security

```bash
curl -d -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Security/getSecurity
```



## Access

```bash
curl -d '{"id":"6","status":"1"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Access/changeAccessStatus
curl -d '{"id":"6","status":"1"}' -X POST http://monjas.hometech.red/api/public/index.php/Access/changeAccessStatus
```





## Consumption

### Agua

```bash
curl -d -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Water/readConsumptionMMMGeneralWater
EJ: "values":[{"minimum":"0.011","maximum":"0.330","minimundate":"12-11-2021","maximundate":"08-10-2021","average":"0.060"}]

curl -d '{"year":"2021"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Water/readConsumptionMMMYearWater
Ej: "values":[{"minimum":"0.011","maximum":"0.330","minimundate":"12-11-2021","maximundate":"08-10-2021","average":"0.060"}]

curl -d '{"year":"2021", "month":"10"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Water/readConsumptionMMMMonthWater
Ej: "values":[{"minimum":"0.013","maximum":"0.330","minimundate":"30-10-2021","maximundate":"08-10-2021","average":"0.085"}]

curl -d '{"year":"2021", "month":"10", "day":"10"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Water/readConsumptionMMMDayWater
Ej: "values":[{"minimum":"0.000","maximum":"0.031","minimundate":"00 h.","maximundate":"08 h.","average":"0.001"}]



curl -d -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Water/readCurrentGeneralWaterConsumptionGraph
EJ: "values":{"list":[{"date":"02-12-2021 09:12:34","value":"3.581"}],"measures":[{"minimum":"0.011","maximum":"0.330","minimundate":"12-11-2021","maximundate":"08-10-2021","average":"0.060"}]}

curl -d '{"year":"2021"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Water/readCurrentAnnualWaterConsumptionGraph
Ej: "values":{"list":[{"date":"2021","value":"3.408"}],"measures":[{"minimum":"0.011","maximum":"0.330","minimundate":"12-11-2021","maximundate":"08-10-2021","average":"0.060"}]}

curl -d '{"year":"2021", "month":"10"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Water/readCurrentMonthlyWaterConsumptionGraph
Ej: "values":{"list":[{"date":"Octubre","value":"2.031"}],"measures":[{"minimum":"0.013","maximum":"0.330","minimundate":"30-10-2021","maximundate":"08-10-2021","average":"0.085"}]}

curl -d '{"year":"2021", "month":"10", "day":"10"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Water/readCurrentMonthlyWaterConsumptionGraph
Ej: "values":{"list":[{"date":"Octubre","value":"2.031"}],"measures":[{"minimum":"0.013","maximum":"0.330","minimundate":"30-10-2021","maximundate":"08-10-2021","average":"0.085"}]}






curl -d -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Water/readGeneralWaterConsumptionGraph
EJ: "values":[{"date":"2021","value":"3.408"}]

curl -d '{"year":"2021"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Water/readAnnualWaterConsumptionGraph
Ej: "values":[{"date":"OCT","value":"2.031"},{"date":"NOV","value":"1.332"},{"date":"DIC","value":"0.045"}]

curl -d '{"year":"2021", "month":"10"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Water/readMonthlyWaterConsumptionGraph
Ej: "values":[{"date":"8","value":"0.330"},{"date":"9","value":"0.110"},{"date":"10","value":"0.031"},{"date":"11","value":"0.049"},{"date":"12","value":"0.088"},{"date":"13","value":"0.066"},{"date":"14","value":"0.094"},{"date":"15","value":"0.036"},{"date":"16","value":"0.052"},{"date":"17","value":"0.067"},{"date":"18","value":"0.074"},{"date":"19","value":"0.057"},{"date":"20","value":"0.033"},{"date":"21","value":"0.077"},{"date":"22","value":"0.090"},{"date":"23","value":"0.144"},{"date":"24","value":"0.125"},{"date":"25","value":"0.144"},{"date":"26","value":"0.146"},{"date":"27","value":"0.046"},{"date":"28","value":"0.065"},{"date":"29","value":"0.049"},{"date":"30","value":"0.013"},{"date":"31","value":"0.045"}]

curl -d '{"year":"2021", "month":"10", "day":"10"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Water/readDailyWaterConsumptionGraph
Ej: "values":[{"date":"00","value":"0.000"},{"date":"01","value":"0.000"},{"date":"02","value":"0.000"},{"date":"03","value":"0.000"},{"date":"04","value":"0.000"},{"date":"05","value":"0.000"},{"date":"06","value":"0.000"},{"date":"07","value":"0.000"},{"date":"08","value":"0.031"},{"date":"09","value":"0.000"},{"date":"10","value":"0.000"},{"date":"11","value":"0.000"},{"date":"12","value":"0.000"},{"date":"13","value":"0.000"},{"date":"14","value":"0.000"},{"date":"15","value":"0.000"},{"date":"16","value":"0.000"},{"date":"17","value":"0.000"},{"date":"18","value":"0.000"},{"date":"19","value":"0.000"},{"date":"20","value":"0.000"},{"date":"21","value":"0.000"},{"date":"22","value":"0.000"},{"date":"23","value":"0.000"}]









curl -d -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Water/readGeneralWaterConsumptionPieChart
EJ: "values":[{"nombre":"Tanque","valor":"65.529"},{"nombre":"Estanque","valor":"3.408"},{"nombre":"Lago Norte","valor":"4.651"},{"nombre":"Lago Sur","valor":null},{"nombre":"Piscina Exterior","valor":"1.284"},{"nombre":"Piscina Interior","valor":"111.531"},{"nombre":"Riego","valor":"0.002"},{"nombre":"Jacuzzi","valor":"65.529"},{"nombre":"General","valor":"3.408"}]

curl -d '{"year":"2021"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Water/readAnnualWaterConsumptionPieChart
Ej: "values":[{"nombre":"Tanque","valor":"65.529"},{"nombre":"Estanque","valor":"3.408"},{"nombre":"Lago Norte","valor":"4.651"},{"nombre":"Lago Sur","valor":null},{"nombre":"Piscina Exterior","valor":"1.284"},{"nombre":"Piscina Interior","valor":"111.531"},{"nombre":"Riego","valor":"0.002"},{"nombre":"Jacuzzi","valor":"65.529"},{"nombre":"General","valor":"3.408"}]

curl -d '{"year":"2021", "month":"10"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Water/readMonthlyWaterConsumptionPieChart
Ej: "values":[{"nombre":"Tanque","valor":"28.751"},{"nombre":"Estanque","valor":"2.031"},{"nombre":"Lago Norte","valor":"3.348"},{"nombre":"Lago Sur","valor":null},{"nombre":"Piscina Exterior","valor":"1.284"},{"nombre":"Piscina Interior","valor":"83.478"},{"nombre":"Riego","valor":null},{"nombre":"Jacuzzi","valor":"28.751"},{"nombre":"General","valor":"2.031"}]

curl -d '{"year":"2021", "month":"10", "day":"10"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Water/readDailyWaterConsumptionPieChart
Ej: "values":[{"nombre":"Tanque","valor":"0.199"},{"nombre":"Estanque","valor":"0.031"},{"nombre":"Lago Norte","valor":"0.000"},{"nombre":"Lago Sur","valor":null},{"nombre":"Piscina Exterior","valor":null},{"nombre":"Piscina Interior","valor":"2.800"},{"nombre":"Riego","valor":null},{"nombre":"Jacuzzi","valor":"0.199"},{"nombre":"General","valor":"0.031"}]








curl -d -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Water/readGeneralWaterConsumptionList
EJ: "values":{"list":[{"date":"08-10-2021","time":"12:25:17","value":"0.173"},{"date":"08-10-2021","time":"13:18:26","value":"0.320"},....,{"date":"09-12-2021","time":"17:00:00","value":"0.000"}],"measures":[{"minimum":"0.011","maximum":"0.330","minimundate":"12-11-2021","maximundate":"08-10-2021","average":"0.060"}]}

curl -d '{"year":"2021"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Water/readAnnualWaterConsumptionList
Ej: "values":{"list":[{"date":"08-10-2021","time":"12:25:17","value":"0.173"},{"date":"08-10-2021","time":"13:18:26","value":"0.320"},....,{"date":"09-12-2021","time":"17:00:00","value":"0.000"}],"measures":[{"minimum":"0.011","maximum":"0.330","minimundate":"12-11-2021","maximundate":"08-10-2021","average":"0.060"}]}

curl -d '{"year":"2021", "month":"10"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Water/readMonthlyWaterConsumptionList
Ej: "values":{"list":[{"date":"08-10-2021","time":"12:25:17","value":"0.173"},{"date":"08-10-2021","time":"13:18:26","value":"0.320"},....,{"date":"31-10-2021","time":"22:00:00","value":"0.000"},{"date":"31-10-2021","time":"23:00:00","value":"0.000"}],"measures":[{"minimum":"0.013","maximum":"0.330","minimundate":"30-10-2021","maximundate":"08-10-2021","average":"0.085"}]}

curl -d '{"year":"2021", "month":"10", "day":"10"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Water/readDailyWaterConsumptionList
Ej: "values":{"list":[{"date":"10-10-2021","time":"00:00:00","value":"0.000"},{"date":"10-10-2021","time":"01:00:00","value":"0.000"},{"date":"10-10-2021","time":"02:00:00","value":"0.000"},{"date":"10-10-2021","time":"03:00:00","value":"0.000"},{"date":"10-10-2021","time":"04:00:00","value":"0.000"},{"date":"10-10-2021","time":"05:00:00","value":"0.000"},{"date":"10-10-2021","time":"06:00:00","value":"0.000"},{"date":"10-10-2021","time":"07:00:00","value":"0.000"},{"date":"10-10-2021","time":"08:47:59","value":"0.031"},{"date":"10-10-2021","time":"09:00:00","value":"0.000"},{"date":"10-10-2021","time":"10:00:00","value":"0.000"},{"date":"10-10-2021","time":"11:00:00","value":"0.000"},{"date":"10-10-2021","time":"12:00:00","value":"0.000"},{"date":"10-10-2021","time":"13:00:00","value":"0.000"},{"date":"10-10-2021","time":"14:00:00","value":"0.000"},{"date":"10-10-2021","time":"15:00:00","value":"0.000"},{"date":"10-10-2021","time":"16:00:00","value":"0.000"},{"date":"10-10-2021","time":"17:00:00","value":"0.000"},{"date":"10-10-2021","time":"18:00:00","value":"0.000"},{"date":"10-10-2021","time":"19:00:00","value":"0.000"},{"date":"10-10-2021","time":"20:00:00","value":"0.000"},{"date":"10-10-2021","time":"21:00:00","value":"0.000"},{"date":"10-10-2021","time":"22:00:00","value":"0.000"},{"date":"10-10-2021","time":"23:00:00","value":"0.000"}],"measures":[{"minimum":"0.000","maximum":"0.031","minimundate":"00 h.","maximundate":"08 h.","average":"0.001"}]}


curl -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Water/readWaterMeter
EJ: "values":"3.408"

curl -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Water/readTodayConsumptionWater
Ej: "values":{"value1":0,"value2":0,"total":"5"}

curl -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Water/readCurrentConsumptionMMMMonthWater
Ej: "values":[{"minimum":"0.018","maximum":"0.025","minimumdate":"02-12-2021","maximumdate":"01-12-2021","average":"0.022","consumption":"0.045","total":"100"}]

curl -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Water/readConsumptionMonthInCourseWater
Ej: "values":{"value1":"1.332","value2":"0.063","value3":"0.045"}
```



## Red Electrica:

```bash
curl -d -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Electricity/readConsumptionMMMGeneralLight
EJ: "values":[{"minimum":"3.000","maximum":"143894.000","minimundate":"29-09-2021","maximundate":"30-09-2021","average":"2441.413"}]

curl -d '{"year":"2021"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Electricity/readConsumptionMMMYearLight
Ej: "values":[{"minimum":"3.000","maximum":"143894.000","minimundate":"29-09-2021","maximundate":"30-09-2021","average":"2441.413"}]

curl -d '{"year":"2021", "month":"10"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Electricity/readConsumptionMMMMonthLight
Ej: "values":[{"minimum":"3.000","maximum":"310.000","minimundate":"01-10-2021","maximundate":"11-10-2021","average":"137.069"}]

curl -d '{"year":"2021", "month":"10", "day":"10"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Electricity/readConsumptionMMMDayLight
Ej: "values":[{"minimum":"0.000","maximum":"5.000","minimundate":"09 h.","maximundate":"08 h.","average":"1.500"}]}



curl -d -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Electricity/readCurrentGeneralLightConsumptionGraph
EJ: "values":{"list":[{"date":"02-12-2021 09:12:01","value":"154580.000"}],"measures":[{"minimum":"3.000","maximum":"143894.000","minimundate":"29-09-2021","maximundate":"30-09-2021","average":"2441.413"}]}

curl -d '{"year":"2021"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Electricity/readCurrentAnnualLightConsumptionGraph
Ej: "values":{"list":[{"date":"2021","value":"10805.000"}],"measures":[{"minimum":"3.000","maximum":"143894.000","minimundate":"29-09-2021","maximundate":"30-09-2021","average":"2441.413"}]}

curl -d '{"year":"2021", "month":"10"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Electricity/readCurrentMonthlyLightConsumptionGraph
Ej: "values":{"list":[{"date":"Octubre","value":"4398.000"}],"measures":[{"minimum":"3.000","maximum":"310.000","minimundate":"01-10-2021","maximundate":"11-10-2021","average":"137.069"}]}

curl -d '{"year":"2021", "month":"10", "day":"10"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Electricity/readCurrentMonthlyLightConsumptionGraph
Ej: "values":{"list":[{"date":"Octubre","value":"4398.000"}],"measures":[{"minimum":"3.000","maximum":"310.000","minimundate":"01-10-2021","maximundate":"11-10-2021","average":"137.069"}]}






curl -d -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Electricity/readGeneralLightConsumptionGraph
EJ: "values":[{"date":"2021","value":"10805.000"}]

curl -d '{"year":"2021"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Electricity/readAnnualLightConsumptionGraph
Ej: "values":[{"date":"SEP","value":"119.000"},{"date":"OCT","value":"4398.000"},{"date":"NOV","value":"5874.000"},{"date":"DIC","value":"285.000"}]

curl -d '{"year":"2021", "month":"10"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Electricity/readMonthlyLightConsumptionGraph
Ej: "values":[{"date":"1","value":"3.000"},{"date":"4","value":"95.000"},{"date":"5","value":"137.000"},{"date":"6","value":"137.000"},{"date":"7","value":"143.000"},{"date":"8","value":"149.000"},{"date":"9","value":"143.000"},{"date":"10","value":"36.000"},{"date":"11","value":"310.000"},{"date":"12","value":"167.000"},{"date":"13","value":"158.000"},{"date":"14","value":"173.000"},{"date":"15","value":"146.000"},{"date":"16","value":"140.000"},{"date":"17","value":"132.000"},{"date":"18","value":"148.000"},{"date":"19","value":"135.000"},{"date":"20","value":"117.000"},{"date":"21","value":"158.000"},{"date":"22","value":"113.000"},{"date":"23","value":"125.000"},{"date":"24","value":"120.000"},{"date":"25","value":"126.000"},{"date":"26","value":"121.000"},{"date":"27","value":"131.000"},{"date":"28","value":"146.000"},{"date":"29","value":"156.000"},{"date":"30","value":"154.000"},{"date":"31","value":"156.000"}]

curl -d '{"year":"2021", "month":"10", "day":"10"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Electricity/readDailyLightConsumptionGraph
Ej: "values":[{"date":"00","value":"4.000"},{"date":"01","value":"4.000"},{"date":"02","value":"3.000"},{"date":"03","value":"4.000"},{"date":"04","value":"4.000"},{"date":"05","value":"4.000"},{"date":"06","value":"4.000"},{"date":"07","value":"4.000"},{"date":"08","value":"5.000"},{"date":"09","value":"0.000"},{"date":"10","value":"0.000"},{"date":"11","value":"0.000"},{"date":"12","value":"0.000"},{"date":"13","value":"0.000"},{"date":"14","value":"0.000"},{"date":"15","value":"0.000"},{"date":"16","value":"0.000"},{"date":"17","value":"0.000"},{"date":"18","value":"0.000"},{"date":"19","value":"0.000"},{"date":"20","value":"0.000"},{"date":"21","value":"0.000"},{"date":"22","value":"0.000"},{"date":"23","value":"0.000"}]









curl -d -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Electricity/readGeneralLightConsumptionPieChart
EJ: "values":[{"name":"Usos Varios ","value":-16919.989},{"name":"Clima ","value":11597.669},{"name":"Alumbrado Interior","value":"629.020"},{"name":"Riego","value":"0.000"},{"name":"Alumbrado Exterior","value":"298.200"},{"name":"Coche","value":"25.740"},{"name":"Cocina/Barbacoa","value":"328.480"},{"name":"Piscina","value":"1773.500"},{"name":"Servicio","value":"483.740"},{"name":"Cortacesped","value":"16.160"},{"name":"Fuente","value":"589.160"},{"name":"Acs","value":1178.32}]

curl -d '{"year":"2021"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Electricity/readAnnualLightConsumptionPieChart
Ej: "values":[{"name":"Usos Varios ","value":-16919.989},{"name":"Clima ","value":11597.669},{"name":"Alumbrado Interior","value":"629.020"},{"name":"Riego","value":"0.000"},{"name":"Alumbrado Exterior","value":"298.200"},{"name":"Coche","value":"25.740"},{"name":"Cocina/Barbacoa","value":"328.480"},{"name":"Piscina","value":"1773.500"},{"name":"Servicio","value":"483.740"},{"name":"Cortacesped","value":"16.160"},{"name":"Fuente","value":"589.160"},{"name":"Acs","value":1178.32}]

curl -d '{"year":"2021", "month":"10"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Electricity/readMonthlyLightConsumptionPieChart
Ej: "values":[{"name":"Usos Varios ","value":-7439.281000000001},{"name":"Clima ","value":4641.08},{"name":"Alumbrado Interior","value":"452.091"},{"name":"Riego","value":"0.000"},{"name":"Alumbrado Exterior","value":"130.590"},{"name":"Coche","value":"11.400"},{"name":"Cocina/Barbacoa","value":"173.670"},{"name":"Piscina","value":"884.080"},{"name":"Servicio","value":"235.270"},{"name":"Cortacesped","value":"8.820"},{"name":"Fuente","value":"300.760"},{"name":"Acs","value":601.52}]

curl -d '{"year":"2021", "month":"10", "day":"10"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Electricity/readDailyLightConsumptionPieChart
Ej: "values":[{"name":"Usos Varios ","value":-59.18000000000001},{"name":"Clima ","value":45.86},{"name":"Alumbrado Interior","value":"10.960"},{"name":"Riego","value":"0.000"},{"name":"Alumbrado Exterior","value":"0.740"},{"name":"Coche","value":"0.070"},{"name":"Cocina/Barbacoa","value":"1.190"},{"name":"Piscina","value":"0.070"},{"name":"Servicio","value":"0.170"},{"name":"Cortacesped","value":"0.030"},{"name":"Fuente","value":"0.030"},{"name":"Acs","value":0.06}]








curl -d -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Electricity/readGeneralLightConsumptionList
EJ: "values":{"list":[{"date":"29-09-2021","time":"12:38:03","value":"3.000"},{"date":"30-09-2021","time":"12:05:13","value":"143894.000"},{"date":"01-10-2021","time":"12:41:04","value":"3.000"},{"date":"04-10-2021","time":"10:00:00","value":"0.000"},{"date":"04-10-2021","time":"11:52:06","value":"426.000"},.....{"date":"09-12-2021","time":"12:00:01","value":"0.000"},{"date":"09-12-2021","time":"13:00:17","value":"0.000"},{"date":"09-12-2021","time":"14:00:08","value":"0.000"},{"date":"09-12-2021","time":"15:00:00","value":"0.000"},{"date":"09-12-2021","time":"16:00:04","value":"0.000"}],"measures":[{"minimum":"3.000","maximum":"143894.000","minimundate":"29-09-2021","maximundate":"30-09-2021","average":"2441.413"}]}

curl -d '{"year":"2021"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Electricity/readAnnualLightConsumptionList
Ej: "values":{"list":[{"date":"29-09-2021","time":"12:38:03","value":"3.000"},{"date":"30-09-2021","time":"12:05:13","value":"143894.000"},{"date":"01-10-2021","time":"12:41:04","value":"3.000"},{"date":"04-10-2021","time":"10:00:00","value":"0.000"},{"date":"04-10-2021","time":"11:52:06","value":"426.000"},...,{"date":"09-12-2021","time":"15:00:00","value":"0.000"},{"date":"09-12-2021","time":"16:00:04","value":"0.000"}],"measures":[{"minimum":"3.000","maximum":"143894.000","minimundate":"29-09-2021","maximundate":"30-09-2021","average":"2441.413"}]

curl -d '{"year":"2021", "month":"10"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Electricity/readMonthlyLightConsumptionList
Ej: "values":{"list":[{"date":"01-10-2021","time":"12:41:04","value":"3.000"},{"date":"04-10-2021","time":"10:00:00","value":"0.000"},{"date":"04-10-2021","time":"11:52:06","value":"426.000"},...,{"date":"31-10-2021","time":"22:53:11","value":"4.000"},{"date":"31-10-2021","time":"23:46:32","value":"4.000"}],"measures":[{"minimum":"3.000","maximum":"310.000","minimundate":"01-10-2021","maximundate":"11-10-2021","average":"137.069"}]}

curl -d '{"year":"2021", "month":"10", "day":"10"}' -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Consumption/Electricity/readDailyLightConsumptionList
Ej: "values":{"list":[{"date":"10-10-2021","time":"00:53:50","value":"4.000"},{"date":"10-10-2021","time":"01:53:13","value":"4.000"},{"date":"10-10-2021","time":"02:40:32","value":"3.000"},{"date":"10-10-2021","time":"03:45:58","value":"4.000"},{"date":"10-10-2021","time":"04:45:21","value":"4.000"},{"date":"10-10-2021","time":"05:48:46","value":"4.000"},{"date":"10-10-2021","time":"06:56:12","value":"4.000"},{"date":"10-10-2021","time":"07:59:37","value":"4.000"},{"date":"10-10-2021","time":"08:53:59","value":"5.000"},{"date":"10-10-2021","time":"09:00:00","value":"0.000"},{"date":"10-10-2021","time":"10:00:00","value":"0.000"},{"date":"10-10-2021","time":"11:00:00","value":"0.000"},{"date":"10-10-2021","time":"12:00:00","value":"0.000"},{"date":"10-10-2021","time":"13:00:00","value":"0.000"},{"date":"10-10-2021","time":"14:00:00","value":"0.000"},{"date":"10-10-2021","time":"15:00:00","value":"0.000"},{"date":"10-10-2021","time":"16:00:00","value":"0.000"},{"date":"10-10-2021","time":"17:00:00","value":"0.000"},{"date":"10-10-2021","time":"18:00:00","value":"0.000"},{"date":"10-10-2021","time":"19:00:00","value":"0.000"},{"date":"10-10-2021","time":"20:00:00","value":"0.000"},{"date":"10-10-2021","time":"21:00:00","value":"0.000"},{"date":"10-10-2021","time":"22:00:00","value":"0.000"},{"date":"10-10-2021","time":"23:00:00","value":"0.000"}],"measures":[{"minimum":"0.000","maximum":"5.000","minimundate":"09 h.","maximundate":"08 h.","average":"1.500"}]}
```





Maintenance

```bash
curl -d "nemo=modo1&color=#f66666&type=1&operations=[id=1&nemo=ope1&timer=10&status=1]" -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Maintenance/createMode

curl -d "nemo=sesion1&hour=12:00&status=1&mode=1&type=1&operations=[id=1&nemo=ope1&timer=10&status=1]&dates[2021-12-03 12:00]" -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Maintenance/createSession

curl -d "nemo=programa1&color=#f55555&type=1&sessions=[id=1&nemo=ope1&hour=12:20&status=1&mode=1&operations=[id=1&nemo=ope1&timer=10&status=1]]" -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Maintenance/createProgram

curl -d "id=1&dates[2021-12-03 12:00]&type=1" -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Maintenance/assignProgram

curl -d "id=1&id_zone=1&value=1" -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Maintenance/createProgramExcept

curl -d "id=1&id_zone=1&value=1" -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Maintenance/removeOtFromDay

curl -d "id=1&id_zone=1&value=1" -X POST http://localhost/pr-montecerrado.hometech.red/api/public/index.php/Maintenance/modifySession


```

