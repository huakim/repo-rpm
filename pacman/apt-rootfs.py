#!/bin/python3
#use File::Basename;
#use File::Spec;
#require File::Spec->catfile(dirname(__FILE__), 'apt-chroot.pl');
#our @pkgs;
j=__import__('apt-chroot')
pkgs=j.pkgs
main=j.main

dnfplugins=(
'dnf5-plugins',
)

pkgs.extend(dnfplugins)
# push @pkgs, qw(
pkgs.extend((
"NetworkManager",
"bind-utils",
"ca-certificates",
"coreutils",
"dhcp-client",
#"dnf-command(config-manager)",
#"dnf-command(versionlock)",
"fakeroot",
"file",
"glibc",
"glibc-langpack-en",
"gmp",
"hostname",
"inotify-tools",
"less",
"lsof",
"nano",
"ncurses",
"net-tools",
"passwd",
"pciutils",
"psmisc",
"rsync",
"sed",
"shadow",
"sudo",
"systemd",
"systemd-container",
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

