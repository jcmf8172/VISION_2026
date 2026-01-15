' VISION_2026: test_rect.bas
' Prueba del objeto TRect y sus funcionalidades

#include "TRect.bi"

Print "--- VISION_2026: TRect Test ---"

' Prueba de constructor con coordenadas
Dim As TRect Ptr r1 = New TRect(10, 10, 50, 40)
Print "Rectangulo 1 (10,10 a 50,40):"
Print "  Name  : " & r1->Name
Print "  ID    : " & r1->ID
Print "  Ancho : " & r1->Width()
Print "  Alto  : " & r1->Height()

' Prueba de Contains
' Corregido: Inicializacion correcta de TPoint
Dim As TPoint __pTest = TPoint(20, 20)
Print ""
Print "Verificando punto (20, 20) dentro de R1:"
If r1->Contains(__pTest) Then
    Print "  Resultado: El punto esta DENTRO"
Else
    Print "  Resultado: El punto esta FUERA"
End If

' Prueba de constructor de copia
Dim As TRect Ptr r2 = New TRect(*r1)
Print ""
Print "Rectangulo 2 (Copia de R1):"
Print "  Ancho : " & r2->Width()
Print "  Alto  : " & r2->Height()

' Prueba de Intersects
Dim As TRect __rCol = TRect(40, 30, 80, 60) ' Colisiona con R1
Dim As TRect __rFar = TRect(100, 100, 150, 150) ' No colisiona

Print ""
Print "Verificando interseccion con R1:"
If r1->Intersects(__rCol) Then
    Print "  Resultado con RCol (40,30 a 80,60): COLISIONA"
Else
    Print "  Resultado con RCol (40,30 a 80,60): NO COLISIONA"
End If

If r1->Intersects(__rFar) Then
    Print "  Resultado con RFar (100,100 a 150,150): COLISIONA"
Else
    Print "  Resultado con RFar (100,100 a 150,150): NO COLISIONA"
End If

' Prueba de Union
Dim As TRect __rUnion = r1->GetUnion(__rFar)
Print ""
Print "Verificando Union de R1 y RFar:"
Print "  R1   : (10,10) a (50,40)"
Print "  RFar : (100,100) a (150,150)"
Print "  Union: (" & __rUnion._A._X & "," & __rUnion._A._Y & ") a (" & __rUnion._B._X & "," & __rUnion._B._Y & ")"
Print "  Ancho Union: " & __rUnion.Width()
Print "  Alto Union : " & __rUnion.Height()

Delete r1
Delete r2

Print ""
Print "Prueba de TRect completada. Presiona una tecla..."
Sleep
