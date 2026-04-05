# CONFIGURACION SERVIDOR:  

#### **nombre servidor:**  servidor-rudy-sec



| IP           | PUERTO | API                 | SOAJS                       |
| ------------ | ------ | ------------------- | --------------------------- |
| 89.7.222.195 | 20330  | monjas.hometech.red | soajs-monjas.hometech.red** |



| SISTEMA         | WEBSOCKET | UPDATE | RPC  | IP             | BD   |
| --------------- | --------- | ------ | ---- | -------------- | ---- |
| hazard*         | 1503      | 1504   | 458  |                |      |
| mariano         | 1505      | 1506   | 460  |                |      |
| pr_mariano      | 1507      | 1508   | 462  |                |      |
| pr_hazard       | 1509      | 1510   | 459  |                |      |
| montecerrado    | 1511      | 1512   | 461  | 213.96.239.235 | 2    |
| pr_montecerrado | 1513      | 1514   | 463  |                | 1    |
| rudy_v2         | 1515      | 1516   | 464  |                | 3    |
| pr_somosaguas   | 1517      | 1518   | 465  |                | 4    |
| somosaguas      | 1519      | 1520   | 466  |                | 5    |

#### Nota:

*Al ser un proyecto antiguo , no utiliza la api ni el soajs que los demas, utiliza api: hazard.hometech.red 	 soajs: socket-soa-hazard

** Al ejecutar el archivo de configuracion executed, ejecuta un soajs diferente por cada sistema, utilizando para cada uno un puerto diferente, por ello hay que crear un sitio en dinahosting y en /etc/apache2/sites-available un archivo por cada soajs que se vaya a ejecutar con su puerto correspondiente para los websocket

*** Antes cada proyecto tenia su propia api y su propia carpeta de soajs, EJ: pr-montecerrado.hometech.red y soajs_pr_montecerrado.hometech.red, mariano.hometech.red y soajs-mariano.homtech.red



Antes:

monjas → programación basada en mariano para hacer pruebas (soa, api, soajs)

monjas2 → programación basada en hazard para hacer pruebas (soa, api, soajs)