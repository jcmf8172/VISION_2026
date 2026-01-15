' VISION_2026: Demostración de Programación Avanzada
' Uso de Punteros, Gestión de Memoria y Optimización

#include "crt.bi" ' Para usar funciones de C como printf o memcpy si fuera necesario

Sub ProcesarDatos(ByVal buffer As UByte Ptr, ByVal tamaño As Integer)
    Print "Procesando buffer de " & tamaño & " bytes..."
    
    ' Optimizamos usando un puntero nativo para recorrer la memoria
    Dim As Integer i
    For i = 0 To tamaño - 1
        buffer[i] = buffer[i] Xor &HFF ' Operación bitwise rápida
    Next i
    
    Print "Proceso completado."
End Sub

' --- Programa Principal ---
Dim As Integer n = 1024 * 1024 ' 1 MB de datos
Dim As UByte Ptr miBuffer = Allocate(n)

If miBuffer = 0 Then
    Print "Error: No se pudo asignar memoria."
    End 1
End If

Print "--- VISION_2026: Advanced Demo ---"
Print "Memoria asignada en: " & miBuffer

' Llenar buffer con datos de prueba
For i As Integer = 0 To n - 1
    miBuffer[i] = i Mod 256
Next i

Dim As Double t1 = Timer
ProcesarDatos(miBuffer, n)
Dim As Double t2 = Timer

Print "Tiempo de ejecución: " & (t2 - t1) & " segundos."

' Liberar memoria (Buena práctica)
Deallocate(miBuffer)
Print "Memoria liberada. Presiona una tecla..."
Sleep
