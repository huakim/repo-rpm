#!/bin/python3
#use File::Basename;
#use File::Spec;
#require File::Spec->catfile(dirname(__FILE__), 'apt-chroot.pl');
#our @pkgs;
j=__import__('apt-chroot')
pkgs=j.pkgs
main=j.main
# push @pkgs, qw(
pkgs.extend((
"NetworkManager",
"bind-utils",
"ca-certificates",
"coreutils",
"dhcp-client",
"dnf-command(config-manager)",
"dnf-command(versionlock)",
"file",
"glibc",
"glibc-langpack-en",
"hostname",
"inotify-tools",
"less",
"lsof",
"nano",
"ncurses",
"net-tools",
"pciutils",
"psmisc",
"rsync",
"sed",
"shadow",
"sudo",
"systemd",
"tzdata",
"unzip",
"wget",
"which",
"whois"
))
# );

if __name__ == '__main__':
    main()

# unless (caller){
    # load(@ARGV);
# }

