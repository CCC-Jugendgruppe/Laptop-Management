#!/bin/bash

sudo apt update && sudo apt upgrade -y

sudo apt install git ansible -y

git clone https://github.com/CCC-Jugendgruppe/Laptop-Management.git

cd Laptop-Management

rm -rf iso 
