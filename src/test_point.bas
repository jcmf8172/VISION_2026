' VISION_2026: test_point.bas
' Prueba del objeto TPoint y su herencia de TObject

#include "TPoint.bi"

Print "--- VISION_2026: TPoint Test ---"

' Prueba de constructor por defecto
Dim As TPoint Ptr p1 = New TPoint
Print "Punto 1 (Default): "; : p1->Show()

' Prueba de constructor con parametros
Dim As TPoint Ptr p2 = New TPoint(100, 200)
Print "Punto 2 (Parametros): "; : p2->Show()

' Prueba de modificacion
p1->Set(50, 75)
Print "Punto 1 (Modificado): "; : p1->Show()

' Verificacion de herencia y propiedades base
Print ""
Print "Verificando propiedades de TObject en TPoint:"
Print "  Nombre del objeto: " & p2->Name
Print "  ID del objeto    : " & p2->ID

Delete p1
Delete p2

Print ""
Print "Prueba de TPoint completada. Presiona una tecla..."
Sleep
