#!/usr/bin/env bash
# This little script outputs
# your current virtual desktop.
# Quite dirty, makes innocent
# souls to cry, you've been warned.

# settings
BG="#1D1F21"
FG="#A8A8A8"
RED="#834F48"
RES="140x24+888+20"
#RES="140x24+815+20"
BRD="2"
BRDC="#252525"
FONT='-*-lemon-medium-r-*-*-*-*-*-*-m-*-iso10646-1'
# functions

work() {
	cur=`xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}'`
	tot=`xprop -root _NET_NUMBER_OF_DESKTOPS | awk '{print $3}'`

	for w in `seq 0 $((cur - 1))`
		do line=" ${line}"; done
	line=" ${line}%{F$RED}%{F- B-}"
	for w in `seq $((cur + 2)) $tot`
		do line=" ${line}"; done
	echo $line
}	

# output
while :; do
  echo "%{c}$(work)"
sleep 1s
done 2> /dev/null | lemonbar -d -b -g ${RES} -B ${BG} -F ${FG} -f ${FONT} -f ${FONT} & $1

