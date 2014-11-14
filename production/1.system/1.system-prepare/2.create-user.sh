useradd <user>
passwd <user>

chmod u+w /etc/sudoers

# add folowing after 'root ALL=(ALL) ALL' in /etc/sudoers
<user> ALL=(ALL) ALL

chmod u-w /etc/sudoers