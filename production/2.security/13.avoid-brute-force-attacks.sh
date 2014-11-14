
# If you are unable to limit source IP addresses, and must open the ssh port globally, then iptables can still help prevent brute-force attacks by logging and blocking repeated attempts to login from the same IP address. For example,
# records the IP address of each new attempt to access port 22 using the recent module
iptables -A INPUT -p tcp --dport <port> -m state --state NEW -m recent --set --name ssh --rsource
# checks to see if that IP address has attempted to connect 4 or more times within the last 60 seconds
iptables -A INPUT -p tcp --dport <port> -m state --state NEW -m recent ! --rcheck --seconds 60 --hitcount 4 --name ssh --rsource -j ACCEPT
