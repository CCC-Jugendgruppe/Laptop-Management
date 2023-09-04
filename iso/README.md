# Custom ISO

## Note for VMs

The preseed assumes the drive to install grub to is `/dev/sda`. Some VM Managers
like virt-manager use /dev/vda by default. For virt-manager you need to set the
disks `Bus Type`to SATA

## Setup

1. Download debian iso
2. Move it here and rename it to debian12.iso
3. run `make setup`

## Compiling

1. Run `make build`

## Cleaning

1. Run `m̀ake clean`

# Todo

- Setup SSH Key
