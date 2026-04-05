![rutinas](/home/esther/git/soa/documentacion/bd/imagenes/rutinas.png)

**Cuando se crea una rutina:**

1. Se crea caso para rutina inicio (tipo_rutina=0)
2. Si tiene hora fin: crea caso rutina fin (tipo_rutina = 1) donde hora_inicio = hora_fin y pertenencia = id rutina inicio a la que corresponde.
3. Si tiene fecha_fin crea tarea de tipo bd: borrar tarea rutina (id_rutina), borrar rutina(id rutina).

**Cuando se ejecuta la rutina:**

1. Copia tablas originales en tablas previas_rutina.
2. Si tiene hora fin: crea las operaciones correspondientes con los valores que hay en luces, clima,…., para cargar el array del soajs para que cuando se tenga que ejecutar esta tarea, se ejecute de la misma manera que la de inicio sin cargar los datos de la tarea fin.