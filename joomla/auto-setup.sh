#!/bin/bash
set -e

(
    echo "AUTO-INSTALL: Esperando a que Joomla este listo..."
    sleep 20

    if [ -f /var/www/html/configuration.php ]; then
        echo "AUTO-INSTALL: Joomla ya esta instalado. No se requiere accion."
        exit 0
    fi

    echo "AUTO-INSTALL: Ejecutando instalador CLI de Joomla..."

    php /var/www/html/installation/joomla.php install \
        --site-name="${JOOMLA_SITE_NAME:-Parcial 2}" \
        --admin-user="${JOOMLA_ADMIN_USER:-Administrador}" \
        --admin-username="${JOOMLA_ADMIN_USERNAME:-admin}" \
        --admin-password="${JOOMLA_ADMIN_PASSWORD:-Admin12345!@#}" \
        --admin-email="${JOOMLA_ADMIN_EMAIL:-admin@parcial.com}" \
        --db-type="${JOOMLA_DB_TYPE:-pgsql}" \
        --db-host="${JOOMLA_DB_HOST:-database}" \
        --db-user="${JOOMLA_DB_USER:-joomla_user}" \
        --db-pass="${JOOMLA_DB_PASSWORD:-secreto_postgres}" \
        --db-name="${JOOMLA_DB_NAME:-joomla_db}" \
        --db-prefix="jn_" \
        --db-encryption=0 \
        2>&1 || echo "AUTO-INSTALL: Error o ya instalado previamente."

    echo "AUTO-INSTALL: Proceso completado."
) &

exec /entrypoint.sh "$@"