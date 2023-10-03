#!/bin/sh
php artisan key:generate
php artisan cache:clear

/usr/local/bin/wait-for-it.sh mysql:3306 -t 1000
php artisan migrate
php artisan passport:key

php-fpm