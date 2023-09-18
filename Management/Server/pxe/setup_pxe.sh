#!/bin/bash

echo "Update"
sudo apt update && sudo apt upgrade -y

echo "Pakete installieren"
sudo apt install syslinux-common syslinux-efi isc-dhcp-server tftpd-hpa ufw -y

echo "stoppe isc-dhcp-server service"
sudo systemctl stop isc-dhcp-server

echo "erstelle tftpboot Verzeichnis"
sudo mkdir /tftpboot

cd /usr/lib/syslinux/modules/efi64/

echo "kopiere ldlinux.e64"
sudo cp ldlinux.e64 /tftpboot

sudo cp {libutil.c32,menu.c32} /tftpboot

cd /usr/lib/SYSLINUX.EFI/efi64

sudo cp syslinux.efi /tftpboot/

cd /tftpboot

sudo mkdir pxelinux.cfg

tftpd_content=$(cat <<EOL
TFTP_USERNAME="tftp"
TFTP_DIRECTORY="/tftpboot"
TFTP_ADDRESS="0.0.0.0:69"
TFTP_OPTIONS="--secure"
EOL
)

echo "$tftpd_content" | sudo tee /etc/default/tftpd-hpa > /dev/null

echo "Udp in der Firewall erlauben"
sudo ufw allow 69/udp

sudo ufw enable

sudo systemctl restart tftpd-hpa
