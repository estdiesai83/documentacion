## Alumbrado Exterior Automatico

#### SISTEMA

Crear un caso para el atardecer, otro para el amanecer y otro para el manual/automatico en la tabla "tarea" en la bd sistema_x. Ejemplo:

```mysql
+----+------+---------------------------+------+--------+------------+----------+---------+
| id | modo | scheduled                 | tipo | estado | codigodomo | tipodomo | submodo |
+----+------+---------------------------+------+--------+------------+----------+---------+
|  1 |    3 | 2021,08,21,20,14,0,0      |    0 |      1 |          1 |        3 |    NULL |
|  2 |    2 | 2021,08,21,07,59,0,0      |    0 |      1 |          1 |        3 |    NULL |
|  3 |    1 | 0 36 11 * * 0,1,2,3,4,5,6 |    0 |      1 |          1 |        3 |       1 |
+----+------+---------------------------+------+--------+------------+----------+---------+

```

* tipodomo = 1 si es luz, 3 si es grupoluces
* modo: 1 = manual/automatico; 2= amancer; 3 = atardecer
*  codigodomo: id tabla luces
* tipo: 0 = rpc

En tarea_rpc se tiene que crear un caso por cada salida que se tenga que realizar por luz o grupo de luces.

si es luz:  habra un caso para dicha luz

si es grupo luces: habra un caso por cada luz perteneciente a dicho grupo.

Ejemplo:

```
+------------------------------------------------------------------------------+----------+
| argumentos                                                                   | codtarea |
+------------------------------------------------------------------------------+----------+
| {"fk":"output_rpc","trb":"7","subtipo":"0","rb":"8","borna":"0","valor":"1"} |        1 |
| {"fk":"output_rpc","trb":"7","subtipo":"0","rb":"8","borna":"1","valor":"1"} |        1 |
| {"fk":"output_rpc","trb":"7","subtipo":"0","rb":"8","borna":"2","valor":"1"} |        1 |
| {"fk":"output_rpc","trb":"7","subtipo":"0","rb":"8","borna":"3","valor":"1"} |        1 |
| {"fk":"output_rpc","trb":"7","subtipo":"0","rb":"8","borna":"4","valor":"1"} |        1 |
| {"fk":"output_rpc","trb":"7","subtipo":"0","rb":"8","borna":"0","valor":"0"} |        2 |
| {"fk":"output_rpc","trb":"7","subtipo":"0","rb":"8","borna":"1","valor":"0"} |        2 |
| {"fk":"output_rpc","trb":"7","subtipo":"0","rb":"8","borna":"2","valor":"0"} |        2 |
| {"fk":"output_rpc","trb":"7","subtipo":"0","rb":"8","borna":"3","valor":"0"} |        2 |
| {"fk":"output_rpc","trb":"7","subtipo":"0","rb":"8","borna":"4","valor":"0"} |        2 |
| {"fk":"output_rpc","trb":"7","subtipo":"0","rb":"8","borna":"0","valor":"0"} |        3 |
| {"fk":"output_rpc","trb":"7","subtipo":"0","rb":"8","borna":"1","valor":"0"} |        3 |
| {"fk":"output_rpc","trb":"7","subtipo":"0","rb":"8","borna":"2","valor":"0"} |        3 |
| {"fk":"output_rpc","trb":"7","subtipo":"0","rb":"8","borna":"3","valor":"0"} |        3 |
| {"fk":"output_rpc","trb":"7","subtipo":"0","rb":"8","borna":"4","valor":"0"} |        3 |
+------------------------------------------------------------------------------+----------+

```



#### SOAJS

El soajs cada dia a las 3 de las mañana consulta una API y coge las horas de amanecer y atardecer y actualiza el tdato schedule de los casos de amanecer y atardecer con las horas que corresponda

Cuando se cumple la hora para una tarea, ejecuta las salidas que correponden a dicho codigotarea en la tabla tarea_rpc. 



DESDE LA APP: 

### lights/changePeriodicLightingMode ()

Cambia el modo del alumbrado de luces (en el amanecer nunca va a cambiar el estado)

###### Datos que recibe

```json

 {
     id: 1 // id luz
     status: 1
 }
```



### lights/changePeriodicLightingTime()

Cambia la hora del alumbrado

###### Datos que recibe

```json
{
    id: 1 // id luz
    hour: '12:00'
}
```

### lights/changePeriodicLightingGroupMode ()

Cambia el modo del alumbrado del grupo luces, (el amanecer nunca va a cambiar de estado)

###### Datos que recibe

```json
 {
     id: 1 // id del grupo
     status: 1
 }
```



### lights/changePeriodicLightingGroupTime()

Cambia la hora del alumbrado del grupo luces

###### Datos que recibe

```json
{
    id: 1 // id grupo
    hour: '12:00'
}
```

