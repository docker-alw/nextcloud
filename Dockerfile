# vim:set ft=dockerfile:
FROM registry.gitlab.com/docker-alw/nextcloud-php-modules:latest

RUN set -x \
	&& apk --no-cache add php81-fpm

COPY php-fpm.conf /etc/php81/php-fpm.d/www.conf

VOLUME /app

EXPOSE 9000

CMD ["/usr/sbin/php-fpm81", "-F"]
