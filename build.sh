#!/bin/bash
# VISION_2026: Script de Construccion Profesional (64-bit) - CORREGIDO

if [ -z "$1" ]; then
    echo "Uso: ./build.sh <archivo.bas>"
    exit 1
fi

INPUT_FILE=$1
FILENAME=$(basename -- "$INPUT_FILE")
BASENAME="${FILENAME%.*}"

# Directorios (Rutas absolutas para evitar confusiones)
BASE_DIR=$(pwd)
BIN_DIR="$BASE_DIR/bin"

echo "--- COMPILACION DE ELITE: $FILENAME ---"

mkdir -p "$BIN_DIR"

# Compilamos. fbc a veces es caprichoso con -o y rutas relativas.
fbc -gen gcc -Wc -O3 -Wc -ffast-math "$INPUT_FILE" -x "$BIN_DIR/$BASENAME"

if [ $? -eq 0 ]; then
    echo "------------------------------------------------"
    echo "CONSTRUCCION EXITOSA: $BIN_DIR/$BASENAME"
    echo "------------------------------------------------"
else
    echo "Error en la compilacion."
    exit 1
fi
