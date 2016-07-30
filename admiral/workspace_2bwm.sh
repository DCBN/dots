#!/bin/env fish

set red "#c2454e"
set blue "#2e3340"

xprop -spy -root -notype  _NET_CURRENT_DESKTOP | while read space
  switch (echo $space | cut -d= -f2)
    case ' 0'
      echo "  %{F$red}1 %{F$blue}2 3 4 5 6"
    case ' 1'
      echo "  %{F$blue}1 %{F$red}2 %{F$blue}3 4 5 6"
    case ' 2'
      echo "  %{F$blue}1 2 %{F$red}3 %{F$blue}4 5 6"
    case ' 3'
      echo "  %{F$blue}1 2 3 %{F$red}4 %{F$blue}5 6"
    case ' 4'
      echo "  %{F$blue}1 2 3 4 %{F$red}5 %{F$blue}6"
    case ' 5'
      echo "  %{F$blue}1 2 3 4 5 %{F$red}6"
  end
end
