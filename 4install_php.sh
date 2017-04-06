
sudo apt-get install -y php-fpm php-mysql php-mbstring php7.0-mbstring
sudo bash -c 'cat ./php.ini > /etc/php/7.0/fpm/php.ini'
sudo systemctl restart php7.0-fpm
sudo bash -c 'cat ./nginx_default.conf > /etc/nginx/sites-available/default'
sudo systemctl reload nginx
