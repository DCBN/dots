#!/usr/bin/env fish

set red "#acc5cc"
xtitle -s | while read window
set wp (mpc current)
	if test -z $wp
		echo "%{F$red}$window"| sed 's/fish //'
	else
		echo "%{F$red}$wp"
  end
end

