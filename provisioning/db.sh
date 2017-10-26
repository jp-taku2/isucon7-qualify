#!/bin/bash

echo "mysql-server-5.7 mysql-server/root_password password root" | sudo debconf-set-selections
echo "mysql-server-5.7 mysql-server/root_password_again password root" | sudo debconf-set-selections
apt-get -y install mysql-server

sudo systemctl start mysql
sudo systemctl enable mysql
sudo /home/isucon/isubata/db/init.sh
mysql -uroot -proot < /home/isucon/init.sql
zcat /home/isucon/isucon7q-initial-dataset.sql.gz | sudo mysql -uroot -proot --default-character-set=utf8 isubata
sudo sed -i -e "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mysql.conf.d/mysqld.cnf
sudo /etc/init.d/mysql restart
sudo chown -R isucon: /home/isucon
sudo passwd isucon << EOF
isucon
isucon
EOF

exit 0;
