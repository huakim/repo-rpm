#!/bin/python3
#use File::Basename;
#use File::Spec;
#require File::Spec->catfile(dirname(__FILE__), 'apt-rootfs.pl');
#our @pkgs;
j=__import__('apt-rootfs')
pkgs=j.pkgs

if pkgs.check("EXTRAINSTALL"):
    pkgs.extend((
"java-devel",
"lua",
"c++",
'git',
"nim",
"python3-build",
"python3-py2pack",
"docker",
"docker-compose",
"docker-buildx"
))

pkgs.extend((
"NetworkManager-bluetooth",
"NetworkManager-wifi",
"NetworkManager-openvpn",
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
"udisks2",
"gpm",
"iwlwifi-dvm-firmware",
"iwlwifi-mvm-firmware",
"e2fsprogs",
"xfsprogs"
))

pkgs.extend((
"kernel",
"kexec-tools",
"mesa-dri-drivers",
"realtek-firmware"
))

if __name__ == '__main__':
    pkgs.main()
