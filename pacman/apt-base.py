#!/bin/python3
#use File::Basename;
#use File::Spec;
#require File::Spec->catfile(dirname(__FILE__), 'apt-rootfs.pl');
#our @pkgs;
j=__import__('apt-rootfs')
pkgs=j.pkgs
main=j.main

pkgs.extend((
"at-spi2-core",
"btrfs-progs",
"dosfstools",
"dracut-live",
"efibootmgr",
"grub2-efi-ia32-modules",
"grub2-efi-x64-modules",
"grub2-pc",
"ntfs-3g",
"ntfsprogs",
"squashfs-tools"
))
#push @pkgs, qw(

#);

pkgs.extend((
"intel-compute-runtime",
"kernel",
"mesa-dri-drivers",
"nvidia-gpu-firmware",
"realtek-firmware"
))

if __name__ == '__main__': 
    main()
