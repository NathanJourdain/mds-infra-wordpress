#!/bin/bash
set -e

mkdir -p /var/www/html/wp-content
cp -a /usr/src/custom/wp-content/. /var/www/html/wp-content/
chown -R www-data:www-data /var/www/html/wp-content

exec docker-entrypoint.sh apache2-foreground
