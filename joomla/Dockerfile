FROM joomla:latest
COPY auto-setup.sh /auto-setup.sh
RUN apt-get update && apt-get install -y dos2unix && dos2unix /auto-setup.sh && chmod +x /auto-setup.sh
ENTRYPOINT ["/auto-setup.sh"]
CMD ["apache2-foreground"]