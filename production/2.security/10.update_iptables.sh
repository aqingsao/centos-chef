# 基本用法
# 列出所有规则
sudo iptables -L -n --line-numbers
# 删除一个规则
sudo iptables -D INPUT %line_number%
# 查看打开的端口
netstat -tuplen
ss -tuplen

# 0. CentOS 7使用了firewallD
# 方法1：仍然使用iptables及iptables-service
systemctl stop firewalld #停止firewalld服务
systemctl mask firewalld #禁止firewalld服务自动或手工起来
sudo yum install -y iptables-services  #安装iptables.service服务
sudo systemctl enable iptables.service # 启用iptables.service服务
sudo /usr/libexec/iptables/iptables.init save # 保存规则
# 方法2：Centos 7上，仍然使用firewallD


# 1. ssh 9527
iptables -A INPUT -i eth0 -p tcp --dport 9527 -m state --state NEW,ESTABLISHED -j ACCEPT
# [optional] iptables -A OUTPUT -o eth0 -p tcp --sport 9527 -m state --state ESTABLISHED -j ACCEPT
# 2. http 80
iptables -A INPUT -i eth0 -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT 
# [optional] iptables -A OUTPUT -o eth0 -p tcp --sport 80 -m state --state ESTABLISHED -j ACCEPT
# 3.1 限制MYSQL 3006端口的访问, 只能指定IP访问
iptables -A INPUT -i eth0 -p tcp -s 192.168.100.0/24 --dport 3306 -m state --state NEW,ESTABLISHED -j ACCEPT
# 3.2 或者MySQL 3306端口只能localhost访问
iptables -A INPUT -p tcp --dport 3306 -s 127.0.0.1 -d 127.0.0.1 -j ACCEPT
# 3.3 MySQL另外一个方法使修改my.cnf，添加下面一行：
skip-networking
# 4. 防止SSH的暴力破解
# records the IP address of each new attempt to access port 22 using the recent module
iptables -A INPUT -p tcp --dport 9527 -m state --state NEW -m recent --set --name ssh --rsource
# 5. checks to see if that IP address has attempted to connect 4 or more times within the last 60 seconds
iptables -A INPUT -p tcp --dport 9527 -m state --state NEW -m recent ! --rcheck --seconds 60 --hitcount 4 --name ssh --rsource -j ACCEPT
# 6. 防止DDOS
iptables -A INPUT -p tcp --dport 80 -m limit --limit 25/minute --limit-burst 100 -j ACCEPT
# - -m limit: This uses the limit iptables extension
# - –limit 25/minute: This limits only maximum of 25 connection per minute. Change this value based on your specific requirement
# - –limit-burst 100: This value indicates that the limit/minute will be enforced only after the total number of connection have reached the limit-burst level.

# CentOS 7是安全增强的(SELinux)，需要告诉它在新端口4444运行SSH是允许的，这需要用到“semanage”.
sudo yum install policycoreutils-python
# On CentOS 6 and above you should also update selinux, labeling the chosen port correctly, otherwise sshd will be prevented from accessing it. For example:
sudo semanage port -a -t ssh_port_t -p tcp <port>


# 尝试SSH是否成功
ssh -p <port> myserver

