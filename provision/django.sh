#!/bin/bash
set -eu

echo "installing python 3.6"
yum -y install https://centos7.iuscommunity.org/ius-release.rpm
yum -y update
yum -y install python36u python36u-libs python36u-devel python36u-pip

ln -fs /usr/bin/python3.6 /usr/bin/python3
ln -fs /usr/bin/pip3.6 /usr/bin/pip3

pip3 install --upgrade pip

echo "installing django "
pip3 install django

echo "installing crypto api"
pip3 install hitbtc
pip3 install btfxwss

echo "installing git"
yum -y install git

git clone https://rialto:Twb5W3xQhLcDbQQKJAswV9Ec@gitlab.com/krizajb/rialto-challange.git /opt/webroot/rialtochallange