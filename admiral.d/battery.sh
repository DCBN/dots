#!/usr/bin/env fish
# skr0tm at protonmail dot com

# color of text
set red "#8c4f4a"
# current battery percentage
set battery (acpi --battery | cut -d, -f2)

echo "%{F$red}$battery  "

