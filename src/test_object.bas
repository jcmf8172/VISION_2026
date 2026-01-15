' VISION_2026: test_object.bas
' Prueba de las propiedades Name e ID (Usando TObject.bi consolidado)

#include "TObject.bi"

' Clase derivada para probar la sobreescritura de Name
Type TDerived Extends TObject
    Declare Virtual Property Name() As String Override
End Type

Virtual Property TDerived.Name() As String
    Return "TDerived"
End Property

' --- Programa Principal ---
Print "--- VISION_2026: Consolidated Object Test ---"

Dim As TObject Ptr obj1 = New TObject
Dim As TObject Ptr obj2 = New TDerived

Print "Objeto 1 (Base):"
Print "  Name: " & obj1->Name
Print "  ID  : " & obj1->ID
Print "  Full: "; : obj1->Show()

Print ""
Print "Objeto 2 (Derivado):"
Print "  Name: " & obj2->Name
Print "  ID  : " & obj2->ID
Print "  Full: "; : obj2->Show()

Delete obj1
Delete obj2

Print ""
Print "Prueba completada. Presiona una tecla..."
Sleep
