# Docker Nextcloud

[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/docker-alw/nextcloud/main.svg)](https://results.pre-commit.ci/latest/github/docker-alw/nextcloud/main)
[![dependabot update](https://github.com/docker-alw/nextcloud/actions/workflows/dependabot/dependabot-updates/badge.svg)](https://github.com/docker-alw/nextcloud/actions/workflows/dependabot/dependabot-updates)
[![dependabot validate](https://github.com/docker-alw/nextcloud/actions/workflows/dependabot_validate.yml/badge.svg)](https://github.com/docker-alw/nextcloud/actions/workflows/dependabot_validate.yml)
[![Build Main Image](https://github.com/docker-alw/nextcloud/actions/workflows/build_image.yml/badge.svg)](https://github.com/docker-alw/nextcloud/actions/workflows/build_image.yml)

Docker image based on alpine running php-fpm with modules to be used for Nextcloud.

This image is intented to run within an internal docker network with a FastCGI proxy webserver (e.g. nginx) in front of it.

## Run

To run this container using the default PHP-FPM configuration just run:

```bash
docker network create -d bridge --subnet 10.0.1.0/24 "net-app"
docker create --network net-app --name "nextcloud" -v "/path/to/nextcloud-source-code/:/app/nextcloud/" "ghcr.io/docker-alw/nextcloud"
docker start nextcloud
```

To run the container with a modified PHP-FPM configuration use:

```bash
docker network create -d bridge --subnet 10.0.1.0/24 "net-app"
docker create --network net-app --name "nextcloud" -v "/path/to/nextcloud-source-code/:/app/nextcloud/" -v "/path/to/php-fpm/nextcloud.conf:/etc/php7/php-fpm.d/www.conf:ro" "ghcr.io/docker-alw/nextcloud"
docker start nextcloud
```
