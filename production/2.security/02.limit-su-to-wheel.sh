# add <user> to group wheel: 
groups <user>
usermod -a -G wheel <user>
# only users in wheel group could use su
vi /etc/pam.d/su
auth          required        pam_wheel.so use_uid #uncomment this line