#!/bin/bash

clear

sudo apt-get update -y

echo '------installing apache2------'
sudo apt-get install -y apache2

echo '------installing php5------'
sudo apt-get install -y php5
sudo apt-get install -y php5-cli
sudo apt-get install -y php-apc
sudo apt-get install -y php5-intl

echo '------installing debug tool------'
sudo apt-get install -y php5-xdebug
sudo apt-get install -y tidy
sudo apt-get install -y csstidy
sudo apt-get install -y yui-compressor
sudo apt-get install -y php-pear
sudo apt-get install -y tree
sudo apt-get install -y vim

echo '------updating php5 configuration------'
sudo a2enmod php5
sudo a2enmod rewrite
sudo apache2ctl graceful

echo '------installing versioning tools------'
sudo apt-get install -y git-core
sudo apt-get install -y subversion

echo '------installing firefox extension------'
sudo apt-get install -y firebug
sudo apt-get install -y firefox-webdeveloper

# Mise à jour des extensions PEAR déjà installées
sudo pear upgrade-all
sudo pear config-set auto_discover 1
 
# Installation de quelques extensions supplémentaires (pas forcément toujours utilisées, mais suffisament "souvent" pour que je les installe "par défaut")
sudo pear config-set preferred_state beta
sudo pear install --alldeps PHP_CodeSniffer PhpDocumentor php_CompatInfo Log Text_Diff HTML_QuickForm2 Image_GraphViz MDB2 Mail_Mime PHP_Beautifier-beta SOAP XML_Beautifier XML_RPC Structures_Graph components.ez.no/Graph VersionControl_SVN-alpha Horde_Text_Diff XML_RPC2 VersionControl_Git-alpha
 
# PHPUnit
sudo pear channel-discover pear.phpunit.de
sudo pear install --alldeps phpunit/PHPUnit
 
# Autres outils "QA"
sudo pear channel-discover pear.pdepend.org
sudo pear channel-discover pear.phpmd.org
sudo pear install pdepend/PHP_Depend
sudo pear install phpmd/PHP_PMD
sudo pear install phpunit/phpcpd
sudo pear install phpunit/File_Iterator
sudo pear install phpunit/phploc
sudo pear install --alldeps phpunit/PHP_CodeBrowser
 
# DocBlox (en alternative plus récente (et compatible PHP 5.3) à PhpDocumentor)
sudo pear channel-discover pear.docblox-project.org
sudo pear install --alldeps docblox/DocBlox

# Phing
sudo pear channel-discover pear.phing.info
sudo pear install --alldeps phing/phing

wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update -y
sudo apt-get install -y jenkins

wget http://localhost:8080/jnlpJars/jenkins-cli.jar

java -jar jenkins-cli.jar -s http://jenkins:8080/ install-plugin greenballs
java -jar jenkins-cli.jar -s http://jenkins:8080/ install-plugin htmlpublisher
#java -jar jenkins-cli.jar -s http://jenkins:8080/ install-plugin publish-over-ssh
#java -jar jenkins-cli.jar -s http://jenkins:8080/ install-plugin audit-trail
#java -jar jenkins-cli.jar -s http://jenkins:8080/ install-plugin email-ext
#java -jar jenkins-cli.jar -s http://jenkins:8080/ install-plugin instant-messaging
#java -jar jenkins-cli.jar -s http://jenkins:8080/ install-plugin jabber
java -jar jenkins-cli.jar -s http://jenkins:8080/ install-plugin checkstyle
java -jar jenkins-cli.jar -s http://jenkins:8080/ install-plugin cloverphp
java -jar jenkins-cli.jar -s http://jenkins:8080/ install-plugin dry
java -jar jenkins-cli.jar -s http://jenkins:8080/ install-plugin jdepend
java -jar jenkins-cli.jar -s http://jenkins:8080/ install-plugin plot
java -jar jenkins-cli.jar -s http://jenkins:8080/ install-plugin pmd
#java -jar jenkins-cli.jar -s http://jenkins:8080/ install-plugin tasks
java -jar jenkins-cli.jar -s http://jenkins:8080/ install-plugin violations
java -jar jenkins-cli.jar -s http://jenkins:8080/ install-plugin xunit
java -jar jenkins-cli.jar -s http://jenkins:8080/ install-plugin phing
#java -jar jenkins-cli.jar -s http://jenkins:8080/ install-plugin postbuild-task
#java -jar jenkins-cli.jar -s http://jenkins:8080/ install-plugin build-keeper-plugin
#java -jar jenkins-cli.jar -s http://jenkins:8080/ install-plugin performance
#java -jar jenkins-cli.jar -s http://jenkins:8080/ install-plugin monitoring
#java -jar jenkins-cli.jar -s http://jenkins:8080/ install-plugin scm-sync-configuration
#java -jar jenkins-cli.jar -s http://jenkins:8080/ install-plugin svn-tag
 
java -jar jenkins-cli.jar -s http://jenkins:8080 safe-restart

sudo apt-get upgrade -y
sudo apt-get autoremove -y
