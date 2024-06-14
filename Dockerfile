# vim:set ft=dockerfile:
# hadolint ignore=DL3007
FROM ghcr.io/docker-alw/nextcloud-php-modules:latest

COPY test.sh /test.sh

ARG PHP_VERSION=83

# hadolint ignore=DL3018
RUN apk --no-cache add php${PHP_VERSION}-fpm

# hadolint ignore=DL3059
RUN ln -s /usr/sbin/php-fpm${PHP_VERSION} /usr/sbin/php-fpm

COPY php-fpm.conf /etc/php${PHP_VERSION}/php-fpm.d/www.conf
COPY cache.conf /etc/php${PHP_VERSION}/conf.d/opcache.ini

VOLUME /app

EXPOSE 9000

CMD ["/usr/sbin/php-fpm", "-F"]
