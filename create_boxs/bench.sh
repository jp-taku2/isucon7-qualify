#!/bin/bash

sudo /home/isucon/xbuild/go-install     -f 1.9     /home/isucon/local/go
sudo -u isucon export PATH=export PATH=/home/isucon/local/go/bin:/home/isucon/go/bin:$PATH
sudo -u isucon go get github.com/constabulary/gb/...
(
  cd ~/isubata/bench
  gb vendor restore
  make
)
sudo chown -R isucon: /home/isucon
sudo passwd isucon << EOF
isucon
isucon
EOF

exit 0;
