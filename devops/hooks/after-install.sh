#!/bin/bash

export WEB_DIR="/var/www/website"
export WEB_USER="ubuntu"

cd $WEB_DIR
sudo chown -R ubuntu:ubuntu .
sudo chown -R www-data storage
sudo chmod -R u+x .
sudo chmod -R g+w storage

sudo -u $WEB_USER composer install --no-dev --no-progress --prefer-dist
sudo -u $WEB_USER php artisan key:generate
sudo -u $WEB_USER php artisan migrate --no-interaction --force

