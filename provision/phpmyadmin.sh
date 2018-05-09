#!/bin/bash

rpm -iUvh http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum -y update
yum -y install phpmyadmin

cp -f /opt/provision/httpd/conf.d/phpMyAdmin.conf /etc/httpd/conf.d/

# backup and replace the original config 
mv /etc/phpMyAdmin/config.inc.php /etc/phpMyAdmin/config.inc.php.bak
cp -f /opt/provision/phpmyadmin/config.inc.php /etc/phpMyAdmin/

systemctl restart httpd
