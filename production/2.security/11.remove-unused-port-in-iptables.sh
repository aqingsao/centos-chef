# find out unused open INPUT port(443, 8080, 25, etc)
sudo iptables -L -n --line-numbers

# find out line number of port , and delete it
sudo iptables -D INPUT %line_number%
