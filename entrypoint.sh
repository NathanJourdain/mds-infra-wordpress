#!/bin/bash
set -e

cp -a /usr/src/custom/wp-content/. /var/www/html/wp-content/
chown -R www-data:www-data /var/www/html/wp-content

exec apache2-foreground
