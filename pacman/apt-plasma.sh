#!/bin/sh

#unless(caller){
#    use File::Basename;
#    use lib dirname($0);
#    our @pkgs;
#}
dir="$(realpath $(dirname $0))/"

caller="base" . "${dir}/apt-gui.sh";

pkgs="
$pkgs
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
"

#push @pkgs, "accountsservice", "ark", "bluedevil", "dolphin-root", 
#"gnome-disk-utility", "gwenview", "kde-config-gtk-style", 
#"kdeconnect", "kde-config-screenlocker", "kde-config-sddm", "kdialog", 
#"kfind", "kio-admin", "kio-extras", "kio-fuse", "knewstuff-dialog", 
#"konsole", "kscreen", "kwin-x11", "kwin-wayland", "libvirt-clients", 
#"okular", "plasma-desktop", "plasma-nm", "plasma-pa", "plasma-systemmonitor", 
#"plasma-workspace", "plasma-workspace-wayland", "powerdevil", 
#"pulseaudio", "pulseaudio-module-bluetooth", "sddm", "sddm-theme-breeze",
#"systemsettings", "upower", "vlc", "vlc-plugin-access-extra", 
#"xdg-desktop-portal-kde";

pkgs="
$pkgs
kmail-account-wizard
falkon
kmail
"

if test -z "${caller}"; then
    load
fi
