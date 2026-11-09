FROM hshar/webapp:latest

COPY app/ /var/www/html/

EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]
