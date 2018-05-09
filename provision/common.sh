#!/bin/bash

set -eu

echo "installing basic tools"
yum -y install net-tools
yum -y install wget
yum -y install curl

echo "disabling selinux"
cp -p /etc/selinux/config /etc/selinux/config.orig
sed -i -e "s|^SELINUX=.*|SELINUX=disabled|" /etc/selinux/config
setenforce 0

echo "setting timezone and locales"
timedatectl set-timezone Europe/Ljubljana
yum -y reinstall glibc-common
localectl set-locale LANG=sl_SI.UTF-8
