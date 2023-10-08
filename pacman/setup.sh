#!/bin/sh
dir="$(realpath $(dirname $0))/"

export HOME="/etc/skel"
#gs='gsettings set'
lT='ln -sfTv'
uP(){
    if [ -e "$3" ]; then
        if [ ! -e "$1" ]; then
            update-alternatives --install "${@}"
        fi
    fi
}

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

uP /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/gnome-terminal 25
uP /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/xfce4-terminal 25
uP /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/konsole 25
uP /usr/bin/sensible-browser sensible-browser /usr/bin/falkon 25
uP /usr/bin/sensible-browser sensible-browser /usr/bin/epiphany 25
uP /usr/bin/gnome-terminal gnome-terminal /usr/bin/konsole 25
uP /usr/bin/gnome-terminal gnome-terminal /usr/bin/xfce4-terminal
uP /usr/bin/vi vi /usr/bin/nano 25
uP /usr/bin/python python /usr/bin/python3 25

#dconf update

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



#[org/gnome/desktop/background]
#picture-options='none'
#primary-color='#000000'

#[org/gnome/desktop/input-sources]
#mru-sources=[('xkb', 'jp'), ('xkb', 'jp+rus')]
#sources=[('xkb', 'jp'), ('xkb', 'jp+rus')]
#xkb-options=['terminate:ctrl_alt_bksp']

#[org/gnome/desktop/interface]
#clock-show-seconds=true
#color-scheme='prefer-dark'
#cursor-theme='Adwaita'
#document-font-name='Ubuntu Medium 11'
#enable-animations=false
#font-name='Ubuntu 11'
#gtk-theme='Adwaita-dark'
#icon-theme='Adwaita'
#monospace-font-name='Ubuntu Mono 11'

#[org/gnome/desktop/peripherals/keyboard]
#delay=uint32 180
#numlock-state=true
#repeat=true
#repeat-interval=uint32 20

#[org/gnome/desktop/peripherals/mouse]
#speed=0.80000000000000004

#[org/gnome/desktop/peripherals/touchpad]
#click-method='areas'
#natural-scroll=false
#speed=0.80000000000000004
#tap-and-drag=true
#tap-to-click=true
#two-finger-scrolling-enabled=true

#[org/gnome/desktop/wm/keybindings]
#switch-input-source=['<Shift>Alt_L']
#switch-input-source-backward=['<Alt>Shift_L']

#[org/gnome/desktop/wm/preferences]
#button-layout=':minimize,maximize,close'
#theme='Adwaita'

#[org/gnome/epiphany]
#default-search-engine='Google'

#[org/gnome/epiphany/web]
#ask-on-download=true
#enable-adblock=false
#enable-mouse-gestures=true
#enable-popups=true
#enable-webextensions=true
#last-download-directory='/home/lenovo/Downloads'
#last-upload-directory='/home/lenovo/.cache/.fr-AXPA91'
#webextensions-active=['Dark Mode']

#[org/gnome/mutter]
#attach-modal-dialogs=false

#[org/gnome/settings-daemon/plugins/color]
#night-light-enabled=true
#night-light-schedule-automatic=false
#night-light-schedule-from=0.0
#night-light-schedule-to=0.0

#[org/gnome/shell/extensions/dash-to-dock]
#always-center-icons=false
#animate-show-apps=false
#animation-time=0.20000000000000001
#apply-custom-theme=true
#autohide=true
#autohide-in-fullscreen=false
#background-opacity=0.80000000000000004
#custom-theme-shrink=true
#dance-urgent-applications=true
#dash-max-icon-size=48
#dock-fixed=true
#dock-position='RIGHT'
#extend-height=true
#height-fraction=0.90000000000000002
#hide-delay=0.20000000000000001
#icon-size-fixed=false
#intellihide=true
#intellihide-mode='FOCUS_APPLICATION_WINDOWS'
#isolate-monitors=true
#isolate-workspaces=true
#multi-monitor=true
#preferred-monitor=-2
#preferred-monitor-by-connector='eDP-1'
#pressure-threshold=100.0
#require-pressure-to-show=true
#scroll-action='switch-workspace'
#scroll-to-focused-application=true
#show-apps-always-in-the-edge=true
#show-apps-at-top=false
#show-delay=0.25
#show-dock-urgent-notify=true
#show-mounts=false
#show-mounts-only-mounted=false
#show-running=true
#show-show-apps-button=true
#show-trash=false
#show-windows-preview=true
#workspace-agnostic-urgent-windows=false

#[org/gnome/shell/extensions/unite]
#app-menu-ellipsize-mode='start'
#app-menu-max-width=0
#autofocus-windows=false
#desktop-name-text='Desktop'
#enable-titlebar-actions=false
#extend-left-box=true
#greyscale-tray-icons=false
#hide-activities-button='never'
#hide-app-menu-icon=false
#hide-dropdown-arrows=false
#hide-window-titlebars='both'
#notifications-position='left'
#reduce-panel-spacing=false
#restrict-to-primary-screen=false
#show-desktop-name=false
#show-legacy-tray=false
#show-window-buttons='both'
#show-window-title='both'
#window-buttons-placement='right'
#window-buttons-theme='breeze'

#[org/gtk/gtk4/settings/file-chooser]
#date-format='regular'
#location-mode='path-bar'
#show-hidden=true
#show-size-column=true
#show-type-column=true
#sidebar-width=140
#sort-column='name'
#sort-directories-first=false
#sort-order='ascending'
#type-format='category'
#view-type='list'
#window-size=(827, 374)

#[org/gnome/shell]
#enabled-extensions=['appindicatorsupport@rgcjonas.gmail.com', 'unite@hardpixel.eu', 'dash-to-dock@micxgx.gmail.com']

#[org/gtk/settings/file-chooser]
#date-format='regular'
#location-mode='path-bar'
#show-hidden=true
#show-size-column=true
#show-type-column=true
#sidebar-width=163
#sort-column='name'
#sort-directories-first=false
#sort-order='ascending'
#type-format='category'
#window-position=(26, 23)
#window-size=(1203, 1001)



















