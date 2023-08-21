#!/bin/bash

# Update the system
apt-get update
apt-get upgrade -y

# Install Apache, PHP, and required extensions
apt-get install -y apache2 php libapache2-mod-php php-{mbstring,ldap,tidy,xml,fpm,common,json,cli,mysql,gd,zip}

# Enable Apache mod_rewrite
a2enmod rewrite

# Download BookStack
cd /var/www/
git clone https://github.com/BookStackApp/BookStack.git --branch release --single-branch bookstack
cd bookstack

# Install Composer (Dependency Manager for PHP)
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install BookStack dependencies
composer install

# Set up permissions
chown -R www-data:www-data /var/www/bookstack/
chmod -R 755 /var/www/bookstack/

# Configure Apache to serve BookStack
echo "<VirtualHost *:80>
    DocumentRoot /var/www/bookstack/public/
    <Directory /var/www/bookstack/public/>
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>" > /etc/apache2/sites-available/bookstack.conf

# Enable the new site and reload Apache
a2ensite bookstack.conf
systemctl reload apache2
