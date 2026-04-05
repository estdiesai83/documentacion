> Toda comunicación se realiza mediante tramas de tamaño dinámico.

# 1 *TRBs*

## 1.1 Entradas digitales (ED)

- *PETICIÓN*
- *INFORMACIÓN*

##### TRAMA IDA

```
(2 + n) bytes
```

| control | nº bytes | borna |
| :-----: | :------: | :---: |
|   1 B   |   1 B    |  n B  |

##### TRAMA VUELTA

```
(1 + n) bytes
```

| control | valor |
| :-----: | :---: |
|   1 B   |  n B  |

## 1.2 Salidas digitales (SD)

- *PETICIÓN*

##### TRAMA IDA

```
(2 + (2 * n)) bytes
```

| control | nº bytes | borna | valor |
| :-----: | :------: | :---: | :---: |
|   1 B   |   1 B    |  n B  |  n B  |

##### TRAMA VUELTA

```
1 byte
```

| control |
| :-----: |
|   1 B   |

## 1.3 Entradas analógicas (EA)

- *PETICIÓN*
- *INFORMACIÓN*

##### TRAMA IDA

```
(2 + n) bytes
```

| control | nº bytes | borna |
| :-----: | :------: | :---: |
|   1 B   |   1 B    |  n B  |

##### TRAMA VUELTA

```
(1 + (n * 8)) bytes
```

| control |  valor  |
| :-----: | :-----: |
|   1 B   | n * 8 B |

> Cada valor ocupa 8 bytes (double)

## 1.4 Salidas analógicas (SA)

- *PETICIÓN*

##### TRAMA IDA

```
(2 + n + (n * 8)) bytes
```

| control | nº bytes | borna |  valor  |
| :-----: | :------: | :---: | :-----: |
|   1 B   |   1 B    |  n B  | n * 8 B |

> Cada valor ocupa 8 bytes

##### TRAMA VUELTA

```
1 byte
```

| control |
| :-----: |
|   1 B   |

## 1.5 Dali

- *PETICIÓN*

##### TRAMA IDA

```
(2 + dali) bytes
```

| control | nº bytes | trama  |
| :-----: | :------: | :----: |
|   1 B   |   1 B    | dali B |

> En este caso, en la sección de `trama`, insertamos una trama Dali, esta trama será mandada por el bus.

##### TRAMA VUELTA

```
(1 + dali) bytes
```

| control | respuesta dali |
| :-----: | :------------: |
|   1 B   |     dali B     |

> Lo que recibimos por respuesta es direcramente la trama con la que responde el bus Dali.

## 1.6 Sondas SHT31

- *PETICIÓN*
- *INFORMACIÓN*

##### TRAMA IDA

```
(2 + n) bytes
```

| control | nº bytes | borna |
| :-----: | :------: | :---: |
|   1 B   |   1 B    |  n B  |

##### TRAMA VUELTA

```
(1 + (n * 8)) bytes
```

| control |  valor  |
| :-----: | :-----: |
|   1 B   | n * 8 B |

> El valor de la sonda se codifica en 8 bytes de los cuales los bytes [0-3] son temperatura y los bytes [4-7] son humedad

## 1.7 Sondas DS18B20

- *PETICIÓN*
- *INFORMACIÓN*

##### TRAMA IDA

```
(2 + (n * 8)) bytes
```

| control | nº bytes |  datos  |
| :-----: | :------: | :-----: |
|   1 B   |   1 B    | n * 8 B |

> Las sondas DS18B20 tienen un identificador único de 8 bytes, este identificador es necesario para leer la sonda adecuada, y lo tenemos que mandar en la trama.

##### TRAMA VUELTA

```
(1 + (n * 4)) bytes
```

| control |  valor  |
| :-----: | :-----: |
|   1 B   | n * 4 B |

> El valor de la sonda se codifica en un float de 4 bytes mediante una estructura `UNION`.

## 1.8 Pulsos

- *PETICIÓN*
- *INFORMACIÓN*

##### TRAMA IDA

```
(2 + n) bytes
```

| control | nº bytes | borna |
| :-----: | :------: | :---: |
|   1 B   |   1 B    |  n B  |

##### TRAMA VUELTA

```
(1 + n) bytes
```

| control | valor |
| :-----: | :---: |
|   1 B   |  n B  |

## 1.9 Velocidad del viento

- *PETICIÓN*
- *INFORMACIÓN*

##### TRAMA IDA

```
(2 + n) bytes
```

| control | nº bytes | borna |
| :-----: | :------: | :---: |
|   1 B   |   1 B    |  n B  |

##### TRAMA VUELTA

```
(1 + (n * 4)) bytes
```

| control |  valor  |
| :-----: | :-----: |
|   1 B   | n * 4 B |

> El valor de la velocidad se codifica en un float de 4 bytes mediante una estructura `UNION`.

## 1.10 Sondas SCD30 (CO2)

- *PETICIÓN*
- *INFORMACIÓN*

##### TRAMA IDA

```
(2 + n) bytes
```

| control | nº bornas | borna |
| :-----: | :-------: | :---: |
|   1 B   |    1 B    |  n B  |

##### TRAMA VUELTA

```
(1 + (n * 12)) bytes
```

| control |  valor   |
| :-----: | :------: |
|   1 B   | n * 12 B |

> El valor de la sonda se codifica en 12 bytes de los cuales los bytes [0-3] son CO2, los bytes [4-7] son temperatura y los bytes [8-11] son humedad

## 1.11 Pulsos autoincrementado

- *PETICIÓN*
- *INFORMACIÓN*

##### TRAMA IDA

```
(2 + n) bytes
```

| control | nº bytes | borna |
| :-----: | :------: | :---: |
|   1 B   |   1 B    |  n B  |

##### TRAMA VUELTA

```
(1 + (n * 8)) bytes
```

| control |  valor  |
| :-----: | :-----: |
|   1 B   | n * 8 B |

> El valor de la velocidad se codifica en un `unsigned long long int` de 8 bytes mediante una estructura `UNION`.

## 1.12 Dirección del viento

- *PETICIÓN*
- *INFORMACIÓN*

##### TRAMA IDA

```
(2 + n) bytes
```

| control | nº bytes | borna |
| :-----: | :------: | :---: |
|   1 B   |   1 B    |  n B  |

##### TRAMA VUELTA

```
(1 + (n * 8)) bytes
```

| control |  valor  |
| :-----: | :-----: |
|   1 B   | n * 8 B |

> Cada valor ocupa 8 bytes (double)

## 1.13 Pulsador

- *PETICIÓN*
- *INFORMACIÓN*

##### TRAMA IDA

```
(2 + n) bytes
```

| control | nº bytes | borna |
| :-----: | :------: | :---: |
|   1 B   |   1 B    |  n B  |

##### TRAMA VUELTA

```
(1 + n) bytes
```

| control | valor |
| :-----: | :---: |
|   1 B   |  n B  |

## 1.14 RS485

##### TRAMA IDA

```
(2 + n) bytes
```

| control | nº bytes | configuración bus | nº bytes respuesta esperada | trama RS485 |
| :-----: | :------: | :---------------: | :-------------------------: | :---------: |
|   1 B   |   1 B    |        4 B        |             1 B             |     n B     |

###### Configuración bus

```
4 bytes
```

| byte | descripción |
| :--: | :---------: |
|  0   |  Velocidad  |
|  1   |   Paridad   |
|  2   | Bits datos  |
|  3   |  Bits stop  |

**Velocidad**

|      | valor  |
| :--: | :----: |
|  0   |  110   |
|  1   |  300   |
|  2   |  600   |
|  3   |  1200  |
|  4   |  2400  |
|  5   |  4800  |
|  6   |  9600  |
|  7   | 14400  |
|  8   | 19200  |
|  9   | 38400  |
|  10  | 57600  |
|  11  | 115200 |
|  12  | 128000 |
|  13  | 256000 |

**Paridad**

|      |    valor    |
| :--: | :---------: |
|  0   | Sin paridad |
|  1   |     Odd     |
|  2   |    Even     |
|  3   |    Mark     |
|  4   |    Space    |

# 2 *Byte de control*

```
1 byte
```

Todas las tramas incluyen un byte de control que definen el tipo de trama que sigue.

| tipo | estado | trb  |
| :--: | :----: | :--: |
| 2 b  |  2 b   | 4 b  |

## tipo

|        |                   |
| :----: | :---------------: |
| **00** |   **Petición**    |
| **01** | **Configuración** |
| **10** |  **Información**  |
| **11** |   **Respuesta**   |

## estado

|        |                 |
| :----: | :-------------: |
| **00** |     **OK**      |
| **01** |    **ERROR**    |
| **10** |  **Especial**   |
| **11** | **sin definir** |

> El estado **especial** solo tiene sentido en ciertos TRBs. Actualmente está disponible para salidas digitales *`SD`* y salidas analógicas *`SA`* donde en vez de solicitar un cambio en la salida, lo que se solicita es el estado de la salida, y en sondas *`DS18B20`* donde se solicita el id de todas las sondas conectadas. Además se utiliza para utilizar la placa como conversor *`RS485`*.

## trb

|          |                             |
| :------: | :-------------------------: |
| **0000** |        **ED/RS4851**        |
| **0001** |           **EA**            |
| **0010** |           **SD2**           |
| **0011** |           **SA3**           |
| **0100** |          **Dali**           |
| **0101** |       **Sonda SHT31**       |
| **0110** |     **Sonda DS18B204**      |
| **0111** |         **Pulsos**          |
| **1000** |  **Velocidad del viento**   |
| **1001** |    **Sonda SCD30 (CO2)**    |
| **1010** | **Pulsos autoincrementado** |
| **1011** |  **Direccion del viento**   |
| **1100** |        **Pulsador**         |
| **1101** |       **sin definir**       |
| **1110** |       **sin definir**       |
| **1111** |       **sin definir**       |

> 1 Las placas se pueden comportar como conversores de `ethernet` a `RS485`. Para ello la trama debe tener estado especial y codigo trb `0000`.

> 2 Cuando la petición es con estado especial, el comportamiento es como un `ED` y se botiene el estado de las salidas digitales.

> 3 Cuando la petición es con estado especial, el comportamiento es como un `EA` y se botiene el estado de las salidas analógicas.

> 4 Cuando la petición es con estado especial, se obtienen los identificadores de las sondas conectadas.



https://www.scadacore.com/tools/programming-calculators/online-checksum-calculator/

https://www.scadacore.com/tools/programming-calculators/online-hex-converter/