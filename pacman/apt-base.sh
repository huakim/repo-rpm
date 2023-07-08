#!/bin/sh

pkgs="
$pkgs
NetworkManager
NetworkManager-openvpn
NetworkManager-wifi
NetworkManager-wwan
at-spi2-core
bind-utils
btrfs-progs
ca-certificates
dhcp-client
dosfstools
file
grub2-pc
glibc-langpack-us
inotify-tools
iputils
kbd
less
lsof
nano
ncurses
net-tools
ntfs-3g
passwd
pciutils
psmisc
rfkill
sed
sudo
systemd
systemd-resolved
systemd-sysv
traceroute
tzdata
which
whois
zypper
"

#push @pkgs, "apt-file", "apt-rdepends", "at-spi2-core", "apt-utils", 
#"ca-certificates", "console-setup", "dosfstools", "dpkg", "dpkg-repack", 
#"dpkg-dev", "file", "grub-efi-amd64", "grub-pc-bin", "grub-efi-ia32-bin", 
#"inetutils-ping", "inetutils-traceroute", "inotify-tools", "initramfs-tools", 
#"isc-dhcp-client", "less", "locales", "lsof", "nano", "net-tools", 
#"network-manager", "network-manager-openvpn", "ntfs-3g", "pciutils", 
#"psmisc", "refractainstaller-base", "refractasnapshot-base", "rfkill", 
#"software-properties-common", "systemd", "systemd-resolved", "systemd-sysv", 
#"sudo", "usr-is-merged", "whois", "whiptail", "wpasupplicant";


pkgs="
$pkgs
realtek-firmware
intel-compute-runtime
mesa-dri-drivers
nvidia-gpu-firmware
kernel
"
#"firmware-misc-nonfree",
#"firmware-realtek",
#"firmware-linux-free",
#"firmware-iwlwifi",
#"linux-image-liquorix-amd64";

load(){
  if ! command -v zypper &> /dev/null
  then
    for i in dnf yum dnf5 microdnf;
    do
      if command -v $i &> /dev/null;
      then
        COM="$i install -y "
        break
      fi
    done
    $COM zypper
    zypper --non-interactive remove dnf yum dnf5 microdnf
  fi
  zypper --non-interactive install --force --no-recommends $pkgs "${@}"
}

if test -z "$caller"; then
    load
fi
