# https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-centos-7

1. Install rbenv
sudo yum install -y git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel
cd
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
exec $SHELL

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile
exec $SHELL

source ~/.bash_profile

2. Install ruby-build
# install it with these commands:
rbenv install -v 2.2.1
rbenv global 2.2.1

# Verify that Ruby was installed properly with this command:
ruby -v

# Do not want Rubygems to generate local documentation for each gem, as this process can be lengthy. To disable this:
echo "gem: --no-document" > ~/.gemrc

# install the bundler gem, to manage your application dependencies:
gem install bundler

3. use taobao ruby gem server
gem sources  # list gem sources
gem sources remove https://rubygems.org/
gem sources -a https://ruby.taobao.org/

4. Install how-to-install-ruby-on-rails-with-rbenv-on-centos-7

gem install rails -v 4.2.0
# Whenever you install a new version of Ruby or a gem that provides commands, you should run the rehash sub-command. This will install shims for all Ruby executables known to rbenv, which will allow you to use the executables:
rbenv rehash
# Verify that Rails has been installed properly by printing its version, with this command:
rails -v