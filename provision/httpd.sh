#!/bin/bash
set -eu

yum -y install httpd httpd-devel mod_ssl

echo "configuring httpd"
rm -f /etc/httpd/conf.d/*
mv -f /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd-original.conf
cp /opt/provision/httpd/conf/httpd.conf /etc/httpd/conf/

echo "virtual host setup"
cp -f /opt/provision/httpd/conf.d/test.devel.conf /etc/httpd/conf.d/

echo "disabling firewall"
systemctl stop firewalld
systemctl disable firewalld

echo "starting httpd"
systemctl enable httpd
systemctl start httpd
