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
i extra "${smp}"
#echo "${smp}"
#read k
pac="${smp}/pacman/var"
#chroot . /bin/bash
#chroot . /bin/dpkg --add-architecture i386
CACHEDIR="${pac}/cache/dnf" LIBDIR="${pac}/lib/dnf" INSTALLROOT="${dir}" python3 "${smp}/pacman/apt-$1.py"
#i extra "${smp}"
#chroot . /bin/bash
#chroot . /bin/bash "/extra/pacman/apt-$1.py"
chroot . /bin/bash /extra/pacman/copy.sh
chroot . /bin/bash /extra/pacman/setup.sh
chroot . /bin/bash /extra/pacman/user.sh
eval "chroot . /bin/dracut --kver=$(ls ./lib/modules) $DRACUT_ARGS"
if [ -f "$FSTAB" ]; then
  rm -v ./etc/fstab
  cp -v "$FSTAB" ./etc/fstab
  chroot . /bin/bash /extra/pacman/aptat.sh
else
  chroot . /bin/bash /extra/pacman/aptdt.sh
fi
umount extra dev proc sys
