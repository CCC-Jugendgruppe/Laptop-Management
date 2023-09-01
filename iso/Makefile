setup: 
	mkdir -p vanilla-iso new-iso
	sudo mount -o loop debian12.iso vanilla-iso
	cp -rT vanilla-iso/ new-iso/
	sudo umount vanilla-iso

build:
	cp preseed.cfg new-iso
	fakeroot sudo genisoimage -r -J -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o preseed-debian-12.iso new-iso
	sudo isohybrid preseed-debian-12.iso

clean:
	sudo umount vanilla-iso
	rm -rf vanilla-iso
	rm -rf new-iso
