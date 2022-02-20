#!/bin/bash

sudo sh -c 'echo "[mysqld]
sql_mode = 'NO_ENGINE_SUBSTITUTION'
max_connections = 1000
max_allowed_packet = 1048576000
group_concat_max_len = 2048
log-error = /var/log/mysql/error.log" > /etc/mysql/my.cnf/app/onlyoffice/mysql/conf.d/onlyoffice.cnf'

sudo sh -c 'echo "CREATE USER 'onlyoffice_user'@'localhost' IDENTIFIED BY 'onlyoffice_pass';
CREATE USER 'mail_admin'@'localhost' IDENTIFIED BY 'Isadmin123';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'my-secret-pw';
GRANT ALL PRIVILEGES ON *.* TO 'onlyoffice_user'@'%' IDENTIFIED BY 'onlyoffice_pass';
GRANT ALL PRIVILEGES ON *.* TO 'mail_admin'@'%' IDENTIFIED BY 'Isadmin123';
FLUSH PRIVILEGES;" > /app/onlyoffice/mysql/initdb/setup.sql'