# blind (estores):

#### 1.readAuto 

Lee los datos si hay algun estor auto programado

```json
data: 
1. id (estor)

RESPUESTA
array de objetos: id, hour, level
```

#### 2. deleteAuto 

Borra la programacion del estor auto

```json
data: 
1. id 
```

#### 3. createAuto 

Crear la programacion del estor Auto

```json
data: 
1. id (estor)
2. hour: '12:00'
3. level: 50
```

#### 4. readAlarmClock 

Muestra un listado de despertadores programados

```json
data: 
1. id (estor)

RESPUESTA:
array de objetos:
id
hour: '12:00'
level: 50
status: 0-> apagado  1->encendido
day_week: [0,1,2,3] -> id de los days de la semana
```

#### 5. activateAlarmClock 

Activa el status del despertador

```json
data: 
1. id (tarea)
2. blind_id
```

#### 6. desactivateAlarmClock 

Desactiva el estado del despertador

```json
data: 
1. id (tarea)
2. blind_id 
```

#### 7. deleteAlarmClock 

 Borra el despertador

```json
data: 
1. id (tarea)
2. blind_id
```

#### 8. modifyAlarmClock 

Modifica la alarma del despertador

```json
data: 
1. id (tarea)
2. blind_id
2. hour
3. level
4. status
5. day_week: [0,1,2,3]
```

#### 9. createAlarmClock 

Crea una alarma para el despertador

```json
data: 
1. id (estor)
2. hour
3. level
4. status
5. day_week  [0,1,2,3] 
```



