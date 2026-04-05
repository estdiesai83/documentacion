# pumps (bombas):

#### 1.changePeriodicPumpsMode 

Cambiar el modo de la bomba

```json
data: 
1. id (zona) 
2. status
```

#### 2. changePeriodicPumpsTime 

Cambiar la hora de la bomba

```json
data: 
1. id (zona)
2. hour_init: '12:00'
3. hour_end: '22:00'
```

* Si solo tuviesemos una hora enviar dicha hora en hour_init y en hour_end enviar null



#### 3. changePeriodicPumpsGroupMode 

Cambiar el modo de un grupo de bombas

```json
data: 
1. id (grupo)
2. status
```

#### 4. changePeriodicPumpsGroupTime 

Cambiar la hora de un grupo de bombas

```json
data: 
1. id (grupo)
2. hour_init: '12:00'
3. hour_end: '22:00'
```

* Si solo tuviesemos una hora enviar dicha hora en hour_init y en hour_end enviar null

