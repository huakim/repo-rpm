#!/bin/python3
#use File::Basename;
#use File::Spec;
#require File::Spec->catfile(dirname(__FILE__), 'apt-gui.pl');
#our @pkgs;

#push @pkgs, qw(
#tangram
#valent
#gnomesu
#);
j=__import__('apt-gui')
pkgs=j.pkgs
main=j.main

pkgs.extend((
"adwaita-gtk2-theme",
"alacarte",
"celluloid",
"dconf-editor",
"eog",
"file-roller",
"file-roller-nautilus",
"gcr3",
"gdm",
"gjs",
"gnome-color-manager",
"gnome-control-center",
"gnome-disk-utility",
"gnome-extensions-app",
"gnome-keyring",
"gnome-menus",
"gnome-power-manager",
"gnome-session-wayland-session",
"gnome-session-xsession",
"gnome-shell-extension-appindicator",
"gnome-shell-extension-dash-to-dock",
"gnome-system-monitor",
"gnome-terminal",
"gnome-terminal-nautilus",
"gnome-themes-extra",
"gnome-tweaks",
"gvfs",
"gvfs-fuse",
"gvfs-mtp",
"libnma",
"nautilus",
"pavucontrol",
"polkit-gnome",
"qgnomeplatform-qt5",
"qgnomeplatform-qt6",
"redshift",
"remmina",
"remmina-plugins-rdp",
"remmina-plugins-secret",
"remmina-plugins-vnc",
"secrets",
"valent",
"xdg-desktop-portal-gtk"
))

for i in ('good', 'bad-free', 'base', 'ugly-free'):
    pkgs.append("gstreamer1-plugins-"+i)

pkgs.extend((
'geary',
'epiphany',
'seahorse'
))

for i in ('dm', 'mpath', 'btrfs', 'lvm', 'nvdimm'):
    pkgs.append('libblockdev-'+i)
pkgs.append('anaconda-live')

if __name__ == '__main__': 
    main()
