#!/bin/bash

# Matar instancias de polybar que estén corriendo:
killall -q polybar

# Esperar que los procesos terminen de ser cerrados:
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Lanzar polybar. Se usa la configuración ubicada en ~/.config/polybar/config:
polybar myBar &
echo "Polybar launched..."
