#!/bin/bash
set -eu

echo "installing python 3.6"
yum -y install https://centos7.iuscommunity.org/ius-release.rpm
yum -y update
yum -y install python36u python36u-libs python36u-devel python36u-pip

ln -fs /usr/bin/python3.6 /usr/bin/python3
ln -fs /usr/bin/pip3.6 /usr/bin/pip3

pip3 install --upgrade pip

#yum -y install mod_wsgi
#pip3 install virtualenv

#mkdir /opt/web-root/django
#virtualenv /opt/web-root/django/virtualenv
#source /opt/web-root/django/virtualenv/bin/activate
pip3 install django