# https://www.digitalocean.com/community/tutorials/how-to-automate-ruby-on-rails-application-deployments-using-capistrano
# If you has less than 1 GB of RAM, prepare a SWAP disk space to be used as a temporary data holder (RAM substitute). Since DigitalOcean servers come with fast SSD disks, this does not really constitute an issue whilst performing the server application installation tasks.
# Create a 1024 MB SWAP space
sudo dd if=/dev/zero of=/swap bs=1M count=1024
sudo mkswap /swap
sudo swapon /swap