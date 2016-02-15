
sudo yum install mariadb-server mariadb

sudo systemctl start mariadb

# create database
mysql -u root -p
## CREATE DATABASE ##
mysql> CREATE DATABASE how2read;
## CREATE USER ##
mysql> CREATE USER 'reader'@'127.0.0.1' IDENTIFIED BY 'Aq1ngSa00DB';
## GRANT PERMISSIONS ##
mysql> GRANT ALL ON ilegong.* TO 'iler'@'iop_address';
##  FLUSH PRIVILEGES, Tell the server TO reload the GRANT TABLES  ##
mysql> FLUSH PRIVILEGES;


# 禁用ROOT login
sudo mysql_secure_installation
sudo systemctl enable mariadb.service
