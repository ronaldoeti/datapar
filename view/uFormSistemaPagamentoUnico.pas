unit uFormSistemaPagamentoUnico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, RxToolEdit, RxCurrEdit,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, uobjListaRegrasCalculo,
  uobjParcelamento, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Datasnap.DBClient;

type
  TFormSistemaPagamentoUnico = class(TForm)
    pnlRodape: TPanel;
    dbgrdGrid: TDBGrid;
    pnlTop: TPanel;
    lblCapital: TLabel;
    edtCapital: TCurrencyEdit;
    edtTaxaJuros: TCurrencyEdit;
    lblTaxaJuros: TLabel;
    btnCalcular: TButton;
    cbbListaRegras: TComboBox;
    lblre: TLabel;
    edtMeses: TEdit;
    lblMeses: TLabel;
    ClientDataSet: TClientDataSet;
    DataSource: TDataSource;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnCalcularClick(Sender: TObject);
  private
    { Private declarations }
    function CalculaSistemaPagamentoUnico(vCapital, vTaxaJuros: Double; vMeses: Integer): Boolean;
    procedure Configuracoes;
    procedure Instancia;
    function ValidateForm(): Boolean;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  FormSistemaPagamentoUnico: TFormSistemaPagamentoUnico;

implementation

uses
  uCarregaListas, System.Math, System.Generics.Collections;

{$R *.dfm}


procedure TFormSistemaPagamentoUnico.Configuracoes;
begin
  TCarregaLista<TListaRegrasCalculo>.PopulaLista(cbbListaRegras.Items);
end;

procedure TFormSistemaPagamentoUnico.Instancia;
var
  vDisplayFormat : String;
begin
  vDisplayFormat := '#,###,##0.00';
  with ClientDataSet, FieldDefs do
  begin
    if FieldCount = 0 then
    begin
      Clear;
      Add('Periodo',ftInteger);
      Add('Juros',ftFloat);
      Add('Amortizacao',ftFloat);
      Add('Pagamento',ftFloat);
      Add('SaldoDevedor', ftFloat);
      CreateDataSet;
    end;
    TIntegerField(FieldByName('Periodo')).DisplayFormat := '#';
    TFloatField(FieldByName('Juros')).DisplayFormat := vDisplayFormat;
    TFloatField(FieldByName('Amortizacao')).DisplayFormat := vDisplayFormat;
    TFloatField(FieldByName('Pagamento')).DisplayFormat := vDisplayFormat;
    TFloatField(FieldByName('SaldoDevedor')).DisplayFormat := vDisplayFormat;
    TIntegerField(FieldByName('Periodo')).DisplayLabel := 'Periodo';
    TFloatField(FieldByName('Juros')).DisplayLabel := 'Juros';
    TFloatField(FieldByName('Amortizacao')).DisplayLabel := 'Amortiza��o';
    TFloatField(FieldByName('Pagamento')).DisplayLabel := 'Pagamento';
    TFloatField(FieldByName('SaldoDevedor')).DisplayLabel := 'Saldo Devedor';
  end;

end;

function TFormSistemaPagamentoUnico.ValidateForm: Boolean;
begin
  Result := True;

  If edtCapital.Value = 0 Then
  Begin
    messagedlg('Voc� deve inserir o capital!', mtinformation,[mbyes],0);
    edtCapital.SetFocus;
    Result := False;
  end
  else
  If edtTaxaJuros.Value = 0 Then
  Begin
    messagedlg('Voc� deve inserir a Taxa de Juros!', mtinformation,[mbyes],0);
    edtTaxaJuros.SetFocus;
    Result := False;
  end
  else
  If edtMeses.Text = EmptyStr Then
  Begin
    messagedlg('Voc� deve inserir os meses', mtinformation,[mbyes],0);
    edtMeses.SetFocus;
    Result := False;
  end;
end;

procedure TFormSistemaPagamentoUnico.btnCalcularClick(Sender: TObject);
begin
  if ValidateForm then
   case cbbListaRegras.ItemIndex of
     0: CalculaSistemaPagamentoUnico(edtCapital.Value, edtTaxaJuros.Value, StrToInt(edtMeses.Text));
   end;

end;

function TFormSistemaPagamentoUnico.CalculaSistemaPagamentoUnico(vCapital,
  vTaxaJuros: Double; vMeses: Integer): Boolean;
var
  I : Integer;
  vObjParcelamento: TobjParcelamento;
  vTotalJuros: Extended;
begin
  vTotalJuros := 0;
  try
    for I := 0 to vMeses + 1 do
    begin
      vObjParcelamento := TobjParcelamento.Create;
      with vObjParcelamento do
      begin

        if I = 0 then
        begin
          Periodo := 0;
          Juros := 0;
          Amortizacao := 0;
          Pagamento := 0;
          SaldoDevedor := vCapital;
        end
        else if I <= vMeses then
        begin
          Periodo := I;
          Juros :=(((vCapital + vTotalJuros) * (Power((1+(vTaxaJuros/100)), 1))) - (vCapital + vTotalJuros));
          vTotalJuros := vTotalJuros + vObjParcelamento.Juros;
          Amortizacao := 0;
          Pagamento := 0;
          SaldoDevedor := vCapital + vTotalJuros;
        end;


        if (I = vMeses) then
        begin
          Amortizacao := vCapital;
          Pagamento := vCapital + vTotalJuros;
          SaldoDevedor := 0;
        end
        else if(I > vMeses) then
        begin
          Juros := vTotalJuros - Juros ;
          Amortizacao := vCapital;
          Pagamento := vCapital + vTotalJuros;
          SaldoDevedor := 0;
        end;

        {$Region 'Carrega Regis'}
        with ClientDataSet do
        begin
          AppEnd;
          Fieldbyname('Periodo').AsInteger := Periodo;
          Fieldbyname('Juros').AsFloat := Juros;
          Fieldbyname('Amortizacao').AsFloat := Amortizacao;
          Fieldbyname('Pagamento').AsFloat := Pagamento;
          Fieldbyname('SaldoDevedor').AsFloat := SaldoDevedor;
          Post;
        end;
        {$EndRegion}

        FreeAndNil(vObjParcelamento);
      end;
    end;
  finally
  //
  end;
end;

constructor TFormSistemaPagamentoUnico.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Instancia;
  Configuracoes;
end;

destructor TFormSistemaPagamentoUnico.Destroy;
begin

  inherited Destroy;
end;

procedure TFormSistemaPagamentoUnico.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

end.
