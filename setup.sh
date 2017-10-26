#!/bin/sh

isubata1=$1
#isubata2=$2
#isubata3=$3
pem=$2

for i in $isubata1 #$isubata2 $isubata3 
do
  scp -i $pem ./provisioning/common.sh ubuntu@$i:~/
  scp -i $pem ./provisioning/app.sh ubuntu@$i:~/
  ssh -i $pem ubuntu@$i "sudo sh common.sh"
  ssh -i $pem ubuntu@$i "sudo sh app.sh"
done

#scp -i $pem ./data/isucon7q-initial-dataset.sql.gz ubuntu@$isubata3:~/
#scp -i $pem ./provisioning/db.sh ubuntu@$isubata3:~/
#scp -i $pem ./provisioning/init.sql ubuntu@$isubata3:~/
#ssh -i $pem ubuntu@$isubata3 "sudo sh db.sh"
