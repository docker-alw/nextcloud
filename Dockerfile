# vim:set ft=dockerfile:
FROM registry.gitlab.com/docker-alw/nextcloud-php-modules:latest

RUN set -x \
	&& apk --no-cache add php7-fpm

COPY php-fpm.conf /etc/php7/php-fpm.d/www.conf

VOLUME /app

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7", "-F"]
