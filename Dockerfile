# vim:set ft=dockerfile:

# upstream image provides PHP_VERSION via ENV
# hadolint ignore=DL3007
FROM ghcr.io/docker-alw/nextcloud-php-modules:latest

RUN echo "PHP_VERSION=${PHP_VERSION}" > /php_version

COPY test.sh /test.sh

# hadolint ignore=DL3018
RUN apk --no-cache add "php${PHP_VERSION}-fpm"

# hadolint ignore=DL3059
RUN ln -s "/usr/sbin/php-fpm${PHP_VERSION}" /usr/sbin/php-fpm

COPY php-fpm.conf /etc/php${PHP_VERSION}/php-fpm.d/www.conf
COPY cache.conf /etc/php${PHP_VERSION}/conf.d/opcache.ini

VOLUME /app

EXPOSE 9000

CMD ["/usr/sbin/php-fpm", "-F"]
