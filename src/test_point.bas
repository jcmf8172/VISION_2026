' VISION_2026: test_point.bas
' Prueba de TPoint con nuevas convenciones

#include "TPoint.bi"

Print "--- VISION_2026: TPoint Refactored Test ---"

' Prueba de constructor con valores por defecto
Dim As TPoint Ptr p1 = New TPoint()
Print "Punto 1 (Default 0,0): "; : p1->Show()

' Prueba de constructor con parametros
Dim As TPoint Ptr p2 = New TPoint(100, 200)
Print "Punto 2 (100,200): "; : p2->Show()

' Prueba de constructor de copia
Dim As TPoint Ptr p3 = New TPoint(*p2)
Print "Punto 3 (Copia de P2): "; : p3->Show()

' Verificacion de variables internas (solo para test)
Print ""
Print "Acceso a variables internas (convencion _):"
Print "  P2._X = " & p2->_X
Print "  P2._Y = " & p2->_Y

Delete p1
Delete p2
Delete p3

Print ""
Print "Prueba completada. Presiona una tecla..."
Sleep
