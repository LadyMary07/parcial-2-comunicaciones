FROM joomla:latest
COPY auto-setup.sh /auto-setup.sh
RUN apt-get update && apt-get install -y --no-install-recommends dos2unix \
    && dos2unix /auto-setup.sh && chmod +x /auto-setup.sh \
    && rm -rf /var/lib/apt/lists/* \
    && echo "ServerName localhost" > /etc/apache2/conf-available/servername.conf \
    && a2enconf servername
ENTRYPOINT ["/auto-setup.sh"]
CMD ["apache2-foreground"]