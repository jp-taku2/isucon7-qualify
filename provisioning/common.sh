#!/bin/bash

set -e
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo apt-get install -y git nginx curl libreadline-dev pkg-config autoconf automake build-essential libmysqlclient-dev \
    libssl-dev python3 python3-dev python3-venv openjdk-8-jdk-headless libxml2-dev libcurl4-openssl-dev \
    libxslt1-dev re2c bison libbz2-dev libreadline-dev libssl-dev gettext libgettextpo-dev libicu-dev \
    libmhash-dev libmcrypt-dev libgd-dev libtidy-dev
sudo echo -e "auto eth1\niface eth1 inet dhcp" >> /etc/network/interfaces.d/50-cloud-init.cfg
sudo systemctl restart networking.service
sudo sed -i -e "/NOPASSWD/a ubuntu\tALL=(ALL)\tNOPASSWD: ALL" /etc/sudoers
sudo useradd -m -s /bin/bash isucon
sudo gpasswd -a isucon adm
sudo gpasswd -a isucon sudo
sudo gpasswd -a isucon lpadmin
sudo gpasswd -a isucon sambashare
sudo passwd isucon << EOF
isucon
isucon
EOF

sudo mkdir /home/isucon/.ssh
sudo mkdir /home/isucon/local
sudo cp -p /home/ubuntu/.ssh/authorized_keys /home/isucon/.ssh/authorized_keys
sudo chown -R ubuntu: /home/isucon
sudo sed -i -e "/NOPASSWD/a isucon\tALL=(ALL)\tNOPASSWD: ALL" /etc/sudoers

exit 0;
