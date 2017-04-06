
rm -rf /var/www/html
read -p "Enter repository for clonning:" repo
read -p "Copy id_rsa as deploy key into github and press Enter"
echo ~/.ssh/id_rsa.pub
git clone $repo /var/www/html
