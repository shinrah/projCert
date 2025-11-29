FROM php:8.2-apache

COPY website/ /var/www/html/

# Set correct owner + permissions
RUN chown -R www-data:www-data /var/www/html/ \
    && chmod -R 755 /var/www/html/
