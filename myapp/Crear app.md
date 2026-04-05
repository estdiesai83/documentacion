# App desde cero con Angular y Laravel

Para crear una app desde cero con Angular y Laravel, primero instalar Laravel usando Composer, luego crear una API RESTful en Laravel para manejar los datos. 

A continuación, inicia un proyecto de Angular con el Angular CLI, crea las vistas y lógicas de tu interfaz y finalmente, conecta Angular con la API de Laravel para interactuar con tu aplicación.



## 1. Preparación e Instalación de Laravel

- **Instala Composer:** Es el gestor de dependencias de PHP, necesario para instalar Laravel.

- **Crea un proyecto de Laravel:** 

  Abre tu terminal, navega al directorio donde quieres crear el proyecto y ejecuta el siguiente comando para crear un nuevo proyecto llamado `mi-app`:

  ```bash
  composer create-project --prefer-dist laravel/laravel mi-app
  ```

  Navega al directorio del proyecto.

  ```bassh
  cd mi-app
  ```

  

## 2. Configuración de la API RESTful en Laravel

- **Crea modelos, controladores y rutas:**

  Define los modelos para tus datos, los controladores para la lógica de la aplicación y las rutas para tus endpoints de la API en Laravel.

- **Desarrolla la API:**

  Implementa las rutas y los métodos (GET, POST, PUT, DELETE) en tus controladores para que la API pueda interactuar con la base de datos.

  

## 3. Creación del Proyecto Angular

- **Instala Angular CLI:** Si aún no lo tienes, instala el Angular CLI globalmente:

  ```bash
  npm install -g @angular/cli
  ```

- **Crea un nuevo proyecto de Angular.**

  ```bash
  ng new mi-frontend
  ```

- **Navega al directorio del proyecto Angular.**

  ```bash
  cd mi-frontend
  ```



## 4. Conexión entre Angular y Laravel

- **Crea servicios en Angular:**

  Dentro de tu aplicación Angular, crea servicios que utilicen el `HttpClientModule` para hacer peticiones a tu API de Laravel.

- **Llama a los endpoints de la API:**

  En los componentes de tu aplicación Angular, utiliza los servicios para enviar y recibir datos de la API de Laravel. Por ejemplo, puedes hacer una petición GET para obtener datos de la API.

Ejemplo de un servicio de Angular para obtener datos de la API:

TypeScript

```typescript
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class DataService {
  private apiUrl = 'http://localhost:8000/api/datos'; // Reemplaza con tu URL de la API de Laravel

  constructor(private http: HttpClient) { }

  getDatos(): Observable<any[]> {
    return this.http.get<any[]>(this.apiUrl);
  }
}
```

- **Despliega la aplicación:** Una vez que hayas desarrollado ambas partes, necesitarás configurar tu servidor para ejecutar tu aplicación de manera que Angular pueda comunicarse con tu API de Laravel. 







# CREAR MY APP FAMYLIFE

Voy a crear mi primera app fullstack "FamyLife" a ver que sale, si conseguimos hacerla sola y que funcione.

La voy a crear utilizando:

- Backend: PHP, Laravel, MySQL para la parte del backend.
- Frontend: Angular, nodejs



La aplicación va a consistir en la funcionalidad que me gustaría a mi tener para gestionar mi día a día familiar, trabajo, hijos, casa, médicos, teléfonos, webs de interés ...

Posibles ideas a incluir: modificar pdf, subir fotos , archivos y que las pueda ver los miembros del mismo grupo. 



Pasos a seguir:

1. Creo un sitio en /etc/apache2/famylife.conf

   ```bash
   sudo nano famylife.conf
   ```

   Con el contenido:

   ```
   <VirtualHost *:80>
   ServerName localhost
   DocumentRoot /var/www/html/famylife/public
   
   
   <Directory /var/www/html/famylife>
   AllowOverride All
   </Directory>
   
   ErrorLog ${APACHE_LOG_DIR}/error.log
   CustomLog ${APACHE_LOG_DIR}/access.log combined
   
   </VirtualHost>
   ```

   Creo el sitio famylife y reinicio apache

   ```bash
   sudo a2ensite famylife.conf
   sudo systemctl reload apache2
   ```

   

2. Creamos la carpeta donde vamos a contener nuestra API:

   ```bash
   cd /var/www/html/
   composer create-project laravel/laravel famylife
   ```

   Al ejecutar el comando nos han salido estos warning

   ![image-20250903154856373](/home/soa/.config/Typora/typora-user-images/image-20250903154856373.png)

   

   Para solucionarlo he vuelto a instalar composer, (porque estaría anticuado) y he vuelto a ejecutar los pasos anteriores:

   ```bash
   composer install
   ```

   Al volver a realizar el `composer create....`se ha instalado correctamente, pero nos lanza un warning al terminar la creación del proyecto:

   ![image-20250903191144020](/home/soa/.config/Typora/typora-user-images/image-20250903191144020.png)

   

3. Entramos en la carpeta creada y cambiamos el propietario y damos permisos a la carpeta storage

   ```bash
   cd famylife
   sudo chown -R www-data:www-data . 
   sudo chmod -R 775 storage/ 
   ```

4. Creamos Apache Virtual Host File

   ```bash
   cd /etc/apache2/sites-available/
   
   sudo touch laravel.conf
   ```

   Poner dentro de este archivo:

   ```bash
   <VirtualHost *:80>
   ServerName localhost
   DocumentRoot /var/www/html/famylife/public
   
   <Directory /var/www/html/famylife>
   AllowOverride All
   </Directory>
   
   ErrorLog ${APACHE_LOG_DIR}/error.log
   CustomLog ${APACHE_LOG_DIR}/access.log combined
   
   </VirtualHost>
   ```

   Crear sitio laravel.conf

   ```bash
   sudo a2ensite laravel.conf
   ```

   Check the syntax:

   ```bash
   sudo apachectl -t
   ```

   Me ha dado un error:

   ![image-20250903190903143](/home/soa/.config/Typora/typora-user-images/image-20250903190903143.png)

​	Para solucionarlo: Abrir el archivo `/etc/hosts` y añadir una línea más con  `127.0.1.1 localhost`

```bash
sudo nano /etc/hosts
```

```bash
127.0.0.1       localhost
#127.0.1.1      soa
127.0.1.1       localhost

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
```



Para comprobar que todo ha ido bien:

Utilizacion de laravel

1. Nos colocamos en la carpeta que hemos creado para el proyecto de laravel

   ```bash
   cd /var/www/html/famylife
   ```

2. Ejecutar

   ```bash
   php artisan serve
   ```

    Nos debe aparecer algo como:

   ```bash
   Starting Laravel development server: http://127.0.0.1:8000
   ```

   



y si abrimos esa dirección en el navegador nos debería aparecer la pagina de laravel, si da un error de permisos, para solucionarlo

```bash
sudo chmod -R 777 storage/
```

Nota: por seguridad no se debería dar este tipo de permisos, es mejor asignar 755.



Primeros pasos:

Para no repetir el codigo de la estructura inicial de html:5 utilizamos el gestor de plantillas blade, que nos va a ayudar a generar el contenido html, para ello:

1. Creamos dentro del resources/views un directorio llamado layouts (diseños) y en este directorio vamos a ir albergando las partes comunes de nuestras vistas.

2. Dentro de **layouts** creamos un archivo **landing**.blade.php en el que vamos a crear la estructura inicial de html:5 (que es código que se repite en las 4 vistas que tenemos por ahora )

   ```html
   <!DOCTYPE html>
   <html lang="en">
   <head>
       <meta charset="UTF-8">
       <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <meta http-equiv="X-UA-Compatible" content="ie=edge">
       <title>Document</title>
   </head>
   <body>
       
   </body>
   </html>
   ```

   Dentro de este código como lo vamos a querer extender al resto de vistas tenemos que definir que cosas van a ser diferentes en cada vista, por ejemplo :

   - el titulo en lugar de Document en todas las vistas cada una tendrá su titulo.
   - el body también será diferente

3. Para distinguir las partes que van a cambiar, se hace con la directiva **@yield**, para que nuestro layout sepa que la vista le tiene que inyectar ese contenido, y como tenemos dos secciones tenemos que saber también a que parte corresponde.

   ```html
   <!DOCTYPE html>
   <html lang="en">
   <head>
       <meta charset="UTF-8">
       <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <meta http-equiv="X-UA-Compatible" content="ie=edge">
       <title>
           @yield('title')
       </title>
   </head>
   <body>
       @yield('content')
   </body>
   </html>
   ```

4. En cada vista, añadimos la directiva @extends para indicarle que queremos que utilize la vista layouts/landing

   ```php
   @extends('layouts.landing')
   ```

   Recordar que en las vistas se utiliza . en lugar de / para las rutas

5. Para indicar el valor que queremos en cada seccion de la vista landing

   ```
   @section('name','content')
   
   Ej: @section('title','content')
   ```

   Nota: no es obligatorio cumplimentar todas las secciones









## ERRORES SOLUCIONADOS:



ERROR 1: error al ejecutar php artisan serve

Si al ejecutar un proyecto existente e irlo a ejecutar con: php artisan serve nos muestra errores como este:

![image-20250903184612778](/home/soa/.config/Typora/typora-user-images/image-20250903184612778.png)

Solución: Eliminar la carpeta vendor y el archivo composer.lock y volver a instalar composer.

```bash
rm -fr vendor composer.lock
composer install

sudo chown -R www-data:www-data .
sudo chmod -R 775 storage/

php artisan serve
```



ERROR 2: error al ejecutar `apachectl -t`

![image-20250903190903143](/home/soa/.config/Typora/typora-user-images/image-20250903190903143.png)



Ahora al volver a ejecutar el comando aparece

```2
sudo apachectl -t
```

![image-20250903191804929](/home/soa/.config/Typora/typora-user-images/image-20250903191804929.png)



