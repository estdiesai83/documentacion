# MULTIPLES DOMINIOS DOVECOT

### [Maneja dominios virtuales en tu servidor de email](https://drivemeca.blogspot.com/2014/11/maneja-dominios-virtuales-en-tu.html)

En la [era de la virtualizacion](http://drivemeca.blogspot.com/2013/07/como-instalar-proxmox-3-paso-paso.html) y la nube, es bien común en un mismo servidor tener varios dominios de email. Continuando con el anterior articulo de Amavisd-new, hoy les mostrare como agregar la funcionalidad de multi dominio a postfix y configuraremos un servicio de imap/smtp con dovecot en un servidor Linux Centos 7. Aunque es recomendable continuar lo que hicimos en [el anterior articulo](http://drivemeca.blogspot.com/2014/11/fortalece-tu-servidor-de-email-linux.html), es posible hacerlo sin el, dejando nuestro servidor sin antispam/antivirus. El manejo de múltiples dominios o dominios virtuales nos permitirá con un único postfix MTA tener infinidad de dominios en el mismo servidor compartiendo recursos de forma transparente para el usuario final. La principal diferencia de una configuración de un único dominio es que los dominios virtuales se almacenan en un sitio y postfix junto a un servidor imap/pop (en este caso dovecot) son los encargados de dirigir los emails, autenticar las conexiones, etc, sin necesidad de tener las cuentas físicas creadas en /etc/passwd.



### Requerimientos para manejar dominios virtuales con Postfix en Centos

- [Linux Centos 7](http://drivemeca.blogspot.com/2014/07/como-instalar-linux-centos-7-paso-paso.html)
- Conectividad a internet

Instalamos dependencias

```bash
yum -y install bind-utils postfix cronie dovecot
```

Creamos un grupo y una cuenta para el manejo de los dominios virtuales. Los mailbox se almacenaran en /var/vmail

```bash
groupadd vmail -g 2222
useradd vmail -r -g 2222 -u 2222 -d /var/vmail -m
```

Verificamos que no este instalado sendmail o exim y si es asi, los eliminamos

yum remove exim sendmail



### Configuramos Postfix en Linux Centos

Editamos la configuración de postfix. Los parámetros que no se muestren, quedan con sus valores por default

```
vi /etc/postfix/main.cf
```

```
queue_directory = /var/spool/postfix
command_directory = /usr/sbin
daemon_directory = /usr/libexec/postfix
data_directory = /var/lib/postfix
mail_owner = postfix
unknown_local_recipient_reject_code = 550
alias_maps = hash:/etc/postfix/aliases
alias_database = $alias_maps
inet_interfaces = all
inet_protocols = all
mydestination = $myhostname, localhost.$mydomain, localhost
debug_peer_level = 2
debugger_command =
     PATH=/bin:/usr/bin:/usr/local/bin:/usr/X11R6/bin
     ddd $daemon_directory/$process_name $process_id & sleep 5

sendmail_path = /usr/sbin/sendmail.postfix
newaliases_path = /usr/bin/newaliases.postfix
mailq_path = /usr/bin/mailq.postfix
setgid_group = postdrop
html_directory = no
manpage_directory = /usr/share/man
sample_directory = /usr/share/doc/postfix-2.10.1/samples
readme_directory = /usr/share/doc/postfix-2.10.1/README_FILES

relay_domains = *
virtual_alias_maps=hash:/etc/postfix/vmail_aliases
virtual_mailbox_domains=hash:/etc/postfix/vmail_domains
virtual_mailbox_maps=hash:/etc/postfix/vmail_mailbox
virtual_mailbox_base = /var/vmail

virtual_minimum_uid = 2222
virtual_transport = virtual
virtual_uid_maps = static:2222
virtual_gid_maps = static:2222

smtpd_sasl_auth_enable = yes
smtpd_sasl_type = dovecot
smtpd_sasl_path = /var/run/dovecot/auth-client
smtpd_sasl_security_options = noanonymous
smtpd_sasl_tls_security_options = $smtpd_sasl_security_options
smtpd_sasl_local_domain = $mydomain
broken_sasl_auth_clients = yes

smtpd_recipient_restrictions = permit_mynetworks, permit_sasl_authenticated, reject_unauth_destination

smtpd_relay_restrictions = permit_mynetworks, permit_sasl_authenticated, reject_unauth_destination
```



### Activamos Postfix virtual domain en Linux Centos

Activamos nuestros dominios

```
vi /etc/postfix/vmail_domains

test.com                 OK
cualquierotrodominio.com OK
```



Agregamos cuentas de email para ambos dominios

```
vi /etc/postfix/vmail_mailbox

info@test.com      test.com/info/
info@cualquierotrodominio.com   cualquierotrodominio.com/info/
```



Creamos alias

```
vi /etc/postfix/vmail_aliases

info@test.com       drivemeca@test.com
info@cualquierotrodominio.com   drivemeca@cualquierotrodominio.com
```



Activamos los hash

```
postmap /etc/postfix/vmail_domains
postmap /etc/postfix/vmail_mailbox
postmap /etc/postfix/vmail_aliases
```



Modificamos master.cf

```
touch /etc/postfix/aliases
vi /etc/postfix/master.cf
submission inet n    -    n    -    -    smtpd
```



Configuramos dovecot

```
vi /etc/dovecot/dovecot.conf
```

```
listen = *,::
ssl = no
protocols = imap lmtp
disable_plaintext_auth = no
auth_mechanisms = plain login
mail_access_groups = vmail
default_login_user = vmail
first_valid_uid = 2222
first_valid_gid = 2222
mail_location = maildir:/var/vmail/%d/%n

passdb {
  driver = passwd-file
  args = scheme=SHA1 /etc/dovecot/passwd
}
userdb {
  driver = static
  args = uid=2222 gid=2222 home=/var/vmail/%d/%n allow_all_users=yes
}
service auth {
  unix_listener auth-client {
    group = postfix
    mode = 0660
    user = postfix
  }
  user = root
}

service imap-login {
 process_min_avail = 1
 user = vmail
}
```

Generamos contraseñas para las cuentas de email. Una por cada cuenta

```
doveadm pw -s sha1 | cut -d '}' -f2 >>/etc/dovecot/passwd
```

Editamos y agregamos las cuentas delante de la contraseña separadas por :

```
vi /etc/dovecot/passwd
info@test.com:yozM9OB/1DA9grwyQY5EUcPNWT0=
info@cualquierotrodominio.com:meMcG94PO7fGKZ4Pd4aV6JEFgaY=
```

Modificamos permisos

```
chown root: /etc/dovecot/passwd
chmod 600 /etc/dovecot/passwd
```



### Iniciamos servicios Postfix / Dovecot en Linux Centos

Iniciamos los servicios de postfix y dovecot, ademas de activarlos para su ejecución cuando haga boot el servidor

```
systemctl restart  postfix
systemctl enable postfix
systemctl restart  dovecot
systemctl enable dovecot
```

Hacemos pruebas de recibir y enviar mails desde un cliente de email, por ejemplo, thunderbird

[<img src="https://4.bp.blogspot.com/-O2tExYHtMFs/VHZELHGMuiI/AAAAAAAAP3Q/ybRmaeSIWzI/s1600/drivemeca-instalando-postfix-multidomain.png" alt="DriveMeca instalando y configurando Postfix multi domain paso a paso." style="zoom:33%;" />](https://4.bp.blogspot.com/-O2tExYHtMFs/VHZELHGMuiI/AAAAAAAAP3Q/ybRmaeSIWzI/s1600/drivemeca-instalando-postfix-multidomain.png)

Este es un ejemplo sencillo de manejo de múltiples dominios o dominios virtuales por medio de postfix con dovecot. Este servidor podrá ir creciendo junto con tus necesidades sin gran trabajo o gasto de recursos.



Documentacion de: https://drivemeca.blogspot.com/2014/11/maneja-dominios-virtuales-en-tu.html