#!/bin/sh

# eth1のIP設定
echo -e "auto eth1\niface eth1 inet static\naddress $1\nnetmask 255.255.255.0" >> /etc/network/interfaces

#反映
ifdown eth1; ifup eth1
