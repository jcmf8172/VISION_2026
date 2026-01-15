' VISION_2026: Demostracion de Programacion Avanzada
' Uso de Punteros, Gestion de Memoria y Optimizacion

#include "crt.bi"

Sub ProcesarDatos(ByVal buffer As UByte Ptr, ByVal tamano As Integer)
    Print "Procesando buffer de " & tamano & " bytes..."
    
    ' Optimizamos usando un puntero nativo para recorrer la memoria
    Dim As Integer i
    For i = 0 To tamano - 1
        buffer[i] = buffer[i] Xor &HFF ' Operacion bitwise rapida
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

Print "--- VISION_2026: Advanced Demo (64-bit Optimized) ---"
Print "Memoria asignada en: " & miBuffer

' Llenar buffer con datos de prueba
For i As Integer = 0 To n - 1
    miBuffer[i] = i Mod 256
Next i

Dim As Double t1 = Timer
ProcesarDatos(miBuffer, n)
Dim As Double t2 = Timer

Print "Tiempo de ejecucion: " & (t2 - t1) & " segundos."

' Liberar memoria
Deallocate(miBuffer)
Print "Memoria liberada. Presiona una tecla..."
Sleep
