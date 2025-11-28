FROM php:7.4-apache
# copy application code to Apache web roottt
COPY . /var/www/html
#set permission
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html
#Expose port 80 for web application
EXPOSE 80
