' VISION_2026: TRect.bi
' Objeto para representar areas rectangulares heredando de TObject

#ifndef __TRECT_BI__
#define __TRECT_BI__

#include "TObject.bi"
#include "TPoint.bi"

' --- Definicion de la Clase ---
Type TRect Extends TObject
    As TPoint _A, _B ' Puntos superior-izquierdo (A) e inferior-derecho (B)
    
    ' Constructor con valores por defecto
    Declare Constructor(ByVal vAX As Integer = 0, ByVal vAY As Integer = 0, ByVal vBX As Integer = 0, ByVal vBY As Integer = 0)
    ' Constructor usando objetos TPoint
    Declare Constructor(ByRef vA As TPoint, ByRef vB As TPoint)
    ' Constructor de copia
    Declare Constructor(ByRef vRect As TRect)
    
    Declare Virtual Destructor() Override
    
    ' Sobreescritura de propiedades base
    Declare Virtual Property Name() As String Override
    
    ' Metodos especificos
    Declare Sub Set(ByVal vAX As Integer, ByVal vAY As Integer, ByVal vBX As Integer, ByVal vBY As Integer)
    Declare Function Width() As Integer
    Declare Function Height() As Integer
    Declare Function Contains(ByRef vPoint As TPoint) As Boolean
End Type

' --- Implementacion de la Clase ---

' Constructor con coordenadas individuales
Constructor TRect(ByVal vAX As Integer = 0, ByVal vAY As Integer = 0, ByVal vBX As Integer = 0, ByVal vBY As Integer = 0)
    Base()
    This._A.Set(vAX, vAY)
    This._B.Set(vBX, vBY)
End Constructor

' Constructor con objetos TPoint
Constructor TRect(ByRef vA As TPoint, ByRef vB As TPoint)
    Base()
    This._A = vA
    This._B = vB
End Constructor

' Constructor de copia
Constructor TRect(ByRef vRect As TRect)
    Base()
    This._A = vRect._A
    This._B = vRect._B
End Constructor

Virtual Destructor TRect()
End Destructor

Virtual Property TRect.Name() As String
    Return "TRect"
End Property

Sub TRect.Set(ByVal vAX As Integer, ByVal vAY As Integer, ByVal vBX As Integer, ByVal vBY As Integer)
    This._A.Set(vAX, vAY)
    This._B.Set(vBX, vBY)
End Sub

Function TRect.Width() As Integer
    Return This._B._X - This._A._X
End Function

Function TRect.Height() As Integer
    Return This._B._Y - This._A._Y
End Function

Function TRect.Contains(ByRef vPoint As TPoint) As Boolean
    If vPoint._X >= This._A._X And vPoint._X <= This._B._X Then
        If vPoint._Y >= This._A._Y And vPoint._Y <= This._B._Y Then
            Return True
        End If
    End If
    Return False
End Function

#endif
