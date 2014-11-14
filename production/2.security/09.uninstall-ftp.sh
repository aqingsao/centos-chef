sudo yum remove vsftpd

# list all acceptable INPUT port
sudo iptables -L -n --line-numbers

# find out line number of port 21, and delete it
sudo iptables -D INPUT %line_number%

sudo service iptables save
