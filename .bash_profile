# Si estoy en tty1, inicio automáticamente bspwm:

if [ "$(tty)" = "/dev/tty1" ]; then
  pgrep bspwm || startx
fi
