#!/bin/bash

# Update apt so we can search apt-cache for newest tomcat version supported
apt update

# Install features
apt -y install ca-certificates supervisor

# Install nodeJS
wget -O - https://deb.nodesource.com/setup_8.x | bash -
apt -y install nodejs

# If apt fails to run completely the rest of this isn't going to work...
if [ $? -ne 0 ]; then
    echo "apt failed to install all required dependencies"
    exit
fi

# Download Guacamole Tunnel
wget -O /root/guacamole-master.tar.gz https://github.com/realholgi/guacamole/archive/master.tar.gz
if [ $? -ne 0 ]; then
    echo "Failed to download guacamole-tunnel.tar.gz"
    exit
fi

# Extract Guacamole Tunnel files
cd /root
tar -xzf guacamole-master.tar.gz
cd guacamole-master
npm install

# Create guac-tunnel supervisor config
echo "[program:node]" > /etc/supervisor/conf.d/guac-tunnel.conf
echo "command=/usr/bin/node /root/guacamole-master/guac-tunnel.js &" >> /etc/supervisor/conf.d/guac-tunnel.conf

# Ensure guac-tunnel is started
service supervisor restart

