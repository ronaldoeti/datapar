unit uobjParcelamento;

interface

type
  TobjParcelamento = class
  private
    FSaldoDevedor: Extended;
    FJuros: Extended;
    FPagamento: Extended;
    FPeriodo: Integer;
    FAmortizacao: Extended;

    {$Region 'Gets'}
    function GetAmortizacao: Extended;
    function GetJuros: Extended;
    function GetPagamento: Extended;
    function GetPeriodo: Integer;
    function GetSaldoDevedor: Extended;
    {$EndRegion}

    {$Region 'Sets'}
    procedure SetAmortizacao(const Value: Extended);
    procedure SetJuros(const Value: Extended);
    procedure SetPagamento(const Value: Extended);
    procedure SetPeriodo(const Value: Integer);
    procedure SetSaldoDevedor(const Value: Extended);
    {$EndRegion}
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
    constructor Create; virtual;
    destructor Destroy; override;

  published
    property Periodo: Integer
       read GetPeriodo write SetPeriodo;
    property Juros: Extended
      read GetJuros write SetJuros;
    property Amortizacao: Extended
      read GetAmortizacao write SetAmortizacao;
    property Pagamento: Extended
      read GetPagamento write SetPagamento;
    property SaldoDevedor: Extended
      read GetSaldoDevedor write SetSaldoDevedor;
  end;

implementation

{ TobjParcelamento }

constructor TobjParcelamento.Create;
begin
  FSaldoDevedor:= 0;
  FJuros:=0;
  FPagamento:=0;
  FPeriodo:=0;
  FAmortizacao:=0;
end;

destructor TobjParcelamento.Destroy;
begin

  inherited;
end;

function TobjParcelamento.GetAmortizacao: Extended;
begin
  Result := FAmortizacao;
end;

function TobjParcelamento.GetJuros: Extended;
begin
  Result := FJuros;
end;

function TobjParcelamento.GetPagamento: Extended;
begin
  Result := FPagamento;
end;

function TobjParcelamento.GetPeriodo: Integer;
begin
  Result := FPeriodo;
end;

function TobjParcelamento.GetSaldoDevedor: Extended;
begin
  Result := FSaldoDevedor;
end;

procedure TobjParcelamento.SetAmortizacao(const Value: Extended);
begin
  FAmortizacao := Value;
end;

procedure TobjParcelamento.SetJuros(const Value: Extended);
begin
  FJuros := Value;
end;

procedure TobjParcelamento.SetPagamento(const Value: Extended);
begin
  FPagamento := Value;
end;

procedure TobjParcelamento.SetPeriodo(const Value: Integer);
begin
  FPeriodo := Value;
end;

procedure TobjParcelamento.SetSaldoDevedor(const Value: Extended);
begin
  FSaldoDevedor := Value;
end;

end.
