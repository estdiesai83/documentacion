# PERMISOS



| **Pos** | **Tipo permiso**                      | **Valor Hex** | **Usu_1** | **Usu_2** | **Usu_3** |      |
| ------- | ------------------------------------- | ------------- | --------- | --------- | --------- | ---- |
| 0       | Ver programación riego                | 0x00          | 1         | 1         | 0         |      |
| 1       | Ver programación riego histórico      | 0x01          | 1         | 1         | 0         |      |
| 2       | Programar riego añadir                | 0x02          | 1         | 0         | 0         |      |
| 3       | Programar riego anular                | 0x03          | 1         | 0         | 0         |      |
| 4       | Programar riego modificar             | 0x04          | 1         | 0         | 0         |      |
|         |                                       |               |           |           |           |      |
| 5       | Ver programación depuración           | 0x05          | 1         | 1         | 0         |      |
| 6       | Ver programación depuración histórico | 0x06          | 1         | 1         | 0         |      |
| 7       | Programar depuración añadir           | 0x07          | 1         | 0         | 0         |      |
| 8       | Programar depuración anular           | 0x08          | 1         | 0         | 0         |      |
| 9       | Programar depuración modificar        | 0x09          | 1         | 0         | 0         |      |
|         |                                       |               |           |           |           |      |
| 10      | Hoy añadir sesiones                   | 0x0A          | 1         | 0         | 0         |      |
| 11      | Hoy  activación manual                | 0x0B          | 1         | 1         | 1         |      |
|         |                                       |               |           |           |           |      |
| 12      | Ambiente ver                          | 0x0C          | 1         | 1         | 0         |      |
| 13      | Ambiente modificar                    | 0x0D          | 1         | 1         | 0         |      |
| 14      | Rutina ver                            | 0x0E          | 1         | 1         | 0         |      |
| 15      | Rutina modificar                      | 0x0F          | 1         | 1         | 0         |      |
| 16      | Escena ver                            | 0x10          | 1         | 1         | 0         |      |
| 17      | Escena modificar                      | 0x11          | 1         | 1         | 0         |      |
|         |                                       |               |           |           |           |      |
| 18      | Estado vivienda ver                   | 0x12          | 1         | 1         | 0         |      |
| 19      | Estado vivienda modificar             | 0x13          | 1         | 1         | 0         |      |



Para crear los permisos:

1. hay que coger los valores 0 o 1 empezando de derecha a izquierda, siendo la posición 0 → el valor de la derecha, para obtener el numero binario

2. Pasar dicho numero binario a hexadecimal, se puede utilizar una calculadora online.

   https://cual-es-mi-ip.online/herramientas/conversores-numericos/conversor-binario-a-hexadecimal/

3. El valor hexadecimal obtenido es el que se va a escribir en el tdato “permisos” de la tabla sistem_pruebas.usuario.



Para obtener los permisos de cada usuario: En el proyecto monjas.hometech.red 

1. Crear en el controlador Login una funcion getPermisions:
   1. Lee valor del 	tdato “permisos” de la tabla sistema_pruebas.usuario  	
   2. Pasa con una 	funcion de php el valor leido a hexadecimal
   3. Hacemos un for 	de n veces ( n.º caracteres leido x 4) Ej: 5x4 = 20 (for de 20)
      1. Por cada posicion del for hacemos un array.push del resultado de valor hexadecimal anterior con & 1 << n veces (posicion de la i del for)

​		Hacemos una AND logica desplazandola n veces a la izquierda para filtrar el valor y 	coger solo el que nos interesa.

1. Login/loginToken llamar a la funcion getPermisions() y añadirlo a lo que retorna dicha función como “permisions”



Nota : si todo funciona ok, el array devuelto por getPermisions tiene que contener en cada posicion el mismo valor que tenemos en la tabla documentada arriba.



Valores para los usuarios actuales:

usu1: admin1, admin2, pruebas2 → Todo 1 → FFFFF → 11111111111111111111

usu2: pruebas, pruebas23 → FF863 → 11111111100001100011

usu3: oviedo, oviedo2→ Todo 0 menos activación manual → 0800 → 00000000100000000000