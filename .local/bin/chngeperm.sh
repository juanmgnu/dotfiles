#!/bin/bash

# Buscamos los archivos (no directorios ) ejecutables y los guardamos en RUTAS.
RUTAS=$(find "$1" -executable -type f)

echo "Quitando permisos de ejecución a los archivos..."

for i in $RUTAS
do
  chmod -x $i
done

echo "Terminado."
