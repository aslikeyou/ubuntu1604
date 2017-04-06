
sudo rm -rf /var/www/html
read -p "Enter repository for clonning:" repo
read -p "Copy id_rsa as deploy key into github and press Enter" yn
echo ~/.ssh/id_rsa.pub
sudo git clone $repo /var/www/html
