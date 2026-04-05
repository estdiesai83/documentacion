# Mecanismo Lectura Datos

### Leer datos (Hazard)

1. Inicio la App (leerEstancias)
2. SOA detecta cambio y lanza socket (enviando valor del tipo de cambio)
   1. luz -> leerEstancias
   2. clima -> leerEstancias
   3. sonda -> leerEstancias
   4. bomba -> leer Agua
3. Cliente hace cambio consigna -> API llama al Socket
   1. clima -> leerEstancia
4. Cliente hace salida -> Espera 3 segundos (por si hay error en la salida)
   1. luz -> leerEstancias
   2. clima -> leerEstancias
   3. sonda -> leerEstancias
   4. bomba -> leer Agua