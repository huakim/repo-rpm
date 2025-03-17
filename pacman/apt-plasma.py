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

if pkgs.check("EXTRAINSTALL"):
   pkgs.extend((
#"plasma-mobile",
"plasma-workspace-x11",
"kinfocenter",
"okular",
"copr-qt",
"kget",
"neochat",
"zapzap",
'libreoffice-kf6',
"qt6-qtwebengine-devtools",
"transmission-qt",
"libyui-mga-qt",
"remmina-plugins-kwallet.x86_64"
))

pkgs.extend((
'plasma-nm-openvpn',
'accountsservice',
'ark',
'bluedevil',
'breeze-gtk',
'dolphin',
#'gnome-disk-utility',
'gwenview',
'vlc',
'vlc-plugins-all',
'pavucontrol-qt',
'kate',
'kate-plugins',
'kde-connect',
'kde-inotify-survey',
'kde-gtk-config',
'kde-settings-plasma',
'kde-settings-pulseaudio',
'kdialog',
'keepassxc',
'kget',
#'kf5-kunitconversion',
'kio-admin',
'kio-extras',
'kio-fuse',
'kmenuedit',
'konsole',
'kscreen',
#'ktorrent',
'kwayland-integration',
'kwin-wayland',
#'kwin-x11',
'materia-gtk-theme',
'materia-kde',
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
#'plasma-workspace-x11',
#'qt5-qdbusviewer',
#'slick-greeter',
'pam-kwallet',
'sddm',
'sddm-breeze',
'sddm-kcm',
'spectacle',
'upower',
'xdg-desktop-portal-kde'
))

pkgs.extend((
#'kmail-account-wizard',
#'qt5-qtwebengine-devtools',
'falkon',
#'kmail'
))

if __name__ == '__main__':
    pkgs.main()
