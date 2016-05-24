#!/usr/bin/env bash

declare black red green yellow blue maganta cyan white fg bg color font pw ph px py width path

#path=".light-xresources"
path=".Xresources"
# Fetch the Colors
read -r black red green yellow blue magenta cyan white bg fg < <(
	gawk -F':' '
	/color8/    {black=$2}
	/color9/    {red=$2}
	/color10/   {green=$2}
	/color11/   {yellow=$2}
	/color12/   {blue=$2}
	/color13/   {magenta=$2}
	/color14/   {cyan=$2}
	/color15/   {white=$2}
	/background/{bg=$2}
	/foreground/{fg=$2}
END { print black, red, green, yellow, blue, magenta, cyan, white, bg, fg }' "$HOME/$path"
)
color="$fg"
# Fonts
#font='-*-tewi-medium-*-*-*-11-*-*-*-*-*-*'

echo $width
font='-*-lemon-medium-r-*-*-*-*-*-*-m-*-iso10646-1'
# Panel
pw=50
ph=22
px=20
py=15

#Actions
# VOLT="amixer sset Master toggle"
# VOLU="amixer sset Master 2%+"
# VOLD="amixer sset Master 2%-"
# Functions



#Workspace number
ws2() {
	local line
	while read -r line; do
		if [[ "$line" == *'true'* ]]; then
			output="${output}%{F$red}"
		elif [[ "$line" == *'false'* ]]; then
			output="${output}%{F$green}"
		fi
		num=$(echo "${line/\]/}" | cut -d , -f 2 )  # FIXME
		output="${output}%{A:i3-msg workspace ${num}:} ${num}%{A} "
	done <<< "  $(i3-msg -t get_workspaces | jq -S -M -c -r '.[] | [.focused, .name]' | sed 's/\"//;s/\"//')"
	output="${output}%{F#888888}"
	echo "%{F$color}${output}" | sed 's/\[//;s/\]//'
}
 ws(){
	ws=$(i3-msg -t get_outputs | sed 's/.*"current_workspace":"\([^"]*\)".*/\1/')
	echo "%{F$color}${ws}"
}
todo(){
  python2 ~/script/t/t.py --task-dir ~/tasks --list tasks | wc -l
}
while true; do
  echo "   $(ws)"
  sleep 0.5
done | lemonbar -g "${pw}x${ph}+${px}+${py}" -f "$font" -B "$bg" -F "$fg" -p -d
