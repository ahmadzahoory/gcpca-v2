#!/bin/bash
sudo apt update
sudo apt install apache2 -y
sudo systemctl enable apache2
sudo apt install -y apache2 wget unzip curl
sudo add-apt-repository -y ppa:ondrej/php 
sudo apt update 
sudo apt install -y php8.4
sudo apt install -y php-redis 
sudo apt install -y libapache2-mod-php8.4
sudo apt install -y php8.4-mysql
sudo apt install -y mysql-client
sudo apt install -y php8.4-cli
sudo apt install -y php8.4-xml
sudo apt install -y php8.4-mbstring
sudo apt install -y php-pear
sudo apt install -y php-dev
sudo apt install -y libzstd-dev
sudo apt install php8.4-bcmath
sudo apt install php8.4-intl
sudo pecl install igbinary
sudo yes 'y' | sudo pecl install redis
sudo phpenmod bcmath
sudo bash -c "echo 'extension=igbinary.so' >> /etc/php/8.4/apache2/php.ini"
sudo bash -c "echo 'extension=redis.so' >> /etc/php/8.4/apache2/php.ini"
sudo bash -c "echo 'extension=igbinary.so' >> /etc/php/8.4/cli/php.ini"
sudo bash -c "echo 'extension=redis.so' >> /etc/php/8.4/cli/php.ini"
sudo apt update
sudo apt install -y composer
cd /var/www/html/
sudo rm index.html
sudo wget https://github.com/ahmadzahoory/gcpca-v2/raw/main/gcp-caching-code.zip
sudo unzip gcp-caching-code.zip
sudo groupadd webadmins
sudo usermod -a -G webadmins www-data
sudo usermod -a -G webadmins gcpadmin
sudo chgrp -R webadmins /var/www/html
sudo chmod -R 775 /var/www/html
sudo chmod g+s /var/www/html
sudo yes 'y' | sudo composer install --working-dir=/var/www/html
sudo systemctl restart apache2.service
