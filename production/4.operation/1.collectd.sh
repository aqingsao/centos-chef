# http://operationbolo.com/influxdb-with-grafana-on-centos-7/
# 1. install and configure collectd
root@watcher ~ $ yum install epel-release
root@watcher ~ $ yum install collectd

# 2. config
root@watcher ~ $ vi /etc/collectd.conf
LoadPlugin network
<Plugin network>
  Server "127.0.0.1" "25826"
</Plugin>

# 3. enable and start collectd
root@watcher ~ $ systemctl start collectd
root@watcher ~ $ systemctl enable collectd

# 4. create database for collectd
root@watcher ~ $ curl -G 'http://localhost:8086/query' --data-urlencode "q=CREATE DATABASE collectd"
root@watcher ~ $ curl -G 'http://localhost:8086/query?pretty=true' --data-urlencode "q=SHOW DATABASES"

# 5. 
sudo yum install collectd-nginx
