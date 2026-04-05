## Alumbrado Exterior Automatico

#### SISTEMA

Crear un caso para el atardecer, otro para el amanecer y otro para el manual/automatico en la tabla "tarea" en la bd sistema_x. Ejemplo:

```mysql
+----+------+---------------------------+------+--------+------------+----------+---------+
| id | modo | scheduled                 | tipo | estado | codigodomo | tipotarea | submodo |
+----+------+---------------------------+------+--------+------------+----------+---------+
|  1 |    3 | 2021,08,21,20,14,0,0      |    0 |      1 |          1 |        3 |    NULL |
|  2 |    2 | 2021,08,21,07,59,0,0      |    0 |      1 |          1 |        3 |    NULL |
|  3 |    1 | 0 36 11 * * 0,1,2,3,4,5,6 |    0 |      1 |          1 |        3 |       1 |
+----+------+---------------------------+------+--------+------------+----------+---------+
```

* tipotarea: 
  * 1 = si es luz
  *  3 = si es grupo_luces
* modo: 
  * 2 = amanecer 
  * 3 = atardecer
  * 1 = manual/automatico (esta funcionalidad es opcional)
*  codigodomo: id tabla luces o  grupo_luces
* tipo: 0 = rpc



En tarea_rpc se tiene que crear un caso por cada salida que se tenga que realizar por luz o grupo de luces.

- si es luz:  habra un caso para dicha luz

- si es grupo luces: habra un caso por cada luz perteneciente a dicho grupo.

Ejemplo:

```mysql
+----------------------------------------------------------------------------------+-------------+
| argumentos                                                                       | codigo_tarea |
+----------------------------------------------------------------------------------+-------------+
| {"fk":"output_rpc","trb":"7","subtype":"0","rb":"8","terminal":"0","value":"1"}  |           1 |
| {"fk":"output_rpc","trb":"7","subtype":"0","rb":"8","terminal":"1","value":"1"}  |           1 |
| {"fk":"output_rpc","trb":"7","subtype":"0","rb":"8","terminal":"2","value":"1"}  |           1 |
| {"fk":"output_rpc","trb":"7","subtype":"0","rb":"8","terminal":"3","value":"1"}  |           1 |
| {"fk":"output_rpc","trb":"7","subtype":"0","rb":"8","terminal":"4","value":"1"}  |           1 |

| {"fk":"output_rpc","trb":"7","subtype":"0","rb":"8","terminal":"0","value":"0"}  |           2 |
| {"fk":"output_rpc","trb":"7","subtype":"0","rb":"8","terminal":"1","value":"0"}  |           2 |
| {"fk":"output_rpc","trb":"7","subtype":"0","rb":"8","terminal":"2","value":"0"}  |           2 |
| {"fk":"output_rpc","trb":"7","subtype":"0","rb":"8","terminal":"3","value":"0"}  |           2 |
| {"fk":"output_rpc","trb":"7","subtype":"0","rb":"8","terminal":"4","value":"0"}  |           2 |

| {"fk":"output_rpc","trb":"7","subtype":"0","rb":"8","terminal":"0","value":"0"}  |           3 |
| {"fk":"output_rpc","trb":"7","subtype":"0","rb":"8","terminal":"1","value":"0"}  |           3 |
| {"fk":"output_rpc","trb":"7","subtype":"0","rb":"8","terminal":"2","value":"0"}  |           3 |
| {"fk":"output_rpc","trb":"7","subtype":"0","rb":"8","terminal":"3","value":"0"}  |           3 |
| {"fk":"output_rpc","trb":"7","subtype":"0","rb":"8","terminal":"4","value":"0"}  |           3 |
+----------------------------------------------------------------------------------+-------------+
```



#### SOAJS

El soajs cada dia a las 3 de las mañana consulta una API y coge las horas de amanecer y atardecer y actualiza el tdato schedule de los casos de amanecer y atardecer con las horas que corresponda

Cuando se cumple la hora para una tarea, ejecuta las salidas que correponden a dicho codigotarea en la tabla tarea_rpc. 



**DESDE LA APP:** 

### lights/changePeriodicLightingMode ()

Cambia el modo del alumbrado de luces

#### 1.lights/changePeriodicLightingMode 

Cambiar el modo del alumbrado de una luz (en el amanecer nunca va a cambiar el estado)

```json
data: 
1. id (zona) 
2. status
```

#### 2. lights/changePeriodicLightingTime 

Cambiar la hora del alumbrado de una luz

```json
data: 
1. id (zona)
2. hour: '12:00'
3. hour_end: '12:00'
```

* Si solo tuviesemos una hora enviar dicha hora en hour y en hour_end enviar null

  

#### 3. lights/changePeriodicLightingGroupMode 

Cambiar el modo  del alumbrado de un grupo de luces  (en el amanecer nunca va a cambiar el estado)

```json
data: 
1. id (grupo)
2. status
```

#### 4. lights/changePeriodicLightingGroupTime 

Cambiar la hora del alumbrado de una luz

```json
data: 
1. id (grupo)
2. hour: '12:00'
3. hour_end: '12:00'
```

* Si solo tuviesemos una hora enviar dicha hora en hour y en hour_end enviar null