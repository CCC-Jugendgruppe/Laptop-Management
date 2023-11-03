#!/bin/sh
gunzip -v initrd.gz
cp -v initrd initrd.orig
wget https://raw.githubusercontent.com/CCC-Jugendgruppe/Laptop-Management/main/iso/preseed.cfg -O preseed.cfg
echo preseed.cfg | cpio -H newc -o -A -F initrd
gzip -v initrd
