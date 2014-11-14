#!/bin/bash

hostname
read -p "update host name, update it to xxx if it is xxx.hichina.com, go to /etc/sysconfig/network:"

read -p "Add centos 5 centalt repository, and EPEL and REMI repo before YUM update"
read -p "cp yum.repos.d/centalt.repo /etc/yum.repos.d/"
wget http://dl.fedoraproject.org/pub/epel/5/x86_64/epel-release-5-4.noarch.rpm
wget http://rpms.famillecollet.com/enterprise/remi-release-5.rpm
sudo rpm -Uvh remi-release-5*.rpm epel-release-5*.rpm

# yum cache clean
sudo yum clean all

# yum update
sudo yum update

# update openssh for security
sudo yum update openssh

# update anti-virus
sudo yum update clamav
sudo yum install clamd
sudo freshclam

# prepare
sudo yum install zlib-devel wget openssl-devel libyaml-devel pcre pcre-devel make gcc gcc-c++ curl-devel mysql-devel sqlite-devel

# Since Rails needs a JavaScript interpreter, we will also need to set up Node.js.
sudo yum install -y nodejs