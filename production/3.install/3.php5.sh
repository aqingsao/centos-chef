#!/bin/bash

# install php5

yum groupinstall "Development tools"

yum install libxml2-devel gd-devel libmcrypt-devel libcurl-devel openssl-devel

wget http://cn2.php.net/get/php-5.4.36.tar.gz/from/this/mirror
tar -xvf php-5.4.36.tar.gz
cd php-5.4.36

./configure --with-apxs2=/usr/local/apache2/bin/apxs --disable-cli --enable-shared --with-libxml-dir --with-gd --with-openssl --enable-mbstring --with-mcrypt --with-mysqli --with-mysql --enable-opcache --enable-mysqlnd --enable-zip --with-zlib-dir --with-pdo-mysql --with-jpeg-dir --with-freetype-dir --with-curl --without-pdo-sqlite --without-sqlite3

make
make install
cp php.ini-production /usr/local/lib/php.ini
#记住上面 php.ini 的位置