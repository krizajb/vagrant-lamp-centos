#!/bin/bash

# note: no prerequisite checks are performed (php, mysql etc)

echo "installing composer"
cd /tmp
curl -sS https://getcomposer.org/installer | php
#mv -f composer.phar /usr/local/bin/composer
mv -f composer.phar /usr/bin/composer
composer self-update

echo "creating craftcms3 project"
composer create-project craftcms/craft /opt/webroot/craftcms/

echo "virtual host setup"
cp -f /opt/provision/httpd/conf.d/craftcms.conf /etc/httpd/conf.d/
cp -f /opt/provision/httpd/conf.d/craftcmsfoo.conf /etc/httpd/conf.d/
cp -f /opt/provision/httpd/conf.d/craftcmsbar.conf /etc/httpd/conf.d/

cp -rf /opt/provision/craftcms/web-foo /opt/webroot/craftcms
cp -rf /opt/provision/craftcms/web-bar /opt/webroot/craftcms

echo "installing craftcms3"
DATABASE="craftcms"
USERNAME="admin"
PASSWORD="admin3"
EMAIL="blaz.krizaj@gmail.com"
SITE="qord"
URL="http://craftcms"

echo "creating craftcms3 database"
mysql -u root << EOF
    CREATE DATABASE IF NOT EXISTS \`$DATABASE\`
    DEFAULT CHARACTER SET utf8
    DEFAULT COLLATE utf8_general_ci;
EOF

php /opt/webroot/craftcms/craft setup/security-key
php /opt/webroot/craftcms/craft setup/db-creds --interactive=0 \
                                               --database=$DATABASE \
                                               --user=root

php /opt/webroot/craftcms/craft install --interactive=0 \
                                        --email=$EMAIL \
                                        --username=$USERNAME \
                                        --password=$PASSWORD \
                                        --siteName=$SITE \
                                        --siteUrl=$URL

systemctl restart httpd