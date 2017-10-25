#!/bin/bash

set -e
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo apt-get install -y git nginx curl libreadline-dev pkg-config autoconf automake build-essential libmysqlclient-dev \
    libssl-dev python3 python3-dev python3-venv openjdk-8-jdk-headless libxml2-dev libcurl4-openssl-dev \
    libxslt1-dev re2c bison libbz2-dev libreadline-dev libssl-dev gettext libgettextpo-dev libicu-dev \
    libmhash-dev libmcrypt-dev libgd-dev libtidy-dev
sudo useradd -m -s /bin/bash isucon
sudo mkdir /home/isucon/.ssh
sudo mkdir /home/isucon/local
sudo chown -R vagrant: /home/isucon
sudo sed -i -e "/NOPASSWD/a isucon\tALL=(ALL)\tNOPASSWD: ALL" /etc/sudoers
exit 0;
