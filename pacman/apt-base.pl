#!/bin/perl
our @pkgs;
use Data::Dumper;
$Data::Dumper::Terse=1;
$Data::Dumper::Indent=0;

push @pkgs, qw(
at-spi2-core                          
 bind-utils                            
 btrfsprogs                            
 ca-certificates                       
 ca-certificates-mozilla
 coreutils                             
 dracut-kiwi-live
 dhcp-client                           
 dosfstools
 efibootmgr  
 file                                  
 glibc                                 
 glibc-locale-base                            
 glibc-i18ndata
 grub2-i386-efi                        
 grub2-i386-pc                         
 grub2-x86_64-efi       
 hostname
 inotify-tools                        
 less
 lsof
 net-tools                           
 multipath-tools     
 nano                                  
 NetworkManager                        
 NetworkManager-openvpn                
 ntfs-3g        
 ntfsprogs                       
 pciutils                              
 psmisc     
 lsb-release                    
 squashfs
 shadow                                
 sudo                                            
 which                                 
 whois                                                                   
 wpa_supplicant                                                       
 zypper                                
 zypper-aptitude
);

#push @pkgs, qw(
#NetworkManager
#NetworkManager-openvpn
#NetworkManager-wifi
#NetworkManager-wwan
#at-spi2-core
#bind-utils
#btrfs-progs
#ca-certificates
#dhcp-client
#dosfstools
#dracut-live
#file
#grub2-pc
#glibc-langpack-en
#inotify-tools
#iputils
#kbd
#less
#lsof
#nano
#ncurses
#net-tools
#ntfs-3g
#passwd
#pciutils
#psmisc
#rfkill
#sed
#sudo
#systemd
#systemd-resolved
#systemd-sysv
#traceroute
#tzdata
#which
#whois
#zypper
#);

#push @pkgs, "apt-file", "apt-rdepends", "at-spi2-core", "apt-utils", 
#"ca-certificates", "console-setup", "dosfstools", "dpkg", "dpkg-repack", 
#"dpkg-dev", "file", "grub-efi-amd64", "grub-pc-bin", "grub-efi-ia32-bin", 
#"inetutils-ping", "inetutils-traceroute", "inotify-tools", "initramfs-tools", 
#"isc-dhcp-client", "less", "locales", "lsof", "nano", "net-tools", 
#"network-manager", "network-manager-openvpn", "ntfs-3g", "pciutils", 
#"psmisc", "refractainstaller-base", "refractasnapshot-base", "rfkill", 
#"software-properties-common", "systemd", "systemd-resolved", "systemd-sysv", 
#"sudo", "usr-is-merged", "whois", "whiptail", "wpasupplicant";


#push @pkgs,
# qw(
#realtek-firmware
#intel-compute-runtime
#mesa-dri-drivers
#nvidia-gpu-firmware
#qw(
# kernel-vanilla
# kernel-firmware-realtek                                              
#);
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
  
  my @flags=qw(env ZYPP_SINGLE_RPMTRANS=1 ZYPP_MEDIANETWORK=1 zypper);
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
