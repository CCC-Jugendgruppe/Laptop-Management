#!/bin/bash

cd ./Laptop-Management/

git reset --hard

git pull

cd iso 

make clean

make setup

make build
