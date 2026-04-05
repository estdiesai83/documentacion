# soajs lights:

#### 1.changePeriodicLightingMode 

Cambiar el modo del alumbrado de una luz

```json
data: 
1. id (zona) 
2. status
```

#### 2. changePeriodicLightingTime 

Cambiar la hora del alumbrado de una luz

```json
data: 
1. id (zona)
2. hour: '12:00'
3. hour_end: '12:00'
```

* Si solo tuviesemos una hora enviar dicha hora en hour y en hour_end enviar null

  

#### 3. changePeriodicLightingGroupMode 

Cambiar el modo  del alumbrado de un grupo de luces

```json
data: 
1. id (grupo)
2. status
```

#### 4. changePeriodicLightingGroupTime 

Cambiar la hora del alumbrado de una luz

```json
data: 
1. id (grupo)
2. hour: '12:00'
3. hour_end: '12:00'
```

* Si solo tuviesemos una hora enviar dicha hora en hour y en hour_end enviar null