### Configuracion Raspberry Pi modo Kiosk

#####Instalación Básica

Instalamos los paquetes basicos que vamos a necesitar:

```bash
$ apt-get update
$ apt-get install apache2 php vim htop
```

#####Configuración de módulos

Necesitamos configurar el kernel para que la webcam funcione correctamente, para ello ejecutamos:

```bash
$ echo 'options bcm2835-v4l2 gst_v4l2src_is_broken=1' | sudo tee -a /etc/modprobe.d/bcm2835-v4l2.conf
$ echo 'bcm2835-v4l2' | sudo tee -a /etc/modules-load.d/modules.conf
```

#####Configuramos la tarjeta de sonido

Primero editamos el siguiente archivo `/usr/share/alsa/alsa.conf` y modificamos las siguientes lineas de la siguiente manera:

```
defaults.ctl.card 1
defaults.pcm.card 1
```

Ahora editamos el siguiente archivo, si no existe lo creamos `~/.asoundrc`. Este archivo configura la entrada y salida de audio, si queremos que todo el audio (micrófono y altavoz) sea por via externa, es decir, por usb, introducimos lo siguiente:

```
pcm.!default {
    type hw
    card 1
}
ctl.!default {
    type hw
    card 1
}
```

En cambio si deseamos que solo el micrófono sea por via externa, y mantener los altavoces por el jack de la raspberry, introducimos lo siguiente:

```
pcm.!default {
	type asym
	capture.pcm "mic"
	playback.pcm "speaker"
}
pcm.mic {
	type plug
	slave {
		pcm "hw:1,0"
	}
}
pcm.speaker {
	type plug
	slave {
		pcm "hw:0,0"
	}
}
```

#####Auto iniciar *Chromium*

Editamos el archivo `~/.config/lxsession/LXDE-pi/autostart` (en nuevas versiones de raspbian, este archivo no existe, en su lugar editamos el siguiente ` /etc/xdg/lxsession/LXDE-pi/autostart`), borramos las lineas que empiezan con `@xscreensaver` y `@lxpannel` para evitar el salvapantallas y para ocultar la barra del sistema.

Ahora añadimos las siguientes lineas: `@xset s off`,  `@xset -dpms`, `@xset s noblank`, `@unclutter`

Para que chromium se inicie solo automáticamente tenemos que añadir la siguiente linea `@chromium-browser` con los siguientes parámetros:

(aunque se ejecute a mano, ejecutarlo con todos estos parámetros)

- `--noerrdialogs` elimina dialogos de error
- `--disable-session-crashed-bubble` elimina dialogos de cierre inesperado
- `--disable-infobars` elimina dialogos de información
- `--kiosk` modo pantalla completa sin distracciones
- `--disable-pinch` evita que se puede hacer zoom pellizcando
- `--incognito` para no guardar datos en cache al reiniciar
- `--use-fake-ui-for-media-stream` para no pedir permisos de camara y microfono
- `http://localhost` proyecto web que queremos mostrar

#####Ocultar raton y mantener pantalla encendida

Editamos el siguiente archivo `/etc/lightdm/lightdm.conf` y modificamos la linea que empieza con `xserver-command` de la siguiente manera: 

```
xserver-command=X -nocursor -s o dpms
```

#####Ocultar papelera

Editamos el siguiente archivo `~/.config/pcmanfm/LXDE-pi/desktop-items-0.conf` y modificamos 

```
show-trash=0
```

#####Ocultar informacion al arrancar la Raspberry

Editamos el siguiente archivo `/boot/cmdline.txt`, modificar `console=tty3` y añadir si no existe `quiet`, `splash`, `loglevel=0`, `logo.nologo`, `vt.global_cursor_default=0`.

#####Fonda pantalla negro

Recomiendo poner un fondo de pantalla negro para evitar que se vea un fondo blanco antes de que arranque chromium. Para ello nos dirigimos a `/usr/share/rpd-wallpaper/`, ahora debemos poner en esta carpeta un archivo `black.png` que tenga la imagen completamente negra, podemos intentar descargar la siguiente:

```bash
$ wget https://static-cdn.jtvnw.net/jtv_user_pictures/e91a3dcf-c15a-441a-b369-996922364cdc-profile_image-300x300.png -O black.png
```

> Es posible que el enlace ya no este disponible, en ese caso deberemos buscar otro.

Ahora para establecer la imagen como fondo, editamos el siguiente archivo `~/.config/pcmanfm/LXDE-pi/desktop-items-0.conf` (en nuevas versiones de raspbian, este archivo ya no existe) y modificar la siguiente linea:

```
wallpaper=/usr/share/rpd-wallpaper/black.png
```



