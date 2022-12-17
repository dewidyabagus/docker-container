# DOCKER CONTAINER
## Docker Volume
docker volume create pgsql_product

## Docker Network
docker network create --driver bridge product_net

## Docker Container. Membuat Container Database PostgreSQL 14
docker create --name pgsql-product --memory 100m --cpus 0.75 --publish 5440:5432 --network product_net -e POSTGRES_DB=products -e POSTGRES_PASSWORD=qwerty -v pgsql_product:/var/lib/postgresql/data postgres:14-alpine3.16

## Memulai, Menghentikan dan Menghapus Container
docker start pgsql-product
docker stop pgsql-product
docker rm pgsql-product
docker stats               # Melihat Statistics

# DOCKER IMAGE
## Build Image Docker
docker build -t svc-product:1.0.0 .

## Running Container Dengan Image svc-product:1.0.0
docker create --name http-product --memory 100m --cpus 0.5 --publish 5001:5001 --network product_net --env-file ./.docker.env svc-product:1.0.0

docker start http-product

## Disconnect & Connect Network
docker network disconnect product_net pgsql-product
docker network connect product_net pgsql-product

# DOCKER COMPOSE
## Build Image
docker compose build

## Membuat, Melihat, Menjalankan, Menghentikan dan Menghapus Container
docker compose create
docker compose ps
docker compose start
docker compose stop
docker compose down

docker compose ls        # Melihat project yang berjalan
docker compose up -d     # Membuat dan menjalankan container secara background