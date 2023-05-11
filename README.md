# Zabbix

Zabbix Silent Installation Script
This script automates the installation of Zabbix server, frontend, and agent on Ubuntu. It also creates an initial database, configures the database for the Zabbix server, and starts the Zabbix server and agent processes.

Prerequisites
Ubuntu operating system
Internet connectivity to download packages during installation
MySQL or MariaDB installed and running on the same host as the Zabbix server
Usage
Download the latest version of the Zabbix release package from the official website: https://www.zabbix.com/download
Extract the contents of the downloaded archive and locate the name of the release package for your Ubuntu version.
Copy the install_zabbix.sh script to your Ubuntu machine, along with the Zabbix release package.
Modify the script with the appropriate filename for the Zabbix release package you downloaded in step 2.
Make the script executable: chmod +x install_zabbix.sh
Run the script with sudo privileges: sudo ./install_zabbix.sh
Note
This script is provided as-is and should be used at your own risk.
The script assumes that you have mysql-client or mariadb-client installed for running mysql commands. If not, please install either one of them before running the script.
The script has been tested on Ubuntu 20.04 LTS and Zabbix 5.4.
If you encounter any issues or have any questions, please consult the official Zabbix documentation or seek assistance from the Zabbix community.
