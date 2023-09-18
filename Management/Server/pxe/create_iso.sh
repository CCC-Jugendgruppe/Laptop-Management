#!/bin/bash

sudo apt install wget git -y

wget https://cdimage.debian.org/debian-cd/current/amd64/iso-dvd/debian-12.1.0-amd64-DVD-1.iso

mv debian-12.1.0-amd64-DVD-1.iso debian12.iso

git clone https://github.com/CCC-Jugendgruppe/Laptop-Management.git

mv debian12.iso ./Laptop-Management/iso

cd ./Laptop-Management

rm -rf Management

cd ./iso

make setup

make build
