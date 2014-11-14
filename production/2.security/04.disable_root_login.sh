# http://wiki.centos.org/HowTos/Network/SecuringSSH

# SSH server settings are stored in the /etc/ssh/sshd_config file. To disable root logins, make sure you have the following entry:
# Prevent root logins:
PermitRootLogin no

service sshd restart
