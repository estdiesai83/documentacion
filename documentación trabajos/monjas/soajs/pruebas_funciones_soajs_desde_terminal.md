[TOC]

# PRUEBA SOAJS

## BLINDS:

##### Auto

```bash
curl -d id=1 -X POST http://localhost:1513/blind/readAuto

curl -d "id=1&level=52&hour="12:12"" -X POST http://localhost:1513/blind/createAuto
```

##### Despertador:

```bash
curl -d id=1 -X POST http://localhost:1513/blind/readAlarmClock

curl -d "id=1&status=1&level=89&hour="12:12"&day_week=[1,2,3,4,5,6,7]" -X POST http://localhost:1513/blind/createAlarmClock

curl -d "id=8&blind_id=1&status=1&lecel=89&hour="12:12"&day_week=[1,2,3,4,5,6,7]" -X POST http://localhost:1513/blind/modificarDespertador

curl -d "id=40&blind_id=1" -X POST http://localhost:1513/blind/desactivateAlarmClock

curl -d "id=40&blind_id=1" -X POST http://localhost:1513/blind/activateAlarmClock

curl -d "id=41&blind_id=1" -X POST http://localhost:1513/blind/deleteAlarmClock
```



## LIGHTS:

```bash
curl -d "id=2&hour="12:12"" -X POST http://localhost:1513/lights/changePeriodicLightingGroupTime

curl -d "id=2&status=0" -X POST http://localhost:1513/lights/changePeriodicLightingGroupMode
```



## DOMO

curl -d "dome_type=7&id=1&hour_init="12:12"&hour_end="13:12"" -X POST http://localhost:1513/domo/changePeriodicTime