# REINICIAR SOA AUTOMATICAMENTE



## Crear configuracion soa inicio automatico

Tiene que tener instalado pm2

```bash
sudo npm install pm2 -g
```



## Iniciar soa con configuracion ya creada

Para que se inicie solo automaticamente si por algo se para (Ej: violacion de segmento)



Entrar como root desde la terminal

```bash
sudo su
```

Los soas se ejecutan con pm2, para visualizar los que estan lanzados:

```
pm2 list
```

Muestra los que estan lanzados ej:

```
keepalive-soa-pr-somosaguas y keepalive-soa-somosaguas
```

Haces un stop al que necesites

```
pm2 stop keepalive-soa-pr-somosaguas
```

Y se para,  ejecutar el htop para comprobar que el proceso este muerto, si no lo esta lo matas a mano, o bien se puede hacer un ps aux | grep kernel

```
Ejemplo:
ps aux | grep kernel

sudo kill -15 numero_pid del proyecto devuelto en el comando anterior
```



Para iniciarlo

```
pm2 start keepalive-soa-pr-somosaguas
```

