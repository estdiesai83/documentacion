# CONFIGURACION SERVIDOR:  

#### **nombre servidor:**  servidor-rudy-sec

| IP           | PUERTO | API                 | SOAJS                       |
| ------------ | ------ | ------------------- | --------------------------- |
| 89.7.222.195 | 20330  | monjas.hometech.red | soajs-monjas.hometech.red** |



| SISTEMA              | WEBSOCKET (SOAJS) | WEBSOCKET (SOA y API) | RPC  | IP   | BD   |
| -------------------- | ----------------- | --------------------- | ---- | ---- | ---- |
| nuevo (prueba trbs)  | 1509              | 1510                  | 459  |      |      |
| rudy_finca           | 1511              | 1512                  | 461  |      | 2    |
| pablo_boadilla       | 1513              | 1514                  | 463  |      | 3    |
| rudy_v2              | 1515              | 1516                  | 464  |      |      |
| alejandro_somosaguas | 1517              | 1518                  | 465  |      | 1    |
| somosaguas           | 1519              | 1520                  | 466  |      | 1    |



#### Nota:

** Al ejecutar el archivo de configuracion executed, ejecuta un soajs diferente por cada sistema, utilizando para cada uno un puerto diferente, por ello hay que crear un sitio en dinahosting y en /etc/apache2/sites-available un archivo por cada soajs que se vaya a ejecutar con su puerto correspondiente para los websocket



Los puerto de websocket (SOAJS) se utilizan en etc/sites-available/soajs-.... EJ:

```conf
File: soajs-somosaguas.hometech.red-ssl.conf
 
<IfModule mod_ssl.c>
<VirtualHost *:443>
 	ServerName soajs-somosaguas.hometech.red
	SSLEngine on
RewriteEngine on
        RewriteCond %{REQUEST_URI}  ^/socket.io            [NC]
        RewriteCond %{QUERY_STRING} transport=websocket    [NC]
        RewriteRule /(.*)           ws://localhost:1519/$1 [P,L]

	SSLCertificateFile /etc/letsencrypt/live/hometech.red/fullchain.pem
	SSLCertificateKeyFile /etc/letsencrypt/live/hometech.red/privkey.pem
	ProxyRequests on
	ProxyPreserveHost on
	ProxyPass / http://localhost:1519/
        ProxyPassReverse / http://localhost:1519/
</VirtualHost>
</IfModule>
```



Los puerto de websocket (SOA-API) se utilizan en sistemas/entornos-soa/soa_x.cfg EJ:

```
File: soa_somosaguas.cfg
[DB]
Db = sistema_somosaguas
Host = localhost
User = fincahazard
Pass = Fin-1503
Channel = 3306

[RPC]
Port = 466

[WEBSOCKET]
Port = 1520
Location = 11
Ip = 127.0.0.1

[LOG]
Trace = /home/soa/sistemas/logs/soa/sistema_somosaguas/trace.log
Debug = /home/soa/sistemas/logs/soa/sistema_somosaguas/debug.log
Info = /home/soa/sistemas/logs/soa/sistema_somosaguas/info.log
Warn = /home/soa/sistemas/logs/soa/sistema_somosaguas/warn.log
Error = /home/soa/sistemas/logs/soa/sistema_somosaguas/error.log
Fatal = /home/soa/sistemas/logs/soa/sistema_somosaguas/fatal.log

[SYSTEM]
Pid = /var/run/kernelsoa_somosaguas.pid

[STATUS]
Input = 250
Output = 250

[SMS]
# Url = https://sms.uniquehome.es/sms.php
Url = https://api.gateway360.com/api/3.0/sms/send
Apikey = ef16c132e87d4c2f958a5065a1f16233

[SMS_STATUS]
# hay que ponerlo con el 34 delante
Phone1 = 34638829607
Phone2 = 34650286107
```

En la APi dependiendo del sistema en el que estemos se llenan desde la libreria/_General.php en la funcion writeConfigurationGlobal

```
public function writeConfigurationGlobal($location_id) {
      $GLOBALS['CODIGOUBICACION'] = $location_id;
      $ubication = $this->em_sistema->getRepository('Entities\Ubicacion')->
         findOneBy( array('id' => $location_id));

      $id = $ubication->getBd();

      $GLOBALS['DIRECTORY']="ideacomonjas";
      $GLOBALS['PATH']="/var/www/html/ideacomonjas/";
      
      if ( $id ) {
         $GLOBALS['BD_UBICACION'] = $id;

         switch ($id) {
            case 1 : // somosaguas
               $GLOBALS['BD_NAME'] = "sistema_alejandro_somosaguas";
               $GLOBALS['PORT_RPC'] = 466;
               $GLOBALS['URL_RPC'] = "http://localhost:466/RPC2";

               $GLOBALS['PORT_UPDATE'] = 1520;
               $GLOBALS['ADDRESS_UPDATE'] = "127.0.0.1";

               $GLOBALS['URL_SOAJS']="https://soajs-somosaguas.hometech.red/";
               break;

               case 2 : // rudy
                  $GLOBALS['BD_NAME'] = "sistema_rudy_finca";
                  $GLOBALS['PORT_RPC'] = 461;
                  $GLOBALS['URL_RPC'] = "http://localhost:461/RPC2";
   
                  $GLOBALS['PORT_UPDATE'] = 1512;
                  $GLOBALS['ADDRESS_UPDATE'] = "127.0.0.1";
   
                  $GLOBALS['URL_SOAJS']="https://soajs-rudy.hometech.red/";
               break;

               case 3 : // pablo
                  $GLOBALS['BD_NAME'] = "sistema_pablo_boadilla";
                  $GLOBALS['PORT_RPC'] = 462;
                  $GLOBALS['URL_RPC'] = "http://localhost:462/RPC2";
   
                  $GLOBALS['PORT_UPDATE'] = 1514;
                  $GLOBALS['ADDRESS_UPDATE'] = "127.0.0.1";
   
                  $GLOBALS['URL_SOAJS']="https://soajs-pablo.hometech.red/";
               break;
         }     
      }   
```

