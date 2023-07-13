#!/bin/perl
use File::Basename;
use File::Spec;
require File::Spec->catfile(dirname(__FILE__), 'apt-base.pl');
our @pkgs;

push @pkgs, qw(
dbus-1-x11
geany
 pavucontrol
 pulseaudio
 pulseaudio-module-bluetooth
 thai-fonts                                 
 xdg-dbus-proxy
 lklug-fonts             
 indic-fonts         
 xdm
 xinit
 xhost
 
 xf86-input-evdev                      
 xf86-input-joystick                   
 xf86-input-keyboard                   
 xf86-input-libinput                   
 xf86-input-mouse                      
 xf86-input-synaptics                  
 xf86-input-vmmouse                    
 xf86-input-void                       
 xf86-input-wacom        
 
 xf86-video-amdgpu
 xf86-video-ark
 xf86-video-ati
 xf86-video-intel
 xf86-video-nouveau
xmessage
xorg-x11-server
xorg-x11-server-extra
yast2
yast2-qt
);

unless (caller){
    load(@ARGV);
}
