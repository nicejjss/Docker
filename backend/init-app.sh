#!/bin/sh
php artisan key:generate
php artisan cache:clear

/usr/local/bin/wait-for-it.sh mysql:3306 -t 300
php artisan migrate
php artisan passport:key

php-fpm