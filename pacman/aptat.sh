#!/bin/sh
dir="$(realpath $(dirname $0))/"
dest="${1}/"

. "${dir}copy_func.sh"

parsefile "apt.list" "dirmk"
parsefile "apt.list" 'link'

rm -R "${dest}/etc/yum.repos.d"
rm -R "${dest}/etc/pki/rpm-gpg"

ln -sfTv "dnf/yum.repos.d" "${dest}/etc/yum.repos.d"
ln -sfTv "../dnf/rpm-gpg" "${dest}/etc/pki/rpm-gpg"
