ANSIBLE_PUBLIC_KEY := ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDDb0zT0JbD4MA7GnXUH/4Q07wUNEOzpcJpVkd7saBmfamAX4Bc85f4I2+7Oil2RlbQHYj7hetvDQDCi021mFBRuM2OazPGubHt+SdbKNdav1xVDrfdUJHnadVt/VA4HfvEWvTAe23JeKA9vNqqFUa2XEPOmpln5L0x9oO0qCoudlZyGDY5fTM5svZ9bcJdzrUwp/8/1wTdbfmnhw8G43H/qwWLFJZIpuYMBEsZw1lRa4xySx9qFJvvh0SGyuD2NaaB1bLhLROBMMEpkpqmRI/lgdzuAY0JRALLJn7hTrYnCFvHgThun0qUFzBiyP10n2wbqTElri1GfdSHf4zfoG9Vz77eJkMypOlfAx5pO3gu9LYfftUL3QngBSZeVXGoBoySQCf872ImqStmTDrFwoGrVYw9ljtj0AQttzQicI11devUhNzOpUMgNL93gtSfyHAT5nb6OXnIj3HIdgbzguQi5o/qZB0mBmr4rCS9qrg4kj0VmePpxGm2bHseFDJyM8E= user@hostname

setup: 
	mkdir -pv vanilla-iso new-iso
	sudo mount -v -o loop debian*12*.iso vanilla-iso
	cp -vrT vanilla-iso/ new-iso/
	sudo umount -v vanilla-iso/
	sudo chmod a+w -vR new-iso/boot/grub/
	# https://debianforum.de/forum/viewtopic.php?t=167409#p1190702
	sed -i -e 's/auto=true priority=critical/auto=true priority=high hostname?= domain=/g' new-iso/boot/grub/grub.cfg
	sudo chmod a-w -vR new-iso/boot/grub/

build:
	sudo chmod a+w -vR new-iso/install.amd
	cp -v preseed.cfg new-iso/install.amd/
	gunzip -v new-iso/install.amd/initrd.gz
	echo preseed.cfg | cpio -H newc -o -A -F new-iso/install.amd/initrd
	gzip -v new-iso/install.amd/initrd
	sudo chmod a-w -vR new-iso/install.amd
	fakeroot sudo genisoimage -r -J -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o preseed-debian-12.iso new-iso
	#sudo isohybrid preseed-debian-12.iso

umount-vanilla:
	sudo umount -v vanilla-iso

clean:
	rm -rvf vanilla-iso
	sudo rm -rvf new-iso
	rm -rvf preseed-debian12.iso
