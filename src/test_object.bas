' VISION_2026: test_object.bas
' Prueba de la jerarquia TObject

#include "TObject.bas"

' Definimos una clase derivada para probar la herencia
Type TDerived Extends TObject
    Declare Constructor()
    Declare Virtual Function GetClassName() As String Override
    Declare Virtual Function ToString() As String Override
End Type

Constructor TDerived()
    ' Constructor de TDerived
End Constructor

Virtual Function TDerived.GetClassName() As String
    Return "TDerived"
End Function

Virtual Function TDerived.ToString() As String
    Return "Hola desde " & This.GetClassName()
End Function

' --- Programa Principal ---
Print "--- VISION_2026: Object System Test ---"

Dim As TObject Ptr obj1 = New TObject
Dim As TObject Ptr obj2 = New TDerived ' Polimorfismo

Print "Objeto 1 (Base):"
obj1->Show()

Print ""
Print "Objeto 2 (Derivado via Puntero Base):"
obj2->Show()

Print ""
Print "Verificando RTTI (Is):"
If *obj2 Is TDerived Then
    Print "Confirmado: obj2 es una instancia de TDerived"
End If

Delete obj1
Delete obj2

Print ""
Print "Prueba completada. Presiona una tecla..."
Sleep
