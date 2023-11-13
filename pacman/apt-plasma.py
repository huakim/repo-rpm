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
'accountsservice',
'ark',
'bluedevil',
'breeze-gtk',
'dolphin',
'gnome-disk-utility',
'gwenview',
'haruna',
'pavucontrol-qt',
'kate',
'kate-plugins',
'keepassxc',
'kde-connect',
'kde-inotify-survey',
'kde-gtk-config',
'kde-settings-plasma',
'kde-settings-pulseaudio',
'kdialog',
'kf5-kunitconversion',
'kio-admin',
'kio-extras',
'kio-fuse',
'kmenuedit',
'konsole',
'kscreen',
'kwayland-integration',
'kwin-wayland',
'kwin-x11',
#'materia-gtk-theme',
#'materia-kde',
#'lightdm',
#'lightdm-settings',
'plasma-desktop',
'plasma-drkonqi',
'plasma-milou',
'plasma-nm',
'plasma-pa',
'plasma-systemmonitor',
'plasma-wayland-protocols',
'plasma-workspace-wayland',
'plasma-workspace-x11',
'qt5-qdbusviewer',
#'slick-greeter',
'sddm',
'sddm-breeze',
'sddm-kcm',
'spectacle',
'upower',
'xdg-desktop-portal-kde'
))

#pkgs.extend((
#'kmail-account-wizard',
#'qt5-qtwebengine-devtools.x86_64',
#'falkon',
#'kmail'
#))

if __name__ == '__main__':
    main()
