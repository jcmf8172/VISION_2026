' VISION_2026: TPoint.bi
' Objeto para representar coordenadas (X, Y) refactorizado

#ifndef __TPOINT_BI__
#define __TPOINT_BI__

#include "TObject.bi"

' --- Definicion de la Clase ---
Type TPoint Extends TObject
    As Integer _X, _Y
    
    ' Constructor con variables inicializadas (evita constructor sin argumentos)
    Declare Constructor(ByVal vX As Integer = 0, ByVal vY As Integer = 0)
    ' Constructor de copia
    Declare Constructor(ByRef vPoint As TPoint)
    
    Declare Virtual Destructor() Override
    
    ' Sobreescritura de propiedades base
    Declare Virtual Property Name() As String Override
    
    ' Metodos especificos
    Declare Sub Set(ByVal vX As Integer, ByVal vY As Integer)
End Type

' --- Implementacion de la Clase ---

' Uso de Base() para llamar al constructor del padre
Constructor TPoint(ByVal vX As Integer = 0, ByVal vY As Integer = 0)
    Base()
    This._X = vX
    This._Y = vY
End Constructor

' Constructor de copia
Constructor TPoint(ByRef vPoint As TPoint)
    Base()
    This._X = vPoint._X
    This._Y = vPoint._Y
End Constructor

Virtual Destructor TPoint()
End Destructor

Virtual Property TPoint.Name() As String
    Return "TPoint"
End Property

Sub TPoint.Set(ByVal vX As Integer, ByVal vY As Integer)
    This._X = vX
    This._Y = vY
End Sub

#endif
