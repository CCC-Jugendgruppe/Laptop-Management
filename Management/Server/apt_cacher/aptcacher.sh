#!/bin/bash

sudo apt update && sudo apt ugprade -y

sudo apt install apt-cacher-ng -y

systemctl start apt-cacher-ng

systemctl enable apt-cacher-ng

echo "# bei PassThroughPattern entfernen"
sleep 10

nano /etc/apt-cacher-ng/acng.conf

systemctl restart apt-cacher-ng
