#!/bin/ash
# shellcheck shell=dash

set -x -e -o pipefail

# shellcheck disable=SC1091
. /php_version

test -e "/usr/sbin/php-fpm${PHP_VERSION}"
test -L "/var/log/php${PHP_VERSION}/error.log"
# shellcheck disable=SC2010
ls -l "/var/log/php${PHP_VERSION}/error.log" | grep "/dev/stderr"
test -f "/etc/php${PHP_VERSION}/php-fpm.d/www.conf"
test -f "/etc/php${PHP_VERSION}/conf.d/opcache.ini"

php-fpm -n -v | tr -d '.' | grep " ${PHP_VERSION}"
