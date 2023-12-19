#!/bin/bash

# update
echo "updating ..."
sudo apt update -y
echo "done"
echo ""

# upgrade
echo "upgrading..."
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
echo "done"
echo ""

# install maven
echo "installing maven..."
sudo DEBIAN_FRONTEND=noninteractive apt install maven -y
echo "done"
echo ""

# check maven
echo "checking maven..."
mvn -version
echo "done"
echo ""

# install JDK java 17
echo "installing java 17..."
sudo DEBIAN_FRONTEND=noninteractive apt install openjdk-17-jdk -y
echo "done"
echo ""

# check JDK 17
echo "checking java 17..."
java -version
javac -version
echo "done"
echo ""

# install git
echo "installing git..."
sudo DEBIAN_FRONTEND=noninteractive apt install git -y
echo "done"
echo ""

# check git
echo "checking git..."
git --version
echo "done"
echo ""

# installing Apache
echo "installing apache2..."
sudo DEBIAN_FRONTEND=noninteractive apt install apache2 -y
echo "done"
echo ""

# git clone repo
echo "cloning repo..."
cd ~
git clone https://github.com/Piasttorun/tech242-jsonvoorhees-app repo
echo "done"
echo ""

# run
echo "running..."
cd ~/repo/springapi/
mvn spring-boot:start
echo "done"
echo ""

# Enable necessary Apache modules
sudo a2enmod proxy
sudo a2enmod proxy_http

if grep -q 'ProxyPreserveHost On' /etc/apache2/sites-available/000-default.conf; then
    echo "Reverse proxy already configured."
else
    sudo sed -i '/DocumentRoot \/var\/www\/html/ a\ProxyPreserveHost On\nProxyPass \/ http:\/\/localhost:5000\/\nProxyPassReverse \/ http:\/\/localhost:5000\/\n' /etc/apache2/sites-available/000-default.conf
fi

# Enable the virtual host
sudo a2ensite reverse-proxy

# Reload Apache to apply changes
sudo systemctl reload apache2
echo "done"
echo ""