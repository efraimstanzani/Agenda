object frmAgendamento: TfrmAgendamento
  Left = 0
  Top = 0
  Caption = 'Agendar'
  ClientHeight = 311
  ClientWidth = 476
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
  object Label2: TLabel
    Left = 16
    Top = 8
    Width = 14
    Height = 13
    Caption = 'Id:'
    FocusControl = DBEdit3
  end
  object Label1: TLabel
    Left = 80
    Top = 8
    Width = 78
    Height = 13
    Caption = 'Agendado para:'
    FocusControl = DBEdit3
  end
  object Label3: TLabel
    Left = 16
    Top = 109
    Width = 51
    Height = 13
    Caption = 'Prestador:'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 192
    Top = 5
    Width = 27
    Height = 13
    Caption = 'Hora:'
    FocusControl = DBEdit3
  end
  object btAgSalvar: TButton
    Left = 346
    Top = 267
    Width = 117
    Height = 34
    Caption = 'SALVAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btAgSalvarClick
  end
  object Button2: TButton
    Left = 8
    Top = 273
    Width = 117
    Height = 25
    Caption = 'DESMARCAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 16
    Top = 24
    Width = 49
    Height = 21
    DataField = 'ID_AGENDA'
    DataSource = frmDmAgenda.dtsAgDia
    Enabled = False
    TabOrder = 2
  end
  object dtpAgenda: TDateTimePicker
    Left = 80
    Top = 24
    Width = 97
    Height = 21
    Date = 43426.591034525460000000
    Time = 43426.591034525460000000
    TabOrder = 3
  end
  object lcbPrestador: TDBLookupComboBox
    Left = 16
    Top = 128
    Width = 250
    Height = 21
    DataField = 'PROFISSIONAL'
    DataSource = frmDmAgenda.dtsAgID
    KeyField = 'ID_PROFISSIONAL'
    ListField = 'NOME'
    ListSource = frmDmAgenda.dtsAgPrest
    TabOrder = 4
  end
  object btnPesquisar: TButton
    Left = 153
    Top = 70
    Width = 24
    Height = 25
    Caption = '...'
    TabOrder = 5
    OnClick = btnPesquisarClick
  end
  object cbhora: TComboBox
    Left = 192
    Top = 24
    Width = 57
    Height = 21
    TabOrder = 6
    Items.Strings = (
      '06:00'
      '06:15'
      '06:30'
      '06:45'
      '07:00'
      '07:15'
      '07:30'
      '07:45'
      '08:00'
      '08:15'
      '08:30'
      '08:45'
      '09:00'
      '09:15'
      '09:30'
      '09:45'
      '10:00'
      '10:15'
      '10:30'
      '10:45'
      '11:00'
      '11:15'
      '11:30'
      '11:45'
      '12:00'
      '12:15'
      '12:30'
      '12:45'
      '13:00'
      '13:15'
      '13:30'
      '13:45'
      '14:00'
      '14:15'
      '14:30'
      '14:45'
      '15:00'
      '15:15'
      '15:30'
      '15:45'
      '16:00'
      '16:15'
      '16:30'
      '16:45'
      '17:00'
      '17:15'
      '17:30'
      '17:45'
      '18:00'
      '18:15'
      '18:30'
      '18:45'
      '19:00')
  end
  object tmePaciente: TMaskEdit
    Left = 16
    Top = 74
    Width = 131
    Height = 21
    EditMask = '999.9999.999999.99-9;1;_'
    MaxLength = 20
    TabOrder = 7
    Text = '   .    .      .  - '
  end
  object nomePaciente: TEdit
    Left = 192
    Top = 72
    Width = 271
    Height = 21
    ReadOnly = True
    TabOrder = 8
    Text = 'nomePaciente'
  end
end
