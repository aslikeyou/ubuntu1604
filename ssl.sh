public_name=$(curl -s http://169.254.169.254/latest/meta-data/public-hostname)
sudo openssl req \
	-x509 \
	-nodes \
	-days 365 \
	-newkey rsa:4096 \
	-subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=${public_name}" \
        -keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt

