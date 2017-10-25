#!/bin/bash

sudo tc qdisc add dev enp0s3 root tbf rate 100mbit
sudo tc qdisc add dev enp0s8 root tbf rate 100mbit
sudo tc qdisc add dev enp0s9 root tbf rate 500mbit

exit 0;
