Para añadir la funcionalidad de hora_inicio y/o hora_fin +/- x tiempo

En el soajs:

Añadir la funcionalidad de que le sume o le reste el tiempo que corresponda a la hora de amanecer y/o atardecer, en las funciones :

- upgradeSunrisePeriodic

- upgradeSunsetPeriodic

   

Los valores estan en la tabla de rutina en los tdatos hora_inicio y hora_fin , pero deberian de estar tambien en la tabla tarea, para que no sea algo especifico de la rutinas. Si es asi habría que modificar tambien las funciones de :

- upgradeSunrise
- upgradeSunset



Nota: las funciones estan en el servicio de schedule.js