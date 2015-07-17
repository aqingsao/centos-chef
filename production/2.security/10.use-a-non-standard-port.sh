# By default, ssh listens for incoming connections on port 22. For a hacker to determine ssh is running on your machine, he'll most likely scan port 22 to determine this. An effective method is to run ssh on a non-standard port. Any unused port will do, although one above 1024 is preferable. Many people choose 2222 as an alternative port (as it's easy to remember), just as 8080 is often known as the alternative HTTP port. For this very reason, it's probably not the best choice, as any hacker scanning port 22 will likely also be scanning port 2222 just for good measure. It's better to pick some random high port that's not used for any known services. 
# To make the change, add a line like this to your /etc/ssh/sshd_config file:

# Run ssh on a non-standard port:
Port <port>

# Don't forget to then make any necessary changes to port forwarding in your router and any applicable firewall rules.
iptables -I INPUT -p tcp --dport <port> -j ACCEPT

## if centos < 7
service iptables save
service iptables restart
## if centor >= 7
service iptables save
systemctl restart iptables
###
### systemctl stop firewalld
### systemctl mask firewalld
### yum install iptables-services
### systemctl enable iptables
###

# restart the sshd service. 
service sshd restart

# install semanage
yum install policycoreutils-python
# On CentOS 6 and above you should also update selinux, labeling the chosen port correctly, otherwise sshd will be prevented from accessing it. For example:
semanage port -a -t ssh_port_t -p tcp <port>

# use following command to see which port is ready
netstat -tuplen
# 尝试是否成功
ssh -p <port> myserver