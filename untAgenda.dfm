object frmAgenda: TfrmAgenda
  Left = 0
  Top = 0
  Caption = 'Agenda'
  ClientHeight = 484
  ClientWidth = 914
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object sgridAgenda: TStringGrid
    Left = 277
    Top = 8
    Width = 627
    Height = 465
    ColCount = 1
    FixedCols = 0
    RowCount = 56
    ScrollBars = ssNone
    TabOrder = 0
    OnDblClick = sgridAgendaDblClick
    ColWidths = (
      64)
    RowHeights = (
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24
      24)
  end
  object mcDataAgenda: TMonthCalendar
    Left = 8
    Top = 8
    Width = 225
    Height = 160
    Date = 43138.401332534720000000
    TabOrder = 1
    OnClick = mcDataAgendaClick
  end
  object Button1: TButton
    Left = 32
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 2
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 32
    Top = 320
    Width = 193
    Height = 120
    DataSource = frmDmAgenda.dtsAgDia
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
end
