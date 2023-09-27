# Custom ISO

## Note for VMs

The preseed assumes the drive to install grub to is `/dev/sda`. Some VM Managers
like virt-manager use /dev/vda by default. For virt-manager you need to set the
disks `Bus Type`to SATA

The iso currently does not work with UEFI VMs. Use BIOS instead. It works on
hardware with UEFI.

## Hostname

The Hostname promt doesnt work with BIOS on both Hardware and VMs. Use UEFI if
Possible or configure it manually after installing.

## Setup

1. Download debian iso
2. Move it here and rename it to debian12.iso
3. run `make setup`

## Compiling

1. Run `make build`

## Cleaning

1. Run `m̀ake clean`

# Todo

- [x] Setup SSH Key
- [x] Hostname question not shown when using BIOS
- [x] ISO not booting on UEFI VMs
- [x] switch to KDE
- [ ] integrate apt caching server
- [ ] TBD: These things still need to be handled by the user:
  - [ ] Partitions needs to be set up manually by the user
