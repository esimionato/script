#!/bin/bash

clear

echo '------installing apache2------'
sudo apt-get install -y apache2

echo '------installing php5------'
sudo apt-get install -y php5
sudo apt-get install -y php5-cli
sudo apt-get install -y php-apc
sudo apt-get install -y php5-intl

echo '------installing phpunit------'
sudo apt-get install y phpunit

echo '------installing databases------'
sudo apt-get install -y postgresql
sudo apt-get install -y php5-pgsql
sudo apt-get install -y libapache2-mod-php5
sudo apt-get install -y php5-sqlite

echo '------installing debug tool------'
sudo apt-get install -y php5-xdebug

echo '------installing css tidy------'
sudo apt-get install -y tidy
sudo apt-get install -y csstidy
sudo apt-get install -y yui-compressor
sudo apt-get install -y subversion
sudo apt-get install -y git-core

echo '------installing tree------'
sudo apt-get install -y tree

echo '------installing text editors------'
# Gedit Plugins
# PPA source repository:
#sudo apt-add-repository ppa:ubuntu-on-rails/ppa
#sudo apt-get update
# installation package :
#sudo apt-get install -y gedit-gmate
#sudo apt-get install -y gedit-plugins

sudo apt-get install -y vim

echo '------updating php5 configuration------'
sudo a2enmod php5
sudo a2enmod rewrite
sudo apache2ctl graceful

echo '------installing firefox extension------'
sudo apt-get install -y firebug
sudo apt-get install -y firefox-webdeveloper

clear
clear

echo '------show realease------'
lsb_release -a
