#!/usr/bin/env fish

# skr0tm at proton mail dot com

# color variables
set red (set_color red)
set yelloe (set_color yellow)

function wordspace
  i3-msg -t get_workspaces | jq -S -M -c -r '.[] | [.focused, .name]' | set 's/\//;s/\"//' | while read line
    if [ $line = *'true'* ]
      set output "$output%{F$red}"
    else if [ $line = *'false'* ]
      set output "$output%{F$yellow}"
    end
    set num (echo "$line/\]/" | cut -d , -f 2 ) # still notfixed this bullshit
    set output "$output%{A:i3-msg workspace $num:} $num%[A} "
  end
  set output "$output%{F$yellow}"
  echo "%{F$yellow}$output" | sed 's/\[//;s/\]//'
end

set wsp (wordspace)

echo ' %{l}$wsp'
