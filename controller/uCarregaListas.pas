unit uCarregaListas;

interface

uses
  System.Classes;

type
  TCarregaLista<T> = class
    class procedure PopulaLista(Value : TStrings);
  end;

implementation

uses
  System.TypInfo, System.SysUtils, Vcl.Dialogs;

{ TEnumUtils<T> }

class procedure TCarregaLista<T>.PopulaLista(Value: TStrings);
var
  Aux: String;
  I, Posicao: Integer;
begin
  Value.Clear;
  I := 0;
  try
    repeat
      //GetEnumName - recebe uma posicao para pegar um nome
      Aux := Trim(GetEnumName(TypeInfo(T), I));
      Posicao := GetEnumValue(TypeInfo(T), Aux);
      if Posicao <> -1 then Value.Add(Aux);
      Inc(I);
    until Posicao < 0;
  Except
    on E: Exception do
      showMessage(E.ClassName +' - '+ E.Message);
  end;
end;
end.
