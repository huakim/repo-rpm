#!/bin/sh
smp="$(realpath $(dirname $0))"
cd "${smp}"

iso="liveiso-$1/"
dir="${iso}/LiveOS/"

mkdir -p "${dir}"

mv "$(realpath bootstrap-$1/boot/initrd)" "${dir}/initrd.img"
cp "$(realpath bootstrap-$1/boot/vmlinuz)" "${dir}/vmlinuz"

rm "${dir}/squashfs.img"
mksquashfs bootstrap-"$1" "${dir}/squashfs.img"

GR="$(command -v grub2-mkrescue)"
dir="${iso}/boot/grub"

if [ -z "${GR}" ]; then
  GR="$(command -v grub-mkrescue)"
fi

mkdir -p "${dir}"

cat <<EOF > "${dir}/grub.cfg"
menuentry 'Live Boot' {
  linux /LiveOS/vmlinuz root=live:LABEL="LiveOS_$1" rd.live.image rd.live.dir=/LiveOS rd.live.squashfs=squashfs.img
  initrd /LiveOS/initrd.img
}
EOF

"$GR" -v -o "liveiso-$1.iso" -V "LiveOS_$1" "${iso}" 

