# http://ohroot.com/2014/11/03/CentOS-6-5-%E5%AE%89%E8%A3%85%E9%85%8D%E7%BD%AELNMP%E6%9C%8D%E5%8A%A1%E5%99%A8-Nginx-PHP-MySQL/

sudo yum install php
sudo yum install php-fpm
sudo yum install php-mysql
sudo yum install php-gd


# 2. 置nginx支持php
cp /etc/nginx/nginx.conf /etc/nginx/nginx.confbak  #备份原有配置文件
vi /etc/nginx/nginx.conf  #编辑
user nginx nginx; #修改nginx运行账号为：nginx组的nginx用户
cp /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.confbak #备份原有配置文件
vi /etc/nginx/conf.d/default.conf #编辑
index index.php index.html index.htm; #增加index.php
# pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
location ~ \.php$ {
  root html;
  fastcgi_pass 127.0.0.1:9000;
  fastcgi_index index.php;
  fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
  include fastcgi_params;
}

# 3. php配置
vi /etc/php.ini #编辑

date.timezone = Asia/Shanghai #把前面的分号去掉，改为date.timezone = PRC

disable_functions = passthru,exec,system,chroot,scandir,chgrp,chown,shell_exec,proc_open,proc_get_status,ini_alter,ini_alter,ini_restore,dl,openlog,syslog,readlink,symlink,popepassthru,stream_socket_server,escapeshellcmd,dll,popen,disk_free_space,checkdnsrr,checkdnsrr,getservbyname,getservbyport,disk_total_space,posix_ctermid,posix_get_last_error,posix_getcwd,posix_getegid,posix_geteuid,posix_getgid,posix_getgrgid,posix_getgrnam,posix_getgroups,posix_getlogin,posix_getpgid,posix_getpgrp,posix_getpid,posix_getppid,posix_getpwnam,posix_getpwuid, posix_getrlimit, posix_getsid,posix_getuid,posix_isatty,posix_kill,posix_mkfifo,posix_setegid,posix_seteuid,posix_setgid,posix_setpgid,posix_setsid,posix_setuid,posix_strerror,posix_times,posix_ttyname,posix_uname
#在386行 列出PHP可以禁用的函数，如果某些程序需要用到这个函数，可以删除，取消禁用。

expose_php = Off #禁止显示php版本的信息

short_open_tag = ON #支持php短标签

open_basedir = 网站根目录:/tmp/
#设置表示允许访问当前目录(即PHP脚本文件所在之目录)和/tmp/目录;冒号为分隔符。

# 4. 配置php-fpm
cp /etc/php-fpm.d/www.conf /etc/php-fpm.d/www.confbak #备份原有配置文件
vi /etc/php-fpm.d/www.conf  #编辑
user = nginx #修改用户为nginx
group = nginx #修改组为nginx

