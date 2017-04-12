
sudo rm -rf /var/www/html
read -p "Enter repository for clonning:" repo
cat ~/.ssh/id_rsa.pub
read -p "Copy id_rsa as deploy key into github and press Enter" yn
git clone $repo html
sudo mv html /var/www

sudo bash -c 'cat ./nginx_default.conf > /etc/nginx/sites-available/default'
sudo systemctl reload nginx
