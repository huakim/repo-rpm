#!/bin/python3
#use File::Basename;
#use File::Spec;
#require File::Spec->catfile(dirname(__FILE__), 'apt-rootfs.pl');
#our @pkgs;
j=__import__('apt-rootfs')
pkgs=j.pkgs
main=j.main

pkgs.extend((
"NetworkManager-bluetooth",
"NetworkManager-wifi",
"at-spi2-core",
"btrfs-progs",
"bluez-obexd",
"dosfstools",
"dracut-live",
"efibootmgr",
"ntfs-3g",
"ntfsprogs",
"rEFInd",
"squashfs-tools",
"tor",
"obfs4",
"e2fsprogs",
"xfsprogs"
))
#push @pkgs, qw(

#);

pkgs.extend((
"intel-compute-runtime",
"kernel",
"kexec-tools",
"mesa-dri-drivers",
"nvidia-gpu-firmware",
"realtek-firmware"
))

if __name__ == '__main__': 
    main()
