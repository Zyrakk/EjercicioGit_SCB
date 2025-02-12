#!/bin/bash

if [ -f /tmp/socat_pid ]; then
    SOCAT_PID=$(cat /tmp/socat_pid)
    echo "[*] Deteniendo socat (PID: $SOCAT_PID)..."
    kill $SOCAT_PID
    rm /tmp/socat_pid
    echo "[*] Socat detenido."
else
    echo "[!] No se encontró ningún proceso de socat en ejecución."
fi
