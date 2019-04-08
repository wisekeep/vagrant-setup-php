#!/bin/bash

echo "--- Iniciando instalacao do ambiente de Desenvolvimento PHP ---"

echo "--- Atualizando lista de pacotes ---"
sudo apt-get update

echo "--- Definindo Senha padrao para o MySQL e suas ferramentas ---"

DEFAULTPASS="vagrant"
sudo debconf-set-selections <<EOF
mysql-server	mysql-server/root_password password $DEFAULTPASS
mysql-server	mysql-server/root_password_again password $DEFAULTPASS
dbconfig-common	dbconfig-common/mysql/app-pass password $DEFAULTPASS
dbconfig-common	dbconfig-common/mysql/admin-pass password $DEFAULTPASS
dbconfig-common	dbconfig-common/password-confirm password $DEFAULTPASS
dbconfig-common	dbconfig-common/app-password-confirm password $DEFAULTPASS
phpmyadmin		phpmyadmin/reconfigure-webserver multiselect apache2
phpmyadmin		phpmyadmin/dbconfig-install boolean true
phpmyadmin      phpmyadmin/app-password-confirm password $DEFAULTPASS 
phpmyadmin      phpmyadmin/mysql/admin-pass     password $DEFAULTPASS
phpmyadmin      phpmyadmin/password-confirm     password $DEFAULTPASS
phpmyadmin      phpmyadmin/setup-password       password $DEFAULTPASS
phpmyadmin      phpmyadmin/mysql/app-pass       password $DEFAULTPASS
EOF

echo "--- Instalando pacotes basicos ---"
sudo apt-get install software-properties-common vim curl python-software-properties git-core git-flow --assume-yes --force-yes

echo "--- Adicionando repositorio do pacote PHP ---"
sudo add-apt-repository ppa:ondrej/php

echo "--- Atualizando lista de pacotes ---"
sudo apt-get update

echo "--- Instalando MySQL, Phpmyadmin e alguns outros modulos ---"
sudo apt-get install mysql-server mysql-client sqlite3 libsqlite3-dev libsqlite3-doc phpmyadmin --assume-yes --force-yes

echo "--- Instalando PHP, Apache e alguns modulos ---"
sudo apt-get install php7.3 php7.3-cli php7.3-common --assume-yes --force-yes
sudo apt-get install php-pear php7.3-curl php7.3-dev php7.3-gd php7.3-mbstring php7.3-zip php7.3-mysql php7.3-xml php7.3-fpm libapache2-mod-php7.3 php7.3-imagick php7.3-recode php7.3-tidy php7.3-xmlrpc php7.3-intl --assume-yes --force-yes

echo "--- Instalando PHP 7.3 ---"

sudo apt-get install php7.1-mcrypt php-mbstring php7.3-mbstring php7.3-sqlite3 php7.3-dev php-gd php7.3-gd php7.3-mbstring php7.3-zip php7.3-mysql php7.3-xml php7.3-fpm libapache2-mod-php7.3 php7.3-imagick php7.3-recode php7.3-tidy php7.3-xmlrpc php7.3-intl php-memcached --assume-yes --force-yes
sudo apt-get install php*-mysql php-xml zip unzip  --assume-yes --force-yes
sudo apt-get install 7.3-* --assume-yes --force-yes

echo "--- Habilitando o PHP 7.3 ---"
sudo a2dismod php5
sudo a2dismod 7.0
sudo a2dismod 7.1
sudo a2dismod 7.2

sudo a2enmod php7.3

echo "--- Habilitando mod-rewrite do Apache ---"
sudo a2enmod rewrite

echo "--- Reiniciando Apache ---"
sudo service apache2 restart

echo "--- Baixando e Instalando Composer ---"
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

echo "--- Instalando Banco NoSQL -> Redis <- ---" 
sudo apt-get install redis-server --assume-yes
sudo apt-get install php7.3-redis --assume-yes

# Instale apartir daqui o que você desejar 

sudo apt install swapspace --assume-yes
sudo apt install memcached --assume-yes
sudo service apache2 restart
sudo apt-get update && sudo apt-get upgrade --assume-yes
sudo apt-get install rng-tools --assume-yes
sudo apt-get autoremove --assume-yes

# Webmin dependencies
sudo apt-get install perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python --assume-yes

sudo wget http://www.webmin.com/jcameron-key.asc
sudo apt-key add jcameron-key.asc
echo "deb http://download.webmin.com/download/repository sarge contrib" | sudo tee -a /etc/apt/sources.list
sudo apt-get update
sudo apt install webmin --assume-yes
sudo apt-get install sqlitebrowser --assume-yes
sudo apt install npm --assume-yes

echo "[OK] --- Ambiente de desenvolvimento concluido ---"
