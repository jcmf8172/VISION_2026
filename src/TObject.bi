' VISION_2026: TObject.bi
' Clase base fundamental (Definicion e Implementacion consolidadas)

#ifndef __TOBJECT_BI__
#define __TOBJECT_BI__

' --- Definicion de la Clase ---
Type TObject Extends Object
    Declare Constructor()
    Declare Virtual Destructor()
    
    ' Propiedades de solo lectura
    Declare Virtual Property Name() As String
    Declare Virtual Property ID() As String
    
    ' Metodos base
    Declare Virtual Function ToString() As String
    Declare Sub Show()
End Type

' --- Implementacion de la Clase ---

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

#endif
