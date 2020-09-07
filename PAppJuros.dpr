program PAppJuros;

uses
  Vcl.Forms,
  uFormPrincipal in 'view\uFormPrincipal.pas' {FormPrincipal},
  uobjParcelamento in 'model\uobjParcelamento.pas',
  uobjListaRegrasCalculo in 'model\uobjListaRegrasCalculo.pas',
  uobjListaParcelamento in 'model\uobjListaParcelamento.pas',
  uCarregaListas in 'controller\uCarregaListas.pas',
  uFormSistemaPagamentoUnico in 'view\uFormSistemaPagamentoUnico.pas' {FormSistemaPagamentoUnico};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
