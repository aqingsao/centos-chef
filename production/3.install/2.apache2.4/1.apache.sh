#!/bin/bash

# install apache2.4

yum groupinstall "Development tools"

yum install zlib-devel pcre-devel

wget http://apache.stu.edu.tw//httpd/httpd-2.4.10.tar.gz
wget http://apache.stu.edu.tw//apr/apr-1.5.1.tar.gz
wget http://apache.stu.edu.tw//apr/apr-util-1.5.4.tar.gz

tar -xvf httpd-2.4.6.tar.gz
tar -xvf apr-1.5.1.tar.gz
tar -xvf apr-util-1.5.4.tar.gz

mv apr-1.5.1 httpd-2.4.10/srclib/apr
mv apr-util-1.5.4 httpd-2.4.10/srclib/apr-util
cd httpd-2.4.10
#编译命令
./configure --with-included-apr --enable-nonportable-atomics=yes --with-z

#make install
make
make install
#所有配置弄好后，就可以删除服务器上以前的 apache 了
service httpd stop
yum remove httpd
#新编译安装的 Apache 2.4.6 拷贝到位
cp /usr/local/apache2/bin/apachectl /etc/init.d/httpd

#将Apache加入开机自动启动
chkconfig --add httpd
chkconfig httpd on

#最后一步，启动编译好的 Apache 2.4.10
service httpd start