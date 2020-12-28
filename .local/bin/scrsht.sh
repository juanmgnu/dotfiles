#!/bin/bash

notify() {
  notify-send scrot "Captura guardada"
}

case $1 in

  "screen")     scrot -p -e 'xclip -selection clipboard -target image/png < $f && mv $f ~/Pictures/' ; notify ;;
  "window")     scrot -u -e 'xclip -selection clipboard -target image/png < $f && mv $f ~/Pictures/' ; notify ;;
  "selection")  sleep 0.2 ; scrot -s -e 'xclip -selection clipboard -target image/png < $f && mv $f ~/Pictures/' ; notify ;;

esac

# Notas:
# Todas las capturas se guardan en ~/Pictures y se copian al portapapeles.
# Es necesario añadir un delay antes de sacar captura de una selección, sino no
# funciona. Tira el error: 'giblib error: couldn't grab pointer: Resource temporarily unavailable'
