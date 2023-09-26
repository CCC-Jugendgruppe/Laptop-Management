#!/bin/bash
mkdir -p /home/chaos/.ssh/
echo 'ANSIBLE-SSH-KEY' >>/home/chaos/.ssh/authorized_keys
echo '[KDE]' >/home/chaos/.config/kdeglobals
echo 'LookAndFeelPackage=org.kde.breezedark.desktop' >>/home/chaos/.config/kdeglobals
echo 'SingleClick=false' >>/home/chaos/.config/kdeglobals
