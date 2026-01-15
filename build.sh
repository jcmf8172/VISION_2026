#!/bin/bash
# VISION_2026: Script de Construccion Profesional (64-bit)

if [ -z "$1" ]; then
    echo "Uso: ./build.sh <archivo.bas>"
    echo "Ejemplo: ./build.sh src/main.bas"
    exit 1
fi

INPUT_FILE=$1
FILENAME=$(basename -- "$INPUT_FILE")
BASENAME="${FILENAME%.*}"

# Directorios
BIN_DIR="bin"
BUILD_DIR="build"

echo "--- COMPILACION DE ELITE: $FILENAME ---"

# Asegurar que los directorios existen
mkdir -p "$BIN_DIR" "$BUILD_DIR"

# Flags de Maximo Rendimiento
# -o: Especifica la ruta del ejecutable de salida en la carpeta bin/
fbc -gen gcc \
    -Wc -Ofast \
    -Wc -march=native \
    -Wc -funroll-loops \
    -Wc -ftree-vectorize \
    -o "$BIN_DIR/$BASENAME" \
    "$INPUT_FILE"

if [ $? -eq 0 ]; then
    echo "------------------------------------------------"
    echo "CONSTRUCCION EXITOSA: ./$BIN_DIR/$BASENAME"
    echo "------------------------------------------------"
else
    echo "Error en la compilacion."
    exit 1
fi
