## Secure:

Tipos de Camaras:

1. Camara IP conv con rasp
2. IP (prot RTSP) (no ionic)
3. Web RTC (Rasp webcam)







### Secure/getSecure(): 

Se la llama internamente desde getConfig

```php
argumentos: 
1. id: id ubicacion

Respuesta: 
object(code, data [{}]
       
data: array de objetos
"secure" : {
        "camara": [{
              "nemo": "Camara Interior 1",
              "tipo": 3,
              "user": "user_robert",
              "pass": "room_robert"
            }],
        "intercomp": [{
          "nemo": "Puerta",
          "id": 3
        }]
    },
```



