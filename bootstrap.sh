#!/bin/sh
#dhclient

smp="$(realpath $(dirname $0))"
cd "${smp}"
echo $(pwd)
dir="${smp}/bootstrap-$1"

if ! [ -d "${dir}" ]; then
  mkdir -p "${dir}"
#  zypper --installroot="${smp}/bootstrap" in zypper
fi
#cp -RTfvpu bootstrap "$dir"

cd "$dir"

i(){
 d="$2"
 if test -z "$d"; then
  d="$1"
 fi
 mkdir "$1" -pv
 mount "/$d" "$1/" --bind
}


i dev
i proc
i sys

i extra/repo "${smp}"
#echo "${smp}"
#alias chroot='systemd-nspawn -D '
#chroot . /bin/bash
#chroot . /bin/dpkg --add-architecture i386
#chroot . /bin/bash
CACHEDIR="${smp}/pacman/var/cache/dnf" INSTALLROOT="${dir}" RELEASEVER="$RELEASEVER" python3 "${smp}/pacman/apt-$1.py"
#i extra "${smp}"
#chroot . /bin/bash
#chroot . /bin/bash "/extra/pacman/apt-$1.py"
chroot . /bin/bash /extra/repo/pacman/copy.sh
chroot . /bin/bash /extra/repo/pacman/setup.sh
chroot . /bin/bash /extra/repo/pacman/user.sh
#chroot . /sbin/runuser -u lenovo -c 'cd /extra/home/lenovo; ./txt.sh'
eval "chroot . /bin/dracut --kver=$(ls ./lib/modules) $DRACUT_ARGS"
if [ -f "$FSTAB" ]; then
  rm -v ./etc/fstab
  cp -v "$FSTAB" ./etc/fstab
  chroot . /bin/bash /extra/repo/pacman/aptat.sh
#  chroot . /usr/bin/env 'HOME=/home/lenovo' /bin/bash /extra/home/lenovo/txt.sh
else
  chroot . /bin/bash /extra/repo/pacman/aptdt.sh
fi
umount extra/repo
umount dev proc sys
