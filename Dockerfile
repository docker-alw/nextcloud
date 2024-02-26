# vim:set ft=dockerfile:
# hadolint ignore=DL3007
FROM registry.gitlab.com/docker-alw/nextcloud-php-modules:latest

ARG PHP_VERSION=82

# hadolint ignore=DL3018
RUN set -x \
	&& apk --no-cache add php${PHP_VERSION}-fpm

COPY php-fpm.conf /etc/php${PHP_VERSION}/php-fpm.d/www.conf
COPY cache.conf /etc/php${PHP_VERSION}/conf.d/opcache.ini

VOLUME /app

EXPOSE 9000

CMD ["/usr/sbin/php-fpm82", "-F"]
