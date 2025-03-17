#!/bin/python3
#use File::Basename;
#use File::Spec;
#require File::Spec->catfile(dirname(__FILE__), 'apt-base.pl');
#our @pkgs;
j=__import__('apt-base')
pkgs=j.pkgs

qemu=(
'libvirt',
'qemu',
'virt-manager',
"libvirt-daemon-driver-network",
"libvirt-daemon-driver-qemu"
)

if pkgs.check("EXTRAINSTALL"):
    pkgs.extend(qemu)
    pkgs.extend((
'nekoray',
'gnome-disk-utility',
'gparted',
'libreoffice-writer',
'libreoffice-calc',
'vscodium',
'remmina',
'wine',
'wine-mono',
'copr-qt',
'copr-cli',
'dnfdragora',
'remmina-plugins-rdp',
'remmina-plugins-vnc'
))

pkgs.extend((
#"dbus-x11",,
"generic-logos",
"google-roboto-mono-fonts",
#"open-sans-fonts",
"openh264",
"pipewire",
"pipewire-pulseaudio",
"pipewire-media-session",
"pulseaudio-utils",
"xdg-dbus-proxy",
"xdg-utils",
#"xhost",
#"xinit",
#"xmessage",
#"xorg-x11-drv-intel",
#"xorg-x11-drv-nouveau",
#"xorg-x11-server-Xephyr",
#"xorg-x11-server-Xorg",
))

if __name__ == '__main__':
    pkgs.main()

