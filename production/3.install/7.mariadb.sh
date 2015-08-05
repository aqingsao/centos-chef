
sudo yum install mariadb-server mariadb

sudo systemctl start mariadb

sudo mysql_secure_installation
sudo systemctl enable mariadb.service