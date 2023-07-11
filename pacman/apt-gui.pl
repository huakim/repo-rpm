#!/bin/perl
use File::Basename;
use File::Spec;
require File::Spec->catfile(dirname(__FILE__), 'apt-base.pl');
our @pkgs;

push @pkgs, qw(
dbus-x11
geany
gnome-themes-extra
menulibre
pavucontrol
pulseaudio
pulseaudio-module-bluetooth
xorg-x11-server-Xephyr
xorg-x11-server-Xorg
);

unless (caller){
    load(@ARGV);
}
