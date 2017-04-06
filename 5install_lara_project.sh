
sudo rm -rf /var/www/html
read -p "Enter repository for clonning:" repo
cat ~/.ssh/id_rsa.pub
read -p "Copy id_rsa as deploy key into github and press Enter" yn
sudo git clone $repo /var/www/html
