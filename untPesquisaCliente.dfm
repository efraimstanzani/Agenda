object frmPesquisaCliente: TfrmPesquisaCliente
  Left = 0
  Top = 0
  Caption = 'Pesquisar Cliente'
  ClientHeight = 363
  ClientWidth = 488
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 7
    Top = 5
    Width = 197
    Height = 13
    Caption = 'Informe o cart'#227'o ou o nome do paciente:'
  end
  object txtFiltro: TEdit
    Left = 7
    Top = 21
    Width = 473
    Height = 21
    TabOrder = 0
    OnChange = txtFiltroChange
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 48
    Width = 472
    Height = 307
    DataSource = frmDmAgenda.dtsAgCliente
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
  end
end
