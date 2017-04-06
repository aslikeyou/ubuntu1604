
sudo apt-get install -y php-fpm php-mysql
sudo wget -q https://raw.githubusercontent.com/aslikeyou/ubuntu1604/master/php.ini -O /etc/php/7.0/fpm/php.ini
sudo systemctl restart php7.0-fpm
