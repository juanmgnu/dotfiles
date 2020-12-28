#!/bin/bash

mostrar_opciones() {
  echo -e "Salir\nSuspender\nReiniciar\nApagar" | rofi -dmenu -lines 4 -i -p "Sistema"
}

confirmar() {
  echo -e "Si\nNo" | rofi -dmenu -lines 2 -i -p "¿Seguro?"
}

opcion=$(mostrar_opciones)

case $opcion in

  "Salir")      [[ $(confirmar) == "Si" ]] && bspc quit ;;
  "Suspender")  [[ $(confirmar) == "Si" ]] && systemctl suspend ;;
  "Reiniciar")  [[ $(confirmar) == "Si" ]] && systemctl reboot ;;
  "Apagar")     [[ $(confirmar) == "Si" ]] && systemctl poweroff ;;

esac


# Notas: 
# If you know you're always going to use bash, it's much easier to always use the 
# double bracket conditional compound command [[ ... ]], instead of the Posix-compatible 
# single bracket version [ ... ]. 
# Inside a [[ ... ]] compound, word-splitting and pathname expansion are not applied to words, 
# so you can rely on if [[ $aug1 == "and" ]]; to compare the value of $aug1 with the string and.
# If you use [ ... ], you always need to remember to double quote variables like this:
#     if [ "$aug1" = "and" ];
# If you don't quote the variable expansion and the variable is undefined or empty, it vanishes 
# from the scene of the crime, leaving only
#     if [ = "and" ]; 
# which is not a valid syntax. 

# Single [] are posix shell compliant condition tests.
# Double [[]] are an extension to the standard [] and are supported by bash and other shells (e.g. zsh, ksh).
# Use [] whenever you want your script to be portable across shells. 
# Use [[]] if you want conditional expressions not supported by [] and don't need to be portable.

# == is a bash-ism. It's better to use the POSIX =. 
# In bash the two are equivalent, and in plain sh = is the only one guaranteed to work.
