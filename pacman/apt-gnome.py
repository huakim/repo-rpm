#!/bin/python3
j=__import__('apt-gui')
pkgs=j.pkgs

if pkgs.check("EXTRAINSTALL"):
   pkgs.extend((
"evince",
"copr-wx",
#"varia",
"fractal",
"Tangram",
'libreoffice-gtk3',
#"transmission-gtk",
"libyui-mga-gtk",
"remmina-plugins-secret"
))


pkgs.extend((
"NetworkManager-openvpn-gnome",
"adwaita-gtk2-theme",
#"adwaita-qt5",
#"adwaita-qt6",
"alacarte",
"celluloid",
"dconf-editor",
"eog",
"evince",
"file-roller",
"file-roller-nautilus",
"geany",
"geany-themes",
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
"gnome-remote-desktop",
"gnome-session-wayland-session",
"gnome-session-xsession",
"gnome-shell-extension-appindicator",
"gnome-shell-extension-dash-to-dock",
#"gnome-shell-extension-valent",
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
#"polkit-gnome",
"qgnomeplatform-qt5",
"qgnomeplatform-qt6",
#"redshift",
#"remmina",
#"remmina-plugins-rdp",
#"remmina-plugins-secret",
#"remmina-plugins-vnc",
#"valent",
'secrets',
"xdg-desktop-portal-gtk"
))

for i in ('good', 'bad-free', 'base', 'ugly-free', 'bad-free-extras', ):
    pkgs.append("gstreamer1-plugins-"+i)
pkgs.append('gstreamer1-plugin-openh264')

pkgs.extend((
'geary',
'epiphany',
#'evolution',
'seahorse'
))

#for i in ('dm', 'mpath', 'btrfs', 'lvm', 'nvdimm'):
#    pkgs.append('libblockdev-'+i)
#pkgs.append('anaconda-live')

if __name__ == '__main__':
    pkgs.main()
