[TOC]

# Comprobar fecha renovacion certificados

1. Para los certificados de las web: poner en google la direccion que corresponda con https, pulsar en el candado -> certificado

2. Para los certificados del correo: 

   1. Mirar en el servidor: ssh -p 20331 soa@89.7.222.194 el archivo /etc/dovect/conf.d para ver que certificado es el que le corresponde. 

   2. Irnos al certificado que corresponda por ejemplo /etc/letsencryp/archive/business-card-0001/

   3. ejecutar el comando con el nombre del cerificado que corresponda, para que nos muestre la fecha

      ```bash
      openssl x509 -in cert.pem -text -noout
      ```

   4. Si no corresponde la fecha, copiar del servidor donde se genera el certificado ej: ssh -p 30 soa@89.7.222.194 y copiar la carpeta /etc/letsencryp/certificado_x y luego generar los enlace en etc/letsencryp/live/ (Estos pasos estan documentados mas abajo)

      
   

# Renovar Certificados WEB (https)

Conectarse al servidor que corresponda mediante ssh

```bash
ssh -p puerto soa@ip
```

Instalar el programa cerbot si no está instalado

```bash
sudo apt-get install certbot
```

Cambiar con el comando certbot el dominio y/o subdominios que corresponda:



## Renovar dominios: Opcion 1

Para todos los dominios tengan o no subdominios realizar 

```bash
sudo certbot certonly
```

Aparecerá:

```pseudocode
How would you like to authenticate with the ACME CA?

\- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
1: Apache Web Server plugin (apache)
2: Spin up a temporary webserver (standalone)
3: Place files in webroot directory (webroot)
\- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

Select the appropriate number [1-3] then [enter] (press 'c' to cancel): 



Pulsar opcion 1:

Plugins selected: Authenticator apache, Installer None
Starting new HTTPS connection (1): acme-v02.api.letsencrypt.org
Please enter in your domain name(s) (comma and/or space separated)  (Enter 'c'
to cancel): (Poner los que corresponda separados por un espacio)

En nuestro caso pegar:
atica.org certified-cards.com deinsaingenieros.com hometech.red mail1.atica.org mail1.decomadrid.org mail1.deinsaingenieros.com mail1.hometech.red mail1.uniquehome.es uniquehometech.es eltallerdelmovimiento.com www.atica.org  www.certified-cards.com www.decomadrid.org www.deinsaingenieros.com www.hometech.red www.uniquehometech.es www.eltallerdelmovimiento.com



Obtaining a new certificate
Performing the following challenges:
http-01 challenge for descargas.uniquehome.es
Waiting for verification...
Cleaning up challenges



IMPORTANT NOTES:

 \- Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/descargas.uniquehome.es/fullchain.pem
   
   Your key file has been saved at:
   /etc/letsencrypt/live/descargas.uniquehome.es/privkey.pem

   Your cert will expire on 2020-01-22. To obtain a new or tweaked
   version of this certificate in the future, simply run certbot
   again. To non-interactively renew *all* of your certificates, run
   "certbot renew"

 \- If you like Certbot, please consider supporting our work by:


   Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate

   Donating to EFF:                   https://eff.org/donate-le


```

Una vez se haya realizado correctamente anotar las rutas que nos devuelve donde se han generado dichos certificados. (rutas que estan en negrita en los párrafos anteriores)



## Renovar dominios con subdominios: Opcion2 

Ademas de hacer los pasos de la opción 1, realizar ademas la opcion 2 para los dominios que tienen subdominios. Ej:

```bash
sudo certbot certonly -i apache -d "\*.business-card.es" -d business-card.es --server https://acme-v02.api.letsencrypt.org/directory --manual --preferred-challenges dns
```

Cambiar business-card.es por el dominio que corresponda



Nota**: Si mostrase el mensaje: Wildcard domain are not supported: uniquehome.es, actualizar: apt-get update;

si siguiese mostrando el mensaje , instalar certbot para que instale los paquetes que falten.

```bash
Aparecera: Enter email address (used for urgent renewal and security notices) (Enter 'c' to
cancel): 
Poner por ejemplo: late@lateingenieros.com

Aparecera: Please read the Terms of Service at
https://letsencrypt.org/documents/LE-SA-v1.2-November-15-2017.pdf. You must
agree in order to register with the ACME server at https://acme-v02.api.letsencrypt.org/directory
(A)gree/(C)ancel: A

Aparecerá: Would you be willing to share your email address with the Electronic Frontier
Foundation, a founding partner of the Let's Encrypt project and the non-profit
organization that develops Certbot? We'd like to send you email about EFF and
our work to encrypt the web, protect its users and defend digital rights.
(Y)es/(N)o: Y

Aparecerá: Obtaining a new certificate
Performing the following challenges:
dns-01 challenge for business-card.es
dns-01 challenge for business-card.es

-------------------------------------------------------------------------------

NOTE: The IP of this machine will be publicly logged as having requested this
certificate. If you're running certbot in manual mode on a machine that is not
your server, please ensure you're okay with that.

Are you OK with your IP being logged?

(Y)es/(N)o: Y

Please deploy a DNS TXT record under the name
_acme-challenge.business-card.es with the following value:

wRIu72h7_NsC0D8fv8ZEglQmTGUDZBi2DX_y13tE8_E

Before continuing, verify the record is deployed.

Press Enter to Continue


Please deploy a DNS TXT record under the name
_acme-challenge.business-card.es with the following value:

KyTIDAms3bKIBYORizOSj4Y71vN7hADEycLsTu2gFwQ

Before continuing, verify the record is deployed.

Press Enter to Continue
```



Paralelamente abrir en chrome:  https://panel.dinahosting.com/

![](/home/soa/Imágenes/Capturas de pantalla/dinahosting.png)



Unos dominios están en un usuario1 y otros en usuario2.

Usuario1: gemma@uniquehome.es		

Usuario2:  miracle_monjas						 



Elegir en Dominio → Zona DNS 

1. Eliminar si hay algun _acme_challenge y si no hay crearlos
2. Elegir en Quiero hacer un … : Registro TXT
3. Elegir subdominio, y escribir en host el valor que corresponda por ej: _acme-challenge
4. En cadena de texto poner  el numero que nos aparece al hacer el certbot







No pulsar al ultimo enter (del comando cerbot) hasta que no estemos seguros de que ha funcionado, para comprobarlo: 

```bash
sudo host -t txt _acme-challenge.bussines-card.es
```

Este comando nos tiene que devolver los valores introducidos en dinahosting que son los que nos ha proporcionado el comando cerbot en los primeros pasos.

```bash
_acme-challenge.business-card.es descriptive text "wRIu72h7_NsC0D8fv8ZEglQmTGUDZBi2DX_y13tE8_E"
_acme-challenge.business-card.es descriptive text "KyTIDAms3bKIBYORizOSj4Y71vN7hADEycLsTu2gFwQ"
```



Entonces, volvemos a la consola de certbot y pulsamos a Enter y si todo ha ido bien mostrara:

```bash
Waiting for verification...
Cleaning up challenges

IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/business-card.es/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/business-card.es/privkey.pem
   Your cert will expire on 2019-09-05. To obtain a new or tweaked
   version of this certificate in the future, simply run certbot
   again. To non-interactively renew *all* of your certificates, run
   "certbot renew"
 - If you like Certbot, please consider supporting our work by:

   Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
   Donating to EFF:                    https://eff.org/donate-le
```







Después de generar los certificados y obtener la ruta correspondiente:

Conectarnos al ordenador donde hemos generado el certificado 

Ej: ssh -p 30 [**soa@**](mailto:soa@ip)89.7.222.196 

Modificar los archivos --ssl, primero del archivo general (dominio) y de todos sus subdominios. Empezar siempre primero por el general

```bash
cd /etc/apache/sites-available
nano espacionaturalelardal.com--ssl.conf
```

Modificar las líneas, para poner la ruta que nos devolvió al general los certificados con el comando cerbot:

```bash
SSLCertificateFile /etc/letsencrypt/live/business-card.es-0001/fullchain.pem
SSLCertificateKeyFile /etc/letsencrypt/live/business-card.es-0001/privkey.pem
```



### **Modificar para los correos:**

Conectarnos a ssh -p 20331 [**soa@**](mailto:soa@ip)89.7.222.194 irnos a la ruta y copiar dicha carpeta a nuestro ordenador: (YA NO HAY QUE COPIAR NADA SE GENERA AUTOMATICAMENTE EN LA 20331, antes era en la 20330)

```bash
scp -r -P 30 soa@89.7.222.194:/etc/letsencrypt/archive/carpeta_con_nombre_generado_cerbot /home/soa/ruta_donde_copiar

Nota los archivos tienen que tener permiso 644 y el directorio 755 para que se puedan copiar
chmod 644 -R carpeta_con_nombre_generado_cerbot
chmod 755 carpeta_con_nombre_generado_cerbot
```

Ej carpetas generadas con cerboot: business-card.es-0002, certified-cards.com, ecards.es, homemanager.es-0002, hometech.red, smarthome.red, tecnologiasit.org, uniquehome.es, uniquehometech.es-0002

Conectarnos en ssh -p 31 soa@89.7.222.194   y copiar dicha carpeta en  /etc/letsencryps/archive/

si no deja copiarla directamente en esa ruta copiarla en /home/soa y desde ahi moverla

```bash
scp -r -P 31 /home/soa/git/esther/archive/carpeta_con_nombre_generado_cerbot soa@89.7.222.194:/home/soa/

ssh -p 31 soa@89.7.222.194
sudo mv carpeta_con_nombre_generado_cerbot /etc/letsencrypt/archive/
```

Irnos a la carpeta /etc/letsencryps/live/

```bash
sudo su
cd /etc/letsencrypt/live
```

Crear una capeta con nombre carpeta_con_nombre_generado

```bash
mkdir carpeta_con_nombre_generado
```

Crear un archivo simbólico por cada archivo los archivos que corresponda Ej:

```
ln -s ../../archive/carpeta_con_nombre_generado/cert1.pem cert.pem
ln -s ../../archive/carpeta_con_nombre_generado/chain1.pem chain.pem
ln -s ../../archive/carpeta_con_nombre_generado/fullchain1.pem fullchain.pem
ln -s ../../archive/carpeta_con_nombre_generado/privkey1.pem privkey.pem

lrwxrwxrwx 1 root root  30 Jul 31  2019 cert.pem -> ../../archive/carpeta_con_nombre_generado/cert12.pem
lrwxrwxrwx 1 root root  31 Jul 31  2019 chain.pem -> ../../archive/carpeta_con_nombre_generado/chain12.pem
lrwxrwxrwx 1 root root  35 Jul 31  2019 fullchain.pem -> ../../archive/carpeta_con_nombre_generado/fullchain12.pem
lrwxrwxrwx 1 root root  33 Jul 31  2019 privkey.pem -> ../../archive/carpeta_con_nombre_generado/privkey12.pem

```

Para visualizar un certificado:

```bash
openssl x509 -in cert.pem -text -noout
```

Para que el correo coja los certificados:

```bash
sudo su
cd /etc/dovecot/conf.d
modificar el archivo 10-ssl.conf
modificar en ese archivo en ssl el nombre por el nombre de la carpeta que hemos copiado anteriormente carpeta_con_nombre_generado_cerbot

Ejemplo:
#ssl_cert = </etc/ssl/certs/dovecot.pem
ssl_cert = </etc/letsencrypt/live/business-card.es-0001/cert.pem
#ssl_key = </etc/ssl/private/dovecot.pem
ssl_key = </etc/letsencrypt/live/business-card.es-0001/privkey.pem
```



Modificar el archivo main.cf 

```bash
cd /etc/postfix en main.cf
nano main.cf
y modificar las lineas:
#smtpd_tls_cert_file=/etc/ssl/certs/dovecot.pem
smtpd_tls_cert_file=/etc/letsencrypt/live/business-card.es-0001/cert.pem
#smtpd_tls_key_file=/etc/ssl/private/dovecot.pem
smtpd_tls_key_file=/etc/letsencrypt/live/business-card.es-0001/privkey.pem

en smtpd_ cambiar la ruta por el nombre de la carpeta que hemos copiado
```

Reiniciar los servicios para que cojan los cambios

```bash
sudo /etc/init.d/dovecot restart
sudo /etc/init.d/postfix restart
```

Borrar la carpeta que he copiado a mi ordenador.



## Codigo para renovar los certificados que podemos necesitar :

### Opcion 1:

ssh -p 20331 **[soa@](mailto:soa@ip)**89.7.222.194 

**sudo certbot certonly**

```
atica.org decomadrid.org deinsaingenieros.com hometech.red lateingenieros.com mail1.atica.org mail1.decomadrid.org mail1.deinsaingenieros.com mail1.hometech.red mail1.lateingenieros.com mail1.uniquehome.es mail1.uniquehometech.es uniquehome.es uniquehometech.es eltallerdelmovimiento.com www.atica.org www.decomadrid.org www.deinsaingenieros.com www.hometech.red www.lateingenieros.com www.uniquehome.es www.uniquehometech.es www.eltallerdelmovimiento.com
```



### Opcion 2:

ssh -p 20331 [soa@](mailto:soa@ip)89.7.222.194 

```bash
sudo certbot certonly -i apache -d "*.business-card.es" -d business-card.es --server https://acme-v02.api.letsencrypt.org/directory --manual --preferred-challenges dns

sudo certbot certonly -i apache -d "*.certified-cards.com" -d certified-cards.com --server https://acme-v02.api.letsencrypt.org/directory --manual --preferred-challenges dns

sudo certbot certonly -i apache -d "*.ecards.es" -d ecards.es --server https://acme-v02.api.letsencrypt.org/directory --manual --preferred-challenges dns

sudo certbot certonly -i apache -d "*.homemanager.es" -d homemanager.es --server https://acme-v02.api.letsencrypt.org/directory --manual --preferred-challenges dns

sudo certbot certonly -i apache -d "*.hometech.red" -d hometech.red --server https://acme-v02.api.letsencrypt.org/directory --manual --preferred-challenges dns
\* Nota: Cuando genere los certificados de hometech.red que se hacen con * en la 194, hay que hacerlo tambien en la 195
sudo scp -r hometech.es-0001/ soa@89.7.222.195:/home/soa/

sudo certbot certonly -i apache -d "*.smarthome.red" -d smarthome.red --server https://acme-v02.api.letsencrypt.org/directory --manual --preferred-challenges dns

sudo certbot certonly -i apache -d "*.tecnologiasit.org" -d tecnologiasit.org --server https://acme-v02.api.letsencrypt.org/directory --manual --preferred-challenges dns

sudo certbot certonly -i apache -d "*.uniquehome.es" -d uniquehome.es --server https://acme-v02.api.letsencrypt.org/directory --manual --preferred-challenges dns
\* Cuando genere los certificados de uniquehome.es que se hacen con * en la 194, hay que hacerlo también en la  ssh -p 20330 soa@77.230.94.186
sudo scp -r uniquehome.es-0001/ soa@192.168.1.30:/home/soa/

sudo certbot certonly -i apache -d "*.uniquehometech.es" -d uniquehometech.es --server https://acme-v02.api.letsencrypt.org/directory --manual --preferred-challenges dns

sudo certbot certonly -i apache -d "*.ekaitzapeluqueros.com" -d ekaitzapeluqueros.com --server https://acme-v02.api.letsencrypt.org/directory --manual --preferred-challenges dns

sudo certbot certonly -i apache -d "*.merinopeluqueros.com" -d merinopeluqueros.com --server https://acme-v02.api.letsencrypt.org/directory --manual --preferred-challenges dns
```



ssh -p 30 [soa@](mailto:soa@ip)89.7.222.196 o ssh -p 20330 [soa@](mailto:soa@ip)89.7.222.196

```bash
sudo certbot certonly -i apache -d "*.espacionaturalelardal.com" -d espacionaturalelardal.com --server https://acme-v02.api.letsencrypt.org/directory --manual --preferred-challenges dns
```



Verificar antes de pulsar en continuar al ejecutar la intrucción anterior , si ha cogido la numeración introducida en dinahosting, para ello ejecutar para el dominio que estemos realizando, 

Cuando ha codigo los valores debe mostrar la numeracion que nos muestra cerbot, si nos muestra otra numeracion o nos muestra el mensaje: Host _acme-challenge.smarthome.red not found: 3(NXDOMAIN), tenemos que seguir esperando hasta que aparezca la numeracion que corresponda.



```bash
sudo watch -n 1  "host -t txt _acme-challenge.business-card.es"
sudo watch -n 1  "host -t txt _acme-challenge.certified-cards.com"
sudo watch -n 1  "host -t txt _acme-challenge.ecards.es"
sudo watch -n 1  "host -t txt _acme-challenge.homemanager.es"
sudo watch -n 1  "host -t txt _acme-challenge.hometech.red"
sudo watch -n 1  "host -t txt _acme-challenge.smarthome.red"
sudo watch -n 1  "host -t txt _acme-challenge.tecnologiasit.org"
sudo watch -n 1  "host -t txt _acme-challenge.uniquehome.es"
sudo watch -n 1  "host -t txt _acme-challenge.uniquehometech.es"
sudo watch -n 1  "host -t txt _acme-challenge.merinopeluqueros.com"
sudo watch -n 1  "host -t txt _acme-challenge.ekaitzapeluqueros.com"


sudo watch -n 1  "host -t txt _acme-challenge.espacionaturalelardal.com"
```





Una vez, comprobado que la numeracion es la correcta pulsar en enter para continuar. Y si todo ha ido correctamente, debe aparecer un mensaje de CONGRATULATIONS y mostrarnos una ruta, tenemos que apuntar dicha ruta para que posteriormente realicemos el siguiente paso.



Certificados que hay que copiar del servidor 20330 al 20331 (**YA NO HAY QUE COPIAR NADA, POR QUE SE GENERAN DIRECTAMENTE EN LA 20331**)

```bash
drwxr-xr-x 2 root root 4096 May 12 10:27 business-card.es-0001 (correos)
drwxr-xr-x 2 soa  soa  4096 Nov 25 10:56 business-card.es-0001_ant
drwxr-xr-x 2 soa  soa  4096 Dec 23 10:49 business-card.es-0002
drwxr-xr-x 2 soa  soa  4096 Dec 23 10:50 certified-cards.com
drwxr-xr-x 2 soa  soa  4096 Oct 13  2020 ecards.es
drwxr-xr-x 2 soa  soa  4096 Dec 23 10:50 homemanager.es-0002
drwxr-xr-x 2 root root 4096 Dec 23 10:54 hometech.red
drwxr-xr-x 2 root root 4096 Mar 26  2019 hometech.red-0001
drwxr-xr-x 2 root root 4096 Nov  6  2019 hoteltech.es
drwxr-xr-x 2 root root 4096 Jul 31  2019 mail1
drwxr-xr-x 2 soa  soa  4096 Oct 13  2020 smarthome.red
drwxr-xr-x 2 soa  soa  4096 Dec 23 10:55 tecnologiasit.org
drwxr-xr-x 2 soa  soa  4096 May 11 13:16 uniquehome.es
drwxr-xr-x 2 root root 4096 Nov  6  2019 uniquehometech.es
drwxr-xr-x 2 root root 4096 Sep 19  2018 uniquehometech.es-0001
drwxr-xr-x 2 soa  soa  4096 May 11 13:18 uniquehometech.es-0002
drwxr-xr-x 2 root root 4096 Nov  6  2019 www.homemanager.es
drwxr-xr-x 2 root root 4096 Nov  6  2019 www.uniquehome.es

```



Informacion:

Para espacionaturalel ardal, conectarse a:

ssh -p 20330 soa@89.7.222.196  -> servidor-ardal-sec 

Dinahosting usuario: gemma@uniquehome.es ( cambiado a monjas)



ssh -p 20330 soa@89.7.222.194 -> servidor piloto

ssh -p 20331 soa@89.7.222.194 -> servidor comercial (servidor de correo)



