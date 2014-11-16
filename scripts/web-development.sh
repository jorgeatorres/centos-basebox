#!/bin/bash

systemctl enable postfix
systemctl enable mariadb.service
systemctl enable httpd.service

# Make phpMyAdmin publicly accessible.
cat <<"APACHECONF" > /etc/httpd/conf.d/phpMyAdmin.conf
Alias /phpMyAdmin /usr/share/phpMyAdmin
Alias /phpmyadmin /usr/share/phpMyAdmin

<Directory /usr/share/phpMyAdmin/>
   Order Deny,Allow
   Allow from All
   Require all granted
</Directory>
APACHECONF

# PHP config
sed -i s/'display_errors = Off'/'display_errors = On'/ /etc/php.ini
sed -i s/'html_errors = Off'/'html_errors = On'/ /etc/php.ini
sed -i s/'upload_max_filesize = 2M'/'upload_max_filesize = 50M'/ /etc/php.ini

sed -i s/'#ServerName www.example.com:80'/'ServerName localhost:80'/ /etc/httpd/conf/httpd.conf

# WP-CLI setup.
wget --quiet https://github.com/wp-cli/wp-cli/releases/download/v0.14.0/wp-cli-0.14.0.phar
chmod a+x wp-cli-0.14.0.phar
mv wp-cli-0.14.0.phar /usr/bin/wp

systemctl start mariadb.service
mysqladmin --no-beep --silent -uroot password vagrant 2>/dev/null || true
mysql -uroot -pvagrant -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'vagrant' WITH GRANT OPTION;"

systemctl start postfix
systemctl restart mariadb.service
systemctl restart httpd.service
