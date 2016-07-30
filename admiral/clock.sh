#!/usr/bin/env fish
# skr0tm at protonmail dot com

# set text color
set red "#8c4f4a"
set blue "#525d69"
set green "#57553c"
set yellow "#a17e3e"
set color "#daba8b"
# get current number of open tasks
set tasks (python2 $HOME/script/t/t2.py --task-dir $HOME/tasks --list tasks | wc -l)

# DO YOUR TASKS YA CUNT
if test $tasks -le 2
  set color $green
else if test $tasks -le 5
  set color $blue
else if test $tasks -le 7
  set color $yellow
else if test $tasks -le 10
  set color $red
end
# set text color
set fg "#daba8b"
# set current date
set dat (date "+%d %b %Y  %H %M")
# battery info
set battery (acpi --battery | cut -d, -f2)

echo "%{r}%{F$color}$tasks%{F$fg} | $dat %{F$red}$battery "

