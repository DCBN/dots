#!/usr/bin/env bash

wp=$(mpc status | grep volume: | cut -d: -f1)
if [[ ${wp} == "volume" ]]; then
  echo "%{c}%{F#daba8b} - / -"
else
  echo " %{c}%{F#daba8b}$(mpc status | awk 'NR==1')"
fi
