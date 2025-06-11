object frmDmAgenda: TfrmDmAgenda
  OldCreateOrder = False
  Height = 448
  Width = 350
  object Connection_Agenda: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=39246100;Persist Security Info=True' +
      ';User ID=gpsi;Initial Catalog=gpsi;Data Source=192.168.0.12;Use ' +
      'Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Wor' +
      'kstation ID=DESKTOP-C3JCSL2;Use Encryption for Data=False;Tag wi' +
      'th column collation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 56
    Top = 24
  end
  object dsAgDia: TADODataSet
    Connection = Connection_Agenda
    CursorType = ctStatic
    CommandText = 
      'SELECT'#13#10'CMP_AGENDA.ID_AGENDA,'#13#10'CMP_AGENDA.DATAATEND,'#13#10'CMP_AGENDA' +
      '.HORAATEND, '#13#10'CMP_PACIENTE.ID_PACIENTE,'#13#10'CMP_PACIENTE.NOME,'#13#10'CMP' +
      '_PACIENTE.CARTAO,'#13#10'CMP_AGENDA.PROFISSIONAL AS ID_PRESTADOR, '#13#10'CM' +
      'P_PROFISSIONAL.NOME AS PRESTADOR'#13#10'FROM CMP_AGENDA'#13#10'INNER JOIN CM' +
      'P_PACIENTE ON CMP_PACIENTE.ID_PACIENTE = CMP_AGENDA.PACIENTE'#13#10'IN' +
      'NER JOIN CMP_PROFISSIONAL ON CMP_PROFISSIONAL.ID_PROFISSIONAL = ' +
      'CMP_AGENDA.PROFISSIONAL'#13#10'WHERE CMP_AGENDA.DATAATEND LIKE :dtcale' +
      'ndario'#13#10' '
    Parameters = <
      item
        Name = 'dtcalendario'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    Left = 32
    Top = 104
  end
  object dspAgDia: TDataSetProvider
    DataSet = dsAgDia
    Left = 88
    Top = 104
  end
  object cdsAgDia: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAgDia'
    Left = 144
    Top = 104
    object cdsAgDiaID_AGENDA: TAutoIncField
      DisplayLabel = 'Id:'
      FieldName = 'ID_AGENDA'
      ReadOnly = True
    end
    object cdsAgDiaDATAATEND: TWideStringField
      DisplayLabel = 'Agendado para:'
      FieldName = 'DATAATEND'
      Size = 10
    end
    object cdsAgDiaID_PACIENTE: TAutoIncField
      DisplayLabel = 'Cliente:'
      FieldName = 'ID_PACIENTE'
      ReadOnly = True
    end
    object cdsAgDiaNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 50
    end
    object cdsAgDiaCARTAO: TStringField
      DisplayLabel = 'C'#243'digo:'
      FieldName = 'CARTAO'
      ProviderFlags = []
      Size = 25
    end
    object cdsAgDiaID_PRESTADOR: TIntegerField
      FieldName = 'ID_PRESTADOR'
    end
    object cdsAgDiaPRESTADOR: TStringField
      DisplayLabel = 'Prestador:'
      FieldName = 'PRESTADOR'
      ProviderFlags = []
      Size = 50
    end
    object cdsAgDiaHORAATEND: TStringField
      DisplayLabel = 'Hor'#225'rio:'
      FieldName = 'HORAATEND'
      FixedChar = True
      Size = 6
    end
  end
  object dtsAgDia: TDataSource
    DataSet = cdsAgDia
    Left = 200
    Top = 104
  end
  object dsAgPrest: TADODataSet
    Connection = Connection_Agenda
    CursorType = ctStatic
    CommandText = 
      'SELECT *'#13#10',NOME AS PROFISSIONAL'#13#10'FROM CMP_PROFISSIONAL'#13#10'ORDER BY' +
      ' NOME'
    Parameters = <>
    Left = 32
    Top = 176
  end
  object dsAgInfo: TADODataSet
    Connection = Connection_Agenda
    CursorType = ctStatic
    CommandText = 
      'SELECT'#13#10'ID_AGENDA'#13#10',DATAATEND'#13#10',HORAATEND'#13#10',PACIENTE'#13#10',PROFISSIO' +
      'NAL'#13#10'FROM CMP_AGENDA'
    Parameters = <>
    Left = 32
    Top = 240
  end
  object dspAgPrest: TDataSetProvider
    DataSet = dsAgPrest
    Left = 88
    Top = 176
  end
  object dspAgInfo: TDataSetProvider
    DataSet = dsAgInfo
    Left = 88
    Top = 240
  end
  object cdsAgPrest: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAgPrest'
    Left = 144
    Top = 176
    object cdsAgPrestID_PROFISSIONAL: TAutoIncField
      FieldName = 'ID_PROFISSIONAL'
      ReadOnly = True
    end
    object cdsAgPrestID_TIPOPROFISSIONAL: TIntegerField
      FieldName = 'ID_TIPOPROFISSIONAL'
    end
    object cdsAgPrestNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object cdsAgPrestATIVO: TIntegerField
      FieldName = 'ATIVO'
    end
    object cdsAgPrestPROFISSIONAL: TStringField
      FieldName = 'PROFISSIONAL'
      Size = 50
    end
  end
  object cdsAgInfo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAgInfo'
    Left = 144
    Top = 240
    object cdsAgInfoID_AGENDA: TAutoIncField
      FieldName = 'ID_AGENDA'
      ReadOnly = True
    end
    object cdsAgInfoPACIENTE: TIntegerField
      FieldName = 'PACIENTE'
    end
    object cdsAgInfoPROFISSIONAL: TIntegerField
      FieldName = 'PROFISSIONAL'
    end
  end
  object dtsAgPrest: TDataSource
    DataSet = cdsAgPrest
    Left = 200
    Top = 176
  end
  object dsAgID: TADODataSet
    Connection = Connection_Agenda
    CursorType = ctStatic
    CommandText = 'SELECT * FROM CMP_AGENDA'
    Parameters = <>
    Left = 32
    Top = 312
  end
  object dtsAgInfo: TDataSource
    DataSet = cdsAgInfo
    Left = 200
    Top = 240
  end
  object dspAgID: TDataSetProvider
    DataSet = dsAgID
    Left = 88
    Top = 312
  end
  object cdsAgID: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAgID'
    Left = 152
    Top = 312
    object cdsAgIDID_AGENDA: TAutoIncField
      FieldName = 'ID_AGENDA'
      ReadOnly = True
    end
    object cdsAgIDDATAATEND: TWideStringField
      FieldName = 'DATAATEND'
      Size = 10
    end
    object cdsAgIDHORAATEND: TStringField
      FieldName = 'HORAATEND'
      FixedChar = True
      Size = 6
    end
    object cdsAgIDPROFISSIONAL: TIntegerField
      FieldName = 'PROFISSIONAL'
    end
    object cdsAgIDPACIENTE: TIntegerField
      FieldName = 'PACIENTE'
    end
  end
  object dtsAgID: TDataSource
    DataSet = cdsAgID
    Left = 216
    Top = 312
  end
  object dsAgCliente: TADODataSet
    Connection = Connection_Agenda
    CursorType = ctStatic
    CommandText = 
      'DECLARE @PCLIENTE VARCHAR(100)'#13#10#13#10'SET @PCLIENTE = :cliente'#13#10#13#10'SE' +
      'LECT * FROM CMP_PACIENTE'#13#10'WHERE (NOME LIKE @PCLIENTE OR CARTAO L' +
      'IKE @PCLIENTE)'#13#10
    Parameters = <
      item
        Name = 'cliente'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    Left = 32
    Top = 368
  end
  object dspAgCliente: TDataSetProvider
    DataSet = dsAgCliente
    Left = 96
    Top = 368
  end
  object cdsAgCliente: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'cliente'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspAgCliente'
    Left = 160
    Top = 368
    object cdsAgClienteNOME: TStringField
      DisplayWidth = 45
      FieldName = 'NOME'
      Size = 50
    end
    object cdsAgClienteCARTAO: TStringField
      DisplayWidth = 30
      FieldName = 'CARTAO'
      Size = 25
    end
    object cdsAgClienteID_PACIENTE: TAutoIncField
      FieldName = 'ID_PACIENTE'
      ReadOnly = True
    end
  end
  object dtsAgCliente: TDataSource
    DataSet = cdsAgCliente
    Left = 224
    Top = 368
  end
end
