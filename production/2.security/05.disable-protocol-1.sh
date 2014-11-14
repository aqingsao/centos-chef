4. Disable Protocol 1
# SSH has two protocols it may use, protocol 1 and protocol 2. The older protocol 1 is less secure and should be disabled unless you know that you specifically require it. 
# Look for the following line in the /etc/ssh/sshd_config file, uncomment it and amend as shown:

# Protocol 2,1
Protocol 2

service sshd restart