# Guía de Optimización para FreeBASIC 64 bits (x86_64)

Esta guía recopila las mejores prácticas y técnicas de optimización para el desarrollo en FreeBASIC 1.10.1 bajo arquitectura de 64 bits.

## 1. Optimizaciones del Compilador (fbc)

El compilador de FreeBASIC para 64 bits utiliza el backend de C (`-gen gcc`) por defecto. Esto permite aprovechar las potentes optimizaciones de GCC.

| Flag | Descripción | Recomendación |
| :--- | :--- | :--- |
| `-O 2` o `-O 3` | Niveles de optimización de GCC. | Usar `-O 3` para versiones finales de alto rendimiento. |
| `-march=native` | Optimiza el código para la CPU actual. | Útil para ejecuciones locales de alto rendimiento. |
| `-ffast-math` | Permite optimizaciones matemáticas agresivas. | Usar solo si la precisión decimal extrema no es crítica. |
| `-fpu sse` | Fuerza el uso de instrucciones SSE para punto flotante. | Estándar y recomendado en 64 bits. |

## 2. Diferencias Clave 32-bit vs 64-bit

*   **Tamaño de Punteros**: En 64 bits, los punteros (`Any Ptr`, `String Ptr`, etc.) ocupan 8 bytes en lugar de 4.
*   **Integer vs Long**: 
    *   `Integer` cambia de tamaño (4 bytes en 32-bit, 8 bytes en 64-bit).
    *   `Long` siempre es de 4 bytes en ambas arquitecturas.
    *   **Regla de Oro**: Usar `Integer` para índices y contadores que requieran el máximo rendimiento nativo.
*   **Registros**: x86_64 ofrece 16 registros de propósito general (frente a 8 en x86), lo que reduce el acceso a memoria.

## 3. Técnicas de Programación Eficiente

*   **Evitar Llamadas Virtuales**: En bucles críticos, minimizar el uso de métodos virtuales o polimorfismo complejo.
*   **Precomputación**: Calcular valores constantes fuera de los bucles.
*   **Alineación de Datos**: Asegurar que las estructuras (`Type`) estén alineadas para evitar penalizaciones de acceso a memoria.
*   **Inline Assembler**: El ensamblador en línea en 64 bits usa la sintaxis de registros de 64 bits (RAX, RBX, etc.). Nota: `asm` puede limitar algunas optimizaciones de GCC.

## 4. Manejo de Memoria

*   Usar `Allocate` / `Deallocate` para gestión manual si el rendimiento de los arrays dinámicos de FB no es suficiente.
*   En 64 bits, el espacio de direccionamiento es virtualmente ilimitado para aplicaciones estándar, pero el acceso a caché sigue siendo el cuello de botella principal.

---
*Documento generado por Manus AI para el proyecto VISION_2026.*
