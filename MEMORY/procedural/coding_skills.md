# Habilidades de Programación (Procedural Memory)

Este documento contiene "recetas" y procedimientos técnicos que he aprendido para desarrollar en FreeBASIC de manera eficiente.

## Habilidad 1: Compilación Optimizada para Producción
**Procedimiento**:
1. Asegurarse de que el código no tenga errores de sintaxis.
2. Ejecutar el compilador con flags de agresividad:
   `fbc -O 3 -march=native -ffast-math -gen gcc <archivo.bas>`
3. Verificar el rendimiento con el comando `time ./<ejecutable>`.

## Habilidad 2: Implementación de Bucles de Alto Rendimiento
**Técnica**:
*   Usar `Integer` para el contador del bucle.
*   Mover cálculos constantes fuera del bucle.
*   Evitar el uso de `String` dentro de bucles críticos; preferir buffers de `UByte`.

## Habilidad 3: Depuración Básica
**Procedimiento**:
1. Compilar con información de depuración: `fbc -g <archivo.bas>`.
2. Usar `gdb` para rastrear fallos de segmentación o errores de memoria.
3. Insertar `Print` estratégicos para rastrear el flujo de variables.

## Habilidad 4: Uso de Punteros Seguros
**Regla**:
*   Siempre inicializar punteros a `0` o `Null`.
*   Verificar `If myPtr <> 0 Then` antes de desreferenciar.
*   Liberar memoria con `Deallocate` solo si fue asignada con `Allocate` o `Callocate`.

---
*Guía de procedimientos internos para Manus AI.*
