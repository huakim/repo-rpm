#!/bin/perl
use File::Basename;
use File::Spec;
require File::Spec->catfile(dirname(__FILE__), 'apt-gui.pl');
our @pkgs;

push @pkgs, qw(
accountsservice
ark
bluedevil
dolphin
gnome-disk-utility
gwenview
kde-connect
kde-inotify-survey
kde-gtk-config
kde-settings-plasma
kde-settings-pulseaudio
kdialog
kf5-kunitconversion
kio-admin
kio-extras
kio-fuse
konsole
kscreen
kwayland-integration
kwin-wayland
kwin-x11
okular
plasma-desktop
plasma-drkonqi
plasma-nm
plasma-pa
plasma-systemmonitor
plasma-wayland-protocols
plasma-workspace-wayland
plasma-workspace-x11
sddm
sddm-kcm
upower
vlc
xdg-desktop-portal-kde
);

push @pkgs, qw(
kmail-account-wizard
falkon
kmail
);

unless (caller){
    load(@ARGV);
}
