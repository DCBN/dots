#!/usr/bin/env fish

set red "#8c4f4a"
xtitle -s | while read window
set wp (mpc current)
	if test -z $wp
		echo "%{F$red}$window"
	else
		echo "%{F$red}$wp"
  end
end

