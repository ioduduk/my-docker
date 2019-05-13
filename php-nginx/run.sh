#!/bin/bash

php-fpm -y /usr/local/php/etc/php-fpm.conf -c /usr/local/php/etc/php.ini

exec nginx
