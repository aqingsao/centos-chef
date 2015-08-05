#!/bin/bash

# 1. 设置hostname
# 查看
hostname
# 或者：
hostnamectl status
# 设置
hostnamectl set-hostname www.***.**

read -p "update host name, update it to xxx if it is xxx.hichina.com, go to /etc/sysconfig/network:"


# 2. http://tecadmin.net/top-5-yum-repositories-for-centos-rhel-systems/
# 2.1 Adding RPMForge Repository
sudo rpm -Uvh http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm

# 2.2 Adding EPEL Repository
sudo rpm -Uvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm

# 2.3 Adding REMI Repository
sudo rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

# 2.4 Adding ATrpms Repository
sudo rpm -Uvh http://dl.atrpms.net/all/atrpms-repo-7-7.el7.x86_64.rpm

# 2.5 Adding Webtatic Repository
sudo rpm -Uvh http://repo.webtatic.com/yum/el7/webtatic-release.rpm

# 3. yum cache clean
sudo yum clean all
# yum update
sudo yum update
# update openssh for security
sudo yum update openssh

# 4. update anti-virus
sudo yum update clamav
# install from EPEL
sudo yum --enablerepo=epel -y install clamav clamav-update
# update pattern files
sudo freshclam

# 5. prepare
sudo yum install zlib-devel wget openssl-devel libyaml-devel pcre pcre-devel make gcc gcc-c++ curl-devel mysql-devel sqlite-devel

# Since Rails needs a JavaScript interpreter, we will also need to set up Node.js.
sudo yum install -y nodejs