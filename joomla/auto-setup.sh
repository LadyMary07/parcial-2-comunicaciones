#!/bin/bash
set -e

# El Apache de la imagen escribe sus logs a /dev/stdout y /dev/stderr (symlinks),
# por lo que el volumen compartido quedaba sin archivos reales para Grafana.
# Se reemplazan por archivos reales y se replican a la consola de Docker.
mkdir -p /var/log/apache2
rm -f /var/log/apache2/access.log /var/log/apache2/error.log /var/log/apache2/other_vhosts_access.log
touch /var/log/apache2/access.log /var/log/apache2/error.log /var/log/apache2/other_vhosts_access.log
chmod 644 /var/log/apache2/*.log
tail -n 0 -F /var/log/apache2/access.log /var/log/apache2/error.log &

(
    echo "AUTO-INSTALL: Esperando a que Joomla este listo..."

    # El entrypoint oficial instala Joomla con las variables JOOMLA_*.
    # Se espera hasta 120 s a que aparezca configuration.php antes de usar el instalador de respaldo.
    for i in $(seq 1 60); do
        if [ -f /var/www/html/configuration.php ]; then
            echo "AUTO-INSTALL: Joomla ya esta instalado. No se requiere accion."
            exit 0
        fi
        sleep 2
    done

    if [ ! -f /var/www/html/installation/joomla.php ]; then
        echo "AUTO-INSTALL: No se encontro el instalador de Joomla."
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