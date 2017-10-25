#!/bin/bash


sudo /home/isucon/xbuild/ruby-install   -f 2.4.2   /home/isucon/local/ruby
sudo /home/isucon/xbuild/perl-install   -f 5.26.1  /home/isucon/local/perl
sudo /home/isucon/xbuild/node-install   -f v6.11.4 /home/isucon/local/node
sudo /home/isucon/xbuild/go-install     -f 1.9     /home/isucon/local/go
sudo /home/isucon/xbuild/python-install -f 3.6.2   /home/isucon/local/python
sudo /home/isucon/xbuild/php-install    -f 7.1.9   /home/isucon/local/php -- --disable-phar --with-pcre-regex --with-zlib --enable-fpm --enable-pdo --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --with-openssl --with-pcre-regex --with-pcre-dir --with-libxml-dir --enable-opcache --enable-bcmath --with-bz2 --enable-calendar --enable-cli --enable-shmop --enable-sysvsem --enable-sysvshm --enable-sysvmsg --enable-mbregex --enable-mbstring --with-mcrypt --enable-pcntl --enable-sockets --with-curl --enable-zip --with-pearAA
sudo echo '10.0.2.103    db00'
sudo cp /home/isucon/isubata/files/app/nginx.* /etc/nginx/sites-available
sudo gpasswd -a isucon adm
sudo gpasswd -a isucon sudo
sudo gpasswd -a isucon lpadmin
sudo gpasswd -a isucon sambashare
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

sudo passwd isucon << EOF
isucon
isucon
EOF

exit 0;
