#!/bin/bash

# Start the mysql service
service mysql start

# Insert data
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}'; FLUSH PRIVILEGES;" && \
mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_WP_DATABASE}; GRANT ALL PRIVILEGES ON ${MYSQL_WP_DATABASE}.* TO '${MYSQL_WP_USER}'@'%' IDENTIFIED BY '${MYSQL_WP_PASSWORD}'; FLUSH PRIVILEGES;"

# Stop the mysql service
sleep 1
service mysql stop

exec "$@"
