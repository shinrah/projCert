FROM php:7.4-apache
# copy application code to Apache web root
COPY ./var/www/html
#Expose port 80 for web application
EXPOSE 80
