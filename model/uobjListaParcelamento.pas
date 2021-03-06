unit uobjListaParcelamento;

interface

uses Classes, uobjParcelamento, Dialogs;

Type
  TListaParcelamento = class
  private
    { private declarations }
    FListaParcelamento : TList;
  protected
    { protected declarations }
  public
    { public declarations }
    constructor Create;
    procedure setAdd(vParcela: TobjParcelamento);
    procedure Remover(Index: Integer);
    function Count: Integer;
  published
    { published declarations }
end;

implementation

{ TListaParcelamento }

procedure TListaParcelamento.setAdd(vParcela: TobjParcelamento);
begin
  FListaParcelamento.Add(TobjParcelamento);
end;

function TListaParcelamento.Count: Integer;
begin
  Result := FListaParcelamento.Count;
end;

constructor TListaParcelamento.Create;
begin
  inherited Create;
  FListaParcelamento := TList.Create;
end;

procedure TListaParcelamento.Remover(Index: Integer);
begin
  if Index < Count then
     FListaParcelamento.Delete(Index)
  else
    ShowMessage('Item n�o encontrado!');
end;

end.
