' VISION_2026: TObject.bas
' Implementacion de la clase base TObject

#include "TObject.bi"

Constructor TObject()
    ' Inicializacion base si fuera necesaria
End Constructor

Virtual Destructor TObject()
    ' Destructor virtual para asegurar la limpieza en clases derivadas
End Destructor

Virtual Function TObject.GetClassName() As String
    Return "TObject"
End Function

Virtual Function TObject.ToString() As String
    Return "[" & This.GetClassName() & " at " & @This & "]"
End Function

Sub TObject.Show()
    Print This.ToString()
End Sub
