#!/bin/bash
# VISION_2026: Script de Construccion Optimizada (64-bit)

if [ -z "$1" ]; then
    echo "Uso: ./build.sh <archivo.bas>"
    exit 1
fi

FILENAME=$1
BASENAME="${FILENAME%.*}"

echo "Compilando $FILENAME con optimizaciones de 64 bits..."

# Flags explicados:
# -gen gcc: Usa el backend de C (necesario para optimizaciones avanzadas)
# -Wc -O3: Pasa el nivel de optimizacion 3 directamente a GCC
# -Wc -ffast-math: Optimizaciones matematicas rapidas
fbc -gen gcc -Wc -O3 -Wc -ffast-math "$FILENAME"

if [ $? -eq 0 ]; then
    echo "Construccion exitosa: ./$BASENAME"
else
    echo "Error en la compilacion."
    exit 1
fi
