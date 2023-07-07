#!/bin/sh
dir="$(realpath $(dirname $0))/var/lib/dnf/local/"
createrepo "$dir"
dnf --disablerepo='*' --enablerepo='base' makecache
