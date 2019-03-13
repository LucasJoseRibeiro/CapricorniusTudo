unit UCriatorioRelatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls;

type
  TFCriatorioRelatorio = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    ComboBox1: TComboBox;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCriatorioRelatorio: TFCriatorioRelatorio;

implementation

uses Udatamodule, UrelCriatorios, UPrincipal;


{$R *.dfm}

procedure TFCriatorioRelatorio.SpeedButton1Click(Sender: TObject);
begin
  FCriatorioRelatorio.close;
end;

procedure TFCriatorioRelatorio.FormShow(Sender: TObject);
begin
  with FDataModule do
  begin
    Qcodigo.close;
    Qcodigo.sql.text := 'select Crcodigo,Crnome from Criatorio where crcodigo > 0 order by crcodigo asc';
    Qcodigo.open;
    Qcodigo.first;
    while not Qcodigo.Eof do
    begin
      ComboBox1.Items.Add(Qcodigo.Fields[1].asstring);
      Qcodigo.Next;
    end;
    ComboBox1.Items.Add('Todos');
    Qcodigo.close;
  end;
end;

procedure TFCriatorioRelatorio.SpeedButton2Click(Sender: TObject);
begin
  if ComboBox1.ItemIndex = -1 then
  begin
    showmessage('Escolha o criatorio');
    combobox1.SetFocus;
    exit;
  end;

  if ComboBox1.text <> 'Todos' then // criatorio particular
  begin
    screen.Cursor:=CrHourGlass;
    ReportCriatorios:=TReportCriatorios.Create(Application);
    ReportCriatorios.Qcriatorios.close;
    ReportCriatorios.Qcriatorios.sql.text := 'select * from Criatorio where Crcodigo=:c';
    ReportCriatorios.Qcriatorios.Params[0].asinteger:=combobox1.ItemIndex + 1;
    ReportCriatorios.Qcriatorios.open;
    screen.Cursor:=crDefault;
    Fcriatoriorelatorio.Hide;
    Fcriatoriorelatorio.Close;
    ReportCriatorios.preview;
    ReportCriatorios.free;
  end
  else // todos
  begin
    screen.Cursor:=CrHourGlass;
    ReportCriatorios:=TReportCriatorios.Create(Application);
    ReportCriatorios.Qcriatorios.close;
    ReportCriatorios.Qcriatorios.sql.text := 'select * from Criatorio where crcodigo > 0';
    ReportCriatorios.Qcriatorios.open;
    screen.Cursor:=crDefault;
    Fcriatoriorelatorio.Hide;
    Fcriatoriorelatorio.Close;
    ReportCriatorios.preview;
    ReportCriatorios.free;
  end;
end;

end.
