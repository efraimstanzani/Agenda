unit untAgendamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvSpin, JvExMask, JvToolEdit,
  JvDBControls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, JvMaskEdit,
  JvCheckedMaskEdit, JvDatePickerEdit, JvDBDatePickerEdit, Vcl.ComCtrls,
  JvExComCtrls, JvDateTimePicker, JvDBDateTimePicker, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmAgendamento = class(TForm)
    btAgSalvar: TButton;
    Button2: TButton;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    dtpAgenda: TDateTimePicker;
    Label1: TLabel;
    lcbPrestador: TDBLookupComboBox;
    btnPesquisar: TButton;
    cbhora: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    tmePaciente: TMaskEdit;
    nomePaciente: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btAgSalvarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAgendamento: TfrmAgendamento;

implementation

{$R *.dfm}

uses DmAgenda, untAgenda, untPesquisaCliente;


procedure TfrmAgendamento.btnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TfrmPesquisaCliente, frmPesquisaCliente);
  frmPesquisaCliente.Show;
end;


procedure TfrmAgendamento.FormCreate(Sender: TObject);
var
  dia, mes, ano : Word;
  setdate: string;
  getdate: string;
begin
  with frmDmAgenda do
  begin

    setdate := cdsAgID.FieldByName('DATAATEND').AsString;
    getdate := copy(setdate, 9, 2)  + '/' + copy(setdate, 6, 2)
                                    + '/' + copy(setdate, 0, 4);
    dtpAgenda.Date := StrToDate(getdate);

    tmePaciente.Text := cdsAgDia.FieldByName('CARTAO').AsString;
    cbhora.Text := cdsAgDia.FieldByName('HORAATEND').AsString;
    nomePaciente.Text := cdsAgDia.FieldByName('NOME').AsString;




    //O Edit já está configurado. CONFIGURAR SALVAR COM IF

  end;
end;


procedure TfrmAgendamento.btAgSalvarClick(Sender: TObject);
var
  fdate : string;
  cliente : integer;
begin
  with frmDmAgenda do
  begin

//    cdsBuscaID.Close;
//    cdsBuscaID.Open;
    cdsAgID.Edit;

  //  cliente :

    cdsAgID.FieldByName('PACIENTE').Value :=
                          cdsAgCliente.FieldByName('ID_PACIENTE').Value;

    cdsAgID.FieldByName('DATAATEND').AsString :=
                          FormatDateTime('yyyy-MM-dd', dtpAgenda.Date);

    cdsAgID.FieldByName('HORAATEND').AsString := cbhora.Text;

    cdsAgID.Post;
    cdsAgID.ApplyUpdates(0);
    cdsAgID.Close;
    cdsAgDia.Close;
  end;


  untAgenda.frmAgenda.mcDataAgendaClick(Sender);

end;


end.






//    DecodeDate(data, ano, mes, dia);
//
//    dtpAgenda.Date := EncodeDate(dia, mes, ano);
//    fdate := copy(fdate, 7, 4) + '-' + copy(fdate, 4, 2) + '-' + copy(fdate, 0, 2);
//var
//  godate : string;
//  getdate : string;
//    getdate :=  cdsAgDia.FieldByName('DATAATEND').AsString;
//    if getdate = '' then
//    begin
//      dtpAgendamento.Date := frmAgenda.mcDataAgenda.Date;
//
//    end
//    else
//    begin
//      godate := copy(getdate, 9, 2) + '/' + copy(getdate, 6, 2) + '/' + copy(getdate, 0, 4);
//      dtpAgendamento.Date := StrToDate(godate);
//    end;
