#!/bin/ash
# shellcheck shell=dash

set -x -e -o pipefail

source /php_version

test -e "/usr/sbin/php-fpm${PHP_VERSION}"
test -L "/var/log/php${PHP_VERSION}/error.log"
ls -l "/var/log/php${PHP_VERSION}/error.log" | grep "/dev/stderr"
test -f "/etc/php${PHP_VERSION}/php-fpm.d/www.conf"
test -f "/etc/php${PHP_VERSION}/conf.d/opcache.ini"

php-fpm -n -v | tr -d '.' | grep " ${PHP_VERSION}"
