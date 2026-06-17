#!/usr/bin/env bash

set -euo pipefail

echo "[backup.sh] Dump de la base de données..."
docker compose exec -T wp_database \
    sh -c 'mysqldump -uroot -p"$MYSQL_ROOT_PASSWORD" --all-databases --single-transaction --quick | gzip > /var/backup/wp_database.sql.gz'

echo "[backup.sh] Archive des fichiers WordPress..."
docker compose exec -T wordpress \
    sh -c 'cd /var/www/html && zip -rq /var/backup/wordpress.zip wp-content'

echo "[backup.sh] Terminé avec succès."
exit 0
