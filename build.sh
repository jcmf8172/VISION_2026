#!/bin/bash
# VISION_2026: Script de Construccion de MAXIMO RENDIMIENTO (64-bit)

if [ -z "$1" ]; then
    echo "Uso: ./build.sh <archivo.bas>"
    exit 1
fi

FILENAME=$1
BASENAME="${FILENAME%.*}"

echo "--- COMPILACION DE ELITE: $FILENAME ---"

# Flags de Maximo Rendimiento:
# -gen gcc: Backend de C para optimizaciones globales.
# -Wc -Ofast: El nivel mas alto de GCC (incluye -O3 y optimizaciones no estandar de punto flotante).
# -Wc -march=native: Utiliza todas las instrucciones disponibles en esta CPU (AVX, AVX2, etc).
# -Wc -funroll-loops: Desenrolla bucles para reducir saltos de CPU.
# -Wc -ftree-vectorize: Intenta usar instrucciones SIMD (Single Instruction, Multiple Data).

fbc -gen gcc \
    -Wc -Ofast \
    -Wc -march=native \
    -Wc -funroll-loops \
    -Wc -ftree-vectorize \
    "$FILENAME"

if [ $? -eq 0 ]; then
    echo "------------------------------------------------"
    echo "CONSTRUCCION EXITOSA (OPTIMIZADA): ./$BASENAME"
    echo "------------------------------------------------"
else
    echo "Error en la compilacion de alto rendimiento."
    exit 1
fi
