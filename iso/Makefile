setup: 
	mkdir -p vanilla-iso new-iso
	sudo mount -o loop debian12.iso vanilla-iso
	cp -rT vanilla-iso/ new-iso/
	sudo umount vanilla-iso

build:
	sudo chmod a+w -R new-iso/install.amd
	cp preseed.cfg new-iso/install.amd/
	gunzip new-iso/install.amd/initrd.gz
	echo preseed.cfg | cpio -H newc -o -A -F new-iso/install.amd/initrd
	gzip new-iso/install.amd/initrd
	sudo chmod a-w -R new-iso/install.amd
	fakeroot sudo genisoimage -r -J -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o preseed-debian-12.iso new-iso
	sudo isohybrid preseed-debian-12.iso
	md5sum preseed-debian-12.iso

clean:
	sudo umount vanilla-iso
	rm -rf vanilla-iso
	rm -rf new-iso
	rm -rf preseed-debian12.iso
