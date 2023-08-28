#!/bin/python3
#use File::Basename;
#use File::Spec;
#require File::Spec->catfile(dirname(__FILE__), 'apt-base.pl');
#our @pkgs;
j=__import__('apt-base')
pkgs=j.pkgs
main=j.main

pkgs.extend((
"dbus-x11",
"dnfdragora",
"geany",
"generic-logos",
"lato-fonts",
"libyui-mga-qt",
"openh264",
"pavucontrol-qt",
"pipewire",
"pipewire-pulseaudio",
"uget",
"xdg-dbus-proxy",
"xdg-utils",
"xhost",
"xinit",
"xmessage",
"xorg-x11-drv-intel",
"xorg-x11-drv-nouveau",
"xorg-x11-server-Xephyr",
"xorg-x11-server-Xorg",
))

if __name__ == '__main__': 
    main()

