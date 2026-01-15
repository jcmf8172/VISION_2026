' VISION_2026: TObject.bas
' Implementacion de TObject con propiedades Name e ID

#include "TObject.bi"

Constructor TObject()
End Constructor

Virtual Destructor TObject()
End Destructor

' Propiedad Name: Devuelve el nombre de la clase
Virtual Property TObject.Name() As String
    Return "TObject"
End Property

' Propiedad ID: Devuelve la direccion de memoria en Hexadecimal
Virtual Property TObject.ID() As String
    Return "&H" & Hex(@This)
End Property

Virtual Function TObject.ToString() As String
    Return "[" & This.Name & " ID: " & This.ID & "]"
End Function

Sub TObject.Show()
    Print This.ToString()
End Sub
