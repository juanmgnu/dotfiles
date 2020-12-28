#!/bin/bash

TERM="alacritty"
EDITOR="nvim"
FILES="bash\nalacritty\nbspwm\ndunst\nnvim\npolybar\nrofi\nsxhkd\nudiskie\nvifm"

config=$(echo -e "$FILES" | rofi -dmenu -lines 10 -i -p "Editar")

case $config in

  "bash")      $TERM -e $EDITOR ~/.bashrc ;;
  "alacritty") $TERM -e $EDITOR ~/.config/alacritty/alacritty.yml ;;
  "bspwm")     $TERM -e $EDITOR ~/.config/bspwm/bspwmrc ;;
  "dunst")     $TERM -e $EDITOR ~/.config/dunst/dunstrc ;;
  "nvim")      $TERM -e $EDITOR ~/.config/nvim/init.vim ;;
  "polybar")   $TERM -e $EDITOR ~/.config/polybar/config ;;
  "rofi")      $TERM -e $EDITOR ~/.config/rofi/config.rasi ;;
  "sxhkd")     $TERM -e $EDITOR ~/.config/sxhkd/sxhkdrc ;;
  "udiskie")   $TERM -e $EDITOR ~/.config/udiskie/config.yml ;;
  "vifm")      $TERM -e $EDITOR ~/.config/vifm/vifmrc ;;

esac

# Notas:
# Putting double quotes around the "$text" in the echo line is crucial. Without them, 
# none of the newlines (both literal and '\n') work. With them, they all do.
# Option -e in echo enables interpretation of backslash escapes (\n, for example).
