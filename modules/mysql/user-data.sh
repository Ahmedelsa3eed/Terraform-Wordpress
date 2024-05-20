#!/bin/bash

apt update
systemctl start mysql.service
systemctl enable mysql.service


# apt update
# DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server
# systemctl start mysql
# systemctl enable mysql
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH 'mysql_native_password' BY 'password';"
# mysql -e "FLUSH PRIVILEGES;"