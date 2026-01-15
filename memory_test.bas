' Programa: memory_test.bas
' Propósito: Demostrar la lectura de la memoria de trabajo desde FreeBASIC

Dim As Integer fileNum
Dim As String lineContent
Dim As String memoryPath = "MEMORY/working/current_context.json"

Print "--------------------------------------------"
Print "   VISION_2026: LECTOR DE MEMORIA IA"
Print "--------------------------------------------"
Print "Accediendo a: " & memoryPath
Print ""

fileNum = FreeFile()

If Open(memoryPath For Input As #fileNum) = 0 Then
    Print "Contenido de la Memoria de Trabajo:"
    Print "--------------------------------------------"
    While Not Eof(fileNum)
        Line Input #fileNum, lineContent
        Print lineContent
    Wend
    Close #fileNum
Else
    Print "ERROR: No se pudo acceder al archivo de memoria."
End If

Print "--------------------------------------------"
Print "Lectura completada con éxito."
Print "Presiona una tecla para finalizar..."
Sleep
