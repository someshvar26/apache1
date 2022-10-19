FROM ubuntu
MAINTAINER somesh.vinay
RUN apt-get update
RUN apt-get install apache2 -y
RUN apt-get install apache2-utils -y
RUN apt-get install -y zip unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page283/teaser.zip /var/www/html

WORKDIR /var/www/html
RUN unzip teaser.zip
RUN cp -r teaser-html/* .
RUN chmod -R 755 /var/www/html 
RUN chown -R www-data:www-data /var/www/html 
EXPOSE 80
CMD ["apache2ctl","-D","FOREGROUND"]
