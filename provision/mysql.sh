#!/bin/bash
set -eu

yum -y remove mariadb-libs
yum -y localinstall http://dev.mysql.com/get/mysql57-community-release-el7-7.noarch.rpm
yum -y install postfix
yum -y install mysql-community-devel mysql-community-server

systemctl enable mysqld
systemctl start mysqld

# get mysql temporary password
PASSWORD=$(grep 'temporary password' /var/log/mysqld.log | sed 's/.* //g')
echo "Root password: ${PASSWORD}"

# update password, remove validator plugin and remove password
mysql --password="${PASSWORD}" --connect-expired-password --execute \
  "ALTER USER USER() IDENTIFIED BY '@JCQZQBgZwY4S0e*KbxU'; UNINSTALL PLUGIN validate_password; ALTER USER USER() IDENTIFIED BY '';" || \
  echo "NOTICE: unable to update password, maybe this has been done before?"

# change root password:
# mysqladmin -uroot -poldpassword password newpassword

systemctl restart mysqld