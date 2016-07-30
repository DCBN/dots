#!/usr/bin/env fish
# skr0tm at protonmail dot com

# color of text
set red "#c2454e"
# current battery percentage
set battery (acpi --battery | cut -d, -f2)

echo "%{F$red}$battery  "

