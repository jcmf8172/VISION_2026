' VISION_2026: TObject.bi
' Clase base fundamental con propiedades Name e ID

#ifndef __TOBJECT_BI__
#define __TOBJECT_BI__

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

#endif
