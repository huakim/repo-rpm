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
"copr-cli",
"gh",
'git',
'mock',
#"nim",
"python3-build",
"python3-py2pack",
"podman",
"obs-tools-pkg",
"obs-tools-build",
"podman-compose",
"podman-docker",
"cockpit",
"cockpit-ws",
"cockpit-podman"
))

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
"squashfs-tools",
"udisks2",
"gpm",
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
