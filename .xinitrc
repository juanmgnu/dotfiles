#!/bin/bash

# Iniciamos sxhkd:
sxhkd &

# Iniciamos el servidor de notificaciones:
dunst &

# Iniciamos udiskie para gestionar dispositivos extraíbles:
udiskie &

# Iniciamos redshift:
redshift &

# Seteamos fondo de pantalla (aleatorio):
feh --bg-fill --no-fehbg --randomize ~/Pictures/wall/* &

# Iniciamos picom:
picom &

# Iniciamos el autenticador (lo usan aplicaciones que necesitan acceso de superusuario):
/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &

# Suspender:
xautolock -time 25 -locker "systemctl suspend" -detectsleep &

# Iniciamos bspwm (esto tiene que estar último):
exec bspwm
