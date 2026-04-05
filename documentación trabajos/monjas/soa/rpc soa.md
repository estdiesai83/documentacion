# RPC SISTEMA SOA



## output_rpc

Inicia una salida. Se llama por ejemplo cuando se cambia el estado, intensidad de una luz, estado clima,...

```
Argumentos a recibir:
0 - tipo trb: numero que indica el tipo de trb (Ej: 0 -> rasp sd)
1 - codigo_rb
2 - borna
3 - valor (excepto en salidas con cambio)
4 - valor2 (solo en las salidas limitadas)

```



## init_th_rpc

Ejecuta th de la consigna del clima. Se llama por ejemplo cuando se cambia la consigna desde la app

```
Argumentos:
1. codigo_consigna: id tabla variables para coger el valor de la consigna 
2. codigo_rango: id tabla variables para coger el valor del rango
3. trb_tpss: Ej: tpss valvula
4. rb_tpss
5. borna_tpss
6. trb_tpse. Ej: tpse estado de la valvula
7. rb_tpse
8. borna_tpse
9. id_climate: id tabla variables de la maquina del clima (por si hubiese varias maquinas)
10. valor: valor de la sonda temp
```



## init_external_th_rpc

Crea caso en tp yeEjecuta todos los th que corresponda

```
Argumentos: cadena json 
Ej: {"type_trb":"65","cod_rb":"156","terminal":"2","value":"255$33$2"}

```

