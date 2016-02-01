# 方法1： https://influxdata.com/downloads/
root@watcher ~ $ wget https://s3.amazonaws.com/influxdb/influxdb-0.9.6.1-1.x86_64.rpm
root@watcher ~ $ sudo yum localinstall influxdb-0.9.6.1-1.x86_64.rpm

# 方法2： https://docs.influxdata.com/influxdb/v0.9/introduction/installation/
cat <<EOF | sudo tee /etc/yum.repos.d/influxdb.repo
[influxdb]
name = InfluxDB Repository - RHEL \$releasever
baseurl = https://repos.influxdata.com/rhel/\$releasever/\$basearch/stable
enabled = 1
gpgcheck = 1
gpgkey = https://repos.influxdata.com/influxdb.key
EOF
sudo yum install influxdb
sudo service influxdb start

# 3. 配置influxdb
vim /etc/influxdb/influxdb.conf
[collectd]
  enabled = true
  bind-address = ":25826"
  database = "collectd"
  retention-policy = ""
  batch-size = 5000
  batch-timeout = "10s"
  typesdb = "/usr/share/collectd/types.db"

# 4. enable and start influxdb
root@watcher ~ $ chkconfig influxdb on
root@watcher ~ $ service influxdb start
