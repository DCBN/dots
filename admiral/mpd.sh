#!/usr/bin/env fish

set music (mpc status | awk 'NR==1')
set song_selected (mpc status | awk 'NR==1' | grep volume: | cut -d: -f1)

if [ $song_selected = 'volume' ]
  #eval $HOME/.config/admiral.d/title.sh
else if test $music != 'volume'
  echo " %{c}%{F#8c4fa}$music"
else
  #eval $HOME/.config/admiral.d/title.sh
end

