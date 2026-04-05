[TOC]

# INSTALACIóN MOTION EYE OS

## Descargar imagen para instalar

Descargar la imagen que queremos instalar en nuestro pc.

```
https://github.com/ccrisan/motioneyeos/wiki/Installation
```

Pulsar en el enlace writeimage.sh, para copiar el codigo que muestra y guardarlo en un archivo con ese nombre , darle permisos de ejecucion, para poder ejecutar ese script que es el que nos va a montar la imagen que nos hemos descargado

El contenido de ese archivo es :

```bash
#!/bin/bash -e


function usage() {
    echo "Usage: $0 [options...]"
    echo ""
    echo "Available options:"
    echo "    <-i image_file> - indicates the path to the image file (e.g. -i /home/user/Download/file.img.gz)"
    echo "    <-d sdcard_dev> - indicates the path to the sdcard block device (e.g. -d /dev/mmcblk0)"
    echo "    [-m modem:apn:user:pwd:pin] - configures the mobile network modem (e.g. -m ttyUSB0:internet)"
    echo "    [-n ssid:psk] - sets the wireless network name and key (e.g. -n mynet:mykey1234)"
    echo "    [-s ip/cidr:gw:dns] - sets a static IP configuration instead of DHCP (e.g. -s 192.168.1.101/24:192.168.1.1:8.8.8.8)"
    exit 1
}

if [ -z "$1" ]; then
    usage 1>&2
fi

if [[ $(id -u) -ne 0 ]]; then echo "please run as root"; exit 1; fi

function msg() {
    echo " * $1"
}

while getopts "a:d:f:h:i:lm:n:o:p:s:w" o; do
    case "$o" in
        d)
            SDCARD_DEV=$OPTARG
            ;;
        i)
            DISK_IMG=$OPTARG
            ;;
        m)
            IFS=":" SETTINGS=($OPTARG)
            MODEM=${SETTINGS[0]}
            APN=${SETTINGS[1]}
            MUSER=${SETTINGS[2]}
            MPWD=${SETTINGS[3]}
            PIN=${SETTINGS[4]}
            ;;
        n)
            IFS=":" NETWORK=($OPTARG)
            SSID=${NETWORK[0]}
            PSK=${NETWORK[1]}
            ;;
        s)
            IFS=":" S_IP=($OPTARG)
            IP=${S_IP[0]}
            GW=${S_IP[1]}
            DNS=${S_IP[2]}
            ;;
        *)
            usage 1>&2
            ;;
    esac
done

if [ -z "$SDCARD_DEV" ] || [ -z "$DISK_IMG" ]; then
    usage 1>&2
fi

function cleanup {
    set +e

    # unmount sdcard
    umount ${SDCARD_DEV}* >/dev/null 2>&1
}

trap cleanup EXIT

BOOT=$(dirname $0)/.boot

if ! [ -f $DISK_IMG ]; then
    echo "could not find image file $DISK_IMG"
    exit 1
fi

gunzip=$(which unpigz 2> /dev/null || which gunzip 2> /dev/null || true)
unxz=$(which unxz 2> /dev/null || true)

if [[ $DISK_IMG == *.gz ]]; then
    if [ -z "$gunzip" ]; then
        msg "make sure you have the gzip package installed"
        exit 1
    fi
    msg "decompressing the .gz compressed image"
    $gunzip -c $DISK_IMG > ${DISK_IMG%???}
    DISK_IMG=${DISK_IMG%???}
elif [[ $DISK_IMG == *.xz ]]; then
    if [ -z "$unxz" ]; then
        msg "make sure you have the xz package installed"
        exit 1
    fi
    msg "decompressing the .xz compressed image"
    $unxz -T 0 -c $DISK_IMG > ${DISK_IMG%???}
    DISK_IMG=${DISK_IMG%???}
fi

umount ${SDCARD_DEV}* 2>/dev/null || true
msg "writing disk image to sdcard"
dd if=$DISK_IMG of=$SDCARD_DEV bs=1048576
sync

if which partprobe > /dev/null 2>&1; then
    msg "re-reading sdcard partition table"
    partprobe ${SDCARD_DEV}
    sleep 1
fi

msg "mounting sdcard"
mkdir -p $BOOT

if [ `uname` == "Darwin" ]; then
    BOOT_DEV=${SDCARD_DEV}s1 # e.g. /dev/disk4s1
    diskutil unmountDisk ${SDCARD_DEV}
    mount -ft msdos $BOOT_DEV $BOOT
else # assuming Linux
    BOOT_DEV=${SDCARD_DEV}p1 # e.g. /dev/mmcblk0p1
    if ! [ -e ${SDCARD_DEV}p1 ]; then
        BOOT_DEV=${SDCARD_DEV}1 # e.g. /dev/sdc1
    fi
    mount $BOOT_DEV $BOOT
fi

# wifi
if [ -n "$SSID" ]; then
    msg "creating wireless configuration"
    conf=$BOOT/wpa_supplicant.conf
    echo "update_config=1" > $conf
    echo "ctrl_interface=/var/run/wpa_supplicant" >> $conf
    echo "network={" >> $conf
    echo "    scan_ssid=1" >> $conf
    echo "    ssid=\"$SSID\"" >> $conf
    if [ -n "$PSK" ]; then
        echo "    psk=\"$PSK\"" >> $conf
    fi
    echo "}" >> $conf
    echo "" >> $conf
fi

# modem
if [ -n "$MODEM" ]; then
    msg "creating mobile network configuration"
    conf=$BOOT/ppp
    mkdir -p $conf
    echo $MODEM > $conf/modem
    echo "AT+CGDCONT=1,\"IP\",\"$APN\"" > $conf/apn
    echo > $conf/extra
    echo > $conf/auth
    echo > $conf/pin
    if [ -n "$MUSER" ]; then
        echo "user \"$MUSER\"" > $conf/auth
        echo "password \"$MPWD\"" >> $conf/auth
    fi
    if [ -n "$PIN" ]; then
        echo "AT+CPIN=$PIN" > $conf/pin
    fi
fi

# static ip
if [ -n "$IP" ] && [ -n "$GW" ] && [ -n "$DNS" ]; then
    msg "setting static IP configuration"
    conf=$BOOT/static_ip.conf
    echo "STATIC_IP=\"$IP\"" > $conf
    echo "STATIC_GW=\"$GW\"" >> $conf
    echo "STATIC_DNS=\"$DNS\"" >> $conf
fi

msg "unmounting sdcard"
sync
umount $BOOT
rmdir $BOOT

msg "you can now remove the sdcard"
```



```bash
sudo nano writeimage.sh (copiar el codigo anterior y guardar)

sudo chmod 777 writeimage.sh
```

Ejecutar el script

```bash
 ./writeimage.sh -d /dev/mmcblk0 -i "/path/to/motioneyeos.img"
```

Si se quiere configurar la red

```bash
 ./writeimage.sh -d /dev/mmcblk0 -i "/path/to/motioneyeos.img" -s "192.168.1.101/24:192.168.1.1:8.8.8.8"
```

Ejemplo:

```bash
sudo ./writeimage.sh -d /dev/sdb -i motioneyeos-raspberrypi4-20200606.img.xz 192.168.1.150/24:192.168.1.1:8.8.8.8
```

Una vez instalada colocamos la tarjeta en nuestra raspberry y nos conectamos a ella via web , es decir, abrimos nuestro navegador y ponermos la ip que hemos configurado o que nos muestra nuestra raspberry al arrancar. Por defecto, el usuario es `admin` y la contraseña vacía.

## Configuración camaras Motion EYE OS

Accedemos a la interfaz web, allí nos pedirá introducir usuario y contraseña

![](/home/esther/Documentos/Documentacion/Motion Eye OS/Screenshot 2020-01-03 at 12.01.26.png)

Por defecto, el usuario es `admin` y la contraseña vacía.

Ahora hacemos click en el menu de la derecha

![](/home/esther/Documentos/Documentacion/Motion Eye OS/Screenshot 2020-01-03 at 11.51.35.png)

Ahora hacemos click en el desplegable para añadir una cámara

![](/home/esther/Documentos/Documentacion/Motion Eye OS/Screenshot 2020-01-03 at 11.51.42.png)

Nos aparecera un diálogo donde tenemos que introducir los datos de nuestra cámara 

![](/home/esther/Documentos/Documentacion/Motion Eye OS/Screenshot 2020-01-03 at 11.52.05.png)

Por lo general, nuestras camaras son camaras de red, asi que en `Camera Type` seleccionamos `Network Camera`. Aqui introducimos la direccion de la camara y las credenciales. Tener en cuenta que cada tipo de camara tiene una URL especifica, asi que habra que buscar la adecuada para nuestro modelo

![](/home/esther/Documentos/Documentacion/Motion Eye OS/Screenshot 2020-01-03 at 11.52.24.png)

Despues de añadir nuestra camara, deberiamos ver el video. ahora hay que configurar un par de cosas para que el streaming sea lo mejor posible. Para ello primero, en la pestaña de `Video Device`, la opcion de `Frame Rate` tenemos que configurarla a `30` y en `video Resolution` vamos a intentar poner una resolucion de `1280x720`

![](/home/esther/Documentos/Documentacion/Motion Eye OS/Screenshot 2020-01-03 at 11.58.07.png)

Despues de esto, nos aseguramos de que las pestañas de `Text Overrlay` y `Motion Detection` esten desactivadas, y finalmente guardamos los cambios haciendo click en `Apply`

![img](file:///home/esther/Documentos/Documentacion/Motion Eye OS/Screenshot 2020-01-03 at 11.58.50.png?lastModify=1620896125)



Tambien podemos configurar si fuese necesario , otro nombre de usuario y contraseña, la ip,...