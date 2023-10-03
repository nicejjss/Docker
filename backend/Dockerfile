FROM php:8.1.0-fpm as backend

COPY . .
RUN apt-get update && \
    apt-get install unzip 
RUN apt-get install wget
RUN docker-php-ext-install pdo pdo_mysql
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

RUN wget https://raw.githubusercontent.com/vishnubob/wait-for-it/8ed92e8cab83cfed76ff012ed4a36cef74b28096/wait-for-it.sh && \
    chmod +x wait-for-it.sh && \
    mv wait-for-it.sh /usr/local/bin/

RUN composer install

RUN chmod -R 777 storage/
RUN chmod -R 777 /var/www/html/public/images
ENTRYPOINT ["./init-app.sh"]

EXPOSE 9000

