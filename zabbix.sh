#!/bin/bash

# Download and install the Zabbix release package
wget https://repo.zabbix.com/zabbix/6.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.4-1+ubuntu20.04_all.deb
sudo dpkg -i zabbix-release_6.4-1+ubuntu20.04_all.deb

# Update package list
sudo apt-get update

# Install Zabbix server, frontend, agent, and dependencies silently
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install zabbix-server-mysql zabbix-frontend-php zabbix-apache-conf zabbix-sql-scripts zabbix-agent &> /dev/null

# Create initial database
echo "create database zabbix character set utf8mb4 collate utf8mb4_bin;" | sudo mysql
echo "create user zabbix@localhost identified by 'password';" | sudo mysql
echo "grant all privileges on zabbix.* to zabbix@localhost;" | sudo mysql
echo "set global log_bin_trust_function_creators = 1;" | sudo mysql

# Import initial schema and data
zcat /usr/share/zabbix-sql-scripts/mysql/create.sql.gz | sudo mysql -uzabbix -ppassword zabbix

# Disable log_bin_trust_function_creators option
echo "set global log_bin_trust_function_creators = 0;" | sudo mysql

# Configure database for Zabbix server
sudo sed -i 's/# DBPassword=/DBPassword=password/g' /etc/zabbix/zabbix_server.conf

# Start Zabbix server and agent processes
sudo systemctl restart zabbix-server zabbix-agent apache2
sudo systemctl enable zabbix-server zabbix-agent apache2
