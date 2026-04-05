# Renovación automática del certificado SSL

¿Sabía que puede configurar rápidamente sus certificados Let’s Encrypt para renovarse automáticamente ejecutando un simple script de renovación automática de letencrypt?

En este tutorial para principiantes, aprenderá cómo configurar sus certificados SSL Let Let’s Encrypt para renovarse automáticamente antes de su fecha de vencimiento.

Antes de comenzar con este tutorial, ya debería haber configurado los certificados SSL Let Let’s Encrypt para un servidor Apache.

Si aún no ha configurado su SSL para su sitio web, aquí está el tutorial para las configuraciones de servidor.

## 1. Localice el paquete Certbot-Auto

Para aquellos de ustedes que configuraron SSL utilizando los tutoriales Click-to-deploy y Bitnami SSL, su paquete certbot-auto se descargó a su directorio de inicio. Puede ver el paquete simplemente ejecutando el comando ls.

Para aquellos de ustedes que descargaron el paquete certbot-auto a un directorio diferente, es importante encontrarlo. Si no puede encontrar el paquete certbot-auto, puede volver a descargar el paquete ejecutando el siguiente comando:

```bash
wget https://dl.eff.org/certbot-auto && chmod a+x certbot-auto
```

![img](https://onepagezen.com/wp-content/uploads/2018/01/new-certbot-package-after-re-downloading.png)

## 2. Mover paquete Certbot-Auto

Después de establecer la ubicación de su paquete Cerbot-Auto, el siguiente paso es mover el paquete certbot-auto al directorio / etc / letsencrypt /.

```bash
sudo mv certbot-auto /etc/letsencrypt/
```

Podemos comprobar que el paquete se ha movido al directorio indicado con el siguiente comando:

ls /etc/letsencrypt/

## 3. Editar archivo Crontab

Ahora que ha movido su paquete certbot-Auto al directorio / etc / letsencrypt /, el siguiente paso es abrir su archivo crontab.

Para abrir su archivo crontab, ejecute el siguiente comando:

```bash
sudo crontab -e
```

En el caso de que no hayamos ejecutado antes nuestro crontab veremos que nos indica una salida como la siguiente. En el ejemplo se selecciona el editor «nano» que es la primera opción simplemente indicando el 1 y la tecla «Enter».

```bash
no crontab for root - using an empty one

Select an editor.  To change later, run 'select-editor'.
  \1. /bin/nano        <---- easiest
  \2. /usr/bin/vim.basic
  \3. /usr/bin/vim.tiny

Choose 1-3 [1]: 1
```



## 4. Configurar el script para la renovación automática

Ahora que ha abierto su archivo crontab, el siguiente paso es agregar una secuencia de comandos en la parte inferior del archivo crontab que se ejecutará una vez por semana y renovará automáticamente los certificados SSL si están a punto de caducar. Para los usuarios de Apache estándar, agregue el siguiente comando al final del archivo:

```bash
45 2 * * 6 cd /etc/letsencrypt/ && ./certbot-auto renew && /etc/init.d/apache2 restart
```



## 5. Pruebas básicas de renovación automática

Para probar el script de renovación automática en busca de errores, puede realizar rápidamente una ‘ejecución en seco’, un proceso en el que se ejecutará el script de renovación automática sin renovar los certificados. Para realizar una ‘ejecución en seco’, ejecute los siguientes dos comandos:

```bash
sudo -i
cd /etc/letsencrypt/ && ./certbot-auto renew --dry-run && /etc/init.d/apache2 restart
```

Tras la ejecución del comando de renovación, si todo va bien veremos al final la siguiente salida:

```bash
\- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Processing /etc/letsencrypt/renewal/mi-dominio.com.conf
\- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Cert not due for renewal, but simulating renewal for dry run
Plugins selected: Authenticator apache, Installer apache
Renewing an existing certificate
Performing the following challenges:
http-01 challenge for mi-dominio.com
Waiting for verification...
Cleaning up challenges

\- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
new certificate deployed with reload of apache server; fullchain is
/etc/letsencrypt/live/mi-dominio.com/fullchain.pem
\- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

\- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
** DRY RUN: simulating 'certbot renew' close to cert expiry
**          (The test certificates below have not been saved.)

Congratulations, all renewals succeeded. The following certs have been renewed:
  /etc/letsencrypt/live/mi-dominio.com/fullchain.pem (success)
** DRY RUN: simulating 'certbot renew' close to cert expiry
**          (The test certificates above have not been saved.)
\- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

IMPORTANT NOTES:
 \- Your account credentials have been saved in your Certbot
   configuration directory at /etc/letsencrypt. You should make a
   secure backup of this folder now. This configuration directory will
   also contain certificates and private keys obtained by Certbot so
   making regular backups of this folder is ideal.
[ ok ] Restarting apache2 (via systemctl): apache2.service.
```

¡Felicidades! Ha configurado correctamente sus certificados Let’s Encrypt SSL para renovarlos automáticamente antes de su vencimiento.

Si desea probar y ejecutar el proceso de renovación, continúe con el siguiente paso (opcional). El script renovará los certificados un mes antes de la fecha de vencimiento.



Documentacion descargada de: https://www.nubins.com/renovacion-automatica-del-certificado-ssl/





Let's Encrypt recomienda correr esta tarea dos veces al día (eligiendo un minuto aleatorio, para aliviar la carga en sus servidores). Tal vez parezca exagerado (siendo que los certificados son válidos por tres meses) pero evitará interrupciones en el servicio en caso de que Let's Encrypt revoque certificados por alguna razón (brecha de seguridad, cambio en algoritmos de hashing, etc.) Tener en cuenta que este trabajo no realiza ninguna tarea si los certificados no están por expirar o revocados. Doc: https://www.linuxparty.es/57-seguridad/9978-generar-un-certificado-ssl-tls-gratis-y-autofirmado-con-certbot.html





# PRINCIPALES COMANDOS PARA MANTENER UN SISTEMA DE CERTIFICADOS LET’S ENCRYPT



**20 de abril de 2020** [actualizado el 23 de abril de 2020]

Escribí hace un tiempo sobre [Let’s Encrypt](https://letsencrypt.org/), la primera organización de certificación que emite certificados gratuitos y de manera automática. Contaba entonces [cómo obtener certificados Let’s Encrypt](https://voragine.net/weblogs/https-tsl-letsencrypt-certbot). Desde entonces la manera de obtener certificados ha cambiado: ahora es más sencillo obtenerlos, renovarlos, anularlos… Hago un repaso aquí de los comandos necesarios para mantener certificados Let’s Encrypt.



Herramienta de la EFF para saber cómo instalar certbot en función del sistema operativo y el servidor web usado.

Para instalar cerbot, [la Electronic Frontier Foundation pone a disposición una herramienta web](https://certbot.eff.org/) en la que, eligiendo el sistema operativo y el servidor web usado, devuelve la versión de `certbot` y las instrucciones precisas para instalarla y su uso básico.

certbot-auto se actualiza automáticamente, junto con todas sus dependencias. Cada vez que se ejecuta se comprueba si la versión instalada es la última; si no lo es, se inicia automáticamente la actualización:

```bash
user@server:$ sudo certbot-auto -h
Upgrading certbot-auto 1.2.0 to 1.3.0...
Replacing certbot-auto...
Creating virtual environment...
Installing Python packages...
Installation succeeded.
 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  certbot-auto [SUBCOMMAND] [options] [-d DOMAIN] [-d DOMAIN] ...
```



## LISTAR LOS CERTIFICADOS GESTIONADOS POR LET’S ENCRYPT

```bash
user@server:$ sudo certbot-auto certificates
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Found the following certs:
  Certificate Name: example.net
    Domains: example.net www.example.net
    Expiry Date: 2020-06-02 07:50:47+00:00 (VALID: 42 days)
    Certificate Path: /etc/letsencrypt/live/example.net/fullchain.pem
    Private Key Path: /etc/letsencrypt/live/example.net/privkey.pem


user@server:$ sudo certbot-auto certificates
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Found the following certs:
  Certificate Name: example.net
    Domains: example.net www.example.net
    Expiry Date: 2020-06-02 07:50:47+00:00 (VALID: 42 days)
    Certificate Path: /etc/letsencrypt/live/example.net/fullchain.pem
    Private Key Path: /etc/letsencrypt/live/example.net/privkey.pem
```



## EXPEDIR UN NUEVO CERTIFICADO

```
user@server:$ sudo certbot-auto certonly --webroot -w /var/www/example.org -d example.org -d www.example.org --dry-run
```



## RENOVAR UN CERTIFICADO

```
user@server:$ sudo certbot-auto renew --cert-name example.org --force-renewal
Saving debug log to /var/log/letsencrypt/letsencrypt.log

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Processing /etc/letsencrypt/renewal/example.org.conf
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Plugins selected: Authenticator webroot, Installer None
Renewing an existing certificate
Performing the following challenges:
http-01 challenge for example.org
http-01 challenge for www.example.org
Waiting for verification...
Cleaning up challenges

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
new certificate deployed without reload, fullchain is
/etc/letsencrypt/live/example.org/fullchain.pem
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Congratulations, all renewals succeeded. The following certs have been renewed:
  /etc/letsencrypt/live/example.org/fullchain.pem (success)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

user@server:$ sudo certbot-auto renew --cert-name example.org --force-renewal
Saving debug log to /var/log/letsencrypt/letsencrypt.log
 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Processing /etc/letsencrypt/renewal/example.org.conf
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Plugins selected: Authenticator webroot, Installer None
Renewing an existing certificate
Performing the following challenges:
http-01 challenge for example.org
http-01 challenge for www.example.org
Waiting for verification...
Cleaning up challenges
 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
new certificate deployed without reload, fullchain is
/etc/letsencrypt/live/example.org/fullchain.pem
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 
Congratulations, all renewals succeeded. The following certs have been renewed:
  /etc/letsencrypt/live/example.org/fullchain.pem (success)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

```

La opción `--force-renewal` fuerza la renovación incluso si la fecha de caducidad del certificado no está cercana. Se puede aplicar la opción `--dry-run` también al comando de renovación.

## MODIFICAR UN CERTIFICADO: AÑADIR O ELIMINAR DOMINIOS

Para añadir al certificado example.org, el subdominio subdomain.example.org:

```bash
user@server:$ sudo certbot-auto certonly --cert-name examplel.org -d example.org -d www.example.org -d subdomain.example.org
```



Para eliminar un dominio de un certificado basta no incluirlo en el comando anterior:

```bash
user@server:$ sudo certbot-auto certonly --cert-name examplel.org -d example.org -d subdomain.example.org
```



## ANULAR UN CERTIFICADO

```
user@server:$ sudo certbot-auto revoke --cert-path /etc/letsencrypt/live/example.org/cert.pem
Saving debug log to /var/log/letsencrypt/letsencrypt.log

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Would you like to delete the cert(s) you just revoked, along with all earlier
and later versions of the cert?
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
(Y)es (recommended)/(N)o: Y

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Deleted all files relating to certificate example.org.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Congratulations! You have successfully revoked the certificate that was located
at /etc/letsencrypt/live/example.org/fullchain.pem
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

user@server:$ sudo certbot-auto revoke --cert-path /etc/letsencrypt/live/example.org/cert.pem
Saving debug log to /var/log/letsencrypt/letsencrypt.log
 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Would you like to delete the cert(s) you just revoked, along with all earlier
and later versions of the cert?
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
(Y)es (recommended)/(N)o: Y
 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Deleted all files relating to certificate example.org.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Congratulations! You have successfully revoked the certificate that was located
at /etc/letsencrypt/live/example.org/fullchain.pem
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

```



Solo se pueden anular los certificados que no hayan caducado.

Para eliminar del sistema todos los archivos de un certificado ya caducado o anulado:

```
user@server:$ sudo certbot-auto delete --cert-name example.org
Saving debug log to /var/log/letsencrypt/letsencrypt.log

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Deleted all files relating to certificate example.org.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


user@server:$ sudo certbot-auto delete --cert-name example.org
Saving debug log to /var/log/letsencrypt/letsencrypt.log
 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Deleted all files relating to certificate example.org.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

```

