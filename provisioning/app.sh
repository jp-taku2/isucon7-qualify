#!/bin/bash

sudo git clone https://github.com/tagomoris/xbuild.git /home/isucon/xbuild
sudo git clone https://github.com/isucon/isucon7-qualify.git /home/isucon/isubata
sudo /home/isucon/xbuild/ruby-install   -f 2.4.2   /home/isucon/local/ruby
sudo /home/isucon/xbuild/perl-install   -f 5.26.1  /home/isucon/local/perl
sudo /home/isucon/xbuild/node-install   -f v6.11.4 /home/isucon/local/node
sudo /home/isucon/xbuild/go-install     -f 1.9     /home/isucon/local/go
sudo /home/isucon/xbuild/python-install -f 3.6.2   /home/isucon/local/python
sudo /home/isucon/xbuild/php-install    -f 7.1.9   /home/isucon/local/php -- --disable-phar --with-pcre-regex --with-zlib --enable-fpm --enable-pdo --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --with-openssl --with-pcre-regex --with-pcre-dir --with-libxml-dir --enable-opcache --enable-bcmath --with-bz2 --enable-calendar --enable-cli --enable-shmop --enable-sysvsem --enable-sysvshm --enable-sysvmsg --enable-mbregex --enable-mbstring --with-mcrypt --enable-pcntl --enable-sockets --with-curl --enable-zip --with-pearAA
sudo apt install -y composer
(
  cd /home/isucon/isubata/webapp/php
  composer install
)
sudo echo '10.0.1.103    db00' >> /etc/hosts
sudo cp /home/isucon/isubata/files/app/nginx.* /etc/nginx/sites-available
sudo ln -s /etc/nginx/sites-available/nginx.php.conf /etc/nginx/sites-enabled/nginx.conf
sudo rm -f /etc/nginx/sites-enabled/default
sudo systemctl restart nginx
sudo systemctl enable nginx
sudo cp -p /home/isucon/isubata/files/app/env.sh /home/isucon/env.sh
sudo cp /home/isucon/isubata/files/app/isubata*service /etc/systemd/system/
sudo cp /home/isucon/isubata/files/app/isubata.php-fpm.conf /home/isucon/local/php/etc/isubata.php-fpm.conf
sudo chown -R isucon: /home/isucon
sudo systemctl enable isubata.php.service
sudo systemctl start isubata.php.service


exit 0;
