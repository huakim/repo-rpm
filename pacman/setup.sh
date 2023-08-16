#!/bin/sh
dir="$(realpath $(dirname $0))/"

export HOME="/etc/skel"
#gs='gsettings set'
lT='ln -sfTv'

localectl set-locale en_US.UTF-8
localectl set-keymap jp106

ds(){
    local fp="/etc/xdg/autostart/$1.desktop"
    local ft="/etc/xdg/autostart-disabled/$1.desktop"
    mkdir -pv /etc/xdg/autostart-disabled
    if [ -f "$fp" ]; then
        rm -v "$ft"
        mv -v "$fp" "$ft"
    fi
}

ds xfsettingsd
ds org.gnome.Evolution-alarm-notify
ds ca.andyholmes.Valent-autostart
ds geoclue-demo-agent
ds org.kde.kdeconnect.daemon
ds org.kde.kalendarac
ds kaccess

kver="$(ls /lib/modules)"

$lT ../usr/share/zoneinfo/Etc/GMT-3 /etc/localtime
$lT "usr/lib/modules/$kver/vmlinuz" /vmlinuz
$lT "boot/initramfs-$kver.img" /initrd.img

dconf update

#v=org.gnome.Epiphany
#$gs $v default-search-engine 'Google'
#v=$v.web:/org/gnome/epiphany/web/
#$gs $v ask-on-download true
#$gs $v enable-webextensions true
#$gs $v enable-adblock false
#$gs $v enable-popups true
#$gs $v enable-mouse-gestures true
#$gs $v webextensions-active "['Dark Mode']"

#desktop=org.gnome.desktop
#v=$desktop.background
#$gs $v picture-options 'none'
#$gs $v primary-color '#000000'

#$gs $desktop.input-sources sources "[('xkb', 'jp'), ('xkb', 'jp+rus')]"

#v=$desktop.interface
#$gs $v clock-show-seconds true
#$gs $v color-scheme 'prefer-dark'
#$gs $v cursor-theme 'Adwaita'
#$gs $v document-font-name 'Ubuntu Medium 11'
#$gs $v enable-animations false
#$gs $v font-name 'Ubuntu 11'
#$gs $v gtk-theme 'Adwaita-dark'
#$gs $v icon-theme 'Adwaita'
#$gs $v monospace-font-name 'Ubuntu Mono 11'

#peripherals=$desktop.peripherals
#v=$peripherals.keyboard
#$gs $v delay 180
#$gs $v repeat true
#$gs $v repeat-interval 20

#$gs $peripherals.mouse speed 0.8

#v=$peripherals.touchpad
#$gs $v click-method 'areas'
#$gs $v natural-scroll false
#$gs $v speed 0.8
#$gs $v tap-and-drag true
#$gs $v tap-to-click true
#$gs $v two-finger-scrolling-enabled true

#windowmanager=$desktop.wm
#v=$windowmanager.keybindings
#$gs $v switch-input-source "['<Shift>Alt_L']"
#$gs $v switch-input-source-backward "['<Alt>Shift_L']"

#v=$windowmanager.preferences
#$gs $v button-layout ":minimize,maximize,close"
#$gs $v theme "Adwaita"

#$gs org.gnome.mutter attach-modal-dialogs false

#v=org.gnome.settings-daemon.plugins.color
#$gs $v night-light-enabled true
#$gs $v night-light-schedule-automatic false
#$gs $v night-light-schedule-from 0
#$gs $v night-light-schedule-to 0
#$gs org.gnome.shell enabled-extensions "['appindicatorsupport@rgcjonas.gmail.com']"

