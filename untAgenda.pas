unit untAgenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Grids, System.DateUtils,
  Vcl.StdCtrls, Data.DB, Vcl.DBGrids, Vcl.Mask, JvExMask, JvToolEdit,
  JvMaskEdit, JvCheckedMaskEdit, JvDatePickerEdit, JvDBDatePickerEdit;

type
  TfrmAgenda = class(TForm)
    sgridAgenda: TStringGrid;
    mcDataAgenda: TMonthCalendar;
    Button1: TButton;
    DBGrid1: TDBGrid;
    procedure mcDataAgendaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure sgridAgendaDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure TitulosStringGrid;
  end;

var
  frmAgenda: TfrmAgenda;

implementation

{$R *.dfm}

uses DmAgenda, untAgendamento;

procedure TfrmAgenda.Button1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmAgendamento, frmAgendamento);
  frmAgendamento.Show;
end;

procedure TfrmAgenda.FormCreate(Sender: TObject);
begin
  TitulosStringGrid;
  frmDmAgenda.cdsAgDia.FetchParams;
  untAgenda.frmAgenda.mcDataAgendaClick(Sender);
end;


//N O M E I A  O S  C A M P O S  D A  S T R I N G G R I D
procedure TfrmAgenda.TitulosStringGrid;
var
  c: Integer;
  cHora: TTime;
  cPro: String;
  nroColunas: Integer;
begin
  cHora := StrToTime('06:00');

  //NOMEAR LINHAS
  for c := 1 to sgridAgenda.RowCount -1 do
  begin
    sgridAgenda.Cells[0, c] := TimeToStr(cHora);

    cHora := IncMinute(cHora, 15);
  end;


  with frmDmAgenda do
  begin
    cdsAgPrest.Close;
    cdsAgPrest.Open;

    nroColunas := cdsAgPrest.RecordCount;
    sgridAgenda.ColCount := nroColunas + 1;
    sgridAgenda.RowHeights[0]:= 30;

    cdsAgPrest.First;

    //NOMEAR COLUNAS
    for c := 1 to sgridAgenda.ColCount -1 do
    begin
      sgridAgenda.ColWidths[c] := 80;
      cPro :=  cdsAgPrest.FieldByName('NOME').AsString;
      sgridAgenda.Cells[c, 0] := cPro;
      cdsAgPrest.Next;
    end;
  end;


end;

//D A T A  C A L E N D A R I O
procedure TfrmAgenda.mcDataAgendaClick(Sender: TObject);
var
  data2 : string;
  hrAgenda : TTime;
  contHora : TTime;
  nome : string;
  hrAuxiliar :string;
  profiss : Integer;
  linHora : Integer;
  colPro : Integer;
  askHour : Integer;
  clear_Row : Integer;
  clear_Col : Integer;
begin

  //L I M P A R  S T R I N G G R I D
  for clear_Col := 1 to sgridAgenda.ColCount -1 do
  begin
    for clear_Row := 1 to sgridAgenda.RowCount -1 do
    begin
      sgridAgenda.Cells[clear_Col, clear_Row] := '';
    end;
  end;

  //P E S Q U I S A R  A G E N D A M E N T O S  P O R  D A T A
  with frmDmAgenda do
  begin
    cdsAgDia.Close;
    //data2 :=
    cdsAgDia.ParamByName('dtcalendario').Value :=
      FormatDateTime('yyyy-MM-dd', mcDataAgenda.Date);

    cdsAgDia.Open;
    cdsAgDia.First;
  end;

  //A G E N D A M E N T O S - E N C O N T R A R  E  D I S T R I B U I R
  with frmDmAgenda do
  begin
      while Not cdsAgDia.Eof do
      begin
          contHora :=    StrToTime('06:00:00');
          hrAgenda :=    StrToTime(cdsAgDia.FieldByName('HORAATEND').AsString);
          profiss  :=    cdsAgDia.FieldByName('ID_PRESTADOR').AsInteger;
          //Em que posição determinado ID DA Query1 está na Query2 ?
          //AgPrest lista os prestadores em ordem alfabética
          cdsAgPrest.Locate('ID_PROFISSIONAL', profiss, []);
          colPro   :=    cdsAgPrest.RecNo;
          nome     :=    cdsAgDiaNOME.AsString;


          for askHour := 1 to 60 do
          begin
            //data2 := StrToTime(FormatDateTime('hh:mm:ss', hrAgenda));
            if contHora = hrAgenda then
            begin
              sgridAgenda.Cells[colPro, askHour] := nome;

              Break;
            end
            else
            begin
              contHora := IncMinute(contHora, 15);
            end;
          end;
          cdsAgDia.Next;
      end;
  end;

end;


// C H A M A  J A N E L A  D E  A G E N D A M E N T O
procedure TfrmAgenda.sgridAgendaDblClick(Sender: TObject);
var
  data : string;
  hora : string;
  prestador : string;
  id : Integer;
begin
  data := FormatDateTime('yyyy-MM-dd', mcDataAgenda.Date);
  hora := FormatDateTime('hh:mm', StrToTime(sgridAgenda.Cells[0, sgridAgenda.Row]));
  prestador := sgridAgenda.Cells[sgridAgenda.Col, 0];

  //cdsAgDia.ParamByName('dtcalendario').Value := FormatDateTime('yyyy-MM-dd', mcDataAgenda.Date);

  with frmDmAgenda do
  begin

    if sgridAgenda.Cells[sgridAgenda.Col, sgridAgenda.Row] = '' then
    begin
      //cdsAgDia.Append;
    end
    else
    begin
      cdsAgDia.Locate('DATAATEND; HORAATEND; PRESTADOR',
        VarArrayOf([data, hora, prestador]), []);
        //cdsAgDia.Edit;    '

      id := cdsAgDia.FieldByName('ID_AGENDA').AsInteger;

      cdsAgID.Close;
      cdsAgID.Open;
      cdsAgID.Locate('ID_AGENDA', id, []);

    end;
  end;
  Application.CreateForm(TfrmAgendamento, frmAgendamento);
  frmAgendamento.Show;
end;

end.

//PESQUISAR
//SALVAR
//IMPEDIR REPETIÇÕES
//DESIGNER
