# LINUX

Debian (y la mayoría de las distros basadas en ella, como Ubuntu o Mint) requiere familiarizarse con la terminal. Aquí tienes una guía organizada de los comandos esenciales para moverte como un profesional.

------

## 🛠️ Gestión de Paquetes (`apt`)

Esta es la herramienta principal para instalar y actualizar software. Casi todos requieren `sudo`.

- **`sudo apt update`**: Actualiza la lista de paquetes desde los repositorios.
- **`sudo apt upgrade`**: Instala las versiones más recientes de los programas que ya tienes.
- **`sudo apt install [paquete]`**: Instala un programa nuevo.
- **`sudo apt remove [paquete]`**: Desinstala un programa.
- **`sudo apt autoremove`**: Limpia dependencias que ya no son necesarias.
- **`apt search [texto]`**: Busca un programa en los repositorios.  

------

## 📂 Navegación y Archivos

Moverse por las carpetas es el pan de cada día.

- **`ls -lh`**: Lista archivos con detalles (tamaño legible, permisos).
- **`cd [directorio]`**: Cambia de carpeta (`cd ..` para subir un nivel).
- **`pwd`**: Te dice exactamente en qué carpeta estás parado.
- **`mkdir [nombre]`**: Crea una carpeta nueva.
- **`rm [archivo]`**: Borra un archivo. Usa `rm -r` para carpetas.
- **`cp [origen] [destino]`**: Copia archivos o carpetas.
- **`mv [origen] [destino]`**: Mueve o renombra archivos.
- **`cat [archivo]`**: Muestra el contenido de un archivo de texto en la terminal.

------

## ⚙️ Sistema y Monitoreo

Para saber qué está pasando "bajo el capó".

- **`top`** o **`htop`**: Muestra los procesos en tiempo real (uso de CPU, RAM). `htop` es mucho más visual.
- **`df -h`**: Muestra el espacio libre en tus discos duros.
- **`free -m`**: Muestra el estado de la memoria RAM en MB.
- **`uname -a`**: Información sobre el kernel y la versión del sistema.
- **`uptime`**: Tiempo que lleva la máquina encendida.
- **`systemctl [acción] [servicio]`**: Gestiona servicios (ej: `start`, `stop`, `restart`, `status`).

------

## 🌐 Redes

Para diagnosticar problemas de conexión.

- **`ip a`**: Muestra tus interfaces de red y direcciones IP (reemplaza al viejo `ifconfig`).
- **`ping [host]`**: Comprueba la conexión con un servidor (ej: `ping google.com`).
- **`ss -tupln`**: Muestra los puertos abiertos y conexiones activas.
- **`curl -I [url]`**: Obtiene las cabeceras de una página web.

------

## 🔑 Permisos y Usuarios

En Debian, la seguridad es lo primero.

- **`sudo [comando]`**: Ejecuta algo con privilegios de superusuario.
- **`chmod [permisos] [archivo]`**: Cambia los permisos de lectura/escritura/ejecución.
- **`chown [usuario]:[grupo] [archivo]`**: Cambia el dueño de un archivo.
- **`whoami`**: Te confirma con qué usuario estás trabajando.

------

## 💡 Un par de trucos extra:

- **`man [comando]`**: El "manual". Si no sabes cómo usar un comando, escribe esto antes.
- **`history`**: Muestra todos los comandos que has escrito recientemente.
- **Tabulador (↹)**: Empieza a escribir una ruta o comando y pulsa la tecla Tab para que Debian lo complete por ti. ¡Ahorra mucho tiempo!





## SSH

SSH (Secure Shell) permite controlar un ordenador remoto desde el tuyo de forma segura. Es el estándar de oro para administar servidores Linux o interactuar con servicios como GitHub.

**1. La sintaxis básica** 

Para conectarte a otro equipo, necesitas conocer la **dirección IP** (o dominio) y un **nombre de usuario** válido en esa máquina. Desde la terminal:

```bash
ssh usuario@direccion_ip
```

- **Ejemplo:** `ssh root@192.168.1.50`
- **La primera vez:** Verás un mensaje preguntando si confías en el "host". Escribe `yes`.
- **Contraseña:** La terminal no mostrará asteriscos ni puntos mientras escribes; es normal por seguridad. Solo escribe y pulsa Enter.

**2. Comandos comunes y banderas**

A veces la configuración estándar no basta. Aquí están los modificadores más usados:

- **Cambiar de puerto:** Por defecto, SSH usa el puerto 22. Si el servidor usa otro (por ejemplo, el 2222): `ssh -p 2222 usuario@ip`

  ```bash
  Ejemplo: ssh -p 20331 soa@89.7.222.194   
  ```

- **Ejecutar un comando y salir:** Si solo quieres ver el espacio en disco sin entrar del todo: `ssh usuario@ip "df -h"`



**3. Olvida las contraseñas: Usa llaves SSH**

Usar contraseñas es tedioso y menos seguro. Lo ideal es usar un par de llaves (una pública y una privada).

**Pasos para configurar llaves:**

1. **Generar la llave en tu PC:** `ssh-keygen -t ed25519` (Presiona Enter a todo).
2. **Enviar tu llave pública al servidor:** `ssh-copy-id usuario@ip`
3. **¡Listo!** La próxima vez que entres, no te pedirá contraseña.

**4. Transferir archivos con SCP**

SSH no solo sirve para la terminal, también sirve para mover archivos de forma segura mediante el comando `scp`.

- **Subir un archivo al servidor:** `scp archivo.txt usuario@ip:/ruta/destino/`

  ```bash
  Ejemplo: scp -P 20330  /home/soa/Descargas/copias_servidor_195/uniquehome.es-0001 soa@77.230.94.186:/home/soa
  ```

- **Descargar una carpeta del servidor:** `scp -r usuario@ip:/ruta/remota/ /ruta/local/`



**5. Tips de "Pro"**

- **Cerrar sesión:** Simplemente escribe `exit` o presiona `Ctrl + D`.
- **Archivo Config:** Si te conectas seguido, puedes crear un archivo en `~/.ssh/config` para guardar alias. Así, en lugar de escribir `ssh usuario@muy-larga-ip-77`, solo escribirás `ssh mi-servidor`.

> **Nota de seguridad:** Nunca compartas tu **llave privada** (normalmente el archivo `id_rsa` o `id_ed25519` sin la extensión `.pub`). Esa es tu "llave maestra"; la pública (`.pub`) es la que va en los servidores.



## CURL

**cURL** es como un mensajero que envía y recibe datos a través de una URL. Es una herramienta de línea de comandos fundamental para interactuar con servidores web y APIs.

**¿Para qué se usa?**

- **Probar APIs:** Enviar datos a un servicio y ver qué responde.
- **Descargar archivos:** Desde instaladores hasta imágenes o sitios web completos.
- **Depuración (Debugging):** Ver exactamente qué cabeceras (headers) está enviando un servidor.
- **Automatización:** Incluir peticiones web en scripts de Bash o Python.



**¿Cómo se usa? (Comandos esenciales)**

1. **Petición básica (GET)**

   Para ver el contenido (el HTML) de una página o el JSON de una API

   ```bash
   curl https://www.google.com
   ```

2. **Descargar un archivo**

- **Con el nombre original:** Usa `-O` (mayúscula).
- **Con un nombre nuevo:** Usa `-o` (minúscula) seguido del nombre.

```bash
curl -O https://ejemplo.com/archivo.zip
curl -o mi_foto.jpg https://ejemplo.com/imagen_larga_01.jpg
```

**3. Ver las cabeceras (Headers)**

Si quieres saber qué servidor usa una web o si una página existe (código 200 vs 404), usa `-I`:

```bash
curl -I https://www.wikipedia.org
```

**4. Enviar datos (POST)**

Esto es lo que sucede cuando llenas un formulario. Se usa la bandera `-d` (data):

```php
curl -d "nombre=Juan&edad=30" -X POST https://api.ejemplo.com/usuarios
```

**5. Enviar JSON a una API**

Hoy en día es lo más común. Necesitas especificar que estás enviando JSON con un header (`-H`):

```bash
curl -H "Content-Type: application/json" \
     -d '{"usuario": "admin", "clave": "1234"}' \
     https://api.ejemplo.com/login
```



**Tabla de banderas (flags) más comunes**

| **Bandera** | **Función**                                                  |
| ----------- | ------------------------------------------------------------ |
| `-X`        | Especifica el método HTTP (GET, POST, PUT, DELETE).          |
| `-H`        | Añade una cabecera (Header) personalizada.                   |
| `-u`        | Usuario y contraseña para autenticación (ej: `user:pass`).   |
| `-L`        | Sigue redirecciones (si la web se movió de sitio).           |
| `-v`        | Modo "Verbose": te muestra **todo** el proceso de la conexión. |

------

> **Truco de experto:** En el navegador (Chrome o Firefox), puedes ir a la pestaña **Network** (F12), hacer clic derecho sobre cualquier petición y seleccionar **"Copy as cURL"**. Esto te dará el comando exacto para repetir esa acción desde tu terminal.