object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'Sistema de Amortiza'#231#227'o de Juros'
  ClientHeight = 442
  ClientWidth = 700
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mm1
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object mm1: TMainMenu
    Left = 8
    Top = 8
    object Parcelamento1: TMenuItem
      Caption = 'Parcelamento'
      OnClick = Parcelamento1Click
    end
  end
end
