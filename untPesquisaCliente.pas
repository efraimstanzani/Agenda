unit untPesquisaCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, JvDBUltimGrid, Vcl.StdCtrls;

type
  TfrmPesquisaCliente = class(TForm)
    txtFiltro: TEdit;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    procedure txtFiltroChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisaCliente: TfrmPesquisaCliente;

implementation

{$R *.dfm}

uses DmAgenda, untAgenda, untAgendamento;

procedure TfrmPesquisaCliente.DBGrid1DblClick(Sender: TObject);
begin
  with frmDmAgenda do
  begin
    frmAgendamento.tmePaciente.Text :=
        cdsAgCliente.FieldByName('CARTAO').AsString;
    frmAgendamento.nomePaciente.Text :=
        cdsAgCliente.FieldByName('NOME').AsString;
  end;
  Close;
//lançar em cartao e nome
//fechar
end;

procedure TfrmPesquisaCliente.txtFiltroChange(Sender: TObject);
begin

  frmDmAgenda.cdsAgCliente.Close;
  frmDmAgenda.cdsAgCliente.ParamByName('cliente').AsString := '%'+txtFiltro.Text+'%';;
  frmDmAgenda.cdsAgCliente.Open;
end;

end.
