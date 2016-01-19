# https://banck.net/2014/09/compile-python-3-4-on-centos-7/
# 1. First we need to install the Development tools and some required sources: e.g. bzip, to support compression in python
yum groupinstall "Development tools"
yum install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel

# 2. Next we are downloading and compiling Python 3 as shared library. Compiling Python as shared library is afaik quite common and necessary for third-party tools such as mod_wsgi.
# 检查是否安装了python
python -V
python3 -V #Python 3.5.0

# 安装python3, 注：最新版本已经是3.5.0
wget https://www.python.org/ftp/python/3.5.0/Python-3.5.0.tgz
tar xf Python-3.5.0.tgz
cd Python-3.5.0
./configure --prefix=/usr/local --enable-shared
make
make install

# Before we can use Python we need to make the library findable:
echo /usr/local/lib >> /etc/ld.so.conf.d/local.conf
ldconfig

# 4. Finally you should be able to launch python:
python3 --version

# 5. If you want to remove all the packages we required to compile python, including its dependencies, use the parameter “–remove-leaves” which I also described here.
yum groupremove "Development tools" --remove-leaves
yum remove zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel --remove-leaves

#6. 安装pip，一个python的包管理工具
sudo yum install python-pip

#7. 安装django
sudo pip install Django==1.9