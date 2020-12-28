#!/bin/bash

TERM="alacritty"

get_state() {
  cmus-remote -Q | grep "status" | awk '{print $2}'
}

get_artist() {
  cmus-remote -Q | grep "artist" | cut -d " " -f 3-
}

get_song() {
  cmus-remote -Q | grep "title" | cut -d " " -f 3-
}

notify() {
  notify-send $(get_state) "$(get_artist) - $(get_song)"
}


if [ ! -z "$(get_state)" ]; then

  case $1 in
    "init")   notify-send cmus "El reproductor ya está iniciado" ;;
    "play")   cmus-remote --pause ; notify ;;
    "stop")   cmus-remote --stop  ; notify ;;
    "prev")   cmus-remote --prev  ; notify ;;
    "next")   cmus-remote --next  ; notify ;;
    "seek--") cmus-remote --seek -2 ;;
    "seek++") cmus-remote --seek +2 ;;
    "quit")   cmus-remote -C "quit" ;;
  esac

else

  if [[ $1 == "init" ]] && [[ -z $(pidof cmus) ]]; then
    $TERM -e cmus
  else
    notify-send cmus "El reproductor no está iniciado"
  fi

fi


# Notas:
# Si cmus no está iniciado, el comando cmus-remote -Q | grep status va a dar vacío. 
# Esto es así porque no hay una palabra "status" con la que hacer el grep. 
# cmus-remote -Q tira el error 'cmus-remote: cmus is not running' (falla), asi que no puedo usar eso para comparar. 
# Tengo que chequear si la funcion retorna vacio y trabajar con eso. 
