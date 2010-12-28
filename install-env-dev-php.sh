#!/bin/bash

clear

echo '------installing apache2------'
sudo apt-get install -y apache2

echo '------installing php5------'
sudo apt-get install -y php5
sudo apt-get install -y php5-dev
sudo apt-get install -y php5-cli
sudo apt-get install -y php-apc

echo '------installing postgresql------'
sudo apt-get install -y postgresql
sudo apt-get install -y php5-pgsql
sudo apt-get install -y libapache2-mod-php5

echo '------installing css tidy------'
sudo apt-get install -y tidy
#tidy -utf8 -i -c -b -q -w 0 -asxhtml filename.html
sudo apt-get install -y csstidy
#csstidy main.css --lowercase_s=true --sort_properties=true --template=highest main.min.css
sudo apt-get install -y yui-compressor
#yui-compressor --type css main.css -o main.min.css
#yui-compressor --type js script.js -o script.min.js
sudo apt-get install -y firebug

#echo '------installing git------'
#sudo apt-get install -y git-core

echo '------installing svn------'
sudo apt-get install -y subversion

echo '------installing tree------'
sudo apt-get install -y tree

echo '------installing gedit------'
# Gedit Plugins
# PPA source repository:
sudo apt-add-repository ppa:ubuntu-on-rails/ppa
sudo apt-get update
# installation package :
sudo apt-get install -y gedit-gmate
sudo apt-get install -y gedit-plugins

echo '------updating php5 configuration------'
sudo a2enmod php5
sudo a2enmod rewrite
#sudo chown cedricus:cedricus -R /var/www

clear
clear

echo '------show realease------'
lsb_release -a
