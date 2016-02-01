# http://www.itzgeek.com/how-tos/linux/centos-how-tos/monitor-and-manage-services-with-monit-on-centos-7-rhel-7.html#axzz3hu1BH8zA

sudo yum install monit -y

# 设置开机自动启动
sudo systemctl enable  monit.service

# 修改配置文件
sudo vi /etc/monitrc
# change from 
set httpd port 2812 and
use address localhost  # only accept connection from localhost
allow localhost        # allow localhost to connect to the server and
allow admin:monit      # require user 'admin' with password 'monit'
allow @monit           # allow users of group 'monit' to connect (rw)
allow @users readonly  # allow users of group 'users' to connect readonly
# to 
set httpd port 2812
allow 0.0.0.0/0.0.0.0
allow admin:monit

# 添加监控项目
## check tomcat
    check process tomcat with pidfile /var/run/tomcat.pid
    start program = "/usr/bin/systemctl start tomcat"
    stop program = "/usr/bin/systemctl stop tomcat"
## check mariadb
    check process mariadb with pidfile /var/run/mariadb/mariadb.pid
    start program = "/usr/bin/systemctl start mariadb"
    stop program = "/usr/bin/systemctl stop mariadb"
## check nginx
    check process nginx with pidfile /var/run/nginx.pid
    start program = "/usr/bin/systemctl start nginx"
    stop program = "/usr/bin/systemctl stop nginx"

# 检查设置的配置文件是否正确
sudo monit -t

# 重启服务
sudo systemctl restart monit.service
