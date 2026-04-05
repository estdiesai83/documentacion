# Docker

sudo docker image
git log (coger id commint)
git tag v.1.0.10.beta (mas churro del commint)
git push --tags
sudo ./build.sh 192.168.1.30:5555 teho-backend 1.0.1.10 (produccion) (si es desarrollo -beta)
cd sistemas/entornos-docker/
sudo docker stop teho-backend
sudo docker stop kernelsoa
(En desarrollo modificar el docker-compose.yaml y actualizar la versión
sudo docker-compose up -d teho_backend
sudo docker-compose up -d kernelsoa-alejandro-somosaguas

Para producción
Ir a pull REquest
meter develop en master
create pull request
Merge pull request
Confirmar

## Code (tag) create realeases version ultima que corresponda con la beta create Ir action para ver cuando termina de generarse la imagen En produccion sudo docker stop kernelsoa-*-* (por cada uno) sudo docker-compose up -d kernelsoa_*_* (por cada uno) sudo docker stop kernelso

Añadir
git tag x.x.x-beta ( churro )
git tag x.x.x ( churro git log origin/master )
git push --tag
(Se generara la imagen automaticamente)

git log --online --graph --all

Descargar Docker

En produccion:

- sudo docker pull 192.168.1.30:5555/teho-backend:latest
- sudo docker stop teho-backend
- sudo docker-compose up -d teho_backend

En desarrollo:

- sudo docker pull 192.168.1.30:5555/teho-backend:x.x.x-beta
- modificar docker compose y actualizar versión
- sudo docker stop teho-backend
- sudo docker-compose up -d teho_backend