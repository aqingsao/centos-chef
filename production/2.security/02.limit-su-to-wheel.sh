# check user iler's group: 
groups <user>

# add uesr iler to group wheel: 
usermod -a -G wheel <user>

# only users in wheel group could use su, uncomment the following line in /etc/pam.d/su
auth          required        pam_wheel.so use_uid

