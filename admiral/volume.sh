#!/bin/env fish

set red "#c2454e"
set volume (amixer get Master | egrep -o "[0-9]+%" | head -n1)

echo "%{F$red}| $volume |"
