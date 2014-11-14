# SSH logins can be limited to only certain users who need remote access. If you have many user accounts on the system then it makes sense to limit remote access to only those that really need it thus limiting the impact of a casual user having a weak password. 
# Add an AllowUsers line followed by a space separated list of usernames to /etc/ssh/sshd_config For example:

 # limit remote access to only those that really need it
AllowUsers <user>

service sshd restart