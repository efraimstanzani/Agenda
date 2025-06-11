unit DmAgenda;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, Data.Win.ADODB;

type
  TfrmDmAgenda = class(TDataModule)
    Connection_Agenda: TADOConnection;
    dsAgDia: TADODataSet;
    dspAgDia: TDataSetProvider;
    cdsAgDia: TClientDataSet;
    dtsAgDia: TDataSource;
    dsAgPrest: TADODataSet;
    dsAgInfo: TADODataSet;
    dspAgPrest: TDataSetProvider;
    dspAgInfo: TDataSetProvider;
    cdsAgPrest: TClientDataSet;
    cdsAgInfo: TClientDataSet;
    cdsAgPrestID_PROFISSIONAL: TAutoIncField;
    cdsAgPrestID_TIPOPROFISSIONAL: TIntegerField;
    cdsAgPrestNOME: TStringField;
    cdsAgPrestATIVO: TIntegerField;
    cdsAgPrestPROFISSIONAL: TStringField;
    dtsAgPrest: TDataSource;
    dsAgID: TADODataSet;
    cdsAgDiaID_AGENDA: TAutoIncField;
    cdsAgDiaDATAATEND: TWideStringField;
    cdsAgDiaNOME: TStringField;
    cdsAgDiaCARTAO: TStringField;
    cdsAgDiaID_PRESTADOR: TIntegerField;
    cdsAgDiaPRESTADOR: TStringField;
    cdsAgDiaHORAATEND: TStringField;
    cdsAgDiaID_PACIENTE: TAutoIncField;
    dtsAgInfo: TDataSource;
    cdsAgInfoID_AGENDA: TAutoIncField;
    cdsAgInfoPACIENTE: TIntegerField;
    cdsAgInfoPROFISSIONAL: TIntegerField;
    dspAgID: TDataSetProvider;
    cdsAgID: TClientDataSet;
    dtsAgID: TDataSource;
    cdsAgIDID_AGENDA: TAutoIncField;
    cdsAgIDDATAATEND: TWideStringField;
    cdsAgIDHORAATEND: TStringField;
    cdsAgIDPROFISSIONAL: TIntegerField;
    dsAgCliente: TADODataSet;
    dspAgCliente: TDataSetProvider;
    cdsAgCliente: TClientDataSet;
    dtsAgCliente: TDataSource;
    cdsAgClienteNOME: TStringField;
    cdsAgClienteCARTAO: TStringField;
    cdsAgClienteID_PACIENTE: TAutoIncField;
    cdsAgIDPACIENTE: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDmAgenda: TfrmDmAgenda;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
