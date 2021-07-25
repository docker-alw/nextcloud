# vim:set ft=dockerfile:
FROM alpine:latest

RUN set -x \
	&& adduser -S -u 960 nextcloud \
	&& apk --no-cache add \
		ffmpeg \
		imagemagick \
		libreoffice \
		php7-apcu \
		php7-bcmath \
		php7-bz2 \
		php7-ctype \
		php7-curl \
		php7-dom \
		php7-exif \
		php7-fileinfo \
		php7-fpm \
		php7-gd \
		php7-gettext \
		php7-gmp \
		php7-iconv \
		php7-imap \
		php7-intl \
		php7-json \
		php7-mbstring \
		php7-mcrypt \
		php7-opcache \
		php7-openssl \
		php7-pcntl \
		php7-pdo_mysql \
		php7-pecl-imagick \
		php7-posix \
		php7-session \
		php7-simplexml \
		php7-xml \
		php7-xmlreader \
		php7-xmlwriter \
		php7-zip \
		php7-zlib \
	&& ln -s /dev/stderr /var/log/php7/error.log

COPY php-fpm.conf /etc/php7/php-fpm.d/www.conf

VOLUME /app

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7", "-F"]
