#!/bin/perl
$ENV{'ZYPP_SINGLE_RPMTRANS'}=1;
$ENV{'ZYPP_MEDIANETWORK'}=1;
our @pkgs;
use Data::Dumper;
$Data::Dumper::Terse=1;
$Data::Dumper::Indent=0;
push @pkgs, qw(
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
);

#push @pkgs, "apt-file", "apt-rdepends", "at-spi2-core", "apt-utils", 
#"ca-certificates", "console-setup", "dosfstools", "dpkg", "dpkg-repack", 
#"dpkg-dev", "file", "grub-efi-amd64", "grub-pc-bin", "grub-efi-ia32-bin", 
#"inetutils-ping", "inetutils-traceroute", "inotify-tools", "initramfs-tools", 
#"isc-dhcp-client", "less", "locales", "lsof", "nano", "net-tools", 
#"network-manager", "network-manager-openvpn", "ntfs-3g", "pciutils", 
#"psmisc", "refractainstaller-base", "refractasnapshot-base", "rfkill", 
#"software-properties-common", "systemd", "systemd-resolved", "systemd-sysv", 
#"sudo", "usr-is-merged", "whois", "whiptail", "wpasupplicant";


push @pkgs, qw(
realtek-firmware
intel-compute-runtime
mesa-dri-drivers
nvidia-gpu-firmware
kernel
);
#"firmware-misc-nonfree",
#"firmware-realtek",
#"firmware-linux-free",
#"firmware-iwlwifi",
#"linux-image-liquorix-amd64";

our sub load {
  my $INSTALLROOT=$ENV{"INSTALLROOT"};
  my $INTERACTIVE=$ENV{'INTERACTIVE'};
  my $QUIET=$ENV{'QUIET'};
  my $REFRESH=$ENV{'REFRESH'};
  my $RECOMMENDS=$ENV{'RECOMMENDS'};
  my $NEEDED=$ENV{'NEEDED'};
  
  my @flags=qw(zypper);
  defined $INSTALLROOT && push @flags, qw(--installroot), $INSTALLROOT;
  defined $INTERACTIVE || push @flags, qw(-n);
  defined $QUIET || push @flags, qw(-v -v -v -v);
  defined $QUIET && push @flags, qw(-q -q -q -q);
  defined $REFRESH || push @flags, qw(--no-refresh);
  push @flags, 'install';
  defined $NEEDED || push @flags, qw(--force); 
  defined $RECOMMENDS || push @flags, qw(--no-recommends); 
  defined $RECOMMENDS && push @flags, qw(--recommends); 

  push @flags, @_, @pkgs;
  
  print Dumper(\@flags);
  system(@flags);
}

unless (caller){
  load @ARGV;
}
