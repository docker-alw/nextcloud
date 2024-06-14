#!/bin/sh

set -x -e -o pipefail

PHP_VERSION=83

id | grep "(nextcloud)"
id -u | grep "960"

test -e "/usr/sbin/php-fpm${PHP_VERSION}"
test -L "/var/log/php${PHP_VERSION}/error.log"
ls -l "/var/log/php${PHP_VERSION}/error.log" | grep "/dev/stderr"
