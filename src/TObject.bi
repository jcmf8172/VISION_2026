' VISION_2026: TObject.bi
' Clase base fundamental inspirada en Free Vision / Turbo Vision

#ifndef __TOBJECT_BI__
#define __TOBJECT_BI__

' TObject hereda de la clase raiz Object de FreeBASIC para habilitar RTTI y polimorfismo
Type TObject Extends Object
    Declare Constructor()
    Declare Virtual Destructor()
    
    ' Metodos virtuales puros o base
    Declare Virtual Function GetClassName() As String
    Declare Virtual Function ToString() As String
    
    ' Metodo para depuracion
    Declare Sub Show()
End Type

#endif
