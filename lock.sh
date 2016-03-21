#!/usr/bin/env bash

declare icon tempbg
icon="$HOME/.xlock/icon.png"
tmpbg='/tmp/screen.png'

finish() {
  [[ -f "$tmpbg" ]] && rm "$tmpbg"
}

trap finish SIGHUP SIGINT SIGTERM

(( $# )) && icon="$1"

scrot "$tmpbg"

convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"

i3lock -u -i "$tmpbg"

finish

