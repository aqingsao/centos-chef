# http://wiki.centos.org/HowTos/Network/SecuringSSH
# SSH logins can be limited to only certain users who need remote access

vi /etc/ssh/sshd_config

AllowUsers <user> # add this line to permit <user> from remote login

PermitRootLogin no # change YES to no to disable ROOT from remote login

Protocol 2 # Disable old protocol 1 which is less secure

service sshd restart