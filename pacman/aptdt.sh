#!/bin/sh
dir="$(realpath $(dirname $0))/"
dest="${1}/"

. "${dir}copy_func.sh"

parsefile "apt.list" 'cldir'
copy "etc/dnf"
ln -sfT "dnf/yum.repos.d" "${dest}/etc/yum.repos.d"
