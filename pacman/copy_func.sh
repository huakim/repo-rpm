#!/bin/sh

bkup(){
  l="$dir" dir="$dest" dest="$l" copy "$1" "$2"
}

copy(){
  d="$(dirname "$dest${1:-$2}")"
  if ! test -d "$d"; then
    mkdir -pv "$d"
  fi
  cp -RTfvp "$dir$1" "$dest${1:-$2}"
}

dirmk(){
 mkdir -pv "$dir$1"
}

link(){
 f="$dest${1:-$2}"
 rm -Rfv "$f"
 ln -sTfv "$dir$1" "$f"
}

cldir(){
 f="$dest${1}"
 rm -Rvf "$f"
 mkdir -p "$f"
}

parse(){
  while read line; do
    $1 $line
  done
}

parsevar(){
    echo "$1" | parse "$2"
}

parsefile(){
    sed -n '/^[[:space:]]*#/!p' "$dir$1" | parse "$2"
}
