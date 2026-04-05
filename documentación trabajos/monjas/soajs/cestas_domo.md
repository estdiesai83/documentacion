# soajs (domo):

#### 1.changePeriodicMode 

Cambiar el modo la tarea correspondiente segun tipo domo

```json
data: 
1. dome_type (0-> luces, 3-> grupo_luces fuentes, 6-> bombas, 7-> grupo_bombas, 9 -> grupo_luces alumb exterior ) 
3. id (zona) 
4. status
```

#### 2. changePeriodicTime 

Cambiar la hora de la tarea correspondiente segun tipo domo

```json
data: 
1. dome_type (0-> luces, 3-> grupo_luces fuentes, 6-> bombas, 7-> grupo_bombas, 9 -> grupo_luces alumb exterior ) 
2. id (zona)
3. hour_init: '12:00'
4. hour_end: '22:00'
```

* Si solo tuviesemos una hora enviar dicha hora en hour_init y en hour_end enviar null

#### 3.changePeriodicAllMode 

Cambiar todos los modos de las tareas contenidas en el array. Si status es 0  y el tipo es grupoluces coge la configuracion anterior de la tabla modo_grupo_luces y la pone como estaba antes de poner en automatico todos los grupos

```json
data: 
1. dome_type (0-> luces, 3-> grupo_luces fuentes, 6-> bombas, 7-> grupo_bombas, 9 -> grupo_luces alumb exterior ) 
3. id (zona): array
4. status
```

#### 