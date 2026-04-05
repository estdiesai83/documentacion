# Modificaciones en sistema_x

1. Creadas las tablas CONFIGURACIONES:

   ```
   configuraciones_bombas     
   configuraciones_clima  
   configuraciones_domo        
   configuraciones_estores            
   configuraciones_fancoil                     
   configuraciones_luces              
   configuraciones_persianas
   configuraciones_multimedia
   configuraciones_cortinas
   configuraciones_picina
   ```

   

2. Creadas las tablas PROGRAMA

   ```
   programa_domo
   relacion_programa_domo_estancia 
   ```

   

3. Creadas las tablas AT_HOME:

   ```
   at_home  
   at_home_ambiente  
   at_home_estado  
   relacion_at_home_ambiente_estancia_configuracion
   ```

   

4. Creadas las tablas TPCM

   ```
   relacion_tp_tpcm
   tpcm    
   ```

   

5. Creadas las tablas OPERACIONES:

   ```
   operacion_piscina
   ```

   

6. Modificadas las tablas estor, relacion_estor, configuraciones_estor, operacion_estores

7. Modificadas las tablas persianas, relacion_persianas, configuraciones_persianas, operacion_persianas 

8. Modificados los triggers de los trbs de entradas y salidas para las persianas y los estores.

   

9. Añadidos los tdatos 

   ```
   1. en tabla iniciarhilostrb:
   	`identificador` varchar(10),
       `monitor` int(11),
       
   2.en tabla automaticos:
   	`columna` int(11) DEFAULT NULL, (SI ESTA EN PRODUCCION)
   	`modelo` varchar(50) DEFAULT NULL, (NO ESTA EN PRODUCCION)
   
   3. en tabla escenas:
   	`pregrabado` int(11) DEFAULT 0,
   
   4. en tabla variables:
   	`codigo_tp` int(11) DEFAULT NULL,
   	
   5. en tabla relacion_consumos:
   	`tipo_tp` int(11) DEFAULT 0,
   ```



# Modificaciones en bd: sistema

1. Creada tabla nemo_tp
2. Creada tabla modelos_at_home



# PENDIENTE

En sistema_alejandro_somosaguas (produccion) faltaria:

 1. Cargar todas las tablas nuevas 

 2. Añadir los tdatos de los puntos 2, 3, 4, 5

    ```
    ALTER TABLE automaticos ADD COLUMN modelo varchar(50) DEFAULT NULL;
    ALTER TABLE escenas ADD COLUMN pregrabado int(11) DEFAULT 0;
    alter table variables add column codigo_tp int(11) DEFAULT NULL;
    ALTER TABLE relacion_consumos add column tipo_tp int(11) default 0 after codigo_tp_valor;
    ```

    

 3. Escribir en tabla automaticos los valores de la columna

    ```
    update sistema_alejandro_somosaguas.automaticos set columna=1 where id =1;
    update sistema_alejandro_somosaguas.automaticos set columna=5 where id =2;
    update sistema_alejandro_somosaguas.automaticos set columna=7 where id =3;
    update sistema_alejandro_somosaguas.automaticos set columna=9 where id =4;
    update sistema_alejandro_somosaguas.automaticos set columna=11 where id =5;
    ```

    

 4. Trigers para el somfy 

 5. Ejecutar script que escriba en las salidas limitadas para la multimedia, cortinas, cobertor (probar primero en desarrollo)

 6. Ejecutar script para los subtipos del dali, cuando son de color,...





14/06/2023

# Modificaciones en sistema_x

1. Modificadas las estructuras de estor, relacion_estor, configuraciones_estores y operacion_estores, para incorporar el trb de dooya

   ```
   alter table estor add column brillo int(11) DEFAULT NULL;
   
   alter table relacion_estor add column codigo_tp_s_brillo int(11) DEFAULT NULL;
   alter table relacion_estor add column codigo_tp_e_brillo int(11) DEFAULT NULL;
   
   alter table configuraciones_estores add column brillo int(11) DEFAULT NULL;
   alter table operacion_estores add column brillo int(11) DEFAULT NULL;
   ```

   

2. En penelope, modificar th socket cuadro

   ```
   
   ```

3. En alejandro, modificar th_socket cuadro

   ```
   
   ```

4. Añadir tablas calefaccion y refrigeracion

5. Añadir tablas condicion

6. Modificar tabla at_home_ambiente

   ```
   
   ```

   

7. 