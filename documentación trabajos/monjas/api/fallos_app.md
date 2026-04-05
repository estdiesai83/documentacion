## APP

1. En crear ambiente por estancia:
   1. por ejemplo (planta primera , hab alexander):
      1. si pulso que todos los estores tengan nivel 'x' en el objeto muestra NANA.
      2. si pulso que todos los estores tengan nivel 'x'  cuando se pulsa atras se muestra el valore del primer click, si se pulsa mas veces no lo muestra.
      3. Tanto si pulso en que todos tengan nivel 'x' como que tienen todos nivel 100, llega en la cesta level 0
   2. por ejemplo (planta principal, habitacion alejandro), en las persianas, cuando pulso en la ruleta del centro, y pulso en mas o menos de la posicion o en el mas o menos de la oscuridad me aparece la hora actual.
2. En crear ambiente por planta, grupo y subgrupo:
   1.  cuando se pulsa en las rallitas para añadir o quitar alguna depencia siempre sale al principio dependencias seleccionadas = 0, cuando por defecto aparecen todas marcadas (si se pulsa o se despulsa si funciona)
   2. Cuando se llama a la cesta en lights no deberia de enviar color y temperature tambien??
   3.  Cuando pulso en los estores, no puedo poner un nivel deiferente a 100% o 0%.
3. En modificar ambiente, si una luz que esta encendido con intensidad x y la modifico a apagado, si quiero volver a modificarle la intensidad no puedo, me pone encendido o apagado y no me sale la intensidad para poderla cambiar
4. En modificar rutina, no se setean bien los datos, cuando se ha seleccionado una rutina, y al pulsar en guardar me dice que no estan todos los datos rellenos



## API

1. En el getConfig en las estancias que pertenencen a un grupo y subgrupo muestra valores en distributionPanel cuando no es cierto. Ahora solo tenemos un cuadro en planta sotano (3) habitacion invitados (45)

2. En el getConfig en las escenas de los estores, el array de dentro de blinds, aparece vacio. Ejemplo:

   ```
   [
     {
       "id": 175,
       "nemo": "Bajar Todo",
       "status": 1,
       "type": 0,
       "blinds": []
     },
     {
       "id": 176,
       "nemo": "Subir Todo",
       "status": 0,
       "type": 1,
       "blinds": []
     }
   ]
   ```

   

3. 