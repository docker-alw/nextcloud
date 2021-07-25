# Docker Nextcloud

Docker image based on alpine running php-fpm with modules to be used for Nextcloud.

This image is intented to run within an internal docker network with a FastCGI proxy webserver (e.g. nginx) in front of it.

[![pipeline status](https://gitlab.com/docker-alw/nextcloud/badges/main/pipeline.svg)](https://gitlab.com/docker-alw/nextcloud/-/commits/main)

## Run

To run this container using the default PHP-FPM configuration just run:
```
docker network create -d bridge --subnet 10.0.1.0/24 "net-app"
docker create --network net-app --name "nextcloud" -v "/path/to/nextcloud-source-code/:/app/nextcloud/" "registry.gitlab.com/docker-alw/nextcloud"
docker start nextcloud
```

To run the container with a modified PHP-FPM configuration use:
```
docker network create -d bridge --subnet 10.0.1.0/24 "net-app"
docker create --network net-app --name "nextcloud" -v "/path/to/nextcloud-source-code/:/app/nextcloud/" -v "/path/to/php-fpm/nextcloud.conf:/etc/php7/php-fpm.d/www.conf:ro" "registry.gitlab.com/docker-alw/nextcloud"
docker start nextcloud
```
