unit uFormPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TFormPrincipal = class(TForm)
    mm1: TMainMenu;
    Parcelamento1: TMenuItem;
    procedure Parcelamento1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

uses
  uFormSistemaPagamentoUnico;

{$R *.dfm}

procedure TFormPrincipal.Parcelamento1Click(Sender: TObject);
begin
  if not Assigned(FormSistemaPagamentoUnico) then
  begin
    FormSistemaPagamentoUnico := TFormSistemaPagamentoUnico.Create(Self);
  end;
  FormSistemaPagamentoUnico.Show;
end;

end.
