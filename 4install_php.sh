
sudo apt-get install -y php-fpm php-mysql
sudo rm /etc/php/7.0/fpm/php.ini
sudo cat ./php.ini > /etc/php/7.0/fpm/php.ini
sudo systemctl restart php7.0-fpm
sudo cat ./nginx_default.conf > /etc/nginx/sites-available/default
sudo systemctl reload nginx
