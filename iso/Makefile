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

clean:
	sudo umount vanilla-iso
	rm -rvf vanilla-iso
	sudo rm -rvf new-iso
	rm -rvf preseed-debian12.iso
