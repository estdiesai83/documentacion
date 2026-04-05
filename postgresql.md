# PostGreSQL

## Paso 1: Instalar PostgreSQL



Ubuntu incluye PostgreSQL en sus repositorios oficiales, por lo que la instalación es sencilla. Ejecuta el siguiente comando:

```bash
sudo apt install postgresql postgresql-contrib -y
```

Este comando instalará tanto el servidor de bases de datos como algunas herramientas adicionales útiles.



## Paso 2: Verificar el estado del servicio PostgreSQL



Una vez instalada la base de datos, PostgreSQL debería iniciarse automáticamente. Puedes verificar su estado con:

```bash
sudo systemctl status postgresql
```



Si no está activo, puedes iniciarlo con:

```bash
sudo systemctl start postgresql
```



Y para asegurarte de que se inicie con el sistema:

```bash
sudo systemctl enable postgresql
```



## Paso 3: Acceder a PostgreSQL



PostgreSQL crea un usuario predeterminado llamado `postgres`. Para acceder a la consola interactiva, usa:

```bash
sudo -i -u postgres psql
```

Desde aquí, puedes ejecutar comandos SQL para administrar bases de datos.



## Paso 4: Crear un usuario y una base de datos



Es recomendable crear un usuario y una base de datos específica para tus proyectos. Desde la consola de PostgreSQL, ejecuta:

```sql
CREATE USER miusuario WITH PASSWORD 'contraseña_segura';
CREATE DATABASE mibasededatos;
GRANT ALL PRIVILEGES ON DATABASE mibasededatos TO miusuario;
```



Luego, sal de la consola escribiendo:

```
\q
```



## Paso 5: Configurar acceso remoto (Opcional)



Si necesitas conectarte a PostgreSQL desde otro equipo, edita el archivo de configuración:

```bash
sudo nano /etc/postgresql/14/main/postgresql.conf
```

Busca la línea:

```bash
#listen_addresses = 'localhost'
```

Y modifícala a:

```bash
listen_addresses = '*'
```

Luego, edita el archivo de autenticación:

```bash
sudo nano /etc/postgresql/14/main/pg_hba.conf
```

Añade la siguiente línea al final:

```bash
host    all             all             0.0.0.0/0               md5
```

Guarda los cambios y reinicia PostgreSQL:

```bash
sudo systemctl restart postgresql
```