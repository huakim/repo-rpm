#!/bin/bash
export ZYPP_SINGLE_RPMTRANS=1
export ZYPP_MEDIANETWORK=1
declare -a pkgs
pkgs+=(
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
glibc-langpack-en
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
)

#push @pkgs, "apt-file", "apt-rdepends", "at-spi2-core", "apt-utils", 
#"ca-certificates", "console-setup", "dosfstools", "dpkg", "dpkg-repack", 
#"dpkg-dev", "file", "grub-efi-amd64", "grub-pc-bin", "grub-efi-ia32-bin", 
#"inetutils-ping", "inetutils-traceroute", "inotify-tools", "initramfs-tools", 
#"isc-dhcp-client", "less", "locales", "lsof", "nano", "net-tools", 
#"network-manager", "network-manager-openvpn", "ntfs-3g", "pciutils", 
#"psmisc", "refractainstaller-base", "refractasnapshot-base", "rfkill", 
#"software-properties-common", "systemd", "systemd-resolved", "systemd-sysv", 
#"sudo", "usr-is-merged", "whois", "whiptail", "wpasupplicant";


pkgs+=(
realtek-firmware
intel-compute-runtime
mesa-dri-drivers
nvidia-gpu-firmware
kernel
)
#"firmware-misc-nonfree",
#"firmware-realtek",
#"firmware-linux-free",
#"firmware-iwlwifi",
#"linux-image-liquorix-amd64";

load(){
  flags=(--non-interactive)
  if [ -n "$INSTALLROOT" ]; then
    flags+=(--installroot "$INSTALLROOT")
  fi
  zypper --non-interactive "${flags[@]}" install --force --no-recommends "${pkgs[@]}" "${@}"
}

if test -z "$caller"; then
    load "${@}"
fi
