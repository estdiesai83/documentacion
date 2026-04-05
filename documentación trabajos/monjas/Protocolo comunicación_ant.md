# Protocolo comunicación

[TOC]

## 1. Arduino

### 1.1 Tramas tamaño fijo



#### 1.1.1 Entradas digitales (ED)

---

##### IDA

10 bytes

| control | nº bornas |  b1  |  b2  |  b3  |  b4  |  b5  |  b6  |  b7  |  b8  |
| :-----: | :-------: | :--: | :--: | :--: | :--: | :--: | :--: | :--: | :--: |
|    1    |     1     |  1   |  1   |  1   |  1   |  1   |  1   |  1   |  1   |

##### VUELTA

9 bytes

| control |  v1  |  v2  |  v3  |  v4  |  v5  |  v6  |  v7  |  v8  |
| :-----: | :--: | :--: | :--: | :--: | :--: | :--: | :--: | :--: |
|    1    |  1   |  1   |  1   |  1   |  1   |  1   |  1   |  1   |



#### 1.1.2 Salidas digitales (SD)

---

##### IDA

18 bytes

| control | nº bornas |  b1  |  b2  |  b3  |  b4  |  b5  |  b6  |  b7  |  b8  |  v1  |  v2  |  v3  |  v4  |  v5  |  v6  |  v7  |  v8  |
| :-----: | :-------: | :--: | :--: | :--: | :--: | :--: | :--: | :--: | :--: | :--: | :--: | :--: | :--: | :--: | :--: | :--: | :--: |
|    1    |     1     |  1   |  1   |  1   |  1   |  1   |  1   |  1   |  1   |  1   |  1   |  1   |  1   |  1   |  1   |  1   |  1   |

##### VUELTA

1 byte

| control |
| :-----: |
|    1    |



#### 1.1.3 Entradas analógicas (EA)

---

##### IDA

2 bytes

| control | borna |
| :-----: | :---: |
|    1    |   1   |

##### VUELTA

9 bytes

| control | valor |
| :-----: | :---: |
|    1    |   8   |



#### 1.1.4 Salidas analógicas (SA)

---

##### IDA

10 bytes

| control | nº borna | valor |
| :-----: | :------: | :---: |
|    1    |    1     |   8   |

##### VUELTA

1 byte

| control |
| :-----: |
|    1    |



### 1.2 Tramas tamaño dinámico



#### 1.2.1 Entradas digitales (ED)

---

##### IDA

(2 + n) bytes

| control | nº bornas | borna |
| :-----: | :-------: | :---: |
|    1    |     1     |   n   |

> La trama esta compuesta siempre por 1 byte de control, 1 byte que indica el número de bornas que estamos solicitando, y a continuación, tantos bytes como bornas queramos. Por ejemplo si queremos solicitar 5 bornas, tenemos que indicar en el campo de número de bornas el numero 5 y añadir a continuación 5 bytes, en cada byte tenemos que indicar el número de borna que queremos.

##### VUELTA

(1 + n) bytes

| control | valor |
| :-----: | :---: |
|    1    |   n   |

> La trama esta compuesta siempre por 1 byte de control, seguido de tantos bytes como número de bornas hemos solicitado. Por ejemplo, si hemos solicitado 5 bornas, la trama de vuelta tendrá una longitud de 6 bytes (1 byte de control, 5 bytes de datos), en los bytes de datos se encuentra el valor de cada borna en el mismo orden que se han solicitado.



#### 1.2.2 Salidas digitales (SD)

---

##### IDA

(2 + (2 * n)) bytes

| control | nº bornas | borna | valor |
| :-----: | :-------: | :---: | :---: |
|    1    |     1     |   n   |   n   |

##### VUELTA

1 byte

| control |
| :-----: |
|    1    |



#### 1.2.3 Entradas analógicas (EA)

---

##### IDA

(2 + n) bytes

| control | nº bornas | borna |
| :-----: | :-------: | :---: |
|    1    |     1     |   n   |

##### VUELTA

(1 + (n * 8)) bytes

> Cada valor ocupa 8 bytes

| control | valor |
| :-----: | :---: |
|    1    | n * 8 |



#### 1.2.4 Salidas analógicas (SA)

---

##### IDA

(2 + n + (n * 8)) bytes

| control | nº bornas | borna | valor |
| :-----: | :-------: | :---: | :---: |
|    1    |     1     |   n   | n * 8 |

##### VUELTA

1 byte

| control |
| :-----: |
|    1    |



### 1.3 *Byte de control*

1 byte

Todas las tramas incluyen un byte de control que definen el tipo de trama que sigue.

| sin definir | tamaño | estado | tipo |
| :---------: | :----: | :----: | :--: |
|      3      |   1    |   2    |  2   |

###### tamaño

|   0   |   trama estática   |
| :---: | :----------------: |
| **1** | **trama dinámica** |

###### estado

|   00   |       OK        |
| :----: | :-------------: |
| **01** |    **ERROR**    |
| **10** | **sin definir** |
| **11** | **sin definir** |

###### tipo

|   00   |   ED   |
| :----: | :----: |
| **01** | **EA** |
| **10** | **SD** |
| **11** | **SA** |



## 2. Raspberry Pi (soaraspberry)

Toda comunicación con Raspberry PI, se realiza mediante tramas de tamaño dinámico.



#### 2.1.1 Entradas digitales (ED)

---

##### IDA

(2 + n) bytes

| control | nº bornas | borna |
| :-----: | :-------: | :---: |
|    1    |     1     |   n   |

##### VUELTA

(1 + n) bytes

| control | valor |
| :-----: | :---: |
|    1    |   n   |



#### 2.1.2 Salidas digitales (SD)

---

##### IDA

(2 + (2 * n)) bytes

| control | nº bornas | borna | valor |
| :-----: | :-------: | :---: | :---: |
|    1    |     1     |   n   |   n   |

##### VUELTA

1 byte

| control |
| :-----: |
|    1    |



#### 2.1.3 Entradas analógicas (EA)

---

##### IDA

(2 + n) bytes

| control | nº bornas | borna |
| :-----: | :-------: | :---: |
|    1    |     1     |   n   |

##### VUELTA

(1 + (n * 8)) bytes

> Cada valor ocupa 8 bytes

| control | valor |
| :-----: | :---: |
|    1    | n * 8 |



#### 2.1.4 Salidas analógicas (SA)

---

##### IDA

(2 + n + (n * 8)) bytes

> Cada valor ocupa 8 bytes

| control | nº bornas | borna | valor |
| :-----: | :-------: | :---: | :---: |
|    1    |     1     |   n   | n * 8 |

##### VUELTA

1 byte

| control |
| :-----: |
|    1    |



#### 2.1.5 Dali

---

##### IDA

(2 + n) bytes

| control | nº bytes | trama |
| :-----: | :------: | :---: |
|    1    |    1     |   n   |

> En este caso, en la sección de `trama`, insertamos una trama Dali, esta trama será mandada por el bus.

##### VUELTA

n bytes

| respuesta dali |
| :------------: |
|       n        |

> Lo que recibimos por respuesta es direcramente la trama con la que responde el bus Dali.



#### 2.1.6 Sondas SHT31

---

##### IDA

(2 + n) bytes

| control | nº bornas | borna |
| :-----: | :-------: | :---: |
|    1    |     1     |   n   |

##### VUELTA

(1 + (n * 8)) bytes   (Es por 8 , por que es 4 bytes * 2 (temp, humedad))

| control | valor |
| :-----: | :---: |
|    1    | n * 8 |

> El valor de la sonda se codifica en un float de 4 bytes mediante una estructura UNION.



#### 2.1.7 Sondas DS18B20

---

##### IDA

(2 + (n * 8)) bytes

> Las sondas DS18B20 tienen un identificador único de 8 bytes, este identificador es necesario para leer la sonda adecuada, y lo tenemos que mandar en la trama.

| control | nº bytes | datos |
| :-----: | :------: | :---: |
|    1    |    1     | n * 8 |

##### VUELTA

(1 + (n * 4)) bytes

| control | valor |
| :-----: | :---: |
|    1    | n * 4 |

> El valor de la sonda se codifica en un float de 4 bytes mediante una estructura UNION.



#### 2.1.8 Pulsos

---

##### IDA

(2 + n) bytes

| control | nº bornas | borna |
| :-----: | :-------: | :---: |
|    1    |     1     |   n   |

##### VUELTA

(1 + n) bytes

| control | valor |
| :-----: | :---: |
|    1    |   n   |



#### 2.1.9 Velocidad del viento

---

##### IDA

(2 + n) bytes

| control | nº bornas | Borna |
| :-----: | :-------: | :---: |
|    1    |     1     |   n   |

##### VUELTA

(1 + (n * 4)) bytes

| control | Valor |
| :-----: | :---: |
|    1    | n * 4 |

> El valor de la velocidad se codifica en un float de 4 bytes mediante una estructura UNION.



#### 2.1.10 Sondas SCD30 (CO2)

------

##### IDA

(2 + n) bytes

| control | nº sondas |  id  |
| :-----: | :-------: | :--: |
|    1    |     1     |  n   |

Ej: valor de n = 30, 31 o 32

##### VUELTA

(1 + (n * 12)) bytes   (Es por 12 , por que es 4 bytes * 3 (temp, humedad , co2))

| control | valor  |
| :-----: | :----: |
|    1    | n * 12 |

> El valor de la sonda se codifica en un float de 4 bytes mediante una estructura UNION.



### 2.2 *Byte de control*

1 byte

Todas las tramas incluyen un byte de control que definen el tipo de trama que sigue.

| sin definir | estado | tipo |
| :---------: | :----: | :--: |
|      2      |   2    |  4   |

###### estado

|   00   |       OK        |
| :----: | :-------------: |
| **01** |    **ERROR**    |
| **10** | **sin definir** |
| **11** | **sin definir** |

###### tipo

|   0000   |            ED            |
| :------: | :----------------------: |
| **0001** |          **EA**          |
| **0010** |          **SD**          |
| **0011** |          **SA**          |
| **0100** |         **Dali**         |
| **0101** |     **Sonda SHT31**      |
| **0110** |    **Sonda DS18B20**     |
| **0111** |        **Pulsos**        |
| **1000** | **Velocidad del viento** |
| **1001** |  **Sonda SCD30 (CO2)**   |
| **1010** |     **sin definir**      |
| **1011** |     **sin definir**      |
| **1100** |     **sin definir**      |
| **1101** |     **sin definir**      |
| **1110** |     **sin definir**      |
| **1111** |      **Respuesta**       |