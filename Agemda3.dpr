program Agemda3;

uses
  Vcl.Forms,
  untAgenda in 'untAgenda.pas' {frmAgenda},
  DmAgenda in 'DmAgenda.pas' {frmDmAgenda: TDataModule},
  untAgendamento in 'untAgendamento.pas' {frmAgendamento},
  untPesquisaCliente in 'untPesquisaCliente.pas' {frmPesquisaCliente};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmDmAgenda, frmDmAgenda);
  Application.CreateForm(TfrmAgenda, frmAgenda);
  Application.CreateForm(TfrmPesquisaCliente, frmPesquisaCliente);
  Application.Run;
end.
