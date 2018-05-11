#!/bin/bash

yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum-config-manager --enable remi-php72
yum -y install php php-soap php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo

echo "configuring php"
PHP_MEMORY_LIMIT=256M
sed -i 's/memory_limit = .*/memory_limit = '${PHP_MEMORY_LIMIT}'/' /etc/php.ini