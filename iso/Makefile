setup: 
	mkdir -p vanilla-iso new-iso
	sudo mount -o loop debian12.iso vanilla-iso
	cp -rT vanilla-iso/ new-iso/
	sudo umount vanilla-iso
	# sudo chmod a+w -R new-iso/boot/grub/
	# https://debianforum.de/forum/viewtopic.php?t=167409#p1190702
	# sed -i -e 's/auto=true priority=critical/auto=true priority=high hostname?= domain=/g' new-iso/boot/grub/grub.cfg
	# sudo chmod a-w -R new-iso/boot/grub/

build:
	sudo chmod a+w -R new-iso/install.amd
	cp preseed.cfg new-iso/install.amd/
	gunzip new-iso/install.amd/initrd.gz
	echo preseed.cfg | cpio -H newc -o -A -F new-iso/install.amd/initrd
	gzip new-iso/install.amd/initrd
	sudo chmod a-w -R new-iso/install.amd
	fakeroot sudo genisoimage -r -J -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o preseed-debian-12.iso new-iso
	#sudo isohybrid preseed-debian-12.iso
	md5sum preseed-debian-12.iso

clean:
	rm -rf vanilla-iso
	sudo rm -rf new-iso
	rm -rf preseed-debian12.iso
