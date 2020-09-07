object FormSistemaPagamentoUnico: TFormSistemaPagamentoUnico
  Left = 0
  Top = 0
  Caption = 'Parcelamento'
  ClientHeight = 323
  ClientWidth = 562
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pnlRodape: TPanel
    Left = 0
    Top = 320
    Width = 562
    Height = 3
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 432
    ExplicitWidth = 717
  end
  object dbgrdGrid: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 108
    Width = 556
    Height = 209
    Align = alClient
    DataSource = DataSource
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 562
    Height = 105
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitLeft = 96
    ExplicitTop = 40
    ExplicitWidth = 687
    object lblCapital: TLabel
      Left = 8
      Top = 63
      Width = 33
      Height = 13
      Caption = 'Capital'
    end
    object lblTaxaJuros: TLabel
      Left = 121
      Top = 63
      Width = 68
      Height = 13
      Caption = 'Taxa de Juros'
    end
    object lblre: TLabel
      Left = 8
      Top = 18
      Width = 86
      Height = 13
      Caption = 'Regras de Calculo'
    end
    object lblMeses: TLabel
      Left = 211
      Top = 64
      Width = 30
      Height = 13
      Caption = 'Meses'
    end
    object edtCapital: TCurrencyEdit
      Left = 8
      Top = 79
      Width = 105
      Height = 21
      TabOrder = 1
    end
    object edtTaxaJuros: TCurrencyEdit
      Left = 119
      Top = 79
      Width = 82
      Height = 21
      DisplayFormat = ',0.00; '
      TabOrder = 2
    end
    object btnCalcular: TButton
      Left = 257
      Top = 77
      Width = 137
      Height = 25
      Caption = 'Calcular'
      TabOrder = 4
      OnClick = btnCalcularClick
    end
    object cbbListaRegras: TComboBox
      Left = 8
      Top = 36
      Width = 249
      Height = 21
      TabOrder = 0
      Text = 'Selecione'
    end
    object edtMeses: TEdit
      Left = 209
      Top = 79
      Width = 41
      Height = 21
      TabOrder = 3
      Text = '0'
    end
  end
  object ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 408
  end
  object DataSource: TDataSource
    DataSet = ClientDataSet
    Left = 472
  end
end
