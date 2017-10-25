#!/bin/bash

sudo apt install -y mysql-server << EOF
root
root
EOF
echo 'installed mysql' > /tmp/log.txt
(
  cd /home/isucon/isubata/bench
  ./bin/gen-initial-dataset
  echo 'init-data done' >> /tmp/log.txt
)
sudo systemctl start mysql
echo 'started mysql' >> /tmp/log.txt
sudo systemctl enable mysql
echo 'startup mysql' >> /tmp/log.txt
sudo /home/isucon/isubata/db/init.sh
echo 'init.sh done' >> /tmp/log.txt
sudo mysql < /home/isucon/init.sql
echo 'init DB done' >> /tmp/log.txt
zcat /home/isucon/isubata/bench/isucon7q-initial-dataset.sql.gz | sudo mysql --default-character-set=utf8 isubata
echo 'insert done db' >> /tmp/log.txt
sudo sed -i -e 's/bind-address = 127.0.0.1/bind-address = 0.0.0.0/d' /etc/mysql/mysql\.conf\.d/mysqld\.cnf
echo 'set my.cnf' >> /tmp/log.txt
sudo /etc/init.d/mysql restart
echo 'mysql restart done' >> /tmp/log.txt
sudo chown -R isucon: /home/isucon
sudo passwd isucon << EOF
isucon
isucon
EOF

exit 0;
