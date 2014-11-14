#!/bin/bash

# install mysql server and client
# http://www.if-not-true-then-false.com/2010/install-mysql-on-fedora-centos-red-hat-rhel/
sudo -i
rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
yum --enablerepo=remi,remi-test list mysql-devel mysql mysql-server
yum --enablerepo=remi,remi-test install mysql-devel mysql mysql-server
mysql -V  # mysql version should above 5.5
# 5. Start MySQL server and autostart MySQL on boot
sudo service mysqld start
chkconfig --levels 235 mysqld on
/usr/bin/mysql_secure_installation
read -p "If mysql could not find default mysql.sock when secure install, create a soft link:"
# sample my.cnf in /usr/share/mysql, for small, medium, large, huge systems
read -p "update /etc/my.cnf as described in mysql/my.cnf, enter to continue when you finish:"
# if you encounter problem 'ib_logfile0 is of different size' after update my.cnf, help: http://serverfault.com/questions/104014/innodb-error-log-file-ib-logfile0-is-of-different-size
read -p "restart: sudo service mysqld restart"

read -p "Create user kao: http://dev.mysql.com/doc/refman/5.5/en//user-account-management.html"

# how to upgrade: http://kwatog.com/blog/how-to-upgrade-mysql-5-0-to-5-5-in-centos/
# do not forget to remove old mysql first: yum remove mysql mysql-*

# create database
mysql -u root -p
## CREATE DATABASE ##
mysql> CREATE DATABASE ilegong;
## CREATE USER ##
mysql> CREATE USER 'iler'@'ip_address' IDENTIFIED BY '******';
## GRANT PERMISSIONS ##
mysql> GRANT ALL ON ilegong.* TO 'iler'@'iop_address';
##  FLUSH PRIVILEGES, Tell the server TO reload the GRANT TABLES  ##
mysql> FLUSH PRIVILEGES;

