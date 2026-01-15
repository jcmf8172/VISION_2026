' VISION_2026: TPoint.bi
' Objeto para representar coordenadas (X, Y) heredando de TObject

#ifndef __TPOINT_BI__
#define __TPOINT_BI__

#include "TObject.bi"

' --- Definicion de la Clase ---
Type TPoint Extends TObject
    As Integer X, Y
    
    Declare Constructor()
    Declare Constructor(ByVal nX As Integer, ByVal nY As Integer)
    Declare Virtual Destructor() Override
    
    ' Sobreescritura de propiedades base
    Declare Virtual Property Name() As String Override
    Declare Virtual Function ToString() As String Override
    
    ' Metodos especificos
    Declare Sub Set(ByVal nX As Integer, ByVal nY As Integer)
End Type

' --- Implementacion de la Clase ---

Constructor TPoint()
    This.X = 0
    This.Y = 0
End Constructor

Constructor TPoint(ByVal nX As Integer, ByVal nY As Integer)
    This.X = nX
    This.Y = nY
End Constructor

Virtual Destructor TPoint()
End Destructor

Virtual Property TPoint.Name() As String
    Return "TPoint"
End Property

Virtual Function TPoint.ToString() As String
    Return "[" & This.Name & " (" & This.X & ", " & This.Y & ") ID: " & This.ID & "]"
End Function

Sub TPoint.Set(ByVal nX As Integer, ByVal nY As Integer)
    This.X = nX
    This.Y = nY
End Sub

#endif
