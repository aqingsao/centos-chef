# Using encrypted keys for authentication offers two main benefits. Firstly, it is convenient as you no longer need to enter a password (unless you encrypt your keys with password protection) if you use public/private keys. Secondly, once public/private key pair authentication has been set up on the server, you can disable password authentication completely meaning that without an authorized key you can't gain access - so no more password cracking attempts.

# 1. create a public/private key pair on the client that you will use to connect to the server (you will need to do this from each client machine from which you connect):
$ ssh-keygen -t rsa

# 2. set permissions on your private key:
$ chmod 700 ~/.ssh
$ chmod 600 ~/.ssh/id_rsa 

# 3. Copy the public key (id_rsa.pub) to the server and install it to the authorized_keys list:
$ cat id_rsa.pub >> ~/.ssh/authorized_keys

# 4. once you've imported the public key, you can delete it from the server.

# 5. set file permissions on the server:
$ chmod 700 ~/.ssh
$ chmod 600 ~/.ssh/authorized_keys 

# 6. Ensure the correct SELinux contexts are set:
$ restorecon -Rv ~/.ssh 

# 7. Once you've checked you can successfully login to the server using your public/private key pair, you can disable password authentication completely by adding the following setting to your /etc/ssh/sshd_config file:
PasswordAuthentication no